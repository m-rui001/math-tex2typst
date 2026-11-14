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

#align(center)[#text(size: 16pt, weight: "bold")[A doubling Hilbert subset with no finite-dimensional bi-Lipschitz embedding]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

A metric space $\( X \, d \)$ is #emph[doubling with constant at most $lambda$] if every ball in $X$ is covered by
  at most $lambda$ balls of half its radius, with centers in $X$.
  A map $f : X arrow.r bb(R)^k$ is a #emph[bi-Lipschitz embedding with distortion at most $D$] if there is a scale
  $a > 0$ such that

$ a thin d \( x \, y \) lt.eq ∥f \( x \) - f \( y \)∥ lt.eq D a thin d \( x \, y \) wide \( x \, y in X \) . $

Both the target dimension $k$ and the distortion $D$ are required to be finite.

Every subset of a finite-dimensional Euclidean space is doubling.
  Lang and Plaut asked whether every doubling subset of Hilbert space admits a bi-Lipschitz embedding into some
  finite-dimensional Euclidean space; see [12] Question 2.4, restated in [13] Question 1.
  Gupta, Krauthgamer, and Lee independently formulated the question in the context of algorithmic dimension
  reduction [8] Section 6, Question 1. The hypothesis already supplies a Hilbert-space realization,
  so the issue is whether a bound on metric covering complexity permits a reduction to finitely many Euclidean
  coordinates while preserving all distances up to a fixed factor.

Assouad’s theorem gives a positive result after changing the metric:
  every doubling metric space admits such an embedding for the distance $d^alpha$, where $0 < alpha < 1$ [1].
  This operation is called #emph[snowflaking]. Naor and Neiman proved that, when $alpha$ is close to $1$,
  the target dimension can be bounded in terms of the doubling constant alone,
  independently of $alpha$ [13] Theorem 1.2. The distortion bound still depends on the snowflake exponent.
  For finite Hilbert subsets, Gottlieb and Krauthgamer obtained embeddings of snowflakes with distortion
  arbitrarily close to one, with dimension depending on the doubling constant, exponent,
  and permitted distortion [7] Theorem 1.2. The Lang–Plaut question concerns the original distance $d$,
  even when arbitrary finite dimension and distortion are allowed.

For exponents $p > 2$, Lafforgue and Naor constructed doubling subsets of $L_p$ admitting no bi-Lipschitz
  embedding into any finite-dimensional Euclidean space [11] Theorem 1.1.
  Independently, Bartal, Gottlieb, and Neiman obtained dimension-reduction obstructions for doubling subsets of
  $ell_p$ using thin Laakso configurations [2]. Baudier, Święcicki,
  and Swift later gave an elementary proof of the corresponding fixed-set theorem for $ell_q$,
  $q > 2$ [3] Theorem 1. These results concern ambient exponents strictly greater than two and do not settle the
  Hilbert case. Schioppa announced a negative answer in [15],
  but withdrew the preprint after reporting a possible issue with its duality argument.

We give a negative answer to this question.

#thm([Theorem 1.])[
  #emph[There is a fixed subset $S$ of real $ell_2$, equipped with its induced Hilbert distance,
    whose doubling constant is at most $76800$ and which admits no bi-Lipschitz embedding into $bb(R)^k$ for any
    positive integer $k$, at any finite distortion.]
] <thm:main>

In particular, dimension and distortion bounds depending only on the doubling constant cannot hold for all
  doubling Hilbert subsets.

The same metric space has an isometric realization in $L_p \( \[ 0 \, 1 \] \; bb(R) \)$ for every $1 lt.eq
  p < oo$, by a normalized Gaussian series; Section 6 gives this consequence and its relation to earlier $L_p$
  obstructions. Section 7 constructs a compact obstruction in every infinite-dimensional real Banach space,
  including Hilbert space, with a universal doubling constant and with no bi-Lipschitz embedding into any
  finite-dimensional real normed space.

=== 1.1 The construction and proof strategy <the-construction-and-proof-strategy>

The proof couples a covering argument with a derivative obstruction.
  Differentiation has a substantial history as a method for ruling out Euclidean embeddings:
  Cheeger’s framework gives such obstructions under doubling-measure and Poincaré-inequality hypotheses [5]
  Section 14, Theorem 14.3. Laakso’s nonembedding argument gives a related separation-versus-stretch principle:
  separated branches force an increase in stretch along a subsegment [10] Section 4, Theorem 4.1.
  Here the analytic step uses ordinary Euclidean differentiation of Lipschitz maps on open subsets of $bb(R)^2$
  and a quadratic variance identity. A lexicographic extremum treats the two derivative columns successively,
  and crossings turn their small variation into a packing obstruction. We describe the geometry first.

===== 1.1.1 Sparse scales and common sheets. <sparse-scales-and-common-sheets.>

At each scale $r_j = 1000^(- j)$, we color horizontal strips of width $r_j$ and vertical strips of width $W_j
  r_j$ periodically with $N_j$ colors. Here $N_j \, W_j$ are positive integers,
  fixed in advance so that every pair occurs infinitely often.
  Choose unit vectors $e_(j \, i)$, one for each level and color,
  mutually orthogonal and orthogonal to the base plane. For a base point $p in bb(R)^2$,
  color $i$ permits a displacement $r_j e_(j \, i)$ whenever $p$ is in a horizontal or a vertical strip of that
  color. Points of $S$ carry finitely many such displacements.
  Section 2 defines this set and proves the doubling bound:
  at any observation radius, the coarser coordinates are fixed, the finer coordinates have a small total diameter,
  and at most one intermediate level contributes labels to the cover.

Now suppose that an embedding $f$ exists, normalized to have lower Lipschitz constant one and upper constant $D$.
  Fixing a finite-support tuple of displacement coordinates and varying $p$ gives a map from an open part of the
  base plane to $bb(R)^k$; we call this map a #emph[sheet].
  If $F$ is one sheet and $F_i$ is obtained by adding a color-$i$ displacement at an unused level of size $r$, then

$ ∥F_i \( p \) - F \( p \)∥ lt.eq D r $

wherever the added displacement is permitted. The horizontal and vertical restrictions belong to the same map
  $F_i$. Our objective is to find one horizontal line and one vertical line of each color along which the relative
  offset $\( F_i - F \) \/ r$ is nearly constant.

