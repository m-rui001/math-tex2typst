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

#align(center)[#text(size: 16pt, weight: "bold")[Positive lower density of large prime gaps]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <introduction>

Let $p_n$ denote the $n$th prime and write $d_n = p_(n + 1) - p_n$. The prime number theorem identifies $log p$ as the average scale of prime gaps near $p$. Individual gaps can be much larger. Westzynthius proved that $d_n \/ log p_n$ is unbounded #cite(label("Westzynthius1931")); the constructions of Erdős and Rankin gave increasingly strong quantitative lower bounds for exceptionally large gaps #cite(label("Erdos1935")) #cite(label("Rankin1938")). Modern refinements were obtained independently by Ford, Green, Konyagin and Tao and by Maynard #cite(label("FordGreenKonyaginTao2016")) #cite(label("Maynard2016Large")), followed by their joint work #cite(label("FordGreenKonyaginMaynardTao2018")). These results concern the size of very large gaps. A lower bound for the largest gap does not by itself give a positive proportion of gaps exceeding a fixed multiple of $log p$.

We study this frequency question with equal weight on the prime indices. For a set $A$ of positive integers, its lower asymptotic density is $liminf_(N arrow.r oo) \| A ∩ \[ 1 \, N \] \| \/ N$.

#thm([Theorem 1.1.])[
  #emph[For every fixed real $C > 0$, there are constants $c \( C \) > 0$ and $N_0 \( C \)$ such that, for every integer $N gt.eq N_0 \( C \)$, 
$ \# { 1 lt.eq n lt.eq N : p_(n + 1) - p_n > C log p_n } gt.eq c \( C \) N . $

]
] <thm:main>

The density is ordinary lower density: the bound holds for every sufficiently large initial segment, and both constants may depend on the fixed threshold $C$.

One consequence concerns successive values of $p_n \/ n$. Erdős and Prachar asked whether the indices at which this ratio increases have positive lower density #cite(label("ErdosPrachar1962")) p. 256.

#thm([Corollary 1.2.])[
  #emph[The set 
$ {n gt.eq 1 : p_n / n < frac(p_(n + 1), n + 1)} $

 has positive lower asymptotic density.]
] <cor:ratios>

#proof[
  The displayed inequality is equivalent to $p_(n + 1) - p_n > p_n \/ n$. The prime number theorem gives $p_n \/ n tilde.op log p_n$. Apply Theorem 1 with $C = 2$ and discard the finitely many indices for which $p_n \/ n gt.eq 2 log p_n$. ◻
]

Thus the corollary answers the Erdős–Prachar question affirmatively.

=== Gap frequency and empty intervals <gap-frequency-and-empty-intervals>

The distinction between counting intervals and counting prime gaps is essential. A long gap contains many integer starting points of prime-free short intervals. Consequently a positive proportion of empty intervals may be accounted for by a sparse set of very long gaps. Bazzanella, Languasco and Zaccagnini distinguish the two counting measures explicitly #cite(label("BLZ2010")). Their Theorem 5 gives positive prime-start proportions for each fixed threshold below $2 \/ 3.454 = 0.579038 dots.h$, whereas their Theorem 3 reaches some intervals longer than the average prime spacing by counting integer starts. Tao’s empty-interval argument #cite(label("Tao2019")) also identifies the additional control required to pass from interval measure to gap counts.

Conditional results describe much more of the distribution. Gallagher derived Poisson statistics for prime counts in integer-start intervals of length $lambda log X$, for fixed $lambda > 0$, from a uniform Hardy–Littlewood prime-tuple hypothesis #cite(label("Gallagher1976")) Theorem 1. The Poisson-tail results of Jha #cite(label("Jha2026")) Theorems 1.4 and 1.6 treat growing parameter ranges under a stronger uniform tuple hypothesis. The counting measures and uniformity assumptions matter in comparing these conclusions with Theorem 1.

=== The adjacent-interval construction <the-adjacent-interval-construction>

We control the number of distinct gaps by requiring a prime just before an empty interval. Fix $lambda > 0$, put $h = floor.l lambda log X floor.r$, and average over integers $X < m lt.eq 2 X$. We construct a nonnegative weight for which a prime in $\( m \, m + h \]$ has substantial weighted probability, whereas the expected number of primes in $\( m + h \, m + 2 h \]$ is arbitrarily small. One second-moment estimate detects the first prime; a separate second-moment estimate converts the resulting weighted mass into a positive proportion of ordinary integer starts. The last prime in $\( m \, m + h \]$ then begins a gap longer than $h$. It can be selected by at most $h$ values of $m$, independently of the length of that gap. This bounded multiplicity is the step that turns the interval construction into a count of consecutive gaps.

The weights are squares of signed sums of smooth divisor sums, each built from divisors of shifted integers in the second interval. The test functions make terms involving different shift sets orthogonal in the limiting unmarked second moment. At a prime belonging to one of those shift sets, the support cutoff forces the corresponding divisor coordinate to equal one in every nonzero summand. Removing that shift then couples terms whose sets differ in size by one. The central choice is an alternating family for which these neighboring terms nearly cancel. The resulting square has positive average but arbitrarily small weighted prime mass in the second interval. A detector estimate for the first interval has a constant independent of the size of the chosen family, which allows the suppression to be made strong enough before the final counting argument.

The analytic ingredients are smooth divisor-sum correlations, the Bombieri–Vinogradov distribution theorem, and an average of the prime-tuple singular series. The distribution theorem originates in the work of Bombieri and A. I. Vinogradov #cite(label("Bombieri1965")) #cite(label("Vinogradov1965")). Goldston–Yıldırım’s correlation method is a direct antecedent: they square a linear combination of tuple approximations of different cardinalities #cite(label("GY2005")) p. 6, equation (2.14) and the preceding paragraph. Maynard’s smooth multidimensional sieve and product-profile construction #cite(label("Maynard2015")) provide further antecedents. Here the orthogonality and coordinate-removal identities reduce the choice of a weight to cancellation between adjacent dimensions. All dimensions and test functions are fixed before $X$ tends to infinity; the uniform error estimates needed to sum over the shifts are proved in the paper.

Section 2 first deduces the theorem from a precise weight proposition and proves the passage to ordinary index density. Section 3 defines the square and states its moment identities; Section 4 chooses the test functions that make the adjacent dimensions cancel. Section 5 proves the general mixed-moment estimates, the singular-series average, and the moment identities used in the construction.

== 2 From two adjacent intervals to gap counts <sec:counting>

For an integer $X gt.eq 2$ and a fixed $lambda > 0$, write

$ L = log X \, #h(2em) h = floor.l lambda L floor.r \, #h(2em) J = { 1 \, dots.h \, h } \, #h(2em) I = { h + 1 \, dots.h \, 2 h } . $

We use the uniform average $bb(E)_X A = X^(- 1) sum_(X < m lt.eq 2 X) A \( m \)$. Set $theta.alt \( n \) = \( log n \) upright(bold(1))_({ n med upright("prime") })$ and

$ V_B \( m \) = 1 / L sum_(b in B) theta.alt \( m + b \) #h(2em) \( B = I \, J \) . $

The condition $V_B > 0$ says exactly that the corresponding interval contains a prime. Moreover, $V_B gt.eq 1$ whenever $V_B > 0$, since all its prime arguments exceed $X$.

#thm([Proposition 2.1.])[
  (Weights for adjacent intervals).  #emph[For each fixed $lambda > 0$ there is a finite constant $K_lambda > 0$ with the following property. For every $epsilon > 0$, there are weights $W_X \( m \) gt.eq 0$, defined for integers $X < m lt.eq 2 X$, such that 
#[#set math.equation(numbering: n => "(1)")
 $ bb(E)_X W_X & arrow.r 1 \, & bb(E)_X \( W_X V_J \) & arrow.r lambda \,\
limsup_(X arrow.r oo) bb(E)_X \( W_X V_I \) & lt.eq epsilon \, & limsup_(X arrow.r oo) bb(E)_X \( W_X V_J^2 \) & lt.eq K_lambda \,\
bb(E)_X W_X^2 & = O_(lambda \, epsilon) \( 1 \) . $ <eq:weight-first>]

 The constant $K_lambda$ is independent of $epsilon$.]
] <prop:weights>

The construction and proof occupy Sections 3 through 5. We now show why precisely these estimates suffice. In particular, the bound in (1) need not be uniform as $epsilon$ decreases.

The estimate for $bb(E)_X \( W_X V_J^2 \)$ prevents the detected prime mass from being concentrated on too little weighted mass. After removing the starts that contain a prime in $I$, the separate estimate for $bb(E)_X W_X^2$ prevents the remaining weighted mass from being concentrated on too few ordinary starts. This is why only the first constant must be chosen before the suppression tolerance.

