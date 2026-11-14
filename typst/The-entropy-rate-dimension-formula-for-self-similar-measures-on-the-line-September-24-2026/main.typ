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

#align(center)[#text(size: 16pt, weight: "bold")[The entropy-rate dimension formula for self-similar measures on the line]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Let $Lambda$ be a finite nonempty alphabet, and let

$ Phi = \( phi_i \)_(i in Lambda) \, wide phi_i \( x \) = r_i x + t_i \, wide t_i in bb(R) \, quad 0 < \| r_i \| < 1 . $

The family is indexed: different symbols may specify the same map.
  Given a probability vector $p = \( p_i \)_(i in Lambda)$ with $p_i > 0$,
  its self-similar measure is the unique Borel probability measure satisfying

$ mu = sum_(i in Lambda) p_i \( phi_i \)_(*) mu . $

Equivalently, $mu$ is the law of $lim_(n arrow.r oo) phi_(I_1) compose dots.h.c compose phi_(I_n) \( 0 \)$,
  where the symbols $I_j$ are independent with law $p$. The limit exists uniformly in the address:
  if $r_max = max_i \| r_i \|$ and $T_0 = max_i \| t_i \|$,
  all coding limits have absolute value at most $T_0 \/ \( 1 - r_max \)$.

For a word $w = i_1 dots.h.c i_n$, write $phi_w = phi_(i_1) compose dots.h.c compose phi_(i_n)$ and $p_w =
  p_(i_1) dots.h.c p_(i_n)$. An #emph[exact overlap] is an equality $phi_u =
  phi_v$ for distinct words of the same positive length. Equality here means equality of the complete affine maps,
  including both the signed slope and the translation. We allow all such overlaps.

The relevant entropy counts maps rather than addresses. Set

$ G_n = phi_(I_1) compose dots.h.c compose phi_(I_n) \, wide bb(P) \( G_n = g \) =
  sum_(w in Lambda^n : thin phi_w = g) p_w . $

All logarithms below have base two. For a finite-valued random variable $Z$, its Shannon entropy is $H \( Z \) = -
  sum_z bb(P) \( Z = z \) log bb(P) \( Z = z \)$, with $0 log 0 = 0$.
  Define the random-walk entropy rate and the Lyapunov exponent by

#[#set math.equation(numbering: n => "(1.1)")
 $ h = h_(upright("RW")) \( Phi \, p \) := lim_(n arrow.r oo) frac(H \( G_n \), n) =
   inf_(n gt.eq 1) frac(H \( G_n \), n) \, wide chi = - sum_i p_i log \| r_i \| > 0 . $ <eq:rate-and-lyapunov>]

Indeed, a length-$\( n + m \)$ map is a function of two independent maps with laws $G_n \, G_m$,
  so $H \( G_(n + m) \) lt.eq H \( G_n \) + H \( G_m \)$; subadditivity gives the displayed limit and infimum.
  Also $0 lt.eq h lt.eq H \( p \) := - sum_i p_i log p_i$. The ratio $h \/
  chi$ is independent of the common logarithm base.

We use the lower Hausdorff dimension of a measure:

$ dim_H nu = inf { dim_H E : E subset bb(R) upright(" Borel") \, med nu \( E \) > 0 } . $

Feng–Hu’s exact-dimensionality theorem #cite(label("FengHu2009")) Theorem 2.8 applies to finite self-similar
  systems without separation. Indeed, the maps preserve a sufficiently large compact interval,
  extend to contracting smooth diffeomorphisms, and have derivative norm and least singular value both equal to
  $\| r_i \|$. The system is therefore conformal, and its Bernoulli coding law is ergodic.
  These observations also cover negative ratios and repeated indexed maps.
  Thus, for the measure $mu$ above, there is a constant $d$ such that

#[#set math.equation(numbering: n => "(1.2)")
 $ lim_(s arrow.b 0) frac(log mu \( B \( x \, s \) \), log s) = d quad
   upright("for ") mu upright("-almost every ") x . $ <eq:exact-dimensionality>]

For an exact-dimensional measure this constant equals both $dim_H mu$ and $inf { dim_H E : mu \( E \) = 1 }$.
  To see the equivalence, restrict to countably many sets on which the local bounds $s^(d + epsilon) lt.eq
  mu \( B \( x \, s \) \) lt.eq s^(d - epsilon)$ hold uniformly for all sufficiently small $s$.
  The lower mass bound gives a full-measure union of sets of dimension at most $d +
  epsilon$ by a covering argument; the upper mass bound gives dimension at least $d -
  epsilon$ for every positive-mass set. Let $epsilon arrow.b 0$.
  Consequently either Hausdorff measure-dimension convention gives the same statement below.

#thm([Theorem 1.1.])[
  #emph[For every finite nonempty indexed family $phi_i \( x \) = r_i x +
    t_i$ on $bb(R)$ with $0 < \| r_i \| < 1$, and every strictly positive probability vector $p$,
    its self-similar measure satisfies
$ dim_H mu_(Phi \, p) = min {1 \, frac(h_(upright("RW")) \( Phi \, p \), chi \( Phi \, p \))} . $

 No separation assumption is required; exact overlaps and repeated generators are allowed.]
] <thm:main>

This proves the entropy-rate dimension conjecture, formulated as Conjecture 3 in Varjú’s survey
  #cite(label("VarjuSurvey2026")). When there are no exact overlaps, $H \( G_n \) = n H \( p \)$,
  and the theorem gives the usual entropy-to-Lyapunov formula.
  Section 6 records this case, the attractor formula, and the homogeneous all-weight consequence,
  including the three-map family ${ lambda x \, lambda x + 1 \, lambda x + t }$.
  The theorem includes critical and supercritical entropy rates.
  It asserts dimension, without an assertion of absolute continuity.

=== 1.1 Background and proof strategy <background-and-proof-strategy>

The dimension of a self-similar set is classical when its pieces are sufficiently separated.
  Moran’s construction #cite(label("Moran1946")) and Hutchinson’s iterated-function-system framework
  #cite(label("Hutchinson1981")) give the similarity-dimension formula under the open set condition.
  Hutchinson also established the invariant-measure construction used above #cite(label("Hutchinson1981"))
  Theorem 4.4(1). Removing separation leads to the exact-overlap problem:
  can dimension fall below its natural upper bound when distinct words never define the same map?
  The set version is associated with Simon #cite(label("Simon1996"));
  see also the formulation and historical discussion in #cite(label("VarjuSurvey2026")) Section 1.
  The entropy-rate formulation addresses the additional loss of information when exact overlaps do occur.

Bernoulli convolutions provide an early and influential model for this question.
  These are the laws of $sum_(j gt.eq 0) epsilon_j lambda^j$,
  where $0 < lambda < 1$ and the $epsilon_j$ are independent equiprobable signs.
  Erdős proved singularity for reciprocal Pisot parameters in $\( 1 \/ 2 \, 1 \)$ #cite(label("Erdos1939")).
  A Pisot number is a real algebraic integer greater than one whose other conjugates have modulus less than one.
  Solomyak proved absolute continuity with an $L^2$ density for almost every parameter in $\( 1 \/ 2 \, 1 \)$
  #cite(label("Solomyak1995")); Peres–Solomyak later gave a simpler proof #cite(label("PeresSolomyak1996")).
  Garsia introduced the discrete entropy rate in this setting and related it to singularity
  #cite(label("Garsia1963")) Theorem 1.2. These results illustrate the sensitivity to overlaps and arithmetic;
  absolute continuity and Hausdorff dimension are distinct questions.

Hochman showed that $dim_H mu < min { 1 \, H \( p \) \/ chi }$ forces superexponential concentration of cylinder
  maps #cite(label("Hochman2014")) Theorem 1.1, using inverse theorems for entropy growth under convolution.
  For unequal ratios his entropy formulation already keeps track of the full affine map,
  including its slope #cite(label("Hochman2014")) Theorem 1.4.
  The entropy-rate formula under weak exponential separation follows from his work;
  the version allowing exact collisions is proved in Bárány–Verma #cite(label("BaranyVerma2026")) Theorem 3.5.
  For Bernoulli convolutions, Breuillard–Varjú developed approximation by algebraic parameters with controlled
  entropy #cite(label("BreuillardVarju2019")). Building on these and earlier entropy methods,
  Varjú proved full dimension for every transcendental parameter in $\( 1 \/ 2 \, 1 \)$
  #cite(label("VarjuTranscendental2019")) Theorem 3. Rapaport proved the no-exact-overlap formula for algebraic
  contraction ratios and arbitrary real translations, allowing signed unequal ratios #cite(label("Rapaport2022"))
  Theorem 2.

Rapaport–Varjú extended entropy and approximation methods to homogeneous three-map systems
  #cite(label("RapaportVarju2024")). For equal weights, their results include an exceptional parameter set of
  Hausdorff dimension zero and the no-overlap formula when $lambda >
  2^(- 2 \/ 3)$ #cite(label("RapaportVarju2024")) Corollary 1.4 and Theorem 1.8.
  Rapaport–Varjú proved the entropy-rate formula, including exact overlaps,
  for rational translations and a positive common ratio #cite(label("RapaportVarju2024")) Theorem A.1.
  Feng–Feng proved the no-exact-overlap formula for algebraic translations and a signed common ratio
  #cite(label("FengFeng2025")) Theorem 1.2. The distinction in Theorem 1 is that the entropy rate of the full
  affine-map walk is sharp even when exact collisions occur, with no arithmetic or separation assumption.

Absence of exact overlaps does not itself supply a quantitative separation estimate.
  Baker #cite(label("Baker2021")) Theorem 1.3 and, independently,
  Bárány–Käenmäki #cite(label("BaranyKaenmaki2021")) Theorem 2.1 constructed systems without exact overlaps whose
  distinct cylinders approach one another at arbitrarily prescribed superexponential rates.
  Thus the entropy carried by extremely close maps must be handled without bounding the smallest positive separation.

