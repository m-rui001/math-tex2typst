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

#align(center)[#text(size: 16pt, weight: "bold")[Quantitative lower bounds for trace reconstruction]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

For a binary word $x$ and a known deletion probability $q in \( 0 \, 1 \)$, let $cal(D)_q \( x \)$ denote the law obtained by deleting each bit independently with probability $q$ and concatenating the surviving bits in their original order. The retention probability is $p = 1 - q$. A sample from this law is a #emph[complete trace]: its length and all surviving bits are observed, without the positions they occupied in $x$.

For $s in \( 0 \, 1 \]$, let $T_(q \, s) \( n \)$ be the least nonnegative integer $m$ for which an estimator, given $n \, q$ and $m$ independent complete traces, recovers every $x in { 0 \, 1 }^n$ with probability at least $s$. The estimator may be randomized and its computation is unrestricted. If no finite $m$ suffices, set $T_(q \, s) \( n \) = + oo$. Write $T_q \( n \) = T_(q \, 2 \/ 3) \( n \)$. Our lower bounds concern this fixed sample budget.

#thm([Theorem 1.1.])[
  (Quantitative sample lower bound).  #emph[Fix $s in \( 0 \, 1 \]$ and $0 < c < 1 \/ \( 4 log 2 \)$. Along every sequence of instances $\( n \, q \)$ with $n arrow.r oo$, $q in \( 0 \, 1 \)$, and $q^3 log n arrow.r oo$, 
#[#set math.equation(numbering: n => "(1.1)")
 $ T_(q \, s) \( n \) gt.eq n^(c log \( q^3 log n \)) $ <eq:main-bound>]

 eventually. All logarithms are natural. In particular, for each fixed deletion probability $q in \( 0 \, 1 \)$ and fixed positive success probability $s$, the required sample number is $n^(Omega \( log log n \))$.]
] <thm:main>

The varying-channel statement keeps the requested channel fixed throughout the construction for each instance; it is allowed to change only when the instance changes. The result gives a negative answer to the polynomial-sample question for deterministic binary inputs at every fixed deletion probability. A separate consequence concerns one-trace indistinguishability itself. For laws on the countable set of finite binary words, write

$ "TV" \( P \, Q \) = 1 / 2 sum_w \| P \( w \) - Q \( w \) \| . $

#thm([Theorem 1.2.])[
  (Superpolynomial one-trace indistinguishability).  #emph[For every fixed deletion probability $q in \( 0 \, 1 \)$, 
#[#set math.equation(numbering: n => "(1.2)")
 $ lim_(n arrow.r oo) n^A min_(x \, y in { 0 \, 1 }^n\
x eq.not y) "TV" #scale(x: 120%, y: 120%)[\(] cal(D)_q \( x \) \, cal(D)_q \( y \) #scale(x: 120%, y: 120%)[\)] = 0 #h(2em) upright("for every ") A > 0 . $ <eq:min-tv>]

 At this same channel $T_(q \, s) \( n \) \/ n^A arrow.r oo$ for every fixed $A > 0$ and $s in \( 0 \, 1 \]$.]
] <thm:tv>

The channel is fixed independently of $A$. The proof of (1.2) uses an explicit score and approximation bound. Since the minimum is attained at every $n$, a single sequence of minimizing pairs realizes all the limits simultaneously.

=== 1.1 History and comparison with earlier results <history-and-comparison-with-earlier-results>

Reconstructing a sequence from repeated corrupted observations has a long history. Levenshtein studied both combinatorial and memoryless channel formulations #cite(label("Levenshtein2001")). Batu, Kannan, Khanna, and McGregor studied the independent-deletion trace problem in connection with multiple sequence alignment and outlined a linear sample obstruction at fixed deletion probability #cite(label("Batu2004")) Section 4.2. Later lower bounds for complete traces focused on the difficulty of locating a small discrepancy within a long background. McGregor, Price, and Vorotnikova analyzed neighboring positions of a single one among zeros, using Hellinger distance and common mass #cite(label("MPV2014")). Holden and Lyons used a defect in an alternating background to prove $Omega \( n^(5 \/ 4) \/ sqrt(log n) \)$ #cite(label("HoldenLyons2020")) #cite(label("HoldenLyonsErratum2022")), and Chase obtained $Omega \( n^(3 \/ 2) \/ log^7 n \)$ by a direct Hellinger calculation for a related pair #cite(label("Chase2021Lower")). The displayed Holden–Lyons and Chase rates fix the channel and a reconstruction success greater than $1 \/ 2$. Our seed starts from the periodic defect family used by Chase and makes signed choices across many periods; it also supplies the overlap and score estimates needed for repeated amplification.

For fixed deletion probability, Holenstein, Mitzenmacher, Panigrahy, and Wieder obtained a worst-case upper bound of $exp \( tilde(O) \( sqrt(n) \) \)$ #cite(label("HMPW2008")), where $tilde(O)$ suppresses polylogarithmic factors. Independently, De, O’Donnell, and Servedio and Nazarov and Peres improved it to $exp \( O \( n^(1 \/ 3) \) \)$ #cite(label("DOS2017")) #cite(label("NP2017")), and Chase obtained $exp \( O \( n^(1 \/ 5) log^5 n \) \)$ #cite(label("Chase2021Upper")). The 2026 preprint of Burudgunte, Valiant, and Wang gives $exp \( p^(- 7 \/ 3) \( log_2 n \)^(C_0) \)$ samples for a universal constant $C_0$ and every positive retention probability $p = 1 - q$ #cite(label("BVW2026")). At fixed $p$ this is a quasipolynomial sample upper bound; the cited preprint does not give a quasipolynomial-time reconstruction algorithm. The logarithm of this sample bound is a fixed power of $log n$, whereas the logarithm of our lower bound at a fixed channel has order $\( log n \) \( log log n \)$, leaving a gap between the rates. The companion paper #emph[Uniform quasipolynomial-time trace reconstruction] proves such a time bound for every fixed known rational retention probability #cite(label("OAI:Uniform-quasipolynomial-time-trace-reconstruction-October-5-2026")).

Polynomial reconstruction remains possible under other channel or input conditions. For every fixed $epsilon > 0$, Chen, De, Lee, Servedio, and Sinha give reconstruction in polynomial time when $q lt.eq n^(- 1 \/ 3 - epsilon)$, using $O \( n^(4 \/ 3) \)$ traces #cite(label("CDLSS2021LowDeletion")). Those deletion probabilities lie outside the regime $q^3 log n arrow.r oo$ of Theorem 1. Aamand, Liu, and Narayanan prove polynomial reconstruction when the internal zero gaps between successive ones have length at least a sufficiently large constant times $\( log n \)^8$ and the deletion probability is at most a sufficiently small universal constant #cite(label("ALN2025")).

Some lower bounds restrict the available statistics. De, O’Donnell, and Servedio measure the precision required of an oracle returning an $ell^1$ approximation to the expected trace vector padded with zeros, while Nazarov and Peres study repeated observations of one fixed output coordinate #cite(label("DOS2017")) #cite(label("NP2017")). Chen, De, Lee, and Servedio study a tolerance oracle for functions of contiguous blocks of trace coordinates #cite(label("CDLS2024")). Their lower bounds concern those specified statistics. A different input model is studied by Rivkin, Valiant, and Valiant: the input is a fixed probability vector, with fresh Bernoulli bits drawn from it before each trace. For deletion probability at least a constant times $n^(- 1 \/ 2)$, their generalized trace laws can have total variation $exp \( - Omega \( sqrt(n) \) \)$ #cite(label("RivkinValiantValiant2025")). Their arguments using translated segments and cancellation are related to the observation constructed in Section 6. Theorems 1 and 2 concern the entire trace law of one deterministic binary word.

=== 1.2 Mechanism and proof structure <mechanism-and-proof-structure>

Our construction hides differences in location at several scales. The basic source of hidden randomness is exact common mass. If trace laws for $k$ and $k + 1$ copies of a word share mass $omega$, place such a pair of runs on opposite sides of a central segment and choose their orientation by a fair bit. Their joint trace laws share a product component of mass $omega^2$. On that component the orientation remains fair even after the side outputs are reported. Many independent pairs therefore leave a binomial uncertainty in the position of the central segment. Marginalizing the flags restores the product of the two side trace laws for each orientation. Concatenating independent genuine traces of a partition of the fixed word then recovers its trace law exactly. At later scales the preliminary observation uses earlier auxiliary outputs at its leaves and allows rare failed layouts; at every scale, conditioning to obtain likelihood domination adds a small change. The resulting auxiliary laws therefore have an approximate common projection to genuine traces, with all these losses recorded in the invariant.

The two words use complementary signed patterns in their central segments. The generating polynomial of a Prouhet–Thue–Morse pattern vanishes to high order at $1$ #cite(label("AlloucheShallit1999")) Proposition 2 and Theorem 6, making its convolution with a broad binomial offset small. The same dyadic sign recursion is used by #cite(label("HMPW2008"), form: "prose") Section 3.2, equation (3.10) to produce iterated finite differences of a kernel for coordinate means. In the conditional likelihood difference, each selected leaf set indexes a product of old likelihood scores, one per leaf, multiplied by a coefficient. We expand this coefficient along the tree of nested segments as a sum of expected products of signed motif factors and support indicators, averaging over the hidden bits. Within one product, a child is active at a vertex when it supplies one of these local factors, and the term is odd there when an odd number of the local factors are signed. The complementary words give root types $+ 1$ and $- 1$, so subtracting the two root evaluations cancels every even root term. At a vertex where an odd term has only one active child, the hidden offset smooths its single local signed factor. For an odd root term with no such singleton, selecting two active children recursively produces a forced binary subtree with $2^b$ selected leaves at depth $b$, and hence at least $2^b$ factors from the old score. A shared displacement for each sibling group, together with independent local displacements for its members, spreads these descendant locations. A joint bound that retains the shared displacement gives the extra decay beyond the factors from the old score.

The argument has three quantitative requirements. The initial pair must work uniformly as $q$ decreases. The number of amplification blocks grows with $n$, so constants depending on the channel or cancellation order must remain below the available scale margins. Finally, every oracle conditioning and failed random layout must be charged to an error that remains negligible after taking many traces.

Section 2 states the oracle invariant and the global schedule with two phases. Section 3 proves the common-mass, moment, and clipping tools, and Section 4 constructs the seed at the working channel. Section 5 chooses the local word and window sizes and proves the overlap estimates. Section 6 defines the random observation, proves its projection to a genuine trace, and identifies the law of the hidden bits after the report. Section 7 then proves the gain from the forced binary subtree and closes the induction. Section 8 restores genuine traces, pads to every exact length, and proves both main theorems. The extension to arbitrary fixed positive success uses several independently chosen gadgets and posterior factorization.

=== 1.3 Distances and channel reduction <distances-and-channel-reduction>

For probability laws $P \, Q$, define overlap by $"ov" \( P \, Q \) = 1 - "TV" \( P \, Q \)$, the largest mass of a common subprobability. Our squared Hellinger distance is

$ H^2 \( P \, Q \) = integral \( sqrt(d P) - sqrt(d Q) \)^2 . $

Cauchy–Schwarz and Hellinger affinity give $"TV" \( P \, Q \) lt.eq H \( P \, Q \) lt.eq sqrt(2 "TV" \( P \, Q \))$. Both distances decrease under a common stochastic kernel, and squared Hellinger distance of product laws is at most the sum for the factors. If $Q lt.double P$, then

$ H^2 \( P \, Q \) lt.eq integral (frac(d Q, d P) - 1)^2 d P . $

These elementary inequalities also explain why a small likelihood score is an appropriate induction quantity.

For the rest of the proof put

$ delta = min \( q \, 1 \/ 2 \) \, #h(2em) Lambda = delta^(- 3) \, #h(2em) H_(upright("del")) = delta^3 log n . $

We use $upright("Tr") \( w \) = cal(D)_delta \( w \)$ throughout the construction. The requested channel $q$ is obtained by deleting each surviving bit of a $delta$-trace with additional probability $\( q - delta \) \/ \( 1 - delta \)$. Thus all upper bounds on distinguishability proved at $delta$ also hold at $q$. Moreover

$ H_(upright("del")) arrow.r oo \, #h(2em) log H_(upright("del")) = log \( q^3 log n \) + O \( 1 \) . $

The working deletion rate $delta$ remains fixed through every intermediate scale of an instance. In all integer index ranges, endpoints may be real and only integer labels in the range are used.

== 2 The induction and global scales <sec:scales>

The induction carries three estimates for each pair of deterministic words. Two auxiliary laws $mu \, nu$ can be postprocessed by one kernel to approximate the genuine trace laws, and the likelihood score $d nu \/ d mu - 1$ has a small moment. These two estimates control distinguishability at the current length. The third estimate is common mass between traces of two consecutive powers of the first word; it supplies the hidden orientation bits used to construct the next pair.

Here is the quantitative idea behind the scale choices. Ignoring the small exponent margins, a block of depth $b$ with target length $N$ starts from atoms of length about $N^(2^(- b))$ whose squared score is at most $N^(- 2^(- b) d)$. The low-degree analysis will either suppress a term by signed smoothing or force it to contain $2^b$ old-score factors. Those factors together retain approximately the decay $N^(- d)$. The joint locations of their sibling groups supply the additional decay $N^(- \( b - 1 \) \/ 4)$. Sections 5–7 prove this estimate with the margins used below. They also verify the input strength needed to control high degrees and preserve consecutive-power overlap.

Fix $0 < c < c_(+) < 1 \/ \( 4 log 2 \)$, then choose a constant integer $B gt.eq 2$ and $0 < zeta < 1$ such that

$ frac(\( 1 - zeta \) \( \( B - 1 \) \/ 4 - .05 \), B log 2) > c_(+) > c . $

Set

$ D & = ⌊\( 1 - zeta \) frac(log H_(upright("del")), B log 2)⌋ \, #h(2em) j_0 = 5 dot.op 2^B \, #h(2em) epsilon.alt = 2^(- 4 B - 100) \/ \( D + 1 \) \,\
b_i & = cases(delim: "{", 2 \, & 1 lt.eq i lt.eq j_0 \,, B \, & j_0 < i lt.eq D .) $

We henceforth take $D > j_0$, as holds eventually. For either allowed block depth $b$, define the contraction exponent

#[#set math.equation(numbering: n => "(2.1)")
 $ a_0 \( b \) = \( 1 + epsilon.alt \) 2^(- b) - epsilon.alt . $ <eq:contraction-exponent>]

It is positive for all sufficiently large instances. Define the target scales backwards by

$ N_D = n \, #h(2em) N_(i - 1) = N_i^(a_0 \( b_i \)) quad \( 1 lt.eq i lt.eq D \) \, $

and the score exponents by

$ d_0 = 2.20 \, #h(2em) d_i = d_(i - 1) + \( b_i - 1 \) \/ 4 - .05 quad \( 1 lt.eq i lt.eq D \) . $

Each preliminary depth-two block adds $.20$, so $d_(j_0) = 2.20 + 2^B$. This fixed preliminary phase raises the seed exponent to the strength required by depth-$B$ blocks. The remaining blocks produce the asymptotic gain in the theorem. The nested-overlap proof and the high-degree score estimate will show separately where this stronger input is used.

The remaining parameters control the accumulated projection error and rare events. Put

$ Delta = n^(- 100 \( d_D + B + 1 \)) \, #h(2em) r_i = 2 ⌈10^8 2^(10 B) \( d_D + B + 1 \) frac(log n, log N_i)⌉ quad \( 0 lt.eq i lt.eq D \) . $

The even moment orders $r_i$ are nonincreasing with $i$, so a moment bound available at one level is still available at the next. Their dependence on $log n \/ log N_i$ makes the exceptional probabilities small relative to the final-length error budget even at the smallest scale.

#thm([Lemma 2.1.])[
  (Uniform scale margins).  #emph[For the parameters above, 
#[#set math.equation(numbering: n => "(2.2)")
 $ log N_0 gt.tilde_B \( log n \) 2^(- B D) gt.tilde_B \( log n \) H_(upright("del"))^(- \( 1 - zeta \)) = Lambda H_(upright("del"))^zeta . $ <eq:smallest-scale>]

 Moreover, 
$ epsilon.alt log N_0 gt.tilde_B frac(\( log n \)^zeta, 1 + log log n) gt.double log log n + log \( d_D + B + 1 \) . $

 For every fixed nonnegative integer $h$, uniformly over $0 lt.eq i lt.eq D$, 
#[#set math.equation(numbering: n => "(2.3)")
 $ \( D + 1 \)^h Lambda = o \( epsilon.alt log N_0 \) \, #h(2em) exp #scale(x: 120%, y: 120%)[\(] O_B \( \( D + 1 \)^h Lambda \) #scale(x: 120%, y: 120%)[\)] = N_i^(o \( epsilon.alt \)) . $ <eq:uniform-absorption>]

]
] <lem:scale-margins>

#proof[
  For every allowed $b$, $a_0 \( b \) gt.eq 2^(- B) \( 1 - \( 2^B - 1 \) epsilon.alt \)$. Multiplying these bounds over $D$ blocks loses only a factor bounded below by a positive constant depending on $B$, because $D epsilon.alt lt.eq 2^(- 4 B - 100)$. The definition of $D$ then proves (2.2). Since $H_(upright("del")) lt.eq log n$ and $D + 1 = O_B \( 1 + log log n \)$, the same bound proves the second display. Finally,
  $ frac(\( D + 1 \)^h Lambda, epsilon.alt log N_0) lt.tilde_B frac(\( D + 1 \)^(h + 1), H_(upright("del"))^zeta) arrow.r 0 \, $
  because $D = O_B \( log H_(upright("del")) \)$. Also $N_i gt.eq N_0$, proving the uniform exponential formulation. ◻
]

In particular, $log r_i = O_B \( D + 1 \)$ uniformly in $i$. Equation (2.3) will control factors involving the channel, the number of blocks, and the fixed-depth calculations. Constants here and below may depend on $B \, zeta \, c_(+)$. Unless additional dependence is explicit, constants in $O$, $asymp$, $lt.tilde$, and similar notation are absolute or depend only on fixed numerical parameters, such as a fixed degree cutoff; they do not depend on $delta \, n \, D \, r_i$. All estimates used at multiple levels are uniform over those levels as $n arrow.r oo$. In particular, the working rate $delta$ always has the value fixed from the original instance, not a value recomputed from $N_i$.

Distinct equal-length words each have an exclusive full-length trace of positive probability, so neither genuine trace law dominates the other. This motivates placing the likelihood score on auxiliary laws and recording their projection errors separately.

#prodef([Definition 2.2.])[
  (The level invariant).  Choose $C > 2$ and $0 < omega < 1 \/ 8$ depending only on $delta$, with
  $ log C = O \( Lambda \) \, #h(2em) log \( omega^(- 1) \) = O \( Lambda \) \, $
  and a constant $M_B gt.eq 0$ depending only on $B$. The same choices are used at every level. For $0 lt.eq i lt.eq D$, a level-$i$ pair consists of two different strings $x_i \, y_i$ of the same length $ell_i in \[ N_i \/ 2 \, N_i \]$, and probability laws $mu_i \, nu_i$ on a common auxiliary space, which may depend on $n$ and $delta$, satisfying the following conditions.
  - There are a Markov kernel $cal(K)_i$ from the auxiliary space to finite binary words and a number $E_i gt.eq 0$ such that
    $ "TV" \( cal(K)_i mu_i \, upright("Tr") \( x_i \) \) lt.eq E_i \, #h(2em) "TV" \( cal(K)_i nu_i \, upright("Tr") \( y_i \) \) lt.eq E_i \, #h(2em) E_i / ell_i lt.eq \( i + 1 \) Delta . $
  - We have $nu_i lt.double mu_i$ and
    $ ∥frac(d nu_i, d mu_i) - 1∥_(L^(r_i) \( mu_i \))^2 lt.eq N_i^(- d_i) . $
  - For an integer $k_i in \[ ell_i \, C^(2 B i + M_B) ell_i \]$,
    $ "ov" #scale(x: 120%, y: 120%)[\(] upright("Tr") \( x_i^(k_i) \) \, upright("Tr") \( x_i^(k_i + 1) \) #scale(x: 120%, y: 120%)[\)] gt.eq omega . $
    Here powers concatenate copies of the word.
] <def:invariant>

For every positive integer $m$, the first two conditions give

$ "TV" #scale(x: 120%, y: 120%)[\(] upright("Tr") \( x_i \)^(⊗ m) \, upright("Tr") \( y_i \)^(⊗ m) #scale(x: 120%, y: 120%)[\)] lt.eq sqrt(m N_i^(- d_i)) + 2 m E_i $

by Hellinger tensorization and telescoping the projection errors, as detailed in Section 8. This explains why the squared score carries the sample exponent $d_i$.

The pairs need not hit the target scales exactly. Padding is reserved for the final transfer and is not inserted into words used by later blocks.

