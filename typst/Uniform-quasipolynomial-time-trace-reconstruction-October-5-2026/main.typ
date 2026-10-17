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

#align(center)[#text(size: 16pt, weight: "bold")[Uniform quasipolynomial-time trace reconstruction]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <introduction>

A deletion trace of a binary string is obtained by retaining each position independently with probability $p$ and concatenating the retained bits in order. The trace contains its length and its bits, but does not identify their original positions. Trace reconstruction asks for the original string from independent repetitions of this experiment. We consider the worst case: the unknown string is arbitrary, and the recovery probability must hold separately for each string.

Knowing that a collection of statistics distinguishes every pair of strings gives a sample bound, but an efficient decoder needs a way to find the unknown string. We obtain such a decoder by extending separation to a convex family of moment arrays. The resulting tests determine one bit at a time and can be implemented using rational arithmetic.

=== 1.1 The uniform guarantee <the-uniform-guarantee>

Let $n gt.eq 2$ be the known original length and let $p = a \/ b in \( 0 \, 1 \]$ be known, where $a \, b$ are positive integers in lowest terms. Write $L$ for the total binary length of $a$ and $b$, and put $q = 1 - p$. All logarithms are natural unless a base is displayed. Define

#[#set math.equation(numbering: n => "(1.1)")
 $ sans(X) \( n \, p \) & = cases(delim: "{", 1 + frac(log n, 1 + log \( 1 \/ q \)) \, & q > 0 \,, 1 \, & q = 0 \,)\
B \( n \, p \) & = p^(- 1) \( log n \) sans(X) \( n \, p \)^2 \( 1 + log sans(X) \( n \, p \) \)^6 . $ <eq:budget>]

#thm([Theorem 1.1.])[
  (Uniform trace reconstruction).  #emph[There exist absolute constants $C \, c gt.eq 1$ and one randomized multitape Turing machine $cal(A)$ with the following property. For every $n gt.eq 2$, every rational $p in \( 0 \, 1 \]$, and every $x in { 0 \, 1 }^n$, given $n \, p$ in binary and access to independent ordinary deletion traces of $x$, the machine requests at most 
$ M_C \( n \, p \) = ⌈exp #scale(x: 120%, y: 120%)[\(] C B \( n \, p \) #scale(x: 120%, y: 120%)[\)]⌉ $

 traces, outputs an element of ${ 0 \, 1 }^n$, and returns $x$ with probability at least $2 \/ 3$.]
  #emph[For every internal random-bit sequence and every well-formed trace stream of strings of length at most $n$, it halts within 
$ #scale(x: 120%, y: 120%)[\(] n + L + M_C \( n \, p \) #scale(x: 120%, y: 120%)[\)]^c $

 bit operations. This bound includes preprocessing, all parameter and finite-precision calculations, every received trace bit and delimiter, and the output. The only oracle operation is the external generation of the independent deletion traces.]
] <thm:main>

For fixed $p$, the budget in (1.1) is $O_p \( \( log n \)^3 \( 1 + log log n \)^6 \)$ as $n arrow.r oo$. Thus both resources in Theorem 1 are quasipolynomial. The theorem also controls channels whose retention probability varies with $n$, including probabilities arbitrarily close to zero or one. Its running-time guarantee is polynomial in the permitted sample budget. For every fixed $kappa > 0$, the regime $q lt.eq n^(- kappa)$ has polynomial sample complexity in $n$ and polynomial bit complexity in $n + L$: indeed, $sans(X) \( n \, p \) lt.eq 1 + 1 \/ kappa$ and $p^(- 1)$ is bounded by a constant depending only on $kappa$, so $B \( n \, p \) = O_kappa \( log n \)$.

=== 1.2 History and relation to earlier work <history-and-relation-to-earlier-work>

Reconstructing a sequence from corrupted copies has a broad information-theoretic history; Levenshtein studied reconstruction under several combinatorial and probabilistic channel models [15]. Batu, Kannan, Khanna, and McGregor formulated reconstruction from independent random deletion traces in theoretical computer science, motivated in part by sequence alignment [2]. The missing positions make the problem different from coordinatewise denoising: the same trace rank can originate at many input positions.

For a fixed deletion probability, Holenstein, Mitzenmacher, Panigrahy, and Wieder obtained a worst-case sample bound $exp \( tilde(O) \( sqrt(n) \) \)$ [13]. In independent papers published at STOC 2017, De, O’Donnell, and Servedio, and Nazarov and Peres, obtained $exp \( O \( n^(1 \/ 3) \) \)$ bounds and matching limitations for methods using only trace means [11,17]. Their complex-analytic approach connects deletion statistics to bounded-coefficient polynomials; analytic inequalities of Borwein and Erdélyi are part of the background to this method [3]. The mean-based lower bound is a restriction on that method, not on arbitrary trace algorithms.

Chase improved the general sample upper bound to $exp \( O \( n^(1 \/ 5) log^5 n \) \)$ [6]. On the lower-bound side, Holden and Lyons proved an almost-$n^(5 \/ 4)$ bound, and Chase strengthened it to $Omega \( n^(3 \/ 2) \/ log^7 n \)$ for fixed deletion probability [12,5]. Burudgunte, Valiant, and Wang subsequently proved the sample bound

$ exp #scale(x: 120%, y: 120%)[\(] p^(- 7 \/ 3) \( log_2 n \)^(c_0) #scale(x: 120%, y: 120%)[\)] $

for an absolute $c_0$, using nonlocal low-order statistics and a multiscale propagation argument [4] Theorem 43. This bound is quasipolynomial when $p^(- 1)$ is polylogarithmic in $n$. Theorem 1 builds on this strategy and provides an explicit uniform reconstruction algorithm with the displayed bit-complexity bound.

Sample complexity and reconstruction time require different arguments. At fixed confidence, maximum likelihood achieves worst-case reconstruction using at most $O \( n \)$ times the optimal sample count, but evaluating it over all candidate strings entails a large search [10] Corollary 1.1 of the full version. Burudgunte, Valiant, and Wang explicitly distinguish testing two known strings from reconstructing an unknown string, and leave quasipolynomial-time reconstruction open for their approach [4] Section 1. The additional separation proved here concerns every positive semidefinite moment completion of a wrong prefix. It enables constructive feasibility tests in place of a search over complete strings. Earlier polynomial-time results already cover low-deletion regimes [8].

The use of nonlocal statistics is essential to the comparison with known barriers. Chen, De, Lee, and Servedio proved strong lower bounds for statistical queries restricted to short #emph[consecutive] trace blocks [7]. Our statistics involve few ranks but may span the whole trace, as in [4]. The generating-function identity used to transfer them from input coordinates has antecedents in higher-order trace reconstruction [9,6].

The positive moment relaxation is a Boolean instance of the semidefinite moment and sum-of-squares framework [14,18]. The finite feasibility iteration is related to the classical relaxation methods of Agmon and Motzkin–Schoenberg [1,16]. We prove the analytic separation and the rational implementation directly; no external trace-reconstruction or optimization theorem is needed.

=== 1.3 Proof strategy and additional ingredients <proof-strategy-and-additional-ingredients>

The decoder estimates products of bits at specified trace ranks; those ranks may be far apart. It then tests a proposed prefix by asking for moments of the remaining input bits that agree with these estimates within a prescribed tolerance. The moment array is constrained so that the expected squared magnitude of every polynomial up to a prescribed degree is nonnegative. Actual distributions give such arrays, but an arbitrary feasible array need not come from a distribution.

The central statement separates the true input from every such array fixing a wrong prefix. Let $d$ be the first wrong position, and write $Delta \[ P \]$ for the difference between the array’s value on a polynomial $P$ and its value at the true input. Then $Delta \[ X_d \] = plus.minus 1$, whereas all differences strictly before $d$ vanish. We propagate this local signal through progressively larger distance scales. At each stage, the statistics are weighted sums over increasing tuples of input positions, with exponential weights on their gaps. We track an exponentially damped Fourier sum of the discrepancies of these tuple statistics, indexed by the last input position. The aim is to reduce its damping and frequency while retaining a detectable discrepancy.

Two features make this propagation compatible with the convex relaxation. First, positivity turns polynomial moments into inner products. If squared norms and neighboring inner products along a chain of $J$ vectors differ from one by at most $xi$, then a telescoping argument bounds the endpoint error by $O \( J^2 xi \)$. Applied to normalized Fourier sums and their products, this forces a detectable product whose total frequency is small. Pairing frequencies at prescribed differences under a Cauchy density supplies enough pairs for this chain.

Second, a Gaussian contour deformation converts each such product back into a tuple statistic with smaller decay and frequency. The paths joining consecutive positions in each old tuple, together with links between their endpoints, form a connected graph. A spanning tree assigns distinct edges to the new gaps, controlling the coefficient mass under interleaving. This retains the signal while the tuple order increases by a factor of at most four.

After the last scale, a generating-function identity transfers input statistics to ordinary trace statistics. In this identity, the channel substitution $z = q + p w$ maps the unit disk in a trace gap parameter $w$ to the disk $\| z - q \| lt.eq p$ in the corresponding input parameter $z$. A single complex strip moves all input gap parameters into these disks simultaneously. This supplies the quantitative separation theorem without requiring the algorithm to search for any of the analytic witnesses.

Finally, when the empirical estimates are sufficiently accurate, a true prefix has a moment completion with strict slack: give independent uniform signs a sufficiently small weight in a mixture with its true completion. This preserves the statistical tolerance while making the moment matrix positive definite. We exploit that slack with an explicit sequence of rational updates, exact positivity tests, and rounding to a fixed dyadic grid. A fixed iteration cap gives the worst-stream bound in Theorem 1.

Section 2 introduces the relaxation. Section 3 proves the multiscale step, and Section 4 transfers its signal to traces. Section 5 constructs the decoder and proves Theorem 1.

== 2 Moment relaxations and prefix separation <sec:setup>

We first describe the finite collection of statistics used by the decoder and the convex set against which they will separate the true input. Throughout, $\[ n \] = { 1 \, dots.h \, n }$ and $X_1 \, dots.h \, X_n$ are formal Boolean variables. Products and degrees are understood after the reductions $X_i^2 = X_i$.

=== 2.1 Observable trace moments <observable-trace-moments>

For a nonempty rank set $I = { ell_1 < dots.h.c < ell_k } subset.eq \[ n \]$, the corresponding trace observable is the product of the bits at those ranks, with value zero if the trace has length less than $ell_k$. Let $T_I \( X \)$ be its channel expectation, regarded as a polynomial in the input bits. More explicitly,

$ T_I \( X \) = sum_(i_1 < dots.h.c < i_k) c_(I \; i_1 \, dots.h \, i_k) thin X_(i_1) dots.h.c X_(i_k) \, $

where $c_(I \; i_1 \, dots.h \, i_k)$ is the probability that the selected input positions appear at ranks $ell_1 \, dots.h \, ell_k$ in a deletion trace. These events are disjoint as the input tuple varies. Consequently the coefficients are nonnegative, their sum is at most one, and the degree is at most $k$. They are rational when $p$ is rational. The algorithm will estimate $T_I \( x \)$ by averaging the observable over independent traces; it never observes the input positions that determine the coefficients.

=== 2.2 Positive moment arrays <positive-moment-arrays>

The following Boolean moment relaxation is a specialization of the semidefinite moment and sum-of-squares frameworks of Lasserre [14] Section 2 and Parrilo [18] Sections 4.2–4.3. We use only its defining positivity condition and elementary consequences, proved below. Fix a proposed prefix $u in { 0 \, 1 }^d$ and an integer $D gt.eq 1$. On the remaining positions $U = { d + 1 \, dots.h \, n }$, use sign variables $Y_i = 2 X_i - 1$, so $Y_i^2 = 1$. A moment array consists of real numbers $m_J$ for $J subset.eq U$ with $\| J \| lt.eq 2 D$, including $m_diameter = 1$, subject to

#[#set math.equation(numbering: n => "(2.1)")
 $ cal(M)_D \( m \) = #scale(x: 120%, y: 120%)[\(] m_(I triangle.stroked.t J) #scale(x: 120%, y: 120%)[\)]_(I \, J subset.eq U \, med \| I \| \, \| J \| lt.eq D) succ.curly.eq 0 . $ <eq:moment-matrix>]

Only existing subsets are indexed; thus the definition also applies when $D > \| U \|$ or $U$ is empty.

The array defines a functional $cal(E)$ on polynomials of degree at most $2 D$ by substituting $X_i = u_i$ for $i lt.eq d$, expanding the other bits as $\( 1 + Y_i \) \/ 2$, reducing $Y_i^2 = 1$, and setting $cal(E) \[ product_(i in J) Y_i \] = m_J$. We extend this functional complex linearly. We call it a #emph[positive moment functional of order $2 D$ fixing $u$]. This terminology asserts (2.1), not the existence of a probability distribution realizing all its moments.

#thm([Lemma 2.1.])[
  (Elementary moment bounds).  #emph[For every array satisfying (2.1), one has $\| m_J \| lt.eq 1$ for $\| J \| lt.eq 2 D$. The value under $cal(E)$ of any product of at most $2 D$ distinct input bits has magnitude at most one. On polynomials of degree at most $D$, the form 
$ chevron.l P \, R chevron.r_(cal(E)) = cal(E) \[ P overline(R) \] $

 is a positive semidefinite Hermitian form, linear in its first argument. It satisfies Cauchy–Schwarz and becomes an inner product after quotienting by its zero-norm subspace.]
] <lem:moment-bounds>

#proof[
  The empty moment equals one. Every nonempty $J$ with $\| J \| lt.eq 2 D$ can be partitioned as $J = I union.sq K$ with $\| I \| \, \| K \| lt.eq D$. The $I \, K$ principal submatrix in (2.1) has diagonal entries one and off-diagonal entry $m_J$, giving $\| m_J \| lt.eq 1$. Expanding a product of unfixed bits as $2^(- t) product \( 1 + Y_i \)$ is a convex combination of these sign monomials; fixed bits either remove factors or make the product zero. This proves the second assertion. The final assertion is the Gram-form interpretation of the real symmetric positive semidefinite matrix (2.1), extended to complex coefficient vectors. Cauchy–Schwarz follows by applying positivity to $P + z R$ for $z in bb(C)$; it also shows that every zero-norm vector is orthogonal to every vector, so the quotient is well defined. ◻
]

Fix a true input $x in { 0 \, 1 }^n$ and a prefix $u$ of length $d$ with

$ u_i = x_i quad \( i < d \) \, #h(2em) u_d = 1 - x_d . $

For a positive moment functional fixing $u$, write

$ Delta \[ P \] = cal(E) \[ P \] - P \( x \) . $

Then $Delta \[ X_d \] = plus.minus 1$, and $Delta \[ P \] = 0$ whenever $P$ uses only positions strictly before $d$. If $P$ is a linear combination of bit monomials of degree at most $2 D$, Lemma 2 gives