Our proof combines the entropy retained by this map walk with a finite-law estimate that detects information
  across arbitrarily fine scales. It uses translation averaging,
  developed by Wang #cite(label("Wang2011")) Section 4.1, and the entropy calculus and fair-pair arguments of
  Varjú #cite(label("VarjuAbsolute2019")) Section 2.2, Propositions 20–21, and Lemma 22.
  Uniform nonsaturation has an antecedent for Bernoulli convolutions in Breuillard–Varjú
  #cite(label("BreuillardVarju2019")) Lemma 13. We prove the required entropy estimates here;
  the only external dimension theorem used in the proof is exact dimensionality.

The argument has three steps. First, for a finite real law $nu$,
  compare its exact entropy with the entropy of its grid cell at a fixed scale.
  The difference is information hidden inside those cells. A bound for the sum of several independent copies
  forces this information to be witnessed by fair (equal-weight) two-point laws at smaller scales.
  The estimate is independent of the smallest distance between support points.

Second, group the coding symbols into blocks and condition on their symbol counts.
  This is the block-type disintegration of Galicer–Saglietti–Shmerkin–Yavicoli
  #cite(label("GalicerSagliettiShmerkinYavicoli2016")) Section 6.4 and Lemma 6.6,
  also developed by Saglietti–Shmerkin–Solomyak #cite(label("SagliettiShmerkinSolomyak2018")) Lemma 6.2;
  Käenmäki–Orponen #cite(label("KaenmakiOrponen2023")) Section 2.2 explicitly allow repeated indexed maps in this
  construction. Here the counts fix each block’s signed contraction.
  For a sequence of such blocks, its translation then identifies its complete composed map.
  Conditioning costs only the entropy of the counts, so the map-entropy rate gives a lower bound for the remaining
  translation entropy even when addresses collide. The same fixed contractions give a small sumset bound.
  A hypothetical dimension deficit therefore yields a linear amount of fair-pair mass across a finite band of very
  fine scales.

Third, each pair produces a positive entropy gain against the unobserved tail.
  The bands may end at arbitrarily large depths. We choose successive block lengths only after the preceding
  endpoints are known. At each observation scale their retained blocks are disjoint,
  so their gains telescope to a bounded total. Averaging over observation scales gives a fixed positive
  contribution from every band, a contradiction as the number of bands grows.

Section 2 proves the entropy calculus, nonsaturation, and two-point gain.
  Section 3 proves the finite-law estimate. Section 4 applies it to conditional map laws,
  and Section 5 arranges the disjoint gains and completes the proof.
  Section 6 derives the no-overlap measure and attractor formulas,
  followed by the homogeneous and three-map specializations.
  No quantitative bound on the fine-scale endpoints is needed.

=== 1.2 The entropy-rate upper bound <sec:upper>

We prove the upper bound before turning to the contradiction argument. Fix a positive integer $n$.
  Use the finite set of distinct maps in the support of $G_n$ as a new alphabet,
  giving each map $g$ its exact probability $q_g = bb(P) \( G_n = g \) > 0$.
  Grouping independent coding symbols into $n$-blocks shows that this new system has the same measure $mu$.
  Its one-symbol entropy is $H \( G_n \)$ and its mean contraction depth is $n chi$,
  since coincident maps have the same absolute slope.

For $0 < epsilon < n chi$, the strong law shows that almost every address in this block system eventually has,
  at every length $j$, a prefix of probability at least $2^(- j \( H \( G_n \) + epsilon \))$ and absolute
  contraction at most $2^(- j \( n chi - epsilon \))$. There are at most $2^(j \( H \( G_n \) + epsilon \))$ such
  prefixes. For each fixed eventual starting length $J$, let $E_J$ be the closed set of addresses satisfying both
  conditions for every $j gt.eq J$. Its compact coding image is covered by intervals of diameter at most $C
  2^(- j \( n chi - epsilon \))$, where $C$ bounds the attractor diameter.
  The total $a$th power of these diameters tends to zero when
  $a > \( H \( G_n \) + epsilon \) \/ \( n chi - epsilon \)$.
  The countable union over eventual starting lengths is a full-measure Borel set with this dimension bound.
  The case of zero attractor diameter is immediate. Letting $epsilon arrow.b 0$, then taking the infimum over $n$, gives

#[#set math.equation(numbering: n => "(1.3)")
 $ d lt.eq min { 1 \, h \/ chi } . $ <eq:upper-bound>]

In particular, the conclusion of Theorem 1 already holds when $h = 0$, including a single-map system.
  To prove equality in all other cases, it suffices to rule out

#[#set math.equation(numbering: n => "(1.4)")
 $ d < 1 \, wide d chi < h . $ <eq:dimension-loss>]

These inequalities are the contradiction hypothesis in Sections 4 and 5.

== 2 Entropy between two scales <sec:entropy>

We first establish the entropy estimates that turn a separated pair of translations into a definite gain.
  The decisive property of the self-similar measure is uniform nonsaturation:
  if its dimension is less than one, every one-bit scale interval leaves a positive entropy deficit.
  The intermediate entropy identities apply to arbitrary compactly supported probability measures on the line.

For a finite-valued variable $Z$, write $H \( Z \) = - sum_z bb(P) \( Z = z \) log bb(P) \( Z = z \)$,
  with $0 log 0 = 0$. Conditional entropy is the average entropy of the conditional law, and $I \( Z \; Y \) =
  H \( Z \) - H \( Z divides Y \)$; conditional mutual information is defined similarly.
  We use the entropy chain rule and nonnegativity of conditional mutual information.
  For a bounded real random variable $X$ and $s > 0$, define

$ H_s^0 \( X \) = H \( floor.l X \/ s floor.r \) \, wide cal(H)_s \( X \) =
  integral_0^1 H \( floor.l X \/ s + u floor.r \) thin d u . $

We use the same notation for the law of $X$. For $s \, t > 0$, put

$ G_(s \, t) = cal(H)_s - cal(H)_t \, wide Delta_s = 1 - G_(s \, 2 s) . $

As throughout the paper, all logarithms and entropies are in base $2$.
  Write $h \( f \) = - integral f log f$ for differential entropy and $V_s$ for an independent uniform random
  variable on $\[ 0 \, s \]$.

The smoothing and nested-grid identities are the averaged-entropy calculus of #cite(label("VarjuAbsolute2019"))
  Section 2.2, Lemmas 5, 6, and 10; we include their proofs.

#thm([Lemma 2.1.])[
  (Entropy calculus).  #emph[For every compactly supported real law,
#[#set math.equation(numbering: n => "(2.1)")
 $ cal(H)_s \( X \) = h \( X + V_s \) - log s \, wide cal(H)_s \( a X + b \) =
   cal(H)_(s \/ \| a \|) \( X \) quad \( a eq.not 0 \) . $ <eq:entropy-smoothing>]

 If $t \/ s = N$ is a positive integer, then $G_(s \, t)$ is concave in the law,
#[#set math.equation(numbering: n => "(2.2)")
 $ 0 lt.eq G_(s \, t) lt.eq log N \, wide G_(s \, t) \( X + Y \) gt.eq G_(s \, t) \( X \) $ <eq:entropy-integer-window>]

 for independent bounded $X \, Y$. For arbitrary $z gt.eq s > 0$,
#[#set math.equation(numbering: n => "(2.3)")
 $ cal(H)_s - log \( z \/ s + 2 \) lt.eq cal(H)_z lt.eq cal(H)_s + 1 . $ <eq:entropy-scale-comparison>]

 Furthermore,
#[#set math.equation(numbering: n => "(2.4)")
 $ \| cal(H)_s \( X \) - H_s^0 \( X \) \| lt.eq 1 \, wide \| H_s^0 \( X + b \) - H_s^0 \( X \) \| lt.eq
   1 . $ <eq:entropy-grid-comparison>]

]
] <lem:entropy-calculus>

#proof[
  The density of $X + V_s$ is $f_s \( z \) = s^(- 1) bb(P) \( X in \[ z - s \, z \) \)$ almost everywhere.
    It is bounded by $1 \/ s$ and has bounded support, so its differential entropy is finite,
    even when the law of $X$ has atoms. Set $p_j \( u \) = bb(P) \( \( j - u \) s lt.eq X < \( j + 1 - u \) s \)$.
    At $z = \( j + 1 - u \) s$ we have $p_j \( u \) = s f_s \( z \)$ almost everywhere.
    Changing variables in the sum of the integrals $- p_j \( u \) log p_j \( u \)$ therefore gives
  $ cal(H)_s \( X \) = - integral_(bb(R)) f_s \( z \) log \( s f_s \( z \) \) thin d z . $
  This proves the first identity. Translation rotates the grid shift modulo $1$,
    and positive scaling changes the cell length. Reflection also preserves averaged entropy:
    $- X + V_s$ is a translate of $- \( X + V'_s \)$, where $V'_s = s - V_s$ is independent uniform.
    These observations prove the signed affine identity.
  Suppose $t = N s$. Let $A$ be independent uniform on $\[ 0 \, t \)$ and define
  $ F = ⌊frac(X + A, s)⌋ \, wide C = ⌊frac(X + A, t)⌋ . $
  These are jointly translated nested grids, with $C = floor.l F \/ N floor.r$. Averaging their entropies gives
  #[#set math.equation(numbering: n => "(2.5)")
   $ G_(s \, t) \( X \) = H \( F divides C \, A \) . $ <eq:nested-conditional-entropy>]
  Each coarse cell contains $N$ fine cells, proving the two bounds.
    For a mixture of laws, conditioning additionally on its mixing variable can only reduce the right-hand side;
    this proves concavity, including for general probability mixtures.
    A convolution is a mixture of translates, so translation invariance proves the convolution inequality.
  Finally, for any two translated grids of lengths $s lt.eq z$,
    a $z$-cell intersects at most $floor.l z \/ s floor.r + 2$ fine cells,
    and an $s$-cell intersects at most two coarse cells. The chain rule bounds the two conditional entropies by
    $log \( z \/ s + 2 \)$ and $1$. Averaging gives (2.3). The same argument for two grids of equal length proves
    (2.4). ◻
]

The integer-ratio hypothesis is essential to our use of concavity.
  In the argument below it is applied only with ratios $2$, a chosen integer $K$, or the square of a chosen integer $M$.

