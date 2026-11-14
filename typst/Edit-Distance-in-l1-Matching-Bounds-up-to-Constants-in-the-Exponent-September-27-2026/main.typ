#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 75.9pt, y: 75.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Edit Distance in $ell_1$: \
Matching Bounds up to Constants in the Exponent]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <introduction>

We study how faithfully distances between strings can be represented by distances in $ell_1$.
  The distance on strings is ordinary edit distance: $"ED" \( x \, y \)$ is the least number of single-symbol
  insertions, deletions and substitutions that transform $x$ into $y$, with every operation costing one.
  An insertion or deletion changes the positions of an entire suffix.
  As a result, the distance depends on the best alignment of the two strings,
  and a useful representation must account for alignments over all scales.

For a finite alphabet $Sigma$ and an integer $d gt.eq 1$,
  let $Sigma^(lt.eq d)$ be the set of all strings of length at most $d$, including the empty string.
  The cap restricts the endpoints; intermediate strings in an edit script may have any length.
  Write $ell_1$ for the real space of absolutely summable sequences and define

$ E_Sigma \( d \) = inf_(f : Sigma^(lt.eq d) arrow.r.hook ell_1)
  (max_(x eq.not y) frac(∥f \( x \) - f \( y \)∥_1, "ED" \( x \, y \)))
  (max_(x eq.not y) frac("ED" \( x \, y \), ∥f \( x \) - f \( y \)∥_1)) . $

The infimum is over injective maps. It imposes no restriction on target dimension or on the cost of computing the
  map. Equivalently, an embedding has distortion at most $D$ when it can be rescaled so that every image distance
  lies between $"ED" \( x \, y \) \/ D$ and $"ED" \( x \, y \)$.

#thm([Theorem 1.1.])[
  #emph[There are absolute constants $c \, C > 0$ and an integer $d_0$ such that, for every integer $d gt.eq
    d_0$ and every finite alphabet $Sigma$ with $\| Sigma \| gt.eq 2$,
#[#set math.equation(numbering: n => "(1.1)")
 $ exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] c sqrt(log d thin log log d) #scale(x: 120%, y: 120%)[\)] lt.eq
   E_Sigma \( d \) lt.eq exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] C sqrt(log d thin log log d)
   #scale(x: 120%, y: 120%)[\)] . $ <eq:main>]

 The lower bound is witnessed by a subset of binary strings of one common length at most $d$.
   The same bounds hold for $sup_(Sigma : thin 2 lt.eq \| Sigma \| < oo) E_Sigma \( d \)$.]
] <thm:main>

Logarithms are natural unless a base is specified. The constants and threshold in the theorem are independent of
  the alphabet, including when its size grows with $d$. The conclusion determines the order of $log
  E_Sigma \( d \)$; the constants in the exponent remain unspecified.

=== The earlier bounds <the-earlier-bounds>

The single-symbol error model is classical. Levenshtein studied codes correcting insertions,
  deletions and substitutions [4], and Wagner and Fischer described edit scripts through increasing traces [10].
  Their alignment language will be useful below: any lower bound must control every increasing matching of equal
  symbols, including matchings that cross the boundaries used to construct the strings.

Ostrovsky and Rabani [8] proved the upper scale in Theorem 1 for fixed-length binary strings by recursively
  comparing collections of overlapping substrings. They also noted extensions to larger alphabets and varying
  lengths. We use their fixed-length theorem and give complete reductions with constants uniform over all finite
  alphabets and with the empty string included.

For lower bounds, Andoni, Deza, Gupta, Indyk and Raskhodnikova [1] constructed binary subsets whose $L_1$
  distortion approaches $3 \/ 2$. Khot and Naor [2] Theorem 4.1 obtained an $Omega \( sqrt(log d \/ log log d) \)$
  lower bound by studying cuts and Fourier analysis of noisy shifts.
  Their insertion–deletion metric is within a factor of two of the convention used here.
  Krauthgamer and Rabani [3] Theorem 1.3 then proved an $Omega \( log d \)$ lower bound for binary strings of
  length $d$. The construction below reaches the scale of the Ostrovsky–Rabani exponent.

=== How the lower bound works <how-the-lower-bound-works>

The construction joins a geometric fact about strings to an analytic fact about $ell_1$.
  At the geometric level, a word is a long list of rows. Each row contains a payload made of lower-level words,
  followed by a long marker consisting of a fresh symbol. The payload has fixed slots;
  each slot has its own alphabet tag, so different slots cannot match. The lower-level words depend on states.
  In each component, repeatedly adding one distinguished step cycles the state with a prime period;
  different components use different primes. Advancing every component by one state step shifts the row list by
  one, which costs only the deletion and insertion of one row.

Advancing the distinguished component behaves differently.
  We repeat that component in many separately tagged slots.
  For any proposed pair of rows, either those repeated slots remain separated or the row shift that aligns them
  leaves many of the other prime-period components separated.
  A global alignment can still send one source payload into several target rows.
  In that event, the matching skips a complete target marker:
  the source payload contains no copy of the marker symbol.
  The skipped markers for different payloads are disjoint. This turns the row comparison into a lower bound for
  arbitrary alignments.

The analytic comparison concerns the average image distance produced by a group displacement.
  Proposition 3 bounds the displacement in the distinguished component by the simultaneous step and the average
  component steps. The proof expresses a finite $ell_1$ metric as a nonnegative sum of cut metrics,
  then expands each cut in Fourier characters. A character involving few components is detected by the
  simultaneous step: distinct prime denominators prevent its phase from being an integer.
  A character involving many components is detected by the sum of the component averages.

Relative to word length, the guaranteed pointwise separation decreases by a fixed factor at each level.
  Under the same normalization, the analytic inequality forces the allowed averaged image displacement to decrease
  much faster: after $k$ levels, the ratio between these two bounds is $exp \( Omega \( k log k \) \)$.
  Meanwhile, the logarithmic word length is $O \( k^2 log k \)$.
  A delimiter code transfers the words to binary with a loss polynomial in $k$,
  and choosing $k$ directly from the cap $d$ supplies a witness for every sufficiently large $d$.

Section 2 proves the alignment facts and the prime-product displacement inequality.
  Section 3 builds the words and proves their separation and analytic recurrence together.
  Section 4 supplies the delimiter at the binary transfer and completes the parameter calculation.
  Section 5 derives the uniform upper bound by hashing the alphabet, padding to one binary length,
  and averaging over all hash maps.

The companion manuscripts on circle constructions [6] and tree constructions [7] give independent lower-bound
  mechanisms and additional binary coding results. No result from a companion manuscript is used;
  the upper bound uses the stated external theorem.

== 2 Alignments and a displacement inequality <sec:displacement>

The word construction will be measured first by insertion–deletion distance.
  Its advantage is that every possible comparison has a concrete description as an increasing matching.
  We then state the analytic inequality that will be applied at each level of the construction.

=== 2.1 Distances from increasing matchings <distances-from-increasing-matchings>

Write $Delta \( x \, y \)$ for the minimum number of single-symbol insertions and deletions transforming $x$ into
  $y$. An increasing matching is a list of pairs of equal-symbol positions,
  strictly increasing in both coordinates. Let $"LCS" \( x \, y \)$ be its maximum size.
  These are the classical trace and subsequence descriptions of string correction [10] Sections 3 and 5.