#[#set math.equation(numbering: n => "(2.2)")
 $ \| Delta \[ P \] \| lt.eq 2 sum_A \| c_A \| quad upright("when ") P = sum_A c_A product_(i in A) X_i . $ <eq:delta-coefficients>]

For $p < 1$, introduce

#[#set math.equation(numbering: n => "(2.3)")
 $ q_(*) = max \( q \, 1 \/ n \) \, #h(2em) Q = 1 + log \( 1 \/ q_(*) \) \, #h(2em) Y = 1 + frac(log n, Q) . $ <eq:aux-parameters>]

When $q gt.eq 1 \/ n$, $Y = sans(X) \( n \, p \)$. When $q < 1 \/ n$, $1 lt.eq sans(X) \( n \, p \) lt.eq Y < 2$. Hence

$ sans(X) \( n \, p \) lt.eq Y lt.eq 2 sans(X) \( n \, p \) \, #h(2em) Q Y = Q + log n lt.eq C log n $

for an absolute constant $C$, since $n gt.eq 2$.

#thm([Theorem 2.2.])[
  (Separation from a wrong prefix).  #emph[There exist absolute constants $C_(upright("sep")) gt.eq 1$ and an integer $H gt.eq 1$ with the following property. For $n gt.eq 2$ and $0 < p < 1$, define 
$ D_(*) = 4^(ceil.l log_2 Y ceil.r + H) lt.eq 4^(H + 1) Y^2 \, $

 using (2.3). For every $x in { 0 \, 1 }^n$, every $d in \[ n \]$, and every positive moment functional of order $2 D$ fixing $x_1 \, dots.h \, x_(d - 1) \, 1 - x_d$, where $D gt.eq D_(*)$, some nonempty $I subset.eq \[ n \]$ with $\| I \| lt.eq D_(*)$ satisfies 
$ \| cal(E) \[ T_I \] - T_I \( x \) \| > exp #scale(x: 120%, y: 120%)[\(] - C_(upright("sep")) B \( n \, p \) #scale(x: 120%, y: 120%)[\)] . $

]
] <thm:separation>

The theorem concerns every feasible array, including arrays not represented by distributions. Its proof occupies the next two sections. Once it is available, empirical trace moments rule out every wrong extension of a correct prefix. Section 5 shows how to find the feasible extension with an explicit bounded computation.

=== 2.3 Exponentially weighted tuple statistics <exponentially-weighted-tuple-statistics>

For the analytic proof, fix $x \, d \, cal(E)$ as above. For $1 lt.eq k lt.eq 2 D$, an #emph[order-$k$ feature] is a sequence of polynomials

#[#set math.equation(numbering: n => "(2.4)")
 $ f_j = sum_(i_1 < dots.h.c < i_k = j) X_(i_1) dots.h.c X_(i_k) product_(h = 1)^(k - 1) z_h^(i_(h + 1) - i_h) \, #h(2em) j in \[ n \] \, $ <eq:feature>]

where $z_h = exp \( - a_h + upright(i) theta_h \)$, $a_h > 0$, and $theta_h in bb(R)$. For $k = 1$ this means $f_j = X_j$. Put

$ H_f = product_(h = 1)^(k - 1) \( 1 + 1 \/ a_h \) . $

Summing geometric series in the positive gaps shows that $H_f gt.eq 1$ bounds the sum of the absolute coefficients of each $f_j$, since $\( 1 - e^(- a) \)^(- 1) lt.eq 1 + 1 \/ a$ for $a > 0$. For $s > 0$ and $omega in bb(R)$, define its signal by

#[#set math.equation(numbering: n => "(2.5)")
 $ cal(S)_f \( s \, omega \) = sum_(j = 1)^n Delta \[ f_j \] e^(\( - s + upright(i) omega \) \( j - d \)) . $ <eq:signal>]

Every monomial in $f_j$ uses positions at most $j$, so $Delta \[ f_j \] = 0$ for $j < d$. Thus, despite the centered exponent, only nonnegative distances contribute to (2.5). The purpose of the multiscale argument is to preserve a detectable signal while reducing $s$ and $\| omega \|$, at the cost of increasing $k$.

== 3 Moving a signal to a larger scale <sec:multiscale>

The signal in (2.5) discounts positions beyond distance about $1 \/ s$ from the first disagreement. The next proposition moves such a signal to a much smaller decay parameter. It permits an increase in feature order, but keeps the loss in the logarithm of the signal below a factor of eight. Controlling the angles of the new parameters is equally important: those bounds will later permit passage from input coordinates to trace coordinates. Enlarging spatial scales while increasing statistic order follows the strategy of Burudgunte, Valiant, and Wang [4]. Here the comparison functional may be a positive truncated moment functional, and the scale step uses Gram matrices of polynomial vectors.

#thm([Proposition 3.1.])[
  (One multiscale step).  #emph[There are absolute constants $0 < beta \, eta_0 < 1$ and $C_0 \, C_1 gt.eq 1$ with the following property. Let $f$ be an order-$k$ feature from (2.4), and let $Delta$ arise from a moment functional of order $2 D$ with the prefix conditions of Section 2. Suppose 
$ 0 < S lt.eq 4 \, #h(2em) 0 < S' lt.eq min { 1 \, eta_0 S } \, #h(2em) 4 k lt.eq D \, $

 and, for some $beta S lt.eq s lt.eq S$ and $\| omega \| lt.eq 2.002 s$, 
#[#set math.equation(numbering: n => "(3.1)")
 $ \| cal(S)_f \( s \, omega \) \| gt.eq e^(- E) \, #h(2em) E gt.eq C_0 (1 + k log \( 2 k \) + log H_f + log 1 / S') . $ <eq:multiscale-cost>]

 Then an order-$k'$ feature $f'$, with $1 lt.eq k' lt.eq 4 k$, satisfies 
#[#set math.equation(numbering: n => "(3.2)")
 $ \| cal(S)_(f') \( s' \, omega' \) \| gt.eq e^(- 7.98 E) \, #h(2em) beta S' lt.eq s' lt.eq S' \, #h(2em) \| omega' \| lt.eq 2.002 s' \, $ <eq:multiscale-output>]

 and 
#[#set math.equation(numbering: n => "(3.3)")
 $ H_(f') lt.eq H_f^4 (1 + frac(1, beta S'))^3 . $ <eq:multiscale-height>]

 Moreover, there are $1 lt.eq m lt.eq 4$ lists, each equal to the old parameter list $\( z_1 \, dots.h \, z_(k - 1) \)$ or its complex conjugate, and at most $m - 1$ added parameters, with the following property. Each new inner-gap parameter is a nonempty product using at most one entry from each list and at most one added parameter. Every added parameter $e^(- a + upright(i) theta)$ obeys 
#[#set math.equation(numbering: n => "(3.4)")
 $ a gt.eq beta S' \, #h(2em) \| theta \| lt.eq C_1 S . $ <eq:added-parameters>]

]
] <prop:multiscale>

The proof has two parts. First, a broad Gaussian window turns the original signal into Fourier sums. Positivity of the moment functional then forces a product of at most four such sums to retain a signal while its total frequency is small. Second, expanding that product and deforming Gaussian contours produces a single feature with the asserted parameters. The first part occupies the present subsections; the conversion is carried out in Section 3.4.

=== 3.1 A Gaussian window and its logarithmic bound <a-gaussian-window-and-its-logarithmic-bound>

Throughout the proof of Proposition 4, set

#[#set math.equation(numbering: n => "(3.5)")
 $ sigma = frac(K sqrt(E), S') \, #h(2em) W \( l \) = exp (- frac(l^2, 2 sigma^2)) \, #h(2em) b = beta S' \, $ <eq:window-parameters>]

where $K$ is a sufficiently large absolute constant. The constants will be chosen in the order $K$, then $beta$ sufficiently small, then $eta_0$ sufficiently small, and finally $C_0$ sufficiently large. The choices of $K$ and $beta$ will also enforce the contour estimates below.

We use the following consequence of (3.1) repeatedly. The logarithm of any fixed product of powers of $H_f \, 1 + sigma \, 1 \/ S' \, 1 \/ b$, together with a factor $exp \( O \( k log \( 2 k \) \) \)$, is bounded by

$ C (1 + k log \( 2 k \) + log H_f + log 1 / S') + C log E \, $

where $C$ depends only on constants already chosen. Increasing $C_0$ makes this at most any prescribed positive multiple of $E$. Only finitely many such estimates will be required, so a single final choice of $C_0$ suffices.

For real $t$, define the polynomial and its evaluation

#[#set math.equation(numbering: n => "(3.6)")
 $ A \( t \) = sum_(j = 1)^n f_j W \( j - d \) e^(upright(i) t \( j - d \)) \, #h(2em) B_x \( t \) = A \( t \) \( x \) . $ <eq:window-sums>]

The coefficient bound for $f_j$ and the Gaussian sum imply that

#[#set math.equation(numbering: n => "(3.7)")
 $ \| B_x \( t \) \| \, quad \| cal(E) \[ A \( t \) \] \| \, quad \| Delta \[ A \( t \) \] \| lt.eq U := C H_f \( 1 + sigma \) \, $ <eq:window-uniform-bound>]

with $C$ absolute and chosen so that $U gt.eq 1$. By prefix cancellation,

$ P \( z \) := sum_(j = d)^n Delta \[ f_j \] W \( j - d \) z^(j - d) quad upright("satisfies") quad P \( e^(upright(i) t) \) = Delta \[ A \( t \) \] . $

We first show that $P$ retains a signal at almost the original decay:

#[#set math.equation(numbering: n => "(3.8)")
 $ \| P \( e^(- s_1 + upright(i) omega) \) \| gt.eq 1 / 2 e^(- E) quad upright("for some") quad \| s_1 \/ s - 1 \| lt.eq 10^(- 4) . $ <eq:window-interior-signal>]

Let $V$ be a centered real normal variable with variance $sigma^(- 2)$. Since $W \( l \) upright(bold(E)) e^(V l) = 1$,

$ cal(S)_f \( s \, omega \) = upright(bold(E)) thin P \( e^(- s + V + upright(i) omega) \) . $

Write $delta = 10^(- 4)$. Exponential tilting gives

$ W \( l \) upright(bold(E)) #scale(x: 120%, y: 120%)[\[] e^(V l) upright(bold(1))_({ \| \| V > delta s }) #scale(x: 120%, y: 120%)[\]] = Pr #h(-0.16667em) (\| N \( l \/ sigma^2 \, sigma^(- 2) \) \| > delta s) . $

For $0 lt.eq l lt.eq delta s sigma^2 \/ 2$, this probability is at most $2 e^(- c delta^2 s^2 sigma^2)$. For larger $l$, use the bound one and sum $e^(- s l)$. Because $\| Delta \[ f_j \] \| lt.eq 2 H_f$, the contribution from $\| \| V > delta s$ is at most

#[#set math.equation(numbering: n => "(3.9)")
 $ 2 H_f \( 1 + 1 \/ s \) (2 e^(- c delta^2 s^2 sigma^2) + e^(- delta s^2 sigma^2 \/ 2)) . $ <eq:window-tail>]

Here $1 \/ s lt.eq 1 \/ \( beta S' \)$, and $s^2 sigma^2 gt.eq beta^2 K^2 E \/ eta_0^2$. Choose $eta_0$ sufficiently small and then $C_0$ sufficiently large to make (3.9) less than $e^(- 2 E)$. The integral over $\| \| V lt.eq delta s$ consequently has magnitude at least $e^(- E) - e^(- 2 E) gt.eq e^(- E) \/ 2$. Its maximum integrand magnitude is at least that large, proving (3.8).

Set

$ Lambda \( t \) = log frac(U, \| P \( e^(upright(i) t) \) \|) gt.eq 0 \, $

with value $+ oo$ at a boundary zero. We claim

#[#set math.equation(numbering: n => "(3.10)")
 $ integral_(bb(R)) Lambda \( t \) frac(s_1 thin d t, pi \( s_1^2 + \( t - omega \)^2 \)) lt.eq 1.001 E . $ <eq:poisson-log-bound>]

For completeness, the Cauchy Fourier transform is

#[#set math.equation(numbering: n => "(3.11)")
 $ integral_(bb(R)) frac(e^(upright(i) xi v), pi \( 1 + v^2 \)) thin d v = e^(- \| xi \|) . $ <eq:cauchy-transform>]

For $xi > 0$, close the contour in the upper half-plane and take the residue at $upright(i)$; for $xi < 0$ use the lower half-plane, and for $xi = 0$ integrate directly. Thus periodizing the density in (3.10) gives the circle Poisson measure at $e^(- s_1 + upright(i) omega)$.

To apply it, factor the nonzero polynomial $P$ into linear factors. A factor with a root outside the disk has harmonic logarithmic magnitude inside. For a root $a$ inside, the boundary identity $\| e^(upright(i) t) - a \| = \| 1 - overline(a) e^(upright(i) t) \|$ and the inequality

$ \| 1 - overline(a) z \|^2 - \| z - a \|^2 = \( 1 - \| \| a^2 \) \( 1 - \| \| z^2 \) gt.eq 0 $

give the corresponding upper bound by its Poisson integral. Roots on the circle follow by a radial limit; their logarithmic singularities are integrable. Summing over factors yields

$ integral_(bb(R)) Lambda \( t \) frac(s_1 thin d t, pi \( s_1^2 + \( t - omega \)^2 \)) lt.eq log U - log \| P \( e^(- s_1 + upright(i) omega) \) \| lt.eq E + log \( 2 U \) . $

The last term is at most $1.001 E$ by the choice of $C_0$, proving the claim.

=== 3.2 Frequencies at prescribed differences <frequencies-at-prescribed-differences>

We seek a frequency $lambda in \[ - 2 s_1 \, 2 s_1 \]$ with a large signal and pairs of frequencies with every prescribed difference in that interval. The product $A \( t \) overline(A \( t' \))$ has signed frequency $t - t'$. After normalization by their evaluations at $x$, these products will supply the interior vectors of a chain from $1$ to a normalized copy of $A \( lambda \)$, with consecutive frequency labels differing by at most $b$. Each neighboring inner product will then have signed frequency of magnitude at most $b$, even though $\| lambda \|$ may be much larger. The logarithmic estimate makes the required existence of pairs a question about pairing Cauchy mass.

#thm([Lemma 3.2.])[
  (Cauchy matching).  #emph[Let $w \( v \) = 1 \/ \( pi \( 1 + v^2 \) \)$. For every $r gt.eq 0$ there is a finite positive measure $mu_r$ on $bb(R)^2$, supported on $v - v' = r$, such that the sum of its two marginals is bounded above by $w \( v \) thin d v$. For $r > 0$ its total mass is 
#[#set math.equation(numbering: n => "(3.12)")
 $ 2 mu_r \( bb(R)^2 \) = 1 - 4 / pi arctan \( e^(- pi \/ r) \) \; $ <eq:cauchy-matching-mass>]

 for $r = 0$ its total mass is $1 \/ 2$. In particular, the quantity in (3.12) is greater than $0.737$ when $0 < r lt.eq 2$.]
] <lem:cauchy-matching>