#thm([Lemma 2.2.])[
  (Entropy and dimension).  #emph[Let $nu$ be a compactly supported exact-dimensional probability measure on
    $bb(R)$ of dimension $d$. Then
#[#set math.equation(numbering: n => "(2.6)")
 $ limsup_(s arrow.b 0) frac(max { cal(H)_s \( nu \) \, H_s^0 \( nu \) }, log \( 1 \/ s \)) lt.eq
   d . $ <eq:entropy-dimension-upper>]

]
] <lem:entropy-dimension>

#proof[
  Fix $eta > 0$. Exact dimensionality gives a measurable set $E$ of mass at least $1 -
    eta$ and a common threshold $r_0 > 0$ such that
  $ nu \( B \( x \, r \) \) gt.eq r^(d + eta) wide \( x in E \, 0 < r < r_0 \) . $
  Indeed, the sets where this eventual inequality holds below a fixed reciprocal-integer threshold exhaust a set
    of full measure; rational radii and monotonicity suffice to make this construction measurable.
  For any translated grid of length $s < 2 r_0$, choose one point of $E$ in each cell meeting $E$.
    Within each of the three residue classes of cell indices modulo $3$,
    the chosen points have disjoint balls of radius $s \/ 2$.
    Each ball has mass at least $\( s \/ 2 \)^(d + eta)$. Thus at most $3 \( 2 \/ s \)^(d + eta)$ cells meet $E$.
    Compact support bounds the total number of occupied cells by $C \/ s$,
    uniformly over grid translations and small $s$. Conditioning the cell label on membership in $E$ yields
  $ H \( upright("cell label") \) lt.eq 1 + nu \( E \) log #scale(x: 120%, y: 120%)[\(] 3 \( 2 \/ s \)^(d + eta)
    #scale(x: 120%, y: 120%)[\)] + nu \( E^c \) log \( C \/ s \) lt.eq \( d + 2 eta \) log \( 1 \/ s \) +
    O_(eta \, nu) \( 1 \) . $
  This controls both the fixed grid and its average. Divide by $log \( 1 \/ s \)$ and let $eta arrow.b 0$. ◻
]

For Bernoulli convolutions, the following nonsaturation property appears in Breuillard–Varjú
  #cite(label("BreuillardVarju2019")) Lemma 13. The stopping-time argument below extends it to unequal
  contractions of either sign.

#thm([Lemma 2.3.])[
  (Uniform nonsaturation).  #emph[Let $mu$ be a self-similar probability measure for a finite affine system $x
    mapsto r_i x + t_i$ with $0 < \| r_i \| < 1$. If $mu$ is exact dimensional with dimension $d < 1$, then
#[#set math.equation(numbering: n => "(2.7)")
 $ delta := inf_(v > 0) Delta_v \( mu \) > 0 . $ <eq:uniform-nonsaturation>]

 No separation or orientation assumption is needed.]
] <lem:nonsaturation>

#proof[
  By Lemma 2, $0 lt.eq Delta_v lt.eq 1$. We show that a vanishing one-bit deficit would force almost maximal
    entropy in a fixed wider scale interval. Stopped self-similarity then transfers that estimate to every smaller
    scale, contradicting the entropy bound supplied by exact dimensionality.
    Suppose there are $v_n > 0$ with $Delta_(v_n) \( mu \) arrow.r 0$.
    For $X tilde.op mu$, let $lambda_v$ be the law of $X + V_v$. An independent fair bit $J$ gives
  #[#set math.equation(numbering: n => "(2.8)")
   $ Delta_v \( mu \) = h \( X + V_(2 v) \) - h \( X + V_v \) = I \( J \; X + V_v + v J \) . $ <eq:one-bit-information>]
  Thus the equal mixture of $lambda_v$ and its translate by $v$ carries little information about its input label.
  Here is a quantitative form of that observation. For two laws $P \, Q$, write $parallel P -
    Q parallel_(upright("TV")) = sup_B \| P \( B \) - Q \( B \) \|$.
    Observing whether the mixture sample lies in $B$ bounds the information in (2.8) below by
  $ h_2 #scale(x: 120%, y: 120%)[\(] \( P \( B \) + Q \( B \) \) \/ 2 #scale(x: 120%, y: 120%)[\)] - 1 /
    2 h_2 \( P \( B \) \) - 1 / 2 h_2 \( Q \( B \) \) \, $
  where $h_2$ is binary entropy. Since $h''_2 \( u \) = - 1 \/ \( ln \( 2 \) u \( 1 - u \) \) lt.eq - 4 \/ ln 2$,
    this expression is at least $\( P \( B \) - Q \( B \) \)^2 \/ \( 2 ln 2 \)$.
    Consequently, for $e_v = parallel lambda_v - T_v lambda_v parallel_(upright("TV"))$,
    where $T_v$ denotes translation by $v$,
  #[#set math.equation(numbering: n => "(2.9)")
   $ e_v lt.eq sqrt(2 ln \( 2 \) Delta_v \( mu \)) . $ <eq:small-information-tv>]
  Fix an integer $K gt.eq 2$. The laws $P_i = T_(i v) lambda_v$, $0 lt.eq i < K$,
    have densities $f_i$ and satisfy $parallel P_i - P_0 parallel_(upright("TV")) lt.eq i e_v$.
    Their common density $f_(*) := min_(0 lt.eq i < K) f_i$ has mass $m_v$ with
  #[#set math.equation(numbering: n => "(2.10)")
   $ 1 - m_v lt.eq sum_(i = 1)^(K - 1) integral \( f_0 - f_i \)_(+) lt.eq
     frac(K \( K - 1 \), 2) e_v . $ <eq:common-density-mass>]
  For each input label, decompose its law into this same common submeasure and a residual submeasure of mass $1 -
    m_v$. The common/residual flag can be sampled independently of the input label.
    On the common branch the output gives no information; on the residual branch it gives at most $log K$.
    The mutual information of the uniform mixture is therefore at most $\( 1 - m_v \) log K$.
    That mixture is $mu * "Law" \( V_(K v) \)$, and all its conditional differential entropies equal
    $h \( X + V_v \)$. For this fixed $K$,
  #[#set math.equation(numbering: n => "(2.11)")
   $ G_(v_n \, K v_n) \( mu \) arrow.r log K . $ <eq:large-window-saturation>]
  We next transfer this near-saturation to every smaller scale. Put $a_(*) := min_i \| r_i \| > 0$.
    For $0 < s < v$, stop the independent coding at the first prefix whose absolute contraction is at most $s \/
    v$. The stopping time is bounded because $max_i \| r_i \| < 1$.
    The stopped contractions have absolute values in $\( a_(*) s \/ v \, s \/ v \]$,
    and the remaining coding is independent with law $mu$. Thus $mu$ is a finite mixture of affine images of
    itself with these contractions. Signed scaling and integer-ratio concavity give
  #[#set math.equation(numbering: n => "(2.12)")
   $ G_(s \, K s) \( mu \) & gt.eq inf_(z in \[ v \, v \/ a_(*) \]) G_(z \, K z) \( mu \)\
 & gt.eq G_(v \, K v) \( mu \) - C_(*) \, wide C_(*) := log \( 1 \/ a_(*) + 2 \) + 1 . $ <eq:stopped-scale-transfer>]
  For the second inequality, apply (2.3) at $\( v \, z \)$ and $\( K v \, K z \)$.
    The loss $C_(*)$ is independent of $K$ and the scales.
  Choose an integer $K$ with $\( 1 - d \) log K > C_(*) + 2$.
    Then choose one $v = v_n$ such that $G_(v \, K v) \( mu \) > log K - 1$, using (2.11). For every $0 < s < v$,
  $ G_(s \, K s) \( mu \) > B := log K - C_(*) - 1 > d log K . $
  At $s_m = v K^(- m)$, telescoping gives
  $ cal(H)_(s_m) \( mu \) - cal(H)_v \( mu \) = sum_(j = 1)^m G_(v K^(- j) \, v K^(- \( j - 1 \))) \( mu \) > m B . $
  Its entropy ratio has lower limit at least $B \/ log K > d$, contradicting Lemma 3. This proves the lemma. ◻
]

The next estimate explains how the deficit produces gain.
  Unlike the concavity statements, it does not require an integer ratio of scales.
  The fair-pair comparison follows the method of #cite(label("VarjuAbsolute2019")) Proposition 20 and Lemma 22.

#thm([Lemma 2.4.])[
  (Two-point gain).  #emph[Let $X$ be bounded and $J$ an independent fair bit. For $0 < s < v < t$,
#[#set math.equation(numbering: n => "(2.13)")
 $ G_(s \, t) \( X + v J \) - G_(s \, t) \( X \) gt.eq Delta_v \( X \) - s \/ v - v \/ t . $ <eq:two-point-gain>]

 The same estimate holds for convolution with any fair two-point law whose two points have distance $v$.]
] <lem:two-point>

#proof[
  Put $Y = X + v J$. For each $a > 0$, let $U_a$ be independent uniform on $\[ 0 \, 1 \)$ and write $Z_a =
    floor.l Y \/ a + U_a floor.r$. Translation invariance of the averaged entropy gives
  $ D_a := cal(H)_a \( Y \) - cal(H)_a \( X \) = I \( J \; Z_a divides U_a \) . $
  Uniform smoothing also gives $D_v = h \( X + V_(2 v) \) - h \( X + V_v \) = Delta_v \( X \)$.
  To compare $s$ and $v$, use independent shifts $U_s \, U_v$ and the same sample $Y$. The information chain rule gives
  $ I \( J \; Z_v divides U_s \, U_v \) lt.eq I \( J \; Z_s divides U_s \, U_v \) +
    H \( Z_v divides Z_s \, U_s \, U_v \) . $
  The first two terms are $D_v$ and $D_s$ because the unused shift is independent.
    For each fixed fine grid and each of its cells of positive probability,
    the conditional sample law is independent of $U_v$. That cell, of length $s < v$,
    contains a boundary of the $v$-grid on a proportion $s \/ v$ of its shifts.
    Otherwise the coarse label is fixed; when a boundary occurs there are at most two coarse labels.
    Averaging therefore gives $H \( Z_v divides Z_s \, U_s \, U_v \) lt.eq s \/ v$, whence $D_s gt.eq D_v - s \/ v$.
  For the coarse-scale gain, adjoining $X$ to the observation yields
  $ D_t lt.eq I \( J \; Z_t \, X divides U_t \) = I \( J \; Z_t divides X \, U_t \) . $
  For fixed $X = x$, the two labels at $x$ and $x + v$ differ on a proportion $v \/ t$ of shifts.
    Their conditional information is then one bit and is otherwise zero. Thus $D_t lt.eq v \/ t$.
    Subtracting proves (2.13). The proof allows atoms, since boundary coincidences occur on null sets of shifts.
    Finally, any fair pair is a translate of ${ 0 \, v }$ after ordering its two points;
    translation invariance proves the last assertion, including for reflected pairs. ◻
]

