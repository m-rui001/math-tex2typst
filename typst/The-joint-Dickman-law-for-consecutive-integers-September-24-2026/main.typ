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

#align(center)[#text(size: 16pt, weight: "bold")[The joint Dickman law for consecutive integers]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

For an integer $n gt.eq 2$, let $P^(+) \( n \)$ denote its largest prime divisor, and put $P^(+) \( 1 \) = 1$. The Dickman–de Bruijn function $rho$ is the continuous function on $\[ 0 \, oo \)$ determined by

$ rho \( u \) = 1 quad \( 0 lt.eq u lt.eq 1 \) \, #h(2em) u rho' \( u \) = - rho \( u - 1 \) quad \( u > 1 \) . $

The classical theory of smooth numbers, beginning with Dickman and developed by Ramaswami and de Bruijn #cite(label("Dickman1930")) #cite(label("Ramaswami1949")) #cite(label("deBruijn1951")), gives

$ 1 / X \# { n lt.eq X : P^(+) \( n \) lt.eq X^a } arrow.r rho \( 1 \/ a \) #h(2em) \( 0 < a lt.eq 1 \) . $

Our result identifies the joint law at two consecutive integers.

#thm([Theorem 1.1.])[
  (Joint Dickman law).  #emph[For every fixed $a \, b in \( 0 \, 1 \)$, 
$ lim_(X arrow.r oo) 1 / X \# { 2 lt.eq n lt.eq X : P^(+) \( n \) lt.eq n^a \, med P^(+) \( n + 1 \) lt.eq n^b } = rho \( 1 \/ a \) rho \( 1 \/ b \) . $

 Here the limit is taken over all real $X$, with ordinary, unweighted counting.]
] <thm:main>

Thus $log P^(+) \( n \) \/ log n$ and $log P^(+) \( n + 1 \) \/ log n$ have, in natural density, independent limiting distributions with distribution function $a mapsto rho \( 1 \/ a \)$, continuously extended to $\[ 0 \, 1 \]$. Section 11 proves the corresponding law with fixed thresholds $X^a \, X^b$, derives the displayed moving-threshold statement, and identifies this continuous limiting law. Inclusion–exclusion using the fixed-threshold law and its marginals gives the upper-tail independence conjecture of Erdős and Pomerance #cite(label("ErdosPomerance1978")) p. 311.

The comparison conjecture usually attributed to Erdős and Turán is a consequence, rather than a separate main theorem.

#thm([Corollary 1.2.])[
  #emph[One has 
$ lim_(X arrow.r oo) 1 / X \# { 2 lt.eq n lt.eq X : P^(+) \( n \) < P^(+) \( n + 1 \) } = 1 / 2 . $

 The reverse ordering has the same natural density.]
] <cor:comparison>

The limiting marginal is continuous, so its product measure gives zero mass to the diagonal; symmetry then gives the corollary. In particular, no quantitative separation estimate is needed for this deduction.

=== 1.1 Previous work <previous-work>

Erdős and Pomerance #cite(label("ErdosPomerance1978")) formulated the joint independence problem and proved that each ordering has positive lower natural density. Their explicit lower bound was $0.0099$. They also proved that for every $epsilon > 0$, some $delta > 0$ makes the number of integers $n < X$ satisfying $X^(- delta) < P^(+) \( n \) \/ P^(+) \( n + 1 \) < X^delta$ less than $epsilon X$ for all sufficiently large $X$ #cite(label("ErdosPomerance1978")) Theorem 1. The lower-density bound was increased to $0.05544$ by de la Bretèche, Pomerance and Tenenbaum #cite(label("BretechePomeranceTenenbaum2005")) Section 3, and to $0.05866$ by an observation of Fouvry recorded in the same section. Wang #cite(label("Wang2017")) #cite(label("Wang2018")) obtained $0.1063$ and $0.1356$, and Lü and Wang #cite(label("LuWang2025")) obtained $0.2017$. Yang’s recent preprint #cite(label("Yang2026")) Theorem 1.4 gives $0.280$ for both orderings. These are bounds on lower natural densities; they do not assert that a natural density exists.

For the joint law itself, Teräväinen #cite(label("Teravainen2018")) Theorem 1.14 proved the predicted product in logarithmic density. That is, for fixed $0 < a \, b < 1$, the indicator in Theorem 1, averaged with weight $1 \/ n$ and normalization $1 \/ log X$, tends to $rho \( 1 \/ a \) rho \( 1 \/ b \)$. His Theorem 1.16 gives logarithmic density $1 \/ 2$ for the ordering, while Theorem 1.19 proves positive lower natural density for every nondegenerate rectangle of normalized largest-prime-factor values inside $\( 0 \, 1 \)^2$. Tao and Teräväinen #cite(label("TaoTeravainen2019")) Remark 3.3, equation (50) then obtained the joint product law for ordinary averages outside an exceptional set of scales of logarithmic density zero; their Corollary 1.16 gives the corresponding ordering result. Wang #cite(label("Wang2021Conditional")) proved the ordinary joint law under the Elliott–Halberstam conjecture for friable integers. Jiang, Lü and Wang #cite(label("JiangLuWang2022")) established averaged-over-shift forms of the conjectures, a different conclusion from a result at the fixed shift one.

The more recent work of Tao and Teräväinen #cite(label("TaoTeravainen2026Quantitative")) Theorem 1.8 gives a quantitative joint law outside an exceptional set of scales, with uniformity in the smoothness parameters and a power saving in $log X$. Theorem 1 concerns fixed parameters and has no exceptional scales; it does not assert their quantitative error term or their uniformity for growing parameters. Relative to the results just described, the distinction is therefore the unconditional ordinary limit at every sufficiently large scale, not a new marginal distribution or a logarithmically averaged independence statement.

=== 1.2 Method and organization <method-and-organization>

We first replace the largest prime factor by finitely many prime counts. For a fixed integer $J gt.eq 2$, divide the primes in $\( x^(1 \/ J) \, x \]$ into bins $cal(B)_(k \, x) = \( x^(k \/ J) \, x^(\( k + 1 \) \/ J) \]$, $1 lt.eq k < J$. If $Omega_E \( n \)$ counts prime factors in $E$ with multiplicity, a choice of unit complex numbers $zeta_k$ defines the bin character

$ f_x \( n \) = product_(k = 1)^(J - 1) zeta_k^(Omega_(cal(B)_(k \, x)) \( n \)) . $

Let $g_x$ be defined by a second arbitrary phase vector, and let $F_x = f_x - mu$, where $mu$ is the limiting mean of $f_x$. Finite Fourier inversion reduces the joint law to the mixed decorrelation

$ 1 / x sum_(n < x) overline(g_x \( n \)) F_x \( n + 1 \) arrow.r 0 . $

Here $x$ runs through integer scales. The two phase vectors may differ. This freedom gives independence of the two count vectors.

Two properties of these functions connect the beginning and end of the proof. First, every fixed positive integer multiplier has all its prime factors below the bins once $x$ is large. Thus $F_x \( u n \) = F_x \( n \)$ and $g_x \( u n \) = g_x \( n \)$ for each fixed $u$. Second, $F_x$ has cancellation in averages over growing intervals that remain short relative to the original scale. Let $B$ be the auxiliary parameter and let $T = T \( B \) arrow.r oo$ be the growing shift scale. If $P_B$ is a finite set of primes with $min P_B arrow.r oo$, define

$ G_(B \, v) \( n \) = product_(p in P_B\
p divides n) frac(1 + p^(- v \/ B), 2) \, #h(2em) v gt.eq 0 . $

For any interval $I_B$ of $L_B arrow.r oo$ consecutive integer shifts, and fixed $0 < s_0 < s_1$, positive integer $D$, residue $r med \( mod med D \)$, and $v gt.eq 0$, Section 2 proves

$ lim_(B arrow.r oo) limsup_(x arrow.r oo) frac(1, T x) sum_(s_0 T x lt.eq n lt.eq s_1 T x) lr(|1 / L_B sum_(i in I_B\
i equiv r med \( mod med D \)) F_x \( n + i \) G_(B \, v) \( n + i \)|)^2 = 0 . $

At fixed $B$ the shift interval is short relative to $x$, while the base points have size $T x$. This is the scale produced by the divisor substitution below.

The centered function $F_x$ is not multiplicative. On the relevant ranges $n = O_B \( x \)$, the bin counts take values in a fixed finite set. This permits interpolation by a fixed finite family of real, nonnegative multiplicative functions. After resolving the residue condition by Dirichlet characters, the real short-interval theorem of Matomäki and Radziwiłł #cite(label("MatomakiRadziwill2016")) Theorem 1 compares the principal components with long means whose centered combination vanishes. The complex theorem of Matomäki, Radziwiłł and Tao #cite(label("MatomakiRadziwillTao2015")) Theorem A.1, corrected version controls the nonprincipal twists. The rest of the proof must reduce the mixed correlation to this particular cancellation statement.

Suppose, then, that the mixed correlation stays nonzero along a sequence of scales. The profinite integers $hat(bb(Z))$ encode compatible residue classes modulo all positive integers and carry Haar probability measure. Passing to a subsequence gives a bounded profile $W \( t \, w \)$ on $\( 0 \, oo \) times hat(bb(Z))$. Its integral against each fixed compactly supported continuous test $Phi \( t \, w \)$ is the subsequential limit of the mixed averages weighted by $Phi \( n \/ x \, n \)$, with $n$ in the second argument viewed through its residues. A fixed nonnegative compactly supported smooth cutoff $phi.alt$ can be chosen so that $integral phi.alt \( t \) W \( t \, w \) thin d t thin d w eq.not 0$, where $d t$ is Lebesgue measure and $d w$ is Haar measure.

For an integer $n$, the amplifier defines $D_B \( n \)$ as a nonnegative weighted count of factorizations $n = a m$ and $n + 1 = c l_a$, restricted by $e^B < c < e^(2 B)$ and $T c < a < 2 T c$. At fixed $B$ its coefficient list is finite, and the same formula defines a function on $hat(bb(Z))$ depending only on residues at primes above a cutoff tending to infinity. The construction gives $D_B$ Haar mean at least $d_0 > 0$ for large $B$ and bounded $L^2$ norm. To prove these bounds, the argument passes to a comparison model in which each site prime is assigned by an independent fair coin to the coefficient divisor or the remaining factor. The first and second moments are analyzed through one split and two conditionally independent splits of the same site prime sets. For each fixed $B$, $Phi \( t \, w \) = phi.alt \( t \) D_B \( w \)$ is an allowed profile test, so along the selected subsequence

$ lim_(x arrow.r oo) 1 / x sum_(n gt.eq 1) phi.alt \( n \/ x \) overline(g_x \( n \)) F_x \( n + 1 \) D_B \( n \) = integral phi.alt \( t \) W \( t \, w \) D_B \( w \) thin d t thin d w . $

Independence from every fixed residue coordinate and $L^2$ approximation of $phi.alt W$ show that the right-hand side has absolute value bounded away from zero as $B arrow.r oo$.

For fixed $B$ and large $x$, writing $n = a m$ in this weighted average replaces $g_x \( n \)$ by $g_x \( m \)$. For each fixed pair $\( c \, m \)$, the remaining terms form a sum over $a$ satisfying $c divides a m + 1$, with nonnegative divisor and smooth weights multiplying $F_x \( a m + 1 \)$. Cauchy–Schwarz in $\( c \, m \)$ removes the unit-modulus factor $g_x \( m \)$ and squares this inner sum. The resulting normalized quadratic energy has a positive lower bound, while its equal-coefficient diagonal tends to zero in the same iterated limit. A positive contribution therefore remains from distinct indices $a \, b$. Section 4 proves these moment and energy claims.

For such a pair, $c$ divides both $a m + 1$ and $b m + 1$. Thus $m$ is a unit modulo $c$ and $a - b = j c$, with $0 < \| j \| < T$ by the coefficient windows. Writing $l_a = \( a m + 1 \) \/ c$ and $l_b = \( b m + 1 \) \/ c$, the exact substitution

$ n' = b l_a \, #h(2em) n' + j = a l_b $

turns the label product into $overline(F_x \( n' \)) F_x \( n' + j \)$ by invariance under the fixed multipliers $a \, b \, c$. The new endpoints have size $T x$. The off-diagonal energy is therefore a weighted graph of ordinary additive shifts. Its edge weights depend on endpoint prime sets and on additional residue data from each divisor representation.

Group the new endpoints into blocks $N + i$, $1 lt.eq i lt.eq M$, with $M = ceil.l C_6 T ceil.r$ for a fixed large $C_6$, and put $s = N \/ \( T x \)$. Section 5 couples the actual auxiliary-prime divisibility sets at these positions to independent model sets $S_i$, each formed by including every auxiliary prime $p$ independently with probability $1 \/ p$, and averages the extra residue weight of each representation. This compares the arithmetic graph with an endpoint kernel $cal(L)_(i k) \( S_i \, S_k \; s \)$ in expected cut norm. Here cut norm is the largest absolute normalized pairing with two real vectors bounded by one, chosen after the matrix is known. Section 6 controls representation multiplicity and provides the averaged second-moment bounds needed for sampling.

The aim is now to replace this endpoint kernel by products of functions of its two endpoints. For an endpoint type $S$, let $b$ be the product obtained by retaining each prime independently with probability $1 \/ 2$. The features used in the comparison are

$ V_l \( S \) = frac(1, \| I_l \|) bb(P)_(upright("split")) #h(-0.16667em) (frac(log b, B) in I_l thin mid(bar.v) thin S) \, $

where the $I_l$ form a fixed coarse partition of a compact logarithmic interval, chosen for a desired accuracy. The channel estimates in Section 7 show that fair splitting suppresses residue dependence and makes logarithmic outputs uniformly approximable on this partition. Fourier detection of $a - b = j c$ then lets Section 8 apply arithmetic estimates to the coefficient $c$ and these channel estimates to the endpoints. The resulting comparison has the form

$ sum_l c_(l \, B) \( j \, s \) V_l \( S_i \) V_l \( S_k \) \, #h(2em) j = k - i \, $

where $i \, k$ are the endpoint positions. The scalar coefficients separate an arithmetic factor in $\| j \|$ from a smooth factor in the normalized lag $\| j \| \/ T$ and the common block origin $s$. The number of features is fixed, while their values and the coefficients may depend on $B$.

The feature comparison first holds after integration against separate functions of the two independent endpoint sets. The actual labels need not have this single-site form, and an optimizing test can depend on the whole configuration. Section 9 upgrades the comparison to expected cut norm by approximating an optimizing cut with a small sample of columns. Finally, polynomial approximation of each log-window indicator expresses $V_l$, up to a small mean-square error, as a fixed finite combination of

$ bb(E)_(upright("split")) #h(-0.16667em) [e^(- v log b \/ B) divides S] = product_(p in S) frac(1 + p^(- v \/ B), 2) . $

At an integer endpoint these are exactly $G_(B \, v)$. The arithmetic lag factor is approximated in mean over lags by a fixed periodic function. For a fixed small $delta > 0$ chosen for the desired accuracy, subdivide each position block into a fixed number of intervals whose lengths grow with $T$ and are at most $delta T$. Within each interval pair, the normalized lag varies by at most $2 delta$. Approximating the smooth lag factor there and resolving the periodic factor into fixed residue classes turns the feature energy, up to a controlled error, into products of the weighted short averages already controlled in Section 2. Their vanishing contradicts the positive energy. Sections 10 and 11 complete this argument and the passage from bin events to the joint law.

The divisor amplification and graph comparison have close antecedents in Tao’s logarithmic correlation argument #cite(label("Tao2016LogChowla")), the prime-divisibility graphs of Helfgott and Radziwiłł #cite(label("HelfgottRadziwill2021")), Pilatte’s product-of-primes amplification #cite(label("Pilatte2023")), and the mixed-function decoupling of Tao and Teräväinen #cite(label("TaoTeravainen2026Quantitative")) Section 3.1. The present rough-divisor graph and its endpoint comparison are proved locally. The sampling argument likewise builds on the cut-based methods of Frieze and Kannan #cite(label("FriezeKannan1999")), Alon, Fernandez de la Vega, Kannan and Karpinski #cite(label("AlonEtAl2003Sampling")) Lemma 3, and Borgs, Chayes, Lovász, Sós and Vesztergombi #cite(label("BorgsEtAl2008")) Theorem 4.6. Because the kernels here vary with $B$ and can be large, the proof establishes the moment bounds needed before applying bounded-differences concentration #cite(label("McDiarmid1989")).

The arithmetic estimates are developed in Section 3 using Selberg–Delange theory, character estimates and upper-bound sieves in the forms recorded by Granville and Koukoulopoulos #cite(label("GranvilleKoukoulopoulos2019")), Koukoulopoulos #cite(label("Koukoulopoulos2019")), and Ford #cite(label("FordSieve2023")) #cite(label("FordZeta2022")). The minor-arc input in Section 8 is the exponential-sum estimate of Montgomery and Vaughan #cite(label("MontgomeryVaughan1977")). Throughout the proof, the original scale $x$ tends to infinity before the auxiliary scale $B$. Bin data, feature degrees, residue moduli and divisor multipliers are fixed in that inner limit. The contradiction applies to a subsequence of every possible bad sequence of original scales, and hence yields the full ordinary limit.

== 2 Large-prime labels and their short averages <sec:labels>

We encode the large prime factors by two independently chosen multiplicative labels. Their one-variable distributions have limits independent of fixed residue conditions. We establish those limits and the weighted short-average estimate needed to prove that the two labels decorrelate at consecutive integers. In the short-average estimate the original counting scale $x$ tends to infinity before the auxiliary parameter $B$ does. The scale $x > 1$ is real unless a statement explicitly restricts it to integers.

=== 2.1 Labels and their one-variable distributions <labels-and-their-one-variable-distributions>

Fix an integer $J gt.eq 2$. For $1 lt.eq k < J$ put

#[#set math.equation(numbering: n => "(2.1)")
 $ cal(B)_(k \, x) = \( x^(k \/ J) \, x^(\( k + 1 \) \/ J) \] . $ <eq:labels-bins>]

If $E$ is a set of primes, $Omega_E \( n \)$ denotes the number of prime factors of $n$ belonging to $E$, counted with multiplicity. Fix complex numbers $zeta_1 \, dots.h \, zeta_(J - 1)$ and $xi_1 \, dots.h \, xi_(J - 1)$ of absolute value one, independent of $x$, with no relation required between the two vectors. Define the completely multiplicative function $f_x$ by

#[#set math.equation(numbering: n => "(2.2)")
 $ f_x \( p \) = cases(delim: "{", zeta_k \, & p in cal(B)_(k \, x) \, quad 1 lt.eq k < J \,, 1 \, & p in.not union.big_(1 lt.eq k < J) cal(B)_(k \, x) .) #h(2em) f_x \( n \) = product_(k = 1)^(J - 1) zeta_k^(Omega_(cal(B)_(k \, x)) \( n \)) . $ <eq:labels-function>]

Define the completely multiplicative label associated with $\( xi_k \)$ by

#[#set math.equation(numbering: n => "(2.3)")
 $ g_x \( n \) = product_(k = 1)^(J - 1) xi_k^(Omega_(cal(B)_(k \, x)) \( n \)) . $ <eq:labels-second-function>]

Both labels have absolute value one. For every fixed $C > 0$, every integer $n lt.eq C x$ has at most $J$ prime factors in the union of the bins, once $x$ is sufficiently large in terms of $C \, J$. Indeed, $J + 1$ such factors would have product exceeding $x^(1 + 1 \/ J) > C x$.

#thm([Lemma 2.1.])[
  (One-variable distribution).  #emph[For every fixed $0 < alpha < beta < oo$, positive integer $q$, and residue class $a med \( mod med q \)$, the distribution of 
$ #scale(x: 120%, y: 120%)[\(] Omega_(cal(B)_(k \, x)) \( n \) #scale(x: 120%, y: 120%)[\)]_(1 lt.eq k < J) $

 among the integers $alpha x < n lt.eq beta x$, $n equiv a med \( mod med q \)$, normalized to have mass one, converges as $x arrow.r oo$. Its limit depends only on $J$, and not on $alpha \, beta \, q \, a$.]
  #emph[Consequently there is a number $mu = mu \( J \, zeta_1 \, dots.h \, zeta_(J - 1) \)$ with $\| mu \| lt.eq 1$ such that 
#[#set math.equation(numbering: n => "(2.4)")
 $ lim_(x arrow.r oo) frac(q, \( beta - alpha \) x) sum_(alpha x < n lt.eq beta x\
n equiv a med \( mod med q \)) f_x \( n \) = mu . $ <eq:labels-marginal-mean>]

 The same assertion holds for $g_x$, with a mean $mu_g$ depending only on $J$ and the vector $\( xi_k \)_(k = 1)^(J - 1)$. Write 
#[#set math.equation(numbering: n => "(2.5)")
 $ F_x \( n \) = f_x \( n \) - mu . $ <eq:labels-centered>]

 Then $\| F_x \( n \) \| lt.eq 2$, and for every fixed positive integer $u$, 
#[#set math.equation(numbering: n => "(2.6)")
 $ F_x \( u n \) = F_x \( n \) \, #h(2em) g_x \( u n \) = g_x \( n \) #h(2em) \( n gt.eq 1 \) $ <eq:labels-multiplier>]

 for all sufficiently large $x$ in terms of $u \, J$.]
] <lem:labels-marginal>

#proof[
  We prove convergence by computing all mixed factorial moments of the bin counts. We first record the elementary prime estimates used in this calculation. Put $theta.alt \( z \) = sum_(p lt.eq z) log p$. For $z gt.eq 2$ we have
  #[#set math.equation(numbering: n => "(2.7)")
   $ theta.alt \( z \) lt.double z \, #h(2em) pi \( z \) lt.double frac(z, log z) \, #h(2em) sum_(p lt.eq z) frac(log p, p) = log z + O \( 1 \) . $ <eq:distribution-prime-estimates>]
  Indeed, the primes in $\( m \, 2 m \]$ divide $binom(2 m, m)$, giving $theta.alt \( 2 m \) - theta.alt \( m \) lt.double m$. Dyadic summation proves the first estimate, and separating the primes at $sqrt(z)$ proves the second. Moreover,
  $ sum_(p^nu lt.eq z) log p = sum_(1 lt.eq nu lt.eq log_2 z) theta.alt \( z^(1 \/ nu) \) lt.double z \, $
  because the terms with $nu gt.eq 2$ are $O \( sqrt(z) log z \)$. Expanding $log n$ over prime powers now gives
  $ sum_(n lt.eq z) log n = sum_(p^nu lt.eq z) log p thin floor.l z \/ p^nu floor.r = z sum_(p lt.eq z) frac(log p, p) + O \( z \) . $
  The floor errors use the preceding prime-power bound, and the terms with $nu gt.eq 2$ use $sum_p sum_(nu gt.eq 2) \( log p \) \/ p^nu < oo$. Integral comparison on the left proves the third estimate in (2.7). Partial summation yields
  #[#set math.equation(numbering: n => "(2.8)")
   $ sum_(x^s < p lt.eq x^t) 1 / p arrow.r log \( t \/ s \) #h(2em) \( 0 < s < t med upright("fixed") \) \, $ <eq:distribution-prime-measure>]
  as well as $sum_(p lt.eq z) 1 \/ p = log log z + O \( 1 \)$.
  The number of integers $n lt.eq beta x$ divisible by $p^2$ for some prime $p > x^(1 \/ J)$ is at most
  $ beta x sum_(p > x^(1 \/ J)) 1 / p^2 + O_beta \( sqrt(x) \) = o \( x \) . $
  This remains negligible relative to the size of any one fixed progression in the lemma. We may therefore replace multiplicity counts by counts of distinct primes.
  For the mixed factorial moments of these distinct-prime counts, write $\( b \)_r = b \( b - 1 \) dots.h.c \( b - r + 1 \)$ and $\( b \)_0 = 1$. Fix nonnegative integers $r_1 \, dots.h \, r_(J - 1)$, and let $r = r_1 + dots.h.c + r_(J - 1)$. The case $r = 0$ is immediate. For $r > 0$, a term in the factorial-moment expansion selects, in order, $r_k$ distinct primes from bin $k$, for each $k$. Denote their product by $d$; only $d lt.eq beta x$ can contribute. The number of such selections is $O_(J \, beta \, r) \( x \/ log x \)$. To see this, fix every selected prime except one, and write $d_1$ for their product. If the last prime has any admissible choice, its upper bound $beta x \/ d_1$ exceeds $x^(1 \/ J)$. The prime-counting upper bound therefore gives at most
  $ O_(J \, beta) #h(-0.16667em) (frac(x, d_1 log x)) $
  choices. Summing this bound over the other primes costs a bounded product of reciprocal prime sums over the bins. We may drop distinctness and product restrictions when taking this upper bound.
  For sufficiently large $x$, every selected prime is coprime to $q$. The Chinese remainder theorem then gives
  $ \# { alpha x < n lt.eq beta x : n equiv a med \( mod med q \) \, med d divides n } = frac(\( beta - alpha \) x, q d) + O \( 1 \) . $
  The sum of the errors over all selections is $o \( x \)$. After normalization, the factorial moment is consequently the reciprocal sum over the selections with $d lt.eq beta x$, up to $o \( 1 \)$.
  In the variable $v = log p \/ log x$, (2.8) says that the reciprocal prime measure on bin $k$ converges to $d v \/ v$ on $\( k \/ J \, \( k + 1 \) \/ J \]$. The product restriction is
  $ sum_(upright("selected primes")) v lt.eq 1 + frac(log beta, log x) . $
  The limiting product measure is absolutely continuous, so the boundary $sum v = 1$ has measure zero. Repeated selections do not change the limit: their reciprocal contribution is bounded by a constant times $sum_(p > x^(1 \/ J)) p^(- 2) = o \( 1 \)$. Returning from distinct-prime counts to multiplicity counts also costs $o \( 1 \)$ in the normalized moment, because the exceptional set has size $o \( x \)$ and the counts are bounded.
  List the selected bin indices as $k_1 \, dots.h \, k_r$, with $r_k$ occurrences of $k$. We have proved the explicit limit
  #[#set math.equation(numbering: n => "(2.9)")
   $ & lim_(x arrow.r oo) frac(q, \( beta - alpha \) x) sum_(alpha x < n lt.eq beta x\
n equiv a med \( mod med q \)) product_(k = 1)^(J - 1) #scale(x: 120%, y: 120%)[\(] Omega_(cal(B)_(k \, x)) \( n \) #scale(x: 120%, y: 120%)[\)]_(r_k)\
 & #h(2em) = integral_(v_i in \( k_i \/ J \, \( k_i + 1 \) \/ J \] med \( 1 lt.eq i lt.eq r \)\
v_1 + dots.h.c + v_r lt.eq 1) product_(i = 1)^r frac(d v_i, v_i) . $ <eq:labels-factorial-limit>]
  For $r = 0$, both sides are one. The right-hand side depends only on $J$ and the multi-index $\( r_k \)$. All count vectors lie in a fixed finite set, and mixed factorial polynomials span the functions on that set. The asserted distributional convergence follows.
  Taking the expectation of the function $\( b_k \) mapsto product_k zeta_k^(b_k)$ gives (2.4); using the vector $\( xi_k \)$ gives the mean $mu_g$. Finally, if every prime factor of $u$ is at most $x^(1 \/ J)$, then $f_x \( u \) = g_x \( u \) = 1$. Complete multiplicativity of $f_x$ and $g_x$ proves (2.6). ◻
]

The centered function $F_x$ is not asserted to be multiplicative. Its eventual invariance under each fixed multiplier is the exact property in (2.6) that will be used below.

The same distributional limit holds for averages over $1 lt.eq n lt.eq x$. Indeed, apply the lemma to any fixed function of the count vector on $alpha x < n lt.eq x$, then let $alpha arrow.b 0$; that function is bounded on the finite set of possible vectors, so the omitted interval has normalized contribution $O \( alpha \)$. In particular, the limit in (2.9) is unchanged when its normalized progression sum is replaced by $x^(- 1) sum_(1 lt.eq n lt.eq x) product_k \( Omega_(cal(B)_(k \, x)) \( n \) \)_(r_k)$. This gives (2.4) on the initial segment as well. A fixed shift of the integer argument changes only a bounded number of terms after nonpositive arguments are omitted, so the label means have the same limits after such a shift.

=== 2.2 The mixed correlation and its short-average input <the-mixed-correlation-and-its-short-average-input>

The joint law will follow by finite Fourier inversion from the following statement for the two independently chosen phase vectors. The factor $F_x \( n + 1 \)$ is centered, while $g_x \( n \)$ has absolute value one.

#thm([Proposition 2.2.])[
  (Mixed decorrelation).  #emph[For every fixed integer $J gt.eq 2$ and every pair of fixed phase vectors $\( zeta_k \)_(k = 1)^(J - 1)$ and $\( xi_k \)_(k = 1)^(J - 1)$ of absolute value one, the corresponding labels satisfy 
#[#set math.equation(numbering: n => "(2.10)")
 $ lim_(x arrow.r oo) 1 / x sum_(1 lt.eq n < x) overline(g_x \( n \)) F_x \( n + 1 \) = 0 \, $ <eq:mixed>]

 where $F_x = f_x - mu$ and the limit is through all integer scales.]
] <prop:mixed>

After establishing the short-average input below, we will suppose that the average in (2.10) stays a fixed positive distance from zero along a sequence and derive a contradiction. The input is used in Section 10 at the final step of the proof.

For each auxiliary parameter $B$, let $P_B$ be a finite set of primes, and suppose that $min P_B arrow.r oo$ as $B arrow.r oo$. An empty set may be allowed by interpreting its minimum as $+ oo$ and its product as one. For a fixed real $v gt.eq 0$, define

#[#set math.equation(numbering: n => "(2.11)")
 $ G_(B \, v) \( m \) = product_(p divides m\
p in P_B) (1 / 2 + 1 / 2 p^(- v \/ B)) . $ <eq:labels-G>]

This is a real, nonnegative, 1-bounded multiplicative function. For fixed $B$ it is periodic, with period dividing $product_(p in P_B) p$. To see its fair-split meaning, put $S_B \( m \) = { p in P_B : p divides m }$ and form a random product $b$ by including each prime of $S_B \( m \)$ independently with probability $1 \/ 2$. The empty product is one. Independence gives

$ G_(B \, v) \( m \) = bb(E)_(upright("split")) #h(-0.16667em) [exp #h(-0.16667em) (- frac(v log b, B))] . $

These are the fair-split averages used to approximate the endpoint features in Section 10.

#thm([Lemma 2.3.])[
  (Weighted short averages of the centered labels).  #emph[Let $T = T \( B \) arrow.r oo$, let $L_B$ be positive integers tending to infinity, and let $a_B$ be any integer for each $B$. Fix $0 < s_0 < s_1 < oo$, a positive integer $D$, a residue $r med \( mod med D \)$, and $v gt.eq 0$. Then 
#[#set math.equation(numbering: n => "(2.12)")
 $ lim_(B arrow.r oo) limsup_(x arrow.r oo) frac(1, T x) sum_(s_0 T x lt.eq n lt.eq s_1 T x) lr(|1 / L_B sum_(i = a_B + 1)^(a_B + L_B) upright(bold(1))_(i equiv r med \( D \)) F_x \( n + i \) G_(B \, v) \( n + i \)|)^2 = 0 . $ <eq:labels-short>]

 For each fixed $B$ all the arguments of the arithmetic functions are positive once $x$ is sufficiently large. The same conclusion holds if the inner upper limit is taken along any sequence $x arrow.r oo$.]
] <lem:labels-short>

The proof interpolates the centered function of the finitely many bin counts by real, nonnegative multiplicative functions. Once the residue of the origin $n$ is fixed, the congruence on $i$ becomes a fixed residue condition on the argument $m = n + i$. Resolving that condition by Dirichlet characters produces two different tasks. For the principal character, short averages must be compared with long means whose centered linear combination vanishes. For a nonprincipal character, the short averages themselves must be small. We record the two published inputs for these tasks and prove the required distance estimate before returning to the weighted lemma.

=== 2.3 The short-interval inputs <the-short-interval-inputs>

For a bounded arithmetic function $g$ and $H > 0$, set

$ cal(A)_H g \( z \) = 1 / H sum_(z < n lt.eq z + H) g \( n \) \, #h(2em) cal(L)_X g = 1 / X sum_(X < n lt.eq 2 X) g \( n \) . $

For a 1-bounded multiplicative function $g$, define

#[#set math.equation(numbering: n => "(2.13)")
 $ bb(D) \( g \, n^(i t) \; X \)^2 = sum_(p lt.eq X) frac(1 - "Re" \( g \( p \) p^(- i t) \), p) \, #h(2em) M \( g \; X \) = inf_(\| t \| lt.eq X) bb(D) \( g \, n^(i t) \; X \)^2 . $ <eq:labels-distance>]

We use the following two forms of the short-interval theorems. Their uniformity in the multiplicative function is part of the statements.

#thm([Theorem 2.4.])[
  (Real short-interval comparison).  #emph[There is a function $r \( H \)$ tending to zero as $H arrow.r oo$ such that, for every real multiplicative function $g : bb(N) arrow.r \[ - 1 \, 1 \]$ and $2 lt.eq H lt.eq X$, 
#[#set math.equation(numbering: n => "(2.14)")
 $ 1 / X integral_X^(2 X) \| cal(A)_H g \( z \) - cal(L)_X g \|^2 thin d z lt.eq r \( H \) . $ <eq:labels-real-MR>]

]
] <thm:labels-real-MR>

This is a consequence of the uniform exceptional-set estimate in #cite(label("MatomakiRadziwill2016")) Theorem 1, using boundedness to pass to mean square. The terms in that estimate depending on $X$ can be absorbed into $r \( H \)$ because $X gt.eq H$.

#thm([Theorem 2.5.])[
  (Complex short averages).  #emph[For every multiplicative function $g : bb(N) arrow.r bb(C)$ with $\| g \| lt.eq 1$ and $X gt.eq H gt.eq 10$, 
#[#set math.equation(numbering: n => "(2.15)")
 $ 1 / X integral_X^(2 X) \| cal(A)_H g \( z \) \|^2 thin d z lt.double \( 1 + M \( g \; X \) \) e^(- M \( g \; X \)) + (frac(log log H, log H))^2 + \( log X \)^(- 1 \/ 50) \, $ <eq:labels-complex-quantitative>]

 with an absolute implied constant.]
] <thm:labels-complex-MRT>

This is #cite(label("MatomakiRadziwillTao2015")) Theorem A.1, in the revised version with the corrected proof of Proposition A.3. That proof permits the factor $e^(- M)$; we use the weaker $\( 1 + M \) e^(- M)$, which also covers $M < 1$. Thus divergence of the minimum over $\| t \| lt.eq X$ suffices for our application.

The preceding statements also hold with integer origins, at the cost of an error tending to zero with $H$. Indeed, for $\| g \| lt.eq 1$,

$ \| cal(A)_H g \( z \) - cal(A)_H g \( floor.l z floor.r \) \| lt.eq 2 / H . $

Integrating over unit intervals proves the claim, with $O \( 1 \/ X \)$ errors at the endpoints. Changing a short interval endpoint by a bounded amount similarly costs $O \( 1 \/ H \)$.

=== 2.4 A uniform estimate for the character twists <a-uniform-estimate-for-the-character-twists>

#thm([Lemma 2.6.])[
  (Fixed nonprincipal characters).  #emph[Fix $J gt.eq 2$, positive constants $c \, C$, a nonprincipal Dirichlet character $chi$ of modulus $q_chi$, and a finite set $E$ of primes. Suppose that, for each $x$, $h_x$ is a 1-bounded multiplicative function satisfying 
$ h_x \( p \) = chi \( p \) #h(2em) \( p lt.eq x^(1 \/ J) \, med p in.not E \) . $

 With $X = c x$, one has 
#[#set math.equation(numbering: n => "(2.16)")
 $ inf_(\| t \| lt.eq C X) bb(D) \( h_x \, n^(i t) \; X \)^2 arrow.r oo #h(2em) \( x arrow.r oo \) . $ <eq:labels-character-distance>]

 The assertion is uniform over all the functions $h_x$ with this prime agreement. The threshold for $x$ may depend on $J \, c \, C \, chi \, E$.]
] <lem:labels-character-distance>

#proof[
  Put $y = x^(1 \/ J)$ and $sigma = 1 + 1 \/ log x$. For large $x$ we have $y < X$. Since the summands defining the distance are nonnegative, we can restrict to $p lt.eq y$ and delete $E$ and the primes dividing the modulus of $chi$. Deleting those finitely many primes costs only a constant in the lower bounds below.
  We record a prime-sum comparison, uniform in any factors of absolute value at most one. Replacing the weight $1 \/ p$ on $p lt.eq y$ by $p^(- sigma)$ on all primes has absolute error $O_J \( 1 \)$. Below $y$, the error is at most
  $ frac(1, log x) sum_(p lt.eq y) frac(log p, p) = O_J \( 1 \) . $
  For the tail, partial summation and the prime-counting bound in (2.7) give
  $ sum_(p > y) p^(- sigma) lt.double integral_y^oo frac(u^(- 1 - 1 \/ log x), log u) thin d u = integral_(1 \/ J)^oo e^(- v) / v thin d v = O_J \( 1 \) . $
  The prime-power terms in the logarithm of either a zeta or a Dirichlet $L$ Euler product are also uniformly $O \( 1 \)$ for $sigma > 1$.
  For $\| t \| lt.eq 1$ it follows that
  $ "Re" sum_(p lt.eq y) frac(chi \( p \) p^(- i t), p) = log \| L \( sigma + i t \, chi \) \| + O_J \( 1 \) lt.eq C_(J \, chi) . $
  Here we used only an upper bound for the logarithm: a nonprincipal Dirichlet $L$-function has no pole at $1$ and is bounded on the compact region under consideration. Since (2.8) and the accompanying partial-summation estimate give $sum_(p lt.eq y) 1 \/ p = log log x + O_J \( 1 \)$, this proves a lower bound $log log x - O_(J \, chi \, E) \( 1 \)$ for this frequency range.
  For $\| t \| > 1$, let $m$ be the order of $chi$ on the units. The elementary inequality $\| 1 - z^m \| lt.eq m \| 1 - z \|$, for $\| z \| = 1$, gives
  $ 1 - "Re" \( chi \( p \) p^(- i t) \) gt.eq 1 / m^2 #scale(x: 120%, y: 120%)[\(] 1 - "Re" \( p^(- i m t) \) #scale(x: 120%, y: 120%)[\)] #h(2em) \( p divides.not q_chi \) . $
  The Vinogradov–Korobov bound, with any fixed logarithmic exponent strictly between $2 \/ 3$ and $1$, gives
  #[#set math.equation(numbering: n => "(2.17)")
   $ \| zeta \( sigma + i u \) \| lt.double \( log \( \| u \| + 3 \) \)^(3 \/ 4) #h(2em) \( sigma gt.eq 1 \, med \| u \| gt.eq 1 \) . $ <eq:labels-zeta-bound>]
  The bound on the line $1$ follows from #cite(label("FordZeta2022")) (1.2). Its extension to the right can be seen by applying the Phragmén–Lindelöf principle in $1 lt.eq sigma lt.eq 2$ to
  $ frac(s - 1, s + 1) thin frac(zeta \( s \), \( log \( s + 3 \) \)^(3 \/ 4)) . $
  The pole at $1$ is removed, the logarithmic power has an analytic branch in this strip, and both vertical boundaries are bounded. For $\| "Im" s \| gt.eq 1$, the removed rational factor is bounded away from zero, which gives (2.17). For $sigma gt.eq 2$ the same estimate follows from absolute convergence. Applying the prime-sum comparison just proved, we obtain uniformly for $1 < \| t \| lt.eq C X$,
  $ sum_(p lt.eq y) frac(1 - "Re" \( p^(- i m t) \), p) & = log log x - log \| zeta \( sigma + i m t \) \| + O_J \( 1 \)\
 & gt.eq 1 / 4 log log x - O_(J \, c \, C \, chi) \( 1 \) . $
  Combining the two frequency ranges proves
  $ bb(D) \( h_x \, n^(i t) \; X \)^2 gt.eq frac(1, 4 m^2) log log x - O_(J \, c \, C \, chi \, E) \( 1 \) #h(2em) \( \| t \| lt.eq C X \) \, $
  which implies (2.16). ◻
]

