#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 78.1pt, y: 78.1pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Ordinary two-point correlations of multiplicative functions]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

==== 1 Introduction <sec:introduction>

For $n gt.eq 1$, let $Omega \( n \)$ be the number of prime factors of $n$, counted with multiplicity, and let $lambda \( n \) = \( - 1 \)^(Omega \( n \))$. We study ordinary two-point averages: each integer up to the given cutoff has weight one. Thus the correlation measures whether the two prime-factor counts have the same parity more often than different parities on the full initial interval. The distinction from a logarithmic average is the distinction between

$ 1 / X sum_(n lt.eq X) a \( n \) #h(2em) upright("and") #h(2em) frac(1, log X) sum_(n lt.eq X) frac(a \( n \), n) . $

Logarithmic weighting combines information from many multiplicative scales; an ordinary estimate must control the terminal scale itself. Our quantitative conclusion concerns every fixed pair of nonproportional affine forms.

#thm([Theorem 1.])[
  (A logarithmic saving for affine Liouville correlations).  #emph[There is an absolute constant $c > 0$ such that, for every fixed choice of integers $a_1 \, a_2 gt.eq 1$ and $b_1 \, b_2 gt.eq 0$ with $a_1 b_2 - a_2 b_1 eq.not 0$, there is a constant $C_(a_1 \, a_2 \, b_1 \, b_2)$ for which 
$ lr(|sum_(1 lt.eq n lt.eq X) lambda \( a_1 n + b_1 \) lambda \( a_2 n + b_2 \)|) lt.eq C_(a_1 \, a_2 \, b_1 \, b_2) frac(X, \( log X \)^c) #h(2em) \( X gt.eq 3 \) . $

 The cutoff $X$ may be any real number. No coprimality condition is imposed on the coefficients.]
] <thm:q-affine>

For $a_1 = a_2 = 1$ and $b_1 = 0$, $b_2 = h > 0$, this resolves the ordinary two-point Chowla conjecture, with a logarithmic saving. The exponent is independent of the forms. The implied constants need not be effective, and no uniformity for coefficients growing with $X$ is asserted. The proof first obtains the same saving for $lambda \( n \) lambda \( n + h \)$ in each fixed residue class modulo each fixed positive integer, including nonunit and zero classes. Complete multiplicativity then gives the affine conclusion.

We also prove a qualitative statement for general multiplicative functions. Let $bb(D) = { z in bb(C) : \| z \| lt.eq 1 }$. A function $f : bb(N) arrow.r bb(D)$ is multiplicative when $f \( m n \) = f \( m \) f \( n \)$ for coprime positive integers $m \, n$. For a Dirichlet character $chi$, a real number $t$, and $X gt.eq 2$, define the nonnegative distance $D$ by

#[#set math.equation(numbering: n => "(1)")
 $ D \( f \, chi n^(i t) \; X \)^2 = sum_(p lt.eq X) frac(1 - "Re" \( f \( p \) overline(chi \( p \) p^(i t)) \), p) . $ <eq:distance>]

All sums indexed by $p$ are over primes. We call $f$ #emph[uniformly nonpretentious] if, for every fixed Dirichlet character,

#[#set math.equation(numbering: n => "(2)")
 $ inf_(\| t \| lt.eq N) D \( f \, chi n^(i t) \; N \) arrow.r oo #h(2em) \( N arrow.r oo \) . $ <eq:unp>]

The prime cutoff and the height bound are the same $N$.

#thm([Theorem 2.])[
  (Binary corrected Elliott).  #emph[Let $f_1 \, f_2 : bb(N) arrow.r bb(D)$ be multiplicative, and suppose that at least one satisfies (2). For every fixed pair of distinct nonnegative integers $h_1 \, h_2$, 
$ 1 / N sum_(n = 1)^N f_1 \( n + h_1 \) f_2 \( n + h_2 \) arrow.r 0 #h(2em) \( N arrow.r oo \, med N in bb(N) \) . $

]
] <thm:elliott>

This proves the binary corrected Elliott conjecture for ordinary averages. The functions may be complex, need not have modulus one, and need not be completely multiplicative. There is no conjugation in the displayed product; the conjugated version follows because (2) is preserved by conjugation. We make no quantitative rate claim for this class of functions.

#thm([Corollary 3.])[
  (Affine correlations).  #emph[Let $f_1 \, f_2 : bb(N) arrow.r bb(D)$ be multiplicative, with at least one satisfying (2). For all fixed integers $a_1 \, a_2 gt.eq 1$ and $b_1 \, b_2 gt.eq 0$ with $a_1 b_2 - a_2 b_1 eq.not 0$, 
$ 1 / N sum_(n = 1)^N f_1 \( a_1 n + b_1 \) f_2 \( a_2 n + b_2 \) arrow.r 0 . $

]
] <cor:affine>

Every fixed progression restriction is also permitted in 2; 66 gives the precise statement through all real cutoffs and for every residue class. These conclusions use the hypothesis on an original factor $f_j$. The finite local changes needed for dilations and residue restrictions preserve that hypothesis. In particular, Liouville satisfies the exact condition (2); a quantitative distance bound is proved in 67.

===== 1.1 Historical context and prior work <historical-context-and-prior-work>

Chowla’s conjecture predicts vanishing Liouville correlations at every fixed collection of distinct shifts #cite(label("Chowla65")) #cite(label("MRT15")). Its binary case asks whether the parities of the numbers of prime factors of $n$ and $n + h$ become uncorrelated for each fixed $h gt.eq 1$. Partial summation transfers ordinary cancellation to logarithmic cancellation. An ordinary estimate at every cutoff requires more than this implication.

Elliott extended the correlation problem to bounded multiplicative functions #cite(label("Elliott92")). The obstruction presented by the twists $n^(i t)$ is already central to Halász’s theory of one-point mean values #cite(label("Halasz71")); see also the treatment of Granville, Harper, and Soundararajan #cite(label("GHS19")). The distance in (1) belongs to the pretentious approach developed by Granville and Soundararajan #cite(label("GS07")) Section 3. Matomäki, Radziwiłł, and Tao showed why Elliott’s original condition needs correction for complex functions: a function can imitate different twists at successive scales without imitating any one fixed twist globally. Their corrected condition is equivalent to (2); see #cite(label("MRT15")) Section 1.1 and Appendix B.

Matomäki and Radziwiłł proved that most short means of a real bounded multiplicative function approximate its long mean #cite(label("MR16")) Theorem 1. They also obtained a nontrivial bound for each fixed-shift Liouville correlation: the normalized absolute value is at most $1 - delta \( h \)$, for some $delta \( h \) > 0$, at all sufficiently large cutoffs #cite(label("MR16")) Corollary 2. Matomäki, Radziwiłł, and Tao then established cancellation averaged over arbitrarily slowly growing windows of shifts. Their exponential-sum extension to complex multiplicative functions supplies the short-interval estimates used here #cite(label("MRT15")) Theorems 1.1, 1.3, and 1.7.

Tao proved the logarithmically averaged binary corrected Elliott theorem for nonproportional affine forms #cite(label("Tao16")) Theorem 1.3 and Corollary 1.5. For the logarithmically weighted Liouville sum, Helfgott and Radziwiłł obtained

$ lr(|sum_(n lt.eq x) frac(lambda \( n \) lambda \( n + 1 \), n)|) lt.double frac(log x, sqrt(log log x)) $

by divisibility-graph expansion #cite(label("HR21")) Corollary 1.5. Pilatte improved this bound to $\( log x \)^(1 - c_0)$ for an absolute $c_0 > 0$ #cite(label("Pilatte26")) Theorem 1.1. These estimates retain the logarithmic weight.

The graph method of Helfgott and Radziwiłł uses high traces, recurrence constraints, and cancellation at primes occurring only once #cite(label("HR21")) Sections 2–7. They also proposed composite steps and nonbacktracking operators #cite(label("HR21")) Sections 9.1–9.2. Pilatte develops these directions through products of centered prime factors, prohibited sequences, triangular arithmetic constraints, and a rank-truncated intersection sieve #cite(label("Pilatte26")) Sections 2–13 and Appendix B. Our two graph arguments adapt these constructions to different weights and orders of limits. Their trace estimates, local expansions, and transfers to ordinary averages are proved below.

For ordinary averages, Tao and Teräväinen obtained binary cancellation outside a set of scales of logarithmic density zero, under the same condition (2) on one factor #cite(label("TT19")) Corollary 1.13. Klurman, Mangerel, and Teräväinen relaxed the hypothesis to nonpretentiousness against each fixed $chi \( n \) n^(i t)$, obtaining cancellation along a set of scales of full upper logarithmic density #cite(label("KMT23")) Theorem 1.2. The later quantitative progression estimates of Tao and Teräväinen give logarithmic savings for affine Liouville correlations, with coefficients allowed to grow slowly, outside a quantitatively controlled exceptional set of scales #cite(label("TT26")) Theorem 3.1 and Remarks 3.2. The results here concern every cutoff, with the affine forms fixed.

The quantitative route also uses bounded independence for Boolean circuits. This subject developed from the work of Linial and Nisan #cite(label("LinialNisan90")), through Bazzi’s depth-two theorem and Razborov’s simpler proof #cite(label("Bazzi09")) #cite(label("Razborov08")), to Braverman’s theorem for every fixed depth #cite(label("Braverman10")). In applying that theorem, the encoded residue law is first corrected to exact bounded independence. The local Fourier calculation is a form of the almost-to-exact independence construction of Alon, Goldreich, and Mansour #cite(label("AGM03")) Theorem 2.1 and Section 3.1.

===== 1.2 Main ideas <main-ideas>

Both arguments begin with multiplicative dilations. For a fixed shift $h gt.eq 1$, comparison of the correlations at $n \, n + h$ and at $d n \, d \( n + h \)$ leads to a graph on the integers with edge displacement $h d$. Short-interval Fourier estimates control the change in the correlation when selected divisibility indicators are replaced by signed expressions. Estimates for closed walks then bound the resulting graph operator. The two proofs use different vertex weights, and their cancellation mechanisms must be matched to those weights.

In the quantitative argument, a step contains one prime from each of $J$ disjoint supplies, each with reciprocal mass comparable to a large fixed constant $W$. These primes contribute the factors $upright(bold(1))_(p divides n) - 1 \/ p$, which have mean zero under uniform residues. An additional squarefree padding divisor uses a disjoint set of primes. The centered supplies provide reciprocal mass at least $W^J$, while their contribution to the operator bound is only $\( C sqrt(W) \)^J$, with an absolute $C$. Padding controls the concentration of divisor weight in short multiplicative intervals. Writing $L$ for a small fixed power of $log X$, the edge normalization gives a factor $1 \/ L$ in the estimate for each interval, compensating for the factor $L$ in the number of intervals. The remaining losses are exponential in $J$ with absolute bases. Choosing $W$ large enough therefore gives exponential decay in $J$; since $J$ grows proportionally to $log log X$, this is a power-of-logarithm saving.

Two issues underlie this comparison. First, the prime supplies grow with $X$, so averaging over their full joint period would not give a useful finite-scale estimate. We instead compare the residue tests used in the proof with independent residues, correcting their encoded bit law to exact bounded independence before applying Braverman’s theorem #cite(label("Braverman10")). Second, repeated primes constrain the closed walks. Many independent arithmetic relations give a direct saving. When few remain, a forest encodes the possible patterns of repetition. Its pattern count is uniform over all padding values, allowing the padding weights to be summed afterward in one common residue environment. These steps preserve the absolute constants needed for the choice of $W$.

For general multiplicative functions, the short-interval input contains the nonpretentiousness distance, whose divergence has no prescribed rate. We therefore fix the graph before taking the long average. At an auxiliary scale $B$, squarefree divisors are formed from two bands of primes at most $e^B$. Primes in the higher band receive a fixed weight greater than one, and those in the lower band receive weight one; the weight of a divisor is the product of its prime weights. After dividing the ordinary divisor average by the total reciprocal weight of these divisors, a biased correlation subsequence produces a raw average of size at least a constant times $B^(- 1)$ in one short multiplicative interval. The analytic centering error is $o \( B^(- 1) \)$, and the graph estimate gives $O \( B^(- 1 - c_(*) \/ 2) \)$ for a fixed absolute $c_(*) > 0$. Taking the long limit with $B$ fixed, and then increasing $B$, contradicts the bias.

The higher prime band, called the core band, supplies decay through restrictions on divisor size and on the number of core primes at a vertex. The lower, center band provides the additional power saving needed to beat the $B^(- 1)$ scale. Its signed factor is $upright(bold(1))_(p divides n) - theta \/ p$, with $theta$ chosen to match the vertex normalization; it is not itself mean zero under uniform residues. For suitable primes appearing on only one edge, the normalization factors at the two endpoints in the closed-walk product make the leading divisibility contribution match the subtracted constant term. To retain this cancellation, we organize a walk by the tree of its first visits and expand the vertex-deletion conditions while leaving these center-prime residues unconditioned. Their signed averages are taken before absolute values. This yields the qualitative theorem without a Liouville-specific rate.

===== 1.3 Organization <organization>

Part I proves the quantitative progression estimate and then 1. Section 1.1, Section 1.2 construct its prime supplies and establish the finite residue comparison; 3 bounds centering and deletion errors. 4 introduces the graph moment, and Section 1.5, Section 1.6 prove it through arithmetic constraints and pattern counting. 7 returns to ordinary correlations, while 8 gives the affine deduction.

Part II proves 2 with new parameters and prime sets. Section 2.1, Section 2.2, Section 2.3 state the graph estimate and prove the analytic reduction to it. Section 2.4, Section 2.5 establish the geometry of retained walks; Section 2.6, Section 2.7 control their conditional averages and sum the trace. 8 transfers that estimate to long integer intervals and completes the theorem. Part III uses finite local expansions to prove the progression and affine consequences for general functions, and verifies their Liouville and Möbius specializations.

== 1 A logarithmic saving for Liouville correlations <a-logarithmic-saving-for-liouville-correlations>

==== 1.1 Prime supplies and the quantitative target <q:setup>

Fix integers $h \, l gt.eq 1$ and $b in bb(Z)$. Throughout Part I, constants in estimates may depend on these fixed data unless declared absolute. We will prove the following intermediate statement.

#thm([Proposition 1.1.])[
  (Quantitative correlations in every progression).  #emph[There is one absolute $c > 0$ such that, for every fixed $h \, l gt.eq 1$ and $b in bb(Z)$, 
$ F \( X \) := 1 / X sum_(1 lt.eq n lt.eq X) upright(bold(1))_(n equiv b med \( mod med l \)) lambda \( n \) lambda \( n + h \) lt.double_(h \, l) \( log X \)^(- c) #h(2em) \( X gt.eq 3 \) . $

 The estimate holds for every real $X$, with no condition on $gcd \( b \, l \)$.]
] <q:progression>

There are only $l$ residue classes, so the implied constant can be chosen independently of the representative $b$. It suffices to work above a threshold depending on the fixed data: bounded $X$ can be absorbed into that constant. Our first task is to find many divisors in short multiplicative intervals, retaining a fixed positive fraction of their total reciprocal weight. The construction separates primes used for centering from primes used to supply those divisors.

The proof uses two absolute constants. First choose $A gt.eq 1000$ large enough for the finite-law comparison in 6. Later choose $W gt.eq 10$ after the absolute graph constants have been established. Set

#[#set math.equation(numbering: n => "(1.1)")
 $ L = \( log X \)^(1 \/ A) \, #h(2em) delta = 1 / 200 \, #h(2em) J = ⌊frac(delta log L, 6 W)⌋ \,\
Y_i = L^(1 - delta) e^(6 W i) quad \( 0 lt.eq i lt.eq J \) \, #h(2em) H_0 = e^(L^(1 - delta)) \, #h(2em) eta = e^(- J) \, #h(2em) K = e^(4 J) . $ <q:parameters>]

We may assume $J gt.eq 1$. Since $6 W J lt.eq delta log L$, one has $Y_J lt.eq L$.

===== 1.1.1 Centered primes and padding primes <centered-primes-and-padding-primes>

For $1 lt.eq i lt.eq J$, let

$ P_i = { p : p equiv 1 med \( mod med 5 \) \, quad Y_(i - 1) lt.eq log p < Y_i \, quad p divides.not l h } . $

Let $P = union.big_i P_i$, and let

$ Q = { p : p equiv.not 1 med \( mod med 5 \) \, quad p lt.eq e^L \, quad p divides.not l h } . $

These sets are disjoint, and every prime in $P$ is at least $H_0$. Write

$ V_i = sum_(p in P_i) 1 / p \, #h(2em) V_(*) = product_(i = 1)^J V_i \, #h(2em) cal(D) = {product_(i = 1)^J p_i : p_i in P_i} . $

A label $d in cal(D)$ determines its ordered tuple of primes, because the supplies are disjoint.

The prime number theorem for the fixed modulus $5$ #cite(label("Koukoulopoulos19")) Theorem 12.1, followed by removal of the finitely many primes dividing $l h$, gives

#[#set math.equation(numbering: n => "(1.2)")
 $ sum_(p lt.eq x\
p in cal(R)) log p = alpha_(cal(R)) x + O_(h \, l) #h(-0.16667em) (x e^(- c_1 sqrt(log x))) \, $ <q:pnt>]

where $cal(R)$ is either the primes congruent to $1 med \( mod med 5 \)$ or the primes not congruent to $1 med \( mod med 5 \)$, in either case excluding prime divisors of $l h$, and $alpha_(cal(R)) = 1 \/ 4$ or $3 \/ 4$, respectively. Here $c_1 > 0$ is absolute; the threshold and the implied constant may depend on $h \, l$. In the second selection the possible prime $5$ contributes only a bounded term.

Partial summation on the logarithmic interval $\[ Y_(i - 1) \, Y_i \)$ gives

$ V_i = 1 / 4 log Y_i / Y_(i - 1) + o \( 1 \) = 3 / 2 W + o \( 1 \) \, $

uniformly for $1 lt.eq i lt.eq J$. Indeed all these intervals begin at least at $L^(1 - delta)$, so their accumulated endpoint and integrated error in (1.2) tends to zero uniformly. Consequently, for sufficiently large $X$,

#[#set math.equation(numbering: n => "(1.3)")
 $ W lt.eq V_i lt.eq 2 W \, #h(2em) log d lt.eq sum_(i = 1)^J Y_i lt.eq frac(L, 1 - e^(- 6 W)) < 2 L quad \( d in cal(D) \) . $ <q:prime-masses>]

Let $cal(Q)$ be the squarefree products of primes in $Q$, including $1$, and put

#[#set math.equation(numbering: n => "(1.4)")
 $ u \( q \) = 4^(omega \( q \)) \, #h(2em) S = sum_(q in cal(Q)) frac(u \( q \), q) = product_(p in Q) \( 1 + 4 \/ p \) \, #h(2em) w \( n \) = sum_(q in cal(Q)\
q divides n) u \( q \) = 5^(omega_Q \( n \)) . $ <q:padding-weights>]

Here $omega$ counts distinct prime factors. For any finite prime set $cal(R)$, write $omega_(cal(R)) \( n \) = \# { p in cal(R) : p divides n }$. The factor $q$ will be called the padding factor. All sums over these finite prime sets are finite, however large their cardinalities.

===== 1.1.2 Short multiplicative intervals <short-multiplicative-intervals>

For every integer $j gt.eq 0$ with $j eta lt.eq 100 L$, define

#[#set math.equation(numbering: n => "(1.5)")
 $ cal(S)_j = { \( d \, q \) in cal(D) times cal(Q) : omega \( q \) lt.eq 100 log L \, quad j eta lt.eq log \( d q \) < \( j + 1 \) eta } \, #h(2em) T_j = X e^(j eta) . $ <q:bins>]

There are $O \( L \/ eta \)$ such intervals. Define their total harmonic mass by

$ S_0 = sum_j sum_(\( d \, q \) in cal(S)_j) frac(u \( q \), d q) . $

#thm([Lemma 1.2.])[
  (Mass retained in the intervals).  #emph[For sufficiently large $X$, 
$ 1 / 2 S V_(*) lt.eq S_0 lt.eq S V_(*) . $

]
] <q:bin-mass>

#proof[
  Under the law $u \( q \) \/ \( q S \)$, primes in $Q$ are independently included with probabilities $4 \/ \( p + 4 \)$. Equation (1.2) and partial summation give
  $ bb(E)_q log q lt.eq 4 L \, #h(2em) bb(E)_q omega \( q \) lt.eq 4 log L $
  for large $L$. Markov’s inequality therefore excludes $log q > 98 L$ with probability at most $4 \/ 98$, and excludes $omega \( q \) > 100 log L$ with probability at most $4 \/ 100$. Every remaining $q$, together with every $d in cal(D)$, satisfies $log \( d q \) lt.eq 100 L$ by (1.3), and so lies in one of the intervals (1.5). Their probability exceeds $1 \/ 2$. Summing the independent harmonic weights of $d$, whose total is $V_(*)$, proves the lower bound. Dropping both restrictions proves the upper bound. ◻
]

===== 1.1.3 Centered divisor sums <centered-divisor-sums>

The bins let us compare dilated correlations at essentially the same cutoff. For each bin define

#[#set math.equation(numbering: n => "(1.6)")
 $ C_j =  & 1 / T_j sum_(1 lt.eq n lt.eq T_j) sum_(\( d \, q \) in cal(S)_j) u \( q \) upright(bold(1))_(q divides n) upright(bold(1))_(n equiv b q d med \( mod med l \))\
 & #h(13mm)  dot.op product_(p divides d) (upright(bold(1))_(p divides n) - 1 / p) lambda \( n \) lambda \( n + h q d \) . $ <q:centered-average>]

For a fixed pair $\( d \, q \)$, the term retaining every divisibility indicator in this expansion forces $q d divides n$. The substitution $n = q d m$ turns it into

$ frac(u \( q \), q d) F (frac(T_j, q d)) \, #h(2em) X e^(- eta) < frac(T_j, q d) lt.eq X . $

Here $q d$ is coprime to $l$, and complete multiplicativity cancels $lambda \( q d \)^2 = 1$. Since the summands defining $F$ are bounded by one, $F \( T_j \/ \( q d \) \) = F \( X \) + O \( eta + X^(- 1) \)$. Summing the weights and using $S_0 lt.eq S V_(*)$, the full-divisibility contribution is therefore

#[#set math.equation(numbering: n => "(1.7)")
 $ S_0 F \( X \) + O \( S V_(*) \( eta + X^(- 1) \) \) . $ <q:full-divisibility>]

9 will bound the remaining terms. We will then estimate the centered sums themselves by the graph argument, after removing summands of small total absolute weight.

===== 1.1.4 The independent residue space <the-independent-residue-space>

The factor $upright(bold(1))_(p divides n) - 1 \/ p$ has mean zero for a uniform residue modulo $p$. To use this cancellation simultaneously at many primes, we introduce the auxiliary product law with one independent uniform residue modulo each $p in P union Q$, and one independent uniform residue modulo $l$. The latter is a single coordinate, even if $l$ is not squarefree; for $l = 1$ it is deterministic. The selected primes are all coprime to $l$. Write $bb(E)$ and $bb(P)$ for expectation and probability under this law. A translated site $n + a$ uses these same coordinates shifted by $a$, so divisibility, progression tests, and $w \( n + a \)$ are defined without a common integer $n$.

At each site $bb(E) w = S$. The prime sets grow with $X$, so this model must be compared with finite integer averages before it can be used to estimate deletion costs and graph moments. The next section supplies that comparison for the residue tests and truncated weights used below.

==== 1.2 Comparing finite integer averages with independent residues <q:finite-law-section>

The auxiliary law makes the prime residue coordinates independent, but the prime sets grow with $X$. Averaging over their full joint period would therefore give no useful error at the required scale. We instead compare the particular residue tests used in the proof. The comparison rests on bounded independence for Boolean circuits; we give the reduction from integer residues, including the small correction needed to make all sufficiently small bit marginals exactly uniform.

For a consecutive interval $I$ of integers, write $bb(E)_I$ for the average obtained by choosing the origin uniformly in $I$. The symbol $bb(E)$ continues to denote the independent residue law, and $R_s$ denotes its coordinate modulo $s$. A translated residue test at offset $a$ means $R_s equiv - a med \( mod med s \)$, using the same coordinate $R_s$ at every translate. Different sites do not receive independent new coordinates. A Boolean circuit here uses unbounded-fan-in AND and OR gates and negations. Its depth counts AND and OR levels; for its size we count both gates and input occurrences. An event is represented by a circuit whose input bits are residue equalities.

#thm([Lemma 1.3.])[
  (Finite residue comparison).  #emph[There is an absolute constant $C_1$ with the following property. Choose $A > C_1 + 20$. Let $l gt.eq 1$ be fixed, and let $cal(R)$ be any set of primes at most $e^L$, none dividing $l$. On the coordinates modulo $p in cal(R)$ and modulo $l$, let $mu$ be the product of the uniform laws; the modulus-one coordinate can be omitted. Suppose that an event $cal(E)$ is represented by a circuit of depth at most $20$ and size at most $exp \( L^6 \)$ in these residue equalities. For every consecutive integer interval $I$ with $\| I \| gt.eq exp \( L^A \/ 2 \)$, 
#[#set math.equation(numbering: n => "(1.8)")
 $ \| bb(E)_I upright(bold(1))_(cal(E)) - mu \( cal(E) \) #scale(x: 120%, y: 120%)[\|] lt.eq e^(- L^10) $ <q:finite-law-bound>]

 for sufficiently large $L$ depending on $l$. The bound is uniform in the position of $I$ and in all offsets used by the tests. The modulus $l$ need not be squarefree.]
] <q:finite-law>

#proof[
  We use Braverman’s bounded-independence theorem #cite(label("Braverman10")) Corollary 2: for a fixed depth $d_0$, every $t$-wise uniform distribution on Boolean bits fools circuits of size $m$ to error $epsilon$ when $t gt.eq \( log \( m \/ epsilon \) \)^(C \( d_0 \))$, with a suitable constant depending only on the depth. Being $t$-wise uniform means that every set of at most $t$ bits has exactly the uniform joint distribution. We first encode the residue tests by bits, then correct the small failure of exact independence in the integer average.
  Under the integer-residue law, $R_s$ denotes the residue of the uniformly chosen origin modulo $s$; under $mu$ it is the independent uniform coordinate. In both cases represent $R_s$ by an integer in ${ 0 \, dots.h \, s - 1 }$. Put $B = ceil.l L^15 ceil.r$. Independently at each modulus $s$, adjoin a uniform random variable $U_s in \[ 0 \, 1 \)$, independent also of the origin, and take the first $B$ binary digits of
  $ Z_s = frac(R_s + U_s, s) . $
  Under $mu$, all these bits are independent and unbiased. Decode $R_s$ from its bits whenever their dyadic interval lies inside one interval $\[ r \/ s \, \( r + 1 \) \/ s \)$; on ambiguous intervals make any fixed choice. Conditional on any value of $R_s$, the probability of a decoding error is at most $2 s 2^(- B)$, since only the two boundary cells can cause an error. This bound holds under either origin law. Therefore the probability of any error is at most
  #[#set math.equation(numbering: n => "(1.9)")
   $ 2^(1 - B) (l + sum_(p in cal(R)) p) lt.eq e^(3 L) 2^(- B) $ <q:decoding-error>]
  for large $L$. Correct decoding of one coordinate makes all its translated equality tests correct simultaneously.
  A decoded equality is a Boolean function of $B$ bits. Its truth-table disjunctive normal form has at most $2^B$ conjunctions, each containing at most $B$ literals. Substituting these forms into the original circuit gives depth at most $22$ and size at most $exp \( L^17 \)$ for large $L$.
  Fix any set of at most $t$ encoded bits. It involves at most $t$ residue coordinates, whose moduli are pairwise coprime. Their product $D$ satisfies $D lt.eq l e^(t L)$. If $N = \| I \|$, each residue modulo $D$ occurs either $floor.l N \/ D floor.r$ or $ceil.l N \/ D ceil.r$ times in $I$. Thus its distribution has total variation distance at most $D \/ N$ from uniform. Here total variation is one half of the $ell^1$ distance between probability masses. Adding independent jitters and projecting to the selected bits cannot increase this distance. Their marginal consequently differs from uniform by at most
  #[#set math.equation(numbering: n => "(1.10)")
   $ Delta lt.eq exp \( 2 t L - L^A \/ 2 \) $ <q:crt-bits>]
  for sufficiently large $L$. The only use of $l$ is as one modulus coprime to the selected primes, so repeated prime factors in $l$ cause no change.
  There are at most $n_(upright("bit")) lt.eq e^(2 L)$ bits in all. Let $f$ be the density of their integer-origin law relative to uniform measure on this finite Boolean cube. For a set $S$ of bit indices, let $chi_S$ be the product of the signs $\( - 1 \)^(x_i)$ over $i in S$, and write $hat(f) \( S \) = bb(E)_(upright("unif")) f chi_S$. By (1.10),
  $ \| hat(f) \( S \) \| lt.eq 2 Delta #h(2em) \( 1 lt.eq \| S \| lt.eq t \) . $
  Set $t = ceil.l L^(C_1) ceil.r$. The total absolute value of these coefficients is bounded by
  #[#set math.equation(numbering: n => "(1.11)")
   $ q := sum_(1 lt.eq \| S \| lt.eq t) \| hat(f) \( S \) \| lt.eq 2 Delta \( t + 1 \) n_(upright("bit"))^t lt.eq e^(- L^11) \, $ <q:small-fourier-mass>]
  provided $A > C_1 + 20$ and $L$ is large.
  The estimate (1.11) allows a correction that preserves nonnegativity, even where $f$ vanishes. This is a direct Fourier form of the almost-to-exact independence argument of Alon, Goldreich, and Mansour #cite(label("AGM03")) Theorem 2.1 and Section 3.1. We give the calculation with the error budget needed here. Put $a = e^(- L^11)$ and define
  $ H = sum_(1 lt.eq \| S \| lt.eq t) hat(f) \( S \) chi_S \, #h(2em) g = frac(f - H + a, 1 + a) . $
  Since $\| H \| lt.eq q lt.eq a$, the function $g$ is nonnegative. Its integral is one, and every nonconstant Fourier coefficient of order at most $t$ vanishes. Fourier inversion on each marginal shows that the law with density $g$ is exactly $t$-wise uniform. Moreover,
  #[#set math.equation(numbering: n => "(1.12)")
   $ d_(upright("TV")) \( f \, g \) lt.eq frac(q + a bb(E)_(upright("unif")) \| 1 - f \|, 2 \( 1 + a \)) lt.eq frac(3 a, 2) . $ <q:fourier-correction-tv>]
  Choose the absolute constant $C_1$ large enough for Braverman’s theorem at depth $22$, size $e^(L^17)$, and error $e^(- L^11)$. Then choose $A > C_1 + 20$. Applying Braverman’s theorem to $g$ gives error at most $a = e^(- L^11)$. Under either the integer-residue or product-residue law, the original and encoded tests can disagree only on the decoding event. The total comparison error is therefore at most
  $ 2 e^(3 L) 2^(- B) + d_(upright("TV")) \( f \, g \) + a lt.eq 2 e^(3 L) 2^(- B) + 5 / 2 e^(- L^11) lt.eq e^(- L^10) $
  for sufficiently large $L$. This proves (1.8). All choices are absolute; the threshold may depend on the fixed modulus $l$. ◻
]

#thm([Corollary 1.4.])[
  (Scalar expansions).  #emph[Under the hypotheses of 6, write $bb(E)$ for expectation under $mu$. Suppose $Phi = sum_alpha c_alpha upright(bold(1))_(cal(E)_alpha)$, where every event has the stated circuit bounds and $sum_alpha \| c_alpha \| lt.eq exp \( C L^5 \)$ for a fixed constant $C$. Then, for sufficiently large $L$, 
#[#set math.equation(numbering: n => "(1.13)")
 $ \| bb(E)_I Phi - bb(E) Phi \| lt.eq e^(- L^9) . $ <q:scalar-comparison>]

 This also applies to the sum of errors for a family of such expansions when the same bound holds for their total absolute coefficient sum.]
] <q:finite-expansion>

#proof[
  Apply (1.8) term by term and sum $\| c_alpha \| e^(- L^10)$. This argument preserves the signs of the coefficients until after taking each expectation. ◻
]

===== 1.2.1 Low-degree residue states and truncated weights <low-degree-residue-states-and-truncated-weights>

To apply 7 to weights, we first specify the set of $Q$ primes dividing a site. When this set has bounded size, its possible values give a manageable expansion into residue events.

For an offset $a$, its #emph[active $Q$-set] is

$ Q_a = { p in Q : R_p + a equiv 0 med \( mod med p \) } . $

Write $m_Q = floor.l 400 log L floor.r$. There are at most

#[#set math.equation(numbering: n => "(1.14)")
 $ sum_(u = 0)^(m_Q) binom(\| Q \|, u) lt.eq \( m_Q + 1 \) \( \| Q \| + 1 \)^(m_Q) = exp \( O \( L log L \) \) $ <q:q-state-count>]

possible active sets with $\| Q_a \| lt.eq m_Q$. Specifying one exactly is a conjunction testing every prime in $Q$ as present or absent. On this event $w \( n + a \) = 5^(\| Q_a \|)$, with $n$ denoting the random origin as in the auxiliary model. Every prescribed function or predicate of this active set is then a scalar or a fixed decision. In particular, any sum over squarefree divisors of the product of the active primes can be evaluated at this stage; there is no restriction on how many such divisors are used in defining that scalar.

The event $\| Q_a \| > m_Q$ is also a small circuit: take the disjunction over $\( m_Q + 1 \)$-element subsets of $Q$ of the conjunction asserting that all their primes divide the site. Define $omega_P \( n + a \) = \# { p in P : R_p + a equiv 0 med \( mod med p \) }$. The same construction applies to the condition $omega_P \( n + a \) > 6 W J$, since $6 W J lt.eq delta log L$. These circuits have size $exp \( O \( L log L \) \)$ and depth two.

The restriction $\| Q_a \| lt.eq m_Q$ must precede an arbitrary predicate of the active set. It reduces that predicate to a decision on each of the states counted in (1.14). We will apply this representation to the padding cutoffs and weight denominators when they arise. Its simplest consequence is the following weight bound.

#thm([Corollary 1.5.])[
  (Truncated weight average).  #emph[For every offset $a$ and every interval $I$ allowed in 6, 
#[#set math.equation(numbering: n => "(1.15)")
 $ bb(E)_I #scale(x: 120%, y: 120%)[\[] w \( n + a \) upright(bold(1))_(omega_Q \( n + a \) lt.eq 400 log L) #scale(x: 120%, y: 120%)[\]] lt.eq S + e^(- L^9) lt.eq 2 S $ <q:truncated-weight-average>]

 for sufficiently large $L$. The analogous sum over $M$ fixed offsets is at most $2 M S$.]
] <q:truncated-weight>

#proof[
  Expand by exact active sets of size at most $m_Q$, with scalar coefficient $5^(\| Q_a \|)$. The total coefficient sum is $exp \( O \( L log L \) \)$, so 7 applies. The product-law expectation is at most $bb(E) w = S$, by independence of the prime coordinates. Finally $S gt.eq 1$. The bound is uniform in the offset, and summing it proves the last assertion. ◻
]

The comparison has now supplied the required passage to long integer intervals for bounded residue tests and their explicit scalar expansions. Moments of the unrestricted weight will be used only inside the auxiliary product law; the integer averages use the truncated weight in 8.

==== 1.3 Centering and deleting a small edge mass <q:analytic>

We first compare the progression correlation with a sum whose prime factors have mean zero in the independent residue model. The short Fourier estimate controls the terms introduced by this centering. We then show that restrictions on padding mass and prime degrees, together with any suitably rare residue event, remove only a small total mass. These two estimates prepare the correlation for the graph argument.

===== 1.3.1 Centering the prime divisibility conditions <centering-the-prime-divisibility-conditions>

We first bound the terms other than full divisibility in the expansion of $C_j$ from (1.6). Each such term leaves a nonempty product of primes to be averaged as a shift. Our target is an error that remains small after summing over all $O \( L \/ eta \)$ bins.

#thm([Lemma 1.6.])[
  (Centering estimate).  #emph[With the parameters and prime supplies fixed above, for every sufficiently large real $X$ one has 
#[#set math.equation(numbering: n => "(1.16)")
 $ lr(|sum_j C_j - S_0 F \( X \)|) lt.double_(h \, l) S V_(*) (eta + X^(- 1) + eta^(- 1) 2^J L^(- 1 \/ 20)) . $ <q:center-estimate>]

]
] <q:center>

We prove this estimate after two Fourier bounds. The first concerns rough integers; the second combines it with the short exponential-sum theorem of Matomäki, Radziwiłł, and Tao. The resulting shift average saves more than $L^(- 1)$, which pays for the number of bins. The fourth-moment treatment of the divisor exponential sum follows #cite(label("Pilatte26")) Appendix C; we include the rough-number estimates and their finite counting errors. Write $upright(e) \( t \) = exp \( 2 pi i t \)$.

#thm([Lemma 1.7.])[
  (Fourier bounds for rough integers).  #emph[Let $L$ be sufficiently large, let $h gt.eq 1$ be an integer, and suppose 
$ 1 / 2 exp \( L^0.995 \) lt.eq D lt.eq exp \( 2 L \) . $

 Let $cal(Z) subset \[ D \, 2 D \)$ consist of integers with no prime factor at most $exp \( L^0.99 \)$. For 
$ B \( theta \) = sum_(z in cal(Z)) frac(upright(e) \( h z theta \), z) #h(2em) \( theta in bb(R) \/ bb(Z) \) $

 one has, with absolute implied constants, 
#[#set math.equation(numbering: n => "(1.17)")
 $ parallel B parallel_oo lt.double L^(- 0.99) \, #h(2em) integral_0^1 \| B \( theta \) \|^4 thin d theta lt.double D^(- 1) L^(- 3.96) . $ <q:rough-bounds>]

]
] <q:rough-fourier>