#proof[
  For $r = 0$, put half the measure $w \( v \) thin d v$ on the diagonal. Suppose $r > 0$, and partition the line into chains $v + j r$, $j in bb(Z)$, with $- r \/ 2 lt.eq v < r \/ 2$. Abbreviate $w_j = w \( v + j r \)$. On the edge from $j$ to $j - 1$, for $j gt.eq 1$, put weight
  $ e_j = sum_(m gt.eq 0) \( - 1 \)^m w_(j + m) . $
  These weights are nonnegative, since the summands decrease along the tail. Moreover $e_j + e_(j + 1) = w_j$, so the edges exhaust the weight at every positive vertex. Construct the negative-side edges in the same way, proceeding from the negative tail toward zero. The only possibly unused weight is at the central vertex, where its value is
  $ R \( v \) = sum_(j in bb(Z)) \( - 1 \)^j w \( v + j r \) . $
  To check that no weight has been overused, periodize $w$ at period $2 r$ and subtract its translate by $r$. By (3.11), with $tau = e^(- pi \/ r)$, this gives the absolutely convergent Fourier series
  $ R \( v \) = 2 / r sum_(m gt.eq 0) tau^(2 m + 1) cos frac(\( 2 m + 1 \) pi v, r) . $
  Writing $a = pi v \/ r$, the sum equals
  $ "Re" frac(tau e^(upright(i) a), 1 - tau^2 e^(2 upright(i) a)) = frac(tau \( 1 - tau^2 \) cos a, 1 - 2 tau^2 cos \( 2 a \) + tau^4) gt.eq 0 \, $
  since $\| \| a lt.eq pi \/ 2$. Orient every edge with its larger endpoint first and integrate the edge weights with respect to $d v$ over $\[ - r \/ 2 \, r \/ 2 \)$. The resulting measure has the asserted marginal domination. Its uncovered mass is
  $ integral_(- r \/ 2)^(r \/ 2) R \( v \) thin d v = 4 / pi sum_(m gt.eq 0) frac(\( - 1 \)^m tau^(2 m + 1), 2 m + 1) = 4 / pi arctan tau \, $
  which proves (3.12). The expression decreases with $r$, and at $r = 2$ it exceeds $0.737$. For example, $e^(- pi \/ 2) < 0.209$ together with $arctan u lt.eq u - u^3 \/ 3 + u^5 \/ 5$ for $0 lt.eq u lt.eq 1$ proves this numerical bound. ◻
]

#thm([Lemma 3.3.])[
  (Frequencies from the logarithmic bound).  #emph[Let $s_1 \, E > 0$, let $\| omega \| lt.eq 2.003 s_1$, and let $Lambda : bb(R) arrow.r \[ 0 \, oo \]$ be measurable and satisfy (3.10). There is a real $lambda$ with 
#[#set math.equation(numbering: n => "(3.13)")
 $ \| lambda \| lt.eq 2 s_1 \, #h(2em) Lambda \( lambda \) lt.eq 2.40 E . $ <eq:single-frequency>]

 There is also an absolute $C_2$ such that, for every $\| \| y lt.eq 2 s_1$, some real $t \, t'$ satisfy 
#[#set math.equation(numbering: n => "(3.14)")
 $ t - t' = y \, #h(2em) \| \| t \, \| t' \| lt.eq C_2 s_1 \, #h(2em) Lambda \( t \) + Lambda \( t' \) lt.eq 2.74 E . $ <eq:paired-frequencies>]

]
] <lem:good-frequencies>

#proof[
  The Cauchy mass of $\[ - 2 s_1 \, 2 s_1 \]$ is at least
  $ frac(arctan \( 2 - 2.003 \) + arctan \( 2 + 2.003 \), pi) > 0.418 . $
  Because $1.001 \/ 0.418 < 2.40$, averaging proves (3.13).
  For (3.14), use Lemma 5 with $r = \| \| y \/ s_1 lt.eq 2$ and then substitute $t = omega + s_1 v$. Reverse the orientation if needed. The sum of the two marginals is bounded by the Cauchy measure in (3.10), while twice the total pair mass is greater than $0.737$. Discard pairs with an endpoint outside $\[ - C_2 s_1 \, C_2 s_1 \]$. Twice the discarded pair mass is at most twice the Cauchy tail outside that interval, which tends uniformly to zero as $C_2 arrow.r oo$, since $\| omega \| \/ s_1 lt.eq 2.003$. Choose an absolute $C_2$ so the retained pair mass exceeds $0.733 \/ 2$. Its integral of $Lambda \( t \) + Lambda \( t' \)$ is at most $1.001 E$. Some retained pair consequently has sum at most
  $ frac(2 \( 1.001 \), 0.733) E < 2.74 E \, $
  as required. The diagonal construction gives the same argument when $y = 0$. ◻
]

=== 3.3 A product with small total frequency <a-product-with-small-total-frequency>

The window parameters satisfy $\| omega \| \/ s_1 lt.eq 2.002 \/ 0.9999 < 2.003$, so Lemma 6 applies to our $Lambda$. Individual frequencies in (3.14) need not be small. Their differences, however, can be prescribed. We use these pairs to build a chain of polynomial vectors whose neighboring inner products have small total frequency. The following Hilbert-space fact explains why such a chain preserves the needed exponential accuracy.

#thm([Lemma 3.4.])[
  (Gram chaining).  #emph[Let $v_0 \, dots.h \, v_J$, with $J gt.eq 1$, lie in a complex Hilbert space whose inner product is linear in its first argument. Suppose $lr(bar.v.double v_0 bar.v.double) = 1$ and, for some $xi gt.eq 0$, 
$ \| lr(bar.v.double v_i bar.v.double)^2 - 1 \| lt.eq xi quad \( 0 lt.eq i lt.eq J \) \, #h(2em) \| chevron.l v_i \, v_(i - 1) chevron.r - 1 \| lt.eq xi quad \( 1 lt.eq i lt.eq J \) . $

 Then 
$ \| chevron.l v_J \, v_0 chevron.r - 1 \| lt.eq 2 J^2 xi . $

]
] <lem:gram-chain>

#proof[
  Put $h_i = v_i - v_(i - 1)$. The hypotheses give
  $ lr(bar.v.double h_i bar.v.double) lt.eq 2 sqrt(xi) \, #h(2em) \| chevron.l h_i \, v_(i - 1) chevron.r \| lt.eq 2 xi \, #h(2em) lr(bar.v.double v_(i - 1) - v_0 bar.v.double) lt.eq 2 \( i - 1 \) sqrt(xi) . $
  Thus Cauchy–Schwarz implies
  $ \| chevron.l h_i \, v_0 chevron.r \| lt.eq 2 xi + 4 \( i - 1 \) xi . $
  Sum over $i$ and use $chevron.l v_0 \, v_0 chevron.r = 1$. ◻
]

Choose an absolute $C_3$ large enough that all frequencies supplied by Lemma 6 have magnitude at most $C_3 S$. A product of one to four factors, each of the form $A \( t \)$ or $overline(A \( t \))$ with $\| \| t lt.eq C_3 S$, is called #emph[balanced] if the sum of its signed frequencies has magnitude at most $b$; conjugation changes the sign of a frequency.

#thm([Lemma 3.5.])[
  (A balanced product retains a signal).  #emph[Some balanced product $G$ satisfies 
#[#set math.equation(numbering: n => "(3.15)")
 $ \| Delta \[ G \] \| gt.eq e^(- 7.94 E) . $ <eq:balanced-product-signal>]

]
] <lem:balanced-product>

#proof[
  Suppose to the contrary that every balanced product has signal less than $epsilon.alt = e^(- 7.94 E)$. The squared modulus $\| A \( t \) \|^2$ is one such product. Positivity of $cal(E)$, applied to $A \( t \)$ and $1$, gives
  $ \| cal(E) \[ A \( t \) \] \|^2 lt.eq cal(E) \[ \| A \( t \) \|^2 \] lt.eq \| B_x \( t \) \|^2 + epsilon.alt \, $
  and hence
  #[#set math.equation(numbering: n => "(3.16)")
   $ \| Delta \[ A \( t \) \] \| lt.eq 2 \| B_x \( t \) \| + sqrt(epsilon.alt) . $ <eq:evaluation-lower-bound>]
  At $lambda$ from (3.13), this implies
  #[#set math.equation(numbering: n => "(3.17)")
   $ \| B_x \( lambda \) \| gt.eq e^(- 2.41 E) . $ <eq:endpoint-normalization>]
  Indeed $\| Delta \[ A \( lambda \) \] \| gt.eq e^(- 2.40 E)$, whereas $sqrt(epsilon.alt) = e^(- 3.97 E)$; fixed numerical factors are absorbed by the absolute lower bound on $E$ in (3.1). For a pair in (3.14), nonnegativity of $Lambda$ implies that both corresponding signals are at least $e^(- 2.74 E)$, and
  $ \| Delta \[ A \( t \) \] Delta \[ A \( t' \) \] \| = U^2 e^(- Lambda \( t \) - Lambda \( t' \)) gt.eq e^(- 2.74 E) . $
  Applying (3.16) to each therefore gives
  #[#set math.equation(numbering: n => "(3.18)")
   $ \| B_x \( t \) overline(B_x \( t' \)) \| gt.eq e^(- 2.75 E) . $ <eq:pair-normalization>]
  For example, each evaluation is at least one third of its corresponding signal once $E$ is large; the resulting factor $1 \/ 9$ is absorbed in $e^(- 0.01 E)$.
  Take a monotone chain $0 = y_0 \, y_1 \, dots.h \, y_J = lambda$ with consecutive distances at most $b$ and
  $ 1 lt.eq J lt.eq C \( 1 + S \/ b \) . $
  If $lambda = 0$, use just two endpoints and $J = 1$. For every interior $y_i$, choose a pair from (3.14) and define polynomials
  $ V_0 = 1 \, #h(2em) V_i = frac(A \( t \) overline(A \( t' \)), B_x \( t \) overline(B_x \( t' \))) quad \( 0 < i < J \) \, #h(2em) V_J = frac(A \( lambda \), B_x \( lambda \)) . $
  The denominators are nonzero by (3.17)–(3.18), and every $V_i \( x \)$ equals one. Regard these polynomials as vectors $v_i$ in the Hilbert space induced by $cal(E)$. They have degree at most $2 k lt.eq D$.
  For $1 lt.eq i lt.eq J$, the norm square of $v_i$ and its inner product with $v_(i - 1)$ are expectations of normalized balanced products: their signed frequencies are respectively zero and $y_i - y_(i - 1)$, and each product has at most four factors. The magnitude of its normalizing denominator is at least $e^(- 5.50 E)$. Our contradictory assumption therefore gives
  $ \| lr(bar.v.double v_i bar.v.double)^2 - 1 \| lt.eq xi \, #h(2em) \| chevron.l v_i \, v_(i - 1) chevron.r - 1 \| lt.eq xi \, #h(2em) xi = epsilon.alt e^(5.50 E) = e^(- 2.44 E) . $
  Since $v_0 = 1$ has norm one, Lemma 7 yields
  $ \| Delta \[ A \( lambda \) \] \| = \| B_x \( lambda \) \| thin \| chevron.l v_J \, v_0 chevron.r - 1 \| lt.eq 2 U J^2 e^(- 2.44 E) < e^(- 2.40 E) . $
  The final strict inequality follows by increasing $C_0$, because $log \( 2 U J^2 \)$ is less than $0.04 E$ by (3.1). This contradicts (3.13) and proves the lemma. ◻
]

We have obtained a product of at most four windowed feature sums with signal at least $e^(- 7.94 E)$ and total frequency at most $b$. It remains to turn it into one feature while keeping both its decay and frequency of order $S'$. The Gaussian contour construction below supplies that final step of Proposition 4.

=== 3.4 Converting a balanced product to a feature <subsec:contour-conversion>

Lemma 8 supplies a product of at most four windowed Fourier sums with a substantial discrepancy and small total frequency. We now express that product as an integral of features. The contour will place their outer parameters in the sector required by Proposition 4; the remaining issue will be to control the damping factors on their inner gaps.

Fix a product supplied by Lemma 8, and let $1 lt.eq m lt.eq 4$ be its number of factors. Expand each factor in the tuples defining $f$. An #emph[interleaving] specifies the ordering, including all ties, of the $m k$ labeled positions in these tuples. There are at most $\( m k \)^(m k) = exp \( O \( k log \( 2 k \) \) \)$ interleavings: assigning to each labeled position its rank among the distinct positions gives such a bound. Only interleavings consistent with strict increase inside each old tuple are retained. Fix one interleaving, and relabel its copies so that their endpoints satisfy $j_1 lt.eq dots.h.c lt.eq j_m$. Equal endpoints may be ordered arbitrarily. After absorbing conjugation into the signs of the frequencies, their window weight is

#[#set math.equation(numbering: n => "(3.19)")
 $ product_(r = 1)^m W \( j_r - d \) exp #scale(x: 120%, y: 120%)[\(] upright(i) t_r \( j_r - d \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) \| t_r \| lt.eq C_3 S \, #h(2em) lr(|sum_(r = 1)^m t_r|) lt.eq b . $ <eq:endpoint-window>]

Conjugation also conjugates the old inner-gap parameters, leaving their dampings unchanged.

===== 3.4.1 A Gaussian contour with controlled total frequency. <a-gaussian-contour-with-controlled-total-frequency.>

Recall that $sigma = K sqrt(E) \/ S'$ and $b = beta S'$. For every real $l$,

#[#set math.equation(numbering: n => "(3.20)")
 $ W \( l \) = frac(sigma, upright(i) sqrt(2 pi)) integral_(- upright(i) oo)^(upright(i) oo) exp \( sigma^2 v^2 \/ 2 + v l \) thin d v . $ <eq:gaussian-contour>]

Indeed, writing $v = upright(i) u$ gives the Gaussian Fourier transform. Its value at $l = 0$ is one, and integration by parts shows that its derivative in $l$ is $- l \/ sigma^2$ times itself, proving the formula.

Set $rho = 1 \/ 2.002$. For $u = \( u_1 \, dots.h \, u_m \) in bb(R)^m$, define

#[#set math.equation(numbering: n => "(3.21)")
 $ Omega = sum_(r = 1)^m \( u_r + t_r \) \, #h(2em) v_r = b + upright(i) u_r quad \( r < m \) \, #h(2em) v_m = - m b - rho \| Omega \| + upright(i) u_m . $ <eq:bent-contour>]

These real parts have partial sums $r b$ for $r < m$ and total sum $- b - rho \| Omega \|$. When the endpoint exponent is centered at $j_m$, the total sum gives the real part of its outer coefficient, while the negatives of the partial sums give the real parts of the coefficients on consecutive endpoint gaps. The contour is therefore designed to give outer decay $b + rho \| Omega \|$ and positive inner dampings $r b$; we verify the exact rewriting below.