===== 1.1.2 Two derivative extrema and two different error bounds. <two-derivative-extrema-and-two-different-error-bounds.>

The derivative of each sheet has horizontal and vertical columns.
  Section 3 takes the closure of all pairs of their squared norms, chooses the largest first coordinate $A$,
  and then chooses the largest second coordinate $B$ among pairs whose first coordinate is $A$.
  Near this extremal pair, a mean derivative close to a reference vector forces small mean-square variation.
  This elementary rigidity is the analytic input.

Fix the embedding parameters $k \, D$, and then fix a color count $N$ larger than the number of points with
  pairwise distances greater than one that can fit in a radius-$D$ ball of $bb(R)^k$.
  For each positive integer $n$, use a recurring level with $\( N_j \, W_j \) = \( N \, n \)$ inside a
  sufficiently small region of a nearly extremal sheet. Writing $r$ for its displacement scale,
  one period block contains one row and one column of each color and has width $N n r$ and height $N r$.
  In Section 4, the first extremum gives horizontal derivative error whose mean square, multiplied by $n^2$,
  tends to zero. This factor compensates for the longer horizontal lines.
  The wide vertical strips first force the mean squared horizontal derivative norm of the vertically selected
  sheets toward $A$. The second extremum then gives vertical mean-square error tending to zero,
  with no growing factor required. Compactness suffices for this latter estimate;
  no quantitative modulus of the second extremum is needed.

===== 1.1.3 Crossings turn small variation into a contradiction. <crossings-turn-small-variation-into-a-contradiction.>

Section 5 selects one period block and a line of every color in each direction with the required small errors.
  Absolute continuity turns the derivative estimates into nearly constant relative offsets on those lines.
  At the crossing of a color-$i$ row and a color-$m$ column with $i eq.not m$, both displacements are permitted,
  and the corresponding source points are separated by $sqrt(2) thin r$.
  Transport to the selected same-color intersections therefore produces $N$ separated vectors in a radius-$D$ ball
  of $bb(R)^k$. Euclidean volume comparison contradicts the choice of $N$.
  The fixed set is used throughout; only the sheets, local rectangles, and recurring level vary with $n$.

=== 1.2 Conventions <conventions>

Write $bb(N) = { 1 \, 2 \, dots.h }$. In the proof of Theorem 1, all norms are Euclidean or Hilbert norms.
  For a Lipschitz map $F$ on an open subset of $bb(R)^2$, write $F_x \, F_y$ for its derivative columns,
  defined almost everywhere. For an integrable function $h$ on a set $E$ of positive finite area, write

$ chevron.l h chevron.r_E = frac(1, \| E \|) integral_E h . $

The notation $chevron.l h chevron.r$ omits $E$ when the averaging domain has been specified.

== 2 The subset and its doubling bound <sec:construction>

We first construct the set independently of any target map.
  The rapid separation of the displacement scales will give a uniform covering bound even though the number of
  colors is unbounded.

Fix, once and for all, a sequence $\( N_j \, W_j \)_(j gt.eq 1)$ of pairs in $bb(N)^2$ in which every pair occurs
  infinitely often. For example, concatenate the finite lists ${ 1 \, dots.h \, m }^2$ for $m = 1 \, 2 \, dots.h$.
  Put $r_j = 1000^(- j)$ and let

$ cal(H) = bb(R)^2 xor xor.big_(j gt.eq 1) bb(R)^(N_j) $

be the Hilbert direct sum. This is isometric to real $ell_2$.
  Let $e_(j \, i)$, $1 lt.eq i lt.eq N_j$, denote the coordinate vectors in its $j$th summand.

At level $j$, color the horizontal strips

$ { \( x \, y \) : q r_j < y < \( q + 1 \) r_j } \, wide q in bb(Z) \, $

by the residue $i in { 1 \, dots.h \, N_j }$ determined by $q equiv i - 1 med \( mod med N_j \)$.
  Give the vertical strips

$ { \( x \, y \) : q W_j r_j < x < \( q + 1 \) W_j r_j } $

the same periodic coloring. Denote their unions of color $i$ by $H_(j \, i)$ and $V_(j \, i)$, respectively, and put

$ U_(j \, i) = H_(j \, i) union V_(j \, i) . $

In particular, $U_(j \, i)$ is open.

Define $S subset cal(H)$ to consist of the points

#[#set math.equation(numbering: n => "(1)")
 $ \( p \, w \) \, wide p in bb(R)^2 \, quad w = \( w_j \)_(j gt.eq 1) \, $ <eq:set>]

where $w$ has finite support and, independently at each level,

$ w_j = 0 quad upright("or") quad w_j = r_j e_(j \, i) upright(" for some ") i upright(" with ") p in U_(j \, i) . $

The zero choice is always allowed, including on strip boundaries.
  Neither $S$ nor its defining parameters will subsequently depend on a proposed embedding.

#thm([Proposition 2.])[
  #emph[The doubling constant of $S$ is at most $300 dot.op 16^2 = 76800$.]
] <prop:doubling>

#proof[
  Fix a ball of radius $t > 0$ centered at a point of $S$. Distinct choices of $w_j$ have distance at least $r_j$.
    Thus at every level with $r_j > t$, all points of the ball have the same coordinate as its center.
  There is at most one intermediate level satisfying $t \/ 64 < r_j lt.eq t$,
    since consecutive radii have ratio $1000$. The projection of the ball onto each base coordinate lies in an
    interval of length $2 t$. Such an interval meets at most $floor.l 2 t \/ r_j floor.r + 2 lt.eq
    129$ strips of width $r_j$, and the same upper bound applies to strips of width $W_j r_j gt.eq r_j$.
    Consequently, at the intermediate level there are fewer than $300$ available labels, including zero.
  For any two points of the ball, the fine-coordinate distance is bounded by
  #[#set math.equation(numbering: n => "(2)")
   $ sum_(r_j lt.eq t \/ 64) ∥w_j - w'_j∥^2 lt.eq 2 sum_(r_j lt.eq t \/ 64) r_j^2 lt.eq
     frac(2, 1 - 10^(- 6)) (t / 64)^2 < (t / 32)^2 . $ <eq:tail>]
  Partition a base square of side $2 t$ containing the projection into $16^2$ cells of side $t \/ 8$,
    assigning their boundaries arbitrarily. Group the ball’s points according to their cell and their intermediate
    coordinate, if one exists. In a group, the coarse and intermediate coordinates agree,
    the base diameter is at most $sqrt(2) thin t \/ 8$, and (2) bounds the fine coordinates.
    Each group therefore has diameter less than
  $ t sqrt(2 / 64 + 1 / 1024) = sqrt(33) / 32 t < t / 2 . $
  Choosing one point from each nonempty group as a center gives the required cover by balls in $S$. ◻
]