#thm([Proposition 2.3.])[
  (Construction at every scale).  #emph[Fix $B \, zeta \, c_(+)$ and the parameters of this section. Along every sequence with $n arrow.r oo$ and $delta^3 log n arrow.r oo$, for all sufficiently large instances there exist level-$i$ pairs satisfying Definition 4 simultaneously for $0 lt.eq i lt.eq D$. The choices of $C \, omega$ depend only on $delta$ and obey the displayed logarithmic bounds, and one $M_B$ depending only on $B$ works at every level.]
] <prop:construction>

The proof is by induction. Section 4 supplies level zero. Proposition 13 constructs the next level, with its observation and likelihood estimates proved in Sections 6–7. Section 8 applies the final common kernel and returns to complete traces.

== 3 Common mass, smoothing, and score moments <sec:tools>

The induction needs three operations: converting overlap into hidden offsets, controlling multilinear score expansions, and conditioning on an event where the reference density is bounded below. We prove them with the uniformity needed later.

#thm([Lemma 3.1.])[
  (Multilinear moment bound).  #emph[Let $t gt.eq 2$ be an even integer, let $h gt.eq 0$, and let $\( Z_j \)_(j in cal(J))$ be a finite family of independent centered real variables with $parallel Z_j parallel_t lt.eq h$. For an integer $r gt.eq 1$, the degree-$r$ multilinear polynomial with real coefficients $A \( S \)$ on $r$-subsets satisfies 
#[#set math.equation(numbering: n => "(3.1)")
 $ ∥sum_(\| S \| = r) A \( S \) product_(j in S) Z_j∥_t lt.eq \( C_1 t h \)^r parallel A parallel_(ell^2) \, $ <eq:hc>]

 where $ell^2$ uses counting measure and $C_1$ is absolute.]
] <lem:moment>

#proof[
  The tensorization follows the classical principle underlying hypercontractive estimates #cite(label("Bonami1970")). We give an elementary argument that applies to arbitrary independent centered real coordinates satisfying the stated moment bound; it requires neither symmetry nor a common distribution. Normalize $h = 1$ (the zero case is clear). A scalar satisfies $parallel b + v Z parallel_t^2 lt.eq \| b \|^2 + C_2 t \| v \|^2$ for real $b \, v$: if $\| v \| lt.eq \| b \| \/ t$ and $b eq.not 0$, expand the moment, with the linear term zero, to bound it by $\| b \|^t \( 1 + O \( t^2 \( v \/ b \)^2 \) \)$ using $sum_(k gt.eq 2) \( t \| v \/ b \| \)^k \/ k !$. Here concavity gives $\( 1 + O \( t^2 \( v \/ b \)^2 \) \)^(2 \/ t) lt.eq 1 + O \( t \( v \/ b \)^2 \)$. Otherwise use the triangle inequality and $2 \| b v \| lt.eq 2 t \| v \|^2$. Iteration by conditioning on one variable’s complement and applying the triangle inequality in $L^(t \/ 2)$ proves (3.1). We will also apply this to finite families indexed by positions/ranks, identifying ordered increasing tuples with subsets. ◻
]

#thm([Lemma 3.2.])[
  (Lifting adjacent-power overlap).  #emph[Let $w$ be a nonempty word, $k$ a positive integer, and $0 < omega < 1 \/ 8$ such that $"ov" \( upright("Tr") \( w^k \) \, upright("Tr") \( w^(k + 1) \) \) gt.eq omega$. There is an absolute constant $C_(upright("abs"))$ such that, whenever $C gt.eq C_(upright("abs")) \/ omega$, $P$ is a sufficiently large positive integer, and the integer $F$ satisfies $F gt.eq C k P$, we have 
#[#set math.equation(numbering: n => "(3.2)")
 $ "ov" \( upright("Tr") \( w^(F P) \) \, upright("Tr") \( w^(F P + P) \) \) gt.eq 2 \/ 3 . $ <eq:lift>]

 It is enough that $P$ exceed an absolute constant, uniformly in $w \, k \, omega \, C \, F$.]
] <lem:lift>

#proof[
  This is a quantitative common-part smoothing statement, related in mechanism to consecutive-power smoothing for positive contractions #cite(label("Zaharopol1989")) Propositions 2.2–2.3. Write the words as a common tail of $F P - g \( k + 1 \/ 2 \)$ copies and $g = 2 floor.l F P \/ \( 2 k + 1 \) floor.r$ chunks of $k$ or $k + 1$ copies. Use a uniform random schedule conditional on the total number $m$ of long chunks being $g \/ 2$ or $g \/ 2 + P$ respectively. Let $omega U$ be a common sublaw of chunk trace distributions. Use independent flags of probability $omega$ to emit the trace under $U$ (hiding the label $k$ or $k + 1$), otherwise reveal the label and generate from the normalized residual for that label. The augmented laws postprocess to the claimed ordinary ones by joining the chunks and simulating the known tail. Given the flags and the sequence of visible labels, the other data have the same conditional law on both hypotheses. The number $M$ of hidden flags belongs to $\[ omega g \/ 2 \, 2 omega g \]$ except with probability at most $2 exp \( - c' omega g \)$ for an absolute $c' > 0$ by the multiplicative binomial Chernoff bound, where $omega g gt.eq c'' omega C P^2$ for an absolute $c'' > 0$ at all large $P$. Conditional on such flags, the total variation between visible-label sequences equals that of visible long counts $v$ since the sequences are exchangeable on the visible indices. For total $m$ this count has hypergeometric law $p_m$, with
  $ p_m \( v \) = binom(g - M, v) binom(M, m - v) \/ binom(g, m) . $
  Uniformly for $g \/ 2 lt.eq m lt.eq g \/ 2 + P$, $sup_v p_m \( v \) = O \( \( omega g \)^(- 1 \/ 2) \)$. To see this, consecutive probability ratios locate a mode within $O \( 1 \)$ of $\( g - M \) m \/ g$, e.g. a mode is $floor.l \( g - M + 1 \) \( m + 1 \) \/ \( g + 2 \) floor.r$. For large $P$ the counts and complements in the numerator at the mode are all fixed positive fractions (say between $1 \/ 4$ and $3 \/ 4$) of the respective trial totals because $g gt.tilde C P^2$, $M gt.eq omega g \/ 2 gt.tilde P^2$ and $g - M gt.eq \( 1 - 2 omega \) g$. Stirling then gives the bound (the exponential entropy factor is at most one by concavity). Couple adjacent $m \, m + 1$ by uniformly flipping one short label. This increases $v$ by one with probability $t \( v \) = \( g - M - v \) \/ \( g - m \)$ conditional on $v$. Hence $p_(m + 1) \( v \) - p_m \( v \) = t \( v - 1 \) p_m \( v - 1 \) - t \( v \) p_m \( v \)$. The sequence $t \( v \) p_m \( v \)$ on the support, extended by zero, is unimodal by log-concavity. Thus the adjacent total variation is $max_v t \( v \) p_m \( v \)$, bounded by $max_v p_m \( v \)$. The full variation cost of all $P$ steps is $O \( P \/ sqrt(omega g) \)$ plus the rare flag probability, at most $1 \/ 3$ at large $P$ by choosing $C omega$ greater than a sufficiently large absolute constant. Taking smaller common sublaws when necessary lets us use exactly mass $omega$ in the flag construction. ◻
]

=== 3.1 Paired hiding and the reported information <paired-hiding-and-the-reported-information>

The paired construction below uses a joint common component of mass $omega^2$; on this component, the orientation remains fair conditional on the flag and both reported side outputs. Common-part constructions appear in the average-case block argument of #cite(label("MPV2014"), form: "prose") Section 3.3 and the partial-trace construction in the proof of #cite(label("HoldenLyons2020"), form: "prose") Lemma 2.1.

