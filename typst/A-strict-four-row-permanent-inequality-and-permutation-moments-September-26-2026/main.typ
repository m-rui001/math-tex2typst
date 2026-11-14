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

#align(center)[#text(size: 16pt, weight: "bold")[A strict four-row permanent inequality and permutation moments]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <introduction>

A product of independent random switches can make each card uniform while leaving substantial dependence between
  cards. The Thorp shuffle illustrates this distinction particularly well.
  On $N = 2^d$ positions, with $d gt.eq 1$, one coordinate sweep visits the binary-coordinate directions in the
  fixed order $1 \, dots.h \, d$. In each direction it independently swaps the two cards on every edge with
  probability $1 \/ 2$, leaving them in place otherwise. Every individual card is uniform after this sweep.
  The question is how many sweeps randomize the entire permutation.

We study that question through a four-row decomposition. Removing two coordinate directions leaves four smaller
  independent sweeps, one in each row of a $4$-by-$N \/ 4$ array. The last two directions act within its columns.
  Each smaller sweep contracts according to the representations of its own row group,
  but restricting a representation of $S_N$ to the four row groups creates multiplicities.
  Those multiplicities accumulate as the decomposition is repeated.
  The main point is an inequality that makes their total cost strictly smaller than the available representation
  dimension.

For a function $f : { 1 \, 2 \, 3 \, 4 } arrow.r \[ 0 \, oo \)$, write

$ parallel f parallel_p = (1 / 4 sum_(j = 1)^4 f \( j \)^p)^(1 \/ p) . $

If $u$ denotes uniform measure on $S_4$, then $bb(E)_u product_i
  f_i \( pi \( i \) \)$ is the permanent of the matrix $\( f_i \( j \) \)$ divided by $4 !$.
  Carlen, Lieb and Loss proved that it is at most $product_i parallel f_i
  parallel_2$ and characterized equality #cite(label("cll2006")) Theorem 1.1.
  For nonzero nonnegative functions on four points, equality requires that every function be constant.
  We will use both the bound and this equality statement.

#thm([Theorem 1.1.])[
  (A robust four-row inequality).  #emph[There are absolute constants $p_0 in \( 4 \/ 3 \, 2 \)$ and $epsilon >
    0$ with the following property.Let $nu$ be a probability measure on $S_4$ such that
$ parallel nu - u parallel_("TV") < epsilon \, wide nu { pi : pi \( i \) = j } = 1 /
  4 quad \( 1 lt.eq i \, j lt.eq 4 \) . $

 Then every four nonnegative functions on ${ 1 \, 2 \, 3 \, 4 }$ satisfy
#[#set math.equation(numbering: n => "(1)")
 $ bb(E)_nu product_(i = 1)^4 f_i \( pi \( i \) \) lt.eq product_(i = 1)^4 parallel f_i parallel_(p_0) .
   $ <eq:permanent>]

]
] <thm:permanent>

Here total variation is one half the sum of the absolute differences of the probability masses.
  The marginal assumption in the theorem is exact. Indeed, setting three functions equal to one in (1),
  and varying the fourth around the constant one, forces its coordinate marginal to be uniform.
  Thus this hypothesis describes a structural feature of the inequality, as well as the cancellation used in its proof.

Permanents with row or column $ell^p$ constraints have a broader history.
  Carlen–Lieb–Loss discuss the below-two problem and Caputo’s conjecture,
  and Samorodnitsky obtained further bounds in that range #cite(label("cll2006"))
  #cite(label("Samorodnitsky2008")). Bristiel and Caputo subsequently proved the sharp permanent bound for every
  $p gt.eq 1$ #cite(label("BristielCaputo2024")) Corollary 1.14. In the present normalization, their result gives

$ bb(E)_u product_i f_i \( pi \( i \) \) lt.eq product_i parallel f_i parallel_p quad
  upright("for every ") p gt.eq p_c := frac(4 log 4, log 24) . $

The identity matrix shows that this uniform-law threshold is necessary.

The assertion needed here is stability under small perturbations of the permutation law that preserve every
  coordinate marginal. We prove this nonoptimal robust form directly from the exponent-two theorem:
  a strict quadratic gap treats functions near constants, while the equality classification and compactness treat
  all remaining functions. The local calculation explains the endpoint $4 \/ 3$ in Theorem 1;
  the final exponent is chosen closer to two and is not optimized.
  Thus a below-two bound for the uniform law is not itself the new ingredient in the recursion.

To state the application, let $rho_lambda$ be the irreducible unitary representation of $S_N$ indexed by a
  partition $lambda tack.r N$, and write $D_lambda$ for its dimension and $lambda'$ for the conjugate partition.
  If $mu_N$ is the law of one sweep, put

$ T_N \( lambda \) = sum_(g in S_N) mu_N \( g \) rho_lambda \( g \) \, wide B_N \( lambda \) =
  T_N \( lambda \) T_N \( lambda \)^(*) . $

Traces are ordinary, unnormalized matrix traces. Unmarked logarithms are natural.

#thm([Theorem 1.2.])[
  (A fixed moment with a degree saving).  #emph[There exist an even integer $r gt.eq 2$ and $eta > 0$,
    independent of $N$, such that for every dyadic $N$ and every $lambda tack.r N$,
#[#set math.equation(numbering: n => "(2)")
 $ D_lambda "Tr" B_N \( lambda \)^r lt.eq D_lambda^(1 - eta) . $ <eq:moment>]

 Consequently there is an absolute integer $q$ for which the total-variation distance of $q$ independent forward
   sweeps from uniform tends to zero as $N arrow.r oo$, uniformly over the starting deck.]
] <thm:moment>

A physical Thorp shuffle consists of independent fair switches on the pairs differing in one binary coordinate,
  followed by cyclic rotation of the coordinates. Tracking those deterministic rotations makes $d$ physical
  shuffles exactly one sweep. Theorem 2 therefore gives an $O \( d \)$ upper bound.
  The opposite order follows from the elementary support estimate

#[#set math.equation(numbering: n => "(3)")
 $ parallel mu_t - U_(S_N) parallel_("TV") gt.eq 1 - frac(2^(t N \/ 2), N !) \, $ <eq:support-intro>]

where $mu_t$ is the law after $t$ physical shuffles: there are only $2^(t N \/ 2)$ coin strings.
  In particular, distance at most $1 \/ 4$ requires $t gt.eq ceil.l \( 2 \/ N \) log_2 \( 3 N ! \/ 4 \) ceil.r =
  2 d - O \( 1 \)$.

The shuffle originates in Thorp’s study of nonrandom shuffling and Faro #cite(label("Thorp1973")).
  For $N = 2^d$, Morris obtained an $O \( d^44 \)$ upper bound #cite(label("Morris2008")),
  and Montenegro and Tetali improved it to $O \( d^29 \)$ #cite(label("MontenegroTetali2006")) Theorems 6.14–6.15.
  Morris subsequently proved $O \( \( log N \)^4 \)$ for every even deck size #cite(label("Morris2009")) and
  $O \( d^3 \)$ for dyadic decks #cite(label("Morris2013")).
  The present proof reaches logarithmic order through a four-row moment recursion.

The proof has three stages. Section 2 proves the robust inequality and tensors it over columns.
  In Section 3, a positive trace comparison reduces the sweep moment to four smaller moments,
  multiplied by powers of squared restriction multiplicities. The power is $theta = 1 - 1 \/ p_0 < 1 \/ 2$:
  this strict improvement over one half is the feature the dimension comparison needs.
  Section 4 bounds the multiplicities by removing the first few rows and columns of a Young diagram.
  Horizontal and vertical Pieri rules control the removed strips.
  For every fixed width $h$, the total number of boxes outside the first $h$ rows and columns of the four child
  diagrams is at most the corresponding number in the parent.
  We deduce this inequality from positive hook-Schur specialization,
  originating with Berele–Regev #cite(label("BereleRegev1987"));
  the formulas and tableau conventions used here are recorded in #cite(label("orellana-zabrocki2000"))
  #cite(label("mason-niese2016")).

Finally, Section 5 stops the recursion for diagrams close to a row or column.
  Section 6 sums the costs at every other scale, including the immediate children at which recursion has stopped,
  and compares the result with the hook-length formula. The strict inequality $theta < 1 \/
  2$ is exactly the margin that absorbs these costs. Section 7 converts the resulting moment to mixing.
  This last step follows the finite-group Fourier approach of Diaconis–Shahshahani
  #cite(label("DiaconisShahshahani1981")), with matrix norms retained because a sweep is generally nonnormal.

The argument uses ordinary complex representation theory of symmetric groups:
  branching, induction and restriction, the Littlewood–Richardson and Pieri rules,
  and the hook-length formula #cite(label("James1978")) #cite(label("Sagan2001")) #cite(label("Stanley1999")).
  We give the additional multiplicity and dimension estimates in full.
  The positive trace comparison is the Araki–Lieb–Thirring inequality #cite(label("araki1990")).
  No shuffle moment or mixing theorem from another source is an input here.

== 2 The strict permanent inequality <sec:permanent>

We first prove Theorem 1. The two parts of the proof address different possible failures of a uniform improvement:
  functions close to the equality cases, and functions bounded away from them.

