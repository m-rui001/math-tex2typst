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

#align(center)[#text(size: 16pt, weight: "bold")[Weighted dilation graphs, smooth shifted primes and totient fibers]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Euler’s totient function can take the same value at many different integers. Write

$ g \( n \) = \# { m gt.eq 1 : phi \( m \) = n } $

for the size of its fiber at $n$. We prove the following result.

#thm([Theorem 1.1.])[
  #emph[For every real $epsilon > 0$, there are infinitely many positive integers $n$ such that
$ g \( n \) > n^(1 - epsilon) . $

]
] <thm:totient>

1 resolves positively Erdős’s conjecture on the largest fibers of Euler’s totient function.
  Pomerance #cite(label("Pomerance1980")) p. 84 formulates the conjecture as $C = 1$,
  where $C$ is the supremum of the exponents $c$ for which $g \( n \) > n^c$ infinitely often,
  and attributes it to Erdős #cite(label("Erdos1956")). An elementary upper bound is $g \( n \) lt.double_eta
  n^(1 + eta)$ for every $eta > 0$; we recall it in 8. Thus the power exponent of $n$ in the theorem is optimal.

The arithmetic input is a result about the prime factors of the predecessor of a prime.
  For $m > 1$, let $P^(+) \( m \)$ be its largest prime factor.
  Erdős’s work on totient multiplicities and smooth shifted primes dates to #cite(label("Erdos1935")) Section 3.
  The underlying construction takes products of many primes whose predecessors have few available prime factors:
  many distinct products then have the same totient. The expectation that $p -
  1$ can have all its prime factors smaller than every fixed power of $p$ was recorded in
  #cite(label("Erdos1956")); see also #cite(label("Lichtman2022")) Introduction. We prove a quantitative form.

#thm([Theorem 1.2.])[
  #emph[For every fixed $0 < delta < 1 \/ 4$, as $x arrow.r oo$,
#[#set math.equation(numbering: n => "(1.1)")
 $ \# { p : med p upright(" prime") \, med 2 x < p lt.eq 5 x \, med P^(+) \( p - 1 \) lt.eq x^delta } gt.eq
   x^(1 - o \( 1 \)) . $ <eq:main-smooth>]

 The quantity $o \( 1 \)$ may depend on $delta$.]
] <thm:smooth>

In particular, for every $epsilon > 0$ there are infinitely many primes $p$ with $P^(+) \( p - 1 \) lt.eq
  p^epsilon$. This resolves the smooth-predecessor conjecture positively as well.
  The count in (1.1) also holds for every fixed $delta > 0$, by using a smaller positive exponent when necessary.
  No uniformity as $delta arrow.r 0$ is asserted in 2 or needed for 1.

There is a substantial literature on fixed smoothness exponents.
  Baker and Harman #cite(label("BakerHarman1998")) Section 1,
  Theorem 1 and Corollary 1 obtained exponent $0.2961$ for shifted primes,
  with the corresponding totient multiplicity exponent $0.7039$.
  This improved Friedlander’s threshold $1 \/ \( 2 sqrt(e) \) + epsilon$;
  their introduction also describes preceding work of Pomerance, Balog, and Fouvry–Grupp.
  Lichtman #cite(label("Lichtman2022")) Theorem 1.1 and Corollary 1.3 proved a lower bound $x \/ \( log x \)^C$
  for $x < p lt.eq 2 x$ and $P^(+) \( p - 1 \) lt.eq x^beta$ whenever

$ beta > frac(15, 32 sqrt(e)) = 0.284311 dots.h \, $

and obtained multiplicity exponent $0.7156$. These results concern fixed positive exponents.
  The expected Dickman law predicts a positive proportion of primes for every such exponent;
  see Granville #cite(label("Granville2008")) Section 5.3. Bharadwaj and Rodgers
  #cite(label("BharadwajRodgers2026")) Theorem 7, Proposition 2,
  and Conjecture 5 prove the full Poisson–Dirichlet law for sequences satisfying their regularity and
  congruence-uniformity conditions together with level-one distribution.
  For shifted primes this gives the prediction under the Elliott–Halberstam conjecture;
  their Proposition 2 establishes distribution level one half and the other conditions unconditionally.
  Our unconditional bound $x^(1 - o \( 1 \))$ gives the full power exponent of the count for every fixed positive
  smoothness exponent. A positive limiting proportion is a stronger conclusion.
  The final passage from plentiful smooth shifted primes to large totient fibers belongs to the method of Erdős
  and Pomerance; Pomerance states the relevant transfer explicitly in #cite(label("Pomerance1980")) Theorem B.
  We give the needed product-and-pigeonhole proof in full.

Smooth predecessors also enter the construction of Carmichael numbers by Alford,
  Granville and Pomerance #cite(label("AlfordGranvillePomerance1994")),
  where their supply is combined with a separate distribution theorem for primes in arithmetic progressions.
  This is one reason that estimates for shifted smoothness have applications beyond the factorization problem
  itself. The contribution here includes the general graph and kernel theorems that produce the arithmetic lower
  bound, as well as the optimal exponent for totient fibers.

These graph and ideal-kernel estimates also serve as inputs to the companion paper
  #cite(label("PrimePredecessors")) Theorem 1.1, where a separate determinant-graph estimate and prime-extraction
  argument yield the full Poisson–Dirichlet law for prime predecessors.

=== 1.1 The analytic mechanism <the-analytic-mechanism>

The main obstacle is to detect primality in a sequence whose predecessors have a strongly constrained
  factorization. Congruence counts provide an initial sieve,
  and a further bilinear cancellation estimate permits the composite contribution to be removed.
  This division of work is familiar from prime-detecting sieves;
  compare Friedlander and Iwaniec #cite(label("FriedlanderIwaniec1998")) Section 1.
  Our coefficient and range hypotheses are stated and verified below for the particular weight used here.

We count primes of the form $2 u + 1$, where $u$ has a prescribed factorization over many logarithmic scales.
  Some factors lie in two separated ranges of subpower-sized primes, divided into small and big groups.
  Their weights mark distinct prime divisors. The functions attached to an integer depend only on the part of $u$
  outside these groups; the marked weights supply the divisibility labels for the dilation graph.
  Other factors occupy a geometric sequence of size bands, which permits a divisor of $u$ to be chosen close to a
  specified size. One band contains a long factor ranging over rough integers,
  meaning integers with no prime factor below a prescribed cutoff.

The main new analytic ingredient is a transference theorem for weighted dilation graphs.
  A physical state consists of an integer and ordered lists of distinct group-prime divisors.
  An edge has shift $k D$ for an integer $k eq.not 0$, where $D$ is a product of primes shared by its endpoint
  lists, together with independent free prime factors. The corresponding ideal operator acts on the big-group
  lists: its labels are independent, with probabilities proportional to $1 \/ p$, and repetitions are allowed.
  The list length is sufficiently large but fixed as $x$ tends to infinity.
  A small ideal operator norm yields an averaged high moment of the physical graph,
  and hence cancellation in pairings whose first endpoint is independent of its mark list.

The transference proof averages the integer root by the Chinese remainder theorem.
  Repeated divisibility queries then pay a reciprocal prime factor only once;
  a memory retains their congruences between active uses. Averaging the omitted small marks makes transfers
  between memory and the active lists rare. A rank expansion restores distinct prime births while preserving
  cancellation on most edges: many independent birth equalities supply reciprocal-prime savings,
  whereas a small equality rank affects only a small fraction of the edges.
  The theorem applies to arbitrary signed kernels satisfying its explicit complexity and norm hypotheses.

Related divisibility-graph methods have a substantial history.
  Matomäki, Radziwiłł and Tao #cite(label("MatomakiRadziwillTao2016")) Theorem 5.1 studied connectivity of a graph
  with prime-divisibility edges. Tao’s entropy-decrement argument #cite(label("Tao2016")) replaces such
  divisibility conditions by their mean at a suitable scale.
  Helfgott and Radziwiłł #cite(label("HelfgottRadziwill2021")) Section 1.5 study centered adjacency operators
  through signed closed-walk moments, with repeated primes creating dependent congruences.
  Pilatte #cite(label("Pilatte2026")) Theorem 2.4 and Section 5 develops this approach for shifts that are
  products of primes. These works explain the roles of centering, long moments, and repeated-label bookkeeping.
  Our graph also carries ordered active lists, and its comparison with an independent-label operator requires the
  explicit lifespan and factorial-memory construction proved in 3.

The independent-label norm is made small by a comparison construction.
  Logarithmic localization and character kernels allow shared prime products to be replaced by independent
  products. The big groups are split into two blocks, with a bounded number of selected coordinates in each group.
  After averaging the list coordinates unused by the multiplier,
  a coordinate decomposition isolates components that have mean zero in all selected coordinates of one block.
  Permutation symmetry makes these components small, and signed comparison terms cancel the other components up to
  a controlled error. For each prescribed fixed accuracy, the construction gives kernels uniform in the additive
  frequency, with complexity fixed before the length of the marked lists is chosen.

Applying transference to the multiplicatively invariant endpoints reduces a fixed shifted correlation to averages
  over larger shifts. Products of free primes control the minor arcs.
  On the major arcs, a marked small prime and the compulsory long rough-integer factor control the local Fourier
  energy. A low-complexity character and Mellin discrepancy condition supplies the remaining cancellation.
  The argument permits arbitrary bounded residual coefficients.

These shifted correlations yield a Type II estimate for $m n = 2 u + 1$.
  A probabilistic split of the geometric prime bands chooses a divisor $e$ of $u$ close to the scale of $m$.
  After Cauchy–Schwarz, off-diagonal factorizations become shifted endpoints by an exact determinant identity.
  The Type II estimate then permits primality and roughness tests on cofactors to be replaced by elementary rough
  proxies. Congruence estimates and a weighted sieve remove the composite values of $2 u + 1$;
  a separate upper bound treats the small balanced range.

=== 1.2 Organization and dependencies <organization-and-dependencies>

2 fixes the conventions and proves the elementary sieve used later.
  The central transference estimate is proved in 3, and the independent-label kernels are constructed in 4.
  Together they lead to the shifted-correlation theorem in 5. The Type II reduction occupies 6.
  The prime extraction and all its parameter choices are completed in 7. 8 finishes the proof of 1.
  The main implications are summarized in 1.

The sieve geometry is fixed first, the required analytic accuracies next,
  and the discrepancy precision of the cofactor proxies last.
  The relevant theorems state this choice order, and the prime extraction verifies it.
  In particular, the needed discrepancy is established independently of the estimate that uses it.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 3.432cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Transference#linebreak()3.5]]])])
  content((3.8, 0), [#box(width: 3.432cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Small ideal norms#linebreak()4.1]]])])
  content((1.9, -1.65), [#box(width: 3.432cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Shift cancellation#linebreak()5.1]]])])
  content((6, -1.65), [#box(width: 3.432cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Type II estimate#linebreak()6.1]]])])
  content((7.6, 0), [#box(width: 3.432cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Candidate, Type I,#linebreak()and sieve bounds#linebreak()7]]])])
  content((11.4, -1.1), [#box(width: 3.432cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Smooth shifted primes#linebreak()1.2]]])])
  content((11.4, -2.6), [#box(width: 3.432cm, inset: 0.1411cm, radius: 2pt, stroke: (paint: rgb("#000073"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f7f7ff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Large totient fibers#linebreak()1.1]]])])
  line((0.4491, -0.39), (1.451, -1.26), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#00008c"))))
  line((3.351, -0.39), (2.349, -1.26), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#00008c"))))
  line((3.616, -1.65), (4.284, -1.65), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#00008c"))))
  line((7.716, -1.475), (9.684, -1.275), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#00008c"))))
  line((8.947, -0.39), (10.05, -0.71), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#00008c"))))
  line((11.4, -1.49), (11.4, -2.21), stroke: (paint: rgb("#00008c"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#00008c"))))
})],
  caption: [Figure 1: Main result dependencies. The auxiliary branch includes candidate mass, Type I distribution, proxy discrepancy, the elementary sieve, and the separate balanced-range bound. Arrows record the implications used in the proof; the order of choosing constants is described in the text. ],
) <fig:proof-dependencies>

== 2 Notation and preliminary estimates <sec:preliminaries>

All factor variables are positive integers unless another domain is specified.
  We write $P^(+) \( n \)$ and $P^(-) \( n \)$ for the largest and least prime factors of $n > 1$,
  with $P^(+) \( 1 \) = 1$ and $P^(-) \( 1 \) = oo$. An integer is $y$-smooth if $P^(+) \( n \) lt.eq y$,
  and is rough above $y$ if $P^(-) \( n \) > y$. We use $phi$ for Euler’s function, $tau$ for the divisor function, and

$ e \( t \) = exp \( 2 pi i t \) \, wide \( z \)_j = z \( z - 1 \) dots.h.c \( z - j + 1 \) \, wide \( z \)_0 = 1 . $

We write $mu \( n \) = 0$ if $n$ is divisible by a prime square,
  and $mu \( n \) = \( - 1 \)^r$ if $n$ is a product of $r$ distinct primes.
  The symbol $omega$ will count distinct prime divisors in the specified prime groups;
  an unrestricted distinct-prime count will be identified when it occurs.
  In particular, multiplicities in an integer do not increase its group count.

Throughout the analytic argument,

#[#set math.equation(numbering: n => "(2.1)")
 $ L = log x \, wide T = log L \, wide W = exp \( sqrt(L) \) \, $ <eq:scales>]

and $x$ tends to infinity. A dyad is an interval $\[ Y \, 2 Y \)$, or a fixed constant enlargement of one;
  subinterval restrictions will be allowed explicitly. We write $n asymp
  Y$ when $n$ is bounded above and below by fixed positive multiples of $Y$.

#prodef([Convention 2.1.])[
  (Parameters and uniformity).  Every constant is fixed before $x arrow.r oo$.
    A bound $L^(O \( 1 \))$ has an exponent independent of $x$.
    Its dependence on earlier fixed parameters is permitted unless explicitly excluded.
    For a two-sided size statement $Y = x L^(O \( 1 \))$, we mean $\| log \( Y \/ x \) \| = O \( T \)$.
    Arbitrary logarithmic accuracy means a bound $O_A \( L^(- A) \)$ for every desired fixed $A$,
    with the auxiliary choices made in the specified order.
  The geometric parameters used in the final sieve application are chosen first.
    The required Type II accuracy is chosen next. Inside the analytic argument the physical and ideal norm targets
    precede the comparison kernels; the mark length $J$ is chosen after those kernels.
    The strength of the character and Mellin discrepancy is chosen after the graph and Fourier parameters,
    and the precision of the cofactor proxies is chosen last.
    Each result below specifies the uniformity needed to respect this order.
] <conv:parameters>

All Hilbert spaces are complex. An operator defined by transitions acts on a function at the target and sums or
  integrates its weighted values at the input. Symmetrization of a list means the orthogonal projection that
  averages all permutations of its coordinates.

===== 2.1 A guide to recurring notation. <a-guide-to-recurring-notation.>

The following table locates the objects used across sections.
  Their full definitions and hypotheses appear at the indicated references.

#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Notation
], table.cell(rowspan: 1, colspan: 1)[Role
], table.cell(rowspan: 1, colspan: 1)[Definition
]),
  table.cell(rowspan: 1, colspan: 1)[$L \, T \, W$
], table.cell(rowspan: 1, colspan: 1)[Logarithmic scales and the roughness cutoff.
], table.cell(rowspan: 1, colspan: 1)[(2.1)
],
  table.cell(rowspan: 1, colspan: 1)[$cal(P)_g \, V_g \, mu_g$
], table.cell(rowspan: 1, colspan: 1)[Prime groups, harmonic masses, and probability laws;
  the number of groups is $s asymp T$.
], table.cell(rowspan: 1, colspan: 1)[13
],
  table.cell(rowspan: 1, colspan: 1)[$q \, omega_g \, omega$
], table.cell(rowspan: 1, colspan: 1)[Fixed damping parameter and distinct group-prime counts.
], table.cell(rowspan: 1, colspan: 1)[13
],
  table.cell(rowspan: 1, colspan: 1)[$J \, ell \, M = J + ell$
], table.cell(rowspan: 1, colspan: 1)[Fixed slot counts; $J$ is chosen after the comparison kernels.
], table.cell(rowspan: 1, colspan: 1)[3
],
  table.cell(rowspan: 1, colspan: 1)[$m$, later $m_(upright("probe"))$
], table.cell(rowspan: 1, colspan: 1)[Fixed bound on probes per big group, independent of $J$.
], table.cell(rowspan: 1, colspan: 1)[24
],
  table.cell(rowspan: 1, colspan: 1)[$W_(upright(bold(t))) \, W_ell$
], table.cell(rowspan: 1, colspan: 1)[Marked divisor weights; in $W_ell$ every group has $ell$ marks.
], table.cell(rowspan: 1, colspan: 1)[(5.1)
],
  table.cell(rowspan: 1, colspan: 1)[$n_(*) \, F_0 \, G_0$
], table.cell(rowspan: 1, colspan: 1)[Group-free part and endpoint cores invariant under multiplication by group primes.
], table.cell(rowspan: 1, colspan: 1)[5

(5.3)
],
)
]

=== 2.1 Classical prime estimates <classical-prime-estimates>

We use the prime number theorem with an error smaller than any fixed negative power of the logarithm
  #cite(label("TaoSW")) Corollary 39 and Exercise 40, and Mertens’ estimates #cite(label("TaoMertens"))
  Theorems 15 and 26

#[#set math.equation(numbering: n => "(2.2)")
 $ sum_(p lt.eq y) 1 / p = log log y + O \( 1 \) \, wide product_(p lt.eq y) (1 - 1 / p) tilde.op
   frac(e^(- gamma_E), log y) . $ <eq:mertens>]

Here and below sums or products indexed by $p$ are over primes.
  The following forms of Siegel–Walfisz and the multiplicative large sieve will be used.
  The former follows from its von Mangoldt formulation by partial summation;
  see #cite(label("TaoSW")) Exercise 64. For the latter see #cite(label("MontgomeryVaughanII")) Theorem 19.16.

#thm([Theorem 2.2.])[
  (Siegel–Walfisz).  #emph[For fixed $A \, C > 0$, uniformly for $\( a \, r \) = 1$ and $1 lt.eq r lt.eq \( log y \)^C$,
$ \# { p lt.eq y : p equiv a med \( mod med r \) } = frac("Li" \( y \), phi \( r \)) +
  O_(A \, C) #h(-0.16667em) (frac(y, \( log y \)^A)) . $

 The constants, which need not be effective, are independent of $y \, a \, r$.]
] <thm:sw>

#thm([Theorem 2.3.])[
  (Multiplicative large sieve).  #emph[Let $I$ be a real interval of length $H$,
    let $a_n$ be complex numbers supported on $I ∩ bb(Z)$, and let $R gt.eq 1$. Then
$ sum_(r lt.eq R) frac(r, phi \( r \)) sum_(chi med mod med r)^(*) lr(|sum_(n in I ∩ bb(Z)) a_n chi \( n \)|)^2
  lt.double \( H + 1 + R^2 \) sum_n \| a_n \|^2 \, $

 where the asterisk restricts the sum to primitive Dirichlet characters.]
] <thm:large-sieve>

We will use absolute character estimates on intervals that may be very short.
  The next consequence records precisely what is required; it does not require a relative prime asymptotic on
  every such interval.

#thm([Corollary 2.4.])[
  (Harmonic character estimates).  #emph[Fix $c \, C \, B \, A > 0$.
    If $chi$ is nonprincipal modulo $r lt.eq L^B$, then, uniformly for real $\| t \| lt.eq
    L^B$ and intervals $I subset \[ exp \( L^c \) \, x^C \]$,
$ sum_(p in I) frac(chi \( p \) p^(i t), p) lt.double_(c \, C \, B \, A) L^(- A) . $

 The same conclusion holds for a nonprincipal character induced from a smaller modulus.]
] <cor:harmonic-sw>

#proof[
  Writing $A_chi \( y \) = sum_(p lt.eq y) chi \( p \)$, sum 4 against $chi$ over reduced residue classes.
    The main terms cancel, and the loss from the number of classes is at most $L^B$.
    Because $log y gt.eq L^c$, the permitted moduli are bounded by a fixed power of $log y$.
    Thus $A_chi \( y \) lt.double_K L^B y \( log y \)^(- K)$ for every fixed $K$.
    Partial summation on $I = \( a \, b \]$ against $y^(- 1 + i t)$ gives boundary terms of size
    $O_K \( L^B \( log a \)^(- K) \)$ and an integral bounded by
  $ C_K L^B \( 1 + \| t \| \) integral_a^b frac(d y, y \( log y \)^K) lt.double_K L^(2 B) \( log a \)^(1 - K) . $
  Choose $K$ sufficiently large. The argument is uniform in both endpoints and also covers an empty interval.
    An induced nonprincipal character is itself nonprincipal on the modulus on which it is used,
    so the same argument applies. ◻
]

=== 2.2 Divisors, Dirichlet polynomials, and smooth separation <divisors-dirichlet-polynomials-and-smooth-separation>

#thm([Lemma 2.5.])[
  (Fixed divisor moments).  #emph[For each fixed nonnegative integer $k$,
$ sum_(n lt.eq Y) frac(tau \( n \)^k, n) lt.double_k \( log \( 2 Y \) \)^(C_k) \, wide
  sum_(n lt.eq Y) tau \( n \)^k lt.double_k Y \( log \( 2 Y \) \)^(C_k) $

 for a constant $C_k$. Consequently, a convolution of a fixed number of sequences bounded by fixed logarithmic
   powers has coefficient-square sum $U L^(O \( 1 \))$ on a dyad of size $U lt.eq x^(O \( 1 \))$.
   If its coefficients include the reciprocal of the product index, this bound is $L^(O \( 1 \)) \/ U$ instead.]
] <lem:divisor-moments>

#proof[
  Positivity and unique factorization bound the harmonic sum by
  $ product_(p lt.eq Y) sum_(a gt.eq 0) frac(\( a + 1 \)^k, p^a) =
    product_(p lt.eq Y) (1 + 2^k / p + O_k \( p^(- 2) \)) lt.double_k \( log \( 2 Y \) \)^(C_k) \, $
  using (2.2). The counting bound follows by multiplying by $Y$.
    If there are $b$ convolution factors, their coefficient at $n$ has absolute value at most a fixed logarithmic
    power times the number of ordered $b$-factorizations of $n$. The latter is at most $tau \( n \)^(b - 1)$:
    choose the first $b - 1$ divisors, which determine the last factor.
    Apply the counting moment bound with $k = 2 \( b - 1 \)$.
    On a dyad the reciprocal index is comparable to $1 \/ U$. ◻
]

The next coefficient-independent estimate is a weaker elementary form of the Dirichlet-polynomial mean-value
  theorem; compare #cite(label("MontgomeryVaughan1974")) Theorem 2 and Corollary 3.

#thm([Lemma 2.6.])[
  (Mean squares).  #emph[If $P \( t \) = sum_(n lt.eq Y) c_n n^(i t)$ and $I$ is an interval of length $H$, then
$ integral_I \| P \( t \) \|^2 thin d t lt.double #scale(x: 120%, y: 120%)[\(] H +
  Y log \( 2 Y \) #scale(x: 120%, y: 120%)[\)] sum_n \| c_n \|^2 . $

 For a set $cal(T)$ of real points at mutual distance at least one, contained in an interval of length $H$, one also has
#[#set math.equation(numbering: n => "(2.3)")
 $ sum_(t in cal(T)) \| P \( t \) \|^2 lt.double #scale(x: 120%, y: 120%)[\(] H + 1 +
   Y log \( 2 Y \) #scale(x: 120%, y: 120%)[\)] \( log \( 2 Y \) \)^2 sum_n \| c_n \|^2 . $ <eq:discrete-mean>]

 The constants are absolute, independently of any factorization used to form the coefficients $c_n$.]
] <lem:dirichlet-mean>

#proof[
  Integration gives the diagonal $H sum \| c_n \|^2$. For $n eq.not m$,
    the absolute value of the exponential integral is at most $2 \/ \| log \( n \/ m \) \| lt.double Y \/ \| n -
    m \|$. Apply $2 \| c_n c_m \| lt.eq \| c_n \|^2 + \| c_m \|^2$ and sum $1 \/ \| n -
    m \|$ to obtain the first bound. On the unit interval centered at $t$,
    the elementary one-dimensional Sobolev inequality bounds $\|
    P \( t \) \|^2$ by a constant times the integral of $\| P \|^2 + \| P' \|^2$.
    These unit intervals have bounded overlap. The derivative has coefficients $i \( log n \) c_n$,
    so the first bound applied twice gives (2.3). ◻
]

We also use two elementary exponential-sum estimates in the following forms;
  see #cite(label("MontgomeryVaughanII")) Corollary 16.6 and Theorem 16.7.

#thm([Lemma 2.7.])[
  (Derivative tests).  #emph[Let $f$ be real-valued on an interval containing $H$ consecutive integers.]
  + #emph[If $f'$ is monotone and stays in $\[ j + lambda \, j + 1 - lambda \]$ for some integer $j$ and $0 <
    lambda lt.eq 1 \/ 2$, then $sum_n e \( f \( n \) \) lt.double lambda^(- 1)$.]
  + #emph[If $f$ is twice continuously differentiable and $lambda lt.eq \| f'' \| lt.eq
    C lambda$ throughout the interval, then $sum_n e \( f \( n \) \) lt.double_C H lambda^(1 \/ 2) +
    lambda^(- 1 \/ 2)$.]
  #emph[Both estimates hold on every subinterval on which the stated hypotheses hold.]
] <lem:derivative-tests>

#thm([Lemma 2.8.])[
  (Fourier separation).  #emph[Let $F$ be smooth, supported in a fixed bounded box in $bb(R)^b$,
    where $b$ is fixed. Suppose that for every nonnegative integer $j$ its derivatives of order $j$ are bounded by
    $C_j L^(C \( j + 1 \))$. Then Fourier inversion separates the variables with integrated absolute coefficient
    mass $L^(O \( 1 \))$. There is a fixed $C' > 0$, depending on $b \, C$,
    such that restricting each Fourier frequency to absolute value at most $L^(C')$ leaves an error
    $O_A \( L^(- A) \)$ for every fixed $A$. The exponent $C'$ may be fixed before the desired $A$.]
] <lem:fourier-separation>

#proof[
  Repeated integration by parts gives a bound for $hat(F) \( xi \)$ by a derivative norm times an arbitrary fixed
    negative power of $1 + \| xi \|$. Taking more than $b$ derivatives first makes this bound integrable,
    with a fixed power of $L$. For the tail, take $j > b$ derivatives and integrate outside $\| xi \| gt.eq
    L^(C')$. The resulting bound is at most a constant depending on $j$ times
  $ L^(C \( j + 1 \) - C' \( j - b \)) . $
  Fix $C' > C$ sufficiently large for the chosen Fourier convention and box.
    Increasing $j$ then supplies any prescribed negative power of $L$.
    Fourier inversion expresses the integrand as a product of one-variable phases.
    Applying this in normalized logarithmic coordinates gives the corresponding Mellin separation on fixed dyads.
    Fixed-dimensional smooth cutoffs localized at logarithmic precision are included in the derivative hypothesis. ◻
]

=== 2.3 An elementary weighted sieve <an-elementary-weighted-sieve>

We record a form with explicit coefficient and level bounds.
  This will be used both for congruence counts and for oscillatory sums over rough integers.
  The construction is a version of the Brun–Hooley sieve: the product of block upper bounds and its one-block
  correction are the inequalities of Ford and Halberstam #cite(label("FordHalberstam2000")) Section 1, Lemma 1.
  We prove the form needed here, including its coefficient and level bounds.

#thm([Lemma 2.9.])[
  (Block sieve).  #emph[Consider a finite set of objects with nonnegative weights.
    For some primes $p lt.eq z$, let a bad condition be specified.
    If $d$ is a squarefree product of these primes, suppose the weight of the objects on which all conditions at
    $p divides d$ hold is
$ X g \( d \) + r \( d \) \, $

 including $d = 1$, where $X gt.eq 0$, $g$ is multiplicative, and
#[#set math.equation(numbering: n => "(2.4)")
 $ 0 lt.eq g \( p \) lt.eq 1 - eta_0 \, wide sum_(w < p lt.eq w^2) g \( p \) lt.eq
   C quad \( w > 1 \) $ <eq:sieve-density-hypotheses>]

 for fixed $eta_0 > 0$ and $C$. For every sufficiently large even integer $h$,
   the weight $S$ of objects avoiding all bad conditions satisfies
#[#set math.equation(numbering: n => "(2.5)")
 $ S = X product_(p lt.eq z) \( 1 - g \( p \) \) #scale(x: 120%, y: 120%)[\(] 1 +
   O \( e^(- h) \) #scale(x: 120%, y: 120%)[\)] + O #h(-0.16667em) (sum_(d lt.eq z^(4 h + 2)) \| r \( d \) \|) .
   $ <eq:block-sieve>]

 Only the indicated primes and their squarefree products are used.
   The implied constants depend on $eta_0 \, C$, uniformly also when $h$ grows.
   For the fixed even choice $h = 2$, there is an upper bound by a constant times $X
   product \( 1 - g \( p \) \)$ plus the same remainder sum.]
  #emph[More precisely, the proof supplies polynomials $U$ and $V$ in the indicators of the bad conditions such that
$ V lt.eq upright(bold(1))_(upright("no bad condition")) lt.eq U \, wide U gt.eq 0 . $

 Both have coefficients of absolute value at most one, supported on squarefree $d lt.eq z^(4 h + 2)$.
   The nonnegative overcount $U - upright(bold(1))_(upright("no bad condition"))$ is dominated by the pointwise
   nonnegative polynomial $U - V$, whose absolute coefficients are also at most one and which has the same level bound.]
] <lem:sieve>

#proof[
  Partition the indicated primes into blocks
  $ cal(B)_j = { p : z^(2^(- j - 1)) < p lt.eq z^(2^(- j)) } \, wide j gt.eq 0 . $
  Only finitely many blocks are nonempty. Set $h_j = \( j + 1 \) h$, which is even.
    In block $j$, write $I_j$ for avoidance of all its bad conditions,
    $U_j$ for the inclusion–exclusion polynomial through degree $h_j$,
    and $E_j$ for the sum of all monomials of degree $h_j + 1$. If exactly $t$ bad conditions hold in the block, then
  $ U_j = sum_(a = 0)^(h_j) \( - 1 \)^a binom(t, a) =
    cases(delim: "{", 1 \, & t = 0 \,, binom(t - 1, h_j) \, & t gt.eq 1 .) $
  Here a binomial coefficient is zero when its lower index exceeds its nonnegative upper index.
    It follows that $U_j gt.eq I_j gt.eq 0$ and $U_j - I_j lt.eq E_j$.
    Telescoping a product of nonnegative factors gives
  $ 0 lt.eq product_j U_j - product_j I_j lt.eq sum_j E_j product_(k eq.not j) U_k . $
  The upper and lower polynomials are therefore
  #[#set math.equation(numbering: n => "(2.6)")
   $ U = product_j U_j \, wide V = U - sum_j E_j product_(k eq.not j) U_k . $ <eq:sieve-polynomials>]
  In $U$, every block has degree at most $h_j$. A monomial from correction $j$ has degree exactly $h_j +
    1$ in block $j$ and at most $h_k$ elsewhere. These supports are disjoint across $j$ and disjoint from the
    support of $U$. Thus the absolute coefficients in $U \, V$ are at most one.
    The same disjointness gives this bound for $U - V$.
  The logarithm of a product in $U$, divided by $log z$, is at most
  $ sum_(j gt.eq 0) h \( j + 1 \) 2^(- j) = 4 h . $
  A correction adds at most one more unit to this upper bound.
    Hence the stated level $z^(4 h + 2)$ is valid for all the polynomials above.
  Now give the bad conditions independent probabilities $g \( p \)$.
    Their block avoidance probability $a_j = bb(E) I_j$ obeys
  $ a_j = product_(p in cal(B)_j) \( 1 - g \( p \) \) gt.eq exp \( - C \/ eta_0 \) = : a_(*) > 0 \, $
  because $- log \( 1 - u \) lt.eq u \/ eta_0$ for $0 lt.eq u lt.eq 1 - eta_0$. Also
  $ e_j := bb(E) E_j lt.eq frac(C^(h_j + 1), \( h_j + 1 \) !) \, wide a_j lt.eq bb(E) U_j lt.eq a_j + e_j . $
  For all large even $h$,
  $ R_h := sum_j e_j \/ a_j lt.double e^(- h) . $
  Indeed the factorial tails eventually decrease geometrically in their index, and $h_j = \( j + 1 \) h$;
    the same sum is bounded by an absolute constant when $h = 2$. Independence between blocks yields
  $ product_j a_j lt.eq bb(E) U lt.eq product_j a_j thin e^(R_h) \, wide
    bb(E) sum_j E_j product_(k eq.not j) U_k lt.eq product_j a_j thin R_h e^(R_h) . $
  Consequently the expectations of both bounding polynomials differ from $product a_j$ by $O \( e^(- h) \) product
    a_j$ for large $h$. For $h = 2$, the upper expectation is at most a constant times $product a_j$.
  Evaluate the two polynomials in the original counting problem.
    The main terms of their monomials are exactly their independent expectations multiplied by $X$.
    The absolute remainder for either polynomial is at most $sum_(d lt.eq z^(4 h + 2)) \| r \( d \) \|$,
    by the coefficient bound. Squeezing $S$ between them proves the result. ◻
]

#thm([Corollary 2.10.])[
  (A polynomial for rough integers).  #emph[For the ordinary bad conditions $p divides n$ at primes $p lt.eq z$,
    let $U \( n \) = sum_(d divides n) lambda_d$ be the upper polynomial in (2.6), and put $D = z^(4 h + 2)$. Then
$ U \( n \) gt.eq upright(bold(1))_(P^(-) \( n \) > z) gt.eq 0 \, quad \| lambda_d \| lt.eq 1 \, quad lambda_d =
  0 quad upright("unless ") d lt.eq D upright(" is squarefree") \, $

 and
