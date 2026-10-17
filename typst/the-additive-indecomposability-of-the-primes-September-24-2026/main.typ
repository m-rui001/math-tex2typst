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

#align(center)[#text(size: 16pt, weight: "bold")[The additive indecomposability of the primes]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Let $cal(P)$ denote the set of positive primes, and put $bb(N)_0 = { 0 \, 1 \, 2 \, dots.h }$. For $A \, B subset.eq bb(N)_0$, write $A + B = { a + b : a in A \, med b in B }$. Two subsets of $bb(N)_0$ are #emph[asymptotically equal] if their symmetric difference is finite. Ostmann’s conjecture asserts that $cal(P)$ is asymptotically additively indecomposable: it is not asymptotically equal to $A + B$ when both summands contain at least two elements. The conjecture goes back to his 1956 treatise #cite(label("Ostmann1956")) p. 13; the eventual-equality formulation and its terminology are recorded explicitly in #cite(label("ElsholtzHarper")) Definition 1.1 and Conjecture 1.2. It is also known as the inverse Goldbach problem.

#thm([Theorem 1.1.])[
  (Ostmann’s conjecture).  #emph[If $A \, B subset.eq bb(N)_0$ satisfy $\| A \| \, \| B \| gt.eq 2$, then $\( A + B \) triangle.stroked.t cal(P)$ is infinite. Equivalently, every finite modification of $cal(P)$ is additively indecomposable into two sets with at least two elements each.]
] <cor:ostmann>

Laffer and Mann showed that a hypothetical decomposition must have two infinite summands #cite(label("LafferMann1964")) Theorem 12. We first give a short sieve proof of this reduction in Lemma 3, then state the two-infinite-set contradiction as Theorem 4. The rest of the paper proves that theorem.

The conclusion concerns both eventual coverage of the primes and eventual exclusion of composite sums. Neither requirement is replaced by a density condition. In particular, if $\| A \| \, \| B \| gt.eq 2$ and $A + B$ contains every sufficiently large prime, then it contains infinitely many composite numbers.

Earlier work established increasingly strong restrictions on a hypothetical decomposition. Hornfeck’s work #cite(label("Hornfeck1954")) #cite(label("Hornfeck1955")) was followed by sieve arguments of Pomerance, Sárközy and Stewart #cite(label("PomeranceSarkozyStewart1988")), Hofmann and Wolke #cite(label("HofmannWolke1996")), and Elsholtz #cite(label("Elsholtz2001Remark")). Write $A \( x \) = \| A ∩ \[ 0 \, x \] \|$ and similarly for $B$. Bounds such as $A \( x \) B \( x \) lt.double x$ are compatible with the coverage lower bound $A \( x \) B \( x \) gt.double x \/ log x$ and therefore do not by themselves exclude a decomposition. Elsholtz combined the large and larger sieves to put both counting functions at the square-root scale, up to powers of $log x$, and ruled out a decomposition into three nontrivial summands #cite(label("Elsholtz2001")). His later refinement #cite(label("Elsholtz2006")) Theorem 1.9 gives the bounds reproduced in Lemma 5. Croot and Elsholtz also studied thin ternary sumsets contained in the primes, obtaining restrictions under a regularity hypothesis on representation multiplicities #cite(label("CrootElsholtz2005")) Theorem 1. Shao later proved a finite ternary obstruction: for some absolute $c > 0$, three subsets of $\[ 1 \, N \]$, each of size at least $N^(1 \/ 3 - c)$, have a composite number in their sumset once $N$ is sufficiently large #cite(label("Shao2016")) Theorem 1.3 of the preprint version. In their positive-integer formulation, Elsholtz and Harper sharpened the binary counting bounds to

$ frac(sqrt(x), log x log log x) lt.double A \( x \) \, B \( x \) lt.double sqrt(x) log log x $

under a hypothetical eventual decomposition #cite(label("ElsholtzHarper")) Theorem 2.6.

Green and Harper developed inverse questions for the large sieve and proved that a suitable inverse-sieve conjecture would imply Ostmann’s conjecture #cite(label("GreenHarper")) Conjecture 1.5 and Theorem 1.8. Their conjecture proposes a quadratic description of sets near the square-root sieve bound. Under half-residue restrictions $\| C med mod med p \| lt.eq p \/ 2 + O \( 1 \)$ at every prime and $\| C \| gt.double sqrt(N)$ for $C subset.eq \[ 1 \, N \]$, Hanson proved additive correlation with the squares and a logarithmic-size intersection with a quadratic image #cite(label("Hanson2020")) Theorem 1.2 and Corollary 1.3. Croot, Mao and Yip subsequently proved inverse theorems for local restrictions to short arithmetic progressions, with extensions to unions of progressions and other additive structures #cite(label("CrootMaoYip2025")). More recently, Croot, Mao, Pohoata and Yip used a weighted entropy argument to derive a further necessary condition for a hypothetical decomposition of the primes into two sets of positive integers, each containing at least two elements #cite(label("CrootMaoPohoataYip2026")) Theorem 1.10 and Corollary 1.11. For some $c > 0$ and every sufficiently large $N$, each summand then has at least $exp \( c sqrt(log N) \/ \( log log N \)^(3 \/ 2) \)$ elements in $\[ 1 \, N \]$ lying in an integral quadratic image $m plus.minus bb(Z)^2$; the product of the two intersection sizes is at least $exp \( c sqrt(log N) \/ log log N \)$. These quadratics may depend on $N$.

These large intersections with quadratic images fall short of the near-containment required by Green and Harper’s conditional route. Our proof uses the simultaneous residue restrictions and coverage of every sufficiently large prime to reach a contradiction without such a classification.

Under a hypothetical decomposition, put $D = - B$. For each prime $p$, deleting finite initial segments from $A$ and $B$ leaves disjoint images of $A$ and $D$ in $bb(F)_p$. Completing these subsets to a partition gives a residue set $S_p$ and its complement. The collision estimate in Section 2 shows, on suitable prime averages, that the two parts have approximately equal size and that the summands are approximately uniform on their respective parts.

The next stage rules out persistent correlations with translated multiplicative characters. Section 3 treats quadratic characters with independently chosen translating centers at every prime. A moment argument and Poisson summation force a common rational center. The quadratic large sieve then confines positive fractions of long tails of the summands to a small family of quadratic kernels, leading to a collision contradiction. Section 4 treats all higher character orders by repeated Cauchy–Schwarz transfers. Its anchor variables distinguish the copied terms and supply the character cancellation needed to control the diagonals. Together these arguments give the mixed-character decorrelation in Corollary 10.

Prime coverage enters separately in Section 5. A tensor estimate shows that the normalized additive transforms of the residue indicators cannot have small $L^1$ norm on too much harmonic prime mass. The proof compares a nonnegative sumset statistic with its average over the primes. This comparison retains the coverage information beyond the preliminary lower bounds for the summands.

The remaining residue indicators need not have a prescribed algebraic form. Section 6 proves a finite-field comparison for the binary trees produced by the transfers, using the mixed-character decorrelation. Its hypotheses involve only a probability $L^2$ bound and mixed-character correlations; they permit highly nonuniform pointwise values. This feature is needed for the exact Fourier transforms of the residue indicators. Sections 7 and 8 construct a positive statistic and establish its comparison estimates. The arithmetic separation includes repeated internal prime labels, coprimality conditions, and the possible exceptional real character in prime progression estimates. Finally, Section 9 averages over permutations of the bulk variables. Most pairs of arrangements have few overlap components and hence small correlation. Their total contribution and the remaining diagonal terms contradict the lower bound inherited from the positive statistic. The transfer depth is chosen sufficiently large and fixed before the large scale tends to infinity.

This proves asymptotic indecomposability directly from the simultaneous residue restrictions and prime coverage. The argument does not require the general inverse-sieve conjecture of #cite(label("GreenHarper")), and no such general classification theorem is asserted here.

== 2 Finite summands and residue supports <sec:preliminaries>

For $C subset.eq bb(N)_0$, put $C \( Y \) = \| C ∩ \[ 0 \, Y \] \|$. All logarithms are natural.

We use $e \( x \) = exp \( 2 pi i x \)$ and $e_m \( x \) = e \( x \/ m \)$. An expectation over a finite set means its uniform probability average unless another probability law is specified. Multiplicative characters, including the principal character, are extended by zero at zero. For functions on $bb(F)_p$ our Fourier convention is

$ hat(f) \( a \) = 1 / p sum_(x in bb(F)_p) f \( x \) e_p \( - a x \) \, #h(2em) f \( x \) = sum_(a in bb(F)_p) hat(f) \( a \) e_p \( a x \) . $

Norms of functions on a finite field use probability measure. A mass function $mu$ of a probability measure instead uses the counting norm $parallel mu parallel_2^2 = sum_x \| mu \( x \) \|^2$ when explicitly so stated below. This distinction is useful in the collision estimate.

=== 2.1 A sieve for finitely many shifts <a-sieve-for-finitely-many-shifts>

We use the classical additive large sieve in the following form. If complex coefficients $c_n$ are supported on an interval of $M$ consecutive integers and $Q gt.eq 1$, then

#[#set math.equation(numbering: n => "(2.1)")
 $ sum_(q lt.eq Q) med sum_(h med mod med q\
\( h \, q \) = 1) lr(|sum_n c_n e_q \( h n \)|)^2 lt.double \( M + Q^2 \) sum_n \| c_n \|^2 . $ <eq:prelim-large-sieve>]

Indeed, the reduced fractions with denominators at most $Q$ are $Q^(- 2)$-separated modulo one, so this is the separated-frequency inequality of Montgomery and Vaughan #cite(label("MontgomeryVaughan1973")) Theorem 1; see also Green and Harper #cite(label("GreenHarper")) Proposition 3.1. The estimate applies to arbitrary complex coefficients. Restricting its outer sum to prime or squarefree moduli is permitted by nonnegativity.

#thm([Lemma 2.1.])[
  (Fixed shifts).  #emph[Let $b_1 \, dots.h \, b_j$ be distinct nonnegative integers, where $j gt.eq 1$ is fixed. If $C subset bb(N)_0$ and each $c + b_i$ is prime for all sufficiently large $c in C$, then 
$ C \( Y \) lt.double_(b_1 \, dots.h \, b_j) frac(Y, \( log Y \)^j) . $

 The implicit constant depends only on the shifts; the threshold for $Y$ may also depend on the finite exceptional range.]
] <lem:shifted-sieve>

#proof[
  Take $Q = sqrt(Y)$ and remove from $C ∩ \[ 0 \, Y \]$ all $c lt.eq Q + C_0$, where $C_0$ is a fixed constant covering the exceptional range. The remaining set $U$ avoids $j$ distinct classes modulo every prime $p_0 < p lt.eq Q$, for a fixed sufficiently large $p_0$ depending on the shifts. We may assume $U eq.not diameter$ and $p_0 > j$.
  At such a prime define a mean-zero function equal to $1$ on the $p - j$ allowed classes and to $- \( p - j \) \/ j$ on the forbidden classes. Its probability squared norm is $\( p - j \) \/ j$. For squarefree $u$ with prime factors in this range, the tensor product of these functions has mean $1$ under the projection of the uniform measure on $U$. Its additive Fourier expansion contains only primitive modes, since every local factor has mean zero. Parseval and Cauchy–Schwarz therefore give
  #[#set math.equation(numbering: n => "(2.2)")
   $ sum_(h med mod med u\
\( h \, u \) = 1) lr(|bb(E)_(n in U) e_u \( h n \)|)^2 gt.eq product_(p divides u) frac(j, p - j) . $ <eq:prelim-primitive-lower>]
  The empty product at $u = 1$ is included. Applying (2.1) with $c_n = upright(bold(1))_U \( n \) \/ \| U \|$ bounds the sum of the left side over $u lt.eq Q$ by $O \( Y \/ \| U \| \)$.
  To bound the sum of the right side below, first allow every squarefree product of primes $p_0 < p lt.eq Q^(1 \/ \( 10 j \))$. Its total weight is
  $ product_(p_0 < p lt.eq Q^(1 \/ \( 10 j \))) (1 + frac(j, p - j)) gt.double_(b_1 \, dots.h \, b_j) \( log Q \)^j $
  by Mertens’ estimates. Under the probability law obtained by normalizing these weights, a prime is included with probability $j \/ p$, so
  $ bb(E) log u = j sum_(p_0 < p lt.eq Q^(1 \/ \( 10 j \))) frac(log p, p) = (1 / 10 + o \( 1 \)) log Q . $
  Markov’s inequality retains a fixed positive proportion of the weight when $u lt.eq Q$. Thus $\| U \| lt.double_(b_1 \, dots.h \, b_j) Y \/ \( log Y \)^j$. Restoring $O \( sqrt(Y) \)$ removed points proves the claim. ◻
]

#thm([Lemma 2.2.])[
  (Finite summands).  #emph[If $A \, B subset bb(N)_0$ have at least two elements each and $A + B$ agrees with $cal(P)$ outside a finite set, then both $A$ and $B$ are infinite.]
] <lem:finite-factor>

#proof[
  Suppose $A$ is finite. Two distinct elements of $A$ give two shifts of $B$ to which Lemma 2 applies. Hence $B \( Y \) lt.double Y \/ \( log Y \)^2$. On the other hand, every sufficiently large prime at most $Y$ is represented using elements of $A ∩ \[ 0 \, Y \]$ and $B ∩ \[ 0 \, Y \]$, so
  $ frac(Y, log Y) lt.double A \( Y \) B \( Y \) lt.eq \| A \| B \( Y \) lt.double frac(Y, \( log Y \)^2) \, $
  a contradiction. The other case is symmetric. ◻
]

=== 2.2 The two-infinite-set theorem <the-two-infinite-set-theorem>

It remains to prove the following technical theorem.

#thm([Theorem 2.3.])[
  (Two infinite summands).  #emph[There do not exist two infinite sets $A \, B subset.eq bb(N)_0$ such that $\( A + B \) triangle.stroked.t cal(P)$ is finite.]
] <thm:main>

Together with Lemma 3, this proves Theorem 1: a counterexample to the latter would have both summands infinite and would therefore contradict Theorem 4.

For the remainder of the proof, suppose to the contrary that infinite sets $A \, B subset.eq bb(N)_0$ satisfy this eventual equality. Fix a threshold $N$ so that both of the following statements hold:

#[#set math.equation(numbering: n => "(2.3)")
 $ cal(P) ∩ \( N \, oo \) subset.eq A + B \, #h(2em) \( A + B \) ∩ \( N \, oo \) subset.eq cal(P) . $ <eq:eventual-equality>]

The first is prime coverage; the second excludes composite sums. Choose an integer $N_(*) > \| N \| + 10$ and put $D = - B$. Constants in $O \( dot.op \)$ and $lt.double$ may depend on these fixed data; additional dependencies will be indicated where the order of parameters matters.

=== 2.3 Complementary residue supports <complementary-residue-supports>

For every prime $p$, the residue sets

$ { a med mod med p : a in A \, med a > p + N_(*) } \, #h(2em) { d med mod med p : d in D \, med - d > p + N_(*) } $

are disjoint. Indeed, a common residue would make $a - d$ a positive multiple of $p$ larger than $p$ and $N$, although $a - d in A + B$ must be prime. Both sets are nonempty by infinitude. Choose a partition $S_p \, S_p^c$ of $bb(F)_p$ containing the respective sets, and write $sigma_p = \| S_p \| \/ p$. Thus $0 < sigma_p < 1$. Residues in neither tail support may be assigned to either part.

=== 2.4 Sizes of the summands <sizes-of-the-summands>

The following bounds are due to Elsholtz #cite(label("Elsholtz2006")) Theorem 1.9. We include the large-sieve and collision argument in the present nonnegative-integer convention.

#thm([Lemma 2.4.])[
  (Square-root bounds).  #emph[Under the assumed decomposition with both summands infinite, 
#[#set math.equation(numbering: n => "(2.4)")
 $ frac(sqrt(Y), \( log Y \)^3) lt.double A \( Y \) \, B \( Y \) lt.double sqrt(Y) \( log Y \)^2 . $ <eq:src1>]

]
] <lem:size>

#proof[
  Coverage and the prime number theorem give $A \( Y \) B \( Y \) gt.double Y \/ log Y$. Infinitude and Lemma 2 give, for every fixed positive integer $j$,
  $ A \( Y \) \, B \( Y \) lt.double_j frac(Y, \( log Y \)^j) \, #h(2em) A \( Y \) \, B \( Y \) gt.double_j \( log Y \)^(j - 1) . $
  The second assertion follows from the first and the product lower bound.
  Suppose now that $m = A \( x \) gt.eq 3 sqrt(x)$, with $x$ sufficiently large. The set $U = A ∩ \( sqrt(x) + N_(*) \, x \]$ has size comparable to $m$. For $sqrt(x) \/ 2 < p lt.eq sqrt(x)$ it avoids all the $nu_p = \| B med mod med p \|$ classes in $- B med mod med p$. Here all elements of $B$ are allowed: if $p divides a + b$, then $a + b > p \, N$, contrary to primality. Parseval and Cauchy–Schwarz on the allowed classes give the nonzero-frequency energy lower bound
  $ sum_(h in bb(F)_p^times) \| bb(E)_(a in U) e_p \( h a \) \|^2 gt.eq frac(nu_p, p - nu_p) gt.eq nu_p / p . $
  The large sieve then implies $sum_(sqrt(x) \/ 2 < p lt.eq sqrt(x)) nu_p \/ p lt.double x \/ m$. Consequently Cauchy–Schwarz, followed by the prime number theorem, gives
  #[#set math.equation(numbering: n => "(2.5)")
   $ H := sum_(sqrt(x) \/ 2 < p lt.eq sqrt(x)) frac(log p, nu_p) gt.double frac(m, sqrt(x) log x) . $ <eq:prelim-H-lower>]
  For any $Y gt.eq 2$ with $B \( Y \) > 0$, consider two independent uniform elements of $B ∩ \[ 0 \, Y \]$. Their collision probability modulo $p$ is at least $1 \/ nu_p$. Each unequal pair contributes at most $log Y$ to the sum of $log p$ over its prime divisors; equal pairs have probability $1 \/ B \( Y \)$ and cost $O \( sqrt(x) \)$. Hence
  #[#set math.equation(numbering: n => "(2.6)")
   $ H lt.eq log Y + O (frac(sqrt(x), B \( Y \))) . $ <eq:prelim-H-upper>]
  If $m > x^(1 \/ 2 + epsilon.alt)$ on an unbounded sequence, for a fixed $epsilon.alt > 0$, choose $log Y = x^(epsilon.alt \/ 2)$ in (2.6). Equation (2.5) forces $B \( Y \) lt.double sqrt(x)$, whereas the preceding polylogarithmic lower bound contradicts this for sufficiently large fixed $j$. Applying the same argument to $B$, and using coverage, proves $A \( x \) \, B \( x \) = x^(1 \/ 2 + o \( 1 \))$.
  We can now take $Y = x^2$ in (2.6), since $B \( x^2 \) = x^(1 + o \( 1 \))$. Thus $H lt.double log x$, and (2.5) yields $m lt.double sqrt(x) \( log x \)^2$. If $m < 3 sqrt(x)$ the same bound is immediate. The bound for $B$ is symmetric. Coverage once again gives both lower bounds in (2.4). ◻
]

=== 2.5 Collision stability <collision-stability>

The congruent-pair count underlying Gallagher’s larger sieve #cite(label("Gallagher1971")) also measures how close a summand is to uniform on its residue support. This quantitative use of the larger sieve is central to Green and Harper’s inverse-sieve arguments #cite(label("GreenHarper")) Equation (2.1) and Lemma 2.4. We need the following weighted form for the two complementary supports.

Write $U_E$ for uniform probability on a finite nonempty set $E$. If $mu$ is a probability measure on integers, write $mu_p$ for its projection modulo $p$. The norms in the next statement are counting norms of probability mass functions.

#thm([Lemma 2.5.])[
  (Collision stability).  #emph[Let $b gt.eq 1$ be fixed. Suppose $mu \, nu$ are probability measures on 
$ A ∩ \( sqrt(X) + N_(*) \, X \] \, #h(2em) D ∩ \[ - X \, - sqrt(X) - N_(*) \) \, $

 respectively, and that every point mass is at most $\( log X \)^b \/ sqrt(X)$. Put $Q = sqrt(X) \/ \( log X \)^(b + 1)$. Then 
#[#set math.equation(numbering: n => "(2.7)")
 $ sum_(p lt.eq Q) log p #scale(x: 240%, y: 240%)[\(] & parallel mu_p - U_(S_p) parallel_2^2 + parallel nu_p - U_(S_p^c) parallel_2^2\
 & + frac(sigma_p^(- 1) + \( 1 - sigma_p \)^(- 1) - 4, p) #scale(x: 240%, y: 240%)[\)] lt.double_b log log X . $ <eq:src2>]

 All terms on the left are nonnegative.]
] <lem:collision>

#proof[
  The same unequal-pair count used above gives
  $ sum_(p lt.eq Q) \( log p \) parallel mu_p parallel_2^2 lt.eq log X + O (Q max_n mu \( n \)) = log X + O \( 1 \) \, $
  and the corresponding bound holds for $nu$. The projected supports lie in $S_p \, S_p^c$. Therefore
  $ parallel mu_p - U_(S_p) parallel_2^2 = parallel mu_p parallel_2^2 - frac(1, \| S_p \|) \, quad parallel nu_p - U_(S_p^c) parallel_2^2 = parallel nu_p parallel_2^2 - frac(1, \| S_p^c \|) . $
  The left side of (2.7) is consequently the sum of the two collision energies minus $4 sum_(p lt.eq Q) log p \/ p$. Mertens’ estimate gives
  $ 4 sum_(p lt.eq Q) frac(log p, p) = 2 log X - 4 \( b + 1 \) log log X + O \( 1 \) \, $
  which proves the assertion. Nonnegativity follows also from $sigma^(- 1) + \( 1 - sigma \)^(- 1) gt.eq 4$ for $0 < sigma < 1$. ◻
]

One useful form of the lemma does not require pointwise bounded test functions. If $f_p : bb(F)_p arrow.r bb(C)$ has probability squared norm at most one, then

#[#set math.equation(numbering: n => "(2.8)")
 $ lr(|bb(E)_mu f_p - bb(E)_(S_p) f_p|)^2 lt.eq p parallel mu_p - U_(S_p) parallel_2^2 \, $ <eq:prelim-test-stability>]

by Cauchy–Schwarz. Thus these squared errors have total $log p \/ p$-weighted sum $O_b \( log log X \)$; the same holds on the other side. In particular this applies to tests bounded by one. By Lemma 5, uniform measures on

$ A ∩ \[ X^(9 \/ 10) \, X \] \, #h(2em) D ∩ \[ - X \, - X^(9 \/ 10) \] $

meet the hypotheses for a fixed $b$: their sizes are $gt.double sqrt(X) \/ \( log X \)^3$, while the discarded initial pieces have size $o \( sqrt(X) \/ \( log X \)^3 \)$.

== 3 Quadratic characters with arbitrary translating centres <sec:quadratic>

We retain the sets $A \, D = - B$, the partitions $S_p \, S_p^c$, and the densities $sigma_p = \| S_p \| \/ p$ from Section 2. For an odd prime $p$, let $chi_p$ be the quadratic character of $bb(F)_p$, extended by zero at zero. The translating residues in the following proposition need not arise from a common integer or rational number.

#thm([Proposition 3.1.])[
  #emph[Under the assumed eventual decomposition of the primes, 
#[#set math.equation(numbering: n => "(3.1)")
 $ sum_(T lt.eq log p lt.eq 2 T) frac(log p, p) max_(t in bb(F)_p) lr(|bb(E)_(x in S_p) chi_p \( x - t \)|) = o \( T \) #h(2em) \( T arrow.r oo \) . $ <eq:src3>]

]
] <prop:quadratic>

The main difficulty is that the translating residues are initially unrelated. An amplified moment and Poisson summation, with estimates uniform over a polynomial-sized family of coefficient arrays, first produce a common rational centre for many primes. The quadratic large sieve then confines positive fractions of the two endpoint tails to a few quadratic kernels, whose populations contradict the collision estimate.

#proof[
  #strong[A biased prime block and the choice of scales.] Suppose that (3.1) fails. Mertens’ estimate gives
  $ sum_(T lt.eq log p lt.eq 2 T) frac(log p, p) = T + O \( 1 \) . $
  Since each bias is at most one, there are a constant $delta > 0$ and an unbounded sequence of $T$ for which the primes with maximal bias at least $delta$ have $log p \/ p$-weight at least $c_delta T$. Throughout this proof all limiting assertions refer to this sequence, and all constants may depend on this fixed bias. Set
  $ rho = 3 / 5 \, #h(2em) mu_0 = 10^(- 6) \, #h(2em) gamma = 10^(- 7) \, #h(2em) X = exp \( T^(1 + rho) \) \, $
  and define
  $ A_X = A ∩ \[ X^(9 \/ 10) \, X \] \, #h(2em) D_X = D ∩ \[ - X \, - X^(9 \/ 10) \] . $
  By Lemma 5, both tails have size $gt.double sqrt(X) \/ \( log X \)^3$. Their uniform measures satisfy Lemma 6, for example with its fixed exponent $b = 4$. The prime bands used below lie below the corresponding cutoff $sqrt(X) \/ \( log X \)^5$.
  The nonnegative density term in (2.7) shows that primes with $sigma_p in.not \[ 1 \/ 3 \, 2 \/ 3 \]$ have total $log p \/ p$-weight $O \( log log X \) = O \( log T \)$ in either of the bands considered here. For any functions $phi.alt_p : bb(F)_p arrow.r bb(C)$ with $\| phi.alt_p \| lt.eq 1$, the same equation and Cauchy–Schwarz give
  $ sum_(p lt.eq sqrt(X) \/ \( log X \)^5) frac(log p, p) lr(|bb(E)_(x in A_X) phi.alt_p \( x \) - bb(E)_(x in S_p) phi.alt_p \( x \)|)^2 lt.double log log X \, $
  and the analogous assertion for $D_X$ and $S_p^c$. This estimate allows the test function to be chosen separately at every prime. For each biased prime choose a maximizing translate and an orientation $epsilon.alt_p in { 1 \, - 1 }$. After deleting weight $O_delta \( log T \)$, both empirical means are within $delta \/ 8$ of the corresponding uniform means, and $1 \/ 3 lt.eq sigma_p lt.eq 2 \/ 3$. The two uniform means are related by
  $ bb(E)_(S_p^c) chi_p \( x - t \) = - frac(sigma_p, 1 - sigma_p) bb(E)_(S_p) chi_p \( x - t \) \, $
  because the complete character sum is zero. Subdivision into intervals $\[ Z \, 2 Z \]$ therefore yields a set $cal(P) subset \[ Z \, 2 Z \]$ of primes, with $log Z asymp T$ and $J = \| cal(P) \| gt.double_delta Z \/ log Z$, such that
  #[#set math.equation(numbering: n => "(3.2)")
   $ bb(E)_(x in A_X) epsilon.alt_p chi_p \( x - t_p \) gt.eq c_delta \, #h(2em) bb(E)_(x in D_X) epsilon.alt_p chi_p \( x - t_p \) lt.eq - c_delta quad \( p in cal(P) \) \, $ <eq:src4>]
  where $c_delta > 0$ is fixed. Indeed, the original band contains $O \( T \)$ such intervals, and one retains a positive constant of weighted mass in at least one interval; on it each prime has weight $O \( log Z \/ Z \)$.
  Apply the density part of (2.7) also to $T^gamma lt.eq log p lt.eq 2 T^gamma$. Its full weight is $T^gamma + O \( 1 \)$, while the exceptional weight is $O \( log T \)$. Consequently some block $\[ z \, 2 z \]$, with $log z asymp T^gamma$, contains $gt.double z \/ log z$ primes for which $1 \/ 3 lt.eq sigma_p lt.eq 2 \/ 3$. Put
  $ K = ⌊.02 frac(log Z, log \( 2 z \))⌋ \, $
  and let $L$ be a product of $K$ distinct such primes. There are enough primes to do this, since $z \/ log z$ exceeds every fixed power of $T$. Let $k$ be the smallest even integer at least $log X \/ log Z + 10$. Thus
  #[#set math.equation(numbering: n => "(3.3)")
   $ K asymp T^(1 - gamma) \, quad L lt.eq Z^.02 \, quad k asymp T^rho \, quad K = o \( log Z \) \, quad K / k gt.double T^(1 - gamma - rho) . $ <eq:quad-scales>]
  In particular all factors of $L$ are distinct from the primes in $cal(P)$.
  ===== 3.1 An amplified moment and removal of repeated primes. <an-amplified-moment-and-removal-of-repeated-primes.>
  For $ell divides L$ prime write $f_ell = upright(bold(1))_(S_ell) - sigma_ell$, periodically on $bb(Z)$, and set
  $ lambda = 1 / 16 \, #h(2em) W \( n \) = product_(ell divides L) \( 1 + lambda f_ell \( n \) \) \, #h(2em) H \( n \) = 1 / J sum_(p in cal(P)) epsilon.alt_p chi_p \( n - t_p \) . $
  Fix an even nonnegative Schwartz function $psi$ that is bounded below by a positive constant on $\[ 0 \, 1 \]$ and has smooth compactly supported Fourier transform, with convention $hat(psi) \( y \) = integral_(bb(R)) psi \( x \) e \( - x y \) thin d x$. Such a function is obtained by squaring the inverse Fourier transform of a sufficiently narrow real even smooth bump. The weight $W$ is positive, has period $L$ and mean one, and satisfies $W \( n \) gt.eq \( 1 + lambda \/ 3 \)^K$ on $A_X$. Since $k$ is even, Jensen’s inequality and (3.2) give
  #[#set math.equation(numbering: n => "(3.4)")
   $ I := sum_(n in bb(Z)) psi \( n \/ X \) W \( n \) H \( n \)^k gt.double frac(sqrt(X), \( log X \)^3) \( 1 + lambda \/ 3 \)^K c_delta^k gt.eq sqrt(X) exp \( .016 K \) $ <eq:quad-moment-lower>]
  for sufficiently large $T$. Here $log \( 1 + lambda \/ 3 \) > .0206$, and $k + log log X = o \( K \)$. Poisson summation, in its periodized form #cite(label("MontgomeryVaughan2007")) Appendix D.2, gives for the $L$-periodic function $W$
  #[#set math.equation(numbering: n => "(3.5)")
   $ I_0 := sum_n psi \( n \/ X \) W \( n \) = X hat(psi) \( 0 \) lt.double X : $ <eq:quad-total-weight>]
  all nonzero frequencies vanish once $X \/ L$ exceeds the fixed support radius of $hat(psi)$.
  We shall use the following elementary bound. If $H = J^(- 1) sum_(i = 1)^J y_i$ with $y_i in { 0 \, 1 \, - 1 }$ and $k$ is even, then, for an absolute constant $C$,
  #[#set math.equation(numbering: n => "(3.6)")
   $ lr(|H^k - 1 / J^k sum_(i_1 \, dots.h \, i_k in \[ J \]\
upright("distinct")) y_(i_1) dots.h.c y_(i_k)|) lt.eq sum_(1 lt.eq j lt.eq k \/ 2) (k^C / J)^j \| H \|^(k - 2 j) . $ <eq:src5>]
  To prove it, express the distinct-index sum by Möbius inversion on set partitions; see #cite(label("Rota1964")) Section 7, Example 1. Equivalently, sum over permutations of $\[ k \]$, with a cycle of length $m$ contributing $sum_i y_i^m$ and with the usual permutation sign. A partition block of size $m$ has coefficient $\( - 1 \)^(m - 1) \( m - 1 \) !$, since precisely $\( m - 1 \) !$ cycles have that support. If a permutation has $k - 2 j$ odd cycles, those cycles contribute $\( J H \)^(k - 2 j)$, whereas every even cycle contributes at most $J$ in absolute value. The total number of cycles is at most $k - j$. Moreover, at most $3 j$ positions belong to cycles of length greater than one: an odd cycle of length $m gt.eq 3$ uses $m$ positions while contributing $m - 1$ to $2 j$, and an even cycle contributes all its positions to $2 j$. There are at most $k^(O \( j \))$ permutations with this many moved positions. The identity permutation is the term $H^k$; all the other terms give (3.6).
  Apply (3.6) pointwise and then use Hölder with respect to the positive measure $psi \( n \/ X \) W \( n \)$. The relative error in $I$ is at most
  $ sum_(j = 1)^(k \/ 2) (k^C / J (I_0 / I)^(2 \/ k))^j = o \( 1 \) . $
  Indeed, the ratio is at most a constant times $k^C log Z exp \( - .032 K \/ k \)$, because $X^(1 \/ k) lt.eq Z$; (3.3) makes this tend to zero.
  ===== 3.2 Poisson summation with arbitrary translations. <poisson-summation-with-arbitrary-translations.>
  Henceforth choose an ordered tuple of $k$ distinct primes of $cal(P)$ uniformly at random. Its product is denoted by $M$. Expectation with respect to these tuples will also be written $bb(E)_M$, since the functions in use depend only on their product. Let
  $ chi_M = product_(p divides M) chi_p \, #h(2em) 0 lt.eq t_M < M \, quad t_M equiv t_p med \( mod med p \) quad \( p divides M \) \, $
  and set
  $ R = M \/ X \, #h(2em) theta = t_M \/ M \, #h(2em) h_0 equiv - t_M overline(M) med \( mod med L \) \, quad 0 lt.eq h_0 < L . $
  The bars here and below indicate inverses modulo the modulus in the expression. The choice of $k$ gives, uniformly in the tuple,
  #[#set math.equation(numbering: n => "(3.7)")
   $ Z^10 lt.eq R lt.eq Z^(12 + o \( 1 \)) . $ <eq:quad-R-range>]
  For $d divides L$ put
  $ f_d \( x \) = product_(ell divides d) f_ell \( x \) \, #h(2em) f_1 = 1 \, #h(2em) g_d \( b \) = sqrt(d) thin bb(E)_(x med mod med d) f_d \( x \) e_d \( - b x \) . $
  The product is interpreted by the Chinese remainder theorem. Fourier orthogonality and the same theorem imply
  #[#set math.equation(numbering: n => "(3.8)")
   $ bb(E)_(b med mod med d) \| g_d \( b \) \|^2 lt.eq 1 \, quad \| g_d \( b \) \| lt.eq sqrt(d) \, quad g_d \( b \) = product_(ell divides d) g_ell #scale(x: 120%, y: 120%)[\(] b overline(d \/ ell) #scale(x: 120%, y: 120%)[\)] . $ <eq:quad-g-properties>]
  In particular $g_d$ vanishes on nonunits when $d > 1$, since each $f_ell$ has mean zero. We use $g_1 = 1$.
  Expand $W = sum_(d divides L) lambda^(omega \( d \)) f_d$. For a fixed $d$, Poisson summation modulo $M d$ gives the complete transform of $f_d \( n \) chi_M \( n - t_M \)$. Its factor modulo $d$ is $sqrt(d) thin g_d \( - u overline(M) \)$, and its factor modulo $M$ is
  $ tau \( chi_M \) chi_M \( u \) chi_M \( d \) e_M \( t_M u overline(d) \) \, $
  where $\| tau \( chi_M \) \| = sqrt(M)$ by the primitive quadratic Gauss-sum identity #cite(label("MontgomeryVaughan2007")) Theorems 9.6–9.7. Since $t_M + M h_0$ is divisible by every $d divides L$,
  $ e_M \( t_M u overline(d) \) = e #scale(x: 120%, y: 120%)[\(] \( theta + h_0 \) u \/ d #scale(x: 120%, y: 120%)[\)] . $
  It follows that the transform of the distinct-prime contribution, after division by $sqrt(X)$ and multiplication by a unit complex number depending only on the tuple, is
  #[#set math.equation(numbering: n => "(3.9)")
   $ sum_(d divides L) frac(lambda^(omega \( d \)) chi_M \( d \), sqrt(R d)) sum_(u in bb(Z)) chi_M \( u \) g_d \( - u overline(M) \) e #scale(x: 120%, y: 120%)[\(] \( h_0 + theta \) u \/ d #scale(x: 120%, y: 120%)[\)] hat(psi) #scale(x: 120%, y: 120%)[\(] u \/ \( R d \) #scale(x: 120%, y: 120%)[\)] . $ <eq:src6>]
  The orientations $product_(p divides M) epsilon.alt_p$ are included in that unit. The term $u = 0$ vanishes. Since $f_d$ and $psi$ are real, the negative-frequency part is $chi_M \( - 1 \)$ times the conjugate of the positive-frequency part. Write the latter as $cal(F)_M$. The normalization from sampling distinct tuples is $\( J \)_k \/ J^k = 1 + o \( 1 \)$, where $\( a \)_r = a \( a - 1 \) dots.h.c \( a - r + 1 \)$. The moment bound and the repeat estimate therefore imply
  #[#set math.equation(numbering: n => "(3.10)")
   $ bb(E)_M \| cal(F)_M \| gt.eq exp \( .015 K \) . $ <eq:quad-fourier-lower>]
  For example, the absolute value of (3.9) is at most $2 \| cal(F)_M \|$, while the averaged original distinct contribution is $\( 1 - o \( 1 \) \) I \/ sqrt(X)$.
  Write uniquely $u = s v w^2 > 0$, where $s$ is squarefree and coprime to $L$, $v divides L$, and $w gt.eq 1$. For a positive integer $P$ define
  #[#set math.equation(numbering: n => "(3.11)")
   $ N_(d s v) & = sqrt(R d \/ \( s v \)) \,\
