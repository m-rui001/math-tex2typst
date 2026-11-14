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

#align(center)[#text(size: 16pt, weight: "bold")[Brownian continuum random tree limits of finite Fortuin--Kasteleyn maps above four]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

A large planar map can contain many cycles while its distances, viewed on a sufficiently large scale,
  approach those of a tree. We prove that this happens for critical Fortuin–Kasteleyn maps at every fixed $q > 4$:
  their finite-volume metric scaling limit is the Brownian continuum random tree.

Two features of this statement require separate work. The probability law is conditioned on the size of the entire
  finite map, and the metric uses all its edges. A limit of an unconditioned encoding walk does not supply either
  conclusion. Our proof identifies an exact marked block tree,
  proves that its offspring law is critical with finite variance,
  and controls the graph distances contributed by its blocks uniformly over all ancestral paths.

=== 1.1 The finite model and the main result <the-finite-model-and-the-main-result>

A #emph[rooted planar map] is a connected graph embedded in an oriented sphere,
  up to orientation-preserving homeomorphism, with a distinguished oriented edge, or #emph[dart].
  Loops and multiple edges are allowed. For an edge subset $A subset.eq E \( M \)$,
  let $k_M \( A \)$ be the number of components of the spanning graph $\( V \( M \) \, A \)$,
  counting isolated vertices. For $q > 4$ and $n gt.eq 1$, sample a pair $\( M_n \, A_n \)$ with $\|
  E \( M_n \) \| = n$ according to

#[#set math.equation(numbering: n => "(1.1)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] \( M_n \, A_n \) = \( M \, A \) #scale(x: 120%, y: 120%)[\)] = 1 /
   Z_(n \, q) thin q^(thin k_M \( A \) + \( \| A \| - \| V \( M \) \| \) \/ 2) . $ <eq:finite-law>]

Equivalently, the weight is $q^(ell \( M \, A \) \/ 2)$, where $ell \( M \, A \) =
  2 k_M \( A \) + \| A \| - \| V \( M \) \|$ is the number of FK interface loops.
  Let $d_n$ be graph distance on $V \( M_n \)$ using every edge of $M_n$, and put

#[#set math.equation(numbering: n => "(1.2)")
 $ mu_n \( { v } \) = frac(deg_(M_n) \( v \), 2 n) . $ <eq:degree-measure>]

A loop contributes two to the degree.

Let $e$ be a standard normalized Brownian excursion on $\[ 0 \, 1 \]$. For $s \, t in \[ 0 \, 1 \]$, define

$ d_e \( s \, t \) = e \( s \) + e \( t \) - 2 min_(r in \[ s and t \, s or t \]) e \( r \) . $

The quotient by $d_e = 0$, equipped with its induced metric and the pushforward $mu_e$ of Lebesgue probability
  measure, is denoted $\( cal(T)_e \, d_e \, mu_e \)$. We use this normalization throughout.

#thm([Theorem 1.1.])[
  #emph[For every fixed real $q > 4$, there is a deterministic constant $c \( q \) in \( 0 \, oo \)$ such that,
    as $n arrow.r oo$ through all positive integers,
$ #scale(x: 120%, y: 120%)[\(] V \( M_n \) \, c \( q \) n^(- 1 \/ 2) d_n \, mu_n #scale(x: 120%, y: 120%)[\)] med
  arrow.r.double med \( cal(T)_e \, d_e \, mu_e \) $

 in the Gromov–Hausdorff–Prokhorov topology on compact metric probability spaces modulo measure-preserving isometry.]
] <thm:main>

The root and FK decoration are forgotten in this convergence.
  We recall the correspondence estimate for this topology in Section 6,
  where the metric and measure comparison is completed.

=== 1.2 History and the ingredients of the proof <history-and-the-ingredients-of-the-proof>

The random-cluster representation of Fortuin and Kasteleyn connects percolation and Potts-type spin systems
  through a weight on edge subsets [9]. On a random planar map, the map itself is also sampled,
  so the cluster weight changes the underlying geometry. Sheffield’s inventory model encodes this joint randomness
  by two types of burgers, two fixed order types, and flexible orders that take the freshest available
  burger [18]. Its parameter $p = sqrt(q) \/ \( sqrt(q) + 2 \)$ places $q > 4$ exactly in the regime $p > 1 \/ 2$.
  Sheffield’s unconditioned walk theorem identifies the transition at $q = 4$:
  above it, the limiting inventory fluctuations are one-dimensional [18] Theorem 2.5.

The finite-volume CRT prediction appears in Sheffield’s appendix [18].
  Feng restates it as Conjecture 1.2 and proves an infinite-volume counterpart [8]:
  his Theorem 1.3 concerns an infinite FK map and convergence to an infinite continuum random tree in the
  #emph[local] Gromov–Hausdorff–Prokhorov topology. Theorem 1 realizes the finite-volume prediction in the compact
  topology, with the degree probability measure and all integer edge sizes.
  It is proved directly under the finite law, not deduced from the infinite-map limit.

The contrast with the other FK regimes is geometric. Companion results for $0 < q <
  4$ give Liouville quantum gravity sphere limits in the metric-measure and conformal settings [15,14];
  the critical companion treats the sphere and FK-map geometry at $q = 4$ [16].
  Above four the limit here is instead a tree. These companion results provide context and are not inputs to the proof.

The finite-map encoding has a longer combinatorial ancestry.
  Mullin enumerated tree-rooted maps [13], and Bernardi gave an explicit bijective account using shuffles of two
  parenthesis systems [3]. Bernardi’s embedding activities and subgraph correspondences relate these encodings to
  the Tutte polynomial [4,5]; Sheffield combines this structure with flexible orders to obtain the FK weights [18]
  Section 4. We rederive the needed finite identity with our dart-rooting and activity conventions in Section 2.
  The derivation fixes the exact conditioned map law, including loops, links,
  and the trivial map used in the generating function.

The inventory estimates below also build on specific earlier work.
  Sheffield analyzes the first backward surviving burger and computes the associated mean reduced length in [18]
  Section 3.1, Lemma 3.1. We use the same stationary covariance and stopping method to prove the strict drift
  estimate needed here. The reduced ladder excursions, balanced burger frequencies,
  positive flexible-order frequency, and enclosing empty intervals of [18] Section 3.3 are close predecessors of
  our cut construction. We use these ideas to obtain the uniform matching probability and generating-function
  lower bound needed for the finite-map argument; both estimates are proved in Section 3.

The block decomposition itself goes back to Tutte [21] Section 6.
  Addario-Berry makes its exact corner-indexed tree, including empty insertions and the $2 n + 1$ node count,
  explicit for uniform maps [1] Section 2 and Proposition 3.1.
  Stufler treats block-weighted maps in the general framework of enriched trees and describes their metrics in
  terms of corners [19] preprint Sections 6.1.5 and 6.8.3. Exponential tilting preserves a simply generated tree
  law conditional on its size; Janson gives the associated offspring moment formulas [10] Section 4.
  The CRT limits for subcritical graph classes of Panagiotou, Stufler, and Weller [17],
  and the block-map results in [19] preprint Theorems 6.60 and 6.62,
  establish the principle that graph distance is asymptotic to a constant times ancestral depth.
  Their analytic hypotheses supply exponential moments. Our endpoint argument establishes only finite offspring
  variance, so we retain a path estimate that requires no exponential or third moment.

A recent result of Stufler [20] Theorem 1.2 and Lemma 9.1 proves finite-variance degree-measure
  Gromov–Hausdorff–Prokhorov CRT limits for maps whose block weights are functions of the block’s edge count.
  It also uses the exact corner-to-degree correspondence. In that model blocks of a given size are uniform,
  and the metric argument uses diameter estimates for uniform nonseparable maps.
  The FK weight of a block instead depends on its shape, not only on its edge count.
  We must prove finite variance for these weights and control their particular metric marks.
  The quadratic inverse criterion in Section 4 and the finite-second-moment path argument in Section 5 provide
  those steps.

Finally, the limiting tree and the probabilistic tools have classical origins.
  Aldous introduced the Brownian continuum random tree and its finite-variance branching-process limit [2];
  Duquesne developed the stable-domain extension [7]. Marckert and Mokkadem proved joint depth-first process
  convergence to the same excursion under stronger moment hypotheses [12].
  We use Broutin and Marckert’s joint coding theorem and conditioned-degree lemma in a formulation that gives the
  height, contour, and walk limits jointly under a finite second moment, through every attainable size [6].
  The attainable tree sizes here are exactly the odd integers.
  The marked ancestral-path calculation uses the size-biased spine method of Lyons, Pemantle,
  and Peres [11] Section 2. The truncation that makes it uniform over all nodes is proved below.

=== 1.3 Proof roadmap <proof-roadmap>

Section 2 expresses the total weight of $n$-edge maps, up to an explicit exponential factor,
  as the probability that an independent-letter inventory word of length $2 n$ matches completely.
  Ignoring burger types turns such a word into a nonnegative simple-walk excursion.
  The resulting Catalan upper bound shows that the map generating function is finite at the parameter selected by
  the word law.

For a complementary lower bound, fix a boundary between two letters.
  Scan to its left until the number of burgers minus orders first reaches $h$,
  and to its right until that number first reaches $- h$. Section 3 uses strict inventory drift and comparisons of
  burger supply with order demand to prove that the whole interval matches with probability bounded below
  uniformly in $h$. Counting these intervals, together with a random-walk hitting-time estimate,
  gives a square-root lower bound for the derivative of the map series.

Section 4 decomposes a map into nonseparable pieces, called blocks, joined at vertices.
  A corner is the sector between successive incident darts; each block corner is an ordered attachment slot,
  with an empty insertion recorded by a leaf. The exact substitution equation for these attachments combines with
  the two word estimates to force criticality and finite offspring variance,
  without analytic continuation beyond the convergence endpoint.
  The resulting marked Galton–Watson tree has exactly $2 n + 1$ nodes for an $n$-edge map.

Finally, Section 5 combines the joint conditioned-tree coding limit with uniform laws for the distance marks
  accumulated along ancestral paths. Reversing the child order at every node gives a second depth-first walk;
  the two walks control large marks using only the second offspring moment.
  Section 6 converts this path estimate into a uniform comparison of map and tree distances.
  The corners push uniform nonroot-node mass to the degree measure exactly,
  which completes the metric probability-space comparison.

All constants may depend on the fixed parameter $q$. No uniform statement as $q$ approaches $4$ is asserted.

== 2 Words and strict drift <word:section>

Fix $q > 4$, and put

#[#set math.equation(numbering: n => "(2.1)")
 $ t = sqrt(q) \, wide p = frac(t, t + 2) \, wide u = frac(1 - p, 16) . $ <word:parameters>]

Thus $1 \/ 2 < p < 1$. For a rooted connected planar map $M$, define

#[#set math.equation(numbering: n => "(2.2)")
 $ a \( M \) = sum_(A subset.eq E \( M \)) t^(thin 2 k_M \( A \) + \| A \| - \| V \( M \) \| - 1) . $ <word:weight>]

The decoration-summed weight in (1.1) is $t thin a \( M \)$.
  Since this factor is independent of $M$, the marginal law of $M_n$ assigns probability proportional to
  $a \( M \)$ among rooted maps with $n$ edges. We also adjoin a trivial one-vertex, zero-edge map,
  whose weight is $1$, and set

$ a_n = sum_(M upright(" rooted planar map")\
\| E \( M \) \| = n) a \( M \) \, wide a_0 = 1 . $

A directed root is a distinguished dart; in particular, a loop has two darts.
  Rooted maps are counted up to root-preserving, orientation-preserving isomorphism.

=== 2.1 Reduction of words <reduction-of-words>

Consider independent letters from the alphabet

$ mono(b)_1 \, med mono(b)_2 \, med mono(o)_1 \, med mono(o)_2 \, med mono(F) $

with probabilities

#[#set math.equation(numbering: n => "(2.3)")
 $ bb(P) \( mono(b)_1 \) = bb(P) \( mono(b)_2 \) = 1 / 4 \, wide bb(P) \( mono(o)_1 \) = bb(P) \( mono(o)_2 \) =
   frac(1 - p, 4) \, wide bb(P) \( mono(F) \) = p / 2 . $ <word:letterlaw>]

The letters $mono(b)_i$ create burgers of type $i$. Read a word from left to right.
  An order $mono(o)_i$ removes the freshest remaining burger of type $i$,
  and a flexible order $mono(F)$ removes the freshest remaining burger of either type.
  An order with no eligible burger is unfilled; it is never served by a later burger.

