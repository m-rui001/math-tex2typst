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

#align(center)[#text(size: 16pt, weight: "bold")[Tree Constructions for the $ell_1$ Distortion \
of Binary Edit Distance]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <sec:introduction>

An insertion or deletion changes the positions of every later symbol in a word.
  A long interval can therefore move at small edit cost even when many positions change.
  This tension between order and inexpensive shifts is central to the question studied here:
  how faithfully can one represent the edit distances of an entire set of words by distances in $ell_1$?

We use ordinary edit distance $"ED" \( x \, y \)$: the minimum number of single-symbol insertions,
  deletions and substitutions taking $x$ to $y$, each with cost one.
  For a finite alphabet $Sigma$ with at least two symbols and an integer $d gt.eq 1$,
  let $Sigma^(lt.eq d)$ be the set of words of length at most $d$, including the empty word.
  The cap constrains the words in the domain; an edit script computing their distance may pass through words of
  any finite length.

For a finite metric space $\( X \, rho \)$ with at least two points and an injective map $f : X arrow.r ell_1$,
  where $ell_1$ is the space of absolutely summable real sequences, define

$ "dist" \( f \) = (max_(x eq.not y) frac(parallel f \( x \) - f \( y \) parallel_1, rho \( x \, y \)))
  (max_(x eq.not y) frac(rho \( x \, y \), parallel f \( x \) - f \( y \) parallel_1)) . $

Let $c_1 \( X \, rho \)$ be the infimum of $"dist" \( f \)$ over such maps, and put $E_Sigma \( d \) =
  c_1 \( Sigma^(lt.eq d) \, "ED" \)$. No restriction is imposed on the dimension of the image or on the
  computation of the map. Throughout the paper, logarithms in asymptotic estimates are natural unless a base is
  written explicitly.

We prove the following lower bound in two independent ways.
  Each proof uses a tree to combine inexpensive shifts with a displacement that no alignment can hide.

#thm([Theorem 1.1.])[
  (Binary lower bound).  #emph[There are an absolute constant $c > 0$ and an integer $d_0$ such that,
    for every integer $d gt.eq d_0$, there exist an integer $1 lt.eq n lt.eq
    d$ and a finite set $cal(W) subset.eq { 0 \, 1 }^n$ with $\| cal(W) \| gt.eq 2$ satisfying
$ c_1 \( cal(W) \, "ED" \) gt.eq exp #h(-0.16667em) (c sqrt(log d thin log log d)) . $

]
] <thm:binary>

The words in a witness all have the same length, although that length may depend on the cap $d$.
  At tree depth $k$, each construction produces logarithmic distortion of order at least $k log
  k$ and logarithmic word length of order $k^2 log k$. Balancing these two scales gives Theorem 1 for every
  sufficiently large cap, not just for a subsequence of caps.

The lower bound is proved here without a companion input.
  The uniform upper embedding theorem of the finite-circle companion, stated precisely in Section 6, then gives

$ log E_Sigma \( d \) = Theta #h(-0.16667em) (sqrt(log d thin log log d)) $

with constants independent of the finite alphabet $Sigma$.
  This is a matching exponential scale, not a constant-factor estimate for $E_Sigma \( d \)$ itself.

=== 1.1 History and the embedding question <history-and-the-embedding-question>

The single-symbol error model is classical in coding and sequence comparison.
  Levenshtein studied binary codes correcting insertions and deletions [11],
  and Wagner and Fischer formulated string correction through increasing partial alignments [17] Sections 3 and 5.
  An embedding asks for one set of coordinates that represents every pair in a domain.
  It is a different task from estimating the distance of one given pair of words.
  For supplied pairs of binary words, [13] Theorem 1.1 gives a randomized approximation scheme with almost-linear
  worst-case expected time for each fixed rational accuracy.

Ostrovsky and Rabani proved an $ell_1$ distortion bound $exp \( O \( sqrt(log n thin log log n) \) \)$ for binary
  words of a fixed length $n$ [15]. Their recursion compares overlapping substrings and represents their
  distributions in smaller metric spaces. They also noted extensions to larger alphabets and varying lengths.
  For the upper bound used at the end of this paper, the companion uniform upper embedding theorem [14] Uniform
  upper embedding theorem gives the full quantitative statement on $Sigma^(lt.eq d)$ with constants independent of
  the finite alphabet.

On the lower-bound side, Andoni, Deza, Gupta, Indyk and Raskhodnikova realized complete bipartite graph metrics in
  binary edit distance and obtained $ell_1$ distortion approaching $3 \/ 2$ [1] Section 2 and Theorem 3.1.
  Their witness uses three adjacent word lengths. Khot and Naor developed Fourier methods for nonembeddability and
  obtained an edit-distance lower bound of $\( log n \)^(1 \/ 2 - o \( 1 \))$ for binary words of a fixed length
  [8]. Their insertion–deletion metric and the ordinary metric used here differ by at most a factor of two.
  Krauthgamer and Rabani then proved an $Omega \( log n \)$ lower bound for binary words of length $n$ [10]
  Theorem 1.3. Khot and Naor used Boolean noise sensitivity,
  while Krauthgamer and Rabani sharpened the obstruction through an influence inequality for bit flips and cyclic
  shifts. These cut and shift arguments are methodological predecessors of the proofs here.
  A cut records which pairs a binary coordinate separates, and Fourier coefficients describe how that separation
  changes under translations. We prove the particular translation estimates needed for our trees.

Alphabet reduction also has a substantial history. Schulman and Zuckerman use separation between long intervals of
  distinct codewords in concatenated insertion–deletion codes [16],
  and synchronization strings protect positions against insertion and deletion errors [5].
  More directly, Bhattacharya, Dey, Goldenberg and Koucký state a map on all finite words with an
  insertion–deletion guarantee normalized by the sum of the word lengths, for pairs of positive total length.
  The block substitution used to prove their stated theorem has logarithmic width and,
  for a fixed error parameter, a constant target alphabet [2] Theorem 3; full version,
  Section 3.2.1 and Lemma 3.3. For equal-length inputs, their stated normalized guarantee,
  combined with the elementary delimiter construction below,
  gives a binary reduction with logarithmic width and absolute distortion.
  Our lower proofs do not use that result. They use the short delimiter code,
  whose width-dependent loss is harmless at the tree scale;
  the appendix gives a separate constant-distortion code for one prescribed word length.
  For comparison, the isometric Hamming-to-edit embedding of Bhattacharya et al. [3] Theorem 7 starts from a
  different input metric. The conversions proved here compare edit distance on the source words with edit distance
  on their binary encodings.

=== 1.2 Two independent tree proofs <two-independent-tree-proofs>

Both constructions use an ordered tree. A leaf has a state coordinate and produces a symbol carrying its leaf
  label. An internal node produces a long list of rows, each containing its child words in their fixed order.
  Advancing the row index deletes a few rows at one end and inserts a few at the other, so it is inexpensive.
  A distinguished second shift must instead separate the words even when an alignment crosses row boundaries.

The shared alignment lemma in Section 2 handles this difficulty.
  Leaf labels preserve child indices, not row indices. An unsplit source row loses symbols because its child words
  are separated from the corresponding target words. A split source row forces a long unmatched target interval
  between consecutive matches. The intervals charged by different source rows are disjoint.
  Thus separation in every comparison of two rows implies separation of the whole words,
  without assuming that row boundaries match.

The two constructions arrange the shifts differently. In the finite tree of Section 3,
  a child’s period is its parent’s period times a new prime.
  At an internal node, a vector $u_v$ advances rows and a multiple $w_v$ has the parent period.
  The distinct prime factors prevent a difference of row indices from cancelling the distinguished shift in too
  many children. This gives a deterministic separation proof on a finite group.
  For a Fourier character, activity at a node with few active children has a short period and is detected by an
  average of inexpensive row shifts. A character escaping every such test must be active on many leaves;
  individual leaf changes then bound its contribution. The section closes with binary witnesses for every large cap.

The circle tree in Sections 4 and 5 uses quantized phases instead of finite residues.
  Random prime lists and coefficients make the root half-turn separate every base phase.
  The probabilistic assertion is only for one fixed shift; the all-phase conclusion follows deterministically from
  the alignment lemma. In its Fourier argument, tiny rotations detect large integer frequency sums and rational
  row shifts detect failed prime congruences. When both tests fail,
  divisibility forces every nonzero sum to continue through many children.
  This supplies the second binary proof without using the finite tree.

Both routes use the same elementary delimiter code from Section 2.
  Its distortion loss grows with the block width, but that width is only $O \( k log k \)$ here and does not
  change the logarithmic lower-bound scale. Appendix 7 proves a stronger, separate alphabet-conversion theorem:
  for words of one prescribed length $M$ over at most $M$ letters,
  blocks of width $M^2$ preserve edit distance up to scale and an absolute factor $804$.
  Its proof is independent of both trees, and neither headline lower bound requires this stronger conversion.

== 2 Edit deficits, ordered rows and binary transfer <sec:preliminaries>

Both trees need four elementary tools. Subsequence deficits and an alignment lemma turn separation of child blocks
  into separation of whole words, even when matches cross row boundaries.
  A cut representation permits the later Fourier estimates, and a prime count supplies the periods.
  Finally, a short binary code transfers either tree’s obstruction to binary words with a controlled width loss.

=== 2.1 Subsequence matchings <subsequence-matchings>

A common subsequence matching of words $x = x_1 dots.h.c x_a$ and $y =
  y_1 dots.h.c y_b$ is a list of pairs $\( i_1 \, j_1 \) \,
  dots.h \, \( i_s \, j_s \)$ whose two index lists are strictly increasing and for which $x_(i_t) =
  y_(j_t)$ for every $t$. Its largest possible size is $"LCS" \( x \, y \)$. The insertion–deletion distance is

$ Delta \( x \, y \) = \| x \| + \| y \| - 2 "LCS" \( x \, y \) . $

Indeed, symbols of $x$ that survive an insertion–deletion script form a common subsequence; conversely,
  retaining a longest common subsequence and deleting and inserting the remaining symbols attains this value.
  Replacing each substitution by one deletion and one insertion gives

#[#set math.equation(numbering: n => "(1)")
 $ "ED" \( x \, y \) lt.eq Delta \( x \, y \) lt.eq 2 "ED" \( x \, y \) . $ <eq:metric-conversion>]

For words of equal length $n$, put $r_n \( x \, y \) = n - "LCS" \( x \, y \)$. Thus

#[#set math.equation(numbering: n => "(2)")
 $ r_n \( x \, y \) lt.eq "ED" \( x \, y \) lt.eq 2 r_n \( x \, y \) . $ <eq:deficit>]

A matching of size $n - E$ between two length-$n$ words leaves exactly $E$ unmatched positions on each side.

=== 2.2 The common alignment lemma <the-common-alignment-lemma>

Suppose each row consists of one block from each of several pairwise disjoint alphabets, in the same order.
  An equal-symbol match must then join blocks with the same index, although their row indices can differ.
  Products of words in the next lemma mean concatenation in increasing index order.

