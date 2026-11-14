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

#align(center)[#text(size: 16pt, weight: "bold")[Subset Sum in Time $O \( 2^(0.49 n) \)$]]
#align(center)[OpenAI]
#align(center)[October 4, 2026]

== 1 Introduction <sec:introduction>

An instance of #emph[Subset Sum], with $n gt.eq 2$, consists of positive integers $a_1 \, dots.h \,
  a_n$ and a nonnegative integer $t$. The question is whether there is a set $I subset.eq \[ n \] = { 1 \,
  dots.h \, n }$ with $sum_(i in I) a_i = t$. Equal input integers are allowed, and the empty subset is allowed.
  We measure the exponential part of the running time in the number $n$ of input integers,
  rather than in their total encoding length.

Subset Sum is one of the foundational NP-complete problems,
  appearing as Knapsack in Karp’s list #cite(label("Karp1972")).
  Its simple formulation has made it a basic problem in exact exponential-time algorithms and cryptanalysis.
  The meet-in-the-middle algorithm of Horowitz and Sahni #cite(label("HorowitzSahni1974")) divides the input into
  two parts, lists their subset sums, and searches for complementary sums.
  This gives the familiar $2^(n \/ 2)$ time scale. Schroeppel and Shamir #cite(label("SchroeppelShamir1981"))
  preserved that time scale while reducing the space exponent to $1 \/ 4$.
  More recently, Chen, Jin, Randolph, and Servedio #cite(label("CJRS2023")) obtained a randomized worst-case
  running time $O \( 2^(n \/ 2) n^(- gamma) \)$ for a constant $gamma >
  0.5023$ in word-RAM and circuit-RAM models with polynomial word length.
  A fixed reduction of the exponential rate below $1 \/ 2$ is a different objective from such polynomial-factor
  savings. We establish that improvement, with ordinary $O \( 2^(0.49 n) \)$ running time, in the precise model below.

=== 1.1 Model and main result <model-and-main-result>

Let

$ b = max {1 \, ⌈log_2 #scale(x: 120%, y: 120%)[\(] 1 + max { t \, a_1 \, dots.h \,
  a_n } #scale(x: 120%, y: 120%)[\)]⌉} $

be the maximum bit length of the input integers and target. The machine is a word RAM with word length

#[#set math.equation(numbering: n => "(1.1)")
 $ w = ⌈4 #scale(x: 120%, y: 120%)[\(] n + b + log_2 \( n + 2 \) #scale(x: 120%, y: 120%)[\)]⌉ . $ <eq:word-length>]

Each input integer occupies one word in read-only random-access memory.
  Unit-cost operations are word reads and writes, indirect addressing, comparisons, addition, subtraction,
  multiplication, integer quotient and remainder with a nonzero divisor, bitwise Boolean operations, and shifts.
  Each operation has a constant number of $w$-bit inputs and outputs.
  Arithmetic exceeding these limits is implemented by multiple word operations and charged accordingly.
  A fresh independent uniform $w$-bit random word costs one operation. Randomness is one-way:
  an earlier random word can be reused only if it has been retained in writable memory.
  There is no random oracle, uncharged external storage, or separate workspace bound.

The algorithm must be a single finite program for all $n$ and $b$,
  without advice or externally supplied tables depending on $n$ or the input.
  All preprocessing, table construction, input accesses, and random sampling are included in its running time.

#thm([Theorem 1.1.])[
  #emph[There is a uniform randomized classical algorithm $cal(A)$ for Subset Sum with the following properties in
    the word-RAM model (1.1). For every input with $n gt.eq 2$,
    the algorithm halts on every execution and outputs the correct answer with probability at least $2 \/ 3$.
    For every fixed positive integer $c$, there are constants $C_c > 0$ and $N_c gt.eq
    2$ such that every input with $n gt.eq N_c$ and $b lt.eq n^c$ is processed,
    on every outcome of the random choices, in at most
$ C_c thin 2^(0.49 n) $

 word operations. The program is not given $c$ and does not depend on $c$.]
] <thm:main>

The probability in the theorem is over the algorithm’s internal random words, for each fixed input.
  In particular, no distributional assumption is made on the input integers.
  The running-time bound applies even to executions on which the answer is incorrect.
  Our intermediate bound has the form $2^(0.489995 n) "poly" \( n + b + 2 \)$;
  the strict exponent slack absorbs the polynomial factor separately for every fixed $c$.

=== 1.2 Related approaches <related-approaches>

Two other directions explain both the progress on Subset Sum and the difficulty of a worst-case improvement in
  $n$. Pseudopolynomial algorithms measure their complexity in the numerical target $t$.
  Bellman’s dynamic-programming approach #cite(label("Bellman1957")) yields $O \( n t \)$ time.
  Koiliaris and Xu #cite(label("KoiliarisXu2017")) improved this bound deterministically,
  and Bringmann #cite(label("Bringmann2017")) obtained a randomized $tilde(O) \( n + t \)$ algorithm.
  Chan #cite(label("Chan2026")) subsequently obtained a deterministic near-linear pseudopolynomial algorithm.
  These bounds are particularly effective for small targets; polynomial #emph[bit length], however,
  permits much larger targets. Here and in historical comparisons, $tilde(O)$ suppresses polylogarithmic factors.

Representation methods provide a different kind of saving.
  The method introduced by Howgrave-Graham and Joux #cite(label("HGJ2010")), and developed by Becker, Coron,
  and Joux #cite(label("BCJ2011")), represents one solution by many pairs of partial objects and then searches a
  filtered fraction of those representations. Their improvements concern random instances,
  not a guarantee for every input. Austrin, Kaski, Koivisto,
  and Nederlof #cite(label("AKKN2016")) developed algorithms exploiting input blocks with many distinct sums
  through representations, or blocks with few distinct sums through faster enumeration of those sums.
  Nederlof and Węgrzycki #cite(label("NederlofWegrzycki2021")) used related ideas to improve the space bound below
  the Schroeppel–Shamir exponent.

Related work concerns #emph[Subset Balancing]: given integers $v_i$ and a fixed finite coefficient set $C subset
  bb(Z)$, find a nonzero $x in C^n$ satisfying $sum_i v_i x_i = 0$.
  Randolph and Węgrzycki #cite(label("RandolphWegrzycki2026")) give worst-case exponent savings for several
  coefficient sets, though not for ordinary Subset Sum. Their compatibility certificates recover valid
  representation pairs without inspecting all invalid pairs.
  Our alias extraction uses the representation and distinct-sum perspective for a different task:
  listing modular false positives so that their contributions can be removed from an estimated checksum.

=== 1.3 Proof overview <proof-overview>

The proof separates two complementary tasks: estimating a modular target bin and identifying the false positives
  created by the modulus. First, random tie-breaking weights transform the original problem into polynomially many
  targets for new positive integer weights $c_1 \, dots.h \, c_n$.
  The isolation lemma of Mulmuley, Vazirani, and Vazirani #cite(label("MVV1987")) ensures that,
  with high constant probability, some transformed target has exactly one solution whenever the original instance
  is positive. A preliminary meet-in-the-middle test handles inputs whose partial subset sums have sufficiently
  small support. Both reductions are developed in Section 2.

For a prime $P$, write $e_P \( x \) = exp \( 2 pi upright(i) x \/ P \)$.
  With independent uniform residues $phi.alt_1 \, dots.h \, phi.alt_n$ modulo $P$, assign a subset $I$ the phase

$ chi \( I \) = e_P (sum_(i in I) phi.alt_i) . $

For each transformed target $t'$, a subset is an #emph[alias] if its sum is $t'$ modulo $P$ but not over the
  integers. The identity

#[#set math.equation(numbering: n => "(1.2)")
 $ sum_(sum_(i in I) c_i = t') chi \( I \) = sum_(sum_(i in I) c_i equiv t' med \( mod med P \)) chi \( I \) -
   sum_(I upright(" an alias")\
upright("for ") t') chi \( I \) $ <eq:overview-subtraction>]

is the organizing principle. On a negative instance the left side is zero for every transformed target;
  an isolated positive target leaves a single phase of modulus one.
  The two sums on the right can be much larger, so their difference must be recovered to small #emph[absolute]
  error. A relative approximation to the modular sum would not suffice.
  We choose a random prime modulus larger than the desired running time,
  so neither scanning all residues nor evaluating every Fourier frequency is affordable.
  We estimate the modular sum and subtract the phases of a complete list of aliases.

===== 1.3.1 A checksum without a full Fourier transform. <a-checksum-without-a-full-fourier-transform.>

Writing $V_(t')$ for the modular sum in (1.2), Fourier inversion gives

$ V_(t') = 1 / P sum_(k = 0)^(P - 1) J_(t') \( k \) \, wide J_(t') \( k \) =
  e_P \( - k t' \) product_(i = 1)^n #scale(x: 120%, y: 120%)[\(] 1 +
  e_P \( phi.alt_i + k c_i \) #scale(x: 120%, y: 120%)[\)] . $

For each fixed $k$, independent uniform phases give $bb(E)_phi.alt \| J_(t') \( k \) \|^2 = 2^n$.
  Thus the elementary second-moment bound for uniform frequency sampling does not give the required running time.
  For a chosen digit base $L$, writing $k = h L + l$ expresses the phase vector $\( phi.alt_i + k c_i \)_i$ as the
  difference between $\( phi.alt_i + h L c_i \)_i$ and $\( - l c_i \)_i$, all modulo $P$.
  These high- and low-digit vectors form two lists. The filters must keep the stored lists short,
  cover every frequency, and control the second moment of the resulting estimate.
  A table specifies random coordinate shifts, with some coordinates ignored;
  a sum of logarithmic density scores tests each vector against the table.
  A #emph[match] consists of a table and a digit pair whose two vectors both pass.
  This two-sided organization is related to asymmetric locality-sensitive filtering #cite(label("Christiani2017")).

To analyze coverage of a fixed digit pair, we temporarily change the random-shift law at each coordinate.
  Three bounded functions record the two resulting mean scores and the likelihood-ratio cost of that change.
  A #emph[pattern] consists of coarse averages of these functions on coordinate blocks;
  the tests are chosen separately for each pattern. Grouping coordinates into blocks makes the number of patterns
  and the cost of generating block tables subexponential. Comparing this auxiliary law with the actual table law
  shows that, with high probability, every frequency appears in a match for its own pattern.
  Two fixed inequalities for circle densities control the second moment.
  Section 3 states these inequalities, and Appendix 7 proves them with rational enclosures and analytic quadrature
  bounds.

Patterns with a sufficiently small high-probability bound on their total match count are summed directly.
  For the other patterns, the algorithm samples matches and divides by the number of matches representing the
  sampled frequency. This is the inverse-coverage correction familiar from union-size
  estimation #cite(label("KLM1989")), applied here to a complex weighted sum.
  Theorem 9 proves the resulting absolute-error estimate for arbitrary input residues,
  independently of the distinct-sum condition used in alias recovery.
  Random phases make the coordinates independent at each fixed frequency,
  even though the original input is arbitrary. The second-moment calculation uses the original phase law,
  not the law conditioned on successful filtering.

===== 1.3.2 Extracting only aliases. <extracting-only-aliases.>

The second procedure, in Section 5, gives each subset many representations by two records.
  After randomly complementing some subset-indicator variables,
  choose a shared coordinate block and partition its complement into a left and a right side.
  Each record consists of a subset of its side together with a #emph[mask], a subset of the shared block.
  Disjoint masks give an actual subset; overlapping masks count their common coordinates twice in the sum of the
  record weights. A small auxiliary modulus reduces the record lists. The analysis proves a dichotomy:
  either the preliminary distinct-sum test succeeds with high probability,
  or enough representations survive to recover every alias with high probability.
  The enumeration omits every pair satisfying the corresponding exact integer equation,
  including pairs with overlapping masks. This omission is crucial:
  each remaining pair has a nonzero integer discrepancy, so a random-prime divisor bound controls the number of
  pairs that pass the main modulus. Disjoint masks are checked only after this bounded enumeration.

Once the reconstructed left side of (1.2) has error less than $1 \/ 4$,
  comparison with the threshold $1 \/ 2$ separates an empty bin from an isolated one.
  Thus isolation removes any need for a separate anti-concentration theorem for sums of phases.
  Section 6 assembles the procedures and proves Theorem 1, including finite-precision arithmetic,
  capped random sampling, and a running-time bound on every execution.

== 2 Isolation, distinct sums, and prime collisions <sec:setup>

We first reduce detection to finding an isolated exact sum.
  We then give an exact preliminary search that succeeds when a random half of the coordinates has sufficiently
  few distinct subset sums. The complementary case supplies the combinatorial information needed later to recover
  modular aliases. Finally, we record a random-prime collision bound for the nonzero integer discrepancies arising
  in alias extraction.

All logarithms are to base $2$, except for $ln$. Write $\[ n \] = { 1 \, dots.h \, n }$, and for weights $v_1 \,
  dots.h \, v_n$ write $v \( I \) = sum_(i in I) v_i$ for $I subset.eq \[ n \]$. Empty sums are zero.
  All constants and decimal parameters in the proof are fixed, independently of the input.

=== 2.1 Isolating one exact target <isolating-one-exact-target>

The following application of the Isolation Lemma of Mulmuley, Vazirani,
  and Vazirani #cite(label("MVV1987")) allows a complex-valued checksum to detect a solution without an
  anti-concentration argument. Choose a power of two $N_0$ with $12 n lt.eq N_0 < 24 n$,
  and draw independent uniform integers $u_i in { 1 \, dots.h \, N_0 }$. Define

#[#set math.equation(numbering: n => "(2.1)")
 $ C = 1 + n N_0 \, wide c_i = C a_i + u_i \, wide t_s = C t + s quad \( 0 lt.eq s lt.eq n N_0 \) . $ <eq:transformed>]

The transformed weights and targets have $O \( b + log n \)$ bits, and there are $n N_0 + 1 = O \( n^2 \)$ targets.

#thm([Lemma 2.1.])[
  (Isolation).  #emph[For every choice of the tie weights, there is a subset $I
    subset.eq \[ n \]$ with $a \( I \) = t$ if and only if there are $s in { 0 \, dots.h \,
    n N_0 }$ and $I subset.eq \[ n \]$ with $c \( I \) = t_s$.
    If the original instance has a solution, then with probability at least $11 \/
    12$ at least one transformed target $t_s$ has exactly one representing subset.]
] <lem:isolation>

#proof[
  The identity $c \( I \) = t_s$ gives $C \( a \( I \) - t \) = s - u \( I \)$.
    Since $s \, u \( I \) in \[ 0 \, n N_0 \]$ and $C > n N_0$, this forces $a \( I \) = t$ and $u \( I \) = s$.
    Conversely, every original solution represents the transformed target indexed by $s = u \( I \)$.
  Let $cal(F) = { I subset.eq \[ n \] : a \( I \) = t }$, and suppose $cal(F) eq.not diameter$.
    Fix an index $i$ and all tie weights other than $u_i$. The minimum tie weight among members of $cal(F)$
    containing $i$ has the form $A_i + u_i$, while the minimum among members not containing $i$ is a constant
    $B_i$. A missing family can be assigned minimum $+ oo$. If both families are nonempty,
    their two minima coincide for at most one value of $u_i$.
    Consequently, the probability that they coincide is at most $1 \/ N_0$.
  If $u$ has two distinct minimum-weight members of $cal(F)$, they differ at some index $i$,
    and the two minima just described coincide there. A union bound shows that the minimum is unique with
    probability at least $1 - n \/ N_0 gt.eq 11 \/ 12$. Its tie weight $s$ then indexes an exact bin containing
    just this subset, by the first part of the proof. ◻
]

=== 2.2 Deficiency and the preliminary search <deficiency-and-the-preliminary-search>

For the rest of this section, fix the transformed weights $c_i$.
  For $V subset.eq \[ n \]$ define its subset-sum support and its deficiency by

#[#set math.equation(numbering: n => "(2.2)")
 $ Sigma \( V \) = { c \( I \) : I subset.eq V } \, wide d \( V \) = \| V \| -
   log \| Sigma \( V \) \| . $ <eq:deficiency>]

Thus $d \( V \)$ is the exponent saved by storing distinct subset sums instead of all $2^(\| V \|)$ subsets:
  $\| Sigma \( V \) \| = 2^(\| V \| - d \( V \))$. Large deficiency means that many subsets have the same sum.
  These definitions make sense for arbitrary integer weights, not only the positive transformed weights.