=== 2.5 Proof of the weighted short-average lemma <proof-of-the-weighted-short-average-lemma>

#proof[
  Teräväinen #cite(label("Teravainen2018")) Section 4, proof of Theorem 1.11 uses real multiplicative generating functions for large-prime counts and recovers event coefficients from them. Here the finite count range gives a pointwise tensor interpolation of the centered function of all bin counts by completely multiplicative functions. We prove this interpolation with coefficients independent of $B \, x$. Choose $J + 1$ distinct numbers in $\( 0 \, 1 \]$. The Vandermonde matrix whose entries are their powers of orders $0 \, dots.h \, J$ is invertible. Taking tensor products over the $J - 1$ count coordinates shows that there are finitely many complex constants $c_ell$ and vectors $bold(z)_ell = \( z_(ell \, 1) \, dots.h \, z_(ell \, J - 1) \) in \( 0 \, 1 \]^(J - 1)$ such that
  #[#set math.equation(numbering: n => "(2.18)")
   $ product_(k = 1)^(J - 1) zeta_k^(b_k) - mu = sum_ell c_ell product_(k = 1)^(J - 1) z_(ell \, k)^(b_k) #h(2em) \( 0 lt.eq b_k lt.eq J \) . $ <eq:labels-interpolation>]
  The coefficients and vectors depend only on the fixed labels and $J$. Define
  $ h_(ell \, x) \( m \) = product_(k = 1)^(J - 1) z_(ell \, k)^(Omega_(cal(B)_(k \, x)) \( m \)) . $
  Each $h_(ell \, x)$ is real, nonnegative, 1-bounded, and completely multiplicative. On every interval $m lt.eq C_B x$ with $C_B$ fixed for fixed $B$, the identity $F_x \( m \) = sum_ell c_ell h_(ell \, x) \( m \)$ holds for all sufficiently large $x$.
  We next prove the needed estimate for each fixed residue class of the integer argument. For a class $r' med \( mod med D \)$, put $d = gcd \( r' \, D \)$ and $q = D \/ d$, and write $m = d k$. Then $m equiv r' med \( mod med D \)$ is equivalent to $k equiv r' \/ d med \( mod med q \)$, a unit class modulo $q$. For all sufficiently large $B$, no prime factor of $d$ belongs to $P_B$, so $G_(B \, v) \( d k \) = G_(B \, v) \( k \)$. For fixed $B$ and sufficiently large $x$, (2.6) also gives $F_x \( d k \) = F_x \( k \)$, and the same equality holds for every interpolant $h_(ell \, x)$.
  By character orthogonality, the restricted $k$-sum is a fixed linear combination of sums of
  #[#set math.equation(numbering: n => "(2.19)")
   $ h_(ell \, x) \( k \) G_(B \, v) \( k \) chi \( k \) \, #h(2em) chi med \( mod med q \) . $ <eq:labels-twisted-interpolants>]
  All these functions are 1-bounded and multiplicative. The sum length after division by $d$ is $H_B = L_B \/ d$. Normalization by $L_B$ is $d^(- 1)$ times normalization by $H_B$. Changing integer endpoints introduces an error $O_D \( L_B^(- 1) \)$.
  Consider first the principal character $chi_0 med \( mod med q \)$. The functions in (2.19) are then real, so Theorem 6 applies to each interpolant. Although their individual long means need not vanish, their centered linear combination does. More precisely, on any dyadic interval $\[ X \, 2 X \]$ with $X = c_B x$ and $c_B > 0$ fixed for fixed $B$,
  $ sum_ell c_ell cal(L)_X \( h_(ell \, x) G_(B \, v) chi_0 \) = 1 / X sum_(X < k lt.eq 2 X) F_x \( k \) G_(B \, v) \( k \) chi_0 \( k \) arrow.r 0 . $
  To justify the last limit, split the sum into residue classes modulo the fixed common period of $G_(B \, v)$ and $chi_0$, and apply Lemma 3 to every class. The number and the sizes of these residue classes may depend on $B$; they are fixed in this $x$-limit. The mean square of the centered short average thus has inner upper limit at most a fixed multiple of $r \( H_B \)$, where the multiple depends on the interpolation coefficients and $D$, but not on $B$.
  For a nonprincipal $chi$, the function in (2.19) equals $chi \( p \)$ at all primes $p lt.eq x^(1 \/ J)$ outside the finite set $P_B$. Lemma 8 therefore applies for each fixed $B$, with $X = c_B x$ and the frequency range $\| t \| lt.eq X$. For all sufficiently large $B$ we have $H_B gt.eq 10$, so Theorem 7 applies once $x$ is sufficiently large. Taking the inner upper limit in (2.15) leaves at most a constant times $\( log log H_B \/ log H_B \)^2$. This tends to zero as $B arrow.r oo$. There are only finitely many interpolants and characters, so the same holds after their linear combination.
  Finally, for a given origin $n$, the condition $i equiv r med \( mod med D \)$ in (2.12) is the condition $m = n + i equiv n + r med \( mod med D \)$. There are only $D$ possible argument residues $r'$, and it suffices to sum the bounds just proved for these possibilities. After $m = d k$, the short-interval origin is $\( n + a_B \) \/ d$. For fixed $B$ and all sufficiently large $x$,
  $ frac(s_0 T, 2 d) x lt.eq frac(n + a_B, d) lt.eq frac(2 s_1 T, d) x . $
  Choose a dyadic cover of the fixed scaled interval $\[ s_0 T \/ \( 2 d \) \, 2 s_1 T \/ d \]$. It gives intervals $\[ c_(B \, j) x \, 2 c_(B \, j) x \]$ with every $c_(B \, j) > 0$ fixed in the inner $x$-limit, and with a number of intervals bounded in terms of $s_0 \, s_1 \, D$ independently of $B$. Their scales are comparable to $T x \/ d$. Mapping the origins to their integer parts has multiplicity at most $d + 1$, and replacing an origin by its integer part costs $O \( H_B^(- 1) \)$. The integer-origin version of the preceding estimates consequently applies. Normalizing by $T x$ instead of the length of each dyadic range changes only fixed factors. Since $H_B = L_B \/ d arrow.r oo$ for every $d divides D$, this proves (2.12).
  All assertions used an unrestricted upper limit as $x arrow.r oo$; restricting that upper limit to a subsequence preserves them. ◻
]

=== 2.6 A profile of a nonzero mixed correlation <a-profile-of-a-nonzero-mixed-correlation>

We begin the proof by supposing that Proposition 4 fails. Fix an offending $J$ and pair of phase vectors. Boundedness permits passing to a subsequence on which the mixed correlation has a nonzero limit:

#[#set math.equation(numbering: n => "(2.20)")
 $ lim_(x arrow.r oo) 1 / x sum_(1 lt.eq n < x) overline(g_x \( n \)) F_x \( n + 1 \) eq.not 0 . $ <eq:labels-bad-correlation>]

The arithmetic amplification in the following sections will contradict this limit; Section 10 completes the argument.

Let $hat(bb(Z))$ be the profinite integers, with Haar probability measure $d w$, and identify every integer with its natural image in $hat(bb(Z))$. On $\( 0 \, oo \) times hat(bb(Z))$ define the locally finite measures

$ lambda_x = 1 / x sum_(n gt.eq 1) delta_(\( n \/ x \, n \)) \, #h(2em) nu_x = 1 / x sum_(n gt.eq 1) overline(g_x \( n \)) F_x \( n + 1 \) delta_(\( n \/ x \, n \)) . $

Unweighted scale counting gives $lambda_x arrow.r d t thin d w$ against compactly supported continuous tests. This follows first for a continuous test in $t$ times a residue-class indicator in $w$ by progression counting, and then for every compactly supported continuous test by uniform approximation. Also $\| nu_x \| lt.eq 2 lambda_x$. The resulting uniform variation bounds on compact sets, weak compactness on a countable exhaustion, and a diagonal extraction give a further subsequence along which $nu_x$ converges against these tests to a locally finite complex measure $nu$.

For every compactly supported continuous $Phi$, the weak convergences give

$ lr(|integral Phi thin d nu|) = lim_(x arrow.r oo) lr(|integral Phi thin d nu_x|) lt.eq 2 lim_(x arrow.r oo) integral \| Phi \| thin d lambda_x = 2 integral_0^oo integral_(hat(bb(Z))) \| Phi \( t \, w \) \| thin d w thin d t . $

The dual characterization of variation implies $\| nu \| lt.eq 2 thin d t thin d w$. The Radon–Nikodym theorem therefore gives a measurable function

#[#set math.equation(numbering: n => "(2.21)")
 $ W : \( 0 \, oo \) times hat(bb(Z)) arrow.r bb(C) \, #h(2em) \| W \( t \, w \) \| lt.eq 2 quad upright("almost everywhere") \, $ <eq:labels-profile>]

such that

#[#set math.equation(numbering: n => "(2.22)")
 $ lim_(x arrow.r oo) 1 / x sum_(n gt.eq 1) overline(g_x \( n \)) F_x \( n + 1 \) Phi \( n \/ x \, n \) = integral_0^oo integral_(hat(bb(Z))) Phi \( t \, w \) W \( t \, w \) thin d w thin d t $ <eq:labels-profile-convergence>]

for every compactly supported continuous $Phi$ on the product. Here and henceforth limits in $x$ may use the fixed subsequence.

Boundedness also permits replacing the compactly supported continuous tests in (2.22) by the indicator of $0 < t < 1$: truncate near $0$, approximate the remaining interval at its endpoints, and use the uniform bound on both weighted counting measures and $W$. Equation (2.20) therefore implies

$ integral_0^1 integral_(hat(bb(Z))) W \( t \, w \) thin d w thin d t eq.not 0 . $

Approximating this interval indicator by nonnegative smooth functions supported in $\( 0 \, 1 \)$, we can fix a real nonnegative $phi.alt in C_c^oo \( \( 0 \, oo \) \)$ with

#[#set math.equation(numbering: n => "(2.23)")
 $ beta_(*) = lr(|integral_0^oo integral_(hat(bb(Z))) phi.alt \( t \) W \( t \, w \) thin d w thin d t|) > 0 . $ <eq:labels-beta>]

The rest of the proof derives a contradiction from this fixed profile and bump. Every auxiliary choice will be made after $J \, f_x \, g_x \, F_x \, W \, phi.alt$ and the subsequence have been fixed.

== 3 Arithmetic preliminaries at an auxiliary log scale <sec:arithmetic>

This section supplies local asymptotic formulae and upper bounds for the coefficient and residue weights used in the amplification. All limits in this section are as $B arrow.r oo$. Constants may depend on explicitly fixed compact scale ranges, on the finitely many smooth norms indicated below, and later on the fixed regularity grid and its tolerance. They are uniform in the integer variables and moduli in the stated ranges. The parameter $B$ will always be held fixed when an inner limit in $x$ is taken elsewhere in the proof. We use the notation $e \( t \) = exp \( 2 pi i t \)$.

Take $B$ through sufficiently large positive integers and put

$ T = floor.l B^0.32 floor.r \, #h(2em) P_0 = B^1000 \, #h(2em) cal(P) = { p : P_0 < p lt.eq exp \( 4 B \) } \, #h(2em) R = frac(B, log P_0) \, #h(2em) ell = log R . $

In particular $R arrow.r oo$, $ell \/ log B arrow.r 1$, and $T < P_0$. An integer is #emph[rough] if it has no prime divisor at most $P_0$. Write $mu_(upright("Mob"))$ for the Möbius function, $omega$ for the number of distinct prime divisors, and $omega_E$ for this count restricted to a set of primes $E$.

The factors $2^(- omega)$ turn divisor sums into averages over fair splits of prime sets. Set

$ A_0 \( a \) = \( log P_0 \) R^(1 \/ 2) mu_(upright("Mob"))^2 \( a \) 2^(- omega \( a \)) upright(bold(1))_(a med upright("rough")) \, #h(2em) K_0 \( v \) = R^(1 \/ 2) 2^(- omega_(cal(P)) \( v \)) . $

The second definition also applies to $v in hat(bb(Z))$, and to a subset $S subset cal(P)$, by taking $omega_(cal(P)) \( S \) = \| S \|$. For $U subset S subset cal(P)$, let $a_U = product_(p in U) p$, with $a_diameter = 1$. The definitions give

#[#set math.equation(numbering: n => "(3.1)")
 $ A_0 \( a_U \) K_0 \( S \\ U \) = \( log P_0 \) R thin 2^(- \| S \|) = B thin 2^(- \| S \|) . $ <eq:arith-fair-split>]

A fair split selects each prime of $S$ independently with probability $1 \/ 2$. Thus summing the left side against a function of $U$ gives $B$ times its fair-split expectation.

The coefficient supports used below are contained in $\[ 1 \, exp \( b B \) \]$ for some fixed $b < 4$ once $B$ is large. Thus every prime divisor of a rough coefficient on these supports belongs to $cal(P)$.

=== 3.1 Uniform local asymptotics <uniform-local-asymptotics>

Our local estimates have two outputs. For $A_0$, they give a smooth mean on multiplicative windows at log scale $B$, including additive phases with moduli and real frequencies bounded by fixed powers of $B$. For a product $a$ formed by selecting each $p in cal(P)$ independently with probability $z \/ p$, where $z in { 1 \/ 4 \, 1 \/ 2 }$, they give a smooth density for $log a \/ B$ after restriction to a unit residue class, with an absolute error useful even on intervals of width $O \( 1 \/ B \)$ in that coordinate. Both outputs follow by partial summation from cumulative estimates with a saving of any prescribed power of $B$. We first recall the unrestricted Selberg–Delange estimates, then exclude the primes at most $P_0$ uniformly as that cutoff moves. For these two values of $z$, define

$ g_z \( n \) = mu_(upright("Mob"))^2 \( n \) z^(omega \( n \)) \, #h(2em) g_(z \, P_0) \( n \) = g_z \( n \) upright(bold(1))_(n med upright("rough")) . $

#thm([Lemma 3.1.])[
  (Classical estimates used in roughness removal).  #emph[For each fixed nonnegative integer $H$ and either of the above values of $z$, there are real constants $c_j \( z \)$ such that, for $Y gt.eq 3$, 
$ sum_(n lt.eq Y) g_z \( n \) = Y sum_(j = 0)^H c_j \( z \) \( log Y \)^(z - 1 - j) + O_H #scale(x: 120%, y: 120%)[\(] Y \( log Y \)^(z - 2 - H) #scale(x: 120%, y: 120%)[\)] \, $

 where 
$ c_0 \( z \) = frac(1, Gamma \( z \)) product_p \( 1 + z \/ p \) \( 1 - 1 \/ p \)^z > 0 . $

 For each fixed $C \, D > 0$, uniformly over nonprincipal Dirichlet characters $chi$ of modulus $d lt.eq \( log Y \)^C$, one has 
$ sum_(n lt.eq Y) g_z \( n \) chi \( n \) lt.double_(C \, D) Y \( log Y \)^(- D) . $

 The constants in the second estimate, and the threshold after which it holds, need not be effective.]
] <lem:arith-classical-sd>

#proof[
  The first statement is the classical fixed-order Selberg–Delange expansion; see #cite(label("GranvilleKoukoulopoulos2019")) Theorem 1 and #cite(label("Koukoulopoulos2019")) Theorem 13.2. The normalization and the moving roughness cutoff required here are recorded explicitly below. In $Re s > 1$,
  $ sum_n frac(g_z \( n \), n^s) = zeta \( s \)^z G_z \( s \) \, #h(2em) G_z \( s \) = product_p \( 1 + z p^(- s) \) \( 1 - p^(- s) \)^z . $
  Define the local powers by their power-series logarithms. The logarithm of each local factor of $G_z$ is $O \( p^(- 2 Re s) \)$. Consequently $G_z$ is analytic, nonzero, and bounded on $Re s gt.eq 0.9$, with all derivatives bounded on fixed smaller compact sets. Near $s = 1$, put $u = s - 1$. The analytic factor
  $ frac(\( u zeta \( 1 + u \) \)^z G_z \( 1 + u \), 1 + u) $
  has a convergent Taylor series and has value $G_z \( 1 \)$ at $u = 0$. Truncated Perron inversion, followed by a contour around the cut to the left of $1$, integrates its $j$th Taylor term against $Y e^(u log Y) u^(j - z)$. Hankel’s reciprocal-gamma formula gives the factor $\( log Y \)^(z - j - 1) \/ Gamma \( z - j \)$. Taylor’s remainder, integrated on that contour, is $O_H \( Y \( log Y \)^(z - H - 2) \)$. For completeness, the contour may have right edge $1 + 1 \/ log Y$, height $exp \( c sqrt(log Y) \)$, left edge $1 - c' \/ sqrt(log Y)$, and small circular part of radius $1 \/ log Y$. The classical zero-free region for $zeta$ permits fixed sufficiently small $c \, c' > 0$; the other contour pieces and the Perron truncation error are $O_H \( Y exp \( - c'' sqrt(log Y) \) \( log Y \)^(O_H \( 1 \)) \)$ and are absorbed in the displayed remainder. The local expansion just described also identifies $c_0 \( z \) = G_z \( 1 \) \/ Gamma \( z \)$.
  We spell out the character uniformity. The twisted series is
  $ L \( s \, chi \)^z G_(z \, chi) \( s \) \, #h(2em) G_(z \, chi) \( s \) = product_p \( 1 + z chi \( p \) p^(- s) \) \( 1 - chi \( p \) p^(- s) \)^z . $
  The same cancellation of the linear local term bounds $G_(z \, chi)$ uniformly in $chi$ on $Re s gt.eq 0.9$. Write $L_Y = log Y$ and $Theta = exp \( c sqrt(L_Y) \)$, and use the rectangle
  $ 1 - c' \/ sqrt(L_Y) lt.eq Re s lt.eq 1 + 1 \/ L_Y \, #h(2em) \| "Im" s \| lt.eq Theta . $
  The classical Dirichlet zero-free region excludes zeros in this rectangle except possibly a real zero of a real primitive character inducing $chi$. Siegel’s bound states that for every fixed $epsilon > 0$ such a zero obeys $1 - beta gt.double_epsilon d^(- epsilon)$; see #cite(label("Koukoulopoulos2019")) Theorems 12.3 and 12.10 for the zero-free region and exceptional-zero bound. Choose $epsilon < 1 \/ \( 2 C \)$. Since $d lt.eq L_Y^C$, this distance is eventually larger than $c' \/ sqrt(L_Y)$, uniformly in the allowed moduli. The Euler factors removed for imprimitive characters have no zeros in $Re s > 0$. Thus an analytic logarithm of $L \( s \, chi \)$ exists throughout the rectangle, agreeing with its Euler-product logarithm on its intersection with $Re s > 1$.
  There is also a uniform polynomial bound in $L_Y$ on this rectangle. For $s = sigma + i t$ truncate the Dirichlet series at $V = ceil.l d \( 2 + \| t \| \) ceil.r$. The periodic character sums have modulus at most $d$, so partial summation bounds the tail by $O \( d \( 1 + \| s \| \) V^(- sigma) \)$. The initial segment is at most $O \( \( 1 + log V \) V^(max \( 1 - sigma \, 0 \)) \)$. Since $log V lt.double_C sqrt(L_Y)$ and $\( 1 - sigma \) log V = O_C \( 1 \)$ in the rectangle, these estimates bound $L \( s \, chi \)$ by a fixed power of $L_Y$. Because $z$ is real, the modulus of the chosen analytic power is $\| L \( s \, chi \)^z \| = \| L \( s \, chi \) \|^z$.
  The coefficients have modulus at most one. At an endpoint $Y in bb(Z) + 1 / 2$, truncated Perron therefore has error $O \( Y \( 1 + log Y \)^2 exp \( - c sqrt(L_Y) \) \)$; this follows also by summing its usual $min \( 1 \, \( Theta \| log \( Y \/ n \) \| \)^(- 1) \)$ error. Shift the Perron contour to the left edge. There is no pole or branch cut in the twisted case. The new vertical integral is bounded by $Y exp \( - c' sqrt(L_Y) \)$ times a fixed power of $L_Y$, and the horizontal integrals have the additional factor $Theta^(- 1)$. This proves an exponential square-root-log saving and hence the claimed saving of any fixed logarithmic power. For arbitrary $Y gt.eq 3$, let $Y'$ be the least element of $bb(Z) + 1 / 2$ with $Y' gt.eq Y$. Then $0 lt.eq Y' - Y < 1$ and $d lt.eq \( log Y \)^C lt.eq \( log Y' \)^C$. Replacing $Y$ by $Y'$ changes the sum by at most one term and any smooth main term by an amount absorbed in the stated errors. This gives both estimates for arbitrary real $Y$. ◻
]

#thm([Lemma 3.2.])[
  (The moving roughness cutoff).  #emph[Fix $D > 0$. There is a fixed integer $H = H \( D \)$ and real coefficients $C_(j \, z) \( P_0 \)$, $0 lt.eq j lt.eq H$, such that uniformly for $B^0.89 lt.eq log Y lt.eq 4 B$, 
$ sum_(n lt.eq Y) g_(z \, P_0) \( n \) = Y sum_(j = 0)^H C_(j \, z) \( P_0 \) \( log Y \)^(z - 1 - j) + O_D \( Y B^(- D) \) . $

 There is an absolute constant $C_0$ such that for every fixed $j$, 
$ \| C_(j \, z) \( P_0 \) \| lt.double_j \( log P_0 \)^(C_0 + j) \, #h(2em) C_(0 \, z) \( P_0 \) = c_0 \( z \) product_(p lt.eq P_0) \( 1 + z \/ p \)^(- 1) tilde.op frac(e^(- gamma_(upright(E)) z), Gamma \( z \)) \( log P_0 \)^(- z) \, $

 where $gamma_(upright(E))$ is Euler’s constant. Uniformly for nonprincipal $chi$ of modulus $d lt.eq B^15$ in the same size range, 
$ sum_(n lt.eq Y) g_(z \, P_0) \( n \) chi \( n \) lt.double_D Y B^(- D) . $

]
] <lem:arith-rough-sd>

#proof[
  Define the multiplicative function $h_z$ by $h_z \( p^e \) = \( - z \)^e$ for $p lt.eq P_0$ and $e gt.eq 1$, and by $h_z \( p^e \) = 0$ for $p > P_0$ and $e gt.eq 1$. Its Euler factors give the exact identity $g_(z \, P_0) = g_z * h_z$. If $epsilon.alt_0 = 1 \/ log P_0$, then
  $ sum_v frac(\| h_z \( v \) \|, v^(1 - epsilon.alt_0)) = product_(p lt.eq P_0) \( 1 - z p^(- 1 + epsilon.alt_0) \)^(- 1) lt.double \( log P_0 \)^(C_0) . $
  Indeed $p^(epsilon.alt_0) lt.eq e$ in the product, its logarithm is bounded by a constant times $sum_(p lt.eq P_0) p^(- 1 + epsilon.alt_0)$ plus a bounded sum of square terms, and Mertens’ estimate bounds that first sum by $O \( log log P_0 \)$. Increasing the absolute constant $C_0$ if necessary gives the displayed assertion for both values of $z$. Since $\( log v \)^k lt.eq k ! epsilon.alt_0^(- k) v^(epsilon.alt_0)$, it also gives
  $ sum_v frac(\| h_z \( v \) \|, v) \( log v \)^k lt.double_k \( log P_0 \)^(C_0 + k) . $
  Put $L_Y = log Y$. In the convolution sum the terms $v > sqrt(Y)$ contribute, after division by $Y$, at most
  $ sum_(v > sqrt(Y)) frac(\| h_z \( v \) \|, v) lt.double \( log P_0 \)^(C_0) exp (- frac(L_Y, 2 log P_0)) \, $
  because the inner untwisted or twisted sum is at most $Y \/ v$ in absolute value. For $v lt.eq sqrt(Y)$, apply Lemma 9 at $Y \/ v$. For the untwisted sum expand each factor by Taylor’s formula:
  $ \( L_Y - log v \)^(z - 1 - j) = sum_(k = 0)^(H - j) binom(z - 1 - j, k) \( - log v \)^k L_Y^(z - 1 - j - k) + O_H #scale(x: 120%, y: 120%)[\(] L_Y^(z - 2 - H) \( log v \)^(H - j + 1) #scale(x: 120%, y: 120%)[\)] . $
  This remainder is uniform for $0 lt.eq log v lt.eq L_Y \/ 2$. After summing with $h_z \( v \) \/ v$, the total Taylor and Selberg–Delange remainders are at most
  $ O_H #scale(x: 120%, y: 120%)[\(] Y L_Y^(z - 2 - H) \( log P_0 \)^(C_0 + H + 1) #scale(x: 120%, y: 120%)[\)] . $
  The moment sums in the polynomial coefficients may be extended to all $v$. To see that the resulting error is negligible, combine $\( log v \)^k lt.double_k epsilon.alt_0^(- k) v^(epsilon.alt_0 \/ 2)$ with the preceding Rankin bound: the tail of each such moment is $O_k \( \( log P_0 \)^(C_0 + k) exp \( - L_Y \/ \( 4 log P_0 \) \) \)$. Thus explicitly
  $ C_(nu \, z) \( P_0 \) = sum_(j + k = nu) c_j \( z \) binom(z - 1 - j, k) \( - 1 \)^k sum_v frac(h_z \( v \), v) \( log v \)^k . $
  The moment bounds prove the claimed coefficient bounds. Since $log P_0 = 1000 log B$ and $L_Y gt.eq B^0.89$, choosing the fixed integer $H$ sufficiently large makes all these errors $O_D \( Y B^(- D) \)$. The zeroth moment is $product_(p lt.eq P_0) \( 1 + z \/ p \)^(- 1)$. Combining it with the Euler product for $c_0 \( z \)$ gives
  $ C_(0 \, z) \( P_0 \) = frac(1, Gamma \( z \)) product_(p lt.eq P_0) \( 1 - 1 \/ p \)^z product_(p > P_0) \( 1 + z \/ p \) \( 1 - 1 \/ p \)^z . $
  The second product tends to one, and Mertens’ product formula proves its stated asymptotic and positivity.
  For a nonprincipal character, use the same convolution with $h_z \( v \) chi \( v \)$ and the second estimate of Lemma 9. On $v lt.eq sqrt(Y)$ we have $log \( Y \/ v \) gt.eq L_Y \/ 2$ and, for all large $B$, $d lt.eq B^15 lt.eq \( log \( Y \/ v \) \)^18$. Take an arbitrarily large fixed saving exponent in that lemma. The factor $sum_v \| h_z \( v \) \| \/ v lt.double \( log P_0 \)^(C_0)$ is absorbed by increasing that exponent. The terms $v > sqrt(Y)$ have already been bounded independently of $chi$. This proves the required uniform character estimate. ◻
]

We now turn these counting estimates into local densities for the coefficient weights and probability laws for randomly selected prime products. Choose the expansion order once, sufficiently large to use Lemma 10 with $D = 200$ for both values of $z$. For $L > 0$ write

$ P_(z \, B) \( L \) = sum_(j = 0)^H C_(j \, z) \( P_0 \) L^(z - 1 - j) \, #h(2em) D_(z \, B) \( L \) = P_(z \, B) \( L \) + P'_(z \, B) \( L \) . $

Thus $D_(z \, B) \( log Y \)$ is exactly the derivative with respect to $Y$ of $Y P_(z \, B) \( log Y \)$. Define

$ m_B \( s \) = \( log P_0 \) R^(1 \/ 2) D_(1 \/ 2 \, B) \( B s \) \, #h(2em) Q_(z \, B) = product_(p in cal(P)) \( 1 - z \/ p \) \, #h(2em) f_(z \, B) \( s \) = B Q_(z \, B) D_(z \, B) \( B s \) . $

These are finite combinations of smooth powers on $s > 0$. The coefficient bounds and $log P_0 = B^(o \( 1 \))$ imply, for every fixed nonnegative derivative order, convergence of these functions and their derivatives uniformly on compact subintervals of the indicated domains:

$ m_B \( s \) arrow.r m \( s \) = c_A s^(- 1 \/ 2) quad \( 0 < s < 4 \) \, #h(2em) f_(z \, B) \( s \) arrow.r c_z s^(z - 1) quad \( 0 < s < 3.3 \) \, $

where

$ c_A = frac(e^(- gamma_(upright(E)) \/ 2), Gamma \( 1 \/ 2 \)) \, #h(2em) c_z = frac(e^(- gamma_(upright(E)) z), 4^z Gamma \( z \)) . $

Here $Q_(z \, B) tilde.op \( 4 R \)^(- z)$ by Mertens’ estimate. To check the derivative assertion directly, the $j = 0$ term has the stated limit after normalization. Every term with $j gt.eq 1$, as well as the $P'_(z \, B)$ part, gains at least one power of $B^(- 1)$ relative to that term on a fixed compact interval, with only a fixed power of $log P_0$ lost. The same reasoning applies after any fixed number of $s$-derivatives. Moreover the leading term dominates uniformly for $B s gt.eq B^0.89$: each ratio of a lower-order term to it is bounded by a fixed power of $log P_0$ divided by a positive power of $B s$. Consequently $f_(z \, B) \( s \) lt.double s^(z - 1)$ for $B^(- 1 \/ 10) lt.eq s lt.eq 3.2$, and all these densities are positive on that range for sufficiently large $B$.

#thm([Proposition 3.3.])[
  (Local coefficient and product laws).  #emph[Let $w_3$ be smooth and supported in a fixed compact subinterval of $\( 0 \, oo \)$. Uniformly for $0.9 B lt.eq log X lt.eq 2.2 B$, $q lt.eq B^15$, $\( u \, q \) = 1$, and real $xi$ with $\| xi \| lt.eq B^14$, 
#[#set math.equation(numbering: n => "(3.2)")
 $ sum_c A_0 \( c \) w_3 \( c \/ X \) e \( c u \/ q + xi c \/ X \) = X frac(mu_(upright("Mob")) \( q \), phi \( q \)) integral w_3 \( t \) m_B \( log \( X t \) \/ B \) e \( xi t \) thin d t + O \( X B^(- 50) \) . $ <eq:1>]

 The convention $q = 1$ is included. The constant in the error is controlled by a fixed constant times finitely many low-order smooth norms of $w_3$; the expansion order defining $m_B$ is independent of $w_3$.]
  #emph[Let $nu_z$ be the law of the product of primes of $cal(P)$ selected independently with probabilities $z \/ p$, and write $s = log a \/ B$ for its log coordinate. For $d lt.eq B^15$, every such product is a unit modulo $d$. Uniformly for all intervals $I' subset \[ B^(- 1 \/ 10) \, 3.2 \]$ and unit residues $r med \( mod med d \)$, 
#[#set math.equation(numbering: n => "(3.3)")
 $ bb(P)_(nu_z) \( s in I' \, med a equiv r med \( mod med d \) \) = frac(1, phi \( d \)) integral_(I') f_(z \, B) \( s \) thin d s + O \( B^(- 80) \) . $ <eq:2>]

 Uniformly for $0 lt.eq delta lt.eq 1$, 
#[#set math.equation(numbering: n => "(3.4)")
 $ bb(P)_(nu_z) \( s lt.eq delta \) lt.double \( delta + 1 \/ R \)^z . $ <eq:3>]

 For each positive integer $n lt.eq exp \( 3.2 B \)$, 
#[#set math.equation(numbering: n => "(3.5)")
 $ nu_(1 \/ 2) \( n \) lt.double frac(A_0 \( n \), B n) \, $ <eq:4>]

 where both sides are zero unless $n$ is a squarefree rough product, apart from the allowed empty product $n = 1$.]
] <prop:arith-local-laws>

#proof[
  Since $P_0 > B^15$, all rough integers are units for every modulus in the statement. Character orthogonality and Lemma 10 give, for each unit class,
  $ sum_(n lt.eq Y\
n equiv r med \( d \)) g_(z \, P_0) \( n \) = frac(Y, phi \( d \)) P_(z \, B) \( log Y \) + O \( Y B^(- 200) \) . $
  There is no loss of a factor $phi \( d \)$ here: it is cancelled by the normalization in character orthogonality. Partial summation, multiplication by $\( log P_0 \) R^(1 \/ 2)$ when $z = 1 \/ 2$, and summation over the unit residues against $e \( u r \/ q \)$ now prove (3.2). The sum of the latter phases is the Ramanujan sum $mu_(upright("Mob")) \( q \)$ because $\( u \, q \) = 1$. For explicit error accounting, summation over residues costs at most $q$, the normalizing factor is at most $B$ eventually, and differentiating $w_3 \( t \) e \( xi t \)$ costs at most a constant times $\( 1 + \| xi \| \) \( parallel w_3 parallel_oo + parallel w'_3 parallel_1 + parallel w_3 parallel_1 \)$ on the fixed support. Thus the initial $B^(- 200)$ saving exceeds all these losses by much more than the claimed $B^(- 50)$. On that support $log \( X t \)$ is in the range of the preceding lemma once $B$ is sufficiently large.
  For a squarefree product $n$ of the allowed primes, independence gives the exact mass
  $ nu_z \( n \) = Q_(z \, B) z^(omega \( n \)) / n product_(p divides n) \( 1 - z \/ p \)^(- 1) . $
  On $n lt.eq exp \( 3.3 B \)$ the last product is $1 + O \( B \/ P_0 \)$, uniformly: its logarithm is $O \( omega \( n \) \/ P_0 \) = O \( B \/ P_0 \)$. In this range every rough prime factor is below the upper cutoff $exp \( 4 B \)$. Hence the mass without that last product is exactly $Q_(z \, B) g_(z \, P_0) \( n \) \/ n$. Partial summation of the unit-class formula between any two endpoints $e^(B a) \, e^(B b)$, with $B^(- 1 \/ 10) lt.eq a lt.eq b lt.eq 3.2$, gives
  $ Q_(z \, B) sum_(e^(B a) < n lt.eq e^(B b)\
n equiv r med \( d \)) frac(g_(z \, P_0) \( n \), n) = frac(1, phi \( d \)) integral_a^b B Q_(z \, B) D_(z \, B) \( B s \) thin d s + O \( B^(- 199) \) . $
  Indeed each endpoint error is $O \( B^(- 200) \)$, and integrating the error $O \( t B^(- 200) \)$ against $d t \/ t^2$ over a log interval of length $O \( B \)$ costs $O \( B^(- 199) \)$; also $Q_(z \, B) lt.eq 1$. The $O \( B \/ P_0 \)$ relative mass correction contributes at most $O \( B \/ P_0 \)$ in total, since the uncorrected masses are bounded above by the true probabilities. Endpoint atoms have exponentially small mass because $n gt.eq exp \( B^0.9 \)$. This proves (3.3) for arbitrary endpoint conventions and arbitrarily short or partial intervals. No relative error for a short interval is asserted or needed.
  If $delta < 1 \/ R$, the event $s lt.eq delta$ forces the product to be empty, so its probability is $Q_(z \, B) lt.double R^(- z)$. If $1 \/ R lt.eq delta lt.eq 1$, the event forces all primes with $log p > delta B$ to be absent. Mertens’ product estimate therefore bounds its probability by
  $ product_(e^(delta B) < p lt.eq e^(4 B)) \( 1 - z \/ p \) lt.double delta^z . $
  These estimates prove (3.4), including $delta = 0$. Finally, on a squarefree rough $n$ in the range of (3.5),
  $ frac(nu_(1 \/ 2) \( n \), A_0 \( n \) \/ \( B n \)) = Q_(1 \/ 2 \, B) R^(1 \/ 2) product_(p divides n) \( 1 - 1 \/ \( 2 p \) \)^(- 1) = 1 / 2 + o \( 1 \) $
  uniformly, and also for $n = 1$. This proves (3.5); outside the squarefree rough support both masses vanish. ◻
]

=== 3.2 Upper sieve bounds with reducing local weights <upper-sieve-bounds-with-reducing-local-weights>

We state precisely the classical upper-sieve input, in its event-space form. For a fixed positive integer $k$, choose once a bound $P_k > 2 k$ depending only on $k$. For a sieve bound $Z gt.eq 2$, let $cal(R)_Z subset { p : P_k < p lt.eq Z }$ be the set of retained primes. Suppose their forbidden local densities obey $0 lt.eq theta_p lt.eq k \/ p$. Mertens’ theorem then gives the upper dimension condition

$ product_(p in cal(R)_Z\
y < p lt.eq z) \( 1 - theta_p \)^(- 1) lt.eq (frac(log z, log y))^k (1 + O_k \( 1 \/ log y \)) #h(2em) \( 2 lt.eq y lt.eq z \) . $

Let $cal(V)$ be the ambient mass. For each squarefree $d$ whose prime factors all lie in $cal(R)_Z$, let $cal(V)_d$ be the mass satisfying the forbidden condition at every prime dividing $d$, and put

$ r_d = cal(V)_d - cal(V) product_(p divides d) theta_p . $

Extend $r_d$ by zero to all other positive integers. The classical fundamental lemma of the upper sieve supplies $s_k > 0$, depending only on $k$, and upper weights of absolute value at most one, supported on squarefree $d lt.eq D$ with prime factors in $cal(R)_Z$, such that, when $Z lt.eq D^(1 \/ s_k)$, the mass avoiding the retained forbidden conditions is at most

$ C_k cal(V) product_(p in cal(R)_Z) \( 1 - theta_p \) + sum_(d lt.eq D) \| r_d \| . $

The constants are uniform over the forbidden sets satisfying the displayed dimension condition. This is the bounded-dimension upper-sieve statement of #cite(label("FordSieve2023")) Theorems 2.4 and 3.6.

#thm([Lemma 3.4.])[
  (Interval, rectangle, and random-root sieves).  #emph[There is a sufficiently small $c_k > 0$, depending only on fixed $k$, with the following properties for $Z gt.eq 2$.]
  #emph[In an interval of length $N gt.eq 1$, at most $k$ forbidden residues at each prime $p lt.eq Z$ give an upper bound 
$ C_k N product_(p lt.eq Z) \( 1 - theta_p \) + O_k \( N^0.8 \) #h(2em) \( Z lt.eq N^(c_k) \) . $

 In a rectangle of side lengths $N_1 \, N_2 gt.eq 1$, suppose that at each prime the forbidden set is a union of at most $k$ proper affine lines. With $N_(*) = min \( N_1 \, N_2 \)$, there is the corresponding bound 
