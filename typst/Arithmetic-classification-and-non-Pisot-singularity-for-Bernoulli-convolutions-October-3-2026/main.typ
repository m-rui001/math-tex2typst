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

#align(center)[#text(size: 16pt, weight: "bold")[Arithmetic classification and non-Pisot singularity \
for Bernoulli convolutions]]
#align(center)[OpenAI]
#align(center)[October 3, 2026]

== 1 Introduction <sec:introduction>

For $0 < lambda < 1$, the unbiased Bernoulli convolution $nu_lambda$ is the law of

#[#set math.equation(numbering: n => "(1.1)")
 $ Y_lambda = sum_(n = 0)^oo epsilon_n lambda^n \, #h(2em) bb(P) \( epsilon_n = 1 \) = bb(P) \( epsilon_n = - 1 \) = 1 / 2 \, $ <intro:series>]

where the signs are independent. The series converges absolutely. We also use the bit form $mu_lambda$, the law of

$ X_lambda = sum_(n = 0)^oo u_n lambda^n \, #h(2em) bb(P) \( u_n = 0 \) = bb(P) \( u_n = 1 \) = 1 / 2 . $

The relation $Y_lambda = 2 X_lambda - \( 1 - lambda \)^(- 1)$ preserves singularity and absolute continuity. A measure is singular if it gives full mass to a Borel set of Lebesgue measure zero. Bernoulli convolutions have pure type: they are either singular or absolutely continuous #cite(label("JessenWintner1935")) Theorem 11. The classification problem asks which of these alternatives holds for each parameter, including exceptional parameters.

For $lambda < 1 \/ 2$, a direct interval cover proves singularity; at $lambda = 1 \/ 2$, $nu_lambda$ is uniform on $\[ - 2 \, 2 \]$. The interval $\( 1 \/ 2 \, 1 \)$ presents the arithmetic difficulty. A #emph[Pisot number] is a real algebraic integer $beta > 1$ whose other conjugates have modulus less than one. Erdős proved singularity when $lambda^(- 1)$ is Pisot by showing that the Fourier transform does not tend to zero #cite(label("Erdos1939")). Garsia subsequently established absolute continuity for a different arithmetic class, including reciprocals of algebraic integers of absolute norm two whose conjugates all have modulus greater than one #cite(label("Garsia1962")).

The almost-everywhere theory gives a complementary picture. Solomyak proved that $nu_lambda$ has an $L^2$ density for Lebesgue-almost every $lambda in \( 1 \/ 2 \, 1 \)$ #cite(label("Solomyak1995")). Hochman’s work relates dimension loss to very strong concentration of cylinder positions #cite(label("Hochman2014")), and Shmerkin proved that the possible singular parameters in this interval form a set of Hausdorff dimension zero #cite(label("Shmerkin2014")). Varjú proved full dimension for every transcendental parameter in this interval #cite(label("VarjuTranscendental2019")). These conclusions leave measure type at exceptional parameters to be resolved; full dimension alone does not imply absolute continuity. The survey #cite(label("PeresSchlagSolomyak2000")) describes the classical development and the roles of arithmetic, overlap, and Fourier decay.

Garsia connected singularity with entropy of finite sums #cite(label("Garsia1963")). Algebraic approximation also plays a central role in the dimension theory: Breuillard and Varjú showed that a dimension-deficient parameter can be approximated exceptionally closely by algebraic parameters whose Bernoulli convolutions also have dimension less than one #cite(label("BreuillardVarju2019")) Theorem 1. The criterion below addresses measure type and also records the number and coefficient directions of nearby algebraic targets.

A #emph[Salem number] is a real algebraic integer $beta > 1$ whose other conjugates consist of $beta^(- 1)$ and conjugates on the unit circle. In degree four there is a single nonreal conjugate pair. Salem proved that the Fourier transform of $nu_lambda$ tends to zero whenever $lambda^(- 1)$ is not Pisot #cite(label("Salem1943")). Thus Fourier nondecay cannot prove singularity for Salem parameters. Marshall-Maldonado and Solomyak recently obtained quantitative decay estimates for these convolutions #cite(label("MarshallMaldonadoSolomyak2026")) Appendix B; those estimates do not decide absolute continuity. The existence of singular examples with non-Pisot reciprocal is explicitly recorded as open in the recent literature #cite(label("BakerEtAl2026")) #cite(label("KernSterk2026")).

This paper gives an arithmetic criterion for every parameter and proves two classes of non-Pisot singularity results. The criterion in Theorem 1 uses finite sets of real algebraic units. Their minimal polynomials have coefficients in ${ - 1 \, 0 \, 1 }$, prescribed degree, and irreducible reduction modulo two. A target unit is retained when nearby units supply sufficiently many distinct initial coefficient vectors in a fixed positive proportion of the coordinate orthants. Singularity is equivalent to one-sided approximation by these retained targets at a fixed geometric rate. All target sets are defined by finite polynomial algebra; their construction uses no information about the type of any Bernoulli convolution. The resulting classification is an approximation property, and need not provide a short test for membership at a given real parameter.

The main step behind the criterion is a realization lemma. Concentration of the measure produces many pairs of finite bit words with nearby sums and different first bits. Their difference vectors can be completed to height-one polynomials having a root strictly above the parameter. A uniform finite-order nonvanishing estimate preserves a sign change, while prime polynomials in arithmetic progressions over $bb(F)_2$ supply irreducibility without altering the initial coefficients. This separates the concentration argument from the algebraic realization, and gives a way to translate overlap information into constrained algebraic approximation.

The two non-Pisot results are proved directly; the criterion then yields the corresponding approximation properties. Theorem 11 proves singularity for the reciprocal of every quartic Salem number in $\( 1 \, 2 \)$. We construct algebraic multipliers whose unit-circle conjugates become small faster than the associated cosine losses accumulate. Trace identities then localize many Fourier phases to disjoint windows of random signs. Their averages concentrate under the Bernoulli convolution while tending to zero in Lebesgue mean square. This yields singularity even though the Fourier transform tends to zero. The construction applies in particular to the two quartic polynomials specified in Corollary 14.

Theorem 15 treats a root of an explicit degree-$31$ polynomial with a complex-conjugate pair outside the unit circle. Here word evaluations lie in a lattice whose box volume grows slightly faster than the reciprocal parameter to the word length. A product of positive trigonometric factors has bounded Lebesgue integral but grows exponentially on typical word evaluations. The resulting saving outweighs the extra volume growth. A finite-state description of nearly cancelling frequencies controls the integral; an explicit rational calculation verifies the required moment inequalities. Appendix 7 provides the root enclosures, finite recurrences, and analytic error bounds for that calculation.

Sections 2–4 prove the classification and recover the basic Pisot and Garsia cases. Sections 5 and 6 establish the two non-Pisot results. All logarithms are natural unless a base is specified, and all decimal constants used in estimates denote exact rational numbers.

== 2 An arithmetic criterion for the measure type <cls:section-criterion>

The criterion in this section is expressed through finite sets of algebraic units and the coefficient vectors of their minimal polynomials. Its proof has two parts. A sufficiently large cluster of coefficient vectors forces concentration of the Bernoulli convolution. Conversely, concentration produces many short polynomial prefixes, each of which can be completed to an irreducible polynomial with a root just above the parameter.

For integers $n gt.eq 1$ and $d gt.eq 2$, let $R \( n \, d \)$ be the set of real algebraic units $r in \( 1 \/ 2 \, 1 \)$ of degree $d n$ whose minimal polynomial has all coefficients in ${ - 1 \, 0 \, 1 }$ and is irreducible modulo $2$. An algebraic unit here means an algebraic integer with algebraic-integer inverse. Write $p_r$ for the minimal polynomial with its sign chosen so that its constant coefficient is $- 1$, and set

$ pi_n \( p_r \) = \( \[ t^0 \] p_r \, dots.h \, \[ t^(n - 1) \] p_r \) in { - 1 \, 0 \, 1 }^n . $

For $r in R \( n \, d \)$, define the finite set

#[#set math.equation(numbering: n => "(2.1)")
 $ W_n \( r \; d \) = {pi_n \( p_q \) : q in R \( n \, d \) \, med \| q - r \| lt.eq 4^(- n)} . $ <cls:projection-set>]

This is a set of vectors: repeated projections, including those arising from conjugate roots of one polynomial, are counted only once.

For a bit word $u = \( u_0 \, dots.h \, u_(n - 1) \) in { 0 \, 1 }^n$, let

$ cal(O)_u = { w in bb(R)^n : \( 2 u_i - 1 \) w_i gt.eq 0 upright(" for ") 0 lt.eq i < n } $

be the associated closed orthant. A vector with a zero coordinate belongs to both choices of sign in that coordinate. For $j gt.eq 1$, put

#[#set math.equation(numbering: n => "(2.2)")
 $ R_(*) \( n \, d \, j \) = {r in R \( n \, d \) : \# {u in { 0 \, 1 }^n : \# \( W_n \( r \; d \) ∩ cal(O)_u \) gt.eq j \( 2 r \)^n} gt.eq 2^n / d} . $ <cls:retained-roots>]

All comparisons in this definition involve algebraic numbers and finite sets. In particular, $R \( n \, d \)$ and $R_(*) \( n \, d \, j \)$ can be obtained by finite enumeration of integer polynomials and exact algebraic comparisons.

#thm([Theorem 2.1.])[
  (Arithmetic criterion).  #emph[Define the parameter set 
#[#set math.equation(numbering: n => "(2.3)")
 $ cal(C) = \( 0 \, 1 \/ 2 \) med union med [\( 1 \/ 2 \, 1 \) ∩ union.big_(d gt.eq 2) med ⋂_(j gt.eq 1) med limsup_(n arrow.r oo) union.big_(r in R_(*) \( n \, d \, j \)) \[ r - 4^(- n) \, r \)] . $ <cls:criterion>]

 For every $lambda in \( 0 \, 1 \)$, the measure $nu_lambda$ is singular if and only if $lambda in cal(C)$, and is absolutely continuous if and only if $lambda in.not cal(C)$. Replacing $limsup$ by $liminf$ in (2.3) gives the same set.]
] <cls:classification>

Thus the degree multiplier $d$ may be fixed before the crowding level $j$ is chosen. For a singular parameter in $\( 1 \/ 2 \, 1 \)$, each level $j$ is attained at every sufficiently large $n$, with the threshold in $n$ allowed to depend on $j$. The predicate uses only polynomial arithmetic, one-sided approximation, and counts of coefficient vectors. Determining membership for a particular parameter can nevertheless be difficult; the theorem does not supply a finite decision procedure for arbitrary real inputs.

=== 2.1 Measure-theoretic preliminaries <cls:subsection-preliminaries>

We use the bit form

$ X_lambda = sum_(i = 0)^oo u_i lambda^i \, #h(2em) bb(P) \( u_i = 0 \) = bb(P) \( u_i = 1 \) = 1 / 2 \, $

with law $mu_lambda$, and write $L = \( 1 - lambda \)^(- 1)$. The affine identity $Y_lambda = 2 X_lambda - L$ shows that $mu_lambda$ and $nu_lambda$ have the same measure type. For a word $u in { 0 \, 1 }^n$, put

#[#set math.equation(numbering: n => "(2.4)")
 $ s_u \( lambda \) = sum_(i = 0)^(n - 1) u_i lambda^i . $ <cls:prefix-sum>]

Conditioned on this prefix, $X_lambda$ lies in $s_u \( lambda \) + lambda^n \[ 0 \, L \]$.

#thm([Lemma 2.2.])[
  (Pure type and the baseline parameters).  #emph[For $0 < lambda < 1$, the measure $mu_lambda$ is either singular or absolutely continuous. It is singular for $lambda < 1 \/ 2$ and uniform on $\[ 0 \, 2 \]$ for $lambda = 1 \/ 2$. Consequently, $nu_(1 \/ 2)$ is uniform on $\[ - 2 \, 2 \]$.]
] <cls:pure-type>

#proof[
  Let $T_i \( x \) = i + lambda x$ for $i = 0 \, 1$, and let $cal(T) rho = 1 / 2 \( T_0 \)_(*) rho + 1 / 2 \( T_1 \)_(*) rho$. Iteration from any probability measure $rho$ gives the law of
  $ sum_(i = 0)^(n - 1) u_i lambda^i + lambda^n Z \, $
  where $Z$ has law $rho$ and is independent of the bits. Since $lambda^n Z arrow.r 0$ in probability, these laws converge weakly to $mu_lambda$. Hence $mu_lambda$ is the unique invariant probability of $cal(T)$.
  The operator $cal(T)$ preserves absolute continuity and singularity. By uniqueness of the Lebesgue decomposition, the absolutely continuous and singular parts of its invariant probability are separately invariant. If both were nonzero, normalizing them would give two distinct invariant probabilities, a contradiction.
  For $lambda < 1 \/ 2$, the support is covered, for every $n$, by $2^n$ intervals of length $L lambda^n$. Its Lebesgue measure is therefore zero. For $lambda = 1 \/ 2$, the usual fair binary expansion gives the uniform law on $\[ 0 \, 2 \]$. ◻
]

We shall also use the following elementary formulation of concentration. It isolates the measure-theoretic input needed to establish membership in (2.3).

#thm([Lemma 2.3.])[
  (Compact concentration).  #emph[A Borel probability measure $rho$ on $bb(R)$ is singular if and only if, for every $epsilon > 0$, there is a compact set $K$ with 
$ "Leb" \( K \) < epsilon \, #h(2em) rho \( K \) > 1 - epsilon . $

]
] <cls:compact-concentration>

#proof[
  If $rho$ is singular, apply inner regularity to a Borel null set of full $rho$-measure. Conversely, choose such compact sets $K_m$ with $epsilon = 2^(- m)$. The set $limsup_m K_m$ has Lebesgue measure zero, since $sum_m "Leb" \( K_m \) < oo$, and has $rho$-measure one, since every union $union.big_(m gt.eq M) K_m$ has $rho$-measure one. ◻
]

=== 2.2 Algebraic clusters imply singularity <cls:subsection-forward>

Suppose $lambda in \( 1 \/ 2 \, 1 \)$ satisfies the condition in (2.3), and fix a degree multiplier $d$ witnessing it. For each $j$, there are arbitrarily large $n$ and $r in R_(*) \( n \, d \, j \)$ such that

$ r - 4^(- n) lt.eq lambda < r . $

If $w in W_n \( r \; d \)$, choose a polynomial $p_q$ giving this projection. Its root $q$ satisfies $\| q - lambda \| lt.eq 2 dot.op 4^(- n)$. On any fixed compact subinterval of $\( 0 \, 1 \)$ containing $lambda$ in its interior,

$ \| p'_q \( t \) \| lt.eq sum_(k gt.eq 1) k t^(k - 1) = frac(1, \( 1 - t \)^2) . $

The coefficients of index at least $n$ contribute at most $L lambda^n$ at $lambda$. Thus there is a constant $B = B \( lambda \)$, independent of $n \, d \, j \, w$, such that for all sufficiently large $n$,

#[#set math.equation(numbering: n => "(2.5)")
 $ lr(|sum_(i = 0)^(n - 1) w_i lambda^i|) lt.eq B lambda^n . $ <cls:slab>]

Here we used $4^(- n) = o \( lambda^n \)$.

If $w in cal(O)_u ∩ { - 1 \, 0 \, 1 }^n$, then $v = u - w$ belongs to ${ 0 \, 1 }^n$. Different $w$ give different $v$. By (2.2), at least $2^n \/ d$ words $u$ consequently have at least $j \( 2 r \)^n gt.eq j \( 2 lambda \)^n$ neighbors $v$ satisfying

$ \| s_u \( lambda \) - s_v \( lambda \) \| lt.eq B lambda^n . $

Partition the line into half-open bins of length $lambda^n$, and let $cal(I)$ be the bins containing at least one of these words $u$, where a word occupies the bin containing its prefix sum. For each $J in cal(I)$, choose one such word. Its neighbors lie in the $B lambda^n$-enlargement of $J$. Each prefix sum can belong to the enlargements of at most $N_B = 2 ceil.l B ceil.r + 3$ bins. Counting word–bin incidences yields

$ \# cal(I) thin j \( 2 lambda \)^n lt.eq N_B 2^n \, #h(2em) \# cal(I) lt.eq frac(N_B lambda^(- n), j) . $

Enlarge each bin $J = \[ a \, a + lambda^n \)$ to $\[ a \, a + \( 1 + L \) lambda^n \]$, and denote their union by $E_j$. The tail bound following (2.4) gives

#[#set math.equation(numbering: n => "(2.6)")
 $ "Leb" \( E_j \) lt.eq frac(\( 1 + L \) N_B, j) \, #h(2em) mu_lambda \( E_j \) gt.eq 1 / d . $ <cls:forward-concentration>]

Absolute continuity of a finite measure makes its mass uniformly small on sets of sufficiently small Lebesgue measure. Therefore (2.6), as $j arrow.r oo$, rules out absolute continuity. Lemma 2 proves singularity.

== 3 Constructing the algebraic approximants <cls:section-converse>

We now prove the converse in Theorem 1. Throughout this section, $lambda in \( 1 \/ 2 \, 1 \)$ is fixed, and we abbreviate $mu = mu_lambda$, $X = X_lambda$, and $s_u = s_u \( lambda \)$. The first step is to turn concentration of $mu$ into many close prefix sums with opposite first bits. Opposite first bits ensure that their difference polynomial has constant coefficient $- 1$, as required by the algebraic criterion.

