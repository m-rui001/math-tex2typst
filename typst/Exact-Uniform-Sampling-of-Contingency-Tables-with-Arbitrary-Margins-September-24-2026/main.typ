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

#align(center)[#text(size: 16pt, weight: "bold")[Exact Uniform Sampling of Contingency Tables \
with Arbitrary Margins]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

For nonnegative integer vectors $r = \( r_1 \, dots.h \, r_m \)$ and $c = \( c_1 \, dots.h \, c_n \)$ with common
  total $N$, write

$ Omega \( r \, c \) = {X in bb(Z)_(gt.eq 0)^(m times n) : sum_j X_(i j) = r_i \, quad sum_i X_(i j) = c_j} . $

The uniform distribution on this finite set gives every table equal mass.
  We study sampling when both dimensions vary and the margins are encoded in binary.
  In particular, a polynomial bound in the numeric total $N$ would not, in general,
  give a polynomial bound in the input length. There are no cell bounds or forbidden positions:
  every nonnegative integer matrix with the prescribed margins is allowed.
  For probability laws on a finite set, we use the convention $"TV" \( mu \, nu \) = 1 / 2 sum_x \| mu \( x \) -
  nu \( x \) \|$.

#thm([Theorem 1.1.])[
  #emph[For arbitrary nonnegative integer margins of equal total,
    the following algorithms exist in the model of unbiased random bits and bit operations.]
  + #emph[Given an integer $k gt.eq 1$, a bounded-time algorithm outputs a table in $Omega \( r \, c \)$ whose law
    is within $2^(- k)$ in total variation of the uniform law.
    Its running time is polynomial in $m \, n \, log \( N + 1 \) \, k$.]
  + #emph[An algorithm outputs an exactly uniform table in $Omega \( r \, c \)$, terminates almost surely,
    and has expected running time polynomial in $m \, n \, log \( N + 1 \)$.]
  #emph[The polynomials are uniform over all margin vectors.
    No positivity, sparsity, balance, or fixed-dimension hypothesis is imposed.]
] <thm:main>

For a rational tolerance $0 < epsilon < 1$ encoded by a binary numerator and denominator,
  integer comparisons compute $k = ceil.l log_2 \( 1 \/ epsilon \)
  ceil.r$ in time polynomial in that encoding length. Thereafter part (i) has accuracy dependence polynomial in
  $log \( 1 \/ epsilon \)$. The algorithms below are explicit, although their exponents are deliberately large.
  Part (ii) concerns expected time: an exceptionally rare branch performs exhaustive computation.

===== 1.1 Counting and sampling fixed-margin arrays. <counting-and-sampling-fixed-margin-arrays.>

Contingency tables are a basic family of integer arrays with linear constraints.
  Their enumeration and exact and approximate generation are treated, for example,
  by Diaconis and Gangolli #cite(label("DiaconisGangolli1995")).
  The algorithmic question involves more than producing one feasible table:
  the law must give all feasible tables nearly or exactly the same mass,
  even when their number and the coordinate ranges are exponentially large in the margin bit length.

For two rows, Dyer and Greenhill #cite(label("DyerGreenhill2000")) give polynomial-time approximate counting and
  sampling. Their heat-bath chain has mixing time at most $n \( n - 1 \) log \( N \/ epsilon \) \/
  2$ in the author version’s Theorem 4.1. Dependence on $log
  N$ rather than $N$ makes this a polynomial bound in the binary input length.
  Kijima and Matsui #cite(label("KM2003")) Theorems 3.1 and 5.1 give exact uniform sampling for two rows by
  monotone coupling from the past, after sorting the columns.
  Their expected $O \( n^3 ln N \)$ bound is stated for pseudocode using uniform real draws.
  These results allow arbitrary two-row margin sizes after deleting zero margins.

The fixed-row case extends beyond two rows. Cryan and Dyer #cite(label("CD2003")) combine dynamic programming with
  volume estimation for approximate counting and sampling. Dyer #cite(label("Dyer2003")) Section 3 gives a
  dynamic-programming rejection sampler that is exactly uniform, analyzed in arithmetic operations.
  Cryan, Dyer, Goldberg, Jerrum, and Martin #cite(label("CDGJM2006")) prove rapid mixing of the $2 times
  2$ heat-bath chain for every fixed number of rows. The polynomial bounds in these results depend on that fixed
  row count; they do not give a bound polynomial jointly in both dimensions.

DeSalvo and Zhao #cite(label("DZ2016")) Theorem 2.3 and Remarks 2.4–2.5 give a general exact divide-and-conquer
  construction using $O \( m n log M \)$ expected random bits, where $M$ is the largest margin.
  In the cited arXiv version, their polynomial total-runtime conclusion is conditional on efficient evaluation of
  the parity-restricted counting quantities in Conjecture 2.6; the bit-time bounds in Theorem 1 are unconditional.

Another line of work uses the geometry of the transportation polytope when margins are large.
  Dyer, Kannan, and Mount #cite(label("DKM1997")) develop scaled coordinates, softened constraints, lattice walks,
  and rounding comparisons for dense tables. Morris #cite(label("Morris2002")) improves the dense sampling bounds
  through expanded polytopes and rounding. These methods are close antecedents of the dense completion routine
  below. Our use of that routine is conditional: a padding construction makes every completion problem dense,
  while a separate chain handles all cells incident to small margins.

For sparse margins, Arman, Gao, and Wormald #cite(label("AGW2021")) Theorem 1 and Remark 2 give exact uniform
  generation under $5 Delta^4 < N$, where $Delta$ is the largest margin,
  in expected $O \( N \)$ time with unit-cost arithmetic on integers of magnitude $O \( N \)$.
  The condition is a genuine restriction, although within this family it also bounds $N$ polynomially in the
  dimensions. Their 2021 introduction surveys fixed-row, dense,
  and sparse algorithms and reports that no polynomial-time approximately uniform sampler for arbitrary margins
  was then known. Theorem 1 removes those margin and dimension restrictions and includes all random bits and
  integer arithmetic in its cost.

===== 1.2 Approximation and exact correction. <approximation-and-exact-correction.>

Exactness and bounded running time are separate issues. Our approximate algorithm has a deterministic polynomial
  work bound for each accuracy request. The final exact correction uses the residual-mixture construction of
  Göbel, Liu, Manurangsi, and Pappik #cite(label("GLMP2024")) Section 3.1, Algorithm 1 and Theorem 6.
  That construction combines a sufficiently accurate sampler with a rare exhaustive draw from the remaining
  probability mass. Its application here requires an additional property:
  the actual implemented output law can be tabulated in time with an exponential input-size factor but only
  polynomial dependence on the accuracy bits. We prove that property and give the dyadic implementation
  explicitly. Thus the exact algorithm has polynomial expected bit cost, not a polynomial bound on every execution.

===== 1.3 Proof strategy. <proof-strategy.>

Only cells incident to a margin below a polynomial threshold are explicit coordinates of the auxiliary chain.
  The remaining cells form a complete rectangle. We pad this rectangle so every conditional completion problem has
  large margins. Each explicit cell has two bounded integer values, one for its row and one for its column.
  Besides states where these values agree, called transversals,
  we allow a positive unit discrepancy at one cell and a negative unit discrepancy at another.

The target law on these small states assigns weight equal to the number of padded completions.
  Sampling a state from that law and then a uniform completion makes all state/completion pairs equally likely.
  Accept only a transversal whose large completion entries are all at least the padding.
  Subtracting it then gives a uniform original table conditional on acceptance.
  Section 2 constructs a repair map for the defect states and uses it to bound their weight and the probability of
  successful unpadding. The bounded sampler never evaluates completion counts:
  an ideal transition uses a uniform completion draw to test a proposed move.

To prove that this chain mixes in polynomial time, we expose the small-cell values of a transversal in a fixed
  order. After fixing a prefix, we compare the averages of any real function on the state graph over the two
  fibers that assign adjacent values to the next cell. The comparison comes from quadratic forms indexed by pairs
  of unit removals. Section 3 proves that these forms have at most one positive eigenvalue and that the property
  survives summing out a balanced pair. A weighted telescoping calculation then bounds the energy of a signed flow
  between neighboring conditional fibers. Section 4 combines this bound with conditional-variance decomposition
  and repair to obtain a Poincaré inequality for the completion-count law. This supplies the small chain’s mixing bound.

Section 5 implements the completion draws approximately on a finite scaled grid,
  using rational arithmetic and dyadic random choices. A continuous log-concave density serves only as an analytic
  tool for the rejection and conductance bounds. Large coordinate ranges appear in finite sums in the proof but
  are never enumerated in an ordinary run. Section 6 couples each implemented completion draw to its ideal
  counterpart and bounds the number of sampling and unpadding attempts,
  giving the bounded almost-uniform algorithm. For exactness,
  it also shows how to tabulate that algorithm’s actual finite law, including its stopping rules and fallbacks.
  This exhaustive computation is performed only on the rare correction branch.

== 2 The binary model and the padded graph <sec:graph>

This section separates bounded small coordinates from a complete rectangle of large coordinates.
  Its repair map controls the mass of defect states; padding then gives a uniform lower bound on the chance of
  recovering an original table from a stationary state and its completion.

We count bit operations and use independent unbiased random bits.
  All margins are nonnegative integers given in binary, with common total $N$.
  Accuracy is specified by an integer $k gt.eq 1$, meaning error at most $2^(- k)$.
  An empty dimension forces $N = 0$ and gives a unique empty table.
  If $N = 0$, or if one dimension is one, the unique table can likewise be returned directly.
  In all remaining constructions the dimensions are positive, and we use

#[#set math.equation(numbering: n => "(2.1)")
 $ d = 10 + \( m + 1 \) \( n + 1 \) \, wide L = d^12 \, wide U = d^20 \,\
C = N + d L + U + 2 \, wide b = d + ceil.l log_2 \( C + 2 \) ceil.r . $ <eq:parameters>]

Here $d$ is a dimension allowance, $L$ the padding, $U$ the small-margin threshold, $C$ a coordinate cap,
  and $b$ a bit-size allowance. Thus $d gt.eq 14$, $m n < d$, $U < C$, and $b = O \( d + log \( N + 1 \) \)$.
  Polynomial bounds in $d \, b \, k$ have the required binary-input dependence.
  A fixed feasible table is obtained greedily: choose a row and column of positive remaining margins,
  place the minimum of those two margins in their cell, and subtract it from both margins.
  Each placement exhausts a row or column. This uses at most $m + n -
  1$ positive placements and polynomial bit work, including initialization of the output.
  We fix index order for this construction and all later ties.

=== 2.1 Small states and large completions <small-states-and-large-completions>

Put $I = { i : r_i gt.eq U }$ and $J = { j : c_j gt.eq U }$.
  The #emph[large slots] are the cells in the complete rectangle $cal(B) = I times J$;
  the remaining cells form the set $cal(S)$ of #emph[small slots].
  Set $B_s = C$ on $cal(B)$ and $B_s = U$ on $cal(S)$. Associate to each slot two coordinates $x_s \,
  y_s in { 0 \, dots.h \, B_s }$, and put $q_s = B_s - y_s$.
  Here $x$ is the row viewpoint and $q$ is the column viewpoint.
  A slot is #emph[balanced] when $x_s = q_s$, equivalently $x_s + y_s = B_s$.
  The balanced representation of a value $a in { 0 \, dots.h \, B_s }$ is $\( x_s \, y_s \) = \( a \, B_s - a \)$;
  both $x_s$ and $q_s$ then equal $a$.

A graph state retains only the coordinates on $cal(S)$. Its allowed pattern is either a #emph[transversal],
  with all slots balanced, or a #emph[defect], with distinct slots $t \, s$ satisfying

$ x_t = q_t + 1 \, wide x_s = q_s - 1 \, wide x_v = q_v quad \( v in.not { s \, t } \) . $

We call $t$ positive and $s$ negative. Both patterns have total doubled occupancy
  $sum_(s in cal(S)) \( x_s + y_s \) = U \| cal(S) \|$. Define the original residual margins by

$ R_i^0 \( X \) = r_i - sum_(j : \( i \, j \) in cal(S)) x_(i j) \, wide P_j^0 \( X \) = c_j -
  sum_(i : \( i \, j \) in cal(S)) q_(i j) . $

Their totals agree because $sum_(s in cal(S)) \( x_s - q_s \) = 0$.
  Let $k_i$ and $ell_j$ be the numbers of large slots in row $i$ and column $j$.
  A state is #emph[feasible] when all residuals are nonnegative and $R_i^0 = 0$ if $k_i = 0$, $P_j^0 =
  0$ if $ell_j = 0$. Its padded residuals and enlarged full margins are

$ R_i \( X \) & = R_i^0 \( X \) + k_i L \, & P_j \( X \) & = P_j^0 \( X \) + ell_j L \,\
macron(r)_i & = r_i + k_i L \, & macron(c)_j & = c_j + ell_j L . $

Write $cal(F)_X$ for the set of nonnegative integer tables on $cal(B)$ with margins $R_i \( X \) \, P_j \( X \)$,
  and set $f \( X \) = \| cal(F)_X \|$. On infeasible states set $f \( X \) = 0$.
  The complete rectangle admits a greedy completion whenever these residual tests hold.
  If $cal(B)$ is empty the only completion is the empty table, so feasible states have weight one.

Every completion has total at most $N + \| cal(B) \| L < C$, and every nonempty block margin is at least $L$.
  In particular the formal large capacity $C$ excludes no completion:
  its doubled coordinates can be taken as $x_s = A_s \, y_s = C - A_s$ for $A in cal(F)_X$.
  The bounded sampler will draw completions of this block without enumerating its large coordinate ranges.
  One-row or one-column blocks have a unique completion and need no random draw.

Let $cal(X)$ be the feasible states, $cal(T) subset.eq cal(X)$ the transversals, and

#[#set math.equation(numbering: n => "(2.2)")
 $ Z_0 = sum_(X in cal(T)) f \( X \) \, wide Lambda = sum_(X in cal(X)) f \( X \) \, wide pi \( X \) =
   frac(f \( X \), Lambda) . $ <eq:graph-masses>]

An original feasible table gives a transversal and a completion by retaining its small entries and adding $L$ to
  each large entry. The small entries respect their capacity because every small cell has an incident original
  margin below $U$. This construction also gives a specified starting transversal, using the greedy original table.

=== 2.2 Repairs and graph edges <repairs-and-graph-edges>

For a defect with negative slot $s = \( i \, j \)$ and positive slot $t = \( i' \, j' \)$,
  put $v = \( i' \, j \)$. With $e_w$ denoting a small-slot unit vector, define its repair $cal(R) \( X \)$ by

#[#set math.equation(numbering: n => "(2.3)")
 $ x' = x - e_t + upright(bold(1))_({ v in cal(S) }) e_v \, wide q' = x' \, wide y' = U upright(bold(1)) -
   q' . $ <eq:repair-map>]

The term involving $e_v$ is omitted if $v$ is large. The undirected graph on $cal(X)$ contains all pairs that
  differ by lowering one doubled small coordinate by one and raising another by one, and also every pair ${ X \,
  cal(R) \( X \) }$ with $X$ a defect. Repeated edges are counted only once. Its unnormalized energy is

#[#set math.equation(numbering: n => "(2.4)")
 $ E \( H \) = sum_({ X \, Y } upright(" an edge")) min { f \( X \) \,
   f \( Y \) } \( H \( X \) - H \( Y \) \)^2 . $ <eq:graph-energy>]

#thm([Lemma 2.1.])[
  (Repair and preservation of prefixes).  #emph[The repair is a feasible transversal.
    For each fixed ordered pair $\( s \, t \)$ it is injective on small states and extends to an injection