#thm([Lemma 2.2.])[
  (Properties of deficiency).  #emph[For arbitrary fixed integer weights, $d \( diameter \) =
    0$ and $d \( V \) gt.eq 0$. For $i in.not V$,
$ 0 lt.eq d \( V union { i } \) - d \( V \) lt.eq 1 . $

 For disjoint $U \, V subset.eq \[ n \]$,
$ d \( U union V \) gt.eq d \( U \) + d \( V \) . $

 If $V \, V'$ have equal size and differ by exchanging one index, then $\| d \( V \) - d \( V' \) \| lt.eq 1$.]
] <lem:deficiency>

#proof[
  There are at most $2^(\| V \|)$ subset sums, and the empty sum always belongs to the support.
    Adding $i$ replaces $Sigma \( V \)$ by $Sigma \( V \) union \( c_i + Sigma \( V \) \)$,
    whose cardinality lies between $\| Sigma \( V \) \|$ and $2 \| Sigma \( V \) \|$.
    This proves the increment bounds. For disjoint $U \, V$, $Sigma \( U union V \) = Sigma \( U \) +
    Sigma \( V \)$ has cardinality at most $\| Sigma \( U \) \| thin \| Sigma \( V \) \|$, giving superadditivity.
    Finally, in an exchange write $V = U union { i }$ and $V' = U union { j }$.
    Both deficiencies lie in $\[ d \( U \) \, d \( U \) + 1 \]$. ◻
]

#thm([Lemma 2.3.])[
  (Random restrictions).  #emph[Let $V_q$ be a uniformly random $q$-element subset of $\[ n \]$, for $0 lt.eq
    q lt.eq n$. Then
$ "Var" d \( V_q \) lt.eq q . $

 Moreover, $bb(E) d \( V_q \)$ is nondecreasing in $q$.]
] <lem:half-variance>

#proof[
  Expose an ordered sample $X_1 \, dots.h \, X_q$ without replacement, and let
  $ M_r = bb(E) #scale(x: 120%, y: 120%)[\[] d \( { X_1 \, dots.h \, X_q } \) divides X_1 \, dots.h \,
    X_r #scale(x: 120%, y: 120%)[\]] quad \( 0 lt.eq r lt.eq q \) . $
  Fix a possible prefix of length $r - 1$ and compare two possible choices $i \, j$ for $X_r$.
    Couple the remaining ordered samples by interchanging $i$ and $j$.
    The resulting final sets either coincide, if the remainder contains the other index,
    or differ by the exchange $i arrow.l.r j$. By Lemma 3, their deficiencies differ by at most $1$.
    Thus the possible conditional values of $M_r$, given the prefix of length $r - 1$,
    lie in an interval of length at most $1$. Since $M_(r - 1)$ is their mean, $\| M_r - M_(r - 1) \| lt.eq 1$.
    The martingale differences are orthogonal in $L^2$, so
  $ "Var" d \( V_q \) = sum_(r = 1)^q bb(E) \( M_r - M_(r - 1) \)^2 lt.eq q . $
  The case $q = 0$ is immediate. To compare expectations for consecutive sizes, use the first $q$ and first $q +
    1$ entries of one uniform random permutation, and apply the monotonicity in Lemma 3. ◻
]

We now use distinct sums in the meet-in-the-middle algorithm of Horowitz and
  Sahni #cite(label("HorowitzSahni1974")). Related distinctions between small subset-sum supports and the
  complementary regime appear in earlier Subset Sum algorithms #cite(label("AKKN2016"))
  #cite(label("NederlofWegrzycki2021")). The procedure can stop without deciding the instance;
  that outcome means only that the later algorithm must be run.

#thm([Proposition 2.4.])[
  (Capped preliminary search).  #emph[Given fixed transformed weights and targets from (2.1),
    there is a randomized procedure that either returns the correct decision for the original instance or returns
    CONTINUE. On every execution its running time is at most
$ 2^(0.489985 n) "poly" \( n + b + 2 \) . $

 If $V$ is uniform among the $floor.l n \/ 2 floor.r$-element subsets and $bb(E) d \( V \) > 0.01004 n$,
   then the probability of CONTINUE is $O \( 1 \/ n \)$, uniformly in the fixed weights.]
] <prop:preliminary>

#proof[
  Choose a uniform $floor.l n \/ 2 floor.r$-element set $V$,
    returning CONTINUE if the capped sampler described below fails.
    Construct the two sorted lists of distinct subset sums on $V \, \[ n \] \\ V$, one side at a time.
    Starting with ${ 0 }$, insert an index $i$ by merging the current list with its translate by $c_i$ and
    removing duplicate values. Cap every list at
  $ B_n = 2^(ceil.l 0.489985 n ceil.r) . $
  If a merge produces more than $B_n$ distinct entries, stop immediately and return CONTINUE.
    Otherwise, for every $s$ check the two final sorted lists for a pair summing to $t_s$.
    A linear scan suffices for each target. Return YES exactly when such a pair exists.
    Lemma 2 proves correctness whenever this search finishes.
    Each merge takes $O \( B_n \)$ list operations before completion or interruption,
    and there are only polynomially many merges and target scans.
    The bit lengths noted after (2.1) give the stated running time.
    Intermediate support sizes never exceed the final support size,
    so a side completes whenever its final support has at most $B_n$ entries.
  To sample $V$, choose its elements successively without replacement.
    When $k$ indices remain, use the low $ceil.l log k ceil.r$ bits of a fresh random word to propose an index,
    rejecting values at least $k$. Allow at most $n^2$ proposals per choice and return CONTINUE if all are
    rejected. The sampler uses at most $n^3$ proposals and its total failure probability is at most $n 2^(- n^2)$.
    Conditional on no failure, $V$ is uniform because the success probability of each choice depends only on $k$,
    not on the selected index.
  Suppose now that $bb(E) d \( V \) > 0.01004 n$. Both side sizes have expected deficiency greater than $0.01004
    n$, by Lemma 4; each side has variance at most $n$. Chebyshev’s inequality therefore gives, for either side $U$,
  $ Pr { d \( U \) < 0.010025 n } lt.eq frac(n, \( 0.000015 n \)^2) = O \( 1 \/ n \) . $
  When neither exceptional event occurs,
  $ log \| Sigma \( U \) \| = \| U \| - d \( U \) lt.eq 0.489975 n + 1 / 2 lt.eq 0.489985 n $
  for all sufficiently large $n$. Both lists then fit under the cap, and the procedure decides the instance.
    A union bound, including the sampler-failure probability $n 2^(- n^2)$, proves the assertion. ◻
]

The expectation in Proposition 5 is used only in the analysis; the algorithm does not evaluate it.
  For each fixed choice of the tie weights, either the preliminary search decides with probability $1 -
  O \( 1 \/ n \)$, or

#[#set math.equation(numbering: n => "(2.3)")
 $ bb(E)_(V subset.eq \[ n \] upright(" uniform")\
\| V \| = floor.l n \/ 2 floor.r) d \( V \) lt.eq 0.01004 n . $ <eq:low-deficiency>]

The alias-recovery argument will use this latter inequality. A CONTINUE outcome is not a certificate that it holds.

=== 2.3 A collision bound for random primes <a-collision-bound-for-random-primes>

Reduction modulo a random prime makes any fixed false integer equality unlikely.
  The following elementary bound is the only number-theoretic estimate needed for that purpose.

#thm([Lemma 2.5.])[
  (Random-prime collisions).  #emph[There are absolute constants $K$ and $L_(*)$ such that the following holds.
    For an integer $L gt.eq L_(*)$, let $p$ be uniform among the primes in $\[ 2^L \, 2^(L + 1) \)$.
    If $D$ is a nonzero integer with $\| D \| < 2^B$, where $B gt.eq 1$, then
$ Pr { D equiv 0 med \( mod med p \) } lt.eq K B L thin 2^(- L) . $

 The same bound applies to the collision of two fixed unequal integers whose difference has absolute value less
   than $2^B$.]
] <lem:prime-collision>

#proof[
  The prime number theorem gives at least $c_0 2^L \/ L$ primes in the specified interval for an absolute $c_0 >
    0$ and all sufficiently large $L$. An explicit bound of this form is also given by Rosser and
    Schoenfeld #cite(label("RosserSchoenfeld1962")) Corollary 3.
    The nonzero integer $D$ has fewer than $B$ distinct prime divisors,
    since their product is at most $\| D \|$ and each is at least $2$.
    Dividing this count by the number of available primes proves the claim.
    For two unequal integers, apply it to their difference. ◻
]

== 3 A fixed filtering construction <sec:filtering>

The squared magnitude of the Fourier term in the overview is a product of coordinate factors $M \( x \)^2 = 2 +
  2 cos x$. We construct scores for two tests on pairs of digit vectors,
  choosing them to satisfy $M^2$-weighted moment bounds that control the error of the resulting estimator.
  Everything constructed in this section is fixed independently of the input.

Write $bb(T) = bb(R) \/ \( 2 pi bb(Z) \)$ with normalized Lebesgue measure;
  every integral below includes the factor $1 \/ \( 2 pi \)$.
  Consider one pair of coordinates $y \, z in bb(T)$ with difference $x = y - z$.
  A common uniform shift $theta$ gives $w = z - theta$ uniform on $bb(T)$ and $y - theta = x + w$.
  The tests will separately score these two shifted coordinates.

Start with any strictly positive continuous probability densities $f \, g$ on $bb(T)$.
  For a fixed difference $x$, the formula

#[#set math.equation(numbering: n => "(3.1)")
 $ Q \( x \) = integral_(bb(T)) f \( x + w \) g \( w \) thin d w \, wide K_x \( w \) =
   frac(f \( x + w \) g \( w \), Q \( x \)) $ <eq:filter-kernel>]

defines a strictly positive probability density in $w$. Replacing the uniform law of $w$ by $K_x$ weights each
  shift by the product of its two density values. The actual tests use the normalized powers

$ kappa = 1.0315 \, wide f_(*) = frac(f^kappa, integral_(bb(T)) f^kappa) \, wide g_(*) =
  frac(g^kappa, integral_(bb(T)) g^kappa) . $

Under the new law, record the expected base-two log likelihood ratio against the uniform law and the expected
  scores on the two sides:

#[#set math.equation(numbering: n => "(3.2)")
 $ D \( x \) & = integral_(bb(T)) K_x \( w \) log K_x \( w \) thin d w \,\
A \( x \) & = integral_(bb(T)) K_x \( w \) log f_(*) \( x + w \) thin d w \,\
E \( x \) & = integral_(bb(T)) K_x \( w \) log g_(*) \( w \) thin d w \,\
u \( x \) & = A \( x \) + E \( x \) - D \( x \) \, wide v \( x \) = 2 D \( x \) - A \( x \) -
  E \( x \) . $ <eq:filter-scores>]

Thus $D$ measures the cost of this change of law, while $A \, E$ give the score thresholds it can support.
  Products of these one-coordinate laws will prove that the block tests cover each frequency. In particular,

#[#set math.equation(numbering: n => "(3.3)")
 $ D \( x \) gt.eq 0 \, wide D \( x \) - A \( x \) gt.eq 0 \, wide D \( x \) - E \( x \) gt.eq
   0 . $ <eq:filter-entropy-order>]

Indeed, the three quantities are the relative entropies of $K_x$ with respect to the densities $1$,
  $f_(*) \( x + dot.op \)$, and $g_(*)$, respectively. For completeness, if $p \,
  q$ are positive probability densities, concavity of $ln$ gives

$ integral p ln \( q \/ p \) lt.eq ln integral q = 0 \, $

which proves the asserted nonnegativity.

We now choose the densities and numerical parameters. The modulus will have about $eta n$ bits,
  and the estimator will use about $2^(tau n)$ operations, before rounding slack and subexponential factors.
  The differences $Delta$ and $Gamma$ are the exponent budgets that enter its sampling and list-size bounds:

#[#set math.equation(numbering: n => "(3.4)")
 $ eta = 0.51772 \, wide tau = 0.48996 \, wide Delta = eta - tau = 0.02776 \,\
Gamma = 2 tau - eta = 0.46220 \, wide a = Delta \/ Gamma \, wide epsilon.alt = 10^(- 8) . $ <eq:filtering-constants>]

The constant $epsilon.alt$ allows fixed-accuracy evaluation of the scores. Define the trigonometric polynomials

#[#set math.equation(numbering: n => "(3.5)")
 $ r \( x \) = sum_(j = 1)^6 r_j cos \( j x \) \, wide s \( x \) = sum_(j = 1)^6 s_j cos \( j x \) \,
   $ <eq:filter-polynomials>]

where

$ \( r_1 \, dots.h \, r_6 \) & = \( 0.851 \, 0.466 \, 0.325 \, 0.253 \, 0.224 \, - 0.314 \) \,\
\( s_1 \, dots.h \, s_6 \) & = \( 1.281 \, - 0.938 \, 0.731 \, - 0.559 \, 0.391 \, 0.110 \) . $

Put $F = 2^r$, $G = 2^s$, and use the positive normalized densities

$ Z_f = integral_(bb(T)) F \, wide Z_g = integral_(bb(T)) G \, wide f = F \/ Z_f \, wide g = G \/ Z_g $

in the preceding definitions. These explicit coefficients give the following strict inequalities,
  where $M \( x \) = \| 1 + e^(i x) \|$.

#thm([Proposition 3.1.])[
  (Filtering moments).  #emph[The functions in (3.2) satisfy
#[#set math.equation(numbering: n => "(3.6)")
 $ integral_(bb(T)) M \( x \)^2 2^(8.5 \( Delta - u \( x \) \)) thin d x & < 2^0.5168 \,\
integral_(bb(T)) M \( x \)^2 2^(8.3 \( a v \( x \) - u \( x \) \)) thin d x & < 2^0.5168 .
  $ <eq:continuous-filtering-moments>]

]
] <prop:filtering-moments>

#proof[
  Appendix 7 proves both inequalities by a 64-point quadrature with explicit rational enclosures and analytic
    error bounds. ◻
]

The algorithm uses a finite circle, not a continuous one.
  For an integer $P gt.eq 2$, identify $j in bb(Z) \/ P bb(Z)$ with the angle $2 pi j \/ P$,
  and replace #emph[every] integral in the definitions above by the normalized average $P^(- 1)
  sum_(j = 0)^(P - 1)$. In particular the normalizers of $f \, g \, f_(*) \,
  g_(*)$ and the definition of $K_x$ all use this finite average.
  We use the same notation for these finite functions when the underlying circle has been specified.

#thm([Lemma 3.2.])[
  (Finite filtering data).  #emph[ There is an absolute integer $P_0$ such that for every $P gt.eq
    P_0$ the finite functions satisfy (3.3) and
#[#set math.equation(numbering: n => "(3.7)")
 $ 1 / P sum_(x in bb(Z) \/ P bb(Z)) M \( x \)^2 2^(8.5 \( Delta - u \( x \) \)) & < 2^0.5169 \,\
1 / P sum_(x in bb(Z) \/ P bb(Z)) M \( x \)^2 2^(8.3 \( a v \( x \) - u \( x \) \)) & < 2^0.5169 .
  $ <eq:finite-filtering-moments>]

 There is an absolute bound, independent of $P$, for the absolute values of $D \, A \, E \, u \, v \, log f_(*) \,
   log g_(*)$, and $log K_x \( w \)$. For every fixed positive rational $rho$,
   each of these quantities can be approximated to absolute error at most $rho$ by one fixed deterministic
   rational-arithmetic procedure, in time polynomial in $log P$, given the relevant residues and $P$.
   This procedure need not enumerate the $P$ points.]
] <lemma:finite-filtering>