$ C_k N_1 N_2 product_(p lt.eq Z) \( 1 - theta_p \) + O_k \( N_1 N_2 N_(*)^(- 0.4) \) #h(2em) \( Z lt.eq N_(*)^(c_k) \) . $

 An application may omit specified primes from the restrictions, provided it also omits their factors from the products.]
  #emph[Both assertions also apply to reducing local weights. At each prime, attach a factor in $\[ 0 \, 1 \]$ to each of at most $k$ specified residue classes modulo $p$ in the interval case, or at most $k$ proper affine lines in the rectangle case. The factor is applied on its class or line and equals one off it. Replace $1 - theta_p$ by the residue average of the product of these factors.]
] <lem:arith-weighted-sieve>

#proof[
  At a squarefree modulus $d$, the one-dimensional forbidden intersection has at most $k^(omega \( d \))$ residue classes, each counted with error $O \( 1 \)$. Its remainder is therefore $O \( k^(omega \( d \)) \)$. In the rectangle there are at most $k^(omega \( d \)) d$ residue pairs: at each prime there are at most $k p$ pairs, and the Chinese remainder theorem multiplies these bounds. Each residue pair has count
  $ frac(N_1 N_2, d^2) + O (frac(N_1 + N_2, d) + 1) . $
  Thus its remainder is $O \( k^(omega \( d \)) \( N_1 + N_2 + d \) \)$. For fixed $k$, $sum_(d lt.eq D) k^(omega \( d \)) lt.double_k D \( 1 + log D \)^(O_k \( 1 \))$; one may obtain this by bounding $k^(omega \( d \))$ by a fixed divisor function and applying the elementary hyperbola bound to its sum. Use the preceding upper sieve with $D = N^(1 \/ 2)$ in an interval, or $D = N_(*)^(1 \/ 2)$ in a rectangle, and choose $c_k < 1 \/ \( 2 s_k \)$. The interval remainder is $N^(1 \/ 2 + o \( 1 \))$. The rectangle remainder is at most
  $ \( N_1 + N_2 \) N_(*)^(1 \/ 2 + o \( 1 \)) + N_(*)^(1 + o \( 1 \)) lt.double N_1 N_2 N_(*)^(- 0.4) $
  for sufficiently large $N_(*)$. Enlarge the constants to cover smaller lengths.
  The preceding sieve application temporarily omitted the primes $p lt.eq P_k$. For each unweighted choice of forbidden conditions, restore the factors of those primes whose restrictions the application retains. If one such prime forbids the whole residue space, the fully sifted count is zero. Otherwise its surviving fraction $1 - theta_p$ is at least $1 \/ p$ in an interval and at least $1 \/ p^2$ in a rectangle. The product of the reciprocals of these fractions over the bounded initial set is therefore bounded in terms of $k$. Enlarging $C_k$ restores all their factors in the displayed main term, without changing the remainder. This argument is uniform when conditions coincide and when $Z$ includes only part of the initial set. Primes that an application chooses to omit remain absent from both its restrictions and its product.
  For the weighted assertion, at every prime independently choose whether to forbid each specified condition, using probability one minus its local weight. Make these choices independently between conditions too, even if some coincide. For a fixed integer point, its probability of avoiding all the randomly chosen conditions is exactly the product of its local weights. Apply the unweighted bound for each choice and take expectations. The constants and remainders are uniform because every choice has at most $k$ residue conditions or proper lines. Independence between primes makes the expectation of the local-density product the product of the expected local densities. The latter is precisely the residue average stated in the lemma. The initial-prime factors were restored before this averaging, so no lower bound for an averaged local factor is needed. This proves the weighted version, including coincident conditions. Squarefreeness conditions and all factors in $\[ 0 \, 1 \]$ above $Z$ may be dropped when applying an upper bound. ◻
]

In the remaining estimates, $n asymp X$ and analogous notation mean membership in an interval between fixed positive constant multiples of the indicated scale. Restricting to additional size or positivity conditions only decreases the upper bounds. They are uniform when $\( log X \) \/ B$ lies in any fixed compact subinterval of $\( 0 \, 4 \)$, with constants allowed to depend on that subinterval. In particular, they apply throughout $0.9 B lt.eq log X lt.eq 2.2 B$, the range used later. In applications involving $T X$, this convention still leaves all coefficient logarithms below $4 B$.

#thm([Lemma 3.5.])[
  (First and second coefficient moments).  #emph[On these intervals, 
#[#set math.equation(numbering: n => "(3.6)")
 $ X^(- 1) sum_(n asymp X) A_0 \( n \) lt.double 1 \, #h(2em) X^(- 1) sum_(n asymp X) A_0 \( n \)^2 lt.double B^(1 \/ 4 + o \( 1 \)) . $ <eq:5>]

]
] <lem:arith-coefficient-moments>

#proof[
  Choose a sufficiently small fixed $c > 0$ and sieve up to $Z = exp \( c B \)$, as permitted by Lemma 12 throughout the fixed log-size range. For a single form, local weight zero at $p lt.eq P_0$ and local weight $t in { 1 \/ 2 \, 1 \/ 4 }$ above $P_0$ give residue averages $1 - 1 \/ p$ and $1 - \( 1 - t \) \/ p$, respectively. Their product is
  $ lt.double \( log P_0 \)^(- 1) (frac(log Z, log P_0))^(t - 1) lt.double_c \( log P_0 \)^(- 1) R^(t - 1) . $
  Dropping squarefreeness only increases the sum. Put $H_B = \( log P_0 \) R^(1 \/ 2)$. Multiplication by $H_B$ for the first moment gives one. Multiplication by $H_B^2$ for the second moment gives
  $ H_B^2 \( log P_0 \)^(- 1) R^(- 3 \/ 4) = \( log P_0 \) R^(1 \/ 4) = B^(1 \/ 4 + o \( 1 \)) . $
  The sieve remainders remain negligible after these polynomial factors. The omitted primes above $Z$ up to any of the fixed log-size endpoints have bounded reciprocal sum; in particular using this fixed small $c$ does not alter any power of $R$ in the bound. ◻
]

Fix a sufficiently large absolute constant $C_2$ and define, for nonzero integers $j$,

$ Sigma \( j \) = product_(p divides j) \( 1 + C_2 \/ p \) . $

For every fixed $r > 0$ this function satisfies $sum_(1 lt.eq j lt.eq U) Sigma \( j \)^r lt.double_r U$ for $U gt.eq 1$. Indeed expand $Sigma \( j \)^r = sum_(d divides j) b_r \( d \)$, with $b_r$ nonnegative, supported on squarefree integers, and $b_r \( p \) = \( 1 + C_2 \/ p \)^r - 1 = O_r \( 1 \/ p \)$. Then $sum_d b_r \( d \) \/ d = product_p \( 1 + b_r \( p \) \/ p \) < oo$, proving the assertion by summing the divisor expansion.

#thm([Lemma 3.6.])[
  (Two- and three-form coefficient bounds).  #emph[Uniformly for $0 < \| j \| lt.eq T$ and squarefree rough $b asymp T X$, 
#[#set math.equation(numbering: n => "(3.7)")
 $ sum_(c asymp X\
b + j c asymp T X \, med b + j c > 0) A_0 \( c \) A_0 \( b + j c \) lt.double X Sigma \( j \) . $ <eq:6>]

 On the same fixed log-size ranges, 
#[#set math.equation(numbering: n => "(3.8)")
 $ sum_(b asymp T X \, med c asymp X\
a = b + j c asymp T X \, med a > 0) A_0 \( b \) A_0 \( a \) A_0 \( c \) lt.double T X^2 Sigma \( j \) . $ <eq:7>]

 The implied constants do not depend on $b \, j \, X$, or $B$.]
] <lem:arith-form-bounds>

#proof[
  Use the same sieve limit $Z = exp \( c B \)$ with $c$ sufficiently small. For (3.7), at $p divides.not j b$ the roots of $c$ and $b + j c$ are distinct. At a prime at most $P_0$ the local density of avoiding them is $1 - 2 \/ p$; at a larger prime the residue average of the two weights $1 \/ 2$ is $1 - 1 \/ p$. Apart from a factor $1 + O \( p^(- 2) \)$, these are the squares of the single-form factors in the preceding proof. Bounded small primes may be omitted. If $p divides j$, then $p < P_0$ and $b$ is a unit at $p$. Only the root of $c$ is forbidden. Its loss compared with two ordinary roots is at most $1 + O \( 1 \/ p \)$ outside the omitted bounded set. The product of these losses is covered by $Sigma \( j \)$ after fixing $C_2$ sufficiently large. If $p divides b$, then $p > P_0$ and we may drop both local conditions; their reciprocal sum is
  $ sum_(p divides b) 1 / p lt.eq frac(omega \( b \), P_0) lt.double B / P_0 . $
  Thus these exceptional primes have bounded total cost. Lemma 12 now gives density at most $C Sigma \( j \) \( log P_0 \)^(- 2) R^(- 1)$ in an interval of length comparable to $X$. Its normalization $H_B^2$ proves (3.7).
  For (3.8), use the rectangle in $\( b \, c \)$ of area comparable to $T X^2$. At $p divides.not j$, the equations $b = 0$, $c = 0$, and $b + j c = 0$ are three distinct lines. Their pairwise and triple intersections have density $p^(- 2)$. Inclusion–exclusion, also with the local reducing weights, therefore gives the product of the three single-form averages up to $1 + O \( p^(- 2) \)$. At $p divides j$ the lines for $a$ and $b$ coincide; since $p < P_0$, the loss from three ordinary rough exclusions to two is at most $1 + O \( 1 \/ p \)$. Again their product is covered by $Sigma \( j \)$. The rectangular sieve gives density at most $C Sigma \( j \) \( log P_0 \)^(- 3) R^(- 3 \/ 2)$, which is cancelled by $H_B^3$. All sieve remainders are negligible because $X$ is exponential in $B$, whereas $T$, the normalizations, and the possible singular losses are polynomial in $B$. Extending a support to a rectangle or interval for the sieve is harmless: the local congruence restrictions continue to hold on the original positive support, and the extension is used only for an upper bound. ◻
]

=== 3.3 Regularity cutoffs and their loss <regularity-cutoffs-and-their-loss>

Fix an integer $L gt.eq 1$ and let $Delta = 1 \/ L$. The grid consists of $g = i \/ L$, $1 lt.eq i lt.eq L$. Fix a small $tau > 0$ and, later, a sufficiently large $C_(*) > 0$. The choices of $L$ and $tau$ remain available for the additional fixed requirements in Section 6: first take $L$ sufficiently large, then take $tau$ sufficiently small. None of the estimates of the present section requires an upper bound for $L$ or a positive lower bound for $tau$.

The prefix bounds will control competing divisor representations in Section 6; the tail lower bounds will make the two-split second moment in Section 4 summable.

#prodef([Definition 3.7.])[
  (Regular prime sets).  For $S subset cal(P)$ put
  $ N_g \( S \) = cases(delim: "{", \| { p in S : log p lt.eq B^g } \| \, & g < 1 \,, \| S \| \, & g = 1 .) $
  Let $Y_i = 2^i log P_0$, $0 lt.eq i lt.eq i_max$, where $i_max$ is the first index with $Y_i gt.eq 4 B$. The set $S$ is regular if both of the following conditions hold:
  $ \( g \/ 2 - tau \) ell lt.eq N_g \( S \) lt.eq \( g \/ 2 + tau \) ell quad upright("for every grid point ") g \, $
  and
  $ \| { p in S : log p > Y_i } \| gt.eq 0.4 log \( B \/ Y_i \) - C_(*) quad \( 0 lt.eq i lt.eq i_max \) . $
  An integer or profinite integer is regular when its set of dividing primes from $cal(P)$ is regular. Multiplicities are not counted in these cutoffs.
] <def:arith-regularity>

Put $A = A_0 upright(bold(1))_(upright("reg"))$ and $K = K_0 upright(bold(1))_(upright("reg"))$, with the analogous definition for $K \( S \)$. The lower total-count bound in the definition gives

#[#set math.equation(numbering: n => "(3.9)")
 $ A \( a \) \, med K \( v \) \, med K \( S \) lt.eq B^(h_0 + tau log 2 + o \( 1 \)) \, #h(2em) h_0 = frac(1 - log 2, 2) . $ <eq:8>]

For $A$, any prime factors outside $cal(P)$ only decrease the weight; the additional factor $log P_0$ is $B^(o \( 1 \))$. Choose $tau$ sufficiently small that

#[#set math.equation(numbering: n => "(3.10)")
 $ 2 \( h_0 + tau log 2 \) < 0.32 \, #h(2em) 1 - 6 \( h_0 + tau log 2 \) > 0.07 \, #h(2em) 1 - 5 \( h_0 + tau log 2 \) > 0.229 . $ <eq:arith-weight-exponents>]

These are compatible strict conditions, since

$ 2 h_0 = 0.3068528 dots.h \, quad 1 - 6 h_0 = 0.0794415 dots.h \, quad 1 - 5 h_0 = 0.2328679 dots.h . $

Any further decrease of $tau$ preserves them.

#thm([Lemma 3.8.])[
  (Loss from imposing regularity).  #emph[There is an absolute $c_3 > 0$ such that, for each fixed choice of the grid, tolerance, and compact log-size ranges above, there are $C > 0$ and a function $epsilon.alt_B arrow.r 0$ such that the part of the untruncated sum in (3.8) where at least one coefficient is not regular is at most 
#[#set math.equation(numbering: n => "(3.11)")
 $ C T X^2 Sigma \( j \) #scale(x: 120%, y: 120%)[\(] epsilon.alt_B + e^(- c_3 C_(*)) #scale(x: 120%, y: 120%)[\)] . $ <eq:9>]

 The constant $C$ may depend on the fixed grid, tolerance, and scale ranges, but not on $C_(*) \, j \, X \, B$. The function $epsilon.alt_B$ may depend on the same fixed data but is independent of $C_(*)$. The analogous bound with scale $X$ applies to the first-moment sum of $A_0$ in (3.6). For the product of two independent coefficient weights in a box, it applies with the corresponding area in place of $T X^2 Sigma \( j \)$.]
  #emph[The same upper probability $O \( epsilon.alt_B + e^(- c_3 C_(*)) \)$ holds for failure of regularity in a set of independent prime indicators on $cal(P)$ with parameters $1 \/ \( 2 p \) + O \( p^(- 2) \)$, uniformly when the constant in the $O$ term is fixed. It also holds after omitting a deterministic subset $E_B subset cal(P)$ satisfying 
$ sum_(p in E_B) 1 / p lt.eq C_E B / P_0 $

 for a fixed $C_E > 0$. The subset may depend on $B$, and the bound is uniform over all such subsets for each fixed $C_E$.]
] <lem:arith-regularity-loss>

#proof[
  We give direct upper bounds relative to the scales in the statement; no division by the actual mass of a weighted sum is used. Sieve with the fixed $Z = exp \( c B \)$ used in Lemmas 13 and 14. For a coefficient whose count is being tested, replace its local weight $1 \/ 2$ on a subset $cal(Q) subset cal(P)$ by $\( 1 \/ 2 \) e^s$ or $\( 1 \/ 2 \) e^(- s)$, where $s > 0$ is fixed and small enough that $\( 1 \/ 2 \) e^s < 1$. The random-root sieve still applies. At ordinary primes the logarithm of its product, relative to the unmodified single-form factor, changes by
  $ 1 / 2 \( e^(plus.minus s) - 1 \) sum_(p in cal(Q)\
p lt.eq Z) 1 / p + O \( 1 \) . $
  The $O \( 1 \)$ is uniform for small fixed $s$. In the three-form rectangle, line intersections alter it by a convergent sum of $O \( p^(- 2) \)$; the factors at primes dividing $j$ are still bounded by $Sigma \( j \)$, independently of such $s$. The one-form case and independent two-variable case have the same conclusion with their respective scale bounds. All modified local weights lie in $\[ 0 \, 1 \]$, so dropping those above $Z$ preserves the direction of the bound, even for the positive tilt.
  For a prefix $g < 1$, take $cal(Q) = { p in cal(P) : log p lt.eq B^g }$; for $g = 1$ take all of $cal(P)$. Mertens’ estimate gives
  $ sum_(p in cal(Q)\
p lt.eq Z) 1 / p = g ell + o \( ell \) . $
  For example, for $g < 1$ the left side is $g log B - log log P_0 + O \( 1 \)$ once $B$ is large, and its difference from $g ell$ is $O \( log log B \) = o \( ell \)$. There are only fixed finitely many grid points. The exponential Markov factor for a count exceeding $\( g \/ 2 + tau \) ell$ is $e^(- s \( g \/ 2 + tau \) ell)$; the tilted sieve therefore bounds its weighted contribution by the appropriate base scale times
  $ O (exp ([- s tau + g / 2 \( e^s - 1 - s \)] ell + o \( ell \))) . $
  For a count below $\( g \/ 2 - tau \) ell$ the corresponding bound is
  $ O (exp ([- s tau + g / 2 \( e^(- s) - 1 + s \)] ell + o \( ell \))) . $
  If the latter threshold is negative the event is empty. Otherwise choose $s$ sufficiently small in terms of the fixed $tau$; since both exponential remainders in brackets are $O \( s^2 \)$ and $g lt.eq 1$, both brackets are at most $- s tau \/ 2$. Thus every prefix violation saves a fixed positive power of $B$. A union bound over the grid and the at most three coefficients contributes $o \( 1 \)$ times the scale bound.
  For a tail endpoint $Y = Y_i < B$, use the negative tilt on $cal(Q) = { p in cal(P) : log p > Y }$. Uniformly in these endpoints,
  $ sum_(p in cal(Q)\
p lt.eq Z) 1 / p = log \( B \/ Y \) + O_c \( 1 \) . $
  When $Y lt.eq c B$ this is Mertens’ estimate with upper endpoint $e^(c B)$. When $c B < Y < B$ the sum is zero and $log \( B \/ Y \) = O_c \( 1 \)$, which gives the same formula. Exponential Markov at the threshold $0.4 log \( B \/ Y \) - C_(*)$ gives, relative to the appropriate base scale,
  $ O_c (exp (- s C_(*) + [0.4 s + 1 / 2 \( e^(- s) - 1 \)] log \( B \/ Y \))) . $
  Now choose a small absolute $s > 0$, independently of the grid. The bracket is $- 0.1 s + O \( s^2 \)$ and is negative. With $a_s = 1 / 2 \( 1 - e^(- s) \) - 0.4 s > 0$, the sum of these bounds over the dyadic endpoints $Y < B$ is
  $ O_c \( e^(- s C_(*)) \) sum_(Y_i < B) \( Y_i \/ B \)^(a_s) lt.double_c e^(- s C_(*)) . $
  For $Y gt.eq B$ the required lower threshold is nonpositive, so there is no failure. Taking $c_3 = s$ proves the asserted tail loss.
  The sieve remainders remain negligible in each application: their savings are powers of intervals exponential in $B$, whereas normalization and Markov factors are only fixed powers of $B$, and there are $O \( log B \)$ tail endpoints. For $C_(*) gt.eq 0$, the Markov factors involving $C_(*)$ are at most their values at zero. Thus the residual function $epsilon.alt_B$ can be chosen independently of $C_(*)$. The prefix factors depend only on the fixed grid and $tau$. This proves (3.11) and its one- and two-weight variants.
  Finally let $X_p$ be the independent indicators in the probability statement, with parameters $lambda_p = 1 \/ \( 2 p \) + O \( p^(- 2) \)$. For either sign and any subset $cal(Q)$,
  $ bb(E) exp (plus.minus s sum_(p in cal(Q)) X_p) = product_(p in cal(Q)) \( 1 + lambda_p \( e^(plus.minus s) - 1 \) \) . $
  Its logarithm is $\( e^(plus.minus s) - 1 \) sum_(p in cal(Q)) lambda_p + O \( sum_p lambda_p^2 \)$. The latter error is bounded uniformly, while the parameter sums are $g ell \/ 2 + o \( ell \)$ for a prefix and $1 / 2 log \( B \/ Y \) + O \( 1 \)$ for a tail with $Y < B$. Omitting $E_B$ changes any parameter sum by at most $O_(C_E) \( B \/ P_0 \) = o \( 1 \)$, uniformly for fixed $C_E$. Apply exactly the two Markov calculations above, now to this product moment-generating function and with no sieve remainder. This proves all the probability assertions. ◻
]

== 4 Amplifying a mixed correlation <sec:amplification>

Starting from the fixed nonzero correlation profile in Section 2, we construct a nonnegative divisor weight $D_B$ that preserves it. We then expand the weighted correlation so that Cauchy–Schwarz removes $g_x$ and leaves a positive quadratic energy in $F_x$. The divisor weight depends only on primes tending to infinity with $B$; its positive mean and bounded second moment are the properties that will preserve the profile.

Retain $W$, $phi.alt$, and

$ beta_(*) = lr(|integral_(\( 0 \, oo \) times hat(bb(Z))) phi.alt \( t \) W \( t \, w \) thin d t thin d w|) > 0 $

from Section 2, and all parameters and weights from Section 3. In particular, $phi.alt$ is real and nonnegative. Fix real, nonnegative, nonzero functions $rho_0 \, psi in C_c^oo \( \( 1 \, 2 \) \)$. The regularity grid and its tolerance $tau$ are fixed throughout. A constant $C_(*)$ is also fixed whenever $B$ tends to infinity. Every limit in $x$ below is taken first, along the bad subsequence already selected in Section 2. Constants may depend on these fixed functions, the labels, and the grid and tolerance; dependence on $C_(*)$ will be indicated when it matters.

=== 4.1 The divisor weight and the correlation it preserves <the-divisor-weight-and-the-correlation-it-preserves>

For an integer $n gt.eq 1$, consider the two factorizations

$ n = a m \, #h(2em) n + 1 = c l . $

We select $c$ with $log c \/ B$ in the support of $rho_0$ and $a$ with $a \/ \( T c \)$ in the support of $psi$. The weights $A \( a \) \, A \( c \)$ apply to the chosen divisors and $K \( m \) \, K \( l \)$ to the two quotients. Define their normalized divisor sum on the profinite integers by

#[#set math.equation(numbering: n => "(4.1)")
 $ D_B \( w \) = 1 / B sum_(a divides w\
c divides w + 1) A \( a \) K \( w \/ a \) A \( c \) K \( \( w + 1 \) \/ c \) rho_0 (frac(log c, B)) psi (frac(a, T c)) \, #h(2em) w in hat(bb(Z)) . $ <eq:11>]

For integer $w = n$, this is exactly the sum over the two factorizations above. In $hat(bb(Z))$, divisibility means membership in the image of multiplication by the divisor. Multiplication by a positive integer is injective on $hat(bb(Z))$, so each quotient in the sum is well defined.

For fixed $B$, the coefficient support is finite: $e^B < c < e^(2 B)$ and $T c < a < 2 T c$. Every coefficient is less than $e^(4 B)$ for sufficiently large $B$, so every prime of a nonzero coefficient weight belongs to $cal(P)$. The modulus $product_(p in cal(P)) p^2$ suffices to determine $D_B$: a coefficient is squarefree, and testing whether $p$ divides its quotient requires at most the residue modulo $p^2$. Thus $D_B$ is a nonnegative function of finitely many high-prime residues.

Define $I_(1 \, x)$ by the weighted correlation

#[#set math.equation(numbering: n => "(4.2)")
 $ I_(1 \, x) / B = 1 / x sum_(n gt.eq 1) phi.alt \( n \/ x \) overline(g_x \( n \)) F_x \( n + 1 \) D_B \( n \) . $ <eq:amp-weighted-correlation>]

For each fixed $B$, the function $phi.alt \( t \) D_B \( w \)$ is a compactly supported continuous profile test. The convergence in (2.22) therefore gives

#[#set math.equation(numbering: n => "(4.3)")
 $ lim_(x arrow.r oo) I_(1 \, x) / B = integral_(\( 0 \, oo \) times hat(bb(Z))) phi.alt \( t \) W \( t \, w \) D_B \( w \) thin d t thin d w . $ <eq:amp-profile-limit>]

The factor $1 \/ B$ in (4.1) is explained by the fair-split identity (3.1). Each finite prime set contributes a factor $B$ when its divisors are summed as a fair split. For two independent products with law $nu_(1 \/ 2)$, the first-moment calculation below will show that the smooth size-and-ratio expectation is a positive constant divided by $B$, up to a smaller error. The two factors $B$ and the external division by $B$ then give a bounded positive mean in that model. The next reduction compares this model with the actual divisor weight and bounds the exceptional cases.

=== 4.2 The moment target and the independent split model <the-moment-target-and-the-independent-split-model>

#thm([Lemma 4.1.])[
  (Moments of the divisor weight).  #emph[There exist $C_0 > 0$ and $d_0 > 0$ such that, for each fixed $C_(*) gt.eq C_0$ and all sufficiently large $B$, 
#[#set math.equation(numbering: n => "(4.4)")
 $ parallel D_B parallel_(L^2 \( hat(bb(Z)) \)) lt.double_(C_(*)) 1 \, #h(2em) integral_(hat(bb(Z))) D_B \( w \) thin d w gt.eq d_0 . $ <eq:12>]

 The constant $d_0$ is independent of $C_(*)$ and $B$. In addition, $integral D_B lt.double 1$ with a constant independent of $C_(*)$.]
] <lem:amp-divisor-moments>

We prove this lemma after reducing the actual divisor weight to an independent model and establishing the concentration estimate needed for its second moment. A single split supplies the positive mean. Two splits of the same prime sets govern the second moment.

Let $S_1 \, S_2$ be independent random subsets of $cal(P)$, each formed by including every prime $p$ independently with probability $1 \/ p$. Conditional on these sets, split each $S_nu$ by independent fair coins into a coefficient subset $cal(C)_nu$ and a remaining subset $cal(R)_nu$. Write

$ a = product_(p in cal(C)_1) p \, #h(2em) c = product_(p in cal(C)_2) p \, $

with empty products equal to one, and define

#[#set math.equation(numbering: n => "(4.5)")
 $ tilde(D)_B \( S_1 \, S_2 \) = B thin bb(E)_(upright("split")) [rho_0 (frac(log c, B)) psi (frac(a, T c)) upright(bold(1))_(upright("all four subsets are regular")) thin mid(bar.v) thin S_1 \, S_2] . $ <eq:13>]

In particular, $0 lt.eq tilde(D)_B lt.double B$ pointwise.

#thm([Lemma 4.2.])[
  (Reduction to independent fair splits).  #emph[For each fixed $C_(*) gt.eq 0$, as $B arrow.r oo$, 
$ integral_(hat(bb(Z))) D_B \( w \)^r thin d w = bb(E) tilde(D)_B^r + o \( 1 \) #h(2em) \( r = 1 \, 2 \) . $

]
] <lem:amp-site-model>

#proof[
  For Haar distributed $w$, let
  $ S_1 \( w \) = { p in cal(P) : p divides w } \, #h(2em) S_2 \( w \) = { p in cal(P) : p divides w + 1 } . $
  At each prime these are disjoint hits, each of probability $1 \/ p$. Their joint law differs by $O \( 1 \/ p^2 \)$ in total variation from two independent Bernoulli$\( 1 \/ p \)$ indicators. Independence across primes therefore couples them to the independent sets $S_1 \, S_2$ above, with total failure probability
  $ O (sum_(p > P_0) p^(- 2)) = O \( 1 \/ P_0 \) . $
  The probability that any $p in cal(P)$ has $p^2 divides w$ or $p^2 divides w + 1$ is also $O \( 1 \/ P_0 \)$.
  On the complement of these exceptional events, coefficient divisors are subset products of the corresponding site sets, and the prime set of each quotient is exactly the complementary subset. By (3.1), a divisor and its complement then have untruncated weight $B 2^(- \| S_nu \|)$. The truncated weight inserts exactly the regularity indicators for those two subsets. Summing the two fair splits shows that the value of (4.1) is precisely (4.5) on this successful coupling.
  We can discard the exceptional events in both moments. Any nonzero representation in (4.1) forces each entire site to have at most $\( 1 + 2 tau \) ell$ distinct primes, by the total regularity cutoffs for the coefficient and quotient. This remains true in the presence of squares: their two prime sets still cover the site’s distinct primes, although they need not be disjoint. Hence there are at most $2^(2 \( 1 + 2 tau \) ell)$ coefficient choices across the two sites. Combining this with (3.9) gives, for example, the uniform bound $D_B lt.double B^4$. Together with $tilde(D)_B lt.double B$, the coupling and site-square errors change its first two moments by at most $O \( B^8 \/ P_0 \) = o \( 1 \)$. This proves the comparison. ◻
]

=== 4.3 The two-split question and an addition-product estimate <the-two-split-question-and-an-addition-product-estimate>

The second moment of (4.5) involves two conditionally independent fair splits of the same two site sets. Denote their coefficient products by $\( a^(\( h \)) \, c^(\( h \)) \)$, $h = 1 \, 2$, and their coefficient and remaining prime sets by $cal(C)_nu^(\( h \)) \, cal(R)_nu^(\( h \))$, $nu = 1 \, 2$. Choose fixed closed intervals $I_(rho_0) subset \( 1 \, 2 \)$ and $I_psi subset \( 1 \, 2 \)$ containing the supports of $rho_0$ and $psi$, respectively. Let $cal(H)_h$ be the size-and-ratio event

$ frac(log c^(\( h \)), B) in I_(rho_0) \, #h(2em) frac(a^(\( h \)), T c^(\( h \))) in I_psi \, $

and let $cal(E)_h$ be $cal(H)_h$ together with regularity of its four subsets. Since the smooth weights are bounded and nonnegative,

#[#set math.equation(numbering: n => "(4.6)")
 $ bb(E) tilde(D)_B^2 lt.double B^2 bb(P) \( cal(E)_1 ∩ cal(E)_2 \) . $ <eq:amp-two-split-reduction>]

It therefore suffices to prove the global probability bound $bb(P) \( cal(E)_1 ∩ cal(E)_2 \) lt.double_(C_(*)) B^(- 2)$.

To prove this target, we will group the changes between the two splits by their largest logarithmic scale $Y$. A further unconditional coupling will replace the first coefficient and remaining classes by independent prime processes, with its error paid before conditioning. In that comparison model, the additions from a remaining set at primes with $log p lt.eq Y$ are independent selections with probabilities $1 \/ \( 4 p \)$, independent also of the data above $Y$. After fixing the retained coefficient primes and the additions at the other site, the second ratio window confines the logarithm of the recipient’s addition product to an interval of fixed length. A new prime with logarithm above $Y \/ 2$ also forces that product logarithm above $Y \/ 2$. The next estimate gives the resulting $O \( 1 \/ Y \)$ probability uniformly in the interval’s location. The second-moment proof will combine it with the retained first-remainder tail restrictions and the high assignment coins. The product itself need not be bounded by the largest allowed prime.

#thm([Lemma 4.3.])[
  (Addition-product concentration).  #emph[Fix $H > 0$. Write $L = log P_0$. For sufficiently large $B$, let $L lt.eq Y lt.eq 8 B$, put $U = min \( Y \, 4 B \)$, and form a random product $Q_Y$ by including each prime $P_0 < p lt.eq e^U$ independently with probability $1 \/ \( 4 p \)$. Uniformly over all intervals $J subset bb(R)$ of length at most $H$, 
$ bb(P) #scale(x: 120%, y: 120%)[\(] log Q_Y in J ∩ \[ Y \/ 2 \, oo \) #scale(x: 120%, y: 120%)[\)] lt.double_H 1 / Y . $

 The implicit constant is independent of $B$, $Y$, and $J$.]
] <lem:amp-small-ball>

#proof[
  If the intersection is empty there is nothing to prove. Otherwise enclose it in an interval $\[ v \, v + H \]$ with $v gt.eq Y \/ 2$, and set $X = e^v$. The probability of a squarefree product $n$ of the permitted primes is
  $ q_Y frac(w_Y \( n \), n) \, #h(2em) q_Y = product_(P_0 < p lt.eq e^U) (1 - frac(1, 4 p)) \, #h(2em) w_Y \( n \) = product_(p divides n) frac(1 \/ 4, 1 - 1 \/ \( 4 p \)) . $
  Set $w_Y \( n \) = 0$ for other integers. Since $Y \/ 2 lt.eq U lt.eq Y$ and $U gt.eq L$, Mertens’ estimate gives
  $ q_Y lt.double \( L \/ U \)^(1 \/ 4) lt.double \( L \/ Y \)^(1 \/ 4) \, #h(2em) q_Y lt.eq 1 . $
  Let $c_(upright(s)) > 0$ be an admissible exponent for the one-dimensional upper sieve of Section 3, with a remainder $O \( N^.8 \)$ on intervals of length $N$. Choose a fixed $c > 0$ sufficiently small that $c lt.eq 1 \/ 4$ and $2 c < c_(upright(s))$, and put $Z = e^(c Y)$. Then $Z lt.eq e^U$ and, since $X gt.eq e^(Y \/ 2)$, $Z lt.eq X^(c_(upright(s)))$. Dropping squarefreeness, the restriction on prime factors greater than $Z$, and the reducing weights above $Z$ majorizes $w_Y \( n \)$ by
  $ w \( n \) = product_(p lt.eq min \( P_0 \, Z \)) upright(bold(1))_(p divides.not n) product_(P_0 < p lt.eq Z) a_p^(upright(bold(1))_(p divides n)) \, #h(2em) a_p = frac(1, 4 - 1 \/ p) < 1 . $
  Apply the random-weight form of that sieve on an interval containing $\[ X \, e^H X \]$ and of length comparable to $X$, with constants depending only on $H$. It yields
  $ sum_(X lt.eq n lt.eq e^H X) w_Y \( n \) lt.double_H X cal(D) + X^.8 \, $
  where
  $ cal(D) = product_(p lt.eq min \( P_0 \, Z \)) \( 1 - 1 \/ p \) product_(P_0 < p lt.eq Z) (1 - frac(1 - a_p, p)) . $
  If $Z gt.eq P_0$, the relation $1 - a_p = 3 \/ 4 + O \( 1 \/ p \)$ and Mertens’ estimate imply
  $ cal(D) lt.double_c 1 / L (L / Y)^(3 \/ 4) . $
  Consequently $q_Y cal(D) lt.double_c 1 \/ Y$. If $Z < P_0$, ordinary rough exclusion instead gives $cal(D) lt.double 1 \/ log Z = 1 \/ \( c Y \)$, and the same conclusion follows from $q_Y lt.eq 1$. Finally,
  $ q_Y X^(- .2) lt.eq e^(- Y \/ 10) lt.double 1 / Y . $
  Using $1 \/ n lt.eq 1 \/ X$ on the summation interval proves
  $ bb(P) \( X lt.eq Q_Y lt.eq e^H X \) lt.eq q_Y / X sum_(X lt.eq n lt.eq e^H X) w_Y \( n \) lt.double_H 1 / Y \, $
  as required. ◻
]

=== 4.4 The first and second moments <the-first-and-second-moments>

