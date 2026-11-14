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

#align(center)[#text(size: 16pt, weight: "bold")[The geometric case of the Erdős similarity conjecture]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Let $m$ denote Lebesgue measure on $bb(R)$. A set $A subset.eq
  bb(R)$ is #emph[measure universal] if every Lebesgue-measurable set of positive measure contains a nontrivial
  affine copy

$ x + s A = { x + s a : a in A } \, wide x in bb(R) \, quad s in bb(R) \\ { 0 } . $

The Erdős similarity conjecture #cite(label("Erdos1974Problems")) Problem 4.33.7\* asserts that no infinite set is
  measure universal. We prove its geometric-progression case. For $q in \( 0 \, 1 \)$, write

$ G_q = { q^n : n in bb(N) \, med n gt.eq 1 } . $

#thm([Theorem 1.1.])[
  #emph[For every $q in \( 0 \, 1 \)$ and $eta in \( 0 \, 1 \)$,
    there is a compact set $E_(q \, eta) subset.eq \[ 0 \, 1 \]$ with $m \( E_(q \, eta) \) > 1 - eta$ such that
$ upright("for every ") x in bb(R) upright(" and ") s in bb(R) \\ { 0 } \, quad x +
  s q^n in.not E_(q \, eta) upright(" for some integer ") n gt.eq 1 . $

]
] <thm:main>

The avoiding set may depend on $q$. In particular, taking $q =
  1 \/ 2$ gives a compact set of arbitrarily large measure in $\[ 0 \, 1 \]$ avoiding every signed affine copy of
  the dyadic sequence. The theorem treats all geometric ratios,
  while the conjecture for arbitrary infinite sets is a separate question.

=== 1.1 Background and related work <background-and-related-work>

Every finite pattern is measure universal. Indeed, if $F$ is finite and $A$ is measurable with finite positive
  measure, continuity of translations in $L^1$ gives

$ m #scale(x: 180%, y: 180%)[\(] ⋂_(a in F) \( A - s a \) #scale(x: 180%, y: 180%)[\)] arrow.r
  m \( A \) > 0 wide \( s arrow.r 0 \) . $

For an arbitrary positive-measure set, apply this observation to a bounded subset of positive measure.
  The conjecture asks whether this property always fails for infinite patterns.

Falconer #cite(label("Falconer1984")) and Eigen #cite(label("Eigen1985")) proved nonuniversality for positive
  decreasing sequences $a_n arrow.r 0$ with $a_(n + 1) \/ a_n arrow.r 1$.
  Humke and Laczkovich #cite(label("HumkeLaczkovich1998")) Theorems 1–2 and Corollary 1 developed a finite
  covering characterization and further criteria in terms of relative gaps.
  Kolountzakis #cite(label("Kolountzakis1997")) Theorem 3 gave a probabilistic criterion using large finite
  subsets with sufficiently large normalized minimum gap. In the translation-invariant form of
  Chlebík #cite(label("Chlebik2015")) Theorem 15, a bounded infinite set is nonuniversal if it contains finite
  subsets $a_1 > dots.h.c > a_m$, of arbitrarily large cardinality, for which

$ - log (frac(min_(i < m) \( a_i - a_(i + 1) \), a_1 - a_m)) = o \( m \) . $

Geometric progressions do not satisfy this criterion. For distinct powers of $q$, we have $a_(m - 1) lt.eq
  q^(m - 2) a_1$ and $a_1 - a_m gt.eq \( 1 - q \) a_1$. Their normalized minimum gap is therefore at most
  $q^(m - 2) \/ \( 1 - q \)$, whose negative logarithm cannot be sublinear in $m$.

Additive structure supplies another family of results. Bourgain #cite(label("Bourgain1987")) proved that the sum
  of three infinite sets is nonuniversal. Kolountzakis #cite(label("Kolountzakis1997")) treated certain double
  sums, including $G_(1 \/ 2) + G_(1 \/ 2)$. Mora Cuellar, Iosevich, Kulkarni,
  Rojas Aravena and Yavicoli #cite(label("MoraCuellarEtAl2026Twofold")) Theorem 2 proved that the sum or
  difference of a geometric null sequence and any infinite set is nonuniversal.
  Avoiding such a larger pattern does not imply avoidance of the single geometric progression in Theorem 1.

Other results concern different classes of patterns or notions of largeness.
  Iosevich, Kulkarni, Mora Cuéllar, Rojas Aravena and Yavicoli #cite(label("IKMRY2026Rajchman")) Theorem 1.5 prove
  nonuniversality for sets supporting a probability measure whose Fourier transform tends to zero at infinity.
  Such a measure is atomless, so the hypothesis excludes countable sets #cite(label("IKMRY2026Rajchman"))
  Proposition 4.1. Cruz, Lai and Pramanik #cite(label("CruzLaiPramanik2023")) preprint,
  Corollary 1.2 and Proposition 4.4 construct sets of Hausdorff dimension one avoiding certain null sequences
  together with their limit point; the subsets establishing that dimension have Lebesgue measure zero.
  In a different direction, the theorem of Feng, Lai and Xiong #cite(label("FengLaiXiong2024")) preprint,
  Theorem 1.1 implies that every $G_q$ embeds into every measurable set of positive measure by a bi-Lipschitz map.
  The restriction to affine maps is therefore substantive.