#proof[
  Put $y = exp \( L^0.99 \)$. We need upper bounds for the number of integers in $\[ D \, 2 D \)$ avoiding every prime at most $y$, and for the number of triples in $\[ D \, 2 D \)^3$ for which all four forms
  $ x_1 \, quad x_2 \, quad x_3 \, quad x_1 + x_2 - x_3 $
  avoid those primes. The last form is positive throughout this integer box. In the first case put $m = 1$, and in the second put $m = 4$. For each prime $p$, the proportion $nu_m \( p \)$ of residue vectors where at least one form vanishes satisfies
  #[#set math.equation(numbering: n => "(1.18)")
   $ nu_m \( p \) = m / p + O \( p^(- 2) \) . $ <q:sieve-local-density>]
  For the four forms, every pair of defining hyperplanes is independent over every prime field, including the field with two elements. Inclusion and exclusion of pairs proves (1.18). Moreover $nu_m \( p \) < 1$ for every $p$: the residue $1$ in the first case and the vector $\( 1 \, 1 \, 1 \)$ in the second avoid all the forms.
  For completeness, a finite inclusion–exclusion argument suffices here. Let $r_0 = 2 ceil.l 500 log L ceil.r$ and truncate inclusion–exclusion of the bad-prime events at this even order. This gives an upper bound for the proportion avoiding all the events. For any selected prime set of product $r$, the Chinese remainder theorem gives residue density $product_(p divides r) nu_m \( p \)$. Its normalized count in the interval or box differs from this density by $O \( r \/ D \)$ when $r lt.eq D$. Indeed, each residue coordinate occurs $D \/ r + O \( 1 \)$ times; summing the product of these counts over at most $r$ or $r^3$ residue vectors proves the assertion. There are at most $\( r_0 + 1 \) \( 1 + pi \( y \) \)^(r_0)$ terms, each with $r lt.eq y^(r_0)$. The total boundary error is therefore at most
  #[#set math.equation(numbering: n => "(1.19)")
   $ 1 / D exp #scale(x: 120%, y: 120%)[\(] O \( L^0.99 log L \) #scale(x: 120%, y: 120%)[\)] \, $ <q:sieve-boundary-error>]
  which is smaller than every fixed negative power of $L$, by the lower bound on $D$.
  In the independent residue model the difference between the even truncated sum and the full product is at most the next elementary symmetric sum. Partial summation of the prime number theorem and (1.18) give
  $ sum_(p lt.eq y) nu_m \( p \) lt.eq \( 4 + o \( 1 \) \) log L . $
  Thus that difference is at most
  $ frac(#scale(x: 120%, y: 120%)[\(] sum_(p lt.eq y) nu_m \( p \) #scale(x: 120%, y: 120%)[\)]^(r_0 + 1), \( r_0 + 1 \) !) lt.eq (frac(e sum_(p lt.eq y) nu_m \( p \), r_0 + 1))^(r_0 + 1) lt.double L^(- 100) . $
  The full product satisfies
  $ product_(p lt.eq y) \( 1 - nu_m \( p \) \) lt.double \( log y \)^(- m) = L^(- 0.99 m) \; $
  the finitely many small primes contribute a positive constant, and the remaining factors follow by taking logarithms in (1.18). Together with (1.19), this proves the respective counts $O \( D L^(- 0.99) \)$ and $O \( D^3 L^(- 3.96) \)$.
  The first count bounds $sum_(z in cal(Z)) 1 \/ z$ and hence $parallel B parallel_oo$. Orthogonality expresses the fourth moment as the sum of $\( z_1 z_2 z_3 z_4 \)^(- 1)$ over $z_1 + z_2 = z_3 + z_4$ with all four variables in $cal(Z)$. The factor $h$ does not change this equality. Each triple determines $z_4$, and each weight is at most $D^(- 4)$. The second count proves the fourth moment bound. ◻
]

The analytic input keeps the frequency fixed while averaging the starting point of a short interval.

#thm([Theorem 1.8.])[
  (Matomäki–Radziwiłł–Tao, #cite(label("MRT15")), Theorem 1.3).  #emph[For every pair of real numbers $10 lt.eq H lt.eq Z$, 
$ sup_(alpha in bb(R)) integral_0^Z lr(|sum_(x lt.eq n lt.eq x + H) lambda \( n \) upright(e) \( alpha n \)|) thin d x lt.double H Z (frac(log log H, log H) + \( log Z \)^(- 1 \/ 700)) \, $

 with an absolute implied constant. The supremum is outside the integral.]
] <q:MRT-short>

We next combine this theorem with Lemma 10. The conclusion is uniform over arbitrary subsets of the rough integers, so it permits all the bin and prime-supply restrictions imposed in (1.6).

#thm([Lemma 1.9.])[
  (Correlation averaged over rough shifts).  #emph[Fix integers $h \, l gt.eq 1$ and $b_0 in bb(Z)$. Let $A gt.eq 1000$, let $L$ be sufficiently large, and suppose $Y gt.eq exp \( L^A \/ 2 \)$. Let $D$ be a positive integer and let $cal(Z) subset \[ D \, 2 D \)$ satisfy the assumptions of Lemma 10. Then 
#[#set math.equation(numbering: n => "(1.20)")
 $ lr(|1 / Y sum_(1 lt.eq v lt.eq Y) sum_(z in cal(Z)) 1 / z upright(bold(1))_(v equiv b_0 med \( mod med l \)) lambda \( v \) lambda \( v + h z \)|) lt.double_(h \, l) L^(- 21 \/ 20) . $ <q:rough-correlation>]

]
] <q:rough-shifts>

#proof[
  For each integer $1 lt.eq v lt.eq Y$ define
  $ F_v \( theta \) & = sum_(m = 1)^D lambda \( v + m \) upright(bold(1))_(v + m equiv b_0 med \( mod med l \)) upright(e) \( theta m \) \,\
G_v \( theta \) & = sum_(a = 1)^(\( 2 h + 1 \) D) lambda \( v + a \) upright(e) \( - theta a \) . $
  We first claim that, uniformly in $theta$,
  #[#set math.equation(numbering: n => "(1.21)")
   $ sum_(1 lt.eq v lt.eq Y) \| F_v \( theta \) \| lt.double Y D L^(- 0.8) . $ <q:progression-short-sum>]
  For integer $D$, every $x in \( v \, v + 1 \)$ has precisely $v + 1 \, dots.h \, v + D$ as the integers in $\[ x \, x + D \]$. Apply Theorem 11 with $H = D$ and $Z = floor.l Y floor.r + 1$, discarding the unused initial unit interval. The restriction to the residue class follows from
  $ upright(bold(1))_(n equiv b_0 med \( mod med l \)) = 1 / l sum_(a = 0)^(l - 1) upright(e) (frac(a \( n - b_0 \), l)) . $
  Its coefficients have total absolute value one. After the unimodular factor arising from $n = v + m$ is removed, this applies the same theorem to the frequencies $theta + a \/ l$. In particular, no assumption that $b_0$ is coprime to $l$ is needed. The scale hypotheses imply $10 lt.eq D lt.eq Z$ and
  $ frac(log log D, log D) + \( log Z \)^(- 1 \/ 700) lt.double L^(- 0.8) \, $
  which proves (1.21).
  Average the sum on the left of (1.20), before taking its absolute value, over translations by $m = 1 \, dots.h \, D$. Each translation changes at most $2 m$ prefix terms for each $z$. By Lemma 10, the normalized endpoint error is at most
  $ O (D / Y sum_(z in cal(Z)) 1 / z) = O \( D \/ Y \) . $
  Let $B$ be the polynomial in Lemma 10. Orthogonality now expresses the translated average as
  #[#set math.equation(numbering: n => "(1.22)")
   $ frac(1, Y D) sum_(1 lt.eq v lt.eq Y) integral_0^1 B \( theta \) F_v \( theta \) G_v \( theta \) thin d theta . $ <q:short-convolution>]
  Indeed, expanding the integral imposes $a = m + h z$. Since $1 lt.eq m lt.eq D$ and $D lt.eq z < 2 D$, this value of $a$ lies in the full range used to define $G_v$.
  On the set where $\| B \| lt.eq L^(- 1.05)$, Parseval and Cauchy–Schwarz give
  $ integral_0^1 \| F_v G_v \| lt.eq parallel F_v parallel_2 parallel G_v parallel_2 lt.eq sqrt(D) sqrt(\( 2 h + 1 \) D) lt.double_h D . $
  Its contribution to (1.22) is therefore $O_h \( L^(- 1.05) \)$. The complementary set, denoted by $cal(E)$, satisfies
  $ \| cal(E) \| lt.eq L^4.2 integral_0^1 \| B \|^4 lt.double D^(- 1) L^0.24 . $
  On this set use $parallel B parallel_oo lt.double L^(- 0.99)$, $\| G_v \| lt.eq \( 2 h + 1 \) D$, and (1.21). Its contribution is at most
  $ frac(1, Y D) \| cal(E) \| thin L^(- 0.99) \( 2 h + 1 \) D thin \( Y D L^(- 0.8) \) lt.double_h L^(0.24 - 0.99 - 0.8) = L^(- 1.55) . $
  Finally $D \/ Y lt.eq exp \( 2 L - L^A \/ 2 \)$ is negligible. This proves (1.20). ◻
]

#proof[
  The full-divisibility contribution is (1.7). For every other term in the expansion of (1.6), let $I subset { 1 \, dots.h \, J }$ be the nonempty set of prime supplies whose factors have been replaced by $- 1 \/ p$. Put
  $ z = product_(i in I) p_i \, #h(2em) d' = d \/ z . $
  For fixed $q \, d' \, j$, substitute $n = q d' v$ and put $Y = T_j \/ \( q d' \)$. After extracting the sign $\( - 1 \)^(\| I \|)$ and the factor $u \( q \) \/ \( q d' \)$, the remaining expression is
  #[#set math.equation(numbering: n => "(1.23)")
   $ 1 / Y sum_(1 lt.eq v lt.eq Y) sum_z 1 / z upright(bold(1))_(v equiv b z med \( mod med l \)) lambda \( v \) lambda \( v + h z \) \, $ <q:partial-centering>]
  where $z$ ranges over the products from the supplies indexed by $I$ that also satisfy the bin condition. This substitution is valid in every residue class, since $q d'$ is invertible modulo $l$.
  The allowed $z$ lie in an interval of logarithmic width $eta < log 2$. Split them by residue modulo $l$ and by the at most two dyadic intervals $\[ D \, 2 D \)$ that meet this interval. In each resulting piece the residue $b z med \( mod med l \)$ is constant. Unique prime factorization and the disjointness of the supplies show that each integer $z$ occurs at most once. Since $I$ is nonempty, all its prime factors are at least $H_0 = exp \( L^0.995 \)$, and
  $ D gt.eq H_0 \/ 2 \, #h(2em) D lt.eq exp \( 2 L \) . $
  Furthermore, if the piece is nonempty, its bin condition implies $Y > X e^(- eta) z$, so $log Y gt.eq L^A \/ 2$ for large $L$. Lemma 12 therefore bounds (1.23) by $O_(h \, l) \( L^(- 21 \/ 20) \)$.
  For each fixed $I$ and bin, the sum of the extraction weights is at most
  $ sum_q frac(u \( q \), q) sum_(d') 1 / d' lt.eq S product_(i in.not I) V_i lt.eq S V_(*) \, $
  where the last inequality uses $V_i > 1$. There are $O \( L \/ eta \)$ bins and fewer than $2^J$ nonempty sets $I$. Hence the total contribution of the partial centering terms is
  $ O_(h \, l) #scale(x: 120%, y: 120%)[\(] S V_(*) thin 2^J eta^(- 1) L^(- 1 \/ 20) #scale(x: 120%, y: 120%)[\)] . $
  Together with the full divisibility term this proves (1.16). ◻
]

===== 1.3.2 The distribution of padding divisors <the-distribution-of-padding-divisors>

The centered averages still have occasional sites at which many padding choices contribute to one bin. We next prove that deleting such sites has small total cost. For a site $n$, a label $d in cal(D)$, and one of the bin indices $j$, define

#[#set math.equation(numbering: n => "(1.24)")
 $ rho_j \( n \, d \) = frac(1, w \( n \)) sum_(q in cal(Q) \, med q divides n\
j eta lt.eq log \( q d \) < \( j + 1 \) eta) u \( q \) . $ <q:rho>]

Here the sum includes all squarefree padding divisors in the bin, without the restriction on $omega \( q \)$ imposed in $cal(S)_j$. The denominator is positive because the divisor $1$ is always present. Thus $0 lt.eq rho_j lt.eq 1$ and $sum_j rho_j lt.eq 1$. All these definitions also make sense in the auxiliary residue model. At a translated site $n + a$, divisibility by $p$ means $R_p + a equiv 0 med \( mod med p \)$, using the same residue coordinate at every site.

Define the tilted expectation at a single site by

$ bb(E)^(*) H = frac(bb(E) \( w \( n \) H \), S) . $

This is a probability expectation since

$ bb(E) w \( n \) = product_(r in Q) \( 1 + 4 \/ r \) = S . $

The tilt preserves independence of the $Q$ coordinates and changes the probability of $r divides n$ from $1 \/ r$ to $5 \/ \( r + 4 \)$.

#thm([Lemma 1.10.])[
  (Padding anti-concentration).  #emph[For every $d in cal(D)$ and the bin width $eta = e^(- J)$, 
#[#set math.equation(numbering: n => "(1.25)")
 $ bb(E)^(*) sum_j rho_j \( n \, d \)^2 lt.double_(h \, l) L^(- 1) . $ <q:padding-square>]

 The constant is independent of $d$, $W$, and the location of the bins.]
] <q:padding>

#proof[
  Conditionally on the primes of $Q$ dividing $n$, choose $q_1 \, q_2$ independently with probabilities
  $ bb(P) \( q_a = q divides n \) = frac(u \( q \) upright(bold(1))_(q divides n), w \( n \)) #h(2em) \( a = 1 \, 2 \) . $
  Each available prime is selected with probability $4 \/ 5$. Under the combined tilted law let $Z = log \( q_1 \/ q_2 \)$. A prime $r$ contributes $+ log r$ or $- log r$ with probability $4 \/ \[ 5 \( r + 4 \) \]$ each, and contributes zero otherwise. The contributions are independent, so its characteristic function, with angular frequency $t$, is
  #[#set math.equation(numbering: n => "(1.26)")
   $ phi.alt \( t \) = bb(E)^(*) e^(i t Z) = product_(r in Q) (1 - frac(8, 5 \( r + 4 \)) \( 1 - cos \( t log r \) \)) . $ <q:padding-characteristic>]
  Every factor is nonnegative: even at $r = 2$ it is at least $7 \/ 15$. The inequality $1 - x lt.eq e^(- x)$ therefore gives
  $ 0 lt.eq phi.alt \( t \) lt.eq exp (- 8 / 5 sum_(r in Q) frac(1 - cos \( t log r \), r + 4)) . $
  Replacing $r + 4$ by $r$ changes the exponent by $O \( 1 \)$, uniformly in $t$. For $\| t \| lt.eq 2$, partial summation of the fixed-modulus prime number theorem in (1.2) gives
  #[#set math.equation(numbering: n => "(1.27)")
   $ sum_(r in Q) frac(1 - cos \( t log r \), r) & = 3 / 4 integral_(log 2)^L frac(1 - cos \( t y \), y) thin d y + O_(h \, l) \( 1 \)\
 & = 3 / 4 log \( 1 + L \| t \| \) + O_(h \, l) \( 1 \) . $ <q:padding-pnt>]
  For completeness, in the partial summation the derivative of $\( 1 - cos \( t log x \) \) \/ \( x log x \)$ is $O \( 1 \/ \( x^2 log x \) \)$ uniformly for $\| t \| lt.eq 2$. Its product with the prime-number-theorem error is integrable on $\[ 2 \, oo \)$. Deleting the finitely many prime divisors of $l h$ also costs $O_(h \, l) \( 1 \)$. To verify the second equality, set $u = \| t \| y$. The integral over $u lt.eq 1$ is bounded, and integration by parts bounds $integral_1^U cos u thin d u \/ u$ uniformly in $U gt.eq 1$. The lower endpoint $\| t \| log 2$ stays bounded. These observations also cover $t = 0$. It follows that
  #[#set math.equation(numbering: n => "(1.28)")
   $ 0 lt.eq phi.alt \( t \) lt.double_(h \, l) \( 1 + L \| t \| \)^(- 6 \/ 5) #h(2em) \( \| t \| lt.eq 2 \) . $ <q:padding-decay>]
  Conditionally on $n$, the probability that both divisors lie in the $j$th bin is $rho_j \( n \, d \)^2$. Divisors in the same bin have $\| Z \| lt.eq eta lt.eq 1$. Consequently the left side of (1.25) is at most $bb(P)^(*) \( \| Z \| lt.eq 1 \)$. The function $kappa \( x \) = \( sin x \/ x \)^2$, with $kappa \( 0 \) = 1$, satisfies
  $ upright(bold(1))_(\[ - 1 \, 1 \]) \( x \) lt.eq frac(kappa \( x \), sin^2 1) \, #h(2em) kappa \( x \) = 1 / 4 integral_(- 2)^2 \( 2 - \| t \| \) e^(i t x) thin d t . $
  Taking expectations, using (1.28), and integrating gives
  $ bb(P)^(*) \( \| Z \| lt.eq 1 \) lt.double_(h \, l) integral_(- 2)^2 \( 1 + L \| t \| \)^(- 6 \/ 5) thin d t lt.double_(h \, l) L^(- 1) . $
  The common translation $log d$ of the two padding logarithms disappeared from $Z$, which proves the asserted uniformity. ◻
]

===== 1.3.3 Deleting large degrees and prescribed rare sites <deleting-large-degrees-and-prescribed-rare-sites>

We formulate the deletion step with an explicit input for a family of rare sites. The following section will construct that family from short paths. For each bin $j$, choose a Boolean predicate of the residue coordinates and write $n in cal(B)_j$ when it holds at site $n$. Translation covariance means that $n + a in cal(B)_j$ is obtained from the same predicate by adding $a$ to every residue coordinate. We assume

#[#set math.equation(numbering: n => "(1.29)")
 $ bb(P) \( n in cal(B)_j \) lt.eq exp #scale(x: 120%, y: 120%)[\(] - 1 / 2 L^(1 - delta) #scale(x: 120%, y: 120%)[\)] \, $ <q:rare-input>]

and that the event is represented by an AND–OR–NOT circuit of depth at most $6$ and size at most $exp \( L^3 \)$, whose inputs are equalities in the prime residue coordinates and the coordinate modulo $l$. The event uses no value of the Liouville function. Define $sigma_j \( n \) = upright(bold(1))_(n in.not cal(B)_j)$. For any prime set $R$, write $omega_R \( n \) = \# { p in R : p divides n }$. Define

#[#set math.equation(numbering: n => "(1.30)")
 $ tau_j \( n \, d \) & = upright(bold(1))_(omega_Q \( n \) lt.eq 400 log L) thin upright(bold(1))_(rho_j \( n \, d \) lt.eq K \/ L) thin sigma_j \( n \) \,\
chi_j \( n \, d \) & = tau_j \( n \, d \) thin upright(bold(1))_(omega_P \( n \) lt.eq 6 W J) . $ <q:tau>]

The function $tau_j$ omits the $P$-degree cut: the graph argument will integrate the centered $P$ coordinates before applying that restriction as a projection. At present we impose all four cuts at both ends of each summand, defining

#[#set math.equation(numbering: n => "(1.31)")
 $ C_j^compose =  & 1 / T_j sum_(1 lt.eq n lt.eq T_j) sum_(\( d \, q \) in cal(S)_j) u \( q \) upright(bold(1))_(q divides n) upright(bold(1))_(n equiv b q d med \( mod med l \)) product_(p divides d) (upright(bold(1))_(p divides n) - 1 / p) lambda \( n \) lambda \( n + h q d \)\
 & #h(35mm)  dot.op chi_j \( n \, d \) chi_j \( n + h q d \, d \) . $ <q:cut-averages>]

#thm([Lemma 1.11.])[
  (Deletion cost).  #emph[Suppose the family $cal(B)_j$ satisfies the covariance, probability, and circuit hypotheses just stated. Then 
#[#set math.equation(numbering: n => "(1.32)")
 $ frac(1, S V_(*)) sum_j \| C_j - C_j^compose \| lt.double_(h \, l) 2^J #scale(x: 120%, y: 120%)[\(] K^(- 1) + L^(- 100) + e^(- 2 W J) #scale(x: 120%, y: 120%)[\)] + exp \( - L^0.9 \) . $ <q:cuts-bound>]

 This estimate holds for the integer averages defining $C_j$ and $C_j^compose$, for every sufficiently large real $X$.]
] <q:cuts>

#proof[
  We first bound the deletion costs in the auxiliary product model, after dropping the Liouville factors and the progression indicator, and replacing the absolute centered product by
  $ a_d^(+) \( n \) = product_(p divides d) (upright(bold(1))_(p divides n) + 1 / p) . $
  At the end of the proof we transfer precisely these nonnegative costs to integer averages by Lemma 6. No assertion about untruncated integer moments of $w$ is needed.
  ======= 1.3.3.1 Either endpoint. <either-endpoint.>
  For a fixed numerical pair $\( d \, q \)$, translation by $h q d$ preserves the auxiliary product law. Moreover divisibility by $q$ and by each prime of $d$ is unchanged by this translation. Thus an upper-endpoint failure has the same bound as a lower-endpoint failure. This argument does not assert that the full weight $w$ is constant across an edge. It suffices to analyze one endpoint and multiply the resulting bound by $2$.
  ======= 1.3.3.2 The two padding cuts. <the-two-padding-cuts.>
  The $P$ coordinates are independent of the $Q$ coordinates and $bb(E) a_d^(+) = 2^J \/ d$. Enlarge the eligible padding divisors to all divisors in their respective bins. The total costs of the first two cuts, at one endpoint and summed over bins, are at most
  #[#set math.equation(numbering: n => "(1.33)")
   $ 2^J S sum_(d in cal(D)) 1 / d {bb(P)^(*) \( omega_Q > 400 log L \) + bb(E)^(*) sum_j rho_j \( n \, d \) upright(bold(1))_(rho_j \( n \, d \) > K \/ L)} . $ <q:padding-deletion>]
  Indeed the sum of padding weights in a bin is $w \( n \) rho_j \( n \, d \)$, and $sum_j rho_j lt.eq 1$. Under the tilted law the mean of $omega_Q$ is at most $4 log L$ for large $L$. Independence and exponential Markov therefore give
  $ bb(P)^(*) \( omega_Q > 400 log L \) lt.eq exp #scale(x: 120%, y: 120%)[\(] \( - 400 + 4 \( e - 1 \) \) log L #scale(x: 120%, y: 120%)[\)] lt.double L^(- 100) . $
  Also $x upright(bold(1))_(x > K \/ L) lt.eq \( L \/ K \) x^2$ for $x gt.eq 0$. Applying Lemma 13 bounds the second term in braces by $O_(h \, l) \( K^(- 1) \)$. Since $sum_d 1 \/ d = V_(*)$, this gives the first two terms of (1.32).
  ======= 1.3.3.3 The $P$-degree cut. <the-p-degree-cut.>
  For fixed $d$, tilt the $P$ coordinates by $a_d^(+)$ divided by its mean $2^J \/ d$. Primes outside $d$ retain their independent Bernoulli laws, whereas the selected $J$ primes contribute at most $J$ to the count. As $sum_(p in P) 1 \/ p = sum_i V_i lt.eq 2 W J$, exponential Markov gives
  $ bb(P)_(d \, +) \( omega_P > 6 W J \) lt.eq exp #scale(x: 120%, y: 120%)[\(] - 6 W J + J + 2 \( e - 1 \) W J #scale(x: 120%, y: 120%)[\)] lt.eq e^(- 2 W J) #h(2em) \( W gt.eq 10 \) . $
  The padding coordinates remain independent. Summing their weights $u \( q \) \/ q$ over all eligible pairs and bins is at most $S$ for each $d$. Thus this deletion costs at most $2^J S V_(*) e^(- 2 W J)$ per endpoint.
  ======= 1.3.3.4 The rare sites. <the-rare-sites.>
  For one bin, the entire absolute row weight is bounded by
  $ B \( n \) = w \( n \) product_(i = 1)^J \( omega_(P_i) \( n \) + V_i \) . $
  To see this, sum all padding divisors for each $d$, and then sum each prime slot separately. Independence gives
  $ bb(E) B \( n \)^2 lt.eq product_(r in Q) \( 1 + 24 \/ r \) product_(i = 1)^J \( 4 V_i^2 + V_i \) lt.eq C_(h \, l) L^C \( 18 W^2 \)^J lt.eq C_(h \, l) L^(C') . $
  Here $C \, C'$ are absolute: the first product is polynomial in $L$ by partial summation, and $J log \( 18 W^2 \) lt.eq delta log L thin log \( 18 W^2 \) \/ \( 6 W \)$ is bounded by an absolute multiple of $log L$ for $W gt.eq 10$. Cauchy–Schwarz and (1.29) therefore bound a single-bin rare-site cost by
  $ C_(h \, l) L^(C' \/ 2) exp #scale(x: 120%, y: 120%)[\(] - 1 / 4 L^(1 - delta) #scale(x: 120%, y: 120%)[\)] . $
  There are $O \( L \/ eta \)$ bins, and $S V_(*) gt.eq 1$. Their total contribution is at most $exp \( - L^0.9 \)$ for sufficiently large $L$.
  ======= 1.3.3.5 Transfer to integer averages. <transfer-to-integer-averages.>
  We now justify applying Lemma 6 to the preceding costs. This also ensures that no independence claim is being made for arbitrary integer functions. Use a union bound for the two endpoints, and for the following four failures at either endpoint:
  $ omega_Q > 400 log L \; #h(2em) omega_Q lt.eq 400 log L upright(" and ") rho_j > K \/ L \; #h(2em) n in cal(B)_j \; #h(2em) omega_P > 6 W J . $
  This is the same deletion event, with the padding-mass failure tested only after the low-$Q$ cut passes. In the product model its cost is bounded by the estimates already proved, since dropping the extra low-$Q$ condition can only increase a nonnegative cost.
  Fix a numerical $j \, d \, q$ and expand $a_d^(+)$ as a sum of divisibility indicators. There are $2^J$ terms, with coefficients at most $1$. The factor $upright(bold(1))_(q divides n)$ is a conjunction of its prime divisibilities. Each degree failure is an OR over subsets of primes of the required cardinality, testing that all their residues vanish. Since there are at most $e^L$ available primes, the low-$Q$ degree test has size $exp \( O \( L log L \) \)$. The $P$ threshold has the same bound, using $6 W J lt.eq delta log L$.
  For the padding-mass failure with low $Q$ degree, list all possible exact sets of at most $400 log L$ primes of $Q$ dividing the site. For each set, a conjunction asserts both the indicated presences and all other absences. On that state, both $w$ and $rho_j$ are fixed numbers; retain the state precisely when $rho_j > K \/ L$. There are $exp \( O \( L log L \) \)$ such states, each specified by at most $e^L$ tests. The remaining event $cal(B)_j$ has the circuit representation assumed in the statement. Intersecting any of these events with the indicated prime divisibilities has depth at most $10$ and size at most $exp \( L^4 \)$ for large $L$. Translation to an upper endpoint changes only the tested residues, not these bounds.
  Finally, the numerical pairs satisfy $d q lt.eq exp \( 100 L + eta \)$. The disjoint prime supports of $d$ and $q$ determine both from their product, so there are $exp \( O \( L \) \)$ eligible pairs in all bins. Also $u \( q \) lt.eq 4^(100 log L)$, and the expansion of $a_d^(+)$ has total coefficient mass at most $2^J$. The total absolute coefficients in all these comparisons are therefore at most $exp \( O \( L^4 \) \)$; even the looser bound permits all listed state expansions. The averaging interval has length $floor.l T_j floor.r gt.eq exp \( 1 / 2 L^A \)$. Lemma 6 makes the aggregate comparison error at most $exp \( - L^9 \)$. Replacing the integer-length normalization by $T_j$ costs at most $T_j^(- 1) exp \( O \( L^4 \) \)$, which is smaller still. Together with the product estimates, these errors prove (1.32). ◻
]

==== 1.4 Prohibited paths and centered traces <q:paths-trace>

We now construct the sparse sets used in 14. Their removal will impose enough structure on closed walks to control a matrix moment. Throughout this section the bin index $j$ is fixed, and

$ s = floor.l L^(1 \/ 10) floor.r \, #h(2em) k = floor.l L floor.r . $

All assertions are for sufficiently large $L$, with the fixed integers $h \, l$ and the absolute parameters $A \, W$ held fixed.

The centered graph and high-trace strategy was developed by Helfgott and Radziwiłł #cite(label("HR21")) Sections 2–7. Pilatte developed its composite-label and nonbacktracking form #cite(label("Pilatte26")) Sections 2–9. Here each step carries a prime tuple and a padding divisor; the trace expansion keeps the padding weights and the common residue coordinates explicit.

===== 1.4.1 Positive paths and prohibited words <positive-paths-and-prohibited-words>

A signed step is a displacement $D_i = epsilon_i h q_i d_i$, where $epsilon_i in { - 1 \, 1 }$ and $\( d_i \, q_i \) in cal(S)_j$. A word of $m$ steps, starting at $x$, visits the sites $x + sum_(a < i) D_a$ for $1 lt.eq i lt.eq m + 1$. It is #emph[positive] if $q_i d_i$ divides its departure site for every $i$. This condition also holds at its arrival site, so positivity survives restriction and reversal. These definitions apply in the auxiliary residue model as well: divisibility then means the prescribed equality in the corresponding residue coordinate. A path need not remain inside any finite interval.

The next definition separates an equality pattern from an arithmetic condition on its labels. Within the pattern, a tuple prime may persist for several consecutive steps, but cannot return after disappearing. The additional condition is a divisibility relation on a suffix.

#prodef([Definition 1.12.])[
  A numerical word is #emph[forward prohibited] if it has length $3 lt.eq m lt.eq s$ and satisfies three conditions:
  + Consecutive whole tuples $d_i \, d_(i + 1)$ are unequal.
  + For every prime in $P$, its indices of appearance among $d_1 \, dots.h \, d_m$ form an interval, if nonempty.
  + Some prime $p divides d_1$, absent from $d_m$, satisfies
    #[#set math.equation(numbering: n => "(1.34)")
     $ p divides sum_(i = a)^m D_i #h(2em) upright("for some ") 1 < a < m . $ <q:prohibited-relation>]
  A forward prohibited word is #emph[minimal] if no shorter contiguous subword is forward prohibited in either orientation. A #emph[witness] is a positive path realizing a minimal forward prohibited word. Let $cal(B)_j$ be the set of sites at which a witness starts, and set $sigma_j \( n \) = upright(bold(1))_(n in.not cal(B)_j)$.
] <q:prohibited>

Thus we specialize the event and indicator used in (1.30), Lemma 1.11. Minimality is a condition on the numerical word, whereas positivity is a condition on the residue coordinates at its starting site. Any positive prohibited word contains a witness starting at one of its vertices: repeatedly choose a shorter prohibited subword, reversing when necessary. Length strictly decreases, while positivity is preserved. The structural use of this deletion appears in 26: on surviving positive paths of length at most $s$, with unequal consecutive tuples, every tuple prime has consecutive occurrences and no nonempty subinterval has zero displacement.

We first give two elementary counting facts, including the order of summation needed later. A prime slot is an occurrence of a prime in one of the tuples or paddings. An equality pattern partitions these slots into classes, each class representing one prime variable; tuple classes also record their column $P_i$.

#thm([Lemma 1.13.])[
  (Reciprocal counting and elimination).  #emph[Consider at most $R lt.eq 4 L$ signed steps together with additional records having at most $L^(O \( 1 \))$ choices per prime slot. Then the number of equality patterns and such records is at most $exp \( O \( R log^2 L \) \)$. With one reciprocal for every distinct prime, the sum over their numerical values has the same bound, also after multiplication by $L u \( q_i \)$ for each step.]
  #emph[Suppose, with the padding values fixed, that a recorded relation in the tuple primes is 
$ a z + c equiv 0 med \( mod med p \) \, #h(2em) a equiv.not 0 med \( mod med p \) \, $

 where $a \, c \, p$ are independent of the selected prime variable $z$. Its reciprocal sum costs at most $\( 1 + L \) \/ H_0$ in place of an unrestricted prime sum. Such savings multiply when selected variables are ordered so that each relation uses only its own variable, earlier selected variables, and nonselected variables.]
] <q:crude-count>

#proof[
  There are $O \( R log L \)$ slots, since each tuple has $J = O \( log L \)$ factors and every eligible padding has at most $100 log L$ factors. A partition of $N$ slots has at most $N^N$ descriptions. Signs, factor counts and all recorded indices therefore cost $exp \( O \( R log^2 L \) \)$. Each numerical class has reciprocal mass $O \( log L \)$, by the prime harmonic bounds, and $L u \( q_i \) lt.eq L^(1 + 100 log 4)$. This proves the first assertion. Dropping bin or numerical distinctness restrictions enlarges these positive sums. If distinct abstract classes are assigned the same numerical prime in such an enlargement, they retain their separate reciprocal factors.
  For the second assertion the coefficient is invertible modulo $p$, so $z$ lies in one residue class. Enlarge from primes to integers and compare the reciprocal sum along that progression with its integral:
  $ sum_(H_0 lt.eq n lt.eq e^L\
n equiv c' #h(-0.16667em) #h(-0.16667em) med \( mod med p \)) 1 / n lt.eq 1 / H_0 + L / p lt.eq frac(1 + L, H_0) . $
  Fix the nonselected variables and sum the selected ones in reverse order. Every remaining earlier relation is independent of the variable currently being summed. Its own coefficient test is retained; if this test fails, the admissible inner sum is zero. The displayed bound is uniform in the remaining variables, and backward induction proves multiplication of the savings. After these sums, the other prime variables are bounded by the first assertion. ◻
]

#thm([Lemma 1.14.])[
  (Density and complexity of the deleted event).  #emph[The event in 15 is translation covariant and satisfies 
$ bb(P) \( n in cal(B)_j \) lt.eq exp #scale(x: 120%, y: 120%)[\(] - 1 / 2 L^(1 - delta) #scale(x: 120%, y: 120%)[\)] . $

 As a function of the residue equalities it has a Boolean circuit of depth two and size at most $exp \( L^3 \)$ for sufficiently large $L$.]
] <q:bad>

#proof[
  We may count all forward prohibited positive words, without requiring minimality. For a fixed numerical word, positivity either gives inconsistent residue conditions or fixes one residue at each distinct prime in its steps. Its probability is accordingly zero or the product of their reciprocals.
  At the last transition choose a column whose prime changes. Its last prime $z$ occurs nowhere earlier, by the interval condition. In (1.34), the contribution involving $z$ is exactly the last step. Thus its coefficient is $epsilon_m h q_m d_m \/ z$. The controlling prime $p$ is absent from $d_m$, from $h$ and from every padding, so this coefficient is a unit modulo $p$. It is independent of $z$. Fixing the equality pattern, padding and other tuple values, 16 supplies one saving $\( 1 + L \) \/ H_0$. The remaining count, summed over $3 lt.eq m lt.eq s$, is at most
  $ frac(1 + L, H_0) exp \( O \( s log^2 L \) \) lt.eq exp #scale(x: 120%, y: 120%)[\(] - 1 / 2 L^(1 - delta) #scale(x: 120%, y: 120%)[\)] . $
  This proves the probability bound.
  Each eligible numerical pair satisfies $d q lt.eq exp \( 100 L + 1 \)$. The disjoint prime supports recover $d$ and $q$ uniquely from their product. Thus the number of numerical words of length at most $s$ is $exp \( O \( s L \) \)$. Preselect those satisfying the numerical prohibition and minimality conditions. Positivity of one such word is a conjunction of $O \( s log L \)$ residue equalities, one per prime occurrence. Taking their disjunction gives the stated depth and size bounds. Translation merely shifts the same residue coordinates. This verifies all the hypotheses on the deleted events in 14. ◻
]

===== 1.4.2 The matrices and their closed words <the-matrices-and-their-closed-words>

We use the cutoff $tau_j \( n \, d \)$ of (1.30): it includes the $Q$-degree cutoff, the bound on $rho_j$, and $sigma_j$, but omits the $P$-degree cutoff. Let

$ M = ceil.l e^(103 L) ceil.r \, $

and consider the sites $t + 1 \, dots.h \, t + M$. For each $d in cal(D)$ define a real symmetric matrix $A_d$. For an increasing edge $n' = n + h q d$ within the block, $\( d \, q \) in cal(S)_j$, its entry is