#proof[
  The relative-entropy argument is unchanged for normalized finite averages. For uniform bounds, note that
  $ \| r \| lt.eq 2.433 \, wide \| s \| lt.eq 4.010 . $
  Consequently $F \, G$, all their normalizers, and all the densities above are bounded above and bounded away
    from zero by absolute constants, on either circle. The same holds for $Q$ and $K_x$,
    so their logarithms and the averages defining the scores are uniformly bounded.
  If $H \( x \, w \)$ is a continuously differentiable periodic function,
    the error in replacing its $w$ integral by a $P$-point average is at most $2 pi parallel partial_w H
    parallel_oo \/ P$, uniformly in $x$. Apply this fact first to the normalizers and then to the numerators in
    (3.1) and (3.2). The lower bounds on denominators allow division and taking logarithms without losing uniform
    convergence. Thus the finite versions of $D \, A \, E \, u \, v$ converge uniformly, at their grid points,
    to the continuous versions. Applying the same Riemann-sum estimate once more to the two outer integrands
    proves (3.7) from Proposition 7 and the strict slack between $0.5168$ and $0.5169$.
  Here is also an effective version of this argument. The displayed coefficient bounds give explicit bounds on
    every fixed derivative needed above. For a prescribed fixed $rho$,
    choose a constant mesh fine enough to approximate the continuous integrals,
    and choose a constant threshold above which the finite-to-continuous error is less than $rho \/ 2$.
    Evaluate the mesh sums and elementary functions by rational Taylor expansions with error less than the
    remaining $rho \/ 2$. Arguments are bounded, and all logarithm arguments lie in a fixed compact subinterval of
    $\( 0 \, oo \)$. For logarithms, the series $ln y = 2 sum_(j gt.eq 0) d^(2 j + 1) \/ \( 2 j + 1 \)$,
    where $d = \( y - 1 \) \/ \( y + 1 \)$, therefore converges geometrically at a uniform rate.
    The input angle $2 pi j \/ P$ can be approximated with a fixed number of fractional bits using arithmetic
    polynomial in $log P$. Below the constant threshold one may instead compute the finite averages directly.
    The mesh, precision, and threshold depend only on $rho$ and the displayed coefficients,
    not on $P$ or the instance. This gives a single deterministic procedure for each fixed $rho$;
    in particular repeated calls on the same inputs return the same rational value. ◻
]

== 4 Estimating a modular checksum <sec:checksum>

We now estimate a sum over a modular subset-sum bin without enumerating that bin or all Fourier frequencies.
  The input residues are arbitrary. Random phases, rather than a distributional assumption on the input,
  will make the moment bounds of Section 3 applicable.

Write $e_P \( j \) = exp \( 2 pi i j \/ P \)$. For residues $b_1 \, dots.h \, b_n in bb(Z) \/ P bb(Z)$,
  independent uniform phases $phi.alt_1 \, dots.h \, phi.alt_n in bb(Z) \/ P bb(Z)$, and a target residue $rho$, define

#[#set math.equation(numbering: n => "(4.1)")
 $ V_rho = sum_(I subset.eq \[ n \]\
sum_(i in I) b_i = rho med \( mod med P \)) e_P #h(-0.16667em) (sum_(i in I) phi.alt_i) . $ <eq:checksum-definition>]

The phases will be retained so that individual subset contributions can subsequently be subtracted from this estimate.

#thm([Theorem 4.1.])[
  (Modular checksum estimator).  #emph[Fix a constant $d > 0$.
    There is a uniform randomized procedure with the following guarantee for all sufficiently large $n$.
    Its inputs are an integer $P$ with $\| log P - eta n \| lt.eq 2$, arbitrary residues $b_1 \, dots.h \,
    b_n$ modulo $P$, and a list $cal(T)$ of at most $n^d$ target residues.
    It draws and retains independent uniform phases $phi.alt_1 \, dots.h \,
    phi.alt_n$ and either reports failure or returns estimates $hat(V)_rho$ for all $rho in cal(T)$.
    With probability $1 - o \( 1 \)$ it does not fail and
$ \| hat(V)_rho - V_rho \| lt.eq 1 / 8 wide upright("for every ") rho in cal(T) . $

 The $o \( 1 \)$ is uniform in $P$, the input residues, and the target list.
   On every random execution the procedure takes at most
#[#set math.equation(numbering: n => "(4.2)")
 $ 2^(\( tau + 20 epsilon.alt \) n + O \( sqrt(n) \)) "poly" \( n + \| cal(T) \| \) $ <eq:checksum-time>]

 word operations. No primality assumption on $P$ is needed.]
] <thm:checksum>

The proof has three parts. We cover every frequency using products of small random tables,
  while keeping the two lists of table entries short. We then count and sample the resulting matches without
  expanding all table products. Finally, inverse-multiplicity weighting and the filtering inequalities give an
  exponentially small mean squared error.

=== 4.1 Frequency patterns and block tables <frequency-patterns-and-block-tables>

Character orthogonality gives the exact identity

#[#set math.equation(numbering: n => "(4.3)")
 $ V_rho = 1 / P sum_(k = 0)^(P - 1) J_rho \( k \) \, wide J_rho \( k \) =
   e_P \( - k rho \) product_(i = 1)^n \( 1 + e_P \( x_i \( k \) \) \) \, wide x_i \( k \) = phi.alt_i +
   k b_i med \( mod med P \) . $ <eq:checksum-fourier>]

Indeed, expanding the product leaves one term for every subset,
  and its average character is one exactly when its sum is $rho$ modulo $P$. In particular,

#[#set math.equation(numbering: n => "(4.4)")
 $ \| J_rho \( k \) \|^2 = product_(i = 1)^n M \( x_i \( k \) \)^2 \, $ <eq:checksum-amplitude>]

where residues are identified with their angles in the finite circle.
  All functions in this section are the finite-circle functions of Lemma 8, with their finite normalizations.

Partition $\[ n \]$ deterministically into $q = Theta \( sqrt(n) \)$ blocks $B_1 \, dots.h \, B_q$ of sizes $d_j =
  Theta \( sqrt(n) \)$. A frequency’s #emph[pattern] records, for each block, rational approximations $D_j \,
  A_j \, E_j$ to the block averages of $D \, A \, E$ at its coordinates $x_i \( k \)$,
  each with error at most $epsilon.alt$. We choose these approximations so that

#[#set math.equation(numbering: n => "(4.5)")
 $ D_j gt.eq 0 \, wide A_j lt.eq D_j \, wide E_j lt.eq D_j . $ <eq:checksum-pattern-order>]

Here and throughout, the approximation rule is fixed and deterministic.
  For example, approximate each average to error $epsilon.alt \/ 8$, round its upper endpoint upward for $D_j$,
  and round its lower endpoint downward for $A_j \, E_j$, on a rational grid of step at most $epsilon.alt \/ 4$.
  The exact inequalities $D gt.eq 0 \, D gt.eq A \, D gt.eq E$ then imply (4.5).
  Uniform boundedness of these functions puts all the rounded values in a fixed finite grid.
  Lemma 8 computes these approximations in polynomial time per frequency, without summing over $P$ points.
  Fix likewise deterministic approximations to the individual scores $log f_(*) \,
  log g_(*)$ with error at most $epsilon.alt$.

Let $cal(P)$ be the collection of all blockwise grid triples satisfying (4.5),
  including patterns that no frequency attains. Its size is

#[#set math.equation(numbering: n => "(4.6)")
 $ Q_n := \| cal(P) \| = 2^(O \( sqrt(n) \)) . $ <eq:checksum-pattern-count>]

We enumerate this collection, not the $P$ frequency assignments.
  The collection and its grid indices are fixed independently of the phases;
  only a frequency’s membership in a pattern depends on them. Fix $pi in cal(P)$ and put

$ \( D_pi \, A_pi \, E_pi \) = 1 / n sum_(j = 1)^q d_j \( D_j \, A_j \, E_j \) \, wide U_pi = A_pi + E_pi -
  D_pi \, wide W_pi = 2 D_pi - A_pi - E_pi . $

For the moment let $0 < alpha lt.eq 1$ and $0 lt.eq H_pi lt.eq eta$ be rational parameters.
  The parameter $alpha$ is the probability of testing a coordinate,
  and $H_pi$ determines the relative lengths of the two digit lists.
  After defining the tests and their entries, we choose them to keep both lists short.
  Choose the integer base $B_pi = 2^(ceil.l \( eta - H_pi \) n ceil.r)$ and use the digit ranges

$ 0 lt.eq h < ceil.l P \/ B_pi ceil.r \, wide 0 lt.eq ell < B_pi . $

Their vectors have coordinates

$ y_i \( h \) = phi.alt_i + h B_pi b_i med \( mod med P \) \, wide z_i \( ell \) = - ell b_i med \( mod med P \) . $

The pair $\( h \, ell \)$ represents $k = h B_pi + ell$ uniquely, and $y_i \( h \) - z_i \( ell \) = x_i \( k \)$.
  Pairs representing $k gt.eq P$ will be discarded only when contributions are evaluated.
  The high and low digit ranges have sizes $2^(H_pi n + O \( 1 \))$ and $2^(\( eta - H_pi \) n + O \( 1 \))$,
  respectively; together they represent $2^(eta n + O \( 1 \))$ pairs.

We test each digit vector separately against random block tables.
  This organization is an asymmetric filtering construction;
  related filter frameworks also distinguish the two marginal acceptance probabilities from their joint acceptance
  probability #cite(label("Christiani2017")). The estimates required here are proved below.
  For each block $B_j$, generate

#[#set math.equation(numbering: n => "(4.7)")
 $ R_j = 2^(ceil.l \( alpha D_j + 4 epsilon.alt \) d_j ceil.r) $ <eq:checksum-table-count>]

independent tables. At each coordinate of a table independently, its label is $*$ with probability $1 -
  alpha$ and otherwise a uniform $theta in bb(Z) \/ P bb(Z)$ with probability $alpha$.
  Tables in distinct blocks and patterns are independent, and all are independent of the phases.
  Distinct table indices are retained even when their labels coincide.

A label $*$ gives score zero on either side. A non-$*$ label $theta$ gives the high and low scores

$ log f_(*) \( y_i \( h \) - theta \) \, wide log g_(*) \( z_i \( ell \) - theta \) \, $

respectively. Use the fixed approximations to these scores when testing a vector.
  It passes a block table if its average approximate score is at least $alpha A_j -
  3 epsilon.alt$ on the high side, or at least $alpha E_j - 3 epsilon.alt$ on the low side.
  A #emph[whole table] is a tuple of one table index from each block.
  A vector passes it when it passes all its block tables. A table #emph[entry] is a digit index and a whole table
  it passes. A #emph[match] is a high entry and a low entry with the same whole table.
  Write $L_pi$ for the number of matches. These definitions do not restrict the represented frequency to have
  pattern $pi$.

=== 4.2 Coverage and list sizes <coverage-and-list-sizes>

The parameters must ensure both that each frequency has a match and that its two lists of entries can be
  constructed within the time bound. The estimates below give the leading exponents for the expected entry counts as

$ H_pi + alpha \( D_pi - A_pi \) \, wide eta - H_pi + alpha \( D_pi - E_pi \) \, $

apart from $O \( epsilon.alt \)$ rounding slack and subexponential factors.
  The digit ranges contribute $H_pi$ and $eta - H_pi$; the number of tables and the score thresholds contribute
  the remaining terms. Their sum is $eta + alpha W_pi$, so both exponents can be at most $tau$ exactly when $alpha
  W_pi lt.eq 2 tau - eta = Gamma$. Choose the largest $alpha in \( 0 \, 1 \]$ satisfying this inequality,
  and make the high-side exponent equal to $tau$:

#[#set math.equation(numbering: n => "(4.8)")
 $ alpha_pi = cases(delim: "{", 1 \, & W_pi lt.eq Gamma \,, Gamma \/ W_pi \, & W_pi > Gamma \,) wide H_pi = tau -
   alpha_pi \( D_pi - A_pi \) . $ <eq:checksum-alpha>]

Use these parameters in the construction, abbreviating $alpha = alpha_pi$.
  Since $D_pi - A_pi \, D_pi - E_pi gt.eq 0$ and $alpha W_pi lt.eq Gamma$,

#[#set math.equation(numbering: n => "(4.9)")
 $ Delta lt.eq H_pi lt.eq tau \, wide eta - H_pi + alpha \( D_pi - E_pi \) = Delta + alpha W_pi lt.eq
   tau . $ <eq:checksum-digit-balance>]

In particular both digit ranges have size at most $2^(tau n + O \( 1 \))$.
  We now prove the coverage and size estimates for this choice.

#thm([Lemma 4.2.])[
  (Coverage and sizes).  #emph[For the preceding random construction, the following statements hold.]
  + #emph[Conditional on arbitrary phases, the probability that some $k <
    P$ has no match in its own pattern is $o \( 1 \)$, uniformly in the phases and residues.]
  + #emph[In each fixed pattern, the expected number of entries on either side is at most
    $2^(\( tau + 8 epsilon.alt \) n + O \( sqrt(n) \))$, and
#[#set math.equation(numbering: n => "(4.10)")
 $ bb(E) L_pi lt.eq 2^(\( eta - alpha U_pi + 12 epsilon.alt \) n + O \( sqrt(n) \)) . $ <eq:checksum-match-expectation>]

 The entry estimates hold conditional on the phases. The match estimate averages over both phases and tables.]
  + #emph[With probability $1 - o \( 1 \)$, all frequencies are covered in their own patterns and,
    in every pattern, both entry counts are at most $2^(\( tau + 14 epsilon.alt \) n)$ and
#[#set math.equation(numbering: n => "(4.11)")
 $ L_pi lt.eq 2^(\( eta - alpha U_pi + 18 epsilon.alt \) n) . $ <eq:checksum-match-good>]

]
] <lemma:checksum-tables>

#proof[
  First fix the phases, $k < P$, its pattern, and one block.
    We lower-bound the chance that one block table accepts both digits representing $k$.
    Change the label law as follows: retain the probability of $*$, but conditional on a non-$*$ label give $w =
    z_i - theta$ density $K_(x_i \( k \))$ relative to the uniform finite-circle law.
    Under this new law the expected high score, low score, and base-two log likelihood ratio against the original
    law are, respectively,
  $ alpha A \( x_i \( k \) \) \, wide alpha E \( x_i \( k \) \) \, wide alpha D \( x_i \( k \) \) . $
  Indeed, a non-$*$ label has likelihood ratio $K_(x_i \( k \)) \( w \)$ and $y_i - theta = x_i \( k \) + w$.
    The coordinate variables remain independent. Their absolute values are bounded by a fixed constant,
    uniformly in $P \, k \, alpha$. Chebyshev’s inequality and a union bound therefore show that,
    for sufficiently large block size, all three block averages are within $epsilon.alt$ of their means with
    probability at least $1 \/ 2$ under the new law.
  On this event the approximate score averages are at least $alpha A_j - 3 epsilon.alt$ and $alpha E_j -
    3 epsilon.alt$: the mean approximation, the deviation, and the score approximation cost at most $epsilon.alt$
    each. The likelihood ratio of the entire block is at most $2^(\( alpha D_j + 2 epsilon.alt \) d_j)$.
    Changing back to the original law gives
  #[#set math.equation(numbering: n => "(4.12)")
   $ bb(P) \( upright("one block table accepts both digits") \) gt.eq 1 /
     2 thin 2^(- \( alpha D_j + 2 epsilon.alt \) d_j) . $ <eq:checksum-coverage-probability>]
  Thus the chance that none of its $R_j$ tables accepts both is at most $exp \( - 2^(2 epsilon.alt d_j - 1) \)$.
    Union over the $q$ blocks and the $P$ frequencies is still $o \( 1 \)$ because $d_j = Theta \( sqrt(n) \)$.
    If each block has an accepting table, their tuple is a match. This proves (i).
  For the size estimates, the number of whole tables is at most
  #[#set math.equation(numbering: n => "(4.13)")
   $ product_j R_j lt.eq 2^(\( alpha D_pi + 4 epsilon.alt \) n + q) . $ <eq:checksum-whole-table-count>]
  For any fixed vector and fixed whole-table index tuple, let $S$ be its total exact score.
    Normalization of $f_(*)$ or $g_(*)$ and independence of the labels give $bb(E) 2^S = 1$,
    including the $*$ option. Passing the tests requires $S gt.eq \( alpha A_pi - 4 epsilon.alt \)
    n$ on the high side, or $S gt.eq \( alpha E_pi - 4 epsilon.alt \) n$ on the low side.
    Markov’s inequality, the digit counts, and (4.13) bound the expected entry counts by
  $ 2^(\( H_pi + alpha \( D_pi - A_pi \) + 8 epsilon.alt \) n + O \( sqrt(n) \)) & =
    2^(\( tau + 8 epsilon.alt \) n + O \( sqrt(n) \)) \,\
