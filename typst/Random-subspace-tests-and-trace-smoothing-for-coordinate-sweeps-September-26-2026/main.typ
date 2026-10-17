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

#align(center)[#text(size: 16pt, weight: "bold")[Random-subspace tests and trace smoothing for coordinate sweeps]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <introduction>

A coordinate sweep sends each individual card to a uniform position, while correlations among cards remain. We study a stronger aggregate question: how small is the sum of fixed powers of all the nonconstant singular values of the full permutation operator? The answer gives a quantitative bound for repeated forward sweeps, including their multiplicities in the regular representation.

Thorp introduced the shuffle in #cite(label("Thorp1973")). For $n = 2^d$ positions, Morris obtained an $O \( d^44 \)$ mixing bound using evolving sets and a chameleon process #cite(label("Morris2008")). Montenegro and Tetali sharpened this to $O \( d^29 \)$ through spectral-profile and evolving-set estimates #cite(label("MontenegroTetali2006")) Section 6.4. Morris then developed an entropy method based on card interactions, obtaining $O \( log^4 n \)$ for every even deck size #cite(label("Morris2009")) and $O \( d^3 \)$ for dyadic decks #cite(label("Morris2013")). These bounds count physical shuffles.

The proof here combines partial-deck smoothing with representation multiplicities and an estimate for the overlap of row and column symmetries. Splitting the binary coordinates into two consecutive groups makes one part of a sweep act independently within rows of a rectangular board and the other within columns. The two symmetry decompositions do not commute. Our geometric step estimates their overlap by testing tensor vectors against random subspaces of small dimension, and the resulting induction controls a fixed singular-value moment in the full regular representation.

=== 1.1 The regular-trace statement <the-regular-trace-statement>

Index positions by $bb(F)_2^d$. One physical shuffle sends

$ \( x_1 \, x_2 \, dots.h \, x_d \) mapsto \( x_2 \, dots.h \, x_d \, x_1 + xi_(x_2 \, dots.h \, x_d) \) \, $

with independent fair bits $xi$. Removing the deterministic rotations gives a sweep through the coordinate matchings. The rotation returns to the identity after $d$ steps. Write $Q_n$ for the law of this sweep and for its average in a representation. A permutation maps inputs to outputs; a product applies its rightmost factor first. Different sweeps use independent coins.

Every matching average is an orthogonal projection, so $Q_n$ is a contraction. For $\| Y \| = \( Y^(*) Y \)^(1 \/ 2)$, all traces and Schatten norms are unnormalized. The regular trace on the symmetric group is

$ "Tr"_(upright("reg")) \| Q_n \|^P = sum_(lambda tack.r n) D_lambda "Tr"_(V_lambda) \| Q_n \( lambda \) \|^P \, $

where $V_lambda$ is the irreducible representation of dimension $D_lambda$. The constant representation contributes exactly one.

#thm([Theorem 1.1.])[
  (Regular-trace smoothing).  #emph[There is an absolute $P gt.eq 2$ such that for every dyadic $n gt.eq 2$, 
#[#set math.equation(numbering: n => "(1)")
 $ "Tr"_(upright("reg")) \| Q_n \|^P lt.eq 1 + n^(- 10) . $ <ten:lowplanes:eq:1>]

 If $v$ is an integer with $2 v gt.eq P$, then $v$ independent sweeps have total-variation distance at most $1 / 2 n^(- 5)$ from uniform, from every deterministic initial deck. Here $parallel mu - nu parallel_(upright("TV")) = 1 / 2 sum_g \| mu \( g \) - nu \( g \) \|$.]
] <ten:lowplanes:main>

Since one sweep consists of $d$ physical shuffles, the theorem gives an $O \( d \)$ mixing bound for $n = 2^d$ cards. This order is optimal: the support count in Proposition 7 shows that total-variation distance $1 \/ 4$ requires at least $2 d - O \( 1 \)$ physical shuffles.

The regular trace contains all irreducible multiplicities, not just one copy of each Fourier block. The conclusion concerns powers of the forward sweep. Its proof uses Schatten Hölder and does not identify $\( Q_n^(*) Q_n \)^v$ with $\( Q_n^v \)^(*) Q_n^v$.

=== 1.2 Three ranges of representations <three-ranges-of-representations>

The proof separates three ranges, as shown in Figure 1, because the geometric test has a useful, explicit domain. If $X = log D_lambda$, Proposition 4 proves the overlap estimate in a window

$ n e^(- A_0 sqrt(log n)) lt.eq X lt.eq A_1 n $

for fixed positive $A_0 \, A_1$. In a balanced $a$ by $b$ board, take row and column Fourier projections selecting real unit carrier vectors, including every multiplicity copy. If their carrier dimensions are $D_R \, D_F$, we prove

$ D_lambda "Tr" \( E_R E_F \) lt.eq D_R D_F exp #h(-0.16667em) (frac(X, \( log n \)^(1 \/ 3))) . $

The test chooses independent, unitarily invariant #emph[complex] $r$-planes in the even and odd tensor alphabets, where $r = floor.l n^(1 \/ 100) floor.r$. The real assumption concerns the selected carrier vectors, and later permits real spectral decompositions of the sweep factors.

Two analytic estimates prepare the other ranges. Corollary 6.2 of the companion #emph[Routing densities and representation contraction for Thorp sweeps] #cite(label("OpenAI2026Routing")) shows that a forward sweep followed by a reverse sweep, in either orientation, has a fixed power whose density on every ordered $l$-card injection is at most $e^(C l)$. This handles very large dimensions. For diagrams with a very long first row, we break the sweep into coarse coordinate lines and deform each local operator by its polar decomposition. The two orientations of smoothing control the two ends of the singular-value decomposition. Exact uniformity for one card is preserved under this deformation. Contact counts and representation multiplicities then make the sparse regular-trace contribution at most $n^(- 12)$ (Proposition 3).

