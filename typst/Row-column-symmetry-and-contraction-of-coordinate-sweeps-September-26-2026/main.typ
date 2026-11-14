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

#align(center)[#text(size: 16pt, weight: "bold")[Row--column symmetry and contraction of coordinate sweeps]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

==== 1 Introduction <introduction>

A coordinate sweep of the Thorp shuffle acts on $N = 2^d$ labeled cards.
  It scans the $d$ binary coordinates in order and, in each direction,
  independently swaps or leaves unchanged the two cards on every parallel edge.
  A single card is uniform after a sweep. The full permutation retains dependence because the cards have used the
  same switches. We prove that an absolute number of sweeps suffices to mix the full permutation.
  Since a sweep consists of $d$ physical shuffles, this gives the optimal order $Theta \( log N \)$ in physical
  shuffle time.

The Thorp shuffle arose in a study of nonrandom shuffling and advantageous play in Faro #cite(label("Thorp1973")).
  For $N = 2^d$, Morris proved an $O \( d^44 \)$ bound using evolving sets #cite(label("Morris2008"));
  Montenegro and Tetali sharpened the spectral-profile and evolving-set analysis to $O \( d^29 \)$
  #cite(label("MontenegroTetali2006")) Section 6.4. Morris then used entropy contraction to obtain
  $O \( \( log N \)^4 \)$ mixing for every even deck size #cite(label("Morris2009")),
  followed by an $O \( d^3 \)$ bound for dyadic decks #cite(label("Morris2013")).
  These estimates concern the full permutation and count individual physical shuffles;
  one coordinate sweep comprises $d$ such steps.

The $O \( d^3 \)$ full-deck benchmark is also recorded in the November 2025 account of
  #cite(label("AlekseevEtAl2025"), form: "prose") Section 1.
  Faster bounds for observing a fixed fraction of the cards,
  such as the $O \( \( log N \)^2 \)$ bound of #cite(label("CzumajVocking2014"), form: "prose"),
  concern a different projection of the permutation law. Here we obtain the order $O \( d \)$ for the full
  permutation on a dyadic deck, together with quantitative row–column representation estimates.
  The support bound in Proposition 6 gives the matching lower order.

To see the geometric issue, split the coordinates into two consecutive groups.
  The positions become a rectangular board. The first part of the sweep acts within rows,
  and the second within columns; each part consists of independent smaller sweeps.
  This suggests an induction on the number of coordinates. Its obstacle is that the row and column symmetry
  decompositions differ, and their projections generally do not commute.
  We estimate how much of a vector selected by one decomposition can survive selection by the other.
  Three forms of this estimate lead to the same mixing conclusion while retaining different information about the
  representation spaces.

===== 1.1 The sweep and its moments <the-sweep-and-its-moments>

Positions are vectors $x = \( x_1 \, dots.h \, x_d \) in bb(F)_2^d$. A physical Thorp shuffle sends

$ \( x_1 \, u \) mapsto \( u \, x_1 + xi_u \) \, $

where the $2^(d - 1)$ bits $xi_u$ are independent and fair. Let $q_d$ denote the law of this shuffle.
  Removing the deterministic cyclic rotation after each shuffle gives successive matching updates in the $d$
  coordinate directions. After $d$ updates the rotation is the identity.
  Thus one coordinate sweep has exactly the law of $d$ physical shuffles.

Permutations map initial positions to final positions, and $g h$ applies $h$ first.
  Let $K_d = q_d^(* d)$ denote the law of one sweep. On the complex unitary irreducible representation $V_lambda$
  of $S_N$, indexed by a partition $lambda tack.r N$, put

$ D_lambda = dim V_lambda \, wide K_d \( lambda \) = sum_(g in S_N) K_d \( g \) rho_lambda \( g \) . $

A matching layer is an orthogonal projection, so $K_d \( lambda \)$ is a contraction.
  All traces are ordinary, unnormalized traces, and $parallel A parallel_p^p = "Tr" \| A \|^p$.
  The matrix $K_d \( lambda \)$ need not be normal. On restriction to a subgroup,
  an irreducible type may occur several times. We call its representation space the carrier and distinguish
  directions within it from the different multiplicity copies.

Our first estimate attaches a positive weight to each Young diagram.
  When we pass from the full board to its rows and columns,
  the difference between the diagram weights pays for the cost of restoring deleted cells.
  The weights still retain a fixed power of representation dimension. Their construction appears in Section 2.

#thm([Theorem 1.])[
  (Weighted sweep moments).  #emph[There are positive weights $W_lambda$, an absolute finite $p_(*)$,
    and real exponents $2 lt.eq p_d lt.eq p_(*)$ such that, for every $d gt.eq 1$ and every $lambda tack.r 2^d$,
#[#set math.equation(numbering: n => "(1)")
 $ D_lambda^(3 \/ 4) lt.eq W_lambda lt.eq D_lambda \, wide
   W_lambda parallel K_d \( lambda \) parallel_(p_d)^(p_d) lt.eq 1 . $ <eq:weighted-main>]

 Consequently $parallel K_d \( lambda \) parallel_(upright("op")) lt.eq D_lambda^(- 3 \/ \( 4 p_(*) \))$.]
] <thm:weighted>

The bounded exponent gives a dimension power uniformly over all diagrams and deck sizes.
  It also yields a common unweighted moment: for an absolute $q < oo$,

#[#set math.equation(numbering: n => "(2)")
 $ D_lambda parallel K_d \( lambda \) parallel_q^q lt.eq 1 . $ <eq:common-unit-moment>]

Indeed, at $p = p_d$ the theorem gives $parallel K_d \( lambda \) parallel_(upright("op"))^p lt.eq
  W_lambda^(- 1)$, and hence

$ D_lambda parallel K_d \( lambda \) parallel_(4 p \/ 3)^(4 p \/ 3) lt.eq D_lambda W_lambda^(- 4 \/ 3) lt.eq 1 . $

Since the matrices are contractions, $q = 4 p_(*) \/ 3$ works simultaneously.
  The later two routes prove a bound of the form (2) directly.
  Their additional information lies in the intermediate row–column estimates described below.

We use $parallel mu - nu parallel_(upright("TV")) = 1 / 2 sum_g \| mu \( g \) - nu \( g \) \|$.
  Let $t_(upright("mix")) \( d \)$ be the least number of physical shuffles for which the distance from the
  uniform full-deck law is at most $1 \/ 4$, from every starting deck.

#thm([Corollary 2.])[
  (Optimal order of mixing).  #emph[There is an absolute constant $C$ such that, for every $d gt.eq 1$,
$ ⌈2 / N log_2 frac(3 N !, 4)⌉ lt.eq t_(upright("mix")) \( d \) lt.eq C d \, wide N = 2^d . $

 In particular $t_(upright("mix")) \( d \) = Theta \( d \)$, and its lower bound is $2 d - O \( 1 \)$.]
] <cor:optimal-mixing>

The upper bound follows from finite-group Plancherel and Cauchy–Schwarz #cite(label("DiaconisShahshahani1981"))
  Sections 2 and 3, applied to a fixed number of repeated forward sweeps.
  The lower bound counts the possible permutations produced by the random switches.
  Both deductions are given in Section 6.3, after the first moment proof.

===== 1.2 From row–column overlap to a bounded exponent <from-rowcolumn-overlap-to-a-bounded-exponent>

The first route begins by choosing a subdiagram $a subset.eq lambda$ inside an $\( h \, h \)$-hook:
  no box of $a$ has both row and column index greater than $h$.
  If $t = N - \| a \|$, we let the symmetric group on the $N - t$ occupied cells of a board act through $V_a$.
  Hook trimming and the choice of weights control the cost of making this reduction.
  The representation $V_a$ occurs in a tensor space with an $h$-dimensional even part and an $h$-dimensional odd
  part. This hook realization is classical in signed tensor representation theory #cite(label("BereleRegev1987"));
  we obtain the form needed here from ordinary Schur–Weyl duality on the two parts and signed induction.

Theorem 4 bounds overlap on every occupied-cell pattern, summing over all orthogonal copies of a fixed row type
  and column type. Its proof majorizes the subgroup projections by positive mixtures of products of one-cell
  states. Normalizing by the average state on each side reduces the product estimate to the entropy of a uniformly
  chosen occupied cell relative to the product of its row and column marginals.
  This is where the geometry of the board enters: the entropy cost is controlled by the number of deleted cells,
  regardless of their arrangement. The entropy step is a finite form of the duality between product inequalities
  and entropy subadditivity #cite(label("CarlenCorderoErausquin2009")) Theorem 2.1 and (2.4).

