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

#align(center)[#text(size: 16pt, weight: "bold")[Short Egyptian fractions]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

An Egyptian-fraction expansion of a positive rational number is a finite sum of distinct reciprocals of positive
  integers. For integers $1 lt.eq a < b$, let $N \( a \, b \)$ be the least $k$ for which

$ a / b = 1 / n_1 + dots.h.c + 1 / n_k \, wide 2 lt.eq n_1 < dots.h.c < n_k \, wide n_i in bb(Z) \, $

and put $N \( b \) = max_(1 lt.eq a < b) N \( a \, b \)$.
  The fractions $a \/ b$ need not be in lowest terms, and the denominators $n_i$ have no prescribed upper bound.
  The greedy algorithm shows that such expansions exist. We determine the order of their maximum minimum length.
  Individual numerators can have much shorter expansions: for example, $N \( 1 \, b \) = 1$ for every $b gt.eq 2$.

#thm([Theorem 1.1.])[
  #emph[There are absolute constants $c_1 \, c_2 > 0$ and $b_0$ such that, for every integer $b gt.eq b_0$,
$ c_1 log log b lt.eq N \( b \) lt.eq c_2 log log b . $

 In particular, the upper bound holds for every integer numerator $1 lt.eq a < b$.]
] <thm:main>

Nakayama’s study of $N \( a \, b \)$ emphasized arithmetic criteria for expansions with few terms
  #cite(label("Nakayama1940")) Section I. The uniform problem asks how these minimum lengths behave as the
  numerator varies over a fixed denominator. In 1950, Erdős reported de Bruijn’s bound $N \( b \) lt.double log
  b \/ log log log b$ and improved it to $N \( b \) lt.double log b \/ log log
  b$ #cite(label("Erdos1950")) p. 195, Theorem 1. He proposed the double-logarithmic upper bound and proved the
  matching lower order, already for the numerator $b - 1$ #cite(label("Erdos1950")) p. 195, Theorem 2.
  The question appears again in Erdős and Graham #cite(label("ErdosGraham1980")) pp. 37–38 and is recorded as
  Erdős Problem 304 #cite(label("Bloom304")). Vose subsequently obtained $N \( b \) lt.double
  sqrt(log b)$ #cite(label("Vose1985")); an explicit modern statement of his uniform bound is given in
  #cite(label("vanDoornTang2026")) Lemma 2.2. Theorem 1 proves Erdős’s conjecture affirmatively.
  The lower bound is classical; the issue is the uniform upper bound.

A related line of work controls the denominators as well as the length.
  Tenenbaum and Yokota proved that, for each fixed $epsilon > 0$ and every sufficiently large $b$,
  every $a \/ b in \( 0 \, 1 \)$ has a distinct expansion of length at most $\( 1 + epsilon \) log b \/ log log
  b$, with all denominators at most $4 b \( log b \)^2 log log b$ #cite(label("TenenbaumYokota1990")) Theorem,
  p. 151. Their length estimate serves this simultaneous constraint.
  Here we optimize only the order of the length and leave the denominator sizes unrestricted.

The uniform theorem also determines the double-logarithmic order of the number of representations of one.
  For each positive integer $k$, put

$ F \( k \) = \# {\( n_1 \, dots.h \, n_k \) : 1 lt.eq n_1 < dots.h.c < n_k \, quad n_i in bb(Z) \, quad 1 / n_1 +
  dots.h.c + 1 / n_k = 1} . $

Here too there is no upper bound on the denominators.

#thm([Corollary 1.2.])[
  #emph[There are absolute constants $c \, C > 0$ and $k_0$ such that, for every integer $k gt.eq k_0$,
$ c k lt.eq log log F \( k \) lt.eq C k . $

]
] <cor:counting>

Erdős and Graham asked for good estimates for this counting function #cite(label("ErdosGraham1980")) p. 32.
  Konyagin stated a lower bound with double logarithm of order $k \/ log
  k$ #cite(label("Konyagin2014")) Theorem 1; Elsholtz obtained this lower order even when every denominator is
  congruent to $1$ or $- 1$ modulo a fixed squarefree integer $P > 1$:
  the bound holds for every sufficiently large $k$, with $k$ required to be odd when $P$ is even,
  and its constant may depend on $P$ #cite(label("Elsholtz2016")) Theorem 1.1.
  Elsholtz and Planitzer proved an upper bound with double logarithm $O \( k \)$,
  allowing repetitions as well #cite(label("ElsholtzPlanitzer2021")) Corollary 3(2).
  Corollary 2 determines the double-logarithmic order for unrestricted distinct denominators.

We can also ask which exact denominators occur among these expansions.
  For each integer $k gt.eq 1$, let $D_k$ be the set of integers $m gt.eq
  2$ for which there are positive integers $n_1 < dots.h.c < n_k$ satisfying

$ 1 = sum_(i = 1)^k 1 / n_i \, wide m in { n_1 \, dots.h \, n_k } . $

Set

$ v \( k \) = min #scale(x: 120%, y: 120%)[\(] { 2 \, 3 \, dots.h } \\ D_k #scale(x: 120%, y: 120%)[\)] . $

The elementary denominator bound proved below makes $D_k$ finite, so this minimum exists.
  Each $m in D_k$ may use a different expansion; membership requires the exact denominator $m$ and exactly $k$
  distinct terms.

#thm([Corollary 1.3.])[
  #emph[For every sufficiently large integer $k$,
$ exp #scale(x: 120%, y: 120%)[\(] exp \( k \/ 600 \) #scale(x: 120%, y: 120%)[\)] lt.eq v \( k \) lt.eq 1 +
  k^(2^(k - 1)) . $

 More precisely,
$ frac(log 2, 257) lt.eq liminf_(k arrow.r oo) frac(log log v \( k \), k) lt.eq
  limsup_(k arrow.r oo) frac(log log v \( k \), k) lt.eq log 2 . $

 Equivalently for the lower bound, every fixed $c < log 2 \/ 257$ satisfies $v \( k \) gt.eq
   exp \( exp \( c k \) \)$ for every sufficiently large integer $k$.
   In particular $log log v \( k \) = Theta \( k \)$.]
] <cor:prescribed>

The prescribed-denominator question originates in Erdős and Graham #cite(label("ErdosGraham1980")) p. 35;
  see also Problem 293 #cite(label("Bloom293")). Van Doorn and Tang prove the lower bound $v \( k \) gt.eq
  exp \( c k^2 \)$ for an absolute $c > 0$ #cite(label("vanDoornTang2026")) Theorem 1.1.
  They also show that an exact prescribed denominator can be retained while increasing the length of a distinct
  expansion #cite(label("vanDoornTang2026")) Lemma 2.1 and anticipate the connection between uniform short
  expansions and a double-exponential lower bound for $v \( k \)$ #cite(label("vanDoornTang2026")) Section 3.
  We give the required marker-avoidance argument below, thereby deriving the qualitative order from Theorem 1.
  A direct construction additionally gives the numerical lower slope in Corollary 3,
  without quantifying the constant $c_2$ in the uniform theorem.
  The elementary upper bound is convenient rather than best known:
  sharper public upper bounds follow from the counting estimates of Elsholtz and Planitzer
  #cite(label("ElsholtzPlanitzer2021")) Corollary 3(2).

The two consequences impose different requirements on a construction.
  To obtain many expansions, it suffices to retain a denominator divisible by an integer with many prime factors.
  To include a prescribed integer $m$ in $D_k$, the exact term $1 \/ m$ must survive.
  The latter requirement governs both the initial construction and the operation that increases its length.

=== The proof in outline <the-proof-in-outline>

Put $S = log b$. After $O \( log S \)$ greedy steps, either the expansion is complete or its remainder has the
  form $A \/ C$, where $A lt.eq b$ and $C$ lies in a prescribed exponential range in $S$.
  We then construct an auxiliary integer $M$ with $e^S < M =
  exp \( O \( S \) \)$ and a large interval of numerators in which almost every fraction $u \/ \( M C \)$ has an
  expansion of length $O \( log S \)$. This dense family suffices for the original numerator:
  a suitable integer multiple $g A M$ lies well inside the interval,
  and it is the sum of two numerators from that dense family.
  Adding their expansions and dividing by $g$ represents $A \/ C$.

The dense family is obtained by descending through $O \( log S \)$ numerator ranges.
  At a range whose upper endpoint exceeds $e^S$, we represent fractions $u \/ \( M C \)$;
  at lower ranges we represent $u \/ M$, which is still less than one.
  Write $Q = C$ or $Q = 1$ for the denominator factor in the current range. A divisor $t$ of $M$ gives the identity

$ frac(u, M Q) = frac(1, \( M \/ t \) z) + 1 / z frac(h, M Q) \, wide z = ⌈frac(Q t, u)⌉ \, wide h = u z - Q t . $

Thus one unit fraction reduces the problem to the residue of $- Q t$ modulo $u$.
  When the denominator factor changes from $C$ to $1$, an expansion over $M$ can be transferred back over $M
  C$ by multiplying every denominator by $C$. We choose $M$ so that, for most numerators at each range,
  many of its divisors give small residues. Deterministic products of distinct primes provide the large-range
  estimate; independent random products provide the small-range estimate.
  At the bottom, the same construction gives a reduction for every remaining numerator, followed by a binary expansion.

The difficulty is to prevent the exceptional numerators from accumulating as these reductions are joined.
  For fixed $t$ and $h$, a predecessor $u$ must divide $Q t + h$.
  A uniform moment estimate for the number of small divisors in a shifted interval controls the total number of
  predecessors of a small exceptional set. Hölder’s inequality then gives a recurrence for the exceptional
  proportions that remains small throughout the descent. This combination of residue distribution,
  uniform divisor moments, and the final passage from a dense family to every numerator is the main mechanism of
  the proof.

The use of a common auxiliary denominator connects the proof to the classical divisor method.
  Erdős’s construction writes suitable integers as sums of distinct divisors of a factorial and turns those sums
  into unit fractions #cite(label("Erdos1950")) Section 1, pp. 199–203.
  Tenenbaum and Yokota obtain a shorter divisor decomposition by choosing successive divisors close to the
  remaining numerator #cite(label("TenenbaumYokota1990")) Lemma 4 and Section 3.
  The present descent instead selects divisors through the residues they produce.
  Modular control by finite Fourier methods also occurs in Croot’s work #cite(label("Croot1999")) and Martin’s
  development of it #cite(label("Martin2000")) Section 4, Lemmas 11–13,
  where subset sums of modular inverses remove large prime-power denominator factors.
  Here prime-product distributions supply many possible reductions,
  and a uniform divisor moment keeps their exceptional sets under control across all levels.
  The moment proof uses the prime-factor splitting method of Erdős #cite(label("Erdos1952Divisors")) Section 3;
  the truncation and shift uniformity needed here are established below.

Section 2 isolates the dense-family statement and deduces Theorem 1 from it.
  Section 3 proves the divisor estimate, Section 4 constructs the residue distributions,
  and Section 5 completes the dense-family argument. The construction constants are fixed first,
  then a moment order large enough for the descent, and finally a sufficiently large lower bound on $S$.
  Section 6 then deduces Corollary 2. Theorem 1 supplies a short expansion containing a denominator with many
  prime factors. Splitting that denominator over its divisors gives many distinct expansions,
  and an injective padding operation gives every sufficiently large prescribed length.
  Divisor-rich denominators and divisor-indexed splitting appear in Konyagin and Elsholtz
  #cite(label("Konyagin2014")) #cite(label("Elsholtz2016"));
  Konyagin explicitly records the padding injection #cite(label("Konyagin2014")) p. 312.

For the prescribed-denominator consequence, Section 7 reserves $1 \/
  m$ and uses a greedy prefix that skips denominator $m$. The remaining sum is smaller than every reserved
  reciprocal, so any positive expansion of that remainder avoids all reserved denominators.
  Applying Theorem 1 gives a short marked expansion, and a separate padding lemma retains the exact marker at
  every later length. For an explicit length constant, Section 8 instead constructs the tail from a common supply
  of rational numbers whose numerators divide one auxiliary integer.
  Prime-product residue collisions and the quantitative three-prime theorem provide this supply.
  A divisor-density property of the unreduced greedy denominator then groups the remaining numerator into few
  pieces. The resulting length coefficient $257 \/ log 2$ gives the lower slope after padding and absorbing the
  finitely many small markers.

Throughout, $bb(N) = { 1 \, 2 \, dots.h }$, $log$ is the natural logarithm,
  $log_2 x = \( log x \) \/ \( log 2 \)$, $upright(e) \( x \) = exp \( 2 pi i x \)$,
  and sums over real intervals have integer indices. The notations $O \( dot.op \)$ and $lt.double$ have absolute
  implied constants unless a dependence is indicated. Intermediate unit-fraction lists may contain repetitions.
  Lemma 5 removes them when the total is below one; Section 6 supplies the argument at total one.

== 2 From a dense set to every numerator <sec:elementary>

The main construction produces short expansions for most numerators over a carefully chosen denominator.
  We first state exactly what is needed from that construction, and then show why it suffices for every numerator.

#thm([Proposition 2.1.])[
  (A dense set of short expansions).  #emph[There are absolute constants $D_M > 1$, $L > 0$,
    and $S_0 > 1$ with the following property. Put $D_X = D_M + 2$ and $D_C = 4 D_X$.
    For every real $S gt.eq S_0$ and every integer $C$ satisfying
$ e^(D_C S) lt.eq C lt.eq e^(2 D_C S) \, $

 there are an integer $M$ and a set $G subset.eq { 1 \, dots.h \, floor.l X floor.r }$, where $X = e^(D_X S)$, such that
$ e^S < M lt.eq e^(D_M S) \, wide \| { 1 \, dots.h \, floor.l X floor.r } \\ G #scale(x: 120%, y: 120%)[\|] lt.eq
  X / 8 . $

 For each $u in G$, the fraction $u \/ \( M C \)$ is a sum of at most $L log
   S$ unit fractions with integer denominators at least $2$. Repetitions are allowed.]
] <prop:density>

Section 5 proves Proposition 4. Its constants and threshold are independent of $C$;
  the integer $M$ and the set $G$ may depend on $C$. The proof of Theorem 1 from this proposition is elementary.
  We record first how to remove repetitions and how to prepare a denominator in the required range.