$ \( X \, A \) mapsto
  cases(delim: "{", \( cal(R) \( X \) \, A \) \, & v in cal(S) \,, \( cal(R) \( X \) \, A + e_v \) \, & v in
  cal(B)) quad \( A in cal(F)_X \) . $

 Thus $f \( X \) lt.eq f \( cal(R) \( X \) \)$. Order small slots by row and then by column.
   If $t$ follows $s$, the repair leaves every slot preceding $s$ unchanged.
   When additionally $x_s = l - 1 \, q_s = l$, its repaired value at $s$ is $l$ if $i' = i$ and $l - 1$ otherwise.]
] <lem:repair>

#proof[
  The defect relation is $q = x - e_t + e_s$, and $x_t gt.eq 1$.
    If $v$ is small, the changes to $x$ lie in row $i'$, with zero total; the changes to $q$ are $q' - q = e_v -
    e_s$, in column $j$, also with zero total. Hence all residual margins are unchanged.
    The new common entries are nonnegative. Their row totals are the old $x$ row totals and their column totals
    are the old $q$ column totals. At each small slot, one of these totals is bounded by an original margin
    strictly below $U$, proving the capacity constraint. If $j' = j$, then $v =
    t$ and the two changes to $x$ cancel; the reset of $q$ is confined to that column. If $i' = i$, then $v = s$:
    the transfer increments the negative slot, decrements the positive slot, and leaves $q$ unchanged.
    These include both possible coincidences.
  If $v$ is large, it differs from $s \, t$, and $x' = x - e_t$, $q' = q - e_s$.
    These vectors remain nonnegative and within capacity, since $x_t gt.eq 1$ and $q_s = x_s + 1 gt.eq 1$.
    Only the residuals of row $i'$ and column $j$ increase, each by one. Both lines meet the large block.
    Adding one to completion entry $v$ therefore gives a valid target completion.
    Its entries remain below $C$ by the total bound already proved.
  For fixed $s \, t$, the repaired vector recovers $x = x' + e_t - upright(bold(1))_({ v in cal(S) }) e_v$,
    followed by $q = x - e_t + e_s$ and $y = U upright(bold(1)) - q$.
    In the large-receiver case subtract $e_v$ from the target completion; otherwise retain it.
    These inverses on the image prove both injections.
  Finally, $t > s$ implies either $i' = i \, j' > j$, in which case $v = s$, or $i' > i$,
    in which case every small receiver $v$ follows $s$. Only $s \, t \, v$ can change,
    proving prefix preservation and the claimed special value. ◻
]

For later use, fix a balanced prefix $sigma$ before $s$, and let $z_(-) \,
  z_(+)$ be the total transversal weights extending it with special values $x_s = l - 1 \, l$, respectively.
  Let $c_(s t \, l)^sigma$ be the total weight of defects extending that prefix with negative $s$ satisfying
  $x_s = l - 1 \, q_s = l$ and positive $t > s$. Lemma 2 maps this entire class injectively, with completions,
  into one fixed child. Hence

#[#set math.equation(numbering: n => "(2.5)")
 $ c_(s t \, l)^sigma lt.eq cases(delim: "{", z_(+) \, & i' = i \,, z_(-) \, & i' eq.not i \,) wide
   upright("and in particular") wide c_(s t \, l)^sigma lt.eq max { z_(-) \, z_(+) } . $ <eq:conditional-repair>]