The remaining representations lie in the window of the geometric estimate. Orthogonal row and column tags turn the projection overlap into the norm of an invariant tensor. The random-plane tests retain a controlled fraction of the relevant representation. On passing both tests, nearly all slots lie in a small even subspace. Compression to the distinct cell tags then produces an exponential saving. The argument bounds arbitrary tagged vectors; it does not require them to factor across slots.

The Araki–Lieb–Thirring inequality #cite(label("araki1990")) #cite(label("audenaert2007")) combines the row and column estimates. An exponent increase by $1 + 2 \( log n \)^(- 1 \/ 4)$ absorbs the geometric error. These increases have bounded product along the halving of bit lengths. The finite-size strict gap provides the base cases.

We use classical branching, Pieri, hook-length and ordinary Schur–Weyl theory #cite(label("Sagan2001")) #cite(label("Stanley1999")) #cite(label("VershikOkounkov2005")). The hook support of the even/odd alphabet is the classical Berele–Regev construction #cite(label("BereleRegev1987")), restated in #cite(label("Regev2013")) Theorem 2.1. We derive the needed even/odd realization by applying ordinary Schur–Weyl separately to the two species and inducing, with a sign twist on the odd factors; the proof also tracks the exceptional letters needed outside the hook. The random-plane averaging is an application of unitary invariance and highest-weight dimension estimates. The compact coherent-orbit resolution used in the final compression is the one described by Perelomov #cite(label("Perelomov1972")) Section 2; the tag construction and its quantitative trace estimate are proved here.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 4.035cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[large $log D_ lambda$#linebreak()partial-deck smoothing]]])])
  content((4.635, 0), [#box(width: 4.035cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[long first row#linebreak()local polar deformation]]])])
  content((9.27, 0), [#box(width: 4.035cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[remaining window#linebreak()random-plane overlap]]])])
  content((4.635, -2), [#box(width: 5.735cm, inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[fixed regular trace#linebreak()$1+n^(-10)$]]])])
  line((0, -0.65), (1.768, -2), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((4.635, -0.65), (4.635, -1.35), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((9.27, -0.65), (7.503, -2), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
})],
  caption: [Figure 1: The three estimates in the proof of Theorem 1. After the annihilated types are removed, the cases are tested successively. The last class lies in the dimension window required by the random-plane estimate. ],
) <fig:three-ranges>

== 2 Coarse smoothing <ten:lowplanes:part:21>

The analytic input is the following two-orientation estimate for every partial deck. The same absolute constants apply on every coarse coordinate line used below.

#thm([Proposition 2.1.])[
  (Partial-deck smoothing).  #emph[Let $n = 2^d$, $d gt.eq 0$, and let $Q_n$ be a sweep in any fixed order of the distinct coordinates. For either $B_n = Q_n^(*) Q_n$ or $B_n = Q_n Q_n^(*)$, there are an absolute integer $u gt.eq 1$ and $C < oo$ such that 
#[#set math.equation(numbering: n => "(2)")
 $ B_n^u \( x \, y \) lt.eq frac(e^(C l), \( n \)_l) \, #h(2em) 0 lt.eq l lt.eq n \, $ <ten:lowplanes:eq:2>]

 for every pair of ordered injections $x \, y$ of $l$ distinct cards. Here $\( n \)_l = n ! \/ \( n - l \) !$, including $\( n \)_0 = 1$. In particular, 
#[#set math.equation(numbering: n => "(3)")
 $ "Tr"_(upright("reg")) \| Q_n \|^(2 u) lt.eq e^(C n) . $ <ten:lowplanes:eq:9>]

]
] <prop:coarse-smoothing>

#proof[
  This is Corollary 6.2 of #cite(label("OpenAI2026Routing"), form: "prose"), with its $T_N = Q_n$ and $N = n$. That result proves both products, every coordinate order, and the complete range $0 lt.eq l lt.eq n$ with the same constants. Its proof uses the all-injection density bound of Theorem 6.1, obtained by encoding cycle closures and summing their costs over network scales. For the regular trace, take $l = n$: the injection module is the regular representation, and its $n !$ diagonal entries are each at most $e^(C n) \/ n !$. Since $\( Q_n^(*) Q_n \)^u = \| Q_n \|^(2 u)$, their sum gives the second assertion. ◻
]

== 3 Rows close to the full size <ten:lowplanes:part:127>

Representations with a very long first row occur many times in the permutation module on a relatively small partial deck. We first bound a fixed Schatten moment on that module, then use the multiplicity to bound the contribution of these representations to the regular trace.

#thm([Proposition 3.1.])[
  (Sparse-row contribution).  #emph[There are absolute constants $M \, P_s$ such that, for all sufficiently large dyadic $n$, 
#[#set math.equation(numbering: n => "(4)")
 $ sum_(lambda tack.r n\
1 lt.eq n - lambda_1 lt.eq n e^(- M sqrt(log n))) D_lambda "Tr"_(V_lambda) \| Q_n \( lambda \) \|^(P_s) lt.eq n^(- 12) . $ <eq:sparse-contribution>]

]
] <prop:sparse-rows>

=== 3.1 A deformation on partial decks <a-deformation-on-partial-decks>

Fix $p_0 gt.eq 4 u$ with $p_0 > 2$, where $u$ is from Proposition 2. Work on ordered placements of $q$ distinguished cards. Partition the $d$ coordinate updates into consecutive pieces of length about $sqrt(d)$. There are $g = O \( sqrt(log n) \)$ pieces, and the corresponding coarse coordinates have sizes $b_i lt.eq exp \( C sqrt(log n) \)$. Updating coarse coordinate $i$ means performing a local cube sweep $Q_(b_i)$ on every line parallel to it, independently across lines.

A single line operator $Y$ preserves the identities of the cards in that line and the positions of all other cards. On a block with $l$ cards in the line, it is the $l$-card placement operator for $Q_(b_i)$. Once line memberships are fixed, parallel lines are tensor factors. These observations allow us to deform the local operators without losing the placement structure.

Write $Y = W \| Y \|$ and set