#thm([Lemma 2.2.])[
  (Removing repetitions).  #emph[Let $k gt.eq 1$ be an integer.
    If $0 < x < 1$ is a sum of $k$ positive unit fractions with integer denominators,
    then it is a sum of $k$ such fractions with distinct denominators, all at least $2$.]
] <lem:distinct>

#proof[
  We use Takenouchi’s argument #cite(label("Takenouchi1921")) Sections II–III, pp. 79–80.
    For fixed $x > 0$ and $k$, there are only finitely many nondecreasing lists of $k$ denominators with
    reciprocal sum $x$. Indeed, the first denominator is at most $k \/ x$.
    Once it is chosen, induction applies to the remaining positive sum and the remaining $k - 1$ terms;
    when no terms remain the sum must be zero.
  If a denominator occurs twice, apply one of the identities
  $ frac(2, 2 p) = frac(1, p + 1) + frac(1, p \( p + 1 \)) \, wide frac(2, 2 p + 1) = frac(1, p + 1) +
    frac(1, \( p + 1 \) \( 2 p + 1 \)) . $
  Because the total is less than $1$, a denominator $1$, or a repeated denominator $2$, is impossible.
    Thus $p gt.eq 2$ in the first identity and $p gt.eq 1$ in the second.
    Each replacement preserves the number of terms and increases the sum of their denominators:
    the increases are $\( p - 1 \)^2$ and $2 p^2$, respectively.
    Finiteness of the set of lists therefore forces termination, at which point all denominators are distinct.
    Positivity and the unchanged total exclude a denominator $1$ throughout. ◻
]

#thm([Lemma 2.3.])[
  (Preparing the denominator).  #emph[Let $1 lt.eq a < b$ be integers and let $T > b$ be real. After at most
$ 1 + ⌈log_2 (frac(log T, log 2))⌉ $

 greedy steps, either $a \/ b$ has been expressed as a sum of unit fractions,
   or its positive remainder can be written as $A \/ C$, with integers
$ 1 lt.eq A lt.eq a \, wide T lt.eq C < T^2 . $

 All unit denominators produced are at least $2$. The fractions used during this procedure need not be reduced.]
] <lem:greedy>

#proof[
  For a positive remainder $A \/ C < 1$, set
  $ z = ⌈C / A⌉ \, wide A' = A z - C \, wide C' = C z . $
  Subtracting $1 \/ z$ leaves $A' \/ C'$. The ceiling inequality gives $0 lt.eq A' < A$,
    while integrality of $A$ gives $z lt.eq C$ and hence $C' lt.eq C^2$. Thus the numerator never exceeds $a$.
    Stop at zero or at the first positive remainder whose denominator is at least $T$.
    At such a first crossing, the preceding denominator was less than $T$, so the new one is less than $T^2$.
  To bound the number of steps, write $x = A \/ C$. Since $ceil.l 1 \/ x ceil.r lt.eq 1 + 1 \/ x$,
  $ 0 lt.eq x - frac(1, ceil.l 1 \/ x ceil.r) lt.eq frac(x^2, 1 + x) . $
  The first positive remainder is less than $1 \/ 2$, and subsequent remainders decrease at least by squaring.
    After $j gt.eq 1$ positive steps their values therefore satisfy
  $ x_j lt.eq 2^(- 2^(j - 1)) . $
  If the procedure has not yet stopped, its positive integer numerator gives $x_j gt.eq 1 \/ C_j > 1 \/ T$.
    This is impossible when $2^(j - 1) log 2 gt.eq log T$, proving the stated bound.
    Every current positive value is less than $1$, so $z gt.eq 2$. ◻
]

#proof[
  For the upper bound, fix $1 lt.eq a < b$, put $S = log b$, and assume that $S$ is sufficiently large.
    Apply Lemma 6 with $T = e^(D_C S)$. This uses $O \( log S \)$ terms.
    If the procedure terminates, Lemma 5 gives the required upper bound. Otherwise its remainder $A \/ C$ satisfies
  $ 1 lt.eq A < b \, wide e^(D_C S) lt.eq C < e^(2 D_C S) . $
  Choose $M \, G \, X$ from Proposition 4 for this $S \, C$. Since $D_X = D_M + 2$,
  $ A M < e^(\( D_M + 1 \) S) < X . $
  Let $g = floor.l X \/ \( A M \) floor.r$ and $n = g A M$.
    These are positive integers, and the inequality $floor.l t floor.r gt.eq t \/ 2$ for $t gt.eq 1$ gives
  $ X / 2 lt.eq n lt.eq X . $
  Write $H = { 1 \, dots.h \, floor.l X floor.r } \\ G$. Among the $n - 1$ positive splits $n = u + \( n - u \)$,
    at most $2 \| H \| lt.eq X \/ 4$ have an entry outside $G$.
    Since $n - 1 gt.eq X \/ 2 - 1 > X \/ 4$ for large $S$, some split has both entries in $G$.
    Their expansions together express
  $ frac(n, M C) = frac(g A, C) $
  using at most $2 L log S$ unit fractions. Multiplying every denominator by the integer $g$ gives an expansion of
    $A \/ C$ of the same length. Adjoin the greedy prefix and apply Lemma 5 to the total $a \/ b < 1$.
    The resulting distinct expansion has $O \( log S \)$ terms, uniformly in $a$.
    No reduction of $a \/ b$, or restriction on the final denominator sizes, has been used.
  For the lower bound, consider an expansion of $\( b - 1 \) \/ b$ with $k$ terms and append $1 \/ b$.
    Sort the resulting $s = k + 1$ denominators as $d_1 lt.eq dots.h.c lt.eq d_s$; repetitions are harmless here.
    Put $L_0 = 1$ and $L_j = d_1 dots.h.c d_j$. For each $1 lt.eq j lt.eq s$,
    the amount remaining after the first $j - 1$ terms is positive and has denominator dividing $L_(j - 1)$.
    Consequently
  $ 1 / L_(j - 1) lt.eq 1 - sum_(i < j) 1 / d_i = sum_(i = j)^s 1 / d_i lt.eq s / d_j . $
  It follows that $d_j lt.eq s L_(j - 1)$ and $L_j lt.eq s L_(j - 1)^2$.
    Induction gives $L_j lt.eq s^(2^j - 1)$ and $d_j lt.eq s^(2^(j - 1))$. As $b$ is one of these denominators,
  $ b lt.eq d_s lt.eq s^(2^(s - 1)) = \( k + 1 \)^(2^k) . $
  Hence $log log b lt.eq k log 2 + log log \( k + 1 \) lt.eq \( 1 + log 2 \) k$.
    The numerator $b - 1$ therefore supplies the required lower bound for $N \( b \)$. ◻
]

== 3 A uniform divisor moment <sec:divisors>

We need a divisor estimate for intervals that may be much shorter than their distance from zero.
  Only divisors up to a specified size are counted: for $X gt.eq 1$ and $n in bb(N)$, put

$ d_X \( n \) = \# { a in bb(N) : a lt.eq X \, med a divides n } . $

In the descent, this count bounds how many larger numerators can lead to the same smaller residue.
  We need to control the combined contribution of residues in a small exceptional set.
  Hölder’s inequality turns an $r$th-moment bound into a bound proportional to $delta^(1 - 1 \/ r)$ for a set
  occupying a proportion $delta$ of an interval. Choosing $r$ large limits the cumulative weakening of this bound
  through the $O \( log S \)$ levels of the descent. The moment exponent in the following lemma can be arbitrarily
  large, provided it is fixed before the parameter $S$ tends to infinity.
  The proof follows the prime-factor splitting method of Erdős #cite(label("Erdos1952Divisors")) Section 3;
  the uniform bound for this truncated count is proved in full here.

#thm([Lemma 3.1.])[
  #emph[For every fixed pair of real numbers $D \, r gt.eq 1$,
    there is $S_0 \( D \, r \)$ such that the following holds for $S gt.eq S_0 \( D \, r \)$.
    Suppose that $X \, Y$ are real numbers and $N$ is a nonnegative integer satisfying
$ frac(S, 2 log S) lt.eq log X lt.eq D S \, wide X^(1 \/ 2) lt.eq Y lt.eq X \, wide N lt.eq e^(D S) . $

 Then
#[#set math.equation(numbering: n => "(3.1)")
 $ sum_(1 lt.eq h lt.eq Y) d_X \( N + h \)^r lt.eq Y exp \( S^(1 \/ 4) \) . $ <eq:divisor-moment>]

]
] <lem:divisor>

#proof[
  Write $v = log X$, $E = D + 1$, and
  $ B = 1 + log \( E S \/ v \) . $
  Every integer $n = N + h$ under consideration satisfies $1 lt.eq n lt.eq 2 e^(D S) lt.eq
    e^(E S)$ for sufficiently large $S$. Moreover,
  #[#set math.equation(numbering: n => "(3.2)")
   $ 1 < B lt.eq 1 + log \( 2 E log S \) = O_D \( log log S \) . $ <eq:divisor-B>]
  All estimates below are uniform in $X \, Y \, N$ in the stated ranges.
  #emph[Two elementary estimates.] First, consider divisors of $n$ formed from primes at least $z gt.eq 2$.
    List these prime factors with multiplicity, giving distinct labels to repeated occurrences.
    There are at most $L = floor.l E S \/ log z floor.r$ occurrences,
    and a divisor at most $X$ uses at most $v \/ log z$ of them. Counting subsets can only overcount divisors.
    With $q = v \/ \( E S \) in \( 0 \, 1 \)$, their number is therefore at most
  #[#set math.equation(numbering: n => "(3.3)")
   $ sum_(0 lt.eq j lt.eq v \/ log z) binom(L, j) lt.eq q^(- v \/ log z) \( 1 + q \)^L lt.eq
     exp (frac(B v, log z)) . $ <eq:divisor-large-primes>]
  Here the middle inequality follows by inserting the weights $q^j$; the last uses $L q lt.eq v \/ log z$.
  Split the prime factors at $S^(1 \/ 2)$. For each smaller prime there are at most $1 +
    E S \/ log 2$ possible exponents in a divisor of $n$. Applying (3.3) to the remaining primes gives
  $ log d_X \( n \) lt.eq S^(1 \/ 2) log \( 1 + E S \/ log 2 \) + frac(2 B v, log S) . $
  Since $v gt.eq S \/ \( 2 log S \)$, there is a function $epsilon_D \( S \) arrow.r 0$, independent of $X \, Y \,
    N \, h$, such that
  #[#set math.equation(numbering: n => "(3.4)")
   $ d_X \( n \)^r lt.eq exp #scale(x: 120%, y: 120%)[\(] r epsilon_D \( S \) v #scale(x: 120%, y: 120%)[\)] \,
     wide epsilon_D \( S \) lt.double_D frac(\( log S \)^2, S^(1 \/ 2)) +
     frac(log log S, log S) . $ <eq:divisor-pointwise>]
  Second, write $tau \( d \)$ for the number of positive divisors of $d$.
    For fixed $r$ and $3 \/ 4 lt.eq sigma lt.eq 1$,
  #[#set math.equation(numbering: n => "(3.5)")
   $ log (1 + sum_(j gt.eq 1) \( j + 1 \)^r p^(- j sigma)) lt.eq C_r p^(- sigma) $ <eq:divisor-local-factor>]
  for every prime $p$. Indeed, the power series $sum_(j gt.eq 1) \( j + 1 \)^r x^(j - 1)$ is bounded on $0 lt.eq
    x lt.eq 2^(- 3 \/ 4) < 1$. We will also use the elementary estimate
  #[#set math.equation(numbering: n => "(3.6)")
   $ sum_(p lt.eq T) 1 / p lt.eq e log \( 1 + log T \) wide \( T gt.eq 2 \) . $ <eq:prime-reciprocals>]
  To prove it, set $s = 1 + 1 \/ log T$ and $zeta \( s \) = sum_(a gt.eq 1) a^(- s)$.
    Euler’s absolutely convergent product and the integral bound $zeta \( s \) lt.eq 1 + 1 \/ \( s - 1 \)$ give
  $ sum_(p lt.eq T) 1 / p lt.eq e sum_p p^(- s) lt.eq e log zeta \( s \) lt.eq e log \( 1 + log T \) . $
  In particular, multiplicativity and (3.5) imply
  #[#set math.equation(numbering: n => "(3.7)")
   $ sum_(d lt.eq T) frac(tau \( d \)^r, d) lt.eq product_(p lt.eq T) (1 + sum_(j gt.eq 1) \( j + 1 \)^r p^(- j))
     lt.double_r \( log \( 2 T \) \)^(C_r) . $ <eq:divisor-harmonic>]
  #emph[A prefix of the prime factorization.] For $n > sqrt(Y)$,
    order its prime factors with multiplicity and let $d$ be the longest initial product at most $sqrt(Y)$,
    allowing $d = 1$. Let $p$ be the next prime. Then
  $ d lt.eq sqrt(Y) < d p \, $
  all prime factors of $d$ are at most $p$, and all those of $n \/ d$ are at least $p$. The inequality
  $ d_X \( n \) lt.eq tau \( d \) d_X \( n \/ d \) $
  does not require $d$ and $n \/ d$ to be coprime: a divisor $a lt.eq X$ of $n$ determines
  $ b = gcd \( a \, d \) \, wide c = a \/ b . $
  Then $b divides d$, $c divides n \/ d$, $c lt.eq X$, and the pair $\( b \, c \)$ determines $a$. Thus (3.3) gives
  #[#set math.equation(numbering: n => "(3.8)")
   $ d_X \( n \)^r lt.eq tau \( d \)^r exp (frac(r B v, log p)) . $ <eq:divisor-prefix>]
  For any fixed $d lt.eq sqrt(Y)$, the number of its multiples in $\( N \, N + Y \]$ is at most
  #[#set math.equation(numbering: n => "(3.9)")
   $ Y / d + 1 lt.eq frac(2 Y, d) . $ <eq:divisor-multiples>]
  We now sum according to the size of the next prime $p$. If $p$ is large,
    the remaining factor $n \/ d$ has few small divisors. If $p$ is smaller,
    the condition $d p > sqrt(Y)$ forces $d$ to be a large product of small primes.
    The total reciprocal weight of such prefixes is small, so (3.9) limits their occurrence in every shifted interval.
  If $log p gt.eq v^(15 \/ 16)$, the exponential factor in (3.8) is at most $e^(r B v^(1 \/ 16))$.
    For $n lt.eq sqrt(Y)$, instead take $d = n$ and use $d_X \( n \) lt.eq tau \( d \)$.
    By (3.9) and (3.7), these two cases together contribute at most
  #[#set math.equation(numbering: n => "(3.10)")
   $ 2 Y e^(r B v^(1 \/ 16)) sum_(d lt.eq sqrt(Y)) frac(tau \( d \)^r, d) & lt.eq
     Y exp #h(-0.16667em) (O_(D \, r) \( S^(1 \/ 16) log log S + log S \)) . $ <eq:divisor-large-contribution>]
  For the remaining integers, $log p < v^(15 \/ 16)$, so
  #[#set math.equation(numbering: n => "(3.11)")
   $ log d > 1 / 2 log Y - log p gt.eq v \/ 4 - v^(15 \/ 16) > v \/ 5 $ <eq:divisor-prefix-lower>]
  once $S$ is sufficiently large. This large prefix makes integers with small next prime rare.
    We estimate the ensuing smooth-prefix sums by Rankin’s exponential weighting method;
    see #cite(label("HildebrandTenenbaum1993")) p. 414, (1.3).
  If $p < S^4$, every prime factor of $d$ is smaller than $S^4$.
    Multiplying each summand by $\( d \/ e^(v \/ 5) \)^(1 \/ 10) > 1$ gives
  $ sum_(d > e^(v \/ 5)\
ell divides d \, med ell med upright("prime") arrow.r.double ell < S^4) 1 / d lt.eq e^(- v \/ 50) product_(ell < S^4\
ell med upright("prime")) \( 1 - ell^(- 9 \/ 10) \)^(- 1) . $
  The logarithm of this product is $O \( S^(2 \/ 5) \)$, since
  $ sum_(ell < S^4\
ell med upright("prime")) ell^(- 9 \/ 10) lt.eq sum_(2 lt.eq a < S^4) a^(- 9 \/ 10) = O \( S^(2 \/ 5) \) . $
  Counting multiples by (3.9) and bounding the entire summand by (3.4), we obtain a contribution at most
  #[#set math.equation(numbering: n => "(3.12)")
   $ 2 Y exp (- v \/ 50 + O \( S^(2 \/ 5) \) + r epsilon_D \( S \) v) lt.eq
     2 Y e^(- v \/ 100) . $ <eq:divisor-small-contribution>]
  Here $S^(2 \/ 5) = o \( v \)$, uniformly in the allowed range.
  #emph[The intermediate primes.] It remains to treat $4 log S lt.eq log p < v^(15 \/ 16)$.
    Partition this range into intervals $\[ t \, 2 t \)$, where $t = 2^j 4 log S lt.eq v^(15 \/ 16)$.
    There are $O_D \( log S \)$ such intervals; the last may extend beyond the upper endpoint. For one interval put
  $ Q = v / t \, wide lambda = frac(log Q, 10 t) . $
  Then $Q gt.eq v^(1 \/ 16)$, and
  $ 0 < lambda lt.eq frac(log \( D S \/ \( 4 log S \) \), 40 log S) < 1 / 4 $
  for sufficiently large $S$. Equations (3.8), (3.9), and (3.11) bound the contribution of this interval by
  $ 2 Y e^(r B Q) sum_(d > e^(v \/ 5)\
ell divides d \, med ell med upright("prime") arrow.r.double ell lt.eq e^(2 t)) frac(tau \( d \)^r, d) . $
  The last sum is at most
  $ e^(- lambda v \/ 5) product_(ell lt.eq e^(2 t)\
ell med upright("prime")) (1 + sum_(j gt.eq 1) \( j + 1 \)^r ell^(- j \( 1 - lambda \))) . $
  By (3.5) and (3.6), the logarithm of this product is bounded by
  $ C_r sum_(ell lt.eq e^(2 t)\
ell med upright("prime")) ell^(- 1 + lambda) lt.double_r e^(2 t lambda) log \( 2 t \) =
  Q^(1 \/ 5) O_r \( log \( 2 t \) \) . $
  The contribution of the interval is consequently at most
  #[#set math.equation(numbering: n => "(3.13)")
   $ 2 Y exp (r B Q - frac(Q log Q, 50) + O_r \( Q^(1 \/ 5) log \( 2 t \) \)) . $ <eq:divisor-band>]
  Both positive terms in this exponent are uniformly negligible compared with $Q log Q$.
    Indeed, (3.2) and $Q gt.eq v^(1 \/ 16)$ give
  $ frac(r B, log Q) lt.double_(D \, r) frac(log log S, log S) arrow.r 0 \, wide
    frac(Q^(1 \/ 5) log \( 2 t \), Q log Q) lt.double v^(- 1 \/ 20) arrow.r 0 . $
  Thus (3.13) is at most $2 Y exp \( - Q log Q \/ 100 \) lt.eq 2 Y$, after increasing $S_0 \( D \, r \)$.
    Summing the intervals costs $O_D \( Y log S \)$.
  Combining this bound with (3.10) and (3.12) gives
  $ sum_(1 lt.eq h lt.eq Y) d_X \( N + h \)^r lt.eq Y exp #h(-0.16667em)
    (O_(D \, r) \( S^(1 \/ 16) log log S + log S \)) + 2 Y e^(- v \/ 100) + O_D \( Y log S \) . $
  The logarithmic loss is $o \( S^(1 \/ 4) \)$, proving (3.1).
    Every enlargement of the threshold depended only on the fixed $D \, r$;
    this completes the required uniformity check. ◻
]