Figure 1 illustrates the large-receiver case.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((2.4, -2.24), (4.8, -1.12), fill: rgb("#e8e8ff"), stroke: none)
  rect((0, 0), (4.8, -2.24), stroke: (thickness: 0.55pt, miter-limit: 10))
  line((2.4, 0), (2.4, -2.24), stroke: (thickness: 0.55pt, miter-limit: 10))
  line((0, -1.12), (4.8, -1.12), stroke: (thickness: 0.55pt, miter-limit: 10))
  content((2.4, 0.88), [#text(size: 9pt)[Defect]])
  content((1.2, 0.3), [#text(size: 9pt)[$c_(j')<U$]])
  content((3.6, 0.3), [#text(size: 9pt)[$c_j gt.eq U$]])
  content((-0.15, -0.56), [#text(size: 9pt)[$r_i<U$]], anchor: "east", padding: 0.1176cm)
  content((-0.15, -1.68), [#text(size: 9pt)[$r_(i') gt.eq U$]], anchor: "east", padding: 0.1176cm)
  content((1.2, -0.56), [#box(width: 2.4cm, inset: 0.03528cm, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[unchanged]]])])
  content((3.6, -0.56), [#box(width: 2.4cm, inset: 0.03528cm, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$s:#h(0.3333em) (a,a+1)$#linebreak() negative]]])])
  content((1.2, -1.68), [#box(width: 2.4cm, inset: 0.03528cm, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$t:#h(0.3333em) (b+1,b)$#linebreak() positive]]])])
  content((3.6, -1.68), [#box(width: 2.4cm, inset: 0.03528cm, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$z$#linebreak() large entry]]])])
  line((5, -1.12), (5.9, -1.12), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", length: 0.2cm, fill: black)))
  rect((8.6, -2.24), (11, -1.12), fill: rgb("#e8e8ff"), stroke: none)
  rect((6.2, 0), (11, -2.24), stroke: (thickness: 0.55pt, miter-limit: 10))
  line((8.6, 0), (8.6, -2.24), stroke: (thickness: 0.55pt, miter-limit: 10))
  line((6.2, -1.12), (11, -1.12), stroke: (thickness: 0.55pt, miter-limit: 10))
  content((8.6, 0.88), [#text(size: 9pt)[Repaired transversal]])
  content((7.4, 0.3), [#text(size: 9pt)[$j'$]])
  content((9.8, 0.3), [#text(size: 9pt)[$j$]])
  content((7.4, -0.56), [#box(width: 2.4cm, inset: 0.03528cm, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[unchanged]]])])
  content((9.8, -0.56), [#box(width: 2.4cm, inset: 0.03528cm, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$(a,a)$]]])])
  content((7.4, -1.68), [#box(width: 2.4cm, inset: 0.03528cm, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$(b,b)$]]])])
  content((9.8, -1.68), [#box(width: 2.4cm, inset: 0.03528cm, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$z+1$]]])])
})],
  caption: [Figure 1: The repair when the receiving cell $\( i' \, j \)$ is large. Small cells display $\( x \, q \)$, and the shaded cell displays a completion entry. Decreasing $x_t$ and matching the viewpoints increases the residual row margin at $i'$ and column margin at $j$ by one; adding one to $z$ gives an injective map of completions. The other cells remain unchanged. ],
) <fig:repair>

There are fewer than $4 d^2$ ordered unit exchanges. A defect has one designated repair;
  a transversal has at most $d^2$ inverse repairs, one for each ordered defect type.
  Thus the degree is at most $5 d^2 + 1$. Neighbors can be listed with polynomial bit work using (2.3) and its
  inverse, testing the boxes, patterns and residuals, and removing duplicates. No completion count is needed.
  On a repair edge the weight in (2.4) equals the source defect’s weight.

=== 2.3 Stationary mass and unpadding <stationary-mass-and-unpadding>

The repair bounds defect mass by transversal mass. To recover an original table from a padded completion,
  we also need to control the probability that a large entry is smaller than the padding.
  The following estimate applies to unrestricted tables with any prescribed margins.

#thm([Lemma 2.2.])[
  (Small entries).  #emph[Consider the uniform law on all nonnegative integer tables with prescribed margins,
    with at most $m$ rows and $n$ columns and no entry restrictions.
    If both margins incident to a cell are at least $a gt.eq 4 d$, then, for every integer $t$ with $0 < t lt.eq
    a \/ 2$,
$ bb(P) { upright("the cell’s entry is less than ") t } lt.eq frac(4 t d^3, a) . $

]
] <lem:small-entry>

#proof[
  Let the marked cell be $\( i \, j \)$ and its entry be $h < t$.
    The other entries in its row have sum at least $a \/ 2$, as do the other entries in its column.
    Unless this event is empty, choose deterministically $j' eq.not j$ and $i' eq.not
    i$ whose donor entries are both at least $a \/ \( 2 d \)$.
    Such choices exist because each line has fewer than $d$ entries.
    If there is only one row or column, the event is empty instead.
    For every $v = 1 \, dots.h \, floor.l a \/ \( 2 d \) floor.r$,
    subtract $v$ from the entries $\( i \, j' \)$ and $\( i' \, j \)$ and add $v$ at $\( i \, j \)$ and
    $\( i' \, j' \)$. The resulting table is nonnegative with the same margins.
    Given this table and the labels $\( i' \, j' \, h \)$, its marked entry determines $v$,
    and reversing the four changes recovers the source. There are at most $t d^2$ possible labels for each output.
    Since $floor.l a \/ \( 2 d \) floor.r gt.eq a \/ \( 4 d \)$,
    double counting these moves gives the asserted bound. No upper entry bound is imposed in this argument. ◻
]

#thm([Proposition 2.3.])[
  (Stationary mass and unpadding).  #emph[The masses satisfy
#[#set math.equation(numbering: n => "(2.6)")
 $ 0 < Z_0 lt.eq Lambda lt.eq \( 1 + d^2 \) Z_0 \, wide pi_min gt.eq \( C + 1 \)^(- 2 d) .
   $ <eq:stationary-mass-bounds>]

 Draw $X$ with law $pi$ and then a uniform $A in cal(F)_X$.
   Declare success if $X$ is a transversal and every large entry of $A$ is at least $L$.
   Subtracting $L$ from these entries gives a uniform original table conditional on success, and
#[#set math.equation(numbering: n => "(2.7)")
 $ bb(P) { upright("success") } gt.eq frac(1, 2 \( 1 + d^2 \)) . $ <eq:unpadding-success>]

]
] <prop:stationary-success>

#proof[
  For each of at most $\| cal(S) \| \( \| cal(S) \| - 1 \) lt.eq d^2$ defect types,
    the joint injection in Lemma 2 bounds its total weight by $Z_0$.
    This proves the upper bound on $Lambda$; the other mass inequalities follow from inclusion and the greedy
    starting table. There are $Lambda$ joint objects $\( X \, A \)$,
    each specified by $2 \| cal(S) \| + \| cal(B) \| lt.eq 2 m n < 2 d$ integer coordinates in $\[ 0 \, C \]$.
    Thus $Lambda lt.eq \( C + 1 \)^(2 d)$, and the positive integer weights $f \( X \)$ give the minimum-mass bound.
  Consider all unrestricted tables with the enlarged margins $macron(r) \, macron(c)$, and call their number $F$.
    Every transversal and completion gives one such table, so $Z_0 lt.eq F$.
    Each large cell has both enlarged margins at least $U$. Lemma 3 and a union bound show that the proportion of
    these enlarged tables with some large entry below $L$ is at most
  $ \| cal(B) \| frac(4 L d^3, U) lt.eq frac(4 L d^4, U) = 4 / d^4 < 1 / 2 . $
  Here $L lt.eq U \/ 2$ and $U gt.eq 4 d$; an empty block has no bad cells.
    Every enlarged table passing this test can be unpadded to an original table.
    Conversely, padding every original table gives exactly one passing table and a feasible transversal with its
    completion. Consequently the successful pairs are in bijection with $Omega \( r \, c \)$ and number at least
    $F \/ 2 gt.eq Z_0 \/ 2$. Under the stated joint law every pair has probability
    $\( f \( X \) \/ Lambda \) \( 1 \/ f \( X \) \) = 1 \/ Lambda$, proving conditional uniformity and (2.7). ◻
]

If there are no small slots, $cal(X)$ has one state and all graph energies vanish;
  the completion and unpadding step still applies. If there is no large block,
  the completion step is deterministic. These conventions will also be used for the Markov chains below.

== 3 Quadratic signatures and balanced summation <sec:signatures>

The transport construction uses quadratic forms with at most one positive eigenvalue.
  We prove the required property for integer coordinates and then show that it survives summation over balanced
  slots. Integer coordinates allow two units to be removed at the same location,
  so the diagonal entries and the endpoints of the summation require explicit treatment.
  Large capacities occur only in finite mathematical sums in this section;
  the algorithm will not enumerate those sums. The one-positive-eigenvalue viewpoint is central to the theory of
  Lorentzian polynomials developed by Brändén and Huh #cite(label("BH2020")).
  Here the needed closure is a discrete balanced-pair summation,
  established by the laminar decomposition and telescoping calculation below.

#prodef([Definition 3.1.])[
  (Softened weights).  Let $cal(B)$ and $cal(S)$ be the large and small slots from Section 2, and put
  $ T = sum_s B_s \, wide cal(Q) = product_s { 0 \, dots.h \, B_s }^2 . $
  For a full coordinate vector $xi = \( x_s \, y_s \)_s$, write $\| xi \| = sum_s \( x_s + y_s \)$ and $q_s =
    B_s - y_s$. For $a in bb(R)$, let $a_(+) = max \( a \, 0 \)$. Define
  $ D \( xi \) =  & sum_i lr(|sum_j x_(i j) - macron(r)_i|) + sum_j lr(|sum_i q_(i j) - macron(c)_j|)\
 & + sum_i (sum_(j : \( i \, j \) in cal(S)) x_(i j) - r_i)_(+) +
   sum_j (sum_(i : \( i \, j \) in cal(S)) q_(i j) - c_j)_(+) . $
  For $0 < eta < 1$, set
  $ F_eta \( xi \) =
    cases(delim: "{", eta^(D \( xi \)) \, & xi in cal(Q) \, quad \| xi \| = T \,, 0 \, & upright("otherwise") .) $
  For a small-coordinate configuration $X$ of total $sum_(s in cal(S)) B_s$, define
  #[#set math.equation(numbering: n => "(3.1)")
   $ f_eta \( X \) = sum_(\( x_s \, y_s \) = \( a_s \, B_s - a_s \) \, med 0 lt.eq a_s lt.eq B_s\
s in cal(B)) F_eta \( X \, \( x_s \, y_s \)_(s in cal(B)) \) . $ <eq:soft-marginal>]
  An empty product of choices contributes one term.
] <def:soft-weight>

Every box-valid full vector of total $T$ has strictly positive weight,
  regardless of its margin deviations or slot occupancies. Thus $f_eta \( X \) >
  0$ for every box-valid $X$ of the indicated total. On the transversal and defect patterns,

#[#set math.equation(numbering: n => "(3.2)")
 $ lim_(eta arrow.b 0) f_eta \( X \) = f \( X \) . $ <eq:soft-limit>]

Indeed, a term has $D = 0$ exactly when the full row and column margins are $macron(r) \,
  macron(c)$ and the small row and column totals do not exceed $r \, c$.
  When the large slots are balanced, these conditions specify precisely the nonnegative residuals and padded
  completions defining $f$. On a line without a large slot, the full-margin equality also makes the residual zero.
  The capacity $C$ excludes no such completion, by its choice in (2.1).
  Each zero-penalty term tends to one, all other terms tend to zero, and the sum is finite.

We use the following convention throughout. Some coordinates have fixed box-valid values $sigma$,
  of total $c = \| sigma \|$; a disjoint collection $cal(R)$ of whole slots is summed over its balanced profiles;
  and all remaining coordinates are active. For an assignment $v$ to the active coordinates, let

$ Phi_(sigma \, cal(R)) \( v \) = sum_(b in product_(s in cal(R)) { \( a \, B_s - a \) : 0 lt.eq a lt.eq B_s })
  F_eta \( sigma \, v \, b \) . $

Thus the summation domain is fixed, even when $v$ changes. A box-valid active display $p$ for two removals satisfies

#[#set math.equation(numbering: n => "(3.3)")
 $ c + \| p \| + sum_(s in cal(R)) B_s = T + 2 . $ <eq:two-removal-total>]

Its two-removal matrix has entries $M_(i h) = Phi_(sigma \, cal(R)) \( p - e_i - e_h \)$.
  In particular, two removals at the same coordinate give a diagonal entry; an invalid removal gives zero.
  The display has total $T + 2$, whereas every nonzero entry is evaluated at total $T$.

#thm([Lemma 3.2.])[
  (Laminar factors).  #emph[With no balanced slots summed, every two-removal matrix just defined has at most one
    positive eigenvalue.]
] <lem:laminar-signature>

#proof[
  Before imposing the box and total, the formula $eta^(D \( xi \))$ is a product of positive log-concave sequences
    in sums over a laminar family of coordinate sets. Here laminar means that any two sets are disjoint or one
    contains the other. The sets are the $x$ coordinates of each row and their small-slot subsets,
    and the $y$ coordinates of each column and their small-slot subsets.
    The row and column families are disjoint because they use different coordinates.
    For example, the column factors have the form
  $ eta^(\| K - z - macron(c)_j \|) \, wide eta^(\( K' - z - c_j \)_(+)) \, $
  where $z$ is the relevant sum of $y$ coordinates and $K \, K'$ are the corresponding sums of capacities.
    All exponents are convex in $z$; since $log eta < 0$, the factors are log-concave on all integers.
  An active coordinate with $p_i = 0$ gives a zero row and column of $M$; discard these indices temporarily.
    Restrict the laminar sets to the remaining indices and absorb fixed coordinates into shifts of their scalar
    factors. Combine factors whose restricted sets coincide, and absorb empty sets into a positive constant.
    We obtain distinct nonempty laminar sets $G$, positive log-concave sequences $psi_G$,
    and arguments $t_G$ at the display. Evaluate their formula even for invalid removals for the moment.
    Let $W > 0$ be its value at the display and put
  $ alpha_i = product_(G in.rev i) frac(psi_G \( t_G - 1 \), psi_G \( t_G \)) \, wide gamma_G =
    frac(psi_G \( t_G \) psi_G \( t_G - 2 \), psi_G \( t_G - 1 \)^2) in \( 0 \, 1 \] . $
  The extended two-removal matrix is $W "diag" \( alpha \) K "diag" \( alpha \)$, where
  $ K_(i h) = product_(G supset.eq { i \, h }) gamma_G . $
  For each set define
  $ a_G = \( 1 - gamma_G \) product_(G' supset.neq G) gamma_(G') gt.eq 0 . $
  The sets containing any given pair of indices form a chain.
    Telescoping the product along this chain gives the exact identity
  #[#set math.equation(numbering: n => "(3.4)")
   $ K = upright(bold(1)) upright(bold(1))^(sans(T)) - sum_G a_G upright(bold(1))_G upright(bold(1))_G^(sans(T)) .
     $ <eq:laminar-blocks>]
  Consequently $K$ is nonpositive on ${ v : upright(bold(1))^(sans(T)) v =
    0 }$ and has at most one positive eigenvalue. The only still-invalid removals are diagonal ones at coordinates
    with $p_i = 1$. Replacing each such entry by zero subtracts a nonnegative diagonal matrix from $K$,
    so preserves that conclusion. Positive diagonal congruence and restoration of the zero rows and columns
    complete the proof. ◻
]

We next sum over a fresh slot of capacity $B$. Two occupancies are needed.
  At occupancy $B$, summing the profiles $\( j \, B - j \)$ eliminates a balanced slot and preserves the
  signature. At occupancy $B + 1$, the same calculation gives a weighted quadratic estimate;
  this is the estimate used to bound the transport construction in the next section.
  Both conclusions follow from a discrete second-difference inequality.

#thm([Lemma 3.3.])[
  (Pair summation).  #emph[Fix a box-valid display $p$ on the old active coordinates,
    a fresh slot of capacity $B gt.eq 2$, and fixed context and balanced sums as above.
    Choose its displayed occupancy $D' in { B \, B + 1 }$ so that
#[#set math.equation(numbering: n => "(3.5)")
 $ c + \| p \| + D' + sum_(s in cal(R)) B_s = T + 2 . $ <eq:pair-total>]

 Write $Phi \( r \, a \, b \)$ for the weight after the balanced sums,
   with old values $r$ and fresh pair $\( a \, b \)$. The box-valid displays $\( p \, j \, D' - j \)$ are indexed by
$ cal(J) = cases(delim: "{", { 0 \, dots.h \, D' } \, & D' = B \,, { 1 \, dots.h \, D' - 1 } \, & D' = B + 1 .) $

 Their two-removal matrices have the blocks
$ \( V_j \)_(i h) & = Phi \( p - e_i - e_h \, j \, D' - j \) \,\
S \( l \)_i & = Phi \( p - e_i \, l \, D' - 1 - l \) \,\
u_j & = Phi \( p \, j - 1 \, D' - 1 - j \) . $

 Thus $V_j$ records two old removals, $S \( l \)$ one old and one fresh removal,
   and $u_j$ one removal from each fresh coordinate of display $j$.
   Put $S \( l \) = 0$ outside $0 lt.eq l lt.eq D' - 1$ and $u_j = 0$ outside $1 lt.eq j lt.eq D' - 1$.
   Suppose each matrix
#[#set math.equation(numbering: n => "(3.6)")
 $ M_j =
   mat(delim: "(", V_j, S \( j - 1 \), S \( j \); S \( j - 1 \)^(sans(T)), u_(j - 1), u_j; S \( j \)^(sans(T)),
   u_j, u_(j + 1)) \, wide j in cal(J) \, $ <eq:pair-block>]

 has at most one positive eigenvalue. The entries $u_(j - 1)$ and $u_(j + 1)$ are the double removals at the first
   and second fresh coordinates, respectively. For every real old vector $h$ satisfying $sum_(l = 0)^(D' - 1)
   h^(sans(T)) S \( l \) = 0$, define
#[#set math.equation(numbering: n => "(3.7)")
 $ g_j = frac(sum_(l = 0)^(j - 1) h^(sans(T)) S \( l \), u_j) quad \( 1 lt.eq j lt.eq D' - 1 \) \, wide g_j =
   0 quad upright("otherwise") . $ <eq:pair-cumulative>]

 All these divisions are valid, and
#[#set math.equation(numbering: n => "(3.8)")
 $ - h^(sans(T)) V_j h med gt.eq med 2 u_j g_j^2 - u_(j - 1) g_(j - 1)^2 - u_(j + 1) g_(j + 1)^2 \, wide
   j in cal(J) . $ <eq:pair-one>]

 If $D' = B$, the matrix $sum_(j = 0)^B V_j$ has at most one positive eigenvalue. If $D' = B + 1$, then
#[#set math.equation(numbering: n => "(3.9)")
 $ 2 sum_(j = 1)^(D' - 1) u_j g_j^2 med lt.eq med - h^(sans(T)) (sum_(j = 1)^(D' - 1) j \( D' - j \) V_j) h .
   $ <eq:pair-weighted>]

]
] <lem:pair-summation>

#proof[
  First, $u_j > 0$ for every $1 lt.eq j lt.eq D' - 1$. Its pair values $\( j - 1 \, D' - 1 - j \)$ are within
    $\[ 0 \, B \]^2$ in both cases. They have total $D' - 2$,
    so (3.5) puts the full configuration on the total-$T$ slice.
    Choose any balanced box-valid profile, for example $\( 0 \, B_s \)$, at each summed slot.
    The unchanged old profile and fixed context then give a positive term of $F_eta$.
    This proves positivity even when the context violates the original margins or some old displayed coordinates
    are zero.
  The cumulative definition and the balance condition imply, including $l = 0 \, D' - 1$,
  #[#set math.equation(numbering: n => "(3.10)")
   $ h^(sans(T)) S \( l \) = u_(l + 1) g_(l + 1) - u_l g_l . $ <eq:pair-difference>]
  We use an elementary consequence of the signature assumption.
    If a symmetric matrix $M$ has at most one positive eigenvalue and $e^(sans(T)) M e > 0$, then
  #[#set math.equation(numbering: n => "(3.11)")
   $ v^(sans(T)) M v lt.eq frac(\( v^(sans(T)) M e \)^2, e^(sans(T)) M e) . $ <eq:positive-projection>]
  Indeed, subtract from $v$ its $M$-orthogonal projection onto $e$.
    The remaining vector must have nonpositive square, since otherwise it and $e$ span a positive definite
    two-dimensional subspace.
  For $j in cal(J)$, put $v = \( h \, g_j \, - g_j \)$, and let $e_a \,
    e_b$ denote the two fresh coordinate directions. Equations (3.6) and (3.10) give
  $ v^(sans(T)) M_j e_a = u_(j - 1) \( g_j - g_(j - 1) \) \, wide v^(sans(T)) M_j e_b =
    u_(j + 1) \( g_(j + 1) - g_j \) . $
  If $u_(j - 1) > 0$, apply (3.11) to $e_a$; if $u_(j + 1) > 0$, apply it to $e_b$. Either bound is at most
  $ u_(j - 1) \( g_j - g_(j - 1) \)^2 + u_(j + 1) \( g_j - g_(j + 1) \)^2 . $
  If both diagonals vanish, then $u_j > 0$ and $e_a + e_b$ has square $2 u_j$ and is $M_j$-orthogonal to $v$.
    The same upper bound, now zero, follows. These cases cover all admissible $j$:
    at $j = 0$ or $D'$ the inward diagonal is positive, and at every other index $u_j > 0$.
    An exact expansion now yields
  $ & v^(sans(T)) M_j v - u_(j - 1) \( g_j - g_(j - 1) \)^2 - u_(j + 1) \( g_j - g_(j + 1) \)^2\
 & wide  = h^(sans(T)) V_j h + 2 u_j g_j^2 - u_(j - 1) g_(j - 1)^2 - u_(j + 1) g_(j + 1)^2 \, $
  proving (3.8).
  For clarity, the smallest capacity is covered without a positive diagonal at every display.
    When $B = D' = 2$, the displays $j = 0 \, 2$ use the diagonal $u_1 > 0$, and $j =
    1$ uses the positive sum direction with square $2 u_1$. When $B = 2 \, D' = 3$, the only displays are $j =
    1 \, 2$; they have, respectively, positive diagonal $u_2$ and $u_1$.
    The out-of-box displays $j = 0 \, 3$ are never evaluated.
  Write $a_j = u_j g_j^2$, zero outside $1 lt.eq j lt.eq D' - 1$.
    For $D' = B$, summing (3.8) over $0 lt.eq j lt.eq D'$ gives
  $ - h^(sans(T)) #scale(x: 180%, y: 180%)[\(] sum_(j = 0)^(D') V_j #scale(x: 180%, y: 180%)[\)] h gt.eq
    sum_(j = 0)^(D') \( 2 a_j - a_(j - 1) - a_(j + 1) \) = 0 . $
  Thus the sum is nonpositive on the kernel of $h mapsto h^(sans(T)) sum_l S \( l \)$,
    a subspace of codimension at most one. A positive eigenspace of dimension two would intersect that kernel
    nontrivially, so the sum has at most one positive eigenvalue.
    For $D' = B + 1$, let $w_j = j \( D' - j \)$, with $w_0 = w_(D') = 0$.
    Multiplying (3.8) by $w_j$ and summing only over the admissible indices gives
  $ sum_(j = 1)^(D' - 1) w_j \( 2 a_j - a_(j - 1) - a_(j + 1) \) =
    sum_(j = 1)^(D' - 1) \( 2 w_j - w_(j - 1) - w_(j + 1) \) a_j = 2 sum_(j = 1)^(D' - 1) a_j . $
  This proves (3.9), using only scalar zero endpoint weights, never endpoint matrices outside the box. ◻
]

#thm([Proposition 3.4.])[
  (Signature after balanced summation).  #emph[Fix $0 < eta < 1$.
    For arbitrary box-valid fixed context $sigma$, arbitrary balanced-slot summation set $cal(R)$,
    and arbitrary box-valid active display $p$ satisfying (3.3), the matrix
$ #scale(x: 120%, y: 120%)[\(] Phi_(sigma \, cal(R)) \( p - e_i - e_h \) #scale(x: 120%, y: 120%)[\)]_(i \, h) $

 has at most one positive eigenvalue.]
] <prop:signature>

#proof[
  Induct on $\| cal(R) \|$. Lemma 6 proves the empty case. For a nonempty set choose $t in cal(R)$,
    regard its two coordinates as active at $\( j \, B_t - j \)$, and sum only over $cal(R) \\ { t }$.
    Every resulting matrix $M_j$ has at most one positive eigenvalue by induction; its total is $T + 2$ by (3.3).
    Apply Lemma 7 with $D' = B_t$. The matrix $sum_(j = 0)^(B_t)
    V_j$ is exactly the required matrix after also summing slot $t$, and has the asserted signature.
    All capacities here are at least two. Zero active coordinates give zero rows and columns throughout and need
    no additional assumption. ◻
]

This is a specific closure under balanced-pair summation, proved by (3.8);
  arbitrary sums of matrices with this signature need not preserve it.
  In the transport argument, a weighted matrix $V_t = sum_j j \( D' - j \)
  V_j$ will be tested against real vectors $h$ whose entries may have either sign.
  Equation (3.9) controls these quadratic evaluations under the stated balance condition.
  We make no signature assertion for $V_t$ itself. In particular,
  Proposition 8 is applied before this weighted sum, on the entire softened total-$T$ box,
  even when the resulting two-removal configurations lie outside the graph patterns.

== 4 Transport and the graph variance bound <sec:transport>

We now turn the quadratic property into a variance bound for the graph of Section 2.
  A signed flow compares adjacent conditional means; decomposing variance over successive conditions gives a bound
  on the transversals, and the repair map extends it to the full graph.
  All large slots are summed with their balances throughout. The remaining slots are exposed in row-major order.
  Fix a real-valued function $H$ on the feasible small-state graph.
  The flow-energy comparison is the standard quadratic electrical-network method;
  see Aldous and Fill #cite(label("AF2002")) Section 3.7.1.
  The recursive signed demands and their bound for integer slots are constructed here.
  A #emph[context] $sigma$ fixes balanced profiles on a prefix of small slots.
  Write $cal(T)_sigma$ for the transversals with this context and $z_sigma = sum_(X in cal(T)_sigma) f \( X \)$.
  If $s$ is the next slot, its child $j$ fixes $\( x_s \, y_s \) = \( j \, U - j \)$,
  and has mass $z_j$ and weighted mean $H_j$. Means are used only for positive masses.

Let $E_sigma \( H \)$ be the sum of $min \( f \( X \) \, f \( Y \) \) \( H \( X \) - H \( Y \) \)^2$ over
  unordered #emph[unit-exchange] edges whose endpoints respect $sigma$.
  In particular $E_sigma \( H \) lt.eq E \( H \)$; repair edges need not be included in $E_sigma$.
  A superscript $eta$ on masses or means, and $E_(eta \, sigma)$ on this energy,
  will indicate the softened weights from Definition 5. For the softened energy we include all box-admissible
  transversal and defect patterns with the context, including states whose limiting weight is zero.

=== 4.1 Child weights and adjacent means <child-weights-and-adjacent-means>

#thm([Lemma 4.1.])[
  (Child log-concavity).  #emph[At every context with positive transversal mass,
    the child masses $\( z_j \)_(j = 0)^U$ are log-concave and their positive support is an integer interval.
    If $z_a \, z_b > 0$ and $a lt.eq j lt.eq b$, then $z_j gt.eq min \( z_a \, z_b \)$.]
] <lem:child-logconcavity>

#proof[
  For $0 < eta < 1$ every child mass is positive. For $1 lt.eq j < U$,
    display the next pair as $\( j + 1 \, U - j + 1 \)$ and sum every other unexposed slot with its balance.
    The display is in its box and has two excess units. Its two-removal matrix is
  $ mat(delim: "(", z_(j - 1)^eta, z_j^eta; z_j^eta, z_(j + 1)^eta) . $
  Proposition 8 gives at most one positive eigenvalue. The trace is positive, so the determinant is nonpositive:
    $\( z_j^eta \)^2 gt.eq z_(j - 1)^eta z_(j + 1)^eta$. Consequently the successive differences of $log
    z_j^eta$ are nonincreasing, and for $a < j < b$,
  $ z_j^eta gt.eq \( z_a^eta \)^(\( b - j \) \/ \( b - a \)) \( z_b^eta \)^(\( j - a \) \/ \( b - a \)) . $
  Finite sums converge as $eta arrow.b 0$. The local inequalities give log-concavity in the limit;
    the displayed interpolation gives positivity between positive endpoints and the asserted lower bound. ◻
]

#thm([Lemma 4.2.])[
  (Conditional transport).  #emph[Let $sigma$ be a row-major context, and let children $l - 1 \,
    l$ of its next slot have positive masses $z_(-) \, z_(+)$ and means $H_(-) \, H_(+)$. Then
#[#set math.equation(numbering: n => "(4.1)")
 $ min \( z_(-) \, z_(+) \) \( H_(-) - H_(+) \)^2 lt.eq A_0 E_sigma \( H \) \, wide A_0 = 2 +
   2 d \( U + 1 \)^2 . $ <eq:conditional-transport>]

]
] <lem:transport>

#proof[
  We first work at a fixed $eta > 0$. Extend $H$ by arbitrary fixed finite values to the box-admissible graph
    patterns whose limiting weights are zero, and suppress $eta$ on masses.
    We seek a signed flow with divergence $f_eta \( X \) \/ z_(-)$ at each transversal in the minus child, $-
    f_eta \( X \) \/ z_(+)$ at each transversal in the plus child, and zero elsewhere.
    For such a flow $J$, summation by parts and Cauchy–Schwarz give
  $ \( H_(-)^eta - H_(+)^eta \)^2 lt.eq
    (sum_(X Y) frac(J \( X \, Y \)^2, min \( f_eta \( X \) \, f_eta \( Y \) \))) E_(eta \, sigma) \( H \) \, $
  where each unit-exchange edge is oriented once. Thus it is enough to bound the flow’s resistance energy.
    We build its signed demands by successively exposing the remaining small slots,
    and charge its energy to a quadratic potential along that recursion.
  Display the special slot $s$ as $\( l \, U + 1 - l \)$, where $1 lt.eq l lt.eq U$.
    Removing its first or second coordinate gives the minus or plus child, respectively.
    The flow uses these endpoint transversals and defects with $s$ positive and one other unexposed small slot negative.
  #emph[Balanced recursion.] A recursion node $nu$ displays the special pair and some subsequent small pairs,
    the latter all with occupancy $U$. Let $p$ be this display, and call its coordinates the old indices.
    With the context included, and all undisplayed slots assigned their balanced occupancies, the total is $T +
    1$, where $T = sum_s B_s$. For an old index $i$, let $s_i$ be the total softened weight obtained by removing
    one unit there and summing all undisplayed slots with their balances. Invalid removals have weight zero.
    Assign coefficients $h_i$ satisfying
  #[#set math.equation(numbering: n => "(4.2)")
   $ sum_i s_i h_i = 0 \, wide Phi_nu = sum_i s_i h_i^2 . $ <eq:balanced-demands>]
  The quantity $s_i h_i$ is the signed demand on that one-removal fiber;
    the first equality requires total demand zero at the node.
    At the root the two coefficients are $1 \/ z_(-)$ and $- 1 \/ z_(+)$,
    giving the prescribed endpoint demands and root potential $1 \/ z_(-) + 1 \/ z_(+)$.
  To process the next ordinary slot $v$, branch over its balanced profiles $\( j \, U - j \)$, $0 lt.eq j lt.eq
    U$. In the notation of Lemma 7, use the auxiliary occupancy $D' = U + 1$.
    Then $S \( j \)$ is the vector of old-hole weights in branch $j$,
    and $u_j$ is the no-old-hole weight with pair $\( j - 1 \, U - j \)$.
    Thus $u_1 \, dots.h \, u_U$ are positive and $u_0 = u_(U + 1) = 0$. Since $sum_j S_i \( j \) = s_i$, define
  #[#set math.equation(numbering: n => "(4.3)")
   $ g_j = frac(sum_(a = 0)^(j - 1) h^T S \( a \), u_j) quad \( 1 lt.eq j lt.eq U \) \, wide g_0 = g_(U + 1) =
     0 . $ <eq:transport-g>]
  Balance gives $h^T S \( j \) = u_(j + 1) g_(j + 1) - u_j g_j$, including both endpoints.
    In child $j$, retain all old coefficients and give the two new coordinates coefficients $g_j \, - g_(j + 1)$.
    Their one-hole masses are $u_j \, u_(j + 1)$, so the child is balanced.
    Summing child potentials conserves the old terms and adds exactly
  #[#set math.equation(numbering: n => "(4.4)")
   $ sum_(j = 0)^U Phi_(nu j) - Phi_nu = 2 sum_(j = 1)^U u_j g_j^2 lt.eq -
     h^T V_(nu \, v) h . $ <eq:potential-increment>]
  Here $V_(nu \, v)$ is the matrix of two-old-hole weights with $v$ displayed at $\( a \, U + 1 - a \)$,
    summed over $1 lt.eq a lt.eq U$ with multiplier $a \( U + 1 - a \)$ and over all other undisplayed slots with
    their balances. The inequality is precisely Equation (3.9).
    Each individual display before the two removals has total $T + 2$.
  #emph[A future quadratic form.] For any slot $t$ still to be processed, define $Q_t \( nu \) =
    h^T V_(nu \, t) h$ by the same rule. If a different slot $v$ is split now, we claim
  #[#set math.equation(numbering: n => "(4.5)")
   $ sum_(j = 0)^U Q_t \( nu j \) gt.eq Q_t \( nu \) . $ <eq:future-monotonicity>]
  For an explicit common summation kernel, put
  $ K_t \( r \, w \) = sum_(a = 1)^U a \( U + 1 - a \) sum_b F_eta #scale(x: 120%, y: 120%)[\(] sigma \, r \,
    w \, \( a \, U + 1 - a \) \, b #scale(x: 120%, y: 120%)[\)] . $
  Here $r$ assigns the old coordinates, $w$ assigns the current pair $v$,
    and $b$ ranges over the Cartesian product of balanced profiles of every remaining slot other than $t$,
    including all large slots. As usual, an invalid coordinate assignment contributes zero.
    This is a single fixed summation domain; all penalties are evaluated on the full configurations.
    Every kernel entry used below has total $T$.
  The old–old terms in the children partition the parent’s balanced sum over $v$.
    For a mixed term, removing old index $i$ and the first new coordinate in branch $j$ gives
    $K_t \( p - e_i \, \( j - 1 \, U - j \) \)$ with coefficient $2 h_i g_j$.
    Removing $i$ and the second new coordinate in branch $j -
    1$ gives the identical kernel entry with coefficient $- 2 h_i g_j$. These terms cancel.
    All legal resulting pairs have occupancy $U - 1$; the unmatched formal endpoint removals are invalid and have
    weight zero. For the new–new terms, each resulting pair $\( k \, U - 2 - k \)$, $0 lt.eq k lt.eq U - 2$,
    has exactly the following contributions:
  #[
  #set par(justify: false)
#table(
  columns: 3,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Removed coordinates
], table.cell(rowspan: 1, colspan: 1)[Branch
], table.cell(rowspan: 1, colspan: 1)[Coefficient
]),
  table.cell(rowspan: 1, colspan: 1)[First twice
], table.cell(rowspan: 1, colspan: 1)[$k + 2$
], table.cell(rowspan: 1, colspan: 1)[$g_(k + 2)^2$
],
  table.cell(rowspan: 1, colspan: 1)[First and second
], table.cell(rowspan: 1, colspan: 1)[$k + 1$
], table.cell(rowspan: 1, colspan: 1)[$- 2 g_(k + 1) g_(k + 2)$
],
  table.cell(rowspan: 1, colspan: 1)[Second twice
], table.cell(rowspan: 1, colspan: 1)[$k$
], table.cell(rowspan: 1, colspan: 1)[$g_(k + 1)^2$
],
)
]
  They all multiply $K_t \( p \, \( k \, U - 2 - k \) \)$. Hence the exact identity is
  #[#set math.equation(numbering: n => "(4.6)")
   $ sum_(j = 0)^U Q_t \( nu j \) - Q_t \( nu \) = sum_(k = 0)^(U - 2)
     K_t \( p \, \( k \, U - 2 - k \) \) \( g_(k + 2) - g_(k + 1) \)^2 gt.eq 0 . $ <eq:future-square>]
  All omitted boundary removals are invalid. Auxiliary entries with two holes in an ordinary pair need not be
    graph states: they belong to the full softened total-$T$ slice where the signature proposition applies.
    No signature property of the weighted sum $V_(nu \, t)$ is being asserted;
    Equation (4.4) and the explicit square identity are the properties of that sum that are used.
  #emph[The root bound.] Iterating Equation (4.5) shows that the sum of $Q_t$ at the level just before processing
    $t$ is at least its root value. Thus Equation (4.4), summed over levels,
    bounds the total leaf potential by the root potential minus the sum of the root $Q_t$’s.
    Let $c_t = c_(s t \, l)^(eta \, sigma)$ be the total weight of defects respecting $sigma$ with special pair
    $\( l - 1 \, U - l \)$ negative, slot $t$ positive, and every other small slot balanced.
    These auxiliary defects differ from the special-positive defects used by the leaf flow:
    the off-diagonal entry removes both special coordinates from $\( l \, U + 1 - l \)$,
    leaving $\( l - 1 \, U - l \)$. At the root, the off-diagonal entry of $V_(nu \, t)$ is this sum with
    multiplier $a \( U + 1 - a \)$ on the positive pair $t$, so it is at most $\( U + 1 \)^2 c_t$.
    Its diagonal entries are nonnegative. Substituting the root coefficients and dropping their nonpositive
    contributions to $- Q_t$ gives
  #[#set math.equation(numbering: n => "(4.7)")
   $ sum_(nu upright(" leaf")) Phi_nu lt.eq 1 / z_(-) + 1 / z_(+) +
     frac(2 \( U + 1 \)^2, z_(-) z_(+)) sum_(t > s) c_t . $ <eq:leaf-potential>]
  The sum ranges only over the other unexposed small slots.
    With no such slots the recursion consists of its root and this bound still holds.
  #emph[Leaf flows and their divergences.] At a leaf let $D$ denote the entire small-coordinate display,
    including the fixed context. For its unfixed coordinate indices $i$, the valid one-removal states $X_i = D -
    e_i$ have weights $s_i = f_eta \( X_i \) > 0$, and form a clique of unit exchanges.
    Choose a maximum-weight vertex as hub. On the edge from each nonhub $X_i$ to the hub send signed flow $s_i
    h_i$; its conductance is exactly $s_i$. The flow’s divergence at $X_i$ is $s_i h_i$,
    and balance gives the same prescribed divergence at the hub.
    Its resistance energy is at most $sum_i s_i h_i^2 = Phi_nu$. Different leaf cliques have disjoint edge sets:
    the coordinatewise maximum of the endpoints recovers $D$, which uniquely determines the leaf.
    Their flows can therefore be added without an energy multiplier.
  An endpoint transversal has a unique leaf representation.
    Its ordinary balanced profiles determine all branches, and its special hole is in the first coordinate for the
    minus child and the second for the plus child. Its coefficient remains $1 \/ z_(-)$ or $-
    1 \/ z_(+)$ throughout. Every other used state has special slot positive and a unique ordinary negative pair,
    say $\( a \, U - 1 - a \)$ in slot $v$. It has exactly two leaf representations:
    fill the first coordinate, giving branch $a + 1$ and coefficient $g_(a + 1)$, or fill the second,
    giving branch $a$ and coefficient $- g_(a + 1)$. All earlier profiles are determined by the state,
    so both coefficients come from the same recursion parent. Later splits retain them.
    Both representations carry the identical weight $f_eta \( X \)$, and their divergences cancel.
    This also holds for $a = 0 \, U - 1$.
  Consequently the summed flow $J$ has divergence $f_eta \/ z_(-)$ on the minus child, $-
    f_eta \/ z_(+)$ on the plus child, and zero elsewhere. The resistance-energy comparison from the start of the
    proof and Equation (4.7) now eliminate the flow and all recursive coefficients:
  #[#set math.equation(numbering: n => "(4.8)")
   $ \( H_(-)^eta - H_(+)^eta \)^2 lt.eq
     (1 / z_(-)^eta + 1 / z_(+)^eta + frac(2 \( U + 1 \)^2 sum_(t > s) c_(s t \, l)^(eta \, sigma), z_(-)^eta
     z_(+)^eta)) E_(eta \, sigma) \( H \) . $ <eq:soft-transport>]
  #emph[The limit and conditional repair.] The extension of $H$ was fixed independently of $eta$.
    For this fixed input all sums are finite. Since the two limiting child masses are positive,
    every quantity in Equation (4.8) converges as $eta arrow.b 0$.
    We take this limit only after obtaining that inequality; convergence of the demands, the $g_j$’s,
    or the flows is unnecessary. For the limiting $c_(s t \, l)^sigma$,
    Lemma 2 injects state/completion pairs into one of the two child fibers.
    Specifically, since $t$ follows $s$ in row-major order, the receiver is either $s$ itself or lies in a later
    row, and all earlier assignments are preserved. The repaired special value is $l$ in the first case and $l -
    1$ in the second, with the choice fixed by $s \, t$. Thus
  $ c_(s t \, l)^sigma lt.eq max \( z_(-) \, z_(+) \) . $
  There are fewer than $d$ possible slots $t$. Multiplication of the limiting inequality by
    $min \( z_(-) \, z_(+) \)$ now yields Equation (4.1). ◻
]