== 3 Sheets and extremal derivatives <sec:extrema>

We now assume an embedding exists and extract one compact set of derivative data from all its sheets.
  Maximizing the two coordinates in order will constrain variation in the two directions separately.

Since $S$ contains the base plane with all displacement coordinates zero, it cannot embed into $bb(R)^0$.
  Suppose, for a contradiction, that for some finite $k gt.eq 1$ and $D gt.eq 1$ there is a map $f : S arrow.r
  bb(R)^k$ satisfying

#[#set math.equation(numbering: n => "(3)")
 $ ∥z - z'∥ lt.eq ∥f \( z \) - f \( z' \)∥ lt.eq D ∥z - z'∥ wide \( z \, z' in S \) . $ <eq:bilip>]

For a fixed finite-support tuple $w$ of coordinate choices, let

$ Omega_w = { p : \( p \, w \) in S } . $

If $w_j = r_j e_(j \, i_j)$ at its nonzero levels, then

$ Omega_w = ⋂_(j : w_j eq.not 0) U_(j \, i_j) . $

This is a finite intersection of open sets; the empty intersection for the zero tuple is $bb(R)^2$.
  Whenever the domain is nonempty, the map

$ F_w : Omega_w arrow.r bb(R)^k \, wide F_w \( p \) = f \( p \, w \) \, $

is called a #emph[sheet]. It is $D$-Lipschitz, since the corresponding source points differ only in their base
  coordinates. This holds even when its domain is disconnected.

Rademacher’s theorem gives differentiability almost everywhere on each sheet domain [9] Theorem 3.1.
  Its derivative columns have norm at most $D$. By Lebesgue differentiation,
  almost every point $p$ is also a Lebesgue point of these columns; see [16] Theorem 32 and Exercise 33.
  At such a point, with $u = F_x \( p \)$ and $v = F_y \( p \)$, the mean-square error satisfies

#[#set math.equation(numbering: n => "(4)")
 $ lim_(l arrow.b 0) ⟨∥F_x - u∥^2 + ∥F_y - v∥^2⟩_(Q \( p \, l \)) = 0 \, $ <eq:good>]

where $Q \( p \, l \)$ is the centered square of side $l$.
  Indeed, boundedness upgrades the Lebesgue mean-norm conclusion to mean-square convergence,
  and squares may replace balls by area comparison. Call these differentiability and Lebesgue points #emph[good];
  they form a set of full measure in each sheet domain.

Let $K$ be the closure in $\[ 0 \, D^2 \]^2$ of all pairs

$ \( ∥F_x \( p \)∥^2 \, ∥F_y \( p \)∥^2 \) $

from all sheets and their good points. It is nonempty and compact. Define

#[#set math.equation(numbering: n => "(5)")
 $ A = max { s : \( s \, t \) in K } \, wide B = max { t : \( A \, t \) in K } . $ <eq:AB>]

Thus $\( A \, B \) in K$. This single compact set and these two numbers remain fixed throughout the argument.
  The next lemma explains the benefit of maximizing the coordinates in this order:
  if the mean deficit from $A$ tends to zero, then the mean second coordinate cannot exceed $B$ in the limit.

#thm([Lemma 3.])[
  (Near the lexicographic maximum).  #emph[Let $D > 0$, let $K
    subset.eq \[ 0 \, D^2 \]^2$ be nonempty and compact, and define $A = max { s : \( s \, t \) in K }$ and $B =
    max { t : \( A \, t \) in K }$. For every $epsilon > 0$ there is $delta > 0$ such that
$ \( s \, t \) in K \, quad s > A - delta quad arrow.r.double quad t lt.eq B + epsilon . $

 Consequently, if measurable pairs $\( s_n \, t_n \)$ take values in $K$ on probability spaces and
   $bb(E) \( A - s_n \) arrow.r 0$, then $limsup_n bb(E) t_n lt.eq B$.]
] <lem:compact>

#proof[
  Failure of the first assertion would give a sequence in $K$ with first coordinate tending to $A$ and second
    coordinate greater than $B + epsilon$. A convergent subsequence would contradict the definition of $B$.
    For the second assertion, Markov’s inequality gives
  $ bb(P) { A - s_n gt.eq delta } lt.eq frac(bb(E) \( A - s_n \), delta) \, wide bb(E) t_n lt.eq B + epsilon +
    D^2 frac(bb(E) \( A - s_n \), delta) . $
  First let $n arrow.r oo$, and then $epsilon arrow.b 0$. ◻
]

The lemma supplies an upper bound on a mean squared norm.
  To turn that bound into small variation around a reference vector,
  we will also control the mean vector and use the elementary identity

#[#set math.equation(numbering: n => "(6)")
 $ ⟨∥G - a∥^2⟩ = ⟨∥G∥^2⟩ - ∥∥ a^2 - 2 chevron.l a \, chevron.l G chevron.r - a chevron.r . $ <eq:variance>]

We also use integration along line segments. A Lipschitz map on an interval is absolutely continuous,
  and its increments equal integrals of its derivative, componentwise [9] Theorem 3.3.
  By Fubini, on almost every horizontal or vertical segment in an open sheet domain,
  these line derivatives agree almost everywhere with the corresponding partial derivatives.
  At excluded endpoints we take the unique one-sided limits of the Lipschitz restriction.
  Bounds for the map persist in those limits.

== 4 Near-extremal rectangles and two energy estimates <sec:energy>

The output of this section is small variation of the added-sheet offsets:
  a horizontal estimate strong enough for increasingly long rows,
  and a vertical estimate for columns of fixed normalized height.
  The compact set $K$ and the embedding are already fixed.