G_d^(\( P \)) \( s \, v \) & = 1 / N_(d s v) sum_(w gt.eq 1\
P divides w) g_d \( - s v w^2 overline(M) \) e #scale(x: 120%, y: 120%)[\(] \( h_0 + theta \) s v w^2 \/ d #scale(x: 120%, y: 120%)[\)] hat(psi) #scale(x: 120%, y: 120%)[\(] s v w^2 \/ \( R d \) #scale(x: 120%, y: 120%)[\)] \,\
C_s^(\( P \)) & = sum_(v divides L) frac(chi_M \( v \), sqrt(v)) sum_(d divides L) lambda^(omega \( d \)) chi_M \( d \) G_d^(\( P \)) \( s \, v \) . $ <eq:src7>]
  Since $chi_M \( w^2 \) = upright(bold(1))_(\( w \, M \) = 1)$, inclusion-exclusion gives
  #[#set math.equation(numbering: n => "(3.12)")
   $ cal(F)_M = sum_(P divides M) \( - 1 \)^(omega \( P \)) sum_(s lt.eq Z^14\
s upright(" squarefree")\
\( s \, L \) = 1) frac(chi_M \( s \), sqrt(s)) thin C_s^(\( P \)) . $ <eq:src8>]
  The fixed support of $hat(psi)$ and (3.7) ensure $u lt.double R L < Z^14$ and $w < Z^7$. Consequently only $P lt.eq Z^7$ occur in this expression. A divisor of $M$ this small contains at most seven prime factors, so the number of outer terms is $O \( k^7 \)$.
  To relate the translating residues, we shall force a large value of $G_d^(\( 1 \)) \( s \, v \)$ with $s < L^4$ for sufficiently many prime tuples. On a progression $w = x + d j$, its remaining quadratic phase has coefficient $s v d theta$, so a large value will give a small-denominator approximation to $theta = t_M \/ M$. Since the arrays $C_s^(\( P \))$ depend on the sampled tuple $M$, the intervening moment estimate must be uniform over a fixed family containing their discretizations.
  ===== 3.3 A moment estimate for a polynomial-sized family of arrays. <a-moment-estimate-for-a-polynomial-sized-family-of-arrays.>
  Put $l = floor.l T^(mu_0) floor.r$ and $u_0 = 2 l$. Let $cal(B)$ be any fixed family of complex arrays $b = \( b_s \)$, indexed by the squarefrees $s lt.eq Z^14$ coprime to $L$. Suppose that, for a fixed constant $c$, $\| cal(B) \| lt.eq Z^c$ and $sum_s \| b_s \| lt.eq Z^c$ for every $b in cal(B)$. We claim
  #[#set math.equation(numbering: n => "(3.13)")
   $ & (bb(E)_M max_(b in cal(B)) lr(|sum_s chi_M \( s \) b_s|)^(2 l))^(1 \/ \( 2 l \))\
 & #h(2em) lt.eq exp \( o \( K \) \) max_(b in cal(B)) (sum_s u_0^(omega \( s \)) \| b_s \|^2)^(1 \/ 2) + O \( Z^(- 10) \) . $ <eq:src9>]
  The $o \( K \)$ is uniform for families with this fixed $c$.
  To prove the claim, first replace the maximum of the moments by their sum. Each product $M$ has probability $k ! \/ \( J \)_k lt.eq 2 k ! \/ J^k$, so positivity permits domination by the sum over all odd $m lt.eq \( 2 Z \)^k$ with $chi_M \( s \)$ replaced by $\( s \/ m \)$. Expand one $2 l$-th moment. If the product $n$ of its $2 l$ indices is nonsquare, $m mapsto \( n \/ m \)$ on odd $m$, extended by zero on even $m$, is a nonprincipal quadratic Dirichlet character with possible additional zero factors. It has a period at most $8 n$ and mean zero over a period. One can see this by using the nontrivial squarefree kernel of $n$ and then imposing coprimality to its square part; the induced character remains nonprincipal on the units of a modulus dividing $8 "rad" \( n \)$. As $n lt.eq Z^(28 l)$, its sum over any initial interval is $O \( Z^(28 l) \)$. The total absolute nonsquare error for an array is therefore at most $Z^(28 l) \( sum_s \| b_s \| \)^(2 l) = Z^(O_c \( l \))$.
  When the product of the indices is square, its Jacobi symbol is either zero or one. Its contribution in absolute value is bounded by $\( 2 Z \)^k$ times the $2 l$-th moment of
  $ F \( epsilon \) = sum_s \| b_s \| product_(p divides s) epsilon_p \, $
  where the $epsilon_p$ are independent uniform signs. Indeed, the expectation of a product of these monomials is one exactly when the product of the corresponding squarefree indices is a square, and is zero otherwise. We use the even-moment form of Bonami’s hypercontractive inequality #cite(label("Bonami1970")) Chapter III, Theorems 2–3 and include its elementary proof here. For real $x \, y$ the binomial theorem gives
  $ (bb(E)_(epsilon = plus.minus 1) \| x + epsilon y \|^(2 l))^(1 \/ l) lt.eq x^2 + \( 2 l - 1 \) y^2 \, $
  because $binom(2 l, 2 i) lt.eq binom(l, i) \( 2 l - 1 \)^i$. Apply this one sign at a time. Minkowski’s inequality, applied to the square functions of the remaining signs, shows inductively that
  $ parallel F parallel_(2 l)^2 lt.eq sum_s \( 2 l - 1 \)^(omega \( s \)) \| b_s \|^2 lt.eq sum_s u_0^(omega \( s \)) \| b_s \|^2 . $
  This is the tensorized sign-moment form of Bonami hypercontractivity; see #cite(label("Bonami1970")) Chapter III, Theorem 3, p. 376. The preceding argument proves the needed form directly; the arithmetic moment transfer around it is the adaptation used here. Squarefreeness ensures that each sign occurs with degree at most one in every monomial.
  The $2 l$-th root of the square-product transfer factor is at most
  $ (Z^c frac(2 k !, J^k) \( 2 Z \)^k)^(1 \/ \( 2 l \)) lt.eq exp (O_c (frac(T + k log T, l))) = exp \( o \( K \) \) . $
  The last assertion uses $mu_0 > gamma$ and $rho < 1$. The nonsquare error, after the same probability factor and taking a $2 l$-th root, is at most
  $ exp (- frac(k log Z, 2 l) + O_c \( log Z \) + O (frac(k log T, l))) \, $
  which is $O \( Z^(- 10) \)$ since $l = o \( k \)$. This proves (3.13).
  ===== 3.4 Discretizing the coefficients and removing $P eq.not 1$. <discretizing-the-coefficients-and-removing-pne1.>
  The coefficients in (3.11), except for their dependence on $theta \, R \, P$, are determined by $M med mod med 4 L$ and $h_0 med mod med L$. For the quadratic symbols of divisors of $L$, this follows from quadratic reciprocity; the inverse of $M$ modulo every $d divides L$ is already determined modulo $L$. We allow every unit residue $M med mod med 4 L$, every $h_0 med mod med L$, every integer $1 lt.eq P lt.eq Z^7$, and grids of mesh at most $Z^(- 100)$ for
  $ 0 lt.eq theta lt.eq 1 \, #h(2em) Z^10 lt.eq R lt.eq 2 Z^13 . $
  This is a family of $Z^(O \( 1 \))$ parameter choices, with an absolute constant exponent. The larger range for $R$ also accommodates nearest grid points.
  These grids approximate the coefficients uniformly. On the support of a summand in $G_d^(\( P \))$ one has $w lt.double N_(d s v)$ and $s v w^2 \/ d lt.double R$. The number of positive multiples of $P$ in this range is $O \( N_(d s v) \/ P \)$, with no extra term required; if the range contains any multiple at all, then $N_(d s v) \/ P$ is bounded below. Differentiating the formula, and using the smooth compact support, gives uniformly
  $ \| partial_theta G_d^(\( P \)) \| lt.double R sqrt(L) \/ P \, #h(2em) \| partial_R G_d^(\( P \)) \| lt.double sqrt(L) \/ \( R P \) . $
  The derivative with respect to $R$ includes the factor $N_(d s v)^(- 1)$ and the argument of $hat(psi)$; both have the indicated bound. Thus nearest grid replacement changes each $G_d^(\( P \)) \( s \, v \)$ by $O \( Z^(- 80) \)$. The same estimates hold on the entire enlarged grid range, where the support still has $s < Z^14$ and $w < Z^7$. Even after summing the coefficient errors absolutely in (3.12), their contribution is $o \( 1 \)$: there are at most $Z^14$ indices, divisor sums cost $exp \( O \( K \) \) = Z^(o \( 1 \))$, and there are $O \( k^7 \)$ outer terms. The crude bound $\| G_d^(\( P \)) \| lt.double sqrt(L) \/ P$ also shows that every array $b_s = s^(- 1 \/ 2) C_s^(\( P \))$ has polynomial $ell^1$ norm.
  We shall repeatedly use
  #[#set math.equation(numbering: n => "(3.14)")
   $ sum_(v divides L) v^(- 1 \/ 2) & = 1 + o \( 1 \) \,\
sum_(s lt.eq Z^14\
s upright(" squarefree")) u_0^(omega \( s \)) / s & lt.eq product_(p lt.eq Z^14) \( 1 + u_0 \/ p \)\
 & lt.eq exp (u_0 sum_(p lt.eq Z^14) 1 / p) = exp \( o \( K \) \) . $ <eq:src10>]
  For the first assertion, the logarithm of the divisor product is $O \( K \/ sqrt(z) \) = o \( 1 \)$. For the last one it is $O \( T^(mu_0) log T \) = o \( K \)$. If $P divides M$ and $P eq.not 1$, then $P gt.eq Z$. For all arrays with this restriction, their weighted square norm in (3.13) is at most
  $ Z^(- 1) sqrt(L) thin \( 1 + lambda \)^K exp \( o \( K \) \) = Z^(- 1 + .01 + o \( 1 \)) . $
  The maximum over all integer $P$ in the grid family bounds the adaptive choice of the actual divisors. Equation (3.13) and the $O \( k^7 \)$ count show that all $P eq.not 1$ terms in (3.12) have total expected absolute value $o \( 1 \)$. We now set $P = 1$ and suppress its superscript.
  ===== 3.5 A small-kernel quadratic sum must be large. <a-small-kernel-quadratic-sum-must-be-large.>
  We shall prove that with probability at least $exp \( - O \( K \) \)$ there exist a squarefree $s < L^4$ coprime to $L$ and divisors $v \, d divides L$ such that
  #[#set math.equation(numbering: n => "(3.15)")
   $ \| G_d \( s \, v \) \| gt.eq 2^(omega \( d \) \/ 2) e^(- K) . $ <eq:src11>]
  For $s < L^4$, on the entire grid range,
  $ N_(d s v) / d = sqrt(frac(R, s v d)) gt.eq Z^4.9 $
  for sufficiently large $T$. If $s v$ is nonunit modulo $d$, the function $g_d \( - s v w^2 overline(M) \)$ is identically zero. Otherwise, because $g_d$ vanishes at nonunits, the squaring map has fibers of size at most $2^(omega \( d \))$ on every relevant residue. Therefore
  $ bb(E)_(w med mod med d) \| g_d \( - s v w^2 overline(M) \) \|^2 lt.eq 2^(omega \( d \)) \, #h(2em) bb(E)_(w med mod med d) \| g_d \( - s v w^2 overline(M) \) \| lt.eq 2^(omega \( d \) \/ 2) . $
  The same assertions hold for $d = 1$ by convention. In an interval of length $O \( N_(d s v) \)$, each residue occurs $O \( N_(d s v) \/ d \)$ times. Consequently
  #[#set math.equation(numbering: n => "(3.16)")
   $ \| G_d \( s \, v \) \| lt.double 2^(omega \( d \) \/ 2) #h(2em) \( s < L^4 \) . $ <eq:quad-small-G-upper>]
  By Minkowski and (3.14), the corresponding small-$s$ arrays satisfy
  $ (sum_(s < L^4) u_0^(omega \( s \)) / s \| C_s \|^2)^(1 \/ 2) lt.eq exp \( o \( K \) \) \( 1 + sqrt(2) lambda \)^K = exp \( O \( K \) \) . $
  If (3.15) fails for an actual tuple, its nearest grid point belongs, for sufficiently large $T$, to the fixed subfamily on which every small-$s$ value is bounded by $2^(omega \( d \) \/ 2) exp \( - .9 K \)$. This follows since the mesh error $O \( Z^(- 80) \)$ is negligible compared with $e^(- K)$. The weighted square norm of each small-$s$ array in that subfamily is at most
  #[#set math.equation(numbering: n => "(3.17)")
   $ exp #scale(x: 120%, y: 120%)[\(] \( - .9 + log \( 1 + sqrt(2) lambda \) + o \( 1 \) \) K #scale(x: 120%, y: 120%)[\)] \, $ <eq:quad-small-off-event>]
  which is exponentially small.
  It remains to bound all large-$s$ arrays, uniformly in their parameters, by $exp \( \( .006 + o \( 1 \) \) K \)$ in the weighted square norm. Fix $v divides L$ and a segment $S lt.eq s < 2 S$, where $L^4 lt.eq S lt.eq Z^14$, and put $tau = .005$. There are $O \( log Z \)$ segments; their total cost in Minkowski’s inequality is $exp \( o \( K \) \)$, as is the sum over $v$ with the weights $v^(- 1 \/ 2)$ in (3.14).
  For the low-weight indices $u_0^(omega \( s \)) lt.eq e^(tau K)$, bound the squared norm by $e^(tau K)$ times the unweighted one. By positivity this unweighted sum of squared moduli can be extended to all integers in $\[ S \, 2 S \)$ before expanding its $d \, d'$ cross terms; the defining formula for $G_d \( s \, v \)$ makes sense for these integers as well. We claim the correlation estimate
  #[#set math.equation(numbering: n => "(3.18)")
   $ lr(|sum_(S lt.eq s < 2 S) frac(G_d \( s \, v \) overline(G_(d') \( s \, v \)), s)|) lt.double (frac(d d', \( d \, d' \)^2))^(- 1 \/ 2) . $ <eq:src12>]
  To verify it, expand the two sums over $w \, w'$. A nonzero summand has
  $ w lt.double sqrt(R d \/ \( S v \)) \, #h(2em) w' lt.double sqrt(R d' \/ \( S v \)) . $
  Its periodic factor is $F \( s \) = g_d \( c s \) overline(g_(d') \( c' s \))$, where $c = - v w^2 overline(M) med \( mod med d \)$ and $c' = - v \( w' \)^2 overline(M) med \( mod med d' \)$. If either scalar is a nonunit, the summand is identically zero. Otherwise, on the period $q = \[ d \, d' \]$, every normalized additive Fourier coefficient of $F$ is bounded in modulus by
  $ A_(d \, d') = (frac(d d', \( d \, d' \)^2))^(- 1 \/ 2) . $
  Indeed, at a prime in exactly one divisor, Fourier inversion of $g_ell$ gives an upper bound $1 \/ sqrt(ell)$ since $\| f_ell \| lt.eq 1$. At a common prime Cauchy–Schwarz and (3.8) give an upper bound one. Chinese remaindering multiplies these local bounds.
  The remaining phase is $e \( alpha s \)$ for an arbitrary real number $alpha$, and the two transform factors form a smooth weight with uniformly bounded supremum and total variation on $\[ S \, 2 S \]$. For a $q$-periodic function whose Fourier coefficients are at most $A_(d \, d')$, finite Fourier expansion and the geometric-sum bound give
  $ lr(|sum_(s in I) F \( s \) e \( alpha s \)|) lt.double A_(d \, d') #scale(x: 120%, y: 120%)[\(] \| I \| + q log \( 2 q \) #scale(x: 120%, y: 120%)[\)] $
  for an interval $I$ of length at most $S$. To see the uniformity in $alpha$, sum $min \( S \, parallel alpha + h \/ q parallel^(- 1) \)$ over $h med mod med q$: a closest frequency costs at most $S$, and the others cost $O \( q sum_(j lt.eq q) 1 \/ j \)$. Partial summation inserts the smooth weight without changing this estimate. Here $q divides L$ and $S gt.eq L^4$, so the bound is $O \( A_(d \, d') S \)$. Finally, the factors $N_(d s v)^(- 1) N_(d' s v)^(- 1) \/ s$ equal $v \/ \( R sqrt(d d') \)$, independently of $s$, and there are at most $O \( R sqrt(d d') \/ \( S v \) \)$ pairs $w \, w'$. This proves (3.18). After the divisor sum, the low-weight squared norm is therefore
  #[#set math.equation(numbering: n => "(3.19)")
   $ lt.double e^(tau K) product_(ell divides L) \( 1 + lambda^2 + 2 lambda \/ sqrt(ell) \) . $ <eq:quad-low-weight>]
  For completeness we give a residue-uniform estimate for the high-weight indices. For each residue class $a med mod med L$,
  #[#set math.equation(numbering: n => "(3.20)")
   $ sum_(S lt.eq s < 2 S \, s equiv a med \( L \)\
s upright(" squarefree") \, \( s \, L \) = 1\
u_0^(omega \( s \)) > e^(tau K)) u_0^(omega \( s \)) lt.eq S / L e^(- 10 K) $ <eq:quad-high-weight-mass>]
  for sufficiently large $T$. Given such an $s$, take $r$ to be the product of its smallest $floor.l omega \( s \) \/ 2 floor.r$ prime factors. Then
  $ r lt.eq sqrt(2 S) \, quad \( r \, L \) = 1 \, quad omega \( r \) gt.eq frac(tau K, 2 log u_0) - 1 \, quad u_0^(omega \( s \)) lt.eq u_0 \( u_0^2 \)^(omega \( r \)) . $
  There are at most $O \( S \/ \( L r \) \)$ multiples of $r$ in the specified class and interval. The usual additive constant in this count is absorbed because $S \/ \( L r \) gt.eq sqrt(S) \/ \( sqrt(2) L \) gt.double 1$. Allowing all possible squarefree $r$, the desired sum is at most $O \( S \/ L \)$ times
  $ u_0 sum_(r lt.eq sqrt(2 S) \, med r upright(" squarefree")\
omega \( r \) gt.eq tau K \/ \( 2 log u_0 \) - 1) frac(\( u_0^2 \)^(omega \( r \)), r) & lt.eq u_0 T^(1 \/ 4 - tau K \/ \( 8 log u_0 \)) product_(p lt.eq sqrt(2 S)) \( 1 + u_0^2 T^(1 \/ 4) \/ p \)\
 & lt.eq u_0 T^(1 \/ 4 - tau K \/ \( 8 log u_0 \)) exp #scale(x: 120%, y: 120%)[\(] O \( u_0^2 T^(1 \/ 4) log T \) #scale(x: 120%, y: 120%)[\)] lt.eq e^(- 20 K) . $
  The last inequality follows since the negative main exponent is $- \( tau \/ \( 8 mu_0 \) + o \( 1 \) \) K = - \( 625 + o \( 1 \) \) K$, whereas the positive exponent is $O \( T^(1 \/ 4 + 2 mu_0) log T \) = o \( K \)$. This proves (3.20).
  In the expansion used for (3.18), sum the high-weight part absolutely. Its periodic factor satisfies $bb(E)_(s med mod med L) \| F \( s \) \| lt.eq 1$, by Cauchy–Schwarz and (3.8). Thus (3.20), followed by the same normalization and pair count, bounds its contribution by $O \( e^(- 10 K) \)$ for each pair of divisors. The divisor weights sum to $\( 1 + lambda \)^(2 K)$, which leaves an exponentially negligible bound. In (3.19) the logarithm of the product is $K log \( 1 + lambda^2 \) + o \( K \)$, because every $ell gt.eq z$. Combining the two parts, and then summing the segments and $v$, gives
  #[#set math.equation(numbering: n => "(3.21)")
   $ (sum_(s gt.eq L^4\
s upright(" squarefree")\
\( s \, L \) = 1) u_0^(omega \( s \)) / s \| C_s \|^2)^(1 \/ 2) lt.eq exp \( \( .006 + o \( 1 \) \) K \) \, $ <eq:quad-large-s-norm>]
  since $\( tau + log \( 1 + lambda^2 \) \) \/ 2 < .006$.
  Let $cal(E)$ be the event in (3.15), and split the $P = 1$ inner expression in (3.12) into small and large $s$. Apply (3.13) to the grid families for the large part and to the fixed subfamily in (3.17). Grid replacement costs $o \( 1 \)$ in each application. It follows that the large part has expected absolute value at most $exp \( \( .006 + o \( 1 \) \) K \)$, and the small part on $cal(E)^c$ has exponentially small expectation. In the latter assertion it is important that the maximum over the whole fixed subfamily bounds every tuple in $cal(E)^c$; no conditional character estimate is being asserted. The whole small part has $L^(2 l)$ probability norm $exp \( O \( K \) \)$ by (3.16) and (3.13). In view of (3.10) and the negligible $P eq.not 1$ terms, its expected absolute value on $cal(E)$ is at least $1 / 2 exp \( .015 K \)$ for large $T$. Hölder’s inequality now implies
  #[#set math.equation(numbering: n => "(3.22)")
   $ bb(P) \( cal(E) \) gt.eq exp \( - O \( K \) \) \, $ <eq:quad-event-probability>]
  as claimed.
  ===== 3.6 Recovering a rational approximation from the witness. <recovering-a-rational-approximation-from-the-witness.>
  Fix an actual tuple in $cal(E)$ and a witness $s \, v \, d$. Split the $w$-sum in (3.11) into progressions modulo $d$. The $g_d$ factor and the $h_0$ phase are constant on each progression, and the sum of their absolute amplitudes over the classes is at most $d thin 2^(omega \( d \) \/ 2)$. Put $Y_0 = N_(d s v) \/ d$. Equation (3.15) shows that on some progression $w = x + d j$ the remaining smooth quadratic sum has modulus at least $Y_0 e^(- K)$. Its quadratic coefficient in $j$ is $alpha = s v d theta$. The weight $hat(psi) \( \( \( j + x \/ d \) \/ Y_0 \)^2 \)$ is supported on an interval of length $O \( Y_0 \)$ and has bounded supremum and total variation, uniformly in the progression. Partial summation therefore gives an unweighted interval sum
  $ lr(|sum_(j in I) e \( alpha j^2 + beta j \)|) gt.double Y_0 e^(- K) \, #h(2em) \| I \| lt.double Y_0 \, $
  with an arbitrary real linear coefficient $beta$. We have $Y_0 gt.double Z^4$, $log Y_0 asymp T$, and $log T = o \( K \) = o \( T \)$.
  We record the inverse conclusion, including its dependence on the length:
  #[#set math.equation(numbering: n => "(3.23)")
   $ 1 lt.eq q lt.eq exp \( O \( K \) \) \, #h(2em) parallel q alpha parallel_(bb(R) \/ bb(Z)) lt.eq exp \( O \( K \) \) Y_0^(- 2) $ <eq:src13>]
  for some integer $q$. For a proof, let $Q_1 = floor.l Y_0^2 e^(- 8 K) floor.r$ and apply Dirichlet approximation to $2 alpha$. After reducing the resulting fraction, we have coprime integers $b \, r$, with $1 lt.eq r lt.eq Q_1$ and $\| 2 r alpha - b \| lt.eq 1 \/ Q_1$. In particular $\| 2 alpha - b \/ r \| lt.eq 1 \/ r^2$. One differencing step, in which the linear coefficient and the interval location do not affect the absolute bound, gives
  $ lr(|sum_(j in I) e \( alpha j^2 + beta j \)|)^2 lt.double Y_0 + sum_(1 lt.eq h lt.double Y_0) min \( Y_0 \, parallel 2 h alpha parallel^(- 1) \) lt.double \( Y_0 \/ r + 1 \) \( Y_0 + r log \( 2 r \) \) . $
  For the second bound split the shifts into blocks of length at most $r \/ 2$. Within such a block two values of $2 h alpha$ are separated modulo one by at least $1 \/ \( 2 r \)$, because the reduced rational values are separated by $1 \/ r$ and the approximation error between them is at most $1 \/ \( 2 r \)$. The sum of the displayed minima in one block is $O \( Y_0 + r log \( 2 r \) \)$. Bounded $r$ is covered by the same estimate. If $e^(8 K) < r lt.eq Q_1$, the last bound is at most
  $ O #scale(x: 120%, y: 120%)[\(] Y_0^2 e^(- 8 K) log \( 2 Y_0 \) + Y_0 log \( 2 Y_0 \) #scale(x: 120%, y: 120%)[\)] = o \( Y_0^2 e^(- 2 K) \) \, $
  contrary to the lower bound for the sum. Thus $r lt.eq e^(8 K)$, and $q = 2 r$ proves (3.23), since $1 \/ Q_1 lt.double e^(8 K) Y_0^(- 2)$.
  Let $a = q s v d$. Then
  $ 1 lt.eq a lt.eq L^6 e^(O \( K \)) lt.eq Z^(.12 + o \( 1 \)) . $
  Choose an integer $b'$ nearest to $a theta$ and put $n = a t_M - b' M$. As $Y_0^(- 2) = s v d \/ R$, Equation (3.23) gives
  #[#set math.equation(numbering: n => "(3.24)")
   $ \| n \| lt.eq a X e^(O \( K \)) lt.eq X Z^(.12 + o \( 1 \)) \, #h(2em) n equiv a t_p med \( mod med p \) quad \( p divides M \) . $ <eq:quad-integer-lift>]
  There are at most $Z^(.12 + o \( 1 \))$ choices of $a$. Using (3.22), $\( J \)_k = \( 1 - o \( 1 \) \) J^k$, and $e^(O \( K \)) = Z^(o \( 1 \))$, pigeonholing gives a fixed positive integer $a lt.eq Z^(.12 + o \( 1 \))$ for which at least $J^k Z^(- .13)$ ordered distinct tuples have a lift satisfying (3.24).
  ===== 3.7 One common centre for many primes. <one-common-centre-for-many-primes.>
  Put $H_0 = X Z^.15$, so that $H_0 lt.eq Z^(k - 10 + .15)$, and for every integer $\| n \| lt.eq H_0$ let
  $ r \( n \) = \| { p in cal(P) : n equiv a t_p med \( mod med p \) } \| . $
  Counting ordered tuples and then counting lifts modulo products of $k - 10$ distinct primes gives
  #[#set math.equation(numbering: n => "(3.25)")
   $ sum_(\| n \| lt.eq H_0) \( r \( n \) \)_k gt.eq J^k Z^(- .13) \, #h(2em) sum_(\| n \| lt.eq H_0) \( r \( n \) \)_(k - 10) lt.double Z^.15 J^(k - 10) . $ <eq:quad-lift-factorials>]
  For the second estimate each product is at least $Z^(k - 10)$, so the number of its lifts in the interval is $O \( Z^.15 \)$. The first estimate counts at least one lift for every tuple already obtained. The terms with $r \( n \) < Z^.6$ contribute at most
  $ Z^6 sum_n \( r \( n \) \)_(k - 10) lt.double Z^6.15 J^(k - 10) = o \( J^k Z^(- .13) \) $
  to the first sum in (3.25).
  For each remaining integer take its set of matching primes. Two different integers have at most $k$ common matching primes: a product of $k + 1$ such primes would divide their nonzero difference, whose absolute value is at most $2 H_0 < Z^(k + 1)$. Let there be $b$ high sets, of total cardinality $R_0$. If a prime occurs in $d_p$ of them, Cauchy–Schwarz and the intersection bound give
  $ R_0^2 / J lt.eq sum_p d_p^2 lt.eq R_0 + k b^2 . $
  Since $b lt.eq R_0 \/ Z^.6$ and $k J \/ Z^1.2 = o \( 1 \)$, this implies $R_0 lt.eq 2 J$ for sufficiently large $T$. If $J_0$ is the maximum size of a high set, then
  $ 1 / 2 J^k Z^(- .13) lt.eq sum_(n : thin r \( n \) gt.eq Z^.6) \( r \( n \) \)_k lt.eq J_0^(k - 1) R_0 lt.eq 2 J J_0^(k - 1) . $
  Thus one integer $n$ has a matching set $cal(P)_0$ satisfying
  #[#set math.equation(numbering: n => "(3.26)")
   $ J_0 := \| cal(P)_0 \| gt.eq J Z^(- O \( 1 \/ k \)) . $ <eq:quad-common-centre-size>]
  Reduce $n \/ a = h \/ m$ to lowest terms, with $m > 0$. Since $a < Z^.13 < p$ for $p in cal(P)_0$, reduction of this identity modulo $p$ is valid and yields
  #[#set math.equation(numbering: n => "(3.27)")
   $ t_p equiv h \/ m med \( mod med p \) quad \( p in cal(P)_0 \) \, #h(2em) m lt.eq Z^.13 = X^(o \( 1 \)) \, #h(2em) \| h \| lt.eq X Z^.15 . $ <eq:quad-common-centre>]
  This is the first point at which the initially arbitrary centres have been related to one another.
  ===== 3.8 The quadratic large sieve and the number of kernels. <the-quadratic-large-sieve-and-the-number-of-kernels.>
  Prime-product character tests for squarefree kernels also appear in Green and Harper #cite(label("GreenHarper")) Lemmas 6.1–6.2. Here the preceding argument has first related the independently chosen translating centers. We use Heath-Brown’s quadratic large sieve #cite(label("HeathBrown1995")) Theorem 1: for arbitrary complex coefficients on odd positive squarefree $s lt.eq S$,
  #[#set math.equation(numbering: n => "(3.28)")
   $ sum_(u lt.eq U)^(*) lr(|sum_s b_s \( s \/ u \)|)^2 lt.double_epsilon \( U S \)^epsilon \( U + S \) sum_s \| b_s \|^2 \, $ <eq:quad-heath-brown>]
  where the starred sum is over odd positive squarefree $u$. The same bound, up to an absolute factor, holds for $\( u \/ s \)$ with nonzero signed squarefree $u$ satisfying $\| u \| lt.eq U$. To check this extension explicitly, write $u = plus.minus 2^e v$, with $e in { 0 \, 1 }$ and $v$ positive odd squarefree, and separate $v med mod med 4$. Quadratic reciprocity turns $\( v \/ s \)$ into $\( s \/ v \)$ times a sign depending only on $s$ and the fixed class of $v$. The additional factors $\( plus.minus 2^e \/ s \)$ can also be absorbed into $b_s$. The coefficient square norm is unchanged. Dropping the restriction on $v med mod med 4$ by positivity and applying (3.28) in each of these eight cases proves the extension, including $u = plus.minus 1$.
  Put $epsilon.alt'_p = epsilon.alt_p chi_p \( m \)$ for $p in cal(P)_0$. Equations (3.2) and (3.27) show that
  $ F \( x \) = 1 / J_0 sum_(p in cal(P)_0) epsilon.alt'_p chi_p \( m x - h \) $
  has mean at least $c_delta$ on $A_X$ and at most $- c_delta$ on $D_X$. Since $\| F \| lt.eq 1$, on a fixed positive fraction of each tail we have $\| F \( x \) \| gt.eq c_delta \/ 2$. On these subsets $m x - h eq.not 0$, and write uniquely
  $ m x - h = u_x t_x^2 \, #h(2em) u_x upright(" signed squarefree") \, quad t_x gt.eq 1 . $
  Uniformly $\| u_x \| t_x^2 lt.eq m X + \| h \| = X^(1 + o \( 1 \))$. At most $O \( k \)$ primes of $cal(P)_0$ can divide $t_x$, by taking logarithms of their product. Replacing $chi_p \( m x - h \)$ by $chi_p \( u_x \)$ changes the average by $O \( k \/ J_0 \) = o \( 1 \)$. Thus the average with $u_x$ remains bounded away from zero.
  Raise that average to the even power $k$ and apply (3.6), now with $J_0$ in place of $J$. Its relative error is $o \( 1 \)$, since the mean has modulus at least a fixed positive constant and $k^C \/ J_0 = o \( 1 \)$. We obtain a single coefficient array, the same for every such kernel, with
  $ lr(|sum_s b_s \( u_x \/ s \)|) gt.eq c^k \, #h(2em) sum_s \| b_s \|^2 lt.eq frac(k !, J_0^k) \, $
  where $c > 0$ is fixed and the support consists of products of $k$ distinct primes of $cal(P)_0$. Indeed each such product has coefficient $k ! J_0^(- k) product_(p divides s) epsilon.alt'_p$, and there are $binom(J_0, k)$ of them. With $S = \( 2 Z \)^k$, we have $S = X^(1 + o \( 1 \))$ and $S > m X + \| h \|$ for large $T$, while
  #[#set math.equation(numbering: n => "(3.29)")
   $ S frac(k !, J_0^k) lt.eq exp #scale(x: 120%, y: 120%)[\(] O_delta \( log Z + k log T \) #scale(x: 120%, y: 120%)[\)] = X^(o \( 1 \)) . $ <eq:quad-coefficient-budget>]
  Apply the signed version of (3.28), with $U = m X + \| h \|$. Since $c^(- 2 k) = X^(o \( 1 \))$, the number of distinct kernels on these subsets is at most
  #[#set math.equation(numbering: n => "(3.30)")
   $ X^(3 epsilon + o \( 1 \)) $ <eq:quad-kernel-count>]
  for every fixed $epsilon > 0$; the estimate with exponent $2 epsilon + o \( 1 \)$ would also suffice.
  ===== 3.9 Populations in a kernel and disjoint prime supports. <populations-in-a-kernel-and-disjoint-prime-supports.>
  For a fixed kernel $u$, the equality $u t_x^2 = m x - h$ and $\( h \, m \) = 1$ give $\( u t_x \, m \) = 1$. The unit congruence $u t^2 equiv - h med \( mod med m \)$ has at most $O \( 2^(omega \( m \)) \)$ roots: there are at most two at an odd prime power, at most four at a power of two, and the Chinese remainder theorem applies. On either of our endpoint intervals the range of $t_x$ has diameter at most $sqrt(m X \/ \| u \|)$, because the range of $t_x^2$ has length at most $m X \/ \| u \|$ and $\| sqrt(a) - sqrt(b) \| lt.eq sqrt(\| a - b \|)$ for $a \, b gt.eq 0$. Counting the possible roots in their residue classes gives
  #[#set math.equation(numbering: n => "(3.31)")
   $ \| { x upright(" on a fixed side") : u_x = u } \| & lt.double 2^(omega \( m \)) (sqrt(m X \/ \| u \|) / m + 1)\
 & lt.double sqrt(X \/ \| u \|) + X^(o \( 1 \)) . $ <eq:src14>]
  Here $2^(omega \( m \)) lt.double sqrt(m)$ uniformly: in the product $product_(p divides m) 2 \/ sqrt(p)$, only the factors at $2$ and $3$ exceed one. Also $m = X^(o \( 1 \))$.
  Let $0 < c_1 lt.eq 1 \/ 4$ be an absolute constant for the combined zero-free region and Landau–Page statement recalled below, and put $C_(upright(z)) = 1 + c_1^(- 1) gt.eq 5$. Fix, in this order,
  $ 0 < eta lt.eq min { 1 \/ 1000 \, 1 \/ \( 200 C_(upright(z)) \) } \, #h(2em) 0 < epsilon < eta \/ 100 $
  in (3.30). The kernels with $\| u \| > X^eta$ contribute at most $X^(3 epsilon + o \( 1 \)) \( X^(1 \/ 2 - eta \/ 2) + X^(o \( 1 \)) \)$ points on either side. This is negligible compared with $sqrt(X) \/ \( log X \)^3$. We retain sets $cal(U) subset A_X$ and $cal(V) subset D_X$, each of size $gt.double_delta sqrt(X) \/ \( log X \)^3$, on which all kernels are nonzero and have absolute value at most $X^eta$.
  No prime divides a kernel on both sides. In fact, if a prime divides $v = u_x$ and $w = u_y$ for $x in cal(U)$, $y in cal(V)$, then it divides $m \( x - y \)$ and is coprime to $m$, hence divides $x - y$. But $x - y in A + B$ is an eventual prime exceeding $X^(9 \/ 10)$, whereas that divisor is at most $X^eta$. Taking $eta < 9 \/ 10$ makes this impossible. Thus every such product $v w$ is signed squarefree. Moreover its prime factors determine $\| v \|$ and $\| w \|$: the prime supports of all kernels on the first side and all kernels on the second side are disjoint. Only the bounded choice of signs remains.
  ===== 3.10 Exceptional characters and split primes. <exceptional-characters-and-split-primes.>
  We recall the precise unconditional input about Dirichlet $L$-functions that is needed here. For the absolute constant $c_1$ fixed above, among primitive nonprincipal characters of conductor at most $Q$, all zeros with imaginary part of modulus at most one satisfy $Re rho lt.eq 1 - c_1 \/ log Q$, apart from at most one real simple zero of a real character. This is the classical zero-free region together with the Landau–Page theorem. For every fixed $epsilon_1 > 0$, such a real zero satisfies $1 - beta gt.double_(epsilon_1) q^(- epsilon_1)$, by Siegel’s theorem, where $q$ is its conductor. These statements are used only for existence and asymptotics; no effective constant from Siegel’s theorem is required. We use the zero-free region and Page theorem in #cite(label("MontgomeryVaughan2007")) Theorem 11.3 and Corollary 11.10, and the real-zero bound in #cite(label("MontgomeryVaughan2007")) Corollary 11.15.
  Apply them with $Q_0 = 4 X^(2 eta)$. The primitive quadratic character corresponding to a signed squarefree integer $v w eq.not 1$ has conductor at most $4 \| v w \| lt.eq Q_0$. If the exceptional character has conductor $q > \( log X \)^100$, discard the pairs $\( x \, y \)$ that produce it. The character determines $v w$ and hence the two kernel magnitudes by the preceding disjointness. Equation (3.31) bounds the number of discarded pairs by
  $ O (X / sqrt(\| v w \|) + X^(1 \/ 2 + o \( 1 \))) lt.double frac(X, \( log X \)^50) + X^(1 \/ 2 + o \( 1 \)) . $
  This is negligible compared with $\| cal(U) \| \| cal(V) \| gt.double_delta X \/ \( log X \)^6$. There are $O \( X^(2 eta) \)$ possible ordered pairs of signed kernels. Among the remaining pairs we can therefore fix kernels $v \, w$ whose population product is $gt.double_delta X^(1 - 2 eta) \/ \( log X \)^6$. Each population is at most $O \( sqrt(X) \)$ by (3.31); consequently each is at least $X^(1 \/ 2 - 3 eta)$ for sufficiently large $T$. Let $cal(R)_1 \, cal(R)_2$ be the resulting sets of positive roots $t_x \, t_y$. The root maps are injective, their respective sizes are these populations, and their diameters are at most $X^(1 \/ 2 + o \( 1 \))$.
  Set $Q_2 = X^(1 \/ 2 - 5 eta)$. We claim that our choice of $eta$ gives
  #[#set math.equation(numbering: n => "(3.32)")
   $ sum_(p lt.eq Q_2\
p divides.not 2 m v w\
\( v w \/ p \) = 1) frac(log p, p) gt.eq .03 log X . $ <eq:src15>]
  If $v w = 1$, this follows directly from Mertens’ estimate after removing the prime divisors of $2 m$. Otherwise let $chi$ be the primitive quadratic character attached to $v w$, of conductor $q lt.eq Q_0$, and put
  $ s = 1 + frac(10, log X) \, #h(2em) s_0 = 1 + frac(1, log Q_0) . $
  For our fixed $eta$ and sufficiently large $X$, $1 < s lt.eq s_0 lt.eq 2$. The completed-function Hadamard formula gives, for real $1 < u lt.eq 2$,
  #[#set math.equation(numbering: n => "(3.33)")
   $ sum_rho Re frac(1, u - rho) = L' / L \( u \, chi \) + 1 / 2 log q + O \( 1 \) \, $ <eq:quad-log-derivative>]
  where the zeros are the nontrivial zeros, counted with multiplicity. For clarity, the completed logarithmic derivative is $L' \/ L \( u \, chi \) + 1 / 2 log \( q \/ pi \) + 1 / 2 Gamma' \/ Gamma \( \( u + kappa \) \/ 2 \)$, with $kappa in { 0 \, 1 }$; the real part of its Hadamard constant cancels the sum of $Re \( 1 \/ rho \)$. The gamma term is bounded on this interval. This proves precisely (3.33), with a uniform $O \( 1 \)$; see also #cite(label("Helfgott")) Section 3.7.4, Equations (3.97)–(3.102).
  The zero sum is positive. At $s_0$ it is at most $2 log Q_0$ for sufficiently large $X$, because the Euler series bounds $\| L' \/ L \( s_0 \, chi \) \|$ by $- zeta' \/ zeta \( s_0 \) = log Q_0 + O \( 1 \)$ and $q lt.eq Q_0$. For a nonexceptional zero $rho = beta + i gamma'$ with $\| gamma' \| lt.eq 1$, set $a = s - beta$ and $b = s_0 - beta$. The zero-free region gives $a gt.eq c_1 \/ log Q_0$, while $0 lt.eq b - a lt.eq 1 \/ log Q_0$. Hence
  $ frac(a \/ \( a^2 + \( gamma' \)^2 \), b \/ \( b^2 + \( gamma' \)^2 \)) lt.eq b / a lt.eq 1 + c_1^(- 1) . $
  If $\| gamma' \| > 1$, the same ratio is at most five, since $0 < a lt.eq b lt.eq 2$. Thus the sum of all nonexceptional terms at $s$ is at most $2 C_(upright(z)) log Q_0$, with a constant independent of $eta$. If the exceptional zero is a zero of the retained character, its conductor is at most $\( log X \)^100$. Siegel’s estimate with $epsilon_1 = 1 \/ 200$ then gives
  $ \( s - beta \)^(- 1) lt.eq \( 1 - beta \)^(- 1) lt.double q^(1 \/ 200) lt.eq \( log X \)^(1 \/ 2) = o \( log X \) . $
  Using (3.33) and removing the absolutely convergent prime-power terms yields
  #[#set math.equation(numbering: n => "(3.34)")
   $ sum_p frac(chi \( p \) log p, p^s) = - L' / L \( s \, chi \) + O \( 1 \) gt.eq - 2 C_(upright(z)) log Q_0 - o \( log X \) $ <eq:quad-signed-prime-mass>]
  with the fixed absolute constant $C_(upright(z))$.
  On the other hand,
  $ sum_p frac(log p, p^s) = 1 / 10 log X + O \( 1 \) \, #h(2em) sum_(p > Q_2) frac(log p, p^s) = 1 / 10 e^(- 5 + 50 eta) log X + O \( 1 \) . $
  The second equality follows by partial summation from $sum_(p lt.eq y) log p \/ p = log y + O \( 1 \)$. The primes dividing $2 m v w$ have total $log p \/ p$-weight $O \( log log X \)$: primes up to $log X$ satisfy this by Mertens, and those above it contribute at most $log \| 2 m v w \| \/ log X = O \( 1 \)$. For other primes, $upright(bold(1))_(chi \( p \) = 1) = \( 1 + chi \( p \) \) \/ 2$. Combining these facts with (3.34), the split-prime mass with denominator $p^s$ is at least
  $ #scale(x: 120%, y: 120%)[\(] .05 - 2 C_(upright(z)) eta - .1 e^(- 5 + 50 eta) - o \( 1 \) #scale(x: 120%, y: 120%)[\)] log X . $
  Our preceding choice gives $2 C_(upright(z)) eta lt.eq .01$ and $.1 e^(- 5 + 50 eta) < .001$, so this coefficient exceeds $.03$ for sufficiently large $X$. Replacing $p^s$ by $p$ only increases the split-prime sum and proves (3.32).
  ===== 3.11 The final collision contradiction. <the-final-collision-contradiction.>
  For $i = 1 \, 2$ let $beta_i \( p \)$ be the probability that two independent uniform elements of $cal(R)_i$ are congruent modulo $p$. For unequal roots, the sum of $log p$ over prime divisors of their difference is at most the logarithm of the diameter. The equal-root contribution is $O \( Q_2 \/ \| cal(R)_i \| \) = O \( X^(- 2 eta) \)$. Consequently
  #[#set math.equation(numbering: n => "(3.35)")
   $ sum_(p lt.eq Q_2) log p #scale(x: 120%, y: 120%)[\(] beta_1 \( p \) + beta_2 \( p \) #scale(x: 120%, y: 120%)[\)] lt.eq \( 1 + o \( 1 \) \) log X . $ <eq:quad-final-collision-upper>]
  Always $beta_i \( p \) gt.eq 1 \/ p$. For a prime counted in (3.32), choose a square root $c_p$ of $w \/ v$ modulo $p$. The occupied residue sets of $cal(R)_1$ and $c_p cal(R)_2$ are disjoint. Indeed, equality of residues would give $v t_x^2 equiv w t_y^2 med \( mod med p \)$, hence $p divides m \( x - y \)$. Since $p divides.not m$ and $x - y$ is a prime exceeding $X^(9 \/ 10) > Q_2$, this is impossible. If the two occupied sets have cardinalities $a_p \, b_p$, their collision probabilities are at least $1 \/ a_p \, 1 \/ b_p$, and $a_p + b_p lt.eq p$. Multiplication by $c_p$ preserves the second collision probability, so $beta_1 \( p \) + beta_2 \( p \) gt.eq 4 \/ p$ at every split prime under consideration. Thus the left side of (3.35) is at least
  $ 2 sum_(p lt.eq Q_2) frac(log p, p) + 2 sum_(p lt.eq Q_2\
p divides.not 2 m v w\
\( v w \/ p \) = 1) frac(log p, p) gt.eq \( 1 - 10 eta + .06 + o \( 1 \) \) log X . $
  Our choice of $eta$ contradicts (3.35). This proves the proposition. ◻
]