#[#set math.equation(numbering: n => "(2.7)")
 $ sum_(n in I ∩ bb(N)) #scale(x: 120%, y: 120%)[\(] U \( n \) -
   upright(bold(1))_(P^(-) \( n \) > z) #scale(x: 120%, y: 120%)[\)] lt.double \| I \| e^(- h) +
   D $ <eq:rough-sieve-overcount>]

 for every finite interval $I subset \[ 1 \, oo \)$ and all sufficiently large even $h$.
   The bound is uniform in $h \, z \, I$. Moreover,
#[#set math.equation(numbering: n => "(2.8)")
 $ sum_d frac(\| lambda_d \|, d) lt.eq product_(p lt.eq z) \( 1 + p^(- 1) \) lt.double log \( 2 z \) .
   $ <eq:rough-sieve-harmonic>]

]
] <lem:rough-sieve-polynomial>

#proof[
  The pointwise claims and harmonic sum follow from the coefficient and support bounds.
    For the overcount, use its pointwise upper bound $U - V = sum_j E_j product_(k eq.not j) U_k$,
    which is nonnegative pointwise and has absolute coefficients at most one.
    In the interval $I$, the count of multiples of $d$ is $\| I \| \/ d + O \( 1 \)$.
    The independent expectation of $U - V$ was bounded in the proof by $O \( e^(- h) \)
    product_(p lt.eq z) \( 1 - 1 \/ p \)$; the sum of absolute remainders is $O \( D \)$.
    Dropping the avoidance product proves (2.7). Finally, $product \( 1 + 1 \/ p \) lt.eq
    product \( 1 - 1 \/ p \)^(- 1) lt.double log \( 2 z \)$ by Mertens. ◻
]

== 3 Transference for dilation graphs <sec:transference>

We transfer a norm estimate for independent prime labels to an averaged moment of a dilation graph whose labels
  must divide the integer at their vertex. Averaging a required divisibility condition supplies a factor $1 \/ p$,
  which explains the reciprocal-prime law in the independent model.
  A prime used at several vertices pays this cost only once.
  The main problem is to retain that dependence while using the independent-model norm on most edges.
  The resulting moment will control pairings in which one endpoint is constant on all mark lists at its integer
  position. Signed closed walks and repeated prime labels also occur in the divisibility-graph arguments of
  Helfgott and Radziwiłł #cite(label("HelfgottRadziwill2021")) Section 1.5 and Pilatte #cite(label("Pilatte2026"))
  Sections 3 and 5. The operators and ranges here differ; the memory identity and transference estimate below are
  proved for the present model.

=== 3.1 Prime groups and the two operators <prime-groups-and-the-two-operators>

#prodef([Definition 3.1.])[
  (Prime groups).  Fix constants
  $ 0 < a < b < c < d < 0.47 \, wide c_0 \, C_0 \, v_(-) \, v_(+) > 0 \, wide 0 < q < 1 \, wide ell in bb(N) . $
  For each sufficiently large $x$, let the finite, pairwise disjoint sets of primes $cal(P)_g$ be indexed by the
    disjoint sets $cal(S)$ and $cal(B)$, where
  $ c_0 T lt.eq \| cal(S) \| \, \| cal(B) \| lt.eq C_0 T . $
  The small and big groups, respectively, satisfy
  #[#set math.equation(numbering: n => "(3.1)")
   $ exp \( L^a \) lt.eq p lt.eq exp \( L^b \) & quad \( p in cal(P)_g \, med g in cal(S) \) \,\
exp \( L^c \) lt.eq p lt.eq exp \( L^d \) & quad \( p in cal(P)_g \, med g in cal(B) \) \,\
v_(-) lt.eq V_g := sum_(p in cal(P)_g) 1 / p & lt.eq v_(+) \, wide mu_g \( p \) :=
  frac(1, V_g p) . $ <eq:prime-group-ranges>]
  Write $s = \| cal(S) \| + \| cal(B) \|$ and
  $ omega_g \( n \) = sum_(p in cal(P)_g) upright(bold(1))_(p divides n) \, wide omega \( n \) =
    sum_g omega_g \( n \) quad \( n in bb(Z) \) . $
  Thus divisibility at $n = 0$ has its usual meaning. We call primes in $union.big_g cal(P)_g$ group primes.
] <def:prime-groups>

Let $J$ be a sufficiently large fixed integer and put $M = J + ell$.
  An ordered label list has $M$ slots in each group. A pattern $nu$ specifies sets $C_g subset.eq { 1 \, dots.h \,
  J }$, with

$ C_g = diameter quad \( g in cal(S) \) \, wide \| C_g \| lt.eq m \, wide t_g = ell + \| C_g \| . $

The slots in ${ 1 \, dots.h \, J } \\ C_g$ are shared; their labels are copied from the source list to the target
  list. The other $t_g$ slots in each endpoint list are unshared.
  To form $D$, use the shared labels and, in the $C_g$ slots, independent labels of law $mu_g$.
  Thus $D$ has $J$ prime factors from each group, counted with multiplicity. Write $D = D_(cal(S)) D_(cal(B))$.

For each pattern there is a complex coefficient $K_nu$, depending only on the ordered big-group source labels,
  target labels, and the auxiliary free labels used in $D_(cal(B))$.
  The finite pattern family may depend on $x$ and $J$, but

#[#set math.equation(numbering: n => "(3.2)")
 $ sum_nu sup \| K_nu \| lt.eq L^(C_1) \, $ <eq:pattern-mass>]

where $m \, C_1$ are fixed independently of $J$. In every operator below,
  symmetrization means averaging all $M !$ slot permutations independently in each relevant group.
  This is an orthogonal projection because the measures are invariant under these permutations.
  Our convention is that a row operator integrates a function at the target and returns a function at the source.

#prodef([Definition 3.2.])[
  (Ideal operator).  On the space
  $ cal(H)_(upright("id")) = L^2 (product_(g in cal(B)) cal(P)_g^M \, med ⨂_(g in cal(B)) mu_g^(⊗ M)) \, $
  repetitions of prime values are allowed. For a real $zeta$,
    the unsymmetrized ideal row operation for $nu$ retains shared labels,
    samples all unshared target labels independently with laws $mu_g$,
    and samples the auxiliary labels of $D_(cal(B))$ independently with the same laws. Its multiplier is
  $ K_nu D_(cal(B))^(i zeta) e #h(-0.16667em) (Theta D_(cal(B))) . $
  The sum over $nu$, composed on both sides with big-group symmetrization, is denoted $cal(T) \( Theta \)$.
] <def:ideal-operator>

#prodef([Definition 3.3.])[
  (Physical operator).  A physical state $\( n \, upright(bold(p)) \)$ consists of $n in
    bb(Z)$ and an ordered list $upright(bold(p)) = \( p_(g \, i) \)_(g \, 1 lt.eq i lt.eq M)$ such that,
    within each group, the labels are distinct and divide $n$.
    Give every state at $n$ mass $product_g V_g^(- M)$ and use counting measure in $n$.
    This defines $cal(H)_(upright("ph"))$.
  Fix an integer $k$ with $0 < \| k \| lt.eq L^(C_2)$. For pattern $nu$,
    sample the auxiliary labels forming $D$ as above and move from $n$ to $n' = n + k D$.
    Sum over physical target states at $n'$ with the prescribed shared labels,
    with coefficient $product_g V_g^(- t_g)$ for each target.
    Forbid every auxiliary free label of $D$ from both endpoint lists.
    Auxiliary free labels may equal one another. Multiply this row action by
  #[#set math.equation(numbering: n => "(3.3)")
   $ K_nu D^(i zeta) q^(\( omega \( n \) - M s \) \/ 2) q^(\( omega \( n' \) - M s \) \/ 2) .
     $ <eq:physical-multiplier>]
  The sum over patterns, symmetrized in all groups on both sides, is $cal(A)$.
] <def:physical-operator>

For clarity, the adjoint moves by $- k D$, interchanges source and target labels in the coefficient,
  and conjugates the multiplier. Indeed, after both lists and the auxiliary labels have been fixed,
  the shared product and hence $D$ are unchanged on reversal.
  The joint measure of the two lists in group $g$ has normalization

#[#set math.equation(numbering: n => "(3.4)")
 $ V_g^(- M - t_g) $ <eq:physical-joint-measure>]

in either direction. The auxiliary-label probability is also unchanged.
  This proves the assertion before symmetrization, and the symmetrizing projections are self-adjoint.

#thm([Lemma 3.4.])[
  (Absolute physical bounds).  #emph[Replace the coefficients of each row transition of $cal(A)$ by their absolute
    values before adding patterns or averaging permutations. The resulting operator and its adjoint have row sums
    at most $L^(C_(upright("abs")))$, where $C_(upright("abs"))$ may depend on $m \,
    C_1$ and the fixed data in 13, but is independent of $J$.
    The same assertion holds if the position is replaced by independent uniform residues at all group primes.]
] <lem:physical-schur>

#proof[
  If the target has $y gt.eq M$ divisors from group $g$, then, after the $M -
    t_g$ distinct shared labels have been fixed, there are $\( y - M + t_g \)_(t_g)$ possible ordered unshared
    target lists. Hence their sum, with their endpoint damping, is at most
  #[#set math.equation(numbering: n => "(3.5)")
   $ sup_(z gt.eq 0) V_g^(- t_g) \( z + t_g \)_(t_g) q^(z \/ 2) lt.eq C . $ <eq:physical-count-bound>]
  Here $t_g lt.eq ell + m$, so $C$ is independent of $J$. The source damping is at most one.
    Free-label probabilities have total mass one, and restrictions can only decrease an absolute sum.
    Taking the product over $s = O \( T \)$ groups and using (3.2) gives the row bound.
    The reversed normalization in (3.4) gives the identical argument for columns.
    Neither argument used any property of integer positions beyond divisibility and translation. ◻
]

In particular all these operators are bounded on their stated Hilbert spaces,
  including the physical space with unrestricted integer position.

#thm([Theorem 3.5.])[
  (Local transference).  #emph[For every fixed $E > 0$ there is $E_(upright("id")) > 0$,
    depending only on $E$ and the fixed data in 13, with the following property. Assume
#[#set math.equation(numbering: n => "(3.6)")
 $ sup_(Theta in bb(R)) lr(bar.v.double cal(T) \( Theta \) bar.v.double) lt.eq
   L^(- E_(upright("id"))) . $ <eq:ideal-norm-hypothesis>]

 Then, for every sufficiently large fixed $J$, where the lower bound on $J$ may also depend on $m \, C_1$, put
$ R = ceil.l L^0.52 ceil.r \, wide N = 2 R . $

 For every fixed $gamma > 0$ and $I = \[ X \, 2 X \)$ with $x^gamma lt.eq X lt.eq x^(1 \/ gamma)$, one has
#[#set math.equation(numbering: n => "(3.7)")
 $ frac(1, \| I ∩ bb(Z) \|) sum_(n in I ∩ bb(Z)) chevron.l u_n \, \( cal(A) cal(A)^(*) \)^R u_n chevron.r lt.eq
   L^(- E N) \, $ <eq:transference-moment>]

 for all sufficiently large $x$. Here $u_n$ is one on every physical state at position $n$ and zero elsewhere.
   The threshold for $x$ may depend on all fixed parameters, including $J \, C_2 \, gamma$,
   and the bound is uniform subject to these parameters and (3.6).
   No bound on $zeta$ is needed apart from the assumed ideal estimate.]
] <thm:transference>

The vector $u_n$ is the constant function on the mark lists at $n$; it is not normalized.
  Thus the moment in (3.7) sums paths whose final integer position returns to $n$,
  with arbitrary initial and final mark lists. 23 will turn precisely this estimate into cancellation against a
  mark-independent first endpoint. Those are the endpoints supplied in 5.

Here is the structure of the proof. First replace the integer root by independent residues and expand each big
  prime’s contribution over intervals containing all its active visits.
  A memory records its congruence between active uses. The small-prime residues remain physical:
  the many choices of omitted small marks make transfers between memory and active lists rare.
  On an edge with no such transfer, Fourier transformation of the residue coordinates leaves the ideal big-label
  operator. We first allow different lifespans to use the same prime,
  and then exclude such coincidences by inclusion–exclusion organized by the number of independent equalities.
  Only the rare-transfer estimate needs the complexity-dependent choice of $J$; the ideal accuracy is fixed beforehand.

=== 3.2 Replacing the root by independent residues <replacing-the-root-by-independent-residues>

Expand the left side of (3.7) into paths with $N$ alternating forward and backward edges.
  Fix the patterns, all endpoint permutations, the auxiliary labels, and the active lists at visits $0 \,
  dots.h \, N$. These choices fix offsets $h_0 = 0 \, h_1 \, dots.h \, h_N$, with

$ h_(i + 1) - h_i = sigma_i k D_i \, wide sigma_i in { 1 \, - 1 } \, wide h_N = 0 . $

Only return to the position is imposed; the last ordered list need not be the first one.
  Let $Lambda_i$ be the set of active labels at visit $i$. Put $q_0 = q_N = sqrt(q)$ and $q_i =
  q$ for $0 < i < N$. The dependence on the initial integer $n$ is precisely the nonnegative factor

#[#set math.equation(numbering: n => "(3.8)")
 $ product_(i = 0)^N (product_(p in Lambda_i) upright(bold(1))_(n + h_i equiv 0 med \( mod med p \)))
   q_i^(\# { p upright(" a group prime") : p in.not Lambda_i \, med n + h_i equiv 0 med \( mod med p \) }) .
   $ <eq:path-residue-factor>]

The label normalization is initially $product_g V_g^(- M)$ and at each edge $product_g V_g^(- t_g)$,
  in addition to the free-label probabilities. All remaining factors are independent of $n$.

#thm([Lemma 3.6.])[
  (Uniform residue replacement).  #emph[For each compatible fixed path and every fixed $A > 0$,
    the average of (3.8) over $I ∩ bb(Z)$ equals its expectation under independent uniform residues at all group
    primes, multiplied by $1 + O \( exp \( - A N T \) \)$. Incompatible active congruences give zero in both models.]
] <lem:transference-crt>

#proof[
  Let $Q_(upright("act"))$ be the product of the distinct active primes over all visits.
    There are at most $\( N + 1 \) M s$ of them, so
  #[#set math.equation(numbering: n => "(3.9)")
   $ log Q_(upright("act")) = O_J \( N T L^d \) = o \( L \) . $ <eq:active-crt-size>]
  Compatibility fixes one congruence modulo $Q_(upright("act"))$.
    All damping factors belonging to these primes are then deterministic; factor them out in both models.
    This step permits a relative estimate even when these deterministic factors are very small.
  For a remaining prime, collect repeated offsets into distinct residues. Its factor has the form
  $ 1 - X_p \( n \) \, wide X_p \( n \) = sum_r c_(p \, r) upright(bold(1))_(n equiv r med \( mod med p \)) \,
    quad 0 lt.eq c_(p \, r) lt.eq 1 \, $
  with at most $N + 1$ residues and $0 lt.eq X_p lt.eq 1$. In the independent model,
  $ lambda := sum_p bb(E) X_p lt.eq \( N + 1 \) sum_p 1 / p = O \( N T \) \, wide
    product_p \( 1 - bb(E) X_p \) gt.eq exp \( - O \( N T \) \) \, $
  since $max_p bb(E) X_p = o \( 1 \)$. Bonferroni inequalities for numbers in $\[ 0 \, 1 \]$ bracket
    $product_p \( 1 - X_p \)$ by consecutive truncations of its elementary-symmetric expansion.
    At degree $h$, the independent expectation of the difference is at most $lambda^h \/ h !$.
    Choose $h$ of order $N T$, with its fixed constant sufficiently large after $A$.
    Stirling’s lower bound $h ! gt.eq \( h \/ e \)^h$ makes the difference smaller than
    $exp \( - \( A + C \) N T \)$ for any required fixed $C$.
  Each truncated term specifies one residue at each of at most $h$ additional primes.
    Its CRT count on $I$ differs from its independent density by $O \( \| I ∩ bb(Z) \|^(- 1) \)$,
    also when the active congruence is imposed. The number of such terms is at most
  $ exp #scale(x: 120%, y: 120%)[\(] O \( h \( L^d + log N + log s \) \) #scale(x: 120%, y: 120%)[\)] =
    exp \( o \( L \) \) \, $
  and their moduli, including $Q_(upright("act"))$, have product $exp \( o \( L \) \)$. Here $0.52 + d < 1$.
    Thus the total counting error is $exp \( - gamma L + o \( L \) \)$.
    By (3.9), this is negligible relative to $Q_(upright("act"))^(- 1) exp \( - O \( N T \) \)$.
    Restoring the factored deterministic damping proves the stated relative estimate. ◻
]

This replacement may be summed over paths with absolute coefficients.
  Indeed retain the full vector of residues as a position, with its Haar probability measure,
  and translate it by $sigma_i k D_i$ on an edge. The expected total mass of all initial lists is at most one:
  in group $g$ it is

#[#set math.equation(numbering: n => "(3.10)")
 $ V_g^(- M) sum_(p_1 \, dots.h \, p_M in cal(P)_g\
upright("distinct")) frac(1, p_1 dots.h.c p_M) lt.eq 1 . $ <eq:initial-factorial-mass>]

By 16, the absolute mass of all length $N$ paths, even without a return condition, is $L^(O \( N \))$.
  Taking $A$ sufficiently large in 18 makes the summed error smaller than $L^(- A' N)$ for any desired fixed $A'$.
  We may therefore use the independent residue model. The return condition is now imposed by the exact identity

#[#set math.equation(numbering: n => "(3.11)")
 $ upright(bold(1))_(h_N = 0) = integral_0^1 e #h(-0.16667em) (theta h_N) thin d theta . $ <eq:return-fourier>]

It suffices to bound the unrestricted signed path expression uniformly in $theta$.
  Small-prime residues will remain actual Haar coordinates throughout the argument.

=== 3.3 The exact expansion for one big prime <the-exact-expansion-for-one-big-prime>

Put $eta_i = 1 - q_i$, $P_(*) := exp \( L^c \)$, and, for each big prime,

#[#set math.equation(numbering: n => "(3.12)")
 $ b_p = 1 - 1 / p sum_(i = 0)^N eta_i > 0 \, wide tilde(mu)_g \( p \) = frac(1, V_g p b_p) . $ <eq:lifespan-baseline>]

The ratio $tilde(mu)_g \( p \) \/ mu_g \( p \)$ is $1 + O \( N \/ P_(*) \)$, uniformly in big groups.
  We extract the common baseline $product_(p med upright("big")) b_p lt.eq 1$ from every path sum.

Suppose first that $p$ is active at some visits. Incompatible active offsets give zero.
  Otherwise let their common residue be $c_p$, let $a_p \, z_p$ be the first and last active visits,
  and put $H_i = upright(bold(1))_(h_i equiv c_p med \( mod med p \))$. Its residue expectation is

$ 1 / p product_(i : med p in.not Lambda_i) \( 1 - eta_i H_i \) . $

The two exact telescoping identities

#[#set math.equation(numbering: n => "(3.13)")
 $ product_(i < a_p) \( 1 - eta_i H_i \) & = 1 - sum_(j < a_p) eta_j H_j product_(j < i < a_p) \( 1 - eta_i H_i \) \,\
product_(i > z_p) \( 1 - eta_i H_i \) & = 1 - sum_(j > z_p) eta_j H_j product_(z_p < i < j) \( 1 - eta_i H_i \)
  $ <eq:prefix-ghost>]

follow by subtracting consecutive partial products. Thus, in addition to its active uses,
  the prime either starts at $a_p$ or has an earlier ghost birth at a hit $j < a_p$, with coefficient $- eta_j$;
  it either ends at $z_p$ or has a later ghost termination at a hit $j > z_p$, again with coefficient $- eta_j$.
  At strictly internal unmarked hits it receives $q_i$.

If $p$ is never active, expand its full product and group each term of degree at least two by its earliest and
  latest indices. This gives

#[#set math.equation(numbering: n => "(3.14)")
 $ b_p + 1 / p sum_(j < i) eta_j eta_i upright(bold(1))_(h_j equiv h_i med \( mod med p \)) product_(j < t < i)
   (1 - eta_t upright(bold(1))_(h_t equiv h_j med \( mod med p \))) . $ <eq:orphan-expansion>]

The empty and singleton terms give $b_p$; the interior product is the sum over every possible further chosen
  index. Relative to the baseline, the prime is either absent or has an orphan interval from $j$ to $i$, $j < i$,
  of cost $\( p b_p \)^(- 1) \( - eta_j \) \( - eta_i \)$ and the indicated internal damping.

Consequently each represented big prime has exactly one #emph[lifespan]:
  an interval containing all its active visits, possibly containing none.
  Its endpoints and all its active visits have equal offsets modulo $p$.
  It pays $\( p b_p \)^(- 1)$ once, the ghost endpoint coefficients if present,
  and $q_i$ at each strictly internal unmarked hit. No offset outside the lifespan occurs in its weight.

There are two useful consequences of physical compatibility. For large $x$ every group prime exceeds $\| k \|$.
  If a prime is active at both ends of an edge, then it divides $k D$, hence $D$.
  It cannot be an auxiliary free label, by the ban, so it must be a prescribed shared label.
  Conversely, a prime at an unshared entry or exit cannot divide $D$:
  it would either duplicate a shared label in that state or violate the free-label ban.
  Thus the original mark normalization assigns $V_g^(- 1)$ to each maximal run of activity,
  and no additional factor at shared continuation. In particular,
  a lifespan with $r$ active runs requires total label weight

$ frac(V_g^(- r), p b_p) . $

The memory construction must therefore charge the reciprocal prime once, at the first appearance,
  and charge $V_g^(- 1)$ once for each active run. Later congruence tests must not introduce further
  reciprocal-prime costs. These requirements guide the choice of measures and transfer coefficients below;
  the memory identity will verify them.

=== 3.4 A Hilbert space which remembers lifespans <a-hilbert-space-which-remembers-lifespans>

Let $Y_(cal(S)) = product_(p med upright("small")) bb(Z) \/ p bb(Z)$, with Haar probability measure.
  A small state at $y in Y_(cal(S))$ is an ordered list of $M$ distinct zero coordinates in each small group,
  with mass $product_(g in cal(S)) V_g^(- M)$. Write $cal(H)_(cal(S))$ for the resulting $L^2$ space.
  For a big group set

$ cal(Z)_g = { \( p \, r \) : p in cal(P)_g \, r in bb(Z) \/ p bb(Z) } \, wide d lambda_g \( p \, r \) =
  tilde(mu)_g \( p \) thin d "count" \( r \) . $

Define its memory space by

#[#set math.equation(numbering: n => "(3.15)")
 $ cal(F)_g = xor.big_(j gt.eq 0) L_(upright("sym"))^2 (cal(Z)_g^j \, frac(1, j !) lambda_g^(⊗ j)) \, wide
   cal(H) =
   cal(H)_(cal(S)) ⊗ L^2 (product_(g in cal(B)) cal(P)_g^M \, ⨂_(g in cal(B)) tilde(mu)_g^(⊗ M)) ⊗ ⨂_(g in cal(B))
   cal(F)_g . $ <eq:memory-hilbert-space>]

Here “symmetric” means invariant under permutations of the $j$ particle indices,
  including when their numerical values coincide. The $j = 0$ summand is $bb(C)$.
  A pending particle $\( p \, r \)$ records displacement from its required hit, modulo $p$.
  The residue measure in $lambda_g$ is #emph[counting measure]:
  requiring $r = 0$ selects one point and incurs no factor $1 \/ p$.
  The boundary vector $upright(bold(1))_diameter$ is one when every memory is empty and zero otherwise;
  it is independent of all other coordinates.

We next specify row actions. The factorial measure in (3.15) is used for inner products and adjoints,
  not inserted anew in every row transition. All operations are first understood on finite memory truncations;
  the absolute bounds below justify the unrestricted sums.

Separate the evolution into an operation $G_i$ at each visit $0 lt.eq i lt.eq
  N$ and an operation $cal(E)_i$ across the following edge for $i < N$.
  The visit operation handles ghost endpoints and unmarked hits.
  The edge operation moves residues and transfers particles between active lists and memory:
  a store keeps a departing active label pending, and a promotion returns a pending particle to an active slot.
  Thus $G_i$ acts after arrival and promotion at visit $i$, and before storage and departure.

To make both operations bounded, choose $rho in \( 0 \, 1 \)$ with $rho^2 > sqrt(q)$.
  At a strictly internal unmarked hit, split the required damping as

$ q_i = rho thin \( q_i \/ rho^2 \) thin rho . $

The adjacent edges supply the two factors $rho$, and the visit operation supplies the middle factor.
  The edge factors will control the number of possible promotions,
  while $q_i \/ rho^2 < 1$ damps the visit operation. The ghost endpoint factor is similarly split as $-
  eta_i = \( - eta_i \/ rho \) rho$; the birth normalization is specified below.
  The definitions implement these local factorizations, including the initial and terminal visits.

For a group memory $upright(bold(z)) = \( \( p_h \, r_h \) \)_(h = 1)^j$, write $Z \( upright(bold(z)) \) = { h :
  r_h = 0 }$. At visit $i$ the ghost operation $G_i$ is the product over big groups of the following row action,
  leaving every other coordinate fixed:

#[#set math.equation(numbering: n => "(3.16)")
 $ \( G_(i \, g) F \) \( upright(bold(z)) \) =  & sum_(A subset.eq Z \( upright(bold(z)) \))
   (- eta_i / rho)^(\| A \|) (q_i / rho^2)^(\| Z \( upright(bold(z)) \) \| - \| A \|) sum_(b gt.eq 0) frac(1, b !)
   (- frac(eta_i V_g, rho))^b\
 & #h(12mm)  dot.op integral_(cal(P)_g^b) F #scale(x: 120%, y: 120%)[\(]
   upright(bold(z)) \\ A \, \( p'_1 \, 0 \) \, dots.h \, \( p'_b \, 0 \) #scale(x: 120%, y: 120%)[\)]
   product_(h = 1)^b d tilde(mu)_g \( p'_h \) . $ <eq:ghost-row>]

Thus selected old zeros terminate, continuing zeros are damped, and a new unordered batch is born at zero.
  Termination precedes birth; an orphan cannot be born and terminate at the same visit.

The edge operation $cal(E)_i$, $0 lt.eq i < N$, sums the given patterns in orientation $sigma_i$,
  with independent source and target symmetrizations in all active lists.
  Between these permutations its row action is as follows.

+ Form $D$ from shared source labels and the independent free draws.
  Retain the ban of free labels from both endpoint active lists.
  Multiply by the oriented coefficient $K_nu D^(i zeta)$, or its conjugate with roles interchanged,
  and by $e #h(-0.16667em) (theta sigma_i k D)$.
+ Multiply by $rho$ for every old pending zero, before storing any active particle.
  In each big group select any subset of its $t_g$ unshared source slots to store,
  appending their particles at residue zero; drop the other unshared source particles. Shared particles remain active.
+ Translate $y$ and all pending residues, including the newly stored ones, by $Delta = sigma_i k D$.
  Choose any subset of the $t_g$ unshared big target slots and an injection of those ordered slots into distinct
  #emph[old] pending particle indices of that group whose translated residue is zero.
  Promote the selected particles into those slots, remove them from memory,
  and multiply by $V_g^(- 1)$ per promotion. Newly stored particles cannot be promoted across this edge.
  Require $p divides.not D$ for every stored or promoted particle.
  Fill the other unshared target slots by independent fresh integrations against $tilde(mu)_g$.
+ Multiply by $rho$ for every pending zero remaining after promotions.
  In the small groups use the physical target sum, with normalization $V_g^(- ell)$,
  and the two small endpoint factors $q^(\( omega_g - M \) \/ 2)$.
  These counts concern small states at $y$ and $y + Delta$.

Selections of promotion slots and injections are summed without a factorial divisor.
  All choices of source or target slots refer to their canonical order between the sampled endpoint permutations.
  No big endpoint damping is included apart from the pending-particle factors specified above.
  Auxiliary free draws of $D$ are not particle births.

For the moment impose, in the complete path sum, the rule that all prime values assigned at #emph[different
  births] are distinct. Births comprise initial active slots, fresh active target slots, and ghost births.
  This is a global rule, even if two births occur far apart.
  Apart from it, place no distinctness restriction on big active lists or memories.

#thm([Lemma 3.7.])[
  (Exact memory identity).  #emph[With the distinct-birth rule,
    the independent-residue path expression with the phase in (3.11) equals
#[#set math.equation(numbering: n => "(3.17)")
 $ (product_(p med upright("big")) b_p) chevron.l upright(bold(1))_diameter \,
   G_0 cal(E)_0 G_1 dots.h.c cal(E)_(N - 1) G_N upright(bold(1))_diameter chevron.r_(upright("distinct")) .
   $ <eq:memory-product>]

 The subscript means that the indicator is inserted in the expanded path integral,
   not that each local operator separately enforces it.]
] <lem:memory-identity>

#proof[
  A particle born active begins with its required hit at that visit.
    When it leaves an active run, storing it at zero and then translating records subsequent displacement from
    that hit. Promotion checks displacement zero. A later store resets the anchor at a congruent offset,
    so it changes no congruence requirement. A ghost birth sets the anchor at an unmarked hit,
    and a ghost termination also checks zero. Shared continuation automatically respects the congruence.
  The $rho$ factors cancel locally. At an internal visit a continuing pending zero pays $rho \( q_i \/ rho^2 \)
    rho = q_i$. A ghost birth pays $\( - eta_i \/ rho \) rho = - eta_i$,
    and a ghost termination pays $rho \( - eta_i \/ rho \) = - eta_i$.
    An active particle pays none of these factors: promotion occurs before output damping and storage after input
    damping. At visit zero memory starts empty, and at visit $N$ it must end empty,
    so there is no missing boundary factor. The values $q_0 = q_N = sqrt(q)$ are therefore treated exactly.
  For a prime with $r$ active runs, a first active birth costs $1 \/ \( V_g p b_p \)$ and each of its $r -
    1$ later promotions costs $1 \/ V_g$. A first ghost birth costs $1 \/ \( p b_p \)$ and its $r$ promotions cost
    $V_g^(- r)$. Both give
  $ frac(V_g^(- r), p b_p) . $
  An orphan has $r = 0$. These are precisely the baseline-relative costs in (3.13), (3.14),
    including all original mark normalizations.
  Conversely, fix an original compatible path and a chosen lifespan term for every represented big prime.
    Its active visits determine exactly when it is shared, stored, promoted, or dropped;
    its ghost endpoints determine its birth and termination. Between these uses it must remain pending.
    The exclusions $p divides.not D$ follow from unshared entries and exits as proved above,
    and immediate promotion of a newly stored particle is impossible for the same reason.
    A numerical prime occupies at most one active slot or pending particle, because it has only one birth.
    Distinct ghost births in an unordered batch are counted once by its factorial divisor.
    Thus these constructions are mutually inverse and preserve all coefficients. This proves (3.17). ◻
]