#thm([Lemma 2.2.])[
  #emph[Suppose $h gt.eq 1$ and that for at least $delta X$ integers $m in \( X \, 2 X \]$, the interval $\( m \, m + h \]$ contains a prime and $\( m + h \, m + 2 h \]$ contains none. Then at least $delta X \/ h$ distinct primes $p in \( X \, 2 X + h \]$ have a consecutive successor $p^(+)$ satisfying $p^(+) - p > h$.]
] <lem:adjacent-gaps>

#proof[
  For each such $m$, let $p \( m \)$ be the last prime in $\( m \, m + h \]$. There is no prime in $\( p \( m \) \, m + 2 h \]$, so $p \( m \)^(+) > m + 2 h gt.eq p \( m \) + h$. For a fixed selected prime $p$, the condition $m < p lt.eq m + h$ implies $p - h lt.eq m lt.eq p - 1$. This interval contains exactly $h$ integers. Thus each prime is selected at most $h$ times, proving the claim. ◻
]

#figure(
  [(420,91) (10,36)(1,0)390 (10,32)(0,1)8 (205,32)(0,1)8 (400,32)(0,1)8 (10,16)(0,0)$m$ (205,16)(0,0)$m + h$ (400,16)(0,0)$m + 2 h$ (95,49)(0,0)contains a prime (305,49)(0,0)no primes (148,36) (148,23)(0,0)$p \( m \)$ (148,67)(1,0)267 (283,81)(0,0)no next prime before $m + 2 h$],
  caption: [Figure 1: The last prime in the first interval begins a gap longer than $h$. Its distance from $m$ is at most $h$, which bounds the counting multiplicity even when the next prime is much farther away. ],
) <fig:blocks>

#proof[
  Fix $C > 0$ and choose $lambda > max { C \, 1 }$. Take $epsilon = lambda^2 \/ \( 2 K_lambda \)$ in Proposition 3, and fix the resulting weight family. There is a finite constant $M > 0$ such that $bb(E)_X W_X^2 lt.eq M$ for every sufficiently large $X$. Let $A_X = { V_J > 0 }$ and $B_X = { V_I > 0 }$. Weighted Cauchy–Schwarz gives
  $ bb(E)_X \( W_X upright(bold(1))_(A_X) \) gt.eq frac(#scale(x: 120%, y: 120%)[\(] bb(E)_X \( W_X V_J \) #scale(x: 120%, y: 120%)[\)]^2, bb(E)_X \( W_X V_J^2 \)) $
  for all sufficiently large $X$; its denominator is positive because the numerator tends to $lambda^2 > 0$. By (1)–(1),
  $ liminf_(X arrow.r oo) bb(E)_X \( W_X upright(bold(1))_(A_X) \) gt.eq lambda^2 / K_lambda . $
  Since $upright(bold(1))_(B_X) lt.eq V_I$ and $W_X gt.eq 0$, it follows that
  $ liminf_(X arrow.r oo) bb(E)_X \( W_X upright(bold(1))_(A_X \\ B_X) \) gt.eq lambda^2 / K_lambda - epsilon = : Delta > 0 . $
  Another use of Cauchy–Schwarz yields, for every sufficiently large $X$,
  $ frac(\| A_X \\ B_X \|, X) gt.eq frac(#scale(x: 120%, y: 120%)[\(] bb(E)_X \( W_X upright(bold(1))_(A_X \\ B_X) \) #scale(x: 120%, y: 120%)[\)]^2, bb(E)_X W_X^2) gt.eq frac(Delta^2, 4 M) = : delta > 0 . $
  This is an ordinary proportion of integer starting points. Lemma 4 therefore gives at least
  $ frac(delta X, h) gt.eq frac(delta X, lambda log X) $
  distinct prime starts $p in \( X \, 2 X + h \]$ with consecutive gap exceeding $h$. Uniformly on this range, $log p = log X + O \( 1 \)$ and $h = lambda log X + O \( 1 \)$. The strict inequality $lambda > C$ consequently gives $h > C log p$ for every sufficiently large $X$.
  For an arbitrary sufficiently large integer $N$, choose $X = floor.l p_N \/ 3 floor.r$. Then $2 X + h < p_N$, so all these prime starts have indices at most $N$. The prime number theorem gives
  $ frac(X, log X) tilde.op frac(p_N, 3 log p_N) tilde.op N / 3 . $
  In particular $X \/ log X gt.eq N \/ 4$ for every sufficiently large $N$. The required count is at least $delta N \/ \( 4 lambda \)$. Thus $c \( C \) = delta \/ \( 4 lambda \) > 0$ is admissible. All choices preceding $X$ depend only on the fixed threshold. ◻
]

The rest of the paper proves Proposition 3. The task is to make the weighted prime mass in $I$ arbitrarily small without losing either the mass of the square or the uniform detector bound in the adjacent block $J$.

== 3 A square with a small marked moment <sec:weights>

We construct the weight in Proposition 3 as the square of a signed sum of smooth divisor sums. We first define that square and state the exact analytic estimates it satisfies. The next section uses their formulas to choose the coefficients and functions; the proofs of the analytic estimates follow in Section 5.

Fix $lambda > 0$, and write

$ L = log X \, #h(2em) h = floor.l lambda L floor.r \, #h(2em) J = { 1 \, dots.h \, h } \, #h(2em) I = { h + 1 \, dots.h \, 2 h } . $

Here $X$ tends to infinity through integers, and $bb(E)_X$ denotes the average over the integers $X < m lt.eq 2 X$. Recall that

$ V_B \( m \) = 1 / L sum_(b in B) theta.alt \( m + b \) \, #h(2em) theta.alt \( n \) = \( log n \) 1_({ n med upright("prime") }) . $

Let $mu$ denote the Möbius function. For a compactly supported function $F : \[ 0 \, oo \)^j arrow.r bb(R)$ and a tuple of distinct shifts $upright(bold(b)) = \( b_1 \, dots.h \, b_j \)$, define

$ D_F \( m \; upright(bold(b)) \) = sum_(d_i divides m + b_i) mu \( d_1 \) dots.h.c mu \( d_j \) F (frac(log d_1, L) \, dots.h \, frac(log d_j, L)) . $

The sum runs over positive divisors. The zero-dimensional convention makes $D_F = F$ a scalar. A symmetric function $F$ allows us to write $D_F \( m \; S \)$ for an unordered shift set $S$.

Put $tau = 1 \/ 8$, and let $k$ be a positive integer. For $1 lt.eq j lt.eq k$, take a real symmetric function

$ f_j in C_c^oo #scale(x: 120%, y: 120%)[\(] { upright(bold(t)) in \( 0 \, oo \)^j : sum_i t_i < tau } #scale(x: 120%, y: 120%)[\)] . $

Allow also a real scalar $f_0$, and set $f_(k + 1) = F_(k + 1) = 0$. Define

$ F_j \( upright(bold(v)) \) = integral_(s_i gt.eq v_i med \( 1 lt.eq i lt.eq j \)) f_j \( upright(bold(s)) \) thin d upright(bold(s)) \, #h(2em) F_0 = f_0 \, #h(2em) \( T f_(j + 1) \) \( upright(bold(t)) \) = integral_0^oo f_(j + 1) \( upright(bold(t)) \, u \) thin d u . $

In dimension zero the last expression is a scalar. All norms below are Lebesgue $L^2$ norms on nonnegative orthants, with absolute value in dimension zero. On the nonnegative orthant, $F_j$ vanishes when $sum_i v_i gt.eq tau$. Cumulative integration also gives

#[#set math.equation(numbering: n => "(2)")
 $ \( - 1 \)^j partial_1 dots.h.c partial_j F_j = f_j . $ <eq:cumulative-derivative>]

Thus these complete mixed derivatives vanish on every coordinate face, even though the cumulative functions themselves need not.

Define the signed sum

$ Z \( m \) = sum_(j = 0)^k sum_(S subset I\
\| S \| = j) D_(F_j) \( m \; S \) \, #h(2em) alpha_j = frac(lambda^j, j !) . $

The weight will be a positive normalization of $Z^2$. The following analytic statement gives its mass, its interaction with the two prime counts, and the second-moment bounds for prime detection and removal of the weight. Its explicit formulas identify the remaining choice of the functions $f_j$.

#thm([Proposition 3.1.])[
  (Moment identities and a detector bound).  #emph[Hold $lambda$, $k$, and the family $\( f_j \)_(0 lt.eq j lt.eq k)$ fixed. Then, as $X arrow.r oo$, 