#thm([Corollary 3.2.])[
  #emph[For fixed $0 < alpha < beta$, as $L_(*) arrow.r oo$, 
$ sum_(alpha L_(*) lt.eq log log p lt.eq beta L_(*)) 1 / p max_(t in bb(F)_p) lr(|bb(E)_(x in S_p) chi_p \( x - t \)|) = o \( L_(*) \) . $

]
] <cor:quad-harmonic>

#proof[
  Partition the range of $log p$ into dyadic intervals $\[ T \, 2 T \]$. Equation (3.1), divided by $T$, bounds the contribution of each interval with weight $1 \/ p$ by a quantity tending to zero uniformly for $T gt.eq 1 / 2 e^(alpha L_(*))$. There are $O \( L_(*) \)$ intervals, including at most two truncated ones; positivity permits enlarging the latter to full intervals. Their sum is therefore $o \( L_(*) \)$. ◻
]

== 4 Translated characters of higher order <sec:characters>

In this section the harmonic mass of a set of primes $cal(P)$ is $sum_(p in cal(P)) p^(- 1)$. All multiplicative characters are extended by zero at zero. The parameters introduced in this section are local to its proof.

We now prove translated decorrelation for every character of order greater than two. Repeated Cauchy–Schwarz steps create copies of the prime variables, and pairs of smaller and larger anchor primes distinguish their positions. Changing a position then exposes a one-sided interaction involving the square of a selected character. That square is nonprincipal because the character has order greater than two. The final corollary combines this argument with the quadratic conclusion of Section 3.

#thm([Proposition 4.1.])[
  #emph[For every fixed $0 < alpha < beta$, one has 
#[#set math.equation(numbering: n => "(4.1)")
 $ sum_(alpha L lt.eq log log p lt.eq beta L) 1 / p max_(t in bb(F)_p \, med lambda med upright("multiplicative")\
"ord" \( lambda \) > 2) lr(|bb(E)_(x in S_p) lambda \( x - t \)|) = o \( L \) #h(2em) \( L arrow.r oo \) . $ <eq:src16>]

]
] <prop:characters>

#proof[
  Suppose otherwise. After passing to a sequence $L arrow.r oo$, there are constants $c \, delta > 0$, sets $cal(E)$ of primes in the indicated band with harmonic mass at least $c L$, and choices
  $ f_p \( x \) = z_p chi^(\( p \)) \( x - t_p \) \, #h(2em) \| z_p \| = 1 \, #h(2em) "ord" \( chi^(\( p \)) \) > 2 \, #h(2em) Re bb(E)_(x in S_p) f_p \( x \) gt.eq delta . $
  All constants below may depend on $alpha \, beta \, c \, delta$. Whenever labels are sampled from a specified prime set, their prior is the harmonic measure on that set, normalized to a probability. Restrictions on a tuple, such as distinctness or a product bin, will be imposed by indicators, without renormalizing its prior.
  === Selection of scales and positive statistics <selection-of-scales-and-positive-statistics>
  Set $epsilon.alt = 10^(- 4)$. We shall choose a sufficiently large constant $B_D$, followed by a sufficiently large lower bound $K_0$ on an integer depth $k$. Leading constants multiplying $m$ in the estimates below, except for the explicitly displayed $log z$ terms, will be independent of $B_D \, k$. Symbols such as $O_k \( 1 \)$ and $o_k \( m \)$ allow dependence on these fixed choices; their limiting variable is $L$.
  Use the coordinate $u = log log p$. Mertens’ estimate, uniformly on the intervals in question, gives harmonic mass at most the interval length plus $o \( 1 \)$. We can therefore find three subintervals in increasing order, each containing $gt.double L$ mass of $cal(E)$, separated from each other by gaps $gt.double L$. Indeed, partition the original band into $q$ equal intervals, where $q$ is a sufficiently large fixed integer. Intervals of mass less than $c L \/ \( 2 q \)$ carry together less than $c L \/ 2$. Since each other interval has mass at most $\( beta - alpha \) L \/ q + o \( 1 \)$, there are at least $c q \/ \( 3 \( beta - alpha \) \)$ other intervals for large $L$. Take $q$ large enough that this number exceeds 12, and select three of these intervals with at least one whole partition interval between successive choices. Their lengths and gaps are fixed positive multiples of $L$. We use all the $cal(E)$-primes in the middle interval as #emph[bulk labels]. In the lower interval, a unit-length shell has $cal(E)$-mass bounded below by a positive constant; fix one such shell for the small anchors.
  We require more structure in the upper interval. There is a fixed $c_1 > 0$ and a block $\[ U \, U + 5 k \]$, with $k gt.eq K_0$ bounded above independently of $L$, such that every subinterval of length $epsilon.alt k$ in the block has $cal(E)$-mass at least $c_1 epsilon.alt k$. Here is the density-increment argument, including the dependence of the constants. Choose an integer $M > 100 \/ epsilon.alt$. A block of fixed length $5 K_0 M^h$ inherits some fixed positive density $d$ from the upper interval, by averaging over a partition into such blocks. If a current block of length $5 k$ has density at least $d$ but contains a failing interval of length $epsilon.alt k$, the child blocks of length $5 k \/ M$ wholly contained in that interval have total length at least $epsilon.alt k \/ 2$. Choose $c_1 < d \/ 4$. These children have average density at most $2 c_1 < d \/ 2$, so one of the other children has density larger than the current density by a fixed positive amount depending only on $d \, epsilon.alt$. This increase cannot occur more than $h$ times, for sufficiently large fixed $h$, because all densities are at most $1 + o \( 1 \)$. Neither $h$ nor $c_1$ depends on $K_0$. Thus the terminal $k$ belongs to the finite set ${ K_0 \, K_0 M \, dots.h \, K_0 M^h }$. Pass to an unbounded subsequence on which $k$ is fixed.
  Increase $K_0$ so that discarding at most two boundary unit shells from an interval of length $epsilon.alt k$ costs less than half its guaranteed mass. Every such interval then contains a whole shell from the grid $U + bb(Z)$ with $cal(E)$-mass at least a fixed $c_0 > 0$. Call these shells #emph[rich]. Fix one rich shell in $\[ U \, U + 2 epsilon.alt k \]$; it supplies a top label and the big anchors. Let $tau$ be the exponential of its lower endpoint in the $u$-coordinate, and set
  $ log X = 10^3 thin 4^k tau \, #h(2em) z = exp \( 3 epsilon.alt k \) \, #h(2em) m = floor.l z L floor.r . $
  We next obtain good endpoints simultaneously for every shell that may be needed. The sets to be tested are the bulk interval, the small-anchor shell, the top shell, and all rich grid shells in the late block lying wholly below $log p = \( log X \) \/ 4$. Their number is bounded for fixed $k$, and each has harmonic mass bounded below by a positive constant. Let $cal(A)_X = A ∩ \[ X^(9 \/ 10) \, X \]$. For any subset $cal(A)' subset cal(A)_X$ with
  $ \| cal(A)' \| gt.eq frac(sqrt(X), \( log X \)^10) \, $
  apply Lemma 6 to its uniform measure and the uniform measure on the full $D$-tail. Every tested prime is below the cutoff in that lemma. Cauchy–Schwarz on the residue classes, followed by $log p gt.eq e^(alpha L)$, gives
  $ sum_(upright("tested ") p) 1 / p lr(|bb(E)_(a in cal(A)') f_p \( a \) - bb(E)_(x in S_p) f_p \( x \)|)^2 lt.double \( log log X \) e^(- alpha L) = o \( 1 \) . $
  If at least $sqrt(X) \/ \( log X \)^10$ endpoints failed $Re bb(E)_p f_p \( a \) gt.eq delta \/ 2$ for one of the tested prime sets, their uniform measure would contradict this estimate and Cauchy–Schwarz over that set of primes. Lemma 5 shows that $\| cal(A)_X \| gt.double sqrt(X) \/ \( log X \)^3$. Consequently, outside a negligible fraction of $cal(A)_X$, all these tests hold simultaneously. Call these endpoints typical.
  For a rich unit shell with lower exponential scale $b$, partition its primes into the cells
  $ cal(E)_h = { p in cal(E) : h lt.eq log p < h + 1 } \, #h(2em) h in bb(Z) ∩ \[ b \, e b \] . $
  Boundary cells have negligible mass, and the prime-counting upper bound gives mass $O \( 1 \/ b \)$ for every cell. At a typical endpoint, the shell average has real part at least $delta \/ 2$. Since $\| f_p \| lt.eq 1$, a fixed positive amount of shell mass lies in cells whose average has real part at least $delta \/ 4$. Discarding cells with mass smaller than a sufficiently small constant times $1 \/ b$ loses less than half this amount. Thus there are $gt.double b$ good cells satisfying
  $ sum_(p in cal(E)_h) 1 / p gt.double 1 / b \, #h(2em) Re bb(E)_(p in cal(E)_h) f_p \( a \) gt.eq delta \/ 4 . $
  The constants are uniform over every tested shell.
  A word consists of $m$ independent bulk labels and one independent top label. Define
  $ G_J \( n \) = bb(E)_(upright("word")) upright(bold(1))_({ floor.l sum log p floor.r = J }) product f_p \( n \) . $
  There are at most $exp \( C L \)$ possible bins. The gap between the bulk and top scales implies
  $ \( 1 - o \( 1 \) \) tau lt.eq J lt.eq 4 tau $
  whenever the bin is nonempty. At a typical endpoint, independence gives $\| sum_J G_J \( a \) \| gt.eq \( delta \/ 2 \)^(m + 1)$. Pigeonholing first a bin for each endpoint and then the endpoints among bins yields one fixed $J$ such that
  $ \| G_J \( a \) \| gt.eq e^(- C m) $
  at at least $sqrt(X) e^(- C m)$ typical endpoints. The constants here are independent of large fixed $k$: the bin count and the tail-size logarithmic loss have logarithms $O \( L \) + O_k \( 1 \)$.
  Introduce the gaps and frequency bounds
  #[#set math.equation(numbering: n => "(4.2)")
   $ Delta_0 & = \( B_D + 20 log z \) m \, #h(2em) Delta_j = 2^(j - 1) Delta_0 + 4^j sqrt(m) &  & \( 1 lt.eq j lt.eq k \) \,\
E_j & = 2^j Delta_0 + 2 dot.op 4^j sqrt(m) \, #h(2em) V_j = e^(E_j) &  & \( 0 lt.eq j lt.eq k \) . $ <eq:src17>]
  For each retained endpoint choose a good small-anchor cell and a good big-anchor cell for every $j$, and let $a_j$ be the sum of their two indices. We shall choose a prime group $K_j$ of logarithmic target $T_j$ to be removed at step $j$, and a filler group of target $T_F$. At step $j$, the part to be copied will consist of $2^(j - 1)$ copies of the selected word, one group of each future pivot type, and the two fresh anchors. We require its logarithmic size to exceed $T_j$ by $Delta_j$. The filler then makes the full product in the initial squared expression have logarithmic size $log X + Delta_0$, as needed for Poisson summation. These requirements give the backwards definitions
  $ T_j = 2^(j - 1) J + sum_(ell > j) T_ell + a_j - Delta_j \, #h(2em) T_F = frac(log X + Delta_0, 2) - J - sum_(j = 1)^k \( T_j + a_j \) . $
  They are positive and, for all sufficiently large $L$,
  $ c_(*) thin 2^k tau lt.eq T_j \, T_F lt.eq 600 thin 4^k tau $
  with an absolute $c_(*) > 0$. To check this, put $c_j = 2^(j - 1) J + a_j - Delta_j$. The backwards recurrence gives
  $ sum_j T_j = sum_j 2^(j - 1) c_j . $
  Here $a_j lt.eq 4 tau$ eventually and $Delta_j = o_k \( tau \)$; the contribution of $J$ is $\( 4^k - 1 \) J \/ 3$, while the anchor contribution is $O \( 2^k tau \)$. These estimates prove the bounds on the $T_j$, and the large coefficient $10^3$ proves the bounds on $T_F$.
  For any such target $T$, the interval
  $ \[ log T - 2 epsilon.alt k \, log T - epsilon.alt k \] $
  lies inside the late block when $K_0$ is large. It contains a rich unit shell. The primes of that shell obey $log p lt.eq T e^(- epsilon.alt k) < \( log X \) \/ 4$, again by increasing $K_0$; hence this shell was among the simultaneous endpoint tests above.
  We record why the good cells in that shell can realize the target to bounded accuracy. Let their index set be $I subset \[ b \, e b \]$, with $\| I \| gt.eq c' b$, and write
  $ h_(-) = min I \, quad h_(+) = max I \, quad s = h_(+) - h_(-) \, quad g = gcd \( I - h_(-) \) . $
  Then $s gt.double b$ and $g lt.double 1$. Let $cal(U)$ be the set $\( I - h_(-) \) \/ g$, reduced modulo $s \/ g$. It contains zero, generates the group, and has density bounded below. A bounded number $r_0$ of its sums covers that group. For completeness, Kneser’s sumset theorem #cite(label("Kneser1953")), in the form of #cite(label("DeVos")) Theorem 1, gives, for the stabilizer $H$ of an $r_0$-fold sumset,
  $ \| r_0 cal(U) \| gt.eq r_0 \| cal(U) + H \| - \( r_0 - 1 \) \| H \| . $
  If $H$ is proper, the generating set $cal(U)$ meets at least two $H$-cosets, so the right side is at least $r_0 \| cal(U) \| \/ 2$. For sufficiently large fixed $r_0$ this is impossible in the ambient group. Thus the sumset is the whole group. Appending zero and endpoint summands now shows that $n$ sums of $I - h_(-)$ cover every multiple of $g$ in $\[ r_0 s \, \( n - r_0 \) s \]$. Choose $n$ to be the integer nearest $T \/ \( \( h_(-) + h_(+) \) \/ 2 \)$. Since the shell lies in the preceding target interval,
  $ c'' e^(epsilon.alt k) lt.eq n lt.eq C e^(2 epsilon.alt k) . $
  For large $K_0$, the target lies in the interior interval just described. Rounding to the appropriate residue class modulo $g$ therefore gives an ordered list of $n$ good cell indices with sum $T + O \( 1 \)$.
  Use such lists for every pivot target $T_j$ and the filler target $T_F$. The total number $n_c$ of cell labels, including the anchors, satisfies
  $ n_c lt.eq n_max lt.double k e^(2 epsilon.alt k) . $
  Every index has at most $exp \( C L \)$ possibilities. Fixing all lengths, ordered lists, and anchor choices by pigeonhole costs at most
  $ exp \( C n_max L + O_k \( 1 \) \) . $
  Since $n_max \/ z lt.double k e^(- epsilon.alt k) arrow.r 0$, this is absorbed by $exp \( C m \)$, with a leading constant independent of $k \, B_D$. The endpoint dependence of the targets causes no loss beyond this pigeonhole: every eligible rich shell had already been tested at every typical endpoint.
  Fix a real nonnegative Schwartz function $psi$, bounded below by a positive constant on $\[ 0 \, 1 \]$, with smooth compactly supported Fourier transform. Such a function is obtained by squaring the real inverse Fourier transform of a smooth even nonnegative bump sufficiently concentrated near zero. For a selected cell write $R_h \( n \) = bb(E)_(p in cal(E)_h) f_p \( n \)$. The selected endpoints give the positive statistic
  #[#set math.equation(numbering: n => "(4.3)")
   $ I_(*) = sum_(n in bb(Z)) psi \( n \/ X \) \| G_J \( n \) \|^2 product_h \| R_h \( n \) \|^2 gt.eq sqrt(X) thin e^(- C m) \, $ <eq:src18>]
  where cell labels occur with their selected multiplicities. Its expansion uses an independent positive and conjugate copy of every role. For the formal product $M$ of all prime labels, with multiplicity, the bins and target relations give
  $ log M = log X + Delta_0 + O_k \( 1 \) . $
  We may discard tuples with repeated primes. A repeated tuple has actual period at most $M \/ p_min$, and $p_min gt.eq exp \( e^(alpha L) \)$. Thus its period is much less than $X$; bandlimited Poisson leaves only its complete residue mean. That mean vanishes if a prime occurs just once, because its character is nonprincipal. For an all-multiple tuple, the absolute contribution before its prior is $O \( X \)$. Its point weight is at most
  $ M^(- 1) L^(- 2 m) exp \( C m + O_k \( 1 \) \) . $
  Here the bulk priors supply $L^(- 2 m)$; the cell normalizations cost at most $exp \( C n_c L \)$, and the top normalizations cost a bounded factor per top label. Extract
  $ M^(- 1 \/ 2) lt.eq X^(- 1 \/ 2) e^(- Delta_0 \/ 2 + O_k \( 1 \)) . $
  There are $b_(*) = 2 m + O_k \( 1 \)$ positions. If there are $d lt.eq b_(*) \/ 2$ distinct primes, summing the remaining $M^(- 1 \/ 2)$ costs at most
  $ sum_(d lt.eq b_(*) \/ 2) frac(d^(b_(*)) \( C L \)^d, d !) lt.eq b_(*)^(b_(*)) e^(C L) \; $
  each distinct prime contributes at least a factor $1 \/ p$. The total repeated-prime error is therefore at most
  $ sqrt(X) exp #h(-0.16667em) (- Delta_0 / 2 + \( C + 2 log z \) m + o_k \( m \)) . $
  Choose $B_D$ sufficiently large. After Poisson summation on the distinct contribution and division by $sqrt(X)$, we obtain an amplitude $eta_0$ with
  #[#set math.equation(numbering: n => "(4.4)")
   $ \| eta_0 \| gt.eq e^(- B_0 m) \, $ <eq:src19>]
  where $B_0$ is bounded independently of $B_D \, k$.
  === Templates and the transfer identity <templates-and-the-transfer-identity>
  The level-zero list consists of both copies of all selected roles. Mark the positive word and each positive pivot group $K_j$ active. Reserve the two positive anchors for each step $j$. Negative copies and unused roles, including the filler, stay outside. Initially regard a pivot group as one atom whose constituents are its ordered prime slots. Retain its internal distinctness indicator in its tuple prior, without normalization. All other atoms are single prime slots. Pairwise coprimality of atoms imposes the remaining distinctness conditions. Every copied atom receives new independent priors with the same internal restrictions; all priors are probability or subprobability measures.
  At step $j$, partition the current list $cal(I)_(j - 1)$ into $P union.sq H union.sq Y$. Here $P$ is the unique active atom of type $K_j$; $H$ consists of all active words, the unique active atom of each future type $K_ell$, $ell > j$, and the two fresh anchors for step $j$; $Y$ is the remainder. The letters $P \, H \, Y$ also denote the corresponding integer products. Replace this list by
  $ cal(I)_j = H^(+) union.sq H^(-) union.sq Y . $
  Both copies of every active word remain active. For each future pivot retain only its positive copy as active; its other copy becomes outside. Both copies of the fresh anchors become outside. Thus immediately before step $j$ there are $r = 2^(j - 1)$ active words, and on their bin supports
  #[#set math.equation(numbering: n => "(4.5)")
   $ log P = T_j + O_k \( 1 \) \, #h(2em) log H = T_j + Delta_j + O_k \( 1 \) . $ <eq:src20>]
  For a prime slot $i$, let $p_i$ be its assigned prime and let $lambda_i$ be $chi^(\( p_i \))$ or its inverse according to the original positive or conjugate role. This choice is copied unchanged, including into a negative transfer copy. For a pairwise distinct list $cal(I)$, with prime product $M_(cal(I))$, define
  $ A_(cal(I)) \( v \) = product_(i in cal(I)) e_(p_i) #h(-0.16667em) (t_(p_i) v overline(M_(cal(I)) \/ p_i)) . $
  The bar denotes inversion in $bb(F)_(p_i)$. Every term will have phase of the form
  #[#set math.equation(numbering: n => "(4.6)")
   $ Theta = A_(cal(I)) \( v \) product_i nu_i product_i product_(h eq.not i) lambda_i \( p_h \)^(b_(i h)) . $ <eq:src21>]
  When all frequency parameters are fixed, $nu_i$ is a bounded unary function of the prime in its role; the exponents $b_(i h)$ are determined by the template. This expression is used only on coprime support.
  At level zero all $b_(i h) = 1$, and $nu_i = kappa_i lambda_i \( v \)^(- 1)$, where $\| kappa_i \| = 1$. Indeed, the local positive Gauss transform at $v overline(M_(cal(I)) \/ p_i)$ contributes its normalized Gauss sum and role multiplier, the translation factor above, and $lambda_i \( v \)^(- 1) lambda_i \( M_(cal(I)) \/ p_i \)$. This is exactly the claimed graph phase. The zero frequency vanishes. The remaining weight $W_0$ is the product of the word bin indicators and
  $ \( X \/ M \)^(1 \/ 2) hat(psi) \( v X \/ M \) \, #h(2em) 0 < \| v \| lt.eq V_0 \, $
  together with indicators of pairwise coprime atoms, $\( v \, M \) = 1$, and a fixed covering interval for $log M = log X + Delta_0 + O_k \( 1 \)$. The compact Fourier support fits inside $V_0$ for large $L$. Thus $eta_0 = bb(E)_(cal(I)_0) sum_v W_0 Theta_0$. The nonphase weight sees each active pivot only through its total product. Its internal tuple prior remains outside that weight.
  At level $l$, the amplitude is an expectation over $cal(I)_l$ and a sum of terms $W_l Theta_l$ over binary frequency histories, with root $0 < \| v \| lt.eq V_l$. The erased pivot at every internal node is specified by the substitution below. The following properties are maintained:
  + The weight and its support depend on current active pivots only through their totals; all active word bins hold. Current atoms are pairwise coprime and are units modulo the absolute root frequency.
  + For a slot in an active word or active pivot, called regular,
    $ b_(i h) = epsilon_i quad \( h eq.not i \) \, #h(2em) nu_i = kappa_i lambda_i \( v \)^(- epsilon_i) \, $
    where $epsilon_i in { 1 \, - 1 }$ is the product of its transfer copy signs. The multiplier $kappa_i$ depends only on the role, path, and its prime, not on any frequency.
  + Each incoming row is constant on the constituent targets of any active pivot atom.
  Consider step $j = l + 1$. Insert into $W_l$ the range indicators (4.5) with fixed covering constants, and require that the pivot be a unit modulo every frequency in its history. These do not change the actual expectation: all such frequencies are smaller than the smallest actual prime. Group terms by $u = v \/ H med \( mod med P \)$. For a pivot constituent $p_i$, its outgoing row and unary give
  $ kappa_i lambda_i #h(-0.16667em) (\( P \/ p_i \) Y H \/ v)^(epsilon_i) . $
  Together with its additive factor this depends only on $u \, Y$, and the pivot tuple. It is bounded by 1 in modulus. Remove all these pivot factors, and call the remaining sum and average $B_u \( P \, Y \)$. The common-column property and the weight property show that $B_u$ depends on the pivot tuple only through its total $P$. Cauchy–Schwarz first on the outer priors and then on the residues gives
  #[#set math.equation(numbering: n => "(4.7)")
   $ \| eta_l \|^2 lt.eq bb(E)_(Y \, K_j) P sum_(u med mod med P) \| B_u \( P \, Y \) \|^2 lt.eq e^(d_j) bb(E)_Y sum_P sum_(u med mod med P) \| B_u \( P \, Y \) \|^2 . $ <eq:src22>]
  The final sum is over all positive integers in the first range of (4.5). If $n_j$ is the number of constituents of $K_j$, its total has point mass at most $e^(d_j) \/ P$, where
  $ d_j = C n_j L + O_k \( 1 \) . $
  This follows from the cell mass bounds, with the bounded-for-$k$ ordering multiplicity supplied by unique factorization. On extending $P$, retain its total-product coprimality and weight conditions but no internal tuple-prior condition. No character on the extended integer $P$ is needed: its outgoing character rows have already been removed.
  Expand the square with two copies $H_L \, H_R$ of $H$, and previous root frequencies $v \, w$. Set aside the diagonal $v H_R = w H_L$. On the complement the common-residue condition is equivalent to
  #[#set math.equation(numbering: n => "(4.8)")
   $ P = frac(v H_R - w H_L, s) \, #h(2em) 0 < \| s \| lt.eq V_j \, $ <eq:src23>]
  with the indicator that $P$ is a positive integer in range. The bound on $s$ follows from $E_(j - 1) + Delta_j + O_k \( 1 \) < E_j$. A prime common to $H_L \, H_R$ would divide $s$, since it is coprime to $P$, which is impossible by the frequency bound. The inherited supports separate either branch from $Y$. All output primes exceed $V_j$, so they are units modulo the nonzero $s$. Hence the new output atoms are pairwise coprime and units modulo $s$. Let $W_j$ be the product of the left weight and the conjugate right weight, with these and all inherited indicators and with the substitution (4.8).
  The additive phases become $A_(cal(I)_j) \( s \)$. At a left-slot prime use $v \/ P = s \/ H_R$, at a right-slot prime use $- w \/ P = s \/ H_L$, and at a shared outside prime use
  $ frac(v, P H_L) - frac(w, P H_R) = frac(s, H_L H_R) . $
  These identities are taken modulo the relevant actual prime, where all denominators are units. Write $b_(i P)$ for the common incoming exponent into the pivot. For $t \, u' in { + 1 \, - 1 }$, the new graph is
  #[#set math.equation(numbering: n => "(4.9)")
   $ b_(i^t h^(u'))^(upright("new")) & = cases(delim: "{", t b_(i h) \, & t = u' \, med i eq.not h \,, t b_(i P) \, & t eq.not u' \,)\
b_(i^t y)^(upright("new")) & = t b_(i y) \, #h(2em) b_(y i^t)^(upright("new")) = t b_(y i) \, #h(2em) b_(y y')^(upright("new")) = 0 quad \( y eq.not y' \) \, $ <eq:src24>]
  where $i \, h in H$ and $y \, y' in Y$. Indeed $P = v H_R \/ s$ at a left prime and $P = - w H_L \/ s$ at a right prime. Substituting these into the incoming pivot factor gives the cross-copy rows above. The left unary acquires $lambda_i \( v \/ s \)^(b_(i P))$, and the right unary acquires $lambda_i \( - w \/ s \)^(- b_(i P))$ after conjugation. Shared outside rows cancel on other shared outside slots; their unary factors combine. For a regular slot $b_(i P) = epsilon_i$, so the old frequency power cancels and leaves $lambda_i \( s \)^(- t epsilon_i)$, with any sign multiplier absorbed in $kappa_i$. All three invariants follow. Future active atoms are copied together, so they retain common incoming columns and total-product dependence. Thus the off-diagonal part of the extended sum in (4.7), before its factor $e^(d_j)$, is precisely the next amplitude $eta_j$.
  === Frequency histories and their square weights <frequency-histories-and-their-square-weights>
  Unroll a level-$l$ term from its root. At a node of step $j$, the output slots are $Y \, H_L \, H_R$. Each child keeps $Y$ and one copy of $H$, and inserts the pivot integer (4.8). Inserted ancestor pivots may occur in later substitutions. Every newly inserted pivot is required to be coprime to every frequency below that node. All inherited supports and ranges are evaluated recursively. We also use the same histories with one current active pivot replaced by a fixed external integer, after its outgoing phase has been removed as in (4.7).
  For a fixed top list assignment, including this external version, a given root frequency has at most one valid history. At the top node compare two possibilities $\( v \, w \, P \)$ and $\( v' \, w' \, P' \)$. The unit conditions on the output products give $s divides v w' - v' w$, while
  $ H_R \( v w' - v' w \) = s \( P w' - P' w \) . $
  Consequently,
  $ \| v w' - v' w \| lt.eq \| s \| frac(P \| w' \| + P' \| w \|, H_R) < \| s \| \, $
  because $Delta_j - E_(j - 1) gt.double sqrt(m)$. The determinant vanishes. The pairs and positive pivots are proportional. In lowest terms the proportionality numerator and denominator divide the corresponding frequency and pivot simultaneously, so the required coprimalities force their ratio to be 1. This fixes the child frequencies and child lists; recursion proves uniqueness.
  We claim, with $r = 2^l$, that
  #[#set math.equation(numbering: n => "(4.10)")
   $ bb(E) sum_(upright("histories")) \| W_l \|^2 lt.eq exp \( C r m + o_k \( m \) \) . $ <eq:src25>]
  This includes the fixed-external version, averaged over its other actual priors. Each history has $r$ bottom weights, and the explicit level-zero product range gives
  $ \| W_l \|^2 lt.eq exp \( - r Delta_0 + O_k \( 1 \) \) . $
  After using this pointwise bound, we may discard the word-bin, archimedean range, and internal distinctness indicators when bounding the remaining nonnegative support probability. We retain the integrality and frequency-unit conditions used below. There is one independent active word at every bottom leaf. Fix all frequencies and all actual labels except one chosen bulk prime in each such word. Let $R$ be the product of the absolute node and leaf frequencies, and put $Q = R^(k + 2)$. Thus $Q = exp \( O_k \( m \) \)$. The joint residues of the chosen primes modulo $Q$ are dominated, for upper bounds by residue conditions, by independent uniform units at a cost $exp \( C r L \)$. To see this for one prime, its prior has point weight $O \( 1 \/ p \)$. In a unit residue class modulo $Q$, the sum of $1 \/ n$ over each dyadic interval in its range is $O \( 1 \/ Q \)$, since all these integers are much larger than $Q$. There are at most $exp \( C L \)$ such intervals. The resulting upper bound $exp \( C L \) \/ Q$ is no larger than $exp \( C L \)$ times the uniform unit mass $1 \/ phi \( Q \)$. Independence proves the joint assertion.
  Under these uniform unit priors, expose first the product of all chosen variables, then the left-child product at each split, proceeding downwards. Given the parent product, the left product is uniform on the unit group and determines the right product; this is the elementary counting property of independent uniform group variables. At a node write
  $ H_L = C_L X_L \, #h(2em) H_R = C_R X_R \, $
  where $X_L \, X_R$ are the products of the chosen variables in the two child subtrees. The constants can include inserted ancestor pivots, but their needed residues are known from previously exposed splits. Every chosen word remains in an $H$-branch through the forward transfers, so a later split refines an aggregate product already exposed at each ancestor. The recurrence (4.8) therefore uses the two current child totals and previously known integers. After $h$ reconstructed divisions, those integers remain known modulo $R^(k + 2 - h)$. Indeed, if $s divides R$, a numerator known modulo $R^a$ determines its integral quotient by $s$ modulo $R^(a - 1)$. Products of known residues lose no further precision. There are at most $k$ divisions on a branch, leaving enough precision for every frequency divisibility and unit condition. A fixed external pivot is known from the outset and consumes no precision.
  On valid support $C_L \, C_R$ are units modulo $\| s \|$. Given their residues and $X_L X_R$, integrality requires
  $ v C_R X_R equiv w C_L X_L med \( mod med \| s \| \) . $
  It is impossible unless $v \, w$ have the same gcd with $s$. In the soluble case let $g = \( v \, w \, s \)$. Dividing by $g$ reduces the congruence to a unit square-root equation for $X_L$ modulo $\| s \| \/ g$. The number of unit roots is at most $2^(omega \( \| s \| \/ g \) + 1)$; the elementary divisor and totient bounds for integers at most $exp \( O_k \( m \) \)$ consequently give conditional probability at most
  $ exp \( o_k \( m \) \) frac(g, \| s \|) . $
  The sequential exposure gives the product of these bounds over the nodes. For fixed child frequencies,
  $ sum_(0 < \| s \| lt.eq V_j) frac(\( v \, w \, s \), \| s \|) lt.eq 2 sum_(d divides \( v \, w \)) med sum_(h lt.eq V_j \/ d) 1 / h = exp \( o_k \( m \) \) . $
  Sum the internal frequencies from the root down, always using this bound with their child values fixed. The remaining leaf choices number at most $\( 2 V_0 \)^r = exp \( r Delta_0 + o_k \( m \) \)$. They cancel the preceding square-weight factor. The remaining cost $exp \( C r L + o_k \( m \) \)$ is at most the right side of (4.10). In particular the leading constant $C$ can be independent of $k$.
  === Cancellation for a one-sided character interaction <cancellation-for-a-one-sided-character-interaction>
  We need a uniform comparison estimate in two settings:
  + two final-list terms related by permutations of bulk slots, with the same root frequency;
  + two terms on the diagonal of the square in (4.7), with a fixed external $P$, common root $v = w$, and a fixed matching identifying the constituent prime assignments of $H_L \, H_R$, while $Y$ is shared.
  Fix every frequency in both histories and all the matching or permutation data. In case (b), sample actual variables only on $H_L \, Y$; the point weight for the matched counterpart will be factored out below. The phases at actual primes have the same translating centers, independently of their slots. Their additive factors therefore cancel in the quotient: the total prime product and root frequency are unchanged. On the diagonal the omitted pivot factors are omitted on both sides, with the same fixed total $P$.
  Suppose the quotient graph has, between a shorter prime $q$ and a longer prime $p$, a factor $xi_q \( p \)$, where $xi_q$ is a nonprincipal character modulo $q$, and has no reverse character factor between this pair. Suppose also that their $u = log log$ ranges have gap $gt.double L$. We claim that its weighted expectation is
  #[#set math.equation(numbering: n => "(4.11)")
   $ O #h(-0.16667em) (exp \( - c_2 e^(alpha L) \)) $ <eq:characters-one-sided>]
  for some $c_2 > 0$, uniformly in the fixed data. Bounded unary restrictions from counterpart priors are permitted, as is the factor $e^(T_j + Delta_j) \/ H_L$ on the range (4.5). We prove the assertion with the support conditions included.
  First consider large coprimalities inside the histories. At the top, the actual atoms must be pairwise coprime, internally distinct where required, and coprime to the external integer when one is present. At a lower node, pairwise coprime output atoms and (4.8) make the inserted pivot automatically coprime to each atom in $H_L \, H_R$. Indeed, a common divisor with one side would divide its opposite product times $v$ or $w$; the opposite coprimality and frequency-unit conditions exclude this. For actual primes the latter conditions follow from their sizes, and for previously inserted pivots they are retained frequency support conditions.
  An inserted ancestor pivot always occupies an active pivot position. In the earlier forward transfer its designated active clone was in $H$, so reversing that transfer places it in one of $H_L \, H_R$, never in $Y$. This remains true at every earlier step and also for a fixed external pivot. Thus the slots in $Y$ at any node are actual prime slots. Apart from the top conditions, the only large coprimalities not already automatic are between a newly reconstructed pivot and actual primes in its $Y$.
  These remaining checks can be removed at a cost (4.11), or the valid support is empty. To prove this, express every reconstructed integer by repeated substitution of (4.8). Its numerator, after clearing denominators, is a polynomial in the independent actual prime variables; every denominator is a product of small frequencies. In the matched setting, an identified prime is represented by one variable, not by independent variables for its two occurrences. The independent sampling variables are precisely those of $H_L \, Y$, with their original priors. For fixed $k$, the degrees are bounded by a polynomial in $m$, and the logarithms of the absolute numerator values throughout the ranges are at most $exp \( O_k \( L \) \)$. The same bound holds after setting a variable to zero. These facts follow by induction through the fixed-depth additions and products. A fixed external integer satisfies $log P lt.eq exp \( O_k \( L \) \)$, so it respects the same bounds.
  For a required coprimality to a prime variable $x$, set $x = 0$ in the numerator polynomial. If the resulting polynomial is identically zero, the numerator is divisible by $x$ for every assignment. Its denominator is a unit modulo $x$, so the required coprimality fails identically; this history pair can be discarded. Otherwise, under independent sampling of the other actual primes, the probability that the resulting nonzero polynomial evaluates to zero is at most its degree times the largest point mass of any variable. This elementary bound follows inductively by viewing a nonzero polynomial as a univariate polynomial, excluding zeros of its leading coefficient, and using its degree bound on roots. The original independent priors dominate those with any internal tuple restrictions, and every actual-prime point mass is at most
  $ exp \( - c e^(alpha L) \) . $
  On a nonzero evaluation, there are at most $exp \( O_k \( L \) \)$ possible prime divisors $x$. Multiplying their number by the point-mass bound proves that this coprimality fails with negligible probability. The same point-mass and divisor argument handles actual collisions at the top and coprimality to the fixed external integer. A union bound covers the finitely many checks in both histories. The factors $exp \( "poly"_k \( m \) \)$ that can multiply these errors remain negligible compared with $exp \( c e^(alpha L) \)$.
  This removal is performed after the additive phases have canceled and the graph quotient has been written down. On the enlarged domain its multiplicative factors may use zero, or any bounded convention, at nonunits; the difference is supported on the exceptional assignments just bounded. There is therefore no need to extend an additive inverse through a failed coprimality.
  The remaining integrality and small-frequency gcd conditions are residue conditions modulo an integer
  $ Q_(*) = exp \( O_k \( m \) \) $
  whose prime factors divide the frequencies. One can take a sufficiently high fixed-for-$k$ power of their product: clearing the frequency denominators then determines all divisibilities and gcds from residues modulo $Q_(*)$. Every actual prime is coprime to $Q_(*)$. The other supports are polynomial inequalities after the same substitutions: product ranges, pivot ranges, positivity, and word bins. Fix all other variables and the short prime. On a dyadic interval for the long variable, split at the boundaries of these inequalities and at the critical points of the polynomial arguments of the smooth factors. Their degrees and their number are bounded by a polynomial in $m$ for fixed $k$; identically constant polynomials require no split. On each resulting interval the smooth arguments are monotone. The level-zero weights $\( X \/ M \)^(1 \/ 2) hat(psi) \( v X \/ M \)$, restricted to their stated $M$-ranges, have supremum and variation at most $exp \( "poly"_k \( m \) \)$, by smooth compact support of $hat(psi)$. Products of these weights, and the optional ratio $e^(T_j + Delta_j) \/ H_L$ on (4.5), have the same kind of bound. Thus, in every allowed residue class, the full remaining archimedean weight has supremum and total variation at most $exp \( "poly"_k \( m \) \)$. Individual prime-set membership, cell restrictions, and all other irregular unary factors can stay in bounded unary functions.
  After fixing the other variables the average consequently has the form
  $ bb(E)_p bb(E)_q U \( p \) V \( q \) xi_q \( p \) W \( p \, q \) \, #h(2em) \| U \| \, \| V \| lt.eq 1 \, $
  with the residue restrictions included in $W$. Cauchy–Schwarz removes $U \( p \)$. Its resulting nonnegative square average can be extended from the long-prime prior to integers using its point bound $e^(C L) \/ p$. Expand the square in $q \, q'$. The terms $q = q'$ cost at most the largest short-prime point mass times $exp \( "poly"_k \( m \) \)$. For $q eq.not q'$, the function $xi_q \( n \) overline(xi_(q') \( n \))$ has mean zero modulo $q q'$, since both constituent characters are nonprincipal. It also has mean zero along a progression of step $Q_(*)$, because $Q_(*)$ is coprime to $q q'$. On a dyadic interval around $b$, complete-period cancellation and partial summation therefore bound the sum, including all residue classes, by
  $ exp \( "poly"_k \( m \) \) frac(Q_(*) q q', b) . $
  For example, in one residue class the incomplete character sum has absolute value at most $q q'$; multiplying by the variation of $W \( n \, q \) overline(W \( n \, q' \)) \/ n$ gives the bound without $Q_(*)$, and summing the classes gives the displayed expression. The gap in $u$-ranges means that the smallest long $log b$ exceeds the largest short $log q \, log q'$ by a factor $exp \( Omega \( L \) \)$. Hence this bound is exponentially smaller than $exp \( - c e^(alpha L) \)$. There are only $exp \( O \( L \) \)$ dyadic intervals. Taking the square root and absorbing the preceding coprimality errors proves (4.11). Its strength also permits summing over all fixed-depth frequency histories and matchings, whose number is at most $exp \( "poly"_k \( m \) \)$.
  === Anchor codes and the diagonal bound <anchor-codes-and-the-diagonal-bound>
  An active bulk slot at level $l$ has a path $t = \( t_1 \, dots.h \, t_l \) in { + 1 \, - 1 }^l$. Write $e_0 = 1$, $e_j = product_(h lt.eq j) t_h$, and $epsilon \( t \) = e_l$. For an anchor clone $y$ created by one of the first $l$ steps, define its code coordinate at the slot by
  $ c_y \( t \) = b_(y i) \/ epsilon \( t \) . $
  These coordinates depend on the path, not on the bulk position within a word. Before step $j$, a fresh anchor $a$ has
  $ b_(a i) = e_(j - 1) \, #h(2em) b_(a P) = alpha_j \, $
  where $alpha_j$ is the common parity of the active pivot. Both coefficients initially equal 1, and until its reserved step the anchor stays outside; the update (4.9) multiplies an incoming coefficient by the copy sign of its target. At its step, the ordered pair from the positive and negative anchor clones is therefore
  #[#set math.equation(numbering: n => "(4.12)")
   $ #scale(x: 120%, y: 120%)[\(] c_(a^(+)) \( t \) \, c_(a^(-)) \( t \) #scale(x: 120%, y: 120%)[\)] = cases(delim: "{", \( 1 \, - alpha_j \/ e_(j - 1) \) \, & t_j = + 1 \,, \( - alpha_j \/ e_(j - 1) \, 1 \) \, & t_j = - 1 .) $ <eq:characters-anchor-pair>]
  The formula is identical for the small and big anchors. After their creation the anchors stay outside. Later bulk copying multiplies both $b_(y i)$ and $epsilon_i$ by the same sign, so each coordinate is thereafter fixed.
  The pair in (4.12) is $\( 1 \, 1 \)$ exactly when $e_(j - 1) = - alpha_j$; either mixed pair corresponds to $e_(j - 1) = alpha_j$. It therefore determines the incoming parity. All anchor pairs together determine $e_0 \, dots.h \, e_(l - 1)$, hence $t_1 \, dots.h \, t_(l - 1)$. At most the last sign remains undetermined. Thus any code occurs on at most two paths, and code together with final parity determines the entire path.
  Consider the diagonal at step $j$, put $l = j - 1$, and write $r = 2^l$. Since every prime factor of $H_L \, H_R$ exceeds the frequency bounds, the equation $v H_R = w H_L$ forces
  $ H_L = H_R \, #h(2em) v = w . $
  The products are squarefree on each branch, so equality gives a unique matching of their constituent slots. Sum by these matchings. Bulk slots can match only bulk slots because their size region is separated from every other role in $H$. Their original orientations and character rules coincide.
  Suppose a matching changes a bulk code. Choose an earlier anchor coordinate at which the old and new codes differ. This anchor is in the shared list $Y$. Write the parities as $epsilon \, epsilon'$ and the two coordinates as $c \, c'$. They are signs, so $c' = - c$. The net exponents in the phase quotient from anchor to bulk and from bulk to anchor are respectively
  $ epsilon c - epsilon' c' \, #h(2em) epsilon - epsilon' . $
  If the parities agree, these are $\( plus.minus 2 \, 0 \)$; use the corresponding small anchor. If the parities differ, they are $\( 0 \, plus.minus 2 \)$; use the corresponding big anchor. The small and big anchors have identical code patterns, so both choices retain the required differing coordinate. In the first case the short modulus is the small-anchor prime, and in the second it is the bulk prime. In either case the surviving interaction is a one-sided square of a chosen character. It is nonprincipal because that character has order greater than 2. All other phase factors are unary once the other variables and histories are fixed, so (4.11) applies.
  The normalization preceding this application is important. For a fixed assignment on $H_L$, the point weight of the matched ordered counterpart is
  $ C_H / H_L $
  times its role and distinctness indicators, where
  $ C_H lt.eq L^(- r m) exp \( C r m + O_k \( 1 \) \) . $
  There are $r m$ bulk priors, $r$ top priors, and only $O \( n_c \)$ cell priors in $H$; the last contribute at most $exp \( C n_c L \)$, which is absorbed uniformly by the displayed bound. Before summing over the external integer $P$, extract
  $ C_H e^(- T_j - Delta_j) . $
  The remaining ratio $e^(T_j + Delta_j) \/ H_L$ is bounded on (4.5) and was included in the variation estimate. There are at most $exp \( T_j + O_k \( 1 \) \)$ possible $P$’s, canceling the large factor $e^(- T_j)$. Counterpart role membership is a bounded unary restriction after the matching; its internal coprimalities are handled by the cleanup already proved. Thus all code-changing matchings, all their histories, and the extended sum over $P$ have total negligible contribution. This order of normalization avoids multiplying a small uniform error by an unbalanced doubly exponential count of $P$’s.
  For code-preserving matchings there are at most $2 m$ counterparts for each bulk slot: at most two paths share its code and each contains $m$ bulk positions. There are only boundedly many other slots for fixed $k$. Consequently their number is at most
  $ \( 2 m \)^(r m) exp \( O_k \( 1 \) \) . $
  Fix $P$ and one such matching. For each common root frequency $v$, history uniqueness permits at most one valid history in either branch. Bound the phases absolutely and use
  $ 2 \| W_l W'_l \| lt.eq \| W_l \|^2 + \| W'_l \|^2 $
  on simultaneous support. In each term separately, bound the point weight of the other branch by
  $ C_H exp \( - T_j - Delta_j + O_k \( 1 \) \) \, $
  and retain the square branch’s own priors. Equation (4.10), including its fixed-external version, then bounds its frequency sum by $exp \( C r m + o_k \( m \) \)$. Summing over $P$ and the matchings, and using $m \/ L = z + o \( 1 \)$, bounds this part of the diagonal in the extended sum, before multiplication by $e^(d_j)$, by
  #[#set math.equation(numbering: n => "(4.13)")
   $ exp #h(-0.16667em) (- Delta_j + r m \( log z + C \) + o_k \( m \)) . $ <eq:src26>]
  We now specify the order of the constant choices and the amplitude induction. The construction of (4.3) fixed $B_0$ independently of $B_D \, k$. Choose $B_1 > B_0 + 2$. Choose $B_D$ large enough for the repeat bound and for (4.13) to be at most $1 / 2 e^(- d_j) e^(- 2 B_1 r m)$, after allowing the negligible code-changing error. This is possible uniformly in $k$: the main negative term in (4.13) is $- r m \( B_D + 20 log z \)$, and its positive term is only $r m \( log z + C \)$. Increase $K_0$ so that
  $ sum_(j = 1)^k d_j lt.eq C n_c L + O_k \( 1 \) < m $
  for large $L$; this follows from $n_c \/ z lt.double k e^(- epsilon.alt k)$. Whenever $\| eta_(j - 1) \| gt.eq e^(- B_1 r m)$, the diagonal bound and (4.7) give
  $ \| eta_j \| gt.eq 1 / 2 e^(- d_j) \| eta_(j - 1) \|^2 . $
  To see that the budget is preserved despite the additional factors, set $frak(a)_j = - 2^(- j) m^(- 1) log \| eta_j \|$. The recurrence gives
  $ frak(a)_j lt.eq B_0 + sum_(h = 1)^j frac(d_h + log 2, 2^h m) lt.eq B_0 + 1 + o_k \( 1 \) < B_1 . $
  Starting from (4.4), induction therefore proves
  #[#set math.equation(numbering: n => "(4.14)")
   $ \| eta_l \| gt.eq exp \( - B_1 thin 2^l m \) #h(2em) \( 0 lt.eq l lt.eq k \) . $ <eq:characters-amplitude-budget>]
  All vanishing errors here are taken only after $B_D \, k$ are fixed.
  === Final permutation comparison <final-permutation-comparison>
  At level $k$, put $r = 2^k$. For each of the $m$ bulk positions, independently permute its $r$ variables among paths of the same final parity. There are $r \/ 2$ paths of each parity, hence
  $ J_(*) = #scale(x: 120%, y: 120%)[\[] \( r \/ 2 \) !^2 #scale(x: 120%, y: 120%)[\]]^m $
  such reassignments. All bulk priors are identical and independent, so these permutations preserve the underlying measure. The word bins and other supports are part of the reassigned integrand; they have never conditioned the priors.
  Let $mu$ be the product of the actual priors and counting measure on $0 < \| s \| lt.eq V_k$, of total mass at most $2 V_k$. For a reassignment $pi$, let $Phi_pi$ be the corresponding sum over internal histories at this top assignment and root frequency. Prior invariance gives
  $ integral Phi_pi thin d mu = eta_k . $
  History uniqueness and (4.10) give
  $ parallel Phi_pi parallel_(L^2 \( mu \))^2 lt.eq exp \( C r m + o_k \( m \) \) . $
  For distinct $pi \, rho$, some actual bulk variable occupies different paths of the same final parity. Such paths have different anchor codes. A small anchor consequently gives a one-sided nonprincipal square-character interaction in their phase quotient. The additive phases cancel, since the same prime product, root frequency, and prime-dependent centers are used in both assignments. Equation (4.11), summed over the fixed-depth frequency data, yields
  $ \| chevron.l Phi_pi \, Phi_rho chevron.r \| lt.double exp \( - c_2 e^(alpha L) \) \, $
  after decreasing $c_2 > 0$ if necessary. Average the functions $Phi_pi$ and apply Cauchy–Schwarz against the constant function 1. This gives
  #[#set math.equation(numbering: n => "(4.15)")
   $ \| eta_k \|^2 lt.eq 2 V_k (frac(exp \( C r m + o_k \( m \) \), J_(*)) + O #h(-0.16667em) (exp \( - c_2 e^(alpha L) \))) . $ <eq:characters-final-comparison>]
  The factorial estimate and (4.2) imply
  $ log J_(*) gt.eq r m \( k log 2 - C \) \, #h(2em) log V_k = r m \( B_D + 20 log z \) + o_k \( m \) \, #h(2em) 20 log z = 60 epsilon.alt k . $
  Because $log 2 - 60 epsilon.alt > 0$, a sufficiently large $K_0$, chosen after $B_D \, B_1$, makes the first term on the right of (4.15) smaller than $exp \( - 2 B_1 r m \)$, with a fixed exponential margin. The second term, including its factor $V_k$, is smaller than $exp \( - C r m \)$ for every fixed $C$ as $L arrow.r oo$ at this fixed $k$. This contradicts (4.14), and proves Proposition 9. ◻
]