For each fixed tuple of positions, first shift the first $m - 1$ contours in (3.20) to their fixed vertical lines $"Re" v_r = b$, leaving the last contour on the imaginary axis. The connecting horizontal integrals vanish by Gaussian decay. Next fix $\( u_1 \, dots.h \, u_(m - 1) \)$ and deform the last contour to the piecewise linear graph in (3.21). Its slopes have absolute value $rho < 1$. Along horizontal segments joining its truncations to the imaginary axis at height $plus.minus T$, the Gaussian exponent has real part at most $- c T^2 + O \( T \)$ for some $c > 0$. The factor $exp \( v_m \( j_m - d \) \)$ contributes only a linear term in $T$, so these connecting integrals also vanish. The integrands are entire, and hence no residues occur. This proves the identities as iterated integrals; absolute joint convergence will follow from the next bound.

Let $nu$ be the resulting complex measure on $bb(R)^m$ after the factors depending on positions have been removed. More explicitly, outside the measure-zero set $Omega = 0$,

#[#set math.equation(numbering: n => "(3.22)")
 $ d nu \( u \) = (sigma / sqrt(2 pi))^m exp (sigma^2 / 2 sum_(r = 1)^m v_r^2) #scale(x: 120%, y: 120%)[\(] 1 + upright(i) rho "sgn" Omega #scale(x: 120%, y: 120%)[\)] thin d u . $ <eq:contour-measure>]

The last factor is the differential of the bent contour divided by $upright(i) thin d u_m$. We next obtain estimates uniform over the frequencies in (3.19). These estimates also establish absolute convergence of the joint integrals.

Put $delta_0 = 1 - 4 rho^2 > 0$ and $c_1 = delta_0 \/ 2$. Since $m lt.eq 4$ and $\| sum t_r \| lt.eq b$, Young’s inequality gives an absolute $C_4$ such that

#[#set math.equation(numbering: n => "(3.23)")
 $ sum_(r = 1)^m \( "Re" v_r \)^2 & = \( m - 1 \) b^2 + \( m b + rho \| Omega \| \)^2\
 & lt.eq 3 b^2 + (2 rho sqrt(sum_r u_r^2) + \( 4 + rho \) b)^2\
 & lt.eq \( 1 - c_1 \) sum_r u_r^2 + C_4 b^2 . $ <eq:contour-quadratic>]

The strict inequality $4 rho^2 < 1$ is essential here: summing at most four imaginary coordinates can multiply their squared norm by four, and the sector constant $2.002$ leaves a positive Gaussian decay margin. For example, $C_4 = 3 + \( 4 + rho \)^2 \( 1 + 8 rho^2 \/ delta_0 \)$ suffices. Together with (3.22), this proves

$ \| d nu \( u \) \| lt.eq C sigma^m exp (frac(C_4 sigma^2 b^2, 2) - frac(c_1 sigma^2, 2) sum_r u_r^2) d u . $

For any fixed tuple of positions, the absolute value of its remaining exponential factor is at most $exp \( C_n \( 1 + sum_r \| u_r \| \) \)$ for a finite constant $C_n$. This factor is integrable against the Gaussian bound. Thus the iterated deformation also gives a jointly absolutely convergent integral, and finite tuple sums can be interchanged with it.

Write $cal(U) = { u : max_r \| u_r \| lt.eq S' \/ 16 }$. Integrating the last bound, and splitting its negative quadratic term into two equal parts on $cal(U)^c$, gives absolute constants $C \, C'$ with

$ parallel nu parallel_(upright("abs")) & lt.eq C exp \( C_4 K^2 beta^2 E \/ 2 \) \,\
integral_(cal(U)^c) \| d nu \| & lt.eq C' exp [(frac(C_4 K^2 beta^2, 2) - frac(c_1 K^2, 1024)) E] . $

Here $parallel nu parallel_(upright("abs"))$ denotes total variation; the powers $sigma^m$ cancel under Gaussian rescaling. Choose $K$ large enough that $c_1 K^2 \/ 1024 gt.eq 30$, then choose $beta lt.eq 1 \/ 4$ small enough that $C_4 K^2 beta^2 \/ 2 lt.eq 0.001$. Increasing $C_0$ to absorb the fixed prefactors yields

#[#set math.equation(numbering: n => "(3.24)")
 $ parallel nu parallel_(upright("abs")) lt.eq e^(0.005 E) \, #h(2em) integral_(cal(U)^c) \| d nu \| lt.eq e^(- 20 E) . $ <eq:contour-mass>]

This choice is consistent with the order of constants specified earlier: $K$ is fixed first, $beta$ second, and $eta_0$ may then be reduced to meet the window estimate. Only afterward is $C_0$ enlarged.

===== 3.4.2 Outer parameters and endpoint gaps. <outer-parameters-and-endpoint-gaps.>

For $c_r = v_r + upright(i) t_r$, telescoping the endpoint differences gives

#[#set math.equation(numbering: n => "(3.25)")
 $ sum_(r = 1)^m c_r \( j_r - d \) = (sum_(r = 1)^m c_r) \( j_m - d \) - sum_(r = 1)^(m - 1) (sum_(l = 1)^r c_l) \( j_(r + 1) - j_r \) . $ <eq:endpoint-telescoping>]

Consequently, the largest endpoint has coefficient $- s' + upright(i) Omega$, where

#[#set math.equation(numbering: n => "(3.26)")
 $ s' = b + rho \| Omega \| . $ <eq:new-outer-decay>]

The link from $j_r$ to $j_(r + 1)$ receives the parameter

#[#set math.equation(numbering: n => "(3.27)")
 $ exp (- r b - upright(i) sum_(l = 1)^r \( u_l + t_l \)) \, #h(2em) 1 lt.eq r < m . $ <eq:endpoint-link>]

Thus every added damping is at least $b$, for every $u$. On $cal(U)$,

$ \| Omega \| lt.eq \( beta + 1 \/ 4 \) S' \, #h(2em) beta S' lt.eq s' lt.eq #scale(x: 120%, y: 120%)[\[] beta + rho \( beta + 1 \/ 4 \) #scale(x: 120%, y: 120%)[\]] S' lt.eq S' \, #h(2em) \| Omega \| lt.eq 2.002 s' . $

The angle in (3.27) has absolute value at most $3 \( C_3 S + S' \/ 16 \) lt.eq C_1 S$ for a fixed absolute $C_1$. The outer parameters therefore satisfy the parameter inequalities in (3.2), and the endpoint links satisfy (3.4). The choice of $C_1$ uses only $C_3$ and $S' lt.eq S$ and imposes no further condition on $K$ or $beta$.

=== 3.5 Interleavings and the cost of the inner gaps <subsec:interleavings>

We have obtained outer weights at the required scale. To finish, we must show that each interleaving has exactly the form of a feature, with controlled coefficient sum. One old inner edge can cross several gaps of the merged tuple, so charging its damping cost at every crossing would overcount it. A distinct-edge assignment will prevent this loss.

For our fixed interleaving, write its distinct positions as $i_1 < dots.h.c < i_v$, where $1 lt.eq v lt.eq m k$. Form a multigraph on these vertices: include the inner edges of each old tuple and the links between consecutive endpoints in (3.27). Its edges carry their corresponding exponential parameters. It is connected, because each old tuple is a path to its endpoint, and the endpoint links join those paths. Delete loops coming from equal endpoints; their weights are one.

For each merged gap $i_(a + 1) - i_a$, multiply the parameters of all edges crossing it. Each edge length is the sum of the merged gaps it crosses, so these new parameters reproduce the original weight exactly. Every merged gap is crossed by some edge, by connectivity, and hence its damping is positive. Within a single old tuple, the inner-edge intervals have disjoint interiors. The same holds for the consecutive endpoint links. It follows that each new parameter uses at most one old parameter from each copy and at most one added endpoint parameter. This is precisely the factor-count assertion in Proposition 4.

Ties merge repeated bit variables by the Boolean identity $X_i^r = X_i$ for $r gt.eq 1$. Once the interleaving is fixed, choosing arbitrary strictly increasing values for its $v$ distinct positions specifies exactly one assignment to its labeled tuples. Thus no further restriction remains on the new tuple. Its largest position is $i_v = j_m$. Summing all these assignments gives an order-$v$ feature, denoted $f^(cal(I) \, u)$, with outer weight $exp \( \( - s' + upright(i) Omega \) \( i_v - d \) \)$.

The following elementary fact controls its height.

#thm([Lemma 3.6.])[
  (Assigning distinct edges to consecutive gaps).  #emph[Let a connected multigraph have ordered vertices $i_1 < dots.h.c < i_v$. There is an assignment of a distinct edge to each gap $\( i_a \, i_(a + 1) \)$ such that its assigned edge crosses that gap.]
] <lem:edge-gap-assignment>

#proof[
  There is nothing to prove for $v = 1$. Otherwise retain a spanning tree and orient each of its edges from its smaller to its larger endpoint. Let $M$ be the $\( v - 1 \) times \( v - 1 \)$ matrix whose $\( e \, a \)$ entry is one if tree edge $e$ crosses gap $a$, and zero otherwise. This matrix is invertible. To see this, for an arbitrary vector $g$ in its kernel set $y_1 = 0$ and $y_(a + 1) = y_a + g_a$. The equation $M g = 0$ says that $y$ has equal values at the endpoints of every tree edge. Connectivity makes all its values zero, so $g = 0$. A nonzero term in the determinant expansion of $M$ pairs its rows and columns through entries equal to one. That pairing is the required assignment. ◻
]

Figure 1 shows why distinctness matters. Although one edge may contribute to several new parameters, it need pay for only one of their upper bounds.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (6.4, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  circle((0, 0), radius: 0.0635, fill: black, stroke: none)
  content((0, -0.1058), [$i_1$], anchor: "north", padding: 0.1176cm)
  circle((1.28, 0), radius: 0.0635, fill: black, stroke: none)
  content((1.28, -0.1058), [$i_2$], anchor: "north", padding: 0.1176cm)
  circle((2.56, 0), radius: 0.0635, fill: black, stroke: none)
  content((2.56, -0.1058), [$i_3$], anchor: "north", padding: 0.1176cm)
  circle((3.84, 0), radius: 0.0635, fill: black, stroke: none)
  content((3.84, -0.1058), [$i_4$], anchor: "north", padding: 0.1176cm)
  circle((5.12, 0), radius: 0.0635, fill: black, stroke: none)
  content((5.12, -0.1058), [$i_5$], anchor: "north", padding: 0.1176cm)
  circle((6.4, 0), radius: 0.0635, fill: black, stroke: none)
  content((6.4, -0.1058), [$i_6$], anchor: "north", padding: 0.1176cm)
  bezier((0, 0), (2.56, 0), (0.8646, 0.4992), (1.695, 0.4992), stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10))
  content((1.28, 0.3744), [$e_1$], anchor: "south", padding: 0.1176cm)
  bezier((2.56, 0), (5.12, 0), (3.425, 0.4992), (4.255, 0.4992), stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10))
  content((3.84, 0.3744), [$e_3$], anchor: "south", padding: 0.1176cm)
  bezier((1.28, 0), (3.84, 0), (1.702, 0.9049), (3.418, 0.9049), stroke: (paint: rgb("#d96d00"), thickness: 0.8pt, miter-limit: 10))
  content((2.56, 0.6786), [$e_2$], anchor: "south", padding: 0.1176cm)
  bezier((3.84, 0), (6.4, 0), (4.262, 0.9049), (5.978, 0.9049), stroke: (paint: rgb("#d96d00"), thickness: 0.8pt, miter-limit: 10))
  content((5.12, 0.6786), [$e_4$], anchor: "south", padding: 0.1176cm)
  bezier((5.12, 0), (6.4, 0), (5.37, -0.4323), (6.15, -0.4323), stroke: (paint: rgb("#000000"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  content((5.76, -0.3948), [$e_5$], anchor: "north", padding: 0.1176cm)
  content((0.64, -0.945), [$g_1$])
  content((1.92, -0.945), [$g_2$])
  content((3.2, -0.945), [$g_3$])
  content((4.48, -0.945), [$g_4$])
  content((5.76, -0.945), [$g_5$])
})],
  caption: [Figure 1: A schematic interleaving of the two old tuples $\( i_1 \, i_3 \, i_5 \)$ and $\( i_2 \, i_4 \, i_6 \)$, joined by the dashed endpoint link $e_5$. Here $g_a$ denotes the gap $\( i_a \, i_(a + 1) \)$. The assignment $g_a mapsto e_a$ for $1 lt.eq a lt.eq 5$ uses a distinct crossing edge for every gap. For example, $e_1$ crosses both $g_1$ and $g_2$, but it is charged only to $g_1$; $e_2$ supplies the bound for $g_2$. ],
) <fig:edge-gap-assignment>

Give each edge occurrence $e$ its damping $a_e > 0$. The damping of a merged gap is the sum of the $a_e$ over all edges crossing it, and is therefore at least that of its assigned edge. Since $1 + 1 \/ a$ decreases with $a$, Lemma 9 implies

#[#set math.equation(numbering: n => "(3.28)")
 $ H_(f^(cal(I) \, u)) & lt.eq product_(e upright(" assigned")) \( 1 + 1 \/ a_e \) lt.eq product_(e upright(" present")) \( 1 + 1 \/ a_e \)\
 & lt.eq H_f^m \( 1 + 1 \/ b \)^(m - 1) lt.eq H_f^4 \( 1 + 1 \/ b \)^3 . $ <eq:interleaving-height>]

The second inequality uses that all factors are at least one; the endpoint-link dampings are $r b gt.eq b$. This argument includes all overlaps between old tuples and also the case of a single distinct position. In that case the height is the empty product one.

===== 3.5.1 Completing the multiscale estimate. <completing-the-multiscale-estimate.>

Apply $Delta$ to the expanded product and use the integral representation for each interleaving. With $nu_(cal(I))$ denoting the corresponding measure, we have the exact identity