=== 4.2 From conditional transport to variance <from-conditional-transport-to-variance>

#thm([Theorem 4.3.])[
  (Graph Poincaré inequality).  #emph[For every real function $H$ on the feasible small graph,
#[#set math.equation(numbering: n => "(4.9)")
 $ Lambda "Var"_(f \/ Lambda) H lt.eq (\( 1 + 2 d^2 \) 4 d^2 \( U + 1 \)^6 + 2) E \( H \) lt.eq
   770 d^4 U^6 E \( H \) . $ <eq:graph-poincare>]

 In particular, the feasible graph is connected.]
] <thm:poincare>

#proof[
  First restrict to transversals. At a positive-mass context $sigma$, put $p_j = z_j \/ z_sigma$.
    The between-child contribution to its unnormalized variance is
  #[#set math.equation(numbering: n => "(4.10)")
   $ z_sigma "Var"_p \( H_j \) = 1 / z_sigma sum_(a < b) z_a z_b \( H_a - H_b \)^2 . $ <eq:child-variance>]
  Zero-mass children may be omitted. For positive endpoints $a < b$,
    Lemma 9 makes every intervening mass at least $min \( z_a \, z_b \)$. Telescoping and Cauchy–Schwarz therefore give
  $ frac(z_a z_b, z_sigma) \( H_a - H_b \)^2 & lt.eq min \( z_a \, z_b \) \( b - a \)
    sum_(j = a)^(b - 1) \( H_j - H_(j + 1) \)^2\
 & lt.eq U sum_(j = a)^(b - 1) min \( z_j \, z_(j + 1) \) \( H_j - H_(j + 1) \)^2\
 & lt.eq U^2 A_0 E_sigma \( H \) . $
  There are at most $\( U + 1 \)^2$ pairs. Thus the contribution in Equation (4.10) is at most $\( U + 1 \)^4 A_0
    E_sigma \( H \)$.
  Iterating the identity $"Var" H = bb(E) \( "Var" \( H divides j \) \) +
    "Var" \( bb(E) \( H divides j \) \)$ down the exposure tree expresses the full unnormalized transversal
    variance as the sum of these contributions. At any fixed depth, the energies $E_sigma$ use disjoint edge sets,
    because distinct contexts assign different prefix coordinates.
    There are at most $d$ internal levels, and $A_0 lt.eq 4 d \( U + 1 \)^2$.
    Hence, writing $"Var"_(cal(T))$ for variance under the normalized transversal weights,
  #[#set math.equation(numbering: n => "(4.11)")
   $ Z_0 "Var"_(cal(T)) H lt.eq 4 d^2 \( U + 1 \)^6 E \( H \) . $ <eq:transversal-variance>]
  If there are no small slots, the transversal space is a singleton and this inequality holds directly.
  Let $overline(H)$ be the transversal mean, and compare each defect $X$ to its repair $cal(R) \( X \)$.
    By Lemma 2, $f \( X \) lt.eq f \( cal(R) \( X \) \)$, the repair map is injective within each of fewer than
    $d^2$ defect types, and its edge has conductance $f \( X \)$. Distinct defects give distinct repair edges.
    It follows that
  $ Lambda "Var"_(f \/ Lambda) H & lt.eq sum_(X in cal(X)) f \( X \) \( H \( X \) - overline(H) \)^2\
 & lt.eq Z_0 "Var"_(cal(T)) H + 2 sum_(X in.not cal(T)) f \( X \) \( H \( X \) - H \( cal(R) \( X \) \) \)^2\
 & #h(1.5em)  + 2 sum_(X in.not cal(T)) f \( X \) \( H \( cal(R) \( X \) \) - overline(H) \)^2\
 & lt.eq \( 1 + 2 d^2 \) Z_0 "Var"_(cal(T)) H + 2 E \( H \) . $
  Insert Equation (4.11) to obtain the first bound in Equation (4.9).
    Since $U gt.eq 1$, $1 + 2 d^2 lt.eq 3 d^2$ and $\( U + 1 \)^6 lt.eq 64 U^6$ give the second bound.
    Finally, the indicator of a nonempty proper connected component would have positive variance and zero energy,
    which is impossible. The one-state case is already connected. ◻
]