#thm([Lemma 2.1.])[
  #emph[For arbitrary finite strings, including the empty string,
#[#set math.equation(numbering: n => "(2.1)")
 $ "ED" \( x \, y \) lt.eq Delta \( x \, y \) lt.eq 2 "ED" \( x \, y \) \, wide
   Delta \( x \, y \) = \| x \| + \| y \| - 2 "LCS" \( x \, y \) . $ <eq:metric-comparison>]

 For two strings of the same length $n$, define their one-sided deficit by
$ r_n \( x \, y \) = n - "LCS" \( x \, y \) = 1 / 2 Delta \( x \, y \) . $

 A matching of size $n - E$ leaves exactly $E$ unmatched positions on each side.]
] <lem:alignments>

#proof[
  An insertion–deletion script is an edit script, and replacing each substitution by one deletion and one
    insertion proves the two inequalities. Deleting the unmatched source positions in an increasing matching and
    inserting the unmatched target positions realizes its total loss $\| x \| + \| y \| - 2 \| M \|$.
    Conversely, the original positions that survive an insertion–deletion script form an increasing matching;
    its loss is at most the number of operations. Minimizing the loss gives the identity.
    The equal-length assertions follow directly. ◻
]

=== 2.2 The comparison to be proved <the-comparison-to-be-proved>

For a finite abelian group $G$ and a map $H : G arrow.r ell_1$, set

#[#set math.equation(numbering: n => "(2.2)")
 $ V_H \( g \) = bb(E)_(z in G) ∥H \( z + g \) - H \( z \)∥_1 . $ <eq:variation>]

Every expectation over a finite set uses the uniform probability measure.
  The following proposition compares a shift in one component with a simultaneous shift and with shifts averaged
  inside the separate components. In the word construction, the simultaneous shift will move the row list by one;
  the component averages will be bounded at the preceding level.

#thm([Proposition 2.2.])[
  (Prime-product displacement inequality).  #emph[ Let $b \, h gt.eq 1$ be integers, let $P gt.eq 1$,
    and let $G_1 \, dots.h \, G_b$ be finite abelian groups. Suppose $v_j in G_j$ has order $p_j$, where $p_1 \,
    dots.h \, p_b$ are distinct primes in $\[ P \, 2 P \]$. In $G = product_(j = 1)^b G_j$,
    use the same notation $v_j$ for the element acting only in coordinate $j$, and put $tau = sum_(j = 1)^b v_j$.
    Then every $H : G arrow.r ell_1$ and every integer $u$ satisfy
#[#set math.equation(numbering: n => "(2.3)")
 $ V_H \( u v_1 \) lt.eq \( 2 P \)^(2 h) V_H \( tau \) + 2 /
   h sum_(j = 1)^b bb(E)_(a in bb(Z) \/ p_j bb(Z)) V_H \( a v_j \) . $ <eq:prime-product-bound>]

]
] <prop:displacement>

We prove the proposition after recording two elementary forms of the cut and Fourier methods.
  The cut representation is standard [5] Section 4. Its summability statement below permits an unrestricted
  sequence-space target.

#thm([Lemma 2.3.])[
  (Finite cut decomposition).  #emph[Let $X$ be finite and $H : X arrow.r ell_1$.
    There are finite numbers $c_A gt.eq 0$, indexed by the nonempty proper subsets of $X$, such that
#[#set math.equation(numbering: n => "(2.4)")
 $ ∥H \( x \) - H \( y \)∥_1 = sum_(diameter eq.not A subset.neq X) c_A \| upright(bold(1))_A \( x \) -
   upright(bold(1))_A \( y \) \| wide \( x \, y in X \) . $ <eq:cuts>]

 Moreover,
$ sum_(diameter eq.not A subset.neq X) c_A lt.eq sum_({ x \, y } subset X \, med x eq.not y) ∥H \( x \) -
  H \( y \)∥_1 \, $

 where the right sum is over unordered pairs.]
] <lem:cuts>

#proof[
  For $\| X \| lt.eq 1$ all the sums are empty. Otherwise, for coordinate $n$ of $H$,
    list its distinct values on $X$ as $t_(n \, 1) < dots.h.c < t_(n \, k_n)$. Put
  $ A_(n \, r) = { x : H_n \( x \) > t_(n \, r) } \, wide a_(n \, r) = t_(n \, r + 1) -
    t_(n \, r) quad \( 1 lt.eq r < k_n \) . $
  The consecutive gaps telescope:
  $ \| H_n \( x \) - H_n \( y \) \| = sum_(r = 1)^(k_n - 1) a_(n \, r) \| upright(bold(1))_(A_(n \, r)) \( x \) -
    upright(bold(1))_(A_(n \, r)) \( y \) \| . $
  Group all terms with the same cut by setting $c_A = sum_(n \, r : thin A_(n \, r) = A) a_(n \, r)$,
    initially allowing the value $+ oo$. Nonnegativity allows the coordinate series to be interchanged with the
    finite sum over unordered pairs. Hence
  $ sum_(diameter eq.not A subset.neq X) c_A \| A \| thin \| X \\ A \| =
    sum_({ x \, y } subset X \, med x eq.not y) sum_(n = 1)^oo \| H_n \( x \) - H_n \( y \) \| =
    sum_({ x \, y } subset X \, med x eq.not y) ∥H \( x \) - H \( y \)∥_1 < oo . $
  Each indexed cut separates at least one pair, so $\| A \| thin \| X \\ A \| gt.eq 1$.
    The displayed equality proves that all the weights are finite and bounds their total.
    Summing the coordinate identity and grouping its nonnegative terms now gives (2.4). ◻
]

#thm([Lemma 2.4.])[
  (Finite Fourier displacement identity).  #emph[Let $T = product_(j = 1)^b bb(Z) \/ p_j bb(Z)$,
    where the integers $p_j$ are at least two. For $lambda in T$, set
$ chi_lambda \( t \) = exp #h(-0.16667em) (2 pi upright(i) sum_(j = 1)^b frac(lambda_j t_j, p_j)) \, wide
  hat(F) \( lambda \) = bb(E)_(t in T) F \( t \) overline(chi_lambda \( t \)) . $

 For every $F : T arrow.r bb(C)$ and $l in T$,
#[#set math.equation(numbering: n => "(2.5)")
 $ bb(E)_(t in T) \| F \( t + l \) - F \( t \) \|^2 = sum_(lambda in T) \| hat(F) \( lambda \) \|^2 4 sin^2
   #h(-0.16667em) (pi sum_(j = 1)^b frac(l_j lambda_j, p_j)) . $ <eq:fourier-displacement>]

 The squared sine is independent of the chosen integer representatives.]
] <lem:fourier>