The proof below belongs to the probabilistic approach of Kolountzakis #cite(label("Kolountzakis1997")).
  Random cells, fixed-center scale discretization, and integration of exceptional-center probabilities also appear
  in Chlebík #cite(label("Chlebik2015")) Section 5 and
  Kolountzakis–Papageorgiou #cite(label("KolountzakisPapageorgiou2025")) Section 3.1;
  the latter paper treats unbounded sequences. Solymosi #cite(label("Solymosi2011Sparse")) Section 3 and
  Tom #cite(label("Tom2015")) report incomplete dyadic constructions based on random cells;
  Tom also considers nested dyadic intervals and tests independent of the dilation.
  Our contribution is the finite routing construction and its local control of the scale count.
  We explain that mechanism next and give a self-contained proof.

=== 1.2 The proof mechanism <the-proof-mechanism>

We construct the open complement of the avoiding set. The intermediate goal is an open,
  $1$-periodic set of arbitrarily small density that meets $x +
  t G_q$ for every $x in bb(R)$ and every $t in \[ 1 \, 2 \]$.
  A summable union of its dilations and reflections then handles every nonzero scale;
  Section 2 gives this reduction. The remaining proof uses only finite probability spaces and elementary measure theory.

For a fixed center and a fixed scale, many independent random cell tests make a missed copy unlikely.
  The difficulty is to control all scales at once. Recording every possible change at the finest grid of a large
  construction can cost more than the failure probability can afford.
  We arrange the tests on a finite ordered tree so that each group of tests uses only the grids on one edge and in
  its child subtree. Other parts of the tree may use much finer grids without increasing the scale count for that group.

Each point is routed to a leaf by independent binary tables evaluated at its grid cells.
  A node chooses the first child whose table returns one, and chooses its last child by default if all earlier
  tables return zero. The leaf has a separate table whose entries equal one with a small probability $p$;
  this final table determines membership in the random set and keeps its expected density equal to $p$.

We assign a consecutive interval of sequence indices to each edge,
  in the order that traverses an edge before its entire child subtree.
  Gaps between these intervals make earlier routing decisions unchanged by the translations associated with a
  later interval, except at a small set of centers. Within the current interval,
  the translated points use distinct entries of its own table.
  At the first default on the center’s route, the nondefault children therefore supply many independent
  opportunities for a hit. Taking the tree sufficiently deep makes the probability of having no default small.

The decisive length condition makes an edge’s index interval at least as long as the following gap and its child
  subtree together. Every grid needed by a test from that interval then occurs within twice its length.
  Thus the number of scale representatives depends on the length of one interval,
  rather than on the resolution of the entire tree. The branching number can be chosen so that the
  independent-test failure probability beats this scale count.

For general $q$, we retain nested dyadic grids but choose their resolutions comparable to $q^(- b) \/ \( 1 - q \)$
  at index $b$. This gives both the nesting needed to preserve earlier decisions and the separation needed for
  fresh random entries. The branching number is allowed to depend on $q$.
  These two adjustments let the same finite routing mechanism accommodate any fixed geometric ratio.

Finally, the construction may miss copies at a small closed set of centers.
  An open neighborhood of those centers repairs every such copy, because $x + t q^n$ tends to $x$.
  This converts the estimate for exceptional centers into a statement valid at every center.
  Section 3 constructs the grids and index intervals; Section 4 proves the conditional independence of the tests;
  and Section 5 controls all normalized scales and completes the open-neighborhood repair.

== 2 A periodic hitting set and the global deduction <sec:periodic>

Fix $q in \( 0 \, 1 \)$ for the rest of the proof. For a measurable, $1$-periodic set $A subset.eq bb(R)$, write

$ rho \( A \) = m \( A ∩ \[ 0 \, 1 \) \) . $

We first restrict the dilation factor to $\[ 1 \, 2 \]$, while allowing every real center.
  The following is the main construction.

#thm([Proposition 2.1.])[
  #emph[For every $p in \( 0 \, 1 \)$, there is an open $1$-periodic set $H subset.eq bb(R)$ with $rho \( H \)
    lt.eq 6 p$ such that
#[#set math.equation(numbering: n => "(2.1)")
 $ upright("for every ") x in bb(R) upright(" and ") t in \[ 1 \, 2 \] \, quad x +
   t q^n in H upright(" for some integer ") n gt.eq 1 . $ <eq:periodic-hitting>]

]
] <prop:periodic>

Sections 3–5 prove this proposition. We give its global consequence now,
  so that the subsequent construction has a single normalized target.
  The summable measure budgets allow us to use both expanding and contracting copies of the periodic set.

#proof[
  For each $k in bb(Z)$, put
  $ p_k = eta / 64 thin 4^(- \| k \|) $
  and choose $H_k$ from Proposition 2 with $p = p_k$. Define
  #[#set math.equation(numbering: n => "(2.2)")
   $ C = union.big_(k in bb(Z)) #scale(x: 120%, y: 120%)[\(] 2^k H_k union \( - 2^k H_k \)
     #scale(x: 120%, y: 120%)[\)] \, wide E_(q \, eta) = \[ 0 \, 1 \] \\ C . $ <eq:global-open>]
  The set $C$ is open and symmetric under reflection, so $E_(q \, eta)$ is compact.
  Each signed dilation $plus.minus 2^k H_k$ is periodic with period $2^k$ and has measure $2^k
    rho \( H_k \)$ in one period. If $k lt.eq 0$, the interval $\[ 0 \, 1 \]$ consists of exactly $2^(- k)$
    periods. If $k > 0$, it lies inside a period interval of length $2^k$. In both cases,
  $ m #scale(x: 120%, y: 120%)[\(] \( plus.minus 2^k H_k \) ∩ \[ 0 \, 1 \] #scale(x: 120%, y: 120%)[\)] lt.eq
    max \( 1 \, 2^k \) rho \( H_k \) . $
  Consequently,
  #[#set math.equation(numbering: n => "(2.3)")
   $ m \( C ∩ \[ 0 \, 1 \] \) & lt.eq 12 sum_(k in bb(Z)) p_k max \( 1 \, 2^k \)\
 & = frac(12 eta, 64) (sum_(j gt.eq 1) 4^(- j) + 1 + sum_(k gt.eq 1) 2^(- k)) =
   frac(7 eta, 16) < eta . $ <eq:global-measure>]
  It follows that $m \( E_(q \, eta) \) > 1 - eta$.
  For $s > 0$, choose $k in bb(Z)$ and $t in \[ 1 \, 2 \)$ with $s = 2^k t$.
    Apply Equation (2.1) to $H_k$ at the center $2^(- k) x$. For some $n gt.eq 1$ it gives
  $ 2^(- k) x + t q^n in H_k \, wide upright("hence") wide x + s q^n in 2^k H_k subset.eq C . $
  For $s < 0$, apply the same conclusion to $- x$ and $- s > 0$ and reflect.
    Thus every nontrivial affine copy of $G_q$ meets $C$ and is not contained in $E_(q \, eta)$. ◻
]