Figure 1 depicts one pair and the resulting uncertainty in the number of copies to the left of the central segment.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0.58), [#text(size: 9pt)[A fair bit swaps the side lengths]], anchor: "west", padding: 0.1176cm)
  content((13.7, 0.58), [#text(size: 9pt)[$E tilde.op upright("Bernoulli") (1"/"2)$]], anchor: "east", padding: 0.1176cm)
  content((0.75, 0), [#text(size: 9pt)[$E=0$]], anchor: "east", padding: 0.1176cm)
  content((2.4, 0), [#box(width: 2.8cm, height: 0.48cm, inset: 0.07056cm, stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f1f4f6"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$w^k$]]])])
  content((7, 0), [#box(width: 3.5cm, height: 0.48cm, inset: 0.07056cm, stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#d6dde5"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[central segment]]])])
  content((11.6, 0), [#box(width: 2.8cm, height: 0.48cm, inset: 0.07056cm, stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f1f4f6"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$w^(k+1)$]]])])
  line((3.8, 0), (5.25, 0), stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10))
  line((8.75, 0), (10.2, 0), stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10))
  content((0.75, -0.65), [#text(size: 9pt)[$E=1$]], anchor: "east", padding: 0.1176cm)
  content((2.4, -0.65), [#box(width: 2.8cm, height: 0.48cm, inset: 0.07056cm, stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f1f4f6"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$w^(k+1)$]]])])
  content((7, -0.65), [#box(width: 3.5cm, height: 0.48cm, inset: 0.07056cm, stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#d6dde5"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[central segment]]])])
  content((11.6, -0.65), [#box(width: 2.8cm, height: 0.48cm, inset: 0.07056cm, stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f1f4f6"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$w^k$]]])])
  line((3.8, -0.65), (5.25, -0.65), stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10))
  line((8.75, -0.65), (10.2, -0.65), stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10))
  content((7, -1.48), [#box(width: 12.6cm, height: 0.54cm, inset: 0.3333em, radius: 2pt, stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$P_E= omega^2(U ⊗ U)+(1- omega^2)R_E$]]])])
  content((3.45, -2.52), [#box(width: 6.153cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#eaeef2"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Hidden: $E$ is not reported.#linebreak() Emit $U ⊗ U$; $E$ remains fair.]]])])
  content((10.55, -2.52), [#box(width: 6.153cm, inset: 0.1764cm, radius: 2pt, stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7f7"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Visible: report $E$.#linebreak() Emit the joint residual $R_E$.]]])])
  line((4.8, -1.75), (3.45, -1.99), stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#194170"))))
  line((9.2, -1.75), (10.55, -1.99), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#595959"))))
  content((7, -3.5), [#box(width: 13.42cm, inset: 0.2117cm, radius: 2pt, stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f4f6f8"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$J$ pairs contribute $L_( upright(l) "eft"):="Jk"+ sum_(i=1)^"JE"_i$ copies of $w$ on the left.#linebreak() After the side report, $c_( upright(v) "is"):="Jk"+ sum_( upright(v) "isible")E_i$ and the hidden count $M$ are fixed, and#linebreak() $ L_( upright(l) "eft")=c_( upright(v) "is")+ sum_( upright(h) "idden")E_i #h(0.3333em) upright("law") =#h(0.3333em) c_( upright(v) "is")+ upright("Bin") (M,1"/"2).$]]])], anchor: "north")
})],
  caption: [Figure 1: Let $omega U$ be a common sublaw of the trace laws of $w^k$ and $w^(k + 1)$. For orientation $E$, $P_E$ is the product of its two side laws and $R_E$ is the normalized joint residual. Across $J$ independent pairs straddling the segment, $M tilde.op upright("Bin") \( J \, omega^2 \)$ before reporting. The lower panel conditions on flags, side outputs, and visible bits; $L_(upright("left"))$ counts only copies contributed by the left pair members. Other fixed material adds a deterministic location offset. Block widths are schematic. ],
) <fig:paired-hiding>

Throughout, unless window boundaries or additional payloads are specified explicitly, report only one unseparated output per segment/chunk/residual, plus flags and revealed orientation bits as indicated (not original word boundaries internal to that output). Given a word $w$ and a count $k$ with $"ov" \( upright("Tr") \( w^k \) \, upright("Tr") \( w^(k + 1) \) \) gt.eq omega$, choose a common sublaw $omega U$. Two chunks use a paired random bit orientation giving lengths $\( k \, k + 1 \)$ or $\( k + 1 \, k \)$ even when far separated in the concatenation. Use one joint flag of probability $omega^2$ and output from $U ⊗ U$ on it, otherwise reveal the bit and generate the two traces jointly from the normalized residual after subtracting $omega^2 U ⊗ U$ from the product law for that orientation. Marginalizing flags yields the requisite conditionally independent pair traces given orientations. Conditional on the augmented pair data, the bit remains fair on the hidden event. Independent pairs thus carry independent hidden fair bits conditional on this part of the report. All auxiliary schedules/flags are redrawn independently for each trace.

=== 3.2 Conditioning to obtain a small likelihood score <conditioning-to-obtain-a-small-likelihood-score>

Separating a typical region from a small exceptional mass is also used in Hellinger estimates for trace reconstruction #cite(label("Chase2021Lower")) arXiv v2, Section 2. The following version keeps the full moment and simulation-error budgets.

#thm([Lemma 3.3.])[
  (Clipping with a common event).  #emph[Fix a level $0 lt.eq i lt.eq D$ and its parameters from Section 2. Suppose preliminary oracle laws have common “side” metadata with law $Q_(upright("side"))$, and conditional densities $G_x \, G_y$ over a conditional reference $Q$, possibly depending on metadata. Require $integral G_x thin d Q = integral G_y thin d Q = 1$ for $Q_(upright("side"))$-almost every metadata value. Use $Q_(upright("side")) Q$ as the joint reference. Suppose on a typical metadata event of probability $gt.eq 1 - o \( Delta \)$ we have uniform estimates 
#[#set math.equation(numbering: n => "(3.3)")
 $ parallel G_x - 1 parallel_(r_i) \, parallel G_y - 1 parallel_(r_i) lt.eq N_i^(- rho) \, #h(2em) parallel G_y - G_x parallel_(r_i)^2 lt.eq N_i^(- d_i - .01) $ <eq:clipcond>]

 in $L^(r_i) \( Q \)$, where $rho gt.eq 2^(- 4 B - 10)$. Then conditioning each law on the event consisting of typical metadata and $G_x gt.eq 1 \/ 2$ changes it in total variation by $o \( Delta \)$. The conditioned laws $mu \, nu$ satisfy $nu lt.double mu$ and 
$ parallel d nu \/ d mu - 1 parallel_(L^(r_i) \( mu \))^2 lt.eq N_i^(- d_i) . $

 All these conclusions hold uniformly over $0 lt.eq i lt.eq D$.]
] <lem:clipping>

#proof[
  Condition each preliminary law separately on the same joint event $A_(upright("keep"))$ consisting of typical metadata and $G_x gt.eq 1 \/ 2$. Its complement has joint reference measure on the typical part $lt.eq \( 2 N_i^(- rho) \)^(r_i)$, hence bad mass $o \( Delta \)$ under each preliminary law by Cauchy–Schwarz, the moment bound, and the common atypical mass. The conditioned laws therefore change postprocessing by $o \( Delta \)$ in total variation. Because $G_x gt.eq 1 \/ 2$ on the conditioning event $A_(upright("keep"))$, the new $y$-law is dominated by the new $x$-law and their likelihood ratio on the latter support is $c' G_y \/ G_x$ with a scalar $c' = 1 + o \( Delta \)$. Also
  $ integral_({ G_x gt.eq 1 \/ 2 \, med upright("typical") }) lr(|G_y \/ G_x - 1|)^(r_i) G_x thin d \( Q_(upright("side")) Q \) lt.eq 2^(r_i - 1) N_i^(- \( d_i + .01 \) r_i \/ 2) . $
  Under the conditioned $x$-law this yields $parallel G_y \/ G_x - 1 parallel_(r_i) lt.eq 3 N_i^(- \( d_i + .01 \) \/ 2)$ for all large $n$ by taking the $r_i$-th root (the conditioning probability is $1 - o \( Delta \)$). Thus $parallel c' G_y \/ G_x - 1 parallel_(r_i) lt.eq c' parallel G_y \/ G_x - 1 parallel_(r_i) + \| c' - 1 \| lt.eq N_i^(- d_i \/ 2)$ as desired for large $n$, since $Delta lt.eq N_i^(- 100 d_D)$. In this calculation and throughout, any $o \( Delta \)$ masses claimed from (3.3) follow uniformly using the definition of $r_i$ and $log N_i arrow.r oo$; no uniform lower bound on the unconditioned ratio or density is needed. For Hellinger comparisons of preliminary laws one can similarly use the squared density difference times $2$ on $G_x gt.eq 1 \/ 2$ and $G_x + G_y$ on its complement. ◻
]

== 4 An initial pair at the working deletion rate <sec:initial>

This section supplies the induction with a pair whose squared score decays as $N_0^(- 2.20)$ and whose repeated traces have enough common mass to hide later offsets. The initial words have one defect in each alternating period. A finite signed pattern moves some of these defects by one slot in opposite directions. We first describe an observation that forgets the original slot labels, then use its conditional rank probabilities for two purposes: obtaining common mass for pure runs and bounding the score of the signed pair.

#thm([Proposition 4.1.])[
  (Initial pair).  #emph[For the parameters of Section 2, there is a choice of the common constants in Definition 4 with $M_B = 1$ for which a level-zero pair exists with simulation error $E_0 lt.eq Delta$. One may choose $omega = exp \( - C_9 Lambda \)$ for an absolute constant $C_9$, and $C > 2$ with $log C = O \( Lambda \)$.]
] <prop:initial>

=== 4.1 Words and the reported mark lists <words-and-the-reported-mark-lists>

In this section $C_(*) \, c_(*) > 0$ denote absolute constants whose values may change between estimates; constants indexed by $r$ or $s_0$ may depend on those fixed indices.

Put $N = N_0$, $eta = .004$, and

$ m = floor.l N^(1 \/ 2 - eta) floor.r \, #h(2em) K = floor.l N^(1 \/ 2 - 2 eta) floor.r \, #h(2em) k = floor.l delta m floor.r \, $

$ J = ⌊frac(floor.l N \/ \( 2 m - 1 \) floor.r - K, 2 k + 1)⌋ \, #h(2em) P = J \( 2 k + 1 \) + K . $

Lemma 3 gives $Lambda = o \( log N \)$, hence $delta^(- 1) = N^(o \( 1 \))$. In particular $delta^3 m arrow.r oo$, $m delta^2 arrow.r oo$, and $K \, k + 1 lt.eq m$ for all sufficiently large instances. The definitions then give

$ J asymp delta^(- 1) N^(2 eta) \, #h(2em) J = o \( K \) \, #h(2em) P \( 2 m - 1 \) in \[ N \/ 2 \, N \] . $

For the last assertion, $P$ differs from $floor.l N \/ \( 2 m - 1 \) floor.r$ by fewer than $2 k + 1$, so the omitted length is $O \( k m + m \) = o \( N \)$.

For this construction only, let the ordinary block be $sans(A) = 01$ and the defect block be $sans(D) = 1$. For $b in { - 1 \, 0 \, 1 }$, define the period

$ W_b = sans(A)^(floor.l m \/ 2 floor.r + b - 1) thin sans(D) thin sans(A)^(m - floor.l m \/ 2 floor.r - b) . $

It has $m$ blocks, with the defect at block position $floor.l m \/ 2 floor.r + b$, and length $2 m - 1$. Period, slot, and rank indices in this section start at $1$. For even $m$, the adjacent types $W_0 \, W_1$ are exactly the shifted-defect pair displayed by #cite(label("Chase2021Lower"), form: "prose") arXiv v2, Introduction and Theorem 1; for odd $m$, they are the corresponding smaller pair with one common final $sans(A)$ appended. Below we compare $W_(- 1)$ with $W_1$ in exceptional periods and make signed choices across many periods.

Set

$ a = floor.l P \/ 2 floor.r \, #h(2em) s_0 = 300 \, #h(2em) I = { 0 \, dots.h \, 2^(s_0) - 1 } \,\
sum_(i in I) beta_i z^i = product_(v = 0)^(s_0 - 1) \( 1 - z^(2^v) \) . $

The two words $x_0 \, y_0$ have $P$ periods. Every period is $W_0$ except those at $a + i$, $i in I$, where $x_0$ uses $W_(beta_i)$ and $y_0$ uses $W_(- beta_i)$. For all sufficiently large instances these indices lie in ${ 1 \, dots.h \, P }$. Both words have length $ell_0 = P \( 2 m - 1 \) in \[ N \/ 2 \, N \]$, and they differ: the parse into $01$ and $1$ from the left is unique. The signs are the classical Prouhet–Thue–Morse signs; their polynomial has a zero of order $s_0$ at $1$ #cite(label("AlloucheShallit1999")) Proposition 2 and Theorem 6.

We now define the more informative observation used only at this level. For $H in { sans(A) \, sans(D) }$, put

$ r_e = delta^2 \/ 2 \, #h(2em) nu_H = frac(upright("Tr") \( H \) - r_e delta_diameter, 1 - r_e) \, $

where $diameter$ denotes the empty string. This reserves the same empty output mass in both block laws. In the proof of Lemma 2.1, steps (I) and (III), #cite(label("HoldenLyons2020"), form: "prose") first erase a mass $q^2 \/ 2$ from $01$ blocks at their deletion rate $q$; here the same decomposition is applied at rate $delta$ to both $01$ and $1$, followed by an explicit likelihood score.

For each block independently, silently erase it with probability $r_e$; otherwise report a mark with law $nu_H$. The mark alphabet is

$ cal(M)_(upright("mark")) = { diameter \, 0 \, 1 \, 01 } . $

An observation on a sequence of blocks is the ordered list of its returning marks, an element of $union.sq.big_(l gt.eq 0) cal(M)_(upright("mark"))^l$. The list reports its individual entries, including empty-valued entries, but no original slot labels or period boundaries. Thus the empty list and the one-entry list $\( diameter \)$ are distinct. Its count $l$ is the number of entries, not the number of bits in their concatenation. Concatenating the mark strings gives the ordinary trace law, since $upright("Tr") \( H \) = r_e delta_diameter + \( 1 - r_e \) nu_H$.

Under $nu_(sans(A))$, define

$ Z \( Y \) = frac(nu_(sans(D)) \( Y \), nu_(sans(A)) \( Y \)) - 1 . $

The defect law is dominated by the ordinary-block law. Its support is contained in ${ diameter \, 1 }$, where the likelihood ratios are

$ frac(delta - delta^2 \/ 2, delta^2 \/ 2) quad upright("and") quad 1 / delta \, $

respectively. Hence $Z$ is centered, $parallel Z parallel_oo = O \( delta^(- 1) \)$, and $parallel Z parallel_(L^2 \( nu_(sans(A)) \))^2 lt.tilde delta^(- 1)$, uniformly for $delta lt.eq 1 \/ 2$.

=== 4.2 Conditional densities and the rank kernel <conditional-densities-and-the-rank-kernel>

Consider $1 lt.eq u lt.eq m$ periods with fixed types $upright(bold(b)) = \( b_1 \, dots.h \, b_u \) in { - 1 \, 0 \, 1 }^u$. There are $n_b = u m$ slots, and the defect in period $j$ is at

$ p_(upright(bold(b))) \( j \) = \( j - 1 \) m + floor.l m \/ 2 floor.r + b_j . $

The return count has law $"Bin" \( n_b \, 1 - r_e \)$, independent of $upright(bold(b))$. Conditional on any count $0 lt.eq l lt.eq n_b$, the returning subset $S_l$ is uniform among the size-$l$ subsets of ${ 1 \, dots.h \, n_b }$. This subset is not reported. If $p in S_l$, let $"rk"_(S_l) \( p \)$ be its rank in the increasing order on $S_l$. Put $Q_l = nu_(sans(A))^(⊗ l)$, with $Q_0$ the point mass on the empty list.

Relative to $Q_l$, the density of the reported list $Y = \( Y_1 \, dots.h \, Y_l \)$ is

#[#set math.equation(numbering: n => "(4.1)")
 $ G_(upright(bold(b)))^(\( u \, l \)) \( Y \) = bb(E)_(S_l) product_({ j : p_(upright(bold(b))) \( j \) in S_l }) #scale(x: 120%, y: 120%)[\(] 1 + Z \( Y_("rk"_(S_l) \( p_(upright(bold(b))) \( j \) \)) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:base-density>]

Empty products are $1$, so this also defines the density at $l = 0$. It integrates to one because each $1 + Z$ has mean one under $nu_(sans(A))$. To expand it, for $1 lt.eq r lt.eq u$ take an increasing tagged tuple $upright(bold(j)) = \( j_1 \, dots.h \, j_r \)$ of periods and an increasing rank tuple $1 lt.eq v_1 < dots.h.c < v_r lt.eq l$. Write $p_h = p_(upright(bold(b))) \( j_h \)$, and put

#[#set math.equation(numbering: n => "(4.2)")
 $ W_(upright(bold(j)) \, upright(bold(b))) \( v \) & = bb(P) { p_h in S_l \, med "rk"_(S_l) \( p_h \) = v_h upright(" for every ") h #scale(x: 120%, y: 120%)[}] \,\
A_(r \, upright(bold(b))) \( v \) & = sum_(1 lt.eq j_1 < dots.h.c < j_r lt.eq u) W_(upright(bold(j)) \, upright(bold(b))) \( v \) . $ <eq:base-rank-event>]

The event in $W_(upright(bold(j)) \, upright(bold(b)))$ imposes no restriction on untagged slots, including other defects. It is the joint probability of the tagged returns and ranks within the count conditioning, rather than a rank law conditioned again on all tags returning. Expanding the product in (4.1) now gives

#[#set math.equation(numbering: n => "(4.3)")
 $ G_(upright(bold(b)))^(\( u \, l \)) \( Y \) = 1 + sum_(r = 1)^u med sum_(1 lt.eq v_1 < dots.h.c < v_r lt.eq l) A_(r \, upright(bold(b))) \( v \) product_(h = 1)^r Z \( Y_(v_h) \) . $ <eq:base-density-expansion>]

Define the slot gaps and rank gaps by

$ \( g_0 \, dots.h \, g_r \) & = \( p_1 - 1 \, p_2 - p_1 - 1 \, dots.h \, p_r - p_(r - 1) - 1 \, n_b - p_r \) \,\
\( z_0 \, dots.h \, z_r \) & = \( v_1 - 1 \, v_2 - v_1 - 1 \, dots.h \, v_r - v_(r - 1) - 1 \, l - v_r \) . $

Their sums are $n_b - r$ and $l - r$. Put $theta = l \/ n_b$ and $f_g \( z \) = bb(P) { "Bin" \( g \, theta \) = z }$. Counting returning untagged slots in each gap gives the exact kernel

#[#set math.equation(numbering: n => "(4.4)")
 $ W_(upright(bold(j)) \, upright(bold(b))) \( v \) & = frac(product_(i = 0)^r binom(g_i, z_i), binom(n_b, l))\
 & = frac(theta^r, f_(n_b) \( l \)) product_(i = 0)^r f_(g_i) \( z_i \) . $ <eq:base-rank-kernel>]

We set $f_g \( z \) = 0$ outside $z in { 0 \, dots.h \, g }$. The last expression represents the same uniform subset by independent Bernoulli-$theta$ sampling conditioned on its total, including the degenerate laws at $theta = 0 \, 1$; it does not change the actual erasure rate $r_e$.

For the rank estimates, call a count admissible when

$ theta = l / n_b in \[ 1 - delta^2 \, 1 - delta^2 \/ 4 \] . $

For a tagged tuple define the coarse gaps

$ gamma_0 = j_1 - 1 / 2 \, #h(2em) gamma_i = j_(i + 1) - j_i med \( 1 lt.eq i < r \) \, #h(2em) gamma_r = u - j_r + 1 / 2 . $

They sum to $u$, and $g_i = m gamma_i + alpha_i$ with $\| alpha_i \| lt.eq 3$. The end coarse gaps are positive half-integers and the internal coarse gaps are positive integers. In particular $g_i gt.tilde m$; at an admissible count, their expected binomial success and failure counts tend to infinity uniformly by $m delta^2 arrow.r oo$.

#thm([Lemma 4.2.])[
  (Rank-kernel square sum).  #emph[For the $u$-period construction and admissible count above, and every $1 lt.eq r lt.eq u$, 
#[#set math.equation(numbering: n => "(4.5)")
 $ parallel A_(r \, upright(bold(b))) parallel_(ell^2)^2 lt.eq \( C_3 \/ delta \)^r \( u \/ m \)^(r \/ 2) r^(- r \/ 2) \, $ <eq:abase>]

 where $ell^2$ uses counting measure on increasing rank tuples and $C_3$ is absolute, uniformly in the deterministic period types and the admissible count.]
] <lem:base-kernel>

#proof[
  Fix $u \, l \, upright(bold(b))$; all kernels in this proof therefore share $theta$ and $f_(n_b) \( l \)$. In an inner product, both kernels use the same rank tuple $v$, hence the same rank-gap vector $z \( v \)$. The correspondence between increasing $v$ and nonnegative $z$ with sum $l - r$ gives
  $ chevron.l W_(upright(bold(j)) \, upright(bold(b))) \, W_(upright(bold(j))' \, upright(bold(b))) chevron.r = frac(theta^(2 r), f_(n_b) \( l \)^2) sum_(z_i gt.eq 0\
sum_i z_i = l - r) product_(i = 0)^r f_(g_i) \( z_i \) f_(g'_i) \( z_i \) . $
  Choose a largest $gamma_e$ in the first tuple, breaking ties by the least index. Then $g_e gt.tilde m u \/ \( r + 1 \)$. Solve the total constraint for $z_e$, bound that factor by its supremum, and drop the constraints on the other coordinates:
  #[#set math.equation(numbering: n => "(4.6)")
   $ chevron.l W_(upright(bold(j)) \, upright(bold(b))) \, W_(upright(bold(j))' \, upright(bold(b))) chevron.r lt.eq frac(theta^(2 r), f_(n_b) \( l \)^2) sup_z f_(g_e) \( z \) f_(g'_e) \( z \) product_(i eq.not e) sum_z f_(g_i) \( z \) f_(g'_i) \( z \) . $ <eq:base-inner-product>]
  No multiplicity is introduced when $z_e$ is solved.
  Stirling’s formula at the mean $l = theta n_b$ gives $f_(n_b) \( l \)^(- 2) lt.tilde theta \( 1 - theta \) n_b lt.tilde delta^2 n_b$. Also
  $ sup_z f_(g_e) \( z \) f_(g'_e) \( z \) lt.tilde \( delta^2 g_e \)^(- 1) . $
  When $g'_e gt.eq g_e \/ 2$, this follows from the binomial maximum $O \( \( theta \( 1 - theta \) g \)^(- 1 \/ 2) \)$ for each factor. When $g'_e < g_e \/ 2$, the means differ by a fixed multiple of $g_e$, so at every common argument one factor is a Hoeffding tail of size $exp \( - c_(*) g_e \)$ #cite(label("Hoeffding1963")) Theorem 2, which is smaller than the asserted bound. The product of this supremum and the inverse squared denominator is therefore $O \( r + 1 \)$. The Stirling constants are absolute because every relevant expected success and failure count is at least a fixed multiple of $m delta^2 arrow.r oo$.
  For each free coordinate we use
  #[#set math.equation(numbering: n => "(4.7)")
   $ sum_z f_g \( z \) f_(g') \( z \) lt.eq \( C_(upright("rk")) \/ delta \) g^(- 1 \/ 2) exp #h(-0.16667em) (- c_(upright("rk")) frac(\( g - g' \)^2, g + g')) $ <eq:base-binomial-convolution>]
  with absolute positive constants. To see this, regard the sum as the probability that the difference of two independent binomials is zero. Tilt their product law by $e^(t thin upright("difference"))$, with $t = - e_0 \( g - g' \) \/ \( g + g' \)$ and a sufficiently small absolute $e_0 > 0$. The log moment is
  $ theta t \( g - g' \) + O \( t^2 \( g + g' \) \) lt.eq - c_(upright("rk")) \( g - g' \)^2 \/ \( g + g' \) \, $
  since $theta gt.eq 1 \/ 2$. Under the tilt independence is preserved, the Bernoulli odds are multiplied by $e^(plus.minus t)$, and the failure probabilities remain comparable to $delta^2$. The probability of zero under this tilted law is at most the first binomial’s maximum mass $O \( \( delta sqrt(g) \)^(- 1) \)$, proving (4.7).
  Corresponding coarse-gap coordinates have integer differences. Since $g_i = m gamma_i + O \( 1 \)$ with an absolute error, for a nonzero mismatch and all large $m$,
  $ \| g_i - g'_i \| gt.eq 1 / 2 m \| gamma_i - gamma'_i \| \, #h(2em) g_i + g'_i lt.tilde m u \, #h(2em) g_i gt.tilde m gamma_i . $
  For a matching coordinate the exponential below is $1$. Substituting these comparisons into (4.6) and using $theta^(2 r) lt.eq 1$ yields the intermediate bound
  #[#set math.equation(numbering: n => "(4.8)")
   $ chevron.l W_(upright(bold(j)) \, upright(bold(b))) \, W_(upright(bold(j))' \, upright(bold(b))) chevron.r lt.eq C_(upright("rk")) \( r + 1 \) product_(i eq.not e) [frac(C_(upright("rk")), delta sqrt(m gamma_i)) thin exp #h(-0.16667em) (- c_(upright("rk")) frac(m \( gamma_i - gamma'_i \)^2, u))] . $ <eq:base-coarse-inner>]
  It remains to sum this expression over both tagged tuples. Once the other coarse gaps are fixed, the constraint $sum_i gamma_i = u$ determines the eliminated gap; the same holds for $gamma'$. For fixed $gamma$, dropping validity of the determined $gamma'_e$ can only enlarge the sum, and
  $ sum_(gamma') product_(i eq.not e) e^(- c_(upright("rk")) m \( gamma_i - gamma'_i \)^2 \/ u) lt.eq product_(i eq.not e) sum_(z in bb(Z)) e^(- c_(upright("rk")) \( m \/ u \) z^2) lt.eq C_(upright("rk"))^r $
  because $m gt.eq u$. Thus the remaining $r$ first-tuple coordinates contribute $m^(- r \/ 2)$ times a sum of $product_(i eq.not e) gamma_i^(- 1 \/ 2)$ with their total at most $u$. With $tau = r \/ u in \( 0 \, 1 \]$,
  $ sum_(sum_(i eq.not e) gamma_i lt.eq u) product_(i eq.not e) gamma_i^(- 1 \/ 2) lt.eq e^(tau u) product_(i eq.not e) sum_(gamma_i > 0) gamma_i^(- 1 \/ 2) e^(- tau gamma_i) lt.eq C_(upright("rk"))^r \( u \/ r \)^(r \/ 2) . $
  The last lattice sum is $O \( tau^(- 1 \/ 2) \)$ on both the positive integer and positive half-integer lattices, by comparison with the integral of $x^(- 1 \/ 2) e^(- tau x \/ 2)$. Finally sum over the $r + 1$ possible selected coordinates $e$. The resulting $O \( \( r + 1 \)^2 \)$ factor is absorbed into a constant to the power $r$. Since $parallel A_(r \, upright(bold(b))) parallel_2^2$ is the sum of these inner products, this proves (4.5). ◻
]

=== 4.3 Common mass for consecutive pure runs <common-mass-for-consecutive-pure-runs>

The rank estimate first gives common mass at the working deletion rate. This mass will later conceal the side orientations that move the exceptional periods as a group.

For $u = k \, k + 1$, write $G^(\( u \, l \)) = G_(upright(bold(0)))^(\( u \, l \))$ for the conditional density of the list from $W_0^u$. At a count $l$ admissible for both totals, the two densities use the same $Q_l$, although their respective parameters are $theta = l \/ \( u m \)$. Orthogonality of distinct multilinear monomials in the independent centered scores gives

$ bb(E)_(Q_l) #scale(x: 120%, y: 120%)[\[] \( G^(\( u \, l \)) \)^2 #scale(x: 120%, y: 120%)[\]] = 1 + sum_(r = 1)^u parallel A_(r \, upright(bold(0))) parallel_2^2 parallel Z parallel_2^(2 r) lt.eq 1 + sum_(r gt.eq 1) \( C_6 delta^(- 2) sqrt(u \/ m) \)^r r^(- r \/ 2) lt.eq exp \( C'_6 Lambda \) . $

Indeed, for $a gt.eq 0$, $sum_(r gt.eq 1) \( a \/ sqrt(r) \)^r lt.eq exp \( C_(*) \( 1 + a^2 \) \)$: for $r > 4 a^2$ the terms are at most $2^(- r)$; for $1 lt.eq r lt.eq 4 a^2$, the maximum of $r log \( a \/ sqrt(r) \)$ over positive reals is at most $a^2 \/ \( 2 e \)$. Here $delta^(- 4) u \/ m lt.tilde delta^(- 3)$ at both side counts.

Nonnegativity, mean one, and Cauchy–Schwarz imply

$ Q_l { G^(\( u \, l \)) gt.eq 1 \/ 2 } gt.eq 1 / 4 exp \( - C'_6 Lambda \) . $

Both densities are nondecreasing functions of the same coordinate likelihood values $1 + Z gt.eq 0$: (4.1) is an average of nonnegative products in those variables. The coordinates are independent under $Q_l$. Increasing events for independent real coordinates are nonnegatively correlated, the independent-coordinate case of association #cite(label("EPW1967")) Theorem 2.1. For completeness, in one dimension the covariance of increasing bounded functions $f \, g$ equals $bb(E) \[ \( f \( X \) - f \( X' \) \) \( g \( X \) - g \( X' \) \) \] \/ 2 gt.eq 0$ for independent copies $X \, X'$. Induction conditions on the last coordinate and applies the same fact to the conditional means. Applying this to the two threshold events gives

$ integral min \( G^(\( k \, l \)) \, G^(\( k + 1 \, l \)) \) thin d Q_l gt.eq 1 / 32 exp \( - 2 C'_6 Lambda \) . $

The count laws overlap on

$ \| l - \( 1 - r_e \) k m \| lt.eq m . $

For either $n_b = k m$ or $n_b = \( k + 1 \) m$, every such count is admissible for all large instances: its distance from the corresponding mean is at most $2 m$, and $m \/ n_b asymp 1 \/ \( delta m \) = o \( delta^2 \)$. Stirling’s formula gives mass per count at least

$ c_7 \( delta sqrt(n_b) \)^(- 1) exp #h(-0.16667em) (- C_7 frac(m^2, delta^2 n_b)) gt.eq m^(- 1) exp \( - C_8 Lambda \) $

for absolute positive constants. One way to see the exponent is that the relative entropy between $"Ber" \( l \/ n_b \)$ and $"Ber" \( 1 - r_e \)$ is at most a constant times $\( l \/ n_b - \( 1 - r_e \) \)^2 \/ delta^2$, while

$ \( l \/ n_b \) \( 1 - l \/ n_b \) n_b asymp delta^2 n_b asymp delta^3 m^2 arrow.r oo . $

There are at least $m$ integer counts in this interval. Sum the conditional overlap bounds with the lesser of the two count probabilities. For a sufficiently large absolute $C_9$, the mark-list laws of $W_0^k \, W_0^(k + 1)$ have overlap at least

$ omega = exp \( - C_9 Lambda \) < 1 \/ 8 . $

Their ordinary trace laws have at least the same overlap by concatenation. Choose $C = max { C_(upright("abs")) \/ omega \, 9 \/ delta }$. Then $C delta > 8$ and $log C = O \( Lambda \)$.

=== 4.4 The preliminary observation and its high-degree terms <the-preliminary-observation-and-its-high-degree-terms>

We use the common mass just obtained for the mark-list laws. Draw $J$ independent fair bits $E_1 \, dots.h \, E_J$. Pair a run of $k + E_i$ periods before a central run of $K$ periods with a run of $k + 1 - E_i$ periods after it; use a fixed order for the runs on each side. The number of periods before the central run is

$ L_(upright("left")) = J k + sum_(i = 1)^J E_i . $

For every schedule the exceptional global period $a + i$ has central index $X + i$, where

#[#set math.equation(numbering: n => "(4.9)")
 $ X = a - L_(upright("left")) = ⌊frac(J + K, 2)⌋ - sum_(i = 1)^J E_i = K \/ 2 + O \( J + 1 \) . $ <eq:base-anchor>]

Since $J = o \( K \)$ and $\| I \|$ is fixed, all exceptional periods lie in the central run for every schedule. Thus each schedule cuts the same prescribed word into pure side runs and a central run with the indicated translated types.

Use the paired flag construction of Section 3 on each pair of side mark-list laws, with a common sublaw $omega U$ on the list space. Report the flag and both lists; report the orientation bit only on the visible flag. Report one ordered list of individual marks from the central run, without period boundaries or original slot labels. The list values, including empty-valued entries, are retained. The full report also records the fixed left/right order of its side lists.

Let $P_(+) \, P_(-)$ be these preliminary report laws for $x_0 \, y_0$, and let $P_(upright("pure"))$ be the corresponding law for $W_0^P$. There is one deterministic projection $cal(K)_0$: discard the flags and bits and concatenate all mark values in chronological order. Conditional on any orientation schedule, averaging the pair flags gives independent correct side-list laws; the central list is generated independently from the actual central types. The schedule partitions the same word as just observed. Consequently

#[#set math.equation(numbering: n => "(4.10)")
 $ cal(K)_0 P_(+) = upright("Tr") \( x_0 \) \, #h(2em) cal(K)_0 P_(-) = upright("Tr") \( y_0 \) \, #h(2em) cal(K)_0 P_(upright("pure")) = upright("Tr") \( W_0^P \) . $ <eq:base-exact-projection>]

For the score analysis, the metadata consist of the side flags and lists, the visible bits, and the central list count $l$; they exclude the central mark values. Their law $Q_(upright("meta"))$ is common to all three words. The count is independent of the side data and of $X$, because the $K m$ central erasures have the same probabilities for every type. Given a metadata value $frak(d)$, let $M$ be the number of hidden pairs. The remaining hidden bits are independent and fair, so the conditional law $pi_(frak(d))$ of $X$ is a constant minus $"Bin" \( M \, 1 \/ 2 \)$.

Extend $beta_i$ by zero outside $I$, and define the central type vectors by $\( upright(bold(b))_plus.minus \( X \) \)_j = plus.minus beta_(j - X)$. Conditional on $frak(d)$, the central densities and their coefficient arrays are

#[#set math.equation(numbering: n => "(4.11)")
 $ G_plus.minus^(frak(d)) & = bb(E)_(X tilde.op pi_(frak(d))) G_(upright(bold(b))_plus.minus \( X \))^(\( K \, l \)) \, & A_(r \, plus.minus)^(frak(d)) & = bb(E)_(X tilde.op pi_(frak(d))) A_(r \, upright(bold(b))_plus.minus \( X \)) \,\
G_(upright("pure"))^(frak(d)) & = G_(upright(bold(0)))^(\( K \, l \)) \, & A_(r \, upright("pure"))^(frak(d)) & = A_(r \, upright(bold(0))) . $ <eq:base-central-mixture>]

These densities all integrate to one under $Q_l$. In particular

$ P_plus.minus \( d frak(d) \, d Y \) = Q_(upright("meta")) \( d frak(d) \) thin G_plus.minus^(frak(d)) \( Y \) Q_l \( d Y \) \, $

with $l$ read from $frak(d)$, and the analogous identity holds for $P_(upright("pure"))$. This is the common conditional reference required by Lemma 8.

Call metadata typical when

$ frac(l, K m) in \[ 1 - delta^2 \, 1 - delta^2 \/ 4 \] \, #h(2em) M gt.eq omega^2 J \/ 2 . $

The first failure is a multiplicative binomial tail for the central erasures, and the second is one for the independent hidden flags. The scale margins make both negligible at the required final-length budget:

$ \( d_D + B + 1 \) log n = N^(o \( epsilon.alt \)) \, #h(2em) delta^2 K m = N^(1 - 3 eta - o \( 1 \)) \, #h(2em) omega^2 J = N^(2 eta - o \( 1 \)) . $

Thus both Chernoff exponents dominate $log Delta^(- 1) = 100 \( d_D + B + 1 \) log n$, and atypical metadata have mass $o \( Delta \)$.

Fix typical metadata for the remainder of the coefficient analysis and suppress the superscript $frak(d)$. Put $lambda = sqrt(K \/ m) = N^(- eta \/ 2 + o \( 1 \))$. For a fixed central type vector, Lemmas 10 and 6 give

$ ∥sum_(1 lt.eq v_1 < dots.h.c < v_r lt.eq l) A_(r \, upright(bold(b))) \( v \) product_(h = 1)^r Z \( Y_(v_h) \)∥_(r_0) lt.eq (C_(*) r_0 delta^(- 3 \/ 2) sqrt(lambda))^r r^(- r \/ 4) . $

Here $parallel Z parallel_(r_0) lt.tilde delta^(- 1)$, and $r_0 \, delta^(- 1) = N^(o \( 1 \))$. The factor in parentheses is $N^(- eta \/ 4 + o \( 1 \)) = N^(- .001 + o \( 1 \))$. Put $R_0 = 3000$, and for each of the three densities write $G_(gt.eq R_0)$ for the sum of its homogeneous terms of degrees at least $R_0$ in (4.3) and (4.11). Geometric summation, followed by Minkowski’s inequality when mixing over $X$, gives

#[#set math.equation(numbering: n => "(4.12)")
 $ parallel G - 1 parallel_(r_0) & lt.eq N^(- .0009) \,\
parallel G_(gt.eq R_0) parallel_(r_0) & lt.eq N^(- 2.3) . $ <eq:base-high-degrees>]

The growing $r_0$ is a moment order; $R_0$ is a fixed degree cutoff. It remains to estimate the differences of their finitely many lower-degree arrays.

=== 4.5 Differences of one rank kernel <differences-of-one-rank-kernel>

For a tagged tuple in the central $K$ periods, let $W_(upright(bold(j)))$ be its type-$W_0$ kernel. Let $T_h$ move the $h$-th tagged slot one position to the right, while the rank tuple stays fixed, and put

$ D_h = \( T_h - T_h^(- 1) \) \/ 2 \, #h(2em) V_h = \( T_h + T_h^(- 1) - 2 \) \/ 2 . $

These operators change only the adjacent slot-gap lengths. In particular the total $K m$, the count $l$, the parameter $theta = l \/ \( K m \)$, and the denominator $f_(K m) \( l \)$ remain fixed.

#thm([Lemma 4.3.])[
  (Finite differences of a rank kernel).  #emph[Fix $1 lt.eq r < R_0$, an admissible central count, and a tagged tuple in $K$ periods with coarse gaps $gamma_i$. For disjoint sets $cal(D) \, cal(V) subset.eq { 1 \, dots.h \, r }$, put $v' = \| cal(D) \| + 2 \| cal(V) \|$. Then 
#[#set math.equation(numbering: n => "(4.13)")
 $ ∥product_(h in cal(D)) D_h product_(h in cal(V)) V_h W_(upright(bold(j)))∥_(ell^2)^2 lt.eq delta^(- O_r \( 1 \)) sqrt(K m) thin m^(- v') product_(i = 0)^r \( m gamma_i \)^(- 1 \/ 2) . $ <eq:abase-diff>]

 The implicit constants depend only on $r$.]
] <lem:base-differences>

#proof[
  Let $S_i$ increase gap $i$’s length in the numerator of (4.4). Since $T_h = S_(h - 1) S_h^(- 1)$,
  $ D_h & = 1 / 2 \( T_h - 1 \) \( 1 + T_h^(- 1) \) \, & V_h & = 1 / 2 \( T_h - 1 \)^2 T_h^(- 1) \,\
T_h - 1 & = \( S_(h - 1) - 1 \) S_h^(- 1) + \( S_h^(- 1) - 1 \) . $
  Use also $S_i^(- 1) - 1 = - \( S_i - 1 \) S_i^(- 1)$. Expanding assigns exactly $v'$ first length differences to gaps, with $C_r$ terms and shifts of their lengths by $O_r \( 1 \)$. For an assigned term write $b_i$ for the order on gap $i$; thus $sum_i b_i = v'$.
  Write $\( nabla f \)_g = f_(g + 1) - f_g$ for the first length difference. At any integer length $g gt.eq 1$, the order-$b$ difference $\( nabla^b f \)_g$ has Fourier transform
  $ theta^b \( e^(i t) - 1 \)^b \( 1 - theta + theta e^(i t) \)^g . $
  On $\[ - pi \, pi \]$ the last factor has modulus at most $exp \( - c_(*) delta^2 g t^2 \)$, since $theta \( 1 - theta \) gt.tilde delta^2$. Parseval and Fourier inversion therefore give, respectively,
  $ parallel \( nabla^b f \)_g parallel_2^2 lt.eq C_b delta^(- \( 2 b + 1 \)) g^(- b - 1 \/ 2) \, #h(2em) parallel \( nabla^b f \)_g parallel_oo^2 lt.eq C_b delta^(- \( 2 b + 2 \)) g^(- b - 1) . $
  All shifted lengths are comparable to $g_i$ for large $m$, because $r$ is fixed and $g_i gt.tilde m$.
  Choose a largest coarse gap $e$, so its shifted length $tilde(g)_e gt.tilde_r K m$. In the squared rank sum, solve for $z_e$ and use the squared supremum there, with squared $ell^2$ sums on the other $r$ gaps. For one assigned term $cal(F)$, the displayed bounds and $f_(K m) \( l \)^(- 2) lt.tilde delta^2 K m$ give
  $ parallel cal(F) parallel_2^2 & lt.eq C_r delta^(- \( 2 v' + r \)) K m thin tilde(g)_e^(- 1 - b_e) product_(i eq.not e) tilde(g)_i^(- 1 \/ 2 - b_i)\
 & lt.eq C_r delta^(- \( 2 v' + r \)) sqrt(K m) thin m^(- v') product_(i = 0)^r \( m gamma_i \)^(- 1 \/ 2) . $
  The second line uses $tilde(g)_i gt.tilde m gamma_i$, $tilde(g)_i gt.tilde m$, and the extra factor $tilde(g)_e^(- 1 \/ 2) lt.tilde_r \( K m \)^(- 1 \/ 2)$. Combining the $C_r$ assigned terms proves (4.13). ◻
]

=== 4.6 Signed coefficient arrays and their sums <signed-coefficient-arrays-and-their-sums>

Define the seed motif indicator on the integers by $chi_(upright("seed")) \( i \) = upright(bold(1))_({ i in I })$. The rank event depends on the type vector only through its tagged positions, so for a fixed $X$,

$ W_(upright(bold(j)) \, upright(bold(b))_plus.minus \( X \)) = product_(h = 1)^r T_h^(\( upright(bold(b))_plus.minus \( X \) \)_(j_h)) W_(upright(bold(j))) . $

Each shift factor is exactly

$ T_h^(\( upright(bold(b))_plus.minus \( X \) \)_(j_h)) = 1 + chi_(upright("seed")) \( j_h - X \) V_h med plus.minus med beta_(j_h - X) D_h . $

For disjoint $cal(D) \, cal(V) subset.eq { 1 \, dots.h \, r }$, write

$ c_(upright(bold(j)))^(cal(D) \, cal(V)) = bb(E)_X [product_(h in cal(D)) beta_(j_h - X) product_(h in cal(V)) chi_(upright("seed")) \( j_h - X \)] \, #h(2em) partial_(cal(D) \, cal(V)) = product_(h in cal(D)) D_h product_(h in cal(V)) V_h . $

The coefficient differences $B_r = A_(r \, +) - A_(r \, -)$ and $B_r^(upright("pure")) = A_(r \, +) - A_(r \, upright("pure"))$ come from (4.11). Here and below, $sum_(upright(bold(j)))$ runs over $1 lt.eq j_1 < dots.h.c < j_r lt.eq K$. Expanding the shift factors gives

#[#set math.equation(numbering: n => "(4.14)")
 $ B_r = 2 sum_(cal(D) ∩ cal(V) = diameter\
\| cal(D) \| med upright("odd")) med sum_(upright(bold(j))) c_(upright(bold(j)))^(cal(D) \, cal(V)) partial_(cal(D) \, cal(V)) W_(upright(bold(j))) . $ <eq:base-pattern-expansion>]

For $B_r^(upright("pure"))$, the same expansion runs over all nonempty patterns, without the oddness restriction or the factor $2$. These are finite sums of $C_r$ patterns because $r < R_0$ is fixed.

===== 4.6.1 From individual tuples to the full array. <from-individual-tuples-to-the-full-array.>

Within the increasing rank tuples $1 lt.eq v_1 < dots.h.c < v_r lt.eq l$, define

$ R_(upright(bold(j))) = { v : \| z_i \( v \) - theta m gamma_i \| < m \/ 8 upright(" for ") 0 lt.eq i < r } . $

These regions are disjoint. The first and internal coarse gaps determine the tuple, and any differing coordinate changes its center by at least $theta m gt.eq 3 m \/ 4$, more than the combined radii $m \/ 4$. Bounded shifts of a kernel use the same region.

Fix one pattern and abbreviate its multiplier and operator by $c_(upright(bold(j)))$ and $partial$. Disjointness gives the weighted identity

#[#set math.equation(numbering: n => "(4.15)")
 $ ∥sum_(upright(bold(j))) upright(bold(1))_(R_(upright(bold(j)))) c_(upright(bold(j))) partial W_(upright(bold(j)))∥_2^2 = sum_(upright(bold(j))) \| c_(upright(bold(j))) \|^2 parallel upright(bold(1))_(R_(upright(bold(j)))) partial W_(upright(bold(j))) parallel_2^2 lt.eq sum_(upright(bold(j))) \| c_(upright(bold(j))) \|^2 parallel partial W_(upright(bold(j))) parallel_2^2 . $ <eq:base-localized-array>]

The part outside these regions is negligible as an analytic coefficient estimate. To estimate it, expand $D_h \, V_h$ directly into tag shifts $T_h$, which preserve the total $K m$. Each resulting term is a fixed signed coefficient times a nonnegative shifted rank kernel. For each such kernel in $partial W_(upright(bold(j)))$, the conditional binomial formula and Hoeffding’s inequality #cite(label("Hoeffding1963")) Theorem 2 give

$ sum_(v in.not R_(upright(bold(j)))) W_(upright(bold(j)) \, upright("shift")) \( v \) lt.eq C_r f_(K m) \( l \)^(- 1) e^(- c_(*) m \/ K) lt.eq C_r sqrt(K m) thin e^(- c_(*) m \/ K) . $

Indeed a bounded shift changes each relevant mean by $O_r \( 1 \)$, while the excluded deviation is order $m$, and each gap has length at most $K m + O_r \( 1 \)$. Dropping the total constraint and taking a union bound over $i < r$ proves the display. There are at most $K^r$ tuples, the multiplier is bounded by $1$, and $partial$ is a fixed linear combination of shifted kernels. Using $parallel dot.op parallel_2 lt.eq parallel dot.op parallel_1$ for coefficient arrays, the discarded array has $ell^2$ norm at most

$ tau_r = C_r K^r sqrt(K m) thin e^(- c_(*) m \/ K) . $

It follows from (4.15) that the squared norm of the full array for this pattern is at most

$ 2 sum_(upright(bold(j))) \| c_(upright(bold(j))) \|^2 parallel partial W_(upright(bold(j))) parallel_2^2 + 2 tau_r^2 . $

This restriction does not condition a reported law or incur a total-variation error. Since $m \/ K = N^(eta + o \( 1 \))$, even $\( C_(*) r_0 delta^(- 1) \)^r tau_r = o \( N^(- A) \)$ for every fixed $A$, uniformly over the finitely many $r < R_0$.

===== 4.6.2 Sums with one involved period fixed. <sums-with-one-involved-period-fixed.>

The next two sums separate rank differentiation from the random location multiplier. For $1 lt.eq h lt.eq r$ and an integer $j$, put

$ Sigma_(r \, h) \( j \) = sqrt(K m) sum_(1 lt.eq j_1 < dots.h.c < j_r lt.eq K\
j_h = j) product_(i = 0)^r \( m gamma_i \)^(- 1 \/ 2) . $

For $r gt.eq 2$, let $Sigma_(r \, h)^(upright("bd")) \( j \)$ be the same sum restricted to tuples with $gamma_i lt.eq \| I \|$ for some $1 lt.eq i < r$.

#thm([Lemma 4.4.])[
  (Gap sums at a fixed period).  #emph[For fixed $1 lt.eq r < R_0$, uniformly in $h$ and $j in \[ K \/ 3 \, 2 K \/ 3 \]$, 
#[#set math.equation(numbering: n => "(4.16)")
 $ Sigma_(r \, h) \( j \) lt.eq C_r \( K m \)^(- 1 \/ 2) lambda^(r - 1) \, #h(2em) Sigma_(r \, h)^(upright("bd")) \( j \) lt.eq C_(r \, s_0) \( K m \)^(- 1 \/ 2) m^(- 1 \/ 2) lambda^(r - 2) quad \( r gt.eq 2 \) . $ <eq:base-fixed-sums>]

]
] <lem:base-fixed-sums>

#proof[
  The left gaps $0 \, dots.h \, h - 1$ sum to $j - 1 / 2$, and the right gaps $h \, dots.h \, r$ sum to $K - j + 1 / 2$. Each total is order $K$. Select a largest gap on each side; both are at least $c_r K$, so their two factors cost $C_r \( K m \)^(- 1)$. Given $j$ and the other $r - 1$ gaps, the two total constraints determine the selected gaps. Each remaining free sum costs
  $ sum_(gamma > 0\
gamma lt.eq K) \( m gamma \)^(- 1 \/ 2) lt.eq C_(*) sqrt(K \/ m) = C_(*) lambda $
  on either the integer or half-integer lattice. Grouping by the at most $C_r$ choices of selected gaps and multiplying by $sqrt(K m)$ proves the first bound.
  For the restricted sum, an internal gap at most $\| I \|$ cannot be either selected largest gap for all sufficiently large $K$. Union over its at most $r - 1$ possible indices. Its sum is at most $sum_(gamma = 1)^(\| I \|) \( m gamma \)^(- 1 \/ 2) lt.eq C_(s_0) m^(- 1 \/ 2)$ instead of $C_(*) lambda$. The other $r - 2$ free sums are unchanged, proving the second bound. ◻
]