== 4 Divisors with small residues <sec:residues>

We now construct the auxiliary denominator. Its useful divisors make most residues small at each of a sequence of
  scales. At the smallest scales, several independent lists of divisors ensure that every numerator has a suitable
  choice.

The underlying identity is elementary. For positive integers $M \, Q \, u \, t$ with $t divides M$, set

$ z = ⌈frac(Q t, u)⌉ \, wide h = u z - Q t . $

Then $z gt.eq 1$, $0 lt.eq h < u$, and

#[#set math.equation(numbering: n => "(4.1)")
 $ frac(u, M Q) = frac(1, \( M \/ t \) z) + frac(h, M Q z) . $ <eq:residue-step>]

Thus a small least nonnegative residue of $- Q t$ modulo $u$ leaves a small numerator.
  A zero residue finishes the expansion.

We use this identity with two denominator factors. At high levels we take $Q = C$:
  the large factor $C$ supplies cancellation in reciprocal phases as $u$ varies.
  At lower levels we take $Q = 1$ and construct expansions of $u \/ M$.
  Dividing such an expansion by $C$ gives one of $u \/ \( M C \)$, so the two regimes can be joined.
  The switch below is made when the entire level cutoff is at most $e^S$;
  then $u \/ M < 1$ because our construction ensures $M > e^S$.

=== 4.1 The denominator and the residue statement <the-denominator-and-the-residue-statement>

Fix the absolute constants

#[#set math.equation(numbering: n => "(4.2)")
 $ K = 100 \, quad R = 1000 \, quad D_0 = 100000 \, quad eta = 10^(- 4) \,\
D_M = \( 2 R + 2 \) \( K + 2 \) \, quad D_X = D_M + 2 \, quad D_C = 4 D_X . $ <eq:residue-constants>]

Here $K$ sets the prime scale, $R$ is the number of independent blocks, $D_0$ sets the binary cutoff,
  and $eta$ sets the rate of descent. These numerical choices leave room in the estimates below.
  Let $S$ tend to infinity, put $m = floor.l S \/ log S floor.r$, and fix an integer

#[#set math.equation(numbering: n => "(4.3)")
 $ e^(D_C S) lt.eq C lt.eq e^(2 D_C S) . $ <eq:C-range>]

Define

#[#set math.equation(numbering: n => "(4.4)")
 $ rho = e^(- eta m) \, wide X_j = e^(D_X S) rho^j \,\
d = min { j gt.eq 0 : X_j lt.eq e^m } \, wide C_j = cases(delim: "{", C \, & X_j > e^S \,, 1 \, & X_j lt.eq e^S .)
  $ <eq:levels>]

These cutoffs need not be integers. Every set or sum indexed by a cutoff below consists of integers in the
  indicated range. For $0 lt.eq j lt.eq d$, write

#[#set math.equation(numbering: n => "(4.5)")
 $ h_(j \, t) \( u \) = u ⌈frac(C_j t, u)⌉ - C_j t . $ <eq:least-residue>]

In particular, $h_(j \, t) \( u \)$ is the least nonnegative residue of $- C_j t$ modulo $u$.

#thm([Lemma 4.1.])[
  #emph[For all sufficiently large $S$ and every integer $C$ satisfying (4.3),
    there are an integer $M$ and indexed lists $T_0 \, T_1 \, dots.h \, T_R$, each with $2^m$ entries, such that:]
  + #emph[$e^S < M lt.eq e^(D_M S)$, and the least power of $2$ at least $S^(D_0)$ divides $M$.
    Every entry of every $T_i$ divides $M$.]
  + #emph[For each $0 lt.eq j < d$, let $T = T_0$ if $X_j > e^S$, and let $T = T_1$ otherwise.
    Apart from at most $X_j e^(- c_(*) m)$ integers $u in \( X_(j + 1) \, X_j \]$,
    at least $rho \| T \| \/ 2$ entries $t in T$ satisfy
$ h_(j \, t) \( u \) lt.eq X_(j + 1) \, wide c_(*) = 0.001 . $

]
  + #emph[For every integer $S^(D_0) < u lt.eq e^m$, some entry $t$ of one of $T_1 \, dots.h \, T_R$ satisfies
$ u ceil.l t \/ u ceil.r - t lt.eq u^(1 - eta) . $

]
  #emph[Repeated values in a list are counted with their indices. The threshold on $S$ is independent of $C$.]
] <lem:residues>

Here is the construction used to prove the lemma. Let $cal(P)$ be the set of primes in $\[ S^K \, 2 S^K \]$,
  and put $P = \| cal(P) \|$. The prime number theorem gives $P gt.eq S^(K - 1)$ for sufficiently large $S$; see,
  for example, #cite(label("Selberg1949")) p. 305, (1.1). Choose distinct $p_1 \, dots.h \, p_m in cal(P)$, and let

$ T_0 = (product_(j = 1)^m p_j^(I_j))_(I in { 0 \, 1 }^m) . $

Its entries are distinct. For each $1 lt.eq i lt.eq R$, choose $2
  m$ independent uniform samples $p_(i \, j \, epsilon.alt) in cal(P)$, where $1 lt.eq j lt.eq
  m$ and $epsilon.alt in { 0 \, 1 }$; all samples in different blocks are also independent. Set

$ T_i = (product_(j = 1)^m p_(i \, j \, I_j))_(I in { 0 \, 1 }^m) \,\
M = 2^a product_(j = 1)^m p_j product_(i = 1)^R product_(j = 1)^m p_(i \, j \, 0) p_(i \, j \, 1) \, $

where $2^a$ is the least power of $2$ at least $S^(D_0)$. Sampling is with replacement.
  Even when primes repeat, each list entry uses a submultiset of the factors of $M$, so it divides $M$.

The size bounds hold for every realization:

$ log M gt.eq K m log S gt.eq K \( S - log S \) > S \, $

whereas

$ log M lt.eq D_0 log S + log 2 + \( 2 R + 1 \) m \( K log S + log 2 \) lt.eq D_M S $

eventually. The last inequality follows because $\( 2 R + 1 \) K < D_M$. Every entry of every list also satisfies

#[#set math.equation(numbering: n => "(4.6)")
 $ 1 lt.eq t lt.eq e^(\( K + 1 \) S) . $ <eq:product-size>]

We record the endpoint facts used below and in the descent. For sufficiently large $S$,

#[#set math.equation(numbering: n => "(4.7)")
 $ frac(S, 2 log S) lt.eq m lt.eq frac(S, log S) \,\
d = ⌈frac(D_X S - m, eta m)⌉ lt.eq K_d log S \, wide K_d = frac(3 D_X, eta) \,\
e^(\( 1 - eta \) m) < X_d lt.eq e^m \, wide X_(j + 1) gt.eq sqrt(X_j) quad \( 0 lt.eq j < d \) . $ <eq:level-endpoints>]

Indeed, for $j < d$, $log X_j > m$, so $log X_(j + 1) = log X_j - eta m gt.eq \( 1 - eta \) log X_j$.
  Moreover $C_d = 1$, and $C_(j + 1) divides C_j$.

Table 1 summarizes the roles of the lists. The upper two rows are classified by the level cutoff $X_j$,
  so a high level may include some numerators below $e^S$. The binary step is carried out in Section 5.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Range and denominator factor
], table.cell(rowspan: 1, colspan: 1)[Divisors used
], table.cell(rowspan: 1, colspan: 1)[Coverage
]),
  table.cell(rowspan: 1, colspan: 1)[High levels: $X_j > e^S$, $C_j = C$
], table.cell(rowspan: 1, colspan: 1)[Deterministic list $T_0$
], table.cell(rowspan: 1, colspan: 1)[Most numerators at each level
],
  table.cell(rowspan: 1, colspan: 1)[Middle levels: $e^m < X_j lt.eq e^S$, $C_j = 1$
], table.cell(rowspan: 1, colspan: 1)[The same random list $T_1$
], table.cell(rowspan: 1, colspan: 1)[Most numerators at each level
],
  table.cell(rowspan: 1, colspan: 1)[Terminal range: $S^(D_0) < u lt.eq e^m$, factor $1$
], table.cell(rowspan: 1, colspan: 1)[Some list $T_i$, $1 lt.eq i lt.eq R$
], table.cell(rowspan: 1, colspan: 1)[Every numerator
],
  table.cell(rowspan: 1, colspan: 1)[Binary range: $1 lt.eq u lt.eq S^(D_0)$, factor $1$
], table.cell(rowspan: 1, colspan: 1)[Powers of $2$ dividing $M$
], table.cell(rowspan: 1, colspan: 1)[Every numerator
],
)
]],
  caption: [Table 1: The four stages of the numerator descent. The precise residue guarantees are stated in Lemma 8. ],
)

It remains to select the samples so that the two residue assertions hold.
  We first turn Fourier bounds into small residues, then prove the needed bound for $T_0$.
  Lemma 12 treats the random lists, and Section 4.4 makes the common choice.

=== 4.2 Discrepancy and the deterministic list <discrepancy-and-the-deterministic-list>

We use the Erdős–Turán discrepancy inequality #cite(label("ErdosTuran1948")) Part I, Theorem III.
  For any nonempty finite indexed list $\( x_t \)_(t in T)$ of real numbers, any interval $J subset \[ 0 \, 1 \)$,
  and any integer $H gt.eq 1$, it states that