=== 3.1 Overlap of the first-bit measures <overlap-of-the-first-bit-measures>

Define subprobability measures

$ mu_i \( A \) = bb(P) \( X in A \, med u_0 = i \) \, #h(2em) i = 0 \, 1 . $

Their sum is $mu$. The following fact uses only $lambda > 1 \/ 2$, not singularity.

#thm([Lemma 3.1.])[
  #emph[There is a finite measure $xi eq.not 0$ with $xi lt.eq mu_0$ and $xi lt.eq mu_1$.]
] <cls:first-bit-overlap>

#proof[
  If no such measure exists, the densities of $mu_0$ and $mu_1$ with respect to $mu$ have disjoint supports almost everywhere. Thus $mu_0$ and $mu_1$ are mutually singular. We will show that this makes the conditional entropy of the first $n$ bits, given a $lambda^n$-quantization of $X$, arbitrarily small compared with $n$. There are only $O \( lambda^(- n) \)$ quantization cells, too few to carry the full entropy $n log 2$ of those bits. For every $eta in \( 0 \, 1 \/ 2 \)$, inner regularity then gives disjoint compact sets $K_0 \, K_1$ such that
  $ bb(P) \( X in K_(u_0) \) > 1 - eta . $
  Let $delta = "dist" \( K_0 \, K_1 \) > 0$, and choose an integer $h gt.eq 1$ with $lambda^h < delta \/ 3$.
  Set $Q_n = floor.l X \/ lambda^n floor.r$. Given $Q_n$ and the bits $u_0 \, dots.h \, u_(i - 1)$, one can approximate
  $ X^(\( i \)) = frac(X - sum_(k < i) u_k lambda^k, lambda^i) $
  to within $lambda^(n - i)$. The pair $\( X^(\( i \)) \, u_i \)$ has the same law as $\( X \, u_0 \)$. For $i lt.eq n - h$, the approximation therefore determines an estimator of $u_i$ with error probability at most $eta$: when $X^(\( i \)) in K_(u_i)$, choose the nearer of the two compact sets.
  Write $H$ for Shannon entropy using natural logarithms, and put $h_2 \( eta \) = - eta log eta - \( 1 - eta \) log \( 1 - eta \)$. The error-indicator argument gives
  $ H \( u_i divides Q_n \, u_0 \, dots.h \, u_(i - 1) \) lt.eq h_2 \( eta \) #h(2em) \( i lt.eq n - h \) . $
  Indeed, the estimator and its binary error indicator recover $u_i$; the entropy of that indicator is at most $h_2 \( eta \)$. The remaining at most $h$ bits have conditional entropy at most $h log 2$. Since $X in \[ 0 \, L \]$, the variable $Q_n$ takes at most $L lambda^(- n) + 2$ values. The chain rule now gives
  $ n log 2 lt.eq H \( Q_n \) + H \( u_0 \, dots.h \, u_(n - 1) divides Q_n \) lt.eq n log \( 1 \/ lambda \) + n h_2 \( eta \) + O_(lambda \, eta) \( 1 \) . $
  Choose $eta$ so small that $h_2 \( eta \) < log \( 2 lambda \)$ and let $n arrow.r oo$. This is a contradiction. ◻
]

#thm([Proposition 3.2.])[
  (Many close prefixes with opposite first bits).  #emph[If $mu_lambda$ is singular, there are constants $a in \( 0 \, L \/ 2 \)$ and $c > 0$, depending only on $lambda$, with the following property. For every $Q > 1$ and all sufficiently large $n$, at least $c 2^n$ words $u in { 0 \, 1 }^n$ with $u_0 = 0$ each have at least $Q \( 2 lambda \)^n$ distinct neighbors $v in { 0 \, 1 }^n$ such that 
#[#set math.equation(numbering: n => "(3.1)")
 $ v_0 = 1 \, #h(2em) \| s_u - s_v \| lt.eq \( L - a \) lambda^n . $ <cls:cross-pair-bound>]

 The constants $a \, c$ are independent of $Q$ and $n$.]
] <cls:cross-pairs>

#proof[
  Fix $xi$ from Lemma 4, and write $b = xi \( bb(R) \) > 0$. The endpoints $0 \, L$ have $mu$-measure zero, because each requires all the bits to have one prescribed value. Choose $a in \( 0 \, L \/ 2 \)$ so that $mu \( \[ a \, L - a \] \) > 1 - b \/ 8$.
  For each $n$, let $X^(\( n \)) = sum_(k gt.eq 0) u_(n + k) lambda^k$, and restrict the first-bit measures by defining
  $ mu'_(i \, n) \( A \) = bb(P) \( X in A \, med u_0 = i \, med X^(\( n \)) in \[ a \, L - a \] \) . $
  The sum of the masses discarded from $mu_0 \, mu_1$ is less than $b \/ 8$, since $X^(\( n \))$ has law $mu$.
  Fix $Q > 1$. By Lemma 3, choose a compact set $K$ with $"Leb" \( K \) < epsilon$ and $mu \( K \) > 1 - epsilon$, where
  $ epsilon < b \/ 8 \, #h(2em) frac(2 epsilon Q, a) < b / 4 . $
  Then $xi \( K \) > 7 b \/ 8$. Partition the line into half-open intervals of length $a lambda^n$, and let $cal(J)_n$ consist of those meeting $K$. Compactness of $K$ implies, for all sufficiently large $n$,
  $ \# cal(J)_n lt.eq frac(2 epsilon, a lambda^n) . $
  To see this, their union is contained in the closed $a lambda^n$-neighborhood of $K$, whose Lebesgue measure tends to $"Leb" \( K \)$. Moreover,
  #[#set math.equation(numbering: n => "(3.2)")
   $ sum_(J in cal(J)_n) min_(i = 0 \, 1) mu'_(i \, n) \( J \) gt.eq frac(3 b, 4) . $ <cls:common-bin-mass>]
  Indeed, the corresponding sum with $mu_i$ in place of $mu'_(i \, n)$ is at least $xi \( K \)$, and restricting the two measures loses less than $b \/ 8$ in total.
  Let $U_i \( J \)$ be the set of words $u$ of length $n$ with $u_0 = i$ for which
  $ #scale(x: 120%, y: 120%)[\(] s_u + lambda^n \[ a \, L - a \] #scale(x: 120%, y: 120%)[\)] ∩ J eq.not diameter . $
  Each prefix has probability $2^(- n)$, so $mu'_(i \, n) \( J \) lt.eq 2^(- n) \# U_i \( J \)$. Discard the intervals for which $\# U_1 \( J \) < Q \( 2 lambda \)^n$. Their contribution to (3.2) is at most
  $ frac(2 epsilon, a lambda^n) thin 2^(- n) Q \( 2 lambda \)^n = frac(2 epsilon Q, a) < b / 4 . $
  Thus the sum of the minima over the remaining intervals is at least $b \/ 2$.
  A fixed interval $s_u + lambda^n \[ a \, L - a \]$ meets at most
  $ C_a = ⌈frac(L - 2 a, a)⌉ + 2 $
  of the bins. If $cal(U)$ is the union of $U_0 \( J \)$ over the retained bins, it follows that
  $ b / 2 lt.eq 2^(- n) sum_(J upright(" retained")) \# U_0 \( J \) lt.eq 2^(- n) C_a \# cal(U) . $
  Take $c = b \/ \( 2 C_a \)$. For every $u in cal(U)$, choose one retained bin $J$ with $u in U_0 \( J \)$. All $v in U_1 \( J \)$ satisfy (3.1): two points in $J$ differ by less than $a lambda^n$, and two tails in $lambda^n \[ a \, L - a \]$ differ by at most $\( L - 2 a \) lambda^n$. There are at least $Q \( 2 lambda \)^n$ such neighbors. ◻
]

=== 3.2 Completion to irreducible polynomials <cls:subsection-completion>

For every pair in Proposition 5, the difference $w = u - v$ has $w_0 = - 1$ and $\| sum_(i < n) w_i lambda^i \| lt.eq \( L - a \) lambda^n$. We next extend any such coefficient vector to a polynomial whose root lies in $\( lambda \, lambda + 4^(- n) \/ 2 \]$. The first lemma ensures that a bounded-coefficient polynomial cannot remain too flat throughout this short interval.

#thm([Lemma 3.3.])[
  (Uniform finite-order nonvanishing).  #emph[Fix $lambda in \( 0 \, 1 \)$. There are an integer $M gt.eq 1$ and constants $c_0 \, x_0 > 0$ such that every real polynomial $p \( t \) = - 1 + sum_(k gt.eq 1) a_k t^k$ with $\| a_k \| lt.eq 1$ satisfies 
$ sup_(t in \[ lambda \, lambda + x \]) \| p \( t \) \| gt.eq c_0 x^M #h(2em) \( 0 < x < x_0 \) . $

]
] <cls:finite-order>

#proof[
  There exist $M gt.eq 1$ and $delta > 0$ such that
  #[#set math.equation(numbering: n => "(3.3)")
   $ max_(0 lt.eq k lt.eq M) lr(|frac(p^(\( k \)) \( lambda \), k !)|) gt.eq delta $ <cls:jet-bound>]
  for every polynomial in the stated class. Otherwise, for each $m$ one could choose a polynomial for which all these quantities through order $m$ are less than $1 \/ m$. Extend its coefficient sequence by zeros. A coefficientwise convergent subsequence exists by compactness of $\[ - 1 \, 1 \]^(bb(N))$. The associated series converge, with every derivative, uniformly on compact subsets of the unit disk. Their limit would have all derivatives zero at $lambda$ and constant coefficient $- 1$, contradicting the identity theorem.
  For fixed $M$, equivalence of norms on polynomials of degree at most $M$ gives $kappa_M > 0$ such that
  $ sup_(0 lt.eq t lt.eq 1) lr(|sum_(k = 0)^M b_k t^k|) gt.eq kappa_M max_(k lt.eq M) \| b_k \| . $
  Apply this to the Taylor polynomial of $p \( lambda + x t \)$. For $x lt.eq 1$, (3.3) makes the right-hand side at least $kappa_M delta x^M$. The coefficient bound gives a uniform bound on the $\( M + 1 \)$st derivative in a fixed neighborhood of $lambda$, so the Taylor remainder is $O_lambda \( x^(M + 1) \)$, with $M$ fixed. Reducing $x_0$ proves the assertion with $c_0 = kappa_M delta \/ 2$. ◻
]

To impose irreducibility without disturbing the prescribed coefficients, we use the prime-polynomial theorem in arithmetic progressions. We include the deduction needed here from the function-field Riemann hypothesis; its character-sum formulation is recalled in #cite(label("GorodetskyKovaleva2024")) Theorem 3.2 and Lemma 3.3.

#thm([Lemma 3.4.])[
  (Irreducibles with prescribed initial coefficients).  #emph[Fix integers $D gt.eq 2$ and $d > 2 D$. For all sufficiently large $n$, every polynomial $F in bb(F)_2 \[ t \]$ with $deg F < D n$ and $F \( 0 \) = 1$ has a monic irreducible completion $P in bb(F)_2 \[ t \]$ satisfying 
$ deg P = d n \, #h(2em) P equiv F + t^(D n) med \( mod med t^(D n + 1) \) . $

 The threshold in $n$ is uniform in $F$.]
] <cls:prescribed-prime>

#proof[
  For a monic polynomial $f$, write $Lambda \( f \) = deg P$ if $f = P^k$ for a monic irreducible $P$, and $Lambda \( f \) = 0$ otherwise. Let $chi$ be a nonprincipal Dirichlet character modulo $t^ell$, extended by zero to nonunits. Its $L$-function is a polynomial of degree at most $ell - 1$, with inverse roots $alpha_j$ satisfying $\| alpha_j \| lt.eq sqrt(2)$; this bound includes trivial factors. Taking the logarithmic derivative of the Euler product gives
  $ lr(|sum_(f upright(" monic")\
deg f = s) Lambda \( f \) chi \( f \)|) = lr(|sum_j alpha_j^s|) lt.eq ell 2^(s \/ 2) . $
  For the principal character, the same sum is $2^s - 1$, by the zeta function of $bb(F)_2 \[ t \]$ after removal of the prime $t$. Character orthogonality therefore gives, in every invertible residue class $A$ modulo $t^ell$,
  #[#set math.equation(numbering: n => "(3.4)")
   $ sum_(f upright(" monic") \, med deg f = s\
f equiv A med mod med t^ell) Lambda \( f \) gt.eq frac(2^s - 1, 2^(ell - 1)) - ell 2^(s \/ 2) . $ <cls:prime-progression-bound>]
  The contribution from proper prime powers, even without the congruence restriction, is at most
  $ sum_(k divides s\
k gt.eq 2) 2^(s \/ k) lt.eq s 2^(s \/ 2) . $
  Take $ell = D n + 1$, $s = d n$, and $A = F + t^(D n)$. This is an invertible class. The main term in (3.4) has order $2^(\( d - D \) n)$, whereas the character error and proper-power contribution are $O \( n 2^(d n \/ 2) \)$. Since $d > 2 D$, at least one irreducible polynomial remains for all sufficiently large $n$, uniformly in $A$. ◻
]

#thm([Proposition 3.5.])[
  (Realization of a polynomial prefix).  #emph[Fix $lambda in \( 1 \/ 2 \, 1 \)$ and $a in \( 0 \, L \)$, where $L = \( 1 - lambda \)^(- 1)$. There is an integer $d_0$ such that, for each integer $d gt.eq d_0$ and all sufficiently large $n$, the following assertion holds uniformly over $w in { - 1 \, 0 \, 1 }^n$. If 
#[#set math.equation(numbering: n => "(3.5)")
 $ w_0 = - 1 \, #h(2em) lr(|sum_(i = 0)^(n - 1) w_i lambda^i|) lt.eq \( L - a \) lambda^n \, $ <cls:realization-hypothesis>]

 then some $r in R \( n \, d \)$ satisfies 
$ lambda < r lt.eq lambda + 1 / 2 4^(- n) \, #h(2em) pi_n \( p_r \) = w . $

]
] <cls:realization>

#proof[
  We first append digits to make the polynomial small at $lambda$. We then construct two irreducible completions with opposite signs there but the same sign at a nearby point to its right. Uniform finite-order nonvanishing supplies that second point, and the intermediate value theorem supplies a root between the two points.
  Let $M \, c_0 \, x_0$ be supplied by Lemma 6. Choose an integer $D gt.eq 2$ with
  #[#set math.equation(numbering: n => "(3.6)")
   $ lambda^D < 4^(- M) \, $ <cls:D-choice>]
  and then take $d_0 = 2 D + 1$.
  Start with the polynomial in (3.5) and append coefficients through index $D n - 1$. If the next index is $k$, let $e$ be the negative of the current value at $lambda$, divided by $lambda^k$. Appending $e_0 in { - 1 \, 0 \, 1 }$ changes this residual to
  $ e mapsto frac(e - e_0, lambda) . $
  Choose a nearest digit $e_0$. Once $\| e \| lt.eq 1$, the next residual has absolute value at most $1 \/ \( 2 lambda \) < 1$, so this bound is preserved. Before that time, the residual keeps its sign and its absolute value updates by
  $ \| e \| mapsto frac(\| e \| - 1, lambda) = L + frac(\| e \| - L, lambda) . $
  The initial bound $\| e \| lt.eq L - a$ implies that $\| e \| lt.eq 1$ is reached within a number of steps depending only on $lambda \, a$. Indeed, after $k$ steps without reaching this interval the absolute value is at most $L - a lambda^(- k)$, which eventually falls below $1$. Consequently, for all sufficiently large $n$, the polynomial $p_0$ constructed through index $D n - 1$ satisfies
  #[#set math.equation(numbering: n => "(3.7)")
   $ \| p_0 \( lambda \) \| lt.eq frac(lambda^(D n), 2 lambda) . $ <cls:residual>]
  Put $x_n = 4^(- n) \/ 2$. By Lemma 6, there is $t_n in \[ lambda \, lambda + x_n \]$ with $\| p_0 \( t_n \) \| gt.eq c_0 x_n^M$. Meanwhile every possible appendage with coefficients of absolute value at most one, starting at index $D n$, is bounded throughout this interval by
  $ frac(\( lambda + x_n \)^(D n), 1 - lambda - x_n) = o \( x_n^M \) . $
  This follows from (3.6), since $D n x_n arrow.r 0$. The estimate is uniform in the prefix and in the eventual length of the appendage.
  Fix $d gt.eq d_0$. Apply Lemma 7 to the reduction of $p_0$ modulo $2$, obtaining a monic irreducible polynomial $P$ of degree $d n$ with $P equiv p_0 + t^(D n) med \( mod med t^(D n + 1) \)$. Represent its coefficients of indices $D n \, dots.h \, d n$ by integers $b_k in { 0 \, 1 }$, and let
  $ T \( t \) = sum_(k = D n)^(d n) b_k t^k \, #h(2em) p_plus.minus \( t \) = p_0 \( t \) plus.minus T \( t \) . $
  Here $b_(D n) = b_(d n) = 1$. Thus $T \( lambda \) gt.eq lambda^(D n)$, and (3.7) implies $p_(-) \( lambda \) < 0 < p_(+) \( lambda \)$. At $t_n$, the negligible-tail estimate shows that both polynomials have the same nonzero sign as $p_0 \( t_n \)$. One of them therefore has a real root
  $ r in \( lambda \, t_n \] subset \( lambda \, lambda + x_n \] . $
  Both $p_plus.minus$ reduce to $P$ modulo $2$, so they are irreducible over $bb(Q)$. They have degree $d n$, leading coefficient $plus.minus 1$, constant coefficient $- 1$, and all coefficients in ${ - 1 \, 0 \, 1 }$. Their roots are algebraic units. For sufficiently large $n$, the chosen $r$ is in $\( 1 \/ 2 \, 1 \)$, belongs to $R \( n \, d \)$, and its signed minimal polynomial is the chosen $p_plus.minus$. Its first $n$ coefficients are $w$. ◻
]