#[#set math.equation(numbering: n => "(3)")
 $ bb(E)_X Z^2 & arrow.r w := sum_(j = 0)^k alpha_j parallel f_j parallel_2^2 \, & bb(E)_X Z^4 & = O_(lambda \, k \, upright(bold(f))) \( 1 \) \,\
bb(E)_X \( Z^2 V_J \) & arrow.r lambda w \, & bb(E)_X \( Z^2 V_I \) & arrow.r v := lambda sum_(j = 0)^k alpha_j parallel f_j + T f_(j + 1) parallel_2^2 . $ <eq:weight-unmarked>]

 Choose once and for all a real $G in C_c^oo \( bb(R) \)$ with $G \( 0 \) = 1$ and $G \( u \) = 0$ for $u gt.eq tau$, and put 
$ c_G = integral_0^oo \| G' \( u \) \|^2 thin d u \, #h(2em) C_(*) = lambda + lambda^2 c_G^2 . $

 For every fixed family as above, 
#[#set math.equation(numbering: n => "(4)")
 $ limsup_(X arrow.r oo) bb(E)_X \( Z^2 V_J^2 \) lt.eq C_(*) w . $ <eq:detector-bound>]

 In particular, $C_(*)$ is independent of $k$ and of the family $\( f_j \)$.]
] <prop:weight-moments>

The formulas distinguish two effects of a prime mark. A prime in $J$ lies outside every subset used to build $Z$, whereas a prime in $I$ alters the sum itself. To see the latter point exactly, fix $a in I$. When $m + a$ is prime, every nonzero term from a subset containing $a$ has divisor one in that coordinate: the other possible divisor satisfies $log \( m + a \) \/ L > 1 > tau$, so its contribution vanishes by the support condition on $F_j$. Put $tilde(F)_j = F_j + F_(j + 1) \( dot.op \, 0 \)$. Deleting $a$ from each subset that contains it therefore gives the exact identity

#[#set math.equation(numbering: n => "(5)")
 $ Z \( m \) = sum_(j = 0)^k sum_(U subset I \\ { a }\
\| U \| = j) D_(tilde(F)_j) \( m \; U \) #h(2em) upright("when ") m + a upright(" is prime") . $ <eq:prime-deletion>]

Each subset occurs once, so deletion introduces no dimension factor. The signed complete mixed derivative of $tilde(F)_j$ is $f_j + T f_(j + 1)$. This explains why the marked form $v$ couples neighboring dimensions.

The analytic proof evaluates the products in these squares by pairing equal shifts. Any unmatched shift sets a coordinate of a complete mixed derivative to zero, so the face vanishing in (2) removes its main term. Only matching subsets remain in the limiting quadratic forms, producing the squared norms in $w$ and $v$. The same proof controls the errors and establishes the two different second-moment bounds.

For a family with $w > 0$, the normalization $W_X = Z^2 \/ w$ therefore has all the properties in Proposition 3 except the prescribed smallness of the prime mass in $I$. That last requirement is exactly $v \/ w lt.eq epsilon$. The next section constructs families with $w arrow.r 1$ and $v arrow.r 0$, while the detector constant $C_(*)$ remains unchanged.

== 4 Cancellation between adjacent dimensions <sec:cancellation>

We now choose the functions so that the adjacent-dimension terms in $v$ almost cancel. Product functions restricted to a simplex, with the truncation controlled by moments of their squared density, also occur in Maynard’s sieve construction #cite(label("Maynard2015")) Section 7. Here we combine such functions at a short range of dimensions with alternating signs.

#thm([Lemma 4.1.])[
  (A one-dimensional profile).  #emph[For every $lambda > 0$ and $beta > 0$, there exists a nonnegative $g in C_c^oo \( \( 0 \, oo \) \)$ such that 
$ integral_0^oo g \( u \)^2 thin d u = 1 \, #h(2em) integral_0^oo g \( u \) thin d u = sqrt(lambda) \, #h(2em) mu_g := integral_0^oo u g \( u \)^2 thin d u < beta . $

]
] <lem:small-first-moment>

#proof[
  For $R gt.eq 2$, choose a smooth $phi.alt_R$ on $\( 0 \, oo \)$, equal to $1 \/ u$ on $\[ 1 \, R \]$, with $0 lt.eq phi.alt_R \( u \) lt.eq 1 \/ u$ and support in $\[ 1 \/ 2 \, 2 R \]$. Put
  $ A_R = integral phi.alt_R \, #h(2em) B_R = integral u phi.alt_R \( u \)^2 thin d u \, #h(2em) N_R^2 = integral phi.alt_R^2 . $
  Then $A_R gt.eq log R$, $B_R lt.eq log \( 4 R \)$, and $1 \/ 2 lt.eq N_R^2 lt.eq 2$. Set $g_0 = phi.alt_R \/ N_R$, $c = lambda \/ \( integral g_0 \)^2$, and $g \( u \) = c^(- 1 \/ 2) g_0 \( u \/ c \)$. Changes of variable give exactly
  $ integral g^2 = 1 \, #h(2em) integral g = sqrt(lambda) \, #h(2em) mu_g = lambda B_R / A_R^2 lt.eq lambda frac(log \( 4 R \), \( log R \)^2) . $
  Choose $R$ sufficiently large and then hold it fixed. ◻
]

The profile just constructed may have a very large support endpoint and variance. We need only their finiteness for this one fixed profile: the dimension will be chosen afterwards. The auxiliary limit in the next proposition concerns the constants $w$ and $v$ attached to finite families, before any asymptotic in $X$ is taken.

#thm([Proposition 4.2.])[
  (Cancellation between high dimensions).  #emph[For every fixed $lambda > 0$, there are families of the type used in Proposition 5, with increasing finite maximum dimension $k$, for which $w arrow.r 1$ and $v arrow.r 0$.]
] <prop:dimension-cancellation>