#[#set math.equation(numbering: n => "(4.8)")
 $ lr(|frac(\# { t : { x_t } in J }, \| T \|) - \| J \||) lt.double 1 / H + sum_(ell = 1)^H 1 /
   ell lr(|frac(1, \| T \|) sum_(t in T) upright(e) \( ell x_t \)|) . $ <eq:erdos-turan>]

The implied constant is absolute, and list multiplicities are retained.
  The interval convention used below also retains entries at zero.
  For a finite list, a sufficiently small common positive rotation sends membership in $\[ 0 \, delta \)$ to
  membership in $\( 0 \, delta \]$, including all repeated endpoint entries correctly,
  while preserving every Fourier modulus. Thus the interval convention in the original proof
  #cite(label("ErdosTuran1948")) Part II, Sections 11–16 gives the form needed here.

#thm([Lemma 4.2.])[
  #emph[For all sufficiently large real $w$, suppose $u \, Q$ are positive integers and $T$ is a nonempty finite
    list of positive integers. If
$ lr(|frac(1, \| T \|) sum_(t in T) upright(e) \( ell Q t \/ u \)|) lt.eq e^(- 3 eta w) quad
  (1 lt.eq ell lt.eq floor.l e^(4 eta w) floor.r) \, $

 then at least $e^(- eta w) \| T \| \/ 2$ entries satisfy
$ 0 lt.eq u ceil.l Q t \/ u ceil.r - Q t < e^(- eta w) u . $

]
] <lem:discrepancy>

#proof[
  Apply (4.8) to $x_t = - Q t \/ u$ and $J = \[ 0 \, e^(- eta w) \)$.
    Conjugation leaves the Fourier bounds unchanged. The discrepancy is
  $ O #scale(x: 120%, y: 120%)[\(] e^(- 4 eta w) + \( 1 + 4 eta w \) e^(- 3 eta w) #scale(x: 120%, y: 120%)[\)] =
    o \( e^(- eta w) \) . $
  It is therefore at most $e^(- eta w) \/ 2$ eventually. Finally, ${ -
    Q t \/ u } = \( u ceil.l Q t \/ u ceil.r - Q t \) \/ u$, including when the residue is zero. ◻
]

At a level $X_j > e^S$, the large factor $C$ makes the reciprocal phases oscillate as $u$ varies.
  The following elementary estimate will make that observation uniform.

#thm([Lemma 4.3.])[
  #emph[Fix $B gt.eq 4$. There are constants $A_B \, delta_B > 0$ such that, for every sufficiently large $U$,
    every real $Z$ with $U^4 lt.eq \| Z \| lt.eq U^B$, and every interval $I subset \[ U \, 2 U \]$,
$ lr(|sum_(n in I) upright(e) \( Z \/ n \)|) lt.eq A_B U^(1 - delta_B) . $

]
] <lem:reciprocal-phase>

#proof[
  We give the derivative argument, including the elementary estimates it uses.
    This is the classical differencing method of van der Corput;
    see #cite(label("GrahamKolesnik1991")) Lemma 2.5 for differencing and #cite(label("GrahamKolesnik1991"))
    Theorem 2.2 for the second-derivative estimate.
  First, if $\| a_n \| lt.eq 1$ is supported on an interval of length at most $U$, then for $2 lt.eq L lt.eq U$,
  #[#set math.equation(numbering: n => "(4.9)")
   $ U^(- 2) lr(|sum_n a_n|)^2 lt.double L^(- 1) + max_(1 lt.eq h < L) U^(- 1)
     lr(|sum_n a_(n + h) overline(a_n)|) . $ <eq:differencing>]
  To see this, express the sum as $L^(- 1) sum_n sum_(h = 1)^L a_(n + h)$, apply Cauchy–Schwarz in $n$,
    and expand the square. The outer support has length at most $U + L + 2$,
    the diagonal contributes $O \( L U \)$, and the off-diagonal terms give (4.9).
  We also need the second derivative bound
  #[#set math.equation(numbering: n => "(4.10)")
   $ lr(|sum_(n in J) upright(e) \( g \( n \) \)|) lt.double_A U sqrt(lambda) + lambda^(- 1 \/ 2) + 1 quad
     upright("if") quad lambda lt.eq \| g'' \( x \) \| lt.eq A lambda $ <eq:second-derivative>]
  on an interval $J$ of length at most $U$, for $g in C^2 \( J \)$. Here is an elementary proof.
    For $lambda$ above a fixed positive constant the trivial bound suffices.
    Otherwise put $beta = sqrt(lambda) < 1 \/ 4$. The derivative $g'$ is monotone and traverses a range of length
    $O_A \( U lambda \)$. The portions where $g'$ is within $beta$ of an integer have $O_A \( U lambda + 1 \)$
    components and total length $O_A \( U beta + beta \/ lambda \)$, since $\| g'' \| gt.eq lambda$.
    Their integer points contribute the same bound after adding the number of components.
  On each remaining interval $g'$ is monotone and stays between $q + beta$ and $q + 1 -
    beta$ for some integer $q$. The corresponding sum is $O \( beta^(- 1) \)$.
    Indeed the increments $g \( n + 1 \) - g \( n \)$ are monotone in that same interval, and summation by parts in
  $ upright(e) \( g \( n \) \) =
    frac(upright(e) \( g \( n + 1 \) \) - upright(e) \( g \( n \) \), upright(e) \( g \( n + 1 \) - g \( n \) \) - 1) $
  gives this bound: the reciprocal denominator has supremum and total variation $O \( beta^(- 1) \)$.
    Boundary terms add at most a constant per interval. Summing over the $O_A \( U lambda + 1 \)$ intervals proves
    (4.10).
  Now let $k$ be a nearest integer to $log \| Z \| \/ log U$, and set
  $ Q_B = ceil.l B ceil.r + 1 \, wide r = k - 2 \, wide L = floor.l U^(1 \/ \( 10 k \)) floor.r . $
  There are only finitely many possible orders:
  #[#set math.equation(numbering: n => "(4.11)")
   $ 4 lt.eq k lt.eq Q_B \, wide U^(- 3 \/ 2) lt.eq \| Z \| U^(- k - 1) lt.eq U^(- 1 \/ 2) . $ <eq:derivative-order>]
  Apply (4.9) $r$ times to $a_n = upright(bold(1))_I \( n \) upright(e) \( f \( n \) \)$, where $f \( x \) =
    Z \/ x$, extending the sequence by zero outside $I$. For positive shifts $h_1 \, dots.h \, h_r < L$,
    the last phase is
  $ g \( x \) = Delta_(h_1) dots.h.c Delta_(h_r) f \( x \) \, wide Delta_h f \( x \) = f \( x + h \) - f \( x \) . $
  Its support is the interval on which both $x$ and $x + h_1 + dots.h.c + h_r$ belong to $I$.
    All intermediate points $x + t_1 + dots.h.c + t_r$, $0 lt.eq t_i lt.eq h_i$,
    therefore remain in $\[ U \, 2 U \]$. Empty supports contribute zero.
  The fundamental theorem of calculus gives
  $ g'' \( x \) = integral_0^(h_1) #h(-0.16667em) dots.h.c #h(-0.16667em) integral_0^(h_r)
    f^(\( k \)) \( x + t_1 + dots.h.c + t_r \) thin d t_r dots.h.c d t_1 . $
  Since $f^(\( k \)) \( x \) = \( - 1 \)^k k ! Z x^(- k - 1)$ has constant sign,
  $ frac(k !, 2^(k + 1)) Lambda lt.eq \| g'' \( x \) \| lt.eq k ! Lambda \, wide
    Lambda = \| Z \| U^(- k - 1) product_(i = 1)^r h_i . $
  By (4.11) and the choice of $L$,
  $ U^(- 3 \/ 2) lt.eq Lambda lt.eq U^(- 1 \/ 2 + \( k - 2 \) \/ \( 10 k \)) lt.eq U^(- 2 \/ 5) . $
  Thus (4.10) bounds each last correlation by $O_k \( U^(4 \/ 5) + U^(3 \/ 4) + 1 \) = O_k \( U^(4 \/ 5) \)$.
  For clarity, normalize every correlation by $U$, and let $sigma_j$ be their maximum after $j$ shifts. Then
  $ sigma_(k - 2) lt.double_k U^(- 1 \/ 5) \, wide sigma_j^2 lt.double L^(- 1) + sigma_(j + 1) . $
  Induction, using $L gt.eq U^(1 \/ \( 10 k \)) \/ 2$ for large $U$, yields
  $ sigma_0 lt.double_k U^(- 1 \/ \( 10 k thin 2^(k - 2) \)) . $
  Taking the largest implied constant over $4 lt.eq k lt.eq Q_B$ and, for example,
    $delta_B = \( 10 Q_B 2^(Q_B) \)^(- 1)$ proves the lemma. In particular, although $k$ depends on $Z \, U$,
    the final constants depend only on $B$. ◻
]

#thm([Lemma 4.4.])[
  #emph[For the deterministic list $T_0$ constructed above, every level $0 lt.eq j < d$ with $X = X_j > e^S$,
    and every integer $1 lt.eq ell lt.eq H := floor.l e^(4 eta m) floor.r$, one has
#[#set math.equation(numbering: n => "(4.12)")
 $ 1 / X sum_(X_(j + 1) < u lt.eq X) lr(|frac(1, \| T_0 \|) sum_(t in T_0) upright(e) \( ell C t \/ u \)|)^2 lt.eq
   e^(- 0.01 m) $ <eq:deterministic-mean>]

 for all sufficiently large $S$, uniformly in $C$.]
] <lem:deterministic>

#proof[
  Write $Y = X_(j + 1) = rho X$; then $Y > e^(S - eta m) gt.eq e^(0.9 S)$.
    Expanding the square, the diagonal contributes at most $2^(- m)$ because the $2^m$ subset products are
    distinct. For an off-diagonal pair put $Z = ell C \( t - t' \)$.
    The difference $t - t'$ is a nonzero integer, and (4.3) and (4.6) give
  $ e^(D_C S) lt.eq \| Z \| lt.eq e^(\( 2 D_C + K + 2 \) S) . $
  Split $\( Y \, X \]$ into intersections with dyadic intervals $\[ U \, 2 U \]$.
    We may take $Y \/ 2 lt.eq U lt.eq X$, so for large $S$,
  $ e^(0.8 S) lt.eq U lt.eq e^(D_X S) \, wide U^4 lt.eq \| Z \| lt.eq U^(3 D_C) . $
  Lemma 10, with the fixed value $B = 3 D_C$, bounds the sum over each piece by $O \( U e^(- 0.8 delta_B S) \)$.
    The sum of the dyadic $U$’s is $O \( X \)$. Thus
  $ lr(|sum_(Y < u lt.eq X) upright(e) \( Z \/ u \)|) lt.double X e^(- c S) $
  for an absolute $c > 0$. Averaging over all off-diagonal pairs cancels their number against $\| T_0 \|^2$.
    The left side of (4.12) is consequently at most
  $ 2^(- m) + O \( e^(- c S) \) lt.eq e^(- 0.01 m) $
  eventually, since $S \/ m arrow.r oo$. ◻
]

The deterministic estimate controls the high levels for every permitted $C$.
  We next prove the random estimate for the lower levels and for individual terminal numerators.

=== 4.3 Random products <subsec:random>

For the smaller moduli, two independent products of sampled primes supply the cancellation.
  Their integer values are smaller than a suitable divisor of the modulus,
  so unique factorization controls their residue distributions.

#thm([Lemma 4.5.])[
  #emph[Let $K = 100$, $D_0 = 100000$, and $m = floor.l S \/ log S floor.r$.
    Let $cal(P)$ be a set of primes in $\[ S^K \, 2 S^K \]$ with $P = \| cal(P) \| gt.eq S^(K - 1)$, and sample
$ p_(j \, epsilon.alt) wide \( 1 lt.eq j lt.eq m \, med epsilon.alt in { 0 \, 1 } \) $

 independently and uniformly from $cal(P)$. For $I in { 0 \, 1 }^m$, put $t_I = product_(j = 1)^m p_(j \, I_j)$.
   For every integer $u$ such that
$ D_0 log S lt.eq V := log u lt.eq S \, wide w = min \( m \, V \) \, $

 and every integer $1 lt.eq l lt.eq exp \( 0.005 w \)$, one has
#[#set math.equation(numbering: n => "(4.13)")
 $ bb(E) lr(|2^(- m) sum_(I in { 0 \, 1 }^m) upright(e) \( l t_I \/ u \)|)^2 lt.eq
   exp \( - 0.01 w \) $ <eq:random-second-moment>]

 for all sufficiently large $S$. The onset is absolute and uniform in $u \, l \, cal(P)$.]
] <lem:random>