== 3 Pair mass below a fixed scale <sec:pairs>

We next consider a finite probability law without any separation assumption.
  Its exact entropy may greatly exceed its entropy at a prescribed scale.
  The following lemma detects that excess through the mass that can be placed in fair pairs at smaller scales.
  An upper bound for a sumset will make the lemma useful for the block laws in the next section.
  Varjú’s scale-local decomposition into fair two-point submeasures #cite(label("VarjuAbsolute2019"))
  Proposition 21 is a predecessor of this approach. Here the sumset term controls the total capacity over all
  finer bands; we prove the needed estimate by randomized nested partitions.

#prodef([Definition 3.1.])[
  (Pair capacity).  Let $nu$ be a probability law with finite support $F subset bb(R)$.
    For $ell in bb(Z)$, let $cal(E)_ell \( F \)$ be the set of unordered pairs ${ x \,
    y } subset F$ satisfying $2^(- ell) lt.eq \| x - y \| < 2^(1 - ell)$. Define $c_ell \( nu \)$ as the maximum of
  $ sum_(e in cal(E)_ell \( F \)) w_e quad upright("subject to") quad w_e gt.eq 0 \, wide 1 /
    2 sum_(e in.rev x) w_e lt.eq nu \( { x } \) quad \( x in F \) . $
  When $cal(E)_ell \( F \)$ is empty, this maximum is zero.
] <def:pair-capacity>

Thus $c_ell \( nu \)$ is the largest total weight of fair two-point laws in the indicated distance band whose
  weighted sum is a submeasure of $nu$. Summing the constraints gives $sum_e w_e lt.eq 1$;
  the feasible set is compact, so the maximum exists and $0 lt.eq c_ell \( nu \) lt.eq 1$.
  For example, if $nu = p delta_x + \( 1 - p \) delta_y$ with $x eq.not y$,
  then the capacity in the band containing $\| x - y \|$ is $2 min { p \, 1 - p }$, and all its other capacities vanish.

#thm([Lemma 3.2.])[
  (Finite-law pair bound).  #emph[For every integer $k gt.eq
    1$ there is a finite constant $C_k$ such that every finitely supported probability law $nu$ on $bb(R)$ and
    every $rho > 0$ satisfy
#[#set math.equation(numbering: n => "(3.1)")
 $ k #scale(x: 120%, y: 120%)[\(] H \( nu \) - H_rho^0 \( nu \) #scale(x: 120%, y: 120%)[\)] lt.eq log \| k F \| +
   C_k sum_(ell : thin 2^(- ell) lt.eq 2 rho) c_ell \( nu \) \, wide F = "supp" nu \, $ <eq:pair-bound>]

 where $k F = { x_1 + dots.h.c + x_k : x_i in F }$. The constant is independent of the smallest positive distance
   in $F$.]
] <lem:pair-bound>

#proof[
  Let $X_1 \, dots.h \, X_k$ be independent with law $nu$, write $upright(bold(X)) = \( X_1 \, dots.h \, X_k \)$,
    and put $Y = X_1 + dots.h.c + X_k$. Knowing the initial length-$rho$ cells leaves
    $k \( H \( nu \) - H_rho^0 \( nu \) \)$ bits of uncertainty about $upright(bold(X))$.
    Revealing $Y$ costs at most $log \| k F \|$ bits. We bound the remaining uncertainty by successively refining
    those cells. The refinement cuts are random, independent of the samples,
    to prevent atoms close to a fixed boundary from being charged too often.
  ===== 3.1 The partitions. <the-partitions.>
  Set $rho_h = rho 4^(- h)$ for integers $h gt.eq 0$, and start with the half-open grid intervals of length $rho$.
    Suppose a parent at level $h$ has length $L in \[ rho_h \/ 2 \, 2 rho_h \]$.
    Let $N$ be a nearest integer to $L \/ rho_(h + 1)$, with ties resolved by a fixed rule.
    Then $2 lt.eq N lt.eq 8$. Divide the parent into $N$ equal pieces,
    and perturb its internal cuts independently and uniformly by amounts in
    $\[ - rho_(h + 1) \/ 10 \, rho_(h + 1) \/ 10 \]$. The unperturbed child lengths belong to
    $\[ 0.75 rho_(h + 1) \, 1.25 rho_(h + 1) \]$; after perturbation they belong to
    $\[ 0.55 rho_(h + 1) \, 1.45 rho_(h + 1) \]$. Thus the cuts remain ordered and every child has length in
    $\[ rho_(h + 1) \/ 2 \, 2 rho_(h + 1) \]$. Conditional on the previous partitions, every new cut has density at most
  #[#set math.equation(numbering: n => "(3.2)")
   $ 5 / rho_(h + 1) = 20 / rho_h . $ <eq:pair-cut-density>]
  All cuts are sampled independently of $upright(bold(X))$;
    a parent that contains several coordinates uses the same cuts for each coordinate.
  If $F$ is a singleton, the lemma is immediate. Otherwise choose an integer $J$ such that
  $ 2 rho_J < min { \| x - y \| : x \, y in F \, med x eq.not y } . $
  Every level-$J$ cell then contains at most one point of $F$, for every realization of the partitions.
    No bound on $J$ will be needed.
  For a fixed partition scheme, denote by $upright(bold(C))_h$ the tuple of level-$h$ cells containing the
    samples. Nesting and separation at level $J$ give
  #[#set math.equation(numbering: n => "(3.3)")
   $ k #scale(x: 120%, y: 120%)[\(] H \( nu \) - H_rho^0 \( nu \) #scale(x: 120%, y: 120%)[\)] & =
     H \( upright(bold(X)) divides upright(bold(C))_0 \)\
 & lt.eq log \| k F \| + H \( upright(bold(X)) divides upright(bold(C))_0 \, Y \)\
 & = log \| k F \| + sum_(h = 0)^(J - 1) H \( upright(bold(C))_(h + 1) divides upright(bold(C))_h \, Y \) .
   $ <eq:pair-chain>]
  The whole partition scheme is sampled independently of $upright(bold(X))$.
    We now average this finite chain over the schemes; equivalently,
    the conditional entropies on its right also condition on that scheme.
    For the summand at level $h$, the cell labels involved use only cuts through level $h + 1$.
    Conditional on those cuts, all later cuts are independent of $upright(bold(X))$ and hence of $Y$ and these
    labels, so they may be discarded from the conditioning.
  ===== 3.2 One refinement after observing the sum. <one-refinement-after-observing-the-sum.>
  Fix the partitions through level $h$, and condition first on a tuple of current cells $A_1 \, dots.h \,
    A_k$ of positive probability. The coordinates remain independent, with laws $nu \( dot.op divides A_i \)$.
    Write $m_i = bb(E) X_i$ in this conditional law. Each mean belongs to its half-open parent,
    since it is an average of finitely many points of that parent. Fix the new cuts and let
  $ a = min_(1 lt.eq i lt.eq k\
c upright(" a new internal cut of ") A_i) \| m_i - c \| . $
  This minimum is positive almost surely in the new cuts. Call coordinate $i$ exceptional when $\| X_i -
    m_i \| gt.eq a \/ \( 4 k \)$, let $p_i$ be its probability, and put $t = sum_i p_i$.
    Let $E$ be the event that at least two coordinates are exceptional, and write $q = bb(P) \( E \)$.
    Independence, before conditioning on $Y$, gives
  #[#set math.equation(numbering: n => "(3.4)")
   $ q lt.eq sum_(i < j) p_i p_j lt.eq t^2 \, wide q lt.eq t . $ <eq:pair-two-exceptions>]
  Also put
  $ B = {lr(|Y - sum_i m_i|) gt.eq a \/ 2} . $
  This second event is known once $Y$ is known, and $bb(P) \( B \) lt.eq t$:
    if every coordinate is nonexceptional, the sum deviation is less than $a \/ 4$.
  On $E^c ∩ B^c$, every child label equals the child label of its mean.
    Indeed, a changed label forces $\| X_i - m_i \| gt.eq a$ for some $i$,
    including a change at a half-open endpoint. There is then at most one exceptional coordinate, so
  $ lr(|sum_j \( X_j - m_j \)|) gt.eq a - frac(k - 1, 4 k) a > a \/ 2 \, $
  a contradiction. Each coordinate has at most eight child labels.
    In the next display, conditioning on the fixed partitions and new cuts is implicit.
    By revealing the flag $1_E$ in addition to $Y$, we obtain
  #[#set math.equation(numbering: n => "(3.5)")
   $ H \( upright(bold(C))_(h + 1) divides Y \, upright(bold(C))_h = \( A_i \) \) & lt.eq h_2 \( q \) +
     3 k #scale(x: 120%, y: 120%)[\(] q + bb(P) \( B \) #scale(x: 120%, y: 120%)[\)]\
 & lt.eq \( 3 + 6 k \) t lt.eq 9 k sum_i p_i . $ <eq:pair-flag>]
  Here $h_2 \( q \) lt.eq 3 sqrt(q)$ and (3.4) were used. The elementary binary entropy bound follows from
    $- \( 1 - q \) ln \( 1 - q \) lt.eq q$ and $- sqrt(q) ln q lt.eq 2 \/ e$.
    There is no binary-entropy cost for $B$, since it is determined by the conditioned observation $Y$.
    This distinction is what makes (3.5) linear in the exceptional probabilities.
  ===== 3.3 Averaging the cuts and converting to pairs. <averaging-the-cuts-and-converting-to-pairs.>
  For a fixed value of $X_i$, set $u = \| X_i - m_i \|$. The event $a lt.eq
    4 k u$ requires one of at most $7 k$ cuts to be within $4 k u$ of its corresponding mean.
    The density bound (3.2) and a union bound give
  $ bb(P)_(upright("cuts")) \( a lt.eq 4 k u \) lt.eq 7 k 20 / rho_h \( 8 k u \) = 1120 k^2 u / rho_h . $
  Consequently
  $ bb(E)_(upright("cuts")) p_i lt.eq frac(1120 k^2, rho_h) bb(E) \| X_i - m_i \| lt.eq
    frac(1120 k^2, rho_h) bb(E) \| X_i - X'_i \| \, $
  where $X'_i$ is an independent copy in the same current cell. The last inequality is Jensen’s inequality.
    These expectations still use the current-cell conditional laws.
  For a fixed level-$h$ partition, integrating the cells out gives the symmetric coupling
  $ pi_h = sum_(A : thin nu \( A \) > 0) nu \( A \) #scale(x: 120%, y: 120%)[\(] nu \( dot.op divides A \) ⊗
    nu \( dot.op divides A \) #scale(x: 120%, y: 120%)[\)] . $
  Both its marginals equal $nu$, and its pairs have distance at most $2 rho_h$.
    Each of the $k$ coordinate contributions becomes the same integral against $pi_h$.
    Thus (3.5), averaged over the new cuts and current cells, is at most
  #[#set math.equation(numbering: n => "(3.6)")
   $ frac(10080 k^4, rho_h) integral \| x - y \| thin d pi_h \( x \, y \) . $ <eq:pair-distance-cost>]
  For each band $2^(- ell) lt.eq \| x - y \| < 2^(1 - ell)$,
    the corresponding portion of $pi_h$ supplies a feasible mixture in Definition 6.
    Explicitly, the weight assigned to the unordered pair ${ x \, y }$ is $pi_h \( x \, y \) + pi_h \( y \, x \) =
    2 pi_h \( x \, y \)$.
    The resulting submeasure has mass $sum_(y : thin 2^(- ell) lt.eq \| x - y \| < 2^(1 - ell))
    pi_h \( x \, y \)$ at $x$, which is at most $nu \( { x } \)$.
    Its total weight equals the mass of that band under $pi_h$. Therefore (3.6) is at most
  #[#set math.equation(numbering: n => "(3.7)")
   $ 20160 k^4 sum_(ell : thin 2^(- ell) lt.eq 2 rho_h) 2^(- ell) / rho_h c_ell \( nu \) . $ <eq:pair-one-level>]
  This estimate also holds after averaging the previous partitions; its right side refers only to the original law $nu$.
  ===== 3.4 Summing all finer scales. <summing-all-finer-scales.>
  For a fixed $ell$, the factors $2^(- ell) \/ rho_h$ grow by four at each step and are summed only while they are
    at most two. Hence
  $ sum_(h gt.eq 0 : thin 2^(- ell) lt.eq 2 rho_h) 2^(- ell) / rho_h lt.eq 8 / 3 . $
  Summing (3.7) in (3.3) proves (3.1); one may take $C_k = 60000 k^4$.
    The separating depth $J$ disappears from the bound. In particular,
    the estimate includes separations smaller than any prescribed exponential scale. ◻
]