===== 4.6.3 The location multipliers. <the-location-multipliers.>

For the fixed metadata, (4.9) shows that every $j in "supp" \( chi_(upright("seed")) * pi \)$ satisfies $j = K \/ 2 + O \( J + \| I \| \)$, and hence lies in $\[ K \/ 3 \, 2 K \/ 3 \]$ for all large instances. Thus Lemma 12 applies to every involved period. For a sequence $a$ on the integers, use the Fourier transform $hat(a) \( t \) = sum_j a \( j \) e^(i j t)$. If $M gt.eq omega^2 J \/ 2$ is the hidden count, then

$ \| hat(pi) \( t \) \| = \| cos \( t \/ 2 \) \|^M lt.eq e^(- c_(*) M t^2) #h(2em) \( - pi lt.eq t lt.eq pi \) . $

Since

$ lr(|sum_(i in I) beta_i e^(i t i)|) = lr(|product_(v = 0)^(s_0 - 1) \( 1 - e^(i 2^v t) \)|) lt.eq C_(s_0) \| t \|^(s_0) \, $

Parseval and the binomial decay give

#[#set math.equation(numbering: n => "(4.17)")
 $ parallel beta * pi parallel_2^2 & lt.eq C_(s_0) M^(- s_0 - 1 \/ 2) lt.eq C_(s_0) omega^(- 2 s_0 - 1) J^(- s_0 - 1 \/ 2) \,\
parallel chi_(upright("seed")) * pi parallel_2^2 & lt.eq parallel chi_(upright("seed")) parallel_1^2 parallel pi parallel_2^2 lt.eq C_(s_0) M^(- 1 \/ 2) lt.eq C_(s_0) omega^(- 1) J^(- 1 \/ 2) . $ <eq:base-multiplier-norms>]

The constants depending on $s_0 = 300$ are fixed.

The dyadic signs turn convolution into a high-order finite difference. The same cancellation algebra appears in #cite(label("HMPW2008"), form: "prose") Section 3.2, equation (3.10), where iterated input-position differences act on a mean-coordinate binomial kernel. Here the signs are convolved with the conditional location law inside a likelihood coefficient; the terms involving several scores require the separate gap estimate above.

In (4.14), a singleton $cal(D) = { h } \, cal(V) = diameter$ has $v' = 1$ and multiplier $\( beta * pi \) \( j_h \)$. Every other surviving pattern has an odd positive number of $D$’s, so $v' gt.eq 3$ and at least two indices are involved. At any chosen involved $h$,

$ \| c_(upright(bold(j)))^(cal(D) \, cal(V)) \| lt.eq \( chi_(upright("seed")) * pi \) \( j_h \) . $

A nonzero multiplier requires all involved periods to lie in a common translate of $I$. Two of them therefore differ by at most $\| I \| - 1$, so some intervening internal gap is at most $\| I \|$.

For either kind of pattern choose such an involved $h$, and let $psi \( j \)$ be the corresponding envelope $\| \( beta * pi \) \( j \) \|$ or $\( chi_(upright("seed")) * pi \) \( j \)$. Apply Lemma 11 and first sum over tuples with $j_h = j$:

$ sum_(upright(bold(j))) \| c_(upright(bold(j))) \|^2 parallel partial W_(upright(bold(j))) parallel_2^2 lt.eq delta^(- O_r \( 1 \)) m^(- v') sum_j psi \( j \)^2 cases(delim: "{", Sigma_(r \, h) \( j \) \, & upright("for a singleton") \,, Sigma_(r \, h)^(upright("bd")) \( j \) \, & upright("otherwise") .) $

Now (4.16) and (4.17) apply. Combining the finitely many patterns in (4.14) and the analytic tail gives

#[#set math.equation(numbering: n => "(4.18)")
 $ parallel B_r parallel_2^2 lt.eq C_(r \, s_0) delta^(- O_r \( 1 \)) #scale(x: 180%, y: 180%)[\[] & omega^(- 2 s_0 - 1) J^(- s_0 - 1 \/ 2) m^(- 1) \( K m \)^(- 1 \/ 2) lambda^(r - 1)\
 & + upright(bold(1))_(r gt.eq 2) thin omega^(- 1) J^(- 1 \/ 2) \( K m \)^(- 1 \/ 2) m^(- 7 \/ 2) lambda^(r - 2) #scale(x: 180%, y: 180%)[\]] + C_r tau_r^2 . $ <eq:base-low-coefficients>]

The nonlinear $m^(- 7 \/ 2)$ is $m^(- 3)$ from its minimum difference order and $m^(- 1 \/ 2)$ from the bounded internal gap. For $B_r^(upright("pure"))$, the singleton $D$ contribution is the same. Every other pattern has $v' gt.eq 2$, but a singleton $V$ requires no bounded internal gap. The full pure-comparison array therefore satisfies

#[#set math.equation(numbering: n => "(4.19)")
 $ parallel B_r^(upright("pure")) parallel_2^2 lt.eq C_(r \, s_0) delta^(- O_r \( 1 \)) #scale(x: 180%, y: 180%)[\[] & omega^(- 2 s_0 - 1) J^(- s_0 - 1 \/ 2) m^(- 1) \( K m \)^(- 1 \/ 2) lambda^(r - 1)\
 & + omega^(- 1) J^(- 1 \/ 2) \( K m \)^(- 1 \/ 2) m^(- 2) lambda^(r - 1) #scale(x: 180%, y: 180%)[\]] + C_r tau_r^2 . $ <eq:base-pure-coefficients>]

=== 4.7 Closing the initial invariant <closing-the-initial-invariant>

For each fixed $r < R_0$, Lemma 6 converts the coefficient estimate to the required score estimate:

$ ∥sum_(1 lt.eq v_1 < dots.h.c < v_r lt.eq l) B_r \( v \) product_(h = 1)^r Z \( Y_(v_h) \)∥_(r_0)^2 lt.eq \( C_1 r_0 parallel Z parallel_(r_0) \)^(2 r) parallel B_r parallel_2^2 . $

The analogous inequality applies to the pure comparison. The fixed pattern constants, the displayed powers of $delta^(- 1)$ and $omega^(- 1)$, and the moment factors are $N^(o \( 1 \))$: use $log r_0 = O_B \( D + 1 \)$, $log omega^(- 1) = O \( Lambda \)$, and $Lambda = o \( log N \)$. The analytic tails remain below every fixed power after these factors.

The worst nonlinear term of (4.18), at $r = 2$, is

$ J^(- 1 \/ 2) \( K m \)^(- 1 \/ 2) m^(- 7 \/ 2) = N^(- eta) thin N^(- 1 \/ 2 + 3 eta \/ 2) thin N^(- 7 \/ 4 + 7 eta \/ 2 + o \( 1 \)) = N^(- 9 \/ 4 + 4 eta + o \( 1 \)) = N^(- 2.234 + o \( 1 \)) . $

The singleton term is $N^(- 3.394 + o \( 1 \))$ at its worst degree $r = 1$. The worst nonlinear term in (4.19) is $N^(- 3 \/ 2 + 5 eta \/ 2 + o \( 1 \)) = N^(- 1.49 + o \( 1 \))$. Sum over the finitely many lower degrees and add the degree tails in (4.12). On every typical metadata value this yields

#[#set math.equation(numbering: n => "(4.20)")
 $ parallel G_(+) - G_(-) parallel_(r_0)^2 lt.eq N^(- 2.22) \, #h(2em) parallel G_(+) - G_(upright("pure")) parallel_(r_0)^2 lt.eq N^(- 1.4) . $ <eq:base-score-differences>]

Let $cal(A)$ be the joint event of typical metadata and $G_(+)^(frak(d)) \( Y \) gt.eq 1 \/ 2$, and define

$ mu_0 = P_(+) \( thin dot.op divides cal(A) \) \, #h(2em) nu_0 = P_(-) \( thin dot.op divides cal(A) \) . $

Lemma 8 applies to the common conditional reference above: (4.12) gives $rho = .0009 gt.eq 2^(- 4 B - 10)$, and $2.22 > 2.20 + .01$ supplies its difference margin. Hence

$ nu_0 lt.double mu_0 \, #h(2em) parallel d nu_0 \/ d mu_0 - 1 parallel_(L^(r_0) \( mu_0 \))^2 lt.eq N^(- 2.20) \, $

and conditioning changes each preliminary law by $o \( Delta \)$ in total variation. By (4.10) and contraction under the same $cal(K)_0$,

$ "TV" \( cal(K)_0 mu_0 \, upright("Tr") \( x_0 \) \) lt.eq o \( Delta \) lt.eq Delta \, #h(2em) "TV" \( cal(K)_0 nu_0 \, upright("Tr") \( y_0 \) \) lt.eq o \( Delta \) lt.eq Delta $

for all large instances. This gives $E_0 lt.eq Delta$ and the score part of the invariant. The hidden-bit law was used for the preliminary densities only.

It remains to transfer pure-run overlap to $x_0$. This comparison uses the preliminary laws, rather than the full clipping conclusion for their weaker $N^(- 1.4)$ difference. On typical metadata and $G_(+) gt.eq 1 \/ 2$,

$ \( sqrt(G_(+)) - sqrt(G_(upright("pure"))) \)^2 lt.eq 2 \| G_(+) - G_(upright("pure")) \|^2 . $

On the complement use the bound $G_(+) + G_(upright("pure"))$. The high-moment estimate (4.12) and the clipping proof bound the mass of the bad-density region under both preliminary laws by $o \( Delta \)$; atypical metadata have the same bound. Thus (4.20) gives

$ H^2 \( P_(+) \, P_(upright("pure")) \) lt.eq 2 N^(- 1.4) + o \( Delta \) lt.eq 3 N^(- 1.4) . $

Projection by $cal(K)_0$ gives the same upper bound for $H^2 \( upright("Tr") \( x_0 \) \, upright("Tr") \( W_0^P \) \)$.

Set $k_0 = ceil.l C k P ceil.r$. Since $k tilde.op delta m$ and $C delta > 8$, we have $k_0 gt.eq ell_0$ for all large instances. Also,

$ k_0 / ell_0 lt.eq frac(C delta m, 2 m - 1) + 1 / ell_0 < C \, $

using $delta lt.eq 1 \/ 2$, $C gt.eq 18$, and $ell_0 arrow.r oo$. Thus the common choice $M_B = 1$ meets the level-zero count predicate. Moreover $C = exp \( O \( Lambda \) \) = N^(o \( 1 \))$. For $F = k_0 \, k_0 + 1$, tensorization followed by concatenation therefore gives

$ "TV" \( upright("Tr") \( x_0^F \) \, upright("Tr") \( W_0^(P F) \) \) lt.eq sqrt(F thin H^2 \( upright("Tr") \( x_0 \) \, upright("Tr") \( W_0^P \) \)) lt.eq sqrt(3 F N^(- 1.4)) = N^(- 0.2 + o \( 1 \)) = o \( 1 \) . $

Lemma 7, with base word $W_0$, overlap count $k$, replication $P$, and $F = k_0$, gives overlap at least $2 \/ 3$ for the two pure repeated comparison words. Paying the two replacement costs leaves

$ "ov" \( upright("Tr") \( x_0^(k_0) \) \, upright("Tr") \( x_0^(k_0 + 1) \) \) gt.eq 2 \/ 3 - o \( 1 \) gt.eq omega . $

Together with the length, distinction, score, and simulation estimates already proved, this completes Proposition 9.

== 5 One amplification block: words and overlap <sec:block>

We now construct one longer pair from the preceding oracle pair. This section defines the nested words and proves the consecutive-power overlap needed for their side runs. Section 6 constructs the observation of those words, and Section 7 proves its score estimate.

#thm([Proposition 5.1.])[
  (One amplification block).  #emph[For the parameters of Section 2, let $1 lt.eq i lt.eq D$ and suppose a level-$\( i - 1 \)$ pair satisfies Definition 4 with constants $C \, omega \, M_B$. Set 
$ C' = max { C \, C_(upright("abs")) \/ omega } . $

 The input pair remains valid when $C$ is replaced by $C'$, and there exists a level-$i$ pair satisfying the definition with the same constants $C' \, omega \, M_B$, with 
$ d_i = d_(i - 1) + \( b_i - 1 \) \/ 4 - .05 \, #h(2em) E_i lt.eq Delta + \( ell_i \/ ell_(i - 1) \) E_(i - 1) . $

 Every preceding level constructed with $C$ also remains valid with $C'$, and this enlarged value is retained in later blocks. The conclusion is uniform over all levels along the stated joint asymptotic regime.]
] <prop:block>

Fix $i$ for the proof. The value $C'$ meets the hypothesis of Lemma 7. Every preceding upper count bound remains true after replacing $C$ by $C'$, since its exponent $2 B h + M_B$ at a level $h gt.eq 0$ is nonnegative; the lower count bounds, scores, and projection errors do not involve $C$. The enlarged constant still depends only on $delta$ and satisfies $log C' = O \( Lambda \)$. We henceforth write $C$ for $C'$ and use this common enlarged constant in the counts constructed below and in later blocks.

Abbreviate

$ b = b_i \, quad N = N_i \, quad d = d_(i - 1) \, quad d' = d_i \,\
x = x_(i - 1) \, quad y = y_(i - 1) \, quad ell = ell_(i - 1) \, quad k = k_(i - 1) . $

Within this block write $a_0 = a_0 \( b \)$ for the contraction exponent defined in (2.1). Thus $ell in \[ N^(a_0) \/ 2 \, N^(a_0) \]$. Since $r_i lt.eq r_(i - 1)$, the old score satisfies

#[#set math.equation(numbering: n => "(5.1)")
 $ ∥frac(d nu_(i - 1), d mu_(i - 1)) - 1∥_(L^(r_i) \( mu_(i - 1) \))^2 lt.eq N^(- a_0 d) . $ <eq:old-score>]

=== 5.1 Nested signed words <nested-signed-words>

The two new words will use the same nested motif at $b$ depths. Choose the fixed degree cutoff and the cancellation order

$ r_(*) = 2^(10 B + 40) \, #h(2em) s_(*) = ⌈100 \( d_D + r_(*) + B + 10 \) \/ epsilon.alt⌉ \, #h(2em) L = 2^(s_(*)) . $

Let $cal(I) = { 0 \, dots.h \, L - 1 }$ and define the signs by

$ sum_(a in cal(I)) sigma_a z^a = product_(v = 0)^(s_(*) - 1) \( 1 - z^(2^v) \) . $

Extend $sigma_a$ by zero outside $cal(I)$, and put $chi = upright(bold(1))_(cal(I))$. The order $s_(*) = O_B \( \( D + 1 \)^2 \)$ is large enough for the signed smoothing below at every block. Lemma 3 gives, uniformly,

#[#set math.equation(numbering: n => "(5.2)")
 $ L^(O_B \( r_(*) B \)) = N^(o \( epsilon.alt \)) \,\
exp #scale(x: 120%, y: 120%)[\(] O_B \( \( s_(*) + 1 \)^2 + \( s_(*) + 1 \) \( D + 1 \) Lambda \) #scale(x: 120%, y: 120%)[\)] = N^(o \( epsilon.alt \)) . $ <eq:block-losses>]

Here and below fixed-depth constants may depend on $B$.

Start with $U_0^(+) = x$, $U_0^(-) = y$, both of length $S_0 = ell$, and with overlap count $h_0 = k$. Once a positive integer $P_j$ has been chosen, form $U_j^tau$, for $tau in { + 1 \, - 1 }$, from $P_j$ consecutive level-$\( j - 1 \)$ atoms. Use type $+$ except at the labels $floor.l P_j \/ 2 floor.r + a$, $a in cal(I)$, where the type is $tau sigma_a$. We choose the counts below so that these labels lie in $\[ 1 \, P_j \]$. The common length is

$ S_j = P_j S_(j - 1) . $

The two words are distinct: at a motif label their atom types differ, and equal-length atoms give a fixed parse back to the distinct old words.

=== 5.2 Word sizes, windows, and paired counts <word-sizes-windows-and-paired-counts>

Write $N^(a_j)$ for the target length of a level-$j$ word. It then contains about $N^(a_j - a_(j - 1))$ lower atoms. An overlap chunk will contain $h_(j - 1)$ such atoms, with $h_(j - 1)$ within the controlled channel factor of their word length $N^(a_(j - 1))$. To leave about $N^epsilon.alt$ paired chunks, choose the remaining exponents by

$ a_j \( b \) = 2 a_(j - 1) \( b \) + epsilon.alt quad \( 1 lt.eq j lt.eq b \) . $

This recurrence and (2.1) give the identities

#[#set math.equation(numbering: n => "(5.3)")
 $ a_j \( b \) = \( 1 + epsilon.alt \) 2^(j - b) - epsilon.alt quad \( 0 lt.eq j lt.eq b \) \, #h(2em) a_b \( b \) = 1 . $ <eq:local-exponents>]

In the rest of this block, $a_j$ abbreviates $a_j \( b \)$.

A level-$j$ child window will contain $T_j$ level-$\( j - 1 \)$ atoms. Define

$ kappa_j = a_(j - 1) - 3 \( 2^j - 1 \) epsilon.alt \, #h(2em) T_j = 4 ⌊N^(kappa_j) \/ 4⌋ quad \( 1 lt.eq j lt.eq b \) . $

The $kappa_j$ are positive for all sufficiently large instances, uniformly in the block. Directly from (5.3),

#[#set math.equation(numbering: n => "(5.4)")
 $ 2 kappa_j - kappa_(j + 1) - epsilon.alt & = epsilon.alt quad \( 1 lt.eq j < b \) \,\
kappa_b & > epsilon.alt \, #h(2em) kappa_j < a_(j - 1) < a_j - a_(j - 1) quad \( 1 lt.eq j lt.eq b \) . $ <eq:kj>]

The first identity makes $T_j$ larger than the typical displacement from $T_(j + 1)$ collections of about $N^epsilon.alt$ fair bits: the squared window width divided by that bit count has order $N^epsilon.alt$. The remaining inequalities leave room for the windows inside their words. We also have

#[#set math.equation(numbering: n => "(5.5)")
 $ sum_(j = 1)^b kappa_j < 1 \, $ <eq:power_gap>]

since $kappa_j < a_(j - 1) < 2^(j - 1 - b)$; this will bound the number of vertices in the observation tree.

For $1 lt.eq j < b$, choose

$ P_j & = ⌊N^(a_j) \/ S_(j - 1)⌋ \, & h_j & = ceil.l C h_(j - 1) P_j ceil.r \,\
t_j & = 2 ⌊P_j \/ \[ 100 \( 2 h_(j - 1) + 1 \) \]⌋ . $

For the root, choose

$ J & = ⌊frac(floor.l N \/ S_(b - 1) floor.r - T_b, 2 h_(b - 1) + 1)⌋ \, & P_b & = J \( 2 h_(b - 1) + 1 \) + T_b \,\
h_b & = ceil.l C h_(b - 1) P_b ceil.r . $

The counts $t_j$ and $J$ are the numbers of paired chunks used for local and outer displacements, respectively. The factors $2$ and $4$ in their definitions and in $T_j$ ensure the parity and divisibility needed by the partition.

We record the size consequences before using the words. For $j < b$, flooring loses at most $S_(j - 1) = o \( N^(a_j) \)$, so

$ S_j in \[ N^(a_j) \/ 2 \, N^(a_j) \] \, #h(2em) P_j asymp N^(a_j - a_(j - 1)) \, #h(2em) T_j = o \( P_j \) . $

The overlap counts remain within the declared uniform bound. Indeed $h_j gt.eq S_j$ by induction, and

$ h_j / S_j lt.eq C h_(j - 1) / S_(j - 1) + 1 lt.eq C^2 h_(j - 1) / S_(j - 1) $

because $h_(j - 1) \/ S_(j - 1) gt.eq 1$ and $C > 2$. Starting from the level-$\( i - 1 \)$ bound gives

#[#set math.equation(numbering: n => "(5.6)")
 $ S_j lt.eq h_j lt.eq C^(2 B \( i - 1 \) + M_B + 2 j) S_j lt.eq C^(2 B i + M_B) S_j quad \( 0 lt.eq j lt.eq b \) \, $ <eq:nested-counts>]

In particular the extra count factor is at most $exp \( O_B \( \( D + 1 \) Lambda \) \)$.

Using these bounds in the definitions of $t_j$ and $J$ yields

#[#set math.equation(numbering: n => "(5.7)")
 $ e^(- O_B \( \( D + 1 \) Lambda \)) N^epsilon.alt lt.eq t_j lt.eq O \( N^epsilon.alt \) quad \( 1 lt.eq j < b \) \, $ <eq:scale_t>]

and the same lower and upper bounds for $J$. All these counts tend to infinity uniformly. At the root, $J = o \( T_b \)$ by $kappa_b > epsilon.alt$, and

$ N - S_b = O \( \( h_(b - 1) + 1 \) S_(b - 1) \) lt.eq N^(2 a_(b - 1) + o \( epsilon.alt \)) = N^(1 - epsilon.alt + o \( epsilon.alt \)) = o \( N \) . $

Here the count overhead is $N^(o \( epsilon.alt \))$ by (2.3), and $2 a_(b - 1) = 1 - epsilon.alt$ by (5.3). Thus also $S_b in \[ N \/ 2 \, N \]$. Working backward from $kappa_b > epsilon.alt$ in (5.4) gives $kappa_j > epsilon.alt$ at every depth. The uniform loss bound (5.2) therefore gives $L = o \( T_j \)$ and $L = o \( P_j \)$ uniformly, so all motif labels used above fit. We take

$ x_i = U_b^(+) \, #h(2em) y_i = U_b^(-) \, #h(2em) ell_i = S_b \, #h(2em) k_i = h_b . $

The following estimate quantifies the smoothing supplied by a hidden binomial offset. It will be used in the early overlap comparison and in the main score proof. In those applications, its local parameter $m$ is one of the paired counts $J$ or $t_j$, while $g$ is the actual number of hidden orientation trials.

#thm([Lemma 5.2.])[
  (Signed binomial smoothing).  #emph[Let $sigma$ be the Prouhet–Thue–Morse sequence of order $s_(*)$ above. Suppose $pi$ is an integer translation or reflection of a fair binomial probability mass function with $g gt.eq c_0 omega^2 m$ trials, where $c_0 > 0$ is absolute and $m arrow.r oo$ as in the construction. Then 
#[#set math.equation(numbering: n => "(5.8)")
 $ parallel sigma * pi parallel_oo & lt.eq exp \( O \( \( s_(*) + 1 \)^2 + \( s_(*) + 1 \) Lambda \) \) thin m^(- \( s_(*) + 1 \) \/ 2) \,\
parallel sigma * pi parallel_2^2 & lt.eq exp \( O \( \( s_(*) + 1 \)^2 + \( s_(*) + 1 \) Lambda \) \) thin m^(- s_(*) - 1 \/ 2) \, #h(2em) parallel pi parallel_oo lt.eq O \( omega^(- 1) m^(- 1 \/ 2) \) . $ <eq:sig_conv>]

 The norms use counting measure on the integers, and the implicit constants may depend on $c_0$.]
] <lem:binomial-smoothing>

#proof[
  Translations and reflections do not affect the estimates. For the first two, use Fourier inversion and Parseval. On $\[ - pi \, pi \]$ the sign transform has modulus at most $2^(s_(*) \( s_(*) - 1 \) \/ 2) \| z \|^(s_(*))$, and the binomial transform has modulus at most $e^(- c g z^2)$. Gaussian integration contributes, besides the power of $g$, a factor $exp \( O \( \( s_(*) + 1 \) log \( s_(*) + 1 \) \) \)$. The last estimate is the binomial maximum bound from Stirling’s formula. ◻
]

=== 5.3 Overlap for each nested atom <sec:side-overlap>

#thm([Lemma 5.3.])[
  (Overlap of the nested atoms).  #emph[Under the input hypotheses of Proposition 13, the words and counts constructed above satisfy, for every $1 lt.eq j lt.eq b$, 
$ "ov" #scale(x: 120%, y: 120%)[\(] upright("Tr") \( \( U_j^(+) \)^(h_j) \) \, upright("Tr") \( \( U_j^(+) \)^(h_j + 1) \) #scale(x: 120%, y: 120%)[\)] gt.eq omega . $

]
] <lem:nested-overlap>