#proof[
  By Lemma 18, it suffices to prove the asserted mean and second-moment bounds for $tilde(D)_B$.
  ===== 4.4.1 The first moment. <the-first-moment.>
  Without the regularity indicator in (4.5), the products $a \, c$ are independent and each has law $nu_(1 \/ 2)$. Let $f_B = f_(1 \/ 2 \, B)$ and $f \( s \) = c_(1 \/ 2) s^(- 1 \/ 2)$ on the compact positive log ranges under consideration. For fixed $s = log c \/ B$ on the support of $rho_0$, (3.3) and partial summation give, uniformly there,
  $ B thin bb(E)_a psi (frac(a, T c)) = integral_0^oo psi \( r \) f_B (s + frac(log T + log r, B)) frac(d r, r) + o \( 1 \) . $
  To justify the use of (3.3), the relevant interval in $log a \/ B$ has length $O \( 1 \/ B \)$; its absolute distribution-function error is $O \( B^(- 80) \)$, and partial summation against the smooth window, whose total variation is bounded, leaves an error $o \( 1 \/ B \)$ before the displayed multiplication by $B$. Since $log T \/ B arrow.r 0$ and $f_B$ converges uniformly with derivatives on these compact intervals, another application of (3.3) to $c$ shows that the untruncated first moment tends to
  $ d_(*) = (integral_0^oo rho_0 \( s \) f \( s \)^2 thin d s) (integral_0^oo psi \( r \) thin frac(d r, r)) > 0 . $
  The same calculation, or its upper-bound version for fixed intervals containing the supports, shows that the size-and-ratio event $cal(H)_1$ has probability $O \( 1 \/ B \)$ under the independent coefficient-product law.
  We next control the regularity losses in this normalization. Cover the coefficient support by $O \( B \)$ dyadic-size boxes $c asymp X$, $a asymp T X$. All their logarithmic scales lie in a fixed compact subinterval of the ranges for the arithmetic estimates. From (3.5), the joint product probability at $\( a \, c \)$ is bounded by
  $ C frac(A_0 \( a \) A_0 \( c \), B^2 a c) . $
  Within one such box $a c asymp T X^2$. The independent-coefficient version of (3.11) bounds the untruncated weighted sum where either coefficient is nonregular by
  $ O #scale(x: 120%, y: 120%)[\(] T X^2 { o \( 1 \) + e^(- c_3 C_(*)) } #scale(x: 120%, y: 120%)[\)] . $
  After the harmonic denominators, summing the $O \( B \)$ boxes, and multiplying by the $B$ in (4.5), the coefficient-regularity loss is therefore $o \( 1 \) + O \( e^(- c_3 C_(*)) \)$.
  Conditional on a selected coefficient subset at a site, the remaining indicators at primes not selected for that coefficient are independent, with probabilities
  $ frac(1 \/ \( 2 p \), 1 - 1 \/ \( 2 p \)) = frac(1, 2 p - 1) . $
  The selected coefficient primes have reciprocal sum $O \( B \/ P_0 \)$, uniformly on the coefficient support, because the logarithm of their product is $O \( B \)$. Thus the independent-indicator regularity estimate of Section 3 applies uniformly after these primes are omitted. The conditional chance of a remaining subset being nonregular is $o \( 1 \) + O \( e^(- c_3 C_(*)) \)$. Multiplying by the bounded smooth weights and the coefficient-event probability $O \( 1 \/ B \)$ shows that the remaining-subset loss in (4.5) is again $o \( 1 \) + O \( e^(- c_3 C_(*)) \)$ after its outside factor $B$.
  It follows that
  $ bb(E) tilde(D)_B = d_(*) + O \( e^(- c_3 C_(*)) \) + o \( 1 \) \, $
  where the error constant in the exponential term does not depend on $C_(*)$. This proves the asserted positive lower bound after choosing $C_0$ large, for instance with a fixed $d_0 < d_(*) \/ 2$ and then allowing the negligible coupling error. The upper bound $integral D_B lt.double 1$ follows by omitting all regularity indicators in the independent model. Both bounds can use constants independent of $C_(*)$. For the lower bound one may also note that increasing $C_(*)$ only relaxes the tail cutoffs.
  ===== 4.4.2 The second moment. <the-second-moment.>
  We use the two-split notation introduced before Lemma 19. By (4.6), the required bound is the global probability estimate stated there.
  Compare the two assignments of each site prime. If there is a change, its largest logarithm lies in one of the disjoint intervals $\( Y \/ 2 \, Y \]$, where
  $ Y = 2^i log P_0 \, #h(2em) 1 lt.eq i lt.eq i_max . $
  Here $4 B lt.eq 2^(i_max) log P_0 < 8 B$ for large $B$. Write $cal(A)_Y$ for the event that this is the largest changed interval. Every change in it is either a move from remaining to coefficient or a move in the reverse direction. The joint law and $cal(E)_1 ∩ cal(E)_2$ are invariant under exchanging the splits. Hence
  $ bb(P) \( cal(E)_1 ∩ cal(E)_2 ∩ cal(A)_Y \) lt.eq 2 sum_(nu = 1)^2 bb(P) \( cal(E)_1 ∩ cal(E)_2 ∩ cal(A)_Y ∩ cal(U)_(Y \, nu) \) \, $
  where $cal(U)_(Y \, nu)$ requires at least one prime at site $nu$ with logarithm in $\( Y \/ 2 \, Y \]$ to move from the first remaining set to the second coefficient set. This orientation inequality has been taken in the original symmetric two-split law.
  For the upper bound on its right side, couple the four first-split sets $cal(C)_nu^(\( 1 \)) \, cal(R)_nu^(\( 1 \))$ to four mutually independent prime processes, each with inclusion probabilities $1 \/ \( 2 p \)$. At a prime the two classes at one site were mutually exclusive, so the cost of this coupling is $O \( 1 \/ p^2 \)$, and the total cost is $O \( 1 \/ P_0 \)$. Assign independent fair second-split coins to each occurrence in these processes. On the successful, collision-free coupling this constructs exactly the original second split. On the exceptional event there may be two occurrences of a prime, for which we still assign independent coins and define coefficient products with multiplicity. This provides a convenient coupled model for upper bounds. Even if the coupling error is counted separately in every one of the $O \( log B \)$ intervals, its contribution after multiplication by $B^2$ is $O \( B^2 log B \/ P_0 \) = o \( 1 \)$. No uniform coupling assertion conditioned on a rare coefficient value is needed.
  Work now in that independent model. Its first coefficient products have independent $nu_(1 \/ 2)$ laws, so the first-moment calculation gives $bb(P) \( cal(H)_1 \) = O \( 1 \/ B \)$. Fix first coefficient sets satisfying $cal(H)_1$ and the first coefficient regularity conditions. For each term on the oriented right side, we will retain the needed first-remainder restrictions while bounding its second ratio condition. The sum of these conditional bounds over the changed scales, together with the no-change contribution, must be $O_(C_(*)) \( 1 \/ B \)$ uniformly in the fixed coefficient sets. The orientation factor and coupling error remain outside this conditional calculation.
  For a prime set $S$ let $N_S \( > Y \) = \# { p in S : log p > Y }$, and put
  $ q \( Y \) = .4 log \( B \/ Y \) - C_(*) . $
  The first coefficient tail cutoffs give $N_(cal(C)_nu^(\( 1 \))) \( > Y \) gt.eq q \( Y \)$. Expose the first remaining sets above $Y$, and retain the two necessary tail restrictions $N_(cal(R)_nu^(\( 1 \))) \( > Y \) gt.eq q \( Y \)$. Conditional on all these first high-prime sets, the chance that none of their second assignments changes is exactly
  $ 2^(- sum_(nu = 1)^2 { N_(cal(C)_nu^(\( 1 \))) \( > Y \) + N_(cal(R)_nu^(\( 1 \))) \( > Y \) }) . $
  On the retained restrictions this is at most
  $ 2^(- 4 q \( Y \)) = 2^(4 C_(*)) \( Y \/ B \)^(alpha_0) \, #h(2em) alpha_0 = 1.6 log 2 > 1 . $
  If $q \( Y \) < 0$ this upper bound exceeds one, which remains a valid bound. Averaging over the first remaining high-prime sets does not increase it.
  All first remaining restrictions below $Y$ may now be omitted. For each site, a prime below this threshold is newly added to the second coefficient exactly when it lies in the independent first remaining process and its second coin selects the coefficient. These new-addition indicators are independent and have probabilities $1 \/ \( 4 p \)$. The new additions at the two sites are independent of one another, of the first coefficient sets and their second coins, and of all the exposed variables above $Y$.
  Fix a recipient site $nu$. Condition on the retained first-coefficient primes at both sites and on the additions at the other site. The second ratio condition in $cal(H)_2$ then restricts the logarithm of the addition product at site $nu$ to an interval of length at most
  $ H_psi = log (frac(sup I_psi, inf I_psi)) . $
  For example, for recipient site 1 the second coefficient products have the form $a^(\( 2 \)) = a_(upright("ret")) b_(upright("new"))$ and $c^(\( 2 \)) = c_(upright("ret")) c_(upright("new"))$, and solving $a^(\( 2 \)) \/ \( T c^(\( 2 \)) \) in I_psi$ gives precisely such an interval for $log b_(upright("new"))$. The same calculation with the inequality inverted applies at site 2. On $cal(U)_(Y \, nu)$ there is a new prime with logarithm greater than $Y \/ 2$, so this addition product also has logarithm at least $Y \/ 2$. There are no new additions above $Y$ on $cal(A)_Y$.
  We can drop the second coefficient size restriction and all second regularity restrictions for this upper bound. Lemma 19 then bounds the conditional chance of the remaining addition-product conditions by $O \( 1 \/ Y \)$, uniformly in every value on which we have conditioned. To make the conditioning order explicit, write $cal(C)$ for the fixed first coefficient sets, $G_Y$ for the retained first remaining tail restrictions, and $H_Y$ for the event of no change above $Y$. Let $cal(F)$ include $cal(C)$ and reveal all second coins of the first coefficient sets, all first remaining data and second coins above $Y$, and the additions at the other site. The recipient addition product $Q_nu$ below $Y$ is independent of this information, and the ratio condition specifies an $cal(F)$-measurable interval $J \( cal(F) \)$. For the oriented event under consideration, the tower property gives
  $ & bb(P) \( upright("oriented event") divides cal(C) \)\
 & quad lt.eq bb(E) #h(-0.16667em) [upright(bold(1))_(G_Y) upright(bold(1))_(H_Y) bb(P) #h(-0.16667em) (log Q_nu in J \( cal(F) \) ∩ \[ Y \/ 2 \, oo \) divides cal(F)) thin mid(bar.v) thin cal(C)]\
 & quad lt.double 1 / Y bb(E) \[ upright(bold(1))_(G_Y) upright(bold(1))_(H_Y) divides cal(C) \] lt.eq 2^(- 4 q \( Y \)) / Y . $
  In the last step the high second coins are averaged after the uniform small-ball bound is applied; no conditional bound on $bb(P) \( H_Y divides cal(F) \)$ is asserted. Thus, conditional on any good first coefficient sets, the contribution for this orientation at scale $Y$ is at most
  $ O_(C_(*)) (frac(\( Y \/ B \)^(alpha_0), Y)) . $
  The constants here may depend on the fixed $C_(*)$, but not on the first coefficient sets, $B$, or $Y$.
  If there is no change at all, use the tail cutoff at $Y = log P_0$. All four first subsets then have at least $.4 log R - C_(*)$ primes. The same calculation bounds the conditional probability, retaining the first remaining tail restrictions, by
  $ O_(C_(*)) \( R^(- alpha_0) \) . $
  The dyadic scales satisfy
  $ sum_Y frac(\( Y \/ B \)^(alpha_0), Y) = B^(- alpha_0) sum_Y Y^(alpha_0 - 1) lt.double 1 / B \, $
  because $alpha_0 > 1$ and the largest $Y$ is less than $8 B$. Moreover,
  $ B R^(- alpha_0) = B^(1 - alpha_0) \( 1000 log B \)^(alpha_0) arrow.r 0 . $
  Requiring first coefficient regularity only decreases the $O \( 1 \/ B \)$ mass of $cal(H)_1$ established above. Combining the preceding bounds, including the orientation factor and the coupling errors, gives
  $ bb(P) \( cal(E)_1 ∩ cal(E)_2 \) lt.double_(C_(*)) 1 / B (1 / B + R^(- alpha_0)) + O \( log B \/ P_0 \) lt.double_(C_(*)) 1 / B^2 + O \( log B \/ P_0 \) . $
  Multiplication by $B^2$ proves $bb(E) tilde(D)_B^2 lt.double_(C_(*)) 1$. Lemma 18 transfers these bounds to the Haar divisor weight and completes the proof of (4.4). ◻
]

=== 4.5 The correlation survives the divisor weights <the-correlation-survives-the-divisor-weights>

#thm([Lemma 4.4.])[
  (Preservation of the profinite profile).  #emph[For each fixed $C_(*) gt.eq C_0$, put $H \( t \, w \) = phi.alt \( t \) W \( t \, w \)$. Then 
#[#set math.equation(numbering: n => "(4.7)")
 $ integral H \( t \, w \) D_B \( w \) thin d t thin d w - (integral H thin d t thin d w) (integral D_B thin d w) arrow.r 0 #h(2em) \( B arrow.r oo \) . $ <eq:amp-preservation>]

]
] <lem:preservation>

#proof[
  The function $H$ is bounded and supported on a fixed compact interval in $t$, so it is square-integrable. Conditional expectations with respect to $t$ and a finite residue coordinate $w med mod med q$ approximate $H$ in $L^2$ as these residue coordinates increase. Equivalently, for every $epsilon > 0$ there is a function $H_q \( t \, w \)$ depending only on $t$ and $w med mod med q$ such that
  $ parallel H - H_q parallel_2 < epsilon \, #h(2em) integral H_q thin d t thin d w = integral H thin d t thin d w . $
  This follows, for example, by first approximating in the dense space of finite sums of products of $L^2$ functions of $t$ and locally constant functions of $w$, and then taking conditional expectation.
  For all sufficiently large $B$, no prime dividing $q$ belongs to $cal(P)$. The finite-residue function $D_B$ is therefore independent of $w med mod med q$ under Haar measure. Consequently
  $ integral H_q \( t \, w \) D_B \( w \) thin d t thin d w = (integral H thin d t thin d w) (integral D_B thin d w) . $
  By Cauchy–Schwarz and (4.4), the error on replacing $H_q$ by $H$ is $O_(C_(*)) \( epsilon \)$, uniformly in large $B$; the length of the fixed $t$-support is absorbed in the constant. Since $epsilon$ is arbitrary, this proves (4.7). ◻
]

The factor $integral D_B thin d w$ in (4.7) is real, nonnegative, and at least $d_0$ eventually. Taking complex absolute values in (4.3) and using (4.7) therefore gives

#[#set math.equation(numbering: n => "(4.8)")
 $ liminf_(B arrow.r oo) med lim_(x arrow.r oo) frac(\| I_(1 \, x) \|, B) gt.eq d_0 beta_(*) . $ <eq:14>]

The possible dependence of the $L^2$ constant on $C_(*)$ is harmless: this approximation is performed with $C_(*)$ fixed, and the positive lower constant in (4.8) is independent of it.

=== 4.6 A positive quadratic energy and its diagonal <a-positive-quadratic-energy-and-its-diagonal>

The preserved correlation now has an expansion suited to Cauchy–Schwarz. For $c divides a m + 1$, put $l_a = \( a m + 1 \) \/ c$. At fixed $B$, the coefficient list in (4.1) is finite. Thus $g_x \( a m \) = g_x \( m \)$ holds simultaneously for every coefficient $a$ on that list once $x$ is sufficiently large, by (2.6). Expanding (4.2), writing $n = a m$, and using this fixed-multiplier invariance gives the exact identity

#[#set math.equation(numbering: n => "(4.9)")
 $ I_(1 \, x) = 1 / x sum_(c gt.eq 1) rho_0 (frac(log c, B)) A \( c \) sum_(m gt.eq 1) K \( m \) overline(g_x \( m \)) sum_(a gt.eq 1\
c divides a m + 1) A \( a \) K \( l_a \) psi (frac(a, T c)) phi.alt (frac(a m, x)) F_x \( a m + 1 \) . $ <eq:10>]

The values of $F_x$ are unchanged in this reindexing. The expanded form places $g_x \( m \)$ outside the inner sum, where $\| g_x \( m \) \| = 1$ supplies the unit factor in Cauchy–Schwarz.

#thm([Proposition 4.5.])[
  #emph[There is $c_5 > 0$, independent of all sufficiently large fixed $C_(*)$, for which the nonnegative energy below satisfies the displayed lower bound: 
#[#set math.equation(numbering: n => "(4.10)")
 $ I_(2 \, x) = 1 / x sum_(c gt.eq 1) rho_0 \( log c \/ B \) A \( c \) sum_(m gt.eq 1) K \( m \) lr(|sum_(a gt.eq 1\
c divides a m + 1) A \( a \) K \( l_a \) psi \( a \/ \( T c \) \) phi.alt \( a m \/ x \) F_x \( a m + 1 \)|)^2 \,\
liminf_(B arrow.r oo) med liminf_(x arrow.r oo) frac(I_(2 \, x), B T) gt.eq c_5 $ <eq:15>]

 Its diagonal contribution is negligible: 
$ lim_(B arrow.r oo) med limsup_(x arrow.r oo) frac(I_(2 \, x)^(upright("diag")), B T) = 0 . $

 Here $I_(2 \, x)^(upright("diag"))$ denotes the terms with equal coefficient indices on expanding the square, and $l_a = \( a m + 1 \) \/ c$ as in (4.9).]
] <prop:amp-energy>

#proof[
  Choose $0 < alpha_phi.alt < beta_phi.alt < oo$ with $"supp" phi.alt subset \[ alpha_phi.alt \, beta_phi.alt \]$, and write $u_(-) = inf I_psi$, $u_(+) = sup I_psi$. If the inner sum in (4.9) is nonzero, then
  $ frac(alpha_phi.alt x, u_(+) T c) lt.eq m lt.eq frac(beta_phi.alt x, u_(-) T c) . $
  Let $cal(I)_(c \, x)$ denote this interval. Use the nonnegative weights $x^(- 1) rho_0 \( log c \/ B \) A \( c \) K \( m \)$ on this interval. Cauchy–Schwarz gives
  $ \| I_(1 \, x) \|^2 lt.eq V_(B \, x) I_(2 \, x) \, #h(2em) V_(B \, x) = 1 / x sum_c rho_0 (frac(log c, B)) A \( c \) sum_(m in cal(I)_(c \, x)) K \( m \) \, $
  where $\| g_x \( m \) \| = 1$ supplies the unit factor. No multiplicativity of the centered function $F_x$ is needed.
  For fixed $B$, the weight $K_0$ is periodic and has mean
  $ integral_(hat(bb(Z))) K_0 \( w \) thin d w = R^(1 \/ 2) product_(p in cal(P)) (1 - frac(1, 2 p)) lt.double 1 . $
  Progression counting, $K lt.eq K_0$, and the length of $cal(I)_(c \, x)$ therefore imply
  $ limsup_(x arrow.r oo) V_(B \, x) lt.double 1 / T sum_c rho_0 (frac(log c, B)) frac(A_0 \( c \), c) lt.double B / T . $
  For the last bound, partition the compact log support of $rho_0$ into $O \( B \)$ dyadic-size boxes and apply (3.6) in each box. Thus we may fix $C_4 > 0$, independently of $C_(*)$, such that
  $ limsup_(x arrow.r oo) V_(B \, x) lt.eq C_4 B \/ T $
  for all sufficiently large $B$. Combining this with (4.8) proves (4.10), with any fixed
  $ 0 < c_5 < frac(\( d_0 beta_(*) \)^2, C_4) . $
  This makes the uniformity of the positive lower constant explicit.
  For the diagonal, set
  $ Q_B = sup A \( a \) K \( l \) \, $
  where $a$ ranges over the coefficient support and $l$ over positive integers for which the truncated weights are nonzero. The total-count cutoff and (3.9) give
  $ Q_B lt.double B^(2 \( h_0 + tau log 2 \) + o \( 1 \)) = o \( T \) \, $
  using the strict inequality $2 \( h_0 + tau log 2 \) < .32$. Since all smooth weights here are nonnegative,
  $ psi \( a \/ \( T c \) \)^2 phi.alt \( a m \/ x \)^2 lt.eq parallel psi parallel_oo parallel phi.alt parallel_oo psi \( a \/ \( T c \) \) phi.alt \( a m \/ x \) . $
  Bounding one of the two factors $A \( a \) K \( l_a \)$ by $Q_B$ and $\| F_x \( a m + 1 \) \|^2$ by 4 yields
  $ I_(2 \, x)^(upright("diag")) lt.double Q_B thin cal(J)_(B \, x) \, $
  where
  $ cal(J)_(B \, x) = 1 / x sum_c rho_0 (frac(log c, B)) A \( c \) sum_(m gt.eq 1) K \( m \) sum_(a gt.eq 1\
c divides a m + 1) A \( a \) K \( l_a \) psi (frac(a, T c)) phi.alt (frac(a m, x)) . $
  The same divisor reindexing as before gives
  $ cal(J)_(B \, x) = B / x sum_(n gt.eq 1) phi.alt \( n \/ x \) D_B \( n \) . $
  Here no label is present, so finite progression counting directly gives
  $ lim_(x arrow.r oo) cal(J)_(B \, x) = B (integral_0^oo phi.alt \( t \) thin d t) (integral_(hat(bb(Z))) D_B \( w \) thin d w) lt.double B $
  by the first-moment upper bound in Lemma 17. It follows that
  $ limsup_(x arrow.r oo) frac(I_(2 \, x)^(upright("diag")), B T) lt.double Q_B / T arrow.r 0 \, $
  which completes the proof. ◻
]

== 5 From mixed amplification to an independent-site kernel <sec:graph>

The mixed amplification has eliminated the unit-modulus label $g_x$ by Cauchy–Schwarz. Its positive square $I_(2 \, x)$ contains only the centered label $F_x$. We first turn its off-diagonal terms into edges between integers at small additive distance. We then separate the residue data at the endpoints from the additional residue data in each representation of an edge. Throughout this section, all parameters other than $B$ and $x$ are fixed; $x$ tends to infinity first. Constants are uniform when the smooth scale variable belongs to the compact range specified below.

=== 5.1 The change of variables <the-change-of-variables>

Consider distinct coefficients $a \, b$ in the inner square defining $I_(2 \, x)$, for fixed $m \, c$, and put $l_a = \( a m + 1 \) \/ c$ and $l_b = \( b m + 1 \) \/ c$. The congruences imply that $m$ is a unit modulo $c$ and that

$ a - b = j c \, #h(2em) 0 < \| j \| lt.eq T . $

They also imply $\( a \, c \) = \( b \, c \) = 1$. Since $a \, b$ are rough and $\| j \| lt.eq T < P_0$, we have $\( a \, j \) = \( b \, j \) = 1$, and hence $\( a \, b \) = 1$. For the ordered term in which the $a$-factor is conjugated, set

$ n' = b l_a \, #h(2em) n' + j = a l_b . $

For these fixed coefficients, this is a bijective reindexing by the conditions $b divides n'$ and $a divides n' + j$. Indeed, write $n' = b z$. The latter congruence, together with $b = a - j c$, gives $j \( 1 - c z \) equiv 0 med \( mod med a \)$. Thus

$ m = frac(c z - 1, a) $

is an integer, and substitution recovers both original congruences and both displayed identities. Positive compact scale supports ensure all arguments are positive for large $x$.

Figure 1 records the two fixed multiplications that produce the additive shift. Only fixed-multiplier invariance is used; the centered function $F_x$ need not be multiplicative.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#text(size: 9pt)[$l_a=("am"+1)"/"c$]])
  content((0, -1.5), [#text(size: 9pt)[$l_b=("bm"+1)"/"c$]])
  content((5, 0), [#text(size: 9pt)[$n'="bl"_a$]])
  content((5, -1.5), [#text(size: 9pt)[$n'+j="al"_b$]])
  line((0.9739, 0), (4.423, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((2.5, 0), [#text(size: 9pt)[$times b$]], anchor: "south", padding: 0.1176cm)
  line((0.9739, -1.5), (4.264, -1.5), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((2.5, -1.5), [#text(size: 9pt)[$times a$]], anchor: "north", padding: 0.1176cm)
  line((5, -0.2678), (5, -1.225), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((5, -0.75), [#text(size: 9pt)[$+j$]], anchor: "west", padding: 0.1176cm)
  content((2.5, -0.75), [#text(size: 9pt)[$a-b="jc"$]])
})],
  caption: [Figure 1: The exact reindexing of two divisor representations. The coefficient identity makes the new endpoints differ by $j$, while fixed-multiplier invariance preserves their centered labels. ],
) <fig:graph-reindexing>

For fixed $B$, the coefficient supports are finite, so (2.6) applies simultaneously to the multipliers $c \, b \, a$ once $x$ is sufficiently large. Removing $c$ and then inserting $b \, a$ gives

$ overline(F_x \( a m + 1 \)) F_x \( b m + 1 \) = overline(F_x \( l_a \)) F_x \( l_b \) = overline(F_x \( n' \)) F_x \( n' + j \) . $

Define

$ Psi_s \( u_1 \, u_2 \) = psi \( u_1 \) psi \( u_2 \) phi.alt \( s \/ u_1 \) phi.alt \( s \/ u_2 \) . $

If $s = n' \/ \( T x \)$, $u_1 = a \/ \( T c \)$ and $u_2 = b \/ \( T c \)$, then

$ s \/ u_1 = b m \/ x + b \/ \( a x \) \, #h(2em) s \/ u_2 = a m \/ x + 1 \/ x . $

The two original $phi.alt$-arguments are therefore interchanged, with errors $O_B \( 1 \/ x \)$. Since they occur as a product, their replacement by $Psi_s$ has vanishing error for fixed $B$. There is a fixed compact interval $cal(S) subset \( 0 \, oo \)$ outside which $Psi_s$ vanishes on the coefficient supports. It depends only on $phi.alt \, psi$.

Consequently, the off-diagonal part of $I_(2 \, x) \/ \( B T \)$ is, up to $o_x \( 1 \)$,

#[#set math.equation(numbering: n => "(5.1)")
 $ frac(1, T x) sum_(n') sum_(0 < \| j \| lt.eq T) overline(F_x \( n' \)) F_x \( n' + j \) cal(K)_j \( n' \, n' \/ \( T x \) \) \, $ <eq:16>]

where, for $u in hat(bb(Z))$,

#[#set math.equation(numbering: n => "(5.2)")
 $ cal(K)_j \( u \, s \) = 1 / B sum_(a - b = j c \, med \( a \, b \) = \( a \, c \) = \( b \, c \) = 1\
b divides u \, med a divides u + j) & A \( a \) A \( b \) A \( c \) K \( u \/ b \) K \( \( u + j \) \/ a \)\
 & quad dot.op K #h(-0.16667em) (frac(c \( u \/ b \) - 1, a)) rho_0 \( log c \/ B \) Psi_s \( a \/ \( T c \) \, b \/ \( T c \) \) . $ <eq:17>]

All coefficient variables are positive integers. Divisibility in $hat(bb(Z))$ means membership in the image of multiplication by the divisor; that multiplication is injective. The preceding congruence calculation also proves that every quotient in (5.2) is defined on its summation domain. This kernel is nonnegative, depends on finitely many prime-power residues, and satisfies

$ cal(K)_j \( u \, s \) = cal(K)_(- j) \( u + j \, s \) . $

For this last identity, exchange $a \, b$: the last quotient is unchanged because $c \( u + j \) - a = c u - b$.

#thm([Lemma 5.1.])[
  (Mean edge mass).  #emph[Uniformly for $0 < \| j \| lt.eq T$ and $s in cal(S)$, 
#[#set math.equation(numbering: n => "(5.3)")
 $ bb(E)_(u in hat(bb(Z))) cal(K)_j \( u \, s \) lt.double frac(Sigma \( j \), T) . $ <eq:18>]

 The implied constant can be independent of the regularity parameter $C_(*)$.]
] <lem:graph-edge-mass>

#proof[
  Replace all truncated weights by their untruncated majorants. For fixed pairwise coprime $a \, b \, c$, the two endpoint congruences have Haar probability $1 \/ \( a b \)$. At a prime $p in cal(P)$ not dividing $a b c$, the three residue weights have distinct zero classes $0 \, - j \, b \/ c$ for $u$. Here $p > \| j \|$, and $b \/ c equiv.not - j med \( mod med p \)$ follows from $a = b + j c$. Their local mean is $1 - 3 \/ \( 2 p \)$. At primes dividing $a b c$ discard the local reducing factors; this changes the Euler-product bound by at most $exp \( O \( sum_(p divides a b c) 1 \/ p \) \) = O \( 1 \)$, since that sum is $O \( B \/ P_0 \)$. Independence over primes and Mertens’ formula give
  $ R^(3 \/ 2) product_(p in cal(P)) \( 1 - 3 \/ \( 2 p \) \) lt.double 1 . $
  On a dyadic box $c asymp X$, the denominator is $a b asymp T^2 X^2$. The three-form estimate (3.8) bounds its contribution before the factor $1 \/ B$ by $O \( Sigma \( j \) \/ T \)$. There are $O \( B \)$ boxes. This proves the assertion using only untruncated upper bounds. ◻
]

=== 5.2 Blocks and the norm used for comparison <blocks-and-the-norm-used-for-comparison>

Fix $0 < eta < 1$ and $C_6 > 1$, and set $M = ceil.l C_6 T ceil.r$. Removing the lags $\| j \| < eta T$ in (5.1) costs $O \( eta \) + o_x \( 1 \)$ in absolute upper limit, by Lemma 22 and the bounded ordinary averages of $Sigma$. Average the origins over $i = 1 \, dots.h \, M$, writing $n' = n + i$. For fixed $B$, replacing $\( n + i \) \/ \( T x \)$ by $n \/ \( T x \)$ has vanishing error. At lag $j$, the fraction of $i$ for which $k = i + j in.not \[ 1 \, M \]$ is at most $\| j \| \/ M$. The total cost of these endpoints is $O \( T \/ M \) = O \( 1 \/ C_6 \)$. The remaining expression is

#[#set math.equation(numbering: n => "(5.4)")
 $ cal(Q)_(B \, x)^(upright("arith")) := frac(1, T x) sum_n 1 / M sum_(1 lt.eq i \, k lt.eq M\
eta T lt.eq \| k - i \| lt.eq T) overline(F_x \( n + i \)) F_x \( n + k \) cal(K)_(k - i) \( n + i \, n \/ \( T x \) \) . $ <eq:19>]

Thus (4.10) and the diagonal estimate give a positive lower bound for the iterated lower limit of (5.4), once $eta$ is small enough and $C_6$ is large enough. These choices are made after $C_(*)$ and before letting $B$ grow.

Call a pair $\( i \, k \)$ #emph[allowed] if $1 lt.eq i \, k lt.eq M$ and $eta T lt.eq \| k - i \| lt.eq T$. All matrices below are zero on other pairs. For a real matrix $H$, define

#[#set math.equation(numbering: n => "(5.5)")
 $ parallel H parallel_square.stroked.tiny = 1 / M max_(epsilon.alt \, delta in { - 1 \, 1 }^M) lr(|sum_(i \, k) H_(i k) epsilon.alt_i delta_k|) . $ <eq:graph-cutnorm>]

The same maximum results from allowing real test coordinates in $\[ - 1 \, 1 \]$. Splitting real and imaginary parts shows that for complex $z_i$ with $\| z_i \| lt.eq 2$,

#[#set math.equation(numbering: n => "(5.6)")
 $ lr(|1 / M sum_(i \, k) H_(i k) overline(z_i) z_k|) lt.eq 16 parallel H parallel_square.stroked.tiny . $ <eq:graph-cut-labels>]

For fixed $B$, a matrix whose entries are finite-residue functions continuous in $s$ has the same property after taking this finite maximum. Its ordinary scale averages converge to its Haar-product integral. Therefore bounds on the Haar expectation of the norm, uniformly for $s in cal(S)$, control errors in (5.4). This comparison is deterministic in the labels; it requires no independence between the labels and the residue data.

=== 5.3 Endpoint types and candidate representations <endpoint-types-and-candidate-representations>

The block energy is now expressed in the norm that will control its approximation. We next separate the prime-divisibility data at the endpoints from the additional residue data belonging to each edge representation.

Put $S_i \( u \) = { p in cal(P) : p divides u + i }$. We compare them with independent sets $S_i$, each formed by independently including every $p in cal(P)$ with probability $1 \/ p$. At a fixed $p > P_0 > M$, the actual law has disjoint hits of probability $1 \/ p$ at each site. Its total variation distance from independent hits is $O \( M^2 \/ p^2 \)$. Consequently the joint site laws can be coupled with failure probability $O \( M^2 \/ P_0 \)$. Also

#[#set math.equation(numbering: n => "(5.7)")
 $ bb(P) { p^2 divides u + i upright(" for some ") p in cal(P) \, med i lt.eq M } lt.double M \/ P_0 . $ <eq:graph-site-squares>]

For an allowed pair $i \, k = i + j$ with $j > 0$, a #emph[candidate] consists of a subset product $b$ of $S_i$, a subset product $a$ of $S_k$, and the positive integer $c = \( a - b \) \/ j$. Require pairwise coprimality, rough squarefreeness, all three coefficient regularity conditions, and regularity of the two remaining sets $S_i \\ b$ and $S_k \\ a$. Here $S \\ b$ means removal of the primes dividing $b$. It is harmless to use the closed support windows

$ B lt.eq log c lt.eq 2 B \, #h(2em) T c lt.eq a \, b lt.eq 2 T c \; $

the smooth factors still impose the original supports. A reversed ordered pair refers to the same candidate.

A contributing endpoint has at most $\( 1 + 2 tau \) ell$ primes. There are at most $2^(2 \( 1 + 2 tau \) ell)$ subset choices at a pair, so the number of candidates in the entire block is $O \( B^4 \)$. This rough bound also applies to representations that contribute to (5.2) in the presence of site squares: the union of the coefficient and quotient prime sets covers the site’s distinct primes, and their total-count restrictions give the same bound. Together with (3.9), this gives, for example, a deterministic $O \( B^10 \)$ bound for all total matrix masses used below. This bound allows small-probability errors to be discarded before sharper mean estimates are available.

Set $k_B = bb(E)_S K \( S \)$ under the independent $1 \/ p$ law. The untruncated Euler product gives $k_B lt.double 1$. Define the latent kernel

#[#set math.equation(numbering: n => "(5.8)")
 $ cal(L)_(i k) \( S_i \, S_k \; s \) = k_B / B sum_(upright("candidates")) & A \( a \) A \( b \) A \( c \) K \( S_i \\ b \) K \( S_k \\ a \)\
 & quad dot.op rho_0 \( log c \/ B \) Psi_s \( a \/ \( T c \) \, b \/ \( T c \) \) \, $ <eq:20>]

and extend it by symmetry and by zero on nonpairs. For actual endpoint sets without site squares, the terms allowed by the smooth factors have the same coefficient representations in (5.2) and (5.8), and the two endpoint quotient prime sets are the complementary sets displayed in (5.8). The latter kernel keeps these terms and replaces the remaining factor $K \( m \)$ by its independent mean $k_B$.

#thm([Lemma 5.2.])[
  (Uniform conditional means).  #emph[For every possible endpoint type $S_i$, not merely almost every typical type, and every allowed lag $j = k - i$, 
#[#set math.equation(numbering: n => "(5.9)")
 $ bb(E)_(S_k) cal(L)_(i k) \( S_i \, S_k \; s \) lt.double frac(Sigma \( j \), T) . $ <eq:23>]

 In particular, every conditional expected degree is $O \( 1 \)$, and $bb(E) sum_(i \, k) cal(L)_(i k) = O \( M \)$.]
] <lem:graph-row-mean>

#proof[
  For an admissible fair split $b$ at the first endpoint, $A \( b \) K \( S_i \\ b \) = B 2^(- \| S_i \|)$. At the other endpoint, the analogous identity and then averaging over its site set give the split-product law $nu_(1 \/ 2)$. By (3.5), its mass at $a$ is at most $C A_0 \( a \) \/ \( B a \)$. Dropping all remaining restrictions for an upper bound yields
  $ bb(E)_(S_k) cal(L)_(i k) \( S_i \, S_k \; s \) & lt.double bb(E)_(b divides S_i \, thin upright("split")) upright(bold(1))_({ b upright(" in the possible range") }) sum_(c asymp b \/ T \, med a = b + j c asymp b\
B lt.eq log c lt.eq 2 B) frac(A_0 \( c \) A_0 \( a \), a)\
 & lt.double frac(Sigma \( j \), T) bb(E)_(b divides S_i \, thin upright("split")) upright(bold(1))_({ b upright(" in the possible range") }) lt.eq C frac(Sigma \( j \), T) \, $
  using (3.7). This is a restricted expectation of mass at most one, with no division by its probability. If the fixed type has no admissible split, its kernel is zero. The same estimate with signed lag reversed handles either endpoint. Summing the bounded averages of $Sigma$ proves the degree assertions. ◻
]

=== 5.4 Separating the auxiliary roots <separating-the-auxiliary-roots>

The following comparison justifies this averaging in expected cut norm, uniformly against a proposed endpoint kernel. It is stronger than an estimate against any one predetermined pair of tests.

#thm([Proposition 5.3.])[
  (Independent-root comparison).  #emph[Let $cal(M)_(i k) \( S_i \, S_k \; s \)$ be a symmetric real kernel, zero on nonpairs, with total absolute mass $O \( B^10 \)$ uniformly in its arguments. Then 
#[#set math.equation(numbering: n => "(5.10)")
 $ & bb(E)_u ∥#scale(x: 120%, y: 120%)[\(] cal(K)_(k - i) \( u + i \, s \) - cal(M)_(i k) \( S_i \( u \) \, S_k \( u \) \; s \) #scale(x: 120%, y: 120%)[\)]_(i \, k)∥_square.stroked.tiny\
 & #h(14.944pt)  lt.eq o \( 1 \) + bb(E)_(\( S_i \) thin upright("indep")) ∥#scale(x: 120%, y: 120%)[\(] cal(L)_(i k) \( S_i \, S_k \; s \) - cal(M)_(i k) \( S_i \, S_k \; s \) #scale(x: 120%, y: 120%)[\)]_(i \, k)∥_square.stroked.tiny . $ <eq:21>]

 The error is uniform for $s in cal(S)$.]
] <prop:graph-root-comparison>

#proof[
  In the absence of site squares, quotient prime sets at the endpoints equal the complementary sets used in (5.8). For a candidate at $i \, k = i + j$, the remaining argument in (5.2) is
  #[#set math.equation(numbering: n => "(5.11)")
   $ m = frac(c \( u + i \) - b, a b) = frac(c, a b) \( u - r \) \, #h(2em) r = b \/ c - i = a \/ c - k . $ <eq:22>]
  We show that, at a negligible total error, the set of primes dividing this argument can be replaced for each unordered candidate by an independent $1 \/ p$ set, independent of the site sets and of the other candidates’ extra sets. The following argument first bounds two obstructions determined by the endpoint sets: coincident rational roots and a root forced to hit a third occupied site. It then fixes a surviving actual site configuration and couples the remaining prime tests, without conditioning on absence of site squares. The site-square event is paid for in the matrix weights, and the final step controls the independent extra-weight fluctuations in cut norm.
  ===== 5.4.1 Coincident rational roots. <coincident-rational-roots.>
  Since $b \/ c$ is reduced, equal $r$ for two candidates forces the same denominator $c$. Given $r \, c$, the coefficient at any position $s'$ is fixed, namely $b + \( s' - i \) c$. On the same pair this determines the candidate uniquely. Any other unordered pair with this root uses at least a third position with a prescribed positive coefficient at least $T c$. Conditional on the first two independent site sets, that coefficient is available at the third site with probability at most $1 \/ \( T c \)$: it has probability zero unless it is a squarefree product of $cal(P)$ primes, and otherwise the probability is its reciprocal. The polynomial candidate and position bounds, and $c gt.eq e^B$, make the union of these events negligible. The site coupling transfers the conclusion to the actual model.
  ===== 5.4.2 Forced hits at a third endpoint. <forced-hits-at-a-third-endpoint.>
  Also discard the event that, for some candidate and $s' eq.not i \, k$, an occupied prime $p$ at site $s'$ satisfies $p divides.not a b c$ and $r equiv - s' med \( mod med p \)$. In the independent-site model, condition on the candidate’s two endpoint sets. Such a prime divides $b + \( s' - i \) c$, a nonzero integer of logarithmic size $O \( B \)$. It is nonzero because $c > 1$ and $\( b \, c \) = 1$. For any nonzero integer of logarithmic size $O \( B \)$, the sum of reciprocals of its prime divisors above $P_0$ is $O \( B \/ P_0 \)$. Thus the conditional union probability is $O \( B \/ P_0 \)$ per candidate and third position. A polynomial union bound and the site coupling again suffice.
  ===== 5.4.3 Coefficient primes and occupied primes. <coefficient-primes-and-occupied-primes.>
  The two structural exclusions above depend only on the endpoint sets, and their actual-law probabilities have been bounded through the site coupling. Fix an actual site configuration avoiding them; its hits at each prime are disjoint. We still do not condition on absence of site squares. At an unoccupied prime, $u med mod med p$ is uniform outside the $M$ forbidden classes $- 1 \, dots.h \, - M$. At an occupied prime, its residue is fixed and the higher $p$-adic digits remain uniform. These conditional laws are independent over primes.
  If $p divides a b$, then the coefficients are squarefree and pairwise coprime, and the test $p divides m$ in (5.11) has conditional probability $1 \/ p$, determined by the next digit. If $p divides c$, it is impossible. Set these exceptional tests to zero temporarily, in both the actual model and the independent comparison model. The total error per candidate is $O \( B \/ P_0 \)$. This use of uniform higher digits is made before removing site-square events from the weights; we do not condition those digits on absence of squares.
  At $p divides.not a b c$, the root test is $u equiv r med \( mod med p \)$. If the prime is occupied at an endpoint, such coincidence would force $p divides b$ or $p divides a$. At any other occupied site it is excluded by the preceding discarded event. The actual root test is therefore zero at the remaining occupied primes. The cost of setting the independent test to zero there is bounded in expectation by the deterministic candidate bound times
  $ bb(E) sum_(p upright(" occupied")) 1 / p lt.eq M sum_(p > P_0) 1 / p^2 . $
  This domination does not require candidates to be independent of occupied primes.
  ===== 5.4.4 Unoccupied primes. <unoccupied-primes.>
  The roots are now distinct rational numbers. A collision between two of their residues modulo $p$, after excluding coefficient primes, requires $p$ to divide their nonzero cross-multiplied difference. That integer has logarithmic size $O \( B \)$. A collision with a forbidden site class has the same bound, or concerns a coefficient prime already handled. For each candidate pair or candidate–site pair, these defective primes have reciprocal sum $O \( B \/ P_0 \)$. At all such primes, discard all involved tests. Conditional on the sites, each defined test has probability at most $1 \/ \( p - M \) lt.eq 2 \/ p$, so another polynomial loss is harmless.
  At a remaining unoccupied prime the root classes are distinct and avoid all forbidden classes. Their joint law is a disjoint-choice law with individual hit probabilities $1 \/ \( p - M \)$. If there are $N_(upright("cand")) = O \( B^4 \)$ tests, its total variation distance from independent Bernoulli$\( 1 \/ p \)$ tests is
  $ O #h(-0.16667em) (frac(\( M + N_(upright("cand")) \)^2, p^2)) . $
  For example, compare first to independent tests of probability $1 \/ \( p - M \)$, at cost $O \( N_(upright("cand"))^2 \/ p^2 \)$ from multiple hits, and then change each probability to $1 \/ p$, at cost $O \( N_(upright("cand")) M \/ p^2 \)$. Summing over primes constructs the claimed conditional coupling. The preceding union bounds give total failure probability $O \( B^C \/ P_0 \) + O \( B^C e^(- B) \)$ for a fixed crude exponent $C$. On these failures, use the deterministic polynomial matrix-mass bounds. After including that loss and enlarging the crude exponent, their contribution to the expected cut norm is at most $O \( B^50 \/ P_0 \) + O \( B^50 e^(- B) \) = o \( 1 \)$. Equation (5.7) is handled in the resulting weights, as just explained.
  ===== 5.4.5 Fluctuations of the extra weights. <fluctuations-of-the-extra-weights.>
  The preceding coupling has separated the extra roots from the endpoint types. It remains to show that their independent fluctuations are small even after maximizing the testing signs. The comparison model has independent endpoint types and an additional independent set $S_(upright("root"))$ for each unordered candidate. In its weight, replace $k_B$ in (5.8) by $K \( S_(upright("root")) \)$. Conditional on the endpoints, the candidate weights are independent, and their means give precisely $cal(L)$. By (3.9), each full candidate weight, including its six truncated factors and the factor $1 \/ B$, is at most
  $ C B^(- 1 + 6 \( h_0 + tau log 2 \) + o \( 1 \)) lt.eq B^(- 0.07) $
  for large $B$, with harmless enlargement of constants. For fixed sign vectors in (5.5), an unordered candidate has sign coefficient of absolute value at most two. Positivity bounds the conditional variance sum by a constant times $B^(- 0.07)$ times $sum_(i \, k) cal(L)_(i k)$.
  Bernstein’s inequality, union over at most $2^(2 M)$ sign choices, and integration of the tail show that the conditional expected cut norm of the centered fluctuation is at most
  #[#set math.equation(numbering: n => "(5.12)")
   $ C (sqrt(B^(- 0.07) 1 / M sum_(i \, k) cal(L)_(i k)) + B^(- 0.07)) . $ <eq:graph-root-fluctuation>]
  Indeed, before division by $M$, a threshold
  $ C (sqrt(B^(- 0.07) #scale(x: 180%, y: 180%)[\(] sum_(i \, k) cal(L)_(i k) #scale(x: 180%, y: 180%)[\)] \( M + y \)) + B^(- 0.07) \( M + y \)) $
  has tail $O \( e^(- y) \)$ for $y gt.eq 0$, with $C$ absorbing the sign enumeration. Lemma 23 and Jensen’s inequality make the expectation of (5.12) tend to zero. The triangle inequality now proves (5.10); the deterministic polynomial mass bounds control the coupling failures for both kernels. All estimates used only uniform bounds for the smooth factors on $cal(S)$. ◻
]

== 6 A second moment for the latent rows <sec:moments>

The independent-root comparison leaves the latent kernel $cal(L)$ of (5.8). Its conditional first moments are bounded uniformly over every site type by (5.9). For the sampling argument we also need an integrated second-moment estimate. A small bound on each individual representation does not suffice, because an edge may have several representations. Expanding the square and weighting one representation will identify the measure under which that multiplicity must be controlled.

The grid size $L$ and tolerance $tau$ will be chosen once below, consistently with Section 3. In every limit $B arrow.r oo$ in this section, those choices, $eta > 0$, the block constant $C_6$, $C_(*)$, and the smooth weights are held fixed. All estimates are uniform in the positions and in the smooth parameter $s$ on the fixed compact range used in Section 5. Constants may depend on the fixed parameters but not on the particular first representation.

#thm([Proposition 6.1.])[
  (Integrated row moments).  #emph[For a sufficiently fine fixed regularity grid and then a sufficiently small fixed tolerance, the independent-site latent kernel satisfies 
#[#set math.equation(numbering: n => "(6.1)")
 $ sum_(k eq.not i) bb(E) thin cal(L)_(i k)^2 lt.double B^(- .21) #h(2em) \( 1 lt.eq i lt.eq M \) . $ <eq:24>]

 Moreover, its normalized total mass has bounded second moment: 
$ bb(E) (1 / M sum_(i \, k) cal(L)_(i k))^2 lt.double 1 . $

 For every set $I subset.eq { 1 \, dots.h \, M }$, the same estimates hold after replacing $cal(L)_(i k)$ by $upright(bold(1))_({ i \, k in I }) cal(L)_(i k)$; the normalization remains $M$.]
] <prop:moments:rows>