#proof[
  Expanding the square gives
  $ 4^(- m) sum_(I \, J in { 0 \, 1 }^m) bb(E) thin upright(e) #scale(x: 120%, y: 120%)[\(] l \( t_I - t_J \) \/ u
    #scale(x: 120%, y: 120%)[\)] . $
  For uniformly counted pairs $I \, J$, their Hamming distance $B$ has distribution $"Bin" \( m \, 1 \/ 2 \)$.
    The exponential Markov inequality gives
  $ bb(P) \( B < m \/ 4 \) lt.eq 2^(m \/ 4) bb(E) thin 2^(- B) = 2^(m \/ 4) \( 3 \/ 4 \)^m lt.eq e^(- m \/ 16) . $
  We bound these pairs trivially. Fix any remaining pair, and set
  $ s = ⌊frac(0.75 V, K log S)⌋ . $
  Since $V \/ \( K log S \) gt.eq 1000$, and $V lt.eq S$, we have
  #[#set math.equation(numbering: n => "(4.14)")
   $ frac(0.74 V, K log S) lt.eq s lt.eq frac(0.75 V, K log S) \, wide 2 s lt.eq m \/ 4 $ <eq:random-product-lengths>]
  for sufficiently large $S$.
  Select the first $2 s$ differing coordinates in increasing order,
    and divide them into two sets of $s$ coordinates each. This choice depends only on $I \, J$,
    not on the sampled primes. Expose every labelled prime sample except the $I$-selected sample at these $2
    s$ coordinates. Then $t_J$ is fixed and
  $ t_I = U_0 U_1 U_2 \, $
  where $U_0$ is fixed by the exposure and $U_1 \, U_2$ are independent products of $s$ fresh uniform samples
    each. Equal prime values cause no difficulty: the $I$-selected and $J$-selected variables at a differing
    coordinate are distinct independent samples.
  Write
  $ g = gcd \( l U_0 \, u \) \, wide q = u \/ g . $
  The coefficient $l U_0 \/ u$ reduces to a fraction with denominator $q$.
    We will show that $q$ is usually large enough for distinct integer values of each fresh product to remain
    distinct modulo $q$. Their small point probabilities will then give cancellation by additive-character
    orthogonality.
  We first bound the probability, over the exposed variables, that $q < u^0.9$.
    Since $l lt.eq u^0.005$ and $gcd \( l U_0 \, u \) lt.eq l gcd \( U_0 \, u \)$,
    this event implies $gcd \( U_0 \, u \) > u^0.095$. Call a sample contributing to $U_0$ a hit if its prime
    value divides $u$, and count hits with their sample multiplicities. If their number is $B_0$, then
  $ gcd \( U_0 \, u \) lt.eq product_(upright("hit samples ") p) p lt.eq S^(\( K + 1 \) B_0) . $
  Thus failure requires at least
  $ k_0 = ⌈frac(0.08 V, \( K + 1 \) log S)⌉ $
  hits. At most $S$ primes in the sampling interval divide $u$,
    so each sample has hit probability at most $S \/ P lt.eq S^(- \( K - 2 \))$.
    There are at most $m lt.eq S$ independent samples in $U_0$. A union bound over sets of $k_0$ positions yields
  #[#set math.equation(numbering: n => "(4.15)")
   $ bb(P) \( q < u^0.9 \) lt.eq S^(- \( K - 3 \) k_0) lt.eq exp (- frac(0.08 \( K - 3 \), K + 1) V) lt.eq
     u^(- 0.05) . $ <eq:random-gcd>]
  If $k_0 > m - 2 s$, the event is empty. This argument allows prime powers in $u$ and repeated sampled primes.
  Now fix an exposure with $q gt.eq u^0.9$. Every possible value of either fresh product is at most
  $ \( 2 S^K \)^s lt.eq S^(\( K + 1 \) s) lt.eq u^0.7575 < u^0.8 < q . $
  By unique factorization, an integer can arise as the product of at most $s !$ ordered $s$-tuples of primes.
    Consequently each atom in the distribution of $U_i$, for $i = 1 \, 2$, has probability at most
  $ frac(s !, P^s) lt.eq S^(- \( K - 2 \) s) lt.eq u^(- 0.7252) lt.eq u^(- 0.7) . $
  Reduction modulo $q$ is injective on these integer values.
    The probability vectors $alpha \, beta$ of $U_1 \, U_2$ on $bb(Z) \/ q bb(Z)$ therefore satisfy
  $ parallel alpha parallel_2 \, parallel beta parallel_2 lt.eq u^(- 0.35) . $
  The reduced fraction $l U_0 \/ u = c \/ q$ has $gcd \( c \, q \) = 1$. Complete additive-character orthogonality gives
  $ sum_(x med mod med q) lr(|sum_(y med mod med q) beta_y upright(e) \( c x y \/ q \)|)^2 =
    q sum_(y med mod med q) \| beta_y \|^2 . $
  Indeed the inner sum over $x$ vanishes unless $q divides c \( y - y' \)$, equivalently $y = y'$ modulo $q$.
    This identity holds for composite $q$ as well. Cauchy–Schwarz gives
  $ lr(|sum_(x \, y med mod med q) alpha_x beta_y upright(e) \( c x y \/ q \)|) lt.eq
    sqrt(q) thin parallel alpha parallel_2 parallel beta parallel_2 lt.eq u^(- 0.2) . $
  The factor $upright(e) \( - l t_J \/ u \)$ is fixed under the exposure.
    Averaging this conditional estimate and using (4.15) bounds the contribution of our fixed pair $I \,
    J$ in absolute value by $u^(- 0.05) + u^(- 0.2)$.
  Combining this with the Hamming exception, we obtain
  $ bb(E) lr(|2^(- m) sum_I upright(e) \( l t_I \/ u \)|)^2 lt.eq e^(- m \/ 16) + u^(- 0.05) + u^(- 0.2) lt.eq
    3 e^(- 0.05 w) lt.eq e^(- 0.01 w) . $
  The final inequality is uniform because $min \( m \, D_0 log S \)$ tends to infinity with $S$. ◻
]

=== 4.4 A simultaneous choice of divisors <subsec:selection>

We now choose all random blocks at once. One block will suffice at all intermediate levels outside small
  exceptional sets; the independent blocks together will cover every terminal integer.

#proof[
  The construction already gives the required size of $M$, its power of two, and divisibility of every list entry,
    for every realization of the samples. We prove the two residue properties.
  Put $H = floor.l e^(4 eta m) floor.r$. At a level with $X_j > e^S$,
    Lemma 11 and Markov’s inequality show that the number of integers $u in \( X_(j + 1) \, X_j \]$ for which
  $ lr(|2^(- m) sum_(t in T_0) upright(e) \( l C t \/ u \)|) > e^(- 3 eta m) $
  at some $1 lt.eq l lt.eq H$ is at most
  $ X_j H e^(6 eta m) e^(- 0.01 m) lt.eq X_j e^(- 0.009 m) . $
  Conjugation changes the Fourier sign without changing the absolute value.
    Lemma 9, with scale $m$, therefore gives at least $rho \| T_0 \| \/ 2$ entries with
  $ h_(j \, t) \( u \) < rho u lt.eq X_(j + 1) $
  outside that exceptional set. This holds separately at every such level and requires no probabilistic selection.
  Next suppose $j < d$ and $X_j lt.eq e^S$. Then $X_j > e^m$, and every $u in \( X_(j + 1) \, X_j \]$ satisfies
  $ \( 1 - eta \) m < log u lt.eq S \, wide w = min \( m \, log u \) gt.eq \( 1 - eta \) m . $
  For sufficiently large $S$, these integers satisfy the lower bound in Lemma 12.
    Moreover $4 eta m lt.eq 0.005 w$, so that Lemma applies to all $1 lt.eq l lt.eq H$.
    In block $1$, Markov’s inequality followed by the frequency union bound shows that
  $ & bb(P) (max_(1 lt.eq l lt.eq H) lr(|2^(- m) sum_(t in T_1) upright(e) \( l t \/ u \)|) > e^(- 3 eta m))\
 & wide  lt.eq exp #scale(x: 120%, y: 120%)[\(] \( 10 eta - 0.01 \( 1 - eta \) \) m #scale(x: 120%, y: 120%)[\)] =
   e^(- 0.008999 m) lt.eq e^(- 0.005 m) . $
  Let $B_j$ count integers in this level that fail this Fourier bound.
    Linearity of expectation and another application of Markov give
  $ bb(E) B_j lt.eq X_j e^(- 0.005 m) \, wide bb(P) \( B_j > X_j e^(- 0.001 m) \) lt.eq e^(- 0.004 m) . $
  As $d = O \( log S \)$, with probability $1 - o \( 1 \)$ these bounds hold at every level under consideration.
    No independence between different integers or levels is needed.
    Here $C_j = 1$, so Lemma 9 again gives the required $rho \| T_1 \| \/ 2$ entries outside the exceptional sets.
  Finally fix an integer $S^(D_0) < u lt.eq e^m$. Now $w = log u$, and Lemma 12,
    Markov’s inequality and the union over $1 lt.eq l lt.eq floor.l u^(4 eta) floor.r$ give
  $ & bb(P)
    (max_(1 lt.eq l lt.eq floor.l u^(4 eta) floor.r) lr(|2^(- m) sum_(t in T_i) upright(e) \( l t \/ u \)|) > u^(-
    3 eta))\
 & wide  lt.eq u^(10 eta - 0.01) = u^(- 0.009) lt.eq u^(- 0.005) $
  in each block $i$. On success, Lemma 9, with scale $log u$, supplies a list entry for which
  $ u ceil.l t \/ u ceil.r - t < u^(1 - eta) . $
  The $R = 1000$ blocks are independent for this fixed $u$.
    The probability that every block fails is therefore at most $u^(- 5)$.
    A union bound over all terminal integers shows that
  $ bb(P) \( upright("some terminal integer has no successful block") \) lt.eq sum_(u > S^(D_0)) u^(- 5) = o \( 1 \) . $
  Thus every terminal integer has a suitable divisor, simultaneously, with probability tending to one.
  The sum of this failure probability and the middle-level failure probability is $o \( 1 \)$.
    Hence a realization satisfying both sets of requirements exists. Fix it and the resulting $M$.
    Since $e^(- 0.009 m) lt.eq e^(- 0.001 m)$, the same $c_(*) = 0.001$ is valid at every level.
    This proves both properties for one common $M$, for the fixed $S$ and $C$. ◻
]

== 5 Propagating the exceptional sets <sec:descent>

We now prove Proposition 4. Lemma 8 provides many choices for making the numerator smaller.
  Some of those choices may land at numerators whose expansions are still unknown.
  The divisor moment in Lemma 7 bounds how often this can happen.
  An individual residue may have many possible predecessors;
  the moment estimate controls their combined contribution over a small exceptional set of residues.