To return to $V_lambda$, choose a diagram $b$ on the $t$ deleted boxes such that $V_lambda$ occurs in the
  representation induced from $V_a ⊗ V_b$. That induced representation has one copy of $V_a ⊗
  V_b$ for each placement of the deleted cells. Restricting a row or column representation to the stabilizer of a
  placement decomposes its carrier into tensor products of surviving and deleted carrier spaces,
  with multiplicities. The resulting coefficient states can be entangled between these carrier factors.
  Lemma 5 transfers the occupied-cell bound to such states.
  Positive coefficient states have total trace one, so summing their contributions introduces no new
  carrier-dimension count. The remaining placement entropy is paid by the difference between the weight of
  $lambda$ and the weights of its row and column types.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (0, 2.48), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0.62, 0), (0.62, 2.48), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((1.24, 0), (1.24, 2.48), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((1.86, 0), (1.86, 2.48), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((2.48, 0), (2.48, 2.48), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((3.1, 0), (3.1, 2.48), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((3.72, 0), (3.72, 2.48), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0), (3.72, 0), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0, 0.62), (3.72, 0.62), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0, 1.24), (3.72, 1.24), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0, 1.86), (3.72, 1.86), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  line((0, 2.48), (3.72, 2.48), stroke: (paint: rgb("#b3b3b3"), thickness: 0.4pt, miter-limit: 10))
  rect((0.62, 0), (1.24, 0.62), fill: rgb("#d3d3d3"), stroke: none)
  line((0.744, 0.124), (1.116, 0.496), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((0.744, 0.496), (1.116, 0.124), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((2.48, 0.62), (3.1, 1.24), fill: rgb("#d3d3d3"), stroke: none)
  line((2.604, 0.744), (2.976, 1.116), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2.604, 1.116), (2.976, 0.744), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((1.24, 1.24), (1.86, 1.86), fill: rgb("#d3d3d3"), stroke: none)
  line((1.364, 1.364), (1.736, 1.736), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.364, 1.736), (1.736, 1.364), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((3.1, 1.86), (3.72, 2.48), fill: rgb("#d3d3d3"), stroke: none)
  line((3.224, 1.984), (3.596, 2.356), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((3.224, 2.356), (3.596, 1.984), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-0.496, 0.93), (4.216, 0.93), stroke: (paint: rgb("#0000ff"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000ff"))))
  line((2.17, -0.434), (2.17, 2.914), stroke: (paint: rgb("#ff0000"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#ff0000"))))
  content((4.588, 0.93), [#text(fill: rgb("#0000ff"))[rows]])
  content((2.17, 3.162), [#text(fill: rgb("#ff0000"))[columns]])
  content((4.96, 1.922), [occupied cells: $V_a$#linebreak()deleted cells: $V_b$#linebreak()one placement: $V_a ⊗ V_b$], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: A board with deleted cells, marked by crosses. The occupied-cell estimate applies to every deletion pattern. Restoring the deleted cells assigns the representation $V_a ⊗ V_b$ to each placement; the weight comparison pays for summing over placements. The arrows indicate row and column subgroup actions. ],
) <fig:board>

Weighted Schatten interpolation then transfers the projection bound to arbitrary matrices in the row and column
  Fourier blocks. Its logarithmic error is independent of the Schatten exponent.
  Applied to the two families of smaller sweeps, the bound increases the required exponent by only a factor $1 +
  C \/ d$. These factors have bounded product along successive halvings of $d$.
  A direct forest estimate covers diagrams whose first row contains almost every box;
  a strict norm gap in finitely many small dimensions starts the induction. This proves Theorem 1 in Section 6.

===== 1.3 Two further forms of the overlap estimate <two-further-forms-of-the-overlap-estimate>

Section 1 keeps track of the number of selected directions inside each row and column carrier,
  while including every multiplicity copy. Its Schatten-$8$ bound has a cost controlled by the number of boxes
  below the first row. A separate signed-tensor estimate has a cost controlled by the number of boxes outside a
  small hook. The two bounds cover complementary shapes, and a sparse estimate using short time windows completes
  another bounded-exponent induction.

Section 1 instead retains the deleted positions as an ordered list.
  Summing squared coefficients over the initial, intermediate,
  and final hole lists gives the explicit restoration factor $e^(3 l) binom(N, l)$,
  where $l$ is the number of holes. Its occupied-cell estimate resolves the row and column projections by
  averaging over compact-group orbits of highest-weight vectors #cite(label("Perelomov1972")) Section 2.
  A minimum-norm argument matches their averaged one-cell densities to a common density before the row–column
  comparison. This normalization is related to the highest-weight capacity framework of
  #cite(label("FranksWalter2022"), form: "prose") Sections 2 and 4;
  we prove the required form locally to keep the loss from missing cells explicit.
  The overlap proof and moment induction are given here. The sparse part uses the partial-deck density and
  lower-diagram bounds of #cite(label("OpenAI2026Routing"), form: "prose") Theorem 6.1 and Proposition 6.3.

The companion #emph[Random-subspace tests and trace smoothing for coordinate sweeps]
  #cite(label("OpenAI2026RandomSubspace")) develops related trace-smoothing estimates.
  For symmetric-group and tableau conventions we follow #cite(label("Sagan2001"), form: "prose")
  #cite(label("Stanley1999"), form: "prose"); branching and content spectra are also developed by
  #cite(label("VershikOkounkov2005"), form: "prose"). We use ordinary Schur–Weyl duality in the form of
  #cite(label("etingof"), form: "prose") Theorem 4.57 and Corollary 4.59.

Section 2 fixes the common representation conventions. Part Section 1 constructs the weights,
  proves the occupied-board and restoration bounds, and completes the first moment proof and the mixing deduction.
  Part Section 2 develops the selected-rank frame estimates and their moment induction.
  Part Section 3 proves the ordered-hole estimate and closes the coherent-state induction using the cited
  partial-deck input.

==== 2 Representations and subgroup projections <sec:conventions>

Throughout, logs used in estimates are natural logs. We write $G_L$ for the symmetric group of degree $L$;
  spaces can equally well be indexed by sets of size $L$. Denote the representation belonging to a partition
  $lambda$ by $V_lambda$, and its dimension by $D_lambda$. We also write $V_mu \,
  D_mu$ for an irreducible of a product group and its dimension.
  We take the group of degree 0 to be trivial, and allow empty partitions where appropriate.
  All representations are taken unitary (over $bb(C)$). The trace and Schatten norms on a single matrix space use
  unnormalized trace unless otherwise indicated. We use $parallel M parallel_p = \( "Tr" \| M \|^p \)^(1 \/ p)$,
  including operator norm at $p = oo$.

We use the following characteristic-zero facts and normalization conventions.

- We use tableau dimensions, the branching rule, and the hook-length formula for symmetric groups
  #cite(label("Sagan2001")) Theorems 2.6.5, 2.8.3, and 3.10.2.
  Thus restriction to a symmetric group of smaller degree has shapes given by box deletions.
  Transposition of a partition corresponds to tensoring with the sign #cite(label("James1978")) Theorem 6.7,
  and induction from two factors of a Young subgroup uses the Littlewood–Richardson coefficients
  #cite(label("James1978")) Theorem 16.4.
- We will also use ordinary Schur–Weyl duality on a complex tensor power,
  with the unitary group action on the factors and permutations of slots #cite(label("etingof")) Theorem 4.57 and
  Corollary 4.59. For a local dimension $h$, the factors in the decomposition for tensor degree $l$ are the
  polynomial unitary-group representation with highest weight $gamma$ and $V_gamma$,
  for $gamma tack.r l$ of length at most $h$. We use Schur characters in their semistandard-tableau form
  #cite(label("Stanley1999")) Definition 7.10.1. In particular a positive operator acting identically in the slots
  has, on type $gamma$, largest eigenvalue given by the monomial of exponents $gamma$ on its eigenvalues sorted in
  decreasing order. This follows also by column strictness in the tableaux and the presence of the highest weight.
  The statement for zero eigenvalues can be taken by a limit.
- Given an irreducible $mu$ of a subgroup $R$ and a matrix $M$ on $V_mu$,
  we can use a group algebra element of $R$ with matrix $M$ there, and zero matrix on its other types,
  viewed also in any larger group. Its coefficient at $g in R$ is
  $ frac(D_mu, \| R \|) "Tr" #scale(x: 120%, y: 120%)[\(] M rho_mu \( g^(- 1) \) #scale(x: 120%, y: 120%)[\)] \, $
  where $rho_mu$ denotes the representation. We refer to the images of this element as matrix actions supported on
    $mu$. For $M$ the orthogonal projector onto a unit vector $e$, denote such an image by $P_(mu \, e)$,
    specifying or taking as understood the ambient representation.
    On restriction to $R$, this is an orthogonal projection using one direction of the carrier and acting
    identically on the corresponding multiplicity space. A full isotypic projection instead uses $I_(V_mu)$.
    We use the standard orthogonality and Plancherel formulas.
    In particular the sum of squared absolute values of the above coefficients is $D_mu "Tr" \( M^(*) M \) \/ \| R \|$.

Write $K_d \( lambda \)$ for the Fourier matrix (expectation of the representing matrix) on $V_lambda$,
  $lambda tack.r N$, $N = 2^d$. The length of any partition we need to consider with $K_d \( lambda \) eq.not
  0$ is at most $N \/ 2$: one matching of switches already projects to invariants of a Young subgroup with $N \/
  2$ parts of size 2. The corresponding permutation module only has partitions of length at most $N \/
  2$ (for example, it occurs in an ordinary slot permutation tensor power with local dimension $N \/ 2$).

== 1 Weighted contraction <part:weighted>

==== 1.1 Dimensions away from a long first row <ten:weighted:part:53>

Write $k = N - lambda_1$ for the number of boxes below the first row.
  The following dimension estimate will be used in all three moment arguments.

#thm([Lemma 1.1.])[
  #emph[There is an absolute constant $c > 0$ such that, for every $N gt.eq
    2$ and every partition $lambda tack.r N$, $lambda eq.not \( N \)$, with at most $N \/ 2$ rows,
$ log D_lambda gt.eq c \( N - lambda_1 \) . $

]
] <lem:surviving-dimension>

#proof[
  First take $N$ sufficiently large. If both the width and the height are less than $N \/ 10$,
    every hook length is at most $N \/ 5$, and the hook formula gives $log D_lambda gt.eq c N gt.eq c k$.
    Otherwise work in $lambda$ or its transpose so the first row has size $u gt.eq N \/ 10$.
    Let $v = N - u$ be the number of boxes outside that row. In the original orientation $v = k$;
    in the transposed orientation the height assumption gives $v gt.eq N \/ 2$.
    Retain that row and a subdiagram of size $l = min \( v \, floor.l u \/ 2 floor.r \)$ below it.
    In either orientation $l gt.eq c_1 k$ for an absolute $c_1 > 0$ and large $N$.
    By branching its dimension is a lower bound for $D_lambda$. The hook formula bounds this dimension below by
  $ binom(u + l, l) exp #h(-0.16667em) (- frac(l, u - l + 1)) . $
  Indeed the lower diagram has dimension at least one, its width is at most $l$,
    and its column heights sum to $l$, so the logarithm of the extra top-row hook factor is at most
    $l \/ \( u - l + 1 \)$. Since $l lt.eq u \/ 2$, the displayed lower bound has logarithm at least
    $\( log 3 - 1 \) l gt.eq c_2 k$. This proves the claim for large $N$.
    The remaining sizes are finite; decreasing $c$ covers them because the only one-dimensional irreducibles are
    the trivial and sign representations, both excluded by the hypotheses. ◻
]

In particular, for fixed small $epsilon.alt > 0$, if $k >
  N^(1 - epsilon.alt)$ and $lambda$ has length at most $N \/ 2$, then

#[#set math.equation(numbering: n => "(3)")
 $ log D_lambda med gt.eq med c_0 N^(1 - epsilon.alt) . $ <ten:weighted:eq:3>]

==== 1.2 Weights from hook trimming <ten:weighted:part:60>

The weights balance the dimension of a subdiagram against the number of boxes removed.
  Their parent–child difference will pay for the entropy of restoring deleted cells,
  while retaining a favorable dimension term. For $L gt.eq 2$, fix

$ b_0 = 1 / 4 \, quad delta = 1 / 16 \, quad b_1 = b_0 delta \/ 4 \, quad A = 10 \, quad eta = b_1 \/ \( 2 A \) \,
  quad epsilon.alt = eta \/ 8 \, $

and define

$ F_L \( r \) = r min { log \( L \/ r \) \, eta log L } quad \( 1 lt.eq r lt.eq L \) \, wide F_L \( 0 \) = 0 . $

For a Young diagram $lambda tack.r L$, a subdiagram $a subset.eq lambda$ is itself a Young diagram. Put

#[#set math.equation(numbering: n => "(4)")
 $ J \( lambda \) & = min_(a subset.eq lambda) { b_0 log D_a + b_1 r log L - A F_L \( r \) } \, wide r = L - \| a \| \,\
W_lambda & = D_lambda e^(- J \( lambda \)) . $ <ten:weighted:eq:4>]

Empty diagrams have dimension one. For sizes zero and one put $J = 0$ and $W = 1$.
  Since $A F_L \( r \) lt.eq \( b_1 \/ 2 \) r log L$, the expression minimized is nonnegative; taking $a =
  lambda$ gives $0 lt.eq J \( lambda \) lt.eq 1 / 4 log D_lambda$.

On a tuple of partitions for a product of same-size groups, we sum the $J$ values and multiply the $W$ values.
  We next show that the minimizing subdiagram can be chosen in a hook at a controlled cost.

We will need that at $L = N$, at additive cost at most $O \( h^2 \)$ in the minimum of (4),
  we can take $a$ in the $h \, h$-hook, i.e. with no box of indices $i > h \, med j > h$, for $h =
  floor.l N^delta floor.r$ and $N$ sufficiently large. To show it,
  take a minimizing partition $a_1$ and trim off the boxes with both indices $> h$ leaving $a$.
  Write $x$ for the number trimmed and $M = \| a_1 \|$, supposing $x > 0$. The hook length formula gives

#[#set math.equation(numbering: n => "(5)")
 $ log D_(a_1) - log D_a med gt.eq med x \( log h - C \) - C h^2 . $ <ten:weighted:eq:5>]

Here the log factorial gain for $a_1$ is at least $x \( log M - 1 \)$,
  and hooks in the trimmed boxes are at most $2 M \/ h$. Hooks within $a$ changing length due to horizontal
  extensions are bounded in their log ratio sum by

$ sum_(i = 1)^p sum_(j = 1)^h log (1 + frac(x_i, h - j + 1 + p - i)) \, $

where $p$ is the number of rows of the trimmed portion and $x_i$ their lengths within that portion,
  decreasing weakly. If $p gt.eq h$, linearize by $log \( 1 + v \) lt.eq v$,
  and use that the sum of reciprocals over $j$ increases with $i$;
  its average over $i$ is at most 2 (bound the double sum of reciprocals by extending to $p$ columns and summing
  on diagonals). Thus pairing with decreasing $x_i$ gives a bound $2 x$.
  If $p < h$, the sum of the row contributions is at most

$ sum_(i = 1)^p log binom(h + x_i, x_i) lt.eq \( p h + x \) log 2 lt.eq \( h^2 + x \) log 2 . $

The transpose handles vertical extensions. This proves (5).
  The change upwards in $b_1 r log N - A F_N \( r \)$ from increasing $r$ by $x$ is at most $\( b_1 log N + A \)
  x$, by the bound $- 1$ on how negative a slope of $F_N$ can be.
  Since $b_1 < b_0 delta$, the asserted near-minimum property follows.

For such an $a$, put $t = N - \| a \|$. We will use

#[#set math.equation(numbering: n => "(6)")
 $ b_0 log D_a + b_1 t log N - A F_N \( t \) = J \( lambda \) + O \( h^2 \) \, wide t log N lt.eq
   C \( log D_lambda + h^2 \) \, $ <ten:weighted:eq:6>]

where the second estimate uses the cap in $F_N$. We allow the empty partition, with dimension 1.

We next prepare an estimate for transverse decompositions of a representation in this hook.
  This will later be used on a set of cells of a grid excluding $t$ cells.

==== 1.3 Signed representations on occupied cells <ten:weighted:part:96>

#thm([Theorem 1.2.])[
  (Overlap on an arbitrary occupied board).  #emph[Take a grid with $m$ rows and $n$ columns, $m n = N$,
    and consider any subset of $s = N - t$ cells, with the group $G_s$ on those cells.
    Let $a tack.r s$ lie in the $h \, h$-hook, $1 lt.eq h lt.eq N$.
    Decompose $V_a$ under the within-row permutation subgroup of $G_s$,
    and also (separately) the within-column subgroup. For types $sigma \, theta$ of these two groups,
    let $I_(sigma \, u) : V_sigma arrow.r V_a$, $I_(theta \, v) : V_theta arrow.r
    V_a$ be isometric embeddings giving orthogonal copies and spanning the respective isotypic spaces. Then
#[#set math.equation(numbering: n => "(7)")
 $ sum_(u \, v) parallel I_(sigma \, u)^(*) I_(theta \, v) parallel_oo^2 med lt.eq med
   exp { C \[ \( m + n + 1 \) h^2 log \( N + 2 \) + t \] } med min {1 \,
   frac(D_sigma D_theta, D_a)} . $ <ten:weighted:eq:7>]

 Here $sigma$ and $theta$ can each consist of a tuple of partitions, and the infinity norm is the operator norm.
   For $s = 0$ the empty representation has dimension one.]
] <thm:occupied>

#proof[
  For $s = 0$ the assertion is immediate.
  The signed realization uses ordinary Schur–Weyl duality #cite(label("etingof")) Theorem 4.57 and Corollary 4.59,
    sign twist and induction #cite(label("James1978")) Theorems 6.7 and 16.4.
    To prove the estimate we use a slot space $cal(L) = \( bb(C)^h xor bb(C)^h \)^(⊗ s)$,
    calling the two blocks even and odd. Use the signed permutation action:
    on permuting a tensor of definite parities give the sign of reordering the subsequence of odd slots.
    This defines a group action (the signs compose), commuting with the global $U \( h \) times
    U \( h \)$ action for the two blocks. For clarity, the structure needed here follows from ordinary Schur-Weyl
    duality. Separate out the slots of even and odd parity. At fixed parity counts $s_e \, s_o$,
    the action of $G_s$ moves the allocation of those counts to the slots,
    and at a fixed allocation the stabilizer action is unsigned permutation on the even slots and sign-twisted
    permutation on the odd slots. Consequently a $U \( h \) times U \( h \)$ sector of types $gamma \,
    xi$ ($\| gamma \| = s_e \, \| xi \| = s_o$, both lengths $lt.eq h$) has multiplicity space giving,
    as a $G_s$ representation,
  #[#set math.equation(numbering: n => "(8)")
   $ "Ind"_(G_(s_e) times G_(s_o))^(G_s) #scale(x: 120%, y: 120%)[\(] V_gamma ⊗ V_(xi^(upright("tr")))
     #scale(x: 120%, y: 120%)[\)] . $ <ten:weighted:eq:8>]
  Here $xi^(upright("tr"))$ denotes the transposed partition,
    and we use “sector” with its unitary-group carrier as well as the multiplicity space.
    There is such a sector containing $V_a$: take $gamma$ from the first $h$ rows and $xi^(upright("tr"))$ the
    remaining rows (a diagram of width at most $h$). Indeed $a \/ gamma$ is a straight partition up to shift,
    so the Littlewood-Richardson coefficient in (8) is positive.
  Here are size and entropy estimates used with these sectors, applying just as well at any number $l lt.eq
    s$ of slots. The dimensions of the unitary-group carriers and the number of sectors are
    $exp \( O \( h^2 log \( N + 2 \) \) \)$, as upper bounds;
    for dimensions this follows for example by counting the possible counts of each symbol in each row of a
    semistandard tableau. The multiplicity of any $chi tack.r
    l$ for the signed permutation action on the $l$ slots is also at most $exp \( O \( h^2 log \( N + 2 \) \) \)$.
    Indeed, for a pair $gamma \, xi$ giving a nonzero induction coefficient at $chi$,
    use Littlewood-Richardson fillings of $chi \/ xi^(upright("tr"))$ with content $gamma$,
    and thus entries at most $h$. Since $xi^(upright("tr"))$ has width at most $h$,
    every skew column beyond column $h$ is a full column of $chi$.
    Column strictness therefore places these columns within the first $h$ rows,
    where the fillings are determined by row counts of symbols.
    In the first $h$ columns the skew shape has at most $h^2$ boxes.
    These bounds along with (8) give the multiplicity estimate.
  If $\| gamma \| + \| xi \| = l$, write
  $ H \( gamma \, xi \) = sum_i gamma_i log \( l \/ gamma_i \) + sum_j xi_j log \( l \/ xi_j \) $
  with zero contributions understood at count 0. For the same occurrence of $chi$, we have
  #[#set math.equation(numbering: n => "(9)")
   $ D_chi med lt.eq med exp \( H \( gamma \, xi \) \) med lt.eq med
     D_chi exp \( C h^2 log \( N + 2 \) \) . $ <ten:weighted:eq:9>]
  For the first bound use $D_chi lt.eq binom(l, \| gamma \|) D_gamma D_xi$,
    by (8) and invariance of dimension under transposition, and bound each factor by the multinomial of its row
    lengths. For the second bound, $chi$ is in the $h \, h$-hook and contains both $gamma$ and
    $xi^(upright("tr"))$. Since $\| gamma \| + \| xi^(upright("tr")) \| = \| chi \|$,
    the number of boxes of $chi$ outside their union equals $\| gamma ∩ xi^(upright("tr")) \|$,
    which is at most $h^2$. In particular the total excess of its first $h$ row lengths over the corresponding
    $gamma_i$ is $O \( h^2 \)$, and similarly for the first $h$ column lengths and $xi_j$.
    In bounding its product of hooks, the part in its first $h$ rows beyond column $h$ has leg lengths bounded by
    $h$, and the analogous statement for arms applies below its first $h$ rows.
    This gives an upper bound on the hook product of
  $ \( N + 2 \)^(C h^2) product_i gamma_i ! product_j xi_j ! $
  (for example, for the horizontal part use the top row factorials,
    increasing their arguments by at most $h$ in each row, and likewise for columns in the vertical part).
    Stirling’s bound, or the elementary multinomial entropy bounds, now gives (9).
  ===== 1.3.1 Two bounds for transverse overlap <ten:weighted:part:127>
  We now prove the two bounds whose minimum occurs in Theorem 4.
    Counting copies gives the first; positive states and two-sided normalization give the dimension ratio.
  We already get a bound $exp \( O \( \( m + n \) h^2 log \( N + 2 \) \) \)$ on the number of matrices
    $I_(sigma \, u)^(*) I_(theta \, v)$, hence also on the sum in (7),
    by using the multiplicity estimate row by row and column by column in $cal(L)$.
    When grouping slots for a subgroup, we can rearrange them with the signed reordering,
    after which contiguous block permutations give the tensor product actions.
    It remains to get the other bound in (7). Let $P_sigma \, P_theta$ be the isotypic projections on $V_a$.
    The all-copy identity
  $ sum_(u \, v) parallel I_(sigma \, u)^(*) I_(theta \, v) parallel_2^2 = "Tr"_(V_a) \( P_sigma P_theta \) $
  follows by expanding each projection as the sum over its orthogonal embeddings.
    We bound this sum of squared Hilbert–Schmidt norms, which also bounds the required sum of squared operator
    norms. Use a global unitary-group sector containing $V_a$ as above, with projector $P$ in $cal(L)$,
    and types denoted by $gamma \, xi$. If $Q_sigma \, Q_theta$ denote the subgroup isotypic projections on
    $cal(L)$, the trace we need to estimate is bounded by
  $ "Tr"_(cal(L)) \( Q_sigma P Q_theta P \) . $
  Indeed $P$ commutes with the permutations and each $G_s$-irreducible contribution to the trace on that sector is
    nonnegative.
  We can majorize $Q_sigma$ in positive semidefinite order by a mixture of products $S$ of states on individual
    slots, using the same state $S_i$ in every slot of row $i$, each state even (block diagonal).
    Here and below a state is positive semidefinite with trace 1.
    The scalar prefactor for this majorization can be taken to be $D_sigma exp \( C m h^2 log \( N + 2 \) \)$,
    with the mixture a probability mixture. To see this on one row of size $l > 0$,
    bound the projection for its partition $chi$ by the sum of sector projections for compatible
    $\( gamma_0 \, xi_0 \)$ at $l$ slots. In each case twirl, by the unitary group $U \( h \) times U \( h \)$,
    the identical-slot product of a block diagonal state with diagonal entries
    $\( gamma_(0 \, i) \/ l \, xi_(0 \, j) \/ l \)$. It acts after twirling as a scalar on this sector,
    at least $exp \( - H \( gamma_0 \, xi_0 \) \)$ divided by the dimension of the unitary-group carrier.
    Indeed before twirling it has the eigenvalue given by the highest weight and acts as identity on
    multiplicities in the sense of a matrix action on the carrier tensored with identity.
    This latter action of an identical even positive matrix in tensor power follows directly from ordinary
    Schur-Weyl on the two parities (and by limits for singular matrices).
    The twirl is positive on the other sectors. Now the bound on the prefactor follows from (9) and the counting
    and dimension bounds. A size-zero row requires nothing and can use any even state for its specification.
    The same majorization applies to $Q_theta$, with products $T$ using $T_j$ in column $j$,
    and prefactor $D_theta exp \( C n h^2 log \( N + 2 \) \)$.
    Even when undoing a signed reordering of slots, such products are ordinary products since their factors
    preserve the local parity. Thus by two positive semidefinite majorizations (tracing with the other positive
    matrix conjugated by $P$), we can use bounds on $"Tr"_(cal(L)) \( S P T P \)$.
  The normalization has two purposes: the global sector operator must contribute $exp \( - H \( gamma \, xi \) \)$
    to the squared norm, and the local overlaps must have mean at most one under the independent row and column
    marginals. Quarter-root filters meet both requirements. For fixed $S \, T$ so specified, let $macron(S) \,
    macron(T)$ be the average one-slot states over the $s$ cells in consideration, and put $X =
    macron(S)^(1 \/ 2)$, $Y = macron(T)^(1 \/ 2)$. Write
  $ S'_i = X^(- 1 \/ 2) S_i X^(- 1 \/ 2) \, wide T'_j = Y^(- 1 \/ 2) T_j Y^(- 1 \/ 2) $
  with inverses on supports. Let $S' \, T'$ be the corresponding products,
    so the filtering can be undone using $X^(1 \/ 2) \, Y^(1 \/ 2)$ on occupied slots. With
  $ L = \( X^(1 \/ 2) \)^(⊗ s) P \( Y^(1 \/ 2) \)^(⊗ s) $
  we have
  $ "Tr"_(cal(L)) \( S P T P \) = parallel \( S' \)^(1 \/ 2) L \( T' \)^(1 \/ 2) parallel_2^2 . $
  The matrix action $L$ is supported on the $\( gamma \, xi \)$ unitary-group sector with operator norm at most
    $exp \( - H \( gamma \, xi \) \/ 2 \)$. Indeed $\( X^(1 \/ 2) \)^(⊗ s) = \( macron(S)^(1 \/ 4) \)^(⊗ s)$ acts
    on this sector with norm at most $exp \( - H \( gamma \, xi \) \/ 4 \)$,
    by taking largest weight monomials on the eigenvalues and using that the eigenvalues of $macron(S)$ sum to 1.
    The same argument applies with $macron(T)$. These matrix actions are identical on equivalent copies for the
    block unitary group. By matrix coefficient orthogonality for that compact group,
    $L$ can therefore be represented by an integral of the global $U^(⊗ s)$ for block unitaries $U$,
    with coefficient function bounded by $parallel L parallel_oo$ times the squared carrier dimension.
    (This is the matrix Fourier formula for an action supported on one type.)
  For each block unitary define $z_(i j) = "Tr" \( S'_i U T'_j U^(*) \)$.
    The squared Hilbert-Schmidt norm weighted by $S' \, T'$, as above but for $U^(⊗ s)$,
    is the product of $z_(i j)$ over the cells under consideration.
    If $p_i \, q_j$ are the marginals of a uniformly chosen cell among these $s$,
    the mean of $z_(i j)$ under $p_i q_j$ is at most 1. In fact it is
    $"Tr" \( macron(S)^(1 \/ 2) U macron(T)^(1 \/ 2) U^(*) \)$, at most 1 by Cauchy-Schwarz.
    Under the actual uniform law on the cells the mean of $log
    z_(i j)$ is thus bounded above by the relative entropy of that law with respect to $p_i q_j$,
    by the elementary entropy variational inequality (the entropy/product duality is discussed in
    #cite(label("CarlenCorderoErausquin2009")) Theorem 2.1 and (2.4)).
    Explicitly, if $omega$ is the occupied-cell law and $r_(i j) = p_i q_j$,
    Jensen applied to $sum omega_(i j) log \( z_(i j) r_(i j) \/ omega_(i j) \)$ gives at most $log sum r_(i j)
    z_(i j) lt.eq 0$. Zero values in the product need no bound.
    The relative entropy is at most $log \( m n \/ s \)$, by bounding the two marginal entropies by $log m \,
    log n$, so the product is at most $exp \( s log \( N \/ s \) \) lt.eq exp \( t \)$.
    Using the integral for $L$ and the triangle inequality, we obtain
  $ "Tr"_(cal(L)) \( S P T P \) med lt.eq med exp { C h^2 log \( N + 2 \) + t } exp \( - H \( gamma \, xi \) \) . $
  Since $D_a lt.eq exp \( H \( gamma \, xi \) \)$, the mixture prefactors give the required bound with $D_sigma
    D_theta \/ D_a$ in (7), completing the proof. ◻
]

==== 1.4 The row-column Fourier estimate <ten:weighted:part:157>

Split a sweep of dimension $d$ into two parts, each scanning consecutive coordinates, with block sizes $d_1 =
  floor.l d \/ 2 floor.r$ and $d_2 = d - d_1$. Index positions as a grid,
  so these parts use the within-row and the within-column subgroups, denoted $R \, C_(upright("col"))$.
  Write $n$ for the size of a row and $m$ for that of a column, so $m n = N$, $m \,
  n$ both within a constant factor of $sqrt(N)$. We take $d$ large. Suppose henceforth in the estimate that

#[#set math.equation(numbering: n => "(10)")
 $ k = N - lambda_1 > N^(1 - epsilon.alt) \, wide lambda_1^(upright("tr")) lt.eq N \/ 2 . $ <ten:weighted:eq:10>]

For irreducibles $mu \, nu$ of $R \, C_(upright("col"))$, each a tuple, and unit carrier vectors $e \, f$,
  we claim the following bound on projections in $V_lambda$:

#[#set math.equation(numbering: n => "(11)")
 $ W_lambda "Tr"_(V_lambda) \( P_(mu \, e) P_(nu \, f) \) med lt.eq med
   W_mu W_nu exp { O \( \( log D_lambda \) \/ d \) } . $ <ten:weighted:eq:11>]

All constants are independent of the types and of $d$.

Use the hook $a$ from (6) and choose a partition $b tack.r t$ such that

$ cal(I) = "Ind"_(G_(N - t) times G_t)^(G_N) \( V_a ⊗ V_b \) $

contains $V_lambda$, possible by branching and decomposing the restriction.
  We bound the trace of $X Y$ on $cal(I)$, for $X = P_(mu \, e)$, $Y = P_(nu \, f)$ acting here;
  this bounds the desired trace before multiplying by $W_lambda$,
  as the trace on each contributing $G_N$-type is nonnegative.
  Use the direct sum structure of $cal(I)$ with a fiber at each $t$-set $Z$ of the grid.
  Its stabilizer acts on this fiber by $V_a$ on the complement and $V_b$ on $Z$.

Let $v_i$ be the counts of $Z$ in rows and $u_j$ in columns.
  The full row and column orbit sizes and overall size we denote by

$ L_R = product_i binom(n, v_i) \, wide L_C = product_j binom(m, u_j) \, wide L_0 = binom(N, t) . $

Let $L_(R C)$ be the number of sets with the indicated two profiles. Use untruncated quantities

$ H_R = sum_i v_i log \( n \/ v_i \) \, quad H_C = sum_j u_j log \( m \/ u_j \) \, quad H_0 =
  t log \( N \/ t \) \, quad E_0 = H_R + H_C - H_0 . $

Here again terms at zero count are zero. For nonempty layout classes $E_0 gt.eq 0$;
  for $t > 0$ it is $t$ times the relative entropy of the uniform distribution on $Z$ with respect to the product
  of its marginals. We have

#[#set math.equation(numbering: n => "(12)")
 $ log frac(L_(R C)^2 L_0, L_R L_C) lt.eq E_0 + O \( t \) . $ <ten:weighted:eq:12>]