The #emph[reduction] of a finite word is its list of unfilled orders, followed by its list of surviving burgers,
  with each list retaining its original chronology. A word is #emph[empty-reducing] if both lists are empty.
  Throughout, a list of burgers is ordered from oldest to freshest.

#thm([Lemma 2.1.])[
  (Reduction above an older supply).  #emph[Feed a finite word an arbitrary older list of burgers.
    Every match between two letters of the word is the same as when the word is read from an empty supply.
    The orders unfilled in the latter evaluation act on the older list in their original chronology,
    and the surviving burgers of the word remain above the surviving older burgers.
    In particular, finite words may be replaced by their reductions when concatenating them.
    Once a suffix has a surviving burger, its freshest survivor is unchanged by prepending further letters.]
] <word:reduction>

#proof[
  Call burgers created within the word new. At each order, an eligible new burger is fresher than every old burger
    and therefore has priority. Induction over the letters shows that the available new burgers evolve exactly as
    they do with empty initial supply. Only orders for which no eligible new burger exists can affect the old
    supply, and they do so in their original order. The new survivors lie above all remaining old burgers,
    which proves the first assertion and the concatenation rule.
    To obtain the last assertion, first evaluate the prepended word and then apply the rule to the original
    suffix. Its surviving burgers remain unchanged and lie above any extra surviving supply. ◻
]

=== 2.2 An exact counting identity <an-exact-counting-identity>

The tree-rooted-map encoding goes back to Mullin [13]; Bernardi gives its two-parenthesis formulation [3].
  The inventory encoding with flexible orders is due to Sheffield [18] Section 4.
  We give the finite weighted identity in the form needed here.
  Its proof uses a spanning-tree expansion determined by the embedding;
  related embedding-based activity expansions of the Tutte polynomial were introduced by Bernardi [4].
  The activity convention below is fixed explicitly, and the identity is proved directly.

#thm([Proposition 2.2.])[
  (Finite word identity).  #emph[For every integer $n gt.eq 0$, an independent word of length $2 n$ satisfies
#[#set math.equation(numbering: n => "(2.4)")
 $ bb(P) \( upright("the word is empty-reducing") \) = a_n u^n . $ <word:identity-equation>]

]
] <word:identity>

#proof[
  We give the bijection and the weight calculation, including their rooting conventions.
  ===== 2.2.1 Typed words and spanning trees. <typed-words-and-spanning-trees.>
  In an empty-reducing word, replace each flexible order by the fixed type of the burger it consumes.
    The resulting #emph[identified word] has two types of opening symbols, the burgers,
    and matching closing symbols, the orders. Each type separately is a Dyck word:
    its running balance is nonnegative, its final balance is zero, and matching follows its stack.
    Thus an identified word is a shuffle of two Dyck words.
  Such shuffles encode rooted planar maps with a distinguished spanning tree $cal(T)$.
    To see this, walk around a thickening of $cal(T)$ in the orientation of the sphere,
    starting with the root dart. At a tree dart, cross its edge and continue with the successor of the opposite
    dart in its vertex’s cyclic order. At a non-tree dart, continue with its successor at the same vertex.
    This tour visits every dart exactly once. The first and second occurrences of a tree edge give a type-1
    opening and closing; those of a non-tree edge give a type-2 opening and closing.
    The tree pairs are noncrossing in contour order. The non-tree pairs are also noncrossing,
    because their edges are disjoint arcs in the disk complementary to the thickened tree.
  Conversely, the type-1 symbols construct a plane tree by descending a new edge at an opening and returning at
    its closing. Place the type-2 stubs between successive tree steps in the given order,
    and join their matched pairs in the complementary disk. Noncrossing matching determines these arcs up to an
    orientation-preserving homeomorphism, so this constructs a unique planar map.
    The first symbol specifies its root dart. The same construction applies when there are no tree edges:
    all the stubs lie at one vertex. At the end/start seam, retain the indicated cyclic order of stubs.
    More explicitly, if $alpha$ pairs matching positions and $tau$ is the cyclic successor of positions,
    the reconstructed vertex successor is $tau compose alpha$ on tree darts and $tau$ on non-tree darts.
    This verifies that the two constructions are inverse, including the rooting convention.
  ===== 2.2.2 Flexible marks and activity. <flexible-marks-and-activity.>
  Say that two edges cross in the tour order when their occurrences alternate.
    Such edges necessarily have opposite types. Call an edge #emph[active] when it crosses no edge with a later
    first occurrence. For an edge whose occurrences are $a < b$,
    its closing order can be made flexible precisely when its burger is freshest among all burgers then present.
    The obstruction is an edge with occurrences $c < d$ satisfying $a < c < b < d$.
    Thus the eligible closings are exactly the active edges. Any subset of them can be marked flexible while
    retaining all matches: an induction through the word verifies that each changed order still consumes the same
    burger. Conversely, every flexible mark in a word must be eligible in its identified word.
  Every fixed identified word with $n$ matched pairs has probability $u^n$,
    since a burger and a fixed order contribute $1 / 4 frac(1 - p, 4) = u$.
    Replacing a fixed order by a flexible one multiplies its probability by
  $ frac(p \/ 2, \( 1 - p \) \/ 4) = frac(2 p, 1 - p) = t . $
  If $b \( M \, cal(T) \)$ denotes the number of active edges,
    the total probability of all its possible flexible markings is therefore
  #[#set math.equation(numbering: n => "(2.5)")
   $ u^n \( 1 + t \)^(b \( M \, cal(T) \)) . $ <word:markedweight>]
  ===== 2.2.3 The activity sum. <the-activity-sum.>
  We next prove directly that
  #[#set math.equation(numbering: n => "(2.6)")
   $ a \( M \) = sum_(cal(T) upright(" spanning tree of ") M) \( 1 + t \)^(b \( M \, cal(T) \)) . $ <word:activity>]
  Evaluate the same expression on each connected residual map encountered during edge deletion and contraction.
    Its weight does not require a choice of root. Splitting its subset sum according to the presence of an edge
    $e$ gives
  #[#set math.equation(numbering: n => "(2.7)")
   $ a \( M \) =
     cases(delim: "{", a \( M \/ e \) + a \( M \\ e \) \, & e upright(" is neither a bridge nor a loop") \,, \(
     1 + t \) a \( M \/ e \) \, & e upright(" is a bridge") \,, \( 1 + t \) a \( M \\ e \) \, & e
     upright(" is a loop") .) $ <word:deletion-contraction>]
  For a nonloop present edge, contraction decreases $\| A \|$ and $\|
    V \|$ by one and leaves the exponent unchanged. At a bridge,
    pairing the terms with and without $e$ gives relative factors $1$ and $t$.
    At a loop, including $e$ multiplies the corresponding deleted term by $t$.
    The terminal one-vertex map has weight one.
  Use the tour on the original darts to select the next edge in this recursion.
    When an edge is first reached, a contraction declares it a tree edge,
    and a deletion declares it a non-tree edge; thereafter use the corresponding tour rule whenever that dart is
    visited. At a bridge or loop the choice is forced. The next undecided edge depends only on previous choices.
    Indeed, contracted edges form a forest, and deletion of nonbridges preserves a connected residual graph,
    so every partial branch has a spanning-tree completion. Its tour agrees with the partial tour already
    traversed. Since a completed tree tour visits all darts, the partial tour cannot close before every edge has
    been decided. Consequently the recursion produces each spanning tree exactly once.
  Fix a completed branch with spanning tree $cal(T)$. A tree edge $e$ splits $cal(T)$ into two components.
    A non-tree edge joins these two components precisely when its occurrences alternate with those of $e$:
    the contour interval cut out by the pair for $e$ visits exactly one side of this tree cut.
    At the decision for $e$, earlier tree contractions cannot identify the two sides,
    and the earlier non-tree edges have been deleted. Hence $e$ is then a bridge if and only if no later non-tree
    edge crosses its cut, which is exactly its activity condition.
  Similarly, for a non-tree edge $e$, the tree edges crossing it in tour order are exactly those on the tree path
    joining its endpoints. At its decision, it has become a loop if and only if every edge of that path has
    already been contracted. This again says exactly that no crossing edge has a later first occurrence.
    The forced choices in the branch are therefore its active edges.
    Equation (2.7) assigns that branch weight $\( 1 + t \)^(b \( M \, cal(T) \))$, proving Equation (2.6).
  There are no hidden symmetry factors in these counts. An automorphism fixing the root dart and preserving the
    edge pairing and vertex cyclic orders fixes every dart, by connectedness.
    Thus summing Equation (2.5) over rooted map/tree pairs and using Equation (2.6) proves Equation (2.4).
    For $n = 0$, both sides equal one. ◻
]

#thm([Corollary 2.3.])[
  (Catalan upper bound).  #emph[For every $n gt.eq 0$,
#[#set math.equation(numbering: n => "(2.8)")
 $ a_n u^n lt.eq frac(1, 4^n \( n + 1 \)) binom(2 n, n) = O #scale(x: 120%, y: 120%)[\(] \( n + 1 \)^(- 3 \/ 2)
   #scale(x: 120%, y: 120%)[\)] . $ <word:catalan-equation>]

]
] <word:catalan>

#proof[
  Give a burger increment $+ 1$ and an order increment $- 1$.
    By Equation (2.3), these are independent symmetric increments.
    An empty-reducing word must have a nonnegative running sum and terminal sum zero:
    at every prefix, each order must already have consumed a distinct preceding burger.
    Reflection gives exactly $\( n + 1 \)^(- 1) binom(2 n, n)$ such sign sequences of length $2 n$.
    Apply Proposition 3, and then the usual central binomial estimate. ◻
]

=== 2.3 The first backward survivor <the-first-backward-survivor>

At a fixed boundary of an independent word, reveal letters backwards, prepending one letter at each step.
  Write $S_j$ for the sum of the first $j$ revealed burger-minus-order increments, with $S_0 = 0$. Let

#[#set math.equation(numbering: n => "(2.9)")
 $ J = inf { j gt.eq 1 : upright("the revealed suffix has a surviving burger") } . $ <word:J>]

At time $J$, the reduction consists of one burger and some number $K$ of fixed orders of the opposite type.
  To justify this assertion, note that before the triggering letter the suffix has no surviving burgers.
  That letter must therefore be a burger. By Lemma 2, it survives precisely when none of the suffix’s unfilled
  orders can consume it; these orders must all be fixed orders of the other type. In particular,

#[#set math.equation(numbering: n => "(2.10)")
 $ S_J = 1 - K . $ <word:stopped-sum>]

This stopping variable is the one studied in Sheffield’s inventory analysis [18] Section 3.1.
  His exact identity is $bb(E) \( 1 + K \) = 1 \/ p$ in the present regime.
  We prove the sufficient inequality $bb(E) K lt.eq 1 \/ \( 2 p \) < 1$ directly,
  retaining the covariance argument that makes the strictness visible.

#thm([Proposition 2.4.])[
  (Strict drift).  #emph[The stopping time $J$ is almost surely finite, and
#[#set math.equation(numbering: n => "(2.11)")
 $ bb(E) K lt.eq frac(1, 2 p) < 1 . $ <word:drift-equation>]

]
] <word:drift>