=== 3.3 Proof of the converse and the quantifiers <proof-of-the-converse-and-the-quantifiers>

Suppose $mu_lambda$ is singular. Proposition 5 gives constants $a \, c > 0$. Choose one integer $d$ large enough for Proposition 8 and also satisfying $1 \/ d < c$. This choice depends on $lambda$ alone.

Fix any integer $j gt.eq 1$ and choose $Q > 2 j$. For all sufficiently large $n$, each of at least $c 2^n$ words $u$ has at least $Q \( 2 lambda \)^n$ neighbors $v$ supplied by Proposition 5. For each difference $w = u - v$, Proposition 8 supplies a root $r_w in R \( n \, d \)$ with signed minimal polynomial projecting to $w$, and

$ lambda < r_w lt.eq lambda + 1 / 2 4^(- n) . $

Choose any one of these roots as a center $r$. All of them lie within $4^(- n)$ of $r$, so all their projected vectors belong to $W_n \( r \; d \)$. For fixed $u$, its different neighbors give distinct vectors $u - v$, each in $cal(O)_u$. Furthermore,

$ 1 lt.eq (r / lambda)^n lt.eq (1 + frac(4^(- n), 2 lambda))^n arrow.r 1 $

uniformly in the choice of center. Hence, for all sufficiently large $n$, each of these $c 2^n$ orthants contains at least $j \( 2 r \)^n$ distinct vectors of $W_n \( r \; d \)$. Since $c > 1 \/ d$, we have $r in R_(*) \( n \, d \, j \)$ and $lambda in \[ r - 4^(- n) \, r \)$.

We have proved that a single $d$ works for every $j$, at every sufficiently large $n$. This proves membership in the expression (2.3) with $liminf$. Membership in that expression implies membership with $limsup$, which implies singularity by Section 2.2. Lemma 2 handles $lambda lt.eq 1 \/ 2$ and supplies the absolute continuity of every remaining parameter. This completes the proof of Theorem 1.

== 4 Recovery of classical parameter classes <cls:section-classical>

The arithmetic criterion is compatible with the classical norm separation argument for Garsia parameters and the Fourier argument for Pisot parameters. The first example directly bounds the crowding in (2.2); the second establishes singularity and then uses Theorem 1 to obtain the approximation property.

#thm([Proposition 4.1.])[
  (Garsia parameters, #cite(label("Garsia1962"))).  #emph[Let $beta in \( 1 \, 2 \)$ be an algebraic integer of absolute norm $2$ whose conjugates all have modulus greater than $1$. Then $1 \/ beta in.not cal(C)$, and $nu_(1 \/ beta)$ is absolutely continuous.]
] <cls:garsia>

#proof[
  Put $lambda = 1 \/ beta$. Consider distinct vectors $w \, w' in { - 1 \, 0 \, 1 }^n$ lying in one closed orthant. Their difference has coefficients in ${ - 1 \, 0 \, 1 }$, so
  $ P \( t \) = sum_(i = 0)^(n - 1) \( w_i - w'_i \) t^(n - 1 - i) $
  is a nonzero polynomial of that coefficient type. It cannot vanish at $beta$. Otherwise, after removing any power of $t$ dividing $P$, its constant coefficient would be $plus.minus 1$, while divisibility by the monic minimal polynomial of $beta$ would force that coefficient to be divisible by $2$.
  For every other conjugate $gamma$ of $beta$,
  $ \| P \( gamma \) \| lt.eq frac(\| gamma \|^n, \| gamma \| - 1) . $
  The nonzero algebraic integer $P \( beta \)$ has absolute norm at least one. Since the product of the moduli of all conjugates of $beta$ is $2$, the preceding estimate gives a constant $c_beta > 0$ such that
  #[#set math.equation(numbering: n => "(4.1)")
   $ lr(|sum_(i = 0)^(n - 1) \( w_i - w'_i \) lambda^i|) = beta^(- \( n - 1 \)) \| P \( beta \) \| gt.eq c_beta 2^(- n) . $ <cls:garsia-spacing>]
  For any potential hit of (2.3) at a sufficiently large $n$, all projected vectors satisfy the slab bound (2.5). Within any one orthant, (4.1) bounds their number by
  $ 1 + frac(2 B lambda^n, c_beta 2^(- n)) lt.eq C_beta \( 2 lambda \)^n . $
  Choose an integer $j > C_beta$. Since a hit has $r > lambda$, no orthant can then meet the threshold $j \( 2 r \)^n$. This excludes all sufficiently large $n$, for every degree multiplier $d$. Thus $lambda in.not cal(C)$, and Theorem 1 gives absolute continuity. ◻
]

#thm([Proposition 4.2.])[
  (Reciprocal Pisot parameters, #cite(label("Erdos1939"))).  #emph[If $beta in \( 1 \, 2 \)$ is a Pisot number, then $1 \/ beta in cal(C)$, and $nu_(1 \/ beta)$ is singular.]
] <cls:pisot>

#proof[
  A Pisot number is an algebraic integer greater than one whose other conjugates have modulus less than one. Here its nonzero integer norm has absolute value less than $beta < 2$, so $beta$ is a unit. Consequently $beta^ell$ is an algebraic integer for every $ell in bb(Z)$, and it can never be a half-integer of odd numerator. In particular, all factors $cos \( pi beta^ell \)$ are nonzero.
  For negative $ell$, the quantity $beta^ell$ tends exponentially to zero. For positive $ell$, its distance to an integer tends exponentially to zero: the trace of $beta^ell$ is an integer and the contributions of the other conjugates decay exponentially. The quadratic behavior of $- log \| cos \( pi t \) \|$ near the integers therefore gives
  $ sum_(ell in bb(Z)) - log \| cos \( pi beta^ell \) \| < oo . $
  With $lambda = 1 \/ beta$, independence of the signs yields
  $ lr(|bb(E) exp \( i pi beta^n Y_lambda \)|) = product_(ell lt.eq n) \| cos \( pi beta^ell \) \| gt.eq product_(ell in bb(Z)) \| cos \( pi beta^ell \) \| > 0 . $
  The Riemann–Lebesgue lemma rules out absolute continuity. Lemma 2 gives singularity, and Theorem 1 gives $lambda in cal(C)$. ◻
]

== 5 Degree-four Salem parameters <sal:section>

For a degree-four Salem number $beta$, the two conjugates on the unit circle form a single complex-conjugate pair. We use simultaneous control of this pair to construct many Fourier phases with appreciable expectation. After removing integer trace terms, widely separated phases depend, up to a small error, on disjoint blocks of the Bernoulli signs. Their averages therefore distinguish the Bernoulli convolution from Lebesgue measure.

#thm([Theorem 5.1.])[
  #emph[Let $beta in \( 1 \, 2 \)$ be a Salem number of degree four. Then the unbiased Bernoulli convolution $nu_(1 \/ beta)$ is singular with respect to Lebesgue measure.]
] <sal:main>

The proof has two quantitative requirements. The Fourier products must lose little mass before the algebraic trace becomes an accurate integer approximation; the remaining trace errors must then stay small over many disjoint blocks. The multiplier construction below supplies both requirements. The trace approximation is the familiar arithmetic ingredient in the Fourier analysis of Pisot and Salem parameters #cite(label("Erdos1939")); see in particular Salem’s small-conjugate construction #cite(label("Salem1963")) Chapter III, Section 3, Theorem III, pp. 28–29. The estimates here also control the losses accumulated while the multiplier changes.

=== 5.1 Multipliers with small unit-circle conjugates <multipliers-with-small-unit-circle-conjugates>

Fix $beta$ as in Theorem 11, and write its conjugates as $beta^(- 1) \, z \, macron(z)$, where $z = e^(i theta)$. The number $beta$ is a unit: the product of its four conjugates is $1$. Moreover, $theta \/ pi$ is irrational, since otherwise $z$, and hence its conjugate $beta$, would be a root of unity.

For positive integers $k_1 \, k_2 \, dots.h$, to be chosen, define

#[#set math.equation(numbering: n => "(5.1)")
 $ A_m & = product_(h = 1)^m \( beta^(k_h) - beta^(- k_h) \) \, & b_m & = sum_(h = 1)^m k_h \,\
c_m & = product_(h = 1)^m \( z^(k_h) - z^(- k_h) \) \, & delta_m & = \| c_m \| \, #h(2em) L_m = log \( 1 \/ delta_m \) . $ <sal:multipliers>]

Here and throughout this section logarithms are natural. Irrationality ensures $delta_m > 0$, and $0 < A_m lt.eq beta^(b_m)$. For $j in bb(Z)$, put $u_(m \, j) = A_m beta^j$. All these numbers are algebraic integers, because $beta$ is a unit. Their field traces are the integers

#[#set math.equation(numbering: n => "(5.2)")
 $ T_(m \, j) = u_(m \, j) + \( - 1 \)^m u_(m \, - j) + 2 "Re" \( c_m z^j \) in bb(Z) . $ <sal:trace>]

Indeed, the embedding taking $beta$ to $beta^(- 1)$ takes $A_m$ to $\( - 1 \)^m A_m$. Also $u_(m \, j) in.not bb(Z) + 1 / 2$, since a rational algebraic integer is an integer. Thus none of the cosine factors used below vanishes.

The construction below balances the decrease of $delta_m$ against the cosine losses generated by $A_m$. Eventually $L_m$ grows by a factor greater than two while $k_(m + 1) delta_m^2$ tends to zero; these are the margins used in the loss estimate below. It also keeps $b_m$ small compared with $delta_m^(- 1)$, leaving room for many separated blocks of signs. A uniform lower bound on the cosines will permit a quadratic estimate for perturbations of their logarithms.

#thm([Lemma 5.2.])[
  #emph[There are positive integers $k_m$ and a constant $gamma > 0$ for which the numbers $L_m$ in (5.1) are positive and satisfy the following properties. Set 
$ D = frac(10, log beta) \, #h(2em) K_m = ⌈2 b_m + D L_m⌉ quad \( m gt.eq 2 \) . $

 Then $A_m gt.eq 1$ for every $m$, and 
#[#set math.equation(numbering: n => "(5.3)")
 $ K_m lt.eq k_(m + 1) lt.eq e^(1.9 L_m) \, #h(2em) L_(m + 1) & gt.eq 1.75 L_m &  & \( m gt.eq 2 \) \,\
log K_m lt.eq .75 L_m \, #h(2em) L_(m + 1) & gt.eq 2.1 L_m &  & \( m gt.eq 3 \) . $ <sal:growth-initial>]

 Moreover, 
#[#set math.equation(numbering: n => "(5.4)")
 $ \| cos \( pi u_(m \, j) \) \| gt.eq gamma quad \( m gt.eq 1 \, med j in bb(Z) \) \, $ <sal:cosine-floor>]

 and, for $m gt.eq 2$, 
#[#set math.equation(numbering: n => "(5.5)")
 $ 2 delta_m lt.eq frac(gamma, 2 pi) \, #h(2em) beta^(b_m - k_(m + 1)) lt.eq e^(- 10 L_m) lt.eq frac(gamma, 2 pi) . $ <sal:small-errors>]

]
] <sal:construction>

#proof[
  Write $parallel x parallel_(bb(R) \/ bb(Z))$ for distance to the nearest integer. The pigeonhole principle gives, for every integer $N gt.eq 1$, an integer $q in \[ 1 \, N \]$ such that
  #[#set math.equation(numbering: n => "(5.6)")
   $ parallel q theta \/ pi parallel_(bb(R) \/ bb(Z)) lt.eq N^(- 1) . $ <sal:dirichlet>]
  For example, place the $N + 1$ fractional parts of $0 \, theta \/ pi \, dots.h \, N theta \/ pi$ in $N$ intervals of length $1 \/ N$. Since $theta \/ pi$ is irrational, the possible $q$ in (5.6) are unbounded as $N arrow.r oo$. In particular there are arbitrarily large $q$ with $parallel q theta \/ pi parallel_(bb(R) \/ bb(Z)) lt.eq 1 \/ q$.
  Choose and fix $k_1$ so that $A_1 > 1$ and $delta_1 < 1 \/ 16$. Define
  $ gamma_m = inf_(j in bb(Z)) \| cos \( pi u_(m \, j) \) \| . $
  At this point $gamma_1 > 0$: as $j arrow.r - oo$, $u_(1 \, j) arrow.r 0$; as $j arrow.r + oo$, the trace identity shows that the absolute cosine differs from $\| cos \( pi u_(1 \, - j) \) \|$ by at most $2 pi delta_1 < pi \/ 8$. The remaining finite set of factors contains no zero.
  Next choose $k_2 > k_1$ from the unbounded sequence satisfying $parallel k_2 theta \/ pi parallel_(bb(R) \/ bb(Z)) lt.eq 1 \/ k_2$. We will impose finitely many lower thresholds on this choice. Since
  $ delta_2 lt.eq frac(2 pi delta_1, k_2) \, #h(2em) L_2 gt.eq log k_2 - log \( 2 pi delta_1 \) \, $
  both $k_2$ and $L_2$ can be made arbitrarily large. In particular, $log K_2 lt.eq 1.1 L_2$ for every sufficiently large such choice: the last inequality bounds $k_2$ by a fixed multiple of $e^(L_2)$, whereas the other contribution $D L_2$ to $K_2$ is only linear in $L_2$.
  For $m gt.eq 2$, suppose $L = L_m$ is large and $log K_m lt.eq 1.1 L$. Take $N = floor.l e^(1.9 L) floor.r$ and choose $q$ by (5.6). Define
  #[#set math.equation(numbering: n => "(5.7)")
   $ k_(m + 1) = cases(delim: "{", q \, & q gt.eq K_m \,, ceil.l K_m \/ q ceil.r q \, & q < K_m .) $ <sal:choice-k>]
  Let $L' = L_(m + 1)$. If $q gt.eq K_m$, then
  $ delta_(m + 1) lt.eq 2 pi delta_m \/ N \, #h(2em) L' gt.eq 2.9 L - O \( 1 \) gt.eq 2.8 L \, #h(2em) b_(m + 1) lt.eq 2 e^(1.9 L) . $
  If $q < K_m$, the multiplier $ceil.l K_m \/ q ceil.r$ is at most $2 K_m$ and $K_m lt.eq k_(m + 1) < 2 K_m$. Using $\| sin \( pi x \) \| lt.eq pi parallel x parallel_(bb(R) \/ bb(Z))$ gives
  $ delta_(m + 1) lt.eq 4 pi delta_m K_m \/ N \, #h(2em) L' gt.eq 2.9 L - log K_m - O \( 1 \) gt.eq 1.75 L \, $
  and $b_(m + 1) lt.eq 3 e^(1.1 L)$. In both cases $K_m lt.eq k_(m + 1) lt.eq e^(1.9 L)$ when $L$ is sufficiently large.
  These estimates also give $log K_(m + 1) lt.eq .75 L'$. To see this without an upper bound on $L'$, write
  $ K_(m + 1) lt.eq 2 b_(m + 1) + D L' + 1 . $
  The bound on $b_(m + 1)$ makes the first term at most $1 / 2 e^(.75 L')$ for large $L$, since $1.9 < .75 dot.op 2.8$ in the first case and $1.1 < .75 dot.op 1.75$ in the second. The remaining term satisfies the same bound for every sufficiently large $L'$. Thus the construction iterates. From $m = 3$ onward, the improved bound $log K_m lt.eq .75 L_m$ gives $L_(m + 1) gt.eq \( 2.9 - .75 \) L_m - O \( 1 \) gt.eq 2.1 L_m$ in the second case; the first case already gives more. This proves (5.3)–(5.3) after a lower threshold on $L_2$ depending only on $beta$.
  It remains to choose $k_2$ large enough to obtain the cosine floor. For $j lt.eq 0$ and $k = k_(m + 1)$, the exact identity
  #[#set math.equation(numbering: n => "(5.8)")
   $ u_(m + 1 \, j) = u_(m \, j + k) - u_(m \, j - k) \, #h(2em) \| u_(m \, j - k) \| lt.eq beta^(b_m - k) beta^j $ <sal:shift>]
  and the Lipschitz bound for the cosine give a lower bound $gamma_m - pi beta^(b_m - k)$. For positive $j$, reflect to $- j$ using (5.2) at level $m + 1$. Consequently
  #[#set math.equation(numbering: n => "(5.9)")
   $ gamma_(m + 1) gt.eq gamma_m - pi beta^(b_m - k_(m + 1)) - 2 pi delta_(m + 1) . $ <sal:floor-recurrence>]
  For $m gt.eq 2$, the inequality $k_(m + 1) gt.eq 2 b_m + D L_m$ implies $beta^(b_m - k_(m + 1)) lt.eq e^(- 10 L_m)$. Also $L_m gt.eq 1.75^(m - 2) L_2$. Thus the sum of the decrements in (5.9) is at most
  $ pi beta^(k_1 - k_2) + 2 pi e^(- L_2) + sum_(r = 0)^oo (pi e^(- 10 dot.op 1.75^r L_2) + 2 pi e^(- 1.75^(r + 1) L_2)) . $
  This tends to zero as $k_2 arrow.r oo$ along the chosen sequence. Choose $k_2$ so that this sum is less than $gamma_1 \/ 10$, and so that $2 e^(- L_2)$ and $e^(- 10 L_2)$ are at most $gamma_1 \/ \( 4 pi \)$. These requirements are compatible with the earlier lower thresholds. Now fix $k_2$ and the resulting sequence, and put $gamma = gamma_1 \/ 2$. Equations (5.4)–(5.5) follow. Finally, $k_m$ is increasing and every factor $beta^(k_m) - beta^(- k_m)$ is at least its first factor $A_1 > 1$, so $A_m gt.eq 1$. ◻
]