2 illustrates an admissible lifespan with two runs of activity and ghost endpoints.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-0.375, 0), (11.75, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#808080"))))
  content((11.75, 0), [#text(size: 9pt)[visit]], anchor: "west", padding: 0.1176cm)
  line((0, -0.0595), (0, 0.0595), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((1.25, -0.0595), (1.25, 0.0595), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((2.5, -0.0595), (2.5, 0.0595), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((3.75, -0.0595), (3.75, 0.0595), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((5, -0.0595), (5, 0.0595), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((6.25, -0.0595), (6.25, 0.0595), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((7.5, -0.0595), (7.5, 0.0595), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((8.75, -0.0595), (8.75, 0.0595), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((10, -0.0595), (10, 0.0595), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((11.25, -0.0595), (11.25, 0.0595), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (2.5, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10, dash: "dashed"))
  line((2.5, 0), (3.75, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((3.75, 0), (7.5, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10, dash: "dashed"))
  line((7.5, 0), (8.75, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  line((8.75, 0), (11.25, 0), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10, dash: "dashed"))
  circle((2.5, 0), radius: 0.09172, fill: rgb("#0000a6"), stroke: none)
  circle((3.75, 0), radius: 0.09172, fill: rgb("#0000a6"), stroke: none)
  circle((7.5, 0), radius: 0.09172, fill: rgb("#0000a6"), stroke: none)
  circle((8.75, 0), radius: 0.09172, fill: rgb("#0000a6"), stroke: none)
  circle((0, 0), radius: 0.09172, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  circle((11.25, 0), radius: 0.09172, fill: rgb("#ffffff"), stroke: (paint: rgb("#0000a6"), thickness: 1.2pt, miter-limit: 10))
  content((0, 0.085), [#text(size: 9pt)[ghost birth at $j$]], anchor: "south", padding: 0.1176cm)
  content((3.125, 0.085), [#text(size: 9pt)[active]], anchor: "south", padding: 0.1176cm)
  content((8.125, 0.085), [#text(size: 9pt)[active]], anchor: "south", padding: 0.1176cm)
  content((11.25, 0.085), [#text(size: 9pt)[terminate at $i$]], anchor: "south", padding: 0.1176cm)
  content((0, -0.1275), [#text(size: 9pt)[$- eta_j$#linebreak()$1"/"("pb"_p)$ once]], anchor: "north", padding: 0.1176cm)
  content((2.5, -0.1275), [#text(size: 9pt)[promote#linebreak()$1"/"V_g$]], anchor: "north", padding: 0.1176cm)
  content((3.75, -0.1275), [#text(size: 9pt)[store#linebreak()$r=0$]], anchor: "north", padding: 0.1176cm)
  content((7.5, -0.1275), [#text(size: 9pt)[promote#linebreak()$1"/"V_g$]], anchor: "north", padding: 0.1176cm)
  content((8.75, -0.1275), [#text(size: 9pt)[store]], anchor: "north", padding: 0.1176cm)
  content((11.25, -0.1275), [#text(size: 9pt)[$- eta_i$]], anchor: "north", padding: 0.1176cm)
  content((5.625, 0.3825), [#text(size: 9pt)[pending: $r "gets" r+ Delta$#linebreak()unmarked zero pays $q_t$]], anchor: "south", padding: 0.1176cm)
})],
  caption: [Figure 2: One possible lifespan. Solid segments denote shared activity; dashed segments denote memory. Every marked use and ghost endpoint has the same offset modulo $p$. The reciprocal prime factor is charged only at birth; $eta_t = 1 - q_t$ at visit $t$. ],
) <fig:prime-lifespan>

=== 3.5 Absolute bounds, including the adjoint measures <absolute-bounds-including-the-adjoint-measures>

The memory identity is exact with the global distinct-birth rule.
  We now allow different births to have equal prime values, so that each operation acts locally on $cal(H)$.
  We will restore the global rule after estimating this enlarged evolution.
  The absolute bounds proved here justify the memory truncation and remain available when equality constraints
  later modify individual operations. Their column bounds require the factorial adjoint measures explicitly.

For a positive row kernel $K$, if a positive function $w$ satisfies $K w lt.eq R w$ and $K^(*) w lt.eq C w$, then

#[#set math.equation(numbering: n => "(3.18)")
 $ lr(bar.v.double  bar.v.double) K_(2 arrow.r 2) lt.eq sqrt(R C) . $ <eq:weighted-schur>]

Indeed, Cauchy’s inequality in each row bounds $\| K f \|^2$ by $\( K w \) K \( \| f \|^2 \/ w \)$;
  integration and the column inequality prove (3.18). We apply this to absolute kernels, with

$ w \( upright("state") \) = v^(j_(upright("tot"))) \, wide j_(upright("tot")) = sum_(g in cal(B)) j_g \, $

where $v > 1$ is a fixed constant chosen below.

Here is a direct verification of the measures in the ghost adjoint. In one group abbreviate

$ A_i = q_i / rho^2 \, wide D_i = - eta_i / rho \, wide C_i = V_g D_i \, wide nu = tilde(mu)_g \, $

and let $z \( upright(bold(u)) \)$ count zero residues in a memory list.
  For test functions $f \, h$, the joint integral from (3.16) is

#[#set math.equation(numbering: n => "(3.19)")
 $ chevron.l f \, G_(i \, g) h chevron.r =  & sum_(k \, t \, b gt.eq 0) frac(1, k ! t ! b !) integral
   A_i^(z \( upright(bold(u)) \)) D_i^t C_i^b overline(f \( upright(bold(u)) \, bold(alpha)^0 \))
   h \( upright(bold(u)) \, bold(beta)^0 \)\
 & #h(14mm)  dot.op d lambda_g^(⊗ k) \( upright(bold(u)) \) d nu^(⊗ t) \( bold(alpha) \) d
   nu^(⊗ b) \( bold(beta) \) . $ <eq:ghost-joint-integral>]

Here $bold(alpha)^0$ means that all its residues are zero.
  The identity follows by selecting $t$ old zero indices from a list of size $k + t$:

$ frac(1, \( k + t \) !) binom(k + t, t) = frac(1, k ! t !) . $

Swapping $\( t \, bold(alpha) \)$ with $\( b \, bold(beta) \)$ and conjugating shows that the adjoint has the same
  row formula with birth coefficient $D_i$ and termination coefficient $C_i$.
  In particular, reversal moves the factor $V_g$ from births to terminations;
  it does not create any factor $p$ or $1 \/ p$.

For the absolute ghost kernel the weighted row ratio is exactly

#[#set math.equation(numbering: n => "(3.20)")
 $ exp #scale(x: 120%, y: 120%)[\(] \| C_i \| v nu \( cal(P)_g \) #scale(x: 120%, y: 120%)[\)]
   (A_i + frac(\| D_i \|, v))^(z \( upright(bold(z)) \)) \, $ <eq:ghost-schur-ratios>]

and its column ratio has $C_i \, D_i$ interchanged. Choose $v$ large enough that, for both possible $q_i$,

#[#set math.equation(numbering: n => "(3.21)")
 $ q_i / rho^2 + frac(2 max \( 1 \, v_(+) \) eta_i, rho v) < 1 . $ <eq:memory-weight-choice>]

This is possible since $q_i lt.eq sqrt(q) < rho^2$. The same choice works when every original ghost birth receives
  an extra factor two. Since $nu \( cal(P)_g \) = 1 + o \( 1 \)$,
  the exponential factor in (3.20) is bounded by a fixed constant per group. Thus for some fixed $C_v$,

#[#set math.equation(numbering: n => "(3.22)")
 $ \| G_i \| w lt.eq L^(C_v) w \, wide \| G_i \|^(*) w lt.eq L^(C_v) w \, wide
   lr(bar.v.double G_i bar.v.double) lt.eq L^(C_v) . $ <eq:ghost-absolute-bound>]

The exponent $C_v$ is independent of $m \, C_1 \, J$. All these assertions include the version with doubled ghost
  births.

We verify the edge adjoint just as explicitly. Fix one big group, a pattern, endpoint permutations, free labels,
  and the chosen transfer subsets. Suppose $a$ target slots are promotions and $b$ source slots are stores,
  so $a \, b lt.eq t_g$. Let the source memory have size $j$, and write $u$ for its $j - a$ surviving particles.
  Let $p_1 \, dots.h \, p_a$ be the promoted prime labels and $s_1 \, dots.h \, s_b$ the stored labels.
  For step $Delta$, the endpoint memories are

#[#set math.equation(numbering: n => "(3.23)")
 $ X = u union.sq \( \( p_h \, - Delta med mod med p_h \) \)_(h lt.eq a) \, wide Y =
   T_Delta u union.sq \( \( s_h \, Delta med mod med s_h \) \)_(h lt.eq b) \, $ <eq:edge-joint-memory>]

where $T_Delta$ translates every residue. The joint measure on these variables is

#[#set math.equation(numbering: n => "(3.24)")
 $ frac(d lambda_g^(⊗ \( j - a \)) \( u \), \( j - a \) !) product_(h lt.eq a) d tilde(mu)_g \( p_h \)
   product_(h lt.eq b) d tilde(mu)_g \( s_h \) \, $ <eq:edge-joint-measure>]

along with one $tilde(mu)_g$ integration for every shared active label, dropped source label,
  and fresh target label. The transfer coefficient is $V_g^(- a)$,
  and the damping is $rho^(z \( X \) + z \( Y \))$. The factorial accounting is

#[#set math.equation(numbering: n => "(3.25)")
 $ frac(\( j \)_a, j !) = frac(1, \( j - a \) !) = frac(\( j - a + b \)_b, \( j - a + b \) !) .
   $ <eq:edge-factorial-reversal>]

The first equality selects old memory indices into the $a$ specified ordered target slots.
  The second selects $b$ indices of the output memory into the original source slots on reversal.
  Each required residue in (3.23) selects exactly one point of counting measure. Translation preserves that measure.

It follows that the reversed row operation retrieves the original stores and stores the original promotions;
  the coefficient $V_g^(- a)$ remains unchanged. If it is expressed using the forward convention that charges
  $V_g^(- b)$ for its reversed promotions, its additional factor is $V_g^(b - a)$.
  This is bounded uniformly for $a \, b lt.eq ell + m$. Fixing shared and free $D$-labels fixes $Delta$
  independently of which memory indices are retrieved, as required for this change of variables.
  In small groups Haar translation and the joint normalization $V_g^(- M - ell)$ are invariant on reversal.

The identities above continue to hold with numerical coincidences.
  For example, a memory multiset with multiplicities $n_z$ has mass $product_z lambda_g \( z \)^(n_z) \/ n_z !$.
  Subset deletions and ordered retrievals retain their index multiplicities.
  No passage from indices to distinct numerical values was made in (3.19) or (3.25).

#thm([Lemma 3.8.])[
  (Absolute memory bounds).  #emph[There is $C_a$, allowed to depend on $m \, C_1$ but independent of $J$,
    such that every absolute edge has weighted row and column bounds $L^(C_a)$.
    These bounds and (3.22) persist under arbitrary multipliers of modulus at most one on individual local
    transition choices, and under memory-size projections.]
] <lem:memory-absolute>

#proof[
  For a row, fix a pattern, free labels, permutations, and transfer-slot subsets of sizes $a_g \, b_g lt.eq t_g$.
    If $Z'$ old pending particles have zero translated residue in a group,
    their ordered promotions and the remaining output damping cost at most
  #[#set math.equation(numbering: n => "(3.26)")
   $ \( Z' \)_(a_g) rho^(Z' - a_g) lt.eq sup_(z gt.eq a_g) \( z \)_(a_g) rho^(z - a_g) < oo . $ <eq:promotion-count>]
  Damping of stored particles can be discarded for this upper bound.
    The Schur weight contributes $v^(b_g - a_g)$, promotion coefficients contribute $V_g^(- a_g)$,
    and fresh integrations have mass $tilde(mu)_g \( cal(P)_g \)^(t_g - a_g) lt.eq 2^(t_g)$ for large $x$.
    There are at most $4^(t_g)$ choices of transfer subsets. Each cost is bounded by a constant per group,
    independent of $J$. Small transitions satisfy (3.5). Multiplying over groups,
    averaging permutations and free labels, and summing (3.2) proves the row bound.
  For the column, use (3.23), (3.25) in reverse. Original stores are now ordered retrievals.
    Their count is controlled by the original input $rho$ factors after reversed translation,
    in exactly the form in (3.26). The remaining factor $V_g^(b_g - a_g)$ is bounded per group.
    This proves the column bound. Restrictions and local multipliers of modulus at most one are dominated by these
    absolute kernels. ◻
]

We now restrict the total memory size to

#[#set math.equation(numbering: n => "(3.27)")
 $ B = ceil.l L^2 ceil.r $ <eq:memory-truncation>]

before and after every operation, writing the projections implicitly.
  At most $\( ell + m \) \| cal(B) \| N$ particles can be supplied by stores.
  Thus a path violating this restriction has at least $B - O \( \( ell + m \) s N \)$ ghost births.
  Multiply every ghost birth by two in the absolute path sum and use the preceding bounds.
  The total omitted mass, even with the distinct-birth indicator, is at most

#[#set math.equation(numbering: n => "(3.28)")
 $ 2^(- B + O \( \( ell + m \) s N \)) L^(O \( N \)) = exp \( - Omega \( L^2 \) \) =
   o \( L^(- A N) \) $ <eq:memory-tail>]

for every fixed $A$. The empty-memory boundary vector has bounded norm:
  the small part has mass at most one by (3.10), and the big part has mass

$ product_(g in cal(B)) tilde(mu)_g \( cal(P)_g \)^M = 1 + O_J \( s N \/ P_(*) \) = 1 + o \( 1 \) . $

These estimates also prove absolute summability before truncation,
  for instance by first restricting all batch sizes and then applying monotone convergence to absolute kernels.

=== 3.6 Rare transfers and the role of the small groups <rare-transfers-and-the-role-of-the-small-groups>

It remains to obtain a small signed edge norm and then restore the omitted distinct-birth rule.
  Decompose each edge as $cal(E)_i = cal(E)_(i \, upright("clean")) + cal(E)_(i \, upright("dirty"))$:
  a term is #emph[dirty] if it has at least one store or promotion, and #emph[clean] otherwise.
  Dirty terms connect memory to the active lists; we suppress them by averaging the omitted small labels.
  Clean terms only translate memory residues and refresh unshared active labels;
  the next subsection will reduce their norm to the ideal estimate. Define

#[#set math.equation(numbering: n => "(3.29)")
 $ cal(D) = binom(M, ell)^(\| cal(S) \|) . $ <eq:small-omission-number>]

#thm([Lemma 3.9.])[
  (Rare transfer).  #emph[With the memory truncation in (3.27),
    the aggregate of all dirty terms of any edge has norm at most
#[#set math.equation(numbering: n => "(3.30)")
 $ 2 L^(C_a) (B / cal(D))^(1 \/ 2) \, $ <eq:dirty-norm>]

 after enlarging $C_a$ independently of $J$ if necessary.]
] <lem:rare-transfer>

#proof[
  First consider the positive sum of terms with a promotion.
    Fix its source, pattern, big-group permutations and shared choices, and free $D$-labels.
    For some one of its at most $B$ old pending particles $\( p \, r \)$, promotion requires
  #[#set math.equation(numbering: n => "(3.31)")
   $ r + sigma_i k D_(cal(B)) D_(cal(S)) equiv 0 med \( mod med p \) \, wide
     p divides.not D . $ <eq:promotion-congruence>]
  In each small group the source symmetrization omits an independent uniformly chosen $ell$-subset of its $M$
    distinct labels. If $F$ is the full product of all small source labels and $U$ the product of the omitted
    labels, then $D_(cal(S)) = F \/ U$. Unique factorization and disjointness of groups show that the $cal(D)$
    choices give distinct positive integers $U$. Moreover,
  $ U lt.eq exp \( ell \| cal(S) \| L^b \) < exp \( L^c \) lt.eq p $
  for sufficiently large $x$. They are therefore distinct modulo $p$.
    The quantities $F \, k \, D_(cal(B))$ are invertible modulo every $p$ eligible in (3.31).
    Hence each pending particle allows at most one omission choice.
    At most $B$ of the $cal(D)$ equally likely choices allow any promotion.
  Conditional on every omission choice, the remaining weighted row costs are uniformly bounded by the proof of 20.
    Thus the promotion part improves its row bound to $L^(C_a) B \/ cal(D)$,
    while its column bound remains $L^(C_a)$. Schur’s test gives the first half of (3.30).
    Terms with stores and no promotion have the same improvement in their column bound by reversing the edge:
    a stored particle becomes a retrieval from output memory.
    The exclusion $p divides.not D$ is retained under reversal,
    even when numerical coincidences have been allowed. Add these two bounds. ◻
]

The coefficient restriction to big labels is used here: conditioning on all such labels does not bias the small
  omission choices. In particular,

#[#set math.equation(numbering: n => "(3.32)")
 $ 2 L^(C_a) sqrt(B \/ cal(D)) lt.double L^(C_a + 1 - \( c_0 \/ 2 \) log binom(J + ell, ell)) . $ <eq:dirty-J-gain>]

An arbitrarily strong fixed saving is obtained by increasing $J$, without changing the ideal norm target.

=== 3.7 Clean edges and Fourier reduction <clean-edges-and-fourier-reduction>

#thm([Lemma 3.10.])[
  (Clean norm).  #emph[There is $C_s$, depending only on the fixed data in 13,
    such that the clean part of every edge satisfies
#[#set math.equation(numbering: n => "(3.33)")
 $ lr(bar.v.double cal(E)_(i \, upright("clean")) bar.v.double) lt.eq 2 L^(- E_(upright("id")) + C_s) $ <eq:clean-norm>]

 for all sufficiently large $x$, under (3.6). In particular $C_s$ is independent of $m \, C_1 \, J$.]
] <lem:clean-norm>

#proof[
  A clean edge leaves all memory prime lists and sizes unchanged, translates their residues,
    drops every unshared big source slot, and fills every unshared big target slot freshly.
    Its input and output $rho$ factors and its memory projections are contractions.
    They commute with active-list symmetrizations. Absorb these factors and the symmetrizations into the two test
    vectors $w_1 \, w_2$. These vectors remain symmetric in the big active lists.
  Fix an ordered tuple $upright(bold(d))$ of $J$ shared labels in each small group and let $d'$ denote their joint
    product. Define a map to unrestricted small residue functions by
  #[#set math.equation(numbering: n => "(3.34)")
   $ \( P_(upright(bold(d))) w \) \( y \) = (product_(g in cal(S)) V_g^(- J \/ 2 - ell))
     q^(1 / 2 sum_(g in cal(S)) \( omega_g \( y \) - M \))
     sum_(upright(bold(R)) : med \( upright(bold(d)) \, upright(bold(R)) \) upright(" a small state at ") y)
     w \( y \, \( upright(bold(d)) \, upright(bold(R)) \) \) . $ <eq:small-conditioning-map>]
  All other coordinates are left untouched. The map is zero when the displayed list is not a small state,
    so the damping is used only where $omega_g \( y \) gt.eq M$.
    The two endpoint factors in (3.34) give $V_g^(- J - 2 ell) = V_g^(- M - ell)$,
    exactly the physical joint normalization.
  By Cauchy’s inequality in $upright(bold(R))$, followed by summation over $upright(bold(d))$, one has
  #[#set math.equation(numbering: n => "(3.35)")
   $ sum_(upright(bold(d))) lr(bar.v.double P_(upright(bold(d))) w bar.v.double)^2 lt.eq
     L^(C_s) lr(bar.v.double  bar.v.double) w^2 . $ <eq:small-map-norm>]
  To see the independence of $J$, the multiplier relative to the original small state measure in group $g$ is bounded by
  $ sup_(z gt.eq M) q^(z - M) frac(\( z - M + ell \)_ell, V_g^ell) \, $
  a constant depending only on $q \, ell \, v_(-)$. Taking products over $O \( T \)$ groups proves (3.35).
  The clean bilinear form is now exactly
  #[#set math.equation(numbering: n => "(3.36)")
   $ sum_(upright(bold(d))) chevron.l P_(upright(bold(d))) w_1 \,
     cal(T)'_(upright(bold(d))) P_(upright(bold(d))) w_2 chevron.r . $ <eq:clean-conditioned-form>]
  The operator between these maps uses the big-list transitions and translates all unrestricted small and memory
    residues by $sigma_i k d' D_(cal(B))$. Fix the memory sizes and their prime lists.
    Fourier transformation on the finite abelian group consisting of the small residue torus and the pending
    residue coordinates diagonalizes these translations. Counting measure on pending residues and Haar measure on
    the small torus each have the usual unitary finite Fourier transform.
    One can first use ordered memory representatives; restriction to symmetric functions preserves the bound.
    Big active-list symmetry is unaffected.
  At any fixed Fourier frequency, translation and the closure factor contribute
  $ e #h(-0.16667em) (sigma_i Theta D_(cal(B))) $
  for a real $Theta$ depending on $upright(bold(d))$, the memory prime list, the frequency, and $theta$,
    but independent of the variable big active labels. The scalar factor $\( d' \)^(sigma_i i zeta)$ has modulus
    one. Consequently the remaining operator, on symmetric big active tests,
    is $cal(T) \( Theta \)$ or its adjoint, with two changes only:
    the measures of active labels and fresh target integrations are $tilde(mu)_g$ in place of $mu_g$,
    and the free/active collision ban remains in force.
  Both changes are negligible in operator norm. Across the $M \| cal(B) \|$ active coordinates,
    the product density changes by
  $ 1 + O_J \( s N \/ P_(*) \) . $
  The corresponding square-root density identification is unitary between the two $L^2$ spaces and commutes with
    symmetrization. Fresh integration densities obey the same bound.
    The ideal absolute row and column sums are at most $L^(C_1)$ before these changes,
    since all its unrestricted fresh laws are probabilities. Schur’s test therefore bounds the density
    perturbation by $O_J \( L^(C_1) s N \/ P_(*) \)$.
  For the ban, in either row direction condition on the fixed active state.
    Each free auxiliary draw has maximal atom $O \( 1 \/ P_(*) \)$;
    its chance to match a fixed active label is bounded by that quantity.
    A match to a fresh opposite unshared label has the same bound by independence.
    There are $O_(J \, m) \( s \)$ possible comparisons. Reversal has the same estimate.
    Thus removing the banned transitions costs $O_(J \, m) \( L^(C_1) s \/ P_(*) \)$ in norm.
    These estimates are $o \( L^(- A) \)$ for every fixed $A$.
    They do not require exclusion of coincidences with pending labels:
    such labels are fixed in the Fourier decomposition and are already accounted for by translation.
  It follows uniformly in $upright(bold(d))$ that the between-map norm is at most $2
    L^(- E_(upright("id")))$ for large $x$. Apply Cauchy’s inequality to (3.36) and then (3.35); this proves (3.33). ◻
]

Choose, in this order,

#[#set math.equation(numbering: n => "(3.37)")
 $ G > E + C_v + 3 \, wide E_(upright("id")) > G + C_s + 2 \, $ <eq:transference-parameter-choice>]

and finally choose the fixed integer $J$ so large that (3.32) is smaller than $1 / 2 L^(- G)$ for large $x$.
  For example it suffices that

$ c_0 / 2 log binom(J + ell, ell) > C_a + G + 3 . $

The clean estimate supplies the other half. Hence the whole signed truncated edge,
  with birth distinctness still omitted, satisfies

#[#set math.equation(numbering: n => "(3.38)")
 $ lr(bar.v.double cal(E)_i bar.v.double) lt.eq L^(- G) . $ <eq:whole-edge-contraction>]

Only this final choice of $J$ needs to depend on $m \, C_1$.
  This establishes the required quantifier order, but a further argument is necessary to impose distinct births
  without losing the signed contraction on every edge.

=== 3.8 Restoring distinct births by equality rank <restoring-distinct-births-by-equality-rank>

A single absolute collision estimate cannot finish the proof:
  one reciprocal-prime saving $P_(*)^(- 1)$ does not absorb a length-$N$ absolute path cost $L^(O \( N \))$.
  Instead, expand the global distinctness condition by equalities between birth values.
  Many independent equalities yield many point-mass savings.
  A small number of independent equalities can be imposed by phases at their birth operations,
  preserving the signed contraction on all the other edges.

In the truncated evolution allocate potential birth addresses as follows:
  initial big slots; every possible big target slot at every edge,
  in its canonical order before final symmetrization; and indices $1 \, dots.h \,
  B$ in each group’s ordered ghost batch at each visit. A target slot is performed as an address precisely when it
  is a fresh birth rather than shared or promoted. A ghost address is performed precisely when its batch is at
  least that large. These are conditions on the choices made in their single local operation.
  The number $A_(*)$ of potential addresses satisfies

#[#set math.equation(numbering: n => "(3.39)")
 $ A_(*) lt.eq M \| cal(B) \| \( N + 1 \) + \( N + 1 \) \| cal(B) \| B = L^(O \( 1 \)) . $ <eq:birth-address-count>]

The implied exponent can be taken independent of $J$ once $x$ is sufficiently large for fixed $J$.

We use the following elementary form of distinctness inclusion-exclusion.
  Sum over collections $pi$ of disjoint blocks of potential addresses, every block having size at least two.
  Let $cal(C)_pi$ require that all addresses in those blocks be performed and that the prime values within each
  block be equal. Set

#[#set math.equation(numbering: n => "(3.40)")
 $ mu \( pi \) = product_(B' in pi) \( - 1 \)^(\| B' \| - 1) \( \| B' \| - 1 \) ! \, wide r \( pi \) =
   sum_(B' in pi) \( \| B' \| - 1 \) . $ <eq:distinct-birth-expansion>]

For a fixed realized path,

#[#set math.equation(numbering: n => "(3.41)")
 $ upright(bold(1))_(upright("distinct performed birth values")) =
   sum_pi mu \( pi \) upright(bold(1))_(cal(C)_pi) . $ <eq:distinct-indicator>]

To verify this, interpret a block of size $h$ as a cycle on its $h$ addresses:
  there are $\( h - 1 \) !$ such cycles, each with sign $\( - 1 \)^(h - 1)$.
  The right side is the sum of signs of permutations of the performed addresses which preserve their numerical
  prime values. It factors over equal-value classes. The sign sum is one for a singleton class and zero for any
  class of size at least two, by pairing permutations with their product by a fixed transposition.

A rank-$r$ collection involves at most $2 r$ addresses. More precisely its total absolute coefficient,
  summed over all collections of rank $r$, obeys

#[#set math.equation(numbering: n => "(3.42)")
 $ sum_(r \( pi \) = r) \| mu \( pi \) \| lt.eq A_(*)^(2 r) lt.eq L^(C' r) . $ <eq:rank-coefficient-count>]

For instance the unsigned cycle generating polynomial on $A_(*)$ addresses is
  $product_(j = 0)^(A_(*) - 1) \( 1 + j t \)$, where the power of $t$ is the sum of cycle lengths minus the number
  of cycles. Its coefficient of $t^r$ is at most $\( sum_j j \)^r \/ r ! lt.eq A_(*)^(2 r)$.

===== 3.8.1 Large rank: chronological fresh integrations. <large-rank-chronological-fresh-integrations.>

Fix $pi$. Order birth addresses chronologically, using canonical slot order inside an edge or batch,
  and call the first address in each block its pivot. Every other address is a dependent birth.
  When such an address is performed, its fresh prime integration is constrained to the already determined pivot
  value. Since

#[#set math.equation(numbering: n => "(3.43)")
 $ sup_(g in cal(B) \, p in cal(P)_g) tilde(mu)_g \( p \) lt.double P_(*)^(- 1) \, $ <eq:tilted-point-mass>]

this improves the weighted absolute row bound by $O \( P_(*)^(- 1) \)$ per dependent birth.

Here the chronological assertion uses genuinely fresh integrations.
  At an edge choose stores, promotions, and the step first, and then fill fresh target slots in canonical order.
  The step, promotion count, and memory weight do not depend on these new prime values;
  the coefficient is bounded by its supremum and exclusions may be discarded.
  In the proof of 20, replace the total fresh mass in each constrained slot by its single-point bound.
  For a ghost operation keep its ordered batch integral and factorial divisor;
  constraining indicated fresh coordinates replaces their mass factors by the same single-point bound.
  The birth coefficient $V_g$ and the memory weight only give fixed constants per constrained coordinate.
  Initial active slots satisfy the same product estimate. Pivots and dependents within one operation are handled
  in their prescribed integration order.

For completeness, these conditional row bounds can be iterated although a pivot may have died before its dependent
  birth. Retain all pivot values in the conditioning. Bound the remaining terminal sum by backward induction using
  the uniform weighted row bounds for every possible conditioning, beginning with $upright(bold(1))_diameter lt.eq
  w$. Whenever a dependent birth is reached, the preceding point-mass improvement is uniform in its retained pivot
  value. At the initial boundary $w = 1$, and the remaining integrated boundary mass is bounded.
  Thus the total absolute contribution for this fixed collection is at most

#[#set math.equation(numbering: n => "(3.44)")
 $ L^(C_h \( N + 1 \)) \( C \/ P_(*) \)^(r \( pi \)) \, $ <eq:high-rank-path-bound>]

for fixed $C_h \, C$; both may depend on $m \, C_1$.

Choose a sufficiently large fixed $C''$, after these constants and $C'$, and set

#[#set math.equation(numbering: n => "(3.45)")
 $ r_0 = ⌈frac(C'' N T, log P_(*))⌉ . $ <eq:rank-threshold>]

By (3.42) and (3.44), the sum over $r gt.eq r_0$ is bounded by

$ L^(C_h \( N + 1 \)) sum_(r gt.eq r_0) \( C L^(C') \/ P_(*) \)^r = o \( L^(- E N) \) . $

Indeed $log P_(*) = L^c gt.double T$, and increasing $C''$ beats the fixed exponent $C_h + E$.

===== 3.8.2 Small rank: phases only at the affected births. <small-rank-phases-only-at-the-affected-births.>

For a block with pivot $beta_0$ and other addresses $beta_1 \, dots.h \, beta_(h - 1)$,
  equality of the integer prime values has the exact representation

#[#set math.equation(numbering: n => "(3.46)")
 $ upright(bold(1))_(p_(beta_j) = p_(beta_0) med \( 1 lt.eq j < h \)) =
   integral_(\[ 0 \, 1 \]^(h - 1)) e #h(-0.16667em) (sum_(j = 1)^(h - 1) tau_j \( p_(beta_j) - p_(beta_0) \)) thin
   d bold(tau) \, $ <eq:birth-equality-fourier>]

on paths performing all these addresses. For fixed Fourier parameters,
  collect the factors by their birth operation. Each affected operation is multiplied,
  on its individual local choices, by

$ upright(bold(1))_(upright("designated local births are performed")) e #h(-0.16667em)
  (sum_(beta med upright("local")) c_beta p_beta) \, $

of modulus at most one. Initial-slot factors merely modify the initial boundary vector by such a multiplier.
  An affected edge can lose its signed norm saving, but 20 bounds its new norm by $L^(C_a)$.
  Unaffected edges retain their complete signed pattern sum and both symmetrizations, so (3.38) still applies.

The ordered indices in a ghost batch do not require ordered-memory functions.
  For a batch of size $b$, insert its local multiplier $phi.alt_b \( p_1 \, dots.h \, p_b \)$ inside the existing
  $1 \/ b !$ product integral in (3.16). The rest of that integral is symmetric in its fresh variables,
  so its value is unchanged on replacing $phi.alt_b$ by

$ frac(1, b !) sum_(sigma in S_b) phi.alt_b \( p_(sigma \( 1 \)) \, dots.h \, p_(sigma \( b \)) \) . $

This average has modulus at most one, also on numerical diagonals.
  The resulting operator acts on symmetric memories, and its reversed multiplier is the conjugate on the
  corresponding deleted batch in (3.19). Its absolute row and column bounds remain (3.22).
  In particular no phase has to follow a particle through later storage, propagation, or promotion:
  equality was encoded entirely at its two birth addresses.

At most $2 r$ edges are affected by a rank-$r$ collection.
  The boundary norms are bounded, and all $N + 1$ ghost operations cost at most $L^(C_v)$.
  Therefore its Fourier-integrated contribution is at most

#[#set math.equation(numbering: n => "(3.47)")
 $ O (L^(\( - G + C_v \) N + C_v + 2 r \( G + C_a \))) . $ <eq:low-rank-path-bound>]

Since

$ r_0 / N = O \( T \/ L^c \) + O \( N^(- 1) \) = o \( 1 \) \, $

the sum over $r < r_0$, with the coefficient bound (3.42), is

$ L^(\( - G + C_v + o \( 1 \) \) N) = o \( L^(- E N) \) $

by (3.37).

Thus the high-rank terms are controlled by their fresh-label costs,
  while the low-rank terms retain signed contraction on $N - o \( N \)$ edges.
  Together they bound the expansion with distinct births, which is the expression required by 19.

#proof[
  #emph[Completion of 17.] Apply (3.41) in the truncated memory identity.
    The large- and small-rank estimates bound it by $o \( L^(- E N) \)$, uniformly in $theta$.
    Restore the tail (3.28); multiply by the baseline, which is at most one; and integrate (3.11).
    Finally restore the uniform residue-replacement error, choosing its precision after the absolute path bound.
    The result is $o \( L^(- E N) \)$, and therefore (3.7) for sufficiently large $x$.
    The choice of $E_(upright("id"))$ in (3.37) depends only on $E \, C_v \, C_s$,
    and the dependence of these constants was stated above. This completes the proof with the asserted quantifiers. ◻
]

=== 3.9 The endpoint pairing consequence <the-endpoint-pairing-consequence>

We now convert the root moment into the pairing estimate used in 5.
  Constancy on a mark fiber is needed only at the first endpoint;
  the second endpoint can be any vector with the stated norm.

#thm([Corollary 3.11.])[
  #emph[Under the hypotheses and choices of 17, let $f in cal(H)_(upright("ph"))$ be supported on positions
    $I = \[ X \, 2 X \)$ and independent of the chosen marks, with value $f_n$ at position $n$. Suppose
$ sup_(n in I) \| f_n \| lt.eq exp \( O \( sqrt(L) \) \) \, wide lr(bar.v.double  bar.v.double) f \,
  lr(bar.v.double  bar.v.double) g lt.eq X^(1 \/ 2) L^(C_3) . $

 Then
#[#set math.equation(numbering: n => "(3.48)")
 $ \| chevron.l f \, cal(A) g chevron.r \| lt.double X L^(- E + 2 C_3) . $ <eq:transference-pairing>]

 Only the first endpoint must be independent of its mark list.]
] <cor:transference-pairing>

#proof[
  Let $H gt.eq 1$ bound every displacement $\| k D \|$. Since $D$ has $J s$ factors, all at most $exp \( L^d \)$,
  #[#set math.equation(numbering: n => "(3.49)")
   $ log H = O_J \( T L^d \) . $ <eq:maximum-graph-step>]
  Partition $I$ into consecutive intervals $I_j$ of length $ceil.l H ceil.r$, except possibly the last.
    Put $f_j = upright(bold(1))_(I_j) f$ and restrict $g$ to the $H$-neighborhood of $I_j$ to obtain $g_j$.
    These neighborhoods have bounded overlap, and
  $ chevron.l f \, cal(A) g chevron.r = sum_j chevron.l f_j \, cal(A) g_j chevron.r \, wide
    sum_j lr(bar.v.double g_j bar.v.double)^2 lt.double lr(bar.v.double  bar.v.double) g^2 . $
  For $B_0 = cal(A) cal(A)^(*) gt.eq 0$, spectral Hölder gives
  $ \| chevron.l f_j \, cal(A) g_j chevron.r \| lt.eq lr(bar.v.double g_j bar.v.double)
    lr(bar.v.double f_j bar.v.double)^(1 - 1 \/ R) chevron.l f_j \, B_0^R f_j chevron.r^(1 \/ \( 2 R \)) . $
  The finite matrix $\( chevron.l u_n \, B_0^R u_m chevron.r \)_(n \, m in I_j ∩ bb(Z))$ is positive semidefinite.
    Its largest eigenvalue is at most its trace, so mark independence implies
  $ chevron.l f_j \, B_0^R f_j chevron.r lt.eq (sum_(n in I_j ∩ bb(Z)) \| f_n \|^2) d_j \, wide d_j :=
    sum_(n in I_j ∩ bb(Z)) chevron.l u_n \, B_0^R u_n chevron.r . $
  There is no assertion here that the $u_n$ have equal norm,
    or that ordered lists return to their starting values. By (3.49),
  $ (O \( H \) sup \| f_n \|^2)^(1 \/ \( 2 R \)) = exp (O_J (frac(T L^d + sqrt(L), L^0.52))) = O \( 1 \) . $
  Sum the resulting block bounds by Hölder with exponents $2$, $2 R \/ \( R - 1 \)$, and $2 R$. This gives
  $ \| chevron.l f \, cal(A) g chevron.r \| lt.double lr(bar.v.double  bar.v.double) g thin
    lr(bar.v.double  bar.v.double) f^(1 - 1 \/ R) (sum_j d_j)^(1 \/ \( 2 R \)) . $
  The theorem bounds the last sum by $\| I ∩ bb(Z) \| L^(- 2 R E) lt.double X L^(- 2 R E)$.
    Substitution of the two endpoint norm bounds proves (3.48);
    the extra factor $L^(- C_3 \/ R)$ is bounded for fixed $C_3$. ◻
]

== 4 Small ideal kernels at every frequency <sec:ideal>

We use the groups and probability measures of 3. In this section each big group $cal(P)_g$, $g in cal(B)$,
  is the set of primes in an interval contained in $\[ exp \( L^c \) \, exp \( L^d \) \]$.
  In particular, intersecting a group with a further interval again gives an interval of primes.
  This additional assumption allows us to use 4 with one label varying and all other labels fixed.