== 5 Sampling a dense completion block <sec:dense>

The completion distributions required by the small-state chain have large minimum margins,
  but their margins need not have comparable sizes. We now give the sampling subroutine,
  using the global parameters in Equation (2.1). All random choices in its implementation use finitely many
  independent unbiased bits.

#thm([Theorem 5.1.])[
  (Dense completion draw).  #emph[Let a rectangular block have at most $m$ rows and $n$ columns,
    nonnegative integer margins of equal total less than $C$, and every margin at least $L = d^12$.
    For each integer $h gt.eq 1$, there is an algorithm that always outputs a feasible integer table and whose law
    is within $2^(- h)$ in total variation of the uniform law on the block’s feasible tables.
    Its worst-case bit running time is polynomial in $d \, b \, h$.
    Empty blocks, and blocks having a single row or a single column,
    have deterministic completion algorithms with the same guarantee.]
] <thm:dense-draw>

The proof first groups integer tables into scaled bins and gives a constant lower bound on rejection-sampling
  acceptance. A log-concave continuous density controls the bin normalizer and the conductance of the finite bin
  chain. We then implement its transitions and the within-bin offsets with bounded numbers of random bits.
  The scaled-coordinate and softened-density construction follows the geometric approach of Dyer, Kannan,
  and Mount #cite(label("DKM1997")) Sections 4–5; expanded-polytope rounding is also central to
  Morris #cite(label("Morris2002")) Sections 1.3–2. The estimates and finite-bit sampler needed here are proved below.

=== 5.1 Scaled coordinates and rejection from bins <scaled-coordinates-and-rejection-from-bins>

The deterministic cases require no argument beyond the prescribed margins, so suppose the block has $a \, c gt.eq
  2$ rows and columns. Write its margins as $R_i \, P_j$. Reorder the rows and columns so that $R_a$ and $P_c$ are
  maximum, breaking ties by their original indices, and restore the original order when returning a table.
  The entries with $i < a \, j < c$ determine the entire table.
  We group their possible integer values into intervals of lengths

#[#set math.equation(numbering: n => "(5.1)")
 $ s_(i j) = min \( R_i \, P_j \) quad \( 1 lt.eq i lt.eq a \, med 1 lt.eq j lt.eq c \) \,\
B = d^8 \, quad K_0 = 4 B \, quad A = d^4 \,\
w_(i j) = ⌊s_(i j) / B⌋ quad \( i < a \, med j < c \) . $ <eq:dense-scales>]

There are $e = \( a - 1 \) \( c - 1 \) lt.eq d$ free entries. Since $s_(i j) gt.eq L gt.eq 2 B$,

#[#set math.equation(numbering: n => "(5.2)")
 $ frac(s_(i j), 2 B) lt.eq w_(i j) lt.eq s_(i j) / B . $ <eq:width-bounds>]

Each nonnegative integer free entry has a unique representation $X_(i j) = w_(i j) v_(i j) +
  beta_(i j)$ with integer $v_(i j) gt.eq 0$ and $0 lt.eq beta_(i j) < w_(i j)$.
  For a feasible table, $X_(i j) lt.eq s_(i j)$, so $v_(i j) lt.eq 2 B < K_0$.
  Thus all feasible tables are represented by bins indexed by

$ cal(V) = { 0 \, dots.h \, K_0 - 1 }^e $

and an offset in each free coordinate. The number of bins depends only on the dimensions,
  although an offset range can depend on the margins. We will give weight one to every bin containing a feasible
  table and choose the other weights by penalizing violations of nonnegativity.
  An ideal proposal then samples a weighted bin and uniform offsets, rejecting an infeasible table.

To define these weights, pass temporarily to scaled real coordinates.
  For $u in bb(R)^e$, define the affine table $X \( u \)$ by

$ X_(i j) \( u \) & = w_(i j) u_(i j) &  & \( i < a \, med j < c \) \,\
X_(i c) \( u \) & = R_i - sum_(j < c) w_(i j) u_(i j) &  & \( i < a \) \,\
X_(a j) \( u \) & = P_j - sum_(i < a) w_(i j) u_(i j) &  & \( j < c \) \,\
X_(a c) \( u \) & = R_a - sum_(j < c) P_j + sum_(i < a \, thin j < c) w_(i j) u_(i j) . $

These formulas impose all the margins. Let $T_(i j) = X_(i j) \/ s_(i j)$, including the dependent entries, and set

$ cal(P) = { u in bb(R)^e : T_(i j) \( u \) gt.eq 0 upright(" for every ") i \, j } . $

Every free scale contributing to a dependent entry is at most that entry’s scale.
  For example, $s_(i j) lt.eq s_(i c)$ follows from $P_j lt.eq P_c$, $s_(i j) lt.eq s_(a j)$ from $R_i lt.eq R_a$,
  and $s_(i j) lt.eq s_(a c)$ follows from both inequalities.
  Thus every coefficient in each normalized affine entry has absolute value at most $1 \/ B$,
  and there are at most $d$ of them. Consequently

#[#set math.equation(numbering: n => "(5.3)")
 $ \| T_(i j) \( u \) - T_(i j) \( v \) \| lt.eq d / B lr(bar.v.double u - v bar.v.double)_oo . $ <eq:dense-lipschitz>]

Feasibility and Equation (5.2) imply $cal(P) subset \[ 0 \, 2 B \]^e$.
  The integer representation above belongs to the closed unit bin $Q_v = v + \[ 0 \, 1 \]^e$,
  at the point with coordinates $u_(i j) = v_(i j) + beta_(i j) \/ w_(i j)$.

The feasible polytope has a point $u_(*)$ with uniform positive slack:

#[#set math.equation(numbering: n => "(5.4)")
 $ T_(i j) \( u_(*) \) gt.eq frac(1, 2 d) . $ <eq:dense-interior>]

To construct it, first assign $s_(i j) \/ \( 2 d \)$ to every cell.
  This uses at most $c R_i \/ \( 2 d \) lt.eq R_i \/ 2$ in row $i$ and at most $a P_j \/ \( 2 d \) lt.eq
  P_j \/ 2$ in column $j$. The remaining nonnegative real margins have equal totals and can be completed by the
  greedy supply–demand construction. The resulting table determines $u_(*)$.
  The strict slack and Equation (5.3) also show that $cal(P)$ has positive $e$-dimensional volume.

On the cube $\[ 0 \, K_0 \]^e$ define

#[#set math.equation(numbering: n => "(5.5)")
 $ p \( u \) = max #scale(x: 120%, y: 120%)[\(] 0 \, max_(i j) \( - T_(i j) \( u \) - d \/ B \)
   #scale(x: 120%, y: 120%)[\)] \, wide rho \( u \) = 2^(- A p \( u \)) . $ <eq:dense-penalty>]

The allowance $d \/ B$ makes $p$ vanish at the lower corner of every bin meeting $cal(P)$, by Equation (5.3).
  The function $p$ is convex and $\( d \/ B \)$-Lipschitz in the sup norm; therefore $rho$ is positive,
  continuous, and log-concave. Comparison with $u_(*) in \[ 0 \, 2 B \]^e$ gives $0 lt.eq p \( u \) lt.eq
  4 d$ on the cube. Assign the dyadic bin weights

#[#set math.equation(numbering: n => "(5.6)")
 $ E_v = floor.l A p \( v \) floor.r \, wide W \( v \) = 2^(- E_v) \, wide Z_B =
   sum_(v in cal(V)) W \( v \) . $ <eq:dense-bin-weights>]

In particular $W \( v \) = 1$ whenever $Q_v$ contains a feasible point, even on its boundary. For $u in Q_v$,

$ \| A p \( u \) - floor.l A p \( v \) floor.r #scale(x: 120%, y: 120%)[\|] lt.eq 1 + A d \/ B = 1 + d^(- 3) < 2 \, $

so

#[#set math.equation(numbering: n => "(5.7)")
 $ 1 / 4 W \( v \) lt.eq rho \( u \) lt.eq 4 W \( v \) . $ <eq:bin-density-comparison>]

This comparison lets integrals of $rho$ control sums of bin weights;
  overlapping bin faces have zero volume in these integrals.

An #emph[ideal trial] draws $v$ with probability $W \( v \) \/ Z_B$,
  then draws independent uniform offsets $beta_(i j) in { 0 \, dots.h \, w_(i j) - 1 }$ and sets

#[#set math.equation(numbering: n => "(5.8)")
 $ X_(i j) = w_(i j) v_(i j) + beta_(i j) wide \( i < a \, med j < c \) . $ <eq:dense-offset-output>]

It fills the remaining entries to give the prescribed margins and accepts exactly when all entries are nonnegative.

#thm([Proposition 5.2.])[
  (Bin rejection).  #emph[An ideal trial succeeds with probability at least $1 \/ 64$.
    Conditional on success, its output is exactly uniform on the feasible integer tables.]
] <prop:bin-acceptance>

#proof[
  The unique bin-and-offset representation of a feasible integer table has a bin of weight one.
    The table’s probability before rejection is therefore
  #[#set math.equation(numbering: n => "(5.9)")
   $ 1 / Z_B product_(i < a \, thin j < c) 1 / w_(i j) \, $ <eq:dense-equal-table-mass>]
  independent of the table. The dependent entries are integers because they are integer sums and differences.
    This proves conditional uniformity, including tables on faces and widths of different sizes.
  For the success bound, let $n_(upright("full"))$ be the number of bins whose entire closure is contained in
    $cal(P)$. Each has weight one and accepts every offset, so its contribution to the success probability is
    $1 \/ Z_B$. We compare $n_(upright("full"))$ and $Z_B$ with $"vol" \( cal(P) \)$.
    Set $cal(P)^(-) = { u : T_(i j) \( u \) gt.eq 2 d \/ B upright(" for every ") i \, j }$.
    The affine map $u mapsto \( 1 - alpha \) u + alpha u_(*)$ with $alpha =
    4 d^2 \/ B$ sends $cal(P)$ into $cal(P)^(-)$ by Equation (5.4). Hence Bernoulli’s inequality gives
  #[#set math.equation(numbering: n => "(5.10)")
   $ "vol" \( cal(P)^(-) \) gt.eq \( 1 - 4 d^2 \/ B \)^e "vol" \( cal(P) \) gt.eq \( 1 - 4 d^3 \/ B \)
     "vol" \( cal(P) \) gt.eq 1 / 2 "vol" \( cal(P) \) . $ <eq:dense-inner-volume>]
  Except on grid boundaries, every point of $cal(P)^(-)$ lies in a bin whose entire closure is in $cal(P)$:
    the change of any normalized entry across that bin is at most $d \/ B$.
    These bins cover $cal(P)^(-)$ up to a null set and each has volume one, so $n_(upright("full")) gt.eq
    "vol" \( cal(P)^(-) \) gt.eq "vol" \( cal(P) \) \/ 2$.
  To bound $Z_B$, for any $gamma gt.eq 0$ consider the entire relaxed polytope $cal(P)_gamma = { u :
    T_(i j) \( u \) gt.eq - gamma upright(" for all ") i \, j }$ in $bb(R)^e$, without a cube restriction.
    For $u in cal(P)_gamma$ the point
  $ z = frac(u + 2 d gamma u_(*), 1 + 2 d gamma) $
  belongs to $cal(P)$, since the affine coefficients sum to one and each $T_(i j) \( z \) gt.eq 0$.
    Thus $cal(P)_gamma subset u_(*) + \( 1 + 2 d gamma \) \( cal(P) - u_(*) \)$, and
  #[#set math.equation(numbering: n => "(5.11)")
   $ "vol" \( cal(P)_gamma \) lt.eq \( 1 + 2 d gamma \)^e "vol" \( cal(P) \) lt.eq
     exp \( 2 d^2 gamma \) "vol" \( cal(P) \) . $ <eq:dense-relaxed-volume>]
  This argument also covers points with negative free coordinates.
    The sublevel set ${ p lt.eq \( j + 1 \) \/ A }$ inside the sampling cube is contained in
    $cal(P)_(d \/ B + \( j + 1 \) \/ A)$. Summing the upper bounds for the penalty layers and using Equation (5.7) gives
  $ Z_B & lt.eq 4 integral_(\[ 0 \, K_0 \]^e) rho \( u \) thin d u\
 & lt.eq 4 sum_(j gt.eq 0) 2^(- j) exp #scale(x: 120%, y: 120%)[\(] 2 d^2 \( d \/ B + \( j + 1 \) \/ A \)
   #scale(x: 120%, y: 120%)[\)] "vol" \( cal(P) \) lt.eq 32 "vol" \( cal(P) \) . $
  For the last numerical bound put $a_0 = 2 \/ d^2$ and $b_0 = 2 \/ d^5$.
    Since $a_0 + b_0 lt.eq 1 \/ 4$, both $exp \( a_0 \)$ and $exp \( a_0 + b_0 \)$ are at most $4 \/ 3$.
    The geometric sum is at most $4 \( 4 \/ 3 \) \/ \( 1 - \( 4 \/ 3 \) \/ 2 \) = 16$,
    which is stronger than asserted. Consequently
  $ bb(P) { upright("success") } gt.eq n_(upright("full")) / Z_B gt.eq
    frac("vol" \( cal(P) \) \/ 2, 32 "vol" \( cal(P) \)) = 1 / 64 . $
  ◻
]