#proof[
  We first prove integrability, then exploit the type symmetry in a stationary word to improve the bound.
  ===== 2.3.1 A first integrability bound. <a-first-integrability-bound.>
  If $S_j = 1$, some burger must survive, so $J$ is no larger than the first time the simple symmetric walk $S$
    hits $1$. This hitting time is finite almost surely. For example, stopping between $-
    r$ and $1$ gives probability $r \/ \( r + 1 \)$ of reaching $1$ first,
    and letting $r$ increase proves the assertion. Thus $J < oo$ almost surely.
  Stop the walk at the bounded time $J and m$. Since its increments have mean zero, Equation (2.10) gives
  #[#set math.equation(numbering: n => "(2.12)")
   $ bb(E) \[ - S_m \; J > m \] = bb(E) \[ 1 - K \; J lt.eq m \] . $ <word:optional-stopping>]
  On ${ J > m }$ there are no surviving burgers, so $S_m lt.eq 0$.
    Consequently $bb(E) \[ K \; J lt.eq m \] lt.eq bb(P) \( J lt.eq m \)$.
    Monotone convergence yields $bb(E) K lt.eq 1$. This uses no finite-mean assumption on $J$.
  ===== 2.3.2 Typing flexible orders in a stationary word. <typing-flexible-orders-in-a-stationary-word.>
  Now take a two-sided independent sequence $\( omega_i \)_(i in bb(Z))$ with the letter law in Equation (2.3).
    At each boundary immediately before index $i$, inspect the past until its first surviving burger appears.
    The preceding argument and a countable intersection make this possible almost surely for every $i$.
    By Lemma 2, the freshest survivor cannot change when still older letters are prepended.
    Let $T_i in { + 1 \, - 1 }$ be its type sign, with type 1 positive and type 2 negative.
  Define the signed type increment $D_i$ by
  $ D_i =
    cases(delim: "{", + 1 \, & omega_i = mono(b)_1 upright(" or ") mono(o)_2 \,, - 1 \, & omega_i = mono(b)_2
    upright(" or ") mono(o)_1 \,, - T_i \, & omega_i = mono(F) .) $
  This construction is shift-covariant, so $\( D_i \)$ is stationary.
    Each $D_i$ is measurable with respect to raw letters at indices at most $i$.
    Moreover, its flexible typing agrees with every flexible match internal to any finite word:
    older supply cannot alter that match, by Lemma 2. Hence matched pairs cancel when signed increments are summed.
  Work at boundary $0$, and use $J \, K$ for its backward variables. Set
  $ T = T_0 \, wide D^(\( m \)) = sum_(i = - m)^(- 1) D_i . $
  On ${ J = j lt.eq m }$ the final $j$ letters have signed sum $T \( 1 + K \)$:
    the one burger and the $K$ opposite-type orders all contribute sign $T$.
    The earlier signed sum $sum_(i = - m)^(- j - 1) D_i$ depends only on raw letters earlier than $- j$.
    It is independent of the final $j$ letters, which determine ${ J = j }$ and $T$ on that event.
    Interchanging the two types preserves this event and reverses $T$,
    so $bb(E) \[ T upright(bold(1))_({ J = j }) \] = 0$. The earlier signed sum therefore contributes zero in
    expectation against $T upright(bold(1))_({ J = j })$.
  On ${ J > m }$ the reduced suffix consists only of orders.
    Internal matched pairs cancel, so $\| D^(\( m \)) \|$ is at most the number of unfilled orders, namely $-
    S_m$. Combining these observations with Equation (2.12) gives
  #[#set math.equation(numbering: n => "(2.13)")
   $ bb(E) \[ T D^(\( m \)) \] & gt.eq bb(E) \[ 1 + K \; J lt.eq m \] - bb(E) \[ - S_m \; J > m \]\
 & = 2 bb(E) \[ K \; J lt.eq m \] . $ <word:covariance>]
  Every variable in this calculation is integrable for fixed $m$; in particular, $K lt.eq m$ on ${ J lt.eq m }$.
  ===== 2.3.3 Nonnegative second moments force strict drift. <nonnegative-second-moments-force-strict-drift.>
  Let $V_m = bb(E) \[ \( D^(\( m \)) \)^2 \]$. Conditional on the raw past before index $0$,
    the nonflexible letters have mean signed contribution zero,
    while the flexible contribution has conditional mean $- \( p \/ 2 \) T$.
    Since $D_0^2 = 1$ and stationarity identifies the second moment of $sum_(i = - m)^0 D_i$ with $V_(m + 1)$, we obtain
  #[#set math.equation(numbering: n => "(2.14)")
   $ V_(m + 1) - V_m = 1 - p bb(E) \[ T D^(\( m \)) \] lt.eq 1 -
     2 p bb(E) \[ K \; J lt.eq m \] . $ <word:variance-increment>]
  If $2 p bb(E) K > 1$, the last expression is bounded above by a strictly negative constant for all sufficiently
    large $m$, by monotone convergence. Summing Equation (2.14) would then force some $V_m$ to be negative.
    This contradiction proves $bb(E) K lt.eq 1 \/ \( 2 p \)$,
    and $p > 1 \/ 2$ makes the bound strictly smaller than one. ◻
]

== 3 Ladder cuts and a coefficient lower bound <ladder:section>

Reduced excursions and balancing estimates for inventory words were developed by Sheffield [18] Section 3.3.
  We use these ideas to obtain a complete matching probability uniform in the ladder height.
  Counting successfully matched intervals will then give the coefficient estimate needed for finite-size
  conditioning. The piece lengths need not have finite mean;
  the arguments below integrate reduced lengths and use stationarity in the piece index.

Give each burger increment $+ 1$ and each order increment $- 1$.
  These increments form a simple symmetric random walk. A left ladder piece, with law $L$,
  is obtained by sampling letters backwards until their sum first reaches $+ 1$,
  then writing them in chronological order. A right ladder piece, with law $R$,
  is obtained by sampling forwards until the sum first reaches $- 1$. Both pieces are finite almost surely.
  Their net burger-minus-order counts are respectively $+ 1$ and $- 1$.

Fix a seam in a two-sided iid word. For $h gt.eq 1$, take the letters on its left up to the first backwards hit of
  $+ h$, and the letters on its right up to the first forwards hit of $- h$.
  For each fixed $h$, the two resulting words are independent concatenations of $h$ iid $L$-pieces and $h$ iid
  $R$-pieces. Indeed, successive level-hitting times restart the iid sampling;
  reversing the order of the $h$ left pieces preserves their joint iid law.
  Our quantitative goal is the following bound on the finite-map weights.

#thm([Proposition 3.1.])[
  (Coefficient lower bound).  #emph[There is $c > 0$ such that, for all real $x < 1$ sufficiently close to $1$,
#[#set math.equation(numbering: n => "(3.1)")
 $ sum_(n gt.eq 1) n a_n u^n x^n gt.eq c \( 1 - x \)^(- 1 \/ 2) . $ <ladder:coefficient-bound>]

]
] <ladder:lower>

To prove this bound, we first show that the entire seam interval reduces to the empty word with probability
  bounded below uniformly in $h$. We construct boundaries that give burger-only reductions on the left and
  orders-only reductions on the right, then compare their type counts.

=== 3.1 Stationary cuts <stationary-cuts>

We index pieces by $bb(Z)$, with boundary $i$ immediately before piece $i$.
  Thus the word between boundaries $a < b$ is the concatenation of pieces $a \, dots.h \, b - 1$.
  We first record the averaging fact needed for observations that can depend on infinitely many pieces.

#thm([Lemma 3.2.])[
  (Stationary averaging).  #emph[Let $\( Z_i \)_(i in bb(Z))$ be iid,
    and let $Y_i$ be the translates of an integrable measurable function of the entire sequence
    $\( Z_i \)_(i in bb(Z))$. Then the averages of $Y_i$ in each index direction converge almost surely to $bb(E)
    Y_0$. In particular, a shift-covariant set of boundaries having positive probability at boundary $0$ has
    positive limiting density in both directions. If $0$ belongs to this set,
    the last such boundary before $k$ is $k - o \( k \)$, and the first one after $- k$ is $- k + o \( k \)$.]
] <ladder:averaging>

#proof[
  An integrable function of a product sequence can be approximated in $L^1$ by bounded functions of finitely many
    coordinates. The translates of a bounded finite-window function split into finitely many iid subsequences.
    Their averages converge almost surely: for bounded centered iid variables,
    the fourth moment of a partial sum of length $r$ is $O \( r^2 \)$,
    so the deviation probabilities for their averages are summable.
  For completeness, the approximation errors are controlled by the following maximal inequality for any stationary
    nonnegative sequence $\( U_i \)$:
  #[#set math.equation(numbering: n => "(3.2)")
   $ bb(P) (sup_(r gt.eq 1) 1 / r sum_(i = 1)^r U_i > eta) lt.eq frac(bb(E) U_0, eta) \, wide
     eta > 0 . $ <ladder:maximal>]
  To prove it, first allow witnessing intervals of length at most $s$.
    Among violating starts in $1 \, dots.h \, m$, select an interval at the first such start,
    skip the starts it covers, and repeat. The selected intervals are disjoint, cover every violating start,
    and lie in $1 \, dots.h \, m + s$. Their sum exceeds $eta$ times their total length,
    which is at least the number of violating starts. Taking expectations, dividing by $m$,
    and then letting $m$ and $s$ tend to infinity proves Equation (3.2).
    Apply this inequality to the absolute errors of the finite-window approximations.
    As their $L^1$ errors tend to zero, the almost-sure convergence of the averages follows.
    Reversing the indices proves the other direction.
  Apply the result to the indicator of the boundary set. If $b_k lt.eq
    k$ is its last boundary before $k$ and $d > 0$ is its density,
    the absence of boundaries between $b_k$ and $k$ gives $d \( k - b_k \) = o \( k \) + o \( b_k \) = o \( k \)$.
    The negative-index assertion is identical. ◻
]

#prodef([Definition 3.3.])[
  For a two-sided iid sequence of $L$-pieces, a boundary $a$ is an #emph[$L$-cut] if, for every $b > a$,
    the word between $a$ and $b$ has no unfilled orders when evaluated from an empty supply.
    For a two-sided iid sequence of $R$-pieces, a boundary $b$ is an #emph[$R$-cut] if, for every $a < b$,
    the word between $a$ and $b$ leaves no surviving burgers.
]

#thm([Lemma 3.4.])[
  (Positive probability of cuts).  #emph[Each fixed boundary has positive probability of being an $L$-cut and
    positive probability of being an $R$-cut, in the respective piece laws.
    Consequently both cut sets have positive limiting densities in both index directions.]
] <ladder:cuts>