#[#set math.equation(numbering: n => "(1.35)")
 $ A_d \( n \, n' \) = frac(L u \( q \) tau_j \( n \, d \) tau_j \( n' \, d \), sqrt(w \( n \) w \( n' \))) upright(bold(1))_(q divides n) upright(bold(1))_(n equiv b q d #h(-0.16667em) #h(-0.16667em) med \( mod med l \)) product_(p divides d) (upright(bold(1))_(p divides n) - 1 / p) . $ <q:matrix-entry>]

Set $A_d \( n' \, n \) = A_d \( n \, n' \)$, and set all other entries to zero. The increasing edge determines $q$ uniquely. Let $E$ be the orthogonal coordinate projection to sites satisfying $omega_P \( n \) lt.eq 6 W J$. Multiplying a row entry by $sqrt(w \( n' \)) \/ sqrt(w \( n \))$ changes its padding weight to $L u \( q \) \/ w \( n \)$; in each fixed orientation, the sum of these padding weights, with their divisibility and bin conditions, is at most $L rho_j \( n \, d \) lt.eq K$ at a retained site. On positive integer blocks, testing an increasing edge against $sqrt(w) thin lambda$ cancels both square-root weights, and imposing $E$ at both endpoints recovers $L$ times the retained centered edge weight in (1.31). On the direct sum of the $d$-indexed copies of the block space define

$ H_(d \, d') = upright(bold(1))_(d eq.not d') A_(d') . $

This matrix need not be self-adjoint. Its powers record paths with unequal consecutive whole tuples, even if their paddings differ.

#thm([Theorem 1.15.])[
  (The nonbacktracking moment).  #emph[There is an absolute constant $C_2$ such that 
#[#set math.equation(numbering: n => "(1.36)")
 $ bb(E) parallel H^k parallel_(upright("HS"))^2 lt.eq #scale(x: 120%, y: 120%)[\[] K \( C_2 sqrt(W) \)^J #scale(x: 120%, y: 120%)[\]]^(2 k) . $ <q:trace-bound>]

 The norm is the unnormalized Hilbert–Schmidt norm. The same estimate, after increasing $C_2$ absolutely, holds when block origins are averaged over any integer interval of length at least $exp \( 1 / 2 L^A \)$. The threshold for $L$ may depend on the fixed data.]
] <q:trace>

We reduce this statement to positive counts of closed words in the rest of this section. The next two sections dispose of words with many arithmetic restrictions and count the remaining patterns.

An entry of $H^k$ expands over successive copy labels $d_0 \, dots.h \, d_k$ with $d_(i - 1) eq.not d_i$ and the corresponding products of matrix entries. Squaring and summing joins two site paths with common endpoints. Reverse the second using symmetry of $A_d$. The result is a closed word of $2 k$ steps, with unequal consecutive tuples within each half. No such condition is needed across either join. Taking absolute values after each word’s expectation bounds the moment by the resulting sum. The external copy indices and initial site cost at most

#[#set math.equation(numbering: n => "(1.37)")
 $ \| cal(D) \|^2 M lt.eq exp \( 107 L + O \( 1 \) \) . $ <q:external-dimension>]

Indeed $d lt.eq e^(2 L)$. Once the word is recorded, there is no copy-index choice at each step beyond its recorded tuple.

The finite-origin comparison is applied to this signed expansion, before taking absolute values of word expectations. Fix a numerical word, its initial block index, and its external copy indices. All visited sites are then fixed translates of the block origin. At each site only $Q$-divisor sets of size at most $m_Q = floor.l 400 log L floor.r$ survive. By (1.14), enumerating the exact sets at all $2 k$ departures costs at most $exp \( O \( k L log L \) \)$ states. These events specify absence of all other $Q$ primes, so the weight denominators and the $Q$-dependent cutoffs become scalars. Some state conjunctions may be inconsistent; their probability is then zero. No independence between different sites is used.

Expand the at most $2 k J$ centered factors into indicators and scalars, retaining their signs. This gives at most $2^(2 k J)$ terms with coefficient magnitudes at most one. Only prime occurrences in the main word enter this expansion; no complete $P$-divisibility state is listed. Every other scalar factor per step has magnitude at most $L u \( q \)$, since $w gt.eq 1$ and the cutoffs are at most one. As $u \( q \) lt.eq L^(100 log 4)$, the product of these factors is $exp \( O \( k log L \) \)$.

The remaining events are prime divisibility tests, progression tests, the exact $Q$ states, and absence of the prohibited paths from 17. The latter events have depth two before complementation and size at most $exp \( L^3 \)$. Conjoining the tests at all $2 k$ sites adds a single AND level, so their combined depth is at most $20$ and size at most $exp \( L^6 \)$ for large $L$. The $Q$-degree and $rho_j$ cutoffs are already decisions on the exact states. Block restrictions are numerical conditions and add no circuit levels.

Each eligible pair has $d q < e^(100 L + eta) lt.eq e^(101 L)$, and disjointness of $P$ and $Q$ recovers $\( d \, q \)$ from this product. The number of signed numerical words of length at most $2 k$ is therefore at most $\( 2 k + 1 \) \( 2 e^(101 L) \)^(2 k)$. The initial block index and two external copy indices contribute the factor $M \| cal(D) \|^2 = exp \( O \( L \) \)$. Combining these counts, the total absolute coefficient sum in all the indicator expansions is at most

#[#set math.equation(numbering: n => "(1.38)")
 $ exp \( O \( k L log L \) \) = exp \( O \( L^2 log L \) \) lt.eq exp \( O \( L^5 \) \) . $ <q:word-comparison-budget>]

Thus 7 compares the entire signed sum with total error at most $exp \( - L^9 \)$. We may then take the absolute values of its product-law word expectations. It suffices to prove the auxiliary-product estimate; the integer estimate follows with this negligible error. The comparison uses the truncated $Q$ states, without requiring an integer mean for the full weight $w^2$.

===== 1.4.3 Integrating the centered prime coordinates <integrating-the-centered-prime-coordinates>

Fix a numerical closed word and write

$ x + xi_i quad upright("for its departures") \, #h(2em) xi_i = sum_(a < i) D_a quad \( 1 lt.eq i lt.eq 2 k \) . $

Its contribution has the form

#[#set math.equation(numbering: n => "(1.39)")
 $ R thin G product_(i = 1)^(2 k) product_(p divides d_i) (upright(bold(1))_(p divides x + xi_i) - 1 / p) \, #h(2em) G = product_(i = 1)^(2 k) sigma_j \( x + xi_i \) . $ <q:word-product>]

Here $R gt.eq 0$ is independent of all $P$-residue draws. Its weight part is exactly

#[#set math.equation(numbering: n => "(1.40)")
 $ product_(i = 1)^(2 k) frac(L u \( q_i \), w \( x + xi_i \)) upright(bold(1))_(q_i divides x + xi_i) \, $ <q:departure-weights>]

multiplied by the $Q$-degree and $rho_j$ cutoffs at incident endpoints, the orientation-dependent progression tests, and block restrictions. The denominator identity follows from closure, counting every visit with multiplicity. Each centered factor agrees at the two endpoints of its edge. For a reversed edge its progression test is still read at the lower endpoint, and remains in $R$. Although $R$ can depend on the numerical $P$ labels, it does not depend on their residue draws. This is why the $P$-degree projection has not yet been imposed on the matrices.

Call a $P$ prime appearing at exactly one step of the word a #emph[singleton]. Let $cal(U)$ be their set and $S_1 = \| cal(U) \|$. If $G$ were independent of one singleton coordinate, centering in that coordinate would make the word expectation zero. We retain this cancellation while accounting for the dependence introduced by the vertex deletions.

At every occurrence of a nonsingleton expand the centered factor into its indicator and its scalar $- 1 \/ p$. Call these choices #emph[lit] and #emph[unlit], respectively, and let $U$ be the number of unlit occurrences. An unlit choice imposes no nondivisibility condition. For a prime $p$, write $ell_p \, u_p$ for its lit and unlit counts. Lit consistency means that all its lit departure offsets are congruent modulo $p$. Define

$ b_(cal(L)) = product_(p med upright("singleton")) 1 / p product_(p med upright("nonsingleton")) p^(- u_p - upright(bold(1))_(ell_p > 0)) . $

If lit consistency fails, the designated term vanishes; set $Delta G = 0$ in this case. Otherwise, starting from one common draw of the prime residues, overwrite every nonsingleton with a lit occurrence by its forced residue. For each $H subset.eq cal(U)$, also overwrite the singleton coordinates in $H$ by the residues forced at their sole occurrences, leaving the other singleton coordinates at their original values. Call the resulting configuration a #emph[hybrid], and let $G_H$ be the value of $G$ there. The mixed difference, forced minus original in each singleton coordinate, is

$ Delta G = sum_(H subset.eq cal(U)) \( - 1 \)^(S_1 - \| H \|) G_H . $

#thm([Lemma 1.16.])[
  (Exact centering before absolute values).  #emph[The absolute expectation of a designated term of (1.39) is at most 
#[#set math.equation(numbering: n => "(1.41)")
 $ upright(bold(1))_(upright(l i t med c o n s i s t e n c y)) thin b_(cal(L)) bb(E) #scale(x: 120%, y: 120%)[\[] R \| Delta G \| #scale(x: 120%, y: 120%)[\]] . $ <q:mixed-majorant>]

 In particular $\| Delta G \| lt.eq 2^(S_1)$.]
] <q:mixed-difference>

#proof[
  For a uniform residue $Z$ modulo $p$, a fixed residue $a$, and any function $F$ of that coordinate,
  $ bb(E) [(upright(bold(1))_(Z = a) - 1 / p) F \( Z \)] = 1 / p bb(E) #scale(x: 120%, y: 120%)[\[] F \( a \) - F \( Z \) #scale(x: 120%, y: 120%)[\]] . $
  Apply this identity successively to the independent singleton coordinates. At a nonsingleton, incompatible lit tests give zero; otherwise they force one residue and supply $1 \/ p$, while every unlit choice supplies the scalar $- 1 \/ p$. These operations produce exactly the factor $b_(cal(L))$ and the mixed difference, up to the signs of the unlit scalars. The factor $R$ is unchanged in every operation. Taking the absolute value after these integrations proves the bound. The final assertion follows because $G$ takes values in ${ 0 \, 1 }$. ◻
]

The square-root dependence on $W$ in (1.36) comes from repeated prime labels. Among $2 k J$ tuple-prime occurrences there are at most $J k + S_1 \/ 2$ distinct labels, since every nonsingleton occurs at least twice. For a fixed equality pattern, summing one reciprocal per label therefore costs at most $\( 2 W \)^(J k + S_1 \/ 2)$. To use this count, we must still control the number of patterns and sum the padding weights uniformly. We first discard terms where extra unlit reciprocals, independent lit-consistency congruences, or relations forced by many singletons give a stronger saving directly. The forest count and uniform padding sum in 6 will handle the remaining terms.

For negligible classes of words we will discard denominators and cutoffs in $R$, but retain all padding divisibility tests. Independence then gives one reciprocal per distinct $Q$ prime. The factor $b_(cal(L))$ gives at least one reciprocal per distinct $P$ prime. Together with 16, the total cost before any additional saving is $exp \( O \( L log^2 L \) \)$, including (1.37), lit designations and $2^(S_1)$. Padding values may be fixed first during a constrained sum over tuple primes; their original bound $q_i lt.eq e^(100 L + 1)$ is retained when needed for coefficient-size estimates.

#thm([Lemma 1.17.])[
  (Many unlit occurrences).  #emph[The total contribution to the moment majorant from designated terms with $U > L^(1 \/ 50)$ is at most $exp \( - L^(1 + delta) \)$.]
] <q:many-unlit>

#proof[
  If a nonsingleton has a lit occurrence, each of its unlit occurrences supplies an extra reciprocal beyond its basic $1 \/ p$. If all its $m gt.eq 2$ occurrences are unlit, it supplies $p^(- m)$ and hence at least $m \/ 2$ extra reciprocal powers beyond the basic one. Thus at least $U \/ 2$ extra powers remain, all at primes at least $H_0$. The total is at most
  $ exp \( O \( L log^2 L \) \) H_0^(- U \/ 2) lt.eq exp #scale(x: 120%, y: 120%)[\(] O \( L log^2 L \) - 1 / 2 L^1.015 #scale(x: 120%, y: 120%)[\)] lt.eq exp \( - L^(1 + delta) \) . $
  ◻
]

We now turn to the two remaining sources of arithmetic savings: independent congruences and singleton primes.

==== 1.5 Arithmetic savings for exceptional words <q:rank-witness-section>

The centered trace has been reduced to the majorants in 19. We now discard two further classes. Independent lit-consistency equations provide a rank saving, while many singleton coordinates force positive witnesses whose relations can be summed in a triangular order. Each saving makes its entire class negligible before we count the remaining words.

Recurrence congruences constraining prime labels play a central role in #cite(label("HR21")) Sections 6–7. We first prove a random-prime rank estimate suited to the present coefficients. The later witness argument adapts the active-prime and triangular-constraint constructions of #cite(label("Pilatte26")) Lemmas 11.6, 13.1, and 13.6.

===== 1.5.1 Saving from independent congruences <saving-from-independent-congruences>

We first discard the words whose lit-consistency conditions contain many independent pairs of vectors. The point is to use rank over $bb(R)$, without assuming that a matrix remains invertible modulo any of the primes being summed. The following probability estimate isolates the argument.

#thm([Lemma 1.18.])[
  (A rank estimate for random prime divisors).  #emph[Let $cal(P)$ be a finite nonempty set of primes, and let $mu$ be a probability measure on $cal(P)$ with $max_(p in cal(P)) mu \( p \) lt.eq alpha$. Let $r gt.eq 1$, let $B in M_r \( bb(Z) \)$ be nonsingular over $bb(R)$, and let $f : cal(P)^r arrow.r bb(Z)^r$ be any function. Suppose that $M gt.eq 2$ and 
$ lr(|\( B \( y - y' \) \)_i|) lt.eq M quad upright("for all ") y \, y' in cal(P)^r upright(" and ") 1 lt.eq i lt.eq r . $

 If the $2 r$ coordinates of $c \, y in cal(P)^r$ are independent with law $mu$, then 
#[#set math.equation(numbering: n => "(1.42)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] c_i divides \( B y + f \( c \) \)_i upright(" for every ") i #scale(x: 120%, y: 120%)[\)] lt.eq [alpha \( 1 + d_M \)]^(r \/ 2) \, #h(2em) d_M = ⌊frac(log M, log 2)⌋ . $ <q:rank-probability-bound>]

]
] <q:rank-probability>

#proof[
  Let $E \( c \, y \)$ denote the divisibility event in the statement, and let $y'$ be an independent copy of $y$, independent also of $c$. Cauchy–Schwarz, applied to the conditional probability with $c$ fixed, gives
  $ bb(P) \( E \( c \, y \) \)^2 & = (bb(E)_c bb(P)_y \( E \( c \, y \) divides c \))^2\
 & lt.eq bb(E)_c bb(P)_y \( E \( c \, y \) divides c \)^2\
 & = bb(P) \( E \( c \, y \) ∩ E \( c \, y' \) \)\
 & lt.eq bb(P) #scale(x: 120%, y: 120%)[\(] c_i divides \( B \( y - y' \) \)_i upright(" for every ") i #scale(x: 120%, y: 120%)[\)] . $
  The two copies have the same controlling primes $c_i$, so subtraction removes the entire vector $f \( c \)$.
  Write $v = B \( y - y' \)$. For a subset $Z subset.eq { 1 \, dots.h \, r }$ of size $a$, the rows of $B$ indexed by $Z$ have rank $a$. Choose an invertible $a$-column minor in those rows. Conditional on $y'$ and on the coordinates of $y$ outside that minor, the equations $v_i = 0$ for $i in Z$ determine at most one vector of values for its $a$ remaining coordinates. Independence and the atom bound imply
  #[#set math.equation(numbering: n => "(1.43)")
   $ bb(P) \( v_i = 0 upright(" for all ") i in Z \) lt.eq alpha^a . $ <q:rank-zero-rows>]
  This includes $a = 0$, with the empty condition having probability one.
  Now fix $y \, y'$. A nonzero integer of absolute value at most $M$ has at most $d_M$ distinct prime divisors. Each nonzero coordinate $v_i$ therefore satisfies $c_i divides v_i$ with conditional probability at most $d_M alpha$. The controls are independent of each other and of $v$. If the exact zero set of $v$ is $Z$, their joint conditional probability is thus at most $\( d_M alpha \)^(r - \| Z \|)$. Using (1.43) and summing over the possible exact zero sets gives
  $ bb(P) \( c_i divides v_i upright(" for every ") i \) lt.eq sum_(Z subset.eq { 1 \, dots.h \, r }) alpha^(\| Z \|) \( d_M alpha \)^(r - \| Z \|) = [alpha \( 1 + d_M \)]^r . $
  Taking the square root proves (1.42). ◻
]

We apply the lemma to one column of the prime tuples in a word of length $2 k$. Put

$ r = floor.l L^(1 \/ 50) floor.r . $

Fix a column $nu in { 1 \, dots.h \, J }$ and an equality pattern for its prime slots. Let $cal(Z)_nu$ be the set of its abstract labels, let $z_a in cal(Z)_nu$ be the label at step $a$, and write $p_z$ for the numerical prime assigned to $z$. Fix the padding values, orientations, and the primes in every other column. In the real vector space with basis $\( e_z \)_(z in cal(Z)_nu)$ define

#[#set math.equation(numbering: n => "(1.44)")
 $ t_a = D_a / p_(z_a) \, #h(2em) v \( i \) = sum_(a < i) t_a e_(z_a) quad \( 1 lt.eq i lt.eq 2 k \) . $ <q:formal-offsets>]

Each step has exactly one prime from column $nu$. Consequently $t_a$ is an integer independent of every numerical prime in that column. Evaluating $e_z$ at $p_z$ sends $v \( i \)$ to the departure offset $xi_i$.

For two lit occurrences $i \, i'$ of a label $z$, consider the pair

#[#set math.equation(numbering: n => "(1.45)")
 $ \( e_z \, v \( i \) - v \( i' \) \) . $ <q:rank-pair>]

A collection of these pairs is #emph[jointly independent] when all its displayed vectors together are linearly independent over $bb(R)$.

#thm([Lemma 1.19.])[
  (Discarding words with large rank).  #emph[In the sum of the nonnegative majorants from 19, the total contribution of words having a column with $r$ jointly independent pairs (1.45) is 
$ O (exp \( - c_0 L^(203 \/ 200) \)) $

 for some absolute $c_0 > 0$ and sufficiently large $L$. The bound includes the external dimension factors in the trace expansion and is uniform in the bin. The threshold may depend on the fixed parameters $W \, h \, l$.]
] <q:rank>

#proof[
  Use the positive reciprocal majorant and enumeration of 16. Thus we may discard the denominators and cutoffs, retain one reciprocal for every distinct prime label, and include the factors $L u \( q_a \)$ and $2^(S_1)$ in the crude count. We retain the lit-consistency conditions. The total unrestricted count, including external dimension factors, is $exp \( O \( L log^2 L \) \)$.
  Fix a column, its equality pattern, and the other-column and padding data. Choose $r$ jointly independent pairs, and denote their controlling labels by $z_1 \, dots.h \, z_r$ and their difference vectors by $w_1 \, dots.h \, w_r$. The controlling labels are distinct. Modulo $C = "span" \( e_(z_1) \, dots.h \, e_(z_r) \)$, the images of the $w_i$ remain independent: a dependence would express a nontrivial linear combination of the $w_i$ as a combination of the $e_(z_i)$, contrary to joint independence. Therefore the row matrix of the $w_i$, after deleting all controlling columns, has rank $r$. Choose an invertible $r$-column minor $B_0$ of that matrix.
  The entries of the entire row matrix, and hence the choice of a minor by any fixed deterministic rule, are independent of all the numerical primes in column $nu$. Fix the prime variables in that column outside the controlling coordinates and the minor. Write $c_i = p_(z_i)$ for the controls and $y$ for the vector of primes in the minor. The selected lit-consistency conditions become
  #[#set math.equation(numbering: n => "(1.46)")
   $ c_i divides \( B_0 y + A_0 c + d_0 \)_i #h(2em) \( 1 lt.eq i lt.eq r \) \, $ <q:rank-congruences>]
  with fixed integer matrices $B_0 \, A_0$ and a fixed integer vector $d_0$. No invertibility assertion modulo $c_i$ is being made.
  Enlarge the positive sum by dropping numerical distinctness among abstract labels, as well as bin and closure restrictions. Continue to attach one factor $1 \/ p$ to each abstract label: if two coordinates now take the same prime, their product weight is $1 \/ p^2$. The enlarged reciprocal sum is consequently a product sum. Its normalized coordinates have independent law
  $ mu_nu \( p \) = frac(1, V_nu p) quad \( p in P_nu \) \, #h(2em) max_p mu_nu \( p \) lt.eq frac(1, V_nu H_0) lt.eq 1 / H_0 . $
  This independence allows numerical coincidences. In particular, after subtraction in 21, the controls remain independent of $B_0 \( y - y' \)$, even on a sample space that permits such coincidences.
  We check the size hypothesis after these enlargements. The fixed padding values came from eligible steps, so $q_a lt.eq e^(100 L + 1)$. The product of the primes in the other columns is at most $e^(2 L)$ by the geometric spacing of their bands. Hence
  $ \| t_a \| lt.eq h e^(102 L + 1) . $
  Each row of the difference matrix has sum of absolute coefficients at most $2 k h e^(102 L + 1)$. Since every prime in the resampled column is at most $e^L$, we obtain
  $ \| \( B_0 \( y - y' \) \)_i \| lt.eq 2 k h e^(103 L + 1) = e^(O \( L \)) . $
  For fixed $h$ and sufficiently large $L$, the constant in this last exponent is absolute. In 21 we may therefore take $d_M = O \( L \)$, $alpha = \( V_nu H_0 \)^(- 1)$, and $f \( c \) = A_0 c + d_0$. The probability of (1.46) is at most
  $ (frac(O \( L \), V_nu H_0))^(r \/ 2) lt.eq exp \( O \( r log L \) \) H_0^(- r \/ 2) . $
  Multiplying by the unrestricted harmonic masses restores the unnormalized reciprocal sum with this same relative saving. The estimate is uniform in every fixed outside variable, so these variables may now be summed.
  The column, selected pairs and selected minor have at most $J \( 2 k \)^(O \( r \))$ descriptions. Their cost is absorbed in $exp \( O \( r log L \) \)$. Together with the crude enumeration, the total is bounded by
  $ exp (O \( L log^2 L \) + O \( r log L \) - r / 2 log H_0) . $
  Since $log H_0 = L^(199 \/ 200)$ and $r = L^(1 \/ 50) + O \( 1 \)$, its negative term is $\( 1 / 2 + o \( 1 \) \) L^(203 \/ 200)$ and dominates both positive terms. This proves the lemma. ◻
]

We may therefore restrict the remaining trace sum to words for which, in every column, a maximal jointly independent collection of pairs (1.45) has fewer than $r$ members. This quantitative restriction will constrain the equality patterns once the words with many singleton labels have also been discarded.

===== 1.5.2 Singleton primes and positive witnesses <singleton-primes-and-positive-witnesses>

We next dispose of words having many singleton primes. Without the vertex deletion, integration of any singleton centered factor would give zero. The mixed difference in 19 measures the failure of this cancellation caused by deletion. We show that a nonzero mixed difference forces many positive witnesses, and that these witnesses supply successively usable congruences on distinct prime labels.

Put

$ T = floor.l L^(1 \/ 12) floor.r . $

#thm([Lemma 1.20.])[
  (A common configuration of witnesses).  #emph[Fix a numerical main word with singleton set $cal(U)$, where $S_1 = \| cal(U) \| > L^(1 \/ 4)$, and fix a draw of the residue coordinates. If $Delta G eq.not 0$, then some hybrid contains $T$ positive witnesses attached at main departures, each of length at most $s$, with distinct marked primes $y_1 \, dots.h \, y_T in cal(U)$. The prime $y_j$ occurs in witness $j$ and in none of the other $T - 1$ witnesses. The combined length of the main word and these witnesses is at most $4 L$.]
] <q:witness-cover>

#proof[
  For the fixed numerical word, let $cal(W)$ be the finite set of all possible witness tests at its departure sites. Write $I_w$ for the indicator that the preselected numerical word $w$ is positive at its assigned departure. Then
  $ G = product_(w in cal(W)) \( 1 - I_w \) . $
  A repeated test in this product is harmless because its factors take values in ${ 0 \, 1 }$. Expand this finite product algebraically and apply the mixed difference in $cal(U)$. If the union of the prime supports of a subfamily $cal(A) subset.eq cal(W)$ omits a prime $p in cal(U)$, then $product_(w in cal(A)) I_w$ is independent of the $p$ coordinate. Its full mixed difference is therefore zero. Consequently $Delta G eq.not 0$ implies that some subfamily whose supports cover $cal(U)$ has a nonzero mixed difference. Its intersection indicator is then one in at least one hybrid. All witnesses in that subfamily are positive in this single configuration.
  Choose an inclusion-minimal subfamily covering $cal(U)$ there. Each member contains a prime of $cal(U)$ occurring in no other member, since otherwise that member could be removed. A witness has at most $s J$ distinct $P$ labels, so this subfamily has at least $S_1 \/ \( s J \)$ members. For sufficiently large $L$,
  $ frac(S_1, s J) > L^(3 \/ 20) / J > T . $
  Keep any $T$ members and one private prime in each. Their private primes remain private in the selected subfamily. Finally,
  $ 2 k + s T lt.eq 2 L + L^(11 \/ 60) lt.eq 4 L . $
  The algebraic expansion above has been used only to deduce existence. No bound is obtained by summing the absolute values of its terms, and no enumeration of all its subfamilies is charged. ◻
]

The cover gives each selected witness a private singleton prime, but privacy alone does not give a congruence with an invertible coefficient in that prime. We first identify labels having such a coefficient in an internal relation. For a minimal prohibited word with steps $E_1 \, dots.h \, E_m$, call a $P$ label $x$ #emph[active] if there are a $P$ label $c$ of the same word and an interval $I subset.eq { 1 \, dots.h \, m }$ such that

#[#set math.equation(numbering: n => "(1.47)")
 $ c divides sum_(a in I) E_a \, #h(2em) sum_(a in I\
x divides E_a) E_a equiv.not 0 med \( mod med c \) . $ <q:active-definition>]

In particular $x eq.not c$. With every other numerical label fixed, the first sum is linear in $x$ and its coefficient is invertible modulo $c$. These are exactly the conditions needed for a reciprocal-prime saving.

#thm([Lemma 1.21.])[
  (Active labels in a minimal witness).  #emph[Let $E_1 \, dots.h \, E_m$ be a minimal prohibited word. For every $P$ label $y$ in this word, either $y$ is active or there are an active label $z$ and a step $i$ containing $z$ such that 
#[#set math.equation(numbering: n => "(1.48)")
 $ sum_(a < i\
y divides E_a) E_a equiv.not 0 med \( mod med z \) . $ <q:active-prefix>]

 The relations establishing activity have the form (1.47) with contiguous intervals.]
] <q:active>

#proof[
  Consecutive tuples differ, and each label occupies an interval of step indices. Thus some label $z$ enters for the first time on the last step. Let $c$ be the first-step label controlling the prohibited suffix of the word. Since $c$ is absent from the last tuple and divides neither $h$ nor a padding factor, $c divides.not E_m$. The contribution of $z$ to the prohibited suffix is exactly $E_m$, so $z$ is active. The same argument shows that every label used only on the last step is active.
  Now suppose that $y$ occurs before the last step. Restricting attention to steps $1 \, dots.h \, m - 1$, its occurrences form a nonempty interval $\[ a \, b \]$, where $b < m$; $y$ may also occur on step $m$. If $E_a + dots.h.c + E_b$ is nonzero modulo $z$, then (1.48) holds at $i = m$. Otherwise
  #[#set math.equation(numbering: n => "(1.49)")
   $ z divides E_a + dots.h.c + E_b . $ <q:active-zero-prefix>]
  Every step before the last is nonzero modulo $z$, so $b > a$. Reverse the contiguous subword $E_a \, dots.h \, E_m$, negating all its steps. Its first step contains $z$, its last does not, and its suffix consisting of the reversed steps $E_b \, dots.h \, E_a$ has sum divisible by $z$. This suffix starts strictly after the first step because $b < m$, and strictly before the last step because $b > a$. The interval appearances and unequal consecutive tuples persist under reversal. The reversed subword is therefore forward prohibited. Minimality forces $a = 1$.
  Choose a label $z'$ newly entering on step $2$, which is possible because the first two tuples differ. Let $b'$ be the smaller of $b$ and the last index carrying $z'$. Its contribution to (1.49) is $E_2 + dots.h.c + E_(b')$. If that contribution were zero modulo $z$, then $b' > 2$, since $z divides.not E_2$. The reversed subword $E_m \, dots.h \, E_2$ would then be forward prohibited, with controlling prime $z$ and suffix $E_(b') \, dots.h \, E_2$. It is shorter than the original word, contradicting minimality. Hence $z'$ is active through (1.49). Since $y$ occurs on step $1$ and $z'$ does not, its contribution before step $2$ is $E_1 equiv.not 0 med \( mod med z' \)$. This proves (1.48) with $i = 2$ and $z'$ in place of $z$. ◻
]

We now have two ways to obtain a usable congruence. An active label already appears with an invertible coefficient in an internal relation. For a private label that is not active, Lemma 24 supplies a nonzero prefix contribution modulo another active label. If that active label also occurs in another witness, positivity lets us compare the two departures to obtain a congruence. The next proof either selects enough internal relations or arranges enough of these comparisons in an order suitable for elimination.

#thm([Lemma 1.22.])[
  (Elimination of the singleton class).  #emph[For a fixed bin, the total contribution to the absolute majorants in 19 from main words with $S_1 > L^(1 \/ 4)$, including the external factor $\| cal(D) \|^2 M$ in the trace expansion, is at most 
$ exp \( - L^(21 \/ 20) \) $

 for sufficiently large $L$, with the fixed parameters held fixed.]
] <q:singletons>

#proof[
  Whenever the integrand is nonzero, Lemma 23 supplies $T$ witnesses positive in one common hybrid, with marked private singletons. Order them as $w_1 \, dots.h \, w_T$ by their attachment indices $a_1 lt.eq dots.h.c lt.eq a_T$ on the main word; order ties arbitrarily. Write $t \( y \)$ for the unique main step carrying a main singleton $y$. Thus the main position of $y$ has been passed at attachment $a$ exactly when $t \( y \) < a$. We will select at least $floor.l T \/ 8 floor.r$ prime variables and order their relations so that each relation is independent of all later selected variables. In the first two cases we select active labels, which need not be the marked singletons. In the remaining case we select the private marked singletons themselves.
  #emph[Internal relations.] Suppose at least $T \/ 8$ witnesses have an active label absent from every earlier witness. Choose one such label from each of these witnesses, and record an internal relation establishing its activity. The chosen labels are distinct. Each earlier relation involves only labels in its own witness, so it is independent of every later chosen label, including as a controlling modulus. Sum the chosen prime values in reverse witness order. When one is summed, all earlier relations are independent of that variable, while its own relation has an invertible coefficient. This gives at least $floor.l T \/ 8 floor.r$ successive reciprocal-prime savings. If instead at least $T \/ 8$ witnesses have an active label absent from every later witness, apply the same argument with the order reversed.
  #emph[Comparison relations.] Assume neither alternative holds. Apart from fewer than $T \/ 4$ witnesses, every active label occurs in both an earlier and a later witness. In each remaining witness $w_j$, its private marked singleton $y_j$ is not active. By Lemma 24, choose an active label $z_j$ and a departure within $w_j$ whose prefix has nonzero $y_j$-contribution modulo $z_j$.
  First consider those $j$ for which $t \( y_j \) gt.eq a_j$. Choose an earlier witness $w_h$, $h < j$, containing $z_j$, and a departure there using $z_j$. Let $beta_j$ and $beta_h$ be the offsets of these selected departures from the respective starts of $w_j$ and $w_h$. Positivity in the common hybrid gives
  #[#set math.equation(numbering: n => "(1.50)")
   $ z_j divides \( xi_(a_j) + beta_j \) - \( xi_(a_h) + beta_h \) = sum_(a_h lt.eq v < a_j) D_v + beta_j - beta_h . $ <q:earlier-comparison>]
  The main segment omits $y_j$ because $t \( y_j \) gt.eq a_j$, and $w_h$ omits it by privacy. Its only contribution is therefore through $beta_j$, where it has the nonzero prefix contribution given by Lemma 24.
  For two selected witnesses $w_j \, w_i$ with $j < i$, the private label $y_i$ occurs in neither witness prefix in (1.50). It is also absent from its main segment, since
  $ t \( y_i \) gt.eq a_i gt.eq a_j . $
  Thus the comparison belonging to $w_j$ is independent of every later selected variable $y_i$. This includes its controlling prime: $z_j$ occurs in both $w_j$ and $w_h$, whereas each selected $y_i$ is private. Eliminating the selected labels in decreasing attachment order is therefore valid. Equal attachment indices cause no difficulty, as the main segment still ends strictly before that index.
  For the witnesses with $t \( y_j \) < a_j$, choose instead a later witness containing $z_j$. The comparison uses the main segment starting at $a_j$ and ending just before that later attachment, so it omits $y_j$. Order this group by decreasing attachment index. A selected label from a smaller attachment has its unique main position still smaller than that attachment, and hence lies before the start of every earlier comparison segment in this order. Privacy removes it from the two witness prefixes as well. The same reverse-elimination argument applies. One of these two groups has at least $T \/ 8$ witnesses for sufficiently large $T$: there are more than $3 T \/ 4$ candidates before dividing them according to whether their main position has passed.
  #emph[Summing the relations.] In all cases, record the chosen relations, their order, their controlling labels, and the nonvanishing coefficient tests. Fix the equality pattern, the numerical padding factors, and all nonselected numerical labels. Every selected congruence is linear in its selected prime $x$; its coefficient is a unit modulo its controlling prime $p$. The latter is unselected or belongs to an earlier relation in the chosen order. The reciprocal sum is bounded by
  $ sum_(H_0 lt.eq x lt.eq e^L\
x equiv c med \( mod med p \)) 1 / x lt.eq 1 / H_0 + L / p lt.eq frac(1 + L, H_0) \, $
  where enlarging from primes to integers only increases the sum. Retain the nonvanishing coefficient condition during each elimination; if it fails for the remaining fixed data, that inner sum is zero. After summing a selected variable, drop its already used relation. The explicit dependencies above ensure that all still retained relations are independent of the variable just eliminated.
  It remains to justify the residue cost and the number of records. Bound $\| Delta G \|$ by $2^(S_1)$, drop denominators and cutoffs from $R$, and retain its padding divisibilities. The factor $b_(cal(L))$ already supplies one reciprocal for every main $P$ label. Each new witness $P$ label and each distinct main or witness $Q$ label has a positivity test in its original residue coordinate, which no hybrid changes. Their joint average supplies one reciprocal per distinct such label. Constraints on overwritten main coordinates may be dropped. In particular no choice of hybrid needs to be counted: these retained residue tests are unchanged throughout the hybrids, and the recorded numerical relations are necessary consequences of positivity in the common one.
  The total recorded length is at most $4 L$. Lemma 16 therefore bounds the equality patterns, numerical reciprocal sums before the selected savings, signs, and weights by $exp \( O \( L log^2 L \) \)$. Attachments, marked labels, internal interval endpoints, partner-witness indices, and elimination orders have only polynomially many options per recorded slot, so their inclusion preserves this bound. The factors $2^(S_1)$ and $\| cal(D) \|^2 M = exp \( O \( L \) \)$ do so as well. We have proved the bound
  $ exp \( O \( L log^2 L \) \) (frac(1 + L, H_0))^(floor.l T \/ 8 floor.r) . $
  Finally, $T log H_0 asymp L^(1 \/ 12 + 199 \/ 200) = L^(647 \/ 600)$. This dominates both $L log^2 L$ and $L^(21 \/ 20)$, proving the assertion. ◻
]

==== 1.6 Counting the remaining words <q:forest-section>

We complete the trace estimate by counting the words left after Lemma 1.17, Lemma 1.19, Lemma 1.22. The arithmetic estimates have removed words with many unlit occurrences, large constraint rank, or many singletons. The remaining equality patterns admit a short description by a forest. Its size bound will hold simultaneously for all padding coefficients; this uniformity allows us to sum the padding weights only after counting the patterns.

===== 1.6.1 Positive blocks and their geometry <positive-blocks-and-their-geometry>

Retain the notation for a closed word of length $2 k$ from the trace expansion: its displacements are $D_i = epsilon_i h q_i d_i$, its departure offsets are $xi_i$, and the two halves have unequal consecutive tuples $d_i$. Recall that $S_1$ counts singleton column labels and $U$ counts unlit occurrences of nonsingleton labels. A position is #emph[perfect] if every column occurrence at that position is a lit nonsingleton. All other positions are #emph[imperfect]; their number $I$ satisfies

#[#set math.equation(numbering: n => "(1.51)")
 $ I lt.eq S_1 + U . $ <q:imperfect-count>]

Fix a word and designation satisfying lit consistency, and a residue configuration for which the integrand $R \| Delta G \|$ in 19 is nonzero. Since $Delta G eq.not 0$, at least one term of its defining alternating sum has $G = 1$; fix such a hybrid. All lit nonsingleton coordinates have their forced values in every hybrid. Also, $R > 0$ supplies every padding divisibility. Thus every perfect step is positive in this hybrid, and every main vertex satisfies $sigma_j = 1$.

Within each half, split every maximal interval of consecutive perfect positions into blocks of $s = floor.l L^(1 \/ 10) floor.r$ positions, followed by one shorter block if necessary. Their number $B$ satisfies

#[#set math.equation(numbering: n => "(1.52)")
 $ B lt.double 1 + k \/ s + S_1 + U \, $ <q:block-count>]

with an absolute constant. Each block is a positive path whose vertices all survive the prohibited-word deletion.

#thm([Lemma 1.23.])[
  (Geometry of perfect blocks).  #emph[In each such block, the occurrences of every column prime form an interval of consecutive positions. No nonempty subinterval of the block has total displacement zero.]
] <q:block-intervals>

#proof[
  If the interval assertion fails, choose across all columns two consecutive occurrence groups having the shortest gap. Let $i$ be the last position in the first group and $i'$ the first in the next, and let $p$ be their common prime. The prime $p$ is absent from $i + 1 \, dots.h \, i' - 1$. Every label in the substring $i \, dots.h \, i' - 1$ has interval-shaped uses, since otherwise it would give a shorter gap. Positivity at the departures of steps $i$ and $i'$ gives
  $ p divides sum_(a = i)^(i' - 1) D_a \, #h(2em) upright("hence") #h(2em) p divides sum_(a = i + 1)^(i' - 1) D_a . $
  The length $i' - i$ cannot be two: the latter sum would be one displacement whose tuple and padding both omit $p$, while $p divides.not h$. The substring therefore has length at least three. It is a forward prohibited word, with its suffix starting at its second step. Pass to a minimal prohibited contiguous subword, allowing reversal. Positivity survives these operations, and its starting vertex is one of the main vertices. This contradicts $sigma_j = 1$ there.
  For the second assertion a single displacement is nonzero. In any subinterval of length at least two, the first and last tuples differ. Indeed, if they agreed in every column, the interval assertion would make every tuple in that subinterval equal, contrary to the nonbacktracking condition. Choose a first-step prime $p$ absent from the last tuple. If the total displacement were zero, deleting the first step would leave a suffix sum divisible by $p$. In a two-step subinterval this is impossible, because $p$ does not divide the last displacement. In length at least three it makes the subinterval forward prohibited. Minimal descent gives the same contradiction. A reversed subword may begin at the end of the block; this endpoint is also a main vertex. At the end of the closed word it is its initial vertex, so the survival condition still applies. ◻
]

===== 1.6.2 A forest code independent of the coefficients <a-forest-code-independent-of-the-coefficients>

An equality pattern in a column is the partition of its $2 k$ positions according to equality of their prime labels; the numerical prime values are not part of the pattern. In this subsection we count the union of these patterns over all numerical label values, padding choices, signs, and surviving hybrids that satisfy the indicated rank and occurrence bounds.

#thm([Lemma 1.24.])[
  (Forest coding).  #emph[Suppose that 