Indeed $log L_R gt.eq H_R \, log L_C gt.eq H_C \, log L_0 lt.eq H_0 + t$ by binomial bounds.
  For a uniform random set with the two profiles, subadditivity bounds $log
  L_(R C)$ by the sum of marginal indicator entropies. To bound that sum,
  choose a cell uniformly and call its indices $I \, J$ and its random indicator $V$. As $I \, J$ are independent,

$ H \( V divides I \, J \) lt.eq H \( V divides I \) + H \( V divides J \) - H \( V \) $

in ordinary entropy notation (by nonnegativity of conditional mutual information).
  Multiplying by $N$, the terms on the right give an upper bound at most $\( H_R + t \) + \( H_C + t \) - H_0$,
  since the complementary term to $v_i log \( n \/ v_i \)$ in row binary entropy times row size is at most $v_i$,
  and similarly for columns. Thus $log L_(R C) lt.eq E_0 + 2 t$. Combining this with the three binomial bounds gives

$ 2 log L_(R C) + log L_0 - log L_R - log L_C lt.eq E_0 + 5 t \, $

which proves (12).

===== 1.4.1 Positive blocks and stabilizer coefficients <ten:weighted:part:194>

The block trace for $X Y$ only uses pairs $Z \, Z'$ with both profiles the same between them.
  In bounding the absolute sum of block contributions for one layout class,
  we can use $L_(R C)^2$ times the maximum diagonal-block overlap $"Tr" \( X_(Z Z) Y_(Z Z) \)$ in that class.
  In fact an off-diagonal block of a positive matrix has the form $X_(Z Z)^(1 \/ 2) U
  X_(Z' Z')^(1 \/ 2)$ for a contraction $U$, and likewise for $Y$;
  thus $\| "Tr" \( X_(Z Z') Y_(Z' Z) \) \|$ is bounded using Hilbert-Schmidt by the geometric mean of the
  corresponding diagonal-block overlap traces.

For fixed $Z$, the row stabilizer $R_Z$ in $R$ acts separately on its sites outside and inside $Z$.
  Write its types as $alpha = \( sigma \, tau \)$ for the two parts respectively.
  The diagonal block $X_(Z Z)$ has the following formula: on the fiber it is

#[#set math.equation(numbering: n => "(13)")
 $ D_mu / L_R sum_alpha 1 / D_alpha thin cal(P)_(alpha \, M_alpha) . $ <ten:weighted:eq:13>]

Here $cal(P)_(alpha \, M_alpha)$ denotes a matrix action supported on $alpha$ for $R_Z$,
  where the $M_alpha$ are positive matrices of total trace 1. More explicitly, write

$ V_mu #h(-0.16667em) arrow.b_(R_Z) = xor.big_alpha V_alpha ⊗ cal(M)_(mu \, alpha) \, wide e =
  xor.big_alpha e_alpha \, wide M_alpha = "Tr"_(cal(M)_(mu \, alpha)) \| e_alpha chevron.r chevron.l e_alpha \| . $

Then $M_alpha succ.curly.eq 0$ and $sum_alpha "Tr" M_alpha = sum_alpha parallel e_alpha parallel^2 = 1$.
  Keeping just permutations in $R_Z$ in the matrix coefficient formula for $P_(mu \, e)$, and using $\| R \| =
  L_R \| R_Z \|$, gives (13) by orthogonality. The multiplicity spaces have been traced out, not counted.
  Similarly for $Y_(Z Z)$ we use column stabilizer types $zeta = \( theta \, pi \)$ with factor $D_nu \/ L_C$.
  Only types occurring in the corresponding restrictions and the fiber need be considered.

The positive states in (13) need not be product states on the surviving and deleted carriers.
  The following elementary estimate is the reason this causes no extra dimension factor.

#thm([Lemma 1.3.])[
  (Arbitrary carrier vectors).  #emph[Let $A_i : E' arrow.r E$ and $B_j : F' arrow.r
    F$ be finite families of operators between finite-dimensional Hilbert spaces. Suppose
$ sum_j \| chevron.l x \, B_j y chevron.r \|^2 lt.eq C parallel x parallel^2 parallel y parallel^2 . $

 Then for unit $w in E ⊗ F$, $w' in E' ⊗ F'$,
$ sum_(i \, j) \| chevron.l w \, \( A_i ⊗ B_j \) w' chevron.r \|^2 lt.eq C sum_i parallel A_i parallel_oo^2 . $

]
] <lem:entangled>

#proof[
  For fixed $i$, the functional $B mapsto chevron.l w \, \( A_i ⊗ B \) w' chevron.r$ has norm at most $parallel
    A_i parallel_oo$ on the operator-norm space. By trace-norm duality and singular-value decomposition it is a
    sum $sum_s c_s chevron.l x_s \, B y_s chevron.r$, where $x_s \, y_s$ are unit vectors, $c_s gt.eq 0$,
    and $sum_s c_s lt.eq parallel A_i parallel_oo$. The triangle inequality in $ell^2 \( j \)$ bounds the
    corresponding square root by $sqrt(C) sum_s c_s$. Square and sum over $i$. ◻
]

For these fiber actions, take any pure unit states on the carriers $V_sigma ⊗ V_tau$ and $V_theta ⊗ V_pi$,
  denoted by $w \, w'$ as vectors. The corresponding overlap trace on the fiber is of the form

#[#set math.equation(numbering: n => "(14)")
 $ sum_(l \, r) \| chevron.l w \, \( A_l ⊗ B_r \) w' chevron.r \|^2 . $ <ten:weighted:eq:14>]

Here $A_l$ range over the products $I_(sigma \, u)^(*) I_(theta \, v)$ for the two decompositions of $V_a$ as in
  (7), and $B_r$ analogously use $V_b$, for types $tau \, pi$.
  This follows by writing the projection directions in every pair of copies in the restricted representations.

On $Z$ itself, the within-row and within-column groups have trivial intersection.
  For unit vectors $x \, y$ of the two relevant carriers there, Plancherel gives

#[#set math.equation(numbering: n => "(15)")
 $ sum_r \| chevron.l x \, B_r y chevron.r \|^2 med lt.eq med
   frac(D_tau D_pi, D_b) frac(t !, product_i v_i ! product_j u_j !) med lt.eq med
   frac(D_tau D_pi, D_b) exp \( E_0 + O \( t \) \) . $ <ten:weighted:eq:15>]

Indeed the sum is a trace of a product of projections on $V_b$,
  hence also the squared Hilbert-Schmidt norm of the product.
  The squared group-coefficient sum for the product of the two subgroup matrix elements used to give the
  projections (as group algebra elements) is the product of their squared coefficient sums,
  since the pairwise products of group elements use unique factorizations from those two subgroups.
  This gives the first bound using Plancherel in $G_t$. The log factorial ratio is bounded as stated using $E_0 =
  t log t - sum_i v_i log v_i - sum_j u_j log u_j$ and elementary factorial bounds.

Lemma 5 bounds (14) by the right side of (15) times $sum_l parallel A_l parallel_oo^2$, for arbitrary,
  possibly entangled, carrier vectors. We next keep the gain from the minimum in Theorem 4;
  it is needed when the placement entropy is paid.

Denote

$ S = max { 0 \, log \( D_sigma D_theta \/ D_a \) } . $

Using (7), (14), and (15), after dividing by $D_alpha D_zeta$ from the diagonal-block formulas,
  the pure-state bound becomes

#[#set math.equation(numbering: n => "(16)")
 $ frac(1, D_a D_b) exp { E_0 - S + O \( t + \( m + n + 1 \) h^2 log \( N + 2 \) \) } . $ <ten:weighted:eq:16>]

The matrices within (13) and the column counterpart are handled by positive combinations of the pure states with
  total weights 1. Thus we can take upper bounds for the possible stabilizer types without a count-factor here.
  Multiplying by $D_mu D_nu L_(R C)^2 \/ \( L_R L_C \)$, and using $D_lambda lt.eq L_0 D_a D_b$ and (12),
  bounds the overlap for each layout class using (16), by a bound of the form

#[#set math.equation(numbering: n => "(17)")
 $ frac(D_mu D_nu, D_lambda) exp { 2 E_0 - S + O \( t + \( m + n + 1 \) h^2 log \( N + 2 \) \) } \,
   $ <ten:weighted:eq:17>]

taking the largest needed over contributing types.

===== 1.4.2 The budget pays for layout entropy <ten:weighted:part:234>

The restored-cell estimate still contains the cost $2 E_0 - S$.
  We now compare it with the difference between the parent and child diagram weights.

To apply (4), each $sigma_i$ for a complement row of size $n - v_i$ is a subpartition of $mu_i$,
  due to restriction, and likewise $theta_j subset.eq nu_j$ has size $m - u_j$.
  Hence, denoting the sums of $J$’s by $J \( mu \) \, J \( nu \)$, we have

$ J \( mu \) + J \( nu \) med lt.eq med b_0 log \( D_sigma D_theta \) + b_1 t log N -
  A (sum_i F_n \( v_i \) + sum_j F_m \( u_j \)) . $

Together with (6) this gives

#[#set math.equation(numbering: n => "(18)")
 $ J \( lambda \) - J \( mu \) - J \( nu \) med gt.eq med - b_0 S + A E_0 -
   O #scale(x: 120%, y: 120%)[\(] h^2 + \( m n^(1 - eta) + n m^(1 - eta) \) log \( N + 2 \)
   #scale(x: 120%, y: 120%)[\)] . $ <ten:weighted:eq:18>]

Indeed the cap in the parent $F_N$ term does not hurt this lower bound,
  and the amounts dropped from the row contributions to $H_R$ come only from positive $v_i$ less than
  $n^(1 - eta)$, with a similar bound for $H_C$.

Indeed, if $cal(E)$ denotes the error on the right of (18), then

$ 2 E_0 - S - \[ J \( lambda \) - J \( mu \) - J \( nu \) \] lt.eq \( 2 - A \) E_0 - \( 1 - b_0 \) S +
  cal(E) lt.eq cal(E) . $

Here $A gt.eq 2$, $b_0 lt.eq 1$, and $E_0 \, S gt.eq 0$. Thus the negative dimension term survives the
  off-diagonal count and is exactly strong enough when the ratio $D_mu D_nu \/ D_lambda$ is replaced by $W_mu
  W_nu \/ W_lambda$. All the log errors so far and the log count of possible profile choices,
  the latter $O \( \( m + n \) log \( N + 2 \) \)$, are bounded by $O \( \( log D_lambda \) \/ d \)$.
  Indeed $t$ satisfies (6), $h lt.eq N^(1 \/ 16)$, $m \, n$ are of order $sqrt(N)$,
  and we have (3) with $epsilon.alt < eta \/ 2$. These estimates are for all sufficiently large $d$ under (10).
  This proves (11).

==== 1.5 Weighted Schatten interpolation <ten:weighted:part:249>

The row part and the column part of the sweep, as group algebra elements,
  multiply to give $K_d$ in the order specified by the scan (either product order will be fine for estimates).
  Within each row, the row part is an independent sweep in its smaller number of bits,
  and analogously for the columns. This holds because a group of consecutive bit updates in this sweep uses
  matchings confined to the indicated sets of positions, independently across the sets.