#proof[
  We use the strict drift estimate differently for the two cut probabilities.
  ===== 3.1.1 Shortening left pieces. <shortening-left-pieces.>
  Recall the backwards stopping time $J$ and the integer $K$ from Proposition 5.
    At time $J$, the reduced word consists of one burger and $K$ fixed orders of the opposite type,
    and $bb(E) K < 1$. Parse backwards from the end of an $L$-piece using successive independent copies of this
    stopping rule. Before the end of any parsing step its relative sum is nonpositive:
    a positive sum would force a surviving burger and hence an earlier stop.
    The first hit of $+ 1$ therefore occurs at a parsing-step endpoint.
    The number $N_L$ of steps is the first hit of $1$ by a walk whose iid increments have law $1 - K$.
    Writing $mu = 1 - bb(E) K > 0$, bounded stopping gives
  $ mu thin bb(E) \( N_L and m \) = bb(E) [sum_(j = 1)^(N_L and m) \( 1 - K_j \)] lt.eq 1 . $
  The bound holds because the increments are at most $1$ and the walk is stopped on its first hit of $1$.
    Thus $bb(E) N_L lt.eq 1 \/ mu < oo$.
  Replace each parsing step by its reduction and put these reductions back in chronological order.
    Lemma 2 allows this replacement inside any larger word, including with an older supply of burgers.
    The resulting shortened $L$-piece has only burgers and fixed orders, and its length $ell$ satisfies
  #[#set math.equation(numbering: n => "(3.3)")
   $ bb(E) ell = bb(E) [sum_(j = 1)^(N_L) \( 1 + K_j \)] = bb(E) N_L thin bb(E) \( 1 + K \) < oo .
     $ <ladder:short-length>]
  Here reaching parsing step $j$ depends only on the preceding steps, which justifies the second equality.
    The two net type counts in a shortened piece are integrable, sum to $1$,
    and have the same law under exchange of the types. Each therefore has expectation $1 \/ 2$.
  Across successive forward $L$-pieces, the net count of each type has positive drift.
    Within a shortened piece, the deviation from its initial count is at most its length.
    Moreover, for iid lengths of finite mean, $ell_i \/ i arrow.r 0$ almost surely,
    by the integrable-tail bound and Borel–Cantelli. The running infimum of each type count over all shortened
    letters is therefore finite almost surely. A sufficiently large deterministic starting supply of both types
    prevents any unfilled order forever with positive probability.
    A finite prefix of prescribed single-burger $L$-pieces creates this supply with positive probability,
    independently of the remaining tail. Starting with that prefix and an empty supply proves positive probability
    of an $L$-cut at boundary $0$. Only the shortened length in Equation (3.3) was integrated;
    no moment of the original ladder-piece length is needed.
  ===== 3.1.2 Reversing right pieces. <reversing-right-pieces.>
  For an $R$-cut, we will show that a backward scan from a piece endpoint has positive probability of never
    revealing a surviving burger. Scan the letters backwards from boundary $0$ in a two-sided iid $R$-piece
    sequence. Let $S_j$ be the burger-minus-order sum of the first $j$ scanned letters.
    This scan has a different law from ordinary iid backwards sampling.
    The density of its first $m$ letters relative to ordinary iid backwards sampling is
  #[#set math.equation(numbering: n => "(3.4)")
   $ 2 \( - S_m \) thin upright(bold(1))_({ S_j < 0 upright(" for ") 1 lt.eq j lt.eq m }) . $ <ladder:reverse-density>]
  To see this, use the last $h$ pieces for any $h > m$. Their concatenation is an iid word stopped at its first
    hit of $- h$. Write $W$ for its forward walk, started at $0$, and $tau$ for this hitting time.
    The reversed sums satisfy
  $ S_j = W_tau - W_(tau - j) = - h - W_(tau - j) \, wide 1 lt.eq j lt.eq m . $
  Since $W$ stays above $- h$ before $tau$, a possible final string read backwards has strictly negative partial
    sums. If its total is $- r$, its chronological start is at $- h + r$, where $1 lt.eq r lt.eq m < h$.
    Before killing at $- h$, the expected number of visits to this level is $2 r$:
    the walk visits it almost surely, and at each departure the probability of being killed before returning is
    $1 \/ \( 2 r \)$. This last probability is one half times the elementary probability $1 \/
    r$ of hitting the lower endpoint before returning from its adjacent site;
    a departure upwards returns almost surely. Each visit followed by the specified admissible string ends exactly
    at the killing time. Summing over visits and multiplying by the iid probability of that string proves
    Equation (3.4).
  ===== 3.1.3 Removing the terminal order. <removing-the-terminal-order.>
  The first backwards letter is necessarily an order. After removing it, and restarting the sums at $0$,
    the remaining scan has finite-dimensional density
  #[#set math.equation(numbering: n => "(3.5)")
   $ \( 1 - S_j \) thin upright(bold(1))_({ max_(1 lt.eq i lt.eq j) S_i lt.eq 0 }) $ <ladder:remainder-density>]
  relative to iid backwards sampling. Indeed, the first order contributes $- 1$;
    factoring its conditional order law out of Equation (3.4) leaves exactly Equation (3.5).
    Explicitly, the original probability of a specified order is $1 / 2$ times its conditional order probability;
    the $1 / 2$ cancels the factor $2$ in the density. The remaining density has no dependence on the removed
    order’s type.
  Apply the stopping rule $J$ to this remaining scan. Under ordinary sampling, on ${ J =
    j }$ the previous sums are nonpositive and $S_j = 1 - K$. The density in Equation (3.5) on this event is $K$:
    when $K = 0$ the sign restriction fails and the density is zero; when $K gt.eq 1$ it is $1 - S_j = K$.
    Summing over the disjoint events ${ J = j }$ shows that the probability, under the remaining-scan law,
    of ever revealing a surviving burger is $bb(E) K$. This is a sum of finite-cylinder identities over disjoint
    finite values of $J$, so countable additivity suffices; no optional stopping of an unbounded density process
    or finite mean of $J$ is used. With positive probability $1 - bb(E) K$,
    every finite scanned word instead leaves no burgers. Appending the removed terminal order cannot create a
    burger. In particular, every whole-piece word ending at boundary $0$ leaves no burgers,
    so this event implies an $R$-cut there.
  Finally the cut indicators are shift-covariant functions of iid piece sequences.
    Their positive densities follow from Lemma 7. ◻
]

=== 3.2 Stationary outputs and matching <stationary-outputs-and-matching>

Between consecutive $L$-cuts $a < b$, the reduction is a burger-only word of length $b - a$,
  since each piece has net count $+ 1$. Assign these burgers in chronological order to the slots $a \, dots.h \,
  b - 1$. The cut set is unbounded in both directions almost surely,
  so this defines a stationary sequence of single burgers on all slots.
  Similarly, between consecutive $R$-cuts $a < b$, assign the orders-only reduction of length $b -
  a$ to these slots in chronological order. Both output sequences are measurable shift-covariant functions of
  their respective iid piece sequences; the cuts need not be independent.

The matching criterion below identifies the counts we must control:
  the oldest available burgers and the orders that must still be filled at the end.

#thm([Lemma 3.5.])[
  (Bottom supply and terminal demand).  #emph[Let a burger stack and an order word both have length $h$.
    Suppose that, for every $1 lt.eq k lt.eq h$ and each type $a$,
    the number of fixed type-$a$ orders among the terminal $k$ orders is at most the number of type-$a$ burgers
    among the original bottom $k$ burgers. Then the greedy inventory rule matches all orders and leaves no burgers.]
] <ladder:matching>

#proof[
  Suppose a first failure occurs, necessarily at a fixed order of some type $a$:
    before a first failure there is one burger per remaining order, so a flexible order can always be filled.
    If no earlier flexible order consumed type $a$, all earlier consumption of that type was fixed.
    The hypothesis at $k = h$ then rules out failure.
  Otherwise consider the last earlier flexible consumption of type $a$.
    Let it remove the burger at position $j$ in the original stack, counting from the bottom,
    and let $k$ be the number of burgers immediately after this removal.
    While that burger was present, no fixed type-$a$ order could remove an older type-$a$ burger,
    and no flexible order could remove anything older than it.
    Hence every original type-$a$ burger below position $j$ is still present just after this removal.
    Because a flexible order takes the freshest burger overall, every remaining burger is below position $j$;
    in particular $k lt.eq j - 1$. The remaining type-$a$ supply is therefore at least its count in the original
    bottom $k$ burgers. By hypothesis this suffices for all fixed type-$a$ orders in the remaining suffix of
    length $k$. Until the alleged failure, no further flexible order consumes type $a$,
    by our choice of the last such consumption. A failure is impossible. ◻
]

We now obtain uniform estimates for these supply and demand counts from the stationary outputs.

#thm([Lemma 3.6.])[
  (Output frequencies).  #emph[Almost surely, each burger type has frequency $1 \/
    2$ in the stationary $L$-output. The stationary $R$-output has almost-sure frequencies $\( 1 - rho \) \/
    2 \, \( 1 - rho \) \/ 2 \, rho$ for the two fixed types and the flexible orders, respectively,
    for a deterministic $rho > 0$.]
  #emph[On the event that $0$ is an $L$-cut, let $B_a \( h \, k \)$ count type-$a$ burgers among the bottom $k$
    burgers of the reduction of the $h$ pieces starting at $0$, where $1 lt.eq k lt.eq h$.
    Then, almost surely on this event,
#[#set math.equation(numbering: n => "(3.6)")
 $ lim_(k arrow.r oo) sup_(h gt.eq k) lr(|frac(B_a \( h \, k \), k) - 1 / 2|) = 0 \, wide a = 1 \,
   2 . $ <ladder:left-counts>]

 On the event that $0$ is an $R$-cut, let $C_a \( h \, k \)$ count fixed orders of type $a$ among the terminal $k$
   residual orders of the $h$ pieces ending at $0$. Then, almost surely on this event,
#[#set math.equation(numbering: n => "(3.7)")
 $ lim_(k arrow.r oo) sup_(h gt.eq k) lr(|frac(C_a \( h \, k \), k) - frac(1 - rho, 2)|) = 0 \, wide a = 1 \,
   2 . $ <ladder:right-counts>]

]
] <ladder:frequencies>

#proof[
  Type exchange symmetry and Lemma 7 give the claimed $L$-frequencies.
    The event of an $R$-cut at $0$ depends only on pieces before $0$.
    Independently requiring piece $0$ to be the single letter $F$, an event of probability $p \/ 2 > 0$,
    makes boundary $1$ a cut as well and places an $F$ in output slot $0$. Consequently
  $ rho gt.eq bb(P) \( 0 upright(" is an ") R upright("-cut") \) p / 2 > 0 . $
  Stationary averaging and type exchange symmetry give the remaining $R$-frequencies.
  For Equation (3.6), let $b_k$ be the last $L$-cut at or before $k$, on the event that $0$ is a cut.
    It satisfies $k - b_k = o \( k \)$. For every $h gt.eq k$,
    the bottom $b_k$ surviving burgers are exactly the stationary output in slots $0 \, dots.h \, b_k - 1$:
    the pieces after the cut $b_k$ require no older supply and cannot remove these burgers, by Lemma 2.
    Thus the bottom-$k$ count differs from the corresponding stationary prefix count by at most $k - b_k$,
    uniformly in $h$. This proves Equation (3.6).
  For Equation (3.7), take the first $R$-cut $c_k$ at or after $- k$; then $c_k = - k + o \( k \)$.
    For every $h gt.eq k$, the whole-piece word from $- h$ to $c_k$ leaves no burgers,
    by the definition of the cut at $c_k$. Its residual orders cannot be served by later burgers and do not alter
    the reduction of the suffix from $c_k$ to $0$. The terminal $-
    c_k$ orders therefore agree exactly with stationary output in these slots.
    The possible discrepancy among the terminal $k$ orders is at most $k + c_k = o \( k \)$, independently of $h$.
    This proves Equation (3.7). ◻
]

=== 3.3 Matching at a seam <matching-at-a-seam>

#thm([Proposition 3.7.])[
  (Uniform success at a seam).  #emph[There is $delta > 0$, depending only on $p$,
    such that for every integer $h gt.eq 1$ the seam interval formed by the backwards hit of $+
    h$ and the forwards hit of $- h$ reduces to the empty word with probability at least $delta$.]
] <ladder:uniform>

#proof[
  Choose
  $ frac(1 - rho, 2) < alpha < 1 / 2 . $
  By Lemmas 9 and 11, for a sufficiently large deterministic integer $B$,
    each of the following events has positive probability in its respective stationary piece sequence:
  $ cal(G)_L =  & { 0 upright(" is an ") L upright("-cut, and ") B_a \( h \, k \) gt.eq
    alpha k upright(" for ") a = 1 \, 2 upright(" and all ") h gt.eq k gt.eq B } \,\
cal(G)_R =  & { 0 upright(" is an ") R upright("-cut, and ") C_a \( h \, k \) lt.eq alpha k upright(" for ") a =
  1 \, 2 upright(" and all ") h gt.eq k gt.eq B } . $
  Indeed, increasing $B$ makes each event exhaust its positive-probability cut event, up to a null set.
    Take an integer $D gt.eq B$ with $alpha D gt.eq B$. The event $cal(G)_R$ is measurable with respect to the
    past pieces, so requiring the next $D$ pieces, indexed $0 \, dots.h \, D - 1$,
    to be single flexible orders preserves positive probability.
  Use independent stationary $L$- and $R$-sequences. For the left word take $h$ pieces starting at $0$,
    and for the right word take $h$ pieces ending at $D$. Unconditionally these have exactly the independent
    ladder-piece laws of the seam interval for each fixed $h$.
    The event consisting of $cal(G)_L$, $cal(G)_R$, and the prescribed $D$ flexible pieces has probability
  $ delta = bb(P) \( cal(G)_L \) bb(P) \( cal(G)_R \) \( p \/ 2 \)^D > 0 \, $
  independent of $h$.
  On this event the left word reduces to $h$ burgers. The right word reduces to $h$ orders:
    it is all flexible if $h lt.eq D$; otherwise it is the orders-only reduction of $h - D$ pieces ending at $0$,
    followed by $D$ flexible orders. Consider its terminal $k$ orders, with $k lt.eq h$.
    If $k lt.eq D$, their fixed-type counts vanish. If $k > D$ and $k - D gt.eq B$,
    each fixed-type count is at most $alpha \( k - D \) lt.eq alpha k$ by $cal(G)_R$.
    If $0 < k - D < B$, each count is at most $B lt.eq alpha D lt.eq alpha k$.
    In the last two cases $k gt.eq B$, so $cal(G)_L$ supplies at least $alpha
    k$ burgers of each type in the bottom $k$ positions. Thus every inequality in Lemma 10 holds,
    including the small values of $k$, and the interval reduces to the empty word. ◻
]

=== 3.4 Counting intervals through a seam <counting-intervals-through-a-seam>