=== 5.2 The loss in the cosine products <the-loss-in-the-cosine-products>

Fix the sequence furnished by Lemma 12. Constants denoted by $C$ below may change from line to line, but are independent of $m$ and of the phase index. Define

$ f \( u \) = - log \| cos \( pi u \) \| quad upright("for ") u in.not bb(Z) + 1 / 2 \, #h(2em) S_m = sum_(j lt.eq 0) f \( u_(m \, j) \) . $

Each $S_m$ is finite: its terms have a geometrically decaying tail because $u_(m \, j) arrow.r 0$ as $j arrow.r - oo$ and $f \( u \) = O \( u^2 \)$ near zero. The next estimate controls the entire negative-power contribution even though $A_m$ becomes large.

#thm([Lemma 5.3.])[
  #emph[For the sequence in Lemma 12, $S_m = o \( L_m \)$. Furthermore, with $eta = .01$, for $m gt.eq 2$ and $n gt.eq 0$, 
#[#set math.equation(numbering: n => "(5.10)")
 $ sum_(j lt.eq n) f \( u_(m \, j) \) lt.eq \( 2 + eta \) S_m + C n delta_m^2 . $ <sal:total-loss>]

]
] <sal:loss>

#proof[
  We first record a perturbation estimate. If $\| cos \( pi u \) \| gt.eq gamma$ and $\| v \| lt.eq gamma \/ \( 2 pi \)$, then
  #[#set math.equation(numbering: n => "(5.11)")
   $ f \( u + v \) lt.eq \( 1 + eta \) f \( u \) + C v^2 . $ <sal:taylor>]
  Indeed, the absolute cosine is at least $gamma \/ 2$ along the segment from $u$ to $u + v$, so $f''$ is bounded there. Also
  $ \| f' \( u \) \| lt.eq pi / gamma sqrt(2 f \( u \)) \, $
  because $1 - \| cos \( pi u \) \|^2 lt.eq 2 f \( u \)$. Taylor’s formula and $\| f' \( u \) v \| lt.eq eta f \( u \) + C v^2$ prove (5.11).
  The function $f$ is even and $1$-periodic. Reflecting positive indices by (5.2), and using (5.5), gives
  #[#set math.equation(numbering: n => "(5.12)")
   $ f \( u_(m \, i) \) lt.eq \( 1 + eta \) f \( u_(m \, - i) \) + C delta_m^2 quad \( m gt.eq 2 \, med i gt.eq 1 \) . $ <sal:reflection-loss>]
  Summing this inequality proves (5.10).
  To estimate $S_(m + 1)$, apply (5.11) to (5.8), with base point $u_(m \, j + k)$ and $v = - u_(m \, j - k)$, where $k = k_(m + 1)$. The cosine floor holds at every base point, including those with positive index. The squared perturbations have a geometric sum, so
  $ S_(m + 1) & lt.eq \( 1 + eta \) (S_m + sum_(i = 1)^k f \( u_(m \, i) \)) + C beta^(2 \( b_m - k \))\
 & lt.eq \( 1 + eta \) \( 2 + eta \) S_m + C \( 1 + k delta_m^2 \) . $
  By (5.3), $k delta_m^2 lt.eq e^(- .1 L_m) lt.eq 1$. Therefore $S_(m + 1) lt.eq r S_m + C$, where $r = \( 1.01 \) \( 2.01 \) = 2.0301$. The already fixed value $S_2$ is finite, so iteration gives $S_m = O \( r^(m - 2) \)$. In contrast, (5.3) gives $L_m gt.eq 2.1^(m - 3) L_3$ for $m gt.eq 3$. Since $r < 2.1$, their ratio tends to zero. ◻
]

=== 5.3 Independent blocks of Fourier phases <independent-blocks-of-fourier-phases>

We now turn the product estimates into sets of almost full $nu_(1 \/ beta)$-measure and vanishing Lebesgue measure. The comparison of phase averages under two measures is analogous to the separation argument for Riesz products in #cite(label("Peyriere1975")) Section 1.1, Theorem 1.2. Here the needed estimates follow from the independent signs, as we now show. Work on the probability space of independent uniform signs $\( epsilon.alt_ell \)_(ell gt.eq 0)$, and write

$ Y = sum_(ell gt.eq 0) epsilon.alt_ell beta^(- ell) \, #h(2em) W_(m \, n) = exp \( i pi A_m beta^n Y \) quad \( n gt.eq 0 \) . $

The law of $Y$ is $nu_(1 \/ beta)$, supported on $I = \[ - \( 1 - beta^(- 1) \)^(- 1) \, \( 1 - beta^(- 1) \)^(- 1) \]$. Independence, followed by passage to the limit in the convergent sign series, gives

#[#set math.equation(numbering: n => "(5.13)")
 $ bb(E) W_(m \, n) = product_(j = - oo)^n cos \( pi u_(m \, j) \) . $ <sal:expectation>]

This is a nonzero real number; the negative-index tail has a convergent sum of logarithmic losses.

Set

$ J_m = floor.l e^(1.5 L_m) floor.r \, #h(2em) H_m = ceil.l b_m + D L_m ceil.r \, $

$ cal(N)_m = { H_m + s \( 2 H_m + 1 \) : s in bb(Z)_(gt.eq 0) } ∩ \[ 0 \, J_m \] \, $

and let $M_m = \| cal(N)_m \|$. All subsequent estimates concern sufficiently large $m$. Since $H_m lt.eq K_m lt.eq e^(.75 L_m)$,

#[#set math.equation(numbering: n => "(5.14)")
 $ e^(.7 L_m) lt.eq M_m lt.eq J_m + 1 . $ <sal:block-count>]

Lemma 13 and $J_m delta_m^2 lt.eq e^(- .5 L_m)$ show that

#[#set math.equation(numbering: n => "(5.15)")
 $ \| bb(E) W_(m \, n) \| gt.eq e^(- L_m \/ 20) quad \( 0 lt.eq n lt.eq J_m \) . $ <sal:mean-lower>]

For $n in cal(N)_m$, retain only the signs whose indices lie in $\[ n - H_m \, n + H_m \]$, and define

#[#set math.equation(numbering: n => "(5.16)")
 $ tilde(W)_(m \, n) = \( - 1 \)^(sum_(j = H_m + 1)^n T_(m \, j)) exp (i pi sum_(ell = n - H_m)^(n + H_m) u_(m \, n - ell) epsilon.alt_ell) . $ <sal:window-phase>]

The integer sum in the prefactor is empty when $n = H_m$. To explain this approximation, expand the exponent of $W_(m \, n)$ as $pi sum_(j lt.eq n) u_(m \, j) epsilon.alt_(n - j)$. For $j > H_m$, replace $u_(m \, j)$ by its integer trace $T_(m \, j)$; the resulting factor is deterministic because $e^(i pi T_(m \, j) epsilon.alt_(n - j)) = \( - 1 \)^(T_(m \, j))$. For $j < - H_m$, drop the term. The remaining indices are exactly those in (5.16).

The difference of the two phase angles, after these replacements, is a sum of independent mean-zero signs. The inequality $\| e^(i x) - e^(i y) \| lt.eq \| x - y \|$ therefore gives

#[#set math.equation(numbering: n => "(5.17)")
 $ parallel W_(m \, n) - tilde(W)_(m \, n) parallel_2^2 & lt.eq pi^2 (sum_(j = H_m + 1)^n \| u_(m \, j) - T_(m \, j) \|^2 + sum_(j < - H_m) \| u_(m \, j) \|^2)\
 & lt.eq C (beta^(2 \( b_m - H_m \)) + n delta_m^2) lt.eq C e^(- L_m \/ 2) . $ <sal:window-error>]

Here (5.2) bounds the first summand by a geometric tail and a contribution $C n delta_m^2$; the other sum is itself a geometric tail. Finally, $D log beta = 10$ and $n lt.eq J_m$ give the last inequality. All norms in (5.17) refer to the sign probability space. The windows belonging to consecutive members of $cal(N)_m$ are disjoint, so the variables $tilde(W)_(m \, n)$ are independent.

#proof[
  For $n in cal(N)_m$, let $sigma_(m \, n) in { - 1 \, 1 }$ be the sign of the real expectation in (5.13). Define the continuous function
  $ F_m \( y \) = 1 / M_m sum_(n in cal(N)_m) sigma_(m \, n) e^(i pi A_m beta^n y) . $
  Its mean at $Y$ is real and, by (5.15), $a_m := bb(E) F_m \( Y \) gt.eq e^(- L_m \/ 20)$. The corresponding average of the independent variables $sigma_(m \, n) tilde(W)_(m \, n)$ has centered $L^2$ norm at most $M_m^(- 1 \/ 2)$, since each variable has modulus one. By the triangle inequality and (5.17),
  #[#set math.equation(numbering: n => "(5.18)")
   $ parallel F_m \( Y \) - a_m parallel_2 lt.eq M_m^(- 1 \/ 2) + C e^(- L_m \/ 4) . $ <sal:concentration>]
  Subtracting the means of the approximation errors introduces at most a factor two, included in $C$.
  On the other hand, the same average is small in Lebesgue $L^2 \( I \)$. Write its frequencies in increasing order as $xi_1 < dots.h.c < xi_(M_m)$. Since $A_m gt.eq 1$ and their exponents are distinct nonnegative integers, $xi_(r + 1) - xi_r gt.eq pi \( beta - 1 \)$. Thus $\| xi_r - xi_s \| gt.eq pi \( beta - 1 \) \| r - s \|$ and
  $ lr(|integral_I e^(i \( xi_r - xi_s \) y) thin d y|) lt.eq frac(2, \| xi_r - xi_s \|) quad \( r eq.not s \) . $
  Expanding the square and summing by the rank difference yields
  #[#set math.equation(numbering: n => "(5.19)")
   $ integral_I \| F_m \( y \) \|^2 thin d y lt.eq C frac(1 + log M_m, M_m) . $ <sal:lebesgue-average>]
  Consider the compact sets
  $ E_m = { y in I : "Re" F_m \( y \) gt.eq 1 / 2 e^(- L_m \/ 20) } . $
  Chebyshev’s inequality, (5.18), and (5.14) imply
  $ 1 - nu_(1 \/ beta) \( E_m \) lt.eq 4 e^(L_m \/ 10) (M_m^(- 1 \/ 2) + C e^(- L_m \/ 4))^2 arrow.r 0 . $
  Likewise, writing $\| E_m \|$ for Lebesgue measure,
  $ \| E_m \| lt.eq 4 e^(L_m \/ 10) integral_I \| F_m \( y \) \|^2 thin d y lt.eq C e^(L_m \/ 10) frac(1 + log M_m, M_m) arrow.r 0 \, $
  because $M_m gt.eq e^(.7 L_m)$ and $log M_m lt.eq 1.5 L_m + O \( 1 \)$. Choose a subsequence $\( m_r \)$ along which $sum_r \( \| E_(m_r) \| + 1 - nu_(1 \/ beta) \( E_(m_r) \) \) < oo$. Then $E = limsup_r E_(m_r)$ is Borel and Lebesgue null, since $\| union.big_(r gt.eq R) E_(m_r) \| lt.eq sum_(r gt.eq R) \| E_(m_r) \| arrow.r 0$. Moreover, the summability of the complementary probabilities shows that $nu_(1 \/ beta)$-almost every point lies in all sufficiently late $E_(m_r)$, and hence in $E$. Therefore $nu_(1 \/ beta) \( E \) = 1$. ◻
]

=== 5.4 Two explicit parameters <sal:examples-section>

#thm([Corollary 5.4.])[
  #emph[Let $beta_1$ and $beta_2$ be the respective real roots greater than one of 
$ P_1 \( x \) = x^4 - x^3 - x^2 - x + 1 \, #h(2em) P_2 \( x \) = x^4 - 2 x^3 + x^2 - 2 x + 1 . $

 Then $beta_1 \, beta_2 in \( 1 \, 2 \)$ and both $nu_(1 \/ beta_1)$ and $nu_(1 \/ beta_2)$ are singular.]
] <sal:examples>

#proof[
  For $y = x + x^(- 1)$, the equations $P_i \( x \) \/ x^2 = 0$ become, respectively,
  $ y^2 - y - 3 = 0 \, #h(2em) y^2 - 2 y - 1 = 0 . $
  Their larger roots are $y_1 = \( 1 + sqrt(13) \) \/ 2$ and $y_2 = 1 + sqrt(2)$, both in $\( 2 \, 5 \/ 2 \)$. For each $i$, the equation $x + x^(- 1) = y_i$ has one root $beta_i in \( 1 \, 2 \)$ and its reciprocal. The other quadratic root $y'_i$ lies in $\( - 2 \, 2 \)$, so the remaining two roots of $P_i$ form a nonreal conjugate pair on the unit circle.
  It remains to check that these four roots are algebraic conjugates. The quadratic field $bb(Q) \( y_i \)$ is real, and the discriminant $y_i^2 - 4$ has negative image $\( y'_i \)^2 - 4$ under its nontrivial embedding. It cannot be a square in that field, since the image of a square under a real embedding is nonnegative. Hence $x^2 - y_i x + 1$ is irreducible over $bb(Q) \( y_i \)$, and $\[ bb(Q) \( beta_i \) : bb(Q) \] = 4$. Thus $beta_1$ and $beta_2$ are degree-four Salem numbers, and Theorem 11 applies. ◻
]

== 6 A polynomial with a weakly expanding conjugate pair <np:section>

The final example uses a polynomial with one conjugate pair just outside the unit circle. We will prove singularity directly by counting typical prefixes. Counting all polynomial values in their conjugate coordinates therefore gives slightly too many possible prefixes. We obtain the required improvement by a product of positive trigonometric factors: its integral in the expanding coordinates stays bounded, whereas it grows exponentially on a set of words whose probability tends to one.

Throughout this section, every terminating decimal denotes the corresponding exact rational number. Put

#[#set math.equation(numbering: n => "(6.1)")
 $ p \( t \) = t^31 - 2 t^30 + sum_(j = 0)^9 \( t^(3 j + 1) - t^(3 j) \) . $ <np:polynomial>]

The identity

#[#set math.equation(numbering: n => "(6.2)")
 $ \( t^2 + t + 1 \) p \( t \) = t^33 - t^32 - t^31 - t^30 - 1 $ <np:relation>]

will control the near-cancellations in the trigonometric product.

#thm([Theorem 6.1.])[
  #emph[The polynomial $p$ in (6.1) has a unique real root $beta in \( 1.8392 \, 1.8393 \)$. This root is not a Pisot number, and $nu_(1 \/ beta)$ is singular with respect to Lebesgue measure.]
] <np:main>

We first record the root bounds needed in the proof. The proposition is proved by rational root disks in Section 7.1.

#thm([Proposition 6.2.])[
  (Root bounds).  #emph[ All roots of $p$ are simple. Its roots outside the unit circle are $beta \, alpha \, overline(alpha)$, where $beta$ is real, $"Im" alpha > 0$, and 
#[#set math.equation(numbering: n => "(6.3)")
 $ 1.8392 < beta < 1.8393 \, #h(2em) 1.0002089 < \| alpha \|^2 < 1.0002094 \,\
\| alpha \|^(- 1) < 0.9999 . $ <np:root-bounds>]

 The remaining roots are fourteen nonreal conjugate pairs, each of modulus less than $0.994$.]
] <np:roots>

Write $D = { beta \, alpha \, overline(alpha) }$ and let $I$ be the set of remaining roots. The expanding volume factor is

#[#set math.equation(numbering: n => "(6.4)")
 $ cal(M) = product_(r in D) \| r \| = beta \| alpha \|^2 \, #h(2em) log cal(M) < log beta + 0.0002094 . $ <np:mahler>]

The last inequality uses $log \( 1 + u \) < u$ for $u > 0$.

The root bounds already show that $beta$ is not Pisot. Indeed, suppose $beta$ were Pisot, and divide $p$ by its monic minimal polynomial. The quotient is monic and integral, has constant term of absolute value one, and contains $alpha \, overline(alpha)$ among its roots but not $beta$. The product of the moduli of its roots is greater than one if it has no roots in $I$, and otherwise is at most $1.0002094 dot.op 0.994 < 1$. Both conclusions contradict the constant term. It remains to prove singularity.

=== 6.1 Word vectors and characters <np:characters-section>