Write $h_tau = h_0 + tau log 2$. There are five truncated weights in an individual summand of (5.8). Since $k_B lt.double 1$ and the smooth factors are bounded, (3.9) gives the uniform bound

#[#set math.equation(numbering: n => "(6.2)")
 $ upright("one contribution to ") cal(L)_(i k) med lt.eq B^(- kappa_1 + 5 tau log 2 + o \( 1 \)) \,\
kappa_1 = 1 - 5 h_0 = 0.232867951 dots.h > .2328 . $ <eq:25>]

=== 6.1 The measure obtained from a first representation <the-measure-obtained-from-a-first-representation>

Fix an allowed pair $i \, k = i + j$. Let $cal(C)_j$ be the finite set of positive triples $\( a \, b \, c \)$ satisfying

$ a - b = j c \, #h(2em) B lt.eq log c lt.eq 2 B \, #h(2em) T c lt.eq a \, b lt.eq 2 T c \, $

whose entries are pairwise coprime, rough, squarefree, and regular. These are precisely the coefficient conditions for a candidate; the two remainder regularity conditions still depend on the site types. We initially take $j > 0$; the negative case follows by exchanging the endpoints. Fix $\( a \, b \, c \) in cal(C)_j$. For an integer $v$ whose prime factors belong to $cal(P)$, write $cal(P) \( v \)$ for its set of prime factors.

In the independent-site model, the event $cal(P) \( b \) subset S_i$, $cal(P) \( a \) subset S_k$ has probability $1 \/ \( a b \)$. Conditional on that event, put

$ cal(T)_b = S_i \\ cal(P) \( b \) \, #h(2em) cal(T)_a = S_k \\ cal(P) \( a \) . $

These sets are independent, and at each prime not excluded by the corresponding coefficient the inclusion probability is $1 \/ p$. Weighting one such inclusion by its factor $1 \/ 2$ in $K_0$ changes this probability to

$ frac(\( 1 \/ p \) \/ 2, 1 - 1 \/ \( 2 p \)) = frac(1, 2 p - 1) . $

Thus weighting by $K_0 \( cal(T)_b \) K_0 \( cal(T)_a \)$ gives a product probability measure, denoted by $bb(P)_(a \, b)^(upright("tilt"))$, under which the two remainder sets are independent and their available prime indicators have probabilities $1 \/ \( 2 p - 1 \)$.

For a coefficient $v$ the normalizing factor is

$ Xi \( v \) = R^(1 \/ 2) product_(p in cal(P) \\ cal(P) \( v \)) (1 - frac(1, 2 p)) . $

The full product with no exclusions is bounded by Mertens’ estimate. Furthermore $log v = O \( B \)$ and every prime of $v$ exceeds $P_0$, so

$ sum_(p divides v) 1 / p lt.double B / P_0 . $

Removing these factors changes the product by $1 + o \( 1 \)$. Consequently $Xi \( v \) lt.double 1$ uniformly for the coefficients under consideration. For every nonnegative function $H$ of the two remainder sets we therefore have the exact change-of-measure identity

$ & bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_(cal(P) \( b \) subset S_i \, thin cal(P) \( a \) subset S_k) K_0 \( cal(T)_b \) K_0 \( cal(T)_a \) H \( cal(T)_b \, cal(T)_a \) #scale(x: 120%, y: 120%)[\]]\
 & #h(25mm)  = frac(Xi \( b \) Xi \( a \), a b) bb(E)_(a \, b)^(upright("tilt")) H \( cal(T)_b \, cal(T)_a \) . $

The indicators that the two first remainders are regular will stay inside $H$. In particular, we never divide by their probability.

Given these remainder sets, reconstruct $S_i = cal(P) \( b \) union cal(T)_b$ and $S_k = cal(P) \( a \) union cal(T)_a$, and let $N_(a \, b \, c) \( cal(T)_b \, cal(T)_a \)$ be the number of valid candidates at this pair for the reconstructed types, including the first triple whenever it is valid.

We can now see exactly how this measure enters the square. Expand the square of the sum of nonnegative candidate contributions, designate one candidate as the first representation, and bound every alternative contribution by (6.2). The first contribution retains the two factors $K_0 \( cal(T)_b \) K_0 \( cal(T)_a \)$ and their regularity indicators. The change-of-measure identity gives

#[#set math.equation(numbering: n => "(6.3)")
 $ bb(E) thin cal(L)_(i k)^2 & lt.double B^(- kappa_1 + 5 tau log 2 + o \( 1 \)) 1 / B sum_(\( a \, b \, c \) in cal(C)_j) frac(A \( a \) A \( b \) A \( c \), a b) thin Xi \( a \) Xi \( b \)\
 & #h(2em) dot.op bb(E)_(a \, b)^(upright("tilt")) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_(cal(T)_b med upright("regular")) upright(bold(1))_(cal(T)_a med upright("regular")) N_(a \, b \, c) \( cal(T)_b \, cal(T)_a \) #scale(x: 120%, y: 120%)[\]] . $ <eq:moments-first-representation>]

The implied constant absorbs $k_B$ and the bounded smooth factors. Thus the remaining multiplicity question is the following uniform estimate; the coefficient sum will then be bounded by (3.8).

#thm([Lemma 6.2.])[
  (Weighted representation multiplicity).  #emph[The grid and tolerance can be chosen so that, uniformly for $\( a \, b \, c \) in cal(C)_j$ and $eta T lt.eq \| j \| lt.eq T$, 
$ bb(E)_(a \, b)^(upright("tilt")) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_(cal(T)_b med upright("regular")) upright(bold(1))_(cal(T)_a med upright("regular")) N_(a \, b \, c) \( cal(T)_b \, cal(T)_a \) #scale(x: 120%, y: 120%)[\]] lt.double B^.009 . $

]
] <lem:moments:multiplicity>

#proof[
  Every alternative candidate has a unique decomposition
  $ b' = d_1 y \, quad d_1 divides b \, quad cal(P) \( y \) subset cal(T)_b \, #h(2em) a' = e_1 z \, quad e_1 divides a \, quad cal(P) \( z \) subset cal(T)_a \, #h(2em) a' - b' = j c' . $
  Here all the products are squarefree, and $y$ is coprime to $b$ while $z$ is coprime to $a$. The coefficient $c'$ is determined once the four products are chosen. We may discard any of the alternative candidate conditions for upper bounds; however, we retain the coefficient regularity conditions that are used below. Since $a' \, b' lt.eq 2 T exp \( 2 B \)$, we have $log y \, log z lt.eq 3 B$ for all sufficiently large $B$.
  Set $Delta = 1 \/ L$, $g_0 = 3 Delta$, and $U = max \( log y \, log z \)$. We count the alternatives with $U lt.eq B^(g_0)$ directly from prefix regularity. When $U > B^(g_0)$, fixing the omissions and the new product at one endpoint places the other new product in one residue class modulo $\| j \|$, through $e_1 z - d_1 y = j c'$. The resulting progression density is the gain that will pay for the remaining subset choices.
  For a grid point $g < 1$, define
  $ cal(Q)_g = { p in cal(P) : log p lt.eq B^g } \, #h(2em) cal(Q)_1 = cal(P) \, $
  and write $omega_g \( v \) = \| cal(P) \( v \) ∩ cal(Q)_g \|$, with the same notation for a prime set. Regularity gives
  $ \( g \/ 2 - tau \) ell lt.eq omega_g \( v \) lt.eq \( g \/ 2 + tau \) ell $
  for each of the first and alternative coefficients, and for each regular first remainder. Mertens’ estimate, on this fixed grid, gives
  $ sum_(p in cal(Q)_g) 1 / p = g ell + o \( ell \) . $
  The $o \( ell \)$ is uniform over the finitely many grid points.
  ===== 6.1.1 Omissions above an addition prefix. <omissions-above-an-addition-prefix.>
  Suppose that all primes of $z$ and $y$ lie in $cal(Q)_g$. Let $D_a = cal(P) \( a \) \\ cal(P) \( e_1 \)$ be the primes omitted from $a$. Regularity of the total counts of $a \, a'$ gives
  $ \| \| D_a \| - omega \( z \) #scale(x: 120%, y: 120%)[\|] lt.eq 2 tau ell . $
  Regularity at $g$ gives the analogous inequality
  $ \| \| D_a ∩ cal(Q)_g \| - omega \( z \) #scale(x: 120%, y: 120%)[\|] lt.eq 2 tau ell . $
  Subtracting shows that at most $4 tau ell$ primes above the prefix can be omitted. The same conclusion holds for the omissions from $b$. When $g = 1$ there are no primes above the prefix.
  Write
  $ H \( u \) = - u log u - \( 1 - u \) log \( 1 - u \) \, #h(2em) 0 lt.eq u lt.eq 1 \, $
  with the endpoint values defined by continuity. For completeness, if $m lt.eq 8 tau ell$, the number of such subsets is at most $2^m lt.eq 2^(8 tau ell)$. For $8 tau ell < m lt.eq \( 1 \/ 2 + tau \) ell$, the binomial bound
  $ sum_(q lt.eq 4 tau ell) binom(m, q) lt.eq \( m + 1 \) exp #scale(x: 120%, y: 120%)[\(] m H \( 4 tau ell \/ m \) #scale(x: 120%, y: 120%)[\)] lt.eq \( m + 1 \) exp (\( 1 \/ 2 + tau \) ell H (frac(4 tau, 1 \/ 2 + tau))) $
  applies: $H$ is increasing up to $1 \/ 2$, and $m H \( k \/ m \)$ is increasing in $m$ for fixed $0 < k < m$. Thus the choices at both coefficients together cost $B^(epsilon_(upright("high")) \( tau \) + o \( 1 \))$, where $epsilon_(upright("high")) \( tau \) arrow.r 0$ as $tau arrow.r 0$. The estimate is uniform also when the relevant set is empty.
  ===== 6.1.2 Small additions. <small-additions.>
  If
  $ U lt.eq B^(g_0) \, $
  all additions lie in $cal(Q)_(g_0)$. On the two first-remainder regularity events, the four relevant prefix sets—the prime sets of $a \, b$ and the two first remainders—have at most $\( 2 g_0 + 4 tau \) ell$ primes altogether. Allowing arbitrary subset choices there, and then the higher omissions just bounded, gives the pointwise estimate
  $ N_(upright("small")) lt.eq 2^(\( 2 g_0 + 4 tau \) ell) B^(epsilon_(upright("high")) \( tau \) + o \( 1 \)) = B^(\( 2 g_0 + 4 tau \) log 2 + epsilon_(upright("high")) \( tau \) + o \( 1 \)) . $
  This also bounds its expectation with the first-remainder regularity indicators. By taking $L$ large and then $tau$ small, its exponent apart from $o \( 1 \)$ can be made strictly smaller than $.008$.
  ===== 6.1.3 Large-addition classes and combinatorial choices. <large-addition-classes-and-combinatorial-choices.>
  For $U > B^(g_0)$ use the classes
  $ B^(g - Delta) < U lt.eq B^g quad \( g_0 < g < 1 \) \, #h(2em) B^(1 - Delta) < U lt.eq 3 B quad \( g = 1 \) \, $
  where $g$ ranges over grid points. All addition primes again belong to $cal(Q)_g$. It suffices to treat the portion of a class in which $log z > B^(g - Delta)$. The portion with $log y > B^(g - Delta)$ is estimated by the same argument with the endpoints exchanged; the numeric sieve below permits either sign for its second slope. If both inequalities hold, counting the alternative twice only increases the upper bound.
  Define the exact normalized counts and their clipped values by
  $ r_z^(*) = frac(omega \( z \), g ell) \, #h(2em) r_y^(*) = frac(omega \( y \), g ell) \, #h(2em) r_z = min \( r_z^(*) \, 1 \/ 2 \) \, #h(2em) r_y = min \( r_y^(*) \, 1 \/ 2 \) . $
  On the first-remainder regularity events, $0 lt.eq r_z^(*) \, r_y^(*) lt.eq 1 \/ 2 + tau \/ g$. There are $O \( ell^2 \)$ possible pairs of integer counts. We estimate one such pair at a time.
  The number of omitted primes in the $a$ prefix is $r_z^(*) g ell + O \( tau ell \)$, among $g ell \/ 2 + O \( tau ell \)$ available primes. Applying $binom(m, q) lt.eq exp \( m H \( q \/ m \) \)$, and summing over the $O \( ell \)$ permissible values of $q$, gives, with the higher-omission factor included,
  #[#set math.equation(numbering: n => "(6.4)")
   $ \# { e_1 } lt.eq B^(1 / 2 g H \( 2 r_z \) + epsilon_L \( tau \) + o \( 1 \)) . $ <eq:26>]
  The function $epsilon_L \( tau \)$ can be chosen to tend to zero for fixed $L$. To justify this uniformly in the counts, divide $m \, q$ by $ell$ and use uniform continuity of $H$ on $\[ 0 \, 1 \]$; the perturbations are $O \( tau \/ g \)$, and $g gt.eq g_0 > 0$ is fixed. The clipping from $r_z^(*)$ to $r_z$ changes these arguments by the same amount. Also $ell \/ log B arrow.r 1$, and all polynomial factors in $ell$ contribute $B^(o \( 1 \))$. We use $epsilon_L \( tau \)$ below for a possibly enlarged function with this same limiting property.
  The choices of $d_1$ have the corresponding bound with $r_y$. Conditional on a regular first remainder $cal(T)_b$, the number of its subsets $y$ of the prescribed cardinality is at most
  $ B^(1 / 2 g H \( 2 r_y \) + epsilon_L \( tau \) + o \( 1 \)) . $
  This bound is uniform in that remainder set. We may condition on it and sum over these $y$ while the remainder at the other endpoint still has its independent tilted law.
  ===== 6.1.4 Availability of a fixed numeric addition. <availability-of-a-fixed-numeric-addition.>
  The entropy bounds count the possible omitted prime sets. To control large additions, we also need the probability that each numerically specified product is present in the other remainder set. The next bound keeps the first remainder’s regularity requirement in this probability. For a fixed squarefree $z$ in this class, with $cal(P) \( z \) subset cal(Q)_g \\ cal(P) \( a \)$, its inclusion probability in $cal(T)_a$ is
  $ product_(p divides z) frac(1, 2 p - 1) = 2^(- omega \( z \)) / z product_(p divides z) (1 - frac(1, 2 p))^(- 1) lt.double 2^(- omega \( z \)) / z . $
  The last bound is uniform because $log z lt.eq 3 B$ and all its primes exceed $P_0$. Conditional on those inclusions, the remaining available indicators in $cal(Q)_g$ are independent with parameter sum
  $ Lambda = sum_(p in cal(Q)_g \\ \( cal(P) \( a \) union cal(P) \( z \) \)) frac(1, 2 p - 1) = 1 / 2 g ell + o \( ell \) . $
  The excluded primes have reciprocal sum $O \( B \/ P_0 \)$, so this estimate is uniform in the fixed coefficient and numeric addition. First prefix regularity requires the number of these other inclusions to be at most $\( 1 \/ 2 - r_z^(*) \) g ell + tau ell$.
  If $X$ is a sum of independent Bernoulli variables with parameter sum $Lambda$, then for $t gt.eq 0$,
  $ bb(P) \( X lt.eq k \) lt.eq exp #scale(x: 120%, y: 120%)[\(] t k + \( e^(- t) - 1 \) Lambda #scale(x: 120%, y: 120%)[\)] . $
  For $0 lt.eq k lt.eq Lambda$, minimizing gives exponent $- Lambda + k - k log \( k \/ Lambda \)$, with its continuous value at $k = 0$. For $k gt.eq Lambda$ use the bound $1$, and for $k < 0$ the event is empty. Uniform continuity of the resulting rate, including the endpoints, and the fixed-grid relation $g gt.eq g_0$ therefore imply
  #[#set math.equation(numbering: n => "(6.5)")
   $ & bb(P)_(a \, b)^(upright("tilt")) #scale(x: 120%, y: 120%)[\(] cal(P) \( z \) subset cal(T)_a \, med cal(T)_a upright(" regular at ") g #scale(x: 120%, y: 120%)[\)]\
 & #h(12mm)  lt.double frac(\( 1 \/ 2 \)^(omega \( z \)), z) B^(- g I_(1 \/ 2) \( 1 \/ 2 - r_z \) + epsilon_L \( tau \) + o \( 1 \)) \, #h(2em) I_(1 \/ 2) \( u \) = 1 / 2 - u + u log frac(u, 1 \/ 2) . $ <eq:27>]
  Here $u log u = 0$ at $u = 0$. Retaining only prefix regularity on the left gives an upper bound for retaining all of first-remainder regularity, which is what the multiplicity expectation requires.
  ===== 6.1.5 A harmonic sieve for the numeric addition. <a-harmonic-sieve-for-the-numeric-addition.>
  We now sum the availability bound over numeric additions satisfying the alternative coefficient relation. The factor $1 \/ z$ in that bound is the reason for the harmonic normalization below. Fix $e_1 \, d_1 \, y$ from the preceding choices. The alternative size conditions imply
  $ z asymp Z' := d_1 y \/ e_1 $
  with absolute comparison constants; we may enlarge the interval to $\[ Z' \/ 2 \, 2 Z' \]$.
  For these fixed data and the fixed cardinality class, let $cal(Z)$ consist of the positive integers $z$ with the following properties:
  $ z upright(" is a squarefree product of primes in ") cal(Q)_g \\ cal(P) \( a \) \, #h(2em) omega \( z \) = r_z^(*) g ell \,\
Z' \/ 2 lt.eq z lt.eq 2 Z' \, #h(2em) log z in cases(delim: "{", \( B^(g - Delta) \, B^g \] \, & g < 1 \,, \( B^(1 - Delta) \, 3 B \] \, & g = 1 \,)\
e_1 z equiv d_1 y med \( mod med \| j \| \) \, #h(2em) c' \( z \) := frac(e_1 z - d_1 y, j) > 0 \, #h(2em) \( e_1 z \, d_1 y \, c' \( z \) \) in cal(C)_j . $
  The congruence makes $c' \( z \)$ an integer. Every valid alternative in this designated class yields an element of $cal(Z)$. The inclusion $cal(P) \( z \) subset cal(T)_a$ remains the event estimated in (6.5); the two alternative remainder regularity conditions are discarded. Equation (6.5) applies to every $z in cal(Z)$, because each is a possible product in the tilted remainder at the $a$ endpoint. If $cal(Z)$ is empty there is nothing to prove; otherwise its interval and log conditions give $Z' gt.eq 1 / 2 exp \( B^(g - Delta) \)$.
  All of $e_1 \, d_1 \, y$ are units modulo $\| j \|$, since their prime factors exceed $P_0 > T$. Thus the displayed congruence is one unit residue class. We claim
  #[#set math.equation(numbering: n => "(6.6)")
   $ sum_(z in cal(Z)) frac(\( 1 \/ 2 \)^(omega \( z \)), z) lt.double frac(1, \| j \|) B^(g \[ F_0 \( r_z \) - 1 - h_0 \] + 3 Delta + r_min + tau log 2 + o \( 1 \)) \, #h(2em) F_0 \( u \) = u (1 + log frac(1 \/ 2, u)) \, quad F_0 \( 0 \) = 0 \, $ <eq:28>]
  where $r_min in \( 0 \, 1 \/ 2 \)$ is any fixed number. The excess exponent $3 Delta + r_min + tau log 2 + o \( 1 \)$ can be made small by the later choices of grid, clamp, and tolerance.
  To prove the deterministic estimate, put $lambda = max \( r_min \, r_z \)$, so $r_min lt.eq lambda lt.eq 1 \/ 2$. On $cal(Z)$ the fixed cardinality gives
  $ \( 1 \/ 2 \)^(omega \( z \)) = lambda^(omega \( z \)) (frac(1 \/ 2, lambda))^(r_z^(*) g ell) . $
  The membership of $\( e_1 z \, d_1 y \, c' \( z \) \)$ in $cal(C)_j$ also gives the upper prefix cutoff for $c' \( z \)$, and hence
  $ 1 lt.eq 2^(\( g \/ 2 + tau \) ell) thin 2^(- omega_g \( c' \( z \) \)) . $
  The prefix factor is introduced to supply a second reducing root in the sieve below. At the leading $g$-scale its saving $- g \/ 2$ combines with the cutoff cost $g log 2 \/ 2$, leaving $- g h_0$ in the exponent. The calculation below verifies the root conditions and retains the grid and tolerance losses. Insert these two factors before enlarging the summation domain, and keep only the reducing prime factors up to
  $ Z_(upright("sieve")) = exp \( B^(g - 2 Delta) \) . $
  Deleting the other reducing factors increases each summand. Since $z gt.eq Z' \/ 2$ on $cal(Z)$, we obtain the deterministic majorant
  $ sum_(z in cal(Z)) frac(\( 1 \/ 2 \)^(omega \( z \)), z) & lt.eq 2 / Z' (frac(1 \/ 2, lambda))^(r_z^(*) g ell) 2^(\( g \/ 2 + tau \) ell)\
 & quad dot.op sum_(z in bb(Z) ∩ \[ Z' \/ 2 \, 2 Z' \]\
e_1 z equiv d_1 y med \( mod med \| j \| \)) product_(P_0 < p lt.eq Z_(upright("sieve"))) lambda^(upright(bold(1))_({ p divides z })) 2^(- upright(bold(1))_({ p divides c' \( z \) })) . $
  The finite congruence product is defined for every integer value of $c' \( z \)$, including zero. The hard prefix cutoff, the fixed-cardinality condition, and all other candidate restrictions have been removed only in this deterministic sum. Equation (6.5) is applied only to $z in cal(Z)$; the displayed enlargement bounds the weighted sum that results.
  For explicit congruence accounting put $J_1 = \| j \|$ and $sigma = j \/ J_1$, and choose a unit $z_0$ modulo $J_1$ satisfying the progression condition. Write
  $ z = z_0 + J_1 t \, #h(2em) c' = c_0 + sigma e_1 t \, #h(2em) c_0 = frac(e_1 z_0 - d_1 y, j) in bb(Z) . $
  The parameter $t$ runs through an interval of length $N asymp Z' \/ J_1$. Its logarithm is at least $B^(g - Delta) - O \( log B \)$. Consequently
  $ frac(log Z_(upright("sieve")), log N) = O \( B^(- Delta) \) arrow.r 0 \, $
  so the interval upper sieve of Section 3, in fixed dimension two, applies uniformly.
  The displayed product already omits every prime at most $P_0$, including every prime of $j$. Among the remaining primes also drop those dividing $e_1 d_1 y$. Their reciprocal sum is $O \( B \/ P_0 \)$, uniformly, since $log \( e_1 d_1 y \) = O \( B \)$. At each retained prime the two slopes are invertible, and the two roots are distinct. Indeed their determinant is
  $ J_1 c_0 - sigma e_1 z_0 = - sigma d_1 y \, $
  which is nonzero modulo such a prime. The local weights of the roots are $lambda$ and $1 \/ 2$, so the average local weight is exactly
  $ 1 - frac(3 \/ 2 - lambda, p) . $
  This also explains why no coefficient-height factor enters the sieve: only the number and distinctness of residue roots are used. If one keeps primes dividing $j$ instead, the first form is a fixed unit and the second has invertible slope; dropping them avoids any need for a separate local factor.
  The random-weight interval sieve bounds the sum of the retained reducing weights by a constant times
  $ N product_(P_0 < p lt.eq Z_(upright("sieve"))\
p divides.not e_1 d_1 y) (1 - frac(3 \/ 2 - lambda, p)) + O \( N^.8 \) . $
  The first term is $N B^(\( g - 2 Delta \) \( lambda - 3 \/ 2 \) + o \( 1 \))$, by Mertens’ estimate. Indeed the reciprocal sum in that product is $\( g - 2 Delta \) log B - log log P_0 + O \( 1 \) = \( g - 2 Delta \) log B + o \( log B \)$, and the sum of the squared reciprocals is negligible. Discarding the small-prime conditions costs at most powers of $log P_0$ relative to their possible sieve factors, and those powers are $B^(o \( 1 \))$; alternatively, the displayed large-prime product already proves the upper bound directly.
  Using $z asymp Z'$ and restoring the threshold factors, the harmonic normalization of the main sieve bound is $N \/ Z' asymp 1 \/ J_1$. The remainder contributes at most
  $ 1 / J_1 B^(O \( 1 \)) N^(- .2) \, $
  which is negligible uniformly in the class, since $g gt.eq 4 Delta$ and $log N gt.eq B^(g - Delta) - O \( log B \)$. The total power of $B$ in the main term is
  $ \( g - 2 Delta \) \( lambda - 3 \/ 2 \) + g r_z^(*) log frac(1 \/ 2, lambda) + \( g \/ 2 + tau \) log 2 + o \( 1 \) . $
  If $r_z^(*) lt.eq 1 \/ 2$, then $r_z = r_z^(*)$, and this power equals
  $ & g \[ F_0 \( r_z \) - 1 - h_0 \] + g (lambda - r_z + r_z log r_z / lambda)\
 & #h(20mm)  + 2 Delta \( 3 \/ 2 - lambda \) + tau log 2 + o \( 1 \) . $
  We used $- 3 \/ 2 + \( log 2 \) \/ 2 = - 1 - h_0$. The clamp contribution in parentheses vanishes when $r_z gt.eq r_min$ and lies between $0$ and $r_min$ when $0 lt.eq r_z < r_min$, including the value $r_min$ at $r_z = 0$. The grid contribution is at most $3 Delta$. If $r_z^(*) > 1 \/ 2$, our choice is $r_z = lambda = 1 \/ 2$; the Rankin factor is then exactly $1$ and the same upper bound follows directly with the clipped $r_z$. These observations prove (6.6). If $y$ is the designated large numeric variable, the identical proof uses the slope $- d_1$ for $c'$ instead, and its determinant has the same nonvanishing property outside the already discarded coefficient primes.
  ===== 6.1.6 Combining the bounds and choosing parameters. <combining-the-bounds-and-choosing-parameters.>
  Condition on the first remainder at the $b$ endpoint. If it is not regular its contribution vanishes. If it is regular, enumerate the choices of $d_1 \, y$ by the two entropy bounds with $r_y$, and enumerate $e_1$ by (6.4). For each such choice, sum the availability bound (6.5) using (6.6). Independence of the other first remainder justifies this conditioning, and every bound is uniform in the conditioned regular remainder. Thus we may average it out without any additional factor.
  A direct expansion of $H$ gives the exact identity
  $ F_0 \( r_z \) - I_(1 \/ 2) \( 1 \/ 2 - r_z \) = 1 / 2 H \( 2 r_z \) #h(2em) \( 0 lt.eq r_z lt.eq 1 \/ 2 \) . $
  The three combinatorial factors have entropy exponents $g H \( 2 r_z \) \/ 2$, $g H \( 2 r_y \) \/ 2$, and $g H \( 2 r_y \) \/ 2$. Adding the probability and sieve exponents therefore bounds the contribution of one class, one orientation, and one count pair, with both first-remainder regularity indicators, by
  #[#set math.equation(numbering: n => "(6.7)")
   $ & lt.double frac(1, \| j \|) B^(g \[ H \( 2 r_z \) + H \( 2 r_y \) - 1 - h_0 \] + 3 Delta + r_min + epsilon_L \( tau \) + o \( 1 \))\
 & lt.eq frac(1, \| j \|) B^(kappa_1 + 3 Delta + r_min + epsilon_L \( tau \) + o \( 1 \)) . $ <eq:29>]
  The tolerance error here includes the preceding $tau log 2$ and the finitely many entropy and rate perturbations. The last inequality uses $H lt.eq log 2$ and $0 < g lt.eq 1$. If the bracket in the first exponent is negative, multiplying it by $g$ still gives a nonpositive number; otherwise its maximum is at most $2 log 2 - 1 - h_0 = kappa_1$.
  Here is an explicit consistent order of choices. First choose $L$ large enough that $6 Delta log 2 < .004$ and $3 Delta < .01$. Next choose a fixed $r_min < .01$. Finally make $tau$ small enough that the small-addition exponent is strictly below $.008$, that
  $ 3 Delta + r_min + epsilon_L \( tau \) < .04 \, $
  and that all the strict weight inequalities in (3.10) hold. These choices are possible because $epsilon_L \( tau \)$ and $epsilon_(upright("high")) \( tau \)$ tend to zero for the fixed grid. They impose no condition on $C_(*)$, since only the prefix and total regularity conditions were needed for this estimate.
  There are finitely many grid classes and orientations and $O \( ell^2 \) = B^(o \( 1 \))$ count pairs. Since $\| j \| gt.eq eta T asymp_eta B^.32$ and
  $ kappa_1 + .04 - .32 = - .047132048 dots.h < 0 \, $
  the sum of all the large-addition bounds is $o \( 1 \)$. The small-addition bound, with a strict exponent below $.008$, is $O \( B^.009 \)$ after the $o \( 1 \)$ in its exponent is absorbed. This proves the lemma, including the first candidate itself when valid. ◻
]

=== 6.2 Squaring the kernel and averaging the rows <squaring-the-kernel-and-averaging-the-rows>

The multiplicity estimate has controlled how many alternative representations survive after weighting a first one. Combining it with the small weight of each representation now gives the required integrated row-square bound.

#proof[
  For an allowed edge $i \, k = i + j$, apply Lemma 26 to (6.3) and use the uniform bound on $Xi$. This gives
  $ bb(E) cal(L)_(i k)^2 lt.double B^(- kappa_1 + 5 tau log 2 + .009 + o \( 1 \)) 1 / B sum_(\( a \, b \, c \) in cal(C)_j) frac(A \( a \) A \( b \) A \( c \), a b) . $
  The remaining coefficient sum is bounded using (3.8). Cover the support of $c$ by $O \( B \)$ dyadic boxes $c asymp X$, so $a \, b asymp T X$ in each box. On such a box, dropping coefficient cutoffs for an upper bound gives
  $ 1 / B sum_(a - b = j c) frac(A_0 \( a \) A_0 \( b \) A_0 \( c \), a b) lt.double frac(1, B \( T X \)^2) thin T X^2 Sigma \( j \) = frac(Sigma \( j \), B T) . $
  Summing the boxes yields $O \( Sigma \( j \) \/ T \)$. The same proof works for negative $j$ by symmetry. Consequently
  $ bb(E) cal(L)_(i k)^2 lt.double B^(- kappa_1 + 5 tau log 2 + .009 + o \( 1 \)) frac(Sigma \( k - i \), T) . $
  The choice in (3.10) gives $kappa_1 - 5 tau log 2 = 1 - 5 h_tau > .229$. Thus the exponent on the right is strictly below $- .220$ before the $o \( 1 \)$ term. Finally
  $ 1 / T sum_(0 < \| j \| lt.eq T) Sigma \( j \) lt.double 1 \, $
  so summing over a row proves (6.1), with room to absorb the $o \( 1 \)$ in the exponent.
  For the last assertion set $D_i = sum_k cal(L)_(i k)$. Given $S_i$, the summands with different $k eq.not i$ are independent, because the other site types are independent and the roots have already been averaged out. Therefore
  $ bb(E) "Var" \( D_i divides S_i \) lt.eq sum_k bb(E) cal(L)_(i k)^2 lt.double B^(- .21) . $
  The conditional mean is bounded for every $S_i$ by (5.9). The variance identity consequently gives
  $ bb(E) D_i^2 = bb(E) "Var" \( D_i divides S_i \) + bb(E) #scale(x: 120%, y: 120%)[\(] bb(E) \[ D_i divides S_i \] #scale(x: 120%, y: 120%)[\)]^2 lt.double 1 . $
  Notice that only an integrated conditional variance bound has been used; a pointwise conditional second-moment estimate is unnecessary. Jensen’s inequality across the rows now gives
  $ bb(E) (1 / M sum_i D_i)^2 lt.eq 1 / M sum_i bb(E) D_i^2 lt.double 1 . $
  For the kernel restricted to $I$ as in the statement, nonnegativity can only reduce the conditional means, row-square sums, and total mass. Keeping the same normalization $M$ therefore gives the stated bounds. ◻
]

== 7 Smoothing channels on logarithmic and residue space <sec:channels>

The site model admits a useful smoothing operation: choose a fair subset of the primes at one site and record the logarithm and a residue of its product. We prove that this operation suppresses residue dependence in operator norm and that its logarithmic outputs are uniformly approximable on a fixed coarse partition. Operator norm, rather than convergence for each fixed test, is needed because the single-site tests used later may depend on the position and on an externally conditioned sample.

All limits in this section are as $B arrow.r oo$. The regularity parameters fixed in Section 3 remain fixed, although no regularity cutoff is imposed in the channels below. We use only the prime-product estimates (3.3)–(3.4) and the independent site law. An occurrence of $x$ inside a channel denotes a logarithmic coordinate, not the original counting scale.

=== 7.1 The channel and its two-split kernel <the-channel-and-its-two-split-kernel>

Let $Omega_B$ be the finite set of subsets of $cal(P)$, with probability measure under which the inclusions $p in S$ are independent and have probabilities $1 \/ p$. Given $S$, retain each of its primes independently with probability $1 \/ 2$, and let $b$ be their product. Unconditionally $b$ has law $nu_(1 \/ 2)$. Write

$ I = \[ 1 \/ 2 \, 3 \] \, #h(2em) x_b = frac(log b, B) . $

For a positive integer $m_1$, partition $I$ into $m_1$ equal coarse intervals $I_l$. Choose the number $n_B$ of fine intervals to be

$ n_B = m_1 ⌈frac(\| I \| B^(11 \/ 10), m_1)⌉ \, #h(2em) delta_B = frac(\| I \|, n_B) . $

Thus the fine partition refines the coarse partition and $delta_B asymp B^(- 11 \/ 10)$ for every fixed $m_1$. Use consistent half-open conventions, assigning the final endpoint to the last cell.

For an integer $1 lt.eq d lt.eq B$, let $cal(R)_d = \( bb(Z) \/ d bb(Z) \)^times$ with uniform probability measure; for $d = 1$ this is the one-point group. All products in question are units modulo $d$, since $P_0 > B$ for sufficiently large $B$. Give $I times cal(R)_d$ the product measure

$ d lambda_d \( x \, r \) = d x thin d upright("unif")_(cal(R)_d) \( r \) . $

For $g in L^2 \( Omega_B \)$, define a function constant on each fine logarithmic cell by

#[#set math.equation(numbering: n => "(7.1)")
 $ U_d g \( x \, r \) = frac(phi \( d \), delta_B) bb(E) #h(-0.16667em) [g \( S \) upright(bold(1))_({ x_b in I_x^(upright("fine")) \, med b equiv r med \( mod med d \) })] \, #h(2em) x in I_x^(upright("fine")) subset I . $ <eq:30>]

The expectation in this definition includes both the site and its fair split. The domain norm of $U_d$ is the site $L^2$ norm, and its range norm is that of $L^2 \( lambda_d \)$.

Let $P_(upright("av"))$ average the residue coordinate. Then

$ u_g := P_(upright("av")) U_d g = U_1 g $

is independent of $d$. Let $P_(m_1)$ average on the coarse logarithmic intervals and act identically on the residue coordinate when one is present. Let $P_(upright("fine"))$ denote averaging on the fine logarithmic intervals. These averaging operators are orthogonal projections, and $P_(upright("fine"))$ commutes with $P_(m_1)$.