#thm([Corollary 4.2.])[
  #emph[Define 
$ F_p \( x \) = frac(upright(bold(1))_(S_p) \( x \) - sigma_p, sqrt(sigma_p \( 1 - sigma_p \))) \, #h(2em) g_p \( v \) = sqrt(p) thin bb(E)_(x in bb(F)_p) F_p \( x \) e_p \( - v x \) . $

 For every fixed $0 < alpha < beta$, outside a set of primes of harmonic mass $o \( L \)$ in $alpha L lt.eq log log p lt.eq beta L$, one has uniformly 
#[#set math.equation(numbering: n => "(4.16)")
 $ sigma_p = 1 / 2 + o \( 1 \) \, #h(2em) max_(a in bb(F)_p\
lambda med upright("multiplicative")) lr(|bb(E)_(v in bb(F)_p) g_p \( v \) lambda \( v \) e_p \( a v \)|) = o \( 1 \) . $ <eq:src27>]

]
] <cor:mixed-flatness>

#proof[
  Apply Lemma 6 at, for example, $log X = exp \( \( beta + 1 \) L \)$. Its prime cutoff contains the whole band. The nonnegative imbalance term in (2.7), together with $log p gt.eq e^(alpha L)$, gives
  $ sum_(alpha L lt.eq log log p lt.eq beta L) 1 / p (1 / sigma_p + frac(1, 1 - sigma_p) - 4) lt.double L e^(- alpha L) . $
  Since the summand in parentheses controls $\( sigma_p - 1 / 2 \)^2$, this proves balance in harmonic probability.
  If $lambda$ is nonprincipal, the Gauss formula gives
  $ bb(E)_v g_p \( v \) lambda \( v \) e_p \( a v \) & = frac(tau \( lambda \), p^(3 \/ 2)) sum_x F_p \( x \) overline(lambda) \( a - x \)\
 & = frac(tau \( lambda \), sqrt(p)) thin overline(lambda) \( - 1 \) thin sigma_p / sqrt(sigma_p \( 1 - sigma_p \)) bb(E)_(x in S_p) overline(lambda) \( x - a \) . $
  The first two factors on the last line have modulus 1. The constant part of $F_p$ has vanished because the character is nonprincipal. For quadratic $lambda$, Proposition 7 and its harmonic-band consequence give a maximal translated bias tending to zero in harmonic probability. For order greater than 2, Proposition 9 gives the same conclusion, already with a maximum over the character. On the balanced primes the displayed scale factor is bounded.
  For the principal character, $g_p \( 0 \) = 0$, and additive inversion gives exactly
  $ bb(E)_v g_p \( v \) lambda \( v \) e_p \( a v \) = p^(- 1 \/ 2) F_p \( a \) . $
  This tends uniformly to zero on the balanced primes. Finally choose a positive threshold tending to zero sufficiently slowly in the balance and maximal-bias estimates. Markov’s inequality makes their combined exceptional harmonic mass $o \( L \)$, proving the asserted uniform formulation. ◻
]

== 5 A supply of nonsparse additive transforms <sec:supply>

We retain the sets $S_p$, their densities $sigma_p$, and the normalized functions $F_p \, g_p$ defined in Corollary 10. The normalizations give

$ sum_(x in bb(F)_p) \| F_p \( x \) \|^2 = p \, #h(2em) 1 / p sum_(v in bb(F)_p) \| g_p \( v \) \|^2 = 1 \, #h(2em) g_p \( 0 \) = 0 \, #h(2em) g_p \( - v \) = overline(g_p \( v \)) . $

The conclusion below is a separate consequence of the sieve estimates and prime coverage. It does not require the decorrelation assertion in (4.16). Write

$ gamma_p = 1 / p sum_(v in bb(F)_p) \| g_p \( v \) \| $

for the probability $L^1$ norm of the normalized additive transform.

#thm([Proposition 5.1.])[
  #emph[There is an absolute constant $delta_0 > 0$ such that, for all sufficiently large $L$, 
#[#set math.equation(numbering: n => "(5.1)")
 $ sum_(.05 L lt.eq log log p lt.eq .9 L\
1 \/ 3 lt.eq sigma_p lt.eq 2 \/ 3\
gamma_p gt.eq delta_0) 1 / p med gt.eq med .15 L . $ <eq:src28>]

]
] <prop:supply>

Suppose, to the contrary, that primes with small $gamma_p$ have large harmonic mass. We shall construct a nonnegative weight from their sparse Fourier spectra. A tensor estimate bounds its sum over pairs of summand elements, while a prime-distribution estimate evaluates its sum over large primes. Prime coverage forces a lower bound for the former sum, and the contraction furnished by the sparse spectra will make the bounds incompatible.

=== 5.1 A budget for centered tensor coordinates <a-budget-for-centered-tensor-coordinates>

Throughout this section we reset the large parameters by

$ log X = exp L \, #h(2em) R = sqrt(X) . $

Set

$ A_0 = A ∩ \( R + N_(*) \, X \] \, #h(2em) D_0 = D ∩ \[ - X \, - R - N_(*) \) \, #h(2em) m_A = \| A_0 \| \, quad m_D = \| D_0 \| . $

Both sets are nonempty for large $L$, by (2.4). For every prime $p lt.eq R$, their reductions are supported on $S_p$ and $T_p := S_p^c$, respectively. Write $kappa_p = \| T_p \| \/ \| S_p \| = \( 1 - sigma_p \) \/ sigma_p$.

Apply Lemma 6 at $Y = X \( log X \)^40$, using the uniform measures on its two full tails. By (2.4), their largest point masses are at most $\( log Y \)^4 \/ sqrt(Y)$ for large $Y$. The associated prime cutoff is $sqrt(Y) \/ \( log Y \)^5 > R$. Since $sigma_p^(- 1) + \( 1 - sigma_p \)^(- 1) - 4 = kappa_p + kappa_p^(- 1) - 2$, it follows that

#[#set math.equation(numbering: n => "(5.2)")
 $ sum_(p lt.eq R) \( kappa_p + kappa_p^(- 1) - 2 \) frac(log p, p) lt.double L \, #h(2em) sum_(p lt.eq R) frac(\| log kappa_p \|, p) lt.double sqrt(L) . $ <eq:src29>]

For the second assertion, use $\( log t \)^2 lt.eq t + t^(- 1) - 2$ for $t > 0$ and Cauchy–Schwarz:

$ sum_(p lt.eq R) frac(\| log kappa_p \|, p) lt.eq (sum_(p lt.eq R) frac(\( log kappa_p \)^2 log p, p))^(1 \/ 2) (sum_p frac(1, p log p))^(1 \/ 2) . $

The last prime sum converges.

Let $upright(bold(e))_x$ be the standard point vector in $bb(C)^(bb(F)_p)$. Let $Q_(S_p)$ be the orthogonal projection onto

$ cal(H)_(S_p) = {f in bb(C)^(bb(F)_p) : "supp" f subset.eq S_p \, med sum_x f \( x \) = 0} \, $

and define $Q_(T_p)$ and $cal(H)_(T_p)$ similarly. All these inner products use counting measure. For squarefree $t$ whose prime factors are at most $R$, put

$ B_A \( t \) = ∥1 / m_A sum_(a in A_0) ⨂_(p divides t) Q_(S_p) upright(bold(e))_(a med mod med p)∥^2 \, #h(2em) B_A \( 1 \) = 1 \, $

and define $B_D \( t \)$ with $D_0 \, T_p$.

The precise energy identity we need is

#[#set math.equation(numbering: n => "(5.3)")
 $ sum_(h med mod med q\
\( h \, q \) = 1) lr(|1 / m_A sum_(a in A_0) e_q \( h a \)|)^2 = sum_(t divides q) t B_A \( t \) product_(p divides q \/ t) kappa_p #h(2em) \( q lt.eq R \, med q med upright("squarefree") \) . $ <eq:supply-primitive-energy>]

Indeed, the Ramanujan kernel factors over the primes of $q$. For $x \, y in S_p$,

$ sum_(h in bb(F)_p^(*)) e_p \( h \( x - y \) \) = p upright(bold(1))_(x = y) - 1 = kappa_p + p chevron.l Q_(S_p) upright(bold(e))_x \, Q_(S_p) upright(bold(e))_y chevron.r . $

Expand the product of these identities and average over two independent uniform elements of $A_0$. The term with centered factors at precisely the primes of $t$ is the corresponding term on the right of (5.3). For $D_0$, the same identity holds with $kappa_p^(- 1)$. In particular all terms in both expansions are nonnegative.

Write

$ cal(B)_L = { p : .05 L lt.eq log log p lt.eq .9 L } . $

For each fixed $C_(*) > 0$, let $cal(T)_(C_(*))$ be the set of products of at most $C_(*) L$ distinct primes from $cal(B)_L$, including 1. We claim that

#[#set math.equation(numbering: n => "(5.4)")
 $ sum_(t in cal(T)_(C_(*))) B_A \( t \) lt.eq exp \( o \( L \) \) R / m_A \, #h(2em) sum_(t in cal(T)_(C_(*))) B_D \( t \) lt.eq exp \( o \( L \) \) R / m_D . $ <eq:src30>]

The error terms are uniform over $t$ for each fixed $C_(*)$. To prove this, note first that

$ log t lt.eq C_(*) L exp \( .9 L \) = o \( log X \) . $

Consequently $t < R$, and $U = R \/ t = X^(1 \/ 2 - o \( 1 \))$, uniformly. Among the positive integers $u lt.eq U$, the proportion failing to be squarefree is at most $sum_p p^(- 2) < 1$. The proportion not coprime to $t$ is at most

$ sum_(p divides t) 1 / p lt.eq C_(*) L exp #scale(x: 120%, y: 120%)[\(] - exp \( .05 L \) #scale(x: 120%, y: 120%)[\)] = o \( 1 \) . $

Also, by (5.2),

$ frac(1, floor.l U floor.r) sum_(u lt.eq U) sum_(p divides u) \| log kappa_p \| lt.double sum_(p lt.eq U) frac(\| log kappa_p \|, p) lt.double sqrt(L) . $

Markov’s inequality shows that only $O \( L^(- 1 \/ 4) \)$ of these integers have the inner sum exceeding $L^(3 \/ 4)$. Thus at least $c U$ integers, for an absolute $c > 0$ and all sufficiently large $L$, are squarefree, coprime to $t$, and satisfy

$ product_(p divides u) kappa_p gt.eq e^(- L^(3 \/ 4)) \, #h(2em) product_(p divides u) kappa_p^(- 1) gt.eq e^(- L^(3 \/ 4)) . $

The additive large sieve, applied to the probability measure on $A_0$, bounds the sum of the left side of (5.3) over squarefree $q lt.eq R$ by $C R^2 \/ m_A$. Interchanging the nonnegative terms on the right, and retaining only $t in cal(T)_(C_(*))$, gives

$ frac(C R^2, m_A) gt.eq sum_(t in cal(T)_(C_(*))) t B_A \( t \) sum_(u lt.eq R \/ t\
u med upright("squarefree")\
\( u \, t \) = 1) product_(p divides u) kappa_p gt.eq c R e^(- L^(3 \/ 4)) sum_(t in cal(T)_(C_(*))) B_A \( t \) . $

This proves the first assertion, and the reciprocal argument proves the second. Notice in particular the consequence of the $t = 1$ terms:

#[#set math.equation(numbering: n => "(5.5)")
 $ m_A \, m_D lt.eq R exp \( o \( L \) \) . $ <eq:supply-tail-size>]

=== 5.2 A contracting local kernel from a sparse transform <a-contracting-local-kernel-from-a-sparse-transform>

Fix a sufficiently small absolute $epsilon_0 > 0$; all conditions on its size below are absolute. Choose $0 < delta_0 lt.eq epsilon_0^2$. Suppose, for a sequence of arbitrarily large $L$, that (5.1) fails. Let

$ cal(S) = { p in cal(B)_L : 1 \/ 3 lt.eq sigma_p lt.eq 2 \/ 3 \, med gamma_p < delta_0 } \, #h(2em) H = sum_(p in cal(S)) 1 / p . $

Mertens’ theorem gives $sum_(p in cal(B)_L) 1 \/ p = .85 L + o \( 1 \)$. Outside the balanced range, $kappa_p + kappa_p^(- 1) - 2 gt.eq 1 \/ 2$, so (5.2) gives

$ sum_(p in cal(B)_L\
sigma_p in.not \[ 1 \/ 3 \, 2 \/ 3 \]) 1 / p lt.double L exp \( - .05 L \) = o \( 1 \) . $

It follows that $H gt.eq .70 L - o \( L \)$. We shall use the weaker bound

#[#set math.equation(numbering: n => "(5.6)")
 $ H gt.eq .68 L \, $ <eq:supply-sparse-mass>]

which remains valid after deleting any one prime of $cal(S)$.

For $p in cal(S)$ define

$ E_p = { v in bb(F)_p : \| g_p \( v \) \| > 1 } . $

This set is symmetric, avoids zero, and satisfies

#[#set math.equation(numbering: n => "(5.7)")
 $ \| E_p \| lt.eq epsilon_0 p \, #h(2em) sum_(v in E_p) \| g_p \( v \) \|^2 gt.eq \( 1 - epsilon_0^2 \) p . $ <eq:supply-concentrated-spectrum>]

Indeed, $\| E_p \| lt.eq sum_v \| g_p \( v \) \| < delta_0 p$; on its complement, $\| g_p \( v \) \|^2 lt.eq \| g_p \( v \) \|$. Put $t_0 = .85$ and

$ b_p \( x \) = t_0 / p sum_(h in E_p) e_p \( h x \) . $

These functions are real. Let $Pi_p$ be the orthogonal projection in $bb(C)^(bb(F)_p)$ onto the additive Fourier modes in $E_p$. The raw matrix with entries $b_p \( x - y \)$ is $t_0 Pi_p$. Furthermore,

$ Pi_p upright(bold(1)) = 0 \, #h(2em) parallel Pi_p F_p - F_p parallel lt.eq epsilon_0 sqrt(p) \, #h(2em) parallel Pi_p F_p parallel^2 gt.eq \( 1 - epsilon_0^2 \) p . $

The latter assertions follow by Parseval from (5.7).

Let $B_p^(\( 2 \))$ denote the raw matrix with entries $b_p \( x - y \)^2$. Its additive Fourier eigenvalue at $s$ is

$ t_0^2 / p \# { \( h \, h' \) in E_p^2 : h + h' = s } . $

Consequently

#[#set math.equation(numbering: n => "(5.8)")
 $ parallel B_p^(\( 2 \)) parallel lt.eq t_0^2 epsilon_0 \, #h(2em) \| b_p \( x \) \| lt.eq t_0 epsilon_0 . $ <eq:supply-square-kernel>]

For later use, if $e_p^(*) = \| E_p \| \/ p$, direct orthogonality gives

#[#set math.equation(numbering: n => "(5.9)")
 $ frac(1, p - 1) sum_(x eq.not 0) b_p \( x \) & = - frac(t_0 e_p^(*), p - 1) \,\
frac(1, p - 1) sum_(x eq.not 0) b_p \( x \)^2 & = frac(t_0^2 \( e_p^(*) - \( e_p^(*) \)^2 \), p - 1) . $ <eq:supply-unit-moments>]

In particular both unit means are $O \( epsilon_0 \/ p \)$.

For a kernel $h \( x - y \)$, let $h$ also denote its raw matrix, and set

$ u_S = \| S_p \|^(- 1) upright(bold(1))_(S_p) \, #h(2em) u_T = \| T_p \|^(- 1) upright(bold(1))_(T_p) . $

The map from $bb(C) xor cal(H)_(T_p)$ to $bb(C) xor cal(H)_(S_p)$ defined by

$ L_p \[ h \] = mat(delim: "(", u_S^(*) h u_T, u_S^(*) h Q_(T_p); Q_(S_p) h u_T, Q_(S_p) h Q_(T_p)) $

represents the kernel on the coordinates $\( 1 \, Q_(S_p) upright(bold(e))_x \)$, $\( 1 \, Q_(T_p) upright(bold(e))_y \)$. Indeed $u_S + Q_(S_p) upright(bold(e))_x = upright(bold(e))_x$ for $x in S_p$, and likewise on $T_p$. Define

$ L_p \( u \, v \) = L_p \[ \( 1 + u b_p \) \( 1 + v b_p \) \] \, #h(2em) U_p \( u \, v \) = frac(1, p - 1) sum_(x eq.not 0) \( 1 + u b_p \( x \) \) \( 1 + v b_p \( x \) \) . $

#thm([Lemma 5.2.])[
  #emph[For sufficiently small $epsilon_0$, uniformly for $p in cal(S)$ and complex $u \, v$ with $\| u \| \, \| v \| lt.eq 1.03$, 
$ parallel L_p \( u \, v \) parallel lt.eq 1 + C \/ p \, #h(2em) \| U_p \( u \, v \) \| lt.eq 1 + C \/ p . $

 For all sufficiently large such primes, 
#[#set math.equation(numbering: n => "(5.10)")
 $ parallel L_p \( 1 \, 1 \) parallel lt.eq U_p \( 1 \, 1 \) \( 1 - 1.6 \/ p \) \, #h(2em) U_p \( 1 \, 1 \) = 1 + O \( epsilon_0 \/ p \) . $ <eq:src31>]

 All constants are absolute.]
] <lem:supply-local-contraction>

#proof[
  The constant kernel 1 has coordinate matrix $1 & 0\
0 & 0$. In the full field,
  $ u_S = p^(- 1) \( upright(bold(1)) + sqrt(kappa_p) F_p \) \, #h(2em) u_T = p^(- 1) \( upright(bold(1)) - F_p \/ sqrt(kappa_p) \) . $
  Since $Pi_p$ is self-adjoint and kills constants,
  $ u_S^(*) Pi_p u_T = - p^(- 2) parallel Pi_p F_p parallel^2 . $
  Also $Q_(S_p) F_p = Q_(T_p) F_p = 0$. Hence the two side blocks arising from $Pi_p$ have norms $O \( epsilon_0 \/ sqrt(p) \)$; here and below balance bounds $kappa_p^(plus.minus 1 \/ 2)$ absolutely. Disjoint supports give $Q_(S_p) Q_(T_p) = 0$, and therefore
  $ parallel Q_(S_p) Pi_p Q_(T_p) parallel = parallel Q_(S_p) \( Pi_p - 1 / 2 I \) Q_(T_p) parallel lt.eq 1 / 2 . $
  Using (5.8) and $parallel u_S parallel \, parallel u_T parallel = O \( p^(- 1 \/ 2) \)$, the square kernel contributes $O \( epsilon_0 \/ p \)$ to the scalar block, $O \( epsilon_0 \/ sqrt(p) \)$ to the side blocks, and $O \( epsilon_0 \)$ to the lower-right block.
  Thus, if $s_p \( u \, v \)$ denotes the scalar block, then
  $ s_p \( u \, v \) = 1 + O \( 1 \/ p \) \, #h(2em) parallel upright("lower-right block") parallel lt.eq 1.03 t_0 + O \( epsilon_0 \) < .95 \, $
  uniformly on the stated polydisc, and both side blocks are $O \( epsilon_0 \/ sqrt(p) \)$. At $u = v = 1$ the scalar block is real and
  $ s_p \( 1 \, 1 \) = 1 - frac(2 t_0, p^2) parallel Pi_p F_p parallel^2 + O \( epsilon_0 \/ p \) lt.eq 1 - frac(1.7 - O \( epsilon_0 \), p) . $
  It is positive for large $p$.
  For completeness, bound the norm of a block matrix by the norm of the $2$-by-$2$ matrix of its block norms. In the present situation this is in turn bounded by the largest eigenvalue of
  $ mat(delim: "(", \| s_p \( u \, v \) \|, C epsilon_0 \/ sqrt(p); C epsilon_0 \/ sqrt(p), .95) . $
  Because $\| s_p \( u \, v \) \| = 1 + O \( 1 \/ p \)$, its gap from .95 is bounded below for large $p$. The eigenvalue formula consequently gives the upper bound
  $ \| s_p \( u \, v \) \| + O \( epsilon_0^2 \/ p \) . $
  This proves the asserted uniform norm estimate and the sharper bound $1 - \( 1.7 - O \( epsilon_0 \) \) \/ p$ at $\( 1 \, 1 \)$. Equation (5.9) gives the estimates for $U_p$. After decreasing the fixed $epsilon_0$, the last sharper bound is at most $U_p \( 1 \, 1 \) \( 1 - 1.6 \/ p \)$. In particular $U_p \( 1 \, 1 \) > 0$. ◻
]

=== 5.3 Tensoring and truncating the kernel <tensoring-and-truncating-the-kernel>

Choose a sufficiently large fixed $C_K > 0$, as specified below, and put $K = ceil.l C_K L ceil.r$. Define the nonnegative function

#[#set math.equation(numbering: n => "(5.11)")
 $ W \( n \) = (sum_(I subset.eq cal(S)\
\| I \| lt.eq K) product_(p in I) b_p \( n \))^2 . $ <eq:supply-weight>]