#proof[
  The geometric-series identity
  $ 1 / p sum_(a = 0)^(p - 1) e^(2 pi upright(i) q a \/ p) =
    cases(delim: "{", 1 \, & p divides q \,, 0 \, & p divides.not q) $
  shows, coordinate by coordinate, that the $\| T \|$ characters are orthonormal for the inner product $chevron.l
    F_1 \, F_2 chevron.r = bb(E)_t F_1 \( t \) overline(F_2 \( t \))$.
    They form a basis because the function space has dimension $\| T \|$.
    Thus $F \( t \) = sum_lambda hat(F) \( lambda \) chi_lambda \( t \)$,
    and the squared norm equals the sum of squared Fourier coefficients. Apply this to
  $ F \( t + l \) - F \( t \) = sum_lambda hat(F) \( lambda \) \( chi_lambda \( l \) - 1 \) chi_lambda \( t \) $
  and use $\| e^(2 pi upright(i) theta) - 1 \|^2 = 4 sin^2 \( pi theta \)$. ◻
]

#proof[
  By Lemma 4, each displacement of $H$ is a nonnegative linear combination of displacements of Boolean cut maps.
    It is enough to prove (2.3) for one such map $H = upright(bold(1))_A$.
  Let $K = product_j chevron.l v_j chevron.r subset.eq G$. Every shift in the desired inequality preserves every
    coset of $K$. On a fixed coset, choose a representative $c$ and identify $T =
    product_j bb(Z) \/ p_j bb(Z)$ with that coset through $t mapsto c + sum_j t_j v_j$.
    The cut becomes $F \( t \) = upright(bold(1))_A \( c + sum_j t_j v_j \)$.
    For Boolean values, absolute difference equals squared difference.
    With $D_F \( l \) = bb(E)_t \| F \( t + l \) - F \( t \) \|^2$, it remains to prove
  #[#set math.equation(numbering: n => "(2.6)")
   $ D_F \( u e_1 \) lt.eq \( 2 P \)^(2 h) D_F \( upright(bold(1)) \) + 2 /
     h sum_(j = 1)^b bb(E)_(a in bb(Z) \/ p_j bb(Z)) D_F \( a e_j \) \, $ <eq:coset-bound>]
  where $upright(bold(1)) = \( 1 \, dots.h \, 1 \)$ and $e_j$ is the $j$th coordinate vector.
  We compare the multipliers in Lemma 5 one frequency at a time.
    Fix $lambda in T$, write $S = { j : lambda_j eq.not 0 }$ and $r = \| S \|$.
    When $lambda_1 = 0$, the left multiplier vanishes. Assume therefore that $lambda_1 eq.not 0$.
    The left multiplier is at most four.
  First suppose $r < h$. Choose $0 lt.eq lambda_j < p_j$ and put
  $ q = product_(j in S) p_j \, wide theta = sum_(j in S) lambda_j / p_j . $
  For any $i in S$, distinctness of the primes gives $q theta equiv
    lambda_i \( q \/ p_i \) equiv.not 0 med \( mod med p_i \)$. Thus $theta$ is not an integer.
    Since its denominator divides $q$, its distance $delta$ from the nearest integer satisfies
  $ 1 / 2 gt.eq delta gt.eq 1 / q gt.eq \( 2 P \)^(- r) gt.eq \( 2 P \)^(- h) . $
  Concavity of sine on $\[ 0 \, pi \/ 2 \]$ gives $sin \( pi delta \) gt.eq 2 delta$.
    Consequently the simultaneous-shift multiplier on the right of (2.6) is at least
  $ \( 2 P \)^(2 h) 4 sin^2 \( pi theta \) = \( 2 P \)^(2 h) 4 sin^2 \( pi delta \) gt.eq 16 \, $
  which bounds the left multiplier.
  Now suppose $r gt.eq h$. For each coordinate, the same geometric-series identity gives
  $ bb(E)_(a in bb(Z) \/ p_j bb(Z)) 4 sin^2 \( pi a lambda_j \/ p_j \) = 2 -
    2 "Re" bb(E)_a e^(2 pi upright(i) a lambda_j \/ p_j) = cases(delim: "{", 2 \, & j in S \,, 0 \, & j in.not S .) $
  The component terms on the right therefore have combined multiplier $\( 2 \/ h \) 2 r gt.eq 4$,
    again bounding the left. This case includes $h = 1$. Multiplication by $\|
    hat(F) \( lambda \) \|^2$ and summation over $lambda$ proves (2.6).
    Averaging over the equal-size cosets gives the uniform average over $G$.
    Finally, summing the nonnegative cut weights proves the proposition for $H$. ◻
]

The two cases explain the role of distinct periods. A low-support frequency pays for a nonintegral simultaneous
  phase; a high-support frequency pays for many component variations.
  The next section turns these two payments into an iterated obstruction.

== 3 Recursive words with incompatible displacements <sec:construction>

We now build the words to which Proposition 3 will be applied.
  The row list must be long enough that its one-row shift remains inexpensive after multiplication by
  $\( 2 P \)^(2 h)$ in that inequality. At the same time, it must be shorter than the product of many component
  periods, so that a row shift cannot cancel too many prime-period differences.
  The following choices provide both properties.

Fix a sufficiently large integer $k$ and set

#[#set math.equation(numbering: n => "(3.1)")
 $ b = 100 k \, wide P = b^2 \, wide h = b \/ 10 = 10 k \, wide L = P^(b \/ 2) . $ <eq:parameters>]

Choose $b$ distinct primes in $\[ P \, 2 P \]$, and call their set $cal(P)$.
  The prime number theorem gives $pi \( 2 P \) - pi \( P \) tilde.op P \/ log P >
  b$ for all sufficiently large $k$; the explicit interval estimate of Rosser and Schoenfeld [9] Corollary 3,
  equation (3.8) also gives this consequence. We use this one pool and the same parameters at every level.

=== 3.1 The recursive family and its cheap steps <the-recursive-family-and-its-cheap-steps>

For every $0 lt.eq s lt.eq k$ and $p in cal(P)$, the construction supplies a finite abelian state group
  $G_(s \, p)$, a distinguished element $v_(s \, p)$ of order $p$, and a word map

$ W_(s \, p) : G_(s \, p) arrow.r cal(A)_(s \, p)^(thin n_s) . $

It also supplies a finite list $cal(S)_(s \, p)$ of pairs $\( e \, r \)$,
  where $e in G_(s \, p)$ is a step and $r > 0$ is its displacement budget.
  The word map itself need not be injective. Define

#[#set math.equation(numbering: n => "(3.2)")
 $ alpha_s = 24^(- s) \, wide Q_0 = 2 \, wide Q_s = frac(2 \( 2 P \)^(2 h), L) + Q_(s - 1) / h . $ <eq:recurrences>]

#thm([Proposition 3.1.])[
  (Recursive properties).  #emph[The families can be chosen with
$ n_s = #scale(x: 120%, y: 120%)[\(] 2 \( 2 b - 1 \) L #scale(x: 120%, y: 120%)[\)]^s \,
  wide \| cal(A)_(s \, p) \| lt.eq A_s \, wide A_0 = 2 P \, quad A_s = 1 + \( 2 b - 1 \) A_(s - 1) \, $

 so that the following assertions hold.]
  + #emph[Every listed step is cheap at every state:
#[#set math.equation(numbering: n => "(3.3)")
 $ Delta #scale(x: 120%, y: 120%)[\(] W_(s \, p) \( z \) \,
   W_(s \, p) \( z + e \) #scale(x: 120%, y: 120%)[\)] lt.eq n_s r quad
   #scale(x: 120%, y: 120%)[\(] \( e \, r \) in cal(S)_(s \, p) \, med
   z in G_(s \, p) #scale(x: 120%, y: 120%)[\)] . $ <eq:step-property>]

]
  + #emph[Every nonzero distinguished shift is separated at every state:
#[#set math.equation(numbering: n => "(3.4)")
 $ Delta #scale(x: 120%, y: 120%)[\(] W_(s \, p) \( z \) \,
   W_(s \, p) \( z + u v_(s \, p) \) #scale(x: 120%, y: 120%)[\)] gt.eq
   n_s alpha_s quad \( z in G_(s \, p) \, med 1 lt.eq u < p \) . $ <eq:far-property>]

]
  + #emph[If $H : G_(s \, p) arrow.r ell_1$ satisfies the averaged budgets $V_H \( e \) lt.eq
    r$ for all $\( e \, r \) in cal(S)_(s \, p)$, then
#[#set math.equation(numbering: n => "(3.5)")
 $ V_H \( u v_(s \, p) \) lt.eq Q_s wide \( 1 lt.eq u < p \) . $ <eq:l1-property>]

]
] <prop:family>

The first two assertions describe the geometry of the words.
  The third says that any $ell_1$ map respecting the same cheap-step budgets has small average displacement in the
  separated direction. We prove the proposition by simultaneous induction on $s$,
  constructing the word maps and the cheap-step lists together.

At level zero, take

$ G_(0 \, p) = bb(Z) \/ p bb(Z) \, quad v_(0 \, p) = 1 \, quad W_(0 \, p) \( z \) = \( z \) \, quad
  cal(S)_(0 \, p) = { \( e \, 2 \) : e eq.not 0 } . $

The single symbols are distinct. Their insertion–deletion distance is two,
  so the first two assertions hold with $n_0 = 1$ and $alpha_0 = 1$.
  The listed budgets give the third assertion with $Q_0 = 2$. The alphabet has $p lt.eq 2 P$ symbols.

Suppose the families at level $s - 1$ have been constructed.
  To build the family indexed by $p$, enumerate the pool as $p_1 \, dots.h \, p_b$ with $p_1 = p$, and abbreviate

$ G_j = G_(s - 1 \, p_j) \, quad v_j = v_(s - 1 \, p_j) \, quad W_j = W_(s - 1 \, p_j) \, quad m = n_(s - 1) . $

Set $G_(s \, p) = product_(j = 1)^b G_j$ and $v_(s \, p) = \( v_1 \, 0 \, dots.h \, 0 \)$, which has order $p$.

For $z = \( z_1 \, dots.h \, z_b \)$, the new word is a concatenation of $L$ rows, indexed by $i = 0 \, dots.h \,
  L - 1$. Row $i$ begins with a payload of $2 b - 1$ slots.
  Its first $b$ slots contain separately tagged copies of $W_1 \( z_1 + i v_1 \)$;
  its remaining slots contain tagged copies of $W_j \( z_j + i v_j \)$ for $j = 2 \, dots.h \, b$, in that order.
  Each slot has its own tag, fixed across all rows and different from every other slot tag.
  The payload length is $B = \( 2 b - 1 \) m$. Append a marker $\#^B$, where $\#$ is absent from all payloads.

More formally, the new alphabet is the disjoint union of ${ \# }$ and one set ${ r } times
  cal(A)_(s - 1 \, p_j)$ for each slot $r$ carrying component $j$.
  This also tags every lower-level marker, so none becomes the new symbol $\#$. The full length and alphabet bounds are

#[#set math.equation(numbering: n => "(3.6)")
 $ n_s = 2 B L = 2 \( 2 b - 1 \) L thin n_(s - 1) \, wide \| cal(A)_(s \, p) \| lt.eq
   1 + \( 2 b - 1 \) A_(s - 1) . $ <eq:row-length>]

There are two kinds of cheap steps. First include the simultaneous step $tau = \( v_1 \, dots.h \, v_b \)$ with
  budget $2 \/ L$. Row $i$ of the word at $z + tau$ is row $i + 1$ of the word at $z$ whenever $0 lt.eq i < L -
  1$. Deleting the first row and inserting one final row costs at most $4 B = 2 n_s \/ L$.

For the other steps, let $c_1 = b$ and $c_j = 1$ for $j gt.eq 2$, and put

#[#set math.equation(numbering: n => "(3.7)")
 $ omega_j = frac(c_j m, 2 B) \, wide sum_(j = 1)^b omega_j = 1 / 2 . $ <eq:weights>]

The number $omega_j$ is the fraction of the full word occupied by component $j$; markers occupy the other half.
  For each $\( e \, r \) in cal(S)_(s - 1 \, p_j)$ include its lift $tilde(e)$ to coordinate $j$ with budget
  $omega_j r$. The preceding level’s bound holds at every translated state $z_j + i v_j$.
  Editing the $L c_j$ affected slots separately therefore costs at most $L c_j m r = n_s omega_j r$. This proves (3.3).

=== 3.2 Separation across row boundaries <sec:separation>

We first isolate the matching argument supplied by the fresh markers.
  It will convert a comparison of every pair of payloads into a comparison of the full row lists.

#thm([Lemma 3.2.])[
  (Marked payloads).  #emph[Let $T \, p \, q gt.eq 1$ be integers, let $Gamma$ be an alphabet,
    and let $\# in.not Gamma$. For $U_a \, V_b in Gamma^p$ with $1 lt.eq a \, b lt.eq T$, put
$ X = U_1 \#^q dots.h.c U_T \#^q \, wide Y = V_1 \#^q dots.h.c V_T \#^q \, wide N = T \( p + q \) . $

 If $d gt.eq 0$ and $r_p \( U_a \, V_b \) gt.eq d$ for every $a \, b$, then
#[#set math.equation(numbering: n => "(3.8)")
 $ r_N \( X \, Y \) gt.eq frac(T d q, d + q) gt.eq T / 2 min \( d \, q \) . $ <eq:marked>]

 In particular, $d lt.eq q$ implies $Delta \( X \, Y \) gt.eq T d$.]
] <lem:marked>