#thm([Proposition 7.1.])[
  (Uniform channel bounds).  #emph[For every fixed coarse partition, uniformly for $1 lt.eq d lt.eq B$, 
#[#set math.equation(numbering: n => "(7.2)")
 $ parallel U_d parallel lt.double 1 \, #h(2em) parallel \( 1 - P_(upright("av")) \) U_d parallel lt.double B^(- c_7) \, #h(2em) c_7 = 1 / 200 . $ <eq:31>]

 Moreover, for every $epsilon.alt_1 > 0$, one can choose $m_1$ such that 
#[#set math.equation(numbering: n => "(7.3)")
 $ limsup_(B arrow.r oo) med sup_(parallel g parallel_2 lt.eq 1) parallel u_g - P_(m_1) u_g parallel_2 lt.eq epsilon.alt_1 . $ <eq:32>]

 All constants are independent of the input $g$. The sufficiently large threshold for $B$ may depend on the chosen fixed partition.]
] <prop:channels-operators>

We first identify the kernel used to prove the proposition. A cell $A = J times { r }$, with $J$ a fine logarithmic interval, has measure

$ lambda_d \( A \) = frac(delta_B, phi \( d \)) = : mu_d . $

Set

$ p_A \( S \) = bb(P)_(upright("split")) \( x_b in J \, med b equiv r med \( mod med d \) divides S \) . $

For a step function $F$ in the range space, the adjoint of the channel is

$ U_d^(*) F \( S \) = sum_A p_A \( S \) F \|_A . $

Consequently $U_d U_d^(*)$ has the step kernel

#[#set math.equation(numbering: n => "(7.4)")
 $ K_d \( A \, A' \) = frac(bb(E) \[ p_A \( S \) p_(A') \( S \) \], mu_d^2) . $ <eq:channels-joint-kernel>]

This is the density on fine cells of two conditionally independent fair splits of the same site, restricted to $I$ in each logarithmic coordinate. The kernel is nonnegative and symmetric. Its row integral satisfies

$ sum_(A') K_d \( A \, A' \) lambda_d \( A' \) = frac(bb(E) \[ p_A \( S \) sum_(A') p_(A') \( S \) \], mu_d) lt.eq frac(bb(P)_(nu_(1 \/ 2)) \( x_b in J \, med b equiv r med \( mod med d \) \), mu_d) . $

By (3.3), the numerator is at most $C delta_B \/ phi \( d \) + O \( B^(- 80) \)$. Indeed its logarithmic interval is contained in the fixed compact interval $I$, where the densities are uniformly bounded. Since $mu_d^(- 1) lt.double B^(21 \/ 10)$, the row integrals are bounded uniformly. The column integrals have the same bound. Schur’s inequality gives $parallel U_d U_d^(*) parallel lt.double 1$, and therefore proves the first assertion of (7.2). This proof already applies to every $L^2$ input, including signed or complex inputs.

#thm([Lemma 7.2.])[
  (Independent common and exclusive products).  #emph[Let $b_1 \, b_2$ be two conditionally independent fair splits of the same site. Their joint law can be coupled, with failure probability $O \( P_0^(- 1) \)$, to 
$ \( C E_1 \, C E_2 \) \, $

 where $C \, E_1 \, E_2$ are independent products with law $nu_(1 \/ 4)$. Replacing the two-split step kernel by this independent-product step kernel changes its operator norm by $O \( B^5 \/ P_0 \)$, uniformly for $d lt.eq B$.]
] <lem:channels-two-splits>

#proof[
  At a fixed prime $p$, the categories #emph[common to both splits], #emph[exclusive to the first], and #emph[exclusive to the second] have probabilities $1 \/ \( 4 p \)$ each, and are mutually exclusive. The joint law of three independent Bernoulli indicators with these marginal probabilities differs from this categorical law in total variation by $O \( p^(- 2) \)$. For example, the probability of two or more independent successes is $O \( p^(- 2) \)$, and each remaining probability differs from its categorical value by $O \( p^(- 2) \)$. Couple these laws independently over the primes. A union bound gives total failure probability
  $ O #h(-0.16667em) (sum_(p > P_0) p^(- 2)) = O \( P_0^(- 1) \) . $
  On successful coupling the products agree. Collisions that would put a squared prime in one of the independent products are included in the failure event.
  If two joint probability laws differ in total variation by $epsilon$, each cell-pair probability differs by at most a constant times $epsilon$. Their step kernel difference is thus bounded pointwise by $O \( epsilon mu_d^(- 2) \)$. The total measure of the output space is $\| I \|$, so Schur’s inequality bounds the operator difference by the same expression times $\| I \|$. Now
  $ mu_d^(- 2) lt.double B^(42 \/ 10) lt.double B^5 . $
  Taking $epsilon = O \( P_0^(- 1) \)$ proves the assertion. ◻
]

=== 7.2 Removing small exclusive products <removing-small-exclusive-products>

The two-split model reduces the channel operator to independent common and exclusive products. An exclusive product near $1$ provides too little averaging to erase its residue, so we first bound the operator contribution of those products. Both row and column bounds are needed.

For a product $v$, write $ell_B \( v \) = \( log v \) \/ B$. Let $K_d^(upright("ind"))$ be the independent-product kernel from Lemma 28. Its entries are

$ K_d^(upright("ind")) \( A \, A' \) = frac(bb(P) \( \( ell_B \( C E_1 \) \, C E_1 med mod med d \) in A \, med \( ell_B \( C E_2 \) \, C E_2 med mod med d \) in A' \), mu_d^2) . $

The following estimate concerns the operator obtained by retaining only the specified event in this probability.

#thm([Lemma 7.3.])[
  (Two-sided Schur estimate for small exclusives).  #emph[For $0 < theta lt.eq 1 \/ 10$, the contribution to $K_d^(upright("ind"))$ from $ell_B \( E_i \) lt.eq theta$, for either $i = 1$ or $i = 2$, has operator norm 
$ lt.double \( theta + 1 \/ R \)^(1 \/ 4) + B^(- 70) + B^5 \/ P_0 \, $

 uniformly for $d lt.eq B$. The same bound, with a different absolute constant, holds for the union of the two events.]
] <lem:channels-low-exclusive>

#proof[
  It suffices to consider $i = 2$. Put
  $ sigma_theta = bb(P)_(nu_(1 \/ 4)) \( ell_B \( E_2 \) lt.eq theta \) lt.double \( theta + 1 \/ R \)^(1 \/ 4) \, $
  where the last inequality is (3.4). The row integral at $A = J times { r }$ of the restricted kernel is at most
  $ frac(bb(P) \( \( ell_B \( C E_1 \) \, C E_1 med mod med d \) in A \, med ell_B \( E_2 \) lt.eq theta \), mu_d) = sigma_theta thin frac(bb(P) \( \( ell_B \( C E_1 \) \, C E_1 med mod med d \) in A \), mu_d) . $
  Here $E_2$ is independent of $C \, E_1$. The marginal law of $C E_1$ differs from $nu_(1 \/ 2)$ by $O \( P_0^(- 1) \)$ in total variation: the independent common and exclusive indicators can be coupled to their mutually exclusive counterparts prime by prime exactly as in the preceding lemma. Thus (3.3) and $mu_d^(- 1) lt.double B^(21 \/ 10)$ bound the last display by
  $ C sigma_theta + O \( B^5 \/ P_0 \) + O \( B^(- 70) \) . $
  For the column integral at $A' = J' times { r' }$, first omit the condition that $C E_1$ has logarithm in $I$. Condition on $E_2 = e$ with $ell_B \( e \) lt.eq theta$. The remaining condition on $C$ is
  $ ell_B \( C \) in J' - ell_B \( e \) \, #h(2em) C equiv r' e^(- 1) med \( mod med d \) . $
  The shifted interval lies in $\[ 2 \/ 5 \, 3 \]$, has length $delta_B$, and the prescribed residue is a unit. Applying (3.3) with $z = 1 \/ 4$, uniformly in $e$, gives conditional probability at most
  $ C frac(delta_B, phi \( d \)) + O \( B^(- 80) \) . $
  Integration over the event $ell_B \( E_2 \) lt.eq theta$ and division by $mu_d$ therefore give a column bound $C sigma_theta + O \( B^(- 70) \)$. Schur’s inequality proves the claimed operator bound. The $i = 1$ case follows on transposing the kernel. The kernel of the union is nonnegative and is entrywise at most the sum of the two restricted kernels, so the row and column estimates also prove its bound. ◻
]

The separate column estimate is essential: an estimate for the total probability of a discarded event would not by itself control its operator norm.

=== 7.3 Flattening all nonconstant residue modes <flattening-all-nonconstant-residue-modes>

We prove the second assertion of (7.2). Set $theta = B^(- 1 \/ 10)$ and retain the part of $K_d^(upright("ind"))$ where $ell_B \( E_1 \) \, ell_B \( E_2 \) > theta$. For a fixed common product $C = c$, the probability that one retained exclusive lands in the output cell $A = J times { r }$ is

$ p_A^(\( theta \)) \( c \) = bb(P) #scale(x: 120%, y: 120%)[\(] ell_B \( E \) in \( J - ell_B \( c \) \) ∩ \( theta \, oo \) \, med E equiv r c^(- 1) med \( mod med d \) #scale(x: 120%, y: 120%)[\)] . $

If the interval is nonempty it is contained in $\[ B^(- 1 \/ 10) \, 3 \]$, since $ell_B \( c \) gt.eq 0$. The interval and its endpoint conventions, including a partial cell at $theta$, are within the uniform statement of (3.3). Consequently

#[#set math.equation(numbering: n => "(7.5)")
 $ p_A^(\( theta \)) \( c \) = frac(1, phi \( d \)) integral_(\( J - ell_B \( c \) \) ∩ \( theta \, oo \)) f_(1 \/ 4 \, B) \( t \) thin d t + O \( B^(- 80) \) . $ <eq:channels-exclusive-cell>]

The main term depends on $J$ and $ell_B \( c \)$, but not on $r$ or on the residue of $c$. All terms are uniformly bounded: the probability is at most one and its main term differs by $O \( B^(- 80) \)$. Alternatively the bound $f_(1 \/ 4 \, B) \( t \) lt.double t^(- 3 \/ 4)$ gives the explicit cell bound $O \( delta_B B^(3 \/ 40) \/ phi \( d \) \)$.

Conditional on $C$, the exclusives are independent. Multiplying (7.5) for two output cells and integrating over $C$, the retained kernel differs from a kernel independent of both residues by at most

$ O \( B^(- 80) mu_d^(- 2) \) = O \( B^(- 75) \) $

pointwise, and hence by $O \( B^(- 70) \)$ in operator norm. A kernel independent of both residues is annihilated by projection onto $1 - P_(upright("av"))$ on either side. Lemmas 28 and 29 therefore yield

$ parallel \( 1 - P_(upright("av")) \) U_d U_d^(*) \( 1 - P_(upright("av")) \) parallel & lt.double \( B^(- 1 \/ 10) + 1 \/ R \)^(1 \/ 4) + B^(- 70) + B^5 \/ P_0\
 & lt.double B^(- 1 \/ 40) \, $

because $1 \/ R = \( log P_0 \) \/ B = O \( log B \/ B \)$ and $P_0 = B^1000$. Taking the square root of this operator identity gives the stronger bound

$ parallel \( 1 - P_(upright("av")) \) U_d parallel lt.double B^(- 1 \/ 80) . $

In particular (7.2) holds with $c_7 = 1 \/ 200$. This reasoning did not fix an input function at any stage, so the estimate is uniform on the whole unit ball of $L^2 \( Omega_B \)$.

=== 7.4 Uniform coarse compactness <uniform-coarse-compactness>

Residue dependence is now negligible uniformly in the input function. The remaining task is to approximate the logarithmic output uniformly on a fixed finite partition. This will give a finite family of endpoint features for the graph kernel.

We now prove (7.3). It suffices to use $d = 1$, since $u_g = U_1 g$. Fix $0 < theta < 1 \/ 20$ and choose a smooth function $a_theta : bb(R) arrow.r \[ 0 \, 1 \]$ equal to zero on $\( - oo \, theta \]$ and to one on $\[ 2 theta \, oo \)$. It may be chosen nondecreasing. In the independent-product kernel insert the weight $a_theta \( ell_B \( E_1 \) \) a_theta \( ell_B \( E_2 \) \)$. The change is a nonnegative kernel supported where at least one exclusive logarithm is at most $2 theta$. Lemma 29 bounds its operator norm by

$ O \( \( 2 theta + 1 \/ R \)^(1 \/ 4) \) + O \( B^(- 70) + B^5 \/ P_0 \) . $

Choose also a smooth upper cutoff equal to one on $\[ 0 \, 3 \]$ and supported below $16 \/ 5$. On the positive axis let $f_(1 \/ 4 \, B)^(upright("cut"))$ be the product of this upper cutoff, $a_theta$, and $f_(1 \/ 4 \, B)$, extended by zero to the real line. For each fixed $theta$, all derivatives of any fixed order of this function are bounded uniformly in $B$. This follows from the derivative bounds for $f_(1 \/ 4 \, B)$ established before Proposition 11; the cutoff keeps the argument away from zero. The upper cutoff changes none of the probabilities relevant to the output interval $I$.

For completeness, the weighted version of the local law used here follows directly from its interval version. For fixed $z = ell_B \( c \)$ and a fine interval $J$, apply (3.3) to subintervals of $\( J - z \) ∩ \[ theta \, 3 \]$. The difference between the exclusive-product measure and the density $f_(1 \/ 4 \, B) \( t \) thin d t$ has cumulative integral $O \( B^(- 80) \)$ there. Stieltjes integration by parts against $a_theta$ bounds its weighted integral by $O_theta \( B^(- 80) \)$: the endpoint values and the total variation of $a_theta$ are bounded. Thus, uniformly in $c \, J$,

$ bb(E) #h(-0.16667em) [a_theta \( ell_B \( E \) \) upright(bold(1))_({ ell_B \( c E \) in J })] = integral_J f_(1 \/ 4 \, B)^(upright("cut")) \( x - ell_B \( c \) \) thin d x + O_theta \( B^(- 80) \) . $

Conditional independence of the two exclusives now identifies the weighted step kernel, up to $O_theta \( B^(- 70) \)$ in operator norm, with the fine-cell compression of the continuous kernel

#[#set math.equation(numbering: n => "(7.6)")
 $ K_(B \, theta) \( x \, y \) = bb(E)_C #h(-0.16667em) [f_(1 \/ 4 \, B)^(upright("cut")) \( x - ell_B \( C \) \) f_(1 \/ 4 \, B)^(upright("cut")) \( y - ell_B \( C \) \)] \, #h(2em) \( x \, y \) in I^2 . $ <eq:channels-smooth-kernel>]

Indeed multiplying the two weighted cell formulas makes an $O_theta \( B^(- 80) \)$ error in each cell-pair probability; division by $delta_B^2$ still leaves an operator error smaller than $O_theta \( B^(- 70) \)$.

The kernel in (7.6) and its first derivatives are bounded uniformly in $B$, with constants depending on $theta$. Differentiation may be taken under the expectation because the cut densities and their derivatives have uniform bounds and the law of $C$ is a probability measure. In particular no limiting law for $C$, and no derivative bound for that law, is needed. Let $cal(T)_(B \, theta)$ be the integral operator with this kernel. If $a = \| I \| \/ m_1$ is the coarse mesh, the mean value theorem gives

$ sup_(x \, y in I) lr(|K_(B \, theta) \( x \, y \) - \( P_(m_1)^(\( x \)) P_(m_1)^(\( y \)) K_(B \, theta) \) \( x \, y \)|) lt.double_theta a . $

Here the two superscripts denote averaging the indicated kernel coordinate. Schur’s inequality consequently gives

#[#set math.equation(numbering: n => "(7.7)")
 $ parallel cal(T)_(B \, theta) - P_(m_1) cal(T)_(B \, theta) P_(m_1) parallel lt.double_theta m_1^(- 1) . $ <eq:channels-coarse-kernel>]

Write $Q = 1 - P_(m_1)$. Fine and coarse averaging commute, and fine averaging is a contraction. Therefore

$ parallel Q P_(upright("fine")) cal(T)_(B \, theta) P_(upright("fine")) Q parallel lt.eq parallel Q cal(T)_(B \, theta) Q parallel lt.double_theta m_1^(- 1) . $

Combining this with the independent-model comparison and the cutoff estimate proves, for every fixed $theta \, m_1$,

$ parallel Q U_1 parallel^2 & = parallel Q U_1 U_1^(*) Q parallel\
 & lt.eq C \( 2 theta + 1 \/ R \)^(1 \/ 4) + C_theta m_1^(- 1) + o_(theta \, m_1) \( 1 \) . $

Given $epsilon.alt_1 > 0$, first choose $theta$ so that $C \( 2 theta \)^(1 \/ 4) < epsilon.alt_1^2 \/ 4$, and then choose $m_1$ so that $C_theta \/ m_1 < epsilon.alt_1^2 \/ 4$. Taking the upper limit in $B$ and the square root proves (7.3), and completes the proof of Proposition 27.

#thm([Corollary 7.4.])[
  (Coarse site features).  #emph[For the chosen coarse partition, define 
$ V_l \( S \) = frac(1, \| I_l \|) bb(P)_(upright("split")) \( x_b in I_l divides S \) . $

 Then $0 lt.eq V_l lt.eq \| I_l \|^(- 1)$, and for every $g in L^2 \( Omega_B \)$ the coarse value of $P_(m_1) u_g$ on $I_l$ is exactly 
$ bb(E) \[ g \( S \) V_l \( S \) \] . $

 In particular the bounds (7.2)–(7.3) and this identity hold uniformly when $g$ varies with a position, with $B$, or with an external parameter.]
] <cor:channels-features>

#proof[
  Integrating (7.1) with $d = 1$ over $I_l$ sums precisely the fine cells contained in $I_l$. The result is $bb(E) \[ g \( S \) bb(P)_(upright("split")) \( x_b in I_l divides S \) \]$. Divide by $\| I_l \|$. The bounds on $V_l$ follow from its definition; the final uniformity follows because the preceding results are operator bounds rather than fixed-input limits. ◻
]

== 8 Integral approximation by endpoint features <sec:kernel>

We now approximate the latent matrix $cal(L)$ from (5.8) after integrating over its endpoint types. For an allowed pair $k = i + j$ with $j > 0$, let $S_i \, S_k$ be independent site types and let $g \, h : Omega_B arrow.r \[ - 1 \, 1 \]$ be real measurable functions. The quantity to be approximated is

$ bb(E)_(S_i \, S_k) #scale(x: 120%, y: 120%)[\[] cal(L)_(i k) \( S_i \, S_k \; s \) g \( S_i \) h \( S_k \) #scale(x: 120%, y: 120%)[\]] . $

For a coarse partition supplied by (7.3) at a chosen accuracy $epsilon.alt_1$, let $V_l$ be the features from Corollary 30. Our target is a finite sum of scalar multiples of

$ bb(E) \[ g \( S \) V_l \( S \) \] thin bb(E) \[ h \( S \) V_l \( S \) \] . $

The coefficients may depend on $B \, j \, s \, l$, but not on the tests. The partition is fixed before $B$ tends to infinity. The comparison will be uniform in the tests, allowing a different function at every position. After summing over allowed pairs and dividing by $M$, its error will be controlled by the loss $e^(- c_3 C_(*))$ from removing regularity restrictions, the chosen coarse accuracy $epsilon.alt_1$, and a term tending to zero. The final proposition records the constants and their parameter dependence. Section 9 then converts this integrated comparison into control for tests chosen after the whole matrix is sampled.

Throughout this section the regularity grid and its tolerances are fixed, as are $C_(*)$, $eta > 0$, and $C_6$. The parameter $B$ tends to infinity, $T = floor.l B^0.32 floor.r$, and $eta T lt.eq j lt.eq T$. All estimates involving the smooth parameter $s$ are uniform on the fixed compact interval containing its support. Constants with a subscript $eta$ may depend on $eta$; constants without that subscript in the cutoff-removal estimate below do not. The parameter $x$ from the original counting problem does not occur in this section. The letters $x \, y$ below denote log coordinates in $I = \[ 1 \/ 2 \, 3 \]$.

=== 8.1 Removing the regularity restrictions <removing-the-regularity-restrictions>

Let $S in Omega_B$ have the independent-site law: each prime in $cal(P)$ belongs to $S$ independently with probability $1 \/ p$. A fair split of $S$ selects each of its primes independently with probability $1 \/ 2$; write $b$ for the product of the selected primes. The unconditional law of $b$ is $nu_(1 \/ 2)$. For a real measurable function $g$ on the site space, define the signed mass

$ gamma_g \( n \) = bb(E) #scale(x: 120%, y: 120%)[\[] g \( S \) upright(bold(1))_({ b = n }) #scale(x: 120%, y: 120%)[\]] . $

In particular, $\| gamma_g \( n \) \| lt.eq nu_(1 \/ 2) \( n \)$ whenever $\| g \| lt.eq 1$. All statements below allow $g$ to depend on $B$.

For a subset product $b$ of $S$, the untruncated weights satisfy the exact identity

$ A_0 \( b \) K_0 \( S \\ b \) = \( log P_0 \) R thin 2^(- \| S \|) = B thin 2^(- \| S \|) . $

The factor $2^(- \| S \|)$ is the conditional probability of each fair split. This identity connects the endpoint weights with the unrestricted splits defining the channels. The next lemma bounds the cost of removing the regularity indicators inside the integrated test; after that removal, the endpoint averages are the unrestricted ones defining the channels.

#thm([Lemma 8.1.])[
  (Uniform removal of cutoffs).  #emph[Let $k = i + j$ be an allowed pair with $j > 0$, and let $\| g \| \, \| h \| lt.eq 1$. Replacing the coefficient and remaining-site regularity restrictions in $bb(E) \[ cal(L)_(i k) g \( S_i \) h \( S_k \) \]$ by no restrictions, while keeping the scalar $k_B$, incurs an absolute error at most 
#[#set math.equation(numbering: n => "(8.1)")
 $ C frac(Sigma \( j \), T) #scale(x: 120%, y: 120%)[\(] r_B + e^(- c_3 C_(*)) #scale(x: 120%, y: 120%)[\)] \, #h(2em) r_B arrow.r 0 . $ <eq:33>]

 Here $r_B$ may depend on the fixed regularity parameters and on $C_(*)$, but the constant $C$ is independent of $C_(*)$, $eta$, and $C_6$. The pairwise gcd restrictions may then be removed at an additional error $O \( B^(- 998) \)$. The resulting integral is 
#[#set math.equation(numbering: n => "(8.2)")
 $ k_B B sum_(a - b = j c) gamma_g \( b \) gamma_h \( a \) A_0 \( c \) rho_0 \( log c \/ B \) Psi_s #scale(x: 120%, y: 120%)[\(] a \/ \( T c \) \, b \/ \( T c \) #scale(x: 120%, y: 120%)[\)] . $ <eq:34>]

 The sum is over positive integers $a \, b \, c$.]
] <lem:kernel-cutoffs>

#proof[
  Applying the subset identity above at both endpoints in (5.8) turns their subset sums into fair-split expectations, still with regularity indicators attached to the selected and unselected sets, and changes the coefficient $k_B \/ B$ into $k_B B$. The remaining coefficient is $c = \( a - b \) \/ j$, and its weight is $A_0 \( c \)$ times its regularity indicator.
  All weights other than $g \, h$ are nonnegative. We may therefore bound the cost of removing an indicator by putting $\| g \| \, \| h \| lt.eq 1$ and summing the corresponding positive mass. On the support under consideration, $c asymp X$, $a \, b asymp T X$, and $0.9 B lt.eq log X lt.eq 2.2 B$. There are $O \( B \)$ dyadic choices of $X$. Formula (3.5) bounds the split-product probabilities by
  $ nu_(1 \/ 2) \( a \) nu_(1 \/ 2) \( b \) lt.double frac(A_0 \( a \) A_0 \( b \), B^2 a b) . $
  Consequently the untruncated mass in one such box is at most
  $ C / B sum_(a - b = j c\
c asymp X \, med a \, b asymp T X) frac(A_0 \( a \) A_0 \( b \) A_0 \( c \), a b) lt.double frac(Sigma \( j \), B T) $
  by (3.8), since $a b asymp T^2 X^2$. If any one of the three coefficients is nonregular, (3.11) gives the same bound with the additional factor $r_B + e^(- c_3 C_(*))$. Summing over the boxes proves the required estimate for coefficient failures.
  It remains to treat the two unselected endpoint sets. At a given prime $p$, the probabilities of the three possibilities “selected”, “unselected”, and “absent” are respectively $1 \/ \( 2 p \) \, 1 \/ \( 2 p \) \, 1 - 1 \/ p$. Conditional on the selected product being $a$, the unselected indicators at primes not dividing $a$ are therefore independent with probabilities
  $ frac(1 \/ \( 2 p \), 1 - 1 \/ \( 2 p \)) = frac(1, 2 p - 1) . $
  At primes dividing $a$ they are zero. The same statement holds for $b$, independently at the other site. Each selected coefficient on our support has log size $O \( B \)$, and all its prime factors exceed $P_0$. In particular, the reciprocal sum of its prime factors is $O \( B \/ P_0 \)$. The uniform cutoff probability estimate established after (3.11) thus bounds either unselected-set failure by $r_B + O \( e^(- c_3 C_(*)) \)$, uniformly in the chosen coefficients. Multiplying by the preceding positive mass bound and summing the boxes proves (8.1). This argument uses (3.8) and (3.11) for $1 lt.eq j lt.eq T$; it has made no use of $j gt.eq eta T$ or of the block length $M$. This proves the asserted independence of its constant.
  Finally, if one of $\( a \, b \) \, \( a \, c \) \, \( b \, c \)$ exceeds one, a prime dividing both $a$ and $b$ must occur. Indeed $a - b = j c$, and every prime factor of a coefficient is greater than $P_0 > j$. The split products at the two sites are independent, so the probability of a common selected prime is at most
  $ sum_(p in cal(P)) frac(1, 4 p^2) lt.double P_0^(- 1) . $
  For a fixed pair of selected products there is at most one value of $c$, and the remaining positive integrand is at most $C B sup_c A_0 \( c \)$. Since $sup A_0 lt.eq \( log P_0 \) R^(1 \/ 2) = B^(1 \/ 2 + o \( 1 \))$, the resulting error is $O \( B^(3 \/ 2 + o \( 1 \)) \/ P_0 \)$. After removal of these restrictions, the fair splits and independence of the two sites give (8.2) exactly. ◻
]

=== 8.2 Fourier detection and the discarded arcs <fourier-detection-and-the-discarded-arcs>

The support of (8.2) already predicts the structure of its real-variable comparison. For a nonzero term put

$ x = frac(log a, B) \, #h(2em) y = frac(log b, B) \, #h(2em) u_1 = frac(a, T c) \, #h(2em) u_2 = frac(b, T c) . $

The exact relation $a - b = j c$ gives

$ u_1 - u_2 = j / T \, #h(2em) B \( x - y \) = log \( u_1 \/ u_2 \) . $

Since $u_1 \, u_2$ lie in a fixed compact subinterval of $\( 1 \, 2 \)$, the two log coordinates satisfy $0 < x - y lt.double B^(- 1)$. We will enforce the discrete relation by additive Fourier orthogonality. This places the $c$ sum in a factor to which the arithmetic estimates apply, while the two signed endpoint sums are controlled by their mass and $L^2$ bounds. For the surviving small denominators, the channel estimates allow us to average the residue dependence of the endpoint tests with a uniform error, leaving an explicit finite residue sum. Fourier inversion will then give an integral on the narrow logarithmic band, where the coarse channel approximation produces the feature products described above.

We first analyze (8.2) in a single smooth dyadic box. Choose a smooth compactly supported dyadic partition of unity on $\( 0 \, oo \)$ for the variable $c$, and write $X = 2^m$, $N_X = T X$. A box has $c \/ X$ in a fixed compact subinterval of $\( 0 \, oo \)$. On the support of $Psi_s$, both $a \/ N_X$ and $b \/ N_X$ are also in fixed positive compact intervals. The smooth weight in the three variables

$ \( a \/ N_X \, b \/ N_X \, c \/ X \) $

has all fixed-order derivatives bounded uniformly in $m \, B \, s$. This includes $rho_0 \( \( log X + log \( c \/ X \) \) \/ B \)$, whose differentiated log-scale factors only improve the bound.

Extend this weight smoothly inside a larger fixed cube, expand the extension in a periodic Fourier series, and multiply each coordinate factor by a fixed smooth compact cutoff equal to one on the original support. We obtain a sum of separated products

$ w_1 \( a \/ N_X \) w_2 \( b \/ N_X \) w_3 \( c \/ X \) . $

More precisely, if $bold(nu) in bb(Z)^3$ indexes the Fourier terms, their scalar coefficients are $O_A \( \( 1 + \| bold(nu) \| \)^(- A) \)$ for every fixed $A$, uniformly in the boxes and in $s$. The fixed-order smooth norms of the factors grow at most polynomially in $\| bold(nu) \|$. All estimates below have only finitely many such smooth-norm losses; choosing $A$ larger than those losses plus four makes every Fourier sum absolutely convergent. When a bound is summed over boxes, we use the uniform coefficient bound at each fixed $bold(nu)$. It therefore suffices to write the calculation for one separated term.

For that term set

$ S_1 \( alpha \) & = sum_a gamma_h \( a \) w_1 \( a \/ N_X \) e \( a alpha \) \,\
S_2 \( alpha \) & = sum_b gamma_g \( b \) w_2 \( b \/ N_X \) e \( b alpha \) \,\
S_3 \( alpha \) & = sum_c A_0 \( c \) w_3 \( c \/ X \) e \( c alpha \) . $

Additive orthogonality expresses its contribution as

$ k_B B integral_0^1 S_1 \( alpha \) S_2 \( - alpha \) S_3 \( - j alpha \) thin d alpha . $

The elementary product formula and Mertens’ estimate give

$ 0 lt.eq k_B lt.eq bb(E) K_0 \( S \) = R^(1 \/ 2) product_(p in cal(P)) \( 1 - 1 \/ \( 2 p \) \) lt.double 1 \, $

uniformly in the truncation constant. By (3.5), (3.6), and Parseval,

#[#set math.equation(numbering: n => "(8.3)")
 $ integral_0^1 \| S_i \( alpha \) \|^2 thin d alpha lt.double frac(1, B^2 N_X^2) sum_(n asymp N_X) A_0 \( n \)^2 lt.double B^(- 2 + 1 \/ 4 + o \( 1 \)) / N_X \, #h(2em) i = 1 \, 2 . $ <eq:35>]

The first-moment part of (3.6) also gives

#[#set math.equation(numbering: n => "(8.4)")
 $ sup_alpha \| S_i \( alpha \) \| lt.double B^(- 1) \, #h(2em) i = 1 \, 2 . $ <eq:kernel-trivial-sums>]

The implicit constants here and below include the specified smooth norms of the separated factors.

On the circle of $j alpha med \( mod med 1 \)$, take major arcs of radius $B^13 \/ X$ about the reduced fractions $u \/ q$ with $q lt.eq B^12$. They are disjoint for large $B$: the distance between distinct such fractions is at least $B^(- 24)$, whereas $X$ is exponential in $B$. On the complement we have

#[#set math.equation(numbering: n => "(8.5)")
 $ \| S_3 \( - j alpha \) \| lt.double X B^(- 1 \/ 2 + o \( 1 \)) . $ <eq:36>]

Here are the details of the imported estimate and its application. The Montgomery–Vaughan bound #cite(label("MontgomeryVaughan1977")) Corollary 1 states that a multiplicative function $f$ satisfying $\| f \( p \) \| lt.eq 1$ for every prime $p$ and $sum_(n lt.eq Z) \| f \( n \) \|^2 lt.eq Z$ for every $Z gt.eq 1$ obeys

$ lr(|sum_(n lt.eq Y) f \( n \) e \( n theta \)|) lt.double frac(Y, log Y) + frac(Y \( log R' \)^(3 \/ 2), sqrt(R')) $

whenever $\| theta - u' \/ q' \| lt.eq 1 \/ \( q' \)^2$, $\( u' \, q' \) = 1$, and $2 lt.eq R' lt.eq q' lt.eq Y \/ R'$. Apply Dirichlet approximation with denominator limit $floor.l X \/ B^12 floor.r$. If the resulting denominator is at most $B^12$, the approximation error is at most $2 B^12 \/ X < B^13 \/ X$, so the point is on a major arc. Off the major arcs we consequently have

$ B^12 < q' lt.eq X \/ B^12 \, #h(2em) \| theta - u' \/ q' \| lt.eq 1 \/ \( q' \)^2 . $

For every $Y asymp X$ arising in partial summation, these inequalities permit $R' = B^10$. The function $f \( n \) = mu_(upright("Mob"))^2 \( n \) 2^(- omega \( n \)) upright(bold(1))_({ n med upright("rough") })$ is multiplicative and 1-bounded, so it satisfies the theorem’s hypotheses. Smooth partial summation and restoration of the factor

$ \( log P_0 \) R^(1 \/ 2) = sqrt(B log P_0) = B^(1 \/ 2 + o \( 1 \)) $

give (8.5).

For later reference, if a discarded region satisfies $\| S_3 \| lt.double X B^(- a + o \( 1 \))$, its contribution in one box is at most

#[#set math.equation(numbering: n => "(8.6)")
 $ C B thin X B^(- a + o \( 1 \)) frac(B^(- 7 \/ 4 + o \( 1 \)), T X) = B^(- 3 \/ 4 - a + o \( 1 \)) / T \, $ <eq:kernel-discarded-power>]

by Cauchy–Schwarz and (8.3). Summing over the $O \( B \)$ boxes gives a total minor-arc error of

$ B^(- 1 \/ 4 + o \( 1 \)) / T . $

On a major arc, apply (3.2) to $S_3$. When $q > B^0.4$, its main term is at most $X \/ phi \( q \) lt.double X B^(- 0.4 + o \( 1 \))$, uniformly along the arc. Formula (8.6) shows that these arcs cost $B^(- 0.15 + o \( 1 \)) \/ T$ in total. The error $O \( X B^(- 50) \)$ in (3.2), on all the major arcs together, costs at most $B^(- 49.75 + o \( 1 \)) \/ T$. All three errors are uniform in the endpoint tests and are $o \( 1 \/ T \)$.

Put $Q = B^0.4$. The remaining arcs for $alpha$ have the following exact parametrization:

$ d = j q \, #h(2em) h' med \( mod med d \) \, #h(2em) \( h' \, q \) = 1 \, #h(2em) alpha = h' / d + frac(xi, j X) \, #h(2em) \| xi \| lt.eq B^13 . $

For each reduced fraction on the $j alpha$ circle there are exactly $j$ lifts in this list. In particular the parametrization neither omits nor repeats an arc. Define

$ hat(w)_(3 \, B \, X) \( xi \) = integral w_3 \( z \) m_B \( log \( X z \) \/ B \) e \( - xi z \) thin d z . $

These transforms are uniformly Schwartz, with bounds controlled by fixed smooth norms. The main term from (3.2) contains the factor $X$, while $d alpha = d xi \/ \( j X \)$. The resulting box expression is therefore

#[#set math.equation(numbering: n => "(8.7)")
 $ frac(k_B B, j) sum_(q lt.eq Q) frac(mu_(upright("Mob")) \( q \), phi \( q \)) sum_(h' med mod med d\
\( h' \, q \) = 1) integral_(bb(R)) hat(w)_(3 \, B \, X) \( xi \) S_1 (h' / d + frac(xi, j X)) S_2 (- h' / d - frac(xi, j X)) thin d xi . $ <eq:37>]

In this formula the integration has been extended from $\[ - B^13 \, B^13 \]$ to $bb(R)$. To justify it, use (8.4), the bound of $j phi \( q \)$ for the number of lifts at denominator $q$, and a Schwartz bound of any sufficiently large fixed order. The number of boxes and the total arc count are polynomial in $B$, so the tails give $o \( 1 \/ T \)$ after all sums. Notice also that $d lt.eq T Q lt.eq B^0.72 < B$, as required for the channel estimates.

=== 8.3 Fine histograms and residue averaging <fine-histograms-and-residue-averaging>

The discarded arcs already have negligible total contribution. The remaining major arcs carry a logarithmic coordinate and a unit residue at each endpoint. We next use the channel bounds to retain the former while averaging the latter, uniformly for the endpoint tests.

We replace the split-product measures in (8.7) by the fine log and residue histograms of (7.1). For instance, the replacement for its first sum is

#[#set math.equation(numbering: n => "(8.8)")
 $ frac(1, phi \( d \)) sum_(r in cal(R)_d) e \( h' r \/ d \) integral_I U_d h \( x \, r \) w_1 \( e^(B x) \/ N_X \) e \( xi e^(B x) \/ \( j X \) \) thin d x . $ <eq:38>]

The residue phases have not been approximated. We give the norm estimate which controls this step, its denominator sum, and the subsequent residue projection.

Let $I_X subset I$ be an enlarged log window about $log N_X \/ B$, of length $O \( 1 \/ B \)$, which contains all fine cells meeting the support of the factors in a box. These windows have bounded overlap as $X$ ranges over its dyadic values, because successive centers are spaced by $\( log 2 \) \/ B$. They lie in the interior of $I$ for large $B$. If $F$ is supported in $I_X$ and bounded, finite Fourier Parseval on $bb(Z) \/ d bb(Z)$, with the residue vector extended by zero off the units, gives

#[#set math.equation(numbering: n => "(8.9)")
 $ & sum_(h' med mod med d) lr(|frac(1, phi \( d \)) sum_(r in cal(R)_d) e \( h' r \/ d \) integral_(I_X) V \( x \, r \) F \( x \) thin d x|)^2\
 & #h(12mm)  lt.eq frac(d, phi \( d \)) thin \| I_X \| thin parallel F parallel_oo^2 parallel V parallel_(L^2 \( I_X times cal(R)_d \))^2 . $ <eq:39>]

Indeed the exact finite Fourier identity, before applying Cauchy–Schwarz to the integrals, is

$ sum_(h' med mod med d) lr(|frac(1, phi \( d \)) sum_(r in cal(R)_d) e \( h' r \/ d \) v_r|)^2 = frac(d, phi \( d \)) frac(1, phi \( d \)) sum_(r in cal(R)_d) \| v_r \|^2 . $

Here and throughout, the residue component of the $L^2$ norm uses uniform probability on $cal(R)_d$.

For clarity, the histogram replacement can be estimated even when the signed masses $gamma_g$ have no regularity whatsoever. For a fine cell $J$ and a unit residue $r$, the definition (7.1) says exactly that

$ frac(1, phi \( d \)) integral_J U_d h \( x \, r \) thin d x = bb(E) #scale(x: 120%, y: 120%)[\[] h \( S \) upright(bold(1))_({ log b \/ B in J \, med b equiv r med \( d \) }) #scale(x: 120%, y: 120%)[\]] . $

For $F \( x \) = w_1 \( e^(B x) \/ N_X \) e \( xi e^(B x) \/ \( j X \) \)$, differentiation on the relevant enlarged window gives

$ parallel F' parallel_oo lt.eq C_(w \, eta) \( 1 + \| xi \| \) B . $

We used $e^(B x) asymp T X$ and $j gt.eq eta T$. Thus the oscillation of $F$ on a fine cell is at most