#thm([Lemma 2.1.])[
  (Rows with ordered tags).  #emph[Let $T \, B gt.eq 1$ and $m gt.eq 2$ be integers, and let $Gamma_1 \, dots.h \,
    Gamma_m$ be pairwise disjoint alphabets. For $1 lt.eq a \, b lt.eq T$ and $1 lt.eq i lt.eq m$,
    take $X_(a \, i) \, Y_(b \, i) in Gamma_i^B$, and define
$ X = product_(a = 1)^T \( X_(a \, 1) dots.h.c X_(a \, m) \) \, wide Y =
  product_(b = 1)^T \( Y_(b \, 1) dots.h.c Y_(b \, m) \) \, wide N = T m B . $

 Suppose $d gt.eq 0$ is real and
#[#set math.equation(numbering: n => "(3)")
 $ sum_(i = 1)^m r_B \( X_(a \, i) \, Y_(b \, i) \) gt.eq d wide \( 1 lt.eq a \, b lt.eq T \) . $ <eq:local-tagged>]

 With $g = \( m - 1 \) B$, one has
#[#set math.equation(numbering: n => "(4)")
 $ r_N \( X \, Y \) gt.eq frac(T d g, d + g) gt.eq T / 2 min \( d \, g \) . $ <eq:tagged-result>]

 In particular, $d lt.eq g$ implies $r_N \( X \, Y \) gt.eq T d \/ 2$.]
] <lem:tagged>

#proof[
  Fix an increasing matching and let $E$ be its unmatched count on either side.
    Call a source row split if it has matches in at least two target rows,
    and let $s$ be the number of split source rows.
  A source row that is not split and has matches sends them all into one target row, say $b$.
    The disjoint alphabets confine matches from its block $i$ to block $i$ in that target row.
    The restriction of the matching to those two blocks has size at most their $"LCS"$,
    even if other source rows also use the target block. Condition (3) therefore leaves at least $d$ unmatched
    source positions in this row. A source row with no matches loses all $m B$ positions, again at least $d$,
    since (3) implies $d lt.eq m B$. The nonsplit rows are disjoint, so
  #[#set math.equation(numbering: n => "(5)")
   $ E gt.eq d \( T - s \) . $ <eq:tagged-unsplit>]
  For a split source row, list its matches in order and choose two consecutive entries at a transition between
    target rows. They are also consecutive in the entire matching:
    every source position between them lies in the same source row,
    so an intervening global match would have appeared in its list. Let $i \, i'$ be their source block indices.
    Their order gives $i lt.eq i'$, and disjoint alphabets give the same two block indices in the target.
    Between their target positions lie at least
  $ \( m - i + i' - 1 \) B gt.eq \( m - 1 \) B = g $
  positions in complete blocks. This is the count for adjacent target rows; intervening rows only increase it.
    All positions in that open target interval are unmatched,
    because the selected matches are globally consecutive. The intervals selected for different source rows are
    disjoint by strict monotonicity of the matching. Hence
  #[#set math.equation(numbering: n => "(6)")
   $ E gt.eq s g . $ <eq:tagged-split>]
  Since $g > 0$, (6) gives $s lt.eq E \/ g$. Substitute this in (5) to obtain $E gt.eq d \( T - E \/ g \)$,
    and rearrange: $E gt.eq T d g \/ \( d + g \)$. If $d lt.eq g$, then $d g \/ \( d + g \) gt.eq d \/ 2$;
    if $g lt.eq d$, it is at least $g \/ 2$. These bounds hold for every matching, including when $d = 0$ or $T =
    1$, and therefore for a longest one. ◻
]