Still under (10), let $cal(B) \( M \, M' \)$ on $V_lambda$ be the product of matrix actions,
  one for each subgroup, using arbitrary matrices $M_mu$ and $M'_nu$ on their respective irreducibles.
  Each subgroup action here is the sum over its irreducibles. By (11) we have

#[#set math.equation(numbering: n => "(19)")
 $ W_lambda parallel cal(B) \( M \, M' \) parallel_2^2 med lt.eq med
   exp { O \( \( log D_lambda \) \/ d \) } (sum_mu W_mu parallel M_mu parallel_2^2)
   (sum_nu W_nu parallel M'_nu parallel_2^2) . $ <ten:weighted:eq:19>]

For a single pair of types this follows by writing the squared norm as a trace of a product of positive matrix
  actions (using the matrices times their adjoints or the reverse, as appropriate),
  then diagonalizing and using (11). To sum in (19) use the triangle and Cauchy-Schwarz inequalities,
  absorbing log count factors into the given error. The log counts of the tuples of partitions for the two groups
  are $O \( N^(3 \/ 4) log \( N + 2 \) \)$, using e.g. the partition count bound
  $exp \( O \( sqrt(n) log \( n + 2 \) \) \)$ (split a partition according to parts of size greater than $sqrt(n)$
  and the rest). So (3) suffices. Also

$ parallel cal(B) \( M \, M' \) parallel_oo lt.eq max_mu parallel M_mu parallel_oo med
  max_nu parallel M'_nu parallel_oo $

by unitary restriction. For $2 lt.eq p < oo$, interpolation therefore gives

#[#set math.equation(numbering: n => "(20)")
 $ W_lambda parallel cal(B) \( M \, M' \) parallel_p^p med lt.eq med
   exp { O \( \( log D_lambda \) \/ d \) } (sum_mu W_mu parallel M_mu parallel_p^p)
   (sum_nu W_nu parallel M'_nu parallel_p^p) \, $ <ten:weighted:eq:20>]

with the coefficient in the log error bounded independently of $p$.

For details, let $E = C \( log D_lambda \) \/ d$ be a common logarithmic error bound in (19).
  The direct-sum Schatten norms use traces weighted blockwise by the given positive numbers and the output norm
  similarly. The bilinear map has norm at most $e^(E \/ 2)$ at the $2$ endpoint and at most one at the $oo$
  endpoint. Normalize both inputs to norm 1 at $p$, and test the output using the output weighted trace with a
  dual-norm-one matrix at $p' = p \/ \( p - 1 \)$. In the strip with value taken at $z = 2 \/ p$,
  extend the inputs analytically blockwise using their polar factors and exponent $p z \/
  2$ on their absolute values (zero singular directions may be kept zero).
  Their norms on the two boundaries, at $oo$ and 2 respectively, are then bounded by 1.
  Extend the matrix used in the trace test similarly (analytic for the matrix appearing in the trace),
  with exponent $p' \( 1 - z \/ 2 \)$ for boundary norms at 1 and 2.
  At $theta = 2 \/ p$, the three-lines inequality applied to the weighted trace with the bilinear product gives
  the factor $e^(\( E \/ 2 \) theta) = e^(E \/ p)$. Taking the $p$-th power gives $e^E$ in (20),
  with no growth of the logarithmic error coefficient in $p$.

==== 1.6 Sparse representations and completion <sec:completion>

We have established the matrix inequality needed for the recursive range.
  A direct estimate handles representations whose first row contains almost all boxes.
  We prove that estimate here, then close the induction.

===== 1.6.1 A sparse forest estimate <ten:weighted:part:21>

Write $k = N - lambda_1$. For $k gt.eq 1$ we have the bound

#[#set math.equation(numbering: n => "(21)")
 $ parallel K_d \( lambda \) parallel_oo med lt.eq med \( C d \)^k \( k \/ N \)^(k \/ 8) $ <ten:weighted:eq:1>]

for an absolute $C$. We prove it using the sweep kernel $K$ on ordered injective $k$-tuples.
  Consider the subspace of functions $f$ of the tuples with sum zero over any one component when all the others
  are fixed. This space is invariant for the position-permutation action.
  The module on the tuples contains $V_lambda$ by branching (invariants upon restriction to $G_(N - k)$).
  Since $V_lambda$ does not occur on $\( k - 1 \)$-tuples, the isotypic space for $lambda$ on $k$-tuples belongs
  to the indicated zero-sum subspace. The kernel acts using the sweep in this representation or its adjoint convention.

In a transition $x mapsto y$ of tuples, a path for each component is specified just by its start and end:
  the successive coordinates at the end replace those of the start.
  For two components, let $l$ be the last differing bit at the start, and $r$ the first differing bit at the end.
  Give this pair weight $w = 0$ if $r > l$, weight 2 if $r = l$, and weight 1 otherwise. Then

$ K \( x \, y \) = N^(- k) product_(upright("pairs")) w . $

Indeed, the paths have no conflict (two at the same position at the same stage boundary) exactly when $r lt.eq
  l$ for all pairs. When there is no conflict, a switch used by two paths instead of one is used by a pair with
  $r = l$, at that bit, giving the factor 2. The same formula works for any subset of components.

Acting on the specified functions $f$, we can replace the kernel by

$ D \( x \, y \) = N^(- k) sum_(B subset.eq \[ k \]) \( - 1 \)^(k - \| B \|) product_(upright("pairs in ") B) w \, $

because all terms for proper subsets use zero marginal sums.
  This expression vanishes unless the graph of pairs with $w eq.not 1$ has no isolated vertex.
  Also, its absolute column sums are at most $2^k$, since each subset term in absolute value uses the nonnegative
  sweep kernel on that subset (doubly stochastic), with the other start components summed subject to injectivity.

Use this replacement in $K^(*) K$, using row $z$ of $K^(*)$ to sample $x$.
  For the set $S$ of positions occupied in $x$, we have for every fixed set $F$

#[#set math.equation(numbering: n => "(22)")
 $ Pr \( S supset F \) lt.eq \( k \/ N \)^(\| F \|) . $ <ten:weighted:eq:2>]

In fact the upper product-of-marginals bounds for inclusions hold at the start of $K^(*)$,
  which uses a reverse scan, from a fixed tuple $z$. Such bounds are preserved by a random switch:
  for an inclusion testing just one of the switched sites, average the two bounds, and for one testing both,
  their product of marginals at these sites can only increase under averaging.
  At the end, the marginals are $k \/ N$, since a single position is exactly uniform after all bit updates.
  This is the particular negative-dependence property needed here;
  stronger preservation results for partial symmetrizations are proved in #cite(label("BorceaBrandenLiggett2009"))
  Theorems 4.9 and 4.20.

For a given $B$, to bound the row sum using the term with weight product on $B$ and the no-isolated-vertex
  condition, use true sweep paths for $B$ and independent paths with uniform ends for the other components (we can
  disregard the final injectivity restriction for upper bounding the probability).
  If $w eq.not 1$, the two specified paths go through the same switch at a stage.
  We may pre-sample, independently of $S$, two options at every starting position:
  a path using a common sweep permutation with its specified routing,
  and a path from independent uniform bits (independent paths for this option at different positions).
  Thus we only need upper bound the probability of a no-isolated-vertex interaction graph on $S$ using some
  assignment of these types.

Such a graph contains a spanning forest with $c lt.eq k \/ 2$ rooted trees of size at least 2,
  which we may take as ordered trees arranged in order of their root positions.
  The number of forest shapes needed for each $c$ is at most $C_0^k$, for an absolute $C_0$ (e.g.
  by the traversal encoding of plane forests). Choose distinct roots in at most $binom(N, c)$ ways and path types
  in at most $2^k$ ways. For these choices the expected number of embeddings with distinct positions and meetings
  along the tree edges is at most $\( 2 d \)^(k - c)$. To see this,
  condition on the full common routing and enumerate children after their parents,
  exposing independent paths as needed. For a child of common routing type,
  at each possible meeting stage there are at most two starting positions since the full routing sends exactly two
  paths through the switch. For a child of independent type,
  summed over fresh positions the expected number meeting a given parent at stage $i$ is at most $2^i
  2^(- \( i - 1 \))$: the suffix after $i$ at the start must agree with the parent path there,
  and the new prefix of length $i - 1$ must agree. These estimates apply to the sums of extension probabilities
  conditional on the paths for a partial embedding, by independence for unused positions of the independent type.
  Each embedding uses $k$ sites, so we may multiply the expected counts by $\( k \/ N \)^k$ by (22).
  Summing over $B$, shapes and embeddings gives, for the signed kernel $K^(*) D$, an absolute row sum bounded by

$ \( C_1 d \)^k \( k \/ N \)^(k \/ 2) \, $

using $binom(N, c) lt.eq \( C_2 N \/ k \)^(k \/ 2)$ for $c lt.eq k \/ 2$.
  An empty set of such forests gives zero probability. The column sum bound for $D$ still works for $K^(*) D$.
  The row-column sum bound on the $ell^2$ operator norm now bounds $K^(*) K$ on the specified subspace, proving (21).

===== 1.6.2 The bounded-exponent induction <ten:weighted:part:271>

#proof[
  All sweep matrices are contractions. Partitions of length greater than $N \/
    2$ need no estimate due to the matching projection, and the trivial one satisfies (1) at any exponent.
    For $1 lt.eq k = N - lambda_1 lt.eq N^(1 - epsilon.alt)$, (21) and $W_lambda lt.eq D_lambda lt.eq
    N^k$ suffice at any exponent at least an absolute sufficiently large constant, for sufficiently large $d$.
    Indeed the norm bound (21) in this range is at most $N^(- epsilon.alt k \/ 16)$ for large $d$.
  For the remaining partitions, suppose (1) holds at the two smaller bit sizes in the split.
    Use (20) at $p = max \( p_(d_1) \, p_(d_2) \)$, with the subgroup inputs given by the two subgroup sweep
    parts. Each input on a tuple of partitions is a tensor product of smaller sweep matrices.
    Hence each weighted $p$-th power term of the inputs is at most 1,
    and the sums again use only the tuple count bounds. We get
  $ W_lambda parallel K_d \( lambda \) parallel_p^p lt.eq exp \( C \( log D_lambda \) \/ d \) $
  with $C$ absolute, for all sufficiently large $d$. In particular $parallel K_d \( lambda \) parallel_oo^p lt.eq
    D_lambda^(- 1 \/ 2)$ for these $d$, by the lower bound on $W_lambda$.
    Increasing $p$ to $p \( 1 + C' \/ d \)$ for a large enough absolute $C'$ gives (1),
    by using this operator norm on the additional powers.
  To implement the induction, take an absolute base threshold on $d$ sufficiently high for all these estimates.
    For each of the finitely many base dimensions a nontrivial sweep matrix has operator norm strictly less than
    1: it is a product of orthogonal projections from the matchings,
    and equality of norms on a unit vector would require a common invariant vector for the matching switch
    subgroups. These generate the symmetric group since all individual edge transpositions of a connected cube are
    included. Thus a common sufficiently large base exponent can be used for (1),
    taken large enough for the sparse range as well. Thereafter use the recurrence just given with factor $1 +
    C' \/ d$ and the maximum of the two exponents for the split.
    These exponents are bounded above by an absolute constant since the dimensions in bits along a descent are
    successively halved up to rounding, so the products of the increment factors stay bounded.
    This proves the theorem. ◻
]

===== 1.6.3 Full-deck mixing <ten:weighted:part:285>

In particular for nontrivial $lambda$ with length at most $N \/ 2$ we have

$ parallel K_d \( lambda \) parallel_oo lt.eq D_lambda^(- \( 1 - b_0 \) \/ p_(*)) . $

For an absolute sufficiently large number $j$ of sweeps, by Plancherel and Cauchy–Schwarz
  #cite(label("DiaconisShahshahani1981")) Sections 2 and 3,
  the squared total variation distance to uniform of their product law is at most

$ 1 / 4 sum_(lambda eq.not \( N \)) D_lambda parallel K_d \( lambda \)^j parallel_2^2 med lt.eq med 1 /
  4 sum_(lambda eq.not \( N \)\
lambda_1^(upright("tr")) lt.eq N \/ 2) D_lambda^(- 2) \, $

where we took $j$ large enough for the last exponent, using the operator norm to bound the Hilbert-Schmidt norm.
  The sum bound tends to zero. Indeed for $k > N^(1 - epsilon.alt)$ this follows from (3) and the partition count,
  and for $1 lt.eq k lt.eq N^(1 - epsilon.alt)$, $D_lambda gt.eq e^(- 1) \( N \/ k \)^k$ for large $N$.
  The latter follows by the top-row hook estimate in the proof of Lemma 3, now with $k$ boxes outside the row.
  There are at most $2^k$ partitions of the tail of size $k$.
  Since the permutation product law determines the deck from any fixed starting deck,
  the bound is a worst-case bound. Thus a fixed number $j$ of sweeps gives total variation distance at most $1 \/
  4$ for all sufficiently large $d$. For each of the finitely many remaining $d$,
  the strict nontrivial Fourier norm gap established above gives convergence under repeated forward sweeps.
  Increasing $j$ to cover these sizes yields one absolute sweep count for every $d gt.eq 1$;
  further convolution cannot increase total variation distance.
  As a sweep consists of $d$ physical shuffles, this proves the upper bound in Corollary 2.

#thm([Proposition 1.4.])[
  (Support obstruction).  #emph[Let $q_d$ be the law of one physical Thorp shuffle.
    For every integer $t gt.eq 0$, its $t$-fold convolution satisfies
$ parallel q_d^(* t) - U_(S_N) parallel_(upright("TV")) gt.eq 1 - frac(2^(t N \/ 2), N !) . $

 Thus mixing to distance $1 \/ 4$ requires at least $ceil.l \( 2 \/ N \) log_2 \( 3 N ! \/ 4 \) ceil.r = 2 d -
   O \( 1 \)$ physical shuffles.]
] <ten:support>

#proof[
  The $t N \/ 2$ fair bits allow at most $2^(t N \/ 2)$ permutations.
    Testing the support against uniform measure proves the inequality.
    The threshold follows by rearrangement, and Stirling’s formula gives its asymptotic form. ◻
]

== 2 Deletion frames <part:frames>

==== 2.1 Marked-index frames and transverse tensor projections <ten:frames>

This section proves a uniform unweighted Schatten bound. Two complementary row-column estimates are needed.
  One resolves functions by subsets of marked indices and uses cancellation of isolated contacts;
  the other realizes a diagram in a signed tensor space and normalizes row densities before comparing them with columns.

All notation introduced below is local to this section. Traces are unnormalized, logarithms are natural,
  and a sweep on $2^d$ positions takes $d$ physical shuffles.
  The representation-theoretic conventions are those of Section 2.

===== 2.1.1 Two transverse product estimates <ten:frames:part:1>

Write $n = 2^d$ in this section, and write $mu_d = K_d$ for the sweep.
  The two product estimates below measure different features of the same representation:
  its first-row deficit, and its size outside a small hook.
  Neither alone supplies the error needed at every shape. Their combination gives the following unweighted
  conclusion. Here $f^lambda = D_lambda$, and subscripts denote Fourier matrices.

#thm([Proposition 2.1.])[
  (Uniform Schatten estimate).  #emph[There is an absolute real exponent $8 lt.eq p < oo$ such that,
    for every $d gt.eq 1$ and every $lambda tack.r n$ with $n = 2^d$,
#[#set math.equation(numbering: n => "(23)")
 $ f^lambda parallel \( mu_d \)_lambda parallel_p^p med lt.eq med 1 wide \( lambda tack.r n \) . $ <ten:frames:eq:1>]

]
] <ten:frames:main>

We use the branching rule #cite(label("Sagan2001")) Theorem 2.8.3,
  Pieri’s rule #cite(label("Stanley1999")) Theorem 7.15.7, and the Littlewood–Richardson rule
  #cite(label("James1978")) Theorem 16.4, together with the hook-length formula #cite(label("Sagan2001"))
  Theorem 3.10.2. Ordinary Schur–Weyl duality #cite(label("etingof")) Theorem 4.57 and Corollary 4.59 supplies the
  tensor realizations. Recall the following consequences and conventions:

- The space of functions on injections of $j$ distinct indices into $h$ positions carries the representation
  induced from the trivial representation of $frak(S)_(h - j)$.
  It contains only shapes with first row at least $h - j$. For $lambda_1 = h - j$,
  the multiplicity is $f^(lambda_(*))$, where $lambda_(*)$ is the shape after the first row. In this case
  #[#set math.equation(numbering: n => "(24)")
   $ e^(- j) binom(h, j) f^(lambda_(*)) med lt.eq med f^lambda med lt.eq med
     binom(h, j) f^(lambda_(*)) . $ <ten:frames:eq:2>]
  Indeed the hook correction to the first-row factorial has log at most $j$.
- For polynomial irreducibles of the unitary group in $s$ dimensions,
  indexed by partitions $u$ of degree $lt.eq n$ with at most $s$ rows,
  we use dimension $lt.eq \( n + s + 1 \)^(O \( s^2 \))$ and the highest weight $u$.
  Thus a positive semidefinite matrix with ordered eigenvalues $x_i$ decreasing acts (by polynomial extension)
  with operator norm $product_i x_i^(u_i)$, which is also a lower bound for the trace of that action.
  The Schur character and dimension formulas are given in #cite(label("etingof"), form: "prose") Theorem 4.63;
  the largest monomial follows from the tableau description and the highest weight.
- All group algebra blocks can be prescribed separately. Projections selecting a subspace in one irreducible block
  and zero elsewhere are orthogonal projections in every unitary representation.
  For a transitive permutation representation (uniform probability normalization on the orbit),
  the squared norm of evaluation at a point on the subspace selected by such a projection $B$ in type $alpha$ is
  $ f^alpha "Tr" \( B Q_alpha \) \, $
  where $Q$ is the average on the stabilizer of the point. This follows by matrix-entry orthogonality or the
    regular representation formula, realizing functions on cosets inside the regular representation.

Constants and big-O in estimates below are absolute, and logs in estimates can be taken natural.
  We give some matrix product estimates for the induction. Split the bits of a large sweep into two consecutive
  groups of nearly equal sizes. This gives a board of $b$ rows and $m$ columns, $b m = n$,
  both within a constant factor of $sqrt(n)$. The two parts of the sweep operate along the rows and along the
  columns, respectively; write

$ H = frak(S)_m^b \, wide K = frak(S)_b^m $

for the corresponding groups (the estimates work in either product order).
  The logarithms of the numbers of types (irreducibles) for $H \, K$ are $O \( n^(3 \/ 4) log n \)$,
  by standard partition bounds, or simply by splitting each partition diagram according to a square of side about
  the square root of its size. We denote the dimension of a subgroup type by $h_A$ when the type is $A$.

Here are the two estimates. Suppose $X in bb(C) H \, med Y in bb(C) K$ satisfy

#[#set math.equation(numbering: n => "(25)")
 $ h_A parallel X_A parallel_v^v lt.eq 1 \, wide h_B parallel Y_B parallel_v^v lt.eq 1 $ <ten:frames:eq:3>]

on all their types. Put $j = n - lambda_1$, $j > 0$.

- With $v = 8$, we have
  #[#set math.equation(numbering: n => "(26)")
   $ f^lambda parallel \( X Y \)_lambda parallel_8^8 med lt.eq med exp { O \( j + n^0.8 \) } . $ <ten:frames:eq:4>]
- Put $s = floor.l n^0.01 floor.r$, and let $k$ be the number of boxes of $lambda$ outside its first $s$ rows and
  first $s$ columns (outside their union). With $v = 2$, we have
  #[#set math.equation(numbering: n => "(27)")
   $ f^lambda parallel \( X Y \)_lambda parallel_2^2 med lt.eq med
     binom(n, k) exp { O \( k + n^0.8 \) } . $ <ten:frames:eq:5>]
  Bounds with adjoints or reversed order follow the same way. We prove the estimates in detail.

===== 2.1.2 A deletion frame for injection spaces <ten:frames:part:57>

The selected-rank estimate will resolve a row-type vector into functions that remember only a prescribed number of
  marked positions in each row. The following lemma gives a bounded resolution before any row-column comparison is made.

#thm([Lemma 2.2.])[
  (Deletion frame).  #emph[Let $m gt.eq 1$ and $0 lt.eq t lt.eq q lt.eq m$ be integers,
    and let $alpha tack.r m$ have first row $m - t$. Equip the space $cal(J)_q$ of functions on injections
    $\[ q \] arrow.r \[ m \]$ with uniform probability measure.
    For $U subset.eq \[ q \]$, let $E_U^(\( q \))$ be conditional expectation retaining the coordinates in $U$.
    On the $alpha$-isotypic subspace,