$ a_B \( xi \) := C_(w \, eta) \( 1 + \| xi \| \) B delta_B . $

After taking the factor $1 \/ phi \( d \)$ outside as in (8.8), the residue vector of the replacement error has absolute value at residue $r$ at most

$ a_B \( xi \) integral_(I_X) U_d 1 \( x \, r \) thin d x . $

This follows by subtracting the cell average of $F$ from its value at the actual split product and using $\| h \| lt.eq 1$. Positivity of the measure for $U_d 1$ is the only pointwise information used. Formula (8.9) therefore bounds the squared sum of this error over $h'$ by

$ C frac(d, phi \( d \)) \| I_X \| thin a_B \( xi \)^2 parallel U_d 1 parallel_(L^2 \( I_X times cal(R)_d \))^2 . $

The actual, unreplaced sum has the same type of estimate without $a_B$, by bounding its residue vector with $parallel F parallel_oo integral_(I_X) U_d 1$. The replaced sum has (8.9) directly with $V = U_d h$.

We apply these estimates to the difference of the two products in (8.7), replacing one factor at a time. Cauchy–Schwarz over $h'$ is valid even though the sum is restricted by $\( h' \, q \) = 1$, since extending either squared sum to all residues increases it. Afterwards Cauchy–Schwarz over the boxes and bounded overlap of $I_X$ bound the sum of products of local norms by the product of global norms. These global norms are bounded by (7.2). Finally the Schwartz moments absorb the factors $1 + \| xi \|$, as well as the polynomial smooth losses in the separated expansion. Since $\| I_X \| lt.double 1 \/ B$, this proves that at a fixed $q$ the total histogram error, including all boxes, is at most

#[#set math.equation(numbering: n => "(8.10)")
 $ C_eta / j frac(1, phi \( q \)) frac(j q, phi \( j q \)) thin B delta_B . $ <eq:kernel-histogram-q>]

In particular, the number $O \( B \)$ of boxes has not introduced an extra factor of $B$: the local window length cancels the $B$ in (8.7), and the remaining local norms are summed by bounded overlap.

We record explicitly a bound for the denominator sum. The elementary inequality

$ frac(j q, phi \( j q \)) lt.eq frac(j, phi \( j \)) frac(q, phi \( q \)) $

and partial summation imply

#[#set math.equation(numbering: n => "(8.11)")
 $ sum_(q lt.eq Q) frac(1, phi \( q \)) frac(j q, phi \( j q \)) lt.double frac(j, phi \( j \)) log \( 2 Q \) . $ <eq:kernel-denominator-sum>]

For completeness, to verify the required mean-value input write $\( n \/ phi \( n \) \)^2 = sum_(d divides n) b \( d \)$, where $b$ is supported on squarefree integers and

$ b \( p \) = \( 1 - 1 \/ p \)^(- 2) - 1 = O \( 1 \/ p \) . $

All these coefficients are nonnegative, and

$ sum_d frac(b \( d \), d) = product_p \( 1 + b \( p \) \/ p \) < oo . $

Hence $sum_(q lt.eq Q) \( q \/ phi \( q \) \)^2 lt.double Q$, which after partial summation gives (8.11). Since $j \/ phi \( j \) = B^(o \( 1 \))$ uniformly for $j lt.eq T$ and $B delta_B asymp B^(- 1 \/ 10)$, summing (8.10) gives $o \( 1 \/ T \)$, uniformly on the allowed lag range.

We now replace $U_d h \, U_d g$ in the histogram expression by their residue averages $u_h \, u_g$. Expand the difference of products one factor at a time and repeat (8.9). The only new input is

$ parallel U_d h - u_h parallel_2 + parallel U_d g - u_g parallel_2 lt.double B^(- c_7) $

from (7.2), uniformly in $d lt.eq B$ and the bounded tests. It follows that the error is bounded by

$ C_eta / j frac(j, phi \( j \)) log \( 2 Q \) B^(- c_7) = o \( 1 \/ T \) . $

This establishes the residue projection for arbitrary bounded single-site tests, rather than just for the constant test.

=== 8.4 The exact residue factor <the-exact-residue-factor>

After the channel projection, the endpoint tests no longer depend on a residue coordinate. The remaining finite residue sum can therefore be computed exactly; it is the arithmetic factor governing the allowed lags.

After residue averaging, the unit phase average in (8.8) is $c_d \( h' \) \/ phi \( d \)$, where

$ c_d \( h' \) = sum_(r in cal(R)_d) e \( h' r \/ d \) $

is the Ramanujan sum. The second endpoint contributes its complex conjugate phase average. Since the coefficient of a nonsquarefree $q$ in (8.7) is zero, only squarefree $q$ matter. For such $q$ the exact identity is

#[#set math.equation(numbering: n => "(8.12)")
 $ sum_(h' med mod med j q\
\( h' \, q \) = 1) frac(\| c_(j q) \( h' \) \|^2, phi \( j q \)^2) = cases(delim: "{", frac(j, phi \( j \) phi \( q \)) \, & \( j \, q \) = 1 \,, 0 \, & \( j \, q \) > 1 .) $ <eq:40>]

Here is a direct proof that also covers nonsquarefree $j$. If $p divides \( j \, q \)$, the modulus $j q$ is divisible by $p^2$, while $\( h' \, q \) = 1$ forces $p divides.not h'$. For every $a gt.eq 2$,

$ c_(p^a) \( h' \) = sum_(r med mod med p^a) e \( h' r \/ p^a \) - sum_(r med mod med p^(a - 1)) e \( h' r \/ p^(a - 1) \) = 0 quad \( p divides.not h' \) . $

Chinese remaindering therefore makes the whole Ramanujan sum zero. If $\( j \, q \) = 1$, the Ramanujan sums split over the two coprime moduli. At the squarefree modulus $q$, a unit frequency has $c_q \( h' \) = mu_(upright("Mob")) \( q \)$, of absolute value one. At modulus $j$, orthogonality gives

$ sum_(h' med mod med j) \| c_j \( h' \) \|^2 = sum_(r \, r' in cal(R)_j) sum_(h' med mod med j) e \( h' \( r - r' \) \/ j \) = j phi \( j \) . $

The numerator on the left of (8.12) is thus $j phi \( j \) phi \( q \)$, and division by $phi \( j q \)^2 = phi \( j \)^2 phi \( q \)^2$ proves the identity.

Combining (8.12) with the factor $mu_(upright("Mob")) \( q \) \/ phi \( q \)$ in (8.7) yields the singular series

#[#set math.equation(numbering: n => "(8.13)")
 $ frak(S) \( j \) = frac(j, phi \( j \)) sum_(\( q \, j \) = 1) frac(mu_(upright("Mob")) \( q \), phi \( q \)^2) = frac(j, phi \( j \)) product_(p divides.not j) (1 - frac(1, \( p - 1 \)^2)) . $ <eq:41>]

The series is absolutely convergent: for every fixed $epsilon.alt > 0$, $1 \/ phi \( q \) lt.double_epsilon.alt q^(- 1 + epsilon.alt)$, so

$ sum_(q > Q) frac(1, phi \( q \)^2) lt.double_epsilon.alt Q^(- 1 + 2 epsilon.alt) quad \( 0 < epsilon.alt < 1 \/ 2 \) . $

This tail bound is independent of $j$. Also

$ 0 lt.eq frak(S) \( j \) lt.eq j \/ phi \( j \) . $

The series vanishes when $j$ is odd, consistently with the parity obstruction in $a - b = j c$ for rough coefficients.

After the residue projection, the archimedean integrals in (8.7) no longer depend on $q$. The total over boxes of their absolute values, before the factor $B \/ j$, is $O \( 1 \/ B \)$: apply Cauchy–Schwarz on their log windows, then use bounded overlap and $parallel u_g parallel_2 \, parallel u_h parallel_2 lt.double 1$. The Schwartz integrations and smooth expansions have the same summability as before. It follows that replacing the sum $q lt.eq Q$ by (8.13) costs at most

#[#set math.equation(numbering: n => "(8.14)")
 $ C / j frac(j, phi \( j \)) sum_(q > Q) frac(1, phi \( q \)^2) . $ <eq:kernel-series-tail>]

In particular this is a uniform vanishing multiple of $\( j \/ phi \( j \) \) \/ j$.

=== 8.5 Archimedean inversion and coarse features <archimedean-inversion-and-coarse-features>

For one separated box, the phase remaining in the product of archimedean integrals is

$ e (xi frac(e^(B x) - e^(B y), j X)) . $

Fourier inversion in $xi$ therefore evaluates $w_3 \( z' \) m_B \( log \( X z' \) \/ B \)$ at $z' = \( e^(B x) - e^(B y) \) \/ \( j X \)$. The inversion introduces no further Jacobian: its integration variable is $xi$. Recombining the separated factors and the dyadic partition gives

#[#set math.equation(numbering: n => "(8.15)")
 $ & frac(k_B B, j) frak(S) \( j \) integral_(x > y\
x \, y in I) u_h \( x \) u_g \( y \) m_B \( z \) rho_0 \( z \)\
 & #h(14mm)  dot.op Psi_s (frac(lambda e^(B \( x - y \)), e^(B \( x - y \)) - 1) \, frac(lambda, e^(B \( x - y \)) - 1)) thin d x thin d y \,\
 & #h(8mm)  lambda = j / T \, #h(2em) z = 1 / B log (frac(e^(B x) - e^(B y), j)) . $ <eq:42>]

Weights are interpreted as zero off their positive domains and supports. The inversions and rearrangements are justified for $u_g \, u_h in L^2 \( I \)$ by the bounded log windows, the Schwartz transforms, and the absolutely summable smooth expansion, with the absolute-product bound just used for (8.14).

We spell out the support properties needed to approximate (8.15). There is a compact interval $\[ a_0 \, b_0 \] subset \( 1 \, 2 \)$ containing the support of $psi$. Write $v = B \( x - y \)$. If the $Psi_s$ factor is nonzero, its two arguments $u_1 \, u_2$ lie in $\[ a_0 \, b_0 \]$, with

$ u_1 - u_2 = lambda \, #h(2em) e^v = u_1 \/ u_2 . $

For $eta lt.eq lambda lt.eq 1$, this implies

#[#set math.equation(numbering: n => "(8.16)")
 $ 0 < c_eta lt.eq v lt.eq C \, #h(2em) c_eta = log \( 1 + eta \/ b_0 \) \, quad C = log \( b_0 \/ a_0 \) . $ <eq:kernel-v-support>]

If these inequalities have no solution for a particular $lambda$, the weight is simply zero. On this support,

$ z = y + frac(log \( e^v - 1 \) - log j, B) = y + O_eta \( log T \/ B \) . $

The functions $m_B rho_0$, extended by zero beyond a fixed compact interval inside $\( 0 \, 4 \)$, converge uniformly to $m rho_0$, with uniformly bounded derivatives. It follows that

$ m_B \( z \) rho_0 \( z \) = m \( y \) rho_0 \( y \) + o_eta \( 1 \) $

uniformly wherever the integrand can be nonzero.

To quantify its effect for arbitrary tests, consider the integral operator with nonnegative kernel

$ B upright(bold(1))_({ 0 < x - y < C \/ B }) \, #h(2em) x \, y in I . $

Its row and column integrals are at most $C$, so Schur’s inequality gives a uniform $L^2$ operator bound. Multiplication by the bounded smooth weights preserves that bound. Since $parallel u_g parallel_2 \, parallel u_h parallel_2 lt.double 1$, the replacement of $m_B \( z \) rho_0 \( z \)$ in (8.15) costs $o_eta \( 1 \) frak(S) \( j \) \/ j$.

Given $epsilon.alt_1 > 0$, choose the fixed coarse partition in (7.3), and write $u_g^(upright(c)) = P_(m_1) u_g$, $u_h^(upright(c)) = P_(m_1) u_h$. The same operator bound and the contraction property of $P_(m_1)$ show that replacing the two endpoint functions by $u_g^(upright(c)) \, u_h^(upright(c))$ costs at most

$ C_eta \( epsilon.alt_1 + o \( 1 \) \) frac(frak(S) \( j \), j) . $

This constant does not grow with the chosen coarse partition; the errors tending to zero may of course depend on that fixed partition. Its coarse functions satisfy

$ parallel u_g^(upright(c)) parallel_oo \, med parallel u_h^(upright(c)) parallel_oo lt.eq max_l \| I_l \|^(- 1 \/ 2) max \( parallel u_g parallel_2 \, parallel u_h parallel_2 \) lt.double_(m_1) 1 . $

By (8.16), $x$ and $y$ belong to the same coarse cell except when $y$ is within $C \/ B$ of one of the finitely many cell boundaries. The area of these exceptional pairs is $O_(m_1) \( B^(- 2) \)$: the total possible length for $y$ is $O_(m_1) \( B^(- 1) \)$, and for each such $y$ the possible length for $x$ is $O \( B^(- 1) \)$. Thus replacing $u_h^(upright(c)) \( x \)$ by $u_h^(upright(c)) \( y \)$ costs $O_(eta \, m_1) \( B^(- 1) \) frak(S) \( j \) \/ j$. The support of $m \( y \) rho_0 \( y \)$ is a fixed positive distance from the boundary of $I$, so there is no further boundary contribution from the condition $x in I$ for large $B$.

Recall the coarse features from Corollary 30, and define their deterministic coefficients by

$ V_l \( S \) = frac(1, \| I_l \|) bb(P)_(upright("split")) \( log b \/ B in I_l divides S \) \, #h(2em) h_l = integral_(I_l) m \( y \) rho_0 \( y \) thin d y . $

These are nonnegative, $V_l \( S \) lt.eq \| I_l \|^(- 1)$, and $h_l gt.eq 0$. Since the fine partition refines the coarse partition, averaging (7.1) over a coarse cell gives the exact identity

$ \( P_(m_1) u_g \) \|_(I_l) = bb(E) \[ g \( S \) V_l \( S \) \] . $

After the preceding replacements in (8.15), substitute $x = y + v \/ B$. The factor $d x = d v \/ B$ cancels its prefactor $B$, and $1 \/ j = \( 1 \/ T \) \( 1 \/ lambda \)$. The resulting integral tests are therefore precisely those of the following site matrix:

#[#set math.equation(numbering: n => "(8.17)")
 $ cal(M)_(i k) \( S_i \, S_k \; s \) & = k_B / T frak(S) \( \| j \| \) w \( s \, \| j \| \/ T \) sum_l h_l V_l \( S_i \) V_l \( S_k \) \, #h(2em) j = k - i \,\
w \( s \, lambda \) & = 1 / lambda integral_(v > 0) Psi_s (frac(lambda e^v, e^v - 1) \, frac(lambda, e^v - 1)) thin d v \, #h(2em) eta lt.eq lambda lt.eq 1 . $ <eq:43>]

The matrix is zero off the allowed pairs. Formula (8.17) defines it for both signs of $j$; it is symmetric because its displayed dependence on the endpoints is symmetric. For positive $j$, independence of the endpoint types turns its integral test against $g \, h$ into the product of the two expectations just displayed. The case of negative $j$ follows by exchanging the endpoints.

The function $w$ is nonnegative and smooth, with all fixed-order derivatives bounded on the relevant compact $s$-range and $eta lt.eq lambda lt.eq 1$. There is in fact an expression giving bounds independent of $eta$. In (8.17) put $u = lambda \/ \( e^v - 1 \)$. Then $d v = - lambda thin d u \/ \( u \( u + lambda \) \)$, and hence

#[#set math.equation(numbering: n => "(8.18)")
 $ w \( s \, lambda \) = integral_0^oo frac(Psi_s \( u + lambda \, u \), u \( u + lambda \)) thin d u . $ <eq:kernel-w-ratio>]

The factors $psi \( u \) psi \( u + lambda \)$ restrict the integration to a fixed compact subset of $u > 0$. Consequently this formula extends $w$ smoothly to $0 lt.eq lambda lt.eq 1$, with uniformly bounded derivatives there, and gives zero when $lambda > b_0 - a_0$. Differentiation under the integral is valid because its denominators are bounded away from zero on that fixed support.

=== 8.6 Uniform integral cut comparison and row bounds <uniform-integral-cut-comparison-and-row-bounds>

The preceding calculation has produced the finite-feature matrix $cal(M)$. We now collect its approximation error in the same block normalization as the original energy and record the row bounds needed when the endpoint types are sampled.

#thm([Proposition 8.2.])[
  (Integral comparison).  #emph[For the matrix $cal(M)$ in (8.17), put $cal(E)_(i k) = cal(L)_(i k) - cal(M)_(i k)$, with all three matrices zero on nonpairs. Given $epsilon.alt_1 > 0$, choose the coarse partition as in (7.3). Then 
#[#set math.equation(numbering: n => "(8.19)")
 $ sup_(g_i \, h_k : Omega_B arrow.r \[ - 1 \, 1 \]\
g_i \, h_k med upright("real measurable")) 1 / M lr(|sum_(i \, k) bb(E)_(S_i \, S_k) \[ cal(E)_(i k) \( S_i \, S_k \; s \) g_i \( S_i \) h_k \( S_k \) \]|) lt.eq C e^(- c_3 C_(*)) + C_eta epsilon.alt_1 + o \( 1 \) . $ <eq:44>]

 The $o \( 1 \)$ is uniform in $s$ and in all the indicated tests. The coefficient of $e^(- c_3 C_(*))$ is independent of $eta$, $C_6$, and $C_(*)$. In addition, for every realization of the site types, 
#[#set math.equation(numbering: n => "(8.20)")
 $ sup_i sum_k \| cal(M)_(i k) \| lt.double_(eta \, m_1) 1 \, #h(2em) sup_i sum_k \| cal(M)_(i k) \|^2 lt.double_(eta \, m_1) T^(- 1) . $ <eq:kernel-main-row-bounds>]

]
] <prop:kernel-comparison>

#proof[
  Every estimate above was uniform in a pair of tests with absolute value at most one. Apart from (8.1), the pre-projection arc errors are uniform $o \( 1 \/ T \)$. The histogram and residue projection errors have the explicit common upper bound
  $ C_eta / j frac(j, phi \( j \)) log \( 2 Q \) \( B delta_B + B^(- c_7) \) . $
  The series tail is bounded by (8.14), and the archimedean and coarse replacements have total error
  $ (C_eta epsilon.alt_1 + o_(eta \, m_1) \( 1 \)) frac(frak(S) \( j \), j) . $
  All these bounds hold separately for every allowed edge. They thus remain valid if the endpoint tests differ from edge to edge, and in particular for the collection of tests in (8.19).
  For a fixed positive lag there are at most $M$ ordered pairs with that lag; including the negative lag at most doubles this number. Division by $M$ therefore reduces their total error to at most twice the sum of the edge error over $eta T lt.eq j lt.eq T$. The first-moment bound for $Sigma$ gives
  $ 1 / T sum_(1 lt.eq j lt.eq T) Sigma \( j \) lt.double 1 . $
  Consequently the sum of (8.1) is $O \( r_B + e^(- c_3 C_(*)) \)$, with a constant independent of $eta \, C_6 \, C_(*)$. A uniform $o \( 1 \/ T \)$ error sums to $o \( 1 \)$. For the other errors use the bounded mean of $j \/ phi \( j \)$ and
  $ sum_(eta T lt.eq j lt.eq T) 1 / j frac(j, phi \( j \)) lt.eq frac(1, eta T) sum_(j lt.eq T) frac(j, phi \( j \)) lt.double_eta 1 . $
  Since $log \( 2 Q \) \( B delta_B + B^(- c_7) \) arrow.r 0$, the denominator sum contributes $o \( 1 \)$. Absolute convergence makes the series tail tend to zero as well. Finally $frak(S) \( j \) lt.eq j \/ phi \( j \)$ controls the archimedean and coarse errors, giving the stated $C_eta epsilon.alt_1 + o \( 1 \)$. There is no factor of $C_6$, because the count of pairs for each lag has already been divided by $M$. This proves (8.19).
  For the deterministic row estimates, boundedness of $k_B$, $w$, and the finitely many features gives the pointwise bound
  $ \| cal(M)_(i k) \| lt.eq C_(eta \, m_1) / T frac(\| k - i \|, phi \( \| k - i \| \)) $
  on allowed pairs. Each row has at most two entries for each positive lag. The first and second powers of $j \/ phi \( j \)$ have bounded means. For the second power this was proved before (8.11), and the first follows by Cauchy–Schwarz. Summing the displayed pointwise bound and its square over $1 lt.eq j lt.eq T$ proves (8.20), uniformly in every collection of site types and in the block length. ◻
]

== 9 Sampling the integral cut comparison <sec:sampling>

The comparison in (8.19) allows arbitrary bounded functions at each single site. To use it against the labels in (5.4), we must also allow the testing signs to depend on the entire sampled matrix. We do this by approximating an optimizing row-sign vector using a small set of columns, and then applying concentration simultaneously to the resulting finite family of optimizations.

The small-column approximation is related to the sampling argument of Alon, Fernández de la Vega, Kannan, and Karpinski #cite(label("AlonEtAl2003Sampling")) Lemma 3 and to the proof of #cite(label("BorgsEtAl2008"), form: "prose") Theorem 4.6. Their arguments approximate optimizing cuts by a small sample and then control a finite family of tests. Here the kernels depend on $B$ and on position, and are controlled by degree bounds and integrated row-second-moment bounds. We therefore prove the required sampling transfer directly rather than invoking those results as a black box.

Throughout this section the regularity parameters, $C_(*)$, $eta$, $C_6$, $epsilon.alt_1$, and the coarse partition are fixed. In particular, $T = floor.l B^0.32 floor.r$ and $M = ceil.l C_6 T ceil.r asymp B^0.32$. All limits and $o \( 1 \)$ terms in the probabilistic argument refer to $B arrow.r oo$ with these parameters fixed. We work at one value of $s$ in the fixed compact range of the smooth weights. Every bound below is uniform in that value of $s$; no simultaneous event over all $s$ will be needed.

Let $upright(bold(S)) = \( S_1 \, dots.h \, S_M \)$ have the independent site law from Section 5. Write

$ cal(E)_(i k) \( S_i \, S_k \; s \) = cal(L)_(i k) \( S_i \, S_k \; s \) - cal(M)_(i k) \( S_i \, S_k \; s \) \, #h(2em) E_0 = C e^(- c_3 C_(*)) + C_eta epsilon.alt_1 . $

Here the fixed constants in $E_0$ are large enough for (8.19). As established there, the coefficient $C$ of $e^(- c_3 C_(*))$ can be chosen independently of $eta$ and $C_6$. The matrices are real and symmetric, and are zero on the diagonal and on all nonallowed pairs. We retain the normalization

$ parallel H parallel_square.stroked.tiny = 1 / M max_(epsilon.alt \, delta in { - 1 \, 1 }^M) lr(|sum_(i \, k) H_(i k) epsilon.alt_i delta_k|) . $

#thm([Proposition 9.1.])[
  (Sampling the type-kernel comparison).  #emph[For every fixed $epsilon.alt_2 > 0$, 
#[#set math.equation(numbering: n => "(9.1)")
 $ bb(E) parallel #scale(x: 120%, y: 120%)[\(] cal(E)_(i k) \( S_i \, S_k \; s \) #scale(x: 120%, y: 120%)[\)] parallel_square.stroked.tiny lt.eq E_0 + epsilon.alt_2 + o \( 1 \) \, $ <eq:45>]

 uniformly for $s$ in the fixed compact range.]
] <prop:sampling-comparison>

We first record the degree and integrability estimates required in the proof. Use the nonnegative symmetric envelope

$ cal(H)_(i k) = cal(L)_(i k) + \| cal(M)_(i k) \| \, #h(2em) \| cal(E)_(i k) \| lt.eq cal(H)_(i k) . $

Dependence on the endpoint types and on $s$ is suppressed when no confusion is possible. By the every-type bound (5.9) and the deterministic absolute row bounds for (8.17), there is a constant $C_0$ such that

$ bb(E) [sum_k cal(H)_(i k) thin mid(bar.v) thin S_i] lt.eq C_0 #h(2em) upright("for every row type ") S_i . $

By (6.1) and the squared-row bounds following (8.19), there is a constant $C_1$ such that

$ sum_k bb(E) cal(H)_(i k)^2 lt.eq q_B \, #h(2em) sum_k bb(E) cal(E)_(i k)^2 lt.eq q_B \, #h(2em) q_B = C_1 B^(- 0.21) \, #h(2em) 1 lt.eq i lt.eq M . $

Indeed $\( cal(L)_(i k) + \| cal(M)_(i k) \| \)^2 lt.eq 2 cal(L)_(i k)^2 + 2 cal(M)_(i k)^2$, and $1 \/ T = O \( B^(- 0.32) \)$. These squared-row bounds are integrated over the row type; no uniform conditional second-moment assertion is being made.

#thm([Lemma 9.2.])[
  (A common degree event and uniform integrability).  #emph[There is a fixed $K > 0$ such that, on an event $cal(G)_B$ of probability $1 - O \( B^(- 0.01) \) - O \( B^(- 0.03) \)$, 
#[#set math.equation(numbering: n => "(9.2)")
 $ 1 / M sum_(i \, k) cal(E)_(i k)^2 lt.eq B^(- 0.20) \, #h(2em) max_i sum_k \| cal(E)_(i k) \| lt.eq K B^0.07 . $ <eq:46>]

 The event may also be required to satisfy $max_i sum_k cal(H)_(i k) lt.eq K B^0.07$. Moreover, the normalized total absolute mass 
$ A_B = 1 / M sum_(i \, k) \| cal(E)_(i k) \| $

 has bounded second moment, uniformly in $B$ and $s$.]
] <lem:sampling-good>

#proof[
  Put $D_i = sum_k cal(H)_(i k)$ and $d_B = K B^0.07$, where $K$ is any fixed sufficiently large constant. Conditional on $S_i$, the summands of $D_i$ are independent, since each off-diagonal summand depends on one other independent site. Consequently
  $ bb(E) "Var" \( D_i divides S_i \) lt.eq sum_k bb(E) cal(H)_(i k)^2 lt.eq q_B \, #h(2em) bb(E) D_i^2 lt.eq C_0^2 + q_B . $
  For sufficiently large $B$, $d_B gt.eq 2 C_0$. Conditional Chebyshev followed by averaging the row type gives
  $ bb(P) \( D_i > d_B \) lt.eq frac(q_B, \( d_B - C_0 \)^2) lt.eq frac(4 q_B, d_B^2) . $
  Thus the event
  $ Omega_(upright("deg")) = { max_i D_i lt.eq d_B } $
  has complement of probability $O \( M q_B \/ d_B^2 \) = O \( B^(- 0.03) \)$. Markov’s inequality gives
  $ bb(P) (1 / M sum_(i \, k) cal(E)_(i k)^2 > B^(- 0.20)) lt.eq q_B B^0.20 = O \( B^(- 0.01) \) . $
  Take
  $ cal(G)_B = Omega_(upright("deg")) ∩ {1 / M sum_(i \, k) cal(E)_(i k)^2 lt.eq B^(- 0.20)} . $
  This implies (9.2). Finally, Jensen’s inequality across rows gives
  $ bb(E) A_B^2 lt.eq bb(E) (1 / M sum_i D_i)^2 lt.eq 1 / M sum_i bb(E) D_i^2 lt.eq C_0^2 + q_B . $
  In particular, for any events $cal(B)_B$ with probabilities tending to zero uniformly in $s$, $bb(E) \[ A_B upright(bold(1))_(cal(B)_B) \] = o \( 1 \)$ by Cauchy–Schwarz. ◻
]

The same degree estimate applies to the graph induced by any fixed subset of indices: deleting terms decreases both its conditional expected degrees and its integrated squared-row sums. In particular, the probability of a degree exceeding $d_B$ is still $O \( B^(- 0.03) \)$ after a union over its at most $M$ rows. This remains true conditional on the types at indices outside the subset, since the remaining types retain their original independent laws.

#thm([Lemma 9.3.])[
  (Approximation by a small set of columns).  #emph[Put $m_2 = floor.l M B^(- 0.18) floor.r$. On $cal(G)_B$ there are a subset $J' subset { 1 \, dots.h \, M }$ of size $m_2$ and signs $\( delta_j \)_(j in J')$ such that, with 
$ tilde(g)_i = "sgn" (sum_(j in J') cal(E)_(i j) delta_j) \, #h(2em) R' = { 1 \, dots.h \, M } \\ J' \, $

 and assigning the sign $+ 1$ at zero for all sign choices in this section, 
$ parallel cal(E) parallel_square.stroked.tiny lt.eq 1 / M sum_(k in R') lr(|sum_(i in R') cal(E)_(i k) tilde(g)_i|) + O \( B^(- 0.01) \) + O \( B^(- 0.11) \) . $

 The constants are independent of the realized matrix on $cal(G)_B$.]
] <lem:sampling-skeleton>

