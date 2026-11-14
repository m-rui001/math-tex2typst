#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 79.4pt, y: 79.4pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Routing densities and representation contraction for Thorp sweeps]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <sec:introduction>

An absolute number of coordinate sweeps suffices to mix the full Thorp permutation.
  Since a sweep consists of $d$ physical shuffles on $N = 2^d$ cards,
  this gives the optimal order $Theta \( d \)$ for the mixing time.
  A single sweep already sends each card to a uniform position,
  but the joint positions retain dependencies because all cards use the same random switches.
  We bound these dependencies through the density of ordered partial permutations,
  then use representation multiplicities to pass from partial information to the full deck.

Write $N = 2^d$ with $d gt.eq 1$. The positions are the binary words in ${ 0 \, 1 }^d$.
  A coordinate layer independently swaps or leaves unchanged the cards on every edge in one coordinate direction,
  with probability $1 \/ 2$ each. A sweep visits all $d$ directions in order.
  In the rotating coordinate frame this is exactly $d$ physical Thorp shuffles;
  the precise physical map is given in Section 2. Let $T_N$ be the average action of one sweep.
  Its adjoint is the average action of a sweep in the reverse order.
  Thus $K_N = T_N^(*) T_N$ is the positive operator represented by a sweep followed by its reflection,
  using fresh independent switches.

For $0 lt.eq k lt.eq N$, let $cal(X)_(N \, k)$ be the set of ordered lists of $k$ distinct positions,
  let $\( N \)_k = N ! \/ \( N - k \) !$, and let $u_(N \, k)$ be its uniform probability measure.
  For $x \, y in cal(X)_(N \, k)$ define $R_x \( y \) = \( N \)_k Pr_(K_N) \( x mapsto y \)$.
  Thus $R_x$ is a density relative to a uniform injection. For a partition $lambda tack.r N$,
  write $D_lambda$ for its irreducible dimension and $T_N \( lambda \)$ for the sweep’s average matrix.

#thm([Theorem 1.1.])[
  (Routing density and representation contraction).  #emph[There are absolute constants $eta \, c \,
    C > 0$ such that, with $a = 1 \/ 1000$,
$ log bb(E)_(y tilde.op u_(N \, k)) R_x \( y \)^(1 + a) lt.eq C k \( k \/ N \)^eta wide \( 1 lt.eq k lt.eq N \) \, $

 uniformly over every starting injection $x$. For every sufficiently large dyadic $N$ and every nontrivial
   irreducible representation,
$ T_N \( lambda \) = 0 quad upright("or") quad parallel T_N \( lambda \) parallel_(upright("op")) lt.eq
  D_lambda^(- c) . $

 Consequently an absolute number of forward sweeps has worst-start total-variation distance from uniform tending
   to zero as $d arrow.r oo$.]
] <fac:main>

The density estimate also measures how much information about the starting tuple remains.
  Let $P_x$ be its endpoint law under $K_N$, and let $H \( P_x \)$ be its Shannon entropy,
  with natural logarithms. Jensen’s inequality under $P_x$ gives

$ log \( N \)_k - H \( P_x \) = "KL" \( P_x parallel u_(N \, k) \) lt.eq
  a^(- 1) log bb(E)_(u_(N \, k)) R_x^(1 + a) lt.eq \( C \/ a \) k \( k \/ N \)^eta . $

Thus the entropy deficit per tracked card tends to zero when $k \/ N arrow.r 0$.
  At full occupancy the deficit is $O \( N \)$ after the reflected pair of sweeps,
  compared with the initial deficit $log N !$.

The same saving has a representation-theoretic use. A shape whose first row is long occurs many times in a
  moderately larger injection module. A density cutoff has bounded Hilbert–Schmidt norm on that module,
  and these repeated copies force its norm on the shape to be small.
  Larger dimensions need a different use of the network, described below.
  All traces in the paper are unnormalized; in particular $parallel A parallel_(upright("HS"))^2 = "Tr" \( A^(*) A \)$.

Let $q_d$ denote the law of one physical shuffle, let $U_(S_N)$ be the uniform law on $S_N$,
  and use $parallel mu - nu parallel_(upright("TV")) = 1 / 2 sum_g \| mu \( g \) - nu \( g \) \|$.
  Define $t_(upright("mix")) \( d \)$ as the least number of physical shuffles at which this distance is at most
  $1 \/ 4$; by translation the distance is independent of the starting permutation.
  The lower obstruction counts random bits. Each physical shuffle uses $N \/ 2$ bits,
  so after $t$ shuffles at most $2^(t N \/ 2)$ permutations can occur. The exact bound

$ parallel q_d^(* t) - U_(S_N) parallel_(upright("TV")) gt.eq 1 - 2^(t N \/ 2) \/ N ! $

implies a lower bound $2 d - O \( 1 \)$ at distance $1 \/ 4$.
  Together with Theorem 1, this gives the optimal order $Theta \( d \)$ in physical time.
  The theorem does not specify a smallest mixing constant or a cutoff profile.

=== 1.1 Network ancestry and previous mixing bounds <network-ancestry-and-previous-mixing-bounds>

Thorp introduced the shuffle in his study of shuffling and Faro #cite(label("Thorp1973")).
  For power-of-two decks, Morris’s 2005 preprint proved the first polynomial bound, $O \( d^44 \)$,
  using evolving sets and a chameleon process #cite(label("Morris2008")).
  Montenegro and Tetali’s spectral-profile and evolving-set analysis gave $O \( d^29 \)$
  #cite(label("MontenegroTetali2006")) Theorems 6.14–6.15. Morris then used entropy contraction to prove
  $O \( \( log N \)^4 \)$ for every even deck size #cite(label("Morris2009")),
  and sharpened the contraction over a sweep to obtain $O \( d^3 \)$ when $N =
  2^d$ #cite(label("Morris2013")) Lemma 7 and Theorem 8. These bounds concern the full permutation.
  Our argument bounds the joint routing densities and converts them into matrix contraction on each irreducible
  representation.

The reflected butterfly has the topology of the classical Beneš network #cite(label("Benes1964")).
  Beneš’s rearrangeability result concerns which permutations can be routed.
  Morris already studied the fair-switch sweep–reflection law under the name #emph[zigzag shuffle]
  #cite(label("Morris2008")) Section 4. The expanded experiment has $2 d$ layers.
  Its two central layers average the same subgroup, so their product has the law of one such average and gives the
  usual $2 d - 1$-layer endpoint description. We retain both layers when counting internal routing choices.

Gelman and Ta-Shma analyzed this random network through its two-child recursion #cite(label("GelmanTaShma2014"))
  Section 4, Proposition 1. Their Theorem 4 and Lemma 5 give total-variation error at most
  $k \( k - 1 \) \/ \( 2 N \)$ for the image of an unordered $k$-subset.
  Our estimate concerns ordered injections and a higher density moment, including dense tuples.
  The alternating-color calculation below is the routing structure behind the recursion;
  the extra work is to control its cycle counts under the actual random switch law.

Partial-permutation questions also arise in cryptography.
  Morris, Rogaway and Stegers bounded the joint positions of prescribed cards in their analysis of small-domain
  encryption #cite(label("mrs")) #cite(label("MorrisRogawayStegers2018")).
  Czumaj and Vöcking proved that, for every fixed $0 < c < 1$,
  the joint positions of any prescribed $floor.l c N floor.r$ cards mix in $O \( \( log N \)^2 \)$ physical layers
  by a non-Markovian coupling #cite(label("CzumajVocking2014")).
  Their full-permutation application pads the network with empty cards.
  Czumaj later obtained logarithmic-depth partial-permutation bounds for other switching networks satisfying an
  expansion condition #cite(label("Czumaj2015")) Theorems 3.4–3.6.
  The fixed tracked fraction, padding, and choice of network distinguish these results from mixing the unchanged
  full-deck Thorp chain.

The passage from Fourier estimates to total variation follows the finite-group method of Diaconis and Shahshahani
  #cite(label("DiaconisShahshahani1981")). For a conjugacy-invariant law,
  the Fourier matrices are scalar and can be estimated through character ratios.
  A directed coordinate sweep gives matrix products of projections,
  so its singular values and its nonnormal powers must both be controlled.
  The inverse-dimension summation used in the final step is a special case of Liebeck–Shalev
  #cite(label("liebeck-shalev2004")) Proposition 2.5 and Theorem 2.6;
  we include an elementary proof of the estimates needed here.
  Sharp versions allowing the exponent to decrease with $N$ are now known #cite(label("teyssier-thevenin2025"))
  Proposition 1.8. Recent character bounds also yield cutoff and its profile,
  relative to the appropriate parity coset, for nontrivial conjugacy-class walks with a positive fraction of fixed
  points #cite(label("olesker-taylor-teyssier-thevenin2025")) #cite(label("Teyssier2026")).
  Those scalar estimates do not provide the matrix contraction required for a coordinate sweep.

Young branching, hook lengths, and Schur orthogonality connect the ordered routing densities to individual Fourier
  blocks #cite(label("Sagan2001")) #cite(label("Stanley1999")) #cite(label("VershikOkounkov2005")).
  Later we use the commuting position and label actions on injections #cite(label("DukesIhringerLindzey2020"))
  Section 3.2 and the associated transposition-content formula for coordinate deletion
  #cite(label("AraujoBratten2017")) Lemma 3.1 and Theorem 3.5.
  These algebraic identities identify the harmonic spaces; the probabilistic work is to bound the loss of harmonic
  level when the network splits.

=== 1.2 The first proof and the further estimates <the-first-proof-and-the-further-estimates>

Splitting the reflected network at its outer coordinate leaves two independent smaller networks.
  Prescribing the endpoints of some cards puts two matchings on those cards:
  one records common input switches, the other common output switches.
  Their union consists of alternating paths and cycles. Each component has two possible assignments to the
  children, and each cycle creates one extra factor of two in the route count.
  Section 3 gives the exact density identity and separates uniform auxiliary colorings from the actual switch law.
  This distinction identifies the probability measure under which a discarded-density tail must be bounded.

Section 4 completes the first proof. We mark several cycles in distinguished slots, expose their routes,
  and compare the number of choices of their starts with the probability that their last paths close.
  A contact bound controls the switches already known at those closures.
  Factorial moments then bound cycles at each height. Conditional estimates over alternating height bands sum the
  bounds without assuming independence between heights.

The density estimate and the multiplicity cutoff cover shapes with long first rows and those with very large
  dimensions. To handle the remaining dimensions, replace fixed-size central subnetworks by uniform permutations,
  allowing identity on a small specified set of blocks. The modified density moments have arbitrarily small cost
  per card. The original positive central operator is bounded by a sum of these modified operators and an
  exponentially small remainder. This completes the dimension-power estimate.
  Its Fourier consequence uses submultiplicativity and Schatten norms;
  a power of $T_N^(*) T_N$ is never identified with a power of the generally nonnormal $T_N$.

Section 5 gives an independent certificate argument. It uses reciprocal cycle lengths to retain explicit density
  costs for dense tracked sets, including the margins needed at densities $7 \/ 25$ and $1$.
  Section 6 instead proves an exponential cost per tracked card by encoding a permutation while omitting the bits
  forced by its closing routes. Its pointwise consequence applies to both $T_N^(*) T_N$ and $T_N T_N^(*)$,
  for every injection size, after a fixed number of compositions.
  Section 6.6 gives a separate certificate and entropy-window proof of that density bound.

The first density theorem already implies an $e^(C k)$ moment bound.
  The later density arguments give different mechanisms and lead to pointwise smoothing and lower-diagram
  estimates. In particular, Section 7 proves a contact-cancellation bound uniform in the number of tracked cards.
  Summing out a tuple slot annihilates a representation at its first injection level;
  a weighted forest count turns this cancellation into sparse-level contraction.

The remaining methods retain representation data beyond dimension alone.
  Put $k = N - lambda_1$, $beta = \( lambda_2 \, lambda_3 \, dots.h \)$, and $h_N \( k \) = k log \( e N \/ k \)$,
  with $h_N \( 0 \) = 0$. The dimension $D_beta$ detects complexity below the first row that the level $k$ alone
  cannot measure. A fixed trace moment controls the combined mass of singular values,
  and can therefore be used before the final amplification to the regular representation.
  Table 1 records these outputs; its constants are absolute and need not agree between rows.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Estimate
], table.cell(rowspan: 1, colspan: 1)[Information retained
]),
  table.cell(rowspan: 1, colspan: 1)[Cycle encoding, Section 6
], table.cell(rowspan: 1, colspan: 1)[$H^u \( x \, y \) lt.eq
  e^(C k) \/ \( N \)_k$ for either positive orientation; $parallel T_N \( lambda \) parallel^2 lt.eq
  e^(C k) D_beta^(- a)$.
],
  table.cell(rowspan: 1, colspan: 1)[Contact cancellation, Section 7
], table.cell(rowspan: 1, colspan: 1)[$parallel T_N \( lambda \) parallel^2 lt.eq
  min { 1 \, \( C d k \/ N \)^(k \/ 2) }$, uniformly for $1 lt.eq k < N$.
],
  table.cell(rowspan: 1, colspan: 1)[Casimir split, Section 8
], table.cell(rowspan: 1, colspan: 1)[$parallel K_N \( lambda \) parallel lt.eq
  e^(- a h_N \( k \))$ and $D_lambda "Tr" K_N \( lambda \)^65 lt.eq e^(C h_N \( k \))$.
],
  table.cell(rowspan: 1, colspan: 1)[Harmonic restriction, Section 9
], table.cell(rowspan: 1, colspan: 1)[$parallel T_N \( lambda \) parallel lt.eq
  e^(- c { h_N \( k \) + log D_beta })$ and $"Tr"_(cal(X)_(N \, k)) K_N^(p_0) lt.eq e^(C h_N \( k \))$.
],
  table.cell(rowspan: 1, colspan: 1)[Adaptive alphabets, Section 10
], table.cell(rowspan: 1, colspan: 1)[$"Tr"_(V_lambda) \( T_N T_N^(*) \)^4 lt.eq
  e^(- c log D_lambda + C h_N \( k \))$, paired with level contraction.
],
  table.cell(rowspan: 1, colspan: 1)[Core cutoff, Section 11
], table.cell(rowspan: 1, colspan: 1)[Exponentially small overlap with product types of the midpoint subcube
  subgroups whose product dimension is at most $D_lambda^0.50003$.
],
)
]],
  caption: [Table 1: Further density and representation estimates. All traces are unnormalized. Here $u \, p_0$ are absolute integers and $H$ is either $T_N^(*) T_N$ or $T_N T_N^(*)$. ],
)

The Casimir proof compares the transposition sum with its two child sums;
  the sum defect and squared imbalance require different matrix estimates.
  The harmonic proof bounds the loss caused by removing slots,
  then transfers cycle moments to either lower-diagram dimension or tuple trace.
  These arguments share the elementary tensor-swap estimate, but use different level recursions.
  The alphabet proof changes its tensor realization as descendant diagrams shrink and pays the resulting
  multiplicity costs across the tree. The core-cutoff proof chooses between a diagram bound and a bound using the
  actual trace at the current recursion frontier. Its cutoff is a projection onto small product dimensions.
  Each route supplies its own final passage to the full permutation law using the common Fourier preliminaries.

The companion papers use several of these interfaces while retaining their own arguments.
  The compatibility-entropy paper uses the shared-switch contact bound in Lemma 3.2 in a sparse path second-moment
  estimate #cite(label("CompatibilityEntropy2026")) Lemma 3.1.
  Prescribed-type signed tensor moments and one-sided projection-overlap bounds are developed separately
  in #cite(label("SignedTensorBudgets2026")) Theorems 1.1 and 3.2.
  The row–column geometry paper combines Theorem 14 and Proposition 16 with a coherent-overlap argument to obtain
  a dimension-weighted fixed moment #cite(label("RowColumnGeometry2026")) Theorem 10.1.
  The random-subspace paper applies Corollary 15, in both positive orientations, in its Proposition 2.1;
  complex random-plane tests then give a regular trace at most $1 +
  N^(- 10)$ #cite(label("RandomSubspace2026")) Theorem 1.1.
  An independent conditional-marginal proof gives the explicit bound of $1600
  d$ physical shuffles for total-variation distance tending to zero #cite(label("OptimalThorpMixing2026")) Theorem 1.1.

== 2 The physical chain, Fourier norms and dimension estimates <sec:prelim>

This section fixes the common normalization. Every later passage from a sweep estimate to mixing uses physical
  time measured here. We use $n$ for a generic dyadic block size,
  including the full-deck size $N$ introduced above; the operators $T_n$ and $K_n$ are the corresponding sweep and
  reflected sweep on that block.

=== 2.1 Binary positions and sweep operators <binary-positions-and-sweep-operators>

Number positions by $x = \( x_1 \, dots.h \, x_d \) in bb(F)_2^d$, most significant bit first. One shuffle sends

$ x mapsto \( x_2 \, dots.h \, x_d \, x_1 + xi_(x_2 \, dots.h \, x_d) \) \, $

where the $2^(d - 1)$ bits $xi$ are independent and fair.
  Write $R$ for the cyclic rotation and $h_t$ for the pair switches at physical time $t$,
  so the time-$t$ permutation is $R h_t dots.h.c R h_1$. Factoring out $R^t$ conjugates the switches into the
  successive coordinate directions. This deterministic left multiplication preserves distance to uniform.
  At time $d$, $R^d = I$, and one sweep has exactly the law of $d$ physical shuffles.

Permutations send each input position to its output. A product $g h$ applies $h$ first.
  For measures, $mu * nu$ denotes the law of $g h$ for independent $g tilde.op mu \, h tilde.op nu$.
  In a unitary representation $rho_lambda$, define

$ hat(mu) \( lambda \) = sum_g mu \( g \) rho_lambda \( g \) \, wide accent(mu * nu, ̂) = hat(mu) thin hat(nu) . $

A fair switch layer averages the subgroup generated by its disjoint transpositions,
  and hence is an orthogonal projection $Pi_i$. With chronological coordinate order $1 \, dots.h \, d$, put

$ T_n = Pi_d dots.h.c Pi_1 \, wide K_n = T_n^(*) T_n \, wide n = 2^d . $

At the one-position recursive base, the empty product gives $T_1 = K_1 = I$.

#thm([Lemma 2.1.])[
  (Annihilated shapes).  #emph[The sign representation is annihilated by every nonempty fair layer.
    For $n gt.eq 2$, every irreducible of $S_n$ indexed by a shape with more than $n \/
    2$ rows is annihilated by a sweep.]
] <lem:annihilation>

#proof[
  The sign average contains a fair transposition. For the second assertion, by Young’s rule,
    the permutation module induced from the trivial representation of $\( S_2 \)^(n \/ 2)$ has only shapes
    dominating $\( 2^(n \/ 2) \)$, hence at most $n \/ 2$ rows. ◻
]

#thm([Lemma 2.2.])[
  (Finite-size norm gap).  #emph[For every fixed dyadic $n gt.eq 2$,
    $parallel T_n \( lambda \) parallel_(upright("op")) < 1$ on every nontrivial irreducible.]
] <lem:finitegap>

#proof[
  Equality on a unit vector would force equality at every orthogonal projection in the product.
    The vector would be fixed by all coordinate-pair transpositions.
    The edges of the cube form a connected graph, and its edge transpositions generate $S_n$,
    contradicting nontrivial irreducibility. ◻
]

#thm([Lemma 2.3.])[
  (Support obstruction).  #emph[For every integer $t gt.eq 0$,
$ parallel q_d^(* t) - U_(S_n) parallel_(upright("TV")) gt.eq 1 - 2^(t n \/ 2) \/ n ! . $

 Consequently $t_(upright("mix")) \( d \) gt.eq ceil.l \( 2 \/ n \) log_2 \( 3 n ! \/ 4 \) ceil.r = 2 d - O \( 1 \)$.]
] <lem:support>

#proof[
  At most $2^(t n \/ 2)$ coin strings are available, so the law is supported on at most that many permutations.
    Comparing this support set with its uniform mass proves the first assertion.
    Distance at most $1 \/ 4$ requires support mass at least $3 \/ 4$, giving the exact integer lower bound.
    Stirling’s formula gives the final expression. ◻
]

=== 2.2 Plancherel and powers of a nonnormal sweep <plancherel-and-powers-of-a-nonnormal-sweep>

All matrix traces and Schatten norms are unnormalized. Thus $parallel A parallel_(S^p)^p = "Tr" \| A \|^p$,
  with $S^2 = upright("HS")$ and $S^oo = upright("op")$. If $D_lambda$ is the irreducible dimension,
  finite-group orthogonality gives

$ \| G \| sum_g \| mu \( g \) \|^2 = sum_lambda D_lambda parallel hat(mu) \( lambda \) parallel_(upright("HS"))^2 . $

It applies to signed measures and subprobabilities as well as probabilities.
  Together with Cauchy–Schwarz, it gives the finite-group Fourier upper bound used by Diaconis and
  Shahshahani #cite(label("DiaconisShahshahani1981")) Section 2, Lemma 2; Section 3, Lemma 14.
  For a measure $v$ of mass $m$,

#[#set math.equation(numbering: n => "(1)")
 $ parallel v - m U_G parallel_1^2 lt.eq sum_(lambda eq.not upright(bold(1))) D_lambda parallel
   hat(v) \( lambda \) parallel_(upright("HS"))^2 . $ <eq:plancherel>]

For a probability the left side is $4 parallel v - U_G parallel_(upright("TV"))^2$.
  If $0 lt.eq v lt.eq mu$ and $mu$ is a probability, then

#[#set math.equation(numbering: n => "(2)")
 $ parallel mu - U_G parallel_(upright("TV")) lt.eq 1 - m + 1 / 2 parallel v - m U_G parallel_1 . $ <eq:lostmass>]

Both follow from Cauchy–Schwarz and the triangle inequality, respectively.

#thm([Lemma 2.4.])[
  (Safe use of sweep powers).  #emph[For integers $r gt.eq s gt.eq 1$ and any matrix $T$, setting $Q = T^(*) T$,
$ parallel T^r parallel_(upright("HS"))^2 lt.eq parallel Q parallel_(upright("op"))^(r - s) "Tr" Q^s . $

]
] <lem:schatten>

#proof[
  Schatten Hölder gives $parallel T^s parallel_(upright("HS")) lt.eq parallel T parallel_(S^(2 s))^s$,
    and multiplying the remaining $r - s$ factors costs at most $parallel T parallel_(upright("op"))^(r - s)$.
    Squaring proves the claim. No normality of $T$ is used. ◻
]

=== 2.3 Injection multiplicities and inverse-degree sums <injection-multiplicities-and-inverse-degree-sums>

We use the standard indexing of complex irreducibles of $S_n$ by partitions $lambda tack.r n$, with $D_lambda =
  f^lambda$ equal to the number of standard tableaux #cite(label("Sagan2001")) #cite(label("Stanley1999")).
  Write $k = n - lambda_1$ and $macron(lambda) = \( lambda_2 \, lambda_3 \, dots.h \)$.
  Young branching and Frobenius reciprocity show that the representation on ordered distinct $r$-tuples contains
  $lambda$ with multiplicity

$ f^(lambda \/ \( n - r \)) . $

At $r = k$ this is $f^(macron(lambda))$, and $lambda$ does not occur on fewer slots.
  If $k lt.eq r lt.eq n - k$, the remaining first-row boxes are separated from the tail, giving

#[#set math.equation(numbering: n => "(3)")
 $ m_lambda \( r \) = binom(r, k) f^(macron(lambda)) \, wide D_lambda lt.eq
   binom(n, k) f^(macron(lambda)) . $ <eq:tuplemultiplicity>]

The inequality follows by choosing the entries below the first row and forgetting cross-row tableau constraints.
  The same hook formula gives the useful quantitative refinement

#[#set math.equation(numbering: n => "(4)")
 $ D_lambda gt.eq binom(n, k) f^(macron(lambda)) exp (- frac(k, n - 2 k + 1)) wide \( 0 lt.eq k lt.eq n \/ 2 \) .
   $ <eq:near-row-hooks>]

Indeed the hook inflation along the top row, relative to $\( n - k \) !$, is

$ product_(j lt.eq lambda_2) (1 + frac(lambda'_j - 1, n - k - j + 1)) . $

The denominators are at least $n - 2 k + 1$ and $sum_j \( lambda'_j - 1 \) = k$.
  Taking logarithms bounds this product by $exp \( k \/ \( n - 2 k + 1 \) \)$.
  The remaining hooks are exactly those of $macron(lambda)$.
  In particular for $k lt.eq .14 n$ the loss is $exp \( O \( k \/ n \) \)$,
  which also supplies the weaker $exp \( O \( k log n \/ n + k \/ n \) \)$ loss when that form is convenient.

The inverse-degree conclusions below are special cases of Liebeck–Shalev #cite(label("liebeck-shalev2004"))
  Proposition 2.5 and Theorem 2.6. We include an elementary proof of the estimates needed here,
  together with a lower bound for individual dimensions.

#thm([Lemma 2.5.])[
  (Degree sums).  #emph[Uniformly in $n$, $sum_(lambda tack.r n) D_lambda^(- 1)$ is bounded, and
$ sum_(lambda eq.not \( n \) \, \( 1^n \)) D_lambda^(- 1) arrow.r 0 . $

 If $ell = n - max \( lambda_1 \, lambda'_1 \)$, then
$ log D_lambda gt.eq \( log 2 \) sqrt(ell) \/ 2 \, wide sup_n sum_(lambda tack.r n) D_lambda^(- 32) < oo . $

]
] <lem:degrees>

#proof[
  Transpose if necessary so that the first row has length $r = max \( lambda_1 \, lambda'_1 \)$.
    If $r lt.eq n \/ 8$, the hook formula gives $D_lambda gt.eq n ! \/ \( 2 r \)^n$, exponential in $n$.
    If $n \/ 8 < r lt.eq 3 n \/ 4$, retain the first row and $floor.l r \/ 4 floor.r$ further boxes.
    Their tableaux extend to the whole diagram. A first row of length $r$ and a tail of size $j lt.eq r$ have at least
  $ binom(r + j, j) frac(r - j + 1, r + 1) $
  tableaux: ballot interleavings of the first row with any fixed standard order of the tail respect all column
    inequalities. This is exponential in $n$ in the present range.
    There are $exp \( O \( sqrt(n) \) \)$ partitions, so these ranges contribute $o \( 1 \)$ to the inverse-degree
    sum. If $r > 3 n \/ 4$, write $j = n - r$. The same ballot bound is at least a fixed multiple of
    $binom(n, j)$. There are at most $2 p \( j \)$ possible shapes up to transpose, and $binom(n, j) gt.eq
    4^j$ for $j < n \/ 4$. Since $p \( j \) = exp \( O \( sqrt(j) \) \)$ and each fixed positive $j$ gives a
    divergent binomial coefficient, dominated convergence proves the first assertion.
  For the square-root estimate, put $b = lambda_2$ and $h = lambda'_1$, so $b \( h - 1 \) gt.eq ell$.
    If $h - 1 gt.eq sqrt(ell)$, a hook with row and column length $h$ has at least $2^(h - 1)$ tableaux.
    Otherwise $b gt.eq sqrt(ell)$ and the two-row rectangle of width $b$ has the Catalan number of tableaux,
    at least $2^(b - 1)$. Subdiagram tableaux extend; handling $ell = 0$ separately proves the displayed bound.
    Finally $p \( j \) lt.eq e^(3 sqrt(j))$ follows by evaluating the partition generating product at
    $e^(- 1 \/ sqrt(j))$. Summing $2 e^(3 sqrt(ell)) e^(- 16 \( log 2 \) sqrt(ell))$ proves the inverse-32 bound. ◻
]

== 3 The routing density and repeated irreducible copies <sec:network>

A sweep followed by its reflection has a recursive description:
  an outer layer of fair switches, two independent half-sized networks, and another outer layer.
  The architecture is the Beneš network #cite(label("Benes1964")).
  Its two-child probabilistic recursion was studied in #cite(label("GelmanTaShma2014")) Section 4, Proposition 1;
  we derive below the partial-permutation density identity needed here.
  The goal is to express a partial-permutation density in terms of the cycles created by its routing constraints.
  We then prove a truncation lemma that converts a density bound into contraction on repeated copies of an
  irreducible representation.

=== 3.1 Alternating colors and multiplicity <alternating-colors-and-multiplicity>

Fix an ordered list of $k$ input positions and a candidate list of $k$ distinct output positions.
  At one node, make a graph on its tracked paths, joining two when they use the same outer input switch or the
  same outer output switch. Its degree is at most two. Input and output edges alternate;
  parallel edges form a cycle. If $s$ paths are present, $a$ is the number of edges,
  and $C$ is the number of cycles, the number of proper assignments of paths to the two children is

$ 2^(s - a + C) . $

Indeed a path component has one more vertex than edge, whereas a cycle has equally many.
  Each component admits two child assignments, obtained by exchanging the colors.
  Thus each cycle supplies one factor of two beyond $2^(s - a)$, as illustrated in Figure 1.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 1.1), [#box(width: 2.5cm, height: 1.2cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[child network $0$]]])])
  content((0, -1.1), [#box(width: 2.5cm, height: 1.2cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false); #align(center + horizon)[#text(size: 9pt)[child network $1$]]])])
  line((-4, 1.5), (-3, 1.5), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((3, 1.5), (4, 1.5), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((-4, 0.7), (-3, 0.7), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((3, 0.7), (4, 0.7), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((-4, -0.7), (-3, -0.7), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((3, -0.7), (4, -0.7), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((-4, -1.5), (-3, -1.5), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((3, -1.5), (4, -1.5), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((-3, 1.5), (-3, 0.7), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((-3, -0.7), (-3, -1.5), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((3, 1.5), (3, 0.7), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((3, -0.7), (3, -1.5), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((-3, 1.5), (-1.25, 1.3), stroke: (paint: rgb("#0000ff"), thickness: 0.4pt, miter-limit: 10))
  line((-3, 0.7), (-1.25, -0.9), stroke: (paint: rgb("#ff0000"), thickness: 0.4pt, miter-limit: 10))
  line((-3, -0.7), (-1.25, 0.9), stroke: (paint: rgb("#0000ff"), thickness: 0.4pt, miter-limit: 10))
  line((-3, -1.5), (-1.25, -1.3), stroke: (paint: rgb("#ff0000"), thickness: 0.4pt, miter-limit: 10))
  line((1.25, 1.3), (3, 1.5), stroke: (paint: rgb("#0000ff"), thickness: 0.4pt, miter-limit: 10))
  line((1.25, 0.9), (3, -0.7), stroke: (paint: rgb("#0000ff"), thickness: 0.4pt, miter-limit: 10))
  line((1.25, -0.9), (3, 0.7), stroke: (paint: rgb("#ff0000"), thickness: 0.4pt, miter-limit: 10))
  line((1.25, -1.3), (3, -1.5), stroke: (paint: rgb("#ff0000"), thickness: 0.4pt, miter-limit: 10))
  content((-3, 2.3), [#text(size: 9pt)[input pair#linebreak()switches]])
  content((3, 2.3), [#text(size: 9pt)[output pair#linebreak()switches]])
  content((0, -2.2), [#text(size: 9pt)[Example components: $s$ tracked paths, $a$ edges]])
  content((-4, -3.25), [#text(size: 9pt)[$0$]])
  content((-2.8, -3.25), [#text(size: 9pt)[$1$]])
  content((-1.6, -3.25), [#text(size: 9pt)[$0$]])
  content((-0.4, -3.25), [#text(size: 9pt)[$1$]])
  line((-3.796, -3.25), (-3.004, -3.25), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-3.4, -3.25), [#text(size: 7pt)[input]], anchor: "south", padding: 0.1176cm)
  line((-2.596, -3.25), (-1.804, -3.25), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-2.2, -3.25), [#text(size: 7pt)[output]], anchor: "south", padding: 0.1176cm)
  line((-1.396, -3.25), (-0.604, -3.25), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-1, -3.25), [#text(size: 7pt)[input]], anchor: "south", padding: 0.1176cm)
  content((1.4, -3.25), [#text(size: 9pt)[$0$]])
  content((3.4, -3.25), [#text(size: 9pt)[$1$]])
  bezier((1.4, -3.25), (3.4, -3.25), (2.039, -2.803), (2.761, -2.803), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.4, -2.914), [#text(size: 7pt)[input]], anchor: "south", padding: 0.1176cm)
  bezier((1.4, -3.25), (3.4, -3.25), (2.039, -3.697), (2.761, -3.697), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.4, -3.586), [#text(size: 7pt)[output]], anchor: "north", padding: 0.1176cm)
  content((-2.2, -4.7), [#text(size: 9pt)[path: $s=4$, $a=3$#linebreak()$2=2^(s-a)$ child assignments]])
  content((2.4, -4.7), [#text(size: 9pt)[cycle: $s=2$, $a=2$#linebreak()$2=2^(s-a) dot.op 2$ child assignments]])
  content((0, -5.75), [#text(size: 9pt)[Each edge forces opposite child labels.#linebreak()On each component, swapping $0$ and $1$ gives the second assignment.]])
})],
  caption: [Figure 1: A recursive network node (top) and two components of a routing-constraint graph (bottom). Each graph vertex represents a tracked path, and each input or output edge forces its endpoints into opposite children. Both displayed components have two child assignments, but the cycle contributes an extra factor $2$ relative to $2^(s - a)$. The four paths in the network panel are schematic; each child contains half the positions. ],
) <fig:network-node>

Each assignment prescribes $2 s - a$ independent outer coins, hence costs $2^(- \( 2 s - a \))$.
  Their combined factor is $2^(- s + C)$. Recursing through the nodes and choosing proper colorings uniformly
  gives a density relative to the uniform injection with excess exponent

#[#set math.equation(numbering: n => "(5)")
 $ X = sum_(j = 1)^d C_j + log_2 frac(\( N \)_k, N^k) \, $ <net:exponent>]

where $C_j$ totals tracked cycles at height $j$. We distinguish the auxiliary coloring law from the actual switch
  law. For fixed input and output injections $x \, y$, let $omega$ be a legal complete tree of child colorings.
  At a node $v$, write $s_v \, e_v \, C_v$ for its path, edge and cycle counts, and put $a_v =
  2^(s_v - e_v + C_v)$. The auxiliary weight and actual routing-event weight are respectively

$ q_(x y) \( omega \) = product_v a_v^(- 1) \, wide w_(x y) \( omega \) = product_v 2^(- \( 2 s_v - e_v \)) \,
  wide frac(w_(x y) \( omega \), q_(x y) \( omega \)) = N^(- k) 2^(sum_v C_v) . $

The last identity uses $sum_v s_v = k d$. At the leaves the routing is determined.
  Summing unused switch coins contributes one, so $w_(x y) \( omega \)$ is exactly the probability of the
  corresponding endpoint-and-coloring event. Thus

$ K_N \( x \, y \) = sum_omega w_(x y) \( omega \) = frac(1, \( N \)_k) bb(E)_(q_(x y)) 2^X . $

For the certificate alternative in Section 5, one may truncate the routing event itself.
  Define $A \( x \, y \) = sum_omega w_(x y) \( omega \) upright(bold(1))_({ X lt.eq L })$ and $E = K_N - A$.
  Then $A \( x \, y \) lt.eq 2^L \/ \( N \)_k$, while

#[#set math.equation(numbering: n => "(6)")
 $ sum_y E \( x \, y \) = sum_(y \, omega) w_(x y) \( omega \) upright(bold(1))_({ X > L }) =
   bb(P)_(upright("actual") \, x) \( X > L \) . $ <net:discarded-actual-law>]

Indeed $\( y \, omega \)$ partitions the actual switch experiment.
  The tail estimates below therefore bound discarded mass under the actual network law,
  without identifying that law with the auxiliary uniform-coloring law.
  The factor $\( N \)_k \/ N^k$ is essential: the endpoints form an injection, not a tuple sampled with replacement.

#thm([Lemma 3.1.])[
  (Truncation and repeated irreducible copies).  #emph[Let a finite group act transitively on a set of size $M$,
    and let $Q$ be the symmetric Markov kernel induced on its permutation module by a probability measure on that
    group. Suppose $Q = A + E$ entrywise, where $A \, E gt.eq 0$, every entry of $A$ is at most $B \/ M$,
    and the row and column sums of $E$ are at most $p$. If an irreducible representation occurs with multiplicity
    $m > 0$, then
$ parallel Q \( lambda \) parallel_(upright("op")) lt.eq sqrt(B \/ m) + p . $

 It is not necessary that $A$ preserve the irreducible subspaces.]
] <net:truncation>

#proof[
  Schur’s test gives $parallel E parallel_(upright("op")) lt.eq p$.
    Since the row sums of $A$ are at most one, $parallel A parallel_(upright("HS"))^2 lt.eq \( B \/ M \)
    sum_(x \, y) A \( x \, y \) lt.eq B$. Choose one maximizing unit vector for $Q \( lambda \)$ in each of its
    $m$ orthogonal equivalent copies. They are orthonormal and each image under $A$ has norm at least $parallel
    Q \( lambda \) parallel_(upright("op")) - p$. Their squared image norms sum to at most $parallel A
    parallel_(upright("HS"))^2$. This proves the claim. ◻
]

The first proof in Section 4 instead truncates the endpoint density:
  it retains an entry when $\( N \)_k K_N \( x \, y \) lt.eq z$.
  Its density moment bounds the discarded row mass by Markov’s inequality, and symmetry bounds the column mass.
  Both cutoffs use Lemma 7; the letter $Q$ in that abstract lemma denotes any kernel satisfying its hypotheses.

For the routing-event cutoff above, reversal preserves the cutoff event,
  so a uniform discarded-row bound also bounds columns. Lemma 7 therefore gives $2^(L \/ 2) \/ sqrt(m) + p$.

=== 3.2 How often can selected paths meet? <how-often-can-selected-paths-meet>

The next deterministic fact will control the information revealed about a closing route by other paths.
  Its logarithm is to base two.

#thm([Lemma 3.2.])[
  (Butterfly encounters).  #emph[ Any $h$ distinct routed paths through a butterfly that updates each of $d$
    binary coordinates once have at most $h log_2 h \/ 2$ shared switches in total, with $0 log_2 0 = 0$.
    Their contact graph has maximum degree at most $d$. Counting both path endpoints at each shared switch gives
    at most $h log_2 h$ contacts.]
] <net:encounters>

#proof[
  Split by the coordinate edited last. If the two classes have sizes $a \, h - a$,
    that layer contributes at most $min \( a \, h - a \)$ meetings. Apply induction to the earlier subnetworks and use
  $ 2 min \( a \, h - a \) lt.eq h log_2 h - a log_2 a - \( h - a \) log_2 \( h - a \) . $
  This is the binary entropy inequality $H_2 \( x \) gt.eq 2 min \( x \, 1 - x \)$, where $H_2 \( x \) = -
    x log_2 x - \( 1 - x \) log_2 \( 1 - x \)$. Empty terms are zero.
    Summing over the recursive splits proves the assertion. Distinct paths meet at most once:
    after a common switch they differ in a coordinate that is never edited again.
    A path meets at most one other path at each of its $d$ switches, proving the degree assertion. ◻
]

== 4 The factorial-moment proof <sec:factorial>

We now prove Theorem 1. The cycle estimate controls sparse injections and very large representation dimensions.
  The remaining dimensions require a second density estimate,
  obtained after replacing fixed-size middle blocks by uniform permutations.
  We prove both density assertions before making the representation split.

For the recursive description number the coordinates so that the palindrome uses layers $d \, dots.h \, 1 \, 1 \,
  dots.h \, d$. A node of size $2^t$ varies in its low $t$ coordinates.
  This reversal of coordinate names does not change its law up to conjugation.
  Thus $K_N = T_N^(*) T_N$, consistently with Section 1, and $parallel K_N \( lambda \) parallel =
  parallel T_N \( lambda \) parallel^2$.

=== 4.1 Closing routes and factorial cycle moments <closing-routes-and-factorial-cycle-moments>

An alternating cycle in the network can be followed by going through one child and returning through the other.
  After one child map is fixed, this produces a permutation containing fresh butterfly layers between fixed
  bijections. The following lemma counts several cycles of such a permutation at once.
  Its distinguished slots let us sum over all choices of cycle lengths without losing a factorial.

#thm([Lemma 4.1.])[
  (Factorial moments with distinguished cycle slots).  #emph[On a finite set take a permutation given by
    independent butterflies of block size $n = 2^r$ in parallel,
    composed before and after with arbitrary fixed permutations (we allow identifications of the sets at each
    stage). Fix a subset of size at most $k$, and count cycles lying entirely inside it,
    with $F_j$ the number of length $j$. For nonnegative integers $a_j$ (finitely supported) and $A = sum a_j$,
#[#set math.equation(numbering: n => "(7)")
 $ bb(E) product_j \( F_j \)_(a_j) med lt.eq med \( k \/ sqrt(n) \)^A product_j j^(- a_j \/ 2) . $ <fac:e3>]

 Here $\( F \)_a = F \( F - 1 \) dots.h.c \( F - a + 1 \)$ and $\( F \)_0 = 1$.]
] <fac:cycle-factorial>

#proof[
  Order the sought cycles by nondecreasing length, with slots distinguished,
    and choose a starting vertex for each (at most $k^A$ choices).
    Following a cycle involves querying successive butterfly paths, with the last one required to close the cycle.
    Demand that these are the specified lengths with no repetitions before closure, are disjoint cycles,
    and are within the subset; otherwise call this failure. Each closing path has a specified input and output by
    the time it needs to be queried; conditional on the previous path exposures its probability is zero or $2^u \/
    n$, where $u$ counts switches on that route already exposed (a route through a single butterfly to a given
    compatible endpoint is unique). If $cal(G)$ is the exploration just before a closing query,
    its required input and output are $cal(G)$-measurable, and
  $ bb(E) \[ upright(bold(1))_({ upright("closure") }) n 2^(- u) divides cal(G) \] lt.eq 1 \, $
  with value zero for an incompatible route. Ordinary nonclosing queries insert no weight.
    Iterating these conditional identities, while requiring all the distinctness and length conditions, gives
  $ bb(E) \[ 1_(upright("success")) n^A 2^(- U) \] lt.eq 1 $
  for each choice of starts, with $U$ the sum of those counts on success.
    This follows also by sequentially forcing the closing paths when possible,
    which changes measure by the indicated factors while other path steps cost no weight.
  It remains to bound how much the previously exposed paths can help the closing routes.
    For a realized collection in specified slots, rotate its starts independently uniformly.
    $U$ counts meetings of selected butterfly paths, namely when the closing path uses a switch met previously.
    Weight each selected path in a cycle of length $j$ by $1 \/ j$.
    For meetings between different cycles the expected charge per meeting over rotations is the smaller of the
    weights (or bounded by it), since cycles are processed by length. Within one cycle it is at most $2 \/ j$.
    For any subset of $s$ selected paths the total meetings between them in a butterfly layer sequence is at most
    $s r \/ 2$. Within paths of one cycle of length $j$, Lemma 8 gives the stronger bound $j log_2 j \/ 2$.
    For several independent butterfly blocks, apply the lemma in each block and use $sum_i j_i log j_i lt.eq
    j log j$ when $sum_i j_i = j$. Now integrate the subset bound $s r \/ 2$ over thresholds on the weights:
    this gives $A r \/ 2$ for the sum charging each meeting the minimum weight.
    The additional within-cycle charges give at most $sum_j a_j log_2 \( j \) \/ 2$.
    By Jensen, the sum over rotations ($product_j j^(a_j)$ of them) of $2^(- U)$ for each collection is thus at least
  $ product_j j^(a_j) thin n^(- A \/ 2) product_j j^(- a_j \/ 2) . $
  To make the counting explicit, let $frak(C) \( omega \)$ be the set of ordered collections of distinct cycles of
    the realized permutation, with $a_j$ distinguished slots of length $j$.
    Its cardinality is $product_j \( F_j \( omega \) \)_(a_j)$.
    Each collection has exactly $product_j j^(a_j)$ choices of starts.
    Sum the weighted success inequality over all start choices, then interchange that sum and the expectation.
    The preceding lower bound for the total rotation weight gives
  $ k^A gt.eq bb(E) sum_(cal(C) in frak(C) \( omega \)) sum_(upright("starts of ") cal(C)) n^A 2^(- U) gt.eq
    n^(A \/ 2) product_j j^(a_j \/ 2) thin bb(E) product_j \( F_j \)_(a_j) . $
  Dividing proves (7). ◻
]

For later use, if $q gt.eq 1$ and $J gt.eq 1$ is an integer, cycles longer than $J$ contribute at most $k \/ J$.
  Expanding $q^(sum_(j lt.eq J) F_j)$ in factorial moments and using $sum_(j lt.eq J) j^(- 1 \/ 2) lt.eq
  2 sqrt(J)$ gives

#[#set math.equation(numbering: n => "(8)")
 $ log bb(E) q^(sum_j F_j) lt.eq \( k \/ J \) log q + 2 q k sqrt(J) \/ sqrt(n) . $ <fac:e4>]

=== 4.2 The two density estimates <net:factorial-route>

#thm([Lemma 4.2.])[
  (Palindromic row-density moments).  #emph[Let $N = 2^d$, $1 lt.eq k lt.eq N$, and $a = 1 \/ 1000$.
    For a kernel $Q$ on ordered $k$-injections define
$ M \( Q \, k \) = sup_(x in cal(X)_(N \, k)) bb(E)_(y tilde.op u_(N \, k)) #scale(x: 120%, y: 120%)[\[] \( N \)_k
  Q \( x \, y \) #scale(x: 120%, y: 120%)[\]]^(1 + a) . $

 There are absolute $C \, eta > 0$ with the following properties;
   below $M$ denotes $M \( Q \, k \)$ for the kernel in question.]
  - #emph[for $K_N$, $log M lt.eq C k \( k \/ N \)^eta$, for some absolute $C < oo$ and $eta > 0$;]
  - #emph[consider the modified palindrome obtained by replacing the central subnetworks of size $S =
    2^L$ by independent uniform permutations, except in at most $b$ specified such blocks where they are replaced
    by identity. For every $xi > 0$, there is $L_0$ such that for each fixed $L gt.eq
    L_0$ there are $epsilon.alt > 0$ and $d_0 gt.eq L$ for which $M \( Q \, N \) lt.eq e^(xi N)$ whenever $d gt.eq
    d_0$ and $b S \/ N lt.eq epsilon.alt$.]
] <fac:density>

#proof[
  For $N = 1$, the only injection has one position and every kernel in the statement is identity, so $M = 1$.
    Assume henceforth that $d gt.eq 1$. To see how to estimate these integrals,
    expand the transition probability by splitting off the outermost layers of each block, recursively.
    At a given node of size $2^t$, let $h$ be the number of marked paths (the paths of the tuple) there.
    Given their endpoints at that node, write $b_x \, b_y$ for the numbers of occupied direction-$t$ pairs at the
    two ends. Each term assigns each path to one of the two children,
    with opposite assignments for a pair coming from the same direction-$t$ edge on either end.
    Its probability factor for the outer layers is $2^(- b_x - b_y)$.
    On the labels of paths the two matchings (allowing unmatched vertices) giving these constraints form
    alternating chains and even cycles, counting parallel matching edges as a cycle as well.
    If there are $z$ cycles the number of assignments is at most $2^(b_x + b_y - h + z)$, by counting components.
    Each assignment fixes the child endpoints, and has as further factors the child probabilities. Apply
  $ \( sum_i p_i \)^(1 + a) lt.eq \( \# i \)^a sum_i p_i^(1 + a) $
  at each expansion. On summing over terminal tuple images $y$,
    keeping one power of each term as the actual routing probability,
    the remaining factors at expanded nodes give $2^(a \( - h + z \))$. Thus, for any initial tuple,
  #[#set math.equation(numbering: n => "(9)")
   $ bb(E)_(y tilde.op u_(N \, k)) R_x \( y \)^(1 + a) lt.eq \[ \( N \)_k \/ N^k \]^a thin bb(E)
     2^(a sum_(t = 1)^d Z_t) \, $ <fac:e1>]
  where $Z_t$ totals the cycles at level $t$ of the actual routing (unused paths can be filled in via the actual
    switches). For the modified palindrome with $k = N$, stop after levels $d \, dots.h \, L + 1$. Instead the bound is
  #[#set math.equation(numbering: n => "(10)")
   $ \[ N ! thin \( S \/ N \)^N \( S ! \)^(- N \/ S + b) \]^a thin bb(E) 2^(a sum_(t > L) Z_t) . $ <fac:e2>]
  Indeed all paths are then used and the extra central probability factors are uniform $\( S ! \)^(- 1)$ or identity.
  #strong[Fresh layers at one height.] Lemma 9 concerns fresh butterfly layers,
    whereas cycle counts at different network heights share coins.
    Label paths at the central cross section and read the two butterflies outward, calling them $X$ and $Y$.
    Conditioning on $X$ fixes the marked central labels.
  Fix a height $t$. Let $Omega_0 \, Omega_1$ be the unions of the bit-zero and bit-one halves in direction $t$ of
    all size-$2^t$ nodes. Reading the first $t - 1$ layers of $X$ gives bijections $X_0 \,
    X_1$ from these halves to a common set of switch columns.
    The input matching, viewed from $Omega_0$ to $Omega_1$, is $I = X_1^(- 1) X_0$.
    The corresponding output matching is $Y_1^(- 1) Y_0$. Hence following an output edge and then an input edge
    gives the permutation
  #[#set math.equation(numbering: n => "(11)")
   $ pi_t = I^(- 1) Y_1^(- 1) Y_0 = X_0^(- 1) X_1 Y_1^(- 1) Y_0 quad
     upright("on ") Omega_0 . $ <fac:relative-permutation>]
  Each full alternating cycle gives one cycle of $pi_t$. The tracked count $Z_t$ includes only those cycles whose
    vertices on both sides are marked. In particular it is bounded by the number of cycles of $pi_t$ contained in
    the marked subset of $Omega_0$, a fixed set of size at most $k$ under the conditioning on $X$.
    Switches at layer $t$ change neither matching.
  Now expose the first $s < t - 1$ outward layers of $Y$, and, for this single-height estimate,
    the remaining maps on $Omega_1$. The map $Y_1$ is then fixed.
    On $Omega_0$, write $Y_0 = B U$, where $U$ is the exposed map through height $s$ and $B$ consists of fresh
    parallel butterflies in coordinates $s + 1 \, dots.h \, t - 1$, each of size $n = 2^(t - 1 - s)$.
    Thus $pi_t = \( I^(- 1) Y_1^(- 1) \) B U$ has exactly the form of Lemma 9.
    Its bound is uniform in the exposed maps, so it remains valid after averaging the extra exposure of $Y_1$.
  #strong[Summing heights with their conditioning.]
  Here and below group levels above some integer $H gt.eq 1$ into slabs
  $ l < t lt.eq 2 l \, wide l = H \, 2 H \, 4 H \, dots.h $
  cut off at $d$. Put $cal(F)_s = sigma \( X \, upright("the first ") s upright(" outward layers of ") Y \)$ and
    $B_l = sum_(l < t lt.eq min \( 2 l \, d \)) Z_t$. The band variable $B_l$ is $cal(F)_(2 l)$-measurable (with
    $cal(F)_s = cal(F)_d$ for $s > d$). Split the slabs into their two alternating families.
    In either family, the preceding slab ends at $l \/ 2$, so its cycle count is
    $cal(F)_(floor.l l \/ 2 floor.r)$-measurable.
  Conditioned on that field, the single-level estimate above has a fresh butterfly of size $n gt.eq 2^(l \/ 2)$.
    Hölder within the slab uses at most $l$ factors. For the exponential moment with exponent $2 a$, take $q =
    2^(2 a l)$ and $J = ceil.l 2^(l \/ 16) ceil.r$ in (8). Uniformly in the conditioning,
  #[#set math.equation(numbering: n => "(12)")
   $ log bb(E) \[ q^(Z_t) divides cal(F)_(floor.l l \/ 2 floor.r) \] lt.eq C k 2^(- c_0 l) . $ <fac:e5>]
  The two terms on the right of (8) decay exponentially because $2 a < 1 \/ 16$. Thus, after Hölder,
  $ bb(E) \[ 2^(2 a B_l) divides cal(F)_(floor.l l \/ 2 floor.r) \] lt.eq exp \( C k 2^(- c_0 l) \) . $
  For example, if $l_(*)$ is the last slab in one family and $V$ is the sum of its earlier bands,
    the tower property gives
  $ bb(E) \[ 2^(2 a \( V + B_(l_(*)) \)) divides X \] = bb(E) #h(-0.16667em)
    [2^(2 a V) bb(E) \[ 2^(2 a B_(l_(*))) divides cal(F)_(floor.l l_(*) \/ 2 floor.r) \] thin mid(bar.v) thin X]
    lt.eq e^(C k 2^(- c_0 l_(*))) bb(E) \[ 2^(2 a V) divides X \] . $
  Iterate backwards through each family and apply Cauchy–Schwarz to the two families.
    The geometric sum of their costs proves
  #[#set math.equation(numbering: n => "(13)")
   $ log bb(E) \[ 2^(a sum_(t > H) Z_t) divides X \] lt.eq C k 2^(- c_1 H) . $ <fac:e6>]
  The same reasoning holds with $a$ replaced by $2 a$: even the resulting single-level exponent $4
    a$ is smaller than $1 \/ 16$. We will use this explicit doubling when separating low and high levels.
  #strong[Low heights and the sparse density bound.] The high-height cost decays with its starting height.
    At low heights, sparse occupancy supplies the gain instead.
    For the low levels of (9), partition the central labels into size $R =
    2^H$ blocks and let $V_D$ count marked positions in such a block $D$.
    (Use $H lt.eq d$.) All low-level cycles are internal to such blocks and
  $ sum_(t lt.eq H) Z_t lt.eq H sum_D V_D 1_(V_D gt.eq 2) . $
  For every set of central positions of size $v$ the probability under $X$ they are all marked is at most $p^v$,
    $p = k \/ N$. Indeed the upper product-of-marginals bound for every subset holds initially (trace the marked
    inputs towards the center). It is preserved under a single fair switch:
    for sets with one endpoint use averaging of the two bounds; with both endpoints use the old product,
    bounded by the product with both marginals replaced by their mean.
    After the layers of $X$ each position has marginal $p$.
  Write $w = 2^(a H)$. In each block use
  $ w^(V_D 1_(V_D gt.eq 2)) lt.eq 1 + sum_(i = 2)^R binom(V_D, i) w^i . $
  Expanding the product and using the joint inclusion bounds yields
  $ log bb(E) 2^(a sum_(t lt.eq H) Z_t) lt.eq \( N \/ R \) sum_(i = 2)^R binom(R, i) \( p w \)^i lt.eq
    C \( N \/ R \) \( R p w \)^2 $
  when $R p w$ is bounded. Choose $H = max \( 1 \, floor.l log_2 \( 1 \/ p \) \/ 4 floor.r \)$; then $H lt.eq d$.
    For the low-height estimate with exponent $2 a$, replace $w$ by $2^(2 a H)$.
    The product $R p w$ stays bounded, and the resulting logarithmic cost is at most
  $ C k p R 2^(4 a H) lt.eq C' k p^(\( 3 - 4 a \) \/ 4) . $
  The high-height estimate (13) also holds at exponent $2 a$, with cost at most $C k 2^(- c_1 H)$.
    Low heights still depend on $Y$, so use Cauchy–Schwarz between the two height ranges, then average over $X$.
    Their costs are at most $C k p^eta$ for some absolute $eta > 0$.
    The normalization in (9) is at most one, proving the first claim.
    If there are no heights above $H$, only the low-height bound is needed.
  #strong[Uniform central blocks and the dense density bound.] For (10),
    label paths at the input boundary of the central size-$S$ blocks.
    Fix the input-side outer butterfly $X$, and include the uniform or identity central maps at the beginning of
    $Y$. Use the same slabs with $H = L$. We distinguish their first members, $l = L$ and $l = 2 L$,
    from the later ones.
  At a later slab, $l gt.eq 4 L$, condition on $X$, the central maps,
    and the ordinary output layers through height $floor.l l \/ 2 floor.r$.
    The previous same-parity slab is measurable in this field.
    All fresh coordinates used in (12) lie strictly above the central blocks,
    so that estimate applies unchanged with $k = N$.
  A first slab has no preceding member in its parity family.
    We therefore need its moment only conditional on $X$, without fixing the central permutations.
    For a height $t$ in this slab expose the bit-one map as in (11).
    In each good bit-zero central block, realize its uniform permutation as $F U$,
    where $U$ is an independent uniform permutation and $F$ is an independent fresh size-$S$ butterfly.
    This has the original uniform law. Condition on $U$, but leave $F$ fresh.
    In a bad block take $U$ to be identity; the original central map there is identity.
    In a comparison experiment insert a fresh $F$ in that block too,
    keeping all good-block maps and all later switches the same.
  Here is why this insertion costs at most $b S$ cycles. Let $B$ be the union of the bad block inputs in the
    fresh-map coordinates. The original and comparison maps agree on every input outside $B$.
    After any fixed premap $U$, the affected domain is $U^(- 1) B$, still of size at most $b S$;
    a fixed postmap does not enlarge that domain. Every cycle of the original relative permutation disjoint from
    $U^(- 1) B$ retains all its arrows and is therefore a cycle of the comparison permutation.
    At most $b S$ disjoint cycles meet that domain. Thus, writing $Z'_t$ for the full comparison cycle count,
  $ Z_t lt.eq Z'_t + b S . $
  This comparison holds for every realization of the inserted switches;
    no cycle is selected for subsequent conditioning.
  In the comparison, the central butterflies and the ordinary output layers together form fresh parallel
    butterflies in coordinates $1 \, dots.h \, t - 1$, between fixed maps.
    Lemma 9 therefore bounds their cycle moment. With $q = 2^(2 a l)$, the same choice $J =
    ceil.l 2^(l \/ 16) ceil.r$ as before gives, after averaging the auxiliary maps,
  $ log bb(E) \[ q^(Z_t) divides X \] lt.eq C N 2^(- c_0 l) + b S log q wide \( l = L upright(" or ") 2 L \) . $
  Hölder within this first slab costs $O \( a l b S \)$ in addition to its decaying term.
    Integrate the later slabs backwards in each parity family using their lower-height conditioning,
    finish with this first-slab bound, and apply Cauchy–Schwarz between the families. The result is
  $ log bb(E) 2^(a sum_(t > L) Z_t) lt.eq C N 2^(- c_1 L) + C a L b S . $
  By Stirling, the logarithm of the normalization in square brackets in (10) is at most
    $O \( log N + N log S \/ S \) + b log \( S ! \)$. Given $xi > 0$,
    first take $L$ large enough that the terms $N 2^(- c_1 L)$ and $N log S \/
    S$ have sufficiently small coefficients. With that $L$ fixed, choose $epsilon.alt$ so that $b S \/ N lt.eq
    epsilon.alt$ controls both bad-block terms, and finally take $d$ large enough to absorb $O \( log N \)$.
    This proves the second claim in the stated order of choices. ◻
]

=== 4.3 Multiplicity amplification and the middle dimension range <multiplicity-amplification-and-the-middle-dimension-range>

We now use the branching multiplicity from (3): the ordered $k$-injection module contains $lambda tack.r
  N$ with multiplicity $m = f^(lambda \/ \( N - k \))$, and for $k = N$ this is $D_lambda$.
  The density bounds just proved will make truncation effective on these repeated copies.

For either symmetric kernel $Q$ above, retain an entry when its density is at most $z$.
  Markov’s inequality gives discarded row mass at most $M z^(- a)$, and symmetry gives the same column bound.
  The retained entries are at most $z \/ \( N \)_k$. Applying Lemma 7 with $B = z$ therefore gives,
  on an irreducible occurring with multiplicity $m > 0$,

#[#set math.equation(numbering: n => "(14)")
 $ parallel Q \( lambda \) parallel lt.eq M z^(- a) + sqrt(z \/ m) . $ <fac:e7>]

In particular if $log M lt.eq \( a \/ 4 \) log m$, take $z = sqrt(m)$ to get at most $2 m^(- a \/ 4)$.

First consider $j = N - lambda_1$ with $1 lt.eq j lt.eq delta N$,
  where a sufficiently small absolute $delta > 0$ will be used.
  Choose a fixed $u_0 > 0$ small enough that $eta \( 1 - u_0 \) > u_0$ and $u_0 < 1$, and take $k =
  ceil.l j \( N \/ j \)^(u_0) ceil.r$. For small $delta$ this gives $N - k gt.eq j$,
  so the skew tableau of shape $lambda \/ \( N - k \)$ has its remaining first row independent of the entire tail
  shape $rho = \( lambda_2 \, dots.h \)$. Consequently

$ m = binom(k, j) f^rho \, wide D_lambda lt.eq binom(N, j) f^rho . $

Thus $log m gt.eq u_0 j log \( N \/ j \) + log f^rho$, at least a fixed positive fraction of $log
  D_lambda$ (using the elementary binomial bounds). The first density bound proved above gives $log M lt.eq
  C' j \( j \/ N \)^(eta \( 1 - u_0 \) - u_0)$, hence at most $\( a \/ 4 \) log m$ by reducing $delta$.
  By (14), and $m$ tending uniformly to infinity here as $d arrow.r oo$,
  we have $parallel K_N \( lambda \) parallel lt.eq D_lambda^(- c_2)$ for some constant $c_2 > 0$.

By Lemma 2, shapes with more than $N \/ 2$ rows are annihilated by $T_N$ and hence by $K_N$.

All remaining shapes other than the trivial one and those already treated have $j gt.eq delta N$ and

$ log D_lambda gt.eq h N $

with $h > 0$ fixed, for large $N$. Here are details. Both first row and column are then bounded by
  $\( 1 - delta \) N$ (take $delta < 1 \/ 2$). If both are smaller than $N \/ 10$,
  hook lengths are at most $N \/ 5$ and the bound follows from Stirling.
  Otherwise transpose if necessary (which does not change dimension) so the row has length $s gt.eq N \/ 10$.
  Retain only it and a subdiagram of the tail of size $v = floor.l min \( delta \/ 2 \, 1 \/ 100 \) N floor.r$,
  which can be obtained by removing corners. All tableaux on this diagram have extensions.
  Fill its first $v$ positions in the top row first, then interleave the remaining row and a fixed tableau order
  on the tail; this gives $binom(s, v)$ possibilities, yielding the asserted exponential lower bound.

Take a fixed large $A_0$ so that when $log D_lambda gt.eq A_0 N$,
  the first density bound on all $N$ positions gives $log M lt.eq \( a \/ 4 \) log D_lambda$.
  Then (14) with $Q = K_N$ again gives $parallel K_N \( lambda \) parallel lt.eq
  D_lambda^(- c_3)$ for an absolute $c_3 > 0$, for large $N$.

The only remaining range is $h N lt.eq log D_lambda lt.eq A_0 N$.
  Here the full-deck moment cost $C N$ is comparable with the log dimension and need not fit the truncation
  threshold. We use the modified central networks to reduce that cost before invoking multiplicity.
  Choose $L$ fixed sufficiently large and then $epsilon.alt >
  0$ sufficiently small so the second of the two assertions about the $\( 1 + a \)$-moment above gives $log M
  lt.eq a h N \/ 4$ whenever $b lt.eq epsilon.alt N \/ S$, for large $N$.
  We justify the comparison in positive semidefinite order.
  Let $O$ be the product of the outer butterfly layers, and let $C$ be the parallel product of the central
  size-$S$ palindrome operators. Thus, on the representation under consideration,

$ K_N = O^(*) C O . $

By Lemma 3, each central positive contraction has norm at most a fixed $theta <
  1$ on every nontrivial irreducible of $S_S$; increase $theta$ to a number in $\( 0 \, 1 \)$ if necessary.

Restrict to $\( S_S \)^(N \/ S)$ and decompose into tensor-product irreducibles, with their multiplicity spaces.
  If a component is nontrivial on more than $epsilon.alt N \/ S$ blocks,
  the tensor product defining $C$ has norm at most $theta^(epsilon.alt N \/ S)$. This accounts for the first term below.

For $E subset.eq \[ N \/ S \]$, let $P_E$ act as identity in blocks in $E$ and as the projection to invariants in
  the other blocks. On a component whose nontrivial factors lie in a set $F$ with $\| F \| lt.eq
  epsilon.alt N \/ S$, $P_F$ is identity. Consequently $sum_(\| E \| lt.eq epsilon.alt N \/ S)
  P_E$ dominates identity on all these components and therefore dominates $C$ there. Its sandwich

$ Q_E = O^(*) P_E O $

is precisely the modified network with identity in $E$ and uniform central permutations elsewhere.
  Since $O$ is a contraction, these two component cases give

$ 0 lt.eq K_N \( lambda \) lt.eq theta^(epsilon.alt N \/ S) I +
  sum_(E : thin \| E \| lt.eq epsilon.alt N \/ S) Q_E \( lambda \) $

where $Q_E$ is exactly the modified palindrome with identity in $E$ and uniform central permutations elsewhere.
  Each summand by (14), $k = N$, is at most $2 D_lambda^(- a \/ 4)$ in norm.
  The log number of summands is at most
  $\( N \/ S \) \[ - epsilon.alt log epsilon.alt - \( 1 - epsilon.alt \) log \( 1 - epsilon.alt \) \]$ by the
  binomial theorem ($epsilon.alt < 1 \/ 2$), so we may require also that this be $lt.eq a h N \/ 8$.
  Since $h N lt.eq log D_lambda lt.eq A_0 N$ and all parameters now are fixed absolutely,
  this proves $parallel K_N \( lambda \) parallel lt.eq D_lambda^(- c_4)$ for some absolute $c_4 >
  0$ and sufficiently large $N$.

We have consequently, on every nontrivial shape not killed, $parallel T_N \( lambda \) parallel lt.eq
  D_lambda^(- c_(*))$ for an absolute $c_(*) > 0$. Plancherel on the finite group and Cauchy-Schwarz bound four
  times the squared total variation distance after $r$ butterflies by

$ sum_(lambda eq.not \( N \)) D_lambda thin parallel T_N \( lambda \)^r parallel_(upright("HS"))^2 \, $

independently of initial permutation by translation. For $r$ forward sweeps,

$ parallel T_N \( lambda \)^r parallel_(upright("HS"))^2 lt.eq
  D_lambda parallel T_N \( lambda \)^r parallel_(upright("op"))^2 lt.eq
  D_lambda parallel T_N \( lambda \) parallel_(upright("op"))^(2 r) . $

Thus, keeping only shapes not killed, the sum is at most $sum D_lambda^(2 - 2 r c_(*))$.

This last bound tends to zero for sufficiently large fixed $r$.
  Medium or larger dimensions with $log D_lambda gt.eq h N$ have at most $2^N$ terms (bound partitions by
  compositions). For the small-$j$ range, $D_lambda gt.eq binom(N - j, j)$:
  again fill $j$ positions of the first row first and then interleave tail and remaining row.
  There are at most $2^j$ shapes per $j$. Thus, with $s_(*) = 2 r c_(*) - 2 > 0$, this range contributes at most

$ sum_(1 lt.eq j lt.eq delta N) 2^j \( j \/ \( N - j \) \)^(s_(*) j) $

tending to zero (choose $s_(*)$ large for a geometric summable majorant and each fixed term vanishes).
  Increase $r$ also so that $s_(*) h > log 2$. Hence $r d$ steps suffice for the required threshold for all
  sufficiently large $d$.

== 5 Certificate tails and numerical dense bounds <sec:certificate>

The factorial proof is complete. This independent route keeps information that its central-block comparison does
  not: explicit bounds on the exponential density cost at fixed tracked-card densities.
  We first count fixed certificates for many short cycles, then estimate reciprocal cycle lengths and pass to all
  representation shapes. Here $n = 2^d$ is the full-deck size and $r$ is the number of tracked cards.
  Thus the exponent in (5) is used with $N = n$ and $k = r$.
  Logarithms in this section are to base two unless $ln$ is written.

=== 5.1 A fixed-certificate cycle tail <net:certificate>

#thm([Proposition 5.1.])[
  (High-height cycle tail).  #emph[There are absolute $b \, delta > 0$ and an integer $J_0 gt.eq 1$ such that,
    uniformly in the tracked input injection of size $r$ and for every integer $J gt.eq J_0$,
#[#set math.equation(numbering: n => "(15)")
 $ log_2 bb(E) 2^(b sum_(j gt.eq J) C_j) & lt.eq O \( r 2^(- b J) \) \,\
log_2 bb(E) 2^(b sum_j C_j) & lt.eq O \( r \( r \/ n \)^delta \) . $ <net:highmgf>]

 The first bound also holds with expectation conditional on all input-side switches and all output switches of
   heights at most $s$, for every integer $0 lt.eq s lt.eq d$ with $2 s < J$,
   uniformly in the fixed switch values and with the same absolute implied constant.]
] <net:hightail>

#proof[
  The estimates are immediate for $r = 0$, so assume $r gt.eq 1$.
    Let $cal(F)_t$ be the sigma-field generated by all input-side switches and the output switches of heights at
    most $t$. The arrivals at every node are determined by the input switches.
    At a height-$j$ node the two child maps determine its cycles;
    the outer output switch only exchanges the two positions in an output pair and does not change their pairing.
    Thus $C_j$ is $cal(F)_(j - 1)$-measurable.
  Fix a nonnegative integer $t$ with $2 t < j$ and condition on $cal(F)_t$.
    In each height-$j$ node expose one child’s remaining switches.
    In the other child the fixed low layers are followed by independent parallel output butterflies of height $j -
    1 - t$. Since $j - 1 - t gt.eq floor.l j \/ 2 floor.r$, at least $m = floor.l j \/ 2 floor.r -
    1$ final output layers remain fresh. This includes $t = \( j - 1 \) \/ 2$ when $j$ is odd.
    The two child bijections identify alternating cycles with cycles of their relative permutation.
    Explore such a cycle through the fresh child and back through the known inverse of the other.
    Its closing target is specified, and the closing route through its remaining butterfly is unique.
  Suppose $C_j gt.eq s gt.eq r 2^(- eta j)$, where $eta > 0$ is a sufficiently small absolute constant.
    At least $s \/ 2$ of some $s$ counted cycles have length at most $2 r \/ s$.
    Among these choose $u = max \( 1 \, floor.l s \/ 100 floor.r \)$ cycles uniformly without replacement and
    choose a uniform cyclic start on each. A fresh-layer switch of a closing path meets at most one path of
    another cycle. The conditional chance of selecting that other short cycle is at most
    $\( u - 1 \) \/ \( s \/ 2 - 1 \)$, less than $1 \/ 49$ when $u > 1$, and zero when $u = 1$.
    Here we bound interference against all other selected cycles,
    including those later in the canonical exploration order;
    restricting to already explored cycles only decreases it.
    Thus mean cross-cycle interference on a closing path is less than $j \/ 30$.
    Within its own cycle, Lemma 8 bounds the mean number of earlier encountered switches by $log_2 \( 2 r \/ s \)
    lt.eq 1 + eta j$. For large $j$, the expected total previously exposed switches on all closing paths is less
    than $u j \/ 4$.
  Consequently each realized network in this event admits a certificate of starts and lengths with at most $u j \/
    4$ previously exposed closing switches. This is an existence assertion before taking a union bound;
    we do not condition the coin law on the chosen favorable cycles. There are at most
  $ binom(r, u) \( 2 r \/ s \)^u $
  fixed certificates. Order their starts canonically and explore each fixed certificate in that order.
    Define its success event to require that all prescribed cycles close and that at least $K =
    ceil.l u \( j \/ 4 - 2 \) ceil.r$ closing queries are fresh.
    The preceding low-interference existence argument supplies a certificate in this event for every network being
    counted. At every fresh closing query its required bit is already determined,
    so the query succeeds with conditional probability $1 \/ 2$, irrespective of intervening nonclosing queries.
    Abort if a closing bit fails or the certificate becomes invalid,
    and stop on the $K$th successful fresh closing query. The probability of reaching this stopping threshold
    without failure is at most $2^(- K) lt.eq 2^(- u \( j \/ 4 - 2 \))$.
    This bounds the stated success event even when unsuccessful explorations make fewer than $K$ fresh queries.
    The base-two logarithm of the certificate count is at most
  $ u { log_2 \( 200 e r \/ s \) + log_2 \( 2 r \/ s \) } lt.eq u \( O \( 1 \) + 2 eta j \) . $
  Since $u gt.eq s \/ 200$, reducing $eta$ gives $bb(P) \( C_j gt.eq s divides cal(F)_t \) lt.eq 2^(- c j s)$,
    uniformly in the conditioning whenever $2 t < j$.
  Split the moment tail at $r 2^(- eta j)$. The deterministic part costs $O \( j r 2^(- eta j) \)$ and the
    remaining geometric tail is summable at any sufficiently small fixed exponent.
    Decreasing that exponent gives absolute $b' \, A > 0$ and $J_0$ such that, for every $j gt.eq J_0$ and $2 t < j$,
  #[#set math.equation(numbering: n => "(16)")
   $ log_2 bb(E) #scale(x: 120%, y: 120%)[\[] 2^(b' j C_j) divides cal(F)_t #scale(x: 120%, y: 120%)[\]] lt.eq
     A r 2^(- b' j) . $ <net:single-height-conditional>]
  We retain the conditioning while summing over heights. Fix integers $J gt.eq J_0$ and $0 lt.eq s lt.eq
    d$ with $2 s < J$. If $J > d$, the sum is empty. Otherwise put $L_q = 2^q J$ and, for each $q gt.eq
    0$ with $L_q lt.eq d$, define
  $ I_q = { L_q \, dots.h \, min \( 2 L_q - 1 \, d \) } \, wide B_q = sum_(j in I_q) C_j \,\
ell_q = \| I_q \| \, wide t_q = ⌊frac(L_q - 1, 2)⌋ . $
  These bands partition the integer heights from $J$ to $d$.
    We have $s lt.eq t_q$, $2 t_q < L_q$, and $ell_q lt.eq L_q$. Choose $0 < b lt.eq b' \/ 2$.
    Conditional Hölder within a band and $2 b ell_q lt.eq b' j$ for every $j in I_q$ give
  $ log_2 bb(E) #scale(x: 120%, y: 120%)[\[] 2^(2 b B_q) divides cal(F)_(t_q) #scale(x: 120%, y: 120%)[\]] & lt.eq
    1 / ell_q sum_(j in I_q) log_2 bb(E) #scale(x: 120%, y: 120%)[\[] 2^(2 b ell_q C_j) divides cal(F)_(t_q)
    #scale(x: 120%, y: 120%)[\]]\
 & lt.eq frac(A r, ell_q) sum_(j in I_q) 2^(- b' j) lt.eq A r 2^(- b' L_q) . $
  Split the band indices into their two parity classes, and let $V_q =
    sum_(p < q \, med p equiv q med \( 2 \)) B_p$. For $q gt.eq 2$,
    every earlier band in the same class ends at or below $L_q \/ 2 - 1 lt.eq t_q$.
    Since $C_j$ is $cal(F)_(j - 1)$-measurable, $V_q$ is $cal(F)_(t_q)$-measurable; for $q = 0 \, 1$ it is zero.
    Also $cal(F)_s subset.eq cal(F)_(t_q)$ for every band. The conditional tower step is therefore
  $ bb(E) #scale(x: 120%, y: 120%)[\[] 2^(2 b \( V_q + B_q \)) divides cal(F)_s #scale(x: 120%, y: 120%)[\]] & =
    bb(E)
    [2^(2 b V_q) bb(E) #scale(x: 120%, y: 120%)[\[] 2^(2 b B_q) divides cal(F)_(t_q) #scale(x: 120%, y: 120%)[\]]
    thin mid(bar.v) thin cal(F)_s]\
 & lt.eq 2^(A r 2^(- b' L_q)) bb(E) #scale(x: 120%, y: 120%)[\[] 2^(2 b V_q) divides cal(F)_s
   #scale(x: 120%, y: 120%)[\]] . $
  Integrating the highest band first and then descending gives, for $epsilon in { 0 \, 1 }$,
  $ bb(E) [2^(2 b sum_(q equiv epsilon med \( 2 \)) B_q) thin mid(bar.v) thin cal(F)_s] lt.eq
    2^(A r sum_(q equiv epsilon med \( 2 \)) 2^(- b' L_q)) . $
  All band sums here are finite. Conditional Cauchy–Schwarz between the two classes now yields
  $ log_2 bb(E) [2^(b sum_(j gt.eq J) C_j) thin mid(bar.v) thin cal(F)_s] lt.eq
    frac(A r, 2) sum_(q gt.eq 0) 2^(- b' 2^q J) lt.eq A' r 2^(- b J) $
  with an absolute $A'$. This proves the asserted conditional bound; averaging it proves (15).
    No independence between different heights or bands has been assumed.
  For (15), put $rho = r \/ n$ and take $J = floor.l .1 log_2 \( 1 \/ rho \) floor.r$,
    or a fixed sufficiently large minimum. Below this height dominate cycles by shared input pairs.
    A law on occupancy bits is called strongly Rayleigh if its multiaffine generating polynomial has no zero when
    all variables have positive imaginary part. The deterministic occupancy law has a monomial generating
    polynomial. Fair transpositions preserve this property, and strongly Rayleigh laws are negatively associated:
    products of increasing functions on disjoint supports have expectation at most the product of their
    expectations #cite(label("BorceaBrandenLiggett2009")) Theorems 4.9 and 4.20.
    This is a fixed input-layer process, with no additional path conditioning.
    Indicators that both sites in a disjoint pair are marked are increasing functions on disjoint supports and
    inherit negative association. Their exponential moment is bounded by the product of the Bernoulli moments.
    A site’s marginal before height $j$ is at most $2^j rho$,
    and the two pre-switch input groups are independent because that coordinate has not yet been used.
    The expected number of shared pairs is therefore at most $r 2^j rho$.
    Hölder over the low heights introduces an exponent $O \( J \)$; decreasing the fixed $b$ if necessary,
    its cost is a positive power of $rho$ times $r$.
  The low-height dominating factor depends only on the input switches.
    Conditioning on $cal(F)_0$, pull that factor outside the expectation and apply the uniform conditional
    high-height bound just proved with $s = 0$. Averaging over the input switches combines the two costs and
    gives (15) for some absolute $delta > 0$. This final estimate uses the input randomness.
    If $rho$ is bounded below, the fixed low heights cost $O \( r \)$,
    which is consistent with (15) after changing the constant. ◻
]

=== 5.2 Dense tuple densities <net:dense>

The sparse moment estimate alone does not provide a useful exponent at fixed density.
  Here a bound on reciprocal cycle lengths gives a smaller explicit density exponent. Define

$ h_j = max {bb(E) \( 1 \/ L \) : L in bb(Z)_(gt.eq 1) \, med bb(P) \( L = l \) lt.eq l \/ 2^(j - 1)} \, $

and

$ H \( rho \) = max {1 / 2 sum_(j gt.eq 1) h_j x_j : 0 lt.eq x_j lt.eq 1 \, med sum_(j gt.eq 1) 2^(- j) x_j lt.eq
  rho} . $

#thm([Proposition 5.2.])[
  (Dense truncation).  #emph[For every $rho_0 in \( 0 \, 1 \]$ and $epsilon.alt > 0$,
    there are $c > 0$ and $n_0$ such that, for every dyadic $n gt.eq n_0$ and every integer $r$ with $rho =
    r \/ n in \[ rho_0 \, 1 \]$, the density exponent (5) exceeds
$ r [H \( rho \) + frac(- rho - \( 1 - rho \) ln \( 1 - rho \), rho ln 2) + epsilon.alt] $

 with probability at most $exp \( - c r \)$, uniformly in the input injection.
   The constants depend only on $rho_0 \, epsilon.alt$, and the expression is interpreted continuously at $rho = 1$.]
] <net:densetruncation>

#proof[
  We first estimate the reciprocal length of a cycle in the relative permutation of the two children at a
    height-$j$ node. Put $M = 2^(j - 1)$. Fix one child’s map and the other child’s input-side map,
    leaving its final output butterfly fresh. Start at a uniform boundary column.
    For a proposed cycle length $l$, expose the first $l - 1$ edges.
    The closing route is unique if compatible, and if $v$ of its switches have already been exposed,
    its conditional closing probability is $2^v \/ M$. Hence
  $ bb(E) \[ upright(bold(1))_({ L = l }) 2^(- v) \] lt.eq M^(- 1) . $
  For a fixed realized cycle, rotating its start makes the closing path uniform among its $l$ paths.
    Lemma 8 bounds their shared switches by $l log_2 l \/ 2$, so the mean of $v$ over starts is at most $log_2 l$.
    Jensen’s inequality gives a mean weight at least $1 \/ l$.
    Averaging over configurations proves $bb(P) \( L = l \) lt.eq l \/ M$ for the uniform start.
  Now average all the child-interior randomness. Each child law is invariant under conjugation by an XOR
    translation of its boundary columns. The relative permutation has the same invariance,
    and these translations act transitively. Therefore, for every specified column $i$,
    its cycle length $L_i$ satisfies $bb(E) \( 1 \/ L_i \) lt.eq h_j$.
    This assertion uses the unconditioned child interiors; it is not asserted after the maps fixed in the
    preceding exploration have been revealed.
  Let $D_v$ be the set of shared input columns at a height-$j$ node $v$:
    both positions of such a column carry tracked cards. Write $L_(v \, i)$ for the full cycle length at that node
    and set
  $ S_j = sum_(v : thin "height" \( v \) = j) \| D_v \| \, wide Z_v = sum_(i in D_v) 1 / L_(v \, i) \, wide Y_j =
    sum_(v : thin "height" \( v \) = j) Z_v . $
  A tracked cycle uses every column of one full relative-permutation cycle.
    It contributes one to $Y_j$; cycles only partly contained in $D_v$ add nonnegative terms.
    Thus $C_j lt.eq Y_j$. Let $cal(A)_j$ record the arrivals at this height and the boundary input switches of its
    nodes. These data depend only on coins outside the child interiors. The reciprocal-length estimate therefore gives
  #[#set math.equation(numbering: n => "(17)")
   $ C_j lt.eq Y_j \, wide bb(E) \( Y_j divides cal(A)_j \) lt.eq h_j S_j . $ <net:dense-conditional-mean>]
  The means of the shared counts satisfy the budget defining $H$.
    Use the coordinate convention of Section 4, so the input sweep visits $d \, dots.h \, 1$.
    Let $A_j$ count unordered pairs of tracked original inputs that agree in coordinates $1 \, dots.h \, j -
    1$ and differ in coordinate $j$. The least differing coordinate assigns every pair to exactly one $A_j$.
    Before direction $j$, the two paths remain in different subcubes,
    so their already updated coordinates are independent uniforms.
    They meet at direction $j$ with probability $2^(- \( d - j \))$. Consequently, with $x_j = 2 bb(E) S_j \/ r$,
  $ bb(E) S_j = A_j 2^(- \( d - j \)) \, wide 0 lt.eq x_j lt.eq 1 \, wide sum_j 2^(- j) x_j =
    frac(2 sum_j A_j, r n) = frac(r - 1, n) lt.eq rho . $
  Here $S_j lt.eq r \/ 2$ gives $x_j lt.eq 1$. Taking expectations in (17) now yields $sum_j h_j bb(E) S_j lt.eq
    r H \( rho \)$.
  We next turn this mean bound into a tail bound, without conditioning several heights simultaneously.
    Fix a large height cutoff $J$. At each $j lt.eq J$, the disjoint-pair occupancy indicators are negatively
    associated by the fixed-input-layer argument above. Their sum $S_j$, whose mean is at most $r \/ 2$,
    has the Bernoulli-product upper exponential moment. For every fixed $t > 0$, Chernoff’s bound therefore gives
  $ bb(P) { S_j > bb(E) S_j + t r } lt.eq e^(- c_t r) . $
  Conditional on $cal(A)_j$, the variables $Z_v$ in different nodes are independent, and $0 lt.eq Z_v lt.eq
    2^(j - 1)$. There are $n \/ 2^j$ such nodes. Hoeffding’s inequality and (17) give
  $ bb(P) { Y_j > h_j S_j + t r divides cal(A)_j } lt.eq exp { - c t^2 r^2 \/ \( n 2^j \) } lt.eq exp { -
    c t^2 rho_0 r \/ 2^j } . $
  The second inequality uses $r \/ n gt.eq rho_0$. A union bound over the fixed set $j lt.eq J$,
    taking $t$ small in terms of $J \, epsilon.alt$, controls their total excess over $sum_(j lt.eq J) h_j bb(E)
    S_j$. By (15), choosing $J$ large enough in terms of $epsilon.alt$ controls $sum_(j > J)
    C_j$ at the remaining additive slack with probability $e^(- c_epsilon.alt r)$.
    Neither this choice nor the low-height constants depend on the individual density $rho in \[ rho_0 \, 1 \]$.
    Enlarging $n_0$ absorbs the finite union factor and shows that $sum_j C_j$ exceeds $r H \( rho \) +
    epsilon.alt r \/ 2$ with probability at most $e^(- c r)$.
  Finally Stirling’s formula, with $0 ! = 1$ at the endpoint, gives
  $ log_2 \( \( n \)_r \/ n^r \) = r frac(- rho - \( 1 - rho \) ln \( 1 - rho \), rho ln 2) + O \( log n \) . $
  The error is uniform for $1 lt.eq r lt.eq n$. Since $r gt.eq rho_0 n$,
    it is at most $epsilon.alt r \/ 2$ for $n gt.eq n_0 \( rho_0 \, epsilon.alt \)$.
    Adding this deterministic normalization proves the proposition. ◻
]

The defining linear optimization fills the shortest allowed cycle lengths first.
  With $M = 2^(j - 1)$ and $q \( q + 1 \) lt.eq 2 M < \( q + 1 \) \( q + 2 \)$,

#[#set math.equation(numbering: n => "(18)")
 $ h_j = q / M + frac(1 - q \( q + 1 \) \/ \( 2 M \), q + 1) \, wide h_j lt.eq sqrt(2 \/ M) . $ <net:hj>]

The allocation ratios $2^(j - 1) h_j$ increase with $j$. Indeed $M h \( M \)$ is the maximum of $sum_l z_l \/
  l$ subject to $0 lt.eq z_l lt.eq l$ and $sum_l z_l = M$; increasing $M$ permits adding positive-valued mass.
  Thus the budget for $H$ is assigned at the highest indices first, with at most one partially filled index.

Here are explicit arithmetic bounds, with enough detail to reproduce the finite check.
  Formula (18) simplifies to $h_j = q \/ \( 2 M \) + 1 \/ \( q + 1 \)$.
  The inequality $h_j lt.eq sqrt(2 \/ M)$ follows by putting $x = 2 M$:
  the convex quadratic $\( q + x \/ \( q + 1 \) \)^2 - 4 x$ is nonpositive at the two endpoints $q \( q + 1 \)$
  and $\( q + 1 \) \( q + 2 \)$, hence throughout the interval. Therefore

$ 1 / 2 sum_(j > 20) h_j lt.eq frac(1 + sqrt(2), 1024) < frac(169, 70 dot.op 1024) \, wide sum_(j > 20) 2^(- j) =
  2^(- 20) . $

Subtract this last budget, allocate the first twenty levels greedily, and add the rational value bound.
  Exact rational arithmetic gives

$ H \( 1 \/ 8 \) < .791402 \, wide H \( 13 \/ 50 \) < 1.098069 \, wide H \( 1 \) < 1.958069 . $

These imply the stated useful bounds $.80$, $1.11$ and $1.97$. For the logarithms in the entropy correction, use

$ - ln \( 1 - x \) lt.eq sum_(i = 1)^80 x^i / i + frac(x^81, 81 \( 1 - x \)) \, wide ln 2 =
  2 sum_(j = 0)^39 frac(\( 1 \/ 3 \)^(2 j + 1), 2 j + 1) + R \, quad 0 < R lt.eq
  frac(2 \( 1 \/ 3 \)^81, 81 \( 1 - 1 \/ 9 \)) . $

The entropy numerator is negative, so increasing its positive denominator gives an upper bound.
  The resulting rational comparisons give a full bracket below $.904054$ at $rho =
  7 \/ 25$ and below $.515374$ at $rho = 1$. In particular they imply the margins $.96$ and $.54$ used below.

These endpoint checks cover every $0 < rho lt.eq 7 \/ 25$.
  For $rho lt.eq 1 \/ 8$, the entropy correction is nonpositive and $H \( rho \) lt.eq H \( 1 \/ 8 \) < .80$.
  On $\[ 1 \/ 8 \, 1 \/ 4 \]$ and $\[ 1 \/ 4 \, 7 \/ 25 \]$,
  the slopes of $H$ are respectively $7 \/ 3$ and $3 \/ 2$. The absolute derivative of the entropy correction is

$ frac(- rho - ln \( 1 - rho \), rho^2 ln 2) lt.eq frac(1, 2 \( 1 - rho \) ln 2) < 25 / 24 \, $

using its series, $rho lt.eq 7 \/ 25$ and $ln 2 > 2 \/ 3$. Thus the bracket increases on both intervals.
  The accompanying script #raw("support/network_bounds.py") checks exactly these five rational inequalities;
  it does not test the probabilistic or asymptotic arguments.

=== 5.3 From truncation to all representations <net:completion>

#thm([Theorem 5.3.])[
  (Certificate-network contraction).  #emph[There is an absolute $c >
    0$ such that for every sufficiently large dyadic $n$ and every nontrivial irreducible of dimension $D$ not
    annihilated by a pair layer,
$ parallel T_n \( lambda \) parallel_(upright("op")) lt.eq D^(- c) . $

 Consequently a fixed absolute number of sweeps has total-variation distance tending to zero.]
] <net:main>

#proof[
  Write $k = n - lambda_1$ and $mu = macron(lambda)$. For $k lt.eq .14 n$ and $k lt.eq r lt.eq n - k$,
    (3) gives $m = binom(r, k) f^mu$ and $D lt.eq binom(n, k) f^mu$. If $k \/ n$ is bounded below, take $r = 2 k$.
    Proposition 12 applies uniformly over this density interval. Then $log_2 m gt.eq r - o \( r \) + log_2 f^mu$.
    The dense cutoff with slack $.01$ is at most $.97 r$ and loses exponentially small mass,
    so Lemma 7 gives a fixed exponential saving when $log f^mu = O \( r \)$.
    If $log f^mu$ is larger than a sufficiently large fixed multiple of $r$, use instead the cutoff $L = 1 /
    2 log_2 m$. Markov’s inequality and (15) give $p lt.eq 2^(O \( r \) - b L)$,
    which is a fixed inverse power of $m$. These alternatives give a fixed inverse power of $D$.
  If $k \/ n$ is small, fix $0 < gamma < delta \/ \( 1 + delta \)$ and take $r =
    floor.l k \( n \/ k \)^gamma floor.r$. Then $r \( r \/ n \)^delta = O \( k \)$, whereas
  $ log m gt.eq c_gamma k log \( n \/ k \) + log f^mu . $
  Choose the fixed density cutoff sufficiently small. At $L = 1 / 2 log_2 m$,
    Markov’s inequality gives discarded mass $exp \( O \( k \) \) m^(- b \/ 2)$, an inverse power of $m$.
    The retained bound is $m^(- 1 \/ 4)$. Again $log m$ is a fixed positive fraction of $log D$.
  For the remaining shapes use all $n$ cards, whose multiplicity is $D$.
    Lemma 2 removes first columns longer than $n \/ 2$. Every other remaining shape has first row at most $.86 n$.
    Let $a$ be the larger of its first row and column, transposing for the dimension estimate if necessary.
    If $.14 n lt.eq a lt.eq .86 n$, the first-row hook inflation over $a !$ is
    $exp \( O \( \( n \/ a \) log n \) \) = exp \( o \( n \) \)$.
    To verify this, for columns $j lt.eq a \/ 2$ sum $lambda'_j - 1$ and divide by $a \/ 2$;
    for later columns use $lambda'_j lt.eq n \/ j lt.eq 2 n \/ a$ and the harmonic sum of $1 \/ \( a - j + 1 \)$.
    The remaining hook product is the hook product of the tail, whose tableau dimension is at least one. Hence
  $ D gt.eq binom(n, a) exp \( - o \( n \) \) \, wide log_2 D gt.eq \( .58 - o \( 1 \) \) n \, $
  since $H_2 \( .14 \) > .58$. If $a < .14 n$, the mean hook length is at most $a$:
    indeed the sum of hooks is $1 / 2 \( sum_i lambda_i^2 + sum_j \( lambda'_j \)^2 \) lt.eq a n$.
    Arithmetic–geometric mean and Stirling give a stronger bound.
    The full-density cutoff below $.54 n$, with small slack, therefore beats the multiplicity exponentially.
    If $log D$ is larger than a sufficiently large fixed multiple of $n$, switch to $L = 1 /
    2 log_2 D$ and (15) as before. This proves the stated power bound for $K_n$ and, after taking square roots,
    for $T_n$.
  For a sufficiently large fixed integer $r$, Plancherel and $parallel T_n \( lambda \)^r
    parallel_(upright("HS"))^2 lt.eq D parallel T_n \( lambda \)
    parallel_(upright("op"))^(2 r)$ bound the squared relative $L^2$ distance by
    $sum_(lambda eq.not \( n \) \, \( 1^n \)) D^(2 - 2 r c)$.
    Choose $r$ so the exponent is at most $- 1$ and apply Lemma 6.
    Alternatively, in the range $k lt.eq .14 n$, the more precise hook estimate (4) bounds the same sum directly
    level by level. Lemma 4 gives the matching lower order in physical time. ◻
]

== 6 Exponential smoothing for every partial deck <n:strong-providers>

We now extract two reusable consequences of an exponential density cost per tracked card:
  a pointwise bound after a fixed number of compositions, and a contraction factor involving the dimension of the
  diagram below the first row. The density input already follows from Theorem 1, since $\( l \/ N \)^eta lt.eq 1$;
  renaming coordinates covers every order and both positive orientations.
  Here we give an independent proof by encoding cycle closures through the switch bits they force.
  The proof applies uniformly from the empty tuple to the full deck and makes no representation estimate until the
  final lower-diagram transfer.

Let $N = 2^d$, with $d gt.eq 0$, and let $T_N$ be one sweep of independent fair switches in any fixed order of the
  $d$ distinct cube coordinates. Permutations map input positions to output positions,
  and products act from right to left. The inverse-permutation law is denoted by $T_N^(*)$. Thus

$ H_N in { T_N^(*) T_N \, T_N T_N^(*) } $

is a forward sweep followed by its reversed coordinate order, with fresh coins in both halves;
  the choice of the first order distinguishes the two displayed orientations. On

$ cal(X)_(N \, l) = { \( x_1 \, dots.h \, x_l \) : x_i in { 0 \, 1 }^d \, med
  x_i eq.not x_j med \( i eq.not j \) } \, wide 0 lt.eq l lt.eq N \, $

write $H_N \( x \, y \)$ for the transition probability, and $u_(N \, l)$ for uniform measure on this set.
  Put $\( N \)_l = N ! \/ \( N - l \) !$, with $\( N \)_0 = 1$. The empty tuple has transition probability one.

#thm([Theorem 6.1.])[
  (Strong density bound in both orientations).  #emph[There are absolute constants $p in \( 1 \, 2 \]$ and $C <
    oo$ such that, for every $N = 2^d$, every coordinate order, every $0 lt.eq l lt.eq N$, either choice of $H_N$,
    and every $x in cal(X)_(N \, l)$,
#[#set math.equation(numbering: n => "(19)")
 $ frac(1, \( N \)_l) sum_(y in cal(X)_(N \, l)) #scale(x: 120%, y: 120%)[\(] \( N \)_l H_N \( x \, y \)
   #scale(x: 120%, y: 120%)[\)]^p lt.eq e^(C l) . $ <n:strong-injection-density>]

 After increasing $C$, the same constants give
#[#set math.equation(numbering: n => "(20)")
 $ N^(- l) sum_(y in { 0 \, 1 }^(d l)) #scale(x: 120%, y: 120%)[\(] N^l H_N \( x \, y \)
   #scale(x: 120%, y: 120%)[\)]^p lt.eq e^(C l) \, $ <n:strong-density-power-normalization>]

 where the kernel is extended by zero on tuples with repeated positions.
   Both conclusions hold with rows replaced by columns.]
] <n:strong-density>

We prove the injection-density bound first. The power normalization will follow by an explicit falling-factorial
  comparison. The central counting estimate permits fixed permutations before and after the fresh layers;
  this is what allows it to be used after conditioning on the other parts of the network.

=== 6.1 Encoding cycles by omitted switch bits <n:cycle-encoding>

We need a counting observation on cycles. Let $m$ be a cube size, $D$ a fixed set of at most $k$ positions in it,
  and $pi$ the permutation obtained using any fixed pre-permutation,
  fair switch layers in $L$ distinct coordinates, and any fixed post-permutation.
  If $Y$ is the number of cycles of $pi$ contained entirely in $D$, there are absolute $c \,
  gamma > 0$ and $L_0$ such that

#[#set math.equation(numbering: n => "(21)")
 $ Pr \( Y gt.eq t \) lt.eq 2^(- c L t) wide #scale(x: 120%, y: 120%)[\(] L gt.eq L_0 \, med
   t upright(" integer") gt.eq max \( 1 \, k 2^(- gamma L) \) #scale(x: 120%, y: 120%)[\)] . $ <n:encoded-cycle-tail>]

The contact estimate of Lemma 8 applies after relabeling inputs by the fixed pre-permutation.
  If the $L$ coordinates do not fill the whole cube, apply it separately in each $L$-coordinate block:
  $sum_i w_i log_2 w_i lt.eq w log_2 w$ shows that any $w$ selected paths still share at most $w log_2 w \/
  2$ switches in total.

We prove (21) with $gamma = 1 \/ 1000$ and $L_0 = 256$. The event is empty if $t > k$.
  Otherwise, when $Y gt.eq t$, at least $t \/ 2$ of its cycles have length at most $2 k \/ t$.
  Select $s = max \( 1 \, floor.l t \/ 2 floor.r \)$ of these cycles; in particular $s gt.eq t \/ 3$.
  We will encode their routes while omitting the fresh switch bits forced by closing a cycle.

First we find starts and an exploration order that omit many bits. Choose each start uniformly in its cycle.
  Independently give $D$ a uniform random priority order, and visit the selected cycles in the order of their
  starts, completing one cycle before the next. On a cycle of length $w$,
  the closing path is uniform among its $w$ paths. Its expected contacts with other paths of that cycle are at
  most $log_2 w$ by the contact estimate. At each of the $L$ layers,
  a contact outside that cycle can reveal at most one bit; conditional on the starts,
  the contacted selected cycle precedes it with probability $1 \/ 2$.
  Therefore the number $S$ of fresh switch bits on the closing paths satisfies

$ 0 lt.eq S lt.eq L s \, wide bb(E) S gt.eq L s \/ 2 - s log_2 \( 2 k \/ t \) gt.eq 0.4 L s . $

The last inequality uses $k \/ t lt.eq 2^(gamma L)$ and $L gt.eq 256$.
  It follows that $Pr { S gt.eq L s \/ 4 } gt.eq 1 \/ 5$. Thus at least one fifth of the priority orders admit
  some choices of starts saving $L s \/ 4$ bits. This is an existence statement for each coin configuration,
  before counting configurations under fixed priorities.

Fix a priority order. A code consists of the unordered set of $s$ starts, the cycle lengths in traversal order,
  and a finite bit string. The decoder keeps a table of already known switch bits.
  It traces nonclosing edges using the fixed pre- and post-permutations,
  reading a bit only at a previously unknown switch. On a closing edge, its input and required endpoint are known.
  A butterfly updating each coordinate at most once has at most one route between those endpoints;
  the decoder fills the unknown bits along that route with the forced values, rejecting inconsistencies.
  After completing the cycles, it reads all remaining unknown bits in a fixed order.
  Hence a valid code determines at most one full coin configuration.
  If $S gt.eq L s \/ 4$, its bit string has length at most $m L \/ 2 - L s \/ 4$.
  Counting all finite strings up to that length, including unequal lengths, gives at most

$ binom(k, s) \( 2 k \/ t \)^s thin 2^(m L \/ 2 - L s \/ 4 + 1) $

configurations for these fixed priorities.

Every configuration in the tail event has such a code for at least one fifth of all priority orders.
  Averaging the preceding count over priorities and dividing by the $2^(m L \/ 2)$ equiprobable coin
  configurations bounds the tail probability by

$ 5 thin 2^(1 + s { log_2 \( 6 e \) + 2 gamma L - L \/ 4 }) lt.eq 2^(- L t \/ 64) wide \( L gt.eq 256 \) . $

Here $log_2 binom(k, s) + s log_2 \( 2 k \/ t \) lt.eq s { log_2 \( 6 e \) + 2 gamma L }$ uses $s gt.eq t \/ 3$.
  This proves (21).

=== 6.2 There-and-back recursion on cube nodes <there-and-back-recursion-on-cube-nodes>

Now realize $H_N$ as there-and-back switches (using the pass order or its reverse first,
  according to which product is used), all with independent coins. It is a binary tree of cube nodes:
  each size $2 m$ node uses switches first across one axis, then gives two children (panels of $m$ positions,
  indexed by columns of the switch pairs) on which independent child there-and-back permutations act,
  then again switches on its original axis. Size one leaves do nothing.
  Call the first layers of switches over the tree its input layers, and second layers its output layers.

Within a node, write $R \( x \, y \)$ for the density of output placement at $y$ for $k$ distinguished cards
  starting at $x$, relative to uniform on such placements. Write $J \( x \, y \)$ for the density in an ideal
  experiment at the node, replacing the two child permutations by independent uniforms.
  We use at root or any node, for $p = 1 + theta > 1$, the inequality

#[#set math.equation(numbering: n => "(22)")
 $ bb(E)_(upright("unif")) R \( x \, y \)^p G \( y \) med lt.eq med
   bb(E)_(upright("true")) #scale(x: 180%, y: 180%)[\[] G \( y \) product_v J_v \( X_v \, Y_v \)^theta
   #scale(x: 180%, y: 180%)[\]] $ <n:ideal-recursion>]

for any nonnegative $G$. Left expectation is in $y$; right uses the actual switch experiment with this input $x$,
  taking $J_v$ at this and descendant nonleaf nodes with the placements of the distinguished cards passing through
  them (local inputs $X_v$ and outputs $Y_v$). Densities for empty placements are 1.
  To see (22), in the ideal node experiment take $x_i \, y_i$ the inputs into and outputs of children.
  Given final $y$ (when $J > 0$), the conditional expectation of the product of child true densities
  $R_i \( x_i \, y_i \)$ equals $R \( x \, y \) \/ J \( x \, y \)$,
  by the density change to the true experiment from ideal. And $R$ vanishes when $J$ does.
  Jensen thus bounds the left side by

$ bb(E)_(upright("ideal")) G \( y \) thin J \( x \, y \)^theta thin product_i R_i \( x_i \, y_i \)^p . $

Condition on this node’s outer switch layers (input and output),
  so $y_i$ in this formula are independent uniforms, and $y$ is a function of them and the outer choices.
  Apply (22) inductively at each child (against nonnegative functions of their outputs);
  this gives exactly the desired inequality. The size one case is immediate.

For $x \, y$ in the size $2 m$ node, let the multigraph on the $k$ cards have two matchings,
  given by sharing an input column or sharing an output column, of sizes $a \, b$ respectively.
  It consists of paths (possibly single vertices) and even cycles (possibly of length two);
  let $c_(*)$ be the number of cycles. Call coloring the cards by the two children allowed if opposite along
  matching edges. With $r$ the number in the first child, we have

#[#set math.equation(numbering: n => "(23)")
 $ J \( x \, y \) = \( 2 m \)_k 2^(a + b - 2 k) sum_(upright("allowed colors"))
   frac(1, \( m \)_r \( m \)_(k - r)) = 2^(c_(*)) bb(E) Z \( r \) \, wide Z \( r \) =
   frac(\( 2 m \)_k, 2^k \( m \)_r \( m \)_(k - r)) . $ <n:node-colors>]

Indeed realizing a given coloring from input costs $2^(a - k)$;
  given correct child output columns the final switches cost $2^(b - k)$;
  the child-permutation probabilities between columns are as in the sum,
  with columns distinct per color by the constraints. There are $2^(k - a - b + c_(*))$ allowed choices,
  taken equally in the last expectation.

Every allowed coloring is feasible: it puts at most one card of each color in each of the $m$ input columns and
  each output column. Each path or cycle component has two colorings.
  Even components contribute equally to the two colors; each odd path component contributes one independent sign
  to their difference.

The following bound holds uniformly:

#[#set math.equation(numbering: n => "(24)")
 $ bb(E) Z \( r \) lt.eq exp #scale(x: 120%, y: 120%)[\(] C k log \( 2 m \) \/ m #scale(x: 120%, y: 120%)[\)] .
   $ <n:color-imbalance>]

To prove it, put $z = 2 r - k$. Each odd-vertex path component contributes one independent uniform sign to $z$;
  let $q$ be their number. Clearly $q lt.eq k$. Making all odd components favor the same color is feasible,
  so $k + q lt.eq 2 m$ and hence $q lt.eq w := 2 m - k$ as well.
  At the balanced count $r_0 = ceil.l k \/ 2 ceil.r$, writing $k = 2 a$ or $2 a + 1$ gives

$ Z \( r_0 \) = product_(i = 0)^(a - 1) frac(2 m - 2 i - 1, 2 m - 2 i) lt.eq 1 . $

The cases $k = 0$, $q = 0$, or $w = 0$ are consequently immediate.

Suppose first that $1 lt.eq k lt.eq epsilon.alt m$, for a small absolute $epsilon.alt$. The factorial ratio

$ frac(Z \( r \), Z \( r_0 \)) =
  frac(\( m - r \) ! \( m - k + r \) !, floor.l w \/ 2 floor.r ! ceil.l w \/ 2 ceil.r !) $

is unchanged by replacing $z$ by $- z$. Moving $i$ steps from the balanced count multiplies successive factors of
  the form $1 + O \( \( i + 1 \) \/ m \)$. Thus it is at most $e^(C \( z^2 + 1 \) \/ m)$.
  Since $z$ is a sum of at most $k$ fair signs, $Pr { z^2 gt.eq v } lt.eq 2 e^(- v \/ \( 2 k \))$, and for $m > 2 C k$,

$ bb(E) e^(C z^2 \/ m) lt.eq 1 + frac(4 C k, m - 2 C k) . $

Choosing $epsilon.alt$ small makes $bb(E) Z \( r \) lt.eq e^(C' k \/ m)$, which implies (24) in this range.

For $k > epsilon.alt m$ and $w > 0$, Stirling’s formula gives the uniform bound

$ frac(Z \( r \), Z \( r_0 \)) =
  frac(\( \( w - z \) \/ 2 \) ! \( \( w + z \) \/ 2 \) !, floor.l w \/ 2 floor.r ! ceil.l w \/ 2 ceil.r !) lt.eq
  e^(O \( log \( 2 m \) \) + w I \( z \/ w \)) \, $

where $I \( x \) = \( \( 1 - x \) log \( 1 - x \) + \( 1 + x \) log \( 1 + x \) \) \/
  2$ is extended continuously at the endpoints. The sign sum has point probabilities at most
  $e^(- q I \( z \/ q \))$. Convexity and $I \( 0 \) = 0$ give

$ I \( z \/ w \) lt.eq \( q \/ w \) I \( z \/ q \) wide \( 0 < q lt.eq w \) . $

The two exponential rate factors therefore cancel. Summing over at most $2 m +
  1$ possible values of $z$ leaves $e^(O \( log \( 2 m \) \))$,
  which is at most $e^(C k log \( 2 m \) \/ m)$ since $k > epsilon.alt m$.
  This completes the uniform imbalance estimate, including full occupancy.

=== 6.3 Summing cycle moments over scales <summing-cycle-moments-over-scales>

Apply (22) at root with $G = 1$ and $l$ distinguished cards.
  At each height $j gt.eq 1$ (nodes of size $2^j = 2 m$), distinguished counts $k_v$ at the nodes sum to $l$,
  so (24) costs only $e^(C l)$ over the tree for fixed $theta$.
  It remains to obtain, in the true $H_N$ runs, for some small absolute $theta > 0$

#[#set math.equation(numbering: n => "(25)")
 $ bb(E) 2^(theta sum_v c_v) lt.eq e^(C l) $ <n:all-cycle-moment>]

where $c_v$ is the cycle count $c_(*)$ of (23) for the placements there.

Indeed, the logarithm of the noncycle factor at height $j$ is at most $C l j \/ 2^j$,
  and $sum_(j gt.eq 1) j 2^(- j) < oo$. It is the cycle factor, rather than this deterministic imbalance factor,
  that requires the remaining multiscale argument.

Condition on all input layers, fixing the assignments and inputs throughout the tree.
  At a node, given $alpha \, beta$ the two child permutations on columns,
  $c_v$ is the number of cycles of $beta^(- 1) alpha$ entirely contained in the set $D_v$ of input columns with
  both entering positions marked (distinguished). To see this,
  in a cycle of the two matchings one uses both inputs of participating columns, one going through each child.
  Following this circuit, going through the output matching from the $alpha$-card at one such input column $i$,
  and then through the input matching, brings us to the $alpha$-card for column $beta^(- 1) alpha \( i \)$.
  Conversely a cycle of the comparison contained in $D_v$ traces such a circuit,
  irrespective of the outermost output switches there. In particular $c_v$ with inputs fixed depends just on
  smaller height output layers.

For $h = 1 \, 2 \, 4 \, dots.h$ group node heights $j$ in bands $h lt.eq j < 2 h$.
  For such $j$ consider conditioning on all inputs as above and also all output layers at heights $< h \/ 2$.
  For large $h$, $alpha$ in the above comparison has still its last $L =
  h \/ 2$ switch layers (distinct axes in this child) fresh.
  Indeed these output layers of a height $j - 1$ child use output coins at heights $j - L \, dots.h \, j - 1$;
  each layer runs over all the $m$ columns in that child. Even conditioning further on everything except these
  layers, (21) applies to the comparison and $D_v$, the latter of size at most $k_v$.
  Consequently for sufficiently small $theta > 0$,

#[#set math.equation(numbering: n => "(26)")
 $ bb(E) [2^(2 theta h c_v) divides upright("inputs") \, upright("outputs")_(< h \/ 2)] lt.eq
   exp \( C k_v h 2^(- gamma' h) \) $ <n:conditional-band-moment>]

for some absolute $gamma' > 0$; in the conditioning we mean layer coins.
  Indeed for positive counts at or above $k_v 2^(- gamma L)$,
  multiplication by $2^(2 theta h t)$ still gives geometric decay in $h t$ from (21),
  and for counts below threshold one bounds the moment by $2^(2 theta h k_v 2^(- gamma L))$.
  For $k_v gt.eq 1$ the additive exponentially small term fits as well by taking $gamma'$ small; $k_v =
  0$ is automatic. For bounded $h$, (26) holds by enlarging the constant since $c_v lt.eq k_v$.

Conditional on the indicated layers, nodes on a fixed level have independent $c_v$,
  using only their disjoint subtrees. So (26) also bounds the $2 theta
  h$ moment in this notation for the level sum, with $k_v$ replaced by $l$.
  Hölder over the at most $h$ levels in the band gives

$ bb(E)
  [2^(2 theta sum_(j upright(" in band")) sum_(v upright(" at ") j) c_v) divides upright("inputs") \,
  upright("outputs")_(< h \/ 2)] lt.eq exp \( C l h 2^(- gamma' h) \) . $

The next smaller band of the same parity of $log_2 h$ has heights $h \/ 4 lt.eq j < h \/ 2$.
  Its cycles depend only on output layers strictly below $h \/ 2$,
  so its exponential factor is measurable under the conditioning for the band starting at $h$.
  The tower property therefore permits integrating each parity from the largest band downwards.
  It bounds that parity’s $2 theta$ moment by

$ exp {C l sum_(h = 1 \, 2 \, 4 \, dots.h) h 2^(- gamma' h)} lt.eq e^(C' l) . $

Cauchy–Schwarz combines the two parities at exponent $theta$ and proves (25).
  Independence was used within a height, while the tower property handles the dependence across heights.

#proof[
  #emph[Completion of Theorem 14.] Inserting (23) and (24) into (22), then applying (25), gives (19) with $p = 1 +
    theta$. Decrease $theta$ if necessary so that $p lt.eq 2$.
    The proof applies to either order at the root and throughout its descendants,
    so it proves both orientations with the same absolute constants.
  To change normalization, put $s_l = \( N \)_l \/ N^l$. Then
  $ N^(- l) sum_y \( N^l H_N \( x \, y \) \)^p = s_l^(- \( p - 1 \)) frac(1, \( N \)_l)
    sum_y \( \( N \)_l H_N \( x \, y \) \)^p . $
  The decreasing list $log \( 1 - i \/ N \)$, $0 lt.eq i < N$, has mean $N^(- 1) log \( N ! \/ N^N \) gt.eq - 1$,
    since $N ! gt.eq \( N \/ e \)^N$. The mean of its first $l$ terms is no smaller, so $s_l gt.eq e^(- l)$.
    This proves (20) after an increase of $C$. Both positive products are self-adjoint, hence $H_N \( x \, y \) =
    H_N \( y \, x \)$; the column statements follow. The cases $l = 0$ and $N = 1$ are immediate. ◻
]

=== 6.4 A fixed number of compositions gives a pointwise bound <a-fixed-number-of-compositions-gives-a-pointwise-bound>

#thm([Corollary 6.2.])[
  (Strong pointwise smoothing).  #emph[There are an absolute integer $u gt.eq
    1$ and an absolute $C < oo$ such that, for every $N = 2^d$, every coordinate order, every $0 lt.eq l lt.eq N$,
    every $x \, y in cal(X)_(N \, l)$, and either $H_N = T_N^(*) T_N$ or $H_N = T_N T_N^(*)$,
#[#set math.equation(numbering: n => "(27)")
 $ H_N^u \( x \, y \) lt.eq frac(e^(C l), \( N \)_l) . $ <n:strong-smoothing-eq>]

 In particular, with unnormalized regular trace on $S_N$,
#[#set math.equation(numbering: n => "(28)")
 $ "Tr"_(upright("reg")) \| T_N \|^(2 u) lt.eq e^(C N) . $ <n:strong-regular-smoothing>]

]
] <n:strong-smoothing>

#proof[
  All function norms in this proof use the probability measure $u_(N \, l)$.
    Write $A = e^(C_0 l)$ for a common bound on the $L^p$ norms of the transition densities supplied by
    Theorem 14. The kernel formula and Minkowski’s inequality give $parallel H_N parallel_(1 arrow.r p) lt.eq A$.
    Self-adjointness gives $parallel H_N parallel_(p' arrow.r oo) lt.eq A$, where $p' = p \/ \( p - 1 \)$.
    As a Markov operator, $H_N$ has $oo$-to-$oo$ norm one. Riesz–Thorin interpolation consequently gives,
    for every $b gt.eq 1$,
  $ parallel H_N parallel_(b arrow.r p b) lt.eq A^(1 \/ b) . $
  Let $r$ be the least nonnegative integer with $p^r gt.eq p'$.
    Composing the bounds for $b = 1 \, p \, dots.h \, p^(r - 1)$ yields
  $ parallel H_N^r parallel_(1 arrow.r p^r) lt.eq A^(sum_(j = 0)^(r - 1) p^(- j)) . $
  Since the underlying measure is a probability measure, $parallel f parallel_(p') lt.eq
    parallel f parallel_(p^r)$. One further application of $H_N : p' arrow.r
    oo$ therefore proves $parallel H_N^(r + 1) parallel_(1 arrow.r oo) lt.eq e^(C l)$.
    Applying this to $\( N \)_l upright(bold(1))_({ x })$, whose $L^1$ norm is one, gives (27) with $u = r + 1$.
  For $l = N$, the injection module is the regular permutation module on $S_N$.
    Every diagonal entry of $\( T_N^(*) T_N \)^u$ is at most $e^(C N) \/ N !$,
    so its unnormalized trace is at most $e^(C N)$. Since $\| T_N \|^(2 u) = \( T_N^(*) T_N \)^u$, this is (28). ◻
]

=== 6.5 The lower-diagram dimension factor <the-lower-diagram-dimension-factor>

The density theorem also distinguishes permutations of the tracked labels. We now make that distinction explicit.
  This is useful when a bound involving only the number of boxes below the first row does not yet control the
  dimension of the lower diagram.

#thm([Proposition 6.3.])[
  (Strong tail-dimension bound).  #emph[There are absolute constants $a > 0$ and $C < oo$ such that,
    for every dyadic $N$, every coordinate order, and every partition $lambda = \( N - k \, beta \) tack.r N$,
    with $beta = \( lambda_2 \, lambda_3 \, dots.h \) tack.r k$,
#[#set math.equation(numbering: n => "(29)")
 $ parallel T_N \( lambda \) parallel_(upright("op"))^2 lt.eq e^(C k) D_beta^(- a) . $ <n:strong-tail-eq>]

 Here $D_beta = dim V_beta$, including $D_diameter = 1$. One may take $a =
   1 \/ p' = \( p - 1 \) \/ p$ for the exponent in Theorem 14.]
] <n:strong-tail>

#proof[
  The case $k = 0$ is immediate. On ordered $k$-tuples, permutations of the $k$ coordinate labels act on the right
    and commute with all position permutations. Choose an ordering $x_A$ of each unordered $k$-set $A$.
    The fiber over $A$ is then the regular representation of $S_k$.
    Since $H_N$ commutes with this right action, its block from one fiber to another acts by convolution.
    In the Fourier decomposition of one fiber, the $beta$ isotype is $V_beta ⊗ V_beta^(*)$,
    with the right action on the second factor. The block acts as $M_(A B) ⊗ I$; it acts on the first,
    multiplicity factor and may mix the copies of the right type.
    Up to inverse or transpose conventions that do not affect the norm, its multiplicity matrix is
  $ M_(A B) = sum_(pi in S_k) H_N \( x_A \, x_B pi \) rho_beta \( pi \) . $
  For unit vectors $v \, w in V_beta$, Schur orthogonality #cite(label("etingof")) Proposition 3.14(ii) and
    unitarity give
  $ frac(1, k !) sum_(pi in S_k) \| chevron.l v \, rho_beta \( pi \) w chevron.r \|^2 = D_beta^(- 1) \,
    wide \| chevron.l v \, rho_beta \( pi \) w chevron.r \| lt.eq 1 . $
  Because $p' gt.eq 2$, the normalized $L^(p')$ norm of this matrix coefficient is at most $D_beta^(- 1 \/ p')$.
    Hölder therefore gives
  #[#set math.equation(numbering: n => "(30)")
   $ parallel M_(A B) parallel_(upright("op")) lt.eq k ! N^(- k) D_beta^(- 1 \/ p') {frac(1, k !)
     sum_(pi in S_k) \( N^k H_N \( x_A \, x_B pi \) \)^p}^(1 \/ p) . $ <n:strong-slot-block>]
  To sum this estimate, put $w_0 = k ! N^(- k)$ and denote the braces to the power $1 \/ p$ by $F_(A B)$.
    There are $binom(N, k)$ fibers, so $sum_B w_0 = \( N \)_k \/ N^k lt.eq 1$. The density estimate gives
  $ sum_B w_0 F_(A B)^p = N^(- k) sum_(y in cal(X)_(N \, k)) \( N^k H_N \( x_A \, y \) \)^p lt.eq e^(C k) . $
  Weighted Hölder shows that every row sum of the scalar matrix $\( parallel M_(A B) parallel_(upright("op")) \)$
    is at most $e^(C k) D_beta^(- 1 \/ p')$. The same bound holds for column sums:
    self-adjointness and relabeling equivariance give
  $ H_N \( x_A \, x_B pi \) = H_N \( x_B \, x_A pi^(- 1) \) . $
  The Schur test now bounds the full operator on the right-$beta$ isotypic space by $e^(C k) D_beta^(- 1 \/ p')$.
    Explicitly, if $b_(A B) = parallel M_(A B) parallel_(upright("op"))$ and both scalar sums are at most $L$, then
  $ sum_A parallel sum_B M_(A B) v_B parallel^2 lt.eq sum_A #scale(x: 180%, y: 180%)[\(] sum_B b_(A B)
    #scale(x: 180%, y: 180%)[\)] sum_B b_(A B) parallel v_B parallel^2 lt.eq L^2 sum_B parallel v_B parallel^2 . $
  As a left $S_N$ module, this right-$beta$ isotypic space consists of $D_beta$ copies of
  $ "Ind"_(S_(N - k) times S_k)^(S_N) \( upright(bold(1)) ⊗ V_beta \) . $
  The skew diagram $lambda \/ beta$ is a horizontal strip of size $N - k$:
    its interlacing conditions are $lambda_i gt.eq beta_i gt.eq lambda_(i + 1)$, and here $beta_i =
    lambda_(i + 1)$. The horizontal Pieri rule therefore places $V_lambda$ in this induced module.
    The preceding operator bound applies to its $lambda$ block.
    Taking $H_N = T_N^(*) T_N$ and using $parallel H_N \( lambda \) parallel_(upright("op")) =
    parallel T_N \( lambda \) parallel_(upright("op"))^2$ proves the assertion.
    The other orientation gives the same singular-value conclusion. ◻
]

=== 6.6 An alternative cycle-moment proof by entropy windows <n:coherent-window-route>

We give a second proof of the cycle-moment estimate (25),
  retaining the node comparison and color imbalance estimate already established.
  Instead of separating dyadic bands into two parities, we control their expectation under every tilted law of the
  output coins. The inverse-height weights in the entropy chain rule give each layer a bounded total coefficient.
  We retain the fixed input layers and the node cycle counts $c_v$ from the proof of Theorem 14.

We first give a certificate version of the cycle estimate.
  Consider a butterfly of $q$ distinct-coordinate layers, with arbitrary fixed permutations before and after it,
  and a fixed set $D$ of at most $k$ positions. Let $Y$ count the cycles of the resulting permutation contained in
  $D$, and let $r gt.eq 1$ be an integer. Put $epsilon = 1 \/ 1000$.
  If at least $r$ cycles lie in $D$, with $r > k 2^(- epsilon q)$,
  at least $r \/ 2$ of them have length at most $2 k \/ r$.
  A uniformly chosen closing path of one of these cycles has at most $log_2 \( 2 k \/ r \) lt.eq 1 +
  epsilon q$ internal contacts on average, by the contact bound used in Section 6.1.

Choose one root uniformly in each short cycle, and retain each short cycle independently with probability $1 \/
  16$. Conditional on a particular cycle being retained, its closing path has at most $q \/
  16$ expected contacts with paths in other retained cycles:
  at each layer there is only one other path at its switch,
  and its cycle is retained with probability at most $1 \/ 16$.
  Markov’s inequality shows that the probability of more than $q \/ 4$ such external contacts is at most $1 \/ 4$.
  The probability of more than $q \/ 4$ internal contacts is at most $4 \/ q + 4 epsilon$.
  For all sufficiently large absolute $q$, the expected number of retained roots passing both tests is therefore
  larger than

$ 1 / 16 r / 2 (1 - 1 / 4 - 4 / q - 4 epsilon) > r / 64 . $

Consequently some deterministic choice contains $R = ceil.l r \/ 64
  ceil.r$ cycles whose closing paths share at most $q \/ 2$ switches with all other paths in those selected
  cycles. Deleting further selected cycles only improves this property.

A certificate specifies the unordered root set and the length of each selected cycle;
  traverse the cycles in increasing root order. There are at most

$ binom(k, R) \( 2 k \/ r \)^R lt.eq 2^(R { C_0 + 2 epsilon q }) $

certificates. Fix one certificate and expose its routes in that order.
  Before a closing route is queried, its initial point and target are known.
  The unique geometrical route between them is therefore known too.
  Whether it has at most $q \/ 2$ already exposed switches is measurable at this time.
  If that test succeeds, at least $q \/ 2$ fresh fair bits must take prescribed values for the cycle to close.
  Its conditional cost is at most $2^(- q \/ 2)$. Iterating over the $R$ cycles and then summing certificates proves

#[#set math.equation(numbering: n => "(31)")
 $ Pr { Y gt.eq r } lt.eq e^(- c q r) quad upright("if ") r > k 2^(- epsilon q) upright(" and ") q gt.eq q_0 \,
   $ <n:window-certificate-tail>]

for absolute $c > 0$ and $q_0$. This reasoning conditions only on already exposed bits;
  it does not condition on a subsequently discovered cycle.

Let $b_t = sum_(v : thin "height" \( v \) = t) c_v$ be the cycle count at height $t$ in the there-and-back tree,
  and put $q = floor.l t \/ 2 floor.r$. Condition on all input coins and on output coins at heights below $t - q$.
  First suppose that $q gt.eq q_0$. At a height-$t$ node, write the two child permutations as $alpha \, beta$,
  as in the cycle identification above. Freeze $beta$ and everything in $alpha$ except its last $q$ output layers.
  These are fresh distinct-coordinate layers, so (31) applies.
  Integrating its tail, and decreasing a positive absolute $a_1$ if necessary, gives

$ log bb(E) [e^(a_1 t c_v) divides upright("inputs") \, upright("output heights") < t - q] lt.eq C k_v e^(- a_2 t) . $

The factor $t$ multiplying the exponentially small threshold is absorbed by decreasing $a_2 > 0$.
  Small heights are covered by $c_v lt.eq k_v$ and increasing $C$.
  Nodes at one height use disjoint remaining subtrees and $sum_v k_v = l$. Thus

#[#set math.equation(numbering: n => "(32)")
 $ log bb(E) [e^(a_1 t b_t) divides upright("inputs") \, upright("output heights") < t - q] lt.eq
   C l e^(- a_2 t) . $ <n:coherent-window-mgf>]

To make the change of law precise, fix the input coins and let $P$ be the product law of the output coins.
  Order those coins by increasing height. For any probability $Q$ on this finite coin space, put

$ H_s & =
  bb(E)_Q D #scale(x: 120%, y: 120%)[\(]
  Q \( upright("height-") s upright(" coins") divides upright("lower heights") \) thin parallel thin
  P \( upright("height-") s upright(" coins") \) #scale(x: 120%, y: 120%)[\)] \,\
H & = D \( Q parallel P \) = sum_s H_s . $

Here $D \( dot.op parallel dot.op \)$ denotes relative entropy.
  Applying the entropy inequality conditionally to the window in (32) gives, for $t gt.eq 2$,

$ bb(E)_Q b_t lt.eq frac(C l e^(- a_2 t) + sum_(s = t - floor.l t \/ 2 floor.r)^(t - 1) H_s, a_1 t) . $

Here $b_t$ is measurable in output heights strictly below $t$.
  The tilted law used in the conditional inequality is the marginal law of the window given its lower-height
  history, with all future coins integrated out. The entropy chain rule says that its conditional relative
  entropy, averaged over that history under $Q$, is exactly the displayed sum of $H_s$.
  The height-one term is at most $l$ directly. A fixed layer $s$ belongs only to windows with $s + 1 lt.eq t lt.eq
  2 s$, and $sum_(t = s + 1)^(2 s) t^(- 1) lt.eq log 2$. Summation therefore yields

#[#set math.equation(numbering: n => "(33)")
 $ bb(E)_Q sum_t b_t lt.eq C_1 l + C_2 D \( Q parallel P \) . $ <n:coherent-tilted-cycle-sum>]

For $0 < delta lt.eq 1 \/ C_2$, the finite-space entropy variational formula now gives

$ log bb(E)_P e^(delta sum_t b_t) = sup_Q {delta bb(E)_Q sum_t b_t - D \( Q parallel P \)} lt.eq delta C_1 l . $

The estimate is uniform in the fixed inputs, so it also holds after averaging them.
  Inserting it into the exact ideal-node recursion (22), with $theta log 2 lt.eq delta$,
  proves the density theorem by this alternative route; the smoothing and lower-diagram transfers then apply
  without change.

== 7 Uniform contact cancellation on an exact injection level <n:coherent-contact-section>

A tracked path that meets no other tracked path contributes nothing to the alternating sum over retained
  coordinates. We use this cancellation to obtain a sparse-level contraction estimate,
  with constants uniform in the number of tracked cards. Combining it with the lower-diagram bound of
  Proposition 16 will give dimension-power decay when the tracked fraction is very small.

The main issue is controlling the norm of the surviving kernel.
  We estimate its square by a return experiment with common and independent paths.
  Conditional on the return randomness, a weighted forest count bounds the probability that every tracked path
  meets another. This avoids an independence assumption on the encounter edges.

Let $n = 2^d$ with $d gt.eq 1$, and let $T_n$ be the average operator of a single directed sweep.
  Write $X = \[ n \]_eq.not^k$ for the ordered injective $k$-tuples and $Y = \[ n \]^k$ for all ordered
  $k$-tuples. Both spaces below have counting measure. Let $J : ell^2 \( X \) arrow.r
  ell^2 \( Y \)$ be extension by zero; it is an isometry. A function $f : X arrow.r bb(C)$ is called harmonic if,
  for each slot, its sum over that slot is zero when the other slots are fixed.
  The sum uses the positions not occupied by the fixed slots.
  Equivalently, $J f$ has zero sum over each unrestricted coordinate of $Y$, with the other coordinates fixed.
  Denote this subspace by $cal(H)_k$.

#thm([Proposition 7.1.])[
  (Uniform sparse contact estimate).  #emph[There is an absolute constant $C_(*) >
    0$ such that for every dyadic $n = 2^d gt.eq 2$, every $1 lt.eq k < n$,
    and every partition $lambda = \( n - k \, beta \) tack.r n$,
#[#set math.equation(numbering: n => "(34)")
 $ parallel T_n \( lambda \) parallel_(upright("op"))^2 lt.eq min {1 \,
   (frac(C_(*) d k, n))^(k \/ 2)} . $ <n:coherent-contact-sharp>]

 For $k = 1$ this operator is zero. In particular, with an absolute constant $C$ independent of $n \, k \, lambda$,
#[#set math.equation(numbering: n => "(35)")
 $ parallel T_n \( lambda \) parallel_(upright("op"))^2 lt.eq
   C^k \( 1 + d \)^(C k) \( k \/ n \)^(k \/ 2) . $ <rec:coherent-contact-bound>]

 The same statements hold with the coordinate order reversed.]
] <n:coherent-contact>

#proof[
  We first prove an operator bound on $cal(H)_k$. The representation transfer at the end will explain why it
    applies to $V_lambda$.
  #strong[Alternating coordinate kernels.] For $A subset.eq \[ k \]$, $x in X$, and $y in Y$, define
  $ F_A \( x \, y \) = n^(\| A \|) Pr { pi x_i = y_i upright(" for every ") i in A } \, wide P_A \( x \, y \) =
    n^(- k) F_A \( x \, y \) \, $
  where $pi$ is a sweep permutation. The empty constraint has probability one.
    The matrix $P_A$ has rows indexed by $X$, columns indexed by $Y$, and row sums one.
    Its row law has the coordinates in $A$ follow one common sweep,
    while the other coordinates are independent uniform positions.
    Let $K_X$ be the usual sweep transition kernel on $X$, acting on functions by averaging their values at the
    output. Then $K_X = P_(\[ k \]) J$. If $A eq.not \[ k \]$ and $f in cal(H)_k$,
    summing over any omitted output coordinate gives $P_A J f = 0$. Hence
  #[#set math.equation(numbering: n => "(36)")
   $ K_X f = sum_(A subset.eq \[ k \]) \( - 1 \)^(k - \| A \|) P_A J f wide \( f in cal(H)_k \) .
     $ <n:contact-alternating-kernel>]
  A path through a directed sweep is determined by its two endpoints:
    at each stage the coordinates already updated equal the corresponding output coordinates,
    and those not yet updated equal the input coordinates. This defines a path even when the proposed paths cannot
    be realized simultaneously. For $x in X \, y in Y$, make a graph on $\[ k \]$ by joining two labels when their
    prescribed paths enter the same switch at some stage. Switches are indexed by both stage and pair of
    positions. Let $E \( x \, y \)$ be the event that this graph has no isolated vertex.
  Suppose label $i$ is isolated. For $i in.not A$, the prescribed path of $i$ uses $d$ switches disjoint from
    every other prescribed path. Its probability is $2^(- d) = 1 \/ n$,
    independently of the prescriptions for $A$. If those prescriptions conflict, both probabilities are zero.
    Thus $F_(A union { i }) \( x \, y \) = F_A \( x \, y \)$ in every case,
    and the alternating sum in (36) cancels pointwise. Define the nonnegative rectangular matrices
  $ M_A \( x \, y \) = P_A \( x \, y \) upright(bold(1))_(E \( x \, y \)) . $
  We have proved the exact identity
  $ K_X f = sum_(A subset.eq \[ k \]) \( - 1 \)^(k - \| A \|) M_A J f \, wide
    parallel K_X \|_(cal(H)_k) parallel_(upright("op")) lt.eq
    sum_(A subset.eq \[ k \]) parallel M_A parallel_(ell^2 \( Y \) arrow.r ell^2 \( X \)) . $
  For $k = 1$ the event $E$ is empty and the operator on $cal(H)_1$ is zero. Assume henceforth that $k gt.eq 2$.
  #strong[The square of a retained kernel.] Fix $A$ and a row $x in X$.
    After sampling $y$ according to $P_A \( x \, dot.op \)$, run a fresh reverse sweep for the labels in $A$,
    and let each other label run its own independent reverse path.
    Such a private path uses independent fair stay-or-swap choices in the successive directions.
    Its final position is uniform. Because the forward-supported tuple $y_A$ is injective,
    this defines a stochastic kernel on all return tuples $z in Y$:
  $ Q_A \( y \, z \) = n^(- \| A^c \|) Pr { pi^(- 1) y_i = z_i upright(" for every ") i in A } . $
  Here $pi$ is a fresh forward sweep; its inverse has the reverse-sweep law.
    For $x' in X$, the equality of the prescribed-image events gives $Q_A \( y \, x' \) = P_A \( x' \, y \)$.
    Thus the restriction of $Q_A$ to injective return tuples is the adjoint kernel;
    the extension to all $z$ restores its row sum to one.
  Let $E_(upright("rev")) \( y \, z \)$ say that the prescribed reverse paths have no isolated vertex.
    Reversing paths preserves all switch encounters, so $E \( x' \, y \) = E_(upright("rev")) \( y \, x' \)$.
    Dropping the first-leg encounter condition and then the injectivity constraint on $x'$ gives
  #[#set math.equation(numbering: n => "(37)")
   $ sum_(x' in X) \( M_A M_A^(*) \) \( x \, x' \) & lt.eq sum_(y in Y) P_A \( x \, y \) sum_(z in Y)
     Q_A \( y \, z \) upright(bold(1))_(E_(upright("rev")) \( y \, z \)) . $ <n:contact-square-law>]
  Terms with $P_A \( x \, y \) = 0$ can be omitted. The right side is the probability that the mixed return paths
    have no isolated vertex. We now bound it uniformly in both $A$ and $x$.
  #strong[Product bounds for the midpoint occupation.] Write $a = \| A \|$.
    There is one common network carrying the $a$ labels in $A$, and one private network for each of the $k -
    a$ other labels. A vertex in the next construction records a network and an initial position in that network.
    Distinct networks give distinct vertices, even when the physical position agrees.
  In the common network the occupied midpoint set is the image of the fixed $a$-set ${ x_i :
    i in A }$ under a sweep. If its current occupancy marginals are $p_v$, then for every position set $D$,
  #[#set math.equation(numbering: n => "(38)")
   $ Pr { D upright(" is occupied") } lt.eq product_(v in D) p_v . $ <n:contact-occupation-products>]
  This holds at the deterministic initial set. A fair switch replaces the two endpoint marginals by their mean.
    For $D$ containing exactly one endpoint, average the two old bounds; for $D$ containing both,
    the probability is unchanged while the product of those two marginals can only increase;
    the other sets are unaffected. This proves preservation under each switch.
    At the end of a sweep each card is uniform, so every common-network marginal is $a \/ n$.
  Each private network has one uniform occupied vertex, independently of the common network and of all other
    private networks. Assign to a typed vertex $v$ the weight
  $ p_v =
    cases(delim: "{", a \/ n \, & v upright(" belongs to the common network") \,, 1 \/ n \, & v
    upright(" belongs to a private network") .) $
  If $a = 0$, omit the common network. The random set $cal(O)$ of occupied typed vertices has exactly $k$ elements
    and, for every fixed typed set $D$,
  #[#set math.equation(numbering: n => "(39)")
   $ Pr { D subset.eq cal(O) } lt.eq product_(v in D) p_v \, wide sum_v p_v = k . $ <n:contact-typed-products>]
  A set requiring two different vertices of one private network has probability zero,
    which is consistent with this bound.
  #strong[A graph determined by the return randomness.] Condition only on the fresh randomness used for the return
    trip. Sample the entire common switch wiring. For each private label,
    sample its $d$ independent stay-or-swap bits and use those same bits for every possible starting position of
    that private network. This is a coupling of the possible starts:
    for each fixed start it has exactly the private-path law already defined. It changes no entry of $Q_A$.
    A fixed private bit at a stage applies either the identity or the flip of that coordinate to all positions.
    Consequently, in every network, the map from a starting position to the position entering any specified stage
    is a permutation.
  Join two distinct typed vertices when their return paths enter the same physical switch at some stage.
    For a fixed vertex and a fixed target network there are at most $2 d$ neighbors:
    at a given stage the switch has two positions, and each has exactly one preimage under the target network’s
    position map. The weighted degree therefore satisfies
  #[#set math.equation(numbering: n => "(40)")
   $ sum_(w : thin w tilde.op v) p_w lt.eq Delta \, wide Delta = 2 d k \/ n . $ <n:contact-weighted-degree>]
  The midpoint occupation is independent of the fresh return randomness,
    so (39) remains valid under this conditioning. The encounter graph of the return paths is exactly the graph
    induced by $cal(O)$ in this typed graph.
  #strong[Counting forests with uniform constants.] Every graph on $k$ vertices without isolated vertices contains
    a spanning forest whose components all have at least two vertices.
    Root each component and order the children at each vertex.
    If the forest has $j$ components, then $1 lt.eq j lt.eq floor.l k \/ 2 floor.r$.
    For fixed $k \, j$, there are at most $4^k$ plane rooted forest shapes with ordered components:
    adding one common root embeds this class in the plane rooted trees with $k + 1$ vertices,
    counted by the $k$th Catalan number, which is at most $4^k$.
  For a fixed forest shape $cal(F)$, give an embedding $phi.alt$ into the typed graph the weight
    $product_(u in V \( cal(F) \)) p_(phi.alt \( u \))$. Initially require injectivity and require that every
    forest edge maps to a graph edge. We may increase the sum by dropping injectivity,
    retaining all factors with their multiplicities in this weight. Sum the leaves first:
    for a fixed image of its parent, each leaf contributes at most $Delta$ by (40). Delete that leaf and continue.
    At the end, each of the $j$ roots contributes $sum_v p_v = k$. The full sum is at most $k^j Delta^(k - j)$.
  The component orderings can be divided out before dropping injectivity.
    Indeed a fixed embedded forest with $j$ distinct components gives $j !$ distinct shape–embedding pairs by
    ordering those components, even if some component shapes coincide.
    Together with (39), the union bound over witnessing forests consequently gives
  #[#set math.equation(numbering: n => "(41)")
   $ Pr { cal(O) upright(" has no isolated vertex") divides upright("return randomness") } lt.eq
     4^k sum_(1 lt.eq j lt.eq k \/ 2) frac(k^j, j !) Delta^(k - j) . $ <n:contact-weighted-forest-count>]
  This argument only uses a witnessing forest on the occupied set;
    it does not assume that the encounter edges are independent.
  If $Delta lt.eq 1$, each $k - j gt.eq k \/ 2$, and
  $ 4^k sum_(1 lt.eq j lt.eq k \/ 2) frac(k^j, j !) Delta^(k - j) lt.eq
    4^k Delta^(k \/ 2) sum_(j = 0)^oo frac(k^j, j !) = \( 4 e \)^k Delta^(k \/ 2) . $
  This is uniform in the conditioned return graph and hence also holds after averaging its randomness.
    By (37), every row sum of the symmetric nonnegative matrix $M_A M_A^(*)$ has that upper bound.
    Schur’s test, or its maximum-row-sum bound, gives
  $ parallel M_A parallel_(upright("op"))^2 lt.eq \( 4 e \)^k Delta^(k \/ 2) . $
  There are $2^k$ choices of $A$, so the triangle inequality in (36) yields
  #[#set math.equation(numbering: n => "(42)")
   $ parallel K_X \|_(cal(H)_k) parallel_(upright("op"))^2 lt.eq \( 16 e \)^k \( 2 d k \/ n \)^(k \/ 2) .
     $ <n:contact-harmonic-bound>]
  For $Delta > 1$, the contraction bound $parallel K_X parallel_(upright("op")) lt.eq
    1$ gives the same conclusion after enlarging the absolute constant. For example, $C_(*) = 512 e^2$ suffices in (34).
  #strong[Passing to the exact representation level.] The permutation representation on $X$ is induced from the
    trivial representation of the stabilizer $S_(n - k)$. By Young branching and Frobenius reciprocity,
    $V_lambda$, with $lambda_1 = n - k$, occurs in this representation:
    remove the $k$ boxes below its first row in a valid corner-removal order.
    It does not occur on $\( k - 1 \)$-tuples, because occurrence there would require a first row of length at
    least $n - k + 1$.
  For any specified slot, the functions lifted from the other $k -
    1$ slots form an invariant subspace containing no copy of $V_lambda$.
    Its orthogonal complement consists exactly of functions whose sum in that slot is zero.
    Thus every $V_lambda$-isotypic component on $X$ lies in $cal(H)_k$.
    The averaging operator $K_X$ on functions has the Fourier action of $T_n^(*)$ under the convention that a
    permutation acts by pullback through its inverse. Its norm on a copy of $V_lambda$ is therefore $parallel
    T_n \( lambda \) parallel_(upright("op"))$. Applying (42) proves the proposition.
    The proof uses only that each coordinate is updated once and works unchanged in the reversed coordinate order. ◻
]

#prodef([Remark 7.2.])[
  (Counting roots among physical positions).  For comparison with counting roots among physical positions,
    the right side of (41) equals
  $ 4^k \( k \/ n \)^k sum_(1 lt.eq j lt.eq k \/ 2) frac(n^j, j !) \( 2 d \)^(k - j) . $
  For $j lt.eq n \/ 2$, the bound
  $ log frac(n^j, \( n \)_j) = sum_(r = 0)^(j - 1) - log \( 1 - r \/ n \) lt.eq
    sum_(r = 0)^(j - 1) frac(r, n - r) lt.eq j $
  shows that $n^j \/ j ! lt.eq e^j binom(n, j)$. Thus we also obtain the root-count bound
  #[#set math.equation(numbering: n => "(43)")
   $ Pr { cal(O) upright(" has no isolated vertex") divides upright("return randomness") } lt.eq \( k \/ n \)^k
     sum_(1 lt.eq j lt.eq k \/ 2) \( 4 e \)^k binom(n, j) \( 2 d \)^(k - j) . $ <rec:coherent-forest-count>]
  The weighted version identifies all types and occupation factors explicitly;
    both forms retain the same number $k - j$ of contact costs.
]

#thm([Corollary 7.3.])[
  (Exponential sparse-level saving).  #emph[There are absolute constants $C \,
    d_0 > 0$ such that for every dyadic $n = 2^d$ and $lambda = \( n - k \, beta \) tack.r n$ satisfying $1 lt.eq
    k < n$ and $log \( n \/ k \) gt.eq d^(3 \/ 4)$,
$ parallel T_n \( lambda \) parallel_(upright("op"))^2 lt.eq e^(C k) \( k \/ n \)^(k \/ 4) . $

 For $d gt.eq d_0$, the factor $e^(C k)$ can be omitted.]
] <n:coherent-contact-sparse-saving>

#proof[
  Put $s = log \( n \/ k \)$. For a nonzero operator, (34) bounds the logarithm of its squared norm by $-
    k s \/ 2 + \( k \/ 2 \) log \( C_(*) d \)$. Since $log \( C_(*) d \) = o \( d^(3 \/ 4) \)$, it is at most $-
    k s \/ 4$ for all sufficiently large $d$ in the stated range.
    The remaining finitely many $d$ are covered by increasing $C$,
    using $parallel T_n parallel_(upright("op")) lt.eq 1$ and $s lt.eq d log 2$. A zero operator is covered directly. ◻
]

#thm([Corollary 7.4.])[
  #emph[There are absolute $c > 0$ and $d_0$ such that, for every $N = 2^d$ with $d gt.eq
    d_0$ and every partition $lambda = \( N - k \, beta \) tack.r N$ satisfying $1 lt.eq
    k < N$ and $log \( N \/ k \) gt.eq d^(3 \/ 4)$,
$ parallel T_N \( lambda \) parallel_(upright("op"))^2 lt.eq D_lambda^(- c) . $

]
] <n:coherent-sparse-consequence>

#proof[
  Put $s = log \( N \/ k \)$ and $L = log D_beta$. For sufficiently large $d$, (35) has logarithm at most $-
    k s \/ 4$, since its positive error is $O \( k log \( 1 + d \) \)$.
    Proposition 16 gives the second logarithmic bound $C_1 k - a L$. If $L lt.eq \( 2 C_1 \/ a \) k$, then
  $ log D_lambda lt.eq k \( 1 + s \) + L lt.eq C_2 k s \, $
  so the first bound suffices. If $L > \( 2 C_1 \/ a \) k$, the second bound is at most $- a L \/ 2$.
    Taking the better of the two bounds then gives
  $ log parallel T_N \( lambda \) parallel_(upright("op"))^2 lt.eq - max { k s \/ 4 \, a L \/ 2 } lt.eq -
    c_1 \( k s + L \) . $
  The tableau inequality $D_lambda lt.eq binom(N, k) D_beta lt.eq \( e N \/ k \)^k
    D_beta$ again proves the result. Zero operator norm is covered directly. ◻
]

== 8 Cycle traces and contraction by the transposition Casimir <sec:casimir>

The estimates in this section keep track of the number of boxes below the first row of a representation.
  The relevant scale is

$ h_n \( k \) = k log \( e n \/ k \) \, wide 1 lt.eq k lt.eq n . $

We will prove a density bound for every injection and a contraction bound with this same scale,
  then combine them to control a fixed trace moment. This gives a complete additional route from the switching
  network to the full permutation law.

Let $n = 2^d$, and let $mu_n$ be the law of one directed coordinate sweep.
  In any unitary representation its average is $T_n = Pi_d dots.h.c Pi_1$,
  where $Pi_i$ averages the independent fair switches in direction $i$.
  Put $K_n = T_n^(*) T_n$ and write $nu_n$ for its permutation law.
  Chronologically, $nu_n$ runs a sweep and then its reflection, with fresh independent switches.
  For $n = 2 m$, the network consists of an outer pair layer, two independent networks with law $nu_m$,
  and another outer pair layer. We write $K_n \( lambda \)$ for the operator in the irreducible representation
  $V_lambda$, and $D_lambda = f^lambda = dim V_lambda$. The same group-algebra operator also acts on tensor spaces
  and on injections; its indicated carrier will always specify which action is meant.

Write $X_(n \, k) = \[ n \]_eq.not^k$ for the ordered distinct $k$-tuples of positions,
  and $u_(n \, k)$ for their uniform probability measure. There are $\( n \)_k =
  n \( n - 1 \) dots.h.c \( n - k + 1 \)$ such tuples. For $x \, y in X_(n \, k)$ define

$ K_(n \, k) \( x \, y \) = Pr_(pi tilde.op nu_n) \( pi x = y \) \, wide
  R_x \( y \) = \( n \)_k K_(n \, k) \( x \, y \) \, $

where $pi x$ means applying $pi$ to every entry of $x$. Thus $R_x$ is a density relative to $u_(n \, k)$.
  In particular its $L^p$ norms use a probability measure, whereas all matrix traces and Schatten norms below are
  unnormalized.

#thm([Theorem 8.1.])[
  (Cycle density and Casimir contraction).  #emph[There are absolute constants $a \,
    C > 0$ such that for every dyadic $n$, every $1 lt.eq k lt.eq n$, and every $x in X_(n \, k)$,
$ parallel R_x parallel_(L^(65 \/ 64) \( u_(n \, k) \)) lt.eq e^(C h_n \( k \)) . $

 For every nontrivial partition $lambda tack.r n$, put $k = n - lambda_1$. Then
$ parallel K_n \( lambda \) parallel_(upright("op")) lt.eq e^(- a h_n \( k \)) \, wide
  D_lambda "Tr" K_n \( lambda \)^65 lt.eq e^(C h_n \( k \)) . $

 Consequently there is an absolute integer $l$ for which $parallel mu_n^(* l) -
   U_(S_n) parallel_(upright("TV")) arrow.r 0$ as $n arrow.r oo$ through powers of two.
   Here $U_(S_n)$ is the uniform permutation law and total variation includes the factor $1 \/ 2$.
   The same bound holds from every deterministic initial permutation.
   When $n = 2^d$, these $l$ sweeps take $l d$ physical shuffles.]
] <cas:main>

The density proof counts cycles through positive tensor traces.
  For the operator bound we use the transposition Casimir, the sum of the positive operators $I -
  U \( \( i thin j \) \)$. Its scalar on $V_lambda$ is comparable to $n k$.
  Two estimates for a random split of this sum control, respectively,
  the loss of total Casimir mass and the imbalance between the two children.
  They allow an induction with a fixed multiplicative margin.
  Finally, Hausdorff–Young turns the injection-density bound into the $65$th moment,
  and Schatten Hölder applies that moment to powers of the directed sweep.

=== 8.1 Cycle traces and tuple spreading <cycle-traces-and-tuple-spreading>

Our first objective is the $L^(65 \/ 64)$ density bound. A selected cycle at a network node contributes a factor
  two to the number of possible routings. We therefore need an exponential moment for the sum of these cycle
  counts. Positive tensor traces first bound the full cycle count;
  a conditional estimate across levels then controls the selected cycles.

If $pi$ is a permutation let $kappa \( pi \)$ denote the number of cycles, counting fixed points.
  Define for real $x gt.eq 1$

$ Z_b \( x \) = bb(E)_(pi tilde.op nu_b) x^(kappa \( pi \)) $

where $b$ is a power of 2. We first show that there are absolute $C < oo$ and $gamma > 0$ such that, for $b = 2^w$,

#[#set math.equation(numbering: n => "(44)")
 $ log Z_b \( 1 + 2^(floor.l w \/ 8 floor.r) \) lt.eq C b^(1 - gamma) . $ <cas:e1>]

For integer $q gt.eq 1$, $Z_b \( q \)$ is the trace of $K_b$ on the tensor space $\( bb(C)^q \)^(⊗ b)$ with
  permutations acting by permuting tensor legs. In fact the trace of a permutation counts its fixed words on an
  alphabet of size $q$. The following identity is the common tensor calculation underlying this proof and the
  harmonic cycle estimates.

#thm([Lemma 8.2.])[
  (Tensor-swap recursion).  #emph[For a dyadic $m$ and an integer $q gt.eq 1$,
    let $D$ be the action of $K_m$ on $\( bb(C)^q \)^(⊗ m)$. For $S subset.eq \[ m \]$, let $A_S = "Tr"_(S^c) D$,
    where the partial trace is unnormalized. Then
$ Z_(2 m) \( q \) = 2^(- m) sum_(S subset.eq \[ m \]) "Tr" A_S^2 \, wide Z_(2 m) \( q \) lt.eq
  Z_m \( q \) Z_m \( 1 + \( q - 1 \) \/ 2 \) . $

 The scalar function $Z_m \( x \)$ in the second formula is defined for every real $x gt.eq 1$,
   including a nonintegral argument.]
] <cas:swap-recursion>

#proof[
  In this representation the recursion at size $2 m$ gives the operator
  $ P \( D ⊗ D \) P \, wide D = K_m med upright("on ") \( bb(C)^q \)^(⊗ m) \, $
  where $P = product_(i = 1)^m #scale(x: 120%, y: 120%)[\(] \( I + F_i \) \/ 2
    #scale(x: 120%, y: 120%)[\)]$ with $F_i$ interchanging leg $i$ between the two copies (number the pair indices
    by $i = 1 \, dots.h \, m$, using the same ordering in both copies).
    Here $P^2 = P$ and $D$ is positive semidefinite. Taking a cyclic trace and expanding $P$ gives
  #[#set math.equation(numbering: n => "(45)")
   $ Z_(2 m) \( q \) = 2^(- m) sum_(S subset.eq \[ m \]) "Tr" #scale(x: 120%, y: 120%)[\[] \( "Tr"_(S^c) D \)^2
     #scale(x: 120%, y: 120%)[\]] \, $ <cas:e2>]
  where $"Tr"_(S^c)$ is ordinary, unnormalized partial trace over legs in the complement.
    Indeed for the product of swaps on $S$, first trace out the non-swapped legs and then use
    $"Tr" \( F \( A ⊗ A \) \) = "Tr" \( A^2 \)$ with $F$ the whole swap of the remaining copies.
  The operator $A_S = "Tr"_(S^c) D$ is positive semidefinite, with trace $Z_m \( q \)$.
    For an individual permutation operator in $D$, its partial trace is $q^(kappa_0 \( pi \, S \))$ times a
    permutation operator on the legs in $S$, where $kappa_0$ counts cycles disjoint from $S$.
    This follows by writing matrix entries in the word basis:
    an input color index is equated to the output index at the next site along the cycle,
    and input is set equal to output on legs traced out and summed.
    Thus each deleted whole cycle has a free common index, and on other cycles the deleted legs simply shorten the
    cycle to its undeleted legs. It follows that $parallel A_S parallel lt.eq
    bb(E)_(pi tilde.op nu_m) q^(kappa_0 \( pi \, S \))$, where $parallel dot.op
    parallel$ on operators denotes operator norm. Use $"Tr" A_S^2 lt.eq parallel A_S parallel "Tr" A_S$.
    With $S$ a uniform subset, independent of $pi$, we obtain
  #[#set math.equation(numbering: n => "(46)")
   $ Z_(2 m) \( q \) & lt.eq Z_m \( q \) thin bb(E)_(pi tilde.op nu_m)
     product_(upright("cycles ") C_1 upright(" of ") pi) #scale(x: 120%, y: 120%)[\(] 1 + \( q - 1 \)
     2^(- \| C_1 \|) #scale(x: 120%, y: 120%)[\)]\
 & lt.eq Z_m \( q \) thin Z_m \( 1 + \( q - 1 \) \/ 2 \) . $ <cas:e3>]
  ◻
]

#strong[A slowly growing alphabet.] We now derive the stated bound for $Z_b$ from the recursion.
  This proof retains the decay obtained by following the alphabet parameter until it reaches its smallest value.
  Let $h_w \( r \) = 2^(- w) log Z_(2^w) \( 1 + 2^r \)$ for integers $r gt.eq 0$.
  For $w gt.eq 1 \, r gt.eq 1$, (46) gives

$ h_w \( r \) lt.eq 1 / 2 h_(w - 1) \( r \) + 1 / 2 h_(w - 1) \( r - 1 \) . $

At the boundary $r = 0$, concavity gives $Z_m \( 3 \/ 2 \) lt.eq Z_m \( 2 \)^alpha$, where $alpha =
  log_2 \( 3 \/ 2 \)$. Consequently

$ h_w \( 0 \) lt.eq theta h_(w - 1) \( 0 \) \, wide theta = \( 1 + alpha \) \/ 2 < 1 \, wide
  h_0 \( r \) lt.eq \( r + 1 \) log 2 . $

To iterate these inequalities, start at $r$ and, while positive,
  stay in place or decrement by one with equal probabilities.
  After reaching zero, remain there and multiply by $theta$ at each subsequent step.
  The recurrence bounds $h_w \( r \)$ by $\( r + 1 \) log 2$ times the expected product of these factors over $w$ steps.

Suppose $r lt.eq w \/ 8$. If $B$ counts successes in $floor.l w \/ 2 floor.r$ independent fair trials,
  the probability that the process has not reached zero by that time is at most

$ Pr \( B < r \) lt.eq 2^r bb(E) 2^(- B) = 2^r \( 3 \/ 4 \)^(floor.l w \/ 2 floor.r) lt.eq C e^(- c w) \, $

since $2^(1 \/ 8) sqrt(3 \/ 4) < 1$. On the complementary event the product of factors is at most $theta^(w \/ 2)$. Thus

$ h_w \( r \) lt.eq \( r + 1 \) log 2 { C e^(- c w) + theta^(w \/ 2) } . $

Taking $r = floor.l w \/ 8 floor.r$ proves (44), with an absolute $gamma >
  0$ decreased as necessary to absorb the linear factor in $w$.

#strong[Conditional cycle counts.] The trace bound concerns an unconditioned network of one size.
  To use it on the many levels of a larger network, we leave a specified interval of switch levels fresh and
  require a bound uniform in all other switches. We next use (44) for switches sampled in the recursion defining
  $nu_n$. Nodes of size $2^j$ will be called level $j$ ($1 lt.eq j lt.eq d$),
  with $n \/ 2^j$ nodes at that level indexed by fixed prefixes of length $d - j$.
  Regard the input and output outer switches of every node as its switch variables at that level;
  the raw switch variables are independent. For a realization,
  draw at a node the edges taken by all its cards between its input pair indices and output pair indices (two
  parts); the graph is bipartite 2-regular, allowing double edges.
  Its two full matchings, together giving the edges with multiplicity, come from the two child bijections $A \,
  B$ on the $m = 2^(j - 1)$ pair indices: the outer switches do not change these indices and there is one card per
  input pair going to each child. The number of cycle components, including cycles of two edges,
  is $kappa \( A^(- 1) B \)$ (traverse using $B$-edges forward, $A$-edges backward).
  Let $C_j$ be the sum of these numbers over level $j$. It depends only on switches at levels strictly below $j$,
  regardless of card identities coming into the nodes.

Fix $1 lt.eq k lt.eq n$, and put $W_j = min \( k \/ 2 \, C_j \)$. With

$ delta = 1 \/ 64 $

we claim the absolute bound

#[#set math.equation(numbering: n => "(47)")
 $ log bb(E) thin 2^(delta sum_(j = 1)^d W_j) lt.eq C k log \( e n \/ k \) . $ <cas:e4>]

For $j gt.eq 64$ let

$ w = floor.l j \/ 2 floor.r \, wide b = 2^w \, wide I_j = { j - w \, dots.h \, j - 1 } . $

Condition on all level switch variables outside $I_j$. We will bound the exponential moment at the higher exponent
  $delta j$. Take $q = 1 + 2^(floor.l w \/ 8 floor.r)$, so $q gt.eq 2^(delta j)$ ($floor.l w \/ 8 floor.r =
  floor.l j \/ 16 floor.r gt.eq j \/ 64$ for $j gt.eq 64$).
  Within each child of size $m = 2^(j - 1)$ of a node at level $j$,
  the interval $I_j$ supplies $w$ outer layers of input switches and the corresponding output layers.
  We can additionally condition on all the output switch variables there.
  The child input switches in $I_j$ act as independent $w$-bit sweeps in $m \/
  b$ blocks (first $w$ bits of the child position index used, its other bits fixed within a block);
  the blocks are aligned across the two children. Thus for a node, $A^(- 1) B$ now has the form

$ U_A^(- 1) G U_B $

where $G$ is a fixed permutation of the $m$ slots and $U_A \,
  U_B$ are independent permutations with law the product of $mu_b$ over those blocks.
  Indeed each child map first applies the indicated input switches,
  then its deeper fixed submaps and its conditioned output switches.
  In the $q$-color tensor representation on $m$ slots, let $T_(upright("bl"))$ be the mean operator of the input
  sweeps in blocks, and $U \( G \)$ the representation of $G$. Conditionally,

$ bb(E) thin q^(kappa \( A^(- 1) B \)) = "Tr" #scale(x: 120%, y: 120%)[\(] T_(upright("bl"))^(*) U \( G \)
  T_(upright("bl")) #scale(x: 120%, y: 120%)[\)] lt.eq "Tr" \( T_(upright("bl")) T_(upright("bl"))^(*) \) =
  Z_b \( q \)^(m \/ b) . $

Here we bounded the absolute trace against a positive semidefinite matrix using unitarity,
  and used the tensor product over blocks and cyclicity. Different level-$j$ nodes use independent remaining
  randomness. The bound is uniform so we can drop the extra output conditioning.
  We get, with $cal(F)_(overline(I)_j)$ denoting the switches outside $I_j$,

#[#set math.equation(numbering: n => "(48)")
 $ log bb(E) #scale(x: 120%, y: 120%)[\[] 2^(delta j W_j) divides cal(F)_(overline(I)_j)
   #scale(x: 120%, y: 120%)[\]] lt.eq min #scale(x: 120%, y: 120%)[\(] \( log 2 \) delta j k \/ 2 \, med
   C n b^(- gamma) #scale(x: 120%, y: 120%)[\)] . $ <cas:e5>]

Indeed the second bound applies to $C_j$ by multiplying over the $n \/
  2^j$ nodes and using (44) with $\( n \/ 2^j \) \( m \/ b \) b^(1 - gamma) lt.eq n b^(- gamma)$.

#strong[Combining overlapping level intervals.] Estimate (48) is conditional,
  so it does not require different cycle counts to be independent.
  We will use it first on collections of disjoint intervals, and then average those collections by Hölder.
  To combine intervals without paying a Hölder exponent of more than $j$ on level $j$,
  observe that for a fixed level $l$,

$ sum_(j gt.eq 64 : med l in I_j) 1 / j lt.eq sum_(j = l + 1)^(2 l) 1 / j lt.eq 1 . $

Using only $64 lt.eq j lt.eq d$, we can find weights $theta_(cal(S)) gt.eq 0$, summing to 1,
  on subcollections $cal(S)$ of these indices with pairwise disjoint intervals,
  such that $sum_(cal(S) in.rev j) theta_(cal(S)) = 1 \/ j$ for each such $j$.
  For clarity, assign to each interval, in order of increasing left endpoints (ties ordered arbitrarily),
  a measurable subset of $\[ 0 \, 1 \]$ of length $1 \/ j$,
  disjoint from the sets of earlier overlapping intervals. This is possible because those earlier overlapping
  intervals all contain the current left endpoint, so their sets’ total length leaves enough room.
  Partition by membership in the assigned sets, taking lengths as weights. Weighted Hölder now gives

$ bb(E) thin 2^(delta sum_(64 lt.eq j lt.eq d) W_j) lt.eq
  product_(cal(S)) (bb(E) thin 2^(delta sum_(j in cal(S)) j W_j))^(theta_(cal(S))) $

(positive weights suffice in the product, and the exponents inside the expectations on the right give the one on
  the left when averaged with those weights). Within a collection,
  use (48) on the largest $j$ first and continue downwards.
  The terms from smaller $j'$ in the collection depend only on levels $lt.eq j' - 1$,
  hence outside $I_j$ since $I_(j')$ ends at $j' - 1$ and the intervals are disjoint with $j' - 1 < j - 1$.
  Taking logs, the resulting bounds (48) occur with factors $1 \/ j$.
  Handling $j < 64$ deterministically, we obtain an upper bound for the left hand side of (47) by

$ C k + sum_(j gt.eq 64) min #scale(x: 120%, y: 120%)[\(] C k \,
  thin C n thin 2^(- gamma floor.l j \/ 2 floor.r) \/ j #scale(x: 120%, y: 120%)[\)] lt.eq C' k log \( e n \/ k \) \, $

where the sum bound can use all $j gt.eq 64$: after $j_0 = ceil.l \( 2 \/ gamma \) log_2 \( n \/ k \) ceil.r$,
  $n 2^(- gamma floor.l j \/ 2 floor.r) lt.eq 2^gamma k thin 2^(- \( gamma \/ 2 \) \( j - j_0 \))$.
  Thus the tail costs at most $C k$, and there are only $O \( log \( e n \/ k \) \)$ terms before it. This proves (47).

#strong[From cycle weights to an injection density.] The cycle moment is now available under the actual switch
  law. The next calculation relates it to the auxiliary uniform choices of legal child colors.
  Keeping these two probability laws separate is necessary when we estimate a power of the density.
  Denote by $\[ n \]_eq.not^k$ the ordered distinct $k$-tuples of positions, of cardinality $\( n \)_k =
  n \( n - 1 \) dots.h.c \( n - k + 1 \)$; positions can again be indexed by bit words,
  and $pi x$ denotes acting by the permutation $pi$ on every coordinate of $x$. The following row bound is what we need:

#[#set math.equation(numbering: n => "(49)")
 $ K_(n \, k) \( x \, y \) = Pr_(pi tilde.op nu_n) \( pi x = y \) \, wide
   R_x \( y \) = \( n \)_k K_(n \, k) \( x \, y \)\
arrow.r.double quad parallel R_x parallel_(1 + delta) lt.eq exp \( C k log \( e n \/ k \) \) . $ <cas:e6>]

for every such $x$, with norm on uniform $y in \[ n \]_eq.not^k$.

Here is a partial route-counting identity. Fix the input and output tuples at a node.
  Draw the selected edges (the specified cards) between its input and output pair indices.
  Their components with edges are paths or cycles, say there are $p_0$ paths and $s$ cycles,
  with double edges forming a cycle as well. There are $k +
  p_0$ vertices incident to edges (here $k$ refers to the number of cards specified at this node).
  A proper edge coloring with two colors corresponds to assigning child halves,
  with two choices on each component by alternation. For each such coloring,
  the probability of the required outer switches, input and output together, is $2^(- \( k + p_0 \))$:
  exactly one switch is prescribed per incident vertex, and the prescriptions are consistent since the tuples are
  distinct and the coloring is proper. In each child we now prescribe input and output tuples on the reduced
  indices, again distinct, for the tags of its color (keep their given order).
  With an empty tuple the kernel is interpreted as 1. Multiplying by $n^k$ for a node of size $n = 2 m$,
  the identity at that node is

$ n^k K_(n \, k) \( x \, y \) = 2^s thin bb(E)_(upright("color"))
  [product_(a = 0)^1 m^(k_a) K_(m \, k_a) \( x'_a \, y'_a \)] $

where the proper coloring is uniform and the child data (sizes $k_a$) are induced by it.
  At size 1 the normalized kernel is 1. Recursing defines a base coloring experiment for fixed $x \, y$,
  with independent uniform coloring choices at each level’s nodes conditional on the already induced data there,
  inducing child data all the way down. Let $S$ be the sum of selected-graph cycle counts $s$ over its nodes.
  Thus $n^k K_(n \, k) = bb(E)_(upright("base")) 2^S$.

More precisely, for any outcome of this coloring tree, the probability under the actual full switches of taking
  $x$ to $y$ with those specified child assignments along the way is $n^(- k)
  2^S$ times its probability in the base experiment. Indeed at each internal node $v$,
  with local tuple size and component counts $k_v \, p_v \, s_v$ (cards, paths with edges, cycles),
  the probability of the needed outer switches is $2^(- \( k_v + p_v \))$,
  versus $2^(- \( p_v + s_v \))$ for the designated coloring under the base experiment given its incoming data.
  For this fixed tree the switch requirements are prescriptions of raw coins, disjoint across the nodes,
  and together necessary and sufficient: tuples remain injective in each child (proper coloring) and the induced
  endpoints at size 1 require nothing more, with all unselected cards free of endpoint restrictions.
  The ratio thus multiplies to $product_v 2^(s_v - k_v) = 2^S n^(- k)$,
  since the $k_v$’s sum to the original $k$ on each level. Conversely a full switch realization from $x$
  determines a unique selected endpoint and coloring tree for it (actual child routes).

On a realization of the full switches starting with tuple $x$, call the corresponding total cycle count $S_x$,
  using its actual endpoint and child routes. Any cycle in a selected partial graph is a full cycle component of
  that node’s graph from the realization, since its vertices already have degree 2 on the cycle.
  Also each uses at least two selected cards, with disjoint cards across cycles of a level.
  It follows that $S_x lt.eq sum_j W_j$ (now with the original full tuple size $k$) on every realization.
  By convexity and the refined identity, with $u = \( n \)_k \/ n^k lt.eq 1$,

$ bb(E)_(y med upright("uniform")) R_x \( y \)^(1 + delta) lt.eq
  frac(u^(1 + delta), \( n \)_k) sum_y bb(E)_(upright(b a s e \( x \, y \))) 2^(\( 1 + delta \) S) =
  u^delta thin bb(E)_(upright("actual")) 2^(delta S_x) . $

Now (47) proves (49).

=== 8.2 A contraction measured by the transposition Casimir <a-contraction-measured-by-the-transposition-casimir>

The density estimate is complete. We now prove the operator contraction on the same scale $h_n \( k \)$.
  The induction splits the positions into two halves, so its main task is to compare the parent Casimir scalar
  with the two child scalars seen by a vector fixed by the outer switches.

We use standard representation theory of the symmetric group over $bb(C)$:
  irreducibles are indexed by partitions $lambda$ of $n$, of dimensions $f^lambda$ (numbers of standard Young
  tableaux). We use Young’s branching rule for restriction down the symmetric groups (multiplicity given by paths
  of successively removing single boxes while keeping diagrams of partitions),
  and the standard transposition-sum content formula (by the Young–Jucys–Murphy content
  theorem #cite(label("VershikOkounkov2005")) Eq. (2.1), Proposition 5.3 and Theorem 5.8),
  that $sum_(i < j) \( i thin j \)$ acts in $lambda$ by the sum of column-minus-row indices of its boxes.
  Indices of rows and columns here start at 1. The permutation module on ordered distinct $k$-tuples is the coset
  module with stabilizer $S_(n - k)$, so multiplicity of $lambda$ is the dimension of its stabilizer-fixed space
  by Frobenius reciprocity. In particular for $k = n - lambda_1$, $lambda$ occurs in this module and (if $k gt.eq
  1$) not in the corresponding $k - 1$ tuple module. Its multiplicity at this $k$ is $f^(macron(lambda))$,
  where $macron(lambda)$ consists of all rows below the first:
  paths in the branching rule to the trivial shape $\( n - k \)$ must remove just that tail. Also

#[#set math.equation(numbering: n => "(50)")
 $ f^lambda lt.eq binom(n, k) f^(macron(lambda)) $ <cas:e7>]

by choosing the entries of a standard tableau below the top row.

Let $U$ denote the unitary action of $S_n$ on the representation currently under consideration.
  Write $D_(i j) = I - U \( \( i thin j \) \)$ on a unitary representation (indices $i \, j$ are positions).
  They are positive semidefinite. Put $cal(C) = sum_(i < j) D_(i j)$, which in $lambda$ acts by

#[#set math.equation(numbering: n => "(51)")
 $ c = c_lambda = 1 / 2 \( n^2 - sum_i lambda_i^2 \) + sum_i \( i - 1 \) lambda_i \, wide n k \/ 2 lt.eq c lt.eq
   n k \, wide k = n - lambda_1 . $ <cas:e8>]

For the lower bound use $sum lambda_i^2 lt.eq n lambda_1$.
  For the upper, the sum of squares below row 1 is at least $k$,
  and the sum of row-minus-one indices over tail boxes is at most $k \( k + 1 \) \/
  2$ (ordering tail boxes by row, the $a$-th has row index at most $a + 1$). Define

$ Phi_n \( c \) = c / n #scale(x: 120%, y: 120%)[\(] 2 + log \( n^2 \/ c \) #scale(x: 120%, y: 120%)[\)] \, wide
  Phi_n \( 0 \) = 0 . $

We prove there are absolute $B > 1 \, eta > 0$ such that on every nontrivial irreducible $lambda$ for $n = 2^d$,

#[#set math.equation(numbering: n => "(52)")
 $ parallel K_n parallel_lambda lt.eq B^(- 1) exp \( - eta Phi_n \( c_lambda \) \) . $ <cas:e9>]

The norm notation means the operator norm in the indicated irreducible.
  In particular the bound implies $parallel K_n parallel_lambda lt.eq
  exp \( - a k log \( e n \/ k \) \)$ there for an absolute $a > 0$:
  $k \/ 2 lt.eq c \/ n lt.eq k$ gives $Phi_n \( c \) gt.eq \( k \/ 2 \) \( 2 + log \( n \/ k \) \)$.

We will do an induction for (52) after some random-split estimates.
  In outline, $K_n$ is the child product-law operator compressed by $Pi_1$,
  so we study Rayleigh values in unit vectors invariant under the bit-1 switch group.
  Under restriction to the two halves’ product subgroup, the induction hypothesis will contribute two child
  $Phi$-values (evaluated at the partial Casimir scalars on the irreducibles of the factors),
  in place of the $Phi_n \( c \)$ in (52). The invariant vector lets us analyze the distribution of the partial
  Casimir values (spectral weights in the vector) by randomly flipping which member of each pair lies in each
  half. We control the sum of these two scalars relative to $c \/ 2$, and their difference,
  for the $Phi$-comparison; we also use the high probability of two nontrivial child factors in the spectral
  weighting for large $k$ so that the factor $B^(- 1)$ in (52) gives slack.

==== 8.2.1 Two estimates for a random split <two-estimates-for-a-random-split>

Partition the positions into the $m = n \/ 2$ switch pairs of bit 1, using subscripts $p 0 \,
  p 1$ in a pair $p$ for its bit-1 values 0 and 1, respectively. Draw independent fair signs $s_p$.
  Write $xi_(p 0) = s_p \, med xi_(p 1) = - s_p$, and let $L \, R$ be the positions with $xi = + 1 \, -
  1$ respectively. The two partial Casimirs $cal(C)_L \, cal(C)_R$ are the sums of $D_(i j)$ for pairs of
  positions both in the indicated side. They commute for a fixed split. Use the operators

$ Delta = cal(C) - 2 \( cal(C)_L + cal(C)_R \) \, wide cal(R) = cal(C)_L - cal(C)_R . $

On $lambda$, both $Delta$ and $cal(R)$ are between $- c I$ and $c I$ by positivity of the terms of $cal(C)$.
  The sum defect $Delta$ measures how much Casimir mass is lost in the split,
  while $cal(R)$ measures the difference between the two sides. They require different estimates:
  an exponential moment of $Delta$ itself and an exponential moment of $cal(R)^2$.

#thm([Lemma 8.3.])[
  (Exponential moments for a transversal split).  #emph[There are absolute constants $t_0 \,
    t_1 > 0$ and $C_0 < oo$ such that, for every dyadic $n gt.eq 2$ and every nontrivial $lambda tack.r n$,
    with $k = n - lambda_1$ and $c = c_lambda$,
#[#set math.equation(numbering: n => "(53)")
 $ ∥bb(E)_s e^(t Delta \/ n)∥_lambda lt.eq C_0 quad upright("at ") t = t_0 log \( e n \/ k \) \,
   wide ∥bb(E)_s e^(t_1 cal(R)^2 \/ \( n c \))∥_lambda lt.eq C_0 \, $ <cas:e10>]

 The expectations are over the independent fair signs defining the transversal split,
   and both norms are operator norms on $V_lambda$.]
] <cas:split-moments>

#proof[
  #strong[The imbalance moment.] We start with the second estimate. Write $F_i = sum_(j eq.not i) D_(i j)$.
    Then $cal(R) = 1 / 2 sum_i xi_i F_i = sum_p s_p W_p$ with $W_p = \( F_(p 0) - F_(p 1) \) \/ 2$. On $lambda$,
  $ K_0 = max_p parallel W_p parallel lt.eq n \, wide M^2 = ∥sum_p W_p^2∥ lt.eq 2 n c \, $
  using $0 lt.eq F_i lt.eq 2 \( n - 1 \) I$, $F_i^2 lt.eq 2 \( n - 1 \) F_i$, $sum_i F_i = 2 c I$,
    and $sum_p W_p^2 lt.eq 1 / 2 sum_i F_i^2$ (by $\( F_(p 0) + F_(p 1) \)^2 gt.eq 0$ for each pair).
    For such self-adjoint matrices the following moment bound suffices, for integers $l gt.eq 1$:
  #[#set math.equation(numbering: n => "(54)")
   $ ∥bb(E)_s \( sum s_p W_p \)^(2 l)∥ lt.eq #scale(x: 120%, y: 120%)[\(] C \( M sqrt(l) + K_0 l \)
     #scale(x: 120%, y: 120%)[\)]^(2 l) . $ <cas:e11>]
  Here are details without a dimension factor. Expand the noncommuting product.
    In the expectation of the scalar signs, for sign indices $p_1 \, dots.h \, p_(2 l)$ we have
  $ bb(E)_s product_(u = 1)^(2 l) s_(p_u) = sum_(cal(B)) product_(B_0 in cal(B))
    (upright(bold(1))_({ p_u upright(" all equal for ") u in B_0 }) thin chi_(\| B_0 \|)) \, wide chi_b =
    frac(d^b, d z^b) log cosh z\|_(z = 0) $
  over set partitions $cal(B)$ of the $2 l$ places. Indeed the log of the generating expectation for
    $exp \( sum_u z_u s_(p_u) \)$ is $sum_p log cosh \( sum_(u : thin p_u = p) z_u \)$ as power series near 0.
    Exponentiating and taking the multilinear coefficient gives the expansion.
    Singletons have zero coefficient, and $\| chi_b \| lt.eq b ! C^b$ by analyticity near 0.
  In the term for a fixed partition with $h$ blocks of sizes at least 2,
    there are within-block index equalities in the sum of operator words $W_(p_1) dots.h.c W_(p_(2 l))$,
    but indices across blocks can be summed without distinctness restrictions.
    The norm of this contracted sum (before the factors $chi_b$) is bounded by $M^(2 h) K_0^(2 l - 2 h)$.
    To see this, apply from right to left, keeping an extra index register $bb(C)^m$ (with orthonormal basis
    indexed by pairs $p$) per open block in tensor product with the representation.
    On first encountering a block, use the column map $x mapsto sum_p W_p x ⊗ e_p$ of norm $M$,
    inserting its register; on final occurrence use its adjoint ($W_p = W_p^(*)$);
    on intermediate occurrences use $sum_p W_p ⊗ \| e_p chevron.r chevron.l e_p \|$ with that register,
    of norm at most $K_0$. At each step tensor with identities on other open registers and permute registers as
    needed. This composition realizes precisely the sum over assignments of indices to blocks,
    as the first encounter branches over the new index, intermediate encounters use that same index,
    and the final one sums it out.
  Summing absolute bounds using ordered compositions $b_1 + dots.h.c + b_h = 2 l$ with $b_i gt.eq 2$,
    partitions are accounted for with factor $\( 2 l \) ! \/ \( h ! product_i b_i ! \)$.
    The $b_i !$ cancel in the bound from $product_i \( b_i ! C^(b_i) \)$,
    there are at most $2^(2 l)$ compositions in total, and $\( 2 l \) ! \/ h ! lt.eq \( 2 l \)^(2 l - h)$.
    Now $l^(2 l - h) M^(2 h) K_0^(2 l - 2 h) = \( M sqrt(l) \)^(2 h) \( K_0 l \)^(2 l - 2 h)$ with $h lt.eq l$,
    giving (54).
  For $1 lt.eq l lt.eq k$, (54) and (51) imply $parallel bb(E)_s \( cal(R)^2 \/ \( n c \) \)^l parallel_lambda
    lt.eq \( C l \)^l$ ($M \/ sqrt(n c) lt.eq sqrt(2) \, med K_0 \/ sqrt(n c) lt.eq sqrt(2 \/ k)$).
    For $l > k$, use $parallel cal(R)^2 \/ \( n c \) parallel lt.eq c \/ n lt.eq k$ on $lambda$ instead,
    so the same bound holds. The exponential series, using $l ! gt.eq \( l \/ e \)^l$,
    now proves the $cal(R)$ bound in (53) at a sufficiently small $t_1 > 0$.
  #strong[The sum defect on injections.] The imbalance bound is now proved.
    For the sum defect we will first replace signs by an entrywise majorant,
    then bound that majorant through a Gaussian tensor calculation.
    This larger carrier avoids a factor $D_lambda$ in the estimate.
    We prove the first estimate in (53) on the whole ordered distinct $k$-tuple module $cal(V) =
    ell^2 \( X_(n \, k) \)$, which contains $V_lambda$. Embed $cal(V)$ in $\( bb(C)^n \)^(⊗ k)$ with the standard
    ordered tuple basis, so $U \( g \) \| x chevron.r = \| g x chevron.r$,
    and write $D_eq.not$ for its orthogonal projection. Let $cal(V)_(upright("sym")) subset.eq
    cal(V)$ consist of vectors invariant under permutations of the tensor slots.
    For a real vector $u$ on positions put $p_u = \| u chevron.r chevron.l u \| \/ n$ and $cal(L)^u =
    sum_(a = 1)^k p_u^(\( a \))$. On $cal(V)$, the identity $sum_i xi_i = 0$ gives
  #[#set math.equation(numbering: n => "(55)")
   $ Delta = - sum_(i < j) xi_i xi_j D_(i j) = n D_eq.not cal(L)^xi D_eq.not + B^xi \, wide \( B^xi f \) \( x \) =
     sum_(a < b) xi_(x_a) xi_(x_b) #scale(x: 120%, y: 120%)[\(] f \( x \) +
     f \( x^(a arrow.l.r b) \) #scale(x: 120%, y: 120%)[\)] \, $ <cas:e12>]
  where the tuple on the right interchanges two slots. In fact in the transposition sum one separates replacements
    of a single occupied position by an unoccupied one from interchanges of two occupied positions.
    Both have off-diagonal coefficient $xi_i xi_j$ for positions $i \, j$ involved.
    The diagonal at $x$, for its occupied set $X$, equals $- sum_(i in X \, thin j in.not X) xi_i xi_j -
    sum_(i < j : thin i \, j in X) xi_i xi_j = k + sum_(i < j : thin i \, j in X) xi_i xi_j$.
  #strong[Removing the opposite signs inside a switch pair.] All entries of powers of the last expression in (55)
    on distinct tuples are given by polynomials in the position variables with nonnegative coefficients before
    substituting the signs. Replace $xi$ by $v$ with $v_(p 0) = v_(p 1) =
    s_p$ in this expression (the resulting operator $tilde(Delta) = n D_eq.not cal(L)^v D_eq.not +
    B^v$ need not equal the transposition formula with that replacement).
    For any such monomial with the original signs, the absolute value of its average is bounded by its average
    with the replacement: both averages vanish on odd pair-index parity at any $p$, and the replacement gives $+
    1$ on all even parities. For $t gt.eq 0$, it follows by the series and triangle inequality that entrywise
  $ lr(|\( bb(E)_s e^(t Delta \/ n) \)_(x y)|) lt.eq \( bb(E)_s e^(t tilde(Delta) \/ n) \)_(x y) . $
  The latter matrix is real symmetric entrywise nonnegative and commutes with permutations of the tensor slots (in
    fact $tilde(Delta)$ commutes with them for every set of signs).
    Its operator norm, which bounds the former norm, is attained on slot-symmetric distinct tensors.
    Indeed a symmetric entrywise nonnegative matrix has a nonnegative eigenvector for its largest eigenvalue
    realizing the spectral radius (or maximize using entrywise absolute values in the Rayleigh bound),
    and here it can be averaged over slot permutations without vanishing.
    Entrywise domination in absolute value by nonnegative matrices bounds operator norm by applying them to
    entrywise absolute vectors.
  On the slot-symmetric distinct subspace use the orthonormal basis indexed by $k$-sets $X$,
    the normalized sums of orderings. In this basis $tilde(Delta)$ has diagonal
    $V_s \( X \) = \( sum_(i in X) v_i \)^2$, coming from $k$ on the diagonal of $n D_eq.not cal(L)^v
    D_eq.not$ and $2 sum_(i < j : thin i \, j in X) v_i v_j$ from $B^v$ on symmetric functions.
    Its off-diagonal is $v_i v_j$ between $X$ and $\( X \\ { i } \) union { j }$ ($i in X \, j in.not X$),
    zero otherwise. Let $J$ be the unweighted adjacency matrix of this single-exchange graph.
    Conjugating $tilde(Delta)$ by the diagonal signs $v_X = product_(i in X) v_i$ gives $J +
    V_s$ with $V_s$ diagonal. Thus in computing $\( e^(t tilde(Delta) \/ n) \)_(X Y)$ by this conjugation,
    the sign factor is $v_X v_Y = product_(p in O) s_p$, where $O =
    O \( X \, Y \)$ consists of pair indices of odd combined occupancy in $X \, Y$ (counting multiplicity).
    Write $h = \| O \|$, always even.
  #strong[A Gaussian bound along each path.] We need to average the endpoint sign $v_X
    v_Y$ together with the nonnegative potential $V_s$. An expansion over paths keeps this sign visible and turns
    the potential into a Gaussian covariance. In the exponential kernel of $\( J + V_s \) \/ n$ over duration $t$,
    expand in graph paths using $J \/ n$, with a multiplier on each timed path $X \( u \)$ given by
  $ exp (1 / n integral_0^t V_s \( X \( u \) \) thin d u) . $
  Specifically, using symmetry of the kernel, its $X \, Y$ entry is
  $ sum_(r = 0)^oo n^(- r) sum_(X = X_0 tilde.op X_1 tilde.op dots.h.c tilde.op X_r = Y)
    integral_(0 < u_1 < dots.h.c < u_r < t) exp (n^(- 1) sum_(i = 0)^r \( u_(i + 1) - u_i \) V_s \( X_i \)) thin d
    u_1 dots.h.c d u_r \, $
  where $tilde.op$ denotes adjacency in $J$, $u_0 = 0 \, med u_(r + 1) = t$, $X \( u \) =
    X_i$ between successive times $u_i \, u_(i + 1)$, and $r = 0$ means no jump ($X = Y$).
    This is the ordinary iterated exponential expansion (Duhamel iteration with the exponential of the diagonal
    term retained between jumps); it converges absolutely by boundedness in finite dimension and the simplex
    volumes $t^r \/ r !$. The nonnegative baseline weights without the multipliers sum to
    $\( e^(t J \/ n) \)_(X Y)$. On a fixed timed path let $b_p \( u \) in { 0 \, 1 \,
    2 }$ denote occupancy at pair $p$, so $sum_p b_p = k$. Define a centered real Gaussian $z$ on the $m$ pair
    indices with covariance
  $ H = 2 / n integral_0^t b \( u \) b \( u \)^top thin d u . $
  The path multiplier is $bb(E)_z exp \( sum_p z_p s_p \)$.
    Thus after including $v_X v_Y$, averaging the signs on the path gives $bb(E)_z product_(p in O) sinh z_p
    product_(p in.not O) cosh z_p$, bounded in absolute value by $bb(E)_z e^(parallel z parallel_2^2 \/ 2)
    product_(p in O) \| z_p \|$, using $cosh y lt.eq e^(y^2 \/ 2)$,
    $\| sinh y \| lt.eq \| y \| e^(y^2 \/ 2)$ (by the series).
    We have $"Tr" H lt.eq 4 k t \/ n$, $H_(p p) lt.eq 8 t \/ n$.
    From now on take $t = t_0 log \( e n \/ k \)$ for an absolute $t_0 > 0$ sufficiently small,
    starting with $t_0 lt.eq 1 \/ 8$; then $"Tr" H lt.eq 1 \/ 2$ since $\( k \/ n \) log \( e n \/ k \) lt.eq 1$.
    Tilting the Gaussian by $e^(parallel z parallel_2^2 \/ 2)$ gives mass $det \( I - H \)^(- 1 \/ 2) lt.eq
    e^("Tr" H)$ and covariance $H \( I - H \)^(- 1) lt.eq 2 H$ after normalization,
    as seen in an eigenbasis (allowing zero eigenvalues, and using $- log \( 1 - y \) lt.eq 2 y$ for $0 lt.eq
    y lt.eq 1 \/ 2$). By scalar Gaussian absolute moments and Hölder on the $h$ factors,
    the sign-averaged path multiplier with the endpoint sign included has absolute value at most
  $ C #scale(x: 120%, y: 120%)[\(] C_1 sqrt(t h \/ n) #scale(x: 120%, y: 120%)[\)]^h $
  with the power taken as 1 if $h = 0$. The constants $C \, C_1$ here can be taken absolute for all $0 < t_0 lt.eq
    1 \/ 8$, using e.g. $bb(E) \| Z \|^h = \( h - 1 \) ! ! lt.eq
    h^(h \/ 2)$ for a standard normal $Z$ and positive even $h$.
    Uniformly summing the path weights, we have on this symmetric subspace the entrywise nonnegative averaged
    matrix $bb(E)_s e^(t tilde(Delta) \/ n)$ bounded entrywise above by
  #[#set math.equation(numbering: n => "(56)")
   $ C \( e^(t J \/ n) \)_(X Y) #scale(x: 120%, y: 120%)[\(] C_1 sqrt(t h \/ n) #scale(x: 120%, y: 120%)[\)]^h .
     $ <cas:e13>]
  #strong[Absorbing the endpoint factor into a tensor operator.] The path estimate (56) still depends on $h$,
    the number of pair indices with odd endpoint occupancy. A common Gaussian coordinate will supply exactly the
    moments needed to absorb this factor. After that comparison,
    only the norm of one explicit positive tensor average remains.
    We absorb this extra weight into a tensor operator. With $upright(bold(1))$ the all-ones vector on positions,
    on the same symmetric distinct basis $\( J + k I \) \/ n$ is the restriction of $D_eq.not
    cal(L)^(upright(bold(1))) D_eq.not$. All slot sums here commute with slot permutations.
    We can drop a scalar factor $e^(- t k \/ n)$, and in the remaining exponential power series use entrywise
    nonnegativity in the ordered basis to drop the distinctness requirement on intermediates (then compare on
    normalized sums of orderings). Thus $e^(t J \/ n)$ is bounded entrywise by the symmetric-distinct compression of
  $ e^(t cal(L)^(upright(bold(1)))) = ⨂_(a = 1)^k \( I + beta p_(upright(bold(1))) \) \, wide beta = e^t - 1 . $
  To dominate the weight depending on $O \( X \, Y \)$ as well, take a duplicated Gaussian vector $g$ on positions with
  $ g_(p 0) = g_(p 1) = g'_p + y_(*) \, $
  where $g'_p$ are independent standard real Gaussians and $y_(*)$ is an independent centered real Gaussian of
    variance $C_(*) t \/ n$. Then (56) is bounded entrywise by $C$ times the symmetric distinct compression of
  #[#set math.equation(numbering: n => "(57)")
   $ G_t := bb(E)_g ⨂_(a = 1)^k \( I + beta p_g \) . $ <cas:e14>]
  Indeed expand each tensor product, checking on ordered endpoints $x \, y$ with sets $X \, Y$.
    Identity slots (inactive in a contributing term) require the same position at both ends.
    Thus in the active slots $E subset.eq \[ k \]$, the occurrences of pair indices among $x_a \,
    y_a$ for $a in E$ have the same parities (odd-index set $O \( X \, Y \)$).
    In (57) we get the additional factor $bb(E)_g product_(a in E) g_(x_a)
    g_(y_a)$ compared to the tensor expansion with $p_(upright(bold(1)))$.
    The Gaussian monomial expectations are nonnegative; expanding $g$,
    assign for each odd pair-index one occurrence to $y_(*)$ and the remaining occurrences everywhere to the
    independent $g'_p$, all the latter degrees then even. Those even moments of standard normals are at least 1,
    and for positive even $h$, $bb(E) y_(*)^h = \( C_(*) t \/ n \)^(h \/ 2) \( h - 1 \) ! !
    gt.eq \( C_1 sqrt(t h \/ n) \)^h$ by taking $C_(*)$ absolutely large enough; for instance $\( h - 1 \) ! ! =
    h ! \/ \( 2^(h \/ 2) \( h \/ 2 \) ! \) gt.eq \( h \/ e^2 \)^(h \/ 2)$.
    This also works with moment 1 at $h = 0$. Other assignments contribute nonnegative expectations.
    Summing over orderings with the basis normalizations for the symmetric-distinct compression preserves the
    entrywise bound.
  Let $Q : cal(V)_(upright("sym")) arrow.r \( bb(C)^n \)^(⊗ k)$ be the isometric inclusion,
    whose $k$-set basis vectors are normalized sums of their orderings. The comparisons just proved give
  #[#set math.equation(numbering: n => "(58)")
   $ parallel bb(E)_s e^(t Delta \/ n) parallel_(V_lambda) & lt.eq parallel bb(E)_s e^(t Delta \/ n) parallel_(cal(V))\
 & lt.eq parallel bb(E)_s e^(t tilde(Delta) \/ n) \|_(cal(V)_(upright("sym"))) parallel_(upright("op"))\
 & lt.eq C parallel Q^(*) G_t Q parallel_(upright("op")) lt.eq
   C parallel G_t parallel_(upright("op")) . $ <cas:gaussian-norm-chain>]
  The middle inequalities use entrywise domination in the indicated orthonormal bases and the nonnegative
    eigenvector argument above. The last inequality is the norm bound for an orthogonal compression.
    It remains to prove $parallel G_t parallel_(upright("op")) lt.eq 2$ on the full tensor product.
  #strong[Bounding the Gaussian tensor average.] On the one-slot space,
    $p_g$ is supported on the pair-sum subspace with orthonormal basis $\( e_(p 0) + e_(p 1) \) \/ sqrt(2)$.
    There it becomes $\| tilde(g) chevron.r chevron.l tilde(g) \| \/ m$, where $tilde(g)_p = g'_p +
    y_(*)$ has covariance $I + \( C_(*) t \/ n \) upright(bold(1)) upright(bold(1))^top$ in $m$ dimensions.
    Splitting each slot into this subspace and its orthogonal complement makes $G_t$ block diagonal.
    Complementary slots contribute identity, so a block with $r lt.eq
    k$ pair-sum slots requires a bound only on $\( bb(C)^m \)^(⊗ r)$.
  Diagonalize the covariance by a real orthogonal change of basis.
    The new coordinates are independent centered Gaussians with variances at most $Gamma = 1 + C_(*) t \/ 2$.
    In this basis, every averaged monomial in the tensor expansion is zero or a nonnegative product of even
    moments. Increasing all these variances to $Gamma$ therefore gives an entrywise upper bound,
    and hence an operator-norm upper bound.
  The resulting comparison matrix for independent coordinates of variance $Gamma$ is entrywise nonnegative and
    commutes with slot permutations. A nonnegative norm-maximizing eigenvector can again be averaged over these
    permutations without vanishing. It therefore suffices to bound the matrix on $"Sym"^r \( bb(C)^m \)$.
  We have reduced the problem to symmetric tensors in $m$ independent Gaussian coordinates.
    The next calculation bounds each coefficient of the tensor product.
    Its dependence on the degree is what permits a geometric sum even when $t$ grows like $log \( e n \/ k \)$.
    Here are details of the Gaussian norm estimate there, now using $tilde(g)$ as the vector for the i.i.d.
    coordinate comparison. Use creation and annihilation operators $a_i^dagger \,
    a_i$ on the algebraic direct sum of symmetric tensor powers (only acting between finite degrees here),
    where on normalized occupation vectors with $n_i$ copies of basis vector $i$ they raise or lower $n_i$ with
    coefficients $sqrt(n_i + 1)$ or $sqrt(n_i)$, respectively (zero for lowering at 0).
    For the real vector $tilde(g)$ write $a \( tilde(g) \) = sum_i tilde(g)_i a_i$.
    Restricted to symmetric degree $r$, for $0 lt.eq j lt.eq r$ the sum over all size-$j$ subsets of slots of the
    product of $\| tilde(g) chevron.r chevron.l tilde(g) \| \/ m$ in active slots is
  $ frac(\( a \( tilde(g) \)^dagger \)^j a \( tilde(g) \)^j, j ! thin m^j) . $
  One can see this in an orthonormal basis with first vector along $tilde(g)$,
    counting the choices of $j$ copies among those in its first mode:
    on an occupation vector for this basis with first-mode occupancy $n'_1$,
    both sides multiply by $binom(n'_1, j) \( parallel tilde(g) parallel_2^2 \/ m \)^j$.
    Here creation along a vector, from degree $u$, equivalently inserts that vector then projects to symmetric
    tensors with the factor $sqrt(u + 1)$, with lowering the adjoint,
    so creation/annihilation along a unit direction obey the same formulas in a basis containing that unit vector.
    (At the zero vector the identity for the subset sum is immediate.) Take expectation with the i.i.d.
    Gaussian coordinates. The scalar Gaussian pairing identity #cite(label("Isserlis1918")) gives an order-$2
    j$ scalar moment as a sum over all pairings of the $2 j$ places,
    with factor $Gamma upright(bold(1))_({ i = i' })$ per pair of coordinate indices $i \,
    i'$ (also seen by differentiating the Gaussian moment generating function).
    Applied to the numerator in the operator formula, it sums over pairings of the scalar coefficients of creators
    and annihilators, leaving normal order of the operators. Put $A = sum_i a_i^2$ and let $cal(N) =
    sum_i a_i^dagger a_i$ be tensor degree. For $ell$ creator-creator pairs there are also $ell$
    annihilator-annihilator pairs and a bijective pairing across the remaining $j - 2 ell$ of each.
    Each fixed pairing in the numerator gives factor $Gamma^j$ times the contracted operator
  $ \( A^dagger \)^ell thin cal(N)^(underline(j - 2 ell)) thin A^ell \, $
  using falling powers $x^(underline(q')) = x \( x - 1 \) dots.h.c \( x - q' + 1 \)$,
    including $x^(underline(0)) = 1$. Indeed creators commute among themselves,
    as do annihilators among themselves. The cross terms in the middle sum a normally ordered removal and
    replacement of an ordered selection of $q' = j - 2 ell$ particles:
    on occupations $\( n_i \)$ this counts $\( sum_i n_i \)^(underline(q'))$,
    since a given ordered list of modes with multiplicities $d_i$ contributes $product_i n_i^(underline(d_i))$.
    There are $j ! \/ \( \( j - 2 ell \) ! thin 2^ell ell ! \)$ choices of the internal pairs on each side and
    $\( j - 2 ell \) !$ bijections of the remaining places. Thus after division by $j !$ the count coefficient is
    $j ! \/ \( \( j - 2 ell \) ! thin 2^(2 ell) \( ell ! \)^2 \) lt.eq binom(j, 2 ell)$.
  On degree $u$, $parallel A parallel^2 lt.eq u \( u + m \)$, writing the norm for the action out of that degree.
    This follows using $\[ a_i \, a_j^dagger \] = upright(bold(1))_({ i = j }) I$, hence $\[ A \, A^dagger \] =
    4 cal(N) + 2 m I$. For $u gt.eq 2$ the squared norm out of $u$ is the norm of $A A^dagger$ on $u - 2$,
    which equals the squared norm out of $u - 2$ plus $4 \( u - 2 \) + 2 m$;
    the sequence starts with 0 on degrees 0,1. This gives the bound by induction.
    For $1 lt.eq j lt.eq r$, out of degree $r$ the squared norm of $A^ell$ is thus at most
    $\( r \( r + m \) \)^ell$ for $2 ell lt.eq j$, and the middle falling power of $cal(N)$ in the contracted
    operator is evaluated on degree $r - 2 ell$, bounded there by $r^(j - 2 ell)$.
    Consequently the norm of the averaged size-$j$ sum on the symmetric subspace in this range is at most
  $ \( Gamma \/ m \)^j sum_(0 lt.eq ell lt.eq j \/ 2) binom(j, 2 ell) r^(j - 2 ell) \( r \( r + m \) \)^ell lt.eq
    (Gamma / m \( r + sqrt(r \( r + m \)) \))^j $
  (and use the bound 1 at $j = 0$ for the identity).
  For sufficiently small absolute $t_0$ this sums in (57), since
  $ \( e^t - 1 \) \( 1 + C_(*) t \/ 2 \) thin frac(k + sqrt(k \( k + m \)), m) lt.eq 1 / 2 . $
  In fact the last ratio is at most $C sqrt(x)$ for $x = k \/ n in \( 0 \, 1 \]$.
    Since $e^t - 1 lt.eq t e^t$ and $t = t_0 log \( e \/ x \)$, the expression is bounded by an absolute multiple of
  $ t_0 log \( e \/ x \) x^(1 \/ 2 - t_0) + C_(*) t_0^2 log \( e \/ x \)^2 x^(1 \/ 2 - t_0) . $
  For $0 < t_0 lt.eq 1 \/ 8$, both powers of the logarithm times $x^(1 \/ 2 - t_0) lt.eq
    x^(3 \/ 8)$ are uniformly bounded. With $C_(*)$ already fixed by the endpoint comparison,
    we may therefore decrease $t_0$ until the displayed geometric ratio is at most $1 \/ 2$.
  The sum with coefficients $beta^j$, $0 lt.eq j lt.eq r$, then has norm at most two in every sector.
    Hence $parallel G_t parallel_(upright("op")) lt.eq 2$. Equation (58) now bounds $parallel bb(E)_s
    e^(t Delta \/ n) parallel_(V_lambda)$ by an absolute constant, completing (53). ◻
]

==== 8.2.2 Induction of the operator bound <induction-of-the-operator-bound>

The two split moments now control the change in the potential $Phi_n$.
  We first derive that scalar comparison, then use the extra factor $B^(- 1)$ from two nontrivial children to
  close the induction. For the split with fixed halves (the children in the recursion),
  denote by $H_1$ the outer switch group. In $lambda eq.not \( n \)$,
  to bound the norm of $K_n$ it suffices to bound its Rayleigh values on unit vectors $v$ invariant under $H_1$,
  since $K_n$ is positive semidefinite and compressed by the projection $Pi_1$ onto these invariants (if there is
  no such vector the norm is zero). For such a vector, the Rayleigh value is that for the operator of the middle
  product law from the two independent children, since $Pi_1 v = v$.
  Under restriction to $S_m times S_m$, decompose into an orthogonal sum of product irreducibles (using the usual
  tensor-product form of irreducibles of a direct product of finite groups),
  with the joint partial Casimir values $c_0 \, c_1$ from the two factors.
  We use $c_0 \, c_1$ as classical random variables with the joint spectral probabilities in $v$, i.e.
  squared norms of the joint spectral projections applied to $v$.
  Their law for this fixed split is also their law for each split in the sign randomization used in (53):
  any such transversal split is the image of the fixed one by an element of $H_1$, which fixes $v$,
  and the operators for the splits correspond by conjugation. Write

$ D_0 = c - 2 \( c_0 + c_1 \) \, wide D_1 = c_0 - c_1 \, wide cal(E) = Phi_n \( c \) - Phi_m \( c_0 \) -
  Phi_m \( c_1 \) . $

In this scalar law we have $bb(E) e^(t D_0 \/ n) lt.eq C_0$ and $bb(E) e^(t_1 D_1^2 \/ \( n c \)) lt.eq
  C_0$ by (53) evaluated against $v$. Also $\| D_0 \| \, \| D_1 \| lt.eq c$.
  Put $u = c \/ n$ and $x_i = 4 c_i \/ c$ for $i = 0 \, 1$, with mean $macron(x)$ of the two $x_i$. Then

$ cal(E) = u #scale(x: 120%, y: 120%)[\[] \( 1 - macron(x) \) \( 2 + log \( n \/ u \) \) + 1 /
  2 sum_(i = 0)^1 x_i log x_i #scale(x: 120%, y: 120%)[\]] lt.eq D_0 / n \( 1 + log \( n \/ u \) \) +
  frac(D_0^2 + 4 D_1^2, n c) \, $

where $0 log 0 = 0$, $x log x lt.eq \( x - 1 \) + \( x - 1 \)^2$ for $x gt.eq 0$, and $x_0 - 1 = - D_0 \/ c +
  2 D_1 \/ c \, med x_1 - 1 = - D_0 \/ c - 2 D_1 \/ c$. Using $\| D_0 \| lt.eq c$ and $log \( n \/ u \) gt.eq 0$,
  the $D_0$ terms on the right are at most $\( D_0 \)_(+) \( 2 + log \( n \/ u \) \) \/ n$, writing $z_(+) =
  max \( z \, 0 \)$. Here $k \/ 2 lt.eq u lt.eq k$, so $2 + log \( n \/ u \) lt.eq C log \( e n \/ k \)$.
  For an absolute $a_0 > 0$ sufficiently small we have $2 a_0 \( 2 + log \( n \/ u \) \) lt.eq t \, med
  8 a_0 lt.eq t_1$. Cauchy–Schwarz under the scalar law therefore gives

$ bb(E) e^(a_0 cal(E)_(+))
  lt.eq \( bb(E) e^(t \( D_0 \)_(+) \/ n) \)^(1 \/ 2) \( bb(E) e^(t_1 D_1^2 \/ \( n c \)) \)^(1 \/ 2) lt.eq C $

using (53) as above and $e^(t \( D_0 \)_(+) \/ n) lt.eq 1 + e^(t D_0 \/ n)$. In particular

#[#set math.equation(numbering: n => "(59)")
 $ bb(E) e^(eta cal(E)_(+)) lt.eq 1 + C' eta wide \( 0 lt.eq eta lt.eq a_0 \) $ <cas:e15>]

by decreasing the exponent via Hölder ($C^(eta \/ a_0) lt.eq 1 + \( C - 1 \) eta \/ a_0$ for $C gt.eq 1$). Also

#[#set math.equation(numbering: n => "(60)")
 $ Pr \( c_0 = 0 upright(" or ") c_1 = 0 \) lt.eq Pr \( D_0 gt.eq c \/ 2 \) +
   Pr \( \| D_1 \| gt.eq c \/ 4 \) lt.eq C exp \( - c' k \) $ <cas:e16>]

for an absolute $c' > 0$. Indeed if one $c_i = 0$, either their sum is at most $c \/ 4$ or $\| c_0 - c_1 \| gt.eq
  c \/ 4$. The two probability terms are bounded by $C_0 e^(- t c \/ \( 2 n \))$ and $C_0
  e^(- t_1 c \/ \( 16 n \))$ using (53), with (51). Take an absolute integer $K$ large enough that for $k gt.eq
  K$ the probability of a zero $c_i$ in (60) is at most $1 \/ 4$.

Assuming (52) on the nontrivial child irreducibles, the Rayleigh value above is bounded by

$ bb(E) thin B^(- z) exp #scale(x: 120%, y: 120%)[\[] - eta \( Phi_m \( c_0 \) + Phi_m \( c_1 \) \)
  #scale(x: 120%, y: 120%)[\]] \, quad z = upright(bold(1))_({ c_0 > 0 }) + upright(bold(1))_({ c_1 > 0 }) \, $

by taking the operator norm product on each product summand (there the middle operator is the tensor product of
  the two child $K_m$’s in the respective irreducibles; trivial factors have norm 1 and $c_i = 0$).
  For $k gt.eq K$ and $1 < B lt.eq 2$,

$ bb(E) B^(1 - z) lt.eq 1 - 1 / 8 \( B - 1 \) $

by (60), since $z = 2$ has probability at least $3 \/ 4$ with deficit $1 - 1 \/ B$,
  and otherwise the excess over 1 is at most $B - 1$. Using (59) and $B^(1 - z) lt.eq 2$ gives

$ bb(E) \[ B^(1 - z) e^(eta cal(E)) \] lt.eq 1 - \( B - 1 \) \/ 8 + 2 C' eta lt.eq 1 $

if $eta > 0$ is sufficiently small depending on $B$ (and $eta lt.eq a_0$).
  This gives the required bound on the Rayleigh value and is the induction step for (52) when $k gt.eq K$.

#strong[The remaining fixed levels.] The induction just proved applies when $k gt.eq K$.
  For the finitely many smaller levels, a simpler form of the isolated-path cancellation suffices:
  we may allow constants depending on $k$ and bound a Hilbert–Schmidt norm directly.
  Proposition 17 obtains constants uniform in $k$ by estimating a squared kernel and using Schur’s test.
  We give the fixed-$k$ argument here so the base of this induction uses only harmonic zero sums and the
  elementary forest count below.

#thm([Lemma 8.4.])[
  (Fixed first-row deficit).  #emph[For every fixed integer $k gt.eq 2$ there are constants $C_k \,
    n_k$ such that, for every dyadic $n = 2^d gt.eq n_k$ and every $lambda tack.r n$ with $lambda_1 = n - k$,
$ parallel K_n \( lambda \) parallel_(upright("op")) lt.eq C_k \( d \/ n \)^(k \/ 2) . $

 For $k = 1$, $K_n \( lambda \) = 0$ at every admissible size.]
] <cas:fixed-level>

#proof[
  For $k = 1$, the directed sweep sends a single position uniformly over all positions (each new bit is fair
    conditionally as its layer is reached), so the nontrivial irreducible with $n - lambda_1 =
    1$ is annihilated on the one-position module. For fixed $k gt.eq 2$ and large $n$,
    take a function $f$ in the $lambda$ subspace of the ordered distinct $k$-tuple module with $lambda_1 = n - k$.
    It is orthogonal to functions omitting any slot, by the branching facts (each such entire function space is of
    types available with $k - 1$ slots). Testing against indicators specifying the other slots,
    we see its extension by zero to the unrestricted tuple space has zero sum in each slot with the others fixed
    (also automatically so if the others are not distinct).
  From a given distinct $x$ to a candidate $y$ in a directed sweep,
    each proposed path is determined by those two endpoints: updated bits must already equal the corresponding
    bits of $y$. For tags $a \, b$, let $h = h_(a b)$ be the largest differing bit index of $x_a \, x_b$.
    At layer $h$ their paths use a shared switch exactly if their $y$-bits before $h$ agree,
    in which case they require opposite $y$-bits at $h$ for validity.
    They cannot share at an earlier layer (look at bit $h$), or at a later layer on a valid route (their prefixes
    through $h$ must then differ). A collision making routing impossible occurs if some such pair instead agrees
    in $y$ through $h$; conversely if this never occurs all paths are on distinct positions at every boundary
    (compare the unupdated suffix of $x$ before processing $h$,
    or the updated prefix of $y$ once $h$ has been processed, for each pair).
    In that case the needed switch choices are consistent: at a shared switch the two tags distinct before it are
    sent to distinct outputs of the switch. Each used switch coin is prescribed,
    with a shared switch reducing the number of prescriptions by one from one-per-tag-per-layer.
    It follows that the kernel for the directed sweep on these tuples, extended by zero to invalid $y$,
    is $n^(- k) F_(\[ k \])$, using the functions
  $ F_S =
    product_(a < b : med a \, b in S)
    (1 - upright(bold(1))_({ y_(a \, < h_(a b)) = y_(b \, < h_(a b)) }) \( - 1 \)^(y_(a \, h_(a b)) + y_(b \, h_(a
    b)))) . $
  Here the $< h$ subscript extracts the indicated prefix, possibly empty.
    Each factor on a valid route is 2 for a shared switch, 1 otherwise.
    Against the extended $f$ summed on the unrestricted tuple space, we can replace $F_(\[ k \])$ by $F' =
    sum_(S subset.eq \[ k \]) \( - 1 \)^(k - \| S \|) F_S$ by the zero sums ($F_S$ uses no $y$-slots outside $S$).
    It is bounded by a constant depending on $k$, and cancels to zero if any vertex is isolated in the graph on
    tags with potential interaction edges $y_(a \, < h_(a b)) = y_(b \, < h_(a b))$:
    adding an isolated vertex does not change $F_S$.
  With uniform distinct $x$ and independent unrestricted uniform $y$,
    the probability of no isolates is at most $C_k \( d \/ n \)^(ceil.l k \/ 2 ceil.r)$ for large $n$.
    Indeed then the graph contains a spanning forest with no isolates, thus at least $ceil.l k \/ 2 ceil.r$ edges.
    For unrestricted independent uniform coordinates also in $x$,
    the constraints along any such forest (requiring $x_a eq.not
    x_b$ along its edges and the indicated prefix matches) cost $\( d \/ n \)^(\# upright("edges"))$ by
    successively integrating leaves. Given the other tags’ values at a leaf-removal step,
    each possible last differing index $h in { 1 \, dots.h \,
    d }$ relative to the neighbor of the leaf has probability $2^(h - 1) \/
    n$ in $x$ and the prefix match in $y$ costs $2^(- \( h - 1 \))$, totaling $d \/ n$.
    Conditioning $x$ to be globally distinct costs at most factor 2 for large $n$ at fixed $k$,
    and there are only boundedly many forests at fixed $k$ in the union bound.
  Thus with these tuple measures (distinct for $x$, unrestricted for $y$),
    $bb(E)_(x \, y) \| F' \( x \, y \) \|^2 lt.eq C_k \( d \/ n \)^(ceil.l k \/ 2 ceil.r)$.
    The kernel applied to $f$ at $x$ is $bb(E)_y F' \( x \, y \)
    tilde(f) \( y \)$ with $tilde(f)$ the zero extension. By Cauchy–Schwarz in $y$,
    then taking the norm using uniform distinct $x$, the output norm is at most $C_k \( d \/ n \)^(k \/ 4)
    parallel f parallel_2$; here the $L^2$-norms use probability measures and the unrestricted norm of $tilde(f)$
    is no larger than $parallel f parallel_2$. This kernel on distinct-tuple functions is $T_n^(*)$ for the action
    permuting the tuple basis. Since $lambda$ occurs and the averaged permutations preserve its subspace,
    $parallel T_n^(*) parallel_lambda = parallel T_n parallel_lambda$ gives
  $ parallel K_n parallel_lambda lt.eq C_k \( d \/ n \)^(k \/ 2) $
  for each fixed $k gt.eq 2$ at large $n$. ◻
]

#strong[Choosing the constants and completing the induction.] Both the large-level induction and the fixed-level
  bound have been proved. The choices below make them hold with one pair of absolute constants on every dyadic
  size. First fix the integer $K$ from (60). Since $c \/ n lt.eq
  k$ and $u \( 2 + log \( n \/ u \) \)$ is increasing for $0 < u lt.eq n$,

$ Phi_n \( c \) lt.eq k \( 2 + log \( n \/ k \) \) . $

For each $1 lt.eq k < K$, Lemma 24 gives a bound $o \( n^(- k \/ 8) \)$.
  There is therefore one absolute $n_0$ such that these bounds imply (52) whenever $n > n_0$,
  simultaneously for all $1 < B lt.eq 2$ and $0 < eta lt.eq 1 \/ 8$. Indeed throughout those ranges,

$ B^(- 1) e^(- eta Phi_n \( c \)) gt.eq 1 / 2 e^(- k \/ 4) k^(k \/ 8) n^(- k \/ 8) . $

Only finitely many sizes and shapes remain. On each nontrivial shape at $n lt.eq n_0$,
  the norm of $K_n$ is strictly less than one by Lemma 3: equality would give a vector fixed by every coordinate
  layer and hence by the hypercube edge transpositions, which generate $S_n$.
  Choose $1 < B lt.eq 2$ close enough to one that $B^(- 1)$ strictly exceeds all these finitely many norms.
  Then choose $eta > 0$ small enough to satisfy (52) on this finite set, $eta lt.eq min \( 1 \/ 8 \, a_0 \)$,
  and the large-level induction condition $2 C' eta lt.eq \( B - 1 \) \/ 8$ from (59).

The direct fixed-level estimates now cover $k < K$ above $n_0$, and the induction step covers $k gt.eq K$.
  This proves (52) on every dyadic size with one pair of absolute constants $B \, eta$.

=== 8.3 Hausdorff–Young amplification to the full permutation <hausdorffyoung-amplification-to-the-full-permutation>

We have separately proved a uniform injection-density bound and an operator contraction.
  To combine them, first convert the density bound into the $65$th trace moment in a single irreducible.
  Then use the operator contraction for the remaining sweep factors.
  The passage to powers of $T_n$ uses Schatten Hölder, so it does not require $T_n$ to be normal.

We view probability laws on $S_n$ also by their densities relative to normalized uniform measure.
  For a density or function $f$, use Fourier matrix $hat(f) \( lambda \) =
  bb(E)_(g med upright("uniform")) f \( g \) U_lambda \( g \)$,
  with $U_lambda$ a unitary irreducible of dimension $d_lambda = f^lambda$.
  By finite group orthogonality/Plancherel, $parallel f parallel_2^2 =
  sum_lambda d_lambda parallel hat(f) \( lambda \) parallel_(upright("HS"))^2$ with the (unnormalized)
  Hilbert–Schmidt norm; this holds with the displayed convention since one is expanding against the complex
  conjugates of matrix coefficients (scaled by $sqrt(d_lambda)$ for an orthonormal basis).
  We need the single-irrep Hausdorff–Young bound #cite(label("garcia-cuerva-parcet2004")) Lemma 5.1(1),
  using Schatten norms $S^s$ (the $ell^s$-norms of the singular values, with $S^oo$ the operator norm):

#[#set math.equation(numbering: n => "(61)")
 $ d_lambda^(1 \/ s) parallel hat(f) \( lambda \) parallel_(S^s) lt.eq parallel f parallel_p \, wide 1 < p lt.eq
   2 \, quad s = p \/ \( p - 1 \) . $ <cas:e17>]

For completeness, at $p = 1 \, s = oo$ the bound without dimension factor is unitarity, and at $p = s =
  2$ it follows from Plancherel. To interpolate, pair by trace against a matrix $A$ of $S^p$-norm 1 and take
  $parallel f parallel_p = 1$, ignoring the trivial zero case.
  In $0 lt.eq "Re" z lt.eq 1$, replace $f$ by $f_z$ using its phases times $\|
  f \|^(p \( 1 - z \/ 2 \))$ at nonzero entries (keep zeros);
  similarly in a singular value factorization of $A$ keep both unitary factors and replace nonzero singular values
  $beta$ by $beta^(p \( 1 - z \/ 2 \))$ to give $A_z$. Apply the three-lines theorem to $d_lambda^(z \/ 2)
  "Tr" \( A_z hat(f)_z \( lambda \) \)$. On the first boundary use $L^1 arrow.r S^oo$ and the trace norm of $A_z$,
  on the second $L^2 arrow.r S^2$ and Hilbert–Schmidt; the norms of the inputs in these bounds are 1 and the
  analytic family is bounded on the strip. Taking $z = 2 \( 1 - 1 \/ p \)$ and Schatten duality proves (61).

#strong[The injection multiplicity and the $65$th moment.] The density estimate controls the Fourier matrix after
  averaging over a tuple stabilizer. Averaging these stabilizer projections in turn recovers $K_n$ at the cost of
  the ratio $D_lambda \/ f^(macron(lambda))$. This ratio is at most $binom(n, k)$,
  even when the lower-diagram dimension $f^(macron(lambda))$ is large.
  It is this multiplicity comparison that allows a level-dependent density bound to control the dimension-weighted
  trace moment. Take $p = 1 + delta$ from (49), so $s = 65$.
  For a fixed nontrivial $lambda$, use $k = n - lambda_1$. For ordered distinct $x$,
  average the density of $nu_n$ over right multiplication by its tuple stabilizer $H_x$.
  The resulting function is $g mapsto R_x \( g x \)$, with $L^p$-norm bounded by (49);
  its Fourier matrix in $lambda$ is $K_n P_x$, where $P_x$ is the average of $U_lambda$ over $H_x$.
  Averaging these projections in $x$ uniformly gives $\( f^(macron(lambda)) \/ d_lambda \) I$,
  by conjugation symmetry, Schur’s lemma and the fixed-space dimension above.
  By (61) and the triangle inequality in $S^s$ we have in $lambda$

$ d_lambda^(1 \/ s) \( f^(macron(lambda)) \/ d_lambda \) parallel K_n parallel_(S^s) =
  d_lambda^(1 \/ s) parallel bb(E)_x K_n P_x parallel_(S^s) lt.eq exp \( C k log \( e n \/ k \) \) . $

Taking the $s$-th power and using (50) gives

#[#set math.equation(numbering: n => "(62)")
 $ d_lambda "Tr"_lambda \( K_n^s \) lt.eq (d_lambda / f^(macron(lambda)))^s exp \( C s k log \( e n \/ k \) \)
   lt.eq exp \( C_2 k log \( e n \/ k \) \) . $ <cas:e18>]

Here $K_n$ is positive semidefinite and $C_2$ is absolute (using $binom(n, k) lt.eq \( e n \/ k \)^k$).

#strong[Completion for directed sweeps.] After $l$ directed sweeps with integer $l > s$,
  the nontrivial Fourier matrices of the position permutation law/density are $T_n^l$.
  Subtracting 1 from the density keeps these and gives zero in the trivial representation.
  Schatten Hölder for matrix products gives $parallel T_n^s parallel_(upright("HS")) lt.eq
  parallel T_n parallel_(S^(2 s))^s$, so in nontrivial $lambda$

$ parallel T_n^l parallel_(upright("HS"))^2 lt.eq parallel K_n parallel_lambda^(l - s) "Tr"_lambda \( K_n^s \) . $

Choose a fixed absolute integer $l > s$ sufficiently large, with $\( l - s \) a - C_2 gt.eq
  4$ using $a$ from the consequence of (52). By (52), (62) and Plancherel,
  the squared $L^2$ distance of the density to 1 is bounded by

$ sum_(k = 1)^(n - 1) 2^k exp #scale(x: 120%, y: 120%)[\(] - 4 k log \( e n \/ k \) #scale(x: 120%, y: 120%)[\)] =
  o \( 1 \) . $

We used that the number of shapes with a given $k$ is bounded by the number of partitions of $k$, hence by $2^k$,
  and increased $l$ so the exponent bound applies before counting shapes.
  The sum tends to zero, for example splitting at $sqrt(n)$ and using $log \( e n \/ k \) gt.eq
  1$ in the large range. Total variation is at most half the $L^2$ distance by Cauchy–Schwarz.
  The estimate is independent of the starting permutation, since changing that permutation translates the law.
  As one sweep consists of $d$ physical shuffles, this proves Theorem 21.

== 9 Harmonic restriction and cycle moments <rec:sec-harmonic>

The density estimates already proved describe the joint routes of tracked cards.
  We now retain more of the representation carried by those cards.
  For a diagram whose first row has length $n - k$, its first occurrence on ordered tuples has exactly $k$ slots.
  Summing out any one slot therefore annihilates that representation.
  This harmonic cancellation controls how much of its level can disappear when the network splits into two halves.

The first goal is a contraction on the scale $k log \( e n \/ k \)$.
  A separate cycle-moment estimate will then control the dimension of the diagram below the first row.
  We give two transfers from that moment, one by clipping kernel entries and one by averaging matrix coefficients.
  Both retain the lower-diagram dimension, whereas the final tuple-trace argument can sum all representations
  without separating that dimension.

Let $T_n$ be one sweep on $n = 2^d$ positions, and put $K_n = T_n^(*) T_n$.
  Reversing the coordinate order conjugates this law to the law of $T_n
  T_n^(*)$ by the permutation that reverses the binary coordinates.
  Thus all statements below also hold for that orientation,
  with the same constants and with the starting tuple relabeled by this permutation.
  At the one-position base, the empty product gives $T_1 = K_1 = I$. If $n = 2 m$, then

#[#set math.equation(numbering: n => "(63)")
 $ K_n = P \( K_m ⊗ K_m \) P \, $ <rec:network-recursion>]

where $P$ independently averages the $m$ switches between corresponding positions of the two halves.
  Thus $K_n$ is positive, self-adjoint, and a contraction in every unitary representation.
  Throughout this section traces count dimension, and logarithms are natural unless a base is shown.
  The regular trace of an operator $A$ means $"tr"_(upright("reg")) A =
  sum_(lambda tack.r n) D_lambda "tr"_(V_lambda) A$. On a tuple space it means the ordinary trace of its matrix in
  the tuple basis; rescaling all basis vectors from counting to probability norm does not change it.
  For $lambda = \( n - k \, beta \) tack.r n$, write $D_lambda = dim V_lambda$, $f_beta = dim V_beta$, and

$ Lambda_n \( k \) = k log \( e n \/ k \) quad \( k > 0 \) \, wide Lambda_n \( 0 \) = 0 \, wide W_n \( lambda \) =
  parallel K_n \|_(V_lambda) parallel_(upright("op")) = parallel T_n \|_(V_lambda) parallel_(upright("op"))^2 . $

#thm([Theorem 9.1.])[
  #emph[There are absolute constants $c \, C \, zeta > 0$, a number $delta in \( 0 \, 1 \)$,
    and an integer $p_0$ with the following properties. For every dyadic $n$ and $lambda = \( n - k \, beta \)
    tack.r n$ with $k gt.eq 1$,
#[#set math.equation(numbering: n => "(64)")
 $ W_n \( lambda \) & lt.eq e^(- c Lambda_n \( k \)) \,\
W_n \( lambda \) & lt.eq e^(C Lambda_n \( k \)) f_beta^(- zeta) . $ <rec:level-contraction>]

 Independently, for every $1 lt.eq k lt.eq n$, let $X_(n \, k)$ be the ordered injective $k$-tuples of positions,
   with uniform probability measure, and let $cal(K)_(n \, k) \( x \, y \) = \( n \)_k
   Pr_(K_n) \( x mapsto y \)$ be its kernel density. Then
#[#set math.equation(numbering: n => "(65)")
 $ sup_x bb(E)_y cal(K)_(n \, k) \( x \, y \)^(1 + delta) & lt.eq e^(C Lambda_n \( k \)) \,\
"tr"_(X_(n \, k)) K_n^(p_0) & lt.eq e^(C Lambda_n \( k \)) . $ <rec:tuple-moment>]

 Consequently, after changing absolute constants,
#[#set math.equation(numbering: n => "(66)")
 $ parallel T_n \|_(V_lambda) parallel_(upright("op")) & lt.eq exp \[ - c { Lambda_n \( k \) + log f_beta } \] \,\
W_n \( lambda \) & lt.eq e^(- c_1 Lambda_n \( k \)) D_lambda^(- c_2) $ <rec:combined-tail-norm>]

 for absolute $c_1 \, c_2 > 0$.]
] <rec:main-harmonic-cycle>

=== 9.1 Harmonic tuple restriction <harmonic-tuple-restriction>

We first describe the probability law on the two child representations that arises from one maximizing vector.
  The law is a spectral weighting, not an independent random choice of Young diagrams.
  The removal estimates below hold uniformly over that weighting.

The position action of $S_n$ on $X_(n \, k)$ commutes with the action of $S_k$ on the tuple labels.
  Pieri’s rule #cite(label("Sagan2001")) #cite(label("Stanley1999")) gives the multiplicity-free injection
  decomposition #cite(label("DukesIhringerLindzey2020")) Section 3.2, equation (3.1):
  one copy of $V_mu ⊗ V_xi$ precisely when $mu \/ xi$ is a horizontal strip of size $n - k$.
  In particular the position type $\( n - k \, beta \)$ has label type $beta$ at this smallest tuple size.
  It does not occur on $X_(n \, k - 1)$. Consequently its functions are harmonic:
  summing over any one tuple entry, with all the others fixed, gives zero.

Work in the position-$lambda$ isotypic space of $ell^2 \( X_(n \, k) \)$,
  which is $V_lambda ⊗ V_beta$ under the commuting position and slot-permutation actions.
  Use counting norm here and take a unit eigenvector $v$ attaining a positive value of $W_n \( lambda \)$.
  Equation (63) implies $P v = v$. Decompose $v$ by the set of labels in each half and then by the two position
  types. The squared component norms define a probability law.
  Write $a \, b$ for the numbers of labels in the halves, $a + b = k$, and $r \, s$ for their first-row deficits.
  Branching and the tuple realization give

#[#set math.equation(numbering: n => "(67)")
 $ 0 lt.eq r lt.eq a \, quad 0 lt.eq s lt.eq b \, quad r \, s gt.eq k - m \, wide W_n \( lambda \) lt.eq
   bb(E) \[ W_m \( mu \) W_m \( nu \) \] . $ <rec:restriction-law>]

The last lower bounds follow from $mu \, nu subset.eq lambda$.
  The decompositions by label sets commute with the half-position groups, so they do not create additional types.

#thm([Lemma 9.2.])[
  (Removal and splitting).  #emph[For the component law above, $a$ is a mixture of $t +
    "Bin" \( k - 2 t \, 1 \/ 2 \)$. In particular
#[#set math.equation(numbering: n => "(68)")
 $ Pr \( \| a - k \/ 2 \| gt.eq z \) lt.eq 2 e^(- 2 z^2 \/ k) \, wide bb(E) e^(u \( a - b \)^2 \/ k) lt.eq 1 +
   C u quad \( 0 lt.eq u lt.eq 1 \/ 4 \) . $ <rec:split-tail>]

 For every fixed $eta > 0$ and integer $l gt.eq 1$,
#[#set math.equation(numbering: n => "(69)")
 $ bb(E) #h(-0.16667em) [upright(bold(1))_({ m - a - r gt.eq eta m }) binom(a - r, l)]
   lt.eq \( C_eta sqrt(k \/ n) \)^l \, $ <rec:loss-binomial-general>]

 and the same statement holds in the other half. Thus, with $alpha = 1 \/ 8$ and
$ L_1 = \( a - r \) upright(bold(1))_({ a lt.eq 3 m \/ 4 \, med r < alpha m }) \, wide
  L_2 = \( b - s \) upright(bold(1))_({ b lt.eq 3 m \/ 4 \, med s < alpha m }) \, $

 we have $bb(E) binom(L_i, l) lt.eq \( C sqrt(k \/ n) \)^l$ and
#[#set math.equation(numbering: n => "(70)")
 $ bb(E) e^(u log \( e n \/ k \) L_i) lt.eq 1 + C u quad \( 0 lt.eq u lt.eq u_0 \) $ <rec:loss-mgf>]

 for an absolute $u_0 > 0$. A second useful form, with $alpha = 1 \/ 16$, is
#[#set math.equation(numbering: n => "(71)")
 $ Pr #scale(x: 120%, y: 120%)[\(] \( a - r \) upright(bold(1))_({ r < alpha m }) gt.eq
   x #scale(x: 120%, y: 120%)[\)] lt.eq C e^(- c x log \( e n \/ k \)) wide \( x in bb(Z)_(gt.eq 1) \) .
   $ <rec:loss-tail>]

]
] <rec:removal-splitting>

#proof[
  Randomly orient the crossing pairs after sampling a configuration with probability $\| v \|^2$.
    A doubly occupied pair contributes one label to each side,
    and each singly occupied pair contributes an independent fair choice.
    This proves the mixture and the concentration bounds.
  For the removal bounds it suffices to take $1 lt.eq l lt.eq k$; the binomial coefficients vanish when $l > k$.
    Fix the first half $S_0$. For $J subset.eq \[ k \]$, let $D_J^(S_0)$ sum the coordinates with labels in $J$
    over $S_0$, leaving all the other labeled coordinates in place.
    Its target has counting measure on the ordered injective $\( k - \| J \| \)$-tuples.
    We use the zero extension $tilde(v)$ of $v$ to write these sums without collision exclusions.
    For a transversal $S$ of the matched pairs define $D_J^S$ in the same way, and put
  $ Q_l = bb(E)_S sum_(\| J \| = l) parallel D_J^S v parallel_2^2 . $
  Here $S = g S_0$ for a uniformly chosen element $g$ of the matching switch group.
    Since $P v = v$, every such $g$ fixes $v$ and $D_J^(g S_0) v = U_(k - l) \( g \) D_J^(S_0) v$,
    where $U_(k - l) \( g \)$ permutes the retained positions. Thus
  $ Q_l = sum_(\| J \| = l) parallel D_J^(S_0) v parallel_2^2 . $
  We will bound this one quantity below using the fixed-half representation decomposition and above using the
    random transversal. Write $D_i = D_({ i })^(S_0)$. In a sector with $a$ labels and position type
    $mu = \( m - r \, theta \)$,
  #[#set math.equation(numbering: n => "(72)")
   $ sum_i D_i^(*) D_i succ.curly.eq \( a - r \) \( m - a - r + 1 \) I . $ <rec:removal-quadratic>]
  Indeed the operator on the left is the arrangement adjacency operator plus $a I$;
    the position–label content identity #cite(label("AraujoBratten2017")) Lemma 3.1 and Proposition 3.3 gives $a
    I + Omega_(upright("pos")) - Omega_(upright("lab")) - binom(m - a, 2) I$,
    where $Omega$ is the transposition class sum. In the following calculation, $c \( rho \) =
    sum_(\( i \, j \) in rho) \( j - i \)$ denotes its content scalar,
    rather than the complementary positive Casimir scalar of Section 8.
    If the label type is $xi$, Pieri gives $xi supset.eq theta$. Put $h = a - r$.
    The content formula and successive addition of its $h$ extra boxes give
  $ c \( mu \) = binom(m - r, 2) + c \( theta \) - r \, wide c \( xi \) lt.eq c \( theta \) + h r + binom(h, 2) . $
  Substitution proves (72). Iterating over $l$ distinct labels and dividing by the $l !$ possible orders gives the
    lower bound
  $ Q_l gt.eq \( eta m \)^l bb(E) #h(-0.16667em) [upright(bold(1))_({ m - a - r gt.eq eta m }) binom(a - r, l)] . $
  For clarity, in a sector whose left-label set is $A$, a deletion contributes only when $J subset.eq A$.
    Afterward the left-label set is $A \\ J$, so the target still distinguishes the original sector when $J$ is
    fixed. Deletion also intertwines the two half-position groups, so different position types remain orthogonal.
    After $j$ deletions the surviving type still has deficit $r$, while the occupancy is $a - j$.
    Iterating (72) therefore supplies $\( a - r \)_l \( eta m \)^l$ on the indicated event.
    The $l !$ orders of each deleted label set give the displayed binomial coefficient.
  For the upper bound, give the two positions of each pair opposite fair signs $epsilon.alt \( x \)$, so $S =
    { x : epsilon.alt \( x \) = 1 }$. For fixed retained tuple $y$ and deleted labels $J$,
    harmonicity gives the exact formula
  $ D_J^S v \( y \) = 2^(- l) sum_z tilde(v) \( y \, z \) product_(i in J) epsilon.alt \( z_i \) . $
  Indeed expanding the product of half-indicators leaves this term only:
    every term missing a sign has a zero sum in that coordinate.
    On squaring and averaging, two deleted assignments can correlate only if their sets of pair indices with odd
    occupancy agree. Suppose that set has $l - 2 t$ members. A partner assignment is specified by at most
    $binom(m, t)$ choices of doubly occupied pair sites, two endpoint choices at each of the $l - 2 t$ odd sites,
    and $l !$ assignments of the chosen positions to the deleted labels.
    Hence the class has size at most $l ! 2^(l - 2 t) binom(m, t)$.
    Ignoring conflicts with the retained tuple only increases this bound.
  Cauchy–Schwarz in each such class bounds its squared signed sum by the class size times the sum of $\|
    tilde(v) \( y \, z \) \|^2$. Now sum over $y$ and $J$. In a fixed full $k$-tuple there are at most $floor.l
    k \/ 2 floor.r$ doubly occupied pair sites. Choose $t$ of them for the deleted double pairs and then choose
    the remaining $l - 2 t$ deleted labels. Thus there are at most $binom(floor.l k \/ 2 floor.r, t)
    binom(k, l - 2 t)$ choices, with overcounting harmless. Since $parallel v parallel_2 = 1$, this proves
  #[#set math.equation(numbering: n => "(73)")
   $ Q_l lt.eq 4^(- l) sum_(0 lt.eq t lt.eq l \/ 2) l ! 2^(l - 2 t) binom(m, t) binom(floor.l k \/ 2 floor.r, t)
     binom(k, l - 2 t) lt.eq \( C sqrt(m k) \)^l . $ <rec:removal-upper-sum>]
  The last step uses $k lt.eq 2 m$ and $l ! \/ \( t !^2 \( l - 2 t \) ! \) lt.eq 3^l$:
    each summand is at most $C^l m^t k^(l - t) lt.eq C' ""^l \( m k \)^(l \/ 2)$,
    and the number of summands is absorbed into the absolute constant.
    Comparing the two bounds on $Q_l$ proves (69). For either cutoff loss $L = L_i$, put $H = log \( e n \/ k \)$.
    Expanding $e^(u H L) = \( 1 + \( e^(u H) - 1 \) \)^L$ shows that its expectation is at most one plus a
    geometric series with ratio $C sqrt(x) \( \( e \/ x \)^u - 1 \)$, where $x = k \/ n$.
    This is $O \( u \)$ uniformly on $0 < x lt.eq 1$ for $u lt.eq 1 \/ 4$, proving (70).
  For (71), first restrict to $a lt.eq .8 m$ and $r < m \/ 16$.
    The lower removal factor is at least $.1 m$, so on $a - r gt.eq x$,
  $ Pr \( a lt.eq .8 m \, r < m \/ 16 \, a - r gt.eq x \) lt.eq
    frac(\( C sqrt(k \/ m) \)^j, binom(x, j)) quad \( 1 lt.eq j lt.eq x \) . $
  For small $k \/ n$ take $j = x$. On the remaining density range $H$ is bounded; take $j =
    floor.l x \/ M floor.r$ with a sufficiently large absolute $M$, using $binom(x, j) gt.eq \( x \/ j \)^j$.
    The bounded $x < M$ cases are absorbed in the constant. If $a > .8 m$ and $r < m \/ 16$,
    then $k > .6 n$ is impossible by $r gt.eq k - m$. For $k lt.eq .6
    n$ the event requires a deviation of at least $.2 m$, while also $k > .8 m$.
    Its probability is $C e^(- c k)$ by (68); here $H$ is bounded and $x lt.eq k$. ◻
]

=== 9.2 Three ways to close the level induction <three-ways-to-close-the-level-induction>

We have controlled both the imbalance of the two tuple occupancies and the loss from an occupancy to a child
  representation level. The next step is to turn those two controls into the first bound in Theorem 25.
  Three potentials do this with different sources of strictness:
  a fixed multiplicative margin, a large square-root correction,
  or a unit square-root correction coupled to a fixed-level estimate. We first complete the constant-margin proof.
  The two square-root alternatives then show how to replace that margin;
  the last also supplies the fixed-level estimate (81).

#strong[Capped potential comparisons.] The three inductions use the same elementary estimates. For $c > 0$ set

$ E_c \( x \) = cases(delim: "{", x log \( e c \/ x \) \, & 0 < x lt.eq c \,, c \, & x > c \,, 0 \, & x = 0 \,)
  wide R_c \( x \) = sqrt(min \( x \, c \)) . $

Take $c = alpha m$, where $0 < alpha lt.eq 1 \/ 8$ is fixed, and write $H = log \( e n \/ k \)$,
  $D = \( a - k \/ 2 \)^2 \/ k$ and $U_1 = \( a - r \) upright(bold(1))_({ r < c })$,
  with $U_2$ defined in the other half. The identities $E_(2 c) \( k \) = 2 E_c \( k \/ 2 \)$ and $a + b = k$ give

$ 0 lt.eq E_(2 c) \( k \) - E_c \( a \) - E_c \( b \) lt.eq a log \( 2 a \/ k \) + b log \( 2 b \/ k \) lt.eq 4 D . $

For the first inequality on the right, the magnitude of the negative second derivative of $E_c$ is at most $1 \/
  x$; integrating from the balanced split compares its gap with the displayed entropy gap.
  The last inequality is the relative-entropy bound by the corresponding chi-square divergence on two points.
  Concavity and $E_c \( 0 \) = 0$ also give

$ E_c \( a \) - E_c \( r \) lt.eq U_1 { 1 + log_(+) \( c \/ a \) } . $

When $a gt.eq k \/ 4$, the braces are at most $H$. When $a < k \/ 4$,
  their excess over $H$ costs at most $a log \( k \/ a \) lt.eq k \/ e$, while $D gt.eq k \/ 16$. Thus

#[#set math.equation(numbering: n => "(74)")
 $ E_(2 c) \( k \) - E_c \( r \) - E_c \( s \) lt.eq C D + H \( U_1 + U_2 \) . $ <rec:capped-entropy-comparison>]

All these inequalities include zero occupancies by continuity.

The map $x mapsto sqrt(min \( x \, c \))$ is a contraction as a function of $sqrt(x)$.
  Hence $\| R_c \( a \) - R_c \( k \/ 2 \) \| lt.eq sqrt(2 D)$, and $R_c \( a \) - R_c \( r \) lt.eq sqrt(U_1)$.
  With $s_0 = min \( k \, 2 c \)$ this yields

#[#set math.equation(numbering: n => "(75)")
 $ R_(2 c) \( k \) - R_c \( r \) - R_c \( s \) lt.eq - \( sqrt(2) - 1 \) sqrt(s_0) + 2 sqrt(2 D) + sqrt(U_1) +
   sqrt(U_2) . $ <rec:capped-root-comparison>]

These comparisons separate occupancy imbalance from the loss of representation level,
  so the estimates in Lemma 26 can be applied without conditioning on either event.

#strong[A constant multiplicative margin.]

First take $x_(*) = 1 \/ 100$ and define

$ H_N \( j \) = N h \( j \/ N \) \, wide h \( y \) =
  cases(delim: "{", y \( 1 + log \( x_(*) \/ y \) \) \, & 0 < y lt.eq x_(*) \,, x_(*) \, & y > x_(*) \,, 0 \, &
  y = 0 .) $

The function is nondecreasing and concave, and $H_n \( k \) gt.eq c Lambda_n \( k \)$.
  Put $Delta = H_n \( k \) - H_m \( r \) - H_m \( s \) gt.eq 0$. There are absolute $beta \, C > 0$ such that

#[#set math.equation(numbering: n => "(76)")
 $ bb(E) e^(beta Delta) lt.eq C . $ <rec:constant-margin-mgf>]

Here is the loss calculation. For $k \/ n gt.eq 3 \/ 5$, the diagram containment bound gives $r \, s gt.eq
  m \/ 5$ and the gap is zero. Otherwise introduce $H_m \( a \) +
  H_m \( b \)$ and use the preceding entropy comparison. If $a > 4 m \/ 5$ but $r < x_(*) m$,
  containment implies $k < \( 1 + x_(*) \) m$. Therefore $D gt.eq c m$, which bounds the entire capped loss,
  at most $x_(*) m$. For all other occupancies the same calculation, with $1 +
  log_(+) \( 4 x_(*) m \/ k \)$ in place of $H$, gives

$ Delta lt.eq C D + J \( V_1 + V_2 \) \, quad D = \( a - k \/ 2 \)^2 \/ k \, quad J = 1 +
  log_(+) \( 4 x_(*) m \/ k \) \, $

where $V_1 = \( a - r \) upright(bold(1))_({ r < x_(*) m \, a lt.eq 4 m \/ 5 })$, and similarly for $V_2$.
  On this indicator $m - a - r gt.eq m \/ 10$. The binomial moments in (69) imply

$ bb(E) e^(t J V_i) lt.eq 1 + sum_(l gt.eq 1) \[ \( e^(t J) - 1 \) C_(1 \/ 10) sqrt(k \/ n) \]^l . $

The ratio is uniformly small for a sufficiently small fixed $t$. Hölder and (68) prove (76).

For all sufficiently large $n$, uniformly over $k gt.eq 2$, the same component law satisfies

#[#set math.equation(numbering: n => "(77)")
 $ Pr \( r \, s gt.eq 1 \) gt.eq 1 \/ 3 \, wide Pr \( r = s = 0 \) lt.eq 1 \/ 12 . $ <rec:constant-margin-events>]

For density at least $3 \/ 5$ this is deterministic. Otherwise,
  when $k$ is large the two occupancies lie between $k \/ 4$ and $4 m \/ 5$ except with vanishing probability,
  and a zero child level would make a $V_i$ at least $k \/ 4$. The preceding exponential estimate excludes this.
  For bounded $k gt.eq 2$, the probability of any removal loss tends uniformly to zero by the $l = 1$ bound.
  The binomial mixture has two positive occupancies with probability at least $1 - 2^(1 - k) gt.eq 1 \/ 2$,
  and cannot have both zero.

Choose a finite base threshold for (77). Every nontrivial sweep norm at those finitely many sizes is strictly
  below one: equality in a product of orthogonal projections would give a vector fixed by every cube-edge
  transposition, hence by $S_n$. Choose $0 < A lt.eq 1 \/ 2$ so the finite base norms are at most $e^(- 2 A)$.
  We induct with

#[#set math.equation(numbering: n => "(78)")
 $ W_n \( lambda \) lt.eq e^(- A - epsilon H_n \( k \)) quad \( k gt.eq 2 \) . $ <rec:constant-margin-invariant>]

Level one is annihilated by exact one-card uniformity. Let $G = { r eq.not 1 \, s eq.not 1 }$ and $b = \# { r \,
  s upright(" that are at least ") 2 }$. After dividing the recursive bound by the proposed right side,
  the remaining factor is

$ bb(E) \[ upright(bold(1))_G e^(- A \( b - 1 \)) e^(epsilon Delta) \] . $

Without the last factor this is bounded uniformly below one:
  the event of two positive levels loses at least $1 - e^(- A)$, whereas only two zero levels can gain $e^A -
  1 lt.eq 2 \( 1 - e^(- A) \)$. Equations (77) bound the factor by $1 - \( 1 - e^(- A) \) \/ 6$.
  Moreover (76) and Hölder give $bb(E) e^(epsilon Delta) lt.eq C^(epsilon \/ beta) = 1 + O \( epsilon \)$.
  Since $upright(bold(1))_G e^(- A \( b - 1 \)) lt.eq e^A$,
  reinstating $e^(epsilon Delta)$ costs only $O \( epsilon \)$, uniformly.
  Also choose $epsilon H_n \( k \) lt.eq A$ at the base sizes. This proves (64).

#strong[A large square-root correction.] A second invariant dispenses with the constant margin by inserting a
  square-root term. With $alpha = 1 \/ 16$, set

$ G_N \( j \) = N phi.alt \( j \/ N \) \, wide phi.alt \( y \) =
  cases(delim: "{", y log \( e alpha \/ y \) \, & 0 < y lt.eq alpha \,, alpha \, & y gt.eq alpha \,, 0 \, & y = 0 \,) $

$ F_N \( j \) = G_N \( j \) + 100 sqrt(min \( j \, alpha N \)) . $

For $Y = F_n \( k \) - F_m \( r \) - F_m \( s \)$ and $s_0 = min \( k \, alpha n \)$,

#[#set math.equation(numbering: n => "(79)")
 $ Y lt.eq - 100 \( sqrt(2) - 1 \) sqrt(s_0) + C_100 { 1 + D + H \( U_1 + U_2 \) } \, $ <rec:sqrt-large-drift>]

where $H = log \( e n \/ k \)$, $D = \( a - k \/ 2 \)^2 \/ k$, and the $U_i$ are the uncut losses in (71).
  Indeed (74) and (75), together with $sqrt(D) lt.eq 1 + D$ and $sqrt(U_i) lt.eq U_i$ for integer losses,
  give (79). The split and loss tails imply, for small $tau gt.eq 0$, a bound

$ bb(E) e^(tau C_100 { 1 + D + H \( U_1 + U_2 \) }) lt.eq e^(C' tau) . $

For example the tail in (71) bounds $bb(E) e^(c H U_i)$ uniformly for a small fixed $c > 0$;
  Hölder and convexity then give the displayed bound at smaller exponents.
  Since $s_0 gt.eq alpha k$, one fixed threshold $K$ makes $bb(E) e^(tau Y) lt.eq
  1$ for every $k > K$ and all sufficiently small $tau$.

For $2 lt.eq k lt.eq K$, take $n$ large enough that the potentials are uncapped at these levels.
  Put $L = \( a - r \) + \( b - s \)$, and decompose the gap without conditioning on the loss event:

$ Y = Q - 100 S + R \, wide Q = a log \( 2 a \/ k \) + b log \( 2 b \/ k \) \, quad S = sqrt(a) + sqrt(b) - sqrt(k) \, $

where $0 lt.eq R lt.eq \( H + C_K \) L$. The binomial mixture gives $bb(E) Q lt.eq 4 bb(E) D lt.eq 1$.
  Both occupancies are positive with probability at least $1 \/ 2$, and then $S gt.eq 1 \/ 2$, so $bb(E) S gt.eq
  1 \/ 4$. The first removal moment gives $bb(E) L lt.eq C_K e^(- H \/ 2)$.
  Consequently $bb(E) Y lt.eq - 24 + o \( 1 \) lt.eq - 12$ for all sufficiently large $n$,
  uniformly over these finitely many levels.

The same bound also justifies a uniform Taylor remainder.
  We have $\| Y \| lt.eq C_K + K H upright(bold(1))_({ L > 0 })$ and $Pr \( L > 0 \) lt.eq C_K e^(- H \/ 2)$,
  and therefore

$ M_K := sup bb(E) #scale(x: 120%, y: 120%)[\[] Y^2 e^(\| Y \| \/ \( 4 K \)) #scale(x: 120%, y: 120%)[\]] < oo \, $

where the supremum is over these levels, sizes, and component laws.
  For $0 < tau lt.eq min { 1 \/ \( 4 K \) \, 12 \/ M_K }$, Taylor’s inequality gives $bb(E) e^(tau Y) lt.eq 1 +
  tau bb(E) Y + tau^2 M_K \/ 2 lt.eq 1 - 6 tau$. The remaining finitely many sizes are covered by shrinking $tau$
  using the strict norm gap. Induction now proves the invariant $W_n \( lambda \) lt.eq e^(- tau F_n \( k \))$.

#strong[A unit correction and fixed-level bootstrap.] A third version uses coefficient one instead of $100$.
  Use the preceding definition of $G_N$ with $alpha = 1 \/ 8$, and put $Phi_N \( j \) = G_N \( j \) +
  sqrt(min \( j \, alpha N \))$. The cut losses $L_i$ in Lemma 26 give

#[#set math.equation(numbering: n => "(80)")
 $ Phi_n \( k \) - Phi_m \( r \) - Phi_m \( s \) lt.eq - c_0 sqrt(k) + C_0 \( a - b \)^2 \/ k +
   C_0 H \( L_1 + L_2 \) . $ <rec:sqrt-unit-drift>]

Here are the capped cases in this comparison. Put $c = alpha m$.
  If $a \, b in \[ .4 k \, .6 k \]$ and $c \/ k lt.eq .4$, both child square roots are capped,
  so their saving over the root is $\( 2 - sqrt(2) \) sqrt(c) gt.eq \( 2 - sqrt(2) \) sqrt(k) \/ 4 > .1 sqrt(k)$;
  we used $c \/ k gt.eq 1 \/ 16$. If $c \/ k gt.eq .4$, each child square root is at least $sqrt(.4 k)$ and the
  root is at most $sqrt(k)$, giving the same saving. Outside this occupancy interval, $D gt.eq k \/ 100$,
  and the square-root gap, at most $sqrt(k)$, is bounded by $- .1 sqrt(k) + 110 D$.
  This proves the required no-loss bound.

The entropy comparison (74) and the root loss $sqrt(L_i) lt.eq L_i lt.eq H L_i$ cover the cut losses.
  The only omitted case has $a > 3 m \/ 4$ and $r < m \/ 8$, or its counterpart.
  Containment gives $k < 9 m \/ 8$, hence $D > m \/ 32$; the entire capped entropy and square-root loss is at most
  $m$, and so is bounded by $32 D$. These bounds prove (80) with $c_0 = 1 \/ 10$ and an absolute $C_0$.
  Equations (68) and (70) imply

$ bb(E) e^(tau \( Phi_n \( k \) - Phi_m \( r \) - Phi_m \( s \) \)) lt.eq e^(tau \( B - c_0 sqrt(k) \)) $

for fixed $B$ and all sufficiently small $tau$. One may start this induction through the additional quantitative fact

#[#set math.equation(numbering: n => "(81)")
 $ max_(lambda : n - lambda_1 = k) W_n \( lambda \) = O_k \( n^(- 1 \/ 4) \)
   wide \( k gt.eq 1 upright(" fixed") \) . $ <rec:fixed-level-bootstrap>]

Induct on $k$. A positive removal loss has probability $O_k \( n^(- 1 \/ 2) \)$.
  Without losses, two positive child levels are smaller than $k$ and obey the induction hypothesis.
  All labels in one half has probability at most $2^(1 - k)$, giving for $k gt.eq 2$ $M_k \( 2 m \) lt.eq
  2^(1 - k) M_k \( m \) + O_k \( m^(- 1 \/ 4) \)$. Since $2^(1 - k) 2^(1 \/ 4) < 1$, this proves (81);
  level one vanishes. For any fixed upper level $K$, the estimate is eventually stronger than
  $e^(- tau Phi_n \( k \))$ simultaneously for $1 lt.eq k lt.eq K$ if $tau lt.eq 1 \/ \( 8 K \)$,
  since $Phi_n \( k \) = k log n + O_K \( 1 \)$ there. Shrinking $tau$ handles the remaining finite sizes.
  Thus it supplies one common small $tau$ for all bounded levels,
  and then (80) closes induction for the larger levels. Thus all three invariants prove the first assertion of
  Theorem 25, while (81) records a separate fixed-level estimate.

=== 9.3 Cycle moments from positive tensor traces <cycle-moments-from-positive-tensor-traces>

We next prove the density estimate. In a node of size $2 m$ in the recursive network,
  form the bipartite graph of input and output switch cells, with one edge for each tracked card.
  It is a union of paths and even cycles, including double edges.
  Let $c_v^(*)$ be its cycle count; let $c_v$ be the count when all cards are tracked.
  A node of size $2^j$ has height $j$. Write $C_j^(*) \, C_j$ for their sums over all nodes at height $j$.
  Then $C_j^(*) lt.eq k \/ 2$ and $C_j^(*) lt.eq C_j$. The full count at a node is the number of cycles of the
  relative permutation of its two children. In particular it depends only on the randomness below that node,
  irrespective of the tracks arriving from above.

For $q gt.eq 1$ put $Z_l \( q \) = bb(E)_(g tilde.op K_(2^l)) q^(\# upright("cycles") \( g \))$.
  This scalar generating function is defined for every real $q gt.eq 1$.
  For an integer $q$ it is also the unnormalized trace of $K_(2^l)$ on $\( bb(C)^q \)^(⊗ 2^l)$.
  The tensor identity in Lemma 22, specialized to this integer alphabet, gives

#[#set math.equation(numbering: n => "(82)")
 $ Z_l \( q \) lt.eq Z_(l - 1) \( q \) Z_(l - 1) \( 1 + \( q - 1 \) \/ 2 \) wide \( q in bb(Z)_(gt.eq 1) \) .
   $ <rec:cycle-trace-recursion>]

For completeness, divide the positive child operator by its trace and call the resulting density matrix $D$.
  Expanding the crossing average over a uniformly chosen subset $S$ of tensor positions gives $Z_l \( q \) =
  Z_(l - 1) \( q \)^2 bb(E)_S "tr" \( D_S^2 \)$. The partial trace of a permutation is its induced permutation on
  $S$, multiplied by $q$ for each cycle avoiding $S$. Therefore its norm is at most that scalar.
  Bounding $"tr" \( D_S^2 \)$ by $parallel D_S parallel_(upright("op"))$ and averaging $S$ contributes at most
  $1 + \( q - 1 \) 2^(- \| C \|) lt.eq 1 + \( q - 1 \) \/ 2$ per cycle, proving the recursion.

Two useful explicit versions are

#[#set math.equation(numbering: n => "(83)")
 $ 2^(- l) log Z_l \( 1 + 2^h \) & lt.eq 2^h \( .81 \)^l &  & \( h = 0 \, 1 \, dots.h \) \,\
log Z_l \( 1 + w \) & lt.eq w \( 2^l \)^gamma \, wide gamma =
  log_2 \( 1 + log_2 \( 3 \/ 2 \) \) < 1 &  & \( w = 2^h \, med h in bb(Z)_(gt.eq 0) \) . $ <rec:cycle-081>]

For $q > 2$ the normalized induction factor is $3 \/ 4$; for $q = 2$ use $Z_l \( 3 \/ 2 \) lt.eq
  Z_l \( 2 \)^(log_2 \( 3 \/ 2 \))$, giving factor $\( 1 + log_2 \( 3 \/ 2 \) \) \/ 2 < .81$.
  The same two cases yield the sharper exponent in (83), since $3 \/ 2 lt.eq 2^gamma$.
  The base $Z_0 \( q \) = q$ satisfies both bounds.

Here is the conditional form needed to sum heights. Let $cal(F)_h$ be the sigma-field generated by all switches at
  heights at most $h$, with the trivial sigma-field when $h < 1$. Reveal $cal(F)_(j - l - 1)$.
  Each child of a height-$j$ node has conditional average $A^(*) U A$,
  with $U$ a fixed unitary and $A$ a tensor product of $l$-coordinate sweeps on $2^l$-slot cells.
  Independence of the two children and Hilbert–Schmidt Cauchy–Schwarz show

#[#set math.equation(numbering: n => "(84)")
 $ bb(E) \[ q^(C_j) divides cal(F)_(j - l - 1) \] lt.eq Z_l \( q \)^(n \/ \( 2 dot.op 2^l \)) .
   $ <rec:conditional-cycle-trace>]

Indeed, writing $F_0 \, F_1$ for the two conditional tensor mean operators, $"tr" \( F_0^(*) F_1 \) lt.eq
  "tr" \( \( A A^(*) \)^2 \) lt.eq "tr" \( A A^(*) \)$, and the trace factors over the cells.
  Fresh switches in different height-$j$ nodes are conditionally independent.

Choose $delta > 0$ with $4 delta < 1 - gamma$. Partition heights into bands $\[ b \, 2 b - 1 \]$ for powers of two
  $b$, and separate alternating bands. For $b gt.eq 2$, take $l =
  b \/ 2$ and round $2^(2 delta b)$ up to an integer alphabet, then its excess above one up to a power of two.
  Equations (83)–(84) give

$ bb(E) \[ 2^(2 delta b C_j) divides cal(F)_(b \/ 2 - 1) \] lt.eq exp \( C n 2^(- eta b) \) \, wide
  eta = \( 1 - gamma \) \/ 2 - 2 delta > 0 . $

Conditional Hölder over the at most $b$ heights gives the same bound for $2^(2 delta sum C_j)$ in the band.
  A smaller band of the same parity ends below $b \/ 2$, so its factor is measurable for this conditioning.
  Integrate the highest band first and iterate; Cauchy–Schwarz combines the two parities. For $J gt.eq 2$ the result is

#[#set math.equation(numbering: n => "(85)")
 $ bb(E) 2^(delta sum_(j gt.eq J) C_j) lt.eq exp \( C n 2^(- eta' J) \) \, wide eta' =
   eta \/ 2 . $ <rec:high-cycle-moment>]

The use of full counts is essential: replace tracked counts by full counts in every band where conditional
  integration will be used before performing that integration.
  Tracked lower counts can otherwise depend on the routes chosen above them.

Taking $J$ a sufficiently large constant multiple of $log_2 \( e n \/ k \)$,
  the deterministic bound on lower heights and (85) give, uniformly over initial tuples,

#[#set math.equation(numbering: n => "(86)")
 $ bb(E) 2^(delta sum_j C_j^(*)) lt.eq e^(C Lambda_n \( k \)) . $ <rec:tracked-cycle-moment>]

Equivalently one may use (83): in a band starting at $b$,
  the conditional logarithmic bound is $\( n \/ 2 \)
  2^(ceil.l 2 delta b ceil.r) \( .81 \)^(floor.l b \/ 2 floor.r) lt.eq
  C n e^(- gamma_0 b)$ for a sufficiently small fixed $delta$.
  Using tracked deterministic bounds below $gamma_0^(- 1) log \( n \/ k \)$ and full counts above it proves the
  same estimate with explicit geometric decay in band height.

=== 9.4 An entropy coding proof of the cycle moment <an-entropy-coding-proof-of-the-cycle-moment>

The tensor argument proves the required moment. The following coding argument also controls the cycle count under
  an arbitrary change of the switch law, charging its increase to relative entropy.
  This is the additional conclusion we retain from this alternative proof.
  In this subsection entropy is measured in bits.

At height $t$ the switch array consists of both outer layers of every node of size $2^t$;
  all these raw switch bits are independent under the reference fair law.
  Let $Q$ be any probability law on the full array of raw switches at all heights of the $n$-position reflected
  network. Write $cal(B)_t$ for the vector of bits at height $t$ and define the nonnegative number

$ I_t = \| cal(B)_t \| - H_Q \( cal(B)_t divides cal(B)_1 \, dots.h \, cal(B)_(t - 1) \) \, $

where conditional Shannon entropy is already averaged under $Q$.
  Thus $I_t gt.eq 0$ and $sum_t I_t = D \( Q bar.v.double upright("fair") \)$.

#thm([Proposition 9.3.])[
  (Cycle costs under a change of law).  #emph[For any fixed input tuple of $k$ distinct positions and any law $Q$
    on the raw switches, the actual tracked cycle counts satisfy
#[#set math.equation(numbering: n => "(87)")
 $ bb(E)_Q sum_j C_j^(*) lt.eq C Lambda_n \( k \) + C D \( Q bar.v.double upright("fair") \) \,
   $ <rec:cycle-tilted-entropy>]

 with an absolute constant $C$.]
] <rec:entropy-deficit>

#proof[
  With $h = floor.l j \/ 2 floor.r$, the full cycle counts obey
  #[#set math.equation(numbering: n => "(88)")
   $ bb(E)_Q C_j lt.eq C n e^(- c j) + C / j sum_(t = j - h)^(j - 1) I_t wide \( j gt.eq 2 \) .
     $ <rec:cycle-window-entropy>]
  To prove this, code the window bits given smaller heights.
    At one height-$j$ node, with child size $m = 2^(j - 1)$, send literally all window bits except the first $h$
    input layers of one child. The relative child permutation is now $D_0 A$,
    with $D_0$ known and $A$ a butterfly with $h m \/ 2$ unknown bits.
    If $D_0 A$ has $r$ cycles, send $r$, one representative per cycle, and the ordered list of cycle lengths.
    These data cost at most $C \[ log_2 \( 2 m \) + r log_2 \( e m \/ r \) \]$ bits,
    using $binom(m, r)$ and $binom(m - 1, r - 1)$.
  Traverse each cycle from its representative. Send each as-yet-unknown switch bit used on its $A$ paths,
    except on the last path of that cycle: its required output is already known,
    so its unique butterfly route recovers all those bits without sending them.
    The specified lengths tell the decoder exactly when this omission occurs.
    For each fixed choice of the public orders described next, use a fixed-width field for $r$,
    an enumerative code for its representative set, and an enumerative code for the composition of $m$ into the
    transmitted lengths. The decoder then reads a bit precisely when the traversal first queries an unknown switch
    outside a closing path. It consequently knows when the whole message has ended.
    The resulting code is prefix-decodable. Every switch is recovered after all positions have been traversed.
  Use independent public random priority orders on vertices to choose a uniform representative within each cycle
    and then to order the transmitted representative set. The decoder uses that same second priority order;
    no extra factorial cost is needed to specify the cycle order.
    For any set of $s$ butterfly paths, the number of internal contacts, counted at both ends,
    is at most $s log_2 s$. Indeed, splitting a block into two predecessor blocks of sizes $s_1 \,
    s_2$ adds at most $2 min \( s_1 \, s_2 \)$ contacts, and
  $ s_1 log_2 s_1 + s_2 log_2 s_2 + 2 min \( s_1 \, s_2 \) lt.eq \( s_1 + s_2 \) log_2 \( s_1 + s_2 \) . $
  The closing path of a length-$s$ cycle therefore has, on average, at least $h -
    log_2 s$ contacts outside its cycle. Each outside cycle is later with probability $1 \/ 2$,
    so those switches are then unknown. The expected saving is at least
  $ r / 2 { h - log_2 \( m \/ r \) } - C \[ log_2 \( 2 m \) + r log_2 \( e m \/ r \) \] . $
  This remains a valid lower bound if some terms are negative, and covers cycles of length one.
    The public orders are independent of the switch array. Conditional on the smaller heights and on those orders,
    the code remains a prefix code for the entire window: different height-$j$ nodes use disjoint sets of its
    bits. Its entropy is at most its expected length. Average over the public orders and the smaller heights.
    The difference between the literal window length and its conditional entropy is exactly
    $sum_(t = j - h)^(j - 1) I_t$, by the entropy chain rule.
    Thus the saving just computed is charged to that window deficit,
    without assuming independence of the bits under $Q$. The inequality $C r log_2 \( e m \/ r \)
    lt.eq \( h \/ 4 \) r + C' m e^(- c' h)$ and the $n \/ 2^j$ nodes give (88).
  At each height the tracked count is at most $k$ and at most the full count.
    Moreover each $I_t$ occurs with bounded total coefficient in the windows,
    since $sum_(j > t \, med j - floor.l j \/ 2 floor.r lt.eq t) 1 \/ j = O \( 1 \)$.
    Sum the deterministic tracked bound below a sufficiently large multiple of $log \( e n \/ k \)$ and (88) above
    it. The first sum and the exponentially decaying errors cost $O \( Lambda_n \( k \) \)$;
    the bounded window coefficients cost $O \( sum_t I_t \)$. This proves (87). ◻
]

Apply this to the law tilted by $2^(epsilon sum C_j^(*))$. The variational identity

$ log_2 bb(E) 2^(epsilon sum C_j^(*)) = epsilon bb(E)_Q sum C_j^(*) - D \( Q bar.v.double upright("fair") \) $

proves (86) when $epsilon C < 1$. Thus the tensor-trace argument and the coding argument each supply a complete,
  separate proof of the required cycle moment.

=== 9.5 From routed cycles to densities and multiplicities <from-routed-cycles-to-densities-and-multiplicities>

Consider specified injective endpoints for $h$ links in a size-$2 m$ node.
  Let $e$ be the total number of shared input and output pairs, and let $c$ be the cycle count in their union.
  The links admit exactly $2^(h - e + c)$ proper child colorings. Each has switch probability $2^(- 2 h + e)$.
  If $R = \( 2 m \)^h p$ is the provisional transition density, the child recursion is

#[#set math.equation(numbering: n => "(89)")
 $ R = sum_(upright("proper colors")) 2^(- h + e) R_0 R_1 =
   2^c "Avg"_(upright("proper colors")) R_0 R_1 . $ <rec:routing-density-recursion>]

Jensen with exponent $1 + delta$ charges a factor $2^(delta c)$. After unrolling to one-slot leaves,

$ \( n^k p \( x \, y \) \)^(1 + delta) lt.eq
  n^k bb(E)_(K_n) \[ upright(bold(1))_({ pi x = y }) 2^(delta sum C_j^(*)) \] . $

The remaining coefficients are the actual switch probabilities:
  each link is counted once per height, and specified recursive routings are disjoint events.
  Summing in $y$ and using $\( n \)_k \/ n^k lt.eq 1$ proves (65).
  Symmetry supplies the corresponding column estimate. We will also use the provisional normalization directly:

#[#set math.equation(numbering: n => "(90)")
 $ sup_x sum_y n^(- k) \( n^k p \( x \, y \) \)^(1 + delta) lt.eq e^(C Lambda_n \( k \)) . $ <rec:provisional-moment>]

Indeed summing the preceding unrolled inequality proves this before the factor $\( n \)_k \/ n^k$ is inserted.
  Equivalently it follows from the density bound after enlarging $C$, since

$ log frac(n^k, \( n \)_k) = sum_(i = 0)^(k - 1) - log \( 1 - i \/ n \) lt.eq integral_0^k -
  log \( 1 - x \/ n \) thin d x lt.eq k . $

The integral is finite also at $k = n$.

The row and column bounds imply bounded operators $K_n : L^1 arrow.r L^(1 + delta)$ and $K_n :
  L^(\( 1 + delta \) \/ delta) arrow.r L^oo$, each with norm at most $M =
  e^(C Lambda_n \( k \))$ after enlarging $C$. Riesz–Thorin interpolation decreases the reciprocal exponent by
  $delta \/ \( 1 + delta \)$ at each application. After $p_0 =
  ceil.l \( 1 + delta \) \/ delta ceil.r$ applications, with probability-space inclusion for the last step,
  $K_n^(p_0) : L^1 arrow.r L^oo$ has norm at most $M^(p_0)$. Equivalently,

#[#set math.equation(numbering: n => "(91)")
 $ sup_(x \, y) \| X_(n \, k) \| K_n^(p_0) \( x \, y \) lt.eq
   e^(C Lambda_n \( k \)) . $ <rec:tuple-pointwise-smoothing>]

The diagonal kernel bound gives (65).

There are two ways to use the label multiplicity $f_beta$.
  For the first transfer, the goal is to use the $f_beta$ equivalent slot copies of one position vector.
  Clip the entries $p \( x \, y \)$ of $K_n$ above $n^(- k) sqrt(f_beta)$, setting them to zero,
  and call the retained matrix $M_0$. The provisional moment bound (90) and symmetry give

#[#set math.equation(numbering: n => "(92)")
 $ parallel K_n - M_0 parallel_(upright("op")) lt.eq e^(C Lambda_n \( k \)) f_beta^(- delta \/ 2) .
   $ <rec:tail-clipping-error>]

Since every row sum is at most one and $\| X_(n \, k) \| lt.eq n^k$,
  $parallel M_0 parallel_(upright("HS"))^2 lt.eq sqrt(f_beta)$. Clipping commutes with relabeling the tuple slots.
  Compressing to position type $lambda$, whose label type is $beta$,
  therefore repeats each singular value at least $f_beta$ times.
  Its compressed norm is at most $f_beta^(- 1 \/ 4)$. If $log
  f_beta$ exceeds a sufficiently large constant times $Lambda_n \( k \)$,
  these two estimates give $W_n \( lambda \) lt.eq e^(- c log f_beta)$; otherwise (64) applies. This proves (66).

The clipping proof now gives the combined level-and-tail estimate.
  To obtain the explicit tail bound (64) by a different mechanism,
  average a matrix coefficient over all slot copies. Tensor a maximizing unit vector in $V_lambda$ with an
  orthonormal basis of $V_beta$, obtaining orthonormal functions $u_j$, $1 lt.eq j lt.eq f_beta$,
  in probability norm. Define

$ F \( x \, y \) = 1 / f_beta sum_j overline(u_j \( x \)) u_j \( y \) . $

Then $bb(E) \( F cal(K) \) = W_n \( lambda \)$ and $bb(E) \| F \|^2 = f_beta^(- 1)$.
  The diagonal $G \( x \) = f_beta^(- 1) sum_j \| u_j \( x \) \|^2$ is slot-invariant and has mean one.
  Each orbit of the slot-permutation group is the set of $k !$ orderings of one $k$-element set,
  so has probability $binom(n, k)^(- 1)$. Nonnegativity therefore gives $G \( x \) lt.eq binom(n, k)$.
  Cauchy–Schwarz gives the same bound for $\| F \( x \, y \) \|$.
  With $p = 1 + delta$ and $p' = p \/ \( p - 1 \) > 2$, Hölder gives

#[#set math.equation(numbering: n => "(93)")
 $ W_n \( lambda \) lt.eq parallel cal(K) parallel_p parallel F parallel_(p') lt.eq
   e^(C Lambda_n \( k \)) binom(n, k)^(1 - 2 \/ p') f_beta^(- 1 \/ p') . $ <rec:tail-averaged-coefficient>]

This proves (64) with $zeta = 1 \/ p'$. Since $D_lambda lt.eq binom(n, k) f_beta$,
  geometric interpolation with (64) proves (66).

Finally, the tuple trace gives a completion that needs no tail-dimension interpolation.
  At exact level $k$ the multiplicity in $X_(n \, k)$ is $f_beta$,
  while the regular multiplicity is $D_lambda lt.eq binom(n, k) f_beta$.
  For an integer $p > p_0$, positivity and the estimates (64) and (65) yield

#[#set math.equation(numbering: n => "(94)")
 $ "tr"_(upright("reg")) K_n^p - 1 lt.eq sum_(k = 1)^(n - 1)
   e^(- \[ \( p - p_0 \) c - C - 1 \] Lambda_n \( k \)) . $ <rec:tuple-regular-completion>]

Alternatively (66) bounds the regular Fourier sum directly by $sum_(k gt.eq 1) 2^k
  e^(- c_1 M Lambda_n \( k \))$ once $c_2 M gt.eq 2$. Both sums tend to zero for a sufficiently large fixed
  exponent. Schatten Hölder gives $parallel T_n^p \|_(upright(bold(1))^perp) parallel_(upright("HS"))^2 lt.eq
  "tr"_(upright("reg")) K_n^p - 1$ without assuming normality of $T_n$.
  Thus these arguments mix the entire permutation law after an absolute number of sweeps,
  each consisting of exactly $d$ physical shuffles.

== 10 Compressed generators and adaptive alphabets <rec:sec-adaptive>

A fixed representation level does not determine the dimension:
  diagrams with the same first row can have very different shapes below it.
  We now separate these two contributions in another way. Compression of the transposition generator gives the
  level estimate. A fourth trace moment then gives a negative power of the full dimension,
  at a positive cost proportional to the level scale. Combining the two cancels that cost.

The fourth-moment argument realizes a diagram in an induced tensor representation.
  Its alphabet size controls the multiplicity paid at each split.
  An alphabet that was economical at the root can become too large for a small descendant diagram.
  We change it at that point and prove that the total cost of all such changes is summable.
  The proof below first establishes the estimate for one split,
  then specifies the changes and accounts for their cost over the entire recursion tree.

Put $F_n = T_n T_n^(*)$, so that $F_n = P \( F_m ⊗ F_m \) P$ for $n = 2 m$.
  If $lambda = \( n - r \, rho \) tack.r n$, write $h_n \( r \) = r log \( n \/ r \) + r$ for $r > 0$,
  and $h_n \( 0 \) = 0$. The coordinate names here are ordered so that $P$ is the final matching of $T_n$.
  Thus $F_n$ is the other positive orientation of the sweep, with the same singular values as $T_n^(*) T_n$.
  All traces are unnormalized; $0 log 0 = 0$ throughout.

#thm([Theorem 10.1.])[
  #emph[There are absolute positive constants $c \, c' \, C$ such that for every dyadic $n$ and every partition
    $lambda = \( n - r \, rho \) tack.r n$,
#[#set math.equation(numbering: n => "(95)")
 $ parallel F_n \|_(V_lambda) parallel_(upright("op")) & lt.eq e^(- c h_n \( r \)) \,\
"Tr"_(V_lambda) F_n^4 & lt.eq exp { - c' log D_lambda + C h_n \( r \) } . $ <rec:generator-level-main>]

 Consequently $parallel T_n \|_(V_lambda) parallel_(upright("op"))$ is at most
   $exp \[ - c_0 { log D_lambda + h_n \( r \) } \]$ for an absolute $c_0 > 0$.]
] <rec:adaptive-main>

=== 10.1 Compression of the transposition generator <compression-of-the-transposition-generator>

Let

$ L_n = 1 / n sum_(i < j) \( I - \( i j \) \) \, wide T = L_n - L_0 - L_1 \, wide J = L_0 - L_1 \, $

where $L_0$ and $L_1$ act on the first and second halves, respectively,
  and each uses normalization $1 \/ m$ when $n = 2 m$. Transpositions in these formulas denote their unitary
  representation matrices. The transposition content formula #cite(label("VershikOkounkov2005")) makes $L_n$
  scalar on $V_lambda$, with value

#[#set math.equation(numbering: n => "(96)")
 $ ell = r - frac(binom(r, 2) + c \( rho \), n) \, wide r \/ 2 lt.eq ell lt.eq r . $ <rec:central-level>]

Here $c \( rho \)$ is the sum of the box contents of $rho$.
  The three operators in this display commute with each other before compression,
  although they need not commute with $P$.

#thm([Lemma 10.2.])[
  #emph[Let $1 lt.eq r lt.eq n - 1$ and let $P$ act on the ordered injective $r$-tuple module by simultaneously
    switching matched positions. Put $p_(*) = r \/ n$. For absolute $t_0 \, t_1 \, v_0 > 0$,
#[#set math.equation(numbering: n => "(97)")
 $ parallel P e^(t T) P parallel & lt.eq e^(C p_(*) \| t \|) \, &  & \| t \| lt.eq t_0 \,\
parallel P e^(plus.minus t_1 log \( 1 \/ p_(*) \) T) P parallel & lt.eq 1 + o \( 1 \) \, &  & p_(*) arrow.r 0 \,\
parallel P e^(v J^2 \/ r) P parallel & lt.eq 1 + O \( v \) \, &  & 0 lt.eq v lt.eq v_0 . $ <rec:T-small-mgf>]

 The estimates are uniform in $n \, r$.]
] <rec:compressed-mgfs>

#proof[
  Embed injections in the tensor power of the one-site space and let $D$ be the mask deleting repeated sites.
    Write $s_j = 1$ or $- 1$ according as the $j$th coordinate lies in the first or second half.
    The one-coordinate part of $T$ is a projection onto the signed uniform vector.
    Its correction on distinct tuples is $n^(- 1) sum_(j < l) s_j s_l \( I + \( j l \) \)$.
    The one-coordinate part of $J$ is the sign diagonal minus the difference of the two half-uniform rank-one
    projections; its correction is $- \( 2 m \)^(- 1) sum_(j < l) \( s_j + s_l \) \( I + \( j l \) \)$.
  Use the symmetric and antisymmetric basis within matched site pairs.
    A pair site is odd when an odd number of its tensor slots use the antisymmetric vector.
    The endpoints selected by $P$ have no odd pair sites; two antisymmetric slots at the same pair site have even
    parity. The injection mask kills basis indices with more than two tensor slots at one pair site and preserves
    the odd-site pattern. At a pair site occupied by slots $j \, l$,
    it is the projection $\( I - s_j s_l \) \/ 2$ in the original position basis.
    In the symmetric and antisymmetric basis the second term flips both slot signs,
    so this projection has absolute row sum one. The product over disjoint doubly occupied sites has the same
    bound. Hence mask insertions between steps have absolute row mass at most one.
  Here is the transition count in this basis. Write $e_(p \, +) \,
    e_(p \, -)$ for the two vectors at pair site $p$, and let $S_a$ flip the sign of slot $a$.
    Let $tau_(a b)$ exchange the two tensor slots, so the correction to $T$ is $n^(- 1) sum_(a < b) S_a
    S_b \( I + tau_(a b) \)$. Only states with at most two slots per pair site survive the mask.
    If exactly $k$ pair sites are odd, at most $2 k$ slots lie at odd sites.
    The mask preserves the entire set of odd sites, as well as the slot occupancies,
    so the following bounds can be checked before each mask insertion.
  The one-slot rank-one part of $T$ sends a minus slot from a site $p$ to a minus slot at any site $q$,
    with coefficient $1 \/ m$, and kills plus slots. When $p eq.not q$,
    it toggles the parity at precisely those two sites. Even–even moves have total absolute mass at most $r m \/
    m = r$. Odd–odd moves have at most $2 k$ source slots and $k$ target sites, giving $2 k^2 \/ m$.
    For moves preserving $k$, an odd source and even target cost at most $2 k$,
    whereas an even source and odd target cost at most $r k \/ m$.
    The same-site moves have total mass at most $r \/ m$. Thus this last term is $O \( p_(*) \)$,
    even when many occupied sites have even parity.
  The two-slot correction toggles the parities of the two sites holding $a \, b$;
    the slot exchange changes neither their occupancies nor these parity changes.
    Its two summands have total coefficient at most $2 \/ n$ per slot pair.
    Pairs at two even sites give mass $O \( r^2 \/ n \) = O \( r \)$;
    pairs at two odd sites give $O \( k^2 \/ n \)$; and pairs at one site of each parity give $O \( k r \/ n \) =
    O \( k \)$. A pair of slots at the same site leaves its parity unchanged.
    There are at most $r \/ 2$ such pairs, so their mass is $O \( r \/ n \) = O \( p_(*) \)$.
    Combining the two parts, and using $r \/ m lt.eq 2$, gives the absolute transition bounds
  $ upright("change in odd-site count") & + 2 & - 2 & 0\
T & C r & C k^2 \/ m & C \( k + p_(*) \) $
  for both rows and columns by self-adjointness. In particular the fixed-count cost at $k = 0$ is $O \( p_(*) \)$,
    not $O \( r \)$. Weight level $k = 2 z$ by $z ! \( r m \)^(- z \/ 2)$.
    The off-diagonal masses then become at most $C sqrt(p_(*)) \( z + 1 \)$ upward and $C sqrt(p_(*)) z$ downward.
    Every return path with $2 u$ off-diagonal steps has exponential-series weight bounded by
  $ e^(C p_(*) \| t \|) frac(\( C sqrt(p_(*)) \| t \| \( u + 1 \) \)^(2 u), \( 2 u \) !) e^(C \| t \| u) . $
  There are at most $4^u$ jump-direction lists with $2 u$ up or down steps;
    their intervening stays sum to the displayed exponential factor.
    The weights telescope to one on every path returning to level zero.
    Since $\( 2 u \) ! gt.eq \( 2 u \/ e \)^(2 u)$, the series excluding its zero-step term is bounded by a
    geometric series with ratio $C' p_(*) t^2 e^(C \| t \|)$.
    For fixed sufficiently small $\| t \|$ it is $O \( p_(*) t^2 \)$, which is absorbed in $e^(C p_(*) \| t \|)$.
    The matrices are self-adjoint, so the same absolute row bound applies to columns and Schur’s test proves (97).
    At $\| t \| = t_1 log \( 1 \/ p_(*) \)$, this ratio tends to zero if $t_1$ is a sufficiently small positive
    constant, while $p_(*) \| t \| arrow.r 0$. This proves (97) uniformly in $n \, r$.
  For $J$, the one-slot sign diagonal flips one sign at its current site.
    The difference of the half-uniform projections sends $e_(p \, +)$ to $m^(- 1) sum_q
    e_(q \, -)$ and $e_(p \, -)$ to $m^(- 1) sum_q e_(q \, +)$.
    In the first case only the target site’s parity changes, and in the second only the source site’s parity
    changes. Thus all these moves change $k$ by exactly one. Their upward mass is $O \( r \)$;
    downward moves either use one of the at most $2 k$ slots at odd sites or choose one of the $k$ odd target
    sites, for total $O \( k + r k \/ m \) = O \( k \)$. The correction $-
    n^(- 1) sum_(a < b) \( S_a + S_b \) \( I + tau_(a b) \)$ also toggles just one site’s parity.
    Its full mass is $O \( r^2 \/ n \)$, and its downward mass is $O \( k r \/ n \)$ because the toggled site must
    be odd. These are respectively $O \( r \)$ and $O \( k \)$, including coincident pair sites.
    Mask insertions preserve both conclusions. Consequently $J$ has upward and downward masses at most $C
    r$ and $C k$. A return of length $2 j$ therefore has total mass at most $\( C r j \)^j$.
    Expanding $e^(v J^2 \/ r)$ and using $j^j \/ j ! lt.eq e^j$ gives (97).
    The mask can be inserted between every step because its absolute row mass does not exceed one.
    Thus these estimates apply to injections, not only to unrestricted tensors. ◻
]

#proof[
  We first obtain a uniform estimate without the logarithmic factor.
    Suppose at size $m$ that $F_m prec.curly.eq e^(- a_m L_m)$ on every irreducible, with $0 < a_m lt.eq t_0$.
    On the parent $lambda$-space, centrality and (97) imply
  $ parallel P \( F_m ⊗ F_m \) P parallel lt.eq e^(- a_m ell) parallel P e^(a_m T) P parallel lt.eq
    e^(- a_m ell + C a_m r \/ n) lt.eq e^(- a_m \( 1 - 2 C \/ n \) ell) . $
  At one fixed sufficiently large dyadic size a positive $a_m$ is available from the strict finite-size norm gap.
    Starting above $4 C$, the product of the factors $1 - 2 C \/ n$ over doubled sizes is positive,
    since the sum of their deficits is finite. Thus for an absolute $a_0 > 0$ we have $parallel F_n \|_(V_lambda)
    parallel lt.eq e^(- a_0 ell)$; finitely many smaller sizes are absorbed by reducing $a_0$.
  This estimate will pay an $O \( r \)$ error. To obtain the additional $log \( n \/ r \)$ factor,
    we strengthen it by inducting on
  #[#set math.equation(numbering: n => "(98)")
   $ parallel F_n \|_(V_lambda) parallel lt.eq exp { - a H_n \( ell \) + D_0 max \( 0 \, 2 r - 1 \) } \, wide
     H_n \( x \) = x log \( n \/ x \) + x . $ <rec:generator-penalty-induction>]
  Take a unit vector in the range of $P$ in a minimal $r$-tuple realization of $V_lambda$.
    Decompose it by the set of labels in each half and by the two child position types.
    Squared component norms give the spectral probability law used below.
    If the occupancies are $j_0 + j_1 = r$ and the child first-row deficits are $r_0 \, r_1$, then $0 lt.eq
    r_i lt.eq j_i$, hence $r_0 + r_1 lt.eq r$. Let $ell_0 \, ell_1$ be the corresponding child generator values
    and put $z_i = ell_i \/ ell$. Since $ell_i lt.eq r_i lt.eq r lt.eq 2 ell$,
    the variables $z_i$ lie in $\[ 0 \, 2 \]$. The decrement is
  $ Z = H_n \( ell \) - sum_i H_m \( ell_i \) = (ell - sum_i ell_i) log \( n \/ ell \) +
    ell sum_i { z_i log \( 2 z_i \) - z_i + 1 \/ 2 } . $
  Since $z_i in \[ 0 \, 2 \]$ and $z log \( 2 z \) - z + 1 \/ 2 lt.eq C \( z - 1 \/ 2 \)^2$ there,
  #[#set math.equation(numbering: n => "(99)")
   $ Z lt.eq \( log \( n \/ ell \) + C \) \| T \| + C J^2 \/ r . $ <rec:generator-decrement>]
  For a unit vector in the range of $P$, spectral expectation in the commuting child algebra and Lemma 29 give
  #[#set math.equation(numbering: n => "(100)")
   $ bb(E) e^(2 a Z) lt.eq 3 \/ 2 wide \( r \/ n lt.eq p_0 \) $ <rec:generator-slack>]
  for sufficiently small absolute $a \, p_0$. For the absolute value in (99),
    use $\( e^(\| u \| \/ 2) - 1 \)^2 lt.eq C \( cosh u - 1 \)$ and both signs in (97);
    then use Cauchy–Schwarz and (97).
  For $r gt.eq 2$, the sum of the child penalties in (98) drops by at least one,
    except when $\( r_0 \, r_1 \)$ is $\( r \, 0 \)$ or $\( 0 \, r \)$.
    This persistence requires $j_0 = r$ or $j_1 = r$, respectively.
    On the range of $P$, this persistence event has weight at most $2^(1 - r)$.
    Indeed it requires all tuple coordinates in one half. If two occupy a matched pair it is impossible;
    otherwise independent switches give that probability exactly. The ratio in the induction is consequently at most
  $ sqrt(\( 3 \/ 2 \) 2^(1 - r)) + e^(- D_0) sqrt(3 \/ 2) lt.eq 1 $
  when $D_0$ is large. Level zero is trivial and level one is annihilated because a single card is uniform after
    one sweep. In the range $r \/ n > p_0$, the ratio $H_n \( ell \) \/
    r$ is bounded by a constant depending only on $p_0$, so a sufficiently large $D_0$ makes the right side of
    (98) at least one. This starts and closes that induction,
    with bounded sizes covered by the same finite choice of constants.
  It remains to remove the positive penalty. For a fixed sufficiently small $theta > 0$,
    geometrically interpolate the bound $e^(- a_0 ell)$ with (98).
    Because $2 D_0 r lt.eq 4 D_0 ell$, choose $theta$ so that $4 theta D_0 lt.eq \( 1 - theta \) a_0$.
    The penalty is then canceled and we obtain $parallel F_n \|_(V_lambda) parallel lt.eq
    e^(- theta a H_n \( ell \))$. Finally $r \/ 2 lt.eq ell lt.eq r$ gives $H_n \( ell \) gt.eq 1 /
    2 h_n \( r \)$ and proves the level estimate. ◻
]

=== 10.2 The induced tensor spaces and a single split <the-induced-tensor-spaces-and-a-single-split>

The level estimate is now complete. The remaining goal is the fourth-moment bound.
  We will prove it on larger representations containing $V_lambda$,
  because a trace of a positive power can only increase under such an enlargement.

More precisely, a list of categories with sizes $b_j$ and representations $V_(eta_j)$ defines

$ cal(M) = "Ind"_(product_j S_(b_j))^(S_n) ⨂_j V_(eta_j) \, wide sum_j b_j = n . $

Its log trace is $sigma = log "Tr"_(cal(M)) F_n^4$, with $sigma = - oo$ if the trace is zero.
  Empty categories may be omitted. An induced module will have categories of total size $n$.
  A row category consists of a diagram $eta$ of size $b$, an alphabet of dimension $q gt.eq ell \( eta \)$,
  where $ell \( eta \)$ is its number of rows, and an orientation, ordinary or sign-twisted.
  A regular category consists of a spatial diagram $kappa$ of size $b$ and $b$ distinct named labels.
  We may designate one ordinary one-row category of alphabet dimension one as the #emph[background];
  it may be empty. All other categories are #emph[payload],
  including ordinary one-row categories of alphabet dimension one.
  In the application the background is the original first row of $lambda$.
  Every descendant of a payload category remains payload after restriction or a change of alphabet.
  There is at most one background category in each node, so its child counts are determined by the payload counts
  and the two half sizes. Isomorphic categories remain distinct when their labels or origins differ.

For a row category $j$, $eta$ denotes the alphabet type before the sign twist.
  Its spatial factor $V_(eta_j)$ in $cal(M)$ is $V_eta$ in ordinary orientation and $V_eta ⊗ "sgn"_(S_b)
  tilde.equiv V_(eta')$ in sign-twisted orientation, where $eta'$ is the conjugate partition.
  In both orientations, $q gt.eq ell \( eta \)$ and the multiplicity $G_q \( eta \)$ below refer to this pre-twist
  diagram.

Realize row categories in signed tensor powers. Each category has its own alphabet;
  let $cal(H)$ be the space spanned by words specifying one alphabet symbol at each of the $n$ position slots,
  with the prescribed number of slots in each category. An adjacent swap contributes $-
  1$ exactly when both symbols are odd; these adjacent swaps generate the graded permutation action.
  Use odd symbols precisely for sign-twisted categories. This gives the indicated representation on the stabilizer
  of a category allocation, and induction sums over allocations.
  In a regular category, each named label appears once. The commuting group is $U \( q \)$ for each row alphabet
  and $S_b$ acting on the names of each regular category. Let $E$ be the product of their isotypic projections
  onto the row types $eta$ and regular types $kappa$. On a fixed category allocation,
  Schur–Weyl duality and the regular bimodule decomposition give the spatial tensor product and its multiplicity
  space. Summing over allocations therefore gives

#[#set math.equation(numbering: n => "(101)")
 $ g = product_(upright("row")) G_q \( eta \) product_(upright("regular")) D_kappa $ <rec:alphabet-multiplicity>]

copies of the desired spatial induced module:

$ E cal(H) tilde.equiv bb(C)^g ⊗ cal(M) . $

Here $G_q$ is the dimension of the polynomial $U \( q \)$ representation.
  Spatial permutations act trivially on $bb(C)^g$, so $E$ commutes with the network operators and a spatial trace
  on $E cal(H)$ is $g$ times the trace on $cal(M)$.

A child projection $W$ specifies counts $b_0 + b_1 = b$ and types $mu \, nu$ in the two halves of each category.
  For a row category, use the two child $U \( q \)$ isotypic projections,
  which commute with the diagonal $U \( q \)$ action and hence with $E$.
  For a regular category first fix its subset of $b_0$ names in the first half and project the two name groups
  onto $mu \, nu$; then sum these orthogonal projections over all $binom(b, b_0)$ subsets.
  This sum preserves each name subset and is invariant under global relabeling, so it also commutes with $E$.
  The projections $W$ sum to the identity and commute with $Q = F_m ⊗ F_m$.
  Only types with positive Littlewood–Richardson coefficient for the parent type contribute to $W E$;
  we call these choices compatible. All row types in this description are taken before their inherited sign twist.
  Write $g_i$ for the multiplicity (101) evaluated on the induced module in half $i$. Put

$ cal(L) = n log n - sum_(upright("row")) sum_i eta_i log eta_i - sum_(upright("regular")) b log b . $

#thm([Lemma 10.3.])[
  #emph[For compatible parent and child types,
$ parallel W P E parallel^2 lt.eq product_(upright("row")) G_q \( mu \) G_q \( nu \) thin
  e^(- \( cal(L) - cal(L)_0 - cal(L)_1 \) \/ 2) . $

]
] <rec:alphabet-angle>

#proof[
  Choose block density matrices $A \, B$ on the one-site alphabet.
    On a row block their spectra are $\( mu_i \/ m \)$ and $\( nu_i \/ m \)$;
    on a regular block they are scalar $b_0 \/ \( m b \)$ and $b_1 \/ \( m b \)$.
    Their traces, summed over all blocks, are one. If $V$ applies $A^(1 \/ 2)$ in the first half and $B^(1 \/ 2)$
    in the second, then
  #[#set math.equation(numbering: n => "(102)")
   $ P V P lt.eq P (\( \( A + B \) \/ 2 \)^(1 \/ 2))^(⊗ n) P . $ <rec:alphabet-geometric-mean>]
  This is the needed joint-concavity instance for the operator geometric mean;
    see also #cite(label("FawziSaunderson2020")) Appendix A.2.1, Lemma 4. We include its block-matrix proof.
    On one matched pair, average the two positive block matrices with diagonal entries $A ⊗ I \,
    I ⊗ B$ and $B ⊗ I \, I ⊗ A$. Their positive off-diagonal blocks are the respective geometric means.
    The maximal positive off-diagonal block with diagonal entries $X \,
    Y$ is $X^(1 \/ 2) \( X^(- 1 \/ 2) Y X^(- 1 \/ 2) \)^(1 \/ 2) X^(1 \/ 2)$,
    by the Schur complement and monotonicity of square roots.
    Averaging and then tensoring proves (102); continuity handles zero eigenvalues.
    The signed flips cause no change because the matrices respect category blocks.
  For one row category, average the eigenbasis of $A$ over $U \( q \)$.
    On child type $mu$, Schur’s lemma makes the averaged operator $\( A^(1 \/ 2) \)^(⊗ b_0)$ scalar on its
    multiplicity space. Its scalar is the Schur character $s_mu$ divided by $G_q \( mu \)$,
    and the highest-weight monomial gives the lower bound
  $ frac(s_mu \( sqrt(mu_1 \/ m) \, dots.h \, sqrt(mu_q \/ m) \), G_q \( mu \)) gt.eq
    frac(product_i \( mu_i \/ m \)^(mu_i \/ 2), G_q \( mu \)) . $
  Zero exponents contribute one. Apply the same calculation to $B$ and $nu$,
    independently in every row block and in the two halves. A regular block contributes the scalar
    $\( b_0 \/ \( m b \) \)^(b_0 \/ 2) \( b_1 \/ \( m b \) \)^(b_1 \/ 2)$.
    Multiplication therefore shows that the average of $V$ dominates $W$ times
  $
    frac(exp \[ - \( cal(L)_0 + cal(L)_1 + sum_(upright("regular")) b log b \) \/ 2 \], product_(upright("row"))
    G_q \( mu \) G_q \( nu \)) . $
  For the parent bound put $C = \( A + B \) \/ 2$. If $x_(j \, i)$ are its eigenvalues in nonincreasing order in
    each row block, the norm of $\( C^(1 \/ 2) \)^(⊗ b)$ on parent type $eta$ is the highest-weight product
    $product_i x_(j \, i)^(eta_i \/ 2)$. The regular blocks of $C$ are each $1 \/
    n$ times the identity on their $b$ names. All eigenvalues of $C$ sum to one. The entropy maximization
  $ product_(upright("row") \, i) x_(j \, i)^(eta_(j \, i) \/ 2) thin n^(- s \/ 2) lt.eq
    product_(upright("row") \, i) \( eta_(j \, i) \/ n \)^(eta_(j \, i) \/ 2) n^(- s \/ 2) $
  follows by maximizing subject to the remaining row trace $1 - s \/ n$, where $s$ is the regular mass.
    Thus on $E$ the right side of (102) has norm at most
    $exp \[ - \( cal(L) + sum_(upright("regular")) b log b \) \/ 2 \]$.
    This upper bound is uniform in the eigenbases just averaged.
    Compress the averaged inequality by $E$ and use $E P W P E = \( W P E \)^(*) \( W P E \)$.
    Dividing the parent bound by the child scalar proves the lemma.
    Sign twists change only the spatial action, so the same multiplicity-space calculation applies in either
    orientation. ◻
]

Take $p = 4$, and let $Y = W Q gt.eq 0$. The needed Schatten inequality is

#[#set math.equation(numbering: n => "(103)")
 $ "Tr" \( E P Y P E \)^p lt.eq parallel W P E parallel^(2 p - 4) "Tr" \( P Y^(p \/ 2) P \)^2 . $ <rec:alphabet-strip>]

Indeed apply three-lines interpolation to $Y^(p z \/ 4) W P E$, extended by zero on the kernel of $Y$,
  between the operator norm at $Re z = 0$ and the fourth Schatten norm at $Re z = 1$.
  At $z = 2 \/ p$ the target norm is the $2 p$ norm. Raising the interpolation inequality to $2 p$ gives (103):
  at the fourth-norm endpoint first obtain $"Tr" \( E P Y^(p \/ 2) P E \)^2$,
  then drop the orthogonal compression by $E$ using Hilbert–Schmidt contraction.
  Thus no commutation of $P$ with $Y$ is required.

#thm([Lemma 10.4.])[
  #emph[Let $s$ be the total number of named labels and $sigma_i = log "Tr" F_m^4$ on the child induced modules.
    If $m gt.eq 2$,
#[#set math.equation(numbering: n => "(104)")
 $ "Tr" \( P Y^2 P \)^2 lt.eq g_0 g_1 e^(sigma_0 + sigma_1) thin 2^(gamma s \/ 2) product_(upright("regular"))
   (2^(- b) binom(b, b_0)) \, wide gamma = frac(log_2 3, 2) < 1 . $ <rec:alphabet-pair-trace>]

 For $m = 1$ the inflation $2^(gamma s \/ 2)$ may be replaced by $2^(s \/ 2)$.]
] <rec:alphabet-cycle-inflation>

#proof[
  Collapse each matched pair of tensor slots to its unordered contents.
    On such an orbit, $P$ has rank at most one and its nonzero vector has constant absolute coefficient.
    For orbit states $C \, D$, let $j \( C \, D \)$ be the number of cycles in the union of the two partial
    matchings on named labels, counting a common edge twice as a cycle.
    The fraction of orientation pairs agreeing on the labels’ half assignments is $2^(- s + j \( C \, D \))$.
    Indeed, if the two matchings have $a \, a'$ edges, their separate half assignments number $2^(s - a)$ and
    $2^(s - a')$. The union has $2^(s - a - a' + j \( C \, D \))$ assignments,
    since each cycle has one redundant opposite-half condition. Dividing gives the fraction.
    Cauchy–Schwarz therefore bounds the squared orbit entry by
  #[#set math.equation(numbering: n => "(105)")
   $ 2^(- s + j \( C \, D \)) sum_(u \, v) \| Y^2 \( u \, v \) \|^2 . $ <rec:alphabet-orbit-entry>]
  Here the sum is over word pairs in the two orbits; entries of $Y^2$ vanish unless each named label stays in its
    assigned half. For such a word pair $u \, v$, let $A_(*) \,
    B_(*) subset.eq \[ m \]$ be the first-half sites occupied by names in $u \, v$, respectively,
    and let $C_(*) \, D_(*)$ be the corresponding second-half site sets.
    The partial bijections $f : A_(*) arrow.r B_(*)$ and $g : C_(*) arrow.r
    D_(*)$ follow each named label from $u$ to $v$. A subset $U subset A_(*) ∩ C_(*)$ satisfies $f \( U \) =
    g \( U \)$ exactly when it is a union of closed components of the resulting partial permutation.
    These components are the cycles counted by $j \( C \, D \)$, so the number of such subsets is $2^(j \( C \, D \))$.
  Let $tau$ range uniformly over the last matching switches in the second child,
    and apply it to the second-half sites of the output word $v$. This replaces $g$ by $tau g$, leaving $f$ fixed.
    The squared kernel weight is unchanged: $W$ commutes with these spatial permutations,
    and the positive power of $Q$ has range fixed by them. For each $U$, the probability of $f \( U \) =
    tau g \( U \)$ is either zero or $\| cal(O) \( g \( U \) \) \|^(- 1)$,
    where $cal(O)$ is the matching group orbit. Thus averaging inside the sum over word pairs bounds the subset count by
  $ sum_(X subset g \( A_(*) ∩ C_(*) \)) \| cal(O) \( X \) \|^(- 1) . $
  A switch pair with two available slots contributes $1 + 2 \( 1 \/ 2 \) + 1 = 3$;
    one available slot contributes $1 + 1 \/ 2 lt.eq sqrt(3)$.
    Since $\| A_(*) ∩ C_(*) \| lt.eq min \( s_0 \, s_1 \) lt.eq s \/ 2$,
    where $s_i$ is the number of names in half $i$, the product is at most $3^(s \/ 4) = 2^(gamma s \/ 2)$.
    Sum (105) over words. For a fixed choice of name subsets the unswitched trace is $g_0 g_1
    e^(sigma_0 + sigma_1)$. The aggregated projection is their orthogonal direct sum, giving
  #[#set math.equation(numbering: n => "(106)")
   $ "Tr" Y^4 = "Tr" \( W Q^4 \) = (product_(upright("regular")) binom(b, b_0)) g_0 g_1 e^(sigma_0 + sigma_1) .
     $ <rec:alphabet-aggregated-trace>]
  Together with the factor $2^(- s)$ this proves the result.
    The named subsets enter through this trace identity exactly once.
    At $m = 1$, simply use $j \( C \, D \) lt.eq s \/ 2$. ◻
]

We can now pass from the count-space trace to the desired spatial trace.
  Let $M$ be the number of compatible child projections $W$.
  For each payload category of size $b$, the count split and two child partitions have at most
  $exp \( C b^(2 \/ 3) \)$ choices, by the partition bound.
  The single background has no type choice and its counts are determined by the payload counts.
  Therefore $log M lt.eq C sum_(upright("payload")) b^(2 \/ 3)$.
  Named subsets are already aggregated in $W$ and are not choices counted by $M$.

Resolve $Q = sum_W W Q$ on $E cal(H)$. The Schatten triangle inequality, followed by (103) with $p = 4$,
  the angle bound, and (104), gives, for $m gt.eq 2$,

#[#set math.equation(numbering: n => "(107)")
 $ g e^sigma & = "Tr" \( E P Q P E \)^4\
 & lt.eq M^4 max_W { e^(sigma_0 + sigma_1 - \( cal(L) - cal(L)_0 - cal(L)_1 \))
   [product_(upright("row")) G_q \( mu \) G_q \( nu \)]^2\
 & #h(5em)   times g_0 g_1 2^(gamma s \/ 2) product_(upright("regular")) 2^(- b) binom(b, b_0) } .
   $ <rec:alphabet-master-split>]

The angle contributes two copies of each child row carrier, and the child trace contributes a third.
  Dividing by $g$ and taking logarithms therefore yields the explicit bound

$ sigma lt.eq max_W { & sigma_0 + sigma_1 + 4 log M - \( cal(L) - cal(L)_0 - cal(L)_1 \)\
 & + sum_(upright("row")) \[ 3 log G_q \( mu \) + 3 log G_q \( nu \) - log G_q \( eta \) \]\
 & +
   sum_(upright("regular")) \[ log D_mu + log D_nu - log D_kappa + \( gamma \/ 2 - 1 \) b log 2 + log binom(b,
   b_0) \] } . $

For $m = 1$ replace $gamma$ by one, at an extra cost $O \( s \)$.
  This calculation motivates the potentials that we now telescope.

For a diagram of size $b$, put $I \( eta \) = sum_i eta_i log \( b \/ eta_i \)$ and set $delta = 1 \/ 32$.
  Give categories the potentials

#[#set math.equation(numbering: n => "(108)")
 $ phi.alt \( eta \) = delta I \( eta \) quad upright("(row)") \, wide phi.alt \( kappa \) = log D_kappa -
   frac(1 - delta, 2) b log b quad upright("(regular)") . $ <rec:alphabet-potentials>]

Let $Phi$ be their sum. For every category with child counts $b_0 + b_1 = b$, define

$ v_b = b { log 2 - H_2 \( b_0 \/ b \) } \, wide H_2 \( x \) = - x log x - \( 1 - x \) log \( 1 - x \) \, $

with $v_0 = 0$. Thus $H_2$ uses natural logarithms in this section,
  and $v_b$ is the loss from an imbalanced count split. The preceding lemmas imply the single-split accounting
  inequality

#[#set math.equation(numbering: n => "(109)")
 $ sigma lt.eq max { & sigma_0 + sigma_1 - \( Phi - Phi_0 - Phi_1 \) - sum_(upright(p a y l o a d med r o w)) v_b\
 & + C_1 sum_(upright("payload")) b^(2 \/ 3) + C_1 sum_(upright(p a y l o a d med r o w)\
q gt.eq 2) q^2 log \( e \( 1 + b \/ q^2 \) \) + C_1 s upright(bold(1))_(m = 1) } . $ <rec:alphabet-split-budget>]

Here the maximum is over compatible child counts and types. To derive this form from (107), use the Cauchy identity

$ sum_(xi tack.r b\
ell \( xi \) lt.eq q) G_q \( xi \)^2 = binom(b + q^2 - 1, q^2 - 1) . $

It bounds the positive child row-carrier logarithms by $C q^2 log \( e \( 1 + b \/ q^2 \) \)$; for $q =
  1$ all carrier factors are one. Discarding the favorable parent carrier logarithm only increases the bound. Also

$ cal(L) - cal(L)_0 - cal(L)_1 = sum_(upright("all")) v_b +
  sum_(upright("row")) \( I \( eta \) - I \( mu \) - I \( nu \) \) \, $

and both sums have nonnegative summands. Indeed compatibility implies that $mu + nu$ dominates $eta$;
  Schur concavity followed by entropy concavity gives $I \( eta \) gt.eq I \( mu + nu \) gt.eq I \( mu \) +
  I \( nu \)$. Retain $- v_b$ for payload rows and replace the negative row-entropy decrement by $-
  delta \[ I \( eta \) - I \( mu \) - I \( nu \) \]$. The unused background and regular imbalances are nonnegative
  and may be discarded. For a regular category the carrier ratio gives $log D_mu + log D_nu - log D_kappa$,
  and $log binom(b, b_0) lt.eq b H_2 \( b_0 \/ b \)$ gives $\( gamma \/ 2 - 1 \) b log 2 +
  b H_2 \( b_0 \/ b \) lt.eq \( 1 - delta \) b H_2 \( b_0 \/ b \) \/ 2$ because $delta < 1 - gamma$. This proves (109).

=== 10.3 Changing alphabets and paying for the changes <changing-alphabets-and-paying-for-the-changes>

The case $r = 0$ is the trivial representation and satisfies both bounds with equality. Assume $r > 0$.
  Embed $V_lambda$ in the module induced from its first row as background and $rho$ as payload.
  Fix large absolute $A$ and then a much larger $K$. To tune a diagram of size $b$,
  take its rows longer than $K sqrt(b)$ as one row category;
  in the remaining diagram take columns longer than $K sqrt(b)$ as another row category,
  with orientation reversed. Put the residual diagram $S$ in a regular category.
  Here is the representation containment used in this operation.
  If $R$ is the selected top-row diagram and $xi$ the remainder, the parent is their sorted-row union,
  whose Littlewood–Richardson coefficient in $"Ind" \( V_R ⊗ V_xi \)$ is one.
  Apply the transposed version of this fact to remove the selected columns from $xi$.
  Transitivity of induction then embeds the parent in the module of the three resulting parts.
  Selected rows inherit the old orientation, and selected columns reverse it.
  If the old orientation was twisted, the residual regular spatial diagram is $S'$ rather than $S$; $D_(S') =
  D_S$, so its potential is unchanged. These conventions pass the old sign twist to every spatial factor.
  Thus tuning enlarges the spatial module, and its positive-power trace can only increase.
  Choosing a new alphabet afterward changes the multiplicity space in which that spatial module is realized.
  At the root only, group the selected row lengths $l$ by $floor.l log_2 \( r \/ l \) floor.r$,
  keeping the two orientations separate. No later tuning uses this grouping.

Assign a new row category its actual oriented height $q$. A regular category stays regular.
  A row category of $q = 1$ never changes. For $q gt.eq 2$, retain its alphabet while $b gt.eq A q^2$;
  when $0 < b < A q^2$, end that phase and tune the current diagram afresh. At birth,

#[#set math.equation(numbering: n => "(110)")
 $ q_(upright("new")) lt.eq sqrt(b) \/ K \, wide b_(upright("new")) gt.eq K^2 q_(upright("new"))^2 \; wide
   q_(upright("new")) lt.eq q \/ L med upright("at an exit") \, quad L = K \/ sqrt(A) > 1 . $ <rec:alphabet-birth-exit>]

Thus no immediate retuning is needed and alphabet dimensions shrink geometrically along successive phases.

Let $b_j$ be the initial payload category sizes, $I_0$ the sum of their row entropies,
  $s_0$ the initial regular size, and $J_(upright("in")) = sum b_j log \( r \/ b_j \)$.
  Hook products and the long-row construction give

#[#set math.equation(numbering: n => "(111)")
 $ Phi_(upright("in")) & gt.eq delta I_0 + delta / 2 s_0 log s_0 - C_K r \,\
log D_lambda & lt.eq log binom(n, r) + I_0 + 1 / 2 s_0 log s_0 + J_(upright("in")) \,\
sum_(j med upright("row")) b_j log q_j & lt.eq I_0 + r log 2 \, wide J_(upright("in")) lt.eq epsilon.alt I_0 +
  C_epsilon.alt r . $ <rec:alphabet-initial-potential>]

Here are the dimension and entropy estimates underlying these bounds.
  The residual diagram has every row and column of length at most $K sqrt(r)$,
  so its hooks are at most $2 K sqrt(r)$ and

$ D_S gt.eq s_0 ! \/ \( 2 K sqrt(r) \)^(s_0) . $

Together with $s_0 log \( r \/ s_0 \) lt.eq C r$, this proves the first line.
  For the dimension upper bound, induced-module containment contributes $binom(n, r)$ and the payload allocation
  multinomial. Bound these by their entropy expressions, each row-category dimension by $e^(I \( eta \))$,
  and the residual dimension by $sqrt(s_0 !)$. This gives (111).

Within each initial row category the positive row lengths differ by at most a factor two.
  Its row distribution therefore has entropy at least $log q_j - log 2$, proving the first assertion of (111).
  To prove the second, choose a uniform payload box. Its category is determined by a flag for the row, column,
  or residual part and, for a row or column part, a nonnegative dyadic group index $Z$, taking $Z =
  0$ on the residual part. These data have entropy $J_(upright("in")) \/ r$.
  The mean of $Z$ is at most $\( I_0 + J_(upright("in")) \) \/ \( r log 2 \)$,
  because a row of length $l$ contributes $log_2 \( r \/ l \)$ before taking the integer part.
  For any $alpha > 0$, relative entropy against the geometric law proportional to $e^(- alpha z)$ gives $H \( Z \)
  lt.eq alpha bb(E) Z + C_alpha$. Adding the flag entropy, which is at most $log 3$,
  and choosing $alpha$ sufficiently small gives $J_(upright("in")) lt.eq epsilon.alt I_0 +
  C_epsilon.alt r$ after rearrangement. This is the reason for grouping at the root;
  no subsequent tuning needs that extra grouping.

We detail the amortization, because using one fixed alphabet would leave a divergent carrier cost.
  At an exit of mass $b$, the adverse potential jump is at most

#[#set math.equation(numbering: n => "(112)")
 $ C_2 b + C_K s_(upright("new")) + C_2 b log_(+) \( q^2 \/ b \) . $ <rec:alphabet-exit-jump>]

To verify this jump estimate, denote by $R \, C \, S$ the new row, column, and residual parts,
  of respective sizes $\| R \| \, c_(*) \, s$. Entropy of the part assignment gives

$ I_(upright("row")) \( eta \) lt.eq I_(upright("row")) \( R \) + I_(upright("row")) \( C \) +
  I_(upright("row")) \( S \) + b log 3 . $

Since the old height is at most $q$,

$ I_(upright("row")) \( C \) - I_(upright("col")) \( C \) lt.eq c_(*) log q - c_(*) log \( c_(*) \/ q \) \, wide
  I_(upright("row")) \( S \) lt.eq s log q . $

The hook bound for the residual gives

$ phi.alt \( S \) gt.eq delta / 2 s log b - C_K s - frac(1 + delta, 2) s log \( b \/ s \) . $

Substituting these inequalities and using $x log \( b \/ x \) lt.eq C b$ for $0 < x lt.eq b$ proves (112);
  empty parts contribute zero. The total mass ever converted to regular categories is at most $r$,
  because a regular category never becomes a row category again.
  We therefore charge the $C_K s_(upright("new"))$ term only once to each converted box,
  for a total at most $C_K r$. The linear term $C_2 b$ in (112) will be charged to the total exit mass.
  Only its logarithmic excess needs an imbalance saving.

Call a split balanced when both child masses are in $\[ b \/ 4 \, 3 b \/ 4 \]$.
  During a phase with $q gt.eq 2$ the parent mass satisfies $b gt.eq A q^2$.
  At an unbalanced split, $v_b gt.eq theta b$, where $theta = log 2 - H_2 \( 1 \/ 4 \) > 0$. Put

$ f \( t \) = frac(log \( e \( 1 + t \) \), t) \, wide t > 0 . $

The carrier cost is $C_1 b f \( b \/ q^2 \) lt.eq C_1 b f \( A \)$, since $f$ is decreasing.
  If a child of mass $x$ exits at this split, then

$ x log_(+) \( q^2 \/ x \) lt.eq q^2 \/ e lt.eq b \/ \( e A \) . $

There are at most two exiting children. Choose $A gt.eq 4$ so large that $C_1 f \( A \) + 2 C_2 \/ \( e A \) lt.eq
  theta \/ 2$. The carrier cost and these logarithmic excesses are then bounded by half of the negative imbalance
  term. At a balanced exit, $x gt.eq b \/ 4 gt.eq A q^2 \/ 4 gt.eq q^2$, so the logarithmic excess is zero.
  No $K$-dependent constant has entered this choice of $A$.

It remains to sum carrier costs at balanced nodes of a phase, which may form a branching subtree.
  Distribute each such cost evenly among its $b$ boxes. A box pays $C_1 f \( b \/ q^2 \)$.
  Along its balanced ancestors, successive masses decrease by a factor at most $3 \/ 4$,
  even if unbalanced nodes intervene. Reversing the sequence and using $b \/ q^2 gt.eq A$ gives

$ sum_(upright("balanced ancestors")) f \( b \/ q^2 \) lt.eq sum_(j gt.eq 0) f \( A \( 4 \/ 3 \)^j \) lt.eq
  frac(C log \( e \( 1 + A \) \), A) . $

Summing over boxes bounds the balanced cost by a constant times the phase’s birth mass.
  The constant depends on the fixed $A$ and is independent of $K$.
  The exit frontier has total mass at most that birth mass, so it also pays the linear exit cost $C_2 b$.
  By (110), a box initially in row category $j$ encounters at most $1 + log q_j \/ log L$ phases:
  each retuning reduces the new alphabet by a factor $L$, and regular conversion ends the sequence.
  Each of the total birth mass and the total exit mass is consequently at most

$ sum_(j med upright(i n i t i a l med p a y l o a d med r o w)) b_j \( 1 + log q_j \/ log L \) . $

The $b^(2 \/ 3)$ term is also summable, including categories that stay small through many ambient levels.
  At a balanced split,

$ b_0^(2 \/ 3) + b_1^(2 \/ 3) - b^(2 \/ 3) gt.eq c b^(2 \/ 3) . $

The power sum cannot decrease at any other split or conversion and its terminal value is $r$,
  so all balanced costs sum to $O \( r \)$. For unbalanced splits, the positive error satisfies the numerical bound

$ sum_(upright("unbalanced")) b^(2 \/ 3) lt.eq sum_(upright("unbalanced")) b lt.eq
  theta^(- 1) sum_(upright("unbalanced")) v_b . $

To bound the last sum, the scalar count entropy $b log \( n \/ b \)$ at ambient size $n$ decreases by exactly
  $v_b$ at a split. A conversion increases it by $sum_j b_j^(upright("new")) log \( b \/ b_j^(upright("new")) \)$.
  Its terminal value is zero, so summing all the nonnegative decrements gives

#[#set math.equation(numbering: n => "(113)")
 $ sum_(upright(p a y l o a d med s p l i t s)) v_b = r log \( n_(upright("root")) \/ r \) + J_(upright("in")) +
   sum_(upright("exits")) sum_j b_j^(upright("new")) log \( b \/ b_j^(upright("new")) \) .
   $ <rec:alphabet-count-telescope>]

This identity bounds the total positive error by the initial count entropy and the conversion entropies;
  it makes no further subtraction of the operator term $- v_b$.
  Each exit creates at most three categories, so its last sum is at most $b log
  3$ and is covered by the phase-mass bound. Finally the $m = 1$ term costs at most $C r$.

Iterating (109) down to single sites, whose log trace is zero, now gives

#[#set math.equation(numbering: n => "(114)")
 $ sigma_(upright("in")) lt.eq - Phi_(upright("in")) + C_K r + C_3 { r log \( n \/ r \) + J_(upright("in")) +
   r } + frac(C_3, log L) sum_(j med upright("row")) b_j log q_j . $ <rec:alphabet-telescoped>]

Here $C_3$ depends on the already fixed $A$, but not on $K$; all $K$-dependent losses are in $C_K r$.
  Choose $K$ after $A$ so that $C_3 \/ log L$ is small compared with $delta$,
  and then choose $epsilon.alt$ in (111) sufficiently small. Equations (111)– (114) yield

$ sigma_(upright("in")) lt.eq - delta / 2 I_0 - delta / 2 s_0 log s_0 + C h_n \( r \) . $

The dimension comparison (111) proves (95). Combining its fourth-root bound with (95),
  in proportions chosen to cancel the positive $C h_n \( r \)$ term, proves the final assertion of Theorem 28.

For clarity, this also supplies a complete mixing consequence.
  Choose an absolute integer $q$ so large that the dimension powers are absorbed in

$ "Tr"_(upright("reg")) F_n^q - 1 lt.eq sum_(r = 1)^(n - 1) 2^r e^(- c_2 q h_n \( r \)) = o \( 1 \) \, $

where $c_2 > 0$ is absolute after increasing $q$. The count $2^r$ bounds partitions of the lower diagram.
  Split at $r = sqrt(n)$ to see that the sum tends to zero:
  below it $h_n \( r \) gt.eq 1 / 2 r log n$, and above it $h_n \( r \) gt.eq r$.
  Schatten Hölder bounds the squared Hilbert–Schmidt norm of the nonconstant part of $T_n^q$ by this positive
  moment, without requiring normality. Plancherel and translation therefore give total-variation convergence from
  every initial deck after $q$ sweeps, or $q d$ physical shuffles.

== 11 Core charges and a low-dimension cutoff <rec:sec-cutoff>

The previous recursions used either the first-row level or a changing tensor alphabet.
  Here the cost of a restriction is charged directly to boxes lying beyond the first several rows and columns of a
  Young diagram. The goal is again a negative dimension power for one sweep,
  but the intermediate statement concerns a specific projection at its midpoint:
  types with small product dimension have exponentially small overlap with the full sweep.

There are two bounds for each weighted cycle factor. One depends only on the diagrams,
  and the other depends on their actual positive traces. We choose between them while expanding the recursion.
  The second choice must use the traces at the current frontier;
  a later upper bound cannot replace them before the choice is made. We make that invariant explicit below.

Logarithms in this section are to base two, unless $ln$ is written.
  For a nontrivial diagram $lambda tack.r n$, put $F_lambda = log_2 D_lambda$, $k = n - lambda_1$, and $L =
  log_2 \( n \/ k \)$. For a box $x$ let $a \( x \) = min \( "row" \( x \) \, "column" \( x \) \)$,
  with indices beginning at one. We call a type surviving if its sweep matrix is nonzero; for $n gt.eq
  2$ it then has at most $n \/ 2$ rows. Traces with zero contribution may be omitted throughout.
  For $s gt.eq 0$ define the core count

$ u_s \( lambda \) = \# { x in lambda : a \( x \) > s } . $

Thus the core is what remains after deleting the first $s$ rows and the first $s$ columns.
  Although its box coordinates shift under deletion, its remaining row lengths form a straight Young diagram.

#thm([Theorem 11.1.])[
  #emph[There is an absolute $c > 0$ such that $parallel T_n \|_(V_lambda) parallel_(upright("op")) lt.eq
    2^(- c F_lambda)$ for every surviving nontrivial type.]
] <rec:core-power-main>

=== 11.1 Dimension charges and the local sparse estimate <dimension-charges-and-the-local-sparse-estimate>

We need two elementary inputs, uniformly over surviving nontrivial types for all sufficiently large dyadic $n$:

#[#set math.equation(numbering: n => "(115)")
 $ F_lambda gt.eq b k \, wide 1 lt.eq k lt.eq n^(1 \/ 100) med arrow.r.double med
   parallel T_n \|_(V_lambda) parallel lt.eq 2^(- b_1 k log_2 n) \, $ <rec:core-dimension-sparse>]

where $b \, b_1 > 0$ are absolute. We prove the sparse estimate locally because its range grows with $n$.

For the dimension estimate, write $tau$ for the diagram below the first row. The hook formula gives

$ D_lambda = binom(n, k) D_tau #scale(x: 240%, y: 240%)[\/] product_(j lt.eq lambda_1)
  (1 + frac(tau'_j, lambda_1 - j + 1)) . $

The denominator is at most $2^k$: for an integer $t gt.eq 0$ and positive integer $a$, $1 + t \/ a lt.eq 2^t$,
  and $sum_j tau'_j = k$. When $k lt.eq n \/ 8$, the bound $binom(n, k) gt.eq \( n \/ k \)^k$ proves $F_lambda
  gt.eq 2 k$. For $k gt.eq n \/ 8$, first suppose that a first row or first column has length $a gt.eq n \/ 10$.
  Transpose if needed and retain that row together with $v = floor.l n \/ 100 floor.r$ boxes below it.
  Such a subdiagram exists: after transposition its tail has at least $n \/
  8$ boxes if the chosen row was the original first row, and at least $n \/ 2$ if it was the first column.
  Tableaux of a subdiagram extend to the full diagram. The same formula on this smaller diagram gives $D_lambda
  gt.eq binom(a + v, v) 2^(- v)$, exponential in $n$. If both the first row and first column are shorter than
  $n \/ 10$, every hook is shorter than $n \/ 5$ and Stirling’s inequality gives $D_lambda gt.eq \( 5 \/ e \)^n$.
  These cases prove the first estimate. They also show $F_lambda = O \( k log n \)$ on the sparse range,
  the upper bound following from $D_lambda lt.eq binom(n, k) D_tau$ and $D_tau lt.eq sqrt(k !)$.

To prove the second estimate, realize $V_lambda$ on ordered injections of $k$ labels.
  A function of that exact position type is harmonic in each label slot, because the type does not occur on $k -
  1$ slots. For distinct input positions $x_a \, x_b$, let $h_(a b)$ be their largest differing bit index in the
  sweep order. For $J subset.eq \[ k \]$ put

$ g_J \( x \, y \) =
  product_(a < b : thin a \, b in J)
  (1 - upright(bold(1))_({ y_(a \, < h_(a b)) = y_(b \, < h_(a b)) }) \( - 1 \)^(y_(a \, h_(a b)) + y_(b \, h_(a
  b)))) . $

The individual route from an input to an output is unique.
  Two labels can first share a switch only at $h_(a b)$, when their earlier output bits agree.
  Equal output bits also at $h_(a b)$ make the prescription impossible, giving a zero factor;
  opposite bits give one common fair coin in place of two, giving a factor two. Otherwise the factor is one.
  Thus $n^(- \| J \|) g_J$ is exactly the prescribed subtuple transition probability,
  including zero for incompatible routes.

The number of shared switches among $s$ compatible paths is at most $s log_2 s \/ 2$,
  by splitting at the last coordinate and adding $min \( s_0 \, s_1 \)$ to the two child counts.
  The binary entropy inequality pays this addition. Hence $0 lt.eq g_J lt.eq k^(k \/ 2)$.
  On the exact position type we may replace $g_(\[ k \])$ by

$ g' \( x \, y \) = sum_(J subset.eq \[ k \]) \( - 1 \)^(k - \| J \|) g_J \( x \, y \) : $

every omitted-slot term is annihilated by harmonicity. This sum has absolute value at most $2^k k^(k \/ 2)$.
  Moreover it vanishes if some label is isolated in the potential-contact graph,
  whose edge $a b$ is the event $y_(a \, < h_(a b)) = y_(b \, < h_(a b))$;
  the terms with and without that isolated label then cancel in pairs.

A graph without isolated vertices contains a spanning forest without isolated vertices,
  and such a forest has at least $ceil.l k \/ 2 ceil.r$ edges.
  For independent uniform, unrestricted binary strings $x \, y$, declare that $a b$ is not an edge when $x_a =
  x_b$; on distinct input pairs use the potential-contact condition above.
  An edge constraint in a forest costs $d \/ n$ when a leaf is integrated out:
  the possible last differing input bit $h$ has probability $2^(h - 1) \/ n$,
  and agreement of the earlier output bits costs $2^(- \( h - 1 \))$.
  Successive leaf removal therefore multiplies these costs.
  There are at most $k^(2 k + 1)$ forests to include in the union bound.
  Conditioning both endpoint tuples to be injective costs at most two on $k lt.eq n^(1 \/ 100)$ for large $n$.
  Consequently

$ Pr \( upright("no isolated label") \) lt.eq 2 k^(2 k + 1) \( d \/ n \)^(ceil.l k \/ 2 ceil.r) lt.eq
  2^(- \( 2 \/ 5 \) k log_2 n) wide \( k gt.eq 2 \) . $

The tuple kernel density relative to uniform has the additional factor $\( n \)_k \/ n^k lt.eq 1$.
  Its compressed Hilbert–Schmidt norm is therefore at most $2^k
  k^(k \/ 2)$ times the square root of this probability. This is $2^(- b_1 k log_2 n)$ for an absolute $b_1 > 0$,
  after increasing the lower size threshold. The operator norm is smaller,
  and at level one the sweep is exactly zero. This proves (115).

The charge to the deep core has the following form:

#[#set math.equation(numbering: n => "(116)")
 $ sum_(x : thin a \( x \) gt.eq R) { L + log_2 a \( x \) } lt.eq \( 1 + o \( 1 \) \) F_lambda
   wide \( R arrow.r oo \) \, $ <rec:core-charge>]

uniformly over surviving nontrivial diagrams of sufficiently large size.
  Here the $o \( 1 \)$ depends only on $R$, not on the diagram.
  For any straight diagram of size $u$, a box at minimum index $a$ has hook length at most $2 u \/ a$:
  each of its row and column lengths is at most $u \/ a$. Apply this to $tau$ in the first-row hook formula above.
  The coordinates below the first row shift by one, changing $log a$ by at most a constant. Stirling’s bound then gives

$ sum_(x upright(" below row ") 1) { L + log_2 a \( x \) } lt.eq F_lambda + O \( k \) . $

If $L > sqrt(log_2 R)$, the lower bound $F_lambda gt.eq k L - O \( k \)$ absorbs that error uniformly as $R arrow.r oo$.

In the complementary case, remove the first $q = floor.l sqrt(R) floor.r$ rows and columns.
  Let the remaining core have size $u$. Applying the additive-error bound just proved to boxes with $a >
  q$ gives $u = O \( \( F_lambda + k \) \/ log R \) = O \( F_lambda \/ log R \)$.
  The dimension of this core is at most $D_lambda$, by extending its tableaux after translating it to the upper
  left. Its hook formula therefore pays $sum log_2 \( a - q \)$ up to $O \( u \)$.
  For charged boxes $a gt.eq R$, replacing $log_2 \( a - q \)$ by $log_2 a$ costs $o \( 1 \)$ per box,
  and adding $L$ costs at most $u sqrt(log_2 R) = o \( F_lambda \)$. This proves (116).

=== 11.2 Two bounds for a weighted cycle factor <two-bounds-for-a-weighted-cycle-factor>

The positive network recursion is $K_n = H \( K_m ⊗ K_m \) H$,
  where $H$ is the orthogonal average of the outer matching switches. For a positive $D$ and $p gt.eq 2$,

#[#set math.equation(numbering: n => "(117)")
 $ "Tr" \( H D H \)^p lt.eq "Tr" \( H D^(p \/ 2) H \)^2 . $ <rec:cutoff-compressed-jensen>]

Indeed take an eigenbasis of $H D H$ on the range of $H$.
  Scalar Jensen gives $chevron.l v \, D v chevron.r^(p \/ 2) lt.eq chevron.l v \,
  D^(p \/ 2) v chevron.r$ for each basis vector. Squaring and summing is bounded by the Hilbert–Schmidt square of
  the compression. This proof uses scalar convexity and does not require operator convexity of the power function.

Resolve the two halves into types $mu \, theta$. For the moment,
  let $M_mu$ and $M_theta$ be arbitrary positive matrices on these two types, and put $t_mu =
  "Tr" M_mu^2$ and $t_theta = "Tr" M_theta^2$. In the unrestricted recursion they will be $K_m^(p \/ 2)$ on the
  respective types; allowing arbitrary positive matrices will also cover the midpoint projections below.
  Write $c \( g \)$ for the number of cycles of a permutation $g$, including fixed points.
  Expansion of the matching projection gives the regular trace bound

#[#set math.equation(numbering: n => "(118)")
 $ frac("Tr" \( E H E H \), \( 2 m \) !) lt.eq 4^(- m) sum_z \| e \( z \) \|^2 thin 2^(c \( alpha^(- 1) zeta \)) .
   $ <rec:cutoff-weighted-cycle>]

Here $E$ is the element of the half-preserving group algebra whose only nonzero Fourier block is $M_mu ⊗
  M_theta$ on the selected pair of child types, and $E = sum_(z = \( alpha \, zeta \) in S_m times S_m) e \( z \)
  z$. The trace in (118) is the regular trace of $S_(2 m)$.
  To verify it, expand each matching average as a sum over subsets of the $m$ matched pairs.
  For a term to return to the half-preserving subgroup, its two switch subsets $J \,
  I$ must satisfy $alpha \( J \) = zeta \( J \) = I$. The permissible $J$ are unions of cycles of $alpha^(- 1)
  zeta$, so there are $2^(c \( alpha^(- 1) zeta \))$. The second half-preserving coefficient exchanges the two
  maps on $J$, up to inversion. This operation is a bijection on the paired terms;
  symmetrizing $\| e \( z \) e \( z' \) \| lt.eq \( \| e \( z \) \|^2 + \| e \( z' \) \|^2 \) \/
  2$ proves the bound. Schur orthogonality gives

$ \( m ! \)^2 sum_z \| e \( z \) \|^2 = D_mu t_mu D_theta t_theta . $

The cycle factor is therefore averaged under the product of the two normalized squared-coefficient laws.
  Since $\( 2 m \) ! \/ 4^m lt.eq \( m ! \)^2$, the normalized half-density is

$ phi.alt_mu \( g \) = frac(D_mu \| "Tr" \( M_mu V_mu \( g \) \) \|^2, t_mu) . $

It is a probability density relative to uniform measure on $S_m$, by matrix-coefficient orthogonality;
  we only use it when $t_mu > 0$. For independent $alpha \, zeta$ with these respective densities,
  define $T_(mu theta) = bb(E) 2^(c \( alpha^(- 1) zeta \))$.
  The next lemma connects this regular-trace calculation to a fixed parent representation.
  It also identifies the quantities retained when we later stop a recursion according to its actual traces.

#thm([Lemma 11.2.])[
  (A selected child pair).  #emph[Let $B_0 \, B_1$ be positive operators in the group algebra of $S_m$, let $B =
    H \( B_0 ⊗ B_1 \) H$, and fix $lambda tack.r 2 m$ and $p gt.eq 2$.
    Let $cal(I)_lambda$ consist of the pairs $\( mu \, theta \)$ with $c_(mu theta)^lambda > 0$,
    and write $N_lambda = \| cal(I)_lambda \|$. For such a pair use
$ M_mu = B_0 \( mu \)^(p \/ 2) \, quad M_theta = B_1 \( theta \)^(p \/ 2) \, wide t_mu = "Tr" B_0 \( mu \)^p \,
  quad t_theta = "Tr" B_1 \( theta \)^p $

 and form $T_(mu theta)$ from their coefficient-square densities above. Pairs with a zero trace are omitted. Then
#[#set math.equation(numbering: n => "(119)")
 $ D_lambda "Tr" B \( lambda \)^p lt.eq
   N_lambda^2 max_(\( mu \, theta \) in cal(I)_lambda) \( D_mu t_mu \) \( D_theta t_theta \) T_(mu theta) .
   $ <rec:cutoff-one-node-bound>]

 If all selected traces vanish, the left side is zero.]
] <rec:cutoff-one-node>

#proof[
  Put $D = B_0 ⊗ B_1$, and let $E_(mu theta)$ be the central projection onto this child isotypic component.
    On $V_lambda$, only pairs in $cal(I)_lambda$ occur. The projection includes all their Littlewood–Richardson
    multiplicity copies. Set $Y_(mu theta) = E_(mu theta) D^(p \/ 2)$,
    which is positive because $E_(mu theta)$ commutes with $D$.
    Apply (117) on $V_lambda$, followed by the Hilbert–Schmidt triangle inequality, to obtain
  $ D_lambda "Tr" B \( lambda \)^p lt.eq D_lambda ∥sum_(cal(I)_lambda) H Y_(mu theta)
    H∥_(upright("HS") \, V_lambda)^2 lt.eq N_lambda^2 max_(cal(I)_lambda) D_lambda
    "Tr"_(V_lambda) \( H Y_(mu theta) H \)^2 . $
  The parent isotypic projection commutes with every group-algebra operator, including $H$.
    Thus the incompatible pairs have been removed before the next step: the selected positive trace satisfies
  $ D_lambda "Tr"_(V_lambda) \( H Y_(mu theta) H \)^2 lt.eq
    "Tr"_(upright("reg") \, S_(2 m)) \( H Y_(mu theta) H \)^2 . $
  There is no further restriction-multiplicity factor; those copies were already included in the parent trace,
    and the right side includes that entire trace with regular multiplicity $D_lambda$.
    Cyclicity, (118), and child orthogonality bound this regular trace by
  $ frac(\( 2 m \) !, 4^m \( m ! \)^2) \( D_mu t_mu \) \( D_theta t_theta \) T_(mu theta) . $
  The prefactor is at most one. Notice that the child trace exponent is still $p$:
    the matrices in the coefficient densities have exponent $p \/ 2$, and their Hilbert–Schmidt squares restore $p$. ◻
]

The first estimate is representation theoretic. Put

$ G_mu = sum_(b = 0)^m med sum_(xi tack.r b\
zeta tack.r m - b) \( c_(xi zeta)^mu \)^2 . $

Here $c_(xi zeta)^mu$ is the Littlewood–Richardson multiplicity of $V_xi ⊗
  V_zeta$ in the restriction of $V_mu$ to $S_b times S_(m - b)$. Then

#[#set math.equation(numbering: n => "(120)")
 $ log_2 T_(mu theta) lt.eq 1 / 2 \( log_2 G_mu + log_2 G_theta \) . $ <rec:cutoff-LR-cycle>]

The function $2^(c \( g \))$ counts the subsets fixed by $g$,
  so it is the character of the direct sum of all subset permutation modules.
  For an irreducible summand $V_j$ in that sum, its contribution under the two coefficient-square laws is
  $"Tr" \( hat(phi.alt)_mu \( j \)^(*) hat(phi.alt)_theta \( j \) \)$.
  These Fourier matrices are positive semidefinite, because a square of a coefficient of a positive matrix is
  positive definite, and are contractions because the densities integrate to one.

To bound their traces, let $Q_j$ be the $j$-isotypic projection in $V_mu ⊗ overline(V_mu)$. Fourier orthogonality gives

$ "Tr" hat(phi.alt)_mu \( j \) = frac(D_mu, t_mu D_j) "Tr" \[ \( M_mu ⊗ overline(M_mu) \) Q_j \] . $

Cauchy–Schwarz bounds the last trace by the geometric mean of the traces with $M_mu^2$ on either tensor factor.
  Each partial trace of $Q_j$ is scalar by Schur’s lemma, so this is at most the multiplicity of $j$ in $V_mu ⊗
  overline(V_mu)$ after the displayed normalization. Summing over subset modules,
  Frobenius reciprocity identifies that sum of multiplicities with $sum_b
  sum_(xi \, zeta) \( c_(xi zeta)^mu \)^2 = G_mu$. Thus $T_(mu theta)$ is at most either $G_mu$ or $G_theta$,
  and hence at most their geometric mean. This proves (120).

Let $u_s \( mu \)$ count boxes outside the first $s$ rows and columns, and put $k_mu = m - mu_1$.
  With $eta = 10^(- 9)$, $gamma = 1 \/ 100$ and $s = floor.l k_mu^(1 \/ 2 - eta) floor.r$, one has

#[#set math.equation(numbering: n => "(121)")
 $ log_2 G_mu & lt.eq u_s \( mu \) + O \( k_mu^(1 - eta \/ 2) \) \, &  & k_mu gt.eq m^gamma \,\
log_2 G_mu & lt.eq k_mu + O \( log m + sqrt(k_mu) log k_mu \) \, &  & k_mu < m^gamma . $ <rec:cutoff-core-LR>]

For the first, Pieri’s rule embeds $V_mu$ in the induction of its core together with at most $2
  s$ one-row or one-column strips. Restrict that induced module to two half factors by recording each
  constituent’s size on each side. For the core, multiplication of the restriction and induction dimension bounds gives

$ \( c_(xi zeta)^kappa \)^2 lt.eq binom(u_s, \| xi \|) lt.eq 2^(u_s) . $

The strips restrict with multiplicity one, and each subsequent strip addition also has multiplicity at most one by
  Pieri. It remains to count the intermediate diagrams. A subdiagram of $mu$ is specified by its first row and a
  partition of at most $k_mu$ boxes below that row; its logarithmic count is
  $O \( log m + sqrt(k_mu) log \( k_mu + 2 \) \)$. Including the size splits,
  the logarithm of all intermediate choices is therefore
  $O \( \( s + 1 \) \( log m + sqrt(k_mu) log \( k_mu + 2 \) \) \)$.
  For $k_mu gt.eq m^gamma$ and $s = floor.l k_mu^(1 \/ 2 - eta) floor.r$, this is $O \( k_mu^(1 - eta \/ 2) \)$,
  after absorbing logarithms. Squaring and summing multiplicities changes only the implicit constant and proves
  (121). For the second, remove only the first row, using the whole lower diagram as the core in the same
  argument. The trivial type costs only $O \( log m \)$.

The second cycle estimate depends on the actual trace. Put $r_mu = \( "Tr" M_mu \)^2 \/ t_mu$;
  then $phi.alt_mu lt.eq D_mu r_mu$. The uniform cycle generating product,
  split at cycle count $m^(9 \/ 10)$ and evaluated at $x = m^(89 \/ 100)$, gives

#[#set math.equation(numbering: n => "(122)")
 $ log_2 T_(mu theta) lt.eq O \( 1 \) + m^(9 \/ 10) + frac(F_mu + log_2 r_mu, 0.88 log_2 m) .
   $ <rec:cutoff-density-cycle>]

The same bound holds with $theta$; their average can also be used. Here is the tail optimization.
  For a uniform permutation $g$,

$ bb(E) x^(c \( g \)) = product_(j = 0)^(m - 1) frac(x + j, j + 1) \, wide log_2 bb(E) x^(c \( g \)) =
  O \( x log m \) quad \( 1 lt.eq x lt.eq m \) . $

Take $x = m^0.89$, $h = ceil.l m^0.9 ceil.r$, and $A_m = 0.88 log_2 m$.
  Since $m^0.89 log m = o \( h log m \)$, Markov’s inequality gives, for all sufficiently large $m$,

$ Pr_(upright("unif")) { c \( g \) gt.eq j } lt.eq 2^(- A_m j) wide \( j gt.eq h \) . $

The law of $alpha^(- 1) zeta$ has density at most $B = D_mu r_mu$:
  conditioning on $zeta$ gives a translate of the first density, and averaging preserves this bound.
  Its cycle tail is therefore at most $min \( 1 \, B 2^(- A_m j) \)$ for $j gt.eq h$.
  Put $j_(*) = h + ceil.l \( log_2 B \) \/ A_m ceil.r$. The tail-sum identity and $A_m > 1$ give

$ bb(E) 2^(c \( alpha^(- 1) zeta \)) lt.eq 2^(j_(*)) + sum_(j > j_(*)) 2^j B 2^(- A_m j) lt.eq C 2^(j_(*)) . $

Taking logarithms proves (122). The argument with the two halves interchanged proves its symmetric version.

=== 11.3 A preliminary trace and the cutoff allocation <a-preliminary-trace-and-the-cutoff-allocation>

There is a fixed $p_0$ such that, with $delta = 10^(- 5)$,

#[#set math.equation(numbering: n => "(123)")
 $ "Tr" K_n^(p_0) \|_(V_lambda) lt.eq 2^(delta F_lambda) . $ <rec:cutoff-preliminary-trace>]

We first specify the stopping contributions. At a nontrivial sparse node of size $m$,
  let $B$ be its positive sweep operator, or any cut operator satisfying $0 prec.curly.eq B prec.curly.eq T_m
  T_m^(*)$. The local sparse estimate and $F_mu = O \( k_mu log_2 m \)$ imply

#[#set math.equation(numbering: n => "(124)")
 $ log_2 #scale(x: 120%, y: 120%)[\(] D_mu "Tr" B \( mu \)^p #scale(x: 120%, y: 120%)[\)] + 1 / 2 log_2 G_mu lt.eq
   2 F_mu - 2 p b_1 k_mu log_2 m + 1 / 2 log_2 G_mu lt.eq 0 $ <rec:cutoff-sparse-offset>]

for one sufficiently large fixed $p$, uniformly over nonzero sparse nodes.
  Here (121) bounds the last term by $O \( k_mu log_2 m \)$; level one is annihilated.
  Coordinate reversal permits the same estimate for either positive orientation.
  For each fixed finite set of sizes, the finite-size norm gap likewise permits one exponent making the left side
  of (124) nonpositive on every nontrivial type. A trivial child instead has $D_mu = t_mu = 1$ and $G_mu = m + 1$;
  we stop it and charge its $O \( log m \)$ half-cycle cost to its nontrivial parent.

Choose a large fixed lower size cutoff, and apply Lemma 33 at each remaining nonsparse node,
  using the same exponent $p_0$ throughout. Choose $p_0$ to satisfy (124) and the finite-size stopping
  inequalities at this cutoff. On each selected edge use (120).
  A stopped nontrivial child contributes its actual $log_2 \( D_mu t_mu \)$ together with its half of this cycle
  bound; their sum is nonpositive. On every active frontier, Littlewood–Richardson compatibility now gives

$ sum_v k_v lt.eq k \, wide sum_v F_v lt.eq F_lambda \, wide sum_v u_s \( v \) lt.eq u_s \( lambda \) . $

For the last inequality, consider one Littlewood–Richardson tableau of $lambda \/ mu$ with content $theta$.
  Entries in the first $s$ rows are at most $s$. For each value $j > s$,
  column strictness permits at most one occurrence in each of the first $s$ columns.
  Thus at least $\( theta_j - s \)_(+)$ occurrences lie beyond both the first $s$ rows and the first $s$ columns.
  These skew core boxes are disjoint from the $u_s \( mu \)$ boxes of the old core,
  and $sum_(j > s) \( theta_j - s \)_(+) = u_s \( theta \)$.
  Therefore $u_s \( mu \) + u_s \( theta \) lt.eq u_s \( lambda \)$ at one split;
  iteration proves the frontier inequality. At nodes of size $m$, use the common cutoff $s_(*) =
  floor.l max \( m^gamma \, rho m \)^beta floor.r$, where $beta = 1 \/ 2 - 3 eta$ and $rho =
  k \/ n$ is the root payload density, kept fixed throughout this unrolling.
  Here is the comparison with the varying cutoff in (121). Put $a_0 = beta \/ \( 1 \/ 2 - eta \) < 1$.
  A nonsparse node with its own cutoff smaller than $s_(*)$ can occur only when $rho m gt.eq m^gamma$,
  and then it has $k_v lt.eq C \( rho m \)^(a_0)$. There are at most $n \/ m$ nodes of size $m$,
  so the total level of these exceptional nonsparse nodes is at most

$ C \( n \/ m \) \( rho m \)^(a_0) = C k \( rho m \)^(a_0 - 1) lt.eq C k m^(- gamma \( 1 - a_0 \)) . $

Their core counts are at most their levels, so this is a summable error as the bottom size cutoff increases.
  The sparse and finite-size stopping contributions have already been removed by (124);
  trivial-child costs belong to the active-parent overhead.
  All remaining nodes charge at most half their $u_(s_(*))$.
  For a parent at level $k_v$, compatible child levels $r \, s$ satisfy $r + s lt.eq k_v$.
  Consequently $N_lambda lt.eq sum_(r + s lt.eq k_v) p \( r \) p \( s \)$,
  so the partition-number bound gives $log_2 N_lambda = O \( sqrt(k_v) + log \( k_v + 2 \) \)$.
  Restriction overheads and the errors in (121) are $O \( k_v^(1 - eta \/ 3) \)$ on nonsparse nodes,
  so at size $m$ their sum is $O \( k m^(- gamma eta \/ 3) \)$.
  Summing over dyadic sizes makes their total $o \( k \)$ as the bottom cutoff tends to infinity.
  These errors are independent of $p_0$. A box of index $a$ is charged at at most $O \( 1 \) + L +
  beta^(- 1) log_2 a$ levels. By (116) the total is at most $\( 1 \/ \( 2 beta \) + o \( 1 \) \)
  F_lambda < \( 1 + delta \) F_lambda$. More explicitly, unrolling (119) gives

$ F_lambda + log_2 "Tr" K_n \( lambda \)^(p_0) lt.eq (frac(1, 2 beta) + epsilon \( M \)) F_lambda \, wide
  epsilon \( M \) arrow.r 0 $

as the fixed lower cutoff $M$ tends to infinity. The stopping terms are nonpositive,
  and the displayed error includes the type counts and trivial-child costs.
  Since $1 \/ \( 2 beta \) < 1 + delta \/ 2$, choose $M$ first so that the coefficient is at most $1 + delta$,
  and then choose the single finite exponent $p_0$ as above. Subtracting $F_lambda$ proves (123).
  We may take $M$ still larger before fixing $p_0$ when a smaller error margin is needed below.

We now turn the preliminary trace into the midpoint projection estimate.
  Split the ordered coordinates as evenly as possible, and write

$ T_n = C D \, $

where $D$ applies the first group of coordinates and $C$ the second.
  The two coordinate groups have $floor.l d \/ 2 floor.r$ and $ceil.l d \/ 2 ceil.r$ coordinates, where $d =
  log_2 n$. Each segment is a product of independent sweeps on its parallel subcubes,
  of sizes $2^(floor.l d \/ 2 floor.r)$ and $2^(ceil.l d \/ 2 ceil.r)$, respectively.
  Let $H_D \, H_C$ be the corresponding direct product permutation subgroups.
  The argument applies equally with the two coordinate-group sizes interchanged;
  their middle log sizes differ from $d \/ 2$ by at most $1 \/ 2$.
  A product type for either subgroup is a tuple of partitions,
  with product dimension and hence log dimension equal to the sum of the child log dimensions.
  On $V_lambda$, let $P_(upright("lo"))^D$ and $P_(upright("lo"))^C$ be the central isotypic projections for $H_D$
  and $H_C$, respectively, onto product types whose log dimensions sum to at most

#[#set math.equation(numbering: n => "(125)")
 $ X = 0.50003 F_lambda . $ <rec:cutoff-X>]

#thm([Proposition 11.3.])[
  (Two midpoint projections).  #emph[There is an absolute $c_1 > 0$ such that,
    for all sufficiently large dyadic $n$ and all surviving nontrivial $lambda tack.r n$ with $k gt.eq n^(1 \/ 100)$,
#[#set math.equation(numbering: n => "(126)")
 $ max {parallel T_n P_(upright("lo"))^D \|_(V_lambda) parallel \,
   parallel P_(upright("lo"))^C T_n \|_(V_lambda) parallel} lt.eq 2^(- c_1 F_lambda) . $ <rec:cutoff-low-bound>]

 The two projections refer to different product subgroups; no commutation between them is asserted.]
] <rec:cutoff-midpoint>

#proof[
  We prove the first estimate; reversing the coordinate order gives the second.
    Consider the positive operator $T_n P_(upright("lo"))^D T_n^(*)$ and take exponent $p = 2 p_0$.
    Expand its outer matching layers until reaching the middle coordinate system.
    At a node $v$, its operator has the form $B_v = A_v P_v A_v^(*)$,
    where $A_v$ is the remaining local sweep and $P_v$ is the inherited central cutoff for its innermost product
    types. In particular $0 prec.curly.eq B_v prec.curly.eq A_v A_v^(*)$.
    For a positive contribution on its selected irreducible type define
  $ M_v = B_v^(p_0) \, wide t_v = "Tr" B_v^(2 p_0) \, wide r_v = \( "Tr" M_v \)^2 \/ t_v . $
  These are actual cut-operator quantities. The coefficient-square and cycle bounds above apply to these positive
    matrices just as they do to the unrestricted matrices. At a binary restriction,
    allocate its cutoff by the elementary projection inequality
  #[#set math.equation(numbering: n => "(127)")
   $ upright(bold(1))_(a + b lt.eq B) lt.eq sum_(u + v lt.eq B + 2 \, u \, v in bb(Z)_(gt.eq 0))
     upright(bold(1))_(a lt.eq u) ⊗ upright(bold(1))_(b lt.eq v) . $ <rec:cutoff-allocation>]
  Ceiling $a \, b$ proves the cover. These are commuting central child projections,
    so the inequality holds before sandwiching. If $cal(J)_v$ is this finite set of budget pairs, sandwiching gives
  $ B_v prec.curly.eq sum_(\( u \, w \) in cal(J)_v) H \( B_(0 \, u) ⊗ B_(1 \, w) \) H \, wide B_(i \, u) =
    A_i P_(i \, u) A_i^(*) . $
  The child product log dimensions never exceed $m log_2 m$,
    so the ceilings may be capped at $ceil.l m log_2 m ceil.r$;
    in particular $\| cal(J)_v \|$ is polynomial in $m$. Monotonicity of positive Schatten norms and their
    triangle inequality, followed by Lemma 33, give the precise cut recursion
  #[#set math.equation(numbering: n => "(128)")
   $ D_lambda "Tr" B_v \( lambda \)^p lt.eq \| cal(J)_v \|^p N_lambda^2 max_(\( u \, w \) in cal(J)_v\
\( mu \, theta \) in cal(I)_lambda) \( D_mu t_(0 \, u \, mu) \) \( D_theta t_(1 \, w \, theta) \)
  T_(u \, w \, mu \, theta) . $ <rec:cutoff-cut-node>]
  Here $t_(i \, u \, mu) = "Tr" B_(i \, u) \( mu \)^p$, and the cycle factor is formed from these same actual
    matrices $B_(i \, u) \( mu \)^(p \/ 2)$. Thus allocation adds only $O_(p_0) \( log m \)$ to the logarithmic
    cost when $p = 2 p_0$. The selected cutoff and child pair remain fixed when we subsequently expand a child trace.
  Finally $B_(i \, u) prec.curly.eq A_i A_i^(*)$. Eigenvalue monotonicity bounds their powered traces by those of
    the unrestricted operators, whenever we need the preliminary trace bound or a sparse stopping inequality.
    This does not require the power function to be operator monotone.
  Active nodes have size at least a constant multiple of $sqrt(n)$.
    At a fixed size $m$, each nontrivial active node has level at least $m^(1 \/ 100)$,
    while their total level is at most $k$. There are therefore at most $k m^(- 1 \/ 100)$ such nodes.
    The $O_(p_0) \( log m \)$ allocation cost and the bounded rounding loss per split sum to
    $O_(p_0) \( k m^(- 1 \/ 100) log m \)$ at that size. Summing over the dyadic sizes down to the middle gives
    $o \( k \)$. Trivial children are stopped and their costs have already been assigned to the parent overhead.
    The terminal sum includes only branches reaching the middle:
    stopped nontrivial branches have already contributed nonpositive terms by (124).
    The successive ceilings therefore give $sum_v F_v lt.eq X + o \( k \)$ at this terminal cut, and
  #[#set math.equation(numbering: n => "(129)")
   $ sum_v log_2 \( D_v t_v \) lt.eq \( 1 + delta \) \( X + o \( k \) \) $ <rec:cutoff-terminal-budget>]
  by (123).
  === 11.4 The actual-trace invariant <the-actual-trace-invariant>
  Before estimating the total cycle cost, we specify a second stopping rule. Put $d = log_2 n$.
    While descending through child log sizes between $d$ and $0.9 d$, test the actual frontier traces against
  #[#set math.equation(numbering: n => "(130)")
   $ - sum_v log_2 t_v > 0.2 F_lambda . $ <rec:cutoff-diagnostic>]
  If this inequality holds, the trace already saved at that frontier will replace the more expensive terminal
    budget at the middle. The following invariant explains why this decision can be made using the actual traces.
  A frontier consists of the nodes at the current common coordinate depth,
    with previously stopped branches removed and their paid contributions retained separately.
    Expand every currently active node once to form a complete new generation.
    Test that generation before removing any of its newly sparse or trivial children.
    At each expansion choose a maximizing term in (128), using its actual child traces and actual weighted-cycle
    factor. Retain the selected matrices and the resulting number $T_e$.
    Subsequent expansion replaces only a child quantity $q_v = log_2 \( D_v t_v \)$,
    without changing that earlier density.
  To account explicitly for stopped children, start an edge cost at $Gamma_e = log_2 T_e$.
    When its child $w$ is stopped, write
  $ q_w + Gamma_e = (q_w + 1 / 2 log_2 G_w) + (Gamma_e - 1 / 2 log_2 G_w) . $
  The first term is nonpositive for a nontrivial stopped child by (124);
    for a trivial child it is the $O \( log m \)$ parent overhead already recorded.
    Keep the second term as the new residual cost $Gamma_e$. This scalar subtraction does not change the actual
    matrix or coefficient density used to define $T_e$. After this stopping decision, freeze $Gamma_e$ as well;
    expanding an unstopped child later changes only that child’s frontier contribution.
    The two usable bounds are consequently
  $ Gamma_e lt.eq log_2 T_e \, wide Gamma_e lt.eq 1 / 2 sum_(w upright(" unstopped child of ") e) log_2 G_w . $
  The first permits the density estimate, and the second permits the core charge without charging stopped children
    again. At every intermediate frontier,
  #[#set math.equation(numbering: n => "(131)")
   $ log_2 \( D_lambda t_lambda \) lt.eq sum_(e med upright("retained")) Gamma_e + upright("overheads") +
     sum_(v med upright("frontier")) log_2 \( D_v t_v \) +
     upright(p a i d med n o n t r i v i a l med s t o p p i n g med t e r m s) . $ <rec:cutoff-actual-invariant>]
  The last terms are nonpositive. This follows inductively from (128) and the displayed scalar decomposition.
    In particular no independence between later maximizing choices is needed,
    and a newly created frontier is tested before any of its offsets are subtracted.
  It remains to show that the resulting cost leaves fixed slack below the root dimension.
    We first estimate what the diagram-only cycle bound would cost throughout the truncated recursion.
    Put $l = L \/ d$ and $z = log_2 a \/ d$ for a charged box.
    Over the relevant sizes, from $d \/ 2$ to $d$, its core charge is at most
  #[#set math.equation(numbering: n => "(132)")
   $ O \( 1 \) + d / 2 \[ min \( 1 \, l + beta^(- 1) z \) - 1 \/ 2 \]_(+) . $ <rec:cutoff-box-cost>]
  We charge only boxes appearing in at least one of these cores.
    In particular $l + beta^(- 1) z gt.eq 1 \/ 2 - O \( 1 \/ d \)$, so their weights $w_x =
    d \( l + z \)$ are at least $beta d \/ 2 - O \( 1 \)$. The $O \( 1 \)$ rounding terms therefore total
    $O \( F_lambda \/ d \)$ by (116). For the principal term put $q = beta^(- 1)$ and $y = l + q z$.
    Its ratio to $w_x$ satisfies
  $ frac(\[ min \( 1 \, y \) - 1 \/ 2 \]_(+), 2 \( l + z \)) lt.eq q / 4 < 0.50001 \, $
  because $l + z gt.eq y \/ q$. If $z < 0.49$, set $b_z = \( q - 1 \) z < 1 \/ 2$;
    the same ratio equals $\[ min \( 1 \, y \) - 1 \/ 2 \]_(+) \/ \[ 2 \( y - b_z \) \]$.
    It increases on $1 \/ 2 < y < 1$ and decreases on $y > 1$, hence is at most
  $ frac(1, 4 \( 1 - b_z \)) lt.eq frac(1, 4 \( 1 - 0.49 \( q - 1 \) \)) < 0.491 . $
  These bounds hold on the whole range $l \, z gt.eq 0$, and therefore on the admissible diagram range.
    The additional geometric relation $a \( x \) \( a \( x \) - 1 \) lt.eq
    k$ will be used below to turn a deep box into a lower bound for $k$.
  Choose the fixed cutoff in the preliminary proof so that its core-charge and summable-error remainders are
    sufficiently small, and then fix $p_0$. Increasing the root size afterward makes the allocation and rounding
    errors small as well. We take the sum of the error terms in the following budget comparisons to be at most
    $10^(- 5) F_lambda$; the displayed numerical comparisons all leave more slack than this.
    If the total core charge is at most $0.4995 F_lambda$, combining it with (129) suffices, since
  #[#set math.equation(numbering: n => "(133)")
   $ 0.4995 + \( 1.00001 \) \( 0.50003 \) = 0.9995350003 < 1 . $ <rec:cutoff-ordinary-slack>]
  Otherwise split the dimension budget, rather than the incurred cycle charge, according to the value of $z$.
    Give a charged box the weight $w_x = d \( l + z \) = L + log_2 a \( x \)$, and let $W_(upright("hi")) \,
    W_(upright("lo"))$ be the sums of these weights over $z gt.eq 0.49$ and $z < 0.49$, respectively.
    The core-charge estimate gives $W_(upright("hi")) + W_(upright("lo")) lt.eq \( 1 + o \( 1 \) \) F_lambda$;
    the omitted shallow boxes and the other error terms cost $o \( F_lambda \)$ after the fixed bottom cutoff has
    been chosen large enough. The two ratios following (132) therefore imply
  $ 0.4995 F_lambda < 0.50001 W_(upright("hi")) + 0.491 W_(upright("lo")) + o \( F_lambda \) lt.eq
    0.491 F_lambda + 0.00901 W_(upright("hi")) + o \( F_lambda \) . $
  Since $0.0085 \/ 0.00901 > 0.943$, it follows, with room for those errors, that $W_(upright("hi")) gt.eq
    0.93 F_lambda$. In particular some box has $a gt.eq n^0.49$,
    so the diagram contains at least $a \( a - 1 \)$ boxes below its first row and $k gt.eq n^0.97$ for large $n$.
    In the lower portion, from log size $d \/ 2$ to $0.9 d$, each box costs at most $0.2 d$.
    Its cost-to-budget ratio on the high set is thus at most $0.2 \/ 0.49$,
    while on the low set the full bound $0.50001$ still applies. The total lower cost is at most
  $ 0.2 / 0.49 W_(upright("hi")) + 0.50001 W_(upright("lo")) + o \( F_lambda \) lt.eq {0.93 0.2 / 0.49 +
    0.07 \( 0.50001 \) + o \( 1 \)} F_lambda < 0.418 F_lambda . $
  In the upper portion use (122), testing (130) at each new frontier as specified above.
  As long as (130) has not fired, (123) and monotonicity for cut operators give
  $ sum_v log_2 r_v = 2 sum_v log_2 "Tr" M_v - sum_v log_2 t_v lt.eq \( 0.2 + 2 delta \) F_lambda . $
  At size $m gt.eq n^0.9 \/ 2$, the additive $m^0.9$ terms in (122), summed over at most $n \/ m$ nodes,
    are $O \( n m^(- 0.1) \) = O \( n^0.91 \)$. Summing over these dyadic sizes keeps this bound,
    which is $o \( F_lambda \)$ because $F_lambda gt.eq b n^0.97$.
    The type and allocation overheads are also $o \( F_lambda \)$ by the previous bounds.
    The remaining inverse-log-size sum gives an upper-portion cost of at most
  #[#set math.equation(numbering: n => "(134)")
   $ frac(1.2 + 2 delta, 2 \( 0.88 \)) ln \( 1 \/ 0.9 \) F_lambda +
     o \( F_lambda \) < 0.076 F_lambda . $ <rec:cutoff-upper-cost>]
  The factor $1 \/ 2$ is the averaging of the two child bounds;
    the logarithm is the integral of inverse log size across this portion.
    If the diagnostic never fires, the total charge is below $\( 0.418 + 0.076 \) F_lambda = 0.494 F_lambda$.
    If it fires, test it on the newly created frontier before removing any newly sparse children.
    Previously stopped sparse nodes have already paid their edge offsets and retain nonpositive contributions.
    At the triggering frontier the actual sum $sum_v log_2 \( D_v t_v \)$ is below $0.8 F_lambda$.
    Use (131) immediately with that sum. The density-cycle estimate cannot be charged on this triggering level,
    because its diagnostic hypothesis has failed there. Use the crude Littlewood–Richardson bound instead.
    Its core part charges boxes with $log_2 a$ of order $d$, so (116) bounds the single-level charge by
    $O \( F_lambda \/ d \) = o \( F_lambda \)$. For newly sparse children,
    the additional bound in (121) is also $o \( F_lambda \)$,
    since there are at most $n \/ m$ children of size $m gt.eq 2^(.9 d - O \( 1 \))$ and $F_lambda gt.eq b n^.97$.
    The total is therefore below $0.876 F_lambda + o \( F_lambda \)$. Both cases leave fixed slack below one.
    In every case we have $log_2 \( D_lambda t_lambda \) lt.eq \( 1 - epsilon_0 \)
    F_lambda$ for some fixed $epsilon_0 > 0$, at all sufficiently large active roots.
    Thus $t_lambda lt.eq 2^(- epsilon_0 F_lambda)$. Since $T_n P_(upright("lo"))^D T_n^(*)$ has norm $parallel T_n
    P_(upright("lo"))^D parallel^2$ and $t_lambda$ is its $2 p_0$ moment, taking a $4 p_0$-th root proves (126).
    Its constants and size threshold are independent of the exponent used in the subsequent norm induction. ◻
]

=== 11.5 Closing the norm induction without a circular base <closing-the-norm-induction-without-a-circular-base>

Write $P_D = P_(upright("lo"))^D$ and $P_C = P_(upright("lo"))^C$. With $T_n = C D$,

$ T_n = T_n P_D + P_C T_n \( I - P_D \) + \( I - P_C \) C D \( I - P_D \) . $

Proposition 34 bounds the first two terms by $2^(- c_1 F_lambda)$ each.
  The central projections commute with their own segments, $P_D D = D P_D$ and $P_C C = C P_C$.
  On a high product type, the child dimension-power estimates multiply, and its product log dimension exceeds $X$.
  Thus, if all child estimates hold with exponent $g$, the last term has norm at most

$ parallel \( I - P_C \) C parallel thin parallel D \( I - P_D \) parallel lt.eq 2^(- 2 g X) =
  2^(- 1.00006 g F_lambda) . $

This uses no commutation between $P_C$ and $P_D$. We need a size threshold independent of the final small
  exponent. A crude polynomial gap supplies it. For a unit vector $v$, put $epsilon = 1 -
  parallel T_n v parallel^2$. If $v_i$ is the vector after $i$ matching projections,
  orthogonality gives $sum_i parallel v_i - v_(i - 1) parallel^2 = epsilon$.
  Hence $v$ is within $sqrt(d epsilon)$ of every matching-fixed space.
  Each edge transposition in that matching moves $v$ by at most $2 sqrt(d epsilon)$.
  Any transposition is a product of at most $2 d - 1$ cube-edge transpositions along a cube path,
  and any permutation is a product of at most $n - 1$ arbitrary transpositions.
  Telescoping therefore bounds $parallel pi v - v parallel$ by $C n d sqrt(d epsilon)$.
  The average of $pi v$ over $S_n$ is zero on a nontrivial irreducible, so $1 lt.eq C n d sqrt(d epsilon)$.
  Together with $F_lambda lt.eq n log_2 n$, this supplies an exponent $a n^(- C_0)$ in the bound $parallel T_n
  parallel lt.eq 2^(- g F_lambda)$, for absolute $a \, C_0 > 0$; dimension-one nontrivial types are annihilated.

Fix temporarily a desired exponent $0 < c lt.eq c_1 \/ 2$.
  At a parent of size $n$, induction and this independent gap permit a common child exponent

$ g = max { c \, min \( c_1 \/ 2 \, a n^(- C_0) \) } . $

Thus $g lt.eq c_1 \/ 2$ and $g gt.eq a' n^(- C_0)$ for an absolute $a' > 0$.
  Relative to $2^(- g F_lambda)$, the saving in the high–high term is $1 - 2^(- .00006 g F_lambda)$.
  It is bounded below by an inverse polynomial in $n$, whereas the two low terms have relative size at most $2
  dot.op 2^(- \( c_1 \/ 2 \) F_lambda)$. On active roots, $F_lambda gt.eq b n^.01$,
  so one absolute large-size threshold absorbs the low terms for every such $c$.
  Below that threshold choose $c > 0$ small enough to fit every finite nontrivial norm gap,
  and also small enough for (115) on sparse roots, where $F_lambda = O \( k log n \)$.
  This closes the induction without a circular choice of its base and proves Theorem 32.

For completeness, let $mu_q$ be the permutation law after $q$ sweeps and define its squared relative $L^2$
  deviation by $chi^2 = n ! sum_(g in S_n) \| mu_q \( g \) - 1 \/ n ! \|^2$. The regular Fourier consequence is

#[#set math.equation(numbering: n => "(135)")
 $ chi^2 lt.eq sum_(lambda eq.not \( n \) \, med T_n \( lambda \) eq.not 0) D_lambda^2 thin 2^(- 2 q c F_lambda) =
   o \( 1 \) $ <rec:cutoff-fourier-completion>]

for a sufficiently large absolute $q$. There are at most $2^(O \( sqrt(k) log \( k + 2 \) \))$ types at level $k$,
  $F_lambda gt.eq b k$, and $F_lambda arrow.r oo$ at each fixed positive $k$.
  These facts justify the last limit and give the same bound from every starting deck by translation.

#bibliography("refs.bib", style: "ieee", title: [References])