2^(\( eta - H_pi + alpha \( D_pi - E_pi \) + 8 epsilon.alt \) n + O \( sqrt(n) \)) & lt.eq
  2^(\( tau + 8 epsilon.alt \) n + O \( sqrt(n) \)) . $
  No independence between distinct whole tables is used.
  For a fixed digit pair and table-index tuple, let $S_h \, S_ell$ be the two total exact scores. This time
  #[#set math.equation(numbering: n => "(4.14)")
   $ bb(E)_(phi.alt \, upright("tables")) 2^(S_h + S_ell) = 1 . $ <eq:checksum-joint-moment>]
  To see this, first condition on all labels. At every non-$*$ coordinate the independent uniform phase makes
    $y_i - theta$ uniform, so averaging its $f_(*)$ factor gives one.
    Averaging the remaining $g_(*)$ factors over the table shifts also gives one.
    A match requires $S_h + S_ell gt.eq \( alpha \( A_pi + E_pi \) - 8 epsilon.alt \) n$.
    Markov’s inequality, the $2^(eta n + O \( 1 \))$ digit pairs, and (4.13) prove (4.10).
    It is essential here that all digit pairs are counted, before checking their patterns;
    the phases in (4.14) have their original independent uniform law.
  Finally, each bound in (iii) has a factor $2^(6 epsilon.alt n - O \( sqrt(n) \))$ of slack over its expectation.
    Markov’s inequality and a union bound over $Q_n = 2^(O \( sqrt(n) \))$ patterns give simultaneous size bounds
    with probability $1 - o \( 1 \)$. Combine these with (i). ◻
]

=== 4.3 Constructing and sampling the matches <constructing-and-sampling-the-matches>

The preceding bounds would not be useful if finding the table entries required visiting every whole table.
  We instead construct the lists block by block. For each digit vector,
  test it against the $R_j$ tables of every block and record its passing index sets.
  If any set is empty, the vector produces no entries. Otherwise, emit the Cartesian product of these sets,
  with the digit index attached to each tuple. Since all $D_j$ are uniformly bounded,

$ sum_j R_j = 2^(O \( sqrt(n) \)) "poly" \( n \) . $

Consequently the work per digit, apart from emitted entries, is $2^(O \( sqrt(n) \)) "poly" \( n \)$;
  a nested counter emits each tuple with polynomial overhead.
  Coincident vectors still retain their different digit indices.

Sort both entry lists lexicographically by table-index tuple.
  If the high and low group lengths for a tuple are $a_nu \, b_nu$, then

#[#set math.equation(numbering: n => "(4.15)")
 $ L_pi = sum_nu a_nu b_nu . $ <eq:checksum-match-count>]

Prefix sums of these products allow a uniformly random match to be chosen without enumerating them:
  choose a uniform integer below $L_pi$, locate its group by binary search,
  and use quotient and remainder to select one entry on each side. A zero product contributes no interval.
  The same groups also allow sequential match enumeration.

For any represented frequency $k = h B_pi + ell$, define $mu_pi \( k \)$ to be its number of matches in this
  pattern procedure. Its digits are unique, so

#[#set math.equation(numbering: n => "(4.16)")
 $ mu_pi \( k \) = product_(j = 1)^q \| { r in \[ R_j \] :
   upright("block table ") r upright(" accepts both ") y \( h \) upright(" and ") z \( ell \) }
   #scale(x: 120%, y: 120%)[\|] . $ <eq:checksum-multiplicity>]

We compute this integer directly by retesting the stored block tables,
  in $2^(O \( sqrt(n) \)) "poly" \( n \)$ time. Repeated table labels are counted with their distinct indices,
  exactly as in the lists. The very same deterministic score approximations are used in list construction and
  multiplicity computation. Thus the identity is exact, not approximate.
  Whenever a match is sampled or enumerated, its multiplicity is positive, even on outcomes where coverage fails.

These operations never scan the frequency range or the set of whole tables. They also permit an immediate cap:
  abort before either entry list exceeds

#[#set math.equation(numbering: n => "(4.17)")
 $ C_n = 2^(ceil.l \( tau + 20 epsilon.alt \) n ceil.r) $ <eq:checksum-cap>]

entries. Once the lists exist, $L_pi lt.eq C_n^2$ on every execution,
  so the exact match count and its prefix sums have $O \( n \)$ bits.
  Large match counts therefore do not force large enumerations.

=== 4.4 Direct summation and importance sampling <direct-summation-and-importance-sampling>

Let $cal(G)$ denote the event in Lemma 10(iii). We first analyze exact arithmetic and ideal discrete uniform
  draws. Entry and enumeration caps will be imposed after this analysis; on $cal(G)$ they do not interrupt it.

For each pattern define its exact contribution

$ v_(pi \, rho) = 1 / P sum_(k < P\
upright("pattern") \( k \) = pi) J_rho \( k \) . $

If $alpha U_pi gt.eq Delta$, enumerate every match and give it contribution zero unless $k <
  P$ and its deterministic pattern is $pi$. For a retained match use

#[#set math.equation(numbering: n => "(4.18)")
 $ frac(J_rho \( k \), P mu_pi \( k \)) . $ <eq:checksum-direct-weight>]

On $cal(G)$, every frequency of this pattern is present, and its $mu_pi \( k \)$ contributions sum to
  $J_rho \( k \) \/ P$. Also (4.11) gives $L_pi lt.eq 2^(\( tau + 18 epsilon.alt \) n)$ in this case.
  We cap this enumeration at $C_n$, aborting before visiting a further match.

If $alpha U_pi < Delta$, take $N = 2^(ceil.l tau n ceil.r)$ independent uniform matches with replacement.
  When $L_pi = 0$, return zero for this pattern. Otherwise, average the sample values

#[#set math.equation(numbering: n => "(4.19)")
 $ X_(pi \, rho) =
   cases(delim: "{", frac(L_pi, P mu_pi \( k \)) J_rho \( k \) \, & k < P upright(" and ") upright("pattern") \(
   k \) = pi \,, 0 \, & upright("otherwise") .) $ <eq:checksum-sample-weight>]

The inverse-multiplicity correction is the usual principle of counting each object once across overlapping
  representations #cite(label("KLM1989")) Section 5. Here the summands are complex and we need an absolute error
  bound, so we give the relevant calculation. Conditional on phases and tables in $cal(G)$,
  a frequency of this pattern is sampled with probability $mu_pi \( k \) \/ L_pi$.
  Hence the sample mean is unbiased for $v_(pi \, rho)$ and its mean squared error is at most

#[#set math.equation(numbering: n => "(4.20)")
 $ 1 / N thin L_pi / P^2 sum_(k < P\
upright("pattern") \( k \) = pi) \| J_rho \( k \) \|^2 . $ <eq:checksum-conditional-variance>]

Indeed, its second moment before averaging is the same sum with an additional factor $1 \/ mu_pi \( k \) lt.eq 1$,
  and independent complex sample errors have zero cross terms.
  If $L_pi = 0$, coverage implies that there are no frequencies of this pattern, so the zero estimate is exact.

It remains to show that (4.20) is small. The phases have been conditioned on in that formula;
  they must not now be treated as independent under the conditional law of $cal(G)$.
  Instead, we bound the formula times $upright(bold(1))_(cal(G))$ pointwise and only then take expectation under
  the original phase law.

For a frequency of pattern $pi$, let $macron(u) \, macron(v)$ be the coordinate averages of $u \,
  v$ at $x_i \( k \)$. The pattern errors imply

#[#set math.equation(numbering: n => "(4.21)")
 $ \| U_pi - macron(u) \| lt.eq 3 epsilon.alt \, wide \| W_pi - macron(v) \| lt.eq
   4 epsilon.alt . $ <eq:checksum-profile-errors>]

There are two cases within the sampling branch. When $W_pi lt.eq Gamma$, $alpha = 1$ and $U_pi < Delta$. Thus

#[#set math.equation(numbering: n => "(4.22)")
 $ - alpha U_pi lt.eq - Delta + 8.5 \( Delta - macron(u) \) + 30 epsilon.alt . $ <eq:checksum-domination-one>]

For example, writing $delta = Delta - U_pi > 0$, the right side minus the left side is at least $7.5
  delta + \( 30 - 25.5 \) epsilon.alt$. When $W_pi > Gamma$, we have $alpha a W_pi = Delta$,
  and the sampling condition implies $a W_pi - U_pi > 0$. Since $alpha lt.eq 1 < 8.3$,

#[#set math.equation(numbering: n => "(4.23)")
 $ - alpha U_pi & = - Delta + alpha \( a W_pi - U_pi \)\
 & lt.eq - Delta + 8.3 \( a macron(v) - macron(u) \) + 30 epsilon.alt . $ <eq:checksum-domination-two>]

Here the rounding loss is at most $8.3 \( 4 a + 3 \) epsilon.alt < 30 epsilon.alt$.

Set

$ R_1 \( x \) = 8.5 \( Delta - u \( x \) \) \, wide R_2 \( x \) = 8.3 \( a v \( x \) - u \( x \) \) . $

For a fixed sampled pattern, let $r = 1$ or $2$ according to the preceding case.
  Combining (4.11), (4.4), and (4.22) or (4.23) gives, for every $k < P$,

#[#set math.equation(numbering: n => "(4.24)")
 $ upright(bold(1))_(cal(G)) upright(bold(1))_({ upright("pattern") \( k \) = pi }) L_pi \| J_rho \( k \) \|^2
   lt.eq 2^(\( eta - Delta + 48 epsilon.alt \) n) product_(i = 1)^n #scale(x: 120%, y: 120%)[\(]
   M \( x_i \( k \) \)^2 thin 2^(R_r \( x_i \( k \) \)) #scale(x: 120%, y: 120%)[\)] .
   $ <eq:checksum-unconditional-domination>]

The nonnegative right side no longer restricts the pattern or the good event.
  At each fixed $k$, under the original law the $x_i \( k \)$ are independent uniform residues,
  regardless of the values of $b_i$. Lemma 8 therefore bounds the expected product by $2^(0.5169 n)$.

Let $E_(pi \, rho)$ be the error of this pattern’s ideal estimate.
  Taking conditional expectation over its samples first in (4.20), and then using (4.24), yields

#[#set math.equation(numbering: n => "(4.25)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_(cal(G)) \| E_(pi \, rho) \|^2
   #scale(x: 120%, y: 120%)[\]] & lt.eq frac(2^(\( eta - Delta + 48 epsilon.alt + 0.5169 \) n), N P)\
 & = 2^(\( - tau - Delta + 0.5169 + 48 epsilon.alt \) n + O \( 1 \)) lt.eq
   2^(- 0.0007 n) $ <eq:checksum-error-exponent>]

for sufficiently large $n$. The exponent before the $O \( 1 \)$ term is $- 0.00081952$.
  Directly summed patterns have zero error on $cal(G)$. Cauchy–Schwarz gives

$ bb(E) #h(-0.16667em) [upright(bold(1))_(cal(G)) lr(|sum_(pi in cal(P)) E_(pi \, rho)|)^2] lt.eq
  Q_n^2 thin 2^(- 0.0007 n) . $

Markov’s inequality and a union bound over $cal(T)$ now show that, with probability $1 - o \( 1 \)$,
  $cal(G)$ holds and every total ideal estimate has absolute error at most $1 \/ 16$.
  The subexponential number of patterns and the polynomial number of targets are both absorbed by the negative
  linear exponent. This conclusion uses no independence between pattern errors or between target estimates.

=== 4.5 Resource and precision bounds <resource-and-precision-bounds>

We finish the proof of Theorem 9 by making the preceding procedure bounded on all histories.
  Generate block tables and digit entries as described, aborting at the entry cap (4.17).
  For a direct pattern, abort at the same cap on enumerated matches.
  Sampled patterns use exactly $N$ match draws, or return zero when there is no match.
  The event $cal(G)$ implies that none of these caps is reached. On any other history, the caps still bound the work.

Each grid value has a fixed rational denominator. Thus the weighted averages and $alpha$ have numerators and
  denominators of $O \( log n \)$ bits, even for unattained patterns.
  The ceilings in the digit and table counts are computed exactly by rational arithmetic.
  For each pattern, digit processing costs $2^(tau n + O \( sqrt(n) \))
  "poly" \( n \)$ before the emitted entries. Sorting, prefix sums,
  and random indexing have polynomial cost per entry or sample.
  Each valid contribution requires at most $2^(O \( sqrt(n) \)) "poly" \( n \)$ work for its multiplicity,
  and a polynomial factor for the target list. All tuple keys, match counts,
  and multiplicities have $O \( n \)$ bits: for multiplicities use (4.13),
  and for match counts on retained lists use $L_pi lt.eq C_n^2$. Multiplication by the $Q_n$ patterns gives (4.2).

The coarse fixed approximations in pattern and acceptance tests define the lists themselves;
  they need not be refined later. The complex contributions require greater accuracy.
  On every nonaborted history there are only $2^(O \( n \)) "poly" \( \| cal(T) \| \)$ of them,
  each formed from at most $n + 1$ factors of modulus at most two.
  The rational weights in (4.18) and (4.19) have $O \( n \)$-bit numerators and denominators and magnitude at most
  $2^(O \( n \))$. Section 6.2, under #emph[Complex evaluations and summation],
  implements precisely such sums by evaluating each phase to error $2^(- 2 n^2)$ and rounding each contribution to
  $n^2$ fractional bits on a common dyadic grid. Its total error here is $2^(- n^2 + O \( n \))
  "poly" \( \| cal(T) \| \) = o \( 1 \)$, hence less than $1 \/ 16$ for sufficiently large $n$,
  with polynomial work per contribution.

The rational probabilities in the label choices, finite uniform draws,
  and phase evaluations admit bounded implementations on the specified word RAM;
  Section 6 gives these implementations and their coupling to the ideal draws.
  Their additional abort probability is $o \( 1 \)$, and their cost is polynomial per operation just counted.
  The retained phases and block labels are ordinary writable data;
  the procedure requires no access to unstored randomness. The ideal error bound $1 \/ 16$,
  the arithmetic error $1 \/ 16$, and the vanishing probabilities of cap or sampling failure prove Theorem 9.

== 5 Extracting the modular aliases <sec:aliases>

The modular checksum includes subsets whose integer sum is not the target.
  This section lists precisely those unwanted subsets, so that their phase contributions can be subtracted.
  We use multiple representations of a subset by two masks on a small common block,
  together with modular filtering. This representation method and the distinction between many and few distinct
  subset sums have precedents in #cite(label("HGJ2010")) #cite(label("AKKN2016"))
  #cite(label("NederlofWegrzycki2021")). The additional feature here is an exclusion rule:
  pairs with the exact target weight are skipped without being visited, even when their masks overlap.
  That rule is what makes the number of visited pairs small.

Throughout this section, fix the transformed weights $c_i$ and targets $t_s$ from (2.1).
  Their bit lengths are $O \( b + log n \)$. The low-deficiency condition (2.3) will be used only to prove
  coverage; the list and pair bounds hold without it. The algorithm does not test this condition.
  It is the case in which the preliminary exact procedure need not already decide the instance.
  For the present construction we impose the input-length guard

#[#set math.equation(numbering: n => "(5.1)")
 $ b lt.eq 2^(.00001 n) . $ <eq:bit-guard>]

The final algorithm uses an exact fallback when this guard fails.

Choose a prime $P$ uniformly from $\[ 2^(floor.l eta n floor.r) \, 2^(1 + floor.l eta n floor.r) \)$,
  where $eta = .51772$, and put $b_i = c_i med mod med P in { 0 \, dots.h \, P - 1 }$.
  For a target $t_s$, define its set of #emph[aliases] by

#[#set math.equation(numbering: n => "(5.2)")
 $ cal(A)_s \( P \) = {I subset.eq \[ n \] : sum_(i in I) c_i equiv t_s med \( mod med P \) \, quad
   sum_(i in I) c_i eq.not t_s} . $ <eq:alias-definition>]

#thm([Theorem 5.1.])[
  (Alias extraction).  #emph[There is one randomized procedure with the following properties for all sufficiently
    large $n$. Its input consists of the transformed integers $c_i = C a_i + u_i$ and targets $t_s = C t + s$,
    $0 lt.eq s lt.eq n N_0$, of (2.1), with the input-length guard (5.1).
    It chooses $P$ uniformly from $\[ 2^(floor.l eta n floor.r) \, 2^(1 + floor.l eta n floor.r) \)$ among the
    primes and returns either failure or $P$ together with a deduplicated list of genuine aliases for each target.
    If $bb(E)_(\| V \| = floor.l n \/ 2 floor.r) d \( V \) lt.eq .01004 n$, then, with probability $1 -
    o \( 1 \)$ over $P$ and the remaining random choices, it does not fail and its lists equal $cal(A)_s \( P \)$
    simultaneously for every $s$. The error bound is uniform over the transformed inputs satisfying these assumptions.]
  #emph[For every outcome of its random choices, the procedure stores and visits at most $2^(ceil.l tau n ceil.r)
    "poly" \( n \)$ records, where $tau = .48996$, and takes $2^(tau n)
    "poly" \( n + b + 2 \)$ elementary bit operations, apart from the implementation of exact uniform finite
    draws. Those draws admit the bounded implementations in Section 6.]
] <thm:aliases>