#[#set math.equation(numbering: n => "(3.29)")
 $ Delta \[ upright("product") \] = sum_(cal(I)) integral_(bb(R)^m) cal(S)_(f^(cal(I) \, u)) \( s' \, Omega \) thin d nu_(cal(I)) \( u \) . $ <eq:product-feature-integral>]

All estimates above are uniform over the interleavings. The integrands have a uniform bound even outside $cal(U)$. Indeed, for each fixed endpoint $j$, the coefficients of $f_j^(cal(I) \, u)$ have absolute sum at most the height in (3.28). The terms with endpoint $j < d$ vanish under $Delta$ by prefix agreement. Using $s' gt.eq b$ gives

#[#set math.equation(numbering: n => "(3.30)")
 $ lr(|cal(S)_(f^(cal(I) \, u)) \( s' \, Omega \)|) lt.eq 2 H_f^4 \( 1 + 1 \/ b \)^3 sum_(l gt.eq 0) e^(- b l) lt.eq 2 H_f^4 \( 1 + 1 \/ b \)^4 . $ <eq:contour-uniform-signal>]

In particular no exponential factor from negative distances occurs in the tail estimate.

Let $N_(upright("int"))$ be the number of interleavings and put $V = 2 H_f^4 \( 1 + 1 \/ b \)^4$. Hypothesis (3.1), with a sufficiently large absolute $C_0$, ensures

$ E gt.eq 100 \, #h(2em) log N_(upright("int")) lt.eq 0.01 E \, #h(2em) log V lt.eq 0.01 E . $

Here $log \( 1 + 1 \/ b \)$ is bounded by an absolute constant plus $log \( 1 \/ S' \)$, because $b = beta S'$, $S' lt.eq 1$, and $beta$ has already been fixed. If every signal in (3.29) with $u in cal(U)$ had magnitude below $e^(- 7.98 E)$, then (3.24) and (3.30) would give

$ \| Delta \[ upright("product") \] \| lt.eq N_(upright("int")) (e^(\( 0.005 - 7.98 \) E) + V e^(- 20 E)) lt.eq e^(- 7.965 E) + e^(- 19.98 E) < e^(- 7.94 E) . $

This contradicts Lemma 8. Some interleaving and some $u in cal(U)$ therefore give a feature with signal at least $e^(- 7.98 E)$. Its order is at most $m k lt.eq 4 k$; (3.26) and the bounds on $cal(U)$ give the required outer parameters; (3.28) gives (3.3); and the crossing description gives the claimed parameter factors and (3.4). This completes the proof of Proposition 4.

== 4 From an input signal to separation of trace moments <sec:separation>

We prove Theorem 3. Proposition 4 preserves a detectable input-coordinate signal while reducing its decay rate. We first choose enough scales to make that rate at most $1 \/ n$. The resulting gap parameters need not belong to the disk on which trace moments directly control the signal. A simultaneous one-variable continuation will bridge this difference.

Throughout this section $0 < p < 1$, and $q_(*) \, Q \, Y$ are as in (2.3). Recall from Section 2 that

#[#set math.equation(numbering: n => "(4.1)")
 $ 1 lt.eq sans(X) \( n \, p \) lt.eq Y lt.eq 2 sans(X) \( n \, p \) \, #h(2em) Q Y = Q + log n lt.eq C log n . $ <eq:aux-comparisons>]

=== 4.1 A scale schedule and the surviving signal <a-scale-schedule-and-the-surviving-signal>

Set

#[#set math.equation(numbering: n => "(4.2)")
 $ mu = 7.98 \, #h(2em) alpha = 0.001 \, #h(2em) h = ceil.l log_2 Y ceil.r + H \, #h(2em) D_(*) = 4^h \, $ <eq:separation-cutoff>]

where the absolute integer $H$ will be fixed below. In particular, $D_(*) lt.eq 4^(H + 1) Y^2$. Fix an arbitrary positive moment functional of order $2 D$, where $D gt.eq D_(*)$, with first wrong position $d$, and let $Delta$ be its difference from evaluation at the true word, as in Section 2. All constants chosen below are independent of this system, $n$, and $p$.

For an absolute constant $eta > 0$, define

#[#set math.equation(numbering: n => "(4.3)")
 $ S_0 = 4 \, #h(2em) S_j = eta q_(*) Y^(- alpha) S_(j - 1) min { 1 \, D_(*) S_(j - 1) } quad \( 1 lt.eq j lt.eq h \) . $ <eq:scale-schedule>]

The linear regime of this recurrence brings $D_(*) S_j$ below one; its quadratic regime then makes $S_j$ small rapidly. Both regimes will also be used to control the arguments of the final gap parameters.

Choose an integer $J_(*)$ with $alpha J_(*) gt.eq 3$, and set $H = J_(*) + 3$. To verify the decrease precisely, write

$ theta.alt = eta q_(*) Y^(- alpha) \, #h(2em) t_j = D_(*) S_j . $

Then $t_j = theta.alt t_(j - 1) min { 1 \, t_(j - 1) }$, so, regardless of when the quadratic regime begins,

$ t_(J_(*)) lt.eq theta.alt^(J_(*)) t_0 lt.eq 4^(H + 2) eta^(J_(*)) Y^(2 - alpha J_(*)) lt.eq 1 $

once $eta$ is small enough. Require also

$ eta lt.eq min { eta_0 \, 1 \/ 4 \, e^(- 1) } \, $

where $eta_0$ is from Proposition 4. Now $log \( 1 \/ theta.alt \) gt.eq Q$, and $t_j lt.eq 1$ for $j gt.eq J_(*)$. Iterating $t_j = theta.alt t_(j - 1)^2$ in this range gives

#[#set math.equation(numbering: n => "(4.4)")
 $ t_h lt.eq theta.alt^(thin 2^(h - J_(*)) - 1) lt.eq exp { - Q \( 2^(h - J_(*)) - 1 \) } lt.eq n^(- 1) \, #h(2em) S_h lt.eq n^(- 1) . $ <eq:terminal-scale>]

The last inequality follows from $2^(h - J_(*)) gt.eq 8 Y$ and $Q \( Y - 1 \) = log n$. At every transition we also have $0 < S_j lt.eq min { 1 \, eta_0 S_(j - 1) }$, as required by the proposition.

We need an upper bound on the cost of these small scales as well. Put $A_0 = Q + log Y$. The recurrence implies, with $ell_j = max { 0 \, log \( 1 \/ S_j \) }$,

$ ell_j lt.eq 2 ell_(j - 1) + log \( 1 \/ theta.alt \) \, #h(2em) ell_0 = 0 \, #h(2em) log \( 1 \/ theta.alt \) lt.eq C A_0 . $

Consequently

#[#set math.equation(numbering: n => "(4.5)")
 $ log \( 1 \/ S_j \) lt.eq C 2^j A_0 quad \( 0 lt.eq j lt.eq h \) . $ <eq:scale-cost>]

We can now iterate Proposition 4. Begin with the order-one feature $f_i^(\( 0 \)) = X_i$, at decay $s_0 = 4$ and frequency zero. The prefix agreement gives $Delta \[ X_i \] = 0$ for $i < d$, whereas $\| Delta \[ X_d \] \| = 1$. Since $\| Delta \[ X_i \] \| lt.eq 2$ for every $i$,

#[#set math.equation(numbering: n => "(4.6)")
 $ \| cal(S)_(f^(\( 0 \))) \( 4 \, 0 \) \| gt.eq 1 - 2 sum_(r gt.eq 1) e^(- 4 r) = 1 - frac(2, e^4 - 1) > 1 / 2 . $ <eq:initial-signal>]

Use error exponents

#[#set math.equation(numbering: n => "(4.7)")
 $ E_j = C_5 A_0 mu^j quad \( 0 lt.eq j lt.eq h \) \, $ <eq:scale-errors>]

where $C_5$ is an absolute constant chosen after $H$ and $eta$.

Here are all the induction bounds. At stage $j$ there is a feature $f^(\( j \))$ of order $k_j lt.eq 4^j$, with

#[#set math.equation(numbering: n => "(4.8)")
 $ beta S_j lt.eq s_j lt.eq S_j \, #h(2em) \| omega_j \| lt.eq 2.002 s_j \, #h(2em) \| cal(S)_(f^(\( j \))) \( s_j \, omega_j \) \| gt.eq e^(- E_j) \,\
log H_(f^(\( j \))) lt.eq C 4^j A_0 . $ <eq:scale-induction>]

The initial case follows from (4.6) and $H_(f^(\( 0 \))) = 1$, on increasing $C_5$. At the transition from $j - 1$ to $j$, the degree requirement is

$ 4 k_(j - 1) lt.eq 4^j lt.eq D_(*) lt.eq D . $

The feature-height conclusion of the proposition and (4.5) give

$ log H_(f^(\( j \))) lt.eq 4 log H_(f^(\( j - 1 \))) + 3 log #scale(x: 120%, y: 120%)[\(] 1 + 1 \/ \( beta S_j \) #scale(x: 120%, y: 120%)[\)] lt.eq 4 log H_(f^(\( j - 1 \))) + C 2^j A_0 . $

Summing this recurrence proves the last bound in (4.8). To check the exponent hypothesis of the proposition, its bracket at this transition is at most

$ C #scale(x: 120%, y: 120%)[\(] 1 + j 4^(j - 1) + 4^(j - 1) A_0 + 2^j A_0 #scale(x: 120%, y: 120%)[\)] . $

Because $mu > 4$, the sequences $j \( 4 \/ mu \)^(j - 1)$ and $2^j \/ mu^(j - 1)$ are bounded. Thus one fixed choice of $C_5$ makes this bracket times $C_0$ at most $E_(j - 1)$ for every $j$. All hypotheses of Proposition 4 hold, and its signal bound is $e^(- mu E_(j - 1)) = e^(- E_j)$.

Write $f = f^(\( h \))$, $k = k_h$, $s = s_h$, and $omega = omega_h$. We have obtained a signal of magnitude at least $e^(- E_h)$ with $k lt.eq D_(*)$ and $s lt.eq 1 \/ n$. The next step records where its parameters lie in the unit disk; this information will control the cost of continuing the signal to the trace domain.

=== 4.2 Damping under multiplication <damping-under-multiplication>

Call the parameters introduced between endpoints in each application of Proposition 4 #emph[elementary parameters]. Include also the final outer parameter

$ z_0 = e^(- s + upright(i) omega) . $

An elementary parameter $e^(- a + upright(i) theta)$ introduced at stage $j$ satisfies $a gt.eq beta S_j$ and $\| theta \| lt.eq C_1 S_(j - 1)$. Using (4.3), choose a sufficiently small absolute $c_2 > 0$ so that all these parameters obey

#[#set math.equation(numbering: n => "(4.9)")
 $ a gt.eq gamma min { \| theta \| \, D_(*) theta^2 } \, #h(2em) gamma = c_2 q_(*) Y^(- alpha) lt.eq 1 . $ <eq:elementary-damping>]

For an explicit verification, the increasing function $u mapsto u min { 1 \, D_(*) u }$ changes by at most a factor $max { C_1 \, C_1^2 }$ when $u$ is replaced by $C_1 u$. It therefore suffices to take $c_2 lt.eq beta eta \/ max { C_1 \, C_1^2 }$. Shrinking $c_2$ further covers $z_0$, since $\| omega \| lt.eq 2.002 s$. Conjugating any elementary parameter preserves (4.9).

Each new inner gap contains at most one parameter from each of at most four copies of the preceding feature, and at most one new elementary parameter. Count repeated factors with multiplicity; conjugation does not change the count. Starting with no inner parameters, the maximum number $N_j$ of elementary factors in a stage-$j$ inner gap satisfies

$ N_0 = 0 \, #h(2em) N_j lt.eq 4 N_(j - 1) + 1 \, #h(2em) N_j lt.eq frac(4^j - 1, 3) . $

In particular, an inner gap of $f$, even after multiplication by $z_0$, contains at most $\( 4^h + 2 \) \/ 3 lt.eq D_(*)$ elementary factors.

The following elementary lemma explains why this count matters. The Cayley map $z mapsto \( 1 + z \) \/ \( 1 - z \)$ sends the unit disk to the right half-plane; we need a quantitative distance from its boundary.

#thm([Lemma 4.1.])[
  (Products with controlled damping).  #emph[Let $N gt.eq 1$ be an integer and $0 < gamma lt.eq 1$. Suppose $z$ is a nonempty product of at most $N$ numbers $e^(- a_j + upright(i) theta_j)$, where $a_j > 0$, $theta_j in bb(R)$, and 
$ a_j gt.eq gamma min { \| theta_j \| \, N theta_j^2 } . $

 There is an absolute $c_3 > 0$ such that 
$ "Re" frac(1 + z, 1 - z) gt.eq c_3 gamma . $

]
] <lem:product-cayley>

#proof[
  Write $z = e^(- T + upright(i) psi)$, where $T = sum_j a_j > 0$ and $psi = sum_j theta_j$. Let
  $ U = sum_(\| theta_j \| gt.eq 1 \/ N) \| theta_j \| \, #h(2em) V = sum_(\| theta_j \| < 1 \/ N) \| theta_j \| . $
  Summing the hypotheses and applying Cauchy–Schwarz to at most $N$ small angles yields
  $ T gt.eq gamma (U + N sum_(\| theta_j \| < 1 \/ N) theta_j^2) gt.eq gamma \( U + V^2 \) . $
  If $U gt.eq 1$ or $V gt.eq 1$, the last bracket is at least one. Otherwise $U + V^2 gt.eq U^2 + V^2 gt.eq \( U + V \)^2 \/ 2$. Since $\| psi \| lt.eq U + V$, in all cases
  $ T gt.eq 1 / 2 gamma min { 1 \, psi^2 } . $
  For $0 < T lt.eq 1$ it follows that
  $ 1 - \| \| z^2 gt.eq c T \, #h(2em) \| 1 - z \|^2 lt.eq C #scale(x: 120%, y: 120%)[\(] T^2 + min { 1 \, psi^2 } #scale(x: 120%, y: 120%)[\)] lt.eq C' T \/ gamma . $
  Their ratio is $"Re" \( \( 1 + z \) \/ \( 1 - z \) \)$. If $T > 1$, that ratio is at least $\( 1 - e^(- 2) \) \/ 4$, which also suffices because $gamma lt.eq 1$. ◻
]

=== 4.3 The exact trace generating identity <the-exact-trace-generating-identity>

Let $z_1 \, dots.h \, z_(k - 1)$ denote the inner gap parameters of the final feature $f$. Define the polynomial in $k$ complex variables

#[#set math.equation(numbering: n => "(4.10)")
 $ F \( Z_0 \, dots.h \, Z_(k - 1) \) = sum_(1 lt.eq i_1 < dots.h.c < i_k lt.eq n) Delta [product_(r = 1)^k X_(i_r)] Z_0^(i_1) product_(r = 1)^(k - 1) Z_r^(i_(r + 1) - i_r) . $ <eq:input-polynomial>]

At the point

$ Z_0^(*) = z_0 \, #h(2em) Z_r^(*) = z_r z_0 quad \( 1 lt.eq r < k \) \, $

the exponents of $z_0$ telescope to $i_k$, so

#[#set math.equation(numbering: n => "(4.11)")
 $ F \( Z^(*) \) = z_0^d cal(S)_f \( s \, omega \) \, #h(2em) \| F \( Z^(*) \) \| gt.eq e^(- E_h - 1) . $ <eq:input-polynomial-signal>]

Here $s d lt.eq n S_h lt.eq 1$. Each coordinate of $Z^(*)$ is a nonempty product of at most $D_(*)$ elementary parameters, and hence Lemma 10 gives