#thm([Theorem 4.1.])[
  (Construction of the residual ideal operator).  #emph[Fix $E_(upright("id")) >
    0$ and a fixed frequency exponent $C_4 gt.eq 0$. There are fixed integers $m \,
    J_0$ and a fixed constant $C_1$, depending only on these parameters, $ell$, and the prime-group bounds,
    with the following property. For every fixed $J gt.eq J_0$, there is a family consisting of the raw pattern
$ C_g = diameter quad upright("for every ") g \, wide K_0 = 1 \, $

 and signed comparison patterns satisfying
$ C_g = diameter med \( g in cal(S) \) \, wide \| C_g \| lt.eq m med \( g in cal(B) \) \, wide
  sum_nu sup \| K_nu \| lt.eq L^(C_1) \, $

 such that the symmetrized ideal operator of 3 satisfies
#[#set math.equation(numbering: n => "(4.1)")
 $ sup_(Theta in bb(R) \, med \| zeta \| lt.eq L^(C_4))
   lr(bar.v.double cal(T) \( Theta \) bar.v.double)_(2 arrow.r 2) lt.eq L^(- E_(upright("id"))) $ <eq:ideal-small-norm>]

 for sufficiently large $x$. The coefficients and the family are independent of $Theta$ and of the individual
   value of $zeta$. Their defining parameters are independent of $J$;
   $J$ only supplies the available shared slots. The threshold for $x$ may depend on $J$.]
  #emph[More precisely, designate $m$ of the first $J$ slots in each big group as probes,
    and split the big groups into two blocks. Each comparison frees nonempty sets $A$ and $B$ of designated probes
    in the respective blocks, and its coefficient has the form
#[#set math.equation(numbering: n => "(4.2)")
 $ - \( - 1 \)^(\| A \| + \| B \|) cal(K)_A \( D_A \, X_A \) cal(K)_B \( D_B \, X_B \) .
   $ <eq:ideal-comparison-coefficient>]

 Here $D_A \, D_B$ are the products of the free labels used to form $D$,
   $X_A$ is the product of the target labels in $A$, and $X_B$ the product of the input labels in $B$.
   These coefficients use no shared labels and none of the last $ell$ labels.
   Each kernel is a finite sum of products of matched log-cell indicators and pairs of Dirichlet characters of
   conductor bounded by a fixed power of $L$.]
] <thm:ideal>

The construction separates an approximation from a cancellation.
  We first build kernels that replace selected shared products by independent products in a bilinear pairing,
  for each prescribed fixed error exponent. The tests may depend on the entire ordered label tuples,
  as they will when we condition on the labels outside the freed slots.

The cancellation then decomposes the input test in the first-block probes and the target test in the second-block
  probes. Each decomposition is orthogonal: its pieces are mean zero in a specified set of these probe coordinates
  and independent of the others. Freeing $A$ averages the source coordinates in $A$,
  and freeing $B$ averages the target coordinates in $B$; the asymmetric coefficient above leaves these
  coordinates absent from the multiplier. Thus only components independent of the freed coordinates survive.
  Alternating subset signs cancel every pair for which the input component is independent of at least one
  first-block probe and the target component is independent of at least one second-block probe.
  Every remaining pair contains a component that is mean zero in every probe of one block.
  Such components have small norms by permutation symmetry and the averaging of the last $ell$ coordinates.
  We prove this cancellation after the comparison estimate, so that its use on conditional tuple tests is explicit.

All label tuples in the next three subsections have their product probability measure, with repetitions allowed.

=== 4.1 Products of labels and an elementary bilinear bound <products-of-labels-and-an-elementary-bilinear-bound>

Let $Lambda$ be a nonempty set of slots, using $k_g lt.eq m$ slots from group $g$,
  and let $P_Lambda$ denote the product of its labels. Disjointness of the prime groups and unique factorization
  give, on the support of this product,

#[#set math.equation(numbering: n => "(4.3)")
 $ rho_Lambda \( n \) := bb(P) \( P_Lambda = n \) = 1 / n product_g
   frac(k_g !, V_g^(k_g) product_(p in cal(P)_g) a_p !) lt.eq L^kappa / n \,\
kappa = C_0 #scale(x: 120%, y: 120%)[\(] log \( m ! \) + m log max \( 1 \, v_(-)^(- 1) \)
  #scale(x: 120%, y: 120%)[\)] \, $ <eq:ideal-product-atom>]

where $a_p$ is the multiplicity of $p$ in $n$. The probability is zero if the prescribed group multiplicities do
  not hold. Indeed, each factor apart from $1 \/ n$ is at most $m ! max \( 1 \, v_(-)^(- 1) \)^m$,
  and there are at most $C_0 T$ big groups. In particular, this exponent does not depend on $J$.

This estimate applies to tests on the entire ordered label tuple.
  If $f$ is any such $L^2$ test, supported where $c_1 U lt.eq P_Lambda lt.eq c_2 U$ for fixed $c_1 \, c_2 > 0$,
  put $a_n = bb(E) \[ f upright(bold(1))_(P_Lambda = n) \]$. Cauchy–Schwarz on each fiber gives

#[#set math.equation(numbering: n => "(4.4)")
 $ sum_n \| a_n \|^2 lt.eq sum_n rho_Lambda \( n \) bb(E) \[ \| f \|^2 upright(bold(1))_(P_Lambda = n) \] lt.eq
   frac(L^kappa, c_1 U) lr(bar.v.double  bar.v.double) f_2^2 . $ <eq:ideal-collapse>]

No assumption that $f$ is a function of the product has been made.

#thm([Lemma 4.2.])[
  (Integer bilinear estimate).  #emph[Let $U \, V gt.eq 1$.
    Suppose $a_n \, b_t$ are supported in integer intervals of lengths at most $C U \, C V$, respectively,
    where $C$ is fixed. If
$ alpha = u \/ r + beta \, wide \( u \, r \) = 1 \, quad r gt.eq 1 \, wide \| beta \| lt.eq r^(- 2) \, $

 then
#[#set math.equation(numbering: n => "(4.5)")
 $ lr(|sum_(n \, t) a_n b_t e #h(-0.16667em) (alpha n t)|) lt.double_C lr(bar.v.double  bar.v.double) a_(ell^2)
   lr(bar.v.double  bar.v.double) b_(ell^2) [U + \( 1 + V \/ r \) { U + r log \( 2 r \) }]^(1 \/ 2) .
   $ <eq:integer-bilinear>]

 The containing intervals need not begin at $1$, and the coefficients may vanish on arbitrary subsets of them.]
] <lem:bilinear>

#proof[
  Extend the coefficients by zero to their containing intervals.
    Cauchy–Schwarz in $n$, followed by expansion of the square and the geometric-sum bound on the full interval of
    $n$, gives
  $ lr(|sum_(n \, t) a_n b_t e #h(-0.16667em) (alpha n t)|)^2 & lt.double_C lr(bar.v.double  bar.v.double)
    a_(ell^2)^2
    (U sum_t \| b_t \|^2 + sum_(1 lt.eq \| h \| lt.eq C V) min { U \, lr(bar.v.double alpha h
    bar.v.double)_(bb(R) \/ bb(Z))^(- 1) } sum_t \| b_t b_(t + h) \|)\
 & lt.double_C lr(bar.v.double  bar.v.double) a_(ell^2)^2 lr(bar.v.double  bar.v.double) b_(ell^2)^2
   (U + sum_(1 lt.eq h lt.eq C V) min { U \, lr(bar.v.double alpha h bar.v.double)_(bb(R) \/ bb(Z))^(- 1) }) . $
  At a zero denominator the minimum is interpreted as $U$. For $r gt.eq 2$,
    split the $h$-range into $O_C \( 1 + V \/ r \)$ consecutive blocks, each of diameter at most $r \/ 2$.
    If $h eq.not h'$ belong to a block, their difference is nonzero and has magnitude less than $r$, so
  $ lr(bar.v.double alpha \( h - h' \) bar.v.double)_(bb(R) \/ bb(Z)) gt.eq
    lr(bar.v.double u \( h - h' \) \/ r bar.v.double)_(bb(R) \/ bb(Z)) - frac(\| h - h' \|, r^2) gt.eq frac(1, 2 r) . $
  Thus the phases in a block are $1 \/ \( 2 r \)$-separated on the circle.
    Ordering them by distance from zero bounds their contribution by
  $ O_C (U + sum_(1 lt.eq j lt.eq 2 r) r / j) = O_C #scale(x: 120%, y: 120%)[\(] U +
    r log \( 2 r \) #scale(x: 120%, y: 120%)[\)] . $
  For $r = 1$, the trivial bound $O_C \( U V \)$ for the whole sum gives the asserted estimate. This proves the lemma. ◻
]

For two independent selected products of sizes $U \, V$, combining (4.4),
  (4.5) shows that the probability-space bilinear form with phase $e #h(-0.16667em) (alpha P_A P_B)$ has norm at most

#[#set math.equation(numbering: n => "(4.6)")
 $ C L^kappa (1 / V + 1 / r + frac(log \( 2 r \), U) + frac(r log \( 2 r \), U V))^(1 \/ 2) .
   $ <eq:ideal-probability-bilinear>]

The same assertion holds with the phase multiplied by $\( P_A P_B \)^(i zeta)$ for any real $zeta$,
  since this factor separates between the two tests and preserves their norms.

=== 4.2 Log cells and conditional character operators <log-cells-and-conditional-character-operators>

For a fixed nonempty slot set $Lambda$, let $D \, X$ be independent products of label tuples of this type.
  Given $Q gt.eq 1$, $0 < h lt.eq 1$, and $0 < xi lt.eq 1$, put

$ I_j = \[ j h \, \( j + 1 \) h \) \, wide nu_(Lambda j) = bb(P) \( log D in I_j \) \, wide cal(C)_Q = { chi :
  chi upright(" primitive") \, med "cond" chi lt.eq Q } . $

The conductor-$1$ character is included. Define

#[#set math.equation(numbering: n => "(4.7)")
 $ cal(K)_Lambda \( D \, X \) = sum_(j : nu_(Lambda j) gt.eq xi)
   frac(upright(bold(1))_(log D in I_j) upright(bold(1))_(log X in I_j), nu_(Lambda j)) sum_(chi in cal(C)_Q)
   overline(chi \( D \)) chi \( X \) . $ <eq:ideal-cell-kernel>]

We use $cal(K)_A \, cal(K)_B$ for the corresponding slot sets. All powers of $L$ chosen below are fixed before $J$.

There are at most $Q^2$ characters in $cal(C)_Q$. The number $N_Lambda$ of cells of positive mass satisfies

#[#set math.equation(numbering: n => "(4.8)")
 $ N_Lambda lt.double_m 1 + T L^d \/ h \, wide sup \| cal(K)_Lambda \| lt.eq Q^2 xi^(- 1) \, wide
   sup_X bb(E)_D \| cal(K)_Lambda \( D \, X \) \| lt.eq Q^2 . $ <eq:ideal-cell-costs>]

The last inequality follows because, for fixed retained $X$,
  the mass $nu_(Lambda j)$ of its cell cancels the denominator.
  The kernel is zero for discarded $X$ and has support only where $\| log D - log X \| < h$.

We record explicitly the character estimate under a cell restriction.
  If $Q$ is a fixed power of $L$ and $chi \, chi'$ are distinct members of $cal(C)_Q$, then,
  for every fixed $D_(*) > 0$,

#[#set math.equation(numbering: n => "(4.9)")
 $ lr(|bb(E) [upright(bold(1))_(log D in I_j) overline(chi \( D \)) chi' \( D \)]|) lt.double_(D_(*))
   L^(- D_(*)) \, $ <eq:ideal-character-cell>]

uniformly in $j$ and in the nonempty slot set with at most $m$ slots per group.
  To see this, hold all but one label fixed. The cell and the selected prime group restrict the remaining prime to
  an interval, possibly empty. The character $overline(chi) chi'$ on the common modulus is nonprincipal:
  otherwise the uniqueness of primitive induction would imply $chi = chi'$. Its modulus is at most $Q^2$.
  For every fixed $K$, 4, summed against the character over reduced residue classes and applied with a larger
  accuracy exponent, gives

$ A_rho \( t \) := sum_(p lt.eq t) rho \( p \) lt.double_K t \( log t \)^(- K) $

for these nonprincipal characters, uniformly for $t gt.eq y := exp \( L^c \)$.
  The allowed modulus is a fixed power of $log y$, as required there.
  Partial summation on any subinterval of $\[ y \, exp \( L^d \) \]$ bounds its reciprocal-prime sum by

$ O_K (\( log y \)^(- K) + integral_y^oo frac(d t, t \( log t \)^K)) =
  O_K #scale(x: 120%, y: 120%)[\(] \( log y \)^(1 - K) #scale(x: 120%, y: 120%)[\)] . $

Divide by $V_g gt.eq v_(-)$ and choose $K$ sufficiently large in terms of $D_(*)$.
  Averaging the other labels proves (4.9); its precision is independent of the width or location of the interval.

For a retained cell of mass $nu$, the integral operator defined by (4.7) is the character frame operator on the
  conditional probability space:

#[#set math.equation(numbering: n => "(4.10)")
 $ f mapsto sum_(chi in cal(C)_Q) chi thin chevron.l chi \,
   f chevron.r_(L^2 \( bb(P) \( dot.op divides I_j \) \)) . $ <eq:ideal-frame>]

Its nonzero eigenvalues are those of the character Gram matrix.
  Every diagonal entry is $1$, since all selected primes exceed $Q^2$ for large $x$.
  By (4.9), every off-diagonal entry is $O_(D_(*)) \( xi^(- 1) L^(- D_(*)) \)$.
  The Gram matrix therefore has norm at most

#[#set math.equation(numbering: n => "(4.11)")
 $ 1 + O_(D_(*)) \( Q^2 xi^(- 1) L^(- D_(*)) \) lt.eq 2 $ <eq:ideal-gram-bound>]

once the character precision has been chosen sufficiently large.
  Passing from the conditional to the original measure multiplies both squared norms by $nu$,
  so the operator norm is unchanged. Different cells are orthogonal blocks,
  and discarded cells have zero operator. Consequently kernel integration on the full label space has norm at most
  $2$. The adjoint and transpose have the same bound, so the integration may be moved onto either test in a
  bilinear form. In particular neither a cell-count factor nor a factor $xi^(- 1)$ is lost in this operator norm.

=== 4.3 Uniform comparison for arbitrary tuple tests <uniform-comparison-for-arbitrary-tuple-tests>

#thm([Lemma 4.3.])[
  (Comparison kernel).  #emph[Fix $m$, $A_0 > 0$, and $C_4 gt.eq 0$.
    There are fixed powers $Q \, h^(- 1) \, xi^(- 1)$ of $L$, independent of $J$,
    such that the kernels in (4.7) have the following property.
    Let $A \, B$ be nonempty sets of slots, using at most $m$ slots per big group.
    Take independent label tuples for $D_A \, X_A \, D_B \, X_B$ with the prescribed slot laws.
    If $f$ and $g$ are arbitrary $L^2$ tests on the tuples making up $X_B$ and $X_A$, respectively,
    then for every $alpha in bb(R)$ and $\| zeta \| lt.eq L^(C_4)$,
#[#set math.equation(numbering: n => "(4.12)")
 $ \| bb(E) thin overline(f \( X_B \)) g \( X_A \) #scale(x: 120%, y: 120%)[\[] & \( X_A X_B \)^(i zeta) e
   #h(-0.16667em) (alpha X_A X_B)\
 & - cal(K)_A \( D_A \, X_A \) cal(K)_B \( D_B \, X_B \) \( D_A D_B \)^(i zeta) e #h(-0.16667em) (alpha D_A D_B)
   #scale(x: 120%, y: 120%)[\]] \| lt.eq L^(- A_0) lr(bar.v.double  bar.v.double) f_2
   lr(bar.v.double  bar.v.double) g_2 . $ <eq:ideal-comparison>]

 Here notation such as $f \( X_B \)$ denotes a tuple test, not an assumption of dependence only on the product.
   The kernels are independent of $alpha$ and $zeta$.]
] <lem:comparison-kernel>

#proof[
  Split the tests according to dyads $X_A in \[ U \, 2 U \)$ and $X_B in \[ V \, 2 V \)$.
    Each selected product lies between $exp \( L^c \)$ and $exp \( m C_0 T L^d \)$;
    thus for sufficiently large $x$ there are at most $L^(d + 1)$ dyads for each product.
    We prove a bound $L^(- B_0)$ on each pair of dyads, with $B_0 > A_0 + 2 \( d + 1 \) + 10$.
    Summing the bounds proves the lemma, even using the crude bound of the original test norm for every dyadic
    restriction.
  Let $Z = U V$ and introduce a further fixed power $S$ of $L$.
    Dirichlet approximation with maximum denominator $floor.l Z \/ S floor.r$ gives a reduced fraction satisfying
  #[#set math.equation(numbering: n => "(4.13)")
   $ alpha = u \/ r + beta \, wide 1 lt.eq r lt.eq Z \/ S \, wide \| beta \| lt.eq r^(- 2) \,
     wide \| beta \| Z lt.eq 2 S \/ r . $ <eq:ideal-dirichlet>]
  Here $Z \/ S arrow.r oo$ and the factor $2$ accounts for the integer part.
    This approximation is used only in the proof: the kernel does not depend on the choice of the rational
    approximation.
  ===== 4.3.1 Denominators larger than $Q$. <denominators-larger-than-q.>
  Suppose $r > Q$. Apply (4.6) to the raw term. For the comparison term,
    move the two separate kernel integrations onto the two tests.
    Their norms increase by at most $2$ each by (4.11). The resulting tests on $D_A \,
    D_B$ are supported in $\[ U \/ 2 \, 4 U \]$ and $\[ V \/ 2 \, 4 V \]$ for large $x$, by the log localization.
    The same bilinear bound therefore applies with an absolute constant change.
    In both uses we collapse arbitrary tuple tests by (4.4) before applying the integer lemma.
  The two scales exceed every fixed power of $L$, and $log \( 2 r \) lt.eq L^(d + 1)$ for large $x$.
    Since $r > Q$ and $r lt.eq U V \/ S$, the bound for either term,
    apart from an absolute constant and the two test norms, is
  #[#set math.equation(numbering: n => "(4.14)")
   $ L^kappa (o \( L^(- A) \) + Q^(- 1) + L^(d + 1) S^(- 1))^(1 \/ 2) $ <eq:ideal-minor-error>]
  for every fixed $A$. Choosing $Q \, S$ sufficiently large gives the required dyadic precision.
    This part is uniform in all real $zeta$, because the Mellin factor separates.
  ===== 4.3.2 Denominators at most $Q$. <denominators-at-most-q.>
  Suppose $r lt.eq Q$. All products under consideration are units modulo $r$.
    Fourier expansion on the finite group of units gives
  #[#set math.equation(numbering: n => "(4.15)")
   $ e #h(-0.16667em) (u v \/ r) = sum_(psi med mod med r) c_psi psi \( v \) \, wide sum_psi \| c_psi \| lt.eq
     sqrt(phi \( r \)) lt.eq sqrt(Q) . $ <eq:ideal-rational-expansion>]
  Indeed, in normalized counting measure the left side has squared norm $1$,
    so Parseval gives $sum \| c_psi \|^2 = 1$ and Cauchy–Schwarz proves the stated bound.
    The unique primitive character inducing $psi$ has conductor at most $r$ and is included in $cal(C)_Q$.
  First remove discarded cells. Their total probability for either product is at most
  #[#set math.equation(numbering: n => "(4.16)")
   $ bb(P) \( cal(E) \) lt.eq \( N_A + N_B \) xi \, wide cal(E) =
     { X_A upright(" or ") X_B upright(" lies in a discarded cell") } . $ <eq:ideal-discarded-mass>]
  The comparison term is zero on this event. The raw term there has absolute value at most
  $ bb(E) \[ upright(bold(1))_(cal(E)) \| f \( X_B \) g \( X_A \) \| \] & lt.eq
    bb(P) \( cal(E) \)^(1 \/ 2) #scale(x: 120%, y: 120%)[\(] bb(E) \| f \( X_B \) g \( X_A \) \|^2
    #scale(x: 120%, y: 120%)[\)]^(1 \/ 2)\
 & = bb(P) \( cal(E) \)^(1 \/ 2) lr(bar.v.double  bar.v.double) f_2 lr(bar.v.double  bar.v.double) g_2 . $
  The last equality uses independence of the two tuple spaces.
    This argument also applies to tests concentrated in a discarded cell;
    it does not assert that restriction to a small event is small as an $L^2$ operator.
  On retained cells, write the remaining scalar multiplier in the log variable as
  $ M \( v \) = exp \( i zeta v \) e #h(-0.16667em) (beta e^v) . $
  On the enlarged product range its derivative has magnitude $O \( L^(C_4) + S \)$, by (4.13).
    Since both matched log products differ by less than $h$, we may replace $M \( log \( D_A D_B \) \)$ by
    $M \( log \( X_A X_B \) \)$ while leaving the rational phase unchanged.
    For each fixed retained pair $\( X_A \, X_B \)$, (4.8) bounds the error after integration in $D_A \, D_B$ by
  #[#set math.equation(numbering: n => "(4.17)")
   $ O #scale(x: 120%, y: 120%)[\(] Q^4 h \( S + L^(C_4) \) #scale(x: 120%, y: 120%)[\)] . $ <eq:ideal-log-error>]
  This is a pointwise error. Pairing it with the tests costs at most the same bound times
    $lr(bar.v.double  bar.v.double) f_2 lr(bar.v.double  bar.v.double) g_2$, since their spaces are independent.
  For a character $psi$ in (4.15), the Gram calculation also gives the following pointwise reproduction formula
    for retained $X$:
  #[#set math.equation(numbering: n => "(4.18)")
   $ bb(E)_D cal(K)_Lambda \( D \, X \) psi \( D \) = psi \( X \) +
     O_(D_(*)) \( Q^2 xi^(- 1) L^(- D_(*)) \) . $ <eq:ideal-character-reproduction>]
  In fact, the summand corresponding to its inducing primitive character is exactly $psi \( X \)$:
    the diagonal conditional expectation is $1$. Each other summand is bounded by (4.9) divided by the
    retained-cell mass. There are at most $Q^2$ such summands.
    Choose $D_(*)$ so that the displayed error is at most $1$.
    Applying the formula on both sides and then (4.15) reproduces $e #h(-0.16667em)
    (u X_A X_B \/ r)$ with pointwise error
  #[#set math.equation(numbering: n => "(4.19)")
   $ O_(D_(*)) \( Q^(5 \/ 2) xi^(- 1) L^(- D_(*)) \) . $ <eq:ideal-major-character-error>]
  Multiplication by the fixed scalar $M \( log \( X_A X_B \) \)$ has modulus one and does not change this error.
    Together, (4.16), (4.17), (4.19) establish the desired comparison on a pair of dyads.
  ===== 4.3.3 A noncircular choice of parameters. <a-noncircular-choice-of-parameters.>
  For completeness the following sufficient inequalities fix all the precisions just used. Write
  $ Q = L^(q_(*)) \, quad S = L^(s_(*)) \, quad h = L^(- h_(*)) \, quad xi = L^(- x_(*)) . $
  After $m \, A_0 \, C_4$ have been fixed, choose successively
  #[#set math.equation(numbering: n => "(4.20)")
   $ B_0 & > A_0 + 2 \( d + 1 \) + 10 \,\
q_(*) \, s_(*) & > 2 \( B_0 + kappa + 10 \) + d + 1 \,\
h_(*) & > 4 q_(*) + max \( s_(*) \, C_4 \) + B_0 + 10 \,\
x_(*) & > 2 B_0 + d + 1 + h_(*) + 10 \,\
D_(*) & > B_0 + x_(*) + 5 / 2 q_(*) + 10 . $ <eq:ideal-parameter-order>]
  Indeed $N_A \, N_B lt.eq L^(d + 1 + h_(*))$ for large $x$.
    The successive lines control, respectively, dyadic summation, (4.14), (4.17), the square root of (4.16),
    and both (4.11), (4.19). Fixed implied constants are absorbed by the margins in these inequalities.
    Finally use 4 at the precision needed for this $D_(*)$. None of these choices involves $J$. ◻
]

=== 4.4 Symmetric probes and exact cancellation <symmetric-probes-and-exact-cancellation>

#proof[
  Split $cal(B)$ into blocks $cal(B)_1 \, cal(B)_2$ of sizes $s_1 \, s_2$ differing by at most one.
    For sufficiently large $x$ each size is at least $c_0 T \/ 3$.
    In each group designate the first $m$ of the first $J$ slots as probes;
    their sets in the two blocks are $cal(I)_1 \, cal(I)_2$. Let $P_i = \| cal(I)_i \| = m s_i$ and $P = P_1 +
    P_2$. For every pair of nonempty subsets $A subset.eq cal(I)_1$, $B subset.eq cal(I)_2$,
    free exactly $A union B$ and use the coefficient in (4.2), with the kernels just constructed.
    The other comparison target slots, including the last $ell$,
    have exactly the independent laws in the ideal operator’s definition.
  It suffices to bound pairings against symmetric vectors $F \, H$,
    since the operator has the orthogonal symmetrizing projection on both sides.
    In every pairing, average out the last $ell$ input and target slots in each group.
    No multiplier uses these coordinates. Denote the resulting functions on the first $J$ coordinates by $F' \,
    H'$. Both operations are contractions. The raw pairing is
  #[#set math.equation(numbering: n => "(4.21)")
   $ R \( F' \, H' \) = bb(E) [overline(F') H' D_(cal(B))^(i zeta) e #h(-0.16667em) (Theta D_(cal(B)))] \,
     $ <eq:ideal-raw-pairing>]
  where input and target use the same first $J$ labels. Its bilinear norm is at most $1$.
  We use the orthogonal product-space decomposition of Efron and Stein #cite(label("EfronStein1981")) Section 2,
    Decomposition Lemma, and then count the components retained by the symmetry and probe constraints.
    For a coordinate $i$, write $E_i$ for averaging its label.
    Decompose $F'$ by the probes in the first block, and $H'$ by those in the second:
  $ F' & = sum_(S subset.eq cal(I)_1) F_S \, & F_S & = product_(i in S) \( 1 - E_i \) product_(i in cal(I)_1 \\ S)
    E_i F' \,\
H' & = sum_(T' subset.eq cal(I)_2) H_(T') \, & H_(T') & =
  product_(i in T') \( 1 - E_i \) product_(i in cal(I)_2 \\ T') E_i H' . $
  These are orthogonal decompositions. The indicated components are separately mean zero in each indicated probe
    and independent of the other probes of their block. Put $F_(upright("full")) =
    F_(cal(I)_1)$ and $H_(upright("full")) = H_(cal(I)_2)$.
  We need the precise effect of having first averaged out the last $ell$ slots.
    In one group, decompose the original symmetric vector on all $M = J +
    ell$ coordinates by the same coordinate averaging projections.
    Among its components on subsets of cardinality $j$, permutation symmetry makes their squared norms equal.
    Requiring all $m$ probes to occur in the subset and all last $ell$ slots to be absent retains exactly the fraction
  #[#set math.equation(numbering: n => "(4.22)")
   $ binom(M - m - ell, j - m) / binom(M, j) = frac(\( j \)_m \( M - j \)_ell, \( M \)_(m + ell)) .
     $ <eq:ideal-hoeffding-fraction>]
  The fraction is zero when a required cardinality is impossible. If $M gt.eq \( m + ell \) \( m + ell - 1 \)$, then
  $ \( M \)_(m + ell) = M^(m + ell) product_(i = 0)^(m + ell - 1) \( 1 - i \/ M \) gt.eq 1 / 2 M^(m + ell) \, $
  using $product \( 1 - a_i \) gt.eq 1 - sum a_i$ for $0 lt.eq a_i lt.eq 1$. Consequently (4.22) is at most
  #[#set math.equation(numbering: n => "(4.23)")
   $ 2 \( j \/ M \)^m \( 1 - j \/ M \)^ell lt.eq 2 (frac(m, m + ell))^m (frac(ell, m + ell))^ell lt.eq
     2 ell^ell m^(- ell) = : theta_m . $ <eq:ideal-hoeffding-bound>]
  This bound tensorizes even when the vectors are not products across groups.
    Indeed, first resolve the orthogonal decomposition by the tuple of component cardinalities in the groups of
    the block. Independent within-group permutations give equal squared norms for all tuples of subsets with those
    cardinalities. The fraction surviving the stated inclusions and exclusions is the product of (4.22) over those
    groups. Sum the resulting inequality over the cardinality tuples.
    Averaging the last $ell$ coordinates in other groups is a further contraction. We obtain
  #[#set math.equation(numbering: n => "(4.24)")
   $ lr(bar.v.double F_(upright("full")) bar.v.double)_2 lt.eq
     theta_m^(s_1 \/ 2) lr(bar.v.double  bar.v.double) F_2 \, wide
     lr(bar.v.double H_(upright("full")) bar.v.double)_2 lt.eq
     theta_m^(s_2 \/ 2) lr(bar.v.double  bar.v.double) H_2 . $ <eq:ideal-full-component>]
  Choose $m$ so large that $theta_m < 1$ and $- \( c_0 \/ 6 \) log theta_m > E_(upright("id")) + 3$.
    The right sides are then at most $L^(- E_(upright("id")) - 3) lr(bar.v.double  bar.v.double)
    F_2$ and $L^(- E_(upright("id")) - 3) lr(bar.v.double  bar.v.double) H_2$.
    This is the only use of large $m$, and it is possible because $ell gt.eq 1$.
  Now fix a component pair $\( F_S \, H_(T') \)$ and let
  $ U = cal(I)_1 \\ S \, wide V = cal(I)_2 \\ T' $
  be its missing probes. A comparison term with free sets $A \,
    B$ vanishes unless $A subset.eq U$ and $B subset.eq V$. For if $i in A ∩ S$,
    the input label in coordinate $i$ is unshared, is absent from the multiplier, and is absent from the target.
    Integrating it annihilates the mean-zero input component.
    The same reasoning applies to a target label in $B ∩ T'$. This uses the deliberate asymmetry in (4.2):
    its $A$ labels come from the target, and its $B$ labels from the input.
  Suppose the inclusions hold. Condition on all shared first-$J$ labels outside $A union B$,
    and write $C$ for their product. The input component is independent of the $A$ labels,
    and the target component is independent of the $B$ labels.
    Thus in the raw term the remaining tests are an arbitrary tuple test on $X_B$ and one on $X_A$, respectively,
    on independent product spaces. In the comparison term, the unused input $A$ labels and target $B$ labels
    integrate out, leaving exactly the same two tests and independent free products $D_A \, D_B$.
    The fixed shared product contributes $C^(i zeta)$, of modulus one,
    and changes the additive frequency to $alpha = Theta C$. 26 therefore matches the comparison term before its
    sign to $R \( F_S \, H_(T') \)$ with error at most
  #[#set math.equation(numbering: n => "(4.25)")
   $ L^(- A_0) lr(bar.v.double F_S bar.v.double)_2 lr(bar.v.double H_(T') bar.v.double)_2 .
     $ <eq:ideal-component-error>]
  To justify this bound after conditioning, apply the lemma to the two conditional tests,
    average its error over the shared labels, and use Cauchy–Schwarz.
    The averages of their squared conditional norms are precisely $lr(bar.v.double F_S bar.v.double)_2^2$ and
    $lr(bar.v.double H_(T') bar.v.double)_2^2$. Uniformity in every real $alpha$ is essential at this step.
  When $U \, V$ are nonempty, the signs give exact cancellation:
  #[#set math.equation(numbering: n => "(4.26)")
   $ sum_(diameter eq.not A subset.eq U\
diameter eq.not B subset.eq V) \( - 1 \)^(\| A \| + \| B \|) =
  (sum_(diameter eq.not A subset.eq U) \( - 1 \)^(\| A \|))
  (sum_(diameter eq.not B subset.eq V) \( - 1 \)^(\| B \|)) = \( - 1 \) \( - 1 \) =
  1 . $ <eq:ideal-inclusion-exclusion>]
  The initial minus sign in the comparison coefficient therefore cancels the raw pairing for this component pair,
    up to the errors just estimated. If either missing set is empty, no comparison survives.
    All these exceptional raw component pairs together are exactly
  $ R \( F_(upright("full")) \, H' \) + R \( F' - F_(upright("full")) \, H_(upright("full")) \) . $
  We sum them before taking absolute values. By (4.21), (4.24),
    their total is at most $2 L^(- E_(upright("id")) - 3) lr(bar.v.double  bar.v.double) F_2
    lr(bar.v.double  bar.v.double) H_2$. In particular there is no subset-count loss in this bound.
  For the approximation errors, there are at most $3^P$ admissible triples consisting of a component pair and its
    free subsets: each probe is either indicated, missing but not freed, or freed. Since $P lt.eq m C_0 T$, choose
  $ A_0 > E_(upright("id")) + m C_0 log 3 + 10 . $
  Then the sum of (4.25), even bounding each component norm by the original norm,
    is at most $L^(- E_(upright("id")) - 10) lr(bar.v.double  bar.v.double) F_2 lr(bar.v.double  bar.v.double)
    H_2$. Together with the exceptional contribution this proves (4.1) for sufficiently large $x$.
  Finally, the number of comparisons is at most $2^P lt.eq L^(m C_0 log 2)$,
    and (4.8) bounds each coefficient by $Q^4 xi^(- 2)$. For example, after making the choices in (4.20), any fixed
  $ C_1 > m C_0 log 2 + 4 q_(*) + 2 x_(*) + 1 $
  bounds the total coefficient cost, including the raw pattern.
    Expanding the two cell sums and two character sums also has only a fixed power of $L$ terms.
    Both free products contain a prime, so $D_A \, D_B gt.eq exp \( L^c \)$.
    The coefficient uses only the four products specified in (4.2);
    all assertions about labels and subsequent separation follow directly from (4.7).
  The order of choices is now explicit: choose $m$ from (4.24), then $A_0$ to pay for $3^P$,
    then the dyadic and kernel precisions in (4.20), and hence $C_1$.
    Only afterward require $J gt.eq m$ and $J + ell gt.eq \( m + ell \) \( m + ell - 1 \)$.
    These requirements define $J_0$. A still larger fixed $J$ can therefore be chosen to meet 17 without changing
    any kernel parameter or the exponent $C_1$. ◻
]

== 5 Lifted shifted correlations <sec:shifts>

We retain the prime groups and their notation from Section 3, Section 4.
  Thus the small groups have primes between $exp \( L^a \)$ and $exp \( L^b \)$,
  the big groups are intervals of primes between $exp \( L^c \)$ and $exp \( L^d \)$,
  and $0 < a < b < c < d < 0.47$. All groups are disjoint, their harmonic masses $V_g$ lie in
  $\[ v_(-) \, v_(+) \]$, and each kind has between fixed positive multiples of $T$ groups.
  The parameters $q in \( 0 \, 1 \)$ and $ell gt.eq 1$ are fixed.
  Write $cal(P) = union.big_g cal(P)_g$ and let $n_(*)$ be the part of $n$ supported on primes outside $cal(P)$.

=== 5.1 Endpoint hypotheses and the correlation theorem <endpoint-hypotheses-and-the-correlation-theorem>

For a vector $upright(bold(t)) = \( t_g \)_g$ of nonnegative integers, define

#[#set math.equation(numbering: n => "(5.1)")
 $ W_(upright(bold(t))) \( n \) = q^(omega \( n \) - sum_g t_g) product_g
   frac(\( omega_g \( n \) \)_(t_g), V_g^(t_g)) . $ <eq:marked-weight>]

The falling factorial counts ordered lists of distinct group primes dividing $n$.
  More generally, if $upright(bold(b))$ is a function on these lists, put

$ W_(upright(bold(t)))^(upright(bold(b))) \( n \) = q^(omega \( n \) - sum_g t_g) product_g V_g^(- t_g)
  sum_(\( p_(g \, 1) \, dots.h \, p_(g \, t_g) \) upright(" distinct in each group")\
p_(g \, j) in cal(P)_g \, med p_(g \, j) divides n) upright(bold(b)) \( \( p_(g \, j) \)_(g \, j) \) . $

An empty admissible-list set gives value zero. Write $W_ell$ when all $t_g = ell$. For each fixed $t_max$,

#[#set math.equation(numbering: n => "(5.2)")
 $ sup_(max t_g lt.eq t_max) \| W_(upright(bold(t)))^(upright(bold(b))) \( n \) \| lt.eq
   parallel upright(bold(b)) parallel_oo L^(C \( t_max \)) . $ <eq:mark-sup>]

Indeed, $q^(y - t) \( y \)_t \/ V_g^t$ has a bounded supremum over integers $y gt.eq t$, uniformly for $t lt.eq
  t_max$, and there are $O \( T \)$ groups.

An endpoint is a function invariant under multiplication by $cal(P)$-integers of the form

#[#set math.equation(numbering: n => "(5.3)")
 $ F_0 \( n \) = sum_(m p r = n_(*)) alpha_m chi_0 \( m \) m^(i sigma_0)
   upright(bold(1))_(p in I_p \, thin P^(-) \( p \) > W) thin p^(i sigma_1) c_r . $ <eq:endpoint-form>]

Here $\| alpha_m \| \, \| c_r \| lt.eq L^C$, $alpha_m = 0$ unless $P^(-) \( m \) > W$,
  $I_p subset \[ x^tau \, x^eta \]$ is an interval, $0 < tau < eta < 1 \/ 4$ are fixed,
  $chi_0$ is a Dirichlet character of modulus at most $L^C$, and $\| sigma_0 \| \, \| sigma_1 \| lt.eq L^C$.
  The variable $p$ ranges over integers. The sequences may depend on $x$,
  and all the parameters and sequences can differ at the two endpoints.
  Since $W = exp \( sqrt(L) \)$ exceeds every group prime, $m$ and $p$ are $cal(P)$-free for sufficiently large
  $x$. We impose the following condition on the $alpha$ of at least the first endpoint:

#[#set math.equation(numbering: n => "(5.4)")
 $ lr(|sum_(m in I) frac(alpha_m chi \( m \) m^(i u), m)|) lt.eq L^(- B) quad
   {I subset \[ 1 \, x^2 \] upright(" an interval") \,\
chi upright(" a Dirichlet character of modulus at most ") L^B \,\
\| u \| lt.eq L^B . $ <eq:discrepancy>]

This includes principal and imprimitive characters. An existing range restriction on $alpha$ is part of the
  sequence in this condition.

#thm([Theorem 5.1.])[
  (Lifted shift cancellation).  #emph[Fix all the group and endpoint bounds above.
    Fix $D_0 \, C > 0$ and a fixed compact interval $\[ c_Psi \, C_Psi \] subset \( 0 \, oo \)$.
    Suppose $0 < \| k \| lt.eq L^C$ is integral, $x L^(- C) lt.eq Z lt.eq x L^C$, $\| a_1 \| \, \| a_2 \| lt.eq
    L^C$, and $Psi$ is supported in that interval with $parallel Psi^(\( j \)) parallel_oo lt.double_j
    L^(C \( j + 1 \))$ for every $j gt.eq 0$. There exists a fixed $B$, depending only on these bounds and $D_0$,
    such that (5.4) implies
#[#set math.equation(numbering: n => "(5.5)")
 $ sum_(z > 0\
z + k > 0) frac(Psi \( z \/ Z \), z) thin z^(i a_1) \( z + k \)^(i a_2) overline(F_0 \( z \)) G_0 \( z + k \)
  W_ell \( z \) W_ell \( z + k \) lt.double L^(- D_0) . $ <eq:shift-bound>]

 The bound is uniform over the indicated sequences, intervals, characters, frequencies, and cutoffs.
   It also holds when the discrepancy-bearing endpoint or its coefficients have been conjugated.]
] <thm:shift>