$ Y \( z \) = W \| Y \|^(p_0 z \/ 2) \, #h(2em) 0 lt.eq Re z lt.eq 1 \, $

with the value zero on the nullspace. Let $cal(Q) \( z \)$ be the product of these operators in sweep order. At $z = 2 \/ p_0$ we recover the original placement sweep. On $Re z = 0$, every factor, and hence the product, has operator norm at most one. On $Re z = 1$, singular-value Cauchy–Schwarz gives, within an $l$-card line block,

#[#set math.equation(numbering: n => "(5)")
 $ \| Y \( z \)_(y x) \| lt.eq (\( \| Y \|^(p_0 \/ 2) \)_(x x) \( \| Y^(*) \|^(p_0 \/ 2) \)_(y y))^(1 \/ 2) lt.eq frac(e^(C l), \( b_i \)_l) . $ <ten:lowplanes:eq:11>]

The last inequality uses both orientations of Proposition 2: because $p_0 \/ 2 gt.eq 2 u$ and $Y$ is a contraction, the displayed positive powers are bounded by the corresponding $2 u$ powers. For $l = 0 \, 1$ the exponential factor is unnecessary. A single card becomes exactly uniform after all bits in a line have been updated; its line operator is therefore the uniform projection, which the deformation leaves unchanged.

=== 3.2 Contact counts for the deformed kernel <ten:lowplanes:part:150>

Compare the deformed product with the kernel $K \( x \, y \)$ obtained by using an independent uniform permutation on each coarse line. The endpoints $x \, y$ determine all intermediate placements: each card takes its final value in a coarse coordinate exactly when that coordinate is updated. If an intermediate placement has a collision, both kernels vanish. Otherwise the uniform-line transition probability is the product of $1 \/ \( b_i \)_l$ over the lines, with $l$ the number of distinguished cards using that line.

Let $U \( x \, y \)$ be the sum of $l upright(bold(1))_({ l gt.eq 2 })$ over these lines, and set it to zero for invalid paths. Thus $U$ counts card visits to lines shared with another distinguished card. The local estimate and the exact one-card bound imply, on $Re z = 1$,

$ \| cal(Q) \( z \)_(y x) \| lt.eq K \( x \, y \) e^(C U \( x \, y \)) \, #h(2em) K \( x \, y \) lt.eq n^(- q) e^(C U \( x \, y \)) . $

For the second inequality, compare each denominator with $b_i^l$ and use $b_i^l \/ \( b_i \)_l lt.eq l^l \/ l ! lt.eq e^l$, with ratio one when $l lt.eq 1$. Squaring the first bound and using the second for one factor of $K$ yields