#proof[
  Fix $0 < beta < gamma < tau$ and choose $g$ from Lemma 6. Write $d = beta - mu_g > 0$. Let $B$ be an upper endpoint of the support of $g$, and let $s_g^2$ be the variance of the probability density $g^2$. All these quantities are fixed and finite; they need not be bounded uniformly in $lambda$.
  For a large integer $k$ and $0 lt.eq j lt.eq k$, define
  $ Q_j \( upright(bold(t)) \) = k^(j \/ 2) product_(i = 1)^j g \( k t_i \) \, #h(2em) S_j = sum_(i = 1)^j t_i \, $
  with $Q_0 = 1$ and $S_0 = 0$. Before imposing the simplex cutoff, these products satisfy
  $ parallel Q_j parallel_2 = 1 \, #h(2em) T Q_(j + 1) = sqrt(lambda \/ k) thin Q_j quad \( 0 lt.eq j < k \) . $
  Since $alpha_j \/ alpha_(j + 1) = \( j + 1 \) \/ lambda$, alternating products $\( - 1 \)^j Q_j \/ sqrt(alpha_j)$ at neighboring levels therefore cancel up to the factor $1 - sqrt(\( j + 1 \) \/ k)$. We use $r$ neighboring levels near $k$: the condition $r \/ k arrow.r 0$ makes these factors small, while $r arrow.r oo$ makes the two endpoint contributions small after normalizing the squared mass equally across the levels.
  Take $r = floor.l sqrt(k) floor.r$ and $a = k - r + 1$. Choose once and for all a smooth cutoff $chi$ with $0 lt.eq chi lt.eq 1$, equal to one on $\[ 0 \, beta \]$ and zero on $\[ gamma \, oo \)$. At the $r$ indices $a lt.eq j lt.eq k$, set
  #[#set math.equation(numbering: n => "(6)")
   $ f_j \( upright(bold(t)) \) = frac(\( - 1 \)^j, sqrt(r) sqrt(alpha_j)) Q_j \( upright(bold(t)) \) chi \( S_j \) \, $ <eq:active-levels>]
  and set all other $f_j$, including $f_0$, to zero. Each selected finite family has compact interior support: every coordinate is bounded away from zero by a positive support endpoint of $g$ divided by $k$, and the cutoff forces $S_j lt.eq gamma < tau$.
  The density $Q_j^2$ has total mass one. Under it the variables $k t_i$ are independent with density $g^2$, so, for $j lt.eq k$,
  $ bb(E)_j S_j = frac(j mu_g, k) lt.eq mu_g \, #h(2em) "Var"_j \( S_j \) = frac(j s_g^2, k^2) lt.eq s_g^2 / k . $
  Chebyshev’s inequality therefore gives
  #[#set math.equation(numbering: n => "(7)")
   $ 1 - frac(s_g^2, k d^2) lt.eq w = 1 / r sum_(j = a)^k bb(E)_j \[ chi \( S_j \)^2 \] lt.eq 1 . $ <eq:w-concentration>]
  This proves $w arrow.r 1$.
  For $a lt.eq j lt.eq k - 1$, substituting $u = k t_(j + 1)$ and using $alpha_j \/ alpha_(j + 1) = \( j + 1 \) \/ lambda$ gives
  #[#set math.equation(numbering: n => "(8)")
   $ sqrt(alpha_j) \( f_j + T f_(j + 1) \) \( upright(bold(t)) \) & = frac(\( - 1 \)^j Q_j \( upright(bold(t)) \), sqrt(r)) [chi \( S_j \) - sqrt(frac(j + 1, lambda k)) integral_0^oo g \( u \) chi \( S_j + u \/ k \) thin d u] . $ <eq:interior-cancellation>]
  For $k gt.eq 2 B \/ d$, Chebyshev’s inequality gives, uniformly in $j lt.eq k$,
  $ bb(P)_j \( S_j > beta - B \/ k \) lt.eq frac(4 s_g^2, k d^2) . $
  On the complementary event every cutoff in (8) equals one. The bracket is then $1 - sqrt(\( j + 1 \) \/ k)$, whose square is at most $\( r \/ k \)^2$. Everywhere, both terms in the bracket lie in $\[ 0 \, 1 \]$, since $g gt.eq 0$, $integral g = sqrt(lambda)$, and $j + 1 lt.eq k$; its absolute value is at most one. After summing the $r - 1$ interior terms, their total contribution to $v \/ lambda$ is at most
  $ \( r \/ k \)^2 + frac(4 s_g^2, k d^2) . $
  Here the probability estimate is with respect to $Q_j^2$, while the coordinate-deletion integral contains $g \( u \) thin d u$. The passage between them uses no comparison of these measures: on the complementary event, $S_j + u \/ k lt.eq beta$ holds for every $u$ in the support of $g$. Thus the whole integral has its cutoff equal to one pointwise.
  Exactly two further indices can contribute. At the top, $j = k$, the term is $alpha_k parallel f_k parallel_2^2 lt.eq 1 \/ r$. At the bottom, $j = a - 1 = k - r$, only $T f_a$ occurs, and
  $ sqrt(alpha_(a - 1)) T f_a = frac(\( - 1 \)^a Q_(a - 1), sqrt(r)) sqrt(frac(a, lambda k)) integral_0^oo g \( u \) chi \( S_(a - 1) + u \/ k \) thin d u . $
  Its squared norm is at most $a \/ \( k r \) lt.eq 1 \/ r$. Consequently
  #[#set math.equation(numbering: n => "(9)")
   $ 0 lt.eq v / lambda lt.eq 2 / r + (r / k)^2 + frac(4 s_g^2, k d^2) arrow.r 0 . $ <eq:v-cancellation-bound>]
  Together with (7), this proves the proposition. ◻
]

#proof[
  Fix $lambda > 0$ and one function $G$ as in Proposition 5. Set
  $ K_lambda = C_(*) = lambda + lambda^2 c_G^2 . $
  This choice is independent of $epsilon$. Given $epsilon > 0$, choose $beta$, $gamma$, $g$, and $chi$ as in the preceding construction. By Proposition 7, one can select a #emph[single finite] $k$ and its family with $w > 0$ and $v \/ w lt.eq epsilon$. Freeze this family and define
  $ W_X \( m \) = frac(Z \( m \)^2, w) . $
  All conclusions follow from Proposition 5 by division by $w$, or by $w^2$ for the second moment. Once the construction is chosen in terms of $lambda$ and $epsilon$, the fixed-family second-moment bound may be written $O_(lambda \, epsilon) \( 1 \)$.
  The parameter order is essential: the auxiliary limit $k arrow.r oo$ produces one family, and only then does $X arrow.r oo$. No divisor-sum asymptotic uniform in $k$ is required. For an arbitrary fixed gap threshold $C > 0$, the application in Section 2 chooses a fixed $lambda > max { 1 \, C }$ before making these choices. ◻
]

== 5 Analytic estimates for the square <sec:moments>

It remains to prove the moment identities and detector bound in Proposition 5. The products in $Z^2$ contain two divisor-sum factors, those in $Z^4$ contain four, and the detector estimate uses six. We first evaluate all these products in one formula that allows repeated shifts and one prime mark. We then average the resulting singular series over the shifts in $I$ and $J$, and apply the formulas to the square. All dimensions, support budgets and functions remain fixed as $X$ tends to infinity.

The leading coefficient separates into a test-function constant, determined by which coordinates share a shift, and a singular series carrying the numerical shifts. This separation is what permits the subset expansions of $Z$ to be summed uniformly.

For a finite set $cal(H)$ of distinct integers, put

$ nu_p \( cal(H) \) = \| cal(H) med mod med p \| \, #h(2em) frak(S) \( cal(H) \) = product_p \( 1 - nu_p \( cal(H) \) \/ p \) \( 1 - 1 \/ p \)^(- \| cal(H) \|) . $

We set $frak(S) \( diameter \) = 1$. For a nonempty set the product converges: beyond its diameter, the factors are $1 + O_(\| cal(H) \|) \( p^(- 2) \)$. It is nonnegative and may be zero. The product is one when $\| cal(H) \| = 1$.

#thm([Proposition 5.1.])[
  (Uniform mixed moments).  #emph[Put $L = log X$, where $X$ tends to infinity through integers, and let $bb(E)_X$ denote the average over $X < m lt.eq 2 X$. Fix nonnegative integers $j_1 \, dots.h \, j_R$. For each $r$, let $F_r$ be a real function on $\[ 0 \, oo \)^(j_r)$ admitting a smooth compactly supported extension to $bb(R)^(j_r)$, and suppose that on the orthant it vanishes outside 
$ v_1 + dots.h.c + v_(j_r) lt.eq rho_r . $

 Here the support budgets $rho_r gt.eq 0$ are fixed. Dimension zero means a scalar, with support budget zero. For positive divisors define 
$ D_(F_r) \( m \; upright(bold(b))^(\( r \)) \) = sum_(d_(r \, ell) divides m + b_(r \, ell) med \( 1 lt.eq ell lt.eq j_r \)) product_(ell = 1)^(j_r) mu \( d_(r \, ell) \) F_r ((frac(log d_(r \, ell), L))_(ell = 1)^(j_r)) . $

 For $j_r = 0$, this means $D_(F_r) = F_r$.]
  #emph[Let $Gamma = { \( r \, ell \) : 1 lt.eq r lt.eq R \, med 1 lt.eq ell lt.eq j_r }$, and fix a surjection $kappa : Gamma arrow.r { 1 \, dots.h \, t }$. Write $cal(M)_i = kappa^(- 1) \( { i } \)$. Take distinct integer shifts $a_1 \, dots.h \, a_t$ with $\| a_i \| lt.eq D L^B$, where $D > 0$ and $B gt.eq 1$ are fixed, and set $b_(r \, ell) = a_(kappa \( r \, ell \))$. Choose $delta in { 0 \, 1 }$. In the marked case take one more shift $a_0$, distinct from these and satisfying the same bound. Put 
$ \( chi_delta \( m \) \, cal(H) \) = cases(delim: "{", \( 1 \, { a_1 \, dots.h \, a_t } \) \, & delta = 0 \,, \( theta.alt \( m + a_0 \) \, { a_0 \, a_1 \, dots.h \, a_t } \) \, & delta = 1 \,) #h(2em) theta.alt \( n \) = \( log n \) 1_({ n upright(" prime") }) . $

 Assume $sum_r rho_r < 1$ if $delta = 0$, and $sum_r rho_r < 1 \/ 2$ if $delta = 1$. Then there is a real constant $cal(C)$, depending only on the functions and $kappa$, such that 
#[#set math.equation(numbering: n => "(10)")
 $ bb(E)_X [chi_delta \( m \) product_r D_(F_r) \( m \; upright(bold(b))^(\( r \)) \)] = L^(- t) {frak(S) \( cal(H) \) cal(C) + O #h(-0.16667em) (L^(- 1 \/ 2) \( log L \)^A)} . $ <eq:mixed-moment>]

 Here $A$ is a fixed finite number depending only on $sum_r j_r$; the implied constant may depend on all the fixed data, but is uniform in the actual shifts. In particular the error is additive when $frak(S) \( cal(H) \) = 0$.]
  #emph[If each $\| cal(M)_i \|$ is at most two, the constant is 