#proof[
  Use the absolute constants and levels of Lemma 8. Before choosing $S$, fix
  $ K_d = frac(3 D_X, eta) \, wide D_(*) = 2 D_C + D_M + 1 \, wide r in bb(N) \, quad r gt.eq max { 2 \,
    8 K_d } \, wide alpha = 1 - 1 / r . $
  All subsequent lower bounds on $S$ may depend on these fixed constants.
    In particular, the moment order $r$ is independent of $S$. For sufficiently large $S$,
  #[#set math.equation(numbering: n => "(5.1)")
   $ m gt.eq frac(S, 2 log S) \, wide d = ⌈frac(D_X S - m, eta m)⌉ lt.eq frac(2 D_X, eta) log S + 1 lt.eq
     K_d log S . $ <eq:descent-depth>]
  Fix an integer $C$ in the range of Proposition 4, and choose the common integer $M$ supplied by Lemma 8.
  Every fraction $u \/ \( M C_j \)$ with $1 lt.eq u lt.eq X_j$ is less than one.
    Indeed, if $C_j = C$, then $u lt.eq X_0 = e^(D_X S) < M C$; if $C_j = 1$, then $u lt.eq e^S < M$.
    Moreover $C_d = 1$, since $X_d lt.eq e^m < e^S$. We first produce expansions at this last level,
    and then work backwards.
  ===== 5.1 The last level. <the-last-level.>
  The power of two dividing $M$ is at least $S^(D_0)$. For any integer $1 lt.eq u lt.eq S^(D_0)$,
    write $u$ in binary. Every power $2^k$ that occurs divides $M$, and
  $ 2^k / M = frac(1, M \/ 2^k) . $
  This gives an expansion of $u \/ M$ with at most $1 + D_0 log S \/ log 2$ terms.
  If $S^(D_0) < u lt.eq e^m$, the last part of Lemma 8 gives a divisor $t divides M$ for which
  $ z = ⌈t / u⌉ \, wide h = u z - t \, wide 0 lt.eq h lt.eq u^(1 - eta) . $
  The identity
  #[#set math.equation(numbering: n => "(5.2)")
   $ u / M = frac(1, \( M \/ t \) z) + 1 / z h / M $ <eq:terminal-descent>]
  adds one unit fraction. If $h = 0$, the expansion ends; otherwise an expansion of $h \/
    M$ can be divided by the positive integer $z$. As long as the numerator remains above $S^(D_0)$,
    its logarithm decreases by a factor at most $1 - eta$ at each step. It starts at most $m lt.eq S$, so after at most
  $ 1 + ⌈frac(log S, - log \( 1 - eta \))⌉ $
  steps it has either vanished or entered the binary range.
    Thus an absolute constant $B_0$ bounds the length of every terminal expansion by $B_0 log S$.
    All denominators are integers. Since every term is positive and the total is less than one,
    every denominator is at least two.
  ===== 5.2 Working backwards. <working-backwards.>
  Set
  $ G_d = { 1 \, dots.h \, floor.l X_d floor.r } . $
  At a level $j < d$, write the list prescribed by Lemma 8 as $\( t_(j \, i) \)_(i in I_j)$:
    it is the deterministic list when $X_j > e^S$, and the first random list otherwise.
    Its entries may coincide; their indices are always retained. Having defined $G_(j + 1)$, let
  #[#set math.equation(numbering: n => "(5.3)")
   $ G_j = G_(j + 1) med union med { u in bb(N) : med & 1 lt.eq u lt.eq X_j \,\
 & h_(j \, t_(j \, i)) \( u \) in G_(j + 1) union { 0 } upright(" for some ") i in I_j
   #scale(x: 120%, y: 120%)[}] . $ <eq:good-backwards>]
  These sets have the asserted expansions. For membership inherited directly from $G_(j + 1)$,
    divide the known expansion by the integer $C_j \/ C_(j + 1)$. For membership obtained from a residue, put
  $ z = ⌈frac(C_j t_(j \, i), u)⌉ \, wide h = u z - C_j t_(j \, i) . $
  Then
  #[#set math.equation(numbering: n => "(5.4)")
   $ frac(u, M C_j) = frac(1, \( M \/ t_(j \, i) \) z) + frac(1, z C_j \/ C_(j + 1)) frac(h, M C_(j + 1)) .
     $ <eq:rescaled-descent>]
  Both $M \/ t_(j \, i)$ and $z C_j \/ C_(j + 1)$ are positive integers.
    This includes the possible transition from $C_j = C$ to $C_(j + 1) = 1$,
    where the second scaling factor is $z C$. If $h = 0$, the second term is absent.
    Otherwise it uses the known expansion for $h in G_(j + 1)$.
    Consequently every member of $G_j$ has an expansion of length at most
  #[#set math.equation(numbering: n => "(5.5)")
   $ B_0 log S + d - j . $ <eq:descent-length>]
  It remains to prove that almost all integers up to $X_0$ belong to $G_0$.
    We have built expansions whenever a residue reaches a previously treated numerator;
    the following count controls all other numerators.
  ===== 5.3 Counting unsuccessful numerators. <counting-unsuccessful-numerators.>
  Define
  $ H_j = { 1 \, dots.h \, floor.l X_j floor.r } \\ G_j \, wide delta_j = frac(\| H_j \|, X_j) . $
  Thus $0 lt.eq delta_j lt.eq 1$ and $delta_d = 0$. Fix $j < d$, and abbreviate $X = X_j$, $Y = X_(j + 1) =
    rho X$. The inclusion $G_(j + 1) subset.eq G_j$ gives
  $ \| H_j ∩ \[ 1 \, Y \] \| lt.eq \| H_(j + 1) \| . $
  Apart from at most $X e^(- c_(*) m)$ exceptional integers,
    every $u in H_j ∩ \( Y \, X \]$ has at least $rho \| I_j \| \/
    2$ indices $i$ with $h_(j \, t_(j \, i)) \( u \) lt.eq Y$. Each such residue lies in $H_(j + 1)$:
    a residue in $G_(j + 1) union { 0 }$ would place $u$ in $G_j$.
  For a fixed pair $\( h \, i \)$, every predecessor $u$ satisfies
  $ u divides C_j t_(j \, i) + h \, wide 1 lt.eq u lt.eq X . $
  There are at most $d_X \( C_j t_(j \, i) + h \)$ such predecessors.
    Counting pairs with their list indices therefore yields
  #[#set math.equation(numbering: n => "(5.6)")
   $ \| H_j \| lt.eq X e^(- c_(*) m) + \| H_(j + 1) \| + frac(2, rho \| I_j \|) sum_(i in I_j) med
     sum_(h in H_(j + 1)) d_X \( C_j t_(j \, i) + h \) . $ <eq:bad-pair-count>]
  Repeated values of $t_(j \, i)$ create repeated summands on both sides of this count and require no adjustment.
    Figure 1 shows why the index must be retained in this double count.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0, 1.15), [#text(size: 9pt)[Nonexceptional bad numerators#linebreak()$u in H_j inter (Y,X]$]])
  content((6.4, 1.15), [#text(size: 9pt)[Indexed targets#linebreak()$(h,i) in H_(j+1) times I_j$]])
  circle((0, 0.25), radius: 0.09978, fill: rgb("#00008c"), stroke: none)
  content((-0.03528, 0.25), [$u_1$], anchor: "east")
  circle((0, -0.6), radius: 0.09978, fill: rgb("#00008c"), stroke: none)
  content((-0.03528, -0.6), [$u_2$], anchor: "east")
  content((0, -1.25), [#text(size: 9pt)[$dots.v$]])
  circle((0, -2), radius: 0.09978, fill: rgb("#00008c"), stroke: none)
  content((-0.03528, -2), [$u_a$], anchor: "east")
  circle((6.4, 0.25), radius: 0.09978, fill: rgb("#00008c"), stroke: none)
  content((6.435, 0.25), [$(h_1,i_1)$], anchor: "west")
  circle((6.4, -0.6), radius: 0.09978, fill: rgb("#00008c"), stroke: none)
  content((6.435, -0.6), [$(h_2,i_2)$], anchor: "west")
  content((6.4, -1.25), [#text(size: 9pt)[$dots.v$]])
  circle((6.4, -2), radius: 0.09978, fill: rgb("#00008c"), stroke: none)
  content((6.435, -2), [$(h_b,i_b)$], anchor: "west")
  line((0, 0.25), (6.4, 0.25), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((6.4, 0.25), (0, 0.25), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0.25), (6.4, -0.6), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((6.4, -0.6), (0, -0.6), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((0, -0.6), (6.4, 0.25), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((6.4, 0.25), (0, -0.6), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((0, -0.6), (6.4, -2), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((6.4, -2), (0, -2), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((0, -2), (6.4, -0.6), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((6.4, -0.6), (0, -2), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((0, -2), (6.4, -2), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((3.2, -0.85), [#box(inset: 0.3333em, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$h=h_(j,t_(j,i))(u)$#linebreak()$u divides C_"jt"_(j,i)+h$]]])])
  content((0, -2.85), [#text(size: 9pt)[Degree at least#linebreak()$rho |I_j|"/"2$]])
  content((6.4, -2.85), [#text(size: 9pt)[Degree at most#linebreak()$d_X(C_"jt"_(j,i)+h)$]])
})],
    caption: [Figure 1: Schematic of the indexed predecessor count. Summing the right degrees and dividing by the left-degree lower bound gives the last term in (5.6). The Fourier-exception term $X e^(- c_(*) m)$ and the inherited term $\| H_(j + 1) \|$ are counted separately. Equal list values retain different indices. The drawn graph does not specify numerical degrees. ],
  ) <fig:predecessors>
  We check the hypotheses of Lemma 7 before applying it. Since $j < d$, one has
  $ frac(S, 2 log S) lt.eq m < log X lt.eq D_X S lt.eq D_(*) S . $
  Also
  $ Y = X e^(- eta m) gt.eq X^(1 - eta) gt.eq sqrt(X) \, wide Y lt.eq X . $
  Finally, each shift $N = C_j t_(j \, i)$ is a positive integer and satisfies
  $ N lt.eq C M lt.eq e^(\( 2 D_C + D_M \) S) < e^(D_(*) S) . $
  Thus Lemma 7, with the fixed parameters $D_(*) \, r$, applies uniformly at every level and to every list entry.
    Hölder’s inequality gives
  #[#set math.equation(numbering: n => "(5.7)")
   $ sum_(h in H_(j + 1)) d_X \( N + h \) & lt.eq \| H_(j + 1) \|^alpha
     (sum_(1 lt.eq h lt.eq Y) d_X \( N + h \)^r)^(1 \/ r)\
 & lt.eq Y thin e^(S^(1 \/ 4) \/ r) delta_(j + 1)^alpha . $ <eq:descent-holder>]
  This also holds when $H_(j + 1)$ is empty. Substitution in (5.6), followed by division by $X$, uses $Y =
    rho X$ to cancel the factor $1 \/ rho$:
  $ delta_j lt.eq e^(- c_(*) m) + rho delta_(j + 1) + 2 e^(S^(1 \/ 4) \/ r) delta_(j + 1)^alpha . $
  Since $delta_(j + 1) lt.eq delta_(j + 1)^alpha$, for sufficiently large $S$ we obtain the uniform recurrence
  #[#set math.equation(numbering: n => "(5.8)")
   $ delta_j lt.eq epsilon.alt + A delta_(j + 1)^alpha \, wide epsilon.alt = e^(- c_(*) m) \, wide A =
     e^(2 S^(1 \/ 4)) . $ <eq:density-recurrence>]
  ===== 5.4 Iterating the recurrence. <iterating-the-recurrence.>
  Our fixed choice of $r$ ensures
  #[#set math.equation(numbering: n => "(5.9)")
   $ alpha^d gt.eq e^(- 2 d \/ r) gt.eq S^(- 2 K_d \/ r) gt.eq S^(- 1 \/ 4) \, $ <eq:alpha-depth>]
  where we used $- log \( 1 - 1 \/ r \) lt.eq 2 \/ r$ and (5.1).
    For nonnegative $a \, b$, the inequality $\( a + b \)^alpha lt.eq a^alpha +
    b^alpha$ permits us to unroll (5.8) from $delta_d = 0$:
  #[#set math.equation(numbering: n => "(5.10)")
   $ delta_0 lt.eq sum_(i = 0)^(d - 1) A^(\( 1 - alpha^i \) \/ \( 1 - alpha \)) epsilon.alt^(alpha^i) lt.eq
     d exp #h(-0.16667em) (2 r S^(1 \/ 4) - c_(*) m S^(- 1 \/ 4)) . $ <eq:density-unrolled>]
  Indeed, the exponent of $A$ is at most $r$, and $alpha^i gt.eq alpha^d gt.eq S^(- 1 \/ 4)$.
    The right-hand side tends to zero: the negative term has size at least $c_(*) S^(3 \/ 4) \/ \( 2 log S \)$,
    which dominates the fixed multiple $2 r S^(1 \/ 4)$ and $log d$.
  For all sufficiently large $S$, we therefore have
  $ \| H_0 \| lt.eq X_0 \/ 8 . $
  Take $G = G_0$ and $X = X_0$. By (5.1) and (5.5), every $u in
    G$ has an expansion of $u \/ \( M C \)$ with at most $\( B_0 + K_d \) log S$ terms.
    The size bounds on $M$ come from Lemma 8. Every estimate above is uniform in the allowed integer $C$,
    and all thresholds depend only on fixed absolute constants.
    Choosing $L = B_0 + K_d$ and then one sufficiently large absolute $S_0$ proves Proposition 4. ◻
]

The proposition supplies short expansions on one common dense set of numerators.
  Section 2 transfers this density statement to every original fraction by writing a suitably scaled numerator as
  the sum of two members of that set.

== 6 Counting representations of one <sec:counting>

We prove Corollary 2 using the uniform upper bound in Theorem 1,
  together with the prime number theorem and elementary identities.
  Divisor-rich denominators and divisor-indexed splitting are also used by Konyagin and Elsholtz
  #cite(label("Konyagin2014")) #cite(label("Elsholtz2016")).
  The first step is to obtain a short distinct expansion of one with a denominator having many divisors.
  Lemma 5 concerns totals below one; at total one we need a different repetition-removal argument,
  preserving an odd divisor of a denominator.

#thm([Lemma 6.1.])[
  #emph[Let $Q > 1$ be odd. Suppose that a finite list of positive integers $m_1 \, dots.h \,
    m_t$ satisfies $sum_(i = 1)^t 1 \/ m_i = 1$ and contains a multiple of $Q$.
    Then $1$ has a representation by at most $t$ distinct positive unit fractions,
    still with a denominator divisible by $Q$.]
] <lem:marked-cleanup>

#proof[
  Whenever a denominator $m$ occurs twice, replace those two terms by
  $ 2 / m = frac(1, m \/ 2) quad \( m upright(" even") \) \, wide 2 / m = frac(1, \( m + 1 \) \/ 2) +
    frac(1, m \( m + 1 \) \/ 2) quad \( m upright(" odd") \) . $
  The sum stays equal to one and the length does not increase. There remains a denominator divisible by $Q$:
    if no such denominator is removed it persists, while if $Q divides m$,
    the even replacement $m \/ 2$ is a multiple of $Q$ because $Q$ is odd,
    and the larger odd replacement is a multiple of $m$.
  This invariant excludes a denominator one, since that would force the singleton list $\( 1 \)$.
    It also excludes a repeated denominator two, since two halves exhaust the sum and neither denominator is
    divisible by $Q$. Thus an odd repeated denominator is at least three.
    In an odd replacement the smaller new denominator is strictly below $m$ and the larger is strictly above $m$.
    The sorted denominator tuple therefore strictly decreases lexicographically:
    all entries below $\( m + 1 \) \/ 2$ are unchanged, and one extra copy of $\( m + 1 \) \/ 2$ is inserted.
    At a fixed length such a descent in positive integer tuples terminates.
    Indeed, the first coordinate can decrease only finitely often,
    and after it stabilizes the same argument applies successively to the other coordinates.
    Even replacements strictly reduce length, so only finitely many occur.
    The procedure consequently terminates with distinct denominators and preserves the required multiple of $Q$. ◻
]

#proof[
  #emph[A short initial expansion.] Let $r$ be a sufficiently large integer and let $Q$ be the product of the
    first $r$ odd primes. The prime number theorem, already used in Section 4, gives
  $ log Q = O \( r log r \) \, wide log log Q = O \( log r \) . $
  Apply Theorem 1 to $\( Q - 1 \) \/ Q$ and append $1 \/ Q$.
    Lemma 13 produces a distinct expansion of one whose denominator set $S$ has size $s =
    O \( log r \)$ and contains a multiple $n$ of $Q$. Fix this one set $S$ and this one $n$.
    Writing $tau \( n \)$ for the number of positive divisors of $n$, we have $tau \( n \) gt.eq 2^r$.
  #emph[Branching over divisors.] For every positive proper divisor $d$ of $n$, the identity
  #[#set math.equation(numbering: n => "(6.1)")
   $ 1 / n = frac(1, n + d) + frac(1, n + n^2 \/ d) $ <eq:divisor-split>]
  gives two distinct integer denominators, with
  $ n < n + d < 2 n < n + n^2 \/ d . $
  For each unchanged denominator in $S \\ { n }$, at most one choice of $d$ makes it equal to $n + d$,
    and at most one makes it equal to $n + n^2 \/ d$. Thus at least
  $ tau \( n \) - 1 - 2 \( s - 1 \) gt.eq 2^r - 2 s + 1 $
  choices give distinct-denominator expansions of one, all of the same length $ell = s + 1$.
    They give different expansions: from any resulting denominator set, remove the fixed set $S \\ { n }$;
    the smaller of the two remaining denominators is $n + d$, which recovers $d$.
    Sorting each set therefore gives a different tuple counted by $F \( ell \)$.
  #emph[Every sufficiently large length.] For any distinct expansion of one with at least two terms,
    its largest denominator $v$ exceeds one. Replace $v$ by $v + 1$ and $v \( v + 1 \)$, using
  #[#set math.equation(numbering: n => "(6.2)")
   $ 1 / v = frac(1, v + 1) + frac(1, v \( v + 1 \)) . $ <eq:padding-split>]
  These are the two largest denominators of the new expansion. The operation is injective:
    delete those two denominators and reinsert the second largest minus one.
    Iterating a fixed number of times is therefore injective.
    Our initial set contains a multiple of $Q > 1$, so it is not the singleton ${ 1 }$;
    the operation applies to all the expansions just constructed.
  Choose an absolute constant $B gt.eq 1$ such that $ell lt.eq B log r$ for all sufficiently large $r$.
    For each sufficiently large integer $k$, take $r = floor.l exp \( k \/ \( 2 B \) \) floor.r$.
    Then $ell lt.eq k$, and applying (6.2) exactly $k - ell$ times to each of our common-length expansions gives
  $ F \( k \) gt.eq 2^r - 2 s + 1 gt.eq 2^(r - 1) . $
  Since $r gt.eq 1 / 2 exp \( k \/ \( 2 B \) \)$ for large $k$, this proves $log log F \( k \) gt.eq
    k \/ \( 2 B \) + O \( 1 \)$, hence the desired lower bound for every sufficiently large integer $k$.
  #emph[The upper bound.] Fix a tuple counted by $F \( k \)$ and put $P_0 = 1$ and $P_i = n_1 dots.h.c n_i$.
    Before the $i$th term, the positive remainder
  $ R_i = 1 - sum_(j < i) 1 / n_j = sum_(j = i)^k 1 / n_j $
  is a rational number with a positive integer numerator over $P_(i - 1)$. Ordering therefore gives
  $ 1 / P_(i - 1) lt.eq R_i lt.eq k / n_i \, wide n_i lt.eq k P_(i - 1) \, wide P_i lt.eq k P_(i - 1)^2 . $
  Inductively $P_i lt.eq k^(2^i - 1)$ and $n_i lt.eq k^(2^(i - 1))$.
    Counting all integer choices in this larger box shows that $F \( k \)$ is finite and
  $ F \( k \) lt.eq product_(i = 1)^k k^(2^(i - 1)) = k^(2^k - 1) . $
  Together with the lower bound, this yields $log log F \( k \) lt.eq k log 2 + log log k =
    O \( k \)$ for sufficiently large $k$, as required. ◻
]

== 7 Preserving a prescribed denominator <sec:prescribed>

Membership in $D_k$ requires the exact denominator $m$. Lemma 13, used for counting,
  preserves only a multiple of a specified odd integer, so it does not ensure that the term $1 \/ m$ survives.
  We instead reserve $1 \/ m$ and use a greedy construction that skips denominator $m$.
  It produces a distinct prefix and makes the remaining sum smaller than every reserved reciprocal.
  Any positive expansion of this remainder then avoids both the marker and the prefix denominators.

We use this prefix twice: the uniform theorem first gives a short tail,
  and a direct construction later gives the numerical bound in Corollary 3.
  Keeping the remainder unreduced retains the divisors needed for that direct construction.
  In either case, a separate padding argument will retain $m$ at every larger length.

#thm([Lemma 7.1.])[
  (A greedy prefix avoiding one denominator).  #emph[Let $m gt.eq 4$ and $T gt.eq 2 m^2$ be integers.
    There are integers $2 lt.eq n_1 < dots.h.c < n_j$, none equal to $m$, and integers $q > 0$ and $0 lt.eq
    R < 2 m$ such that
$ 1 = 1 / m + sum_(i = 1)^j 1 / n_i + R / q \, wide q = m product_(i = 1)^j n_i \, wide j < 3 + log_2 log_2 T . $

 Writing $q_0 = m$ and $q_i = m product_(h = 1)^i n_h$ for $1 lt.eq i lt.eq j$, we have $n_i lt.eq q_(i - 1) +
   1$ for every $1 lt.eq i lt.eq j$. If $R > 0$, then
$ q gt.eq T \, wide R / q < frac(2 m, T) lt.eq 1 / m \, wide R / q < 1 / n_i quad \( 1 lt.eq i lt.eq j \) . $

 In either case $q < T^2$.]
] <lem:marked-greedy-prefix>

#proof[
  Start with $\( R_0 \, q_0 \) = \( m - 1 \, m \)$ and $x_0 = R_0 \/ q_0$. Whenever $R_i > 0$ and $q_i < T$, set
  $ a = ⌈q_i / R_i⌉ \, wide n_(i + 1) = cases(delim: "{", a \, & a eq.not m \,, m + 1 \, & a = m \,)
    wide \( R_(i + 1) \, q_(i + 1) \) = \( n_(i + 1) R_i - q_i \, n_(i + 1) q_i \) . $
  Do not cancel common factors in this pair. Thus $x_(i + 1) = R_(i + 1) \/ q_(i + 1) = x_i - 1 \/ n_(i + 1)$.
  For an ordinary step, writing $n = n_(i + 1) = a$ gives
  $ 1 / n lt.eq x_i < frac(1, n - 1) \, wide 0 lt.eq R_(i + 1) < R_i \, wide 0 lt.eq
    x_(i + 1) < frac(1, n \( n - 1 \)) lt.eq 1 / n . $
  Moreover $n < 1 \/ x_i + 1$, so
  $ x_(i + 1) < x_i - frac(x_i, 1 + x_i) = frac(x_i^2, 1 + x_i) < x_i^2 . $
  In the exceptional step $a = m$, we have $\( m - 1 \) R_i < q_i lt.eq m R_i$. Consequently
  $ 0 < R_i lt.eq R_(i + 1) < 2 R_i \, wide 0 < x_(i + 1) < frac(2, \( m - 1 \) \( m + 1 \)) < frac(1, m + 1) \, $
  where the last inequality uses $m gt.eq 4$. Every step therefore leaves a remainder smaller than the term just
    subtracted. The next denominator, if there is one, is strictly larger.
    After the exceptional step all later denominators exceed $m + 1$, so that step can occur at most once.
    Before it, $R_i lt.eq m - 1$; after it, the numerator is less than $2 \( m - 1 \)$ and decreases at every
    subsequent step. Thus $0 lt.eq R_i < 2 m$ throughout. Since $R_i gt.eq 1$ in an active step, $a lt.eq
    q_i$ and hence $n_(i + 1) lt.eq q_i + 1$.
  All selected denominators are at least $2$, so $q_i$ at least doubles at each step.
    The procedure thus stops after finitely many steps. Its first denominator is $2$,
    and $x_1 = \( m - 2 \) \/ \( 2 m \) < 1 \/ 2$. All later steps square the upper bound for the remainder,
    apart from at most one step that still decreases it. Therefore, whenever $i gt.eq 2$ and the remainder is positive,
  $ x_i lt.eq 2^(- 2^(i - 2)) \, wide q_i gt.eq 1 / x_i gt.eq 2^(2^(i - 2)) . $
  If the final step has index $j gt.eq 3$, its preceding state is active, and hence
  $ 2^(2^(j - 3)) lt.eq q_(j - 1) < T . $
  This gives the asserted bound for $j$; it is immediate when $j lt.eq 2$.
    The same preceding state satisfies $q_j lt.eq q_(j - 1) \( q_(j - 1) + 1 \) < T^2$, since $T$ is an integer.
  The displayed decomposition and product formula follow by telescoping.
    If $R_j = 0$, the decomposition is complete. Otherwise the stopping rule gives $q_j gt.eq T$ and $R_j < 2 m$,
    whence $R_j \/ q_j < 2 m \/ T lt.eq 1 \/ m$. At each earlier step the new remainder was smaller than $1 \/
    n_i$, and subsequent steps only decrease it. This proves all the claimed strict inequalities. ◻
]

To see directly how the uniform theorem supplies a prescribed denominator, take $T = 2 m^2$.
  The lemma gives $j = O \( log log m \)$ and either a complete marked expansion or a positive remainder $R \/ q$ with

$ 1 lt.eq R < q \, wide 2 m^2 lt.eq q < 4 m^4 . $

For sufficiently large $m$, the uniform upper bound in Theorem 1 applies to $R \/ q$,
  without requiring it to be reduced. It supplies a distinct expansion with $O \( log log q \) =
  O \( log log m \)$ terms. Each reciprocal in this tail is at most its total $R \/ q$,
  which is strictly below $1 \/ m$ and every $1 \/ n_i$. The tail therefore avoids the marker and all prefix
  denominators. Together these terms give a distinct expansion of $1$ containing $1 \/ m$,
  of length $O \( log log m \)$.

The same construction also supplies the finite exceptional values of $m$, independently of the cutoff $T$.
  For any fixed $m gt.eq 4$, omit the condition $q_i < T$ and continue until the remainder is zero.
  The nonnegative integer $R_i$ decreases strictly at every ordinary step,
  and there is at most one exceptional step. The process therefore terminates and gives a distinct expansion of
  $1$ containing $1 \/ m$. For $m = 2 \, 3$, use $1 = 1 \/ 2 + 1 \/ 3 + 1 \/ 6$.

The padding injection in Section 6 may remove the denominator we wish to preserve.
  The following lemma supplies the different property needed here:
  it increases the length and retains any one prescribed denominator.

#thm([Lemma 7.2.])[
  (Preserving a prescribed denominator while padding).  #emph[Let $r gt.eq 3$ be an integer, and suppose that
$ 1 = sum_(i = 1)^r 1 / n_i \, wide 1 lt.eq n_1 < dots.h.c < n_r \, $

 where the denominators are integers. For every $m in { n_1 \, dots.h \,
   n_r }$ there is a representation of $1$ by exactly $r + 1$ distinct positive unit fractions that still contains
   the exact denominator $m$. Consequently $D_r subset.eq D_(r + 1)$.]
] <lem:exact-marker-padding>

#proof[
  This is the padding lemma of van Doorn and Tang #cite(label("vanDoornTang2026")) Lemma 2.1; we include a proof.
    Every denominator is at least two, since a term with denominator one would already exhaust the sum. The identity
  $ 1 / b = frac(1, b + 1) + frac(1, b \( b + 1 \)) $
  replaces one term by two with distinct denominators larger than $b$.
    If $m eq.not n_r$, apply it to $n_r$; the new denominators exceed all the unchanged ones, and $m$ remains.
  Suppose that $m = v = n_r$, and let $s = n_(r - 1)$. The same split of $s$ works unless $v = s + 1$ or $v =
    s \( s + 1 \)$, since every other unchanged denominator is smaller than $s$.
    In either exceptional case, if $s = a b$ with integers $a \, b gt.eq 2$, use instead
  $ 1 / s = frac(1, s + a) + frac(1, b \( s + a \)) . $
  The inequalities
  $ s + 1 < s + a < b \( s + a \) < s \( s + 1 \) $
  show that both new denominators avoid either exceptional value of $v$ and all the unchanged denominators below $s$.
  Finally, neither exceptional case can occur when $s = p$ is prime.
    There are at least three original terms, so $p > n_(r - 2) gt.eq 2$ and in particular $p$ is odd.
    All denominators other than $p$ and $v$ are below $p$; write the sum of their reciprocals as $A \/ B$ with $p
    divides.not B$. The two exceptional choices give respectively
  $ 1 - A / B = 1 / p + frac(1, p + 1) = frac(2 p + 1, p \( p + 1 \)) \, wide upright("or") wide 1 - A / B = 1 /
    p + frac(1, p \( p + 1 \)) = frac(p + 2, p \( p + 1 \)) . $
  After clearing denominators and reducing modulo $p$, these equations give respectively $0 equiv
    B med \( mod med p \)$ and $0 equiv 2 B med \( mod med p \)$, both impossible.
    Thus in every valid case an unmarked term can be replaced by two distinct terms,
    preserving $m$ and increasing the length by exactly one. ◻
]

== 8 A quantitative prescribed-denominator bound <sec:prescribed-quantitative>

The uniform theorem gives the short marked expansion above with an unspecified absolute length constant.
  We now prove the following numerical estimate by constructing the tail directly.

#thm([Proposition 8.1.])[
  #emph[For every $epsilon > 0$ there is an integer $m_epsilon$ such that every integer $m gt.eq
    m_epsilon$ occurs as an exact denominator in a representation of $1$ by distinct positive unit fractions with
    at most
$ (frac(257, log 2) + epsilon) log log m $

 terms.]
] <prop:marked-length>