We first construct the filtered lists and show why the exact-integer exclusion keeps their enumeration small.
  We then prove coverage: a random prime preserves the distinctions needed for many representations of each alias,
  and the smaller-modulus filter retains one of them with sufficient probability.

=== 5.1 Representations and filtered lists <representations-and-filtered-lists>

Set

#[#set math.equation(numbering: n => "(5.3)")
 $ m = 2 ⌊frac(.0567 n, 2)⌋ \, wide gamma = .48925 . $ <eq:alias-parameters>]

Thus $m$ is even. All arguments below concern sufficiently large $n$, so $m > 0$ and $17 m \/ 2 lt.eq
  floor.l n \/ 2 floor.r$. Write $h \( x \) = - x log x - \( 1 - x \) log \( 1 - x \)$ for binary entropy,
  with $h \( 0 \) = h \( 1 \) = 0$. The numerical bounds $h \( .0567 \) + .0567 < .40$ and
  $h \( 1 \/ 4 \) < .81128$ used below follow, for example, from the logarithm series (7.5),
  after scaling its argument into $\[ 1 \, 2 \]$.

Every alias $I$ of $t_s$ has a carry $q in { 0 \, dots.h \, n }$ such that

#[#set math.equation(numbering: n => "(5.4)")
 $ sum_(i in I) b_i = T_(s \, q) \, wide T_(s \, q) = \( t_s med mod med P \) + q P . $ <eq:alias-carry>]

For each $s$ and every $q = 0 \, dots.h \, n$, perform $n^10$ independent trials,
  conditional on $P$ and the transformed input. A trial chooses a uniform $m$-element set $M
  subset.eq \[ n \]$ and an independent uniform subset $F subset.eq \[ n \]$.
  These two draws have the same law for every $P$ and use randomness independent of it.
  The block $M$ supplies multiple representations: selected positions in it will be split between two masks.
  For any fixed subset $I$, the flipped set $J = I triangle.stroked.t
  F$ selects exactly half of this block with inverse-polynomial probability,
  independently of the original cardinality of $I$. Introduce signed weights and translated targets

#[#set math.equation(numbering: n => "(5.5)")
 $ b_i^F & = \( - 1 \)^(upright(bold(1))_(i in F)) b_i \, & T^F & = T_(s \, q) - sum_(i in F) b_i \,\
c_i^F & = \( - 1 \)^(upright(bold(1))_(i in F)) c_i \, & t_s^F & = t_s - sum_(i in F) c_i . $ <eq:alias-flip>]

For every subset $I$, these definitions give

$ sum_(i in J) b_i^F = sum_(i in I) b_i - sum_(i in F) b_i \, wide sum_(i in J) c_i^F = sum_(i in I) c_i -
  sum_(i in F) c_i . $

Thus flipping is a bijection, not a relaxation of the subset problem.

Within the trial, consider every $k = 0 \, dots.h \, m \/ 2$.
  Partition the positions outside $M$ into ordinary left and right sets $L \, R$, of sizes $l \, r$, where $l +
  r = n - m$. Choose $l$ so that

#[#set math.equation(numbering: n => "(5.6)")
 $ N_L = 2^l binom(m, k) \, wide N_R = 2^r binom(m, m \/ 2 - k) $ <eq:alias-raw-sizes>]

are within a factor of two. Such a choice follows by rounding

$ l = frac(n - m + log binom(m, m \/ 2 - k) - log binom(m, k), 2) $

to the nearest integer. The unrounded value lies between $\( n - 2 m \) \/ 2$ and $n \/ 2$,
  so the required partition exists. The choice can be made by exact comparisons of integers,
  without logarithmic arithmetic. For definiteness, take the first $l$ positions of $\[ n \] \\ M$ as $L$.

A left record is a pair $\( A \, X \)$ with $A subset.eq L$, $X subset.eq M$, $\| X \| = k$;
  a right record is a pair $\( B \, Y \)$ with $B subset.eq R$, $Y subset.eq M$, $\| Y \| = m \/ 2 - k$.
  Each record stores both its signed reduced weight, obtained using $b_i^F$, and its signed unreduced weight,
  obtained using $c_i^F$. At this point $X$ and $Y$ need not be disjoint.
  If they are disjoint, their union with $A \, B$ represents a subset with exactly $m \/ 2$ selected positions in $M$.

For this $k$, independently draw a prime

$ P' in \[ 2^(floor.l gamma m floor.r) \, 2^(1 + floor.l gamma m floor.r) \) $

uniformly and then draw a uniform residue $j' med mod med P'$.
  Keep left records whose signed reduced weight is $j' med mod med P'$,
  and right records whose signed reduced weight is $T^F - j' med mod med P'$.
  Only these filtered records are formed explicitly.

To generate a filtered list, split its ordinary coordinate set into two parts as evenly as possible.
  Enumerate subsets of one part together with all its permitted masks in $M$,
  and enumerate subsets of the other part. Sorting these two lists by their weights modulo $P'$ permits their
  matching pairs to be emitted in time polynomial in $n + b +
  2$ times the sum of their lengths and the number of emitted records.
  Indeed, for each entry in one list, a binary search finds the interval of complementary residues in the other,
  after which only output records are visited. The setup work for both sides is at most

#[#set math.equation(numbering: n => "(5.7)")
 $ "poly" \( n + b + 2 \) 2^(m + ceil.l max \( l \, r \) \/ 2 ceil.r) lt.eq
   "poly" \( n + b + 2 \) 2^(.3067 n + O \( 1 \)) . $ <eq:alias-generation>]

Here $max \( l \, r \) lt.eq n \/ 2 + O \( 1 \)$ follows from the balancing rule.

===== 5.1.1 The exact-integer exclusion. <the-exact-integer-exclusion.>

From the filtered lists, enumerate only pairs whose signed reduced weights add to $T^F$ as integers and whose
  signed unreduced weights do #emph[not] add to $t_s^F$ as integers.
  Both sums count mask positions with their multiplicities, including a position selected by both masks.
  The excluded pairs need not be generated: group the right records by signed reduced weight,
  and within each group sort by signed unreduced weight. For a left record,
  locate the group with the required reduced weight. The forbidden unreduced equality is a single contiguous
  interval inside that group. Two binary searches locate its endpoints,
  and the algorithm visits only records outside that interval.

For each visited pair, test whether $X ∩ Y = diameter$. If so, undo the flip on $A union B union X union Y$,
  check (5.2) directly, and save the resulting alias for target $s$.
  Deduplicate the saved subsets separately for each $s$. In particular, every saved record is a genuine alias,
  whether or not the procedure eventually finds all aliases.

=== 5.2 Why the visited lists and pairs are small <why-the-visited-lists-and-pairs-are-small>

The next estimates concern the uncapped construction. They hold without the low-deficiency assumption and average
  over the original random choice of $P$. In particular, we do not restrict $P$ to primes for which the later
  coverage argument succeeds.

Conditional on all choices except $j'$, any fixed left or right record survives with probability $1 \/ P'$.
  Balancing (5.6), the entropy bound for binomial coefficients, and concavity of $h$ give

#[#set math.equation(numbering: n => "(5.8)")
 $ log bb(E) \[ upright("one filtered list length") \] & lt.eq frac(n - m, 2) + m /
   2 (h \( k \/ m \) + h \( 1 \/ 2 - k \/ m \)) - gamma m + O \( 1 \)\
 & lt.eq n / 2 + (h \( 1 \/ 4 \) - 1 / 2 - gamma) m + O \( 1 \) < .48992 n $ <eq:alias-list-bound>]

for sufficiently large $n$. The last inequality uses $h \( 1 \/ 4 \) < .81128$;
  the coefficient obtained from this upper bound is $.489909101$.

To bound visited pairs, fix $s \, q \, k$, the block $M$, the flip $F$, and two #emph[raw] records.
  The indices $s \, q \, k$ range over predetermined integers; in particular $q$ is fixed while $P$ is averaged.
  These records and their ordinary-coordinate partition can be fixed independently of $P$.
  Let $mu_i in { 0 \, 1 \, 2 }$ be their combined multiplicity at position $i$, and define

#[#set math.equation(numbering: n => "(5.9)")
 $ D = sum_i \( - 1 \)^(upright(bold(1))_(i in F)) mu_i c_i - t_s + sum_(i in F) c_i . $ <eq:alias-fixed-difference>]

This is a fixed integer independent of $P$; in particular neither the reduced weights nor the carry target occurs
  in its definition. The exact-integer exclusion requires $D eq.not 0$.
  The reduced-weight equality implies $P divides D$, because $T_(s \, q) equiv
  t_s med \( mod med P \)$ and $b_i equiv c_i med \( mod med P \)$.
  The integer $D$ has $O \( b + log n \)$ bits, even when masks overlap. Lemma 6 therefore gives

#[#set math.equation(numbering: n => "(5.10)")
 $ Pr_P \[ upright("both integer tests hold") \] lt.eq "poly" \( n \) \( b + log n \) 2^(- eta n) .
   $ <eq:alias-large-modulus-bound>]

For $D = 0$ the pair is always excluded, so its contribution is zero.

Conditional on $P \, P' \, M \, F$ and the raw records, the smaller-modulus filters can both hold for at most one
  value of $j'$. Their probability is therefore at most $1 \/ P' lt.eq 2^(1 - gamma m)$,
  regardless of whether the reduced-weight equality holds. Combining this bound with (5.10) and summing over the
  $N_L N_R$ raw pairs yields

#[#set math.equation(numbering: n => "(5.11)")
 $ bb(E) \[ upright("visited pair count") \] & lt.eq "poly" \( n \) \( b + log n \)
   2^(n + \( 2 h \( 1 \/ 4 \) - 1 - gamma \) m - eta n)\
 & < 2^(.48988 n) $ <eq:alias-pair-bound>]

uniformly under (5.1), for sufficiently large $n$. Indeed, using $h \( 1 \/ 4 \) < .81128$ and the guard,
  the coefficient of $n$ before polynomial factors is at most $.489848677$.

This is the reason to exclude exact equalities before testing mask disjointness.
  If exact equalities for overlapping pairs were visited, they could have $D =
  0$ and would not satisfy the nonzero-divisor estimate. The sorted-interval exclusion avoids their cost entirely.

Cap each filtered list and each visited-pair count at

#[#set math.equation(numbering: n => "(5.12)")
 $ C_(upright("alias")) = 2^(ceil.l tau n ceil.r) . $ <eq:alias-cap>]

The procedure returns failure before emitting a record that would exceed a cap.
  There are only polynomially many choices of $s \, q$, trial, and $k$.
  Markov’s inequality and (5.8)–(5.11) show that a cap is exceeded with probability $o \( 1 \)$,
  uniformly over guarded inputs. On every execution, including one that fails, list generation, interval searches,
  mask checks, storage, and deduplication take at most $2^(tau n) "poly" \( n + b + 2 \)$ bit operations,
  by (5.7) and the caps.

=== 5.3 Why every alias is recovered <why-every-alias-is-recovered>

It remains to prove that the constructed representations cover every alias.
  The low-deficiency condition will provide many distinct mask weights on a randomly selected block.
  We first show that, with high probability, reduction modulo $P$ preserves all distinctions of this kind.

#thm([Lemma 5.2.])[
  (Sparse distinctions).  #emph[With probability $1 - o \( 1 \)$ over $P$,
    the following implication holds simultaneously for every $v in { - 1 \, 0 \,
    1 }^n$ with at most $m$ nonzero coordinates:
#[#set math.equation(numbering: n => "(5.13)")
 $ sum_i v_i c_i eq.not 0 quad arrow.r.double quad sum_i v_i c_i equiv.not 0 med \( mod med P \) .
   $ <eq:sparse-distinction>]

 The error is uniform under (5.1).]
] <lem:sparse-distinction>

#proof[
  There are at most
  $ sum_(j = 0)^m binom(n, j) 2^j lt.eq 2^(\( h \( .0567 \) + .0567 \) n + O \( log n \)) < 2^(.40 n) $
  such vectors for sufficiently large $n$. Every nonzero integer $sum_i v_i c_i$ has $O \( b + log n \)$ bits.
    Lemma 6 therefore bounds the probability that $P$ divides any one of them by $"poly" \( n \) \( b + log n \)
    2^(- eta n)$. A union bound, followed by (5.1), gives a total error at most $"poly" \( n \)
    2^(- \( eta - .40 - .00001 \) n) = o \( 1 \)$. ◻
]

In particular, fix any block of at most $m$ positions and any assignment of signs on that block.
  Distinct integer subset sums of the signed $c_i$ remain distinct modulo $P$ on the event of Lemma 12.
  Differences of two such sums have coefficients in ${ - 1 \, 0 \, 1 }$ on that block.
  Consequently they also give distinct #emph[integer] subset sums of the corresponding signed $b_i$.
  The event covers all blocks and all sign assignments at once, including those chosen by the random trials.

Assume now the low-deficiency condition (2.3), and fix a prime satisfying Lemma 12.
  We continue in the uncapped experiment. Fix a target $s$ and an alias $I in cal(A)_s \( P \)$,
  and use its carry $q$ in (5.4). The constants in the following probability bounds do not depend on $I \, s$,
  or the chosen prime.

===== 5.3.1 A block with many distinct sums. <a-block-with-many-distinct-sums.>

In one trial, $J = I triangle.stroked.t F$ is a uniform subset of $\[ n \]$ independent of $M$. Hence

#[#set math.equation(numbering: n => "(5.14)")
 $ Pr \[ \| J ∩ M \| = m \/ 2 \] = 2^(- m) binom(m, m \/ 2) gt.eq frac(1, m + 1) . $ <eq:alias-half-block>]

Conditional on this event, $S = J ∩ M$ is uniform among the $m \/ 2$-element subsets of $\[ n \]$.
  To bound its expected deficiency, take a uniform $floor.l n \/ 2
  floor.r$-element set and partition it uniformly into 17 disjoint sets of size $m \/ 2$ and a remainder.
  Each of the 17 sets has the same marginal law as $S$. Superadditivity and nonnegativity of deficiency,
  from Lemma 3, therefore imply

$ 17 bb(E) d \( S \) lt.eq bb(E)_(\| V \| = floor.l n \/ 2 floor.r) d \( V \) lt.eq .01004 n . $

Markov’s inequality now gives, for all sufficiently large $n$,

#[#set math.equation(numbering: n => "(5.15)")
 $ Pr \[ d \( S \) lt.eq .0106 m divides \| J ∩ M \| = m \/ 2 \] gt.eq 1 -
   frac(.01004 n, 17 \( .0106 \) m) > .005 . $ <eq:alias-useful-block>]

The limiting lower bound is greater than $.017$.

On this event the $c_i$ on $S$ have at least $2^(\( .5 - .0106 \) m) = 2^(.4894 m)$ distinct subset sums.
  For every realized $S \, F$, changing signs translates their support:

$ {sum_(i in X) c_i^F : X subset.eq S} = {sum_(i in X) c_i : X subset.eq S} - sum_(i in F ∩ S) c_i . $

The same number of distinctions survives for signed reduced integer weights,
  by the fixed prime’s sparse-distinction property. Partitioning these subsets by cardinality,
  there is a $k in { 0 \, dots.h \, m \/ 2 }$ whose masks give at least

#[#set math.equation(numbering: n => "(5.16)")
 $ B gt.eq frac(2^(.4894 m), m + 1) $ <eq:alias-many-weights>]

distinct signed reduced weights.

For this $k$, fix the corresponding ordinary partition $L \,
  R$ and combine each such mask $X subset.eq S$ with $J ∩ L$.
  The resulting left records still have $B$ distinct weights.
  Every one has the complementary right record $\( J ∩ R \, S \\ X \)$;
  their masks have the prescribed sizes and are disjoint. Thus the representations all give the same flipped alias
  $J$. It remains to show that the independent smaller modulus preserves enough of these choices to hit a random
  filter residue.

===== 5.3.2 A random smaller modulus hits a representation. <a-random-smaller-modulus-hits-a-representation.>