=== 5.2 An integral interpolation inequality <an-integral-interpolation-inequality>

We supply the continuous inequality used to mix the bins.
  It is an analytic proof device; the algorithm never integrates or samples a real density.
  This finite-box statement is a special case of the Prékopa–Leindler inequality #cite(label("Leindler1972"))
  #cite(label("Prekopa1973")). We include the one-dimensional transport argument and induction on slices to
  specify the regularity needed here.

#thm([Lemma 5.3.])[
  (Finite-box integral interpolation).  #emph[Let $S_1 \, S_2 \,
    S_0$ be bounded finite unions of open axis-aligned boxes in $bb(R)^q$, and let $0 < t < 1$,
    with $\( 1 - t \) S_1 + t S_2 subset S_0$. Let $f_1 \, f_2 \,
    f_0$ be positive continuous functions on a compact box containing the closures of these sets. If
$ f_0 \( \( 1 - t \) x + t y \) gt.eq f_1 \( x \)^(1 - t) f_2 \( y \)^t quad \( x in S_1 \, med y in S_2 \) \, $

 then
#[#set math.equation(numbering: n => "(5.12)")
 $ integral_(S_0) f_0 gt.eq (integral_(S_1) f_1)^(1 - t) (integral_(S_2) f_2)^t . $ <eq:integral-interpolation>]

 In particular, for finite unions $S \, D_0$ of open boxes in the sampling cube,
#[#set math.equation(numbering: n => "(5.13)")
 $ integral_(\( 1 - t \) S + t D_0) rho gt.eq (integral_S rho)^(1 - t) (integral_(D_0) rho)^t .
   $ <eq:dense-logconcave-interpolation>]

]
] <lem:integral-interpolation>

#proof[
  We first prove the one-dimensional integral assertion in the slightly larger class needed for slices.
    Suppose $F \, G \, H$ are nonnegative, supported on bounded finite unions of intervals, and,
    after removal of finitely many endpoints, are continuous and either zero or bounded above and below by
    positive constants on each interval piece. Assume $H \( \( 1 - t \) x + t y \) gt.eq
    F \( x \)^(1 - t) G \( y \)^t$ whenever $F \( x \) G \( y \) > 0$, apart from possible source endpoints.
    Source integrals zero give a trivial inequality; otherwise write $M_F = integral F > 0$, $M_G = integral G > 0$.
  Let $u \( a \) \, v \( a \)$, $0 < a < 1$, be the quantiles of $F \/ M_F$ and $G \/ M_G$.
    Split $\( 0 \, 1 \)$ at the cumulative probabilities of the finitely many support endpoints and continuity
    breakpoints of both densities. On each remaining open interval $I$,
    the quantiles are continuously differentiable, strictly increasing, and satisfy
  $ u' \( a \) = frac(M_F, F \( u \( a \) \)) \, wide v' \( a \) = frac(M_G, G \( v \( a \) \)) . $
  These statements follow directly by inverting the continuously differentiable cumulative function on a positive
    interval piece, whose derivative is positive. The function $z \( a \) = \( 1 - t \) u \( a \) +
    t v \( a \)$ is also strictly increasing and continuously differentiable on $I$.
    Its images $z \( I \)$ for distinct pieces are disjoint. Change of variables on each piece,
    followed by the weighted arithmetic–geometric mean inequality, yields
  $ integral H & gt.eq sum_I integral_I H \( z \( a \) \) z' \( a \) thin d a\
 & gt.eq sum_I integral_I F \( u \( a \) \)^(1 - t) G \( v \( a \) \)^t (frac(M_F, F \( u \( a \) \)))^(1 - t)
   (frac(M_G, G \( v \( a \) \)))^t d a\
 & = M_F^(1 - t) M_G^t . $
  The pieces have total parameter length one. A gap in a source support causes a quantile jump at one of the
    excluded parameter values; the corresponding gaps between image intervals merely omit nonnegative
    contributions to $integral H$. Thus neither disconnected supports nor density jumps require continuity across a gap.
  The assertion for dimension $q = 1$ follows by restricting the ambient continuous weights to their sets.
    Induct on $q$. For each first coordinate $x$, let $S_i \( x \)$ be the slice in the remaining $q -
    1$ coordinates and put
  $ F_i \( x \) = integral_(S_i \( x \)) f_i \( x \, x' \) thin d x' . $
  Whenever $S_1 \( x \)$ and $S_2 \( y \)$ are nonempty, their interpolation is contained in
    $S_0 \( \( 1 - t \) x + t y \)$. The induction hypothesis for these slices therefore gives
  $ F_0 \( \( 1 - t \) x + t y \) gt.eq F_1 \( x \)^(1 - t) F_2 \( y \)^t . $
  To justify the one-dimensional step for the marginals, partition the first-coordinate axis by all endpoints of
    all the boxes. On each open piece, a slice domain is a fixed union of boxes or is empty.
    In the nonempty case it has fixed positive volume. Each ambient weight has a positive minimum and finite
    maximum on the compact box, so its marginal is bounded above and below by positive constants there.
    Uniform continuity of the weight on the compact box proves continuity of the marginal on that piece by
    integration over this fixed domain. These are exactly the hypotheses of the one-dimensional argument just
    proved. Applying that argument and then iterated integration proves Equation (5.12).
  Finally, the interpolation of two finite unions of open axis-aligned boxes is the finite union of all pairwise
    interpolations of their boxes, each again such a box. Convexity of $p$ gives the required pointwise inequality
    for $f_0 = f_1 = f_2 = rho$, proving Equation (5.13). ◻
]

=== 5.3 Conductance of the bin chain <conductance-of-the-bin-chain>

The following finite-chain estimate converts a cut bound into a mixing bound.
  We will use it for the bin chain here and for the small-state chain in Section 6.

#thm([Lemma 5.4.])[
  (Conductance and mixing).  #emph[Let $P$ be a reversible kernel on a nonempty finite set $V$,
    with stationary probabilities $pi \( x \) > 0$ and $P \( x \, x \) gt.eq 1 \/ 2$.
    Set $Q \( x \, y \) = pi \( x \) P \( x \, y \)$ and
$ cal(E)_P \( H \) = sum_({ x \, y } subset.eq V) Q \( x \, y \) \( H \( x \) - H \( y \) \)^2 \, $

 where unordered pairs have distinct endpoints. If $"Var"_pi H lt.eq K cal(E)_P \( H \)$ for all $H$,
   with $K gt.eq 1$, then, writing $pi_min = min_(x in V) pi \( x \)$, for every integer $t gt.eq 0$,
#[#set math.equation(numbering: n => "(5.14)")
 $ lr(bar.v.double P^t \( x \, dot.op \) - pi bar.v.double)_("TV") lt.eq
   pi_min^(- 1) e^(- t \/ K) . $ <eq:elementary-mixing>]

 If, for some $kappa > 0$, every cut satisfies
$ Q \( A \, A^c \) := sum_(x in A \, thin y in.not A) Q \( x \, y \) gt.eq kappa min { pi \( A \) \, pi \( A^c \) } \, $

 then the variance inequality holds with $K = 2 \/ kappa^2$.]
] <lem:mixing>

#proof[
  For nonnegative $g$ with $pi \( g > 0 \) lt.eq 1 \/ 2$, integrate the cut inequality over $A_u = { x :
    g \( x \)^2 > u }$ to obtain
  $ kappa lr(bar.v.double g bar.v.double)_(L^2 \( pi \))^2 lt.eq sum_({ x \, y }) Q \( x \, y \) \| g \( x \)^2 -
    g \( y \)^2 \| lt.eq #scale(x: 120%, y: 120%)[\(] 2 cal(E)_P \( g \)
    lr(bar.v.double g bar.v.double)_(L^2 \( pi \))^2 #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) . $
  The last step is Cauchy–Schwarz and
  $ sum_({ x \, y }) Q \( x \, y \) \( g \( x \) + g \( y \) \)^2 lt.eq
    2 sum_x pi \( x \) \( 1 - P \( x \, x \) \) g \( x \)^2 lt.eq 2 lr(bar.v.double g bar.v.double)_(L^2 \( pi \))^2 . $
  Consequently $lr(bar.v.double g bar.v.double)_(L^2 \( pi \))^2 lt.eq 2 kappa^(- 2) cal(E)_P \( g \)$,
    also when $g = 0$. Choose a $pi$-median $a$ of $H$ and apply this to $\( H - a \)_(+)$ and $\( a - H \)_(+)$.
    Their squared norms sum to $lr(bar.v.double H - a bar.v.double)_(L^2 \( pi \))^2$,
    and their energies sum to at most $cal(E)_P \( H \)$, by the corresponding inequality on each edge.
    Since the variance is the minimum squared deviation from a constant, this proves the cut assertion.
  For mixing, reversibility makes $P$ self-adjoint on $L^2 \( pi \)$ and gives $cal(E)_P \( H \) =
    chevron.l H \, \( I - P \) H chevron.r_pi$. The stochastic kernel $2 P -
    I$ is an $L^2 \( pi \)$ contraction by Jensen’s inequality and stationarity.
    Hence the eigenvalues of $P$ are in $\[ 0 \, 1 \]$. The variance inequality bounds those on the mean-zero
    subspace by $1 - 1 \/ K lt.eq e^(- 1 \/ K)$. For $g_x \( y \) = upright(bold(1))_({ y = x }) \/ pi \( x \) -
    1$, reversibility gives
  $ \( P^t g_x \) \( y \) = frac(P^t \( x \, y \), pi \( y \)) - 1 \, wide
    lr(bar.v.double g_x bar.v.double)_(L^2 \( pi \))^2 = pi \( x \)^(- 1) - 1 . $
  The $L^2$ contraction followed by Cauchy–Schwarz bounds the total variation distance by
  $ 1 / 2 sqrt(pi \( x \)^(- 1) - 1) thin e^(- t \/ K) \, $
  which implies (5.14). On a singleton all asserted variances and distances vanish;
    it may simply be regarded as already mixed. ◻
]

Use the axis-neighbor Metropolis chain on $cal(V)$. Each of the $2
  e$ signed coordinate directions is proposed with probability

$ q_B = 2^(- q_(upright("bin"))) \, wide q_(upright("bin")) = ceil.l log_2 \( 8 d \) ceil.r \; $

the unused probability, or a proposal leaving the cube, holds.
  A proposal $v'$ within the cube is accepted with probability $min \( 1 \, W \( v' \) \/ W \( v \) \)$.
  This chain is reversible for $pi_B \( v \) = W \( v \) \/ Z_B$ and holds with probability at least $3 \/ 4$.

#thm([Proposition 5.5.])[
  (Bin conductance and mixing).  #emph[For every nontrivial cut of the bin states,
    its stationary edge conductance divided by the smaller stationary side mass is at least
$ kappa_B = frac(1, 10^5 d^2 K_0) . $

 Starting at any bin, after $H = d^50 \( h + 1 \)^2$ steps the total-variation distance from $pi_B$ is at most
   $2^(- 4 \( h + d \))$.]
] <prop:bin-gap>