For a fixed finite law only finitely many pair capacities are nonzero.
  Later we will apply Lemma 7 to a finite family of finite laws for each fixed block count.
  Their nonzero capacities therefore lie in a common finite range,
  although the upper endpoint need not have any effective bound.

== 4 Conditioning on block types <sec:types>

Let $Phi = \( phi_i \)_(i in Lambda)$ be a finite affine iterated function system on $bb(R)$,
  where $phi_i \( x \) = r_i x + t_i$ and $0 < \| r_i \| < 1$.
  Let $p = \( p_i \)_(i in Lambda)$ be a strictly positive probability vector,
  and let $mu$ be its self-similar measure. Write $G_n$ for the random complete affine map obtained from $n$
  independent symbols with law $p$, and let $h = lim_(n arrow.r oo) H \( G_n \) \/ n$ be its entropy rate.
  Throughout this section assume

#[#set math.equation(numbering: n => "(4.1)")
 $ d := dim_H mu < 1 \, wide d chi < h \, wide chi = - sum_(i in Lambda) p_i log \| r_i \| . $ <eq:types-loss>]

All logarithms have base $2$. We will find finite conditional coding laws whose exact entropy exceeds their
  entropy at a prescribed scale by a positive multiple of the number of blocks.
  Lemma 7 will then turn this deficit into pair mass across finite bands of arbitrarily fine scales.

We condition on the number of occurrences of each symbol in a short block.
  These counts fix its signed contraction. Once all block contractions are fixed,
  the translation determines the complete composed map. The entropy cost of recording the counts is small,
  so the conditional translations retain almost all the map entropy.
  This argument allows distinct words to define the same map.
  The block-type disintegration is due to Galicer–Saglietti–Shmerkin–Yavicoli
  #cite(label("GalicerSagliettiShmerkinYavicoli2016")) Section 6.4,
  Lemma 6.6 and is developed further by Saglietti–Shmerkin–Solomyak #cite(label("SagliettiShmerkinSolomyak2018"))
  Lemma 6.2; Käenmäki–Orponen explicitly allow repeated indexed maps #cite(label("KaenmakiOrponen2023"))
  Section 2.2, Proposition 2.8. We retain the signed contraction and estimate the entropy of the complete map
  after collisions have been combined.

=== 4.1 Parameters and conditional coding laws <parameters-and-conditional-coding-laws>

Write $m = \| Lambda \|$. The second inequality in (4.1) implies $h > 0$, hence $m gt.eq 2$.
  Choose $alpha > chi$ such that $d alpha < h$. For $d > 0$ we may take $chi < alpha < h \/ d$; for $d =
  0$ we may take $alpha = chi + 1$. Choose an integer $b gt.eq 1$ sufficiently large that

$ m log \( b + 1 \) < b #scale(x: 120%, y: 120%)[\(] h - d alpha #scale(x: 120%, y: 120%)[\)] \, $

and set

#[#set math.equation(numbering: n => "(4.2)")
 $ A = b alpha \, wide A' = frac(b \( chi + alpha \), 2) \, wide h_b = b h -
   m log \( b + 1 \) . $ <eq:types-parameters>]

Then

#[#set math.equation(numbering: n => "(4.3)")
 $ b chi < A' < A \, wide gamma := h_b - d A > 0 . $ <eq:types-gap>]

These parameters remain fixed throughout the rest of the proof.

Group the iid symbols with law $p$ into words $W_0 \, W_1 \, dots.h in Lambda^b$.
  For $w in Lambda^b$ let $"type" \( w \) = \( kappa_i \)_(i in Lambda)$,
  where $kappa_i$ counts the occurrences of $i$ in $w$. The set $cal(T)_b$ of types consists of the nonnegative
  integer vectors with $sum_i kappa_i = b$, and has cardinality at most $\( b + 1 \)^m$. For $kappa in cal(T)_b$, define

$ N_kappa = frac(b !, product_i kappa_i !) \, wide q_kappa = N_kappa product_i p_i^(kappa_i) \, wide Q_kappa =
  "Law" #scale(x: 120%, y: 120%)[\(] W_0 divides "type" \( W_0 \) = kappa #scale(x: 120%, y: 120%)[\)] . $

Every word of type $kappa$ has probability $product_i p_i^(kappa_i)$,
  so $Q_kappa$ is uniform on its $N_kappa$ words. Equivalently,
  we can generate the original coding by first choosing independent types $omega_0 \, omega_1 \,
  dots.h$ with distribution $q$, then choosing the words independently with respective conditional laws
  $Q_(omega_0) \, Q_(omega_1) \, dots.h$. This follows by multiplying the probabilities of any finite sequence of
  blocks. In particular it preserves the original, possibly unequal, symbol weights $p_i$.

Write $omega = \( omega_h \)_(h gt.eq 0)$ for the type sequence and $theta
  omega = \( omega_(h + 1) \)_(h gt.eq 0)$ for its shift. For $j gt.eq 0$,
  let $cal(F)_j$ be the sigma-algebra generated by $omega_0 \, dots.h \, omega_(j - 1)$; $cal(F)_0$ is trivial.
  For a type $kappa$ and an environment $omega$, define

#[#set math.equation(numbering: n => "(4.4)")
 $ r \( kappa \) = product_(i in Lambda) r_i^(kappa_i) \, wide R_j = R_j \( omega \) =
   product_(h < j) r \( omega_h \) \, wide sigma_j = - log \| R_j \| \, $ <eq:types-products>]

with $R_0 = 1$ and $sigma_0 = 0$. Thus $R_j$ is $cal(F)_j$-measurable, including its sign. Let

$ D = max_(kappa in cal(T)_b) #scale(x: 120%, y: 120%)[\(] - log \| r \( kappa \) \| #scale(x: 120%, y: 120%)[\)] . $

The increments of $sigma_j$ are iid bounded positive random variables of mean $b chi$, and $0 lt.eq sigma_j lt.eq D j$.

Given $omega$, use the independent conditional block draws above to define

#[#set math.equation(numbering: n => "(4.5)")
 $ nu_(omega \, n) = "Law"_omega #h(-0.16667em) (sum_(h = 0)^(n - 1) R_h phi_(W_h) \( 0 \)) \, wide mu_omega =
   "Law"_omega #h(-0.16667em) (sum_(h = 0)^oo R_h phi_(W_h) \( 0 \)) . $ <eq:types-laws>]

Here $"Law"_omega$ denotes the law under those conditional word draws.
  The infinite sum converges uniformly, since the block translations form a finite set and $max_i \| r_i \| < 1$.
  The law $nu_(omega \, n)$ depends only on $cal(F)_n$, whereas $mu_omega$ can depend on the entire environment.
  Averaging over the types gives $mu = bb(E) mu_omega$. For any real $u eq.not 0$ and any law $lambda$,
  write $sans(D)_u lambda = "Law" \( u X \)$ when $X$ has law $lambda$; this notation retains the sign of $u$.