The two inequalities in the proof bound the same number $E$ using different words:
  nonsplit rows give source losses, and split rows give target losses.
  Equal total lengths make the unmatched counts equal. The fixed order,
  equal block lengths and disjoint tags supply the target gaps; no alignment of row boundaries is assumed.
  Figure 1 illustrates the gap created by a split row.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((2.45, 1.7), (3.43, 2.21), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.94, 1.955), [#text(size: 9pt)[$1$]])
  rect((3.43, 1.7), (4.41, 2.21), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((3.92, 1.955), [#text(size: 9pt)[$2$]])
  rect((4.41, 1.7), (5.39, 2.21), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((4.9, 1.955), [#text(size: 9pt)[$3$]])
  rect((5.39, 1.7), (6.37, 2.21), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((5.88, 1.955), [#text(size: 9pt)[$4$]])
  rect((6.37, 1.7), (7.35, 2.21), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6.86, 1.955), [#text(size: 9pt)[$5$]])
  content((2.254, 1.955), [#text(size: 9pt)[source row $a$]], anchor: "east", padding: 0.1176cm)
  rect((0, 0), (0.98, 0.51), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((4.9, 0), (5.88, 0.51), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((0.98, 0), (1.96, 0.51), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((5.88, 0), (6.86, 0.51), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((1.96, 0), (2.94, 0.51), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((6.86, 0), (7.84, 0.51), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((2.94, 0), (3.92, 0.51), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((7.84, 0), (8.82, 0.51), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((3.92, 0), (4.9, 0.51), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((8.82, 0), (9.8, 0.51), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((1.96, 0), (2.94, 0.51), fill: rgb("#d9d9ff"), stroke: none)
  rect((2.94, 0), (3.92, 0.51), fill: rgb("#d9d9ff"), stroke: none)
  rect((3.92, 0), (4.9, 0.51), fill: rgb("#d9d9ff"), stroke: none)
  rect((4.9, 0), (5.88, 0.51), fill: rgb("#d9d9ff"), stroke: none)
  rect((5.88, 0), (6.86, 0.51), fill: rgb("#d9d9ff"), stroke: none)
  rect((6.86, 0), (7.84, 0.51), fill: rgb("#d9d9ff"), stroke: none)
  content((0.49, 0.255), [#text(size: 9pt)[$1$]])
  content((5.39, 0.255), [#text(size: 9pt)[$1$]])
  content((1.47, 0.255), [#text(size: 9pt)[$2$]])
  content((6.37, 0.255), [#text(size: 9pt)[$2$]])
  content((2.45, 0.255), [#text(size: 9pt)[$3$]])
  content((7.35, 0.255), [#text(size: 9pt)[$3$]])
  content((3.43, 0.255), [#text(size: 9pt)[$4$]])
  content((8.33, 0.255), [#text(size: 9pt)[$4$]])
  content((4.41, 0.255), [#text(size: 9pt)[$5$]])
  content((9.31, 0.255), [#text(size: 9pt)[$5$]])
  line((4.9, 0), (4.9, 0.51), stroke: (thickness: 1.2pt, miter-limit: 10))
  content((2.45, -0.34), [#text(size: 9pt)[target row $b$]])
  content((7.35, -0.34), [#text(size: 9pt)[target row $b+1$]])
  line((3.92, 1.7), (1.47, 0.51), stroke: (paint: rgb("#0000ff"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000ff"))))
  line((5.88, 1.7), (8.33, 0.51), stroke: (paint: rgb("#0000ff"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000ff"))))
  circle((3.92, 1.7), radius: 0.05292, fill: rgb("#0000ff"), stroke: none)
  circle((5.88, 1.7), radius: 0.05292, fill: rgb("#0000ff"), stroke: none)
  line((1.47, 0.8075), (8.33, 0.8075), stroke: (paint: rgb("#0000ff"), thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: rgb("#0000ff")), end: (symbol: ")>", fill: rgb("#0000ff"))))
  content((4.9, 0.8075), [#box(inset: 0.07056cm, stroke: none, fill: rgb("#ffffff"), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[unmatched target gap]]])])
})],
  caption: [Figure 1: A split source row in Lemma 2, with $m = 5$. The two arrows are consecutive matches from source blocks $i = 2$ and $i' = 4$. Their target positions lie in different rows, so all positions between them are unmatched. The six shaded complete blocks contribute $\( m - i + i' - 1 \) B = 6 B gt.eq \( m - 1 \) B$ positions. The diagram is schematic; target rows further apart would only enlarge the gap. ],
) <fig:tagged-gap>

=== 2.3 Cuts and prime counts <cuts-and-prime-counts>

We record two background facts for both constructions. The first turns an $ell_1$ distance on a finite set into a
  nonnegative sum of binary separation tests. This standard cut description is stated, for example,
  in Section 4 of Linial, London and Rabinovich [12]; the proof below includes a summability bound for maps with
  infinitely many coordinates.

#thm([Lemma 2.2.])[
  (Finite cut representation).  #emph[Let $S$ be finite and $f : S arrow.r ell_1$.
    There are nonnegative finite weights $a_C$, indexed by nonempty proper subsets $C subset S$, such that
$ parallel f \( x \) - f \( y \) parallel_1 = sum_(diameter eq.not C subset.neq S) a_C \|
  upright(bold(1))_C \( x \) - upright(bold(1))_C \( y \) \| . $

 Moreover,
$ sum_(diameter eq.not C subset.neq S) a_C lt.eq sum_({ x \, y } subset S \, med x eq.not y) parallel f \( x \) -
  f \( y \) parallel_1 \, $

 where the sum on the right is over unordered pairs.]
] <lem:cuts>

#proof[
  For each real coordinate $f_j$,
  $ \| f_j \( x \) - f_j \( y \) \| = integral_(bb(R)) \| upright(bold(1))_({ f_j > t }) \( x \) -
    upright(bold(1))_({ f_j > t }) \( y \) \| thin d t . $
  Discard empty and full level sets, which contribute zero,
    then sum over coordinates and group the remaining level sets by their subset of $S$.
    All terms are nonnegative, so monotone convergence permits this grouping.
    Every nontrivial cut separates at least one unordered pair.
    Summing the identity over those pairs bounds the total weight of the nontrivial cuts by the stated finite sum. ◻
]

The second fact supplies all primes used below. We use the elementary binomial-coefficient argument,
  following the classical prime-product method found, for example, in Erdős [4].
  Write $pi \( x \)$ for the number of primes at most $x$.

#thm([Lemma 2.3.])[
  (Prime supply).  #emph[There is an absolute $c > 0$ such that $pi \( x \) gt.eq
    c x \/ log x$ for all sufficiently large real $x$. Consequently, for all sufficiently large integers $k$,
    the interval $\[ k^4 \, k^5 \]$ contains at least $20 k^2$ primes and $\[ k^2 \, k^3 \]$ contains more than
    $1600 k$ primes.]
] <lem:primes>

#proof[
  For an integer $a gt.eq 1$, the largest coefficient in the expansion of $\( 1 + 1 \)^(2 a)$ is the central one,
    so $binom(2 a, a) gt.eq 4^a \/ \( 2 a + 1 \)$. The exponent of a prime $p$ in this coefficient is
  $ sum_(s gt.eq 1) (⌊frac(2 a, p^s)⌋ - 2 ⌊a / p^s⌋) . $
  Each summand is zero or one and vanishes for $p^s > 2 a$.
    Hence the whole $p$-power dividing $binom(2 a, a)$ is at most $2 a$,
    and $binom(2 a, a) lt.eq \( 2 a \)^(pi \( 2 a \))$. Taking logarithms gives $pi \( 2 a \) gt.eq
    c \( 2 a \) \/ log \( 2 a \)$ for large $a$. Taking $a = floor.l x \/ 2
    floor.r$ yields the asserted lower bound for real $x$. Finally subtract $pi \( k^4 \) lt.eq
    k^4$ from the lower bound at $k^5$, and $pi \( k^2 \) lt.eq k^2$ from the lower bound at $k^3$.
    The respective differences eventually exceed $20 k^2$ and $1600 k$. ◻
]

=== 2.4 A short binary code <a-short-binary-code>

The trees initially use leaf labels and hence a growing alphabet.
  The following code will suffice for both binary lower bounds.
  It preserves subsequence deficits from below, while its expansion is at most its block width.
  For the tree alphabets that width will be $O \( k log k \)$,
  small compared with their eventual distortion lower bounds.

#thm([Lemma 2.4.])[
  (Delimiter transfer).  #emph[Let $Gamma$ be a finite alphabet of size $A gt.eq 2$, let $t gt.eq
    ceil.l log_2 A ceil.r$ be an integer, and put $B = 2 t + 3$.
    Give the symbols of $Gamma$ distinct labels $\( a_1 \, dots.h \, a_t \) in { 0 \, 1 }^t$.
    Let $c \( a \)$ be the prefix $110$ followed, in order, by the two-bit words $a_j 0$ for $j = 1 \, dots.h \,
    t$. Let $cal(B)$ extend $c$ by concatenation. For every integer $n gt.eq 0$ and every $x \, y in Gamma^n$,
#[#set math.equation(numbering: n => "(7)")
 $ 1 / 2 r_n \( x \, y \) lt.eq "ED" \( cal(B) \( x \) \, cal(B) \( y \) \) lt.eq
   B "ED" \( x \, y \) . $ <eq:delimiter>]

]
] <lem:delimiter>

#proof[
  The pattern $11$ occurs in a concatenation only at block starts.
    The final zero of each block prevents an additional occurrence across a boundary.
    Fix a longest common subsequence matching of the encoded words, and let $l$ be its unmatched count on each side.
  At most $l$ source blocks contain an unmatched source bit.
    Among the fully matched source blocks, consider one whose image is not a consecutive target interval.
    Two consecutive bits of that source block then have matched target positions with a nonempty gap.
    No target position in that gap is matched: there is no source position between the two consecutive source
    bits. The gaps chosen for different source blocks are disjoint by monotonicity.
    Thus at most $l$ additional source blocks have a nonconsecutive target image.
  Every remaining source block is matched to a consecutive target interval of length $B$.
    Its initial $11$ starts at a target block boundary, so the entire block equals that target block.
    These target blocks are distinct and occur in increasing order.
    Their original letters form a common subsequence of $x \, y$ with at least $n - 2 l$ letters.
    Hence $r_n \( x \, y \) lt.eq 2 l$. By (2), encoded edit distance is at least its one-sided deficit $l$,
    proving the lower bound. Simulating each original symbol edit by at most $B$ bit edits gives the upper bound,
    with no restriction on intermediate lengths. When $n = 0$, both sides are zero. ◻
]

By (2), the lower bound in (7) is at least $"ED" \( x \, y \) \/ 4$.
  Consequently, if a finite set of equal-length words has $ell_1$ distortion at least $D_0$,
  its encoded image has distortion at least $D_0 \/ \( 4 B \)$:
  composing an embedding of the encoded image with $cal(B)$ incurs at most the factor $4 B$.

== 3 A finite tree with nested periods <sec:finite>

We first construct words over a finite alphabet that grows with the tree.
  At every internal node, one vector advances the rows cheaply and a multiple of it has a prescribed smaller
  period. The latter vector separates words for every state.
  We then use Fourier analysis to show that an $ell_1$ map cannot preserve both kinds of displacement with small
  distortion. The short binary code from Lemma 5 will then complete the first proof of Theorem 1.

=== 3.1 Periods and word construction <periods-and-word-construction>

Fix a sufficiently large integer $k$ and put

#[#set math.equation(numbering: n => "(8)")
 $ m = 20 k \, wide T = k^(20 k) . $ <eq:finite-parameters>]

Use the full ordered $m$-ary tree of depth $k$, with root $o$ at depth zero and children $v 1 \, dots.h \,
  v m$ at each internal node $v$. By Lemma 4, choose primes $p_(j \, i)
  in \[ k^4 \, k^5 \]$ distinct over all pairs $0 lt.eq j < k$, $1 lt.eq i lt.eq m$.
  Nodes at the same depth use the same list. Define their periods by

$ Q_o = 2 \, wide Q_(v i) = Q_v p_(j \, i) quad upright("when ") v upright(" has depth ") j . $

All these primes are odd for large $k$.

On the finite abelian group

$ A = product_(u upright(" leaf")) bb(Z) \/ Q_u bb(Z) $

define vectors supported on their respective subtrees:

#[#set math.equation(numbering: n => "(9)")
 $ w_u & = e_u &  & \( u upright(" leaf") \) \,\
u_v & = sum_(i = 1)^m w_(v i) \, wide R_v = product_(i = 1)^m p_(j \, i) \, wide w_v =
  R_v u_v &  & \( v upright(" internal at depth ") j \) . $ <eq:finite-vectors>]

Here $e_u$ increments the coordinate of leaf $u$.

#thm([Lemma 3.1.])[
  (Orders of the node vectors).  #emph[For every node $v$, $"ord" \( w_v \) = Q_v$. At every internal node,
$ "ord" \( u_v \) = Q_v R_v \, wide gcd \( Q_v \, R_v \) = 1 . $

]
] <lem:orders>

#proof[
  At a leaf, $e_u$ has order $Q_u$. Suppose the assertion holds at the children of an internal node $v$.
    Their vectors have disjoint supports and orders $Q_v p_(j \, i)$, so their sum has order
  $ "ord" \( u_v \) = "lcm"_(1 lt.eq i lt.eq m) \( Q_v p_(j \, i) \) = Q_v R_v . $
  The primes dividing $Q_v$ come from earlier depths, together with two, and none divides $R_v$.
    Multiplication by $R_v$ therefore leaves a vector of order $Q_v$, namely $w_v$. ◻
]

For $x in A$, the leaf word is the single symbol $G_u \( x \) = \( u \, x_u \)$. At an internal node, define

#[#set math.equation(numbering: n => "(10)")
 $ G_v \( x \) = product_(a = 0)^(T - 1) #scale(x: 120%, y: 120%)[\(] G_(v 1) \( x + a u_v \) dots.h.c
   G_(v m) \( x + a u_v \) #scale(x: 120%, y: 120%)[\)] \, $ <eq:finite-word>]

where the product concatenates the rows in increasing $a$. Only leaf coordinates below $v$ affect $G_v$.
  At depth $j$ and height $h = k - j$, its length is $L_v = \( m T \)^h$. Write

$ M = \( m T \)^k \, wide G = G_o . $

Every symbol retains its leaf label. Thus the alphabets occurring below different children of a node are disjoint,
  exactly as required by Lemma 2.

=== 3.2 Cheap translations and uniform separation <cheap-translations-and-uniform-separation>

We first bound the cost of advancing rows or changing one leaf.
  These bounds hold at every state and will later be averaged over $A$.

#thm([Lemma 3.2.])[
  (Inexpensive finite translations).  #emph[For every leaf $u$, every $x in A$ and every integer $t$,
$ "ED" \( G \( x \) \, G \( x + t e_u \) \) lt.eq M \/ m^k . $

 If $v$ is internal at depth $j$, then for every $x in A$ and integer $1 lt.eq s lt.eq T$,
#[#set math.equation(numbering: n => "(11)")
 $ "ED" \( G \( x \) \, G \( x + s u_v \) \) lt.eq frac(2 s, T) M / m^j . $ <eq:finite-cost>]

]
] <lem:finite-cost>

#proof[
  A leaf occurs $T^k = M \/ m^k$ times in the root word. Altering that coordinate can change only those symbols,
    so substitutions prove the first bound.
  Within one copy of $G_v$, translation by $s u_v$ changes the row parameters from $0 \, dots.h \, T - 1$ to $s \,
    dots.h \, T - 1 + s$. The two lists share $T - s$ rows. Deleting the first $s$ rows on one side and inserting
    the last $s$ on the other costs at most $2 s L_v \/ T$ edits.
    A node at depth $j$ occurs $T^j$ times in $G$, with total length $T^j L_v = M \/ m^j$.
    Each occurrence has an input offset contributed by ancestors.
    That offset is the same on both sides and commutes with $s u_v$,
    so the local script applies in every occurrence. The word is unchanged outside them.
    Summing the costs proves (11). ◻
]

We now prove separation for every nonzero residue along the order-$Q_v$ vector $w_v = R_v u_v$,
  uniformly in the initial state.

#thm([Proposition 3.3.])[
  (Separation in the finite tree).  #emph[For every node $v$ of height $h$, every $x in A$,
    and every integer $t$ with $Q_v divides.not t$,
#[#set math.equation(numbering: n => "(12)")
 $ r_(L_v) #scale(x: 120%, y: 120%)[\(] G_v \( x \) \, G_v \( x + t w_v \) #scale(x: 120%, y: 120%)[\)] gt.eq
   4^(- h) L_v . $ <eq:finite-separation>]

]
] <prop:finite-separation>

#proof[
  At a leaf, the two residue symbols differ. Suppose the proposition holds at the children of an internal node
    $v$, and write $B = L_v \/ \( m T \)$ for their common word length.
  Compare any source row $a$ in $G_v \( x \)$ and any target row $a'$ in $G_v \( x + t w_v \)$.
    In child $v i$, the relative input shift is
  $ \( a' - a + t R_v \) w_(v i) . $
  At least $m \/ 2$ children have $Q_(v i) divides.not a' - a + t R_v$.
    If $a' = a$, the assertion holds for every child: $Q_v divides.not t$ and $gcd \( Q_v \, R_v \) =
    1$ imply $Q_v divides.not t R_v$. If $a' eq.not a$, divisibility by $Q_(v i)$ would require $p_(j \, i)
    divides a' - a$, since $p_(j \, i) divides R_v$. But
  $ 0 < \| a' - a \| < T = k^(20 k) quad upright("and") quad \( k^4 \)^(m \/ 2) = k^(40 k) > T . $
  Thus $m \/ 2$ distinct primes of the required sizes cannot all divide $a' - a$.
  By induction, the sum of the deficits over the child blocks in every pair of rows is at least
  #[#set math.equation(numbering: n => "(13)")
   $ d_h = m / 2 thin 4^(- \( h - 1 \)) B . $ <eq:finite-charge>]
  The child blocks have equal length, fixed order and disjoint alphabets. Also $d_h lt.eq \( m - 1 \) B$.
    Lemma 2 therefore gives
  $ r_(L_v) #scale(x: 120%, y: 120%)[\(] G_v \( x \) \, G_v \( x + t w_v \) #scale(x: 120%, y: 120%)[\)] gt.eq
    frac(T d_h, 2) = 4^(- h) m T B = 4^(- h) L_v . $
  The lemma applies to arbitrary matchings, so this proves the induction for every state $x$. ◻
]

We have obtained the two geometric facts needed for the obstruction:
  the root shift $w_o$ is far at every state, while the shifts in Lemma 7 are cheap.
  The remaining argument compares their average images under an arbitrary $ell_1$ embedding.

=== 3.3 Fourier detection of sparse activity <fourier-detection-of-sparse-activity>

For a finite abelian group $A$, use uniform probability measure and write $hat(A)$ for its character group.
  The following identity represents an averaged $ell_1$ displacement through cuts and Fourier coefficients.
  It is the elementary translation principle underlying the comparison with the cut methods of Khot–Naor and
  Krauthgamer–Rabani [8,10].

#thm([Lemma 3.4.])[
  (Finite-group displacement).  #emph[If $F : A arrow.r ell_1$ is any map on a finite abelian group,
    then there are weights $H \( chi \) gt.eq 0$ such that, for every $z in A$,
#[#set math.equation(numbering: n => "(14)")
 $ bb(E)_x parallel F \( x + z \) - F \( x \) parallel_1 = sum_(chi in hat(A)) \| 1 -
   chi \( z \) \|^2 H \( chi \) . $ <eq:finite-fourier>]

 The map $F$ need not be injective.]
] <lem:finite-fourier>

#proof[
  Apply Lemma 3 to the finite image of $F$ and pull each cut back to an indicator $U : A arrow.r { 0 \, 1 }$.
    Since an indicator difference has absolute value equal to its squared absolute value, Parseval gives
  $ bb(E)_x \| U \( x + z \) - U \( x \) \| = sum_(chi in hat(A)) \| hat(U) \( chi \) \|^2 \| 1 -
    chi \( z \) \|^2 \, wide hat(U) \( chi \) = bb(E)_x U \( x \) overline(chi \( x \)) . $
  Multiply by the cut weights and add. The coefficient of each multiplier is the nonnegative number $H \( chi \) =
    sum_C a_C \| hat(U)_C \( chi \) \|^2$. ◻
]

For a character $chi$, call a node $v$ active when $chi \( w_v \) eq.not 1$.
  Let $"wt" \( chi \)$ be the number of active leaves. The period design has one useful consequence:
  activity at a node with few active children is detected by a short average of cheap shifts.
  Frequencies that escape all these tests must have large leaf support.

#thm([Proposition 3.5.])[
  (Finite obstruction).  #emph[For all sufficiently large $k$, the word image ${ G \( x \) : x in A }$,
    with ordinary edit distance, has $ell_1$ distortion at least $C_1^(- 1) \( k \/ 4 \)^k$,
    for an absolute constant $C_1$.]
] <prop:finite-lower>

#proof[
  Take an embedding of the word image with distortion $D$ and rescale it so that its induced distance $rho$ on
    parameter states satisfies
  $ 1 / D "ED" \( G \( x \) \, G \( y \) \) lt.eq rho \( x \, y \) lt.eq "ED" \( G \( x \) \, G \( y \) \) . $
  The map $x mapsto G \( x \)$ need not be injective; composing it with the embedding still gives a map to which
    Lemma 9 applies. Write
  $ V \( z \) = bb(E)_x rho \( x \, x + z \) = sum_chi \| 1 - chi \( z \) \|^2 H \( chi \) \, wide
    H \( chi \) gt.eq 0 . $
  First average over the entire cyclic coordinate of one leaf $u$.
    The average of $\| 1 - chi \( t e_u \) \|^2$ is two if $chi$ is nontrivial on that coordinate and zero
    otherwise. Sum the leaf-cost bound in Lemma 7 over all $m^k$ leaves. It follows that
  #[#set math.equation(numbering: n => "(15)")
   $ 2 sum_chi "wt" \( chi \) H \( chi \) lt.eq M . $ <eq:finite-leaf-mass>]
  Now suppose an internal node $v$ at depth $j$ is active for $chi$ but has fewer than $k$ active children.
    Since $chi \( w_v \) = chi \( u_v \)^(R_v) eq.not 1$, the value $chi \( u_v \)$ is a nontrivial root of unity.
    The inactive children contribute one to $chi \( u_v \) = product_i chi \( w_(v i) \)$,
    so at least one child is active. Let $q = "ord" \( chi \( u_v \) \)$.
    This order divides the least common multiple of the active child periods, and
  $ q lt.eq Q_v product_(i : thin v i upright(" active")) p_(j \, i) lt.eq 2 k^(5 j + 5 \( k - 1 \)) lt.eq
    2 k^(10 k) . $
  Put $J = 4 k^(10 k)$. For large $k$, $J lt.eq T$ and $q lt.eq J \/ 2$.
    The integers $1 \, dots.h \, J$ contain $floor.l J \/ q floor.r$ complete periods of this root of unity,
    with total length at least $J \/ 2$. On a complete nontrivial period the mean of $\| 1 -
    chi \( s u_v \) \|^2$ is two. Consequently
  $ 1 / J sum_(s = 1)^J \| 1 - chi \( s u_v \) \|^2 gt.eq 1 . $
  This uses complete periods inside the averaging interval and does not require $q$ to divide $J$.
  Because all Fourier weights are nonnegative, the total weight of characters with this property at the fixed node
    $v$ is at most $J^(- 1) sum_(s = 1)^J V \( s u_v \)$. Lemma 7 bounds that average by $\( 2 J \/ T \) M \/
    m^j$. There are $m^j$ nodes at depth $j$. Summing over nodes and all $k$ internal depths bounds the weight of
    characters having any active internal node with fewer than $k$ active children by
  #[#set math.equation(numbering: n => "(16)")
   $ 2 k \( J \/ T \) M . $ <eq:finite-exceptional-mass>]
  The sets of characters for different nodes may overlap; nonnegativity makes their sum an upper bound for the union.
  Every other character active at the root has at least $k$ active children at each active internal node.
    Iterating down the tree gives $"wt" \( chi \) gt.eq k^k$.
    By (15), these characters have total weight at most $M \/ \( 2 k^k \)$.
    Root-inactive characters contribute zero to $V \( w_o \)$, and any root multiplier is at most four. Hence
  #[#set math.equation(numbering: n => "(17)")
   $ V \( w_o \) lt.eq 4 M (frac(2 k J, T) + frac(1, 2 k^k)) lt.eq C_1 M k^(- k) . $ <eq:finite-root-upper>]
  Here $J \/ T = 4 k^(- 10 k)$, so an absolute $C_1$ suffices for all large $k$.
  Finally $Q_o = 2$. Proposition 8 with $t = 1$ and (2) imply $rho \( x \, x + w_o \) gt.eq
    4^(- k) M \/ D$ at every state. Its average, compared with (17), gives $D gt.eq C_1^(- 1) \( k \/ 4 \)^k$. ◻
]

=== 3.4 Binary witnesses for every sufficiently large cap <binary-witnesses-for-every-sufficiently-large-cap>

The finite tree alphabet contains one symbol for each leaf and each residue in its coordinate group.
  Since $Q_u lt.eq 2 k^(5 k)$ at every leaf, its size $K$ satisfies

$ K lt.eq 2 m^k k^(5 k) = 2 \( 20 k \)^k k^(5 k) . $

Choose

$ t_k = ⌈log_2 #scale(x: 120%, y: 120%)[\(] 2 \( 20 k \)^k k^(5 k) #scale(x: 120%, y: 120%)[\)]⌉ \, wide B_k =
  2 t_k + 3 = O \( k log k \) . $

There are enough $t_k$-bit labels for all symbols, so Lemma 5 applies with width $B_k$.
  Its distortion loss is at most $4 B_k$. Hence Proposition 10 supplies a finite binary witness of the single length

#[#set math.equation(numbering: n => "(18)")
 $ d_k = B_k M = B_k \[ 20 k dot.op k^(20 k) \]^k $ <eq:finite-binary-length>]

whose distortion is at least

$ D_k := frac(\( k \/ 4 \)^k, 4 C_1 B_k) . $

The separated root pair and the lower bound in Lemma 5 ensure that the witness contains at least two words.

The explicit widths $B_k$ and lengths $M$ increase with $k$, so $d_k$ increases to infinity,
  independently of which admissible primes were chosen. Moreover,

$ log d_k & = 20 k^2 log k + k log \( 20 k \) + log B_k\
 & = 20 k^2 log k + O \( k log k \) \,\
log D_k & gt.eq c' k log k $

for an absolute $c' > 0$ and all sufficiently large $k$. Given a sufficiently large integer $d$,
  choose $k$ with $d_k lt.eq d < d_(k + 1)$. Then $log d lt.eq C k^2 log k$ and $log log d lt.eq
  C' log k$ for absolute constants. Thus

$ log D_k gt.eq c sqrt(log d thin log log d) . $

The witness of length $d_k lt.eq d$ proves Theorem 1 for every sufficiently large cap.

== 4 A tree of circle phases <sec:torus-construction>

The second construction again concatenates ordered child words into rows,
  but a leaf now records a quantized circle phase. We will choose the increments between rows so that a half-turn
  of all leaf phases separates the resulting words. The choice is random;
  its output is one fixed word map with separation at every base phase.

=== 4.1 Prime groups and row increments <prime-groups-and-row-increments>

Fix a sufficiently large integer $k$ and set

#[#set math.equation(numbering: n => "(19)")
 $ g = 16 k \, wide m = g k^2 = 16 k^3 \, wide R = k^(8 k) \, wide T = k^(52 k) . $ <eq:torus-parameters>]

Let $bb(T) = bb(R) \/ bb(Z)$, with $\| t \|_(bb(T))$ denoting the circle distance from $t$ to zero.
  Use a full ordered $m$-ary tree of depth $k$, and divide the children of each internal node into $g$ groups of
  $k^2$ children. Each leaf phase will be quantized into $R$ intervals, and each internal word will contain $T$ rows.

Let $cal(P)_k$ be the primes in $\[ k^2 \, k^3 \]$. Lemma 4 gives $\| cal(P)_k \| > 100 g$ for large $k$.
  At each internal node $v$, independently between nodes, choose an ordered list $r_(v \, 1) \, dots.h \,
  r_(v \, g)$ of distinct members of $cal(P)_k$, uniformly without replacement. Put

$ P_v = product_(j = 1)^g r_(v \, j) lt.eq k^(48 k) . $

To specify the increment of a child $v i$ in group $j$, choose $z_(v i)$ uniformly from ${ 0 \, dots.h \,
  r_(v \, j) - 1 }$ and define

#[#set math.equation(numbering: n => "(20)")
 $ c_(v i) = 1 + z_(v i) P_v / r_(v \, j) . $ <eq:torus-coefficients>]

Conditionally on all prime lists, all these residues are independent.
  The increment $c_(v i) \/ P_v$ has the decomposition

$ c_(v i) / P_v = 1 / P_v + z_(v i) / r_(v \, j) . $

Thus every child has a common drift of $1 \/ P_v$, together with an independently chosen step on its group’s prime
  grid. The same formula isolates the groups arithmetically:
  if $ell eq.not j$, then $c_(v i) equiv 1 med \( mod med r_(v \, ell) \)$.
  At each selected prime, only coefficients from its own group can differ from one.

Associate a phase $w_u in bb(T)$ to each leaf $u$, and write $w in bb(T)^(m^k)$ for the full vector.
  For a subtree vector $omega$, the notation $omega + t$ means addition of $t$ to every coordinate of that vector.
  At a leaf, put

$ X_u \( w_u \) = #scale(x: 120%, y: 120%)[\(] u \, floor.l R w_u floor.r #scale(x: 120%, y: 120%)[\)] \, $

using the representative of $w_u$ in $\[ 0 \, 1 \)$. At an internal node, define

#[#set math.equation(numbering: n => "(21)")
 $ X_v \( omega \) = product_(a = 0)^(T - 1) (X_(v 1) #h(-0.16667em) (omega_(v 1) + frac(a c_(v 1), P_v)) dots.h.c
   X_(v m) #h(-0.16667em) (omega_(v m) + frac(a c_(v m), P_v))) \, $ <eq:torus-word>]

where $omega_(v i)$ is the subvector on the leaves below $v i$. The product concatenates rows in increasing $a$.
  At height $h$, the word length is $\( m T \)^h$. The root map $X = X_o$ has length

#[#set math.equation(numbering: n => "(22)")
 $ N = \( m T \)^k $ <eq:torus-length>]

over the alphabet $Gamma = { \( u \, b \) : u upright(" a leaf") \, med b in { 0 \, dots.h \, R - 1 } }$,
  of size $m^k R$. For fixed construction data, every position in this word quantizes one leaf phase plus a fixed
  offset. Hence the range of $X$ is finite and $X$ is measurable.

=== 4.2 Good shifts give separation at every phase <good-shifts-give-separation-at-every-phase>

Consider $X_v \( omega \)$ and $X_v \( omega + t \)$, where the scalar $t$ is added to every leaf phase below $v$.
  In a comparison of source row $a$ with target row $a'$, child $v i$ receives the relative shift

$ t + \( a' - a \) c_(v i) / P_v . $

The tagged-row lemma will separate the two words if enough children are separated for every row pair.
  Since each $c_(v i)$ is an integer, the displayed shift depends only on $a' - a$ modulo $P_v$.
  This leads to a recursive condition on $t$ alone, independent of the base phase. Set

$ epsilon.alt = R^(- 1) \, wide delta = 1 \/ 64 \, wide gamma = 1 \/ 128 = delta \/ 2 . $

Call a shift $t$ eligible if $\| t \|_(bb(T)) gt.eq epsilon.alt$.

#prodef([Definition 4.1.])[
  (Good shift).  At a leaf, $t in bb(T)$ is good if $\| t \|_(bb(T)) gt.eq epsilon.alt$.
    At an internal node $v$, it is good if, for every integer $a$ modulo $P_v$,
    at least $delta m$ children $v i$ have $t + a c_(v i) \/ P_v$ good at $v i$.
] <def:good>

The condition asks for at least $delta m$ children, interpreted as a real threshold on their integer count.
  Its deterministic consequence is the following separation estimate.

#thm([Lemma 4.2.])[
  (Conditional separation).  #emph[Fix the construction data.
    If a shift $t$ is good at a node $v$ of height $h$, then for every phase vector $omega$ on its subtree,
$ r_(\( m T \)^h) #scale(x: 120%, y: 120%)[\(] X_v \( omega \) \,
  X_v \( omega + t \) #scale(x: 120%, y: 120%)[\)] gt.eq gamma^h \( m T \)^h . $

]
] <lem:torus-good-separation>

#proof[
  At a leaf, two points in the same half-open interval of the partition into $R$ intervals have circle distance
    strictly less than $1 \/ R$. Thus a good shift changes the symbol for every phase,
    including when its distance is exactly $1 \/ R$.
  Suppose $h gt.eq 1$ and the statement holds at the children.
    Their common word length is $B = \( m T \)^(h - 1)$. Compare any source row $a$ and target row $a'$.
    In child $v i$, the relative shift is $t + \( a' - a \) c_(v i) \/ P_v$.
    It depends only on $a' - a$ modulo $P_v$, because $c_(v i)$ is an integer.
    Goodness supplies at least $delta m$ children where the induction hypothesis applies,
    so the sum of the deficits of the child comparisons is at least $d = delta m gamma^(h - 1) B$.
  Leaf labels give pairwise disjoint child alphabets, and the child blocks have equal length and fixed order.
    Since $d lt.eq m B \/ 64 lt.eq \( m - 1 \) B$, Lemma 2 gives
  $ r_(\( m T \)^h) #scale(x: 120%, y: 120%)[\(] X_v \( omega \) \,
    X_v \( omega + t \) #scale(x: 120%, y: 120%)[\)] gt.eq frac(T d, 2) = delta / 2 gamma^(h - 1) \( m T \)^h =
    gamma^h \( m T \)^h . $
  This proves the induction pointwise in $omega$. ◻
]

It remains to make the one root shift $t = 1 \/ 2$ good. We prove a statement for each fixed eligible shift that
  can be propagated from a child to its parent. The all-phase conclusion will then follow from the deterministic lemma.

=== 4.3 The probability of a good fixed shift <the-probability-of-a-good-fixed-shift>

#thm([Proposition 4.3.])[
  (Goodness of a fixed shift).  #emph[For all sufficiently large $k$,
    every node $v$ and every fixed $t in bb(T)$ with $\| t \|_(bb(T)) gt.eq epsilon.alt$ satisfy
$ bb(P) \[ t upright(" is good at ") v \] gt.eq 9 \/ 10 \, $

 where probability is over the construction in the subtree below $v$.
   Consequently, there exists a realization of the entire tree for which
#[#set math.equation(numbering: n => "(23)")
 $ r_N \( X \( w \) \, X \( w + 1 \/ 2 \) \) gt.eq gamma^k N wide
   upright("for every ") w in bb(T)^(m^k) . $ <eq:torus-separation>]

]
] <prop:good-probability>

#proof[
  The assertion is immediate at a leaf. Assume it holds at the children of an internal node $v$.
    Fix an eligible $t$ before choosing any data at $v$, and suppress $v$ from the prime notation.
    For a row residue $a$ modulo $P_v$, let
  $ S_a = { j : a equiv.not 0 med \( mod med r_j \) } . $
  In group $j$, the relative shift has the form
  $ t + frac(a c_(v i), P_v) = t + a / P_v + frac(a z_(v i), r_j) med \( mod med 1 \) . $
  When $j in.not S_a$, the last term vanishes. When $j in S_a$, it ranges uniformly over the $r_j$-point grid.
    We therefore treat small sets $S_a$ by choosing the prime list,
    and large sets $S_a$ by using the independent child residues.
  For the first case, we show that the parent list has probability at least $1 - g \/ \| cal(P)_k \|$ of satisfying
  #[#set math.equation(numbering: n => "(24)")
   $ \| t + a \/ P_v \|_(bb(T)) gt.eq epsilon.alt quad upright("for every ") a upright(" with ") \| S_a \| lt.eq
     k . $ <eq:prime-list-event>]
  Because $P_v$ is squarefree, the reduced denominator of such a fraction $a \/
    P_v$ is a product of at most $k$ selected primes, and is therefore at most $K_0 = k^(3 k)$.
    Distinct rationals on the circle with denominators at most $K_0$ have circle distance at least $1 \/ K_0^2$.
    Since $2 epsilon.alt = 2 k^(- 8 k) < 1 \/ K_0^2$, at most one of all such rationals lies at distance strictly
    less than $epsilon.alt$ from $- t$.
  This candidate rational, if it exists, is determined by $t$ before the list is sampled.
    It is nonzero because $\| t \|_(bb(T)) gt.eq epsilon.alt$, so its reduced denominator has a prime factor.
    Fix one such factor. Unless this prime belongs to the sampled list,
    the candidate cannot equal any of the fractions under consideration.
    A prime outside $cal(P)_k$ is never selected; a prime inside the pool is selected with probability exactly
    $g \/ \| cal(P)_k \|$. This proves the claimed probability of (24).
  Now fix a parent prime list satisfying (24). The remaining random data for different children are independent:
    each consists of its residue $z_(v i)$ and its entire child subtree. Fix one row residue $a$ modulo $P_v$.
  If $\| S_a \| lt.eq k$, a child in a group $j in.not S_a$ sees the shift
  $ t + frac(a c_(v i), P_v) = t + a / P_v med \( mod med 1 \) \, $
  since $r_j divides a$. It is eligible by (24). By induction,
    the children in these groups independently have the required goodness with probability at least $9 \/ 10$.
    There are at least $\( g - k \) k^2$ such children.
  If $\| S_a \| > k$, use children in groups $j in S_a$, of which there are at least $k^3 = m \/ 16$.
    Multiplication by $a$ permutes the residues modulo $r_j$,
    so each relative shift is uniform on a translate of the $r_j$-point grid.
    An arc of length $2 epsilon.alt$ contains a fraction at most $2 epsilon.alt + 1 \/ r_j$ of that grid.
    The shift is therefore eligible with probability at least $1 - 2 epsilon.alt - 1 \/ r_j$.
    Conditional on any eligible value, the independent child subtree is good with probability at least $9 \/ 10$.
    Each indicated child succeeds with probability at least $4 \/ 5$ for large $k$,
    and these success events are independent.
  In either case, select $n = m \/ 16$ independent indicated children.
    Each has success probability at least $4 \/ 5$, and $delta m = m \/ 64 = n \/ 4$.
    Hoeffding’s inequality for independent bounded variables [7] Theorem 2 gives
  $ bb(P) \[ upright("fewer than ") delta m upright(" successes") \] lt.eq
    exp #h(-0.16667em) (- 2 n (4 / 5 - 1 / 4)^2) = exp \( - 121 m \/ 3200 \) . $
  The variables need not have identical distributions. A union bound over the $P_v lt.eq
    k^(48 k)$ possible values of $a$, followed by the probability of failure of the parent event, gives
  $ bb(P) \[ t upright(" is not good at ") v \] lt.eq frac(g, \| cal(P)_k \|) +
    exp \( 48 k log k - 121 m \/ 3200 \) < 1 / 10 $
  for all sufficiently large $k$. Independence between different residues $a$ is unnecessary. This proves the induction.
  Apply the statement to the one fixed root shift $t = 1 \/ 2$, which is eligible for large $k$.
    Choose a realization in which it is good. Lemma 12 then gives (23) for every base phase.
    No simultaneous random choice for all eligible shifts is asserted. ◻
]

Fix this realization for the rest of the torus argument. The prime lists and coefficients now have fixed values.
  Only their stated size and congruence properties will be used below.

== 5 Torus displacements, Fourier detection and binary transfer <sec:torus-fourier>

The fixed construction separates every phase vector from its half-turn translate.
  We now compare this displacement with whole-row shifts, tiny rotations, and changes of a single leaf.
  The Fourier argument will use the cutoff

$ Q = k^(12 k) . $

The ratio $P_v \/ T lt.eq k^(- 4 k)$ controls the cost of whole-row shifts, and $R \/ Q =
  k^(- 4 k)$ controls the cost of tiny rotations. After proving the comparison for an arbitrary finite-range map
  on the torus, we apply the shared binary code.

=== 5.1 Pointwise and averaged edit costs <pointwise-and-averaged-edit-costs>

For a node $v$, let $e_v in bb(R)^(m^k)$ have entry one on the leaves below $v$ and zero elsewhere.
  At an internal node, define

#[#set math.equation(numbering: n => "(25)")
 $ h_v \( a \) = a / P_v sum_i c_(v i) e_(v i) med \( mod med 1 \) wide \( a in bb(Z) \/ P_v bb(Z) \) .
   $ <eq:cycle-shift>]

This is well defined because each $c_(v i)$ is an integer. Let $q$ be the depth of $v$.

#thm([Lemma 5.1.])[
  (Inexpensive torus translations).  #emph[For the realization fixed after Proposition 13,
    the following estimates hold, with $q$ denoting the depth of $v$ in the first two statements.]
  + #emph[If $v$ is internal and $a$ is an integer with $0 lt.eq a < P_v$, then for every $w$,
#[#set math.equation(numbering: n => "(26)")
 $ "ED" \( X \( w \) \, X \( w + h_v \( a \) \) \) lt.eq 2 N m^(- q) P_v / T . $ <eq:cycle-cost>]

]
  + #emph[If $v$ is any node and $0 lt.eq eta lt.eq 1 \/ Q$, then
#[#set math.equation(numbering: n => "(27)")
 $ bb(E)_w "ED" \( X \( w \) \, X \( w + eta e_v \) \) lt.eq N m^(- q) R / Q \, $ <eq:tiny-cost>]

 where $w$ has normalized Haar measure on $bb(T)^(m^k)$.]
  + #emph[If $u$ is a leaf, then for every $w$ and $eta in bb(T)$,