For a word $a = \( a_0 \, dots.h \, a_(N - 1) \) in { 0 \, 1 }^N$, define

#[#set math.equation(numbering: n => "(6.5)")
 $ y_r \( a \) = sum_(j = 0)^(N - 1) a_j r^j quad \( r in D union I \) \, #h(2em) x_r \( a \) = r^(- N) y_r \( a \) quad \( r in D \) . $ <np:word-coordinates>]

Vectors indexed by roots are always constrained by $y_(overline(r)) = overline(y_r)$, and a conjugate pair counts as one complex coordinate, or two real coordinates. In particular, the space of all $y$-vectors has real dimension $31$.

#thm([Lemma 6.3.])[
  #emph[All vectors $y \( a \)$, for all $N$ and all words $a$, belong to a fixed full lattice in this real vector space. Their contracting coordinates $\( y_r \)_(r in I)$ and normalized expanding coordinates $\( x_r \)_(r in D)$ lie in fixed bounded boxes. The change from $\( x_D \, y_I \)$ to $\( y_D \, y_I \)$ has real Jacobian determinant of absolute value $cal(M)^N$.]
] <np:lattice>

#proof[
  Reduction of $sum a_j t^j$ modulo the monic polynomial $p$ gives an integer coefficient vector of length $31$. Evaluation at the roots is an invertible real-linear map: a polynomial of degree at most $30$ that vanishes at all $31$ distinct roots is zero. The image of $bb(Z)^31$ under this map is the required lattice. No irreducibility assumption is needed. The bounds follow from
  $ \| y_r \( a \) \| lt.eq frac(1, 1 - \| r \|) quad \( r in I \) \, #h(2em) \| x_r \( a \) \| lt.eq frac(1, \| r \| - 1) quad \( r in D \) . $
  Multiplication of the real coordinate by $beta^N$ and of the complex coordinate by $alpha^N$ has determinant $beta^N \| alpha \|^(2 N) = cal(M)^N$. ◻
]

To distinguish the word vectors from typical points of these boxes, define the real sequences

#[#set math.equation(numbering: n => "(6.6)")
 $ C_0 \( m \) = cases(delim: "{", sum_(r in I) frac(r^(- 1 - m), p' \( r \)) \, & m < 0 \,, - sum_(r in D) frac(r^(- 1 - m), p' \( r \)) \, & m gt.eq 0 \,) #h(2em) C_1 \( m \) = C_0 \( m + 3 \) - C_0 \( m \) + C_0 \( m - 1 \) . $ <np:coefficients>]

Partial fractions give

$ frac(1, p \( t \)) = sum_(m in bb(Z)) C_0 \( m \) t^m \, #h(2em) max_(r in I) \| r \| < \| t \| < min_(r in D) \| r \| . $

Thus $C_0$ is the bilateral Laurent coefficient sequence of $1 \/ p$, and both $C_0 \, C_1$ decay exponentially at both ends. The same inversion by an exponentially decaying two-sided sequence is used by Lind and Schmidt #cite(label("LindSchmidt1999")) Lemma 4.5 and Example 4.7 to construct homoclinic points for algebraic actions. Here the explicit root formula will give characters adapted to the word vectors.

For arbitrary expanding coordinates $x_D$, with $x_beta in bb(R)$ and $x_(overline(alpha)) = overline(x_alpha)$, put

#[#set math.equation(numbering: n => "(6.7)")
 $ Z_i^(\( 0 \, N \)) \( x \) & = exp #h(-0.16667em) (- 2 pi upright(i) sum_(r in D) frac(x_r r^i, p' \( r \))) exp #h(-0.16667em) (- pi upright(i) sum_(k = 0)^(N - 1) C_0 \( k - i \)) \,\
Z_i^(\( 1 \, N \)) \( x \) & = Z_(i - 3)^(\( 0 \, N \)) \( x \) overline(Z_i^(\( 0 \, N \)) \( x \)) Z_(i + 1)^(\( 0 \, N \)) \( x \) \, #h(2em) i in bb(Z) . $ <np:characters>]

These functions have modulus one.

#thm([Lemma 6.4.])[
  (Characters at word vectors).  #emph[If $b_k = a_(N - 1 - k)$, then for $A in { 0 \, 1 }$ and $i in bb(Z)$, 
#[#set math.equation(numbering: n => "(6.8)")
 $ Z_i^(\( A \, N \)) \( x \( a \) \) = exp #h(-0.16667em) (pi upright(i) sum_(k = 0)^(N - 1) C_A \( k - i \) \( 2 b_k - 1 \)) . $ <np:word-character-formula>]

]
] <np:word-character>

#proof[
  The reversed word gives $x_r \( a \) = sum_(k = 0)^(N - 1) b_k r^(- 1 - k)$. For each integer $l gt.eq 0$, Lagrange interpolation shows that
  $ sum_(r in D union I) frac(r^l, p' \( r \)) $
  is the coefficient of $t^30$ in the remainder of $t^l$ modulo $p$, and hence is an integer. Consequently, when $m < 0$, the coefficient $- sum_(r in D) r^(- 1 - m) \/ p' \( r \)$ differs from $C_0 \( m \)$ by an integer. Its contribution to the exponent with coefficient $2 pi upright(i) b_k$ is unchanged by this replacement. When $m gt.eq 0$, the coefficients already agree. The second factor in (6.7) supplies the centering by $- 1$, proving the formula for $A = 0$. Multiplication of the three characters proves it for $A = 1$. ◻
]

The corresponding stationary model uses independent fair bits $\( b_k \)_(k in bb(Z))$ and the unit random variables

#[#set math.equation(numbering: n => "(6.9)")
 $ cal(Z)_i^(\( A \)) = exp #h(-0.16667em) (pi upright(i) sum_(k in bb(Z)) C_A \( k - i \) \( 2 b_k - 1 \)) . $ <np:stationary>]

The series converges absolutely. Independence gives the real moments

#[#set math.equation(numbering: n => "(6.10)")
 $ P_A & = bb(E) cal(Z)_i^(\( A \)) = product_(m in bb(Z)) cos \( pi C_A \( m \) \) \,\
P_(A B)^plus.minus \( k \) & = bb(E) #scale(x: 120%, y: 120%)[\[] cal(Z)_i^(\( A \)) \( cal(Z)_(i - k)^(\( B \)) \)^(plus.minus 1) #scale(x: 120%, y: 120%)[\]]\
 & = product_(m in bb(Z)) cos #scale(x: 120%, y: 120%)[\(] pi \( C_A \( m \) plus.minus C_B \( m + k \) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) k gt.eq 0 . $ <np:scalar-products>]

=== 6.2 A predictor with a positive mean gain <np:predictor-section>

The weakly expanding pair produces long decaying tails in $C_0$. Some shifted tails nearly cancel in the signed products $P_00^plus.minus \( k \)$. A linear combination of the corresponding phases will use these correlations. For rational weights $w_(k s)$, define

#[#set math.equation(numbering: n => "(6.11)")
 $ G_i^(\( N \)) \( x \) & = - 0.001 + 0.0055 Z_(i - 33)^(\( 1 \, N \)) \( x \) + sum_(k = 30)^2000 sum_(s = 0)^1 w_(k s) #scale(x: 120%, y: 120%)[\(] Z_(i - k)^(\( 0 \, N \)) \( x \) #scale(x: 120%, y: 120%)[\)]^(1 - 2 s) \,\
cal(G)_i & = - 0.001 + 0.0055 cal(Z)_(i - 33)^(\( 1 \)) + sum_(k = 30)^2000 sum_(s = 0)^1 w_(k s) \( cal(Z)_(i - k)^(\( 0 \)) \)^(1 - 2 s) \,\
cal(L)_i & = "Re" \( cal(Z)_i^(\( 0 \)) cal(G)_i \) . $ <np:predictor>]

#thm([Proposition 6.5.])[
  (Predictor estimates).  #emph[ There exist weights $w_(k s) in 10^(- 9) bb(Z)$, indexed by $30 lt.eq k lt.eq 2000$ and $s in { 0 \, 1 }$, such that 
#[#set math.equation(numbering: n => "(6.12)")
 $ 0.001 + 0.0055 + sum_(k \, s) \| w_(k s) \| = 198442946 / 10^9 < x_(*) := 0.199 $ <np:weight-sum>]

 and, in the stationary model, 
#[#set math.equation(numbering: n => "(6.13)")
 $ bb(E) cal(L)_i > 0.000210 \, #h(2em) bb(E) \| cal(G)_i \|^2 < 0.000145 \,\
lr(|bb(E) #scale(x: 120%, y: 120%)[\[] \( cal(Z)_i^(\( 0 \)) \)^2 cal(G)_i^2 #scale(x: 120%, y: 120%)[\]]|) < 0.000007 . $ <np:moment-estimates>]

 In particular, $\| G_i^(\( N \)) \( x \) \| lt.eq x_(*)$ for every $N \, i \, x$, and $\| cal(G)_i \| lt.eq x_(*)$ for every bit sequence.]
] <np:moments>

We fix weights supplied by Proposition 19. Their exact rational construction is given in Section 7.2, and the moment bounds are proved in Section 7.4.

The next two subsections construct a positive product whose logarithm has a positive mean under this stationary model and whose integral is bounded in the expanding coordinates. These two estimates will remove an exponential proportion of the lattice points allowed by Lemma 17.

=== 6.3 Damping the possible frequency cancellations <np:damping-section>

Choose a fixed integer $i_0 gt.eq 1$ so that

#[#set math.equation(numbering: n => "(6.14)")
 $ frac(0.1 beta^(i_0), \| p' \( beta \) \|) > 1 . $ <np:initial-index>]

For a word length $N$, use every complete block

$ B_q = { i_0 + 22 q \, dots.h \, i_0 + 22 q + 20 } subset.eq { 0 \, dots.h \, N - 1 } \, #h(2em) q gt.eq 0 \, $

and write $J_N$ for their union. Thus each block has $21$ indices and consecutive blocks are separated by one unused index.

The near-relation (6.2) dictates which signed digit patterns need to be retained when integrating a block. For a pattern $\( d_i \)_(i in B_q) in { - 1 \, 0 \, 1 }^(B_q)$, let $b = max B_q$ and set

$ v_i = beta^(- i) sum_(j = i)^b d_j beta^j \, #h(2em) v_(b + 1) = 0 . $

Reading from the largest index downwards gives $v_i = beta v_(i + 1) + d_i$. At the root $beta$, (6.2) becomes

#[#set math.equation(numbering: n => "(6.15)")
 $ beta^3 - beta^2 - beta - 1 = beta^(- 30) . $ <np:near-cubic>]

In particular, the four digits $\[ sigma \, - sigma \, - sigma \, - sigma \]$ leave the small normalized remainder $sigma beta^(- 30)$. We encode these approximate returns by the transitions in Figure 1. The initial state is $0$, and the permitted terminal states are $0 \, C_(+) \, C_(-)$. For each sign $sigma in { - 1 \, 1 }$, the numerical values assigned to the states are

#[#set math.equation(numbering: n => "(6.16)")
 $ 0 \, #h(2em) A_sigma : med sigma \, #h(2em) B_sigma : med sigma \( beta - 1 \) \, #h(2em) C_sigma : med sigma \( beta^2 - beta - 1 \) . $ <np:state-values>]

A pattern is called #emph[admissible] if every transition is allowed and its terminal state is permitted.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((-0.3182, -0.3182), (0.3182, 0.3182), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$0$]]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.082, -0.3182), (2.718, 0.3182), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$A_ sigma$]]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.482, -0.3182), (5.118, 0.3182), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$B_ sigma$]]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6.882, -0.3182), (7.518, 0.3182), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$C_ sigma$]]], frame: "circle", stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-1, 0), (-0.4571, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  bezier((-0.1183, 0.4415), (0.1183, 0.4415), (-0.3093, 1.154), (0.3093, 1.154), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((-2.949e-17, 0.9762), [#text(size: 9pt)[$0$]])
  line((0.4571, 0), (1.943, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1.2, 0), [#text(size: 9pt)[$sigma$]], anchor: "south", padding: 0.1176cm)
  line((2.857, 0), (4.343, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.6, 0), [#text(size: 9pt)[$- sigma$]], anchor: "south", padding: 0.1176cm)
  line((5.257, 0), (6.743, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((6, 0), [#text(size: 9pt)[$- sigma$]], anchor: "south", padding: 0.1176cm)
  bezier((7.2, 0.4571), (2.4, 0.4571), (7.2, 1.607), (2.4, 1.607), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((4.8, 1.32), [#text(size: 9pt)[$0$]], anchor: "south", padding: 0.1176cm)
  bezier((7.2, -0.4571), (0, -0.4571), (7.2, -1.807), (0, -1.807), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.6, -1.47), [#text(size: 9pt)[$- sigma$]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: Admissible digits, read from high exponents to low exponents. There are two copies of the three nonzero states, one for each sign $sigma$, sharing state $0$. Edge labels are digits; double circles mark permitted terminal states. A return to $0$ may be followed by either sign. ],
) <np:automaton>

Let $o \( d \) = \# { i : d_i eq.not 0 }$. At a position $i$ of a block, define

#[#set math.equation(numbering: n => "(6.17)")
 $ eta_i = sum_(d upright(" admissible")\
d_i eq.not 0) frac(x_(*)^(o \( d \) - 2), o \( d \)) . $ <np:damping>]

The same coefficients are repeated in every block. An admissible nonzero pattern has at least three nonzero digits, so all summands are well defined.

#thm([Lemma 6.6.])[
  (Cost of admissible patterns).  #emph[Set 
#[#set math.equation(numbering: n => "(6.18)")
 $ S_(*) = (1 + frac(2 x_(*)^4, 1 - x_(*)^2))^18 (1 + frac(2 x_(*)^3, 1 - x_(*)^2)) - 1 . $ <np:pattern-cost>]

 Then $S_(*) < 0.081$, and 
#[#set math.equation(numbering: n => "(6.19)")
 $ sum_(d upright(" admissible")\
o \( d \) > 0) x_(*)^(o \( d \)) lt.eq S_(*) \, #h(2em) eta_i x_(*)^2 lt.eq S_(*) \/ 3 \,\
frac(overline(eta), 1 - S_(*) \/ 3) < 0.101 \, #h(2em) overline(eta) = 1 / 21 sum_(i in B_q) eta_i . $ <np:damping-estimates>]

]
] <np:damping-bounds>

#proof[
  A completed excursion from $0$ to $0$ has the digit string
  $ \[ sigma \, - sigma \, - sigma \, \( 0 \, - sigma \, - sigma \)^l \, - sigma \] \, #h(2em) l gt.eq 0 . $
  It has $4 + 2 l$ nonzero digits and can begin in at most $18$ positions of a block. An optional final excursion ending at $C_sigma$ has the same form without the last digit; its sign and length determine its starting position. Ignoring incompatibilities between these choices overcounts the admissible patterns and gives (6.18). At $x_(*) = 0.199$, the two fractions in that expression are less than $0.00327$ and $0.01642$. The inequality $\( 1 + a \)^18 lt.eq \( 1 - 18 a \)^(- 1)$, valid for $0 lt.eq 18 a < 1$, proves $S_(*) < 0.081$ by rational arithmetic.
  Since $o \( d \) gt.eq 3$, each $eta_i x_(*)^2 lt.eq S_(*) \/ 3$. Summing (6.17) over positions gives $sum_i eta_i lt.eq S_(*) \/ x_(*)^2$. Thus
  $ frac(overline(eta), 1 - S_(*) \/ 3) lt.eq frac(0.081, 21 \( 0.199 \)^2 \( 1 - 0.081 \/ 3 \)) < 0.101 . $
  ◻
]

For the moment fix $N$, and abbreviate $Z_i = Z_i^(\( 0 \, N \))$, $G_i = G_i^(\( N \))$, and $x_i = \| G_i \|$. Define

#[#set math.equation(numbering: n => "(6.20)")
 $ h_i = 1 - eta_i x_i^2 \, #h(2em) F_i = h_i #scale(x: 120%, y: 120%)[\(] 1 + \( 1 - x_i^2 \) \( Z_i G_i + overline(Z_i G_i) \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) i in J_N . $ <np:factors>]

These factors are bounded above and bounded away from zero uniformly in $N \, i \, x_D$. Indeed, $h_i gt.eq 1 - S_(*) \/ 3$, and the other factor is at least $1 - 2 x_(*) > 0$.

#thm([Proposition 6.7.])[
  (Bounded integral).  #emph[For every $N$ and every fixed complex coordinate $x_alpha$, 
#[#set math.equation(numbering: n => "(6.21)")
 $ integral_(bb(R)) psi \( x_beta \) product_(i in J_N) F_i \( x_D \) thin d x_beta lt.eq integral_(bb(R)) psi \( x_beta \) thin d x_beta \, #h(2em) psi \( v \) = (frac(sin \( pi v \/ 10 \), pi v \/ 10))^2 \, $ <np:integral-bound>]

 where $psi \( 0 \) = 1$.]
] <np:integral>

#proof[
  We use the Fourier convention $e^(2 pi upright(i) xi x_beta)$. The nonnegative integrable function $psi$ has Fourier transform supported in $\[ - 0.1 \, 0.1 \]$, hence in $\[ - 1 \, 1 \]$. On suppressing the common frequency factor $- 1 \/ p' \( beta \)$, the frequency of $Z_i$ is $beta^i$. Every phase appearing in $G_i$ has frequency of absolute value at most $beta^(i - 30)$. For the type-1 term this follows from
  $ \| beta^(i - 33) \( beta^(- 3) - 1 + beta \) #scale(x: 120%, y: 120%)[\|] lt.eq beta^(i - 30) . $
  We call these predictor frequencies slow. Expanding a factor $F_i$ gives monomials with one fast digit $d_i in { - 1 \, 0 \, 1 }$, corresponding to $Z_i^(d_i)$, and at most five slow frequencies: two from $h_i$, two from $1 - \| G_i \|^2$, and one from $G_i$ or its conjugate.
  Expand the last block according to its fast digits, keeping all earlier factors for the moment. We first show that every inadmissible pattern has zero integral, even after multiplication by those earlier factors. Expand the latter and all slow pieces into monomials. If the current index is $i$, the fast sum accumulated from the top of the last block, divided by $beta^i$, follows the recurrence $v mapsto beta v + d_i$. By (6.15), each allowed transition agrees with the state values (6.16) up to an injected error of absolute value at most $beta^(- 30)$. The propagated error, including at a first forbidden step, is bounded by
  #[#set math.equation(numbering: n => "(6.22)")
   $ frac(beta^(- 30) beta^21, beta - 1) < 0.005 . $ <np:recurrence-error>]
  At a first forbidden step, the ideal absolute value is at least $beta \( beta - 1 \)$ for a departure from $A_sigma$ or $B_sigma$, and at least $2$ for a departure from $C_sigma$. After (6.22), it is greater than $1.5$. All lower fast digits together contribute at most $\( beta - 1 \)^(- 1) < 1.192$ in the same units. If instead all transitions are allowed but the terminal state is $A_sigma$ or $B_sigma$, the absolute value at the bottom index $i$ is at least $beta - 1 - 0.005$. The one-index gap then bounds the earlier fast terms by $1 \/ \( beta \( beta - 1 \) \) < 0.649$.
  In either case, all slow terms, including those from earlier blocks, contribute at most
  #[#set math.equation(numbering: n => "(6.23)")
   $ frac(5 beta^(- 30) beta^21, beta - 1) < 0.025 $ <np:slow-error>]
  relative to $beta^i$. To see this, sum at most five frequencies of size $beta^(j - 30)$ over indices $j$ no larger than the top of the last block; that top is at most $i + 20$. Thus the full frequency has absolute value greater than $0.1 beta^i \/ \| p' \( beta \) \| > 1$. Its integral against $psi$ is zero.
  After removing these zero integrals, the last block contributes $product_(i in B_q) h_i$ times the sum over admissible fast patterns. The zero pattern contributes one. A nonzero pattern has absolute value at most $product_(d_i eq.not 0) x_i$, since $0 lt.eq 1 - x_i^2 lt.eq 1$. The arithmetic–geometric mean inequality gives
  $ product_(d_i eq.not 0) x_i lt.eq x_(*)^(o \( d \) - 2) frac(1, o \( d \)) sum_(d_i eq.not 0) x_i^2 . $
  The absolute value of the retained pattern sum is therefore at most $1 + sum_(i in B_q) eta_i x_i^2$. Writing $t_i = eta_i x_i^2$, we have $0 lt.eq t_i < 1$ and
  $ product_(i in B_q) \( 1 - t_i \) (1 + sum_(i in B_q) t_i) lt.eq 1 \; $
  for example, use $product \( 1 - t_i \) lt.eq exp \( - sum t_i \)$. Since $psi$ and all earlier factors are nonnegative, removing the last block can only increase the upper bound for the integral. Repeat with the preceding blocks to obtain (6.21). ◻
]

=== 6.4 A typical exponential gain <np:gain-section>

We now evaluate the same factors in the stationary model, replacing $Z_i \, G_i$ in (6.20) by $cal(Z)_i^(\( 0 \)) \, cal(G)_i$; denote the resulting factors by $cal(F)_i$. The damping coefficients remain periodic with period $22$, and are used at the same $21$ positions per period.

#thm([Lemma 6.8.])[
  (A logarithmic estimate).  #emph[For $0 lt.eq x lt.eq x_(*)$ and $\| u \| lt.eq 2 x$, 
#[#set math.equation(numbering: n => "(6.24)")
 $ log \( 1 + \( 1 - x^2 \) u \) gt.eq u - u^2 / 2 - C_(*) x^3 \, #h(2em) C_(*) := frac(2, 3 sqrt(1 - x_(*)^2)) . $ <np:log-bound>]

]
] <np:log-inequality>