Let $w_1 \, dots.h \, w_B$ be the distinct signed reduced weights just obtained.
  They lie in $\[ - n P \, n P \]$, so every nonzero difference has $O \( n \)$ bits.
  The choice of $k$ and these weights depends only on $P \, M \, F \, I$, not on the independent $P' \,
  j'$ used for that layer. For a fixed $P'$, let

$ z_a = \| { j : w_j equiv a med \( mod med P' \) } \| \, wide a in bb(Z) \/ P' bb(Z) . $

Applying Lemma 6 to each nonzero difference gives

#[#set math.equation(numbering: n => "(5.17)")
 $ bb(E)_(P') sum_a z_a^2 lt.eq B + K_0 n^2 B^2 2^(- gamma m) $ <eq:alias-collision-moment>]

for an absolute constant $K_0$ and sufficiently large $n$.
  Since $.4894 > gamma = .48925$, (5.16) implies $B gt.eq 2^(gamma m)$ for sufficiently large $n$.
  The first term can therefore be absorbed into the second by increasing $K_0$.
  With probability at least $1 \/ 2$ over $P'$, Markov’s inequality gives

$ sum_a z_a^2 lt.eq 2 K_0 n^2 B^2 2^(- gamma m) . $

On this event, Cauchy–Schwarz shows that the number of occupied residues is at least

$ frac(\( sum_a z_a \)^2, sum_a z_a^2) gt.eq frac(2^(gamma m), 2 K_0 n^2) . $

As $P' < 2^(1 + gamma m)$, a uniform $j'$ hits one of these residues with probability at least $1 \/ \( 4 K_0 n^2 \)$.

Whenever this happens, the corresponding left record survives,
  and its complementary right record survives because their integer reduced weights sum to $T^F$.
  Their unreduced weights sum to $sum_(i in I) c_i - sum_(i in F) c_i eq.not t_s^F$, since $I$ is an alias.
  Thus this pair is not excluded, is visited, passes the disjointness test, and saves $I$.

Combining (5.14), (5.15), and the smaller-modulus probability, a single trial recovers $I$ with probability at least

$ frac(.005, m + 1) dot.op 1 / 2 dot.op frac(1, 4 K_0 n^2) gt.eq n^(- 4) $

for sufficiently large $n$. The useful layer may depend on the alias and on the trial:
  every layer is tried, with independent smaller-modulus randomness,
  so no choice of that layer is required by the algorithm.

===== 5.3.3 Simultaneous coverage and the caps. <simultaneous-coverage-and-the-caps.>

Conditional on $P$ and the transformed input, the $n^10$ trials for the fixed $s \, q$ are independent.
  The probability of missing $I$ in all of them is at most $\( 1 - n^(- 4) \)^(n^10) lt.eq e^(- n^6)$.
  There are at most $\( n N_0 + 1 \) 2^n$ target–subset pairs.
  A union bound therefore shows that all aliases are recovered with conditional probability $1 - o \( 1 \)$.
  This assertion holds for every prime satisfying Lemma 12.

Finally couple the capped procedure to this uncapped experiment,
  using the same random choices until a cap is exceeded. The probability of such an exceedance is $o \( 1 \)$ by
  the unconditional size estimates. We do not condition those estimates on a favorable prime or on successful
  coverage. Adding the sparse-distinction, coverage, and cap failure probabilities proves the simultaneous
  conclusion of Theorem 11. Its every-execution operation bound was proved above;
  bounded implementations of the finite draws add only the stated implementation overhead and a further uniformly
  vanishing failure probability.

== 6 The algorithm and its finite implementation <sec:implementation>

We now combine the two modular procedures. Their roles are complementary:
  the checksum counts every subset in a modular bin, whereas the extraction procedure identifies exactly the terms
  that do not belong to the integer bin. We first describe the resulting decision rule,
  then supply the finite arithmetic and bounded sampling needed to prove Theorem 1 in the stated machine model.

=== 6.1 Subtracting aliases <subtracting-aliases>

Choose a fixed sufficiently large integer $n_(*)$, whose requirements will be specified below.
  If $n < n_(*)$ or the bit-length guard (5.1) fails, use exact meet-in-the-middle on the original instance.
  Otherwise choose the tie weights and form $c_i \, t_s$ as in (2.1).
  Run the preliminary procedure of Proposition 5. Return its answer if it decides the instance;
  its outcome #smallcaps[Continue] means only that we proceed to the following steps.

Run the alias procedure of Theorem 11 to choose the large prime $P$ and obtain its alias lists.
  Write $cal(A)_s$ for its deduplicated set of aliases for target $t_s$.
  Every retained subset is checked using the original transformed integers,
  so even on an unsuccessful extraction run the set $cal(A)_s$ contains only genuine aliases.
  On a successful run it contains all of them. Next draw and retain the phases $phi.alt_1 \, dots.h \,
  phi.alt_n$ used in Theorem 9, and compute its estimates $hat(V)_(t_s med mod med P)$ for all target residues.
  Repeated residues can share an estimate. For each $s$, form the finite-precision quantity

#[#set math.equation(numbering: n => "(6.1)")
 $ hat(B)_s = hat(V)_(t_s med mod med P) - sum_(I in cal(A)_s) e_P (sum_(i in I) phi.alt_i) . $ <eq:subtract-aliases>]

Each phase in this subtraction is evaluated from the retained integer residues $phi.alt_i$; it is not resampled.
  Deduplication is by the binary subset itself, separately for each $s$, not by its sum or phase.

Output #smallcaps[Yes] if $\| hat(B)_s \| gt.eq 1 \/ 2$ for some $s$, and #smallcaps[No] otherwise.
  Since the computed real and imaginary parts are dyadic rationals,
  this test is implemented exactly by comparing the sum of their squares with $1 \/ 4$.
  Any failure declared by a capped main procedure or a main-procedure random sampler results in #smallcaps[No].
  This convention does not apply to the preliminary outcome #smallcaps[Continue].

The cancellation behind this decision rule is exact before numerical rounding. When extraction is complete,

#[#set math.equation(numbering: n => "(6.2)")
 $ V_(t_s med mod med P) - sum_(I in cal(A)_s) e_P (sum_(i in I) phi.alt_i) = B_s \, wide B_s :=
   sum_(I subset.eq \[ n \]\
sum_(i in I) c_i = t_s) e_P (sum_(i in I) phi.alt_i) . $ <eq:exact-bin-checksum>]

In particular, an empty exact bin has $B_s = 0$, and a bin containing one subset has $\| B_s \| = 1$,
  for every choice of phases. Thus isolation, rather than an anti-concentration estimate for a many-term sum,
  is what turns checksum estimation into a decision algorithm.

=== 6.2 Finite arithmetic and bounded sampling <sec:finite-arithmetic>

The preceding sections describe finite combinatorial constructions,
  but their analyses use exact uniform draws and exact complex values.
  We now implement both without unbounded running times or real-arithmetic instructions.
  All constants below are fixed independently of the input and of the exponent $c$ in the polynomial-bit convention.

===== 6.2.1 Integer data and implicit indices. <integer-data-and-implicit-indices.>

The input integers, transformed sums, targets, and signed record weights have $O \( b + log \( n + 2 \) \)$ bits.
  Masks have $n$ bits, and the residues, digit indices, block-table indices,
  and their tuples have polynomially many bits in $n$. Arithmetic on these objects is performed with ordinary
  multiword integer algorithms. For example, shift-and-add multiplication and binary long division use a
  polynomial number of bit operations in their operand lengths,
  and each bit operation is simulated by a constant number of allowed word operations. Signs are stored separately.

There is one useful distinction between a stored list and its implicit Cartesian products.
  In a sampled checksum pattern let $E_pi^(upright("hi")) \,
  E_pi^(upright("lo"))$ be the numbers of emitted high and low entries;
  retain the notation $L_pi$ for the number of matches. The entry caps imply on every execution,
  not only on the good event, that

#[#set math.equation(numbering: n => "(6.3)")
 $ L_pi lt.eq E_pi^(upright("hi")) E_pi^(upright("lo")) lt.eq
   2^(2 ceil.l \( tau + 20 epsilon.alt \) n ceil.r) . $ <eq:implicit-match-bitlength>]

Thus the possibly much larger match set is counted and indexed with $O \( n \)$-bit integers.
  The group counts, prefix sums, and blockwise multiplicities in (4.15) and (4.16) therefore require only
  polynomial arithmetic per operation. Those constructions index matches without an array indexed by all matches
  or by all $P$ residues.

The list generators in Sections 4 and 5 emit records one at a time and check their caps before the next write.
  The alias exclusion uses binary searches rather than a scan of the forbidden interval, as proved in Section 5.
  Merge sorting uses at most a constant multiple of the stored records as temporary storage,
  with polynomial arithmetic per comparison. The distinct-sum preliminary procedure can merge a list with its
  translate, discarding duplicates while emitting the next list;
  its temporary length is at most a constant multiple of the cap.

===== 6.2.2 Uniform draws with a deterministic time limit. <uniform-draws-with-a-deterministic-time-limit.>

A fair bit is obtained, for example, from the low bit of a fresh random word.
  To draw uniformly from ${ 0 \, dots.h \, q - 1 }$, draw $ceil.l log q
  ceil.r$ independent bits and reject if their integer value is at least $q$; for $q =
  1$ return zero without drawing. Each proposal is accepted with probability greater than $1 \/ 2$.
  Stop with failure after $n^3$ rejected proposals. Before that failure this is exactly the usual uniform sampler,
  and the probability of failure at any given call is at most $2^(- n^3)$.
  This implements random indices, residues, and a rational Bernoulli probability $p \/
  q$ by testing a uniform index against $p$. Uniform subsets of prescribed size are obtained by the first
  positions of a permutation generated by successive uniform choices among the remaining positions.
  The independent flip bits need no rejection.

For a prime in $\[ 2^h \, 2^(h + 1) \)$, draw uniform integers in this interval and test each for primality,
  stopping at the first prime. Try at most $n^3$ candidates.
  Conditional on a prime being found, it is uniform among the primes of the interval.
  The prime interval estimate used in Lemma 6 gives an acceptance probability at least $c_0 \/
  n$ for a fixed $c_0 > 0$ at the two prime scales used here.
  Thus failure has probability at most $exp \( - c_0 n^2 \)$. An exact test suffices:
  divide successively by the integers from $2$ through the integer square root of the candidate,
  with no divisor found if and only if it is prime. The integer square root is found by binary search.
  For the large prime this takes at most $2^(eta n \/ 2 + O \( 1 \)) "poly" \( n \)$ operations per candidate;
  the smaller prime tests are cheaper. The number of prime calls is polynomial in $n$.

Couple these samplers to ideal unlimited rejection samplers by using the same fresh bits until a cap is reached.
  There are at most $2^(O \( n \))$ ordinary sampling calls on any capped execution and polynomially many prime
  calls. These upper bounds depend on $n$ and the capped combinatorial loops, not on $b$;
  larger input integers increase the deterministic arithmetic cost per operation.
  The probability that the finite and ideal executions ever differ is therefore

#[#set math.equation(numbering: n => "(6.4)")
 $ 2^(O \( n \)) 2^(- n^3) + "poly" \( n \) exp \( - c_0 n^2 \) = o \( 1 \) . $ <eq:sampling-coupling>]

The bound also holds for calls chosen adaptively, since each new call has the stated failure bound conditional on
  its preceding history. One-way randomness causes no difficulty:
  retain phases and block-table labels when the algorithm needs them again,
  and discard other random words after use. No earlier random bit is subsequently requested from an external source.

===== 6.2.3 Complex evaluations and summation. <par:complex-evaluations>

The fixed-accuracy tests of Sections 3 and 4 use the same deterministic rational approximations at every
  occurrence. Their comparison results, including equality at a threshold, are therefore reproducible.
  They are distinct from the more accurate evaluations of the checksum itself.

For those evaluations, first reduce a phase exponent modulo $P$.
  Compute each resulting unit complex number to absolute error at most $2^(- 2 n^2)$,
  with dyadic real and imaginary parts. All of this is rational arithmetic of polynomial bit complexity.
  For completeness,

$ pi / 4 = arctan \( 1 \/ 2 \) + arctan \( 1 \/ 3 \) $

computes $pi$ by alternating power series whose remainders decrease geometrically.
  After the angle is reduced to $\[ 0 \, 2 pi \]$, the sine and cosine Taylor series approximate it to $q$ bits
  with $O \( q + 1 \)$ terms: their remainders are bounded by $7^(r + 1) \/ \( r + 1 \) !$,
  which is less than $2^(- q)$ for $r$ a sufficiently large constant multiple of $q + 1$.
  Computing a few additional bits bounds the effect of the angle error and the final dyadic rounding.
  Exact rational evaluation of these truncated series uses polynomially many bits and operations;
  even multiplying all the $O \( n \)$ dyadic factors without intermediate rounding remains within a polynomial
  bit bound.

To make the error accounting explicit, put $delta = 2^(- 2 n^2)$.
  The checksum term has $n$ factors of modulus at most $2$ and one leading unit phase.
  Approximating each to error $delta$ and telescoping the product gives error at most $\( n + 1 \)
  delta \( 2 + delta \)^n = 2^(- 2 n^2 + O \( n \))$. The exact rational weights in the estimator,
  including $L_pi \/ \( P mu_pi \( k \) \)$, have numerator and denominator of $O \( n \)$ bits on every execution
  that reaches this calculation, by (6.3); sampled matches always have positive multiplicity.
  Their magnitudes are at most $2^(O \( n \))$. The number of evaluated terms and all absolute sum bounds are also
  $2^(O \( n \))$, uniformly over the capped histories.

Round each weighted contribution to a common dyadic grid with $n^2$ fractional bits before adding it.
  This avoids multiplying unrelated denominators during summation.
  Exact addition of the resulting dyadics requires only $n^2 + O \( n \)$ bits,
  and the total evaluation and rounding error is at most

#[#set math.equation(numbering: n => "(6.5)")
 $ 2^(- n^2 + O \( n \)) = o \( 1 \) . $ <eq:finite-evaluation-error>]

Division by the power-of-two sample count $N$ preserves the dyadic representation and adds only $O \( n \)$
  fractional bits. Choose $n_(*)$ so that the error in (6.5) is at most the $1 \/
  16$ arithmetic allowance already included in the $1 \/ 8$ error bound of Theorem 9.
  The same construction applies to the direct alias sums in (6.1).
  Only polynomially many capped lists can contribute retained aliases,
  so their total number is $2^(O \( n \))$ even on an unsuccessful extraction run.
  Deduplication can only decrease this number. Increase $n_(*)$ so that the extra error in each direct alias sum
  is at most $1 \/ 16$. Together with the $1 \/ 8$ checksum accuracy of Theorem 9, this leaves

#[#set math.equation(numbering: n => "(6.6)")
 $ max_s \| hat(B)_s - B_s \| < 1 / 4 $ <eq:residual-accuracy>]

whenever extraction and checksum estimation succeed.

=== 6.3 Correctness and the uniform running-time bound <correctness-and-the-uniform-running-time-bound>