#proof[
  Write $mu \( E \) = integral_E rho$ and $D = \( 0 \, K_0 \)^e$.
    For a cut $cal(V) = V_1 union.sq V_2$, choose $S$ to be the union of the open bins on the side of smaller
    #emph[continuous] mass. Then $0 < mu \( S \) lt.eq mu \( D \) \/ 2$. Set
  $ t = frac(1, 4 d K_0) \, wide r = t K_0 = frac(1, 4 d) \, wide M = \( 1 - t \) S + t D . $
  We have $S subset M$, by writing $x = \( 1 - t \) x + t x$ for $x in S$. Lemma 14 gives
  #[#set math.equation(numbering: n => "(5.15)")
   $ mu \( M \\ S \) gt.eq \( 2^t - 1 \) mu \( S \) gt.eq t log \( 2 \) mu \( S \) . $ <eq:dense-mass-gain>]
  This is actual gained mass even though $S$ need not be convex.
  We next cover this gain by neighborhoods of cut faces. Ignore the finite union of grid hyperplanes, a null set.
    If $z in M \\ S$, write $z = \( 1 - t \) x + t y$ with $x in S$, $y in D$.
    The segment from $x$ to $z$ stays inside the open convex cube and has sup-norm length less than $r$.
    Its initial bin lies on the selected side and its terminal bin lies on the other side.
    Follow the segment through its finitely many grid crossings.
    At a crossing in several coordinates simultaneously, the incident bins are indexed by the two choices in each
    crossing coordinate, and are connected by axis-neighbor faces through that same point.
    If the incoming and outgoing bins have different labels, a face path between them contains an opposite-label
    pair. Its common closed face contains the crossing point.
    Since some crossing changes the label, $z$ is at sup distance less than $r$ from a cut face.
    No exterior face is needed: the entire segment lies in $D$.
  For such a closed unit face $F$, take its sup-distance-$r$ neighborhood intersected with $D$,
    denoted $F^(\( r \))$. Its volume is at most
  $ 2 r \( 1 + 2 r \)^(e - 1) lt.eq frac(1, 2 d) exp (frac(e - 1, 2 d)) lt.eq 1 . $
  If $v$ is the lower corner of either bin adjacent to $F$,
    every point $z in F^(\( r \))$ satisfies $lr(bar.v.double z - v bar.v.double)_oo lt.eq 1 + r$. Hence
  $ rho \( z \) lt.eq 2^(\( A d \/ B \) \( 1 + r \)) rho \( v \) lt.eq 4 W \( v \) \, $
  and the same inequality holds for the other adjacent corner $v'$.
    Thus $mu \( F^(\( r \)) \) lt.eq 4 min \( W \( v \) \, W \( v' \) \)$.
    Combining the face cover with Equation (5.15), and writing $D_i = sum_(v in V_i) W \( v \)$, gives
  $ sum_(v v' upright(" axis-neighbors")\
v in V_1 \, med v' in V_2) min \( W \( v \) \, W \( v' \) \) & gt.eq frac(t log \( 2 \), 4) mu \( S \)\
 & gt.eq frac(t log \( 2 \), 16) min \( D_1 \, D_2 \) . $
  The second inequality follows from Equation (5.7): the selected continuous side has mass at least one quarter of
    its own discrete weight, which is at least $min \( D_1 \, D_2 \)$.
    It does not require the two notions of smaller side to agree.
    Stationary edge conductance is $q_B min \( W \( v \) \, W \( v' \) \) \/ Z_B$.
    Since $q_B gt.eq 1 \/ \( 16 d \)$, the cut ratio is at least $log \( 2 \) \/ \( 1024 d^2 K_0 \) gt.eq kappa_B$.
  The weights satisfy $2^(- 4 A d) lt.eq W \( v \) lt.eq 1$, so
  $ pi_(B \, min) gt.eq 2^(- 4 A d) / K_0^e \, wide log pi_(B \, min)^(- 1) lt.eq 4 d^5 log 2 +
    d log \( 4 d^8 \) lt.eq 4 d^5 . $
  Lemma 15 supplies inverse gap at most
  $ K_B = 2 kappa_B^(- 2) = 3.2 dot.op 10^11 d^20 lt.eq d^32 quad \( d gt.eq 14 \) . $
  It bounds the error at time $H$ by $exp \( 4 d^5 - H \/ K_B \)$.
    Since $d^18 gt.eq 4 d^5$ and $d^5 h \( h + 2 \) gt.eq \( d + 1 \) h gt.eq h + d$, we have
  $ H / K_B - 4 d^5 gt.eq d^18 \( h + 1 \)^2 - 4 d^5 gt.eq 4 d^5 h \( h + 2 \) gt.eq 4 \( h + d \) log 2 . $
  This proves the asserted error. ◻
]

=== 5.4 A bounded random-bit implementation <a-bounded-random-bit-implementation>

We finish the proof of Theorem 12, keeping explicit bounds that will also describe the finite output law in
  Section 6. Use the integer schedule

#[#set math.equation(numbering: n => "(5.16)")
 $ J = d^4 \( h + 1 \) \, wide H = d^50 \( h + 1 \)^2 . $ <eq:dense-schedule>]

Run at most $J$ independent trials, each running $H$ bin-chain steps from $0$.
  At the end of each bin walk use Equation (5.8), but obtain each offset from the bounded draw

#[#set math.equation(numbering: n => "(5.17)")
 $ k_(i j) = ceil.l log_2 \( w_(i j) + 1 \) ceil.r + 4 \( h + d \) \, quad Z_(i j) upright(" uniform on ") { 0 \,
   dots.h \, 2^(k_(i j)) - 1 } \,\
beta_(i j) = ⌊frac(w_(i j) Z_(i j), 2^(k_(i j)))⌋ . $ <eq:dense-offset-bits>]

Return the first feasible table. If all $J$ trials fail, return a fixed greedy feasible table with the required margins.

Each offset probability differs from $1 \/ w_(i j)$ by at most $2^(- k_(i j))$:
  its number of preimages is either the floor or the ceiling of $2^(k_(i j)) \/ w_(i j)$.
  Thus its total-variation error is at most $w_(i j) \/ 2^(k_(i j)) lt.eq 2^(- 4 \( h + d \))$.
  Coupling the independent offsets coordinate by coordinate bounds their joint error by $d 2^(- 4 \( h + d \))$.
  Proposition 16 bounds the bin error by $2^(- 4 \( h + d \))$, so a complete implemented trial,
  including its success flag, differs from an ideal trial by at most $\( 1 + d \) 2^(- 4 \( h + d \))$.

Couple the $J$ independent trial records until the first discrepancy.
  This bounds the difference between the implemented first-success procedure and its ideal counterpart by
  $J \( 1 + d \) 2^(- 4 \( h + d \))$, without conditioning on an approximate success event.
  By Proposition 13, the ideal procedure has uniform law on success and failure probability at most
  $\( 63 \/ 64 \)^J$. Its greedy fallback therefore changes the uniform law by at most this probability.
  The total error is at most

#[#set math.equation(numbering: n => "(5.18)")
 $ \( 63 \/ 64 \)^J + J \( 1 + d \) 2^(- 4 \( h + d \)) lt.eq 2^(- h) . $ <eq:dense-total-error>]

For explicit numerical bounds, $d^4 gt.eq 128$ gives $\( 63 \/ 64 \)^J lt.eq exp \( - J \/ 64 \) lt.eq
  2^(- 2 \( h + 1 \)) lt.eq 2^(- h - 2)$. Also $d lt.eq 2^(d \/ 2)$, $d + 1 lt.eq 2^d$, and $h + 1 lt.eq
  2^h$ give $J \( 1 + d \) 2^(- 4 \( h + d \)) lt.eq 2^(- 3 h - d) lt.eq 2^(- h - 2)$.
  All actual outputs are feasible by the acceptance test or the fallback.

It remains to account for every computation in the bit model.
  At an integer bin corner $v$, the entries $X_(i j) \( v \)$ are integer sums of products $w_(i j)
  v_(i j)$ and margins. Since $w_(i j) < C \/ B$ and $v_(i j) < 4 B$,
  their absolute values are at most a fixed multiple of $d C$; they have $O \( b + log d \)$ bits.
  The candidates for the maximum defining $p \( v \)$ are the rational numbers

$ 0 quad upright("and") quad frac(- B X_(i j) \( v \) - d s_(i j), B s_(i j)) . $

Cross multiplication, comparison, multiplication by $A$, and integer division compute $E_v =
  floor.l A p \( v \) floor.r$ exactly with polynomial bit cost.
  Denominators have $O \( b + log d \)$ bits and there are at most $d$ candidates.
  In particular no evaluation of an exponential or integral is required.
  We have $0 lt.eq E_v lt.eq 4 A d$, so a Metropolis acceptance is either certain or has probability
  $2^(- \( E_(v') - E_v \))$, implemented by requiring that many fresh unbiased bits to be zero.
  The difference has absolute value at most $8 A d$, a convenient uniform allowance.
  A draw of $q_(upright("bin"))$ bits proposes each signed coordinate direction by one code,
  with the remaining codes holding; this implements the stated proposal exactly.

The offset draw in Equation (5.17) uses $O \( b + h + d \)$ bits and an integer multiplication and division on
  numbers of polynomial bit length. Table construction, feasibility tests, the greedy fallback,
  and the bounded loop counters also use polynomially many operations on polynomial-length integers.
  There are $J H$ transitions and at most $d J$ offsets. Schoolbook integer arithmetic already yields a worst-case
  polynomial bound in $d \, b \, h$.

For later use, a uniform upper bound on the number of bits per transition and per offset is respectively

#[#set math.equation(numbering: n => "(5.19)")
 $ Q_0 = q_(upright("bin")) + 8 A d \, wide r_max = b + 1 + 4 \( h + d \) \,\
R_1 = H Q_0 + d r_max \, wide R_D = J R_1 . $ <eq:dense-denominator-bounds>]

Unused transition bits, missing free coordinates, and unused trials after the first success can be padded with
  unread independent bits. Thus a trial has probabilities with common denominator $2^(R_1)$,
  and the whole subroutine has probabilities with common denominator $2^(R_D)$.
  This padding changes no output law. For an offset of width $w$ and actual bit length $k$,
  its exact probability of value $beta$ is

#[#set math.equation(numbering: n => "(5.20)")
 $ 2^(- k) (⌈frac(\( beta + 1 \) 2^k, w)⌉ - ⌈frac(beta 2^k, w)⌉) \, wide 0 lt.eq beta < w . $ <eq:dense-offset-count>]

It can therefore be tabulated by integer arithmetic without enumerating the random bit strings.
  The deterministic completion cases can use the same denominator allowances. This completes the proof of Theorem 12.

== 6 Sampling algorithms and exact correction <sec:algorithms>

We now turn the weighted graph bound into an algorithm using unbiased random bits.
  All deterministic choices, including greedy completions, neighbor orders, and tie breaking,
  are fixed once and for all. Abbreviate $Omega \( r \, c \)$ by $Omega$.
  Write $nu_X$ for the uniform law on $cal(F)_X$ and $z_0$ for a greedy original table.
  Its restriction to the small slots gives a starting transversal $X_0$.

=== 6.1 The ideal chain <the-ideal-chain>

Set

$ q_(upright(s)) = ceil.l log_2 \( 32 d^2 \) ceil.r \, wide p = 2^(- q_(upright(s))) . $

List the distinct feasible neighbors of a state $X$ in a fixed order.
  Assign one of the $2^(q_(upright(s)))$ equally likely binary strings to each neighbor and let all remaining
  strings propose a hold. This gives every edge the same proposal probability $p$ in both directions.
  As explained in Lemma 2, the list is obtained by testing all unit exchanges,
  the repair of $X$ when it is a defect, and the uniquely reconstructed inverse repair of each possible ordered
  defect type. There are at most $5 d^2 + 1$ neighbors. Each test checks only coordinate bounds,
  the allowed occupancy pattern, and residual margins; it does not evaluate $f$.

Here is the completion adjustment used for a nonholding proposal $X arrow.r Y$.
  For a nonempty block $cal(B) = I times J$, fix a reference row $i_0$ and column $j_0$, independently of $X$.
  Let $Delta R_i = R_i \( Y \) - R_i \( X \)$ and $Delta P_j = P_j \( Y \) -
  P_j \( X \)$ be the changes in its padded margins. Define the integer matrix $D_(X Y)$ by

$ \( D_(X Y) \)_(i j) =
  cases(delim: "{", Delta R_i \, & i eq.not i_0 \, med j = j_0 \,, Delta P_j \, & i = i_0 \, med j eq.not j_0 \,,
  Delta R_(i_0) - sum_(j' eq.not j_0) Delta P_(j') \, & i = i_0 \, med j = j_0 \,, 0 \, & i eq.not i_0 \, med j
  eq.not j_0 .) $

The equality of total row and column changes verifies all its row and column sums, including the reference column.
  Also $D_(Y X) = - D_(X Y)$. Along a unit exchange or repair edge each individual residual changes by at most
  two; hence every displayed entry has magnitude at most $10 d$.
  These formulas also apply to a block with a single row or column.

The ideal transition draws $a tilde.op nu_X$ and accepts $Y$ precisely when $a + D_(X Y)$ is nonnegative.
  It then belongs to $cal(F)_Y$ because its margins are already correct. A rejected proposal holds at $X$.
  If the block is empty, every edge proposal is accepted. Denote this ideal kernel by $P$.

#thm([Proposition 6.1.])[
  (Small-chain bound).  #emph[The kernel $P$ is lazy and reversible for $pi \( X \) = f \( X \) \/ Lambda$.
    On every edge it satisfies
$ P \( X \, Y \) gt.eq frac(1, 128 d^2) min {1 \, frac(f \( Y \), f \( X \))} . $

 If there is more than one state, its inverse spectral gap is at most $d^160$.
   Moreover $pi_min gt.eq \( C + 1 \)^(- 2 d)$, and, for every $t gt.eq 0$,
#[#set math.equation(numbering: n => "(6.1)")
 $ "TV" #scale(x: 120%, y: 120%)[\(] P^t \( X_0 \, dot.op \) \,
   pi #scale(x: 120%, y: 120%)[\)] lt.eq \( C + 1 \)^(2 d) exp \( - t \/ d^160 \) . $ <eq:small-mixing>]

 A one-state chain is already stationary.]
] <prop:small-chain>

#proof[
  The proposal holds with probability at least $1 - \( 5 d^2 + 1 \) \/ \( 32 d^2 \) > 1 \/ 2$,
    and rejection can only increase this probability. Translation by $D_(X Y)$ bijects the set of acceptable
    completions in $cal(F)_X$ with the corresponding set in $cal(F)_Y$.
    Calling its cardinality $c_(X Y) = c_(Y X)$ gives $f \( X \) P \( X \, Y \) = p c_(X Y) = f \( Y \) P \( Y \, X \)$.
  Every nonempty completion-block margin is at least $L$. Rejection implies that one of at most $d$ entries of a
    uniform completion is less than $10 d$. Lemma 3, with $a = L$ and threshold $10 d lt.eq L \/ 2$, gives
  $ bb(P) \( upright("rejection") \) lt.eq frac(40 d^5, L) = 40 / d^7 < 1 / 2 . $
  Consequently $c_(X Y) gt.eq f \( X \) \/ 2$, and in particular $c_(X Y) gt.eq
    min \( f \( X \) \, f \( Y \) \) \/ 2$. Since $p gt.eq 1 \/ \( 64 d^2 \)$,
    both the stated transition bound and the Dirichlet-form comparison
  $ cal(E)_P \( H \) gt.eq frac(E \( H \), 128 d^2 Lambda) $
  follow. Theorem 11 and $U = d^20$ now give an inverse-gap bound of
  $ 128 d^2 #scale(x: 120%, y: 120%)[\(] \( 1 + 2 d^2 \) 4 d^2 \( U + 1 \)^6 +
    2 #scale(x: 120%, y: 120%)[\)] & lt.eq 98 \, 560 d^126 lt.eq d^160 . $
  Indeed the coefficient inside parentheses is at most $770 d^4 U^6$.
    The graph is connected by Theorem 11, and Proposition 4 gives $pi_min gt.eq \( C + 1 \)^(- 2 d)$.
    Lemma 15 now gives (6.1). ◻
]

=== 6.2 A bounded almost-uniform sampler <a-bounded-almost-uniform-sampler>

For an integer $k gt.eq 1$, put

#[#set math.equation(numbering: n => "(6.2)")
 $ J_(upright(o)) = d^4 \( k + 1 \) \, wide T = d^200 \( k + b \)^2 \, wide h =
   d^4 \( k + b \)^2 . $ <eq:outer-parameters>]

The implemented chain replaces every ideal completion draw by the subroutine of Theorem 12 with accuracy $h$;
  write $mu_X$ for its output law on $cal(F)_X$ and $Q$ for the resulting kernel.
  Starting anew at $X_0$ on each trial, perform the following bounded procedure.

+ Run $Q$ for $T$ transitions and then make one further, independent completion draw with law $mu_X$ at the final state.
+ If $X$ is a transversal and every large completion entry is at least $L$,
  subtract $L$ on the large block and return the resulting original table. Otherwise this trial fails.
+ Repeat for at most $J_(upright(o))$ independent trials, and return $z_0$ if all of them fail.

All randomness in different draws and trials is fresh. In particular,
  a completion used to test a transition is discarded after that test;
  the current small state is the chain’s entire persistent state.

#thm([Theorem 6.2.])[
  (Almost-uniform sampling).  #emph[The preceding procedure returns a feasible table with law $p_k$ satisfying
$ "TV" #scale(x: 120%, y: 120%)[\(] p_k \, "Uniform" \( Omega \) #scale(x: 120%, y: 120%)[\)] lt.eq 2^(- k) . $

 Its worst-case number of bit operations is bounded by a fixed polynomial in $d \, b \, k$.]
] <thm:almost-uniform>