#proof[
  Let $I_h$ be the seam interval in Proposition 12. Reflection for the simple symmetric walk bounds the hitting
    time of a level $h$ by
  $ bb(P) \( tau_h > m \) lt.eq C_0 frac(h + 1, sqrt(m)) . $
  Consequently the two hitting lengths defining $I_h$, divided by $h^2$, are tight uniformly over $h gt.eq 1$.
    Choose a deterministic $A < oo$ large enough that
  $ bb(P) #scale(x: 120%, y: 120%)[\(] I_h upright(" reduces to the empty word and ") \| I_h \| lt.eq
    A h^2 #scale(x: 120%, y: 120%)[\)] gt.eq delta \/ 2 \, wide h gt.eq 1 . $
  This follows by subtracting the length-tail probabilities from the success probability;
    no independence between length and success is needed. The intervals $I_h$ are distinct as $h$ varies,
    since the first-hitting endpoints move strictly with the level.
  There are exactly $2 n - 1$ deterministic intervals of length $2 n$ using letters on both sides of the seam.
    Every empty-reducing word has even length. By Proposition 3 and Tonelli’s theorem,
    the expected sum of $x^(\| I \| \/ 2)$ over all empty-reducing finite intervals through the seam is
  $ sum_(n gt.eq 1) \( 2 n - 1 \) a_n u^n x^n . $
  For $H = floor.l \( 1 - x \)^(- 1 \/ 2) floor.r$, the distinct intervals $I_1 \, dots.h \, I_H$ therefore give
  $ sum_(n gt.eq 1) \( 2 n - 1 \) a_n u^n x^n & gt.eq delta / 2 sum_(h = 1)^H x^(A h^2 \/ 2)\
 & gt.eq delta / 2 H thin x^(A \/ \( 2 \( 1 - x \) \)) . $
  The last factor is bounded away from zero as $x arrow.t 1$, while $H asymp \( 1 - x \)^(- 1 \/ 2)$.
    Since $2 n - 1 lt.eq 2 n$, this proves Equation (3.1). ◻
]

== 4 The critical block tree <block:section>

We now pass from the word estimates to an exact representation of the finite map law.
  A #emph[corner] of a nonempty map is a sector between successive darts at a vertex.
  Thus a map with $m$ edges has $2 m$ corners, including two at a vertex carrying a single loop.

=== 4.1 Decomposition at corners <decomposition-at-corners>

The decomposition of a rooted map into a root block and corner insertions goes back to Tutte [21] Section 6.
  Addario-Berry makes its even-offspring tree representation explicit for uniform maps [1] Section 2 and
  Proposition 3.1; the block-weighted form belongs to Stufler’s enriched-tree framework [19] preprint
  Section 6.1.5. We prove the rooted version here to keep the one-link and one-loop conventions, trivial inserts,
  and exact finite weights explicit.

Our nontrivial #emph[blocks] are the rooted one-loop map and the rooted nonempty connected loopless maps with at
  least two vertices and no separating vertex. The one-link map is included:
  deleting either of its vertices leaves a single vertex. Write $b_m$ for the total weight $a \( B \)$ of the
  blocks with $m$ edges. In particular,

#[#set math.equation(numbering: n => "(4.1)")
 $ b_1 = 2 \( 1 + t \) > 0 . $ <block:one-edge>]

#thm([Lemma 4.1.])[
  (Rooted corner substitution).  #emph[Every nontrivial rooted planar map is uniquely obtained from a rooted block
    by inserting a rooted map, possibly trivial, in each of its corners.
    A nonempty insert is attached at the origin of its root dart.
    Moreover, $a$ is multiplicative when two maps are joined at one vertex. Consequently, with
$ T \( z \) = sum_(n gt.eq 0) a_n z^n \, wide Phi \( y \) = 1 + sum_(m gt.eq 1) b_m y^m \, $

 there is an identity of formal power series
#[#set math.equation(numbering: n => "(4.2)")
 $ T \( z \) = Phi #scale(x: 120%, y: 120%)[\(] z T \( z \)^2 #scale(x: 120%, y: 120%)[\)] . $ <block:equation>]

]
] <block:decomposition>

#proof[
  Suppose first that the root is not a loop. Take the maximal loopless block containing the root edge.
    It is unique: the union of two connected subgraphs without a separating vertex that share an edge again has no
    separating vertex. An exterior path joining two different vertices of this block,
    with interior disjoint from it, could be added without producing a separating vertex.
    Thus every component outside the block attaches at one block vertex.
  Each face boundary of a loopless block visits a given vertex at most once.
    Indeed, if two distinct sectors at a vertex belonged to the same face,
    a simple curve through that face joining the sectors and closed at the vertex would separate incident edges on
    its two sides. Connectivity after deleting the vertex rules this out.
    The assertion also holds for a one-link block. Planarity therefore places each outside component in a unique
    corner of its attachment vertex. Extra loops at a block vertex lie in such corners as well.
    Group all parts in each corner into one insert.
  If the root is a loop, take that loop as the root block. Its two sides are its two corners,
    and the parts on either side form the two inserts. In both cases a nonempty insert is rooted at the first
    outgoing dart in its corner sector, in the oriented cyclic order.
    Conversely, glue an arbitrary rooted insert at each corner,
    identifying its root origin with the corner vertex and starting its cyclic order with its root dart.
    This reconstructs the map and its rotations uniquely. Each insertion meets the root block at only one vertex,
    so it cannot enlarge that block. These constructions are inverse.
  Rooting also identifies the corners individually. Indeed,
    an automorphism fixing a root dart and preserving vertex rotations and edge reversal fixes all darts by
    connectedness. We may thus choose a deterministic order of the $2 m$ corners of every rooted block,
    with no symmetry divisor.
  For the weight claim, join $M_1$ and $M_2$ at one vertex and write an edge subset as $A_1 union A_2$.
    The number of components and the number of vertices are, respectively,
  $ k_(M_1) \( A_1 \) + k_(M_2) \( A_2 \) - 1 \, wide \| V \( M_1 \) \| + \| V \( M_2 \) \| - 1 . $
  The exponent $2 k + \| A \| - \| V \| - 1$ is therefore the sum of the two exponents.
    Summing independently over $A_1 \, A_2$ proves multiplicativity.
    A size-$m$ root block contributes $b_m z^m T \( z \)^(2 m)$; adding the trivial map gives (4.2). ◻
]

=== 4.2 An endpoint criterion for finite variance <an-endpoint-criterion-for-finite-variance>

An $m$-edge block supplies $2 m$ child slots, so the first two offspring moments will be controlled by the first
  two derivatives of the block series. The next lemma extracts the required endpoint identities and bounds from
  the word coefficient estimate.

#thm([Lemma 4.2.])[
  (Quadratic inverse criterion).  #emph[Suppose $T$ and $Phi$ have nonnegative coefficients and constant term $1$,
    and satisfy (4.2). Let $u > 0$ satisfy $T \( u \) < oo$, and suppose that, for some $c > 0$,
#[#set math.equation(numbering: n => "(4.3)")
 $ sum_(n gt.eq 1) n a_n u^n x^n gt.eq c \( 1 - x \)^(- 1 \/ 2) wide
   upright("for all ") x < 1 upright(" sufficiently close to ") 1 . $ <block:lower-assumption>]

 Put $tau = T \( u \)$ and $v = u tau^2$. Then
#[#set math.equation(numbering: n => "(4.4)")
 $ Phi \( v \) = tau \, wide 2 v Phi' \( v \) = Phi \( v \) \, wide Phi'' \( v \) < oo \, $ <block:critical-equations>]

 where endpoint derivatives denote the corresponding nonnegative series.]
] <block:critical>

#proof[
  Integrating (4.3) gives, for $z < u$ close to $u$,
  #[#set math.equation(numbering: n => "(4.5)")
   $ tau - T \( z \) = integral_(z \/ u)^1 1 / x sum_(n gt.eq 1) n a_n u^n x^n thin upright(d) x gt.eq
     c_1 sqrt(u - z) . $ <block:square-root-gap>]
  All integrands are nonnegative, so monotone convergence justifies the endpoint integration. The map
  $ y \( z \) = z T \( z \)^2 $
  is strictly increasing from $\[ 0 \, u \)$ onto $\[ 0 \, v \)$.
    Nonnegative series substitution extends (4.2) to these real arguments and then, by monotone convergence,
    to $Phi \( v \) = tau$. In particular $Phi$ is finite at $v$ and analytic below it.
  The function $f \( y \) = y \/ Phi \( y \)^2$ is the inverse of $y \( z \)$ on these intervals. Hence
  $ f' \( y \) = frac(Phi \( y \) - 2 y Phi' \( y \), Phi \( y \)^3) gt.eq 0 wide \( 0 < y < v \) . $
  It follows that $Phi' \( y \) lt.eq Phi \( y \) \/ \( 2 y \)$ near $v$.
    Since the derivative series has nonnegative coefficients, $Phi' \( v - \)$ exists and is finite. Furthermore,
  $ v - y \( z \) = \( u - z \) tau^2 + z #scale(x: 120%, y: 120%)[\(] tau^2 -
    T \( z \)^2 #scale(x: 120%, y: 120%)[\)] gt.eq c_2 #scale(x: 120%, y: 120%)[\(] tau -
    T \( z \) #scale(x: 120%, y: 120%)[\)] $
  near $u$. Together with (4.5), this yields
  #[#set math.equation(numbering: n => "(4.6)")
   $ 0 lt.eq u - f \( y \) lt.eq C \( v - y \)^2 wide \( y arrow.t v \) . $ <block:quadratic>]
  The displayed formula for $f'$ has a finite limit at $v$; the secant bound (4.6) forces that limit to be zero.
    This proves $2 v Phi' \( v \) = Phi \( v \)$.
  For $y < v$,
  $ f'' \( y \) = - frac(4 Phi' \( y \), Phi \( y \)^3) - frac(2 y Phi'' \( y \), Phi \( y \)^3) +
    frac(6 y Phi' \( y \)^2, Phi \( y \)^4) . $
  If $Phi'' \( v \) = oo$, the middle term would force $f'' \( y \) arrow.r - oo$.
    For every $K > 0$, sufficiently near $v$ we would then have $f'' \( y \) lt.eq - K$.
    Integrate first on an interior interval $\[ y \, r \]$ and let $r arrow.t v$, using $f' \( v - \) = 0$,
    to obtain $f' \( y \) gt.eq K \( v - y \)$. A second integration, using $f \( v - \) = u$, gives
  $ u - f \( y \) gt.eq K / 2 \( v - y \)^2 $
  there, contradicting (4.6) when $K > 2 C$. Thus $Phi'' \( v \) < oo$. ◻
]

By Corollary 4, $T \( u \) < oo$. Proposition 6 supplies (4.3), so Lemma 14 applies.
  Notice that it does not require analytic continuation of $Phi$ across $v$.

=== 4.3 The marked branching law <the-marked-branching-law>

The exponential tilt below is the standard passage from simply generated trees to a conditioned Galton–Watson law;
  see Janson [10] Section 4. The preceding lemma supplies the criticality and moment properties for these
  particular FK weights.

Define a distribution supported on even integers by

#[#set math.equation(numbering: n => "(4.7)")
 $ p_(2 m) = frac(b_m v^m, Phi \( v \)) quad \( m gt.eq 0 \) \, wide b_0 = 1 \, wide p_(2 m + 1) =
   0 . $ <block:offspring>]

If $xi$ has this distribution, then

#[#set math.equation(numbering: n => "(4.8)")
 $ bb(E) xi = 1 \, wide sigma^2 := "Var" \( xi \) = 1 + frac(4 v^2 Phi'' \( v \), Phi \( v \)) in \( 0 \, oo \) .
   $ <block:moments>]

Here normalization, criticality, and finiteness follow from (4.4); positivity also follows from $p_0 \, p_2 > 0$.

Construct a plane Galton–Watson tree with offspring law (4.7).
  Independently at each node with $2 m > 0$ children, assign a rooted block $B$ of size $m$ with probability
  $a \( B \) \/ b_m$. The children occupy the block’s ordered corners. A leaf represents a trivial insert.
  Iterating the corner substitutions recovers a rooted map.
  We call the origin of a block’s root dart its #emph[pole]; the pole of a trivial insert is its attachment vertex.

#thm([Proposition 4.3.])[
  (Exact finite representation).  #emph[The marked tree conditioned to have $N = 2 n +
    1$ nodes produces exactly the map marginal of (1.1). Every such size is attainable.]
] <block:finite-law>