For a polynomial $P \( u \, v \)$, scalar- or operator-valued, let $cal(R)_K P$ be the sum of its Taylor coefficients with degree at most $K$ in each variable, evaluated at $\( 1 \, 1 \)$. Set

$ cal(L) \( u \, v \) = ⨂_(p in cal(S)) L_p \( u \, v \) \, #h(2em) cal(U) \( u \, v \) = product_(p in cal(S)) U_p \( u \, v \) \, #h(2em) U = cal(U) \( 1 \, 1 \) . $

The matrix $cal(R)_K cal(L)$ represents $W \( a - d \)$ between the full tensor coordinates. Similarly, $cal(R)_K cal(U)$ is the mean of $W$ on independent uniform unit residues.

Let $r_0 = 1.03$. Lemma 12 and $H lt.eq .85 L + o \( L \)$ bound the norms of both polynomials on $\| u \| \, \| v \| lt.eq r_0$ by $exp \( C_0 L \)$ with an absolute $C_0$. Cauchy’s coefficient formula applies to the finite-dimensional operator spaces as well as to scalars: if $P_(i j)$ is the coefficient of $u^i v^j$, then $parallel P_(i j) parallel lt.eq exp \( C_0 L \) r_0^(- i - j)$. Summing the geometric series over $i > K$ or $j > K$, we obtain

#[#set math.equation(numbering: n => "(5.12)")
 $ parallel cal(R)_K cal(L) - cal(L) \( 1 \, 1 \) parallel + \| cal(R)_K cal(U) - U \| lt.double exp \( C_0 L \) r_0^(- K) . $ <eq:supply-truncation-error>]

We also have $U = exp \( O \( epsilon_0 L \) \) > 0$, and

$ parallel cal(L) \( 1 \, 1 \) parallel lt.eq U product_(p in cal(S)) \( 1 - 1.6 \/ p \) lt.eq U e^(- 1.6 H) . $

Choose the fixed $C_K$ so large that the right side of (5.12) is $o \( U e^(- 1.6 H) \)$. For example, after bounding all the displayed absolute constants, one can ensure an error at most $e^(- 5 L)$.

There is no loss from the dimension of these tensor spaces. To see explicitly which coordinates are used, write

$ V_A = 1 / m_A sum_(a in A_0) ⨂_(p in cal(S)) \( 1 \, Q_(S_p) upright(bold(e))_(a med mod med p) \) \, #h(2em) V_D = 1 / m_D sum_(d in D_0) ⨂_(p in cal(S)) \( 1 \, Q_(T_p) upright(bold(e))_(d med mod med p) \) . $

The tensor space is the orthogonal direct sum of its centered subset modes. The squared norm of the mode indexed by the primes of $t$ is $B_A \( t \)$, respectively $B_D \( t \)$. Each monomial retained in $cal(R)_K cal(L)$ involves at most $2 K$ primes. At every other prime the local constant kernel has only a scalar block. Consequently $cal(R)_K cal(L) = P_A \( cal(R)_K cal(L) \) P_D$, where $P_A \, P_D$ retain only subset modes with at most $2 K$ centered factors. Equation (5.4), with any fixed $C_(*) > 2 C_K$, gives

$ parallel P_A V_A parallel^2 lt.eq e^(o \( L \)) R \/ m_A \, #h(2em) parallel P_D V_D parallel^2 lt.eq e^(o \( L \)) R \/ m_D . $

The kernel identity, the operator norm bound, and Cauchy–Schwarz now give

#[#set math.equation(numbering: n => "(5.13)")
 $ frac(1, m_A m_D) sum_(a in A_0) sum_(d in D_0) W \( a - d \) lt.eq U exp \( - 1.6 H + o \( L \) \) (frac(R^2, m_A m_D))^(1 \/ 2) . $ <eq:src32>]

Every assertion of this subsection is uniform under the deletion of one prime from $cal(S)$. We may therefore make such a deletion, and redefine the polynomials and $W$ accordingly, when addressing an exceptional character below.

=== 5.4 The prime mean of the weight <the-prime-mean-of-the-weight>

Set

#[#set math.equation(numbering: n => "(5.14)")
 $ log Q_b = 2 K exp \( .9 L \) . $ <eq:supply-character-range>]

Products of at most $2 K$ primes from $cal(S)$ are at most $Q_b$. We first record explicitly the analytic estimate used to average our weight.

#thm([Lemma 5.3.])[
  #emph[Fix $C_K > 0$, and let $phi.alt$ be a fixed smooth function compactly supported in $\( 1 \/ 2 \, 1 \)$. Among primitive characters of conductor at most $Q_b$, omit the possible exceptional character in the Landau–Page theorem. Include the conductor-$1$ principal character. For every fixed $D_1 > 0$, 
#[#set math.equation(numbering: n => "(5.15)")
 $ sum_chi^(upright("nonexc")) lr(|sum_(n gt.eq 1) Lambda \( n \) chi \( n \) phi.alt \( n \/ X \) - upright(bold(1))_(chi = 1) X integral_0^oo phi.alt \( t \) thin d t|) lt.double_(D_1 \, phi.alt \, C_K) X e^(- D_1 L) . $ <eq:src33>]

]
] <lem:supply-total-prime-error>

#proof[
  We give the uniform details because the sum in (5.15) is unweighted over the primitive characters. Put $Q = Q_b$, $T = Q^5$, and $M = log X = e^L$. The zero-density theorem of Montgomery #cite(label("Montgomery1969")) Theorem 1, in the precise form recorded in #cite(label("Inoue")) Lemma 1, states that
  #[#set math.equation(numbering: n => "(5.16)")
   $ sum_(q lt.eq Q\
chi med mod med q)^(*) N \( sigma \, T \, chi \) lt.double \( Q^2 T \)^(3 \( 1 - sigma \) \/ \( 2 - sigma \)) #scale(x: 120%, y: 120%)[\(] log \( Q T \) #scale(x: 120%, y: 120%)[\)]^13 quad (Q gt.eq 1 \, med T gt.eq 2 \, med 1 / 2 lt.eq sigma lt.eq 1) . $ <eq:supply-density-theorem>]
  Here the star restricts to primitive characters, and $N$ counts nontrivial zeros, with multiplicity, having real part at least $sigma$ and ordinate of absolute value at most $T$. There is no additional restriction relating $Q$ and $T$.
  The standard zero-free region and Landau–Page theorem, in the form #cite(label("FordGreenKonyaginMaynardTao2018")) Lemma 7.1, give an absolute $c > 0$ such that, after omitting at most one primitive real character of conductor at most $Q$, every zero in this family with $\| Im rho \| lt.eq T$ satisfies
  $ 1 - Re rho gt.eq u_0 := frac(c, log \( Q T \)) . $
  One may choose the omitted character by the Landau–Page theorem at height zero with parameter $Q$; decreasing the absolute $c$ makes the displayed common strip valid up to height $T$. The omitted object is the entire character, not just one zero.
  Let $cal(F)$ be the retained primitive nonprincipal characters. For $u_0 lt.eq y lt.eq 1 \/ 2$, (5.16) implies
  $ F \( y \) := sum_(chi in cal(F)) N \( 1 - y \, T \, chi \) lt.double B e^(A y) \, #h(2em) B = \( log \( Q T \) \)^13 \, quad A = 3 log \( Q^2 T \) . $
  There are no zeros counted for $y < u_0$. Since $log Q = 2 K e^(.9 L) = o \( M \)$, eventually $M gt.eq 2 A$. Integration by parts for this counting function yields
  $ sum_(chi in cal(F)) sum_(\| Im rho \| lt.eq T\
Re rho gt.eq 1 \/ 2) X^(Re rho - 1) & lt.eq e^(- M \/ 2) F \( 1 \/ 2 \) + M integral_(u_0)^(1 \/ 2) e^(- M y) F \( y \) thin d y\
 & lt.double B exp \( - M u_0 \/ 2 \) . $
  Now $log B = O \( L \)$, whereas
  $ M u_0 gt.double e^(.1 L) / K . $
  It follows that this last bound is smaller than $e^(- D L)$ for every fixed $D > 0$, for sufficiently large $L$.
  To connect zeros with the required smooth sums, write
  $ Phi \( s \) = integral_0^oo phi.alt \( t \) t^(s - 1) thin d t . $
  It is entire and, uniformly for $- 1 \/ 2 lt.eq Re s lt.eq 2$, $Phi \( s \) lt.double_(phi.alt \, j) \( 1 + \| Im s \| \)^(- j)$ for every integer $j gt.eq 0$. Mellin inversion, followed by shifting the integral of $- L' \/ L \( s \, chi \) X^s Phi \( s \)$ from $Re s = 2$ to $Re s = - 1 \/ 2$, gives for primitive nonprincipal $chi med mod med q$
  #[#set math.equation(numbering: n => "(5.17)")
   $ sum_n Lambda \( n \) chi \( n \) phi.alt \( n \/ X \) = - sum_rho X^rho Phi \( rho \) - upright(bold(1))_(chi \( - 1 \) = 1) Phi \( 0 \) + O_phi.alt \( X^(- 1 \/ 2) log \( 2 q \) \) . $ <eq:supply-smoothed-explicit>]
  The zero sum is over nontrivial zeros with multiplicity and converges absolutely. For clarity, the residue at zero is the simple trivial zero of an even nonprincipal character. On $Re s = - 1 \/ 2$, the functional equation expresses the logarithmic derivative through its absolutely convergent counterpart on $Re s = 3 \/ 2$, together with gamma factors. It gives the uniform bound $O \( log \( q \( 2 + \| Im s \| \) \) \)$ on this line. The decay of $Phi$ proves the displayed remainder. Shifting first at suitable finite heights and then passing to the limit justifies the contour operation using the ordinary zero-count bound $N \( 0 \, t \, chi \) lt.double \( t + 1 \) log \( q \( t + 2 \) \)$; these standard functional-equation and explicit-formula facts are given in #cite(label("MontgomeryVaughan2007")) Chapter 10; see also #cite(label("Helfgott")) Sections 3.7.1 and 3.7.3. In particular the error contains no constant depending on the distance of a possible exceptional zero from 1.
  We sum absolute values in (5.17). The contribution from zeros with $Re rho gt.eq 1 \/ 2$ and $\| Im rho \| lt.eq T$ is
  $ O_phi.alt \( X B e^(- M u_0 \/ 2) \) . $
  There are $O \( Q^2 T log \( Q T \) \)$ zeros in the retained family at these heights, so those with real part below $1 \/ 2$ contribute at most $O_phi.alt \( X^(1 \/ 2) Q^2 T log \( Q T \) \)$. Using $\| Phi \( beta + i gamma \) \| lt.double_phi.alt \( 1 + \| gamma \| \)^(- 3)$ and summing the zero-count bound in dyadic height intervals, the zeros above $T$ contribute $O_phi.alt \( X Q^2 T^(- 2) log \( Q T \) \)$. Finally the remainders in (5.17) sum to
  $ O_phi.alt #scale(x: 120%, y: 120%)[\(] Q^2 \( 1 + X^(- 1 \/ 2) log \( 2 Q \) \) #scale(x: 120%, y: 120%)[\)] . $
  Each of these terms is $O_(D_1 \, phi.alt \, C_K) \( X e^(- D_1 L) \)$. For the first, use the already proved estimate on $M u_0$. For the second and fourth, use $Q^7 = X^(o \( 1 \))$. For the third, $Q^2 T^(- 2) = Q^(- 8)$, whose logarithm is a negative quantity of order $K e^(.9 L)$. The conductor-$1$ character is added by the classical prime number theorem with its zero-free-region error, followed by smooth partial summation; its error is $O_phi.alt \( X e^(- c sqrt(log X)) \)$, which is also sufficient. This proves (5.15). ◻
]

We now perform the possible deletion promised after (5.13), using the one-prime removal of an exceptional conductor as in #cite(label("FordGreenKonyaginMaynardTao2018")) Section 7, following Lemma 7.1. If the exceptional primitive character of conductor at most $Q_b$ has conductor equal to a product of primes in $cal(S)$, delete one of those primes from $cal(S)$. Otherwise make no deletion. Keep $K \, Q_b$ fixed and redefine $W \, cal(L) \, cal(U) \, U \, H$ using the resulting set. Equations (5.6) and (5.13) continue to hold. Every primitive character induced by a monomial of $W$ has squarefree conductor formed from primes of $cal(S)$; hence none of those induced characters is the exceptional one.

Fix from now on a nonzero nonnegative smooth $phi.alt$ compactly supported in $\( 1 \/ 2 \, 1 \)$. For $j = 1 \, 2$ and a multiplicative character $lambda med mod med p$, write

$ c_(p \, j) \( lambda \) = frac(1, p - 1) sum_(x eq.not 0) b_p \( x \)^j overline(lambda \( x \)) . $

Multiplicative Fourier inversion expresses $b_p \( x \)^j$ as $sum_lambda c_(p \, j) \( lambda \) lambda \( x \)$ on $bb(F)_p^(*)$. Equations (5.8) and (5.9), followed by Cauchy–Schwarz, give

#[#set math.equation(numbering: n => "(5.18)")
 $ \| c_(p \, j) \( lambda \) \| lt.double p^(- 1 \/ 2) quad \( lambda eq.not 1 \, med j = 1 \, 2 \) \, #h(2em) \| c_(p \, j) \( 1 \) \| lt.double p^(- 1) quad \( j = 1 \, 2 \) . $ <eq:supply-mellin-coefficients>]

For example the mean of $b_p^2$ on units is $O \( 1 \/ p \)$, and the mean of $b_p^4$ is at most $parallel b_p parallel_oo^2$ times that mean, also $O \( 1 \/ p \)$. All constants here are absolute.

Expand (5.11) by its two subsets $I \, J$, and expand each participating local factor multiplicatively. For an integer coprime to every prime of $cal(S)$, group the resulting terms by the primitive character they induce. This gives

#[#set math.equation(numbering: n => "(5.19)")
 $ W \( n \) = sum_(chi med upright("primitive")\
"cond" \( chi \) lt.eq Q_b) C \( chi \) chi \( n \) #h(2em) (\( n \, product_(p in cal(S)) p \) = 1) . $ <eq:supply-grouped-expansion>]

Only squarefree conductors supported on $cal(S)$ occur. The conductor bound follows because $\| I union J \| lt.eq 2 K$.

For a fixed primitive character $chi$ of conductor $d$, its local nonprincipal character is prescribed at every $p divides d$. There are three possible statuses for such a prime: membership in $I$ alone, in $J$ alone, or in both. The sum of the absolute coefficient costs at that prime is at most $C \/ sqrt(p)$ by (5.18). For $p divides.not d$, the absent status contributes 1 and the other three statuses use principal coefficients, with total cost at most $1 + C \/ p$. Discarding the degree restrictions only enlarges this nonnegative majorant. Therefore even the sum of the absolute values of all terms grouped into $C \( chi \)$ is bounded by

#[#set math.equation(numbering: n => "(5.20)")
 $ product_(p divides d) C / sqrt(p) product_(p in cal(S)\
p divides.not d) \( 1 + C \/ p \) lt.eq e^(C' L) . $ <eq:supply-grouped-bound>]

In the last inequality all conductor-prime factors are at most 1 for sufficiently large $L$, and $sum_(p in cal(S)) 1 \/ p = O \( L \)$. This is a uniform bound for each grouped coefficient; we will multiply it by the total error in (5.15). The principal coefficient retains its signs and satisfies exactly

$ C \( 1 \) = cal(R)_K cal(U) = U + o \( U e^(- 1.6 H) \) = \( 1 + o \( 1 \) \) U . $

Every prime in the support of $phi.alt \( p \/ X \)$ is larger than every prime in $cal(S)$, because $exp \( exp \( .9 L \) \) = X^(o \( 1 \))$. Thus (5.19) holds on all desired prime inputs. Apply (5.15) to the grouped sum, taking its fixed $D_1$ larger than the absolute constants in (5.20) and in $U = exp \( O \( epsilon_0 L \) \)$. No exceptional character occurs, by our deletion. The resulting error is $o \( U X \)$.

To pass from von Mangoldt sums to primes, it is harmless that the grouped identity was only asserted on units. Indeed the number of primitive characters of conductor at most $Q_b$ is at most $Q_b^2$, and

$ sum_(n lt.eq X\
n med upright(a med p r i m e med p o w e r)\
n med upright(n o t med p r i m e)) Lambda \( n \) lt.double X^(1 \/ 2) \( log X \)^2 . $

The absolute contribution of all these terms to the grouped character sum is at most

$ e^(C' L) Q_b^2 X^(1 \/ 2) \( log X \)^2 = X^(1 \/ 2 + o \( 1 \)) = o \( U X \) . $

This bound also covers prime powers whose prime base lies in $cal(S)$, for which extension from unit classes can change the value of the grouped expansion. We have proved

#[#set math.equation(numbering: n => "(5.21)")
 $ sum_(p med upright("prime")) \( log p \) phi.alt \( p \/ X \) W \( p \) = \( 1 + o \( 1 \) \) U X integral_0^oo phi.alt \( t \) thin d t . $ <eq:src34>]

=== 5.5 Using coverage of every sufficiently large prime <using-coverage-of-every-sufficiently-large-prime>

The elementary bound $\| b_p \( n \) \| lt.eq 1$ gives, with $M_(cal(S)) = \| cal(S) \|$,

$ W \( n \) lt.eq \( K + 1 \)^2 \( 1 + M_(cal(S)) \)^(2 K) lt.eq exp #scale(x: 120%, y: 120%)[\(] O \( K exp \( .9 L \) \) #scale(x: 120%, y: 120%)[\)] = X^(o \( 1 \)) $

uniformly in $n$. By eventual prime coverage, every prime counted in (5.21), for sufficiently large $L$, has at least one representation $p = a - d$ with $a in A$, $d in D$. Since $a \, - d gt.eq 0$ and $p < X$, every such representation has $a \, - d lt.eq X$.

Remove all primes possessing a representation with $a lt.eq R + N_(*)$ or $- d lt.eq R + N_(*)$. The number of removed primes is at most

$ A \( R + N_(*) \) B \( X \) + A \( X \) B \( R + N_(*) \) = X^(3 \/ 4 + o \( 1 \)) $

by (2.4). Their contribution to the left side of (5.21) is still $X^(3 \/ 4 + o \( 1 \))$, by the uniform bound on $W$, boundedness of $phi.alt$, and $log p lt.eq log X$. This is $o \( U X \)$. Every remaining prime has a representation by a pair in $A_0 times D_0$. Choose one such pair for each prime. Different primes give different pairs, and the other pairs have nonnegative weight. Consequently, for a fixed $c_phi.alt > 0$,

#[#set math.equation(numbering: n => "(5.22)")
 $ frac(1, m_A m_D) sum_(a in A_0 \, d in D_0) W \( a - d \) gt.eq c_phi.alt U frac(X, m_A m_D log X) . $ <eq:supply-coverage-lower>]

Here we used $\( log p \) phi.alt \( p \/ X \) lt.eq parallel phi.alt parallel_oo log X$ to remove the prime weight from the surviving lower bound in (5.21). This step uses coverage of the full prime set.

Put $z = X \/ \( m_A m_D \) = R^2 \/ \( m_A m_D \)$. Equation (5.5) gives $z gt.eq e^(- o \( L \))$. Comparing (5.22) with (5.13), and canceling the positive $U$, gives

$ c_phi.alt z e^(- L) lt.eq e^(- 1.6 H + o \( L \)) sqrt(z) . $

Since $H gt.eq .68 L$, this implies

$ sqrt(z) lt.eq exp #scale(x: 120%, y: 120%)[\(] - .088 L + o \( L \) #scale(x: 120%, y: 120%)[\)] \, $

contradicting $z gt.eq e^(- o \( L \))$. Thus (5.1) cannot fail along an unbounded sequence, and Proposition 11 follows.

#prodef([Remark 5.4.])[
  (An optional zero-free refinement).  Theorem 1.1 of #cite(label("OpenAIQRH2026")) implies that (5.15) also holds when the sum includes #emph[all] primitive characters of conductor at most $Q_b$, including the conductor-$1$ principal character. Indeed, every nontrivial zero then has real part at most $7 \/ 8$. The smoothed explicit formula (5.17), the rapid decay of $Phi$, and the zero-count bound used above give an error $O_phi.alt \( X^(7 \/ 8) log \( 2 q \) \)$ for each primitive character of conductor $q$; for the conductor-$1$ character, subtract the pole main term. There are $O \( Q_b^2 \)$ such characters, so their total error is $O_phi.alt \( Q_b^2 X^(7 \/ 8) log \( 2 Q_b \) \)$, and
  $ Q_b^2 X^(7 \/ 8) log \( 2 Q_b \) = X^(7 \/ 8 + o \( 1 \)) lt.double_(D_1 \, C_K) X e^(- D_1 L) $
  for every fixed $D_1 > 0$, since $K = ceil.l C_K L ceil.r$ and $log Q_b = o \( log X \)$. The proof of Proposition 11, including its exceptional-character deletion, uses the classical estimate of Lemma 13, not this zero-free theorem.
]

== 6 A finite-field tree comparison <sec:tree>

This section isolates the finite-field estimate needed for the auxiliary primes that will be shared by all leaves in Section 7. The field size tends to infinity while the tree depth remains fixed. In particular, every constant allowed to depend on the depth is independent of the field, the frequencies, and the other unit parameters in the tree.

Let $q$ be an odd prime, let $U = bb(F)_q^times$, and write $e_q \( x \) = exp \( 2 pi i x \/ q \)$. For a function on $bb(F)_q$, use the Fourier normalization

$ hat(f) \( a \) = 1 / q sum_(x in bb(F)_q) f \( x \) e_q \( - a x \) . $

For a function on $U$, its Mellin coefficients are $\( q - 1 \)^(- 1) sum_(t in U) f \( t \) overline(chi \( t \))$, where $chi in hat(U)$. Every multiplicative character, including the principal character, is extended by zero at zero. All $L^2$ norms in this section use probability measure unless a counting sum is written explicitly. Suppose throughout that $g \( 0 \) = 0$ and $bb(E)_(x in bb(F)_q) \| g \( x \) \|^2 lt.eq 1$, and put

#[#set math.equation(numbering: n => "(6.1)")
 $ epsilon_q = max_(chi in hat(U) \, med a in bb(F)_q) lr(|bb(E)_(x in bb(F)_q) g \( x \) chi \( x \) e_q \( a x \)|) \, #h(2em) epsilon_q arrow.r 0 . $ <eq:src35>]

The correlation parameter for $overline(g)$ is the same, since conjugation replaces $\( chi \, a \)$ by $\( overline(chi) \, - a \)$. Also $epsilon_q lt.eq 1$ by Cauchy–Schwarz.

=== 6.1 The diagrams and their elementary density bound <the-diagrams-and-their-elementary-density-bound>

A diagram of depth $l$ uses a full ordered binary tree with $r = 2^l$ leaves. Its leaf variables $M_i$ take values in $U$. For a node $n$, write $M_n$ for the product of the variables at its descendant leaves. Choose frequencies $s_n in U$ at every node, a constant $D' in U$, and unit constants $C_(n \, +) \, C_(n \, -) \, u_n$ at the internal nodes. There are also two current entries $X_(n \, +) \, X_(n \, -)$: these are fixed units at the root and are propagated down the tree as follows. At an internal node, set

#[#set math.equation(numbering: n => "(6.2)")
 $ H_(n \, plus.minus) & = X_(n \, plus.minus) C_(n \, plus.minus) M_(n \, plus.minus) \,\
p_n & = frac(s_(n \, +) H_(n \, -) - s_(n \, -) H_(n \, +), s_n u_n) \,\
y_n & = frac(s_n, D' H_(n \, +) H_(n \, -)) \,\
y_(n \, plus.minus) & = frac(s_(n \, plus.minus), D' p_n u_n H_(n \, plus.minus)) . $ <eq:src36>]

The new ordered pair of current entries in child $n \, plus.minus$, when that child is internal, is $\( p_n \, X_(n \, plus.minus) \)$. The fixed constants are required to be consistent in the sense that

$ H_(n \, plus.minus \, +) H_(n \, plus.minus \, -) = p_n u_n H_(n \, plus.minus) . $

Equivalently, this is the condition $C_(n \, plus.minus \, +) C_(n \, plus.minus \, -) = u_n C_(n \, plus.minus)$ on the fixed constants. It ensures that the formula for a child’s argument in its parent’s display agrees with its own formula for $y_n$.

All these operations take place in $bb(F)_q$. If a reconstructed $p_n$ is zero, the entire diagram value is defined to be zero, and no division by that value is performed. Otherwise define $W$ to be the product of $g \( y_i \)$ or $overline(g \( y_i \))$ over the leaves, choosing opposite conjugations on the two leaves of every bottom sibling pair. The choices on different pairs may be arbitrary. For depth zero set $y_1 = c \/ M_1$, with a fixed $c in U$, and take either $g \( y_1 \)$ or its conjugate.

#thm([Lemma 6.1.])[
  (Tree comparison).  #emph[In a single diagram let the leaf variables be independent uniform elements of $U$. Then 
#[#set math.equation(numbering: n => "(6.3)")
 $ bb(E) \| W \|^2 lt.eq 3^r . $ <eq:src37>]

 For two diagrams of the same depth, partition the leaves in each into $b$ nonempty sets, with the sets in the two diagrams paired. Give the two collections of leaf variables the uniform distribution on the subgroup specified by equality of the products on each paired set. The diagrams may have different unit parameters and different conjugation choices. If $l gt.eq 2$ and $b lt.eq 3 r \/ 4$, then under (6.1), uniformly in these choices, 
#[#set math.equation(numbering: n => "(6.4)")
 $ \| bb(E) W_1 overline(W_2) \| = o_l \( 1 \) . $ <eq:src38>]

 More precisely, the left side is at most $C_l \( epsilon_q + q^(- 1 \/ 4) \)$ for a constant depending only on $l$.]
] <lem:tree-comparison>

We first prove the density estimate behind (6.3). Directly from (6.2), on valid points,

#[#set math.equation(numbering: n => "(6.5)")
 $ y_n = y_(n \, +) - y_(n \, -) \, #h(2em) y_(n \, +) / y_(n \, -) = s_(n \, +) / s_(n \, -) H_(n \, -) / H_(n \, +) . $ <eq:tree-difference-ratio>]

Expose first the product of all leaf variables. It is uniform on $U$, so the root argument is uniform on $U$. At each successive split, conditionally on the exposed parent product and all ancestor splits, $M_(n \, +)$ is uniform on $U$ and $M_(n \, -)$ is determined by their product. This follows either by counting the fibers of the product map or by induction on the two disjoint sets of descendant leaves. The current entries are already known at this point. Consequently the ratio on the right of (6.5) is a fixed unit times $M_(n \, +)^(- 2)$. A prescribed valid ordered pair of child arguments therefore has conditional probability at most $2 \/ \( q - 1 \)$.

A specified vector of leaf arguments determines all its intermediate arguments by taking the indicated differences. Its probability on the valid part of the sample space is at most $2^(r - 1) \( q - 1 \)^(- r)$. Thus the joint leaf-argument measure, with invalid points assigned mass zero, is dominated by $2^(r - 1)$ times independent uniform unit measure. It follows that

$ bb(E) \| W \|^2 lt.eq 2^(r - 1) (frac(q, q - 1))^r #scale(x: 120%, y: 120%)[\(] bb(E)_(x in bb(F)_q) \| g \( x \) \|^2 #scale(x: 120%, y: 120%)[\)]^r lt.eq 3^r . $

Stopping the same exposure at any horizontal level gives the analogous domination for the arguments at that level. In particular, the arguments at the roots of the bottom quartets have joint density bounded by a constant depending only on $l$ relative to independent uniform unit arguments. These are bounds for nonnegative integrals; they place no pointwise boundedness assumption on $g$.

=== 6.2 The cycle reduction and the quartet estimates <the-cycle-reduction-and-the-quartet-estimates>

We turn to the paired estimate (6.4). The subgroup distribution in the statement has the following equivalent description. First choose independent uniform component totals. In each diagram, independently given those totals, choose its leaf variables uniformly subject to the specified product in each component. Every product fiber has the same cardinality, so this is indeed uniform on the subgroup. Each diagram separately has independent uniform leaf variables.

In the first diagram make a bipartite multigraph whose vertices are its $b$ component sets and its $r \/ 4$ bottom quartets, with one edge for each leaf. It has $r$ edges and at most $r$ vertices, and no isolated vertices. A forest on nonempty vertex sets has fewer edges than vertices, so the graph contains a cycle, possibly two parallel edges. Choose a simple such cycle. On its leaf variables multiply alternately by $z$ and $z^(- 1)$, with $z in U$. This preserves every component product and every quartet product. Let $cal(P)$ denote averaging over this action, an orthogonal projection in $L^2 \( U^r \)$.

Let $cal(T)$ be the collection of component totals. The action preserves their fibers and their uniform measures, so $bb(E) \( W_1 divides cal(T) \) = bb(E) \( cal(P) W_1 divides cal(T) \)$. Conditional independence of the diagrams, conditional Cauchy–Schwarz, and (6.3) imply

#[#set math.equation(numbering: n => "(6.6)")
 $ \| bb(E) W_1 overline(W_2) \| lt.eq parallel bb(E) \( W_1 divides cal(T) \) parallel_2 thin parallel bb(E) \( W_2 divides cal(T) \) parallel_2 lt.eq 3^(r \/ 2) parallel cal(P) W_1 parallel_2 . $ <eq:tree-projection-reduction>]

The last norm uses the first diagram’s marginal law of independent uniform unit leaves; it is not conditioned on the component totals.

Under this law, condition on the products in all bottom quartets. Ancestor data and ancestor validity are determined by these products. If an ancestor is invalid the contribution vanishes. Otherwise quartet interiors are independent uniform product fibers. Each cycle quartet contains two moving leaves. Fix its two held leaves and use one moving leaf as a coordinate on $U$; the quartet product determines the other. Take the Mellin expansion in this coordinate with coefficients $a_(j \, rho)$. The action scales the coordinate by $z$ or $z^(- 1)$, so projection retains precisely the tuples of indices with

#[#set math.equation(numbering: n => "(6.7)")
 $ product_(j = 1)^t rho_j^(delta_j) = 1 \, #h(2em) delta_j in { 1 \, - 1 } \, $ <eq:tree-cycle-relation>]

where $t$ is the number of quartets on the cycle.

The needed local estimates concern any bottom quartet with its product and all ancestor data fixed. On valid ancestor data its current entries and parent argument $y$ are fixed units. Choose two distinct leaves to move by reciprocal multiplication, preserving their product, and hold the other two leaves fixed. Use one moving leaf as a coordinate on $U$; the other is then determined. Write $a_rho$ for the Mellin coefficient of the quartet value in this coordinate.

We shall construct nonnegative functions $B_rho \( y \)$, depending on $g$ and $q$ but not on the ancestor data or unit parameters, such that

$ bb(E)_(upright("held")) \| a_rho \|^2 lt.eq B_rho \( y \) \, $

and

#[#set math.equation(numbering: n => "(6.8)")
 $ sup_rho bb(E)_(y in U) B_rho \( y \) lt.double epsilon_q^2 + q^(- 1 \/ 2) = o \( 1 \) \, #h(2em) sum_rho bb(E)_(y in U) B_rho \( y \) lt.double 1 . $ <eq:src39>]

The held average here is the independent uniform average of the two held leaf variables, conditional on the quartet product. We shall also construct a nonnegative $B_0 \( y \)$ of bounded mean that dominates the full conditional second moment of an untouched quartet. Finitely many orientations and conjugation choices are possible; adding their majorants makes all these assertions uniform without affecting their bounds.

One character in (6.7) is determined by the others. We will use the small supremum in (6.8) for that index, the bounded sum for the remaining indices, and $B_0$ for quartets off the cycle. The following local calculations establish these estimates; we then complete the projected norm bound.

=== 6.3 Bottom-pair autocorrelations <bottom-pair-autocorrelations>

We next establish the local estimates used in each quartet. Fix $sigma in { 1 \, - 1 }$ and $g_(*) in { g \, overline(g) }$. For $d in U$ and $t in U \\ { 1 }$, let

$ x = frac(sigma d t, t - 1) \, #h(2em) z = frac(sigma d, t - 1) \, #h(2em) h \( d \, t \) = g_(*) \( x \) overline(g_(*) \( z \)) . $

Extend $h$ by zero whenever $d = 0$ or $t in { 0 \, 1 }$. Thus on valid arguments $x - z = sigma d$ and $t = x \/ z$. Write

$ R_(*) \( d \) = bb(E)_(t in U) \| h \( d \, t \) \|^2 #h(2em) \( d in U \) . $

The map $\( d \, t \) mapsto \( x \, z \)$ is a bijection between the valid pairs and ordered distinct unit pairs, so

#[#set math.equation(numbering: n => "(6.9)")
 $ bb(E)_(d in U) R_(*) \( d \) = frac(1, \( q - 1 \)^2) sum_(x \, z in U\
x eq.not z) \| g_(*) \( x \) \|^2 \| g_(*) \( z \) \|^2 lt.eq (frac(q, q - 1))^2 . $ <eq:tree-R-mean>]

For nonzero $d$, the Mellin coefficient of $h \( d \, dot.op \)$ is

#[#set math.equation(numbering: n => "(6.10)")
 $ P_chi \( d \) = frac(q, q - 1) bb(E)_(x in bb(F)_q) \( g_(*) overline(chi) \) \( x \) overline(\( g_(*) overline(chi) \) \( x - sigma d \)) . $ <eq:tree-P-definition>]

Indeed, $t = x \/ \( x - sigma d \)$ gives precisely this coefficient. Use the autocorrelation formula (6.10) also to define $P_chi \( 0 \)$; this value is not the Mellin coefficient of the zero-extended $h \( 0 \, dot.op \)$.

Let $w_chi \( a \) = hat(P)_chi \( a \)$ and $r_chi = sum_a w_chi \( a \)^2$. Autocorrelation and additive Fourier inversion give

$ w_chi \( a \) = frac(q, q - 1) \| accent(g_(*) overline(chi), ̂) \( sigma a \) \|^2 gt.eq 0 \, #h(2em) P_chi \( 0 \) = sum_a w_chi \( a \) = frac(q, q - 1) parallel g parallel_2^2 . $

In particular,

#[#set math.equation(numbering: n => "(6.11)")
 $ sum_a w_chi \( a \) lt.double 1 \, #h(2em) max_(chi \, a) w_chi \( a \) lt.double epsilon_q^2 = o \( 1 \) \,\
max_chi r_chi lt.double epsilon_q^2 = o \( 1 \) \, #h(2em) sum_chi r_chi lt.double 1 . $ <eq:src40>]

For the last assertion, Mellin Parseval at $d eq.not 0$ gives $sum_chi \| P_chi \( d \) \|^2 = R_(*) \( d \)$. At $d = 0$, each of the $q - 1$ characters has the same value $q parallel g parallel_2^2 \/ \( q - 1 \)$. Additive Parseval and (6.9) therefore give the explicit bound

#[#set math.equation(numbering: n => "(6.12)")
 $ sum_chi r_chi = 1 / q sum_(d in bb(F)_q) sum_chi \| P_chi \( d \) \|^2 lt.eq frac(2 q, q - 1) lt.eq 3 . $ <eq:tree-total-r>]

We shall repeatedly use the following elementary consequence of Mellin expansion. If $f \( t \) = sum_chi c_chi chi \( t \)$ on $U$, $K in U$, and $rho in hat(U)$, then

#[#set math.equation(numbering: n => "(6.13)")
 $ lr(|bb(E)_(z in U) f \( K z^(plus.minus 2) \) overline(rho \( z \))|)^2 lt.eq 2 sum_(chi^(plus.minus 2) = rho) \| c_chi \|^2 . $ <eq:tree-square-pullback>]

To see this, orthogonality makes the coefficient on the left equal to $sum_(chi^(plus.minus 2) = rho) c_chi chi \( K \)$. The squaring map on $hat(U)$ has kernel of size two, so there are at most two terms, and Cauchy–Schwarz proves the inequality. Similarly, uniform measure on any square coset in $U$ is dominated by twice uniform measure on $U$ for nonnegative integrands.

=== 6.4 A uniform Mellin estimate <a-uniform-mellin-estimate>

The following estimate will be applied to the quartet terms in the next subsection. For every $eta in hat(U)$ and $a in bb(F)_q$,

#[#set math.equation(numbering: n => "(6.14)")
 $ sum_(chi in hat(U)) \| accent(P_chi chi eta, ̂) \( a \) \|^2 lt.eq frac(q, q - 1) (epsilon_q^4 + sqrt(3) thin q^(- 1 \/ 2)) = o \( 1 \) . $ <eq:src42>]

Here the multiplicative twist sets the value at zero to zero, even if $chi eta$ is principal.

For a proof, expand $h \( d \, lambda d \)$ in Mellin characters and apply Parseval in $lambda in U$. The left side of (6.14) equals

$ bb(E)_(lambda in U) lr(|bb(E)_(d in bb(F)_q) h \( d \, lambda d \) eta \( d \) e_q \( - a d \)|)^2 \, $

where an argument with $d = 0$ or $lambda d = 1$ contributes zero. In the parametrization $x - z = sigma d$, $x \/ z = lambda d$, solve for $x$ and $d$ in terms of $z$:

$ x = frac(z^2, z - sigma \/ lambda) \, #h(2em) d = frac(z, lambda z - sigma) . $

This is a bijective parametrization of the valid values: $z in U \\ { sigma \/ lambda }$ corresponds precisely to $d in U \\ { 1 \/ lambda }$. Setting $t = sigma \/ lambda$ and $r' = 1 \/ z$ gives $1 \/ x = r' - t r' ""^2$. Define

$ G \( h \) = \( g_(*) eta \) \( 1 \/ h \) e_q \( - a sigma \/ h \) quad \( h in U \) \, #h(2em) G \( 0 \) = 0 . $

The identities $eta \( d \) = overline(eta \( lambda \)) eta \( x \/ z \)$ and $e_q \( - a d \) = e_q \( - a sigma x \) e_q \( a sigma z \)$ show that the inner coefficient is

#[#set math.equation(numbering: n => "(6.15)")
 $ overline(eta \( lambda \)) thin T G \( t \) \, #h(2em) T F \( t \) = 1 / q sum_(r' in U) overline(G \( r' \)) F \( r' - r' ""^2 t \) . $ <eq:tree-affine-coefficient>]

The zero definition of $G$ encodes exactly the excluded values in this formula. Inversion permutes $U$, so $parallel G parallel_2 lt.eq 1$ and $\| bb(E) G \| lt.eq epsilon_q$ by (6.1).