$ parallel cal(Q) \( z \) parallel_(upright("HS"))^2 lt.eq frac(\( n \)_q, n^q) thin bb(E) e^(C' U) . $

Here the expectation uses a uniform input placement and the independent uniform line permutations defining $K$.

To bound this expectation, condition on all line permutations and follow the paths of all $n$ inputs. Join two input paths if they use the same line in some piece. The resulting graph has maximum degree at most

$ sum_i \( b_i - 1 \) lt.eq e^(C'' sqrt(log n)) . $

The distinguished paths are a uniform $q$-subset of its vertices. If $R_(*)$ counts selected vertices having a selected neighbor, then $U lt.eq g R_(*)$.

For a degree bound $Delta gt.eq 1$, there are at most $n Delta^(2 \( w - 1 \))$ connected vertex sets of size $w$: encode one by a rooted spanning-tree traversal of length $2 \( w - 1 \)$. Any fixed union of $v lt.eq q$ vertices is entirely selected with probability

$ frac(\( q \)_v, \( n \)_v) lt.eq \( q \/ n \)^v . $

For $v > q$, that probability is zero. The actual nontrivial components of the selected graph form a disjoint family of connected sets of sizes at least two. Consequently $e^(C' g R_(*))$ is bounded by the sum, over all such contained families, of the products of their weights $e^(C' g w)$. Apply the preceding containment bound, then drop disjointness and bound the family sum by the exponential of the sum over single sets. For a sufficiently large absolute $C_2$, if

$ \( q \/ n \) e^(C_2 sqrt(log n)) lt.eq 1 / 2 \, $

this gives

$ bb(E) e^(C' g R_(*)) lt.eq exp #h(-0.16667em) (n sum_(w gt.eq 2) #scale(x: 120%, y: 120%)[\(] \( q \/ n \) e^(C_2 sqrt(log n)) #scale(x: 120%, y: 120%)[\)]^w) lt.eq exp #h(-0.16667em) (\( q^2 \/ n \) e^(C_3 sqrt(log n))) . $

This argument uses sampling without replacement; it does not require independent contact events.

Interpolate the operator-norm bound on $Re z = 0$ with this Hilbert–Schmidt bound on $Re z = 1$. At $z = 2 \/ p_0$ the Schatten exponent is $p_0$, so

#[#set math.equation(numbering: n => "(6)")
 $ "Tr"_(q upright(" placements")) \| Q_n \|^(p_0) lt.eq exp #h(-0.16667em) (\( q^2 \/ n \) e^(C_3 sqrt(log n))) . $ <ten:lowplanes:eq:12>]

For completeness, the three-lines argument pairs $cal(Q) \( z \)$ against a dual Schatten unit matrix of exponent $p'_0 = p_0 \/ \( p_0 - 1 \)$. Keep its singular vectors fixed and raise its singular values to $p'_0 \( 1 - z \/ 2 \)$, leaving zeros zero. The pairing matrix has trace norm one at the first boundary and Hilbert–Schmidt norm one at the second, and returns to the original dual matrix at $z = 2 \/ p_0$. Raising the interpolated norm bound to $p_0$ gives (6).

=== 3.3 From placements to regular multiplicities <from-placements-to-regular-multiplicities>

#proof[
  Write
  #[#set math.equation(numbering: n => "(7)")
   $ 1 lt.eq k = n - lambda_1 lt.eq n e^(- M sqrt(log n)) \, #h(2em) q = ⌊k \( n \/ k \)^(1 \/ 5)⌋ . $ <ten:lowplanes:eq:10>]
  For $M$ sufficiently large, the hypothesis of (6) holds and its right side is at most $e^k$: indeed, $q^2 \/ n lt.eq k \( k \/ n \)^(3 \/ 5)$. Also $q \/ k arrow.r oo$ and $q \/ n arrow.r 0$ uniformly in this range.
  Put $beta = \( lambda_2 \, lambda_3 \, dots.h \)$, a partition of $k$. The stabilizer of an ordered $q$-card placement is $S_(n - q)$, so branching identifies the multiplicity $m_lambda$ with the number of standard tableaux of $lambda \/ \( n - q \)$. For large $n$, the remaining first-row segment is separated from $beta$, since $n - q gt.eq beta_1$. Hence
  $ m_lambda = binom(q, k) D_beta . $
  The hook formula, with $beta'$ denoting the transpose, gives
  #[#set math.equation(numbering: n => "(8)")
   $ D_lambda = binom(n, k) D_beta product_(i = 1)^(beta_1) (1 + frac(beta'_i, n - k - i + 1))^(- 1) . $ <ten:lowplanes:eq:13>]
  Since $sum_i beta'_i = k$ and $k = o \( n \)$, the product loses at most $k \/ \( n - 2 k + 1 \)$ in its logarithm. In particular,
  $ log D_lambda gt.eq 1 / 2 k log \( n \/ k \) $
  for all sufficiently large $n$ in the range under consideration.
  The multiplicity is a substantial power of the dimension. More explicitly,
  $ log m_lambda gt.eq 1 / 5 k log \( n \/ k \) - O \( k \) + log D_beta \, #h(2em) log D_lambda lt.eq k log \( n \/ k \) + k + log D_beta . $
  Because $log \( n \/ k \) arrow.r oo$ uniformly, these inequalities imply $m_lambda gt.eq D_lambda^(1 \/ 10)$. The placement trace includes $m_lambda$ copies of the $lambda$ block. Combining this fact with (6), and absorbing $e^k$ by the dimension lower bound, yields
  $ "Tr"_(V_lambda) \| Q_n \( lambda \) \|^(p_0) lt.eq e^k D_lambda^(- 1 \/ 10) lt.eq D_lambda^(- 1 \/ 20) . $
  For any fixed large $A$, choose a fixed $P_s$ with $P_s \/ p_0 gt.eq 20 \( A + 1 \)$. The inequality $sum_j a_j^t lt.eq \( sum_j a_j \)^t$ for $a_j gt.eq 0$ and $t gt.eq 1$ then gives
  $ D_lambda "Tr"_(V_lambda) \| Q_n \( lambda \) \|^(P_s) lt.eq D_lambda^(- A) . $
  There are at most $2^k$ possible tails of size $k$. For $k lt.eq sqrt(n)$, the dimension lower bound makes their total contribution at most $sum_(k gt.eq 1) \( 2 n^(- A \/ 4) \)^k$. For $k > sqrt(n)$, use $log \( n \/ k \) gt.eq M sqrt(log n)$; the contribution is at most
  $ sum_(k > sqrt(n)) exp #h(-0.16667em) (k log 2 - 1 / 2 A M k sqrt(log n)) . $
  Taking $A$ sufficiently large makes the sum of these two bounds at most $n^(- 12)$ for all sufficiently large $n$, proving the proposition. ◻
]

== 4 Angles between grid subgroup projections <ten:lowplanes:part:189>

Split the positions into an $a$ by $b$ grid, where $a b = n$ and $sqrt(n) \/ 2 lt.eq a \, b lt.eq 2 sqrt(n)$. Write

$ R = \( S_b \)^a \, #h(2em) F = \( S_a \)^b $

for the row and column subgroups. We will bound the overlap of their Fourier projections inside an irreducible representation $V_lambda$ of $S_n$.

Here is the precise meaning of the projections we use. Choose a real orthogonal irreducible representation $V_mu$ of $R$, a real unit vector $v_R in V_mu$, and let $D_R = dim V_mu$. In the restriction of $V_lambda$ to $R$, let $E_R$ act as

$ \| v_R chevron.r chevron.l v_R \| ⊗ I_(cal(M)_mu) quad upright("on ") V_mu ⊗ cal(M)_mu \, $

and as zero on all other isotypic summands. Thus $E_R$ includes every multiplicity copy $cal(M)_mu$. It is the evaluation on $V_lambda$ of a fixed element of the group algebra of $R$. Define $E_F$ and $D_F$ in the same way for $F$.

#thm([Proposition 4.1.])[
  (Grid overlap).  #emph[Fix $A_0 \, A_1 > 0$. For all sufficiently large $n$, if 
#[#set math.equation(numbering: n => "(9)")
 $ n e^(- A_0 sqrt(log n)) lt.eq X := log D_lambda lt.eq A_1 n \, $ <ten:lowplanes:eq:14>]

 then every pair of projections just described satisfies 
#[#set math.equation(numbering: n => "(10)")
 $ D_lambda "Tr"_(V_lambda) \( E_R E_F \) lt.eq D_R D_F exp #h(-0.16667em) (frac(X, \( log n \)^(1 \/ 3))) . $ <ten:lowplanes:eq:15>]

]
] <prop:grid-overlap>

The proof turns this overlap into the $lambda$-component of a unit invariant tensor. Orthogonal row and column tags make each slot carry its own cell tag. We then compare two estimates for that tensor after random low-dimensional-subspace tests: averaging the tests retains a controlled fraction of its $lambda$-component, while the distinct cell tags force the surviving tensor to have small norm. By Stirling, the conversion back to overlap costs

#[#set math.equation(numbering: n => "(11)")
 $ frac(n !, \| R \| \| F \|) lt.eq exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] n + O \( sqrt(n) log n \) #scale(x: 120%, y: 120%)[\)] . $ <eq:grid-normalization-cost>]