#[#set math.equation(numbering: n => "(11)")
 $ cal(C) = integral product_r (\( - 1 \)^(j_r) partial_1 dots.h.c partial_(j_r) F_r) #scale(x: 120%, y: 120%)[\(] \( y_(kappa \( r \, ell \)) \)_(ell = 1)^(j_r) #scale(x: 120%, y: 120%)[\)] product_(i : thin \| cal(M)_i \| = 2) d y_i \, $ <eq:mixed-derivative-constant>]

 where $y_i = 0$ for $\| cal(M)_i \| = 1$, and each integrated variable ranges over $\[ 0 \, oo \)$. The zero-dimensional derivative is the original scalar. When $Gamma$ is empty, take $t = 0$ and $cal(C) = product_r F_r$.]
] <prop:mixed-moments>

The integer $t$ counts distinct numerical shifts, whereas $sum_r j_r$ counts divisor coordinates with repetitions. The power $L^(- t)$ is determined by the former. Repetitions are recorded by the fibers $cal(M)_i$ and affect the constant $cal(C)$. For two divisor-sum factors whose individual shift tuples have distinct entries, these fibers have size at most two. Products of four such factors may have larger fibers; their estimates will use the general finiteness assertion rather than the displayed derivative formula. The marked formula retains the same power $L^(- t)$, consistent with $theta.alt \( m + a_0 \)$ having average tending to one. The additional factor $L^(- 1)$ in $V_B$ is supplied when the marked shifts are summed.

The scalar divisor-sum correlations of Goldston–Yıldırım #cite(label("GoldstonYildirim2003Triple")) #cite(label("GY2005")) and Tao’s smooth Fourier formulation, described by Maynard #cite(label("Maynard2015")) Section 6, p. 404 motivate this calculation. We include its proof because coupled smooth functions, arbitrary equality patterns and an additive error uniform in logarithmic shifts are needed here. The choice of smooth cutoffs was also informed by the analysis of smoothing and high moments of divisor sums by Granville–Koukoulopoulos–Maynard #cite(label("GKM2021")). This is motivation for the cutoff choice, not a source of the mixed-moment proposition proved here.

=== 5.1 Residue classes and the prime mark <residue-classes-and-the-prime-mark>

Our objective is to replace a product of divisor sums, possibly weighted by one shifted prime, by an explicit finite density sum. We use the ordinary endpoint Bombieri–Vinogradov theorem in the form recorded by Bombieri, Friedlander and Iwaniec #cite(label("BFI1986")) p. 206, equation (1.4); their $psi$ notation is defined on p. 204. The additional divisor weights and endpoint shifts required here are handled below.

We retain the notation of Proposition 8 and put $H_X = D L^B$. The two arithmetic lemmas below also allow $B gt.eq 0$. Negative shifts cause no difficulty, since all shifted arguments are positive for sufficiently large $X$. We write $Lambda$ for the von Mangoldt function, $phi \( q \)$ for Euler’s totient, $omega \( q \)$ for the number of distinct prime divisors of $q$, $d \( q \)$ for the number of positive divisors, and $zeta$ for the Riemann zeta function.

#thm([Lemma 5.2.])[
  (Weighted distribution with uniform shifted endpoints).  #emph[]
  #emph[Assume the Bombieri–Vinogradov theorem: for every $A > 0$ there is $b \( A \) > 0$ such that 
#[#set math.equation(numbering: n => "(12)")
 $ sum_(q lt.eq x^(1 \/ 2) \( log x \)^(- b \( A \))) max_(\( c \, q \) = 1) lr(|psi \( x \; q \, c \) - frac(x, phi \( q \))|) lt.double_A x \( log x \)^(- A) . $ <eq:arithmetic-BV>]

 Here $psi \( x \; q \, c \) = sum_(n lt.eq x \, med n equiv c med \( mod med q \)) Lambda \( n \)$, and $q = 1$ is included. Fix $0 lt.eq sigma < 1 \/ 2$, $K gt.eq 1$, and define 
$ E_X \( q \) = max_(a in bb(Z) \, med \| a \| lt.eq H_X\
\( c \, q \) = 1) lr(|sum_(X + a < n lt.eq 2 X + a\
n equiv c med \( mod med q \)) theta.alt \( n \) - frac(X, phi \( q \))|) . $

 For every $A > 0$, 
#[#set math.equation(numbering: n => "(13)")
 $ sum_(q lt.eq X^sigma) mu^2 \( q \) K^(omega \( q \)) E_X \( q \) lt.double_(A \, sigma \, K \, D \, B) X L^(- A) . $ <eq:arithmetic-1>]

 The conventions are $omega \( 1 \) = 0$, $K^0 = 1$, and $phi \( 1 \) = 1$.]
] <lem:arithmetic-1>

#proof[
  At either endpoint $x = X \, 2 X$, the range $q lt.eq X^sigma$ is contained in the range of (12) for every fixed logarithmic saving once $X$ is sufficiently large. Removing proper prime powers from a $psi$-sum costs at most
  $ sum_(p^j lt.eq 3 X \, med j gt.eq 2) log p lt.double X^(1 \/ 2) L^2 $
  in each residue class. Indeed there are $O \( X^(1 \/ 2) L \)$ pairs $p \, j gt.eq 2$, and each summand is $O \( L \)$. Translating the two endpoints through any $\| a \| lt.eq H_X$ costs $O \( \( H_X + 1 \) L \)$, uniformly in the residue class. Thus, writing $Q = floor.l X^sigma floor.r$, for every $A_0 > 0$,
  #[#set math.equation(numbering: n => "(14)")
   $ sum_(q lt.eq Q) E_X \( q \) lt.double_(A_0) X L^(- A_0) + Q { X^(1 \/ 2) L^2 + \( H_X + 1 \) L } lt.double_(A_0 \, sigma \, D \, B) X L^(- A_0) . $ <eq:arithmetic-2>]
  The last absorption uses the fixed strict inequality $sigma < 1 \/ 2$. The same bound controls the maximum over all shifts at once; no union bound over shifts is used.
  An interval of length $X$ contains at most $X \/ q + 1$ integers in one residue class. Also
  $ frac(q, phi \( q \)) = product_(p divides q) frac(p, p - 1) lt.eq 2^(omega \( q \)) lt.eq d \( q \) . $
  Since $q lt.eq Q < X$ for large $X$, these two facts give
  #[#set math.equation(numbering: n => "(15)")
   $ E_X \( q \) lt.double X / q { L + d \( q \) } . $ <eq:arithmetic-3>]
  For every fixed real $T gt.eq 1$,
  #[#set math.equation(numbering: n => "(16)")
   $ sum_(q lt.eq Q) frac(mu^2 \( q \) T^(omega \( q \)), q) lt.eq product_(p lt.eq Q) \( 1 + T \/ p \) lt.double_T L^(c_T) $ <eq:arithmetic-4>]
  for a finite constant $c_T$. The elementary bound $sum_(p lt.eq y) 1 \/ p = O \( log log \( 3 y \) \)$ suffices: for $y gt.eq 2$, compare $1 \/ p lt.eq e p^(- 1 - 1 \/ log y)$ with $log zeta \( 1 + 1 \/ log y \)$, and bound $zeta \( 1 + u \) lt.eq 1 + 1 \/ u$. No prime-number theorem is needed for this estimate.
  As squarefree $q$ satisfy $d \( q \) = 2^(omega \( q \))$, (15)–(16) imply, for some finite $c_K$,
  $ sum_(q lt.eq Q) mu^2 \( q \) K^(2 omega \( q \)) E_X \( q \) lt.double_K X L^(c_K) . $
  Cauchy–Schwarz, applied to the nonnegative numbers $E_X \( q \)$, therefore gives
  $ sum_(q lt.eq Q) mu^2 \( q \) K^(omega \( q \)) E_X \( q \) & lt.eq (sum_(q lt.eq Q) E_X \( q \))^(1 \/ 2) (sum_(q lt.eq Q) mu^2 \( q \) K^(2 omega \( q \)) E_X \( q \))^(1 \/ 2)\
 & lt.double X L^(\( c_K - A_0 \) \/ 2) . $
  Choose $A_0 gt.eq c_K + 2 A$. This proves (13). ◻
]