Conjugation in the last assertion is harmless: conjugate (5.4) and replace $\( chi \, u \)$ by
  $\( overline(chi) \, - u \)$. Products with additional characters and bounded power twists are covered by
  increasing $B$. We give the proof in several stages.

=== 5.2 The physical lift and removal of shared labels <the-physical-lift-and-removal-of-shared-labels>

We first show that the raw correlation together with its signed comparison correlations is small.
  The harmonic factor $1 \/ n$ will turn sums over shared prime divisors into draws with laws $mu_g$ when the
  shared product is removed.

Take the raw pattern and signed comparison patterns of 24.
  Write $m_(upright("probe"))$ for the fixed probe bound $m$ in that theorem;
  the letter $m$ in (5.3) denotes an integer factor. As in the physical construction, $M = J + ell$,
  the edge product is $D$, and the positions are $n \, n' = n + k D$.
  Insert into the physical pairing the root weight $Psi \( n \/ \( Z D \) \) \/ n$,
  the edge phase $D^(- i \( a_1 + a_2 \))$, and the mark-independent vectors

#[#set math.equation(numbering: n => "(5.6)")
 $ f \( n \, upright(bold(p)) \) = n^(- i a_1) F_0 \( n \) q^(\( omega \( n \) - M s \) \/ 2) \, wide
   g \( n' \, upright(bold(p))' \) = \( n' \)^(i a_2) G_0 \( n' \) q^(\( omega \( n' \) - M s \) \/ 2) .
   $ <eq:lift-vectors>]

Our pairing is conjugate-linear in its first entry, so its integrand contains $n^(i a_1)
  overline(F_0 \( n \))$ at the source and $\( n' \)^(i a_2) G_0 \( n' \)$ at the target.
  Every factor involving $D$ is inside the slot symmetrizations.
  On the support, $n asymp Z D = x^(1 + o \( 1 \))$ and $n' \/ n = 1 + O \( L^C \/ Z \)$.
  A partition into at most $O \( L \)$ dyads $n asymp X$ therefore suffices,
  and one can restrict the other endpoint to an interval of length $O \( X \)$.

We check carefully that the exponent in the endpoint norm bound is independent of $J$ and of the probe count.
  On a physical state $omega \( n \) gt.eq M s$, so the damping in (5.6) is at most one.
  There are at most $tau \( n_(*) \)^2$ ordered factorizations in (5.3), whence $\| F_0 \( n \) \| lt.eq
  L^(2 C) tau \( n_(*) \)^2$. Fix an ordered physical list $S'$ of $M$ distinct labels per group,
  with product $P \( S' \)$. For $P \( S' \) divides n$, one has $n_(*) divides n \/ P \( S' \)$ and hence

$ sum_(n asymp X\
P \( S' \) divides n) tau \( n_(*) \)^4 lt.eq sum_(v asymp X \/ P \( S' \)) tau \( v \)^4 lt.double
  frac(X, P \( S' \)) L^(C_5) . $

Here $P \( S' \) lt.eq exp \( O_J \( T L^d \) \) = x^(o \( 1 \))$,
  so the interval in $v$ is still of positive power length. Moreover

$ sum_(S') frac(1, P \( S' \)) product_g V_g^(- M) lt.eq product_g (sum_(p in cal(P)_g) frac(1, p V_g))^M = 1 . $

Thus both endpoint vectors have norm at most $X^(1 \/ 2) L^(C_6)$ in the physical state measure,
  with $C_6$ independent of $J$ and the probe count. Also $\| F_0 \( n \) \| lt.eq exp \( O \( sqrt(L) \) \)$:
  an integer of size $x^(O \( 1 \))$ has $O \( sqrt(L) \)$ prime factors above $W$, with multiplicity,
  so it has at most $2^(O \( sqrt(L) \))$ choices for each of the rough divisors $m \, p$.
  The vectors are independent of the selected marks.

For clarity, let $Phi \( u \) = Psi \( e^u \)$. Logarithmic Fourier inversion gives

$ Psi \( n \/ \( Z D \) \) = frac(1, 2 pi) integral_(bb(R)) hat(Phi) \( v \) \( n \/ Z \)^(i v) D^(- i v) thin d v . $

The derivative hypotheses imply an $L^(O \( 1 \))$ integral norm, and, for a fixed sufficiently large $C_7$,
  tails $\| v \| > L^(C_7)$ have arbitrarily large negative log powers.
  This cutoff exponent can be fixed from the derivative bounds:
  increasing the number of integrations by parts increases the saving without increasing $C_7$.
  On the dyad multiply the first vector by $X \/ n$ and $\( n \/ Z \)^(- i v)$, and divide the pairing by $X$.
  The conjugation in the pairing then supplies the factor $\( n \/ Z \)^(i v)$ above.
  The required ideal frequency is $zeta = - a_1 - a_2 - v$.
  Consequently 23 and 24 bound the entire residual pairing by $L^(- D_1)$, for any prescribed $D_1$,
  after choosing the transfer target first, then the ideal family, then $J$.
  The norm exponent just proved makes this ordering possible.
  The discarded Fourier tails obey the same conclusion by 16;
  their accuracy may be chosen after the absolute comparison costs are known.
  All these steps apply to the sum of the patterns, with their signs.

We next calculate the individual pattern after this lift.
  In group $g$ write $c_g$ for its free-slot count and $s_(R \, g) = J - c_g$ for its shared-slot count;
  thus $t_g = ell + c_g$. Let $D_R \, D_C$ be the products of the shared and free labels, so $D = D_R D_C$.
  This partitions labels by their role on the edge; the earlier factorization $D =
  D_(cal(S)) D_(cal(B))$ partitions them by prime-group size. Set $n = D_R w$, $n' = D_R w'$, so $w' = w + k D_C$.
  The physical state and target-list normalizations in this group are

$ V_g^(- M - t_g) = V_g^(- s_(R \, g) - 2 t_g) \, wide M + t_g = s_(R \, g) + 2 t_g . $

The factor $1 \/ D_R$ from $1 \/ n$ therefore changes each shared-label sum into a draw of mass
  $1 \/ \( p V_g \)$, and leaves $V_g^(- t_g)$ at each endpoint for its unshared lists. Away from shared overlaps,

$ omega_g \( D_R w \) - M = omega_g \( w \) - t_g . $

The damping already in the graph and that in (5.6) give this full power of $q$ at each endpoint.
  Invariance gives $F_0 \( D_R w \) = F_0 \( w \)$, and the phases become

$ \( D_R w \)^(i a_1) \( D_R w' \)^(i a_2) \( D_R D_C \)^(- i \( a_1 + a_2 \)) = \( w \/ D_C \)^(i a_1) \( w' \/
  D_C \)^(i a_2) . $

The coefficient $K_nu$ of a comparison uses the free labels and designated unshared big labels,
  and uses no shared labels. Thus its dependence is preserved when these shared harmonic draws are summed.

Here are error bounds justifying the exclusions in this calculation.
  For fixed $w \, w' \, D_C$ and any earlier shared draws, only $O_J \( L \)$ values are forbidden to a new shared
  draw: endpoint prime divisors, free labels, and previous shared labels.
  Each atom has mass at most $v_(-)^(- 1) exp \( - L^a \)$.
  The $O_J \( T \)$ draws have total excluded probability $L^(O_J \( 1 \)) exp \( - L^a \)$.
  For distinct shared values the exact identity is

$ omega \( D_R w \) - M s = omega \( w \) - sum_g t_g - \# { p : p divides D_R \, med p divides w } . $

In bounding the actual overlap terms by the unrestricted marked sum, the damping loss is at most $q^(- 2 M s) =
  L^(O_J \( 1 \))$. Unshared divisors still divide $w \, w'$ and their count cannot increase.
  By (5.2), endpoint Cauchy–Schwarz and divisor moments, their remaining absolute harmonic average is
  $L^(O \( 1 \))$. Shared exclusions therefore cost $L^(O_J \( 1 \)) exp \( - L^a \)$.

Once shared overlaps are excluded, the remaining ban excludes free labels from the unshared endpoint mark lists.
  Every excluded configuration therefore has a free prime $p'$ dividing an endpoint.
  Since $p' divides D_C$, it follows that both $p' divides w$ and $p' divides w'$;
  it suffices to bound all such multiples. On $w asymp Y_0 = Z D_C$, put $w = p' v$ and $w' =
  p' \( v + k D_C \/ p' \)$. Invariance and Cauchy–Schwarz give

$ sum_(w asymp Y_0\
p' divides w) frac(\| F_0 \( w \) G_0 \( w + k D_C \) \|, w) lt.double L^(O \( 1 \)) /
  Y_0 (sum_(v asymp Y_0 \/ p') tau \( v \)^4)^(1 \/ 2)
  (sum_(v asymp Y_0 \/ p') tau \( v + k D_C \/ p' \)^4)^(1 \/ 2) lt.double L^(O \( 1 \)) / p' . $

Both shifted ranges stay in positive intervals of size $O \( Y_0 \/ p' \)$, and $Y_0 \/ p' = x^(1 + o \( 1 \))$.
  The mark weights, coefficients, and total pattern costs are fixed log powers.
  Summing over the free slots therefore makes this error negligible too.
  This is an averaged bound over multiples of $p'$, not a restriction on the arbitrary coefficients.

We have obtained, up to errors smaller than every fixed negative log power, the following expression for each pattern:

#[#set math.equation(numbering: n => "(5.7)")
 $ bb(E)_(upright("free")) sum_(w > 0\
w' = w + k D_C > 0) frac(Psi \( w \/ \( Z D_C \) \), w) \( w \/ D_C \)^(i a_1) \( w' \/ D_C \)^(i a_2)
  overline(F_0 \( w \)) G_0 \( w' \) W_(upright(bold(t))) \( w \) W_(upright(bold(t))) \( w' \) thin
  bb(E)_(upright("marks")) K_nu . $ <eq:stripped-pattern>]

The outer expectation uses independent free-label laws $mu_g$.
  Conditional on these labels and the positions, the inner expectation uses independent uniform ordered unshared
  lists at each endpoint; its term is zero if either list set is empty.
  The raw pattern has $D_C = 1$ and $t_g = ell$, so it is exactly the sum in (5.5).
  It remains to bound all the comparison terms.

=== 5.3 Comparison shifts and their major arcs <comparison-shifts-and-their-major-arcs>

Expand a comparison coefficient from 26 by its two logarithmic cells and two characters.
  Its factors on the free products $D_A \, D_B$ separate, and the remaining factors are bounded weights on
  specified big unshared marks at the two endpoints. Cell normalizations, the number of terms,
  and the integral costs are fixed log powers, independent of $J$.
  Let $H'$ be the product of the lower size endpoints of the two cells. Then $D_A D_B asymp H'$ and

#[#set math.equation(numbering: n => "(5.8)")
 $ H' gt.eq exp \( L^c \) \, wide H' lt.eq exp \( O \( m_(upright("probe")) T L^d \) \) \, wide Y = Z H' =
   x^(1 + o \( 1 \)) . $ <eq:comparison-scales>]

Insert smooth size cutoffs at $w \, w' asymp Y$, separate $Psi \( w \/ \( Z D_A D_B \) \)$ logarithmically,
  and include $Y \/ w$ in the first cutoff. Apart from $1 \/ Y$ and fixed log-power costs, every resulting term is

#[#set math.equation(numbering: n => "(5.9)")
 $ bb(E)_(D_A \, D_B) b_1 \( D_A \) b_2 \( D_B \) sum_w overline(cal(U) \( w \)) cal(V) \( w + k D_A D_B \) .
   $ <eq:comparison-correlation>]

Here $\| b_1 \| \, \| b_2 \| lt.eq 1$ after extracting constants; each is supported on its cell.
  Each endpoint sequence is its invariant endpoint times a smooth cutoff at size $Y$,
  a power $w^(i v)$ with $\| v \| lt.eq L^(O \( 1 \))$, and a weight
  $W_(upright(bold(t)))^(upright(bold(b))) \( w \)$. The additional mark function uses only big labels. In particular

#[#set math.equation(numbering: n => "(5.10)")
 $ sum_w \| cal(U) \( w \) \|^2 + sum_w \| cal(V) \( w \) \|^2 lt.double Y L^(C_8) . $ <eq:comparison-l2>]

All frequency and cutoff bounds here are fixed before $B$.

The endpoint sequences are now independent of the free products.
  Fourier inversion isolates the weighted shift average as a multiplier:
  bilinear cancellation will control it away from small rational frequencies,
  and endpoint Fourier energy will control the remaining contribution.
  Use $hat(F) \( theta \) = sum_w F \( w \) e \( theta w \)$ on $bb(R) \/ bb(Z)$. The multiplier in (5.9) is

$ M \( theta \) = bb(E) b_1 \( D_A \) b_2 \( D_B \) e \( - k theta D_A D_B \) . $

We claim that, for any fixed desired saving $D_2$, it is $O \( L^(- D_2) \)$ outside

$ frak(M) = union.big_(1 lt.eq r lt.eq L^(C_(upright("arc")))) union.big_(u med mod med r) { theta :
  med \| theta - u \/ r \|_(bb(R) \/ bb(Z)) lt.eq L^(C_(upright("arc"))) \/ H' } \, $

if $C_(upright("arc"))$ is large enough. To verify the coefficient hypothesis of 25,
  collapse a free product of size $U_0$ to integer weights $rho \( n \)$.
  Each group contributes at most $m_(upright("probe"))$ slots.
  Unique factorization bounds the multiplicity at $n$ by $product_g \( m_(upright("probe")) ! \)$,
  and the $V_g$ normalizations cost another fixed constant per slot.
  Hence $rho \( n \) lt.eq L^(O \( 1 \)) \/ n$ and $sum_n rho \( n \) = 1$; for bounded tests,

$ sum_(n asymp U_0) \| b \( n \) rho \( n \) \|^2 lt.double L^(O \( 1 \)) \/ U_0 . $

Both free products are nonempty and each contains a big prime, so both sizes exceed every fixed power of $L$.

Put $Q_D = floor.l H' \/ L^(C') floor.r$. Dirichlet approximation to $k theta$ gives a reduced $u' \/ r'$ with $r'
  lt.eq Q_D$ and $\| k theta - u' \/ r' \| lt.eq 1 \/ \( r' Q_D \) lt.eq \( r' \)^(- 2)$,
  where $1 \/ \( r' Q_D \) lt.double L^(C') \/ \( r' H' \)$.
  If $r' lt.eq L^(C')$, division by $k$ places $theta$ on one of the stated arcs after increasing
  $C_(upright("arc"))$; reduction can only decrease the denominator.
  Otherwise $L^(C') < r' lt.double H' \/ L^(C')$. The normalized bilinear bound of 25 then saves any prescribed
  log power by increasing $C'$. This proves the claim. Parseval and (5.10) control the complementary contribution
  to (5.9), including its $1 \/ Y$.

Put $H = H' \/ L^(C_(upright("arc")))$. On each arc it is enough to prove, for any fixed $A > 0$,

#[#set math.equation(numbering: n => "(5.11)")
 $ integral_(\| beta \| lt.eq 1 \/ H) \| hat(cal(U)) \( u \/ r + beta \) \|^2 thin d beta lt.double_A Y L^(- A) .
   $ <eq:local-energy-target>]

Indeed $\| M \| lt.eq 1$, and Cauchy–Schwarz with (5.10) gives $L^(- A \/ 2 + C_8 \/ 2)$ per arc after division by
  $Y$. There are at most $L^(2 C_(upright("arc")) + O \( 1 \))$ arcs.
  We establish (5.11) with $A$ chosen after all these costs. Its proof uses three features of the first endpoint:
  one small prime can be extracted from its ordered marks, every factorization contains the long rough-integer
  factor in (5.3), and the $m$ coefficients satisfy (5.4). After conversion to Mellin frequencies,
  these supply cancellation in different ranges.

=== 5.4 One small mark and the rational character expansion <one-small-mark-and-the-rational-character-expansion>

Choose any small group $g_s$ and a designated slot among its $t_(g_s) = ell gt.eq 1$ ordered marks.
  The endpoint mark weight is independent of the small labels.
  Whenever no prime of $cal(P)_(g_s)$ has its square dividing $w$,
  removal of the prime in this slot gives the exact identity

#[#set math.equation(numbering: n => "(5.12)")
 $ W_(upright(bold(t)))^(upright(bold(b))) \( w \) = sum_(p_s in cal(P)_(g_s)\
p_s divides w) 1 / V_(g_s) W_(upright(bold(t)) - upright(bold(e))_(g_s))^(upright(bold(b))) \( w \/ p_s \) .
  $ <eq:small-mark-removal>]

Removing the designated slot is a bijection of the ordered lists;
  both $omega_(g_s)$ and $t_(g_s)$ decrease by one. There is therefore no extra factorial or damping factor.
  Both sides, even on the exceptional integers, are $L^(O \( 1 \))$ by (5.2) and $omega_(g_s) \( w \) =
  O \( L \)$. Since $w_(*) divides w \/ p_s^2$ on a square multiple,
  the squared norm of the error after multiplication by $F_0$ is at most

$ L^(O \( 1 \)) sum_(p_s in cal(P)_(g_s)) sum_(w asymp Y\
p_s^2 divides w) tau \( w_(*) \)^4 lt.double Y L^(O \( 1 \)) sum_(p_s in cal(P)_(g_s)) p_s^(- 2) lt.double Y
  L^(O \( 1 \)) e^(- L^a) . $

Every $Y \/ p_s^2$ is $x^(1 + o \( 1 \))$. Parseval makes this error negligible in (5.11).

After (5.12), combine the remaining $cal(P)$-part with the residual factor of (5.3).
  The full integer factorization is $w = m p_s p r$, with residual coefficient

$ c_(r_(*)) W_(upright(bold(t)) - upright(bold(e))_(g_s))^(upright(bold(b))) \( r \) . $

This identity uses that $m \, p$ have no group factors. The residual coefficient is a function of $r$ alone and is
  bounded by $L^(O \( 1 \))$.

All of $m \, p_s \, p$ are units modulo the arc denominator $r_0 lt.eq L^(C_(upright("arc")))$.
  Separate residual factors by $d_0 = \( r \, r_0 \)$ and put $q_0 = r_0 \/ d_0$.
  On units modulo $q_0$ the exact finite character expansion is

$ e \( u v \/ q_0 \) = sum_(chi med mod med q_0) c_(u \, q_0) \( chi \) chi \( v \) \, wide
  c_(u \, q_0) \( chi \) = frac(1, phi \( q_0 \)) sum_(v med mod med q_0)^(*) e \( u v \/ q_0 \)
  overline(chi \( v \)) . $

Each coefficient has modulus at most one. Use this with $v = m p_s p \( r \/ d_0 \)$;
  the condition $\( r \, r_0 \) = d_0$ guarantees that $v$ is a unit modulo $q_0$.
  The factors $chi \( r \/ d_0 \)$ and the gcd restriction are absorbed into the residual coefficient.
  This includes every character modulo the actual quotient, so principal and imprimitive components are retained.
  The number of divisors and characters is a fixed log power, and products with $chi_0$ have polylogarithmic modulus.

It now suffices to prove the local energy bound at zero for sequences

#[#set math.equation(numbering: n => "(5.13)")
 $ a_w = Psi_1 \( w \/ Y \) w^(i v_1) sum_(m p_s p r = w) alpha_m chi_m \( m \) m^(i sigma_0) thin b_s \( p_s \)
   thin upright(bold(1))_(p in I_p \, thin P^(-) \( p \) > W) chi_p \( p \) p^(i sigma_1) d_r \,
   $ <eq:four-factor-endpoint>]

where $p_s in cal(P)_(g_s)$, $\| b_s \| lt.double 1$, $\| d_r \| lt.eq L^(O \( 1 \))$,
  the characters and frequencies have fixed log-power bounds,
  and $Psi_1$ has the same kind of smooth size support as above.
  Fixed-order divisor moments give $sum_w \| a_w \|^2 lt.double Y L^(O \( 1 \))$.

=== 5.5 From local Fourier energy to a Mellin integral <from-local-fourier-energy-to-a-mellin-integral>

We record the scale conversion explicitly. Choose a smooth nonnegative $K$ of integral one,
  supported in a sufficiently small fixed neighborhood of zero that $\| hat(K) \( xi \) \| gt.eq
  1 \/ 2$ for $\| xi \| lt.eq 1$, using the Fourier convention with $e \( - xi u \)$. Plancherel on $bb(R)$ gives

#[#set math.equation(numbering: n => "(5.14)")
 $ integral_(\| beta \| lt.eq 1 \/ H) \| hat(a) \( beta \) \|^2 thin d beta lt.double H^(- 2) integral_(bb(R))
   lr(|sum_w a_w K \( \( w - v \) \/ H \)|)^2 thin d v . $ <eq:local-convolution>]

Only $v asymp Y$ contributes. Keep the integral restricted to this range when replacing the kernel by
  $K \( v log \( w \/ v \) \/ H \)$; no estimate for this logarithmic kernel near $v = 0$ is used.
  On the union of the two kernels’ supports within this range, $\| w -
  v \| lt.double H$ and their arguments differ by $O \( H \/ Y \)$.
  Therefore, by Cauchy–Schwarz over $O \( H \)$ integers and then integrating the centers allowed for each $w$,
  the squared norm of the error in (5.14) is

#[#set math.equation(numbering: n => "(5.15)")
 $ lt.double \( H \/ Y \)^2 sum_w \| a_w \|^2 . $ <eq:kernel-error>]

This is smaller than $Y L^(- A)$ for every fixed $A$, since $H = x^(o \( 1 \))$ and $Y = x^(1 + o \( 1 \))$.

Set $h = H \/ Y$ and $P \( t \) = sum_w a_w w^(i t)$. With $v = Y e^u$, logarithmic Fourier inversion gives

$ sum_w a_w K \( v log \( w \/ v \) \/ H \) = frac(h, 2 pi) integral_(bb(R)) e^(- u)
  hat(K) \( h e^(- u) t \/ \( 2 pi \) \) v^(- i t) P \( t \) thin d t . $

Insert a smooth compactly supported function $rho \( u \)$ equal to one on the required range.
  The Fourier transform in $u$ of $rho \( u \) e^(- u) hat(K) \( h e^(- u) t \/ \( 2 pi \) \)$,
  denoted $A \( s \, t \)$, satisfies, for each fixed $j$,

$ \| A \( s \, t \) \| lt.double_j \( 1 + \| s \| \)^(- 2) \( 1 + \| h t \| \)^(- j) . $

This follows by two integrations by parts in $u$, since $hat(K)$ is Schwartz and $u$ stays in a fixed compact
  interval. Fourier-expand in $u$, apply Minkowski’s integral inequality in $s$,
  and apply Plancherel in $u$ for each $s$. As $d v lt.double Y thin d u$, the normalization is $H^(- 2) Y h^2 =
  Y^(- 1)$. After replacing $j$ by a larger integer, we obtain

#[#set math.equation(numbering: n => "(5.16)")
 $ integral_(\| beta \| lt.eq 1 \/ H) \| hat(a) \( beta \) \|^2 thin d beta lt.double_j Y^(- 1)
   integral_(bb(R)) \( 1 + \| h t \| \)^(- j) \| P \( t \) \|^2 thin d t + \( H \/ Y \)^2 sum_w \| a_w \|^2 .
   $ <eq:local-mellin-energy>]

By 8, for any dyadic time scale $T' gt.eq 1$,

$ Y^(- 2) integral_(T' lt.eq \| t \| lt.eq 2 T') \| P \( t \) \|^2 thin d t lt.double \( 1 + T' \/ Y \) L^(C_9) . $

Consequently the portion $\| t \| > L \/ h$ in (5.16) is $O \( Y L^(- A) \)$ after choosing $j$ large enough.
  For the remaining portion split the four factor variables in (5.13) into dyads.
  There are $O \( L^4 \)$ boxes and only boxes whose joint size is comparable to $Y$ contribute. Write

$ frac(P \( t \), Y) = sum_w 1 / w (\( w \/ Y \) Psi_1 \( w \/ Y \)) w^(i \( t + v_1 \))
  sum_(m p_s p r = w) \( upright("the four coefficients") \) . $

Fourier-separate the parenthesized cutoff in logarithmic coordinates.
  Its integral cost is a fixed log power; truncate at a fixed log-power frequency with arbitrary saving.
  The tails are bounded by the preceding mean values. The frequency shifts enlarge $\| t \| lt.eq
  L \/ h$ only to $\| t \| lt.eq 2 L \/ h$, because $1 \/ h$ exceeds every fixed log power.
  We have reduced the assertion to

#[#set math.equation(numbering: n => "(5.17)")
 $ integral_(\| t \| lt.eq 2 L \/ h) \| P_s \( t \) P_l \( t \) cal(R) \( t \) \|^2 thin d t lt.double L^(- A')
   $ <eq:polynomial-target>]

for any prescribed fixed $A'$, on each retained box, where

$ P_s \( t \) & = sum_(p_s asymp P) b_s \( p_s \) p_s^(- 1 + i t) \,\
P_l \( t \) & = sum_(p asymp P' \, med p in I_p\
P^(-) \( p \) > W) chi_p \( p \) p^(- 1 + i sigma_1 + i t) \,\
cal(R) \( t \) & = (sum_(m asymp M_0) alpha_m chi_m \( m \) m^(- 1 + i sigma_0 + i t))
  (sum_(r asymp R_0) d_r r^(- 1 + i t)) . $

Here and below dyads may be intersected with their existing support. We have

#[#set math.equation(numbering: n => "(5.18)")
 $ e^(L^a) \/ 2 lt.eq P lt.eq e^(L^b) \, wide x^tau \/ 2 lt.eq P' lt.eq x^eta \, wide
   P M_0 P' R_0 asymp Y . $ <eq:four-factor-scales>]

For any subproduct of these four polynomials, collapse its coefficients to $sum_(n asymp U) c_n n^(i t)$.
  A fixed number of convolution factors and 7 give

#[#set math.equation(numbering: n => "(5.19)")
 $ sum_n \| c_n \|^2 lt.double L^(C_10) \/ U . $ <eq:collapsed-polynomial-l2>]

This uses a fixed divisor moment: the number of marked groups has already been absorbed by (5.2),
  not by a growing divisor order. Individually all these polynomials are also $L^(O \( 1 \))$ in absolute value by
  their harmonic sums.

The remaining integral has three regimes. Most times are controlled by the small-prime polynomial $P_s$:
  where $\| P_s \( t \) \|$ is a sufficiently small negative power of $L$,
  the ordinary mean square of $P_l cal(R)$ suffices. We will show that the exceptional times occupy only
  $Y^(o \( 1 \))$ unit intervals. On these intervals at large times,
  $P_l$ is small by oscillation over its long rough-integer range;
  a sparse mean square for $cal(R)$ makes that saving sufficient.
  For $\| t \|$ bounded by a fixed power of $L$, the $m$ factor in $cal(R)$ is small by the original discrepancy
  hypothesis. We prove the exceptional-time and long-factor estimates first,
  then choose the discrepancy precision in the completion of the argument.

=== 5.6 Exceptional times and a sparse mean square <exceptional-times-and-a-sparse-mean-square>

The split into ordinary and exceptional times, followed by high prime-polynomial moments and a sparse mean-square
  estimate, is in the spirit of the method of Matomäki and Radziwiłł;
  compare #cite(label("MatomakiRadziwill2016")) Section 2.1 and Section 4, Lemmas 8–9.
  The estimates needed here are proved below; we do not invoke their short-interval theorem.

Fix a large constant $A_s$ and let $cal(E) = { t : \| t \| lt.eq 2 L \/ h \, med \| P_s \( t \) \| > L^(- A_s) }$.
  Outside $cal(E)$, use the indicated gain and the mean square of $P_l cal(R)$, of joint size $Y \/ P$.
  Its length exceeds the time range, since

$ frac(Y \/ P, 2 L \/ h) = frac(H, 2 L P) arrow.r oo $

by $b < c$ and (5.8), (5.18). Thus this portion of (5.17) is $O \( L^(- 2 A_s + C_11) \)$.

The factorial coefficient estimate in the next proof is the standard prime-polynomial moment argument;
  compare #cite(label("Soundararajan2009")) Lemma 3 and its proof. We keep its dependence on the growing power explicit.

#thm([Lemma 5.2.])[
  (Number of exceptional unit intervals).  #emph[The set $cal(E)$ meets at most
$ exp #h(-0.16667em) (O \( L^b + L^(1 - a) log L \)) = Y^(o \( 1 \)) $

 intervals $\[ j \, j + 1 \]$, uniformly in the bounded coefficients $b_s$.]
] <lem:exceptional-times>