Compression to the cell tags will supply the compensating factor $exp \( - n \)$. The dimension window controls the remaining losses. If either subgroup type is absent from the restriction of $V_lambda$, the overlap is zero, so assume both occur.

=== 4.1 Tagged realization and overlap normalization <tagged-realization-and-overlap-normalization>

Put $r = floor.l n^(1 \/ 100) floor.r$. For a partition $nu$, let $s \( nu \)$ be the number of boxes below its first $r$ rows and to the right of its first $r$ columns. With $s = s \( lambda \)$, we first have

#[#set math.equation(numbering: n => "(12)")
 $ s lt.eq C X \/ log n . $ <ten:lowplanes:eq:16>]

To see this, tile the diagram by $r$ by $r$ squares. Each tile meeting the counted boxes has a full tile one step up and to the left; these full tiles contain at least $s$ boxes in total. Their standard tableau counts multiply to a lower bound for $D_lambda$: order the tiles by row and then column, and fill partial tiles in any fixed legal way. This respects the Young order. The hook formula gives logarithmic tableau count at least $r^2 \( log r - O \( 1 \) \)$ for each full square, proving (12).

We use Hilbert tensor powers of an alphabet with even and odd letter spaces. An adjacent transposition acts on homogeneous letters by

$ u ⊗ v mapsto \( - 1 \)^(p \( u \) p \( v \)) v ⊗ u \, $

where $p$ is parity. This graded permutation action is unitary. Whenever nonconsecutive slots are grouped together, we use the same graded reordering. In particular it carries actions within those slot sets to tensor-product actions, and carries parity-stable tag subspaces to the corresponding reordered tag subspaces.

An alphabet with $r$ even and $r$ odd good letters realizes precisely the shapes contained in the $r$-hook. With additional exceptional even letters, a shape $nu$ can be realized using exactly $s \( nu \)$ exceptional slots, provided at least $s \( nu \)$ exceptional letters are available; it cannot be realized using fewer exceptional slots. Here a fixed letter content gives an induced representation with trivial factors for even letters and sign factors for odd letters. By Pieri, the good even letters first supply at most $r$ rows, and the good odd letters add at most $r$ vertical strips. Each exceptional slot adds at most one box outside the resulting hook. Conversely, build the top $r$ rows by the even letters, then the remaining hook columns by the odd letters, and finally the outside boxes with distinct exceptional letters. This proves both assertions.

Realize $lambda$ with $s$ exceptional slots and restrict to $R$. If the chosen $R$-type has row shapes $mu_1 \, dots.h \, mu_a$, it occurs in some sector splitting these exceptional slots among the rows. The necessary exceptional count for each row gives

#[#set math.equation(numbering: n => "(13)")
 $ h_A := sum_i s \( mu_i \) lt.eq s . $ <ten:lowplanes:eq:17>]

The same argument applies to the column shapes.

For row $i$, take a separate alphabet $A_i$ with $r$ good letters of each parity and $s \( mu_i \)$ exceptional even letters, and set $A = xor.big_i A_i$. Embed each row representation in its own alphabet tensor power, with its required exceptional count. The tensor product of these embeddings realizes the whole chosen $R$-representation, so it also realizes the possibly entangled vector $v_R$. Denote its image by $psi$. It is a unit vector with exactly $h_A$ exceptional slots, and the slot in row $i$ has tag $A_i$. For $g in R$, its matrix coefficient is

$ f_R \( g \) = chevron.l v_R \, g v_R chevron.r \, $

where $g$ acts in the chosen row representation. Outside $R$ the coefficient is zero, because a permutation not preserving the rows changes a tag. Construct a unit column-tagged vector $eta$ in $B^(⊗ n)$, $B = xor.big_j B_j$, in the same way. Its exceptional count is $h_B lt.eq s$, and its coefficient on $F$ is $f_F \( g \) = chevron.l v_F \, g v_F chevron.r$, with $v_F$ the real unit vector defining $E_F$. It is zero outside $F$.

On $A^(⊗ n) ⊗ B^(⊗ n)$, let $P_(*)$ be projection onto diagonal invariants and let $P_A^lambda \, P_B^lambda$ be the isotypic projections on the respective sides. Put

$ e = psi ⊗ eta \, #h(2em) phi.alt = sqrt(n !) thin P_(*) e . $

Only the identity contributes to the diagonal coefficient average, since $R ∩ F = { 1 }$. Hence $parallel phi.alt parallel = 1$. On diagonal invariants the $A$-action of $g$ equals the $B$-action of $g^(- 1)$. The character formulas therefore show that the two isotypic projections agree there. Moreover,

#[#set math.equation(numbering: n => "(14)")
 $ parallel P_A^lambda phi.alt parallel^2 = frac(\| R \| \| F \|, D_R D_F n !) thin D_lambda "Tr"_(V_lambda) \( E_R E_F \) . $ <ten:lowplanes:eq:18>]

Indeed $P_(*)$ commutes with $P_A^lambda$, and the two averaging formulas give the left-hand side as

$ frac(D_lambda, n !) sum_(x in F \, med z in R) chi_lambda \( z^(- 1) x \) f_R \( z \) f_F \( x \) . $

The group-algebra coefficients of $E_R$ are $\( D_R \/ \| R \| \) f_R \( g \)$, and similarly for $E_F$. The coefficients are real and unchanged by inversion because the selected carrier vectors are real. Taking the trace of the product gives (14).

=== 4.2 Retention under random-plane tests <ten:lowplanes:part:243>

The good even and good odd spaces of $A$ each have dimension $H = a r$. Choose an independent unitarily invariant complex $r$-plane in each, and let $V_A$ be their sum. Let $T_A$ project onto tensors with at most

$ L_A = 3 s + 2 r H $

slots outside $V_A$. Every exceptional slot counts as outside. Write $overline(T)_A$ for the average over the two planes.

#thm([Lemma 4.2.])[
  (Retention on the isotypic sector).  #emph[On the sector with exactly $h_A$ exceptional slots, 