#proof[
  The assertion is immediate for $x = 0$. Otherwise let $D_x \( u \) = u - u^2 \/ 2 - log \( 1 + \( 1 - x^2 \) u \)$. Its derivative is
  $ D'_x \( u \) = frac(x^2 - x^2 u - \( 1 - x^2 \) u^2, 1 + \( 1 - x^2 \) u) . $
  For $u gt.eq 0$, this is at most the positive part of $x^2 - \( 1 - x^2 \) u^2$. Integrating that positive part on $\[ 0 \, oo \)$ gives $2 x^3 \/ \( 3 sqrt(1 - x^2) \) lt.eq C_(*) x^3$. On $\[ - 2 x \, 0 \]$, the only possible interior critical point is a minimum, so the maximum is at an endpoint. We have $D_x \( 0 \) = 0$, whereas
  $ frac(d, d x) D_x \( - 2 x \) = frac(2 x^2 \( 1 - 2 x - 4 x^2 \), 1 - 2 x + 2 x^3) lt.eq 2 x^2 . $
  As $D_0 \( 0 \) = 0$, integration gives $D_x \( - 2 x \) lt.eq 2 x^3 \/ 3 lt.eq C_(*) x^3$. ◻
]

#thm([Proposition 6.9.])[
  (Growth on typical words).  #emph[For uniformly distributed words $a in { 0 \, 1 }^N$, 
#[#set math.equation(numbering: n => "(6.25)")
 $ Pr {sum_(i in J_N) log F_i \( x \( a \) \) > 0.000220 N} arrow.r 1 . $ <np:typical-gain-bound>]

]
] <np:typical-gain>

#proof[
  Apply Lemma 22 with $x = \| cal(G)_i \|$ and $u = 2 cal(L)_i$. The identity
  $ 2 bb(E) cal(L)_i^2 = bb(E) \| cal(G)_i \|^2 + "Re" bb(E) #scale(x: 120%, y: 120%)[\[] \( cal(Z)_i^(\( 0 \)) \)^2 cal(G)_i^2 #scale(x: 120%, y: 120%)[\]] $
  and the bound $bb(E) \| cal(G)_i \|^3 lt.eq x_(*) bb(E) \| cal(G)_i \|^2$ control the second and third order terms. Also
  $ log \( 1 - eta_i \| cal(G)_i \|^2 \) gt.eq - frac(eta_i \| cal(G)_i \|^2, 1 - S_(*) \/ 3) . $
  Set $gamma = 22^(- 1) sum_(i in B_0) bb(E) log cal(F)_i$, where the division by $22$ includes the unused index. Since $C_(*) x_(*) < 0.136$, Proposition 19 and Lemma 20 give the stationary mean rate $gamma$ with
  #[#set math.equation(numbering: n => "(6.26)")
   $ gamma & gt.eq 21 / 22 (2 bb(E) cal(L)_0 - (1 + C_(*) x_(*) + frac(overline(eta), 1 - S_(*) \/ 3)) bb(E) \| cal(G)_0 \|^2 - lr(|bb(E) \[ \( cal(Z)_0^(\( 0 \)) \)^2 cal(G)_0^2 \]|))\
 & > 21 / 22 #scale(x: 120%, y: 120%)[\(] 2 \( 0.000210 \) - 1.237 \( 0.000145 \) - 0.000007 #scale(x: 120%, y: 120%)[\)] > 0.000222 . $ <np:mean-gain>]
  For completeness, we justify passage from this mean to finite words. Truncate each sequence $C_A$ to $\[ - H \, H \]$, for a fixed integer $H$. The stationary logarithmic block sums formed from these truncated sequences depend on finitely many bits. They are uniformly bounded, have the same mean from block to block, and are independent when their blocks are sufficiently far apart. The variance of an average of $Q$ such block sums is therefore $O_H \( Q^(- 1) \)$. Their averages converge in probability to their means.
  Absolute summability of $C_0 \, C_1$ makes the truncated characters uniformly close to the original characters as $H arrow.r oo$. The predictors are finite sums with bounded total absolute weight, and the factors are uniformly bounded away from zero. Consequently the logarithms also converge uniformly under this truncation. Letting $H arrow.r oo$ after $N arrow.r oo$ proves
  $ 1 / N sum_(i in J_N) log cal(F)_i arrow.r gamma #h(2em) upright("in probability") . $
  Couple the reversed word bits to $\( b_0 \, dots.h \, b_(N - 1) \)$ in this stationary sequence. For fixed $H$, the truncated finite and stationary characters used in a factor agree whenever $H + 2000 lt.eq i lt.eq N - 1 - H$. Only a number of boundary indices depending on $H$, not on $N$, remain. The same uniform approximation thus shows
  $ 1 / N (sum_(i in J_N) log F_i \( x \( a \) \) - sum_(i in J_N) log cal(F)_i) arrow.r 0 $
  uniformly over the coupled bit sequences. Together with (6.26), this proves (6.25). ◻
]

=== 6.5 Counting typical vectors and proving singularity <np:cover-section>

The integral bound applies to continuous coordinates, whereas Proposition 23 concerns lattice points. The remaining step is to thicken each such point by a fixed radius. Normalization in the expanding directions makes the resulting change in the whole logarithmic product bounded independently of the word length.

#thm([Lemma 6.10.])[
  (Thickening word vectors).  #emph[There are constants $rho > 0$ and $C_(upright("thick")) < oo$, independent of $N$, such that the radius-$rho$ balls about distinct lattice points in Lemma 17 are disjoint, and, whenever $y'$ lies in the ball about $y \( a \)$, 
#[#set math.equation(numbering: n => "(6.27)")
 $ lr(|sum_(i in J_N) log F_i \( x'_D \) - sum_(i in J_N) log F_i \( x_D \( a \) \)|) lt.eq C_(upright("thick")) \, #h(2em) x'_r = r^(- N) y'_r quad \( r in D \) . $ <np:thickening-bound>]

]
] <np:thickening>

#proof[
  Choose $rho lt.eq 1$ smaller than half the minimum distance between distinct points of the lattice. A coordinate change of size at most one in $y$ changes the exponent of $Z_j^(\( 0 \, N \))$ by at most
  $ 2 pi sum_(r in D) frac(\| r \|^(j - N), \| p' \( r \) \|) . $
  Every character occurring in $F_i$, including those in the type-1 term of the predictor, has index at most $i$. The logarithm of $F_i$ is a uniformly Lipschitz function of these unit phases, since the coefficient sums and damping coefficients are bounded and $F_i$ is uniformly positive. Its variation is therefore at most a fixed constant times $sum_(r in D) \| r \|^(i - N)$. Finally,
  $ sum_(i in J_N) \| r \|^(i - N) lt.eq sum_(i = 0)^(N - 1) \| r \|^(i - N) < frac(1, \| r \| - 1) #h(2em) \( r in D \) . $
  This proves a bound independent of $N$. ◻
]

#proof[
  The root assertion and the fact that $beta$ is not Pisot were proved above. Call a word typical if it satisfies the inequality in (6.25), and let $cal(Y)_N$ be the set of distinct vectors $y \( a \)$ obtained from typical words. Typical words have probability tending to one. Lemma 24 implies that, for all sufficiently large $N$, the product $product_(i in J_N) F_i$ is at least $exp \( 0.000216 N \)$ throughout each of the disjoint balls about $cal(Y)_N$.
  All these balls lie in fixed bounded boxes in $\( x_D \, y_I \)$ coordinates, enlarged from those of Lemma 17. In the real expanding coordinate one may take $\| x_beta \| lt.eq 3$. The function $psi$ has a positive minimum on $\[ - 3 \, 3 \]$. Integrating first in $x_beta$, Proposition 21 bounds the integral of the product over this fixed box by a constant independent of $N$. The product does not depend on $y_I$. Changing back to $y$ coordinates contributes the Jacobian $cal(M)^N$. Comparing with the disjoint balls, each of the same positive volume, gives
  #[#set math.equation(numbering: n => "(6.28)")
   $ \# cal(Y)_N lt.eq C_(upright("count")) exp #scale(x: 120%, y: 120%)[\(] \( log cal(M) - 0.000216 \) N #scale(x: 120%, y: 120%)[\)] $ <np:count>]
  for a constant $C_(upright("count"))$.
  Let $mu$ be the law of $sum_(k gt.eq 0) b_k beta^(- k)$ for independent fair bits. By reversal in (6.5), its length-$N$ prefix has the distribution of $beta x_beta \( a \)$. Projecting $cal(Y)_N$ to this coordinate cannot increase its cardinality. For each resulting prefix value, attach an interval of length $beta^(- N) \/ \( 1 - beta^(- 1) \)$, which contains all possible remaining tails. Their union $K_N$ is compact, $mu \( K_N \) arrow.r 1$, and (6.4) and (6.28) give
  #[#set math.equation(numbering: n => "(6.29)")
   $ \| K_N \| lt.eq C_(upright("cover")) exp #scale(x: 120%, y: 120%)[\(] \( 0.0002094 - 0.000216 \) N #scale(x: 120%, y: 120%)[\)] = C_(upright("cover")) e^(- 0.0000066 N) . $ <np:cover-bound>]
  Choose a subsequence $N_j$ with $mu \( K_(N_j) \) > 1 - 2^(- j)$. Then $liminf_j K_(N_j)$ has full $mu$-measure and zero Lebesgue measure. Thus $mu$ is singular. Finally,
  $ sum_(k gt.eq 0) \( 2 b_k - 1 \) beta^(- k) = 2 sum_(k gt.eq 0) b_k beta^(- k) - frac(1, 1 - beta^(- 1)) \, $
  so its law $nu_(1 \/ beta)$ is an affine image of $mu$ and is singular as well. ◻
]

== 7 A rational certificate for the degree-31 example <cert:section>

This appendix proves the root bounds in Proposition 16 and the predictor estimates in Proposition 19. The root calculation uses exact rational arithmetic. The moment calculation combines finite rational products with an analytic estimate for their infinite tails. We specify the rounding and the order of operations so that the rational weights in (7.7) are completely determined. The accompanying script #raw("verification/verify_degree31.py") implements these instructions using only Python integers and rational fractions; the recurrences below give the complete certificate independently of that implementation. Every terminating decimal in this appendix denotes its exact rational value.

=== 7.1 Locating all the roots <cert:roots>

Recall the polynomial

$ p \( t \) = sum_(j = 0)^9 \( - t^(3 j) + t^(3 j + 1) \) - 2 t^30 + t^31 . $

Put $E = 10^40$. The entries in Table 1 are the real and imaginary numerators of centers $z = \( a + upright(i) b \) \/ E$. Include the conjugate of each nonreal center. Thus the table specifies $31$ disks, all of radius $delta = 10^(- 35)$. Denote its first and sixth centers by $z_beta$ and $z_alpha$, respectively.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 2,
  align: (right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Real numerator
], table.cell(rowspan: 1, colspan: 1)[Imaginary numerator
]),
  table.cell(rowspan: 1, colspan: 1)[18392867573155250211326543340571993487329
], table.cell(rowspan: 1, colspan: 1)[0
],
  table.cell(rowspan: 1, colspan: 1)[-9741384652837567528189111907762645564212
], table.cell(rowspan: 1, colspan: 1)[960611633124778624015947511546714789832
],
  table.cell(rowspan: 1, colspan: 1)[-9390979934023233037686839914141181659013
], table.cell(rowspan: 1, colspan: 1)[2848063934279278841200845525848576791934
],
  table.cell(rowspan: 1, colspan: 1)[-8707010393241200595697704637503228167256
], table.cell(rowspan: 1, colspan: 1)[4634358961359777463662031763152574795910
],
  table.cell(rowspan: 1, colspan: 1)[-7723118558199735333585947045021501410451
], table.cell(rowspan: 1, colspan: 1)[6250214494152701297733561366714273855663
],
  table.cell(rowspan: 1, colspan: 1)[-6480873022754265587670654805348739312397
], table.cell(rowspan: 1, colspan: 1)[7617033927823246411701558316834470378693
],
  table.cell(rowspan: 1, colspan: 1)[-3296776282962928450195355562079974291919
], table.cell(rowspan: 1, colspan: 1)[9362810613239308448752821856735617305389
],
  table.cell(rowspan: 1, colspan: 1)[-1442513481645415489053007250852371013818
], table.cell(rowspan: 1, colspan: 1)[9733039088635544125591234293715446465839
],
  table.cell(rowspan: 1, colspan: 1)[473579005983151143865690217073943282984
], table.cell(rowspan: 1, colspan: 1)[9759329295153416086962240697595385836176
],
  table.cell(rowspan: 1, colspan: 1)[2372858204750359429049351486827380431084
], table.cell(rowspan: 1, colspan: 1)[9430908396110323024329804770889268443510
],
  table.cell(rowspan: 1, colspan: 1)[4184061662454447896993374181551299054853
], table.cell(rowspan: 1, colspan: 1)[8750376307352230997951514116951420713869
],
  table.cell(rowspan: 1, colspan: 1)[5840543823426662247726359012202878127980
], table.cell(rowspan: 1, colspan: 1)[7733999914049269380846159864123679516166
],
  table.cell(rowspan: 1, colspan: 1)[7280042164772721585016920411987150804420
], table.cell(rowspan: 1, colspan: 1)[6409668313572020921539025901166241650504
],
  table.cell(rowspan: 1, colspan: 1)[8444162922855313595050499086097221186662
], table.cell(rowspan: 1, colspan: 1)[4814843758334683329011653039104490553475
],
  table.cell(rowspan: 1, colspan: 1)[9275649862302447872891854755866108397375
], table.cell(rowspan: 1, colspan: 1)[2996533501299661135726051235425500195711
],
  table.cell(rowspan: 1, colspan: 1)[9715324892541617145821300300817663390044
], table.cell(rowspan: 1, colspan: 1)[1019107767839771580294306582422817927060
],
)
]],
  caption: [Table 1: Rational centers for the roots; both columns have denominator $10^40$. ],
)