$ S_1 lt.eq L^(1 \/ 4) \, #h(2em) U lt.eq L^(1 \/ 50) \, #h(2em) r = floor.l L^(1 \/ 50) floor.r \, $

 and that, in every column, there are no $r$ pairs (1.45) whose $2 r$ vectors are jointly independent. Consider lit-consistent terms of 19 with a nonzero integrand. The equality patterns that can occur in any one column belong to a set of cardinality at most $exp \( C k \)$, for an absolute constant $C$. This set can be chosen independently of all numerical coefficients and padding choices. Consequently there are at most $exp \( C J k \)$ combined column patterns.]
] <q:forest-code>

#proof[
  Fix one realization and one column. Let $cal(Z)$ be its set of distinct labels and let $cal(V)$ be the real vector space with basis $\( e_z \)_(z in cal(Z))$. If the label at position $a$ is $z_a$, define its formal departure offsets by
  $ v \( i \) = sum_(a < i) t_a e_(z_a) \, #h(2em) t_a = D_a \/ p_(z_a) . $
  The coefficients $t_a$ do not use the prime values in this column. Choose an inclusion-maximal collection of pairs $\( e_z \, v \( i \) - v \( i' \) \)$, where $i \, i'$ are lit occurrences of $z$, whose combined vectors are independent. If there are $m$ pairs, their span $D_0$ has dimension $2 m < 2 r$.
  Choose a basis of $cal(V) \/ D_0$ from the images of the coordinate vectors. Call the corresponding labels #emph[regular] and the other labels #emph[omitted]. There are exactly $2 m < 2 r$ omitted labels. Write $macron(v)$ and $macron(e)_z$ for images in the quotient. For a regular label $z$, all lit starts lie on one affine line parallel to $macron(e)_z$. Otherwise some difference $v \( i \) - v \( i' \)$ would be outside $D_0 + bb(R) e_z$; since $e_z in.not D_0$, adjoining that pair would contradict maximality. The regular directions are nonzero and jointly independent. For each regular label $z$ with a lit occurrence, let
  $ ell_z = macron(v) \( i \) + bb(R) macron(e)_z \, #h(2em) i upright(" any lit occurrence of ") z . $
  The preceding argument makes this line independent of the choice of $i$. The lines so defined are distinct, since their directions are independent.
  Compress each constant run in each perfect block to one run-entry. By 26, a given label occurs in at most one run per block. A regular run of label $z$ has quotient increment
  #[#set math.equation(numbering: n => "(1.53)")
   $ (sum_(a upright(" in the run")) D_a \/ p_z) macron(e)_z eq.not 0 . $ <q:run-increment>]
  The inequality uses the nonzero-subinterval assertion of 26. Cut the runs at omitted entries and at block boundaries. This leaves at most $\( 2 r + 1 \) B$ nonempty regular segments and at most $2 r B$ omitted run-entries. The parameter bounds and (1.52) give
  #[#set math.equation(numbering: n => "(1.54)")
   $ \( 2 r + 1 \) B lt.double L^0.92 . $ <q:segment-count>]
  Each regular run of label $z$ starts and ends on $ell_z$, and (1.53) says that its endpoints are distinct. A transition from a $z$-run to a $z'$-run is therefore a common point of $ell_z$ and $ell_(z')$. We encode these incidences by a simple bipartite graph: one vertex represents each line used by the regular segments, and one vertex represents each distinct projected transition point. Join a transition point to the two lines of its transition, identifying vertices whenever the same line or point recurs. Include an isolated line vertex if it occurs only in one-run segments. There are at most $2 k$ line vertices and at most $2 k$ point vertices.
  This graph is a forest. A simple cycle would pass through distinct line vertices, and thus through distinct independent directions. On each of its lines the two adjacent point vertices are distinct. The displacements around the cycle would consequently give a linear relation among the regular directions with every coefficient nonzero, a contradiction.
  A regular segment gives a walk in this forest. It has no immediate reversal: a walk line–point–same line would repeat an adjacent run label, and a walk point–line–same point would contradict (1.53). A walk without immediate reversal in a forest is the unique simple path between its endpoints. Therefore the ordered pair of line endpoints recovers all run labels of the segment. Equal endpoints encode a one-run segment.
  Figure 1 illustrates this decoding. The graph records only incidences; the numerical positions of the points will not enter the code.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 1cm, height: 0.7cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[$ell_(z_1)$]])])
  circle((1.5, 0), radius: 0.0898, fill: black, stroke: none)
  content((1.5, -0.03528), [$x_12$], anchor: "north")
  content((3, 0), [#box(width: 1cm, height: 0.7cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[$ell_(z_2)$]])])
  circle((4.5, 0), radius: 0.0898, fill: black, stroke: none)
  content((4.5, -0.03528), [$x_23$], anchor: "north")
  content((6, 0), [#box(width: 1cm, height: 0.7cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[$ell_(z_3)$]])])
  content((1.5, 1.25), [#box(width: 1cm, height: 0.7cm, inset: 0.3333em, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[$ell_u$]])])
  line((0.5, 0), (1.5, 0), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((1.5, 0), (2.5, 0), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((3.5, 0), (4.5, 0), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((4.5, 0), (5.5, 0), stroke: (thickness: 1.2pt, miter-limit: 10))
  line((1.5, 0), (1.5, 0.9), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.15, 1.25), [#text(size: 9pt)[a line used by another segment]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 1: A schematic incidence forest. Boxes are line vertices and dots are projected transition points. The bold path is determined by its two endpoint line vertices and recovers the run-label sequence $z_1 \, z_2 \, z_3$. Edges represent incidence in the quotient space. ],
  ) <fig:q-forest-incidence>
  We describe explicitly a code for the whole column pattern.
  + Record imperfect positions, block boundaries, run boundaries, and the omitted or regular status of each run. These are binary data on $O \( k \)$ positions and have $exp \( O \( k \) \)$ possibilities.
  + Record the equality partition among the omitted run-entries. Its cost is at most $\( 2 k \)^(O \( r B \))$.
  + Give the abstract forest, rooted and ordered in any manner, with its line or point vertex types. The parenthesis traversal of a rooted ordered forest with at most $4 k$ vertices, together with the type bits, has $exp \( O \( k \) \)$ possibilities. The traversal numbers its vertices.
  + Give the ordered pair of line-vertex numbers for every regular segment. By the unique-path property this recovers its run sequence. The cost is at most $\( 4 k \)^(O \( \( 2 r + 1 \) B \))$.
  + At every imperfect position, give a representative occurrence of its label. A label already represented in a perfect position points to such a position; otherwise use its first imperfect occurrence. This costs at most $\( 2 k \)^I$.
  These data determine a unique equality partition. Omitted labels cannot equal regular labels. Their recorded partition determines all omitted equalities, while the forest vertices determine all regular equalities. The last step supplies every remaining equality. Neither coordinates of transition points nor numerical coefficients are needed in this decoding.
  All constants in these code counts are absolute. Their logarithms sum to at most
  $ C_0 k + C_0 L^0.92 log \( 4 k \) + C_0 \( S_1 + U \) log \( 2 k \) lt.eq C k $
  for an absolute $C$ and sufficiently large absolute $L$. Here $k = floor.l L floor.r$ and both exponents $0.92$ and $1 \/ 4$ are strictly less than one.
  The code universe just described depends only on the length and the displayed numerical bounds. Every realizable pattern, whatever the coefficients, has a code in that same universe. For example, choose the first valid code in a fixed ordering; the decoder shows that two different patterns cannot receive the same code. Thus the bound counts the union over all coefficients, not just the patterns at one fixed coefficient choice. Applying this universal bound in each of the $J$ columns proves the last assertion. ◻
]

===== 1.6.3 Summing padding in a fixed residue environment <summing-padding-in-a-fixed-residue-environment>

The forest code has removed the dependence of the pattern count on padding. We can now sum all padding choices, keeping the departure cut that bounds their mass at each site. This summation uses one shared residue environment; no independence between translated sites is asserted.

#thm([Lemma 1.25.])[
  (Padding sum).  #emph[Fix an integer $m gt.eq 1$, a bin $j$, tuples $d_1 \, dots.h \, d_m in cal(D)$, signs $epsilon_1 \, dots.h \, epsilon_m in { - 1 \, 1 }$, an initial site, and the entire non-$P$ residue environment. With successive sites defined by $n_(i + 1) = n_i + epsilon_i h q_i d_i$, one has 
#[#set math.equation(numbering: n => "(1.55)")
 $ sum_(q_1 \, dots.h \, q_m in cal(Q)) product_(i = 1)^m frac(L u \( q_i \), w \( n_i \)) upright(bold(1))_(q_i divides n_i) upright(bold(1))_(\( d_i \, q_i \) in cal(S)_j) upright(bold(1))_(rho_j \( n_i \, d_i \) lt.eq K \/ L) lt.eq K^m . $ <q:padding-product>]

 The bound is uniform over the fixed data and initial site.]
] <q:padding-sum>

#proof[
  Let $c_i \( n \, q \)$ denote the $i$th factor in the product. The definition of $rho_j$ allows all squarefree padding products in the bin; the extra bound on $omega \( q \)$ in $cal(S)_j$ only reduces their sum. Consequently, at every site $n$,
  $ sum_q c_i \( n \, q \) lt.eq L rho_j \( n \, d_i \) upright(bold(1))_(rho_j \( n \, d_i \) lt.eq K \/ L) lt.eq K . $
  Set $F_(m + 1) \( n \) = 1$ and recursively define
  $ F_i \( n \) = sum_q c_i \( n \, q \) F_(i + 1) \( n + epsilon_i h q d_i \) . $
  Backward induction, using a bound uniform in the starting site at each stage, gives $F_i \( n \) lt.eq K^(m - i + 1)$. In particular $F_1 \( n_1 \) lt.eq K^m$. The shifts caused by earlier padding choices therefore introduce no additional factor. ◻
]

===== 1.6.4 Completion of the trace estimate <q:trace-completion>

#proof[
  First work in the product residue law. The contributions with $U > L^(1 \/ 50)$, with a high-rank column, or with $S_1 > L^(1 \/ 4)$ are $o \( 1 \)$ in total by Lemma 1.17, Lemma 1.19, Lemma 1.22, including the external dimension factors of the trace expansion. We sum the remaining contributions using 19.
  By 27, the combined column patterns lie in a single family of at most $exp \( C J k \)$ possibilities, independently of all padding choices. Fix one such pattern, its numerical column labels, the signs, and the lit or unlit designations. Replace $\| Delta G \|$ by $2^(S_1)$ and retain just one reciprocal per distinct column prime in $b_(cal(L))$. Every nonsingleton provides at least one such reciprocal: either it has a lit occurrence, or all of its at least two occurrences are unlit. Dropping the other reciprocals and lit consistency enlarges the nonnegative majorant.
  In $R$, drop closure, progression and block restrictions, arrival cuts, and the low-$Q$ cuts. Retain the padding divisibilities, bin conditions, departure weights, and departure $rho_j$ cuts. The closed-word identity for its denominators was established before this enlargement. Conditional on the non-$P$ environment, 28 with $m = 2 k$ bounds the full padding sum by $K^(2 k)$. All its factors are unchanged by the $P$-coordinate overwrites, and the bound is uniform in the environment. Taking its expectation preserves that bound.
  Let $m_i$ be the number of distinct labels in column $i$, and put $m_P = sum_i m_i$. Among the $2 k J$ column occurrences, exactly $S_1$ belong to singleton labels and every other label occurs at least twice. Hence
  $ 2 k J gt.eq S_1 + 2 \( m_P - S_1 \) \, #h(2em) m_P lt.eq J k + S_1 \/ 2 . $
  After the uniform padding bound, the numerical label sum is at most
  #[#set math.equation(numbering: n => "(1.56)")
   $ product_(i = 1)^J V_i^(m_i) lt.eq \( 2 W \)^(J k + S_1 \/ 2) lt.eq \( 2 W \)^(J k + L^(1 \/ 4) \/ 2) . $ <q:column-mass>]
  Here dropping distinctness among prime classes is simply an enlargement of a positive reciprocal sum. The classes are already identified by their first occurrences, so no further permutation factor is introduced.
  There are at most $2^(2 k)$ sign choices and $2^(2 k J)$ lit or unlit designations. The mixed difference contributes $2^(S_1)$. The external indices cost at most $\| cal(D) \|^2 M lt.eq exp \( 108 L \)$ for large $L$, since $\| cal(D) \| lt.eq e^(2 L)$ and $M = ceil.l e^(103 L) ceil.r$. Combining these bounds with the forest count and (1.56) gives
  #[#set math.equation(numbering: n => "(1.57)")
   $ bb(E) parallel H^k parallel_(upright("HS"))^2 lt.eq K^(2 k) exp \( C_4 J k \) \( 2 W \)^(J k + L^(1 \/ 4) \/ 2) + o \( 1 \) \, $ <q:trace-preconstant>]
  where $C_4$ is absolute. The factor $exp \( 108 L \)$ is absorbed here using $J gt.eq 1$ and $k gt.eq L \/ 2$.
  For every fixed $W$, once $L$ is sufficiently large, $\( 2 W \)^(L^(1 \/ 4) \/ 2) lt.eq e^k$. This changes the required lower threshold on $L$, but not the absolute constant in the exponential. An absolute choice of $C_2$ therefore bounds the right-hand side of (1.57) by
  $ #scale(x: 120%, y: 120%)[\[] K \( C_2 sqrt(W) \)^J #scale(x: 120%, y: 120%)[\]]^(2 k) . $
  Finally, the finite-law comparison for the trace expansion changes the expectation by at most $exp \( - L^9 \)$. Increasing the same absolute constant $C_2$ absorbs this error as well and proves the integer-interval assertion of 18. In particular, $C_2$ is fixed before $W$ is selected; dependence on the fixed parameters is confined to how large $X$ must be. ◻
]

==== 1.7 Spectral transfer and the bound at every scale <q:sec-spectral>

The moment bound for $H$ has only square-root dependence on each prime supply’s reciprocal mass. We now use it to control the retained centered sums $C_j^compose$. First we transfer control of $H$ to the projected edge operator $E \( sum_d A_d \) E$, then test against the Liouville function with vertex weight $sqrt(w)$. The factor $L$ in the edge matrices yields a factor $1 \/ L$ in the estimate for each bin, compensating for the factor $L$ in the number $O \( L \/ eta \)$ of bins. After division by the retained mass $S_0 gt.eq S V_(*) \/ 2$, with $V_(*) gt.eq W^J$, the spectral contribution will have the form

$ K / eta (C / sqrt(W))^J $

for an absolute constant $C$. We prove the transfer and the required finite-interval estimates before choosing $W$.

The use of a nonbacktracking operator to control an adjacency operator is exemplified by the weighted Ihara–Bass formula in #cite(label("Pilatte26")) Section 4.2. We prove the transfer needed here directly for self-adjoint edge operators; distinct edge operators need not commute.

===== 1.7.1 A transfer lemma for self-adjoint edge matrices <a-transfer-lemma-for-self-adjoint-edge-matrices>

#thm([Lemma 1.26.])[
  #emph[Let $N gt.eq 1$ and let $B_1 \, dots.h \, B_N$ be self-adjoint operators on a finite-dimensional complex Hilbert space $cal(H)$, and let $P$ be an orthogonal projection on $cal(H)$. Define an operator $cal(B)$ on $cal(H)^N$ by 
$ cal(B)_(i \, j) = upright(bold(1))_(i eq.not j) B_j . $

 Suppose $a \, b gt.eq 0$, $parallel B_i parallel lt.eq a$ for every $i$, and 
$ sum_(i = 1)^N parallel B_i v parallel^2 lt.eq b^2 parallel v parallel^2 #h(2em) \( v = P v \) . $

 Writing $rho \( cal(B) \)$ for its spectral radius, one has 
#[#set math.equation(numbering: n => "(1.58)")
 $ ∥P (sum_(i = 1)^N B_i) P∥ lt.eq 3 max { a \, b \, rho \( cal(B) \) } . $ <q:noncommuting-bound>]

]
] <q:noncommuting>

#proof[
  Put $m = max { a \, b \, rho \( cal(B) \) }$. If $m = 0$, all $B_i$ vanish. Otherwise set $t = \( 2 m \)^(- 1)$. For real $\| u \| lt.eq t$, the operators $I - u cal(B)$ and $I + u B_i$ are invertible. Define
  $ F \( u \) = I - sum_(i = 1)^N u B_i \( I + u B_i \)^(- 1) . $
  Each summand is self-adjoint, since $B_i$ commutes with its own resolvent. If $F \( u \) v = 0$, set $z_i = \( I + u B_i \)^(- 1) v$. Then
  $ \( u cal(B) z \)_i = sum_(j eq.not i) u B_j z_j = v - u B_i z_i = z_i . $
  A nonzero $v$ would give a nonzero $z$, contradicting the invertibility of $I - u cal(B)$. Hence $F \( u \)$ is invertible throughout $\[ - t \, t \]$. It is positive definite there by continuity, because $F \( 0 \) = I$.
  The resolvent identity gives
  $ F \( u \) = I - u sum_i B_i + Q \( u \) \, #h(2em) Q \( u \) = u^2 sum_i B_i^2 \( I + u B_i \)^(- 1) . $
  Since $\| u \| parallel B_i parallel lt.eq 1 \/ 2$, the inverses in the last expression are positive and bounded above by $2 I$. For $v = P v$,
  $ 0 lt.eq chevron.l v \, Q \( u \) v chevron.r lt.eq 2 u^2 sum_i parallel B_i v parallel^2 lt.eq 2 u^2 b^2 parallel v parallel^2 . $
  Positivity of $F \( t \)$ and $F \( - t \)$ therefore yields
  $ lr(|⟨v \, sum_i B_i v⟩|) lt.eq frac(1 + 2 t^2 b^2, t) parallel v parallel^2 lt.eq 3 m parallel v parallel^2 . $
  Taking the supremum over unit vectors in the range of $P$ proves (1.58). No step commutes two distinct $B_i$. ◻
]

===== 1.7.2 Weighted row bounds and the degree projection <weighted-row-bounds-and-the-degree-projection>

Fix a bin $j$ and one block of $M$ sites, with its matrices $A_d$, $H$ and projection $E$ from the trace construction. Define

$ a_d \( n \) = product_(p divides d) lr(|upright(bold(1))_(p divides n) - 1 / p|) . $

If $A_d \( n \, n' \) eq.not 0$, the difference $n' - n$ is a multiple of $d$. Thus $a_d \( n \) = a_d \( n' \)$ along every edge of $A_d$.

#thm([Lemma 1.27.])[
  #emph[On every block, in either the product model or the integer model, 
#[#set math.equation(numbering: n => "(1.59)")
 $ parallel A_d parallel & lt.eq 2 K \,\
sum_(d in cal(D)) parallel A_d v parallel^2 & lt.eq 4 K^2 \( 8 W \)^J parallel v parallel^2 #h(2em) \( v = E v \) . $ <q:single-operator>]

]
] <q:weighted-rows>

#proof[
  For each of the two edge orientations, the weighted absolute row sum at $n$ is at most
  $ a_d \( n \) sum_q frac(L u \( q \), w \( n \)) upright(bold(1))_(q divides n) upright(bold(1))_(\( d \, q \) in cal(S)_j) upright(bold(1))_(rho_j \( n \, d \) lt.eq K \/ L) lt.eq K a_d \( n \) . $
  Indeed the sum without the last indicator is at most $L rho_j \( n \, d \)$. For an incoming edge, $q$ divides one endpoint if and only if it divides the other. All the other edge restrictions can be discarded in this nonnegative bound. Consequently
  #[#set math.equation(numbering: n => "(1.60)")
   $ sum_(n') \| A_d \( n \, n' \) \| sqrt(w \( n' \)) / sqrt(w \( n \)) lt.eq 2 K a_d \( n \) . $ <q:weighted-row>]
  The weighted Schur inequality for a real symmetric matrix $B$ follows by applying
  $ 2 \| v_n v_(n') \| lt.eq \| v_n \|^2 sqrt(w \( n' \)) / sqrt(w \( n \)) + \| v_(n') \|^2 sqrt(w \( n \)) / sqrt(w \( n' \)) $
  to its quadratic form. Apply it to $A_d$ on each level set of $a_d$; these level sets are invariant under $A_d$. The resulting bound is
  #[#set math.equation(numbering: n => "(1.61)")
   $ parallel A_d v parallel^2 lt.eq 4 K^2 sum_n a_d \( n \)^2 \| v_n \|^2 . $ <q:localized-square>]
  In particular, $a_d \( n \) lt.eq 1$ proves (1.59).
  At a site retained by $E$, the total P-degree is at most $6 W J$. Since $V_i lt.eq 2 W$, the arithmetic-geometric mean inequality gives
  $ sum_d a_d \( n \)^2 & lt.eq sum_d a_d \( n \) lt.eq product_(i = 1)^J #scale(x: 120%, y: 120%)[\(] omega_(P_i) \( n \) + V_i #scale(x: 120%, y: 120%)[\)]\
 & lt.eq (frac(omega_P \( n \) + sum_i V_i, J))^J lt.eq \( 8 W \)^J . $
  Sum (1.61) over $d$. This proves (1.59) without requiring $E$ to commute with $A_d$. ◻
]

#thm([Proposition 1.28.])[
  #emph[There is an absolute constant $C_3$ with the following property. For each bin $j$, average block origins over any integer interval to which 18 applies. Outside a fraction at most $e^(- 2 k)$ of these origins, 
#[#set math.equation(numbering: n => "(1.62)")
 $ ∥E (sum_d A_d) E∥ lt.eq K \( C_3 sqrt(W) \)^J . $ <q:compressed-norm>]

]
] <q:spectral>

#proof[
  For every finite matrix, $rho \( H \)^(2 k) lt.eq parallel H^k parallel_(upright("HS"))^2$. Thus 18 and Markov’s inequality show that
  $ rho \( H \) lt.eq e K \( C_2 sqrt(W) \)^J $
  except on a fraction at most $e^(- 2 k)$ of the origins. On each remaining block apply 29 with
  $ a = 2 K \, #h(2em) b = 2 K \( 8 W \)^(J \/ 2) \, #h(2em) P = E . $
  For $J gt.eq 1$ and $W gt.eq 10$, the choice
  #[#set math.equation(numbering: n => "(1.63)")
   $ C_3 = 3 max { 2 \, 2 sqrt(8) \, e C_2 } $ <q:C3-choice>]
  gives (1.62). In particular, $C_3$ is independent of $W \, h \, l$. ◻
]

===== 1.7.3 Testing and averaging overlapping blocks <testing-and-averaging-overlapping-blocks>

We now turn (1.62) into an estimate for $C_j^compose$, the retained correlation in 14. Its endpoint restrictions are exactly those imposed by the $A_d$ and the projection $E$.

#thm([Proposition 1.29.])[
  #emph[For every bin $j$ and all sufficiently large $X$, 
#[#set math.equation(numbering: n => "(1.64)")
 $ \| C_j^compose \| lt.double frac(S K \( C_3 sqrt(W) \)^J, L) + e^(- L) . $ <q:bin-estimate>]

 The threshold may depend on the fixed $h \, l \, W$, while $C_3$ is the absolute constant in (1.63).]
] <q:testing>

#proof[
  Write $T = T_j$ and $N = floor.l T floor.r$, and average over blocks $I_t = { t + 1 \, dots.h \, t + M }$, $0 lt.eq t < N$. For large $X$, $N gt.eq exp \( L^A \/ 2 \)$, so the interval of origins is admissible in Lemma 1.3, Theorem 1.15. On each block put
  $ f_t \( n \) = sqrt(w \( n \)) lambda \( n \) upright(bold(1))_(omega_Q \( n \) lt.eq 400 log L) \, #h(2em) g_t = E f_t . $
  We first check the averaged norm needed for testing:
  #[#set math.equation(numbering: n => "(1.65)")
   $ 1 / N sum_(t = 0)^(N - 1) parallel g_t parallel^2 lt.eq 1 / N sum_(t = 0)^(N - 1) parallel f_t parallel^2 lt.eq 2 M S . $ <q:test-vector-norm>]
  For each of the $M$ block positions, 8 applied to the corresponding translated interval of $N$ origins bounds the average truncated weight by $2 S$. Summing proves (1.65). This uses the truncated comparison already established, without an untruncated integer moment of $w$.
  On blocks satisfying (1.62), the averaged absolute quadratic form is at most $2 M S K \( C_3 sqrt(W) \)^J$. On every block, including exceptional ones, (1.60) gives the deterministic bound
  #[#set math.equation(numbering: n => "(1.66)")
   $ lr(|⟨g_t \, sum_d A_d g_t⟩|) lt.eq 2 K M thin 5^(400 log L) \( 8 W \)^J . $ <q:deterministic-test>]
  Here we bound the form by its entrywise absolute value, use $\| g_t \( n \) \| lt.eq sqrt(w \( n \))$, and then sum the weighted row bounds at sites satisfying both degree cutoffs. The right side divided by $M$ is a fixed power of $L$ for fixed $W$. Multiplication by the exceptional fraction $e^(- 2 k)$ makes its contribution, after division by $2 L M$, at most $e^(- L)$ for large $L$. Therefore
  #[#set math.equation(numbering: n => "(1.67)")
   $ lr(|frac(1, 2 L M N) sum_(t = 0)^(N - 1) ⟨g_t \, sum_d A_d g_t⟩|) lt.double frac(S K \( C_3 sqrt(W) \)^J, L) + e^(- L) . $ <q:averaged-form>]
  It remains to compare this form with the original prefix sum. Denote by $c_j \( n \; d \, q \)$ the signed summand belonging to $\( d \, q \)$ in $T C_j^compose$, including all its endpoint cutoffs. Use the same formula to define it for every positive $n$, and put $r = h q d$. These cutoffs are predicates of the ambient sites, independent of the choice of block; restricting to a block only removes edges leaving it. Testing an increasing matrix entry cancels its two square-root weights and gives $L c_j \( n \; d \, q \)$; symmetry gives the same term in the opposite orientation. Thus the form on the left of (1.67), before taking absolute values, is exactly
  #[#set math.equation(numbering: n => "(1.68)")
   $ frac(1, M N) sum_(n \, d \, q) m_N \( n \, r \) c_j \( n \; d \, q \) \, #h(2em) m_N \( n \, r \) = #scale(x: 120%, y: 120%)[\[] min \( N - 1 \, n - 1 \) - max \( 0 \, n + r - M \) + 1 #scale(x: 120%, y: 120%)[\]]_(+) \, $ <q:edge-multiplicity>]
  where $\[ x \]_(+) = max \( x \, 0 \)$. This is the number of blocks containing both endpoints. All contributing $n$ are positive.
  Let
  $ R_L = h e^(100 L + 1) \, #h(2em) D_L = K / L thin 5^(400 log L) \( 8 W \)^J . $
  Every displacement is at most $R_L$, and the one-orientation row bound proves $sum_(d \, q) \| c_j \( n \; d \, q \) \| lt.eq D_L$ for every $n$. For large $L$ we have $N gt.double M > R_L$. If $M lt.eq n lt.eq N$, then $m_N \( n \, r \) = M - r$. The lower boundary and the extra sites $N < n < N + M$ contain at most $2 M$ sites, and always $0 lt.eq m_N \( n \, r \) lt.eq M$. Consequently the difference between (1.68) and $C_j^compose = T^(- 1) sum_(n lt.eq N \, d \, q) c_j \( n \; d \, q \)$ is at most
  #[#set math.equation(numbering: n => "(1.69)")
   $ O (D_L (R_L / M + M / N + 1 / T)) . $ <q:prefix-error>]
  The last term accounts for replacing $N^(- 1)$ by $T^(- 1)$. Since $M = ceil.l e^(103 L) ceil.r$, $T gt.eq X = e^(L^A)$ and $D_L$ is polynomial in $L$, (1.69) is $O \( e^(- L) \)$ for sufficiently large $L$. This also bounds edges whose terminal endpoint exceeds $T$ and the floor errors. Combining with (1.67) proves (1.64). ◻
]

===== 1.7.4 Final choice of constants <final-choice-of-constants>

#proof[
  There are $O \( L \/ eta \)$ bins. Sum (1.64), use $S_0 gt.eq S V_(*) \/ 2$ and $V_(*) gt.eq W^J$, and then apply the centering and deletion estimates of Lemma 1.6, Lemma 1.11. We obtain
  #[#set math.equation(numbering: n => "(1.70)")
   $ \| F \( X \) \| lt.double_(h \, l \, W)  & eta + eta^(- 1) 2^J L^(- 1 \/ 20) + 2^J #scale(x: 120%, y: 120%)[\(] K^(- 1) + L^(- 100) + e^(- 2 W J) #scale(x: 120%, y: 120%)[\)]\
 & + K / eta (C_3 / sqrt(W))^J + e^(- L^0.9) + X^(- 1) . $ <q:finish>]
  The deletion error in 14 is already summed over the bins. The new error $O \( \( L \/ eta \) e^(- L) \)$ from 32 is absorbed by $e^(- L^0.9)$, because $L \/ eta$ is polynomial in $L$ and $S V_(*) gt.eq 1$.
  Choose the absolute constants in the following order. First fix $A$ as required by 6; in particular $A gt.eq 1000$ and $A > C_1 + 20$, where $C_1$ is the absolute exponent in that comparison. The trace proof gives an absolute $C_2$, and (1.63) then gives an absolute $C_3$. Now choose $W gt.eq 10$ so large that
  #[#set math.equation(numbering: n => "(1.71)")
   $ e^5 C_3 \/ sqrt(W) lt.eq e^(- 1) . $ <q:W-choice>]
  Only after fixing these constants do we increase the threshold for $X$, allowing it to depend on $h \, l \, W$.
  Recall $eta = e^(- J)$, $K = e^(4 J)$ and $J lt.eq delta log L \/ \( 6 W \)$ with $delta = 1 \/ 200$. The spectral term in (1.70) is at most $e^(- J)$ by (1.71). The other terms satisfy
  $ 2^J K^(- 1) & = e^(- \( 4 - log 2 \) J) lt.eq e^(- J) \,\
2^J e^(- 2 W J) & = e^(- \( 2 W - log 2 \) J) lt.eq e^(- J) \,\
e^J 2^J L^(- 1 \/ 20) & lt.eq e^(- J) \, #h(2em) 2^J L^(- 100) lt.eq e^(- J) . $
  For the last line, it is enough to note that
  $ frac(delta \( 2 + log 2 \), 6 W) < 1 / 20 \, #h(2em) frac(delta \( 1 + log 2 \), 6 W) < 100 . $
  Also $e^(- L^0.9) + X^(- 1) lt.double e^(- J)$ for large $X$. Hence $\| F \( X \) \| lt.double_(h \, l) e^(- J)$. Finally,
  $ e^(- J) lt.eq e L^(- delta \/ \( 6 W \)) = e \( log X \)^(- c) \, #h(2em) c = frac(delta, 6 W A) > 0 . $
  All three constants $A \, W \, c$ are absolute. The argument applies to every sufficiently large real $X$, with no excluded scales. On the remaining bounded range $3 lt.eq X lt.eq X_0 \( h \, l \)$, the estimate follows from $\| F \( X \) \| lt.eq 1$ after enlarging the implied constant. This proves 4. ◻
]

==== 1.8 The quantitative affine bound <q:affine-transfer>

The progression estimate for Liouville gives the same logarithmic exponent for every fixed affine pair. The finite initial interval affects only the constant.

#proof[
  Fix $a_1 \, a_2 gt.eq 1$ and $b_1 \, b_2 gt.eq 0$ with nonzero determinant, and put
  $ l = a_1 a_2 \, #h(2em) c_0 = min \( a_2 b_1 \, a_1 b_2 \) \, #h(2em) h = \| a_1 b_2 - a_2 b_1 \| > 0 . $
  Multiplying the two affine arguments by $a_2$ and $a_1$, respectively, and using complete multiplicativity gives
  #[#set math.equation(numbering: n => "(1.72)")
   $ lambda \( a_1 n + b_1 \) lambda \( a_2 n + b_2 \) = lambda \( l \) lambda \( l n + c_0 \) lambda \( l n + c_0 + h \) . $ <q:quant-affine-identity>]
  Here $lambda \( l \)^2 = 1$. For real $Y gt.eq 0$ set
  $ P \( Y \) = sum_(1 lt.eq m lt.eq Y) lambda \( m \) lambda \( m + h \) upright(bold(1))_(m equiv c_0 med \( mod med l \)) . $
  The sum is empty for $Y < 1$. Let $c > 0$ be the absolute exponent in 4. That estimate applies to the residue $c_0$ without any coprimality restriction and gives
  $ \| P \( Y \) \| lt.double_(l \, h \, c_0) frac(Y, \( log Y \)^c) #h(2em) \( Y gt.eq 3 \) . $
  For every real $X gt.eq 3$, the integers in the class $c_0 med \( mod med l \)$ with $c_0 < m lt.eq l X + c_0$ are precisely $m = l n + c_0$ with $1 lt.eq n lt.eq X$. Consequently (1.72) gives the exact endpoint identity
  #[#set math.equation(numbering: n => "(1.73)")
   $ sum_(1 lt.eq n lt.eq X) lambda \( a_1 n + b_1 \) lambda \( a_2 n + b_2 \) = lambda \( l \) #scale(x: 120%, y: 120%)[\(] P \( l X + c_0 \) - P \( c_0 \) #scale(x: 120%, y: 120%)[\)] . $ <q:affine-rate-endpoints>]
  This identity includes both determinant signs and noninteger cutoffs. Since $l X + c_0 gt.eq X gt.eq 3$ and $l X + c_0 lt.eq \( l + c_0 \/ 3 \) X$, the first term satisfies
  $ \| P \( l X + c_0 \) \| lt.double_(a_1 \, a_2 \, b_1 \, b_2) frac(X, \( log X \)^c) . $
  Also $\| P \( c_0 \) \| lt.eq c_0$, which is absorbed into the same bound: the function $\( log X \)^c \/ X$ is bounded on $\[ 3 \, oo \)$. The exponent has not changed and is independent of the affine coefficients; only the implied constant depends on them. This proves 1 for all real $X gt.eq 3$. ◻
]

== 2 Qualitative correlations of general multiplicative functions <qualitative-correlations-of-general-multiplicative-functions>

We now prove 2. The graph in this part uses a different normalization and a different order of limits. Its parameters and prime sets are defined afresh; none of the choices of $A \, W \, L \, J \, eta$ in Part I is in force here. The functions and their nonpretentiousness condition remain those of the introduction.

==== 2.1 The weighted divisor graph <sec:graph-setup>

We begin the qualitative argument with the finite-scale graph estimate that will rule out a correlation bias. Its test functions are arbitrary bounded sequences; no multiplicativity enters its statement or proof. The arithmetic application follows in 2.

Fix an integer $h gt.eq 1$. Throughout the graph construction use

#[#set math.equation(numbering: n => "(2.1)")
 $ epsilon = 10^(- 4) \, quad eta = epsilon \/ 100 \, quad rho = 1 \/ 20 \, quad kappa = 400 \/ eta \, quad A = exp \( 2 kappa \) \, quad c_(*) = epsilon \/ 100 . $ <eq:graph-constants>]

The scale $B$ will be sufficiently large. Define two finite prime sets by

#[#set math.equation(numbering: n => "(2.2)")
 $ cal(C) & = { p : B^(1 - eta) < log p lt.eq B } \,\
cal(Z) & = { p : B^(1 - epsilon) < log p lt.eq B^(1 - eta) } \, #h(2em) cal(S) = cal(C) union cal(Z) \, quad P_0 = exp \( B^(1 - epsilon) \) . $ <eq:prime-bands>]

We refer to $cal(C)$ as the core band and $cal(Z)$ as the center band. For $a in { C \, Z }$, set $cal(P)_C = cal(C)$ and $cal(P)_Z = cal(Z)$, and put

$ v_a = sum_(p in cal(P)_a) 1 / p \, #h(2em) A_C = A \, quad A_Z = 1 \, quad beta_a = \( 1 + A_a \)^(- 1) \, #h(2em) theta = beta_Z^2 = 1 / 4 . $

Mertens’ prime harmonic estimate gives

$ v_C = \( eta + o \( 1 \) \) log B \, #h(2em) v_Z = \( epsilon - eta + o \( 1 \) \) log B . $

Fix also $tau in \( 1 \, 2 \)$, $C_0 gt.eq 1$, and $T > 0$. An admissible divisor family $cal(D)$ is any collection of squarefree products of primes in $cal(S)$ such that

#[#set math.equation(numbering: n => "(2.3)")
 $ d > 1 \, #h(2em) H < d lt.eq tau H \, #h(2em) 1 lt.eq H lt.eq exp \( C_0 B \) \,\
omega \( d \) lt.eq J := ceil.l C_0 log B ceil.r . $ <eq:divisor-family>]

Here $omega$ counts distinct prime factors. For any integer $x$, define $omega_a \( x \) = \# { p in cal(P)_a : p divides x }$, and write $d_C = product_(p divides d \, med p in cal(C)) p$. For each $d in cal(D)$, let $w_d : bb(Z) arrow.r \[ 0 \, 1 \]$ be any function of all the residues $x med mod med p$, $p in cal(C)$, with support restricted by

#[#set math.equation(numbering: n => "(2.4)")
 $ w_d \( x \) = 0 quad upright("unless") quad k_d \( x \) := \# { p in cal(C) : p divides x \, med p divides.not d } gt.eq v_C - T sqrt(v_C) . $ <eq:core-cutoff>]

The cutoff need not factor over primes.

For $y = x plus.minus h d$, define the real edge weight

#[#set math.equation(numbering: n => "(2.5)")
 $ g_d \( x \, y \) = w_d \( x \) w_d \( y \) A^(omega_C \( d \)) upright(bold(1))_(d_C divides x) product_(p divides d\
p in cal(Z)) (upright(bold(1))_(p divides x) - theta / p) . $ <eq:graph-kernel>]

For each $p divides d$, the residues of $x$ and $y$ agree modulo $p$. Consequently $g_d \( x \, y \) = g_d \( y \, x \)$. The uncentered core factors enforce $d_C divides x$, whereas the center factors can have either sign.

The vertex weight and its mean are

#[#set math.equation(numbering: n => "(2.6)")
 $ W \( x \) = product_(a in { C \, Z }) beta_a^(- omega_a \( x \)) \, #h(2em) L_0 = product_(a in { C \, Z }) product_(p in cal(P)_a) \( 1 + A_a \/ p \) . $ <eq:graph-weights>]

Let $Q_B = product_(p in cal(S)) p$. We use the uniform probability space $bb(Z) \/ Q_B bb(Z)$, identified by the Chinese remainder theorem with the product of the uniform spaces $bb(Z) \/ p bb(Z)$. Its expectation is denoted by $bb(E)$; $bb(E)_U$ averages only coordinates indexed by $U subset.eq cal(S)$. For a uniform residue $n$,