#proof[
  A zero function makes the assertion immediate. By homogeneity,
    normalize each nonzero function to have $parallel f_i parallel_2 = 1$.
    The resulting space of quadruples is compact. The exponent-two Carlen–Lieb–Loss inequality is strict
    everywhere on this space except at the single quadruple $f_i equiv 1$. Its normalization follows directly from
  $ "perm" \( f_i \( j \) \) lt.eq frac(4 !, 4^2) product_i (sum_j f_i \( j \)^2)^(1 \/ 2) . $
  The equality classification for nonzero nonnegative columns gives exactly the stated exceptional quadruple
    #cite(label("cll2006")) Theorem 1.1 and equation (1.4).
  All scalar expectations and inner products on four points use uniform measure:
    $bb(E)_j h \( j \) = 1 / 4 sum_j h \( j \)$ and $chevron.l g \, h chevron.r = 1 /
    4 sum_j g \( j \) h \( j \)$. Fix $p_(*) in \( 4 \/ 3 \, 2 \)$.
    Near that quadruple, the means are positive, so renormalize by the means and write $f_i = 1 + g_i$,
    with $bb(E)_j g_i \( j \) = 0$. Let
  $ V = sum_i parallel g_i parallel_2^2 \, wide b = max_i parallel g_i parallel_oo . $
  For $i eq.not j$, uniform sampling without replacement gives
  $ bb(E)_u g_i \( pi \( i \) \) g_j \( pi \( j \) \) = - 1 / 3 chevron.l g_i \, g_j chevron.r . $
  Consequently the total quadratic term is
  #[#set math.equation(numbering: n => "(4)")
   $ sum_(i < j) bb(E)_u g_i \( pi \( i \) \) g_j \( pi \( j \) \) = 1 /
     6 (V - parallel sum_i g_i parallel_2^2) lt.eq V / 6 . $ <eq:quadratic>]
  For a law $nu$ at total-variation distance at most $epsilon$ from $u$,
    the change in each quadratic expectation is at most $2 epsilon parallel g_i parallel_oo parallel g_j
    parallel_oo$. On four points, $parallel g_i parallel_oo lt.eq 2 parallel g_i parallel_2$,
    so the total change is at most an absolute constant times $epsilon V$.
    All linear terms are zero under $nu$, because every coordinate marginal is uniform.
    Each cubic or quartic term is at most an absolute constant times $b V$ when $b lt.eq 1 \/ 2$.
    Indeed, bound all but two factors by $b$ and apply Cauchy–Schwarz to the remaining factors;
    their squared expectations use only the uniform marginals. Thus
  #[#set math.equation(numbering: n => "(5)")
   $ bb(E)_nu product_i \( 1 + g_i \( pi \( i \) \) \) lt.eq 1 + (1 / 6 + C epsilon + C b) V . $ <eq:lhs-local>]
  Taylor’s formula on $\[ 1 \/ 2 \, 3 \/ 2 \]$, uniformly for $p in \[ p_(*) \, 2 \]$, gives
  $ bb(E)_j \( 1 + g_i \( j \) \)^p = 1 + frac(p \( p - 1 \), 2) parallel g_i parallel_2^2 +
    O #scale(x: 120%, y: 120%)[\(] b parallel g_i parallel_2^2 #scale(x: 120%, y: 120%)[\)] . $
  Taking $p$th roots and multiplying the four factors gives
  #[#set math.equation(numbering: n => "(6)")
   $ product_i parallel 1 + g_i parallel_p = 1 + frac(p - 1, 2) V + O \( b V \) . $ <eq:rhs-local>]
  All constants are uniform on the fixed interval of exponents.
    Since $\( p_(*) - 1 \) \/ 2 > 1 \/ 6$, first choose $b_(*) > 0$ and $epsilon_(*) >
    0$ small enough that the error terms in (5) and (6) fit inside this strict gap.
    The desired inequality then holds for every $p in \[ p_(*) \, 2 \]$ whenever $b < b_(*)$ and $parallel nu -
    u parallel_("TV") lt.eq epsilon_(*)$, with exact uniform marginals.
  Return to the $L^2$-normalized compact space. The condition just obtained contains a fixed open neighborhood
    $cal(U)$ of its constant quadruple. On the compact complement of $cal(U)$,
    the exponent-two inequality has a positive minimum gap. Both sides are continuous in the functions;
    they are also continuous in the exponent and in the probability masses of $nu$.
    Choose $p_0 in \[ p_(*) \, 2 \)$ sufficiently close to two, then $0 < epsilon lt.eq
    epsilon_(*)$ sufficiently small, so that this gap remains positive on the complement.
    The local argument applies on $cal(U)$ with these same constants.
    These two regions cover all normalized quadruples, proving the theorem. ◻
]

The exact marginal assumption can also be read off without Taylor estimates of second order.
  If $a \( j \) = nu { pi \( i \) = j } - 1 \/ 4$ is nonzero, choose $g = a$ and set $f_i = 1 + t g$,
  with the other functions one. The derivative at $t = 0$ of the left side minus the right side of (1) is $sum_j
  a \( j \)^2 > 0$. Small positive $t$ contradicts the inequality.

#thm([Lemma 2.1.])[
  (Tensorization).  #emph[Let $pi_1 \, dots.h \, pi_b$ be independent random permutations,
    each with a law satisfying Theorem 1 for the same $p_0$. If $F_i$ is a nonnegative function on ${ 1 \, 2 \,
    3 \, 4 }^b$, then
$ bb(E) product_(i = 1)^4 F_i \( pi_1 \( i \) \, dots.h \, pi_b \( i \) \) lt.eq
  product_(i = 1)^4 (4^(- b) sum_(x in { 1 \, 2 \, 3 \, 4 }^b) F_i \( x \)^(p_0))^(1 \/ p_0) . $

]
] <lem:tensorization>

#proof[
  Induct on $b$. Fix the first $b - 1$ coordinates and apply Theorem 1 to the last coordinate.
    The four resulting functions on $b - 1$ coordinates are
  $ G_i \( x \) = (1 / 4 sum_(j = 1)^4 F_i \( x \, j \)^(p_0))^(1 \/ p_0) . $
  The induction hypothesis applies to their product, and its $p_0$th-power sums are precisely the full
    product-measure sums in the assertion. ◻
]

For later use, let $U$ be a positive semidefinite stochastic matrix of order $s$.
  Its entries are nonnegative and its eigenvalues lie in $\[ 0 \, 1 \]$.
  Hölder’s inequality, applied entry by entry with powers $2 - p_0$ and $p_0 - 1$, gives

#[#set math.equation(numbering: n => "(7)")
 $ sum_(x \, y) U \( x \, y \)^(p_0) lt.eq (sum_(x \, y) U \( x \, y \))^(2 - p_0)
   (sum_(x \, y) U \( x \, y \)^2)^(p_0 - 1) lt.eq s^(2 - p_0) \( "Tr" U \)^(p_0 - 1) . $ <eq:interpolation>]

The final inequality uses $"Tr" U^2 lt.eq "Tr" U$. Taking the $p_0$th root with the uniform counting normalization gives

$ (s^(- 2) sum_(x \, y) U \( x \, y \)^(p_0))^(1 \/ p_0) lt.eq s^(- 1) \( "Tr" U \)^(1 - 1 \/ p_0) . $

Section 3 applies this estimate to four color-string transition matrices.
  Each contributes a factor $s^(- 1)$ and a trace power $theta = 1 - 1 \/ p_0$.
  The strict inequality $theta < 1 \/ 2$ will remain fixed throughout the proof.

== 3 From columns to a four-row moment recursion <sec:recursion>

Our objective is to express a moment on $N$ cards in terms of moments on $N \/ 4$ cards.
  We first fix the operator conventions, then isolate the cost of the interaction between the four rows.

Positions are binary vectors. A permutation sends input positions to output positions,
  and $g h$ applies $h$ first. In each coordinate direction,
  the average of all optional edge swaps is an orthogonal projection $Pi_i$.
  With chronological order $1 \, dots.h \, d$,

$ T_N = Pi_d dots.h.c Pi_1 \, wide B_N = T_N T_N^(*) . $

To check physical time, let $R \( x_1 \, dots.h \, x_d \) = \( x_2 \, dots.h \, x_d \, x_1 \)$ and let $S_t$ be
  the switches in the first coordinate. A physical step is $R S_t$.
  If $Y_t$ is the accumulated permutation, then $X_t = R^(- t) Y_t$ satisfies

$ X_(t + 1) = \( R^(- t) S_(t + 1) R^t \) X_t . $

The conjugated directions visit all coordinates in a fixed cyclic order, and $R^d = I$.
  Relabeling that order as $1 \, dots.h \, d$ gives exactly $T_N$ after $d$ steps.

These are group-algebra elements as well as operators in any representation.
  The Fourier transform convention is $hat(mu) \( lambda \) = sum_g mu \( g \) rho_lambda \( g \)$;
  convolution multiplies these matrices in the same order. For a matrix $A$,
  the unnormalized Schatten norm is $parallel A parallel_p^p = "Tr" \| A \|^p$.

#thm([Lemma 3.1.])[
  (Annihilation and the finite-size gap).  #emph[Every sweep kills the sign representation and every shape with
    more than $N \/ 2$ rows. For fixed dyadic $N gt.eq 2$, its operator norm on each nontrivial irreducible
    representation is strictly less than one.]
] <lem:gap>