#proof[
  The old score and the two projection errors give
  #[#set math.equation(numbering: n => "(5.9)")
   $ H^2 \( upright("Tr") \( x \) \, upright("Tr") \( y \) \) lt.eq O \( N^(- a_0 d) + E_(i - 1) \) . $ <eq:old_H>]
  Indeed the score bounds the squared Hellinger distance of the old oracle laws, and contraction followed by the Hellinger triangle inequality handles the two projection errors.
  For the induction on $j$, assume the overlap statement at level $j - 1$; at $j = 1$ it is the input invariant. Lemma 7, with base word $U_(j - 1)^(+)$, overlap count $h_(j - 1)$, replication $P_j$, and $F = h_j gt.eq C h_(j - 1) P_j$, gives overlap at least $2 \/ 3$ for the two pure comparison words formed by repeating $P_j$ copies of $U_(j - 1)^(+)$. Replacing one such length-$S_j$ unit by $U_j^(+)$ changes at most $L$ lower atoms. For $h_j$ or $h_j + 1$ repeated units, the squared Hellinger replacement cost is therefore at most
  #[#set math.equation(numbering: n => "(5.10)")
   $ \( h_j + 1 \) L thin H^2 \( upright("Tr") \( U_(j - 1)^(+) \) \, upright("Tr") \( U_(j - 1)^(-) \) \) . $ <eq:nested-replacement>]
  The two phases of the depth schedule give the margins needed here. From (5.3) and the choice of $epsilon.alt$, for $b = 2$ and $d gt.eq 2.20$,
  #[#set math.equation(numbering: n => "(5.11)")
   $ a_0 d - a_1 > .03 \, #h(2em) 2 a_0 d > 1.06 . $ <eq:b2gap>]
  For $i > j_0$, we have $b = B$ and $d gt.eq 2^B + 2.20$, giving
  #[#set math.equation(numbering: n => "(5.12)")
   $ a_0 d > 1 + 2^(- B) . $ <eq:bbgap>]
  For example, before the $epsilon.alt d$ correction the first two left sides are at least $.05$ and $1.10$, and the last is at least $1 + 2.20 thin 2^(- B)$. The bound $d lt.eq 2.20 + \( B \/ 4 \) D$ and $epsilon.alt = 2^(- 4 B - 100) \/ \( D + 1 \)$ leave the displayed margins uniformly.
  In a block with $i > j_0$, the two level-$\( j - 1 \)$ atoms differ on at most $L^(j - 1)$ old atoms. Tensorization, concatenation, and (5.9) therefore bound (5.10) by $o \( 1 \)$: use (5.12), $h_j lt.eq e^(O_B \( \( D + 1 \) Lambda \)) N$, $L^b = N^(o \( epsilon.alt \))$, and $E_(i - 1) lt.eq n \( D + 1 \) Delta$. In a preliminary block, $b = 2$. At $j = 1$ the same argument uses $h_1 lt.eq e^(O_B \( \( D + 1 \) Lambda \)) N^(a_1)$ and the first inequality in (5.11). At $j = 2$ we need the sharper comparison
  #[#set math.equation(numbering: n => "(5.13)")
   $ H^2 \( upright("Tr") \( U_1^(+) \) \, upright("Tr") \( U_1^(-) \) \) lt.eq N^(- 2 a_0 d + o \( epsilon.alt \)) + O \( P_1 E_(i - 1) + Delta \) \, #h(2em) b = 2 . $ <eq:side_refine>]
  The second inequality in (5.11) then makes (5.10) $o \( 1 \)$ at the root as well.
  To prove (5.13), report a single window of $T_1$ separate old oracle outputs. Its nominal start is after $A = floor.l \( P_1 - T_1 \) \/ 2 floor.r$ old atoms. Put $t_1$ paired pure-$x$ chunks before and after the window, with counts $h_0 + E \, h_0 + 1 - E$ for independent fair bits $E$. Use the paired flag construction at the input overlap. Complete the two sides by pure-$x$ residuals of counts
  $ A - t_1 \( h_0 + 1 \/ 2 \) \, #h(2em) P_1 - T_1 - A - t_1 \( h_0 + 1 \/ 2 \) . $
  These are nonnegative integers. Chunks and residuals have fixed relative IDs and each reports one unseparated ordinary trace, together with its flag and any revealed bit. The window start displacement $V$ is the sum of the $t_1$ bits minus $t_1 \/ 2$, so $\| V \| lt.eq t_1 \/ 2 = o \( T_1 \)$. Every motif label therefore lies in the window.
  Conditional on the orientation bits, sample the $T_1$ window outputs independently of one another and of the entire collection of side flags and emissions, using $mu_(i - 1)$ for an $x$ atom and $nu_(i - 1)$ for a $y$ atom at the corresponding rank. Inside the window, report the old oracle outputs with their relative ranks, but not their absolute start or type labels. Apply $cal(K)_(i - 1)$ independently to these outputs and concatenate in the scheduled order. Given the orientation bits, averaging the flags produces the exact independent trace laws of the other pieces. The common projection therefore approximates the genuine trace with error at most $T_1 E_(i - 1)$ under either hypothesis.
  Except on side metadata of probability $o \( Delta \)$, at least $omega^2 t_1 \/ 2$ orientations are hidden, by binomial concentration and (5.7). Conditional on such metadata, $V$ is a translated fair binomial with that many trials. Relative to $Q = mu_(i - 1)^(⊗ T_1)$, let $G_(+) \, G_(-)$ be the conditional densities of the window outputs. For fixed $V$, each is a product of at most $L$ factors $1 + Z$ at distinct positions, averaged over $V$, where $Z$ is the old score. Lemma 6 gives for its homogeneous degree-$r$ part the squared $L^(r_i) \( Q \)$ bound
  $ \( C_1 r_i \)^(2 r) N^(- a_0 d r) binom(L, r) . $
  Convexity permits averaging over $V$ at the same bound. Geometric summation gives
  $ parallel G_plus.minus - 1 parallel_(r_i) lt.eq N^(- a_0 d \/ 2 + o \( epsilon.alt \)) \, $
  and the squared norm of the terms of degree at least two is at most $N^(- 2 a_0 d + o \( epsilon.alt \))$. In $G_(+) - G_(-)$ the singleton coefficient array is, up to signs, the convolution of $sigma$ with the law of $V$. Equation (5.8) and (5.7) bound its square sum strongly enough that
  $ parallel G_(+) - G_(-) parallel_(r_i)^2 lt.eq N^(- 2 a_0 d + o \( epsilon.alt \)) \; $
  indeed $t_1^(- s_(*)) lt.eq N^(- epsilon.alt s_(*)) exp \( O_B \( \( D + 1 \) s_(*) Lambda \) \)$.
  On typical metadata, the region $G_(+) < 1 \/ 2$ has mass $o \( Delta \)$ under both laws by the same moment argument as in Lemma 8. On its complement, the squared density difference bounds Hellinger distance. Adding the atypical metadata and projection errors proves (5.13), with fixed numerical factors absorbed in $o \( epsilon.alt \)$. Thus all replacement costs in (5.10) are $o \( 1 \)$. The pure overlap $2 \/ 3$ loses at most the two replacement total variations, and remains above $omega < 1 \/ 8$. This completes the overlap induction. ◻
]

The words, counts, and overlaps required for the observation are now available at every nested depth. The next section uses their paired side runs to hide the relative locations of the motifs.

== 6 An observation with randomly displaced windows <sec:layout>

The nested words now have the overlap needed to hide their motif locations. We construct an auxiliary observation that reports the tree of windows and the side traces while retaining the hidden fair orientation bits. Its projection to a genuine trace is justified before any conditioning. The score proof will then condition only on the reported side data.

A related auxiliary experiment in the probability-vector model of #cite(label("RivkinValiantValiant2025"), form: "prose") Section 3, Lemmas 6–8 exposes a binomially translated middle segment and separately deleted sides. That model draws fresh Bernoulli bits from the probability vector before each trace. Here the input is a fixed deterministic word, and the construction below proves the projection needed for that input.

=== 6.1 The index tree and the outer window <the-index-tree-and-the-outer-window>

Use a deterministic tree common to both hypotheses. Its root $diameter$ is the sole level-$b$ vertex. A level-$j$ vertex has $T_j$ children at level $j - 1$, indexed by appending $h in { 1 \, dots.h \, T_j }$ to its own index. Thus an index records positions relative to successive sibling groups. Level-zero vertices are leaves. The entire experiment described below is redrawn independently for each observation.

At the root, place a central run of $T_b$ level-$\( b - 1 \)$ atoms between $J$ pairs of pure $U_(b - 1)^(+)$ runs. For each pair use an independent fair bit $E$, giving counts $h_(b - 1) + E$ on the left and $h_(b - 1) + 1 - E$ on the right. Use the paired flag mechanism from Section 3, with hidden probability $omega^2$, at the overlap proved in Lemma 15. Report one unseparated ordinary trace per side run, its flag, and its orientation bit when revealed. The left runs have fixed pair-number order before the center, and the right runs have the corresponding fixed order afterward.

The root motif at the word label $floor.l P_b \/ 2 floor.r + a$ has relative label $X + a$ in this central run, where

#[#set math.equation(numbering: n => "(6.1)")
 $ X = floor.l P_b \/ 2 floor.r - J h_(b - 1) - sum E = T_b \/ 2 + O \( J + 1 \) . $ <eq:outer-anchor>]

This is the coordinate of a fixed motif relative to the moving central window. Since $J = o \( T_b \)$ and $L = o \( T_b \)$, every $X + a$, $a in cal(I)$, lies in $\[ T_b \/ 3 \, 2 T_b \/ 3 \]$ for all orientations and all sufficiently large instances.

=== 6.2 One group of child windows <sec:group-partition>

Fix $1 lt.eq j < b$ and a level-$\( j + 1 \)$ vertex $G$. Its $T = T_(j + 1)$ children $G u$, $1 lt.eq u lt.eq T$, represent a planned consecutive sequence of $T$ level-$j$ units. We partition that sequence into successive parts, measured in level-$\( j - 1 \)$ atoms. Part $u$ contains a window of $T_j$ atoms for the children of $G u$, with nominal pre and post counts

$ A_j = floor.l \( P_j - T_j \) \/ 2 floor.r \, #h(2em) P_j - T_j - A_j . $

The parts may have different actual lengths, but their total length will remain $T P_j$.

Reserve $t_j$ local pairs in each part. For $1 lt.eq v lt.eq t_j$, a fair bit $E_(u \, v)^(upright("loc"))$ gives a pre chunk of $h_(j - 1) + E_(u \, v)^(upright("loc"))$ pure $U_(j - 1)^(+)$ atoms and a post chunk of $h_(j - 1) + 1 - E_(u \, v)^(upright("loc"))$ such atoms. Also reserve global pairs between distant parts. For every $1 lt.eq a lt.eq T \/ 4$ and $1 lt.eq v lt.eq t_j$, a fair bit $E_(a \, v)^(upright("glob"))$ gives a pre chunk of $h_(j - 1) + E_(a \, v)^(upright("glob"))$ atoms in part $a$ and a post chunk of $h_(j - 1) + 1 - E_(a \, v)^(upright("glob"))$ atoms in part $T + 1 - a$. All these bits are independent.

Treat each reserved chunk as having nominal count $h_(j - 1) + 1 \/ 2$. Complete every pre and post region to its nominal count by one pure-$U_(j - 1)^(+)$ filler of deterministic count, and order its chunks and filler by fixed relative IDs. The filler counts are nonnegative: each region reserves at most $2 t_j$ chunks, while the choice of $t_j$ reserves at most $P_j \/ 50$ atoms and $T_j = o \( P_j \)$. They are integers because each reserved collection has the even number $t_j$ of chunks; a region contains zero, one, or two such collections. Generate each reserved pair of chunks with the joint flag mechanism at the overlap of $U_(j - 1)^(+)$; generate each filler as an independent ordinary trace. Each chunk or filler reports one unseparated trace, with the flags and revealed bits for paired chunks. The surrogate uses these pure-run laws for every orientation, even when the corresponding locations would not be pure in the true word.

The exact prefix count explains the two displacement scales. Define

#[#set math.equation(numbering: n => "(6.2)")
 $ H_(G u) & = sum_(v = 1)^(t_j) \( E_(u \, v)^(upright("loc")) - 1 \/ 2 \) \,\
V_(G u) & = sum_(a = 1)^(T \/ 4) sum_(v = 1)^(t_j) #scale(x: 120%, y: 120%)[\(] upright(bold(1))_(a lt.eq u) - upright(bold(1))_(T + 1 - a < u) #scale(x: 120%, y: 120%)[\)] \( E_(a \, v)^(upright("glob")) - 1 \/ 2 \) \, #h(2em) Y_(G u) = V_(G u) + H_(G u) . $ <eq:prefix-offset>]

Then the number of lower atoms before the window of $G u$, counted from the start of the group, is

#[#set math.equation(numbering: n => "(6.3)")
 $ \( u - 1 \) P_j + A_j + Y_(G u) . $ <eq:window-start>]

In (6.2), a global pre chunk is included when its part $a$ is at or before $u$, whereas its post chunk is included only when part $T + 1 - a$ is strictly before $u$. Completed global pairs cancel. Every earlier local pair has also been completed; only the current local pre chunks contribute $H_(G u)$. This proves (6.3). Each included collection contributes the even number $t_j$ of half-integer deviations, so the displacements are integers. After the last post region all pairs have cancelled, proving the total count $T P_j$.

For the middle half of the group, every global pre chunk has appeared and no global post chunk has appeared. Thus

#[#set math.equation(numbering: n => "(6.4)")
 $ V_(G u) = V_G := sum_(a = 1)^(T \/ 4) sum_(v = 1)^(t_j) \( E_(a \, v)^(upright("glob")) - 1 \/ 2 \) quad upright("when ") T \/ 4 < u lt.eq 3 T \/ 4 . $ <eq:global-plateau>]

The local sums $H_(G u)$ are independent across $u$ and independent of the global bits. The global sums outside this interval are partial sums of the same group’s bits. Distinct groups and depths use independent mechanisms.

=== 6.3 The surrogate law and its projection <the-surrogate-law-and-its-projection>

We now apply this group partition recursively. The root center is the first group of $T_b$ planned level-$\( b - 1 \)$ units. A window at any later vertex is partitioned into the group for its children by the construction above.

Define type labels for every orientation, starting from $tau_diameter = + 1$ or $- 1$ under the two hypotheses. At the root put

$ tau_h = 1 - chi \( h - X \) + sigma_(h - X) tau_diameter . $

For every other level-$j$ vertex $I$, $j gt.eq 1$, put

#[#set math.equation(numbering: n => "(6.5)")
 $ tau_(I h) = 1 - chi \( h - w_j + Y_I \) + sigma_(h - w_j + Y_I) tau_I \, #h(2em) w_j = floor.l P_j \/ 2 floor.r - A_j = T_j \/ 2 . $ <eq:surrogate-types>]

The last equality uses the evenness of $T_j$. These rules place the motif labels that fit in each window and use type $+$ at its other labels. They define a surrogate even on a failed layout, when an intended motif label falls outside its window; all non-leaf pieces still use the pure laws already specified.

Conditional on all bits, sample the leaf outputs independently of one another and of the entire collection of non-leaf flags and emissions, using law $mu_(i - 1)$ for type $+ 1$ and $nu_(i - 1)$ for type $- 1$. The complete report consists of these separate leaf outputs, all side outputs, flags, and visible bits, with their relative tree and segment IDs. It contains no hidden type labels, absolute word labels, or hidden boundary positions. Let $D_0$ denote all of this report except the complete old oracle payload at each leaf; in particular, any metadata inside an old payload are excluded from $D_0$.

Let $tilde(mu)_i \, tilde(nu)_i$ be the two unconditioned surrogate laws. A common kernel $cal(K)_(upright("tree"))$ applies $cal(K)_(i - 1)$ independently to every leaf output and concatenates the resulting binary words and side traces in the chronological order specified by the IDs: pre pieces, the recursively ordered window contents, and post pieces in each part, with the outer side runs in their stated order.

Define the fit event, which depends on the orientation bits, by

#[#set math.equation(numbering: n => "(6.6)")
 $ cal(F) = { \| Y_I \| lt.eq T_j \/ 8 upright(" for every level-") j upright(" vertex ") I \, med 1 lt.eq j < b #scale(x: 120%, y: 120%)[}] . $ <eq:fit_event>]

#thm([Lemma 6.1.])[
  (Simulation of a genuine trace).  #emph[For the unconditioned surrogate laws and the common projection above, 
#[#set math.equation(numbering: n => "(6.7)")
 $ "TV" \( cal(K)_(upright("tree")) tilde(mu)_i \, upright("Tr") \( U_b^(+) \) \) & lt.eq o \( Delta \) + (product_(j = 1)^b T_j) E_(i - 1) \,\
"TV" \( cal(K)_(upright("tree")) tilde(nu)_i \, upright("Tr") \( U_b^(-) \) \) & lt.eq o \( Delta \) + (product_(j = 1)^b T_j) E_(i - 1) . $ <eq:projection_tree>]

 All error terms are uniform in $i$.]
] <lem:tree-simulation>

#proof[
  By (6.2), each $Y_I$ is a centered sum of at most $\( T_(j + 1) + 1 \) t_j$ independent fair bits with coefficients of magnitude at most one. Hoeffding’s inequality #cite(label("Hoeffding1963")) Theorem 2 and (5.4),(5.7) give
  $ bb(P) \( \| Y_I \| > T_j \/ 8 \) lt.eq 2 exp #h(-0.16667em) (- c frac(T_j^2, T_(j + 1) t_j)) lt.eq 2 exp \( - c' N^epsilon.alt \) $
  for absolute positive constants at all sufficiently large instances. Equation (5.5) bounds the number of vertices by $O_B \( N \)$. A union bound therefore gives
  #[#set math.equation(numbering: n => "(6.8)")
   $ bb(P) \( cal(F)^c \) lt.eq exp \( - N^(epsilon.alt \/ 2) \) = o \( Delta \) . $ <eq:fit-probability>]
  The last comparison follows uniformly from Lemma 3: $epsilon.alt log N gt.eq epsilon.alt log N_0$ dominates $log log n + log \( d_D + B + 1 \)$, so $N^(epsilon.alt \/ 2)$ dominates $log Delta^(- 1)$.
  We verify what a fitting orientation does to a group of true units. Suppose its incoming sequence is $T$ actual level-$j$ words with their prescribed types. In the lower-atom coordinates of that sequence, the possible motif labels of unit $u$ form
  $ cal(M)_u = \( u - 1 \) P_j + floor.l P_j \/ 2 floor.r + cal(I) \, $
  and its window occupies the integer interval
  $ cal(W)_u = \[ \( u - 1 \) P_j + A_j + Y_(G u) + 1 \, \( u - 1 \) P_j + A_j + Y_(G u) + T_j \] . $
  The serialized nonnegative pre/window/post parts make these windows disjoint and ordered. On $cal(F)$, every motif label has window coordinate $w_j + a - Y_(G u) in \[ 1 \, T_j \]$, since $w_j = T_j \/ 2$, $\| Y_(G u) \| lt.eq T_j \/ 8$, and $L = o \( T_j \)$. Hence $cal(M)_u subset.eq cal(W)_u$ for every $u$. Disjointness now implies that no window contains a different unit’s motif, and the complement of all windows contains no motif label at all. Thus all chunks and fillers are truly pure, even if a part crosses a nominal unit boundary, and the types inside each window are exactly (6.5).
  At the root, (6.1) puts every motif label in the center and gives its correct child type. Applying the preceding group argument successively down the tree proves agreement of every surrogate type with the true lower atom on $cal(F)$. Given such orientation bits, averaging the flags gives independent correct trace laws on all side pieces. The old kernels at the leaves add at most one error $E_(i - 1)$ per leaf. Couple the unconditioned experiments using these bits and flags; charge cost one on $cal(F)^c$. Equation (6.8) and the leaf count give (6.7). ◻
]

=== 6.4 The information retained after the report <sec:metadata>

The law of $D_0$ is common to the two surrogate hypotheses, because every non-leaf emission is generated from a pure run and all IDs are fixed. Conditional on its full value, every unrevealed orientation is still a fair bit. These hidden bits are independent across pairs, groups, and depths: the report of a hidden pair has the common product law, while a non-hidden pair reveals its bit, and the pair mechanisms were generated independently. Visible contributions are fixed by the report. Consequently $X$, each local sum, and each global sum have exactly the affine hidden-bit forms given above. Global offsets within a group retain their prescribed dependence.

Call a metadata value typical when all of the following hold:

- the root has at least $omega^2 J \/ 2$ hidden orientations;
- for every $1 lt.eq j < b$, every local collection at a level-$j$ vertex has at least $omega^2 t_j \/ 2$ hidden orientations, and every global collection in a group of $T_(j + 1)$ children has at least $omega^2 \( T_(j + 1) \/ 4 \) t_j \/ 2$;
- $bb(P) \( cal(F)^c divides D_0 \) lt.eq exp \( - N^(epsilon.alt \/ 4) \)$.

These conditions fail with probability $o \( Delta \)$. For the hidden counts, apply multiplicative binomial concentration to the independent flags and then a union bound. Every required expectation is at least $e^(- O_B \( \( D + 1 \) Lambda \)) N^epsilon.alt$, and Lemma 3 makes the resulting tail negligible relative to $Delta$. For the last condition, apply Markov’s inequality to (6.8).

The score analysis in the next section fixes one exact typical value of $D_0$ and averages over all its remaining hidden bits. It does not condition those bits on $cal(F)$.

== 7 Likelihood cancellation and the forced binary subtree <sec:coefficients>

Fix the block of Proposition 13. For every supported exact value $frak(d)$ of the report $D_0$ from Section 6.4, write $bb(E)_(frak(d))$ for expectation over the remaining hidden bits with this report fixed. This expectation includes failed layouts; it is not conditioned on $cal(F)$. The report space is countable, so its supported values carry its full law.

Let $cal(L)$ be the leaf set and use the conditional reference

$ Q = mu_(i - 1)^(⊗ cal(L)) . $

For $v in cal(L)$, let $Z_v$ be the old likelihood score at that coordinate. Under $Q$ these variables are independent and centered, with $parallel Z_v parallel_(r_i)^2 lt.eq N^(- a_0 d)$ by (5.1). Conditional on the bits, the leaf of type $- 1$ has density $1 + Z_v$ and the leaf of type $+ 1$ has density one. Thus the two conditional surrogate densities are

#[#set math.equation(numbering: n => "(7.1)")
 $ G_plus.minus = bb(E)_(frak(d)) product_(v in cal(L)) (1 + frac(1 - tau_v^plus.minus, 2) Z_v) . $ <eq:conditional-densities>]

For every supported $frak(d)$, these densities integrate to one because they are mixtures of product probability laws. The superscript on $tau$ records the root type.

#thm([Lemma 7.1.])[
  (Conditional score gain).  #emph[For every exact typical metadata value $frak(d)$, the densities in (7.1) satisfy 