#[#set math.equation(numbering: n => "(2.7)")
 $ bb(E) W \( n \) = L_0 \, #h(2em) bb(E) W \( n \)^2 = product_a product_(p in cal(P)_a) (1 + frac(beta_a^(- 2) - 1, p)) lt.eq exp #scale(x: 120%, y: 120%)[\(] \( A^2 + 2 A \) v_C + 3 v_Z #scale(x: 120%, y: 120%)[\)] = B^(O_A \( 1 \)) . $ <eq:weight-moments>]

Both identities follow by independence of the prime coordinates. The exponent in the last bound is fixed, although large.

#thm([Proposition 2.1.])[
  (Divisor graph estimate).  #emph[Fix $h gt.eq 1$, $1 < tau < 2$, $C_0 gt.eq 1$, and $T > 0$, and use (2.1)–(2.6). For every sufficiently large $B$, every admissible family $cal(D)$, all permitted cutoffs $w_d$, all coefficients $\| a_d \| lt.eq 1$, and all functions $F \, G : bb(N) arrow.r bb(D)$, 
#[#set math.equation(numbering: n => "(2.8)")
 $ limsup_(X arrow.r oo) 1 / X lr(|sum_(1 lt.eq x lt.eq X) sum_(d in cal(D)) a_d F \( x \) G \( x + h d \) g_d \( x \, x + h d \)|) lt.double L_0 B^(- 1 - c_(*) \/ 2) . $ <eq:graph-estimate>]

 The implied constant and the threshold for $B$ may depend on $h \, tau \, C_0 \, T$, and the fixed constants in (2.1), but not on $H \, cal(D) \, w_d \, a_d \, F \, G$. All graph parameters are fixed when $X$ tends to infinity.]
] <prop:graph-estimate>

The proof occupies Section 2.4, Section 2.5, Section 2.6, Section 2.7, Section 2.8. The two bands have different roles in that proof. The core weights and cutoffs give savings from the short divisor interval and from the lower bound on $k_d \( x \)$ in (2.4). The center factors provide further cancellation in closed-walk products, where each edge weight is divided by $W$ at its starting vertex. The relation $theta = beta_Z^2$ matches the centering constant to that normalization; its precise use is established in 7, once the relevant walk configurations have been defined.

The comparison scale is $L_0 \/ B$. In the next section, one of $O \( B \)$ short multiplicative intervals captures enough divisor weight to turn any persistent correlation bias into a sum of this size with ordinary divisibility indicators. The extra factor $B^(- c_(*) \/ 2)$ in (2.8) will contradict that bias once the analytic cost of centering has been bounded.

==== 2.2 Reduction to the graph estimate <sec:analytic-transfer>

We now explain how 33 rules out a nonzero multiplicative correlation. The first step produces a large sum with ordinary divisibility indicators. We then state the estimate that permits centering those indicators, and display the resulting contradiction. The proof of the centering estimate occupies 3; the graph estimate itself will be proved in 8.

===== 2.2.1 Absolute-value defects and a biased sequence <absolute-value-defects-and-a-biased-sequence>

A multiplicative function satisfies $f \( 1 \) = f \( 1 \)^2$. If $f \( 1 \) = 0$, then $f \( n \) = f \( n \) f \( 1 \) = 0$ for every $n$. We may therefore suppose that both functions in 2 take the value $1$ at $1$. There is another case in which the conclusion follows without a graph.

#thm([Lemma 2.2.])[
  #emph[Let $f : bb(N) arrow.r bb(C)$ be multiplicative and $\| f \| lt.eq 1$. If 
$ sum_p frac(1 - \| f \( p \) \|, p) = oo \, $

 then $N^(- 1) sum_(n lt.eq N) \| f \( n \) \| arrow.r 0$.]
] <lem:analytic-absolute-defect>

#proof[
  Write $v_p \( n \)$ for the exponent of $p$ in $n$. For a finite set $cal(P)$ of primes, multiplicativity gives
  $ \| f \( n \) \| lt.eq product_(p in cal(P)\
v_p \( n \) = 1) \| f \( p \) \| . $
  The majorant is periodic modulo $product_(p in cal(P)) p^2$. Its ordinary mean is
  $ product_(p in cal(P)) (1 - \( 1 - \| f \( p \) \| \) (1 / p - 1 / p^2)) . $
  These products tend to zero as $cal(P)$ increases through the primes: the sum of the subtracted quantities diverges, whereas $sum_p p^(- 2) < oo$. First take the long average with $cal(P)$ fixed, and then increase $cal(P)$. ◻
]

A fixed translation affects only finitely many terms of a bounded average. Thus, after translating by the smaller shift and ordering the functions accordingly, it suffices to prove cancellation of $f_1 \( m \) f_2 \( m + h \)$ for a fixed $h gt.eq 1$. By 34, we may assume

#[#set math.equation(numbering: n => "(2.9)")
 $ sum_p frac(1 - \| f_i \( p \) \|, p) < oo #h(2em) \( i = 1 \, 2 \) . $ <eq:analytic-finite-defects>]

If the desired cancellation fails, there are $0 < gamma lt.eq 1$ and positive integers $N_j arrow.r oo$ such that

#[#set math.equation(numbering: n => "(2.10)")
 $ lr(|S \( N_j \)|) gt.eq gamma N_j \, #h(2em) S \( N \) = sum_(m lt.eq N) f_1 \( m \) f_2 \( m + h \) . $ <eq:analytic-bias>]

We retain this same sequence throughout the argument. The numbers $S \( N_j \)$ may have varying complex arguments.

Fix $1 < tau < 2$ sufficiently close to $1$ in terms of $gamma$, and then fix $T$ sufficiently large in terms of $gamma$. Choose $phi.alt in C_c^oo \( bb(R) \)$ with $0 lt.eq phi.alt lt.eq 1$, supported in $\[ - T \, T \]$ and equal to $1$ on $\[ - T \/ 2 \, T \/ 2 \]$. For every admissible divisor $d$, use

#[#set math.equation(numbering: n => "(2.11)")
 $ w_d \( x \) = phi.alt (frac(k_d \( x \) - v_C, sqrt(v_C))) . $ <eq:analytic-cutoffs>]

These cutoffs satisfy the support and residue-dependence requirements of 33.

===== 2.2.2 Capturing the bias in one divisor interval <capturing-the-bias-in-one-divisor-interval>

Recall that $cal(S) = cal(C) union cal(Z)$ is the finite prime set at scale $B$, and that a squarefree product $d$ of these primes has weight $A^(omega_C \( d \))$. The normalizing factor $L_0$ has the exact expansion

#[#set math.equation(numbering: n => "(2.12)")
 $ L_0 = sum_(d med upright("squarefree")\
p divides d arrow.r.double p in cal(S)) A^(omega_C \( d \)) / d . $ <eq:raw-divisor-law>]

The term $d = 1$ is included here.

#thm([Lemma 2.3.])[
  (A divisor interval carrying positive mass).  #emph[Let $f_1 \, f_2 : bb(N) arrow.r bb(C)$ be $1$-bounded multiplicative functions satisfying (2.9) and $f_1 \( 1 \) = f_2 \( 1 \) = 1$. Fix $1 < tau < 2$. There are constants $C_0 gt.eq 1$ and $c > 0$ such that, for every sufficiently large $B$, one can choose $1 lt.eq H lt.eq exp \( C_0 B \)$ and a family $cal(D)$ of squarefree $cal(S)$-products satisfying 
#[#set math.equation(numbering: n => "(2.13)")
 $ H < d lt.eq tau H \, #h(2em) d > 1 \, #h(2em) omega \( d \) lt.eq J = ceil.l C_0 log B ceil.r \, #h(2em) \| f_1 \( d \) f_2 \( d \) \| gt.eq 1 / 2 \,\
sum_(d in cal(D)) A^(omega_C \( d \)) / d gt.eq c L_0 / B . $ <eq:raw-selected-divisors>]

 The constants are independent of $B$ and of the long averaging variable.]
] <lem:raw-bin>

#proof[
  Normalize the summands of (2.12) to a probability law on divisors, and denote its expectation and probability by $bb(E)_(upright("div"))$ and $bb(P)_(upright("div"))$. Each prime $p$ in band $a$ is included independently with probability $A_a \/ \( p + A_a \)$. Prime harmonic estimates give
  $ bb(E)_(upright("div")) omega \( d \) lt.double_A log B \, #h(2em) bb(E)_(upright("div")) log d lt.eq A sum_(p lt.eq e^B) frac(log p, p) lt.double_A B . $
  Choose $C_0$ large enough that the probabilities of $omega \( d \) > ceil.l C_0 log B ceil.r$ and $log d > C_0 B$ are each at most $1 \/ 8$, by Markov’s inequality.
  For $r_p = \| f_1 \( p \) f_2 \( p \) \|$, the inequality $1 - product_j r_j lt.eq sum_j \( 1 - r_j \)$, valid when $0 lt.eq r_j lt.eq 1$, gives
  $ bb(E)_(upright("div")) #scale(x: 120%, y: 120%)[\(] 1 - \| f_1 \( d \) f_2 \( d \) \| #scale(x: 120%, y: 120%)[\)] & lt.eq A sum_(p > P_0) frac(1 - \| f_1 \( p \) f_2 \( p \) \|, p)\
 & lt.eq A sum_(p > P_0) frac(\( 1 - \| f_1 \( p \) \| \) + \( 1 - \| f_2 \( p \) \| \), p) = o \( 1 \) . $
  Here squarefreeness permits the use of multiplicativity. Another application of Markov’s inequality shows that the probability of $\| f_1 \( d \) f_2 \( d \) \| < 1 \/ 2$ tends to zero. Also $bb(P)_(upright("div")) \( d = 1 \) = L_0^(- 1) arrow.r 0$. Thus the remaining divisors carry at least $L_0 \/ 2$ of the unnormalized mass for large $B$.
  There are at most $1 + C_0 B \/ log tau$ intervals $\( tau^r \, tau^(r + 1) \]$, $r gt.eq 0$, meeting $\( 1 \, e^(C_0 B) \]$. One of them carries at least $c L_0 \/ B$ of that mass, for a fixed $c > 0$. Take its lower endpoint as $H$ and retain the divisors already satisfying the preceding conditions. ◻
]

For any such divisor family, any coefficients $\| a_d \| lt.eq 1$, and the cutoffs (2.11), define the raw and centered sums by

#[#set math.equation(numbering: n => "(2.14)")
 $ R_B \( X \) & = sum_(x lt.eq X) sum_(d in cal(D)) a_d A^(omega_C \( d \)) f_1 \( x \) f_2 \( x + h d \) w_d \( x \) w_d \( x + h d \) upright(bold(1))_(d divides x) \,\
C_B \( X \) & = sum_(x lt.eq X) sum_(d in cal(D)) a_d f_1 \( x \) f_2 \( x + h d \) g_d \( x \, x + h d \) . $ <eq:raw-sum>]

The first sum retains ordinary divisibility by all primes of $d$; the second is the sum bounded by 33.

#thm([Lemma 2.4.])[
  (Raw lower bound).  #emph[Let $f_1 \, f_2 : bb(N) arrow.r bb(C)$ be $1$-bounded multiplicative functions, with $f_1 \( 1 \) = f_2 \( 1 \) = 1$, satisfying (2.10) and (2.9). Choose $1 < tau < 2$ and $T > 0$ with $tau - 1 lt.eq gamma \/ 64$ and $32 \/ T^2 lt.eq gamma \/ 64$, and use a cutoff $phi.alt$ as in (2.11), equal to $1$ on $\[ - T \/ 2 \, T \/ 2 \]$. With $cal(D) \, H$ supplied by 35, set 
$ a_d = overline(f_1 \( d \) f_2 \( d \)) \, #h(2em) X_j = H N_j . $

 There is $c_gamma > 0$, independent of $B \, j$, such that, for every sufficiently large fixed $B$, 
#[#set math.equation(numbering: n => "(2.15)")
 $ liminf_(j arrow.r oo) frac(\| R_B \( X_j \) \|, X_j) gt.eq c_gamma L_0 / B . $ <eq:raw-lower-bound>]

]
] <lem:raw-lower-bound>

#proof[
  Put
  $ V_(cal(D)) = sum_(d in cal(D)) A^(omega_C \( d \)) \, #h(2em) K_(cal(D)) = sum_(d in cal(D)) \| f_1 \( d \) f_2 \( d \) \|^2 A^(omega_C \( d \)) gt.eq 1 / 4 V_(cal(D)) . $
  For a fixed $d$, write $x = d m$. Unless $gcd \( d \, m \) > 1$ or $gcd \( d \, m + h \) > 1$, ordinary multiplicativity gives
  $ a_d f_1 \( d m \) f_2 \( d \( m + h \) \) = \| f_1 \( d \) f_2 \( d \) \|^2 f_1 \( m \) f_2 \( m + h \) . $
  The exceptional set has ordinary density at most $2 sum_(p divides d) p^(- 1) lt.eq 2 J \/ P_0$. At fixed $B$ there are only finitely many $d$, so all associated residue-counting errors vanish as $j arrow.r oo$.
  For $p in cal(C)$ not dividing $d$, divisibility of $d m$ by $p$ is equivalent to divisibility of $m$. Hence the mean and variance of $k_d \( d m \)$ under uniform residues are
  $ mu_d = v_C - sum_(p divides d\
p in cal(C)) 1 / p \, #h(2em) "Var" \( k_d \( d m \) \) = sum_(p in cal(C)\
p divides.not d) 1 / p (1 - 1 / p) lt.eq v_C . $
  The same formulas hold with $m + h$ in place of $m$. For large $B$, $\| mu_d - v_C \| lt.eq J \/ P_0 lt.eq \( T \/ 4 \) sqrt(v_C)$. Chebyshev’s inequality and a union bound show that the proportion on which either cutoff is not $1$ is at most $32 \/ T^2$. Independence of the two endpoints is not needed.
  The length $X_j \/ d$ lies between $N_j \/ tau$ and $N_j$. Comparing each shorter sum with the sum up to $N_j$ therefore gives
  #[#set math.equation(numbering: n => "(2.16)")
   $ \| R_B \( X_j \) - K_(cal(D)) S \( N_j \) \| lt.eq N_j V_(cal(D)) (tau - 1 + 32 / T^2 + frac(4 J, P_0) + o_(j arrow.r oo) \( 1 \)) . $ <eq:raw-comparison>]
  The factor $4 J \/ P_0$ allows a difference of size at most $2$ on each coprimality failure. The endpoint rounding errors are included in $o \( 1 \)$.
  Choose $tau - 1 lt.eq gamma \/ 64$ and $32 \/ T^2 lt.eq gamma \/ 64$, and then take $B$ and $j$ large enough for the other two errors to be at most $gamma \/ 64$ each. The reverse triangle inequality, valid for the complex number $S \( N_j \)$, yields
  $ \| R_B \( X_j \) \| gt.eq gamma / 8 N_j V_(cal(D)) . $
  Finally, $V_(cal(D)) gt.eq H sum_(d in cal(D)) A^(omega_C \( d \)) \/ d gt.eq c H L_0 \/ B$. This proves the result with $c_gamma = gamma c \/ 8$. ◻
]

===== 2.2.3 The centering estimate and the contradiction <the-centering-estimate-and-the-contradiction>

The remaining analytic task is to show that centering changes the raw sum by less than its lower bound. Its statement does not require (2.9).

#thm([Proposition 2.5.])[
  (Analytic centering estimate).  #emph[Let $f_1 \, f_2 : bb(N) arrow.r bb(C)$ be multiplicative, with $\| f_i \| lt.eq 1$, and suppose at least one is uniformly nonpretentious. Fix $h gt.eq 1$, $1 < tau < 2$, $C_0 gt.eq 1$, $T > 0$, and a smooth function $0 lt.eq phi.alt lt.eq 1$ supported in $\[ - T \, T \]$. For each sufficiently large $B$, let $cal(D) \, H \, J$ satisfy (2.3), let $\| a_d \| lt.eq 1$, and use (2.11). Define $R_B \, C_B$ by (2.14) and (2.14). Then 
#[#set math.equation(numbering: n => "(2.17)")
 $ limsup_(X arrow.r oo) frac(\| R_B \( X \) - C_B \( X \) \|, X) lt.double L_0 (B^(- 1 - epsilon) + J / P_0) . $ <eq:analytic-centering-bound>]

 The implied constant may depend on the fixed parameters and $phi.alt$, but is independent of the divisor family and coefficients. The long-variable limit is taken with $B$ fixed.]
] <prop:analytic-centering>

#proof[
  #emph[Reduction of 2.] We deduce 2 from Proposition 2.1, Proposition 2.5. The zero-function and divergent-defect cases were settled above. Otherwise suppose (2.10) holds. Choose $tau \, T \, phi.alt \, C_0$ and, for each sufficiently large fixed $B$, the divisor family of 35. Combining 36 with the two propositions gives
  $ c_gamma L_0 / B lt.eq C L_0 (B^(- 1 - c_(*) \/ 2) + B^(- 1 - epsilon) + J / P_0) . $
  After dividing by $L_0 \/ B$, this reads
  #[#set math.equation(numbering: n => "(2.18)")
   $ c_gamma lt.eq C (B^(- c_(*) \/ 2) + B^(- epsilon) + B J exp \( - B^(1 - epsilon) \)) \, $ <eq:analytic-contradiction>]
  which is impossible for sufficiently large $B$.
  In this comparison the functions, shift, and bias $gamma$ are fixed first; then $tau \, T \, phi.alt \, C_0$ are fixed. For each fixed $B$ the limit is taken along the original sequence $N_j$, with $X_j = H N_j$. Only after these inequalities hold does $B$ increase. Thus the contradiction excludes every alleged biased sequence. ◻
]

==== 2.3 The analytic centering estimate <sec:analytic-centering>

We prove 37. Expanding the centered factors leaves sums over integers with large prime factors. We shall bound the Fourier multiplier of those integers and use short-interval cancellation for whichever multiplicative function is nonpretentious. Combining short exponential sums with a fourth-moment bound follows the centering strategy in #cite(label("Pilatte26")) Appendix C; we prove the rough-number estimates needed for the present weights. Throughout this section, $upright(e) \( t \) = exp \( 2 pi i t \)$.

===== 2.3.1 Expansion and finite-prime twists <expansion-and-finite-prime-twists>

A term other than the raw term in the expansion of the center-band factors has $d = u w$, where $w > 1$ is the product of the center primes whose constant terms were selected. Thus $u \, w$ are coprime squarefree products, every core factor of $d$ belongs to $u$, and the coefficient of the divisibility indicator $upright(bold(1))_(u divides x)$ is

$ A^(omega_C \( u \)) a_(u w) frac(\( - theta \)^(omega \( w \)), w) . $

For each fixed $u$, put $c_w^(\( u \)) = a_(u w) \( - theta \)^(omega \( w \))$ on these admissible factorizations and set $c_w^(\( u \)) = 0$ otherwise. Then $\| c_w^(\( u \)) \| lt.eq 1$, and its support is independent of $x$. Set $M = H \/ u$ and write $x = u z$. Whenever this support is nonempty, its values of $w$ satisfy

#[#set math.equation(numbering: n => "(2.19)")
 $ M < w lt.eq tau M \, #h(2em) P_0 / tau lt.eq M lt.eq e^(C_0 B) . $ <eq:analytic-rough-range>]

The lower bound follows because a nonempty term has $w > P_0$. Every such $w$ has no prime factor below $P_0$; we call integers with this property #emph[$P_0$-rough].

Since $u$ and $d$ have exactly the same core factors, the first cutoff becomes

$ w_(u w) \( u z \) = phi.alt (frac(sum_(p in cal(C)\
p divides.not u) upright(bold(1))_(p divides z) - v_C, sqrt(v_C))) . $

The second cutoff has the same expression with $z + h w$ in place of $z$. Apart from $gcd \( u \, z \( z + h w \) \) > 1$, multiplicativity gives

$ f_1 \( u z \) f_2 \( u \( z + h w \) \) = f_1 \( u \) f_2 \( u \) f_1 \( z \) f_2 \( z + h w \) . $

For a fixed $u \, w$, the exceptional set has ordinary density at most $2 J \/ P_0$. Since

#[#set math.equation(numbering: n => "(2.20)")
 $ sum_(M < w lt.eq tau M) 1 / w lt.double_tau 1 \, #h(2em) sum_(u med upright("squarefree")\
p divides u arrow.r.double p in cal(S)) A^(omega_C \( u \)) / u = L_0 \, $ <eq:analytic-sum-u>]

the total error, divided by $X$, has limsup $O \( L_0 J \/ P_0 \)$. The case of an identically zero factor is immediate, so in this factorization we may assume $f_1 \( 1 \) = f_2 \( 1 \) = 1$.

For $hat(phi.alt) \( t \) = integral_(bb(R)) phi.alt \( s \) upright(e) \( - t s \) thin d s$, Fourier inversion expresses each cutoff as an integral of constant phases times twists

#[#set math.equation(numbering: n => "(2.21)")
 $ b_i \( n \) = f_i \( n \) upright(e) (t_i / sqrt(v_C) sum_(p in cal(C)\
p divides.not u) upright(bold(1))_(p divides n)) \, #h(2em) t_i in bb(R) . $ <eq:analytic-twists>]

For coprime integers the count in this exponent is additive. Hence $b_i$ is multiplicative and $\| b_i \| lt.eq 1$. It need not be completely multiplicative: the added factor has the same value at $p$ and $p^2$. Its prime values agree with those of $f_i$ outside $cal(C)$. The two Fourier integrals have total absolute weight $parallel hat(phi.alt) parallel_1^2$, a fixed finite constant.

It is therefore enough to show, uniformly in the twists (2.21) and in $\| c_w \| lt.eq 1$ supported on $P_0$-rough integers in $\( M \, tau M \]$, that

#[#set math.equation(numbering: n => "(2.22)")
 $ limsup_(Y arrow.r oo) 1 / Y lr(|sum_(z lt.eq Y) b_1 \( z \) sum_(M < w lt.eq tau M) c_w / w b_2 \( z + h w \)|) lt.double B^(- 1 - epsilon) . $ <eq:analytic-rough-target>]

Here $Y = X \/ u$, and all graph parameters are fixed before $Y$ increases.

===== 2.3.2 The short-interval input <the-short-interval-input>

We first justify the uniformity in the Fourier parameters. Finite changes to prime values have only a bounded effect on the squared distance defining nonpretentiousness.

#thm([Lemma 2.6.])[
  (Stability under finitely many prime changes).  #emph[Let $f \, b : bb(N) arrow.r bb(C)$ be multiplicative and $1$-bounded. Suppose their prime values agree outside a finite set $cal(P)$. For every Dirichlet character $chi$, every real $t$, and $X gt.eq 2$, 
#[#set math.equation(numbering: n => "(2.23)")
 $ lr(|D \( b \, chi n^(i t) \; X \)^2 - D \( f \, chi n^(i t) \; X \)^2|) lt.eq 2 sum_(p in cal(P)) 1 / p . $ <eq:analytic-distance-stability>]

 Consequently, if $f$ is uniformly nonpretentious, the same divergence holds uniformly over all such $b$ and over every fixed finite family of Dirichlet characters.]
] <lem:finite-prime-stability>

#proof[
  Outside $cal(P)$ the summands in the squared distances coincide. At a prime in $cal(P)$ their difference has absolute value at most $\| b \( p \) - f \( p \) \| \/ p lt.eq 2 \/ p$. Sum this bound, and then take the infimum over $\| t \| lt.eq X$ and the minimum over the finite character family. ◻
]

For a $1$-bounded multiplicative function $b$, define

$ cal(M) \( b \; X \, Q \) = inf_(\| t \| lt.eq X\
q lt.eq Q \, med chi med \( upright("mod") med q \)) D \( b \, chi n^(i t) \; X \)^2 . $

The following is the general exponential-sum theorem of Matomäki, Radziwiłł, and Tao, in its corrected version #cite(label("MRT15")) Theorem 1.7.

#thm([Theorem 2.7.])[
  (Averaged short exponential sums).  #emph[Let $X gt.eq D gt.eq 10$ and let $b : bb(N) arrow.r bb(C)$ be a $1$-bounded multiplicative function. With $Q = min \( \( log X \)^(1 \/ 125) \, \( log D \)^5 \)$, one has 
#[#set math.equation(numbering: n => "(2.24)")
 $ sup_(alpha in bb(R) \/ bb(Z)) integral_0^X lr(|sum_(y < m lt.eq y + D) b \( m \) upright(e) \( alpha m \)|) thin d y lt.double D X (e^(- cal(M) \( b \; X \, Q \) \/ 20) + frac(log log D, log D) + frac(1, \( log X \)^(1 \/ 700))) . $ <eq:mrt-input>]

 The implied constant is absolute.]
] <thm:mrt>

The interval endpoint convention does not affect the integral. For fixed $B$ and $D$, the characters of moduli at most $\( log D \)^5$ form a finite family. If $f_i$ is uniformly nonpretentious, 38 with $cal(P) = cal(C)$ gives $cal(M) \( b_i \; Y \, Q \) arrow.r oo$ uniformly in the twists (2.21). It follows that

#[#set math.equation(numbering: n => "(2.25)")
 $ limsup_(Y arrow.r oo) sup_(alpha \, t_i) frac(1, D Y) integral_0^Y lr(|sum_(y < m lt.eq y + D) b_i \( m \) upright(e) \( alpha m \)|) thin d y lt.double frac(log log D, log D) . $ <eq:mrt-fixed-length>]

Both the prime cutoff and the allowed height in the distance are $Y$, as in the hypothesis of 2. For real $Y$, apply 39 with $X = ceil.l Y ceil.r$ and enlarge the integral to $\[ 0 \, ceil.l Y ceil.r \]$; the normalization changes by a factor tending to $1$. Thus the hypothesis along integer scales is sufficient. The frequency supremum in (2.25) is outside the integral. No bound with that supremum inside the integral is used below.

===== 2.3.3 A rough-number Fourier multiplier <a-rough-number-fourier-multiplier>

To use (2.25) for (2.22), define

#[#set math.equation(numbering: n => "(2.26)")
 $ Q_M \( alpha \) = sum_(M < w lt.eq tau M) c_w / w upright(e) \( alpha h w \) . $ <eq:rough-multiplier>]

We need its maximum and its fourth moment. The coefficients are arbitrary; only their rough support will be used.

#thm([Lemma 2.8.])[
  (Rough-number bounds).  #emph[Fix $C_0 gt.eq 1$, $1 < tau < 2$, and an integer $h gt.eq 1$. Let $P_0 = exp \( B^(1 - epsilon) \)$, where $epsilon = 10^(- 4)$, and suppose $P_0 \/ tau lt.eq M lt.eq exp \( C_0 B \)$. If $\| c_w \| lt.eq 1$ and $c_w = 0$ unless $w in \( M \, tau M \]$ is $P_0$-rough, then, for all sufficiently large $B$, 
#[#set math.equation(numbering: n => "(2.27)")
 $ parallel Q_M parallel_oo & lt.double B^(- 1 + epsilon) log B \,\
integral_(bb(R) \/ bb(Z)) \| Q_M \( alpha \) \|^4 thin d alpha & lt.double M^(- 1) B^(- 4 + 4 epsilon) \( log B \)^6 . $ <eq:rough-sup>]

 The constants are uniform in $M$ and the coefficients.]
] <lem:rough-multiplier>

#proof[
  We give the sieve bounds including their counting errors. Put
  $ s = 2 ceil.l 100 log B ceil.r \, #h(2em) z_0 = P_0^(1 \/ \( 100 s \)) . $
  For every prime $p < z_0$, forbid $nu_p$ residue classes, where $0 lt.eq nu_p lt.eq 2$. If $r \( n \)$ is the number of these prime conditions satisfied by $n$, even inclusion-exclusion gives
  $ upright(bold(1))_(r \( n \) = 0) lt.eq sum_(j = 0)^s \( - 1 \)^j binom(r \( n \), j) . $
  Indeed, for $r > 0$ the sum on the right is $binom(r - 1, s) gt.eq 0$, and for $r = 0$ it is $1$. Write $E_j \( \( a_p \) \) = sum_(\| cal(I) \| = j) product_(p in cal(I)) a_p$ for the elementary symmetric sum over subsets of the primes $p < z_0$. The Chinese remainder theorem, applied on any interval $I$ of real length $V$, now yields
  #[#set math.equation(numbering: n => "(2.28)")
   $ \# { n in I : n upright(" avoids the forbidden classes") } lt.eq V sum_(j = 0)^s \( - 1 \)^j E_j \( \( nu_p \/ p \) \) + O (sum_(j = 0)^s E_j \( \( nu_p \) \)) . $ <eq:rough-brun>]
  The residue-counting error is independent of the position of $I$. It is at most
  $ \( s + 1 \) \( 2 z_0 \)^s = \( s + 1 \) 2^s P_0^(1 \/ 100) lt.eq P_0^(1 \/ 5) $
  for large $B$.
  Let $Lambda_0 = sum_(p < z_0) nu_p \/ p$. Mertens’ estimate gives $Lambda_0 lt.eq 2 log log z_0 + O \( 1 \) lt.eq 3 log B$ for large $B$. Since $E_j \( \( nu_p \/ p \) \) lt.eq Lambda_0^j \/ j !$, the difference between the truncated density in (2.28) and its full Euler product has absolute value at most
  $ sum_(j > s) frac(Lambda_0^j, j !) lt.eq frac(\( e Lambda_0 \/ \( s + 1 \) \)^(s + 1), 1 - Lambda_0 \/ \( s + 2 \)) lt.eq B^(- 10) . $
  Consequently the count in (2.28) is at most
  #[#set math.equation(numbering: n => "(2.29)")
   $ V (product_(p < z_0) \( 1 - nu_p \/ p \) + B^(- 10)) + O \( P_0^(1 \/ 5) \) . $ <eq:rough-sieve-bound>]
  For one rough integer, take $nu_p = 1$. The product is $O \( 1 \/ log z_0 \) = O \( B^(- 1 + epsilon) log B \)$. Thus the number $R$ of $P_0$-rough integers in $\( M \, tau M \]$ satisfies
  #[#set math.equation(numbering: n => "(2.30)")
   $ R lt.double M B^(- 1 + epsilon) log B . $ <eq:rough-one-point>]
  Both error terms in (2.29) are absorbed, since $M gt.eq P_0 \/ tau$.
  The one-point bound proves (2.27), because $w > M$. To estimate the fourth moment, extend $a_w = c_w \/ w$ by zero outside its support. Fourier orthogonality gives
  $ integral_(bb(R) \/ bb(Z)) \| Q_M \( alpha \) \|^4 thin d alpha = sum_k lr(|sum_w a_(w + k) overline(a_w)|)^2 . $
  There is no factor depending on $h$: multiplication by the nonzero integer $h$ preserves Haar measure on $bb(R) \/ bb(Z)$. Let $R_k$ count pairs $w \, w + k in \( M \, tau M \]$ that are both $P_0$-rough. Each inner absolute value is at most $R_k \/ M^2$. We next bound $R_k$ for $k eq.not 0$; only $\| k \| lt.eq 2 M$ can contribute. The permitted interval for $w$ is an intersection of two intervals of length less than $M$. Sieve out the residues $0 \, - k$ modulo $p < z_0$. If $k$ is odd there are no pairs for large $B$, because both rough integers must be odd. If $k$ is even, the density product is
  $ 1 / 2 product_(3 lt.eq p < z_0) \( 1 - 2 \/ p \) product_(3 lt.eq p < z_0\
p divides k) frac(1 - 1 \/ p, 1 - 2 \/ p) & lt.double frac(1, \( log z_0 \)^2) exp (sum_(p divides k) 1 / p + O \( 1 \)) . $
  Here $\( 1 - 2 \/ p \) \/ \( 1 - 1 \/ p \)^2 = 1 - 1 \/ \( p - 1 \)^2 lt.eq 1$ and $log \( \( 1 - 1 \/ p \) \/ \( 1 - 2 \/ p \) \) = 1 \/ p + O \( p^(- 2) \)$ for $p gt.eq 3$. The singular factor is uniformly $O_(C_0) \( log B \)$: indeed
  $ sum_(p divides k) 1 / p lt.eq sum_(p lt.eq B) 1 / p + frac(log \| k \|, B log B) lt.eq log log B + O_(C_0) \( 1 \) \, $
  since $log \| k \| lt.eq C_0 B + log 2$. Applying (2.29) proves
  #[#set math.equation(numbering: n => "(2.31)")
   $ R_k lt.double M B^(- 2 + 2 epsilon) \( log B \)^3 #h(2em) \( k eq.not 0 \) . $ <eq:rough-two-point>]
  There are $O \( M \)$ nonzero differences, so their total contribution is $O \( M^(- 1) B^(- 4 + 4 epsilon) \( log B \)^6 \)$ by (2.31). The term $k = 0$ is at most $\( R \/ M^2 \)^2 lt.double M^(- 2)$, which is smaller than the same bound because $M gt.eq P_0 \/ tau$. This proves (2.27). ◻
]

The fourth moment localizes the frequencies at which $Q_M$ is large. On the remaining frequencies its maximum is already small enough. We next put the target correlation into a form where these two facts can be combined with (2.25).

===== 2.3.4 Two overlapping intervals and the frequency split <two-overlapping-intervals-and-the-frequency-split>

Let

$ D_1 = ceil.l M ceil.r \, #h(2em) D_2 = \( 1 + 2 h \) D_1 \, $

and define

$ A_y \( alpha \) = sum_(y < n lt.eq y + D_1) b_1 \( n \) upright(e) \( alpha n \) \, #h(2em) B_y \( - alpha \) = sum_(y < m lt.eq y + D_2) b_2 \( m \) upright(e) \( - alpha m \) . $

For each term of $Q_M$, integration in $alpha$ imposes $m = n + h w$. Moreover $h w < 2 h D_1 = D_2 - D_1$, so

$ \[ n - D_1 \, n \) subset.eq \[ n + h w - D_2 \, n + h w \) . $

Thus, if $L_Y \( n \) = \| \[ 0 \, Y \] ∩ \[ n - D_1 \, n \) \|$, orthogonality gives the exact identity

$ integral_0^Y integral_(bb(R) \/ bb(Z)) Q_M \( alpha \) A_y \( alpha \) B_y \( - alpha \) thin d alpha thin d y = sum_w c_w / w sum_(n gt.eq 1) b_1 \( n \) b_2 \( n + h w \) L_Y \( n \) . $

For $D_1 lt.eq n lt.eq Y$ one has $L_Y \( n \) = D_1$. The difference from $D_1 upright(bold(1))_(1 lt.eq n lt.eq Y)$ is supported on $O \( D_1 \)$ integers at the two ends and has total absolute mass $O \( D_1^2 \)$. Since $sum_(M < w lt.eq tau M) 1 \/ w lt.double 1$, we obtain

#[#set math.equation(numbering: n => "(2.32)")
 $ & frac(1, D_1 Y) integral_0^Y integral_(bb(R) \/ bb(Z)) Q_M \( alpha \) A_y \( alpha \) B_y \( - alpha \) thin d alpha thin d y\
 & #h(10mm)  = 1 / Y sum_(n lt.eq Y) b_1 \( n \) sum_(M < w lt.eq tau M) c_w / w b_2 \( n + h w \) + O \( D_1 \/ Y \) . $ <eq:analytic-overlap>]

The endpoint error tends to zero because $D_1$ is fixed before $Y$.

Set $t_B = B^(- 1 - epsilon)$ and $E_B = { alpha in bb(R) \/ bb(Z) : \| Q_M \( alpha \) \| > t_B }$. By 40,

#[#set math.equation(numbering: n => "(2.33)")
 $ \| E_B \| lt.double M^(- 1) B^(8 epsilon) \( log B \)^6 \, #h(2em) parallel Q_M parallel_oo lt.double B^(- 1 + epsilon) log B . $ <eq:rough-large-frequencies>]

On $bb(R) \/ bb(Z) \\ E_B$, Parseval and Cauchy–Schwarz give, for each $y$,

$ integral_(bb(R) \/ bb(Z) \\ E_B) \| Q_M A_y B_y \| thin d alpha lt.eq t_B (integral_(bb(R) \/ bb(Z)) \| A_y \|^2)^(1 \/ 2) (integral_(bb(R) \/ bb(Z)) \| B_y \|^2)^(1 \/ 2) lt.eq t_B sqrt(D_1 D_2) . $

After integration in $y$ and division by $D_1 Y$, the contribution is $O_h \( B^(- 1 - epsilon) \)$.

On $E_B$, suppose first that $f_1$ is uniformly nonpretentious. Use $\| B_y \| lt.eq D_2$, integrate first in $y$, and apply (2.25) to $A_y$ at each fixed frequency. The normalized limsup is at most

#[#set math.equation(numbering: n => "(2.34)")
 $ O (parallel Q_M parallel_oo thin \| E_B \| thin D_2 frac(log log D_1, log D_1)) . $ <eq:analytic-large-bound>]

If instead $f_2$ is the nonpretentious factor, use $\| A_y \| lt.eq D_1$ and apply the same estimate to $B_y$; this replaces $D_1$ by $D_2$ inside the logarithms in (2.34). In both cases Fubini’s theorem is followed by the bound for the already integrated exponential sum, with a supremum over its fixed frequency. The frequency supremum has not been moved inside a short-interval integral.

The range (2.19) implies, for $i = 1 \, 2$,

$ D_i / M lt.double_h 1 \, #h(2em) frac(log log D_i, log D_i) lt.double_(C_0 \, h \, tau) B^(- 1 + epsilon) log B . $

Using (2.33) in (2.34), the large-frequency contribution is

$ O (B^(- 2 + 10 epsilon) \( log B \)^8) = o \( B^(- 1 - epsilon) \) \, $

since $11 epsilon < 1$. Together with the small-frequency bound and (2.32), this proves (2.22). The argument is uniform in the Fourier twists, since (2.25) is uniform in them.

#proof[
  #emph[Completion of 37.] Apply (2.22) with $c_w = c_w^(\( u \))$ to each fixed $u$ in the expansion at the start of this section. Dividing its contribution by $X$ contributes the factor $A^(omega_C \( u \)) \/ u$; the extracted factors $f_1 \( u \) f_2 \( u \)$ have modulus at most $1$. The two Fourier inversions cost at most $parallel hat(phi.alt) parallel_1^2$. At fixed $B$ all sums over $u \, w$ are finite, and the uniform estimate therefore gives, by (2.20), a total limsup $O \( L_0 B^(- 1 - epsilon) \)$. Adding the earlier coprimality error $O \( L_0 J \/ P_0 \)$ proves (2.17). ◻
]