#thm([Lemma 5.3.])[
  (Exact density sum and arithmetic error).  #emph[]
  #emph[Use the notation and support assumptions of Proposition 8; this lemma requires only bounded functions $F_r$ and also allows $B gt.eq 0$ in the shift bound $H_X = D L^B$. Put $M = \| Gamma \|$ and $sigma = sum_r rho_r$. As in the proposition, assume $sigma < 1$ when $delta = 0$ and $sigma < 1 \/ 2$ when $delta = 1$.]
  #emph[For a squarefree divisor tuple $upright(bold(d)) = \( d_gamma \)_(gamma in Gamma)$, put $q = \[ d_gamma : gamma in Gamma \]$, with $q = 1$ when $M = 0$. Call the tuple compatible if, for every $p divides q$, the shifts $b_gamma$ with $p divides d_gamma$ have one common residue modulo $p$. When $delta = 1$, require this residue to differ from $a_0 med mod med p$. Set 
$ rho_delta \( upright(bold(d)) \) = cases(delim: "{", product_(p divides q) \( p - delta \)^(- 1) \, & upright(bold(d)) upright(" compatible") \,, 0 \, & upright("otherwise") \,) $

 and define the finite density sum 
#[#set math.equation(numbering: n => "(17)")
 $ cal(A)_delta = sum_(upright(bold(d)) upright(" squarefree")) rho_delta \( upright(bold(d)) \) product_(gamma in Gamma) mu \( d_gamma \) product_r F_r ((frac(log d_(r \, ell), L))_(ell = 1)^(j_r)) . $ <eq:arithmetic-5>]

 Empty products are one. For every $A > 0$, uniformly in the allowed shifts, 
#[#set math.equation(numbering: n => "(18)")
 $ bb(E)_X [chi_delta \( m \) product_r D_(F_r) \( m \; upright(bold(b))^(\( r \)) \)] = cal(A)_delta + O_A \( L^(- A) \) . $ <eq:arithmetic-6>]

 The implied constant may depend on the fixed functions, dimensions, support budgets, $D \, B \, A$. For $delta = 0$ and $M gt.eq 1$, the error is 
#[#set math.equation(numbering: n => "(19)")
 $ O #scale(x: 120%, y: 120%)[\(] X^(sigma - 1) \( 1 + log X \)^(M - 1) product_r parallel F_r parallel_oo #scale(x: 120%, y: 120%)[\)] . $ <eq:arithmetic-7>]

]
] <lem:arithmetic-2>

#proof[
  Expand the product of divisor sums. Möbius factors kill all nonsquarefree divisors. Whenever the product of the $F_r$’s is nonzero, the support hypothesis gives
  #[#set math.equation(numbering: n => "(20)")
   $ product_(ell = 1)^(j_r) d_(r \, ell) lt.eq X^(rho_r) quad upright("for every ") r \, #h(2em) q lt.eq product_gamma d_gamma lt.eq X^sigma . $ <eq:arithmetic-8>]
  This uses the budget of the sum of the coordinates in each factor, and does not impose a budget on the dimension.
  For a squarefree tuple, the conditions $d_gamma divides m + b_gamma$ prescribe at prime $p divides q$ the residues $m equiv - b_gamma med \( mod med p \)$ for all selected coordinates. These congruences are inconsistent unless the selected shifts agree modulo every $p divides q$. When they agree, the Chinese remainder theorem prescribes exactly one class $m med \( mod med q \)$. In the unmarked case this is precisely compatibility, and the count is $X \/ q + O \( 1 \)$, with an absolute constant in the $O \( 1 \)$.
  When $M gt.eq 1$, the number of positive integer tuples whose product is at most $Y gt.eq 1$ is at most
  #[#set math.equation(numbering: n => "(21)")
   $ Y (sum_(d lt.eq Y) 1 / d)^(M - 1) lt.eq Y \( 1 + log Y \)^(M - 1) . $ <eq:arithmetic-9>]
  Indeed, fix the first $M - 1$ entries and bound the number of possible last entries by $Y$ divided by their product, then enlarge each preceding summation to $d lt.eq Y$. Apply (21) with $Y = X^sigma$, multiply the $O \( 1 \)$ count error by $product_r parallel F_r parallel_oo$, and divide by $X$. This proves (19), hence (18) in the unmarked case. If $M = 0$, the unmarked average and (17) are both exactly $product_r F_r$.
  For the marked case, put $n = m + a_0$. On a residue class satisfying these divisor congruences, the residue of $n med \( mod med p \)$ is $a_0 - b_gamma$ whenever $p divides d_gamma$. Consequently this class is reduced modulo $q$ exactly when the additional marked compatibility condition holds. If it is not reduced, a prime $n$ in that class would have to be a prime divisor of $q$, hence satisfy $n lt.eq q$. But (20) and $sigma < 1 \/ 2$ give
  $ n gt.eq X - H_X > X^sigma gt.eq q $
  for large $X$. The marked sum on a nonreduced class is therefore exactly zero, not an unestimated exceptional term. On a reduced class, the marked sum is
  $ frac(X, phi \( q \)) + O \( E_X \( q \) \) . $
  Since $q$ is squarefree, $phi \( q \) = product_(p divides q) \( p - 1 \)$, proving the main density factor in (17).
  For fixed squarefree $q$, each prime dividing $q$ must be assigned to a nonempty subset of the $M$ divisor coordinates. There are at most $\( 2^M - 1 \)^(omega \( q \)) lt.eq \( 2^M \)^(omega \( q \))$ choices if $M gt.eq 1$; support and compatibility only reduce this count. The empty tuple, if $M = 0$, has $q = 1$ and is handled directly by the same bound with $K = 1$. Thus the total normalized error is at most
  $ frac(product_r parallel F_r parallel_oo, X) sum_(q lt.eq X^sigma) mu^2 \( q \) \( 2^M \)^(omega \( q \)) E_X \( q \) \, $
  which is $O_A \( L^(- A) \)$ by Lemma 9. This proves the marked case, including all scalar factors and the wholly zero-dimensional case. ◻
]

=== 5.2 Fourier evaluation of the density sum <fourier-evaluation-of-the-density-sum>

The residue-class calculation has controlled the prime-counting error. It remains to evaluate its finite density sum, separating a constant determined by the test functions from the singular series of the shifts.