#[#set math.equation(numbering: n => "(15)")
 $ overline(T)_A gt.eq alpha_H P_A^lambda \, #h(2em) alpha_H = \( n + H \)^(- 2 r H) . $ <ten:lowplanes:eq:19>]

 The inequality holds on all multiplicity spaces.]
] <lem:plane-retention>

#proof[
  Fix also the counts $k \, m$ of good even and good odd slots. Apply ordinary Schur–Weyl separately to these species. For unitary highest weights $rho tack.r k$ and $xi tack.r m$, the symmetric-group side is induced from the Specht representations of $rho \, xi'$ and the exceptional tensor representation: the arrangements of the three species among the slots account for the induction. The transpose on the odd species is the sign twist. If this summand contains $lambda$, branching and reciprocity imply
  $ rho subset.eq lambda \, #h(2em) xi' subset.eq lambda . $
  The highest weights $rho$ and $xi$ have height at most $H$. Both therefore have at most $s + r H$ boxes below their first $r$ rows. For $rho$, at most $r H$ such boxes lie in the first $r$ columns and the rest are counted by $s \( lambda \)$; use $s \( lambda' \) = s \( lambda \)$ for $xi$.
  For fixed planes, the two complement counts are Lie-algebra operators on the two unitary-representation factors. Thus the test, a spectral projection of their sum plus $h_A I$, acts as identity on multiplicity spaces even before averaging. Its average is scalar on each pair of unitary types, with scalar equal to its relative trace for reference planes.
  For one highest weight $nu$, use the first $r$ coordinate directions as reference plane. The highest-weight vector has complement count $sum_(i > r) nu_i$. The $U \( H - r \)$-representation generated from it has this same count, since the complement-count element is central for that subgroup. Its highest weight is $\( nu_(r + 1) \, dots.h \, nu_H \)$. Weyl’s dimension formula gives its dimension relative to the full representation as
  $ frac(product_(r < i < j lt.eq H) \( 1 + \( nu_i - nu_j \) \/ \( j - i \) \), product_(1 lt.eq i < j lt.eq H) \( 1 + \( nu_i - nu_j \) \/ \( j - i \) \)) gt.eq \( n + H \)^(- r H) . $
  On the product of the two such subrepresentations, the test succeeds because $h_A + 2 \( s + r H \) lt.eq L_A$. The resulting relative trace is at least $alpha_H$, proving the lemma. ◻
]

Use independent planes on the column side, with $H' = b r$, $L_B = 3 s + 2 r H'$, and the corresponding projector $T_B$. Diagonal averaging preserves the exceptional counts, so $phi.alt$ lies in both sectors to which the lemma applies. The two positive operator inequalities tensor together. Since $P_A^lambda P_B^lambda phi.alt = P_A^lambda phi.alt$, they yield

#[#set math.equation(numbering: n => "(16)")
 $ alpha_H alpha_(H') parallel P_A^lambda phi.alt parallel^2 lt.eq bb(E) parallel \( T_A ⊗ T_B \) phi.alt parallel^2 . $ <ten:lowplanes:eq:20>]

This is the lower bound for the tested norm. We next obtain its upper bound for every fixed choice of planes.

=== 4.3 Compression to orthogonal cell tags <ten:lowplanes:part:270>

Regroup the two alphabets into $D^(⊗ n)$, where $D = A ⊗ B$ has parity equal to the sum of the two parities. The identification is unitary and uses graded signs: moving a $B$-letter past a later-slot $A$-letter contributes a minus sign when both are odd. Checking adjacent transpositions shows that the diagonal action becomes the graded permutation action on $D$. The parity-preserving slot tests are identified without additional signs.

The slot in cell $\( i \, j \)$ now has tag $D_(i j) = A_i ⊗ B_j$. These $n$ tag spaces are mutually orthogonal, and $e$ lies in their product tag subspace. No factorization of $e$ across the slots is asserted.

Passing both tests leaves at most $L_A + L_B$ slots outside $W = V_A ⊗ V_B$. The tests preserve diagonal invariants. In an invariant graded tensor, the number of slots in the odd part of $W$ is at most its dimension: after fixing their positions and grouping them, those factors alternate. Let $W_0$ be the even part of $W$, and let $Delta_(*)$ test that at most

$ T = L_A + L_B + 4 r^2 $

slots lie outside $W_0$. We obtain

#[#set math.equation(numbering: n => "(17)")
 $ parallel \( T_A ⊗ T_B \) phi.alt parallel^2 lt.eq parallel Delta_(*) phi.alt parallel^2 = n ! parallel P_(*) Delta_(*) e parallel^2 . $ <ten:lowplanes:eq:21>]

The final equality uses the commutation of $Delta_(*)$ with the diagonal action. Also

$ dim W_0 lt.eq 4 r^2 \, #h(2em) T lt.eq C X \/ log n < n \/ 2 $

for large $n$: the terms in $T$ not involving $s$ are $O \( n^0.52 \)$, and the lower endpoint of (9) absorbs them.

#thm([Lemma 4.3.])[
  (Cell-tag compression).  #emph[With the notation above, put 
$ M_(*) = sum_(t lt.eq T) binom(n, t) . $

 Then 
$ n ! parallel P_(*) Delta_(*) e parallel^2 lt.eq n ! M_(*)^2 max_(0 lt.eq t lt.eq T) frac(dim \( "Sym"^(n - t) W_0 \), t ! thin \( n - t \)^(n - t)) . $

]
] <lem:cell-compression>

