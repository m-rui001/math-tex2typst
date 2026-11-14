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

#align(center)[#text(size: 16pt, weight: "bold")[Signed tensor densities and diagram budgets \
for the Thorp shuffle]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

==== 1 Introduction <sec:introduction>

A coordinate sweep visits each coordinate of a binary position once,
  independently swapping or retaining the two positions in every coordinate pair.
  A single card is uniform after one sweep. The full deck is a more difficult object:
  cards share switches, so their joint permutation law can retain information that every one-card test misses.
  We bound that information in every irreducible representation of the symmetric group.
  The bounds imply that an absolute number of sweeps suffices for the full permutation density to converge to
  uniform in squared $L^2$ distance as the deck size tends to infinity.

Let $n = 2^d$, $d gt.eq 1$, and identify positions with ${ 0 \, 1 }^d$.
  A sweep first independently swaps or retains every pair in coordinate direction 1,
  and then does the same in directions $2 \, dots.h \, d$. Write $B_n$ for its probability measure and its average
  action in a representation. One sweep is $d$ physical Thorp shuffles,
  after removing the deterministic rotations of coordinates; Section 1 gives the exact convention.
  For $lambda tack.r n$, let $V_lambda$ be the complex Specht module and $D_lambda = dim V_lambda$.
  Every trace in this paper is unnormalized.

===== Prescribed signed occurrences <prescribed-signed-occurrences>

The main estimate describes a representation using two kinds of tensor colors and a remainder.
  Permuting tensor factors carrying odd colors introduces a sign;
  even colors describe long rows of a Young diagram, and odd colors describe long columns.
  The remainder is represented by distinctly marked positions.
  Its size enters the bound with an entropy saving that becomes important when those marks are sparse.

Precisely, let $u + v + l = n$ and let $alpha tack.r u$, $beta tack.r v$, $gamma tack.r l$. Suppose

#[#set math.equation(numbering: n => "(1)")
 $ V_alpha ⊗ V_(beta^(upright(t))) ⊗ V_gamma subset.eq "Res"_(S_u times S_v times S_l)^(S_n) V_lambda \,
   $ <ten:spin:eq:1>]

where $subset.eq$ means occurrence, with no multiplicity-one assumption,
  and $beta^(upright(t))$ is the transposed partition. Empty factors are allowed and have dimension one.
  Define the unnormalized entropy of the concatenated part lists by

#[#set math.equation(numbering: n => "(2)")
 $ F \( alpha \, beta \) = sum_(i : alpha_i > 0) alpha_i log frac(u + v, alpha_i) +
   sum_(j : beta_j > 0) beta_j log frac(u + v, beta_j) . $ <ten:spin:eq:2>]

It is zero if $u + v = 0$. All logarithms are natural.

#thm([Theorem 1.])[
  (A moment bound for every signed occurrence).  #emph[ For each sufficiently small fixed $macron(eta) > 0$,
    choose a sufficiently small $macron(kappa) > 0$ with $macron(kappa) < macron(eta) \/ 256$.
    There is an integer $r gt.eq 1$, depending only on these fixed constants, such that for every $d gt.eq 1$,
    every $lambda tack.r n = 2^d$, and every occurrence (1),
#[#set math.equation(numbering: n => "(3)")
 $ log #h(-0.16667em) (D_lambda "Tr"_(V_lambda) \( B_n^(*) B_n \)^r) lt.eq eta_d F \( alpha \, beta \) +
   g_n \( l \) \, $ <ten:spin:eq:3>]

 where
$ eta_d = macron(eta) (1 - frac(1, 2 sqrt(d))) \, wide kappa_d = macron(kappa) (1 - frac(1, 2 sqrt(d))) \, wide
  g_n \( l \) = max { 0 \, kappa_d l log n - l log \( n \/ l \) } . $

 Set $g_n \( 0 \) = 0$ and interpret the logarithm of a zero trace as $- oo$.]
] <ten:spin:main>

The occurrence is prescribed, rather than selected by minimizing the right-hand side.
  This is useful in the proof itself: a local restriction supplies particular signed factors and a particular
  remainder, and the same theorem applies to those data. The saving $- l log \( n \/ l \)$ is also essential.
  The two child bounds retain enough of it to pay for placing the marks when the children are assembled into the
  parent rectangle.

===== The full permutation law <the-full-permutation-law>

For a fixed number $L$ of sweeps, let $f_(d \, L) \( sigma \) =
  n ! thin B_n^(* L) \( sigma \)$ be the density of their permutation law with respect to the uniform measure
  $U_(S_n)$. Let $t_(upright("mix")) \( d \)$ be the least number of physical shuffles whose law has total
  variation distance at most $1 \/ 4$ from uniform.

#thm([Corollary 2.])[
  (Fixed-sweep convergence of the full deck).  #emph[There is an absolute positive integer $L$ such that
$ bb(E)_(U_(S_n)) \| f_(d \, L) - 1 \|^2 arrow.r 0 wide \( d arrow.r oo \) . $

 The convergence is uniform over starting orders. Moreover $t_(upright("mix")) \( d \) = Theta \( d \)$.]
] <cor:spin-full-deck>

To obtain the upper bound, choose an occurrence with no remainder and $F \( alpha \, beta \) lt.eq
  C_0 log D_lambda$. With $macron(eta)$ sufficiently small,
  the theorem then gives a negative power of $D_lambda$ for the sweep norm.
  Summing those powers by finite-group Fourier analysis proves the corollary.
  Section 3 establishes the required occurrence and completes this argument.
  The lower bound comes from the number of available switch choices:
  $t$ physical shuffles have support of size at most $2^(t n \/ 2)$,
  whereas the uniform law is supported on $n !$ permutations.
  Lemma 5 gives $t_(upright("mix")) \( d \) gt.eq 2 d - O \( 1 \)$.
  The same fixed-sweep estimate also gives an approximately uniform permutation sampler whose output coordinates
  each require only $O \( log n \)$ adaptive queries to shared randomness; see Corollary 15.

===== The proof mechanism <the-proof-mechanism>

There are two sources of contraction. If a representation first appears on a small number of tracked cards,
  centering the tuple kernel cancels every collection of paths with an isolated member.
  A weighted forest count bounds the remaining encounters. For the other representations,
  split the coordinates into two nearly equal groups. Positions form a rectangle:
  the first sub-sweep acts within columns, the second within rows.
  The corresponding representation decompositions do not commute,
  so the proof must bound the angle between their tensor type spaces.

The angle estimate uses a positive matrix of trace one on each line.
  Averaging its tensor powers over the parity-preserving unitary group dominates the projection to a prescribed
  signed type. The mean column density supplies an inverse square root that normalizes all the cells in a row.
  The resulting one-cell factors have mean at most one on the complete rectangle.
  Removing $l$ cells costs at most $e^l$, while the global type retains its entropy saving.
  Section 2 proves this comparison, including the local carrier dimensions, before any moment induction is used.

Distinct marks supply the other local input. As Figure 1 shows,
  a row move followed by a column move can return a named point to its initial cell only if both moves fix that
  point. The trace therefore restricts group-algebra coefficients to a pointwise stabilizer.
  This restriction is positive, and its exact regular-trace factor is the reciprocal of a falling factorial.
  Summing mark placements retains the entropy term needed by the parent bound.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 1.28), (4.48, 1.92), fill: rgb("#dbdbff"), stroke: none)
  rect((1.28, 0), (1.92, 2.56), fill: rgb("#ffe6cc"), stroke: none)
  rect((1.28, 1.28), (1.92, 1.92), fill: rgb("#cce6cc"), stroke: none)
  line((0, 0), (0, 2.56), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((0.64, 0), (0.64, 2.56), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((1.28, 0), (1.28, 2.56), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((1.92, 0), (1.92, 2.56), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((2.56, 0), (2.56, 2.56), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((3.2, 0), (3.2, 2.56), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((3.84, 0), (3.84, 2.56), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((4.48, 0), (4.48, 2.56), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (4.48, 0), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0.64), (4.48, 0.64), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((0, 1.28), (4.48, 1.28), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((0, 1.92), (4.48, 1.92), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((0, 2.56), (4.48, 2.56), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  rect((0, 1.28), (4.48, 1.92), stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10))
  rect((1.28, 0), (1.92, 2.56), stroke: (paint: rgb("#bf6000"), thickness: 0.8pt, miter-limit: 10))
  content((1.6, 1.6), [$a$])
  content((0, 1.6), [$i$], anchor: "east", padding: 0.1176cm)
  content((1.6, 2.56), [$j$], anchor: "south", padding: 0.1176cm)
  content((4.736, 1.92), [#text(fill: rgb("#0000b2"))[after a row move:#linebreak()same row $i$]], anchor: "west", padding: 0.1176cm)
  content((4.736, 0.64), [#text(fill: rgb("#bf6000"))[before a column return:#linebreak()same column $j$]], anchor: "west", padding: 0.1176cm)
  line((4.704, 1.6), (4.16, 1.6), stroke: (paint: rgb("#0000b2"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000b2"))))
  line((4.704, 0.32), (1.6, 0.32), stroke: (paint: rgb("#bf6000"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#bf6000"))))
  content((2.24, -0.416), [the intermediate cell lies in their intersection: $(i,j)$])
})],
  caption: [Figure 1: One distinct mark initially occupies cell $\( i \, j \)$ in this schematic rectangle. After a row move its intermediate location lies in the highlighted row; a column move can return it to $\( i \, j \)$ only from the highlighted column. Their intersection is the initial cell. The same argument for every distinct label forces both moves to fix all marks. Unmarked cells carry signed tensor factors. ],
) <fig:marked-grid>

===== History and mathematical background <history-and-mathematical-background>

The Thorp shuffle arose in the study of shuffling procedures associated with Faro #cite(label("Thorp1973")).
  Its simple local rule long resisted a full-deck mixing analysis.
  For $n = 2^d$, Morris’s first polynomial bound was $O \( d^44 \)$,
  using the chameleon process and evolving sets #cite(label("Morris2008"));
  Montenegro and Tetali improved this to $O \( d^29 \)$ through spectral-profile and evolving-set
  estimates #cite(label("MontenegroTetali2006")) Section 6.4.
  Using entropy contraction, Morris later proved an $O \( \( log n \)^4 \)$ bound for all even deck
  sizes #cite(label("Morris2009")), followed by $O \( d^3 \)$ for power-of-two decks #cite(label("Morris2013")).
  All these bounds count physical shuffles, rather than sweeps of $d$ coordinate layers.
  Corollary 2 gives $O \( d \)$ physical shuffles and convergence of the full permutation density in squared
  $L^2$, with the matching order supplied by the support lower bound.

Partial permutation laws are also central to the cryptographic study of Thorp shuffling #cite(label("mrs"))
  #cite(label("MorrisRogawayStegers2018")). Such results can track many cards:
  Czumaj and Vöcking proved an $O \( \( log n \)^2 \)$ bound for the joint positions of any fixed fraction $c
  n$ of the cards, where $0 < c < 1$, using non-Markovian coupling #cite(label("CzumajVocking2014")).
  The distinction here is the passage to the joint law of all $n$ cards.
  The signed representation estimates retain that complete permutation information instead of selecting a
  prescribed family of card marginals.

We use the classical branching and Littlewood–Richardson rules, the hook-length formula,
  and ordinary Schur–Weyl duality #cite(label("James1978")) #cite(label("Sagan2001")) #cite(label("Stanley1999"))
  #cite(label("etingof")) #cite(label("VershikOkounkov2005")).
  Signed tensor and hook combinatorics have their representation-theoretic ancestry in Berele and Regev;
  hook-Schur formulas and their positive tableau descriptions are also developed by Orellana and Zabrocki and by
  Mason and Niese #cite(label("BereleRegev1987")) #cite(label("orellana-zabrocki2000"))
  #cite(label("mason-niese2016")). Our decomposition uses ordinary Schur–Weyl duality on the two parity classes,
  a sign twist, and induction. The density comparisons and the budget estimates are proved here.

The passage from Fourier estimates to total variation is the finite-group method of Diaconis and
  Shahshahani #cite(label("DiaconisShahshahani1981")). Their random-transposition law is central.
  A coordinate sweep is generally nonnormal: its product with its adjoint need not equal the product in the
  opposite order. We use the Araki–Lieb–Thirring inequality for positive matrices #cite(label("araki1990"))
  #cite(label("audenaert2007")) to recurse on moments, and Schatten Hölder to pass to repeated forward sweeps.

===== The later bounds <the-later-bounds>

Theorem 1 and Corollary 2 are proved in Section 3. The remainder of the paper studies what additional information
  a moment estimate can retain. Some bounds optimize over signed factors and marks;
  others keep every prescribed hook subdiagram, minimize over all subdiagrams,
  or couple a first-row defect bound with a row-and-column weight.
  Their statements differ in both their optimization domains and their moment exponents.

These later sections also develop distinct mechanisms: lowering operators give a norm estimate throughout $2 lt.eq
  k lt.eq n \/ 2$; covariance retains local ranks; a harmonic-tuple coupling gives a separate sparse estimate;
  and ordered products of densities provide another marked-grid proof.
  They supply alternative routes to the same mixing order, as well as their stated finer estimates.
  Part Section 2 begins with the guide in Section 1.1, which compares these targets and the information each
  retains. Section 1 then provides the common full-isotypic, positive-mixture, coefficient-integral,
  and marked-recurrence tools before the individual arguments begin.

== 1 The every-occurrence bound <part:every-occurrence>

==== 1.1 The physical chain, Fourier norms and dimension estimates <sec:prelim>

This section fixes the common normalization. Every later passage from a sweep estimate to mixing uses physical
  time measured here.

===== 1.1.1 Binary positions and sweep operators <binary-positions-and-sweep-operators>

Number positions by $x = \( x_1 \, dots.h \, x_d \) in bb(F)_2^d$, most significant bit first. One shuffle sends

$ x mapsto \( x_2 \, dots.h \, x_d \, x_1 + xi_(x_2 \, dots.h \, x_d) \) \, $

where the $2^(d - 1)$ bits $xi$ are independent and fair.
  Write $R$ for the cyclic rotation and $h_t$ for the pair switches at physical time $t$,
  so the time-$t$ permutation is $R h_t dots.h.c R h_1$. Factoring out $R^t$ conjugates the switches into the
  successive coordinate directions. This deterministic left multiplication preserves distance to uniform.
  At time $d$, $R^d = I$, and one sweep has exactly the law of $d$ physical shuffles.
  Write $q_d$ for the law of one physical shuffle and $U_(S_n)$ for the uniform measure. We use

$ t_(upright("mix")) \( d \) = min { t gt.eq 0 : parallel q_d^(* t) - U_(S_n) parallel_(upright("TV")) lt.eq
  1 \/ 4 } . $

Translation by the starting permutation shows that this is also the worst-initial-state mixing time.

Permutations send each input position to its output. A product $g h$ applies $h$ first.
  For measures, $mu * nu$ denotes the law of $g h$ for independent $g tilde.op mu \, h tilde.op nu$.
  In a unitary representation $rho_lambda$, define

$ hat(mu) \( lambda \) = sum_g mu \( g \) rho_lambda \( g \) \, wide accent(mu * nu, ̂) = hat(mu) thin hat(nu) . $

A fair switch layer averages the subgroup generated by its disjoint transpositions,
  and hence is an orthogonal projection $Pi_i$. With chronological coordinate order $1 \, dots.h \, d$, put

$ B_n = Pi_d dots.h.c Pi_1 \, wide Q_n = B_n^(*) B_n \, wide n = 2^d . $

The layered switching network for this product is the butterfly network.
  In later sections, a butterfly means this same complete coordinate sweep,
  both as a random permutation and as its average operator.

#thm([Lemma 1.1.])[
  (Annihilated shapes).  #emph[The sign representation is annihilated by every nonempty fair layer.
    Every irreducible of $S_n$ indexed by a shape with more than $n \/ 2$ rows is annihilated by a sweep.]
] <lem:annihilation>

#proof[
  The sign average contains a fair transposition. For the second assertion, by Young’s rule,
    the permutation module induced from the trivial representation of $\( S_2 \)^(n \/ 2)$ has only shapes
    dominating $\( 2^(n \/ 2) \)$, hence at most $n \/ 2$ rows. ◻
]

#thm([Lemma 1.2.])[
  (Finite-size norm gap).  #emph[For every fixed dyadic $n gt.eq 2$,
    $parallel B_n \( lambda \) parallel_(upright("op")) < 1$ on every nontrivial irreducible.]
] <lem:finitegap>

#proof[
  Equality on a unit vector would force equality at every orthogonal projection in the product.
    The vector would be fixed by all coordinate-pair transpositions.
    The edges of the cube form a connected graph, and its edge transpositions generate $S_n$,
    contradicting nontrivial irreducibility. ◻
]

#thm([Lemma 1.3.])[
  (Support obstruction).  #emph[ For every integer $t gt.eq 0$,
$ parallel q_d^(* t) - U_(S_n) parallel_(upright("TV")) gt.eq 1 - 2^(t n \/ 2) \/ n ! . $

 Consequently $t_(upright("mix")) \( d \) gt.eq ceil.l \( 2 \/ n \) log_2 \( 3 n ! \/ 4 \) ceil.r = 2 d - O \( 1 \)$.]
] <lem:support>

#proof[
  At most $2^(t n \/ 2)$ coin strings are available, so the law is supported on at most that many permutations.
    Comparing this support set with its uniform mass proves the first assertion.
    Distance at most $1 \/ 4$ requires support mass at least $3 \/ 4$, giving the exact integer lower bound.
    Stirling’s formula gives the final expression and, before the integer rounding, the sharper expansion $2 /
    n log_2 \( 3 n ! \/ 4 \) = 2 d - 2 log_2 e + o \( 1 \)$. For $t lt.eq d$,
    the support fraction is at most $n^(n \/ 2) \/ n ! = o \( 1 \)$, so the distance is $1 - o \( 1 \)$. ◻
]

===== 1.1.2 Plancherel and powers of a nonnormal sweep <plancherel-and-powers-of-a-nonnormal-sweep>

All matrix traces and Schatten norms are unnormalized. Thus $parallel A parallel_(S^p)^p = "Tr" \| A \|^p$,
  with $S^2 = upright("HS")$ and $S^oo = upright("op")$. If $D_lambda$ is the irreducible dimension,
  finite-group orthogonality gives

$ \| G \| sum_g \| mu \( g \) \|^2 = sum_lambda D_lambda parallel hat(mu) \( lambda \) parallel_(upright("HS"))^2 . $

It applies to signed measures and subprobabilities as well as probabilities. For a measure $v$ of mass $m$,

#[#set math.equation(numbering: n => "(4)")
 $ parallel v - m U_G parallel_1^2 lt.eq sum_(lambda eq.not upright(bold(1))) D_lambda parallel
   hat(v) \( lambda \) parallel_(upright("HS"))^2 . $ <eq:plancherel>]

For a probability the left side is $4 parallel v - U_G parallel_(upright("TV"))^2$.
  If $0 lt.eq v lt.eq mu$ and $mu$ is a probability, then

#[#set math.equation(numbering: n => "(5)")
 $ parallel mu - U_G parallel_(upright("TV")) lt.eq 1 - m + 1 / 2 parallel v - m U_G parallel_1 . $ <eq:lostmass>]

Both follow from Cauchy–Schwarz and the triangle inequality, respectively.

#thm([Lemma 1.4.])[
  (Safe use of sweep powers).  #emph[For integers $r gt.eq s gt.eq 1$ and any matrix $T$, setting $Q = T^(*) T$,
$ parallel T^r parallel_(upright("HS"))^2 lt.eq parallel Q parallel_(upright("op"))^(r - s) "Tr" Q^s . $

]
] <lem:schatten>

#proof[
  Schatten Hölder gives $parallel T^s parallel_(upright("HS")) lt.eq parallel T parallel_(S^(2 s))^s$,
    and multiplying the remaining $r - s$ factors costs at most $parallel T parallel_(upright("op"))^(r - s)$.
    Squaring proves the claim. No normality of $T$ is used. ◻
]

===== 1.1.3 Injection multiplicities and inverse-degree sums <injection-multiplicities-and-inverse-degree-sums>

We use the standard indexing of complex irreducibles of $S_n$ by partitions $lambda tack.r n$, with $D_lambda =
  f^lambda$ equal to the number of standard tableaux #cite(label("Sagan2001")) #cite(label("Stanley1999")).
  Write $k = n - lambda_1$ and $macron(lambda) = \( lambda_2 \, lambda_3 \, dots.h \)$.
  Young branching and Frobenius reciprocity show that the representation on ordered distinct $r$-tuples contains
  $lambda$ with multiplicity

$ f^(lambda \/ \( n - r \)) . $

At $r = k$ this is $f^(macron(lambda))$, and $lambda$ does not occur on fewer slots.
  If $k lt.eq r lt.eq n - k$, the remaining first-row boxes are separated from the tail, giving

#[#set math.equation(numbering: n => "(6)")
 $ m_lambda \( r \) = binom(r, k) f^(macron(lambda)) \, wide D_lambda lt.eq
   binom(n, k) f^(macron(lambda)) . $ <eq:tuplemultiplicity>]

The inequality follows by choosing the entries below the first row and forgetting cross-row tableau constraints.
  The same hook formula gives the useful quantitative refinement

#[#set math.equation(numbering: n => "(7)")
 $ D_lambda gt.eq binom(n, k) f^(macron(lambda)) exp (- frac(k, n - 2 k + 1)) wide \( 0 lt.eq k lt.eq n \/ 2 \) .
   $ <eq:near-row-hooks>]

Indeed the hook inflation along the top row, relative to $\( n - k \) !$, is

$ product_(j lt.eq lambda_2) (1 + frac(lambda'_j - 1, n - k - j + 1)) . $

The denominators are at least $n - 2 k + 1$ and $sum_j \( lambda'_j - 1 \) = k$.
  Taking logarithms bounds this product by $exp \( k \/ \( n - 2 k + 1 \) \)$.
  The remaining hooks are exactly those of $macron(lambda)$.
  In particular for $k lt.eq .14 n$ the loss is $exp \( O \( k \/ n \) \)$,
  which also supplies the weaker $exp \( O \( k log n \/ n + k \/ n \) \)$ loss when that form is convenient.

The inverse-degree convergence below is the case $s = 1$ of the stronger estimate of Liebeck and
  Shalev #cite(label("liebeck-shalev2004")) Theorem 2.6. We include an elementary proof together with the
  pointwise bound needed later. These estimates specify which negative dimension powers are available to the
  different proofs.

#thm([Lemma 1.5.])[
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

==== 1.2 Signed densities and pointwise stabilizers <sec:static>

We now prove the two comparisons needed by the first moment induction.
  The density estimate retains both the global entropy and all local carrier factors.
  The stabilizer estimate retains the exact index of the subgroup. Neither argument uses a sweep moment bound.

Let $E$ and $O$ be orthogonal copies of $bb(C)^q$, with $q gt.eq 1$, and set $V = E xor O$.
  On $V^(⊗ p)$ a permutation acts by permuting factors and multiplying by the sign of its permutation of the odd
  factors. A density is called even if it is positive, has trace one, and preserves $E$ and $O$.
  Put $G_q = U \( E \) times U \( O \)$. For partitions $a \, b$ with at most $q$ parts and $\| a \| + \| b \| =
  p$, define

$ F \( a \, b \) = p log p - sum_i a_i log a_i - sum_j b_j log b_j \, wide u \( a \, b \) =
  dim cal(U)_a dim cal(U)_b \, $

where $cal(U)_a \, cal(U)_b$ are the ordinary polynomial unitary representations.
  Zero summands are omitted; $F \( diameter \, diameter \) = 0$ and $u \( diameter \, diameter \) = 1$.
  All traces below are unnormalized. Throughout this paper,
  Haar measures on compact groups are normalized to probability.
  We use compact matrix-coefficient orthogonality in the form of Morel #cite(label("Morel2018")) Theorem
  IV.3.8(i)–(ii), pp. 84–85. The $G_q$-isotypic projection $Q_(a \, b)$ has range

#[#set math.equation(numbering: n => "(8)")
 $ cal(M)_(a \, b) ⊗ cal(U)_a ⊗ cal(U)_b \, wide cal(M)_(a \, b) =
   "Ind"_(S_(\| a \|) times S_(\| b \|))^(S_p) \( V_a ⊗ V_(b^t) \) . $ <eq:signed-sector-decomposition>]

Indeed, first fix the even sites, apply ordinary Schur–Weyl duality #cite(label("etingof")) Theorem 4.57 and
  Corollary 4.59 separately to the two kinds of sites, twist the odd symmetric-group factor by sign,
  and then sum over allocations of the even sites.

#thm([Lemma 1.6.])[
  (Density domination of a signed spin type).  #emph[For every such $\( a \, b \)$ there is a probability
    distribution on even densities $R$ such that
#[#set math.equation(numbering: n => "(9)")
 $ Q_(a \, b) prec.curly.eq e^(F \( a \, b \)) u \( a \, b \) thin bb(E) R^(⊗ p) . $ <eq:signed-type-density-exact>]

 For every even density $T$ and every type $\( a \, b \)$,
#[#set math.equation(numbering: n => "(10)")
 $ parallel T^(⊗ p) Q_(a \, b) parallel_(upright("op")) lt.eq e^(- F \( a \, b \)) . $ <eq:signed-global-density-upper>]

 Moreover $u \( a \, b \) lt.eq \( p + 1 \)^(q \( q - 1 \))$.]
  #emph[For arbitrary parity dimensions, the upper bound has the following carrier form.
    Let $E_(+) = bb(C)^(r_(+))$ and $E_(-) = bb(C)^(r_(-))$, for nonnegative integers $r_(+) \, r_(-)$,
    and let $a \, b$ have at most $r_(+) \, r_(-)$ parts, respectively, with $\| a \| + \| b \| = p$.
    Write $upright(bold(S))_a \( E_(+) \)$ and $upright(bold(S))_b \( E_(-) \)$ for the ordinary polynomial
    carriers of highest weights $a \, b$. For a positive parity-preserving matrix $T$ on $E_(+) xor E_(-)$,
    let its induced carrier action be $pi_(a \, b) \( T \) = upright(bold(S))_a \( T \|_(E_(+)) \) ⊗
    upright(bold(S))_b \( T \|_(E_(-)) \)$. With $F \( a \, b \)$ given by the same entropy formula,
#[#set math.equation(numbering: n => "(11)")
 $ parallel pi_(a \, b) \( T \) parallel_(upright("op")) lt.eq \( "Tr" T \)^p e^(- F \( a \, b \)) .
   $ <eq:signed-carrier-density-upper>]

 A zero-dimensional factor has the empty partition and contributes the scalar identity.
   If $p = 0$, then $pi_(a \, b) \( T \) = 1$ and the right-hand side is interpreted as one, even when $"Tr" T = 0$.]
] <lem:signed-type-density>

#proof[
  For $p = 0$ all assertions mean the identity on a one-dimensional space.
    For the density domination with $p > 0$, take the density with eigenvalues $a_i \/ p$ on $E$ and $b_j \/
    p$ on $O$, padded with zeroes, and conjugate it by Haar $G_q$.
    On the sector in (8), its tensor power is the identity on $cal(M)_(a \, b)$ times the polynomial action on the
    two unitary factors. Haar averaging is scalar on their irreducible tensor product.
    Its scalar is the trace of that action divided by $u \( a \, b \)$. The highest weight contributes the eigenvalue
  $ product_i \( a_i \/ p \)^(a_i) product_j \( b_j \/ p \)^(b_j) = e^(- F \( a \, b \)) \; $
  therefore the scalar is at least $e^(- F \( a \, b \)) \/ u \( a \, b \)$.
    The average is positive on every other sector and commutes with the sector projections,
    proving the positive-order assertion.
  For the carrier estimate, suppose first that $T$ is positive definite on its nonzero parity factors.
    Order the eigenvalues on $E_(+)$ as $x_1 gt.eq dots.h.c gt.eq x_(r_(+)) > 0$.
    The largest eigenvalue of the polynomial action of shape $a$ is $product_i x_i^(a_i)$.
    Indeed, the Weyl character formula #cite(label("etingof")) Theorem 4.63 and the semistandard-tableau expansion
    of the Schur polynomial #cite(label("Lam2012")) §3.1 and Theorem 3.2 identify its weights $w$ with tableau
    contents. Column strictness gives $sum_(i lt.eq k) w_i lt.eq sum_(i lt.eq k) a_i$ and $sum_i w_i = \| a \|$.
    Summation by parts against the decreasing $log x_i$ gives the upper bound, and the highest weight attains it.
    The same argument on $E_(-)$, with ordered eigenvalues $y_j$, gives
  $ parallel pi_(a \, b) \( T \) parallel_(upright("op")) = product_i x_i^(a_i) product_j y_j^(b_j) . $
  Absent parity factors contribute empty products. Apply weighted arithmetic–geometric means to the combined
    spectrum, with weights $a_i \/ p$ and $b_j \/ p$, omitting zero weights.
    Since $sum_i x_i + sum_j y_j = "Tr" T$, this product is at most
  $ \( "Tr" T \)^p product_i \( a_i \/ p \)^(a_i) product_j \( b_j \/ p \)^(b_j) = \( "Tr" T \)^p
    e^(- F \( a \, b \)) . $
  Singular matrices follow by continuity. This proves (11); taking $r_(+) = r_(-) = q$ and $"Tr" T =
    1$ proves (10), since the tensor action is the identity on $cal(M)_(a \, b)$.
    In this equal-rank setting, the Weyl formula also gives
  $ dim cal(U)_a = product_(1 lt.eq i < j lt.eq q) frac(a_i - a_j + j - i, j - i)
    lt.eq \( p + 1 \)^(q \( q - 1 \) \/ 2) \, $
  and likewise for $b$. ◻
]

We next compare row and column types on a board from which sites have been removed.
  The removed sites have no tensor factors. They need not be random, and the conclusion is uniform in their locations.

#thm([Theorem 1.7.])[
  (One-sided angle for signed spin types).  #emph[Let $W$ be any set of $p = s m -
    l$ occupied cells of an $s$-row, $m$-column rectangle. On $V^(⊗ W)$,
    let $P$ be the global $G_q$-type projection with type $\( alpha \, beta \)$,
    and let $P_H$ and $P_K$ be products of prescribed column and row $G_q$-type projections.
    Write $\( a^j \, b^j \)$ for the column types and $\( c^i \, d^i \)$ for the row types,
    with sizes equal to their respective occupied block sizes. Put
$ F = F \( alpha \, beta \) \, wide F_H = sum_j F \( a^j \, b^j \) \, wide F_K = sum_i F \( c^i \, d^i \) \,\
U_H = product_j u \( a^j \, b^j \) \, wide U_K = product_i u \( c^i \, d^i \) . $

 If $b_i$ cells are missing from row $i$, put
$ Phi_K \( W \) = product_(i : b_i < m) (frac(m, m - b_i))^(m - b_i) \, $

 using factor one when a row is empty. Then
#[#set math.equation(numbering: n => "(12)")
 $ parallel P_H P_K P parallel_(upright("op"))^2 lt.eq min { 1 \, e^(F_H + F_K - F) U_H U_K Phi_K \( W \) } lt.eq
   min { 1 \, e^(F_H + F_K - F + l) U_H U_K } . $ <eq:one-sided-type-angle-exact>]

 In particular $U_H U_K lt.eq \( p + 1 \)^(\( s + m \) q \( q - 1 \))$.]
] <thm:one-sided-type-angle>

#proof[
  All three projections commute with the diagonal $G_q$ action, and $P$ commutes with $P_H$ and $P_K$.
    Apply Lemma 8 independently in each column. Writing $R = ⨂_(\( i \, j \) in W) R_j$, we obtain
  $ P_H prec.curly.eq e^(F_H) U_H bb(E) R . $
  Thus, by positive compression and convexity of the operator norm,
  $ parallel P_H P_K P parallel^2 lt.eq e^(F_H) U_H sup_R parallel R^(1 \/ 2) P_K P parallel^2 . $
  Assign an arbitrary even density also to an empty column, put $macron(R) = m^(- 1) sum_j R_j$, and let $T =
    macron(R)^(⊗ W)$. Every column density is supported on $"supp" macron(R)$.
    Use inverse powers of $T$ only on its support. The operators $T$ and its support projection commute with
    $P_K \, P$: on each row $T$ is a constant tensor power, and it commutes with every local type projection,
    as well as with the global type projection. Consequently
  $ R^(1 \/ 2) P_K P = R^(1 \/ 2) T^(- 1 \/ 2) P_K P T^(1 \/ 2) \, wide parallel R^(1 \/ 2) P_K P parallel^2 lt.eq
    e^(- F) parallel R^(1 \/ 2) T^(- 1 \/ 2) P_K parallel^2 . $
  Here the last inequality is (10). The row version of the density domination gives $P_K prec.curly.eq e^(F_K) U_K
    bb(E) S$, with $S = ⨂_(\( i \, j \) in W) S_i$. For any operator $A$, $parallel A P_K parallel^2 =
    parallel A P_K A^(*) parallel$, so a further positive compression gives
  $ parallel R^(1 \/ 2) T^(- 1 \/ 2) P_K parallel^2 lt.eq e^(F_K) U_K sup_S parallel R^(1 \/ 2) T^(- 1 \/ 2)
    S^(1 \/ 2) parallel^2 . $
  This uses no commutation between different density matrices and no interchange between square roots and mixtures.
  The final norm is a product over occupied cells of $parallel R_j^(1 \/ 2) macron(R)^(- 1 \/ 2) S_i^(1 \/ 2)
    parallel^2$, which is at most the product of the nonnegative numbers
  $ z_(i j) = "Tr" \( macron(R)^(- 1 \/ 2) R_j macron(R)^(- 1 \/ 2) S_i \) . $
  For every row $i$, their sum over all $m$ columns is $m "Tr" \( Q S_i \) lt.eq m$,
    where $Q$ is the support projection of $macron(R)$. Arithmetic–geometric means on the $m -
    b_i$ retained factors give the factor in $Phi_K \( W \)$.
    Finally $\( m - b_i \) log \( m \/ \( m - b_i \) \) lt.eq b_i$, including the empty-row convention,
    so $Phi_K \( W \) lt.eq e^l$. The trivial norm bound is one. ◻
]

#thm([Lemma 1.8.])[
  (Positive restriction to a pointwise stabilizer).  #emph[Let $G$ be finite, let $H lt.eq G$, and let $x =
    sum_(g in G) x_g g$ be positive in $bb(C) \[ G \]$. Set $E_H x = sum_(h in H) x_h h$.
    For $rho in hat(H)$ let $Lambda_rho$ be the set of $mu in hat(G)$ whose restriction to $H$ contains $rho$.
    With $d_rho = dim rho$ and $d_mu = dim mu$,
#[#set math.equation(numbering: n => "(13)")
 $ 0 lt.eq "Tr"_rho \( E_H x \) lt.eq frac(1, \[ G : H \] d_rho) sum_(mu in Lambda_rho) d_mu "Tr"_mu \( x \) .
   $ <eq:pointwise-positive-restriction>]

 For $G = S_s$ and $H = S_(s - h)$ fixing $h$ specified points, the index is $\( s \)_h = s ! \/ \( s - h \) !$.]
] <lem:pointwise-positive-restriction>

#proof[
  In the regular representation, compression to $ell^2 \( H \)$ identifies the convolution operator of $E_H
    x$ with a principal block of the positive operator of $x$. Thus $E_H x$ is positive.
    Let $e_Lambda$ be the sum of the central irreducible projections for $Lambda = Lambda_rho$, and put $y =
    e_Lambda x$. This is again positive. In $"Ind"_H^G rho$, all irreducible types lie in $Lambda$,
    so $x$ and $y$ have the same action. Their blocks on the fiber of the identity coset are respectively
    $rho \( E_H x \)$ and $rho \( E_H y \)$, which are therefore equal. Regular trace gives
  $ y_e = frac(1, \| G \|) sum_(mu in Lambda) d_mu "Tr"_mu \( x \) . $
  Positivity of $E_H y$ and regular decomposition on $H$ give
  $ d_rho "Tr"_rho \( E_H x \) = d_rho "Tr"_rho \( E_H y \) lt.eq
    "Tr"_(upright(r e g \, H)) \( E_H y \) = \| H \| y_e \, $
  which is the assertion. In particular restriction multiplicities do not multiply the sum over $mu$. ◻
]

===== 1.2.1 Hook dimensions and the local trace <hook-dimensions-and-the-local-trace>

#thm([Lemma 1.9.])[
  (Hook dimensions and carrier multiplicities).  #emph[Fix $N gt.eq p gt.eq 0$, $q gt.eq 1$, and put $B = N + q +
    1$. If $V_rho$ occurs in $cal(M)_(a \, b)$ from (8), then $rho_(q + 1) lt.eq q$ and
#[#set math.equation(numbering: n => "(14)")
 $ e^(F \( a \, b \)) B^(- 7 q^2) lt.eq D_rho \, wide dim cal(M)_(a \, b) lt.eq
   e^(F \( a \, b \)) . $ <eq:hook-dimension-explicit>]

 The multiplicity of any $V_rho$ in $V^(⊗ p)$ is at most $B^(10 q^2)$.
   The occurring shapes are exactly the $\( q \, q \)$-hook shapes. There are at most $\( p + 1 \)^(2 q)$ such shapes.]
] <lem:signed-hook-carriers>

#proof[
  The claims are immediate for $p = 0$. Inducing the sign representations of sizes $b_1 \, dots.h \,
    b_q$ contains $V_(b^t)$. Repeated vertical Pieri therefore gives $rho_i lt.eq a_i + q$.
    Transposition and the same argument give $rho'_j lt.eq b_j + q$.
    In particular there are no cells beyond row $q$ and column $q$ simultaneously.
  Split the diagram into its $q$-square core, its right arms and its bottom arms.
    The core contributes at most $\( p + q \)^(q^2)$ to the hook product.
    In right row $i lt.eq q$ the arm length $r_i = \( rho_i - q \)_(+)$ is at most $a_i$,
    and each hook is at most its ordinary row hook plus $q$. Thus its hook product is at most $\( r_i + q \) ! \/
    q ! lt.eq a_i ! \( p + q \)^q$. The bottom column $j lt.eq
    q$ similarly contributes at most $b_j ! \( p + q \)^q$. The hook formula gives
  $ D_rho gt.eq frac(p !, product_i a_i ! product_j b_j !) \( p + q \)^(- 3 q^2) . $
  The elementary integral estimates $log p ! gt.eq p log p - p$ and $log k ! lt.eq k log k - k +
    2 log \( p + 1 \)$ for $1 lt.eq k lt.eq p$ show that the multinomial factor is at least
    $e^(F \( a \, b \)) \( p + 1 \)^(- 4 q)$. This proves the first estimate in (14).
    Conversely $D_a lt.eq \| a \| ! \/ product_i a_i !$ and likewise for $b$, so $dim cal(M)_(a \, b) lt.eq
    p ! \/ \( product_i a_i ! product_j b_j ! \) lt.eq e^(F \( a \, b \))$.
    The final inequality follows by taking one term in the multinomial theorem with probabilities given by the
    parts divided by $p$.
  If $c_(a \, b)^rho$ is the multiplicity of $V_rho$ in $cal(M)_(a \, b)$, then $c_(a \, b)^rho D_rho lt.eq
    dim cal(M)_(a \, b)$, so $c_(a \, b)^rho lt.eq B^(7 q^2)$.
    There are at most $\( p + 1 \)^(2 q) lt.eq B^(2 q^2)$ pairs $\( a \, b \)$, and $u \( a \, b \) lt.eq
    B^(q^2)$. Summing $c_(a \, b)^rho u \( a \, b \)$ proves the $B^(10 q^2)$ bound.
    For the converse occurrence assertion, use the Littlewood–Richardson
    rule #cite(label("SamSnowden2012")) §2.13, equation (2.13.1), and §2.14:
    take $a$ to be the first $q$ rows of a hook shape $rho$ and $b^t$ its remaining rows.
    Then $b$ has at most $q$ parts and the Littlewood–Richardson coefficient $c_(a \, b^t)^rho$ is one:
    the skew shape $rho \/ a$ is the ordinary diagram $b^t$ translated down.
    Finally, the first $q$ row lengths and the lengths of the bottom arms in the first $q$ columns determine the
    hook shape, giving the type count. ◻
]

===== 1.2.2 Labeled-hole traces and the local entropy factor <s:labeled-hole-traces>

The pointwise-stabilizer lemma can be inserted into the signed tensor trace without any implicit normalized trace.
  Let $n = s m$, let $l$ distinct labels mark the holes, and let $p = n - l$.
  The direct sum of spin spaces over all ordered hole placements is

$ "Ind"_(S_p times S_l)^(S_n) \( V^(⊗ p) ⊗ bb(C) \[ S_l \] \) . $

Here $S_l$ acts regularly because every hole has its own label.
  Its global spin type $\( alpha \, beta \)$ has permutation representation

$ "Ind"_(S_(\| alpha \|) times S_(\| beta \|) times S_l)^(S_n) \( V_alpha ⊗ V_(beta^t) ⊗ bb(C) \[ S_l \] \) quad
  upright("with carrier factor ") cal(U)_alpha ⊗ cal(U)_beta . $

For group-algebra elements $X \, Y$ that are products of positive elements over columns and rows respectively,
  let $X_z \, Y_z$ be their diagonal blocks at placement $z$.
  Let $P$ be the global $\( alpha \, beta \)$-type projection on the direct sum over hole placements,
  and let $P_z$ be its block at $z$. If $V_alpha ⊗ V_(beta^t) ⊗ V_gamma$ occurs in the restriction of $V_lambda$,
  its multiplicity in this space is at least $D_gamma u \( alpha \, beta \)$. Consequently,

#[#set math.equation(numbering: n => "(15)")
 $ D_gamma u \( alpha \, beta \) "Tr"_lambda \( X Y \) lt.eq "Tr" \( P X Y \) =
   sum_z "Tr" \( P_z X_z Y_z \) . $ <eq:labeled-hole-trace>]

Every irreducible trace of $X Y$ is nonnegative, since it is the trace of a product of two positive matrices.
  Thus one may discard both other irreducibles and any additional multiplicity copies.
  The last identity follows from a geometric constraint: a nonzero block $X_(z \, w)$ preserves each hole’s
  column, while a nonzero $Y_(w \, z)$ preserves each hole’s row. Both constraints force $w = z$.
  At fixed $z$, each factor of $X_z$ is exactly a coefficient restriction to the subgroup fixing the labels in its
  column. In the moment induction we retain only $D_gamma$ on the left;
  this is legitimate because $u \( alpha \, beta \) gt.eq 1$.

For clarity, one useful quantitative consequence of Lemma 10 is recorded next.

#thm([Lemma 1.10.])[
  (Local stabilizer trace).  #emph[Suppose $x succ.curly.eq 0$ is in $bb(C) \[ S_t \]$,
    $h$ specified points are fixed, and $a \, b$ each have at most $q$ parts and total size $t - h$.
    Fix an arbitrary real scalar $G$. Assume, for every $mu tack.r t$ extending a constituent of $cal(M)_(a \, b)$,
$ D_mu "Tr"_mu x lt.eq exp { eta F \( a \, b \) + G } \, wide 0 lt.eq eta lt.eq 1 . $

 Write $sans(p) \( t \)$ for the number of partitions of $t$, and let $B = N + q + 1$ with $N gt.eq t$. Then
#[#set math.equation(numbering: n => "(16)")
 $ "Tr" \( Q_(a \, b) E_(S_(t - h)) x \) lt.eq frac(sans(p) \( t \), \( t \)_h) B^(15 q^2) exp { - \( 1 - eta \)
   F \( a \, b \) + G } . $ <eq:local-stabilizer-trace-explicit>]

]
] <s:local-stabilizer-trace>

#proof[
  Write $c_rho$ for the multiplicity of $V_rho$ in $cal(M)_(a \, b)$ and use the exact trace decomposition
  $ "Tr" \( Q_(a \, b) E_(S_(t - h)) x \) = u \( a \, b \) sum_rho c_rho "Tr"_rho \( E_(S_(t - h)) x \) . $
  There are at most $sans(p) \( t \)$ terms $mu$ in each stabilizer bound. Also, by Lemma 11,
  $ sum_rho c_rho / D_rho lt.eq frac(sum_rho c_rho D_rho, \( e^(F \( a \, b \)) B^(- 7 q^2) \)^2) lt.eq
    e^(- F \( a \, b \)) B^(14 q^2) . $
  Multiplying by $u \( a \, b \) lt.eq B^(q^2)$ proves the assertion.
    Every extension $mu$ satisfies the required occurrence with some diagram $gamma tack.r h$:
    restrict first to $S_(t - h) times S_h$, choose a nonzero type in the multiplicity space of the chosen $rho$,
    and then restrict $rho$ to the even and odd subgroups. Thus using an occurrence-wise inductive bound here
    requires no new quantifier over $gamma$. ◻
]

==== 1.3 The every-occurrence spin bound <ten:spin>

We prove Theorem 1. The proof first isolates the sparse representations and then inducts on a balanced split of
  the coordinates. The signed tensor and stabilizer comparisons of Section 2 supply the two local inputs to the
  induction. Put $J_n \( lambda \) = D_lambda "Tr"_(V_lambda) \( B_n^(*) B_n \)^r$,
  with the fixed integer $r$ still to be chosen.

===== 1.3.1 Dimensions outside the sparse range <dimensions-outside-the-sparse-range>

The induction needs a lower bound on dimension to absorb its counting errors.
  Shapes with more than $n \/ 2$ rows are already annihilated by Lemma 3; the following estimate treats the others.

#thm([Lemma 1.11.])[
  #emph[There is an absolute $c > 0$ such that, for all sufficiently large $n$,
    if $lambda tack.r n$ has at most $n \/ 2$ rows and $k = n - lambda_1 gt.eq 1$, then
$ log D_lambda gt.eq cases(delim: "{", c k log \( n \/ k \) \, & k lt.eq n \/ 4 \,, c n \, & k gt.eq n \/ 4 .) $

]
] <lem:spin-dimension-range>

#proof[
  For $k lt.eq n \/ 4$, (7) gives $D_lambda gt.eq e^(- 1) binom(n, k)$,
    and the binomial lower bound proves the assertion. Suppose $k gt.eq n \/ 4$.
    If the first row and first column both have length less than $n \/ 10$, every hook is at most $n \/ 5$,
    so the hook formula gives $D_lambda gt.eq n ! \/ \( n \/ 5 \)^n$, exponential in $n$.
    Otherwise, transpose if necessary to obtain a first row of length $L in \[ n \/ 10 \, 3 n \/ 4 \]$.
    Retain this row and $j = floor.l n \/ 100 floor.r$ boxes below it.
    These boxes can be chosen as a subdiagram, and its tableaux extend to $lambda$.
    Applying (7) to this subdiagram gives a lower bound $e^(- 1) binom(L + j, j)$, again exponential in $n$. ◻
]

===== 1.3.2 The sparse weighted-forest estimate <the-sparse-weighted-forest-estimate>

Here is the operator estimate for small levels. For any fixed $0 < delta < 1$, for $1 lt.eq k = n - lambda_1 lt.eq
  n^(1 - delta)$,

#[#set math.equation(numbering: n => "(17)")
 $ parallel B_n parallel_(V_lambda) lt.eq e^(O \( k \)) \( 2 d k \/ n \)^(k \/ 4) $ <ten:spin:eq:5>]

for large $n$, where the notation on the left means operator norm in $V_lambda$.

Let $Omega_k$ be the ordered $k$-tuples of distinct positions.
  By branching, $V_lambda$ occurs in $ell^2 \( Omega_k \)$ and is orthogonal to every function that omits at least
  one tuple coordinate. We may use either the sweep kernel or its adjoint, since their norms agree.
  For $A subset.eq { 1 \, dots.h \, k }$ and any tuple $x$ whose $A$-coordinates are distinct, define

$ F_A \( x \, y \) = n^(\| A \|) bb(P) { B_n \( x_i \) = y_i upright(" for all ") i in A } \, wide
  L_A \( x \, y \) = n^(- k) F_A \( x \, y \) . $

In this probability $B_n$ denotes a random sweep permutation.
  Allowing arbitrary $y in \( bb(F)_2^d \)^k$, $L_A \( x \, dot.op \)$ is the probability law obtained by running
  all labels in $A$ through one sweep and sending each other label independently to a uniform position.
  Thus $L_A$ is a Markov kernel on tuples whose $A$-coordinates are distinct;
  its restriction to $Omega_k$ can lose mass. In particular, $L_({ 1 \, dots.h \, k })$ is the tuple kernel.

Given endpoints $x \, y$, each label has a unique path through a sweep, because each coordinate is processed once.
  Join two labels when their paths use the same switch location.
  If label $i$ is isolated, its switch prescriptions are independent of those of all other labels.
  Hence $F_(A union { i }) \( x \, y \) = F_A \( x \, y \)$ whenever $i in.not A$.
  On $V_lambda$ we can therefore compute matrix coefficients with

$ n^(- k) sum_A \( - 1 \)^(k - \| A \|) F_A \( x \, y \) $

since all proper subsets give zero there. It vanishes if there is an isolated vertex.
  Consequently we bound the norm by the sum of norms of nonnegative kernels

$ K_A \( x \, y \) =
  n^(- k) F_A \( x \, y \) upright(bold(1))_({ upright("the encounter graph has no isolated vertex") }) . $

We next bound $K_A$ by a two-trip experiment. Draw $y$ from $L_A \( x \, dot.op \)$.
  From $y$, run a fresh reversed sweep for the labels in $A$,
  and an independent fresh reversed sweep for each other label; call the resulting tuple $x'$.
  For distinct $y \, x'$, the transition weight of this second trip is $L_A \( x' \, y \)$:
  the coupled tuple sweep is replaced by its adjoint, and the one-label weights remain $1 \/ n$.
  Let $cal(E)_2$ be the event that the second-trip paths have no isolated label.
  Removing the first-trip encounter requirement and both distinctness requirements gives

$ sum_(x' in Omega_k) \( K_A K_A^(*) \) \( x \, x' \) = sum_(y \, x' in Omega_k) K_A \( x \, y \)
  K_A \( x' \, y \) lt.eq bb(P)_x \( cal(E)_2 \) . $

The coupled labels remain distinct in either trip; the dropped constraints concern the full tuple,
  including the independent labels.

Condition only on the switch settings of the second trip.
  There is one fixed permutation network for $A$ and one for each label outside $A$;
  the first-trip endpoints $y$ remain random with their original law.
  Make a graph with one vertex for every starting position in each of these networks.
  Join distinct vertices when their fixed paths use the same switch location at a layer, also across networks.
  A vertex has at most $2 d$ neighbors in any one network.

Let $S$ be the set of the $k$ occupied vertices. For every set $T$ of distinct graph vertices we have

$ bb(P) { T subset.eq S } lt.eq product_(w in T) p_w \, wide p_w =
  cases(delim: "{", \| A \| \/ n \, & w upright(" in the ") A upright("-network") \,, 1 \/ n \, & w
  upright(" in a one-label network") .) $

To see the assertion for the $A$-network, track its position subset during the first trip.
  Initially it is fixed, so the joint-inclusion bound by products of the one-site marginals holds.
  A fair independent swap preserves this property. A test set containing exactly one swapped site uses linearity
  of the two probabilities; for a set containing both, the old product $p_u
  p_v$ is at most the new product $\( \( p_u + p_v \) \/ 2 \)^2$. Sets containing neither are unchanged.
  At the end every marginal is $\| A \| \/ n$, because each label is uniform.
  The occupied starting positions in the one-label networks are independent of this subset and of one another;
  selecting two vertices in one such network has probability zero.
  This proves the displayed joint-inclusion bound. For a deterministic starting subset,
  this inclusion bound is also a consequence of the stronger negative-dependence theory for random swap-or-retain
  operations #cite(label("BorceaBrandenLiggett2009")) Theorems 4.20 and 4.9.

In this weighted graph the total mass is $k$, and the weighted neighbor sum is bounded by $Delta = 2 d k \/ n$.
  To have no isolated vertices, the $k$ occupied vertices must contain a forest on $k$ vertices with component
  sizes at least two. Counting rooted plane trees for the components,
  the sum of product weights for candidates is bounded by

$ e^(O \( k \)) sum_(1 lt.eq j lt.eq k \/ 2) frac(k^j, j !) Delta^(k - j) . $

Indeed the plane forest shapes (ordered components) are at most exponentially many,
  and for any ordered shape the weight sum is bounded by $k^j Delta^(k - j)$ by descending from its $j$ roots.
  One can divide by $j !$ for the possible orders, since witnessing vertices are distinct.
  In the sparse range $Delta lt.eq 1$ for large $n$, and

$ sum_(1 lt.eq j lt.eq k \/ 2) frac(k^j, j !) Delta^(k - j) lt.eq Delta^(k \/ 2) sum_(j gt.eq 0) frac(k^j, j !) =
  e^k Delta^(k \/ 2) . $

For $k = 1$ the encounter event is empty. For the symmetric nonnegative matrix $K_A K_A^(*)$,
  the maximum row sum bounds the spectral radius. Therefore

$ parallel K_A parallel_(upright("op"))^2 lt.eq parallel K_A K_A^(*) parallel_(oo arrow.r oo) lt.eq
  e^(C k) Delta^(k \/ 2) . $

Taking square roots and summing the $2^k$ subset kernels gives $e^(O \( k \)) Delta^(k \/ 4)$, proving (17).

===== 1.3.3 Parameters and the induction range <parameters-and-the-induction-range>

We now turn to (3). Take a fixed small $epsilon.alt$, say $1 \/ 64$, and use

$ eta_d = macron(eta) \( 1 - 1 \/ \( 2 sqrt(d) \) \) \, wide kappa_d = macron(kappa) \( 1 - 1 \/ \( 2 sqrt(d) \) \) . $

Take $macron(eta) < 1$ and $macron(kappa) > 0$ sufficiently small that $macron(kappa) < epsilon.alt macron(eta) \/
  4$; both can be fixed as absolute constants. Set $kappa_(-) = macron(kappa) \/ 2$.
  Fix $xi > 0$ sufficiently small, e.g. $min \( 1 \/ 32 \, kappa_(-) \/ 4 \)$,
  and use the small-level estimate with $delta = xi \/ 4$. In the range of (17), $D_lambda lt.eq n^k$,
  so (3) holds with $J_n \( lambda \) lt.eq 1$ for sufficiently large fixed $r$.
  For any fixed finite range of sizes, Lemma 4 and $J_n \( lambda \) lt.eq
  D_lambda^2 parallel B_n parallel_(V_lambda)^(2 r)$ allow one $r$ to make every nontrivial weighted moment at
  most one. The trivial moment is one.

We prove (3) by induction on $d$, using a split into nearly equal numbers of coordinates.
  We only need to perform the induction step for sufficiently large $d$,
  with all largeness bounds independent of $r$; the same $r$, taken as a positive integer,
  can then be used throughout. In view of the previous bounds we assume

#[#set math.equation(numbering: n => "(18)")
 $ lambda_1^t lt.eq n \/ 2 \, wide k = n - lambda_1 > n^(1 - delta) \, wide log D_lambda med gt.eq
   c n^(1 - delta) . $ <ten:spin:eq:6>]

(The trivial case is already covered.) Put $s = 2^(floor.l d \/ 2 floor.r)$, $m = 2^(ceil.l d \/ 2 ceil.r)$,
  so positions form $m$ columns of size $s$, and $s$ rows of size $m$.
  Take the columns and rows corresponding to the consecutive parts of the sweep.
  Let $B_(upright("col"))$ be the product of the size $s$ column sweeps and $B_(upright("row"))$ the product of
  the size $m$ row sweeps, so $B_n = B_(upright("row")) B_(upright("col"))$.
  Put $U = B_(upright("row"))^(*) B_(upright("row"))$ and $V = B_(upright("col")) B_(upright("col"))^(*)$.
  The matrices $B_n^(*) B_n$ and $U^(1 \/ 2) V U^(1 \/ 2)$ have the same nonzero spectrum:
  they are $T^(*) T$ and $T T^(*)$ for $T = U^(1 \/ 2) B_(upright("col"))$.
  Applying the Araki–Lieb–Thirring trace inequality $"Tr" \( U^(1 \/ 2) V U^(1 \/ 2) \)^r lt.eq
  "Tr" \( U^r V^r \)$ for positive matrices and $r gt.eq 1$ gives

#[#set math.equation(numbering: n => "(19)")
 $ "Tr"_lambda \( B_n^(*) B_n \)^r med lt.eq med "Tr"_lambda \( X Y \) \, $ <ten:spin:eq:7>]

where $X = V^r = \( B_(upright("col")) B_(upright("col"))^(*) \)^r$ and $Y =
  U^r = \( B_(upright("row"))^(*) B_(upright("row")) \)^r$ are positive group algebra operators in the columns and
  rows respectively. They are products over their blocks, with single-block factors $\( B_s B_s^(*) \)^r$ in
  columns and $\( B_m^(*) B_m \)^r$ in rows. The two orientations of a child’s positive square have the same
  trace, so both use the child moment in (3).

Write $eta' = eta_(ceil.l d \/ 2 ceil.r)$ and $kappa' = kappa_(ceil.l d \/ 2 ceil.r)$,
  the larger coefficients of the two child sizes.

===== 1.3.4 Signed spins and holes <signed-spins-and-holes>

We can first assume that both $alpha \, beta$ have length $lt.eq q = ceil.l n^epsilon.alt ceil.r$.
  Indeed, truncate each after $q$ parts and move the remaining boxes into the number $l$,
  say increasing it to $L$. By branching and (1) the new pair of diagrams works with some diagram on $L$
  positions. If $F'$ is the new entropy, $F - F' gt.eq \( L - l \) log
  q$ since removed parts have size at most $\( u + v \) \/ q$.
  And $g_n \( L \) - g_n \( l \) lt.eq \( kappa_d log n + 1 \) \( L - l \)$.
  Thus the bound with the new data implies the desired one, for large $d$.

For data with these bounded lengths, our next objective is

$ log J_n \( lambda \) lt.eq eta' F \( alpha \, beta \) + kappa' l log n - l log \( n \/ l \) +
  O \( l + n^(1 - xi) \) . $

The local stabilizer traces will retain the child entropies;
  the angle estimate will convert them to the prescribed global entropy.
  Counting the labeled placements will produce the negative remainder term.
  The increments from $eta' \, kappa'$ to the parent coefficients will then absorb the displayed error.

Use the signed space $V = bb(C)^q xor bb(C)^q$ and its commuting group $U \( q \) times U \( q \)$ from Section 2.
  For a local spin type $\( a \, b \)$ its permutation representation is

#[#set math.equation(numbering: n => "(20)")
 $ "Ind"_(S_(\| a \|) times S_(\| b \|))^(S_(\| a \| + \| b \|)) \( V_a ⊗ V_(b^t) \) ⊗ cal(U)_a ⊗ cal(U)_b \,
   $ <ten:spin:eq:8>]

by (8). Its compact carrier has dimension at most $\( n + 1 \)^(q \( q - 1 \))$.
  Tensor positions may be regrouped by the signed permutation unitaries;
  parity-preserving spin matrices regroup in the usual way.

Allow $l$ holes in addition, specially marked by distinct labels,
  one assignment $z$ specifying distinct sites for these holes.
  The space is the orthogonal sum over $z$ of spin spaces on the remaining sites,
  with holes permuting along with positions (holes count as plus in the sign convention).
  Project to global spin type $\( alpha \, beta \)$ under the simultaneous $U \( q \) times U \( q \)$;
  call this projector $P$, with its diagonal blocks at fixed assignments also denoted $P$.
  Its space as a permutation representation contains $V_lambda$ with multiplicity at least $D_gamma$, by (20),
  (1), and the regular permutation space for ordering the $l$ holes.
  Since (19) involves a trace of a product of positive elements, each irreducible contributes nonnegatively, so

#[#set math.equation(numbering: n => "(21)")
 $ D_gamma "Tr"_lambda \( X Y \) lt.eq "Tr" \( P X Y \) = sum_z "Tr" \( P X_z Y_z \) . $ <ten:spin:eq:9>]

Here $X_z \, Y_z$ are the diagonal blocks at $z$, both positive.
  This diagonal-block reduction holds because $X$ preserves the column of every hole label, $Y$ the row,
  and hence in the trace the intermediate location must equal the specified location for each label.
  The projectors for the global spin group leave assignments fixed.
  At fixed $z$, $X_z$ factors in the column spin blocks on remaining sites,
  and $Y_z$ similarly in the row spin blocks. Write $h_j$ for the number of holes in column $j$,
  and $b_i$ for the number in row $i$.

===== 1.3.5 Local stabilizer trace bounds <local-stabilizer-trace-bounds>

We give local trace bounds for (21). Use local column spin-unitary type projectors $P_H$,
  one type specified in each column, and local row type projectors $P_K$.
  For these choices let $F_H \, F_K$ be the sums of the entropies (2) of their respective types,
  using each block’s own total spin-site count. All these projectors commute with $P$; $X_z$ commutes with $P \,
  P_H$ and $Y_z$ with $P \, P_K$. Then for each fixed set of column types,

#[#set math.equation(numbering: n => "(22)")
 $ "Tr" \( X_z P_H \) lt.eq (product_j \( s \)_(h_j)^(- 1)) exp
   (- \( 1 - eta' \) F_H + sum_j g_s \( h_j \) + O \( n^(1 - xi) \)) \, $ <ten:spin:eq:10>]

where $\( s \)_h = s \( s - 1 \) dots.h.c \( s - h + 1 \)$. There is the analogous row bound with $m \, b_i$.

Apply Lemma 12 to each column with $t = s$, $h = h_j$, $N = n$, $G = g_s \( h_j \)$,
  and its specified local type $\( a \, b \)$. For every constituent $rho$ the exact restriction step is

#[#set math.equation(numbering: n => "(23)")
 $ "Tr"_rho \( E_(S_(s - h)) x \) lt.eq frac(1, \( s \)_h D_rho) sum_(mu supset.eq rho) J_s \( mu \) .
   $ <ten:spin:eq:11>]

Every extension $mu$ has an occurrence of $a \, b$ together with some $h$-box diagram, as proved in that lemma.
  Thus the every-occurrence induction hypothesis applies, with the larger child coefficients $eta' \, kappa'$.
  Lemma 11 gives

#[#set math.equation(numbering: n => "(24)")
 $ log D_rho gt.eq F \( a \, b \) - O \( q^2 log \( n + 1 \) \) . $ <ten:spin:eq:12>]

The local trace lemma has already included the multiplicities and the compact carrier;
  these must not be inserted a second time. Its remaining factor is the partition count $sans(p) \( s \)$.
  Multiplying over lines, the logarithms of all carrier factors, partition counts, and choices of local types total

$ O #scale(x: 120%, y: 120%)[\(] n^(1 \/ 2 + 2 epsilon.alt) log \( n + 1 \) +
  n^(3 \/ 4) log \( n + 1 \) #scale(x: 120%, y: 120%)[\)] = O \( n^(1 - xi) \) . $

The same calculation applies to rows. This proves (22), including full columns of holes and empty spin types.
  Every constant is independent of the moment $r$.

===== 1.3.6 An angle estimate from support inverses <an-angle-estimate-from-support-inverses>

Next we need the following angle bound on the type projectors on the spin space at fixed $z$, writing $F =
  F \( alpha \, beta \)$:

#[#set math.equation(numbering: n => "(25)")
 $ parallel P_H P_K P parallel^2 lt.eq min { 1 \, med exp \( F_H + F_K - F + l + O \( n^(1 - xi) \) \) } .
   $ <ten:spin:eq:13>]

To apply Theorem 9, take its occupied board to be the complement of the fixed hole assignment $z$.
  Its global type is $\( alpha \, beta \)$, its column types are the specified $P_H$,
  and its row types are the specified $P_K$. The local carrier product is at most

$ \( n + 1 \)^(\( s + m \) q \( q - 1 \)) = exp \( O \( n^(1 \/ 2 + 2 epsilon.alt) log \( n + 1 \) \) \) . $

This is absorbed by $O \( n^(1 - xi) \)$ because $epsilon.alt = 1 \/ 64$ and $xi lt.eq 1 \/ 32$.
  The theorem’s missing-cell factor is at most $e^l$, with no assumption on the arrangement of the holes.
  Its entropy terms are exactly $F_H \, F_K \, F$. This proves (25).

===== 1.3.7 Combining the two positive traces <combining-the-two-positive-traces>

Using positivity, expansion into pairs of types in (21) bounds each term by

$ parallel P_H P_K P parallel^2 thin "Tr" \( X_z P_H \) "Tr" \( Y_z P_K \) . $

Indeed spectral decompositions of the positive restrictions (also restricting to the global projector) give the
  angle squared as an upper bound for squared scalar products.
  Using (22), its row version, and (25) gains the exponent $- \( 1 - eta' \) F$, since for $w = F_H + F_K$

$ - \( 1 - eta' \) w + min \( 0 \, w - F \) lt.eq - \( 1 - eta' \) F . $

Summing over type choices within our log errors, we obtain

#[#set math.equation(numbering: n => "(26)")
 $ "Tr" \( P X_z Y_z \) & lt.eq product_j \( s \)_(h_j)^(- 1) product_i \( m \)_(b_i)^(- 1)\
 & quad times exp (- \( 1 - eta' \) F + sum_j g_s \( h_j \) + sum_i g_m \( b_i \) + O \( l + n^(1 - xi) \)) .
   $ <ten:spin:eq:14>]

===== 1.3.8 Entropy of the hole assignments <entropy-of-the-hole-assignments>

We detail the count over hole assignments; it is important to keep the entropy terms from $g_s \, g_m$.
  First the falling factorials give a bound $n^(- l) e^(O \( l \))$ for the prefactor (one can use $\( a \)_p
  gt.eq a^p e^(- O \( p \))$ for $p lt.eq a$). Also

#[#set math.equation(numbering: n => "(27)")
 $ sum_j g_s \( h_j \) + sum_i g_m \( b_i \) lt.eq kappa' l log n - sum_j h_j log \( s \/ h_j \) -
   sum_i b_i log \( m \/ b_i \) + O \( n^(1 - xi) \) . $ <ten:spin:eq:15>]

In fact taking a maximum with zero in a column expression can raise it by at most
  $O \( s^(1 - kappa_(-)) log n \)$ since it is only needed at $h_j lt.eq s^(1 - kappa_(-))$;
  use the similar row error. Finally

#[#set math.equation(numbering: n => "(28)")
 $ sum_z n^(- l) exp (- sum_j h_j log \( s \/ h_j \) - sum_i b_i log \( m \/ b_i \)) lt.eq
   exp (- 2 l log \( n \/ l \) + O \( n^(1 - xi) \)) . $ <ten:spin:eq:16>]

Drop distinctness, so normalized counting uses independent column and row assignments with replacement to cells.
  For $l > 0$ the column negative sum exponent is $- l log \( n \/ l \) +
  l D \( h \/ l med parallel med upright("unif")_m \)$ with $D$ the relative entropy of proportions
  ($h = \( h_j \)$). Each possible histogram has probability at most the exponential of minus the divergence term
  $l D$, by the multinomial formula. The row count is analogous and independent,
  and the log numbers of histograms fit the error. More explicitly the normalized sum is at most

$ e^(- 2 l log \( n \/ l \)) binom(l + m - 1, m - 1) binom(l + s - 1, s - 1) . $

The logarithm of the two histogram counts is $O \( \( s + m \) log \( n + 1 \) \)$, within the stated error.
  For $l = 0$ the sum and the histogram product are one. All formulas omit zero-count terms.

Using $D_lambda lt.eq binom(n, l) e^F D_gamma$ by (1), we conclude from (19), (21), (26)–(28) that

#[#set math.equation(numbering: n => "(29)")
 $ log J_n \( lambda \) lt.eq eta' F + kappa' l log n - l log \( n \/ l \) +
   O \( l + n^(1 - xi) \) . $ <ten:spin:eq:17>]

It remains to absorb the error in (29). Put $Delta eta = eta_d - eta'$ and $Delta kappa = kappa_d - kappa'$.
  Both are bounded below by a positive constant times $d^(- 1 \/ 2)$ for large $d$.
  By (18) and the same dimension upper bound, now using $D_gamma lt.eq l !$, we have $F + l log n gt.eq
  c n^(1 - delta)$. The available increment can be divided into two parts:

$ 1 / 2 Delta kappa thin l log n gt.eq c l sqrt(d) \, wide Delta eta F + 1 / 2 Delta kappa thin l log n gt.eq
  c n^(1 - delta) / sqrt(d) . $

The first dominates $O \( l \)$, and the second dominates $O \( n^(1 - xi) \)$ because $delta < xi$.
  This proves the desired bound: replacing $kappa_d l log n -
  l log \( n \/ l \)$ by its maximum with zero only increases the right-hand side.

The order of choices is now explicit. First choose a threshold $d_0$ large enough for every large-size comparison
  above; all its constants are independent of $r$. Next choose one integer $r$ exceeding the sparse threshold and
  all finitely many thresholds from Lemma 4 for $d lt.eq d_0$. Enlarging $r$ decreases all moments.
  Together with the truncation argument, this completes the induction proving (3).

===== 1.3.9 Full-deck amplification <full-deck-amplification>

The every-occurrence estimate is now proved. To turn it into a bound for the whole permutation law,
  we choose a zero-hole occurrence whose entropy is controlled by the irreducible dimension.

#thm([Lemma 1.12.])[
  #emph[There is an absolute $C_0$ such that, for all sufficiently large $n$,
    every $lambda tack.r n$ with at most $n \/ 2$ rows has an occurrence (1) with $l = 0$ and
#[#set math.equation(numbering: n => "(30)")
 $ F \( alpha \, beta \) lt.eq C_0 log D_lambda . $ <ten:spin:eq:4>]

]
] <lem:spin-zero-hole>

#proof[
  Taking any number of top rows as $alpha$ and the remaining diagram as $beta^t$ gives an occurrence by the
    Littlewood–Richardson rule. First split at the Durfee square size $a$.
    Write $x_i$, $1 lt.eq i lt.eq a$, for the top row lengths and $y_j$, $1 lt.eq j lt.eq a$,
    for the column lengths below those rows. The hook product is at most
  $ (product_i x_i ! product_j y_j !) (product_i binom(x_i + a, a) product_j binom(y_j + a, a))
    product_j \( 1 + y_j \/ a \)^a . $
  Indeed, ignoring cells below the top $a$ rows, a top-row hook is at most its horizontal length plus $a$.
    Inside the square the additional bottom column length costs the factor $1 + y_j \/ a$.
    The bottom hooks satisfy the transposed bound. The logarithm of the first binomial product is at most
  $ a sum_i log #scale(x: 120%, y: 120%)[\(] e \( 1 + x_i \/ a \) #scale(x: 120%, y: 120%)[\)] lt.eq
    a^2 log #scale(x: 120%, y: 120%)[\(] e \( 1 + n \/ a^2 \) #scale(x: 120%, y: 120%)[\)] = O \( n \) \, $
  using $a^2 lt.eq n$. The other binomial product has the same bound, and $sum_j a log \( 1 + y_j \/ a \) lt.eq
    sum_j y_j lt.eq n$. The hook formula and factorial estimates therefore give $F \( alpha \, beta \) lt.eq
    log D_lambda + O \( n \)$.
  Put $k = n - lambda_1$. If $k gt.eq n \/ 4$, Lemma 13 absorbs this $O \( n \)$ term.
    If $1 lt.eq k < n \/ 4$, instead apply the Durfee split to the tail $macron(lambda) tack.r
    k$ and include the first row in $alpha$. The resulting entropy is at most
  $ k log \( n \/ k \) + k + log D_(macron(lambda)) + O \( k \) . $
  Here the first two terms bound the entropy of separating the first row from the tail.
    Tableaux of the tail extend to $lambda$, so $D_(macron(lambda)) lt.eq D_lambda$,
    and the first part of Lemma 13 bounds the other terms by $O \( log D_lambda \)$.
    Finally, $k = 0$ gives entropy zero. ◻
]

#proof[
  Choose $macron(eta)$ so that $C_0 macron(eta) < 1 \/ 2$ in (30).
    Taking $l = 0$ with those choices in (3), every nontrivial representation not already annihilated satisfies
  $ parallel B_n parallel_(V_lambda)^(2 r) lt.eq D_lambda^(- 1 \/ 2) $
  for large $n$. Lemma 7 now provides the required Fourier sum.
    After $t = 6 r$ forward sweeps, nonnormality causes no problem:
    $parallel B_n^t parallel_(upright("HS"))^2 lt.eq D_lambda parallel B_n parallel^(2 t)$ in each irreducible.
    Consequently the squared $L^2$ distance of the density from uniform is at most
  $ sum_(lambda eq.not \( n \)) D_lambda^2 parallel B_n \( lambda \) parallel^(12 r) lt.eq
    sum_(lambda eq.not \( n \) \, \( 1^n \)) D_lambda^(- 1) = o \( 1 \) . $
  The sign representation and all shapes with too many rows contribute zero by Lemma 3.
    Translation invariance makes the bound uniform over initial orders.
    Since one sweep is $d$ physical shuffles, $6 r d$ shuffles suffice at total variation $1 \/
    4$ for all sufficiently large $d$. Together with the support obstruction,
    this proves the stated $Theta \( d \)$ mixing consequence. ◻
]

======= 1.3.9.1 Local access to a random permutation. <local-access-to-a-random-permutation.>

The full-deck estimate also gives a short decision-tree description of an approximately uniform permutation.
  A decision forest computes the coordinates of its output by separate adaptive decision trees that query a shared
  random input. This is the permutation-sampling model studied by Alekseev, Göös, Myasnikov, Riazanov,
  and Sokolov #cite(label("AlekseevEtAl2025")) Section 1.

#thm([Corollary 1.13.])[
  (Permutation sampling with logarithmic query depth).  #emph[For $n =
    2^d$ there is a decision forest whose output is always a permutation of $\[ n \]$,
    whose input consists of independent fair bits, and whose coordinate trees have depth $O \( log n \)$,
    such that the output law has total variation distance $o \( 1 \)$ from uniform as $d arrow.r oo$.
    The same conclusion holds with independent uniform $\[ n \]$-valued input cells.]
] <cor:decision-forest>

#proof[
  Use the fixed number $L$ of sweeps in Corollary 2. Assign one input bit to every switch in the resulting $L
    d$ layers, with all coordinate trees using the same assignment.
    To compute the final position of card $i$, follow its path through the layers.
    At each layer the current position determines which switch bit to query,
    and that bit determines the next position. Thus each tree makes $L d$ adaptive queries.
    For every input the switches compose to a permutation; jointly, the outputs have exactly the $L$-sweep law.
    The claimed convergence follows from Corollary 2. For $\[ n \]$-valued input cells,
    use the parity of one independent cell for each switch; it is a fair bit because $n$ is even. ◻
]

For dyadic sizes, this improves the $O \( \( log n \)^2 \)$ shared-cell upper bound recalled
  in #cite(label("AlekseevEtAl2025")) Section 1 to $O \( log n \)$.
  The same depth order holds in the fair-bit model. The depth order is optimal for fair-bit queries at any fixed
  error below one: a binary tree of depth $h$ has at most $2^h$ output values,
  so its marginal is at total variation distance at least $1 - 2^h \/ n$ from uniform on $\[ n \]$.
  This argument concerns bit queries; it does not give the same lower bound for $\[ n \]$-valued cell queries.

== 2 Refinements and alternative mechanisms <part:refinements>

==== 2.1 Common tools for the later moment bounds <s:full-isotypic-section>

The every-occurrence theorem has supplied the full-deck mixing bound.
  We now vary the information retained in a moment estimate.
  Some later bounds optimize over signed factors and marks; others keep prescribed hooks,
  minimize a deletion cost, or pair two diagram budgets. Their optimization domains and moment exponents differ,
  even when they give the same mixing order.

The shared geometric input is a row–column overlap at a fixed placement of distinct marks.
  We first convert the compact-type density comparison to full symmetric-group isotypes.
  Positive-mixture and coefficient-integral formulas support the alternate density arguments;
  the section ends with a marked recurrence at any hook parameter and real Schatten order at least two.
  Each later section checks the local hypotheses and budget inequalities needed to close its own induction.

===== 2.1.1 Guide to the later estimates <s:later-routes>

Write $Q_n = B_n^(*) B_n$ and $\| B_n \| = Q_n^(1 \/ 2)$.
  All traces in this guide are unnormalized; in particular, $"Tr" Q_n^r = "Tr" \| B_n \|^(2 r)$.
  The linked statements give the exact domains and constants.
  Theorem 1 bounds $D_lambda "Tr"_(V_lambda) Q_n^r$ for every prescribed signed occurrence,
  retaining its concatenated entropy and clipped remainder cost.
  The table compares the information retained by later estimates and the arguments that prove them.

#figure(
  [#[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Route
], table.cell(rowspan: 1, colspan: 1)[Retained data and estimate
], table.cell(rowspan: 1, colspan: 1)[Proof mechanism
]),
  table.cell(rowspan: 1, colspan: 1)[Arbitrary-hook recurrence Proposition 22
], table.cell(rowspan: 1, colspan: 1)[Every prescribed hook at any integer $q gt.eq 1$ is allowed.
  The recurrence retains real Schatten order $p gt.eq 2$, the full error, and a penalty for large child dimensions.
], table.cell(rowspan: 1, colspan: 1)[Positive restriction to pointwise stabilizers combines with full
  symmetric-group isotypic overlap. No relation between the hook parameter and the child size is required.
],
  table.cell(rowspan: 1, colspan: 1)[Named objects Proposition 24
], table.cell(rowspan: 1, colspan: 1)[Every prescribed signed occurrence,
  with fixed numerical entropy and clipped remainder coefficients, is bounded at one fixed square moment.
], table.cell(rowspan: 1, colspan: 1)[A direct specialization is followed by an independent crowded-cell and
  coefficient-integral proof.
],
  table.cell(rowspan: 1, colspan: 1)[Lowering and hook entropy (51) and Proposition 26
], table.cell(rowspan: 1, colspan: 1)[The squared operator norm is bounded for every $2 lt.eq k lt.eq n \/ 2$.
  The trace bound minimizes Frobenius entropy plus a clipped remainder cost over permitted hook subdiagrams,
  with bounded real exponents of $\| B_n \|$.
], table.cell(rowspan: 1, colspan: 1)[Ordinary lowering and a pair count give the norm estimate;
  a distinct signed tensor interpolation gives the hook budget.
],
  table.cell(rowspan: 1, colspan: 1)[Minimized tags Proposition 28
], table.cell(rowspan: 1, colspan: 1)[Signed factors and a regular tag block are optimized.
  The budget can be negative and has an allowance; the overlap retains ranks inside local Specht modules.
], table.cell(rowspan: 1, colspan: 1)[Sparse path encounters give the small-defect norm bound.
  Interpolating the covariance and multiplicity bounds retains the local ranks.
],
  table.cell(rowspan: 1, colspan: 1)[Simultaneous bounds Proposition 29
], table.cell(rowspan: 1, colspan: 1)[One fixed integer square moment has both a dimension bound and a marked
  bound for every permitted hook whose marked complement meets the stated density threshold.
], table.cell(rowspan: 1, colspan: 1)[A specialized recurrence also has an independent proof through powers-of-two
  trace inequalities and weight-space overlap. Harmonic-tuple coupling and a dimension gain for shrinking hooks
  close the two assertions together.
],
  table.cell(rowspan: 1, colspan: 1)[Inverse-density budget Proposition 30
], table.cell(rowspan: 1, colspan: 1)[A minimum over permitted hooks retains the unclipped mark-entropy cost at
  large levels, with bounded real Schatten exponents. Sparse levels have a separate bound.
], table.cell(rowspan: 1, colspan: 1)[The marked-grid estimate (Proposition 31) has an ordered-density proof.
  Allowances extend each child estimate to every inherited parent hook before the exponent recursion closes.
],
  table.cell(rowspan: 1, colspan: 1)[Deletion budget Theorem 33
], table.cell(rowspan: 1, colspan: 1)[For every $n = 2^d$ with $d gt.eq 1$ and every partition,
  a clipped minimum over all subdiagrams bounds the dimension-weighted trace,
  with real square-moment orders between one and a fixed finite bound.
], table.cell(rowspan: 1, colspan: 1)[A near-minimizer in a thin hook and signed overlap handle large sizes;
  norm gaps in finitely many blocks supply one base before the exact recursion.
],
  table.cell(rowspan: 1, colspan: 1)[Paired budgets Theorem 34
], table.cell(rowspan: 1, colspan: 1)[For nontrivial diagrams of height at most $n \/ 2$,
  two bounds for the same fixed integer square moment pay, respectively,
  tuple-coordinate losses and long row and column chains with distinct markers.
], table.cell(rowspan: 1, colspan: 1)[Separate tuple and marked tensor estimates are joined by a diagram
  comparison, with an explicit finite base.
],
)
]],
  caption: [Table 1: Later estimates and their proof mechanisms. ],
)

===== 2.1.2 Full symmetric-group isotypes <full-symmetric-group-isotypes>

The conversion from compact types to full symmetric-group isotypes is static and uses no moment estimate.
  Here $V = bb(C)^q xor bb(C)^q$ again has one even and one odd summand, for any integer $q gt.eq 1$.
  A full symmetric-group isotype collects the copies of its Specht module from every compatible compact color
  type. It includes all those multiplicity copies, whereas $Q_(a \, b)$ fixes one compact type.

#thm([Theorem 2.1.])[
  (Signed density domination for a full isotypic projection).  #emph[Let $P_rho$ be the symmetric-group isotypic
    projection of shape $rho tack.r p$ on the signed tensor power $V^(⊗ p)$.
    There is a probability distribution on even densities such that
#[#set math.equation(numbering: n => "(31)")
 $ P_rho prec.curly.eq D_rho B^(10 q^2) bb(E) R^(⊗ p) \, wide B = N + q + 1 \, quad N gt.eq
   p . $ <eq:signed-isotypic-density>]

 If $P_rho = 0$, the assertion is read with any density distribution.]
] <thm:signed-isotypic-density>

#proof[
  Let $cal(A)_rho$ consist of the pairs $\( a \, b \)$ for which $V_rho$ occurs in $cal(M)_(a \, b)$.
    Orthogonal sector decomposition gives $P_rho prec.curly.eq sum_(cal(A)_rho) Q_(a \, b)$.
    Apply Lemma 8 and combine its probability mixtures, with weights proportional to $e^(F \( a \, b \))
    u \( a \, b \)$. Their total coefficient is at most
  $ sum_(cal(A)_rho) e^(F \( a \, b \)) u \( a \, b \) lt.eq D_rho B^(7 q^2) B^(2 q^2) B^(q^2) = D_rho B^(10 q^2) \, $
  by Lemma 11. ◻
]

#thm([Corollary 2.2.])[
  (Full-isotypic angle on a punctured rectangle).  #emph[On the board $W$ of Theorem 9,
    let $P_gamma$ be a full $S_p$-isotypic projection, and let $P_R \,
    P_C$ be products of full symmetric-group isotypic projections on the occupied row and column sites.
    Write their diagrams as $rho_i$ and $sigma_j$, and set $D_R = product_i D_(rho_i)$, $D_C =
    product_j D_(sigma_j)$. With $N = s m$ and $B = N + q + 1$,
#[#set math.equation(numbering: n => "(32)")
 $ parallel P_C P_gamma P_R parallel_(upright("op"))^2 lt.eq min {1 \,
   frac(D_R D_C, D_gamma) B^(10 \( s + m \) q^2) e^l} . $ <eq:signed-isotypic-angle>]

 Empty blocks use the trivial partition and dimension one.
   The conclusion is uniform over the location of the $l$ missing cells.]
] <cor:signed-isotypic-angle>

#proof[
  Repeat the proof of Theorem 9, now using Theorem 16 for each local projector. The only changed global estimate is
  $ parallel T P_gamma parallel_(upright("op")) lt.eq D_gamma^(- 1) $
  for the identical-factor density $T = macron(R)^(⊗ W)$. Indeed $T$ has trace one and commutes with the signed
    permutation action. On the $gamma$ isotypic space it has the form $I_(V_gamma) ⊗ T_gamma$,
    with $T_gamma succ.curly.eq 0$, so $D_gamma parallel T_gamma parallel lt.eq D_gamma "Tr" T_gamma lt.eq 1$.
    The full-group projection commutes with both subgroup projections, and $T$ commutes with all of them.
    The support and missing-cell arguments are otherwise identical.
    Taking adjoints identifies the two displayed orders of projections. ◻
]

#thm([Proposition 2.3.])[
  (One-sided overlap for positive marked factors).  #emph[Let $W$ contain $n -
    t$ occupied cells in an $a$ by $b$ board, $n = a b$. Assume $omega tack.r n -
    t$ and every prescribed row and column type $eta_g$ are $\( q \, q \)$-hook shapes:
    their $\( q + 1 \)$st part is at most $q$. Here $1 lt.eq q lt.eq n$.
    Suppose $X = product_(g upright(" row")) X_g$ and $Y = product_(g upright(" column"))
    Y_g$ are positive group-algebra elements, with each $X_g \, Y_g$ supported on the indicated local type.
    Write $c_g$ for its unnormalized trace on one copy of $V_(eta_g)$ and $S = sum_g log D_(eta_g)$. Then
$ "Tr"_omega \( X Y \) lt.eq #scale(x: 180%, y: 180%)[\(] product_g c_g #scale(x: 180%, y: 180%)[\)] exp {
  C \( a + b + 1 \) q^2 log \( n + 1 \) + t + min \( 0 \, S - log D_omega \) } . $

 The constant is absolute. On the $omega$-isotypic part of the signed tensor power,
   the same bound is multiplied by its multiplicity $w_omega$.]
] <s:one-sided-marked-overlap>

#proof[
  In the signed tensor space the global symmetric-group projector $P_omega$ commutes with $X \, Y$.
    Their local supporting projections are $P_R \, P_C$. Spectral decomposition of their positive compressions gives
  $ "Tr" \( P_omega X Y \) lt.eq parallel P_C P_omega P_R parallel^2 "Tr" X "Tr" Y . $
  Indeed each squared inner product of a row eigenvector and a column eigenvector is bounded by the squared
    overlap, and the sum of their eigenvalue products is the product of the two traces.
    Each local trace is $w_(eta_g) c_g$, with $w_(eta_g) lt.eq \( n + q + 1 \)^(10 q^2)$ by Lemma 11.
    Apply Corollary 17; it bounds the squared overlap by both $1$ and $exp { S - log D_omega + t +
    C \( a + b \) q^2 log \( n + 1 \) }$. Finally $"Tr" \( P_omega X Y \) =
    w_omega "Tr"_omega \( X Y \)$ and $w_omega gt.eq 1$. Taking the smaller bound and absorbing all carrier powers
    proves the claim, including empty lines and the all-hole board. ◻
]

===== 2.1.3 Positive factorizations and missing cells <ten:factorizations>

#thm([Lemma 2.4.])[
  (Positive domination by mixtures).  #emph[Let $A \, B succ.curly.eq 0$ and suppose $A prec.curly.eq c_A integral
    A_x thin d mu \( x \)$ and $B prec.curly.eq c_B integral B_y thin d nu \( y \)$, where $c_A \, c_B gt.eq 0$,
    all integrands are positive, and $mu \, nu$ are probability measures. Then, for every $P$,
$ parallel A^(1 \/ 2) P B^(1 \/ 2) parallel lt.eq sqrt(c_A c_B) sup_(x \, y) parallel A_x^(1 \/ 2) P B_y^(1 \/ 2)
  parallel . $

]
] <ten:positive-mixtures>

#proof[
  Define $F v = \( A_x^(1 \/ 2) v \)_x$ and $G v = \( B_y^(1 \/ 2) v \)_y$.
    Positive domination gives contraction factorizations $A^(1 \/ 2) = sqrt(c_A) U F$ and $B^(1 \/ 2) =
    sqrt(c_B) G^(*) V^(*)$: for the first define $U \( F v \) = A^(1 \/ 2) v \/ sqrt(c_A)$ on the range,
    and use its adjoint for the second. Zero constants give the assertion directly.
    The integral operator $F P G^(*)$ has the displayed one-pair operators as its kernel.
    Its norm is bounded by their supremum by Cauchy–Schwarz and the probability normalizations.
    Multiplication by the two contractions proves the claim. ◻
]

#thm([Lemma 2.5.])[
  (Scalar missing-cell estimate).  #emph[Let $rho_i$ and $sigma_j$ be trace-one positive matrices indexed by $a$
    rows and $b$ columns. Put $macron(rho) = a^(- 1) sum_i rho_i$ and use its inverse on its support.
    For a unitary $U$ set
$ z_(i j) = "Tr" \( macron(rho)^(- 1 \/ 2) rho_i macron(rho)^(- 1 \/ 2) U sigma_j U^(*) \) gt.eq 0 . $

 Then $sum_(i \, j) z_(i j) lt.eq a b$. On any $a b - t$ occupied cells their product is at most $e^t$.]
] <ten:missing-cells>

#proof[
  Summing the normalized row matrices gives $a$ times the support projection of $macron(rho)$.
    Since every $sigma_j$ has trace one, the full sum is at most $a b$.
    Arithmetic–geometric means give $\( a b \/ \( a b - t \) \)^(a b - t) lt.eq e^t$; the empty product is one. ◻
]

===== 2.1.4 Extracting one compact type by matrix coefficients <extracting-one-compact-type-by-matrix-coefficients>

The alternate density arguments below use a global compact-type projection between two products of local
  densities. The following matrix-coefficient formula turns that middle operator into an integral of tensor
  actions, with its carrier dimension explicit.

#thm([Lemma 2.6.])[
  (A coefficient integral for one compact type).  #emph[Let $K$ be a compact group,
    let $rho$ be a finite-dimensional unitary representation on $cal(H)$,
    and let $pi$ be an irreducible unitary representation on $cal(U)$ of dimension $M$.
    Identify the $pi$-isotypic subspace with $cal(U) ⊗ cal(M)$.
    For $A in "End" \( cal(U) \)$, let $tilde(A)$ act there as $A ⊗ I_(cal(M))$ and be zero on all other isotypes.
    With normalized Haar measure,
$ tilde(A) = integral_K f_A \( g \) rho \( g \) thin d g \, wide f_A \( g \) = M "Tr" \( A pi \( g \)^(*) \) \, $

 and
$ integral_K \| f_A \( g \) \| thin d g lt.eq sqrt(M) thin parallel A parallel_(upright("HS")) lt.eq
  M parallel A parallel_(upright("op")) . $

 If the type does not occur, $tilde(A) = 0$ and the same identity holds.]
] <s:compact-coefficient-extraction>

#proof[
  Apply compact matrix-coefficient orthogonality #cite(label("Morel2018")) Theorem IV.3.8(i)–(ii) in an
    orthonormal basis of $cal(U)$. On each copy of $pi$, the integral has matrix $A$;
    on every inequivalent irreducible it is zero. The same orthogonality gives $integral_K \| f_A \|^2 =
    M "Tr" \( A^(*) A \)$. Cauchy–Schwarz for the probability Haar measure and $parallel A
    parallel_(upright("HS")) lt.eq sqrt(M) parallel A parallel_(upright("op"))$ prove the bounds. ◻
]

===== 2.1.5 A marked recurrence with the full error term <s:general-marked-recurrence-section>

The full-isotypic overlap now gives a recurrence for a prescribed marked complement.
  The estimate retains the hook parameter and the real Schatten exponent.
  This is useful when a subdiagram permitted at a parent scale is larger than those permitted in the child
  induction. In particular, no relation between the hook parameter and the child size is imposed.

Let $B_m$ be one coordinate sweep on $m$ positions, for $m$ a power of two, and put

$ H_xi = log D_xi \, wide E_m \( xi \; p \) = log #scale(x: 120%, y: 120%)[\(] D_xi "Tr"_xi \| B_m \|^p
  #scale(x: 120%, y: 120%)[\)] \, wide j_m \( l \) = l log \( m \/ l \) . $

We set $j_m \( 0 \) = 0$, $H_diameter = 0$, and $E_m \( xi \; p \) = - oo$ when the trace vanishes.
  All traces are unnormalized. A partition $eta$ lies in the $q$-hook if $eta_(q + 1) lt.eq q$.
  Thus this definition includes the empty partition.

#thm([Proposition 2.7.])[
  (Marked recurrence at an arbitrary hook parameter).  #emph[Let $n = a b gt.eq 4$, where $a \, b gt.eq
    2$ are powers of two and $\| log_2 a - log_2 b \| lt.eq 1$.
    Arrange the positions as $a$ rows of length $b$, so that $B_n = C R$,
    where $R$ consists of the $a$ independent row sweeps $B_b$ and $C$ consists of the $b$ independent column
    sweeps $B_a$. Let $p gt.eq 2$ be real and let $q gt.eq 1$ be any integer.
    For every $lambda tack.r n$ with positive moment and every $q$-hook subpartition $omega subset.eq lambda$,
    put $t = n - \| omega \|$. Then
#[#set math.equation(numbering: n => "(33)")
 $ E_n \( lambda \; p \) + j_n \( t \) & lt.eq max_(cal(A)) {sum_g #scale(x: 120%, y: 120%)[\(]
   E_(m_g) \( xi_g \; p \) + j_(m_g) \( l_g \) #scale(x: 120%, y: 120%)[\)] - (sum_g H_(eta_g) - H_omega)_(+)}\
 & #h(12mm)  + C [t + \( a + b \) \( q^2 + n^(1 \/ 4) \) log \( n + 1 \)] . $ <s:eq:general-marked-recurrence>]

 Here $g$ ranges over all rows and columns, and $m_g = b$ on a row and $m_g = a$ on a column.
   The set $cal(A)$ consists of choices satisfying
$ 0 lt.eq l_g lt.eq m_g \, wide sum_(g upright(" row")) l_g = sum_(g upright(" column")) l_g = t \, $

$ xi_g tack.r m_g \, quad E_(m_g) \( xi_g \; p \) > - oo \, wide eta_g subset.eq xi_g \, quad \| eta_g \| = m_g -
  l_g \, quad \( eta_g \)_(q + 1) lt.eq q . $

 The set $cal(A)$ is nonempty when the parent moment is positive.
   The constant $C$ is absolute, independent of $p \, q \, a \, b \, lambda \, omega$.]
] <s:general-marked-recurrence>

#proof[
  We can replace $q$ by $Q = min \( q \, n \)$ in the proof:
    every partition of size at most $n$ has the same $q$-hook and $Q$-hook status.
    This permits the use of the signed tensor space with even and odd dimensions $Q$ without imposing an upper
    bound on the stated parameter $q$.
  First compare the parent moment with positive row and column factors. Set
  $ X = \( R R^(*) \)^(p \/ 2) \, wide Y = \( C^(*) C \)^(p \/ 2) . $
  Araki–Lieb–Thirring at exponent $p \/ 2 gt.eq 1$, together with the polar decomposition of $R$, gives
  $ "Tr"_lambda \| C R \|^p lt.eq "Tr"_lambda X Y . $
  This is the only step involving the value of $p$. The two positive operators factor over the rows and the
    columns respectively. Expanding each local factor by its central symmetric-group isotypic projections gives
    positive factors supported on types $xi_g$, with irreducible trace $"Tr"_(xi_g) \| B_(m_g) \|^p$;
    replacing $B_(m_g)$ by its adjoint does not change that trace.
  Fix one such choice of the $xi_g$. Let $V = bb(C)^Q xor bb(C)^Q$,
    with the first summand even and the second odd, and let $Pi_omega$ be the $omega$-isotypic projector on the
    signed tensor power $V^(⊗ \( n - t \))$. Its multiplicity $w_omega$ is positive.
    Add $t$ distinct even marks, each used once. The direct sum over their ordered placements of the spaces
    $Pi_omega V^(⊗ \( n - t \))$ is an $S_n$-module $cal(K)$. More precisely,
  $ cal(K) tilde.equiv "Ind"_(S_(n - t))^(S_n) #scale(x: 120%, y: 120%)[\(] V_omega ⊗ bb(C)^(w_omega)
    #scale(x: 120%, y: 120%)[\)] . $
  Branching shows that $lambda$ occurs with multiplicity $w_omega f^(lambda \/ omega)$.
    Each irreducible trace of $X Y$ is nonnegative because $X \, Y$ are positive. Consequently
  #[#set math.equation(numbering: n => $∗$)
   $ "Tr"_lambda X Y lt.eq frac("Tr"_(cal(K)) X Y, w_omega f^(lambda \/ omega)) . $]
  Insert the ordered-placement projections between $X$ and $Y$ in the numerator.
    Only a common diagonal placement contributes: a row permutation preserves each mark’s row and a column
    permutation preserves its column, so an intermediate placement contributing to a return must agree with the
    initial placement in both coordinates (Figure 1). Fix such a placement $z$, and write $l_g$ for its mark counts.
  On a block of size $m = m_g$, diagonal compression keeps precisely the coefficients of the subgroup fixing the
    $l = l_g$ marked sites pointwise. Coefficient restriction to $S_(m - l)$ preserves positivity,
    by compression of the regular representation to that subgroup. Its regular trace is
  $ frac(D_(xi_g) "Tr"_(xi_g) \| B_m \|^p, \( m \)_l) \, wide \( m \)_l = m \( m - 1 \) dots.h.c \( m - l + 1 \) . $
  Indeed the identity coefficient is unchanged, and the two regular traces multiply that coefficient by $m !$ and
    $\( m - l \) !$ respectively. The restricted element is supported only on $eta_g subset.eq xi_g$:
    if a subgroup type is absent from the restriction of $V_(xi_g)$,
    its central projector annihilates the original element, and coefficient restriction commutes with
    multiplication by subgroup elements. After splitting by these subgroup types,
    the trace of a local positive factor on $V_(eta_g)$ is therefore at most
  #[#set math.equation(numbering: n => $∗∗$)
   $ c_g = frac(exp E_(m_g) \( xi_g \; p \), \( m_g \)_(l_g) D_(eta_g)) . $]
  Only $Q$-hook types occur in the remaining signed tensor factors.
  The one-sided signed-tensor overlap estimate (Proposition 18) applies to these positive local factors.
    With $S = sum_g H_(eta_g)$, it bounds the trace for this placement and these types by
  $ w_omega #scale(x: 180%, y: 180%)[\(] product_g c_g #scale(x: 180%, y: 180%)[\)] exp #h(-0.16667em)
    (C #scale(x: 120%, y: 120%)[\(] \( a + b + 1 \) Q^2 log \( n + 1 \) + t #scale(x: 120%, y: 120%)[\)] + min \(
    0 \, S - H_omega \)) . $
  The placement compression acts in the core permutation algebra,
    so $Pi_omega$ commutes with each compressed factor; this is precisely the projection placement required by
    that overlap estimate. Substituting $\( * * \)$, the logarithm of the last display is at most
  #[#set math.equation(numbering: n => $∗∗∗$)
   $ log w_omega + sum_g E_(m_g) \( xi_g \; p \) - sum_g log \( m_g \)_(l_g) - max \( S \, H_omega \) +
     C #scale(x: 120%, y: 120%)[\(] \( a + b + 1 \) Q^2 log \( n + 1 \) + t #scale(x: 120%, y: 120%)[\)] . $]
  It remains to count the ordered marks. For fixed row and column count vectors,
    an ordered placement determines an assignment of each mark to a row and to a column. Hence its number is at most
  $ frac(t !, product_(g upright(" row")) l_g !) frac(t !, product_(g upright(" column")) l_g !) . $
  There is no additional choice of mark-label allocations. The entropy bound for each multinomial and $\( m \)_l
    gt.eq \( m \/ e \)^l$ show that the logarithm of this number, minus $sum_g log \( m_g \)_(l_g)$, is at most
  $ 2 t log t - sum_g l_g log l_g - t log n + 2 t & = sum_g j_(m_g) \( l_g \) - 2 j_n \( t \) + 2 t . $
  All expressions are interpreted continuously at zero. Finally,
    the number of count and type choices has logarithm at most
  $ C #scale(x: 120%, y: 120%)[\(] a sqrt(b) + b sqrt(a) + a +
    b #scale(x: 120%, y: 120%)[\)] log \( n + 1 \) lt.eq C \( a + b \) n^(1 \/ 4) log \( n + 1 \) . $
  For example, a partition of size at most $m$ is specified by its Durfee square and at most $2
    sqrt(m)$ row and column lengths; the hole count adds one integer.
    This count also covers the preceding total-type expansion.
  By assigning entries of a standard tableau separately to $omega$ and $lambda \/
    omega$ and discarding the boundary inequalities,
  $ D_lambda lt.eq binom(n, t) D_omega f^(lambda \/ omega) \, wide log binom(n, t) lt.eq j_n \( t \) + t . $
  Use these inequalities in $\( * \)$, sum the bounds $\( * * * \)$,
    and add $j_n \( t \)$ to the parent logarithm. The multiplicity $w_omega f^(lambda \/ omega)$ cancels,
    the mark-entropy terms cancel, and the remaining dimension term is
  $ H_omega - max \( S \, H_omega \) = - \( S - H_omega \)_(+) . $
  This proves the recurrence. If every admissible term vanished,
    the positive parent moment would also vanish by these inequalities;
    hence the stated maximum is over a nonempty set. ◻
]

#thm([Corollary 2.8.])[
  (Exact specialization to the inverse-density budget).  #emph[Under the hypotheses of Proposition 22,
    let $0 lt.eq theta lt.eq 1$, let $c$ be real, and let $cal(B)_a \, cal(B)_b gt.eq 0$.
    Suppose that, for $m in { a \, b }$, every $xi tack.r m$ and every $q$-hook $eta subset.eq xi$, with $l =
    m - \| eta \|$, satisfy
#[#set math.equation(numbering: n => "(34)")
 $ E_m \( xi \; p \) lt.eq cal(B)_m + theta H_eta + c thin l log m - j_m \( l \) . $ <s:eq:inverse-child-budget>]

 Then every prescribed $q$-hook $omega subset.eq lambda$, with $t = n - \| omega \|$, satisfies
#[#set math.equation(numbering: n => "(35)")
 $ E_n \( lambda \; p \) & lt.eq theta H_omega + c thin t log n - j_n \( t \) + a cal(B)_b + b cal(B)_a\
 & #h(9mm)  + C [t + \( a + b \) \( q^2 + n^(1 \/ 4) \) log \( n + 1 \)] . $ <s:eq:inverse-budget-specialization>]

 The constant $C$ does not depend on $p \, q \, theta \, c \, cal(B)_a \, cal(B)_b$.]
] <s:inverse-budget-specialization>

#proof[
  For an admissible choice in the recurrence put $S = sum_g H_(eta_g)$.
    The sum of the child allowances is $a cal(B)_b + b cal(B)_a$, and
  $ sum_g l_g log m_g = t log b + t log a = t log n . $
  Thus the expression being maximized is at most
  $ a cal(B)_b + b cal(B)_a + c thin t log n + theta S - \( S - H_omega \)_(+) . $
  For $S \, H_omega gt.eq 0$ and $0 lt.eq theta lt.eq 1$,
  $ theta S - \( S - H_omega \)_(+) lt.eq theta H_omega : $
  if $S lt.eq H_omega$ this is monotonicity; otherwise its left side equals $theta
    H_omega - \( 1 - theta \) \( S - H_omega \)$. Subtract $j_n \( t \)$. ◻
]

In particular, taking $theta = 1 \/ 2$, $c = 1 \/ 100$ and $q lt.eq
  n^(1 \/ 16)$ gives the inverse-grid estimate with its full stated error and its additive child allowances.
  Section 6 also derives this specialization through its ordered density product.

The common recurrence exposes the child-dimension penalty and mark entropy before a budget is chosen.
  It does not by itself supply the sparse estimate or the scale comparison needed to close an induction.
  We begin the later bounds with named objects, whose budget still prescribes a signed occurrence.
  Its direct deduction from the first theorem fixes the scope;
  the rest of that section develops a second proof through crowded cells and coefficient integrals.

==== 2.2 Named objects and signed-spin angles <ten:named>

This section proves a fixed-moment estimate that allows a representation to be described by two signed-spin
  partitions and a set of distinct named positions. The induction keeps the complete dependence on the number of
  names. The negative density term in their budget pays for the number of ways to place them in a rectangle.

Proposition 24 below also follows directly from Theorem 1;
  the short deduction is given immediately after its statement.
  The development in this section supplies a separate proof:
  the signed-spin setup, crowded-cell sparse estimate, and coefficient-integral angle estimate prepare the trace
  induction, which closes the same named-object budget. We retain both routes because the second provides these
  distinct methods.

The notation below is local; the sweep and trace conventions remain those of Section 1.

===== 2.2.1 A budget for named objects <a-budget-for-named-objects>

We use representation theory and a trace induction for a whole sweep of switches. Two features of the induction are:

- For a trace test one can use a mixture of named objects and tensor spins,
  not just the regular representation or just spins. The named objects will have to return to the very same cells
  of a rectangular array. There is an angle saving on the remaining spin space.
- It suffices to propagate bounds which can be quite large,
  but must be small compared with the dimension of an irrep.
  It helps in doing this to give the named objects a budget per object which #strong[decreases] at low density
  (but is clipped at zero).

We use partitions with irreps $\[ lambda \]$, dimensions $D_lambda$,
  and transposed diagrams $lambda^(upright(t))$. For partitions of separate sizes we denote induction from the
  Young subgroup by a product notation such as $mu * xi$, also used with more factors;
  membership denotes occurrence. Transposing all diagrams preserves occurrence.
  Throughout, diagrams of size zero and their representations are allowed.

If $z$ is a list of nonnegative numbers with total $u$, put

$ cal(S) \( z \) = sum_(j : z_j > 0) z_j log \( u \/ z_j \) \; $

we allow empty lists and use zero when the total is zero.
  With two partitions as arguments this takes the concatenated list of row lengths, not the entropy of each separately.

We bound matrices for a single sweep in terms of a spin and named-object budget. Define

#[#set math.equation(numbering: n => "(36)")
 $ W_n \( lambda \) = D_lambda "Tr" \| B_n \( \[ lambda \] \) \|^(2 h) \, $ <ten:named:eq:7>]

where we will choose an absolute integer $h$, possibly very large.
  Here $\| dot.op \|$ takes the operator absolute value.

Fix the numerical budget parameters

$ delta = .00001 \, wide beta_n = .18 - frac(.04, 1 + log n) . $

Write $\[ x \]_(+) = max { 0 \, x }$ and define

#[#set math.equation(numbering: n => "(37)")
 $ R_n \( z \) = z \[ thin delta log n - log \( n \/ z \) - C_0 thin \]_(+) wide \( 0 lt.eq z lt.eq n \) \,
   $ <ten:named:eq:8>]

with $R_n \( 0 \) = 0$ and a sufficiently large absolute $C_0$ to be fixed.

#thm([Proposition 2.9.])[
  (Named-object moment bound).  #emph[For the constants fixed above,
    there are absolute choices of $C_0$ and an integer $h gt.eq 1$ such that, for every dyadic $n gt.eq 2$,
    every $lambda tack.r n$, and every occurrence shown below with $m = \| tau \|$,
#[#set math.equation(numbering: n => "(38)")
 $ lambda med upright("in") med mu * nu^(upright(t)) * tau quad arrow.r.double quad W_n \( lambda \) lt.eq
   exp { beta_n cal(S) \( mu \, nu \) + R_n \( m \) } . $ <ten:named:eq:9>]

]
] <ten:named:main>

#proof[
  #emph[Deduction from the every-occurrence bound.]  The occurrence in (38) is exactly (1) by Frobenius
    reciprocity, and $cal(S) \( mu \, nu \) = F \( mu \, nu \)$.
    Choose $macron(eta) < .14$ in Theorem 1 and then $macron(kappa) lt.eq delta \/ 2$,
    also satisfying that theorem’s parameter restrictions. For $log n gt.eq 2 C_0 \/ delta$,
  $ eta_d lt.eq beta_n \, wide \[ kappa_d log n - log \( n \/ m \) \]_(+)
    lt.eq \[ delta log n - log \( n \/ m \) - C_0 \]_(+) . $
  The inequality also holds at $m = 0$ with the stated conventions.
    Thus the theorem gives the desired result at every sufficiently large dyadic size with $h gt.eq r$.
    The finitely many smaller nontrivial Fourier blocks satisfy a strict norm gap by Lemma 4;
    increasing the fixed $h$ makes their weighted moments at most one.
    The trivial block already has moment one, and the target budget is nonnegative.
    This proves the stated constants and quantifiers. ◻
]

===== 2.2.2 Signed-spin representations <signed-spin-representations>

For the separate proof, we recall the representation facts used below:

- We use the regular representation/Fourier formula (in particular Plancherel),
  Schur-Weyl duality with polynomial $G L$ irreps, the Young branching, Pieri and Littlewood-Richardson rules,
  the hook and Weyl dimension formulas, and unitary Schur orthogonality.
  Recall that if $lambda$ occurs in a two-factor product, it contains each factor’s diagram.
  When a diagram contains another as upper left subdiagram,
  the bigger occurs in the product of the smaller with #emph[some] diagram of the remaining size, by branching.
- We use the polynomial irreps of $G L \( q \)$ also as $U \( q \)$ types.
  Their dimensions, on degrees bounded by $n$, are $exp \( O \( q^2 log \( n + 2 \) \) \)$ when $q lt.eq n$.
  The matrix of a positive diagonal with descending spectrum $y_1 \, dots.h \,
  y_q$ on a type with partition $alpha$ has norm $product_j y_j^(alpha_j)$.
  We can use the Hilbert spaces as in unitary Schur-Weyl duality; this formula follows, for instance,
  by highest weight and dominance of the weights by the highest weight.
  A spectrum including zeros follows by continuity.

Here are two useful descriptions of spin types. Take a space

$ V = bb(C)_(+)^q med xor med bb(C)_(-)^q $

of plus and minus spins, and take $G = U \( q \) times U \( q \)$, acting by its two defining representations.
  Let position permutations act on tensor slots by graded permutations:
  the minus slots incur signs, that is, an interchange of two minus spins has an additional $- 1$.
  This commutes with $G$. On $V^(⊗ u)$, the $G$-types are indexed by pairs $w = \( alpha \, gamma \)$ of
  partitions with at most $q$ parts each, with total size $u$. We use the full isotypic spaces.
  As a module over the symmetric group, the space of such a type consists of copies of $alpha *
  gamma^(upright(t))$, the number of copies being the dimension of the $G$-irrep.
  Indeed, one takes plus and minus counts, uses ordinary Schur-Weyl on both,
  with the sign twist on the latter positions, and induces.

For $u lt.eq n$, any $eta$ in $alpha * gamma^(upright(t))$ satisfies

#[#set math.equation(numbering: n => "(39)")
 $ log D_eta med gt.eq med cal(S) \( alpha \, gamma \) - C q^2 log \( n + 2 \) wide \( q lt.eq n \) .
   $ <ten:named:eq:1>]

Here and in coarse errors, $C$ denotes an absolute constant that may change.
  To see this, one can reach $eta$ from $alpha$ by adding at most $q$ vertical strips (since $gamma^(upright(t))$
  occurs in a product of that many column diagrams). And similarly one can reach $eta^(upright(t))$ from $gamma$.
  In particular $eta$ lives in the $q \, q$ hook, and its long row and column lengths agree with those of
  $alpha \, gamma$ within $O \( q \)$ each. In the dimension formula,
  use at most $O \( q^2 \)$ factors bounded by $2 n$ for the square region,
  and in a row protruding to the right of it bound hook lengths by the remaining row counts (including the current
  box), each increased by $q$; similarly below the square by columns.
  Their factorial products are bounded by the products of row factorials of $alpha$ and of $gamma$,
  times $exp \( C q^2 log \( n + 2 \) \)$. This and the factorial estimate for entropy give (39).
  In the other direction, total dimension of $alpha * gamma^(upright(t))$ is at most
  $exp \( cal(S) \( alpha \, gamma \) \)$, by the dimension formula for induction and the elementary
  factorial-quotient bounds for the two Specht dimensions and for multinomial coefficients.
  Thus multiplicities in a spin type, including $G$-dimensions, cost at most $exp \( C q^2 log \( n + 2 \) \)$.

===== 2.2.3 Sparse path cancellation <sparse-path-cancellation>

We give first a separate lemma for those representations for which an estimate using few cards will suffice.
  Take any fixed $c in \( 0 \, 1 \)$. For all sufficiently large $n$, if $1 lt.eq k = n - lambda_1 lt.eq
  n^(1 - c)$, we have

#[#set math.equation(numbering: n => "(40)")
 $ parallel B_n \( \[ lambda \] \) parallel med lt.eq med exp { - c' k log \( n \/ k \) } $ <ten:named:eq:2>]

with some fixed $c' > 0$. Constants in this lemma can use $c$.

Use the action on $k$-tuples of distinct positions. The irrep occurs here but not with fewer positions,
  by branching. For tuples $x \, y$, for $J subset.eq { 1 \, dots.h \, k }$,
  write $K_J \( x \, y \)$ for $n^(\| J \|)$ times the probability that the sweep takes $x_J$ to $y_J$, and put

$ L \( x \, y \) = sum_J \( - 1 \)^(k - \| J \|) K_J \( x \, y \) . $

For fixed $x_i \, y_i$ a path in the switch network is specified: each refreshed bit has its required final value.
  If one of the paths in $x \, y$ does not even share a switch with any other, $L = 0$.
  Indeed it costs $1 \/ n$ in all the relevant sweep probabilities, with independent switches.
  On the other hand, $L$, as a kernel with multiplier $n^(- k)$ on the distinct tuples,
  gives the action of the sweep on $\[ lambda \]$ after compression to it:
  the proper-subset terms vanish, as their ranges or co-ranges involve fewer entries.
  Thus we will bound the op norm of the matrix $n^(- k) L$. If $k = 1$ the lemma is immediate, so take $k gt.eq 2$.

We use the dyadic cells on starts $x$ in which bits not yet swept are fixed;
  on the end positions $y$ use the corresponding cells for the reverse order.
  Each is a family nested as a binary tree. Put

$ p_(*) = \( k \/ n \)^(1 \/ 10) . $

Call a position in the tuple crowded if it lies in a cell containing at least two of the entries and with entry
  density at least $p_(*)$. A tuple is bad if at least $k \/ 4$ entries are crowded.
  For a noncrowded start entry $i$ there is a useful first-contact bound:

#[#set math.equation(numbering: n => "(41)")
 $ sum_(j = 1)^d 2^(- \( j - 1 \)) \#
   mat(delim: "{", upright("other starts whose bits remaining"); upright("after step ") j
   upright(" agree with entry ") i) med lt.eq med 2 d p_(*) . $ <ten:named:eq:3>]

Indeed a contributing cell has size $2^j$.

Think of $n^(- k) K_J$ in a row as generating paths: actual shuffled paths for the entries in $J$,
  and independent uniform ends (with the corresponding paths) for the others,
  even allowing nondistinct ends until restricting the matrix.
  For any order of inspecting paths, the conditional probability the next path of a noncrowded start will hit any
  earlier paths, meaning share any switch, is bounded by (41). Until its first hit it makes free uniform choices.
  For shuffled cards, the earlier shuffled paths condition only their own visited switches.
  And at layer $j$ a possible hit with any fixed earlier path requires the first $j -
  1$ generated bits to agree with that path at the given switch,
  as well as agreement on the unswept bits other than bit $j$, just as counted in (41).

If $x$ is not bad, the row probability of all vertices of the path contact graph being nonisolated costs
  $exp \( - Omega \( k log \( n \/ k \) \) \)$, uniformly for each $J$.
  For clarity, inspect in an independently random order. Given this graph without isolated vertices,
  at least $3 k \/ 4$ noncrowded starts each have probability at least $1 \/ 2$ of an earlier neighbor,
  so with probability bounded below there are at least $k \/ 8$ such hits.
  In any inspection order, conditional hit bounds and a union bound over choices give probability at most
  $2^k \( 2 d p_(*) \)^(k \/ 8)$ for this many hits. The column statement with the reverse sweep and nonbad $y$ is
  identical. This proves exponentially small absolute row or column sums on these parts of $L$,
  since factors $exp \( O \( k \) \)$ from summing over $J$ are affordable.
  Arbitrary absolute row and column sums are bounded by $2^k$.

We also need a dispersion observation: from any $x$, the absolute mass from each $n^(- k)
  K_J$ to bad #strong[distinct] $y$ is $exp \( - Omega \( k log \( n \/ k \) \) \)$.
  We include the details because the same unfavorable starts cannot just be treated as dispersed.
  For a fixed set $E$ of end positions, occupation counts here satisfy the upper tail bound from independent cards
  with success probability $\| E \| \/ n$, in the sense of the ordinary Chernoff estimate.
  For positive common test factors on end positions we have a product upper bound on expectation by single-card
  expectations. To see this for $J$, work backwards through the layers:
  for tracked entries occupying both inputs of a switch, the product of the two test factors on outputs is at most
  the square of their arithmetic mean. Thus products propagate as upper bounds with the common factor averaged at
  each switch. At the start the single-path propagations are all equal,
  since one sweep sends each start to a uniform end. This gives the needed generating function domination,
  also after including the independent entries outside $J$.

If $y$ is bad, take the maximal witnessing cells (having the density and count conditions).
  They are disjoint; there are $l lt.eq k \/ 2$ of them, with total volume at most $k \/ p_(*)$,
  and at least $max \( k \/ 4 \, 2 l \)$ of the entries in their union. There are at most $binom(2 n, l)$ choices.
  Using the just-proved count bound, the costs for a given $l$ are bounded by

$ binom(2 n, l) (frac(C k, n p_(*)))^(max \( k \/ 4 \, 2 l \)) $

for an absolute $C$. These sum to the claimed dispersion estimate; for example,
  in the combinatorial prefactor the logs are bounded by $l log \( n \/ k \) + O \( k \)$,
  absorbed with room in the other exponent.

Partition $L$ according to bad starts and ends. On the bad-bad block the dispersion estimate is available,
  and on the other blocks we have the nonbad estimates using cancellation of isolated paths.
  The row/column sum bound for operator norm (using the coarse $2^k$ for the opposite estimate if necessary)
  proves (40).

We will also use the zero bound when $lambda$ has more than $n \/ 2$ rows.
  Indeed a layer is the projection averaging a product of pair groups.
  Only diagrams in the product of $n \/ 2$ two-box row diagrams can survive, so this follows from Pieri.

===== 2.2.4 An angle estimate on an incomplete rectangle <an-angle-estimate-on-an-incomplete-rectangle>

We state the form of the estimate to be used in the induction. Consider $n = b s$ slots in $b$ rows, $s$ columns.
  In the application both $b \, s$ are within a factor two of $sqrt(n)$.
  Let $m$ slots be holes, arbitrary but fixed for the estimate, and use $V$ as above on the $u = n -
  m$ remaining slots, with $q lt.eq n$. Take:

+ projections $E \, F$ specifying $G$-type in each row, respectively each column,
  of non-hole slots (each row and column can have its own type),
+ a projection $Q$ to one global $G$-type $\( mu \, nu \)$, with $S = cal(S) \( mu \, nu \)$.

The row and column projections are for actions constant in the respective row or column.
  Write $S_H \, S_K$ for sums of the type entropies in the specification for the rows, columns, respectively. Then

#[#set math.equation(numbering: n => "(42)")
 $ parallel E Q F parallel^2 lt.eq
   min (1 \, med exp { S_H + S_K - S + C m + C \( 1 + b + s \) q^2 log \( n + 2 \) }) . $ <ten:named:eq:4>]

These type spaces and $Q$ do not require coordinates to be arranged contiguously for rows or columns.
  Using graded slot order instead of ordinary order to regroup the factors also respects the type definitions,
  by block-diagonality for plus/minus. In particular $E \, F$ commute with $Q$.

Here is a proof. For a row with $v > 0$ slots after omitting holes and type $w = \( alpha \, gamma \)$,
  take a block-diagonal density matrix $A_i$ on $V$ with block spectra given by $alpha \/ v \, gamma \/ v$.
  Then the projection to the type is bounded above in positive order by

#[#set math.equation(numbering: n => "(43)")
 $ exp { cal(S) \( w \) + C q^2 log \( n + 2 \) } med integral_G \( g A_i g^(*) \)^(⊗ v) thin d g . $ <ten:named:eq:5>]

Here $d g$ is normalized Haar measure. Indeed, on that type the integral is scalar,
  with the scalar given by taking trace on the $G$-irrep and dividing by its dimension.
  The density tensor action has the standard polynomial action and is the same on all copies;
  this holds also for singular densities by continuity. By highest weight this trace is at least
  $exp \( - cal(S) \( w \) \)$, proving (43). Use arbitrary densities on fully holed rows.
  We have the analogous bounds with column densities $A'_j$.

Let $w_i \, w'_j$ be the row and column types, including the trivial type on a fully holed line,
  and choose one sufficiently large absolute $C$ in the local bounds. Put

$ c_i & = exp { cal(S) \( w_i \) + C q^2 log \( n + 2 \) } \,\
d_j & = exp { cal(S) \( w'_j \) + C q^2 log \( n + 2 \) } \,\
c_H & = product_i c_i \,\
c_K & = product_j d_j . $

For a fully holed line the projection and tensor power are scalar one, so the same coefficient,
  which is at least one, is valid. Let $mu_H \, mu_K$ be the products of normalized Haar measures on $G$,
  with one factor per row and column, respectively. For orientation tuples $upright(bold(g)) = \( g_i \)_i$,
  $upright(bold(h)) = \( h_j \)_j$, put

$ R_(upright(bold(g))) & = ⨂_(\( i \, j \) upright(" occupied")) g_i A_i g_i^(*) \,\
C_(upright(bold(h))) & = ⨂_(\( i \, j \) upright(" occupied")) h_j A'_j h_j^(*) . $

The parity-preserving graded regrouping identifies these positive tensors with products of the local row or column
  tensor powers. Tensoring (43) within each family gives

$ E prec.curly.eq c_H integral R_(upright(bold(g))) thin d mu_H \, wide
  F prec.curly.eq c_K integral C_(upright(bold(h))) thin d mu_K . $

Both measures are probabilities, and $c_H = exp { S_H + C b q^2 log \( n + 2 \) }$, $c_K = exp { S_K +
  C s q^2 log \( n + 2 \) }$. Apply Lemma 19 with its positive operators equal to $E \,
  F$ and its middle operator equal to $Q$. Since $E \, F$ are projections, it gives exactly

$ parallel E Q F parallel lt.eq sqrt(c_H c_K) thin sup_(upright(bold(g)) \, upright(bold(h))) parallel
  R_(upright(bold(g)))^(1 \/ 2) Q C_(upright(bold(h)))^(1 \/ 2) parallel . $

The square roots of these tensor products are the tensor products of the individual density square roots.
  Thus, after the displayed factor $sqrt(c_H c_K)$, it suffices to bound

#[#set math.equation(numbering: n => "(44)")
 $ ∥(⨂_(upright("slots")) A_i^(1 \/ 2)) Q (⨂_(upright("slots")) A'_j^(1 \/ 2))∥ $ <ten:named:eq:6>]

uniformly in orientations of the densities, absorbing the $G$-actions into the notation.

Let $M = b^(- 1) sum_i A_i$. Use $Y = \( M + rho I \)^(1 \/ 2)$, $rho > 0$, to flatten on the left in (44).
  On the global type, $Y^(⊗ u)$ has norm at most

$ \( 1 + 2 q rho \)^(u \/ 2) exp \( - S \/ 2 \) . $

This follows from the highest-weight density estimate in Lemma 8, after normalizing $M + rho I$ by its trace $1 +
  2 q rho$. Let $pi$ be the compact carrier representation for $\( mu \, nu \)$.
  The operator $Y^(⊗ u) Q$ acts as $pi \( Y \)$ on that carrier and as the identity on its multiplicity space,
  and is zero on all other types. Lemma 21 therefore gives

$ Y^(⊗ u) Q = integral_G f \( g \) g^(⊗ u) thin d g \, wide
  integral_G \| f \( g \) \| thin d g lt.eq \( dim pi \) \( 1 + 2 q rho \)^(u \/ 2) e^(- S \/ 2) . $

The carrier dimension is at most $exp \( C q^2 log \( n + 2 \) \)$.

Insert $\( Y^(- 1) \)^(⊗ u)$ on the left of that integral to get $Q$.
  We bound the remaining norm in the integrand, on the squared scale, by a product over cells of

$ "tr" #scale(x: 120%, y: 120%)[\(] Y^(- 1) A_i Y^(- 1) thin g A'_j g^(*) #scale(x: 120%, y: 120%)[\)] $

by Hilbert-Schmidt on each cell. On the #strong[full] rectangle these nonnegative quantities sum to at most $n$,
  by flattening and the unit traces on the other side. Thus the product over the $u$ cells is at most
  $\( n \/ u \)^u lt.eq exp \( C m \)$, with empty products harmless.
  This proves the desired bound on (44) by letting $rho$ tend to zero, and gives (42).

===== 2.2.5 The independent trace induction <the-independent-trace-induction>

We now complete the separate proof using the preceding crowded-cell sparse estimate (40),
  the coefficient-integral proof of (42), and a three-regime closure with one fixed $C_0$.

For this proof, fix

$ a = .02 \, wide q_n = floor.l n^a floor.r \, wide c = delta \/ 40 . $

We take (40) available up to $k = n^(1 - c)$. We use constants and asymptotic estimates below independent of $h$.

Proving it for $mu \, nu$ of lengths at most $q_n$ at any sufficiently large $n$ suffices at that size.
  Indeed, if either has more rows, trim each after $q_n$ rows, sending $w_(*)$ boxes in total to the named count.
  By containment and associativity, there is an occurrence with the trimmed $mu \,
  nu$ and some new partition of size $m + w_(*)$. The entropy at the old size $n -
  m$ exceeds the trimmed entropy by at least $w_(*) log q_n$,
  since trimmed row counts were each at most $\( n - m \) \/ q_n$,
  and separating out the trimmed counts only lowers the contribution from the kept counts upon renormalizing the
  latter. On the range in (37), $R_n$ can increase by at most $w_(*) \( delta log n + 1 \)$.
  This proves the sufficiency for large $n$.

We will work with sufficiently large dyadic $n$, assuming (38) for smaller sizes.
  Consequently, all estimates using subproblem sizes are allowed to use #strong[any] lengths for spin partitions
  there. Also, regardless of the right-hand side in (38), in the range of (40) we can make $W_n \( lambda \) lt.eq
  1$ for nontrivial irreps, by taking $h$ large depending on $c$, since $D_lambda lt.eq n^k$.
  And this inequality holds already above height $n \/ 2$. We explain the treatment of finite sizes after the
  induction estimates.

Use $b$ rows of size $s$, with $b \, s$ powers of two and within a factor two of $sqrt(n)$.
  Split a sweep at this scale. We have sweep operators supported on

$ H = \( frak(S)_s \)^b \, wide K = \( frak(S)_b \)^s \, $

using rows and columns, respectively; inside a group each acts by independent smaller sweeps.
  The order will not matter to the estimates. In the product representing $B_n$,
  apply the Araki-Lieb-Thirring trace inequality for positive matrices (at power $h$).
  Thus a trace of singular values to $2 h$ on any representation is bounded above by

#[#set math.equation(numbering: n => "(45)")
 $ "Tr" A_H A_K \, $ <ten:named:eq:10>]

where $A_H \, A_K$ are the corresponding tensor products within $H \,
  K$ of the positive group-algebra elements from the subproblem singular squares taken to $h$ (using $B
  B^(*)$ or $B^(*) B$ as appropriate). In particular, on a factor of size $s$,
  the regular traces by irrep of that positive element are $W_s$.
  Positivity here and below can equivalently be defined by the regular representation.

Fix an occurrence in (38), with lengths now at most $q = q_n$, and write $S = cal(S) \( mu \, nu \)$.
  Use a representation $X$ with $m$ slots taken by #strong[distinct named] objects, one of each name,
  and the other slots carrying $V$ as above with this $q$. Names can be treated as additional plus objects for
  permuting the factors (no sign cost for them). Use the whole Hilbert space allowing the names in any slots and
  order, with each fixed placement carrying $V^(⊗ \( n - m \))$.
  Use $Q$ selecting global type $\( mu \, nu \)$; it fixes placements of names.
  It commutes with the position shuffle. This space with $Q$ contains at least $D_tau$ copies of $\[ lambda \]$.
  This follows from inducing from the name and spin subsets and the description of spin types;
  in particular the names alone carry a regular representation on their slots. And

#[#set math.equation(numbering: n => "(46)")
 $ D_lambda / D_tau lt.eq binom(n, m) exp \( S \) $ <ten:named:eq:11>]

by the dimension upper estimates for induction. It follows from (45) that $W_n \( lambda \)$ is bounded by
  $D_lambda \/ D_tau$ times

$ "Tr"_X Q A_H A_K . $

Here we analyze this last trace, which need not single out $tau$ or $lambda$. Expand in group elements.
  For a contribution with the $m$ names in cells $T$, $\| T \| = m$,
  the product of a row and a column permutation must fix these individual cells, not just setwise.
  Hence each of the two permutations must fix these cells pointwise.
  The trace contribution for $T$ is therefore $m !$ times

#[#set math.equation(numbering: n => "(47)")
 $ "Tr" Q med a_H a_K $ <ten:named:eq:12>]

on the remaining spins. In this expression:

- $a_H$ is given by using in each row only the group-algebra coefficients on the subgroup fixing the named
  positions pointwise, acting by graded permutations on the other spins. Likewise $a_K$ in the columns.
- These give positive operators. Indeed coefficient restriction of a positive element to a subgroup is positive,
  for instance by taking a principal submatrix. Each commutes with global $G$ and hence with $Q$.
  Within its family of rows or columns, each can be treated in tensor product order by using graded regrouping of
  tensor factors. Such regroupings intertwine the position and spin-type descriptions above;
  the graded signs track only the two spin summands, which are preserved by the $G$ actions.
  Thus, for example, its trace estimates on specified types in that family can use ordinary products of the estimates.

===== 2.2.6 Local stabilizer traces <local-stabilizer-traces>

We give the local trace bound needed for (47). In a row, write $r = \| T ∩ upright("row") \|$.
  For the part of its operator on a $G$-type $w_i = \( alpha_i \, gamma_i \)$ on the $s - r$ slots, put $S_i =
  cal(S) \( w_i \)$. Then the trace of this positive part is bounded by

#[#set math.equation(numbering: n => "(48)")
 $ frac(1, \( s \)_r) exp {- \( 1 - beta_s \) S_i + R_s \( r \) + C \( q^2 + sqrt(s) \) log \( n + 2 \)} \,
   $ <ten:named:eq:13>]

where $\( s \)_r = s ! \/ \( s - r \) !$.

For details, consider an $eta$ in $alpha_i * gamma_i^(upright(t))$.
  Its block of the coefficient restriction only gets contributions from Fourier components in size $s$ that extend
  $eta$ upon restricting to $frak(S)_(s - r)$. This follows immediately also by viewing coefficients of Fourier
  components as matrix coefficients and restricting them. Keep just those components in size $s$.
  A diagram extending $eta$ here occurs in $eta * xi$ for some $xi$ on $r$ slots,
  so the induction hypothesis bounds each regular trace from these components by
  $exp \( beta_s S_i + R_s \( r \) \)$. Coefficient restriction changes the total regular trace of the kept
  positive element by the group order ratio $1 \/ \( s \)_r$, using the identity coefficient.
  Consequently this bounds the trace on the $eta$-block after multiplying by $D_eta$,
  and allowing also the number of kept partitions, at most $exp \( C sqrt(s) log \( n + 2 \) \)$.
  But $D_eta$ itself has lower estimate (39), and the multiplicities to be included on the spin representation,
  as well as enumerating its $eta$ here, are absorbed in the displayed error. This proves (48).
  This argument pays only for diagrams #emph[which can go through the type and the $r$ other slots].
  In particular, the small named-object budget in (38) applies here even if $r$ is just a local count and the
  global count is much larger.

Within (47), take a type specification $E$ for the rows and $F$ for the columns as in (42).
  The operators $a_H \, a_K$ break into positive parts according to their own families’ specifications,
  since they commute with the family actions of $G$. Also, $Q$ commutes with the types of either family.
  By (48), the traces of the two corresponding parts are bounded on the exponential scale using

$ - \( 1 - macron(beta) \) \( S_H + S_K \) quad upright("in their product") \, wide macron(beta) =
  max \( beta_s \, beta_b \) \, $

besides the falling factorials, $R$ terms and errors, where $S_H \,
  S_K$ are sums of the $S_i$’s and the analogous column entropies.
  One more factor in bounding (47) is at most $parallel E Q F parallel^2$:
  one can use eigenvectors of the positive parts and insert $Q$ again since the operators commute with it.
  Combining (42) with the traces, we can replace the exponent just shown by

#[#set math.equation(numbering: n => "(49)")
 $ - \( 1 - macron(beta) \) S + C m + C \( 1 + b + s \) q^2 log \( n + 2 \) . $ <ten:named:eq:14>]

Indeed if the sum entropies reach $S$ the trace term suffices,
  and otherwise the squared angle makes up the difference with rate 1.

===== 2.2.7 Counting the named positions <counting-the-named-positions>

All errors here other than $O \( m \)$, and enumerations of the type specifications,
  cost $O \( n^.85 \)$ in the exponent for large $n$. For example (48) is used on $O \( sqrt(n) \)$ fibers,
  and even using the partition count per fiber on this scale is affordable.
  Thus with $r_i = \| T ∩ upright("row ") i \|$ and $t_j = \| T ∩ upright("column ") j \|$, equations (46)–(49) give

#[#set math.equation(numbering: n => "(50)")
 $ W_n \( lambda \) med lt.eq med & binom(n, m) exp { thin accent(beta S, ‾) + C_1 m + C_1 n^.85 thin }\
 &  times
   m ! sum_(T : thin \| T \| = m)
   frac(exp { sum_i R_s \( r_i \) + sum_j R_b \( t_j \) }, product_i \( s \)_(r_i) product_j \( b \)_(t_j)) \,
   $ <ten:named:eq:15>]

with an absolute $C_1$. We emphasize that this constant does not use $C_0$ in (37).
  The elementary falling factorial bounds $\( s \)_r gt.eq s^r exp \( - C r \)$ and $m ! binom(n, m) lt.eq
  n^m$ can be used to treat the last line simply as an expectation over uniform $T$,
  with at most $exp \( C m \)$ extra factor. The $binom(n, m)$ on the first line, which could still be expensive,
  is why we propagate with the particular $R$ in (37).

===== 2.2.8 Closing the budget in three regimes <closing-the-budget-in-three-regimes>

We verify (38) from (50). First suppose

$ m gt.eq n^(1 - delta \/ 4) . $

If $n$ is sufficiently large (permitting dependence on $C_0$), then $delta log s - log \( n \/ m \) - C_0 > 0$,
  and analogously for $b$. Hence for instance

$ R_s \( r_i \) lt.eq r_i (delta log s - log \( n \/ m \) - C_0 + \[ log \( r_i \/ \( m \/ b \) \) \]_(+)) . $

The extra positive-part terms for #strong[both] families together can be paid for in (50) with cost
  $exp \( C m \)$. To see this, compare uniform $T$ with iid cells before requiring distinctness,
  at likelihood cost bounded by $exp \( C m \)$. Row and column counts of these iid cells arise independently.
  The row profile probability is bounded by $exp \( - sum r_i log \( r_i \/ \( m \/ b \) \) \)$,
  and likewise for columns. The negative-log entries discarded in using the positive part cost $O \( m \)$ in each
  family (by $z log \( 1 \/ z \) lt.eq C$ applied to ratios). And enumerating profiles costs $exp \( C m \)$ here.
  Thus the budget terms on the last line cost in the exponent at most

$ m \( delta log n - 2 log \( n \/ m \) - 2 C_0 \) + C m \, $

with constants independent of $C_0$. Using $log binom(n, m) lt.eq m log \( n \/ m \) + m$,
  (50) now fits into (38), including its $R_n \( m \)$, by fixing $C_0$ sufficiently large and taking $n$
  sufficiently large. The size errors $C_1 n^.85$ in this case can be treated just as $O \( m \)$.

Next, if $m < n^(1 - delta \/ 4)$ but $S gt.eq n^(1 - delta \/ 6)$,
  we can use crude cost $O \( m log n \)$ for the budget and binomial terms together.
  All overheads then fit in $\( beta_n - macron(beta) \) S$; the coefficient difference is, in particular,
  at least a constant times $1 \/ \( 1 + log n \)$ for large $n$.

In the remaining case ($m < n^(1 - delta \/ 4)$ and $S < n^(1 - delta \/ 6)$),
  one of the entries of $\( mu \, nu \)$ differs from $n - m$ by $O \( n^(1 - delta \/ 6) \)$, just by entropy.
  Thus because $lambda$ contains both $mu$ and $nu^(upright(t))$, either it is above the height cutoff,
  or its level $n - lambda_1$ is in the sparse range used for (40), for large $n$.
  This gives (38) by the sparse bound in (36) or the zero bound, the trivial irrep also satisfying (38).

This closes the trace induction. To make the choices with fixed $h$ explicit as regards dependencies,
  choose $C_0$ to meet the absolute constant requirements in the verification,
  use the arguments just given (and the trimming observation) above some absolute finite size,
  and take $h$ to meet the requirement for the sparse bound and to give (38) on all needed finite sizes.
  The comparisons above for sufficiently large $n$ can choose their thresholds independently of further increases
  in $h$. For the finite sizes a fixed such $h$ exists: in any nontrivial irrep the sweep has strict contraction.
  Indeed, it is a product of orthogonal projections, and equality in norm would require a common fixed vector.
  The pair interchanges in the coordinate lines generate the symmetric group.
  We include subproblems of one slot as trivial. These choices prove (38) with absolute constants.

===== 2.2.9 Dimension savings and full-deck mixing <dimension-savings-and-full-deck-mixing>

We show why the propagated budget suffices to mix, in particular that it handles shapes with many rows and also
  many columns. Continue to use $c = delta \/ 40$. Small levels and diagrams above the height cutoff are already
  handled. For any remaining diagram $lambda$, take the following occurrence for use in (38):

- take the first up to $q_n$ rows as $mu$;
- below them take the diagram within the first $q_n$ columns, transposed, as $nu$;
- the remaining southeast boxes, number $m$, can be assigned a partition factor on $m$ slots.

More precisely, let $eta$ be the hook portion kept here. We have $eta$ in $mu * nu^(upright(t))$;
  this uses adjoining the diagram $nu^(upright(t))$ under upper rows whose lengths cover its width (or follows
  directly by the Littlewood-Richardson rule). And since $lambda$ contains $eta$,
  some $m$-slot extension suffices. In particular branching and (39) give

$ log D_lambda gt.eq S - C q_n^2 log \( n + 2 \) \, wide S = cal(S) \( mu \, nu \) . $

If $m gt.eq n^(1 - 2 delta)$, we also have $log D_lambda gt.eq \( a \/ 2 \) m log n$ for large $n$.
  Indeed the remaining boxes alone form, upon translation, a diagram of size $m$ with every row and column length
  at most $n \/ q_n$. We have at least its dimension in the tableau count for $lambda$,
  just by filling it after the hook part. The estimate follows by the hook and factorial formulas.

Here at least one of $m \, S$ is $gt.eq n^(1 - 2 delta)$ for large $n$.
  Otherwise we would again be above the height cutoff or in the sparse range (recall that the remaining irreps
  under discussion have level greater than $n^(1 - c)$). Thus $D_lambda$ is at least $exp \( n^.9 \)$ for large
  $n$, and all additive errors in these dimension estimates are harmless.
  Since $R_n \( m \) = 0$ unless $m$ is large enough for the second estimate,
  and $delta$ is tiny compared with $a$, we see that

$ W_n \( lambda \) lt.eq D_lambda^(1 \/ 2) $

on all these remaining diagrams, for sufficiently large $n$.
  In particular the sweep on them has norm at most $D_lambda^(- 1 \/ \( 4 h \))$.

Use now an absolute constant number $L$ of sweeps, repeating in the same order.
  In squared $L^2$ distance of density from uniform on the permutation group, Plancherel uses,
  for each nontrivial irrep, the squared Hilbert-Schmidt norm times $D_lambda$, and thus we can bound by summing

$ D_lambda^2 thin parallel B_n \( \[ lambda \] \) parallel^(2 L) . $

On the large dimensions just treated, this gives $o \( 1 \)$ in total for $L$ sufficiently large,
  even allowing the partition count $exp \( O \( sqrt(n) log \( n + 2 \) \) \)$.
  On the sparse range $1 lt.eq k lt.eq n^(1 - c)$, use (40), $D_lambda lt.eq n^k$,
  and for example $2^(O \( k \))$ partitions per level. This sum also tends to zero for large absolute $L$.
  This proves in particular the required TV upper bound by $O \( d \)$ steps, from every fixed initial order.

==== 2.3 Lowering operators and hook-entropy moments <ten:lowering>

We prove two estimates for the sweep $B_n$, $n = 2^d$. The first uses ordinary tensor lowerings to bound the
  operator norm in terms of the first-row defect $k = n - lambda_1$.
  The second bounds an unnormalized moment using the best hook subdiagram of $lambda$.
  It uses the first estimate at sparse levels, then a separate signed-tensor interpolation at the remaining levels.

===== 2.3.1 The two quantitative bounds <the-two-quantitative-bounds>

#thm([Proposition 2.10.])[
  (A norm bound from lowering).  #emph[There are absolute constants $c > 0$ and $C$ such that,
    for every dyadic $n gt.eq 2$ and every $lambda tack.r n$ with $2 lt.eq k = n - lambda_1 lt.eq n \/ 2$,
#[#set math.equation(numbering: n => "(51)")
 $ parallel B_n parallel_lambda^2 lt.eq exp \( - c k log \( n \/ k \) + C k \) \, wide 2 lt.eq k lt.eq
   n \/ 2 $ <ten:lowering:eq:1>]

 The block with defect one is zero.]
] <s:lowering-norm>

The bound is valid throughout the displayed range; it gives a contraction when $c log \( n \/ k \) > C$.

Here is the second target. Fix

$ beta = 1 / 10 \, wide delta = 10^(- 3) \, wide alpha = 10^(- 6) \, $

with $alpha$ decreased further if needed, and set $q_n = floor.l n^delta floor.r$.
  A $q$-hook diagram has no cell $\( q + 1 \, q + 1 \)$. For a diagram $eta$ of size $N$,
  let $a$ be its Durfee index and use its Frobenius parts

$ a_i = eta_i - i + 1 \, wide b_i = eta'_i - i wide \( 1 lt.eq i lt.eq a \) . $

These parts sum to $N$. Define

$ F \( eta \) = sum_(i : a_i > 0) a_i log \( N \/ a_i \) + sum_(i : b_i > 0) b_i log \( N \/ b_i \) \, wide
  F \( diameter \) = 0 \, $

and the clipped remainder cost

#[#set math.equation(numbering: n => "(52)")
 $ G_n \( t \) = t max { 0 \, alpha log n + log \( t \/ n \) } quad \( 0 < t lt.eq n \) \, wide G_n \( 0 \) =
   0 . $ <ten:lowering:eq:3>]

#thm([Proposition 2.11.])[
  (Hook-entropy moment bound).  #emph[For the fixed constants above, there is a family of real powers $p_n gt.eq
    8$, bounded uniformly over dyadic $n gt.eq 2$, such that every $lambda tack.r n$ satisfies
#[#set math.equation(numbering: n => "(53)")
 $ D_lambda "Tr"_lambda \| B_n \|^(p_n) lt.eq exp L_n \( lambda \) \, wide L_n \( lambda \) = min_(eta subset.eq lambda\
q_n upright("-hook")) { beta F \( eta \) + G_n \( n - \| eta \| \) } . $ <ten:lowering:eq:6>]

]
] <ten:lowering:main>

The minimum includes the empty diagram. Equivalently, the moment is bounded by the cost of every permitted hook
  subdiagram. This quantifier will allow us to use the inherited subdiagram in each child block,
  after shrinking its hook parameter when necessary. The moment proof uses the norm estimate at $k lt.eq
  n^(1 - alpha \/ 16)$. All notation in the rest of this section is local; traces and tensor norms remain unnormalized.

===== 2.3.2 Ordinary tensors and the backward split <ordinary-tensors-and-the-backward-split>

We first prove Proposition 25. Split the sites into two halves of size $m = n \/ 2$.
  The intermediate object will be a probability law on the half excitation counts $l_i$ and half defects $j_i$,
  $i = 0 \, 1$. We will show that $l_0$ is concentrated around $k \/ 2$ and that the loss $k - j_0 -
  j_1$ has a small upper tail. Those two facts will close the norm induction.

The tensors in this part carry the ordinary permutation action.
  The signed color action used for Proposition 26 will be introduced after the norm proof.
  All tensor words are orthonormal, so the norms below are counting norms,
  with no probability normalization depending on the excitation sector.
  For the sweep application fix $n = 2^d$ and $lambda = \( n - k \, xi \)$ with $2 lt.eq k lt.eq n \/ 2$.

Let $q gt.eq 1$ be an integer, let $V = bb(C)^q$, with orthonormal basis $e_1 \, dots.h \, e_q$, and put $cal(A) =
  bb(C) e_0 xor V$. For a finite set $X$ of sites write $cal(H)_X = cal(A)^(⊗ X)$,
  and let $cal(H)_(X \, l)$ be the span of words with exactly $l$ entries in $V$.
  A permutation $g$ of $X$ sends the letter at $x$ to $g \( x \)$. In particular it introduces no signs.
  We use the zero space when $l < 0$ or $l > \| X \|$.

For $c in { 1 \, dots.h \, q }$, let

$ a_(x \, c) = \| e_0 chevron.r chevron.l e_c \|_x \, wide L_(Y \, c) =
  sum_(x in Y) a_(x \, c) quad \( Y subset.eq X \) . $

Thus $L_(X \, c) : cal(H)_(X \, l) arrow.r cal(H)_(X \, l - 1)$.
  Its adjoint for the stated norms is the restriction of $sum_(x in X) \| e_c chevron.r chevron.l
  e_0 \|_x$ in the reverse direction. More generally its half version has source and target

$ L_(Y \, c) : cal(H)_(Y \, l) ⊗ cal(H)_(X \\ Y \, r) arrow.r cal(H)_(Y \, l - 1) ⊗ cal(H)_(X \\ Y \, r) \, $

with adjoint $sum_(x in Y) \| e_c chevron.r chevron.l e_0 \|_x$ in the reverse direction.
  Conjugation gives $rho \( g \) L_(Y \, c) rho \( g \)^(- 1) = L_(g Y \, c)$. All the $a_(x \, c)$ commute:
  on different sites they act on separate factors, while on one site either product of two of them is zero.
  Hence all lowerings just defined commute. The global case is the standard diagonal matrix-unit
  action #cite(label("etingof")) Theorem 4.55.

The norms of these maps are also explicit. On a nonzero displayed sector, so $0 lt.eq r lt.eq \| X \\ Y \|$,
  and for $1 lt.eq l lt.eq \| Y \|$,

$ parallel L_(Y \, c) parallel_(upright("op"))^2 = l \( \| Y \| - l + 1 \) \, $

and the map is zero at $l = 0$. To see this, fix the sites and values of all letters other than $0 \, c$.
  If $h$ sites carry $c$, the remaining map is the incidence matrix from $h$-subsets to $\( h - 1 \)$-subsets.
  It has $h$ ones in each column and $\| Y \| - l + 1$ in each row.
  Cauchy–Schwarz gives squared norm $h \( \| Y \| - l + 1 \)$, attained on constant vectors; maximizing at $h =
  l$ gives the formula. It applies to the global map with $Y = X$ and, when $\| X \| = 2 m$,
  to a half map with $\| Y \| = m$.

Here is the relation to the tuple realization and the multiplicities that will be retained below.
  If $\| X \| = N$, fixing the $l$ excited sites gives the ordinary induced representation

$ cal(H)_(X \, l) tilde.eq "Ind"_(S_(N - l) times S_l)^(S_N) #scale(x: 120%, y: 120%)[\(] upright(bold(1)) ⊗
  V^(⊗ l) #scale(x: 120%, y: 120%)[\)] . $

The direct sum over the excited subsets has its orthogonal tensor norm.
  Ordinary Schur–Weyl duality #cite(label("etingof")) Theorem 4.57 and Corollary 4.59 and the Pieri rule,
  the one-row Littlewood–Richardson case #cite(label("SamSnowden2012")) §2.10, equation (2.10.1),
  give the unitary decomposition

#[#set math.equation(numbering: n => "(54)")
 $ cal(H)_(X \, l) tilde.eq xor.big_(mu tack.r N) V_mu ⊗ cal(M)_(mu \, l) \, wide cal(M)_(mu \, l) =
   xor.big_(tau tack.r l \, med ell \( tau \) lt.eq q\
mu \/ tau upright(" a horizontal strip of size ") N - l) upright(bold(S))_tau \( V \) .
  $ <s:lowering-full-multiplicities>]

Each pair $\( mu \, tau \)$ in this sum has Pieri multiplicity one.
  The full Schur color module $upright(bold(S))_tau \( V \)$ is retained.
  The hook-content formula #cite(label("SamSnowden2012")) §3.6, equation (3.6.1), and §4.3 gives

$ dim upright(bold(S))_tau \( bb(C)^q \) = product_(\( r \, c \) in tau) frac(q + c - r, h_tau \( r \, c \)) . $

Here $h_tau \( r \, c \)$ is the hook length of the indicated cell.
  At $l = 0$ this is trivial induction and the empty partition contributes one copy of the trivial representation;
  at $l = N$ it is identity induction. If $mu = \( N - j \, xi \)$ occurs,
  the horizontal-strip interlacing inequalities give $tau_r gt.eq mu_(r + 1) = xi_r$.
  Consequently $j = \| xi \| lt.eq l$.

For a global defect $k$, take $q = k$. The subspace of $cal(H)_(X \, k)$ in which each of the letters $1 \,
  dots.h \, k$ occurs once is isometric to the counting-norm space on ordered injections:

$ upright(bold(e))_(\( x_1 \, dots.h \, x_k \)) mapsto upright("the word with letter ") c upright(" at ") x_c
  upright(" and ") 0 upright(" elsewhere") . $

This isometry intertwines the position actions. More generally,
  for a set $A$ of distinct excited names let $cal(I)_(X \, A)$ be the sector in which every name in $A$ occurs
  once and no other excited name occurs. For $c in A$, the restriction $L_(X \, c) : cal(I)_(X \, A) arrow.r
  cal(I)_(X \, A \\ { c })$ and its adjoint in the reverse direction act on counting-norm injection coefficients
  exactly as

$ \( L_(X \, c) f \) \( y \) = sum_(z in X \\ y \( A \\ { c } \)) f \( y union { c mapsto z } \) \,
  wide \( L_(X \, c)^(*) g \) \( x \) = g \( x \|_(A \\ { c }) \) . $

Thus the restricted squared norm is $N - \| A \| + 1$, the size of each deletion fiber; if $c in.not A$,
  the restriction is zero. For a fixed assignment of the present names to two halves of size $m$,
  the same formulas hold inside a half, with squared norm $m - l +
  1$ when that half contains $l$ names including $c$. This identifies the operation with raw tuple deletion,
  including its adjoint and its normalization.

In $cal(I)_(X \, \[ k \])$, the shape $lambda = \( N - k \, xi \)$ occurs with the minimum-slot multiplicity
  $f^xi$ from Section 1. It occurs on no sector $cal(H)_(X \, l)$ with $l < k$, also directly by (54).
  Each $L_(X \, c)$ intertwines $S_N$, so it is zero on the entire $lambda$-isotypic subspace of
  $cal(H)_(X \, k)$. This proves the needed global cancellation with the tensor adjoints and norms fixed above.

======= 2.3.2.1 The backward split. <the-backward-split.>

Take $X = bb(F)_2^d$, write $n = \| X \| = 2 m$, and use the last coordinate of the fixed chronological order
  $1 \, dots.h \, d$. Its two halves are $X_0 \, X_1$, and its matching pairs are
  ${ \( p \, 0 \) \, \( p \, 1 \) }$, $p = 1 \, dots.h \, m$.
  Let $P = Pi_d$ be the average of their independent switches.
  The preceding layers act separately in the two halves, and in their original order they give

$ B_n = P C \, wide C = B_(m \, 0) ⊗ B_(m \, 1) \, wide B_n B_n^(*) = P \( C C^(*) \) P . $

The tensor product is the action of the subgroup $S \( X_0 \) times S \( X_1 \)$;
  inside each factor $B_(m \, i)$ has chronological order $1 \, dots.h \, d - 1$.
  For the backward calculation the child operator is therefore $C^(*) = B_(m \, 0)^(*) ⊗ B_(m \, 1)^(*)$.

Fix one of the selected $V_lambda$ copies in the distinct-letter subspace just identified.
  If $parallel B_n parallel_lambda = 0$ there is nothing to prove.
  Otherwise choose a unit top eigenvector $v$ of $B_n B_n^(*)$ in this copy.
  Its eigenvalue is $parallel B_n parallel_lambda^2 > 0$, and the last displayed identity implies

$ P v = v \, wide parallel B_n parallel_lambda^2 = parallel C^(*) v parallel^2 . $

This uses the positive square with the last layer on both outside ends; it preserves the fixed sweep orientation.

To define the component law, let $E_(i \, l)$ be the orthogonal projection onto words with $l$ excitations in
  $X_i$. For $mu tack.r m$ let

$ e_mu^(\( i \)) = frac(D_mu, m !) sum_(g in S \( X_i \)) chi_mu \( g^(- 1) \) thin rho \( g \) $

be the central orthogonal isotypic projection. The four factors in

$ Q_(l_0 \, l_1 \; mu_0 \, mu_1) = E_(0 \, l_0) E_(1 \, l_1) e_(mu_0)^(\( 0 \))
  e_(mu_1)^(\( 1 \)) \|_(cal(H)_(X \, k)) \, wide l_0 + l_1 = k \, $

commute. These are mutually orthogonal projections summing to the identity.
  Their ranges are, up to the unitary decomposition, $V_(mu_0) ⊗ V_(mu_1) ⊗ cal(M)_(mu_0 \, l_0) ⊗
  cal(M)_(mu_1 \, l_1)$, with the entire multiplicity spaces from (54).
  In particular we do not choose one copy, divide by its dimension,
  or assume any distribution on the multiplicity spaces. Define

$ Pr \( l_0 \, l_1 \, mu_0 \, mu_1 \) = parallel Q_(l_0 \, l_1 \; mu_0 \, mu_1) v parallel^2 \, wide j_i =
  m - \( mu_i \)_1 \, wide h_i = l_i - j_i . $

The probabilities sum to one, and $0 lt.eq j_i lt.eq l_i$.
  Since $C^(*)$ preserves every projected range and acts there as $B_m^(*) \|_(V_(mu_0)) ⊗
  B_m^(*) \|_(V_(mu_1))$ tensored with the identity on the full multiplicity space,

#[#set math.equation(numbering: n => "(55)")
 $ parallel B_n parallel_lambda^2 lt.eq bb(E) #h(-0.16667em)
   [parallel B_m parallel_(mu_0)^2 parallel B_m parallel_(mu_1)^2] . $ <s:lowering-backward-recursion>]

Thus this is a spectral weighting from $v$, with no independence assumption on the two shapes.

To use this recurrence, we need two properties of its weights:
  $l_0$ is concentrated around $k \/ 2$, and the loss $k - j_0 - j_1 = h_0 + h_1$ has a small upper tail.
  The matching symmetry proves the first, and the lowering comparison below proves the second.

The marginal law of $l_0$ is the ordinary word-coordinate law:
  summing the isotypic projections gives $Pr \( l_0 = a \) = parallel E_(0 \, a) v parallel^2$.
  Sample a word $w$ with probability $\| chevron.l w \, v chevron.r \|^2$.
  The equality $P v = v$ says that $v$ is fixed by each pair swap,
  so this coordinate law is uniform on each orbit of those swaps.
  If $t$ pairs of $w$ have two excitations, then $k - 2 t$ pairs have one.
  The doubled pairs put one excitation in each half, and the singly occupied pairs have independent fair
  orientations on that orbit. Hence $l_0$ is a mixture of

$ t + "Bin" \( k - 2 t \, 1 \/ 2 \) . $

Conditionally on the orbit, for every real $z$ the centered exponential moment is

$ bb(E) #scale(x: 120%, y: 120%)[\[] e^(z \( l_0 - k \/ 2 \)) divides upright("orbit")
  #scale(x: 120%, y: 120%)[\]] = cosh \( z \/ 2 \)^(k - 2 t) lt.eq e^(k z^2 \/ 8) . $

Here $log cosh r lt.eq r^2 \/ 2$ follows by integrating $\| tanh r \| lt.eq \| r \|$.
  Optimizing Markov’s inequality for either tail gives

#[#set math.equation(numbering: n => "(56)")
 $ Pr \( \| l_0 - k \/ 2 \| gt.eq y \) lt.eq 2 e^(- 2 y^2 \/ k) quad \( y gt.eq 0 \) \, wide
   Pr \( l_0 = 0 upright(" or ") l_0 = k \) lt.eq 2^(1 - k) . $ <s:lowering-split-law>]

======= 2.3.2.2 A positive lowering square. <a-positive-lowering-square.>

We next control $h_i$, the difference between the half excitation count and its first-row defect.
  For this local calculation let $X$ be a set of $m$ sites and put $L_c = L_(X \, c)$.
  Let $P_x^0 \, P_x^(+)$ project onto the base and excited letters at $x$.
  Write $S_(x y) = rho \( \( x y \) \)$, and define

$ Omega_(upright("pos")) = sum_(x < y) S_(x y) \, wide Omega_(upright("col")) = sum_(x < y) P_x^(+) P_y^(+) S_(x y) . $

For the adjoints already fixed, direct multiplication on $cal(H)_(X \, l)$ gives the exact identity

#[#set math.equation(numbering: n => "(57)")
 $ sum_(c = 1)^q L_c^(*) L_c = l I + Omega_(upright("pos")) - binom(m - l, 2) I -
   Omega_(upright("col")) . $ <s:lowering-square>]

Indeed the same-site terms sum to $sum_x P_x^(+) = l I$. For $x <
  y$ the two cross terms $sum_c \( a_(x \, c)^(*) a_(y \, c) + a_(y \, c)^(*) a_(x \, c) \)$ exchange a zero and
  an excited letter and vanish on the other two excitation sectors of the pair.
  The full site exchange is the sum of this mixed exchange, the zero–zero exchange,
  and the excited–excited exchange. The sum of the zero–zero exchanges is $binom(m - l, 2) I$, which proves (57).

Let $c \( rho \) = sum_(\( r \, b \) in rho) \( b - r \)$.
  The transposition content formula #cite(label("VershikOkounkov2005")) Eq. (2.1), Proposition 5.3,
  and Theorem 5.8 makes $Omega_(upright("pos"))$ act by $c \( mu \)$ on $V_mu$.
  On a fixed excited set $T$, the restriction of $Omega_(upright("col"))$ to $V^(⊗ T)$ is precisely the ordinary
  transposition sum on those $l$ tensor factors. It therefore acts by $c \( tau \)$ on the summand indexed by
  $tau$ in (54); this remains true on its induction to all excited sets.
  Thus the exact eigenvalue of (57) on the $\( mu \, tau \)$ summand is

$ l + c \( mu \) - binom(m - l, 2) - c \( tau \) . $

This statement includes the whole color space $upright(bold(S))_tau \( V \)$.

Write $mu = \( m - j \, xi \)$ and $h = l - j$. Pieri gives $tau supset.eq xi$, with $h$ extra boxes.
  The first row and shifted tail of $mu$ give

$ c \( mu \) = binom(m - j, 2) + c \( xi \) - j . $

Add the $h$ boxes of $tau \/ xi$ in any Young-diagram order.
  A box added to a diagram of size $a$ has content at most $a$; therefore

$ c \( tau \) lt.eq c \( xi \) + h j + binom(h, 2) . $

The scalar lower bound simplifies exactly as

$ l + binom(m - j, 2) - j - binom(m - l, 2) - h j - binom(h, 2) = h \( m - l - j + 1 \) . $

Thus we obtain the uniform operator inequality on the whole $mu$-isotypic subspace:

#[#set math.equation(numbering: n => "(58)")
 $ sum_c L_c^(*) L_c succ.curly.eq \( l - j \) \( m - l - j + 1 \) I succ.curly.eq \( l - j \) \( m - 2 l + 1 \)
   I . $ <s:lowering-one-step>]

The first inequality is sharper; the second gives the coarser form $\( m - O \( l \) \) \( l - j \)$.

For the rest of the lowering comparison assume $k \/ m lt.eq 1 \/ 4$.
  For an integer $s gt.eq 1$, define the ordered-letter sum in half $i$ by

$ U_(i \, s) \( v \) = sum_(c_1 \, dots.h \, c_s = 1)^q parallel L_(X_i \, c_s) dots.h.c L_(X_i \, c_1) v parallel^2 . $

Each $L_(X_i \, c)$ intertwines both half position groups.
  After $s$ lowerings it sends the count pair $\( l_i \, l_(1 - i) \)$ to $\( l_i - s \, l_(1 - i) \)$.
  Hence for each fixed ordered letter list, distinct count pairs remain orthogonal,
  and distinct half position types remain orthogonal. Individual color multiplicity vectors can mix;
  they were kept together in $Q$, so no orthogonality among them is used.
  Applying (58) successively to each projected component gives

#[#set math.equation(numbering: n => "(59)")
 $ U_(i \, s) \( v \) gt.eq sum_(l_0 \, l_1 \, mu_0 \, mu_1\
h_i gt.eq s) \( h_i \)_s product_(t = 0)^(s - 1) \( m - l_i - j_i + t + 1 \) thin parallel
  Q_(l_0 \, l_1 \; mu_0 \, mu_1) v parallel^2 \, $ <s:lowering-ordered-lower>]

where $\( h \)_s = h \( h - 1 \) dots.h.c \( h - s + 1 \)$.
  At the $t$-th stage the position type is still $mu_i$, while the count is $l_i - t$;
  these are exactly the two factors from (58). The sum is over ordered choices, so there is no division by $s !$.
  Both $l_i \, j_i lt.eq k$, and every second factor in (59) is at least $m \/ 2$.
  Since $\( h_i \)_s gt.eq s !$ for $h_i gt.eq s$, we obtain

#[#set math.equation(numbering: n => "(60)")
 $ U_(i \, s) \( v \) gt.eq \( m \/ 2 \)^s s ! Pr \( h_i gt.eq s \) . $ <s:lowering-event-lower>]

Thus $U_(i \, s) \( v \) gt.eq \( c_2 m \)^s s ! Pr \( h_i gt.eq s \)$ with $c_2 = 1 \/ 2$.

======= 2.3.2.3 The half-difference and pair count. <the-half-difference-and-pair-count.>

Let

$ G_c = L_(X_0 \, c) + L_(X_1 \, c) \, wide Delta_c = L_(X_0 \, c) - L_(X_1 \, c) =
  sum_(p = 1)^m delta_(p \, c) \, wide delta_(p \, c) = a_(\( p \, 0 \) \, c) - a_(\( p \, 1 \) \, c) . $

All these lowerings commute, and $G_c v = 0$. Expanding $L_(X_0 \, c) = \( G_c + Delta_c \) \/
  2$ or $L_(X_1 \, c) = \( G_c - Delta_c \) \/ 2$, every term containing a $G_c$ vanishes on $v$. Consequently,

#[#set math.equation(numbering: n => "(61)")
 $ L_(X_i \, c_s) dots.h.c L_(X_i \, c_1) v = \( - 1 \)^(i s) 2^(- s) Delta_(c_s) dots.h.c Delta_(c_1) v \, wide
   U_(i \, s) \( v \) = 4^(- s) sum_(c_1 \, dots.h \, c_s) parallel Delta_(c_s) dots.h.c Delta_(c_1) v
   parallel^2 . $ <s:lowering-half-scale>]

We give the pair calculation including repeated letters. For one pair write $sigma$ for its swap and
  $P_(gt.eq 1) \, P_2$ for its projections onto at least one and exactly two excitations.
  On its excitation sectors $0 \, 1 \, 2$, respectively,

$ K_1 := sum_c delta_c^(*) delta_c = 0 xor \( I - sigma \) xor 2 I \, wide K_1 prec.curly.eq 2 P_(gt.eq 1) . $

Moreover

$ delta_b delta_c = - #scale(x: 120%, y: 120%)[\(] a_(\( p \, 0 \) \, b) a_(\( p \, 1 \) \, c) +
  a_(\( p \, 0 \) \, c) a_(\( p \, 1 \) \, b) #scale(x: 120%, y: 120%)[\)] . $

It vanishes off the two-excitation sector. On the full pair space,

$ K_2 := sum_(b \, c) \( delta_b delta_c \)^(*) \( delta_b delta_c \) = 2 \( I + sigma \) P_2 prec.curly.eq 4 P_2 . $

In particular $delta_c^2 = - 2 a_(\( p \, 0 \) \, c) a_(\( p \, 1 \) \, c)$ is included with its correct square.
  Every product of three lowerings in the same pair is zero because one of its two sites must be lowered twice.

Expand an ordered product of $s$ of the sums $Delta_c$. A nonzero term assigns the $s$ ordered positions to a set
  $A$ of pairs used once and a disjoint set $Z$ of pairs used twice.
  Put $a = \| A \|$, $z = \| Z \|$, so $a + 2 z = s$. For fixed $A \, Z$ there are exactly

$ N_(a \, z) = frac(s !, 2^z) $

such assignments; the ordered positions remain distinct even when their letters agree.
  If $T_(f \, upright(bold(c)))$ denotes the product for one assignment $f$, then

$ sigma_p T_(f \, upright(bold(c))) v = \( - 1 \)^(upright(bold(1))_({ p in A })) T_(f \, upright(bold(c))) v . $

Indeed $sigma_p delta_(p \, c) sigma_p = - delta_(p \, c)$, it commutes with the other pair lowerings,
  and $sigma_p v = v$. The pair swaps are commuting self-adjoint unitaries.
  Thus terms with different singleton sets $A$ lie in orthogonal joint eigenspaces.
  For fixed $s$, the size of $A$ also fixes $z$.

Let

$ P_(A \, Z) = product_(p in A) P_(p \, gt.eq 1) product_(p in Z) P_(p \, 2) . $

Summing the ordered letters for one assignment, the disjoint tensor factors and the two local squares above give

$ sum_(upright(bold(c))) parallel T_(f \, upright(bold(c))) v parallel^2 = ⟨v \,
  product_(p in A) K_(1 \, p) product_(p in Z) K_(2 \, p) v⟩ lt.eq 2^a 4^z parallel P_(A \, Z) v parallel^2 =
  2^s parallel P_(A \, Z) v parallel^2 . $

For a fixed $A$ there are $binom(m - a, z)$ choices of $Z$.
  Cauchy–Schwarz over those choices and over their $N_(a \, z)$ assignments costs $binom(m - a, z) N_(a \, z)$;
  after the letter sum, the sum over assignments contributes the second $N_(a \, z)$.
  Using the orthogonality between different $A$’s and then (61), we conclude that

#[#set math.equation(numbering: n => "(62)")
 $ U_(i \, s) \( v \) lt.eq 2^(- s) \( s ! \)^2 sum_(a + 2 z = s) 4^(- z) binom(m - a, z)
   sum_(\| A \| = a \, med \| Z \| = z\
A ∩ Z = diameter) parallel P_(A \, Z) v parallel^2 . $ <s:lowering-pair-upper>]

In this display the inner sum is multiplied by the binomial factor only once;
  it charges interference between the possible double sets $Z$ with the same parity set $A$.

For a word $w$, let $t \( w \)$ be its number of doubly excited pairs and $b \( w \)$ its number of pairs with at
  least one excitation. The total-$k$ condition gives $b \( w \) + t \( w \) = k$.
  All $P_(A \, Z)$ are diagonal word projections, and the number that retain $w$ is $binom(t \( w \), z)
  binom(b \( w \) - z, a)$: choose $Z$ among the doubles, then $A$ among the other occupied pairs. Therefore

$ sum_(\| A \| = a \, med \| Z \| = z\
A ∩ Z = diameter) parallel P_(A \, Z) v parallel^2 = bb(E)_(w tilde.op \| chevron.l w \, v chevron.r \|^2)
  [binom(t \( w \), z) binom(b \( w \) - z, a)] lt.eq frac(k^(a + z), a ! thin z !) . $

We use the value zero for infeasible binomial coefficients.
  The squared half factor $4^(- s)$ has already entered (62).
  Inserting the preceding occupancy bound there and using $binom(m - a, z) lt.eq
  binom(m, z)$ and $2^(- s) 4^(- z) lt.eq 1$ gives the coarser ordered-letter bound with unit coefficient $C_2 = 1$:

$ U_(i \, s) \( v \) lt.eq \( s ! \)^2 sum_(a + 2 z = s) binom(m, z) frac(k^(a + z), a ! thin z !) . $

To obtain the tail estimate, return to the more precise factors in (62). Set $x = k \/ m lt.eq 1 \/ 4$.
  Dividing that bound by (60) and using $binom(m - a, z) lt.eq m^z \/ z !$ gives

$ Pr \( h_i gt.eq s \) lt.eq s ! sum_(a + 2 z = s) frac(x^(a + z), 4^z a ! \( z ! \)^2) lt.eq
  sum_(a + 2 z = s) frac(s !, a ! \( 2 z \) !) x^a \( sqrt(x) \)^(2 z) lt.eq \( x + sqrt(x) \)^s
  lt.eq \( 4 x \)^(s \/ 2) . $

The middle estimate uses $binom(2 z, z) lt.eq 4^z$, and the next sum contains only the even terms of the binomial
  expansion. For $s > k$ the event is empty, so the conclusion holds for every integer $s gt.eq 1$.
  Finally put $u = h_0 + h_1$. If $u gt.eq r$, for any real $r gt.eq 1$, then some $h_i gt.eq
  ceil.l r \/ 2 ceil.r$. Since $4 x lt.eq 1$,

#[#set math.equation(numbering: n => "(63)")
 $ Pr \( u gt.eq r \) lt.eq 2 \( 4 k \/ m \)^(r \/ 4) lt.eq C_1 \( C_1 k \/ m \)^(r \/ 4) \, wide C_1 = 4 \, quad
   r gt.eq 1 . $ <ten:lowering:eq:2>]

All constants are independent of the alphabet, the shape and the multiplicity spaces.
  On the remaining parent range $k \/ m > 1 \/ 4$, the final bound in (63) is automatic,
  since $C_1 \( C_1 k \/ m \)^(r \/ 4) = 4 \( 4 k \/ m \)^(r \/ 4) gt.eq 4$.
  Thus that bound holds throughout $2 lt.eq k lt.eq n \/ 2$.

For completeness, defect $1$ still vanishes exactly. On the one-excitation space each layer averages the indicated
  bit of the position, so their product is the projection onto constant position functions.
  Its orthogonal complement is the position type $\( n - 1 \, 1 \)$, and hence $B_n$ is zero on that type.

===== 2.3.3 Removing prefactor losses <removing-prefactor-losses>

The tail estimate now closes the induction without accumulating a loss at each split. Write

$ W_n \( lambda \) = parallel B_n parallel_lambda^2 \, wide h_(*) = 1 / 20 \, wide c_(upright(s)) = 1 / 64 . $

We will choose an absolute $M_(*) gt.eq 1$ and prove the stronger bound

#[#set math.equation(numbering: n => "(64)")
 $ W_n \( lambda \) lt.eq h_(*) (frac(M_(*) k, n))^(c_(upright(s)) k) wide \( 2 lt.eq k lt.eq n \/ 2 \) .
   $ <s:lowering-margin-invariant>]

This is the potential $V \( n \, k \) = k log \( n \/ k \) - A k +
  B upright(bold(1))_({ k > 0 })$ written with $M_(*) = e^A$ and $h_(*) = e^(- c_(upright(s)) B)$;
  as usual $V \( n \, 0 \) = 0$. The fixed factor $h_(*)$ supplies a margin when both halves retain positive defect.

If $W_n \( lambda \) = 0$, the estimate is immediate; otherwise use the component law above.
  Suppose the proposed right side in (64) is less than one; otherwise contractivity proves the estimate.
  Put $y = k \/ n$ and

$ D = frac(\( l_0 - k \/ 2 \)^2, k) \, wide u = k - j_0 - j_1 \, wide b = \# { i : j_i > 0 } . $

We will choose $M_(*)$ so that this nontrivial case has $y < delta_(*)$, where $0 < delta_(*) lt.eq 1 \/ 8$.
  Then $k < m \/ 4$, so every child defect $j_i gt.eq 2$ lies in the range of the induction hypothesis.
  The trivial child has norm one, and a child with defect one has norm zero.
  For a component with neither child defect equal to one, the product of the two child bounds divided by the
  proposed parent bound is exactly

#[#set math.equation(numbering: n => "(65)")
 $ h_(*)^(b - 1) \( M_(*) y \)^(- c_(upright(s)) u) exp (c_(upright(s)) sum_(i = 0)^1 j_i log \( 2 j_i \/ k \)) \,
   $ <s:lowering-induction-ratio>]

with zero summands at $j_i = 0$.

The exponent in this ratio has a simple uniform bound. Using $log z lt.eq z - 1$ and $j_0 + j_1 = k - u$ gives

$ sum_i j_i log \( 2 j_i \/ k \) & lt.eq frac(2 \( j_0^2 + j_1^2 \), k) - \( k - u \)\
 & = frac(\( j_0 - j_1 \)^2, k) - frac(u \( k - u \), k) lt.eq frac(\( j_0 - j_1 \)^2, k) . $

Since $j_0 - j_1 = \( l_0 - l_1 \) - \( h_0 - h_1 \)$ and $\| h_0 - h_1 \| lt.eq u lt.eq k$,
  the last expression is at most

#[#set math.equation(numbering: n => "(66)")
 $ 8 D + 2 u . $ <s:lowering-induction-cost>]

The split tail in (56) implies $Pr \( D > z \) lt.eq 2 e^(- 2 z)$ for $z gt.eq 0$. Consequently, for $0 lt.eq t < 2$,

$ bb(E) e^(t D) = 1 + t integral_0^oo e^(t z) Pr \( D > z \) thin d z lt.eq 1 + frac(2 t, 2 - t) . $

In particular $bb(E) e^(16 c_(upright(s)) D) lt.eq 9 \/ 7 < 2$.

On the event $u = 0$, the child defects equal their excitation counts.
  If $b = 1$, all excitations lie in one half, so (56) and the exact exponent $sum_i j_i log \( 2 j_i \/ k \) =
  k log 2$ bound this part of the expectation of (65) by

$ 2^(1 - k) 2^(c_(upright(s)) k) lt.eq 2^(2 c_(upright(s)) - 1) < 3 / 5 . $

If $b = 2$, (66) bounds its contribution by $h_(*) bb(E) e^(8 c_(upright(s)) D) lt.eq 2 h_(*) = 1 \/ 10$.

It remains to bound positive loss. Since $M_(*) gt.eq 1$ and $h_(*)^(b - 1) lt.eq h_(*)^(- 1)$,
  Cauchy–Schwarz and (63), in the form $Pr \( u gt.eq r \) lt.eq 4 \( 8 y \)^(r \/ 4)$,
  bound the total contribution from $u gt.eq 1$ by

$ 1 / h_(*) sum_(r gt.eq 1) y^(- c_(upright(s)) r) e^(2 c_(upright(s)) r)
  bb(E) \[ upright(bold(1))_({ u = r }) e^(8 c_(upright(s)) D) \] & lt.eq
  frac(2 sqrt(2), h_(*)) sum_(r gt.eq 1) (e^(2 c_(upright(s))) 8^(1 \/ 8) y^(1 \/ 8 - c_(upright(s))))^r . $

Here $1 \/ 8 - c_(upright(s)) = 7 \/ 64 > 0$. Choose $0 < delta_(*) lt.eq
  1 \/ 8$ so that the last geometric series, with $y$ replaced by $delta_(*)$, is at most $1 \/ 5$. Then choose

$ M_(*) gt.eq delta_(*)^(- 1) h_(*)^(- 1 \/ \( 2 c_(upright(s)) \)) . $

If $y gt.eq delta_(*)$ and $k gt.eq 2$, this choice makes $h_(*) \( M_(*) y \)^(c_(upright(s)) k) gt.eq 1$.
  Thus every nontrivial case indeed has $y < delta_(*)$, as required for the tail estimate and child range.

The three contributions to the ratio are now less than $3 \/ 5 + 1 \/ 10 + 1 \/ 5 = 9 \/ 10$.
  Components with a defect-one child contribute zero. Applying (55) proves the inductive step.
  The range $2 lt.eq k lt.eq n \/ 2$ is empty at $n = 2$, and all cases with a proposed bound at least one were
  already covered by contractivity. Strong induction on $d$ proves (64).
  Dropping $h_(*) < 1$ gives (51) with the absolute choices $c = c_(upright(s)) > 0$ and $C = c_(upright(s)) log M_(*)$.

===== 2.3.4 Signed types and the inherited hook budget <signed-types-and-the-inherited-hook-budget>

We now prove Proposition 26. The norm estimate settles small first-row defects.
  At the other shapes we will split a sweep into a rectangle, weight each local signed type by its entropy,
  and interpolate a trace bound with an operator bound. The following comparisons connect those local types with
  the subdiagrams in $L_n \( lambda \)$.

First, for a $q$-hook diagram $eta$ of size at most $n$,

#[#set math.equation(numbering: n => "(67)")
 $ log D_eta = F \( eta \) + O \( q^2 log \( n + 2 \) \) . $ <s:lowering-frobenius-dimension>]

Here is the hook-formula comparison, including the choice of Frobenius parts.
  Put $A_i = a_i - 1$, $B_i = b_i$, with $r lt.eq q$ the Durfee index. The Frobenius form of the hook formula is

$ D_eta = \| eta \| ! thin
  frac(product_(i < j) \( A_i - A_j \) \( B_i - B_j \), product_i A_i ! B_i ! product_(i \, j) \( A_i + B_j + 1 \)) . $

It follows by splitting the hook product at the Durfee square;
  compare the row form in #cite(label("etingof")) §4.17, formula (5) and Theorem 4.53.
  All the displayed cross and Vandermonde factors are positive integers at most $2 n + 1$,
  and there are $O \( q^2 \)$ of them. Replacing $A_i !$ by $a_i !$ costs another $O \( q log \( n + 2 \) \)$ in
  logarithms. Finally the multinomial logarithm for the parts $a_i \,
  b_i$ differs from their entropy by $O \( q log \( n + 2 \) \)$.
  This proves (67), with the empty shape treated as dimension one and entropy zero.

Use now the signed alphabet with $q$ even and $q$ odd colors from Section 2.
  A compact type is a pair $gamma = \( gamma^(+) \, gamma^(-) \)$;
  write $F_gamma$ for the entropy of its concatenated parts. Lemma 11 gives all the needed conversion facts.
  The occurring permutation types are exactly the $q$-hook shapes,
  their full signed-tensor multiplicities are $exp \( O \( q^2 log \( n + 2 \) \) \)$, and,
  whenever $eta$ occurs with compact type $gamma$,

$ F_gamma - O \( q^2 log \( n + 2 \) \) lt.eq log D_eta lt.eq F_gamma . $

Combining this with (67) yields

$ F_gamma = F \( eta \) + O \( q^2 log \( n + 2 \) \) . $

Thus both the compact carrier and the permutation multiplicities fit the same error,
  and every permitted hook can be realized by at least one compact type.

The parent uses $q_n$ colors, whereas a child moment at size $m$ is stated with the smaller hook parameter $q_m$.
  The next comparison justifies using the larger inherited types in that child estimate.

#thm([Lemma 2.12.])[
  (Passing to an inherited hook).  #emph[Suppose, at a sufficiently large dyadic size $m$,
    positive numbers $E_mu$ satisfy
#[#set math.equation(numbering: n => "(68)")
 $ log E_mu lt.eq beta F \( eta_0 \) + G_m \( m - \| eta_0 \| \) quad
   upright("for every ") q_m upright("-hook ") eta_0 subset.eq mu upright(".") $ <ten:lowering:eq:4>]

 Then every subdiagram $eta subset.eq mu$, of size $m - l$, satisfies
#[#set math.equation(numbering: n => "(69)")
 $ log E_mu lt.eq beta F \( eta \) + G_m \( l \) . $ <ten:lowering:eq:5>]

 The same conclusion is automatic when $E_mu = 0$, with logarithm $- oo$.]
] <s:lowering-inherited-hook>

#proof[
  Intersect $eta$ with the $q_m$-hook, obtaining $eta_0$ by deleting $x$ boxes.
    This removes precisely its Frobenius parts of index greater than $q_m$,
    each of size at most $\| eta \| \/ q_m$. Separating the removed parts from the retained ones gives
  $ F \( eta \) - F \( eta_0 \) gt.eq x \( log q_m - 1 \) . $
  On each interval of differentiability, $G'_m \( t \) lt.eq alpha log m + 1$;
    the function is continuous at its clipping threshold. Hence
  $ beta F \( eta_0 \) + G_m \( l + x \) lt.eq beta F \( eta \) + G_m \( l \) +
    x #scale(x: 120%, y: 120%)[\[] alpha log m + 1 - beta \( log q_m - 1 \) #scale(x: 120%, y: 120%)[\]] . $
  The bracket is nonpositive for all sufficiently large $m$, since $beta delta > alpha$.
    Apply the hypothesis to $eta_0$. ◻
]

===== 2.3.5 The range requiring a moment induction <the-range-requiring-a-moment-induction>

The moment bound (53) holds automatically on the trivial module.
  At any fixed finite collection of sizes, Lemma 4 allows one exponent to make every nontrivial weighted moment at
  most one. We will choose that exponent after fixing the threshold for the large-size argument.

Let us also dispense with some representations. Diagrams of height $> n \/
  2$ don’t survive even one layer (invariants under disjoint switches require dominance over the content with
  $n \/ 2$ twos, by the Young/Pieri rule). For $k lt.eq n^(1 - alpha \/ 16)$ (first row defect),
  (53) at large sizes follows already with an absolute power taken sufficiently large, by (51),
  since $D_lambda lt.eq n^(2 k)$. All constants, even ones depending on our small fixed parameters,
  are meant to be absolute. For remaining shapes write $S = log D_lambda$; we note

$ S gt.tilde n^(1 - alpha \/ 16) . $

Here is one verification. If height and width are both $< n \/ 10$, use the hook bound.
  Otherwise by transposing take a dimension at least $n \/ 10$ as width.
  Below the first row still lie at least $c n^(1 - alpha \/ 16)$ cells (using the height restriction in the
  transposed case). Take a subdiagram consisting of the first row shortened if necessary but still length $floor.l
  n \/ 10 floor.r$, and $l = floor.l c' n^(1 - alpha \/ 16) floor.r$ cells below, $c'$ small.
  It has exponentially many tableaux on scale $l$: for instance fill the first $l$ places of row one,
  then interleave the rest of that row freely with a tableau below. Branching proves the bound.

Moreover on these remaining shapes

#[#set math.equation(numbering: n => "(70)")
 $ L_n \( lambda \) < 1 / 2 S $ <ten:lowering:eq:7>]

at large sizes. Take the intersection with the $q_n$-hook for $eta$. Its dimension is at most $D_lambda$.
  If $t = n - \| eta \|$ is below $n^(1 - alpha \/ 4)$, (70) is immediate.
  Otherwise the $t$ cells cut away themselves give a diagram (after translation) contained in $lambda$,
  of width and height at most $n \/ q_n$, giving $S gt.eq \( delta \/ 2 \) t log n$ by the hook bound. This proves (70).

===== 2.3.6 Weighted interpolation on a rectangle <weighted-interpolation-on-a-rectangle>

For the classical Schatten three-lines interpolation principle used here,
  see the Stein–Hirschman formulation in #cite(label("SutterBertaTomamichel2017")) Section 3.1, Theorem 3.1;
  uniform boundary bounds give the form needed below. The weighted family and its estimates are developed here.

Split the chronological coordinate order into two nearly equal groups.
  The first gives rows of size $m_1$ and the second columns of size $m_2$, where $m_1 m_2 =
  n$ and both sizes are within a factor two of $sqrt(n)$. Write

$ B_n = C R \, $

where $R$ is the product of the independent row sweeps and $C$ the product of the independent column sweeps.
  Take $p = max \( p_(m_1) \, p_(m_2) \)$; the child bounds remain valid at this larger power.

Choose a minimizing hook $eta$ in (53) and put $t = n - \| eta \|$.
  Let $V = E xor O$ have $q = q_n$ even and $q$ odd colors, and let $H$ be the even space with basis $h_1 \,
  dots.h \, h_t$. The compact group $G_q$ acts on $V$ and trivially on $H$.
  Let $W subset.eq \( V xor H \)^(⊗ n)$ be the span of words in which each marker $h_a$ appears exactly once.
  Choose a global compact type $Gamma$ that occurs with permutation shape $eta$ on the $n - t$ unmarked sites,
  and let $P = P_Gamma$. In $P W$, the target shape $lambda$ occurs with multiplicity at least
  $f^(lambda \/ eta)$, by branching with the distinct markers. In particular $P$ reduces both $R$ and $C$.

The positive operators needed at the middle of this product are

$ A = \( R R^(*) \)^(1 \/ 2) \, wide B = \( C^(*) C \)^(1 \/ 2) . $

To see their orientation explicitly, extend polar partial isometries to unitaries within each irreducible block of
  the corresponding subgroup algebra. Then $R = A U_R$, $C = U_C B$, and $C R = U_C B A U_R$.
  These unitaries commute with $P$, so the sweep restricted to $P W$ has Schatten $p$ norm $parallel B P A
  parallel_p$. This remains true when either sweep has a kernel.

For a local block $X$ of size $m$, let $Q_(X \, gamma)$ be its full $G_q$-isotypic projection on
  $\( V xor H \)^(⊗ X)$, where $gamma = \( gamma^(+) \, gamma^(-) \)$ has total size at most $m$ and each
  partition has at most $q$ parts. The total size of $gamma$ is the number of clean letters.
  This projection includes every compatible marker word and every placement of its letters. Define

$ F_X = sum_gamma F_gamma Q_(X \, gamma) \, wide F_A = sum_(X upright(" row")) F_X \, wide F_B =
  sum_(X upright(" column")) F_X \, $

and restrict the resulting operators to $W$. Each local sweep preserves marker contents and commutes with the
  color action. Thus $F_A \, F_B$ commute with their own positive operators $A \, B$, respectively,
  and both commute with the global compact-type projection $P$.
  We interpolate a trace boundary carrying weights $sigma^(p \/ 2)
  e^(\( 1 - beta \) F_gamma \/ 2)$ with an operator boundary carrying weights
  $e^(- \( 1 - beta \) F_gamma \/ \( p - 2 \))$. Here $sigma$ is the local singular value operator,
  with the orientation just specified.

For $p > 2$ put

$ h \( z \) = \( 1 - beta \) (z / 2 - frac(1 - z, p - 2)) \, wide cal(Z) \( z \) =
  B^(p z \/ 2) e^(h \( z \) F_B) P e^(h \( z \) F_A) A^(p z \/ 2) . $

At $theta.alt = 2 \/ p$ one has $h \( theta.alt \) = 0$ and $cal(Z) \( theta.alt \) = B P A$.
  On both boundaries the imaginary powers lie on the outside and have norm at most one.
  Zero singular spaces stay zero throughout. Schatten interpolation from the operator norm to the Hilbert–Schmidt
  norm gives

#[#set math.equation(numbering: n => "(71)")
 $ parallel B P A parallel_p^p lt.eq parallel cal(Z) \( 1 \) parallel_2^2 parallel cal(Z) \( 0 \)
   parallel_oo^(p - 2) . $ <s:lowering-weighted-strip>]

We will choose $p$ large enough that $2 \( 1 - beta \) \/ \( p - 2 \) lt.eq 1$.

===== 2.3.7 Positive compression at marked sites <positive-compression-at-marked-sites>

We first bound the Hilbert–Schmidt norm squared. We may discard $P_Gamma$, by global equivariance,
  and are bounding the trace of the product of the two squared-weight operators.
  Terms in this trace must have identical hole positions between the two matrices:
  each hole must stay in its row and in its column. At a fixed ordered marker placement,
  $Q_(X \, gamma)$ restricts to the clean compact-type projection, with the same entropy weight $F_gamma$.
  The following local estimate is what we need. If a block holds $l$ holes,
  the trace over remaining clean letters, on diagonal compression fixing the positions of these holes,
  of the positive squared-weight operator in the block (all types) is at most

#[#set math.equation(numbering: n => "(72)")
 $ \( m \)_l^(- 1) exp { G_m \( l \) + O \( q^2 log \( n + 2 \) + sqrt(m) \) } \, $ <ten:lowering:eq:8>]

where falling factorials are used.

To see this, decompose the local singular power by permutation shapes $mu$ at size $m$.
  For a positive matrix coefficient operator supported on $mu$, with matrix there $T gt.eq 0$,
  the diagonal compression just uses its convolution coefficients restricted to the subgroup on $m - l$ positions.
  Signs from the tensor convention are harmless or are absorbed by putting the hole positions last (signed tensor
  reordering). In Fourier terms, on a shape $eta'$ of this subgroup the result of restriction of coefficients is
  positive, of trace at most

$ frac(D_mu "Tr" T, \( m \)_l D_(eta')) \, $

and requires $eta' subset mu$. Indeed restriction with normalized convolution scaling takes the partial trace on
  the multiplicity factor of the $eta'$ part of $T$, with exactly the displayed dimension and factorial factor,
  by Schur orthogonality. Apply this in the clean module, using $T = sigma^p \|_mu$,
  and take trace on a given clean type, multiplying by its squared color weight factor at this boundary.
  Now (69), the induction, and the entropy and dimension approximations $F \( eta' \) = F_gamma +
  O \( q^2 log \( n + 2 \) \) \, med log D_(eta') = F_gamma + O \( q^2 log \( n + 2 \) \)$,
  pay the entire color weight. Summing types and $mu$’s with their possible clean multiplicities gives (72);
  we have used the standard $exp \( O \( sqrt(m) \) \)$ partition-number bound.
  For disjoint local blocks we can multiply the bounds. More explicitly in signed tensor space,
  one reorders sites to group blocks to see the tensor product,
  and on fixed hole positions the reordered positive operators have the same trace.
  For the row diagonal compression and column diagonal compression,
  bound trace of their product by product of their traces.

Write

$ E = n^(3 \/ 4) log^2 \( n + 2 \) + n^(1 \/ 2 + 2 delta) log^2 \( n + 2 \) . $

A uniform bound for the log of this boundary Hilbert–Schmidt norm squared is

#[#set math.equation(numbering: n => "(73)")
 $ t \( alpha log n - 2 log \( n \/ t \) \) + O #scale(x: 120%, y: 120%)[\(] t + E +
   n^(1 - alpha \/ 3) log \( n + 2 \) #scale(x: 120%, y: 120%)[\)] \, $ <ten:lowering:eq:9>]

with the main term zero for $t = 0$. We detail summation.
  Replace falling factorial reciprocals by $m^(- l)$ costing $O \( t \)$ in the log per side.
  The number of placed distinct holes is at most $n^t$, canceling the $m$-powers,
  so average the remaining exponential over $t$ uniform distinct sites.
  In $G_m \( l \)$ we can remove the truncation: total error is $O \( n^(1 - alpha \/ 3) log \( n + 2 \) \)$,
  using $m asymp sqrt(n)$ and that discrepancies occur only at $l lt.eq m^(1 - alpha)$.
  Let $x \, y$ be empirical row and column proportions of the hole sites.
  The sum of the log terms is then the main term in (73), plus $t$ times the two relative entropies of $x \,
  y$ versus uniform. The latter exponential factors cost only $O \( t + E \)$ in the log.
  Indeed replacing distinct sampling by independent samples costs at most $e^(O \( t \))$,
  and the two marginal histograms are then independent with probability for given histograms bounded by the
  inverse entropy factors; there are at most $\( t + 1 \)^(m_1 + m_2)$ choices.
  This proves (73), the $E$ term also counting all the local errors.

===== 2.3.8 Density normalization at the operator boundary <density-normalization-at-the-operator-boundary>

For the operator boundary we explain a whitening estimate.
  It will give, in logs #emph[after raising to $p - 2$], at most

#[#set math.equation(numbering: n => "(74)")
 $ - \( 1 - beta \) F_Gamma + O \( t + E \) . $ <ten:lowering:eq:10>]

It suffices to work at magnitude weights $e^(- F_gamma \/ 2)$,
  then steepness can be reduced to $\( 1 - beta \) \/ \( p - 2 \) lt.eq 1 \/ 2$,
  by operator-norm interpolation between these weights and identity bounds, scaling the log estimate.
  Outside supported projections may only decrease the bound. Aim then for log norm $- F_Gamma \/ 2 + O \( t + E \)$.

We first construct one positive mixture for the entire local weight $e^(- F_X)$. Fix a clean type $gamma$ and write

$ s = \| gamma^(+) \| + \| gamma^(-) \| \, wide cal(U)_gamma = cal(U)_(gamma^(+)) ⊗ cal(U)_(gamma^(-)) \, wide
  u_gamma = dim cal(U)_gamma . $

For $s > 0$, take the even density $D_gamma$ on $V$ with eigenvalues $gamma_i^(+) \/ s$ on $E$ and $gamma_j^(-) \/
  s$ on $O$, padded by zeroes. For $s = 0$ choose any even density. For $g in G_q$ put

$ hat(D)_(gamma \, g) = \( g D_gamma g^(*) \) xor I_H . $

Only the clean restriction has trace one; each marker has eigenvalue one.

Here is why this single choice controls every marker fiber with type $gamma$.
  Fix the clean positions and the letters at all other positions.
  Reordering the clean factors gives the decomposition $cal(M)_gamma ⊗ cal(U)_gamma$ of (8).
  On this space $\( D_gamma xor I_H \)^(⊗ X)$ acts as $I_(cal(M)_gamma) ⊗ pi_gamma \( D_gamma \)$,
  where $pi_gamma$ is the polynomial color action. Summing these orthogonal spaces over clean positions and marker
  words only enlarges the multiplicity factor. Denote this full multiplicity space by $cal(N)_(X \, gamma)$.
  On the whole $Q_(X \, gamma)$ range the action is

$ I_(cal(N)_(X \, gamma)) ⊗ pi_gamma \( D_gamma \) . $

Thus Haar averaging is the same scalar on every copy of $cal(U)_gamma$,
  independently of marker labels and placements. Lemma 8 identifies that scalar as at least $e^(- F_gamma) \/
  u_gamma$. The average preserves every compact type and is positive there, so on the full local tensor space

$ e^(- F_gamma) Q_(X \, gamma) prec.curly.eq u_gamma integral_(G_q) hat(D)_(gamma \, g)^(⊗ X) thin d g . $

The same assertion includes the empty clean type: its carrier is one-dimensional and all its factors are markers.

We can now add these inequalities over clean types. There are at most $\( m + 1 \)^(2 q)$ pairs of partitions of
  total size at most $m$, and $u_gamma lt.eq \( m + 1 \)^(q \( q - 1 \))$. Consequently

$ e^(- F_X) prec.curly.eq sum_gamma u_gamma integral_(G_q) hat(D)_(gamma \, g)^(⊗ X) thin d g \, wide c_X :=
  sum_gamma u_gamma lt.eq \( m + 1 \)^(q^2 + q) . $

This sum charges each clean type once, with all its marker fibers already included in $Q_(X \, gamma)$.
  Tensor these positive inequalities over the rows or the columns.
  Every factor preserves the sector $W$, so restriction to $W$ gives positive mixtures dominating $e^(- F_A)$ and
  $e^(- F_B)$. After dividing by their masses, the index measures are probabilities, and the two masses satisfy

$ log c_A + log c_B lt.eq \( q^2 + q \) \( m_1 + m_2 \) log \( n + 2 \) . $

Apply Lemma 19 to these two entropy weights, with middle operator $P_Gamma$.
  It bounds $parallel e^(- F_B \/ 2) P_Gamma e^(- F_A \/ 2) parallel$ by $sqrt(c_A c_B)$ times the supremum of

$ parallel T_(upright("col"))^(1 \/ 2) P_Gamma T_(upright("row"))^(1 \/ 2) parallel \, $

where $T_(upright("col"))$ and $T_(upright("row"))$ are sitewise tensor products of extended densities,
  one clean density for each column or row, repeated along that line.
  This comparison acts on arbitrary vectors in $W$. Its logarithmic mass cost is
  $O \( q^2 \( m_1 + m_2 \) log \( n + 2 \) \)$.

For one pair of mixture terms, write $R_i$ for its clean row densities and $C_j$ for its clean column densities.
  Put $Z = m_2^(- 1) sum_(i = 1)^(m_2) R_i$, a positive trace-one matrix on $V$.
  Use inverse powers on its support, and extend all powers by identity on $H$. In the middle write

$ P_Gamma = \( P_Gamma \( Z^(1 \/ 2) \)^(⊗ n) \) \( Z^(- 1 \/ 2) \)^(⊗ n) $

on the support needed when applied to the row product. The same identity-on-multiplicity decomposition applies to
  the global type $Gamma$, with $n - t$ clean letters. Its first factor therefore has norm at most
  $e^(- F_Gamma \/ 2)$ by Lemma 8. Apply Lemma 21 to the carrier matrix $A = pi_Gamma \( Z^(1 \/ 2) \)$.
  The factor $P_Gamma \( Z^(1 \/ 2) \)^(⊗ n)$, zero on all other compact types,
  is an integral of global color actions with absolute coefficient integral at most

$ \( dim pi_Gamma \) e^(- F_Gamma \/ 2) lt.eq e^(- F_Gamma \/ 2) exp \( O \( q^2 log \( n + 2 \) \) \) . $

The extended densities, the global color actions and $P_Gamma$ preserve each ordered marker placement.
  Their product is therefore an orthogonal direct sum over placements,
  and its operator norm is the supremum of the norms on those summands.
  On clean sites we need the tensor over occupied cells (non-hole sites) of

$ C_j^(1 \/ 2) thin U Z^(- 1 \/ 2) thin R_i^(1 \/ 2) $

with $U in G_q$. The sum over all $n$ cells of their squared Frobenius norms is at most $n$:
  summing the whitened row factors gives $m_2$ times the support projection of $Z$, and each $C_j$ has trace one.
  Lemma 20 therefore bounds the product of the one-cell norms on any $n - t$ occupied cells by $e^(t \/ 2)$.
  The empty product is one when all sites are holes. This bound is uniform over marker placements,
  so taking their supremum adds no factor. Together with the mixture masses and the global carrier factor, it proves

$ log parallel e^(- F_B \/ 2) P_Gamma e^(- F_A \/ 2) parallel lt.eq - F_Gamma \/ 2 + O \( t + E \) . $

To obtain the precise operator boundary, interpolate $e^(- z F_B \/ 2) P_Gamma
  e^(- z F_A \/ 2)$ between this estimate and the norm-one boundary at $Re z = 0$.
  At $theta.alt = 2 \( 1 - beta \) \/ \( p - 2 \) lt.eq 1$ the result is

$ log parallel cal(Z) \( 0 \) parallel lt.eq frac(- \( 1 - beta \) F_Gamma + O \( t + E \), p - 2) . $

Raising to the power $p - 2$ in (71) therefore gives (74) with an error constant independent of $p$.
  This order of interpolation permits the finite-base power to be chosen after all size thresholds.

===== 2.3.9 Closing the moment induction <closing-the-moment-induction>

Putting together (73), (74) and interpolation, and using multiplicity at least $f^(lambda \/ eta)$, we obtain

#[#set math.equation(numbering: n => "(75)")
 $ log \( D_lambda "Tr"_lambda \| B_n \|^p \) lt.eq  & log \( D_lambda \/ f^(lambda \/ eta) \) - \( 1 - beta \) F_Gamma\
 & + t \( alpha log n - 2 log \( n \/ t \) \) + O \( t + E + n^(1 - alpha \/ 3) log \( n + 2 \) \) .
   $ <ten:lowering:eq:11>]

We address a dimension detail here: $D_lambda$ compared to $D_eta
  f^(lambda \/ eta)$ need not be estimated by counting orderings through $eta$ alone without any loss.
  We need an upper bound at cost $binom(n, t)$ times at most exponential in $t$. In fact

$ D_lambda lt.eq binom(n, t) D_eta f^(lambda \/ eta) . $

A standard tableau determines the subset of its entries in $eta$,
  their ordering there and the ordering on the skew complement, proving exactly this bound. Hence (75) gives

#[#set math.equation(numbering: n => "(76)")
 $ log \( D_lambda "Tr"_lambda \| B_n \|^p \) lt.eq L_n \( lambda \) +
   O \( t + E + n^(1 - alpha \/ 3) log \( n + 2 \) \) . $ <ten:lowering:eq:12>]

It was relevant both to transfer the clean dimension through the middle and to have the negative log-sparsity term
  in (52), so that two contributions at subsizes can accommodate this binomial cost.

Write the error in (76) as $epsilon_n$. For the remaining shapes,

$ epsilon_n lt.eq K frac(S, log n) \, wide S = log D_lambda \, $

with $K$ independent of $p$. To see this for its $O \( t \)$ term,
  if $t < n^(1 - alpha \/ 8)$ use $S gt.tilde n^(1 - alpha \/ 16)$. Otherwise the minimizing cost contains

$ G_n \( t \) gt.eq frac(7 alpha, 8) t log n \, wide G_n \( t \) lt.eq L_n \( lambda \) < S \/ 2 \, $

so $t lt.eq 4 S \/ \( 7 alpha log n \)$. The terms $E + n^(1 - alpha \/ 3)
  log \( n + 2 \)$ are $o \( S \/ log n \)$ in both cases.

Take a size threshold above which $K \/ log n lt.eq 1 \/ 4$.
  Equation (76) and $L_n \( lambda \) < S \/ 2$ imply, for each singular value $s$ of $B_n \|_(V_lambda)$,

$ s^p lt.eq "Tr"_lambda \| B_n \|^p lt.eq exp { L_n \( lambda \) + epsilon_n - S } lt.eq e^(- S \/ 4) . $

Consequently, for $A gt.eq 4 K$,

$ log #h(-0.16667em) (D_lambda "Tr"_lambda \| B_n \|^(p \( 1 + A \/ log n \))) lt.eq L_n \( lambda \) +
  epsilon_n - frac(A S, 4 log n) lt.eq L_n \( lambda \) . $

This is the exponent increase needed for the parent estimate.

Choose an integer $d_0 gt.eq 2$ large enough for all preceding large-size and child-size comparisons.
  The constants $A \, d_0$ depend only on the fixed budget parameters;
  the scaled operator-boundary estimate (74) keeps them independent of the base exponent.
  Now choose one $P_(*) gt.eq 8$ that meets the sparse requirement and makes every nontrivial weighted moment at
  sizes $2^d$, $1 lt.eq d lt.eq d_0$, at most one, using Lemma 4.
  The trivial moment is one and every candidate in $L_n$ is nonnegative. Define

$ p_(2^d) & = P_(*) &  & \( 1 lt.eq d lt.eq d_0 \) \,\
p_(2^d) & = (1 + frac(A, d log 2)) max { p_(2^(floor.l d \/ 2 floor.r)) \,
  p_(2^(ceil.l d \/ 2 ceil.r)) } &  & \( d > d_0 \) . $

The preceding estimates prove the induction with these powers.
  Along a branch of rounded halvings, the sum of reciprocal bit lengths above $d_0$ is at most $2 \/ d_0$. Therefore

$ p_(2^d) lt.eq P_(*) exp #h(-0.16667em) (frac(2 A, d_0 log 2)) wide \( d gt.eq 1 \) . $

This proves the uniform bound on the exponents and completes Proposition 26.

===== 2.3.10 Amplification to full-deck mixing <amplification-to-full-deck-mixing>

Finally, the estimates imply TV convergence in constantly many butterflies.
  To state the details, at sparse levels (51) in the range used before and the elementary dimension bound show,
  on increasing a fixed absolute power if necessary, that the sum of $D_lambda$ times the power traces off the
  trivial diagram in this range tends to zero. Here one may sum at defect $k$ over at most the partition number of
  $k$ tails, and get for example $n^(- 2 k)$ bounds per shape; defect 1 vanished exactly.
  For remaining levels (53), (70) give the same conclusion with a sufficiently large fixed power,
  by the lower bound on log dimensions, height cutoff and partition count.
  Take the power even, $2 a$; increasing powers throughout is harmless.
  The density relative to uniform after $a$ complete butterflies has squared $L^2$-distance at most this vanishing
  sum, by Plancherel (products of $a$ butterfly matrices in Fourier space have Hilbert–Schmidt norm bounded by the
  product of Schatten-$2 a$ norms). This holds from any starting order, hence gives the required upper bound.

==== 2.4 A signed-tensor overlap with a minimized tag budget <ten:compressed>

The argument here minimizes an entropy cost over two signed-spin partitions and a freely labeled remainder.
  The resulting budget can be negative, so the finite-size and sparse parts of the induction include an explicit
  additive allowance. The overlap estimate retains its rank dependence.

The notation below is local; the sweep and trace conventions remain those of Section 1.

===== 2.4.1 The budget and the moment statement <the-budget-and-the-moment-statement>

For a list $v$ of part sizes write $h \( v \) = sum v_i log \( sum_j v_j \/ v_i \)$, omitting zeros.
  Whenever $M > 0$, we use the continuous convention $x log \( M \/ x \) = 0$ at $x = 0$. Define a budget

$ L_n \( lambda \) = min { b h \( mu \, xi \) + c t log n - t log \( n \/ t \) } . $

Here the diagrams $mu \, xi$ have total size $n - t$, and $lambda$ occurs in the representation induced by $mu \,
  xi^top$ on disjoint blocks with the remaining $t$ sites freely labeled (a regular factor).
  Use absolute positive constants $b$ sufficiently small, $c$ sufficiently small compared with $b$.

#thm([Proposition 2.13.])[
  (Moment estimate with a minimized tag budget).  #emph[For sufficiently small fixed $b >
    0$ and then sufficiently small fixed $c > 0$, there are a constant $C$ and exponents $p_d gt.eq
    2$ with $sup_(d gt.eq 1) p_d < oo$ such that, for every $d gt.eq 1$ and every $lambda tack.r n = 2^d$,
#[#set math.equation(numbering: n => "(77)")
 $ D_lambda upright("tr") \| rho_lambda \( B_n \) \|^(p_d) lt.eq exp { L_n \( lambda \) +
   C n^(1 - c \/ 2) } . $ <ten:compressed:eq:1>]

]
] <ten:compressed:main>

===== 2.4.2 Three budget properties <three-budget-properties>

Here are useful budget facts.

- $L_n lt.eq 1 / 2 log D_lambda$. Peel off successively the longer of the first row and first column.
  Write $upright(bold(r)) = \( r_i \)$ for the row lengths peeled,
  $upright(bold(c)) = \( c_j \)$ for the column lengths peeled,
  and $v$ for all these lengths in their peeling order. A row peel leaves an interlacing partition,
  so its reversal adds a horizontal strip; a column peel reverses to a vertical strip.
  Pieri’s rule therefore gives a trivial factor for a row peel and an alternating factor for a column peel.
  Put $n_(+) = sum_i r_i$, $n_(-) = sum_j c_j$, and
  $ M_(upright(bold(r))) = "Ind"_(product_i S_(r_i))^(S_(n_(+))) upright(bold(1)) \, wide M_(upright(bold(c))) =
    "Ind"_(product_j S_(c_j))^(S_(n_(-))) upright(bold(1)) . $
  Induction by stages, grouping the row and column factors, shows that $V_lambda$ occurs in
  $ "Ind"_(S_(n_(+)) times S_(n_(-)))^(S_n) #scale(x: 120%, y: 120%)[\(]
    M_(upright(bold(r))) ⊗ \( "sgn"_(n_(-)) ⊗ M_(upright(bold(c))) \) #scale(x: 120%, y: 120%)[\)] . $
  Decompose $M_(upright(bold(r)))$ and $M_(upright(bold(c)))$ into irreducibles and choose constituents $V_mu$ and
    $V_xi$ whose corresponding induced summand still contains $V_lambda$.
    Since $"sgn"_(n_(-)) ⊗ V_xi tilde.eq V_(xi^top)$, this is an admissible pair for the budget with $t = 0$.
    An empty list uses the trivial representation of $S_0$. Young’s rule #cite(label("James1978")) 14.1,
    pp. 51–52 says that $mu$ and $xi$ dominate the decreasing rearrangements of $upright(bold(r))$ and
    $upright(bold(c))$, respectively. Convexity of $x log x$, applied separately at the fixed totals $n_(+) \,
    n_(-)$, gives
  $ h \( mu \, xi \) & = n log n - sum_i mu_i log mu_i - sum_j xi_j log xi_j\
 & lt.eq n log n - sum_i r_i log r_i - sum_j c_j log c_j = h \( v \) . $
  Thus $L_n lt.eq b h \( v \)$.
  To bound $h \( v \)$, write $ell = v_1 \, med s = n - ell$. If $s = 0$, then $h \( v \) = 0$.
    The hook product on the first removed line is at most $ell ! exp \( s \)$, by adding the $s$ excess lengths;
    on every later one it is at most $\( 2 v_i \)^(v_i)$. Stirling or factorial estimates thus give $log D_lambda
    gt.eq h \( v \) - O \( s \)$ (the ratio $n ! \/ ell !$ has log at least $n log n - ell log ell - O \( s \)$).
    Also $log D_lambda = Omega \( s \)$ for growing $n$: if $ell$ is a sufficiently small fraction of $n$ this
    follows directly; otherwise keep the first line and a subdiagram below (or beside) it of size $u =
    min \( s \, floor.l ell \/ 3 floor.r \)$; interleavings of its fixed tableau with the line respecting the
    two-list ballot condition already give exponentially many in $s$.
    Bounded small sizes can equivalently be handled separately.
    Hence $h \( v \) lt.eq C_0 log D_lambda$ uniformly for an absolute $C_0$, and fixing $b lt.eq
    1 \/ \( 2 C_0 \)$ proves the claimed budget bound.
- Every minimizing choice has at most $q = ceil.l n^(1 \/ 16) ceil.r$ parts in each of $mu \, xi$, for large $n$.
  Otherwise removing one end box from a smallest part and making it a tag (increasing $t$) saves
  $b \( \( 1 \/ 16 \) log n - O \( 1 \) \)$ while costing at most $c log n + 1$. Branching permits this choice.
- $L_n gt.eq - O \( n^(1 - c \/ 2) \)$, and at the minimum $t = O \( n^(1 - c \/ 2) + log D_lambda \/ log n \)$.

For the last property, isolate the raw tag term on the real interval $0 lt.eq t lt.eq n$:

$ phi.alt_n \( 0 \) & = 0 \,\
phi.alt_n \( t \) & = c t log n - t log \( n \/ t \)\
 & = t log \( t \/ n^(1 - c) \) quad \( 0 < t lt.eq n \) . $

Its derivative is $log \( t \/ n^(1 - c) \) + 1$, so its minimum occurs at $t = n^(1 - c) \/ e$ and equals $-
  n^(1 - c) \/ e$. For $t gt.eq n^(1 - c \/ 2)$, we instead have $phi.alt_n \( t \) gt.eq \( c \/ 2 \) t log n$.
  Since $b h gt.eq 0$, the first bound gives $L_n gt.eq - n^(1 - c) \/ e gt.eq - n^(1 - c \/ 2) \/ e$.
  At a minimizing choice above the second threshold, $\( c \/ 2 \) t log n lt.eq L_n lt.eq 1 / 2 log D_lambda$,
  so $t lt.eq log D_lambda \/ \( c log n \)$; below that threshold, $t < n^(1 - c \/ 2)$.
  These are the two assertions in the last bullet.

In the dense-level case $n - lambda_1 gt.eq n^(1 - eta)$,
  where $eta > 0$ is fixed sufficiently small compared with $c$, only $ell \( lambda \) lt.eq n \/ 2$ matters:
  taller diagrams have no invariant vector for the first matching (Young’s rule).
  Here $log D_lambda gt.tilde n^(1 - eta)$ by the preceding estimates.
  Consequently multiplicative losses $exp O \( t + n^(1 - c \/ 6) \)$ in proving (77) at such levels can be
  absorbed (even to give the bound without the $C n^(1 - c \/ 2)$) by raising the exponent by a factor $1 +
  O \( 1 \/ d \)$, since the bound itself then forces each singular value to power $p_d$ to be at most
  $exp \( - Omega \( log D_lambda \) \)$.

===== 2.4.3 Sparse mixed-particle paths <sparse-mixed-particle-paths>

First we record the sparse-level estimate for $1 lt.eq k = n - lambda_1 < n^(1 - eta)$:

#[#set math.equation(numbering: n => "(78)")
 $ parallel rho_lambda \( B_n \) parallel lt.eq n^(- a k) $ <ten:compressed:eq:2>]

for large $d$, some $a \( eta \) > 0$. Work on the module of injections of $k$ tracked labels.
  Lower-coordinate kernels (depending on fewer than all the labels of the output) kill the isotype in question,
  by branching. Analyze $B_n B_n^(*) B_n$; in the middle sweep replace the joint kernel by the alternating
  inclusion-exclusion sum over subsets $I$ of labels, in each term updating $I$ together and each of its
  complement by private independent randomness. Use only distinct endpoints.
  Proper subsets give lower-coordinate kernels since a single particle finishes exactly uniformly.
  Given start and finish the paths are forced within the sweep.
  Draw their contact graph (using a common switch location at the same time).
  If some label is isolated the inclusion-exclusion entries cancel exactly (factorization on disjoint switches),
  so restrict every summand to no isolates. Each resulting nonnegative matrix, including the flanking sweeps,
  has column sums at most 1 (without restriction the independent-group updates preserve counting measure on their
  product space).

Its row sums are at most $n^(- Omega_eta \( k \))$, as follows.
  After the first sweep the tracked occupied sites have joint occupation upper bounds $\( k \/ n \)^r$ for every
  set of $r$ sites. Indeed joint occupancy bounded by products of one-site probabilities persists from
  deterministic sets under fair transpositions (average the products,
  using arithmetic-geometric mean when both sites occur).

Fix the original injection, the common subset $I$, a time $theta$ in the mixed middle sweep,
  and an ordered list of targets $upright(bold(y)) = \( y_1 \, dots.h \, y_r \)$, where $r gt.eq
  1$ and repetitions are allowed. Let $Z_i \( theta \)$ be the position of label $i$ after the first true sweep
  and the indicated middle layers. For $J subset.eq { 1 \, dots.h \, r }$,
  define the following sums over tracked labels:

$ N_J \( upright(bold(y)) \) & = sum_(i_1 \, dots.h \, i_r upright(" distinct")\
i_h in I med arrow.l.r.double med h in J) product_(h = 1)^r upright(bold(1)) { Z_(i_h) \( theta \) = y_h } \,\
N \( upright(bold(y)) \) & = sum_J N_J \( upright(bold(y)) \) . $

Thus $N$ counts ordered distinct labels, not necessarily distinct target sites.

Temporarily condition on $cal(F)_0$, the sigma-field generated by the random starting configuration of the middle
  sweep. The coordinates updated by time $theta$ partition the sites into blocks $C$ of a common size $v$.
  In block $C$, let $A_C \, F_C$ be the initial common and private particle counts, and let $j_C \,
  ell_C$ count target indices in $J \, J^c$. If two common targets coincide, then $N_J = 0$,
  because common particles remain at distinct sites. Otherwise the fair-switch occupation bound applies to the
  $j_C$ common targets; the distinct private labels have independent uniform positions and contribute the falling
  factorial $\( F_C \)_(ell_C)$. Conditional independence between blocks and between the common and private
  randomness gives

$ bb(E) \[ N_J \( upright(bold(y)) \) divides cal(F)_0 \] & lt.eq
  product_C frac(upright(bold(1))_({ A_C gt.eq j_C }) A_C^(j_C) \( F_C \)_(ell_C), v^(j_C + ell_C))\
 & lt.eq product_C frac(e^(j_C) \( A_C + F_C \)_(j_C + ell_C), v^(j_C + ell_C)) . $

Private targets may repeat, and a common and private target may coincide.
  We use $\( a \)_0 = a^0 = 1$, with infeasible falling factorials zero.
  For $A gt.eq j$, the second inequality follows from $A^j \/ \( A \)_j lt.eq j^j \/ j ! lt.eq
  e^j$ and $\( A \)_j \( F \)_ell lt.eq \( A + F \)_(j + ell)$, with the evident convention at $j = 0$.

Put $r_C = j_C + ell_C$. Averaging over the first true sweep now gives

$ bb(E) product_C \( A_C + F_C \)_(r_C) lt.eq (product_C \( v \)_(r_C)) \( k \/ n \)^r lt.eq v^r \( k \/ n \)^r . $

Indeed the factorial product counts ordered distinct occupied starting sites within disjoint blocks,
  and each set of $r$ such sites has joint occupation probability at most $\( k \/ n \)^r$.
  Averaging the conditional bound and summing over $J$ therefore proves

$ bb(E) N \( upright(bold(y)) \) lt.eq \( 1 + e \)^r \( k \/ n \)^r lt.eq \( 2 e k \/ n \)^r . $

This final expectation includes the first true sweep and the middle randomness;
  it conditions only on the original injection and $I$, with $theta$ and $upright(bold(y))$ prescribed.

Divide the middle sweep into a constant (depending on $eta$) number of pieces each varying a block of bits of
  volume at most $n^(eta \/ 2)$. No isolates forces in some piece $Omega_eta \( k \)$ particles sharing their
  fixed-bit classes with peers at its start, hence at least $r =
  Omega_eta \( k \)$ disjoint pairs there (round with $r gt.eq 1$, excluding the impossible case).
  Counting ordered target pairs, applying the preceding occupation bound to their $2 r$ ordered endpoints,
  and dividing by $r !$, probability at most

$ \( n^(1 + eta \/ 2) \)^r \( 2 e k \/ n \)^(2 r) \/ r ! . $

This proves the assertion. The matrix row-column sum bound and $2^k$ terms now bound the cubed singular norm,
  proving (78). Since $D_lambda lt.eq n^k$, this suffices both for (77) and for stronger decay with a fixed exponent.

===== 2.4.4 The dense-level trace induction <the-dense-level-trace-induction>

We detail the dense-level induction. Use the two halves of the bits to arrange the sites in a rectangle with side
  lengths $m = 2^(floor.l d \/ 2 floor.r) \, m' = n \/ m$. (Call the row length $m$.) The sweep factors are
  products of independent smaller sweeps on rows and on columns.
  With $p = max \( p_(floor.l d \/ 2 floor.r) \, p_(ceil.l d \/ 2 ceil.r) \)$,
  bound the left trace without $D_lambda$ by $upright("tr")_lambda A B$, where $A \,
  B$ are positive subgroup algebras on rows and columns respectively,
  absolute powers $p$ as in the trace inequality. Each is a tensor product,
  with regular trace budgets (77) per isotype per line.

Use minimizing $mu \, xi \, t$, choosing $nu tack.r t$ such that induction with the tag block of type $nu$
  contains $lambda$; in particular

$ D_lambda lt.eq binom(n, t) e^(h \( mu \, xi \)) D_nu . $

Majorize the trace by using induction with #strong[regular] tag block divided by $D_nu$,
  allowed by positivity of irrep traces. In expanding $A B$,
  a trace contribution fixes all tagged sites individually.
  Since row and column lines intersect once, each factor permutation must fix them individually.
  Thus the upper bound is $t ! \/ D_nu$ times a sum over tag sets $T$ of size $t$,
  of $upright("tr")_(cal(H)) A_0 B_0$. Here $A_0 \, B_0$ are coefficient restrictions to row and column groups
  avoiding $T$, and $cal(H)$ on the remaining grid sites is the representation induced by $mu \, xi^top$.
  Restrictions are positive (compress regular matrices).

Write $r_i$ for row tag counts and $s_j$ for column counts.
  Let $H$ be the product of the full row groups and $H_0$ its subgroup fixing the tags pointwise; write $J \,
  J_0$ for columns. A row type is an irreducible representation $V_gamma = ⨂_i V_(gamma_i)$ of $H_0$,
  of dimension $D_gamma = product_i D_(gamma_i)$. The element $A_0 in
  bb(C) \[ H_0 \]$ acts by the same matrix on every copy of this type.
  In the next display, $"tr" \( A_0 \)_gamma$ denotes the unnormalized trace on one such copy.
  For each row type occurring on $cal(H)$,

#[#set math.equation(numbering: n => "(79)")
 $ D_gamma upright("tr") \( A_0 \)_gamma lt.eq frac(\| H_0 \|, \| H \|) exp { b log D_gamma + c t log m -
   sum_i r_i log \( m \/ r_i \) + O \( n^(1 - c \/ 6) \) } . $ <ten:compressed:eq:3>]

The column estimate is identical. To prove the row estimate, apply Lemma 10 in each row, with $G = S_m$,
  its subgroup $S_(m - r_i)$, and the positive local factor $A_i$ of $A$. It gives

$ D_(gamma_i) "tr"_(gamma_i) \( E_(S_(m - r_i)) A_i \) lt.eq
  frac(1, \( m \)_(r_i)) sum_(alpha_i supset.eq gamma_i) D_(alpha_i) "tr"_(alpha_i) A_i . $

Thus only extending parent types contribute, and there is no branching-multiplicity factor in this sum.
  Multiplying over rows gives $product_i \( m \)_(r_i)^(- 1) = \| H_0 \| \/ \| H \|$.
  The number of extension choices is at most $exp O \( n^(3 \/ 4) log n \)$ by the partition bound.

Each $gamma_i$ occurs in induction of a signed pair $delta \, epsilon.alt^top$, both of length at most $q$:
  restrict the global signed tensor realization to the row and split its two parity classes.
  Every extension $alpha_i$ can then use this pair and $r_i$ regular tags as a candidate in $L_m \( alpha_i \)$.
  The minimum is at most this candidate cost, so the child bound (77) applies with

#[#set math.equation(numbering: n => "(80)")
 $ h \( delta \, epsilon.alt \) lt.eq log D_(gamma_i) + O \( q^2 log n \) . $ <ten:compressed:eq:4>]

For clarity, any Littlewood-Richardson result $gamma_i$ of $delta \, epsilon.alt^top$ contains both diagrams.
  Outside their union it adds at most $q^2$ boxes since that bounds their intersection.
  In the first $q$ rows and columns where they overlap or interact (the $q times
  q$ corner) hook costs are polynomial per box; in the horizontal arm, for boxes of $delta$,
  downward hook contributions within first $q$ rows cost at most $O \( q^2 log n \)$ extra log over row
  factorials. Extra boxes outside $delta \, epsilon.alt^top$ also modify hooks by $O \( log n \)$ per box
  (harmonic sums along their lines); boxes of $epsilon.alt^top$ do not extend into the horizontal arm,
  but can lengthen rows there only via the corner, already within the row extent of $delta$ if that row has arm
  boxes. The vertical arm works symmetrically. Thus hook product is at most $product delta_i ! product
  epsilon.alt_j ! exp O \( q^2 log n \)$, giving (80).

The child allowances sum over the $n \/ m$ rows to $C \( n \/ m \) m^(1 - c \/ 2) = O \( n^(1 - c \/ 4) \)$.
  Together with the type-entropy errors and extension counts,
  this fits $O \( n^(1 - c \/ 6) \)$ for the fixed small $c$.
  The remaining child terms sum to $b log D_gamma + c t log m - sum_i r_i log \( m \/ r_i \)$,
  which proves (79) with constants independent of the moment exponent.

===== 2.4.5 The signed-tensor overlap <the-signed-tensor-overlap>

We next retain the ranks needed to combine the one-copy traces in (79).
  Fix a row type $V_gamma$ of $H_0$ and a column type $V_beta$ of $J_0$.
  Let $P in bb(C) \[ H_0 \]$ be an orthogonal projection supported on type $gamma$, of rank $r$ on $V_gamma$,
  and let $S in bb(C) \[ J_0 \]$ be supported on type $beta$, of rank $s$ on $V_beta$.
  On $cal(H)$ each acts on every multiplicity copy of its type.
  In particular $r \, s$ are ranks on the respective product-group irreducibles,
  not ranks on $cal(H)$ or on compact color carriers. We claim

#[#set math.equation(numbering: n => "(81)")
 $ e^(\( 1 - b \) h \( mu \, xi \)) upright("tr")_(cal(H)) \( P S \) lt.eq
   r s \( D_gamma D_beta \)^(1 - b) exp O \( t + n^(4 \/ 5) \) . $ <ten:compressed:eq:5>]

Zero ranks give zero overlap. For the other cases use the signed tensor space on the non-tag sites,
  with $q$ even and $q$ odd colors. Its global compact type $\( mu \, xi \)$ is a tensor product of a compact
  carrier and $cal(H)$, by (8). Restricted to row groups, multiplicities in the entire tensor space are $exp
  O \( n^(4 \/ 5) \)$. Indeed, on each line the sum of squared multiplicities is the commutant dimension.
  The signed action on matrix units bounds that dimension by the number of orbits,
  at most $\( n + 1 \)^(\( 2 q \)^2)$. There are $O \( sqrt(n) \)$ lines and $q = O \( n^(1 \/ 16) \)$.
  It follows that $"tr"_(cal(H)) \( P S \) lt.eq r s exp O \( n^(4 \/ 5) \)$.
  We will interpolate this with a bound for the full row and column type projections.
  Its proof keeps the compact carrier visible.

We give the full covariance calculation, including the unitary multiplicity.
  This also explains why the comparison is valid for noncommuting densities.

If $n - t = 0$, the untagged representation $cal(H)$ is one dimensional, $h \( mu \, xi \) = 0$,
  and all local permutation types have dimension one. The overlap bound is immediate (a zero rank gives zero,
  and otherwise both ranks are one). We henceforth assume $n - t > 0$.

Write $h = h \( mu \, xi \)$ and let $cal(U)$ be the irreducible representation of $U \( q \) times
  U \( q \)$ of type $tau = \( mu \, xi \)$, with dimension $M$. On the global $tau$-sector the tensor space is

$ cal(U) ⊗ cal(H) . $

The symmetric-group action, and hence every row or column permutation projector,
  acts on $cal(H)$ and as the identity on $cal(U)$. For a tensor product $R$ of row densities and a tensor product
  $U$ of column densities, let $R_tau \, U_tau$ be their diagonal blocks on this sector.
  Define the ordinary, unnormalized partial traces

$ R' = "Tr"_(cal(U)) R_tau \, wide U' = "Tr"_(cal(U)) U_tau . $

Although $R$ and $U$ need not preserve the sector, their diagonal blocks are positive.

Let $macron(sigma)_R \, macron(sigma)_C$ be the averages of the row and column densities over all corresponding
  line indices. First make the densities positive definite;
  the result for singular densities follows by approximation on their supports. Write

$ K_R = rho_tau \( macron(sigma)_R^(- 1 \/ 2) \) \, wide K_C = rho_tau \( macron(sigma)_C^(- 1 \/ 2) \) . $

The highest-weight bound for a trace-one matrix gives

$ rho_tau \( macron(sigma)_R \) lt.eq e^(- h) I_(cal(U)) \, wide K_R^2 gt.eq e^h I_(cal(U)) \, $

and the same statements hold for $macron(sigma)_C$ and $K_C$. For every positive operator $A$ on $cal(U) ⊗ cal(H)$,

#[#set math.equation(numbering: n => "(82)")
 $ "Tr"_(cal(U)) #scale(x: 120%, y: 120%)[\(] \( K_R ⊗ I \) A \( K_R ⊗ I \) #scale(x: 120%, y: 120%)[\)] gt.eq
   e^h "Tr"_(cal(U)) A . $ <ten:compressed:partialtrace-positive>]

To verify the positive order, test a vector $v in cal(H)$.
  Its compression $A_v$ on $cal(U)$ is positive, and the scalar on the left is $"Tr" \( K_R A_v K_R \) =
  "Tr" \( A_v K_R^2 \) gt.eq e^h "Tr" A_v$. In particular, the comparison does not require $K_R$ to commute with $A$.

Choose a parity-preserving matrix $Z_0$ with squared singular values
  $\( mu_i \/ \( n - t \) \, xi_j \/ \( n - t \) \)$ and put $Z = g Z_0 h_0$, with $g \,
  h_0$ independent Haar block unitaries. In the complete tensor space use $X =
  macron(sigma)_R^(- 1 \/ 2) Z macron(sigma)_C^(- 1 \/ 2)$. The product formula and Lemma 20 give

#[#set math.equation(numbering: n => "(83)")
 $ "Tr" #scale(x: 120%, y: 120%)[\(] R X^(⊗ \( n - t \)) U \( X^(*) \)^(⊗ \( n - t \))
   #scale(x: 120%, y: 120%)[\)] lt.eq e^(O \( t \)) . $ <ten:compressed:covariance-upper>]

Indeed the full-grid average of the one-site factors is $"Tr" \( macron(sigma)_R X macron(sigma)_C X^(*) \) =
  "Tr" \( Z Z^(*) \) = 1$.

Averaging independently over $g \, h_0$ eliminates terms between inequivalent global unitary types by Schur
  orthogonality. Every surviving type contributes a nonnegative scalar.
  For the selected type $tau$, the contribution is exactly

#[#set math.equation(numbering: n => "(84)")
 $ frac(parallel rho_tau \( Z_0 \) parallel_(upright("HS"))^2, M^2) "Tr"_(cal(H))
   ["Tr"_(cal(U)) \( K_R R_tau K_R \) "Tr"_(cal(U)) \( K_C U_tau K_C \)] . $ <ten:compressed:haar-identity>]

Here the carrier matrices are understood to be tensored with the identity.
  The formula follows twice from $integral rho \( g \) A rho \( g \)^(*) thin d g = \( "Tr" A \/ M \) I$;
  expanding matrix entries on the multiplicity space gives the ordinary partial traces displayed above.
  The highest-weight monomial gives $parallel rho_tau \( Z_0 \) parallel_(upright("HS"))^2 gt.eq e^(- h)$.
  Apply (82) to both positive blocks, and use positive trace comparison successively. Thus (84) is at least

$ e^h / M^2 "Tr"_(cal(H)) \( R' U' \) . $

Combining this with (83) yields

#[#set math.equation(numbering: n => "(85)")
 $ "Tr"_(cal(H)) \( R' U' \) lt.eq M^2 e^(- h + O \( t \)) . $ <ten:compressed:partialtrace-overlap>]

We now specify the local density mixtures. In a row with $M_i > 0$ untagged sites and permutation type $gamma_i$,
  list all compatible polynomial type pairs $\( delta \, epsilon.alt \)$, each of length at most $q$,
  of total degree $M_i$, for which $gamma_i$ occurs in $delta * epsilon.alt^top$.
  For each pair choose the parity-preserving trace-one matrix with combined spectrum
  $\( delta \/ M_i \, epsilon.alt \/ M_i \)$ and conjugate it by independent Haar unitaries in the two parity
  spaces. Its tensor power on the corresponding polynomial sector has, before averaging,
  highest-weight eigenvalue $e^(- h \( delta \, epsilon.alt \))$.
  After averaging it is scalar there, with scalar at least that eigenvalue divided by the polynomial carrier
  dimension. It remains positive on every other sector.

By (80), $h \( delta \, epsilon.alt \) lt.eq log D_(gamma_i) + O \( q^2 log n \)$.
  The carrier dimensions and the number of type pairs are both $exp \( O \( q^2 log n \) \)$.
  Mix uniformly over this finite list of pairs. The resulting density average therefore dominates
  $D_(gamma_i)^(- 1) e^(- O \( q^2 log n \))$ times the full $gamma_i$ projector on this row’s signed tensor
  space: that projector is contained in the sum of the compatible polynomial sectors.
  A row with no untagged sites has scalar tensor power one and can use any parity-preserving density.
  Tensoring the independent row mixtures, and using the graded regrouping of sites,
  gives domination by $D_gamma^(- 1) e^(- O \( n^(4 \/ 5) \))$ times the full row-type projector.
  Indeed there are $O \( sqrt(n) \)$ lines and $q = O \( n^(1 \/ 16) \)$,
  so all line errors fit in $O \( n^(4 \/ 5) \)$. Construct the column mixture in exactly the same way with its
  local permutation types. It gives the corresponding factor with $D_beta$.
  The row and column mixtures are independent. On the global sector these projectors have the form $I_(cal(U)) ⊗
  P_gamma$ and $I_(cal(U)) ⊗ P_beta$. Their unnormalized partial traces are $M P_gamma$ and $M P_beta$.
  Independence of the two density mixtures and positivity therefore give the lower bound

$ bb(E) "Tr" \( R' U' \) gt.eq frac(M^2 e^(- O \( n^(4 \/ 5) \)), D_gamma D_beta) "Tr"_(cal(H)) \( P_gamma P_beta \) . $

The two factors $M$ cancel the $M^2$ in (85), proving the full-type endpoint

$ "Tr"_(cal(H)) \( P_gamma P_beta \) lt.eq D_gamma D_beta thin e^(- h + O \( t + n^(4 \/ 5) \)) . $

Finally let $P \, S$ have ranks $r \, s > 0$ in the respective irreducible symmetric-group spaces,
  as in the statement. Positive trace comparison bounds their overlap by the full-type endpoint.
  The multiplicity estimate supplies the independent bound $"Tr" \( P S \) lt.eq r s thin e^(O \( n^(4 \/ 5) \))$.
  For $0 < b < 1$, interpolate these two scalar upper bounds using $min \( A \, B \) lt.eq A^b B^(1 - b)$;
  since $\( r s \)^b lt.eq r s$, the result is

$ e^(\( 1 - b \) h) "Tr"_(cal(H)) \( P S \) lt.eq r s \( D_gamma D_beta \)^(1 - b) e^(O \( t + n^(4 \/ 5) \)) \, $

which is the stated overlap estimate. The case of a zero rank is immediate.

===== 2.4.6 Counting the tag layouts <counting-the-tag-layouts>

Spectrally expanding $A_0 \, B_0$ into positive weighted projections and summing (81) using (79) (numbers of types
  absorbed), we conclude

$ D_lambda upright("tr")_lambda A B & lt.eq exp { b h \( mu \, xi \) + c t log n + O \( t + n^(1 - c \/ 6) \) }\
 & wide  dot.op sum_(\| T \| = t) exp { - sum_i r_i log \( m \/ r_i \) - sum_j s_j log \( m' \/ s_j \) } . $

Here per table we used $binom(n, t) t ! \( \| H_0 \| \| J_0 \| \) \/ \( \| H \| \| J \| \) lt.eq e^(O \( t \))$,
  by falling factorial bounds. Group the tables by margins (subexponentially many, $exp O \( n^(4 \/ 5) \)$).
  With given margins their number is at most

$ exp { sum_i r_i log \( m \/ r_i \) + sum_j s_j log \( m' \/ s_j \) - t log \( n \/ t \) + O \( t \) } . $

Indeed order the $t$ entries arbitrarily, use multinomials for the two coordinate sequences separately and divide
  by $t !$. This gives precisely the desired budget with absorbable losses.

===== 2.4.7 Closing the exponent recursion <closing-the-exponent-recursion>

Fix $b$, then $c$, and then $eta$ in the ranges required above, in particular with $eta < c \/ 6$.
  The raw tag calculation gives $L_n gt.eq - n^(1 - c \/ 2) \/ e$.
  Fix the theorem’s allowance $C gt.eq 1 \/ e$ now, so $L_n + C n^(1 - c \/ 2) gt.eq
  0$ at every size and for every diagram.

For a dense block that is not annihilated, write $W = log D_lambda$.
  The bounds on $t$ and $W$, together with $log n = d log 2$ and $eta < c \/ 6$, give $t + n^(1 - c \/ 6) lt.eq
  K_0 W \/ d$ above a fixed size. Consequently the preceding trace and layout estimates, with this $C$ fixed, give

$ D_lambda upright("tr") \| rho_lambda \( B_n \) \|^p & lt.eq exp { L_n \( lambda \) + K W \/ d } \,\
p & = max \( p_(floor.l d \/ 2 floor.r) \, p_(ceil.l d \/ 2 ceil.r) \) \, $

whenever the child bounds hold with exponents at least two. Here $K$ is independent of $p$:
  the trace inequality has unit constant, and the coefficients in the remaining errors above depend only on the
  fixed budget constants and allowance. Increase the size cutoff so that $K \/ d lt.eq 1 \/ 4$.
  Since $L_n lt.eq W \/ 2$, the last display makes every singular value $s$ satisfy $s^p lt.eq e^(- W \/ 4)$. Hence

$ D_lambda upright("tr") \| rho_lambda \( B_n \) \|^(p \( 1 + A \/ d \)) & lt.eq
  exp { L_n \( lambda \) + \( K - A \/ 4 \) W \/ d }\
 & lt.eq e^(L_n \( lambda \)) $

when $A gt.eq 4 K$. Choose an integer cutoff $d_0 gt.eq 1$ large enough for this argument,
  the minimizing-part and sparse estimates, and all child-size thresholds used above.
  Both $A$ and $d_0$ have now been fixed independently of the base power.

Choose one real $P_(*) gt.eq 2$ above the fixed sparse requirement, including the stronger sparse decay,
  and large enough for every nontrivial block with $1 lt.eq d lt.eq d_0$. This is possible by Lemma 4:
  there are finitely many such blocks, their sweep norms are strictly below one, and

$ D_lambda upright("tr") \| rho_lambda \( B_n \) \|^(P_(*)) & lt.eq
  D_lambda^2 parallel rho_lambda \( B_n \) parallel^(P_(*))\
 & lt.eq 1 $

once $P_(*)$ is large enough. Trivial blocks have weighted trace one and are covered by the already fixed
  nonnegative allowance. Set

$ p_d & = P_(*) quad \( 1 lt.eq d lt.eq d_0 \) \,\
p_d & = \( 1 + A \/ d \) max \( p_(floor.l d \/ 2 floor.r) \, p_(ceil.l d \/ 2 ceil.r) \) quad \( d > d_0 \) . $

Every $p_d$ is at least $P_(*)$, so the sparse estimate remains available.
  Along a rounded-halving branch above the cutoff, a parent $u$ and child $v$ satisfy $u - 1 gt.eq 2 \( v - 1 \)$.
  Thus the sum of $1 \/ u$ along that branch is at most $2 \/ d_0$, and $p_d lt.eq P_(*) exp \( 2 A \/ d_0 \)$.
  This proves (77) with bounded exponents.

After a sufficiently large absolute constant number of sweeps,
  Plancherel now gives vanishing squared relative $L^2$ distance to uniform:
  for dense types (77) gives individual norm to bounded power $lt.eq e^(- Omega \( log D_lambda \))$,
  dominating both $D_lambda^2$ and the partition count; for sparse types use (78) and $D_lambda lt.eq n^k$,
  with at most $2^k$ diagrams per level. This implies the total variation bound,
  independent of the starting order. The support obstruction is Lemma 5.

==== 2.5 Simultaneous hook and marked-site trace bounds <ten:simultaneous>

This proof keeps two assertions simultaneously: a dimension bound for every representation,
  and a stronger bound for every permitted hook subdiagram with a sufficiently large marked complement.
  The positive-part penalty in the trace recursion controls the sum of child log dimensions.

All notation introduced below is local to this section. Traces are unnormalized, logarithms are natural,
  and a sweep on $2^d$ positions takes $d$ physical shuffles. The conventions are those of Section 1.

===== 2.5.1 Moment normalization and simultaneous targets <moment-normalization-and-simultaneous-targets>

We work over $bb(C)$, using unitary representations of symmetric groups.
  For a dyadic size $m = 2^a$, use the sweep $B_m$ of Section 1.
  Partition indices of irreducibles are denoted $lambda$, the representations by $\[ lambda \]$,
  their dimensions by $D_lambda$, and traces in them by $"tr"_lambda$.
  Use also the empty partition in size zero, of dimension 1.
  From this point through the end of this section, $p gt.eq 1$ denotes an integer square-moment index;
  Proposition 29 later chooses $p$ to be an absolute power of two. For $lambda tack.r m = 2^a$, set

$ B_lambda & = H_lambda = log D_lambda \,\
cal(L)_lambda & = "tr"_lambda Q_m^p = "tr"_lambda \| B_m \|^(2 p) \,\
e_lambda & = B_lambda + log cal(L)_lambda = E_m \( lambda \; 2 p \) . $

Use $e_lambda = - oo$ if the trace is zero. $B_lambda$ will also be used in sizes other than powers of 2.

The general marked recurrence will be used at real Schatten order $2 p$.
  The simultaneous induction below needs its sparse estimate, a dimension lower bound,
  and a comparison when the permitted hook shrinks. After completing that induction,
  we give an alternative derivation of its recurrence using weight projections and a trace inequality for powers
  of two. That derivation reuses the ordinary representation-theoretic conventions but supplies its own density
  and marked-trace argument.

The aim is to bound $cal(L)_lambda$ for one fixed large $p$.
  Near a single long row we do this directly using functions of a sparse set of labels.
  Otherwise we split a sweep in half, into independent operations on rows of a grid and then on the transversal
  columns, and recurse on traces. A graded tensor space handles diagrams in a small hook:
  it gives a weight-entropy bound from log dimension, and product states on rows and columns permit an overlap
  bound using the transversality. Distinct marked slots handle cells outside a hook.
  To keep the errors small relative to dimension the induction will track both log dimension on the hook and a
  budget for the marks. Constants in estimates below may increase from one bound to the next and are absolute once
  the indicated numerical parameters are fixed.

Take $p$ to be a power of 2; its size will be fixed after all thresholds.
  Use $gamma = 1 \/ 40 \, med eta = 9 \/ 10$, and $K_n = floor.l n^gamma floor.r$. Define

$ J \( t \, n \) = t log \( n \/ t \) \, wide W \( t \, n \) = t log n $

(zero at $t = 0$). Let $n = 2^d$ be sufficiently large, and split the sweep into first $floor.l d \/ 2
  floor.r$ and last $ceil.l d \/ 2 ceil.r$ coordinates, with $r \, s$ the respective powers of 2.
  The first part $X$ acts by copies of $B_r$ within the $s$ rows of the grid,
  the second $Y$ by copies of $B_s$ in the $r$ columns: averages factor across the disjoint groups in each part.
  So $B_n = Y X$. Index these groups together by $g$, of sizes $m_g$.

Suppose $lambda tack.r n$ has $cal(L)_lambda > 0$, and choose #emph[any] subpartition $mu subset.eq
  lambda$ of size $M = n - t$ fitting the $K_n$-hook. Proposition 22,
  with real Schatten order $2 p$ and hook parameter $q = K_n$, gives

#[#set math.equation(numbering: n => "(86)")
 $ e_lambda + J \( t \, n \) med lt.eq med max med { sum_g #scale(x: 120%, y: 120%)[\(] e_(alpha_g) +
   J \( h_g \, m_g \) #scale(x: 120%, y: 120%)[\)] - #scale(x: 120%, y: 120%)[\(] sum_g B_(delta_g) -
   B_mu #scale(x: 120%, y: 120%)[\)]_(+) } + C \( t + n^eta \) . $ <ten:simultaneous:eq:6>]

Here one can take the max over choices with integers $0 lt.eq h_g lt.eq
  m_g$ summing to $t$ in each of the two branches (rows, columns); $alpha_g tack.r m_g \, med
  cal(L)_(alpha_g) > 0$; and $delta_g subset.eq alpha_g$ of size $m_g - h_g$ fitting the $K_n$-hook.
  The constants and size threshold do not depend on $p$.

Indeed its error is $O \( t + n^(9 \/ 10) \)$, since $\( r + s \) \( K_n^2 + n^(1 \/ 4) \) log \( n + 1 \) =
  O \( n^(9 \/ 10) \)$. The alternative weight-space proof appears at the end of this section.

===== 2.5.2 The simultaneous estimates <the-simultaneous-estimates>

Fix $u = 10^(- 5)$, $delta = u \/ 4$; the sparse and dimension estimates below will use this value of $delta$.
  Call $t$ high in size $n$ if $t > 0$ and $log \( n \/ t \) lt.eq u log n$.
  Use bit-length levels $d lt.eq 2^l D$, $l gt.eq 0$, with an absolute integer $D$ sufficiently large. Set

$ A_0 = 1 \/ 4 \, wide b_0 = gamma \/ 100 \, wide A_l - A_(l - 1) = b_l -
  b_(l - 1) = \( 2^(l - 1) D \)^(- 1 \/ 2) quad \( l gt.eq 1 \) . $

Take $D$ large enough that the sum of increments is less than $b_0$; in particular $A_l < 1 \/ 2 \, med
  3 u < b_l lt.eq 2 b_0 < A_0 gamma \/ 2$. Further sufficiently-large requirements below on $D$ will be
  independent of the eventual moment exponent.

#thm([Proposition 2.14.])[
  (Simultaneous dimension and marked-hook estimates).  #emph[There are an absolute threshold $D$ and,
    after $D$ is fixed, an absolute power of two $p gt.eq 1$ such that the following bounds hold at every level $l
    gt.eq 0$ and every size $n = 2^d$ with $1 lt.eq d lt.eq 2^l D$.
    For every $lambda tack.r n$ with positive trace, (G) holds.
    For every such $lambda$ and every $mu subset.eq lambda$ with $mu_(K_n + 1) lt.eq K_n$, put $t = n - \| mu \|$.
    If $t > 0$ and $log \( n \/ t \) lt.eq u log n$, then (H) holds:
#[#set math.equation(numbering: n => "(87)")
 $ upright("(G)") & e_lambda lt.eq A_l B_lambda \,\
upright("(H)") & e_lambda + J \( t \, n \) lt.eq A_l B_mu + b_l W \( t \, n \) . $ <ten:simultaneous:eq:8>]

]
] <ten:simultaneous:main>

===== 2.5.3 Sparse harmonic-tuple coupling <sparse-harmonic-tuple-coupling>

Here first allow any fixed $0 < delta < 1 \/ 2$; the simultaneous induction uses the value chosen above.

There is a $p_0 = p_0 \( delta \)$ such that, for any integer $p gt.eq p_0$ and sufficiently large $m =
  2^a$ (threshold depending only on $delta$),

#[#set math.equation(numbering: n => "(88)")
 $ 1 lt.eq k = m - lambda_1 lt.eq m^(1 - delta) quad arrow.r.double quad e_lambda lt.eq -
   2 k log m . $ <ten:simultaneous:eq:1>]

For this consider the space of functions on ordered injections $x = \( x_1 \, dots.h \, x_k \)$ of positions,
  with the uniform inner product, under permutation of positions ($\( pi f \) \( x \) = f \( pi^(- 1) x \)$).
  Call a function harmonic here if summing over the choices of any one coordinate, with the others fixed,
  gives zero. These functions form an invariant subspace: it is the orthogonal complement of the span of the
  functions independent of at least one coordinate. Applying the branching rule
  #cite(label("VershikOkounkov2005")) Theorem 5.8 and Frobenius reciprocity #cite(label("etingof")) Theorem 4.33,
  $\[ lambda \]$ with first row $m - k$ occurs on the injection space (the stabilizer is $S_(m - k)$),
  but does not occur on $\( k - 1 \)$-injections, since it does not contain the subpartition $\( m - k + 1 \)$.
  Its isotypic subspace is therefore harmonic.

Let $T = \( B_m^(*) B_m \)^p$ act on these functions. Evaluation of $g =
  T f$ is the expectation of $f$ by evolving positions through $p$ blocks,
  each consisting of two sweeps (one in reverse order; reversing the factors for action on positions still has the
  two-sweep property). We keep layers as separate random layers even where a projection is repeated.
  For disjoint injections $x \, y$ (all $2 k$ positions distinct,
  possible for these sizes when $m$ is sufficiently large),
  consider the alternating sum $Delta g \( x \, y \)$ of $g$ on the $2^k$ injections choosing $x_i$ or $y_i$ for
  each $i$, with sign $\( - 1 \)^(\# { i : y_i upright(" chosen") })$.

Couple all these evolutions by a skeleton with two alternative paths per label $i$, initially at $x_i \, y_i$.
  They can coalesce within a label, in which case we use one path thereafter.
  Paths of distinct labels stay distinct. At a layer, call a label clean if none of its paths occupies a switch
  pair shared with a path of a different label. For each clean label choose a fresh uniform #emph[destination bit]
  in the active coordinate, the same for both its paths, directing each to that endpoint of its pair.
  (This can direct both to the same endpoint.) For pairs involving unclean labels use the usual swap coins.
  All coins except the sharing just specified are fresh and independent.
  Pairs shared across labels always use a common usual swap, so preserve distinctness.
  For any fixed selection of alternatives, conditionally on the skeleton so far its paths have exactly the correct
  one-step transition: sharing a destination bit within a clean label causes no required correlation to fail,
  since only one of its paths is selected; among the pairs seen by the selection there are independent coins and a
  shared pair makes complementary outputs. Consequently from any fixed skeleton at a block start the trajectory of
  a fixed selection has the standard shuffle-path law.

Once any label coalesces, the alternating sum of the final $f$ evaluations cancels pointwise in this coupling (its
  expectation is $Delta g$), by toggling that label’s choice.
  To have no coalescence through a block starting with none,
  every label must be unclean at least once in the #emph[last] sweep of the block:
  clean updates all through that sweep give identical bits in every coordinate for its paths.
  In such a skeleton, a uniformly random selection of alternatives has in expectation at least $k \/
  4$ distinct labels that participate in selected-path pair collisions in this sweep.
  Indeed for each label take a witnessing shared pair; selection of the two paths at that pair has probability
  $1 \/ 4$ since they belong to distinct labels. In particular some selection has at least $k \/ 4$ participants.
  We union bound this last event over the $2^k$ fixed selections,
  without conditioning their laws on what happens during the block.

For one fixed selection, we can do the trajectory probability calculation in its standard path law starting from
  deterministic positions conditionally at the block start. At the start of the last sweep the occupied subset satisfies

$ bb(P) \( A upright(" all occupied") \) lt.eq \( k \/ m \)^(\| A \|) $

for any set $A$. To see this, the same product bound using individual marginal occupation probabilities holds
  initially from deterministic positions and is preserved by a layer.
  Pull $A$ back through the independent swaps; the expected product of old marginals factors by pairs.
  A single endpoint in $A$ yields the averaged marginal, and both endpoints yield the old product at most the
  square of the average. After the first sweep the averaged marginals are all $k \/ m$,
  by averaging along every coordinate. Independently of this subset,
  full shuffle coins in the last sweep define a graph on the $m$ positions at the start of that sweep.
  Trace paths starting at all positions, connecting starting positions whose paths occupy a switch pair at any
  layer just before its update. The graph has maximum degree at most $a$.
  Participants are exactly the occupied vertices with an occupied neighbor.

In a fixed such graph, the nontrivial connected components of the induced occupied graph, if they have $v gt.eq
  k \/ 4$ vertices total, give a collection of $c lt.eq v \/ 2$ nontrivial connected sets.
  The number of possibilities for given $v \, c$ is at most $binom(m, c) 2^v a^(2 v)$:
  choose roots in order (say the least elements, sorted), sizes,
  and describe each connected set by a walk traversing a spanning tree from its root using
  $2 \( upright("size") - 1 \)$ steps. Apply the occupied-set bound to each such collection (with $v$ distinct
  vertices). Since $\( e m \/ c \)^c$ is increasing up to $c = m$,
  we can bound the root count by $\( 2 e m \/ v \)^(v \/ 2)$.
  Summing in $c$ (at most $v lt.eq 2^v$ terms), the probability for a fixed selection is at most

$ sum_(v = ceil.l k \/ 4 ceil.r)^k \[ C a^2 sqrt(k \/ m) \]^v $

for an absolute $C$, using $v gt.eq k \/ 4$. For sufficiently large $m$ and $q = k \/ m lt.eq m^(- delta)$,
  the bracket is at most $q^(1 \/ 4)$, giving sum at most $2 q^(k \/ 16)$.
  Including the $2^k$ selections, the conditional probability of no coalescence through the block is at most
  $q^(k \/ 32)$ (absorbing $2^(k + 1)$ for sufficiently large $m$).
  This bound repeats conditionally at each block. It gives

$ \| Delta g \( x \, y \) \| lt.eq 2^k q^(p k \/ 32) parallel f parallel_oo . $

If $f$ is harmonic so is $g$. Average the alternating difference over a uniform $y$ disjoint from $x$.
  For a nonempty subset $S$ of coordinates replaced, of size $j$,
  summing $g$ over distinct choices for these outside all of $x$ can be done by inclusion-exclusion starting with
  choices just avoiding the positions of $x$ in coordinates outside $S$ (and still distinct).
  Expand $product_(i in S) \( 1 - upright(bold(1))_({ y_i in x_S }) \)$ where $x_S$ here is the set of
  corresponding positions. Terms with any unrestricted variable coordinate vanish on summing in that coordinate by
  harmonicity. The result is $\( - 1 \)^j$ times the sum with a permutation of the $j$ positions $x_S$ used,
  divided by $\( m - k \)_j$ for averaging. Thus the average alternating difference differs from $g \( x \)$ by at
  most $parallel g parallel_oo sum_(j = 1)^k \( k \)_j \/ \( m - k \)_j$, where $\( m \)_j =
  m \( m - 1 \) dots.h.c \( m - j + 1 \)$, with $\( m \)_0 = 1$.
  The sum is at most $1 \/ 2$ for sufficiently large $m$ here (bound by a geometric sum with ratio
  $k \/ \( m - 2 k \)$). We conclude that $parallel T f parallel_oo lt.eq
  2^(k + 1) q^(p k \/ 32) parallel f parallel_oo$ on the harmonic subspace.
  Applied to eigenvectors, this bounds the eigenvalues on $\[ lambda \]$; $T$ is positive semidefinite.
  Also $D_lambda lt.eq m^k$ by its occurrence, so $e_lambda lt.eq
  2 k log m + \( k + 1 \) log 2 - \( p delta \/ 32 \) k log m$.
  We get (88), for example taking $p_0 gt.eq 192 \/ delta$.

===== 2.5.4 Dimensions in the nonsparse range <dimensions-in-the-nonsparse-range>

If $cal(L)_lambda > 0$, the length of $lambda$ is at most $m \/ 2$.
  In fact invariants for the first coordinate pair-swap subgroup $S_2^(m \/ 2)$ must occur,
  and induction of its trivial module builds the partition by $m \/ 2$ horizontal 2-strips.
  We claim for sufficiently large $m$,

#[#set math.equation(numbering: n => "(89)")
 $ cal(L)_lambda > 0 \, quad m - lambda_1 > m^(1 - delta) quad arrow.r.double quad B_lambda gt.eq
   c m^(1 - delta) $ <ten:simultaneous:eq:2>]

with $c > 0$. If $lambda_1 gt.eq m \/ 2$, interleave the first row with one fixed standard order of the $k = m -
  lambda_1$ tail cells, ensuring row count at least tail count in every prefix;
  this suffices for all column conditions (a tail cell in column $j$ appears no earlier than the $j$-th tail
  step). The ballot count is at least $binom(m, k) \/ \( m + 1 \)$ (subtract $binom(m, k - 1)$ by reflection at
  the first bad prefix), and $binom(m, k) gt.eq \( m \/ k \)^k gt.eq 2^k$.
  Otherwise both maximum row and column are at most $m \/ 2$.
  If their maximum $b$ is at least $m \/ \( 4 e \)$ (here $e$ is the base of natural logarithms),
  orient the partition, by transposing if needed, with row size $b$ and take a subpartition with that row and tail
  size $b$. The same interleavings have log count $Omega \( m \)$.
  Dimension does not decrease in extending a subpartition (extend tableaux), nor change in transposing.
  If the maximum is smaller, all hooks are at most $m \/ \( 2 e \)$ and the hook formula gives dimension at least
  $2^m$. This proves (89).

===== 2.5.5 Shrinking the allowed hook <shrinking-the-allowed-hook>

We need a quantitative dimension estimate when shrinking the permitted hook.
  Let $theta$ have size $M lt.eq m$, let $K = K_m$, and remove its cells with both indices $> K$,
  obtaining $hat(theta)$ by removing $v$ cells. Always $B_theta gt.eq B_(hat(theta))$. For sufficiently large $m$,

#[#set math.equation(numbering: n => "(90)")
 $ M gt.eq K^3 quad arrow.r.double quad B_theta - B_(hat(theta)) gt.eq \( gamma \/ 2 \) v log m .
   $ <ten:simultaneous:eq:7>]

For $v > 0$, write $a \, b$ for width and height of the removed region, taking $a gt.eq b$ by symmetry.
  The dimension ratio by hooks has numerator $\( M \)_v$; the denominator consists of the removed hooks (at most
  $2 a$ each) and the inflation factors of the preserved hooks.

For the top $K$ rows only columns $K + j \, med 1 lt.eq j lt.eq a$, have inflation.
  Let $b_j$ be the decreasing (nonincreasing) heights added there.
  The hooks before adding are at least $a - j + u \, med u = 1 \, dots.h \, K$,
  since the full rectangle there in the top rows was present.
  Per column the log inflations thus sum to at most $log binom(K + b_j, b_j) lt.eq
  b_j \( 1 + log \( 1 + K \/ b_j \) \)$, just using the denominator bound $u$.
  Summing by concavity gives at most $v \( 1 + log \( 1 + K a \/ v \) \)$.
  Another bound using $log \( 1 + x \) lt.eq x$ is

$ sum_j b_j sum_(u = 1)^K frac(1, a - j + u) med lt.eq med v / a sum_(j \, u) frac(1, a - j + u) med lt.eq med
  v \( 2 + log \( 1 + K \/ a \) \) . $

The first bound here averages oppositely ordered sequences; the double sum is at most $sum_(i = 1)^a 1 \/ i +
  log binom(a + K - 1, a)$ by summing in $u$ with an integral.

Similarly for the left $K$ columns with $b$ in place of $a$:
  choosing the better of the concavity and opposite-order bounds gives log inflation per removed cell at most $2 +
  log \( 1 + K \/ max \( v \/ b \, b \) \)$. For the top rows we can just use $2 + log \( 1 + K \/ a \)$.
  The total log denominator per removed cell is therefore at most

$ C + log #h(-0.16667em) #scale(x: 120%, y: 120%)[\[] a max \( 1 \, K \/ a \) max \( 1 \, K \/ sqrt(a) \)
  #scale(x: 120%, y: 120%)[\]] \, $

using $max \( b \, v \/ b \) gt.eq sqrt(v) gt.eq sqrt(a)$. The bracket is at most $max \( M \/ K \, K^2 \)$:
  $a lt.eq M \/ K$, and consider $a gt.eq K^2 \, med K lt.eq a lt.eq K^2 \, med a lt.eq K$ respectively.
  For $M gt.eq K^3$, comparison with $\( M \/ e \)^v$ for the numerator proves a gain per cell of $log K - C - 1$,
  giving (90). Nondecrease without the size assumption is by tableau extension.

===== 2.5.6 Proof of the simultaneous estimates <proof-of-the-simultaneous-estimates>

#proof[
  For level 0 we can, after choosing $D$, take a power of 2 $p gt.eq p_0$ sufficiently large and fixed.
    In each nontrivial irreducible the sweep norm is strictly less than 1:
    equality for a unit vector would require equality at every successive orthogonal projection,
    leaving the vector invariant under all hypercube edge transpositions,
    which generate the whole symmetric group by connectivity.
    Thus in the finitely many base sizes we can have $e_lambda lt.eq - n log n$ for all nontrivial types.
    In the trivial type $e_lambda = 0$. This proves the base ($J lt.eq n log n$, and use $J lt.eq
    u W$ in the high case for the trivial type).
  Suppose $2^(l - 1) D < d lt.eq 2^l D$, so the children are at most level $l -
    1$ and their bit lengths are at least $d \/ 3$. Write $A = A_(l - 1) \, b = b_(l - 1)$. First prove (H).
    Apply (86) with the chosen $mu$. Consider any child choice there, writing $m = m_g \, med h = h_g \, med
    alpha = alpha_g \, med theta = delta_g \, med S_g = B_theta \, med W_g = h log m$.
    We have $sum_g W_g = W \( t \, n \)$, since each branch sums the counts to $t$ and $log r + log s = log n$.
  - If inherited $h$ is high in size $m$, truncate $theta$ to $hat(theta)$ as in (90),
    adding $v$ removed cells to the count $h$. Use child (H) with $hat(theta) \, h + v$, still high.
    Since $J \( h \, m \) - J \( h + v \, m \) lt.eq v$ (differentiate in the count), we get
    $ e_alpha + J \( h \, m \) lt.eq A S_g + b W_g + \( b log m + 1 \) v - A \( B_theta - B_(hat(theta)) \) . $
    When $m - h gt.eq K_m^3$ the extra is nonpositive by (90) and the strict bound on $2 b_0$,
      for sufficiently large $D$. Otherwise $v lt.eq m^(3 gamma)$, $h gt.eq m \/ 2$,
      and dimension is nondecreasing, so the extra is at most $2 \( b + 1 \/ log m \) m^(3 gamma - 1) W_g$.
  - Otherwise $h < m^(1 - u)$ (including $0$). If the child is sparse ($m - alpha_1 lt.eq m^(1 - delta)$),
    then $e_alpha lt.eq 0$ by (88) or triviality. If not, (G) at child size gives $e_alpha lt.eq
    A \( S_g + W_g \)$, since $D_alpha lt.eq m^h D_theta$ by the same tableau-region bound ($f^(alpha \/ theta)
    lt.eq h !$). By (89), $B_alpha gt.eq c m^(1 - delta)$, so $W_g \/ S_g =
    O \( m^(- \( u - delta \)) log m \)$ for sufficiently large sizes by $S_g gt.eq B_alpha - W_g$;
    we absorb $A W_g$ by this small increase in the coefficient on $S_g$. In both cases we can bound $J$ by
    $ J \( h \, m \) lt.eq 3 u W_g + h log^(+) \( macron(h) \/ h \) \, wide macron(h) = t m \/ n \, $
    with zero last term at $h = 0$, $log^(+) x = max \( 0 \, log x \)$.
      Indeed split $log \( m \/ h \) = log \( n \/ t \) + log \( macron(h) \/ h \)$ and $log n lt.eq 3 log m$.
      The last terms sum to at most $2 t \/ e$ over all children,
      since each is at most $macron(h) \/ e$ and the $macron(h)$’s sum to $t$ in each branch (this bound also
      allows including the other children).
  Together the child sum in (86) is at most
  $ \( A + epsilon.alt_d \) sum_g S_g + \( b + epsilon.alt_d \) W \( t \, n \) + 2 t \/ e $
  where $epsilon.alt_d gt.eq 0$ is $o \( d^(- 1 \/ 2) \)$ uniformly:
    the errors just used besides the dilution terms are bounded in the coefficients by $C m^(3 gamma - 1)$ and $C
    m^(- \( u - delta \)) log m$, $2^(d \/ 3) lt.eq m lt.eq 2^d$.
    Since $A + epsilon.alt_d lt.eq 1$, the positive-part penalty in (86) reduces the structural term to at most
    $\( A + epsilon.alt_d \) B_mu$ (use $a S - \( S - B_mu \)_(+) lt.eq a B_mu$ for $0 lt.eq a lt.eq 1$).
    Also $W \( t \, n \) gt.eq n^(1 - u) log n$ here, so $\( C \( t + n^eta \) + 2 t \/ e \) \/ W \( t \, n \) =
    o \( d^(- 1 \/ 2) \)$. These coefficient errors are bounded together by the level increment for sufficiently
    large $D$, proving (H).
  To prove (G), the sparse or trivial case needs no recursion.
    Otherwise use $mu = hat(lambda)$, the canonical hook truncation.
    If its removed count is high, apply (H) just proved, using (90) (its parameters $M = m = n \, theta =
    lambda$) to absorb $b_l W$ into the dimension gain times $A_l$.
    If it is not high, use (86) once with only child (G), bounding each $e_(alpha_g) + J \( h_g \, m_g \) lt.eq
    A S_g + \( A + 1 \) W_g$. The penalty again controls the structural sum. Thus
  $ e_lambda lt.eq A B_lambda + \( A + 1 \) W \( t \, n \) + C \( t + n^eta \) $
  by dimension nondecrease. Here $t < n^(1 - u)$ and (89) applies to $lambda$,
    making the extra divided by $B_lambda$ at most $C \( n^(- \( u - delta \)) log n + n^(eta - 1 + delta) \) =
    o \( d^(- 1 \/ 2) \)$. This proves (G).
  In these steps $D$ can be chosen once: the sufficiently-large size thresholds hold also for $m gt.eq
    2^(d \/ 3)$ as needed, and the displayed little-oh errors (with absolute bounds independent of levels and $p
    gt.eq p_0$) can be made smaller, including the indicated sums,
    than $d^(- 1 \/ 2) lt.eq \( 2^(l - 1) D \)^(- 1 \/ 2)$ for all $d > D$.
    Sizes already treated retain (87) when increasing the constants.
    This completes the simultaneous induction with an absolute fixed $p$. ◻
]

===== 2.5.7 Full-deck amplification <full-deck-amplification-1>

For a positive integer $z$, Schatten Hölder gives $parallel B_n^z parallel_(upright("HS"))^2 lt.eq
  "tr" \( \( B_n^(*) B_n \)^z \)$ in each irreducible (use Schatten exponent $2 z$ on each factor).
  Take $z = 4 p$. In the nonsparse positive-trace types, this trace is at most $cal(L)_lambda^4$,
  so its product with $D_lambda$ is at most $exp \( - B_lambda \)$ by (G) and $A_l < 1 \/ 2$.
  Their sum tends to zero by (89) and the Durfee-square bound on the number of partitions.
  In the nontrivial sparse types use just the trace at $p$ as upper bound (sweep norm at most 1),
  giving products at most $n^(- 2 k)$ by (88), summable to $o \( 1 \)$ since there are at most $2^k$ tail
  partitions of size $k$. Zero traces contribute nothing.

Shuffle distributions act the same on positions from any starting deck;
  uniform orders correspond to uniform permutations. At $z d$ shuffles the position law is $B_n^z$, $n = 2^d$.
  Finite group Plancherel (or the regular trace applied to the squared norm of the group-algebra difference from
  uniform) identifies $n !$ times the coefficient-wise squared distance with $sum_(lambda eq.not \( n \)) D_lambda
  parallel B_n^z parallel_(upright("HS") \, lambda)^2$. By Cauchy–Schwarz its total variation distance from
  uniform is at most one half the square root of this sum, which tends to zero. This gives the upper mixing bound.

===== 2.5.8 An alternative recurrence proof through weight projections <an-alternative-recurrence-proof-through-weight-projections>

For completeness, we now derive (86) by a second overlap mechanism.
  The preceding induction used the general full-isotypic recurrence.
  The argument here instead resolves the global hook type into torus weights and extracts its entropy from those
  weights. We retain the notation $B_theta = log D_theta$, the grid and marked counts in (86),
  and the fixed power-of-two square-moment index $p$.

====== 2.5.8.1 Graded tensor density estimates <graded-tensor-density-estimates>

For an integer $K gt.eq 1$ let $V = E xor O$ be an orthogonal sum of an even and an odd space,
  each of dimension $K$. On $H_k = V^(⊗ k)$ use the signed slot permutations:
  when permuting homogeneous factors the sign is that of the reordering of the odd factors.
  This gives a unitary $S_k$-action (successive reorderings multiply the signs), commuting with $U \( E \) times
  U \( O \)$ acting diagonally over the slots. Reordering the slots by a signed permutation conjugates tensor
  products of parity-preserving slot operators to their ordinary reordered products:
  the sign correction commutes with operators preserving each slot’s parity.
  Subgroup actions on disjoint subsets of slots become ordinary tensor products of the respective signed actions
  after grouping the subsets by such a reordering.

Let $Pi_theta$ denote the $S_k$-isotypic projection and $w_theta$ the multiplicity in $H_k$.
  Call the $K$-hook condition $theta_(K + 1) lt.eq K$. In the next estimates take $n gt.eq 2 \, med K \, k lt.eq
  n$. For a count vector $u$ of sum $k$, put

$ H \( u \) = k log k - sum_j u_j log u_j $

with zero contributions at zero (also $H = 0$ if $k = 0$).
  A weight subspace refers to the span of tensors with a given count vector in an orthonormal parity basis.
  With absolute constants $C$ (which can be increased), the following hold:

- $w_theta > 0$ exactly under the $K$-hook condition, and then $w_theta lt.eq \( n + 1 \)^(3 K^2)$.
- In any parity basis the range of $Pi_theta$ lies in the sum of weight subspaces with $H \( u \) gt.eq B_theta -
  C K^2 log \( 2 n \)$.
- For each occurring $theta$ there is an average over parity-preserving density matrices $rho$ (positive
  semidefinite, trace 1) on $V$ such that in the positive semidefinite order,
  #[#set math.equation(numbering: n => "(91)")
   $ Pi_theta med lt.eq med exp \( B_theta + C K^2 log \( 2 n \) \) thin bb(E) thin rho^(⊗ k) .
     $ <ten:simultaneous:eq:3>]

For the first fact, decompose into subspaces with fixed basis counts.
  Each is an induced monomial representation from the word stabilizer with trivial characters on even label groups
  and sign characters on odd ones. By Pieri, summing the multiplicity over counts amounts to counting chains
  ending at $theta$ that add first $K$ horizontal strips then $K$ vertical strips (sizes can be zero).
  The even stages have at most $K$ rows; the odd stages have cells below the top $K$ rows only in the first $K$
  columns. This proves the necessity, and one can build a fitting $theta$ by its first $K$ rows then by the
  columns below. The shapes (hence also strip sizes) are determined by at most $K$ row lengths at each even stage
  and the first $K$ row and first $K$ column lengths at each odd stage, giving the bound.

Alternatively, at fixed numbers of even and odd slots the representation is induced, by varying their locations,
  from tensor powers of $E$ and $O$ in the individual fixed parity pattern (one can use all even first);
  the latter power is sign-twisted for the slot permutations.
  Schur–Weyl in that pattern then gives $U \( E \) times U \( O \)$-types indexed by $xi \,
  zeta$ each of length $lt.eq K$, sizes summing to $k$, paired with $\[ xi \]$ and (after twisting) $\[ zeta' \]$.
  The unitaries commute with inducing over locations, so an $S_k$-type $theta$ is compatible with these types only
  if $c_(xi \, zeta')^theta > 0$, an LR coefficient (prime denotes conjugation). In this case

#[#set math.equation(numbering: n => "(92)")
 $ 0 lt.eq theta_i - xi_i lt.eq K \, wide 0 lt.eq theta'_j - zeta_j lt.eq K . $ <ten:simultaneous:eq:4>]

In fact $xi subset.eq theta$ and in an LR tableau of $theta \/
  xi$ each row has length at most the first count $\( zeta' \)_1 lt.eq K$.
  To see the row bound, let $C_j$ be the counts before reading the row in the lattice word (read right to left),
  and $d_j$ the counts in the row. Weak row increase and the lattice condition give $d_j lt.eq C_(j - 1) -
  C_j$ for $j gt.eq 2$, so the length is at most $d_1 + C_1$.
  Conjugating the coefficient (sign twist) and using symmetry gives the column bound.

For fitting $theta$ set $a_i = theta_i \, med b_j = \( theta'_j - K \)_(+)$ for $1 lt.eq i \, j lt.eq K$;
  together these counts cover the cells. The hook formula gives

$ B_theta lt.eq H \( a \, b \) lt.eq B_theta + C K^2 log \( 2 n \) . $

Indeed the hook product is at least $product a_i ! product
  b_j !$ by counting to the right in the top rows and downwards below them.
  For an upper bound, corner hooks (in the $K times K$ square) are at most $n$.
  Arm hooks to its right have product in row $i$ at most $a_i !$ (add at most $K$ to the right-count plus one
  there), and leg hooks below have product in column $j$ at most $\( b_j + K \) ! \/ K ! lt.eq b_j ! \( 2 n \)^K$.
  Finally log multinomial for these counts is at most their $H$ and within $O \( K log \( 2 n \) \)$ of it by $log
  z ! = z log z - z + O \( log \( 2 n \) \)$ for $0 lt.eq z lt.eq n$.
  By (92), each of $a_i \, b_j$ differs from the respective $xi_i \, zeta_j$ by at most $K$.
  So $H \( xi \, zeta \)$ (concatenating the counts) is within $C K^2
  log \( 2 n \)$ of $H \( a \, b \)$ (per unit change of an integer $z$, $z log z$ changes by at most $1 +
  log \( 2 n \)$). Weights of these unitary types are majorized by $xi \, zeta$ respectively:
  by the semistandard tableaux formula any $i$ symbols fill at most $sum_(j lt.eq i)
  xi_j$ cells since columns are strict, and similarly for $zeta$.
  By convexity (majorization inequality) their combined $H$ is at least $H \( xi \, zeta \)$.
  This proves the weight assertion, unchanged on rotating by the parity unitaries.

For (91), for a compatible unitary type and $k > 0$ take the diagonal density matrix with entries
  $\( xi_i \/ k \, zeta_j \/ k \)$ and conjugate uniformly by the parity unitaries.
  Before conjugation its tensor power acts by scalars on weights,
  with eigenvalue $exp \( - H \( xi \, zeta \) \)$ on the highest weight of that type (zero entries with exponent
  zero contribute 1). It preserves every unitary submodule (it is a linear combination of weight projections,
  which preserve them by torus averaging); the conjugates do also.
  Thus, in an orthogonal unitary-module decomposition, on each irreducible copy of the given type its conjugation
  average is scalar at least this eigenvalue divided by the type dimension (by the trace there and Schur’s lemma),
  and on the other modules positive semidefinite. That dimension is at most $\( 2 n \)^(C K^2)$ by the Weyl
  dimension formula, and there are at most $\( n + 1 \)^(2 K)$ types.
  The isotypic projection $Pi_theta$ is bounded by the sum of the compatible unitary-type projections.
  Averaging the densities over these choices as well (absorbing their count in the coefficient),
  and using the upper estimate on $H \( xi \, zeta \)$, proves (91).
  In size zero the assertions use the scalar tensor power and a parity-preserving density can be chosen arbitrarily.

====== 2.5.8.2 Overlap on a grid with missing cells <overlap-on-a-grid-with-missing-cells>

Here is the overlap estimate on this tensor space that will apply within the recursion.
  Use an $s$-by-$r$ grid, $n = r s gt.eq 2 \, med K lt.eq n$, with $t$ arbitrary holes and $M = n -
  t$ remaining slots, using $H_M$. Let $mu tack.r M$ satisfy the $K$-hook condition.
  Index rows and columns together by $g$. In each take a positive semidefinite group-algebra operator on its
  remaining slots supported on a single partition type $delta_g$, with trace on $\[ delta_g \]$ at most $c_g$;
  we can assume the type occurs in the graded tensor power there.
  Let $A$ be the product for rows, $B$ the product for columns (using the subgroup actions in $S_M$).
  Put $S = sum_g B_(delta_g)$. Then

#[#set math.equation(numbering: n => "(93)")
 $ "tr"_(H_M) \( Pi_mu A Pi_mu B \) med lt.eq med w_mu #scale(x: 180%, y: 180%)[\(] product_g c_g
   #scale(x: 180%, y: 180%)[\)] exp #h(-0.16667em)
   (C \( \( s + r + 1 \) K^2 log \( 2 n \) + t \) + min \( 0 \, S - B_mu \)) . $ <ten:simultaneous:eq:5>]

One bound uses $parallel B parallel thin "tr"_(H_M) A$: the column norms are at most $c_g$,
  and the row traces contribute at most $c_g w_(delta_g)$ each. This gives the bound without the $min$ term.

For another bound replace both operators by their isotypic projections times the norm bounds,
  using positivity with $Pi_mu$ inserted (each replacement traces against a positive semidefinite operator by
  cyclicity). Write the products of projections as $P_A \, P_B$;
  after the factors $product c_g$ the trace left to bound is $"tr" \( P_A Pi_mu P_B Pi_mu \)$.
  Replace first $P_A$ by (91) in the rows (tensoring the bounds), giving, apart from coefficients,
  an average of product states $R$ with one density $rho_i$ used throughout the remaining cells of row $i$.
  For each such term diagonalize $macron(rho) = s^(- 1) sum_i
  rho_i$ in a parity basis (extend by arbitrary parity-preserving densities for empty rows).
  We have $Pi_mu lt.eq Z = sum_u Z_u$, the sum of weight projections in that basis obeying the weight assertion
  for $mu$. The positive $P_B$ commutes with both $Pi_mu$ and $Z$ (centrality for the former,
  torus commutation for the latter), so $Pi_mu P_B Pi_mu lt.eq Z P_B Z$.
  Now similarly replace $P_B$ giving product states $Q$ with parity-preserving densities $sigma_j$ by column
  (extended for empty ones). Signed reorderings back to the joint slot order give the ordinary product states as
  the slot matrices preserve parity. The row and column coefficients from (91) together cost
  $exp \( S + C \( s + r \) K^2 log \( 2 n \) \)$.

We bound $"tr" \( R Z Q Z \) = parallel R^(1 \/ 2) Z Q^(1 \/ 2) parallel_(upright("HS"))^2$ using each $Z_u$.
  This projection is the torus Fourier integral of $g^(⊗ M)$ with unit-modulus multiplier,
  over diagonal phases $g$. Put $X = \( macron(rho) + epsilon I \)^(- 1 \/ 2)$, $epsilon > 0$,
  with diagonal entries $x_l$. In this integral we can insert $X^(⊗ M)$ dividing by $product_l x_l^(u_l)$,
  since $X^(⊗ M) Z_u = \( product_l x_l^(u_l) \) Z_u$. By the norm triangle inequality we then use the integrand
  estimate

$ parallel R^(1 \/ 2) \( X g \)^(⊗ M) Q^(1 \/ 2) parallel_(upright("HS"))^2 =
  product_(\( i \, j \) med upright("remaining")) "tr" \( X rho_i X g sigma_j g^(*) \) lt.eq e^t . $

Indeed these nonnegative factors have sum over the entire extended grid at most $n$,
  by averaging to $X accent(rho X, ‾) lt.eq I$ and the averaged trace-one column density.
  On the remaining grid apply arithmetic-geometric means and $M log \( n \/ M \) lt.eq t$ (empty product if $M =
  0$). Also

$ product_l x_l^(- 2 u_l) lt.eq \( 1 + 2 K epsilon \)^M exp \( - H \( u \) \) \, $

by normalizing the entries of $macron(rho) + epsilon I$ to probabilities (the product is maximized then at
  frequencies $u_l \/ M$; for $M = 0$ the inequality is trivial). Let $epsilon$ decrease to zero.
  There are at most $\( n + 1 \)^(2 K)$ projections in the sum,
  so summing norms and squaring gives the penalty $exp \( - B_mu + C K^2 log \( 2 n \) + t \)$.
  This proves the second bound. Together they imply (93), where a factor $w_mu gt.eq 1$ has been allowed.

====== 2.5.8.3 Recovering the marked trace recurrence <recovering-the-marked-trace-recurrence>

We use the balanced grid and the arbitrary parent hook $mu$ from (86).
  Thus $X$ is the product of row sweeps and $Y$ the product of column sweeps, with $B_n = Y X$;
  $g$ ranges over both families of lines. The following calculation proves that recurrence using the overlap just
  established.

First, by a trace power inequality in $\[ lambda \]$,

$ cal(L)_lambda lt.eq "tr"_lambda #scale(x: 120%, y: 120%)[\(] \( X X^(*) \)^p \( Y^(*) Y \)^p
  #scale(x: 120%, y: 120%)[\)] . $

We use $"tr" \( \( B^(1 \/ 2) A B^(1 \/ 2) \)^p \) lt.eq "tr" \( B^(p \/ 2) A^p B^(p \/ 2) \)$ with $B =
  X X^(*) \, A = Y^(*) Y$ and the polar decomposition for $X$.
  For the powers of 2 this instance of the trace inequality can be seen as follows.
  For positive definite $A \, B$, products of the top $j$ eigenvalues of $A B$, squared,
  are bounded by products of the top $j$ eigenvalues of $A^2 B^2$.
  Indeed take the $j$-th exterior power of $A B$, bounding spectral radius by operator norm,
  whose square gives the top eigenvalue of the exterior power of $B A^2 B$.
  All eigenvalues used are positive and $B A^2 B$ has the eigenvalues of $A^2 B^2$.
  Iterate squaring; equality of the full products holds by determinant.
  Thus logs of the eigenvalues of $A B$, multiplied by $p$, are majorized by the logs for $A^p B^p$;
  sum the exponentials. This proves the inequality and a limit gives the semidefinite case.

The powered elements on the right factor by groups because disjoint group operations commute within each part.
  Expand by multiplying in each group by its central isotypic projectors and summing.
  Each term has positive semidefinite row and column operators separately,
  products of group-algebra operators supported on $alpha_g$ with trace $cal(L)_(alpha_g)$ on that type (either
  orientation of the power gives the same trace).

To bound a term, augment the even tensor alphabet for the $K_n$-construction by $t$ distinct marks,
  each required to occur once, the rest of the slots from the usual $V$. In addition keep only core type $mu$:
  in each placement $z$ of the ordered marks use the isotypic subspace $Pi_mu H_M$ in the unmarked slots,
  ordered by position. This direct sum $cal(K)$ over placements is invariant under signed $S_n$;
  the even marks add no signs and each map of placements acts by the induced (signed) reordering on core slots.
  It is the induced module from the one-placement space for the mark stabilizer $S_M$ (its translates over the
  cosets are exactly the placement summands). In particular the multiplicity of $lambda$ is $w_mu
  f^(lambda \/ mu) > 0$ by reciprocity and branching. The term’s trace in $\[ lambda \]$ is at most its trace on
  $cal(K)$ divided by that multiplicity, since all irreducible traces of a product of two positive semidefinite
  operators are nonnegative here.

In this last trace insert the placement-space projections between operators.
  Only diagonal placement blocks of each operator contribute:
  initial and intermediate placements in the two maps making a return must agree on each mark’s row by the row
  operator, and on each mark’s column by the column operator, hence agree entirely.
  On the diagonal block for placement $z$, with $h_g$ marks in group $g$,
  we retain in each group-algebra factor just the coefficients on the subgroup fixing those slots pointwise.
  It acts on the $m_g - h_g$ core slots there, commuting (as an operator in the whole core permutation algebra)
  with $Pi_mu$. Thus this placement trace has $Pi_mu$ inserted with both products of truncated operators on $H_M$.
  Coefficient truncation to this subgroup preserves positivity,
  as seen by compressing the regular representation to the subgroup.
  It is supported only on types $delta_g subset.eq alpha_g$:
  for an absent restriction type the original element times the subgroup type projector vanishes,
  and coefficient truncation commutes with right multiplication by subgroup elements.
  Its trace in $\[ delta_g \]$ is at most

$ c_g = frac(D_(alpha_g) cal(L)_(alpha_g), \( m_g \)_(h_g) D_(delta_g)) . $

In fact regular trace is group size times the identity coefficient,
  so the subgroup regular trace equals the original $D_(alpha_g) cal(L)_(alpha_g)$ divided by $\( m_g \)_(h_g)$.
  Now sum over core types by using their central projectors in these subgroup elements,
  needing only types occurring on the tensor powers.

We may apply (93) on each placement for these terms. Substituting $c_g$, the bound there has logarithm at most

$ log w_mu + sum_g e_(alpha_g) - sum_g log \( m_g \)_(h_g) - max #scale(x: 120%, y: 120%)[\(] B_mu \,
  sum_g B_(delta_g) #scale(x: 120%, y: 120%)[\)] + C \( \( s + r + 1 \) K_n^2 log \( 2 n \) + t \) . $

For fixed counts, the placements number at most the product of the multinomial counts assigning rows and assigning
  columns to the $t$ distinct marks. In each branch the multinomial is at most
  $exp \( t log t - sum_(g med upright(i n med b r a n c h)) h_g log h_g \)$ (use category probabilities $h_g \/
  t$ if $t > 0$). The log of the product together with the negative falling-factorial logs costs at most

$ 2 t log t - sum_g h_g log h_g - t log n + 2 t = sum_g J \( h_g \, m_g \) - 2 J \( t \, n \) + 2 t . $

Here $\( m \)_h gt.eq \( m \/ e \)^h$ by the geometric mean of the largest $h$ factors of $m !$,
  and zero-log terms use the previous conventions. Counts of all vectors of partitions $alpha_g \,
  delta_g$ and counts vectors themselves have log at most $C n^(3 \/ 4) log \( 2 n \)$:
  a partition in size at most $m_g$ can be specified by the lengths along the sides of its Durfee square (top rows
  and first columns) using at most $2 sqrt(m_g)$ lengths plus the square size,
  and one more entry suffices for $h_g$; $r \, s$ are within a constant factor of $sqrt(n)$.
  All the sublinear powers times logs in these errors are bounded by $C n^eta$.

Finally

$ D_lambda lt.eq binom(n, t) D_mu f^(lambda \/ mu) \, $

by assigning entries of a standard tableau to the two regions and ignoring their boundary conditions.
  Also $log binom(n, t) lt.eq J \( t \, n \) + t$. Thus after division by $w_mu f^(lambda \/ mu)$,
  adding $B_lambda + J \( t \, n \)$ to the log trace bound cancels the $-
  2 J \( t \, n \)$ at cost at most $B_mu + t$. This gives (86).
  Zero terms can be omitted; the choices needed in the max are nonempty when the parent trace is positive,
  by the trace bounds leading to it.

==== 2.6 Inverse-density interpolation for marked spin traces <ten:inverse>

This argument proves a grid moment estimate with the full marked-site entropy cost.
  Its operator comparison must be performed before the column operator is split into local sectors.
  The subsequent interpolation treats products of noncommuting density matrices in their original order.

All notation introduced below is local to this section. Traces are unnormalized, logarithms are natural,
  and a sweep on $2^d$ positions takes $d$ physical shuffles. The conventions are those of Section 1.

===== 2.6.1 The sweep moments <the-sweep-moments>

Use the sweep $B_n$ of Section 1, with $n = 2^d gt.eq 2$.
  For a one-position grid factor set $B_1 = I$, the empty product of coordinate layers.
  There is a grid decomposition for $n = a b$ with $a \, b$ powers of two.
  Take $a$ rows of length $b$, so the first axes of the sweep are inside rows and the remaining ones inside
  columns. Then $B_n = C R$, where $R$ is a tensor product in the row permutation subgroup of $a$ copies of $B_b$,
  and $C$ is analogously made from $b$ copies of $B_a$ in the column subgroup.

We use unitary representations. For a diagram (partition) $lambda$ of $m$, write $D_lambda =
  f^lambda$ for the dimension of the corresponding irreducible of $S_m$, $H_lambda = log D_lambda$ (logs natural).
  Use dimension 1 for the empty diagram; $f^(lambda \/ omega)$ counts standard tableaux of the indicated skew
  shape. The moments used in the proof are

$ J_m \( lambda \, p \) = D_lambda thin upright("Tr")_lambda \| B_m \|^p \, wide \| A \| = \( A^(*) A \)^(1 \/ 2) . $

Here and below a trace with diagram subscript is in one copy of the irreducible.
  We prove bounds for these moments with bounded $p$. We use standard representation theory of symmetric groups:
  in particular the branching rule, Schur-Weyl duality, the Littlewood-Richardson (LR) rule,
  and the hook length formula. Matrix inequalities used below include the Araki-Lieb-Thirring trace inequality
  (for positive matrices $L \, M$ and $v gt.eq 1$, $upright("Tr") \( L^(1 \/ 2) M L^(1 \/ 2) \)^v lt.eq
  upright("Tr") \( L^v M^v \)$, trace of powers on the left) and Schatten Hölder.

Roughly, at sparse levels we use the small probability of path encounters for all the cards on which there must be
  nontrivial dependence. At the other levels we propagate trace-moment bounds from the rows and columns.
  In that argument a spin representation (with two parities so as to cover both long rows and long columns of a
  diagram), augmented by distinct marks, permits testing for global permutation types with losses that combine
  well in entropy scale.

===== 2.6.2 The optimized hook budget <the-optimized-hook-budget>

The grid estimate will be used with a hook that grows with the deck. Fix

$ epsilon.alt = 1 / 1000 \, wide c_0 = 1 / 100 \, wide theta = 1 / 2 \, wide Q_m = floor.l m^(1 \/ 16) floor.r . $

For a partition $xi tack.r m$, define

$ G_m \( xi \) = min_(alpha subset.eq xi\
alpha_(Q_m + 1) lt.eq Q_m) {theta H_alpha + c_0 \( m - \| alpha \| \) log m - \( m - \| alpha \| \) log
  frac(m, m - \| alpha \|)} \, $

where the last term is zero when $\| alpha \| = m$. Call $xi$ large-level when $m - xi_1 > m^(1 - epsilon.alt)$.
  The minimum retains the full, unclipped entropy cost of the deleted positions;
  at the other levels we will use a separate sparse estimate.

#thm([Proposition 2.15.])[
  (Bounded exponents for the inverse-density budget).  #emph[There are real exponents $p_d gt.eq 2$,
    with $sup_(d gt.eq 1) p_d < oo$, such that for every $d gt.eq 1$ and every $lambda tack.r n = 2^d$,
$ log J_n \( lambda \, p_d \) lt.eq
  cases(delim: "{", G_n \( lambda \) \, & n - lambda_1 > n^(1 - epsilon.alt) \,, 0 \, & n - lambda_1 lt.eq n^(1 -
  epsilon.alt) .) $

 For all sufficiently large $n$, the second bound strengthens to $log J_n \( lambda \, p_d \) lt.eq -
   10 k log n$ when $1 lt.eq k = n - lambda_1 lt.eq n^(1 - epsilon.alt)$.]
] <s:inverse-bounded-exponent>

The sparse path estimate proves the second branch. For the first branch,
  we prove a marked-grid estimate at a prescribed parent hook, extend the child budgets to that inherited hook,
  and absorb the resulting error by a bounded increase in the Schatten exponent.
  The grid estimate is also the fixed-parameter consequence of Corollary 23;
  the proof here retains the alternative calculation with an ordered product of inverse densities.

===== 2.6.3 Sparse path forests <sparse-path-forests>

Let $k = m - lambda_1$, using $lambda_i$ for row lengths.
  For an absolute $epsilon.alt > 0$ fixed at $1 \/ 1000$, all sufficiently large $m$, and $1 lt.eq k lt.eq
  m^(1 - epsilon.alt)$, we have

#[#set math.equation(numbering: n => "(94)")
 $ J_m \( lambda \, p \) lt.eq m^(- 10 k) $ <ten:inverse:eq:1>]

for $p$ larger than an absolute constant. Here are details of a contraction giving this estimate.

Use ordered $k$-tuples of distinct positions, containing the representation $lambda$ by branching (and in
  particular $D_lambda lt.eq m^k$). Here this module is induced from the trivial representation of $S_(m - k)$,
  since that is the stabilizer. In this module every copy of $lambda$ is in the orthocomplement of the subspaces
  of functions omitting any one coordinate: the $\( k - 1 \)$-tuple module has no copy.
  Thus such functions sum to zero over each coordinate given all others.
  In a one-sweep transition between distinct tuples $x \, y$,
  use the candidate paths on the cube that take their successive updated bits from $y$, starting at $x$.
  For each pair $i \, j$, let $h_(i j) = 0$ unless their paths at an update are at opposite sites of a common gate
  (matched pair), at the axis of their last starting-bit difference in update order.
  In the latter case set $h_(i j) = 1$ if they take opposite exits and $- 1$ if they take the same exit.
  The transition probability is

$ m^(- k) F_(\[ k \]) \, wide F_L = product_(i < j med upright("in") med L) \( 1 + h_(i j) \) . $

Indeed any path conflict must first arise at a common gate with different entry sites,
  then necessarily at the indicated axis for that pair if this is their first conflict.
  With no conflicts, each gate used twice saves a factor of two in probability.
  Also $m^(- k) F_L$ is the path probability for true sweep paths on coordinates of $L$ with independent fair-bit
  paths on all others (restricted here to distinct endpoints).

For the action on zero-sum functions as above we may replace $F_(\[ k \])$ in the expectation kernel (from earlier
  $x$ to later $y$) by $G = sum_(L subset.eq \[ k \]) \( - 1 \)^(k - \| L \|) F_L$,
  since for every proper subset the sum against such a function in $y$ vanishes by summing a missing coordinate
  first. This alternating sum cancels by toggling inclusion of any isolated vertex,
  so it is zero unless in the interaction graph ($h_(i j) eq.not 0$ edges) there are no isolated vertices.
  Use this replacement at the later of two successive sweeps when taking the expectation of a function of the
  final tuple. The orders of the two sweeps need not agree.
  For the sup norm contraction it suffices to bound, uniformly in the start and $L$,
  the probability of this covering event after the first true sweep and then the $F_L$ experiment for the second
  sweep, paying a factor $2^k$. We need only upper bound the event,
  so can drop the distinct-endpoint requirement of that experiment, testing if every path shared some gate with another.

After the first sweep the random occupied $k$-set $U$ satisfies

$ Pr \( V_0 subset.eq U \) lt.eq \( k \/ m \)^(\| V_0 \|) $

for each set $V_0$. In fact the inequality bounding joint inclusion probability by the product of one-site
  marginals holds starting from a fixed set and persists after independent fair matching switches:
  average the old product bound over the switches on pairs.
  On a fully tested pair the product of old marginals is at most the square of their mean.
  And the sweep makes the one-site marginals constant.

Generate the following graph independently of $U$ on all $m$ sites.
  At each site start two potential paths, one using a common random sweep switching system,
  the other having its own independent random fair-bit path.
  Join sites if any two paths (one from each) share a gate at the same update,
  allowing any choices of their two types. Regardless of the coordinate labeling of $U$,
  the second experiment can use a path of the requested type at each site,
  so our event requires $U$ to induce a graph with no isolates.

Such a graph contains a spanning forest without singleton components.
  For a fixed forest on $k$ indices with $j$ edges, the expected number of #emph[ordered distinct] site placements
  realizing all its edges is at most $m^k \( 8 log_2 m \/ m \)^j$.

To count, condition on the common switching system, sum over which of the two paths at each endpoint and which
  layer on each edge witnesses the encounter, and upper bound distinct placements by iid uniform placements times
  $m^k$, using separate independent tapes for the private type per index (correct for distinct placements).
  Before imposing edge constraints the individual two-type records of positions are then independent across
  indices and each path has uniform one-site marginals. Peeling leaves gives probability at most $\( 2 \/ m \)^j$
  for those constraints. Using the joint inclusion bound and dividing the labeled count (summed over forests) by
  $k !$, since a successful induced graph has some witnessing forest for #emph[each] indexing of the occupied
  sites, the required sup norm contraction is bounded by

$ 2^k frac(k^k, k !) sum_(ceil.l k \/ 2 ceil.r lt.eq j lt.eq k - 1) binom(binom(k, 2), j) \( 8 log_2 m \/ m \)^j . $

For the empty sum use zero. Use one forward and one adjoint sweep so this bounds the spectral radius of $B_m^(*)
  B_m$ on the indicated isotypic space by the sup norm estimate (permutation action on functions,
  or expectations for the self-adjoint kernel). For large $m$ in the range of (94) the bound is at most
  $m^(- epsilon.alt k \/ 3)$ since $binom(binom(k, 2), j) lt.eq \( O \( k \) \)^j$.
  Thus the singular values there are at most $m^(- epsilon.alt k \/ 6)$, proving (94) by the dimension bound.

Two other dimension facts we use are as follows. If $lambda$ has more than $m \/ 2$ rows,
  even one axis update annihilates it: matching-swaps invariants occur only for diagrams dominating the partition
  made from $m \/ 2$ parts of size 2, by Young’s rule. For remaining $lambda$, if $k > m^(1 - epsilon.alt)$,
  then $H_lambda gt.tilde m^(1 - epsilon.alt)$ for large $m$.
  Indeed if $k lt.eq m \/ 4$, the hook formula gives $D_lambda gt.eq e^(- 1) binom(m, k)$:
  the leg corrections to first-row hook lengths inflate their product over $lambda_1 !$ by at most
  $exp \( k \/ \( lambda_1 - lambda_2 + 1 \) \)$. Otherwise width and height are both at most $3 m \/ 4$.
  If their sum is at most $m \/ \( 2 e \)$, the hook formula suffices.
  Else transpose if necessary to have first row $s gt.eq m \/ \( 4 e \)$,
  and restrict to a subshape with first row $s$ and another $floor.l s \/ 4 floor.r$ cells,
  using the previous first-row argument and branching.

===== 2.6.4 The spin and marked-site estimate <the-spin-and-marked-site-estimate>

#thm([Proposition 2.16.])[
  (Marked-grid moment estimate).  #emph[Say that a diagram fits the $q$-hook if all cells belong to its first $q$
    rows or its first $q$ columns. Write $e_m \( l \) = l log \( m \/ l \)$, with $e_m \( 0 \) = 0$.
    Fix $theta = 1 \/ 2$, $c_0 = 1 \/ 100$. Consider $n = a b gt.eq 2$, where $a \,
    b$ are powers of two with $log_2 a \, log_2 b$ differing by at most one, and $q lt.eq
    n^(1 \/ 16)$ a positive integer. Let $p gt.eq 2$ be real and let $cal(B)_a \, cal(B)_b gt.eq 0$.
    Suppose that, for each $m in { a \, b }$, every diagram $xi tack.r m$,
    and every $q$-hook subdiagram $eta subset.eq xi$ of size $m - l$,
#[#set math.equation(numbering: n => "(95)")
 $ log J_m \( xi \, p \) lt.eq cal(B)_m + theta H_eta + c_0 log \( m \) l - e_m \( l \) \, $ <ten:inverse:eq:2>]

 using $- oo$ for log zero. Then for every $lambda tack.r n$ and every $q$-hook subdiagram $omega subset.eq
   lambda$ of size $g = n - t$,
#[#set math.equation(numbering: n => "(96)")
 $ log J_n \( lambda \, p \) lt.eq theta H_omega + c_0 log \( n \) t - e_n \( t \) + a cal(B)_b + b cal(B)_a +
   O #scale(x: 120%, y: 120%)[\(] t + \( a + b \) \( q^2 + n^(1 \/ 4) \) log \( n + 1 \)
   #scale(x: 120%, y: 120%)[\)] \, $ <ten:inverse:eq:3>]

 The implicit constant is absolute.]
] <ten:inverse:main>

If one grid factor has size $1$, balance and $n gt.eq 2$ force $n = 2$, and the other factor has size $m = n$.
  Apply (95) to that factor with $\( xi \, eta \, l \) = \( lambda \, omega \, t \)$.
  The allowance in (96) is $cal(B)_2 + 2 cal(B)_1$, so the conclusion already holds with zero error because
  $cal(B)_1 gt.eq 0$. We may now assume $a \, b gt.eq 2$.

To prove this, in the irreducible $lambda$ bound $upright("Tr")_lambda \| C R \|^p$ by $upright("Tr")_lambda X Y$,
  where $X = \| R^(*) \|^p \, med Y = \| C \|^p$, by Araki-Lieb-Thirring and cyclic invariance for the trace of
  powers. These are positive subgroup elements, each a tensor product.
  They may each first be split into a sum by the diagrams $xi$ on the local symmetric groups (compressions by
  central subgroup isotypic projections). Use $X \, Y$ also for a fixed resulting pair of terms,
  still positive group algebra elements.

Use an induced module of cell states as follows. There are $t$ distinct labeled holes, one site each,
  and the other $g$ sites carry spins with value space $V = V_(+) xor V_(-)$ (dimensions $q \, q$).
  Site permutations act by permuting and using the sign on the odd spins, i.e.
  a relative-order sign on the $V_(-)$ factors in the usual graded tensor permutation.
  Holes are even, without signs. Equivalently one takes a direct sum over hole positions and plus/minus patterns,
  transporting the spin tensors by permutations with that sign.
  Projection to one placement $z$ of labeled holes is denoted $D_z$, leaving free spins.
  In products computed with reordered site factors the graded reordering is a unitary identification;
  all subgroup operations within disjoint blocks preserve grading and act as usual tensor products after grouping
  their sites.

With chosen plus and minus counts and local Schur-Weyl types $alpha \, beta$ for the two spin spaces,
  spectra on these types correspond to highest weights $alpha \, beta$, both of length $lt.eq q$.
  For $s$ spins, the permutation module on this sector consists (apart from the general-linear representation
  spaces) of induction from the symmetric-group types $alpha \, beta'$, with prime denoting transpose,
  by the odd-factor sign. In the presence of $l$ additional labeled holes the whole representation induces further
  from $S_s$ to $S_(s + l)$.

Choose a global sector of this kind with plus type $mu$ made of the first $q$ rows of $omega$ and minus type $nu$
  the transpose of the remaining rows. Write $Z$ for its orthogonal projector (full isotypic under the
  block-unitary or equivalently general-linear action). The spin module within $g$ sites contains $omega$,
  since $c_(mu \, nu')^omega gt.eq 1$ by the LR rule (the skew part $omega \/
  mu$ just consists of the lower rows). With the holes the sector thus has $lambda$-multiplicity at least
  $f^(lambda \/ omega)$ by branching. Also

$ D_lambda lt.eq binom(n, t) D_omega f^(lambda \/ omega) $

by splitting standard tableau fillings into these two cell sets. Let $P_lambda$ denote the global group-type projector.

We detail the trace estimate on this module. For any block-diagonal positive definite spin density $D$ of trace 1
  (blocks for $+ \, -$), put $h = D^(- 1)$, with $h_(\[ g \])$ acting by $h$ on all spins,
  same matrix independent of which sites, and identity transport (no change) on hole locations.
  On the sector $Z$, $h_(\[ g \])$ has minimum eigenvalue $gt.eq exp \( J \)$, where

$ J = g thin sans(H) #scale(x: 120%, y: 120%)[\(] \( mu_i \/ g \)_i \, \( nu_j \/ g \)_j #scale(x: 120%, y: 120%)[\)] $

and $sans(H)$ is Shannon entropy in natural logarithms (use $J = 0$ for $g = 0$).
  In fact weights in each general-linear representation are majorized by its highest weight,
  so the maximum eigenvalue of the density power on the sector is bounded by its product of sorted block
  eigenvalues raised to highest-weight powers, which is at most $exp \( - J \)$ by the entropy/product inequality
  with eigenvalues summing in total to 1. The multinomial bound gives $e^J gt.eq
  binom(g, \| mu \|) D_mu D_nu gt.eq D_omega$. Thus with $u = 1 - theta$,

#[#set math.equation(numbering: n => "(97)")
 $ Z P_lambda lt.eq D_omega^(- u) h_(\[ g \])^u . $ <ten:inverse:eq:4>]

Both sides commute with group algebra elements.

===== 2.6.5 Local polynomial dimensions <local-polynomial-dimensions>

Some local polynomial factors used below are recalled here.
  On $s lt.eq m$ spins of plus/minus types $alpha \, beta$, an occurring permutation type $eta$ has

#[#set math.equation(numbering: n => "(98)")
 $ D_eta med gt.eq med \( m + q + 1 \)^(- O \( q^2 \)) exp #scale(x: 120%, y: 120%)[\(] s thin
   sans(H) \( alpha \/ s \, beta \/ s \) #scale(x: 120%, y: 120%)[\)] . $ <ten:inverse:eq:5>]

Indeed LR implies $eta_i lt.eq alpha_i + q \, med eta'_j lt.eq beta_j + q$, and $eta$ fits the $q$-hook.
  For the first inequality a row of an LR tableau with content $beta'$ has at most $beta'_1$ boxes:
  match each entry $> 1$ to a distinct preceding entry of value one less by the lattice word property.
  Predecessors must be in strictly earlier rows, so the chains ending for boxes of this row use distinct ones.
  Transposition gives the other inequality. The product of hook lengths off the $q times
  q$ square in the first $q$ rows is at most $\( s + q + 1 \)^(O \( q^2 \)) product alpha_i !$:
  the leg lengths there are at most $q$, and row portions there have lengths at most $alpha_i$.
  Use the analogous column estimate, and hooks $lt.eq s$ on the square.
  The hook formula and multinomial estimate now give (98), trivially also for $s = 0$.
  Consequently the multiplicity of $eta$ in this sector is at most $\( m + q + 1 \)^(O \( q^2 \))$ since its LR
  coefficient is at most $binom(s, \| alpha \|) D_alpha D_beta \/ D_eta$,
  and general-linear dimensions satisfy this polynomial-factor bound by the Weyl formula.

===== 2.6.6 Twirl the rows before splitting the columns <twirl-the-rows-before-splitting-the-columns>

Split $X$ additionally by projecting orthogonally according to the number $l_i$ of holes per row $i$,
  and by plus/minus counts and general-linear types of spins there,
  and symmetric-group type $eta_i$ on the nonhole sites there.
  For the latter use a direct sum of the spin permutation-type projectors over hole placements.
  All local sectors are equivariant under the rows subgroup, and $X$ preserves them, giving positive terms.
  Whenever nonzero, $eta_i$ is contained in the previously specified total row type $xi_i$ by branching:
  within each assignment of labels to blocks, a block’s sector over all placements is induced from its sector of
  stabilizer representation at one placement. Before using (97) we perform a twirl decomposition of each positive
  row-sector term. For row $i$ with $s_i = b - l_i > 0$ and spin types $alpha_i \, beta_i$,
  take a random block-unitarily conjugated density $rho_i$ on $V$ with block spectra $alpha_i \/ s_i \,
  beta_i \/ s_i$ (zeros allowed), independent Haar rotations.
  The average of its spin tensor power with exponent $u$ per density (using $\( rho_i^u \)^(⊗ s_i)$) acts scalarly
  on the specified sector with scalar at least

$ \( n + 1 \)^(- O \( q^2 \)) exp \( - u thin s_i sans(H) \( alpha_i \/ s_i \, beta_i \/ s_i \) \) . $

This follows by Haar averaging, taking at least the highest-weight eigenvalue divided by the general-linear
  dimensions. Indeed the power acts by the general-linear representation, identically in every multiplicity copy,
  and its conjugation average over $U \( q \) times U \( q \)$ replaces each general-linear irrep matrix by a
  scalar by Schur’s lemma. For an empty spin set take scalar 1 and any density.
  The row term itself commutes with all such powers in its own row.
  Thus it is an average, with normalization the reciprocal scalar,
  of positive terms obtained by sandwiching it with the spin powers having exponent $u \/ 2$.
  We use the product over rows, and call the normalized integrand $X'$,
  so the normalization consists of the product of those reciprocal scalars.
  Use positive definite approximations, if needed, at factors tending to 1 in the estimates by adding small
  positive scalar matrices to the densities and renormalizing, then taking limits.

Choose $D = sum_i rho_i \/ a$ in (97).

======= 2.6.6.1 The comparison before the column split. <the-comparison-before-the-column-split.>

Put $A = Z P_lambda$, $H = h_(\[ g \])^u$, and $c = D_omega^(- u)$, so that $A lt.eq c H$.
  At this stage $Y$ is still a positive element of the column group algebra,
  possibly split by central total-column types. Thus $Y$ commutes with both $A$ and $H$.
  For every positive row-twirl term $X'$, these commutations give

$ c "Tr" \( X' Y H \) - "Tr" \( X' Y A \) = "Tr" #h(-0.16667em) (X' Y^(1 \/ 2) \( c H - A \) Y^(1 \/ 2)) gt.eq 0 . $

The last trace is nonnegative because its two factors are positive. Moreover

$ "Tr" \( X' Y H \) = "Tr" \( H^(1 \/ 2) X' H^(1 \/ 2) Y \) . $

No commutation of $X'$ with $A$ or $H$ has been used. We now split $Y$ into its positive local spin and hole
  sectors and apply the column twirl. Performing that split before the comparison would require commutations that
  its summands need not satisfy.

Only now split $Y$ by the analogous hole and spin sectors on columns and twirl with column densities $sigma_j$ at
  exponent $u$ as above. The right-hand trace needs only the diagonal compressions of the two terms (row and
  column) to $D_z$, summed over placements: a row operator preserves the row of each hole label,
  and a column operator its column, so there is only the original placement as intermediate placement in this trace.

===== 2.6.7 Positive compression with labeled holes <positive-compression-with-labeled-holes>

On a single local block of size $m$, with $l$ holes at specified sites, write $xi \, eta \, alpha \,
  beta$ for its total permutation type, nonhole spin permutation type, and spin general-linear types.
  Before inserting $h$ and before the spin-power sandwiching and normalization,
  the compressed PSD operator in the selected sector has trace at most

#[#set math.equation(numbering: n => "(99)")
 $ \( m + q + 1 \)^(O \( q^2 \)) frac(J_m \( xi \, p \), \( m \)_l D_eta) . $ <ten:inverse:eq:6>]

Here $\( m \)_l = m ! \/ \( m - l \) !$. To see this, taking the diagonal with labeled holes fixed retains only
  coefficients in the stabilizer $S_(m - l)$ of those positions from the local group algebra term of $X$ or $Y$ on
  type $xi$. Here we can identify the local module independently for each assigned set of hole labels,
  grouping the sites blockwise using the graded permutation identification.
  On fixed placements the action of the retained coefficients is thus via the spin permutation action in this
  block. The coefficient restriction remains positive (conditional expectation in group algebra,
  or compression of the regular matrix). Its identity coefficient is $J_m \( xi \, p \) \/ m !$, unchanged,
  so by regular trace on $S_(m - l)$ its trace on type $eta$ is at most
  $J_m \( xi \, p \) \/ \( \( m \)_l D_eta \)$. Now apply the local multiplicity bound.
  All sector compressions here besides the original total-type restriction use projectors preserving fixed
  placements and commuting there with the retained subgroup action.

===== 2.6.8 The interpolated density product <the-interpolated-density-product>

For clarity, discard terms with a zero bound and divide out the product of the trace bounds (99) over blocks on
  each respective side, including polynomial factors, so the remaining spin operators on each side prior to the
  sandwiches are positive $X_0 \, Y_0$ with trace and norm at most 1 (formed locally for the spin system for $z$,
  with graded grouping). In terms of tensor densities on occupied spin sites formed from the row matrices and the
  column matrices, denoted by $rho_R \, sigma_C$, and $h_(*) = h^(⊗ g)$, the needed extra trace factor is bounded by

#[#set math.equation(numbering: n => "(100)")
 $ ∥X_0^(1 \/ 2) rho_R^(u \/ 2) h_(*)^(u \/ 2) sigma_C^(u \/ 2) Y_0^(1 \/ 2)∥_(upright("HS"))^2 lt.eq
   e^t . $ <ten:inverse:eq:7>]

======= 2.6.8.1 Interpolation in the original matrix order. <interpolation-in-the-original-matrix-order.>

Fix the occupied cells $cal(E) subset.eq \[ a \] times \[ b \]$, with $\| cal(E) \| = g = a b - t$,
  and use one fixed ordering of them. For the row and column trace-one spin densities $rho_i \, sigma_j$, write

$ D = 1 / a sum_i rho_i \, quad h = D^(- 1) \, wide rho_R = ⨂_(\( i \, j \) in cal(E)) rho_i \, quad
  sigma_C = ⨂_(\( i \, j \) in cal(E)) sigma_j \, quad h_(*) = h^(⊗ g) . $

For the moment assume the densities are positive definite.
  The normalized unsandwiched compressions $X_0 \, Y_0$ are positive with traces at most one;
  in particular they are contractions. On the strip $0 lt.eq Re z lt.eq 1$,
  consider the Hilbert–Schmidt-valued analytic function

$ F \( z \) = X_0^(1 \/ 2) rho_R^(z \/ 2) h_(*)^(z \/ 2) sigma_C^(z \/ 2) Y_0^(1 \/ 2) . $

On the lower boundary, the product of the three imaginary powers is unitary, and hence

$ parallel F \( i v \) parallel_(upright("HS")) lt.eq parallel X_0^(1 \/ 2) parallel_(upright("HS")) parallel
  Y_0^(1 \/ 2) parallel_(upright("op")) lt.eq 1 . $

On the upper boundary there is the exact factorization

$ F \( 1 + i v \) = #scale(x: 120%, y: 120%)[\[] X_0^(1 \/ 2) rho_R^(i v \/ 2) #scale(x: 120%, y: 120%)[\]]
  #scale(x: 120%, y: 120%)[\[] rho_R^(1 \/ 2) h_(*)^(1 \/ 2) h_(*)^(i v \/ 2) sigma_C^(1 \/ 2)
  #scale(x: 120%, y: 120%)[\]] #scale(x: 120%, y: 120%)[\[] sigma_C^(i v \/ 2) Y_0^(1 \/ 2)
  #scale(x: 120%, y: 120%)[\]] . $

Removing the two outer contractions in Hilbert–Schmidt norm and factorizing the tensor trace yields

$ parallel F \( 1 + i v \) parallel_(upright("HS"))^2 lt.eq
  product_(\( i \, j \) in cal(E)) "Tr" #h(-0.16667em) (h^(1 \/ 2) rho_i h^(1 \/ 2) tilde(sigma)_j) \, wide
  tilde(sigma)_j = h^(i v \/ 2) sigma_j h^(- i v \/ 2) . $

Every $tilde(sigma)_j$ is a trace-one positive density. The same unitary conjugation occurs in every row,
  so each full column, including its omitted cells, has mean

$ 1 / a sum_i "Tr" #h(-0.16667em) (h^(1 \/ 2) rho_i h^(1 \/ 2) tilde(sigma)_j) = "Tr" tilde(sigma)_j = 1 . $

If column $j$ has $l'_j$ holes, arithmetic–geometric means bounds its occupied product by

$ (frac(a, a - l'_j))^(a - l'_j) lt.eq e^(l'_j) \, $

with the empty product equal to one. Thus $parallel F \( 1 + i v \) parallel_(upright("HS")) lt.eq e^(t \/ 2)$.
  Applying the three-lines theorem to the scalar function $"Tr" \( T^(*) F \( z \) \)$ for every Hilbert–Schmidt
  unit vector $T$ gives

$ parallel F \( u \) parallel_(upright("HS"))^2 lt.eq e^(u t) lt.eq e^t \, wide 0 lt.eq u lt.eq 1 . $

The trace after the two density sandwiches is exactly this squared norm:

$ & "Tr" #h(-0.16667em)
  [h_(*)^(u \/ 2) \( rho_R^(u \/ 2) X_0 rho_R^(u \/ 2) \) h_(*)^(u \/ 2) \( sigma_C^(u \/ 2) Y_0 sigma_C^(u \/
  2) \)] = parallel F \( u \) parallel_(upright("HS"))^2 . $

Only cyclic invariance of trace is needed for this identity. At no point have distinct positive matrices been commuted.

For singular densities, replace each $rho_i$ and $sigma_j$ by $\( rho_i + epsilon I \) \/ \( 1 + 2 q epsilon \)$
  and $\( sigma_j + epsilon I \) \/ \( 1 + 2 q epsilon \)$.
  Keep $epsilon > 0$ throughout the twirls and the trace comparison.
  The bounds above are uniform in $epsilon$; eliminate the inverse density using them before letting $epsilon$
  decrease to zero in the twirl scalars. This procedure remains valid when the limiting row mean is singular and
  does not require an inverse at that limit. All the spin matrices preserve parity,
  so graded regrouping conjugates the whole calculation by unitaries and changes neither positivity nor these norms.

This proves (100).

By (98), the reciprocal twirl scalars are bounded by local factors $D_eta^u$ times $\( n + 1 \)^(O \( q^2 \))$ (in
  the regularized case multiply by factors tending to 1). Combined with (99) this leaves,
  apart from polynomial factors and (100), one factor

$ J_m \( xi \, p \) D_eta^(- theta) \/ \( m \)_l $

per block on both sides. The resulting bound for $upright("Tr") \( P_lambda Z X Y \)$ carries also the factor
  $D_omega^(- u)$. To get a bound on $D_lambda upright("Tr")_lambda X Y$ pay at most $binom(n, t)
  D_omega$ by the dimension and multiplicity estimates above.
  Traces before expansion for $P_lambda Z$ give exactly the sector multiplicity times the irrep trace.

===== 2.6.9 Entropy accounting for the marks <entropy-accounting-for-the-marks>

For fixed vectors of hole counts with sums $t$ on each side,
  the number of placements is at most $\( t ! \/ product l_i ! \) \( t ! \/ product l'_j ! \)$.
  Across both sides the product of $1 \/ \( m \)_l$ is at most $n^(- t) e^(2 t)$,
  using $\( m \)_l gt.eq \( m \/ e \)^l$. We record the entropy accounting: on the row side,

$ log \( t ! \/ product l_i ! \) lt.eq t log a + sum_i e_b \( l_i \) - e_n \( t \) $

and analogously on columns. Thus the $sum e_m \( l \)$ terms cancel those of (95), and $binom(n, t) lt.eq
  exp \( e_n \( t \) + t \)$. Also $sum l log m = t log n$. These estimates apply including zero counts.
  Finally the number of count and type choices and the polynomial factors combined are bounded by
  $exp \( O \( \( a + b \) \( q^2 + n^(1 \/ 4) \) log \( n + 1 \) \) \)$,
  using at most $\( m + 1 \)^(O \( sqrt(m) \))$ diagrams of size $lt.eq m$ (e.g.
  describe by Durfee square and row/column lengths along it).
  There is no extra sum over hole-label allocations besides placements. This proves (96).

===== 2.6.10 Extending the child estimate to an inherited hook <extending-the-child-estimate-to-an-inherited-hook>

In this subsection $E_m \( xi \; p \) = log J_m \( xi \, p \)$ and $j_m \( l \) = e_m \( l \)$,
  as in the marked recurrence.

The parent uses its own hook parameter when invoking the marked recurrence.
  It is therefore necessary to extend the child induction from the child’s smaller hook to every hook inherited
  from the parent. The extension below in fact applies to every subpartition of the child diagram.

Use $epsilon.alt \, c_0 \, theta \, Q_m$ and $G_m$ from Proposition 30.

#thm([Lemma 2.17.])[
  (Allowance for arbitrary inherited subdiagrams).  #emph[There are absolute $C$ and $m_0$ with the following
    property. Let $m gt.eq m_0$ be a power of two and let $p gt.eq 2$. Suppose
$ E_m \( xi \; p \) lt.eq G_m \( xi \) quad upright("for large-level ") xi \, wide E_m \( xi \; p \) lt.eq 0 quad
  upright("for the other ") xi . $

 Then, for every $xi tack.r m$ and every subpartition $eta subset.eq xi$, putting $l = m - \| eta \|$ gives
#[#set math.equation(numbering: n => "(101)")
 $ E_m \( xi \; p \) lt.eq cal(B)_m + theta H_eta + c_0 l log m - j_m \( l \) \, wide cal(B)_m =
   C m^(1 - 4 epsilon.alt) log \( m + 1 \) . $ <s:eq:arbitrary-hook-child-allowance>]

 This includes every $q$-hook subpartition, for any inherited $q gt.eq 1$. The constants do not depend on $p$ or $q$.]
] <s:arbitrary-hook-child-allowance>

#proof[
  A zero moment causes no difficulty. If $xi$ is not large-level, use $H_eta gt.eq 0$ and the elementary minimum
  $ min_(0 lt.eq x lt.eq m) #scale(x: 120%, y: 120%)[\(] c_0 x log m -
    j_m \( x \) #scale(x: 120%, y: 120%)[\)] = - e^(- 1) m^(1 - c_0) . $
  Since $c_0 > 4 epsilon.alt$, this negative part is bounded in absolute value by the stated $cal(B)_m$.
    This also handles the trivial diagram, whose moment is exactly one.
  Suppose next that $xi$ is large-level. Intersect $eta$ with the $Q_m$-hook to obtain $alpha$,
    and let $h = \| eta \| - \| alpha \|$. Since $alpha subset.eq xi$, the hypothesis gives
  $ E_m \( xi \; p \) lt.eq theta H_alpha + c_0 \( l + h \) log m - j_m \( l + h \) . $
  The derivative $j'_m \( x \) = log \( m \/ x \) - 1$ is at least $- 1$ on $\( 0 \, m \]$. By continuity at zero,
  $ j_m \( l \) - j_m \( l + h \) lt.eq h . $
  Consequently the excess over the claimed expression without $cal(B)_m$ is at most
  #[#set math.equation(numbering: n => $†$)
   $ c_0 h log m + h - theta \( H_eta - H_alpha \) . $]
  Tableau extension gives $H_eta gt.eq H_alpha$. If $h < m^(1 - 4 epsilon.alt)$,
    dropping the last term in $\( dagger \)$ proves the required allowance.
  For larger $h$, the deleted region is a translated straight partition $beta$:
    its row lengths are $\( eta_(Q_m + i) - Q_m \)_(+)$, $i gt.eq 1$.
    Both its width and its height are at most $m \/ Q_m$, so every hook length of $beta$ is at most $2 m \/ Q_m$.
    The hook formula and $h ! gt.eq \( h \/ e \)^h$ imply
  $ log D_beta gt.eq h log frac(Q_m h, 2 e m) . $
  Fill $alpha$ with the first $\| alpha \|$ entries of a tableau and fill the translated $beta$ with the remaining
    entries. The boundary inequalities hold because $alpha$ is an order ideal in $eta$, giving $D_eta gt.eq
    D_alpha D_beta$. Therefore
  $ H_eta - H_alpha gt.eq h log frac(Q_m h, 2 e m) gt.eq h [(1 / 16 - 4 epsilon.alt) log m - log \( 4 e \)] $
  for sufficiently large $m$, when $Q_m gt.eq m^(1 \/ 16) \/ 2$. The numerical inequality
  $ theta (1 / 16 - 4 epsilon.alt) = 0.02925 > 0.01 = c_0 $
  shows that $\( dagger \)$ is nonpositive once $m gt.eq m_0$. This proves the lemma. ◻
]

If the two children have different already established exponents, use their maximum $p$.
  Each sweep is a contraction, so increasing the real Schatten exponent only decreases every $E_m \( xi \; p \)$.
  Apply the lemma with that common $p$ and then the marked recurrence with the parent parameter $q = Q_n$.
  This verifies the all-subdiagram quantifier in the child hypothesis;
  restricting it to $Q_m$-hook diagrams would not suffice.

===== 2.6.11 The bounded-exponent induction <the-bounded-exponent-induction>

#proof[
  The trivial diagram has moment one and is not large-level. A zero moment satisfies either branch.
    Once the finite starting range has been fixed, Lemma 4 permits a common exponent large enough for every other
    diagram in that range, including a possibly negative $G_n \( lambda \)$.
    It will also be chosen above the fixed sparse requirement in (94).
    The sparse branch then holds whenever that estimate applies;
    its remaining finitely many sizes will belong to the starting range.
    We now fix the large-size thresholds without using that exponent.
  For larger $d$, split the dimensions into $floor.l d \/ 2 floor.r \, ceil.l d \/ 2 ceil.r$ yielding $a \, b$.
    Let $p$ be the maximum of the child exponents. Lemma 32 gives (95) for every parent-hook subdiagram with
    $cal(B)_m = O \( m^(1 - 4 epsilon.alt) log \( m + 1 \) \)$.
    Increasing the child exponent to their maximum is allowed by contraction.
    Thus the displayed all-subdiagram hypothesis, including the inherited parent hook, is satisfied.
  We next check three comparisons needed to apply (96). We may assume the parent is large-level and has positive
    moment, so the sparse dimension estimate gives $H = H_lambda gt.eq c n^(1 - epsilon.alt)$.
  First,
  $ G_n \( lambda \) lt.eq 0.6 H $
  for all sufficiently large $n$. To see this, test the canonical $Q_n$-hook portion $alpha subset.eq lambda$,
    and put $s = n - \| alpha \|$. If $s gt.eq n^(1 - 4 epsilon.alt)$, the hook calculation in the preceding lemma gives
  $ H - H_alpha gt.eq s [(1 / 16 - 4 epsilon.alt) log n - log \( 4 e \)] . $
  Multiplied by $theta$, this is larger than $c_0 s log n$.
    Consequently this candidate costs at most $theta H$, even after its negative deletion entropy is discarded.
    If $s < n^(1 - 4 epsilon.alt)$, the candidate costs at most $theta H + c_0 n^(1 - 4 epsilon.alt) log n =
    theta H + o \( H \)$. Both cases prove the asserted bound.
  Second, the deletion count $t$ of an actual minimizing $omega$ satisfies
  $ t = O (n^(1 - 4 epsilon.alt) + frac(H, log n)) . $
  Indeed if $t gt.eq n^(1 - 4 epsilon.alt)$, then $log \( n \/ t \) lt.eq 4 epsilon.alt log n$ and $H_omega gt.eq 0$, so
  $ \( c_0 - 4 epsilon.alt \) t log n lt.eq G_n \( lambda \) lt.eq 0.6 H . $
  Below that threshold the displayed size bound is immediate.
  Third, use this minimizing $omega$ in (96). The child allowances and the grid error satisfy
  $ a cal(B)_b + b cal(B)_a & = O \( n^(1 - 2 epsilon.alt) log \( n + 1 \) \) \,\
\( a + b \) \( Q_n^2 + n^(1 \/ 4) \) log \( n + 1 \) & = O \( n^(3 \/ 4) log \( n + 1 \) \) . $
  Together with the bound on $t$ and $H gt.eq c n^(1 - epsilon.alt)$, these imply,
    for an absolute $K$ independent of $p$,
  $ log J_n \( lambda \, p \) lt.eq G_n \( lambda \) + K H \/ d . $
  For example the first error divided by $H \/ d$ is $O \( d n^(- epsilon.alt) log \( n + 1 \) \) = o \( 1 \)$;
    the other sublinear powers are smaller. The $H \/ log n$ part of the deletion count is already $O \( H \/ d \)$.
  For a positive moment and $delta > 0$, the elementary inequality $sum_i x_i^(1 + delta)
    lt.eq \( sum_i x_i \)^(1 + delta)$ for $x_i gt.eq 0$ gives
  $ log J_n \( lambda \, p \( 1 + delta \) \) lt.eq \( 1 + delta \) log J_n \( lambda \, p \) - delta H . $
  Choose the size threshold so that $K \/ d lt.eq 0.1$. The preliminary bound is then at most $0.7 H$,
    and taking $delta = A \/ d$ with $A gt.eq 4 K$ yields
  $ log J_n \( lambda \, p \( 1 + A \/ d \) \) lt.eq G_n \( lambda \) + \( K - 0.3 A \) H \/ d lt.eq
    G_n \( lambda \) . $
  All thresholds and $A$ are independent of the starting exponent.
    Choose an integer $d_0$ above them, also large enough that every child in a recursion step is in the range of
    the inherited-hook lemma. Now choose one starting exponent $P_(*)$ for $d lt.eq
    d_0$ as described at the beginning of the proof, and set
  $ p_d = P_(*) quad \( d lt.eq d_0 \) \, wide p_d = \( 1 + A \/ d \) max { p_(floor.l d \/ 2 floor.r) \,
    p_(ceil.l d \/ 2 ceil.r) } quad \( d > d_0 \) . $
  Strong induction proves both branches of the proposition.
    To bound these exponents, follow a child attaining each maximum until the first index at most $d_0$.
    Along this path, parent $u$ and child $v$ obey $u - 1 gt.eq 2 \( v - 1 \)$,
    so the sum of reciprocal bit lengths above the starting range is at most $2 \/ d_0$.
    Thus $p_d lt.eq P_(*) e^(2 A \/ d_0)$ for every $d$. ◻
]

===== 2.6.12 From moments to forward sweeps <from-moments-to-forward-sweeps>

Put $P = sup_d p_d < oo$ and choose an integer $r gt.eq 4 P$.
  At large levels, the bound $G_n \( lambda \) lt.eq 0.6 H_lambda$ and the moment-slack inequality give

$ log J_n \( lambda \, 2 r \) lt.eq (1 - 0.4 frac(2 r, p_d)) H_lambda lt.eq - 2 H_lambda . $

Consequently

$ sum_(lambda eq.not \( n \)) J_n \( lambda \, 2 r \) = o \( 1 \) . $

The large-level bound is summable with negligible total by the partition count and dimension bound.
  At the others use (94) (at most $2^k$ diagrams per sparse $k$).
  By Schatten Hölder, the analogous regular-representation Hilbert-Schmidt sum with $upright("Tr")_lambda \|
  B_n^r \|^2$ in place of $upright("Tr")_lambda \| B_n \|^(2 r)$ is no larger.
  This sum excluding the trivial diagram is the squared $L^2$ distance of the permutation density from 1 relative
  to uniform, by the regular action trace formula. By Cauchy-Schwarz,
  $r d$ shuffles therefore suffice in total variation at large $d$, uniformly over starting orders by relabeling.

==== 2.7 Deletion budgets and graded hook overlap <rec:sec-hook-budget>

The next method assigns a budget to deleting boxes from a diagram.
  Deletion trades a large representation for a smaller diagram inside a thin hook and a collection of named
  points. A graded tensor overlap estimate controls the hook; falling factorials account for the points.
  The budget first minimizes over every subdiagram and clips the result;
  the proof then finds a near-minimizer inside a thin hook.

Write $W_lambda = log D_lambda$. Fix $a = 1 \/ 4$ and $b = 10^(- 5)$, and set

#[#set math.equation(numbering: n => "(102)")
 $ E_n \( lambda \) = min_(mu subset.eq lambda) { a W_mu + b t log n - t log \( n \/ t \) } \, wide t =
   n - \| mu \| \, wide E_n^(+) = max \( 0 \, E_n \) . $ <rec:deletion-budget>]

The $t$-dependent logarithmic terms have continuous value zero at $t = 0$.
  All traces below are ordinary, unnormalized traces.

#thm([Theorem 2.18.])[
  #emph[There are real exponents $p \( d \) gt.eq 1$, indexed by integers $d gt.eq 1$,
    with $sup_(d gt.eq 1) p \( d \) < oo$ such that, for every integer $d gt.eq
    1$ and every partition $lambda tack.r n = 2^d$,
$ D_lambda "Tr" \| B_n \|^(2 p \( d \)) lt.eq e^(E_n^(+) \( lambda \)) . $

 There is a fixed integer $d_(*) gt.eq 1$ above which one may take
$ p \( d \) = \( 1 + d^(- 1 \/ 2) \) max { p \( floor.l d \/ 2 floor.r \) \, p \( ceil.l d \/ 2 ceil.r \) } . $

 In particular $E_n^(+) lt.eq a W_lambda$ yields a fixed negative power of $D_lambda$ for the sweep norm.]
] <rec:deletion-moment>

===== 2.7.1 Whitening a graded tensor overlap <whitening-a-graded-tensor-overlap>

Consider an $a_0$ by $b_0$ grid with $n = a_0 b_0$ and $t$ deleted cells. Put $s = n - t$.
  When $s = 0$, the surviving representation is one-dimensional and the overlap bound below is immediate;
  thus the whitening argument assumes $s > 0$. Suppose $mu tack.r s$ lies in an $\( r \, r \)$ hook,
  where $1 lt.eq r lt.eq n^(1 \/ 16)$ is an integer. Let $X \,
  Y$ be products of positive row and column group-algebra elements, supported on the local type tuples $gamma \,
  delta$, respectively. Then

#[#set math.equation(numbering: n => "(103)")
 $ "Tr"_(V_mu) X Y lt.eq "Tr"_(V_gamma) X thin "Tr"_(V_delta) Y thin exp {
   O \( \( a_0 + b_0 + 1 \) r^2 log \( n + 1 \) + t \) + min \( 0 \, W_gamma + W_delta - W_mu \) } .
   $ <rec:graded-hook-overlap>]

Here local dimensions and traces multiply over the lines, so $W_gamma = sum_i log D_(gamma_i)$ and $W_delta =
  sum_j log D_(delta_j)$. For the balanced grids used in the induction, $a_0 + b_0 = O \( sqrt(n) \)$,
  the error is $O \( n^(4 \/ 5) + t \)$. The displayed formula retains the error for arbitrary rectangular geometry.

We supply the entropy gain in this inequality. Realize the hook inside signed tensors over $bb(C)^r xor bb(C)^r$,
  with the second summand odd. A compatible compact type has even and odd weight lists $xi \, eta$.
  Its entropy $h$ differs from the symmetric group log dimension by $O \( r^2 log n \)$;
  carrier dimensions and the number of compatible types cost $exp O \( r^2 log n \)$.
  Over all grid lines these errors are $O \( \( a_0 + b_0 + 1 \) r^2 log \( n + 1 \) \)$.
  The complete positive-factor estimate, including all carrier multiplicities, is Proposition 18,
  applied with $q = r$. Its local hook hypothesis causes no additional restriction here:
  a local type that occurs in the restriction of $V_mu$ is a subdiagram of $mu$ by the Littlewood–Richardson rule,
  and hence is itself an $\( r \, r \)$-hook shape. Any other local type acts as zero on $V_mu$.
  Thus the proposition proves (103). We retain the following deformation calculation to explain the entropy gain;
  the proposition supplies the passage to arbitrary positive factors and their multiplicities.

For a local type with list of weights $\( p_i \)$ and $u$ sites,
  use the strictly positive density matrix with spectrum $\( p_i + 1 \) \/ \( u + 2 r \)$.
  Twirl it over the even and odd unitary groups. The highest-weight term in the twirl dominates the local type
  projection with loss $e^(W_gamma + O \( \( a_0 + b_0 + 1 \) r^2 log \( n + 1 \) \))$,
  and similarly in the other direction. This regularization permits inverse square roots even when some weights vanish.

Work in one compatible global compact sector at a time. For each pair $\( xi \, eta \)$ with at most $r$ parts in
  each partition and $\| xi \| + \| eta \| = s$ for which $V_mu$ occurs in
  $"Ind"_(S_(\| xi \|) times S_(\| eta \|))^(S_s) \( V_xi ⊗ V_(eta^(sans(t))) \)$, put

$ K_r = U \( r \)_(upright("even")) times U \( r \)_(upright("odd")) \,\
cal(U)_tau = upright(bold(S))_xi \( bb(C)^r \) ⊗ upright(bold(S))_eta \( bb(C)^r \) \,\
tau = tau_(\( xi \, eta \)) : K_r arrow.r U \( cal(U)_tau \) . $

Here $upright(bold(S))_xi$ and $upright(bold(S))_eta$ denote the irreducible polynomial carrier representations.
  The action $tau$ extends polynomially to the invertible parity-preserving block matrices.
  Write $chi_tau \( B \) = "Tr"_(cal(U)_tau) tau \( B \)$ for its character, and

$ h = s log s - sum_i xi_i log xi_i - sum_j eta_j log eta_j \, $

with zero summands omitted. On the whole signed tensor space let $rho_s \( B \) = B^(⊗ s)$ be the color action.
  It is distinct from the carrier action $tau \( B \)$; the position action remains the signed permutation action.
  Let $Z = Z_tau$ be the full compact $tau$-isotypic projection in this tensor space, including every multiplicity copy.

Let $cal(W)$ be the set of $s$ occupied cells. For the row and column densities from the local twirls, write

$ R_(cal(W)) = ⨂_(\( i \, j \) in cal(W)) rho_i \,\
C_(cal(W)) = ⨂_(\( i \, j \) in cal(W)) sigma_j \,\
macron(rho) = a_0^(- 1) sum_(i = 1)^(a_0) rho_i \, wide A = macron(rho)^(- 1 \/ 2) . $

An empty line may be assigned any strictly positive parity-preserving density of trace one.
  The regularized densities make $macron(rho)$ strictly positive,
  so $A$ is an invertible parity-preserving block matrix. With $d g$ denoting normalized Haar measure on $K_r$,
  the deformed character formula is

#[#set math.equation(numbering: n => "(104)")
 $ Z = \( dim tau \) integral_(K_r) chi_tau \( \( A g \)^(- 1) \) rho_s \( A g \) thin d g .
   $ <rec:graded-deformed-projector>]

Apply Lemma 21 with carrier matrix $tau \( A \)^(- 1)$. Its coefficient integral acts as $tau \( A \)^(- 1)$ on
  the carrier of every copy of $tau$ and as zero on the other compact types.
  Multiplication on the left by $rho_s \( A \)$ therefore gives $Z$, proving the displayed formula.
  For unitary $g$, the character factor is

$ chi_tau \( \( A g \)^(- 1) \) = "Tr"_(cal(U)_tau) #scale(x: 120%, y: 120%)[\(] tau \( g \)^(*) tau \( A \)^(- 1)
  #scale(x: 120%, y: 120%)[\)] \,\
\| chi_tau \( \( A g \)^(- 1) \) \| lt.eq \( dim tau \) e^(- h \/ 2) . $

The bound follows by evaluating the highest-weight monomials of $A^(- 1)$ and using the entropy maximizing
  proportions. The factor $dim tau$ outside the integral is separate from the one in this character bound.

For each cell define the squared Hilbert–Schmidt quantity

$ z_(i j) \( g \) & = parallel rho_i^(1 \/ 2) A g sigma_j^(1 \/ 2) parallel_(upright("HS"))^(thin 2)\
 & = "Tr" \( A rho_i A thin g sigma_j g^(*) \) gt.eq 0 . $

Since $A accent(rho A, ‾) = I$ and every $sigma_j$ has trace one, its sum over the full grid is

$ sum_(i = 1)^(a_0) sum_(j = 1)^(b_0) z_(i j) \( g \) & = a_0 sum_(j = 1)^(b_0) "Tr" \( g sigma_j g^(*) \)\
 & = a_0 b_0 = n . $

Arithmetic–geometric means on the occupied cells therefore give

$ ∥⨂_(\( i \, j \) in cal(W)) rho_i^(1 \/ 2) A g sigma_j^(1 \/ 2)∥_(upright("HS"))^(thin 2) & =
  product_(\( i \, j \) in cal(W)) z_(i j) \( g \)\
 & lt.eq \( n \/ s \)^s lt.eq e^t . $

Thus the tensor coefficient has Hilbert–Schmidt norm at most $e^(t \/ 2)$.
  The triangle inequality in (104), together with the character bound, gives the exact scale

$ parallel R_(cal(W))^(1 \/ 2) Z C_(cal(W))^(1 \/ 2) parallel_(upright("HS")) lt.eq \( dim tau \)^2
  e^(- h \/ 2 + t \/ 2) . $

Its square is at most $\( dim tau \)^4 e^(- h + t)$. The two local twirl domination coefficients enter the overlap
  norm through their square roots. After squaring, their logarithms add $W_gamma + W_delta +
  O \( \( a_0 + b_0 + 1 \) r^2 log \( n + 1 \) \)$ to this squared logarithmic bound.
  Applying this estimate to each compatible global type, retaining all carrier dimensions and the number of such
  types, and using $h = W_mu + O \( r^2 log \( n + 1 \) \)$ gives the entropy exponent $W_gamma + W_delta - W_mu +
  O \( \( a_0 + b_0 + 1 \) r^2 log \( n + 1 \) + t \)$.

The other branch of the minimum also needs the carrier factors.
  On the signed tensor space, let $P_mu$ be the full symmetric-group isotypic projection and let $w_mu gt.eq
  1$ be its multiplicity. Since $P_mu$ commutes with $X$ and $Y$,

$ w_mu "Tr"_(V_mu) \( X Y \) = "Tr" \( P_mu X Y \) lt.eq \( "Tr" X \) \( "Tr" Y \) . $

Each trace on the right is a product of local signed-tensor traces.
  A local trace is its one-copy irreducible trace multiplied by the local carrier multiplicity,
  which is at most $\( n + r + 1 \)^(10 r^2)$ by Lemma 11. Keeping these multiplicities converts the global
  signed-tensor traces to the local irreducible traces in (103),
  and gives its zero entropy branch with the same allowed error.

===== 2.7.2 The sparse bound and near-optimal deletion <the-sparse-bound-and-near-optimal-deletion>

For $lambda = \( n - k \, beta \)$, a separate path argument gives

#[#set math.equation(numbering: n => "(105)")
 $ parallel B_n^(*) B_n \|_(V_lambda) parallel_(upright("op")) lt.eq e^(C k) \( 2 k d \/ n \)^(k \/ 2) \, wide
   2 k d \/ n lt.eq 1 . $ <rec:hook-forest-sparse>]

Apply the detailed weighted-forest proof of (17), with $Delta = 2 k d \/ n$.
  Its inclusion-probability argument and weighted neighbor bound hold for every $k lt.eq n \/ \( 2 d \)$,
  not only for a fixed polynomial sparse range. In that proof the sum over forests is

$ e^(C k) sum_(1 lt.eq j lt.eq k \/ 2) frac(k^j, j !) Delta^(k - j) . $

When $Delta lt.eq 1$, this is at most $e^(C k) Delta^(k \/ 2) sum_(j gt.eq 0) k^j \/ j ! lt.eq
  e^(\( C + 1 \) k) Delta^(k \/ 2)$. Thus the same row-sum estimate gives $parallel B_n parallel^2 lt.eq
  e^(C' k) Delta^(k \/ 2)$ throughout the full displayed range.
  Since $parallel B_n^(*) B_n parallel = parallel B_n parallel^2$, this proves (105).
  For $k = 1$ the centered kernel is zero, as its one-vertex encounter graph is isolated; for $k =
  0$ the claimed sparse estimate is unnecessary.

The budget has the elementary bounds

#[#set math.equation(numbering: n => "(106)")
 $ E_n^(+) lt.eq a W_lambda \, wide 0 lt.eq E_n^(+) - E_n lt.eq C n^(1 - b) . $ <rec:deletion-basic-bounds>]

The second follows by minimizing $b t log n - t log \( n \/ t \)$ over $0 lt.eq t lt.eq n$.
  A near-minimizing diagram can be chosen in the $\( r \, r \)$ hook with $r = floor.l n^(1 \/ 16) floor.r$,
  at additional cost $O \( n^(99 \/ 100) \)$, and its deletion size obeys

#[#set math.equation(numbering: n => "(107)")
 $ t lt.eq n^(1 - b \/ 2) + C \( W_lambda + n^(99 \/ 100) \) \/ log n . $ <rec:deletion-size-control>]

To prove this carefully, set $g_n \( t \) = b t log n - t log \( n \/ t \)$, with $g_n \( 0 \) = 0$. For $t > 0$,

$ g'_n \( t \) = b log n + log \( t \/ n \) + 1 lt.eq b log n + 1 . $

Choose an exact minimizer $mu_0 subset.eq lambda$, and let $v_j$ be the number of its boxes below row $j$ and
  right of column $j$. They form a translated straight partition $nu_j$.
  Let $mu^(\( j \))$ be the diagram left after deleting that core.
  Filling $mu^(\( j \))$ first and then $nu_j$ gives $D_(mu_0) gt.eq D_(mu^(\( j \))) D_(nu_j)$.
  Among the $v_j$ core boxes, the $v_(2 j)$ boxes beyond its first $j$ rows and columns have hooks at most $2
  v_j \/ j$; all other hooks are at most $v_j$. Thus the hook formula and $v ! gt.eq \( v \/ e \)^v$ yield

$ log D_(nu_j) gt.eq v_(2 j) log \( j \/ 2 \) - v_j . $

If $v_(2 j) gt.eq v_j \/ 2 > 0$, deleting this core changes the objective by at most

$ - a { \( v_j \/ 2 \) log \( j \/ 2 \) - v_j } + v_j \( b log n + 1 \) . $

For $j gt.eq ceil.l n^(1 \/ 32) ceil.r$ this is negative at all sufficiently large $n$, since $b - a \/ 64 < 0$.
  Exact minimality therefore forces $v_(2 j) < v_j \/ 2$ whenever $v_j > 0$.
  Starting at $j_0 = ceil.l n^(1 \/ 32) ceil.r$ and iterating dyadically to the largest $j_h lt.eq
  r$ gives $j_h > r \/ 2$ and

$ v_r lt.eq v_(j_h) lt.eq n 2^(- h) lt.eq 2 n j_0 \/ r = O \( n^(31 \/ 32) \) . $

Truncate $mu_0$ once at $r$. Its dimension decreases, while the derivative bound makes the increase of $g_n$ at
  most $O \( n^(31 \/ 32) log n \) = O \( n^(99 \/ 100) \)$.
  For its deletion size $t gt.eq n^(1 - b \/ 2)$ one has $g_n \( t \) gt.eq \( b \/ 2 \) t log n$.
  The new objective is at most $E_n \( lambda \) + O \( n^(99 \/ 100) \) lt.eq a W_lambda +
  O \( n^(99 \/ 100) \)$, and its dimension term is nonnegative. This proves (107).
  Finally $g_n$ has minimum $- n^(1 - b) \/ e$, establishing the second bound in (106) even when $E_n$ is negative.

===== 2.7.3 The cancellation of named-point factors <the-cancellation-of-named-point-factors>

Induce from the selected hook diagram $mu$ on the remaining $n - t$ points,
  fixing each of $t$ distinct named points individually. The multiplicity of $V_lambda$ in this induced module is
  $f^(lambda \/ mu)$ by branching. Splitting tableau entries also gives

#[#set math.equation(numbering: n => "(108)")
 $ D_lambda lt.eq binom(n, t) D_mu f^(lambda \/ mu) . $ <rec:hook-induction-dimension>]

We specify precisely the coefficient restriction used on a row group.
  Let $G = product_i S_(l_i)$, let $alpha$ be a tuple of row types,
  and let $X$ be a positive group-algebra element whose only nonzero Fourier block is $X_alpha gt.eq 0$.
  Use the conventions

$ hat(x) \( alpha \) = sum_(g in G) x \( g \) rho_alpha \( g \) \, wide x \( g \) =
  frac(D_alpha, \| G \|) "Tr" { X_alpha rho_alpha \( g^(- 1) \) } . $

For a fixed set $S$ of named positions, with $s_i = \| S ∩ "row"_i \|$, let $H = { g in G : g \( s \) =
  s upright(" for every ") s in S }$ be its pointwise stabilizer. Thus $H = product_i S_(l_i - s_i)$. Define

#[#set math.equation(numbering: n => "(109)")
 $ X_S = E_H X = sum_(h in H) x \( h \) h \, wide X_(S \, gamma) =
   sum_(h in H) x \( h \) rho_gamma \( h \) . $ <rec:stabilizer-expectation>]

This keeps the original coefficients on the subgroup $H$;
  it neither prescribes arbitrary ordered images nor averages coefficients over other cosets.

The restriction is positive. Indeed the matrix of regular convolution by $X$ has entries $x \( g_1 g_2^(- 1) \)$.
  Its compression to the basis indexed by $H$ is exactly regular convolution by $E_H X$,
  and a compression of a positive operator is positive. Equivalently,
  write the subgroup restriction as $V_alpha \|_H = xor.big_gamma V_gamma ⊗
  M_(alpha gamma)$ and let $Pi_gamma$ be the corresponding projection.
  Matrix coefficient orthogonality gives the exact formula

$ X_(S \, gamma) = frac(D_alpha \| H \|, \| G \| D_gamma) "Tr"_(M_(alpha gamma)) \( Pi_gamma X_alpha Pi_gamma \) \, $

which is positive and is zero unless every $gamma_i subset.eq alpha_i$.
  Fourier inversion at the identity, or summing this partial-trace formula, gives

#[#set math.equation(numbering: n => "(110)")
 $ sum_gamma D_gamma "Tr" X_(S \, gamma) = \| H \| x \( e \) =
   frac(\| H \|, \| G \|) D_alpha "Tr" X_alpha . $ <rec:stabilizer-trace-identity>]

Each summand is nonnegative. Since $\| G \| \/ \| H \| = product_i \( l_i \)_(s_i)$, it follows that

#[#set math.equation(numbering: n => "(111)")
 $ D_gamma "Tr" X_(S \, gamma) lt.eq frac(D_alpha "Tr" X_alpha, product_i \( l_i \)_(s_i)) .
   $ <rec:coefficient-restriction>]

For factorizable $X$, coefficient restriction factors over the rows.
  The column operator $Y$ has the identical construction with column counts $s'_j$ and its own pointwise stabilizer.

These are exactly the restrictions required by the induced trace.
  Its diagonal coset blocks are indexed by ordered positions of the $t$ named points.
  A product of a row and a column permutation, in either order,
  can return a named point $\( i \, j \)$ to itself only if both fix it:
  the row permutation changes only the column coordinate, and the column permutation changes only the row
  coordinate. Neither can undo a coordinate change made by the other,
  so the intermediate position must also be $\( i \, j \)$. This holds for every named point simultaneously.
  Consequently, in the diagonal block associated with the position set $S$,
  only the pointwise-stabilizing coefficients of both operators occur.
  Identifying the other positions with the carrier of $mu$ gives that block’s trace as
  $"Tr"_(V_mu) \( X_S Y_S \)$. The choice of coset representative merely conjugates this identification. Thus

#[#set math.equation(numbering: n => "(112)")
 $ "Tr"_("Ind" V_mu) \( X Y \) = t ! sum_(\| S \| = t) "Tr"_(V_mu) \( X_S Y_S \) . $ <rec:induced-diagonal-trace>]

All these traces are nonnegative because $X_S \, Y_S gt.eq 0$.
  Likewise the irreducible traces of $X Y$ are nonnegative.
  The branching multiplicity therefore implies $f^(lambda \/ mu) "Tr"_(V_lambda) \( X Y \) lt.eq
  "Tr"_("Ind" V_mu) \( X Y \)$. Together with (108), this supplies the factor $D_mu binom(n, t) t !$ used below.
  In particular, the argument uses diagonal induced blocks and positivity of the pointwise-stabilizer expectation,
  rather than positivity of an arbitrary off-diagonal coset restriction.

For each child type $alpha$ and every prescribed stabilizer subshape $gamma subset.eq
  alpha$ with $h$ deleted positions, the minimum defining the child budget and its clipping bound give

$ E_m^(+) \( alpha \) lt.eq a W_gamma + b h log m - h log \( m \/ h \) + C m^(1 - b) . $

The candidate $gamma$ need not minimize the child objective.
  Summing over the two balanced axes gives a total clipping error $O \( n^(1 - b \/ 2) \)$.
  Consequently the sum of child budgets is at most

#[#set math.equation(numbering: n => "(113)")
 $ a U + b t log n - J + O \( n^(1 - b \/ 2) \) \, wide U = W_gamma + W_delta \, $ <rec:hook-local-budget>]

where the count entropy is

$ J = sum_i s_i log \( b_0 \/ s_i \) + sum_j s'_j log \( a_0 \/ s'_j \) . $

Each margin sums to $t$, and zero summands are omitted. The number of compatible marked-cell sets with these
  margins is at most

#[#set math.equation(numbering: n => "(114)")
 $ frac(t !, product_i s_i ! product_j s'_j !) lt.eq exp { J - t log \( n \/ t \) +
   O \( t \) } . $ <rec:hook-margin-count>]

This is the usual assignment count: assign the labels to row slots and column slots,
  then forget their order within each line. Stirling gives the second inequality.
  The factor $binom(n, t) t !$ from (108) cancels the falling factorials in (111), up to $e^(O \( t \))$.
  More precisely, $\( m \)_h gt.eq \( m \/ e \)^h$ and both margins sum to $t$, so

$ frac(binom(n, t) t !, product_i \( b_0 \)_(s_i) product_j \( a_0 \)_(s'_j)) lt.eq e^(2 t) . $

The cancellation must precede the estimate of the number of profiles;
  otherwise it would leave a spurious factorial cost.

Apply (103). Its raw trace bound has gain $min \( 0 \, U - W_mu \)$.
  The child quantities being propagated are dimension-weighted traces.
  Dividing their dimensions out and restoring the parent dimension multiplies this raw bound by $e^(W_mu - U)$.
  The resulting exponent is $W_mu - U + min \( 0 \, U - W_mu \) = min \( 0 \, W_mu - U \)$.
  It combines with (113) by the elementary inequality

$ a U + min \( 0 \, W_mu - U \) lt.eq a W_mu wide \( 0 < a < 1 \) . $

Together with (114), this recovers exactly the expression minimized in (102),
  with errors $O \( n^(1 - b \/ 2) + t + n^(99 \/ 100) \)$.
  The logarithm of the number of remaining types and profiles is $O \( n^(3 \/ 4) + sqrt(n) log \( n + 1 \) \)$:
  the full child partitions and stabilizer subpartitions each contribute $O \( a_0 sqrt(b_0) + b_0 sqrt(a_0) \)$
  by the partition bound, and the row and column margins contribute $O \( \( a_0 + b_0 \) log \( n + 1 \) \)$.
  These terms are included in the stated errors.

#proof[
  Write $Q_n = B_n^(*) B_n$ and, on $V_lambda$, put
  $ T_n^lambda \( P \) = D_lambda "Tr" Q_n^P = D_lambda "Tr" \| B_n \|^(2 P) quad \( P > 0 \) \,\
theta_(d \, lambda) = parallel Q_n \|_(V_lambda) parallel_(upright("op")) =
  parallel B_n \|_(V_lambda) parallel_(upright("op"))^2 . $
  The powers in $T_n^lambda \( P \)$ are positive real spectral powers.
    The eigenvalues of $Q_n$ lie in $\[ 0 \, 1 \]$. Thus, when $theta_(d \, lambda) > 0$ and $v gt.eq u > 0$,
  #[#set math.equation(numbering: n => "(115)")
   $ T_n^lambda \( v \) lt.eq theta_(d \, lambda)^(v - u) T_n^lambda \( u \) \,\
theta_(d \, lambda)^u lt.eq e^(- W_lambda) T_n^lambda \( u \) \,\
T_n^lambda \( u \) lt.eq e^(2 W_lambda) theta_(d \, lambda)^u . $ <rec:deletion-spectral-slack>]
  The last inequality includes one factor $D_lambda$ for the number of eigenvalues in the unnormalized trace and
    one for the weight in $T_n^lambda$.
  The trivial shape has $D_lambda = 1$ and $B_n = I$. Its undeleted budget choice has value zero, so $E_n^(+) =
    0$ and its target is the equality $1 = 1$. Every block with $B_n \( lambda \) =
    0$ has zero moment for $P > 0$. In particular this handles all shapes in Lemma 3,
    without requiring a converse to that lemma. Every remaining block is nontrivial and has $0 <
    theta_(d \, lambda) < 1$ by Lemma 4.
  We first fix the exponent requirement for the sparse range. Let $C_f gt.eq 0$ be the absolute constant in (105).
    For all sufficiently large $d$,
  $ 2 d lt.eq n^(b \/ 16) \, wide C_f lt.eq \( b \/ 64 \) log n . $
  For $1 lt.eq k lt.eq n^(1 - b \/ 8)$ these inequalities give $2 k d \/ n lt.eq n^(- b \/ 16) lt.eq
    1$ and hence $theta_(d \, lambda) lt.eq n^(- b k \/ 64)$.
    Since $D_lambda lt.eq n^k$, the last inequality in (115) gives
  $ T_n^lambda \( P \) lt.eq n^(\( 2 - b P \/ 64 \) k) lt.eq 1 lt.eq e^(E_n^(+) \( lambda \)) wide
    upright("when ") P gt.eq P_(upright("sp")) := 128 \/ b . $
  These size thresholds are independent of $P$.
  For every remaining nontrivial, nonzero shape with $k > n^(1 - b \/ 8)$,
    the first column has length at most $n \/ 2$ by Lemma 3. The dimension estimates at the start of Section 3
    therefore give $W_lambda gt.eq c n^(1 - b \/ 8)$.
  We now apply the preceding static calculation to a sweep moment.
    Split the coordinates into batches of $floor.l d \/ 2 floor.r$ and $ceil.l d \/ 2 ceil.r$ bits,
    giving a grid with $a_0 = 2^(floor.l d \/ 2 floor.r)$ rows and $b_0 = 2^(ceil.l d \/ 2 ceil.r)$ columns.
    Write $B_n = B_H B_V$, where $B_H$ and $B_V$ are products of the row and column sub-sweeps, respectively.
    At a common real child exponent $q gt.eq 1$, put
  $ X = \( B_H^(*) B_H \)^q \, wide Y = \( B_V B_V^(*) \)^q . $
  These are positive group-algebra elements, each a product over its lines.
    The spectral comparison and Araki–Lieb–Thirring inequality used in (19) apply for every real $q gt.eq 1$ and give
  $ T_n^lambda \( q \) lt.eq D_lambda "Tr"_(V_lambda) \( X Y \) . $
  Decompose $X$ and $Y$ into their full local irreducible blocks.
    For a row profile $alpha$, the dimension-weighted trace of its $i$th block is $T_(b_0)^(alpha_i) \( q \)$,
    and for a column profile $beta$ it is $T_(a_0)^(beta_j) \( q \)$.
    The two orientations of a child’s positive square have the same trace.
    Increasing a child exponent decreases its singular-power trace,
    so the child targets at any assigned exponents no larger than $q$ bound these quantities.
  For each pair of profiles, coefficient restriction to the pointwise stabilizer of a marked set gives the
    positive factors considered above. Decomposing these restricted factors into their local types and applying
    (103) gives exactly the dimension factor and child-budget comparison following (114).
    Summing the profiles and marked sets therefore yields
  $ log T_n^lambda \( q \) lt.eq E_n^(+) \( lambda \) + C #scale(x: 120%, y: 120%)[\(] n^(1 - b \/ 2) + t +
    n^(99 \/ 100) #scale(x: 120%, y: 120%)[\)] . $
  The deletion-size estimate and the lower bound for $W_lambda$ make this error small relative to the dimension:
  $ n^(1 - b \/ 2) + t + n^(99 \/ 100) & lt.eq C (n^(1 - b \/ 2) + n^(99 \/ 100) + frac(W_lambda, log n))\
 & lt.eq C' W_lambda / d . $
  Indeed $log n = d log 2$, and the fixed gaps between $1 - b \/ 8$ and both $1 -
    b \/ 2$ and $99 \/ 100$ absorb the additional factor $d$ for all sufficiently large $d$.
    Consequently there is an absolute $C_r gt.eq 0$ such that
  #[#set math.equation(numbering: n => "(116)")
   $ T_n^lambda \( q \) lt.eq exp { E_n^(+) \( lambda \) + C_r W_lambda \/ d } $ <rec:deletion-preliminary-moment>]
  for all sufficiently large $d$. Its constant is independent of $q$.
  Choose an integer $d_(*) gt.eq 1$ beyond these thresholds and the sparse thresholds, and large enough that,
    for $d > d_(*)$,
  $ C_r \/ d lt.eq 1 \/ 4 \, wide C_r \/ d lt.eq 1 \/ \( 2 sqrt(d) \) . $
  For example the latter two requirements hold once $d_(*)$ is at least $max { ceil.l 4 C_r ceil.r \,
    ceil.l 4 C_r^2 ceil.r }$. Since $E_n^(+) lt.eq W_lambda \/ 4$, the middle inequality in (115) and (116) imply
  $ theta_(d \, lambda)^q lt.eq exp { - \( 3 \/ 4 - C_r \/ d \) W_lambda } lt.eq e^(- W_lambda \/ 2) . $
  The first inequality in (115) now shows
  #[#set math.equation(numbering: n => "(117)")
   $ T_n^lambda \( q \( 1 + d^(- 1 \/ 2) \) \) lt.eq
     exp { E_n^(+) \( lambda \) + \( C_r \/ d - 1 \/ \( 2 sqrt(d) \) \) W_lambda } lt.eq
     e^(E_n^(+) \( lambda \)) . $ <rec:deletion-error-payment>]
  Thus the increase in the stated recursion pays the entire preliminary error,
    with all thresholds chosen before the finite exponent below.
  It remains to start this induction for every partition. Define the finite set
  $ cal(F)_(*) = { \( d \, lambda \) : 1 lt.eq d lt.eq d_(*) \, med lambda tack.r 2^d \, med
    lambda eq.not \( 2^d \) \, med theta_(d \, lambda) > 0 } . $
  The norm-gap lemma makes every $- log theta_(d \, lambda)$ on this set strictly positive.
    With an empty inner maximum interpreted as zero, choose the single real number
  #[#set math.equation(numbering: n => "(118)")
   $ P_(*) = max {1 \, P_(upright("sp")) \, max_(\( d \, lambda \) in cal(F)_(*))
     frac(2 W_lambda - E_(2^d)^(+) \( lambda \), - log theta_(d \, lambda))} . $ <rec:deletion-finite-base>]
  This number is finite, since $cal(F)_(*)$ is finite; its numerators are nonnegative because $E_n^(+) lt.eq
    W_lambda \/ 4$. For every member of $cal(F)_(*)$ and every $P gt.eq P_(*)$, the last inequality in (115) gives
  $ T_n^lambda \( P \) lt.eq exp { 2 W_lambda - P \( - log theta_(d \, lambda) \) } lt.eq e^(E_n^(+) \( lambda \)) . $
  The trivial and zero blocks were already handled directly.
    Thus this one choice proves every target for $1 lt.eq d lt.eq d_(*)$,
    including all partitions at each starting size.
  Set $p \( d \) = P_(*)$ for $1 lt.eq d lt.eq d_(*)$ and use the displayed recursion in the theorem for $d >
    d_(*)$. Both child indices are positive and smaller whenever the recursion is used.
    Strong induction, using the sparse estimate or (117) at the larger child exponent,
    proves the target for every $d gt.eq 1$ and every partition.
  To check boundedness with the rounded child indices, follow a child attaining the maximum until the path
    $d^(\( 0 \)) \, dots.h \, d^(\( h \))$ first reaches $d^(\( h \)) lt.eq d_(*)$.
    If $h > 0$, then $d^(\( h - 1 \)) gt.eq d_(*) + 1$ and $d^(\( j \)) - 1 gt.eq 2 \( d^(\( j + 1 \)) - 1 \)$. Hence
  $ sum_(j = 0)^(h - 1) \( d^(\( j \)) \)^(- 1 \/ 2) lt.eq d_(*)^(- 1 \/ 2) sum_(r gt.eq 0) 2^(- r \/ 2) =
    frac(2 + sqrt(2), sqrt(d_(*))) . $
  It follows that
  $ p \( d \) lt.eq P_(*) exp (frac(2 + sqrt(2), sqrt(d_(*)))) wide \( d gt.eq 1 \) . $
  Thus the real exponents form a bounded sequence.
  For completeness, take an integer $R gt.eq 6 sup_d p \( d \)$ for the number of forward sweeps.
    The target implies $theta_(d \, lambda)^(p \( d \)) lt.eq D_lambda^(- 3 \/ 4)$, and (115) then gives,
    on each nonzero block,
  $ T_n^lambda \( R \) lt.eq D_lambda^(1 - \( 3 \/ 4 \) R \/ p \( d \)) lt.eq D_lambda^(- 7 \/ 2) lt.eq
    D_lambda^(- 2) . $
  Schatten Hölder for the $R$ forward factors bounds $parallel B_n^R parallel_(upright("HS"))^2$ by $"Tr" Q_n^R$.
    The regular Fourier sum over surviving nontrivial types therefore tends to zero by Lemma 7, as asserted.
    This step requires $R$ to be an integer, but imposes no integrality condition on $p \( d \)$. ◻
]

==== 2.8 A paired level and diagram budget <rec:sec-hybrid>

This proof uses two inductive bounds for the same trace. The level budget pays for tuples that lose coordinates on
  restriction. The diagram budget pays for long row and column chains and for distinct markers outside those
  chains. Their common interpolation lemma keeps the finite starting exponent out of all counting errors.

For $p gt.eq 1$ write $T_n^lambda \( p \) = D_lambda "Tr" \| B_n \|^(2 p)$.
  When $T_n^lambda \( p \) = 0$, we use the extended-real convention $log T_n^lambda \( p \) = - oo$. Fix the constants

#[#set math.equation(numbering: n => "(119)")
 $ c_(*) = 10^(- 2) \, wide v_(*) = 10^(- 5) \, wide epsilon.alt = 10^(- 7) \,\
u_(*) = 1 \/ 10 \, wide Lambda = 10 \/ epsilon.alt^2 = 10^15 \, wide p_0 gt.eq 20 Lambda +
  10 . $ <rec:hybrid-constants>]

Choose a sufficiently large absolute $d_0$. Put $iota_d = 0$ for $d lt.eq d_0$ and $iota_d = 2 d_0^(- 1 \/ 3) -
  d^(- 1 \/ 3)$ otherwise, and set $\( u_d \, c_d \, v_d \) = \( u_(*) \, c_(*) \, v_(*) \) +
  iota_d \( 1 \, 1 \, 1 \)$. Choose $d_0$ so large that $iota_d lt.eq v_(*) \/ 10$.
  In particular $gamma_d = v_d \/ c_d$ is positive and less than $0.01$.
  For a box $x$ of $lambda$, let $R \( x \) \, C \( x \)$ be the full row and column lengths, and define

#[#set math.equation(numbering: n => "(120)")
 $ cal(D)_d \( lambda \) = sum_(x in lambda) min {c_d log frac(n, max \( R \( x \) \, C \( x \) \)) \, med
   v_d log n} . $ <rec:hybrid-diagram-weight>]

#thm([Theorem 2.19.])[
  #emph[There is a fixed positive integer $p$ such that, simultaneously for every integer $d gt.eq
    1$ and every partition $lambda = \( n - k \, beta \) tack.r n =
    2^d$ with $lambda eq.not \( n \)$ and $lambda'_1 lt.eq n \/ 2$, where $k = n - lambda_1 gt.eq 1$,
#[#set math.equation(numbering: n => "(121)")
 $ log T_n^lambda \( p \) & lt.eq k log n (u_d - Lambda (frac(log \( n \/ k \), log n))^2) \,\
log T_n^lambda \( p \) & lt.eq cal(D)_d \( lambda \) . $ <rec:hybrid-level-budget>]

 If $log \( n \/ k \) \/ log n gt.eq epsilon.alt$, the first bound is at most $- k log n$.
   For all sufficiently large $d$, in the complementary range, $cal(D)_d \( lambda \) lt.eq 1 / 4 log D_lambda$.]
] <rec:hybrid-main>

The height condition includes every nonzero block by Lemma 3. No converse is needed:
  any zero block in this height range satisfies both moment inequalities by the extended-real convention.
  The final comparison of the diagram budget with dimension also covers these zero blocks,
  because its proof below uses only the stated height bound and properties of the diagram.

===== 2.8.1 Interpolation with a fixed counting exponent <interpolation-with-a-fixed-counting-exponent>

The two-strip argument below uses classical Schatten three-lines interpolation;
  see #cite(label("SutterBertaTomamichel2017")) Section 3.1, Theorem 3.1.
  This reference concerns the interpolation principle, while the profile count and angle inequality below are
  proved here.

Write the sweep as $B_n = C R$, with $R$ the product of row sweeps and $C$ the product of column sweeps. Set

$ A = \( R R^(*) \)^(1 \/ 2) \, wide B = \( C^(*) C \)^(1 \/ 2) . $

These positive group-algebra operators still factor over their respective lines.
  Within each irreducible block of the corresponding row or column subgroup algebra choose unitary extensions of
  the polar factors, so that $R = A U_R$ and $C = U_C B$. These extensions remain in their subgroup algebras.
  Then $C R = U_C B A U_R$, and $B A$ has the same singular values as the sweep.
  This identifies the positive operators used throughout the interpolation argument.

Let a representation $cal(H)$ contain at least $L_lambda gt.eq
  1$ copies of $V_lambda$ in a global $S_n$-invariant subspace $S$,
  with the same letter denoting its orthogonal projection. In particular $S$ commutes with the row and column
  operators. Suppose the row and column profiles give finite families ${ E_alpha }$ and ${
  F_beta }$ of projections on $cal(H)$. Within each family the projections are mutually orthogonal,
  and $sum_alpha E_alpha = sum_beta F_beta = I_(cal(H))$. Each projection commutes with $S$;
  $E_alpha$ commutes with the row operator $A$, and $F_beta$ with the column operator $B$. Set

$ J = \# { \( alpha \, beta \) : F_beta E_alpha S eq.not 0 } \, wide w_(alpha beta) =
  parallel F_beta E_alpha S parallel . $

The two projection resolutions and $S eq.not 0$ imply $J gt.eq 1$. Then, for $p gt.eq p_0 > 1$,

#[#set math.equation(numbering: n => "(122)")
 $ T_n^lambda \( p \) lt.eq D_lambda / L_lambda J^(2 p_0) max_(alpha \, beta) w_(alpha beta)^(2 \( p_0 - 1 \))
   "Tr"_(cal(H)) \( B_beta^(2 p) A_alpha^(2 p) \) . $ <rec:hybrid-two-strip>]

Here $A_alpha = A E_alpha$, $B_beta = B F_beta$. In particular $\[ S \, A \] = \[ S \, B \] = 0$.
  Put $r = p \/ p_0$. For $r > 1$, the first analytic family is

$ Z \( z \) = B^(r z) A^(r z) S \, wide 0 lt.eq Re z lt.eq 1 . $

On the operator boundary its norm is at most one. On the other boundary, $Z \( 1 + i t \) =
  B^(i r t) \( B^r A^r S \) A^(i r t)$; this equality uses $\[ S \, A \] = 0$.
  Imaginary powers are contractions on their supports. Interpolating at $1 \/ r$ with exponent $2
  p_0$ on the right boundary gives

$ parallel B A S parallel_(2 p)^(2 p) lt.eq parallel B^r A^r S parallel_(2 p_0)^(2 p_0) . $

For $r = 1$ the assertion is equality. The projection resolutions give $B^r A^r S =
  sum_(alpha \, beta) B_beta^r A_alpha^r S$. Only the $J$ counted pairs contribute, since $B_beta^r A_alpha^r S =
  B_beta^r \( F_beta E_alpha S \) A_alpha^r$. At the fixed exponent $2 p_0$,
  the triangle inequality bounds the last norm by $J max_(alpha \, beta) parallel B_beta^r A_alpha^r S
  parallel_(2 p_0)$. For a pair of profiles use the second family

$ Z_(alpha beta) \( z \) = B_beta^(p z) A_alpha^(p z) S . $

At $z = i t$ this equals $B_beta^(i p t) \( F_beta E_alpha S \) A_alpha^(i p t)$,
  with norm at most $w_(alpha beta)$. On the other boundary the outer imaginary powers again disappear.
  Its squared Hilbert–Schmidt norm is at most

$ "Tr" \( S A_alpha^p B_beta^(2 p) A_alpha^p S \) lt.eq "Tr" \( B_beta^(2 p) A_alpha^(2 p) \) . $

Interpolation at $1 \/ p_0$ therefore yields

$ parallel B_beta^r A_alpha^r S parallel_(2 p_0)^(2 p_0) lt.eq
  w_(alpha beta)^(2 \( p_0 - 1 \)) "Tr" \( B_beta^(2 p) A_alpha^(2 p) \) . $

Complex powers remain zero on zero singular spaces throughout.
  The trace on $S cal(H)$ contains at least $L_lambda$ identical copies of the target block.
  Positivity of the singular power gives $L_lambda "Tr"_lambda \| B_n \|^(2 p) lt.eq
  parallel B A S parallel_(2 p)^(2 p)$. These inequalities prove (122). Both counting powers depend only on $p_0$.
  In the tuple application $S$ is a central $S_n$-isotype; in the signed-color application it is a global color
  isotype. Both commute with the full permutation action and hence reduce $A \, B$ as required.

The finite starting range can be made entirely explicit. Put $n_0 =
  2^(d_0)$ and let $cal(E)_d$ be the hypercube edge transpositions.
  The identity and each member of $cal(E)_d$ have a specified sweep realization of probability $epsilon_n =
  2^(- n d \/ 2)$. For a unit vector $v$ in a nontrivial irreducible,
  the variance identity for two independent sweep permutations gives

$ 1 - parallel B_n v parallel^2 = 1 / 2 bb(E)_(g \, h) parallel rho \( g \) v - rho \( h \) v parallel^2 gt.eq
  epsilon_n^2 sum_(e in cal(E)_d) parallel \( rho \( e \) - I \) v parallel^2 . $

Every permutation is a word of at most $2 n^2$ edge transpositions:
  a vertex transposition uses a path of length at most $d$ and its return, and at most $n -
  1$ vertex transpositions suffice. Telescoping along such a word and using Cauchy–Schwarz,
  then averaging uniformly over $S_n$, gives

$ 2 = bb(E)_(g in S_n) parallel rho \( g \) v - v parallel^2 lt.eq \( 2 n^2 \)^2 sum_(e in cal(E)_d)
  parallel \( rho \( e \) - I \) v parallel^2 . $

The equality uses the absence of invariant vectors in a nontrivial irreducible. Thus the exact squared-norm gap is

$ parallel B_n parallel_(upright("op"))^2 lt.eq 1 - frac(2^(- n d), 2 n^4) . $

It is therefore enough to take, after the absolute threshold $d_0$ has been fixed,

#[#set math.equation(numbering: n => "(123)")
 $ p gt.eq 2^(n_0 d_0 + 1) n_0^5 \( Lambda + 2 \) log n_0 . $ <rec:hybrid-explicit-base>]

Indeed, with $Gamma_0 = 2^(- n_0 d_0) \/ \( 2 n_0^4 \)$, every nontrivial starting block has squared norm at most
  $e^(- Gamma_0)$. The unnormalized trace has $D_lambda$ eigenvalues, and $D_lambda lt.eq n ! lt.eq n_0^(n_0)$, so

$ log T_n^lambda \( p \) lt.eq 2 n_0 log n_0 - p Gamma_0 lt.eq - Lambda n_0 log n_0 . $

The level-budget exponent is at least $- Lambda n_0 log n_0$ on these sizes,
  and the diagram budget is nonnegative; zero blocks are automatic.
  This deliberately crude choice therefore proves both starting targets and makes the order of choices noncircular.

===== 2.8.2 Small levels by path cancellation <small-levels-by-path-cancellation>

For all sufficiently large $d$ and $1 lt.eq k lt.eq n^(3 \/ 5)$ we claim

#[#set math.equation(numbering: n => "(124)")
 $ parallel B_n \|_(V_lambda) parallel_(upright("op")) lt.eq e^(- c_s k log n) $ <rec:hybrid-sparse>]

for an absolute $c_s > 0$. We prove this on the injective $k$-tuple module.
  Its $lambda$-isotype has multiplicity $D_(macron(lambda))$,
  where $macron(lambda)$ is the diagram below the first row.
  Zero extension to all $k$-tuples, with uniform product measure,
  multiplies every squared norm by the same factor $\( n \)_k \/ n^k$.
  An isotype vector has zero average in each separate coordinate:
  otherwise its averaging would give a nonzero copy of $lambda$ in the $\( k - 1 \)$-tuple module,
  contrary to branching.

Let $x \, y$ be independent uniform $k$-tuples. For $I subset.eq \[ k \]$,
  let $g_I \( x \, y \)$ be $n^(\| I \|)$ times the endpoint transition probability for the labels in $I$,
  extended by zero when either restricted tuple is noninjective and then lifted to all coordinates.
  Set $g_diameter = 1$. On injective $x \, y$, define a potential contact between two labels as follows.
  If $t$ is their last differing input bit in sweep order, their output prefixes of length $t - 1$ must agree.
  Their prescribed paths then enter opposite sides of the same switch at time $t$.
  The prescribed routes are incompatible if their output bits also agree at time $t$.
  Otherwise the shared switch saves one of the $\| I \| d$ independent coin requirements.
  It follows that $g_I = 0$ on incompatible routes and $g_I = 2^(e_I)$ on compatible routes,
  where $e_I$ counts potential contacts within $I$. Indeed,
  the input suffix and output prefix specify the position before every layer;
  a collision of prescribed positions would already give an incompatible potential contact.

In a bilinear form between the zero-extended isotype vectors,
  we may replace $g_(\[ k \])$ by $sum_(I subset.eq \[ k \]) \( - 1 \)^(k - \| I \|) g_I$.
  Each omitted-coordinate term vanishes by the preceding zero-average property.
  On injective $x \, y$ this centered kernel vanishes unless the potential-contact graph has no isolated vertex:
  toggle any isolated label in the sum. Its squared Hilbert–Schmidt norm is consequently at most

#[#set math.equation(numbering: n => "(125)")
 $ 4^k max_(I subset.eq \[ k \]) bb(E)_(x \, y) #h(-0.16667em)
   [upright(bold(1))_({ x \, y med upright("injective") }) upright(bold(1))_({
   upright("every label has a potential contact") }) g_I^2] . $ <s:hybrid-centered-kernel-square>]

All expectations in this display use uniform product measure.

Use one factor of $g_I$ as a change of measure. Namely, sample the $q = \|
  I \|$ input sites uniformly without replacement and move them through an independent complete switch field
  $omega$; labels outside $I$ retain independent uniform inputs and outputs.
  The probability that the original independent inputs in $I$ were injective is at most one,
  so it can be discarded in an upper bound. The remaining factor is $2^(e_I)$,
  now counting encounters of the $q$ sampled actual paths. We may also discard injectivity conditions on outside
  labels. When their inputs coincide we define no potential edge between them;
  this convention agrees with the original event whenever all inputs are injective.

Fix $omega$. Its encounter graph $cal(G)_omega$ has the $n$ initial sites as vertices;
  two vertices are adjacent when their actual paths share a switch.
  A path has at most one such contact per layer, so the degree is at most $d$. Two paths meet at most once:
  after a meeting they differ in the edited bit, which is never edited again.
  For any $s$ vertices there are at most $s log_2 s \/ 2$ induced edges.
  To verify this, merge the input suffix classes in a binary tree.
  At a merge with selected child counts $h \, s - h$, the new contacts form a matching,
  of size at most $min \( h \, s - h \)$. The inequality

$ 2 min \( h \, s - h \) lt.eq s log_2 s - h log_2 h - \( s - h \) log_2 \( s - h \) $

telescopes over the tree. Thus a sampled component of size $s$ has weight at most $s^(s \/ 2)$.

For the uniform injective sample of size $q lt.eq k$, let $L$ be the number of sampled vertices in nonsingleton
  induced components, let $J$ be the number of these components,
  and let $E_I$ be the number of sampled induced edges. We prove the precise weighted estimate

#[#set math.equation(numbering: n => "(126)")
 $ bb(E) #h(-0.16667em) [upright(bold(1))_({ L = l \, J = j }) 2^(E_I) thin mid(bar.v) thin omega] lt.eq
   e^(C k log \( d + 1 \)) k^(3 l \/ 2 - 2 j) / n^(l - j) . $ <rec:hybrid-component-count>]

The case $l = j = 0$ has right-hand side at least one. For $j > 0$,
  enumerate ordered disjoint connected vertex sets of sizes $s_1 \, dots.h \, s_j gt.eq 2$, with sum $l$.
  There are at most $2^l$ size lists. A connected set of size $s$ can be encoded by a rooted plane spanning tree,
  a root vertex, and a neighbor index for each tree edge. There are at most $4^(s - 1)$ plane tree shapes,
  so at most $n \( 4 d \)^(s - 1)$ such encodings. An encoding may be redundant; it is used only for an upper bound.

Assign distinct sample labels to the chosen vertices in at most $k^l$ ways.
  Prescribed distinct placements of those labels have probability $1 \/ \( n \)_l$.
  On the event $L = l \, J = j$, the actual components give at least $j !$ ordered witnesses.
  Each such witness, weighted by $product_h s_h^(s_h \/ 2)$, bounds $2^(E_I)$. Hence the expectation is at most

$ frac(2^l n^j \( 4 d \)^(l - j) k^l, j ! \( n \)_l) max_(s_1 + dots.h.c + s_j = l) product_h s_h^(s_h \/ 2) . $

For $2 lt.eq s lt.eq k$, $s^(s \/ 2) = s thin s^(\( s - 2 \) \/ 2) lt.eq e^s k^(\( s - 2 \) \/ 2)$,
  so the product is at most $e^l k^(\( l - 2 j \) \/ 2)$. Moreover $\( n \)_l gt.eq \( n \/ e \)^l$ and $1 \/ j !
  lt.eq e^(C k) k^(- j)$, the latter following from $j ! gt.eq \( j \/ e \)^j$ and $j log \( k \/ j \) lt.eq
  k \/ e$. These bounds prove (126), uniformly in the fixed switch field.

Put $z = log k \/ log n lt.eq 3 \/ 5$. The logarithm of the ratio in (126), divided by $log n$, is

$ \( 3 z \/ 2 - 1 \) l + \( 1 - 2 z \) j lt.eq - l \/ 10 . $

For $z gt.eq 1 \/ 2$ both coefficients have the required sign; for $z < 1 \/ 2$, use $j lt.eq
  l \/ 2$ to obtain the stronger bound $- \( 1 - z \) l \/ 2$.
  Thus $l gt.eq k \/ 4$ supplies a saving of order $k log n$.

If $l < k \/ 4$ and $q gt.eq k \/ 2$, expose the outside endpoints before sampling the $q$ base paths.
  Each prescribed outside path has at most $d$ possible base-path neighbors:
  at every layer exactly one base path occupies the opposite pre-switch site.
  Coverage therefore requires at least $h = ceil.l k \/ 4 ceil.r$ further sampled labels,
  outside the nonsingleton components, to belong to a set of at most $k d$ initial sites.
  In the preceding witness count, choose these labels in at most $2^k$ ways and prescribe their sites in at most
  $\( k d \)^h$ ways, using $1 \/ \( n \)_(l + h)$ for the joint distinct placements.
  Since $l + h lt.eq q lt.eq k$, this inserts the factor $e^(O \( k \)) \( k d \/ n \)^h$ in the same weighted bound.

If $q < k \/ 2$, condition on all sampled trajectories. Let $o = k - q$.
  To cover the outside vertices choose a rooted forest whose components either end at a sampled label or have one
  free outside root. Every component of the second kind contains at least two outside vertices,
  so there are at most $o \/ 2$ free roots and at least $o \/ 2$ forest edges.
  Root choices cost at most $2^o$ and each other vertex has at most $k$ parent choices.
  Expose each parent before its child. For a fixed contact time, the child’s required input suffix,
  opposite input bit, and output prefix jointly have probability $1 \/ n$; summing over times gives $d \/ n$.
  Thus, uniformly in the sampled trajectories, coverage costs at most $2^o \( k d \/ n \)^(o \/ 2)$ for all large $d$.

In each case the additional power of $k d \/ n$ or the bound $n^(- l \/ 10)$ saves a fixed multiple of $k log n$.
  The costs $O \( k log \( d + 1 \) \)$, the at most $\( k + 1 \)^2$ choices of $l \, j$,
  and the $4^k$ in (125) are smaller than that saving when $d$ is large.
  The resulting Hilbert–Schmidt bound for the centered kernel proves (124), after decreasing $c_s$.
  When $k = 1$ the centered kernel is zero. Finally $D_lambda lt.eq binom(n, k) D_(macron(lambda)) lt.eq n^k$,
  so $T_n^lambda \( p \) lt.eq n^(2 k) e^(- 2 p c_s k log n)$.
  Choosing a fixed $p$ sufficiently large in terms of $Lambda \, c_s$ proves the level budget in this range;
  it also proves the nonnegative diagram budget there.

===== 2.8.3 A tuple frame that includes full rows <a-tuple-frame-that-includes-full-rows>

The sparse estimate settles the small levels. For larger levels we need both the angle and the trace endpoint
  in (122). We first construct a frame with total norm cost $e^(C k)$;
  the entropy saving will come from centering the resulting pieces.

For definiteness take the first bit batch to have $floor.l d \/ 2 floor.r$ bits.
  Thus the grid has $a = 2^(ceil.l d \/ 2 ceil.r)$ rows and $b = 2^(floor.l d \/ 2 floor.r)$ columns; put $m = b$.
  For larger $k$, work on the injective $k$-tuple module. Here $E_alpha$ and $F_beta$ are products of the local
  row and column Specht-isotypic projections, with full shape profiles $alpha = \( mu_i \)_i$ and
  $beta = \( nu_j \)_j$, where $mu_i tack.r b$ and $nu_j tack.r a$.
  Let the local levels be $s_i = b - \( mu_i \)_1$ and $t_j = a - \( nu_j \)_1$, with totals $J_s \, J_t lt.eq k$,
  and put $C_1 = sum_i s_i log \( b \/ s_i \) + sum_j t_j log \( a \/ t_j \)$. The required angle estimate is

#[#set math.equation(numbering: n => "(127)")
 $ log w lt.eq C k - 1 / 4 { k log \( n \/ k \) - C_1 }_(+) . $ <rec:hybrid-tuple-angle>]

We give the full frame construction, including completely occupied rows. Fix the tuple’s row assignment.
  In one row let $b$ be the number of sites, $u$ the number of tuple labels, and $s = b - mu_1$ the local level.
  Branching requires $0 lt.eq s lt.eq u lt.eq b$. Identify its observed labels with $\[ u \]$ and embed its
  function isometrically in $L^2 \( S_b \)$ by completing to $b$ labels and ignoring those outside $\[ u \]$.
  All measures here are uniform probability measures.

For $Z subset.eq \[ b \]$, let $P_Z$ be conditional averaging given the values at labels in $Z$.
  This is a right-subgroup average, commuting with the left action on values.
  The sum over $\| Z \| = s$ is right central. In the regular representation,
  the whole left $mu$-isotypic space is $V_mu ⊗ V_mu^(*)$, with right action on the paired carrier.
  The invariant dimension for a subgroup permuting the $b -
  s$ complementary labels is $D_(macron(mu))$ by branching, where $macron(mu)$ is the lower diagram.
  Taking the trace on that right carrier therefore proves

#[#set math.equation(numbering: n => "(128)")
 $ sum_(\| Z \| = s) P_Z = kappa I \, wide kappa = binom(b, s) D_(macron(mu)) / D_mu gt.eq
   1 $ <rec:hybrid-frame-scalar>]

on the entire left isotypic space, including its multiplicity.
  The inequality follows by choosing the entries below the first row of a standard tableau.
  Each $P_Z f$ remains in this left type and is harmonic in its $s$ selected values:
  a function of fewer selected labels cannot contain a type of level $s$.

Since $P_(\[ u \]) f = f$, recover the original function by applying $P_(\[ u \])$ to (128).
  Put $l = \| Z \\ \[ u \] \|$ and $v = b - u$. The only possible indices satisfy

#[#set math.equation(numbering: n => "(129)")
 $ 0 lt.eq l lt.eq min \( s \, v \) \, wide \| Z ∩ \[ u \] \| = s - l . $ <rec:hybrid-frame-feasible>]

For such $l$, conditional averaging of the unobserved values in $P_Z f$ is precisely

#[#set math.equation(numbering: n => "(130)")
 $ P_(\[ u \]) P_Z f =
   frac(\( - 1 \)^l, \( v \)_l)
   sum_(phi : Z \\ \[ u \] arrow.r.hook \[ u \] \\ Z) \( P_Z f \) \|_(x_z = x_(phi \( z \)) \, med z in Z \\ \[
   u \]) . $ <rec:hybrid-frame-reassignment>]

To prove this identity, average the $l$ unobserved arguments injectively over the values not used by the observed
  $u$ labels. Starting with distinctness among the selected arguments,
  use inclusion–exclusion to forbid also the values at $\[ u \] \\ Z$.
  Every term leaving an argument unassigned to one of these values vanishes by harmonicity.
  The surviving assignments are exactly the injections $phi$ in the display, each with sign $\( - 1 \)^l$.
  Their number is $\( u - s + l \)_l lt.eq \( u \)_l$. Every reassigned function has the same norm as $P_Z f$,
  since its $s$ distinct observed values have the same uniform injective marginal distribution.

Use $\( v \)_0 = \( u \)_0 = 1$, also when $v = 0$. For $l > 0$ in (129), $v gt.eq l$,
  so the denominator is strictly positive. In particular, for a full row $u = b$ only $l = 0$ occurs;
  no quotient with a zero falling factorial is evaluated. By Cauchy–Schwarz and $sum_(\| Z \| = s) parallel P_Z f
  parallel^2 = kappa parallel f parallel^2$, the sum of the norms of the reassigned pieces,
  after division by $kappa$, is bounded by $C_(b \, u \, s) parallel f parallel$, where

#[#set math.equation(numbering: n => "(131)")
 $ C_(b \, u \, s) =
   kappa^(- 1 \/ 2)
   [sum_(l = 0)^(min \( s \, v \)) binom(u, s - l) binom(v, l) (frac(\( u \)_l, \( v \)_l))^2]^(1 \/ 2) lt.eq
   e^(C u) . $ <rec:hybrid-frame-cost>]

An empty row has $u = s = 0$ and cost one. For a full row,
  the expression is $kappa^(- 1 \/ 2) binom(b, s)^(1 \/ 2) lt.eq 2^(u \/ 2)$.
  More generally, if $v < 2 u$, then for every feasible $l$ $\( u \)_l \/ \( v \)_l =
  binom(u, l) \/ binom(v, l) lt.eq 2^u$. Vandermonde’s identity bounds the sum of the binomial factors by
  $binom(b, s) lt.eq 2^b lt.eq 2^(3 u)$, proving the stated cost in this dense case.
  If $v gt.eq 2 u$, then $l lt.eq u lt.eq v \/ 2$ and, for $l > 0$,

$ binom(v, l) (frac(\( u \)_l, \( v \)_l))^2 lt.eq (frac(4 e u^2, v l))^l . $

Using $binom(u, s - l) lt.eq 2^u$ and $sum_(l gt.eq 0) \( A \/ l \)^l lt.eq e^A$ with the $l =
  0$ term defined as one (termwise, $l ! lt.eq l^l$), where $A = 4 e u^2 \/ v lt.eq 2 e u$,
  proves (131) in the sparse case as well.

The construction also applies to entangled row vectors. With the fixed row assignment denoted by
  $upright(bold(u))$, take $P_(upright(bold(Z))) = product_i P_(Z_i)$ on the completed-label product space.
  The product of the central sums acts as $product_i kappa_i$ times identity on the full product isotypic space.
  Consequently

$ f_(upright(bold(u))) = \( product_i kappa_i \)^(- 1) sum_(upright(bold(Z))) \( product_i P_(\[ u_i \]) \)
  P_(upright(bold(Z))) f_(upright(bold(u))) \, wide sum_(upright(bold(Z))) parallel P_(upright(bold(Z)))
  f_(upright(bold(u))) parallel^2 = \( product_i kappa_i \) parallel f_(upright(bold(u))) parallel^2 . $

Conditional averaging and harmonicity hold with all other row variables fixed.
  Weighted Cauchy–Schwarz in this identity therefore multiplies the costs in (131),
  without any assumption that $f_(upright(bold(u)))$ is a tensor product.
  Since $sum_i u_i = k$, the total cost is $e^(C k)$.

Group the reassigned pieces by their global exceptional subset $X subset.eq \[ k \]$.
  In the independent-coordinate extension they have the form $H_X \( upright(bold(u)) \, upright(bold(v))_X \)
  upright(bold(1))_(upright("distinct"))$, with $\| X \| = J_s$ and at most $2^k$ subsets.
  In each supported row pattern, exactly $s_i$ labels of $X$ lie in row $i$.
  Set the raw function to zero on unsupported row patterns and on collisions among its selected columns.
  Conditional on a row pattern, the selected injective columns have the same marginals as under full row
  injectivity. Moreover the probability of full row injectivity is $product_i \( b \)_(u_i) \/ b^(u_i) gt.eq
  e^(- k)$. Thus the raw independent-coordinate norms still cost at most $e^(C k)$.
  A column-isotype vector has the analogous pieces $G_Y \( upright(bold(u))_Y \, upright(bold(v)) \)
  upright(bold(1))_(upright("distinct"))$, where $\| Y \| = J_t$ and exactly $t_j$ labels of $Y$ lie in column $j$.

===== 2.8.4 Conditional collisions and localization <conditional-collisions-and-localization>

The frame has paid only $e^(C k)$ and has not yet produced the saving in (127).
  We now use centering to force collisions among omitted labels,
  and localize the selected labels using their row and column counts.

The vectors in the global level-$k$ type are harmonic after zero extension.
  Insert the centering projection $Pi = product_(ell = 1)^k \( I - M_ell \)$ into their inner product,
  where $M_ell$ averages the independent cell of label $ell$.
  For labels in $X union Y$, expand this product and let $I subset.eq X union
  Y$ be the subset on which the identity factor is chosen. Write the cells supplied to the two functions as
  $\( U_ell^H \, V_ell^H \)$ and $\( U_ell^G \, V_ell^G \)$. For $ell in I$ these are the same uniform cell.
  For $ell in \( X union Y \) \\ I$ they are independent uniform cells. Different labels are independent.
  In particular a label in $\( X ∩ Y \) \\ I$ supplies two independent selected cells; it is not a shared selected cell.

For each missing label in $Z = \[ k \] \\ \( X union Y \)$,
  couple its two choices using main row and column variables $\( U_ell \, V_ell \)$ and independent alternates
  $\( U'_ell \, V'_ell \)$. The identity choice uses $\( U_ell \, V_ell \)$ on both sides;
  the averaging choice uses $\( U_ell \, V'_ell \)$ in $H_X$ and $\( U'_ell \, V_ell \)$ in $G_Y$.
  The raw functions always see the same needed row $U_ell$ and column $V_ell$.
  Hence toggling a missing label changes only the two distinctness indicators.
  Their alternating sum cancels unless that label has a possible same-cell collision in some choice of side and
  cell version. Put $M = \| Z \|$ and condition first on all nonmissing variables.
  The raw functions have separated remaining variables $H \( U \) \, G \( V \)$.
  Whenever the alternating sum is nonzero, the graph of possible collisions has a forest covering the missing
  vertices. In every component meeting nonmissing vertices,
  grow a forest from all those vertices as separate roots; then each tree has exactly one nonmissing root.
  Span each wholly missing component by one tree, which has at least two vertices and needs one free root.
  Thus every child exposed along a forest edge is missing, and there are at least $M \/ 2$ edges.
  Choosing parents, sides, and cell versions costs $e^(O \( k \)) k^(upright("number of edges"))$.
  Exposing parent before child, each specified child cell is independent uniform, so every edge costs $1 \/ n$.
  Uniformly under the conditioning, the coverage probability is at most $e^(O \( k \)) \( k \/ n \)^(M \/ 2)$.

Let $K \( U \, V \)$ be the alternating sum after averaging alternate coordinates.
  Jensen’s inequality and its $2^M$ summands give $bb(E) \| K \|^2 lt.eq 4^M Pr \( upright("coverage") \)$.
  It vanishes unless the cells in $O = X ∩ Y ∩ I$ are distinct.
  Writing $A_1 = \( bb(E)_U \| H \|^2 \)^(1 \/ 2)$ and $B_1 = \( bb(E)_V \| G \|^2 \)^(1 \/ 2)$,
  the conditional Cauchy–Schwarz bound is therefore

#[#set math.equation(numbering: n => "(132)")
 $ e^(O \( k \)) \( k \/ n \)^(M \/ 4) upright(bold(1))_({ O upright(" distinct") }) A_1 B_1 .
   $ <s:conditional-collision-weight>]

Here the factorization $bb(E)_(U \, V) \| H \( U \) G \( V \) \|^2 = A_1^2 B_1^2$ is essential:
  an unconditional probability estimate alone would not control the weighted functions.

The dependence of these two weights will also matter in the next step. Put $N = X union Y$.
  After averaging the missing rows, $A_1$ is measurable with respect to

$ cal(F)_H = sigma #scale(x: 120%, y: 120%)[\(] \( U_ell^H \)_(ell in N) \, \( V_ell^H \)_(ell in X)
  #scale(x: 120%, y: 120%)[\)] . $

Similarly, after averaging the missing columns, $B_1$ is measurable with respect to

$ cal(F)_G = sigma #scale(x: 120%, y: 120%)[\(] \( V_ell^G \)_(ell in N) \, \( U_ell^G \)_(ell in Y)
  #scale(x: 120%, y: 120%)[\)] . $

Only the cells in $O = X ∩ Y ∩ I$ are selected on both sides with a shared value.
  Given $cal(F)_H$, the columns $\( V_ell^G \)_(ell in Y \\ O)$ are still independent and uniform;
  given $cal(F)_G$, the rows $\( U_ell^H \)_(ell in X \\ O)$ have the analogous property.
  For a label selected on both sides but outside $I$, this follows from the independent versions just specified.

Stratify the nonmissing variables by the row and column counts $p_i \, q_j$ of $O$, whose size is $o$.
  There are at most $\( k + 1 \)^(a + b) = e^(O \( k \))$ strata because $k gt.eq
  n^(3 \/ 5)$ and the grid is balanced. On a realizable stratum $p_i lt.eq s_i \, q_j lt.eq t_j$.
  For $o > 0$, the entropy of the uniform measure on its distinct cells is $log o$,
  bounded by the sum of its marginal entropies. Hence

$ sum_i p_i log \( b \/ p_i \) + sum_j q_j log \( a \/ q_j \) gt.eq o log \( n \/ o \) . $

Using $sum_i p_i log \( s_i \/ p_i \) lt.eq J_s \/ e$ and its column analogue,
  with zero terms interpreted continuously, gives

#[#set math.equation(numbering: n => "(133)")
 $ sum_i p_i log \( b \/ s_i \) + sum_j q_j log \( a \/ t_j \) gt.eq o log \( n \/ k \) -
   2 k \/ e . $ <s:overlap-marginal-entropy>]

This is also true when $o = 0$.

We make the localization step explicit. In the average of $A_1 B_1$ on a stratum, apply Cauchy–Schwarz,
  keeping the stratum and the $Y$-column profile in the $A_1^2$ factor and the stratum and the $X$-row profile in
  the $B_1^2$ factor. Given $cal(F)_H$, the cells of $O$ are known and the columns seen by $G$ on $Y \\ O$ remain
  independent uniform columns. The probability of the remaining column counts $r_j = t_j - q_j$,
  with $N_Y = \| Y \| - o$, is multinomial. Its logarithm is at most

$ log frac(N_Y !, product_j r_j !) - N_Y log b & lt.eq - N_Y log \( n \/ k \) + sum_j r_j log \( a \/ t_j \) +
  O \( k \) . $

Indeed $N_Y ! lt.eq k^(N_Y)$, $r ! gt.eq \( r \/ e \)^r$, and $sum_j r_j log \( t_j \/ r_j \) lt.eq J_t \/ e$.
  For the other factor the same argument gives the probability bound

$ exp {- \( \| X \| - o \) log \( n \/ k \) + sum_i \( s_i - p_i \) log \( b \/ s_i \) + O \( k \)} . $

The unweighted second moments are the squared raw norms. Taking square roots of the two probabilities and using
  (133) bounds the localization factor by

$ parallel H parallel_2 parallel G parallel_2 exp {O \( k \) - 1 /
  2 \[ \( \| X \| + \| Y \| - o \) log \( n \/ k \) - C_1 \]} . $

Also $\| X \| + \| Y \| - o gt.eq \| X union Y \| = k - M$, and the trivial Cauchy–Schwarz bound is available.
  We thus obtain the positive-part saving $1 / 2 \( \( k - M \) log \( n \/ k \) - C_1 \)_(+)$.
  Finally, for $L = log \( n \/ k \) gt.eq 0$,

$ M L \/ 4 + \( \( k - M \) L - C_1 \)_(+) \/ 2 gt.eq \( k L - C_1 \)_(+) \/ 4 . $

Combining this with (132), and summing the strata, centering choices, and frame pieces, proves (127).

===== 2.8.5 The tuple trace endpoint <the-tuple-trace-endpoint>

The angle estimate (127) is now complete. It remains to bound the positive trace endpoint,
  including the global copy count and all row and column assignment factors.
  We now estimate the trace endpoint in (122). Write $n = a b$,
  with $a$ rows of size $b$ and $b$ columns of size $a$. Put $X = A_alpha^(2 p)$ and $Y =
  B_beta^(2 p)$ on the injective tuple module. In a diagonal entry of $Y X$,
  an intermediate tuple must have both the starting row assignment, because $X$ preserves rows,
  and the starting column assignment, because $Y$ preserves columns. It is therefore the starting tuple itself.
  Consequently

$ "Tr" \( Y X \) = sum_(z med upright("injective")) Y \( z \, z \) X \( z \, z \) \, $

and both diagonals are nonnegative.

For a tuple with column counts $v_j$, consider the local positive group-algebra element of $Y$ in column $j$.
  Its identity coefficient is $T_a^(nu_j) \( p \) \/ a !$ and the modulus of every coefficient is at most this
  value, by positivity in the regular representation. The diagonal entry in the local tuple action sums
  coefficients on the pointwise stabilizer of its $v_j$ labels, of size $\( a - v_j \) !$.
  It is thus at most $T_a^(nu_j) \( p \) \/ \( a \)_(v_j)$.
  Equivalently this is positive coefficient restriction to that stabilizer.
  Since $sum_j v_j = k$ and $\( a \)_v gt.eq \( a \/ e \)^v$,

#[#set math.equation(numbering: n => "(134)")
 $ Y \( z \, z \) lt.eq \( e \/ a \)^k product_j T_a^(nu_j) \( p \) . $ <s:hybrid-tuple-column-diagonal>]

Fix the complete row assignment of the labeled tuple, with counts $u_i$.
  The local row tuple module is $"Ind"_(S_(b - u_i))^(S_b) upright(bold(1))$,
  in which the multiplicity of $mu_i = \( b - s_i \, macron(mu)_i \)$ is $f^(mu_i \/ \( b - u_i \))$.
  It is zero if $u_i < s_i$. Otherwise separating the entries below the first row gives

$ f^(mu_i \/ \( b - u_i \)) lt.eq binom(u_i, s_i) D_(macron(mu)_i) . $

The hook formula also gives

#[#set math.equation(numbering: n => "(135)")
 $ D_(mu_i) gt.eq e^(- s_i) binom(b, s_i) D_(macron(mu)_i) . $ <s:hybrid-first-row-dimension>]

Indeed the hooks below the first row are exactly those of $macron(mu)_i$.
  If $r = b - s_i$, the first-row hook product divided by $r !$ is
  $product_(h = 1)^r \( 1 + \( macron(mu)_i \)'_h \/ \( r - h + 1 \) \)$;
  its logarithm is at most $sum_h \( macron(mu)_i \)'_h = s_i$.

The trace of the local row operator is its irreducible trace times this multiplicity.
  Hence, for the fixed row assignment, its total row trace equals

$ product_i T_b^(mu_i) \( p \) f^(mu_i \/ \( b - u_i \)) / D_(mu_i) . $

Using (135), $binom(b, s) gt.eq \( b \/ s \)^s$, and $binom(u, s) lt.eq \( e u \/ s \)^s$,
  the product of ratios is at most

$ exp {- C_H + O \( k \)} \, wide C_H = sum_i s_i log \( b \/ s_i \) . $

Here $sum_i s_i log \( u_i \/ s_i \) lt.eq sum_i u_i \/ e = k \/ e$ and $sum_i s_i lt.eq k$;
  zero terms are interpreted continuously.

The number of row assignments with every $u_i gt.eq s_i$ is at most

#[#set math.equation(numbering: n => "(136)")
 $ a^k exp { C_H - J_s log \( n \/ k \) + O \( k \) } . $ <s:hybrid-row-assignment-count>]

For a uniform independent row assignment, choose disjoint witness sets of $s_i$ labels required to hit row $i$.
  There are at most $k^(J_s) \/ product_i s_i !$ such choices, each of probability $a^(- J_s)$.
  The union bound and $s ! gt.eq \( s \/ e \)^s$ give

$ log Pr \( u_i gt.eq s_i med forall i \) lt.eq J_s log \( k \/ a \) - sum_i s_i log s_i + O \( k \) = C_H -
  J_s log \( n \/ k \) + O \( k \) \, $

which proves (136).

Combine the trace per assignment, the count of assignments, and (134). The $a^k$ cancels and gives

$ "Tr" \( Y X \) lt.eq (product_i T_b^(mu_i) \( p \) product_j T_a^(nu_j) \( p \))
  e^(- J_s log \( n \/ k \) + O \( k \)) . $

Interchanging rows and columns gives the same inequality with $J_t$.
  The global tuple multiplicity is $L_lambda = D_(macron(lambda))$, and $D_lambda \/ L_lambda lt.eq
  binom(n, k) lt.eq \( e n \/ k \)^k$. Thus the full normalized endpoint satisfies

#[#set math.equation(numbering: n => "(137)")
 $ log (D_lambda / L_lambda "Tr" \( Y X \)) lt.eq sum_i log T_b^(mu_i) \( p \) +
   sum_j log T_a^(nu_j) \( p \) + \( k - max \( J_s \, J_t \) \) log \( n \/ k \) +
   O \( k \) . $ <rec:hybrid-tuple-trace>]

Pairs with zero endpoint require no logarithmic estimate.
  There are only $e^(O \( k \))$ relevant profile pairs in this range.
  Indeed the level lists have at most $\( k + 1 \)^(a + b)$ choices, and, for fixed lists,
  the partition bound gives at most $exp \( C sum_i sqrt(s_i) + C sum_j sqrt(t_j) \)$ tail choices.
  Cauchy–Schwarz bounds the exponent by $O \( sqrt(a k) + sqrt(b k) \)$.
  Since $a \, b asymp sqrt(n)$ and $k gt.eq n^(3 \/ 5)$, both this exponent and $\( a + b \)
  log \( k + 1 \)$ are $O \( k \)$.

===== 2.8.6 Closing the level budget <closing-the-level-budget>

In both inductions, a trivial child has $T = 1$ and zero level and diagram budgets.
  If a child sweep block is zero, its profile has zero trace endpoint and can be discarded.
  Every remaining child satisfies the height condition by Lemma 3,
  so the stated induction hypotheses apply to all child terms retained below.

Insert the angle (127), the endpoint bound (137), and the profile count into (122).
  The remaining task is to compare the sum of child level budgets with the parent budget.
  Write $delta = log \( n \/ k \) \/ log n$, let $omega_i = \( s_i \/ k \) \( log b \/ log n \)$ for row factors
  and use the corresponding column weights. For a positive local level $s_i$ in a block of size $m_i$,
  put $delta_i = log \( m_i \/ s_i \) \/ log m_i$, where $m_i = b$ on rows and $m_i =
  a$ on columns (with $s_i$ replaced by $t_i$ there). At level zero set $delta_i = 0$;
  its weight is zero and the trivial child moment is one. Put

$ macron(u) = max { u_(floor.l d \/ 2 floor.r) \, u_(ceil.l d \/ 2 ceil.r) } \, wide W_0 = sum omega_i \, wide
  xi = \( delta - sum omega_i delta_i \)_(+) . $

Then

$ W_0 lt.eq max \( J_s \, J_t \) \/ k \, wide sum omega_i delta_i^2 gt.eq \( 2 - W_0 \) delta^2 - 2 xi . $

For the second inequality, expand $sum_i omega_i \( delta_i - delta \)^2 gt.eq
  0$ and use $sum_i omega_i delta_i gt.eq delta - xi$. This gives $sum_i omega_i delta_i^2 gt.eq \( 2 - W_0 \)
  delta^2 - 2 delta xi$; since $0 lt.eq delta lt.eq 1$, it implies the displayed bound.
  Subtracting the target level budget and dividing by $k log n$ leaves at most

#[#set math.equation(numbering: n => "(138)")
 $ - \( macron(u) + Lambda delta^2 - delta \) \( 1 - W_0 \) + \( 2 Lambda - \( p_0 - 1 \) \/ 2 \)
   xi - \( u_d - macron(u) \) + O \( p_0 \/ log n \) . $ <rec:hybrid-level-close>]

The first two terms are nonpositive by (119); the parameter increment,
  of order $d^(- 1 \/ 3)$ at a balanced split, pays the last error. This proves (121).

===== 2.8.7 Long chains and the diagram dimension <long-chains-and-the-diagram-dimension>

It remains to treat $delta < epsilon.alt$, so $k gt.eq n^(1 - epsilon.alt)$.
  For the two moment inequalities we may assume the parent block is nonzero,
  since zero moments were handled above. Throughout this subsection the theorem’s height condition is $lambda'_1
  lt.eq n \/ 2$. Put $T = n^(1 - gamma_d)$ and let $a_1 \, b_1$ be the numbers of full rows and full columns of
  $lambda$ of length at least $T$. Split the diagram into all boxes in its top $a_1$ rows,
  then all boxes in its first $b_1$ columns below those rows,
  and the translated straight diagram $theta$ remaining in the lower right (Figure 2).
  The first two regions are disjoint chains, with lengths $eta_i =
  lambda_i$ and $zeta_j = \( lambda'_j - a_1 \)_(+)$, respectively. Write

$ R = \| theta \| \, wide M = n - R \, wide G = sum_(l med upright("in") med eta \, zeta) l log \( M \/ l \) \,
  wide D_0 = 1 + a_1 + b_1 = O \( n^0.01 \) . $

The bound on $D_0$ follows from $a_1 \, b_1 lt.eq n \/ T = n^(gamma_d)$ and $gamma_d < 0.01$. Set $G = 0$ when $M = 0$.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (0.38, -0.38), fill: rgb("#d6d6ff"), stroke: none)
  rect((0, 0), (0.38, -0.38), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((0.38, 0), (0.76, -0.38), fill: rgb("#d6d6ff"), stroke: none)
  rect((0.38, 0), (0.76, -0.38), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((0.76, 0), (1.14, -0.38), fill: rgb("#d6d6ff"), stroke: none)
  rect((0.76, 0), (1.14, -0.38), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((1.14, 0), (1.52, -0.38), fill: rgb("#d6d6ff"), stroke: none)
  rect((1.14, 0), (1.52, -0.38), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((1.52, 0), (1.9, -0.38), fill: rgb("#d6d6ff"), stroke: none)
  rect((1.52, 0), (1.9, -0.38), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((1.9, 0), (2.28, -0.38), fill: rgb("#d6d6ff"), stroke: none)
  rect((1.9, 0), (2.28, -0.38), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((2.28, 0), (2.66, -0.38), fill: rgb("#d6d6ff"), stroke: none)
  rect((2.28, 0), (2.66, -0.38), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((2.66, 0), (3.04, -0.38), fill: rgb("#d6d6ff"), stroke: none)
  rect((2.66, 0), (3.04, -0.38), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((3.04, 0), (3.42, -0.38), fill: rgb("#d6d6ff"), stroke: none)
  rect((3.04, 0), (3.42, -0.38), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((0, -0.38), (0.38, -0.76), fill: rgb("#d6d6ff"), stroke: none)
  rect((0, -0.38), (0.38, -0.76), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((0.38, -0.38), (0.76, -0.76), fill: rgb("#d6d6ff"), stroke: none)
  rect((0.38, -0.38), (0.76, -0.76), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((0.76, -0.38), (1.14, -0.76), fill: rgb("#d6d6ff"), stroke: none)
  rect((0.76, -0.38), (1.14, -0.76), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((1.14, -0.38), (1.52, -0.76), fill: rgb("#d6d6ff"), stroke: none)
  rect((1.14, -0.38), (1.52, -0.76), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((1.52, -0.38), (1.9, -0.76), fill: rgb("#d6d6ff"), stroke: none)
  rect((1.52, -0.38), (1.9, -0.76), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((1.9, -0.38), (2.28, -0.76), fill: rgb("#d6d6ff"), stroke: none)
  rect((1.9, -0.38), (2.28, -0.76), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((2.28, -0.38), (2.66, -0.76), fill: rgb("#d6d6ff"), stroke: none)
  rect((2.28, -0.38), (2.66, -0.76), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((2.66, -0.38), (3.04, -0.76), fill: rgb("#d6d6ff"), stroke: none)
  rect((2.66, -0.38), (3.04, -0.76), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((0, -0.76), (0.38, -1.14), fill: rgb("#d6d6ff"), stroke: none)
  rect((0, -0.76), (0.38, -1.14), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((0.38, -0.76), (0.76, -1.14), fill: rgb("#d6d6ff"), stroke: none)
  rect((0.38, -0.76), (0.76, -1.14), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((0.76, -0.76), (1.14, -1.14), fill: rgb("#d6d6ff"), stroke: none)
  rect((0.76, -0.76), (1.14, -1.14), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((1.14, -0.76), (1.52, -1.14), fill: rgb("#d6d6ff"), stroke: none)
  rect((1.14, -0.76), (1.52, -1.14), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((1.52, -0.76), (1.9, -1.14), fill: rgb("#d6d6ff"), stroke: none)
  rect((1.52, -0.76), (1.9, -1.14), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((1.9, -0.76), (2.28, -1.14), fill: rgb("#d6d6ff"), stroke: none)
  rect((1.9, -0.76), (2.28, -1.14), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((0, -1.14), (0.38, -1.52), fill: rgb("#d1e8d1"), stroke: none)
  rect((0, -1.14), (0.38, -1.52), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((0.38, -1.14), (0.76, -1.52), fill: rgb("#d1e8d1"), stroke: none)
  rect((0.38, -1.14), (0.76, -1.52), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((0.76, -1.14), (1.14, -1.52), fill: rgb("#d1e8d1"), stroke: none)
  rect((0.76, -1.14), (1.14, -1.52), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((1.14, -1.14), (1.52, -1.52), fill: rgb("#ffdfbf"), stroke: none)
  rect((1.14, -1.14), (1.52, -1.52), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((1.52, -1.14), (1.9, -1.52), fill: rgb("#ffdfbf"), stroke: none)
  rect((1.52, -1.14), (1.9, -1.52), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((0, -1.52), (0.38, -1.9), fill: rgb("#d1e8d1"), stroke: none)
  rect((0, -1.52), (0.38, -1.9), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((0.38, -1.52), (0.76, -1.9), fill: rgb("#d1e8d1"), stroke: none)
  rect((0.38, -1.52), (0.76, -1.9), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((0.76, -1.52), (1.14, -1.9), fill: rgb("#d1e8d1"), stroke: none)
  rect((0.76, -1.52), (1.14, -1.9), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((1.14, -1.52), (1.52, -1.9), fill: rgb("#ffdfbf"), stroke: none)
  rect((1.14, -1.52), (1.52, -1.9), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((1.52, -1.52), (1.9, -1.9), fill: rgb("#ffdfbf"), stroke: none)
  rect((1.52, -1.52), (1.9, -1.9), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((0, -1.9), (0.38, -2.28), fill: rgb("#d1e8d1"), stroke: none)
  rect((0, -1.9), (0.38, -2.28), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((0.38, -1.9), (0.76, -2.28), fill: rgb("#d1e8d1"), stroke: none)
  rect((0.38, -1.9), (0.76, -2.28), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((0.76, -1.9), (1.14, -2.28), fill: rgb("#d1e8d1"), stroke: none)
  rect((0.76, -1.9), (1.14, -2.28), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((0, -2.28), (0.38, -2.66), fill: rgb("#d1e8d1"), stroke: none)
  rect((0, -2.28), (0.38, -2.66), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  rect((0.38, -2.28), (0.76, -2.66), fill: rgb("#d1e8d1"), stroke: none)
  rect((0.38, -2.28), (0.76, -2.66), stroke: (paint: rgb("#acacac"), thickness: 0.35pt, miter-limit: 10))
  line((-0.171, 0), (-0.247, 0), (-0.247, -1.14), (-0.171, -1.14), stroke: (paint: rgb("#0000a6"), thickness: 0.7pt, miter-limit: 10))
  content((-0.342, -0.57), [#text(size: 9pt)[top $a_1$ rows#linebreak()chain lengths $eta_i$]], anchor: "east", padding: 0.1176cm)
  line((0, -2.831), (0, -2.907), (1.14, -2.907), (1.14, -2.831), stroke: (paint: rgb("#003a00"), thickness: 0.7pt, miter-limit: 10))
  content((0.57, -3.021), [#text(size: 9pt)[first $b_1$ columns below the cut#linebreak()chain lengths $zeta_j$]], anchor: "north", padding: 0.1176cm)
  content((2.66, -1.71), [#text(size: 9pt)[translated tail $theta$#linebreak()$R$ boxes]], anchor: "west", padding: 0.1176cm)
  line((2.66, -1.71), (1.9, -1.71), stroke: (paint: rgb("#a0a0a0"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.16cm, fill: rgb("#a0a0a0"))))
  line((0, -1.14), (2.28, -1.14), stroke: (paint: rgb("#a0a0a0"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((1.14, -1.14), (1.14, -2.66), stroke: (paint: rgb("#a0a0a0"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
})],
  caption: [Figure 2: The chain decomposition, shown schematically. The top $a_1$ rows are taken first; the column chains contain only the boxes below those rows. The remaining lower-right region is a translated straight diagram $theta$. Thus the row chains, lower-column chains, and tail are disjoint, and their sizes sum to $n$. The cut is schematic; the asymptotic threshold is defined in the text. ],
) <fig:hybrid-chains>

Every tail cell pays the cap $v_d log n$, since both of its full line lengths are below $T$.
  In a top row, replacing the maximum of the full row and column lengths by the row length can change the
  contribution only in the first $b_1$ columns, at most $a_1 b_1$ cells.
  This has total cost $O \( c_d a_1 b_1 log \( e n \) \)$. Below the top rows,
  in a long column the maximum is its full column height. Replacing that height $zeta_j +
  a_1$ by its chain length $zeta_j$ changes the logarithmic sum by at most

$ zeta_j log \( 1 + a_1 \/ zeta_j \) lt.eq a_1 $

for each nonempty chain. Thus the chain contribution is $c_d sum_l l
  log \( n \/ l \)$ up to the same stated error. Finally $sum_l l log \( n \/ l \) = G +
  M log \( n \/ M \)$ and $M log \( n \/ M \) lt.eq R$. We have proved

#[#set math.equation(numbering: n => "(139)")
 $ cal(D)_d \( lambda \) = c_d G + v_d R log n + O \( c_d \( R + D_0^2 log \( e n \) \) \) . $ <rec:hybrid-arm-weight>]

We also need a hook-product bound for an arbitrary diagram $mu tack.r L$, $L lt.eq n$,
  using these same values of $a_1 \, b_1$. Let $l$ be its top-row and lower-column chain lengths,
  and let $theta.alt$ be its translated residual diagram of size $q$. Then

#[#set math.equation(numbering: n => "(140)")
 $ D_mu gt.eq frac(L ! D_theta.alt, q ! product_l l !) exp { -
   C \( q + D_0^2 log^2 \( e n \) \) } . $ <rec:hybrid-arm-hook>]

Here is the hook comparison in detail. Tail hooks are exactly those of $theta.alt$.
  On a top row, compare each hook with the baseline number of cells remaining in that row,
  including the current cell. Cells in the first $b_1$ columns cost at most $O \( a_1 b_1 log \( e n \) \)$
  altogether. In the other columns, the extra leg has at most $a_1$ boxes in the top region plus the height of the
  corresponding tail column. The first addition costs $O \( a_1 log \( e n \) \)$ per row by the harmonic sum;
  the two additions can be separated using $log \( 1 + x + y \) lt.eq log \( 1 + x \) + log \( 1 + y \)$.

Let the tail have width $w$ and nonincreasing column heights $h_1 \, dots.h \, h_w$, of sum $q$.
  If $q > 0$, every top row extends at least through column $b_1 + w$, so the tail addition for that row is bounded by

$ sum_(t = 1)^w log (1 + frac(h_t, w - t + 1)) . $

When $w lt.eq D_0 log \( e n \)$, there are at most $a_1 w$ affected top-row cells,
  each costing at most $log \( e n \)$, for a total $O \( D_0^2 log^2 \( e n \) \)$. When $w > D_0 log \( e n \)$, use

$ sum_(t = 1)^w frac(h_t, w - t + 1) lt.eq frac(2 q, w) + frac(2 q, w) sum_(r = 1)^(ceil.l w \/ 2 ceil.r) 1 / r =
  O #h(-0.16667em) (q / w log \( e n \)) . $

For the first half of the sum the denominators are at least $w \/ 2$;
  for the second half monotonicity gives $h_t lt.eq 2 q \/ w$.
  After multiplication by the at most $a_1$ top rows, this is $O \( q \)$.

For the lower-column chains compare hooks with the number of remaining cells in their column.
  The extra arm has at most $b_1$ boxes in the left region plus the appropriate tail row length.
  The $b_1$ addition has total cost $O \( b_1^2 log \( e n \) \)$.
  The tail addition has the identical bound with width and height interchanged:
  every left column extends through the tail’s rows, and its row lengths are nonincreasing with sum $q$.
  If $q = 0$, both tail-addition terms are absent. The resulting total logarithmic inflation over the product
  $\( q ! \/ D_theta.alt \) product_l l !$ is $O \( q + D_0^2 log^2 \( e n \) \)$, proving (140).

At the parent, every hook of $theta$ is at most $2 n^(1 - gamma_d)$,
  because all its full row and column lengths are below the threshold.
  Therefore $D_theta \/ R ! gt.eq \( 2 n^(1 - gamma_d) \)^(- R)$.
  Also $\( n \)_R gt.eq \( n \/ e \)^R$ and factorial estimates give $log \( M ! \/ product_l l ! \) = G +
  O \( D_0 log \( e n \) \)$. Applying (140) yields

#[#set math.equation(numbering: n => "(141)")
 $ log D_lambda gt.eq G + gamma_d R log n - O \( R + D_0^2 log^2 \( e n \) \) \, wide G + R log n gt.eq
   k \/ 2 . $ <rec:hybrid-arm-dimension>]

For the second assertion, if $M > 0$ and $l_max$ is the largest chain length, $- log x gt.eq 1 - x$ gives

$ G gt.eq M - frac(sum_l l^2, M) gt.eq M - l_max . $

Every top chain has length at most $lambda_1 = n - k$, and every lower-column chain has length at most $lambda'_1
  lt.eq n \/ 2$. Consequently $G + R gt.eq n - l_max gt.eq min \( k \, n \/ 2 \) gt.eq k \/ 2$.
  If $M = 0$ the same inequality is immediate from $R = n$.
  For sufficiently large $d$, $log n gt.eq 1$, proving the displayed version.

===== 2.8.8 Color multiplicities and the marked trace <color-multiplicities-and-the-marked-trace>

The arm comparison has expressed the parent budget in terms of $G$ and $R$,
  and (141) supplies its dimension scale. To apply (122), we still need the local copy counts,
  the positive trace with distinct markers, the child diagram costs, and the color angle.
  We establish them in that order.

Let $cal(H)$ be the space of configurations of $R$ distinctly labeled even markers and signed colors in
  $bb(C)^(a_1) xor bb(C)^(b_1)$. Every marker is used exactly once.
  Thus $cal(H)$ is the orthogonal sum, over the ordered marker-position tuples,
  of the signed tensor spaces on the remaining $M$ sites. The compact group $K = U \( a_1 \) times
  U \( b_1 \)$ acts only on colors; zero factors are omitted. The selected global type is the irreducible representation

$ pi = pi_(\( eta \, zeta \)) : K arrow.r U \( cal(U)_(eta \, zeta) \) \,\
cal(U)_(eta \, zeta) = upright(bold(S))_eta \( bb(C)^(a_1) \) ⊗ upright(bold(S))_zeta \( bb(C)^(b_1) \) \, $

where the carrier factor belonging to a zero group factor is also omitted.
  Its carrier action extends polynomially to the invertible parity-preserving block matrices.
  Take $S$ to be the full compact $pi$-isotypic projection on $cal(H)$, including all multiplicity copies.
  No additional projection is put on the marker labels.

Indeed, by fixing the even, odd, and marker site pattern and then inducing,
  Schur–Weyl duality identifies this color isotype on the permutation side with induction from the Specht factors
  $V_eta \, V_(zeta^(sans(t)))$, with the markers fixed pointwise.
  Stacking $zeta^(sans(t))$ below $eta$ gives precisely the unmarked hook subdiagram.
  Its Littlewood–Richardson coefficient is at least one: the skew part below $eta$ is a translated straight
  diagram with its row-constant Littlewood–Richardson tableau.
  Adding the $R$ ordered markers by branching then gives at least $f^(lambda \/ \( upright("unmarked hook") \)) =
  D_theta$ copies of $V_lambda$. The compact carrier dimension can only increase this multiplicity,
  so in (122) we may take $L_lambda = D_theta$. Separating the entry sets in the chains and the tail of a standard
  tableau gives

#[#set math.equation(numbering: n => "(142)")
 $ D_lambda / L_lambda lt.eq binom(n, R) frac(M !, product_h l_h !) lt.eq
   binom(n, R) e^G . $ <s:hybrid-global-marker-multiplicity>]

The last inequality is the elementary multinomial entropy bound.

In each row include both the local permutation isotype $mu_i$ and local color isotype
  $\( eta^(\( i \)) \, zeta^(\( i \)) \)$ in $E_alpha$; use $\( nu_j \, eta^(\[ j \]) \, zeta^(\[ j \]) \)$ in
  each column for $F_beta$. The superscripts $\( i \)$ and $\[ j \]$ distinguish row and column partitions;
  subscripts denote their parts. Local color projectors commute with local permutations.
  They also commute with the global color projection because they commute with every element of their local color
  group, including the corresponding factor of every diagonal global rotation.
  Thus these projections have all the commutations needed in (122). Their degrees fix the marker counts

$ x_i = b - \| eta^(\( i \)) \| - \| zeta^(\( i \)) \| \, wide y_j =
  a - \| eta^(\[ j \]) \| - \| zeta^(\[ j \]) \| \, wide sum_i x_i = sum_j y_j = R . $

Only nonnegative counts contribute. For $M_i = b - x_i$ define

$ G_i = sum_(l med upright("in") med eta^(\( i \)) \, zeta^(\( i \))) l log \( M_i \/ l \) \, wide G_H = sum_i G_i \, $

and define $G'_j \, G_V$ analogously in columns. Empty entropies are zero.

We need the local multiplicity with one fixed assignment of marker labels to a row,
  while their positions within that row still vary. The unmarked permutation shapes $rho tack.r
  M_i$ have coefficients $c_(eta^(\( i \)) \, \( zeta^(\( i \)) \)^(sans(t)))^rho$.
  The full local multiplicity of $mu_i$ is therefore

#[#set math.equation(numbering: n => "(143)")
 $ "mult"_i = \( dim eta^(\( i \)) \) \( dim zeta^(\( i \)) \) sum_(rho subset.eq mu_i)
   c_(eta^(\( i \)) \, \( zeta^(\( i \)) \)^(sans(t)))^rho f^(mu_i \/ rho) . $ <s:hybrid-local-marker-multiplicity>]

Here the two dimensions are compact-group carrier dimensions, and the sum includes only shapes with nonzero coefficient.

For clarity, we record the size bounds used in this sum. Every such $rho$ contains $eta^(\( i \))$ and
  $\( zeta^(\( i \)) \)^(sans(t))$ and lies in the $\( a_1 \, b_1 \)$ hook.
  For the latter assertion use a Littlewood–Richardson tableau of $rho \/ \( zeta^(\( i \)) \)^(sans(t))$ with
  content $eta^(\( i \))$. Beyond column $b_1$ its columns have at most $a_1$ boxes, by column strictness.
  Let $l^0$ be the vector of its top-row and lower-column chain lengths, padded by zeros.
  Its top counts dominate the parts of $eta^(\( i \))$, while the deficit of each lower-column count from the
  corresponding part of $zeta^(\( i \))$ is at most $a_1$. Since the two vectors have the same total $M_i$,
  their total absolute discrepancy is at most $2 a_1 b_1$. It follows that

#[#set math.equation(numbering: n => "(144)")
 $ sum_h l_h^0 log \( M_i \/ l_h^0 \) = G_i + O \( D_0^2 log \( e n \) \) . $ <s:hybrid-local-chain-entropy>]

One may bound the entropy change per changed integer unit by $O \( log \( e n \) \)$,
  including the transition between zero and one.

The same tableau argument bounds the coefficient in (143).
  The top $a_1$ rows of $rho$ contain at least $\| eta^(\( i \)) \|$ boxes,
  and at most $a_1 b_1$ of those belong to the base shape $\( zeta^(\( i \)) \)^(sans(t))$.
  Thus at most $a_1 b_1$ boxes of the skew tableau lie below the top region.
  In the top region, a weakly increasing row is specified by its counts of the at most $a_1$ letters,
  giving at most $\( n + 1 \)^(a_1^2)$ choices. Below it there are at most $max \( 1 \, a_1 \)^(a_1 b_1)$ choices.
  The number of possible hook shapes $rho$ is at most $\( n + 1 \)^(a_1 + b_1)$,
  and the compact carrier dimensions are $e^(O \( D_0^2 log \( e n \) \))$ by the Weyl dimension formula.
  All these factors therefore fit that exponential bound. In particular, (140) and (144) give

#[#set math.equation(numbering: n => "(145)")
 $ log D_rho gt.eq G_i - O \( D_0^2 log^2 \( e n \) \) . $ <s:hybrid-unmarked-dimension>]

For each contributing $rho subset.eq mu_i$, let $l_(i h)$ be the full chain lengths of $mu_i$,
  and let $l_(i h)^0$ be those of $rho$. Write

$ e_(i h) = l_(i h) - l_(i h)^0 gt.eq 0 \, wide K_i \( rho \) = sum_h log binom(l_(i h), e_(i h)) . $

If the tail of $mu_i$ has shape $theta_i$ and size $q_i$, then $q_i + sum_h e_(i h) = x_i$.
  Separating the entries in its tail and chain extensions yields

$ f^(mu_i \/ rho) lt.eq frac(x_i ! D_(theta_i), q_i ! product_h e_(i h) !) . $

Dividing by (140), with $L = b$, leaves $x_i ! product_h l_(i h) ! \/ \( b ! product_h e_(i h) ! \)$ times
  $e^(O \( x_i + D_0^2 log^2 \( e n \) \))$. Factor out the chain binomials and use (144) to obtain

#[#set math.equation(numbering: n => "(146)")
 $ "mult"_i / D_(mu_i) lt.eq binom(b, x_i)^(- 1) exp { K_i - G_i + O \( x_i + D_0^2 log^2 \( e n \) \) } \,
   $ <s:hybrid-local-ratio>]

where, once and for all, choose a contributing $rho_i$ maximizing $K_i \( rho \)$ and set $K_i = K_i \( rho_i \)$.
  The identity behind the entropy term is $product_h \( l_(i h)^0 \) ! \/
  M_i !$ after extracting the inverse binomial; factorial errors and the sum in (143) have the stated size.
  Zero local spaces can be discarded.

======= 2.8.8.1 The marked trace endpoint. <the-marked-trace-endpoint.>

In a diagonal block of $B_beta^(2 p) A_alpha^(2 p)$, each marker’s intermediate position must equal its starting
  position: a horizontal move and a vertical move cannot undo each other’s coordinate changes.
  Fix one such marker-position tuple. In a column, restricting the positive group-algebra coefficients to its
  pointwise marker stabilizer $S_(a - y_j)$ gives a positive element with regular trace
  $T_a^(nu_j) \( p \) \/ \( a \)_(y_j)$. On a stabilizer irreducible $rho$,
  its operator norm is at most this regular trace divided by $D_rho$.
  On the fixed local color type the occurring $rho$ satisfy the column version of (145).
  Consequently the vertical diagonal block has norm at most

$ \( e \/ a \)^R exp { - G_V + O \( b D_0^2 log^2 \( e n \) \) } product_j T_a^(nu_j) \( p \) . $

This holds uniformly over the marker positions; blocks with incompatible counts are zero.
  Fixed graded reordering into column order makes the product over columns literal,
  without changing the norm or the marker fibers.

Both diagonal compressions are positive. After applying the vertical norm bound we may sum the horizontal diagonal
  traces, which gives the full horizontal trace. There are $R ! \/ product_i
  x_i !$ ways to assign the distinct marker labels to rows, and hence

$ "Tr"_(cal(H)) A_alpha^(2 p) = frac(R !, product_i x_i !) product_i ("mult"_i / D_(mu_i) T_b^(mu_i) \( p \)) . $

Using (146), the remaining binomial and position factors, including (142), are bounded by

$ binom(n, R) \( e \/ a \)^R frac(R !, product_i x_i !) product_i binom(b, x_i)^(- 1) lt.eq
  binom(n, R) R ! \( e \/ a \)^R \( e \/ b \)^R lt.eq e^(2 R) . $

Thus the normalized trace endpoint obeys

#[#set math.equation(numbering: n => "(147)")
 $ log (D_lambda / L_lambda "Tr"_(cal(H)) \( B_beta^(2 p) A_alpha^(2 p) \)) lt.eq  & sum_(upright("children")) log
   T + G - G_H - G_V + sum_i K_i\
 & + O \( R + \( a + b \) D_0^2 log^2 \( e n \) \) . $ <rec:hybrid-marked-trace>]

======= 2.8.8.2 Charging the child diagrams. <charging-the-child-diagrams.>

We next compare the child diagram budgets with the chain entropies.
  Keep the maximizing shapes $rho_i$ chosen in (146). Call a horizontal chain $\( i \, h \)$ good if $l_(i h)
  gt.eq b^(1 - alpha_0)$, where $alpha_0 = v_(*) \/ \( 4 c_(*) \)$, and define the number of good extensions by

$ e_(upright("good")) = sum_(i \, h\
l_(i h) gt.eq b^(1 - alpha_0)) e_(i h) . $

This counts horizontal extension boxes only, so $0 lt.eq e_(upright("good")) lt.eq R$.

The $l_(i h)^0$ unmarked boxes in this chain each see a full row or column length in $mu_i$ at least $l_(i h)
  gt.eq l_(i h)^0$. Their contribution to $cal(D)_(log_2 b) \( mu_i \)$ is at most $c_(log_2 b) sum_h l_(i h)^0
  log \( b \/ l_(i h)^0 \)$. By (144) and $M_i log \( b \/ M_i \) lt.eq x_i$, this is $c_(log_2 b) G_i +
  O \( x_i + D_0^2 log \( e n \) \)$. Charge the remaining $x_i$ boxes by the cap $v_(log_2 b) log b$.
  For a good extension box the actual charge is at most $c_(log_2 b) alpha_0 log b lt.eq \( v_(*) \/ 2 \) log b$,
  since $c_(log_2 b) lt.eq 2 c_(*)$. The cap is at least $v_(*) log b$,
  so each such box saves at least $\( v_(*) \/ 2 \) log b$.
  In columns choose any compatible unmarked shape and make the same estimate, discarding its extension savings.

Set $macron(c) = max \( c_(floor.l d \/ 2 floor.r) \, c_(ceil.l d \/ 2 ceil.r) \)$ and $macron(v) =
  max \( v_(floor.l d \/ 2 floor.r) \, v_(ceil.l d \/ 2 ceil.r) \)$.
  The marker counts sum to $R$ on each axis and $log a + log b = log n$. Therefore

#[#set math.equation(numbering: n => "(148)")
 $ sum_(upright("children")) cal(D)_(d_i) \( mu_i \) lt.eq macron(c) \( G_H + G_V \) +
   macron(v) R log n - \( v_(*) \/ 2 \) e_(upright("good")) log m +
   O \( R + \( a + b \) D_0^2 log \( e n \) \) . $ <rec:hybrid-child-diagram>]

It remains to bound the $K_i$ costs of the extensions. We may restrict to profile pairs with nonzero angle,
  since the other pairs contribute zero to (122). We first show that the total length $U_(upright("bad"))$ of bad
  horizontal chains is at most $2 k$, for all sufficiently large $d$.
  If $a_1 = 0$, then $lambda_1 < n^(1 - gamma_d) lt.eq n \/ 2$ and hence $k gt.eq n \/ 2$;
  the total of all horizontal chain lengths is at most $n lt.eq 2 k$.
  If $a_1 > 0$, the nonzero space $E_alpha S cal(H)$ contains the global compact type $\( eta \, zeta \)$ inside
  the tensor product of the prescribed row types. Its highest weight has first even coordinate $eta_1 = lambda_1$.
  Weights add under the diagonal color action, and in local type $eta^(\( i \))$ every first weight coordinate is
  at most $eta_1^(\( i \))$. Thus

$ lambda_1 = eta_1 lt.eq sum_i eta_1^(\( i \)) lt.eq sum_i mu_(i \, 1) \, wide sum_i \( b - mu_(i \, 1) \) lt.eq k . $

The second inequality uses $eta^(\( i \)) subset.eq rho_i subset.eq mu_i$.
  All chains other than a row’s first chain lie below that first row.
  If the first chain is itself bad, its length $mu_(i \, 1) < b^(1 - alpha_0) lt.eq
  b \/ 2$ is at most the same row’s minority $b - mu_(i \, 1)$.
  Summing these two contributions gives $U_(upright("bad")) lt.eq 2 k$.

For any collection of chains with total length $U$ and total extension count $z > 0$,
  Vandermonde’s identity and the binomial bound give

$ sum_h log binom(l_h, e_h) lt.eq log binom(U, z) lt.eq z log \( e U \/ z \) . $

For bad chains $U lt.eq 2 k$ and $z lt.eq R$. Using $log x lt.eq log \( d + 1 \) +
  x \/ \( d + 1 \)$ yields the explicit bound

$ K_(upright("bad")) lt.eq R log \( d + 1 \) + frac(2 e k, d + 1) = O \( R log \( d + 1 \) + k \/ d \) . $

Zero extension counts contribute zero. For good chains $U lt.eq n$ and $z = e_(upright("good"))$.
  If $e_(upright("good")) gt.eq k n^(- epsilon.alt)$, the dense hypothesis $k gt.eq n^(1 - epsilon.alt)$ gives

$ K_(upright("good")) lt.eq e_(upright("good")) log \( e n \/ e_(upright("good")) \) lt.eq
  e_(upright("good")) \( 1 + 2 epsilon.alt log n \) lt.eq \( v_(*) \/ 2 \) e_(upright("good")) log m $

for sufficiently large $d$. The final inequality follows from $2 epsilon.alt < v_(*) \/ 4$ and $log m
  gt.eq \( log n - log 2 \) \/ 2$. If $0 < e_(upright("good")) < k n^(- epsilon.alt)$,
  monotonicity of $z log \( e n \/ z \)$ on $\[ 0 \, n \]$ instead gives $K_(upright("good")) =
  O \( k n^(- epsilon.alt) log \( e n \) \)$. Consequently the $K_i$ terms and the negative term in (148) together
  cost at most

#[#set math.equation(numbering: n => "(149)")
 $ O #h(-0.16667em) (R log \( d + 1 \) + k \/ d + k n^(- epsilon.alt) log \( e n \)) . $ <s:hybrid-extension-cost>]

All thresholds here depend only on the displayed fixed parameters, not on the eventual exponent $p$.

The color angle supplies the remaining saving:

#[#set math.equation(numbering: n => "(150)")
 $ log w lt.eq - 1 / 2 \( G - G_H - G_V \) + O \( R + \( a + b \) D_0^2 log n \) \, wide w lt.eq
   1 . $ <rec:hybrid-color-angle>]

If $M = 0$, there are no unmarked symbols, $G = G_H = G_V = 0$, and (150) follows from $w lt.eq 1$.
  Assume $M > 0$ for the density and deformation argument that follows.
  We first pass from the full local color projections to weight projections.
  Let $Q_H \, Q_V$ be the products of the specified local color projections on the rows and columns.
  Write the additional permutation-type projections as $E^(upright("perm")) \, F^(upright("perm"))$, so $E_alpha =
  Q_H E^(upright("perm"))$ and $F_beta = F^(upright("perm")) Q_V$.
  They commute within their respective lines and with $S$. Hence

$ F_beta E_alpha S = F^(upright("perm")) \( Q_V S Q_H \) E^(upright("perm")) \, wide w lt.eq
  parallel Q_V S Q_H parallel . $

All three color projections preserve marker positions, so this norm is the maximum of the norms on fixed
  marker-position fibers.

On one such fiber, let $Q_tau$ be a local color-type projection, and let $d_tau$ be its compact carrier dimension.
  In every multiplicity copy choose the highest-weight line and let $P_tau^(upright("hw"))$ project onto their
  sum. Normalized Haar averaging on $K = U \( a_1 \) times U \( b_1 \)$ gives,
  with $rho \( g \)$ denoting the local tensor color action,

$ Q_tau = d_tau integral_K rho \( g \) P_tau^(upright("hw")) rho \( g \)^(*) thin d g . $

The highest-weight lines lie in the torus weight space whose symbol counts are the parts of $tau$.
  If $Z_tau$ projects onto that whole weight space, then $P_tau^(upright("hw")) prec.curly.eq Z_tau$.
  Tensor these positive inequalities over the rows and over the columns and apply Lemma 19,
  with middle operator $S$. It follows that

$ parallel Q_V S Q_H parallel lt.eq (product_(upright("lines")) d_tau)^(1 \/ 2)
  sup_(upright(bold(g)) \, upright(bold(h))) parallel Z_V \( upright(bold(h)) \) S Z_H \( upright(bold(g)) \)
  parallel . $

Here the rotations are independent on each line. The logarithm of the prefactor is
  $O \( \( a + b \) D_0^2 log n \)$ by the Weyl dimension formula.
  This argument applies with either parity dimension zero by omitting that factor of $K$;
  it uses no commutation between row and column projections.

Fix the line rotations in this last supremum. If a row has $M_i > 0$ unmarked sites,
  let $sigma_i$ be the parity-block diagonal density whose entries are its required symbol counts divided by
  $M_i$, in the chosen rotated parity basis. If $M_i = 0$, choose any parity-preserving density of trace one
  instead; that row has no tensor factors in the fiber. Define column densities $tau_j$ in the same way,
  using an arbitrary parity-block trace-one density when its local unmarked count is zero.
  Thus every line density has trace one, including empty lines.
  On the row weight space $Z_H \( upright(bold(g)) \)$ the tensor multiplier $Sigma$ of the $sigma_i^(1 \/ 2)$
  acts by $e^(- G_H \/ 2)$, and the analogous column multiplier $cal(T)$ acts by $e^(- G_V \/ 2)$. In particular,

$ Z_V \( upright(bold(h)) \) S Z_H \( upright(bold(g)) \) =
  e^(\( G_H + G_V \) \/ 2) Z_V \( upright(bold(h)) \) cal(T) S Sigma Z_H \( upright(bold(g)) \) . $

Thus the rotated weight-space overlap is at most $e^(\( G_H + G_V \) \/ 2) parallel cal(T) S Sigma parallel$.
  For the global compact projection use the deformed formula with $macron(tau) = b^(- 1) sum_j tau_j$,
  $macron(sigma) = a^(- 1) sum_i sigma_i$, and a real scalar regularizer $epsilon_(upright("reg")) > 0$.
  For an invertible parity-preserving block matrix $A$, the polynomial tensor action $rho \( A \) =
  A^(⊗ M)$ acts on the whole color tensor fiber, while $pi \( A \)$ acts on the selected carrier
  $cal(U)_(eta \, zeta)$. The restriction of $S$ to this fiber is the full compact $pi$-isotypic projection.
  Put $A_0 = \( macron(tau) + epsilon_(upright("reg")) I \)^(- 1 \/ 2)$.
  With $d U$ denoting normalized Haar measure on $K$, apply Lemma 21 with carrier matrix $pi \( A_0 \)^(- 1)$,
  and multiply its tensor action on the left by $rho \( A_0 \)$. The formula is

$ S = \( dim pi \) integral_K "Tr" \( pi \( U \)^(*) pi \( A_0 \)^(- 1) \) thin rho \( A_0 U \) thin d U . $

To bound the trace coefficient, put

$ H = macron(tau) + epsilon_(upright("reg")) I \, wide t = "Tr" H = 1 +
  epsilon_(upright("reg")) \( a_1 + b_1 \) \, wide D = H \/ t . $

Since $M > 0$, the total color dimension $a_1 + b_1$ is positive,
  and $D$ is a trace-one parity-preserving density. Apply (11) with parity dimensions $a_1 \,
  b_1$ and partitions $eta \, zeta$. Their total degree is $M$ and their entropy is $G$,
  so $parallel pi \( D \) parallel lt.eq e^(- G)$. Polynomial homogeneity and positivity give

$ pi \( A_0 \)^(- 1) & = pi \( H^(1 \/ 2) \) = t^(M \/ 2) pi \( D \)^(1 \/ 2) \,\
parallel pi \( A_0 \)^(- 1) parallel & lt.eq \( 1 + epsilon_(upright("reg")) \( a_1 + b_1 \) \)^(M \/ 2)
  e^(- G \/ 2) . $

Here the square-root identity follows by diagonalizing $D$ within its parity blocks.
  An absent block contributes the trivial carrier factor and degree zero.
  Since $pi \( U \)$ is unitary, the absolute trace coefficient is at most $dim pi$ times this norm,
  in addition to the $dim pi$ outside the integral. For the site factor $tau_j^(1 \/ 2) A_0 U sigma_i^(1 \/ 2)$,
  the squared Hilbert–Schmidt norms have full-grid mean

$ "Tr" \( A_0 accent(tau A, ‾)_0 thin U accent(sigma U, ‾)^(*) \) lt.eq 1 \, $

because $A_0 accent(tau A, ‾)_0 lt.eq I$ and $"Tr" macron(sigma) = 1$.
  Thus on the $M$ unmarked sites the product of the site norms is at most $\( n \/ M \)^(M \/ 2) lt.eq
  e^(R \/ 2)$. Let $epsilon_(upright("reg"))$ decrease to zero. Including the carrier dimensions proves (150).

#proof[
  #emph[Completion of Theorem 34.] The number $J$ of profile pairs in this application satisfies
  $ log J = O #h(-0.16667em) (n^(3 \/ 4) + \( a + b \) D_0 log \( e n \)) . $
  Indeed the permutation partitions contribute $O \( a sqrt(b) + b sqrt(a) \) =
    O \( n^(3 \/ 4) \)$ to this logarithm. Every local compact type is specified by at most $a_1 +
    b_1$ nonnegative parts, each at most $n$, giving the second term over all lines.
    Marker counts are fixed by the local color degrees and introduce no additional profile choices.
  Set $Delta G = G - G_H - G_V$. Combining (147), (148), (149), and (150) in (122), then subtracting (139), gives
  $ log T_n^lambda \( p \) - cal(D)_d \( lambda \) lt.eq  & \( 1 - macron(c) \) Delta
    G - \( p_0 - 1 \) \( Delta G \)_(+)\
 & - \( c_d - macron(c) \) G - \( v_d - macron(v) \) R log n\
 & + O_(p_0) #h(-0.16667em) (R log \( d + 1 \) + k \/ d) . $
  To obtain this error, use $k gt.eq n^(1 - epsilon.alt)$, $D_0 = O \( n^0.01 \)$, and $a + b = O \( sqrt(n) \)$.
    The terms $\( a + b \) D_0^2 log^2 \( e n \)$, $log J$, and $k n^(- epsilon.alt)
    log \( e n \)$ are all $o \( k \/ d \)$. The angle is bounded both by its exponential estimate and by one;
    therefore its main term is $- \( p_0 - 1 \) \( Delta G \)_(+)$, with the stated $O_(p_0)$ error.
    No factor in this error depends on the final choice of $p$.
  The first line of the display is nonpositive. If $Delta G lt.eq 0$, use $1 - macron(c) > 0$; if $Delta G > 0$,
    use $1 - macron(c) - \( p_0 - 1 \) < 0$. Let $Q = G + R log n$. By (141), $Q gt.eq k \/ 2$, and
  $ R log \( d + 1 \) + k \/ d lt.eq C Q thin frac(log \( d + 1 \), d) . $
  The balanced parameter increments satisfy $c_d - macron(c) = v_d - macron(v) gt.eq c d^(- 1 \/ 3)$.
    Their negative contribution is at most $- c d^(- 1 \/ 3) Q$ and absorbs the error for sufficiently large $d$.
    This proves the dense diagram induction.
  For its comparison with dimension, put $Q_gamma = G + gamma_d R log n$.
    The fixed parameters give $gamma_d gt.eq 10 \/ 10001 > 0$, and $gamma_d < 1$, so $Q_gamma gt.eq c Q gt.eq
    c k$. Moreover $R = o \( Q_gamma \)$ uniformly, because $Q_gamma gt.eq gamma_d R log n$,
    and $D_0^2 log^2 \( e n \) = o \( Q_gamma \)$ in the dense range. Thus (139) and (141) give
  $ cal(D)_d \( lambda \) = c_d Q_gamma + o \( Q_gamma \) \, wide log D_lambda gt.eq Q_gamma - o \( Q_gamma \) . $
  The fixed parameter bounds, in particular $c_d < 0.011$, prove $cal(D)_d \( lambda \) lt.eq 1 /
    4 log D_lambda$ and $log D_lambda gt.eq c k$ for all sufficiently large $d$.
    This comparison used only the stated height bound and the diagram estimates,
    so it also applies to zero blocks in the theorem’s domain.
    The other levels were covered by the level induction. All thresholds are chosen before the finite-base exponent $p$.
  Choose the finite-base exponent using (123).
  In the dense range $parallel B_n parallel^(2 p) lt.eq D_lambda^(- 3 \/ 4)$ and $T_n^lambda \( p \) lt.eq
    D_lambda^(1 \/ 4)$. Thus $T_n^lambda \( 4 p \) lt.eq D_lambda^(- 2)$.
    In the other range $T_n^lambda \( p \) lt.eq n^(- k)$, whence $parallel B_n parallel^(2 p) lt.eq
    D_lambda^(- 1) n^(- k)$ and $T_n^lambda \( 4 p \) lt.eq D_lambda^(- 3) n^(- 4 k)$.
    Consequently exactly $4 p$ sweeps suffice: Lemma 6, with $r = s = 4 p$, gives
  #[#set math.equation(numbering: n => "(151)")
   $ parallel B_n^(4 p) \|_(upright(bold(1))^perp) parallel_(upright("HS") \, upright("reg"))^2 lt.eq
     sum_(lambda eq.not \( n \)) T_n^lambda \( 4 p \) = o \( 1 \) . $ <rec:hybrid-exact-completion>]
  The dense sum tends to zero because $k gt.eq n^(1 - epsilon.alt)$ and dimensions dominate the partition count;
    the remaining sum is bounded by $sum_(k gt.eq 1) e^(O \( sqrt(k) \)) n^(- 4 k)$.
    Thus $4 p d$ physical shuffles suffice for all sufficiently large $d$. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