#[#set math.equation(numbering: n => "(28)")
 $ "ED" \( X \( w \) \, X \( w + eta e_u \) \) lt.eq N m^(- k) . $ <eq:leaf-cost>]

]
] <lem:torus-costs>

#proof[
  A node at depth $q$ occurs $T^q$ times in the root word, each time in a word of length $\( m T \)^(k - q)$.
    Its occurrences occupy the fraction $m^(- q)$ of all positions.
    Every occurrence receives its subtree phase vector plus fixed offsets from its ancestors,
    and those offsets are the same on both sides of each comparison.
  Within an occurrence of $X_v$, addition of $h_v \( a \)$ changes the row indices from $0 \, dots.h \, T -
    1$ to $a \, dots.h \, T - 1 + a$. Using the representative $0 lt.eq a < P_v lt.eq k^(48 k) < T$,
    the lists share $T - a$ rows. Deleting $a$ rows and inserting $a$ rows costs at most $2 a \/
    T$ times the occurrence length. Nothing changes outside the occurrences of $v$.
    This proves (26); it requires no divisibility of $T$ by $P_v$.
  For a tiny rotation, each affected symbol quantizes a uniformly distributed leaf phase plus a fixed offset.
    A rotation by $0 lt.eq eta lt.eq 1 \/ Q$ changes its interval with probability $R eta lt.eq R \/ Q$.
    Sum these positional mismatch probabilities and use substitutions to prove (27).
    Linearity of expectation suffices even when different occurrences use the same phase.
    This estimate is an average over $w$. Finally, an arbitrary change of one leaf can affect only its $N
    m^(- k)$ occurrences, proving (28) pointwise. ◻
]