#proof[
  A block of size $m$ gives $2 m$ children. Thus a map with $n$ edges corresponds to a tree with $N - 1 =
    2 n$ child slots. The probability factor for a node carrying a prescribed block $B$ is
  $ frac(b_m v^m, Phi \( v \)) frac(a \( B \), b_m) = frac(v^m a \( B \), Phi \( v \)) . $
  For a leaf it is $1 \/ Phi \( v \)$. Multiplication over all nodes and Lemma 13 give the unconditioned probability
  $ Phi \( v \)^(- N) v^n a \( M \) . $
  At fixed $N = 2 n + 1$ the first two factors are constant,
    so the conditional map law is proportional to $a \( M \)$, as required.
    Since $p_0 \, p_2 > 0$, a full binary tree with $n$ internal nodes and all internal blocks chosen as one-link
    maps has positive probability. This gives an admissible tree for every $n gt.eq 1$. ◻
]

Figure 1 illustrates why trivial inserts must be retained as leaves:
  they record corners even when they add no map edges.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-3.5, 0.4), (-2.05, 0.4), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((-2.05, 0.4), (-0.6, 0.4), stroke: (thickness: 0.8pt, miter-limit: 10))
  bezier((-3.5, 0.4), (-3.5, 0.4), (-4.35, 1.45), (-2.65, 1.45), stroke: (thickness: 0.8pt, miter-limit: 10))
  bezier((-0.6, 0.4), (-0.6, 0.4), (-1.45, 1.45), (0.25, 1.45), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((-3.5, 0.4), radius: 0.0635, fill: black, stroke: none)
  circle((-2.05, 0.4), radius: 0.0635, fill: black, stroke: none)
  circle((-0.6, 0.4), radius: 0.0635, fill: black, stroke: none)
  content((-3.5, 0.2589), [#text(size: 9pt)[$u$]], anchor: "north", padding: 0.1176cm)
  content((-2.05, 0.2589), [#text(size: 9pt)[$v$]], anchor: "north", padding: 0.1176cm)
  content((-0.6, 0.2589), [#text(size: 9pt)[$w$]], anchor: "north", padding: 0.1176cm)
  content((-2.05, -0.55), [#text(size: 9pt)[$( deg (u), deg (v), deg (w))=(3,2,3)$]])
  content((-2.05, 1.85), [#text(size: 9pt)[map: four edges]])
  content((2.8, 1.55), [#text(size: 9pt)[$u$]])
  content((1.65, 0.7), [#text(size: 9pt)[$u$]])
  content((3.95, 0.7), [#text(size: 9pt)[$v$]])
  content((1.25, -0.1), [#text(size: 9pt)[$u$]])
  content((2.05, -0.1), [#text(size: 9pt)[$u$]])
  content((3.5, -0.1), [#text(size: 9pt)[$v$]])
  content((4.4, -0.1), [#text(size: 9pt)[$w$]])
  content((4, -0.9), [#text(size: 9pt)[$w$]])
  content((4.8, -0.9), [#text(size: 9pt)[$w$]])
  line((2.596, 1.399), (1.854, 0.8508), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((3.004, 1.399), (3.746, 0.8508), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.553, 0.5069), (1.347, 0.09306), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.747, 0.5069), (1.953, 0.09306), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((3.841, 0.5069), (3.609, 0.09306), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((4.059, 0.5069), (4.291, 0.09306), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((4.303, -0.2931), (4.097, -0.7069), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((4.497, -0.2931), (4.703, -0.7069), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.8, 1.814), [#text(size: 9pt)[link]], anchor: "south", padding: 0.1176cm)
  content((1.375, 0.7), [#text(size: 9pt)[loop]], anchor: "east", padding: 0.1176cm)
  content((4.225, 0.7), [#text(size: 9pt)[link]], anchor: "west", padding: 0.1176cm)
  content((4.675, -0.1), [#text(size: 9pt)[loop]], anchor: "west", padding: 0.1176cm)
  content((2.9, -1.47), [#text(size: 9pt)[block tree: nine nodes]])
})],
  caption: [Figure 1: Corner substitution and pole multiplicities. Shaded nodes carry one-edge blocks; white nodes are trivial inserts. Node labels give their poles in the map. The eight nonroot nodes have pole counts $3 \, 2 \, 3$, exactly the vertex degrees. The arrow marks the root dart. ],
) <fig:corners>

== 5 Conditioned trees and uniform path sums <tree:section>

We isolate the probabilistic statement needed to pass from the block tree to graph distances.
  Conditioned-tree height limits originate in [2]; their stable-domain extension is developed in [7].
  Joint depth-first process convergence to the same excursion was proved by Marckert and Mokkadem under stronger
  moment conditions [12]. We invoke the finite-variance, attainable-size formulation of Broutin and Marckert [6]
  for the tree geometry. We then prove a uniform law of large numbers for marked ancestral paths,
  using only a finite second offspring moment.

Let $xi$ have distribution $\( p_k \)_(k gt.eq 0)$ supported on the even nonnegative integers, with

#[#set math.equation(numbering: n => "(5.1)")
 $ p_0 p_2 > 0 \, wide bb(E) xi = 1 \, wide 0 < sigma^2 := "Var" \( xi \) < oo . $ <tree:assumptions>]

Write $cal(T)$ for the corresponding plane Galton–Watson tree and $cal(T)_N$ for its law conditional on having $N$
  nodes. Its attainable sizes are exactly the odd integers:
  every tree satisfies $N - 1 = sum_v deg^(+) \( v \)$, and every odd size can be realized using only offspring
  numbers zero and two. All limits in this section run through these odd integers.
  Given the offspring numbers, attach independent marks $A_v$ to the nodes,
  with a fixed law $cal(L)_k$ at a node with $k$ children.

Index the nodes in preorder by $v_0 \, dots.h \, v_(N - 1)$.
  Let $H \( v \)$ denote depth, put $H_j = H \( v_j \)$ for $j < N$ and $H_N = 0$, and define the exploration walk by

#[#set math.equation(numbering: n => "(5.2)")
 $ W_0 = 0 \, wide W_(j + 1) - W_j = deg^(+) \( v_j \) - 1 quad \( 0 lt.eq j < N \) . $ <tree:walk-definition>]

Thus $W_j gt.eq 0$ for $j < N$ and $W_N = - 1$. Interpolate both sequences linearly between integer times,
  and write $W \( v_j \) = W_j$.

#thm([Proposition 5.1.])[
  (Joint coding limit).  #emph[Under (5.1),
#[#set math.equation(numbering: n => "(5.3)")
 $ (frac(W_(N t), sigma sqrt(N)) \, frac(sigma H_(N t), 2 sqrt(N)))_(0 lt.eq t lt.eq 1) med
   arrow.r.double med \( e \( t \) \, e \( t \) \)_(0 lt.eq t lt.eq 1) quad
   upright("in ") C \( \[ 0 \, 1 \] \, bb(R)^2 \) \, $ <tree:walk-limit>]

 where $e$ is a standard normalized Brownian excursion.]
] <tree:excursion>

#proof[
  Broutin and Marckert’s Theorem 3 [6] gives the joint height and walk limit for uniform plane trees whose degree
    frequencies and second moments converge to a critical finite-variance law,
    with maximum degree $o \( sqrt(N) \)$. Their Lemma 11 verifies these hypotheses in probability for conditioned
    critical Galton–Watson trees; their Section 6 explicitly takes all attainable sizes.
  Given the offspring counts $\( n_k \)$, our tree is uniform,
    since each shape has probability $product_k p_k^(n_k)$. To apply the deterministic theorem to these random
    counts, take any subsequence and then a further subsequence on which its degree hypotheses hold almost surely.
    Conditional expectations of bounded continuous tests converge by the theorem;
    dominated convergence removes the conditioning. This proves the limit along the full admissible sequence.
  The source parametrizes height by $\( N - 1 \) t$. Continuous-path tightness makes the change to $N
    t$ negligible before the last interval. On that interval, $H_(N - 1) \/ sqrt(N) arrow.r
    0$ in probability because the limiting excursion ends at zero, so appending $H_N = 0$ is also harmless.
    The marks do not affect the tree-shape law. ◻
]

Put $nu = sigma^2 \/ 2$ and let $Delta_N$ be the largest offspring number.

#thm([Corollary 5.2.])[
  #emph[We have
#[#set math.equation(numbering: n => "(5.4)")
 $ max_v H \( v \) = O_(bb(P)) \( sqrt(N) \) \, wide max_v W \( v \) = O_(bb(P)) \( sqrt(N) \) \, wide Delta_N =
   o_(bb(P)) \( sqrt(N) \) \, $ <tree:degree-bound>]

 and
#[#set math.equation(numbering: n => "(5.5)")
 $ max_v \| W \( v \) - nu H \( v \) \| = o_(bb(P)) \( sqrt(N) \) . $ <tree:walk-height-estimate>]

]
] <tree:maxdegree>

#proof[
  The height and walk bounds follow from Proposition 16. Since both normalized processes converge jointly to the
    same excursion, their uniform difference tends to zero in probability, proving (5.5).
    Continuous-path tightness also makes the largest walk increment divided by $sqrt(N)$ tend to zero.
    An offspring number is a walk increment plus one. ◻
]

#thm([Lemma 5.3.])[
  (Cost of conditioning).  #emph[As $N$ tends to infinity through odd integers,
#[#set math.equation(numbering: n => "(5.6)")
 $ pi_N := bb(P) \( \| cal(T) \| = N \) tilde.op frac(2, sigma sqrt(2 pi)) N^(- 3 \/ 2) . $ <tree:size-probability>]

]
] <tree:conditioning>

#proof[
  Let $X_1 \, X_2 \, dots.h$ be independent with law $xi - 1$, and put $S_r = sum_(j = 1)^r X_j$.
    The exploration fills one waiting slot and creates $xi$ new ones at each step.
    Thus total size $N$ means that $S$ first reaches $- 1$ at $N$.
    A list of increments at least $- 1$ totaling $- 1$ has exactly one circular shift with this property:
    extend the list periodically, decreasing its height by one per period,
    and observe that its strict descending record endpoints occur once per period.
    Cyclic symmetry therefore gives the Otter–Dwass formula (see also [10] Theorem 15.5)
  $ pi_N = 1 / N bb(P) \( S_N = - 1 \) . $
  The lattice span of $X$ is exactly two because $- 1$ and $1$ both have positive probability.
    At compatible sites $j equiv r med \( mod med 2 \)$, the finite-variance local limit estimate is
  $ bb(P) \( S_r = j \) = frac(2, sigma sqrt(2 pi r)) exp (- frac(j^2, 2 r sigma^2)) + o \( r^(- 1 \/ 2) \) \, $
  uniformly in $j$. One can obtain this directly by Fourier inversion on $\[ - pi \/ 2 \, pi \/ 2 \]$ with
    prefactor $1 \/ pi$: the characteristic function is $1 - sigma^2 theta^2 \/ 2 +
    o \( theta^2 \)$ near zero and has modulus strictly less than one elsewhere on that interval.
    Rescaling $theta$ by $r^(- 1 \/ 2)$ gives the Gaussian integral, with uniformly vanishing integrated error.
    Taking $r = N$ and $j = - 1$ proves the assertion. ◻
]

=== 5.1 A spine law and bounded labels <a-spine-law-and-bounded-labels>

For each strict ancestor of a node $v$, let $k$ be the ancestor’s number of children and $i in { 1 \, dots.h \,
  k }$ the child leading toward $v$. The waiting slots in the preorder exploration give

#[#set math.equation(numbering: n => "(5.7)")
 $ W \( v \) = sum_("path" \( v \)) \( k - i \) \, wide hat(W) \( v \) :=
   sum_("path" \( v \)) \( i - 1 \) . $ <tree:waiting-slots>]

The second quantity is the preorder walk value at the corresponding node after reversing every child order.
  Reflection preserves the law of $cal(T)_N$ and preserves depths. Hence Corollary 17 also gives

#[#set math.equation(numbering: n => "(5.8)")
 $ max_v \| hat(W) \( v \) - nu H \( v \) \| = o_(bb(P)) \( sqrt(N) \) . $ <tree:mirror-estimate>]

Only the tree shape is used here; no symmetry of the marks is required.

The size-biased spine construction is classical; see Lyons, Pemantle, and Peres [11] Section 2.
  For the marks and chosen child used here, define a probability law on triples $\( K \, I \, A \)$ by

#[#set math.equation(numbering: n => "(5.9)")
 $ bb(P)_(upright("sp")) \( K = k \, I = i \, A in B \) = p_k cal(L)_k \( B \) \, wide 1 lt.eq i lt.eq
   k . $ <tree:spine-law>]

The total mass is $bb(E) xi = 1$, and

#[#set math.equation(numbering: n => "(5.10)")
 $ bb(E)_(upright("sp")) \( K - I \) = frac(bb(E) \[ xi \( xi - 1 \) \], 2) = nu \, wide bb(E)_(upright("sp")) K =
   2 nu + 1 < oo . $ <tree:spine-means>]

For independent triples $Z_1 \, dots.h \, Z_h$ with this law and every nonnegative path function $F$,
  independence in the unconditioned tree gives the path-counting identity

#[#set math.equation(numbering: n => "(5.11)")
 $ bb(E) [sum_(H \( v \) = h) F \( "path" \( v \) \)] = bb(E)_(upright("sp")) F \( Z_1 \, dots.h \, Z_h \) .
   $ <tree:spine-identity>]

Indeed, at each ancestor one sums over its possible child choices; the probability of each pair $\( k \, i \)$,
  including its independent mark, is exactly the factor in (5.9).

For a label $b = b \( k \, i \, A \)$, set

$ B_b \( v \) = sum_("path" \( v \)) b \( k \, i \, A \) \, wide mu_b = bb(E)_(upright("sp")) b \( K \, I \, A \) $

whenever the expectation exists.

#thm([Lemma 5.4.])[
  (Bounded path sums).  #emph[For every fixed bounded measurable real label $b$,
#[#set math.equation(numbering: n => "(5.12)")
 $ max_(v in cal(T)_N) \| B_b \( v \) - mu_b H \( v \) \| = o_(bb(P)) \( sqrt(N) \) . $ <tree:bounded-sums>]

]
] <tree:bounded-paths>

#proof[
  Fix $C \, epsilon > 0$. The exponential estimate for bounded independent variables gives, uniformly for $h lt.eq
    C sqrt(N)$,
  $ bb(P)_(upright("sp")) (lr(|sum_(r = 1)^h b \( Z_r \) - mu_b h|) > epsilon sqrt(N)) lt.eq C' e^(- c' sqrt(N)) . $
  For short paths the event may be empty; otherwise the usual bound $2
    exp \( - c epsilon^2 N \/ h \)$ gives the displayed estimate.
    The probability under $cal(T)_N$ that any such path violates the desired bound is at most
  $ pi_N^(- 1) sum_(h lt.eq C sqrt(N)) C' e^(- c' sqrt(N)) = o \( 1 \) \, $
  by the unconditioned identity (5.11) and Lemma 18. Now let $C$ increase,
    using maximum-depth tightness from Corollary 17. ◻
]

=== 5.2 Labels bounded by the offspring number <labels-bounded-by-the-offspring-number>

We now allow labels that grow with the offspring number. The two exploration orders control the sum of offspring
  numbers along every ancestral path. Subtracting its bounded truncation will control the remaining tail uniformly.

#thm([Theorem 5.5.])[
  (Uniform marked path sums).  #emph[Let $b = b \( k \, i \, A \)$ be a fixed measurable label with $0 lt.eq
    b lt.eq k$. Then $mu_b < oo$ and
#[#set math.equation(numbering: n => "(5.13)")
 $ max_(v in cal(T)_N) \| B_b \( v \) - mu_b H \( v \) \| = o_(bb(P)) \( sqrt(N) \) \, wide
   max_(v in cal(T)_N) lr(|B_b \( v \) - mu_b / nu W \( v \)|) = o_(bb(P)) \( sqrt(N) \) . $ <tree:marked-sums>]

]
] <tree:paths>

#proof[
  The exact identities (5.7) give
  #[#set math.equation(numbering: n => "(5.14)")
   $ sum_("path" \( v \)) k = W \( v \) + hat(W) \( v \) + H \( v \) . $ <tree:total-label>]
  By (5.5) and (5.8), this is $\( 2 nu + 1 \) H \( v \) + o_(bb(P)) \( sqrt(N) \)$ uniformly in $v$.
    For each fixed $R$, Lemma 19 applies to the bounded label $k upright(bold(1))_({ k lt.eq R })$.
    Subtracting its estimate yields
  #[#set math.equation(numbering: n => "(5.15)")
   $ sum_("path" \( v \)) k upright(bold(1))_({ k > R }) = m_R H \( v \) + o_(bb(P)) \( sqrt(N) \) quad
     upright("uniformly in ") v \, wide m_R := bb(E)_(upright("sp")) \[ K upright(bold(1))_({ K > R }) \] .
     $ <tree:tail-estimate>]
  The error statement here is for each fixed $R$. Integrability of $K$ gives $m_R arrow.r 0$,
    and maximum-depth tightness consequently implies
  #[#set math.equation(numbering: n => "(5.16)")
   $ lim_(R arrow.r oo) limsup_(N arrow.r oo) bb(P)
     (max_v sum_("path" \( v \)) k upright(bold(1))_({ k > R }) > epsilon sqrt(N)) =
     0 quad \( epsilon > 0 \) . $ <tree:uniform-tail>]
  Apply Lemma 19 to $b upright(bold(1))_({ k lt.eq R })$. The discarded path sum is bounded by the tail in (5.16),
    and the discarded spine mean is bounded by $m_R$. Letting first $N$ and then $R$ tend to infinity proves the
    first assertion. The second follows from (5.5) and $nu > 0$. ◻
]

This truncation uses $bb(E)_(upright("sp")) K = bb(E) xi^2 < oo$;
  it does not require a second moment of the size-biased variable $K$,
  and hence does not impose a third offspring moment.

We finish with a deterministic comparison for later use.

#thm([Lemma 5.6.])[
  (Common ancestors and walk minima).  #emph[If $j lt.eq j'$ and $v_(*)$ is the lowest common ancestor of $v_j \,
    v_(j')$, then
#[#set math.equation(numbering: n => "(5.17)")
 $ W \( v_(*) \) lt.eq min_(j lt.eq r lt.eq j') W_r lt.eq W \( v_(*) \) + Delta_N . $ <tree:lca-walk>]

]
] <tree:lca>

#proof[
  Every intervening node is a descendant of $v_(*)$. Its walk value is at least $W \( v_(*) \)$ by (5.7).
    If $v_(*) = v_j$, the upper bound is immediate. Otherwise the interval contains the child of $v_(*)$ leading
    toward $v_(j')$; its walk value exceeds $W \( v_(*) \)$ by at most the offspring number of $v_(*)$. ◻
]

== 6 From the block tree to the map <metric:section>

The mean block-distance comparison follows the general strategy for subcritical graph classes [17] Section 5 and
  tree-like maps [19] preprint Section 6.8. Here Theorem 20 supplies the required uniformity under only finite
  offspring variance. We also retain the exact corner-mass calculation, as in [20] Section 9,
  because the conclusion specifies the degree probability measure.

Let $sans(T)_N$ be the conditioned marked tree of Proposition 15, where $N = 2 n + 1$.
  Its map has the required marginal law of $M_n$. Write $pi \( w \)$ for the pole of a tree node $w$.
  For a strict ancestor with $k$ children, block mark $B$, and selected child $i$, put

$ g \( k \, i \, B \) = d_B #scale(x: 120%, y: 120%)[\(] upright("pole of ") B \,
  upright("vertex of corner ") i #scale(x: 120%, y: 120%)[\)] \, wide beta = bb(E)_(upright("sp")) g . $

The expectation is under the spine law (5.9), and $d_B$ uses all block edges.
  Since a block has $k \/ 2$ edges, $0 lt.eq g lt.eq k$. Therefore

#[#set math.equation(numbering: n => "(6.1)")
 $ 0 < beta < oo . $ <metric:beta>]

Finiteness follows from $bb(E)_(upright("sp")) k = bb(E) xi^2 < oo$.
  For positivity, a one-link block and its corner at the endpoint opposite the pole have positive spine
  probability, and their distance is one.

Let $G \( w \)$ be the sum of these $g$ labels over the strict ancestors of $w$.
  By Theorem 20 and the coding estimates in Section 5, with $nu = sigma^2 \/ 2$,

#[#set math.equation(numbering: n => "(6.2)")
 $ max_(w in sans(T)_N) lr(|G \( w \) - beta H \( w \)|) = o_(bb(P)) \( sqrt(N) \) \, wide
   max_(w in sans(T)_N) lr(|G \( w \) - beta / nu W \( w \)|) = o_(bb(P)) \( sqrt(N) \) . $ <metric:uniform-poles>]

=== 6.1 Uniform comparison of distances <uniform-comparison-of-distances>

#thm([Lemma 6.1.])[
  (Distances between poles).  #emph[Let $w_(*)$ be the last common ancestor of two tree nodes $w \, w'$.
    If $Delta$ is the maximum offspring number, then
$
  lr(|d_(M_n) #scale(x: 120%, y: 120%)[\(] pi \( w \) \, pi \( w' \) #scale(x: 120%, y: 120%)[\)] -
  #scale(x: 120%, y: 120%)[\(] G \( w \) + G \( w' \) - 2 G \( w_(*) \) #scale(x: 120%, y: 120%)[\)]|) lt.eq 2 Delta . $

 The map $pi$ from tree nodes to map vertices is onto.]
] <metric:poles>

#proof[
  Every inserted map meets the preceding part at its pole only.
    An excursion from a block into an attached submap must return to the same vertex,
    so attachments cannot shorten distances within a block. Moving from an ancestor pole to a descendant pole
    therefore adds the distances $g$ along their chain of blocks.
  If one of $w \, w'$ is their last common ancestor, this proves the displayed comparison with zero error.
    Otherwise let $x \, x'$ be the two selected corner vertices in the block of $w_(*)$.
    The route through the pole of that block has length $d_B \( x \, pi \( w_(*) \) \) +
    d_B \( pi \( w_(*) \) \, x' \)$ within the block, whereas the shortest route uses $d_B \( x \, x' \)$.
    Their difference lies between zero and twice the diameter of $B$,
    and that diameter is at most its number of edges, hence at most $Delta$.
    Outside the common block the distances add exactly as above.
    The same argument allows coincident poles and loop blocks.
  Every vertex of the nonempty map is incident to at least one edge, and hence to a corner in one of its blocks.
    That corner is a child slot, whose child’s pole is the given vertex.
    Thus every map vertex is the pole of a nonroot node. ◻
]