$ F_(q \, t) := sum_(U subset.eq \[ q \]\
\| U \| = t) E_U^(\( q \)) succ.curly.eq e^(- C q) I $

 for an absolute constant $C$.]
] <lem:deletion-frame>

#proof[
  We compare successive numbers of indices. For $t < r lt.eq q$, put $B_r =
    sum_(i = 1)^r E_(\[ r \] \\ { i })^(\( r \))$, and let $beta_r$ be its least eigenvalue on type $alpha$.
    Pullback from injections indexed by $\[ r \] \\ { i }$ is an isometry $J_i$ into $cal(J)_r$.
    Its adjoint is conditional expectation, so $J_i J_i^(*) = E_(\[ r \] \\ { i })^(\( r \))$. The tower property gives
  $ sum_(i = 1)^r J_i F_(r - 1 \, t)^(\( i \)) J_i^(*) = \( r - t \) F_(r \, t) : $
  each $t$-subset is counted for exactly $r - t$ omitted indices. All these maps are $S_m$-equivariant.
    Starting with $F_(t \, t) = I$, a lower bound $a_(r - 1)$ at level $r - 1$ therefore gives $a_r =
    a_(r - 1) beta_r \/ \( r - t \)$ at level $r$. It remains to bound
  #[#set math.equation(numbering: n => "(28)")
   $ product_(r = t + 1)^q frac(beta_r, r - t) gt.eq e^(- C q) . $ <eq:deletion-product>]
  Write $c_zeta$ for the sum of the box contents of a partition $zeta$.
    The multiplicity space of $alpha$ in $cal(J)_r$ is its $S_(m - r)$-invariant space, up to duality.
    Its $S_r$-types are the $delta tack.r r$ for which $alpha \/ delta$ is a horizontal strip, by Pieri.
    On such a type the eigenvalue of $B_r$ is
  $ frac(r + c_alpha - c_delta - c_(\( m - r \)), m - r + 1) . $
  Indeed, a deletion averages the subgroup allowing one retained point to permute with the $m -
    r$ unretained points. On the invariant space this is identity plus the transpositions involving that point,
    divided by $m - r + 1$. Summing the mixed transpositions subtracts the transposition sums for $S_r$ and
    $S_(m - r)$ from that for $S_m$. The sum on a type $zeta$ acts by $c_zeta$:
    sum the Jucys–Murphy elements and their content eigenvalues in
    #cite(label("VershikOkounkov2005"), form: "prose") Section 2, Eq. (2.1), and Theorem 5.8. This gives the formula.
  To estimate these eigenvalues put $M = m - r$ and $a = m - t$.
    The $a$ nonempty columns of $alpha$ form plateaus of equal height.
    A horizontal-strip removal uses a bottom box in each of $M$ distinct columns and must use a suffix within each
    plateau. For removed column indices $j_1 < dots.h.c < j_M$, set $S_M = sum_(l = 1)^M \( j_l - l \)$.
    The eigenvalue numerator is
  $ r + S_M - sum_(upright("removed columns")) \( upright("height") - 1 \) gt.eq r - t + S_M . $
  The smallest sum of removed column indices fills the earliest plateaus first and then uses a suffix in one
    partial plateau: moving a removal from a later plateau to the next legal column of an earlier unfilled plateau
    decreases its index. If $M = L + x$, where that partial plateau has width $w$ and follows $L$ columns,
    then $S_M gt.eq x \( w - x \)$. Hence
  #[#set math.equation(numbering: n => "(29)")
   $ frac(beta_r, r - t) gt.eq frac(a - M + x \( w - x \), \( M + 1 \) \( a - M \)) gt.eq
     frac(\( x + 1 \) \( w - x \), \( a + 1 \)^2) . $ <eq:deletion-ratio>]
  The last inequality uses $a - M gt.eq w - x$.
  First suppose $q gt.eq m \/ 4$. The last lower bounds in (29) are at most one,
    so their product over the required interval $m - q lt.eq M < m -
    t$ is at least their product over all $0 lt.eq M < a$. This latter product is
  $ product_(upright("plateaus")) frac(\( w ! \)^2, \( a + 1 \)^(2 w)) \, $
  whose negative logarithm is at most $O \( a \) + 2 sum_w w log \( a \/ w \)$.
    The distribution assigning mass $w \/ a$ to each plateau height has mean $m \/ a$.
    Comparison with a geometric distribution bounds its entropy by $O \( 1 \) + log \( m \/ a \)$.
    Thus the logarithmic loss is $O \( a + a log \( m \/ a \) \) = O \( m \) = O \( q \)$.
  If $q < m \/ 4$, at most $t lt.eq q$ columns have height greater than one.
    Every $M$ in the required interval lies in the final height-one plateau.
    Here $w - x = a - M$ and $x gt.eq m - q - t$. The first bound in (29) gives $\( x + 1 \) \/ \( M + 1 \) gt.eq
    1 \/ 2$, so at most $q$ factors again cost $e^(O \( q \))$. This proves (28).
    If $t = q$ the product is empty; for $t = 0$ the type is trivial and all its ratios equal one. ◻
]

===== 2.1.3 Projection overlap on marked indices <ten:frames:part:49>

We now use the deletion frame on each row and column. The selected ranks below count directions inside subgroup
  carriers; each ambient projection includes every multiplicity copy.

#thm([Lemma 2.3.])[
  (Selected-rank projection overlap).  #emph[Let $n = b m$, $lambda tack.r n$, and $j = n - lambda_1 > 0$.
    Let $H = S_m^b$ and $K = S_b^m$ be the row and column groups.
    Let $P_R \, P_C$ be group-algebra orthogonal projections supported on one type each,
    whose carrier dimensions are $h_R \, h_C$ and whose selected ranks are $r_R \, r_C$. Then
#[#set math.equation(numbering: n => "(30)")
 $ f^lambda parallel \( P_R P_C \)_lambda parallel_8^8 lt.eq e^(O \( j \)) h_R r_R h_C r_C . $ <ten:frames:eq:6>]

]
] <lem:selected-rank>

#proof[
  If either selected rank is zero, its group-algebra action is zero and the result is immediate.
    Assume henceforth that $1 lt.eq r_R lt.eq h_R$ and $1 lt.eq r_C lt.eq h_C$.
  Let $cal(B)$ be the space of functions on $\( \[ b \] times \[ m \] \)^j$ with uniform product measure,
    and let $cal(I) subset.eq cal(B)$ consist of functions supported on injections.
    Write $D \( x \)$ for the distinctness indicator. The $lambda$-isotypic part $cal(I)_lambda$ consists of
    $f^(lambda_(*))$ copies of $V_lambda$. Averaging any one board coordinate kills this part:
    functions using only the other $j - 1$ coordinates have first row at least $n - j + 1$,
    as follows by splitting them according to their equality patterns. Thus the product-space projection
  $ Z = product_(i = 1)^j \( I - E_i \) \, $
  where $E_i$ averages coordinate $i$, fixes $cal(I)_lambda$.
  ======= 2.1.3.1 Marked-function synthesis. <marked-function-synthesis.>
  Write the row type as $A = \( alpha_i \)_(i = 1)^b$, put $t_i = m - alpha_(i \, 1)$, and let $t_R = sum_i t_i$.
    If either selected type is absent from $cal(I)$, the overlap vanishes.
    We may therefore assume both occur, so $t_R lt.eq j$. For $U subset.eq \[ j \]$ with $\| U \| = t_R$,
    let $cal(F)_(R \, U)$ consist of functions
  #[#set math.equation(numbering: n => "(31)")
   $ F #scale(x: 120%, y: 120%)[\(] \( "row" \( x_i \) \)_(i lt.eq j) \, \( "col" \( x_i \) \)_(i in U)
     #scale(x: 120%, y: 120%)[\)] $ <ten:frames:eq:7>]
  with product-measure norm. On a row assignment having $q_i$ indices in row $i$,
    such a function vanishes unless $q_i lt.eq m$, $U$ marks exactly $t_i$ indices in that row,
    and the marked columns are distinct. Its marked-column dependence is selected by $P_R$.
  Define $A_(R \, U) F = D F$, and regard the synthesis map $A_R \( F_U \) =
    sum_U A_(R \, U) F_U$ as a map into the ambient space $cal(B)$, with range in $cal(V)_R =
    "ran" \( P_R \|_(cal(I)) \)$. All adjoints below use this ambient codomain.
    On a feasible row-assignment fiber, let $E_U^(upright("inj"))$ retain the marked columns by conditional
    expectation under the uniform injection law, and set it to zero when $U$ has the wrong counts. On $cal(V)_R$,
  $ A_(R \, U) A_(R \, U)^(*) = c \( q \) E_U^(upright("inj")) \, wide c \( q \) =
    product_i frac(\( m - t_i \)_(q_i - t_i), m^(q_i - t_i)) gt.eq e^(- O \( j \)) . $
  Here $\( m \)_t$ is the falling factorial. The factor $c \( q \)$ is the probability that the unmarked columns
    complete the marked ones to injections; the bound follows from $\( m \)_t \/ m^t gt.eq e^(- O \( t \))$.
    Conditional expectation commutes with the row group and hence with arbitrary carrier selections in $P_R$.
    Applying Lemma 8 in each row therefore gives $A_R A_R^(*) succ.curly.eq e^(- O \( j \)) I$ on $cal(V)_R$.
    Its restriction there is invertible, and
  $ S_R = A_R^(*) #scale(x: 120%, y: 120%)[\(] \( A_R A_R^(*) \) \|_(cal(V)_R)
    #scale(x: 120%, y: 120%)[\)]^(- 1) \, wide A_R S_R = I_(cal(V)_R) \, wide parallel S_R parallel lt.eq
    e^(O \( j \)) . $
  Construct $cal(F)_(C \, V) \, A_C \, S_C$ analogously for column marks $V$ of size $t_C$.
  Let $I_R \, I_C$ include $cal(V)_R ∩ cal(I)_lambda$ and $cal(V)_C ∩ cal(I)_lambda$ into $cal(B)$.
    Restrict the domains of $S_R \, S_C$ to these spaces. Then $A_R S_R = I_R$ and $A_C S_C = I_C$,
    and the overlap has the exact factorization
  #[#set math.equation(numbering: n => "(32)")
   $ I_R^(*) I_C = S_R^(*) upright(bold(L)) S_C \, wide upright(bold(L)) =
     A_R^(*) Z A_C = \( L_(U \, V) \)_(U \, V) \, wide L_(U \, V) =
     A_(R \, U)^(*) Z A_(C \, V) . $ <eq:frame-factorization>]
  The insertion of $Z$ uses the reconstructed vectors in $cal(I)_lambda$;
    individual summands $D F$ need not be fixed by $Z$. We next estimate the blocks of $upright(bold(L))$.
  ======= 2.1.3.2 Cancellation in the overlap kernel. <ten:frames:part:74>
  Fix $U \, V$, write $L = L_(U \, V)$, and put
  $ ell = j - \| U union V \| \, wide z = j \/ n . $
  We claim
  #[#set math.equation(numbering: n => "(33)")
   $ parallel L parallel_oo lt.eq e^(O \( j \)) z^(ell \/ 4) \, wide parallel L parallel_2^2 lt.eq
     e^(O \( j \)) h_R r_R h_C r_C thin z^(j - ell) . $ <ten:frames:eq:8>]
  In the expansion of $Z$ each term is an expectation using two uniform board tuples $x \, y$.
    At a prescribed subset of indices they coincide, elsewhere they are independently sampled (different indices
    always independent across these pairs). The row function in (31) is evaluated using $x$,
    the analogous column function using $y$, and distinctness factors $D \( x \) D \( y \)$ are included.
  For the first inequality, fix the expansion choices and point values on $U union V$.
    On the remaining coordinates the observed variables are only the row of $x$ and the column of $y$,
    both uniform independently. We couple the two choices in the expansion on each such coordinate:
    given the observed pair $\( r \, c \)$, we either use $\( r \, c \)$ as both points,
    or $\( r \, c' \) \, \( r' \, c \)$ respectively with $c' \, r'$ independently sampled.
    All samplings are independent across the remaining coordinates.
    If some remaining index has no possible distinctness conflict (with other indices,
    over the choices just described), the signed sum of distinctness factors cancels.
    The probability that every one of the $ell$ indices has a possible conflict is bounded by $e^(O \( j \))
    z^(ell \/ 2)$, uniformly in the fixed points. Indeed each vertex has a bounded collection of candidate points,
    each uniform, collections independent across vertices. Equality edges connect them to fixed points or each
    other. If they all have conflicts we can choose forest constraints oriented toward roots,
    some of which may be fixed points, requiring $h gt.eq ell \/ 2$ edges, each specifying which candidates agree.
    For example, connect vertices in each unanchored connected component along a tree (its size is at least two),
    and those in anchored components by trees leading to fixed points.
    The count for given $h$ is $lt.eq e^(O \( j \)) \( C j \)^h$ by specifying the parents, with a constant $C$,
    and each forest has probability at most $n^(- h)$. To see this, integrate a leaf:
    the one specified candidate there is uniform and independent of its parent’s candidates.
    Candidates at the same vertex may be correlated, but only one is used when that leaf is removed.
    Repeating this proves the bound. It is uniform in the fixed marked points and averaged over the observed rows
    and columns.
  Let $p$ be the conditional probability of the conflict event given those observed variables.
    The absolute averaged signed sum is at most $2^ell p$, and
  $ bb(E) p^2 lt.eq bb(E) p lt.eq e^(O \( j \)) z^(ell \/ 2) . $
  Consequently its kernel from the remaining rows to the remaining columns has Hilbert–Schmidt norm at most
    $e^(O \( j \)) z^(ell \/ 4)$. Finally one integrates the values on $U union V$;
    their individual marginals on the two sides are uniform so Cauchy–Schwarz suffices.
    Summation over at most $2^j$ choices on them proves the operator bound.
  For the second inequality we describe diagonal weights for the marked row fibers.
    Given the full row coordinates and distinct marked positions satisfying the counts $t_i$,
    the squared norm of evaluation on the fiber of $F$ is at most
  #[#set math.equation(numbering: n => "(34)")
   $ e^(O \( j \)) h_R r_R thin d_R \( x_U \) \, wide d_R \( x_U \) =
     "Tr" #scale(x: 120%, y: 120%)[\(] \( P_R \)_A Q_A \( x_U \) #scale(x: 120%, y: 120%)[\)] \/ r_R .
     $ <ten:frames:eq:9>]
  Here $Q$ averages over the subgroup of $H$ fixing these marked positions.
    This uses transitive evaluation on the marked injections as recalled above,
    with a conversion of probability normalizations by at most $e^(O \( j \))$.
    We put $d_R = 0$ if the marked positions do not qualify by themselves. The analogous weight is $d_C$.
    They are at most one.
  We need the following bound for random marked positions chosen uniformly independently on the board,
    with any $u$ of the $t_R$ positions already prescribed:
  #[#set math.equation(numbering: n => "(35)")
   $ bb(E) thin d_R med lt.eq med e^(O \( j \)) \( j \/ n \)^(t_R - u) . $ <ten:frames:eq:10>]
  To check it, let $u_i$ be the counts already prescribed in the different rows; assume feasibility.
    Given row assignments with the right counts and given distinctness of the marked positions,
    average the fixed-space projection over the remaining choices within rows.
    In row $i$, on restricting $alpha_i$ to $frak(S)_(m - u_i)$,
    the only shapes $delta$ that can have $frak(S)_(m - t_i)$-invariants must have first row exactly $m -
    t_i$ by branching. The averaged projection on each such block has norm equal to the invariant-space fraction
    $lt.eq e^(O \( t_i \)) binom(m - u_i, t_i - u_i)^(- 1)$, by (24);
    this averaging is central on $frak(S)_(m - u_i)$. Multiply these bounds and the probability of attaining counts:
  $ frac(\( t_R - u \) !, b^(t_R - u) product_i \( t_i - u_i \) !) . $
  The falling factorial bound gives (35). This argument covers zero unspecified or zero prescribed positions as well.
  For each term of the $Z$ expansion, the full observed row assignments of $x$ and column assignments of $y$ are
    independent. Consequently we can bound the squared Hilbert–Schmidt norm by integrating over these assignments:
    within each pair of fibers the operator kernel is a conditional expectation of rank-one forms (evaluations on
    both sides, times distinctness factors). Jensen bounds its Hilbert–Schmidt norm squared using the products of
    squared evaluation norms. Hence the factor needed after $e^(O \( j \)) h_R r_R h_C
    r_C$ is bounded by $bb(E) \[ d_R \( x_U \) d_C \( y_V \) \]$.
    Let $S subset.eq U ∩ V$ be the indices whose marked positions are shared in this expansion term.
    Conditional on these positions, the other marked points on the two sides are independent.
    Apply (35) to the row marks with $S$ prescribed, and then average the column marks without prescriptions.
    The resulting bound is
  $ bb(E) \[ d_R \( x_U \) d_C \( y_V \) \] lt.eq e^(O \( j \)) z^(\| U \| - \| S \| + \| V \|) lt.eq
    e^(O \( j \)) z^(\| U union V \|) . $
  Triangle inequality over the expansion proves (33).
  ======= 2.1.3.3 From the blocks to the selected projections. <from-the-blocks-to-the-selected-projections.>
  Since $0 < z < 1$, the two block bounds give
  $ parallel L_(U \, V) parallel_8^8 lt.eq parallel L_(U \, V) parallel_oo^6 parallel L_(U \, V) parallel_2^2
    lt.eq e^(O \( j \)) h_R r_R h_C r_C z^(j + ell \/ 2) lt.eq e^(O \( j \)) h_R r_R h_C r_C z^j . $
  There are at most $2^j$ mark sets on either side. The triangle inequality for their block embeddings and the
    bounded right inverses in (32) therefore give the same bound, with a changed absolute constant,
    for $parallel I_R^(*) I_C parallel_8^8$. Its nonzero singular values are those of $P_R P_C$ on $cal(I)_lambda$, so
  $ f^(lambda_(*)) parallel \( P_R P_C \)_lambda parallel_8^8 lt.eq e^(O \( j \)) h_R r_R h_C r_C \( j \/ n \)^j . $
  Finally $f^lambda \/ f^(lambda_(*)) lt.eq binom(n, j)$ and $binom(n, j) \( j \/ n \)^j lt.eq e^j$ prove (30). ◻
]