For $n gt.eq 1$, let $Omega_n = \( omega_0 \, dots.h \, omega_(n - 1) \)$ be the tuple of the first $n$ types, and put

#[#set math.equation(numbering: n => "(4.6)")
 $ rho_n = 2^(- ceil.l A n ceil.r) \, wide E_n = { omega : sigma_n lt.eq A' n } \, wide a_n = ceil.l A n ceil.r -
   1 . $ <eq:types-scales>]

#thm([Lemma 4.1.])[
  (Entropy retained by types).  #emph[For a system satisfying (4.1),
    with the parameters (4.2) and conditional laws (4.5), for every $n gt.eq 1$ and $s > 0$ we have
#[#set math.equation(numbering: n => "(4.7)")
 $ bb(E) H \( nu_(omega \, n) \) & = H \( G_(b n) divides Omega_n \) gt.eq n h_b \,\
bb(E) H_s^0 \( nu_(omega \, n) \) & lt.eq H_s^0 \( mu \) + 1 . $ <eq:types-exact-entropy>]

 Moreover, there are $epsilon > 0$ and an integer $n_0$ such that for every $n gt.eq n_0$,
#[#set math.equation(numbering: n => "(4.8)")
 $ bb(E) #h(-0.16667em)
   [upright(bold(1))_(E_n) #scale(x: 120%, y: 120%)[\(] H \( nu_(omega \, n) \) - H_(rho_n)^0 \( nu_(omega \,
   n) \) #scale(x: 120%, y: 120%)[\)]] gt.eq epsilon n . $ <eq:types-deficit>]

]
] <lem:type-deficit>

#proof[
  Fix $Omega_n$. The composition corresponding to a tuple $\( w_0 \, dots.h \, w_(n - 1) \)$ of allowed blocks is
  $ phi_(w_0 dots.h.c w_(n - 1)) \( x \) = R_n x + sum_(h < n) R_h phi_(w_h) \( 0 \) . $
  Its signed slope $R_n$ is fixed by $Omega_n$, and its translation has law $nu_(omega \, n)$.
    Thus the complete map and its translation determine one another under this conditioning,
    even when several words give the same map. It follows that
  $ bb(E) H \( nu_(omega \, n) \) = H \( G_(b n) divides Omega_n \) . $
  There are at most $\( b + 1 \)^m$ types, and the block types are independent, so $H \( Omega_n \) lt.eq
    n m log \( b + 1 \)$. The entropy-rate definition gives $H \( G_(b n) \) gt.eq b n h$. Therefore
  $ H \( G_(b n) divides Omega_n \) & gt.eq H \( G_(b n) \) - H \( Omega_n \)\
 & gt.eq b n h - n m log \( b + 1 \) = n h_b . $
  This conditioning inequality does not require $Omega_n$ to be a function of $G_(b n)$;
    equal maps may arise from different type tuples. This proves (4.7).
  We next compare the finite sum with the original measure at a fixed grid scale.
    Translation changes fixed-grid entropy by at most one bit: for any bounded random variable $X$ and $t in bb(R)$,
  #[#set math.equation(numbering: n => "(4.9)")
   $ H_s^0 \( X + t \) gt.eq H_s^0 \( X \) - 1 . $ <eq:types-grid-translation>]
  This is the fixed-grid bound in Lemma 2, Equation (2.4).
  Condition now only on $cal(F)_n$. The original symbols after the first $b
    n$ positions are still independent with law $p$, and are independent of the prefix.
    Consequently the full coding law conditional on $cal(F)_n$ is
  $ lambda_omega = nu_(omega \, n) * sans(D)_(R_n) mu \, wide mu = bb(E) lambda_omega . $
  For each fixed type prefix this convolution is a mixture of translations of $nu_(omega \, n)$.
    Applying concavity of fixed-grid entropy first to these translations and then to the type mixture,
    and using (4.9), gives
  $ H_s^0 \( mu \) gt.eq bb(E) H_s^0 \( lambda_omega \) gt.eq bb(E) H_s^0 \( nu_(omega \, n) \) - 1 . $
  All entropies are finite because the laws have bounded support.
    The sign of $R_n$ affects only the random translation in this argument. This proves (4.7).
  Set $V_n = H \( nu_(omega \, n) \) - H_(rho_n)^0 \( nu_(omega \, n) \)$.
    Quantization is a function of the exact finite value, so
  #[#set math.equation(numbering: n => "(4.10)")
   $ 0 lt.eq V_n lt.eq H \( nu_(omega \, n) \) lt.eq n b log m . $ <eq:types-deficit-bound>]
  By Lemma 3, $limsup_(s arrow.b 0) H_s^0 \( mu \) \/ log \( 1 \/ s \) lt.eq d$.
    Choose $eta = gamma \/ \( 4 A \) > 0$. For all sufficiently large $n$, the preceding estimates give
  $ bb(E) V_n & gt.eq n h_b - \( d + eta \) ceil.l A n ceil.r - 1\
 & gt.eq 3 / 4 gamma n - \( d + eta \) - 1 gt.eq 1 / 2 gamma n . $
  The law of large numbers and $b chi < A'$ imply $bb(P) \( E_n^c \) arrow.r 0$.
    By (4.10), after increasing the threshold on $n$,
  $ bb(E) \[ upright(bold(1))_(E_n^c) V_n \] lt.eq n b log m thin bb(P) \( E_n^c \) lt.eq 1 / 4 gamma n . $
  Thus (4.8) holds with $epsilon = gamma \/ 4$. ◻
]

=== 4.2 From the deficit to bands of pair mass <from-the-deficit-to-bands-of-pair-mass>

The preceding lemma produces entropy that is invisible at scale $rho_n$.
  To apply the finite-law estimate, we must also control the number of possible sums of several independent copies
  of a conditional prefix. Fixing the types makes that count uniform in the environment.

#thm([Proposition 4.2.])[
  (Pair mass in finite scale bands).  #emph[Under the assumptions and notation of Lemma 8,
    there exist $c > 0$ and an integer $n_0$ such that, for each $n gt.eq n_0$,
    there is a deterministic finite integer $B_n gt.eq a_n$ satisfying
#[#set math.equation(numbering: n => "(4.11)")
 $ bb(E) #h(-0.16667em) [upright(bold(1))_(E_n) sum_(ell = a_n)^(B_n) c_ell \( nu_(omega \, n) \)] gt.eq
   c n . $ <eq:types-pair-bands>]

 Here $c_ell \( nu \)$ is the maximum total weight of fair two-point laws with separations in
   $\[ 2^(- ell) \, 2^(1 - ell) \)$ whose weighted sum is a submeasure of $nu$, as in Lemma 7.
   The constants $b \, A \, A' \, c \, n_0$ are independent of $n$ and $omega$; no growth bound on $B_n$ is asserted.]
] <prop:pair-bands>

#proof[
  Let $cal(D)_b = { phi_w \( 0 \) : w in Lambda^b }$. It has at most $m^b$ elements.
    For fixed types, write $S = "supp" nu_(omega \, n)$. Since every $R_h$ is fixed by the types,
  $ S subset.eq sum_(h < n) R_h cal(D)_b \, wide k S subset.eq sum_(h < n) R_h \( k cal(D)_b \) quad \( k gt.eq 1 \) . $
  A sum of $k$ elements of $cal(D)_b$ is specified by the number of occurrences of each digit.
    Each count belongs to ${ 0 \, dots.h \, k }$, so $\| k cal(D)_b \| lt.eq \( k + 1 \)^(m^b)$ and hence
  #[#set math.equation(numbering: n => "(4.12)")
   $ log \| k S \| lt.eq n m^b log \( k + 1 \) . $ <eq:types-sumset>]
  This is an upper bound regardless of any collisions among the represented sums and regardless of the signs of
    the $R_h$.
  With $b$ and $epsilon$ already fixed, choose an integer $k$ so large that
  $ m^b log \( k + 1 \) < frac(k epsilon, 2) . $
  Apply Lemma 7 to each $nu_(omega \, n)$ at scale $rho_n$.
    Its conclusion, with a positive constant $C_k$ depending only on $k$, is
  $ k #scale(x: 120%, y: 120%)[\(] H \( nu_(omega \, n) \) -
    H_(rho_n)^0 \( nu_(omega \, n) \) #scale(x: 120%, y: 120%)[\)] lt.eq log \| k S \| +
    C_k sum_(ell gt.eq a_n) c_ell \( nu_(omega \, n) \) \; $
  the index condition follows from $2^(- ell) lt.eq 2 rho_n$ if and only if $ell gt.eq a_n$.
    Multiply by $upright(bold(1))_(E_n)$ and take expectations. Lemma 8 and (4.12) give
  $ C_k bb(E) #h(-0.16667em) [upright(bold(1))_(E_n) sum_(ell gt.eq a_n) c_ell \( nu_(omega \, n) \)] gt.eq
    k epsilon n - n m^b log \( k + 1 \) gt.eq frac(k epsilon n, 2) . $
  For fixed $n$ there are finitely many type prefixes and thus finitely many laws $nu_(omega \, n)$,
    all with finite support. Collect the dyadic band indices of all distinct pairs of support points in all these
    laws into a finite set $J_n subset bb(Z)$, and set
  $ B_n = max #scale(x: 120%, y: 120%)[\(] { a_n } union J_n #scale(x: 120%, y: 120%)[\)] . $
  For every environment, $c_ell \( nu_(omega \, n) \) = 0$ when $ell > B_n$.
    Thus the infinite sum in the last inequality equals the sum from $a_n$ to $B_n$, and (4.11) follows with $c =
    k epsilon \/ \( 2 C_k \)$. ◻
]

The bands in Proposition 9 can extend far beyond the scale $2^(- A n)$. Their finiteness is enough:
  the next step will select successive block lengths after the earlier upper endpoints $B_n$ are known.
  No quantitative separation of distinct cylinder translations has been used.

== 5 Disjoint windows of entropy gain <sec:windows>