Here is a direct operator bound for (6.15). The affine-action estimate is a concrete counterpart of the convolution bounds developed by Gowers #cite(label("Gowers2008")), Babai, Nikolov and Pyber #cite(label("BabaiNikolovPyber2008")), and Gill #cite(label("Gill2016")) Theorem 2 and Proposition 1.7. We give the weighted calculation directly in the additive Fourier basis. Let $U_r F \( t \) = F \( r - r^2 t \)$, a unitary operator on the probability-normalized $L^2 \( bb(F)_q \)$. The map underlying $U_r^(*) U_s$ is

$ t mapsto \( s \/ r \)^2 t + s - s^2 \/ r . $

For a prescribed slope, $z = s \/ r$ has at most two possibilities. Unless $z = 1$, the translation $r \( z - z^2 \)$ determines $r$ uniquely; $z = 1$ gives the identity and forces $r = s$. Hence every nonidentity affine map has at most two ordered representations as $U_r^(*) U_s$. Write the coefficient array of $T^(*) T$ on affine maps as $c \( a \, b \)$, with $a in U$, $b in bb(F)_q$, and action $F \( t \) mapsto F \( a t + b \)$. Its identity coefficient is at most $1 \/ q$. Cauchy–Schwarz on each fiber of at most two nonidentity representations gives

#[#set math.equation(numbering: n => "(6.16)")
 $ sum_(a \, b) \| c \( a \, b \) \|^2 lt.eq 1 / q^2 + 2 / q^4 (sum_(r in U) \| G \( r \) \|^2)^2 lt.eq 3 / q^2 . $ <eq:tree-affine-coefficient-norm>]

For completeness, the required affine-action estimate follows from ordinary additive Parseval. The functions $e_q \( xi t \)$, $xi in U$, form an orthonormal basis of the mean-zero subspace, and $F \( t \) mapsto F \( a t + b \)$ sends the mode $xi$ to the mode $a xi$ with factor $e_q \( xi b \)$. Thus the squared Hilbert–Schmidt norm on this subspace is

$ sum_(a in U) sum_(xi in U) lr(|sum_b c \( a \, b \) e_q \( xi b \)|)^2 lt.eq q sum_(a \, b) \| c \( a \, b \) \|^2 . $

Combining with (6.16) bounds the operator norm of $T^(*) T$ there by $sqrt(3) q^(- 1 \/ 2)$. Affine actions preserve the mean-zero subspace and the constants. If $m_G = bb(E) G$, then $T 1 = overline(m_G)$, so the constant part of $T G$ has squared norm $\| m_G \|^4$. Therefore

$ bb(E)_(t in bb(F)_q) \| T G \( t \) \|^2 lt.eq epsilon_q^4 + sqrt(3) q^(- 1 \/ 2) . $

Changing the average to $t in U$, and using that $lambda mapsto sigma \/ lambda$ permutes $U$, proves (6.14).

=== 6.5 Quartet coefficient majorants <quartet-coefficient-majorants>

We now construct the majorants in (6.8). Fix a bottom quartet with its product and ancestor data as in the cycle reduction. Let $d \, e$ be its two bottom-pair arguments, so $d - e = y$. In either pair, orient a leaf as free and the other as held. Its product test is $h \( d \, t \)$ defined above, with $sigma$ recording the orientation and $g_(*)$ recording the conjugation on the free leaf.

First suppose both moving leaves are in the left pair. At fixed pair product, its ratio is a fixed unit times the inverse square of the moving coordinate. Equation (6.13) bounds the squared coefficient by

$ 2 sum_(chi^2 = rho^(- 1)) \| P_chi \( d \) \|^2 times \| upright("right-pair value") \|^2 . $

Interchanging the coordinate convention only inverts $rho$. Average the two held variables by exposing first their product and then their split. The first exposure makes $d \/ e$ uniform on a square coset, and the second makes the right-pair ratio uniform on a square coset. Dominate each by twice full unit measure. Thus a majorant is a fixed constant times

#[#set math.equation(numbering: n => "(6.17)")
 $ frac(1, q - 1) sum_(d \, e in U\
d - e = y) (sum_(chi^2 = rho^(plus.minus 1)) \| P_chi \( d \) \|^2) R_(*) \( e \) \, $ <eq:tree-same-pair-majorant>]

where summing both signs is allowed. Its mean over $y$ is bounded by a constant times the product of the means of the two nonnegative factors: remove the restriction $d eq.not e$ to obtain this bound. Equations (6.11) and (6.9) give the two assertions of (6.8). An untouched quartet has the analogous majorant with $R_L \( d \) R_R \( e \)$ in place of the displayed product, and hence has bounded mean.

It remains to treat one moving leaf in each bottom pair. The following diagram records the ordered current entries; the leaf labels underneath give the corresponding factors $H$ before each bottom reconstruction. It will explain exactly which held leaves lead to the two formulas below.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [$y;#h(0.3333em) (A,B)$])
  content((-3, -1.35), [$d;#h(0.3333em) (p_*,A)$])
  content((3, -1.35), [$e;#h(0.3333em) (p_*,B)$])
  content((-4.8, -2.8), [$M_1$#linebreak()$p_*C_1M_1$])
  content((-1.6, -2.8), [$M_2$#linebreak()$"AC"_2M_2$])
  content((1.6, -2.8), [$M_3$#linebreak()$p_*C_3M_3$])
  content((4.8, -2.8), [$M_4$#linebreak()$"BC"_4M_4$])
  line((-0.6689, -0.301), (-2.331, -1.049), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-2.331, -1.049), (-0.6689, -0.301), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0.6689, -0.301), (2.331, -1.049), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2.117, -1.35), (-2.117, -1.35), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-3.374, -1.651), (-4.187, -2.307), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-4.187, -2.307), (-3.374, -1.651), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-2.709, -1.651), (-2.067, -2.317), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-0.9286, -2.588), (2.117, -1.628), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2.709, -1.651), (2.076, -2.307), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2.076, -2.307), (2.709, -1.651), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((3.374, -1.651), (4.2, -2.317), stroke: (thickness: 0.4pt, miter-limit: 10))
})],
  caption: [Figure 1: A quartet with its ordered current entries. Here $A \, B$ are fixed local units, unrelated to the summand sets, and $d - e = y$. The shared entry $p_(*)$ is reconstructed and varies according to (6.19). Holding $M_2$ or $M_4$ uses a residual entry $A$ or $B$; holding $M_1$ or $M_3$ uses the reconstructed entry $p_(*)$. ],
) <fig:tree-quartet>

Orient the moving leaf as free in each pair. Division of the formulas in (6.2) gives

#[#set math.equation(numbering: n => "(6.18)")
 $ t_L / d = upright("a fixed unit") times H_(upright("held") \, L)^2 \, #h(2em) t_R / e = upright("a fixed unit") times H_(upright("held") \, R)^2 . $ <eq:tree-held-square>]

For example, if the free leaf is the first child of the left pair, the constant in the first identity is $D' s_(upright("free")) \/ \( s_(upright("held")) s_(upright("pair")) \)$; the opposite orientation gives the same form with the two bottom frequencies interchanged. At the quartet root, another direct consequence of (6.2) is

#[#set math.equation(numbering: n => "(6.19)")
 $ p_(*)^2 = frac(s_(+) s_(-), s_n D' u_n^2) frac(y, d e) . $ <eq:tree-p-square>]

If the held entry in Figure 1 is the residual $A$ or $B$, (6.18) therefore has the first of the following forms; if it is $p_(*)$, use (6.19) to obtain the second:

#[#set math.equation(numbering: n => "(6.20)")
 $ t_L = lambda_L d med upright("or") med lambda_L \/ e \, #h(2em) t_R = lambda_R e med upright("or") med lambda_R \/ d . $ <eq:tree-friendly-bad>]

Call the first choice on either side friendly and the second bad. The parameters $lambda_L \, lambda_R$ are fixed unit multiples of the squares of the two held leaf variables. The multiples may depend on the fixed parent data and on $y$, but not on the held variables. Since those variables are independent uniform units, the two parameters are independent uniform square-coset variables.

For fixed held variables the parent ratio $d \/ e$ is a fixed unit times the inverse square of the moving coordinate. The local value depends on this ratio, rather than on its square-root choice. Indeed changing the moving coordinate to its negative changes $p_(*)$ to its negative, while (6.20) only used its square; the arguments within either pair are determined by their ratio and their difference. Apply (6.13), and then dominate the two square-coset laws of the held parameters by full independent unit laws. The latter domination is applied to a nonnegative squared coefficient and costs at most four. On changing from $d \/ e$ to $d - e = y$, the normalization changes by the bounded factor $q \/ \( q - 1 \)$. We obtain a constant times

#[#set math.equation(numbering: n => "(6.21)")
 $ sum_(nu^2 = rho^(plus.minus 1)) bb(E)_(lambda_L \, lambda_R in U) lr(|1 / q sum_(d \, e in U\
d - e = y) h_L \( d \, t_L \) h_R \( e \, t_R \) nu \( d \/ e \)|)^2 . $ <eq:src41>]

The sign allows either Mellin convention. All invalid ratios are encoded by the zero definitions of the functions $h$; in particular, the parent ratio $1$ has no valid $\( d \, e \)$ with $d - e = y eq.not 0$.

To check the sum over $rho$ in (6.8), it suffices to sum over all $nu$. For $y eq.not 0$, the map $t = d \/ e$ is a bijection from $U \\ { 1 }$ to the unit solutions of $d - e = y$, with $d = y t \/ \( t - 1 \)$ and $e = y \/ \( t - 1 \)$. Mellin Parseval, followed by the independent $lambda_L \, lambda_R$ averages, bounds this sum by a constant times

$ frac(1, q - 1) sum_(d \, e in U\
d - e = y) R_L \( d \) R_R \( e \) . $

Its mean over $y in U$ is bounded by (6.9).

For the small bound at a fixed $nu$, extend the nonnegative $y$ average to all of $bb(F)_q$, paying at most $q \/ \( q - 1 \)$. Expand both $h$ factors in Mellin characters $chi \, psi$. Orthogonality in the independent parameters separates their squared coefficients. Additive convolution Parseval then reduces the bound to

#[#set math.equation(numbering: n => "(6.22)")
 $ sum_(a \, chi \, psi) \| accent(P_chi alpha, ̂) \( a \) \|^2 \| accent(P_psi beta, ̂) \( - a \) \|^2 . $ <eq:tree-twisted-convolution>]

Each pair uses its own choice of $sigma \, g_(*)$ in its $P$. The twists are listed explicitly below; all are zero at zero:

$ upright("choices") & alpha & beta\
upright("friendly, friendly") & nu chi & overline(nu) psi\
upright("friendly, bad") & nu chi overline(psi) & overline(nu)\
upright("bad, friendly") & nu & overline(nu) psi overline(chi)\
upright("bad, bad") & nu overline(psi) & overline(nu) overline(chi) $

For example, the left friendly term contributes $chi \( d \)$ and the left bad term contributes $overline(chi) \( e \)$, which explains all four rows. If the left choice is friendly, the second twist is independent of $chi$. Apply (6.14) to the sum over $chi$, uniformly in the remaining index and $a$. The remaining sum is bounded since additive Parseval gives

$ sum_(psi \, a) \| accent(P_psi beta, ̂) \( a \) \|^2 lt.eq sum_psi bb(E)_(d in bb(F)_q) \| P_psi \( d \) \|^2 lt.double 1 \; $

here $beta$ may depend on $psi$. This bounds (6.22) by $O \( epsilon_q^4 + q^(- 1 \/ 2) \)$. The right friendly case is symmetric.

=== 6.6 The case of two bad choices <the-case-of-two-bad-choices>

It remains to bound (6.22) when $alpha = nu overline(psi)$ and $beta = overline(nu) overline(chi)$. For a nonprincipal character $alpha$, the additive Fourier transform of $alpha$ has constant modulus $q^(- 1 \/ 2)$ on nonzero frequencies, and equals zero at zero. For clarity, the needed Gauss identity follows by substituting $x mapsto x \/ t$ in $sum_x alpha \( x \) e_q \( t x \)$ for $t eq.not 0$; its modulus is $sqrt(q)$, because

$ lr(|sum_x alpha \( x \) e_q \( x \)|)^2 = sum_(u in U) alpha \( u \) sum_(z in U) e_q \( \( u - 1 \) z \) = \( q - 1 \) - sum_(u eq.not 1) alpha \( u \) = q . $

Consequently, with harmless unit factors and a possible reflection of the frequency,

#[#set math.equation(numbering: n => "(6.23)")
 $ \| accent(P_chi alpha, ̂) \( a \) \| = q^(- 1 \/ 2) lr(|sum_b w_chi \( b \) overline(alpha) \( a - b \)|) . $ <eq:tree-Gauss-convolution>]

Let $w gt.eq 0$ be any weights of mass $J$ and let $r_w = sum_b w \( b \)^2$. Multiplicative orthogonality yields

#[#set math.equation(numbering: n => "(6.24)")
 $ frac(1, q - 1) sum_(alpha in hat(U)) sum_a lr(|sum_b w \( b \) alpha \( a - b \)|)^4 lt.eq 2 q r_w^2 + J^4 . $ <eq:tree-fourth-moment>]

Indeed, after expansion, a nonzero term requires

$ \( a - b_1 \) \( a - b_2 \) = \( a - b_3 \) \( a - b_4 \) eq.not 0 . $

When the two unordered pairs of $b$’s agree, their total weight is at most $2 r_w^2$ and there are at most $q$ values of $a$. Otherwise, subtracting the two monic quadratics gives a nonzero polynomial of degree at most one, so there is at most one value of $a$. The total weight of all these latter quadruples is at most $J^4$.

The principal character alone contributes

$ frac(1, q - 1) sum_a \( J - w \( a \) \)^4 gt.eq frac(q J^4 - 4 J^3 sum_a w \( a \), q - 1) = J^4 - frac(3 J^4, q - 1) . $

Subtract this contribution in (6.24) before applying (6.23). Since the masses $J$ of our $w_chi$ are uniformly bounded, for each $chi$ this gives

$ sum_(alpha eq.not 1 \, a) \| accent(P_chi alpha, ̂) \( a \) \|^4 lt.eq 2 r_chi^2 + O \( q^(- 2) \) . $

Summing over $chi$ and using (6.11), we obtain

#[#set math.equation(numbering: n => "(6.25)")
 $ sum_(chi \, alpha eq.not 1 \, a) \| accent(P_chi alpha, ̂) \( a \) \|^4 lt.double epsilon_q^2 + q^(- 1) . $ <eq:tree-all-nonprincipal-fourth>]

When both twists in (6.22) are nonprincipal, Cauchy–Schwarz bounds it by the geometric mean of two sums of this form. This is legitimate because at fixed $nu$ the map $\( chi \, psi \) mapsto \( chi \, nu overline(psi) \)$ is bijective, and the corresponding assertion holds for the other factor.

We also record the principal cases explicitly. Because the principal character is zero at zero, its additive transform is

#[#set math.equation(numbering: n => "(6.26)")
 $ accent(P_chi upright(bold(1))_U, ̂) \( a \) = w_chi \( a \) - frac(P_chi \( 0 \), q) . $ <eq:tree-principal-correction>]

Thus its Fourier maximum is $O \( epsilon_q^2 + q^(- 1) \)$, and its squared Fourier norm is no greater than $r_chi$ by Parseval on the original functions. If $alpha$ is principal, then $psi = nu$ is fixed. When $beta$ is nonprincipal, (6.23) and the bounded mass of $w_psi$ bound the other Fourier factor by $O \( q^(- 1 \/ 2) \)$ uniformly. Summing the first squared factor over $chi \, a$ costs $O \( 1 \)$ by (6.12); this part is $O \( q^(- 1) \)$. The case with the two roles exchanged is identical. If both twists are principal, both indices are fixed. Apply the small Fourier maximum in (6.26) to one factor and the bounded squared norm to the other. This contributes $O \( epsilon_q^4 + q^(- 2) \)$.

The two-bad case of (6.22) is therefore $O \( epsilon_q^2 + q^(- 1) \)$. Together with the friendly estimates this proves the first assertion of (6.8) for (6.21). Adding the finitely many orientation choices and the same-pair majorants completes the construction of $B_rho$ and $B_0$.

=== 6.7 Completion of the cycle estimate <completion-of-the-cycle-estimate>

Return to the projection in (6.6), conditioning again on the products in all bottom quartets. Orthogonality in the independent moving coordinates gives a sum of products of $\| a_(j \, rho_j) \|^2$, with squared untouched-quartet values as the other factors. Average the held variables. The bounds already proved dominate this expression by

$ sum_(product_j rho_j^(delta_j) = 1) product_(j = 1)^t B_(rho_j) \( y_j \) product_(j in.not upright("cycle")) B_0 \( y_j \) . $

The actual joint distribution of quartet arguments on valid ancestor points is dominated by a constant depending only on $l$ times independent uniform unit measure, by the horizontal-level density bound proved above. Since this last display is nonnegative, we may use that domination without any pointwise control of $g$.

Put $b_rho = bb(E)_(y in U) B_rho \( y \)$ and $b_0 = bb(E)_(y in U) B_0 \( y \)$. One character in (6.7) is determined uniquely by the others. Consequently

$ parallel cal(P) W_1 parallel_2^2 lt.eq C_l #scale(x: 120%, y: 120%)[\(] sup_rho b_rho #scale(x: 120%, y: 120%)[\)] (sum_rho b_rho)^(t - 1) b_0^(r \/ 4 - t) lt.double_l epsilon_q^2 + q^(- 1 \/ 2) . $

If the cycle consists of two parallel edges, $t = 1$ and its sole character is principal; the same inequality simply uses $b_1 lt.eq sup_rho b_rho$. Thus this degenerate cycle requires no separate structural assumption. Equation (6.6) proves the quantitative statement of Lemma 15, and hence (6.4).

For the later application, the exact transforms $g_p$ in (4.16) satisfy $g_p \( 0 \) = 0$ and $bb(E) \| g_p \|^2 = 1$ by centering and additive Parseval. On the chosen spectator subset their mixed correlation parameters tend to zero uniformly. Once independent unit bulk residues have been obtained in Section 8, Lemma 15 may therefore be applied separately at every spectator prime. The zero convention in the diagram retains the requirement that every reconstructed entry be a unit at that prime.

== 7 A positive statistic and its binary-tree transfers <sec:construction>

We combine the size and collision estimates with the Fourier supply of Proposition 11 to construct a nonnegative statistic. Poisson summation will turn it into an amplitude. The transfers propagate a quantitative lower bound once their diagonals are controlled; Section 9 will bound the same amplitude from above by averaging over arrangements of its prime variables.

The pivot extraction, extension to positive integers, and doubling of the remaining template follow the architecture of Section 4. The exact residue-mask transforms carry no prescribed multiplicative-character phase, so the anchor cancellation is replaced by a common outside list of spectator primes, where Lemma 15 compares the paired histories.

All parameters introduced in this section are new; in particular, the letters $L \, k \, m$ no longer denote parameters from the preceding character arguments.

=== 7.1 Scales and prime priors <scales-and-prime-priors>

Let $L arrow.r oo$. The transfer depth $k$ will be a sufficiently large fixed positive integer, chosen before $L$ tends to infinity. Put

$ h = e^(.01 L) \, #h(2em) z = k^4 \, #h(2em) m = 2 floor.l z L \/ 2 floor.r \, #h(2em) r_j = 2^(j - 1) quad \( 1 lt.eq j lt.eq k \) . $

The notation $o_k \( m \)$ and $O_k \( 1 \)$ permits dependence on all parameters that are fixed before $L$. In bounds of the form $C m$ or $C 2^l m$, however, $C$ will be independent of $k$ and of the large gap constants introduced below, once $k$ and then $L$ are sufficiently large. The threshold on $L$ may depend on these fixed choices.

Choose fixed positive constants $B_s \, B_D \, B_z$, with their order of choice specified in Section 9, and define

#[#set math.equation(numbering: n => "(7.1)")
 $ Delta_0 & = \( B_s + 8 log z \) m \,\
Delta_j & = r_j \( B_D + B_z log z + .4 log r_j \) m #h(2em) \( 1 lt.eq j lt.eq k \) \,\
E_l & = Delta_0 + sum_(j = 1)^l Delta_j + 2^l sqrt(m) \,\
V_l & = e^(E_l) #h(2em) \( 0 lt.eq l lt.eq k \) . $ <eq:src43>]

Thus $log V_l = O_k \( m \)$. In particular, all frequencies used below are smaller than every sampled prime, since even the smallest prime range has lower endpoint $exp \( exp \( .0005 L \) \)$.

Fix a nonnegative smooth function $phi$ supported on $\[ - 1 \, 1 \]$ such that

$ sum_(n in bb(Z)) phi \( t - n \) = 1 #h(2em) \( t in bb(R) \) . $

Then $0 lt.eq phi lt.eq 1$ and $integral_(bb(R)) phi \( t \) thin d t = 1$. For a center $c$, the #emph[log-cell prior] is the probability measure on primes proportional to

$ frac(phi \( log p - c \), p) . $

Except for the giant-prime prior defined shortly, all prime priors will omit a set $cal(E)_L$ of at most two prime values. This set is fixed for each $L$; Section 8 specifies its choice from the two possible Page exceptional conductors. Every abundance assertion in this section holds uniformly after any such deletion. A nongiant cell is therefore normalized by

$ Z_c = sum_(p med upright("prime")\
p in.not cal(E)_L) frac(phi \( log p - c \), p) . $

For all the cell centers used here, the prime number theorem and partial summation give $Z_c tilde.op c^(- 1)$. The same statement holds without the deletion. They also give

$ sum_p frac(log p, p) phi \( log p - c \) = 1 + o \( 1 \) . $

The errors are uniform as the centers in our specified ranges tend to infinity. Deleting two prime values does not change these asymptotics.

By (5.1), there is a block $\[ G_0 \, G_0 + h \]$ in log-prime coordinates, contained in the range of that estimate, such that the primes satisfying its two conditions have total $\( log p \) \/ p$ weight at least $c_0 h$, for a fixed $c_0 > 0$. Here and below a prime satisfying those conditions is called favorable. To see the block assertion, partition $\[ e^(.05 L) \, e^(.9 L) \]$ into intervals of length $h$, apart from the two end pieces. On each full block the log coordinate varies by a relative $o \( 1 \)$, uniformly in the block. If every block had favorable $\( log p \) \/ p$ weight at most $c h$, summing these bounds after division by the left log coordinate would give favorable harmonic weight at most $\( .85 c + o \( 1 \) \) L$. A sufficiently small fixed $c$ contradicts (5.1). Mertens’ estimates make the two end pieces negligible in this calculation.

Set

$ log X = 2 G_0 + 2^(k + 1) h \, #h(2em) A' = A ∩ \[ X^(9 \/ 10) \, X \] . $

The whole chosen block lies below the prime cutoff in (2.7) for the uniform measure on $A'$. Indeed, $log sqrt(X) = G_0 + 2^k h$, whereas the block ends at $G_0 + h$, and the loss from the logarithmic denominator in that cutoff is only $O \( log log X \) = O \( L \)$.

Use the transforms $F_p \, g_p$ from (4.16), with the normalization

$ g_p \( b \) = sqrt(p) thin bb(E)_(x med mod med p) F_p \( x \) e_p \( - b x \) \, #h(2em) F_p \( x \) = p^(- 1 \/ 2) sum_(b med mod med p) g_p \( b \) e_p \( b x \) . $

For a favorable prime put

$ tilde(g)_p \( b \) = cases(delim: "{", g_p \( b \) \/ \| g_p \( b \) \| \, & g_p \( b \) eq.not 0 \,, 0 \, & g_p \( b \) = 0 \,) $

and put $tilde(g)_p = 0$ at every other prime. Let $tilde(F)_p$ be its inverse transform with the same normalization. Conjugate symmetry of $g_p$ implies that $tilde(F)_p$ is real. Also

$ bb(E)_x tilde(F)_p \( x \) = 0 \, #h(2em) bb(E)_x \| tilde(F)_p \( x \) \|^2 = bb(E)_b \| tilde(g)_p \( b \) \|^2 lt.eq 1 . $

For a favorable prime, Parseval and the definition of $F_p$ give

$ bb(E)_(x in S_p) tilde(F)_p \( x \) = sqrt(frac(1 - sigma_p, sigma_p)) thin bb(E)_b \| g_p \( b \) \| gt.eq delta_0 / sqrt(2) . $

There is an integer center $G$, whose log-cell support is contained in $\[ G_0 \, G_0 + h \]$, for which

#[#set math.equation(numbering: n => "(7.2)")
 $ bb(E)_(p med upright("in the cell at") med G\
a in A') tilde(F)_p \( a \) gt.eq c_1 > 0 . $ <eq:src44>]

The giant prior in this display includes all primes in its cell. Here is why the collision estimate applies to these possibly unbounded inverse transforms. If $mu_p$ is the projection of the uniform probability on $A'$, then Cauchy–Schwarz gives

$ lr(|sum_(x med mod med p) \( mu_p \( x \) - U_(S_p) \( x \) \) tilde(F)_p \( x \)|)^2 lt.eq p thin parallel mu_p - U_(S_p) parallel_2^2 . $

Consequently (2.7) bounds the sum of these squared errors with weight $\( log p \) \/ p$ by $O \( L \)$. The total such weight on the block is $O \( h \)$, so its weighted sum of absolute errors is $O \( sqrt(L h) \) = o \( h \)$. The favorable uniform means, on the other hand, have a positive sum of order $h$. Partitioning by the integer translates of $phi$, and deleting the bounded-width end strips, therefore supplies a cell with a positive average empirical mean. Replacing $\( log p \) \/ p$ by $1 \/ p$ in this cell does not change this conclusion: the log coordinate has relative variation $o \( 1 \)$, and the same error bound applies. This proves (7.2).

Fix this $G$. Write

#[#set math.equation(numbering: n => "(7.3)")
 $ Z_G = sum_(p med upright("prime")) frac(phi \( log p - G \), p) \, #h(2em) mu_G \( p \) = frac(phi \( log p - G \), p Z_G) \, #h(2em) c_g = log Z_G^(- 1) . $ <eq:construction-giant-prior>]

We have $Z_G tilde.op G^(- 1)$, and hence $c_g = log G + O \( 1 \) lt.eq .91 L$ for sufficiently large $L$. The coefficient in this last bound is independent of the gap constants and of $k$.

=== 7.2 The initial lists and positive statistic <the-initial-lists-and-positive-statistic>

A #emph[half-list] consists of the following independent positions:

+ one giant with prior $mu_G$, using the test $tilde(F)_p$;
+ $m \/ 2$ bulk positions, with their common prior proportional to $1 \/ p$ on $.004 L lt.eq log log p lt.eq .006 L$, omitting $cal(E)_L$;
+ $m \/ 2$ spectator positions, with their common prior proportional to $1 \/ p$ on a subset of $.0005 L lt.eq log log p lt.eq .001 L$ of harmonic mass $gt.double L$, omitting $cal(E)_L$, on which (4.16) holds uniformly with a bound tending to zero;
+ three top positions and two compensation positions of each type $j = 1 \, dots.h \, k$, with cell priors chosen below.

Every nongiant position uses the exact test $F_p$. The spectator subset exists by Corollary 10; its exceptional threshold can be chosen slowly enough that all the stated conclusions hold uniformly on the retained subset. The bulk and spectator harmonic normalizing masses are both between fixed positive multiples of $L$.

Let $S_b \, S_d$ be the sums of the log primes at the bulk and spectator positions of one half-list. Include in its weight the two factors

$ phi \( S_b - t_b \) phi \( S_d - t_d \) . $

These are weights, not conditioning of any prior. Choose integer centers $t_b \, t_d$ so that, for each of the two groups, the expectation of its cutoff together with the restriction $1 \/ 3 lt.eq sigma_p lt.eq 2 \/ 3$ at all its positions is at least $e^(- C m)$. Such choices follow directly from the partition of unity. Almost all the probability of a single position is balanced, by (4.16) or (2.7); for sufficiently large $L$ the probability that all positions in that group are balanced is at least $2^(- m \/ 2)$. Each possible log sum lies in an interval admitting at most $exp \( O \( L \) + O \( log m \) \)$ relevant integer centers. At least one center thus has the required weighted mass. In particular,

$ t_b \, t_d = o_k \( h \) . $

Call the bulk and top positions #emph[protected]. For the full list of two half-lists, define the target log sum $J$ for the protected positions and the target log sum $w_j$ for compensation type $j$ by

#[#set math.equation(numbering: n => "(7.4)")
 $ J = frac(log X - 2 G - 2 t_d + Delta_0 + sum_(j = 1)^k Delta_j, 2^k) \, #h(2em) w_j = J + sum_(i > j) w_i - Delta_j / r_j . $ <eq:src45>]

The second definition is made successively for $j = k \, k - 1 \, dots.h \, 1$. It gives

$ J asymp h \, #h(2em) w_j = \( 2^(k - j) + o_k \( 1 \) \) J \, #h(2em) J + sum_(j = 1)^k w_j = 2^k J - sum_(j = 1)^k Delta_j . $

Choose the three top cell centers in a fixed small relative neighborhood of $\( J - 2 t_b \) \/ 6$, with their sum equal to $\( J - 2 t_b \) \/ 2 + O \( 1 \)$. For the two positions of type $j$, choose centers in a corresponding neighborhood of $w_j \/ 4$, with sum $w_j \/ 2 + O \( 1 \)$. Neighborhoods of relative radius $.03$ suffice to keep different compensation types, top positions, bulk positions, spectator positions, and giants in pairwise disjoint prime ranges.

All these top and compensation centers can be chosen so that the balanced primes have a fixed positive fraction of the cell prior. Indeed, these primes also lie below the cutoff in (2.7). A cell in which a fixed positive fraction is unbalanced contributes a fixed positive amount to the nonnegative imbalance term in that estimate. Since the translates of $phi$ sum to one, only $O \( L \)$ integer centers can fail the desired balanced-fraction condition. Each neighborhood available here has length comparable to $h$, which is much larger than $L$. For a prescribed rounded pair sum, exclude a bad center and its reflection about that sum; this excludes only $O \( L \)$ choices. For a triple, choose the first two centers in slightly smaller neighborhoods. Among the resulting pairs only an $O \( L \/ h \)$ fraction have a bad third center determined by the rounded sum. This gives the required centers while respecting all ranges. On the bulk cutoff, the protected log sum of each half-list is now $J \/ 2 + O \( 1 \)$.

Let $T \( n \)$ be the expectation over one half-list of the product of all its tests at $n$, multiplied by the two log-sum cutoffs. For $a in A'$, every exact local test is

$ F_p \( a \) = sqrt(frac(1 - sigma_p, sigma_p)) > 0 . $

This value is independent of the choice of $a in A'$: all these primes are sufficiently small for the defining residue restriction on $A$ to apply. The expectation of the product of exact tests and the cutoffs is therefore a positive scalar $c_L$, independent of $a$, with $c_L gt.eq e^(- C m)$. This lower bound follows by restricting every nongiant position to balanced primes; each local value is at least $2^(- 1 \/ 2)$, and the preceding bin and cell choices give the required mass. Thus

$ T \( a \) = c_L bb(E)_(p tilde.op mu_G) tilde(F)_p \( a \) . $

Take the nonnegative Schwartz function $psi$ used in the quadratic argument, with compactly supported smooth Fourier transform and a positive lower bound on $\[ 0 \, 1 \]$. The tests are real, so $T \( n \)^2$ is nonnegative. Equation (7.2), Jensen’s inequality on $A'$, and the lower bound in (2.4) give

#[#set math.equation(numbering: n => "(7.5)")
 $ I := sum_(n in bb(Z)) psi \( n \/ X \) T \( n \)^2 gt.eq sqrt(X) thin e^(- C m) . $ <eq:src46>]

The logarithmic loss in $\| A' \|$ is absorbed here because $log log X = O \( L \)$ and $m asymp k^4 L$. Notice that this argument uses the mean of the giant test and its square; it does not require the giant test to be pointwise nonnegative.

=== 7.3 Removing repeated primes and applying Poisson summation <removing-repeated-primes-and-applying-poisson-summation>

Expand $T \( n \)^2$ using two independent half-lists. Let $M$ be the product of all positions, counted with multiplicity. On the cutoff support,

$ log M = 2 G + 2 t_d + J + sum_(j = 1)^k w_j + O_k \( 1 \) = log X + Delta_0 + O_k \( 1 \) . $

We may discard the tuples with repeated prime values, with a negligible error relative to (7.5). We give the estimate because no cancellation estimate for repeated local factors is being assumed.

For a tuple containing a repetition, the product of its distinct primes, denoted $Q$, satisfies

$ Q lt.double_k X e^(Delta_0) \/ exp \( exp \( .0005 L \) \) = o \( X \) . $

The product of the local tests is periodic modulo $Q$. Compact Fourier support of $hat(psi)$ implies that its smoothed sum is exactly $X hat(psi) \( 0 \)$ times its residue mean, for sufficiently large $L$. If any prime occurs once, that residue mean is zero by the mean-zero property of its test and CRT. If a prime occurs with multiplicity $e gt.eq 2$, its contribution to the absolute residue mean is at most $p^(e \/ 2 - 1)$. Indeed every local test has probability $L^2$ norm at most one, hence supremum at most $sqrt(p)$; apply Cauchy–Schwarz to two factors and use the supremum bound for the others. This argument also covers factors assigned different roles at the same prime.

The probability of any prescribed ordered tuple is at most

$ M^(- 1) L^(- 2 m) exp \( C m + O_k \( 1 \) \) . $

There are $2 m$ broad-band positions. Each contributes a normalization of size at most $C \/ L$. The remaining $4 k + 8$ cell positions have combined normalization at most $exp \( O \( k L \) + O_k \( 1 \) \)$, which is $exp \( C m + O_k \( 1 \) \)$ with $C$ independent of large $k$ because $m asymp k^4 L$. Since $product_(p divides Q) p^(e_p \/ 2 - 1) = M^(1 \/ 2) \/ Q$, the absolute contribution of tuples in which every prime occurs at least twice is at most

$ sqrt(X) exp \( - Delta_0 \/ 2 + C m + O_k \( 1 \) \) L^(- 2 m) sum_(upright("tuples")) frac(1, product_(p med upright("distinct")) p) . $

Put $b = 2 m + 4 k + 8$. The harmonic mass of the union of all prime ranges is $O \( L \)$. Assigning the $b$ labeled positions to $i$ distinct values, and then dropping restrictions for an upper bound, gives

$ sum_(upright("tuples")) frac(1, product_(p med upright("distinct")) p) lt.eq sum_(i = 1)^b frac(i^b \( C L \)^i, i !) lt.eq b^b e^(C L) . $

Thus the repeated-prime contribution is bounded by

$ sqrt(X) exp (- Delta_0 / 2 + \( 2 log z + C \) m + o_k \( m \)) . $

Choosing $B_s$ sufficiently large makes this negligible in (7.5). The constant required here is independent of the later gap constants and of sufficiently large $k$.

Retain only tuples with all positions distinct, and let $eta_0$ be their Poisson expression divided by $sqrt(X)$. We have shown that

#[#set math.equation(numbering: n => "(7.6)")
 $ \| eta_0 \| gt.eq e^(- B_(*) m) $ <eq:src47>]

for a fixed $B_(*)$ independent of $B_D \, B_z$ and $k$. The same $B_(*)$ may be used for all sufficiently large admissible $B_s$.

=== 7.4 Templates, coefficients, and support conventions <subsec:coefficient-support>

Keep the $m$ spectator positions of the two half-lists, with their original half-list roles, as one outside list $upright(bold(d))$, and write $d$ for their product. This list will never be duplicated. All other positions form the ordered regular template $cal(I)_0$; its two giants are labeled $+$ and $-$ in a fixed order.

At step $j$, split $cal(I)_(j - 1)$ into the pivot positions and the remaining template $H$. The pivot product is $P = p u$, where $p$ is the $+$ giant and $upright(bold(u))$ is the ordered list of all current compensation positions of type $j$, with product $u$. Unlike the whole-pivot extension in Section 4, here only the giant $p$ will be extended to positive integers. The entries of $upright(bold(u))$ retain their actual-prime priors. Thus $H$ contains the other giant, all protected positions, and all positions of types $i > j$. Form $cal(I)_j = \( H_(+) \, H_(-) \)$ from two copies of $H$, labeling their giants $+$ and $-$, respectively. Whenever a template or a part of one is sampled, its positions have independent copies of their specified priors.

Before step $j$, there are $r_j$ copies of the full protected list of two half-lists, and $r_j$ copies of each compensation type not yet removed. In particular $upright(bold(u))$ has $4 r_j$ positions. On the inherited protected bins,

#[#set math.equation(numbering: n => "(7.7)")
 $ log u & = r_j w_j + O_k \( 1 \) \,\
log H & = T_H + O_k \( 1 \) \, #h(2em) T_H = G + r_j (J + sum_(i > j) w_i) = G + r_j w_j + Delta_j . $ <eq:src48>]

Here a template and its product are denoted by the same letter only when no confusion can result.

If $R$ is the product of distinct actual regular prime values, put

$ G_R \( b \) = product_(ell divides R) g_ell^(upright("reg")) #scale(x: 120%, y: 120%)[\(] b \/ \( R \/ ell \) med mod med ell #scale(x: 120%, y: 120%)[\)] \, $

where $g_ell^(upright("reg")) = tilde(g)_ell$ on a giant position and $g_ell^(upright("reg")) = g_ell$ on every small regular position. Field fractions always have unit denominators. This expression is used only on the pairwise coprime support, and is extended by zero when that support fails. The amplitudes will have the form

#[#set math.equation(numbering: n => "(7.8)")
 $ eta_l = bb(E)_(upright(bold(d)) \, cal(I)_l) sum_(0 < \| s \| lt.eq V_l) G_R \( s \/ d \) A_l \( s \) \, #h(2em) R = product cal(I)_l . $ <eq:src49>]

The factor $G_R \( s \/ d \)$ depends on the actual regular prime values and their product, so it is unchanged when the bulk values are reassigned among their positions. The coefficient $A_l$ will contain the spectator factors and all arrangement-dependent history weights and support conditions. This separates the common factor from the coefficient to be averaged over arrangements. The outer positions in this expectation are actual primes. The coefficient $A_l$, unlike $G_R$, will also be defined when its two giant entries are positive integers.