To get (26), split (25) at $v = 8$ into types and dyadic singular value bands on each side.
  For a term with values $lt.eq w_R \, w_C$ (upper endpoints of the bands),
  use the selected projections on the inner sides of the two maps and (30),
  multiplying the norm bound by $w_R w_C$. Within a type, $sum w_R \( h_R r_R \)^(1 \/ 8) =
  O \( log \( n ! \) + 1 \)$ since each term is bounded by (25),
  and an extreme small-value tail is geometric using $r_R lt.eq h_R lt.eq n !$; likewise for columns.
  Summing including type counts proves (26).

===== 2.1.4 The signed-tensor estimate <ten:frames:part:113>

The selected-rank estimate costs an exponential in the first-row deficit.
  We now obtain a different cost, depending on boxes outside a small hook.
  This is a separate signed-tensor argument; it will complement the first estimate when the deficit is large.

Separate the diagram of $lambda$ into its first $s$ rows (shape $alpha$),
  then the first $s$ columns of the remaining diagram (transpose shape $beta$, i.e., $beta$ lists their lengths),
  then the remaining shape $gamma$ of size $k$. Let $N' = n -
  k$ and write $H_0$ for the entropy in natural log units of the list $\( alpha \, beta \) \/
  N'$ (entries are parts). By interleaving tableaux respecting just the indicated rows and columns and the
  subtableau on $gamma$,

#[#set math.equation(numbering: n => "(36)")
 $ f^lambda med lt.eq med f^gamma binom(n, k) exp \( N' H_0 \) . $ <ten:frames:eq:11>]

Use a mixed tensor space over placements of $k$ distinct special labels on the board.
  On the other sites use $W = bb(C)^s xor bb(C)^s$, even and odd respectively.
  Permuting sites uses the usual signed tensor permutation (a minus for interchanging two odd factors);
  special labels count as even. Explicitly one takes a direct sum of the remaining tensor spaces indexed by the
  placements and permutes symbols with the sign of the reordering on the odd symbols.
  This is a representation of $frak(S)_n$. Block diagonal simultaneous unitaries in $cal(G) = U \( s \) times
  U \( s \)$ commute with it. Use the projection $P$ to $cal(G)$-type $\( alpha \, beta \)$.
  This space contains $lambda$ with multiplicity at least $f^gamma$.
  Indeed by ordinary Schur–Weyl applied on each species of tensor factors we have induction of $alpha$,
  the conjugate $beta^(⊺)$ (because of the sign), and the regular representation for the $k$ labels.
  The triple Littlewood–Richardson coefficient with $gamma$ is positive:
  combine $beta^(⊺) \, gamma$ by row sums, then with $alpha$ by column sums (the highest weight sum rule and its
  conjugate). This yields $lambda$.

Write $Q_H = X^(*) X \, med Q_K = Y Y^(*)$. To bound the trace for the product on $P$ we use

$ "Tr" \( Q_H P Q_K P \) . $

Since $P$ preserves placements, only diagonal placement blocks of $Q_H \, Q_K$ occur:
  in returning each special label one factor preserves its row and the other its column.
  For any placement the diagonal block $R_H$ is given by the restriction of the group-algebra coefficients of
  $Q_H$ to the subgroup fixing the special positions pointwise.
  This restriction is positive there (compression in the regular representation).
  If $a_i$ special positions occur in row $i$, its norm on a tuple of types $delta_i tack.r m - a_i$ is bounded by

#[#set math.equation(numbering: n => "(37)")
 $ frac(exp \( O \( n^0.8 \) \), product_i \( m \)_(a_i) thin f^(delta_i)) . $ <ten:frames:eq:12>]

Indeed by (25) with $v = 2$ the full-group identity coefficient times $\| H \|$ is at most the type count.
  On the subgroup the same coefficient times subgroup order bounds dimension times trace on each block.
  There is an analogous $R_K$.

We explain a positive-operator majorization for $R_H$, on this placement.
  Up to a factor $exp \( O \( n^0.8 \) \) \/ product_i \( m \)_(a_i)$, it is majorized by an average of