Proposition 9 supplies a linear amount of fair-pair weight in a finite interval of logarithmic depths for every
  sufficiently long block segment. We now turn this weight into entropy gain.
  The difficulty is that the depth interval may extend arbitrarily far.
  We choose several segments whose depth intervals are separated,
  and show that their gains occupy disjoint windows of block indices.
  At each physical scale the total gain is bounded, whereas every chosen interval contributes the same positive
  amount after averaging over scales.

Throughout this section, retain the environment and constants from Section 4.
  Thus $sigma_j = - log \| R_j \|$ is the contraction depth after $j$ blocks, $D$ bounds each block’s depth,
  and $cal(F)_j = sigma \( omega_0 \, dots.h \, omega_(j - 1) \)$ records the first $j$ types.
  In particular, $sigma_j lt.eq D j$. The logarithmic-depth bands are $\[ a_n \, B_n \]$, where $a_n =
  ceil.l A n ceil.r - 1$, and their expected total weight on $E_n = { sigma_n lt.eq A' n }$ is at least $c n$.

Let $theta$ denote the left shift of the type sequence. Define the suffix laws,
  including their contraction from the initial scale, by

$ tau_j = sans(D)_(R_j) mu_(theta^j omega) \, wide j gt.eq 0 . $

The independent conditional block draws give the pathwise identity

#[#set math.equation(numbering: n => "(5.1)")
 $ tau_j = \( sans(D)_(R_j) nu_(theta^j omega \, n) \) * tau_(j + n) \, wide n gt.eq 1 . $ <eq:suffix-convolution>]

All these laws have compact support. The signs of $R_j$ are retained in the laws; only scale changes use $\| R_j \|$.

By Lemma 4, choose $delta > 0$ such that

$ Delta_v \( mu \) := 1 - G_(v \, 2 v) \( mu \) gt.eq delta wide \( v > 0 \) . $

Fix an integer $M > 4$ with $5 \/ M < delta \/ 2$. For an integer target depth $L gt.eq 1$, write $r =
  2^(- L)$ and define

#[#set math.equation(numbering: n => "(5.2)")
 $ g_j = G_(r \/ M \, M r) \( tau_j \) . $ <eq:window-entropy>]

Here and below $g_j$ depends on $L$ and $omega$. The ratio of the two window scales is the integer $M^2$.
  Lemma 2 and (5.1) therefore imply, for every environment,

#[#set math.equation(numbering: n => "(5.3)")
 $ 0 lt.eq g_j lt.eq 2 log M \, wide g_j gt.eq g_(j + 1) . $ <eq:window-monotonicity>]

=== 5.1 A gain after averaging the unobserved future <a-gain-after-averaging-the-unobserved-future>

An individual conditional tail need not satisfy the nonsaturation bound for $mu$.
  To use that bound, we condition only on the types through the end of the finite block segment producing a fair
  pair. The unobserved future types then average its tail law back to a scaled copy of $mu$.

#thm([Lemma 5.1.])[
  (Conditional pair gain).  #emph[For all integers $j gt.eq 0$, $n gt.eq 1$, and $L gt.eq 1$, with $g_j$ as in (5.2),
#[#set math.equation(numbering: n => "(5.4)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] g_j - g_(j + n) divides cal(F)_(j + n) #scale(x: 120%, y: 120%)[\]] gt.eq
   delta / 2 c_(L - ceil.l sigma_j ceil.r) \( nu_(theta^j omega \, n) \) . $ <eq:conditional-gain>]

]
] <lem:conditional-gain>

#proof[
  Condition on $cal(F)_(j + n)$ and put $ell = L - ceil.l sigma_j ceil.r$.
    The finite law $nu_(theta^j omega \, n)$, the signed products $R_j \, R_(j + n)$, and $ell$ are now fixed.
    Choose a fair-pair decomposition attaining $c_ell \( nu_(theta^j omega \, n) \)$.
    Such a choice is measurable in $cal(F)_(j + n)$: for fixed $j \, n \,
    L$ there are only finitely many initial type sequences, so one may fix a maximizer for each of them.
  A selected pair of distance $u in \[ 2^(- ell) \, 2^(1 - ell) \)$ has distance $v = \| R_j \| u$ after scaling.
    Since $r = 2^(- L)$,
  $ v / r in #scale(x: 120%, y: 120%)[\[] 2^(ceil.l sigma_j ceil.r - sigma_j) \,
    2^(1 + ceil.l sigma_j ceil.r - sigma_j) #scale(x: 120%, y: 120%)[\)] subset \[ 1 \, 4 \) . $
  Thus $r \/ M < v < M r$ and
  $ frac(r \/ M, v) + frac(v, M r) lt.eq 5 / M . $
  Even if $R_j$ is negative, the scaled pair, after ordering its endpoints,
    is a translate of the fair law on ${ 0 \, v }$. Translation invariance and Lemma 5 show that this pair
    increases the window entropy of $tau_(j + n)$ by at least
  $ Delta_v \( tau_(j + n) \) - 5 / M . $
  The types beginning at index $j + n$ are independent of $cal(F)_(j + n)$.
    Since averaging $mu_omega$ over the environment gives $mu$, their conditional mean is the identity of measures
  $ bb(E) \[ tau_(j + n) divides cal(F)_(j + n) \] = sans(D)_(R_(j + n)) mu . $
  The functional $Delta_v = 1 - G_(v \, 2 v)$ is convex by Lemma 2.
    Each chosen distance $v$ is fixed under the present conditioning. Hence Jensen’s inequality and signed scaling give
  $ bb(E) \[ Delta_v \( tau_(j + n) \) divides cal(F)_(j + n) \] & gt.eq Delta_v \( sans(D)_(R_(j + n)) mu \)\
 & = Delta_(v \/ \| R_(j + n) \|) \( mu \) gt.eq delta . $
  Apply concavity of $G_(r \/ M \, M r)$ to the selected pairs and the residual positive measure in the prefix
    law. If the residual mass is nonzero, normalize it to a probability law;
    convolution with that law contributes a nonnegative gain by Lemma 2, since the scale ratio is $M^2$.
    The same statement is vacuous when the residual mass is zero.
    Summing the conditional lower bounds for all the selected pairs therefore gives
  $ bb(E) \[ g_j - g_(j + n) divides cal(F)_(j + n) \] gt.eq
    (delta - 5 / M) c_ell \( nu_(theta^j omega \, n) \) gt.eq delta / 2 c_ell \( nu_(theta^j omega \, n) \) \, $
  as required. ◻
]

=== 5.2 Choosing disjoint block windows <choosing-disjoint-block-windows>

Fix any positive integer $q$. Choose sufficiently large integers $n_1 < dots.h.c <
  n_q$ successively so that Proposition 9 applies, $a_(n_i) gt.eq 1$, and

#[#set math.equation(numbering: n => "(5.5)")
 $ a_(n_i) - A' n_i - 1 > B_(n_h) wide \( h < i \) . $ <eq:separated-bands>]

This is possible because the previously chosen $B_(n_h)$ are finite and

$ a_n - A' n - 1 = ceil.l A n ceil.r - A' n - 2 gt.eq \( A - A' \) n - 2 arrow.r oo . $

In particular, the choice uses no upper bound on how fast $B_n$ grows. Call $\[ a_(n_i) \, B_(n_i) \]$ band $i$.
  Larger $i$ means finer physical scales, since (5.5) gives $a_(n_i) > B_(n_h)$ for $h < i$.

Choose an even integer $T$ with

#[#set math.equation(numbering: n => "(5.6)")
 $ T / 2 > max_(1 lt.eq i lt.eq q) B_(n_i) . $ <eq:target-range>]

For band $i$, use the candidate starts

#[#set math.equation(numbering: n => "(5.7)")
 $ J_i = {k n_i : k in bb(Z) \, med 0 lt.eq k lt.eq ⌊frac(T, 2 D n_i)⌋} . $ <eq:candidate-starts>]

For each target $L in { 1 \, dots.h \, T }$, retain the window $\[ j \, j + n_i \)$, $j in J_i$, exactly on the event

#[#set math.equation(numbering: n => "(5.8)")
 $ cal(A)_(i \, j \, L) = {sigma_(j + n_i) - sigma_j lt.eq A' n_i \, quad a_(n_i) lt.eq L -
   ceil.l sigma_j ceil.r lt.eq B_(n_i)} . $ <eq:retention>]

This event belongs to $cal(F)_(j + n_i)$, the same sigma-algebra as the conditioning in Lemma 10.

The reason for the separation condition is simple. As a block start $j$ moves forward,
  the adjusted target depth $L - ceil.l sigma_j ceil.r$ is nonincreasing.
  A retained window in a finer band cannot decrease this depth far enough to reach any coarser band.
  The next lemma makes this order precise for every environment.

#thm([Lemma 5.2.])[
  (Disjoint retained windows).  #emph[For each fixed environment and target $L in { 1 \, dots.h \, T }$,
    all the retained windows in (5.8) are pairwise disjoint. Consequently,
#[#set math.equation(numbering: n => "(5.9)")
 $ sum_(i = 1)^q sum_(j in J_i) upright(bold(1))_(cal(A)_(i \, j \, L)) \( g_j - g_(j + n_i) \) lt.eq
   2 log M . $ <eq:telescoping-windows>]

]
] <lem:disjoint-windows>

#proof[
  Set $x_j = L - ceil.l sigma_j ceil.r$; this is nonincreasing in $j$.
    If the band-$i$ window $\[ j \, j + n_i \)$ is retained, then
  $ ceil.l sigma_(j + n_i) ceil.r - ceil.l sigma_j ceil.r lt.eq sigma_(j + n_i) - sigma_j + 1 lt.eq A' n_i + 1 \, $
  so
  #[#set math.equation(numbering: n => "(5.10)")
   $ x_(j + n_i) gt.eq a_(n_i) - A' n_i - 1 . $ <eq:window-end-depth>]
  If $\[ k \, k + n_h \)$ is a retained window in a coarser band $h < i$, then $x_k lt.eq B_(n_h)$. By (5.5) and (5.10),
  $ x_(j + n_i) > B_(n_h) gt.eq x_k . $
  Monotonicity of $x_j$ forces $k > j + n_i$. Thus the window from the finer band ends before the window from the
    coarser band starts. Within a single band, distinct starts are distinct multiples of its length $n_i$,
    so its half-open windows also do not overlap.
  List the retained windows in increasing order as $\[ u_1 \, v_1 \) \, dots.h \, \[ u_N \, v_N \)$,
    with $v_t lt.eq u_(t + 1)$. By (5.3),
  $ sum_(t = 1)^N \( g_(u_t) - g_(v_t) \) lt.eq g_(u_1) - g_(v_N) lt.eq 2 log M . $
  The empty sum is zero. This proves (5.9). ◻
]