We specify all its support conventions. A history is a full binary tree of depth $l$, with leaves at level zero. Each node at level $i$ has a nonzero signed integer frequency of magnitude at most $V_i$. At every state in a history require pairwise coprimality of all its current slots and the outside list $upright(bold(d))$. Its two current giant values must also be units against #emph[every] frequency at that node or below it. These last restrictions may always be added at an actual top, without changing an expression: actual giant primes exceed every frequency in any of the finitely many possible history levels. Once added, they are kept when a giant is extended to an integer. These requirements are imposed termwise on complete histories; they include cross-branch frequency tests for either current giant. A newly inserted pivot is a current giant in its child states, so it is subject to their subtree tests. Failed support conditions give zero.

At level zero set

#[#set math.equation(numbering: n => "(7.9)")
 $ A_0 \( s \) =  & (frac(X, d R))^(1 \/ 2) hat(psi) (- frac(s X, d R)) thin product_(upright("halves")) phi \( S_b - t_b \) phi \( S_d - t_d \)\
 & #h(13mm)  dot.op product_(q divides d) g_q #scale(x: 120%, y: 120%)[\(] s \/ \( \( d \/ q \) R \) med mod med q #scale(x: 120%, y: 120%)[\)] \, $ <eq:src50>]

on this support, and zero otherwise. The half-list spectator weights use the original outside roles of $upright(bold(d))$. Formula (7.8) with $l = 0$ is the distinct-tuple Poisson formula. Indeed the local inverse expansions contribute $\( d R \)^(- 1 \/ 2)$, and Poisson summation followed by division by $sqrt(X)$ gives the factor $sqrt(X \/ \( d R \))$ in (7.9). The zero frequency vanishes since the local transforms vanish at zero. On the cutoffs, $d R \/ X = exp \( Delta_0 + O_k \( 1 \) \)$; the additional $sqrt(m)$ in $E_0$ therefore accommodates the fixed compact support of $hat(psi)$.

For the recursive definition of $A_j$, a current state is $cal(I)_j = \( H_(+) \, H_(-) \)$ with root frequency $s$. Sum over $v \, w$ with $0 < \| v \| \, \| w \| lt.eq V_(j - 1)$, and independently sample the type-$j$ vector $upright(bold(u))$ by its priors. Restore the pivot by

#[#set math.equation(numbering: n => "(7.10)")
 $ p = frac(v H_(-) - w H_(+), s u) . $ <eq:src51>]

Retain it only if it is a positive integer. The two child states are copies of $cal(I)_(j - 1)$ with entries $\( p \, upright(bold(u)) \, H_(+) \)$ and $\( p \, upright(bold(u)) \, H_(-) \)$ in their prescribed roles. Their giant pairs, in order, are the inserted $p$ and the giant of $H_(+)$ or $H_(-)$, respectively. Keep the same outside list $upright(bold(d))$. Multiply the two child coefficients, conjugating the right one, by

#[#set math.equation(numbering: n => "(7.11)")
 $ u phi \( log p - G \) . $ <eq:src52>]

Sum and average these terms, imposing all the history restrictions above. In a formula, with state arguments displayed only here,

$ A_j \( s \; upright(bold(d)) \, H_(+) \, H_(-) \) = sum_(0 < \| v \| lt.eq V_(j - 1)\
0 < \| w \| lt.eq V_(j - 1)) bb(E)_(upright(bold(u))) #scale(x: 120%, y: 120%)[\[]  & u phi \( log p - G \) A_(j - 1) \( v \; upright(bold(d)) \, p \, upright(bold(u)) \, H_(+) \)\
 & dot.op overline(A_(j - 1) \( w \; upright(bold(d)) \, p \, upright(bold(u)) \, H_(-) \)) #scale(x: 120%, y: 120%)[\]] . $

The bracket is interpreted termwise after expanding the two child histories, and is zero unless (7.10) and all their support conditions hold. Internal samples in the two children are independent; only $upright(bold(u))$ at the present node is shared. This defines $A_l$ for actual or integer giant entries, and includes no transform attached to an integer giant.

Figure 2 records the dependencies in this recursion.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 14.82cm, inset: (x: 0.2117cm, y: 0.1764cm), radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Current state $cal(I)_j=(H_+,H_-)$, root frequency $s$#linebreak() Sum over $0<|v|,|w| lt.eq V_(j-1)$; sample one type-$j$ vector $bold(u)$.#linebreak() $ p= frac("vH"_- - "wH"_+, "su") , u= product_a u_a$#linebreak() Node factor, used once: $u phi ( log p-G)$]]])])
  content((-3.75, -1.708), [#box(width: 6.973cm, inset: (x: 0.2117cm, y: 0.1764cm), radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Left child $(p, bold(u) ,H_+)$#linebreak() $A_(j-1)(v; bold(d) ,p, bold(u) ,H_+)$]]])], anchor: "north")
  content((3.75, -1.708), [#box(width: 6.973cm, inset: (x: 0.2117cm, y: 0.1764cm), radius: 2pt, stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Right child $(p, bold(u) ,H_-)$#linebreak() $overline(A_(j-1)(w; d,p, u,H_-))$]]])], anchor: "north")
  line((0, -1.058), (0, -1.308), stroke: (thickness: 0.6pt, miter-limit: 10))
  line((0, -1.308), (-3.75, -1.308), (-3.75, -1.708), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  line((0, -1.308), (3.75, -1.308), (3.75, -1.708), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: (symbol: ")>", length: 0.2cm, fill: black)))
  content((0, -3.024), [#box(width: 14.8cm, inset: 0cm, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[The same $p$, $bold(u)$, and outside spectator list $bold(d)$ are used in both children.#linebreak() Retain only $p in bb(Z)_(>0)$; all support zero conventions of Subsection~7.4 apply.]]])], anchor: "north")
})],
  caption: [Figure 2: The coefficient recursion for $A_j \( s \)$: multiply the node factor by the two displayed child factors, with no prime-specific transform attached to the integer pivot $p$. Subsequent internal samples in the two descendants are independent in their underlying priors, before the complete-history support indicators are applied. ],
) <fig:transfer-recursion>

=== 7.5 The exact transfer and its diagonal <the-exact-transfer-and-its-diagonal>

We verify the relation between the successive expressions (7.8). Fix $upright(bold(d)) \, p \, upright(bold(u))$ at step $j$, put $P = p u$, and group old terms according to $t = v \/ H med \( mod med P \)$. On the original prime support,

$ G_(P H) \( v \/ d \) = G_P \( t \/ d \) G_H \( v \/ \( P d \) \) . $

Let

$ B_t = bb(E)_H sum_(0 < \| v \| lt.eq V_(j - 1)\
v \/ H equiv t med \( upright("mod") med P \)) G_H \( v \/ \( P d \) \) A_(j - 1) \( v \) \, $

with all inherited support conditions; invalid terms are zero. The extracted row has counting squared norm at most $P$:

$ sum_(t med mod med P) \| G_P \( t \/ d \) \|^2 lt.eq P . $

This is CRT and the exact probability squared norm one at each compensation prime, together with squared norm at most one at the giant. Cauchy–Schwarz in this row, followed by Jensen over the outer probability measures, yields

$ \| eta_(j - 1) \|^2 lt.eq bb(E)_(upright(bold(d)) \, p \, upright(bold(u))) P sum_(t med mod med P) \| B_t \|^2 . $

Crucially, $B_t$ contains no prime-specific transform of the pivot giant $p$. It is defined for a positive integer $p$ by exactly the same formulas, with the same coprimality and frequency filters. Equation (7.3) gives $p mu_G \( p \) = e^(c_g) phi \( log p - G \)$ at primes. Extending the nonnegative sum to all positive integers gives

#[#set math.equation(numbering: n => "(7.12)")
 $ \| eta_(j - 1) \|^2 lt.eq e^(c_g) bb(E)_(upright(bold(d)) \, upright(bold(u))) sum_(p in bb(N)) u phi \( log p - G \) sum_(t med mod med p u) \| B_t \|^2 . $ <eq:src53>]

Here the sum over $p in bb(N)$ means positive integers.

Expand the square using independent $H_(+) \, H_(-)$ and child frequencies $v \, w$. Separate the terms $v H_(-) = w H_(+)$ as the diagonal. For every other term, the congruence of the two group indices defines the nonzero signed integer $s = \( v H_(-) - w H_(+) \) \/ \( p u \)$, so the substitution is exactly (7.10). It is one-to-one, with $p$ still any positive integer in its cell. Equations (7.1) and (7.7) show

$ log \| s \| lt.eq E_(j - 1) + Delta_j + O_k \( 1 \) < E_j . $

The margin is $2^(j - 1) sqrt(m)$, which tends to infinity. All protected bins used in this size estimate are present in each nonzero child history.

The actual lists $H_(+) \, H_(-)$ cannot share a prime on such a term. If $ell$ divided both products, it would divide $s$, since it is coprime to $p u$; but $ell > \| s \|$. At a prime of $H_(+)$ and a prime of $H_(-)$, respectively, (7.10) gives

$ v \/ P = s \/ H_(-) \, #h(2em) - w \/ P = s \/ H_(+) . $

The inverse tests are real, so $g_ell^(upright("reg")) \( - b \) = overline(g_ell^(upright("reg")) \( b \))$. The two regular transforms therefore combine exactly into $G_(H_(+) H_(-)) \( s \/ d \)$. The remaining weights, histories, and inserted pivot are precisely the recursive definition of $A_j$. Additional giant-frequency tests at the new top are free because its two giants are actual primes. Consequently the off-diagonal part of the extended expression in (7.12), before $e^(c_g)$, is exactly $eta_j$.

Write $cal(D)_j$ for its exact diagonal. It is nonnegative, as we now verify, and we have

#[#set math.equation(numbering: n => "(7.13)")
 $ e^(- c_g) \| eta_(j - 1) \|^2 lt.eq cal(D)_j + eta_j . $ <eq:construction-transfer-split>]

In particular the off-diagonal expression $eta_j$ is real: the extended square and its diagonal are real.

On the diagonal, all prime factors of $H_(+)$ and $H_(-)$ exceed the frequencies, so $v H_(-) = w H_(+)$ forces $H_(+) = H_(-)$ as products and $v = w$. Grouping by this common product and frequency #emph[before] expanding the square gives a common factor $\| G_H \( v \/ \( p u d \) \) \|^2$ times the squared absolute value of the prior-weighted sum of coefficients over its ordered arrangements. This proves nonnegativity. The common factor is independent of the ordering: each prime uses the same local transform in every arrangement, and the single giant in $H$ is fixed by its disjoint range. We may therefore drop its bounded giant factor in this nonnegative expression. The remaining multiplier is

#[#set math.equation(numbering: n => "(7.14)")
 $ cal(G) = product_(ell divides H_(upright("sm"))) lr(|g_ell #scale(x: 120%, y: 120%)[\(] v \/ \( p u d \( H \/ ell \) \) med mod med ell #scale(x: 120%, y: 120%)[\)]|)^2 \, $ <eq:src54>]

where $H_(upright("sm"))$ consists of the small slots of $H$.

Now expand by bijections matching the slots in the two $H$ lists. This counts every ordered counterpart once, since the prime values within a valid $H$ are distinct. Only matches within the same prime band can occur. In particular the giant matches itself and bulk positions match bulk positions.

Fix a first ordered $H$. For any prescribed counterpart ordering, its point probability is $C_H \/ H$ times its smooth cell factors and its role-membership indicators. The normalizing constants satisfy

#[#set math.equation(numbering: n => "(7.15)")
 $ C_H lt.eq L^(- r_j m) exp \( C r_j m + O_k \( 1 \) \) . $ <eq:construction-counterpart-mass>]

Indeed there are $r_j m$ bulk positions, and $O \( k r_j \)$ cell positions. The latter normalizations cost $exp \( O \( k r_j L \) + O_k \( 1 \) \)$, absorbed uniformly by $exp \( C r_j m \)$ because $m asymp k^4 L$. On simultaneous coefficient support, (7.7) allows us to extract $C_H e^(- T_H)$, leaving $e^(T_H) \/ H = O_k \( 1 \)$. Normalize the external integer measure as

#[#set math.equation(numbering: n => "(7.16)")
 $ integral f \( p \) thin d mu_(upright("ext")) \( p \) := e^(- G) sum_(p gt.eq 1) phi \( log p - G \) f \( p \) . $ <eq:construction-external-measure>]

It has bounded total mass. Extracting $e^G$ from its definition and $e^(r_j w_j)$ from $u$ leaves the net scalar $C_H e^(- Delta_j)$. The remaining Archimedean factor is

$ K_(upright("ar")) = e^(T_H) / H u / e^(r_j w_j) product_(upright("counterpart cell positions")) phi \( log p_i - c_i \) . $

This factor is $O_k \( 1 \)$ on simultaneous coefficient support. Counterpart role-membership indicators are retained as zero conventions in addition to these displayed smooth factors.

=== 7.6 The two comparison estimates <the-two-comparison-estimates>

We state precisely the comparison estimates needed for the diagonal and the final symmetrization. Their proof occupies Section 8. At level $l$, put $r = 2^l$. Each coefficient $A_l$ has $r$ bottom leaves, each carrying the $m$ bulk positions of the initial full list. Its $m$ outside spectator positions are shared by all leaves.

There are two outer environments, always using the priors, integer extension, coefficients, and support conventions just defined.

+ In the #emph[final environment], $l = k$, the current list is $cal(I)_k$ with its actual prime priors. Set $cal(G) = 1$. A pair of assignments may permute all $r m$ bulk values among their labeled positions; the nonbulk positions and the outside spectator list are common. Set $K_(upright("ar")) = 1$.
+ In the #emph[diagonal environment] for step $j$, $l = j - 1$. The current $+$ giant $p$ has the external measure (7.16). All other current slots, including the type-$j$ vector $upright(bold(u))$, have their original actual prime priors. Set $cal(G)$ equal to (7.14) with $v = s$, with the zero convention on invalid top support. In a pair of assignments the first uses the ordered $H$ and the second uses a prescribed same-band matching of its slots, with $p \, upright(bold(u)) \, upright(bold(d))$ unchanged. Use the factor $K_(upright("ar"))$ above, including the counterpart role indicators. For the norm of a #emph[single] assignment this factor is omitted.

The expectation in the second environment includes the bounded-mass integer measure; it need not be a probability measure. All root-frequency sums below are over $0 < \| s \| lt.eq V_l$.

For a pair of assignments, form the bipartite multigraph whose two vertex sets are their respective $r$ bottom leaves. Each actual bulk variable is an edge joining the leaf that contains it in the first assignment to the leaf that contains it in the second. Every vertex has degree $m$. The graph and its number of connected components depend only on the slot assignments, not on the sampled prime values or on internal histories.

#thm([Proposition 7.1.])[
  (Comparison estimates).  #emph[In either of the two outer environments, the following estimates hold uniformly over the indicated assignments. For one assignment, 
#[#set math.equation(numbering: n => "(7.17)")
 $ bb(E) sum_(0 < \| s \| lt.eq V_l) cal(G) \| A_l \( s \) \|^2 lt.eq exp #scale(x: 120%, y: 120%)[\(] r \( Delta_0 + C m \) + o_k \( m \) #scale(x: 120%, y: 120%)[\)] . $ <eq:src55>]

 The constant $C$ is independent of sufficiently large $k$ and of the fixed gap budgets. For a pair of assignments, if $l gt.eq 2$ and its overlap graph has at most $3 r \/ 4$ connected components, then 
#[#set math.equation(numbering: n => "(7.18)")
 $ lr(|bb(E) sum_(0 < \| s \| lt.eq V_l) cal(G) K_(upright("ar")) A_l^(\( 1 \)) \( s \) overline(A_l^(\( 2 \)) \( s \))|) lt.eq exp \( - omega_k \( m \) \) . $ <eq:src56>]

 Here $omega_k \( m \) \/ m arrow.r oo$ as $L arrow.r oo$ for every fixed choice of the other parameters. Equivalently, the right side of (7.18) is smaller than $exp \( - C_k m \)$ for every fixed $C_k$ once $L$ is sufficiently large. The estimate is uniform in the allowed slot matchings and permutations.]
] <prop:comparisons>

The assumptions about all current-state coprimalities and all giant-frequency unit tests are part of this proposition. They are used in its arithmetic reduction, not additional conclusions of the estimate. The outside spectator list is not resampled within either coefficient or between a paired comparison. In contrast, the two coefficients have independent internal prime samples; within each coefficient, a sample at one node is shared by its two children as specified in (7.11). The assigned actual top values have the stated coupling between the coefficients. Coincidences among independently sampled internal prime values are allowed when the support permits them, and their equality patterns will be summed explicitly in the proof.

== 8 Arithmetic comparison of the histories <sec:arithmetic>

We prove Proposition 16. Throughout this section all the constants in the construction and the depth $k$ are fixed, and then $L$ tends to infinity. The notation, priors, templates, and support conventions are those of Section 7. At comparison level $l$ put $r = 2^l$. We treat both the final environment and the diagonal environment of Proposition 16; in the latter the positive giant is the external integer variable. All estimates below are uniform in the assignments being compared and in the permitted frequency histories.

The arithmetic reduction first integrates the top giants at the regular and internal small primes. After resolving the resulting internal-prime conditions, we replace the bulk primes by real log coordinates and independent unit residues, keeping the real weights and frequency tests. The paired estimate (7.18) then uses signed spectator correlations. For the norm estimate (7.17), we may take absolute values termwise, but must retain frequency divisibility to control the sum over histories.

=== 8.1 Histories, supports, and real-variable weights <histories-supports-and-real-variable-weights>

Expand the two amplitudes in a comparison into their frequency histories. For the norm estimate (7.17), use the same assignment in the two histories. At level $t gt.eq 1$ there are $2^(l - t)$ nodes in a history, and its sampled compensation vector has $4 dot.op 2^(t - 1)$ entries. Thus the total number of internal prime samples in the two histories is $O \( k r \)$. This counts each sample when it is made, rather than each subsequent occurrence of that sample in a descendant list.

Partition these samples according to their equality pattern. There are $O_k \( 1 \)$ patterns. Entries in a single compensation vector must be distinct, and the disjoint size ranges imply that equality is possible only between samples of the same compensation type. For each distinct internal sampled prime $b$, let $n_b$ be its multiplicity in the pattern. The product of the weights in (7.11) is then

$ product_b b^(n_b) . $

We retain all the other support restrictions for the moment.

Write $x_(+) \, x_(-)$ for the top giant entries. The negative giant $x_(-)$ is an actual prime in both environments; $x_(+)$ is a prime in the final environment and an external positive integer in the diagonal environment. Let $d$ be the product of the $m$ distinct spectator primes, and let $c_(upright("sm"))$ be the product of the distinct actual regular small primes at the top. The internal samples are disjoint from these primes by their types. Define

#[#set math.equation(numbering: n => "(8.1)")
 $ R_f = product_nu \| nu \| \, #h(2em) Q_f = R_f^(k + 2) \, #h(2em) log Q_f = O_k \( m \) \, $ <eq:arith-frequency-modulus>]

where the product includes every frequency in the two histories. Repetitions in this product are allowed. A modulus equal to one has its usual trivial interpretation. Every small prime in the construction is larger than every frequency and hence is coprime to $Q_f$.

At a reversing node write the two current giant entries as $X_(+) \, X_(-)$ and factor its child products as

#[#set math.equation(numbering: n => "(8.2)")
 $ H_(+) = X_(+) C_(+) M_(+) \, #h(2em) H_(-) = X_(-) C_(-) M_(-) . $ <eq:arith-child-products>]

Here $M_plus.minus$ are the products of the bulk slots in the respective child subtrees, and $C_plus.minus$ contain their other regular small factors. The latter may include compensation samples from preceding reversals on the path. Both current giants are rational linear functions of $x_(+) \, x_(-)$, by (7.10).

We first justify an exhaustive residue description of the support. Assume temporarily that the top giants are coprime and that both are units modulo $c_(upright("sm")) d$. Suppose that a current state is pairwise coprime. At its reversal the numerator is

#[#set math.equation(numbering: n => "(8.3)")
 $ N = v H_(-) - w H_(+) \, #h(2em) p = frac(N, s u) . $ <eq:arith-numerator>]

Every prime divisor of $H_(+)$ is coprime to $H_(-)$ and to $v$: for an actual small prime this follows by size, and for a giant factor it is one of the giant–frequency unit conditions. Hence $N$ is a unit at every prime factor of $H_(+)$. The same argument, interchanging the two sides, applies to $H_(-)$. If $p$ is integral, it follows from $N = s u p$ that both $p$ and $u$ are automatically coprime to every inherited slot in $H_(+) H_(-)$. In particular, a new compensation sample cannot divide an inherited giant. To obtain a pairwise-coprime child state, it remains only to require that $p$ be a unit against its own $u$ and against $d$.

The following tests therefore describe all the remaining arithmetic support:

+ Modulo frequency factors, impose $s divides N$ at every node and impose all giant–frequency unit conditions. These tests are determined by the top and small coordinates modulo $Q_f$. Division by a node frequency loses at most one factor $R_f$ of precision; the $u$’s are units modulo $Q_f$. At most $k$ successive divisions occur, so (8.1) leaves enough precision for every subsequent test.
+ For each $b divides u$ at a node, require
  #[#set math.equation(numbering: n => "(8.4)")
   $ N equiv 0 med \( mod med b \) \, #h(2em) N equiv.not 0 med \( mod med b^2 \) . $ <eq:arith-internal-tests>]
  The entries of the current $u$ are distinct and are coprime to $s$, so these are exactly its remaining integrality and own-$u$ unit requirements. Ancestor denominators involve other compensation types and frequencies; they are units even modulo $b^2$. Thus the tests can also be computed directly from the rational expressions in the top giants.
+ Require the top giant units modulo $c_(upright("sm")) d$. At each spectator $q divides d$, use the zero convention in (6.2) whenever an inserted giant vanishes modulo $q$.

These tests, together with positivity and the real cutoffs, agree with ordinary recursive evaluation over the integers. Indeed, assuming the ancestors have already been evaluated integrally, the first two tests give divisibility by the relatively prime factors $s$ and $u$. The preceding coprimality argument then passes the required support to the children. This proves the assertion by induction down the tree.

At a spectator $q$, put $D' = d \/ q$. Formula (8.2), the order of the child giants, and (7.10) identify the spectator factors from a history with the tree value in (6.2). In particular, if the bulk product at leaf $i$ is $M_i$, the constants at a child have the product consistency required in that formula. Denote the two tree values by $W_(1 \, q) \, W_(2 \, q)$. Their combined spectator factor is

#[#set math.equation(numbering: n => "(8.5)")
 $ product_(q divides d) W_(1 \, q) overline(W_(2 \, q)) . $ <eq:arith-spectator-product>]

The zero convention incorporates precisely the inserted-giant unit tests at $q$.

Let $Xi$ denote the product of all smooth real factors in the two histories, including $K_(upright("ar"))$ when it is present, but excluding $product_b b^(n_b)$. Define it for real positive top and small variables by using (7.10) over $bb(R)$. Set the contribution to zero if an inserted $p$ is nonpositive. This is a smooth extension: the factor $phi \( log p - G \)$ already vanishes for $p < e^(G - 1)$. Counterpart role indicators involving nonbulk slots are retained as restrictions on those variables; all bulk priors and their role ranges are identical, so no such indicator cuts a bulk log coordinate.

There are $r$ leaf factors in each history. On their common support, the modulus in each instance of (7.9) has logarithm $log X + Delta_0 + O_k \( 1 \)$. This follows from the giant cutoffs, all the specified small-prime ranges, and both sum bins at that leaf. Consequently

#[#set math.equation(numbering: n => "(8.6)")
 $ \| Xi \| lt.eq e^(- r Delta_0 + O_k \( 1 \)) . $ <eq:arith-xi-bound>]

Its first derivatives in the log coordinates of the top giants and bulk slots are bounded by $exp \( O_k \( m \) \)$. To check the possible cancellation in (8.3), use (7.7) at each subtree. Each of $\| v H_(-) \|$ and $\| w H_(+) \|$, divided by $\| s \| u p$, is at most

$ exp \( Delta_j + E_(j - 1) + O_k \( 1 \) \) $

at a node of level $j$. The depth is bounded by $k$, so repeated logarithmic differentiation along a path costs $exp \( O_k \( m \) \)$. The remaining cutoffs, the bounded Fourier arguments in the leaf factors, and $K_(upright("ar"))$ satisfy the same bound. The bounds extend over support boundaries: any problematic nonpositive inserted value lies outside the giant cutoff, where the smooth extension is zero. We use the actual prior ranges as integration domains, so no extra discontinuous real indicator is needed.

=== 8.2 A progression estimate retaining the exceptional term <a-progression-estimate-retaining-the-exceptional-term>

We record the precise approximation needed for the two successive idealizations. In the following table, either row may be used:

#[#set math.equation(numbering: n => "(8.7)")
 $ & a_0 & a_1 & mu & delta & delta' & theta\
upright("giant") & .049 & .95 & .012 & .015 & .018 & .022\
upright("bulk") & .0039 & .007 & .0012 & .0014 & .0016 & .0018 $ <eq:arith-progression-scales>]

#thm([Lemma 8.1.])[
  #emph[Fix a row of (8.7). There is at most one primitive real character $chi_(*)$, with conductor at most $exp \( exp \( mu L \) \)$, and one associated real zero $beta_(*) < 1$ which must be retained in the following formula. If 
$ log M_(*) lt.eq e^(mu L) \, #h(2em) \( a \, M_(*) \) = 1 \, $

 and $I$ is an interval of length at most one in $\[ e^(a_0 L) \, e^(a_1 L) \]$, then 
#[#set math.equation(numbering: n => "(8.8)")
 $ sum_(p med upright("prime") thin \, med log p in I\
p equiv a med \( mod med M_(*) \)) 1 / p = frac(1, phi.alt \( M_(*) \)) integral_I #scale(x: 120%, y: 120%)[\(] 1 - chi_(*) \( a \) e^(\( beta_(*) - 1 \) t) #scale(x: 120%, y: 120%)[\)] frac(d t, t) + O #scale(x: 120%, y: 120%)[\(] exp \( - c e^(delta' L) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:src57>]

 The exceptional term is omitted if no such character exists or its conductor does not divide $M_(*)$. The implied constant is absolute for the fixed row. The multiplier inside the integral lies in $\[ 0 \, 2 \]$.]
] <lem:arith-progression>

#proof[
  Put $Q = exp \( e^(mu L) \)$ and $S = exp \( e^(theta L) \)$. The classical zero-free region and Page’s theorem give, simultaneously for primitive conductors up to $Q$ and ordinates of absolute value at most $S$,
  #[#set math.equation(numbering: n => "(8.9)")
   $ 1 - Re rho gt.eq c_0 e^(- theta L) \, $ <eq:arith-zero-free>]
  apart from at most one simple real zero of a primitive real character. One may take for $chi_(*)$ the character of a zero in this latter narrow region, if there is one. This follows from #cite(label("MontgomeryVaughan2007")) Theorem 11.3 and Corollary 11.10; the analogous zero-free statement for $zeta$ has no exception. We also use the standard zero count $N \( T \, chi \) lt.double T log \( q \( T + 2 \) \)$ for primitive conductor $q$; see #cite(label("Helfgott")) Section 3.7.3.
  Here are details giving the required short-interval precision. Let $t_0$ be the left endpoint of $I$, put $y = e^(t_0)$, and set $epsilon.alt = exp \( - e^(delta' L) \)$. Sandwich the indicator of the corresponding interval in the variable $u = n \/ y$ between smooth nonnegative functions $f_(-) \, f_(+)$ supported in $\[ 1 \/ 2 \, 4 \]$. They may be chosen with
  $ integral \( f_(+) - f_(-) \) thin d u = O \( epsilon.alt \) \, #h(2em) parallel f_plus.minus^(\( j \)) parallel_oo lt.double_j epsilon.alt^(- j) . $
  This remains possible when the interval is shorter than $epsilon.alt$, by taking the lower function zero. For either smooth function let
  $ F \( u \) = frac(f \( u \), u log \( y u \)) \, #h(2em) cal(M) F \( s \) = integral_0^oo F \( u \) u^(s - 1) thin d u . $
  For a primitive character $chi$, Mellin inversion and a contour shift give
  #[#set math.equation(numbering: n => "(8.10)")
   $ 1 / y sum_(n gt.eq 1) Lambda \( n \) chi \( n \) F \( n \/ y \) = upright(bold(1))_(chi = 1) integral_0^oo F \( u \) thin d u - sum_rho y^(rho - 1) cal(M) F \( rho \) + O #scale(x: 120%, y: 120%)[\(] y^(- 1 + o \( 1 \)) #scale(x: 120%, y: 120%)[\)] . $ <eq:arith-smoothed-explicit>]
  The sum is over nontrivial zeros. For completeness, shift the Mellin integral of $- L' \/ L$ to real part $- 1 \/ 2$, taking limits through heights avoiding zeros. The functional equation bounds the logarithmic derivative on that line by $O \( log \( q \( \| t \| + 2 \) \) \)$. Mellin decay makes the shifted integral convergent and bounded by a fixed power of $epsilon.alt^(- 1)$ times $y^(- 3 \/ 2) log \( q + 2 \)$; a possible residue at zero costs $y^(- 1)$ times such a factor. Because $a_0 > delta'$, these bounds have the stated size. The pole and zero residues are exactly those displayed in (8.10). This is the usual explicit-formula argument underlying #cite(label("MontgomeryVaughan2007")) Theorem 11.16.
  On $0 lt.eq Re s lt.eq 1$, integration by parts gives, for fixed $j$,
  #[#set math.equation(numbering: n => "(8.11)")
   $ \| cal(M) F \( s \) \| lt.double 1 \, #h(2em) \| cal(M) F \( s \) \| lt.double_j epsilon.alt^(- O \( j \)) \( 1 + \| Im s \| \)^(- j) . $ <eq:arith-mellin-decay>]
  The nonexceptional zeros of height at most $S$ therefore contribute at most
  #[#set math.equation(numbering: n => "(8.12)")
   $ exp #scale(x: 120%, y: 120%)[\(] - c e^(\( a_0 - theta \) L) + e^(theta L) + O \( L \) #scale(x: 120%, y: 120%)[\)] . $ <eq:arith-low-zero-error>]
  For the giant row $a_0 - theta = .027 > .022 = theta > delta'$, and for the bulk row $a_0 - theta = .0021 > .0018 = theta > delta'$. Thus (8.12) is smaller than the required error. For zeros above $S$, dyadic summation of the zero count and (8.11) gives
  $ exp #scale(x: 120%, y: 120%)[\(] C_j e^(delta' L) - \( j - 1 \) e^(theta L) + O \( L \) #scale(x: 120%, y: 120%)[\)] \, $
  which is also sufficient, since $delta' < theta$.
  For a prime $n = p$, the summand $Lambda \( p \) F \( p \/ y \) \/ y$ is $f \( p \/ y \) \/ p$. Prime powers of higher exponent give $y^(- 1 \/ 2 + o \( 1 \))$. Passing from an induced character modulo $M_(*)$ to its primitive character changes only the prime powers at prime divisors of $M_(*)$ and gives a negligible error as well. Orthogonality of the characters modulo $M_(*)$ now selects the residue class $a$; its factor $1 \/ phi.alt \( M_(*) \)$ cancels the number of character errors. The possible exceptional primitive character occurs among these induced characters precisely when its conductor divides $M_(*)$.
  Under $u = e^(t - t_0)$, the principal integral becomes $f \( e^(t - t_0) \) thin d t \/ t$. The exceptional zero term becomes
  $ f \( e^(t - t_0) \) e^(\( beta_(*) - 1 \) t) frac(d t, t) . $
  In particular no factor $beta_(*)$ is left over. Equivalently, this follows by differentiating the exceptional Chebyshev term $- chi_(*) \( a \) y^(beta_(*)) \/ \( beta_(*) phi.alt \( M_(*) \) \)$; see #cite(label("MontgomeryVaughan2007")) Corollaries 11.17 and 11.20. The resulting density is nonnegative and at most $2 thin d t \/ \( phi.alt \( M_(*) \) t \)$. The upper and lower smooth tests therefore differ in their main integrals by $O \( epsilon.alt \)$, and their pointwise sandwich on the positive prime measure proves (8.8). ◻
]

For each row, choose the possible exceptional character in Lemma 17 before fixing the nongiant priors. If its conductor has a prime factor at least

#[#set math.equation(numbering: n => "(8.13)")
 $ T_(*) = exp \( e^(.0004 L) \) \, $ <eq:arith-deletion-threshold>]

delete one such prime value from every nongiant prior. This prescribes at most two deletions, as allowed in the construction. Every prime factor of the moduli below outside $Q_f$ exceeds $T_(*)$, whereas every prime factor of $Q_f$ is smaller than $T_(*)$ by (8.1). Hence if an exceptional conductor still divides one of these moduli, its full conductor divides $Q_f$. Indeed, a selected large prime factor has been excluded, and otherwise all conductor prime factors must lie in the $Q_f$ part; coprimality with the other parts also accounts for their exponents. Thus every surviving Page correction depends only on the real coordinate and the $Q_f$ residue. It does not couple any of the other CRT coordinates.

=== 8.3 Idealization of the top giants <idealization-of-the-top-giants>

Condition on all actual small primes, including the internal samples in both histories. At fixed frequencies, the logarithm of the product of their large weights and all pointwise transform bounds is at most $e^(.012 L)$ for large $L$. More explicitly, the regular and internal small-prime products have logarithms

#[#set math.equation(numbering: n => "(8.14)")
 $ O_k \( e^(.01 L) \) + O_k \( m e^(.006 L) \) \, $ <eq:arith-small-size-budget>]

and the spectator products have still smaller logarithms. Use $\| g_ell \| lt.eq sqrt(ell)$ and $\| tilde(g)_ell \| lt.eq 1$ for their local pointwise bounds. All the factors $product b^(n_b)$ are included in this estimate.

We may now remove the temporary assumption that the two top giants are coprime, using the residue description just obtained as the extension. In the prime environment the discrepancy is equality of the two primes; its probability is at most $e^(- G + O \( L \))$. In the external-integer environment, a fixed prime $x_(-)$ has only $O \( 1 \)$ positive multiples in the log cell for $x_(+)$, and their normalized total mass is $O \( e^(- G) \)$. Multiplying by the preceding pointwise bound is harmless, because $G gt.eq e^(.049 L)$.

Use the modulus

#[#set math.equation(numbering: n => "(8.15)")
 $ M_(*) = c_(upright("sm")) d Q_f product_b b^2 . $ <eq:arith-giant-modulus>]

Its factors are pairwise coprime, and (8.14) gives $log M_(*) lt.eq e^(.012 L)$. The giant log cells lie in $\[ e^(.049 L) \, e^(.95 L) \]$, by their selection from (5.1). Lemma 17, with the original cell cutoff and normalization, replaces each top prime by a real log coordinate and a Haar-unit residue modulo $M_(*)$. Its density is the principal harmonic density times the correction in (8.8). For an external integer the analogous replacement uses

#[#set math.equation(numbering: n => "(8.16)")
 $ e^(t - G) phi \( t - G \) thin d t $ <eq:arith-external-density>]

and uniform residues on all classes modulo $M_(*)$. Elementary counting of integers in a progression gives this replacement with error $e^(- G + O \( L \))$ per interval and residue. The total ideal measure of each coordinate is bounded. A prime cell’s normalizing reciprocal costs only $exp \( O \( L \) \)$.

We give a joint error estimate so that no conditional equidistribution is implicit. Partition both log cells using mesh $eta_g = exp \( - e^(.015 L) \)$ and freeze the smooth factor $Xi$ in each box. All other tests at fixed small variables and frequencies are residue tests. The variation error, including the pointwise costs above, is bounded by

$ exp #scale(x: 120%, y: 120%)[\(] - e^(.015 L) + O \( e^(.012 L) \) + O_k \( m \) #scale(x: 120%, y: 120%)[\)] . $

The logarithm of the total number of boxes and pairs of residue classes is $O \( e^(.015 L) + e^(.012 L) \)$. Thus the absolute interval errors from the giant row of (8.8), even summed over all these boxes and classes and multiplied by the pointwise bound, contribute at most

$ exp #scale(x: 120%, y: 120%)[\(] - c e^(.018 L) + O \( e^(.015 L) \) + O \( e^(.012 L) \) + O_k \( m \) #scale(x: 120%, y: 120%)[\)] . $

The integer-coordinate errors have the still stronger negative term $- G$. It follows that the whole giant replacement has uniform error

#[#set math.equation(numbering: n => "(8.17)")
 $ O #scale(x: 120%, y: 120%)[\(] exp \( - e^(.013 L) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:arith-giant-error>]

The Page factors are part of the measures in this argument; they need not be frozen or differentiated.

=== 8.4 Integration of the actual and internal small-prime coordinates <integration-of-the-actual-and-internal-small-prime-coordinates>

In the ideal giant distribution, CRT separates its coordinates, and a surviving Page factor uses only $Q_f$. First integrate the giant coordinates modulo $c_(upright("sm"))$. In the diagonal environment, $x_(-)$ is already a unit there, and $x_(+)$ must be restricted from all classes to units. At $ell divides H_(upright("sm"))$ the argument of $g_ell$ in (7.14) is a fixed unit divided by $x_(+) x_(-)$. It is therefore uniform on the unit group once both giants are units. Since $g_ell \( 0 \) = 0$ and $bb(E)_(a med mod med ell) \| g_ell \( a \) \|^2 = 1$, the average of its squared modulus on units is $ell \/ \( ell - 1 \)$. Independence over $ell$ gives

#[#set math.equation(numbering: n => "(8.18)")
 $ frac(phi.alt \( c_(upright("sm")) \), c_(upright("sm"))) product_(ell divides H_(upright("sm"))) frac(ell, ell - 1) = product_(ell divides u_(upright("out"))) (1 - 1 / ell) \, $ <eq:src58>]

where $u_(upright("out"))$ is the actual outer compensation product of type $j$ in the diagonal environment. This factor is bounded by one and is independent of the bulk values. In the final environment the analogous integral equals one. The support descent proved above shows that no remaining test uses these giant coordinates modulo the actual regular small primes.

Fix now a distinct internal sampled prime $b$. Each of its occurrences requires a numerator in (8.3) to vanish modulo $b$. This numerator is a nonzero linear form in $\( x_(+) \, x_(-) \)$ modulo $b$. To see nonvanishing, along its ancestor path each substitution retains one giant entry and replaces the other by a linear combination with two unit coefficients. Its matrix is invertible modulo $b$, and the current numerator is itself a nonzero row applied to this pair. All coefficients are rational expressions in other small regular or internal primes and in the fixed frequencies. No variable of the same compensation type as $b$ is needed: that type has not yet appeared at any ancestor, and the current numerator does not contain the current $u$. This also holds across the two histories, and the ancestor transformations are invertible modulo $b^2$.