The analytic comparison required for (2.18) is now proved. It remains to establish the graph estimate; the following sections develop its closed-line bound and then pass from that bound to the long-average estimate.

==== 2.4 Forbidden paths and arithmetic savings <sec:paths>

We now prove the graph estimate stated in 33. Its main input is a bound for closed walks after deleting a sparse periodic set of vertices. In this section we define that set and establish the arithmetic estimates used to discard exceptional walks. The parameters and kernels are those of 1. In the graph proof, $B$ tends to infinity with $h \, tau \, C_0 \, T$ fixed.

Deleting vertices that support short prohibited paths is part of the divisibility-graph method of #cite(label("HR21")) Section 4, developed for composite labels in #cite(label("Pilatte26")) Sections 7 and 13.1. We use primitive specifications with an extra prime coordinate and prove the resulting density and arithmetic bounds for the present graph.

Put

#[#set math.equation(numbering: n => "(2.35)")
 $ ell = 2 floor.l B floor.r \, #h(2em) L = floor.l B^(1 - rho) floor.r \, #h(2em) t_0 = ceil.l B^(4 epsilon) ceil.r . $ <eq:trace-parameters>]

A #emph[closed line] is a list of signs and labels $bold(d) = \( \( epsilon_i \, d_i \) \)_(i = 1)^ell$, where $epsilon_i in { - 1 \, 1 }$, $d_i in cal(D)$, and the offsets

$ b_0 = 0 \, #h(2em) b_j = sum_(i = 1)^j epsilon_i h d_i quad \( 1 lt.eq j lt.eq ell \) $

satisfy $b_ell = 0$. Repeated offsets are allowed. Define its normalized product by

#[#set math.equation(numbering: n => "(2.36)")
 $ K_(bold(d)) \( n \) = product_(i = 1)^ell frac(g_(d_i) \( n + b_(i - 1) \, n + b_i \), W \( n + b_(i - 1) \)) . $ <eq:trace-kernel>]

At each $B$, all residue expectations below are on the finite product probability space of 1.

===== 2.4.1 The deleted vertices <the-deleted-vertices>

#prodef([Definition 2.9.])[
  (Path specifications).  A specification consists of a path with distinct integer offsets $z_0 = 0 \, z_1 \, dots.h \, z_m$, where $1 lt.eq m lt.eq L$ and
  $ z_i - z_(i - 1) = epsilon_i h e_i \, #h(2em) e_i in cal(D) \, quad epsilon_i in { - 1 \, 1 } \, $
  an extra prime $p in cal(S)$ dividing none of the $e_i$, and an index $i_0 in { 1 \, dots.h \, m }$ such that $p divides z_m - z_(i_0 - 1)$. It #emph[qualifies at $x$] when
  $ p divides x \, #h(2em) e_i divides x + z_(i - 1) quad \( 1 lt.eq i lt.eq m \) . $
  Its prime support $Pi$ is the union of ${ p }$ and the prime factors of all its edge labels. Its #emph[cylinder] is the set of starting integers $x$ satisfying these qualification conditions. The cylinder is either empty or fixes one residue at each prime in $Pi$; in the latter case its measure is $product_(q in Pi) q^(- 1)$.
  When testing a contiguous subpath as a specification, translate its offsets to start at zero. If it starts at $z_a$, test qualification at $x + z_a$. For the reversed subpath, use the same convention with its new initial vertex. The extra prime may be any member of $Pi$ absent from the subpath’s edge labels. All these tests are constant as $x$ ranges over a nonempty original cylinder, since they use only its fixed prime coordinates.
  A specification is #emph[primitive] if its cylinder is nonempty and no shorter nonempty contiguous subpath, in either orientation, can be made into a specification, with an extra prime from $Pi$, that qualifies at its own initial vertex for $x$ in that cylinder. Set
  $ Y = { x in bb(Z) : upright("no primitive specification qualifies at ") x } . $
] <def:primitive-specification>

The set $Y$ is periodic modulo $product_(p in cal(S)) p$. For a path translated to start at $x$, a prime $q$ is #emph[active] at its $i$th vertex when $q divides x + z_i$.

#thm([Lemma 2.10.])[
  (Descent to a primitive path).  #emph[If a specification qualifies, a primitive specification using only its prime support qualifies at one of its path vertices, along a contiguous subpath in one of the two orientations.]
] <lem:primitive-descent>

#proof[
  Full edge divisibility survives reversal: $e divides x$ and $x' = x plus.minus h e$ imply $e divides x'$. For a candidate subpath all residue tests are constant on the original cylinder, since they involve only its fixed prime coordinates. If the current specification is not primitive, take a shorter qualifying contiguous subpath in an allowed orientation. Its support is contained in the preceding support. The positive length strictly decreases, so the procedure terminates. ◻
]

We shall prove the following estimate. Its density assertion is proved immediately; the closed-line bound is completed in 7.

#thm([Theorem 2.11.])[
  (High trace).  #emph[For the divisor family, cutoffs, and kernels of 1, the periodic set $Y$ in 41 satisfies, as $B arrow.r oo$, 
#[#set math.equation(numbering: n => "(2.37)")
 $ bb(P) \( n in.not Y \) & lt.eq P_0^(- 1 + o \( 1 \)) \,\
sum_(bold(d)) lr(|bb(E) K_(bold(d)) \( n \) product_(j = 0)^ell upright(bold(1))_Y \( n + b_j \)|) & lt.eq B^(- \( 1 + c_(*) \) ell) . $ <eq:deleted-density>]

 The sum is over all closed lines of length $ell$. The asymptotic bounds are uniform over the admissible divisor families and cutoffs, with $h \, tau \, C_0 \, T$ fixed.]
] <thm:high-trace>

#thm([Lemma 2.12.])[
  (Density of the deleted set).  #emph[The set $Y$ satisfies (2.37).]
] <lem:bad-density>

#proof[
  It suffices to count all qualifying specifications. For fixed edge labels, signs, and suffix, its displacement $D = z_m - z_(i_0 - 1)$ is nonzero because the path vertices are distinct, and $\| D \| lt.eq L h tau H$. Sum the extra prime first, keeping these numerical edge labels fixed. Since $p > P_0$,
  $ sum_(p in cal(S) thin \, med p divides D) 1 / p lt.eq frac(log \( \| D \| + 2 \), P_0 log 2) lt.double frac(log \( L h tau H + 2 \), P_0) . $
  The support weight for the remaining distinct edge primes is the product of their reciprocals. There are at most $L J$ edge-prime slots. Choosing the length, signs, suffix, factor counts, and a partition of these slots into equality classes costs $exp \( O \( L J log B \) \)$. Indeed a partition of at most $L J$ slots has at most $\( L J \)^(L J)$ descriptions. Summing each remaining class over its prime values costs at most $v_C + v_Z$, or $1 + v_C + v_Z$ as a uniform upper bound. At this point we may drop all bin and distinctness restrictions in those positive sums. The resulting bound is
  $ bb(P) \( n in.not Y \) lt.eq P_0^(- 1) exp #scale(x: 120%, y: 120%)[\(] O \( L J log B \) + O \( L J log log B \) + O \( log B \) #scale(x: 120%, y: 120%)[\)] . $
  Since $L J log B = O \( B^(1 - rho) log^2 B \) = o \( log P_0 \)$, this proves the assertion. ◻
]

The deletion also provides useful constraints on the labels of a primitive path. The next lemma identifies coefficients that remain invertible even when a prime divides several edge labels.

#thm([Lemma 2.13.])[
  (Prime intervals and the last constant block).  #emph[For sufficiently large $B$, let a primitive specification have edge labels $e_1 \, dots.h \, e_m$, extra prime $p$, and suffix ending at $m$. Then the following statements hold.]
  + #emph[For every edge prime $q$, the indices $i$ with $q divides e_i$ form an interval of consecutive indices.]
  + #emph[Let $b$ be the first index of the final maximal constant block $e_b = dots.h.c = e_m$. Then $b > 1$, the signs on this block are constant, and there exists $r divides e_b$ with $r divides.not e_(b - 1)$. Every such $r$ occurs only in the constant tail. In the specified suffix displacement, its coefficient as a prime variable is nonzero modulo $p$. This coefficient assertion holds for any edge prime whose occurrences are confined to that tail.]
  + #emph[If $q$ occurs before $b$ and $r$ is as in the preceding part, the coefficient of $q$ in $z_(b - 1) - z_0$ is nonzero modulo $r$.]
  #emph[Coefficients here are obtained by fixing all other distinct prime values; squarefreeness makes each displacement linear in the prime being varied.]
] <lem:primitive-properties>

#proof[
  Suppose successive occurrence blocks of $q$ are separated by edges not containing $q$. The intervening path begins and ends at active vertices for $q$, since adjacent qualifying $q$-edges have divisible endpoints. It is a shorter simple $q$-free path with nonzero total displacement divisible by $q$. With extra prime $q$ and its whole path as suffix, it contradicts primitivity. This proves the first part.
  Within a constant-label block, an adjacent change of sign would repeat a vertex, so all signs agree. If $b = 1$, the prescribed suffix displacement is $plus.minus k h e_m$ for some $1 lt.eq k lt.eq L$. The prime $p$ divides neither $e_m$ nor $h$, and $p > L$, so this is impossible. Thus $b > 1$. The unequal squarefree labels $e_b \, e_(b - 1)$ lie in one bin of ratio less than $2$. If every prime of $e_b$ divided $e_(b - 1)$, their quotient would be an integer at least $2$, a contradiction. Choose $r divides e_b$ absent from $e_(b - 1)$. By the first part it is absent from the entire prefix. Its coefficient in the suffix is
  $ plus.minus k h e_b / r \, #h(2em) 1 lt.eq k lt.eq L . $
  This is nonzero modulo $p$, because $p > h \, L$ and $p$ divides none of the edge labels. The same reasoning applies to every prime confined to the tail.
  Finally, intersect the occurrence interval of $q$ with the prefix $1 \, dots.h \, b - 1$. The resulting nonempty interval is $i \, dots.h \, j$; in particular, $j = b - 1$ if $q$ also occurs in the tail. The sum of these prefix terms is $S = z_j - z_(i - 1) eq.not 0$. If $r divides S$, reverse the path from $z_(b - 1)$ to $z_(i - 1)$. Its edges avoid $r$, it starts at a vertex active for $r$, and its suffix from $z_j$ to $z_(i - 1)$ has displacement divisible by $r$. Full divisibility survives reversal. This shorter qualifying specification contradicts primitivity. Since $q eq.not r$ and $S$ is $q$ times the asserted coefficient, that coefficient is invertible modulo $r$. ◻
]

===== 2.4.2 Absolute counts and triangular constraints <absolute-counts-and-triangular-constraints>

We next record a deliberately coarse counting estimate. It is used only when an additional arithmetic saving makes an entire class negligible. The main contribution in 7 will require a more economical enumeration.

For a line occurrence $\( i \, p \)$, $p divides d_i$, call it #emph[lit] if $p divides n + b_(i - 1)$ and #emph[unlit] otherwise. The condition is the same at the arrival vertex. We may attach a specification at a line vertex $n + b_j$; qualification then refers to that starting point. A #emph[slot pattern] records the factor counts of all edge labels, their signs, their bands, equality classes of prime slots, and the lengths, attachments, extra-prime slots, and suffix indices of attached specifications. Distinct classes represent distinct prime variables. The pattern may also specify line occurrence statuses and a tree on the visited vertices whose edges are recorded line steps.

#thm([Lemma 2.14.])[
  (Absolute reciprocal counting).  #emph[Consider a line of length $ell$ together with at most $2 t_0$ attached qualifying specifications, each of length at most $L$. Refine its slot pattern by recording the lit or unlit status of every line occurrence. There are $exp \( O \( B log^2 B \) \)$ slot patterns, including signs, attachments, occurrence statuses, and recorded vertex identifications. For each assigned pattern and its numerical prime values, let $frak(A)$ be its attached specifications and let $E$ be any residue event imposing the recorded occurrence statuses, possibly with further restrictions. Then 
#[#set math.equation(numbering: n => "(2.38)")
 $ bb(E) [\| K_(bold(d)) \( n \) \| upright(bold(1))_E \( n \) product_(sigma in frak(A)) upright(bold(1))_({ sigma upright(" qualifies at its assigned vertex") })] lt.eq A^(ell J) product_(p upright(" used")) 1 / p . $ <eq:absolute-pattern-majorant>]

 If the recorded statuses include at least $t_0$ unlit occurrences among center primes occurring at least twice on the line, this majorant has the additional factor $P_0^(- t_0 \/ 2)$. The total contribution of that class, summed over all patterns and numerical assignments, is $O \( exp \( - B^(1 + epsilon \/ 2) \) \)$.]
] <lem:crude-count>

#proof[
  The number of slots is at most
  $ ell J + 2 t_0 \( L J + 1 \) = O \( B log B \) \, $
  since $4 epsilon < rho$. A partition of $R$ slots has at most $R^R$ descriptions. All further indices have polynomially many choices in $B$ per slot or per recorded vertex, giving the stated entropy. Recording the destination of each step among at most $ell + 1$ vertices includes possible vertex identifications and any chosen tree of recorded steps within the same bound.
  Drop the cutoffs and $W^(- 1)$, which lie in $\[ 0 \, 1 \]$. The powers of $A$ from core occurrences are at most $A^(ell J)$. A lit occurrence of $p$, or qualification of any attached specification using $p$, fixes its residue and supplies at most $1 \/ p$. In the absence of either, $p$ appears only on unlit line occurrences. An unlit core occurrence vanishes; each unlit center occurrence supplies $theta \/ p$, so at least one factor $1 \/ p$ is still available. The remaining conditions may be discarded after taking these positive primewise bounds. Independence of the prime residue coordinates proves (2.38).
  If a repeated center prime has a lit occurrence, every unlit occurrence supplies an additional reciprocal beyond the residue probability. If all its $m gt.eq 2$ line occurrences are unlit, they supply $p^(- m)$, saving at least $p^(- \( m - 1 \))$ beyond the displayed majorant; here $m - 1 gt.eq m \/ 2$. Additional qualification conditions can only improve the estimate. At least $t_0$ repeated-unlit occurrences therefore save $P_0^(- t_0 \/ 2)$.
  For each unrestricted prime variable its reciprocal sum is at most $1 + v_C + v_Z = O \( 1 + log B \)$. Thus the total before the extra saving is $exp \( O \( B log^2 B \) \)$, including $A^(ell J)$. The saving has logarithm at most $- 1 / 2 B^(1 + 3 epsilon)$, which proves the last assertion for sufficiently large $B$. ◻
]

The next lemma is the arithmetic alternative to having many unlit occurrences. Its ordering hypothesis is essential: all selected prime values cannot be summed independently without examining their dependencies.

#thm([Lemma 2.15.])[
  (Triangular arithmetic saving).  #emph[In the positive count of 46, suppose every configuration under consideration supplies at least $B^(2 epsilon)$ distinct prime variables $q_1 \, dots.h \, q_k$ and tests with the following properties. Test $j$ uses only $q_j$, the earlier variables $q_1 \, dots.h \, q_(j - 1)$, and nonselected variables, and is either]
  + #emph[$q_j divides D_j$, where $D_j eq.not 0$ is independent of $q_j$ and $log \( \| D_j \| + 2 \) = O \( B log B \)$; or]
  + #emph[$a_j q_j + c_j equiv 0 med \( mod med r_j \)$, where $a_j \, c_j \, r_j$ are independent of $q_j$, $r_j$ is an earlier or nonselected prime variable, and $a_j equiv.not 0 med \( mod med r_j \)$.]
  #emph[Assume the choices of tests and their order have $exp \( O \( B log^2 B \) \)$ descriptions. Then their total absolute contribution, also allowing the attached specifications in 46, is 
#[#set math.equation(numbering: n => "(2.39)")
 $ O #scale(x: 120%, y: 120%)[\(] exp \( - B^(1 + epsilon \/ 2) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:negligible-constraints>]

 The description bound applies in particular when each test uses a bounded number of displacements along contiguous line or attached paths, or along paths in a recorded tree of line steps, together with one common specified integer offset of size $O \( ell H \)$.]
] <lem:triangular-saving>

#proof[
  Fix the nonselected variables. For the first type of test,
  $ sum_(q in cal(S) thin \, med q divides D_j) 1 / q lt.eq frac(log \( \| D_j \| + 2 \), P_0 log 2) lt.double frac(B log B, P_0) . $
  For the second type, invertibility leaves one residue class modulo $r_j$. Comparison with the integral of $1 \/ x$ along that progression gives, even when the sum is enlarged from primes to integers,
  $ sum_(P_0 < n lt.eq e^B\
n equiv a_0 med \( mod med r_j \)) 1 / n lt.eq 1 / P_0 + frac(B - log P_0, r_j) lt.eq frac(1 + B, P_0) . $
  The bound includes the zero residue class.
  Sum the selected variables in the order $q_k \, q_(k - 1) \, dots.h \, q_1$. When summing $q_j$, every remaining earlier test is independent of it, and its own test has one of the preceding uniform bounds. The conditions $D_j eq.not 0$ and $a_j equiv.not 0 med \( mod med r_j \)$ are retained through this elimination. If either fails for fixed earlier data, the admissible inner sum is zero. Numerical distinctness may also be retained; dropping it is unnecessary for the progression bound. Backward induction therefore gives a factor
  $ (frac(O \( B log B \), P_0))^k . $
  The other prime sums and all descriptions cost $exp \( O \( B log^2 B \) \)$. Since $k log P_0 gt.eq B^(1 + epsilon)$, their product satisfies (2.39).
  We verify the final description convention. There are $O \( B log B \)$ slots and polynomially many recorded positions or vertices. A bounded number of paths per test is specified by its endpoints and type, together with a choice of prime variables and order; choosing at most the number of slots many tests costs $exp \( O \( B log^2 B \) \)$. The common integer offset has $O \( ell H + 1 \) = exp \( O \( B \) \)$ possible values. After fixing it we may drop the equation that originally identifies it with a difference of tree offsets, since we are taking an upper bound. Each edge product under arbitrary slot assignments is at most $e^(B J)$. Hence every indicated bounded sum of path displacements still has logarithmic size $O \( B log B \)$, even after the original divisor-bin restrictions have been relaxed. Nonzero and invertibility tests are never relaxed. ◻
]

These estimates dispose of any class with sufficiently many independent arithmetic restrictions. We next use the tree formed by first visits to find those restrictions and describe what remains.

==== 2.5 Connected activity on the first-visit tree <sec:thinning>

We use the arithmetic estimates of 4 to simplify the closed lines contributing to the high trace. The restrictions will depend only on the numerical line and a specified set of residue coordinates. They will leave the residue of every center prime occurring only once on the line free for the later signed average.

===== 2.5.1 The first-visit tree and active vertices <the-first-visit-tree-and-active-vertices>

For a closed line $bold(d)$, construct a rooted tree $cal(T)$ on its distinct offsets as follows. Start at $b_0 = 0$. Whenever a step reaches an offset not visited previously, add that vertex and join it to the current vertex by the step just taken. Every other step is a #emph[return]. Write $r_(*)$ for the number of returns, and $b \( v \)$ for the integer offset of a tree vertex $v$. Thus $\| E \( cal(T) \) \| = ell - r_(*)$ and all $b \( v \)$ are distinct. Tree edges inherit their labels and signs from their adding steps. A #emph[tree prime] is a prime dividing a tree-edge label. 2 shows a six-step example.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$0$], frame: "circle", padding: 0.07056cm, stroke: (thickness: 0.8pt, miter-limit: 10))
  content((2.1, 0), [$u$], frame: "circle", padding: 0.07056cm, stroke: (thickness: 0.8pt, miter-limit: 10))
  content((4.3, 1), [$v$], frame: "circle", padding: 0.07056cm, stroke: (thickness: 0.8pt, miter-limit: 10))
  content((4.3, -1), [$w$], frame: "circle", padding: 0.07056cm, stroke: (thickness: 0.8pt, miter-limit: 10))
  bezier((0, 0), (2.1, 0), (0.8011, 0.1703), (1.299, 0.1703), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1.05, 0.1277), [$1$], anchor: "south", padding: 0.1176cm)
  bezier((2.1, 0), (0, 0), (1.299, -0.1703), (0.8011, -0.1703), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: black)))
  content((1.05, -0.1277), [$6$], anchor: "north", padding: 0.1176cm)
  bezier((2.1, 0), (4.3, 1), (2.858, 0.5599), (3.38, 0.7969), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.139, 0.6338), [$2$], anchor: "south", padding: 0.1176cm)
  bezier((4.3, 1), (2.1, 0), (3.542, 0.4401), (3.02, 0.2031), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: black)))
  content((3.766, 0.6361), [$3$], anchor: "north", padding: 0.1176cm)
  bezier((2.1, 0), (4.3, -1), (2.858, -0.5599), (3.38, -0.7969), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.139, -0.6338), [$4$], anchor: "north", padding: 0.1176cm)
  bezier((4.3, -1), (2.1, 0), (3.542, -0.4401), (3.02, -0.2031), stroke: (thickness: 0.8pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: black)))
  content((3.766, -0.6361), [$5$], anchor: "south", padding: 0.1176cm)
})],
  caption: [Figure 2: First visits (solid) and returns (dashed) in the walk $0 arrow.r u arrow.r v arrow.r u arrow.r w arrow.r u arrow.r 0$. Numbers give the chronological step indices. The three solid edges form the first-visit tree. This diagram records only the walk topology. ],
) <fig:first-visit-tree>

Recall that an occurrence $\( i \, p \)$ is lit when $p divides n + b_(i - 1)$. Set

#[#set math.equation(numbering: n => "(2.40)")
 $ cal(F) = { p : med p upright(" occurs on the line and either ") p in cal(C) upright(" or ") p upright(" occurs at least twice") } . $ <eq:fixed-line-labels>]

Write $n_(cal(F))$ for these residue coordinates. We allow our restrictions to depend on $n_(cal(F))$ and call the primes in $cal(F)$ the #emph[fixed labels]. Here “fixed” refers to the residues: the numerical line already specifies every prime value. The set includes core primes occurring once on the line, but excludes background core primes absent from it. For a fixed tree prime $p$, define its active vertices by

$ V_p = { v in V \( cal(T) \) : p divides n + b \( v \) } . $

The connected components of $V_p$ are those of the induced subgraph on these vertices. Adjacent active vertices force $p$ to divide their edge label, since $p divides.not h$ for sufficiently large $B$.

A tree prime $p in.not cal(F)$ is a center prime occurring on exactly one step of the entire line. Let $e_p$ denote its tree edge. Call it #emph[corrupted] if a tree vertex other than the endpoints of $e_p$ has an offset congruent to those endpoints modulo $p$. This is a condition on the numerical line alone.

#thm([Proposition 2.16.])[
  (Retained configurations).  #emph[For each closed line there is a predicate $R_(bold(d)) \( n_(cal(F)) \) in { 0 \, 1 }$ with the following properties. Whenever it equals one:]
  + #emph[all core line occurrences are lit; no primitive specification with support contained in $cal(F)$ qualifies at a trace vertex; and fewer than $t_0$ repeated center occurrences are unlit;]
  + #emph[every fixed tree prime has $O \( B^rho \)$ active components; fewer than $B^(1 - 2 rho)$ fixed tree primes have more than one active component;]
  + #emph[fewer than $B^(1 - 2 rho)$ nonfixed tree primes are corrupted.]
  #emph[The implicit constant is uniform in the line. Moreover, 
#[#set math.equation(numbering: n => "(2.41)")
 $ sum_(bold(d)) bb(E) [\| K_(bold(d)) \( n \) \| product_(j = 0)^ell upright(bold(1))_Y \( n + b_j \) \( 1 - R_(bold(d)) \( n_(cal(F)) \) \)] lt.double exp \( - B^(1 + epsilon \/ 2) \) . $ <eq:retained-line-error>]

 The same exceptional estimates used in this proof remain valid after adding the qualification indicators of at most $2 t_0$ specifications and summing their recorded data, for the classes discarded by an arithmetic saving. Configurations excluded because of a fixed forbidden specification instead vanish with the original $Y$ factors.]
] <prop:retained-lines>

We prove the proposition in three stages. First we make active sets connected on a small number of blocks. Then a two-block argument rules out many disconnected fixed labels. Finally we handle the accidental offset coincidences of singleton labels.

===== 2.5.2 Short gaps and connected blocks <short-gaps-and-connected-blocks>

#thm([Lemma 2.17.])[
  (Hitting paths in a forest).  #emph[Let a finite forest carry a finite family of nonempty edge paths. If the family has no $t$ pairwise edge-disjoint paths, some set of fewer than $2 t$ edges meets every path in the family.]
] <lem:forest-path-hitting>

#proof[
  Root each component. The top of a path is its vertex nearest that root. Choose a path whose top has maximum depth, and mark its one or two edges incident with the top. Every path sharing an edge with the chosen path must contain a marked edge. Indeed, a path sharing an edge below a mark and avoiding that mark remains wholly in the component below it; its top would be strictly deeper. Remove the paths hit by the marks and repeat. The paths chosen at successive stages are pairwise edge-disjoint. There are fewer than $t$ stages, so fewer than $2 t$ marked edges suffice. ◻
]

#thm([Lemma 2.18.])[
  (Connected activity on blocks).  #emph[Except for configurations of zero contribution in (2.41) or total absolute contribution $O \( exp \( - B^(1 + epsilon \/ 2) \) \)$, one can cut $O \( t_0 \)$ edges of the first-visit tree and cover the resulting forest by $O \( B^rho \)$ connected blocks of diameter at most $L$. The blocks cover every remaining edge and every vertex of the original tree. In each block, the active set of every fixed tree prime is connected or empty. Consequently each fixed tree prime has $O \( B^rho \)$ whole-tree active components.]
] <lem:activity-blocks>

#proof[
  An unlit core occurrence makes $K_(bold(d)) = 0$. A primitive specification supported on $cal(F)$ and qualifying at a trace vertex makes the corresponding $Y$ factor zero for every remaining coordinate assignment. Discard these configurations. By 46, those with at least $t_0$ unlit repeated center occurrences have the asserted negligible total. Each of these decisions uses only the line and $n_(cal(F))$.
  Cut every tree edge having an unlit fixed occurrence. There are fewer than $t_0$ such edges. In the remaining forest a #emph[gap for $p$] is a path of length at most $L$ with active endpoints and at least one interior vertex, all interior vertices being inactive, for a fixed tree prime $p$. Such a gap has no $p$-edge: an active endpoint of a $p$-edge forces its other endpoint to be active, while a $p$-edge with inactive endpoints was cut.
  Every gap contains a nonfixed prime label. Otherwise all its edge labels are fixed and lit, so the path is fully divisible. Its nonzero total displacement is divisible by $p$, and its edges avoid $p$. Taking extra prime $p$ and the whole path as suffix gives a qualifying specification. By 42, a primitive one with fixed support qualifies at a vertex of that tree path. Every tree vertex is a trace vertex, contrary to the preceding exclusion.
  If there are $t_0$ edge-disjoint gaps, choose a nonfixed prime $q$ on each. Each chosen prime occurs once on the full line, hence nowhere on the other selected gaps. The displacement of its gap is linear in $q$ modulo the corresponding fixed prime $p$, with coefficient $plus.minus h$ times the other prime factors of that edge. This coefficient is invertible modulo $p$, since the gap is $p$-free and $p divides.not h$. The selected constraints do not involve one another’s variables. Their paths and variables have the description cost of 47, which discards this class. The inequality $t_0 gt.eq B^(2 epsilon)$ holds for large $B$.
  Otherwise 49 supplies fewer than $2 t_0$ further cuts meeting every gap. For each remaining piece traverse every edge twice and split that traversal into segments of at most $L$ steps. The edges and vertices in a segment form a connected subtree of diameter at most $L$; include a singleton block for a piece with no edges. There are
  $ O \( ell \/ L + t_0 + 1 \) = O \( B^rho \) $
  blocks. They may overlap. Any two active vertices in a block have their joining path inside that block. An inactive portion on it would give a surviving short gap, impossible after the cuts. Thus activity is connected or empty on each block. Each block meets at most one whole-tree active component, and every such component has a vertex in a block. This proves the component bound. ◻
]

===== 2.5.3 Comparing two blocks <comparing-two-blocks>

The active sets are now connected within each block. To compare different components for a fixed prime $p$, suppose blocks $1$ and $2$ meet those components. Choose a root $c_j$ in block $j$ and an active representative $x_p^j$ there. Since the representatives have distinct integer offsets,

#[#set math.equation(numbering: n => "(2.42)")
 $ p divides K + #scale(x: 120%, y: 120%)[\(] b \( x_p^2 \) - b \( c_2 \) #scale(x: 120%, y: 120%)[\)] - #scale(x: 120%, y: 120%)[\(] b \( x_p^1 \) - b \( c_1 \) #scale(x: 120%, y: 120%)[\)] eq.not 0 \, #h(2em) K = b \( c_2 \) - b \( c_1 \) . $ <eq:two-block-constraint>]

To apply the divisibility case of 47, we seek roots and representatives for which both local paths contain no edge label divisible by $p$. For many selected primes at once, we also need a common order in which every selected prime appearing on either path comes earlier than $p$. Once $K$ is specified separately, these conditions give the required triangular dependence. The next lemma supplies the choices.

#thm([Lemma 2.19.])[
  (Rerooting two blocks).  #emph[Let two connected blocks of a tree and $m$ distinct prime indices $p$ be given. For each index let $V_p$ be a vertex subset, and let $A_p^j$ be its intersection with block $j$. Suppose these intersections are nonempty and connected. Edges have labels containing at most $J$ prime factors. In either block, an edge has both endpoints in $A_p^j$ if and only if its label contains $p$. Assume also that $A_p^1$ and $A_p^2$ lie in distinct components of the subgraph induced by $V_p$ in the whole tree.]
  #emph[There are roots $c_j$ in block $j$, a set of $gt.double m^(1 \/ 8) \/ \( 2 J + 1 \)$ retained indices, and an order on those indices with the following property. If $x_p^j$ is the nearest vertex of $A_p^j$ to $c_j$, both paths from $c_j$ to $x_p^j$ avoid $p$, and any retained prime label on either path occurs earlier in the order. The two representatives $x_p^1 \, x_p^2$ are distinct.]
] <lem:reroot-constraints>

#proof[
  Start with arbitrary roots. A connected vertex set in a tree contains the entire path between any two of its vertices. It therefore has a unique nearest vertex to a chosen root. The root-to-$x_p^j$ path avoids $p$-edges. If a retained label $q$ occurs on this path, both ends of its edge lie in $A_q^j$; the nearest vertex $x_q^j$ is then a strict ancestor of $x_p^j$. Thus dependencies are contained in the two strict ancestor orders. Indices with equal nearest points are incomparable.
  Every finite partially ordered set with $u$ elements has a chain or an antichain of size at least $sqrt(u)$: partition its elements by the length of a longest chain ending there. Apply this to the first ancestor order. If an antichain is obtained, there are no dependencies from block 1 among its indices, so depth order in block 2 suffices. Otherwise apply the same argument in block 2 on the selected chain. An antichain there similarly suffices. In the remaining case we have chains in both blocks with at least $m^(1 \/ 4)$ indices. The Erdős–Szekeres monotone-subsequence theorem #cite(label("ErdosSzekeres1935")) p. 467 shows that two total orders have a common agreeing or reversed subsequence of size at least the square root of their length. To recall the elementary argument, assign to each position the lengths of the longest increasing and decreasing subsequences ending there. Two positions have different pairs, so if both lengths are less than $sqrt(u)$ there cannot be $u$ positions. We thus retain at least a constant times $m^(1 \/ 8)$ indices. Agreeing orders already give the conclusion.
  Suppose the orders are reversed. In block 2 take the segment from its root to the farthest selected $x_p^2$. The intersection of each $A_p^2$ with that segment is a closed vertex interval beginning at $x_p^2$; these left endpoints are distinct. At a vertex of the segment, each positive-length interval containing it contains an incident segment edge. Each of the at most two such edges has at most $J$ prime factors. At most one interval can consist of that vertex alone. Hence at most $2 J + 1$ intervals overlap at a vertex. Greedily coloring closed intervals in order of their left endpoints uses at most $2 J + 1$ colors: an existing color is available only if its preceding right endpoint is strictly earlier than the new left endpoint. One color retains at least a $1 \/ \( 2 J + 1 \)$ fraction of pairwise vertex-disjoint intervals.
  Reroot block 2 at the far end of the segment. The nearest point of $A_p^2$ is now the right endpoint of its interval. Indeed, for any vertex of $A_p^2$ off the segment, its projection onto the segment lies in that interval, because the path from $x_p^2$ to the vertex lies in $A_p^2$. The path from the new root first reaches $A_p^2$ at the right endpoint. This also proves that off-segment branches cannot change the nearest point.
  The right endpoints of vertex-disjoint intervals have the same order as their left endpoints along the original segment. Seen from its other end, that order reverses. The two block orders therefore agree after rerooting. The first paragraph applies to the new root as well and proves the dependency assertion. Each representative stayed in the same whole-tree component for its prime, so the two representatives for that prime are still distinct. ◻
]

#thm([Lemma 2.20.])[
  (Few disconnected fixed labels).  #emph[Among the configurations retained by 50, those with at least $B^(1 - 2 rho)$ fixed tree primes having multiple active components have total absolute contribution $O \( exp \( - B^(1 + epsilon \/ 2) \) \)$.]
] <lem:few-disconnected>

#proof[
  For every such prime choose two blocks meeting distinct whole-tree active components. There are $O \( B^(2 rho) \)$ ordered block pairs, so one pair serves $m gt.double B^(1 - 4 rho)$ primes. Inside each block, the active set is nonempty and connected. Every edge carrying a fixed prime has active endpoints after the earlier cuts, and the converse follows from $p divides.not h$. Apply 51 and then specify the common integer
  $ K = b \( c_2 \) - b \( c_1 \) \, #h(2em) \| K \| = O \( ell H \) . $
  Each retained prime gives the test (2.42). The expression is independent of $p$, since both local paths avoid it. It involves only earlier retained variables by the lemma. Its nonvanishing follows from distinctness of the two representatives and the distinct integer offsets of tree vertices. The number of tests is
  $ gt.double B^(\( 1 - 4 rho \) \/ 8) / J = frac(B^(1 \/ 10), O \( log B \)) > B^(2 epsilon) $
  for large $B$.
  Roots, endpoints, and prime choices can be recorded with the entropy allowed in 47. Choose $K$ only after the rerooting; its $O \( ell H + 1 \)$ possibilities cost $exp \( O \( B \) \)$. Although its original value depends on the labels, fixing it and dropping that defining equation enlarges a positive sum. The local path expressions then have the required triangular dependence. Retain their nonzero tests under this enlargement and apply 47. ◻
]

===== 2.5.4 Accidental coincidences of singleton labels <accidental-coincidences-of-singleton-labels>

The preceding argument concerned fixed residue coordinates. A nonfixed tree prime requires a different test: its residue must remain free, so we use only numerical coincidences between offsets.

#thm([Lemma 2.21.])[
  (Few corrupted singleton labels).  #emph[Lines having at least $B^(1 - 2 rho)$ corrupted nonfixed tree primes have total absolute contribution $O \( exp \( - B^(1 + epsilon \/ 2) \) \)$.]
] <lem:few-corrupted>

#proof[
  For every corrupted prime choose a witnessing vertex outside its edge endpoints, and put $D = floor.l B^(1 - 3 rho) floor.r$. Distance from a vertex to an edge means its minimum tree distance to the two endpoints. Suppose first that at least half the selected witnesses have distance at most $D$ from their prime edge. Use the path from the nearer edge endpoint to its witness. This path avoids the prime’s sole edge, so its nonzero displacement is independent of that prime and is divisible by it. The expression contains at most $J D$ other prime labels.
  On the selected primes draw a directed dependency edge $p arrow.r q$ if the test for $p$ contains $q$. Its outdegree is at most $J D$. Every induced subgraph of the underlying undirected graph has average degree at most $2 J D$. Successively choose a vertex of degree at most $2 J D$ and delete its neighbors. The resulting independent set has size at least a constant times
  $ frac(B^(1 - 2 rho), J D + 1) gt.double B^rho / J > B^(2 epsilon) . $
  Its tests have no selected-variable dependencies. They are covered by 47.
  Otherwise at least half the witnesses have distance greater than $D$. Cover the full tree by $O \( ell \/ D + 1 \) = O \( B^(3 rho) \)$ connected traversal blocks of diameter at most $D$, as in the earlier construction. Assign each prime edge to a block containing that edge and its witness to a block containing that vertex. One ordered pair serves $gt.double B^(1 - 8 rho)$ primes. No selected prime edge has an endpoint in the second block: its corresponding witness lies there, so that would put it at distance at most $D$. Consequently paths inside the second block contain no selected prime label.
  Root the two blocks at $c_1 \, c_2$. In block 1 let $x_p^1$ be the nearer endpoint of the prime edge; in block 2 let $x_p^2$ be its witness. The first local path avoids $p$. If it contains a selected prime $q$, the nearer endpoint of the $q$-edge is a strict ancestor of $x_p^1$. Thus the tests (2.42), after specifying the common root offset, are triangular in the depths of the first-block endpoints. The second local paths introduce no selected variables. Each tested displacement is nonzero because its witness differs from the chosen edge endpoint. Since $1 - 8 rho = 3 \/ 5 > 2 epsilon$, there are more than enough tests for 47. All choices of witnesses, blocks, roots, and paths fit its description bound. ◻
]

#proof[
  Define $R_(bold(d))$ by retaining the conditions obtained in Lemma 2.18, Lemma 2.20, Lemma 2.21. Every activity and occurrence status of a fixed label is determined by $n_(cal(F))$; fixed forbidden qualifications use only those coordinates; corruption uses only numerical offsets. Covers and witnesses can be chosen by fixed finite ordering whenever they exist. Thus $R_(bold(d))$ depends on no free center residue.
  The zero exclusions vanish with $K_(bold(d)) product_j upright(bold(1))_Y$. The other excluded classes have the stated absolute contribution by the three lemmas, yielding (2.41). Their proofs used precisely the majorants of Lemma 2.14, Lemma 2.15, which allow up to $2 t_0$ attached specifications. Their retained tests depend only on the numerical line and fixed residues, and are unchanged when qualification indicators are added. This proves the additional assertion as well. ◻
]