#proof[
  We first control adaptive approximation. The dense guarantee is uniform over feasible states:
    $"TV" \( mu_X \, nu_X \) lt.eq eta := 2^(- h)$. From a common state,
    couple the proposal and holding decision identically, and maximally couple the two completion draws if there
    is a nonholding proposal. Agreement of these draws gives the same acceptance decision and the same next state. Thus
  $ sup_X "TV" #scale(x: 120%, y: 120%)[\(] Q \( X \, dot.op \) \,
    P \( X \, dot.op \) #scale(x: 120%, y: 120%)[\)] lt.eq eta . $
  Couple successively until the first disagreement. Conditional on agreement so far,
    the common state may be adaptive, but the same uniform conditional bound still applies.
    After $T$ transitions and the terminal completion, the probability of a disagreement is at most $\( T + 1 \)
    eta$. This argument uses neither reversibility nor a stationary-law assertion for $Q$.
    By Proposition 17, the additional error from replacing the ideal terminal state by a stationary one is at most
    $tau = \( C + 1 \)^(2 d) e^(- T \/ d^160)$.
  In a stationary ideal trial every pair $\( X \, a \)$ has probability $pi \( X \) \/ f \( X \) = 1 \/ Lambda$.
    By Proposition 4, successful pairs are in bijection with $Omega$,
    and the success probability $s_(*) = \| Omega \| \/ Lambda$ is at least $1 \/ \[ 2 \( 1 + d^2 \) \]$.
    The first success among $J_(upright(o))$ independent stationary trials therefore has, including the fallback,
    the exact law
  $ #scale(x: 120%, y: 120%)[\[] 1 - \( 1 - s_(*) \)^(J_(upright(o))) #scale(x: 120%, y: 120%)[\]]
    "Uniform" \( Omega \) + \( 1 - s_(*) \)^(J_(upright(o))) delta_(z_0) . $
  For clarity, each particular table receives first-success mass
    $sum_(j = 0)^(J_(upright(o)) - 1) \( 1 - s_(*) \)^j \/
    Lambda = \[ 1 - \( 1 - s_(*) \)^(J_(upright(o))) \] \/ \| Omega \|$.
    Pregenerate all potential trials in both procedures, then apply the same deterministic
    first-success-or-fallback map. The union bound and contraction of total variation under a deterministic map
    give total error at most
  #[#set math.equation(numbering: n => "(6.3)")
   $ e^(- J_(upright(o)) \/ \[ 2 \( 1 + d^2 \) \]) + J_(upright(o)) \( C + 1 \)^(2 d) e^(- T \/ d^160) +
     J_(upright(o)) \( T + 1 \) 2^(- h) . $ <eq:outer-error>]
  In particular, no error is divided by a success probability.
  Each term in (6.3) is at most $2^(- k - 2)$. Here are explicit checks.
    Put $t = k + b gt.eq 15$, so $d lt.eq t$, $k + 2 lt.eq t$, and $log_2 \( C + 1 \) < b$. First,
  $ frac(J_(upright(o)), 2 \( 1 + d^2 \)) gt.eq frac(d^2 \( k + 1 \), 4) gt.eq 49 \( k + 1 \) gt.eq \( k + 2 \) ln 2 . $
  For the second term,
  $ ln #scale(x: 120%, y: 120%)[\(] J_(upright(o)) \( C + 1 \)^(2 d) #scale(x: 120%, y: 120%)[\)] + \( k + 2 \) ln
    2 lt.eq 2 t^2 + 6 t lt.eq 3 t^2 lt.eq d^40 t^2 = T \/ d^160 . $
  Finally, since $T + 1 lt.eq 2 T$,
  $ log_2 #scale(x: 120%, y: 120%)[\(] J_(upright(o)) \( T + 1 \) #scale(x: 120%, y: 120%)[\)] + k + 2 & lt.eq
    204 log_2 d + 2 log_2 t + log_2 \( k + 1 \) + k + 3\
 & lt.eq 209 t lt.eq d^4 t^2 = h . $
  Their sum is less than $2^(- k)$.
  For the running time, neighbor lists have polynomial size, and all state coordinates, residuals,
    and completion entries have $O \( b + log d \)$ bits. The proposal uses exactly $q_(upright(s))$ unbiased
    bits. Each completion call has bounded polynomial bit cost by Theorem 12; the numbers of steps, trials,
    and calls in (6.2) are fixed polynomials. Comparisons, additions, integer multiplications and divisions,
    and loop counters all have polynomial bit cost, for example with schoolbook arithmetic.
    Only feasible completions and the feasible fallback can be returned.
    Empty and singleton-dimensional blocks use their deterministic completion rule.
    This proves the claimed worst-case bound. ◻
]

=== 6.3 Exact tabulation of the implemented law <exact-tabulation-of-the-implemented-law>

The exact correction will need the law of the actual bounded algorithm, including approximate offsets,
  adaptive transitions, and both stopping rules. Only the small state persists between transitions.
  We can therefore cache the dense completion law for each small state, propagate the resulting finite kernel,
  and then apply the terminal and first-success rules. The spaces enumerated in this calculation do not grow with
  the accuracy request; accuracy changes only the iteration counts and the lengths of integers.

#thm([Proposition 6.3.])[
  (Law tabulation).  #emph[For fixed margins and $k$, the entire law $p_k$ can be computed exactly in
$ 2^(500 d b) "poly" \( d \, b \, k \) $

 bit operations. It has a common dyadic denominator: $p_k \( z \) = a_z \/ 2^R$,
   where $a_z$ are nonnegative integers and $R$ is bounded by a fixed polynomial in $d \, b \, k$.
   The sizes of all enumerated state spaces are independent of $k$.]
] <prop:law-tabulation>

#proof[
  #emph[The finite spaces.] Use the dense sampler’s notation $A = d^4$ and $K_0 = 4 d^8$.
    There are at most $sans(S) := 2^(2 d b)$ feasible small states,
    since their number is at most $\( C + 1 \)^(2 d)$. A completion fiber, the original table space,
    an offset space, and the bin space each have at most $sans(V) := 2^(d b)$ elements:
    use $\( C + 1 \)^d lt.eq 2^(d b)$ and $K_0 < C$. They can be enumerated by listing coordinate arrays and
    retaining those that pass their defining tests. None of these coordinate ranges depends on $k$.
    This exhaustive calculation is used only for the exact correction,
    not during an ordinary run of the bounded sampler.
  #emph[Caching a dense completion law.] The following denominator allowances are uniform over all feasible small
    states, with $h$ as in (6.2):
  #[#set math.equation(numbering: n => "(6.4)")
   $ Q_0 & = ceil.l log_2 \( 8 d \) ceil.r + 8 A d \, & r_max & = b + 1 + 4 \( h + d \) \,\
H & = d^50 \( h + 1 \)^2 \, & J_(upright(D)) & = d^4 \( h + 1 \) \,\
R_1 & = H Q_0 + d r_max \, & R_(upright(D)) & = J_(upright(D)) R_1 . $ <eq:bit-schedule>]
  Every bin transition has denominator dividing $2^(Q_0)$: its proposal needs $ceil.l log_2 \( 8 d \)
    ceil.r$ bits and every dyadic acceptance test needs at most $8 A d$ bits.
    For each input $X$, enumerate its bins, compute their transition matrix as $B_X \/
    2^(Q_0)$ with integer entries, and propagate the point mass at zero for $H$ steps.
    At step $t$ the vector uses denominator $2^(t Q_0)$; its next numerator is the previous integer vector
    multiplied by $B_X$. Adding contributions from many paths changes the numerator, not the denominator exponent.
  Offsets are tabulated without enumerating their random bits.
    For width $w$ and the actual bit count $r = ceil.l log_2 \( w + 1 \) ceil.r + 4 \( h + d \) lt.eq r_max$,
    the probability of offset $u in { 0 \, dots.h \, w - 1 }$ is
  #[#set math.equation(numbering: n => "(6.5)")
   $ 2^(- r) (⌈frac(\( u + 1 \) 2^r, w)⌉ - ⌈frac(u 2^r, w)⌉) . $ <eq:offset-count>]
  Indeed these two endpoints count the integers $z$ with $u lt.eq w z \/ 2^r < u + 1$.
    Integer ceiling division evaluates the count exactly. Enlarge its denominator to $2^(r_max)$,
    pad unused free coordinates to $d$, and combine with the propagated bin law.
    Enumerating bin and offset tuples, constructing the candidate table,
    and applying its feasibility test gives the implemented dense trial’s success numerators $alpha_X \( a \)$ and
    failure numerator $phi.alt_X$, all with denominator $2^(R_1)$.
    Sorting of margins and its inverse are deterministic functions of $X$;
    we always record completions in the original block coordinates.
  Let $a_X^0$ be the dense call’s fixed greedy fallback. The complete dense output law is exactly
  #[#set math.equation(numbering: n => "(6.6)")
   $ mu_X \( a \) =
     frac(sum_(j = 0)^(J_(upright(D)) - 1) phi.alt_X^j alpha_X \( a \) 2^(R_1 \( J_(upright(D)) - j - 1 \)) +
     upright(bold(1))_({ a = a_X^0 }) phi.alt_X^(J_(upright(D))), 2^(R_(upright(D)))) . $ <eq:cached-dense-law>]
  This is a finite first-success sum and the all-fail mass. It introduces no division by a success probability.
    A deterministic empty or singleton-dimensional completion call uses the same denominator by ignoring the
    reserved bits. Cache (6.6) for each $X$.
  #emph[Propagating the implemented chain.] For a distinct neighbor $Y$ the implemented transition is
  #[#set math.equation(numbering: n => "(6.7)")
   $ Q \( X \, Y \) = p sum_(a in cal(F)_X) mu_X \( a \) upright(bold(1))_({ a + D_(X Y) in cal(F)_Y }) \,\
Q \( X \, X \) = 1 - sum_(Y eq.not X) Q \( X \, Y \) . $ <eq:implemented-kernel>]
  For an empty block interpret the indicator as one. These entries share denominator
    $2^(R_(upright(D)) + q_(upright(s)))$. Since only $X$ persists between steps and completion randomness is
    fresh, ordinary vector propagation $v_(t + 1) = v_t Q$, starting at $X_0$,
    computes the exact adaptive state law. Append the terminal completion draw and the unpadding test.
    This yields the one-outer-trial success masses $g \( z \)$ and failure mass $f_0 = 1 -
    sum_z g \( z \)$ with common denominator $2^(R_(upright(T)))$, where
  $ R_(upright(T)) = T \( R_(upright(D)) + q_(upright(s)) \) + R_(upright(D)) . $
  Explicitly, $g \( z \)$ is the sum of $v_T \( X \) mu_X \( a \)$ over pairs passing that test and producing $z$.
    The final law is
  #[#set math.equation(numbering: n => "(6.8)")
   $ p_k \( z \) = g \( z \) sum_(j = 0)^(J_(upright(o)) - 1) f_0^j +
     upright(bold(1))_({ z = z_0 }) f_0^(J_(upright(o))) \, $ <eq:outer-geometric-law>]
  whose denominator divides $2^R$ for $R = J_(upright(o)) R_(upright(T))$.
    Both geometric sums are evaluated by bounded integer multiplication and addition.
    Algebraically, the common denominators reserve ignored bits for holds, shorter draws, and stopped trials;
    neither tabulation nor sampling enumerates those bit strings.
  #emph[Bit complexity.] The denominator exponents are bounded by fixed polynomials.
    With $q = d + b + k + 2 gt.eq 31$, one has $h lt.eq q^6$, $h + 1 lt.eq q^7$, $Q_0 lt.eq q^6$, $r_max lt.eq
    q^7$, $H lt.eq q^64$, and hence
  $ R_1 lt.eq q^71 \, quad R_(upright(D)) lt.eq q^82 \, quad R_(upright(T)) lt.eq q^285 \, quad R lt.eq
    q^290 lt.eq q^300 . $
  Here we used $T lt.eq q^202$, $J_(upright(o)) lt.eq q^5$, and $q_(upright(s)) lt.eq q^2$.
    Probability numerators never exceed their common denominator.
    Intermediate products and sums may be stored with the prescribed stage’s denominator, so their bit lengths,
    including the offset counts in (6.5), are polynomial as well.
    Candidate tables that fail feasibility can have negative dependent entries,
    but their entries are integer sums of $O \( d \)$ quantities of size $O \( C \)$ and still have
    $O \( b + log d \)$ bits.
  For each state, dense matrix propagation costs at most $H sans(V)^2$ arithmetic operations.
    Bin–offset summation, even with a scan of all completions to identify the output, costs at most $sans(V)^3$;
    the geometric composition costs at most $J_(upright(D)) sans(V)$.
    Constructing (6.7) uses at most $sans(S)^2 sans(V)$ terms.
    Small-state propagation uses $T sans(S)^2$, terminal completion and output lookup at most $sans(S) sans(V)^2$,
    and the last geometric composition at most $J_(upright(o)) sans(V)$.
    Including the cache calculation for all $sans(S)$ states,
    the total number of arithmetic operations is at most $2^(10 d b) "poly" \( d \, b \, k \)$;
    multiplying by the established polynomial bit cost per operation gives the stated, looser $2^(500 d b)$ bound.
    The iteration counts $H \, J_(upright(D)) \, T \, J_(upright(o))$ depend polynomially on $k$;
    none of the enumerated spaces does. ◻
]

=== 6.4 Exact uniform sampling <exact-uniform-sampling>

The final step uses the rare residual-mixture construction of Göbel, Liu, Manurangsi,
  and Pappik #cite(label("GLMP2024")) Section 3.1, Algorithm 1 and Theorem 6.
  A sufficiently accurate approximate law is dominated pointwise by a slight enlargement of the target law.
  Its remaining mass can therefore be sampled exactly on a rare branch.
  Here we verify this domination, implement the mixture with unbiased bits,
  and use Proposition 19 to account for the exhaustive work.

#thm([Theorem 6.4.])[
  (Exact sampling).  #emph[There is an algorithm using unbiased random bits that terminates almost surely,
    outputs an exactly uniform element of $Omega$, and has expected bit running time polynomial in $d \, b$.]
] <thm:exact-sampling>

#proof[
  Set
  $ D = d^6 b^2 \, wide k = 2 D \, wide delta = 2^(- D) \, wide M = \| Omega \| . $
  Theorem 18 gives, for every $z in Omega$, $p_k \( z \) lt.eq 1 \/ M + delta^2$.
    Also $M lt.eq \( C + 1 \)^d lt.eq 2^(d b)$ and $D gt.eq d b$, so $M delta lt.eq 1$. Therefore
  $ \( 1 - delta \) p_k \( z \) lt.eq frac(1 - delta, M) + \( 1 - delta \) delta^2 lt.eq 1 / M . $
  It follows that $r \( z \) = \[ 1 \/ M - \( 1 - delta \) p_k \( z \) \] \/ delta$ is a probability law.
  Use $D$ independent bits to enter a correction branch precisely when all are zero.
    On the complementary event run the bounded sampler with accuracy $k$.
    On the correction branch, enumerate $Omega$ to obtain $M$ and use Proposition 19 to compute $p_k \( z \) =
    a_z \/ 2^R$. Form the integer weights
  #[#set math.equation(numbering: n => "(6.9)")
   $ n_z = 2^(R + D) - M \( 2^D - 1 \) a_z \, wide sum_(z in Omega) n_z = M 2^R . $ <eq:residual-integers>]
  They are nonnegative by the pointwise domination just proved, and the sum follows from $sum_z a_z = 2^R$.
    Thus $r \( z \) = n_z \/ \( M 2^R \)$. All integers in (6.9) have $O \( R + D + log M \)$ bits;
    the fact that $M$ can be large as a number does not make its binary representation long.
  To sample this law exactly, put $V = M 2^R$ and draw a uniform integer in ${ 0 \, dots.h \, V -
    1 }$ by using $ceil.l log_2 V ceil.r$ bits and repeating whenever their value is at least $V$.
    If $V = 1$, use zero bits. The acceptance probability is greater than $1 \/ 2$,
    so the expected number of attempts is less than two, and termination is almost sure.
    A scan of cumulative weights $n_z$ then selects the output exactly according to $r$.
    Use fresh bits on each attempt and after the branch decision.
  The output law is $\( 1 - delta \) p_k + delta r = "Uniform" \( Omega \)$.
    The correction branch has conditional expected cost at most $2^(500 d b) "poly" \( d \, b \, k \)$,
    including enumeration, integer arithmetic, and the exact integer draw.
    Its contribution to the unconditional expectation is polynomial, since
  $ delta thin 2^(500 d b) = 2^(- d b \( d^5 b - 500 \)) lt.eq 1 wide \( d gt.eq 14 \, med b gt.eq d \) . $
  Substituting $k = 2 d^6 b^2$ into a fixed polynomial preserves polynomial dependence on $d \, b$.
    The other branch and the branch decision also have polynomial cost.
    This proves the expectation and termination claims. ◻
]

#proof[
  If either dimension is empty, if $N = 0$, or if one dimension is one,
    return the unique feasible table as in Section 2. Otherwise the parameters in (2.1) satisfy $d =
    O \( m n + m + n + 1 \)$ and $b = O \( d + log \( N + 1 \) + log d \)$.
    For the supplied integer $k gt.eq 1$, Theorem 18 gives the first assertion. Theorem 20 gives the second.
    Their bounds therefore have the stated dependence on dimensions and binary margin size.
    All outputs are feasible, and the exact algorithm’s only unbounded loop is the almost-surely terminating
    integer rejection on its correction branch. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