Fix an integer

#[#set math.equation(numbering: n => "(7)")
 $ N > \( 1 + 2 D \)^k . $ <eq:N>]

For each positive integer $n$, choose a sheet $F$ and a good point with derivative columns $u \, v$ such that

#[#set math.equation(numbering: n => "(8)")
 $ 0 lt.eq A - ∥∥ u^2 < n^(- 4) \, wide \| B - ∥∥ v^2 \| < n^(- 4) . $ <eq:nearmax>]

This is possible since $\( A \, B \) in K$ is in the closure of actual good-point pairs.
  Choose a square $Q^0$ of side $l$, centered at that point, with closure in the sheet domain and

#[#set math.equation(numbering: n => "(9)")
 $ ⟨∥F_x - u∥^2 + ∥F_y - v∥^2⟩_(Q^0) < n^(- 8) . $ <eq:baseerror>]

The sheet, the vectors, and $l$ may all depend on $n$.

Choose a level $j$ beyond the finite support of this sheet such that

#[#set math.equation(numbering: n => "(10)")
 $ \( N_j \, W_j \) = \( N \, n \) \, wide N n r_j < frac(l n^(- 8), 100) . $ <eq:fine>]

Infinite recurrence of each pair permits this choice. Set $r = r_j$.
  The level-$j$ period blocks have width $N n r$ and height $N r$,
  with corners at $\( a N n r \, b N r \)$ for integers $a \, b$.
  Take inside $Q^0$ a rectangle $Q$ tiled, up to boundary lines, by complete period blocks.
  Each coordinate interval loses at most two periods by trimming to the grid, so its side lengths $L_x \,
  L_y$ satisfy $L_x \, L_y gt.eq l \/ 2$. In particular,

#[#set math.equation(numbering: n => "(11)")
 $ ⟨∥F_x - u∥^2 + ∥F_y - v∥^2⟩_Q & < 4 n^(- 8) \,\
r / L_x \, r / L_y & < frac(n^(- 9), 50 N) . $ <eq:Qerror>]

For each $1 lt.eq i lt.eq N$, let $F_i$ be the sheet obtained from $F$ by adding $r e_(j \, i)$ at level $j$.
  Writing $w$ for the tuple of $F$, this is a valid finite-support tuple with domain exactly $Omega_w ∩
  U_(j \, i)$. In particular, the same map $F_i$ is defined on the portions of both $H_(j \, i)$ and $V_(j \, i)$
  in $Q$. By (3),

#[#set math.equation(numbering: n => "(12)")
 $ ∥F_i - F∥ lt.eq D r quad upright("on ") Q ∩ \( H_(j \, i) union V_(j \, i) \) . $ <eq:offset>]

Off the grid boundaries, define $G_H^x$ by selecting $\( F_i \)_x$ according to the horizontal strip color $i$.
  Define $G_V^x \, G_V^y$ by selecting $\( F_i \)_x \, \( F_i \)_y$ according to the vertical strip color.
  Almost everywhere on $Q$,

#[#set math.equation(numbering: n => "(13)")
 $ ∥G_H^x∥^2 lt.eq A \, wide \( ∥G_V^x∥^2 \, ∥G_V^y∥^2 \) in K . $ <eq:Kbounds>]

Indeed, the good points have full measure for each of the finitely many sheets in use.
  The map $f$, its target parameters $k \, D$, the set $K$, and the numbers $A \, B \, N$ remain fixed throughout.

#thm([Proposition 4.])[
  (Anisotropic energy estimates).  #emph[For each $n in bb(N)$, let $F \, F_i \, Q \, u \, v \,
    r$ and the selected derivative fields be chosen as above, satisfying (8)–(11). Then, as $n arrow.r oo$,
#[#set math.equation(numbering: n => "(14)")
 $ n^2 ⟨∥G_H^x - F_x∥^2⟩_Q & arrow.r 0 \,\
⟨∥G_V^y - F_y∥^2⟩_Q & arrow.r 0 . $ <eq:horizontal>]

]
] <prop:energy>

The factor $n^2$ compensates for horizontal segments of length $N n r$; the vertical segments have length $N r$.