For a complex number write $parallel z parallel_1 = \| Re z \| + \| Im z \|$ and $parallel z parallel_oo = max \( \| Re z \| \, \| Im z \| \)$. Exact Horner evaluation gives, at every displayed center,

#[#set math.equation(numbering: n => "(7.1)")
 $ \| z \| < 2 \, #h(2em) parallel p' \( z \) parallel_oo > 1 \, #h(2em) 2 dot.op 10^35 parallel p \( z \) parallel_1 < parallel p' \( z \) parallel_oo . $ <cert:residual>]

Here is an integer prescription for these comparisons. For $q \( t \) = sum_(j = 0)^d q_j t^j$ and the Gaussian integer $Z = E z$, initialize $\( V \, h \) = \( q_d \, 1 \)$ and, for $j = d - 1 \, d - 2 \, dots.h \, 0$, replace

$ h arrow.l E h \, #h(2em) V arrow.l Z V + h q_j . $

The final value is $q \( z \) = V \/ h$. Apply this to $p$ and $p'$, and clear the positive denominators in (7.1). Comparisons of squared distances give $\| z - z' \| > .01$ for distinct centers, including conjugates. Comparisons of coordinates and squared moduli also give

#[#set math.equation(numbering: n => "(7.2)")
 $ 1.83928 < z_beta < 1.83929 \, #h(2em) 1.0002090 < \| z_alpha \|^2 < 1.0002093 \,\
\| z \| < .9939 quad upright("at all other displayed centers") . $ <cert:center-bounds>]

For $\| h \| = delta$, the terms of degree at least two in $p \( z + h \) - p \( z \) - p' \( z \) h$ have total modulus at most

$ delta^2 sum_(j = 0)^31 \| p_j \| 3^j < 10^17 delta^2 . $

Indeed, $\| z \| < 2$ and $delta < 1$, so the binomial expansion gives this bound term by term. By (7.1), the constant term is less than $\| p' \( z \) \| delta \/ 2$, whereas the displayed remainder is less than $\| p' \( z \) \| delta \/ 2$. Rouché’s theorem therefore puts exactly one root, counted with multiplicity, in each disk. The disks are disjoint and their number is the degree, so these are all the roots and all are simple. The root in the real-centered disk is real by conjugation. Every other disk misses the real axis, so the remaining roots form fifteen nonreal conjugate pairs. The radius $10^(- 35)$ and (7.2) imply every bound in Proposition 16, including $\| 1 \/ alpha \| < .9999$.

=== 7.2 Rounded coefficient arrays and finite products <cert:algorithm>

The numerical inputs are the sequences $C_0 \, C_1$ defined in the main text in (6.6). We approximate their single and paired moments

#[#set math.equation(numbering: n => "(7.3)")
 $ P_A = product_(m in bb(Z)) cos \( pi C_A \( m \) \) \, #h(2em) P_(A B)^sigma \( k \) = product_(m in bb(Z)) cos #scale(x: 120%, y: 120%)[\(] pi \( C_A \( m \) + sigma C_B \( m + k \) \) #scale(x: 120%, y: 120%)[\)] \, $ <cert:exact-moments>]

where $A \, B in { 0 \, 1 }$, $sigma in { 1 \, - 1 }$, and $k gt.eq 0$. Both products converge by exponential decay of the coefficients. The sign notation $+$ and $-$ means $sigma = 1$ and $sigma = - 1$.

We now specify the approximations used to define the weights. Use

$ S = 10^30 \, #h(2em) R = 3000 \, #h(2em) H = 100 \, #h(2em) K = 2000 \, #h(2em) W = 10^9 . $

For a real rational $x$ set

$ \[ x \] = frac(floor.l S x + 1 \/ 2 floor.r, S) \, $

and round complex numbers componentwise. Thus, if $x = u \/ v$ with integers $u \, v$ and $v > 0$, its rounded numerator is $floor.l \( 2 S u + v \) \/ \( 2 v \) floor.r$. Additions, subtractions, conjugation, and multiplication by an integer are exact unless brackets are explicitly displayed. Set

$ pi' = 3141592653589793238462643383279 / S . $

The inequality $\| pi' - pi \| < 1 \/ S$ follows by using $30$ terms of the alternating series for $arctan \( 1 \/ 5 \)$ and $10$ for $arctan \( 1 \/ 239 \)$ in Machin’s identity $pi = 16 arctan \( 1 \/ 5 \) - 4 arctan \( 1 \/ 239 \)$. The total remainder bound is

$ frac(16, 61 dot.op 5^61) + frac(4, 21 dot.op 239^21) . $

In particular this verification, too, uses rational arithmetic only.

The contracting and expanding roots are denoted by $I$ and $D$, as in the main text. For each representative center $z$ first form $r_z = \[ 1 \/ p' \( z \) \]$, with $p' \( z \)$ evaluated exactly. Store a base and a coefficient as follows:

#[#set math.equation(numbering: n => "(7.4)")
 $ \( a_z \, v_z \) = cases(delim: "{", \( \[ z \] \, r_z \) \, & \| z \| < 1 \,, \( \[ 1 \/ z \] \, - \[ \[ 1 \/ z \] r_z \] \) \, & \| z \| > 1 .) $ <cert:base-pairs>]

For a contracting representative, start $v = v_z$ and add $2 Re v$ to $c_0 \( - 1 \)$, then to $c_0 \( - 2 \) \, c_0 \( - 3 \) \, dots.h$, replacing $v arrow.l \[ v a_z \]$ after each addition. For an expanding representative do the same on $c_0 \( 0 \) \, c_0 \( 1 \) \, dots.h$; the multiplier is $1$ for the real root and $2$ for the nonreal representative. All arrays start at zero. Compute $c_0 \( m \)$ on

$ - R - K - 5 lt.eq m lt.eq H + K + 5 $

and define, wherever these three entries are present,

#[#set math.equation(numbering: n => "(7.5)")
 $ c_1 \( m \) = c_0 \( m + 3 \) - c_0 \( m \) + c_0 \( m - 1 \) . $ <cert:shift-array>]

These extra endpoint entries ensure that every subsequent use of $c_1$ lies in its defined range. The arrays approximate the sequences $C_0 \, C_1$ in the main text.

For a rational input $c$ let $g \( c \) \, h \( c \)$ be the following rounded cosine and sine values. The displayed loop fixes the order of the summation.

#raw(block: true, lang: "", "x = [pi' c];  y = [x*x]\nt = 1;  u = x;  g = t;  h = u\nfor j = 1,...,50:\n    t = [-t*y/(2*j*(2*j-1))]\n    u = [-u*y/(2*j*(2*j+1))]\n    g = g+t;  h = h+u\nreturn (g,h)")

Write $g_A \( m \) = g \( c_A \( m \) \)$ and $h_A \( m \) = h \( c_A \( m \) \)$.

The only expanding root close to the unit circle is $alpha$ and its conjugate. To treat their long tail, set

#[#set math.equation(numbering: n => "(7.6)")
 $ a = 1 \/ alpha \, #h(2em) u_0 = - a \/ p' \( alpha \) \, #h(2em) u_1 = u_0 \( a^3 - 1 + 1 \/ a \) . $ <cert:weak-coefficients>]

Their contribution to $C_A \( m \)$ for $m gt.eq H$ is $u_A a^m + overline(u_A a^m)$. Let $\( a' \, u'_0 \)$ be the pair in (7.4) belonging to $z_alpha$. Compute

$ a'_0 = 1 \, #h(2em) a'_(n + 1) = \[ a' a'_n \] quad \( 0 lt.eq n < K \) \, #h(2em) u'_1 = \[ u'_0 \( a'_3 - 1 + \[ 1 \/ a' \] \) \] . $

The subscript in $a'_n$ is a power-array index.

For a single moment use $w = u'_A$ and $k = 0$. For a paired moment of types $A \, B in { 0 \, 1 }$, sign $sigma in { 1 \, - 1 }$, and lag $0 lt.eq k lt.eq K$, use $w = u'_A + sigma \[ u'_B a'_k \]$. In either case the following calculation returns an approximate moment. It retains the finite factors $- R - k lt.eq m < H$, omits the rapidly convergent negative tail, and treats the positive tail by summing the degree-$2$, $4$, and $6$ terms of $- log cos$ through geometric series. Their sum is the variable #raw("pen"); the divisors $2 \, 12 \, 45$ are the corresponding Taylor denominators. To compute $e^(- mono("pen"))$, the algorithm first approximates $e^(- mono("pen") \/ 32)$ and then squares five times. This tail value is computed first, and the finite factors are then multiplied in increasing order of $m$. Section 7.3 bounds all omissions and rounding errors.

#raw(block: true, lang: "", "U = [w*a'_H]\nq_0 = 1;  q_i = [q_{i-1}*U]       for i = 1,...,6\nb_0 = 1;  b_i = [b_{i-1}*pi']     for i = 1,...,6\npen = 0\nfor d = 2,4,6:\n    mom = 0\n    for j = 0,...,d:\n        num = [q_j*conj(q_{d-j})]\n        den = 1-[a'_j*conj(a'_{d-j})]\n        mom = mom+binomial(d,j)*Re([num/den])\n    pen = pen+[b_d*mom/f_d]       (f_2,f_4,f_6) = (2,12,45)\nx = [-pen/32];  t = 1;  value = t\nfor j = 1,...,40:\n    t = [t*x/j];  value = value+t\nrepeat five times: value = [value*value]\nfor m = -R-k,...,H-1, in increasing order:\n    v = g_A(m)                               (single)\n    v = [g_A(m)*g_B(m+k)-sigma*h_A(m)*h_B(m+k)] (pair)\n    value = [value*v]\nreturn value")

Denote the outputs by $tilde(P)_A$ and $tilde(P)_(A B)^sigma \( k \)$, respectively.

We use only lags $30 lt.eq k lt.eq 2000$. With $s = 0$ for $sigma = 1$ and $s = 1$ for $sigma = - 1$, put $r = tilde(P)_00^sigma \( k \)$ and set

#[#set math.equation(numbering: n => "(7.7)")
 $ w_(k s) = frac("sgn" \( r \), W) ⌊.68 W max \( 0 \, \| r \| - .00026 \) + 1 / 2⌋ \, #h(2em) 30 lt.eq k lt.eq 2000 . $ <cert:weights>]

Take $"sgn" \( 0 \) = 0$ and omit zero weights from subsequent sums. The recurrences above and this formula define the weights without any choices or numerical tolerances.

=== 7.3 A uniform error bound for the moment calculation <cert:error>

We prove

#[#set math.equation(numbering: n => "(7.8)")
 $ \| tilde(P)_A - P_A \| < Delta \, #h(2em) \| tilde(P)_(A B)^sigma \( k \) - P_(A B)^sigma \( k \) \| < Delta \, #h(2em) Delta = 5 dot.op 10^(- 6) \, $ <cert:delta>]

for all types, signs, and lags used above. The important issue is the weakly contracting base $a = 1 \/ alpha$: truncating its powers at $H = 100$ would not be accurate. The geometric sums in the tail calculation retain all of these powers.

===== 7.3.1 Coefficient and trigonometric errors. <coefficient-and-trigonometric-errors.>

For $\| z \| < 2.001$, termwise differentiation gives

$ \| p'' \( z \) \| < 4 dot.op 10^13 . $

Hence $p'$ changes by less than $4 dot.op 10^(- 22)$ between a center and its root. By (7.1), reciprocal differentiation and rounding in (7.4) give base errors less than $2 \/ S$ and coefficient errors less than $10^(- 21)$. Direct squared modulus comparisons give $\| a_z \| < 1$ and $\| v_z \| lt.eq 1$ for every stored pair. The corresponding exact coefficients have modulus less than $1.001$. Thus each recurrence step $v arrow.l \[ v a_z \]$ propagates the existing error with factor at most $1$ and adds less than $4 \/ S$. There are fewer than $5100$ such steps in any needed entry. Each coefficient-times-power term consequently has error less than $2 dot.op 10^(- 21)$, and

#[#set math.equation(numbering: n => "(7.9)")
 $ \| c_0 \( m \) - C_0 \( m \) \| < 7 dot.op 10^(- 20) \, #h(2em) \| c_1 \( m \) - C_1 \( m \) \| < 2.1 dot.op 10^(- 19) . $ <cert:coefficient-errors>]

The finite recurrence also gives the following rational comparisons:

#[#set math.equation(numbering: n => "(7.10)")
 $ max_(A \, m) \| c_A \( m \) \| < .847 \, #h(2em) max_(m gt.eq - 20) \| c_0 \( m \) \| < .018 \, #h(2em) max_A \| u'_A \| < .0087 \,\
.8460 < max_(A \, m) \| c_A \( m \) \| < .8462 . $ <cert:array-bounds>]

The maxima here range over the computed entries; use squared moduli for the complex coefficients $u'_A$. To reproduce them, perform the coefficient recurrences in (7.4), the additions in (7.5), and the displayed definition of $u'_1$. These comparisons require neither evaluation of trigonometric functions nor a root-finding routine.

Every later trigonometric input is a sum of at most four of these coefficients, counted with multiplicity. Its error is less than $10^(- 18)$, and its rounded angle satisfies $\| x \| lt.eq 13$ and $\| y \| lt.eq 170$. The angle error is less than $4 dot.op 10^(- 18)$. For the Taylor recurrences at a fixed value of $y$, each term-rounding error contributes at most $e^14 \/ S$ to the final sum: the subsequent factorial denominators bound the amplification by $sum_(j gt.eq 0) 170^j \/ \( 2 j \) ! < e^14$. Replacing $x^2$ by $y$ costs at most $100 e^14 \/ S$, by differentiating the absolute term sums. The omitted Taylor tails at $\| x \| lt.eq 13$ are less than $10^(- 30)$. Together these effects give errors below $10^(- 20)$ relative to the computed angle, and below $10^(- 16)$ relative to the true cosine and sine. In particular every single or paired finite factor has error less than $10^(- 15)$.

There are at most $R + K + H = 5100$ finite factors. The true factors have modulus at most $1$, and their approximations have modulus at most $1 + 10^(- 15)$. Telescoping the product, including its roundings, shows that with an initial value of modulus at most $2$ these errors contribute less than $3 dot.op 10^(- 11)$.

===== 7.3.2 Terms omitted at the two ends. <terms-omitted-at-the-two-ends.>

On the negative side, $\| C_0 \( m \) \| lt.eq 32 \( .994 \)^(- 1 - m)$ for $m < 0$, by summing the contracting-root terms. Including the three shifts for type $1$, a single or paired coefficient at $m < - R - k$ is bounded by

$ 200 \( .994 \)^(- 4 - \( m + k \)) . $

Using $1 - cos u lt.eq u^2 \/ 2$ and telescoping products, the total omitted product costs at most

$ frac(3.142^2 thin 200^2, 2) frac(\( .994 \)^5994, 1 - \( .994 \)^2) < 5 dot.op 10^(- 8) . $

For example, the rational inequality $\( .994 \)^2996 < 3 dot.op 10^(- 8)$ already suffices for this estimate. On the positive side the only terms omitted from the coefficients are those from $beta$. Their bases are less than $.545$, and their type-$0$ and type-$1$ coefficients have modulus at most $4$. The cosine Lipschitz bound therefore gives a total error at most $3.142 dot.op 8 dot.op \( .545 \)^100 \/ \( 1 - .545 \) < 10^(- 20)$.

===== 7.3.3 The geometric tail and its rounding. <the-geometric-tail-and-its-rounding.>

Let $w_(*) = u_A$ in the single case and $w_(*) = u_A + sigma u_B a^k$ in the paired case. Put $U_(*) = w_(*) a^H$. The exact sums of the even powers of the weak-root tail are

#[#set math.equation(numbering: n => "(7.11)")
 $ mu_d = sum_(n gt.eq 0) \( U_(*) a^n + overline(U_(*) a^n) \)^d = sum_(j = 0)^d binom(d, j) Re frac(U_(*)^j overline(U_(*))^(d - j), 1 - a^j macron(a)^(d - j)) quad \( d = 2 \, 4 \, 6 \) . $ <cert:geometric-moments>]

The equality follows by the binomial theorem and absolutely convergent geometric series. In particular $mu_d gt.eq 0$.