The dyadic factors in Equation (2.2) only normalize the dilation parameter.
  They do not change the index $n$ or require any algebraic relation between $2$ and $q$.

== 3 Grids, preorder windows, and stable centers <sec:windows>

We now prepare the index windows used to find a hit at a normalized scale $t in \[ 1 \, 2 \]$.
  Each edge of a finite ordered tree will carry one window.
  We will bound the set of centers at which translations by $t
  q^n$ from a given window can change earlier grid keys, and show that the translated points take distinct keys at
  the edge’s own resolution. Throughout this section, $q in \( 0 \, 1 \)$ and the integers $M gt.eq 2$, $d gt.eq
  1$, $g gt.eq 1$, and $r_0 gt.eq 1$ are arbitrary and fixed.

For each integer $b gt.eq 1$, put

$ c = frac(4, 1 - q) \, wide N_b = 2^(ceil.l log_2 \( c q^(- b) \) ceil.r) \, wide Gamma_b = N_b^(- 1) bb(Z) . $

The periodic grid key of $z in bb(R)$ is $J_b \( z \) = floor.l N_b { z } floor.r$, where ${ z } = z -
  floor.l z floor.r$. Thus the cells are closed on the left and open on the right,
  and a boundary point belongs to the cell on its right. We have

#[#set math.equation(numbering: n => "(3.1)")
 $ c q^(- b) lt.eq N_b < 2 c q^(- b) . $ <eq:grid-size>]

All $N_b$ are powers of two and are nondecreasing in $b$.
  Consequently, if $b' gt.eq b$, then $N_(b') \/ N_b$ is an integer and

$ J_b \( z \) = ⌊frac(J_(b') \( z \), N_(b') \/ N_b)⌋ . $

In particular, a finer key determines every coarser key. This nesting is the reason for retaining dyadic grids
  even when $q$ is not dyadic.

=== Assigning the windows <assigning-the-windows>

Take a complete ordered $M$-ary tree of height $d$, with leaves of height $0$.
  Write $P_1 \, dots.h \, P_M$ for the children of an internal vertex $P$,
  and $\( P \, i \)$ for the edge from $P$ to $P_i$. Let $K$ be the total number of edges.
  Order the edges in preorder: for each $i = 1 \, dots.h \, M$,
  list $\( P \, i \)$ and then all edges in the subtree rooted at $P_i$, in the same recursive order.
  An edge and its child subtree therefore form a consecutive block in this list.

Assign an integer interval $W_e = \[ a_e \, b_e \] ∩ bb(N)$ to each edge, in preorder,
  leaving exactly $g$ unused indices between consecutive windows.
  All edges leaving a vertex of height $h$ receive a window of length $r_h$.
  For an edge with a nonleaf child, we make its window at least as long as the gap and the entire child subtree
  that follow it. To specify these lengths from the leaves upward, write $sigma_h$ for the span, including gaps,
  of all windows in a subtree of height $h$. At height $1$ there are $M$ windows and $M - 1$ gaps, so we set

$ r_1 = r_0 \, wide sigma_1 = M r_1 + \( M - 1 \) g \, $

and, for $2 lt.eq h lt.eq d$, choose

$ r_h = max { r_0 \, g + sigma_(h - 1) } . $

At height $h gt.eq 2$ there are $M$ blocks, each comprising one outgoing window, a gap, and a child subtree.
  Another $M - 1$ gaps separate these blocks, giving

$ sigma_h = M \( r_h + g + sigma_(h - 1) \) + \( M - 1 \) g . $

Choose the first starting index $n_0 gt.eq 1$ so that $2 q^(n_0) lt.eq 1 \/ 4$,
  and place all subsequent windows with the prescribed lengths and gaps.
  Attach to each edge $e$ the grid indexed by its window endpoint $b_e$, and set

$ cal(N) = union.big_e W_e . $

For $e = \( P \, i \)$, let $b_e^(*)$ be the largest endpoint among $W_e$ and all windows in the subtree rooted at
  $P_i$. The recursive choice has the following useful consequence.

#thm([Lemma 3.1.])[
  (Span of an edge and its child subtree).  #emph[If $e = \( P \, i \)$ leaves a vertex of height $h$, then
#[#set math.equation(numbering: n => "(3.2)")
 $ b_e^(*) - a_e + 1 lt.eq 2 r_h . $ <eq:window-span>]

]
] <lem:window-span>