#[#set math.equation(numbering: n => "(4.12)")
 $ "Re" frac(1 + Z_r^(*), 1 - Z_r^(*)) gt.eq c_3 gamma quad \( 0 lt.eq r < k \) . $ <eq:input-cayley-margin>]

We shall also need a bound on the coordinates’ collective proximity to the unit circle. If $z_r = e^(- a_r + upright(i) theta_r)$, then

$ frac(1, 1 - \| Z_r^(*) \|) lt.eq 1 + frac(1, a_r + s) lt.eq 1 + 1 / a_r quad \( r gt.eq 1 \) \, #h(2em) frac(1, 1 - \| Z_0^(*) \|) lt.eq 1 + 1 / s . $

These inequalities follow from $e^u gt.eq 1 + u$ for $u > 0$. The height bound in (4.8) and (4.5) therefore imply

#[#set math.equation(numbering: n => "(4.13)")
 $ W_(*) := log product_(r = 0)^(k - 1) frac(1, 1 - \| Z_r^(*) \|) lt.eq log H_f + log #scale(x: 120%, y: 120%)[\(] 1 + 1 \/ \( beta S_h \) #scale(x: 120%, y: 120%)[\)] lt.eq C 4^h A_0 . $ <eq:input-boundary-cost>]

We next express the same polynomial in terms of observable trace moments on a different domain. This uses the multivariate trace generating identity of [9] Section 5.2; see also [7] Fact 20. We give the required counting argument directly. For a rank tuple $ell = \( ell_1 \, dots.h \, ell_k \)$ with $1 lt.eq ell_1 < dots.h.c < ell_k lt.eq n$, abbreviate $T_ell = T_({ ell_1 \, dots.h \, ell_k })$. For $u = \( u_0 \, dots.h \, u_(k - 1) \) in bb(C)^k$, set

$ G \( u \) = sum_(1 lt.eq ell_1 < dots.h.c < ell_k lt.eq n) Delta \[ T_ell \] thin u_0^(ell_1 - 1) product_(r = 1)^(k - 1) u_r^(ell_(r + 1) - ell_r - 1) . $

Then, with $Z_r = q + p u_r$, the exact polynomial identity is

#[#set math.equation(numbering: n => "(4.14)")
 $ (product_(r = 0)^(k - 1) Z_r) G \( u \) = p^k F \( Z \) . $ <eq:trace-generating-identity>]

To prove it, fix input positions $i_1 < dots.h.c < i_k$ that supply the specified retained bits. Their own retention contributes $p^k$. Every input position before $i_1$ contributes $q + p u_0$, according to whether it is deleted or retained; there are $i_1 - 1$ such positions. Similarly, the $i_(r + 1) - i_r - 1$ positions in the $r$th intervening gap each contribute $q + p u_r$. Positions after $i_k$ contribute a total factor of one. The retained counts in these intervals are exactly $ell_1 - 1$ and $ell_(r + 1) - ell_r - 1$. Summing over all input tuples and applying $Delta$ gives $G \( u \)$ as $p^k$ times the polynomial in (4.10) with every displayed gap exponent reduced by one. Multiplication by $product_r Z_r$ proves (4.14), including points where some $Z_r = 0$.

Suppose, for the moment, that

#[#set math.equation(numbering: n => "(4.15)")
 $ \| Delta \[ T_I \] \| lt.eq epsilon quad upright("for every ") I subset.eq { 1 \, dots.h \, n } upright(" with ") 1 lt.eq \| \| I lt.eq D_(*) \, $ <eq:trace-closeness>]

where $epsilon > 0$. Since $k lt.eq D_(*)$, the rank sum has at most $n^k$ terms, so $\| G \( u \) \| lt.eq n^k epsilon$ when all $\| u_r \| lt.eq 1$. On this polydisk $\| Z_r \| lt.eq q + p = 1$. Thus (4.14) gives

#[#set math.equation(numbering: n => "(4.16)")
 $ \| F \( Z \) \| lt.eq \( n \/ p \)^k epsilon #h(2em) upright("if ") \| Z_r - q \| lt.eq p quad \( 0 lt.eq r < k \) . $ <eq:trace-polydisk-bound>]

This calculation uses only ordinary trace ranks and the convention that a rank product is zero when the trace is too short.

=== 4.4 Simultaneous continuation and the separation bound <simultaneous-continuation-and-the-separation-bound>

The lower bound (4.11) and the upper bound (4.16) concern different points. In Cayley coordinates the disk $\| Z - q \| lt.eq p$ becomes a half-plane:

#[#set math.equation(numbering: n => "(4.17)")
 $ \| Z - q \| lt.eq p quad arrow.l.r.double quad "Re" frac(1 + Z, 1 - Z) gt.eq q / p #h(2em) \( \| \| Z < 1 \) . $ <eq:cayley-trace-disk>]

Indeed, writing $w = \( 1 + Z \) \/ \( 1 - Z \)$ and expanding $\| p w - \( 1 + q \) \|^2 lt.eq p^2 \| w + 1 \|^2$ reduces it to $4 q lt.eq 4 p "Re" w$. We will move all coordinates to this half-plane using one complex variable. A single strip interpolation avoids incurring a separate continuation loss for every coordinate.

Write

$ w_r = frac(1 + Z_r^(*), 1 - Z_r^(*)) = xi_r + upright(i) zeta_r \, #h(2em) xi_r gt.eq c_3 gamma \, $

where $xi_r \, zeta_r in bb(R)$. For $v in bb(C)$ set

#[#set math.equation(numbering: n => "(4.18)")
 $ w_r \( v \) = \( 1 + v \) xi_r + upright(i) zeta_r \, #h(2em) Z_r \( v \) = frac(w_r \( v \) - 1, w_r \( v \) + 1) \, #h(2em) R = 1 + frac(q, p c_3 gamma) . $ <eq:simultaneous-path>]