$ parallel G_(+) - G_(-) parallel_(L^(r_i) \( Q \))^2 lt.eq N^(- d' - .01) . $

 The bound is uniform in $frak(d)$ and the block level $i$.]
] <lem:tree-score>

We now fix a typical $frak(d)$ for the proof of the lemma.

=== 7.1 High degrees from the input score <high-degrees-from-the-input-score>

For fixed bits, every level-one window has at most $L$ negative leaves, because its negative types can occur only on the support of its motif. There are $product_(j = 2)^b T_j$ such windows. This remains true on failed layouts, so the number of factors $1 + Z_v$ in either fixed-bit density is at most

$ L product_(j = 2)^b T_j . $

The margin between the old score and this number of possible positions is

#[#set math.equation(numbering: n => "(7.2)")
 $ lambda_d := a_0 d - sum_(j = 2)^b kappa_j > 8 g_B \( d + 1 \) \, #h(2em) g_B := 2^(- 4 B - 10) . $ <eq:score-gap>]

Here is the promised use of the two depth phases. Since $sum_(j = 2)^b kappa_j < 1 - 2^(1 - b)$ and $a_0 gt.eq 2^(- b) - epsilon.alt$, for $b = 2$ and $d gt.eq 2.20$,

$ lambda_d > d \/ 4 - 1 \/ 2 - epsilon.alt d . $

For $b = B$ after the preliminary phase, $d gt.eq 2^B + 2.20$ and

$ lambda_d > 2^(- B) \( d - 2^B + 2 \) - epsilon.alt d . $

In each case the positive part is a fixed positive fraction, depending only on $B$, of $d + 1$. The choices of $g_B$ and $epsilon.alt$ leave the bound in (7.2) uniformly.

At fixed bits, Lemma 6 bounds the squared $L^(r_i) \( Q \)$ norm of the homogeneous degree-$r$ part of either density by

$ \( C_1 r_i \)^(2 r) N^(- a_0 d r) binom(L product_(j = 2)^b T_j, r) lt.eq #scale(x: 120%, y: 120%)[\(] N^(- lambda_d + o \( epsilon.alt \)) #scale(x: 120%, y: 120%)[\)]^r . $

Convexity permits averaging over the bits at this bound. Geometric summation of the norms, using (7.2), gives

#[#set math.equation(numbering: n => "(7.3)")
 $ parallel G_plus.minus - 1 parallel_(r_i) lt.eq N^(- g_B) \, #h(2em) parallel upright("degree ") gt.eq r_(*) upright(" part of ") G_plus.minus parallel_(r_i)^2 lt.eq N^(- d' - 1) . $ <eq:tree_high>]

For the second inequality, $r_(*) g_B \( d + 1 \) > d' + 3$ leaves the required margin. Only the fixed degrees $1 lt.eq r < r_(*)$ remain.

=== 7.2 A fixed coefficient and its parity terms <a-fixed-coefficient-and-its-parity-terms>

Fix such a degree $r$ and a leaf subset $cal(S)$ of size $r$. Its coefficient in $G_(+) - G_(-)$ is

#[#set math.equation(numbering: n => "(7.4)")
 $ c \( cal(S) \) = bb(E)_(frak(d)) [product_(v in cal(S)) frac(1 - tau_v^(+), 2) - product_(v in cal(S)) frac(1 - tau_v^(-), 2)] . $ <eq:fixed-coefficient>]

Lemma 6 reduces the squared norm of this degree to

#[#set math.equation(numbering: n => "(7.5)")
 $ ∥sum_(\| cal(S) \| = r) c \( cal(S) \) product_(v in cal(S)) Z_v∥_(r_i)^2 lt.eq \( C_1 r_i \)^(2 r) N^(- a_0 d r) sum_(\| cal(S) \| = r) \| c \( cal(S) \) \|^2 . $ <eq:degree-reduction>]

To estimate the right side, expand the integrand for fixed bits and fixed relative leaf labels, and only then average each chosen term. Call a vertex occupied if it is an ancestor of a leaf in $cal(S)$, including that leaf itself.

For a vertex $I$ and one of its child labels $h$, write

$ xi_(I \, h) = cases(delim: "{", h - X \, & I = diameter \,, h - w_j + Y_I \, & I upright(" at level ") j < b \,) #h(2em) chi_(I h) = chi \( xi_(I \, h) \) \, quad sigma_(I h) = sigma_(xi_(I \, h)) . $

For an occupied vertex $I$, let $F_I \( t \)$ be the contribution of the selected leaves below it when its incoming type is $t in { - 1 \, 1 }$. At a level-one vertex with $m_I$ selected children, the type rule gives the already-cancelled expression

#[#set math.equation(numbering: n => "(7.6)")
 $ F_I \( t \) = 2^(- m_I) product_(h : thin I h in cal(S)) \( chi_(I h) - sigma_(I h) t \) . $ <eq:coefficient-base>]

In particular every selected leaf contributes a motif factor. At a higher occupied vertex, the selected-leaf product splits across child subtrees, giving the algebraic recursion

#[#set math.equation(numbering: n => "(7.7)")
 $ F_I \( t \) = product_(h : thin I h upright(" occupied")) F_(I h) \( 1 - chi_(I h) + sigma_(I h) t \) \, #h(2em) t in { - 1 \, 1 } . $ <eq:coefficient-recursion>]

The substituted type is again $+ 1$ or $- 1$. No probabilistic independence of the child functions is asserted here; this is the factorization of one product of leaf indicators at fixed bits.

Every function on ${ - 1 \, 1 }$ has an even and an odd part. To retain the individual motif choices, expand (7.6)–(7.7) into terms $M_I t^(p_I)$, reducing powers by $t^2 = 1$, where $p_I in { 0 \, 1 }$. The following rules describe each chosen term.

- At level one choose $chi_(I h)$ or $- sigma_(I h) t$ from every selected leaf factor. Every such leaf is called active, and $p_I$ is the parity of the number of signed factors.
- At a higher vertex choose one term $M_(I h) tau_(I h)^(p_(I h))$ from each occupied child. If $p_(I h) = 0$, its contribution is $M_(I h)$. If $p_(I h) = 1$, substitute the type rule and choose one of $1$, $- chi_(I h)$, or $sigma_(I h) t$ in $M_(I h) \( 1 - chi_(I h) + sigma_(I h) t \)$. The child is active at $I$ when the second or third summand is chosen. Set $p_I$ to the parity of the signed summands chosen at $I$.

Odd and even are roles of these chosen terms, not intrinsic properties of the vertex or of its full coefficient function. At the root, the difference $F_diameter \( + 1 \) - F_diameter \( - 1 \)$ keeps exactly the odd terms and gives each a factor two. Apart from bounded scalar factors, a chosen term in (7.4) is therefore the expectation of the product of its active $sigma$ and $chi$ factors.

For fixed $r$ and $b$, the number of ordered occupied-tree shapes and expansion choices is bounded solely in terms of $r \, b$. A shape specifies adjacency and sibling order, not the numerical child labels. We may fix a shape and its choices, bound the squared coefficient sum over the labels, and combine these finitely many bounds by Cauchy–Schwarz.