#proof[
  Write $Delta_(*) = sum_(\| S \| lt.eq T) Delta_S$, where $Delta_S$ specifies exactly the slots outside $W_0$. Fix $S$, put $t = \| S \|$, $m = n - t$, and group the remaining slots before those in $S$, using graded reordering. Parity-stability of the tags ensures that the reordered vector still lies in the corresponding product tag subspace.
  The full invariant projection is dominated by the product of the two within-group invariant projections. Since $Delta_S$ commutes with these within-group projections, and we may relax the test on $S$ to identity, $parallel P_(*) Delta_S e parallel^2$ is bounded by the quadratic form of
  $ Pi_m ⊗ Pi_t \, #h(2em) Pi_m = P_("Sym"^m W_0) \, quad Pi_t = P_(upright("graded symmetric tensors in ") D^(⊗ t)) . $
  We now compress this operator to the product tag subspace. The compression splits into the tensor product of the two compressed operators; no tag projection is required to commute with $P_(W_0)$. On the $S$-slots every nonidentity permutation changes a tag, so the compression of $Pi_t$ is exactly identity divided by $t !$.
  For the other factor, unitary invariance and irreducibility give
  $ Pi_m = dim \( "Sym"^m W_0 \) thin bb(E)_z thin \| z^(⊗ m) chevron.r chevron.l z^(⊗ m) \| \, $
  where $z$ is a uniform complex unit vector in $W_0$. This is the compact coherent-orbit resolution of #cite(label("Perelomov1972"), form: "prose") Section 2. If $C_ell$ projects to the tag of remaining slot $ell$, then the compressed rank-one operator has norm
  $ product_(ell = 1)^m parallel C_ell z parallel^2 lt.eq m^(- m) \, $
  by orthogonality of the tags and arithmetic–geometric mean. Consequently the compression of $Pi_m$ has norm at most $dim \( "Sym"^m W_0 \) m^(- m)$. The product of these two operator bounds applies to any unit vector in the tag subspace, including the entangled vector $e$.
  Thus each assignment contributes at most the fraction in the lemma. Cauchy–Schwarz in the sum of the $M_(*)$ vectors $P_(*) Delta_S e$ gives the additional factor $M_(*)^2$, proving the result. ◻
]