#proof[
  Fix an increasing matching, with $E$ unmatched positions on each side.
    No source payload symbol can match a target marker. Let $s$ be the number of source payloads whose matches
    reach at least two target payloads.
  A source payload whose matches lie in one target payload loses at least $d$ source positions.
    A payload with no matches loses $p gt.eq d$ positions. Summing over these $T - s$ payloads gives $E gt.eq
    d \( T - s \)$.
  For each of the other $s$ payloads, choose a target marker between two of its matches, as in Figure 1.
    The entire marker is unmatched: a matched target position between the two chosen matches would have its source
    partner between their source partners, inside this source payload, where $\#$ does not occur.
    The target matched spans of different source payloads are ordered and disjoint,
    so the chosen markers are distinct. Thus $E gt.eq s q$.
  Combining the two estimates gives $E gt.eq d \( T - E \/ q \)$ and hence $E gt.eq T d q \/ \( d + q \)$.
    The latter is at least $\( T \/ 2 \) min \( d \, q \)$. This holds for every matching, including when $d = 0$,
    and proves (3.8). Finally $Delta \( X \, Y \) = 2 r_N \( X \, Y \)$. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((1.35, 1.71), (7.65, 2.25), fill: rgb("#f0f0ff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.5, 1.98), [#text(size: 9pt)[source payload \(no $\#$\)]])
  rect((0, 0), (2.7, 0.54), fill: rgb("#f0f0ff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((2.7, 0), (4.77, 0.54), fill: rgb("#e6e6e6"), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((4.77, 0), (9, 0.54), fill: rgb("#f0f0ff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.35, 0.27), [#text(size: 9pt)[target payload]])
  content((3.735, 0.27), [#text(size: 9pt)[$\#^q$]])
  content((6.885, 0.27), [#text(size: 9pt)[target payload]])
  line((1.98, 1.71), (1.98, 0.603), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  line((6.75, 1.71), (6.75, 0.603), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((4.32, 1.125), [#text(size: 9pt)[no source $\#$#linebreak()between these matches]])
})],
  caption: [Figure 1: Two matches from one source payload enclose an unmatched target marker. The arrows represent matched pairs; no alignment of other payload boundaries is assumed. ],
) <fig:marker>

We apply the lemma to the words at $z$ and $z + u v_(s \, p)$, where $1 lt.eq u < p_1$.
  Compare source payload $i$ with target payload $i'$ and write $delta = i' - i$.
  Their relative shifts are $\( delta + u \) v_1$ in component $1$ and $delta v_j$ in component $j gt.eq 2$.

At least $b \/ 3$ slots have a nonzero shift. If $p_1 divides.not delta + u$, all $b$ copies of component $1$ do.
  Otherwise $delta eq.not 0$, since $1 lt.eq u < p_1$. Now $0 < \| delta \| < L = P^(b \/ 2)$,
  whereas the product of $b \/ 2$ distinct primes from the pool is at least $P^(b \/ 2)$.
  Fewer than $b \/ 2$ pool primes can therefore divide $delta$.
  Among components $2 \, dots.h \, b$, at least $b - 1 - b \/ 2 gt.eq b \/ 3$ have a nonzero shift.

In each such slot the induction hypothesis gives insertion–deletion distance at least $m alpha_(s - 1)$.
  A matching of the two complete length-$m$ slot words therefore leaves at least $m alpha_(s - 1) \/
  2$ source positions unmatched. Since the slot tags are disjoint,
  every matching between the two payloads restricts to a matching of the corresponding complete slot words.
  Its size is bounded by their $"LCS"$ even if other source payloads use some positions of the same target slot.
  Thus every pair of payloads has one-sided deficit at least

$ d_s = frac(alpha_(s - 1) b m, 6) . $

We have $d_s lt.eq B$. Lemma 7, with $T = L$ and marker length $B$,
  gives $Delta \( W_(s \, p) \( z \) \, W_(s \, p) \( z + u v_(s \, p) \) \) gt.eq L d_s$. Dividing by (3.6),

$ frac(Delta \( W_(s \, p) \( z \) \, W_(s \, p) \( z + u v_(s \, p) \) \), n_s) gt.eq
  frac(alpha_(s - 1) b, 12 \( 2 b - 1 \)) gt.eq alpha_(s - 1) / 24 = alpha_s . $

This proves the pointwise separation (3.4).

=== 3.3 The averaged analytic recurrence <sec:averaged>

Suppose $H : G_(s \, p) arrow.r ell_1$ meets the listed averaged budgets.
  We need the preceding level’s assertion for one component,
  but its hypotheses concern averages over that component’s entire state group.
  The right map is a direct sum over all settings of the other components.

For fixed $j$, let $Y_j = product_(ell eq.not j) G_ell$ and define

#[#set math.equation(numbering: n => "(3.9)")
 $ T_j \( x \) = frac(1, omega_j \| Y_j \|) xor.big_(y in Y_j) H \( x \, y \) \, wide x in G_j . $ <eq:slice-map>]

Here $H \( x \, y \)$ means that $x$ occupies coordinate $j$,
  and the finite direct sum of sequence spaces is identified with $ell_1$.
  For every $e in G_j$, additivity of the sum norm gives

#[#set math.equation(numbering: n => "(3.10)")
 $ V_(T_j) \( e \) = 1 / omega_j bb(E)_(x in G_j \, thin y in Y_j) ∥H \( x + e \, y \) - H \( x \, y \)∥_1 =
   frac(V_H \( tilde(e) \), omega_j) . $ <eq:slice-identity>]

The lifted step budgets therefore make $T_j$ satisfy all the preceding level’s hypotheses at once.
  The induction assertion yields

#[#set math.equation(numbering: n => "(3.11)")
 $ V_H \( a v_j \) lt.eq omega_j Q_(s - 1) wide \( 0 lt.eq a < p_j \) \, $ <eq:component-control>]

where $a = 0$ is immediate. No individual slice of $H$ is required to satisfy those hypotheses.

Apply Proposition 3 to the factors $G_j$ and their distinguished elements.
  The simultaneous budget, component control and (3.7) give

$ V_H \( u v_(s \, p) \) & lt.eq \( 2 P \)^(2 h) V_H \( tau \) + 2 /
  h sum_(j = 1)^b bb(E)_(a in bb(Z) \/ p_j bb(Z)) V_H \( a v_j \)\
 & lt.eq frac(2 \( 2 P \)^(2 h), L) + 2 / h sum_(j = 1)^b omega_j Q_(s - 1)\
 & = frac(2 \( 2 P \)^(2 h), L) + Q_(s - 1) / h = Q_s . $

This proves (3.5) and completes the simultaneous induction in Proposition 6.

The quotient $alpha_s \/ Q_s$ measures the resulting obstruction to embedding the word image.
  Indeed, let $f : W_(s \, p) \( G_(s \, p) \) arrow.r ell_1$ have distortion $D$,
  normalized so that $"ED" \( x \, y \) \/ D lt.eq ∥f \( x \) - f \( y \)∥_1 lt.eq "ED" \( x \, y \)$.
  Then $H = f compose W_(s \, p) \/ n_s$ satisfies the listed budgets by $"ED" lt.eq Delta$ and (3.3).
  On the other hand, (3.4) and $"ED" gt.eq Delta \/ 2$ give

$ frac(alpha_s, 2 D) lt.eq V_H \( v_(s \, p) \) lt.eq Q_s \, wide D gt.eq frac(alpha_s, 2 Q_s) . $

Thus pointwise word separation can be compared directly with averaged $ell_1$ displacement.
  It remains to estimate this quotient and retain it when the growing alphabet is replaced by binary symbols.

== 4 Binary encoding and the lower bound <sec:binary>

We replace each letter by a binary block of width logarithmic in the alphabet size.
  For insertion–deletion distance, the code below expands by at most its width and contracts by at most an
  absolute factor; hence transferring the preceding obstruction to binary words costs only the width times an
  absolute factor. The delimiter ensures that a code block whose bits all match consecutive positions must match
  one equal code block. We also prove the variable-length padding statement needed for the upper bound.

#thm([Lemma 4.1.])[
  (Binary delimiter code).  #emph[Let $cal(A)$ have size $A gt.eq 2$, let $t = ceil.l log_2 A ceil.r$,
    and put $w = 2 t + 3$. Assign distinct labels $\( a_1 \, dots.h \, a_t \) in { 0 \, 1 }^t$ to its letters.
    Let $c \( a \)$ be the prefix $110$ followed, in order, by the two-bit words $a_j 0$ for $j = 1 \, dots.h \,
    t$. Extend $c$ by concatenation to all finite strings, with $c \( epsilon \) = epsilon$. Then
#[#set math.equation(numbering: n => "(4.1)")
 $ 1 / 2 Delta \( x \, y \) lt.eq Delta \( c \( x \) \, c \( y \) \) lt.eq
   w Delta \( x \, y \) wide \( x \, y in cal(A)^(*) \) . $ <eq:code-unpadded>]

 For an integer $D gt.eq 0$ and $\| x \| lt.eq D$, set $c_D \( x \) = c \( x \) 0^(w \( D - \| x \| \)) in { 0 \,
   1 }^(w D)$. Then
#[#set math.equation(numbering: n => "(4.2)")
 $ 1 / 2 Delta \( x \, y \) lt.eq Delta \( c_D \( x \) \, c_D \( y \) \) lt.eq
   2 w Delta \( x \, y \) wide \( \| x \| \, \| y \| lt.eq D \) . $ <eq:code-padded>]

]
] <lem:binary-code>

#proof[
  We prove both lower bounds at once for $U = c \( x \) 0^r$ and $V = c \( y \) 0^s$, where $r \, s gt.eq
    0$ are arbitrary integers. The pattern $11$ occurs exactly at the start of a genuine letter block:
    zeros separate the label bits, every block ends in zero, and the added suffixes contain only zeros.
  Fix an increasing bit matching. Let $a_U \, a_V$ be its unmatched counts on the two sides and put $a = a_U +
    a_V$. Call a genuine block good if all of its bits are matched and their partners occupy consecutive
    positions. On either one side, at most $a$ genuine blocks are not good.
    For the $U$ side, a block containing an unmatched bit can be charged to one such bit,
    with distinct charges for distinct blocks; this accounts for at most $a_U$ blocks.
    Any other non-good block has all its bits matched, but some two consecutive block positions have partners
    separated by a nonempty open interval in $V$. Every bit in that interval is unmatched,
    since a partner would have to lie between consecutive positions in $U$. Charge one bit in the interval.
    The intervals for distinct blocks are disjoint by monotonicity,
    so this accounts for at most $a_V$ more blocks. The argument includes skipped intervals containing whole
    blocks or padding. Interchanging the two strings gives the same bound on the $V$ side.
  A good block begins with matched bits $11$. Its consecutive partners therefore start at a genuine block boundary
    on the other side. There are exactly $w$ partners, so they form that entire block.
    The two blocks are equal and encode the same letter; the target block is itself good.
    The same argument in reverse shows that the good blocks on the two sides pair bijectively,
    in increasing order. They give a letter matching between $x$ and $y$ whose loss is the number of non-good
    genuine blocks, at most $2 a$. Lemma 2 yields $Delta \( x \, y \) lt.eq 2 a$.
    Minimizing the bit loss proves the lower bounds, including empty strings and independently chosen zero suffixes.
  For the unpadded upper bound, implement each letter insertion or deletion by $w$ bit operations.
    For the padded bound, put $r = w \( D - \| x \| \)$ and $s = w \( D - \| y \| \)$.
    Transform the coded prefix while retaining its suffix, then adjust the suffix length:
  $ Delta \( c \( x \) 0^r \, c \( y \) 0^s \) lt.eq Delta \( c \( x \) \, c \( y \) \) + \| r - s \| lt.eq
    w Delta \( x \, y \) + w \| \| x \| - \| y \| #scale(x: 120%, y: 120%)[\|] lt.eq 2 w Delta \( x \, y \) . $
  The last inequality follows because one insertion or deletion changes length by one. ◻
]