Figure 2 shows how a common real value of $v$ moves two possible starting coordinates into the trace half-plane. The proof uses the analytic maps (4.18) for complex $v$ throughout a strip.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 1.2, fill: rgb("#f5f5ff"), stroke: none)
  circle((0.48, 0), radius: 0.72, fill: black, stroke: none)
  line((-1.44, 0), (1.584, 0), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#a6a6a6"))))
  content((1.584, 0), [#text(size: 9pt)[$"Re" Z$]], anchor: "west", padding: 0.1176cm)
  line((0, -1.392), (0, 1.44), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#a6a6a6"))))
  circle((0, 0), radius: 1.2, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10))
  circle((0.48, 0), radius: 0.72, stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((0.48, 0), radius: 0.0264, fill: black, stroke: none)
  content((0.48, 0), [#text(size: 9pt)[$q$]], anchor: "north-west", padding: 0.1176cm)
  content((1.2, 0), [#text(size: 9pt)[$1$]], anchor: "north-west", padding: 0.1176cm)
  circle((-0.2432, 0.6949), radius: 0.0324, fill: rgb("#0000b2"), stroke: none)
  content((-0.2432, 0.6949), [#text(size: 9pt)[$Z_0^*$]], anchor: "south-east", padding: 0.1176cm)
  circle((-0.2104, -0.5172), radius: 0.0324, fill: rgb("#cc6600"), stroke: none)
  content((-0.2104, -0.5172), [#text(size: 9pt)[$Z_1^*$]], anchor: "north-east", padding: 0.1176cm)
  content((0, 1.8), [#text(size: 9pt)[The $Z$-plane]])
  content((0, -1.704), [#text(size: 9pt)[$"lvert" Z-q "rvert" lt.eq p$ is shaded]])
  line((2.016, 0.264), (4.536, 0.264), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.276, 0.4404), [#text(size: 9pt)[$w= frac(1+Z, 1-Z)$]], anchor: "south", padding: 0.1176cm)
  rect((6, -1.32), (9.42, 1.32), fill: rgb("#f5f5ff"), stroke: none)
  rect((6.8, -1.32), (9.42, 1.32), fill: black, stroke: none)
  line((5.82, 0), (9.6, 0), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#a6a6a6"))))
  content((9.6, 0), [#text(size: 9pt)[$"Re" w$]], anchor: "west", padding: 0.1176cm)
  line((6, -1.392), (6, 1.464), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#595959"))))
  line((6.8, -1.32), (6.8, 1.32), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((6.8, 0), [#text(size: 9pt)[$q"/"p$]], anchor: "north-west", padding: 0.1176cm)
  line((6.42, 0.78), (7.96, 0.78), stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000b2"))))
  circle((6.42, 0.78), radius: 0.0324, fill: rgb("#0000b2"), stroke: none)
  content((6.42, 0.78), [#text(size: 9pt)[$w_0$]], anchor: "south-east", padding: 0.1176cm)
  circle((7.96, 0.78), radius: 0.0324, fill: rgb("#0000b2"), stroke: none)
  content((7.96, 0.78), [#text(size: 9pt)[$w_0(R)$]], anchor: "south", padding: 0.1176cm)
  line((6.6, -0.66), (8.8, -0.66), stroke: (paint: rgb("#cc6600"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#cc6600"))))
  circle((6.6, -0.66), radius: 0.0324, fill: rgb("#cc6600"), stroke: none)
  content((6.6, -0.66), [#text(size: 9pt)[$w_1$]], anchor: "north-east", padding: 0.1176cm)
  circle((8.8, -0.66), radius: 0.0324, fill: rgb("#cc6600"), stroke: none)
  content((8.8, -0.66), [#text(size: 9pt)[$w_1(R)$]], anchor: "north", padding: 0.1176cm)
  content((7.68, 1.8), [#text(size: 9pt)[The $w$-plane]])
  content((7.68, -1.704), [#text(size: 9pt)[Both paths use the same $0 lt.eq v lt.eq R$]])
})],
  caption: [Figure 2: Schematic geometry of the simultaneous continuation. The Cayley map turns the deletion disk into $"Re" w gt.eq q \/ p$. Two possible starting coordinates are shown. The horizontal arrows have different lengths but share the same parameter: $w_r \( v \) = \( 1 + v \) "Re" w_r + upright(i) "Im" w_r$. Only their real traces $0 lt.eq v lt.eq R$ are drawn. The proof interpolates $F \( Z_0 \( v \) \, dots.h \, Z_(k - 1) \( v \) \)$ on a single complex strip, simultaneously for every coordinate. ],
) <fig:simultaneous-cayley>

On the closed strip $- 1 \/ 2 lt.eq "Re" v lt.eq R$ we have $"Re" w_r \( v \) = \( 1 + "Re" v \) xi_r > 0$, so all $Z_r \( v \)$ lie in the unit disk and depend analytically on $v$. At $v = 0$ they equal $Z_r^(*)$. On the right boundary,

$ "Re" w_r \( v \) = \( 1 + R \) xi_r gt.eq q \/ p \, $

and therefore (4.16) applies. Moreover

#[#set math.equation(numbering: n => "(4.19)")
 $ 1 + R lt.eq C Y^alpha / p \, $ <eq:strip-width>]

because $gamma = c_2 q_(*) Y^(- alpha)$ and $q lt.eq q_(*)$.

We need a bound on the left boundary that does not involve $n^k$. The identity $1 - \| Z \|^2 = 4 "Re" w \/ \| w + 1 \|^2$ gives, when $"Re" v = - 1 \/ 2$,

#[#set math.equation(numbering: n => "(4.20)")
 $ 1 - \| Z_r \( v \) \| gt.eq frac(1 - \| Z_r^(*) \|, 4 \( 1 + \| \| v \)^2) . $ <eq:left-boundary-distance>]

To check the constant, first use $1 - \| Z_r \( v \) \| gt.eq xi_r \/ \| w_r \( v \) + 1 \|^2$ and $1 - \| Z_r^(*) \| lt.eq 4 xi_r \/ \| w_r + 1 \|^2$. Then use

$ \| w_r \( v \) + 1 \| lt.eq \| w_r + 1 \| + xi_r \| \| v lt.eq \( 1 + \| \| v \) \| w_r + 1 \| . $

The coefficients of $F$ have magnitude at most two. Summing independent geometric series over the positive prefix and gap lengths therefore gives, for every point in the open unit polydisk,

$ \| F \( Z \) \| lt.eq 2 product_(r = 0)^(k - 1) frac(1, 1 - \| Z_r \|) . $

It follows from (4.20) that

$ g \( v \) := frac(F \( Z_0 \( v \) \, dots.h \, Z_(k - 1) \( v \) \), \( 2 + v \)^(2 k)) $

has the boundary bounds

#[#set math.equation(numbering: n => "(4.21)")
 $ log \| g \( v \) \| & lt.eq W_(*) + C k + C &  & \( "Re" v = - 1 \/ 2 \) \,\
log \| g \( v \) \| & lt.eq k log \( n \/ p \) + log epsilon &  & \( "Re" v = R \) . $ <eq:strip-side-bounds>]

On the left, $\( 1 + \| \| v \) \/ \| 2 + v \|$ is bounded by an absolute constant. On the right, $\| 2 + v \| gt.eq 2 + R > 1$. The function $g$ is analytic and bounded on the strip: $F$ is a finite polynomial evaluated in the unit polydisk, and $\| 2 + v \| gt.eq 3 \/ 2$.

For clarity, the strip estimate we use is the following elementary consequence of the maximum principle. If a bounded analytic function on $a lt.eq "Re" v lt.eq b$ has logarithmic boundary bounds $L_(-) \, L_(+)$, then at a real $t in \[ a \, b \]$ its logarithm is at most $\( \( b - t \) L_(-) + \( t - a \) L_(+) \) \/ \( b - a \)$. Multiply the function by the exponential of the negative affine interpolant to make both side bounds one. On rectangles of height tending to infinity, apply the maximum principle after multiplying further by $exp { tau \( v^2 - max { a^2 \, b^2 } \) }$, for $tau > 0$. This factor has modulus at most one on the vertical sides and tends uniformly to zero on the horizontal sides. Let the height tend to infinity and then $tau$ tend to zero. This proves the estimate, including zeros of the function by continuity.

At $t = 0$ in our strip, the right boundary has weight $1 \/ \( 2 R + 1 \)$. By (4.11), $log \| g \( 0 \) \| gt.eq - E_h - 1 - 2 k log 2$. Substituting (4.21) consequently gives

#[#set math.equation(numbering: n => "(4.22)")
 $ log \( 1 \/ epsilon \) & lt.eq k log \( n \/ p \) + \( 2 R + 1 \) \( E_h + 1 + 2 k log 2 \) + 2 R \( W_(*) + C k + C \)\
 & lt.eq k log \( n \/ p \) + C \( 1 + R \) #scale(x: 120%, y: 120%)[\(] E_h + 4^h A_0 #scale(x: 120%, y: 120%)[\)] . $ <eq:separation-exponent>]

This is the desired quantitative transfer from input coordinates to trace coordinates.

It remains to compare the exponent with the budget in (1.1). Put $t = log_2 mu$. The choices in (4.2) satisfy $t + alpha < 3$, and

$ 4^h lt.eq C Y^2 \, #h(2em) E_h lt.eq C A_0 Y^t \, #h(2em) A_0 lt.eq Q \( 1 + log Y \) \, #h(2em) Q Y lt.eq C log n . $

Thus (4.19) yields

$ \( 1 + R \) E_h & lt.eq C / p \( log n \) Y^(t + alpha - 1) \( 1 + log Y \) lt.eq C / p \( log n \) Y^2 \( 1 + log Y \) \,\
\( 1 + R \) 4^h A_0 & lt.eq C / p \( log n \) Y^(1 + alpha) \( 1 + log Y \) lt.eq C / p \( log n \) Y^2 \( 1 + log Y \) . $

Also, since $n gt.eq 2$ and $log \( 1 \/ p \) lt.eq 1 \/ p$,

$ k log \( n \/ p \) lt.eq C Y^2 #scale(x: 120%, y: 120%)[\(] log n + log \( 1 \/ p \) #scale(x: 120%, y: 120%)[\)] lt.eq C / p \( log n \) Y^2 . $

Using (4.1), we conclude that the right-hand side of (4.22) is at most

#[#set math.equation(numbering: n => "(4.23)")
 $ C / p \( log n \) Y^2 \( 1 + log Y \) lt.eq C_6 p^(- 1) \( log n \) sans(X) \( n \, p \)^2 \( 1 + log sans(X) \( n \, p \) \)^6 = C_6 B \( n \, p \) . $ <eq:final-B-bound>]

Taking $epsilon = e^(- C_(upright("sep")) B \( n \, p \))$ with $C_(upright("sep")) > C_6$ contradicts (4.22). Hence (4.15) fails for that $epsilon$, proving Theorem 3 with the cutoff (4.2).

All constants were fixed in the following order: those of Proposition 4; then $J_(*) \, H$ and $eta$; then $C_5 \, c_2$; and finally $C_(upright("sep"))$. There is no dependence on the denominator of $p$ or on how close it is to an endpoint. In particular, when $q < 1 \/ n$ the cutoff $q_(*) = 1 \/ n$ keeps $Y < 2$ and $Q = 1 + log n$, while $q \/ q_(*) lt.eq 1$ keeps the strip estimate uniform. When $p$ is small, the strip width is controlled by the single factor $p^(- 1)$ already present in the budget. The case $p = 1$ will be handled directly in the decoding argument.

== 5 A uniform decoder <sec:decoding>

Theorem 3 supplies a test for the first incorrect bit of a prefix: no moment system fixing that prefix can reproduce all the low-order trace statistics. To turn this statement into an algorithm, we must also recognize a correct prefix in bounded time. The useful additional fact is that a correct prefix admits a moment system with strict slack, both in its statistical constraints and in its positivity constraint. We first exhibit that slack, then give a rational procedure which is guaranteed to find a feasible system whenever such slack exists.

=== 5.1 Statistical constraints for a prefix <statistical-constraints-for-a-prefix>

Assume for now that $p < 1$. Choose an integer $D$ and a positive dyadic number $zeta = 2^(- b_zeta)$ such that

#[#set math.equation(numbering: n => "(5.1)")
 $ D_(*) lt.eq D lt.eq C Y^2 \, #h(2em) zeta lt.eq 1 / 4 \, #h(2em) 4 zeta < e^(- C_(upright("sep")) B \( n \, p \)) \, #h(2em) b_zeta = O \( B \( n \, p \) \) \, $ <eq:decoder-parameters>]

where $C_(upright("sep"))$ is the constant in Theorem 3. Integer formulas for these choices will be given below. Let

$ cal(I)_D = { I subset.eq { 1 \, dots.h \, n } : 1 lt.eq \| I \| lt.eq D } \, #h(2em) N = \| cal(I)_D \| \, #h(2em) T = 512 \( 1 + N \) zeta^(- 2) . $

The number $T$ is an integer. From $T$ independent traces, form the empirical mean $hat(t)_I$ of the rank observable defining $T_I$, for every $I in cal(I)_D$. These are observables of the ordinary trace: if a requested rank is absent, its observable is zero.

For each fixed input $x$, let $cal(G)$ be the event

#[#set math.equation(numbering: n => "(5.2)")
 $ \| hat(t)_I - T_I \( x \) \| lt.eq zeta \/ 8 quad upright("for every ") I in cal(I)_D . $ <eq:empirical-good>]

Each observable takes values in ${ 0 \, 1 }$, so its empirical mean has variance at most $1 \/ \( 4 T \)$. Chebyshev’s inequality and a union bound give

#[#set math.equation(numbering: n => "(5.3)")
 $ bb(P)_x \( cal(G)^c \) lt.eq frac(16 N, T zeta^2) lt.eq 1 / 32 . $ <eq:good-probability>]

The same event will control all the prefix tests, even though the prefixes are chosen using the data.

For a proposed prefix, use the remaining sign variables and their moment matrix $M \( m \) = cal(M)_D \( m \)$ from (2.1). Its nonempty moment coordinates form a real vector $m$. Consider the rational constraints

#[#set math.equation(numbering: n => "(5.4)")
 $ m in \[ - 1 \, 1 \]^l \, #h(2em) M \( m \) succ.curly.eq 0 \, #h(2em) \| cal(E)_m \[ T_I \] - hat(t)_I \| lt.eq zeta quad \( I in cal(I)_D \) \, $ <eq:prefix-feasibility>]

where $l$ is the number of moment coordinates. Substituting the prefix and writing each remaining bit as one half of one plus its sign makes $cal(E)_m \[ T_I \]$ an affine function of $m$. Its nonconstant coefficients have absolute sum at most $1$, by the coefficient bound for $T_I$ in Section 2.

#thm([Lemma 5.1.])[
  #emph[On $cal(G)$, a prefix whose first incorrect bit is at its last position has no solution to (5.4). Every correct prefix has a moment vector $m^(*) in \[ - 1 \, 1 \]^l$ such that, writing $G$ for the dimension of its moment matrix, 
#[#set math.equation(numbering: n => "(5.5)")
 $ M \( m^(*) \) succ.curly.eq \( zeta \/ 8 \) "Id"_G \, #h(2em) \| cal(E)_(m^(*)) \[ T_I \] - hat(t)_I \| lt.eq zeta \/ 2 quad \( I in cal(I)_D \) . $ <eq:prefix-slack>]

]
] <lem:prefix-slack>

#proof[
  If a wrong prefix had a feasible moment vector, then (5.2) and (5.4) would give
  $ \| cal(E)_m \[ T_I \] - T_I \( x \) \| lt.eq 9 zeta \/ 8 quad \( I in cal(I)_D \) . $
  This contradicts Theorem 3 and (5.1).
  For a correct prefix, take the moments of the true completion with weight $1 - zeta \/ 8$, and the moments of independent uniform signs on the remaining positions with weight $zeta \/ 8$. The moment matrix of the latter distribution is the identity: its $\( I \, J \)$ entry is zero unless $I = J$. The mixture therefore has the stated matrix lower bound, and its coordinates lie in $\[ - 1 \, 1 \]$. Both constituent distributions give channel expectations in $\[ 0 \, 1 \]$, so mixing changes each $T_I \( x \)$ by at most $zeta \/ 8$. Equation (5.2) then bounds the discrepancy from $hat(t)_I$ by $zeta \/ 4$, which is stronger than required. ◻
]

=== 5.2 Finding a moment system with slack <finding-a-moment-system-with-slack>

The next lemma gives the bounded procedure needed for (5.4). It only promises to succeed when there is slack; every reported solution satisfies the exact inequalities. This distinction avoids any need to decide arbitrary instances of semidefinite feasibility. The procedure is a projected relaxation method for inequalities, in the tradition of Agmon and Motzkin–Schoenberg [1,16]. We give the iteration and its rounding analysis explicitly.

#thm([Lemma 5.2.])[
  (Rational feasibility with slack).  #emph[Let $r gt.eq 0$ and $D gt.eq 1$ be integers, and let $m$ consist of the 
$ l = sum_(j = 1)^(min \( 2 D \, r \)) binom(r, j) $

 nonempty sign moments. Let $M \( m \)$ be their moment matrix, of dimension 
$ G = sum_(j = 0)^(min \( D \, r \)) binom(r, j) . $

 Suppose a finite list of rational affine inequalities $ell_t \( m \) lt.eq b_t$ is given, each with nonconstant coefficient vector of $ell^1$-norm at most $1$, together with a dyadic $0 < zeta lt.eq 1 \/ 4$.]
  #emph[There is a deterministic rational procedure which either returns a vector satisfying 
$ m in \[ - 1 \, 1 \]^l \, #h(2em) M \( m \) succ.curly.eq 0 \, #h(2em) ell_t \( m \) lt.eq b_t quad upright("for all ") t \, $

 or reports failure. It returns a vector whenever some $m^(*) in \[ - 1 \, 1 \]^l$ satisfies 
$ M \( m^(*) \) succ.curly.eq \( zeta \/ 8 \) "Id"_G \, #h(2em) ell_t \( m^(*) \) lt.eq b_t - zeta \/ 2 quad upright("for all ") t . $

 Put $lambda = zeta \/ \( 16 G \)$. The procedure performs at most $ceil.l 10 \( 1 + l \) \/ lambda^2 ceil.r$ feasibility checks, each taking a number of bit operations polynomial in the list dimensions, the input bit lengths, and $log \( 1 \/ zeta \)$. These time bounds hold without the slack assumption.]
] <lem:rational-feasibility>

#proof[
  If $l = 0$, the matrix is $\[ 1 \]$ and all inequalities are constant, so direct rational comparisons suffice. Suppose $l > 0$. We describe exact separating directions, then an iteration with bounded precision.
  ===== 5.2.1 Directions from violated constraints. <directions-from-violated-constraints.>
  At a current point $m^(upright("cur")) in \[ - 1 \, 1 \]^l$, first check the affine inequalities and the matrix condition exactly. If all hold, return the current vector. A violated inequality $ell_t \( m^(upright("cur")) \) > b_t$ gives the direction $a$ equal to minus its nonconstant coefficient vector. Then $lr(bar.v.double a bar.v.double)_2 lt.eq 1$; under the slack assumption,
  $ chevron.l m^(*) - m^(upright("cur")) \, a chevron.r gt.eq zeta \/ 2 gt.eq lambda . $
  If instead the matrix condition fails, find a nonzero rational vector $v$ with $v^top M \( m^(upright("cur")) \) v < 0$. The exact construction of $v$ is given just below. Write the associated affine form as
  $ v^top M \( m \) v = c + h dot.op m \, #h(2em) a = frac(h, G v^top v) . $
  Each matrix entry is either the constant $1$ or one moment coordinate. Consequently
  $ lr(bar.v.double h bar.v.double)_1 lt.eq lr(bar.v.double v bar.v.double)_1^2 lt.eq G lr(bar.v.double v bar.v.double)_2^2 \, #h(2em) lr(bar.v.double a bar.v.double)_2 lt.eq 1 . $
  The slack matrix lower bound gives
  $ chevron.l m^(*) - m^(upright("cur")) \, a chevron.r = frac(v^top \( M \( m^(*) \) - M \( m^(upright("cur")) \) \) v, G v^top v) gt.eq frac(zeta, 8 G) gt.eq lambda . $
  Thus either violated condition provides a rational direction satisfying
  #[#set math.equation(numbering: n => "(5.6)")
   $ lr(bar.v.double a bar.v.double)_2 lt.eq 1 \, #h(2em) chevron.l m^(*) - m^(upright("cur")) \, a chevron.r gt.eq lambda $ <eq:feasibility-direction>]
  whenever a slack solution exists. If a constant affine inequality is violated, its direction is zero; this cannot happen in the slack case, and in all other cases the iteration is still bounded.
  ===== 5.2.2 An exact matrix check. <an-exact-matrix-check.>
  For a rational symmetric matrix, eliminate a positive diagonal pivot by taking its Schur complement. Congruence by an invertible triangular matrix shows that the original matrix is positive semidefinite exactly when the positive pivot and this Schur complement are. A negative diagonal supplies a negative unit vector. If a remaining diagonal at $i$ is zero and its entry $b$ in column $j$ is nonzero, let $c$ be the diagonal at $j$. We may assume $c gt.eq 0$, since otherwise there is already a negative diagonal. The rational vector
  $ y = e_i - frac(b, 1 + c + \| b \|) e_j $
  has quadratic form
  $ frac(b^2, \( 1 + c + \| b \| \)^2) #scale(x: 120%, y: 120%)[\[] - 2 \( 1 + c + \| b \| \) + c #scale(x: 120%, y: 120%)[\]] < 0 . $
  If no negative vector is found, continue with a positive diagonal pivot; when none remain, all entries are zero and the remainder is positive semidefinite.
  For completeness, a negative vector of a Schur complement lifts to one of the original matrix using only rational arithmetic. If $P$ is the original block of eliminated pivots and $B$ its block of entries against the remaining indices, the lift of $y$ is
  $ v = \( - P^(- 1) B y \, y \) . $
  Its quadratic form is exactly the quadratic form of $y$ for the Schur complement.
  These operations have polynomial bit complexity. Indeed, clear denominators in a rational matrix with $t$-bit entries; even the product of all denominators has at most $G^2 t$ bits. If $H$ is the resulting integer matrix and its entries have at most $s$ bits, the determinant expansion bounds every $j$-row minor by $j ! thin 2^(j s)$. Its bit length is therefore $O \( G \( s + log G \) \)$. Schur-complement entries are ratios of minors of the original matrix, and the inverse formula for $P$ gives the same bound for the lift. Fraction-reduced elimination, with rational comparisons at each step, therefore computes the check and the negative vector in polynomially many bit operations. This argument applies however small a positive pivot or a negative quadratic form may be.
  ===== 5.2.3 Iteration and rounding. <iteration-and-rounding.>
  Start with $m^(upright("cur")) = 0$. Choose the dyadic grid with mesh
  $ eta = 2^(- g) \, #h(2em) g = ⌈log_2 frac(100 \( 1 + l \), lambda^2)⌉ . $
  The integer $g$ is computed by rational comparisons with powers of two; thus $eta lt.eq lambda^2 \/ \( 100 \( 1 + l \) \)$, with $O \( 1 + log \( \( 1 + l \) \/ lambda \) \)$ fractional bits. After an unsuccessful check, add $lambda a$, clip every coordinate to $\[ - 1 \, 1 \]$, and round to the nearest point of this grid in the box. The endpoints of the box belong to the grid. Repeat up to the stated number of checks, reporting failure if none accepts.
  Under the slack assumption, (5.6) implies
  $ lr(bar.v.double m^(upright("cur")) + lambda a - m^(*) bar.v.double)_2^2 lt.eq lr(bar.v.double m^(upright("cur")) - m^(*) bar.v.double)_2^2 - lambda^2 . $
  Clipping cannot increase the distance to $m^(*)$. Since both the clipped vector and $m^(*)$ lie in the box, rounding changes the squared distance by at most $4 l eta + l eta^2 < lambda^2 \/ 2$. Each failed check thus decreases squared distance by at least $lambda^2 \/ 2$. Its initial value is at most $l$, so acceptance must occur before the cap.
  Finally, rounding keeps every iterate on a single grid of the indicated bit length. The exact matrix check, the affine comparisons, the formation and normalization of $h$, and one update involve polynomially many rational operations on numbers of polynomial bit length. Temporary denominators within an update therefore have polynomial bit length, and they do not accumulate across updates. The fixed cap and these bounds apply to every rational input list, whether or not it admits a slack solution. ◻
]

For a prefix test, write each absolute-value constraint in (5.4) as two affine inequalities and apply Lemma 12. Lemma 11 verifies exactly the slack hypotheses for a correct prefix. Every acceptance, on any data, gives an actual moment system satisfying (5.4).

The decoder starts with the empty prefix and tests both one-bit extensions. If precisely one accepts, it appends that bit; otherwise it appends $0$. It repeats until the prefix has length $n$. The latter rule specifies a length-$n$ output even for data on which the statistical estimates fail. There are at most $2 n$ tests.

=== 5.3 Integer parameters and bit complexity <integer-parameters-and-bit-complexity>

We now make the choices in (5.1) using only the binary input. This also accounts for the size of every list and every rational calculation in the decoder. Continue to assume $p < 1$, and use $q_(*) \, Q \, Y$ from (2.3). Define the positive integers

$ u & = 1 + ceil.l log_2 n ceil.r \, & v & = 1 + floor.l log_2 \( 1 \/ q_(*) \) floor.r \,\
y & = 1 + ceil.l u \/ v ceil.r \, & w & = 1 + ceil.l log_2 y ceil.r \, & a_p & = ceil.l 1 \/ p ceil.r . $

All logarithms appearing in these integer formulas mean integer length comparisons. In particular, the integer part of a logarithm of a rational number is found by comparing its numerator with power-of-two multiples of its denominator. The rational maximum defining $q_(*)$ is also found by an integer comparison.

The elementary comparisons

$ u asymp log n \, #h(2em) v asymp Q \, #h(2em) Y lt.eq y lt.eq C Y \, #h(2em) w asymp 1 + log Y \, #h(2em) p^(- 1) lt.eq a_p lt.eq 2 p^(- 1) $

have absolute constants. For the asserted lower bound on $y$, use $u gt.eq \( log n \) \/ log 2$ and $v lt.eq Q \/ log 2$. Together with $Y asymp sans(X) \( n \, p \)$, these comparisons give

#[#set math.equation(numbering: n => "(5.7)")
 $ B \( n \, p \) lt.eq a_p u y^2 w^6 lt.eq C B \( n \, p \) . $ <eq:integer-budget-proxy>]

Choose fixed positive integers $K_D \, K_m$, sufficiently large for the constants in Theorem 3, and set

#[#set math.equation(numbering: n => "(5.8)")
 $ D = K_D y^2 \, #h(2em) b_zeta = K_m a_p u y^2 w^6 \, #h(2em) zeta = 2^(- b_zeta) . $ <eq:integer-decoder-parameters>]

Since $D_(*) lt.eq C Y^2$ and $B \( n \, p \) gt.eq log 2$, these choices ensure all of (5.1). The integers $D \, b_zeta$, in binary, are computable in time polynomial in the input bit lengths. Writing the denominator $2^(b_zeta)$ subsequently costs $O \( b_zeta \)$ bits, which will be included in the bounds below.

We next describe how to form the rational constraints. For $I = { l_1 < dots.h.c < l_k }$ and $i_1 < dots.h.c < i_k$, the coefficient of $X_(i_1) dots.h.c X_(i_k)$ in $T_I$ is

#[#set math.equation(numbering: n => "(5.9)")
 $ binom(i_1 - 1, l_1 - 1) product_(j = 1)^(k - 1) binom(i_(j + 1) - i_j - 1, l_(j + 1) - l_j - 1) thin p^(l_k) q^(i_k - l_k) \, $ <eq:explicit-channel-coefficient>]

when all the gap counts are possible, and is zero otherwise. Indeed, the selected positions must be retained, and the prefix and successive open gaps must contain the indicated numbers of additional retentions. Positions after $i_k$ are unrestricted. Formula (5.9) follows by multiplying these independent binomial probabilities.

If the input representation is $p = a \/ b$, every denominator in (5.9) divides $b^n$. Binomial coefficients have $O \( n \)$ bits. Sign expansion adds a denominator dividing $2^D$, and empirical means have denominator $T$. Consequently the constraint coefficients have polynomial bit length in $n + L + D + log T$. Enumerating the rank and input tuples, then expanding the resulting bit monomials and substituting the prefix, constructs them directly. No list of complete trace masks is required.

All these enumerations fit the permitted resource scale. From $D = O \( Y^2 \)$, $Y asymp sans(X) \( n \, p \)$, and (1.1),

#[#set math.equation(numbering: n => "(5.10)")
 $ D log n = O \( B \( n \, p \) \) . $ <eq:decoder-size-bound>]

The rank list, every matrix basis, and every moment list have size at most $\( n + 1 \)^(2 D) = exp \( O \( B \( n \, p \) \) \)$. Input tuple lists satisfy the same bound. A sign expansion has at most $2^D$ terms; products of these enumeration bounds remain $exp \( O \( B \( n \, p \) \) \)$. Subsets larger than the available number of positions are simply absent, so this statement includes $D > n$ and prefixes with very few remaining positions.

By (5.1), the trace count $T$ is $exp \( O \( B \( n \, p \) \) \)$. For every prefix, the iteration cap in Lemma 12 is bounded by

$ 2560 \( 1 + l \) G^2 zeta^(- 2) + 1 = exp \( O \( B \( n \, p \) \) \) . $

The bit length of its grid is $O \( b_zeta + log G + log \( 1 + l \) \) = O \( B \( n \, p \) \)$. The preceding coefficient bounds and that lemma therefore bound all computation by a fixed polynomial in

#[#set math.equation(numbering: n => "(5.11)")
 $ n + L + exp \( O \( B \( n \, p \) \) \) . $ <eq:decoder-total-resource>]

In particular, this includes the construction of parameters and constraints, exact rational arithmetic, and the at most $2 n$ prefix tests.

#proof[
  If $p = 1$, request one trace and output it. For the universal halting specification, output $0^n$ if the supplied well-formed trace has a different length. The actual channel always supplies the input itself, and this branch takes polynomially many bit operations in $n + L$.
  For $p < 1$, use (5.8), request the specified $T$ traces, and compute their empirical statistics. Run the prefix rule specified above. This defines the machine on every stream of well-formed traces.
  On $cal(G)$, induction on the prefix length shows that precisely the correct extension accepts: the incorrect extension is infeasible by Lemma 11, and the correct one has the slack that guarantees acceptance. Thus the output is $x$ on $cal(G)$, whose probability is at least $31 \/ 32 > 2 \/ 3$ for each fixed $x$.
  Each supplied trace has at most $n$ bits and one delimiter. Reading them, and computing each of the finitely many rank observables, costs polynomially many bit operations in $n + T + N$; the empirical counters have $O \( log T \)$ bits. All loops, including all feasibility tests, have the input-dependent caps already given. Thus (5.11) is a bound for every well-formed trace stream, independently of the success event. The machine can ignore its internal random bits.
  To be explicit about the computational model, the described finite lists may be stored sequentially on tapes; replacing an indexed lookup by a scan incurs at most a polynomial overhead in their total encoded length. Integer addition, multiplication, division, and fraction reduction have elementary polynomial-time multitape implementations. The bit-length and loop bounds above therefore give absolute constants $K \, d$ for which the trace count is at most $exp \( K B \( n \, p \) \)$ and the total bit cost is at most $\( n + L + exp \( K B \( n \, p \) \) \)^d$, after enlarging $K \, d$ to absorb fixed factors. This enlargement is uniform because $B \( n \, p \) gt.eq log 2$. Choose absolute $C \, c$ large enough, with $C gt.eq K$ and $c gt.eq d$. Both the sample bound $M_C \( n \, p \)$ and the required runtime $\( n + L + M_C \( n \, p \) \)^c$ follow. All constants used in parameter selection are fixed integers in a single finite program. ◻
]

#heading(level: 1)[References]
#bibitem([1])[Shmuel Agmon. The relaxation method for linear inequalities. #emph[Canadian Journal of Mathematics] #strong[6] (1954), 382--392. #link("https://doi.org/10.4153/CJM-1954-037-2")[doi:10.4153/CJM-1954-037-2].]
#bibitem([2])[Tuğkan Batu, Sampath Kannan, Sanjeev Khanna, and Andrew McGregor. Reconstructing strings from random traces. In #emph[Proceedings of the Fifteenth Annual ACM--SIAM Symposium on Discrete Algorithms (SODA)], 2004, pp.~910--918.]
#bibitem([3])[Peter Borwein and Tamás Erdélyi. Littlewood-type problems on subarcs of the unit circle. #emph[Indiana University Mathematics Journal] #strong[46]\(4) (1997), 1323--1346. #link("https://doi.org/10.1512/iumj.1997.46.1435")[doi:10.1512/iumj.1997.46.1435].]
#bibitem([4])[Arnav Burudgunte, Paul Valiant, and Hongao Wang. Quasipolynomial trace reconstruction. Preprint, 2026. #link("https://arxiv.org/abs/2607.04073v1")[arXiv:2607.04073v1].]
#bibitem([5])[Zachary Chase. New lower bounds for trace reconstruction. #emph[Annales de l'Institut Henri Poincaré, Probabilités et Statistiques] #strong[57]\(2) (2021), 627--643. #link("https://doi.org/10.1214/20-AIHP1089")[doi:10.1214/20-AIHP1089].]
#bibitem([6])[Zachary Chase. Separating words and trace reconstruction. In #emph[Proceedings of the 53rd Annual ACM SIGACT Symposium on Theory of Computing (STOC)], 2021, pp.~21--31. #link("https://doi.org/10.1145/3406325.3451118")[doi:10.1145/3406325.3451118]. Trace-reconstruction preprint: #emph[New upper bounds for trace reconstruction], #link("https://arxiv.org/abs/2009.03296v3")[arXiv:2009.03296v3], 2022 (first posted 2020).]
#bibitem([7])[Xi Chen, Anindya De, Chin Ho Lee, and Rocco A.~Servedio. Trace reconstruction from local statistical queries. In #emph[Approximation, Randomization, and Combinatorial Optimization. Algorithms and Techniques (APPROX/RANDOM 2024)], LIPIcs #strong[317] (2024), 52:1--52:24. #link("https://doi.org/10.4230/LIPIcs.APPROX/RANDOM.2024.52")[doi:10.4230/LIPIcs.APPROX/RANDOM.2024.52].]
#bibitem([8])[Xi Chen, Anindya De, Chin Ho Lee, Rocco A.~Servedio, and Sandip Sinha. Polynomial-time trace reconstruction in the low deletion rate regime. In #emph[12th Innovations in Theoretical Computer Science Conference (ITCS 2021)], LIPIcs #strong[185] (2021), 20:1--20:20. #link("https://doi.org/10.4230/LIPIcs.ITCS.2021.20")[doi:10.4230/LIPIcs.ITCS.2021.20].]
#bibitem([9])[Xi Chen, Anindya De, Chin Ho Lee, Rocco A.~Servedio, and Sandip Sinha. Polynomial-time trace reconstruction in the smoothed complexity model. In #emph[Proceedings of the 2021 ACM--SIAM Symposium on Discrete Algorithms (SODA)], 2021, pp.~54--73. #link("https://doi.org/10.1137/1.9781611976465.5")[doi:10.1137/1.9781611976465.5]. Full version: #link("https://arxiv.org/abs/2008.12386")[arXiv:2008.12386].]
#bibitem([10])[Kuan Cheng, Elena Grigorescu, Xin Li, Madhu Sudan, and Minshen Zhu. On $k$-mer-based and maximum likelihood estimation algorithms for trace reconstruction. In #emph[2024 IEEE International Symposium on Information Theory (ISIT)], 2024, pp.~879--884. Full version: #link("https://arxiv.org/abs/2308.14993v2")[arXiv:2308.14993v2].]
#bibitem([11])[Anindya De, Ryan O'Donnell, and Rocco A.~Servedio. Optimal mean-based algorithms for trace reconstruction. #emph[Annals of Applied Probability] #strong[29]\(2) (2019), 851--874. #link("https://doi.org/10.1214/18-AAP1394")[doi:10.1214/18-AAP1394]. Conference version in STOC 2017, pp.~1047--1056.]
#bibitem([12])[Nina Holden and Russell Lyons. Lower bounds for trace reconstruction. #emph[Annals of Applied Probability] #strong[30]\(2) (2020), 503--525. #link("https://doi.org/10.1214/19-AAP1506")[doi:10.1214/19-AAP1506].]
#bibitem([13])[Thomas Holenstein, Michael Mitzenmacher, Rina Panigrahy, and Udi Wieder. Trace reconstruction with constant deletion probability and related results. In #emph[Proceedings of the Nineteenth Annual ACM--SIAM Symposium on Discrete Algorithms (SODA)], 2008, pp.~389--398. #link("https://doi.org/10.1145/1347082.1347125")[doi:10.1145/1347082.1347125].]
#bibitem([14])[Jean B.~Lasserre. Global optimization with polynomials and the problem of moments. #emph[SIAM Journal on Optimization] #strong[11]\(3) (2001), 796--817. #link("https://doi.org/10.1137/S1052623400366802")[doi:10.1137/S1052623400366802].]
#bibitem([15])[Vladimir I.~Levenshtein. Efficient reconstruction of sequences. #emph[IEEE Transactions on Information Theory] #strong[47]\(1) (2001), 2--22. #link("https://doi.org/10.1109/18.904499")[doi:10.1109/18.904499].]
#bibitem([16])[Theodore S.~Motzkin and Isaac J.~Schoenberg. The relaxation method for linear inequalities. #emph[Canadian Journal of Mathematics] #strong[6] (1954), 393--404. #link("https://doi.org/10.4153/CJM-1954-038-x")[doi:10.4153/CJM-1954-038-x].]
#bibitem([17])[Fedor Nazarov and Yuval Peres. Trace reconstruction with $exp \( O \( n^(1 \/ 3) \) \)$ samples. In #emph[Proceedings of the 49th Annual ACM SIGACT Symposium on Theory of Computing (STOC)], 2017, pp.~1042--1046. #link("https://doi.org/10.1145/3055399.3055494")[doi:10.1145/3055399.3055494].]
#bibitem([18])[Pablo A.~Parrilo. #emph[Structured semidefinite programs and semialgebraic geometry methods in robustness and optimization]. Ph.D. thesis, California Institute of Technology, 2000. #link("https://doi.org/10.7907/2K6Y-CH43")[doi:10.7907/2K6Y-CH43].]