Index the nodes by $j = 0 \, dots.h \, N - 1$ in preorder.
  Combining Lemma 22, (6.2), and Lemma 21, and using $Delta = o_(bb(P)) \( sqrt(N) \)$, gives

#[#set math.equation(numbering: n => "(6.3)")
 $ max_(0 lt.eq j lt.eq j' < N)
   lr(|d_(M_n) #scale(x: 120%, y: 120%)[\(] pi \( j \) \, pi \( j' \) #scale(x: 120%, y: 120%)[\)] - beta / nu
   (W_j + W_(j') - 2 min_(j lt.eq r lt.eq j') W_r)|) = o_(bb(P)) \( sqrt(N) \) . $ <metric:walk-comparison>]

In particular, the comparison is uniform over every map vertex, including vertices in the largest blocks.

=== 6.2 The degree measure <the-degree-measure>

#thm([Lemma 6.2.])[
  (Corner mass).  #emph[The uniform probability measure on the $N - 1 = 2 n$ nonroot tree nodes,
    pushed forward by $pi$, is exactly $mu_n$.]
] <metric:measure>

#proof[
  Each nonroot node occupies one corner of its parent block, and every block corner is occupied once,
    including the corners whose inserts are trivial leaves. At a map vertex $v$,
    summing these corner counts over the blocks gives $deg_(M_n) \( v \)$:
    each incident dart belongs to one block, and each block has one corner per incident dart.
    A loop contributes two darts and two corners at its vertex. Division by the total $2 n$ proves the assertion. ◻
]

If $macron(mu)_n$ is instead the pushforward of uniform probability on all $N$ nodes, then

#[#set math.equation(numbering: n => "(6.4)")
 $ macron(mu)_n = frac(N - 1, N) mu_n + 1 / N delta_(pi \( 0 \)) \, wide parallel macron(mu)_n -
   mu_n parallel_(upright("TV")) lt.eq 1 / N . $ <metric:mass-error>]

The measure identity is thus independent of the sizes and shapes of the individual blocks.

=== 6.3 A correspondence estimate <a-correspondence-estimate>