We first split that label sum into central and noncentral assignments. If an active child of a level-$j$ vertex has label outside $\[ T_j \/ 3 \, 2 T_j \/ 3 \]$, a nonzero factor requires $\| Y_I \| > T_j \/ 8$ for all large instances, since $w_j = T_j \/ 2$ and $L = o \( T_j \)$; at the root it is impossible by (6.1). Hence such a term has conditional multiplier at most $bb(P) \( cal(F)^c divides D_0 = frak(d) \) lt.eq exp \( - N^(epsilon.alt \/ 4) \)$ in absolute value. There are at most $O_B \( N^r \)$ label assignments by (5.5), so their contribution to the right side of (7.5) is at most $N^(- d' - 1)$ eventually. From now on all active child labels in the sum lie in their central intervals. This is a restriction of deterministic label assignments, not conditioning of the bit law. In particular, two forced children of a level-$\( j + 1 \)$ parent will lie in

$ \[ T_(j + 1) \/ 3 \, 2 T_(j + 1) \/ 3 \] subset \( T_(j + 1) \/ 4 \, 3 T_(j + 1) \/ 4 \] \, $

the interval where their offsets share the global sum in (6.4).

=== 7.3 Terms with a singleton odd role <terms-with-a-singleton-odd-role>

Suppose a chosen odd term at a vertex $I$ has exactly one active child. The active factor must be signed, since the number of signed factors is odd. All other local choices at that vertex contribute one or no factor.

We need the precise locality of its relative argument. After the relative IDs and expansion choices are fixed, the local sum $H_I$ occurs among the surrogate arguments $xi_(J \, h)$ only when $J = I$. Equation (6.2) shows that the local pre/post deviations cancel before a later sibling part. Lower relative arguments use the fresh mechanisms of their own groups. The physical absolute positions of the descendant subtree can move with $H_I$, but those positions are unreported and do not occur in its lower relative arguments. Likewise $X$ occurs only in root arguments. This statement does not require independence of child terms, which may share lower global bits.

Condition on every orientation bit except the hidden local bits at $I$; for the root, keep only its hidden outer bits unconditioned. Every other active factor is then fixed, while the singleton signed factor is convolved with a translated or reflected fair binomial. Its number of trials is at least $omega^2 t_j \/ 2$ for a level-$j$ vertex with $j < b$, and at least $omega^2 J \/ 2$ at the root. Equation (5.8) bounds the conditional multiplier by

$ exp \( O \( \( s_(*) + 1 \)^2 + \( s_(*) + 1 \) Lambda \) \) cases(delim: "{", t_j^(- \( s_(*) + 1 \) \/ 2) \, & 1 lt.eq j < b \,, J^(- \( s_(*) + 1 \) \/ 2) \, & j = b .) $

The estimate remains valid after averaging the other bits. Typicality is already a property of the fixed report, and no fit conditioning has been used.

The lower bounds for $J \, t_j$ give

$ J^(- \( s_(*) + 1 \)) \, med t_j^(- \( s_(*) + 1 \)) lt.eq e^(O_B \( \( s_(*) + 1 \) \( D + 1 \) Lambda \)) N^(- epsilon.alt \( s_(*) + 1 \)) . $

Since $epsilon.alt s_(*) gt.eq 100 \( d_D + r_(*) + B + 10 \)$, this absorbs the $O_B \( N^r \)$ label assignments and the squared moment factor $\( C_1 r_i \)^(2 r) N^(- a_0 d r)$. The resulting contribution to the squared degree-$r$ norm is at most $N^(- d' - 1)$ eventually.

=== 7.4 The forced subtree and extra labels <the-forced-subtree-and-extra-labels>

In a remaining odd root term, every odd nonleaf has at least two active children. At a higher vertex those children carry odd chosen terms; at level one they are selected leaves. Starting at the root, choose the first two active children in sibling order and repeat this choice at each selected odd child. This forces a complete binary subtree with $2^b$ leaves. The choice depends on the shape and expansion roles, not on the numerical labels. Thus $r gt.eq 2^b$; put $e = r - 2^b$.

For each forced nonleaf $I$, let $h_I < h'_I$ be its two forced child labels, calling the first the anchor. A nonzero term requires $0 < h'_I - h_I < L$, because both active arguments belong to the same translate of $cal(I)$. Define the nonnegative anchor kernel

$ f = product_(I upright(" forced nonleaf")) chi \( xi_(I \, h_I) \) . $

Every extra, nonforced selected leaf still contributes an absolute $chi$ constraint by (7.6). After discarding the other constraints, the absolute multiplier is at most a fixed scalar times

#[#set math.equation(numbering: n => "(7.8)")
 $ bb(E)_(frak(d)) [f product_(upright("extra leaves ") I h) chi \( xi_(I \, h) \)] . $ <eq:anchor-extra-bound>]

The expectation has no additional fit indicator. The central and close-label restrictions concern the fixed labels being summed.

Figure 2 illustrates the forced selection and the shared global offset produced by (6.2)–(6.4).

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0.35), [#text(size: 9pt)[\(a\) Chosen terms: singleton smoothing and forced selection]], anchor: "west", padding: 0.1176cm)
  content((1.581, -0.4692), (2.019, -0.0308), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[odd]]], frame: "circle", fill: rgb("#e8ecf1"), stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10))
  circle((1.8, -1.1), radius: 0.07937, fill: rgb("#194170"), stroke: none)
  line((1.8, -0.5671), (1.8, -1.014), stroke: (paint: rgb("#194170"), thickness: 0.8pt, miter-limit: 10))
  content((1.906, -0.675), [#text(size: 9pt)[$sigma$]], anchor: "west", padding: 0.1176cm)
  content((1.8, -1.5), [#text(size: 9pt)[one active child]])
  content((1.8, -3), [#box(width: 4.082cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f4f6f8"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[signed smoothing#linebreak() negligible term]]])])
  line((1.8, -1.75), (1.8, -2.506), stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#194170"))))
  content((1.906, -2.128), [#text(size: 7pt)[average hidden bits]], anchor: "west", padding: 0.1176cm)
  content((9.381, -0.4692), (9.819, -0.0308), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[odd]]], frame: "circle", fill: rgb("#e8ecf1"), stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10))
  content((10.07, -0.25), [#text(size: 9pt)[root]], anchor: "west", padding: 0.1176cm)
  content((7.381, -1.319), (7.819, -0.8808), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[odd]]], frame: "circle", fill: rgb("#e8ecf1"), stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10))
  content((11.38, -1.319), (11.82, -0.8808), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[odd]]], frame: "circle", fill: rgb("#e8ecf1"), stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10))
  content((6.381, -2.169), (6.819, -1.731), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[odd]]], frame: "circle", fill: rgb("#e8ecf1"), stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10))
  content((8.381, -2.169), (8.819, -1.731), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[odd]]], frame: "circle", fill: rgb("#e8ecf1"), stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10))
  content((10.38, -2.169), (10.82, -1.731), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[odd]]], frame: "circle", fill: rgb("#e8ecf1"), stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10))
  content((12.38, -2.169), (12.82, -1.731), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[odd]]], frame: "circle", fill: rgb("#e8ecf1"), stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10))
  line((9.308, -0.374), (7.892, -0.976), stroke: (paint: rgb("#194170"), thickness: 0.8pt, miter-limit: 10))
  line((9.892, -0.374), (11.31, -0.976), stroke: (paint: rgb("#194170"), thickness: 0.8pt, miter-limit: 10))
  line((7.358, -1.305), (6.842, -1.745), stroke: (paint: rgb("#194170"), thickness: 0.8pt, miter-limit: 10))
  line((7.842, -1.305), (8.358, -1.745), stroke: (paint: rgb("#194170"), thickness: 0.8pt, miter-limit: 10))
  line((11.36, -1.305), (10.84, -1.745), stroke: (paint: rgb("#194170"), thickness: 0.8pt, miter-limit: 10))
  line((11.84, -1.305), (12.36, -1.745), stroke: (paint: rgb("#194170"), thickness: 0.8pt, miter-limit: 10))
  circle((6.1, -2.8), radius: 0.07937, fill: rgb("#194170"), stroke: none)
  circle((7.1, -2.8), radius: 0.07937, fill: rgb("#194170"), stroke: none)
  line((6.439, -2.223), (6.144, -2.726), stroke: (paint: rgb("#194170"), thickness: 0.8pt, miter-limit: 10))
  line((6.761, -2.223), (7.056, -2.726), stroke: (paint: rgb("#194170"), thickness: 0.8pt, miter-limit: 10))
  circle((8.1, -2.8), radius: 0.07937, fill: rgb("#194170"), stroke: none)
  circle((9.1, -2.8), radius: 0.07937, fill: rgb("#194170"), stroke: none)
  line((8.439, -2.223), (8.144, -2.726), stroke: (paint: rgb("#194170"), thickness: 0.8pt, miter-limit: 10))
  line((8.761, -2.223), (9.056, -2.726), stroke: (paint: rgb("#194170"), thickness: 0.8pt, miter-limit: 10))
  circle((10.1, -2.8), radius: 0.07937, fill: rgb("#194170"), stroke: none)
  circle((11.1, -2.8), radius: 0.07937, fill: rgb("#194170"), stroke: none)
  line((10.44, -2.223), (10.14, -2.726), stroke: (paint: rgb("#194170"), thickness: 0.8pt, miter-limit: 10))
  line((10.76, -2.223), (11.06, -2.726), stroke: (paint: rgb("#194170"), thickness: 0.8pt, miter-limit: 10))
  circle((12.1, -2.8), radius: 0.07937, fill: rgb("#194170"), stroke: none)
  circle((13.1, -2.8), radius: 0.07937, fill: rgb("#194170"), stroke: none)
  line((12.44, -2.223), (12.14, -2.726), stroke: (paint: rgb("#194170"), thickness: 0.8pt, miter-limit: 10))
  line((12.76, -2.223), (13.06, -2.726), stroke: (paint: rgb("#194170"), thickness: 0.8pt, miter-limit: 10))
  line((5.98, -3), (13.22, -3), stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10))
  content((9.6, -3.176), [#text(fill: rgb("#000000"))[#text(size: 9pt)[$2^b$ selected leaves \($b=3$ shown\)]]], anchor: "north", padding: 0.1176cm)
  line((0, -4), (14.2, -4), stroke: (paint: rgb("#cccccc"), thickness: 0.4pt, miter-limit: 10))
  content((0, -4.35), [#text(size: 9pt)[\(b\) Two forced siblings share a global offset]], anchor: "west", padding: 0.1176cm)
  content((0, -5.1), [#text(size: 9pt)[Fixed $G$ at level $j+1$; distinct central siblings $I_1="Gu"_1$, $I_2="Gu"_2$]], anchor: "west", padding: 0.1176cm)
  rect((0.8, -6.4), (13.6, -6.85), fill: rgb("#f5f5f5"), stroke: none)
  rect((4, -6.4), (10.4, -6.85), fill: rgb("#dce2ea"), stroke: none)
  rect((0.8, -6.4), (13.6, -6.85), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((4, -6.3), (4, -6.95), stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((10.4, -6.3), (10.4, -6.95), stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((0.8, -6.9), [#text(size: 9pt)[$1$]], anchor: "north-west", padding: 0.1176cm)
  content((13.6, -6.9), [#text(size: 9pt)[$T_(j+1)$]], anchor: "north-east", padding: 0.1176cm)
  content((4, -6.15), [#text(size: 9pt)[$T_(j+1)"/"4$]], anchor: "south", padding: 0.1176cm)
  content((10.4, -6.15), [#text(size: 9pt)[$3T_(j+1)"/"4$]], anchor: "south", padding: 0.1176cm)
  circle((6.05, -6.625), radius: 0.07937, fill: rgb("#194170"), stroke: none)
  circle((8.35, -6.625), radius: 0.07937, fill: rgb("#194170"), stroke: none)
  content((6.05, -6.32), [#text(size: 9pt)[$I_1$]], anchor: "south", padding: 0.1176cm)
  content((8.35, -6.32), [#text(size: 9pt)[$I_2$]], anchor: "south", padding: 0.1176cm)
  line((4.02, -7), (10.38, -7), stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10))
  content((7.2, -7.176), [#text(fill: rgb("#000000"))[#text(size: 9pt)[middle-half plateau: $V_I=V_G$]]], anchor: "north", padding: 0.1176cm)
  content((7.2, -8.35), [#box(width: 2.1cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f4f6f8"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[shared $V_G$]]])])
  content((1.8, -8.35), [#box(width: 2.1cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[local $H_(I_1)$]]])])
  content((12.6, -8.35), [#box(width: 2.1cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[local $H_(I_2)$]]])])
  content((3.6, -9.65), [#box(width: 4.1cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f4f6f8"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$Y_(I_1)=V_G+H_(I_1)$]]])])
  content((10.8, -9.65), [#box(width: 4.1cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#194170"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f4f6f8"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$Y_(I_2)=V_G+H_(I_2)$]]])])
  line((7.2, -8.625), (4.4, -9.36), stroke: (paint: rgb("#194170"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#194170"))))
  line((7.2, -8.625), (10, -9.36), stroke: (paint: rgb("#194170"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#194170"))))
  line((1.8, -8.642), (2.8, -9.36), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#595959"))))
  line((12.6, -8.642), (11.6, -9.36), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#595959"))))
  content((7.2, -10.5), [#text(size: 9pt)[$H_(I_1),H_(I_2),V_G$ are independent given $D_0= frak(d)$.]])
})],
  caption: [Figure 2: The labels “odd” in panel (a) describe chosen-term roles. A singleton odd term, including at the root, is negligible after signed smoothing. For a remaining odd root term, selecting the first two active children recursively forces a binary subtree with $2^b$ selected leaves and hence $r gt.eq 2^b$ ($b = 3$ shown). The selection is fixed by the term roles and sibling order. Panel (b) illustrates (6.2)–(6.4) for fixed distinct central sibling IDs $u_1 < u_2$ in one group $G$. Conditional on the exact typical report $D_0 = frak(d)$, the local sums $H_(I_1) \, H_(I_2)$ and the global sum $V_G$ are independent; the total offsets $Y_(I_1) \, Y_(I_2)$ share $V_G$ and are estimated jointly. ],
) <fig:forced-subtree-jitter>

First sum the extra labels so that only the forced anchor expectation remains. Fix the forced labels and all nonleaf labels. For an assignment $upright(bold(h))$ of the $e$ extra leaf labels, let $a_(upright(bold(h)))$ be the nonnegative expectation in (7.8). At fixed bits each extra leaf has at most $L$ labels satisfying its constraint, even if several constraints share bits. Hence

$ sum_(upright(bold(h))) a_(upright(bold(h))) lt.eq L^e bb(E)_(frak(d)) f \, #h(2em) sum_(upright(bold(h))) a_(upright(bold(h)))^2 lt.eq (sum_(upright(bold(h))) a_(upright(bold(h))))^2 lt.eq L^(2 e) \( bb(E)_(frak(d)) f \)^2 . $

This avoids a free factor $T_1$ per extra leaf. At each positive nonroot level, there are at most $e$ occupied nonforced vertices: their descendant sets are disjoint at that level, and each contains an extra leaf and no forced leaf. Summing their child labels costs at most $\( product_(j = 2)^b T_j \)^e$. With the forced labels fixed, $f$ does not depend on which nonforced labels were selected, because the complete tree and every group mechanism were fixed before choosing $cal(S)$.

=== 7.5 The fixed-label anchor factorization <the-fixed-label-anchor-factorization>

It remains to sum $\( bb(E)_(frak(d)) f \)^2$ over the forced labels. Call a forced sibling pair valid when its two labels are central and their positive difference is less than $L$. Dropping any further order restrictions involving nonforced children can only increase this nonnegative sum. Define the outer anchor convolution

$ K_(upright("out"))^(frak(d)) \( z \) = bb(E)_(frak(d)) chi \( z - X \) . $

Its $ell^1$ mass is $L$, and its supremum is at most $O \( L omega^(- 1) J^(- 1 \/ 2) \)$ by the hidden root count. Including at most $2 L$ choices for the close root child, its squared sum costs

#[#set math.equation(numbering: n => "(7.9)")
 $ sum_(u_1 \, u_2 upright(" valid root")\
upright("forced labels")) K_(upright("out"))^(frak(d)) \( u_1 \)^2 lt.eq Gamma_(upright("out")) \, #h(2em) Gamma_(upright("out")) = O \( L^3 omega^(- 1) J^(- 1 \/ 2) \) . $ <eq:outer-anchor-cost>]

For a fixed forced labeling, let $cal(G)_j$ be its forced level-$\( j + 1 \)$ parents. Each $G in cal(G)_j$ has two forced level-$j$ children $G u_1 \( G \) \, G u_2 \( G \)$ with fixed distinct labels $u_1 \( G \) < u_2 \( G \)$ in the middle-half interval. For any such fixed $G$ and sibling labels $u_1 < u_2$, define their joint anchor kernel by

#[#set math.equation(numbering: n => "(7.10)")
 $ cal(H)_(j \, G \; u_1 \, u_2)^(frak(d)) \( z_1 \, z_2 \) = bb(E)_(frak(d)) [chi \( z_1 - w_j + Y_(G u_1) \) chi \( z_2 - w_j + Y_(G u_2) \)] . $ <eq:joint-anchor>]

The expectation here uses that group’s global bits and the two local collections under the fixed report. The actual $G \, u_1 \, u_2$ select those collections; only $z_1 \, z_2$ are variables in the norm below. The factor can vary with all of these fixed data.

Independence of the distinct group mechanisms conditional on $D_0 = frak(d)$ now gives, for this fixed forced labeling,

#[#set math.equation(numbering: n => "(7.11)")
 $ bb(E)_(frak(d)) f = K_(upright("out"))^(frak(d)) \( h_diameter \) product_(j = 1)^(b - 1) product_(G in cal(G)_j) cal(H)_(j \, G \; u_1 \( G \) \, u_2 \( G \))^(frak(d)) \( h_(G u_1 \( G \)) \, h_(G u_2 \( G \)) \) . $ <eq:anchor-factorization>]

The group sets and sibling IDs in this identity are determined by the fixed upper labels. In particular $cal(G)_(b - 1)$ contains the root; its interior global/local mechanism is independent of the outer mechanism defining $X$.

For fixed distinct plateau siblings, (6.4) gives $Y_(G u_1) = V_G + H_(G u_1)$ and $Y_(G u_2) = V_G + H_(G u_2)$. Conditional on $frak(d)$, the two local hidden sums are independent of each other and of the shared global hidden sum, though their visible shifts and hidden counts can differ. We have uniformly in the fixed data

#[#set math.equation(numbering: n => "(7.12)")
 $ parallel cal(H)_(j \, G \; u_1 \, u_2)^(frak(d)) parallel_(ell^1 \( bb(Z)^2 \)) & lt.eq L^2 \,\
parallel cal(H)_(j \, G \; u_1 \, u_2)^(frak(d)) parallel_(ell^oo \( bb(Z)^2 \)) & lt.eq C_10 L^2 omega^(- 2) \( T_(j + 1) t_j \)^(- 1 \/ 2) t_j^(- 1 \/ 2) . $ <eq:joint-anchor-norms>]

Here $C_10$ is absolute. The first bound follows by summing the two indicators before averaging. For the supremum, first fix all global bits and bound the local average at $G u_2$ by $O \( L omega^(- 1) t_j^(- 1 \/ 2) \)$. This bound is uniform in the global offset, so discard that factor’s constraint. Average the other factor over its local bits and the global bits. The latter contain at least a constant times $omega^2 T_(j + 1) t_j$ hidden fair trials, giving $O \( L omega^(- 1) \( T_(j + 1) t_j \)^(- 1 \/ 2) \)$. Multiplication proves the displayed joint bound without treating the two offsets as independent.

Multiplying the $ell^1$ and supremum bounds controls the squared $ell^2$ sum. Allowing a close child for each anchor costs at most $\( 2 L \)^2$. Thus for fixed valid $G \, u_1 \, u_2$,

#[#set math.equation(numbering: n => "(7.13)")
 $ sum_(z_1 \, z'_1 \, z_2 \, z'_2 in bb(Z)\
0 < z'_1 - z_1 < L \, med 0 < z'_2 - z_2 < L) cal(H)_(j \, G \; u_1 \, u_2)^(frak(d)) \( z_1 \, z_2 \)^2 & lt.eq Gamma_j \,\
Gamma_j & = C_11 L^6 omega^(- 2) T_(j + 1)^(- 1 \/ 2) t_j^(- 1) \, $ <eq:group-anchor-cost>]

with an absolute $C_11$ large enough for every group.

We make the order of the nested sums explicit. For two fixed valid level-$j$ siblings $G u_1 \, G u_2$, let $cal(R)_j \( G \; u_1 \, u_2 \)$ be the sum of the squares of the products of all their interior $cal(H)$ factors, including the factor of $G$, over all valid forced descendant labelings. Set $cal(R)_0 = 1$. Splitting the descendant labels at their first two pairs gives the exact recurrence

#[#set math.equation(numbering: n => "(7.14)")
 $ cal(R)_j \( G \; u_1 \, u_2 \) & = sum_(\( z_1 \, z'_1 \) \, \( z_2 \, z'_2 \)\
upright("valid at level ") j) cal(H)_(j \, G \; u_1 \, u_2)^(frak(d)) \( z_1 \, z_2 \)^2 product_(v = 1)^2 cal(R)_(j - 1) \( G u_v \; z_v \, z'_v \)\
 & lt.eq Gamma_j (sup_(G' \, v_1 \, v_2 upright(" valid")) cal(R)_(j - 1) \( G' \; v_1 \, v_2 \))^2 . $ <eq:anchor-sum-recursion>]

For the inequality, first use the uniform descendant bound on the valid distinct child pairs. Only afterward enlarge the remaining close-label sums to at most $2 L$ choices and apply (7.13). No group estimate is invoked at coincident sibling IDs. Iterating this inequality from the leaves upward, and finally using (7.9), gives

#[#set math.equation(numbering: n => "(7.15)")
 $ sum_(upright("valid forced labels")) \( bb(E)_(frak(d)) f \)^2 lt.eq Gamma_(upright("out")) product_(j = 1)^(b - 1) Gamma_j^(2^(b - j - 1)) . $ <eq:forced-anchor-sum>]

This procedure applies a uniform bound to each actual group after its upper IDs are fixed; it does not replace the varying kernels by one stationary kernel.

=== 7.6 The exponent gain and closure <the-exponent-gain-and-closure>

Combine the extra-label reduction, (7.15), and the squared moment factor $\( C_1 r_i \)^(2 r) N^(- a_0 d r)$. The fixed shape and expansion counts, the powers of $L$ and $omega^(- 1)$, and the positive factor $\( C_1 r_i \)^(2 r)$ contribute $N^(o \( epsilon.alt \))$ by Lemma 3 and (5.2). The squared degree contribution of a branching term is therefore at most

$ N^(o \( epsilon.alt \)) J^(- 1 \/ 2) product_(j = 1)^(b - 1) #scale(x: 120%, y: 120%)[\[] T_(j + 1)^(- 1 \/ 2) t_j^(- 1) #scale(x: 120%, y: 120%)[\]]^(2^(b - j - 1)) N^(- 2^b a_0 d) N^(- lambda_d e) . $

The last factor pays for every extra leaf and is at most one by (7.2). Using the lower bounds for $J \, t_j$, the decay exponent of the remaining factors is at least

$ & epsilon.alt \/ 2 + sum_(j = 1)^(b - 1) 2^(b - j - 1) \( kappa_(j + 1) \/ 2 + epsilon.alt \) + 2^b a_0 d - o \( epsilon.alt \)\
 & #h(2em) gt.eq d + \( b - 1 \) \/ 4 - #scale(x: 120%, y: 120%)[\[] \( 2^b - 1 \) d + 3 b thin 2^(b - 1) #scale(x: 120%, y: 120%)[\]] epsilon.alt - o \( epsilon.alt \) > d' + .03 . $

For this calculation, (5.3) gives $kappa_(j + 1) = 2^(j - b) - \( 6 dot.op 2^j - 2 - 2^(j - b) \) epsilon.alt$. Its leading contribution at depth $j$ is $2^(b - j - 1) 2^(j - b) \/ 2 = 1 \/ 4$, which is the gain from the shared location of each forced sibling group. The bound $d lt.eq 2.20 + \( B \/ 4 \) D$ and the chosen $epsilon.alt$ absorb the displayed corrections and leave the strict margin over $d' = d + \( b - 1 \) \/ 4 - .05$.

For each $r < r_(*)$, combine the fixed-shape estimates by Cauchy–Schwarz in (7.5). The noncentral and singleton terms are at most $N^(- d' - 1)$ in squared norm, and the branching terms have the margin just proved. Summing the finitely many degree norms and the tail in (7.3) yields

$ parallel G_(+) - G_(-) parallel_(r_i)^2 lt.eq N^(- d' - .01) \, $

which proves Lemma 17.

Apply Lemma 8 to the preliminary laws $tilde(mu)_i \, tilde(nu)_i$, their common report $D_0$, and the conditional densities (7.1). The typical report has probability $1 - o \( Delta \)$, (7.3) supplies $rho = g_B$, and Lemma 17 supplies the density difference. Conditioning on the common event consisting of typical metadata and $G_(+) gt.eq 1 \/ 2$ gives laws $mu_i \, nu_i$ with the required domination and score. Each preliminary law changes by $o \( Delta \)$. The hidden-bit law was used only before this conditioning.

Together with (6.7), the new conditioning and failed-layout loss is at most $Delta$ for all large instances. The inherited loss is at most $\( product_j T_j \) E_(i - 1) lt.eq \( product_j P_j \) E_(i - 1) = \( ell_i \/ ell \) E_(i - 1)$. Thus one may take

$ E_i lt.eq Delta + \( ell_i \/ ell \) E_(i - 1) \, #h(2em) E_i / ell_i lt.eq Delta / ell_i + E_(i - 1) / ell_(i - 1) lt.eq \( i + 1 \) Delta . $

The length and overlap conditions were proved in Section 5, so this completes Proposition 13. Starting from Proposition 9 and iterating the block proves Proposition 5.

== 8 Genuine traces, exact lengths, and testing <sec:transfer>

Proposition 5 now supplies the final pair and its auxiliary laws. We first retain a one-trace bound before using product observations. This proves the minimum-total-variation theorem independently of the sample-complexity deduction.

#thm([Lemma 8.1.])[
  (Restoration and padding).  #emph[For the parameters in Section 2, there are distinct words $x \, y in { 0 \, 1 }^n$ such that, for every positive integer $m$, 
#[#set math.equation(numbering: n => "(8.1)")
 $ "TV" #scale(x: 120%, y: 120%)[\(] cal(D)_q \( x \)^(⊗ m) \, cal(D)_q \( y \)^(⊗ m) #scale(x: 120%, y: 120%)[\)] lt.eq sqrt(m n^(- d_D)) + 2 m n \( D + 1 \) Delta . $ <eq:restored-product>]

 In particular, 
#[#set math.equation(numbering: n => "(8.2)")
 $ "TV" #scale(x: 120%, y: 120%)[\(] cal(D)_q \( x \) \, cal(D)_q \( y \) #scale(x: 120%, y: 120%)[\)] lt.eq n^(- d_D \/ 2) + 2 n \( D + 1 \) Delta . $ <eq:restored-single>]

]
] <lem:restoration>

#proof[
  Append the same arbitrary binary tail to $x_D \, y_D$ to reach length $n$. They remain distinct. Applying the final common oracle kernel, then generating an independent trace of the known tail and concatenating it, approximates each padded $delta$-trace law within $E_D lt.eq n \( D + 1 \) Delta$ in total variation. Common padding by this kernel is the elementary monotonicity principle also used by #cite(label("MPV2014"), form: "prose") proof of Lemma 10.
  The final moment estimate, monotonicity of norms on a probability space, and $r_D gt.eq 2$ give
  $ H^2 \( mu_D \, nu_D \) lt.eq parallel d nu_D \/ d mu_D - 1 parallel_(L^2 \( mu_D \))^2 lt.eq n^(- d_D) . $
  Tensorization and $"TV" lt.eq H$ bound the oracle product distance by $sqrt(m n^(- d_D))$. Replacing each of the $m$ projected factors by its genuine law costs at most $m E_D$ for each hypothesis, by tensor telescoping. This proves (8.1) for $delta$. Applying the additional deletion kernel independently to each sample proves the same bound for the requested $q$. Taking $m = 1$ gives (8.2). ◻
]

#proof[
  Fix any $q in \( 0 \, 1 \)$. Choose $B = 2$, $zeta = 1 \/ 2$, and auxiliary coefficients $c = 1 \/ \( 80 log 2 \) < c_(+) = 1 \/ \( 40 log 2 \)$ once, independently of $A$. The setup inequality holds because its left side is $1 \/ \( 20 log 2 \)$. The construction remains valid with these fixed parameters; its proof requires only their positivity and the stated eventual inequalities. In this case $delta > 0$ is fixed, $D arrow.r oo$, and $d_D = 2.20 + 0.20 D arrow.r oo$. For every fixed $A > 0$, multiplying (8.2) by $n^A$ gives
  $ n^(A - d_D \/ 2) + 2 \( D + 1 \) n^(A + 1 - 100 \( d_D + B + 1 \)) arrow.r 0 . $
  The construction is available for every sufficiently large integer $n$, not only a subsequence; its pair has length at most $n$ and common padding reaches $n$ exactly. This proves (1.2). The sample-complexity conclusion follows from Theorem 1, whose proof below does not use Theorem 2. Indeed, $c log \( q^3 log n \) arrow.r oo$ for any fixed admissible $c > 0$. ◻
]

=== 8.1 Two-point testing with a strict exponent margin <two-point-testing-with-a-strict-exponent-margin>

For two equally likely hypotheses with observation laws $P \, Q$, every randomized decision rule has average success at most $\( 1 + "TV" \( P \, Q \) \) \/ 2$. If $phi$ is the conditional probability of choosing the first hypothesis, its average success is

$ 1 / 2 #scale(x: 120%, y: 120%)[\(] 1 + bb(E)_P phi - bb(E)_Q phi #scale(x: 120%, y: 120%)[\)] lt.eq 1 / 2 \( 1 + "TV" \( P \, Q \) \) \, #h(2em) 0 lt.eq phi lt.eq 1 . $

This is the standard two-point comparison; trace-reconstruction versions appear in #cite(label("HoldenLyons2020"), form: "prose") Appendix A.2.

Fix $0 < c < c_(+) < 1 \/ \( 4 log 2 \)$ and choose $B \, zeta$ so that

$ alpha := frac(\( 1 - zeta \) \( \( B - 1 \) \/ 4 - .05 \), B log 2) > c_(+) . $

The $j_0$ preliminary blocks have fixed number depending only on $B$, and therefore

#[#set math.equation(numbering: n => "(8.3)")
 $ d_D = alpha log H_(upright("del")) + O_B \( 1 \) . $ <eq:final-exponent>]

For an absolute constant $a > 0$ sufficiently small, (8.1) with $m lt.eq a n^(d_D)$ is strictly less than $1 \/ 3$ eventually: its first term is at most $sqrt(a)$, and its second is at most

$ 2 a \( D + 1 \) n^(d_D + 1 - 100 \( d_D + B + 1 \)) = o \( 1 \) . $

Thus the maximal average success for the pair is at most $2 \/ 3$ (in fact strictly less for all sufficiently large instances). Recall from the channel reduction in Section 1 that $log H_(upright("del")) = log \( q^3 log n \) + O \( 1 \)$ uniformly in $q$. The strict inequality $alpha > c_(+)$ and (8.3) therefore imply

#[#set math.equation(numbering: n => "(8.4)")
 $ a n^(d_D) gt.eq n^(c_(+) log \( q^3 log n \)) $ <eq:intermediate-threshold>]

eventually. Exact worst-case reconstruction with success $2 \/ 3$ would distinguish this pair with that success, so this proves the usual $2 \/ 3$ lower bound, with the additional margin needed next.

=== 8.2 Every fixed positive reconstruction success probability <every-fixed-positive-reconstruction-success-probability>

#proof[
  Fix $s in \( 0 \, 1 \]$ and $c$ as in the theorem, and retain $c_(+) > c$ above. Choose a fixed positive integer $g$ such that $\( 2 \/ 3 \)^g < s$. Put $N = floor.l n \/ g floor.r$ and construct the hard pair at length $N$ using the same requested deletion rate $q$ as the original instance. Its working rate is still $delta = min \( q \, 1 \/ 2 \)$. Since
  $ q^3 log N tilde.op q^3 log n arrow.r oo \, #h(2em) log N = log n + O_g \( 1 \) \, $
  the preceding construction and testing bounds apply to each gadget.
  The exponent margin is preserved after dividing the length by $g$. More explicitly,
  $ frac(\( log N \) log \( q^3 log N \), \( log n \) log \( q^3 log n \)) arrow.r 1 \, $
  so $c_(+) > c$ gives
  #[#set math.equation(numbering: n => "(8.5)")
   $ N^(c_(+) log \( q^3 log N \)) gt.eq n^(c log \( q^3 log n \)) $ <eq:gadget-margin>]
  eventually. This is why the strict intermediate exponent was chosen before fixing the number of gadgets.
  Take $g$ independent fair choices between the two length-$N$ words, concatenate the chosen words, and append a common known tail of length $n - g N$. This gives $2^g$ distinct length-$n$ hypotheses. Give the estimator the stronger observation in which every trace is separated at the gadget boundaries, together with an independent trace of the tail. Concatenation simulates the usual observation exactly.
  The amplification of reconstruction difficulty using independent hard blocks also appears in #cite(label("MPV2014"), form: "prose") Section 3.3 and #cite(label("HoldenLyons2020"), form: "prose") Section 4. For the fixed product prior above, the following posterior calculation justifies the multiplication of optimal success probabilities.
  Under the product prior, the separated data from different gadgets are independent. Their posterior distributions factor as well: for a hypothesis vector $theta = \( theta_1 \, dots.h \, theta_g \)$ and separated data $z = \( z_1 \, dots.h \, z_g \)$,
  $ bb(P) \( theta divides z \) = product_(j = 1)^g bb(P) \( theta_j divides z_j \) . $
  Hence the largest conditional probability of a correct joint guess is the product of the largest single-gadget posterior probabilities. Averaging, independence of the $z_j$ shows that the optimal joint success is the product of the optimal single-gadget average successes. The tail has the same law under every hypothesis and changes none of these posteriors.
  For any positive integer sample budget $m lt.eq n^(c log \( q^3 log n \))$, Equations (8.4) and (8.5) bound every single-gadget success by $2 \/ 3$. The joint average success is therefore at most $\( 2 \/ 3 \)^g < s$. When $m = 0$, the posterior remains the uniform prior, so the optimal joint success is $2^(- g) lt.eq \( 2 \/ 3 \)^g < s$. A reconstruction procedure with worst-case success at least $s$ would have average success at least $s$ under this finite prior, a contradiction even in the stronger experiment. No nonnegative integer budget at most the claimed threshold suffices, which implies (1.1). ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