#proof[
  Let $M = \| Gamma \|$. By Lemma 10, it remains to evaluate $cal(A)_delta$ from (17): the arithmetic error is $O_N \( L^(- N) \)$ for every fixed $N$. If $M = 0$, that sum is exactly $product_r F_r$, and the assertion follows. We henceforth assume $M > 0$.
  Choose a smooth compact extension $tilde(F)_r$ of each positive-dimensional function and define its Fourier transform by
  $ Phi_r \( upright(bold(u)) \) = \( 2 pi \)^(- j_r) integral_(bb(R)^(j_r)) e^(sum_ell v_ell) tilde(F)_r \( upright(bold(v)) \) e^(upright(i) upright(bold(u)) dot.op upright(bold(v))) thin d upright(bold(v)) . $
  The function $Phi_r$ is Schwartz, and Fourier inversion gives exactly
  #[#set math.equation(numbering: n => "(22)")
   $ F_r \( upright(bold(v)) \) = integral_(bb(R)^(j_r)) Phi_r \( upright(bold(u)) \) e^(- sum_ell \( 1 + upright(i) u_ell \) v_ell) thin d upright(bold(u)) #h(2em) \( upright(bold(v)) in \[ 0 \, oo \)^(j_r) \) . $ <eq:fourier-inversion>]
  For scalar factors use the scalar itself. Put $Phi = product_r Phi_r$, $z_gamma = \( 1 + upright(i) u_gamma \) \/ L$, and $z_S = sum_(gamma in S) z_gamma$.
  Insert (22) into the density sum (17), retaining the sum over all squarefree tuples. The following bound justifies moving that sum inside the integrals:
  #[#set math.equation(numbering: n => "(23)")
   $ sum_(upright(bold(d))) rho_delta \( upright(bold(d)) \) product_gamma d_gamma^(- 1 \/ L) lt.eq product_p \( 1 + C_M p^(- 1 - 1 \/ L) \) lt.double_M L^(C_M) . $ <eq:absolute-euler-sum>]
  Indeed $1 \/ \( p - delta \) lt.eq 2 \/ p$, every nonempty selected subset contributes at most $p^(- 1 \/ L)$, and there are at most $2^M - 1$ subsets. Moreover $sum_p p^(- 1 - epsilon) lt.eq log zeta \( 1 + epsilon \) lt.eq log \( 1 + 1 \/ epsilon \)$. Multiplication by the finite integral $integral \| Phi \|$ proves absolute convergence of the sum-integral interchange.
  Call a nonempty subset $S subset Gamma$ allowed at $p$ if its shifts satisfy the same compatibility and mark-exclusion conditions. The exact Euler factor is then
  $ P_p \( upright(bold(z)) \) = 1 + frac(1, p - delta) sum_(S upright(" allowed at ") p) \( - 1 \)^(\| S \|) p^(- z_S) \, #h(2em) cal(A)_delta = integral Phi \( upright(bold(u)) \) product_p P_p \( upright(bold(z)) \) thin d upright(bold(u)) . $
  By (23) and Schwartz decay, the part of this integral where $max_gamma \| u_gamma \| > sqrt(L)$ is $O_N \( L^(- N) \)$ for every fixed $N$. All subsequent comparisons are made on the complementary region.
  The factors carrying the zeta poles are
  $ B_p \( upright(bold(z)) \) = product_(i = 1)^t product_(diameter eq.not S subset cal(M)_i) \( 1 - p^(- 1 - z_S) \)^(- \( - 1 \)^(\| S \|)) \, #h(2em) H_p \( upright(bold(z)) \) = P_p \( upright(bold(z)) \) \/ B_p \( upright(bold(z)) \) . $
  For $Re z_gamma gt.eq 0$, all denominators in this expression have absolute value at least $1 \/ 2$, and $\| H_p \( upright(bold(z)) \) \| lt.eq exp \( C_M \/ p \)$. If distinct shifts in $cal(H)$ have distinct residues modulo $p$, the allowed subsets are exactly the nonempty subsets of the individual fibers $cal(M)_i$. Matching the terms of order $p^(- 1)$ gives
  #[#set math.equation(numbering: n => "(24)")
   $ H_p \( upright(bold(z)) \) = 1 + O_M \( p^(- 2) \) \, $ <eq:generic-local-factor>]
  uniformly for $Re z_gamma gt.eq 0$.
  At $upright(bold(z)) = 0$, summing signs over the nonempty subsets of each occupied allowed residue class gives
  $ P_p \( 0 \) = frac(p - nu_p \( cal(H) \), p - delta) \, #h(2em) B_p \( 0 \) = \( 1 - 1 \/ p \)^t . $
  It follows that $H_p \( 0 \)$ is the local factor of $frak(S) \( cal(H) \)$. This identity holds also when that factor is zero.
  We now compare the product of the $H_p$’s additively with its value at zero. Take $Y = max \( 2 \, 2 D L^B \)$. For $p lt.eq Y$, differentiation along the segment from zero to $upright(bold(z))$ gives
  $ \| H_p \( upright(bold(z)) \) - H_p \( 0 \) \| lt.double_M L^(- 1 \/ 2) frac(log p, p) . $
  For example, $\| p^(- z_S) - 1 \| lt.eq \| z_S \| log p$ on that segment, while the denominators stay bounded away from zero. Each mixed partial product in the additive telescoping identity is at most
  $ exp (C_M sum_(p lt.eq Y) 1 \/ p) lt.double_M \( log Y \)^(C'_M) . $
  Using even the elementary bound $sum_(p lt.eq Y) \( log p \) \/ p lt.eq sum_(n lt.eq Y) \( log n \) \/ n = O \( \( log Y \)^2 \)$, we obtain an error $O \( L^(- 1 \/ 2) \( log L \)^A \)$ for the finite product. For $p > Y$ there are no collisions of distinct shifts, so (24) shows that both remaining tail products are $1 + O_M \( 1 \/ Y \)$. Consequently
  #[#set math.equation(numbering: n => "(25)")
   $ product_p H_p \( upright(bold(z)) \) = frak(S) \( cal(H) \) + O #h(-0.16667em) (L^(- 1 \/ 2) \( log L \)^A) \, #h(2em) frak(S) \( cal(H) \) lt.double \( log L \)^A . $ <eq:zero-safe-comparison>]
  This argument never divides by a possibly zero local singular-series factor.
  It remains to evaluate the zeta factors. Absolute Euler products for $Re z_gamma > 0$ give
  $ product_p B_p \( upright(bold(z)) \) = product_(i = 1)^t product_(diameter eq.not S subset cal(M)_i) zeta \( 1 + z_S \)^(\( - 1 \)^(\| S \|)) . $
  Write $w_gamma = 1 + upright(i) u_gamma$ and
  $ K_i \( upright(bold(u)) \) = product_(diameter eq.not S subset cal(M)_i) (sum_(gamma in S) w_gamma)^(\( - 1 \)^(\| S \| + 1)) . $
  The pole expansion $zeta \( 1 + z \) = z^(- 1) \( 1 + O \( \| z \| \) \)$ and the identity $sum_(diameter eq.not S subset cal(M)_i) \( - 1 \)^(\| S \|) = - 1$ imply
  #[#set math.equation(numbering: n => "(26)")
   $ product_p B_p \( upright(bold(z)) \) = L^(- t) product_i K_i \( upright(bold(u)) \) { 1 + O_M \( L^(- 1 \/ 2) \) } . $ <eq:zeta-kernel>]
  Every denominator in $K_i$ has positive integer real part, so the product of the $K_i$ has at most polynomial growth. Thus
  $ cal(C) = integral_(bb(R)^M) Phi \( upright(bold(u)) \) product_i K_i \( upright(bold(u)) \) thin d upright(bold(u)) $
  is absolutely convergent. Integrating (25) and (26) against the Schwartz transform, then restoring the negligible frequency tails, proves (10). The constant is real by conjugation under $upright(bold(u)) mapsto - upright(bold(u))$.
  Finally, a singleton fiber contributes $w_gamma$, and a double fiber contributes
  $ frac(w_gamma w_(gamma'), w_gamma + w_(gamma')) = w_gamma w_(gamma') integral_0^oo e^(- \( w_gamma + w_(gamma') \) y_i) thin d y_i . $
  After taking absolute values, the new variables contribute $e^(- 2 sum_i y_i)$; the remaining factor is a Schwartz function times a fixed polynomial. Fubini therefore applies. Recombining the Fourier integrals by differentiating (22) proves (11). ◻
]

=== 5.3 Averaging the singular series <sec:singular-average>

We next average the numerical-shift factor in Proposition 8. The following form allows different coordinates to range over either of the two blocks. It is a box version of Gallagher’s singular-series mean #cite(label("Gallagher1976")) p. 5, equation (3). We give a self-contained proof by truncating the Euler product; no statement about the distribution of primes in individual short intervals is assumed.

#thm([Lemma 5.4.])[
  (Singular series in boxes).  #emph[Fix an integer $s gt.eq 0$ and a constant $K gt.eq 1$. For each positive integer $h$, let $I_1 \, dots.h \, I_s$ be intervals of $h$ consecutive integers, all contained in an interval of diameter at most $K h$. Then, as $h arrow.r oo$, 
$ sum_(a_i in I_i med \( 1 lt.eq i lt.eq s \)\
a_1 \, dots.h \, a_s upright(" distinct")) frak(S) \( { a_1 \, dots.h \, a_s } \) = h^s \( 1 + o \( 1 \) \) . $

 The error is uniform in the intervals subject to this condition, with $s \, K$ fixed. Here $A_s$ denotes a fixed finite constant depending only on $s$. In fact the normalized sum differs from one by 
$ O_(s \, K) \( 1 \/ log log h \) + O_s #scale(x: 120%, y: 120%)[\(] h^(- 1 \/ 2) \( log log h \)^(A_s) #scale(x: 120%, y: 120%)[\)] . $

]
] <lem:singular-average>