=== 5.2 The Fourier identity on the torus <the-fourier-identity-on-the-torus>

The next identity expresses averaged $ell_1$ distances through nonnegative frequency weights.
  It is the continuous counterpart of Lemma 9; its averaging measure and its integer frequencies are different.

#thm([Lemma 5.2.])[
  (Torus displacement).  #emph[Let $n gt.eq 1$ be an integer and let $F : bb(T)^n arrow.r
    ell_1$ be a measurable map with finite range. Set
$ L_F \( h \) = bb(E)_w parallel F \( w + h \) - F \( w \) parallel_1 wide \( h in bb(T)^n \) \, $

 using normalized Haar measure. There are summable coefficients $mu_xi gt.eq 0$, indexed by $xi in bb(Z)^n$, such that
#[#set math.equation(numbering: n => "(29)")
 $ L_F \( h \) = sum_(xi in bb(Z)^n) mu_xi #scale(x: 120%, y: 120%)[\(] 1 -
   cos \( 2 pi chevron.l xi \, h chevron.r \) #scale(x: 120%, y: 120%)[\)] wide \( h in bb(T)^n \) .
   $ <eq:torus-fourier>]

]
] <lem:torus-fourier>

#proof[
  Apply Lemma 3 to the finite range of $F$ and pull a cut back to a measurable indicator $U$ on $bb(T)^n$.
    It belongs to $L^2 \( bb(T)^n \)$. For $hat(U) \( xi \) =
    integral_(bb(T)^n) U \( w \) e^(- 2 pi i chevron.l xi \, w chevron.r) thin d w$,
    Parseval and the Fourier translation rule give
  $ integral_(bb(T)^n) \| U \( w + h \) - U \( w \) \|^2 thin d w =
    sum_(xi in bb(Z)^n) 2 \| hat(U) \( xi \) \|^2 #scale(x: 120%, y: 120%)[\(] 1 -
    cos \( 2 pi chevron.l xi \, h chevron.r \) #scale(x: 120%, y: 120%)[\)] . $
  An indicator difference has absolute value equal to its squared absolute value.
    Multiply the identity by each cut weight and sum over the finitely many cut types.
    The resulting coefficients are nonnegative. Their sum is at most twice the total cut weight,
    because $sum_xi \| hat(U) \( xi \) \|^2 = integral \| U \|^2 lt.eq 1$.
    This also proves summability and justifies the identity for every $h$. ◻
]