#proof[
  All averages in this proof are over $Q$.
  ===== 4.1 Horizontal selection. <horizontal-selection.>
  On an interior horizontal strip of color $i$, the sheet $F_i$ spans the full width of $Q$.
    Integrating $\( F_i - F \)_x$ along a horizontal segment and using (12) gives an endpoint difference of norm
    at most $2 D r$. Averaging in $y$, and applying Cauchy–Schwarz to (11), yields
  #[#set math.equation(numbering: n => "(15)")
   $ ∥chevron.l G_H^x chevron.r - u∥ lt.eq frac(2 D r, L_x) + 2 n^(- 4) . $ <eq:Hmean>]
  Equations (6), (8), and (13) therefore imply
  $ ⟨∥G_H^x - u∥^2⟩ & lt.eq A - ∥∥ u^2 + 2 ∥∥ u ∥chevron.l G_H^x chevron.r - u∥\
 & lt.eq \( 1 + 4 D \) n^(- 4) + 4 D^2 r \/ L_x . $
  Using (11) and (11) gives the explicit estimate
  #[#set math.equation(numbering: n => "(16)")
   $ n^2 ⟨∥G_H^x - F_x∥^2⟩ lt.eq 2 \( 1 + 4 D \) n^(- 2) + frac(4 D^2, 25 N) n^(- 7) + 8 n^(- 6) \, $ <eq:Hrate>]
  which proves (14).
  For the vertical selection, we first average the horizontal derivative over strips of width $n r$.
    Dividing the same endpoint error $2 D r$ by this wider strip width makes the selected horizontal mean approach
    $u$. The selected derivative has squared norm at most $A$ almost everywhere,
    so its mean squared norm must then approach $A$. Lemma 3 will control the mean vertical squared norm without
    requiring a rate.
  ===== 4.2 Vertical selection: the first derivative column. <vertical-selection-the-first-derivative-column.>
  Integrate in $x$ separately over the full vertical strips of width $n r$.
    Within each strip the endpoint error for $F_i - F$ is at most $2 D r$. Thus
  #[#set math.equation(numbering: n => "(17)")
   $ ∥chevron.l G_V^x chevron.r - u∥ lt.eq frac(2 D, n) + 2 n^(- 4) . $ <eq:Vxmean>]
  The estimate sums the separate strip integrals and therefore allows jumps in the selection at strip boundaries.
  Put $eta_n = chevron.l A - ∥G_V^x∥^2 chevron.r$. By (13), it is nonnegative.
    The identity (6), with its nonnegative left side discarded, gives
  #[#set math.equation(numbering: n => "(18)")
   $ 0 lt.eq eta_n & lt.eq A - ∥∥ u^2 + 2 ∥∥ u ∥chevron.l G_V^x chevron.r - u∥\
 & lt.eq \( 1 + 4 D \) n^(- 4) + frac(4 D^2, n) arrow.r 0 . $ <eq:eta>]
  Apply Lemma 3 to the pairs in (13), with normalized area measure on $Q$. We obtain
  #[#set math.equation(numbering: n => "(19)")
   $ limsup_(n arrow.r oo) ⟨∥G_V^y∥^2⟩ lt.eq B . $ <eq:Vynorm>]
  ===== 4.3 Vertical selection: the second derivative column. <vertical-selection-the-second-derivative-column.>
  Each interior vertical strip spans the full height of $Q$. Integration in $y$, followed by (11), gives
  #[#set math.equation(numbering: n => "(20)")
   $ ∥chevron.l G_V^y chevron.r - v∥ lt.eq frac(2 D r, L_y) + 2 n^(- 4) arrow.r 0 . $ <eq:Vymean>]
  Since $∥∥ v lt.eq D$ and $∥∥ v^2 arrow.r B$, Equations (6), (19), and (20) imply
  $ 0 lt.eq ⟨∥G_V^y - v∥^2⟩ lt.eq ⟨∥G_V^y∥^2⟩ - ∥∥ v^2 + 2 D ∥chevron.l G_V^y chevron.r - v∥ . $
  The upper bound has limsup at most zero, so the nonnegative variance tends to zero.
    In particular, convergence of the vectors $v$ themselves is unnecessary. Combining this with (11) proves (14). ◻
]

== 5 Crossings force a packing contradiction <sec:crossings>

We use the two energy estimates to find one line of every color in each direction on a common period block.
  Their intersections will supply the separated vectors needed for the Euclidean packing bound.

Choose a complete period block $P subset Q$ on which the mean of the nonnegative combined energy

$ n^2 ∥G_H^x - F_x∥^2 + ∥G_V^y - F_y∥^2 $

is no greater than its mean on $Q$. Denote its mean on $P$ by $epsilon_n$.
  Proposition 4 gives $epsilon_n arrow.r 0$. The block has width $N n r$ and height $N r$,
  and contains exactly one row and one column of each color.

For every color $i$, its row has area $\| P \| \/ N$. Fubini therefore permits a horizontal segment $y =
  y_i$ in its interior, spanning $P$, such that

#[#set math.equation(numbering: n => "(21)")
 $ frac(1, N n r) integral_(upright("row segment")) n^2 ∥\( F_i - F \)_x∥^2 thin d x lt.eq
   2 N epsilon_n . $ <eq:rowline>]

Similarly choose $x = x_i$ in the interior of column $i$ with

#[#set math.equation(numbering: n => "(22)")
 $ frac(1, N r) integral_(upright("column segment")) ∥\( F_i - F \)_y∥^2 thin d y lt.eq 2 N epsilon_n . $ <eq:colline>]

These lines can simultaneously be chosen from the full-measure sets where partial derivatives agree with line
  derivatives. If $epsilon_n = 0$, use lines of zero energy.
  The choices of the horizontal and vertical coordinates are independent.

Write $h_i = \( F_i - F \) \/ r$ on its domain in $P$. Absolute continuity and Cauchy–Schwarz give,
  on each chosen horizontal segment,

$ "diam" h_i \( upright("segment") \) lt.eq frac(N n r, r)
  (frac(1, N n r) integral ∥\( F_i - F \)_x∥^2 thin d x)^(1 \/ 2) lt.eq N sqrt(2 N epsilon_n) . $

The identical bound on each chosen vertical segment follows from (22), with length $N r$. Set

#[#set math.equation(numbering: n => "(23)")
 $ omega_n = N sqrt(2 N epsilon_n) arrow.r 0 \, wide z_i = h_i \( x_i \, y_i \) . $ <eq:omega>]