=== 4.1 The quantitative obstruction <the-quantitative-obstruction>

First bound the recurrence in Proposition 6. For sufficiently large $k$, we have $2 P lt.eq P^(3 \/ 2)$ and

$ eta := frac(2 \( 2 P \)^(2 h), L) lt.eq 2 P^(3 h - b \/ 2) = 2 P^(- b \/ 5) lt.eq P^(- b \/ 6) lt.eq h^(- k) . $

For the last inequality, $P^(b \/ 6) = b^(b \/ 3) = b^(\( 100 \/ 3 \) k) gt.eq \( b \/ 10 \)^k = h^k$.
  Since $h gt.eq 2$, solving (3.2) gives

#[#set math.equation(numbering: n => "(4.3)")
 $ Q_k = 2 h^(- k) + eta sum_(j = 0)^(k - 1) h^(- j) lt.eq 2 h^(- k) + 2 eta lt.eq 4 h^(- k) . $ <eq:Q-small>]

The alphabet recurrence gives $A_s lt.eq \( 2 P + 1 \) \( 2 b \)^s$:
  the base case is immediate and $1 + \( 2 b - 1 \) A_(s - 1) lt.eq 2 b A_(s - 1)$.
  Hence $log A_k = O \( k log k \)$. Fix a prime $p in cal(P)$ and apply Lemma 8 to the alphabet of $W_(k \, p)$,
  without padding. Write $"enc"$ for the resulting concatenated code.
  Its width is $w = O \( k log k \)$, and all encoded words have the same length

#[#set math.equation(numbering: n => "(4.4)")
 $ N_k = w n_k = w #scale(x: 120%, y: 120%)[\(] 2 \( 2 b - 1 \) P^(b \/ 2) #scale(x: 120%, y: 120%)[\)]^k \, wide
   log N_k lt.eq C_(upright("len")) k^2 log k $ <eq:encoded-length>]

for an absolute $C_(upright("len"))$ and all sufficiently large $k$.

#thm([Proposition 4.2.])[
  #emph[For all sufficiently large $k$, every $ell_1$ embedding of
$ cal(W)_k = { "enc" \( W_(k \, p) \( z \) \) : z in G_(k \, p) } subset.eq { 0 \, 1 }^(N_k) $

 has distortion at least
#[#set math.equation(numbering: n => "(4.5)")
 $ frac(\( h \/ 24 \)^k, 16 w) gt.eq exp \( c_0 k log k \) $ <eq:distortion-k>]

 for an absolute constant $c_0 > 0$.]
] <prop:binary-lower>