Figure 1 shows the order of retained windows from two different bands in this proof.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (10.92, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((10.92, 0), [block index], anchor: "west", padding: 0.1176cm)
  line((0.86, 0), (4.3, 0), stroke: (thickness: 1.5pt, miter-limit: 10))
  line((6.88, 0), (9.03, 0), stroke: (thickness: 1.5pt, miter-limit: 10))
  line((0.86, -0.1032), (0.86, 0.1032), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((4.3, -0.1032), (4.3, 0.1032), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((6.88, -0.1032), (6.88, 0.1032), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((9.03, -0.1032), (9.03, 0.1032), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.86, -0.1032), [$j$], anchor: "north", padding: 0.1176cm)
  content((4.3, -0.1032), [$j+n_i$], anchor: "north", padding: 0.1176cm)
  content((6.88, -0.1032), [$k$], anchor: "north", padding: 0.1176cm)
  content((9.03, -0.1032), [$k+n_h$], anchor: "north", padding: 0.1176cm)
  content((2.58, 0.129), [band $i$], anchor: "south", padding: 0.1176cm)
  content((7.955, 0.129), [band $h<i$], anchor: "south", padding: 0.1176cm)
  line((4.3, 0.688), (6.88, 0.688), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((5.59, 0.688), [$x_(j+n_i)>B_(n_h) gt.eq x_k$], anchor: "south", padding: 0.1176cm)
})],
  caption: [Figure 1: At a fixed target depth, a retained window from a finer band ends before any retained window from a coarser band begins. Here $x_j = L - ceil.l sigma_j ceil.r$ is nonincreasing in the block index. The schematic is not to scale. ],
) <fig:disjoint-windows>

=== 5.3 Summing over target depths <summing-over-target-depths>

The disjointness lemma bounds the total gain at one physical scale.
  Summing over targets recovers every pair scale in each band. Indeed, for a candidate $j in J_i$,

$ 0 lt.eq sigma_j lt.eq D j lt.eq T \/ 2 . $

Because $T$ is even, this also gives $0 lt.eq ceil.l sigma_j ceil.r lt.eq T \/ 2$.
  Each integer $ell in \[ a_(n_i) \, B_(n_i) \]$ therefore occurs exactly once as $L -
  ceil.l sigma_j ceil.r$ for $1 lt.eq L lt.eq T$: take $L = ell + ceil.l sigma_j ceil.r$.
  Its lower bound is $1$, and its upper bound is at most $B_(n_i) + T \/ 2 < T$.

Each band has at least $T \/ \( 2 D n_i \)$ candidate starts,
  and each contributes expected pair mass at least $c n_i$ after summing the targets.
  The block length cancels, so every band supplies a fixed multiple of $T$. Take expectations in (5.9).
  Since the retention indicator is $cal(F)_(j + n_i)$-measurable,
  the tower property and Lemma 10 apply to each summand. Sum the result over $L = 1 \, dots.h \,
  T$ and use the preceding exact correspondence to obtain

#[#set math.equation(numbering: n => "(5.11)")
 $ 2 T log M & gt.eq delta / 2 sum_(i = 1)^q sum_(j in J_i) bb(E)
   [upright(bold(1))_(E_(n_i)) \( theta^j omega \) sum_(ell = a_(n_i))^(B_(n_i)) c_ell \( nu_(theta^j omega \, n_i) \)]\
 & gt.eq frac(delta c, 2) sum_(i = 1)^q \| J_i \| n_i gt.eq frac(delta c q T, 4 D) . $ <eq:final-window-count>]

The second inequality uses Proposition 9 and the identical distribution of the type environment under $theta^j$;
  independence between different candidate windows is not needed. The last inequality follows from the exact count

$ \| J_i \| = ⌊frac(T, 2 D n_i)⌋ + 1 gt.eq frac(T, 2 D n_i) . $

After canceling $T$, (5.11) bounds the arbitrary integer $q$ by $8 D log M \/ \( delta c \)$.
  All the constants in this bound were fixed before $q$ was chosen, so this is impossible.

#proof[
  #emph[Completion of the proof of Theorem 1.] The standard upper bound gives $dim_H mu lt.eq min { 1 \,
    h \/ chi }$. If the inequality were strict, then $d = dim_H mu$ would satisfy $d < 1$ and $d chi < h$.
    Section 4 would supply the pair bands used above, and (5.11) would give a contradiction.
    Therefore $dim_H mu = min { 1 \, h \/ chi }$ for the prescribed positive vector $p$.
    Since $p$ was arbitrary, the conclusion holds for every such vector, including the cases $h = chi$ and $h > chi$. ◻
]

== 6 Overlap conventions and dimension of the attractor <sec:corollaries>

We first reconcile the two usual word-length conventions for an exact overlap.
  The following observation also appears in #cite(label("Hochman2014")) footnote 3.
  The nonzero contraction hypothesis is useful here as well as in the proof of the measure theorem.

#thm([Lemma 6.1.])[
  #emph[For a finite family of maps $x mapsto r_i x + t_i$ with $0 < \| r_i \| < 1$,
    an equality of maps for two distinct nonempty words of arbitrary lengths implies such an equality for two
    distinct words of the same length.]
] <lem:overlap-lengths>

#proof[
  Suppose $phi_u = phi_v$ and $u eq.not v$. If $u$ were a proper prefix of $v$, writing $v =
    u w$ and cancelling the invertible map $phi_u$ would give $phi_w = upright("id")$.
    This is impossible because a nonempty word has absolute contraction less than one.
    The same applies with the words interchanged. Now $phi_(u v) = phi_u compose phi_v = phi_v compose phi_u =
    phi_(v u)$. The words $u v$ and $v u$ have the same length and are distinct:
    if they were equal, their first $min { \| u \| \, \| v \| }$ symbols would show that either $u =
    v$ or the shorter word is a proper prefix of the longer. ◻
]

#thm([Corollary 6.2.])[
  (No exact overlaps).  #emph[Let $Phi$ be a finite nonempty indexed family of real similarities with $0 < \|
    r_i \| < 1$ and no exact overlaps. For every strictly positive probability vector $p$,
$ dim_H mu_(Phi \, p) = min { 1 \, H \( p \) \/ chi \( Phi \, p \) } . $

]
] <cor:no-overlaps>

#proof[
  At every length $n$, distinct words give distinct complete maps.
    Hence $G_n$ is an injective function of its symbol word, so $H \( G_n \) =
    n H \( p \)$ and $h_(upright("RW")) = H \( p \)$. Apply Theorem 1. ◻
]

Let $K_Phi$ be the compact attractor, equivalently the set of all coding limits.
  Its similarity dimension $s_(*)$ is the unique number $s_(*) gt.eq 0$ satisfying

$ sum_(i in Lambda) \| r_i \|^(s_(*)) = 1 . $

For at least two symbols, existence and uniqueness follow because this sum is continuous and strictly decreasing
  from $\| Lambda \| > 1$ to zero. For one symbol its unique solution is zero.

#thm([Corollary 6.3.])[
  #emph[For a finite nonempty family of similarities of $bb(R)$ with arbitrary real translations and $0 < \|
    r_i \| < 1$, absence of exact overlaps implies
$ dim_H K_Phi = min { 1 \, s_(*) } . $

]
] <cor:set>

#proof[
  For one map the attractor is its fixed point and $s_(*) = 0$.
    For at least two maps choose the strictly positive weights $p_i = \| r_i \|^(s_(*))$.
    Then $H \( p \) = s_(*) chi \( Phi \, p \)$. Corollary 13 gives a measure supported on $K_Phi$ of dimension
    $min { 1 \, s_(*) }$, which is a lower bound for its set dimension.
    For the upper bound, if $a > s_(*)$, the level-$n$ cylinder sets cover $K_Phi$,
    their diameters tend uniformly to zero, and
  $ sum_(u in Lambda^n) \( "diam" phi_u \( K_Phi \) \)^a = \( "diam" K_Phi \)^a (sum_i \| r_i \|^a)^n arrow.r 0 . $
  The zero-diameter case is immediate. Thus $dim_H K_Phi lt.eq s_(*)$, and the ambient upper bound is one. ◻
]

#thm([Corollary 6.4.])[
  #emph[Let $m gt.eq 2$, $0 < lambda < 1$, and $t_1 \, dots.h \, t_m in bb(R)$.
    If the maps $x mapsto lambda x + t_i$ have no exact overlaps,
    then for every strictly positive probability vector $p$ their self-similar measure has
$ dim_H mu = min {1 \, frac(H \( p \), log \( 1 \/ lambda \))} . $

]
] <cor:homogeneous>

#proof[
  Apply Corollary 13 with $r_i = lambda$ for every $i$. Since the weights sum to one, $chi = log \( 1 \/ lambda \)$. ◻
]

#thm([Corollary 6.5.])[
  (Three maps).  #emph[Let $0 < lambda < 1$ and $t in bb(R)$. If the indexed maps
$ x mapsto lambda x \, wide x mapsto lambda x + 1 \, wide x mapsto lambda x + t $

 have no exact overlaps, then for every $p_0 \, p_1 \, p_2 > 0$ with $p_0 + p_1 + p_2 = 1$,
   their self-similar measure satisfies
$ dim_H mu = min {1 \, frac(- sum_(i = 0)^2 p_i log p_i, log \( 1 \/ lambda \))} . $

]
] <cor:three-maps>

#proof[
  Apply Corollary 15 with translations $0 \, 1 \, t$. ◻
]

No claim of absolute continuity, effective separation, or a quantitative rate of convergence follows from these
  dimension statements. In particular, the finite upper endpoints of the scale ranges used in the proof have no
  asserted effective bound.

#bibliography("refs.bib", style: "ieee", title: [References])