=== 5.3 Two tests and forced branching <two-tests-and-forced-branching>

Apply the notation of Lemma 15 with $n = m^k$. For a frequency $xi in bb(Z)^(m^k)$ and a node $v$,
  define its integer summary

$ s_v = chevron.l xi \, e_v chevron.r = sum_(u upright(" leaf below ") v) xi_u . $

Thus $s_v = sum_i s_(v i)$ at an internal node and $s_u = xi_u$ at a leaf.
  The multiplier of the root half-turn is $1 - cos \( pi s_o \)$,
  equal to two for odd $s_o$ and zero for even $s_o$. We bound it using tests that cover every frequency with $s_o
  eq.not 0$.

#thm([Lemma 5.3.])[
  (Torus detection inequality).  #emph[For the fixed construction and its shifts $h_v \( a \)$,
    every measurable finite-range $F : bb(T)^(m^k) arrow.r ell_1$ satisfies
#[#set math.equation(numbering: n => "(30)")
 $ L_F \( e_o \/ 2 \) lt.eq  & 4 sum_(v upright(" all nodes")) bb(E)_(eta in \[ 0 \, 1 \/ Q \])
   L_F \( eta e_v \) + 2 sum_(v upright(" internal")) bb(E)_(a in bb(Z) \/ P_v bb(Z)) L_F \( h_v \( a \) \)\
 & quad + 2 k^(- k) sum_(u upright(" leaf")) bb(E)_(eta in bb(T)) L_F \( eta e_u \) . $ <eq:detection>]

 Every interval, finite-group and circle average has total mass one.]
] <lem:detection>

#proof[
  We compare the multipliers of a fixed frequency in (29). If $\| s_v \| gt.eq Q$ at some node, then
  $ Q integral_0^(1 \/ Q) \( 1 - cos \( 2 pi s_v eta \) \) thin d eta = 1 -
    frac(Q, 2 pi s_v) sin \( 2 pi s_v \/ Q \) gt.eq 1 - frac(1, 2 pi) gt.eq 1 / 2 . $
  The first sum in (30), with coefficient four, therefore dominates the root multiplier, which is at most two.
  If an internal node satisfies
  #[#set math.equation(numbering: n => "(31)")
   $ sum_i c_(v i) s_(v i) equiv.not 0 med \( mod med P_v \) \, $ <eq:nonzero-congruence>]
  then the average of the multiplier for $h_v \( a \)$ over $a in bb(Z) \/ P_v bb(Z)$ is exactly one,
    by the sum of a nontrivial cyclic character. The second sum, with coefficient two,
    dominates the root multiplier in this case.
  It remains to consider a frequency with $\| s_v \| < Q$ at every node and with every internal congruence equal
    to zero. If $s_o = 0$, its root multiplier vanishes. Suppose $s_o eq.not 0$,
    and consider an internal node $v$ with $s_v eq.not 0$. Call a group of children empty if all summaries in that
    group vanish. For an empty group $j$, reduce the zero congruence modulo $r_(v \, j)$.
    The coefficients outside that group are one modulo $r_(v \, j)$ and the group contributes zero,
    so $r_(v \, j) divides s_v$.
  If at least $g \/ 2 = 8 k$ groups were empty, their distinct primes would have product at least
    $\( k^2 \)^(8 k) = k^(16 k) > Q$. That product cannot divide a nonzero integer $s_v$ with $\| s_v \| < Q$.
    Hence more than $g \/ 2$ groups contain a child with nonzero summary,
    and in particular there are at least $k$ such children. Starting from the root and repeating the conclusion
    gives at least $k^k$ leaves $u$ with $s_u eq.not 0$. At each such leaf,
    the multiplier for $eta e_u$ has mean one over uniform $eta in bb(T)$.
    The third sum in (30), with coefficient $2 k^(- k)$, is therefore at least two.
  These cases bound the root multiplier for every frequency.
    Multiply by the nonnegative coefficients $mu_xi$ and sum.
    Their summability justifies interchange with all normalized shift averages, proving (30). ◻
]

The cutoff and congruence tests have different jobs. The divisibility argument forces branching only after all
  summaries are known to have absolute value less than $Q$.
  It would not rule out a large nonzero integer divisible by many of the selected primes.

=== 5.4 The binary obstruction and every length cap <the-binary-obstruction-and-every-length-cap>

Apply Lemma 5 to the torus alphabet of size $A = m^k R$, choosing labels of length $ceil.l log_2 A ceil.r$.
  Write $cal(B)$ for the resulting encoding. Its block width is

#[#set math.equation(numbering: n => "(32)")
 $ B = 2 ceil.l log_2 \( m^k R \) ceil.r + 3 = O \( k log k \) . $ <eq:torus-code-width>]

The encoded image consists of binary words of one length $B N$.
  It has at least two points, since the lower code bound preserves the positive root separation in (23).
  We apply the detection inequality directly to an embedding of this encoded image;
  the code’s width will enter only the upper cost estimates.