#proof[
  Let $f$ be an injective embedding of $cal(W)_k$ with distortion $D$. Rescale it so that
  $ frac("ED" \( x \, y \), D) lt.eq ∥f \( x \) - f \( y \)∥_1 lt.eq
    "ED" \( x \, y \) wide \( x \, y in cal(W)_k \) \, $
  and define $H \( z \) = f \( "enc" \( W_(k \, p) \( z \) \) \) \/ \( w n_k \)$.
    For every listed step $\( e \, r \)$, the code’s upper bound and (3.3) give, at each state,
  $ ∥H \( z + e \) - H \( z \)∥_1 & lt.eq
    frac("ED" \( "enc" \( W_(k \, p) \( z + e \) \) \, "enc" \( W_(k \, p) \( z \) \) \), w n_k)\
 & lt.eq frac(w Delta \( W_(k \, p) \( z + e \) \, W_(k \, p) \( z \) \), w n_k) lt.eq r . $
  Thus $H$ meets the averaged hypotheses of Proposition 6.
  For $v = v_(k \, p)$, the lower bounds give, again at every state,
  $ ∥H \( z + v \) - H \( z \)∥_1 & gt.eq
    frac("ED" \( "enc" \( W_(k \, p) \( z + v \) \) \, "enc" \( W_(k \, p) \( z \) \) \), D w n_k)\
 & gt.eq frac(Delta \( "enc" \( W_(k \, p) \( z + v \) \) \, "enc" \( W_(k \, p) \( z \) \) \), 2 D w n_k)\
 & gt.eq frac(Delta \( W_(k \, p) \( z + v \) \, W_(k \, p) \( z \) \), 4 D w n_k) gt.eq frac(24^(- k), 4 D w) . $
  In particular, these designated pairs represent distinct words, although other state pairs may coincide.
    Averaging and using (3.5) and (4.3), we obtain
  $ frac(24^(- k), 4 D w) lt.eq V_H \( v \) lt.eq 4 h^(- k) \, wide D gt.eq frac(\( h \/ 24 \)^k, 16 w) . $
  Since $h = 10 k$ and $w = O \( k log k \)$, the logarithm of the last expression is $k log k - O \( k \) -
    O \( log k \)$. It is at least $c_0 k log k$ for all sufficiently large $k$. ◻
]

=== 4.2 A witness for every sufficiently large cap <a-witness-for-every-sufficiently-large-cap>

Set $t = log d$ and fix $a > 0$ small enough that $C_(upright("len")) a^2 lt.eq 1 \/ 2$. Choose

$ k = ⌊a sqrt(frac(t, log t))⌋ . $

For sufficiently large $d$, this depth is available and $log k lt.eq log t$. Equation (4.4) gives

$ log N_k lt.eq C_(upright("len")) k^2 log k lt.eq C_(upright("len")) a^2 t lt.eq t \, $

so $N_k lt.eq d$. After increasing the threshold on $d$,

$ k gt.eq a / 2 sqrt(frac(t, log t)) \, wide log k gt.eq 1 / 3 log t \, wide k log k gt.eq a / 6 sqrt(t log t) . $

Proposition 9 therefore proves the lower bound in (1.1) for binary strings.
  This direct choice of $k$ uses no estimate on gaps between successive lengths $N_k$.

Finally, choose two letters in any finite alphabet $Sigma$ of size at least two.
  Their strings form an isometric copy of binary edit distance.
  One inequality follows because every binary edit script is also a $Sigma$-script.
  For the reverse inequality, project all other letters to one of the chosen letters;
  each operation in a $Sigma$-script becomes at most one binary edit.
  Restricting an embedding to this subspace gives $E_Sigma \( d \) gt.eq
  E_({ 0 \, 1 }) \( d \)$ and completes the lower half of Theorem 1.

== 5 An upper bound uniform over finite alphabets <sec:upper>

The upper proof uses one external embedding theorem. We state the normalized form needed here from Theorem 7,
  printed page 7, of the August 19, 2005 author manuscript of Ostrovsky and Rabani [8].
  Their introduction also notes the larger-alphabet and varying-length extensions.
  The proof below supplies the complete uniform reduction from this fixed-length binary input.

#thm([Theorem 5.1.])[
  (Ostrovsky–Rabani, normalized form).  #emph[There is an absolute constant $C_0$ such that,
    for every integer $m gt.eq 3$, there is a map $g_m : { 0 \, 1 }^m arrow.r ell_1$ satisfying
#[#set math.equation(numbering: n => "(5.1)")
 $ "ED" \( u \, v \) lt.eq ∥g_m \( u \) - g_m \( v \)∥_1 lt.eq D_m "ED" \( u \, v \) \, wide D_m =
   exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] C_0 sqrt(log m thin log log m) #scale(x: 120%, y: 120%)[\)] .
   $ <eq:or>]

 Here $"ED"$ permits unit-cost substitutions as well as insertions and deletions.]
] <thm:or>

On the finite domain, the minimum pairwise image-to-edit-distance ratio of an embedding is positive;
  division by that ratio makes the theorem noncontracting without changing distortion.
  Its asymptotic expression is written with natural logarithms,
  and increasing $C_0$ absorbs any finite set of small lengths $m gt.eq 3$:
  mapping each binary string to a distinct coordinate vector has distortion at most $m$.

We reduce the alphabet to a number of labels depending only on $d$,
  then use Lemma 8 to encode and pad to one binary length. A final direct sum over all label maps will turn the
  pairwise probability estimate into one embedding of the whole domain.

#thm([Proposition 5.2.])[
  (Uniform alphabet bound).  #emph[There is an absolute constant $C$ such that,
    for every finite alphabet $Sigma$ with $\| Sigma \| gt.eq 2$,
#[#set math.equation(numbering: n => "(5.2)")
 $ E_Sigma \( d \) lt.eq exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] C sqrt(log d thin log log d)
   #scale(x: 120%, y: 120%)[\)] wide \( d gt.eq 3 \) . $ <eq:upper-conclusion>]

 Moreover, $E_Sigma \( 1 \) = 1$ and $1 lt.eq E_Sigma \( 2 \) lt.eq 2$.]
] <prop:uniform-upper>