By (12), $∥z_i∥ lt.eq D$. Oscillation on a Lipschitz line is controlled at every point by its derivative integral,
  so no differentiability assertion is required at the crossings.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0.7), (6, 1.4), fill: rgb("#e6e6ff"), stroke: none)
  rect((3.7, 0), (5.1, 3.2), fill: rgb("#ffecd9"), stroke: none)
  rect((0, 0), (6, 3.2), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0.7), (6, 0.7), (0, 1.4), (6, 1.4), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((3.7, 0), (3.7, 3.2), (5.1, 0), (5.1, 3.2), stroke: (paint: rgb("#c6c6c6"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((1, 1.05), (4.4, 1.05), stroke: (paint: rgb("#0000b2"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000b2"))))
  line((4.4, 2.6), (4.4, 1.05), stroke: (paint: rgb("#cc6600"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#cc6600"))))
  circle((1, 1.05), radius: 0.07056, fill: black, stroke: none)
  content((1, 1.05), [#box(inset: 0.05292cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[$p_i=(x_i,y_i)$]])], anchor: "south")
  circle((4.4, 2.6), radius: 0.07056, fill: black, stroke: none)
  content((4.4, 2.6), [$p_m=(x_m,y_m)$], anchor: "south-east", padding: 0.1176cm)
  circle((4.4, 1.05), radius: 0.07056, fill: black, stroke: none)
  content((4.4, 1.05), [$c=(x_m,y_i)$], anchor: "north-east", padding: 0.1176cm)
  content((0, 1.05), [#text(fill: rgb("#0000b2"))[row $i$]], anchor: "east", padding: 0.1176cm)
  content((4.4, 3.2), [#text(fill: rgb("#cc6600"))[column $m$]], anchor: "south", padding: 0.1176cm)
  line((0, -0.5), (6, -0.5), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((3, -0.5), [$"Nnr"$], anchor: "north", padding: 0.1176cm)
  line((6.5, 0), (6.5, 3.2), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((6.5, 1.6), [$"Nr"$], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: A schematic period block, for $i eq.not m$. At $c$, both labels are allowed: $i$ by the row and $m$ by the column. Their normalized offsets are separated by at least $sqrt(2)$. Transport along the arrows changes $h_i$ and $h_m$ by at most $omega_n$ each, so $z_i = h_i \( p_i \)$ and $z_m = h_m \( p_m \)$ are separated by at least $sqrt(2) - 2 omega_n$. The block and strip proportions are schematic. ],
) <fig:crossing>

For $i eq.not m$, both added labels $r e_(j \, i)$ and $r e_(j \, m)$ are permitted at $\( x_m \, y_i \)$:
  the first by row $i$, the second by column $m$. The corresponding source points have distance exactly $sqrt(2)
  thin r$, so (3) gives

$ ∥h_i \( x_m \, y_i \) - h_m \( x_m \, y_i \)∥ gt.eq sqrt(2) . $

Transporting along row $i$ and column $m$, as in Figure 1, yields

$ ∥z_i - z_m∥ gt.eq sqrt(2) - 2 omega_n > 1 $

for all pairs when $n$ is sufficiently large. This is simultaneous because $N$ is fixed.

We have obtained $N$ points in the radius-$D$ ball of $bb(R)^k$ with pairwise distances greater than one.
  Their open radius-$1 \/ 2$ balls are disjoint and contained in the radius-$\( D + 1 \/ 2 \)$ ball.
  Comparing Euclidean volumes gives

$ N \( 1 \/ 2 \)^k lt.eq \( D + 1 \/ 2 \)^k \, wide N lt.eq \( 1 + 2 D \)^k \, $

contrary to (7). No map satisfying (3) exists. Together with Proposition 2, this proves Theorem 1.0◻

== 6 A consequence for finite-$p$ function spaces <sec:lp>

A normalized Gaussian series gives isometric realizations of the same fixed metric space in real
  $L_p \[ 0 \, 1 \]$ for every finite $p gt.eq 1$.

#thm([Corollary 5.])[
  (Finite-$p$ function-space obstruction).  #emph[For every real $1 lt.eq p < oo$,
    the fixed metric space $S$ of Theorem 1 is isometric to a subset $S_p$ of $L_p \( \[ 0 \, 1 \] \; bb(R) \)$,
    where $\[ 0 \, 1 \]$ carries Lebesgue measure. With its induced $L_p$ metric,
    $S_p$ has doubling constant at most $76800$ and admits no bi-Lipschitz embedding into any finite-dimensional
    real normed space at any finite distortion.]
] <cor:lp>

#proof[
  Fix $p$ and choose independent standard real Gaussian random variables $\( g_i \)_(i gt.eq 1)$ on Lebesgue
    $\[ 0 \, 1 \]$. Put $c_p = \( bb(E) \| g_1 \|^p \)^(1 \/ p) in \( 0 \, oo \)$.
    For every finitely supported real sequence $a$, the sum $sum_i a_i
    g_i$ is centered Gaussian with variance $sum_i a_i^2$, and hence
  $ ∥sum_i a_i g_i∥_(L_p) = c_p (sum_i a_i^2)^(1 \/ 2) . $
  For $x in ell_2$, the same identity for tails makes the partial sums Cauchy in $L_p$.
    Completeness, including at $p = 1$, therefore defines
  $ J_p x = c_p^(- 1) lim_(m arrow.r oo) sum_(i = 1)^m x_i g_i quad upright("in ") L_p \( \[ 0 \, 1 \] \; bb(R) \) . $
  Passing to limits proves that $J_p$ is linear and that $∥J_p x - J_p y∥_(L_p) = ∥x - y∥_2$.
    Thus $S_p = J_p \( S \)$ is isometric to $S$, so its doubling constant is unchanged.
  A zero-dimensional target cannot contain an injective copy of $S_p$.
    If $f : S_p arrow.r Y$ were a bi-Lipschitz embedding into a real normed space of finite positive dimension
    $k$, choose a linear isomorphism $T : Y arrow.r bb(R)^k$.
    Equivalence of finite-dimensional norms makes $T$ bi-Lipschitz with finite distortion.
    The composition $T compose f compose J_p \|_S$ would then contradict Theorem 1. ◻
]

Lafforgue and Naor proved the qualitative fixed-set obstruction with Euclidean targets for $p > 2$ and,
  in the paragraph following their Theorem 1.1, recorded the corresponding question for $1 < p lt.eq
  2$ as open at that time, while noting stronger known results for $p =
  1$ [11] Theorem 1.1 and the following paragraph. Theorem 1 treats $p = 2$,
  and Corollary 5 answers that qualitative fixed-set question with finite-dimensional Euclidean targets when $1 <
  p < 2$. This transfer adds no new metric construction. Corollary 5 concerns function-space sources
  $L_p \[ 0 \, 1 \]$, not coordinate $ell_p$ sources; the compact result below is a separate transfer to arbitrary
  infinite-dimensional Banach sources.

Finite-set dimension reduction in $L_p$, for $1 < p < oo$ and $p eq.not 2$,
  allows the target dimension to depend on cardinality [14] Theorem 1.1,
  unlike the fixed infinite-set obstruction of Corollary 5.

== 7 Compact obstructions in infinite-dimensional Banach spaces <sec:banach>

Finite witnesses to Theorem 1 can be placed in any infinite-dimensional real Banach space by the classical
  Dvoretzky theorem. A geometrically shrinking union of these finite clusters, with its limit point adjoined,
  is compact and retains a uniform doubling bound.

#thm([Corollary 6.])[
  (Compact Banach-space obstruction).  #emph[There is a universal constant $Lambda$ such that every
    infinite-dimensional real Banach space $B$ contains a compact subset $K_B$ whose doubling constant is at most
    $Lambda$ and which admits no bi-Lipschitz embedding into any finite-dimensional real normed space at any
    finite distortion. The subset $K_B$ may depend on $B$, but is chosen independently of the target dimension and
    distortion.]
] <cor:banach>

#proof[
  Write $d_S$ for the induced Hilbert distance on $S$ and put $lambda = 76800$.
    We use closed balls below; the same estimates work for open balls.
  ===== 7.1 Finite witnesses. <finite-witnesses.>
  For every $k in bb(N)$ and every finite $A gt.eq 1$, there is a finite subset of $S$ admitting no embedding into
    $bb(R)^k$ with distortion at most $A$. Indeed, suppose every finite subset admitted such an embedding,
    and fix $o in S$. For each $x in S$, let
  $ Q_x = { u in bb(R)^k : ∥∥ u lt.eq A d_S \( o \, x \) } . $
  The product $product_(x in S) Q_x$ is compact. In this product, each constraint
  $ d_S \( x \, y \) lt.eq ∥f \( x \) - f \( y \)∥ lt.eq A d_S \( x \, y \) $
  defines a closed set. These closed sets have the finite-intersection property:
    finitely many constraints involve finitely many points, and an embedding of those points together with $o$,
    translated to send $o$ to zero and divided by its lower scale,
    satisfies the constraints and lies in the corresponding $Q_x$. Set all other coordinates to zero.
    Product compactness then supplies a map satisfying every constraint, contrary to Theorem 1.
  Choose, for each $j in bb(N)$, a finite $X_j subset S$ that admits no embedding into $bb(R)^j$ with distortion
    at most $j$. Each $X_j$ has at least two points. These choices are made before any target for $K_B$ is considered.
  ===== 7.2 Placement and cluster doubling. <placement-and-cluster-doubling.>
  Fix an infinite-dimensional real Banach space $B$. The classical finite-dimensional Dvoretzky theorem [6]
    Section 7, in the formulation recalled in [4] Theorem 1.1,
    gives a linear embedding $T_j$ of the finite Hilbert span of $X_j$ into $B$ with distortion strictly below
    two; the one-dimensional case is immediate. After rescaling $T_j$, we may use
  $ d_S \( x \, y \) lt.eq ∥T_j x - T_j y∥_B lt.eq 2 d_S \( x \, y \) wide \( x \, y in X_j \) . $
  Only this qualitative finite-dimensional form of Dvoretzky is used.
  Each $Y_j = T_j \( X_j \)$ has doubling constant at most $lambda_0 = lambda^4$, uniformly in $j$ and $B$.
    To see this, the preimage $E$ of a ball in $Y_j$ of radius $R$ centered at $T_j
    x$ lies in the $S$-ball of radius $R$ centered at $x$. Four halvings cover that $S$-ball by at most $lambda^4$
    $S$-balls of radius $R \/ 16$. For each one meeting $E$, choose $x_0 in E$ in it.
    Every other $x' in E$ in the same ball satisfies
  $ ∥T_j x' - T_j x_0∥_B lt.eq 2 d_S \( x' \, x_0 \) lt.eq 2 (R / 16 + R / 16) = R / 4 lt.eq R / 2 . $
  Thus the chosen points $T_j x_0$ give the required cover with centers in $Y_j$.
  ===== 7.3 Compact assembly and its covering bound. <compact-assembly-and-its-covering-bound.>
  Fix a unit vector $v in B$, and put $a_j = 2^(- j)$ and $eta = 1 \/ 100$.
    Since $Y_j$ is finite, a translation and positive rescaling place it as a cluster
  $ C_j subset B_B \( a_j v \, eta a_j \) . $
  This placement has distortion strictly below two as a map from $X_j$, and $C_j$ is still $lambda_0$-doubling. Set
  $ K_B = { 0 } union union.big_(j gt.eq 1) C_j . $
  For $z in C_j$, one has $∥∥ z_B lt.eq \( 1 + eta \) a_j$.
    Every sequence in $K_B$ therefore has either a constant subsequence among $0$ and finitely many clusters,
    or a subsequence whose cluster indices tend to infinity and which converges to $0$. Hence $K_B$ is compact.
  Fix $x in K_B$ and $r > 0$. Every cluster with $a_j lt.eq r \/ 4$, together with $0$,
    is covered by the single $K_B$-ball $B_(K_B) \( 0 \, r \/ 2 \)$, since
  $ ∥∥ z_B lt.eq \( 1 + eta \) a_j lt.eq 101 / 400 r < r / 2 wide \( z in C_j \, med a_j lt.eq r \/ 4 \) . $
  The center $0$ need not belong to the ball being covered. Let
  $ I = { j : C_j ∩ B_(K_B) \( x \, r \) eq.not diameter \, med a_j > r \/ 4 } . $
  This is finite. If $i < j$, $p in C_i$, and $q in C_j$, then $a_j lt.eq a_i \/ 2$ and
  $ ∥p - q∥_B gt.eq \( a_i - a_j \) - eta \( a_i + a_j \) gt.eq (1 / 2 - frac(3 eta, 2)) a_i = 97 / 200 a_i . $
  If $\| I \| gt.eq 2$, take its least index $i$ and any other $j in I$.
    Points from the two intersections with $B_(K_B) \( x \, r \)$ are at distance at most $2 r$, so $a_i lt.eq
    400 r \/ 97$. All scales indexed by $I$ then lie in $\( r \/ 4 \, \( 400 \/ 97 \) r \]$.
    Their largest-to-smallest ratio is strictly less than $1600 \/ 97 < 32$,
    so there are at most five such dyadic scales. If $\| I \| = 1$, its one scale can be arbitrarily large,
    but no bound on that scale is needed.
  For each $j in I$, choose $y_j in C_j ∩ B_(K_B) \( x \, r \)$.
    The intersection is contained in the intrinsic $C_j$-ball $B_(C_j) \( y_j \, 2 r \)$,
    which two applications of cluster doubling cover by at most $lambda_0^2$ $C_j$-balls of radius $r \/ 2$.
    The $K_B$-balls with these same centers and radii also cover the intersection.
    There are at most five clusters to cover, including the single-cluster case,
    so the tail ball and these covers use at most
  $ 1 + 5 lambda_0^2 lt.eq 1 + 6 lambda^8 $
  balls, all centered in $K_B$. This proves a universal doubling bound; one may take $Lambda = 1 + 6 lambda^8$.
  ===== 7.4 Obstruction for every finite-dimensional target. <obstruction-for-every-finite-dimensional-target.>
  Suppose $K_B$ admitted a finite-distortion bi-Lipschitz embedding into a finite-dimensional real normed space.
    The zero-dimensional case is impossible because $K_B$ has more than one point.
    Otherwise, choose a linear isomorphism from the target onto $bb(R)^k$.
    Equivalence of finite-dimensional norms makes this isomorphism bi-Lipschitz,
    so composition gives an embedding $f : K_B arrow.r bb(R)^k$ with some finite distortion $D$.
    Choose an integer $j gt.eq k$ with $j gt.eq 2 D$. Composing the distortion-below-two placement of $X_j$ onto
    $C_j$, the restriction of $f$, and the isometric inclusion $bb(R)^k arrow.r.hook
    bb(R)^j$ gives an embedding of $X_j$ into $bb(R)^j$ with distortion strictly below $2 D lt.eq j$.
    This contradicts the choice of $X_j$. ◻
]

#heading(level: 1)[References]
#bibitem([1])[P. Assouad, #emph[Plongements lipschitziens dans $bb(R)^n$],
  Bulletin de la Société Mathématique de France #strong[111] (1983), 429--448.
  #link("https://doi.org/10.24033/bsmf.1997")[doi:10.24033/bsmf.1997].]
#bibitem([2])[Y. Bartal, L.-A. Gottlieb, and O. Neiman, #emph[On the impossibility of dimension reduction for
  doubling subsets of $ell_p$], SIAM Journal on Discrete Mathematics #strong[29] (2015), 1207--1222.
  #link("https://doi.org/10.1137/140977655")[doi:10.1137/140977655].]
#bibitem([3])[F. P. Baudier, K. Święcicki, and A. Swift, #emph[No dimension reduction for doubling subsets of
  $ell_q$ when $q > 2$ revisited], Journal of Mathematical Analysis and Applications #strong[504] (2021),
  no.~2, 125407. #link("https://doi.org/10.1016/j.jmaa.2021.125407")[doi:10.1016/j.jmaa.2021.125407].]
#bibitem([4])[F. Catrina, S. Ostrovska, and M. I. Ostrovskii,
  #emph[Dvoretzky-type theorem for locally finite subsets of a Hilbert space],
  Annales de l'Institut Fourier #strong[75] (2025), no.~6, 2565--2607.
  #link("https://doi.org/10.5802/aif.3672")[doi:10.5802/aif.3672].]
#bibitem([5])[J. Cheeger, #emph[Differentiability of Lipschitz functions on metric measure spaces],
  Geometric and Functional Analysis #strong[9] (1999), no.~3, 428--517.
  #link("https://doi.org/10.1007/s000390050094")[doi:10.1007/s000390050094].]
#bibitem([6])[A. Dvoretzky, #emph[Some results on convex bodies and Banach spaces],
  in Proceedings of the International Symposium on Linear Spaces (Jerusalem, 1960), Jerusalem Academic Press,
  Jerusalem; Pergamon Press, Oxford, 1961, 123--160.]
#bibitem([7])[L.-A. Gottlieb and R. Krauthgamer, #emph[A nonlinear approach to dimension reduction],
  Discrete & Computational Geometry #strong[54] (2015), no.~2, 291--315.
  #link("https://doi.org/10.1007/s00454-015-9707-9")[doi:10.1007/s00454-015-9707-9].]
#bibitem([8])[A. Gupta, R. Krauthgamer, and J. R. Lee, #emph[Bounded geometries, fractals,
  and low-distortion embeddings], Proceedings of the 44th Annual IEEE Symposium on Foundations of Computer Science
  (2003), 534--543. #link("https://doi.org/10.1109/SFCS.2003.1238226")[doi:10.1109/SFCS.2003.1238226].]
#bibitem([9])[J. Heinonen, #emph[Lectures on Lipschitz Analysis], Report 100,
  Department of Mathematics and Statistics, University of Jyväskylä, 2005.]
#bibitem([10])[T. J. Laakso, #emph[Ahlfors $Q$-regular spaces with arbitrary $Q >
  1$ admitting weak Poincaré inequality], Geometric and Functional Analysis #strong[10] (2000), no.~1, 111--123.
  #link("https://doi.org/10.1007/s000390050003")[doi:10.1007/s000390050003]. Erratum:
  ibid.~#strong[12] (2002), no.~3, 650.]
#bibitem([11])[V. Lafforgue and A. Naor, #emph[A doubling subset of $L_p$ for $p >
  2$ that is inherently infinite dimensional], Geometriae Dedicata #strong[172] (2014), 387--398.
  #link("https://doi.org/10.1007/s10711-013-9924-4")[doi:10.1007/s10711-013-9924-4].]
#bibitem([12])[U. Lang and C. Plaut, #emph[Bilipschitz embeddings of metric spaces into space forms],
  Geometriae Dedicata #strong[87] (2001), 285--307.
  #link("https://doi.org/10.1023/A:1012093209450")[doi:10.1023/A:1012093209450].]
#bibitem([13])[A. Naor and O. Neiman, #emph[Assouad's theorem with dimension independent of the snowflaking],
  Revista Matemática Iberoamericana #strong[28] (2012), no.~4, 1123--1142.
  #link("https://doi.org/10.4171/RMI/706")[doi:10.4171/RMI/706].]
#bibitem([14])[OpenAI, #emph[Subpolynomial dimension reduction in $L_p$],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Subpolynomial-dimension-reduction-in-Lp-September-23-2026/paper.pdf")[OAI:Subpolynomial-dimension-reduction-in-Lp-September-23-2026],
  2026.]
#bibitem([15])[A. Schioppa, #emph[An example of a doubling "inherently" infinite-dimensional subset of $l_2$],
  withdrawn preprint, 2017; withdrawal posted April 22, 2017.
  #link("https://arxiv.org/abs/1703.10265")[arXiv:1703.10265].]
#bibitem([16])[T. Tao, #emph[245A, Notes 5: Differentiation theorems], 16 October 2010,
  #link("https://terrytao.wordpress.com/2010/10/16/245a-notes-5-differentiation-theorems/").]