#proof[
  The cases $s = 0 \, 1$ are immediate. Otherwise let $y = \( 1 \/ 4 \) log h$ and $Q = product_(p lt.eq y) p$. The prime number theorem gives $Q lt.eq h^(1 \/ 2)$ for large $h$. For all tuples, including those with equal entries, define
  $ frak(S)_y \( upright(bold(a)) \) = product_(p lt.eq y) \( 1 - nu_p \( { a_1 \, dots.h \, a_s } \) \/ p \) \( 1 - 1 \/ p \)^(- s) . $
  The exponent remains $- s$ even on tuples with collisions. For independent uniform residues $a_1 \, dots.h \, a_s$ modulo a prime $p$, averaging over an additional uniform residue $x$ gives
  $ bb(E) \( 1 - nu_p \/ p \) = bb(P) \( a_i eq.not x upright(" for every ") i \) = \( 1 - 1 \/ p \)^s . $
  The Chinese remainder theorem therefore shows that $frak(S)_y$ has exactly mean one on complete residue tuples modulo $Q$.
  A uniform integer in a length-$h$ interval has residue distribution modulo $Q$ within total variation $O \( Q \/ h \)$ of uniform. The elementary bound $sum_(p lt.eq y) 1 \/ p = O \( log log \( 3 y \) \)$ used above gives
  $ 0 lt.eq frak(S)_y \( upright(bold(a)) \) lt.eq product_(p lt.eq y) \( 1 - 1 \/ p \)^(- s) lt.double_s \( log y \)^(A_s) . $
  It follows that
  $ h^(- s) sum_(a_i in I_i) frak(S)_y \( upright(bold(a)) \) = 1 + O_s #scale(x: 120%, y: 120%)[\(] \( Q \/ h \) \( log y \)^(A_s) #scale(x: 120%, y: 120%)[\)] . $
  There are $O_s \( h^(s - 1) \)$ tuples with equal entries, so deleting them changes this normalized mean by at most $O_s \( h^(- 1) \( log y \)^(A_s) \)$.
  For a distinct tuple put $Delta = product_(i < j) \| a_i - a_j \|$, a positive integer. For $y > 2 s$ every factor of the tail
  $ T_y \( upright(bold(a)) \) = product_(p > y) \( 1 - nu_p \/ p \) \( 1 - 1 \/ p \)^(- s) $
  is positive. A prime not dividing $Delta$ has $nu_p = s$ and a local factor $1 + O_s \( p^(- 2) \)$; the logarithm of a remaining factor is $O_s \( 1 \/ p \)$. Hence
  $ \| log T_y \| lt.double_s 1 / y + sum_(p > y\
p divides Delta) 1 / p lt.eq C_s (1 / y + frac(log Delta, y log y)) . $
  Since $log Delta lt.eq binom(s, 2) log \( K h \)$, this gives, uniformly in the distinct tuples,
  $ T_y \( upright(bold(a)) \) = 1 + O_(s \, K) \( 1 \/ log log h \) . $
  Now use the identity $frak(S) \( { a_1 \, dots.h \, a_s } \) = frak(S)_y \( upright(bold(a)) \) T_y \( upright(bold(a)) \)$ and the nonnegative truncated mean. This identity is valid also if a small-prime factor vanishes; no quotient by $frak(S)_y$ is taken. The stated error follows from $Q lt.eq h^(1 \/ 2)$ and $log y asymp log log h$. ◻
]

When the shifts are summed, an equality pattern with $t$ distinct unmarked shifts has $O \( h^t \)$ assignments in fixed blocks of length $h asymp L$. Thus the uniform error in Proposition 8, summed over that pattern, is $O \( L^(- 1 \/ 2) \( log L \)^A \) = o \( 1 \)$. If one additional distinct prime shift is summed and its weight divided by $L$, there are $O \( h^(t + 1) \)$ assignments and the same conclusion holds. Only finitely many patterns occur for a fixed family of functions. The family is chosen before $X$ tends to infinity.

=== 5.4 Evaluation of the square <sec:weight-moment-proof>

We now apply the correlation formula and singular-series mean to the functions constructed in Section 3. The signed complete mixed derivative of each cumulative function is $f_j$, as in (2); its vanishing on coordinate faces will leave only matching subsets in the quadratic moments.

The support restrictions in the moment formula apply to the sum of the support budgets of the factors, independently of their dimensions. For the present choice $tau = 1 \/ 8$, the required uses are as follows:

#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Quantity
], table.cell(rowspan: 1, colspan: 1)[Moment used
], table.cell(rowspan: 1, colspan: 1)[Total support budget
]),
  table.cell(rowspan: 1, colspan: 1)[$bb(E)_X Z^2$
], table.cell(rowspan: 1, colspan: 1)[unmarked
], table.cell(rowspan: 1, colspan: 1)[$2 tau < 1$
],
  table.cell(rowspan: 1, colspan: 1)[$bb(E)_X \( Z^2 V_B \)$, $B = I \, J$
], table.cell(rowspan: 1, colspan: 1)[one prime mark
], table.cell(rowspan: 1, colspan: 1)[$2 tau < 1 \/ 2$
],
  table.cell(rowspan: 1, colspan: 1)[$bb(E)_X Z^4$
], table.cell(rowspan: 1, colspan: 1)[unmarked
], table.cell(rowspan: 1, colspan: 1)[$4 tau < 1$
],
  table.cell(rowspan: 1, colspan: 1)[Detector off-diagonal terms
], table.cell(rowspan: 1, colspan: 1)[unmarked
], table.cell(rowspan: 1, colspan: 1)[$6 tau < 1$
],
)
]

The last line uses divisor-sum majorants for the two possible primes in $J$. It therefore requires no asymptotic formula with two prime marks.

#proof[
  First we check the smoothness and support needed by the moment formula. Extend $f_j$ by zero to $bb(R)^j$. Its cumulative integral is smooth on $bb(R)^j$, and multiplication by smooth coordinate cutoffs that equal one near $\[ 0 \, oo \)$ and vanish below $- 1$ makes it compactly supported without changing its orthant values or derivatives. Indeed, the cumulative integral already vanishes when any coordinate exceeds an upper support bound of $f_j$. On the nonnegative orthant, $F_j$ vanishes if $sum_i v_i gt.eq tau$, and its signed complete mixed derivative is given by (2). This derivative is zero on every coordinate face. For $j gt.eq 1$, $T f_(j + 1)$ has the same smoothness, interior-support, and face-vanishing properties.
  Expand $Z^2$ over pairs of subsets $S \, T subset I$. Any shift in $S triangle.stroked.t T$ occurs once and sets a coordinate of one of the functions in (2) to zero. Its main coefficient is therefore zero. If $S = T$ has size $j$, the coefficient is $parallel f_j parallel_2^2$. Averaging the singular series and using
  $ binom(h, j) / L^j arrow.r alpha_j $
  proves the first limit in (3). With a prime mark in $J$, the same matching rule applies and
  $ frac(h binom(h, j), L^(j + 1)) arrow.r lambda alpha_j . $
  The two divisor factors have total support $2 tau < 1 \/ 2$, so the marked moment formula proves the first limit in (3).
  For an internal mark $a in I$, the exact deletion identity (5) replaces $F_j$ by $tilde(F)_j = F_j + F_(j + 1) \( dot.op \, 0 \)$ on the prime event. Deletion is a bijection, so no extra dimension factor occurs. The support radius of $tilde(F)_j$ is still $tau$, and its signed complete mixed derivative is $f_j + T f_(j + 1)$. It vanishes on coordinate faces when $j gt.eq 1$. Apply the external marked formula to these functions. Only equal subsets $U$ survive, and
  $ frac(h binom(h - 1, j), L^(j + 1)) arrow.r lambda alpha_j . $
  This proves the formula for $v$, including the scalar term $lambda \| f_0 + integral f_1 \|^2$.
  The equality-pattern estimate preceding this subsection justifies summing the errors in these limits. Applied to $Z^4$, the same argument uses four divisor factors, total support $4 tau < 1$, and only finiteness of their pattern constants. Bounded averages of the singular series then give the second assertion in (3).
  It remains to prove a detector estimate whose constant is independent of the chosen family. Write $q_X = log \( 2 X + 2 h \) \/ L = 1 + o \( 1 \)$. At a relevant prime $m + b$, we have $D_G \( m \; b \) = 1$. Consequently, pointwise,
  $ frac(theta.alt \( m + b \), L) lt.eq q_X D_G \( m \; b \)^2 \, #h(2em) (frac(theta.alt \( m + b \), L))^2 lt.eq q_X frac(theta.alt \( m + b \), L) . $
  The first inequality holds at composites as well, since its left side is zero. Because $Z^2 gt.eq 0$, these inequalities give
  $ bb(E)_X \( Z^2 V_J^2 \) & lt.eq q_X bb(E)_X \( Z^2 V_J \)\
 & quad + q_X^2 sum_(b \, c in J\
b eq.not c) bb(E)_X #scale(x: 120%, y: 120%)[\[] Z^2 D_G \( m \; b \)^2 D_G \( m \; c \)^2 #scale(x: 120%, y: 120%)[\]] . $
  An off-diagonal summand contains six divisor factors, with total support $6 tau < 1$. The shifts $b \, c$ are paired and lie outside $I$. The two subsets from $Z^2$ must again be identical. For their common size $j$, the coefficient is $c_G^2 parallel f_j parallel_2^2$. The pair $\( b \, c \)$ is ordered, and
  $ frac(h \( h - 1 \) binom(h, j), L^(j + 2)) arrow.r lambda^2 alpha_j . $
  Thus the off-diagonal sum tends to $lambda^2 c_G^2 w$. Together with (3), this proves (4). Although the convergence rates may depend on the fixed family, the resulting $C_(*)$ does not. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