The construction has two ingredients. A common integer $K_m$ supplies short representations of small integers by
  positive rationals whose numerators divide $K_m$. The unreduced denominator of the greedy remainder has divisors
  at every multiplicative scale. Combining these properties gives a short expansion of the tail:
  divisors of the greedy denominator control how many pieces are needed,
  and the rational representations supplied by $K_m$ bound the number of unit fractions used for each piece.

=== 8.1 A common supply of rational divisors <a-common-supply-of-rational-divisors>

We construct a moderately sized integer whose divisors, after division by positive integers,
  represent every integer in a prescribed initial interval with a bounded number of summands.
  The denominators of these rational summands need not agree.
  This freedom lets us first represent a positive multiple of a prime and then divide by its integer multiplier.

#thm([Lemma 8.2.])[
  #emph[For every sufficiently large integer $m$, put
$ L = log log m \, wide Y = m^4 \, wide ell \( v \) = ⌈frac(4 log v, log 2)⌉ quad \( v gt.eq 2 \) . $

 Let $P \( v \)$ be the product of the first $ell \( v \)$ primes, and define
$ K_m = P \( Y \)^2 thin floor.l L floor.r ! . $

 Then $K_m > m$ and
#[#set math.equation(numbering: n => "(8.1)")
 $ log K_m lt.eq (frac(32, log 2) + o \( 1 \)) log m log log m wide \( m arrow.r oo \) . $ <eq:supply-size>]

 Moreover, every integer $1 lt.eq s lt.eq Y$ has a representation
#[#set math.equation(numbering: n => "(8.2)")
 $ s = sum_(i = 1)^h e_i / t_i \, wide h lt.eq 16 \, quad e_i divides K_m \, quad e_i \,
   t_i in bb(Z)_(> 0) . $ <eq:rational-supply>]

 Repeated summands are allowed.]
] <lem:rational-divisor-supply>