We may therefore impose the retained predicate before estimating the remaining conditional averages. This preserves the residue coordinates of singleton center labels. The next section deals with the remaining dependence of the factors $upright(bold(1))_Y$ on those coordinates by expanding them into short lists of qualification conditions.

==== 2.6 A conditional cylinder sieve <sec:cylinder-sieve>

The restrictions $n + b_j in Y$ still involve the residue coordinates outside the fixed set $cal(F)$. We replace their product by a sum of conditions from short lists of primitive specifications. In each term the remaining coordinates are averaged before taking an absolute value; this preserves the cancellation needed in the trace estimate. The error will contain many specifications with distinct private prime coordinates, which supply enough arithmetic constraints to apply 47.

The intersection rank and the extraction of constraints from its witnesses adapt Pilatte’s construction #cite(label("Pilatte26")) Definition 13.3 and Lemmas 13.4 and 13.6. The associated truncation belongs to the composite-modulus sieve developed in #cite(label("HR21")) Section 3 and #cite(label("Pilatte26")) Appendix B. We prove the finite-cylinder statement and its application here, including the effect of conditioning.

===== 2.6.1 Truncating an intersection poset <truncating-an-intersection-poset>

Let $Omega = product_(p in P) Omega_p$ be a finite product, with $\| Omega_p \| gt.eq 2$ for every $p$. An #emph[exact cylinder] specifies one value at each coordinate in a subset of $P$ and imposes no condition at the other coordinates. Its #emph[support] is the set of specified coordinates, and its #emph[width] is the size of that support.

Let $cal(E)$ be a finite family of proper, nonempty exact cylinders. Identify duplicate cylinders. Let $cal(P)$ consist of the nonempty intersections of subfamilies of $cal(E)$, including the empty-family intersection $hat(0) = Omega$. Order $cal(P)$ by reverse inclusion: $I lt.eq J$ means $I supset.eq J$. For $I in cal(P)$, define

#[#set math.equation(numbering: n => "(2.43)")
 $ "rk" \( I \) = max {\| cal(A) \| : cal(A) subset.eq { E in cal(E) : I subset.eq E } \,\
upright("each ") E in cal(A) upright(" has a support coordinate")\
upright("absent from every other member of ") cal(A)} . $ <eq:cylinder-rank>]

The empty family is allowed in this maximum. A coordinate as in (2.43) is called #emph[private] to its member of $cal(A)$. All events in such a family have compatible prescribed values because they contain the nonempty intersection $I$.

Write $mu \( hat(0) \, I \)$ for the Möbius coefficients of this finite poset, characterized by

$ sum_(I lt.eq J) mu \( hat(0) \, I \) = upright(bold(1))_(J = hat(0)) . $

Their role is inclusion–exclusion with equal intersections collected into one term. This is Möbius inversion in the incidence algebra of a finite poset; see #cite(label("Rota1964")) Section 3. The chain expansion used below is the one in #cite(label("Rota1964")) Section 3, Proposition 6.

#thm([Lemma 2.22.])[
  (Finite-cylinder truncation).  #emph[Suppose that the cylinders in $cal(E)$ have width at most $w gt.eq 1$. For an integer $t gt.eq 1$, put $M = t w$, and let 
$ cal(H)_t = { J in cal(P) : "rk" \( J \) gt.eq t \, med J upright(" is generated by at most ") t upright(" members of ") cal(E) } . $

 Then the rank is nondecreasing on $cal(P)$, every $I in cal(P)$ is generated by at most $"rk" \( I \)$ events, and 
#[#set math.equation(numbering: n => "(2.44)")
 $ \| "supp" \( I \) \| lt.eq w "rk" \( I \) . $ <eq:cylinder-width>]

 For every $x in Omega$, 
#[#set math.equation(numbering: n => "(2.45)")
 $ lr(|upright(bold(1))_(x in.not union.big_(E in cal(E)) E) - sum_("rk" \( I \) < t) mu \( hat(0) \, I \) upright(bold(1))_I \( x \)|) lt.eq 2^M max \( 1 \, M^(M + 1) \) sum_(J in cal(H)_t) upright(bold(1))_J \( x \) . $ <eq:cylinder-truncation>]

 Every coefficient retained in the sum on the left has absolute value at most $max \( 1 \, M^(M + 1) \)$. Every intersection on the right has width at most $M$, even if its rank is greater than $t$.]
] <lem:cylinder-truncation>

#proof[
  If $I lt.eq J$, every event containing $I$ also contains $J$. Thus every family admitted for the maximum defining $"rk" \( I \)$ is admitted for $"rk" \( J \)$, proving monotonicity. Choose an inclusion-minimal family generating $I$. Each member must have a private coordinate: otherwise all its prescribed values already follow from the other members, since the prescriptions are compatible, and it can be removed. Its size is therefore at most $"rk" \( I \)$, proving (2.44) as well.
  Fix $J in cal(P)$ and let $m = \| "supp" \( J \) \|$. An element of the interval $\[ hat(0) \, J \]$ is determined by its support: its values must be the corresponding restrictions of those prescribed by $J$. Consequently this interval has at most $2^m$ elements. Along a strict chain from $hat(0)$ to $J$, supports grow strictly, so there are at most $m$ steps. A chain of $k$ steps is specified by recording, for each coordinate of $"supp" \( J \)$, the step at which it enters. There are at most $k^m$ such chains. Expanding the inverse of the poset’s upper triangular incidence matrix, or applying the Möbius recursion repeatedly, gives the alternating sum over these chains. Thus, for $m gt.eq 1$,
  #[#set math.equation(numbering: n => "(2.46)")
   $ \| mu \( hat(0) \, J \) \| lt.eq sum_(k = 1)^m k^m lt.eq m^(m + 1) \; $ <eq:cylinder-mobius>]
  the coefficient at $hat(0)$ is $1$. This proves the asserted coefficient bound for intersections of rank below $t$.
  For $x in Omega$, let $J_x$ be the intersection of all events satisfied at $x$, with $J_x = hat(0)$ if none are satisfied. An intersection $I in cal(P)$ contains $x$ if and only if $I lt.eq J_x$. Indeed any family generating $I$ then consists of events satisfied at $x$. It follows that
  #[#set math.equation(numbering: n => "(2.47)")
   $ sum_(I in cal(P)) mu \( hat(0) \, I \) upright(bold(1))_I \( x \) = sum_(I lt.eq J_x) mu \( hat(0) \, I \) = upright(bold(1))_(J_x = hat(0)) . $ <eq:cylinder-full-sum>]
  Since no forbidden event is the whole space, the last expression is precisely the avoidance indicator in (2.45).
  If $"rk" \( J_x \) < t$, monotonicity shows that the truncated sum contains the entire interval $\[ hat(0) \, J_x \]$, so it is exact. Suppose instead that $"rk" \( J_x \) gt.eq t$. Given any $I lt.eq J_x$ of rank below $t$, successively intersect it with events satisfied at $x$ until reaching $J_x$. Let $K$ be the first intersection whose rank is at least $t$, and let $K^(-)$ be its immediate predecessor. Replace the generating family for $K^(-)$ by an inclusion-minimal one. It has at most $t - 1$ members. Adjoining the event that produces $K$ shows that $K$ is generated by at most $t$ events. Thus
  $ I lt.eq K lt.eq J_x \, #h(2em) K in cal(H)_t \, #h(2em) \| "supp" \( K \) \| lt.eq M . $
  This argument allows the rank to jump by more than one. The re-minimization of the predecessor, rather than the length of the successive list, bounds the number of generators.
  Every satisfied low-rank $I$ is therefore below a satisfied member of $cal(H)_t$. For any one such member there are at most $2^M$ possible predecessors $I$, by the interval bound already proved. The exact avoidance indicator is zero in the present case. Bounding each retained coefficient by (2.46) now gives (2.45). ◻
]

===== 2.6.2 Applying the truncation after conditioning <applying-the-truncation-after-conditioning>

Return to a fixed numerical line $bold(d)$. Its fixed prime set $cal(F)$ consists of its core labels and its repeated labels, as in 5. In particular, core primes absent from the line are not added to $cal(F)$. Write $R_(bold(d)) \( n_(cal(F)) \)$ for the indicator of the conditions retained in 48.

Condition on $n_(cal(F))$ with $R_(bold(d)) = 1$. At every $n + b_j$, take the primitive forbidden specifications compatible with these fixed residues. Omit their fixed-coordinate tests, leaving exact cylinders on the coordinates $cal(S) \\ cal(F)$. Each has width at most $L J + 1$. There is no whole-space event: such an event would be a qualifying primitive specification using only fixed primes, excluded by the retained conditions. Avoiding these residual events is exactly the condition $n + b_j in Y$ for every $j$.

For a list $frak(L)$ of primitive specifications attached at line indices $0 \, dots.h \, ell$, let $I_(frak(L)) \( n \)$ be the indicator that all its specifications qualify, including their fixed-coordinate tests. The empty list has indicator $1$. Let $cal(L)_(< t_0) \( bold(d) \)$ denote all ordered such lists of length less than $t_0$. These are finite families at the fixed graph parameters. We will use the bound

#[#set math.equation(numbering: n => "(2.48)")
 $ M_0 = t_0 \( L J + 1 \) = O \( B^(1 - rho + 4 epsilon) log B \) \, #h(2em) M_0 log B = o \( B \) . $ <eq:cylinder-budget>]

In particular, the coefficient and error factors in 54 are $exp \( O \( M_0 log B \) \)$.

A low-rank intersection is generated by fewer than $t_0$ residual events. Choose one realizing primitive specification for each event. The conjunction of their full qualification indicators equals the intersection indicator at the conditioned residues. Different intersections cannot have the same chosen generating list, since that list determines its intersection. We may therefore bound their sum by the sum over $cal(L)_(< t_0) \( bold(d) \)$ without a multiplicity loss.

For an intersection in $cal(H)_(t_0)$, choose at most $t_0$ generating events and exactly $t_0$ events witnessing its rank. The latter may be selected from a larger irredundant family; deleting other members preserves their private coordinates. The witnessing events contain the intersection. Consequently adjoining them to the generating list leaves its indicator unchanged. After choosing realizing primitive specifications, each witness has a prime outside $cal(F)$ that occurs in none of the other witness specifications. These choices may depend on $n_(cal(F))$, which is harmless: the preceding assertions and the uniform coefficient bounds apply pointwise at each fixed-coordinate assignment.

We have thus reduced the truncation error to jointly qualifying lists of at most $2 t_0$ specifications, including $t_0$ witnesses with private primes outside $cal(F)$. The next lemma shows that these error lists impose many triangular constraints on their numerical prime labels.

#thm([Lemma 2.23.])[
  (Constraints from private primes).  #emph[Let $bold(d)$ be a numerical closed line, and let $cal(F)$ contain its core prime labels and all labels occurring at least twice on the line. Suppose $t_0$ primitive specifications attached at line vertices qualify simultaneously. Suppose that each has a prime outside $cal(F)$ absent from every other specification in this family. For sufficiently large $B$, their numerical labels satisfy a triangular system on at least $B^(2 epsilon)$ distinct selected prime variables of the kind in 47. Each constraint uses one intrinsic suffix displacement, or the difference of two witness prefixes and a line segment. Its nonzero expressions have logarithmic size $O \( B log B \)$ even when numerical label-size restrictions are dropped.]
] <lem:cylinder-witnesses>

#proof[
  Order the witnesses by nondecreasing attachment indices $k_1 \, dots.h \, k_(t_0)$; break ties arbitrarily. For witness $j$, choose a private prime $q_j in.not cal(F)$, write $p_j$ for its extra prime, and choose a tail prime $r_j$ as in 45. Thus $r_j$ occurs only in its final constant block. That lemma supplies two coefficient facts:
  + the intrinsic suffix displacement divisible by $p_j$ is linear in a tail-only prime, with coefficient nonzero modulo $p_j$;
  + if a prime occurs before the constant tail, its coefficient in the prefix displacement immediately preceding that tail is nonzero modulo $r_j$.
  All private primes $q_j$ are distinct. Each occurs at most once as a label on the original line, because it is outside $cal(F)$. We divide into three cases to control every dependence on another selected variable.
  ======= 2.6.2.1 Private primes in intrinsic suffix constraints. <private-primes-in-intrinsic-suffix-constraints.>
  Suppose at least $t_0 \/ 10$ witnesses have $q_j = p_j$ or have $q_j$ occurring only in the constant tail. In the first situation $q_j$ divides the intrinsic suffix displacement, which is nonzero by simplicity and does not involve $q_j$. In the second situation use that suffix constraint as a linear congruence in $q_j$ modulo $p_j$; its coefficient is nonzero by (i). The private-prime property excludes every other selected $q$ from the witness, including from its modulus. These constraints have no dependencies on the other selected variables and hence form a triangular system.
  ======= 2.6.2.2 Tail primes first or last appearing among the witnesses. <tail-primes-first-or-last-appearing-among-the-witnesses.>
  Suppose at least $t_0 \/ 10$ witnesses have $r_j$ absent from every earlier witness. Select these tail primes in increasing witness order. They are distinct: equality between two would make the latter prime occur in an earlier witness. Use the intrinsic suffix congruence for each selected $r_j$. No later selected tail prime occurs in this witness, by its defining absence property. This also excludes later selected variables from the modulus $p_j$. Thus each constraint uses only its own variable, earlier selected variables, and nonselected variables, and its coefficient is nonzero modulo $p_j$ by (i). If instead at least $t_0 \/ 10$ witnesses have $r_j$ absent from every later witness, the same argument in decreasing witness order applies.
  ======= 2.6.2.3 Comparing two activities of a shared tail prime. <comparing-two-activities-of-a-shared-tail-prime.>
  If none of these cases applies, fewer than $3 t_0 \/ 10$ witnesses have been excluded by their three respective conditions. Retain at least $t_0 \/ 2$ witnesses for which $q_j$ occurs before the tail and $r_j$ appears in both an earlier and a later witness. Since $q_j$ occurs at most once on the original line, it is absent either from all steps $1 \, dots.h \, k_j$ or from all steps $k_j + 1 \, dots.h \, ell$. At least $t_0 \/ 4$ of the retained witnesses satisfy the same one of these two absence conditions.
  First consider the family absent from steps $1 \, dots.h \, k_j$, ordered increasingly by attachment index. For its witness $j$, choose an earlier witness $i = i \( j \)$ using $r_j$. In witness $i$, choose a vertex at which $r_j$ is active: its starting vertex if $r_j$ is its extra prime, or the origin of an edge carrying $r_j$ otherwise. Let $T_i$ be this vertex’s offset relative to that witness’s start. Let $P_j$ be the prefix displacement of witness $j$ immediately preceding its constant tail. Joint qualification implies
  #[#set math.equation(numbering: n => "(2.49)")
   $ b_(k_j) - b_(k_i) + P_j - T_i equiv 0 med \( mod med r_j \) . $ <eq:cylinder-comparison>]
  The coefficient of $q_j$ in this congruence is exactly its coefficient in $P_j$: privateness excludes it from witness $i$, and the selected absence condition excludes it from the line segment between $k_i$ and $k_j$. This coefficient is nonzero modulo $r_j$ by (ii).
  Now take a later selected private variable $q_s$. It occurs in neither witness $i$ nor witness $j$, by privateness. Moreover $k_s gt.eq k_j$, and its own absence condition excludes it from every line step through $k_s$, hence from the segment in (2.49). Thus no later selected variable occurs in that congruence. The modulus $r_j$ is not any selected private prime: it differs from $q_j$ because $q_j$ occurs before the tail, and it differs from all other $q_s$ by privateness. This proves triangularity in increasing order. Equal attachment indices merely make the corresponding line segment empty.
  For the family absent from steps after $k_j$, order the witnesses decreasingly and compare witness $j$ to a later witness containing $r_j$. Equation (2.49) has the same form, now with its line segment after $k_j$. A later selected variable in this decreasing order has attachment $k_s lt.eq k_j$ and is absent from all steps after $k_s$, so it is absent from that segment. Privateness excludes it from the two witness prefixes. Fact (ii) again supplies the nonzero coefficient. This gives a triangular system in decreasing order. The attained comparison displacement may equal zero; that causes no difficulty, since we use an invertible linear congruence, not a divisibility constraint with the selected prime as modulus.
  Every case provides at least $t_0 \/ 20$ selected variables for sufficiently large $B$, allowing for integer parts. This is greater than $B^(2 epsilon)$. Each label is a squarefree product of at most $J$ primes at most $e^B$, so its logarithm is at most $B J = O \( B log B \)$ even without the divisor-bin restrictions. A suffix or a comparison above uses $O \( ell + L \)$ such terms. Every nonzero expression consequently has logarithmic size $O \( B log B \)$. The constraint choices are specified by witness and line positions and prime slots, within the enumeration allowed in 47. All its hypotheses are now verified. ◻
]

#thm([Proposition 2.24.])[
  (Reduction to short qualification lists).  #emph[For the retained line and fixed-coordinate data of 48, there is a factor $frak(C)_B = exp \( O \( M_0 log B \) \)$ such that 
#[#set math.equation(numbering: n => "(2.50)")
 $ & sum_(bold(d)) bb(E)_(cal(F)) [R_(bold(d)) lr(|bb(E)_(cal(S) \\ cal(F)) K_(bold(d)) \( n \) product_(j = 0)^ell upright(bold(1))_Y \( n + b_j \)|)]\
 & quad lt.eq frak(C)_B sum_(bold(d)) bb(E)_(cal(F)) [R_(bold(d)) sum_(frak(L) in cal(L)_(< t_0) \( bold(d) \)) lr(|bb(E)_(cal(S) \\ cal(F)) K_(bold(d)) \( n \) I_(frak(L)) \( n \)|)] + O #h(-0.16667em) (e^(- B^(1 + epsilon \/ 2))) . $ <eq:cylinder-reduction>]

 Here each sum runs over numerical closed lines, $cal(F)$ is the fixed prime set of that line, and every list indicator imposes full qualification of its specifications.]
] <prop:cylinder-reduction>

#proof[
  At fixed $bold(d) \, n_(cal(F))$ with $R_(bold(d)) = 1$, apply 54 to the residual cylinders with $t = t_0$ and $w = L J + 1$. Multiply the identity with its pointwise error bound by $K_(bold(d))$ and integrate the residual coordinates. For the low-rank sum, take the absolute value after each such integral and use the generating lists already constructed. The coefficient bound gives the main term on the right of (2.50).
  For the error, take the absolute value of $K_(bold(d))$ inside the integral and use the generating and witnessing lists described above. After integrating the fixed coordinates, their indicators require joint qualification of at most $2 t_0$ specifications, including the $t_0$ witnesses with private primes outside $cal(F)$. We may drop the retained-data restriction in this positive bound. 55 supplies at least $B^(2 epsilon)$ triangular constraints for each nonzero contribution.
  Refine the error count by the lit or unlit status of every line occurrence. Joint qualification fixes one residue for each distinct prime used by the specifications, or is inconsistent and contributes zero. For each refinement, 46 gives $A^(ell J) product_p p^(- 1)$, with the product over distinct prime labels, rather than charging a shared residue repeatedly. The line and lists have at most
  $ ell J + 2 t_0 \( L J + 1 \) = O \( B log B \) $
  prime slots. Their equality patterns, occurrence statuses and all choices of witness constraints have cost $exp \( O \( B log^2 B \) \)$. These are exactly the positive majorant and description budget required by 47. Its reverse elimination applies to the system just supplied by 55 and gives $O \( e^(- B^(1 + epsilon \/ 2)) \)$. The additional factor $frak(C)_B$ is absorbed by the same estimate, since (2.48) gives $log frak(C)_B = o \( B \)$ whereas the saving before this final simplification is $exp \( - Omega \( B^(1 + epsilon) \) \)$. This proves the proposition. ◻
]

The reduction has preserved a signed average at the unfixed coordinates. For its use in the next section, it is useful to distinguish $cal(C)' = cal(C) \\ cal(F)$ and $cal(Z)' = cal(Z) \\ cal(F)$. For each list,

#[#set math.equation(numbering: n => "(2.51)")
 $ lr(|bb(E)_(cal(S) \\ cal(F)) K_(bold(d)) I_(frak(L))|) lt.eq bb(E)_(cal(C)') lr(|bb(E)_(cal(Z)') K_(bold(d)) I_(frak(L))|) . $ <eq:cylinder-core-order>]

This is only Fubini’s theorem and the triangle inequality. In the inner average all core coordinates are held fixed, so the cutoffs are fixed there; the free center coordinates still retain their signs. The core coordinates can subsequently be integrated against positive bounds. In particular, (2.51) does not enlarge $cal(F)$ or change the private-coordinate rank used in the sieve.

==== 2.7 Summing the trace <sec:trace-count>

We now prove the high-trace estimate. The input from 48 is a description of the activities of the fixed primes on the first-visit tree. The input from 56 replaces vertex deletion by short lists of qualifying primitive specifications. The remaining task is to sum the resulting conditional averages without losing a constant for every prime occurrence. An exact identity for weighted subtrees makes this possible.

We retain the notation $cal(T)$, $b \( v \)$ and $r_(*)$ for the first-visit tree, its integer offsets and the number of returns. In this section a subtree is a connected subgraph of $cal(T)$; its #emph[top] is its vertex nearest the root. Put

$ s \( v \) = \# { upright("children of ") v } \, #h(2em) M_0 = t_0 \( L J + 1 \) \, #h(2em) N_(upright("exc")) = B^(1 - rho \/ 2) . $

We call a tree edge $u arrow.r v$ #emph[good] if $s \( u \) = s \( v \) = 1$, $u$ is not the root, and neither endpoint belongs to any return step. Write $cal(G)$ for the set of good edges. These conditions ensure that an uncorrupted prime occurring just on such an edge has exactly two normalization factors on its lit residue.

For all but a small exceptional set of good edges, we will obtain the factor $B^(- 1 + eta)$ from a core-prime restriction to the divisor interval, or a stronger penalty from a core cutoff. Returns receive a cutoff penalty as well. Signed center-prime averages provide the further saving needed in the high-trace estimate. The weighted-subtree identity below will let us sum the prime labels without losing these gains.

===== 2.7.1 Tree geometry and weighted subtrees <tree-geometry-and-weighted-subtrees>

#thm([Lemma 2.25.])[
  #emph[For a closed line of length $ell$ with $r_(*)$ returns, the topology of first visits and returns, together with all step signs, has at most $4^ell \( ell + 1 \)^(r_(*))$ possibilities. Its tree satisfies 
#[#set math.equation(numbering: n => "(2.52)")
 $ \| E \( cal(T) \) \\ cal(G) \| lt.eq 10 \( r_(*) + 1 \) \, #h(2em) ell = \| E \( cal(T) \) \| + r_(*) . $ <eq:trace-bad-edges>]

 Once the labels of the tree edges and this topology are specified, every return label is determined.]
] <lem:trace-topology>

#proof[
  At each step record whether its destination is new and record its sign. At each return record one of at most $ell + 1$ previously visited vertices. These data give the stated bound. A tree-edge label and its sign specify the difference of its endpoint offsets; all offsets are consequently determined, and a return label must be the absolute endpoint difference divided by $h$. We retain only assignments for which the abstract vertices have distinct offsets and all these return labels belong to $cal(D)$. There is no independent choice of a return label.
  Let $q$ be the number of leaves and $b$ the number of vertices with at least two children. The adding steps occur in at most $r_(*) + 1$ runs, each a downward path, so $q lt.eq r_(*) + 1$. Also $b lt.eq q - 1$ and
  $ sum_(s \( v \) gt.eq 2) s \( v \) = q + b - 1 . $
  The number of edges incident with a leaf or such a branch vertex is therefore at most $4 q$. There are at most $2 r_(*)$ endpoints of return steps. An endpoint that has not already been counted is unary and is incident with at most two tree edges, giving at most $4 r_(*)$ further edges. The root adds at most one edge unless it was already counted as a branch vertex. These bounds imply (2.52). ◻
]

For $a in { C \, Z }$ and a subtree $Q$ with at least one edge define

#[#set math.equation(numbering: n => "(2.53)")
 $ u_a \( Q \) = A_a^(\| E \( Q \) \|) product_(v in V \( Q \)) beta_a^(s \( v \)) \, #h(2em) S_a \( cal(T) \) = sum_(v in V \( cal(T) \)) \( 1 - beta_a^(s \( v \)) \) . $ <eq:subtree-weights>]

The degrees in this definition are those of the full tree.

#thm([Lemma 2.26.])[
  #emph[For every finite rooted tree and every $A_a > 0$ with $beta_a = \( 1 + A_a \)^(- 1)$, 
#[#set math.equation(numbering: n => "(2.54)")
 $ sum_(Q : thin \| E \( Q \) \| gt.eq 1) u_a \( Q \) = S_a \( cal(T) \) lt.eq \| V \( cal(T) \) \| . $ <eq:subtree-identity>]

]
] <lem:subtree-weight>

#proof[
  Start at a prescribed vertex $v$. At every reached vertex include each child edge independently with probability $A_a beta_a$ and exclude it with probability $beta_a$. The resulting connected subtree has top $v$. A particular outcome $Q$ has probability
  $ \( A_a beta_a \)^(\| E \( Q \) \|) beta_a^(sum_(w in V \( Q \)) s \( w \) - \| E \( Q \) \|) = u_a \( Q \) . $
  The outcome with no edges has probability $beta_a^(s \( v \))$. Sum the other probabilities, then sum over the possible tops $v$. ◻
]

The exact sum in (2.54) will cancel the background exponential in the primewise estimate below. To retain the additional center-prime saving, we also use modified weights. These anticipate the primewise bounds proved in 60: the reduction on a single good edge comes from a signed average, while the increase on other single edges permits an absolute bound. Set $tilde(u)_C = u_C$. In the center band keep $tilde(u)_Z \( Q \) = u_Z \( Q \)$ unless $Q$ consists of one edge; for a single good edge set $tilde(u)_Z \( Q \) = theta \/ 2$, and for a single nongood edge set $tilde(u)_Z \( Q \) = u_Z \( Q \) + theta$. Since both endpoint degrees of a good edge are one, its original weight is $beta_Z^2 = theta$. Thus

#[#set math.equation(numbering: n => "(2.55)")
 $ sum_Q tilde(u)_Z \( Q \) - S_Z \( cal(T) \) = - theta / 2 \| cal(G) \| + theta \| E \( cal(T) \) \\ cal(G) \| . $ <eq:modified-subtree-sum>]

===== 2.7.2 Recording prime labels <recording-prime-labels>

Fix a retained line and a list $frak(L)$ of fewer than $t_0$ primitive specifications attached at its vertices, as supplied by 56. Write $I_(frak(L))$ for their joint qualification indicator. Recall that a #emph[tree prime] occurs in a tree-edge label. As before, the fixed label set $cal(F)$ consists of the core primes occurring on the line and all primes occurring at least twice on the line. A fixed prime is active at $v$ when $p divides n + b \( v \)$. Active components include isolated vertices.

Tag a tree prime if it satisfies at least one of the following conditions:

+ it occurs among the primes of $frak(L)$;
+ it is fixed and has several active components, or has an unlit occurrence anywhere on the line;
+ it is nonfixed and corrupted in the sense of 48.

These decisions depend only on the line, the list and the fixed coordinates $n_(cal(F))$.

We record tree labels by the following finite data, called #emph[tokens]. For a tagged fixed prime, record one subtree token for each active component having an edge, and one single-edge token for each unlit tree occurrence. The latter is called a ghost token and is assigned weight $2$. A subtree token of band $a$ and shape $Q$ has weight $u_a \( Q \)$. For a tagged nonfixed prime, record its sole tree occurrence by a ghost token. Tokens belonging to the same tagged prime are grouped together, and the group is assigned that prime value.

Every untagged tree prime receives a single token. If it is fixed, its active set is connected and all its occurrences are lit; the token is the subtree formed by its tree occurrences. If it is nonfixed, its token is its single tree edge. An untagged token of band $a$ and shape $Q$ has weight $tilde(u)_a \( Q \)$. List prime slots, including the extra modulus prime of each specification, are recorded along with their equalities to each other and to tagged groups. An untagged prime occurs in no such group or slot.

#thm([Lemma 2.27.])[
  #emph[For retained data, these records have the following properties.]
  + #emph[They recover every tree-edge label. Together with the topology and the list data they consequently recover the full line and list.]
  + #emph[The total number of tagged tokens and list prime slots is at most $N_(upright("exc"))$, for sufficiently large $B$.]
  + #emph[An untagged fixed center prime cannot have a single good edge as its token.]
] <lem:trace-token-record>

#proof[
  If adjacent vertices are active for $p$, their difference $plus.minus h d$ is divisible by $p$. Since $p divides.not h$, the intervening label contains $p$. Conversely, a lit occurrence has both endpoints active. Thus the nontrivial active components record exactly the lit tree occurrences. Ghosts record the other occurrences; isolated active vertices create no label. Multiplying the distinct prime values of the tokens covering an edge recovers its label, proving (i).
  By 48, the fixed primes with several active components contribute $O \( B^(1 - 2 rho) B^rho \) = O \( B^(1 - rho) \)$ subtree tokens. Unlit fixed occurrences contribute $O \( t_0 \)$ ghosts and at most that many newly tagged connected labels. Corrupted nonfixed primes contribute $O \( B^(1 - 2 rho) \)$ ghosts. Lists contribute $O \( M_0 \)$ slots and at most one new token per newly tagged connected tree prime: disconnected primes and primes with unlit occurrences have already been counted. Since
  $ M_0 = O \( B^(1 - rho + 4 epsilon) log B \) \, #h(2em) 1 - rho + 4 epsilon < 1 - rho \/ 2 \, $
  the sum of these bounds is at most $N_(upright("exc"))$ eventually.
  For (iii), such a prime is repeated on the line and all its occurrences are lit. If its tree token consists of a single edge, its connected active set contains only the two endpoints of that edge. A further occurrence cannot be another tree edge, and hence must be a return touching these endpoints. This contradicts goodness. An active return endpoint elsewhere would give another active component and would have tagged the prime. ◻
]

We will use the divisor interval at a good edge by restricting the prime value of an untagged core token whose top is its origin. First set aside the tagged core tops: skip every good edge whose origin is the top of a tagged core subtree token. At most $N_(upright("exc"))$ edges are skipped. Among the remaining good edges, let $cal(U)$ be the set of origins at which no untagged core token has its top. Thus no core subtree token has top $u in cal(U)$, and $s \( u \) = 1$. At these origins we will use a cutoff penalty instead. The next estimate retains this penalty; the subsequent sum over prime assignments will use the divisor interval at the other non-skipped good origins.

For a fixed numerical line and list, group the retained fixed-coordinate configurations according to their complete assigned token records. Within a group the token shapes, prime values and groupings are fixed; unrecorded isolated activities may still vary. Order components and tokens by any deterministic rule, so that these groups form a partition, rather than a choice of representations for each residue configuration. We next bound the integral of each such group. This is the point at which the normalization of the graph produces cancellation.

===== 2.7.3 Primewise integration <primewise-integration>

For an assigned record $R$, let $upright(bold(1))_R \( n_(cal(F)) \)$ denote its group indicator. Its contribution to the conditional expression is

$ cal(I) \( R \) = bb(E)_(cal(F)) [upright(bold(1))_R lr(|bb(E)_(cal(S) \\ cal(F)) K_(bold(d)) \( n \) I_(frak(L)) \( n \)|)] . $

Empty or incompatible groups have contribution zero. Products over tagged tokens below use the weights just defined, including weight $2$ for ghosts.

#thm([Lemma 2.28.])[
  #emph[Uniformly over retained lines, lists and assigned records, 
#[#set math.equation(numbering: n => "(2.56)")
 $ cal(I) \( R \) & lt.eq exp {o \( 1 \) - kappa \( v_C - T sqrt(v_C) \) \( r_(*) + \| cal(U) \| \)}\
 & quad times exp {- v_C S_C \( cal(T) \) - v_Z S_Z \( cal(T) \) + v_C beta_C \( e^kappa - 1 \) \| cal(U) \|}\
 & quad times product_(p upright(" distinct")\
p upright(" in tree or list")) 1 / p product_(upright("tagged tokens")) upright("weight") product_(upright("untagged tokens")\
\( a \, Q \)) tilde(u)_a \( Q \) . $ <eq:trace-integration>]

 Primes occurring only on returns need not appear in the product over tree or list primes. The $o \( 1 \)$ tends to zero as $B$ tends to infinity, uniformly in the line, list and record, with $h \, tau \, C_0 \, T$ and the constants in (2.1) fixed.]
] <lem:trace-integration>

#proof[
  #emph[Order of integration.] The set $cal(F)$ does not contain every core prime. Put $cal(C)' = cal(C) \\ cal(F)$ and $cal(Z)' = cal(Z) \\ cal(F)$. At fixed $n_(cal(F))$ use exactly the inequality
  #[#set math.equation(numbering: n => "(2.57)")
   $ lr(|bb(E)_(cal(C)') bb(E)_(cal(Z)') K_(bold(d)) I_(frak(L))|) lt.eq bb(E)_(cal(C)') lr(|bb(E)_(cal(Z)') K_(bold(d)) I_(frak(L))|) . $ <eq:trace-fubini>]
  In the inner average hold #emph[all] core coordinates as parameters. The cutoffs can depend on the background core coordinates in $cal(C)'$, but never on $cal(Z)'$. Apart from these cutoffs, the kernel and each compatible list cylinder separate by prime. The inner center-prime averages therefore factor, with their signs intact. We will subsequently use positive majorants in the other coordinates. No enlargement of the fixed set in the cylinder construction is involved.
  #emph[Charging the cutoffs.] Use the origin cutoff at each return step. For each $u in cal(U)$, use the endpoint cutoff at $u$ of its incoming tree edge, which exists because a good origin is not the root. These are distinct cutoff occurrences: vertices of $cal(U)$ touch no return, and an incoming tree edge has a unique child. A charged cutoff with label $d$ is at most
  $ exp { - kappa \( v_C - T sqrt(v_C) \) } exp {kappa sum_(p in cal(C)\
p divides.not d) upright(bold(1))_(p divides n + b \( u \))} . $
  This inequality holds also off its support. The other cutoff factors are at most one. The constant parts give the first negative term in the exponent of (2.56).
  For a return, allocate the normalization at its origin to that return. For a core prime its multiplier is $A beta_C$ when the prime is in the label and lit, zero when it is in the label and unlit, and at most $max \( 1 \, beta_C e^kappa \) = 1$ otherwise. Both $A beta_C < 1$ and $beta_C e^kappa < 1$ follow from $A = e^(2 kappa)$. Center-prime return multipliers also have absolute value at most one. These bounds will be used except when integrating a good singleton, where we retain the return factors until its signed average has been taken.
  #emph[Fixed tree primes.] After removing the bounded return factors, the core tree factors for an active component $Q$ containing an edge are
  $ A^(\| E \( Q \) \|) product_(v in V \( Q \)) beta_C^(s \( v \)) = u_C \( Q \) . $
  At a charged vertex $u in cal(U)$, activity in such a component either continues through the incoming label, in which case that prime is excluded from this charge, or begins a subtree token at $u$, which is excluded by the definition of $cal(U)$. Thus an additional $e^kappa$ can occur only at an isolated active vertex there. Its normalization is $beta_C^(s \( u \)) e^kappa = beta_C e^kappa lt.eq 1$. Other isolated activities also contribute at most one. The remaining bound is the product of the core subtree weights.
  A core tree prime has a lit occurrence. Choose one deterministically from its tokens and retain its activity indicator. This is one specified residue modulo $p$ and supplies the factor $1 \/ p$ upon integration. For a fixed center tree prime, the same argument gives the product of its active-subtree weights; lit factors $1 - theta \/ p$ are at most one, and ghost occurrences are bounded absolutely. If there is a lit tree occurrence, retain one such residue indicator. If there is none, at least one unlit tree occurrence supplies $theta \/ p lt.eq 1 \/ p$ directly, without a residue restriction. Ghost weight $2$ bounds all the remaining ghost factors. These constructions are positive primewise majorants on the assigned group.
  #emph[Nonfixed tree primes.] A tagged nonfixed tree prime has one occurrence. Its absolute integral is at most $2 \/ p$: the lit residue contributes at most $1 \/ p$ and the other residues at most $theta \/ p$. If the list fixes its residue, the bound only improves. An untagged nonfixed prime on a nongood edge $Q$ contributes at most
  $ frac(u_Z \( Q \), p) + theta / p = frac(tilde(u)_Z \( Q \), p) . $
  Indeed its lit residue includes the normalizations of both endpoints, and any additional activities can only reduce their product.
  Now let $p$ be an untagged nonfixed prime on a good edge $Q = \( u \, v \)$. It occurs nowhere else on the line and in no list. On its lit residue, noncorruption says that no other tree vertex is active. Each endpoint has exactly one tree departure and no return incidence. Its entire prime multiplier, including return factors, is therefore exactly
  $ \( 1 - theta \/ p \) beta_Z^2 = theta \( 1 - theta \/ p \) . $
  Let $a_0$ be its lit residue, and for $a in bb(Z) \/ p bb(Z)$ define
  $ nu_p \( a \) = \# { 0 lt.eq i < ell : a + b_i equiv 0 med \( mod med p \) } . $
  This counts departures with multiplicity, including return departures. We have $nu_p \( a_0 \) = 2$. On every other residue the entire prime multiplier is exactly $- theta beta_Z^(nu_p \( a \)) \/ p$. Consequently its signed average is exactly
  $ & theta / p \( 1 - theta \/ p \) - theta / p^2 sum_(a eq.not a_0) beta_Z^(nu_p \( a \))\
 & #h(2em) = theta / p^2 (1 - theta + sum_(a eq.not a_0\