#proof[
  First consider an input above the fixed cutoff that satisfies (5.1).
    Fix any outcome of the tie weights, and hence all the integers $c_i \, t_s$.
    The proof divides according to the expectation of the deficiency on a uniform half;
    the algorithm never evaluates this expectation.
  If $bb(E) d \( V \) > 0.01004 n$, Proposition 5 returns an exact decision except with probability $o \( 1 \)$.
    If instead (2.3) holds, Theorem 11 gives complete alias extraction with probability $1 - o \( 1 \)$.
    Conditional on each fixed $P$ and transformed instance, Theorem 9 supplies all checksum estimates with
    probability $1 - o \( 1 \)$, uniformly in those data. The additional sampling loss is $o \( 1 \)$ by (6.4).
    These statements do not condition on the preliminary outcome #smallcaps[Continue].
    Equivalently, draw the independent main-procedure randomness even when the preliminary procedure decides and
    would not use it. On the event that the main procedure is successful, every preliminary continuation is safe,
    whereas an earlier exact answer is already correct. This establishes the required composition without changing
    the probability laws in either component theorem. Thus, for each fixed choice of tie weights,
    except with probability $o \( 1 \)$ the algorithm either returns the preliminary exact answer or uses complete
    aliases and accurate checksums in its final decision.
  For a #smallcaps[No] instance every transformed exact bin is empty, by Lemma 2.
    On the event just described, if the preliminary procedure has not already answered,
    then (6.6) forces every test to return #smallcaps[No]. For a #smallcaps[Yes] instance,
    isolation fails with probability at most $1 \/ 12$. When it succeeds,
    some transformed exact bin contains one subset. Equations (6.2) and (6.6) give $\| hat(B)_s \| > 3 \/
    4$ for that bin, and the algorithm returns #smallcaps[Yes].
    All the preceding $o \( 1 \)$ bounds are uniform over the guarded inputs and over the fixed tie weights.
    Choose the single constant $n_(*)$ sufficiently large that their total contribution is at most $1 \/ 12$.
    The success probability is then at least $1 - 1 \/ 12 - 1 \/ 12 = 5 \/ 6$,
    and in particular at least $2 \/ 3$. This cutoff is effective and independent of $b$ and $c$.
    The fixed filtering functions have explicit derivative bounds and positive lower bounds for their
    denominators, so the finite-circle approximation has an effective Riemann-sum error bound.
    The remaining requirements use the displayed tail estimates, positive exponent gaps,
    and the explicit prime density bound of Lemma 6. Taking a larger fixed integer meets all of them simultaneously.
  We next bound work on every random execution, including executions that abort.
    The preliminary list cap has exponent $0.489985$. The alias lists and enumerated pairs have exponent $tau =
    0.48996$, with polynomially many repetitions. The checksum bound is
  $ 2^(\( tau + 20 epsilon.alt \) n + O \( sqrt(n) \)) "poly" \( n \) . $
  The term $O \( sqrt(n) \)$ includes the number of patterns, block-table work,
    and direct multiplicity computations. Bounded rejection sampling and finite arithmetic multiply these costs by
    a fixed polynomial in $n + b + 2$. Trial division has exponent at most $eta \/ 2 =
    0.25886$ and polynomially many calls, so it is smaller. Since $tau + 20 epsilon.alt =
    0.4899602 < 0.489995$ and $0.489985 < 0.489995$, increasing the fixed cutoff once more gives fixed constants
    $K_0 \, K$ such that the total work is at most
  #[#set math.equation(numbering: n => "(6.7)")
   $ K_0 thin 2^(0.489995 n) \( n + b + 2 \)^K $ <eq:all-history-time>]
  on every guarded execution. Input reads, generation of the fixed approximation meshes, sorting, storage writes,
    and all random draws are included. In particular, no tables depending on $n$ are supplied to the program in advance.
  This operation bound also proves addressability without treating a multiword integer as a unit-cost value.
    Allocate a new word only when it is written; the number of allocated words cannot exceed (6.7).
    Its logarithm is at most
  $ 0.489995 n + K log \( n + b + 2 \) + O \( 1 \) . $
  For sufficiently large $n$, uniformly for every $b gt.eq 1$, the last two terms are at most $n + b + 2$,
    because $log x \/ x arrow.r 0$ uniformly for $x gt.eq n + 3$.
    The resulting bound is smaller than $w = ceil.l 4 \( n + b + log \( n + 2 \) \) ceil.r$.
    Every memory address therefore fits in a word. A polynomial-bit arithmetic operand is stored as as many words
    as necessary, and all operations on those words have already been charged.
  It remains to explain the fallback and the quantifiers. The program can find $b$ by scanning the input and
    counting the bits of its largest integer using shifts, at polynomial cost in $n + b + 2$.
    The guard is an integer comparison: $b^100000 lt.eq 2^n$ is equivalent to (5.1).
    The cutoff is tested first, and a comparison with this fixed integer may be implemented in finite control.
    On a failed guard or below $n_(*)$, divide the input into two halves, enumerate all their subset sums,
    sort one list, and search for a complementary sum for each element of the other.
    This includes the empty subsets, is exact on every input,
    and uses $2^(n \/ 2) "poly" \( n + b + 2 \)$ operations. Each original subset sum has at most $b +
    ceil.l log \( n + 1 \) ceil.r$ bits, so it fits in a word.
    The two lists, their sorting buffers, and their indices need only $O \( 2^(ceil.l n \/ 2 ceil.r) \)$ one-word
    records; a direct mergesort implementation fits the specified address space for every $n gt.eq 2$.
    No high-precision complex arithmetic is used in this fallback.
    For $n gt.eq n_(*)$, the polynomial storage used by the guard itself fits by the same $log \( n + b + 2 \) =
    o \( n + b \)$ bound as above. Thus the program terminates and is correct on inputs outside the asymptotic
    guarded range as well.
  Finally fix any positive integer $c$. For all sufficiently large $n$, every $b lt.eq
    n^c$ satisfies the guard and $n gt.eq n_(*)$. Substituting this inequality in (6.7) gives
  $ K_0 thin 2^(0.489995 n) \( n + n^c + 2 \)^K = O_c \( 2^(0.49 n) \) \, $
  because the fixed positive gap $0.49 - 0.489995 = 0.000005$ absorbs every fixed polynomial.
    The constants in this final comparison may depend on $c$, but the program, its cutoffs,
    its numerical coefficients, and all its sampling rules do not.
    This is exactly the uniform polynomial-bit quantification of Theorem 1. ◻
]

== 7 An elementary certificate for the filtering moments <app:numerical>

This appendix proves Proposition 7. There are three errors to control.
  Rational interval arithmetic encloses the values computed on a 64-point grid.
  The inner quadrature error compares those values with the true score functions at the grid points.
  The outer quadrature error then compares the average of the true node integrands with their circle integrals.
  We treat these errors in that order, after reducing the scores to two convolutions.
  All integrals are normalized circle integrals, and all decimal constants denote the indicated exact rationals.

=== 7.1 Reducing the scores to two convolutions <reducing-the-scores-to-two-convolutions>

Use the continuous functions of Section 3. Define

#[#set math.equation(numbering: n => "(7.1)")
 $ cal(P) \( x \) & = integral F \( x + w \) G \( w \) thin d w \,\
cal(Y) \( x \) & = integral F \( x + w \) G \( w \) \( r \( x + w \) + s \( w \) \) thin d w \,\
L \( x \) & = log Q \( x \) \, wide B \( x \) = frac(cal(Y) \( x \), cal(P) \( x \)) - log \( Z_f Z_g \) \,\
Z_(f \, kappa) & = integral F^kappa \, wide Z_(g \, kappa) = integral G^kappa \,\
H & = log Z_(f \, kappa) + log Z_(g \, kappa) - kappa log \( Z_f Z_g \) . $ <eq:numerical-convolutions>]

Here $Q = cal(P) \/ \( Z_f Z_g \)$, and direct substitution in the score definitions gives

#[#set math.equation(numbering: n => "(7.2)")
 $ D = B - L \, wide u = L + \( kappa - 1 \) B - H \, wide v = \( 2 - kappa \) B - 2 L +
   H . $ <eq:numerical-score-identities>]

Indeed, $B$ is the $K_x$-mean of $log \( f \( x + dot.op \) g \)$, whereas $A + E = kappa B - H$.
  These identities reduce the computation to the two convolutions in (7.1).

Write $x_j = 2 pi j \/ 64$ and $T_64 \( h \) = 64^(- 1) sum_(j = 0)^63 h \( x_j \)$.
  A hat means that each integral defining a quantity has been replaced by $T_64$;
  nonlinear operations are performed after these replacements. In particular

$ hat(cal(P))_j = 1 / 64 sum_(i = 0)^63 F \( x_(i + j) \) G \( x_i \) \, quad hat(cal(Y))_j = 1 /
  64 sum_(i = 0)^63 F \( x_(i + j) \) G \( x_i \) \( r \( x_(i + j) \) + s \( x_i \) \) \, $

where indices are taken modulo 64. Let $hat(X)_j$ and $hat(X)'_j$ be the values of the first and second integrands
  in (3.6), respectively, obtained from $hat(L) \, hat(B) \, hat(H)$ using (7.2).

=== 7.2 Finite arithmetic certificate <finite-arithmetic-certificate>

Put $beta = 0.19$, and let $r_beta \, s_beta$ be obtained from $r \,
  s$ by multiplying their $j$th cosine coefficients by $cosh \( beta j \)$. The following enclosures will suffice.
  In the first four rows the error is at most $5 dot.op 10^(- 7)$,
  and in the last two it is at most $5 dot.op 10^(- 6)$.

#[
  #set par(justify: false)
#table(
  columns: 2,
  align: (left, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Quantity
], table.cell(rowspan: 1, colspan: 1)[Center of enclosure
]),
  table.cell(rowspan: 1, colspan: 1)[$hat(Z)_f$
], table.cell(rowspan: 1, colspan: 1)[$1.1963625$
],
  table.cell(rowspan: 1, colspan: 1)[$hat(Z)_g$
], table.cell(rowspan: 1, colspan: 1)[$1.2877407$
],
  table.cell(rowspan: 1, colspan: 1)[$hat(Z)_(f \, kappa)$
], table.cell(rowspan: 1, colspan: 1)[$1.2110790$
],
  table.cell(rowspan: 1, colspan: 1)[$hat(Z)_(g \, kappa)$
], table.cell(rowspan: 1, colspan: 1)[$1.3038111$
],
  table.cell(rowspan: 1, colspan: 1)[$T_64 \( 2^(2 r_beta) \)$
], table.cell(rowspan: 1, colspan: 1)[$2.4901514$
],
  table.cell(rowspan: 1, colspan: 1)[$T_64 \( 2^(2 s_beta) \)$
], table.cell(rowspan: 1, colspan: 1)[$2.2607200$
],
)
]

Table 1 gives the remaining node enclosures. The errors in its four numerical columns are at most $4 dot.op
  10^(- 6)$, $2 dot.op 10^(- 5)$, $0.0004$, and $0.0004$, respectively.
  All columns are invariant under $j mapsto 64 - j$. Consequently,
  averaging the last two columns with weight one at $j = 0 \, 32$ and weight two otherwise,
  including their stated errors, gives

#[#set math.equation(numbering: n => "(7.3)")
 $ 1 / 64 sum_(j = 0)^63 hat(X)_j < 1.4295 \, wide 1 / 64 sum_(j = 0)^63 hat(X)'_j < 1.4295 .
   $ <eq:hatted-average-bound>]

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (right, right, right, right, right,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[$j$
], table.cell(rowspan: 1, colspan: 1)[$hat(cal(P))_j$
], table.cell(rowspan: 1, colspan: 1)[$hat(cal(Y))_j$
], table.cell(rowspan: 1, colspan: 1)[$hat(X)_j$
], table.cell(rowspan: 1, colspan: 1)[$hat(X)'_j$
]),
  table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[1.7255739
], table.cell(rowspan: 1, colspan: 1)[2.3814527
], table.cell(rowspan: 1, colspan: 1)[1.71479
], table.cell(rowspan: 1, colspan: 1)[1.72487
],
  table.cell(rowspan: 1, colspan: 1)[1
], table.cell(rowspan: 1, colspan: 1)[1.7267975
], table.cell(rowspan: 1, colspan: 1)[2.3812891
], table.cell(rowspan: 1, colspan: 1)[1.70072
], table.cell(rowspan: 1, colspan: 1)[1.70914
],
  table.cell(rowspan: 1, colspan: 1)[2
], table.cell(rowspan: 1, colspan: 1)[1.7298232
], table.cell(rowspan: 1, colspan: 1)[2.3798409
], table.cell(rowspan: 1, colspan: 1)[1.66451
], table.cell(rowspan: 1, colspan: 1)[1.66858
],
  table.cell(rowspan: 1, colspan: 1)[3
], table.cell(rowspan: 1, colspan: 1)[1.7329951
], table.cell(rowspan: 1, colspan: 1)[2.3749116
], table.cell(rowspan: 1, colspan: 1)[1.62068
], table.cell(rowspan: 1, colspan: 1)[1.61932
],
  table.cell(rowspan: 1, colspan: 1)[4
], table.cell(rowspan: 1, colspan: 1)[1.7343372
], table.cell(rowspan: 1, colspan: 1)[2.3645517
], table.cell(rowspan: 1, colspan: 1)[1.58491
], table.cell(rowspan: 1, colspan: 1)[1.57884
],
  table.cell(rowspan: 1, colspan: 1)[5
], table.cell(rowspan: 1, colspan: 1)[1.7323079
], table.cell(rowspan: 1, colspan: 1)[2.3482031
], table.cell(rowspan: 1, colspan: 1)[1.56813
], table.cell(rowspan: 1, colspan: 1)[1.55943
],
  table.cell(rowspan: 1, colspan: 1)[6
], table.cell(rowspan: 1, colspan: 1)[1.7263040
], table.cell(rowspan: 1, colspan: 1)[2.3267607
], table.cell(rowspan: 1, colspan: 1)[1.57405
], table.cell(rowspan: 1, colspan: 1)[1.56556
],
  table.cell(rowspan: 1, colspan: 1)[7
], table.cell(rowspan: 1, colspan: 1)[1.7167948
], table.cell(rowspan: 1, colspan: 1)[2.3018438
], table.cell(rowspan: 1, colspan: 1)[1.59915
], table.cell(rowspan: 1, colspan: 1)[1.59372
],
  table.cell(rowspan: 1, colspan: 1)[8
], table.cell(rowspan: 1, colspan: 1)[1.7051334
], table.cell(rowspan: 1, colspan: 1)[2.2751159
], table.cell(rowspan: 1, colspan: 1)[1.63351
], table.cell(rowspan: 1, colspan: 1)[1.63323
],
  table.cell(rowspan: 1, colspan: 1)[9
], table.cell(rowspan: 1, colspan: 1)[1.6931319
], table.cell(rowspan: 1, colspan: 1)[2.2480097
], table.cell(rowspan: 1, colspan: 1)[1.66273
], table.cell(rowspan: 1, colspan: 1)[1.66812
],
  table.cell(rowspan: 1, colspan: 1)[10
], table.cell(rowspan: 1, colspan: 1)[1.6824618
], table.cell(rowspan: 1, colspan: 1)[2.2214392
], table.cell(rowspan: 1, colspan: 1)[1.67219
], table.cell(rowspan: 1, colspan: 1)[1.68188
],
  table.cell(rowspan: 1, colspan: 1)[11
], table.cell(rowspan: 1, colspan: 1)[1.6740048
], table.cell(rowspan: 1, colspan: 1)[2.1950779
], table.cell(rowspan: 1, colspan: 1)[1.65371
], table.cell(rowspan: 1, colspan: 1)[1.66486
],
  table.cell(rowspan: 1, colspan: 1)[12
], table.cell(rowspan: 1, colspan: 1)[1.6673951
], table.cell(rowspan: 1, colspan: 1)[2.1665832
], table.cell(rowspan: 1, colspan: 1)[1.61070
], table.cell(rowspan: 1, colspan: 1)[1.62013
],
  table.cell(rowspan: 1, colspan: 1)[13
], table.cell(rowspan: 1, colspan: 1)[1.6610380
], table.cell(rowspan: 1, colspan: 1)[2.1317550
], table.cell(rowspan: 1, colspan: 1)[1.55729
], table.cell(rowspan: 1, colspan: 1)[1.56268
],
  table.cell(rowspan: 1, colspan: 1)[14
], table.cell(rowspan: 1, colspan: 1)[1.6527012
], table.cell(rowspan: 1, colspan: 1)[2.0862092
], table.cell(rowspan: 1, colspan: 1)[1.51133
], table.cell(rowspan: 1, colspan: 1)[1.51181
],
  table.cell(rowspan: 1, colspan: 1)[15
], table.cell(rowspan: 1, colspan: 1)[1.6404589
], table.cell(rowspan: 1, colspan: 1)[2.0278888
], table.cell(rowspan: 1, colspan: 1)[1.48634
], table.cell(rowspan: 1, colspan: 1)[1.48247
],
  table.cell(rowspan: 1, colspan: 1)[16
], table.cell(rowspan: 1, colspan: 1)[1.6235129
], table.cell(rowspan: 1, colspan: 1)[1.9586974
], table.cell(rowspan: 1, colspan: 1)[1.48675
], table.cell(rowspan: 1, colspan: 1)[1.48020
],
  table.cell(rowspan: 1, colspan: 1)[17
], table.cell(rowspan: 1, colspan: 1)[1.6024686
], table.cell(rowspan: 1, colspan: 1)[1.8838599
], table.cell(rowspan: 1, colspan: 1)[1.50690
], table.cell(rowspan: 1, colspan: 1)[1.50018
],
  table.cell(rowspan: 1, colspan: 1)[18
], table.cell(rowspan: 1, colspan: 1)[1.5789685
], table.cell(rowspan: 1, colspan: 1)[1.8092831
], table.cell(rowspan: 1, colspan: 1)[1.53309
], table.cell(rowspan: 1, colspan: 1)[1.52883
],
  table.cell(rowspan: 1, colspan: 1)[19
], table.cell(rowspan: 1, colspan: 1)[1.5549462
], table.cell(rowspan: 1, colspan: 1)[1.7387429
], table.cell(rowspan: 1, colspan: 1)[1.54784
], table.cell(rowspan: 1, colspan: 1)[1.54794
],
  table.cell(rowspan: 1, colspan: 1)[20
], table.cell(rowspan: 1, colspan: 1)[1.5318669
], table.cell(rowspan: 1, colspan: 1)[1.6725904
], table.cell(rowspan: 1, colspan: 1)[1.53630
], table.cell(rowspan: 1, colspan: 1)[1.54099
],
  table.cell(rowspan: 1, colspan: 1)[21
], table.cell(rowspan: 1, colspan: 1)[1.5101580
], table.cell(rowspan: 1, colspan: 1)[1.6080342
], table.cell(rowspan: 1, colspan: 1)[1.49268
], table.cell(rowspan: 1, colspan: 1)[1.50055
],
  table.cell(rowspan: 1, colspan: 1)[22
], table.cell(rowspan: 1, colspan: 1)[1.4888661
], table.cell(rowspan: 1, colspan: 1)[1.5397614
], table.cell(rowspan: 1, colspan: 1)[1.42405
], table.cell(rowspan: 1, colspan: 1)[1.43289
],
  table.cell(rowspan: 1, colspan: 1)[23
], table.cell(rowspan: 1, colspan: 1)[1.4655935
], table.cell(rowspan: 1, colspan: 1)[1.4601151
], table.cell(rowspan: 1, colspan: 1)[1.34881
], table.cell(rowspan: 1, colspan: 1)[1.35678
],
  table.cell(rowspan: 1, colspan: 1)[24
], table.cell(rowspan: 1, colspan: 1)[1.4368999
], table.cell(rowspan: 1, colspan: 1)[1.3596108
], table.cell(rowspan: 1, colspan: 1)[1.29024
], table.cell(rowspan: 1, colspan: 1)[1.29629
],
  table.cell(rowspan: 1, colspan: 1)[25
], table.cell(rowspan: 1, colspan: 1)[1.3993369
], table.cell(rowspan: 1, colspan: 1)[1.2292982
], table.cell(rowspan: 1, colspan: 1)[1.26827
], table.cell(rowspan: 1, colspan: 1)[1.27187
],
  table.cell(rowspan: 1, colspan: 1)[26
], table.cell(rowspan: 1, colspan: 1)[1.3509552
], table.cell(rowspan: 1, colspan: 1)[1.0651814
], table.cell(rowspan: 1, colspan: 1)[1.29131
], table.cell(rowspan: 1, colspan: 1)[1.29177
],
  table.cell(rowspan: 1, colspan: 1)[27
], table.cell(rowspan: 1, colspan: 1)[1.2926991
], table.cell(rowspan: 1, colspan: 1)[0.8725981
], table.cell(rowspan: 1, colspan: 1)[1.34397
], table.cell(rowspan: 1, colspan: 1)[1.33998
],
  table.cell(rowspan: 1, colspan: 1)[28
], table.cell(rowspan: 1, colspan: 1)[1.2289553
], table.cell(rowspan: 1, colspan: 1)[0.6674810
], table.cell(rowspan: 1, colspan: 1)[1.36465
], table.cell(rowspan: 1, colspan: 1)[1.35461
],
  table.cell(rowspan: 1, colspan: 1)[29
], table.cell(rowspan: 1, colspan: 1)[1.1668804
], table.cell(rowspan: 1, colspan: 1)[0.4731120
], table.cell(rowspan: 1, colspan: 1)[1.23032
], table.cell(rowspan: 1, colspan: 1)[1.21474
],
  table.cell(rowspan: 1, colspan: 1)[30
], table.cell(rowspan: 1, colspan: 1)[1.1147571
], table.cell(rowspan: 1, colspan: 1)[0.3140122
], table.cell(rowspan: 1, colspan: 1)[0.82842
], table.cell(rowspan: 1, colspan: 1)[0.81341
],
  table.cell(rowspan: 1, colspan: 1)[31
], table.cell(rowspan: 1, colspan: 1)[1.0800632
], table.cell(rowspan: 1, colspan: 1)[0.2102374
], table.cell(rowspan: 1, colspan: 1)[0.27604
], table.cell(rowspan: 1, colspan: 1)[0.26987
],
  table.cell(rowspan: 1, colspan: 1)[32
], table.cell(rowspan: 1, colspan: 1)[1.0678994
], table.cell(rowspan: 1, colspan: 1)[0.1742636
], table.cell(rowspan: 1, colspan: 1)[0
], table.cell(rowspan: 1, colspan: 1)[0
],
)
]],
  caption: [Table 2: Node enclosures for the filtering certificate. The allowed absolute errors are $4 dot.op 10^(- 6)$, $2 dot.op 10^(- 5)$, $0.0004$, and $0.0004$, respectively. Symmetry supplies the nodes $33 \, dots.h \, 63$. ],
)