For completeness we state the elementary estimate used to pass to metric probability spaces.
  A #emph[correspondence] between $X$ and $Y$ is a relation $cal(R) subset.eq X times
  Y$ projecting onto both spaces. Its distortion is

$ "dis" \( cal(R) \) = sup_(\( x \, y \) \, \( x' \, y' \) in cal(R)) \| d_X \( x \, x' \) - d_Y \( y \, y' \) \| . $

The Gromov–Hausdorff–Prokhorov distance is the infimum, over common isometric embeddings,
  of the maximum of the Hausdorff distance between the embedded spaces and the Prokhorov distance between their
  probability measures.

#thm([Lemma 6.3.])[
  (Metric and mass comparison).  #emph[Suppose a correspondence between compact metric probability spaces has
    distortion at most $epsilon > 0$, and a coupling of their probability measures is supported on the
    correspondence. Their Gromov–Hausdorff–Prokhorov distance is at most $epsilon$.
    If one marginal of that coupling differs from the desired measure by total variation at most $eta$,
    the bound is $epsilon + eta$.]
] <metric:ghp>

#proof[
  Join corresponding points by links of length $epsilon$, and use the induced shortest-chain distance on the
    disjoint union. This preserves the distances within each original space.
    Indeed, a segment leaving one space and returning to it can be replaced by a segment inside that space:
    the two linking lengths are $2 epsilon$, whereas the difference of the distances between the corresponding
    endpoints is at most $epsilon$. Every point is within $epsilon$ of the other space,
    giving the Hausdorff bound. The coupling places every pair at distance at most $epsilon$,
    which gives the Prokhorov bound directly from its defining neighborhood inequalities.
    Changing one marginal by total variation $eta$ increases these inequalities, and hence the Prokhorov bound,
    by at most $eta$. ◻
]

For a nonnegative continuous function $f$ on $\[ 0 \, 1 \]$ with $f \( 0 \) = f \( 1 \) = 0$,
  define $d_f$ by the same formula as $d_e$, and denote its quotient metric probability space by $cal(T)_f$.
  The interval-minimum formula gives the triangle inequality for $d_f$.
  The quotient projection is continuous, since $d_f \( s \, t \)$ is at most twice the oscillation of $f$ on the
  interval between $s$ and $t$. Thus $cal(T)_f$ is compact.
  Relating equal-time representatives in $cal(T)_f$ and $cal(T)_(tilde(f))$ gives a correspondence of distortion
  at most $4 parallel f - tilde(f) parallel_oo$ and a coupling from one uniform time.
  Lemma 24 therefore proves continuity of

$ f mapsto cal(T)_f $

from the uniform norm to the Gromov–Hausdorff–Prokhorov topology.

=== 6.4 Proof of the main theorem <proof-of-the-main-theorem>

#proof[
  Define
  #[#set math.equation(numbering: n => "(6.5)")
   $ c \( q \) = frac(nu, sqrt(2) thin beta sigma) = frac(sigma, 2 sqrt(2) thin beta) . $ <metric:constant>]
  Equations (4.8) and (6.1) show that this constant is deterministic, positive, and finite for every fixed $q > 4$.
  Let $f_N$ interpolate $W_j \/ \( sigma sqrt(N) \)$ at $j \/ N$ for $0 lt.eq j < N$, and set $f_N \( 1 \) = 0$.
    It is nonnegative and has zero endpoints. Replacing the exploration walk’s last value $W_N = -
    1$ by zero changes its normalized interpolation by at most $1 \/ \( sigma sqrt(N) \)$.
    Proposition 16 consequently gives
  $ f_N arrow.r.double e wide upright("in ") C \( \[ 0 \, 1 \] \) . $
  For grid points $j \/ N \, j' \/ N$, the comparison (6.3) and the identity $N = 2 n + 1$ imply
  $ max_(j \, j' < N)
    lr(|frac(c \( q \), sqrt(n)) thin d_(M_n) #scale(x: 120%, y: 120%)[\(] pi \( j \) \, pi \( j' \)
    #scale(x: 120%, y: 120%)[\)] - sqrt(frac(N, 2 n)) thin d_(f_N) \( j \/ N \, j' \/ N \)|) = o_(bb(P)) \( 1 \) . $
  Since $sqrt(N \/ \( 2 n \)) arrow.r 1$ and $parallel f_N parallel_oo$ is tight,
    that deterministic factor may be replaced by one.
  For $s in \[ 0 \, 1 \]$, put $j_N \( s \) = min { floor.l N s floor.r \, N -
    1 }$ and write $\[ s \]$ for its class in $cal(T)_(f_N)$. The relation
  $ cal(R)_N = { \( pi \( j_N \( s \) \) \, \[ s \] \) : s in \[ 0 \, 1 \] } $
  is a correspondence by Lemma 22. Rounding times changes a $d_(f_N)$ distance by at most $4
    omega_(f_N) \( 1 \/ N \)$, where $omega$ is the uniform modulus of continuity.
    Continuous-path tightness makes this error tend to zero in probability.
    The correspondence therefore has distortion $o_(bb(P)) \( 1 \)$ for the rescaled map metric.
  A Lebesgue-uniform time couples the probability measure of $cal(T)_(f_N)$ to $macron(mu)_n$ exactly,
    since each of the $N$ preorder cells has length $1 \/ N$.
    By Lemma 24 and (6.4), the Gromov–Hausdorff–Prokhorov distance from the rescaled map with measure $mu_n$ to
    $cal(T)_(f_N)$ tends to zero in probability. The continuity established above and $f_N arrow.r.double
    e$ prove the claimed convergence to $\( cal(T)_e \, d_e \, mu_e \)$.
  Proposition 15 applies to every $n gt.eq 1$, and the conditioned-tree results hold through all the corresponding
    odd sizes. The proof uses only the map marginal and all-edge block distances,
    so its conclusion is precisely the unrooted, undecorated metric probability limit stated in the theorem. ◻
]

#heading(level: 1)[References]
#bibitem([1])[L.~Addario-Berry, #emph[A probabilistic approach to block sizes in random maps], ALEA Lat. Am. J.
  Probab. Math. Stat. #strong[16] (2019), 1--13.
  #link("https://doi.org/10.30757/ALEA.v16-01")[doi:10.30757/ALEA.v16-01].]
#bibitem([2])[D.~Aldous, #emph[The continuum random tree III], Ann. Probab. #strong[21] (1993), no.~1, 248--289.
  #link("https://doi.org/10.1214/aop/1176989404")[doi:10.1214/aop/1176989404].]
#bibitem([3])[O.~Bernardi, #emph[Bijective counting of tree-rooted maps and shuffles of parenthesis systems],
  Electron. J. Combin. #strong[14] (2007), R9. #link("https://doi.org/10.37236/928")[doi:10.37236/928].]
#bibitem([4])[O.~Bernardi, #emph[A characterization of the Tutte polynomial via combinatorial embeddings], Ann.
  Comb. #strong[12] (2008), no.~2, 139--153.
  #link("https://doi.org/10.1007/s00026-008-0343-4")[doi:10.1007/s00026-008-0343-4].]
#bibitem([5])[O.~Bernardi, #emph[Tutte polynomial, subgraphs, orientations and sandpile model:
  new connections via embeddings], Electronic Journal of Combinatorics #strong[15] (2008), no.~1, R109.
  #link("https://doi.org/10.37236/833")[doi:10.37236/833].]
#bibitem([6])[N.~Broutin and J.-F.~Marckert, #emph[Asymptotics of trees with a prescribed degree sequence and
  applications], Random Structures Algorithms #strong[44] (2014), no.~3, 290--316.
  #link("https://doi.org/10.1002/rsa.20463")[doi:10.1002/rsa.20463]. Preprint:
  #link("https://arxiv.org/abs/1110.5203v3")[arXiv:1110.5203v3].]
#bibitem([7])[T.~Duquesne, #emph[A limit theorem for the contour process of conditioned Galton--Watson trees],
  Ann. Probab. #strong[31] (2003), no.~2, 996--1027.
  #link("https://doi.org/10.1214/aop/1048516543")[doi:10.1214/aop/1048516543].]
#bibitem([8])[Y.~Feng, #emph[Triviality of critical Fortuin--Kasteleyn decorated planar maps for $q > 4$], Probab.
  Theory Related Fields #strong[194] (2026), 299--331.
  #link("https://doi.org/10.1007/s00440-025-01424-2")[doi:10.1007/s00440-025-01424-2].]
#bibitem([9])[C.~M.~Fortuin and P.~W.~Kasteleyn, #emph[On the random-cluster model. I.
  Introduction and relation to other models], Physica #strong[57] (1972), no.~4, 536--564.
  #link("https://doi.org/10.1016/0031-8914(72)90045-6")[doi:10.1016/0031-8914(72)90045-6].]
#bibitem([10])[S.~Janson, #emph[Simply generated trees, conditioned Galton--Watson trees,
  random allocations and condensation], Probability Surveys #strong[9] (2012), 103--252.
  #link("https://doi.org/10.1214/11-PS188")[doi:10.1214/11-PS188].]
#bibitem([11])[R.~Lyons, R.~Pemantle, and Y.~Peres, #emph[Conceptual proofs of $L log
  L$ criteria for mean behavior of branching processes], Annals of Probability #strong[23] (1995), no.~3,
  1125--1138. #link("https://arxiv.org/abs/math/0404083")[arXiv:math/0404083].]
#bibitem([12])[J.-F.~Marckert and A.~Mokkadem, #emph[The depth first processes of Galton--Watson trees converge to
  the same Brownian excursion], Annals of Probability #strong[31] (2003), no.~3, 1655--1678.]
#bibitem([13])[R.~C.~Mullin, #emph[On the enumeration of tree-rooted maps], Canad. J. Math.
  #strong[19] (1967), 174--183. #link("https://doi.org/10.4153/CJM-1967-010-x")[doi:10.4153/CJM-1967-010-x].]
#bibitem([14])[OpenAI, #emph[Canonical conformal limits of subcritical FK planar maps],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Canonical-conformal-limits-of-subcritical-FK-planar-maps-September-24-2026/main.pdf")[OAI:Canonical-conformal-limits-of-subcritical-FK-planar-maps-September-24-2026],
  2026.]
#bibitem([15])[OpenAI, #emph[Metric-measure limits of subcritical FK and spanning-tree planar maps],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Metric-measure-limits-of-subcritical-FK-and-spanning-tree-planar-maps-September-24-2026/main.pdf")[OAI:Metric-measure-limits-of-subcritical-FK-and-spanning-tree-planar-maps-September-24-2026],
  2026.]
#bibitem([16])[OpenAI, #emph[The critical Liouville quantum sphere and geometric limits of FK maps at $q = 4$],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/The-critical-Liouville-quantum-sphere-and-geometric-limits-of-FK-maps-at-q-equals-4-September-24-2026/main.pdf")[OAI:The-critical-Liouville-quantum-sphere-and-geometric-limits-of-FK-maps-at-q-equals-4-September-24-2026],
  2026.]
#bibitem([17])[K.~Panagiotou, B.~Stufler, and K.~Weller, #emph[Scaling limits of random graphs from subcritical
  classes], Annals of Probability #strong[44] (2016), no.~5, 3291--3334.
  #link("https://doi.org/10.1214/15-AOP1048")[doi:10.1214/15-AOP1048].]
#bibitem([18])[S.~Sheffield, #emph[Quantum gravity and inventory accumulation], Ann. Probab.
  #strong[44] (2016), no.~6, 3804--3848. #link("https://doi.org/10.1214/15-AOP1061")[doi:10.1214/15-AOP1061].]
#bibitem([19])[B.~Stufler, #emph[Limits of random tree-like discrete structures],
  Probability Surveys #strong[17] (2020), 318--477.
  #link("https://doi.org/10.1214/19-PS338")[doi:10.1214/19-PS338]. Preprint:
  #link("https://arxiv.org/abs/1612.02580v2")[arXiv:1612.02580v2].]
#bibitem([20])[B.~Stufler, #emph[Non-bijective scaling limits and phase transitions of planar maps],
  #link("https://arxiv.org/abs/2608.21063v1")[arXiv:2608.21063v1] (2026).]
#bibitem([21])[W.~T.~Tutte, #emph[A census of planar maps], Canad. J. Math. #strong[15] (1963), 249--271.
  #link("https://doi.org/10.4153/CJM-1963-029-x")[doi:10.4153/CJM-1963-029-x].]