#proof[
  The prime number theorem #cite(label("Selberg1949")) p. 305, (1.1) gives
  $ log P \( v \) = \( 1 + o \( 1 \) \) ell \( v \) log ell \( v \) lt.double log v log log v . $
  Since $ell \( Y \) = 16 log m \/ log 2 + O \( 1 \)$, and $log \( floor.l L floor.r ! \) = O \( L log L \)$,
    this proves (8.1). Also $P \( Y \) gt.eq 2^(ell \( Y \)) gt.eq Y^4$, so $K_m > m$ for large $m$.
  We next prove an assertion whose threshold is independent of $m$.
    Fix a sufficiently large odd integer $u$, and let $A$ be the set of positive divisors of $P \( u \)$.
    Write $N = \| A \| = 2^(ell \( u \)) gt.eq u^4$. We estimate exceptional primes by counting congruent pairs,
    the mechanism underlying Gallagher’s larger sieve #cite(label("Gallagher1971")).
    The coarse count below suffices. For each prime $p lt.eq u$, let $A_p$ be the image of $A$ in $bb(F)_p$.
    Call $p$ exceptional when $\| A_p \| lt.eq p^(3 \/ 4)$. If $c_a$ is the number of members of $A$ in residue
    class $a$, then Cauchy–Schwarz shows that the number of ordered pairs of distinct members of $A$ congruent
    modulo an exceptional prime is at least
  $ sum_(a in bb(F)_p) c_a^2 - N gt.eq frac(N^2, \| A_p \|) - N gt.eq frac(N^2, 2 u^(3 \/ 4)) . $
  For any two distinct members $a \, b in A$, the nonzero integer $\| a -
    b \| < P \( u \)$ has at most $log P \( u \) \/ log 2$ distinct prime divisors.
    Counting the same pairs prime by prime therefore bounds the number $B \( u \)$ of exceptional primes by
  #[#set math.equation(numbering: n => "(8.3)")
   $ B \( u \) lt.eq frac(2 u^(3 \/ 4) log P \( u \), log 2) lt.double u^(3 \/ 4) log u log log u .
     $ <eq:supply-exceptional>]
  We use the quantitative form of Vinogradov’s three-prime theorem:
    there is an absolute $c > 0$ such that every sufficiently large odd integer $u$ has at least $c
    u^2 \/ \( log u \)^3$ ordered representations as a sum of three primes;
    see the statement in #cite(label("Kumchev1997")) (1)–(2) and the exposition in
    #cite(label("KumchevTolev2005")) Theorem 1 and Section 3.1.
    To make the uniformity in odd $u$ explicit, its singular series is
  $ frak(S) \( u \) = product_(p divides u) (1 - frac(1, \( p - 1 \)^2)) product_(p divides.not u)
    (1 + frac(1, \( p - 1 \)^3)) . $
  For odd $u$ its factor at $2$ is $2$, and
  $ frak(S) \( u \) gt.eq 2 product_(p > 2) (1 - frac(1, \( p - 1 \)^2)) > 0 . $
  The infinite product is positive because the sum of the subtracted quantities converges.
    Thus the asymptotic formula supplies an absolute lower bound with an absolute threshold,
    with no dependence on the factorization of $u$.
  At most $3 u B \( u \)$ ordered prime triples summing to $u$ contain an exceptional prime:
    choose its position, its value, and one further entry; the last entry is then fixed. By (8.3),
  $ 3 u B \( u \) lt.double u^(7 \/ 4) log u log log u = o (frac(u^2, \( log u \)^3)) . $
  Consequently every sufficiently large odd $u$ is the sum of three primes that are not exceptional for this same
    set $A$.
  It remains to represent each such prime using divisors of $P \( u \)^2$.
    Fix one of them, say $p$, and put $H = A_p$ and $h = \| H \| > p^(3 \/ 4)$.
    Let $U$ be the product of two independent uniformly chosen members of $H$, and write $upright(e)_p \( z \) =
    exp \( 2 pi i z \/ p \)$. The following classical bilinear estimate is recorded in
    #cite(label("GlibichukKonyagin2007")) Proposition 1.1; we give its short proof and the five-product
    consequence needed here. For every nonzero $r in bb(F)_p$, orthogonality and Cauchy–Schwarz give
  $ lr(|sum_(a \, b in H) upright(e)_p \( r a b \)|)^2 & lt.eq
    h sum_(a in bb(F)_p) lr(|sum_(b in H) upright(e)_p \( r a b \)|)^2\
 & = p h^2 . $
  After division by $h^4$, this says
  $ lr(|bb(E) thin upright(e)_p \( r U \)|) lt.eq sqrt(p) / h < p^(- 1 \/ 4) . $
  For five independent copies $U_1 \, dots.h \, U_5$, Fourier inversion now yields
  $ Pr \( U_1 + dots.h.c + U_5 = 0 \) & = 1 / p (1 + sum_(r eq.not 0) \( bb(E) thin upright(e)_p \( r U \) \)^5)\
 & gt.eq frac(1 - \( p - 1 \) p^(- 5 \/ 4), p) > 0 . $
  Here the lower bound follows by bounding the absolute value of the sum of the nonzero Fourier coefficients.
  Choose pairs of residues witnessing this positive probability and lift each residue to any positive member of
    $A$ representing it. The five integer products $e_1 \, dots.h \, e_5$ are positive divisors of $P \( u \)^2$,
    and their sum is divisible by $p$. Hence
  $ t = frac(e_1 + dots.h.c + e_5, p) in bb(Z)_(> 0) \, wide p = sum_(i = 1)^5 e_i / t . $
  The three chosen primes thus represent $u$ in fifteen summands of the required kind.
  For a sufficiently large integer $s$, use $u = s$ if $s$ is odd and $u = s - 1$ otherwise.
    In the even case append the summand $1 = 1 \/ 1$. This uses at most sixteen summands.
    If $s lt.eq Y$, monotonicity of $ell$ implies $P \( u \) divides P \( Y \)$,
    so every numerator constructed above divides $K_m$.
  Finally, all preceding thresholds concern $s$ alone and are absolute. Choose an integer $S_0$ above them.
    For all sufficiently large $m$ we have $floor.l L floor.r gt.eq S_0$.
    Each remaining integer $1 lt.eq s lt.eq S_0$ then divides $floor.l L floor.r !$ and hence $K_m$,
    so it has the one-summand representation $s = s \/ 1$. This proves the assertion simultaneously for every $1
    lt.eq s lt.eq Y$. ◻
]

=== 8.2 Grouping the remaining numerator <grouping-the-remaining-numerator>

The denominator retained by the greedy procedure has divisors at every multiplicative scale.
  We first record this property, then use it to reduce the remaining numerator to a short list of integers within
  the range of the rational-divisor supply.

#thm([Lemma 8.3.])[
  #emph[Let $m gt.eq 2$ be an integer. Suppose that $q$ is obtained from $m$ by a finite sequence of replacements
    $q mapsto n q$, where at each replacement $n$ is a positive integer satisfying $n lt.eq q + 1$.
    Then, for every real number $w$ with $1 lt.eq w lt.eq q$, there is a positive divisor $d$ of $q$ such that
$ w / m lt.eq d lt.eq w . $

]
] <lem:marked-divisor-density>

#proof[
  For the initial value $q = m$, the divisor $1$ works throughout $\[ 1 \, m \]$.
    Suppose the property holds for $q$, and put $q' = n q$. If $1 lt.eq w lt.eq q$, use a divisor of $q$,
    which is also a divisor of $q'$. If $n lt.eq w lt.eq n q$,
    apply the property at $w \/ n$ and multiply the resulting divisor by $n$.
    These two cases cover $\[ 1 \, n q \]$ unless $q < n$ and $q < w < n$.
    In that gap the divisor $q$ itself works: $q < w$ and
  $ w < n lt.eq q + 1 lt.eq m q . $
  This proves the induction, including the real points between consecutive integers. ◻
]

#thm([Lemma 8.4.])[
  #emph[Let $m gt.eq 2$, $q gt.eq 1$, $K_m gt.eq 1$, and $B gt.eq 1$ be integers.
    Suppose that, for every real $w in \[ 1 \, q \]$, the integer $q$ has a divisor in $\[ w \/ m \, w \]$.
    Suppose also that each integer $s in \[ 1 \, m^4 \]$ can be written as a sum of at most $B$ positive rational
    numbers $e \/ t$, where $e divides K_m$ and $t$ is a positive integer.
    Then, for every integer $X$ with $1 lt.eq X lt.eq q$, the rational number $X \/ \( q K_m \)$ is a sum of at most
$ B (frac(log X, 2 log m) + 2) $

 positive unit fractions, with repetitions allowed.]
] <lem:marked-grouping>

#proof[
  Write $X_0 = X$, and repeatedly remove groups from the remaining integer.
    If the current integer $X_i$ exceeds $m^4$, then $w = X_i \/ m^2$ lies in $\[ 1 \, q \]$.
    Choose $d_i divides q$ with
  $ X_i / m^3 lt.eq d_i lt.eq X_i / m^2 \, wide s_i = ⌊X_i / d_i⌋ . $
  Thus $m^2 lt.eq s_i lt.eq m^3 lt.eq m^4$, and the integer remaining after the group $d_i s_i$ is removed satisfies
  $ 0 lt.eq X_(i + 1) = X_i - d_i s_i < d_i lt.eq X_i / m^2 . $
  If instead $0 < X_i lt.eq m^4$, remove the final group with $d_i = 1$ and $s_i = X_i$.
    Stop immediately if the remaining integer is zero.
  Every grouping step with $X_i > m^4$ decreases the remainder by a factor strictly greater than $m^2$.
    There are therefore at most $ceil.l log X \/ \( 2 log m \) ceil.r$ such steps,
    followed by at most one final group. The number $G$ of groups satisfies
  $ G lt.eq ⌈frac(log X, 2 log m)⌉ + 1 lt.eq frac(log X, 2 log m) + 2 . $
  This bound also covers $X = 1$ and a zero remainder before the final group.
  For each group, use the assumed representation $s_i = sum_(a = 1)^(b_i) e_(i \, a) \/ t_(i \, a)$,
    with $b_i lt.eq B$. Dividing $X = sum_i d_i s_i$ by $q K_m$ gives
  $ frac(X, q K_m) = sum_i sum_(a = 1)^(b_i) frac(1, \( q \/ d_i \) \( K_m \/ e_(i \, a) \) t_(i \, a)) . $
  Each displayed denominator is a positive integer. This uses the two divisibilities $d_i divides
    q$ and $e_(i \, a) divides K_m$; no divisibility between $t_(i \, a)$ and $e_(i \, a)$,
    or coprimality assumption, is needed. The total number of terms is at most $B G$. ◻
]

#proof[
  Fix a sufficiently large integer $m$, put $L = log log m$, and take $K_m$ from Lemma 17.
    Apply Lemma 14 with $T = 2 m K_m$, which is an integer at least $2 m^2$. It gives
  $ 1 = 1 / m + sum_(i = 1)^j 1 / n_i + R / q \, wide 0 lt.eq R < 2 m . $
  The prefix is distinct and avoids $m$. By (8.1),
  $ log log \( 2 m K_m \) lt.eq L + O \( log L \) \, wide j lt.eq frac(L, log 2) + O \( log L \) =
    (frac(1, log 2) + o \( 1 \)) L . $
  If $R = 0$, the expansion is complete and already satisfies the asserted length bound.
    Suppose henceforth that $R > 0$.
  The denominator $q$ is retained without cancellation, beginning at $m$ and using multipliers at most the
    preceding denominator plus one. Lemma 18 therefore applies to this $q$.
    Moreover $q gt.eq 2 m K_m$ and $R < 2 m$, so the integer $X = R K_m$ satisfies $1 lt.eq X < q$.
    Lemma 19, with $B = 16$ and the supply from Lemma 17, represents $X \/ \( q K_m \) =
    R \/ q$ as a sum of at most $16 G$ unit fractions, where
  $ G lt.eq frac(log \( R K_m \), 2 log m) + 2 lt.eq frac(log K_m + log \( 2 m \), 2 log m) + 2 lt.eq
    (frac(16, log 2) + o \( 1 \)) L . $
  This count depends on $R K_m$, not on the potentially much larger $q$.
  Apply Lemma 5 only to this tail. It makes its denominators distinct without changing its number of terms.
    The tail sum is strictly below $1 \/ m$ and every $1 \/ n_i$ by Lemma 14.
    Every reciprocal in any positive expansion of that sum is at most the sum itself.
    Thus all denominators of the distinct tail exceed $m$ and every $n_i$,
    so adjoining it to the reserved term and prefix produces a distinct expansion of $1$.
    There is one reserved term, $j$ prefix terms, and at most sixteen terms for each of the $G$ groups.
    Its total length is therefore at most
  $ 1 + j + 16 G lt.eq (frac(1 + 16 dot.op 16, log 2) + o \( 1 \)) L = (frac(257, log 2) + o \( 1 \)) log log m . $
  All errors here tend to zero as $m$ tends to infinity through all integers:
    the bound on $R$ removed any dependence on the chosen stopping numerator, and the supply covers both parities.
    Absorbing the error into any prescribed $epsilon > 0$ proves the proposition. ◻
]

=== 8.3 Every sufficiently large prescribed length <every-sufficiently-large-prescribed-length>

#proof[
  Set $A = 257 \/ log 2$. Fix a real number $c$ with $0 < c < 1 \/ A$,
    and choose $epsilon > 0$ such that $c \( A + epsilon \) < 1$.
    Proposition 16 supplies an integer $M gt.eq 4$ such that every integer $m gt.eq
    M$ has a distinct marked expansion with at most $\( A + epsilon \) log log m$ terms.
    The construction in Section 7 also gives a finite distinct marked expansion for each $2 lt.eq m < M$.
    Fix one for each such $m$, and let $k_(*)$ be the maximum of their finitely many lengths.
  For every integer $k gt.eq k_(*)$ and every integer $2 lt.eq m lt.eq exp \( exp \( c k \) \)$,
    the chosen expansion has at most $k$ terms. This is immediate for $m < M$; for $m gt.eq M$ its length is at most
  $ \( A + epsilon \) log log m lt.eq c \( A + epsilon \) k < k . $
  A distinct expansion of $1$ containing a denominator $m gt.eq 2$ has at least three terms:
    denominator one would exhaust the sum, and two distinct denominators at least two contribute at most $1 \/ 2 +
    1 \/ 3 < 1$. Thus Lemma 15 may be iterated until the length is exactly $k$, retaining the exact integer $m$.
    We have proved
  $ { 2 \, dots.h \, floor.l exp \( exp \( c k \) \) floor.r } subset.eq D_k . $
  The first missing integer exceeds the real right endpoint, and hence $v \( k \) gt.eq
    exp \( exp \( c k \) \)$ for every sufficiently large integer $k$.
    Because this holds for each fixed $c < log 2 \/ 257$, it gives
  $ liminf_(k arrow.r oo) frac(log log v \( k \), k) gt.eq frac(log 2, 257) . $
  In particular $257 \/ log 2 < 600$, so taking $c = 1 \/ 600$ gives the stated eventual lower bound $v \( k \)
    gt.eq exp \( exp \( k \/ 600 \) \)$.
  For the upper bound, the product recurrence in the proof of Corollary 2 gives $n_i lt.eq
    k^(2^(i - 1))$ in every distinct exact-$k$ expansion of $1$.
    Every denominator in such an expansion is therefore at most $k^(2^(k - 1))$.
    Consequently $D_k$ is finite for every $k gt.eq 1$, its complement in ${ 2 \, 3 \, dots.h }$ is nonempty, and
  $ v \( k \) lt.eq 1 + k^(2^(k - 1)) . $
  For $k gt.eq 2$ this yields $log log v \( k \) lt.eq k log 2 + log log k$, and therefore
  $ limsup_(k arrow.r oo) frac(log log v \( k \), k) lt.eq log 2 . $
  Together the two bounds imply $log log v \( k \) = Theta \( k \)$. ◻
]

The lower slope above is the consequence of the length coefficient in Proposition 16.
  Its vanishing error does not imply an eventual inequality with the endpoint $c = log 2 \/ 257$.
  Neither that endpoint inequality nor a limiting or sharp slope is asserted.

#bibliography("refs.bib", style: "ieee", title: [References])