nu_p \( a \) > 0) \( 1 - beta_Z^(nu_p \( a \)) \)) . $
  There are at most $r_p - 1$ terms in the last sum, where $r_p lt.eq ell + 1$ is the number of residue classes represented by tree vertices. The displayed quantity is nonnegative and at most
  $ frac(theta r_p, p^2) lt.eq frac(theta \( ell + 1 \), p^2) lt.eq frac(theta, 2 p) = frac(tilde(u)_Z \( Q \), p) $
  for sufficiently large $B$. Thus $theta = beta_Z^2$ cancels the terms of order $1 \/ p$ before any absolute value is taken. Removing return factors by an absolute estimate before taking this average would not justify the calculation on the no-activity residues; here they have been retained throughout.
  #emph[List primes and background primes.] For a list prime absent from the tree, qualification supplies one specified residue. All other factors, including charged factors, are bounded by one: any activity in the tree is isolated, and at a vertex of $cal(U)$ its factor is again $beta_C e^kappa lt.eq 1$. This yields $1 \/ p$ for that prime.
  For any remaining prime, discard return factors by the absolute bounds already proved. The positive tree multiplier is
  $ product_(v upright(" active")) beta_a^(s \( v \)) exp { kappa upright(bold(1))_(a = C) \# \( cal(U) ∩ { v upright(" active") } \) } lt.eq 1 . $
  If the tree offsets are pairwise distinct modulo $p$, its integral is exactly
  #[#set math.equation(numbering: n => "(2.58)")
   $ 1 - frac(S_a \( cal(T) \) - upright(bold(1))_(a = C) beta_C \( e^kappa - 1 \) \| cal(U) \|, p) . $ <eq:trace-background>]
  For offset collisions we use the bound one. A prime occurring only on a return divides the nonzero difference between that return’s two distinct vertices, so is automatically one of these collision primes. It entails no independently chosen prime slot.
  The omitted background primes are tree or list primes, or divide one of the $O \( ell^2 \)$ nonzero differences of size $O \( ell H \)$. There are $O \( B log B \)$ tree and list slots. Since every prime is at least $P_0$ and $log \( ell H + 2 \) = O \( B + log B \)$, their reciprocal mass, multiplied by $ell + 1$, is $o \( 1 \)$, uniformly in the valid assignment. For example each nonzero difference has at most $log \( O \( ell H \) + 2 \) \/ log P_0$ prime divisors from $cal(S)$. Using $1 - x lt.eq e^(- x)$ in (2.58) and restoring the omitted harmonic masses gives the remaining exponent in (2.56), with an $o \( 1 \)$ error. The numerator in (2.58) is nonnegative, since at every charged vertex $beta_C e^kappa lt.eq 1$.
  Finally, the grouping does not assert independence of conditioned coordinates. After (2.57) and the signed free-center integrations, use the positive majorants above on the group. Whenever a used-prime probability $1 \/ p$ is claimed, its chosen activity or list residue indicator is retained. Drop all other group restrictions and integrate the resulting product over the remaining coordinates. This is an enlargement of a nonnegative integral and hence is valid despite any dependencies within the original group. It yields one bound per assigned record, not one bound for each individual fixed-coordinate configuration. Combining the primewise bounds proves the lemma. ◻
]

===== 2.7.4 Prime assignments, factorials and scale constraints <prime-assignments-factorials-and-scale-constraints>

We have bounded a record by a product of token weights and reciprocal prime values. We now sum these products. The exact subtree identity will cancel their background exponential. We must retain the factorials for equal token types in order for this cancellation to remain exact.

For a fixed topology, record the tagged tokens in an ordered list and record all list metadata: lengths, signs, attachments, suffix choices, band choices, prime-slot sizes and equalities. Apart from the token shapes and prime values themselves, this costs

#[#set math.equation(numbering: n => "(2.59)")
 $ exp \( O \( N_(upright("exc")) log B \) \) . $ <eq:trace-exceptional-entropy>]

Indeed there are at most $N_(upright("exc"))$ objects and slots; each positional index has at most a fixed power of $B$ choices, and their equality pattern has at most $N_(upright("exc"))^(N_(upright("exc")))$ possibilities. Multiple tagged tokens may share a prime, and each resulting group has one prime variable. None of these variables is shared with an untagged token.

For the untagged tokens specify multiplicities $j_(a \, Q) gt.eq 0$ for their types $\( a \, Q \)$. The actual prime values of one type form an unordered set of $j_(a \, Q)$ distinct primes. Replace it temporarily by named slots $1 \, dots.h \, j_(a \, Q)$ and divide the sum by

#[#set math.equation(numbering: n => "(2.60)")
 $ product_(a \, Q) j_(a \, Q) ! . $ <eq:trace-factorial>]

Every valid prime assignment has exactly this number of named realizations. Permuting values within one type preserves every tree label, hence all return labels, the numerical line and the list. In particular every bin condition is preserved. After obtaining this identity, we may enlarge the nonnegative sum by dropping distinctness and other compatibility conditions. Such an enlargement is a formal sum of the established numerical majorants; it is not an application of 60 to new lines with coincident prime slots.

#thm([Lemma 2.29.])[
  #emph[Fix the topology, token shapes, tagged/list groupings and untagged multiplicities. For every non-skipped good origin $u in.not cal(U)$ choose deterministically one named core slot whose token has top $u$. When summing prime assignments, the bin conditions on these edges give an extra factor $O \( B^(- 1 + eta) \)$ for each chosen slot, while retaining the unrestricted harmonic factor $v_a$ for every prime variable. Together with the charge exponent and its correction in (2.56), these savings are bounded by 
#[#set math.equation(numbering: n => "(2.61)")
 $ B^(- 100 r_(*)) exp \( O \( ell \) \) B^(- \( 1 - eta \) \( \| cal(G) \| - N_(upright("exc")) \)) . $ <eq:trace-pivot-saving>]

]
] <lem:trace-pivots>

#proof[
  Choose one eligible type at each origin using any fixed order, and then choose its first named slot. Distinct origins choose different slots. Because $s \( u \) = 1$, a nontrivial subtree with top $u$ contains the edge leaving $u$.
  Fix all other prime values and order the selected slots ancestor-first by their tops. If the token of a selected slot occurs on the edge leaving $u$, its top is $u$ or an ancestor of $u$. Thus that edge’s product contains its selected prime and only earlier selected primes. The bin requirement has the form
  $ H < p_i D_i \( p_1 \, dots.h \, p_(i - 1) \) lt.eq tau H \, $
  where $D_i$ is positive and all its other factors have been fixed. The harmonic sum of a core prime in such an interval is $O \( B^(- 1 + eta) \)$, uniformly in its position. To see this, write the interval as $\( x \, tau x \]$. If it meets the core band, then $x gt.eq exp \( B^(1 - eta) \) \/ tau$, and the prime-counting upper bound gives
  $ sum_(x < p lt.eq tau x\
p in cal(C)) 1 / p lt.eq frac(pi \( tau x \), x) lt.double_tau frac(1, log x) lt.double B^(- 1 + eta) . $
  Eliminate the selected variables in #emph[reverse] ancestor order. Each bound is uniform in the remaining earlier values, so induction gives one such factor per selected slot. Since $v_C gt.eq 1$ for large $B$, each bound is also $O \( B^(- 1 + eta) \) v_C$. All unselected variables keep their unrestricted harmonic sums. This choice of named pivots requires no enumeration of possible pivots, and the bin condition holds for every slot permutation counted in (2.60).
  The charge contribution is
  $ - kappa \( v_C - T sqrt(v_C) \) r_(*) - #scale(x: 120%, y: 120%)[\[] kappa \( v_C - T sqrt(v_C) \) - v_C beta_C \( e^kappa - 1 \) #scale(x: 120%, y: 120%)[\]] \| cal(U) \| . $
  Both bracketed coefficients exceed $100 log B$ for large $B$: $v_C = \( eta + o \( 1 \) \) log B$, $kappa eta = 400$, and $beta_C \( e^kappa - 1 \) < 1$. Every non-skipped good edge therefore pays either its pivot saving or the stronger factor $B^(- 100)$ from its origin in $cal(U)$. At most $N_(upright("exc"))$ good edges were skipped. Absorbing the constants for at most $ell$ pivots gives (2.61). ◻
]

#thm([Lemma 2.30.])[
  #emph[For sufficiently large $B$, the total conditional main term supplied by 56, including its $exp \( O \( M_0 log B \) \)$ prefactor, is at most $B^(- \( 1 + 2 c_(*) \) ell)$.]
] <lem:trace-summation>

#proof[
  First apply Lemma 2.28, Lemma 2.29 to valid assigned records. The pivot bound is uniform in the detailed record and may be factored out for each topology.
  For the tagged/list groups, unrestricted prime sums cost at most $\( 1 + v_C + v_Z \)^(O \( N_(upright("exc")) \))$. A tagged subtree shape can be summed with its weight using (2.54), at a cost at most $ell + 1$; a ghost has at most $ell$ possible edges and weight $2$. Ignoring compatibility between token shapes increases these positive sums. Thus all these shape costs are $\( O \( ell + 1 \) \)^(O \( N_(upright("exc")) \))$. Together with (2.59), the lost skipped-edge savings and the cylinder prefactor, their logarithm is
  #[#set math.equation(numbering: n => "(2.62)")
   $ O \( N_(upright("exc")) log B + M_0 log B \) = o \( ell \) . $ <eq:trace-small-costs>]
  For the untagged tokens, retain (2.60) and sum over unrestricted multiplicities. Their total is at most
  $ product_(a \, Q) sum_(j gt.eq 0) frac(\( v_a tilde(u)_a \( Q \) \)^j, j !) & = exp {sum_a v_a sum_Q tilde(u)_a \( Q \)} . $
  These are finite products of positive convergent series. They cancel the unmodified background terms $- v_C S_C \( cal(T) \) - v_Z S_Z \( cal(T) \)$ in (2.56). By (2.55), the remaining exponential is
  $ exp {- theta / 2 v_Z \| cal(G) \| + theta v_Z \| E \( cal(T) \) \\ cal(G) \|} lt.eq B^(- \( epsilon \/ 10 \) \| cal(G) \| + epsilon \| E \( cal(T) \) \\ cal(G) \|) $
  for large $B$, since $\( theta \/ 2 \) \( epsilon - eta \) > epsilon \/ 10$ and $theta \( epsilon - eta \) < epsilon$.
  It remains to check the numerical margin including the topology count. Write $g = \| cal(G) \|$, $b = \| E \( cal(T) \) \\ cal(G) \|$ and $r = r_(*)$. Then $ell = g + b + r$ and $b lt.eq 10 \( r + 1 \)$. Set $delta = epsilon \/ 10 - eta = 9 eta$. Combining the preceding bounds, (2.61) and the count in 57, the negative base-$B$ exponent is at least
  $ \( 1 + delta \) g + \( 99 - o \( 1 \) \) r - epsilon b - o \( ell \) . $
  Here $4^ell$ and the fixed constants per pivot contribute $O \( ell \/ log B \) = o \( ell \)$, and $\( ell + 1 \)^r = B^(\( 1 + o \( 1 \) \) r)$. Substitution of $g = ell - b - r$ and $b lt.eq 10 \( r + 1 \)$ gives the lower bound
  $ \( 1 + delta \) ell + \( 88 - 11 delta - 10 epsilon - o \( 1 \) \) r - 10 \( 1 + delta + epsilon \) - o \( ell \) . $
  The coefficient of $r$ is positive, and $delta - 2 c_(*) = 7 eta > 0$. The slack absorbs the fixed last term, the displayed $o \( ell \)$ terms, and the sum over at most $ell + 1$ possible values of $r$. This proves the claimed bound. ◻
]

#proof[
  #emph[Completion of the proof of 43.] The density assertion is 44. Apply 48 to split the trace sum into retained and discarded configurations. For the retained part, the triangle inequality bounds the absolute full expectation by $bb(E)_(cal(F)) R_(bold(d)) \| bb(E)_(cal(S) \\ cal(F)) K_(bold(d)) product_j upright(bold(1))_Y \( n + b_j \) \|$. Now apply 56. Their discarded contributions are $O \( exp \( - B^(1 + epsilon \/ 2) \) \)$. The retained conditional main term is bounded by 62. Since $ell = 2 floor.l B floor.r$,
  $ B^(- \( 1 + 2 c_(*) \) ell) + O \( exp \( - B^(1 + epsilon \/ 2) \) \) lt.eq B^(- \( 1 + c_(*) \) ell) $
  for sufficiently large $B$. This proves the trace assertion and completes the theorem. ◻
]

==== 2.8 From high traces to the graph estimate <sec:localization>

We now prove 33 from 43. The latter controls averages over a finite residue space. The present step converts those averages into a bound for arbitrary test sequences on long intervals, including complex coefficients $a_d$.

Choose a power of two $D_0$ with

$ B^10 H lt.eq D_0 < 2 B^10 H \, $

and partition the positive integers into blocks $I_k = { k D_0 + 1 \, dots.h \, \( k + 1 \) D_0 }$, $k gt.eq 0$. For large $B$, all primes in $cal(S)$ are odd, so $gcd \( D_0 \, Q_B \) = 1$. Let $Y$ be the periodic vertex set from 43. On the coordinates of $I_k$, define the matrix

$ M_k \( x \, y \) = cases(delim: "{", upright(bold(1))_Y \( x \) upright(bold(1))_Y \( y \) frac(a_d g_d \( x \, y \), sqrt(W \( x \) W \( y \))) \, & y = x + h d \, quad d in cal(D) \,, 0 \, & upright("otherwise") .) $

This is a directed matrix and need not be self-adjoint. We therefore use a moment of its singular values.

===== 2.8.1 Averaging the singular-value moment <averaging-the-singular-value-moment>

Set $m = ell \/ 2$. With $y_m = y_0$, matrix multiplication gives exactly

#[#set math.equation(numbering: n => "(2.63)")
 $ "Tr" #scale(x: 120%, y: 120%)[\(] \( M_k^(*) M_k \)^m #scale(x: 120%, y: 120%)[\)] = sum_(y_0 \, dots.h \, y_(m - 1) in I_k) med sum_(x_1 \, dots.h \, x_m in I_k) product_(j = 1)^m overline(M_k \( x_j \, y_(j - 1) \)) M_k \( x_j \, y_j \) . $ <eq:localization-trace>]

A nonzero term describes the closed line

$ y_0 \, x_1 \, y_1 \, x_2 \, y_2 \, dots.h \, x_m \, y_0 \, $

with alternating negative and positive steps of lengths $h d_i$. Its scalar coefficient is $product_(j = 1)^m overline(a_(d_(2 j - 1))) a_(d_(2 j))$, of modulus at most one. Symmetry and reality of $g_d$ identify its edge numerator with that of $K_(upright(bold(d)))$ in (2.36). For the successive vertices $v_0 \, dots.h \, v_ell = v_0$, its denominator satisfies

$ product_(i = 1)^ell sqrt(W \( v_(i - 1) \) W \( v_i \)) = product_(i = 0)^(ell - 1) W \( v_i \) . $

Repeated vertices are counted with multiplicity in this identity. The indicator factors reduce to $product_(i = 0)^ell upright(bold(1))_Y \( v_i \)$.

Fix the initial position $r in { 1 \, dots.h \, D_0 }$ and write $v_i = k D_0 + r + b_i$. The block restrictions are precisely $1 lt.eq r + b_i lt.eq D_0$ for all $i$; they depend only on $r$ and the ordered line. As $k$ runs modulo $Q_B$, the starting point $k D_0 + r$ is uniform modulo $Q_B$. Averaging (2.63) over this period, and taking absolute values after each line’s residue average, gives

#[#set math.equation(numbering: n => "(2.64)")
 $ 0 lt.eq 1 / Q_B sum_(k med mod med Q_B) "Tr" #scale(x: 120%, y: 120%)[\(] \( M_k^(*) M_k \)^m #scale(x: 120%, y: 120%)[\)] & lt.eq D_0 sum_(upright(bold(d))) lr(|bb(E) K_(upright(bold(d))) \( n \) product_(i = 0)^ell upright(bold(1))_Y \( n + b_i \)|)\
 & lt.eq D_0 B^(- \( 1 + c_(*) \) ell) . $ <eq:localization-moment>]

A starting position and its ordered signed line determine all indices in (2.63), so no further multiplicity occurs.

Call a block exceptional if $parallel M_k parallel > B^(- 1 - c_(*) \/ 2)$, where the norm is the Euclidean operator norm. Since $parallel M_k parallel^ell lt.eq "Tr" \( \( M_k^(*) M_k \)^m \)$, its fraction $delta$ among one period of blocks satisfies

#[#set math.equation(numbering: n => "(2.65)")
 $ delta lt.eq D_0 B^(- c_(*) ell \/ 2) = exp #scale(x: 120%, y: 120%)[\(] - Omega \( B log B \) #scale(x: 120%, y: 120%)[\)] . $ <eq:exceptional-blocks>]

Here $log D_0 lt.eq C_0 B + 10 log B + O \( 1 \)$ and $ell tilde.op 2 B$. The threshold for this estimate may depend on $C_0$.

===== 2.8.2 Discarded edges <discarded-edges>

We must control the weight on deleted vertices, exceptional blocks and block boundaries before applying the operator norm. A common absolute degree bound handles all three. Dropping cutoffs and extending the sum to every squarefree product of primes in $cal(S)$ gives, separately for either sign,

#[#set math.equation(numbering: n => "(2.66)")
 $ sum_(d in cal(D)) \| g_d \( x \, x plus.minus h d \) \| & lt.eq product_(p in cal(C)) \( 1 + A upright(bold(1))_(p divides x) \) product_(p in cal(Z)) (1 + lr(|upright(bold(1))_(p divides x) - theta / p|)) lt.eq W \( x \) e^(theta v_Z) . $ <eq:absolute-degree>]

For $p in cal(Z)$ dividing $x$, its factor is $2 - theta \/ p lt.eq 2$; otherwise it is at most $e^(theta \/ p)$. The same bound applies to incoming edges at their terminal vertex, since the residues of both endpoints agree at every prime in their divisor label.

All parameters are now fixed. Periodic averages over the integers equal the corresponding residue averages as $X arrow.r oo$. By 43 and (2.7), the total absolute edge weight incident to $Y^c$, divided by $X$, has limsup at most

$ 2 e^(theta v_Z) bb(E) #scale(x: 120%, y: 120%)[\(] W upright(bold(1))_(Y^c) #scale(x: 120%, y: 120%)[\)] lt.eq 2 e^(theta v_Z) \( bb(E) W^2 \)^(1 \/ 2) bb(P) \( Y^c \)^(1 \/ 2) lt.eq B^(O_A \( 1 \)) P_0^(- 1 \/ 2 + o \( 1 \)) . $

The fixed extension of the interval to $X + tau h H$ does not affect this limsup. The last expression is smaller than every fixed negative power of $B$.

Let $E$ be the union of exceptional blocks. It has period $D_0 Q_B$ and density $delta$. Cauchy–Schwarz over that full period gives

$ lim_(X arrow.r oo) 1 / X sum_(x lt.eq X) W \( x \) upright(bold(1))_E \( x \) lt.eq \( bb(E) W^2 \)^(1 \/ 2) delta^(1 \/ 2) . $

There is no independence assertion between the exceptional-block event and the prime residues. By (2.66), the within-block terms in $E$ cost at most

$ e^(theta v_Z) \( bb(E) W^2 \)^(1 \/ 2) delta^(1 \/ 2) lt.eq B^(O_A \( 1 \)) D_0^(1 \/ 2) B^(- c_(*) ell \/ 4) = exp #scale(x: 120%, y: 120%)[\(] - Omega \( B log B \) #scale(x: 120%, y: 120%)[\)] $

after normalization by $X$ and passage to the limsup.

A forward edge crossing a block boundary begins in the last $ceil.l tau h H ceil.r$ positions of its block. Position modulo $D_0$ and residue modulo $Q_B$ are independent over a full period $D_0 Q_B$. Consequently the crossing cost is at most

$ frac(ceil.l tau h H ceil.r, D_0) L_0 e^(theta v_Z) lt.double_h B^(- 10) L_0 e^(theta v_Z) = o #scale(x: 120%, y: 120%)[\(] L_0 B^(- 1 - c_(*) \/ 2) #scale(x: 120%, y: 120%)[\)] . $

In the first two estimates we may also compare with this target, since $L_0 gt.eq 1$. Thus all three discarded contributions are negligible.

===== 2.8.3 The bilinear estimate <the-bilinear-estimate>

Use the standard complex inner product, conjugate-linear in its first argument, and define

$ u \( x \) = overline(F \( x \)) sqrt(W \( x \)) upright(bold(1))_(1 lt.eq x lt.eq X) \, #h(2em) v \( y \) = G \( y \) sqrt(W \( y \)) upright(bold(1))_(1 lt.eq y lt.eq X + tau h H) . $

Then $chevron.l u \|_(I_k) \, M_k v \|_(I_k) chevron.r$ is exactly the desired unnormalized sum over edges in $I_k$ with endpoints in $Y$. On nonexceptional blocks, Cauchy–Schwarz in the block index yields

$ lr(|sum_(k med upright("nonexceptional")) chevron.l u \|_(I_k) \, M_k v \|_(I_k) chevron.r|) & lt.eq B^(- 1 - c_(*) \/ 2) (sum_(x lt.eq X) W \( x \))^(1 \/ 2) (sum_(y lt.eq X + tau h H) W \( y \))^(1 \/ 2)\
 & = \( L_0 + o_(X arrow.r oo) \( 1 \) \) X B^(- 1 - c_(*) \/ 2) . $

The source cutoff in $u$ also handles the last partially used block. Adding back the three negligible edge classes proves 33. This closes the deferred graph input in 2, and hence completes the proof of 2.

== 3 Progressions and affine forms <progressions-and-affine-forms>

==== 3.1 Local factors and affine correlations <sec:affine-corollaries>

We now deduce correlations on arbitrary fixed progressions and affine forms from 2. The main point is to handle the primes dividing a progression modulus or a dilation without assuming complete multiplicativity. A finite expansion at these primes will suffice.

===== 3.1.1 Stability and finite local expansions <stability-and-finite-local-expansions>

We first extend 38 to character twists and complex conjugation.

#thm([Lemma 3.1.])[
  (Character twists and conjugation).  #emph[Let $f \, G : bb(N) arrow.r bb(D)$ be multiplicative, let $psi$ be a fixed Dirichlet character, and let $S$ be a finite set of primes. If $G \( p \) = f \( p \) psi \( p \)$ for every $p in.not S$, then for every Dirichlet character $chi$, every real $t$, and every $X gt.eq 2$, 
#[#set math.equation(numbering: n => "(3.1)")
 $ lr(|D \( G \, chi n^(i t) \; X \)^2 - D \( f \, \( chi overline(psi) \) n^(i t) \; X \)^2|) lt.eq 2 sum_(p in S) 1 / p . $ <eq:affine-stability>]

 Thus uniform nonpretentiousness of $f$ implies that of $G$. Complex conjugation also preserves uniform nonpretentiousness.]
] <lem:affine-stability>

#proof[
  The product $chi overline(psi)$ is a Dirichlet character modulo the least common multiple of the two moduli. At every prime outside $S$,
  $ G \( p \) overline(chi \( p \) p^(i t)) = f \( p \) overline(\( chi overline(psi) \) \( p \) p^(i t)) . $
  This identity holds also at primes where a character vanishes. Each prime in $S$ contributes at most $2 \/ p$ to the difference of squared distances, proving (3.1). Take the infimum over exactly $\| t \| lt.eq X$ on both sides of the resulting lower bound. For each fixed $chi$, the character $chi overline(psi)$ is fixed, and the bounded error cannot prevent divergence to infinity. For conjugation the exact identity is
  $ D \( overline(f) \, chi n^(i t) \; X \)^2 = D \( f \, overline(chi n)^(- i t) \; X \)^2 . $
  The interval $\| t \| lt.eq X$ is unchanged by $t mapsto - t$. ◻
]

A multiplicative function is either identically zero or has value one at $1$: apply multiplicativity to $\( 1 \, n \)$. Zero factors give zero correlations, so in the following local construction we may work with normalized functions. Write $v_p \( m \)$ for the exponent of $p$ in $m$.

#thm([Lemma 3.2.])[
  (A finite expansion for dilation).  #emph[Let $a gt.eq 1$ be an integer and let $f : bb(N) arrow.r bb(D)$ be multiplicative with $f \( 1 \) = 1$. Define 
#[#set math.equation(numbering: n => "(3.2)")
 $ F_(a \, f) \( m \) = cases(delim: "{", f \( m \/ a \) \, & a divides m \,, 0 \, & a divides.not m .) $ <eq:affine-dilation-function>]

 Then $F_(a \, f)$ is a signed sum of $2^(omega \( a \))$ normalized, $1$-bounded multiplicative functions, each agreeing with $f$ at every prime power whose prime does not divide $a$. If $f$ is uniformly nonpretentious, every function in this sum is uniformly nonpretentious.]
] <lem:affine-dilation>

#proof[
  Let $P \( a \)$ be the set of prime divisors of $a$. For $p in P \( a \)$ set $alpha_p = v_p \( a \)$ and define
  #[#set math.equation(numbering: n => "(3.3)")
   $ A_p \( k \) = cases(delim: "{", 0 \, & 0 lt.eq k < alpha_p \,, f \( p^(k - alpha_p) \) \, & k gt.eq alpha_p .) $ <eq:affine-local-sequence>]
  Factorization into pairwise coprime prime powers gives the exact identity
  #[#set math.equation(numbering: n => "(3.4)")
   $ F_(a \, f) \( m \) = product_(p in P \( a \)) A_p \( v_p \( m \) \) product_(p divides m\
p in.not P \( a \)) f \( p^(v_p \( m \)) \) . $ <eq:affine-local-product>]
  No identity between $f \( p^k \)$ and $f \( p \)^k$ is used.
  The obstruction to multiplicativity in this product is that $A_p \( 0 \) = 0$. Resolve it by setting
  #[#set math.equation(numbering: n => "(3.5)")
   $ B_p \( 0 \) = C_p \( 0 \) = 1 \, #h(2em) B_p \( k \) = A_p \( k \) \, quad C_p \( k \) = 0 quad \( k gt.eq 1 \) . $ <eq:affine-b-minus-c>]
  Then $A_p = B_p - C_p$ at every nonnegative exponent. For $E subset.eq P \( a \)$ put
  $ f_(a \, E) \( m \) = product_(p in E) C_p \( v_p \( m \) \) product_(p in P \( a \) \\ E) B_p \( v_p \( m \) \) product_(p divides m\
p in.not P \( a \)) f \( p^(v_p \( m \)) \) . $
  All local factors have modulus at most one and value one at exponent zero. If $u$ and $v$ are coprime, at most one of $v_p \( u \) \, v_p \( v \)$ is positive at each prime; hence $f_(a \, E) \( u v \) = f_(a \, E) \( u \) f_(a \, E) \( v \)$. Expanding the finite product in (3.4) yields
  #[#set math.equation(numbering: n => "(3.6)")
   $ F_(a \, f) \( m \) = sum_(E subset.eq P \( a \)) \( - 1 \)^(\| E \|) f_(a \, E) \( m \) . $ <eq:affine-dilation-expansion>]
  Each summand agrees with $f$ at prime powers outside $P \( a \)$, so 38 proves the last assertion. ◻
]

For $a = 1$ the expansion has just one term, namely $f$. For $a > 1$ and $m = 1$, its signed sum is $sum_(E subset.eq P \( a \)) \( - 1 \)^(\| E \|) = 0$, as required. Thus the expansion also handles the value at $1$, despite normalizing every summand there.

#thm([Lemma 3.3.])[
  (Every residue class).  #emph[Let $l gt.eq 1$ and $0 lt.eq b < l$ be integers, and set 
$ d = gcd \( b \, l \) \, #h(2em) q = l \/ d \, #h(2em) c = b \/ d . $

 For every positive integer $m$, 
#[#set math.equation(numbering: n => "(3.7)")
 $ upright(bold(1))_(m equiv b med \( mod med l \)) = frac(1, phi \( q \)) sum_(chi med mod med q) overline(chi \( c \)) F_(d \, chi) \( m \) . $ <eq:affine-character-expansion>]

 Each $F_(d \, chi)$ is a signed sum of $2^(omega \( d \))$ normalized, $1$-bounded multiplicative functions agreeing with $chi$ at all prime powers outside $d$. For $q = 1$, the character in the formula is the constant function one, including at the residue $c = 0$, and $phi \( 1 \) = 1$.]
] <lem:affine-residue>

#proof[
  If $d divides.not m$, both sides vanish. If $d divides m$, the congruence on the left is equivalent to $m \/ d equiv c med \( mod med q \)$. When $q > 1$, the residue $c$ is a unit modulo $q$, so character orthogonality on $\( bb(Z) \/ q bb(Z) \)^times$ gives
  $ upright(bold(1))_(m \/ d equiv c med \( mod med q \)) = frac(1, phi \( q \)) sum_(chi med mod med q) overline(chi \( c \)) chi \( m \/ d \) . $
  For a nonunit $m \/ d$ every character on the right vanishes. The case $q = 1$ is the trivial identity with the stated convention. The finite expansion now follows from 64. ◻
]

In particular, if $p divides d$ and $alpha = v_p \( d \)$, the local sequence in this application is

$ A_p \( k \) = 0 quad \( k < alpha \) \, #h(2em) A_p \( k \) = chi \( p \)^(k - alpha) quad \( k gt.eq alpha \) \, #h(2em) 0^0 = 1 . $

If $p$ also divides $q$, then $chi \( p \) = 0$ and this sequence is one at $k = alpha$ and zero elsewhere. No character value is divided out. When $b = 0$ we have $d = l$ and $q = 1$, so the same formula expands $upright(bold(1))_(l divides m)$; it includes $l = 1$ and $m = 1$.

===== 3.1.2 Progressions and the affine deduction <progressions-and-the-affine-deduction>

The two expansions just proved reduce the desired averages to finitely many applications of 2. We first incorporate a progression restriction, placing its weight at the argument of a nonpretentious factor.

#thm([Proposition 3.4.])[
  (Correlations on fixed progressions).  #emph[Let $f_1 \, f_2 : bb(N) arrow.r bb(D)$ be multiplicative, with at least one uniformly nonpretentious. For fixed distinct nonnegative integers $h_1 \, h_2$, an integer $l gt.eq 1$, and any integer $b$, 
#[#set math.equation(numbering: n => "(3.8)")
 $ 1 / X sum_(1 lt.eq n lt.eq X) f_1 \( n + h_1 \) f_2 \( n + h_2 \) upright(bold(1))_(n equiv b med \( mod med l \)) arrow.r 0 #h(2em) \( X arrow.r oo \) . $ <eq:affine-progression-limit>]

 The limit holds through all real $X$, including nonunit residue classes.]
] <prop:affine-progression>

#proof[
  We may assume both functions are nonzero. Choose $j in { 1 \, 2 }$ for which $f_j$ is uniformly nonpretentious. Since
  $ upright(bold(1))_(n equiv b med \( mod med l \)) = upright(bold(1))_(n + h_j equiv b + h_j med \( mod med l \)) \, $
  65, using the least nonnegative representative of $b + h_j$ modulo $l$, expands the indicator as a function of $m = n + h_j$ into finitely many bounded multiplicative functions, each agreeing with a fixed Dirichlet character outside a fixed finite prime set. Their products with $f_j$ are uniformly nonpretentious by 63. Apply 2 to each product at shift $h_j$ and the unchanged other factor at its distinct shift, and sum the finitely many conclusions. This proves (3.8) at integer $X$. For real $X$, replacing the normalization $X$ by $floor.l X floor.r$ changes the average by at most $1 \/ X$, proving the assertion. ◻
]

#proof[
  Zero factors again give an immediate conclusion. Otherwise set
  #[#set math.equation(numbering: n => "(3.9)")
   $ Delta = a_1 b_2 - a_2 b_1 \, #h(2em) l = a_1 a_2 \, #h(2em) c_0 = min \( a_2 b_1 \, a_1 b_2 \) \, #h(2em) h = \| Delta \| gt.eq 1 . $ <eq:affine-parameters>]
  For $Delta > 0$ put $U = F_(a_2 \, f_1)$ and $V = F_(a_1 \, f_2)$; for $Delta < 0$ put $U = F_(a_1 \, f_2)$ and $V = F_(a_2 \, f_1)$. In either case,
  #[#set math.equation(numbering: n => "(3.10)")
   $ U \( l n + c_0 \) V \( l n + c_0 + h \) = f_1 \( a_1 n + b_1 \) f_2 \( a_2 n + b_2 \) . $ <eq:affine-exact-identity>]
  Indeed, when $Delta > 0$ the two arguments on the left are $a_2 \( a_1 n + b_1 \)$ and $a_1 \( a_2 n + b_2 \)$; when $Delta < 0$ their order is reversed.
  Expand $U$ and $V$ by 64. Each pair of multiplicative components has a uniformly nonpretentious factor, inherited from the corresponding original function. Applying 66 termwise with shifts $0 \, h$ gives
  #[#set math.equation(numbering: n => "(3.11)")
   $ 1 / X sum_(1 lt.eq m lt.eq X) U \( m \) V \( m + h \) upright(bold(1))_(m equiv c_0 med \( mod med l \)) arrow.r 0 . $ <eq:affine-expanded-limit>]
  Put $T \( m \) = U \( m \) V \( m + h \) upright(bold(1))_(m equiv c_0 med \( mod med l \))$ and $X = l N + c_0$. The integers in this class satisfying $c_0 < m lt.eq X$ are precisely $l n + c_0$, $1 lt.eq n lt.eq N$. Therefore
  #[#set math.equation(numbering: n => "(3.12)")
   $ 1 / N sum_(n = 1)^N f_1 \( a_1 n + b_1 \) f_2 \( a_2 n + b_2 \) & = X / N (1 / X sum_(1 lt.eq m lt.eq X) T \( m \)) - 1 / N sum_(1 lt.eq m lt.eq c_0) T \( m \) . $ <eq:affine-endpoints>]
  The first term tends to zero because $X \/ N arrow.r l$ and (3.11) holds. The second has modulus at most $c_0 \/ N$ and is empty when $c_0 = 0$. This proves the corollary, including zero intercepts and coefficients with common factors. ◻
]

===== 3.1.3 Liouville and Möbius correlations <liouville-and-möbius-correlations>

To apply the preceding conclusions to the Liouville function, we verify the nonpretentiousness hypothesis over its full growing height interval. The required uniform estimate is supplied by Matomäki, Radziwiłł, and Tao’s version of an argument of Granville and Soundararajan #cite(label("MRT15")) Appendix C.

#thm([Lemma 3.5.])[
  (Uniform nonpretentiousness of Liouville).  #emph[For every fixed Dirichlet character $chi$, 
#[#set math.equation(numbering: n => "(3.13)")
 $ inf_(\| t \| lt.eq X) D \( lambda \, chi n^(i t) \; X \) gt.eq 1 / 4 sqrt(log log X) - O_chi \( 1 \) #h(2em) \( X gt.eq 100 \) . $ <eq:affine-liouville-unp>]

 In particular, $lambda$ is uniformly nonpretentious.]
] <lem:affine-liouville-unp>

#proof[
  For a real $1$-bounded multiplicative function $f$, #cite(label("MRT15")) Lemma C.1 gives
  #[#set math.equation(numbering: n => "(3.14)")
   $ D \( f \, chi n^(i t) \; X \) gt.eq 1 / 4 sqrt(log log X) - O_chi \( 1 \) quad \( 1 lt.eq \| t \| lt.eq X \) . $ <eq:affine-real-large-height>]
  When $chi^2$ is nonprincipal the same bound holds throughout $\| t \| lt.eq X$. Thus taking $f = lambda$ proves the assertion for nonreal $chi$ and handles $1 lt.eq \| t \| lt.eq X$ for all $chi$. For real $chi$, the other part of the cited lemma gives
  #[#set math.equation(numbering: n => "(3.15)")
   $ D \( lambda \, chi n^(i t) \; X \) gt.eq 1 / 3 D \( lambda \, chi \; X \) - O \( 1 \) quad \( \| t \| lt.eq 1 \) . $ <eq:affine-real-small-height>]
  It remains to estimate the distance at $t = 0$ for these real characters.
  If $chi$ is nonprincipal, the prime number theorem in arithmetic progressions for its fixed modulus yields, for some $c_chi > 0$,
  $ A_chi \( u \) := sum_(p lt.eq u) chi \( p \) log p = O_chi #scale(x: 120%, y: 120%)[\(] u exp \( - c_chi sqrt(log u) \) #scale(x: 120%, y: 120%)[\)] . $
  Partial summation gives
  $ sum_(p lt.eq X) frac(chi \( p \), p) = frac(A_chi \( X \), X log X) + integral_2^X A_chi \( u \) frac(log u + 1, u^2 \( log u \)^2) thin d u = O_chi \( 1 \) \, $
  since the integral converges absolutely as $X arrow.r oo$. As $lambda \( p \) = - 1$, Mertens’ estimate now gives
  $ D \( lambda \, chi \; X \)^2 = sum_(p lt.eq X) frac(1 + chi \( p \), p) = log log X + O_chi \( 1 \) . $
  If instead $chi$ is principal modulo $q$, then
  $ D \( lambda \, chi \; X \)^2 = 2 sum_(p lt.eq X) 1 / p - sum_(p divides q\
p lt.eq X) 1 / p = 2 log log X + O_q \( 1 \) . $
  In both cases (3.15) is at least $1 / 3 sqrt(log log X) - O_chi \( 1 \)$. Combining this with (3.14) proves (3.13) on the entire interval $\| t \| lt.eq X$. ◻
]

Thus $lambda$ satisfies the exact hypothesis of the qualitative theorem. Applying Proposition 3.4, Corollary 3 with $f_1 = f_2 = lambda$ independently recovers ordinary cancellation in every fixed residue class and along every fixed nonproportional affine pair. Proposition 1.1, Theorem 1 establish these conclusions with an absolute power-of-logarithm saving.

The qualitative theorem also applies to the Möbius function, defined by

$ mu \( n \) = cases(delim: "{", lambda \( n \) \, & n upright(" is squarefree") \,, 0 \, & n upright(" is not squarefree") .) $

This function is multiplicative and has $mu \( p \) = lambda \( p \) = - 1$ at every prime. Since the distance uses only prime values,

$ D \( mu \, chi n^(i t) \; X \) = D \( lambda \, chi n^(i t) \; X \) $

for every Dirichlet character $chi$, real $t$, and $X gt.eq 2$. The preceding lemma therefore proves uniform nonpretentiousness of $mu$ with the same growing twist range. The conclusions of Proposition 3.4, Corollary 3 hold for any choice $f_1 \, f_2 in { lambda \, mu }$. This proves ordinary cancellation for two-point Möbius and mixed Möbius–Liouville correlations in every fixed residue class and along every fixed nonproportional affine pair. For products containing a Möbius factor, this deduction gives convergence without a quantitative rate.


#bibliography("refs.bib", style: "ieee", title: [References])