#proof[
  Choose a point of $cal(E)$ in each occupied interval, and split the interval indices into three residue classes
    to obtain separated points. Put $j_0 = floor.l log Y \/ log \( 2 P \) floor.r$.
    The polynomial $P_s \( t \)^(j_0)$ has indices at most $Y$. Its coefficient-square sum is at most
  $ j_0 ! (sum_(p_s asymp P) \| b_s \( p_s \) \|^2 p_s^(- 2))^(j_0) lt.eq j_0 ! \( C \/ P \)^(j_0) . $
  Indeed an integer has at most $j_0 !$ ordered representations as a product of $j_0$ primes;
    Cauchy–Schwarz on each fiber proves the first inequality even with repeated primes.
  For a polynomial $Q \( t \) = sum_(n lt.eq Y) c_n n^(i t)$ and unit-separated points in
    $\[ - O \( Y \) \, O \( Y \) \]$, the unit-interval Sobolev inequality and bounded overlap imply
  $ sum_j \| Q \( t_j \) \|^2 lt.double
    integral_(- O \( Y \))^(O \( Y \)) \( \| Q \( t \) \|^2 + \| Q' \( t \) \|^2 \) thin d t lt.double
    Y \( log \( 2 Y \) \)^(O \( 1 \)) sum_n \| c_n \|^2 . $
  In the last step use 8; differentiation multiplies a coefficient by $i log n$,
    so the constants here are independent of $j_0$. The range $2 L \/ h$ is $o \( Y \)$, as required.
    If $N_(cal(E))$ is the number of occupied intervals, it follows that
  $ N_(cal(E)) lt.double Y L^(O \( 1 \)) j_0 ! \( C L^(2 A_s) \/ P \)^(j_0) . $
  Now $j_0 = O \( L^(1 - a) \)$ and $log Y - j_0 log P = O \( L^b + j_0 \)$ by the definition with $2 P$.
    Taking logarithms and using $log \( j_0 ! \) lt.eq j_0 log j_0$ proves the asserted estimate. ◻
]

#thm([Lemma 5.3.])[
  (Sparse residual mean square).  #emph[For the occupied unit intervals $I_j$ in 28,
$ sum_j sup_(t in I_j) \| cal(R) \( t \) \|^2 lt.double L^(C_12) . $

]
] <lem:sparse-residual>

#proof[
  The collapsed residual size is
  $ U asymp Y \/ \( P P' \) gt.eq Y^(1 - eta - o \( 1 \)) > Y^0.6 $
  for large $x$, and its coefficient-square sum is $L^(O \( 1 \)) \/ U$ by (5.19).
    On a containing integer interval $n asymp U$, the Gram kernel satisfies, uniformly for $\| z \| lt.double Y$,
  #[#set math.equation(numbering: n => "(5.20)")
   $ lr(|sum_(n asymp U) n^(i z)|) lt.double frac(U, 1 + \| z \|) + Y^(1 \/ 2) . $ <eq:sparse-gram-kernel>]
  For $\| z \| < 1$ this is trivial. For $1 lt.eq \| z \| lt.eq c U$ with small fixed $c$,
    the phase $z log n \/ \( 2 pi \)$ has monotone first derivative of magnitude comparable to $\| z \| \/
    U$ and less than $1 \/ 2$; 9 gives $O \( U \/ \| z \| \)$.
    For $c U < \| z \| lt.double Y$ the second derivative test gives
    $O \( \| z \|^(1 \/ 2) + U \| z \|^(- 1 \/ 2) \) = O \( Y^(1 \/ 2) \)$.
  Choose a maximum point of $\| cal(R) \|$ in each closed $I_j$ and again split the indices into three residue
    classes. In each class these points are at least unit separated.
    For $R = Y^(o \( 1 \))$ such points, the absolute row sums of their Gram matrix are at most
  $ C #scale(x: 120%, y: 120%)[\(] U log \( 2 Y \) + R Y^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] lt.double U
    log \( 2 Y \) . $
  The first term follows by grouping distances into unit intervals; the second is absorbed by $U > Y^0.6$.
    Schur’s bound on this Gram matrix, applied to the map $\( c_n \) mapsto \( sum_n c_n n^(i t_j) \)_j$, now gives
  $ sum_j \| cal(R) \( t_j \) \|^2 lt.double U log \( 2 Y \) sum_n \| c_n \|^2 lt.double L^(O \( 1 \)) . $
  Summing the three classes proves the statement, including the suprema over the intervals. ◻
]

=== 5.7 Cancellation of the long rough-integer factor <cancellation-of-the-long-rough-integer-factor>

The following elementary estimate is the reason for requiring a rough integer factor of positive power length in
  every endpoint.

#thm([Lemma 5.4.])[
  (Long rough-integer polynomial).  #emph[Fix $tau > 0$, $eta < 1 \/ 4$, $C > 0$, and $A > 0$.
    Let $x^tau \/ 2 lt.eq P' lt.eq x^eta$, let $J' subset \[ P' \, 2 P' \]$ be an interval,
    and let $chi$ have modulus at most $L^C$. If $\| sigma \| lt.eq L^C$, then,
    for a sufficiently large fixed $B_0$, uniformly whenever $L^(B_0) lt.eq \| t \|$ and $\| t + sigma \| lt.eq x^2$,
$ lr(|sum_(n in J'\
P^(-) \( n \) > W) chi \( n \) n^(- 1 + i \( t + sigma \))|) lt.double L^(- A) . $

 The constant $B_0$ can be chosen after $C \, A \, tau \, eta$.]
] <lem:long-rough-polynomial>

#proof[
  Set $h_s = 2 ceil.l T^2 ceil.r$ and $D = W^(4 h_s + 2) = exp \( O \( sqrt(L) thin T^2 \) \) = x^(o \( 1 \))$.
    By 12, there is a polynomial
  $ U \( n \) = sum_(d divides n) lambda_d gt.eq upright(bold(1))_(P^(-) \( n \) > W) \, $
  whose coefficients have modulus at most one, are supported on squarefree $d lt.eq D$ with primes at most $W$,
    and satisfy
  $ sum_(n in \[ P' \, 2 P' \]) #scale(x: 120%, y: 120%)[\(] U \( n \) -
    upright(bold(1))_(P^(-) \( n \) > W) #scale(x: 120%, y: 120%)[\)] lt.double P' e^(- h_s) + D . $
  The summand is nonnegative, so restriction to any $J'$ preserves this upper bound.
    Replacing roughness by $U$ in the normalized sum therefore costs at most $O \( e^(- h_s) + D \/ P' \)$,
    smaller than every fixed negative power of $L$. Also
  #[#set math.equation(numbering: n => "(5.21)")
   $ sum_d frac(\| lambda_d \|, d) lt.eq product_(p lt.eq W) \( 1 + 1 \/ p \) lt.double log W =
     sqrt(L) . $ <eq:sieve-harmonic-cost>]
  Write $q'$ for the character modulus. Terms with $\( d \, q' \) > 1$ vanish.
    For the other $d$, split $n = d v$ by $v = q' y + a$ modulo $q'$. The character is constant on a class.
    Its $y$ variable ranges over an interval at size $N = P' \/ \( d q' \) gt.eq x^(tau \/ 2)$ for large $x$.
    Put $u = t + sigma$. By taking $B_0 > C + 1$ we ensure $\| u \| gt.eq L^(B_0) \/ 2$.
    We claim, on every subinterval of the allowed $y$ range,
  #[#set math.equation(numbering: n => "(5.22)")
   $ lr(|sum_y exp \( i u log \( q' y + a \) \)|) lt.double N #scale(x: 120%, y: 120%)[\(] \| u \|^(- 1) +
     N^(- delta) #scale(x: 120%, y: 120%)[\)] $ <eq:log-phase-sum>]
  for a fixed $delta > 0$ depending only on $tau$.
  If $\| u \| lt.eq c N$, the monotone first derivative test gives $O \( N \/ \| u \| \)$,
    since the derivative of $u log \( q' y + a \) \/ \( 2 pi \)$ stays away from nonzero integers.
    Otherwise put $epsilon_0 = 1 \/ 10$. The overlapping ranges
  $ N^(k - 2 + epsilon_0) lt.eq \| u \| lt.eq N^(k - epsilon_0) \, wide k gt.eq 2 \, $
  cover $c N < \| u \| lt.eq x^2$ using $2 lt.eq k lt.eq K = ceil.l 4 \/ tau ceil.r + 3$.
    The $k$th derivative of this phase has constant sign and magnitude comparable to $\| u \| N^(- k)$.
    For $k = 2$, the second derivative test directly saves a positive power.
    For $k > 2$, apply the van der Corput differencing inequality $k -
    2$ times with positive integer shifts at most $H_0 = floor.l N^(epsilon_0 \/ \( 2 k \)) floor.r$.
    After shifts $h_1 \, dots.h \, h_(k - 2)$, the second derivative is an iterated integral of the $k$th
    derivative, and hence has constant sign and magnitude comparable to
  $ \| u \| N^(- k) h_1 dots.h.c h_(k - 2) \, quad upright("between ") c_k N^(- 2 + epsilon_0) upright(" and ")
    C_k N^(- epsilon_0 \/ 2) . $
  On an interval of any length $m lt.eq C N$, the second derivative bound is
  $ O (m sqrt(lambda) + lambda^(- 1 \/ 2)) lt.double N^(1 - epsilon_0 \/ 4) . $
  To justify the estimate uniformly for short subintervals,
    extend each sequence by zero in a containing interval of length $O \( N \)$.
    The differencing inequality for its normalized sum has the form $B_j^2 lt.double H_0^(- 1) + B_(j + 1)$,
    where $B_(j + 1)$ bounds the average of the absolute normalized correlations.
    Their supports are intersections of translates of the original interval, and so are again intervals.
    All shifts are $o \( N \)$, preserving the derivative bounds.
    Iterating from the final exponent $epsilon_0 \/ 4$ proves a bound $O \( N^(- delta_k) \)$ for the original
    normalized sum, with $delta_k = epsilon_0 \/ \( k 2^(k - 1) \)$.
    Taking $delta = epsilon_0 \/ \( K 2^(K - 1) \)$ proves (5.22) in every case.
    The differencing inequality itself follows by averaging $H_0$ translates and applying Cauchy–Schwarz;
    its zero-shift term is precisely the displayed $O \( H_0^(- 1) \)$.
  Partial summation of $1 \/ \[ d \( q' y + a \) \]$ costs $O \( 1 \/ P' \)$ times the uniform unweighted bound.
    Summing the at most $q'$ classes gives
  $ lr(|sum_(n in J'\
d divides n) chi \( n \) n^(- 1 + i u)|) lt.double 1 / d #scale(x: 120%, y: 120%)[\(] \| u \|^(- 1) +
  x^(- tau delta \/ 2) #scale(x: 120%, y: 120%)[\)] . $
  Finally (5.21) bounds the total by
  $ O \( e^(- h_s) + D \/ P' \) + O (sqrt(L) thin \( L^(- B_0) + x^(- tau delta \/ 2) \)) . $
  Choosing $B_0 > A + 2$ in addition to its previous constraint proves the lemma. ◻
]

=== 5.8 Completion and order of parameters <completion-and-order-of-parameters>

We finish (5.17). Outside $cal(E)$ its integral is $O \( L^(- 2 A_s + C_11) \)$,
  so choose $A_s$ sufficiently large. On the exceptional intervals with $\| t \| gt.eq L^(B_0)$,
  30 gives an arbitrarily strong uniform bound for $P_l$. Its range condition holds since $2 L \/ h = o \( Y \) =
  x^(1 + o \( 1 \)) < x^2 \/ 2$; the fixed frequency shift does not change this.
  The polynomial $P_s$ is bounded, and 29 gives

$ integral_(cal(E) ∩ { \| t \| gt.eq L^(B_0) }) \| P_s \( t \) P_l \( t \) cal(R) \( t \) \|^2 thin d t lt.double
  #scale(x: 120%, y: 120%)[\(] sup_(\| t \| gt.eq L^(B_0)) \| P_l \( t \) \|^2 #scale(x: 120%, y: 120%)[\)]
  L^(O \( 1 \)) . $

Here the supremum is restricted to the actual time range, and each occupied interval has length one.
  Choose the saving in the long-polynomial lemma after the exponent in the sparse bound.

For all remaining $\| t \| lt.eq L^(B_0)$ use (5.4) on the $m$ polynomial in $cal(R)$.
  The retained dyads satisfy $P M_0 P' R_0 asymp Y$, so $m lt.double Y = x^(1 + o \( 1 \)) < x^2$ for large $x$,
  also after the smooth cutoff has been separated. Its character modulus is a fixed log power,
  and its frequency is $t + sigma_0$. A single sufficiently large $B$ therefore bounds this polynomial by
  $L^(- B)$ throughout the range. Every other factor has absolute value $L^(O \( 1 \))$,
  and the length of this time interval is $2 L^(B_0)$. The resulting integral is $L^(- 2 B + B_0 + O \( 1 \))$,
  giving the required accuracy. This proves (5.17), then (5.11) by (5.16), and then every comparison bound.
  The residual pairing and the raw identity in (5.7) prove (5.5).

For completeness, the choices occur in the following order.
  First fix the endpoint bounds, group geometry, cutoff derivative bounds, and desired saving $D_0$.
  The uniform endpoint norm bound fixes the physical transfer target and its required ideal target;
  the fixed Mellin cutoff fixes the ideal frequency range. Next choose the probe count and comparison parameters
  of 24, then choose the fixed $J$ required by transference.
  All pattern, cell, and absolute norm costs are now determined.
  Choose the separation accuracies, arc exponent, local energy target, and Mellin tail precision.
  Next choose $A_s$, the accuracy of the long rough polynomial and its $B_0$.
  Finally choose one $B$ in (5.4) exceeding all the modulus, frequency, and low-time saving requirements,
  and let $x$ tend to infinity. The residual $L^2$ bounds used before the choice of $J$ depend only on the
  endpoint coefficient bounds and a fixed divisor moment. Increasing later Fourier tail accuracies uses more
  integrations by parts, with no enlargement of the already fixed ideal frequency range.
  Thus none of these choices is circular.

== 6 A Type II estimate <sec:typeii>

We apply the shifted-correlation estimate to factorizations $m n = 2 u + 1$,
  where $u$ carries a weight supported on many geometric prime bands.
  The coefficient of $m$ will satisfy the discrepancy hypothesis of 27;
  the coefficient of $n$ may be arbitrary within its stated bound.
  The task is to retain that discrepancy while converting multiplicative factorizations into additive correlations.

We split $u = e h$ with $e$ slightly smaller than the scale of $m$, using a smooth allocation of the band primes.
  Cauchy’s inequality in $\( e \, n \)$ then has a small enough outside factor to control its diagonal.
  Off the diagonal, the two factorizations give cross-products whose difference is a small nonzero integer.
  These are the shifted endpoints. All group factors and the compulsory rough integer are assigned to $h$,
  so both endpoints retain the form required by 27.

=== 6.1 The weight and the uniform statement <the-weight-and-the-uniform-statement>

Use the prime groups and the weight $W_ell$ of 5. In particular, the groups are disjoint,
  their harmonic masses belong to a fixed interval $\[ v_(-) \, v_(+) \] subset \( 0 \, oo \)$,
  and there are between fixed positive multiples of $T$ small groups and big groups.
  For fixed $0 < a < b < c < d < 0.47$, the small primes lie in $\[ exp \( L^a \) \, exp \( L^b \) \]$ and the big
  primes in $\[ exp \( L^c \) \, exp \( L^d \) \]$. The big groups have the interval structure required there.
  The damping $q in \( 0 \, 1 \)$ and the integer $ell gt.eq 1$ are fixed.
  Write $u_(*)$ for the factor of $u$ supported outside all these groups and $u_P = u \/ u_(*)$. Thus

$ W_ell \( u \) = product_g q^(omega_g \( u \) - ell) frac(\( omega_g \( u \) \)_ell, V_g^ell) . $

All constants describing these groups are among the fixed data below.

Fix $0 < c_1 < c_2$, $s' > 0$, and $lambda > 1$, with $c_2 s' < 1 \/ 4$. For $0 lt.eq j lt.eq j_x$ put

$ s_j = s' L lambda^(- j) \, wide cal(Q)_j = { p upright(" prime") : c_1 s_j lt.eq log p lt.eq c_2 s_j } . $

Assume that these intervals are pairwise disjoint and disjoint from the prime groups above,
  and that $c_(-) T lt.eq s_(j_x) lt.eq c_(+) T$ for fixed $0 < c_(-) lt.eq c_(+)$.
  Choose a fixed integer $r_0$ such that

#[#set math.equation(numbering: n => "(6.1)")
 $ \( r_0 - 1 \) c_1 \/ lambda gt.eq c_2 + 1 . $ <eq:typeii-band-room>]

There are $r_0$ labelled slots in every band. Each normally takes a prime in $cal(Q)_j$, with repetitions allowed.
  In one specified slot of a fixed band $j_(* *)$ replace the prime by an integer in

#[#set math.equation(numbering: n => "(6.2)")
 $ I_(* *) = \[ x^(tau_(*)) \, x^(eta_(*)) \] \, wide P^(-) \( p \) > W \,\
tau_(*) = c_1 s' lambda^(- j_(* *)) \, wide eta_(*) = c_2 s' lambda^(- j_(* *)) . $ <eq:typeii-rough-slot>]

The notation $p$ for this slot will never assert that it is prime.
  For sufficiently large $x$, this slot is free of group primes, since $exp \( L^d \) < W$.

Define

#[#set math.equation(numbering: n => "(6.3)")
 $ a_Q \( v \) & = (product_(j = 0)^(j_x) frac(1, r_0 !)) \# {
   upright("admissible labelled slot lists with product ") v } \,\
A \( u \) & = a_Q \( u_(*) \) W_ell \( u \) . $ <eq:typeii-weight>]

The exceptional integer can be fixed as a divisor of $v$.
  Thereafter the prime multiplicities in each disjoint band determine the list up to at most $r_0 !$ permutations.
  Consequently

#[#set math.equation(numbering: n => "(6.4)")
 $ 0 lt.eq a_Q \( v \) lt.eq tau \( v \) \, wide 0 lt.eq A \( u \) lt.eq L^(C'_A) tau \( u_(*) \) \, wide
   sum_v frac(a_Q \( v \), v) lt.eq L^(C'_A) $ <eq:typeii-weight-bounds>]

for a fixed exponent $C'_A$. Here the bound for $W_ell$ follows by maximizing $q^(t - ell) \( t \)_ell \/
  V_g^ell$ in each group. For the last bound, factor the harmonic sum slot by slot:
  every prime slot has bounded harmonic mass, the exceptional slot has mass $O \( L \)$,
  and there are $O \( T \)$ slots. The exponent in (6.4) depends only on the fixed data.

#thm([Theorem 6.1.])[
  (Type II).  #emph[Fix $D_(*) > 0$, $b_(*) > 0$, and $C > 0$, and require $eta_(*) < b_(*) \/ 4$ in (6.2).
    Let $U \, V$ be dyadic scales satisfying
$ U V asymp x \, wide x^(b_(*)) lt.eq U \, V lt.eq x^(1 - b_(*)) . $

 Let $Psi$ be a fixed smooth function with compact support in a fixed compact subinterval of $\( 0 \, oo \)$.
   Suppose that $\| alpha_m \| \, \| beta_n \| lt.eq L^C$, and that $alpha_m = 0$ unless $P^(-) \( m \) > W$.
   There is a fixed exponent $B$, depending only on these data and the fixed group and band constants,
   such that the discrepancy hypothesis in (5.4) on $alpha$ implies
#[#set math.equation(numbering: n => "(6.5)")
 $ sum_(m asymp U \, med n asymp V \, med u gt.eq 1\
m n = 2 u + 1) A \( u \) Psi \( u \/ x \) alpha_m beta_n lt.double x L^(- D_(*)) . $ <eq:typeii-bound>]

 Here the sequence to which the discrepancy hypothesis is applied includes the actual restriction $m asymp
   U$ and any additional interval restriction on $m$. Explicitly, for that restricted sequence one requires
$ lr(|sum_(m in I) frac(alpha_m chi \( m \) m^(i t), m)|) lt.eq L^(- B) quad
  (I subset \[ 1 \, x^2 \] \, quad mod \( chi \) lt.eq L^B \, quad \| t \| lt.eq L^B) . $

 There is no discrepancy hypothesis on $beta$. The constants are uniform over the sequences, scales,
   and interval restrictions satisfying these conditions.]
] <thm:typeii>

=== 6.2 Removing a large group-prime factor <removing-a-large-group-prime-factor>

#proof[
  We first discard $u_P > x^(b_(*) \/ 4)$ with an error smaller than every fixed negative power of $L$ times $x$.
    Set $theta = L^(- d)$. For one group write $a_p = \( p^(1 - theta) - 1 \)^(- 1)$.
    Since $p^theta lt.eq e$ and the group primes tend to infinity, $a_p lt.eq 2 e \/ p$.
    Its tilted marked harmonic sum is
  $ & sum_(v : med upright("all prime factors of ") v upright(" in ") cal(P)_g)
    frac(q^(omega_g \( v \) - ell) \( omega_g \( v \) \)_ell, V_g^ell v^(1 - theta))\
 & #h(1cm)  = 1 / V_g^ell product_(p in cal(P)_g) \( 1 + q a_p \) sum_(p_1 \, dots.h \, p_ell in cal(P)_g\
upright("distinct, ordered")) product_(i = 1)^ell frac(a_(p_i), 1 + q a_(p_i)) lt.eq C_0 . $
  The last constant is fixed because $v_(-) lt.eq V_g lt.eq v_(+)$. Taking the product over $O \( T \)$ groups gives
  #[#set math.equation(numbering: n => "(6.6)")
   $ sum_(v > x^(b_(*) \/ 4)\
v_(*) = 1) frac(W_ell \( v \), v) lt.eq exp #scale(x: 120%, y: 120%)[\(] - 1 /
  4 b_(*) L^(1 - d) #scale(x: 120%, y: 120%)[\)] L^(C_1) . $ <eq:typeii-P-tail>]
  On the support of the sum in (6.5), $u asymp x$. The number of divisors $m$ of $2 u +
    1$ all of whose prime factors exceed $W$ is at most $2^(log \( 2 u + 1 \) \/ log W) =
    exp \( O \( sqrt(L) \) \)$. Using (6.4), (6.6), multiplying harmonic mass by $O \( x \)$, and using $1 -
    d > 1 \/ 2$, the total discarded contribution is at most
  $ x L^(C_2) exp #scale(x: 120%, y: 120%)[\(] - 1 / 4 b_(*) L^(1 - d) +
    O \( sqrt(L) \) #scale(x: 120%, y: 120%)[\)] . $
  Call the remaining slot tuples good. This estimate is independent of the splitting precision introduced next.
  === 6.3 A smooth partition into two factors <a-smooth-partition-into-two-factors>
  Put $E = U L^(- K_0)$, where the fixed integer $K_0$ will be chosen after the splitting costs have been bounded.
    Our target is a weighted partition into factorizations $u = e h$ with
  #[#set math.equation(numbering: n => "(6.7)")
   $ E L^(- C_s) lt.eq e lt.eq E \, $ <eq:typeii-e-range>]
  where $C_s$ depends only on the band constants. The reason for placing $e$ below $U$ is that Cauchy’s inequality
    will contribute an outside factor $E V asymp x L^(- K_0)$.
    We will use this logarithmic saving to control the diagonal;
    it is therefore essential that the splitting costs be independent of $K_0$.
  Allocate all of $u_P$ and the exceptional integer slot to $h$.
    This preserves the group weight and the long rough factor at each eventual shifted endpoint.
    Process the remaining prime slots in increasing order of their band index,
    and in a fixed order within each band. Write $v_i = log p_i$,
    and let $s_(j \( i \))$ be the scale of slot $i$. If $delta_i in { 0 \,
    1 }$ records whether it is allocated to $e$, put
  $ R_i = log E - sum_(t < i) delta_t v_t . $
  Fix $gamma in C^oo \( bb(R) \)$ with $0 lt.eq gamma lt.eq 1$, $gamma \( t \) = 0$ for $t lt.eq 0$,
    and $gamma \( t \) = 1$ for $t gt.eq 1$. At slot $i$ take it into $e$ with probability
    $gamma \( \( R_i - v_i \) \/ s_(j \( i \)) \)$; otherwise put it into $h$.
  We verify the range in (6.7) by tracking the unfilled logarithmic size. At every stage the induction target is
  $ 0 lt.eq R_i lt.eq sum_(t gt.eq i) v_t + \( c_2 + 1 \) s_(j_x) . $
  The terminal allowance accounts for a skip in the final band.
    On a good tuple the factors assigned to $h$ before the procedure starts have product at most $x^(b_(*) \/ 2)$.
    The sum of the available prime logarithms is therefore at least $\( 1 - b_(*) \/ 2 \) L + O \( 1 \)$,
    whereas $0 < log E lt.eq \( 1 - b_(*) \) L - K_0 T$ for large $x$.
    This proves the initial bound, even without the terminal allowance.
    Taking a slot of positive probability requires $R_i > v_i$ and subtracts $v_i$ from both the residual and the
    available logarithm, so it preserves the bound and nonnegativity. Skipping a slot of positive probability requires
  #[#set math.equation(numbering: n => "(6.8)")
   $ R_i < v_i + s_(j \( i \)) lt.eq \( c_2 + 1 \) s_(j \( i \)) . $ <eq:typeii-skip>]
  If a later band exists, its unprocessed prime slots have total logarithm at least $\( r_0 - 1 \) c_1
    s_(j \( i \) + 1) gt.eq \( c_2 + 1 \) s_(j \( i \))$ by (6.1).
    The subtraction of one slot covers the possible exceptional integer in that later band.
    Hence, after such a skip, the residual fits inside the remaining available logarithm.
    In the final band, a skip leaves at most $\( c_2 + 1 \) s_(j_x)$,
    and subsequent operations cannot increase this residual. This proves the induction target.
    After processing the last slot it gives
  $ 0 lt.eq log E - log e lt.eq \( c_2 + 1 \) s_(j_x) . $
  Since $s_(j_x) lt.eq c_(+) T$, this proves (6.7) with $C_s = \( c_2 + 1 \) c_(+)$.
    The geometric series for the remaining band scales also bounds $R_i \/ s_(j \( i \))$ by a fixed constant.
    Both bounds are independent of $K_0$.
  Choose a fixed smooth compactly supported function $rho$ with values in $\[ 0 \, 1 \]$,
    equal to one throughout the resulting possible range of $\( R_i - v_i \) \/ s_(j \( i \))$.
    Replace the two transition functions by
  $ f_1 = rho gamma \, wide f_0 = rho \( 1 - gamma \) . $
  This changes no branch on a good tuple. For an arbitrary tuple the sum of the two transitions is $rho lt.eq 1$,
    so its total branch mass is at most one. Insert the resulting partition, with (6.7), into (6.3).
    Keep every original factorial normalization. The branches sum to one on good tuples,
    and extending back to all tuples costs at most the error in (6.6).
    Every resulting $h$ contains the exceptional rough integer.
  Here are quantitative details of the smooth separation, including its independence from $K_0$.
    Let $N = O \( T \)$ be the number of processed slots, and use the Fourier convention
  $ f \( t \) = \( 2 pi \)^(- 1) integral hat(f) \( xi \) e^(i xi t) thin d xi . $
  Choose a fixed $C_F gt.eq 1$ bounding the Fourier $L^1$ norms of both $f_0 \, f_1$,
    with the normalization $\( 2 pi \)^(- 1)$ included. Summing the Fourier total variations over the $2^N$
    patterns gives at most $\( 2 C_F \)^N = L^(O \( 1 \))$. Truncating each $\|
    xi_i \|$ at $L$ has total error bounded, for every fixed $M$, by
  $ 2^N N C_M C_F^(N - 1) L^(- M) . $
  Thus any prescribed power saving is available. In a fixed pattern the product of Fourier exponentials is a
    scalar of modulus one times $product_t p_t^(i sigma_t)$, where
  #[#set math.equation(numbering: n => "(6.9)")
   $ sigma_t = - xi_t / s_(j \( t \)) - delta_t sum_(i > t) xi_i / s_(j \( i \)) . $ <eq:typeii-slot-frequencies>]
  Indeed the scalar is $exp \( i log E sum_i xi_i \/ s_(j \( i \)) \)$.
    Since $sum_i 1 \/ s_(j \( i \)) lt.double 1 \/ T$, the frequencies in (6.9) are $O \( L \/ T \)$.
    All the bounds in this paragraph are independent of $K_0$.
  Separate $Psi \( e h \/ x \)$ by Fourier inversion in $log \( e h \/ x \)$ as well.
    Its Fourier $L^1$ norm is fixed, and the tail outside frequency $L$ has arbitrary power saving;
    its two factors are powers of $e$ and $h$. These errors can all be summed before Cauchy’s inequality.
    Indeed, the absolute sum over the original factorizations is bounded by
  #[#set math.equation(numbering: n => "(6.10)")
   $ L^(O \( 1 \)) sum_(u asymp x) tau \( u \) tau \( 2 u + 1 \) lt.double x L^(O \( 1 \))
     $ <eq:typeii-absolute-pre-cauchy>]
  by Cauchy’s inequality and 7. The same estimate applies to each uniform transition or cutoff error,
    using the total Fourier variations of the other factors. Thus the original sum is,
    up to $O \( x L^(- D_(*) - 1) \)$, an integral and a sum of total variation at most $L^(C_f)$ of expressions
  #[#set math.equation(numbering: n => "(6.11)")
   $ B_0 = sum_(E L^(- C_s) lt.eq e lt.eq E\
n asymp V) a_e \( e \) beta_n sum_(m asymp U \, med h gt.eq 1\
m n = 2 e h + 1) alpha_m a_h \( h \) . $ <eq:typeii-separated-B>]
  The exponent $C_f$ and every coefficient exponent in the next display are independent of $K_0$:
  #[#set math.equation(numbering: n => "(6.12)")
   $ \| a_e \( e \) \| lt.eq L^(C_a) \, wide a_h \( h \) = h^(i 𝜚) W_ell \( h \) H \( h_(*) \) \,\