#proof[
  Fix $d gt.eq 1$ and put $q = 4 d^2$. Choose a map $h : Sigma
    arrow.r \[ q \]$ by assigning independent uniform labels to the letters,
    and apply it letter by letter to strings. Equal original letters remain equal after relabeling,
    so every original increasing matching remains valid. Hence, for every outcome,
  #[#set math.equation(numbering: n => "(5.3)")
   $ Delta \( h \( x \) \, h \( y \) \) lt.eq Delta \( x \, y \) . $ <eq:hash-contraction>]
  For a fixed pair $x \, y in Sigma^(lt.eq d)$, let $S$ be the set of letters appearing in either string.
    Since $\| S \| lt.eq 2 d$, the union bound gives
  #[#set math.equation(numbering: n => "(5.4)")
   $ Pr \( h upright(" is not injective on ") S \) lt.eq binom(\| S \|, 2) / q lt.eq
     frac(\( 2 d \) \( 2 d - 1 \), 8 d^2) < 1 / 2 . $ <eq:hash-collision>]
  When $h$ is injective on this pair’s letters, equality of symbols is preserved in both directions.
    The available increasing matchings are then exactly the same, so
  #[#set math.equation(numbering: n => "(5.5)")
   $ Delta \( h \( x \) \, h \( y \) \) = Delta \( x \, y \) . $ <eq:hash-isometry>]
  For the alphabet $\[ q \]$, use the delimiter code with $t = ceil.l log_2 q ceil.r$, $w = 2 t + 3$,
    and binary length $m = w d$. We have $m gt.eq 7$, so Theorem 10 applies.
    For every $h$, the padded string $c_d \( h \( x \) \)$ has length $m$. The metric comparisons, (4.2) and (5.3) give
  #[#set math.equation(numbering: n => "(5.6)")
   $ ∥g_m \( c_d \( h \( x \) \) \) - g_m \( c_d \( h \( y \) \) \)∥_1 & lt.eq
     D_m Delta \( c_d \( h \( x \) \) \, c_d \( h \( y \) \) \)\
 & lt.eq 2 w D_m Delta \( x \, y \) lt.eq 4 w D_m "ED" \( x \, y \) . $ <eq:outcome-upper>]
  On the event in (5.5), the reverse estimate is
  #[#set math.equation(numbering: n => "(5.7)")
   $ ∥g_m \( c_d \( h \( x \) \) \) - g_m \( c_d \( h \( y \) \) \)∥_1 & gt.eq
     "ED" \( c_d \( h \( x \) \) \, c_d \( h \( y \) \) \)\
 & gt.eq 1 / 2 Delta \( c_d \( h \( x \) \) \, c_d \( h \( y \) \) \)\
 & gt.eq 1 / 4 Delta \( x \, y \) gt.eq 1 / 4 "ED" \( x \, y \) . $ <eq:outcome-lower>]
  Let $cal(H)$ be the finite set of all $q^(\| Sigma \|)$ label maps, with probabilities $p_h =
    q^(- \| Sigma \|)$. Define
  #[#set math.equation(numbering: n => "(5.8)")
   $ F \( x \) = xor.big_(h in cal(H)) p_h #scale(x: 120%, y: 120%)[\(] g_m \( c_d \( h \( x \) \) \) -
     g_m \( 0^m \) #scale(x: 120%, y: 120%)[\)] . $ <eq:upper-direct-sum>]
  This finite direct sum is an $ell_1$ vector, and the sum norm gives the exact identity
  $ ∥F \( x \) - F \( y \)∥_1 = bb(E)_h ∥g_m \( c_d \( h \( x \) \) \) - g_m \( c_d \( h \( y \) \) \)∥_1 . $
  Taking expectations in (5.6) and (5.7), using (5.4), yields
  #[#set math.equation(numbering: n => "(5.9)")
   $ 1 / 8 "ED" \( x \, y \) lt.eq ∥F \( x \) - F \( y \)∥_1 lt.eq 4 w D_m "ED" \( x \, y \) . $ <eq:upper-metric>]
  Thus $F$ is injective and has distortion at most $32 w D_m$.
    The empty string has image zero, since its padded code is $0^m$;
    its distance bounds are included in the same calculation.
  For $d gt.eq 3$, $w = O \( log d \)$ and $m = O \( d log d \)$ with absolute constants. Therefore
  $ log \( 32 w D_m \) = O \( log log d \) + O #h(-0.16667em) #scale(x: 120%, y: 120%)[\(]
    sqrt(log m thin log log m) #scale(x: 120%, y: 120%)[\)] =
    O #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] sqrt(log d thin log log d) #scale(x: 120%, y: 120%)[\)] \, $
  which proves (5.2), enlarging the absolute constant for finitely many initial values if necessary.
  For $d = 1$, all distinct strings in $Sigma^(lt.eq 1)$ have edit distance one,
    and $x mapsto e_x \/ 2$ is isometric. In general, every nonzero edit distance between strings of length at
    most $d$ lies between one and $d$: substitute the common-length part and then insert or delete the remaining
    symbols. The same coordinate-vector map has distortion at most $d$, giving $E_Sigma \( 2 \) lt.eq 2$.
    Distortion is always at least one. ◻
]

Together with the binary witnesses of Section 4, this proves Theorem 1.

#heading(level: 1)[References]
#bibitem([1])[A.~Andoni, M.~Deza, A.~Gupta, P.~Indyk and S.~Raskhodnikova.
  Lower bounds for embedding edit distance into normed spaces.
  In #emph[Proceedings of the Fourteenth Annual ACM--SIAM Symposium on Discrete Algorithms], pages 523--526, 2003.
  #link("https://www.cs.columbia.edu/~andoni/papers/k2n2.pdf")[Author manuscript].]
#bibitem([2])[S.~Khot and A.~Naor. Nonembeddability theorems via Fourier analysis.
  #emph[Mathematische Annalen], 334(4):821--852, 2006.
  #link("https://doi.org/10.1007/s00208-005-0745-0")[doi:10.1007/s00208-005-0745-0].
  #link("https://web.math.princeton.edu/~naor/homepage%20files/nonembed-final.pdf")[Author final manuscript].]
#bibitem([3])[R.~Krauthgamer and Y.~Rabani. Improved lower bounds for embeddings into $L_1$.
  #emph[SIAM Journal on Computing], 38(6):2487--2498, 2009.
  #link("https://doi.org/10.1137/060660126")[doi:10.1137/060660126].]
#bibitem([4])[V.~I.~Levenshtein. Binary codes capable of correcting deletions, insertions, and reversals.
  #emph[Soviet Physics Doklady], 10(8):707--710, 1966. Russian original:
  #emph[Doklady Akademii Nauk SSSR], 163(4):845--848, 1965.
  #link("https://www.mathnet.ru/eng/dan31411")[Original publication record].]
#bibitem([5])[N.~Linial, E.~London and Y.~Rabinovich. The geometry of graphs and some of its algorithmic
  applications. #emph[Combinatorica], 15(2):215--245, 1995.
  #link("https://doi.org/10.1007/BF01200757")[doi:10.1007/BF01200757].]
#bibitem([6])[OpenAI. Finite-Circle Obstructions, Binary Codes, and Histogram Embeddings for Edit Distance.
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Finite-Circle-Obstructions-Binary-Codes-and-Histogram-Embeddings-for-Edit-Distance-September-27-2026/paper.pdf")[OAI:Finite-Circle-Obstructions-Binary-Codes-and-Histogram-Embeddings-for-Edit-Distance-September-27-2026],
  2026.]
#bibitem([7])[OpenAI. Tree Constructions for the $ell_1$ Distortion of Binary Edit Distance.
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Tree-Constructions-for-the-l1-Distortion-of-Binary-Edit-Distance-September-27-2026/paper.pdf")[OAI:Tree-Constructions-for-the-l1-Distortion-of-Binary-Edit-Distance-September-27-2026],
  2026.]
#bibitem([8])[R.~Ostrovsky and Y.~Rabani. Low distortion embeddings for edit distance.
  #emph[Journal of the ACM], 54(5), Article 23, 2007.
  #link("https://doi.org/10.1145/1284320.1284322")[doi:10.1145/1284320.1284322].
  Preliminary author manuscript dated August 19, 2005,
  #link("https://web.cs.ucla.edu/~rafail/PUBLIC/68.pdf")[Theorem~7, printed page~7].]
#bibitem([9])[J.~B.~Rosser and L.~Schoenfeld. Approximate formulas for some functions of prime numbers.
  #emph[Illinois Journal of Mathematics], 6(1):64--94, 1962.
  #link("https://doi.org/10.1215/ijm/1255631807")[doi:10.1215/ijm/1255631807].]
#bibitem([10])[R.~A.~Wagner and M.~J.~Fischer. The string-to-string correction problem.
  #emph[Journal of the ACM], 21(1):168--173, 1974.
  #link("https://doi.org/10.1145/321796.321811")[doi:10.1145/321796.321811].]