#[#set math.equation(numbering: n => "(38)")
 $ ⨂_(upright("remaining sites ") \( i \, j' \)) tau_i \, $ <ten:frames:eq:13>]

where the $tau_i$ are block diagonal positive matrices on $W$ of trace one.
  To verify it use separate block-diagonal unitary types on each row.
  For $M = m - a_i$ remaining sites of one row, a type $\( u \, v' \)$ with total degree $M$ corresponds under
  $frak(S)_M$ to constituents of induction from $u$ and $\( v' \)^(⊺)$, with $u \, v'$ each of length at most $s$.
  This again follows by using ordinary Schur–Weyl on the separate species.
  Signed reorderings used to group factors together do not affect the argument and respect products of even
  operators. Every such $frak(S)_M$ constituent $delta$ satisfies

$ u_i lt.eq delta_i lt.eq u_i + s \, wide v'_i lt.eq delta_i^(⊺) lt.eq v'_i + s \, $

with zero padding. For example $\( v' \)^(⊺)$ can be obtained by successive induction of at most $s$ single
  columns, so Pieri gives the first bound, and the conjugate gives the other.
  Its hook-length product off the top left $s times s$ box is bounded using the horizontal pieces of lengths at
  most $u_i$ with hook extensions down by at most $s$, and the vertical pieces for $v'_i$ similarly. Thus

#[#set math.equation(numbering: n => "(39)")
 $ f^delta med gt.eq med exp { - O \( s^2 log \( n + 1 \) \) } med exp { M H \( \( u \, v' \) \/ M \) } \,
   $ <ten:frames:eq:14>]

by the hook formula and factorial estimates; here $H \( dot.op \)$ in an entropy expression denotes Shannon
  entropy. For instance the hook product is at most $\( n + s + 1 \)^(O \( s^2 \)) product_i u_i ! thin v'_i !$.
  Empty rows of sites give trivial estimates.

On the other hand take a trace-one matrix of spectrum $\( u \, v' \) \/
  M$ in the two blocks and conjugate by Haar block-diagonal unitaries.
  The expected tensor power of order $M$ on this type is scalar and at least $exp { -
  M H \( \( u \, v' \) \/ M \) - O \( s^2 log \( n + 1 \) \) }$, by the highest weight and dimension bounds.
  One can average also over type choices at logarithmic cost $O \( s^2 log \( n + 1 \) \)$.
  Applying this independently in each row gives (38) from (37), (39):
  the accumulated costs fit in $O \( n^0.8 \)$ since $b \, m = O \( sqrt(n) \)$.
  We likewise use a column average of products of $sigma_(j')$.

===== 2.1.5 Density normalization on the remaining cells <ten:frames:part:151>

For these majorizing averages, by positivity it suffices to bound uniformly

#[#set math.equation(numbering: n => "(40)")
 $ ∥\( ⨂ tau_i^(1 \/ 2) \) med P med \( ⨂ sigma_(j')^(1 \/ 2) \)∥_2^2 $ <ten:frames:eq:15>]

on the remaining sites of the placement. Use the uniform average over all $b$ rows,

$ D_0 = 1 / b sum_(i = 1)^b tau_i + epsilon I \, wide epsilon > 0 . $

This averages the full board, including the row states at deleted positions.
  Insert $\( D_0^(- 1 \/ 2) \)^(⊗ N')$ before $\( D_0^(1 \/ 2) \)^(⊗ N') P$ in the middle.
  The latter operator can be expanded as an integral of the simultaneous $cal(G)$ actions,
  with total absolute coefficient bounded by

$ \( n + s + 1 \)^(O \( s^2 \)) (\( "Tr" D_0 \)^(N') e^(- N' H_0))^(1 \/ 2) . $

Indeed this is Fourier expansion on one isotypic type by unitary matrix orthogonality (the extension to
  $D_0^(1 \/ 2)$ acts there by the same representation with its multiplicity);
  its operator norm uses the ordered eigenvalues on the two blocks to powers given by the two partitions,
  bounded by the displayed entropy factor using their sum $"Tr" D_0$.
  For a simultaneous block unitary $U$, the remaining tensor product in (40) after this insertion and expansion
  has squared Hilbert–Schmidt norm

$ product_(upright("remaining ") \( i \, j' \)) "Tr" \( D_0^(- 1 \/ 2) tau_i D_0^(- 1 \/ 2) U sigma_(j') U^(*) \) . $

Denote these nonnegative entries by $W_(i j')$ and put $macron(sigma) = m^(- 1) sum_(j') sigma_(j')$.
  Their full-board average satisfies

$ 1 / n sum_(i \, j') W_(i j') =
  "Tr" #h(-0.16667em) [D_0^(- 1 \/ 2) \( D_0 - epsilon I \) D_0^(- 1 \/ 2) U accent(sigma U, ‾)^(*)] lt.eq 1 . $

The sum over surviving cells is therefore at most $n$. Arithmetic–geometric mean on those $N'$ cells gives

$ product_(upright("remaining ") \( i \, j' \)) W_(i j') lt.eq \( n \/ N' \)^(N') lt.eq e^k . $

Sending $epsilon$ to zero makes $"Tr" D_0 arrow.r 1$ and bounds (40) by $exp { - N' H_0 + O \( k + n^0.8 \) }$.

It remains to sum the diagonal placement blocks. If $a_i$ and $a'_(j')$ are their row and column loads, then

$ product_i \( m \)_(a_i) product_(j') \( b \)_(a'_(j')) gt.eq \( m \/ e \)^k \( b \/ e \)^k = e^(- 2 k) n^k . $

There are $\( n \)_k lt.eq n^k$ ordered placements. Thus their number cancels the factor $n^(- k)$ supplied by the
  two majorizations, at cost $e^(O \( k \))$. Combining (38), (40) and the column estimate, we conclude that

$ f^gamma parallel \( X Y \)_lambda parallel_2^2 lt.eq exp { - N' H_0 + O \( k + n^0.8 \) } . $

This proves (27) by (36).

===== 2.1.6 The sparse estimate in short time windows <ten:frames:part:177>

The two static estimates will close the recursion away from the first row.
  To finish the argument, we need the following direct estimate for the actual sweep.
  We retain its time-window proof because it uses a different cancellation from the weighted forest argument.

We record a direct bound, for all sufficiently large $d$:

#[#set math.equation(numbering: n => "(41)")
 $ parallel \( mu_d \)_lambda parallel_oo med lt.eq med n^(- c j) quad upright("if ") 1 lt.eq j = n -
   lambda_1 lt.eq n^0.9 \, $ <ten:frames:eq:16>]

where $c > 0$ is absolute. Work on $j$-point injections $x \, y$ again,
  with the cube coordinates now and the iid normalization (functions are extended by zero).
  Any card traveling from $x_i$ to $y_i$ in a sweep must use a unique path of sites.
  For any subset $I$ of the cards let $K_I \( x \, y \)$ denote the density on their $y$ positions relative to
  uniform independent sampling, given their $x$ positions. On injections this is a product of pair factors within
  $I$: the factor is 1 for non-encounter, and for paths coming to the same switch from opposite sides it is 2 if
  they split, 0 if they conflict. Such potential encounters for a pair can only start at the step updating their
  last differing input coordinate. Indeed the unupdated suffixes are fixed.
  If paths are invalid there is a first failure leading to a zero factor,
  and on valid paths the formula counts the required fair coins.

In pairing functions of type $lambda$ only the part

$ sum_(I subset.eq \[ j \]) \( - 1 \)^(j - \| I \|) K_I $

is needed for the full density $K_(\[ j \])$, by the top-degree property.
  This expression vanishes unless every vertex is covered by potential encounters (the paths are determined for
  all vertices, regardless of validity). We bound the operator norm of each nonnegative $K_I$ restricted to that
  event and to injections.

Divide the times into a bounded number of windows updating coordinates $a + 1 \, dots.h \, g$, with $g - a lt.eq
  d \/ 32$. For large $d$ these windows can cover the whole scan.
  A contact in this window requires the two paths to have the same suffix of $x$ after coordinate $g$ and the same
  prefix of $y$ through coordinate $a$. Call each such suffix-prefix pair a #emph[window cell].
  Coverage of all vertices by contacts therefore implies that, in some window,
  at least $c_0 j$ vertices lie in nonsingleton window cells, for an absolute $c_0 > 0$.

At least one of $a \, d - g$ is at least $0.4 d$. We first treat $a gt.eq 0.4 d$.
  Group the input points by their suffix after $g$, and call a group dense when its count is at least

$ T = 2^a n^(- 1 \/ 64) . $

Split the window event into two parts. Let $cal(E)_(upright("dense"))$ be the event that dense suffix groups
  contain at least $c_0 j \/ 2$ vertices. Let $cal(E)_(upright("light"))$ be window coverage with fewer than that
  many vertices in dense groups. We will prove, for the mixed sampling associated with each $K_I$,

#[#set math.equation(numbering: n => "(42)")
 $ sup_y Pr_(upright("reverse")) \( cal(E)_(upright("dense")) divides y \) lt.eq e^(C j) n^(- c_1 j) \, wide
   sup_x Pr_(upright("forward")) \( cal(E)_(upright("light")) divides x \) lt.eq
   e^(C j) n^(- c_1 j) . $ <eq:frame-window-probabilities>]

These are respectively a column-sum and a row-sum bound for the two positive restricted kernels.

Given $x$, mixed sampling uses genuine sweep paths for $I$ and independent uniform destination bits for the other
  indices. Reverse sampling is defined in the same way given $y$.
  Discarding noninjective outputs only decreases the kernel mass.
  For counts $Z_nu$ in disjoint site groups at an intermediate or final time, both unrestricted mixed laws satisfy

#[#set math.equation(numbering: n => "(43)")
 $ bb(E) product_nu \( Z_nu \)_(r_nu) lt.eq product_nu \( bb(E) Z_nu \)^(r_nu) . $ <ten:frames:eq:17>]

For the genuine sweep subset, inclusion of any specified distinct sites has probability at most the product of the
  one-site probabilities. This holds initially and is preserved by random switches:
  a test set containing one endpoint uses the average of the two old bounds,
  while a test set containing both uses that their old marginal product is at most the square of their averaged
  marginal. Summing the site inequalities gives (43). Independent extra paths have the same factorial bounds,
  and independent addition preserves them by the falling-factorial binomial formula.

In reverse sampling from fixed $y$, every suffix group of $x$ has mean $j \/ 2^(d - g)$.
  The deficit assumption and the window length give

$ frac(j \/ 2^(d - g), T) = j / n thin 2^(g - a) n^(1 \/ 64) lt.eq n^(0.9 - 1 + 1 \/ 32 + 1 \/ 64) = n^(- 17 \/ 320) . $

There are at most $j \/ T$ dense groups. Their possible choices cost at most $exp \( O \( j log n \/ T \) \)$;
  if $j < T$, the event is impossible. Since $T gt.eq n^(0.4 - 1 \/ 64)$,
  this cost is absorbed by $e^(O \( j \))$. The union of any fixed choice of at most $j \/
  T$ groups has mean at most $j n^(- 17 \/ 320)$. Applying (43) to a factorial moment of order $ceil.l c_0 j \/ 2
  ceil.r$ proves the first bound in (42).

For forward sampling from fixed $x$, each window cell in a nondense suffix group has mean $mu_nu lt.eq T \/ 2^a =
  n^(- 1 \/ 64)$ at time $a$. On $cal(E)_(upright("light"))$ at least $c_0 j \/
  2$ vertices lie in nonsingleton cells of this kind. A cell with $r gt.eq
  2$ vertices supplies $floor.l r \/ 2 floor.r gt.eq r \/ 3$ disjoint pairs,
  so there are at least $c_2 j$ disjoint co-located pairs, with an absolute $c_2 > 0$. Since

$ sum_nu mu_nu^2 lt.eq n^(- 1 \/ 64) sum_nu mu_nu lt.eq j n^(- 1 \/ 64) \, $

(43) bounds the expected number of sets of $u = ceil.l c_2 j ceil.r$ such pairs by

$ frac(\( sum_nu mu_nu^2 \)^u, 2^u u !) lt.eq e^(O \( j \)) n^(- u \/ 64) . $

Reducing $c_2$ if necessary handles integer rounding and proves the second bound in (42).

If instead $d - g gt.eq 0.4 d$, transpose the kernel by exchanging $x \, y$ and reverse the coordinate names.
  The window then has endpoints $a' = d - g$, $g' = d - a$, so the preceding argument applies with $a' gt.eq
  0.4 d$. This exchanges the row and column bounds and leaves the operator norm unchanged.

Each restricted positive kernel thus has one sum bounded by $e^(O \( j \)) n^(- c_1 j)$ and the other by one.
  The Schur bound gives its operator norm at most $e^(O \( j \)) n^(- c_1 j \/ 2)$.
  Summing over the bounded number of windows and the $2^j$ subsets $I$ proves (41), with a smaller absolute $c$.
  For $j = 1$ the cancelled kernel is zero because there can be no contact.

===== 2.1.7 A uniform Schatten exponent <ten:frames:part:206>

We supply details on uniformity of the Schatten exponent.
  At any fixed range of sizes a sufficiently large exponent in (23) suffices.
  In fact the sweep matrix is a product of orthogonal projections (matching subgroup averages),
  with norm strictly below one on every nontrivial irreducible:
  equality would require a joint invariant vector, and all the edges together generate the symmetric group.

Split a large $d$ into $floor.l d \/ 2 floor.r \, ceil.l d \/ 2 ceil.r$ bits.
  Each part of the board update is a product of independent smaller sweeps.
  If (23) holds in the smaller problems with exponent $lt.eq p'$, taking $p' gt.eq 8$,
  their independent products on the factor groups have

$ h_A parallel X_A parallel_(p')^(p') lt.eq 1 \, wide h_B parallel Y_B parallel_(p')^(p') lt.eq 1 \, $

by tensoring (norms are contractions). Either product estimate (26), (27) with right hand log $cal(E)$ then gives

#[#set math.equation(numbering: n => "(44)")
 $ f^lambda parallel \( X Y \)_lambda parallel_(p')^(p') lt.eq exp \( cal(E) \) . $ <ten:frames:eq:18>]

For clarity this transference uses ordinary Schatten norm complex interpolation:
  take analytic families in the two group algebras replacing singular values $x$ by $x^(z p' \/ v)$ (zeros held
  zero), preserving singular vectors. At real part 1 use (26) or (27) with its given exponent $v$,
  and at real part 0 use product operator norm at most 1. Interpolation at $v \/ p'$ gives (44),
  by the three-lines Schatten inequality between operator norm and $v$-norm.
  Thus the log costs do not grow with the starting exponent.

It remains to make one of the two logarithmic costs small relative to $F = log f^lambda$.
  Types of length greater than $n \/ 2$ are annihilated by one matching layer, as noted in Section 2.
  For the remaining nontrivial types, Lemma 3 gives $F gt.eq c_6 j$.
  We now assume $j gt.eq n^0.9$, leaving the sparse range to (41).

With $k \, s$ as in (27), the hook formula on the lower diagram of size $j$, followed by (24), gives

#[#set math.equation(numbering: n => "(45)")
 $ F gt.eq log binom(n, j) + k log \( s \/ 2 \) - O \( j \) . $ <eq:frames-core-dimension>]

Indeed all hooks of the lower diagram are at most $j$, while the indicated $k$ interior boxes have hooks at most
  $2 j \/ s$ by their row and column indices there. Comparing their product with $j !$ gives a lower dimension
  bound $e^(- O \( j \)) \( s \/ 2 \)^k$.

If $F gt.eq j d^(1 \/ 4)$, choose the selected-rank product estimate (26). Its logarithmic cost is

$ O \( j + n^0.8 \) lt.eq O \( d^(- 1 \/ 4) F \) \, $

since $j gt.eq n^0.9$.

If $F < j d^(1 \/ 4)$, use (45) and $F gt.eq c_6 j$ to obtain

$ log \( n \/ j \) = O \( d^(1 \/ 4) \) \, wide k = O \( F \/ d \) . $

When $k gt.eq j \/ d^2$, we have $log \( n \/ k \) lt.eq log \( n \/ j \) + 2 log d = O \( d^(1 \/ 4) + log d \)$,
  and hence $k log \( n \/ k \) + k = O \( F d^(- 3 \/ 4) \)$.
  When $0 < k < j \/ d^2$, the crude bound $log \( n \/ k \) lt.eq log n = O \( d \)$ gives $k log \( n \/ k \) +
  k = O \( j \/ d \) = O \( F \/ d \)$. At $k = 0$ these terms vanish.
  The signed-tensor estimate (27) therefore has logarithmic cost at most $O \( d^(- 1 \/ 4) F \)$ as well;
  its $n^0.8$ term is absorbed using $F gt.eq c_6 n^0.9$.

For large enough $d$, the cost in (44) is consequently at most $epsilon_d F$ with $epsilon_d =
  O \( d^(- c) \) lt.eq 1 \/ 2$, uniformly in these shapes.
  This also bounds the operator norm to the $p'$ power by $exp \( - \( 1 - epsilon_d \) F \)$,
  so increasing $p'$ by a factor $1 + O \( d^(- c) \)$ restores (23).
  For $1 lt.eq j lt.eq n^0.9$, (41) and $f^lambda lt.eq n^j$ give, at any sufficiently large absolute exponent $p$,

$ f^lambda parallel \( mu_d \)_lambda parallel_p^p lt.eq \( f^lambda \)^2 parallel \( mu_d \)_lambda parallel_oo^p
  lt.eq n^(\( 2 - c p \) j) lt.eq 1 . $

The trivial representation satisfies (23) exactly.

Thus starting with a large enough finite base exponent covering fixed small $d$ and the direct-bound requirement,
  it is enough at each large $d$ to multiply the maximum of the two required smaller exponents by $1 +
  O \( d^(- c) \)$. These factors have bounded product along bit-length halvings.
  This proves (23) with a uniform exponent.

===== 2.1.8 Full-deck amplification <ten:frames:part:231>

Equation (23) gives $parallel \( mu_d \)_lambda parallel_oo lt.eq \( f^lambda \)^(- 1 \/ p)$.
  The Plancherel and dimension-sum argument of Section 6.3 therefore applies to repeated forward sweeps,
  giving worst-start mixing after an absolute number of sweeps, or $O \( d \)$ physical shuffles.
  Proposition 6 supplies the matching lower order. This completes the frame route to the common mixing conclusion.

== 3 Coherent states <part:coherent>

==== 3.1 Coherent overlap and a uniform trace moment <rec:sec-coherent>

We next ask how the overlap changes when missing positions are retained as an ordered list.
  Write $n = 2^d$ and $B_n = K_d$ for $d gt.eq 1$; for $d = 0$ put $B_1 = upright("id")$, the empty sweep.
  The method proves a dimension-weighted trace bound with right side one.
  It combines a partial-mapping density estimate with a coherent-state overlap on a grid with holes.
  The coherent overlap uses a moment-matching change of basis;
  we include that step because it explains why the grid factors have mean at most one even after cells are removed.

#thm([Theorem 3.1.])[
  #emph[There is an absolute $p_(*) gt.eq 1$ such that, for every dyadic $n$ and every irreducible type $lambda
    tack.r n$,
#[#set math.equation(numbering: n => "(46)")
 $ D_lambda "Tr" #h(-0.16667em) (\( \( B_n^(*) B_n \) \|_(V_lambda) \)^(p_(*))) lt.eq 1 . $ <rec:coherent-unit-moment>]

 Consequently $parallel B_n \|_(V_lambda) parallel lt.eq D_lambda^(- 1 \/ \( 2 p_(*) \))$.
   The moment in the display is the Schatten power $2 p_(*)$, because $"Tr" \( B_n^(*) B_n \)^(p_(*)) =
   parallel B_n parallel_(2 p_(*))^(2 p_(*))$.]
] <rec:coherent-main>

===== 3.1.1 Two sparse estimates <two-sparse-estimates>

For a nontrivial $lambda = \( n - k \, beta \)$ with $k = n - lambda_1 gt.eq 1$, the two inputs are

#[#set math.equation(numbering: n => "(47)")
 $ parallel B_n \|_(V_lambda) parallel^2 & lt.eq C^k \( 1 + d \)^(C k) \( k \/ n \)^(k \/ 2) \,\
parallel B_n \|_(V_lambda) parallel^2 & lt.eq e^(C k) D_beta^(- a) $ <rec:coherent-contact-bound>]

for absolute $a > 0$. For the first estimate we use the square of the fully cancelled kernel.
  Work with counting-measure matrices on ordered injective $k$-tuples.
  For $A subset.eq \[ k \]$, let $K_A^(upright("prob"))$ be the sweep transition kernel on the coordinates in $A$,
  and set

$ L_A \( x \, y \) = n^(- \( k - \| A \| \)) K_A^(upright("prob")) \( x_A \, y_A \) \, wide D \( x \, y \) =
  sum_(A subset.eq \[ k \]) \( - 1 \)^(k - \| A \|) L_A \( x \, y \) . $

Both arguments of $L_A$ are restricted to injective full tuples. Its row and column sums are at most one:
  the coordinates in $A$ follow a genuine sweep and the others are sampled independently uniformly,
  after which noninjective outcomes are discarded. Consider the subspace of functions whose sum over any one tuple
  coordinate is zero when the other coordinates are fixed. All proper-coordinate marginals vanish on this
  subspace, so $D$ acts exactly as the full sweep kernel $K = L_(\[ k \])$.
  The type $lambda = \( n - k \, beta \)$ belongs to it by the branching argument in Section 6.1.

The product-of-pair-factors formula for the sweep shows that $D \( x \, y \) =
  0$ if one of the $k$ unique start-to-end paths has no potential switch contact with another path.
  Write $cal(E) \( x \, y \)$ for the event that this contact graph has no isolated vertex.
  By discarding this condition on the first leg only,

$ \| \( D^(*) D \) \( x \, y \) \| lt.eq sum_(A \, B subset.eq \[ k \]) med
  sum_(z upright(" injective")) L_A \( z \, x \) L_B \( z \, y \) upright(bold(1))_(cal(E) \( z \, y \)) . $

For fixed $x \, A$, the first-leg mass in $z$ is bounded by the law obtained from a reverse sweep of the labels in
  $A$ and independent uniform positions for the others. Under this unrestricted mixed law,
  the occupied set $S$ satisfies

$ Pr \( F subset.eq S \) lt.eq \( k \/ n \)^(\| F \|) $

for every fixed site set $F$. For the sweep subset this follows from the negative-inclusion argument in (22).
  Adding the independent uniform positions preserves the bound:
  partition the tested sites between the two sources and sum the resulting product bounds.
  Restriction to injective $z$ only decreases these probabilities; it is retained in the kernel sum,
  so the relevant $S$ always has exactly $k$ sites.

Independently presample a complete common routing for the second leg and one private uniform path from each site.
  Any assignment of the labels in $B$ to common paths and the other labels to private paths is covered by the
  $2^k$ choices of path type on a $k$-site set. Thus no factor $k !$ is needed.
  The expected number of such typed unordered sets with no isolated contact is at most

#[#set math.equation(numbering: n => "(48)")
 $ sum_(1 lt.eq j lt.eq k \/ 2) C^k binom(n, j) \( C d \)^(k - j) . $ <rec:coherent-forest-count>]

Indeed choose roots, ordered forest shapes and path types. Every nontrivial component has a rooted spanning tree.
  A new common-path child has at most two possible starts per switch;
  summing over private-path starts gives at most two expected choices per switch.
  Expose independent paths only at unused sites and sum successively over the tree extensions.
  This bounds each extension by $4 d$ and proves the display, with the number of forest shapes absorbed into $C^k$.

Multiply the expected count by $\( k \/ n \)^k$, using the first-leg inclusion bound independently of the
  second-leg fields, and sum the at most $4^k$ choices of $A \, B$.
  The elementary bound $binom(n, j) lt.eq \( C n \/ k \)^(k \/ 2)$ for $1 lt.eq j lt.eq
  k \/ 2$ shows that every absolute row sum of $D^(*) D$ is at most

$ R_k = C^k \( 1 + d \)^(C k) \( k \/ n \)^(k \/ 2) . $

For $k = 1$ the contact event is empty and the same assertion is immediate.
  Since $D^(*) D$ is self-adjoint, the column sums obey the same bound,
  and the Schur test gives $parallel D^(*) D parallel lt.eq R_k$.
  On that zero-marginal subspace, $D = K$, so $parallel K parallel^2 lt.eq R_k$.
  This proves (47) without another square-root loss.

The second estimate is Proposition 6.3 of #cite(label("OpenAI2026Routing"), form: "prose"), applied with $T_N =
  B_n$ and $N = n$. Its input, Theorem 6.1 of that companion, is the stronger density statement

#[#set math.equation(numbering: n => "(49)")
 $ sup_x n^(- k) sum_y { n^k Pr_(B_n^(*) B_n) \( x mapsto y \) }^(1 + delta) lt.eq e^(C k) $ <rec:coherent-density>]

for a fixed absolute $0 < delta lt.eq 1$, all $0 lt.eq k lt.eq n$, and every ordered injection $x$.
  Repeated-site output tuples contribute zero. The companion gives the displayed power normalization as well as
  the normalization by $\( n \)_k$, in both orientations and for both rows and columns.
  Its Proposition 6.3 transfers this bound through the right $S_k$ label action to obtain exactly (47), with $a =
  delta \/ \( 1 + delta \)$. Section 6.6 there also proves the density estimate by the distinct cycle-window
  certificate and entropy argument. Only these partial-deck statements are used here;
  the moment induction below remains local.

For sufficiently large $d$, put $s = log \( n \/ k \)$ and suppose $s gt.eq d^(3 \/ 4)$.
  The first bound then gives $log parallel B_n \|_(V_lambda) parallel^2 lt.eq - k s \/ 4$.
  Taking the geometric mean of this bound and (47), and increasing the fixed lower threshold on $d$, gives

$ log parallel B_n \|_(V_lambda) parallel^2 lt.eq - k s \/ 8 + C k \/ 2 - \( a \/ 2 \) log D_beta lt.eq -
  k s \/ 16 - \( a \/ 2 \) log D_beta . $

Since $log D_lambda lt.eq k \( 1 + s \) + log D_beta$, there is an absolute $c > 0$ such that $parallel
  B_n \|_(V_lambda) parallel^2 lt.eq D_lambda^(- c)$ in this range. In particular,

$ D_lambda "Tr" \( B_n^(*) B_n \)^p lt.eq D_lambda^2 parallel B_n \|_(V_lambda) parallel^(2 p) lt.eq
  1 wide \( p gt.eq 2 \/ c \) . $

This supplies the trace moment directly for the sparse diagrams.

===== 3.1.2 A coherent overlap on a punctured grid <a-coherent-overlap-on-a-punctured-grid>

We first estimate the overlap before restoring the holes.
  The projections below select a single carrier direction in each line, while retaining every multiplicity copy.

#thm([Proposition 3.2.])[
  (Coherent overlap on surviving cells).  #emph[Let $M \, R \, Q gt.eq 1$ be integers.
    Consider an $M$ by $R$ grid, $n = M R$, with $l$ holes and $m = n - l$ surviving cells.
    Let $K \, J$ be the row and column permutation groups on surviving cells.
    Suppose $mu tack.r m$ lies in a $\( Q \, Q \)$ hook. For Fourier projections $E = ⨂_i
    E_(sigma_i \, e_i)$ and $F = ⨂_j E_(tau_j \, f_j)$ selecting one unit carrier vector on each row or column,
    write $sigma = \( sigma_i \)$ and $tau = \( tau_j \)$. Then
#[#set math.equation(numbering: n => "(50)")
 $ D_mu "Tr"_(V_mu) \( E F \) lt.eq D_sigma D_tau exp { l +
   C \( 1 + M + R \) Q^2 log \( 2 n \) } . $ <rec:coherent-hook-grid>]

 Here $D_sigma \, D_tau$ denote products over lines, and $C$ is absolute.
   For $m = 0$ the surviving representation is the one-dimensional trivial representation.]
] <prop:coherent-hook>

#proof[
  The case $m = 0$ is immediate. Assume $m > 0$ so the count proportions below are defined.
    Use the signed alphabet with $Q$ even and $Q$ odd symbols.
    For the compact group $U \( Q \) times U \( Q \)$ its tensor representation decomposes into carriers
    $W_(alpha beta)$ paired with $"Ind" \( V_alpha ⊗ V_(beta^(sans(T))) \)$.
    The carrier dimensions and the multiplicities of compatible types are at most $e^(C Q^2 log \( 2 n \))$.
    For a probability vector $q$, write $H \( q \) = - sum_a q_a log q_a$, with $0 log 0 = 0$;
    for a diagonal state $Lambda$, $H \( Lambda \)$ means the entropy of its diagonal.
    If $V_gamma$ occurs in the multiplicity space paired with $\( alpha \, beta \)$,
    put $c = \( alpha \, beta \)$ and $u = \| gamma \|$. The hook formula gives, with $u H \( c \/ u \) =
    0$ when $u = 0$,
  #[#set math.equation(numbering: n => "(51)")
   $ D_gamma gt.eq e^(u H \( c \/ u \) - C Q^2 log \( 2 n \)) . $ <rec:coherent-count-dimension>]
  Indeed the first $Q$ row lengths differ from $alpha_i$ by at most $Q$,
    and the first $Q$ lower column lengths differ from $beta_i$ by at most $Q$.
    Their hook product differs from the corresponding row and column factorials by at most the displayed error.
    Every $\( Q \, Q \)$-hook diagram occurs by taking its first $Q$ rows and the transpose of the remainder.
  Choose a compact-group sector whose multiplicity space contains $V_mu$.
    Let $c_(*)$ be its highest-weight count and put $Lambda = "diag" \( c_(*) \/ m \)$.
    Then $D_mu lt.eq e^(m H \( Lambda \))$. Let $P$ project onto that highest line in every copy of its compact
    type. On the signed slot space $cal(L)_m = \( bb(C)^Q xor bb(C)^Q \)^(⊗ m)$,
    $P$ commutes with the position-permutation action, and its range contains $V_mu$.
    Since the contribution of each irreducible to the trace of a product of orthogonal projections is nonnegative,
  $ "Tr"_(V_mu) \( E F \) lt.eq "Tr"_(cal(L)_m) \( E P F P \) . $
  We will resolve $E \, F$ into positive rank-one terms. The last trace then becomes a positive weighted sum of
    $\| chevron.l y \, P x chevron.r \|^2$. We explain which factor is averaged in the coherent-orbit resolution
    #cite(label("Perelomov1972")) Section 2, equations (7)–(11).
    On a line with $u$ surviving slots the signed tensor space has the orthogonal decomposition
  $ cal(L)_u = xor.big_kappa W_kappa ⊗ M_kappa \, wide M_kappa = xor.big_gamma V_gamma ⊗ cal(N)_(kappa \, gamma) \, $
  where $W_kappa$ is a compact-group carrier of highest count $c_kappa$,
    and $M_kappa$ carries the induced symmetric-group representation.
    A matrix action selecting a unit vector $e$ in type $gamma$ acts on this summand as
  $ I_(W_kappa) ⊗ \| e chevron.r chevron.l e \| ⊗ I_(cal(N)_(kappa \, gamma)) . $
  With $d U$ the normalized Haar probability measure on $U \( Q \) times
    U \( Q \)$ and $h_kappa$ a unit highest vector, replace the first identity by
  $ I_(W_kappa) = dim W_kappa integral \| U h_kappa chevron.r chevron.l U h_kappa \| thin d U \, $
  and resolve the last identity in an orthonormal basis. This gives positive rank-one terms whose vectors,
    in the slot realization, are unitary translates of highest-count vectors.
    The arbitrary selected Specht vector $e$ remains unchanged; all multiplicity copies are present.
    The dimensions of the compact carriers, the number of compatible sectors and the multiplicities are at most
    $e^(C Q^2 log \( 2 n \))$, so the total weight costs this factor per line.
    There is no factor $D_gamma$, because the selected state $\| e chevron.r chevron.l e \|$ has trace one.
    Tensoring these resolutions across the lines gives the row and column coherent product vectors used next.
    Such a vector can be entangled within a line; “product” here refers to different lines.
  It remains to bound a coefficient $chevron.l y \, P x chevron.r$, where $x \,
    y$ are unit coherent product vectors on rows and columns.
    Let $theta_i \, phi.alt_j$ be their normalized line count vectors, with line sizes $r_i \, s_j$.
    For an empty line choose any probability vector; its entropy contribution has coefficient zero. We claim
  #[#set math.equation(numbering: n => "(52)")
   $ \| chevron.l y \, P x chevron.r \|^2 lt.eq exp {C Q^2 log \( 2 n \) - m H \( Lambda \) +
     sum_i r_i H \( theta_i \) + sum_j s_j H \( phi.alt_j \) + l} . $ <rec:coherent-coefficient>]
  To control the product over surviving cells, we will arrange that the row and column count densities have the
    same average $Lambda$. The required change of basis must also preserve the coefficient up to factors at most
    one. A minimum-norm argument provides both properties. This viewpoint has its classical antecedent in
    Kempf–Ness #cite(label("KempfNess1979")) Theorem 0.1; for a character-normalized highest-weight formulation,
    compare #cite(label("FranksWalter2022"), form: "prose") Sections 2 and 4.
    We give the local argument because the occupied-cell and coefficient-square bounds require its exact
    normalization. Let $g$ be block lower triangular on the even and odd alphabets,
    acting on the slot space by $g^(⊗ m)$. With the highest-weight convention used here,
    projection onto the highest line satisfies $P g^(⊗ m) = chi \( g \) P$, where $chi \( g \) =
    "diag" \( g \)^(c_(*))$. We suppress the tensor-power notation in the orbit argument.
    We justify the limiting normalization explicitly. If $P x = 0$ or $P y = 0$,
    the coefficient is zero and no scaling is needed. Assume both are nonzero. Consider the character-corrected orbit
  $ cal(O)_x = { chi \( g \)^(- 1) g x : g upright(" is invertible and block lower triangular") } . $
  Its norm infimum $c_x$ satisfies $0 < parallel P x parallel lt.eq c_x lt.eq 1$,
    because every vector in the orbit has projection $P x$ and the identity is allowed.
    Choose a norm-minimizing sequence. It is bounded, so a subsequence converges to a vector $z_x$ with norm $c_x$
    in the orbit closure. That closure is invariant under every fixed character-corrected group action. Therefore
  $ parallel chi \( h \)^(- 1) h z_x parallel gt.eq c_x $
  for every invertible block lower triangular $h$. In particular the derivative at $h = e^(t X)$, $t = 0$,
    is zero for each block lower triangular matrix $X$.
  Put $x' = z_x \/ c_x$. Each normalized vector in the approximating sequence remains a product of coherent line
    vectors: triangular factorization of each transformed local basis expresses it as a unitary translate of the
    same highest line, times a scalar. The compactness of the local unitary groups gives this form also for $x'$.
    Moreover $P x = c_x P x'$. For a nonempty row ($r_i > 0$) with vector $x'_i$, define the averaged one-slot density
  $ A_i = 1 / r_i sum_(v upright(" in row ") i) "Tr"_(upright("other slots")) \| x'_i chevron.r chevron.l
    x'_i \| = U_i "diag" \( theta_i \) U_i^(*) . $
  Here $U_i$ gives the coherent basis and $theta_i$ its count proportions.
    The equality follows from the highest-count weight: the sum of diagonal occupation expectations is its count
    vector and all off-diagonal Lie-algebra expectations vanish. Individual slot marginals need not coincide.
    For an empty row choose any trace-one density; its coefficient $r_i$ is zero and it occurs in no surviving
    cell. The same convention applies to empty columns. The derivative just obtained says
  $ Re "Tr" #h(-0.16667em) (X sum_i r_i A_i) = Re sum_a c_(* \, a) X_(a a) . $
  Both matrices compared on the right and left are Hermitian.
    Testing all complex lower-triangular entries, including real diagonal entries, therefore yields
  #[#set math.equation(numbering: n => "(53)")
   $ sum_i r_i A_i = m Lambda . $ <rec:coherent-moment-match>]
  Apply the same argument to $y$ to obtain $y'$, a factor $0 < c_y lt.eq 1$, and $sum_j s_j A'_j = m Lambda$.
    Since $P$ is orthogonal,
  $ \| chevron.l y \, P x chevron.r \| = c_x c_y \| chevron.l y' \, P x' chevron.r \| lt.eq \| chevron.l y' \,
    P x' chevron.r \| . $
  This proves both moment matching and the required coefficient compensation without assuming a finite minimizing
    scaling exists.
  Set $Z = Lambda^(- 1 \/ 4)$, using entry one on zero coordinates, which carry no mass.
    The highest-line character gives the exact identity
  $ Z^(⊗ m) P Z^(⊗ m) = e^(m H \( Lambda \) \/ 2) P \, wide log "diag" \( Z \)^(c_(*)) = m H \( Lambda \) \/ 4 . $
  Schur orthogonality expresses $P$ as an integral of simultaneous block-unitary actions with total absolute
    coefficient at most the dimension of its compact carrier.
    Insert this integral into the identity and use the triangle inequality. Squaring gives
  #[#set math.equation(numbering: n => "(54)")
   $ \| chevron.l y' \, P x' chevron.r \|^2 lt.eq e^(C Q^2 log \( 2 n \) - m H \( Lambda \)) sup_U \| chevron.l
     y' \, \( Z U Z \)^(⊗ m) x' chevron.r \|^2 . $ <rec:coherent-scaled-projector>]
  Expand each row and column vector in its coherent letter basis.
    Its coefficients are supported on assignments with the prescribed line counts,
    although they need not factor within a line. If $x_a \, y_b$ are the coefficients of the resulting full
    assignments, then $sum_a \| x_a \|^2 = sum_b \| y_b \|^2 = 1$.
    Cauchy–Schwarz over the pair $\( a \, b \)$ bounds the squared matrix coefficient by the sum,
    over these fixed-count assignments, of the products of squared local matrix entries.
  To bound that sum, sample letters independently at each cell from the row probabilities $theta_i$ and column
    probabilities $phi.alt_j$. Every allowed full pair has the same sampling weight $exp { -
    sum_i r_i H \( theta_i \) - sum_j s_j H \( phi.alt_j \) }$.
    Dropping the count constraints therefore bounds the last square in (54) by
  $ e^(sum_i r_i H \( theta_i \) + sum_j s_j H \( phi.alt_j \)) product_(\( i \, j \) med upright("survives"))
    W_(i j) \, wide W_(i j) = "Tr" \( A'_j Z U Z A_i Z U^(*) Z \) . $
  Thus the independent sampling is a device for summing coefficients with fixed counts,
    not an assertion that the coherent states have identical or independent slot marginals.
    The matrices $A_i \, A'_j$ in this formula are the averaged count densities just defined.
    Under the product probabilities $r_i \/ m \, s_j \/ m$, the mean of $W_(i j)$ is, by (53),
    $"Tr" \( sqrt(Lambda) U sqrt(Lambda) U^(*) \) lt.eq 1$. The relative entropy of the uniform law on surviving
    cells from the product of its marginals is at most $log \( n \/ m \)$:
    compare first with the uniform full grid and use the minimizing property of the actual marginals.
    The entropy form of the geometric-mean inequality therefore gives $product W_(i j) lt.eq
    e^(m log \( n \/ m \)) lt.eq e^l$. This proves (52). Use (51) to pay the local entropy factors,
    sum the coherent-line representations, and cancel the global factor using $D_mu lt.eq e^(m H \( Lambda \))$.
    Equation (50) follows. ◻
]

By positive spectral decomposition and group Plancherel, the same inequality gives,
  for group-algebra coefficients that factor over lines, $w = ⨂_i w_i in bb(C) K$ and $z = ⨂_j z_j in bb(C) J$,

#[#set math.equation(numbering: n => "(55)")
 $ D_mu parallel \( z w \)_mu parallel_(upright("HS"))^2 lt.eq
   e^(l + C \( 1 + M + R \) Q^2 log \( 2 n \)) (\| K \| sum_(g in K) \| w_g \|^2)
   (\| J \| sum_(g in J) \| z_g \|^2) . $ <rec:coherent-coefficient-grid>]

The decomposition is applied to $w w^(*)$ and $z^(*) z$, so every summand is positive.

===== 3.1.3 General diagrams by ordered holes <general-diagrams-by-ordered-holes>

We now return to the full $M$ by $R$ grid and reset the groups to $K = S_R^M$ on rows and $J = S_M^R$ on columns.
  Keeping the holes ordered makes the intermediate list unique when the initial and final lists are prescribed.
  The resulting coefficient-square sum has the following explicit cost.

#thm([Proposition 3.3.])[
  (Restoration with ordered holes).  #emph[Let $E \, F$ select product unit carrier vectors of types $sigma \,
    tau$ in $K \, J$, respectively. For $lambda tack.r n$ and integer $Q gt.eq 1$,
    let $l$ be the number of boxes outside the union of its first $Q$ rows and first $Q$ columns. Then
#[#set math.equation(numbering: n => "(56)")
 $ D_lambda "Tr"_(V_lambda) \( E F \) lt.eq
   D_sigma D_tau e^(3 l + log binom(n, l) + C \( 1 + M + R \) Q^2 log \( 2 n \)) . $ <rec:coherent-general-grid>]

]
] <prop:coherent-restoration>