Take any embedding $f$ of the encoded image with distortion $D$ and rescale it to be noncontracting with expansion
  at most $D$. Set

$ F \( w \) = f \( cal(B) \( X \( w \) \) \) \, wide L \( h \) = L_F \( h \) . $

The map $F$ is measurable with finite range, so Lemma 16 applies.
  The pointwise separation, the three costs in Lemma 14, and the code bounds give

#[#set math.equation(numbering: n => "(33)")
 $ L \( e_o \/ 2 \) & gt.eq gamma^k N \/ 2 \,\
L \( h_v \( a \) \) & lt.eq
  2 D B N m^(- q) P_v \/ T &  & \( v upright(" internal") \, med a in bb(Z) \/ P_v bb(Z) \) \,\
L \( eta e_v \) & lt.eq D B N m^(- q) R \/ Q &  & \( v upright(" any node") \, med 0 lt.eq eta lt.eq 1 \/ Q \) \,\
L \( eta e_u \) & lt.eq D B N m^(- k) &  & \( u upright(" leaf") \, med eta in bb(T) \) . $ <eq:torus-far>]

For the second line, use the representative $0 lt.eq a < P_v$ in the pointwise cost proof;
  the displacement itself depends only on the residue. The third line uses the Haar-average cost,
  with no pointwise claim about tiny rotations.

There are $m^q$ nodes at depth $q$. Thus the factors $m^(- q)$ cancel when the upper bounds are summed over a
  depth in (30). We obtain

$ L \( e_o \/ 2 \) & lt.eq D B N (4 \( k + 1 \) R / Q + 4 k k^(48 k) / T + 2 k^(- k))\
 & lt.eq C' D B N k^(- k) \, $

for an absolute $C'$, because $R \/ Q = k^(- 4 k)$ and $k^(48 k) \/ T = k^(- 4 k)$. Comparing this with (33) gives

#[#set math.equation(numbering: n => "(34)")
 $ D gt.eq frac(\( gamma k \)^k, 2 C' B) \, wide gamma = 1 \/ 128 . $ <eq:torus-final-D>]

The denominator retains the width $B$ from the delimiter code.
  Since $B = O \( k log k \)$, the logarithm of the right side is at least $c_(upright("tor")) k log
  k$ for an absolute $c_(upright("tor")) > 0$ and all sufficiently large $k$.

The binary word length satisfies

#[#set math.equation(numbering: n => "(35)")
 $ log \( B N \) = 52 k^2 log k + O \( k log k \) . $ <eq:torus-log-length>]

For every sufficiently large integer $d$, put $tau = log d$ and choose $k =
  floor.l a sqrt(tau \/ log tau) floor.r$, where $a > 0$ is a sufficiently small absolute constant.
  There is an absolute $C_2$ such that $log \( B N \) lt.eq C_2 k^2 log k$ for all large $k$.
  Since $k lt.eq a sqrt(tau \/ log tau)$ and $log k lt.eq log tau$ eventually, choosing $C_2 a^2 lt.eq
  1 \/ 2$ gives $log \( B N \) lt.eq tau \/ 2 < tau$. Also, for all large $tau$,

$ k gt.eq a / 2 sqrt(frac(tau, log tau)) \, wide log k gt.eq 1 / 3 log tau . $

It follows that $k log k gt.eq \( a \/ 6 \) sqrt(tau log tau)$.
  The finite set ${ cal(B) \( X \( w \) \) : w in bb(T)^(m^k) } subset.eq { 0 \,
  1 }^(B N)$ therefore has distortion at least $exp \( c sqrt(log d thin log log d) \)$ and has $B N lt.eq d$.
  This completes the torus proof of Theorem 1 for every sufficiently large cap.

== 6 The uniform two-sided bound <sec:consequences>

The two lower constructions use no result from a companion manuscript.
  For the matching upper estimate we use the following full statement of the companion uniform upper embedding
  theorem [14] Theorem 8.1.

#thm([Theorem 6.1.])[
  (Uniform upper embedding, companion theorem).  #emph[There are absolute constants $C > 0$ and $d_0 gt.eq
    3$ such that, for every finite alphabet $Sigma$ with $\| Sigma \| gt.eq 2$ and every integer $d gt.eq d_0$,
    there are an integer $M gt.eq 1$ and one deterministic map $f : Sigma^(lt.eq d) arrow.r ell_1^M$ satisfying
$ "ED" \( x \, y \) lt.eq parallel f \( x \) - f \( y \) parallel_1 lt.eq
  exp #h(-0.16667em) (C sqrt(log d thin log log d)) "ED" \( x \, y \) wide \( x \, y in Sigma^(lt.eq d) \) . $

 Here $ell_1^M$ is $bb(R)^M$ with its usual $ell_1$ norm. The domain includes the empty word,
   and $"ED"$ is ordinary unit-cost insertion, deletion and substitution distance.
   The dimension may depend on $Sigma \, d$; the constants and threshold do not.]
] <thm:companion-upper>

The lower inequality makes the map injective. We use only the resulting distortion bound.

#thm([Corollary 6.2.])[
  #emph[There are absolute $c \, C > 0$ and an integer $d_2$ such that for every integer $d gt.eq
    d_2$ and every finite alphabet $Sigma$ with $\| Sigma \| gt.eq 2$,
#[#set math.equation(numbering: n => "(36)")
 $ exp #h(-0.16667em) (c sqrt(log d thin log log d)) lt.eq E_Sigma \( d \) lt.eq
   exp #h(-0.16667em) (C sqrt(log d thin log log d)) . $ <eq:matching>]

 The same bounds hold for $sup_(Sigma : thin 2 lt.eq \| Sigma \| < oo) E_Sigma \( d \)$.]
] <cor:matching>

#proof[
  Choose two distinct symbols of $Sigma$ and identify them with zero and one.
    Binary edit distance is the restriction of the ambient edit distance.
    One inequality holds because every binary script is an ambient script.
    For the other, project every extra symbol of $Sigma$ to zero while fixing zero and one.
    Projecting an ambient script between binary words produces a binary script of no greater cost:
    each operation becomes the same type of operation or no change. Thus the two distances are equal on binary words.
  The witness from either proof of Theorem 1 is therefore an isometric subset of $Sigma^(lt.eq d)$.
    Restricting an embedding to that subset proves the lower bound in (36). Theorem 17 gives the upper bound.
    Since the constants and thresholds are absolute, taking the supremum over finite alphabets preserves both bounds. ◻
]

The alphabet may grow with $d$. The estimate determines the order of $log E_Sigma \( d \)$ uniformly;
  it leaves the constants within the exponent unspecified.

== 7 A constant-distortion code for one prescribed length <sec:code>

The short code in Lemma 5 is sufficient for both tree lower bounds. Here we prove a stronger transfer result:
  a binary block code with absolute distortion for every pair of words of one prescribed length $M$,
  over an alphabet of size at most $M$. Its width $M^2$ increases the word length polynomially.
  The proof combines separation between segments of unequal codewords with an extraction of original common
  subsequences from matches between equal codewords.

#thm([Theorem 7.1.])[
  (Fixed-length binary conversion).  #emph[There is an absolute integer $M_0$ such that,
    for every integer $M gt.eq M_0$ and every alphabet $Gamma$ with $1 lt.eq K = \| Gamma \| lt.eq M$,
    there exists a map $c : Gamma arrow.r { 0 \, 1 }^P$ with $P = M^2$ whose concatenation extension $"enc"$ satisfies
#[#set math.equation(numbering: n => "(37)")
 $ P / 804 "ED" \( x \, y \) lt.eq "ED" \( "enc" \( x \) \, "enc" \( y \) \) lt.eq
   P "ED" \( x \, y \) wide \( x \, y in Gamma^M \) . $ <eq:804>]

 The encoded words have length $M P = M^3$. More precisely,
#[#set math.equation(numbering: n => "(38)")
 $ r_(M P) \( "enc" \( x \) \, "enc" \( y \) \) gt.eq P / 402 r_M \( x \, y \) wide \( x \, y in Gamma^M \) .
   $ <eq:402>]

]
] <thm:804>

We first choose blocks whose long segments are separated whenever the underlying letters differ.
  Separation of long intervals of distinct binary codewords also appears in the inner code of Schulman and
  Zuckerman [16] Section II-C, Condition 2 and Lemma 2. We prove the precise property needed here directly.
  The later argument will handle matches between equal letters without a condition on self-overlaps of a codeword.

#thm([Lemma 7.2.])[
  (Separation of unequal-label segments).  #emph[For sufficiently large integers $M$ and integers $1 lt.eq K lt.eq
    M$, there are $K$ binary words of length $P = M^2$ such that any two length-$a$ segments of distinct codewords
    satisfy $"LCS" lt.eq 0.99 a$ whenever
$ a gt.eq a_0 := ceil.l 40 log_2 \( M P \) ceil.r = ceil.l 120 log_2 M ceil.r . $

]
] <lem:random-segments>

#proof[
  Choose all $K P$ bits independently and uniformly. For two fixed length-$a$ segments in distinct codewords,
    put $s = ceil.l 0.99 a ceil.r$. Every prescribed increasing matching of size $s$ has probability $2^(- s)$:
    its pairs use distinct independent bits on each side. A union bound over the two position lists gives
  $ bb(P) \[ "LCS" gt.eq s \] lt.eq binom(a, s)^2 thin 2^(- s) lt.eq 2^(- a \/ 2) . $
  For the last estimate, let $u = a - s lt.eq 0.01 a$. If $u = 0$, it is immediate.
    Otherwise $binom(a, u) lt.eq \( e a \/ u \)^u$, and $u log_2 \( e a \/ u \)$ is increasing for $0 < u < a$.
    Therefore
  $ 2 log_2 binom(a, u) - s lt.eq 0.02 a log_2 \( 100 e \) - 0.99 a < - 0.81 a < - a \/ 2 . $
  There are at most $K^2 P^3 lt.eq M^2 P^3$ choices of two codewords, a segment length,
    and two starting positions. The probability that any comparison of length at least $a_0$ fails is at most
  $ M^2 P^3 thin 2^(- a_0 \/ 2) lt.eq M^2 P^3 \( M P \)^(- 20) < 1 . $
  For large $M$, $a_0 lt.eq P$. A realization avoiding every forbidden comparison exists.
    Excluding $"LCS" gt.eq ceil.l 0.99 a ceil.r$ implies the stated weak inequality,
    including when $0.99 a$ is an integer. ◻
]