H \( t \) = sum_(p r = t) upright(bold(1))_(p in I_(* *) \, thin P^(-) \( p \) > W) p^(i sigma) c_r \,
  quad \| c_r \| lt.eq L^(C_a) . $ <eq:typeii-separated-coefficients>]
  In particular $\| a_h \( h \) \| lt.eq L^(O \( 1 \)) tau \( h_(*) \)$.
    To verify these statements, only group-free prime slots go into $e$, so $\( e h \)_(*) =
    e h_(*)$ and $W_ell \( e h \) = W_ell \( h \)$. For a fixed pattern,
    the number of ordered pure-prime lists at a fixed product is at most $\( r_0 ! \)^(j_x + 1) = L^(O \( 1 \))$.
    This proves both the $a_e$ bound and the bound for the residual coefficient $c_r$.
    Fixing the exceptional integer as a divisor gives the bound for $a_h$.
    Individual slot twists have modulus one; the common power of $h$ from the cutoff is $h^(i 𝜚)$.
    The frequencies $𝜚 \, sigma$ have fixed power bounds in $L$.
  === 6.4 Cauchy’s inequality and the diagonal <cauchys-inequality-and-the-diagonal>
  By Cauchy’s inequality in $\( e \, n \)$, (6.11) satisfies
  #[#set math.equation(numbering: n => "(6.13)")
   $ \| B_0 \|^2 lt.eq E V L^(C_3) cal(N) \, wide cal(N) = sum_(e \, n) eta_e \( e \/ E \) eta_n \( n \/ V \)
     lr(|sum_(m asymp U \, med h gt.eq 1\
m n = 2 e h + 1) alpha_m a_h \( h \)|)^2 . $ <eq:typeii-cauchy>]
  Here $eta_e \, eta_n$ are nonnegative smooth majorants, bounded by a fixed constant,
    equal to one on the original ranges. They vanish unless
  $ 1 / 2 E L^(- C_s) lt.eq e lt.eq 2 E \, wide n asymp V . $
  Their derivatives of order $j$ in their displayed arguments are $O_j \( L^(C_4 \( j + 1 \)) \)$, with $C_3 \,
    C_4$ independent of $K_0$. For instance the lower edge of $eta_e$ is obtained by rescaling a fixed smooth
    cutoff by $L^(C_s)$.
  On the diagonal $m = m'$ the two equations force $h = h'$.
    For fixed $m \, n$, the allowable $e$ divide $\( m n - 1 \) \/ 2$, and
  $ sum_(e divides \( m n - 1 \) \/ 2) tau #scale(x: 120%, y: 120%)[\(] \( m n - 1 \) \/ \( 2 e \)
    #scale(x: 120%, y: 120%)[\)]^2 lt.eq tau \( m n - 1 \)^3 . $
  Collecting by $v = m n$ and using 7, we obtain
  #[#set math.equation(numbering: n => "(6.14)")
   $ cal(N)_(upright("diag")) lt.double L^(O \( 1 \)) sum_(v asymp x) tau \( v \) tau \( v - 1 \)^3 lt.double x
     L^(C_5) . $ <eq:typeii-diagonal>]
  The exponents $C_3 \, C_5$ are independent of $K_0$. Since $E V asymp x L^(- K_0)$,
    its contribution to $\| B_0 \|^2$ is $O \( x^2 L^(- K_0 + C_3 + C_5) \)$.
    We can therefore fix $K_0$ large enough that its square root, even multiplied by $L^(C_f)$,
    is $O \( x L^(- D_(*) - 1) \)$. All subsequent precisions may depend on this fixed $K_0$.
  === 6.5 The exact determinant parametrization <the-exact-determinant-parametrization>
  Consider an off-diagonal term of (6.13), with
  #[#set math.equation(numbering: n => "(6.15)")
   $ m n = 2 e h + 1 \, wide m' n = 2 e h' + 1 \, wide m eq.not m' . $ <eq:typeii-two-equations>]
  The shared variables $e \, n$ force the two $m$ values to be congruent modulo $2 e$:
    the first equation makes $n$ a unit modulo $2 e$, and subtracting the equations gives $2 e divides m' - m$.
    Write $m' - m = 2 e k$, with $k eq.not 0$. The resulting identities are
  #[#set math.equation(numbering: n => "(6.16)")
   $ m' - m = 2 e k \, wide h' - h = k n \, wide z = m' h \, wide z + k = m h' . $ <eq:typeii-determinant>]
  The last identity follows from $m h' - m' h = k \( m n - 2 e h \) = k$. The enlarged $e$ range gives
  #[#set math.equation(numbering: n => "(6.17)")
   $ 0 < \| k \| lt.double L^(K_0 + C_s) . $ <eq:typeii-k-range>]
  Conversely, fix such a $k$, positive integers $m \, m' \, h \, h'$ with $P^(-) \( m \) \, P^(-) \( m' \) > W$,
    and representations $m' h = z$, $m h' = z + k$. Suppose
  $ m' equiv m med \( mod med 2 \| k \| \) \, wide e = frac(m' - m, 2 k) > 0 . $
  Then $e$ is an integer and
  #[#set math.equation(numbering: n => "(6.18)")
   $ m \( h' - h \) = k \( 2 e h + 1 \) . $ <eq:typeii-converse-identity>]
  Every prime factor of $m$ exceeds $W$, whereas $\| k \|$ is bounded by a fixed power of $L$.
    Hence $\( m \, k \) = 1$ for sufficiently large $x$. (6.18) implies $m divides 2 e h + 1$.
    Set $n = \( 2 e h + 1 \) \/ m$, a positive integer. The same identity gives $h' - h = k n$,
    and substituting $m' = m + 2 e k$ recovers the second equation of (6.15).
    This proves a bijection, with all variables recovered by the displayed formulas.
    In particular, no additional divisibility condition is being dropped.
    The coprimality $\( m \, k \) = 1$ is necessary to this converse.
  3 displays the cross-pairing that produces the two shifted endpoints.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((-0.2475, 0.6525), (0.2475, 1.147), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$m$]]], frame: "circle", fill: rgb("#f7f7ff"), stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10))
  content((3.753, 0.6525), (4.247, 1.147), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$h$]]], frame: "circle", fill: rgb("#f7f7ff"), stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10))
  content((-0.2475, -1.147), (0.2475, -0.6525), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$m'$]]], frame: "circle", fill: rgb("#f7f7ff"), stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10))
  content((3.753, -1.147), (4.247, -0.6525), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[$h'$]]], frame: "circle", fill: rgb("#f7f7ff"), stroke: (paint: rgb("#000080"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0.5429), (0, -0.5429), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#666666"))))
  content((0, 0), [#text(size: 9pt)[$+2"ek"$]], anchor: "east", padding: 0.1176cm)
  line((4, 0.5429), (4, -0.5429), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#666666"))))
  content((4, 0), [#text(size: 9pt)[$+"kn"$]], anchor: "west", padding: 0.1176cm)
  line((0.3256, 0.7535), (3.674, -0.7535), stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10))
  content((1.04, 0.432), [#text(size: 9pt)[$"mh"'=z+k$]], anchor: "south", padding: 0.1176cm)
  line((0.3256, -0.7535), (3.674, 0.7535), stroke: (paint: rgb("#000099"), thickness: 0.8pt, miter-limit: 10, dash: "dashed"))
  content((1.04, -0.432), [#text(size: 9pt)[$m'h=z$]], anchor: "north", padding: 0.1176cm)
  content((6, 0), [#text(size: 9pt)[$"mn"-2"eh"=1$#linebreak() $m'n-2"eh"'=1$#linebreak() $"mh"'-m'h=k != 0$]], anchor: "west", padding: 0.1176cm)
})],
    caption: [Figure 3: Forward determinant identities for factorizations with common $e \, n$. Cross-paired factors give $z = m' h$ and $z + k = m h'$; the vertical arrows record signed increments, so either sign of $k$ is allowed. The converse reconstruction, including its congruence, positivity, and coprimality conditions, is proved in the text. ],
  ) <fig:determinant>
  Both $m$ and $m'$ are units modulo $q_k = 2 \| k \|$, so the congruence is imposed exactly by
  #[#set math.equation(numbering: n => "(6.19)")
   $ upright(bold(1))_(m' equiv m med \( q_k \)) = frac(1, phi \( q_k \)) sum_(chi med mod med q_k) chi \( m \)
     overline(chi \( m' \)) . $ <eq:typeii-character-congruence>]
  Thus $cal(N)_(upright("off"))$ is a sum over $k \, z$ and these characters of terms having coefficient
  $ alpha_m overline(alpha_(m')) chi \( m \) overline(chi \( m' \)) a_h \( h \) overline(a_h \( h' \)) \, wide
    m' h = z \, quad m h' = z + k \, $
  with the enlarged smooth $\( e \, n \)$ cutoffs. Their arguments are now the exact functions
  #[#set math.equation(numbering: n => "(6.20)")
   $ e = frac(m' - m, 2 k) \, wide n = frac(\( m' - m \) z, k m m') + 1 / m . $ <eq:typeii-pulled-back>]
  The cutoffs are extended smoothly by zero to nonpositive arguments,
    so they impose the positivity and size conditions as well.
  === 6.6 Smooth separation and the shifted endpoints <smooth-separation-and-the-shifted-endpoints>
  On the support just obtained, $m \, m' asymp U$, $n asymp V$, and $h asymp x \/ e$.
    Hence $z = m' h$ lies in $\[ x L^(- C_6) \, x L^(C_6) \]$ for a fixed $C_6$ now allowed to depend on $K_0$.
    Insert a smooth dyadic partition in $z$ with $O \( T \)$ terms, and denote one scale by $Z = x L^(O \( 1 \))$.
    Keep its smooth cutoff $psi_Z \( z \/ Z \)$ outside the ensuing Fourier expansion.
  For completeness, the pulled-back cutoffs have the following uniform regularity.
    Put $t_1 = log \( m \/ U \)$, $t_2 = log \( m' \/ U \)$, $t_3 = log \( z \/ Z \)$.
    Multiply by fixed smooth localizations in these three variables equal to one on the ranges in use.
    From (6.20), every derivative of $e \/ E$ in the $t_i$ is $O_j \( U \/ \( \| k \| E \) \)$,
    and every derivative of $n \/ V$ is
  $ O_j #scale(x: 120%, y: 120%)[\(] Z \/ \( \| k \| U V \) + \( U V \)^(- 1) #scale(x: 120%, y: 120%)[\)] . $
  Both are bounded by fixed powers of $L$; moreover, the normalized derivatives of $eta_e \,
    eta_n$ have the bounds already given. Repeated use of the chain rule therefore bounds derivatives of the
    localized product cutoff by $O_j \( L^(C_7 \( j + 1 \)) \)$.
    Its support in $\( t_1 \, t_2 \, t_3 \)$ is a fixed compact box.
    Fourier inversion, as in 10, consequently represents this cutoff with total variation $L^(O \( 1 \))$ as a
    superposition of
  #[#set math.equation(numbering: n => "(6.21)")
   $ m^(i xi_1) \( m' \)^(i xi_2) z^(i xi_3) . $ <eq:typeii-three-powers>]
  Here is an explicit tail estimate. Enlarge a fixed exponent $C_8$ so that, with $P = L^(C_8)$,
    the localized cutoff $F$ satisfies $parallel partial^alpha F parallel_oo lt.double_alpha P^(\| alpha \|)$;
    its zeroth derivative is bounded independently of $L$. Integration by parts then gives
  $ \| hat(F) \( xi \) \| lt.double_j \( 1 + \| xi \| \/ P \)^(- j) \, wide
    integral_(bb(R)^3) \| hat(F) \( xi \) \| thin d xi lt.double P^3 \, wide
    integral_(\| xi \| > P L) \| hat(F) \( xi \) \| thin d xi lt.double_j P^3 L^(3 - j) . $
  Thus truncation at $P L$ has uniform error $O \( L^(- A) \)$ for every fixed $A$, by choosing $j > A + 3 C_8 +
    3$. These later exponents may depend on $K_0$.
  There is sufficient absolute control to sum these errors.
    If the coefficients in (6.12) and the two $m$ sequences are replaced by their absolute values,
    each resulting endpoint convolution is at most $L^(O \( 1 \)) tau \( z_(*) \)^2$.
    Its product with $W_ell \( z \)$ has squared sum $O \( Z L^(O \( 1 \)) \)$ on $z asymp Z$.
    Cauchy’s inequality, also at $z + k$, therefore bounds the absolute correlation by $Z L^(O \( 1 \))$.
    This uses only 7. It remains true after dropping the congruence; hence it controls the errors just described,
    after summing the polynomial number of $k$ values, dyads, and character terms.
  We spell out the endpoint identification to track exactly which sequence satisfies discrepancy.
    Use the notation of (6.12) and fix a character $chi$ and frequencies in (6.21).
    Since $m \, m'$ are free of group primes,
  $ z_(*) = m' h_(*) \, wide \( z + k \)_(*) = m h'_(*) \, wide W_ell \( z \) = W_ell \( h \) \, quad
    W_ell \( z + k \) = W_ell \( h' \) . $
  Define the invariant endpoint functions
  #[#set math.equation(numbering: n => "(6.22)")
   $ F_0 \( v \) & = sum_(m p r = v_(*)) alpha_m chi \( m \) m^(i \( 𝜚 - xi_2 \))
     upright(bold(1))_(p in I_(* *) \, thin P^(-) \( p \) > W) p^(- i sigma) overline(c_r) \,\
G_0 \( v \) & = sum_(m p r = v_(*)) alpha_m chi \( m \) m^(i \( xi_1 + 𝜚 \))
  upright(bold(1))_(p in I_(* *) \, thin P^(-) \( p \) > W) p^(- i sigma) overline(c_r) . $ <eq:typeii-first-endpoint>]
  Direct substitution shows that the separated summand is
  $ psi_Z \( z \/ Z \) z^(i \( 𝜚 + xi_3 \)) \( z + k \)^(- i 𝜚) overline(F_0 \( z \)) G_0 \( z + k \)
    W_ell \( z \) W_ell \( z + k \) \, $
  up to scalar phases of modulus one and the Fourier coefficient.
    For example, at $z = m' h$ the factor $h^(i 𝜚)$ becomes $z^(i 𝜚) \( m' \)^(- i 𝜚)$,
    which explains the first endpoint’s power and the conjugation of $c_r$.
    In particular, the sequence inside $F_0$ is the original $alpha$, with its actual interval restriction.
  Both (6.22), (6.22) have exactly the form in (5.3). The character modulus $2 \| k \|$, all power frequencies,
    and the coefficient bounds are fixed powers of $L$. The interval $I_(* *)$ lies in $\[ x^tau \, x^eta \]$ for
    fixed $0 < tau < eta < 1 \/ 4$, by (6.2) and the hypothesis $eta_(*) < b_(*) \/ 4$.
    The residual $c_r$ has a fixed power bound, and no roughness condition on $r$ is needed.
    The original $alpha$ is supported on $W$-rough integers and satisfies (5.4);
    the explicit character and power factors are precisely the factors permitted in (5.3).
    Thus the discrepancy assumption has not been silently transferred to a new coefficient sequence.
  Finally set $tilde(psi)_Z \( t \) = t psi_Z \( t \)$. The last unweighted correlation equals $Z$ times
  $ sum_(z > 0 \, med z + k > 0) frac(tilde(psi)_Z \( z \/ Z \), z) z^(i \( 𝜚 + xi_3 \)) \( z + k \)^(- i 𝜚)
    overline(F_0 \( z \)) G_0 \( z + k \) W_ell \( z \) W_ell \( z + k \) . $
  This is (5.5), including its harmonic normalization. Given any fixed $D_0$,
    27 bounds it by $L^(- D_0)$ once the discrepancy exponent $B$ is sufficiently large.
    Consequently each separated unweighted correlation is $O \( Z L^(- D_0) \)$.
    Choose $D_0$ after $K_0$, the $k$ range, all separation costs, and the desired saving in (6.13).
    The total off-diagonal contribution is then $O \( x L^(- A) \)$ for any prescribed fixed $A$.
    Choose $B$ after this application of 27. Together with (6.14),
    this gives $\| B_0 \| lt.double x L^(- D_(*) - C_f - 1)$.
    Summing its pre-Cauchy expansion and the previously estimated tails proves (6.5). ◻
]

#prodef([Remark 6.2.])[
  (Order of the precisions).  The band constants, $j_(* *)$, $b_(*)$, coefficient bound $C$,
    and target $D_(*)$ are fixed first. The transition functions, their total variation,
    and the coefficient and diagonal exponents are independent of $K_0$; only then is $K_0$ chosen.
    The smooth separation after Cauchy’s inequality and the accuracy required from 27 are fixed next,
    and the required discrepancy exponent $B$ is fixed last. Accordingly,
    when $alpha$ is the difference between a test and its rough-integer proxy,
    the precision of the cells defining that proxy may be chosen after $B$,
    provided the proxy’s coefficient bound is already uniform in that cell precision. This is the order used in 7.
] <rem:typeii-order>

== 7 Extracting primes with smooth predecessors <sec:primes>

We prove 2. Throughout this section $0 < delta < 1 \/ 4$ is fixed.
  The task is to detect primes among $N_u := 2 u + 1$ for a positive weight on integers $u$ all of whose prime
  factors are small. The distribution estimate of 31 will replace tests on a factor of $N_u$ by simpler tests on
  rough integers. We specify the order of all remaining parameter choices at the end of the section.

The extraction separates the composites according to their least prime factor.
  A preliminary sieve retains those $N_u$ with no prime factor below $x^(b_1)$,
  where $b_1 > 0$ is fixed and small. For a fixed small $kappa >
  0$ and least prime factors up to $x^(1 \/ 2 - kappa)$, Type II replaces the roughness condition on the
  complementary factor by a local density on ordinary integers.
  Integrating these densities accounts for the composite part of the sieve mass.
  The remaining composites have two prime factors close to $x^(1 \/ 2)$;
  a separate upper-bound sieve makes their contribution small with $kappa$.
  Its constant must be independent of $kappa$, so we will establish that uniformity before making the final choices.

=== 7.1 The candidate and its mass <the-candidate-and-its-mass>

Fix a nonnegative smooth function $Psi$ supported in $\[ 1 \, 2 \]$ that is bounded below by a positive constant
  on a closed interval of positive length contained in $\( 1 \, 2 \)$.
  In the marked weight of 5 take $q = 1 \/ 2$ and $ell = 1$. Set

$ c_1 = 1 \, quad c_2 = 6 / 5 \, quad c_3 = 3 / 2 \, quad c_4 = 9 / 5 \, wide s' = frac(1, r_0 \( c_1 + c_2 \)) \,
  wide s_j = s' 2^(- j) L \, $

where the fixed integer $r_0$ is sufficiently large that

#[#set math.equation(numbering: n => "(7.1)")
 $ c_2 s' < delta \, wide frac(\( r_0 - 1 \) c_1, 2) gt.eq c_2 + 1 . $ <eq:candidate-geometry>]

Let $j_x$ be the largest integer with $c_1 s_(j_x) gt.eq 20 T$, and let

$ Q_j = { p upright(" prime") : c_1 s_j lt.eq log p lt.eq c_2 s_j } wide \( 0 lt.eq j lt.eq j_x \) . $

At each scale for which $\[ c_3 s_j \, c_4 s_j \]$ lies wholly in $\[ L^(1 \/ 10) \, L^(1 \/ 5) \]$ or
  $\[ L^(3 \/ 10) \, L^(2 \/ 5) \]$, take the primes in that interval of logarithms as a small or big P-group,
  respectively. The P-groups and the Q-bands are pairwise disjoint:
  the four constants lie in the displayed order, and $c_4 < 2 c_1$.
  The prime number theorem and partial summation give fixed upper and positive lower bounds for each of their
  reciprocal prime masses. Both numbers of P-groups are comparable to $T$,
  and their exponent ranges and endpoint ratios meet the hypotheses of the preceding sections.

There are $r_0$ ordered slots in each Q-band. Except for one designated slot in a fixed band $j_(* *)$,
  a slot contains a prime of its band. The designated slot instead contains any integer $v$ satisfying

$ e^(c_1 s_(j_(* *))) lt.eq v lt.eq e^(c_2 s_(j_(* *))) \, wide P^(-) \( v \) > W . $

We always require $j_(* *) gt.eq j_0$, where $j_0$ is a sufficiently large fixed lower bound chosen below using
  only the candidate geometry. In particular $j_(* *) gt.eq 1$. Define

$ a_Q \( v \) = product_(j = 0)^(j_x) frac(1, r_0 !) \# { upright("admissible ordered Q-lists with product ")
  v } \, wide A \( u \) = a_Q \( u_(*) \) W_1 \( u \) . $

The P-free part $u_(*)$ and the marked weight $W_1$ are those of 5.
  The rough slot has no P-prime divisor for large $x$, since all P primes are less than $W$.

The candidate must have substantial ordinary mass near $x$, despite the restrictions on all its factors.
  Reciprocal weights make the slot choices independent. The band geometry leaves room for one prime in the largest
  band to adjust their product to size $x$; under this harmonic sampling,
  that prime supplies a local probability of order $1 \/ L$.
  The next proposition records the resulting mass and the pointwise bound needed to convert that mass into a count
  of distinct primes.

#thm([Proposition 7.1.])[
  (Candidate mass).  #emph[Put
$ X_A = sum_u A \( u \) Psi \( u \/ x \) \, quad H_Q = sum_v frac(a_Q \( v \), v) \, quad H_P =
  sum_(r : r_(*) = 1) frac(W_1 \( r \), r) . $

 There are constants $C \, C_A$ depending only on the early candidate choices such that,
   for sufficiently large $x$ after fixing $j_(* *)$,
#[#set math.equation(numbering: n => "(7.2)")
 $ 0 lt.eq A \( u \) & lt.eq L^C tau \( u_(*) \) \, & A \( u \) & lt.eq exp \( C sqrt(L) \) quad \( u asymp x \) \,\
H_P & tilde.op exp (q sum_g V_g) \, & X_A & asymp x / L H_Q H_P gt.double x L^(- C_A) . $ <eq:candidate-pointwise>]

 The comparison constants in (7.2) can be chosen independently of $j_(* *) gt.eq j_0$.
   On the support of $A \( u \) Psi \( u \/ x \)$ every prime divisor of $u$ lies in $\[ L^20 \, x^delta \]$.]
] <prop:candidate-mass>

#proof[
  After fixing the value of the rough slot as a divisor of $v$,
    the remaining prime multiplicities determine their band assignments.
    The normalized number of ordered lists in each band is at most one.
    This gives $a_Q \( v \) lt.eq tau \( v \)$. For $v lt.double x$,
    any possible rough-slot divisor divides the part of $v$ supported on primes exceeding $W$.
    That part has at most $O \( L \/ log W \) = O \( sqrt(L) \)$ prime factors counted with multiplicity,
    and hence at most $exp \( O \( sqrt(L) \) \)$ divisors. Together with the pointwise bound $W_1 \( u \) lt.eq
    L^(O \( 1 \))$ this proves (7.2). The claimed lower and upper bounds on prime factors follow from the
    definitions, (7.1), and $exp \( L^(2 \/ 5) \) < x^(c_2 s')$ for large $x$.
  ===== 7.1.1 Harmonic masses and the P-part. <harmonic-masses-and-the-p-part.>
  The Q harmonic sum factorizes into the reciprocal masses of all its slots, divided by $r_0 !$ in each band.
    Each pure-prime slot has mass between two fixed positive constants.
    The rough-slot mass is at most $O \( L \)$ and is bounded below by a fixed positive constant for sufficiently
    large $x$ after fixing $j_(* *)$; for the latter assertion one may restrict that slot to primes of
    $Q_(j_(* *))$, which then all exceed $W$. Since there are $O \( T \)$ slots,
  #[#set math.equation(numbering: n => "(7.3)")
   $ L^(- C) lt.eq H_Q lt.eq L^C . $ <eq:candidate-harmonic-size>]
  This exponent and these eventual bounds do not depend on $j_(* *)$.
  For one P-group write $F_g \( q \) = product_(p in cal(P)_g) \( 1 + q \/ \( p - 1 \) \)$.
    Summing over all powers of its prime divisors shows that its factor in $H_P$ is
  #[#set math.equation(numbering: n => "(7.4)")
   $ frac(F'_g \( q \), V_g) = F_g \( q \) 1 / V_g sum_(p in cal(P)_g) frac(1, p - 1 + q) . $ <eq:marked-euler-factor>]
  As $sum_(g \, p in cal(P)_g) p^(- 2) = o \( 1 \)$ and $V_g$ is bounded above and below,
    multiplying (7.4) proves the asymptotic for $H_P$. It also proves the useful exact inequality
  #[#set math.equation(numbering: n => "(7.5)")
   $ H_P gt.eq product_(p upright(" a P prime")) (1 + frac(q, p - 1)) \, $ <eq:mask-euler-comparison>]
  since $p - 1 + q lt.eq p$.
  The harmonic P-measure assigns negligible mass to $r > x^sigma$ for any fixed $sigma > 0$.
    Indeed set $xi = L^(- 2 \/ 5)$ and replace $p^(- 1)$ by $p^(- 1 + xi)$ in the preceding Euler calculation.
    Since $p^xi lt.eq e$ for every P prime, the tilted factor of each group is bounded by a fixed constant. Consequently
  #[#set math.equation(numbering: n => "(7.6)")
   $ sum_(r > x^sigma \, med r_(*) = 1) frac(W_1 \( r \), r) lt.eq
     exp \( - sigma L^(3 \/ 5) \) L^(O \( 1 \)) . $ <eq:candidate-P-tail>]
  ===== 7.1.2 Localizing the product near $x$. <localizing-the-product-near-x.>
  Normalize the independent P choice and all the Q-slot harmonic choices by $H_P H_Q$,
    and denote their product by $U$. Then
  $ X_A = H_P H_Q thin bb(E) { U Psi \( U \/ x \) } . $
  For the upper comparison we need probability $O \( 1 \/ L \)$ throughout $x lt.eq U lt.eq 2 x$;
    for the lower comparison we need probability $gt.double 1 \/ L$ where $U \/
    x$ lies in the positivity interval of $Psi$. Both are intervals of bounded length for $log U$.
    The P-tail estimate ensures that the P-part does not move the product out of reach of the largest Q-band.
    Condition on everything except one pure-prime slot in $Q_0$.
    The prime number theorem implies that its logarithm falls in any interval of bounded length with probability
    $O \( 1 \/ L \)$, uniformly in the location of that interval.
    Thus $bb(P) \( x lt.eq U lt.eq 2 x \) = O \( 1 \/ L \)$, giving the upper mass bound.
  Here is a uniform lower bound. The sum of the midpoints of all the infinite Q-bands, counting their $r_0$ slots,
    is exactly
  $ sum_(j gt.eq 0) r_0 frac(c_1 + c_2, 2) s' 2^(- j) L = L . $
  Let $Delta = \( c_2 - c_1 \) s' L$, the logarithmic width of the free slot.
    Choose a fixed prefix of bands so long that the sum of all later band widths and midpoints is less than
    $Delta \/ 24$. Within that prefix, restrict all slots except the free slot to fixed small relative
    neighborhoods of their midpoints, so that their total deviation is at most $Delta \/ 24$.
    This event has probability bounded below by a positive constant:
    it involves only a fixed number of pure-prime slots. Choose $j_0$ larger than the prefix length so that the
    exceptional slot is always in the unrestricted tail. Its full range obeys the same deterministic tail bound.
    Missing bands after $j_x$ also obey that bound. Finally restrict the P choice to $log r lt.eq Delta \/ 12$,
    at negligible loss by (7.6). On this event, a target interval for $log
    U$ coming from the positivity interval of $Psi$ gives an interval of fixed positive length for the free slot,
    lying a distance at least $Delta \/ 4$ from its range endpoints for large $x$.
    The prime number theorem gives conditional probability $gt.double 1 \/ L$.
    Multiplying by $U asymp x$ proves the lower comparison in (7.2).
    This argument uses no property of the tail distribution beyond its range,
    so its constants are uniform in the later choice of $j_(* *)$.
    The final lower bound follows from (7.3) and the Euler calculation. ◻
]

=== 7.2 Congruence distribution and the preliminary sieve <congruence-distribution-and-the-preliminary-sieve>

For odd squarefree $d$ define

$ r \( d \) = sum_(d divides N_u) A \( u \) Psi \( u \/ x \) - frac(X_A, phi \( d \)) . $

#thm([Proposition 7.2.])[
  (Type I distribution).  #emph[For every fixed $theta.alt < 1 \/ 2$ and $D > 0$,
#[#set math.equation(numbering: n => "(7.7)")
 $ sum_(d lt.eq x^theta.alt\
d upright(" odd and squarefree")) \| r \( d \) \| lt.double x L^(- D) + X_A L^(- 18) . $ <eq:typeI-bound>]

]
] <prop:typeI>

#proof[
  The congruence $2 u + 1 equiv 0 med \( mod med d \)$ specifies a unit class for $u$.
    Use character orthogonality on that class. Replacing the principal coprime mass by $X_A$ has total cost at
    most $X_A L^(- 18)$, because for each supported $u$,
  $ sum_(d lt.eq x^theta.alt\
\( d \, u \) > 1) frac(mu^2 \( d \), phi \( d \)) lt.eq sum_(p divides u) frac(1, p - 1) sum_(d' lt.eq x)
  frac(mu^2 \( d' \), phi \( d' \)) lt.double L^(- 18) . $
  Here every $p divides u$ is at least $L^20$, there are at most $O \( L \/ log L \)$ such primes,
    and the last sum is $O \( L \)$ by its Euler product and Mertens’ theorem.
  Extract one fixed $Q_0$ slot, as in the proof of 33, to write
  $ A \( u \) = sum_(p r = u\
p in Q_0) b \( r \) \, wide 0 lt.eq b \( r \) lt.eq L^(O \( 1 \)) tau \( r \) . $
  Split $p \, r$ into dyads of sizes $P \, U$ with $P U asymp x$.
    There is a fixed $a > 0$ such that $x^a lt.double P \, U lt.double x^(1 - a)$ in every contributing dyad.
    A nonprincipal character modulo squarefree $d$ is induced by a primitive nonprincipal character modulo $f >
    1$, where $d = h f$ and $\( h \, f \) = 1$. It acts as that primitive character together with the restrictions
    $\( p \, h \) = \( r \, h \) = 1$, and $phi \( d \) = phi \( h \) phi \( f \)$.
  Fix $h$. On conductors $f asymp R > L^(C')$, separate $Psi \( p r \/ x \)$ by Mellin inversion,
    which has bounded integrated absolute cost. For each resulting twist, 5, Cauchy–Schwarz, and 7 give
  $ & sum_(f asymp R) frac(1, phi \( f \)) sum_(chi med mod med f)^(*) lr(|sum_(p asymp P) a_p chi \( p \)|)
    lr(|sum_(r asymp U) b_r chi \( r \)|)\
 & #h(12mm)  lt.double L^(O \( 1 \)) / R sqrt(\( P + R^2 \) \( U + R^2 \) P U)\
 & #h(12mm)  lt.double x L^(O \( 1 \)) (R^(- 1) + P^(- 1 \/ 2) + U^(- 1 \/ 2) + R \/ sqrt(x)) . $
  The coefficients include coprimality to $h$ and unit-modulus Mellin twists,
    so their squared sums are $O \( P \)$ and $U L^(O \( 1 \))$.
    Discarding $\( h \, f \) = 1$ and squarefreeness only enlarges this positive bound.
    Summing dyads and $1 \/ phi \( h \)$ costs a fixed power of $L$.
    Since $R lt.eq x^theta.alt$, a sufficiently large $C'$ gives any prescribed logarithmic saving.
  For $1 < f lt.eq 2 L^(C')$, fix $r$ and apply 4 to the $p$-sum with the original smooth cutoff
    $Psi \( p r \/ x \)$, using partial summation. The nonprincipal character sum is $O_A \( P L^(- A) \)$ for
    arbitrary fixed $A$. Omitting primes dividing $h$ costs only $O \( 1 \)$ terms,
    since such primes in this range are at least $x^a$ and $h lt.eq x^theta.alt$.
    Their total cost after summing $r$, moduli and dyads is $x^(1 - a) L^(O \( 1 \))$.
    The remaining costs are fixed powers of $L$, absorbed by choosing $A$ large. This proves (7.7). ◻
]

Define

$ V \( y \) = product_(p lt.eq y) \( 1 - 1 \/ p \) \, wide V_1 \( y \) =
  product_(3 lt.eq p lt.eq y) \( 1 - 1 \/ \( p - 1 \) \) \, wide frak(S) =
  2 product_(p gt.eq 3) (1 - frac(1, \( p - 1 \)^2)) > 0 . $

Writing $gamma_E$ for Euler’s constant, Mertens’ theorem gives

#[#set math.equation(numbering: n => "(7.8)")
 $ V \( y \) tilde.op frac(e^(- gamma_E), log y) \, wide V_1 \( y \) tilde.op frak(S) V \( y \) . $ <eq:sieve-products>]

We will choose a small fixed $0 < kappa < 1 \/ 50$ and then a sufficiently small fixed $b_1 > 0$.
  Set $b_(*) = b_1 \/ 3$ for 31, and eventually require

#[#set math.equation(numbering: n => "(7.9)")
 $ j_(* *) gt.eq j_0 \, wide c_2 s' 2^(- j_(* *)) < b_(*) \/ 4 . $ <eq:rough-slot-placement>]

Apply 11 to odd prime divisors of $N_u$ up to $x^(b_1)$, with density $g \( p \) =
  1 \/ \( p - 1 \)$ and the remainders from 34. Take

$ h = 2 ⌊frac(1, 40 b_1)⌋ \, wide theta.alt = 1 / 2 - kappa / 2 . $

For sufficiently small $b_1$, $h$ is large enough for that lemma and $b_1 \( 4 h + 2 \) < theta.alt$.
  Choose $D > C_A + 10$ in (7.7). It follows that

#[#set math.equation(numbering: n => "(7.10)")
 $ sum_(P^(-) \( N_u \) > x^(b_1)) A \( u \) Psi \( u \/ x \) gt.eq frac(frak(S) X_A, L) {e^(- gamma_E) /
   b_1 \( 1 - O \( e^(- c \/ b_1) \) \) + o \( 1 \)} . $ <eq:presieve-mass>]

The constants in the exponential error are uniform for small $b_1$ and $0 < kappa < 1 \/ 50$.

=== 7.3 Proxies with character and Mellin discrepancy <proxies-with-character-and-mellin-discrepancy>

We now construct the coefficients that Type II will compare with the factor tests.
  The proxy has exactly the same sum as the test on each short logarithmic cell,
  but is constant among the $W$-rough integers in that cell.
  This count matching handles the principal characters; prime estimates and the elementary sieve will give the
  nonprincipal cancellation independently of Type II. The cell width may therefore be chosen after Type II
  specifies its required discrepancy.

At fixed $b_1 \, kappa$, partition $\( b_1 \, 1 \/ 2 - kappa \]$ into finitely many exponent bins
  $\( gamma \, gamma' \]$. Their mesh will be chosen later. On the factor ranges used below consider the tests

$ I_gamma \( m \) = upright(bold(1))_(P^(-) \( m \) > x^gamma) \, wide I_(upright("pr")) \( m \) =
  upright(bold(1))_(m upright(" prime")) . $

Every such range lies between two fixed positive powers of $x$;
  in particular we can work throughout the ambient interval $\[ x^(b_1 \/ 4) \, x^(1 - b_1 \/ 4) \]$.
  Put $Delta_L = L^(- S)$, with $S$ a fixed precision to be chosen last.
  Partition the logarithmic axis into intervals of width $Delta_L$.
  For a full cell $C_Y = \( Y \, e^(Delta_L) Y \]$ meeting this ambient interval, set

#[#set math.equation(numbering: n => "(7.11)")
 $ c_I \( C_Y \) = frac(sum_(m in C_Y) I \( m \), \# { m in C_Y : P^(-) \( m \) > W }) \, wide B_I \( m \) =
   c_I \( C_Y \) upright(bold(1))_(P^(-) \( m \) > W) quad \( m in C_Y \) . $ <eq:proxy-definition>]

The counts defining $c_I$ are full-cell counts even when the factor range cuts a cell.
  Range restrictions are imposed afterwards.

#thm([Lemma 7.3.])[
  (Proxy discrepancy).  #emph[The denominators in (7.11) are positive for large $x$.
    Moreover $0 lt.eq B_I lt.eq 1$. Given any fixed discrepancy exponent $B$, taking $S > 2 B + 3$ makes
$ alpha_m = \( I \( m \) - B_I \( m \) \) upright(bold(1))_(m in K) $

 satisfy (5.4), uniformly for every interval $K$ inside a dyad in the stated factor ranges,
   for each of the finitely many tests above. Thus the coefficient bound required by 31 is independent of $S$.]
] <lem:proxy-discrepancy>

#proof[
  Use 11 on ordinary integers in a cell with $z = W$, $g \( p \) = 1 \/ p$, and $h = 2 ceil.l T^2 ceil.r$.
    Each divisibility remainder is $O \( 1 \)$, and the sieve level is
  $ D_W = W^(4 h + 2) = exp \( O \( sqrt(L) thin T^2 \) \) = x^(o \( 1 \)) . $
  Since $Y gt.double x^(b_1 \/ 4)$, uniformly for these cells,
  #[#set math.equation(numbering: n => "(7.12)")
   $ \# { m in C_Y : P^(-) \( m \) > W } = \( e^(Delta_L) - 1 \) Y V \( W \) \( 1 + O \( e^(- T^2) \) \) +
     O \( D_W \) tilde.op Delta_L Y V \( W \) . $ <eq:proxy-denominator>]
  Both actual tests select subsets of these rough integers for large $x$:
    for the prime test all integers in the cell exceed $W$, and for the other tests $x^gamma > W$.
    Hence $0 lt.eq c_I lt.eq 1$ exactly.
  Every prime divisor of a modulus $r lt.eq L^B$ is below $W$,
    so a principal character is one throughout the support of $alpha$.
    On a full cell the unweighted sum of $I - B_I$ is zero. For $f \( t \) = t^(i v - 1)$, $\| v \| lt.eq L^B$,
    its variation on that cell is at most $O \( \( 1 + \| v \| \) Delta_L \/ Y \)$.
    The absolute harmonic mass on a dyad is $O \( 1 \)$ (even the weaker $O \( L^(1 \/ 2) \)$ would suffice).
    Consequently the full cells contribute $O \( L^(B - S) \)$.
    Intersecting the test interval in (5.4) with $K$ leaves at most two partial cells;
    their combined harmonic mass is $O \( L^(- S) + x^(- b_1 \/ 4) \)$.
    These bounds imply the principal-character case with room to spare when $S > 2 B + 3$.
  For a nonprincipal character, first treat the actual roughness test.
    Each admitted integer has a unique nondecreasing list of at most $O \( 1 \/ b_1 \)$ prime factors.
    Fix the first $l - 1$ factors and sum over the last prime.
    Its order restriction, its lower bound $x^gamma$, and the interval restriction on the full product intersect
    in one prime interval. Its endpoints lie between $x^gamma$ and $x^2$.
    By 4 and partial summation, the harmonic sum of this prime against a nonprincipal character and the twist
    $p^(i v)$ has arbitrarily strong logarithmic saving, uniformly for a prescribed logarithmic bound on the
    modulus and $v$. The reciprocal masses of the remaining factors are bounded in terms of $b_1$,
    because $sum_(x^gamma < p lt.eq x^2) p^(- 1) = O_(b_1) \( 1 \)$.
    Summing the bounded number of list lengths preserves the saving.
    Repeated primes are included by the nondecreasing enumeration.
    Imprimitive nonprincipal characters give the same estimate via their nonprincipal primitive characters;
    primes dividing the modulus are too small to occur. For $I_(upright("pr"))$ this is the same argument with one
    prime.
  It remains to treat the proxy. For every subinterval $J'$ of a cell and every unit class $a
    med \( mod med r \)$, apply 11 to that class, omitting primes dividing $r$ from the sieve.
    The CRT gives an $O \( 1 \)$ remainder at each squarefree sieve product.
    Since all prime divisors of $r$ are below $W$, the main term is
  $ frac(\| J' \|, r) product_(p lt.eq W\
p divides.not r) \( 1 - 1 \/ p \) = frac(\| J' \| V \( W \), phi \( r \)) . $
  Thus, also for very short $J'$ as an absolute-error assertion,
  #[#set math.equation(numbering: n => "(7.13)")
   $ \# { m in J' : m equiv a med \( mod med r \) \, med P^(-) \( m \) > W } =
     frac(\| J' \| V \( W \), phi \( r \)) \( 1 + O \( e^(- T^2) \) \) + O \( D_W \) . $ <eq:rough-class-count>]
  Summing against a nonprincipal character cancels the common main term,
    and bounds the remaining sum by $O \( \| J' \| V \( W \) e^(- T^2) + phi \( r \) D_W \)$.
    Multiply by the cell constant $c_I lt.eq 1$ and use partial summation against $m^(i v - 1)$.
    The number of cells is at most $O \( L^(S + 1) \)$; the moduli and twists cost fixed powers of $L$.
    The first error therefore remains smaller than every fixed negative power of $L$,
    and the second is $x^(- b_1 \/ 4 + o \( 1 \))$ times a fixed power of $L$.
    This proves the nonprincipal assertion, including all interval truncations. ◻
]

For all later applications, prescribe the saving in 31 large enough that its errors,
  after the required dyadic decompositions, are $o \( X_A \/ L \)$.
  Its coefficient exponent is fixed before $S$, by 35; obtain its required discrepancy exponent and then choose
  $S$. There are only finitely many test types, so the same $S$ works for all.

=== 7.4 The local densities and their integral identity <the-local-densities-and-their-integral-identity>

The proxy discrepancy allows replacement of a factor test,
  while its local density controls the size of the replacement.
  We need ordinary rough-integer counts for the cofactor left after a least prime factor has been selected.
  For a product of $l$ primes, their logarithms, divided by $L$, sum to the logarithmic size of that cofactor.
  This leads to the following finite sum of integrals over those logarithms.

For $w > gamma > 0$ define

#[#set math.equation(numbering: n => "(7.14)")
 $ D_gamma \( w \) = 1 / w + sum_(l gt.eq 2) frac(1, l !) integral_(t_i gt.eq gamma med \( 1 lt.eq i < l \)\
sum_(i < l) t_i lt.eq w - gamma) frac(1, w - sum_(i < l) t_i) product_(i < l) frac(d t_i, t_i) .
  $ <eq:rough-density-definition>]

Only finitely many terms are nonzero. On compact subsets of $w > gamma > 0$ the functions are jointly continuous,
  including at thresholds $w = l gamma$: the integrands have bounded denominators and the moving boundaries have
  measure zero.

These are Buchstab’s rough-number densities in logarithmic coordinates,
  and the minimum-coordinate decomposition below is the corresponding Buchstab identity
  #cite(label("Buchstab1937")). We derive the short-cell bounds and integral identity needed here directly.

#thm([Lemma 7.4.])[
  (Proxy density bounds).  #emph[For the prime proxy in the interval $x^(1 \/ 2 - 2 kappa) lt.eq m lt.eq
    x^(1 \/ 2 + 2 kappa)$,
#[#set math.equation(numbering: n => "(7.15)")
 $ c_(upright("pr")) \( m \) lt.eq frac(C, L V \( W \)) \, $ <eq:prime-proxy-size>]

 where $C$ is absolute for $0 < kappa < 1 \/ 50$. If $m n =
   N_u$ on the support of $Psi \( u \/ x \)$ and $log n \/ L in \( gamma \, gamma' \]$, then
#[#set math.equation(numbering: n => "(7.16)")
 $ c_gamma \( m \) lt.eq frac(sup_(gamma lt.eq a lt.eq gamma') D_gamma \( 1 - a \) + o \( 1 \), L V \( W \)) .
   $ <eq:rough-proxy-size>]

 At fixed $b_1$ one also has
#[#set math.equation(numbering: n => "(7.17)")
 $ integral_(b_1)^(1 \/ 2) D_alpha \( 1 - alpha \) frac(d alpha, alpha) & = D_(b_1) \( 1 \) - 1 \,\
D_(b_1) \( 1 \) & lt.eq e^(- gamma_E) / b_1 \( 1 + O \( e^(- c \/ b_1) \) \) . $ <eq:density-integral>]

 The integrand at the endpoint $alpha = 1 \/ 2$ is understood by its left limit;
   changing that endpoint value has no effect.]
] <lem:proxy-densities>