#proof[
  If $h = 1$, the child is a leaf, so $b_e^(*) = b_e$ and the span is $r_1$.
    If $h gt.eq 2$, preorder places the child’s subtree immediately after $W_e$, apart from one gap of length $g$.
    The span is therefore $r_h + g + sigma_(h - 1)$, which is at most $2 r_h$ by the definition of $r_h$. ◻
]

Figure 1 shows the block appearing in the proof. Thus the finest grid used anywhere in this block has its index at
  most $2 r_h - 1$ beyond $a_e$. This will control the number of grid boundaries encountered as $t$ varies.
  The gaps between windows serve a different purpose: they control the bound on the density of centers at which a
  translation from a later window can change an earlier key.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (4.656, 0.966), fill: rgb("#e0e0ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  content((2.328, 0.483), [#text(size: 9pt)[$W_e$: $r_h$ indices]])
  rect((4.656, 0), (5.238, 0.966), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((4.947, 0.483), [#text(size: 9pt)[$g$]])
  rect((5.238, 0), (9.021, 0.966), fill: black, stroke: (thickness: 0.4pt, miter-limit: 10))
  content((7.129, 0.483), [#text(size: 9pt)[child-subtree windows#linebreak()and gaps: $sigma_(h-1)$]])
  rect((9.021, 0), (9.603, 0.966), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((9.312, 0.483), [#text(size: 9pt)[$g$]])
  rect((9.603, 0), (11.93, 0.966), fill: rgb("#f2f2f2"), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((10.77, 0.483), [#text(size: 9pt)[next sibling#linebreak()block]])
  content((0, 1.012), [#text(size: 9pt)[$a_e$]], anchor: "south", padding: 0.1176cm)
  content((4.656, 1.012), [#text(size: 9pt)[$b_e$]], anchor: "south", padding: 0.1176cm)
  content((9.021, 1.012), [#text(size: 9pt)[$b_e^*$]], anchor: "south", padding: 0.1176cm)
  line((0, -0.1472), (9.021, -0.1472), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((4.511, -0.3864), [#text(size: 9pt)[$b_e^*-a_e+1=r_h+g+ sigma_(h-1) lt.eq 2r_h$]], anchor: "north", padding: 0.1176cm)
  line((-0.194, -1.15), (12.12, -1.15), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: rgb("#808080"))))
  content((5.966, -1.15), [#text(size: 9pt)[increasing indices in preorder]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: The block attached to an edge at height $h gt.eq 2$, shown schematically. The window length is at least the length of the following gap and child-subtree span together. Thus the entire block has at most twice the window length, regardless of where it occurs in the tree. The next sibling block is outside this bound. At height $1$, the child is a leaf and the block consists only of $W_e$. ],
) <fig:window-block>

=== Preserving earlier keys <preserving-earlier-keys>

Call $x in bb(R)$ #emph[stable] if, for every window $W_e$ other than the first,
  writing $b'$ for the endpoint of its immediate predecessor,

$ \( x \, x + 2 q^(a_e) \] ∩ Gamma_(b') = diameter . $

Let $cal(S)$ be the set of stable centers. The left endpoint is excluded because a translation to the right need
  not leave a grid cell when it starts on that cell’s left boundary;
  the right endpoint is included because reaching the next boundary does change the key.

#thm([Lemma 3.2.])[
  (Stability and earlier keys).  #emph[The set $cal(S)$ is measurable and $1$-periodic, and
$ rho \( bb(R) \\ cal(S) \) lt.eq 4 K c thin q^(g + 1) . $

 If $x in cal(S)$, $n in W_e$, and $t in \[ 1 \, 2 \]$, then every edge $f$ preceding $e$ in preorder satisfies
#[#set math.equation(numbering: n => "(3.3)")
 $ J_(b_f) \( x + t q^n \) = J_(b_f) \( x \) . $ <eq:stable-keys>]

]
] <lem:stability>

#proof[
  For a fixed noninitial window, failure of its stability condition occurs on the union of intervals
  $ \[ gamma - 2 q^(a_e) \, gamma \) \, wide gamma in Gamma_(b') . $
  This is a measurable periodic set of density at most
  $ 2 N_(b') q^(a_e) lt.eq 4 c thin q^(a_e - b') = 4 c thin q^(g + 1) \, $
  where we used (3.1) and $a_e = b' + g + 1$. Summing over the at most $K -
    1$ noninitial windows proves the stated density bound.
  For the first window there are no earlier edges to consider.
    Otherwise, let $b'$ again be the endpoint of its predecessor, and suppose $x$ is stable.
    For $n in W_e$ and $t in \[ 1 \, 2 \]$, we have $0 < t q^n lt.eq 2 q^(a_e)$.
    Hence the segment from $x$ to $x + t q^n$ crosses no boundary of $Gamma_(b')$,
    with a possible boundary at $x$ itself assigned to the cell on its right.
    It follows that $J_(b') \( x + t q^n \) = J_(b') \( x \)$.
    Every preceding edge $f$ has $b_f lt.eq b'$, so nesting gives (3.3). ◻
]

=== Separating the test points <separating-the-test-points>

Earlier keys are now fixed at stable centers. At the resolution attached to the current edge,
  the center and its translated points instead have distinct keys. This second property holds at every center.

#thm([Lemma 3.3.])[
  (Separation within one window).  #emph[Fix an edge $e$, a center $x in bb(R)$, and a scale $t in \[ 1 \, 2 \]$.
    The points
$ { x } med union med { x + t q^n : n in W_e } $

 have pairwise distinct keys under $J_(b_e)$. They also have pairwise distinct keys under every $J_b$ with $b
   gt.eq b_e$.]
] <lem:separation>

#proof[
  Write $b = b_e$. All the displayed points lie in $\[ x \, x + 2 q^(n_0) \]$,
    an interval of length at most $1 \/ 4$. Their pairwise distances on the circle $bb(R) \/
    bb(Z)$ therefore equal their ordinary real distances. The distance from $x$ to any translated point is $t q^n
    gt.eq q^b$. For $n < n'$ in $W_e$, the distance between the two translated points is
  $ t \( q^n - q^(n') \) = t q^n \( 1 - q^(n' - n) \) gt.eq \( 1 - q \) q^b . $
  On the other hand, (3.1) gives
  $ 1 / N_b lt.eq q^b / c = frac(\( 1 - q \) q^b, 4) < \( 1 - q \) q^b . $
  Two points with the same periodic key have circular distance less than the cell width $1 \/ N_b$.
    Thus all the keys are distinct, including when one of the points is a boundary point.
    Distinctness persists at finer resolutions because a finer key determines its coarser key. ◻
]

The random construction can consequently reuse all earlier decisions at a stable center while consulting distinct
  entries for the points in the current window. We next use this distinction to obtain independent opportunities
  for a hit.

== 4 Random routing and independent tests <sec:routing>

Keep the tree, grids, and windows of Section 3, and fix $p in \( 0 \, 1 \)$.
  We construct a random periodic set of expected density $p$,
  routing each point through the tree with one child at each internal vertex designated as the default.
  When the route of a stable center makes a default choice,
  the first such vertex supplies many tests for membership of nearby points.
  We compute the probability of having no default choice and show that, when the tests are available,
  their conditional failure probability at each fixed scale decays exponentially in the window length.
  The dependence on $q$ enters through the grids and separation estimates already established.

=== 4.1 The random tables <the-random-tables>

For each edge $e = \( P \, i \)$ with $i < M$, let

$ S_e : { 0 \, dots.h \, N_(b_e) - 1 } arrow.r { 0 \, 1 } $

be a table of independent fair bits. Child $M$ is the default child and has no selector table.
  For each leaf $L$, let $b \( L \)$ be the window endpoint of its incoming edge, and let

$ T_L : { 0 \, dots.h \, N_(b \( L \)) - 1 } arrow.r { 0 \, 1 } $

be a table of independent Bernoulli-$p$ bits. All entries of all selector tables $S_e$ and terminal tables $T_L$
  are mutually independent. There are finitely many entries,
  so they define a finite product probability space $Omega$, with probability $bb(P)$ and expectation $bb(E)$.
  Write $cal(A)$ for the sigma-field generated by all entries of all selector tables.

Given an outcome and $z in bb(R)$, route $z$ from the root as follows.
  At an internal vertex $P$, choose the first child $P_i$, $i < M$,
  whose selector satisfies $S_(\( P \, i \)) \( J_(b_(\( P \, i \))) \( z \) \) = 1$.
  If all these values are zero, choose $P_M$. Let $L \( z \)$ denote the leaf reached and define

#[#set math.equation(numbering: n => "(4.1)")
 $ B = { z in bb(R) : T_(L \( z \)) \( J_(b \( L \( z \) \)) \( z \) \) =
   1 #scale(x: 120%, y: 120%)[}] . $ <eq:random-set>]

Every key is periodic, and every grid is refined by the finest grid in the construction.
  Thus each realization of $B$ is $1$-periodic and is a union of finitely many half-open cells per period.

#thm([Lemma 4.1.])[
  (Mean density).  #emph[The random set $B$ in (4.1) satisfies $bb(E) rho \( B \) = p$.]
] <lem:density>

#proof[
  For fixed $z$, conditioning on $cal(A)$ fixes its leaf and terminal address.
    The terminal entry at that address still has Bernoulli-$p$ law, so $bb(P) \( z in B divides cal(A) \) = p$.
    Integration over one period, interchanged with the finite weighted sum over $Omega$, gives
  $ bb(E) rho \( B \) = integral_0^1 bb(P) \( z in B \) thin d z = p . $
  ◻
]

=== 4.2 Exposing the center and routing local tests <exposing-the-center-and-routing-local-tests>

For a fixed center $x in bb(R)$, expose its addressed entry in #emph[every] selector table,
  including tables outside its route. Write

#[#set math.equation(numbering: n => "(4.2)")
 $ cal(F)_x = sigma #scale(x: 120%, y: 120%)[\(] S_e \( J_(b_e) \( x \) \) : e = \( P \, i \) \, med
   i < M #scale(x: 120%, y: 120%)[\)] subset.eq cal(A) . $ <eq:center-exposure>]

An atom $xi$ of $cal(F)_x$ specifies all these entries and has positive probability.
  Their addresses are deterministic once $x$ is fixed. On every atom,
  the remaining selector entries are therefore independent fair bits,
  and all terminal entries retain their independent Bernoulli-$p$ laws.

The exposure determines the entire route of $x$. If that route uses a default child,
  let $U$ be the first vertex where it does so. Before conditioning on $cal(F)_x$,

#[#set math.equation(numbering: n => "(4.3)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] upright("the route of ") x upright(" has no default choice")
   #scale(x: 120%, y: 120%)[\)] = \( 1 - 2^(1 - M) \)^d . $ <eq:no-default>]

Indeed, reveal the entries along the route one vertex at a time.
  At the vertex reached, its $M - 1$ selector entries are independent fair bits,
  since the preceding choices use only ancestor tables. The conditional probability of a default is
  $2^(- \( M - 1 \))$. Multiplying the complementary conditional probabilities over the $d$ decisions proves the
  formula.

Now fix a stable center $x$ and an atom $xi$ on which $U$ exists.
  Under this conditioning, $U$ and its height $h$ are fixed. Put

$ r = r_h \, wide e_i = \( U \, i \) quad \( 1 lt.eq i < M \) \, wide y_n \( t \) = x +
  t q^n quad \( t in \[ 1 \, 2 \] \) . $

All $M - 1$ selector values at $x$ on these edges are zero.
  The windows $W_(e_i)$ will provide $\( M - 1 \) r$ possible hits.

For $i < M$, let $L_i \( z \)$ be the leaf reached by routing $z$ starting at the child $U_i$;
  if this child is a leaf, take $L_i \( z \) = U_i$. Define the local test

#[#set math.equation(numbering: n => "(4.4)")
 $ Q_i \( z \) = S_(e_i) \( J_(b_(e_i)) \( z \) \) thin T_(L_i \( z \)) \( J_(b \( L_i \( z \) \)) \( z \) \) .
   $ <eq:local-test>]

It consults only the selector on $e_i$ and the tables in its child subtree.
  The next lemma makes a successful local test a hit in $B$.

#thm([Lemma 4.2.])[
  (Preservation of routing).  #emph[Fix a stable center $x$ and an atom $xi$ of $cal(F)_x$ on which the first
    default vertex $U$ exists. For every outcome in $xi$, every $i < M$, every $n in W_(e_i)$,
    and every $t in \[ 1 \, 2 \]$, the route of $y_n \( t \)$ reaches $U$ and rejects its children $1 \, dots.h \,
    i - 1$. Consequently,
#[#set math.equation(numbering: n => "(4.5)")
 $ Q_i \( y_n \( t \) \) = 1 quad arrow.r.double quad y_n \( t \) in B . $ <eq:local-hit>]

]
] <lem:routing>

#proof[
  At each strict ancestor $P$ of $U$, let $a$ be the child index chosen by $x$.
    Since $U$ is its first default vertex, $a < M$. The decision at $P$ reads zeros at indices less than $a$ and
    one at $a$. All these edges precede $e_i$ in preorder, so their selector values at $y_n \( t \)$ equal those
    at $x$ by (3.3). Applying this observation successively from the root shows that $y_n \( t \)$ reaches $U$.
    At $U$, every edge $\( U \, j \)$ with $j < i$ also precedes $e_i$;
    its selector at $y_n \( t \)$ is therefore the exposed zero at $x$.
  If $Q_i \( y_n \( t \) \) = 1$, its selector on $e_i$ is one, so the actual route takes child $U_i$.
    Its continuation reaches the leaf $L_i \( y_n \( t \) \)$, whose addressed terminal entry is one.
    This is exactly the membership condition (4.1). ◻
]

=== 4.3 The exact failure probability at a fixed scale <the-exact-failure-probability-at-a-fixed-scale>

We now show that these tests are numerous enough to make a miss unlikely.
  Their routes may share selector entries, so we first fix all selectors and check that the resulting terminal
  addresses are distinct. This order of conditioning keeps the dependence of the leaves on the selectors explicit.

#thm([Lemma 4.3.])[
  (Independent tests).  #emph[Fix a stable center $x$ and an atom $xi$ of $cal(F)_x$ on which the first default
    vertex $U$ exists. Let $h$ be its height and $r = r_h$, and define $Q_i$ by (4.4).
    For every fixed $t in \[ 1 \, 2 \]$,
#[#set math.equation(numbering: n => "(4.6)")
 $ bb(P)
   (Q_i \( y_n \( t \) \) = 0 upright(" for all ") i < M \, med n in W_(e_i) thin mid(bar.v) thin xi) = \( 1 -
   p \/ 2 \)^(\( M - 1 \) r) . $ <eq:test-failure>]

]
] <lem:independent-tests>

#proof[
  On the atom $xi$, the index set
  $ cal(I) = { \( i \, n \) : 1 lt.eq i < M \, med n in W_(e_i) } $
  is fixed and has cardinality $\( M - 1 \) r$. For each pair put $A_(i \, n) =
    S_(e_i) \( J_(b_(e_i)) \( y_n \( t \) \) \)$. For fixed $i$,
    Lemma 5 gives pairwise distinct keys for $x$ and the points $y_n \( t \)$, $n in W_(e_i)$,
    at resolution $b_(e_i)$. Thus the $A_(i \, n)$ use distinct entries of their table and avoid its entry exposed
    at $x$. Different $i$’s use different tables. Conditional on $xi$,
    all $A_(i \, n)$ are therefore independent fair bits.
  Next condition on $cal(A)$, the sigma-field of all selectors.
    For each pair, its local leaf $L_(i \, n) = L_i \( y_n \( t \) \)$ and terminal address
  $ kappa_(i \, n) = #scale(x: 120%, y: 120%)[\(] L_(i \, n) \,
    J_(b \( L_(i \, n) \)) \( y_n \( t \) \) #scale(x: 120%, y: 120%)[\)] $
  are fixed. These addresses are distinct. If two child indices differ,
    the leaves lie in disjoint child subtrees of $U$, so their tables differ.
    If the child indices agree but the leaves differ, the tables again differ.
    Finally, suppose two different indices $n \, n'$ below the same child select the same leaf $L$.
    Its incoming edge is either $e_i$ itself or a later edge in that child subtree, so $b \( L \) gt.eq b_(e_i)$.
    The two points have different keys at resolution $b_(e_i)$,
    and nesting preserves this distinction at resolution $b \( L \)$.
    Their terminal addresses are distinct in this case as well.
  Consequently, for each realization of the selectors, the terminal entries at all addresses $kappa_(i \, n)$ are
    independent Bernoulli-$p$ variables. The pairs with $A_(i \, n) = 0$ fail already;
    each remaining pair fails precisely when its terminal bit is zero. Hence, on $xi$,
  $ bb(P) #scale(x: 120%, y: 120%)[\(] Q_i \( y_n \( t \) \) =
    0 upright(" for all ") \( i \, n \) in cal(I) divides cal(A)
    #scale(x: 120%, y: 120%)[\)] = \( 1 - p \)^(sum_(\( i \, n \) in cal(I)) A_(i \, n)) . $
  Since $cal(F)_x subset.eq cal(A)$, averaging over the selectors conditional on $xi$ gives
  $ & bb(P) #scale(x: 120%, y: 120%)[\(] Q_i \( y_n \( t \) \) =
    0 upright(" for all ") \( i \, n \) in cal(I) divides xi #scale(x: 120%, y: 120%)[\)]\
 & wide = bb(E) [\( 1 - p \)^(sum_(\( i \, n \) in cal(I)) A_(i \, n)) thin mid(bar.v) thin xi] =
   product_(\( i \, n \) in cal(I)) (1 / 2 + frac(1 - p, 2)) = \( 1 - p \/ 2 \)^(\( M - 1 \) r) . $
  ◻
]

The estimate holds for every center-exposure atom admitting a default and every scale fixed on that atom.
  Section 5 will use the child-subtree endpoints $b_(e_i)^(*)$ to select finitely many such scales representing
  all $t in \[ 1 \, 2 \]$. Together with (4.3) and Lemma 6,
  this will control misses while keeping the expected density small.

== 5 All normalized scales and all centers <sec:scales>

The independent tests of Section 4 control a fixed scale at a fixed stable center.
  We first make this estimate simultaneous over $t in \[ 1 \, 2 \]$,
  using only the grids that determine the local tests. We then choose the construction parameters and cover the
  remaining centers by a small open set. The finite boundary-representative argument has precedents in
  #cite(label("Chlebik2015")) proof of Theorem 15 and #cite(label("KolountzakisPapageorgiou2025")) Section 3.1.

#thm([Lemma 5.1.])[
  (Conditional control of all normalized scales).  #emph[Fix $p
    in \( 0 \, 1 \)$ and the construction parameters $M \, d \, g \, r_0$ of Sections 3 and 4.
    Let $x in cal(S)$ be a stable center, and let $xi$ be an atom of the center-exposure field $cal(F)_x$ on which
    the route of $x$ uses a default edge. If its first default occurs at a vertex $U$ of height $h$, put $r = r_h$ and
#[#set math.equation(numbering: n => "(5.1)")
 $ D_(M \, q) \( r \) = 4 + 2 \( M - 1 \) r #scale(x: 120%, y: 120%)[\(] 1 +
   2 c q^(- 2 r) #scale(x: 120%, y: 120%)[\)] . $ <eq:scale-count>]

 Then
#[#set math.equation(numbering: n => "(5.2)")
 $ bb(P) #h(-0.16667em)
   (exists t in \[ 1 \, 2 \] med forall n in cal(N) : med x + t q^n in.not B med mid(bar.v) med xi) lt.eq
   D_(M \, q) \( r \) e^(- p \( M - 1 \) r \/ 2) . $ <eq:conditional-scales>]

]
] <lem:conditional-scales>

#proof[
  On the atom $xi$, the vertex $U$ and its outgoing edges $e_i = \( U \, i \)$, $1 lt.eq i < M$, are fixed.
    Recall that $Q_i \( z \)$ tests the selector on $e_i$ and terminal membership after routing from $U_i$.
    Every table used by this test belongs to $e_i$ or the subtree below it.
    By nesting of the grids, for every realization of the tables,
    $Q_i \( z \)$ is determined by the single key $J_(b_(e_i)^(*)) \( z \)$.
  For each $i < M$ and $n in W_(e_i)$, record the values of $t in \[ 1 \, 2 \]$ for which $y_n \( t \) = x +
    t q^n$ lies on the lattice $Gamma_(b_(e_i)^(*))$. The segment traversed by $y_n$ has length $q^n$,
    so the number of recorded values is at most
  #[#set math.equation(numbering: n => "(5.3)")
   $ 1 + q^n N_(b_(e_i)^(*)) lt.eq 1 + 2 c q^(- 2 r) . $ <eq:local-boundaries>]
  Here we used (3.1) and the block-span bound $b_(e_i)^(*) - a_(e_i) + 1 lt.eq 2 r$ from Lemma 3.
  Combine these lists, add $1$ and $2$, and retain the distinct values in increasing order.
    Let $cal(T)_(x \, xi)$ consist of these values together with one midpoint between each consecutive pair.
    There are $\( M - 1 \) r$ pairs $\( i \, n \)$, and hence
  $ \| cal(T)_(x \, xi) \| lt.eq D_(M \, q) \( r \) . $
  This set depends only on $x$, the deterministic windows and grids, and the vertex $U$ determined by $xi$;
    it is fixed before any remaining table entries are revealed.
    For every realization of those entries, the entire vector
  $ #scale(x: 120%, y: 120%)[\(] Q_i \( y_n \( t \) \) : med i < M \, med n in W_(e_i) #scale(x: 120%, y: 120%)[\)] $
  is constant on each open interval between consecutive recorded values.
    Every boundary value is represented separately, so the half-open cell convention causes no loss at a boundary
    or at an endpoint of $\[ 1 \, 2 \]$.
  If some $t$ misses $B$ at all indices in $cal(N)$, Lemma 7 implies that all these local tests fail at $t$.
    They therefore also fail at some $t' in cal(T)_(x \, xi)$.
    Each such $t'$ is a fixed real number under the conditioning on $xi$, so Lemma 8 applies to it.
    Taking a union bound and using (4.6) gives
  $ bb(P) #h(-0.16667em)
    (exists t in \[ 1 \, 2 \] med forall n in cal(N) : med x + t q^n in.not B med mid(bar.v) med xi) lt.eq \|
    cal(T)_(x \, xi) \| \( 1 - p \/ 2 \)^(\( M - 1 \) r) \, $
  which proves (5.2). ◻
]

The bound uses the last grid in each edge and descendant block.
  Its resolution is controlled by that edge’s window length through (3.2).
  Using the finest grid of the whole construction would discard this control and would not give (5.1).

#proof[
  Fix $p in \( 0 \, 1 \)$. We now specify the parameters that were left arbitrary in the preceding construction.
    Choose an integer $M gt.eq 2$ such that
  #[#set math.equation(numbering: n => "(5.4)")
   $ alpha := frac(p \( M - 1 \), 2) > 2 log \( 1 \/ q \) . $ <eq:branching-choice>]
  Next choose an integer $d gt.eq 1$ satisfying
  $ \( 1 - 2^(1 - M) \)^d < p . $
  For the resulting tree, let $K$ be its number of edges and choose an integer $g gt.eq 1$ such that
  $ 4 K c q^(g + 1) < p . $
  Finally, by (5.4),
  $ D_(M \, q) \( r \) e^(- alpha r) = O #h(-0.16667em) (r e^(- \( alpha - 2 log \( 1 \/ q \) \) r)) arrow.r 0 . $
  Thus there is an integer $r_(*) gt.eq 1$ such that
  #[#set math.equation(numbering: n => "(5.5)")
   $ D_(M \, q) \( r \) e^(- p \( M - 1 \) r \/ 2) < p wide upright("for every integer ") r gt.eq
     r_(*) . $ <eq:window-length-choice>]
  Construct the windows with $r_0 = r_(*)$ and the chosen $M \, d \, g$, and form the random set $B$ of Section 4.
  Fix any stable center $x$. By (4.3), the probability that its route has no default is less than $p$.
    On each atom of $cal(F)_x$ for which a default occurs, Lemma 9 and (5.5) bound the conditional probability of
    a miss at some normalized scale by $p$, since every $r_h gt.eq r_(*)$. Summing over the center-exposure atoms yields
  #[#set math.equation(numbering: n => "(5.6)")
   $ bb(P) #h(-0.16667em) (exists t in \[ 1 \, 2 \] med forall n in cal(N) : med x + t q^n in.not B) lt.eq
     2 p wide \( x in cal(S) \) . $ <eq:stable-miss>]
  The probability space is finite, so this event is measurable even though its definition quantifies over all $t
    in \[ 1 \, 2 \]$.
  It remains to turn this estimate at each center into a set that works at every center.
    Open-neighborhood repair for null sequences is explicit in Tom #cite(label("Tom2015")) Lemma 0.2;
    see also Chlebík #cite(label("Chlebik2015")) Section 3, final remark; Proposition 1(vi), (viii).
    We implement it with open neighborhoods, which contain sufficiently late translated points because $t q^n
    arrow.r 0$. For each table outcome, enlarge the finitely many selected cells per period to an open periodic
    set $B^(+) supset.eq B$ with
  $ rho \( B^(+) \) lt.eq rho \( B \) + p . $
  For that outcome define the set of centers still missed by the finite collection of indices:
  #[#set math.equation(numbering: n => "(5.7)")
   $ R = {x in bb(R) : med exists t in \[ 1 \, 2 \] med forall n in cal(N) \, med x +
     t q^n in.not B^(+)} . $ <eq:exceptional-centers>]
  This is a closed periodic set. Indeed, on the circle $bb(R) \/ bb(Z)$ it is the projection of the closed set
  $ {\( x \, t \) in \( bb(R) \/ bb(Z) \) times \[ 1 \, 2 \] : x + t q^n in.not B^(+) med
    upright("for all ") n in cal(N)} $
  in a compact product. In particular, its density is defined.
  Since $B subset.eq B^(+)$, membership of a fixed stable center in $R$ implies the event in (5.6).
    Lemma 4 and the choice of $g$ give $rho \( bb(R) \\ cal(S) \) < p$.
    Integrating the probability bound over one period therefore gives
  $ bb(E) rho \( R \) = integral_0^1 bb(P) \( x in R \) thin d x lt.eq 2 p rho \( cal(S) \) +
    rho \( bb(R) \\ cal(S) \) lt.eq 3 p . $
  Also $bb(E) rho \( B^(+) \) lt.eq 2 p$ by Lemma 6. Choose a table outcome for which
  $ rho \( B^(+) \) + rho \( R \) lt.eq 5 p . $
  Outer regularity on the circle supplies an open periodic set $V supset.eq R$ with $rho \( V \) lt.eq
    rho \( R \) + p$. Then $H = B^(+) union V$ is open and periodic, and
  $ rho \( H \) lt.eq rho \( B^(+) \) + rho \( R \) + p lt.eq 6 p . $
  To verify the hitting property, fix $x in bb(R)$ and $t in \[ 1 \, 2 \]$.
    If $x in.not R$, the definition of $R$ gives an index $n in cal(N)$ with $x + t q^n in B^(+) subset.eq H$.
    If $x in R$, then $x in V$ and $V$ is open, so $x + t q^n in V subset.eq
    H$ for all sufficiently large $n$ because $t q^n arrow.r 0$.
    These latter indices need not lie in $cal(N)$; the required conclusion allows every $n gt.eq 1$.
    Thus every center and every normalized scale has a hit, proving the proposition. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