We specify elementary rational operations that reproduce these enclosures.
  The numbers $cos x_j$, for $0 lt.eq j lt.eq 16$, lie within $3 dot.op 10^(- 10)$ of the following values, in order:

$ 1 & 0.9951847267 & 0.9807852804 & 0.9569403357 & 0.9238795325\
0.8819212643 & 0.8314696123 & 0.7730104534 & 0.7071067812 & 0.6343932842\
0.5555702330 & 0.4713967368 & 0.3826834324 & 0.2902846773 & 0.1950903220\
0.0980171403 & 0 $

For example, these intervals follow by using the cosine series through degree 24,
  with remainder at most $\| t \|^26 \/ 26 !$, and

$ 3.1415926535897 < pi < 3.1415926535899 . $

The latter enclosure follows from $pi \/ 4 = arctan \( 1 \/ 2 \) +
  arctan \( 1 \/ 3 \)$ and the alternating arctangent series through degree 159.
  Reflection and a half-turn give the remaining cosine intervals.
  Taking the dot products with the coefficients in (3.5), with indices reduced modulo 64,
  gives rational intervals for every $r \( x_j \) \, s \( x_j \)$.

For all the exponential evaluations one may use

#[#set math.equation(numbering: n => "(7.4)")
 $ exp \( t \) in sum_(i = 0)^45 frac(t^i, i !) + [- R_exp \( t \) \, R_exp \( t \)] \, wide R_exp \( t \) =
   frac(\| t \|^46, 46 ! thin \( 1 - \| t \| \/ 47 \)) . $ <eq:certificate-exp>]

All arguments needed for the finite tables have $\| t \| lt.eq 8$.
  For logarithms put $d = \( y - 1 \) \/ \( y + 1 \)$ and use

#[#set math.equation(numbering: n => "(7.5)")
 $ ln y in 2 sum_(i = 0)^15 frac(d^(2 i + 1), 2 i + 1) + [- R_log \( y \) \, R_log \( y \)] \, wide
   R_log \( y \) = frac(2 \| d \|^33, 33 \( 1 - d^2 \)) . $ <eq:certificate-log>]

These follow by bounding the remaining absolutely convergent tails;
  in particular they give $0.693147180559 < ln 2 < 0.693147180561$.
  Compute powers of two as $exp \( t ln 2 \)$, and compute $cosh t = \( exp t + exp \( - t \) \) \/ 2$.
  Apply interval addition, multiplication, and division to the displayed finite sums and then to

$ hat(L)_j & = log hat(cal(P))_j - log hat(Z)_f - log hat(Z)_g \,\
hat(B)_j & = hat(cal(Y))_j \/ hat(cal(P))_j - log hat(Z)_f - log hat(Z)_g \,\
hat(H) & = log hat(Z)_(f \, kappa) + log hat(Z)_(g \, kappa) - kappa \( log hat(Z)_f + log hat(Z)_g \) . $

These operations give the stated enclosures. The intermediate intervals may be kept at their rational endpoints;
  the displayed decimal columns are final enclosures, not instructions to round intermediate calculations.
  Thus the tables and the two explicit series remainder bounds constitute a finite arithmetic certificate.

=== 7.3 Controlling the inner quadratures <controlling-the-inner-quadratures>

We use the following form of the analytic trapezoid estimate #cite(label("TrefethenWeideman2014")) Theorem 3.2.
  If a $2 pi$-periodic function $h$ is analytic on a neighborhood of the closed strip $\| "Im" z \| lt.eq
  sigma$ and $\| h \( z \) \| lt.eq B_0$ there, then

#[#set math.equation(numbering: n => "(7.6)")
 $ lr(|T_64 \( h \) - integral h|) lt.eq frac(2 B_0, e^(64 sigma) - 1) . $ <eq:analytic-trapezoid>]

Indeed, shifting the contour for its $k$th Fourier coefficient toward the appropriate boundary gives $\|
  hat(h) \( k \) \| lt.eq B_0 e^(- \| k \| sigma)$. Averaging at the 64 nodes retains precisely the coefficients
  indexed by multiples of 64; the nonzero multiples have total absolute value at most the right side of (7.6).

For the inner integrals defining the hatted values, take $sigma = 0.45$.
  The inequality $\| cos \( j z \) \| lt.eq cosh \( j sigma \)$ and the displayed coefficients give

$ \| r \( z \) \| < 6.50 \, wide \| s \( z \) \| < 8.71 \, wide \| 2 r_beta \( z \) \| < 18.4 \,
  wide \| 2 s_beta \( z \) \| < 22.4 . $

For instance these are obtained by summing the absolute coefficients times $cosh \( 0.45 j \)$;
  the two last bounds also include the factor $2 cosh \( 0.19 j \)$.
  Formula (7.6) gives the following errors, distinct from the finite-table rounding errors:

#[#set math.equation(numbering: n => "(7.7)")
 $ upright("Quantity") & upright("Error caused by quadrature")\
Z_f \, Z_g \, Z_(f \, kappa) \, Z_(g \, kappa) & 4 dot.op 10^(- 10)\
cal(P) \( x_j \) & 3 dot.op 10^(- 8)\
cal(Y) \( x_j \) & 5 dot.op 10^(- 7)\
integral 2^(2 r_beta) \, med integral 2^(2 s_beta) & 5 dot.op 10^(- 6) $ <eq:inner-quadrature-errors>]

In detail the respective strip bounds can be taken as $2^(kappa thin 8.71)$, $2^(6.50 + 8.71)$,
  $\( 6.50 + 8.71 \) 2^(6.50 + 8.71)$, and $2^22.4$. Substituting them in (7.6) proves every row of (7.7) by
  elementary rational bounds on the exponential.

Using the ranges in Table 1 to propagate these errors through (7.1) gives, at every node,

#[#set math.equation(numbering: n => "(7.8)")
 $ \| L - hat(L) \| < 10^(- 7) \, wide \| B - hat(B) \| < 2 dot.op 10^(- 6) \, wide \| H -
   hat(H) \| < 5 dot.op 10^(- 9) . $ <eq:node-score-errors>]

For example, division is safe because $hat(cal(P))_j > 1.06789$, and $\| log x - log y \| lt.eq \| x -
  y \| \/ \( min \( x \, y \) ln 2 \)$ controls the logarithms.
  Applying (7.2) to (7.8) shows that either true node integrand is at most $1.00001$ times its hatted value.
  This also holds at $x_32 = pi$, where both values are zero. We have therefore proved

#[#set math.equation(numbering: n => "(7.9)")
 $ T_64 \( M^2 2^(8.5 \( Delta - u \)) \) < 1.4295 \( 1.00001 \) \, wide
   T_64 \( M^2 2^(8.3 \( a v - u \)) \) < 1.4295 \( 1.00001 \) . $ <eq:outer-node-bound>]

It remains to control the outer quadrature, whose integrands involve the logarithm and quotient in (7.1).

=== 7.4 An analytic strip for the outer integrands <an-analytic-strip-for-the-outer-integrands>

The first table and (7.7) give

#[#set math.equation(numbering: n => "(7.10)")
 $ integral \| f \( w + i beta \) \|^2 thin d w = Z_f^(- 2) integral 2^(2 r_beta \( w \)) thin d w < 1.761 \, wide
   integral \| g \( w + i beta \) \|^2 thin d w < 1.38 . $ <eq:shifted-l2>]

The same bounds hold for imaginary shifts of absolute value at most $beta$.
  To see this directly, the functions are real on the real circle,
  so Parseval’s identity pairs their positive and negative Fourier coefficients into nonnegative multiples of
  $cosh \( 2 k y \)$; their squared norms are thus nondecreasing in $\| y \|$.
  Their shifted means remain one by contour shifting. Hence the corresponding squared norms for $f - 1$ and $g -
  1$ are less than $0.761$ and $0.38$.

For $z = x + i y$ with $\| y \| lt.eq 0.38 = 2 beta$, periodic contour shifting in (3.1) yields

$ Q \( z \) = integral f \( x + w + i y \/ 2 \) g \( w - i y \/ 2 \) thin d w . $

Subtracting the product of the shifted means and applying Cauchy–Schwarz gives

#[#set math.equation(numbering: n => "(7.11)")
 $ \| Q \( z \) - 1 \| lt.eq sqrt(0.761 dot.op 0.38) < 0.54 . $ <eq:Q-strip>]

In particular $Q$ has no zeros on this strip, and $L = log Q = \( ln Q \) \/ ln
  2$ is analytic there with the branch real on the real axis. Moreover

$ - "Re" L lt.eq - log 0.46 < 1.121 . $

The numerator $Q B$ is also analytic. The same split contour gives, for every $\| y \| lt.eq 2 beta$,

$ Q \( z \) B \( z \) = integral & f \( x + w + i y \/ 2 \) g \( w - i y \/ 2 \)\
 &  dot.op #scale(x: 120%, y: 120%)[\(] r \( x + w + i y \/ 2 \) + s \( w - i y \/ 2 \) -
   log \( Z_f Z_g \) #scale(x: 120%, y: 120%)[\)] thin d w . $

This uses the analytic expression $r + s - log \( Z_f Z_g \)$ for the logarithm of the product,
  not a new branch choice. Each factor is evaluated within the strip of half-width $beta$,
  where the coefficient sums give $\| r \| < 2.96$ and $\| s \| < 4.67$.
  Consequently, on the full strip of half-width $2 beta$,

#[#set math.equation(numbering: n => "(7.12)")
 $ \| Q B \| lt.eq sqrt(1.761 dot.op 1.38) #scale(x: 120%, y: 120%)[\(] 2.96 + 4.67 + log Z_f +
   log Z_g #scale(x: 120%, y: 120%)[\)] < 13 \, wide \| B \| < 13 \/ 0.46 . $ <eq:B-strip>]

The normalizer enclosures also give $H < 0.016$.

Now (7.2), (7.11), and (7.12) imply

$ 8.5 "Re" \( Delta - u \) lt.eq 8.5 (0.02776 + 1.121 + 0.0315 13 / 0.46 + 0.016) < 17.6 . $

For the second exponent use the exact identity

$ a v - u = - \( 1 + 2 a \) L + #scale(x: 120%, y: 120%)[\(] a \( 2 - kappa \) - \( kappa - 1 \)
  #scale(x: 120%, y: 120%)[\)] B + \( 1 + a \) H . $

The same bounds give

$ 8.3 "Re" \( a v - u \) lt.eq
  8.3 (\( 1 + 2 a \) 1.121 + \| a \( 2 - kappa \) - \( kappa - 1 \) \| 13 / 0.46 + \( 1 + a \) 0.016) < 17.6 . $

Finally $\| 2 + 2 cos z \| lt.eq 2 + 2 cosh \( 0.38 \) < 4.16$.
  Both outer integrands therefore extend analytically to the strip $\| "Im" z \| lt.eq
  0.38$ and have absolute value below $2^20$ there. (The strict bounds also give a neighborhood of the closed
  strip.) Formula (7.6) bounds either outer quadrature error by

$ frac(2^21, e^(64 dot.op 0.38) - 1) < 0.00007 . $

Combining this with (7.9), each integral in (3.6) is strictly less than

$ 1.4295 \( 1.00001 \) + 0.00007 = 1.429584295 < 2^0.5168 . $

The last comparison follows already from $2^0.5168 > 1.4307781$, obtained from (7.4).
  This proves both filtering moments.

#bibliography("refs.bib", style: "ieee", title: [References])