If the forms for all occurrences of $b$ have rank two, they have no solution under the sampled giant residues, because $x_(-)$ is a unit. In rank one, their common line has probability

#[#set math.equation(numbering: n => "(8.19)")
 $ cases(delim: "{", \( b - 1 \)^(- 1) \, & upright("both giants prime and both line coefficients nonzero") \,, b^(- 1) \, & x_(+) upright(" external and its coefficient nonzero") \,, 0 \, & upright("otherwise") .) $ <eq:arith-line-probabilities>]

For example, in the second case each of the $b - 1$ unit choices of $x_(-)$ determines one of the $b$ choices of $x_(+)$. These probabilities multiply over distinct $b$ by CRT.

Conditional on a rank-one solution modulo $b$, a forbidden zero modulo $b^2$ from (8.4) removes at most $1 \/ b$ of the uniform lifts: at least one coefficient of the form is a unit. A union bound over its occurrences gives a relative loss $O_k \( 1 \/ b \)$. To justify dropping these exclusions in the weighted expression, we first bound those weights. For a prime in a compensation log cell, every occurrence prior $mu_i$ satisfies $b mu_i \( b \) lt.eq e^(C L)$, with $C$ independent of $k$ once $L$ is sufficiently large. Thus, selecting any occurrence as representative,

$ (product_(i = 1)^(n_b) mu_i \( b \)) frac(b^(n_b), b - 1) lt.eq 2 mu_1 \( b \) e^(C \( n_b - 1 \) L) . $

Summing over the $O \( k r \)$ occurrences shows that the joint measure after integrating these line conditions is dominated by independent representative priors times

#[#set math.equation(numbering: n => "(8.20)")
 $ exp \( C k r L \) . $ <eq:src59>]

Restrictions that representatives be distinct can be discarded for this upper bound. The same domination holds in the external-integer case since $1 \/ b lt.eq 1 \/ \( b - 1 \)$.

After (8.18), the remaining large pointwise factor is the spectator product. Since there are $2 r$ leaf transforms at each spectator, its logarithm is at most

#[#set math.equation(numbering: n => "(8.21)")
 $ O_k \( m e^(.001 L) \) . $ <eq:arith-spectator-cost>]

Every internal $b$ satisfies $log b asymp_k e^(.01 L)$. The relative $O_k \( 1 \/ b \)$ losses, multiplied by (8.20), (8.21), and all $exp \( O_k \( m \) \)$ costs, are therefore negligible. We drop all the nonvanishing-modulo-$b^2$ exclusions henceforth.

=== 8.5 Removing arithmetic coincidences in the line conditions <removing-arithmetic-coincidences-in-the-line-conditions>

For the signed comparison (7.18) we need to remove dependence of the line probabilities on accidental bulk congruences. Fix the equality pattern among internal samples. Regard the remaining small-prime representatives and actual small primes as independent formal variables. For each $b$, clear the denominators in the coefficient-zero and two-by-two minor-zero tests for its forms. Those denominators are units modulo $b$. We obtain integer polynomials in the fixed frequencies and the formal variables, with no spectator variable and no variable of $b$’s compensation type.

The degree is $O_k \( m \)$. This follows inductively because each coefficient in a reversal is a product of a subtree’s small slots times a frequency, and there are only $k$ substitutions on any path. Clearing the products of ancestor denominators and forming a two-by-two minor preserves this bound. The same induction gives, whenever an evaluation is nonzero,

#[#set math.equation(numbering: n => "(8.22)")
 $ log \| P \| lt.eq e^(.012 L) $ <eq:arith-polynomial-size>]

for large $L$: the total degrees are $O_k \( m \)$, all small-prime logarithms are $O_k \( e^(.01 L) \)$, and the logarithms of the frequency coefficients are $O_k \( m \)$.

Replace each test by the question whether its polynomial is identically zero over $bb(Q)$. We quantify the error in this replacement under (8.20). If a polynomial of total degree $D$ in independent variables is not identically zero and each variable has maximal atom at most $alpha$, then

#[#set math.equation(numbering: n => "(8.23)")
 $ bb(P) \( P = 0 \) lt.eq D alpha . $ <eq:arith-polynomial-root-bound>]

This is a maximal-atom variant of the Schwartz–Zippel argument. Schwartz #cite(label("Schwartz1980")) Lemma 1, p. 702 gives the sharp total-degree estimate for uniform finite sets; Zippel #cite(label("Zippel1979")) §3.1, Theorem 1 gives related coordinate-degree zero estimates in sparse interpolation. Earlier random-evaluation identity testing appears in DeMillo and Lipton #cite(label("DeMilloLipton1978")). The proof below extends the uniform-finite-set argument to independent nonuniform laws; that extension is supplied here, not imported from these references. Indeed, write it as a polynomial of degree $d$ in its last variable, with nonzero leading coefficient of degree at most $D - d$. Induction bounds the probability that this coefficient vanishes by $\( D - d \) alpha$; otherwise there are at most $d$ roots in the last variable. This proves (8.23).

All variables occurring here are at least bulk size. Their maximal atoms are at most $exp \( - c e^(.004 L) \)$, so an accidental exact zero has probability at most $O_k \( m \) exp \( - c e^(.004 L) \)$. If the evaluation is nonzero, (8.22) implies that it has at most $e^(O \( L \))$ distinct prime divisors. The representative $b$ is independent of this evaluation, because its whole compensation type is absent from the polynomial. Its maximal atom is at most $exp \( - c_k e^(.01 L) + O \( L \) \)$, so the probability that it divides this nonzero evaluation is again negligible. A polynomial which is an identity vanishes modulo $b$ identically, because the cleared denominators are units.

The error bounds remain valid with the other support restrictions: for this purpose discard those restrictions and use the representative-prior domination. Both the original and the replaced line factors are bounded by $1 \/ \( b - 1 \)$, so the same domination applies to their difference. There are only $O_k \( 1 \)$ tests, and multiplying by the spectator bound (8.21) and all $exp \( O_k \( m \) \)$ factors still gives an error

#[#set math.equation(numbering: n => "(8.24)")
 $ O #scale(x: 120%, y: 120%)[\(] exp \( - e^(.002 L) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:arith-symbolic-error>]

We now integrate out the giant coordinates modulo each internal $b$. For (7.18) their contribution is its symbolic rank and feasibility flag times the appropriate scalar in (8.19). The flags depend on the formal pattern and frequencies, not on the sampled bulk values. The line itself leaves no further condition, since no other factor uses the giant coordinates at $b$ after its $b^2$ exclusions have been removed. Thus replacing the flags and integrating the line conditions removes all dependence on bulk residues modulo internal primes.

For (7.17) there is a simpler nonnegative upper bound. Take absolute values in the two-history expansion and replace every line probability by its upper bound $1 \/ \( b - 1 \)$ before using (8.20). In this estimate rank and feasibility flags are discarded; they do not remain as restrictions on the bulk variables. The symbolic replacement is needed for the signed comparison, but not for this upper bound.

We may also remove distinctness among the actual bulk samples in the simplified expressions. There are $r m = O_k \( m \)$ such samples, and their collision probability under independent priors is at most their number of pairs times their maximal point mass. Equations (8.20) and (8.21) show that the resulting error is bounded by (8.24). This step extends the already simplified formula; it does not attempt to use (8.18) with a nonsquarefree $c_(upright("sm"))$. Keep spectator distinctness and any restrictions involving only nonbulk variables.

=== 8.6 Joint idealization of the bulk variables <joint-idealization-of-the-bulk-variables>

The remaining dependence on actual bulk values is smooth in their log coordinates or occurs modulo $d Q_f$. No condition involving their residues at internal sampled primes or at actual regular small primes remains. Furthermore

#[#set math.equation(numbering: n => "(8.25)")
 $ log \( d Q_f \) = O_k \( m e^(.001 L) \) < e^(.0012 L) . $ <eq:arith-bulk-modulus>]

Use the bulk row of Lemma 17 to replace the $r m$ bulk priors by their real harmonic densities and Haar-unit residues modulo $d Q_f$, retaining the possible Page corrections. The actual range $e^(.004 L) lt.eq log p lt.eq e^(.006 L)$ is strictly inside the row’s permitted range. Its harmonic normalization is of order $L$. If a deleted prime lies in the bulk range, removing its single atom has negligible cost by the same maximal-atom estimate just used. Thus the approximation may use the all-prime formula, while keeping the given normalization constants.

Here too the approximation is joint. Let $N_b = r m$ and partition every bulk log range using mesh $eta_b = exp \( - e^(.0014 L) \)$. The logarithm of the number of joint boxes and joint residue classes is at most

#[#set math.equation(numbering: n => "(8.26)")
 $ O_k #scale(x: 120%, y: 120%)[\(] m \( e^(.0014 L) + L + log \( d Q_f \) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:arith-bulk-box-count>]

Freeze the smooth weight in each box. Equations (8.20) and (8.21) bound its remaining total or pointwise cost by $exp \( O_k \( m e^(.001 L) \) \)$. The derivative bound gives variation error at most

$ exp #scale(x: 120%, y: 120%)[\(] - e^(.0014 L) + O_k \( m e^(.001 L) \) + O_k \( m \) #scale(x: 120%, y: 120%)[\)] . $

For the interval errors, even summing over all the boxes and residues in (8.26) gives the upper bound

$ exp #scale(x: 120%, y: 120%)[\(] - c e^(.0016 L) + O_k \( m \( e^(.0014 L) + L + e^(.0012 L) \) \) + O_k \( m e^(.001 L) \) #scale(x: 120%, y: 120%)[\)] . $

Both are

#[#set math.equation(numbering: n => "(8.27)")
 $ O #scale(x: 120%, y: 120%)[\(] exp \( - e^(.00125 L) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:arith-bulk-error>]

The bounded masses of the other coordinates add only $exp \( O_k \( m \) \)$. In the main term their real distributions are integrated as measures; the box count is charged only to the approximation errors. There is therefore no box-count factor multiplying a main term.

For fixed $k$ the number of frequency histories is $exp \( O_k \( m \) \)$, because each frequency has bound $exp \( O_k \( m \) \)$ and there are $O_k \( 1 \)$ nodes. The number of equality patterns is $O_k \( 1 \)$. Thus (8.17), (8.24), and (8.27) remain negligible after the frequency and pattern sums. These errors are uniform for each comparison of assignments. All surviving Page multipliers are functions only of the real and $Q_f$ coordinates and are bounded by two per sampled prime.

=== 8.7 The signed comparison <the-signed-comparison>

We prove (7.18). Condition in the resulting main expression on the real coordinates, the $Q_f$ coordinates, the nonbulk prime values, and the top-giant residues. The bulk residues on $d$ are then independent Haar units. The only remaining factor using them is (8.5). In particular the support descent, (8.18), and the integrated symbolic line factors have left no additional bulk condition at the other small primes.

At a fixed $q divides d$, each bulk slot is an independent Haar unit. In either diagram its leaf products are marginally independent Haar units, because the leaves use disjoint nonempty sets of slots. Jointly, their law is exactly uniform on the subgroup specified by equality of the products in corresponding overlap components. To verify this, regard each bulk slot as an edge of the bipartite overlap multigraph. Its value contributes to the product at both endpoints. In each connected component the product of the left vertex products must equal the product of the right vertex products. Conversely, prescribe vertex products satisfying this relation, set the non-tree edges to one, and choose a spanning tree. Successively eliminate a terminal vertex by assigning its incident tree edge the value needed for that vertex. The last vertex is satisfied by the product relation. This proves surjectivity onto exactly the asserted subgroup. A homomorphism of finite groups sends the uniform distribution to the uniform distribution on its image, proving the claimed joint law.

All frequencies and nonbulk constants needed for Lemma 15 are units at $q$, and the ancestor and child relations are those of (6.2). The selected spectator primes satisfy (6.1) uniformly, with a bound tending to zero; their sizes tend to infinity uniformly as well. Therefore (6.4) provides a bound $epsilon.alt_k \( L \)$, where $epsilon.alt_k \( L \) arrow.r 0$, for the absolute correlation at every spectator, uniformly in the conditioned data. By CRT the bulk coordinates at distinct spectators are independent, so their combined bound is $epsilon.alt_k \( L \)^m$.

The remaining total costs, including the representative domination, bounded masses, and all frequency sums, are $exp \( O_k \( m \) \)$. Consequently

$ lr(|bb(E) sum_s cal(G) K_(upright("ar")) A_l^(\( 1 \)) \( s \) overline(A_l^(\( 2 \)) \( s \))|) lt.eq epsilon.alt_k \( L \)^m exp \( O_k \( m \) \) + O #scale(x: 120%, y: 120%)[\(] exp \( - e^(.00125 L) \) #scale(x: 120%, y: 120%)[\)] = exp \( - omega_k \( m \) \) \, $

as required in (7.18).

=== 8.8 The norm comparison and the frequency sums <the-norm-comparison-and-the-frequency-sums>

We finally prove (7.17). Use the nonnegative upper bound described above. At the $d$ coordinates, (6.3) and Cauchy–Schwarz bound the expectation of the absolute product of two tree values by $3^r$ for each spectator, hence by $3^(r m)$ in total. Retain the frequency divisibility conditions, and discard the Page multipliers at cost $2^(r m + O \( 1 \))$. The bulk coordinates modulo $Q_f$ are now independent Haar units for the upper bound.

Because the assignments agree, the bulk slots split into exactly the same subtrees in the two histories. Fix the other necessary residues. Expose the product of all bulk slots and then expose the products on successive subtree splits, proceeding from the root downwards. Conditional on a parent product, the product $M_(+)$ in one child is uniform on the unit group modulo $Q_f$, and $M_(-)$ is determined by $M_(+) M_(-)$. This follows directly from the product map on two disjoint collections of independent Haar units. Ancestor pivots in both histories depend only on previously exposed splits and are known with the precision supplied by (8.1).

We evaluate support indicators under this original Haar measure, without first conditioning on the validity of the complete histories. All frequencies are fixed at the outset. A current giant’s unit tests against descendant frequencies therefore depend only on already exposed data. Tests on a newly created pivot are evaluated after the split that creates it; tests on later pivots are deferred to their own splits, or discarded for this nonnegative upper bound. Thus the retained earlier tests do not select an unexposed split.

At a node, the support requires $X_plus.minus C_plus.minus$ to be units modulo its frequency. If that unit test fails we stop that branch, whose contribution is zero. Otherwise the condition

#[#set math.equation(numbering: n => "(8.28)")
 $ v X_(-) C_(-) M_(-) equiv w X_(+) C_(+) M_(+) med \( mod med \| s \| \) $ <eq:arith-square-congruence>]

requires $\( v \, s \) = \( w \, s \)$, since all the other factors are units. Put $g = \( v \, w \, s \)$. In a soluble case, division by $g$ makes both frequency coefficients units modulo

#[#set math.equation(numbering: n => "(8.29)")
 $ a = frac(\| s \|, \( v \, w \, s \)) . $ <eq:arith-reduced-modulus>]

Substituting the fixed parent product $M_(+) M_(-)$ into (8.28) then fixes $M_(+)^2$ to a specified unit modulo $a$. The other history at the same node fixes a square modulo $a' = \| s' \| \/ \( v' \, w' \, s' \)$.

For each odd prime power, a unit has at most two square roots, and for a power of two it has at most four. Thus the simultaneous square equations have at most $2^(omega \( \[ a \, a' \] \) + 1)$ solutions modulo $\[ a \, a' \]$, where brackets denote the least common multiple. If they are inconsistent, their probability is zero. The ordinary divisor bound and $n \/ phi.alt \( n \) lt.eq tau \( n \)$ give, uniformly for the moduli at hand,

$ 2^(omega \( n \) + 1) frac(n, phi.alt \( n \)) = exp \( o_k \( m \) \) \, #h(2em) n lt.eq exp \( O_k \( m \) \) . $

It follows that the conditional probability at this split is at most

#[#set math.equation(numbering: n => "(8.30)")
 $ frac(exp \( o_k \( m \) \), \[ a \, a' \]) . $ <eq:arith-split-probability>]

Reduction of Haar units modulo $Q_f$ to this modulus is uniform. All earlier tests are measurable with respect to the earlier exposed products, so these conditional upper bounds multiply along the tree. Failed tests contribute zero and do not alter the upper bound.

It remains to sum (8.30) over internal frequencies. The requisite numerical estimate is

#[#set math.equation(numbering: n => "(8.31)")
 $ sum_(a \, a' lt.eq V) frac(1, \[ a \, a' \]) lt.double \( 1 + log V \)^3 . $ <eq:arith-lcm-sum>]

Indeed, write $a = d u$, $a' = d v$ with $\( u \, v \) = 1$, and then discard the coprimality condition. The left side is at most

$ sum_(d lt.eq V) 1 / d (sum_(u lt.eq V \/ d) 1 / u)^2 \, $

which proves (8.31). With child frequencies $v \, w$ fixed, every $s$ giving a specified $a = \| s \| \/ \( v \, w \, s \)$ is of the form $s = plus.minus a d$ with $d divides \( v \, w \)$. Its multiplicity is therefore at most $2 tau \( \( v \, w \) \)$. The analogous bound holds in the other history. Since these gcds and all the frequency bounds are at most $exp \( O_k \( m \) \)$, (8.31) shows that each pair of internal frequencies sums to $exp \( o_k \( m \) \)$, uniformly in the fixed child frequencies.

Drop the equality of the two root frequencies if necessary for this nonnegative numerical bound. Sum the root pair first while holding the children fixed, then proceed down the tree. Only the $2 r$ leaf frequencies remain, giving at most $\( 2 V_0 \)^(2 r)$ choices. Combining this with (8.6) and $E_0 = Delta_0 + sqrt(m)$ yields

#[#set math.equation(numbering: n => "(8.32)")
 $ \( 2 V_0 \)^(2 r) e^(- r Delta_0 + O_k \( 1 \)) = exp \( r Delta_0 + o_k \( m \) \) . $ <eq:arith-leaf-budget>]

All the other losses fit $C r m + o_k \( m \)$ in the exponent. These are the $3^(r m)$ spectator bound, bounded per-coordinate masses and Page factors, the domination (8.20), and $O_k \( 1 \)$ equality patterns. The constant can be absolute: the internal-sample count is $O \( k r \)$, and $k L \/ m asymp k^(- 3)$; fixed-$k$ constants not proportional to $m$ are absorbed by $o_k \( m \)$. Inserting the negligible approximation errors gives

$ bb(E) sum_s cal(G) \| A_l \( s \) \|^2 lt.eq exp #scale(x: 120%, y: 120%)[\(] r \( Delta_0 + C m \) + o_k \( m \) #scale(x: 120%, y: 120%)[\)] . $

This is (7.17), and completes the proof of Proposition 16.

== 9 Completion of the proof <sec:conclusion>

We now use Proposition 16 to control the diagonals in the transfers and then symmetrize the final amplitude. All parameters, priors, and zero conventions are those of Section 7. In particular, the constants denoted by $C$ in costs $C r m$ are independent of the depth $k$ and of the large gap constants. The limits are taken with all these constants and $k$ fixed, and then $L arrow.r oo$.

=== 9.1 Counting bad arrangements <counting-bad-arrangements>

At level $l$ put $r = 2^l$. Call a pair of arrangements of the $r m$ bulk variables #emph[bad] if it is not covered by (7.18). Thus every pair is called bad when $l = 0 \, 1$; when $l gt.eq 2$, a bad pair has more than $3 r \/ 4$ connected components in its bipartite overlap graph. For each fixed first arrangement, the number of bad second arrangements satisfies

#[#set math.equation(numbering: n => "(9.1)")
 $ N_(upright("bad")) \( r \, m \) lt.eq \( m ! \)^r exp #scale(x: 120%, y: 120%)[\(] \( 1 / 4 log r + C \) r m + O_k \( 1 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:src60>]

Here arrangements distinguish all bulk positions and all sampled bulk variables, so they are indexed by permutations even before any distinctness restrictions are imposed.

To prove (9.1) for $l gt.eq 2$, write $a_i$ for the number of leaves on either side of the $i$th connected component. The numbers on the two sides agree: every vertex has degree $m$, and counting the component’s edges on either side gives the equality. If there are $t$ components, then

$ sum_(i = 1)^t a_i = r \, #h(2em) sum_(i = 1)^t \( a_i - 1 \) = r - t < r / 4 . $

There are only $exp \( O_k \( 1 \) \)$ ways to choose and pair the two partitions of the leaf sets into these components. Once they are chosen, the variables incident to a component can be assigned to its second set of slots in at most $\( a_i m \) !$ ways. For $1 lt.eq a lt.eq r$,

$ a log a = \( a - 1 \) log a + log a lt.eq \( a - 1 \) \( log r + 1 \) \, #h(2em) \( a m \) ! lt.eq \( m ! \)^a a^(a m) . $

The factorial inequality follows by bounding one multinomial coefficient by the sum of all multinomial coefficients with $a$ parts. Consequently

$ product_i \( a_i m \) ! lt.eq \( m ! \)^r exp (m sum_i a_i log a_i) lt.eq \( m ! \)^r exp (1 / 4 \( log r + 1 \) r m) \, $

which proves the claim. For $r = 1 \, 2$, the upper bound $\( r m \) ! lt.eq \( m ! \)^r r^(r m)$ proves the same assertion after enlarging the absolute constant $C$. Nonbulk matchings in a diagonal have only $exp \( O_k \( 1 \) \)$ possibilities, since their number of slots is fixed once $k$ is fixed.

We shall also use the corresponding bound for the fraction of bad arrangements. Since $m ! lt.eq m^m$ and $\( r m \) ! gt.eq \( r m \/ e \)^(r m)$,

#[#set math.equation(numbering: n => "(9.2)")
 $ frac(N_(upright("bad")) \( r \, m \), \( r m \) !) lt.eq exp #scale(x: 120%, y: 120%)[\(] \( - 3 / 4 log r + C \) r m + O_k \( 1 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:conclusion-bad-fraction>]

=== 9.2 Diagonal bounds and the order of parameter choices <diagonal-bounds-and-the-order-of-parameter-choices>

Let $cal(D)_j$ be the nonnegative diagonal contribution in the extended square at step $j$, before the factor $e^(c_g)$ in (7.12). At this step the two compared amplitudes have level $j - 1$ and $r_j = 2^(j - 1)$ leaves. We first estimate the bad matchings.

For each such matching, apply $\| A^(\( 1 \)) overline(A^(\( 2 \))) \| lt.eq \( \| A^(\( 1 \)) \|^2 + \| A^(\( 2 \)) \|^2 \) \/ 2$ on their simultaneous support, after the nonnegative-square reduction that gives (7.14). For either retained square, extract the point probability of the #emph[other] ordered tuple. On this support it is at most

$ C_H exp \( - T_H + O_k \( 1 \) \) \, #h(2em) C_H lt.eq L^(- r_j m) exp \( C r_j m + O_k \( 1 \) \) . $

The retained tuple is then summed with its own priors. This order of extraction is valid for both squares, including when a matching exchanges positions with different log-cell priors. The external integer measure and the $u$ weight contribute $exp \( G + r_j w_j \)$; by (7.7), their combination with $exp \( - T_H \)$ is $exp \( - Delta_j \)$. All remaining Archimedean factors are bounded by $exp \( O_k \( 1 \) \)$ on the simultaneous support. Thus the one-assignment estimate (7.17), followed by (9.1), bounds the bad part by

$ exp \( - Delta_j \) L^(- r_j m) \( m ! \)^(r_j) exp #scale(x: 120%, y: 120%)[\(] r_j Delta_0 + \( 1 / 4 log r_j + C \) r_j m + o_k \( m \) #scale(x: 120%, y: 120%)[\)] . $

Since $m \/ L lt.eq z$, we have $L^(- r_j m) \( m ! \)^(r_j) lt.eq exp \( r_j m log z \)$. We obtain

#[#set math.equation(numbering: n => "(9.3)")
 $ cal(D)_(j \, upright("bad")) lt.eq exp (- Delta_j + r_j { Delta_0 + \( log z + 1 / 4 log r_j + C \) m #scale(x: 120%, y: 120%)[}] + o_k \( m \)) . $ <eq:src61>]

For every other matching, (7.18) applies with its stated Archimedean multiplier. After the probability extraction, the number and size of these terms cost at most $exp \( O_k \( m \) \)$: in particular,

$ \( r_j m \) ! L^(- r_j m) lt.eq exp #scale(x: 120%, y: 120%)[\(] r_j m log \( r_j m \/ L \) #scale(x: 120%, y: 120%)[\)] = exp \( O_k \( m \) \) . $

Their total is therefore $exp \( - omega_k \( m \) \)$. In this notation, $omega_k \( m \) \/ m arrow.r oo$ at every fixed $k$. Combining the two parts,

#[#set math.equation(numbering: n => "(9.4)")
 $ cal(D)_j lt.eq exp (- Delta_j + r_j { Delta_0 + \( log z + 1 / 4 log r_j + C \) m #scale(x: 120%, y: 120%)[}] + o_k \( m \)) + exp \( - omega_k \( m \) \) . $ <eq:conclusion-diagonal-total>]

We specify the parameter order and the reserve in the iteration. The constant $B_s$ has already been chosen sufficiently large for (7.6), whose constant $B_(*)$ is independent of the later gaps and of $k$. Write

$ Z_G = sum_(p med upright("prime")) frac(phi \( log p - G \), p) \, #h(2em) c_g = log Z_G^(- 1) . $

The giant range and the prime-cell normalization give $Z_G tilde.op G^(- 1)$ and $c_g lt.eq .91 L$ for all sufficiently large $L$, with the coefficient $.91$ independent of all the gap choices and $k$. Fix, now,

#[#set math.equation(numbering: n => "(9.5)")
 $ B = B_(*) + 3 . $ <eq:conclusion-budget>]

Choose $B_z gt.eq 9$ and then choose $B_D$ so large that

#[#set math.equation(numbering: n => "(9.6)")
 $ B_D gt.eq B_s + 2 B + C + 6 \, $ <eq:conclusion-gap-choice>]

where $C$ dominates the uniform constant in (9.4). These are fixed constants, chosen before $k$.

Indeed, substitution from (7.1) shows that the exponent of the first term in (9.4), divided by $r_j m$, is

#[#set math.equation(numbering: n => "(9.7)")
 $ B_s - B_D + \( 9 - B_z \) log z - 3 / 20 log r_j + C + o_k \( 1 \) . $ <eq:conclusion-diagonal-rate>]

Hence, for every sufficiently large fixed $k$ and then sufficiently large $L$, uniformly for $1 lt.eq j lt.eq k$,

#[#set math.equation(numbering: n => "(9.8)")
 $ cal(D)_j lt.eq exp #scale(x: 120%, y: 120%)[\(] - \( 2 B + 3 \) r_j m #scale(x: 120%, y: 120%)[\)] . $ <eq:conclusion-diagonal-reserve>]

The precise choice of $k$ will be made below. We require already that it be large enough that, using $m = k^4 L + O \( 1 \)$,

#[#set math.equation(numbering: n => "(9.9)")
 $ frac(c_g + log 2, m) lt.eq 2 / k^4 < 1 $ <eq:conclusion-cg-reserve>]

for all sufficiently large $L$.

The transfer identity underlying (7.12) gives

$ e^(- c_g) \| eta_(j - 1) \|^2 lt.eq cal(D)_j + eta_j lt.eq cal(D)_j + \| eta_j \| . $

If $\| eta_(j - 1) \| gt.eq exp \( - B r_j m \)$, then (9.8) and (9.9) imply $cal(D)_j lt.eq 1 / 2 e^(- c_g) \| eta_(j - 1) \|^2$. Therefore

#[#set math.equation(numbering: n => "(9.10)")
 $ \| eta_j \| gt.eq 1 / 2 e^(- c_g) \| eta_(j - 1) \|^2 . $ <eq:conclusion-transfer-lower>]

Starting with (7.6), induction proves simultaneously this estimate and the sharper bound

#[#set math.equation(numbering: n => "(9.11)")
 $ - log \| eta_j \| lt.eq 2^j B_(*) m + \( 2^j - 1 \) \( c_g + log 2 \) < B 2^j m \, #h(2em) 0 lt.eq j lt.eq k . $ <eq:conclusion-exact-recurrence>]

For the induction, the sharper bound at $j - 1$ supplies the coarse hypothesis needed for (9.10); that inequality then gives the displayed sharper bound at $j$. Its final inequality follows from (9.5) and (9.9). In particular the reserve is inherited from the initial estimate rather than spent afresh at each step.

The transfers have now retained an exponential lower bound for $\| eta_k \|$. We will obtain the opposite bound by averaging $A_k$ over the bulk arrangements. Since $G_R \( s \/ d \)$ depends only on their prime values, not their positions, it is common to these arrangements. The Cauchy–Schwarz step therefore also requires a norm estimate for this regular-transform factor.

=== 9.3 The norm of the common regular transform <the-norm-of-the-common-regular-transform>

At the final level put $r = 2^k$. The sum over $s$ in this subsection is over the nonzero signed integers with $\| s \| lt.eq V_k$. We claim

#[#set math.equation(numbering: n => "(9.12)")
 $ bb(E)_(upright(bold(d)) \, cal(I)_k) sum_(0 < \| s \| lt.eq V_k) \| G_R \( s \/ d \) \|^2 lt.double V_k \, $ <eq:conclusion-regular-norm>]

with an absolute implied constant for sufficiently large $L$ at the fixed parameters. Only the pairwise-distinctness and coprimality zero conventions of $G_R$ are needed here; bins and all history restrictions belong to the amplitudes.

Fix $s$, the spectator list $upright(bold(d))$, the actual regular small primes, and one of the two giant primes, denoted by $q$. Configurations with a repeated regular small prime or with a regular small prime dividing $d$ already give zero and can be discarded. Let $C$ be the squarefree product of the remaining regular small primes, and call the other giant $p$. Both giant transforms have absolute value at most one. After dropping their squared absolute values, the remaining factor is

#[#set math.equation(numbering: n => "(9.13)")
 $ F \( p med mod med C \) \, #h(2em) F \( a \) = product_(ell divides C) lr(|g_ell \( a_ell a^(- 1) med mod med ell \)|)^2 \, #h(2em) a_ell = frac(s, d q \( C \/ ell \)) med \( mod med ell \) . $ <eq:conclusion-residue-test>]

All $a_ell$ are units: the retained primes are distinct and coprime to $d$, and $0 < \| s \| lt.eq V_k$ is smaller than every actual slot prime. The restriction $p eq.not q$ may now be dropped, since the remaining nonnegative expression is still defined when $p = q$. The giant range is disjoint from all the small-prime ranges, so every prime $p$ in its cell is a unit modulo $C$.

Write $U_C = \( bb(Z) \/ C bb(Z) \)^times$. By the Chinese remainder theorem, as $a$ varies uniformly over $U_C$, the arguments $a_ell a^(- 1) med \( mod med ell \)$ are independent uniform nonzero residues. The exact local normalizations $g_ell \( 0 \) = 0$ and $ell^(- 1) sum_x \| g_ell \( x \) \|^2 = 1$ therefore give the identities

#[#set math.equation(numbering: n => "(9.14)")
 $ sum_(a in U_C) F \( a \) = C \, #h(2em) frac(1, phi.alt \( C \)) sum_(a in U_C) F \( a \) = frac(C, phi.alt \( C \)) = product_(ell divides C) frac(ell, ell - 1) . $ <eq:conclusion-crt-norm>]

Here $phi.alt$ is Euler’s totient. There are $O_k \( m \)$ factors, and every such prime is at least $exp \( exp \( .004 L \) \)$. Consequently $C \/ phi.alt \( C \) = 1 + o_k \( 1 \)$ uniformly in the fixed lists. This calculation uses no uniform pointwise bound on the small-prime transforms.

We next justify the averaging over the actual prime $p$, including the possible exceptional term. The size bounds for the final list give

$ log C = O_k \( h + m exp \( .006 L \) \) lt.eq exp \( .012 L \) $

for sufficiently large $L$, so the giant row of (8.8) applies with modulus $C$. With the positive constant $c$ from that estimate, put

$ epsilon_L = exp \( - c exp \( .018 L \) \) . $

Splitting the support of $phi \( t - G \)$ into intervals of length at most one and applying partial summation gives, uniformly for $a in U_C$,

#[#set math.equation(numbering: n => "(9.15)")
 $ sum_(p med upright("prime")\
p equiv a med \( mod med C \)) frac(phi \( log p - G \), p) & = frac(1, phi.alt \( C \)) integral frac(phi \( t - G \), t) #scale(x: 120%, y: 120%)[\(] 1 - chi_(*) \( a \) e^(\( beta_(*) - 1 \) t) #scale(x: 120%, y: 120%)[\)] thin d t + O \( epsilon_L \) . $ <eq:conclusion-progression-average>]

As in (8.8), the exceptional term is omitted if it is absent or its conductor does not divide $C$. When it is present,

$ 0 lt.eq 1 - chi_(*) \( a \) e^(\( beta_(*) - 1 \) t) lt.eq 2 . $

This pointwise inequality suffices even if the exceptional character correlates with $F$.

Multiply (9.15) by $F \( a \)$, sum over $a in U_C$, and divide by $Z_G$. Since $F gt.eq 0$, the exact sum in (9.14) both bounds the main term and sums the absolute progression errors. It follows that

#[#set math.equation(numbering: n => "(9.16)")
 $ bb(E)_p F \( p med mod med C \) lt.eq 2 frac(C, phi.alt \( C \)) frac(integral phi \( t - G \) thin d t \/ t, Z_G) + O \( Z_G^(- 1) C epsilon_L \) = 2 + o_k \( 1 \) . $ <eq:conclusion-prime-norm>]

Indeed the integral divided by $Z_G$ is $1 + o \( 1 \)$ by ordinary prime-cell normalization. Moreover $Z_G^(- 1) = exp \( O \( L \) \)$ and $log C lt.eq exp \( .012 L \)$, whereas $epsilon_L = exp \( - c exp \( .018 L \) \)$, so the summed error is $o \( 1 \)$. All estimates are uniform in $s$, $upright(bold(d))$, $q$, and the retained small-prime list. Averaging those variables and summing over the at most $2 V_k$ frequencies proves (9.12).

=== 9.4 Symmetrization and contradiction <symmetrization-and-contradiction>

Let $frak(S)_(r m)$ permute the values in all $r m$ bulk positions, keeping every other position fixed. The bulk priors are identical, including their allowed prime deletions, so their joint law is invariant under this action. Also $G_R \( s \/ d \)$ is unchanged: the product $R$, the set of its prime factors, the exact transform attached to each bulk prime value, and every argument $s \/ \( d \( R \/ ell \) \)$ are unchanged. Its distinctness and coprimality zero conventions are invariant as well. Define

#[#set math.equation(numbering: n => "(9.17)")
 $ A_(upright("sym")) \( s \) = frac(1, \( r m \) !) sum_(pi in frak(S)_(r m)) A_k^pi \( s \) \, $ <eq:conclusion-symmetrization>]

where $A_k^pi$ has its bulk values placed according to $pi$. Changing variables separately for each permutation in (7.8) yields

$ eta_k = bb(E) sum_(0 < \| s \| lt.eq V_k) G_R \( s \/ d \) A_(upright("sym")) \( s \) . $

In this operation all bins and history-dependent support conditions remain inside their respective $A_k^pi$; they need not be invariant. Cauchy–Schwarz and (9.12) give

#[#set math.equation(numbering: n => "(9.18)")
 $ \| eta_k \|^2 lt.eq (bb(E) sum_s \| G_R \( s \/ d \) \|^2) (bb(E) sum_s \| A_(upright("sym")) \( s \) \|^2) lt.double V_k bb(E) sum_s \| A_(upright("sym")) \( s \) \|^2 . $ <eq:conclusion-cauchy-schwarz>]

Expand the second factor into ordered pairs of permutations. Each bad pair is at most $exp \( r \( Delta_0 + C m \) + o_k \( m \) \)$ in absolute value by Cauchy–Schwarz and the two one-assignment bounds (7.17). Its fraction among all pairs is bounded by (9.2). Each remaining pair satisfies (7.18); that estimate is uniform, so averaging these pairs preserves its bound. Consequently

#[#set math.equation(numbering: n => "(9.19)")
 $ \| eta_k \|^2 lt.double e^(E_k) [exp #scale(x: 120%, y: 120%)[\(] r { Delta_0 + \( - 3 / 4 log r + C \) m } + o_k \( m \) #scale(x: 120%, y: 120%)[\)] + exp \( - omega_k \( m \) \)] . $ <eq:conclusion-final-upper>]

For completeness, the sums in (7.1) satisfy

$ sum_(j = 1)^k r_j = r - 1 \, #h(2em) sum_(j = 1)^k r_j log r_j = r log r - 2 r log 2 + 2 log 2 . $

They give, in particular, the convenient upper bound

#[#set math.equation(numbering: n => "(9.20)")
 $ frac(E_k, r m) lt.eq 2 / 5 log r + B_D + B_s + \( B_z + 8 \) log z + o_k \( 1 \) . $ <eq:conclusion-frequency-budget>]

Since $Delta_0 \/ m = B_s + 8 log z$, the logarithm of the first term on the right of (9.19), divided by $r m$, is at most

#[#set math.equation(numbering: n => "(9.21)")
 $ - 7 / 20 log r + B_D + 2 B_s + \( B_z + 16 \) log z + C + o_k \( 1 \) . $ <eq:conclusion-final-rate>]

All constants here have already been fixed. Now choose $k$ sufficiently large, retaining (9.9), that the expression in (9.21) without its $o_k \( 1 \)$ term is less than $- 2 B - 4$. This is possible because $log r = k log 2$ while $log z = 4 log k$. Finally take $L$ sufficiently large. The first term of (9.19) is then at most $exp \( - \( 2 B + 3 \) r m \)$, after absorbing its absolute implied constant. The second term remains $exp \( - omega_k \( m \) \)$, since $E_k = O_k \( m \)$. Thus, for sufficiently large $L$,

$ \| eta_k \|^2 lt.eq exp \( - \( 2 B + 1 \) r m \) . $

This contradicts (9.11), which gives $\| eta_k \|^2 gt.eq exp \( - 2 B r m \)$. The assumed decomposition is therefore impossible: no two infinite subsets of $bb(N)_0$ have a sumset whose symmetric difference with the positive primes is finite. This proves Theorem 4.


#bibliography("refs.bib", style: "ieee", title: [References])