The power-array errors satisfy $\| a'_n - a^n \| lt.eq 3 n \/ S$. Because $\| a \| \, \| a' \| > .99$, the formula for $u'_1$ gives errors below $5 dot.op 10^(- 21)$ for both $u'_A$, and $\| u_A \| lt.eq .00871$. It follows that the computed $U$ has error below $10^(- 19)$; its powers through degree $6$ have errors below $10^(- 18)$. In each quotient in the algorithm, the numerator error is below $3 dot.op 10^(- 18)$ and the denominator error is below $10^(- 28)$. The true and computed denominators have modulus greater than $.00019$: use

$ \| 1 - a^j macron(a)^(d - j) \| gt.eq 1 - \| a \|^d > 1 - \( .9999 \)^2 > .00019 $

and the stated rounding error. Hence each quotient error is below $2 dot.op 10^(- 14)$, the error in each computed $mu_d$ is below $2 dot.op 10^(- 12)$, and $\| mu_d \| < 4 dot.op 10^5$ by the same denominator bound. The rounded powers of $pi'$ through degree $6$ have errors below $10^(- 22)$. Consequently #raw("pen") approximates the nonnegative number

#[#set math.equation(numbering: n => "(7.12)")
 $ P = frac(pi^2 mu_2, 2) + frac(pi^4 mu_4, 12) + frac(pi^6 mu_6, 45) $ <cert:penalty>]

to within $10^(- 9)$.

For $m gt.eq H$, the weak coefficient has angle bounded by

$ 3.142 dot.op 4 dot.op .00871 dot.op \( .9999 \)^m < .11 \( .9999 \)^m . $

Summing the powers of this bound gives

$ P lt.eq frac(.11^2, 2 \( 1 - .9999^2 \)) + frac(.11^4, 12 \( 1 - .9999^4 \)) + frac(.11^6, 45 \( 1 - .9999^6 \)) < 31 . $

Thus $\| mono("pen") \| < 32$ and $\| x \| < 1.1$ in the exponential calculation. The $40$-term exponential recurrence has Taylor remainder less than $10^(- 40)$. Its rounding errors, bounded using $e^1.1$, are negligible compared with $10^(- 9)$. Each squaring amplifies its existing error by at most $3$, since the true intermediate values for the computed penalty are at most $e^(10^(- 9))$. Including the error in (7.12), the returned exponential is within $4 dot.op 10^(- 9)$ of $e^(- P)$.

===== 7.3.4 The analytic remainder of the tail. <the-analytic-remainder-of-the-tail.>

For real $z$ with $\| z \| lt.eq .11$ one has

#[#set math.equation(numbering: n => "(7.13)")
 $ lr(|- log cos z - z^2 / 2 - z^4 / 12 - z^6 / 45|) lt.eq .1 z^8 . $ <cert:logcos-remainder>]

Here are elementary bounds proving the stated constant. Set $y = z^2$, $h = 1 - cos z$, and $h_0 = y \/ 2 - y^2 \/ 24 + y^3 \/ 720$. Then $0 lt.eq h lt.eq y \/ 2$ and $\| h - h_0 \| lt.eq y^4 \/ 40320$. In $- log \( 1 - h \) = h + h^2 \/ 2 + h^3 \/ 3 + dots.h.c$, the terms after the third are bounded by $h^4 \/ \( 4 \( 1 - h \) \) < .016 y^4$. Substitution of $h_0$ in the first three terms costs less than $.00004 y^4$. The terms through degree $3$ are $y \/ 2 + y^2 \/ 12 + y^3 \/ 45$; the sum of the absolute values of the remaining coefficients is less than $.03$, so their contribution is less than $.03 y^4$ for $0 lt.eq y lt.eq .0121$. These bounds imply (7.13).

Applying (7.13) to all weak tail angles gives

$ lr(|sum_(m gt.eq H) - log cos #scale(x: 120%, y: 120%)[\(] pi \( w_(*) a^m + overline(w_(*) a^m) \) #scale(x: 120%, y: 120%)[\)] - P|) lt.eq frac(.1 \( .11 \)^8, 1 - \( .9999 \)^8) < 3 dot.op 10^(- 6) . $

Both penalties are nonnegative, so the same bound applies to the difference of their exponentials. Combining this with the rounding error, the finite-factor error, and the two omitted ends proves (7.8); indeed the sum of the stated errors is below $3.055 dot.op 10^(- 6)$.

=== 7.4 Correlation, variance, and the absolute Gram sum <cert:moments>

For the rest of the appendix, abbreviate $Z_i = cal(Z)_i^(\( 0 \))$ and $G_i = cal(G)_i$ from (6.9) and (6.11). All expectations are under the stationary law of the two-sided independent bits.

The preceding calculation defines exact rational weights and bounds each moment error uniformly. We next sum those moments to prove the first three estimates of Proposition 19. A final finite-product estimate will prove the fourth.

Write $X = - .001$, $Y = .0055$, and let $cal(R)$ be the nonzero rows $\( w_(k s) \, k \, s \)$ with $30 lt.eq k lt.eq 2000$. Define

$ b_A = tilde(P)_A \, #h(2em) m_(k 0) = tilde(P)_00^(+) \( k \) \, quad m_(k 1) = tilde(P)_00^(-) \( k \) \, #h(2em) e = tilde(P)_01^(+) \( 33 \) . $

The approximated correlation is

#[#set math.equation(numbering: n => "(7.14)")
 $ tilde(c) = X b_0 + Y e + sum_(\( w \, k \, s \) in cal(R)) w m_(k s) . $ <cert:corr-sum>]

For each lag $k$, let $J_(k 0)$ and $J_(k 1)$ be respectively the second (minus) and first (plus) entries of the following pair:

$ cases(delim: "{", \( tilde(P)_10^(+) \( k - 33 \) \, tilde(P)_10^(-) \( k - 33 \) \) \, & k gt.eq 33 \,, \( tilde(P)_01^(+) \( 33 - k \) \, tilde(P)_01^(-) \( 33 - k \) \) \, & k < 33 .) $

The approximated squared norm and absolute Gram sum are

#[#set math.equation(numbering: n => "(7.15)")
 $ tilde(v) =  & X^2 + Y^2 + 2 X Y b_1 + 2 sum_(\( w \, k \, s \) in cal(R)) w \( X b_0 + Y J_(k s) \)\
 & + sum_(\( w \, k \, s \) \, \( v \, l \, t \) in cal(R)) w v thin m_(\| k - l \| \, thin upright(bold(1))_(s = t)) \,\
tilde(T) =  & sum_(\( w \, k \, s \) \, \( v \, l \, t \) in cal(R)\
k \, l gt.eq 50) \| w v thin m_(\| k - l \| \, thin upright(bold(1))_(s = t)) \| . $ <cert:var-sum>]

Both double sums are over ordered pairs. Equal signs require the minus moment in a conjugated phase pair; opposite signs require the plus moment. This explains the index $upright(bold(1))_(s = t)$, including the diagonal cases.

The exact finite calculations give

#[#set math.equation(numbering: n => "(7.16)")
 $ \| cal(R) \| & = 753 \,\
\| X \| + \| Y \| + sum_(cal(R)) \| w \| & = 198442946 \/ W \,\
\| X \| + \| Y \| + sum_(\( w \, k \, s \) in cal(R)\
k < 50) \| w \| & = 11816095 \/ W \,\
W S tilde(c) & = 211815537786494774284357596751188225 \,\
W^2 S tilde(v) & = 143920884250294630908494564120361905955993456 \,\
W^2 S tilde(T) & = 105303788239450118397416374596041413014338334 . $ <cert:exact-output>]

These are integer equalities: compute the arrays and products in Section 7.2, round the weights by (7.7), and use the unrounded rational sums (7.14)–(7.15). In particular

$ 211810 < 10^9 tilde(c) < 211820 \, quad 143910 < 10^9 tilde(v) < 143930 \, quad 105300 < 10^9 tilde(T) < 105310 . $

This gives $\| G_i \| < .199$ and $\| G_i^(\( N \)) \( x \) \| < .199$ by the triangle inequality. The total correlation error is at most $Delta dot.op .199$, and the squared-norm error is at most $Delta dot.op .199^2$. Thus

$ bb(E) Re \( Z_i G_i \) > .0002108205 > .000210 \, #h(2em) bb(E) \| G_i \|^2 < .000144119 < .000145 . $

To prepare for the last estimate, call the constant row, the type-$1$ row, and the rows with $k < 50$ the #emph[small rows]; the remaining rows are the #emph[big rows]. A row of weight $w_v$ has phase $U_v = exp \( pi upright(i) sum_m f_v \( m \) e_m \)$, where $e_m = 2 b_(i + m) - 1$. Its sequence $f_v$ is zero for the constant, $C_1 \( m + 33 \)$ for the type-$1$ row, and $\( 1 - 2 s \) C_0 \( m + k \)$ for a row $\( w \, k \, s \)$. Define the true absolute Gram sum

#[#set math.equation(numbering: n => "(7.17)")
 $ T = sum_(v \, v' med upright("big")) \| w_v w_(v') bb(E) U_v overline(U_(v')) \| . $ <cert:true-T>]

The error between this sum and (7.15) is at most $Delta dot.op .199^2$, by $\| \| x \| - \| y \| \| lt.eq \| x - y \|$. Hence

#[#set math.equation(numbering: n => "(7.18)")
 $ T < .000116 \, #h(2em) sqrt(T) < .011 . $ <cert:T-bound>]

The total absolute weight of the small rows is less than $.012$.

=== 7.5 Finite products controlling the remaining moment <cert:finite-products>

We now bound $bb(E) \( Z_i^2 G_i^2 \)$. The big rows have small coefficients on the $71$ positions $- 70 lt.eq m lt.eq 0$. More precisely, with $t = .06$, (7.9) and (7.10) give

#[#set math.equation(numbering: n => "(7.19)")
 $ \| tan \( pi f_v \( m \) \) \| lt.eq t quad \( v upright(" big") \, med - 70 lt.eq m lt.eq 0 \) . $ <cert:tangent-bound>]

Indeed $m + k gt.eq - 20$ for these rows, and the coefficient bound $.018$, together with $sin u lt.eq u$ and $cos u gt.eq 1 - u^2 \/ 2$, is sufficient.

For any real sequence $V$ put $c_m = \| cos \( pi V \( m \) \) \|$ and $s_m = \| sin \( pi V \( m \) \) \|$. The finite products needed below are

#[#set math.equation(numbering: n => "(7.20)")
 $ B_2 \( V \) & = product_(m = - 70)^0 min (1 \, frac(\( 1 + t^2 \) c_m + 2 t s_m, 1 - t^2)) \,\
B_1 \( V \) & = product_(m = - 70)^0 min (1 \, frac(c_m + t s_m, sqrt(1 - t^2))) \,\
B_0 \( V \) & = product_(m = - 200)^0 c_m . $ <cert:B-def>]

Their bounds are

#[#set math.equation(numbering: n => "(7.21)")
 $ B_2 \( 2 C_0 \) < .011 \, #h(2em) max_(f med upright("small")) B_1 \( 2 C_0 + f \) < .015 \, #h(2em) max_(f \, g med upright("small")) B_0 \( 2 C_0 + f + g \) < .0032 . $ <cert:B-bounds>]

Here the maxima range over the actual phase sequences of the small rows. Besides the constant and the type-$1$ row, their eight nonzero rows are as follows:

$ k & 32 & 36 & 37 & 39 & 40 & 43 & 44 & 47\
s & 0 & 1 & 0 & 1 & 0 & 0 & 1 & 1\
W w_(k s) & - 536932 & 1265024 & 331701 & 47119 & 1483338 & 436861 & 458216 & 756904 $

For completeness, the following upper-rounding calculation verifies all of (7.21). For each of its three cases and each indicated choice of small rows, form the approximate sequence $V'$ by replacing $C_A$ by $c_A$. Initialize $v = 1$. For increasing $m$ in the relevant interval, compute

$ b & = \| g \( V' \( m \) \) \| + 10^(- 15) \, & y & = \| h \( V' \( m \) \) \| + 10^(- 15) \,\
F_0 & = b \, & F_1 & = S^(- 1) + \[ 1.002 \( b + .06 y \) \] \,\
 &  & F_2 & = S^(- 1) + \[ 1.004 \( 1.0036 b + .12 y \) \] \,\
v & arrow.l S^(- 1) + \[ v min \( 1 \, F_j \) \] &  & upright("in case ") j . $

The factors $1.002$ and $1.004$ bound $\( 1 - t^2 \)^(- 1 \/ 2)$ and $\( 1 - t^2 \)^(- 1)$, respectively. The added $10^(- 15)$ exceeds the trigonometric error proved above, and each added $S^(- 1)$ compensates for a possibly downward rounding. Thus this calculation gives upper bounds, including for $B_0$ because its true factors are at most $1$. The maximum final numerators at scale $S$, in the order $B_2 \, B_1 \, B_0$, are

#[#set math.equation(numbering: n => "(7.22)")
 $ 10861284406435197401851134503 \,\
14731866010915969694738277129 \,\
3155364376927094122833206055 . $ <cert:B-output>]

Multiplication by $10^6 \/ S$ bounds them respectively by $10862$, $14732$, and $3156$, proving (7.21).

=== 7.6 From the finite products to the anisotropy bound <cert:walsh>

The estimates just obtained concern individual coefficients and finite products. We finish by showing how they control the full sum of phases without expanding every three-phase moment. Write $G_i = G_(upright("small")) + G_(upright("big"))$ according to the preceding partition, and fix any subset $J subset { - 70 \, dots.h \, 0 }$. Expanding the big phases in the independent signs $e_m$ on $J$ gives

#[#set math.equation(numbering: n => "(7.23)")
 $ G_(upright("big")) = sum_(A subset J) upright(i)^(\| A \|) e_A H_A \, #h(2em) e_A = product_(m in A) e_m \, $ <cert:walsh-expansion>]

where

$ H_A = sum_(v med upright("big")) w_v U_v^(upright("out")) product_(m in J) cos \( pi f_v \( m \) \) product_(m in A) tan \( pi f_v \( m \) \) . $

The phase $U_v^(upright("out"))$ depends only on signs outside $J$, so each $H_A$ is independent of the signs on $J$.

We claim that

#[#set math.equation(numbering: n => "(7.24)")
 $ parallel H_A parallel_2 lt.eq sqrt(T) thin t^(\| A \|) \( 1 - t^2 \)^(- \| J \| \/ 2) . $ <cert:H-bound>]

For two big rows, independence gives their full Gram entry as the outside Gram entry times

$ product_(m in J) cos \( pi f_v \( m \) \) cos \( pi f_(v') \( m \) \) #scale(x: 120%, y: 120%)[\(] 1 + tan \( pi f_v \( m \) \) tan \( pi f_(v') \( m \) \) #scale(x: 120%, y: 120%)[\)] . $

By (7.19), each last factor is at least $1 - t^2$. In the expansion of $parallel H_A parallel_2^2$, the extra tangent products have modulus at most $t^(2 \| A \|)$. Taking absolute values term by term therefore bounds the squared norm by $T t^(2 \| A \|) \( 1 - t^2 \)^(- \| J \|)$, proving (7.24).

First consider $bb(E) \( Z_i^2 G_(upright("big"))^2 \)$ and set $V = 2 C_0$. For a pair $A \, A' subset J$ in (7.23), averaging the signs on $J$ contributes a factor of modulus $c_m$ where membership in $A \, A'$ agrees, and a factor of modulus $s_m$ where it differs. The outside expectation is bounded by $parallel H_A parallel_2 parallel H_(A') parallel_2$ using Cauchy–Schwarz and the unit modulus of the outside part of $Z_i^2$. Summing over the four membership choices at each site gives

$ \| bb(E) \( Z_i^2 G_(upright("big"))^2 \) \| lt.eq T product_(m in J) frac(\( 1 + t^2 \) c_m + 2 t s_m, 1 - t^2) . $

Choose $J$ to contain precisely those positions whose displayed factor is less than $1$. This yields

#[#set math.equation(numbering: n => "(7.25)")
 $ \| bb(E) \( Z_i^2 G_(upright("big"))^2 \) \| lt.eq T B_2 \( 2 C_0 \) . $ <cert:big-square>]

For a fixed small phase $U$ with sequence $f$, use the same expansion with $V = 2 C_0 + f$. There is now one subset $A$; summing its two membership choices produces $c_m + t s_m$. The outside expectation is bounded by $parallel H_A parallel_2$. Optimizing $J$ as before gives

$ \| bb(E) \( Z_i^2 U G_(upright("big")) \) \| lt.eq sqrt(T) B_1 \( 2 C_0 + f \) . $

For two small phases with sequences $f \, g$, independence directly bounds their full moment by $B_0 \( 2 C_0 + f + g \)$: discard all the other absolute cosine factors, which are at most $1$.

Finally sum these bounds with the absolute row weights. Using (7.18), (7.21), and the small-weight bound $.012$, we obtain

$ \| bb(E) \( Z_i^2 G_i^2 \) \| & lt.eq T dot.op .011 + 2 \( .012 \) sqrt(T) dot.op .015 + \( .012 \)^2 dot.op .0032\
 & < .000116 dot.op .011 + 2 dot.op .012 dot.op .011 dot.op .015 + .012^2 dot.op .0032\
 & = .0000056968 < .000007 . $

This proves the remaining estimate of Proposition 19.


#bibliography("refs.bib", style: "ieee", title: [References])