#proof[
  Each layer averages a subgroup $H tilde.equiv \( S_2 \)^(N \/ 2)$. The sign character averages to zero.
    Young’s rule says that an irreducible with $H$-fixed vectors must dominate the partition $\( 2^(N \/ 2) \)$,
    so it has at most $N \/ 2$ rows. For the norm assertion, equality in a product of orthogonal projections on a
    unit vector would force that vector to be fixed by every layer.
    It would then be fixed by every coordinate-edge transposition.
    Edge transpositions of a connected graph generate its full symmetric group,
    whereas a nontrivial irreducible has no invariant vector. ◻
]

Take $N = 4 m$, using the last two coordinates as the row index.
  The first $d - 2$ directions are independent sweeps within the four rows;
  the final two directions form a two-axis sweep independently in each of the $m$ columns.
  Let $M$ be the latter operator. Then

#[#set math.equation(numbering: n => "(8)")
 $ B_N = M A M^(*) \, wide A = B_m^(⊗ 4) . $ <eq:split>]

The row group is $H = \( S_m \)^4$. The column group is $\( S_4 \)^m$; its factors act on disjoint columns.
  Figure 1 records the two operations.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 0.05997, fill: black, stroke: none)
  circle((0.6, 0), radius: 0.05997, fill: black, stroke: none)
  circle((1.2, 0), radius: 0.05997, fill: black, stroke: none)
  circle((1.8, 0), radius: 0.05997, fill: black, stroke: none)
  circle((2.4, 0), radius: 0.05997, fill: black, stroke: none)
  circle((3, 0), radius: 0.05997, fill: black, stroke: none)
  circle((3.6, 0), radius: 0.05997, fill: black, stroke: none)
  circle((4.2, 0), radius: 0.05997, fill: black, stroke: none)
  circle((0, -0.55), radius: 0.05997, fill: black, stroke: none)
  circle((0.6, -0.55), radius: 0.05997, fill: black, stroke: none)
  circle((1.2, -0.55), radius: 0.05997, fill: black, stroke: none)
  circle((1.8, -0.55), radius: 0.05997, fill: black, stroke: none)
  circle((2.4, -0.55), radius: 0.05997, fill: black, stroke: none)
  circle((3, -0.55), radius: 0.05997, fill: black, stroke: none)
  circle((3.6, -0.55), radius: 0.05997, fill: black, stroke: none)
  circle((4.2, -0.55), radius: 0.05997, fill: black, stroke: none)
  circle((0, -1.1), radius: 0.05997, fill: black, stroke: none)
  circle((0.6, -1.1), radius: 0.05997, fill: black, stroke: none)
  circle((1.2, -1.1), radius: 0.05997, fill: black, stroke: none)
  circle((1.8, -1.1), radius: 0.05997, fill: black, stroke: none)
  circle((2.4, -1.1), radius: 0.05997, fill: black, stroke: none)
  circle((3, -1.1), radius: 0.05997, fill: black, stroke: none)
  circle((3.6, -1.1), radius: 0.05997, fill: black, stroke: none)
  circle((4.2, -1.1), radius: 0.05997, fill: black, stroke: none)
  circle((0, -1.65), radius: 0.05997, fill: black, stroke: none)
  circle((0.6, -1.65), radius: 0.05997, fill: black, stroke: none)
  circle((1.2, -1.65), radius: 0.05997, fill: black, stroke: none)
  circle((1.8, -1.65), radius: 0.05997, fill: black, stroke: none)
  circle((2.4, -1.65), radius: 0.05997, fill: black, stroke: none)
  circle((3, -1.65), radius: 0.05997, fill: black, stroke: none)
  circle((3.6, -1.65), radius: 0.05997, fill: black, stroke: none)
  circle((4.2, -1.65), radius: 0.05997, fill: black, stroke: none)
  line((-0.36, 0.088), (4.56, 0.088), stroke: (paint: rgb("#0000ff"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000ff"))))
  line((-0.36, -0.462), (4.56, -0.462), stroke: (paint: rgb("#0000ff"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000ff"))))
  line((-0.36, -1.012), (4.56, -1.012), stroke: (paint: rgb("#0000ff"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000ff"))))
  line((-0.36, -1.562), (4.56, -1.562), stroke: (paint: rgb("#0000ff"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#0000ff"))))
  line((0.09, 0.33), (0.09, -1.98), stroke: (paint: rgb("#ff0000"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#ff0000"))))
  line((0.69, 0.33), (0.69, -1.98), stroke: (paint: rgb("#ff0000"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#ff0000"))))
  line((1.29, 0.33), (1.29, -1.98), stroke: (paint: rgb("#ff0000"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#ff0000"))))
  line((1.89, 0.33), (1.89, -1.98), stroke: (paint: rgb("#ff0000"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#ff0000"))))
  line((2.49, 0.33), (2.49, -1.98), stroke: (paint: rgb("#ff0000"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#ff0000"))))
  line((3.09, 0.33), (3.09, -1.98), stroke: (paint: rgb("#ff0000"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#ff0000"))))
  line((3.69, 0.33), (3.69, -1.98), stroke: (paint: rgb("#ff0000"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#ff0000"))))
  line((4.29, 0.33), (4.29, -1.98), stroke: (paint: rgb("#ff0000"), thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: rgb("#ff0000"))))
  content((4.8, -0.55), [#text(fill: rgb("#0000ff"))[four sweeps on $m$ positions]], anchor: "west", padding: 0.1176cm)
  content((4.8, -1.1), [#text(fill: rgb("#ff0000"))[$m$ sweeps on four positions]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: The four rows are indexed by the last two processed bits. The horizontal sweeps occur first; the vertical two-axis sweeps occur last. The number of columns shown is schematic. ],
) <fig:fourrows>

===== 3.1 A positive trace for each row type. <a-positive-trace-for-each-row-type.>

Fix an even integer $r gt.eq 2$, and put

$ F_r \( lambda \) = D_lambda "Tr" B_(\| lambda \|) \( lambda \)^r . $

We suppress the subscript $r$ while deriving the recursion. Set $X = A^(r \/ 2)$ and $Y = \( M^(*) M \)^(r \/ 2)$.
  The Araki–Lieb–Thirring inequality for positive operators, with exponent $r \/ 2 gt.eq 1$ and outer power two, gives

#[#set math.equation(numbering: n => "(9)")
 $ F \( lambda \) lt.eq D_lambda "Tr" \( X Y X Y \)_lambda =
   D_lambda parallel Y^(1 \/ 2) X_lambda Y^(1 \/ 2) parallel_(upright("HS"))^2 . $ <eq:alt>]

Indeed $M A M^(*)$ and $A^(1 \/ 2) M^(*) M A^(1 \/ 2)$ have the same nonzero eigenvalues,
  after which the stated positive-matrix inequality applies #cite(label("araki1990"));
  see also the formulation in #cite(label("audenaert2007")) Theorem 1.

The row operator $X = A^(r \/ 2)$ is a positive element of the group algebra of $H$.
  Let $cal(I) \( lambda \)$ be the set of tuples $bold(alpha) = \( alpha_1 \, dots.h \, alpha_4 \)$,
  $alpha_i tack.r m$, occurring in $"Res"_H V_lambda$. For each tuple let $X_(bold(alpha))$ be $X$ multiplied by
  its central isotype projection in the group algebra of $H$.
  This projection commutes with $X$, so the summand is positive in every unitary representation.
  On $V_lambda$ it acts on all copies of that row type, not on a chosen copy.
  The Hilbert–Schmidt triangle inequality in (9) gives

#[#set math.equation(numbering: n => "(10)")
 $ F \( lambda \)^(1 \/ 2) lt.eq sum_(bold(alpha) in cal(I) \( lambda \)) #scale(x: 120%, y: 120%)[\(] D_lambda
   "Tr" \( X_(bold(alpha)) Y X_(bold(alpha)) Y \)_lambda #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) . $ <eq:triangle>]

We now estimate one term of this sum. In every irreducible representation,
  $"Tr" \( X_(bold(alpha)) Y X_(bold(alpha)) Y \)$ is the squared Hilbert–Schmidt norm of $Y^(1 \/ 2)
  X_(bold(alpha)) Y^(1 \/ 2)$ and is nonnegative. The regular representation of $S_N$ contains $D_lambda$ copies
  of $V_lambda$. Its trace therefore bounds the quantity inside the corresponding square root in (10).
  Working in this larger representation will allow us to express the bound as a probability.

===== 3.2 From coefficients to an overlap probability. <from-coefficients-to-an-overlap-probability.>

Fix the tuple $bold(alpha)$. Write $X_(bold(alpha)) = sum_(p in H) xi \( p \) p$, where $xi \( p \) =
  product_i xi_i \( p_i \)$. Each row factor has Fourier block $B_m \( alpha_i \)^(r \/ 2)$ on $alpha_i$ and zero
  blocks elsewhere. Plancherel on $S_m$ gives

$ m ! sum_(p_i) \| xi_i \( p_i \) \|^2 = D_(alpha_i) "Tr" B_m \( alpha_i \)^r = F \( alpha_i \) . $

If one of these quantities is zero, the tuple contributes nothing.
  Otherwise the squared coefficients define probability laws $u_i \( p_i \) = \| xi_i \( p_i \) \|^2 \/ sum \|
  xi_i \|^2$ on the four row groups. Write $u = ⨂_i u_i$ for their independent product.

Because $r \/ 2$ is an integer, $Y = \( M^(*) M \)^(r \/ 2)$ is convolution by a probability law $omega$ on the
  column group. Expanding the regular trace gives

$ N ! sum_(p \, q in H) sum_(b \, c) xi \( p \) xi \( q \) omega \( b \) omega \( c \)
  upright(bold(1))_({ p b q c = e }) . $

Bound each coefficient product by $\| xi \( p \) xi \( q \) \|
  lt.eq \( \| xi \( p \) \|^2 + \| xi \( q \) \|^2 \) \/ 2$. The two square terms have equal sums:
  cyclically interchange $\( p \, b \)$ and $\( q \, c \)$ in the identity $p b q c = e$.
  For fixed $p \, b \, c$, there is at most one possible $q$,
  and it lies in $H$ exactly when $b^(- 1) p^(- 1) c^(- 1) in H$.
  Self-adjointness gives $xi \( p^(- 1) \) = overline(xi \( p \))$, so $u$ is invariant under inversion;
  the real probability coefficients of the self-adjoint $Y$ have the same symmetry.
  We may thus invert each of the three independent variables. Using the preceding Plancherel normalizations yields

#[#set math.equation(numbering: n => "(11)")
 $ "Tr"_(upright("reg")) \( X_(bold(alpha)) Y X_(bold(alpha)) Y \) lt.eq
   product_i F \( alpha_i \) thin frac(N !, \( m ! \)^4) bb(P) { b p c in H } \, $ <eq:coefficient-trace>]

where $p tilde.op u$, and $b \, c$ are independent column permutations of law $omega$.
  The remaining problem is to bound this overlap probability uniformly in the squared-coefficient laws $u_i$.

===== 3.3 Two independent colorings. <two-independent-colorings.>

Let $a \( z \)$ be the row index of position $z$, and define

$ eta \( z \) = a \( c^(- 1) z \) \, wide zeta \( z \) = a \( b z \) . $

The condition $b p c in H$ is equivalent to $zeta \( p z \) = eta \( z \)$ for every position $z$:
  substitute $z = c w$ in $a \( b p c w \) = a \( w \)$. In each column,
  either coloring uses the four colors once. Different columns are independent,
  and the two colorings are independent because $b$ and $c$ are.

For row $i$, define a transition matrix on all $4^m$ color strings by

$ U_i \( x \, y \) = bb(P)_(p_i tilde.op u_i) { y \( p_i z \) =
  x \( z \) upright(" for every position ") z upright(" in row ") i } . $

Thus $U_i$ averages the permutation action of the row group on strings.
  Conditional on the two colorings, the four row permutations are independent.
  With $eta_i \, zeta_i$ denoting their restrictions to row $i$,

$ bb(P) { b p c in H } = bb(E) product_i U_i \( eta_i \, zeta_i \) . $

The matrices $U_i$ are stochastic and symmetric, since each $u_i$ is invariant under inversion.
  The particular origin of $u_i$ gives the additional positivity needed in (7).
  Fourier inversion writes $xi_i \( g \) = \( D_(alpha_i) \/ m ! \)
  "Tr" \( Q rho_(alpha_i) \( g^(- 1) \) \)$ with $Q = B_m \( alpha_i \)^(r \/ 2) gt.eq 0$.
  Hence $xi_i$, and then $\| xi_i \|^2$, are positive-definite functions.
  Their Fourier transforms are positive semidefinite, so the average of $u_i$ in the color-string representation
  is positive semidefinite as well.

The four-site law of $M$ sends every site exactly uniformly to the four sites.
  Its adjoint does too, and the same remains true of every positive power of $M^(*) M$.
  Moreover the support of $M^(*) M$ contains the identity and the edge transpositions of the square,
  which generate $S_4$. Its convolution powers therefore converge to uniform.
  Choose the even integer $r$ sufficiently large that the law of each column of $Y$ satisfies Theorem 1.
  Every larger even $r$ does too, once a tail threshold for convergence has been chosen.

===== 3.4 Closing the recursion. <closing-the-recursion.>

The variables defining $\( eta_i \, zeta_i \)$ consist of $2 m$ independent four-color column assignments.
  Apply Lemma 3 to these assignments with the four nonnegative functions $U_i$, and then (7) with $s = 4^m$. This gives

$ bb(P) { b p c in H } lt.eq product_i (s^(- 2) sum_(x \, y) U_i \( x \, y \)^(p_0))^(1 \/ p_0) lt.eq
  s^(- 4) product_i \( "Tr" U_i \)^theta \, quad theta = 1 - 1 \/ p_0 < 1 / 2 . $

Since $N ! \/ \( m ! \)^4 lt.eq 4^N = s^4$, the exponential factors cancel exactly.
  The only remaining inflation is a power of the four color-string traces.
  Write $c_(bold(beta))^alpha$ for the multiplicity of $⨂_(i = 1)^4
  V_(beta_i)$ in the restriction of $V_alpha$ to $product_(i = 1)^4 S_(\| beta_i \|)$. Section 4 proves

#[#set math.equation(numbering: n => "(12)")
 $ "Tr" U_i lt.eq C \( alpha_i \) \, wide C \( alpha \) = sum_(bold(beta)) \( c_(bold(beta))^alpha \)^2 .
   $ <eq:trace-C>]

The sum includes every weak four-part composition of $m$ and every irreducible tuple for its Young subgroup.
  Combining this trace bound with (11) and (10) gives

#[#set math.equation(numbering: n => "(13)")
 $ F \( lambda \)^(1 \/ 2) lt.eq sum_(bold(alpha) in cal(I) \( lambda \)) product_(i = 1)^4
   (F \( alpha_i \) C \( alpha_i \)^theta)^(1 \/ 2) . $ <eq:recursion>]

All restriction multiplicities have been retained; they are accounted for by the regular trace and by
  $C \( alpha \)$, rather than discarded during a choice of one copy.

== 4 Squared multiplicities and hook deficits <sec:multiplicities>

We write $chi_alpha$ for the character of $V_alpha$ and $chevron.l f \,
  g chevron.r_(S_m) = \( m ! \)^(- 1) sum_(x in S_m) f \( x \)
  overline(g \( x \))$ for the normalized character inner product.
  The cost $C \( alpha \)$ in (13) measures how many copies can occur when colors divide a row into four parts.
  We first justify this interpretation, then bound the cost by boxes outside a thin hook.

#thm([Lemma 4.1.])[
  (Color-string trace).  #emph[Let $alpha tack.r m$, let $Q gt.eq 0$ be a nonzero operator on $V_alpha$,
    and define the probability
$ u \( g \) = frac(D_alpha, m ! "Tr" Q^2) \| "Tr" \( Q rho_alpha \( g \) \) \|^2 quad \( g in S_m \) . $

 Let $U$ be its average action on strings of length $m$ over four colors. Then
$ "Tr" U lt.eq chevron.l chi_alpha^2 \, 4^(\# upright("cycles")) chevron.r_(S_m) =
  sum_(bold(beta)) \( c_(bold(beta))^alpha \)^2 = C \( alpha \) . $

]
] <lem:color-trace>

#proof[
  Schur orthogonality normalizes $u$ to have mass one. Write $V_alpha ⊗ overline(V_alpha) =
    xor.big_nu V_nu ⊗ bb(C)^(a_nu)$, and let $P_nu$ be its isotypic projection. Character orthogonality gives
  $ sum_g u \( g \) chi_nu \( g \) = frac(D_alpha "Tr" \( \( Q ⊗ macron(Q) \) P_nu \), D_nu "Tr" Q^2) . $
  The two commuting positive operators $Q ⊗ I$ and $I ⊗ macron(Q)$ satisfy
  $ Q ⊗ macron(Q) lt.eq 1 / 2 \( Q^2 ⊗ I + I ⊗ macron(Q)^2 \) . $
  The partial trace of $P_nu$ over either factor commutes with the irreducible action on the other.
    Its trace is $a_nu D_nu$, so it equals $\( a_nu D_nu \/ D_alpha \) I$.
    The preceding character average is therefore at most $a_nu$.
  A permutation fixes exactly $4^(\# upright("cycles") \( g \))$ color strings.
    This is a permutation character, so its expansion in irreducible characters has nonnegative integer
    coefficients. Apply the preceding inequality to that expansion.
    It yields the first asserted bound, since $a_nu$ is the multiplicity of $nu$ in $chi_alpha^2$.
  Finally the color-string representation is the direct sum, over all color-class sizes $m_1 + dots.h.c + m_4 =
    m$, of $"Ind"_(S_(m_1) times dots.h.c times S_(m_4))^(S_m) upright(bold(1))$.
    Frobenius reciprocity identifies its inner product with $chi_alpha^2$ as the sum of the dimensions of the
    commuting algebras of the corresponding restrictions of $V_alpha$.
    Those dimensions are the sums of squared multiplicities displayed in the statement. ◻
]

For a partition $alpha tack.r m$, put

$ k \( alpha \) = m - max \( alpha_1 \, alpha'_1 \) \, wide t_h \( alpha \) = \| { \( i \, j \) in alpha :
  i > h \, med j > h } \| quad \( h gt.eq 1 \) . $

The latter is the number of boxes outside the union of the first $h$ rows and first $h$ columns.

#thm([Lemma 4.2.])[
  (The cost of restriction).  #emph[There is an absolute $C$ such that,
    for every $alpha tack.r m$ and integer $h gt.eq 1$,
#[#set math.equation(numbering: n => "(14)")
 $ log C \( alpha \) lt.eq t_h \( alpha \) log 4 + C \( 1 + h \) \( 1 + sqrt(k \( alpha \)) \) log \( 2 m \) .
   $ <eq:restriction-cost>]

]
] <lem:restriction-cost>

#proof[
  The central estimate for a residual shape $delta tack.r t$ is
  #[#set math.equation(numbering: n => "(15)")
   $ \( c_(gamma_1 \, dots.h \, gamma_4)^delta \)^2 lt.eq binom(t, \| gamma_1 \| \, dots.h \, \| gamma_4 \|) lt.eq
     4^t . $ <eq:squared-lr>]
  To prove it, let the multiplicity on the left before squaring be $c$.
    Restriction and induction dimensions give, respectively,
  $ c product_i D_(gamma_i) lt.eq D_delta \, wide c D_delta lt.eq
    binom(t, \| gamma_1 \| \, dots.h \, \| gamma_4 \|) product_i D_(gamma_i) . $
  Multiplying and cancelling the positive dimensions proves (15).
    It is essential here to combine one restriction estimate and one induction estimate.
  Both $C \( alpha \)$ and $t_h \( alpha \)$ are invariant under conjugation,
    so orient $alpha$ with its first row of length $m - k$, where $k = k \( alpha \)$.
    Remove its first $h$ rows and then the first $h$ columns of the remainder.
    The residual straight diagram $delta$ has size $t = t_h \( alpha \)$.
    Deleting a first row leaves an interlacing partition, so reversing that deletion adds a horizontal strip.
    Deleting a first column gives the vertical analogue.
  More explicitly, let $ell lt.eq 2 h$ be the number of nonempty removed lines, let their lengths be $a_1 \,
    dots.h \, a_ell$, and let $xi_j$ be the trivial character of $S_(a_j)$ for a removed row and the sign
    character for a removed column. Then
  $ W = "Ind"_(S_t times S_(a_1) times dots.h.c times S_(a_ell))^(S_m) \( V_delta ⊗ xi_1 ⊗ dots.h.c ⊗ xi_ell \) $
  contains $V_alpha$ by the Pieri rules. Thus each multiplicity in a restriction of $V_alpha$ is bounded by the
    corresponding multiplicity in $W$. We will use this comparison only for tuples $bold(beta)$ that occur in the
    original restriction of $V_alpha$. For those tuples, the first-row inequality in the Littlewood–Richardson
    rule says $alpha_1 lt.eq sum_i beta_(i \, 1)$, and hence
  #[#set math.equation(numbering: n => "(16)")
   $ sum_i \( \| beta_i \| - beta_(i \, 1) \) lt.eq k . $ <eq:tail-budget>]
  Every intermediate diagram in a Pieri chain ending at such a $beta_i$ is contained in it,
    and has at most $k$ boxes below its first row. The number of partitions of any size at most $m$ satisfying
    that condition is at most
  $ Q_m \( k \) = \( m + 1 \)^(1 + 2 ceil.l sqrt(k) ceil.r) . $
  One way to see this is to choose the first-row length, and encode the tail by its row lengths and column lengths
    along a Durfee square of side at most $sqrt(k)$. Padding the two lists to length $ceil.l sqrt(k)
    ceil.r$ gives the displayed upper bound. For $k = 0$, only the first-row length is needed.
  Fix such a final tuple $bold(beta)$, and put $H_(bold(beta)) = product_(i = 1)^4 S_(\| beta_i \|)$.
    Mackey’s formula for $"Res"_(H_(bold(beta))) W$ indexes the decomposition by allocations of the residual
    factor and the $ell$ strip factors among these classes. There are at most $\( m + 1 \)^(4 \( ell + 1 \))$
    allocation matrices. For each allocation, restrict $V_delta$ to the four allocated subsets,
    then add the allocated horizontal or vertical strips within each color class by Pieri.
    A chain ending at $beta_i$ consists of diagrams contained in $beta_i$,
    so every one obeys the small-tail bound just counted. Choosing the residual tuple and all subsequent diagrams
    costs at most $Q_m \( k \)^(4 \( ell + 1 \))$. Each Pieri transition is multiplicity free,
    and (15) bounds the residual multiplicity by $4^(t \/ 2)$. Therefore
  $ c_(bold(beta))^alpha lt.eq "mult"_(bold(beta)) \( "Res"_(H_(bold(beta))) W \)
    lt.eq \( m + 1 \)^(4 \( ell + 1 \)) Q_m \( k \)^(4 \( ell + 1 \)) 4^(t \/ 2) . $
  There are at most $Q_m \( k \)^4$ possible final occurring tuples.
    Squaring this bound and summing over them gives $4^t$ times $exp { C \( 1 + h \) \( 1 + sqrt(k) \)
    log \( 2 m \) }$, proving (14). No tail estimate for the other constituents of $W$ is required. ◻
]

The next fact lets us add hook costs along an entire level of the recursion.

#thm([Lemma 4.3.])[
  (Hook deficits under restriction).  #emph[If $c_(alpha_1 \, dots.h \, alpha_4)^lambda > 0$,
    then for every integer $h gt.eq 1$,
#[#set math.equation(numbering: n => "(17)")
 $ sum_i t_h \( alpha_i \) lt.eq t_h \( lambda \) \, wide sum_i k \( alpha_i \) lt.eq
   k \( lambda \) . $ <eq:hook-deficit>]

]
] <lem:hook-deficit>

#proof[
  For the assertion about $k$, orient the parent with its longest side as first row.
    The first-row inequality gives a bound by its row deficit on the sum of the child row deficits;
    each child’s $k$ is no larger than its row deficit. If the parent’s longest side is a column,
    transpose every partition, which preserves Littlewood–Richardson multiplicities.
  Write $s_nu$ for the ordinary Schur function, and $s_nu \( X divides Y \)$ for its hook-Schur specialization
    #cite(label("orellana-zabrocki2000")) Definition 1(a). For the assertion about $t_h$,
    take $h$ ordinary variables $X$, $h$ transpose variables $Y$, and an unlimited ordinary alphabet $Z$.
    Variables in $X \, Y$ have degree zero and those in $Z$ have degree one.
    The positive hook-Schur tableau rule uses ordinary entries weakly along rows and strictly down columns,
    and transpose entries strictly along rows and weakly down columns #cite(label("mason-niese2016")) Section 2.
    For $s_nu \( X divides Y \)$, order all $X$ letters before all $Y$ letters,
    so the ordinary entries occupy a subdiagram. The rule gives $s_nu \( X divides Y \) eq.not
    0$ exactly when $nu_(h + 1) lt.eq h$. For completeness, a tableau over $h$ ordinary and $h$ transpose letters
    cannot fill an $\( h + 1 \)$-by-$\( h + 1 \)$ square: the ordinary subdiagram has at most $h$ rows,
    and the transpose-filled remainder has at most $h$ columns in each remaining row.
    Conversely, fill the first $h$ rows with their ordinary row letters and the remaining boxes with their
    transpose column letters. This realizes every diagram in that hook.
  Writing $p_j$ for the $j$th power sum, the supersymmetric substitution is
  $ p_j mapsto p_j \( X \) + \( - 1 \)^(j - 1) p_j \( Y \) . $
  Applied to the ordinary Schur coproduct, it gives
  $ s_lambda \( X + Z divides Y \) = sum_(nu subset.eq lambda) s_nu \( X divides Y \) s_(lambda \/ nu) \( Z \) . $
  Its coefficients are nonnegative. The largest subdiagram of $lambda$ in the $\( h \, h \)$ hook is the union of
    its first $h$ rows and first $h$ columns. The smallest degree in $Z$ is therefore exactly $t_h \( lambda \)$;
    the corresponding skew Schur function is nonzero on an unlimited alphabet.
  Apply this substitution to $product_i s_(alpha_i) = sum_lambda c_(bold(alpha))^lambda s_lambda$.
    The product on the left has minimum $Z$-degree $sum_i t_h \( alpha_i \)$.
    Every summand on the right has nonnegative coefficients, so an occurring parent’s minimum degree cannot be
    smaller. This is (17). ◻
]

Equations (13) and (14) now give a recursive estimate in which the leading charge is $theta log
  4$ times a hook deficit. The other charges involve only $\( 1 + h \) \( 1 + sqrt(k) \) log \( 2 m \)$.
  We next prove where this recursion can stop, before summing those charges.

== 5 Sparse stopping by encounter forests <sec:sparse>

The four-row recursion will stop when a diagram is close to one row or column.
  We prove the needed bound directly from the paths of a small collection of cards.
  Branching expresses the trace for $s$ tracked cards as a binomial sum over first-row deficits.
  Inverting that sum cancels contributions supported on fewer than all the tracked cards.
  To preserve this cancellation, we couple all subsets of the tracked cards in one sweep.

Throughout this section, $n = 2^d$, $T = T_n$, $B = T T^(*)$, and $B_lambda = B_n \( lambda \)$.
  Empty diagrams have dimension one.

#thm([Lemma 5.1.])[
  (Sparse stopping).  #emph[There is an absolute $N_0$ such that, if $n = 2^d gt.eq N_0$ and $1 lt.eq k lt.eq
    n^(1 \/ 100)$, then
$ sum_(mu tack.r k) D_mu thin "Tr" B_(\( n - k \, mu \)) lt.eq n^(- 3 k \/ 10) . $

 Consequently, for $n gt.eq N_0$, if $k \( lambda \) = n - max { lambda_1 \, lambda'_1 } lt.eq n^(1 \/ 100)$,
   then for every integer $r gt.eq 4$,
$ D_lambda "Tr" B_lambda^r lt.eq 1 . $

 There is a fixed even $r_0 gt.eq 4$ for which the latter assertion holds for every power of two $n gt.eq
   2$ and every such $lambda$.]
] <lem:sparse>

#proof[
  #emph[Isolating the first-row deficit.] Let $cal(I)_s$ be the set of ordered injections from $\[ s \]$ into the
    $n$ positions, with $cal(I)_0$ a singleton. The sweep induces a transition matrix $T_s$ on this set. Write
  $ a_s = "Tr"_(bb(C)^(cal(I)_s)) \( T T^(*) \) = sum_(x \, y in cal(I)_s) T_s \( x \, y \)^2 . $
  This is the ordinary, unnormalized trace on the indicated permutation module.
  The permutation module on $cal(I)_s$ is $"Ind"_(S_(n - s))^(S_n) upright(bold(1))$.
    By repeated branching, the multiplicity of $V_lambda$ in it is the number of standard tableaux of skew shape
    $lambda \/ \( n - s \)$. Assume $s lt.eq k$ and $n gt.eq 2 k$.
    Every occurring partition has the form $lambda = \( n - j \, mu \)$ with $0 lt.eq j lt.eq
    s$ and $mu tack.r j$. The skew shape consists of the tail $mu$ and a row of $s -
    j$ cells whose columns exceed $n - s gt.eq k gt.eq mu_1$. These components share neither a row nor a column.
    Choosing the $j$ entries of the tail and then a standard tableau on it gives multiplicity $binom(s, j) D_mu$. Hence
  $ a_s = sum_(j = 0)^s binom(s, j) b_j \, wide b_j = sum_(mu tack.r j) D_mu thin "Tr" B_(\( n - j \, mu \)) . $
  Binomial inversion gives
  #[#set math.equation(numbering: n => "(18)")
   $ b_k = sum_(s = 0)^k \( - 1 \)^(k - s) binom(k, s) a_s gt.eq 0 \, $ <eq:sparse-inverse>]
  where positivity follows from the positive semidefiniteness of each $B_lambda$.
    It remains to bound this inverse without losing its cancellation.
  For fixed initial and final positions of one card, there is exactly one possible path through the successive
    coordinate layers: at layer $i$, its first $i$ processed coordinates have their final values and its remaining
    coordinates still have their initial values. Thus fixed endpoints for $s$ cards prescribe all their paths.
    If two tracked cards use the same switch, the two prescribed coin requirements either disagree,
    making the endpoints impossible, or agree, saving one coin.
    If $e$ is the number of switches shared by two tracked cards along a realized sweep,
    the transition probability to its realized endpoint is therefore $2^(- d s + e) = n^(- s) 2^e$.
    Averaging first over the realized endpoint and then over a uniform initial injection gives the exact identity
  #[#set math.equation(numbering: n => "(19)")
   $ a_s = frac(\( n \)_s, n^s) thin bb(E) thin 2^e \, wide \( n \)_s =
     n \( n - 1 \) dots.h.c \( n - s + 1 \) . $ <eq:sparse-trace>]
  Choose $k$ distinct uniform initial positions $X_1 \, dots.h \, X_k$,
    independently of the coins of one complete sweep. For this realized sweep,
    form a graph $G$ on all $n$ initial positions, joining two positions if their cards share a switch.
    Each vertex has degree $d$. The graph is simple: after two cards meet at coordinate $i$,
    their positions differ at that coordinate forever, so they cannot meet at a later coordinate.
    Let $G_X$ be the graph induced on the selected tags, and let $e \( S \)$ count its edges with both endpoints
    in $S subset.eq \[ k \]$. The marginal initial positions of every such subset are a uniform injection. Thus, with
  $ w \( S \) = frac(\( n \)_(\| S \|), n^(\| S \|)) = product_(i in S) (1 - frac(\# { j in S : j < i }, n)) \, $
  Equations (19) and (18) imply
  #[#set math.equation(numbering: n => "(20)")
   $ b_k = bb(E) sum_(S subset.eq \[ k \]) \( - 1 \)^(k - \| S \|) w \( S \) 2^(e \( S \)) . $ <eq:sparse-coupled>]
  A predecessor selection is a collection $D$ of directed pairs $\( i \, j \)$ with $1 lt.eq j < i lt.eq k$,
    at most one pair having any given first coordinate. Write $\| D \|$ for its number of pairs and $"supp"
    D$ for their endpoints. Expanding the product defining $w \( S \)$ gives
  $ w \( S \) = sum_(D : "supp" D subset.eq S) \( - n^(- 1) \)^(\| D \|) . $
  Also $2^(e \( S \)) = sum_(H subset.eq E \( G_X \[ S \] \)) 1$.
    If $"supp" H$ denotes the vertices incident to the edges of $H$,
    then summing over $S$ in (20) yields the exact cancellation identity
  #[#set math.equation(numbering: n => "(21)")
   $ b_k = bb(E) sum_(H subset.eq E \( G_X \)) med
     sum_(D : "supp" H union "supp" D = \[ k \]) \( - n^(- 1) \)^(\| D \|) . $ <eq:sparse-cover>]
  Indeed, a term supported on $U$ has coefficient $sum_(S supset.eq U) \( - 1 \)^(k - \| S \|)$,
    which is zero unless $U = \[ k \]$. Thus only an encounter-edge set and a predecessor selection that together
    cover every tag survive the inversion. We may now bound their absolute sum without losing that covering constraint.
  #emph[Counting the covering configurations.] Two elementary facts about $G$ control the possible encounter
    subgraphs. First, every set of $v$ vertices spans at most
  #[#set math.equation(numbering: n => "(22)")
   $ v / 2 log_2 v $ <eq:sparse-edge-count>]
  edges, with $0 log_2 0 = 0$. To prove this by induction on $d$,
    split the initial positions according to the last processed coordinate.
    Before the last layer, these two halves remain separate. If the chosen set has $v_0 \, v_1$ positions in them,
    induction bounds the earlier encounters by $1 / 2 v_0 log_2 v_0 + 1 / 2 v_1 log_2 v_1$,
    and the last matching adds at most $min \( v_0 \, v_1 \)$ edges.
    This is at most $1 / 2 v log_2 v$ because the binary entropy $H_2 \( p \) = -
    p log_2 p - \( 1 - p \) log_2 \( 1 - p \)$, with $0 log_2 0 = 0$, satisfies $H_2 \( p \) gt.eq
    2 min \( p \, 1 - p \)$ by concavity on each half of $\[ 0 \, 1 \]$.
  Second, if $F$ is a specified forest on $v$ selected tags with $c$ components, then, conditional on the entire sweep,
  #[#set math.equation(numbering: n => "(23)")
   $ Pr \( F subset.eq G_X divides G \) lt.eq frac(n^c d^(v - c), \( n \)_v) lt.eq
     2 (d / n)^(v - c) . $ <eq:sparse-forest-probability>]
  Choose one root position per component and then successively place each child at one of at most $d$ neighbors of
    its parent. This gives the first inequality even if some counted placements fail to be injective.
    For $v lt.eq k lt.eq n^(1 \/ 100)$ and sufficiently large $n$,
  $ frac(\( n \)_v, n^v) = product_(i = 0)^(v - 1) \( 1 - i \/ n \) gt.eq 1 - frac(v \( v - 1 \), 2 n) gt.eq 1 / 2 \, $
  which gives the second inequality.
  Let an encounter-edge set $H$ use $v$ vertices and have $c$ nontrivial connected components.
    Then $2 c lt.eq v$, and $H$ contains a spanning forest with $v - c$ edges.
    For fixed $v \, c$, there are at most $\( 2 k \)^(2 v)$ choices for its vertex set and forest:
    choose the vertex set, root every component at its least vertex,
    and record a parent or a root marker for every vertex. For any realization and any such forest,
    the number of possible edge sets extending it is at most
  $ 2^(e \( G_X \[ V \] \)) lt.eq v^(v \/ 2) lt.eq k^(v \/ 2) \, $
  by (22). A canonical choice of spanning forest for each $H$, or simply overcounting all spanning forests,
    therefore bounds the expected number of these $H$ by
  $ 2 \( 2 k \)^(2 v) k^(v \/ 2) \( d \/ n \)^(v - c) . $
  For $v = c = 0$, the empty edge set contributes one, which also obeys this upper bound.
  There are at most $binom(k, q) k^q lt.eq \( 2 k \)^(2 q)$ predecessor selections with $q$ pairs.
    The covering condition in (21) implies $v + 2 q gt.eq k$.
    Since $d \/ n lt.eq 1$, $v - c gt.eq v \/ 2$, and there are at most $\( k + 1 \)^3$ triples
    $\( v \, c \, q \)$, the preceding estimates show that
  #[#set math.equation(numbering: n => "(24)")
   $ b_k lt.eq 2 sum_(0 lt.eq v \, c \, q lt.eq k\
2 c lt.eq v \, med v + 2 q gt.eq k) (4 k^(5 \/ 2) sqrt(d \/ n))^v (4 k^2 \/ n)^q . $ <eq:sparse-sum>]
  Impossible triples only enlarge this upper bound. Uniformly for $1 lt.eq k lt.eq n^(1 \/ 100)$,
    sufficiently large $n$ satisfies
  $ 4 k^(5 \/ 2) sqrt(d \/ n) lt.eq n^(- 2 \/ 5) \, wide 2 k \/ sqrt(n) lt.eq n^(- 2 \/ 5) \, wide
    2 \( k + 1 \)^3 lt.eq n^(k \/ 10) . $
  For example, the first left side is at most $4 sqrt(log_2 n) thin n^(- 19 \/ 40)$,
    and the last left side is at most $16 n^(3 \/ 100)$. Every term in (24) is therefore at most
    $n^(- 2 \( v + 2 q \) \/ 5) lt.eq n^(- 2 k \/ 5)$, proving $0 lt.eq b_k lt.eq n^(- 3 k \/ 10)$.
  #emph[From the trace bound to stopping.] If $lambda_1 = n - k$ with $1 lt.eq k lt.eq n^(1 \/ 100)$,
    its term in $b_k$ has coefficient $D_mu gt.eq 1$, so $"Tr" B_lambda lt.eq n^(- 3 k \/ 10)$.
    The eigenvalues are nonnegative, and consequently
  $ "Tr" B_lambda^r lt.eq \( "Tr" B_lambda \)^r . $
  Choosing the labels of the $k$ cells below the first row and then their order gives $D_lambda lt.eq
    binom(n, k) k ! lt.eq n^k$. Hence
  $ D_lambda "Tr" B_lambda^r lt.eq n^(\( 1 - 3 r \/ 10 \) k) lt.eq 1 wide \( r gt.eq 4 \) . $
  If instead $lambda'_1 = n - k > n \/ 2$, every matching projection vanishes on $V_lambda$.
    Indeed, its fixed-space dimension is the multiplicity of $V_lambda$ in $"Ind"_(S_2^(n \/ 2))^(S_n)
    upright(bold(1))$. Repeated horizontal Pieri shows that every constituent is obtained by adding $n \/
    2$ horizontal strips of size two. Each strip adds at most one cell to the first column,
    so every constituent has first-column height at most $n \/ 2$.
    Thus $B_lambda = 0$ in the case under consideration. For $k = 0$,
    the trivial representation has the claimed value one and the sign representation is annihilated by a matching
    projection.
  Finally, Lemma 4 gives operator norm strictly less than one on every nontrivial irreducible at each fixed $n$.
    There are only finitely many powers of two below $N_0$ and finitely many irreducibles at each of them.
    Increasing $r$ to one fixed even $r_0 gt.eq 4$ therefore gives the stated stopping estimate also at these
    remaining sizes. Larger powers preserve the estimate because $B$ is a positive semidefinite contraction. ◻
]

== 6 Summing the costs and comparing dimensions <sec:tree>

We now assemble the recursion. The purpose of the sparse estimate is to prevent costs from accumulating
  indefinitely on diagrams with a long row or column. The remaining costs can be summed before we compare them
  with the dimension of the root.

Write $log^(+) x = max { 0 \, log x }$. Fix a root $lambda tack.r N$, with $K = k \( lambda \) > 0$.
  A node with diagram $alpha tack.r m$ is expanded only if $m$ exceeds a fixed cutoff $M$ and $k \( alpha \) >
  m^.01$. Otherwise it is stopped. Choose the even moment $r$ large enough for Lemma 8 and, by Lemma 4,
  large enough that $F \( alpha \) lt.eq 1$ for every stopped diagram of size at most $M$.
  These choices are possible simultaneously. The numerical cutoff will be fixed below before $r$ is finally chosen.

Squaring (13) and bounding a sum by its number of terms times its largest term gives

#[#set math.equation(numbering: n => "(25)")
 $ log F \( alpha \) lt.eq 2 log \| cal(I) \( alpha \) \| +
   max_(bold(beta) in cal(I) \( alpha \)) sum_(i = 1)^4 { log F \( beta_i \) +
   theta log C \( beta_i \) } . $ <eq:log-recursion>]

We use $log 0 = - oo$. If $F \( alpha \) = 0$, no bound is needed.
  Iterating this inequality amounts to taking the maximum over finite four-ary trees of occurring restrictions.
  Each expanded node contributes its choice cost $2 log \| cal(I) \( alpha \) \|$,
  and each of its four immediate children contributes $theta log C \( beta_i \)$.
  The latter charge remains present even if the child is stopped.

The tail count in the proof of Lemma 6 gives

$ log \| cal(I) \( alpha \) \| lt.eq C \( 1 + sqrt(k \( alpha \)) \) log \( 2 m \) . $

To apply it, orient the parent along its longest side, use the first-row inequality,
  and count each child’s tail with at most the parent’s deficit. Child sizes are prescribed.
  Thus this choice cost fits within the lower-order term of (14).
  We may charge it at the parent, including the root, without altering the estimates below.

For $H > 2$, put

$ R_H \( lambda \) = sum_(\( i \, j \) in lambda) log^(+) frac(min \( i \, j \), H) . $

This quantity will count, box by box, the levels at which a root box can lie outside the chosen hook.
  The budget below adds an entropy term $1 / 2 K log \( N \/ K \)$.
  Lemma 10 will compare $R_H \( lambda \) + K log \( N \/ K \)$ with $log D_lambda$, with explicit errors.
  We therefore seek a coefficient below one in front of the budget, leaving room to absorb its lower-order costs.

#thm([Lemma 6.1.])[
  (Uniform tree budget).  #emph[Fix $delta in \( 0 \, 1 \/ 2 \)$ and put $a = 1 \/ 2 - delta$.
    For every $H > 2$ and $epsilon.alt > 0$, a sufficiently large fixed cutoff $M$ makes every such recursion tree
    satisfy
#[#set math.equation(numbering: n => "(26)")
 $ log F \( lambda \) lt.eq epsilon.alt K + theta / a {R_H \( lambda \) + K / 2 log N / K} . $ <eq:tree-budget>]

 The cutoff and all constants in this statement are independent of the final even moment $r$.]
] <lem:tree-budget>

#proof[
  At a level with node size $m$, let $q_m$ be the number of charged nodes and let their deficits be $k_1 \,
    dots.h \, k_(q_m)$. By Lemma 7, their sum is at most $K$.
    Expanded nodes satisfy $k_i > m^.01$, so their number is at most $K \/ m^.01$.
    A charged child of size $m$ has an expanded parent of size $4 m$, and there are four children per parent.
    Consequently, after changing one absolute constant,
  #[#set math.equation(numbering: n => "(27)")
   $ q_m lt.eq C K m^(- .01) \, wide q_m lt.eq N \/ m \, wide sum_i k_i lt.eq K . $ <eq:charged-count>]
  The root also satisfies these bounds when expanded. A stopped root already has $F lt.eq
    1$ and satisfies the conclusion directly.
  At that level choose
  $ h_m = ⌈m^a sqrt(K \/ N)⌉ . $
  The lower-order terms in the choice and restriction costs are bounded by
  $ C sum_i \( 1 + h_m \) \( 1 + sqrt(k_i) \) log \( 2 m \) . $
  Cauchy–Schwarz gives $sum_i sqrt(k_i) lt.eq sqrt(q_m K)$.
    The terms arising from the ceiling and the constant one are therefore at most $C K m^(- .005) log \( 2 m \)$.
    For the terms involving $m^a$, use both bounds in (27):
  $ m^a sqrt(K \/ N) sqrt(q_m K) lt.eq K m^(- delta) \, $
  $ m^a sqrt(K \/ N) thin q_m lt.eq C K m^(- delta - .005) . $
  For the second inequality, $q_m lt.eq sqrt(\( N \/ m \) \( C K \/ m^.01 \))$.
    These costs are summable geometric tails because level sizes differ by a factor four.
    All charged nodes have size greater than $M \/ 4$, including the stopped children of the last expanded level.
    Choosing $M$ large makes their total at most $epsilon.alt K$.
  It remains to sum the leading hook terms. At every level,
    iteration of Lemma 7 bounds the sum of $t_(h_m)$ over charged nodes by $t_(h_m) \( lambda \)$.
    Follow one root box $\( i \, j \)$ and write $s = min \( i \, j \)$. It can contribute only if
  $ s > h_m gt.eq m^a sqrt(K \/ N) . $
  The eligible sizes $m$ form part of a geometric progression of ratio four, all larger than $M \/ 4$.
    By increasing $M$ so that $\( M \/ 4 \)^a gt.eq 4^a H$, their number is at most
  $ frac(log^(+) \( s \/ H \) + 1 / 2 log \( N \/ K \), a log 4) . $
  Indeed the number is bounded by the positive part of one plus the logarithm of the ratio of the upper endpoint
    $\( s sqrt(N \/ K) \)^(1 \/ a)$ to the lower endpoint $M \/ 4$, divided by $log 4$;
    the choice of $M$ absorbs the extra one. Replacing $log \( s \/ H \)$ by its positive part can only enlarge
    the bound.
  Boxes in the longest first row or column never contribute, since $h_m gt.eq 1$.
    There are exactly $K$ remaining boxes. Multiply their level counts by $theta log
    4$ and add the lower-order costs. This proves (26). ◻
]

We have reduced the operator recursion to a purely diagrammatic comparison.
  The next lemma compares $R_H \( lambda \)$ with the hook-length formula,
  retaining the first-row entropy needed when $K$ is small relative to $N$.

#thm([Lemma 6.2.])[
  (Hook comparison).  #emph[Orient $lambda tack.r N$ so its first row is a longest side, put $K = N -
    lambda_1 > 0$, and let $zeta = \( lambda_2 \, lambda_3 \, dots.h \) tack.r K$. For $H > 2$,
#[#set math.equation(numbering: n => "(28)")
 $ log D_lambda & gt.eq K log \( N \/ K \) + log D_zeta - E_(N \, K) \,\
R_H \( lambda \) & lt.eq log D_zeta + 4 K \/ H \, $ <eq:row-hook>]

 where $E_(N \, K) = O \( K \/ N \)$ for $K < N \/ 3$ and $E_(N \, K) =
   O \( sqrt(N) log \( 2 N \) \)$ for $K gt.eq N \/ 3$. There is also an absolute $c > 0$ such that $log D_lambda
   gt.eq c K$ for all sufficiently large $N$ and every nontrivial, nonsign $lambda$.]
] <lem:hook-comparison>

#proof[
  The hook-length formula separates the first row exactly:
  $ D_lambda = binom(N, K) D_zeta product_(j = 1)^(lambda_1) (1 + frac(lambda'_j - 1, lambda_1 - j + 1))^(- 1) . $
  If $K < N \/ 3$, a nonzero numerator occurs only for $j lt.eq K$,
    so the logarithm of the inverted product is at most $K \/ \( N - 2 K + 1 \)$.
    For $K gt.eq N \/ 3$, split the columns at height $sqrt(N)$.
    There are at most $sqrt(N)$ columns taller than this; each contributes at most $log \( 1 + N \)$.
    In the remaining columns, bound $log \( 1 + x \)$ by $x$ and sum the denominators harmonically.
    Their contribution is at most $sqrt(N) \( 1 + log N \)$. Since $binom(N, K) gt.eq \( N \/ K \)^K$, this proves (28).
  Every box contributing to $R_H$ lies in $zeta$. At root coordinates $\( i \, j \)$,
    its hook in $zeta$ has length at most
  $ frac(K, i - 1) + K / j lt.eq frac(4 K, min \( i \, j \)) . $
  Take a reverse linear extension of the Young diagram order on $zeta$, numbering its boxes from $1$ to $K$.
    The number assigned to each box is at least its hook length,
    because all boxes to its right and below precede it. The product of all number-to-hook ratios is exactly
    $D_zeta$, and every ratio is at least one.
  Suppose $t$ boxes contribute to $R_H$. Their distinct assigned numbers have product at least $t !$.
    Keeping only their ratios in the hook product gives, for $t > 0$,
  $ log D_zeta gt.eq R_H - t log frac(4 e K, t H) gt.eq R_H - frac(4 K, H) . $
  The last inequality follows by maximizing $t log \( 4 e K \/ \( t H \) \)$ over $t > 0$.
    For $t = 0$, the assertion is immediate.
  Finally we prove $log D_lambda gt.eq c K$ without losing uniformity in the shape.
    If $K < N \/ 3$, (28) already gives this for large $N$. Put $L = lambda_1 = max \( lambda_1 \, lambda'_1 \)$.
    If $K gt.eq N \/ 3$ and $L gt.eq N \/ 8$, retain the first row and an order ideal of $b =
    floor.l N \/ 32 floor.r$ boxes in the lower diagram. Place $1 \, dots.h \,
    b$ in the first $b$ boxes of the top row, choose any $b$ of the remaining $L$ labels for the lower diagram,
    fill those lower boxes in a fixed standard order, and fill the rest of the top row increasingly.
    This gives $binom(L, b) gt.eq 4^b$ standard tableaux of the retained diagram.
    Every such tableau extends to $lambda$. If $L < N \/ 8$, every hook is shorter than $N \/ 4$,
    so $D_lambda gt.eq N ! \/ \( N \/ 4 \)^N gt.eq \( 4 \/ e \)^N$. These cases give one absolute positive $c$. ◻
]

#proof[
  Fix the constants in their logical order. Theorem 1 first gives $p_0$ and $theta < 1 \/ 2$.
    Choose $delta > 0$ so small that
  $ b := frac(theta, 1 \/ 2 - delta) < 1 . $
  The universal degree constant $c$ in Lemma 10 is independent of this choice.
    Choose $H$ sufficiently large and $epsilon.alt$ sufficiently small that $epsilon.alt +
    4 b \/ H < \( 1 - b \) c \/ 4$. Then choose the cutoff $M$ required by Lemma 9,
    increasing it further so that the errors $E_(N \, K)$ in Lemma 10 are less than $\( 1 - b \) c
    K \/ \( 4 b \)$ whenever $N > M$. This is possible uniformly:
    the first error divided by $K$ is $O \( 1 \/ N \)$, and the second is $O \( log N \/ sqrt(N) \)$ in its stated
    range.
  Only now choose the even moment $r$. It must make the four-site column law admissible for Theorem 1,
    enforce the sparse stopping rule, and make $F_r lt.eq 1$ for all nontrivial shapes of all dyadic sizes at most
    $M$. These are finitely many or fixed-threshold requirements, by Lemmas 4 and 8; all persist on increasing $r$.
  For an expanded root, (26), (28) and (28) give
  $ log F_r \( lambda \) lt.eq b log D_lambda + epsilon.alt K + 4 b K \/ H + b E_(N \, K) lt.eq
    frac(1 + b, 2) log D_lambda . $
  Here we discarded the additional negative term $- b K log \( N \/ K \) \/ 2$.
    Thus $eta = \( 1 - b \) \/ 2 > 0$ works at every expanded root.
    At a stopped root $F_r lt.eq 1 lt.eq D_lambda^(1 - eta)$.
    The row representation has $F_r = 1$, while the column representation is killed by Lemma 4.
    This proves the moment assertion for every dyadic $N$. ◻
]

== 7 Independent forward sweeps <sec:amplification>

The estimate just proved concerns the positive operator $B_N = T_N T_N^(*)$.
  Actual repeated shuffles use powers of $T_N$. We make that distinction explicit in the final argument.

First, the degree estimates above imply, for any fixed $A > 0$,

#[#set math.equation(numbering: n => "(29)")
 $ sum_(lambda eq.not \( N \) \, \( 1^N \)) D_lambda^(- A) arrow.r 0 . $ <eq:degree-sum>]

Here are the elementary summability details. There are at most $2 p \( k \)$ partitions with $k \( lambda \) = k$,
  because deleting the longer first row or column leaves a partition of $k$.
  The partition generating function gives $p \( k \) lt.eq e^(3 sqrt(k))$:
  evaluate it at $x = e^(- 1 \/ sqrt(k))$, and bound its logarithm by

$ sum_(j gt.eq 1) frac(1, j \( e^(j \/ sqrt(k)) - 1 \)) lt.eq sqrt(k) sum_(j gt.eq 1) j^(- 2) lt.eq 2 sqrt(k) . $

Lemma 10 bounds $D_lambda^(- A)$ by $e^(- A c k)$ for all sufficiently large $N$.
  The resulting bound $2 e^(3 sqrt(k) - A c k)$ is summable in $k$.
  For each fixed $k gt.eq 1$, the first-row hook identity gives $D_lambda arrow.r oo$ as $N arrow.r oo$,
  uniformly over those finitely many tails. Dominated convergence proves (29).
  This elementary argument suffices here; more precise fixed-exponent degree sums are known
  #cite(label("liebeck-shalev2004")).

From (2),

$ parallel B_N \( lambda \) parallel_("op")^r lt.eq "Tr" B_N \( lambda \)^r lt.eq D_lambda^(- eta) . $

Thus, for any integer $q gt.eq r$, Schatten Hölder and the operator norm bound give

$ parallel T_N \( lambda \)^q parallel_(upright("HS"))^2 lt.eq
  parallel T_N \( lambda \) parallel_("op")^(2 \( q - r \)) parallel T_N \( lambda \) parallel_(2 r)^(2 r) =
  parallel B_N \( lambda \) parallel_("op")^(q - r) "Tr" B_N \( lambda \)^r . $

Multiplying by $D_lambda$ and using the moment theorem yields

#[#set math.equation(numbering: n => "(30)")
 $ D_lambda parallel T_N \( lambda \)^q parallel_(upright("HS"))^2 lt.eq
   D_lambda^(1 - eta q \/ r) . $ <eq:forward-power>]

Choose once and for all an integer $q > r \/ eta$. Equation (29) shows that the sum of (30) over all nonsign,
  nontrivial representations tends to zero. The sign block is zero.

For clarity, finite-group Plancherel and Cauchy–Schwarz state that any probability $sigma$ on $S_N$ satisfies

$ 4 parallel sigma - U_(S_N) parallel_("TV")^2 lt.eq N ! sum_g \| sigma \( g \) - 1 \/ N ! \|^2 =
  sum_(lambda eq.not \( N \)) D_lambda parallel hat(sigma) \( lambda \) parallel_(upright("HS"))^2 . $

Apply this to $sigma = mu_N^(* q)$, whose Fourier matrix is $T_N \( lambda \)^q$.
  This proves convergence to uniform after $q$ forward sweeps.
  Translating the law by any deterministic starting deck preserves total variation,
  so the result is uniform over starting states. A sweep is $d$ physical shuffles,
  giving the asserted $O \( d \)$ bound. The support estimate (3) supplies the matching lower order.

No step identifies $\( T_N T_N^(*) \)^q$ with $T_N^q \( T_N^(*) \)^q$.
  The positive moment supplies singular-value information; Hölder is the separate passage to forward evolution.

#bibliography("refs.bib", style: "ieee", title: [References])