#proof[
  Let $mu$ be the retained hook and $xi$ the removed straight core.
    Littlewood–Richardson inclusion places $V_lambda$ in induction from $V_mu ⊗ V_xi$.
    In the regular representation designate $l$ distinct labels as holes and let $Pi$ be the commuting relabeling
    projection onto type $mu$ on the other labels. It retains at least $D_mu D_xi gt.eq
    D_lambda \/ binom(n, l)$ dimensions in the multiplicity space of $V_lambda$. Hence
  #[#set math.equation(numbering: n => "(57)")
   $ parallel F E Pi parallel_(upright("HS"))^2 gt.eq binom(n, l)^(- 1) D_lambda "Tr"_(V_lambda) \( E F \) .
     $ <rec:coherent-hole-lower>]
  To estimate this regular-representation norm, let $cal(H)_a$ be the span of permutations whose designated hole
    labels occupy the ordered list $a$. Fixing $a$ leaves all bijections of the surviving labels with the $m = n -
    l$ other positions. Thus $cal(H)_a$ is a regular $S_m$ module, with its counting basis;
    $Pi$ is the right isotypic projection onto $mu$ on every fiber.
    The row and column operators act on positions on the left.
  Let $E_(b a) : cal(H)_a arrow.r cal(H)_b$ and $F_(c b) : cal(H)_b arrow.r cal(H)_c$ be their blocks.
    For given $a \, c$, at most one middle list $b$ is possible:
    each labeled hole keeps its row under $E$ and its column under $F$.
    Write $e_g \, f_g$ for the group-algebra coefficients of $E \, F$.
    For a feasible triple choose $u in K$, $v in J$ with $u a = b$, $v b = c$, and put
  $ K_b & = { h in K : h b = b } \, & w_(b a) \( h \) & = e_(h u) quad \( h in K_b \) \,\
J_b & = { t in J : t b = b } \, & z_(c b) \( t \) & = f_(v t) quad \( t in J_b \) . $
  These stabilizers fix the ordered list pointwise. The extracted coefficients still factor over lines.
    If $L_u \, L_v$ denote the baseline motions and $W_(b a) \, Z_(c b)$ the remaining actions on $cal(H)_b$,
    then $E_(b a) = W_(b a) L_u$ and $F_(c b) = L_v Z_(c b)$.
    The baseline motions are unitary and commute with the right projection $Pi$.
    Regular Plancherel on the surviving labels therefore gives the precise block identity
  #[#set math.equation(numbering: n => "(58)")
   $ parallel F_(c b) E_(b a) Pi \|_(cal(H)_a) parallel_(upright("HS"))^2 =
     parallel Z_(c b) W_(b a) Pi \|_(cal(H)_b) parallel_(upright("HS"))^2 =
     D_mu parallel \( z_(c b) w_(b a) \)_mu parallel_(upright("HS"))^2 . $ <rec:coherent-fiber-identity>]
  The factor $D_mu$ is the right multiplicity in the regular $S_m$ representation.
  Define the two nonnegative coefficient factors
  $ alpha_(b a) = \| K_b \| sum_(h in K_b) \| w_(b a) \( h \) \|^2 \, wide
    beta_(c b) = \| J_b \| sum_(t in J_b) \| z_(c b) \( t \) \|^2 . $
  Equation (55) bounds the block square by $e^(l + C \( 1 + M + R \) Q^2 log \( 2 n \)) alpha_(b a) beta_(c b)$.
    For fixed $b$, the corresponding cosets partition $K$ and $J$, so Fourier coefficient orthogonality gives
  $ sum_a alpha_(b a) = frac(\| K_b \|, \| K \|) D_sigma \, wide sum_c beta_(c b) = frac(\| J_b \|, \| J \|) D_tau . $
  Here $sum_(g in K) \| e_g \|^2 = D_sigma \/ \| K \|$ because the selected carrier projection has rank one,
    and similarly for $F$. Since the middle list is unique, summing the block squares first over $a \,
    c$ and then over $b$ bounds $parallel F E Pi parallel_(upright("HS"))^2$ by
  $ e^(l + C \( 1 + M + R \) Q^2 log \( 2 n \)) D_sigma D_tau sum_b frac(\| K_b \|, \| K \|)
    frac(\| J_b \|, \| J \|) . $
  Falling factorials in the full lines give
  $ \| K_b \| \/ \| K \| lt.eq \( e \/ R \)^l \, wide \| J_b \| \/ \| J \| lt.eq \( e \/ M \)^l . $
  There are at most $n^l$ middle hole lists, and $M R = n$. Their factors cancel to $e^(2 l)$.
    Add the $e^l$ in (55) and the binomial factor in (57) to obtain (56). ◻
]

===== 3.1.4 Closing the uniform moment <closing-the-uniform-moment>

#proof[
  Split a sweep into the balanced grid, $B_n = Y X$, and suppose the children satisfy (46) with exponent $p$.
    For positive $A \, D$ and $p gt.eq 1$, the Araki–Lieb–Thirring trace inequality #cite(label("araki1990")) (see
    #cite(label("audenaert2007")) Theorem 1) $"Tr" \( A^(1 \/ 2) D A^(1 \/ 2) \)^p lt.eq "Tr" \( A^p D^p \)$ gives
  #[#set math.equation(numbering: n => "(59)")
   $ D_lambda "Tr" \( B_n^(*) B_n \)^p lt.eq D_lambda "Tr" { \( Y^(*) Y \)^p \( X X^(*) \)^p } .
     $ <rec:coherent-trace-product>]
  Resolve the right side into positive sums of product projections.
    Take $Q = floor.l n^(1 \/ 50) floor.r$ in (56). For each row or column type,
    dimension times the sum of its spectral coefficients is at most one by the child induction.
    The logarithm of the number of types is $O \( n^(3 \/ 4) log \( 2 n \) \)$. Thus
  #[#set math.equation(numbering: n => "(60)")
   $ D_lambda "Tr" \( B_n^(*) B_n \)^p lt.eq exp C { n^(4 \/ 5) + l +
     l log \( n \/ l \) } . $ <rec:coherent-moment-error>]
  The $Q^2$ error is also absorbed by $n^(4 \/ 5)$. We use the continuous convention $l log \( n \/ l \) =
    0$ when $l = 0$.
  Put $k = n - lambda_1$ and $L_lambda = log D_lambda$. We consider nontrivial surviving types, so $k gt.eq 1$;
    the trivial type will be handled separately. The hook formula on the lower diagram gives
  #[#set math.equation(numbering: n => "(61)")
   $ l log Q lt.eq L_lambda + C k . $ <rec:coherent-core-dimension>]
  Indeed its dimension is at most $D_lambda$ by branching, all its hooks are at most $k$,
    and the $l$ deep-core hooks are at most $2 k \/ Q$. Lemma 3 gives $L_lambda gt.eq
    c k$ for every nontrivial surviving type. Consequently $l lt.eq C L_lambda \/ d$.
    In the nonsparse range $log \( n \/ k \) < d^(3 \/ 4)$, this gives
  #[#set math.equation(numbering: n => "(62)")
   $ l log \( n \/ l \) = l log \( n \/ k \) + l log \( k \/ l \) lt.eq
     C d^(- 1 \/ 4) L_lambda . $ <rec:coherent-small-error>]
  For the second term, $k lt.eq C L_lambda$ and $l lt.eq C L_lambda \/ d$ give $l log \( k \/ l \) lt.eq
    O \( L_lambda log d \/ d \)$: apply monotonicity of $x log \( C L_lambda \/ x \)$ on this range,
    increasing the constant inside the logarithm if needed. Also $k > n e^(- d^(3 \/ 4))$ implies $n^(4 \/ 5)
    lt.eq C d^(- 1 \/ 4) L_lambda$. Consequently (60) is at most $e^(C' d^(- 1 \/ 4) L_lambda)$,
    while it gives the operator bound $parallel B_n parallel^(2 p) lt.eq
    e^(- \( 1 - C' d^(- 1 \/ 4) \) L_lambda)$. To see how the exponent pays the error, write $epsilon =
    C' d^(- 1 \/ 4) lt.eq 1 \/ 2$ and $T = B_n^(*) B_n$ on this type. For $t gt.eq 0$ the two estimates give
  $ D_lambda "Tr" T^(p \( 1 + t \)) lt.eq #scale(x: 120%, y: 120%)[\(] D_lambda "Tr" T^p
    #scale(x: 120%, y: 120%)[\)] parallel T parallel^(p t) lt.eq D_lambda^(epsilon - t \( 1 - epsilon \)) . $
  Taking $t = 2 epsilon$ makes the exponent nonpositive. Thus an increase by $1 + C'' d^(- 1 \/ 4)$ closes the estimate.
  Choose an absolute base $d_0$ before choosing a sufficiently large finite $p_0$.
    On the base range, products of matching projections have no nonconstant common fixed vector,
    so such $p_0$ exists. Choose it also large enough for the sparse consequence of (47) and (47). Above the base take
  $ p_d = \( 1 + C'' d^(- 1 \/ 4) \) max { p_(floor.l d \/ 2 floor.r) \, p_(ceil.l d \/ 2 ceil.r) } . $
  Traces of positive contractions decrease with the exponent.
    Thus the child estimate applies at the larger child exponent, and the preceding argument proves the induction.
    The logarithmic increments are summable along halving scales, so $p_d lt.eq p_(*) < oo$.
    The trivial representation has trace exactly one; killed types have trace zero. This proves (46) in all cases.
  The Plancherel argument of Section 6.3 applies with the dimension power $1 \/ \( 2 p_(*) \)$ supplied by this
    moment. An absolute number of independent forward sweeps therefore mixes the full permutation in $O \( d \)$
    physical shuffles, uniformly over the starting deck. Proposition 6 supplies the matching lower order. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