#proof[
  #emph[Completion of the proof of Proposition 4.] The number of assignments is at most
  $ M_(*) lt.eq exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] C T log \( e n \/ T \) #scale(x: 120%, y: 120%)[\)] . $
  Use $dim W_0 lt.eq 4 r^2$ and Stirling in the compression lemma. In particular,
  $ frac(n !, t ! thin \( n - t \)^(n - t)) = binom(n, t) exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] - \( n - t \) + O \( log n \) #scale(x: 120%, y: 120%)[\)] . $
  We obtain
  $ bb(E) parallel \( T_A ⊗ T_B \) phi.alt parallel^2 lt.eq exp #h(-0.16667em) (- n + O #h(-0.16667em) (T log \( e n \/ T \) + r^2 log n)) . $
  The inverse retention factor in (16) costs
  $ log \( alpha_H alpha_(H') \)^(- 1) = O \( n^0.6 \) . $
  Finally (14) restores the subgroup normalization. Combining these three bounds gives
  $ frac(D_lambda "Tr" \( E_R E_F \), D_R D_F) lt.eq exp #h(-0.16667em) (O #h(-0.16667em) (T log \( e n \/ T \) + r^2 log n + n^0.6 + sqrt(n) log n)) . $
  Here the compression term $- n$ cancels the $+ n$ in (11). The dimension window and $T lt.eq C X \/ log n$ imply
  $ T log \( e n \/ T \) = O_(A_0 \, A_1) #h(-0.16667em) (X / sqrt(log n)) \; $
  the other displayed losses are absorbed by the same bound. For sufficiently large $n$, this is at most $X \/ \( log n \)^(1 \/ 3)$, proving (10). ◻
]

== 5 The uniform moment induction <ten:lowplanes:part:309>

We first remove the representations controlled by a fixed power, then show that every remaining representation lies in the window of Proposition 4. The overlap estimate will close an induction through balanced splits of the coordinate set.

=== 5.1 Covering the representation ranges <covering-the-representation-ranges>

A representation of height greater than $n \/ 2$ is annihilated by one coordinate matching. Indeed, that matching average projects onto invariants of its pair-switching subgroup. By Pieri, induction from $n \/ 2$ trivial $S_2$ factors produces only shapes of height at most $n \/ 2$.

For $X = log D_lambda gt.eq A_1 n$, choose the absolute constant $A_1$ large enough that Proposition 2 gives

$ "Tr"_(V_lambda) \| Q_n \( lambda \) \|^(2 u) lt.eq e^(C n) \/ D_lambda lt.eq D_lambda^(- 1 \/ 2) . $

A larger fixed power makes the sum of the regular contributions in this range at most $n^(- 12)$. Here we use the bound $e^(O \( sqrt(n) \))$ on the number of partitions of $n$, which also follows by evaluating the partition generating product at $e^(- 1 \/ sqrt(n))$. Proposition 3 supplies the same aggregate bound for long first rows. Since all singular values are at most one, we may choose a common fixed power $P_c gt.eq 2$ for these two estimates.

Every remaining nontrivial representation satisfies (9), for a fixed $A_0$ chosen sufficiently large in terms of $M$. Only the lower endpoint needs proof. Suppose first that the first row or first column has length $L gt.eq n \/ 8$. Transpose if necessary, preserving dimension, and retain the first row together with a subdiagram of

$ t = floor.l n e^(- M sqrt(log n)) floor.r $

boxes below it. There are enough boxes: in the row case we have excluded the sparse range of Proposition 3; in the column case the original height is at most $n \/ 2$, so the transposed tail has at least $n \/ 2$ boxes. Since $t = o \( L \)$, the hook comparison (8), applied to this smaller diagram, gives logarithmic dimension at least $t$ for large $n$. Branching bounds this dimension by $D_lambda$. If both the first row and first column have length less than $n \/ 8$, every hook is at most $n \/ 4$, and the hook formula instead gives

$ D_lambda gt.eq frac(n !, \( n \/ 4 \)^n) \, #h(2em) log D_lambda gt.eq c n . $

Both cases imply the required lower endpoint after choosing $A_0 > M$.

=== 5.2 Closing the induction <closing-the-induction>

#proof[
  Fix a threshold $n_0$ large enough for the preceding estimates and the numerical comparisons below. For each of the finitely many dyadic sizes $2 lt.eq n < n_0$, every nonconstant regular singular value of $Q_n$ is strictly less than one. Norm equality through a product of orthogonal projections would force a common invariant vector for all coordinate switches. These switches generate $S_n$, so only constants can have equality. A common finite power, chosen at least $P_c$, therefore proves (1) for all these base sizes. Denote it by $P \( n \)$ there.
  For a larger size $n = 2^d$, split the coordinates into consecutive groups of sizes $floor.l d \/ 2 floor.r$ and $ceil.l d \/ 2 ceil.r$. They give a balanced $a$ by $b$ grid. The two sweep factors are a row law, consisting of independent $b$-card cube sweeps, and a column law, consisting of independent $a$-card cube sweeps. Set
  $ p = max { P \( a \) \, P \( b \) \, P_c } \, #h(2em) P \( n \) = #scale(x: 120%, y: 120%)[\(] 1 + 2 \( log n \)^(- 1 \/ 4) #scale(x: 120%, y: 120%)[\)] p . $
  The already controlled classes retain their bounds at this power. Consider a remaining representation, with $X$ in (9), and write the two factors in matrix product order as $Q_n = Y Z$.
  The Araki–Lieb–Thirring inequality #cite(label("araki1990")) #cite(label("audenaert2007")), with exponent $p \/ 2 gt.eq 1$, gives
  #[#set math.equation(numbering: n => "(18)")
   $ "Tr"_(V_lambda) \| Y Z \|^p lt.eq "Tr"_(V_lambda) \( Y^(*) Y \)^(p \/ 2) \( Z Z^(*) \)^(p \/ 2) . $ <ten:lowplanes:eq:22>]
  The left side is the trace of the $p \/ 2$ power of $\( Y^(*) Y \)^(1 \/ 2) Z Z^(*) \( Y^(*) Y \)^(1 \/ 2)$. Take spectral decompositions of the two positive powers on their own subgroup irreducibles and then restrict to $V_lambda$. Real orthogonal models give real eigenvectors, so the resulting projections are exactly those covered by Proposition 4; each projection acts on all copies of its carrier, with a nonnegative spectral coefficient.
  For either subgroup, the sum of those coefficients multiplied by the carrier dimensions is its regular Schatten $p$-moment. The product subgroup laws are independent across lines, so these traces factor. Multiplying (18) by $D_lambda$ and applying the overlap proposition and the induction hypothesis gives
  $ D_lambda "Tr"_(V_lambda) \| Q_n \|^p lt.eq exp #h(-0.16667em) (frac(X, \( log n \)^(1 \/ 3))) \( 1 + b^(- 10) \)^a \( 1 + a^(- 10) \)^b . $
  The last two factors are bounded, and the lower endpoint for $X$ absorbs that constant. Thus
  $ "Tr"_(V_lambda) \| Q_n \|^p lt.eq exp #h(-0.16667em) (- X + frac(2 X, \( log n \)^(1 \/ 3))) . $
  Apply $sum_j a_j^t lt.eq \( sum_j a_j \)^t$ with $t = P \( n \) \/ p = 1 + 2 \( log n \)^(- 1 \/ 4)$. The increase in exponent is larger than the relative overlap loss, and for all sufficiently large $n$ we obtain
  $ D_lambda "Tr"_(V_lambda) \| Q_n \|^(P \( n \)) lt.eq exp #h(-0.16667em) (- frac(c X, \( log n \)^(1 \/ 4))) . $
  The lower endpoint in (9) makes this summable over all partitions, with total at most $n^(- 12)$. Adding the two previously controlled classes and the trivial representation gives a total at most $1 + 3 n^(- 12) lt.eq 1 + n^(- 10)$, closing the induction. The comparisons used here depend on $n$ and the fixed range constants, not on the size of the base-case power; hence the initial choice of $n_0$ is legitimate.
  Finally $P \( n \)$ is bounded uniformly. Along any branch of the recursion the bit lengths undergo floor/ceiling halving until the base range. Read in reverse, those lengths grow geometrically, so the sum of their $- 1 \/ 4$ powers is uniformly bounded. The factors $1 + 2 \( log n \)^(- 1 \/ 4)$ consequently have bounded product. Any fixed upper bound $P$ for $P \( n \)$ proves (1).
  To deduce the total-variation assertion, let $mu_v$ be the law of $v$ independent sweeps and let $Pi$ project onto constants in the regular representation. For an integer $v$ with $2 v gt.eq P$, Schatten Hölder on the complement of constants gives
  $ parallel Q_n^v - Pi parallel_(upright("HS"))^2 lt.eq "Tr"_(upright(r e g \, perp)) \| Q_n \|^(2 v) lt.eq n^(- 10) . $
  Every row of the regular transition matrix is a translate of $mu_v$. Therefore the precise normalization is
  $ parallel Q_n^v - Pi parallel_(upright("HS"))^2 = n ! sum_(g in S_n) (mu_v \( g \) - frac(1, n !))^2 . $
  With $U_(S_n)$ denoting the uniform law, Cauchy–Schwarz yields $parallel mu_v - U_(S_n) parallel_(upright("TV")) lt.eq 1 / 2 parallel Q_n^v - Pi parallel_(upright("HS")) lt.eq 1 / 2 n^(- 5)$. Relabeling gives the same bound from every deterministic initial deck. ◻
]

An absolute number of sweeps is $O \( d \)$ physical shuffles. The following support obstruction gives the matching lower order.

#thm([Proposition 5.1.])[
  (Support obstruction).  #emph[After $t$ physical shuffles the total-variation distance from uniform is at least $1 - 2^(t n \/ 2) \/ n !$. Thus mixing to distance $1 \/ 4$ requires at least $ceil.l \( 2 \/ n \) log_2 \( 3 n ! \/ 4 \) ceil.r = 2 d - O \( 1 \)$ physical shuffles.]
] <ten:support>

#proof[
  There are at most $2^(t n \/ 2)$ coin strings and hence at most that many possible permutations. Test this support against uniform measure and then use Stirling’s formula. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