#proof[
  Use codewords supplied by Lemma 20. Fix any increasing matching of $N_(upright("mat"))$ bits between
    $"enc" \( x \)$ and $"enc" \( y \)$, and put $delta = M P - N_(upright("mat"))$.
    Each encoded word has exactly $delta$ unmatched positions.
  We first count matches between unequal original letters. Each matched bit pair belongs to a pair $\( i \, j \)$
    of original block positions. Along the matching, both block indices are nondecreasing.
    Every change of pair increases $i + j$, so at most $2 M - 1$ block pairs occur.
    The matches of one fixed pair are consecutive in this list:
    any pair between two occurrences of $\( i \, j \)$ must have both indices equal to $i \, j$.
  Suppose a block pair with unequal letters contains $a$ matches.
    Take the minimal contiguous spans containing those matched positions in the two blocks.
    Let their lengths be $b \, c$, and put $g = \( b - a \) + \( c - a \)$.
    The spans for different block pairs are disjoint on each side, even when the pairs share one block index.
    Moreover, no bit matched under another pair can lie inside a span, by the consecutiveness just proved.
    Thus $g$ counts globally unmatched positions, and the sum of $g$ over all unequal-label pairs is at most $2 delta$.
  If $a gt.eq a_0$, trim each span to a contiguous segment of length $a$.
    This removes $g$ positions in total and destroys at most $g$ matched pairs.
    The two segments retain at least $a - g$ matches, so Lemma 20 gives $a - g lt.eq 0.99 a$.
    Hence $g gt.eq 0.01 a$. Summing over these large pairs bounds their total matched count by $100 sum g lt.eq
    200 delta$. The pairs with $a < a_0$ contribute less than $2 M a_0$ matches.
    Consequently the number of unequal-label matches is at most
  #[#set math.equation(numbering: n => "(39)")
   $ 200 delta + 2 M a_0 . $ <eq:unequal-code>]
  For the equal-label matches, form a bipartite multigraph whose two vertex classes are the $M$ source and $M$
    target block positions. Each matched bit pair with equal original letters gives one edge.
    Every vertex has degree at most $P$. The edges can be partitioned into $P$ matchings.
    This is the classical bipartite edge-coloring theorem of König [9]; we derive it here from Hall’s theorem.
    Add edges between deficient vertices, allowing parallel edges, until the graph is $P$-regular.
    The total degree deficiency is the same on the two sides, so this is possible.
    For any set $S$ of left vertices, let $N \( S \)$ be its neighbor set.
    Counting incident edges gives $P \| S \| lt.eq P \| N \( S \) \|$.
    Hall’s theorem [6] Theorem 1 supplies a perfect matching.
    Remove it and repeat on the remaining regular graph, then discard all added edges.
    This gives the required $P$ matchings of original edges.
  Within one such matching, all block indices are distinct on both sides.
    Since its edges came from the increasing bit matching, their block pairs are strictly increasing in both
    indices. Their original letters agree, so they form a common subsequence of $x \, y$.
    Each of the $P$ matchings therefore has at most $"LCS" \( x \, y \)$ edges,
    and the total number of equal-label matches is at most $P "LCS" \( x \, y \)$.
  Combine the two counts with $N_(upright("mat")) = M P - delta$:
  #[#set math.equation(numbering: n => "(40)")
   $ P r_M \( x \, y \) lt.eq 201 delta + 2 M a_0 . $ <eq:code-additive>]
  Choose $M_0$ large enough that $2 M a_0 lt.eq P \/ 2$ for every $M gt.eq M_0$.
    If $x eq.not y$, then $r_M \( x \, y \) gt.eq 1$, and
  $ 201 delta gt.eq P r_M \( x \, y \) - P \/ 2 gt.eq \( P \/ 2 \) r_M \( x \, y \) . $
  Apply this to a longest encoded matching to obtain (38). For $x = y$, that inequality is immediate. By (2),
  $ "ED" \( "enc" \( x \) \, "enc" \( y \) \) gt.eq r_(M P) \( "enc" \( x \) \, "enc" \( y \) \) gt.eq P /
    402 r_M \( x \, y \) gt.eq P / 804 "ED" \( x \, y \) . $
  For the upper bound, extend $c$ to all finite words by concatenation.
    Simulate each insertion or deletion in an optimal original edit script by $P$ bit operations and each
    substitution by at most $P$ bit substitutions. This proves (37); the intermediate word lengths may be arbitrary. ◻
]

The segment property is a property of the chosen codebook,
  so the theorem holds simultaneously for every pair in $Gamma^M$. The choice is tied to $M$:
  its guarantee is for one prescribed input length and does not assert a logarithmic block width.

For the finite tree, $K lt.eq 2 m^k k^(5 k) lt.eq M$ for all large $k$.
  This theorem therefore also gives binary witnesses of length $M^3$ with distortion at least
  $\( k \/ 4 \)^k \/ \( 804 C_1 \)$. The scale $P$ cancels when an embedding is composed with the code.
  This alternative retains an absolute distortion loss, at the cost of longer words than the delimiter conversion
  used in Section 3.

#heading(level: 1)[References]
#bibitem([1])[Alexandr Andoni, Michel Deza, Anupam Gupta, Piotr Indyk, and Sofya Raskhodnikova.
  #emph[Lower Bounds for Embedding Edit Distance into Normed Spaces].
  In Proceedings of the Fourteenth Annual ACM--SIAM Symposium on Discrete Algorithms, pages 523--526, 2003.
  #link("https://www.cs.columbia.edu/~andoni/papers/k2n2.pdf").]
#bibitem([2])[Sudatta Bhattacharya, Sanjana Dey, Elazar Goldenberg, and Michal Koucký.
  #emph[Many Flavors of Edit Distance]. In 44th IARCS Annual Conference on Foundations of Software Technology and
  Theoretical Computer Science, Leibniz International Proceedings in Informatics, volume 323,
  pages 11:1--11:16, 2024. Schloss Dagstuhl--Leibniz-Zentrum für Informatik.
  #link("https://doi.org/10.4230/LIPIcs.FSTTCS.2024.11"). Full version: #link("https://arxiv.org/abs/2410.09877v1").]
#bibitem([3])[Sudatta Bhattacharya, Sanjana Dey, Elazar Goldenberg, Mursalin Habib, Bernhard Haeupler, Karthik C.
  S., and Michal Koucký. #emph[Constant Rate Isometric Embeddings of Hamming Metric into Edit Metric].
  In 53rd International Colloquium on Automata, Languages, and Programming,
  Leibniz International Proceedings in Informatics, volume 374, pages 32:1--32:19, 2026.
  Schloss Dagstuhl--Leibniz-Zentrum für Informatik. #link("https://doi.org/10.4230/LIPIcs.ICALP.2026.32").
  Full version: #link("https://arxiv.org/abs/2504.03605v2").]
#bibitem([4])[Paul Erdős. #emph[Beweis eines Satzes von Tschebyschef].
  Acta litterarum ac scientiarum Regiae Universitatis Hungaricae Francisco-Josephinae:
  Sectio scientiarum mathematicarum, volume 5, pages 194--198, 1932. #link("https://acta.bibl.u-szeged.hu/13396/").]
#bibitem([5])[Bernhard Haeupler and Amirbehshad Shahrasbi. #emph[Synchronization Strings:
  Codes for Insertions and Deletions Approaching the Singleton Bound].
  In Proceedings of the 49th Annual ACM SIGACT Symposium on Theory of Computing, pages 33--46, 2017.
  #link("https://doi.org/10.1145/3055399.3055498"). Full version dated April 3, 2017:
  #link("https://arxiv.org/abs/1704.00807v1"). Journal version:
  Journal of the ACM, 68(5), Article 36, 2021, #link("https://doi.org/10.1145/3468265").]
#bibitem([6])[Philip Hall. #emph[On Representatives of Subsets].
  Journal of the London Mathematical Society, s1-10(1):26--30, 1935. #link("https://doi.org/10.1112/jlms/s1-10.37.26").]
#bibitem([7])[Wassily Hoeffding. #emph[Probability Inequalities for Sums of Bounded Random Variables].
  Journal of the American Statistical Association, 58(301):13--30, 1963.
  #link("https://doi.org/10.1080/01621459.1963.10500830").]
#bibitem([8])[Subhash Khot and Assaf Naor. #emph[Nonembeddability Theorems via Fourier Analysis].
  Mathematische Annalen, 334(4):821--852, 2006. #link("https://doi.org/10.1007/s00208-005-0745-0"). Full version:
  #link("https://arxiv.org/abs/math/0510547v1").]
#bibitem([9])[Dénes König. #emph[Über Graphen und ihre Anwendung auf Determinantentheorie und Mengenlehre].
  Mathematische Annalen, 77:453--465, 1916. #link("https://doi.org/10.1007/BF01456961").
  English translation by Ágnes Cseh, December 22, 2024: #link("https://arxiv.org/abs/2412.17140v1").]
#bibitem([10])[Robert Krauthgamer and Yuval Rabani. #emph[Improved Lower Bounds for Embeddings into $L_1$].
  SIAM Journal on Computing, 38(6):2487--2498, 2009. #link("https://doi.org/10.1137/060660126").]
#bibitem([11])[Vladimir I. Levenshtein. #emph[Binary Codes Capable of Correcting Deletions, Insertions,
  and Reversals]. Soviet Physics Doklady, 10(8):707--710, 1966.
  English translation of Doklady Akademii Nauk SSSR, 163(4):845--848, 1965. Original publication record:
  #link("https://www.mathnet.ru/eng/dan31411").]
#bibitem([12])[Nathan Linial, Eran London, and Yuri Rabinovich.
  #emph[The Geometry of Graphs and Some of Its Algorithmic Applications]. Combinatorica, 15(2):215--245, 1995.
  #link("https://doi.org/10.1007/BF01200757").]
#bibitem([13])[OpenAI. #emph[An Almost-Linear Approximation Scheme for Edit Distance].
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/An-Almost-Linear-Approximation-Scheme-for-Edit-Distance-September-24-2026/paper.pdf")[OAI:An-Almost-Linear-Approximation-Scheme-for-Edit-Distance-September-24-2026], 2026.
  Theorem~1.1, page~3.]
#bibitem([14])[OpenAI. #emph[Finite-Circle Obstructions, Binary Codes,
  and Histogram Embeddings for Edit Distance]. OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Finite-Circle-Obstructions-Binary-Codes-and-Histogram-Embeddings-for-Edit-Distance-September-27-2026/paper.pdf")[OAI:Finite-Circle-Obstructions-Binary-Codes-and-Histogram-Embeddings-for-Edit-Distance-September-27-2026], 2026.
  Uniform upper embedding theorem: Theorem~8.1, page~25.]
#bibitem([15])[Rafail Ostrovsky and Yuval Rabani. #emph[Low Distortion Embeddings for Edit Distance].
  Journal of the ACM, 54(5), Article 23, 2007. #link("https://doi.org/10.1145/1284320.1284322").
  Preliminary author version dated August 19, 2005: #link("https://web.cs.ucla.edu/~rafail/PUBLIC/68.pdf").]
#bibitem([16])[Leonard J. Schulman and David Zuckerman. #emph[Asymptotically Good Codes Correcting Insertions,
  Deletions, and Transpositions]. IEEE Transactions on Information Theory, 45(7):2552--2557, 1999.
  #link("https://doi.org/10.1109/18.796406").]
#bibitem([17])[Robert A. Wagner and Michael J. Fischer. #emph[The String-to-String Correction Problem].
  Journal of the ACM, 21(1):168--173, 1974. #link("https://doi.org/10.1145/321796.321811").]