#proof[
  The prime number theorem with an arbitrarily large logarithmic error, applied at both endpoints of a cell, gives
  $ \# { p in \( Y \, e^(Delta_L) Y \] } = \( 1 + o \( 1 \) \) frac(Delta_L Y, log Y) . $
  For $w = log Y \/ L in \[ 0.46 + o \( 1 \) \, 0.54 + o \( 1 \) \]$,
    divide by (7.12) to obtain (7.15) with an absolute eventual constant.
    Increasing fixed $S$ changes the threshold for $x$, not that constant.
  More generally, uniformly on compact sets with $gamma gt.eq b_1$, $w - gamma$ bounded below positively,
    and $w$ bounded above, the number of integers rough above $x^gamma$ in the cell is at most
  #[#set math.equation(numbering: n => "(7.18)")
   $ \( D_gamma \( w \) + o \( 1 \) \) frac(Delta_L Y, L) . $ <eq:rough-cell-density>]
  To see this, repeated prime factors contribute at most
  $ sum_(p > x^gamma) ⌊frac(2 Y, p^2)⌋ lt.double Y x^(- b_1) = o \( Delta_L Y \/ L \) . $
  Count the squarefree remaining integers by ordered lists of $l$ primes with weight $1 \/ l !$,
    where $l$ is bounded in terms of $b_1$. Fix the first $l - 1$ primes, write $Q =
    product_(i < l) p_i$ and $t_i = log p_i \/ L$. A last prime can occur only when $sum_(i < l) t_i lt.eq w -
    gamma + O \( Delta_L \/ L \)$. Dropping its lower cutoff, its count is at most
  $ \( 1 + o \( 1 \) \) frac(Delta_L Y, L Q \( w - sum_(i < l) t_i \)) . $
  The prime number theorem is uniform here because $Y \/ Q gt.eq x^gamma \/ 2$,
    and its logarithmic accuracy is chosen larger than $S + 3$.
    The reciprocal-prime measures for the remaining slots converge to $d t_i \/ t_i$.
    A finite grid approximation proves uniform convergence of the resulting integrals:
    denominators stay bounded away from zero, while strips around the moving hyperplane boundary have uniformly
    vanishing volume. This is exactly (7.14), proving (7.18).
    In the application $w = 1 - log n \/ L + o \( 1 \)$ and $w - gamma gt.eq 2 kappa + o \( 1 \)$.
    Continuity, followed by division by (7.12), proves (7.16).
  For (7.17), write the $l$th term of $D_(b_1) \( 1 \)$, $l gt.eq 2$, on the simplex
  $ t_1 + dots.h.c + t_l = 1 \, wide t_i gt.eq b_1 \, wide frac(1, l !)
    frac(d t_1 dots.h.c d t_(l - 1), t_1 dots.h.c t_l) . $
  This measure is invariant under every permutation of the $l$ coordinates:
    exchanging a dependent and an independent coordinate has absolute Jacobian one.
    Except on a null set exactly one coordinate is the minimum, say $alpha$. Select that coordinate in $l$ ways.
    Its measure is $d alpha \/ alpha$, and the remaining coordinates, with sum $1 -
    alpha$ and lower bound $alpha$, give the $\( l - 1 \)$-factor term of $D_alpha \( 1 - alpha \)$.
    The coefficient $l \/ l !$ is precisely $1 \/ \( l - 1 \) !$.
    Summing proves the identity; the one-prime term of $D_(b_1) \( 1 \)$ equals one.
  For the inequality, first obtain a lower density for ordinary rough integers in $\( x \, 2 x \]$.
    Ordered prime lists with weight $1 \/ l !$ assign at most unit mass to every integer,
    including those with repetitions. For $l gt.eq 2$ restrict the first $l - 1$ logarithms to $sum t_i < 1 -
    b_1 - eta$, with $eta > 0$ fixed, and sum the last prime over $\( x \/ Q \, 2 x \/ Q \]$.
    It is then wholly above the threshold. The prime number theorem and the same reciprocal-measure convergence
    give the corresponding integrals times $x \/ L$. Include the one-prime term and let $eta$ decrease to zero.
    Null boundaries give
  $ liminf_(x arrow.r oo) L / x \# { x < m lt.eq 2 x : P^(-) \( m \) > x^(b_1) } gt.eq D_(b_1) \( 1 \) . $
  On the other hand 11, with $g \( p \) = 1 \/ p$, $O \( 1 \)$ remainders and $h =
    2 floor.l 1 \/ \( 40 b_1 \) floor.r$, bounds this count by
  $ x V \( x^(b_1) \) \( 1 + O \( e^(- c \/ b_1) \) \) + O \( x^(b_1 \( 4 h + 2 \)) \) . $
  Its remainder is $o \( x \/ L \)$ for small $b_1$, and (7.8) proves (7.17). ◻
]

The term $1$ in (7.17) is the one-prime contribution to $D_(b_1) \( 1 \)$.
  Selecting a least prime factor accounts for all the other terms.
  Thus the integral provides the composite density to subtract from the preliminary sieve mass,
  with the one-prime term left over. These are densities for ordinary rough integers used in the proxies;
  their application to $N_u$ uses Type II followed by Type I and the sieve.

=== 7.5 Subtracting composites away from balance <subtracting-composites-away-from-balance>

Consider a composite $N_u$ counted in (7.10), whose least prime factor is at most $x^(1 \/ 2 - kappa)$.
  Its least prime factor $p$ lies in one bin $\( x^gamma \, x^(gamma') \]$, and $m =
  N_u \/ p$ satisfies $P^(-) \( m \) > x^gamma$. Its contribution is therefore bounded by

$ sum_(m p = N_u\
x^gamma < p lt.eq x^(gamma') upright(" prime")) A \( u \) Psi \( u \/ x \) I_gamma \( m \) . $

All contributing dyads of $m \, p$ lie between $x^(b_(*))$ and $x^(1 - b_(*))$ for large $x$, with $b_(*) =
  b_1 \/ 3$: the factors bounded by constants in $N_u asymp x$ are absorbed by the strict exponent slack.
  Apply 31 with $alpha = I_gamma - B_gamma$ restricted to each actual cofactor range,
  and $beta$ the prime indicator restricted to its bin and dyad. 35 supplies precisely its discrepancy hypothesis.
  Replacing $I_gamma$ by $B_gamma$ costs $o \( X_A \/ L \)$ in total.

For a prime $p > W$, the condition that $m = N_u \/ p$ be rough above $W$ is equivalent to $P^(-) \( N_u \) > W$.
  By (7.16), the resulting upper bound reduces to a constant divided by $L V \( W \)$ times

$ sum_(x^gamma < p lt.eq x^(gamma')) sum_(p divides N_u\
P^(-) \( N_u \) > W) A \( u \) Psi \( u \/ x \) . $

For each such $p$, sieve the odd primes up to $W$, using the base mass $X_A \/ \( p - 1 \)$,
  density $1 \/ \( l - 1 \)$, and remainders $r \( p d \)$. Take $h = 2 ceil.l T^2 ceil.r$ in 11.
  All products $p d$ are at most $x^(1 \/ 2 - kappa + o \( 1 \))$,
  which is below the Type I level $x^(1 \/ 2 - kappa \/ 2)$.
  Moreover different pairs $\( p \, d \)$ give different products: $p > W$ is their unique prime factor above $W$.
  Thus (7.7) bounds the summed remainders without any divisor multiplicity loss. We obtain

$ & sum_(x^gamma < p lt.eq x^(gamma')) sum_(p divides N_u\
P^(-) \( N_u \) > W) A \( u \) Psi \( u \/ x \)\
 & #h(12mm)  = X_A V_1 \( W \) sum_(x^gamma < p lt.eq x^(gamma')) frac(1, p - 1) + o \( X_A V \( W \) \) . $

Since the reciprocal sum tends to $log \( gamma' \/ gamma \)$, the composite contribution of the bin is at most

#[#set math.equation(numbering: n => "(7.19)")
 $ frac(frak(S) X_A, L) {sup_(gamma lt.eq a lt.eq gamma') D_gamma \( 1 - a \) log \( gamma' \/ gamma \) +
   o \( 1 \)} . $ <eq:unbalanced-bin>]

At fixed $b_1 \, kappa$, joint continuity in 36 permits a sufficiently fine fixed mesh such that the sum of these
  constants is at most

$ integral_(b_1)^(1 \/ 2 - kappa) D_alpha \( 1 - alpha \) frac(d alpha, alpha) + 1 / 10 . $

Subtracting (7.19) from (7.10) and using (7.17), (7.17) leaves at least

#[#set math.equation(numbering: n => "(7.20)")
 $ frac(frak(S) X_A, L) {1 - 1 / 10 - O \( b_1^(- 1) e^(- c \/ b_1) \) + o \( 1 \)} gt.eq
   frac(frak(S) X_A, 2 L) $ <eq:prime-balanced-mass>]

on primes and composites with least prime factor exceeding $x^(1 \/ 2 - kappa)$, provided $b_1$ is sufficiently small.

=== 7.6 A uniform upper bound for balanced composites <a-uniform-upper-bound-for-balanced-composites>

If a composite $N_u lt.double x$ has least prime factor above $x^(1 \/ 2 - kappa)$,
  it has exactly two prime factors counted with multiplicity, because $3 \( 1 \/ 2 - kappa \) > 1$.
  Both factors belong, for large $x$, to

$ cal(B)_kappa = \[ x^(1 \/ 2 - 2 kappa) \, x^(1 \/ 2 + 2 kappa) \] . $

We may overcount them by ordered pairs $m \, n$ of primes in that range with $m n = N_u$.
  Replace the first prime indicator by its proxy using 31, then replace the second using the same theorem with the
  factor roles exchanged. The remaining coefficient in the second application is a proxy bounded by one.
  All required discrepancy and range hypotheses follow from 35, as before.
  By (7.15), the resulting upper bound is $o \( X_A \/ L \)$ plus

#[#set math.equation(numbering: n => "(7.21)")
 $ frac(C, L^2 V \( W \)^2) sum_(m \, n in cal(B)_kappa \, med m n = 2 u + 1\
P^(-) \( m \) > W \, med P^(-) \( n \) > W) A \( u \) Psi \( u \/ x \) . $ <eq:balanced-proxy-bound>]

We now bound this positive sum with a constant independent of $kappa \, b_1 \, j_(* *)$ and $S$.

More precisely, we will show that each dyadic pair with $m n asymp x$ contributes $O \( X_A V \( W \)^2 \)$.
  There are only $O \( kappa L + 1 \)$ such pairs in the indicated range,
  so the prefactor in (7.21) will give an $O \( \( kappa + L^(- 1) \) X_A \/ L \)$ bound.
  To prove the dyadic estimate, we retain a small divisor of $u$ from its Q-slots and P-marks.
  After discarding the remaining large Q-prime restrictions, a two-variable sieve enforces roughness of $m \,
  n$ and the remaining small-prime restrictions on $u = \( m n - 1 \) \/ 2$.

Choose a fixed large index $j'$ and then $theta$ in the gap

#[#set math.equation(numbering: n => "(7.22)")
 $ c_2 s' 2^(- j') < theta < c_1 s' 2^(- j' + 1) \, wide 10 theta lt.eq 1 / 20 \, wide
   sum_(j gt.eq j') r_0 c_2 s' 2^(- j) lt.eq 1 / 25 . $ <eq:micro-choice>]

Such a gap exists because $c_2 < 2 c_1$. These choices depend only on the candidate geometry.
  Increase the early lower bound $j_0$ to ensure $j_0 gt.eq j'$, so the rough slot is in a band $j gt.eq j'$.
  Call these the micro bands. Write $H_Q^(upright("mic"))$ for the Q harmonic mass using just these bands.
  Omitting the finitely many fixed bands $j < j'$ gives

#[#set math.equation(numbering: n => "(7.23)")
 $ H_Q^(upright("mic")) lt.double H_Q $ <eq:micro-harmonic-comparison>]

with a constant independent of $j_(* *)$.

An assignment consists of the complete ordered Q-lists in the micro bands, including the rough slot,
  and one marked prime from every P-group. Give it weight

$ lambda_(upright("assgn")) = product_(j = j')^(j_x) frac(1, r_0 !) product_g 1 / V_g \, $

and let $D_1$ be the product of all its entries, with multiplicity.
  The Q contribution has size at most $x^(1 \/ 25)$ by (7.22);
  the P marks have product $exp \( O \( T L^(2 \/ 5) \) \) = x^(o \( 1 \))$. Thus

#[#set math.equation(numbering: n => "(7.24)")
 $ D_1 lt.eq x^(1 \/ 20) \, wide sum_(upright("assgn")) lambda_(upright("assgn")) / D_1 = H_Q^(upright("mic")) \,
   wide sum_(upright("assgn")) lambda_(upright("assgn")) lt.eq
   x^(1 \/ 20) H_Q^(upright("mic")) . $ <eq:assignment-size>]

In the middle identity the harmonic sum of the normalized P mark in each group is exactly $V_g^(- 1) sum p^(- 1) = 1$.

The damping in $W_1$ can also be retained in this upper bound.
  Once one P-prime per group is marked in $D_1$, every additional distinct P-prime divisor of $u$ contributes a
  factor $q$. We represent these factors by independent random permissions for those primes;
  averaging the permissions recovers exactly the damping.

For each assignment, ban every odd non-P prime $l lt.eq x^theta$ not dividing $D_1$.
  For each P prime not dividing $D_1$, independently allow it with probability $q$ and otherwise ban it.
  Primes dividing $D_1$ are never banned. All P primes are below $x^theta$ and indeed below $W$ for large $x$.
  We have the pointwise majorant

#[#set math.equation(numbering: n => "(7.25)")
 $ A \( u \) lt.eq sum_(upright("assgn")) lambda_(upright("assgn")) upright(bold(1))_(D_1 divides u) thin
   bb(E)_(upright("mask")) upright(bold(1))_({ l divides.not u upright(" for every banned ") l }) .
   $ <eq:mask-majorant>]

To verify it, expand $A \( u \)$ into Q-lists and one P mark per group.
  For every genuine list the divisibility $D_1 divides u$ holds,
  and every non-P prime divisor of $u$ below $x^theta$ occurs in $D_1$:
  omitted Q-bands contain only pure primes above $x^theta$.
  The micro Q product has no P factors, so $D_1$ contains exactly one distinct P prime per group.
  For such a genuine list, the mask expectation is $q^(omega \( u \) - s)$,
  precisely the damping in $W_1 \( u \)$. Once the micro entries are fixed,
  the normalized number of omitted pure-prime lists with any fixed residual product is at most one.
  Explicitly, a band with prime multiplicities $a_p$ contributes $product_p 1 \/ a_p ! lt.eq 1$;
  disjointness prevents alternative band assignments. Dropping these residual restrictions proves (7.25).

Fix now a pair of dyads $m asymp M_1$, $n asymp M_2$ meeting the product support $m n asymp x$, an assignment,
  and a mask. Since $D_1$ is odd, $D_1 divides u$ and $m n = 2 u + 1$ imply $m n equiv 1 med \( mod med D_1 \)$.
  We may drop parity and use this congruence to bound the number of pairs in the full dyadic box.
  For an odd prime $l lt.eq z' := x^theta$ with $l divides.not D_1$, the bad events are

$ m n equiv 0 med \( mod med l \) quad \( l lt.eq W \) \, wide m n equiv
  1 med \( mod med l \) quad \( l upright(" banned") \) . $

The two residue sets are disjoint and contain respectively $2 l - 1$ and $l - 1$ pairs. Put

$ nu \( l \) = \( 2 l - 1 \) upright(bold(1))_(l lt.eq W) + \( l - 1 \) upright(bold(1))_(l upright(" banned")) \,
  wide g \( l \) = nu \( l \) \/ l^2 . $

These densities satisfy the hypotheses of 11 uniformly in assignment and mask:
  $g \( l \) lt.eq 3 \/ l$, and for $l gt.eq 3$ they are bounded away from one.
  The base mass is the product of the two real side lengths times $phi \( D_1 \) \/ D_1^2$.

For a squarefree product $d$ of the sieve primes, the CRT gives exactly $phi \( D_1 \)
  nu \( d \)$ residue pairs modulo $D_1 d$, including when $D_1$ has prime-power factors.
  Each pair of residue classes has lattice count equal to its area term with error

$ O (1 + frac(M_1 + M_2, D_1 d)) . $

As $nu \( d \) lt.eq d thin 3^(omega \( d \))$ and $phi \( D_1 \) lt.eq D_1$,
  the sum of absolute remainders up to $D = \( z' \)^10 = x^(10 theta)$ is

#[#set math.equation(numbering: n => "(7.26)")
 $ lt.double L^(O \( 1 \)) #scale(x: 120%, y: 120%)[\(] \( M_1 + M_2 \) D +
   D_1 D^2 #scale(x: 120%, y: 120%)[\)] lt.eq L^(O \( 1 \)) #scale(x: 120%, y: 120%)[\(] \( M_1 + M_2 \)
   x^(1 \/ 20) + D_1 x^(1 \/ 10) #scale(x: 120%, y: 120%)[\)] . $ <eq:pair-lattice-error>]

Here the ordinary $omega \( d \)$ occurs only in this elementary divisor bound; its sums follow, for example,
  from $3^(omega \( d \)) lt.eq tau_3 \( d \)$, where $tau_3 \( d \)$ counts ordered triples of positive integers
  with product $d$. Apply the upper-bound version of 11 with $h = 2$.

We record its Euler product explicitly. A banned prime below $W$ has factor $1 - 3 \/ l + 2 \/ l^2$,
  and a banned prime above $W$ has factor $1 - 1 \/ l + 1 \/ l^2$. Each is at most

$ \( 1 - 1 \/ l \)^(1 + 2 upright(bold(1))_(l lt.eq W)) \( 1 + O \( l^(- 2) \) \) . $

An allowed P prime has factor $\( 1 - 1 \/ l \)^2$, so it requires one compensating factor
  $\( 1 - 1 \/ l \)^(- 1)$. Omitting the prime 2 changes only an absolute constant,
  as does the convergent product of the $1 + O \( l^(- 2) \)$ factors.
  Removed primes dividing $D_1$ require at most three compensating factors. Therefore

#[#set math.equation(numbering: n => "(7.27)")
 $ product_(3 lt.eq l lt.eq z'\
l divides.not D_1) \( 1 - g \( l \) \) lt.eq C V \( W \)^2 V \( z' \)
  product_(l divides D_1) \( 1 - 1 \/ l \)^(- 3) product_(p upright(" allowed")\
p divides.not D_1) \( 1 - 1 \/ p \)^(- 1) . $ <eq:pair-sieve-product>]

Every prime dividing $D_1$ is at least $L^20$, so $D_1 lt.eq
  x^(1 \/ 20)$ makes its compensating product uniformly bounded. The expectation of the last product is

$ product_(p upright(" a P prime")\
p divides.not D_1) (1 - q + frac(q, 1 - 1 \/ p)) = product_(p upright(" a P prime")\
p divides.not D_1) (1 + frac(q, p - 1)) lt.eq H_P $

by (7.5).

Since $phi \( D_1 \) \/ D_1^2 lt.eq 1 \/ D_1$, sum the main sieve terms over assignments using (7.24),
  and bound $Psi$ by its fixed supremum. Their contribution on this dyadic pair is

$ lt.double x V \( W \)^2 V \( x^theta \) H_Q^(upright("mic")) H_P lt.double X_A V \( W \)^2 \, $

by (7.2), (7.23) and $V \( x^theta \) lt.double 1 \/ L$. To sum the error (7.26),
  use $M_i lt.double x^0.54$ and (7.24). The result is

$ lt.double x^0.64 L^(O \( 1 \)) H_Q^(upright("mic")) = o \( X_A V \( W \)^2 \) . $

The comparison is uniform in the later parameters: use $H_Q^(upright("mic")) lt.double H_Q$, $H_P gt.eq 1$,
  and $X_A V \( W \)^2 asymp x H_Q H_P \/ L^2$. We have proved the promised dyadic estimate

#[#set math.equation(numbering: n => "(7.28)")
 $ sum_(m asymp M_1 \, med n asymp M_2 \, med m n = 2 u + 1\
P^(-) \( m \) > W \, med P^(-) \( n \) > W) A \( u \) Psi \( u \/ x \) lt.double X_A V \( W \)^2 .
  $ <eq:balanced-dyadic>]

There are $O \( kappa L + 1 \)$ possible dyads for $m$ in $cal(B)_kappa$, and, for each,
  only $O \( 1 \)$ possible dyads for $n$ because $m n asymp x$.
  Combining (7.21) and (7.28) bounds the entire balanced composite contribution by

#[#set math.equation(numbering: n => "(7.29)")
 $ C_(upright("bal")) \( kappa + L^(- 1) \) X_A / L + o \( X_A \/ L \) . $ <eq:balanced-final>]

The constant $C_(upright("bal"))$ depends only on $delta \, r_0 \, Psi \, j' \,
  theta$ and the fixed P-group geometry. It does not depend on $kappa \, b_1 \, j_(* *)$,
  the later analytic parameters, or $S$. Indeed the candidate comparison is uniform in $j_(* *)$;
  the omitted macro bands are fixed before the gap; the prime proxy bound is uniform on $\[ 0.46 \, 0.54 \]$;
  and the sieve-density and lattice constants just used are absolute.
  Thresholds for $x$ may depend on all parameters after they are fixed.

=== 7.7 Closing the parameter choices and counting primes <closing-the-parameter-choices-and-counting-primes>

For clarity, the choices in the preceding argument can be made in the following order.

+ Fix $delta$, $Psi$, $r_0$ and the Q/P geometry. Choose the finite prefix for the candidate lower bound,
  then $j'$ and $theta$ in (7.22), and enlarge $j_0$ to cover both requirements. All these are early choices.
+ Fix $kappa in \( 0 \, 1 \/ 50 \)$ so small that $C_(upright("bal")) kappa < frak(S) \/ 4$.
  This is possible because the constant in (7.29) is independent of the gap.
+ Choose $b_1$ sufficiently small for (7.10), (7.17), and (7.20). Set $b_(*) = b_1 \/ 3$.
  Choose $j_(* *)$ to meet (7.9), and then choose the finite exponent mesh for (7.19).
+ Prescribe the saving in 31 so that every replacement error, including dyadic sums, is $o \( X_A \/ L \)$.
  The coefficient exponents are already bounded independently of $S$.
  The proof of that theorem fixes its Cauchy splitting precision, shift-saving target,
  graph and analytic parameters, and finally a required discrepancy exponent in (5.4).
+ Choose $S$ sufficiently large in 35 for that exponent, fix any prime-number-theorem accuracies needed for this
  $S$, and let $x$ tend to infinity.

In particular the precision of the proxy cells causes no feedback into the Type II coefficient bound.

Subtract (7.29) from (7.20). For all sufficiently large $x$ there remains a positive constant multiple of $X_A \/
  L$ on prime values of $N_u$:

$ sum_(2 u + 1 upright(" prime")) A \( u \) Psi \( u \/ x \) gt.double X_A \/ L . $

By 33 each summand is at most $exp \( O \( sqrt(L) \) \)$ and $X_A gt.double x L^(- C_A)$.
  The map $u mapsto 2 u + 1$ is injective, so the number of distinct primes is at least

$ x L^(- C_A - 1) exp \( - O \( sqrt(L) \) \) = x^(1 - o \( 1 \)) . $

Their range is $2 x < p lt.eq 4 x + 1 lt.eq 5 x$. Finally $P^(+) \( p - 1 \) = P^(+) \( 2 u \) =
  max \( 2 \, P^(+) \( u \) \) lt.eq x^delta$ for large $x$;
  the strict inequality $c_2 s' < delta$ in the candidate geometry leaves room for every subpower P prime,
  and the factor 2 is eventually below $x^delta$. This proves 2.

== 8 Large fibers of the totient function <sec:totients>

We finish by deriving 1 from 2. This product-and-pigeonhole passage is the classical connection between smooth
  shifted primes and large totient fibers; see #cite(label("Pomerance1980")) Theorem B and its proof.
  We first record finiteness of each fiber and the elementary upper bound mentioned in the Introduction.

#thm([Lemma 8.1.])[
  #emph[For each positive integer $n$, the set of positive integers $m$ with $phi \( m \) = n$ is finite.
    For every $eta > 0$,
$ g \( n \) lt.double_eta n^(1 + eta) . $

]
] <lem:finite-totient-fibers>

#proof[
  If $p^a parallel m$, then $p^(a - 1) \( p - 1 \)$ divides $phi \( m \)$.
    For a fixed value $n$, this restricts $p$ to the finite set with $p - 1 divides n$,
    and bounds $a$ by $p^(a - 1) divides n$. Thus each fiber is finite.
  For the quantitative bound, fix $0 < theta < 1$. For all sufficiently large primes $p$, one has $1 -
    1 \/ p gt.eq p^(- theta)$. The finitely many remaining primes contribute a fixed positive constant $c_theta$.
    Consequently, for every $m$,
  $ phi \( m \) = m product_(p divides m) (1 - 1 / p) gt.eq c_theta m product_(p divides m) p^(- theta) gt.eq
    c_theta m^(1 - theta) . $
  Every preimage of $n$ is therefore at most $\( n \/ c_theta \)^(1 \/ \( 1 - theta \))$.
    Choose $theta$ so that $1 \/ \( 1 - theta \) lt.eq 1 + eta$, and count the possible positive integers. ◻
]

#proof[
  It suffices to consider $0 < epsilon < 1$. Choose $0 < delta < 1 \/ 4$ with $4 delta < epsilon$.
    By 2, for every sufficiently large $X$ there are more than $X^(1 - delta)$ primes $p lt.eq X$ such that $p -
    1$ is $X^delta$-smooth. Indeed, take $x = X \/ 5$ in that theorem;
    its count $x^(1 - o \( 1 \))$ exceeds $X^(1 - delta)$ eventually, and $x^delta lt.eq X^delta$.
  Let $cal(P)$ be this set of primes, let $M = \| cal(P) \|$, and put $k = floor.l X^(2 delta) floor.r$.
    Since $3 delta < 1$, we have $k lt.eq M$ for sufficiently large $X$.
    Different $k$-element subsets of $cal(P)$ have different products by unique factorization. There are at least
  #[#set math.equation(numbering: n => "(8.1)")
   $ binom(M, k) gt.eq (M / k)^k > X^(\( 1 - 3 delta \) k) $ <eq:many-prime-products>]
  such products. For completeness, the binomial inequality follows by writing $binom(M, k) =
    product_(j = 0)^(k - 1) \( M - j \) \/ \( k - j \)$ and observing that each factor is at least $M \/ k$.
  For a squarefree product $m = product_(p in cal(Q)) p$ with $\| cal(Q) \| = k$, multiplicativity of the totient gives
  $ phi \( m \) = product_(p in cal(Q)) \( p - 1 \) . $
  This value is $X^delta$-smooth and at most $X^k$. Every prime exponent in such a value is at most $k log X \/
    log 2$, and there are at most $X^delta$ primes available. Hence the total number of possible values is at most
  #[#set math.equation(numbering: n => "(8.2)")
   $ (1 + frac(k log X, log 2))^(X^delta) = X^(o \( k \)) . $ <eq:few-totient-values>]
  The last equality means that the logarithm of its left side, divided by $k log X$, tends to zero:
    its numerator is $O_delta \( X^delta log X \)$, whereas $k asymp X^(2 delta)$.
  By (8.1), (8.2), some $n lt.eq X^k$ therefore satisfies
  $ g \( n \) gt.eq X^(\( 1 - 3 delta - o \( 1 \) \) k) > n^(1 - epsilon) $
  for sufficiently large $X$. The strict final inequality follows from $3 delta + o \( 1 \) < epsilon$ and $1 -
    epsilon > 0$.
  These lower bounds for $g \( n \)$ tend to infinity with $X$.
    By 37, the resulting values $n$ cannot belong to a fixed finite set.
    They are therefore unbounded, which proves the required assertion for infinitely many $n$.
    If $epsilon gt.eq 1$, the assertion follows from any smaller positive choice of $epsilon$. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