#proof[
  Fix the realized matrix. Choose column signs $delta_k$ attaining the cut norm and choose the best-response row signs, so the unnormalized maximum is the positive quantity $sum_i \| r_i \|$, where $r_i = sum_k cal(E)_(i k) delta_k$. For this deterministic matrix only, sample a uniform subset $J'$ of $m_2$ columns and form the unbiased estimate
  $ hat(r)_i = M / m_2 sum_(j in J') cal(E)_(i j) delta_j . $
  The variance formula for sampling without replacement yields
  $ bb(E)_(J') \| hat(r)_i - r_i \|^2 lt.eq M / m_2 sum_k cal(E)_(i k)^2 . $
  For real numbers $r$ and $hat(r)$, $\| r \| - r "sgn" \( hat(r) \) lt.eq 2 \| r - hat(r) \|$. Applying this inequality and then Cauchy–Schwarz across rows, the expected loss in the unnormalized bilinear sum is at most
  $ 2 sum_i (M / m_2 sum_k cal(E)_(i k)^2)^(1 \/ 2) lt.eq 2 M (M / m_2 B^(- 0.20))^(1 \/ 2) = O \( M B^(- 0.01) \) . $
  Here $m_2 asymp M B^(- 0.18)$ for large $B$. Hence at least one subset has this loss bound, with $"sgn" \( hat(r)_i \) = tilde(g)_i$. Its signs on $J'$ are the restrictions of the chosen optimizing column signs.
  Deleting every ordered pair with an endpoint in $J'$ changes any such bilinear sum in absolute value by at most $2 m_2 d_B$, using symmetry and the degree event. After deletion, maximizing the column signs gives exactly $sum_(k in R') \| sum_(i in R') cal(E)_(i k) tilde(g)_i \|$. Since $m_2 d_B \/ M = O \( B^(- 0.11) \)$, the claim follows. ◻
]

#thm([Lemma 9.4.])[
  (Uniform mean after fixing a column set).  #emph[Fix a deterministic subset $J'$ of size $m_2$ and a deterministic assignment $sigma in { - 1 \, 1 }^(J')$. Condition on its site types $upright(bold(S))_(J') = upright(bold(t))$. For $i in R'$, define the fixed single-site function 
$ g_i \( u \) = "sgn" (sum_(j in J') cal(E)_(i j) \( u \, t_j \; s \) sigma_j) . $

 Then, writing 
$ Z_(J' \, sigma \, upright(bold(t))) = 1 / M sum_(k in R') lr(|sum_(i in R') cal(E)_(i k) \( S_i \, S_k \; s \) g_i \( S_i \)|) \, $

 we have $bb(E) \[ Z_(J' \, sigma \, upright(bold(t))) divides upright(bold(S))_(J') = upright(bold(t)) \] lt.eq E_0 + o \( 1 \)$, uniformly in $J'$, $sigma$, $upright(bold(t))$, and $s$.]
] <lem:sampling-conditional-mean>

#proof[
  Only the types in the deterministic set $J'$ have been conditioned on. In particular, no event describing which signs an optimizer would choose has been imposed. The types in $R'$ remain independent with their usual laws, and $\| g_i \| lt.eq 1$.
  For $k in R'$ and a possible value $v$ of $S_k$, put
  $ a_k \( v \) = sum_(i in R'\
i eq.not k) bb(E)_(S_i) #scale(x: 120%, y: 120%)[\[] cal(E)_(i k) \( S_i \, v \; s \) g_i \( S_i \) #scale(x: 120%, y: 120%)[\]] . $
  Choose $h_k \( v \) = "sgn" \( a_k \( v \) \)$, and set both families of tests equal to zero on removed indices. Equation (8.19), which is uniform over all bounded single-site tests, gives
  $ 1 / M sum_(k in R') bb(E)_(S_k) \| a_k \( S_k \) \| = 1 / M sum_(i \, k in R') bb(E) \[ cal(E)_(i k) g_i \( S_i \) h_k \( S_k \) \] lt.eq E_0 + o \( 1 \) . $
  This application is valid for every fixed value of $upright(bold(t))$, however the resulting functions $g_i$ depend on that value.
  Conditional on $S_k$, the centered terms
  $ cal(E)_(i k) \( S_i \, S_k \; s \) g_i \( S_i \) - bb(E)_(S_i) \[ cal(E)_(i k) \( S_i \, S_k \; s \) g_i \( S_i \) \] \, #h(2em) i in R' \\ { k } \, $
  are independent. The diagonal contributes zero. Conditional variance followed by Cauchy–Schwarz therefore gives
  $ bb(E) lr(|sum_(i in R') cal(E)_(i k) g_i \( S_i \) - a_k \( S_k \)|) lt.eq (sum_(i in R') bb(E) cal(E)_(i k)^2)^(1 \/ 2) lt.eq q_B^(1 \/ 2) . $
  Symmetry supplies the squared-column bound from the squared-row bound. Averaging this estimate over $k$ costs at most $q_B^(1 \/ 2) = O \( B^(- 0.105) \)$. This proves the asserted mean bound, including its uniformity in the conditioned choice. ◻
]

#proof[
  The skeleton lemma reduces the adaptive cut norm to a finite family of optimizations, each with conditional mean at most $E_0 + o \( 1 \)$. The remaining step is a concentration estimate strong enough to hold for the entire family. The common degree event will be excluded only once. We prove concentration for each of the deterministic subset/sign assignments in Lemma 36, and then take a union over those assignments. Fix such an assignment and condition on $upright(bold(S))_(J') = upright(bold(t))$. Abbreviate its random quantity by $Z$. Let $cal(G)_(R')$ be the set of configurations of the remaining site types satisfying
  $ max_(i in R') sum_(k in R') cal(H)_(i k) \( S_i \, S_k \; s \) lt.eq d_B . $
  The observation after Lemma 34 shows that
  $ bb(P) \( cal(G)_(R')^c divides upright(bold(S))_(J') = upright(bold(t)) \) = O \( B^(- 0.03) \) \, $
  uniformly in the conditioning and assignment.
  We next verify a Lipschitz bound between any two configurations $upright(bold(u)) \, upright(bold(v)) in cal(G)_(R')$, rather than only between good configurations differing in one coordinate. Let $A = { i in R' : u_i eq.not v_i }$. The row functions $g_i$ have already been fixed by $upright(bold(t))$ and $sigma$. Thus a term $cal(E)_(i k) \( u_i \, u_k \) g_i \( u_i \)$ can change only if $i$ or $k$ belongs to $A$. The reverse triangle inequality for each column sum gives
  $ \| Z \( upright(bold(u)) \) - Z \( upright(bold(v)) \) \| lt.eq 1 / M sum_(i \, k in R'\
i in A med upright("or") med k in A) #scale(x: 120%, y: 120%)[\(] cal(H)_(i k) \( u_i \, u_k \; s \) + cal(H)_(i k) \( v_i \, v_k \; s \) #scale(x: 120%, y: 120%)[\)] lt.eq frac(4 d_B, M) \| A \| . $
  The last inequality uses both endpoint degree bounds and symmetry. It also includes the change of $g_i$ when $i in A$. No connecting path of good configurations is required.
  Choose a fixed $L' > E_0 + 2 + epsilon.alt_2$. On $cal(G)_(R')$ the function $f = min \( Z \, L' \)$ is nonnegative and Lipschitz for the site Hamming distance $d_H$, with constant $c_B = 4 d_B \/ M$. For sufficiently large $B$ the good set is nonempty. We use the McShane extension #cite(label("McShane1934")) in its infimum form #cite(label("Caputti1984")) Section 3, Equation (3.2), followed by clamping:
  $ tilde(Z) \( upright(bold(u)) \) = min {L' \, med inf_(upright(bold(v)) in cal(G)_(R')) #scale(x: 120%, y: 120%)[\(] f \( upright(bold(v)) \) + c_B d_H \( upright(bold(u)) \, upright(bold(v)) \) #scale(x: 120%, y: 120%)[\)]} . $
  The site spaces are finite for every $B$, so the formula is measurable. The infimum defines a $c_B$-Lipschitz function by the triangle inequality, and its restriction to the good set is $f$: the Lipschitz inequality for $f$ gives the lower bound, and taking $upright(bold(v)) = upright(bold(u))$ gives the upper bound. Clamping preserves the Lipschitz bound. Hence $0 lt.eq tilde(Z) lt.eq L'$ everywhere and $tilde(Z) = min \( Z \, L' \)$ on $cal(G)_(R')$. By Lemma 36,
  $ bb(E) \[ tilde(Z) divides upright(bold(S))_(J') = upright(bold(t)) \] lt.eq bb(E) \[ Z divides upright(bold(S))_(J') = upright(bold(t)) \] + L' bb(P) \( cal(G)_(R')^c divides upright(bold(S))_(J') = upright(bold(t)) \) lt.eq E_0 + o \( 1 \) \, $
  again uniformly in every fixed choice.
  Changing any one of the independent remaining site types changes $tilde(Z)$ by at most $c_B$. McDiarmid’s bounded-differences inequality #cite(label("McDiarmid1989")) therefore gives, for every $a > 0$,
  $ bb(P) (tilde(Z) - bb(E) \[ tilde(Z) divides upright(bold(S))_(J') \] > a thin mid(bar.v) thin upright(bold(S))_(J') = upright(bold(t))) lt.eq exp (- frac(2 a^2, \| R' \| c_B^2)) lt.eq exp (- frac(a^2 M, 8 d_B^2)) . $
  Taking $a = epsilon.alt_2 \/ 4$ and using the uniform mean bound shows that, for large $B$,
  $ bb(P) (tilde(Z) > E_0 + epsilon.alt_2 \/ 2 thin mid(bar.v) thin upright(bold(S))_(J') = upright(bold(t))) lt.eq exp \( - c_(epsilon.alt_2) M \/ B^0.14 \) . $
  On $cal(G)_(R')$, the event $Z > E_0 + epsilon.alt_2 \/ 2$ is equivalent to this event for $tilde(Z)$, since the threshold is strictly below $L'$.
  There are at most
  $ N_B = binom(M, m_2) 2^(m_2) lt.eq (frac(2 e M, m_2))^(m_2) $
  deterministic subset/sign assignments. For each assignment, integrate the last conditional tail bound over its subset types. We may then union-bound the extension tails, because
  $ log N_B = O \( m_2 log M \) = O \( B^0.14 log B \) = o \( M \/ B^0.14 \) \, #h(2em) M \/ B^0.14 asymp B^0.18 . $
  The original full-sample event $Omega_(upright("deg"))$ implies $cal(G)_(R')$ for every subset $J'$ simultaneously, by nonnegativity of the envelope. Consequently
  $ bb(P) (Omega_(upright("deg")) med upright("and some assignment has") med Z_(J' \, sigma \, upright(bold(S))_(J')) > E_0 + epsilon.alt_2 \/ 2) lt.eq N_B exp \( - c_(epsilon.alt_2) M \/ B^0.14 \) = o \( 1 \) . $
  Only the exponential extension tails have been union-bounded; the probability of $Omega_(upright("deg"))^c$ is counted once.
  With probability $1 - o \( 1 \)$, the squared-mass event also holds, and Lemma 35 now bounds the fully adaptive cut norm by $E_0 + epsilon.alt_2 \/ 2 + O \( B^(- 0.01) \) + O \( B^(- 0.11) \)$. On the exceptional event use $parallel cal(E) parallel_square.stroked.tiny lt.eq A_B$. Lemma 34 makes its expected contribution $o \( 1 \)$. This proves (9.1). All probabilities and errors used here were uniform for each fixed $s$ in the compact range, which proves the stated uniformity without constructing a simultaneous event over $s$. ◻
]

The deterministic row estimate (8.20) gives

$ sum_(i \, k) \| cal(M)_(i k) \| lt.double_(eta \, m_1) M = O \( B^0.32 \) \, $

uniformly in the site types and in $s$. Thus $cal(M)$ satisfies the $O \( B^10 \)$ total-mass hypothesis of the independent-root comparison.

Finally, combine (9.1) with the independent-site comparison (5.10). For the actual sets $S_i \( n \) = { p in cal(P) : p divides n + i }$ and fixed $B$, the upper limit as $x arrow.r oo$ of the absolute error in replacing the kernel in (5.4) by $cal(M)_(i k) \( S_i \( n \) \, S_k \( n \) \; n \/ \( T x \) \)$ is at most

$ C_(upright("lab")) \( E_0 + epsilon.alt_2 \) + o \( 1 \) . $

Here $x$ tends along the fixed bad subsequence, and the $o \( 1 \)$ tends to zero as $B arrow.r oo$ after this inner upper limit. The constant $C_(upright("lab"))$ depends only on the fixed label bound and the compact $s$-range. Indeed bounded complex label energies are controlled by a fixed multiple of the real cut norm. For each fixed $B$, the error norm is a finite maximum of finite-residue functions continuous in $s$ (piecewise continuity would also suffice), so ordinary scale counting gives its Haar expectation integrated over $s$, as explained after (5.4). The uniform expectation bound above can then be integrated over that fixed compact interval. This uses no independence between the actual labels and site types, and all matrices retain zero entries on nonallowed pairs.

== 10 Vanishing of the main energy <sec:conclusion>

The main kernel in (8.17) has finitely many bounded site features. We first approximate these features by multiplicative weights and the lag factor by a function with a fixed period. Subdividing the position block then reduces its energy to products of the short averages in Lemma 5. In the vanishing argument, the regularity parameters, $C_(*)$, $eta$, $C_6$, and the coarse partition are fixed; further approximation parameters are chosen before the limits. We take $x arrow.r oo$ along the bad subsequence fixed in Section 2, and only then $B arrow.r oo$.

Choose a compact interval $cal(I)_s = \[ s_0 \, s_1 \] subset \( 0 \, oo \)$ containing the supports in $s$ of all the kernels under consideration. It depends only on the fixed smooth functions: the support conditions $psi \( u_1 \) psi \( u_2 \) eq.not 0$ and $phi.alt \( s \/ u_1 \) phi.alt \( s \/ u_2 \) eq.not 0$ put $s$ in such a fixed interval. For the actual site sets

$ S_i \( n \) = { p in cal(P) : p divides n + i } \, $

write the main-kernel energy as

#[#set math.equation(numbering: n => "(10.1)")
 $ cal(Q)_(B \, x)^(upright("main")) = frac(1, T x) sum_(n : thin n \/ \( T x \) in cal(I)_s) 1 / M sum_(1 lt.eq i \, k lt.eq M\
eta T lt.eq \| k - i \| lt.eq T) overline(F_x \( n + i \)) F_x \( n + k \) cal(M)_(i k) \( S_i \( n \) \, S_k \( n \) \; n \/ \( T x \) \) . $ <eq:conclusion-main-energy>]

The summands are zero away from the original smooth supports. In particular, the choice of the enclosing interval introduces no new term.

#thm([Lemma 10.1.])[
  (Approximation of the site features).  #emph[Fix the coarse partition $I = union.big_(l = 1)^(m_1) I_l$ used in (8.17). For every $zeta > 0$ there are real polynomials 
$ p_l \( t \) = sum_(v = 0)^(d_l) alpha_(l \, v) t^v \, #h(2em) 1 lt.eq l lt.eq m_1 \, $

 independent of $B$, such that the functions 
$ tilde(V)_(l \, B) \( S \) = sum_(v = 0)^(d_l) alpha_(l \, v) product_(p in S) frac(1 + p^(- v \/ B), 2) $

 satisfy, for all sufficiently large $B$, 
$ parallel V_l - tilde(V)_(l \, B) parallel_(L^2 \( S \)) lt.eq zeta . $

 Here the norm uses the independent site law with inclusion probabilities $1 \/ p$. For $0 < zeta lt.eq 1$, the approximants can be chosen with a common bound depending only on the fixed coarse partition. At actual integer sites they are the fixed finite combinations 
$ tilde(V)_(l \, B) \( S_i \( n \) \) = sum_(v = 0)^(d_l) alpha_(l \, v) G_(B \, v) \( n + i \) \, $

 where $G_(B \, v)$ is the function in (2.11) with $P_B = cal(P)$.]
] <lem:conclusion-features>

#proof[
  Write $x_b = \( log b \) \/ B$ for the normalized logarithm of the fair split product $b$, and put $q_l^0 \( y \) = upright(bold(1))_(I_l) \( y \) \/ \| I_l \|$ for $y gt.eq 0$. The endpoints of the coarse cells lie in $\[ 1 \/ 2 \, 3 \]$, where (3.3) bounds the marginal split-product densities uniformly for large $B$. Choose small endpoint neighborhoods, still in a fixed compact subinterval of $\( 0 \, 3.2 \)$, and replace $q_l^0$ by a continuous compactly supported function $q_l$. We may arrange $0 lt.eq q_l lt.eq 1 \/ \| I_l \|$, with equality to $q_l^0$ outside these neighborhoods. By (3.3), their $nu_(1 \/ 2)$ mass is at most a constant times their total length plus $O \( B^(- 80) \)$. Consequently the neighborhoods can be fixed so that
  $ limsup_(B arrow.r oo) bb(E)_(nu_(1 \/ 2)) \| q_l^0 \( x_b \) - q_l \( x_b \) \|^2 $
  is as small as desired, simultaneously for the finitely many cells.
  The function $t mapsto q_l \( - log t \)$ on $\( 0 \, 1 \]$, assigned value zero at $t = 0$, is continuous on $\[ 0 \, 1 \]$. Indeed $q_l$ is zero for all sufficiently large arguments. Uniform polynomial approximation on $\[ 0 \, 1 \]$ therefore gives a real polynomial $p_l$ for which $p_l \( e^(- y) \)$ approximates $q_l \( y \)$ uniformly for every $y gt.eq 0$. Both this approximation and the preceding endpoint smoothing can be chosen so that
  $ parallel q_l^0 \( x_b \) - p_l \( e^(- x_b) \) #scale(x: 120%, y: 120%)[parallel]_(L^2 \( nu_(1 \/ 2) \)) lt.eq zeta $
  for all sufficiently large $B$. Taking the uniform polynomial error at most one also ensures $sup_(0 lt.eq t lt.eq 1) \| p_l \( t \) \| lt.eq 1 \/ \| I_l \| + 1$.
  Conditional on a site set $S$, fair splitting gives
  $ V_l \( S \) = bb(E)_(upright("split")) \[ q_l^0 \( x_b \) divides S \] \, #h(2em) bb(E)_(upright("split")) \[ e^(- v x_b) divides S \] = product_(p in S) (1 / 2 + 1 / 2 p^(- v \/ B)) . $
  The second identity follows by making the fair split choices separately for each prime. Conditional expectation is a contraction in $L^2$, which proves the asserted error bound and the uniform bound on the approximants. The last identity applies to the distinct primes dividing $n + i$, irrespective of their multiplicities, and hence gives exactly $G_(B \, v) \( n + i \)$ at the integer sites. ◻
]

We spell out how the feature error is used against the labels. For fixed $B$, any function of $S_i \( n \)$ is a function of finitely many residues of $n + i$. Unweighted progression counting gives, for $r = 1 \, 2$,

#[#set math.equation(numbering: n => "(10.2)")
 $ lim_(x arrow.r oo) frac(1, T x) sum_(n : thin n \/ \( T x \) in cal(I)_s) \| V_l \( S_i \( n \) \) - tilde(V)_(l \, B) \( S_i \( n \) \) \|^r = \| cal(I)_s \| thin bb(E) \| V_l \( S \) - tilde(V)_(l \, B) \( S \) \|^r . $ <eq:conclusion-feature-counting>]

There are only finitely many $i$ at fixed $B$; neither a bound on the size of the residue modulus nor uniformity with respect to growing $B$ is required for this inner limit.

The singular series in (8.13) is nonnegative and at most $j \/ phi \( j \)$. Its ordinary mean is bounded. Thus the lag majorant has deterministic row bounds

#[#set math.equation(numbering: n => "(10.3)")
 $ sup_(1 lt.eq i lt.eq M) 1 / T sum_(1 lt.eq k lt.eq M\
0 < \| k - i \| lt.eq T) frak(S) \( \| k - i \| \) lt.double 1 . $ <eq:conclusion-lag-rows>]

For completeness, the identity

$ frac(j, phi \( j \)) = sum_(d divides j) frac(mu_(upright("Mob"))^2 \( d \), phi \( d \)) $

and the convergence of $sum_d mu_(upright("Mob"))^2 \( d \) \/ \( d phi \( d \) \)$ give this bound by summing the divisor expansion up to $T$. Since $\| F_x \| lt.eq 2$, the features and their approximants are bounded, and $k_B$, $w$ and the finitely many $h_l$ are bounded for the present fixed parameters, replacing both features in each term of (10.1) costs at most $C zeta$ in iterated upper limit. Indeed

$ \| V_l \( S_i \) V_l \( S_k \) - tilde(V)_(l \, B) \( S_i \) tilde(V)_(l \, B) \( S_k \) \| lt.eq C_(m_1) #scale(x: 120%, y: 120%)[\(] \| V_l \( S_i \) - tilde(V)_(l \, B) \( S_i \) \| + \| V_l \( S_k \) - tilde(V)_(l \, B) \( S_k \) \| #scale(x: 120%, y: 120%)[\)] \, $

and (10.3) reduces the sum to the single-site $L^1$ errors in (10.2). This uses no independence between either feature error and the labels or the other endpoint.

#thm([Lemma 10.2.])[
  (Periodic approximation of the lag factor).  #emph[For a fixed prime cutoff $P_1 gt.eq 2$, define on all integers $j$ 
$ frak(S)_(P_1) \( j \) = product_(p lt.eq P_1\
p divides j) \( 1 - 1 \/ p \)^(- 1) product_(p lt.eq P_1\
p divides.not j) (1 - frac(1, \( p - 1 \)^2)) . $

 This is a bounded nonnegative function of period $D = product_(p lt.eq P_1) p$. Moreover, 
$ lim_(P_1 arrow.r oo) med sup_(T in bb(N)\
T gt.eq 1) 1 / T sum_(1 lt.eq j lt.eq T) \| frak(S) \( j \) - frak(S)_(P_1) \( j \) \| = 0 \, $

 with the supremum taken over positive integers $T$.]
] <lem:conclusion-periodic>

#proof[
  Write
  $ a \( j \) = product_(p divides j) \( 1 - 1 \/ p \)^(- 1) \, #h(2em) a_(P_1) \( j \) = product_(p lt.eq P_1\
p divides j) \( 1 - 1 \/ p \)^(- 1) . $
  The omitted nondividing-prime factors form a product of numbers in $\( 0 \, 1 \]$. Since $P_1 gt.eq 2$, its difference from one is at most
  $ sum_(p > P_1) frac(1, \( p - 1 \)^2) lt.double P_1^(- 1) \, $
  uniformly in $j$. All the retained nondividing-prime factors are in $\[ 0 \, 1 \]$, including the possible zero factor at $p = 2$. Consequently
  $ \| frak(S) \( j \) - frak(S)_(P_1) \( j \) \| lt.eq a \( j \) - a_(P_1) \( j \) + C P_1^(- 1) a \( j \) . $
  The positive divisor expansion gives
  $ a \( j \) - a_(P_1) \( j \) = sum_(d divides j\
d upright(" has a prime divisor greater than ") P_1) frac(mu_(upright("Mob"))^2 \( d \), phi \( d \)) . $
  Its mean up to $T$ is bounded by
  $ sum_(d gt.eq 1\
d upright(" has a prime divisor greater than ") P_1) frac(mu_(upright("Mob"))^2 \( d \), d phi \( d \)) . $
  The unrestricted positive series equals $product_p \( 1 + 1 \/ \( p \( p - 1 \) \) \) < oo$, so this tail tends to zero. The same expansion bounds the mean of $a \( j \)$ by that product, uniformly in $T$. The required conclusion follows. ◻
]

#thm([Proposition 10.3.])[
  (Vanishing of the main energy).  #emph[With $C_(*)$, $eta$, $C_6$, and the coarse partition fixed as above, 
$ lim_(B arrow.r oo) med limsup_(x arrow.r oo) \| cal(Q)_(B \, x)^(upright("main")) \| = 0 . $

]
] <prop:conclusion-main-vanishes>

#proof[
  Let $gamma > 0$ be arbitrary. First choose the approximants in Lemma 37 with sufficiently small $zeta$ that the feature replacement has iterated upper-limit error at most $gamma \/ 3$. Their degrees and coefficients are now fixed, and the approximants have the stated bounds depending only on the fixed coarse partition. Next choose a fixed $P_1$ by Lemma 38. Replacing $frak(S) \( \| k - i \| \)$ by $frak(S)_(P_1) \( k - i \)$ in the energy costs at most $gamma \/ 3$ in upper limit. To check the normalization, the absolute error is bounded by a fixed constant times
  $ frac(1, M T) sum_(i = 1)^M sum_(1 lt.eq k lt.eq M\
0 < \| k - i \| lt.eq T) \| frak(S) \( \| k - i \| \) - frak(S)_(P_1) \( k - i \) \| lt.eq 2 / T sum_(j = 1)^T \| frak(S) \( j \) - frak(S)_(P_1) \( j \) \| . $
  The label and origin bounds have been absorbed in that fixed constant.
  Choose a fixed $0 < delta < eta \/ 4$, to be made small after $P_1$ has been fixed. Partition ${ 1 \, dots.h \, M }$ into a fixed number $R_0$ of consecutive blocks $J_a$, $1 lt.eq a lt.eq R_0$, of lengths $L_a$ differing by at most one. Choosing $R_0$ sufficiently large in terms of $delta \, C_6$, for all sufficiently large $B$ we have
  $ c_(delta \, C_6) T lt.eq L_a lt.eq delta T #h(2em) \( 1 lt.eq a lt.eq R_0 \) $
  with a positive fixed lower constant. In particular all these lengths tend to infinity.
  Call an ordered block pair fully allowed when every $\( i \, k \) in J_a times J_b$ satisfies $eta T lt.eq \| k - i \| lt.eq T$. Discard any block pair containing both an allowed and a nonallowed pair of positions. The values of $\| k - i \|$ on a block pair vary by at most $2 delta T$. Thus each discarded allowed pair has lag within $2 delta T$ of $eta T$ or $T$. For each row there are only $O \( delta T + 1 \)$ such positions. The factors now present, including the periodic lag factor, are bounded for the fixed $P_1$ and coarse partition. With the normalization $1 \/ \( M T \)$, this discarding costs $O \( delta \) + O \( 1 \/ T \)$, with a constant allowed to depend on these already fixed parameters.
  Choose a representative position $i_a in J_a$ for every block, and for every fully allowed block pair put $lambda_(a b) = \| i_b - i_a \| \/ T in \[ eta \, 1 \]$. Smoothness of $w$ on the fixed compact $s$-range and on $eta lt.eq lambda lt.eq 1$ gives
  $ sup_(s in cal(I)_s) \| w \( s \, \| k - i \| \/ T \) - w \( s \, lambda_(a b) \) \| lt.double_eta delta #h(2em) \( i in J_a \, k in J_b \) . $
  Replacing the weight by this representative value therefore has another $O \( delta \)$ cost. We fix $delta$ sufficiently small that the two block errors together have upper limit at most $gamma \/ 3$. Neither the representatives nor their scaled lags have to converge as $B$ grows; only this uniform bound is used.
  It remains to show that the fully factored expression tends to zero. For $0 lt.eq r < D$ and $1 lt.eq l lt.eq m_1$, define
  $ A_(a \, r \, l) \( n \) = 1 / L_a sum_(i in J_a\
i equiv r med \( mod med D \)) F_x \( n + i \) tilde(V)_(l \, B) \( S_i \( n \) \) . $
  By the feature identity, this is a fixed finite linear combination of
  $ 1 / L_a sum_(i in J_a) upright(bold(1))_(i equiv r med \( mod med D \)) F_x \( n + i \) G_(B \, v) \( n + i \) . $
  The lengths $L_a$ tend to infinity and the starting indices are fixed for each $B$. The modulus $D$, monomials $v$, and polynomial coefficients are all fixed before $B$ grows. Lemma 5 applies with origins $n in \[ s_0 T x \, s_1 T x \]$, and yields
  #[#set math.equation(numbering: n => "(10.4)")
   $ lim_(B arrow.r oo) med limsup_(x arrow.r oo) frac(1, T x) sum_(n : thin n \/ \( T x \) in cal(I)_s) \| A_(a \, r \, l) \( n \) \|^2 = 0 $ <eq:conclusion-block-mean-square>]
  for every one of the finitely many indices.
  Set $c_(r \, r') = frak(S)_(P_1) \( r' - r \)$, using the periodic extension in Lemma 38, including at the zero residue. On a block pair, splitting each position by its residue class gives the factored expression
  #[#set math.equation(numbering: n => "(10.5)")
   $ frac(k_B, T x) sum_(n : thin n \/ \( T x \) in cal(I)_s) sum_(l = 1)^(m_1) h_l sum_(\( a \, b \) med upright(f u l l y med a l l o w e d)) frac(L_a L_b, M T) thin w \( n \/ \( T x \) \, lambda_(a b) \) sum_(r \, r' = 0)^(D - 1) c_(r \, r') overline(A_(a \, r \, l) \( n \)) A_(b \, r' \, l) \( n \) . $ <eq:conclusion-factorization>]
  The feature polynomials are real, so the conjugation here matches exactly the conjugation in the original energy. The factors $L_a L_b \/ \( M T \)$ are uniformly bounded. The numbers of cells, blocks, and residue classes are fixed, and $k_B$ and the representative smooth weights are uniformly bounded. Cauchy–Schwarz in the origin variable and (10.4) make every term in (10.5) tend to zero in the asserted iterated upper-limit sense. This remains true when the bounded coefficients depend on $n \/ \( T x \)$ or on $B$.
  The original main energy consequently has iterated upper limit at most $gamma$ in absolute value. Since the approximation parameters were fixed before the limits and $gamma > 0$ was arbitrary, the proposition follows. ◻
]

#proof[
  Suppose mixed decorrelation fails for some fixed $J$ and two fixed phase vectors. Fix the resulting subsequence, the limiting profile $W$ and bump $phi.alt$ from Section 2, and the smooth functions $rho_0 \, psi$ from Section 4. Choose the regularity grid and tolerances as required for the estimates of Sections 3 and 6. The amplification then supplies the positive constant $c_5$ in (4.10). This constant is independent of every sufficiently large fixed $C_(*)$.
  We collect the upper bounds, recording the dependencies needed to choose parameters without a cycle. The diagonal contribution to $I_(2 \, x) \/ \( B T \)$ tends to zero in the prescribed order. Equations (5.1)–(5.4) express the remaining contribution as the block energy, up to errors bounded in iterated upper limit by
  $ C_0 eta + C_0 \/ C_6 . $
  Here $C_0$ can be chosen independently of $C_(*)$, $eta$ and $C_6$, by the untruncated mean bound (5.3).
  The root comparison (5.10) and the sampling bound (9.1) allow replacement of this block kernel by $cal(M)$. The resulting upper-limit error is bounded by
  $ C_1 e^(- c_3 C_(*)) + C_(eta \, C_6) epsilon.alt_1 + C_2 epsilon.alt_2 . $
  The constants $C_1 \, C_2$ do not depend on the later choices $eta \, C_6$ or the coarse partition. Indeed the truncation term in (8.19) has a coefficient independent of the lag range and block length, and converting a real cut-norm bound to an energy of labels of absolute value at most two costs only an absolute factor. For example, splitting each label into its real and imaginary parts gives a factor at most $16$. Integrating over $cal(I)_s$ costs only its fixed length. The finite-residue counting passage and the uniformity in $s$ were established in Sections 5 and 9. The remaining $o \( 1 \)$ errors vanish as $B arrow.r oo$ after the inner $x$-limit, with all the displayed parameters fixed.
  For any such fixed choices, Proposition 39 makes the main energy zero in upper limit. Consequently
  #[#set math.equation(numbering: n => "(10.6)")
   $ limsup_(B arrow.r oo) med limsup_(x arrow.r oo) frac(I_(2 \, x), B T) lt.eq C_1 e^(- c_3 C_(*)) + C_0 eta + C_0 \/ C_6 + C_(eta \, C_6) epsilon.alt_1 + C_2 epsilon.alt_2 . $ <eq:conclusion-final-upper>]
  First choose a sufficiently large fixed $C_(*)$ so that the first term is less than $c_5 \/ 10$. Next choose a sufficiently small fixed $eta$ and a sufficiently large fixed $C_6$ so that the next two terms are each less than $c_5 \/ 10$. Then choose positive fixed $epsilon.alt_1 \, epsilon.alt_2$ so that their terms are each less than $c_5 \/ 10$, and choose the corresponding coarse partition in (7.3). All feature, periodic and block approximations in Proposition 39 are made subsequently with these parameters fixed. Thus (10.6) is strictly smaller than $c_5$, contradicting the lower bound (4.10).
  Finally, the bad subsequence was extracted from an arbitrary sequence of integer scales on which $x^(- 1) sum_(1 lt.eq n < x) overline(g_x \( n \)) F_x \( n + 1 \)$ stays a fixed positive distance from zero. Every inner limit above uses the final subsequence selected for the profile. At each fixed $B$, all multipliers, residue moduli and shifts are finite, so the argument never requires their invariance or counting estimates while $B$ and $x$ grow simultaneously. The contradiction rules out every original sequence of this kind. Thus the mixed correlation tends to zero along the full sequence of integer scales, for every fixed pair of phase vectors. ◻
]

== 11 Marginals, the joint law, and the ordering corollary <sec:distribution>

Proposition 4 separates every pair of bin characters. Finite Fourier inversion therefore separates bin events, including smoothness at rational powers of the counting scale. The factorial-moment limits from Section 2 identify their marginals with the Dickman law. We then obtain the fixed-scale joint law through every real counting endpoint, pass to the moving thresholds in Theorem 1, and deduce the comparison corollary from the continuous limiting distribution.

=== 11.1 Finite Fourier inversion <finite-fourier-inversion>

Adding back the centering in Proposition 4 gives

#[#set math.equation(numbering: n => "(11.1)")
 $ lim_(x arrow.r oo) 1 / x sum_(1 lt.eq n < x) overline(g_x \( n \)) f_x \( n + 1 \) = overline(mu_g) mu . $ <eq:distribution-characters>]

Here and throughout this subsection, $x$ runs through positive integers. Indeed, the mean of $overline(g_x \( n \))$ tends to $overline(mu_g)$ by Lemma 3 and its initial-segment extension. For $m lt.eq x$, write

$ bold(b)_x \( m \) = #scale(x: 120%, y: 120%)[\(] Omega_(cal(B)_(k \, x)) \( m \) #scale(x: 120%, y: 120%)[\)]_(1 lt.eq k < J) . $

Every coordinate lies in ${ 0 \, dots.h \, J }$: each counted prime factor exceeds $x^(1 \/ J)$. Thus reduction modulo $J + 1$ is injective on the set of count vectors. Put $zeta_0 = exp \( 2 pi i \/ \( J + 1 \) \)$. For $bold(r) in { 0 \, dots.h \, J }^(J - 1)$ and such a count vector $bold(b)$, the exact identity

$ upright(bold(1))_({ bold(b) = bold(r) }) = frac(1, \( J + 1 \)^(J - 1)) sum_(bold(h) in { 0 \, dots.h \, J }^(J - 1)) zeta_0^(bold(h) dot.op \( bold(b) - bold(r) \)) $

expresses each bin event as a finite linear combination of characters. The two phase vectors in (11.1) are independent choices, and complex conjugation simply permutes the available root-of-unity phases. Applying this identity at $n$ and $n + 1$ proves factorization of the limiting expectations of every pair of fixed functions of their count vectors. Both marginal limits exist by Lemma 3; the shift of the averaging range changes a bounded marginal average by $O \( 1 \/ x \)$.

If $c \, d in \( 0 \, 1 \)$ are rational, choose $J$ so that both are grid points. For $m lt.eq x$, the condition $P^(+) \( m \) lt.eq x^c$ is exactly the vanishing of all counts in bins with lower endpoint at least $x^c$. Hence the joint smoothness event with thresholds $x^c \, x^d$ has a limiting density equal to the product of its two marginal limits. The next calculation identifies those limits.

=== 11.2 The Dickman marginal <the-dickman-marginal>

We recover the classical marginal law, originating with Dickman and developed by Ramaswami and de Bruijn #cite(label("Dickman1930")) #cite(label("Ramaswami1949")) #cite(label("deBruijn1951")), from the factorial moments already computed for the bin counts.

#thm([Lemma 11.1.])[
  (Dickman marginal).  #emph[For every fixed $c in \( 0 \, 1 \)$, 
#[#set math.equation(numbering: n => "(11.2)")
 $ lim_(x arrow.r oo) 1 / x \# { 1 lt.eq m lt.eq x : P^(+) \( m \) lt.eq x^c } = rho \( 1 \/ c \) . $ <eq:distribution-dickman>]

 The limit is through all real $x$.]
] <lem:distribution-dickman>

#proof[
  First suppose that $c = k_0 \/ J$ for integers $J gt.eq 2$ and $1 lt.eq k_0 < J$. For $m lt.eq x$, set
  $ N_(c \, x) \( m \) = sum_(k = k_0)^(J - 1) Omega_(cal(B)_(k \, x)) \( m \) . $
  Then $P^(+) \( m \) lt.eq x^c$ exactly when $N_(c \, x) \( m \) = 0$, and $0 lt.eq N_(c \, x) \( m \) lt.eq J$. For a nonnegative integer $z$, write $\( z \)_h = z \( z - 1 \) dots.h.c \( z - h + 1 \)$, with $\( z \)_0 = 1$. The finite inclusion–exclusion identity is
  $ upright(bold(1))_({ N_(c \, x) \( m \) = 0 }) = sum_(h = 0)^J frac(\( - 1 \)^h, h !) \( N_(c \, x) \( m \) \)_h . $
  For each $0 lt.eq h lt.eq J$, the falling-factorial multinomial identity gives
  $ \( N_(c \, x) \( m \) \)_h = sum_(r_(k_0) \, dots.h \, r_(J - 1) gt.eq 0\
r_(k_0) + dots.h.c + r_(J - 1) = h) frac(h !, product_(k = k_0)^(J - 1) r_k !) product_(k = k_0)^(J - 1) #scale(x: 120%, y: 120%)[\(] Omega_(cal(B)_(k \, x)) \( m \) #scale(x: 120%, y: 120%)[\)]_(r_k) . $
  Apply the initial-segment form of (2.9) to every term, with $r_k = 0$ for $k < k_0$. The multinomial coefficient counts the assignments of the $h$ ordered variables to the bins. Summing the resulting simplex integrals therefore joins those bins into $\( c \, 1 \]$ and gives
  $ lim_(x arrow.r oo) 1 / x sum_(1 lt.eq m lt.eq x) \( N_(c \, x) \( m \) \)_h = integral_(s_1 \, dots.h \, s_h in \( c \, 1 \]\
s_1 + dots.h.c + s_h lt.eq 1) product_(i = 1)^h frac(d s_i, s_i) . $
  For $h = 0$, the empty integral is one, and the left-hand limit is also one. The initial-segment limit used here holds through real $x$, as does the factorial-moment limit in Section 2.
  In this integral put $s_i = c v_i$. The upper bound on each $v_i$ is then implied by $v_1 + dots.h.c + v_h lt.eq 1 \/ c$, and changing the lower boundary from $v_i > 1$ to $v_i gt.eq 1$ does not change the integral. Averaging the inclusion–exclusion identity shows that the rational smoothness density is $H \( 1 \/ c \)$, where for $u gt.eq 0$ we put
  #[#set math.equation(numbering: n => "(11.3)")
   $ H \( u \) = 1 + sum_(h gt.eq 1) frac(\( - 1 \)^h, h !) I_h \( u \) \, #h(2em) I_h \( u \) = integral_(v_1 \, dots.h \, v_h gt.eq 1\
v_1 + dots.h.c + v_h lt.eq u) product_(i = 1)^h frac(d v_i, v_i) . $ <eq:distribution-H>]
  The sum is locally finite because $I_h \( u \) = 0$ when $h > u$. In particular, $1 \/ c lt.eq J$ ensures that the sum at $u = 1 \/ c$ agrees with the finite inclusion–exclusion sum above. Put $I_0 \( u \) = 1$ for $u gt.eq 0$.
  For $h gt.eq 1$ and $y > z gt.eq 1$, symmetry and the identity $1 = \( v_1 + dots.h.c + v_h \) \/ \( v_1 + dots.h.c + v_h \)$ give
  #[#set math.equation(numbering: n => "(11.4)")
   $ I_h \( y \) - I_h \( z \) = h integral_z^y I_(h - 1) \( t - 1 \) frac(d t, t) . $ <eq:distribution-delay>]
  To verify this, cancel the last denominator after using symmetry and set $t = v_1 + dots.h.c + v_h$. The remaining variables satisfy $v_1 + dots.h.c + v_(h - 1) lt.eq t - 1$. The same formula holds for $h = 1$. Thus the $I_h$ are continuous, $H = 1$ on $\[ 0 \, 1 \]$, and
  $ u H' \( u \) = - H \( u - 1 \) #h(2em) \( u > 1 \) . $
  Successive integration on the intervals $\[ k \, k + 1 \]$ uniquely determines a continuous solution from its values on $\[ 0 \, 1 \]$. Hence $H = rho$, proving (11.2) for rational $c$.
  For an arbitrary real $c in \( 0 \, 1 \)$, choose rational $c_(-) < c < c_(+)$ in $\( 0 \, 1 \)$. The smoothness event at $x^(c_(-))$ is contained in the event at $x^c$, which is contained in the event at $x^(c_(+))$. The rational limits bound the lower and upper limits of the middle normalized count by $rho \( 1 \/ c_(-) \)$ and $rho \( 1 \/ c_(+) \)$. Letting $c_(-) \, c_(+)$ approach $c$ and using continuity of $rho$ at the finite argument $1 \/ c$ proves (11.2). ◻
]

The marginal law also supplies the endpoint behavior of the limiting distribution. It gives $0 lt.eq rho \( u \) lt.eq 1$ for $u > 1$, and the same bounds hold at $u = 1$ by definition. The delay equation makes $rho$ nonincreasing on $\[ 1 \, oo \)$. Its limit at infinity must be zero: if that limit were $L > 0$, integrating $rho' \( u \) = - rho \( u - 1 \) \/ u lt.eq - L \/ u$ would contradict nonnegativity. Consequently

#[#set math.equation(numbering: n => "(11.5)")
 $ D \( t \) = cases(delim: "{", 0 \, & t lt.eq 0 \,, rho \( 1 \/ t \) \, & 0 < t < 1 \,, 1 \, & t gt.eq 1) $ <eq:distribution-D>]

is a continuous distribution function, including at zero and one, and its probability measure has no atoms.

=== 11.3 Fixed and moving thresholds <fixed-and-moving-thresholds>

Combining the Fourier inversion with Lemma 40 gives, for every pair of rational $c \, d in \( 0 \, 1 \)$,

#[#set math.equation(numbering: n => "(11.6)")
 $ lim_(x arrow.r oo\
x in bb(N)) 1 / x \# { 1 lt.eq n < x : P^(+) \( n \) lt.eq x^c \, med P^(+) \( n + 1 \) lt.eq x^d } = rho \( 1 \/ c \) rho \( 1 \/ d \) . $ <eq:distribution-rational>]

We first extend this fixed-scale law to arbitrary real exponents and real counting endpoints. Fix $c \, d in \( 0 \, 1 \)$ and rational exponents $c_(-) < c < c_(+)$ and $d_(-) < d < d_(+)$ in $\( 0 \, 1 \)$. Given real $X$, put $x = floor.l X floor.r + 1$. Then $x \/ X arrow.r 1$, the integer ranges $n lt.eq X$ and $n < x$ agree, and for all sufficiently large $X$,

$ x^(c_(-)) lt.eq X^c lt.eq x^(c_(+)) \, #h(2em) x^(d_(-)) lt.eq X^d lt.eq x^(d_(+)) . $

Thus the normalized count over $1 lt.eq n lt.eq X$ with thresholds $X^c \, X^d$ lies between $x \/ X$ times the two normalized counts in (11.6) at the lower and upper rational exponents. Taking lower and upper limits through real $X$, then letting the rational exponents approach $c \, d$, proves

#[#set math.equation(numbering: n => "(11.7)")
 $ & lim_(X arrow.r oo) 1 / X \# { 2 lt.eq n lt.eq X : P^(+) \( n \) lt.eq X^c \, med P^(+) \( n + 1 \) lt.eq X^d }\
 & #h(2em) = D \( c \) D \( d \) = rho \( 1 \/ c \) rho \( 1 \/ d \) #h(2em) \( 0 < c \, d < 1 \) . $ <eq:distribution-fixed>]

The omission of $n = 1$ changes at most one summand. In (11.7), the exponents are fixed and the limit is through all real $X$.

This also gives the fixed-scale upper-tail independence law discussed by Erdős and Pomerance #cite(label("ErdosPomerance1978")) p. 311:

#[#set math.equation(numbering: n => "(11.8)")
 $ & lim_(X arrow.r oo) 1 / X \# { 2 lt.eq n lt.eq X : P^(+) \( n \) > X^c \, med P^(+) \( n + 1 \) > X^d }\
 & #h(2em) = \( 1 - D \( c \) \) \( 1 - D \( d \) \) #h(2em) \( 0 lt.eq c \, d lt.eq 1 \) . $ <eq:distribution-upper-tail>]

For interior exponents this follows by inclusion–exclusion from (11.7) and the two marginal laws. The marginal for $n + 1$ is the one in Lemma 40, since shifting its counting range changes only $O \( 1 \)$ terms. Replacing either strict comparison in (11.8) by a weak one has the same limit. Indeed, for fixed $c > 0$, equality $P^(+) \( m \) = X^c$ is impossible unless $X^c$ is a prime $p$; in that case every such $m$ is divisible by $p$, giving only $O \( X^(1 - c) + 1 \) = o \( X \)$ possibilities for $m lt.eq X + 1$. At exponent zero, the upper-tail condition holds for every $m gt.eq 2$, and equality can occur only at $m = 1$. At exponent one, an upper-tail condition on $m lt.eq X + 1$ has only $O \( 1 \)$ possible integers. These observations give the endpoint cases of (11.8) as well. Its right-hand side is continuous on $\[ 0 \, 1 \]^2$ by (11.5).

#proof[
  Fix $a \, b in \( 0 \, 1 \)$ and choose fixed exponents $c_(-) < a < c_(+)$ and $d_(-) < b < d_(+)$ in $\( 0 \, 1 \)$. For each fixed $epsilon in \( 0 \, 1 \)$, all sufficiently large real $X$ satisfy, uniformly for $epsilon X lt.eq n lt.eq X$,
  $ X^(c_(-)) lt.eq n^a lt.eq X^(c_(+)) \, #h(2em) X^(d_(-)) lt.eq n^b lt.eq X^(d_(+)) . $
  On this interval, the fixed-scale event at the lower exponents is contained in the moving-threshold event of Theorem 1, which is contained in the fixed-scale event at the upper exponents. The discarded initial interval costs at most $epsilon + O \( 1 \/ X \)$ in normalized counting. The limit through all real $X$ in (11.7) therefore bounds the lower and upper limits of the desired count by the corresponding products at the lower and upper exponents, with that error. Let $epsilon arrow.b 0$, then let the exponents approach $a \, b$. Continuity of $D$ gives the claimed product through all real endpoints, with ordinary, unweighted counting. ◻
]

=== 11.4 The ordering probability <the-ordering-probability>

#proof[
  For $n gt.eq 2$, put
  $ U_n = frac(log P^(+) \( n \), log n) \, #h(2em) V_n = frac(log P^(+) \( n + 1 \), log n) . $
  The empirical probability law means uniform sampling from $2 lt.eq n lt.eq floor.l X floor.r$; its normalization $1 \/ \( floor.l X floor.r - 1 \)$ differs from $1 \/ X$ by a factor tending to one. Recall the continuous distribution function $D$ from (11.5).
  Although $0 lt.eq U_n lt.eq 1$, the second coordinate can slightly exceed one. This overshoot vanishes and does not alter the limiting law: for every $n gt.eq N gt.eq 2$,
  $ 0 lt.eq V_n lt.eq frac(log \( n + 1 \), log n) lt.eq 1 + frac(1, N log N) . $
  Consequently the empirical laws are tight and every limiting law is supported on $\[ 0 \, 1 \]^2$. More explicitly, clamp $V_n$ to $tilde(V)_n = min \( V_n \, 1 \)$. For $0 < a \, b < 1$, the joint distribution functions of $\( U_n \, tilde(V)_n \)$ are exactly those of $\( U_n \, V_n \)$, hence converge by Theorem 1 to $D \( a \) D \( b \)$. These interior rectangles determine the limiting probability law: their masses approach one as $a \, b arrow.t 1$, and finite differences give the masses of all interior grid cells. Approximating continuous functions on $\[ 0 \, 1 \]^2$ by such grids proves weak convergence to the product law with marginal distribution function $D$. Removing the clamping does not affect this convergence, by the displayed bound and the vanishing proportion of $n < N$.
  Let $U \, V$ be independent with distribution function $D$. Continuity gives $bb(P) \( U = V \) = 0$, and exchangeability of this limiting pair gives
  $ bb(P) \( U < V \) = bb(P) \( V < U \) = 1 / 2 . $
  The boundary of the set ${ \( u \, v \) : u < v }$ is the diagonal, which has zero product mass. Weak convergence therefore yields
  $ lim_(X arrow.r oo) 1 / X \# { 2 lt.eq n lt.eq X : U_n < V_n } = 1 / 2 . $
  Since both logarithmic sizes have the same positive denominator, $U_n < V_n$ is exactly $P^(+) \( n \) < P^(+) \( n + 1 \)$. Applying the same continuity-set argument to $v < u$ gives the reverse ordering limit as well. The symmetry used here belongs to the independent limiting law; no symmetry of the finite consecutive-integer pairs is assumed. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
