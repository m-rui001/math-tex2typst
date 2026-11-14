#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 82.2pt, y: 82.2pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Exponential PSD rank of positively shifted matching matrices]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Semidefinite lifts describe a convex set as the image of an affine section of a positive semidefinite cone.
  They can be substantially smaller than linear descriptions,
  so lower bounds for linear extended formulations do not automatically exclude small semidefinite lifts.
  We prove an exponential lower bound for perfect matching by studying an exact factorization problem that also
  allows a fixed positive shift of every odd-cut slack.

For even $n gt.eq 4$, let $E_n$ be the edges of the complete graph $K_n$ on $\[ n \] = { 1 \, dots.h \, n }$,
  let $cal(M)_n$ be its perfect matchings, and let $cal(O)_n$ be the odd-cardinality subsets of $\[ n \]$.
  For $U subset.eq \[ n \]$, write $delta \( U \)$ for the edges with exactly one endpoint in $U$.
  For $0 lt.eq rho lt.eq 1$, define the matrix

#[#set math.equation(numbering: n => "(1.1)")
 $ A_n \( rho \)_(U \, M) = \| M ∩ delta \( U \) \| - 1 + rho \, wide U in cal(O)_n \, quad
   M in cal(M)_n . $ <eq:main-matrix>]

Every perfect matching crosses an odd set an odd positive number of times, so this matrix is nonnegative.
  Its rows consist solely of odd cuts.

The #emph[real positive semidefinite rank] of a finite nonnegative matrix $A$,
  denoted $upright(r a n k ""_(p s d)) A$, is the least integer $r gt.eq
  1$ for which there are real symmetric positive semidefinite matrices $F_U \, G_M in bb(R)^(r times r)$ satisfying

$ A_(U \, M) = "tr" \( F_U G_M \) wide upright("for every row and column") . $

Such matrices are called PSD factors. The entries must be reproduced exactly, and no symmetry, equivariance,
  sparsity, or precision restriction is imposed on the factors.

#thm([Theorem 1.1.])[
  #emph[There is a constant $c > 0$ such that, for every fixed $0 < rho < 1$, there is $n_0 = n_0 \( rho \)$ for which
$ upright(r a n k ""_(p s d)) A_n \( rho \) gt.eq 2^(c n) $

 for every even $n gt.eq n_0$.]
] <thm:main>

The endpoint $rho = 1$ has a factorization of size $binom(n, 2)$:
  use diagonal matrices indexed by edges, with diagonal entries $upright(bold(1))_({ e in delta \( U \) })$ for a
  row and $upright(bold(1))_({ e in M })$ for a column. Thus the endpoint $rho =
  1$ cannot be included in the exponential lower bound. The exponential rate in Theorem 1 is independent of $rho$,
  although the threshold is allowed to deteriorate as $rho$ tends to one.

=== 1.1 Exact semidefinite lifts <exact-semidefinite-lifts>

Let

$ P_n = "conv" { upright(bold(1))_M : M in cal(M)_n } subset.eq bb(R)^(E_n) $

be the perfect matching polytope. A #emph[semidefinite lift of size $r$] represents $P_n$ as an affine image of
  $L ∩ bb(S)_(+)^r$, where $L$ is an affine subspace of the real symmetric matrices and $bb(S)_(+)^r$ is their PSD
  cone. Also let $T_n \( rho \)$ denote the matrix obtained by adjoining to $A_n \( rho \)$ the edge rows

$ T_n \( rho \)_(e \, M) = upright(bold(1))_({ e in M }) \, wide e in E_n . $

Adding rows cannot decrease PSD rank, so Theorem 1 applies to $T_n \( rho \)$ as well.

#thm([Corollary 1.2.])[
  (Unshifted rank and exact lifts).  #emph[There are constants $c_0 > 0$ and $n_1$ such that,
    for every even $n gt.eq n_1$, both $A_n \( 0 \)$ and $T_n \( 0 \)$ have real PSD rank at least $2^(c_0 n)$,
    and every exact semidefinite lift of $P_n$ has size at least $2^(c_0 n)$.]
] <cor:exact-lift>

#proof[
  Appending scalar blocks $rho$ to the row factors and $1$ to the column factors of $A_n \( 0 \)$ gives a
    factorization of $A_n \( rho \)$. Consequently
  $ upright(r a n k ""_(p s d)) A_n \( rho \) lt.eq upright(r a n k ""_(p s d)) A_n \( 0 \) + 1 . $
  Fix $rho = 1 \/ 2$ and apply Theorem 1. For all sufficiently large even $n$,
  $ upright(r a n k ""_(p s d)) T_n \( 0 \) gt.eq upright(r a n k ""_(p s d)) A_n \( 0 \) gt.eq 2^(c n) - 1 gt.eq
    2^(c n \/ 2) . $
  Edmonds’s description of $P_n$ uses nonnegativity and odd-cut inequalities,
    within the affine space of degree equations $sum_(e in.rev v) x_e = 1$ #cite(label("edmonds")).
    Thus $T_n \( 0 \)$ is a slack matrix of this description.
    Every row inequality is tight at some perfect matching. Any redundant row is therefore a nonnegative
    combination of facet slack rows, so including it does not change PSD rank.
    The cone-factorization theorem identifies this rank with the minimum size of a semidefinite lift
    #cite(label("gpt")) Theorem 2.4 and Corollary 2.6.
  For completeness, an arbitrary lift can be restricted to the smallest face of the PSD cone containing its
    feasible section. This face is a PSD cone of size at most $r$, and the section meets its relative interior,
    supplying the properness needed for factorization. An affine image can be made linear on the affine slice
    without increasing size: the slice cannot contain zero, since its intersection with the cone would then have a
    bounded affine image only if that image were a point. A linear functional equal to one on the slice therefore
    absorbs the translation. Taking $c_0 = c \/ 2$ proves the corollary. ◻
]

=== 1.2 History and the role of the shift <history-and-the-role-of-the-shift>

Edmonds’s inequality description #cite(label("edmonds")) is the starting point for formulation complexity of
  matching. Yannakakis developed the nonnegative-factorization framework and proved an exponential lower bound for
  symmetric linear formulations #cite(label("yannakakis")).
  Rothvoß proved the unrestricted exponential linear extension-complexity bound #cite(label("rothvoss")).
  The cone-factorization framework of Gouveia, Parrilo, and Thomas #cite(label("gpt")) gives the corresponding
  connection between PSD rank and semidefinite lifts.

For the particular shifted matrix, Braun and Pokutta proved exponential nonnegative rank for the entries
  $\( \| M ∩ delta \( U \) \| - 1 + rho \) \/ 2$, for each fixed $0 < rho <
  1$ #cite(label("braun-pokutta")) Section 2.2.3 and Theorem 3.1.
  Positive scalar multiplication does not change rank, so their matrix is the same factorization problem with
  nonnegative scalar factors in place of arbitrary PSD factors.
  Braun and collaborators proved exponential lower bounds for coordinate-symmetric semidefinite formulations of
  matching #cite(label("matching-symmetric")) Definition 2.2 and Theorem 3.10.
  Here no group action on the factor coordinates is assumed.
  Permutation symmetry will be used only to analyze averaging operators.

Lee, Raghavendra, and Steurer developed a general approach to unrestricted SDP lower bounds through sums of
  squares and low-degree separating functionals #cite(label("lrs")).
  Our proof follows that approach, with a transfer argument tailored to matching.
  It treats the exact positive shift in Equation (1.1). Exactness matters:
  Kaniewski, Lee, and de Wolf construct matrices of subexponential PSD rank that approximate the unshifted
  matching slack with entrywise error at most $2^(- sqrt(n \/ 2))$ #cite(label("kaniewski-lee-dewolf"))
  Section 7.3 and Theorem 19.

=== 1.3 Proof strategy and reusable ingredients <proof-strategy-and-reusable-ingredients>

The obstruction is an inconsistent parity system on an expanding graph $H$ with $t$ vertices.
  Each vertex carries $d$ incidence bits of prescribed parity, and the sum of the prescribed parities is odd.
  Some edge must therefore have unequal bits at its two ends.
  Subtracting $1 - rho$ from the number of disagreements gives a positive function $f$.
  Products of signs of the free incidence bits give Fourier characters, each involving certain vertex blocks.
  Section 5 constructs a linear functional that is nonnegative on squares of functions whose Fourier characters
  each involve at most a small fixed fraction of the blocks, yet takes value $- \( 1 - rho \)$ on $f$.
  The signed moment construction is related to Grigoriev’s low-degree functionals for Tseitin contradictions
  #cite(label("grigoriev")).

To realize this system in matching, replace every vertex of $H$ by a cell of $k$ vertices.
  The cell size $k$ is a sufficiently large constant, fixed before $n$ tends to infinity.
  Each auxiliary incidence uses one terminal; the remaining vertices are paired inside the cell.
  A local cut restriction fixes the terminal bits and gives equal bits to every internal pair.
  The only crossing edges are then the auxiliary disagreements.
  Section 6 performs this construction and completes the proof.

The main analytic task is to show that a small PSD factorization would make $f$ close enough to a low-degree sum
  of squares. Let $overline(F) \( y \)$ be the row factor averaged over cuts with incidence assignment $y$.
  Pairing this average with the factor of the corresponding matching gives $f \( y \)$.
  Taking square roots of the row factors gives matrix functions with no initial degree bound;
  averaging their squares cannot be replaced by squaring their averages. We instead construct an exact representation

$ overline(F) \( y \) = sum_q H_q \( y \)^(sans(T)) H_q \( y \) $

by real rectangular matrix functions. The index $q$ labels both a summand, called a branch,
  and a Fourier character $chi_q$. The goal is to concentrate the coefficients of $H_q$ on characters that differ
  from $chi_q$ in only a few vertex blocks.

Section 2 proves the local averaging estimate used at each step.
  Its scalar variance bound tends to zero as $k$ grows and extends to matrices without a dimension factor.
  The proof combines a trace estimate with a lower bound on the dimensions of invariant eigenspaces,
  a spectral mechanism also used in quasirandom-group arguments #cite(label("gowers")).
  Section 3 proves a dimension-free orthogonal splitting inequality for a finite family of PSD matrices.

These ingredients yield the abstract product averaging theorem in Section 4.
  It bounds the Fourier mass of each branch with weights growing exponentially in the number of blocks where a
  character differs from its center $q$. The controlled quantity is the squared Frobenius norm of a weighted Gram
  matrix, hence a fourth-order expression in the Fourier coefficients.
  Its use allows repeated averaging even though representing an average by a direct sum introduces additional rows
  into the matrices $H_q$. After truncation near the center $q$,
  multiplication by $chi_q$ moves each retained character to low block degree while preserving squares,
  as in finite-group Fourier sums of squares #cite(label("fsp-sparse")).
  This is the step that lets the separating functional contradict the factorization.

The local averaging lemma, the orthogonal splitting inequality,
  and the product theorem are stated separately from the global matching factorization problem.
  Appendix 7 gives a further independent smoothing theorem for averages over matchings with any prescribed
  edge-count table across a fixed number of cells. Its estimate is uniform even for rare tables and unbalanced
  cell sizes, and its three-cell specialization includes a single polynomial in the three intercell counts.

===== 1.3.1 Notation. <notation.>

Finite sets carry uniform probability unless another law is specified; averages are denoted by $bb(E)$.
  For real matrices we use the Frobenius norm $∥∥_(upright(F))
  B = \( "tr" \( B^(sans(T)) B \) \)^(1 \/ 2)$ and operator norm $∥∥_(upright("op")) B$.
  The relation $A prec.curly.eq B$ means that $B - A$ is PSD. All logarithms are natural unless their base is displayed.

== 2 Averaging within a cell <sec:local>

We next construct restrictions of a cut to one cell. The restrictions prescribe its values at a fixed number of
  terminals and make its values equal across every internal matching edge.
  Averaging a function over these restrictions has a uniform marginal and, as the cell grows,
  small variance over the choice of terminals and matching.
  The variance bound will hold for matrix-valued functions with a constant independent of their dimensions.

Fix an even integer $d gt.eq 2$, and let $k$ be a sufficiently large even integer.
  A cell has vertex set $\[ k \]$. For $b in { 0 \, 1 }$, let $w$ be the unique integer in ${ k \/ 2 \, k \/ 2 +
  1 }$ congruent to $b$ modulo two, and set

$ X = binom(\[ k \], w) \, wide Y_b = {y in { 0 \, 1 }^d : sum_(ell = 1)^d y_ell equiv b med \( mod med 2 \)} \,
  wide L = \| Y_b \| = 2^(d - 1) . $

We identify a subset $a in X$ with its indicator function when referring to its bits.

Local column data $m$ consist of an ordered list of distinct terminals $\( v_1 \, dots.h \, v_d \)$ and a perfect
  matching of the remaining $k - d$ vertices. Let $cal(M)$ be the finite set of these data, with its uniform law.
  For $y in Y_b$, define $pi_y^m$ to be the uniform probability measure on the subsets $a in X$ satisfying

#[#set math.equation(numbering: n => "(2.1)")
 $ upright(bold(1))_a \( v_ell \) = y_ell quad \( 1 lt.eq ell lt.eq d \) \, wide upright(bold(1))_a \( u \) =
   upright(bold(1))_a \( v \) quad upright("for every internal pair ") { u \,
   v } upright(" of ") m . $ <local:restrictions>]

To see that this measure is defined, write

#[#set math.equation(numbering: n => "(2.2)")
 $ s = \| y \| \, wide h = frac(k - d, 2) \, wide g = frac(w - s, 2) . $ <local:parameters>]

The parity condition makes $g$ integral. A subset satisfying (2.1) consists of the prescribed terminals and a
  choice of $g$ whole pairs among the $h$ internal pairs. If $delta = w - k \/ 2 in { 0 \, 1 }$, then

#[#set math.equation(numbering: n => "(2.3)")
 $ g = h / 2 + d / 4 + delta / 2 - s / 2 \, wide lr(|g - h / 2|) lt.eq d / 4 + 1 / 2 . $ <local:central>]

Thus $0 lt.eq g lt.eq h$ for all sufficiently large $k$, uniformly in $b$ and $y$.
  The support of $pi_y^m$ has cardinality $binom(h, g)$.

For a real function $B$ on $X$, define

$ \( T_y B \) \( m \) = sum_(a in X) pi_y^m \( a \) B \( a \) . $

The same definition applies entrywise to a real matrix-valued function.
  Expectations over $a$ and $m$ below use the uniform laws on $X$ and $cal(M)$, respectively.

#thm([Lemma 2.1.])[
  (Local averaging).  #emph[For each fixed even $d gt.eq 2$,
    there are $k_0 \( d \)$ and numbers $theta_d \( k \) gt.eq 0$, defined for even $k gt.eq k_0 \( d \)$,
    with $theta_d \( k \) arrow.r 0$ as $k arrow.r oo$, such that the following holds for the construction above,
    for both $b in { 0 \, 1 }$ and every $y in Y_b$. First,
#[#set math.equation(numbering: n => "(2.4)")
 $ bb(E)_m pi_y^m \( a \) = frac(1, \| X \|) wide \( a in X \) . $ <local:marginal>]

 Second, every real function $B : X arrow.r bb(R)$ satisfies
#[#set math.equation(numbering: n => "(2.5)")
 $ bb(E)_m lr(|\( T_y B \) \( m \) - bb(E)_a B \( a \)|)^2 lt.eq
   theta_d \( k \) thin bb(E)_a lr(|B \( a \) - bb(E)_a B \( a \)|)^2 . $ <local:scalar-variance>]

 For every pair of positive integers $p \, q$, the same constant gives, for every $B : X arrow.r bb(R)^(p times q)$,
#[#set math.equation(numbering: n => "(2.6)")
 $ bb(E)_m ∥\( T_y B \) \( m \) - bb(E)_a B \( a \)∥_(upright(F))^2 lt.eq
   theta_d \( k \) thin bb(E)_a ∥B \( a \) - bb(E)_a B \( a \)∥_(upright(F))^2 lt.eq
   theta_d \( k \) thin bb(E)_a ∥B \( a \)∥_(upright(F))^2 . $ <local:matrix-variance>]

 One may take $theta_d \( k \) = O_d \( k^(- 1 \/ 4) sqrt(log \( k + 2 \)) \)$.]
] <lem:local-averaging>

#proof[
  The uniform law of $m$ and the restrictions (2.1) are equivariant under permutations of the $k$ vertices.
    Since the symmetric group is transitive on $X$, the marginal law of $a$,
    obtained by first sampling $m$ and then $a tilde.op pi_y^m$, is uniform. This proves (2.4).
  Fix $b$ and $y$, and write $T = T_y$. Equip the function spaces on $X$ and $cal(M)$ with the inner products for
    uniform probability, and put $K = T^(*) T$. This is a positive semidefinite self-adjoint operator.
    The marginal identity gives $K 1 = 1$. We will show that $"tr" \( K^2 \) = o \( k \)$,
    while every nonconstant eigenspace has dimension at least $k \/ 2$.
    Together these estimates force the largest eigenvalue on the orthogonal complement of the constants to tend to zero.
  #emph[The two-sample kernel.] Sample $m$ uniformly, and then sample $a \,
    a'$ independently from $pi_y^m$ conditional on $m$. Let $J \( a \, a' \)$ be their joint probability,
    and let $N = \| X \|$. The density of this joint law relative to two independent uniform elements of $X$ is
    $D \( a \, a' \) = N^2 J \( a \, a' \)$. Indeed, for scalar functions $B_1 \, B_2$,
  $ chevron.l B_1 \, K B_2 chevron.r = sum_(a \, a' in X) J \( a \, a' \) B_1 \( a \) B_2 \( a' \) . $
  Consequently the ordinary matrix entries of $K$ are $D \( a \, a' \) \/ N$, and symmetry gives
  #[#set math.equation(numbering: n => "(2.7)")
   $ "tr" \( K^2 \) = 1 / N^2 sum_(a \, a' in X) D \( a \, a' \)^2 . $ <local:density-trace>]
  The joint law is permutation-invariant, so $D \( a \, a' \)$ depends only on $\| a ∩ a' \|$.
    Conditional on $m$, the two subsets choose independent $g$-subsets of the $h$ internal pairs.
    If the second choice replaces exactly $j$ pairs of the first, their intersection has size $s + 2 \( g - j \) =
    w - 2 j$. The probability of this event is
  $ P_j = frac(binom(g, j) binom(h - g, j), binom(h, g)) \, wide 0 lt.eq j lt.eq g_(*) := min \( g \, h - g \) . $
  For two independent uniform elements of $X$, the probability of the same intersection size is
  $ Q_j = frac(binom(w, 2 j) binom(k - w, 2 j), binom(k, w)) . $
  Both laws are uniform within each intersection class. The density there is therefore $P_j \/ Q_j$,
    and it vanishes on the remaining classes. The identities $w = 2 g + s$ and $k - w =
    2 \( h - g \) + \( d - s \)$ ensure that every displayed $Q_j$ is positive. Equation (2.7) becomes
  #[#set math.equation(numbering: n => "(2.8)")
   $ "tr" \( K^2 \) = sum_(j = 0)^(g_(*)) P_j^2 / Q_j = binom(k, w) /
     binom(h, g)^2 sum_(j = 0)^(g_(*)) frac(binom(g, j)^2 binom(h - g, j)^2, binom(w, 2 j) binom(k - w, 2 j)) .
     $ <local:trace-formula>]
  #emph[A trace estimate.] Since $k = 2 h + d$, $w = k \/ 2 + O \( 1 \)$, and $g = h \/ 2 + O_d \( 1 \)$,
    the central binomial estimates give
  #[#set math.equation(numbering: n => "(2.9)")
   $ binom(k, w) / binom(h, g)^2 = O_d \( sqrt(h) \) \, $ <local:central-ratio>]
  uniformly in $b$ and $y$. Moreover, $binom(w, 2 j) gt.eq binom(2 g, 2 j)$ and $binom(k - w, 2 j) gt.eq
    binom(2 \( h - g \), 2 j)$. For integers $0 lt.eq j lt.eq u$, the identity
  $ binom(u, j)^2 / binom(2 u, 2 j) = frac(binom(2 j, j) binom(2 \( u - j \), u - j), binom(2 u, u)) $
  and the bounds $binom(2 v, v) asymp 4^v \/ sqrt(v + 1)$ imply
  #[#set math.equation(numbering: n => "(2.10)")
   $ binom(u, j)^2 / binom(2 u, 2 j) lt.eq C sqrt(frac(u + 1, \( j + 1 \) \( u - j + 1 \))) $ <local:binomial-ratio>]
  with an absolute constant $C$, including at the endpoints $j = 0 \, u$.
    Applying this bound with $u = g$ and $u = h - g$ shows that the sum in (2.8) is at most
  $ C^2 sum_(j = 0)^(g_(*)) frac(h + 1, \( j + 1 \) \( g_(*) - j + 1 \)) =
    frac(2 C^2 \( h + 1 \), g_(*) + 2) sum_(j = 1)^(g_(*) + 1) 1 / j . $
  By (2.3), $g_(*) = h \/ 2 + O_d \( 1 \)$, so this is $O_d \( log \( h + 2 \) \)$. Thus
  #[#set math.equation(numbering: n => "(2.11)")
   $ "tr" \( K^2 \) = O_d \( sqrt(h) log \( h + 2 \) \) . $ <local:trace-bound>]
  #emph[From trace to contraction.] We now use permutation symmetry to ensure that every nonconstant eigenvalue
    contributes many times to the trace. This is the multiplicity principle used, in a different setting,
    in #cite(label("gowers")) Lemma 3.2; here an elementary argument suffices.
  We claim that, for even $k gt.eq 6$, every nonzero permutation-invariant subspace $V subset.eq
    bb(R)^X$ orthogonal to the constants has dimension at least $k \/ 2$.
    Choose $k \/ 2$ disjoint transpositions of the vertices. Their actions on $V$ are commuting orthogonal
    involutions, so they admit simultaneous diagonalization with sign patterns in ${ 1 \, - 1 }^(k \/ 2)$.
    If a nonzero simultaneous eigenspace has a pattern with $j$ negative signs, where $0 < j < k \/ 2$,
    permutations of the vertex pairs give $binom(k \/ 2, j)$ distinct patterns.
    Their eigenspaces are linearly independent, whence $dim V gt.eq binom(k \/ 2, j) gt.eq k \/ 2$.
  Otherwise every occurring pattern is constant, and the product of any two of the chosen transpositions acts as
    the identity on $V$. Invariance of $V$ under all permutations implies the same for every product of two
    disjoint transpositions. Given five distinct labels $a \, b \, c \, e \, f$, the identity
  $ \[ \( a b \) \( e f \) \] thin \[ \( b c \) \( e f \) \] = \( a b \) \( b c \) $
  then shows that every three-cycle acts as the identity. Thus the alternating group fixes $V$ pointwise.
    It is transitive on $X$: a permutation taking one $w$-subset to another can have its parity corrected by a
    transposition inside the latter subset or its complement.
    Such a transposition exists for the present values of $k$ and $w$.
    Every function on $X$ invariant under the alternating group is therefore constant,
    contrary to the choice of $V$. This proves the claim.
  The permutation invariance of the kernel means that $K$ commutes with every vertex permutation.
    Each full eigenspace of its restriction to the orthogonal complement of the constants is therefore an
    invariant subspace of the kind just considered. Writing $mu$ for the largest eigenvalue on that complement,
    positive semidefiniteness and (2.11) imply
  $ k / 2 mu^2 lt.eq "tr" \( K^2 \) - 1 \, wide mu = O_d #scale(x: 120%, y: 120%)[\(] k^(- 1 \/ 4)
    sqrt(log \( k + 2 \)) #scale(x: 120%, y: 120%)[\)] . $
  For $B_0 = B - bb(E)_a B \( a \)$, it follows that
  $ bb(E)_m \| \( T B \) \( m \) - bb(E)_a B \( a \) \|^2 = chevron.l B_0 \, K B_0 chevron.r lt.eq
    mu thin bb(E)_a \| B_0 \( a \) \|^2 . $
  All estimates were uniform in $b$ and $y$, so a single choice of $theta_d \( k \)$ proves (2.5).
    Summing that inequality over the entries of a matrix proves (2.6), with exactly the same constant. ◻
]

The matrix estimate also applies after fixing auxiliary data,
  provided that the conditional law of $m$ given those data is uniform on $cal(M)$.
  The data may specify any matrix-valued function $B$ on $X$:
  fixing them must determine the whole function before $m$ is sampled,
  but the dependence of $B \( a \)$ on $a$ is unrestricted. The lemma then applies separately at each fixing.
  Thus conditioning on other cells may select an arbitrary function on the present cell;
  averaging the resulting inequalities introduces no factor depending on its matrix dimensions.

== 3 Orthogonal splitting of positive semidefinite matrices <sec:splitting>

The next lemma turns small pairwise overlaps of positive semidefinite matrices into an orthogonal decomposition of
  their common ambient space. Each summand of the decomposition is assigned one matrix,
  and the lemma controls the total squared norm of the other matrices compressed to that summand.
  The bound depends on the number of matrices, but not on their dimension.
  We will apply it to Gram matrices of Fourier coefficients.

#thm([Lemma 3.1.])[
  (Orthogonal splitting).  #emph[Let $A_1 \, dots.h \, A_L$ be real symmetric positive semidefinite matrices on a
    finite-dimensional Euclidean space. There are mutually orthogonal projections $P_1 \, dots.h \,
    P_L$ such that $sum_(s = 1)^L P_s = I$ and
#[#set math.equation(numbering: n => "(3.1)")
 $ sum_(z = 1)^L sum_(s eq.not z) ∥P_s A_z P_s∥_(upright(F))^2 lt.eq
   C_L sum_(z eq.not z') "tr" \( A_z A_(z') \) \, wide C_L = 2^(L - 1) . $ <eq:orthogonal-splitting>]

 The sum on the right is over ordered pairs of distinct indices. Zero projections are allowed.]
] <lem:splitting>

#proof[
  We first record the two-matrix estimate that gives the decomposition.
    For positive semidefinite $A \, B$, let $P$ be the spectral projection of $A -
    B$ onto its nonnegative eigenspaces, and let $Q = I - P$.
    This is the same spectral projection used in binary quantum discrimination #cite(label("helstrom"));
    here we need a bound on squared Frobenius norms of the compressed matrices.
    In the block decomposition associated with $P$ and $Q$, write $A = \( A_(u v) \)_(u \, v = 1)^2$ and
    $B = \( B_(u v) \)_(u \, v = 1)^2$. Since $P$ commutes with $A - B$, we have $A_12 = B_12$,
    $A_11 succ.curly.eq B_11$, and $B_22 succ.curly.eq A_22$. Thus
  #[#set math.equation(numbering: n => "(3.2)")
   $ "tr" \( A B \) & = "tr" \( A_11 B_11 \) + "tr" \( A_22 B_22 \) + 2 ∥A_12∥_(upright(F))^2\
 & gt.eq ∥P B P∥_(upright(F))^2 + ∥Q A Q∥_(upright(F))^2 . $ <eq:two-matrix-splitting>]
  Here we used the nonnegativity of the trace of a product of two positive semidefinite matrices.
  We now induct on $L$. The assertion for $L = 1$ holds with $P_1 = I$.
    For $L gt.eq 2$, apply the preceding construction to $A = A_1$ and $B = sum_(j = 2)^L A_j$, and put $P_1 = P$.
    Apply the induction hypothesis to the compressions $Q A_j Q$, $2 lt.eq j lt.eq L$, on the range of $Q$.
    Extend the resulting projections by zero on the range of $P$, obtaining $P_2 \, dots.h \,
    P_L$ on the original space.
  The terms on the left of (3.1) involving either $P_1$ or $A_1$ have sum at most
  #[#set math.equation(numbering: n => "(3.3)")
   $ sum_(j = 2)^L ∥P A_j P∥_(upright(F))^2 + sum_(s = 2)^L ∥P_s A_1 P_s∥_(upright(F))^2 lt.eq ∥P B
     P∥_(upright(F))^2 + ∥Q A_1 Q∥_(upright(F))^2 lt.eq "tr" \( A_1 B \) . $ <eq:splitting-first-label>]
  The first inequality uses nonnegative pairwise trace products in the first sum and the orthogonal block
    decomposition of $Q A_1 Q$ in the second. To bound the overlaps introduced by compression,
    observe that for distinct $j \, j' gt.eq 2$,
  #[#set math.equation(numbering: n => "(3.4)")
   $ "tr" \( A_j Q A_(j') Q \) & = ∥A_j^(1 \/ 2) Q A_(j')^(1 \/ 2)∥_(upright(F))^2\
 & lt.eq 2 "tr" \( A_j A_(j') \) + 2 "tr" \( A_j P A_(j') P \) . $ <eq:compressed-overlap>]
  This is the squared triangle inequality applied to $Q = I - P$. Moreover,
  $ sum_(j \, j' gt.eq 2\
j eq.not j') "tr" \( A_j P A_(j') P \) lt.eq ∥P B P∥_(upright(F))^2 lt.eq "tr" \( A_1 B \) . $
  Combining these estimates with the induction hypothesis bounds the left side of (3.1) by
  $ \( 1 + 2 C_(L - 1) \) "tr" \( A_1 B \) + 2 C_(L - 1) sum_(j \, j' gt.eq 2\
j eq.not j') "tr" \( A_j A_(j') \) . $
  The full ordered overlap sum is $2 "tr" \( A_1 B \) + sum_(j eq.not j' \, thin j \, j' gt.eq 2)
    "tr" \( A_j A_(j') \)$. Since $C_(L - 1) gt.eq 1$, the preceding bound is at most $2
    C_(L - 1)$ times this sum. Taking $C_L = 2 C_(L - 1)$ completes the induction. ◻
]

== 4 Fourier concentration of squares under product averages <sec:fourier>

We next show how averaging a positive semidefinite matrix-valued function can produce a representation by squares
  whose Fourier coefficients concentrate around a separate center for each square.
  The assumption is a scalar variance bound for each coordinate average.
  This bound extends to matrix-valued functions with the same constant.
  We will use it to control a fourth-order Gram potential and then convert that bound into an estimate on the
  Fourier coefficients.

Fix an integer $a gt.eq 1$, put $L = 2^a$, and identify each of $Y_1 \, dots.h \,
  Y_t$ with the additive group $\( bb(F)_2 \)^a$. We use a second copy $Lambda = \( bb(F)_2 \)^a$ to index its
  characters. For $p = \( p_1 \, dots.h \, p_t \) in Lambda^t$ and $y = \( y_1 \, dots.h \, y_t \) in product_i
  Y_i$, define

$ chi_p \( y \) = \( - 1 \)^(sum_(i = 1)^t p_i dot.op y_i) \, $

where the inner products and the exponent are computed modulo two.
  These real characters form an orthonormal basis for uniform probability on $product_i Y_i$.
  For a real matrix-valued function $H$, write

$ hat(H)_p = bb(E)_y \[ chi_p \( y \) H \( y \) \] \, wide H \( y \) = sum_(p in Lambda^t) hat(H)_p chi_p \( y \) . $

The block degree of $chi_p$ is $\| { i : p_i eq.not 0 } \|$.
  A function has block degree at most $D$ if its Fourier coefficients vanish at every character of block degree
  greater than $D$; this convention includes the zero function.
  We also write $"dist" \( p \, q \) = \| { i : p_i eq.not q_i } \|$.
  Multiplication by $chi_q$ translates frequency $p$ to $p + q$, whose block degree is $"dist" \( p \, q \)$.
  In particular, a real function supported within distance $D$ of $q$ becomes a function of block degree at most
  $D$ after this multiplication, with its square unchanged.
  This translation of Fourier support while preserving squares also appears in the construction of sparse sums of
  squares on finite abelian groups by Fawzi, Saunderson, and Parrilo #cite(label("fsp-sparse")).

#thm([Theorem 4.1.])[
  (Fourier smoothing of matrix squares).  #emph[Let $t \, r gt.eq 1$ be integers.
    For each $1 lt.eq i lt.eq t$, let $X_i$ and $cal(M)_i$ be nonempty finite sets with uniform probability,
    and let $Y_i$ be a specified copy of $\( bb(F)_2 \)^a$, where $a gt.eq 1$ and $L = 2^a$.
    For $m in cal(M)_i$ and $y in Y_i$, let $pi_(i \, y)^m$ be a probability distribution on $X_i$.
    Suppose that, for some $theta gt.eq 0$, these distributions satisfy
#[#set math.equation(numbering: n => "(4.1)")
 $ bb(E)_(m in cal(M)_i) pi_(i \, y)^m \( x \) = frac(1, \| X_i \|) wide \( x in X_i \, y in Y_i \)
   $ <eq:channel-marginal>]

 and, for every real function $g : X_i arrow.r bb(R)$ and every $y in Y_i$,
#[#set math.equation(numbering: n => "(4.2)")
 $ bb(E)_(m in cal(M)_i) (sum_(x in X_i) pi_(i \, y)^m \( x \) g \( x \) - bb(E)_(x in X_i) g \( x \))^2 lt.eq
   theta bb(E)_(x in X_i) g \( x \)^2 . $ <eq:channel-variance>]

 Let $F : product_i X_i arrow.r bb(S)_(+)^r$ satisfy $"tr" F \( x \) lt.eq B$ for all $x$,
   where $B > 0$ and $bb(S)_(+)^r$ is the cone of real symmetric positive semidefinite $r$-by-$r$ matrices.
   Fix $lambda > 1$ such that
#[#set math.equation(numbering: n => "(4.3)")
 $ L lambda^2 C_L theta lt.eq 1 \, $ <eq:smoothing-parameter>]

 where $C_L = 2^(L - 1)$ is the constant of Lemma 4. For $m = \( m_1 \, dots.h \, m_t \) in product_i cal(M)_i$, define
#[#set math.equation(numbering: n => "(4.4)")
 $ overline(F)_m \( y \) = sum_(x in product_i X_i) (product_(i = 1)^t pi_(i \, y_i)^(m_i) \( x_i \)) F \( x \) .
   $ <eq:product-average>]

]
  #emph[There is a finite integer $R$ and a family of functions $H_q^m : product_i Y_i arrow.r bb(R)^(R times r)$,
    indexed by $m in product_i cal(M)_i$ and $q in Lambda^t$, such that
#[#set math.equation(numbering: n => "(4.5)")
 $ overline(F)_m \( y \) = sum_(q in Lambda^t) H_q^m \( y \)^(sans(T)) H_q^m \( y \) . $ <eq:smoothing-squares>]

 For each $m \, q$, form the horizontal concatenation and its Gram matrix
#[#set math.equation(numbering: n => "(4.6)")
 $ U_q^m = [lambda^("dist" \( q \, p \) \/ 2) hat(H)_(q \, p)^m]_(p in Lambda^t) \, wide C_q^m =
   U_q^m \( U_q^m \)^(sans(T)) \, $ <eq:smoothing-gram>]

 where $hat(H)_(q \, p)^m$ is the Fourier coefficient of $H_q^m$ at $p$.
   The family can be chosen so that, for independent uniform $m_i$,
#[#set math.equation(numbering: n => "(4.7)")
 $ bb(E)_m sum_(q in Lambda^t) ∥C_q^m∥_(upright(F))^2 lt.eq 2^t B^2 . $ <eq:smoothing-potential>]

 Consequently, at least one $m$ satisfies
#[#set math.equation(numbering: n => "(4.8)")
 $ sum_(q \, p in Lambda^t) lambda^("dist" \( q \, p \)) ∥hat(H)_(q \, p)^m∥_(upright(F))^2 lt.eq
   L^t sqrt(r) thin B thin 2^(t \/ 2) . $ <eq:smoothing-coefficients>]

]
] <thm:fourier-smoothing>

The weights in (4.8) penalize frequencies far from the center $q$ of their branch.
  To explain the potential, fix $m \, q$, suppress these indices, and put $w_p = lambda^("dist" \( q \, p \))$. Then

$ "tr" C = sum_p w_p ∥hat(H)_p∥_(upright(F))^2 \, wide ∥C∥_(upright(F))^2 =
  sum_(p \, p') w_p w_(p') ∥hat(H)_p^(sans(T)) hat(H)_(p')∥_(upright(F))^2 . $

Thus the trace measures the weighted Fourier mass we want to bound,
  whereas the squared Frobenius norm measures squared overlaps of coefficient matrices.
  The latter quantity matches the squared norm in the variance assumption.

We prove the theorem by processing the coordinates in order.
  A direct sum of squares realizes each new average, and Lemma 4 separates its new frequencies into branches.
  We bound the increase of the Gram potential at each step,
  then use the ranks of the final Gram matrices to bound their traces.

#proof[
  For a matrix-valued function $Z$ on $X_i$, use the notation
  $ T_(i \, y) Z \( m \) = sum_(x in X_i) pi_(i \, y)^m \( x \) Z \( x \) . $
  Applying (4.2) to each entry and summing gives
  #[#set math.equation(numbering: n => "(4.9)")
   $ bb(E)_m ∥T_(i \, y) Z \( m \) - bb(E)_x Z \( x \)∥_(upright(F))^2 lt.eq
     theta bb(E)_x ∥Z \( x \)∥_(upright(F))^2 . $ <eq:matrix-channel-variance>]
  This inequality holds in every finite matrix dimension, with the same $theta$.
  ===== 4.1 Partial averages and the potential. <partial-averages-and-the-potential.>
  Use the abbreviations $m_(lt.eq i) = \( m_1 \, dots.h \, m_i \)$ and
    $x_(> i) = \( x_(i + 1) \, dots.h \, x_t \)$, and likewise for $y$. At stage $i$ we construct functions
  $ H_q^(\( i \)) \( y_(lt.eq i) \; x_(> i) \) \, wide q in Lambda^i \, $
  depending also on $m_(lt.eq i)$, such that
  #[#set math.equation(numbering: n => "(4.10)")
   $ sum_(q in Lambda^i) \( H_q^(\( i \)) \)^(sans(T)) H_q^(\( i \)) =
     sum_(x_(lt.eq i)) (product_(j = 1)^i pi_(j \, y_j)^(m_j) \( x_j \)) F \( x \) . $ <eq:partial-squares>]
  All matrices at stage $i$ have a common row dimension $R_i$ and $r$ columns.
    Their Fourier coefficients refer only to the processed variables $y_(lt.eq i)$. Define
  #[#set math.equation(numbering: n => "(4.11)")
   $ U_q^(\( i \)) = [lambda^("dist" \( q \, p \) \/ 2) hat(H)_(q \, p)^(\( i \))]_(p in Lambda^i) \, wide
     C_q^(\( i \)) = U_q^(\( i \)) \( U_q^(\( i \)) \)^(sans(T)) . $ <eq:partial-gram>]
  Thus $U_q^(\( i \))$ has $r L^i$ columns and is a function of $x_(> i)$. The potential is
  $ Phi_i = bb(E)_(m_(lt.eq i) \, x_(> i)) sum_(q in Lambda^i) ∥C_q^(\( i \))∥_(upright(F))^2 \, $
  where all listed variables are independent and uniform. At stage zero take $R_0 = r$ and $H_diameter^(\( 0 \)) =
    F^(1 \/ 2)$. Then $C_diameter^(\( 0 \)) = F$, so $Phi_0 lt.eq bb(E)_x \( "tr" F \( x \) \)^2 lt.eq B^2$.
    We will prove $Phi_(i + 1) lt.eq 2 Phi_i$ while preserving (4.10).
  ===== 4.2 Realizing one more average. <realizing-one-more-average.>
  Fix $m_(lt.eq i)$, a branch $q in Lambda^i$, and $x_(> i + 1)$.
    For the new coordinate abbreviate $X_(i + 1) \, Y_(i + 1) \, m_(i + 1)$ by $X \, Y \, m$,
    and write its input as $x$ and its character variable as $y$.
    The old concatenation is now a matrix function $U \( x \) = U_q^(\( i \)) \( x \; x_(> i + 1) \)$. Put
  $ Z \( x \) = U \( x \)^(sans(T)) U \( x \) . $
  It has size $r L^i$ by $r L^i$, and
  #[#set math.equation(numbering: n => "(4.12)")
   $ ∥Z \( x \)∥_(upright(F))^2 = ∥C_q^(\( i \)) \( x \)∥_(upright(F))^2 . $ <eq:two-gram-norms>]
  The fixed data determine the entire function $x mapsto U \( x \)$ before the new averaging parameter $m$ is chosen.
  For a fixed $m$, form a matrix-valued function $H'$ with $R_(i + 1) = L \| X \| R_i$ rows.
    We give different values of $y$ disjoint row blocks by indexing those blocks with $\( y' \, x \) in Y times
    X$. This extra label will eliminate products between different $y$-values from the Fourier overlap calculation
    below. The block at $\( y' \, x \)$ is
  #[#set math.equation(numbering: n => "(4.13)")
   $ H' \( y_(lt.eq i) \, y \)_(\( y' \, x \)) = upright(bold(1))_({ y' = y }) sqrt(pi_y^m \( x \)) thin
     H_q^(\( i \)) \( y_(lt.eq i) \; x \, x_(> i + 1) \) . $ <eq:tagged-stack>]
  Consequently,
  $ H' ""^(sans(T)) H' = sum_(x in X) pi_y^m \( x \) H_q^(\( i \)) \( y_(lt.eq i) \; x \, x_(> i + 1) \)^(sans(T))
    H_q^(\( i \)) \( y_(lt.eq i) \; x \, x_(> i + 1) \) . $
  This stack performs the new average. We next split its space of row coordinates in a way that controls its
    Fourier coefficients.
  For $z in Lambda$, concatenate the Fourier coefficients of $H'$ at $\( p \, z \)$, using only the old weights:
  $ V_z = [lambda^("dist" \( q \, p \) \/ 2) hat(H)'_(p \, z)]_(p in Lambda^i) \, wide A_z = V_z V_z^(sans(T)) . $
  The $\( y' \, x \)$ row block of $V_z$ is $L^(- 1) chi_z \( y' \) sqrt(pi_(y')^m \( x \)) U \( x \)$.
    Multiplying the stacked matrices therefore gives the identity
  #[#set math.equation(numbering: n => "(4.14)")
   $ V_z^(sans(T)) V_(z') = 1 / L^2 sum_(y in Y) chi_z \( y \) chi_(z') \( y \) T_(i + 1 \, y) Z \( m \) .
     $ <eq:new-frequency-overlap>]
  In particular, $"tr" \( A_z A_(z') \) = ∥V_z^(sans(T)) V_(z')∥_(upright(F))^2$.
  ===== 4.3 The overlap estimate. <the-overlap-estimate.>
  For $z = z'$, Jensen’s inequality and (4.1) applied to (4.14) give
  $ bb(E)_m "tr" \( A_z^2 \) lt.eq 1 / L^2 bb(E)_x ∥Z \( x \)∥_(upright(F))^2 . $
  For $z eq.not z'$, let $mu = bb(E)_x Z \( x \)$. Character orthogonality permits subtracting $mu$ from every
    summand in (4.14). Jensen’s inequality and (4.9) now give
  $ bb(E)_m "tr" \( A_z A_(z') \) & lt.eq 1 / L^2 bb(E)_y bb(E)_m ∥T_(i + 1 \, y) Z \( m \) - mu∥_(upright(F))^2\
 & lt.eq theta / L^2 bb(E)_x ∥Z \( x \)∥_(upright(F))^2 . $
  Together with (4.12), these estimates say that
  #[#set math.equation(numbering: n => "(4.15)")
   $ bb(E)_m "tr" \( A_z A_(z') \) lt.eq 1 / L^2 bb(E)_x ∥C_q^(\( i \)) \( x \)∥_(upright(F))^2
     cases(delim: "{", 1 \, & z = z' \,, theta \, & z eq.not z' .) $ <eq:overlap-summary>]
  The new frequency Gram matrices thus have small total overlap in expectation.
    We can now use Lemma 4 to assign them to separate branches, charging the misplaced compressions to this overlap.
  ===== 4.4 Splitting the stack and updating the weights. <splitting-the-stack-and-updating-the-weights.>
  For each $m$, apply Lemma 4 to $\( A_z \)_(z in Lambda)$, obtaining projections $\( P_s \)_(s in Lambda)$. Define
  $ H_(\( q \, s \))^(\( i + 1 \)) = P_s H' . $
  Since $sum_s P_s = I$ and $P_s^2 = P_s = P_s^(sans(T))$, we have
    $sum_s \( H_(\( q \, s \))^(\( i + 1 \)) \)^(sans(T)) H_(\( q \, s \))^(\( i + 1 \)) = H' ""^(sans(T)) H'$.
    Summing over $q$ proves (4.10) at the new stage.
  These projections may depend on $m_(lt.eq i + 1)$ and $x_(> i + 1)$,
    but they do not depend on any processed variable $y_(lt.eq i + 1)$.
    Hence they commute with taking the Fourier coefficients in these variables.
    We retain all $R_(i + 1)$ rows of every projected matrix,
    even when the ranks of the projections vary with the remaining inputs.
    This gives a common coordinate system for every branch at every value of those inputs.
    Since all sets are finite, the choices of projections for all histories and remaining inputs can be made
    simultaneously, using no future averaging parameters.
  The new distance satisfies $"dist" \( \( q \, s \) \, \( p \, z \) \) = "dist" \( q \, p \) +
    upright(bold(1))_({ s eq.not z })$. The Gram matrix with the new weights is therefore
  $ C_(\( q \, s \))^(\( i + 1 \)) = sum_(z in Lambda) lambda^(upright(bold(1))_({ s eq.not z })) P_s A_z P_s . $
  Cauchy–Schwarz for this sum of $L$ matrices, followed by Lemma 4, gives
  #[#set math.equation(numbering: n => "(4.16)")
   $ sum_s ∥C_(\( q \, s \))^(\( i + 1 \))∥_(upright(F))^2 & lt.eq
     L (sum_z ∥A_z∥_(upright(F))^2 + lambda^2 C_L sum_(z eq.not z') "tr" \( A_z A_(z') \)) . $ <eq:one-step-potential>]
  For the terms with $s = z$ we used $∥P_z A_z P_z∥_(upright(F)) lt.eq ∥A_z∥_(upright(F))$.
    There are $L$ diagonal terms and $L \( L - 1 \)$ ordered off-diagonal terms in (4.15).
    Taking expectation in (4.16) yields
  $ bb(E)_m sum_s ∥C_(\( q \, s \))^(\( i + 1 \))∥_(upright(F))^2 lt.eq
    #scale(x: 120%, y: 120%)[\(] 1 + \( L - 1 \) lambda^2 C_L theta #scale(x: 120%, y: 120%)[\)]
    bb(E)_x ∥C_q^(\( i \)) \( x \)∥_(upright(F))^2 lt.eq 2 bb(E)_x ∥C_q^(\( i \)) \( x \)∥_(upright(F))^2 . $
  This estimate was proved for every fixing of $m_(lt.eq i)$ and $x_(> i + 1)$.
    Under the product probability law, the new $m$ is independent of these variables.
    Although earlier projections can make $Z \( x \)$ an arbitrary function of the current input $x$,
    it is independent of this new $m$, as required when applying (4.9).
    Thus we may sum over $q$ and average over the fixed data to obtain $Phi_(i + 1) lt.eq 2 Phi_i$.
    At $i = t$, this proves (4.5) and (4.7), with $R = R_t$.
  ===== 4.5 From the Gram potential to Fourier mass. <from-the-gram-potential-to-fourier-mass.>
  Choose $m$ with $sum_q ∥C_q^m∥_(upright(F))^2 lt.eq 2^t B^2$.
    Each $U_q^m$ has $r L^t$ columns, so $"rank" \( C_q^m \) lt.eq r L^t$, regardless of its row dimension.
    For a positive semidefinite matrix $C$, $"tr" C lt.eq sqrt("rank" C) thin ∥C∥_(upright(F))$.
    Applying this inequality and then Cauchy–Schwarz over the $L^t$ branches gives
  $ sum_(q \, p) lambda^("dist" \( q \, p \)) ∥hat(H)_(q \, p)^m∥_(upright(F))^2 & = sum_q "tr" C_q^m\
 & lt.eq sqrt(r L^t) sum_q ∥C_q^m∥_(upright(F))\
 & lt.eq sqrt(r L^t) sqrt(L^t) (sum_q ∥C_q^m∥_(upright(F))^2)^(1 \/ 2)\
 & lt.eq L^t sqrt(r) thin B thin 2^(t \/ 2) . $
  This is (4.8). ◻
]

== 5 An expanding parity system <sec:parity>

We now construct a function that is nonnegative on a product of Boolean blocks,
  but is separated from sums of squares of low block degree by a linear functional.
  The blocks record incidence bits of a graph. At each vertex these bits have a prescribed parity,
  and the total prescribed parity is odd. Consequently some edge must have different bits at its two ends.
  The separating functional nevertheless assigns value zero to the number of such disagreements.
  The construction is a block-coordinate version of the low-degree functionals for Tseitin contradictions;
  compare Grigoriev #cite(label("grigoriev")). We give the construction and its positivity proof in full.

Fix the constants

#[#set math.equation(numbering: n => "(5.1)")
 $ d = 100 \, wide beta = 1 / 100 \, wide tau = beta / 10 = 1 / 1000 . $ <eq:parity-constants>]

All edges of the multigraphs below are distinguished, even when they have the same endpoints.
  Cuts and degrees count these edges with their multiplicities.
  For a multigraph $H$ and a set $W$ of its vertices, $delta_H \( W \)$ consists of the edges with exactly one
  endpoint in $W$. Expansion will select a unique small side whenever a cut has few edges;
  this will specify the signs in our functional.

#thm([Lemma 5.1.])[
  (Expanding multigraphs).  #emph[For every sufficiently large even integer $t$,
    there is a bipartite $d$-regular multigraph $H$ on $\[ t \]$ such that
#[#set math.equation(numbering: n => "(5.2)")
 $ \| delta_H \( W \) \| gt.eq beta d min { \| W \| \, t - \| W \| } wide \( W subset.eq \[ t \] \) .
   $ <eq:parity-expansion>]

 In particular, $H$ is connected.]
] <lem:expander>

#proof[
  Write $t = 2 l$, split the vertices into two sets of size $l$,
    and take the union of $d$ independent uniform perfect matchings between the two sides.
    Equivalently, choose $d$ independent uniform permutations of $\[ l \]$.
  It suffices to check vertex sets of size $w lt.eq l$. Fix such a nonempty set $W$,
    containing $a$ vertices on the first side and $b$ on the second, so that $a + b = w$.
    Always $\| delta_H \( W \) \| gt.eq d \| a - b \|$. Thus a failure of (5.2) is possible only when $\| a -
    b \| < .1 w$, in which case
  $ .45 w lt.eq a \, b lt.eq .55 w . $
  If the cut has fewer than $beta d w$ edges, fewer than $.05 d a$ of the $d
    a$ images of the first-side vertices can lie outside the second-side subset:
    indeed their number is at most $beta d w lt.eq \( .01 \/ .45 \) d a < .05 d a$.
  There are at most $exp \( .21 d a \)$ choices for these exceptional images,
    where an image is specified by its domain vertex and permutation label. Here we used
  $ sum_(j lt.eq .05 N) binom(N, j) lt.eq exp #scale(x: 120%, y: 120%)[\(]
    N \[ - .05 log \( .05 \) - .95 log \( .95 \) \] #scale(x: 120%, y: 120%)[\)] lt.eq exp \( .21 N \) . $
  For any prescribed set of nonexceptional images, sampling without replacement within each permutation bounds the
    probability that they all lie in the second-side subset by $\( b \/ l \)$ to their number.
    Independence between permutations therefore gives
  $ Pr #scale(x: 120%, y: 120%)[\[] \| delta_H \( W \) \| < beta d w #scale(x: 120%, y: 120%)[\]] lt.eq
    exp \( .21 d a \) \( .55 w \/ l \)^(.95 d a) . $
  The exponent $.21 + .95 log \( .55 w \/ l \)$ is negative.
    Using $d a gt.eq 45 w$ and $binom(2 l, w) lt.eq \( 2 e l \/ w \)^w$,
    a union bound over all sets of size $w$ is consequently at most
  $ exp #h(-0.16667em)
    (w [log \( 2 e \) + 45 #scale(x: 120%, y: 120%)[\(] .21 + .95 log \( .55 \) #scale(x: 120%, y: 120%)[\)] +
    41.75 log \( w \/ l \)]) lt.eq e^(- 8 w) . $
  The last inequality uses $w \/ l lt.eq 1$ and $log \( 2 e \) + 45 \( .21 + .95 log \( .55 \) \) < - 8$;
    all logarithms here are natural. Since $sum_(w gt.eq 1) e^(- 8 w) < 1$,
    some choice of the permutations satisfies (5.2). A nontrivial connected component would have an empty cut,
    so the expansion inequality also gives connectivity. ◻
]

Fix a graph $H$ as in Lemma 6, and order the $d$ incidences at each vertex.
  Choose bits $b_1 \, dots.h \, b_t$ with odd sum; one may take $b_1 = 1$ and $b_i = 0$ for $i > 1$. At vertex $i$, let

#[#set math.equation(numbering: n => "(5.3)")
 $ Y_i = {y_i in { 0 \, 1 }^d : sum_(j = 1)^d y_(i \, j) = b_i med \( mod med 2 \)} \, wide Y =
   product_(i = 1)^t Y_i . $ <eq:parity-domain>]

The first $d - 1$ bits of $y_i$ are free and determine the last one.
  Thus each $Y_i$ is an affine Boolean cube of size $L = 2^(d - 1)$, equipped with uniform probability.

We use the block characters of Section 4 in these free coordinates.
  Explicitly, set $Lambda = { 0 \, 1 }^(d - 1)$, with coordinatewise addition modulo two and zero element $0$.
  For $p = \( p_1 \, dots.h \, p_t \) in Lambda^t$, define

$ chi_p \( y \) = \( - 1 \)^(sum_(i = 1)^t sum_(j = 1)^(d - 1) p_(i \, j) y_(i \, j)) \,
  wide \| p \|_(upright("blk")) = \| { i : p_i eq.not 0 } \| . $

These characters form an orthonormal basis for real functions on $Y$.
  A function has #emph[block degree at most $D$] if its Fourier coefficients vanish for $\| p \|_(upright("blk")) > D$.

For an edge $e = u v$, denote its two incidence bits by $y_(u \, e)$ and $y_(v \, e)$. Given $epsilon.alt > 0$, define

#[#set math.equation(numbering: n => "(5.4)")
 $ f_epsilon.alt \( y \) = sum_(e = u v in E \( H \)) upright(bold(1))_({ y_(u \, e) eq.not y_(v \, e) }) -
   epsilon.alt . $ <eq:parity-function>]

The sum of the disagreement indicators is odd. Indeed, modulo two it equals the sum of all incidence bits,
  and $sum_i b_i equiv 1 med \( mod med 2 \)$. In particular, $f_epsilon.alt gt.eq 1 -
  epsilon.alt > 0$ when $0 < epsilon.alt < 1$.

#thm([Proposition 5.2.])[
  (A functional separating low-degree squares).  #emph[For every sufficiently large even $t$, let $H$, $Y$,
    and $f_epsilon.alt$ be as above, and put $D = floor.l tau t floor.r$.
    There is a real linear functional $cal(D)$ on the space of all real functions on $Y$ such that
#[#set math.equation(numbering: n => "(5.5)")
 $ cal(D) \( 1 \) & = 1 \,\
cal(D) \( g^2 \) & gt.eq 0 &  & upright("if ") g upright(" has block degree at most ") D \,\
cal(D) \( f_epsilon.alt \) & = - epsilon.alt &  & \( epsilon.alt > 0 \) \,\
\| cal(D) \( h \) \| & lt.eq L^t ∥h∥_oo &  & upright("for every real function ") h upright(" on ") Y .
  $ <eq:parity-functional-one>]

]
] <prop:parity-functional>

#proof[
  We specify $cal(D)$ on characters. First map any set of incidences to the edges having an odd number of
    incidences in that set. A character index $p$ selects the incidences $\( i \, j \)$ for which $j <
    d$ and $p_(i \, j) = 1$; denote their image by $E \( p \) subset.eq E \( H \)$.
    This incidence map is linear over $bb(F)_2$, so
  $ E \( p + p' \) = E \( p \) triangle.stroked.t E \( p' \) \, $
  where $triangle.stroked.t$ denotes symmetric difference.
  If incidence signs agreed across every edge, $chi_p$ would be the product of the edge signs on $E \( p \)$.
    Multiplying the vertex parity identities over a set $S$ would prescribe the sign
    $\( - 1 \)^(sum_(i in S) b_i)$ for the product on $delta_H \( S \)$:
    the signs of edges internal to $S$ occur twice and cancel.
    Complementary sides of a cut prescribe opposite signs because the total prescribed parity is odd.
    When $E \( p \)$ is a cut and $p$ has low block degree, expansion selects a unique small side and hence a
    value for the functional.
  #emph[Choosing the values on characters.] Suppose that $\| p \|_(upright("blk")) lt.eq
    2 D$ and that $E \( p \)$ is a cut of $H$. Since $\| E \( p \) \| lt.eq 2 D d$,
    expansion gives a side $S \( p \)$ of this cut with
  #[#set math.equation(numbering: n => "(5.6)")
   $ \| S \( p \) \| lt.eq frac(2 D, beta) lt.eq frac(2 tau t, beta) = t / 5 . $ <eq:parity-small-side>]
  This side is unique: connectivity implies that two vertex sets with the same cut are equal or complementary. Define
  #[#set math.equation(numbering: n => "(5.7)")
   $ cal(D) \( chi_p \) =
     cases(delim: "{", \( - 1 \)^(sum_(i in S \( p \)) b_i) \, & \| p \|_(upright("blk")) lt.eq 2 D
     upright(" and ") E \( p \) upright(" is a cut") \,, 0 \, & upright("otherwise") .)
     $ <eq:parity-functional-definition>]
  Extending linearly defines $cal(D)$ on every real function on $Y$.
    The trivial character has $S \( 0 \) = diameter$, so $cal(D) \( 1 \) = 1$.
  #emph[Positivity on low-degree squares.] Let $cal(I)_D = { p in Lambda^t : \| p \|_(upright("blk")) lt.eq D }$,
    and consider the matrix
  $ M_(p \, p') = cal(D) \( chi_p chi_(p') \) = cal(D) \( chi_(p + p') \) wide \( p \, p' in cal(I)_D \) . $
  The cut sets of $H$ form a vector subspace of $bb(F)_2^(E \( H \))$.
    Partition $cal(I)_D$ according to the coset of this subspace containing $E \( p \)$.
    Entries between different classes are zero. Within a class every entry is a sign, and every diagonal entry is one.
  To show that such a block is positive semidefinite, take any three indices $p_1 \, p_2 \, p_3$ in it.
    Each pair sum has block degree at most $2 D$, and so has a small cut side $S_(a b) = S \( p_a + p_b \)$.
    Linearity of both the incidence map and the cut map gives
  $ delta_H \( S_12 triangle.stroked.t S_23 triangle.stroked.t S_31 \) = diameter . $
  The set inside the cut has size at most $3 t \/ 5 < t$, by (5.6). Connectivity forces it to be empty. Therefore
  $ M_(p_1 \, p_2) M_(p_2 \, p_3) M_(p_3 \, p_1) = 1 . $
  Fixing a reference index $p_0$ in the class and setting $sigma_p = M_(p \, p_0)$, we obtain $M_(p \, p') =
    sigma_p sigma_(p')$. Each block is thus a rank-one positive semidefinite matrix.
    If $g = sum_(p in cal(I)_D) hat(g) \( p \) chi_p$, it follows that
  $ cal(D) \( g^2 \) = sum_(p \, p' in cal(I)_D) hat(g) \( p \) hat(g) \( p' \) M_(p \, p') gt.eq 0 . $
  #emph[Values on disagreements.] We next show that $cal(D)$ assigns value one to the product of the two bit signs
    on every edge. For a fixed edge $e = u v$, let $T subset.eq { u \,
    v }$ be the endpoints where the incidence of $e$ is in the last position. On $Y_i$ the parity constraint gives
  $ \( - 1 \)^(y_(i \, d)) = \( - 1 \)^(b_i) product_(j = 1)^(d - 1) \( - 1 \)^(y_(i \, j)) . $
  Using this identity at the vertices in $T$, we can write
  $ \( - 1 \)^(y_(u \, e) + y_(v \, e)) = \( - 1 \)^(sum_(i in T) b_i) chi_p \( y \) wide
    upright("with ") \| p \|_(upright("blk")) lt.eq 2 . $
  Before these replacements, the two selected incidences belong to the same edge and give the empty edge set under
    the incidence map. Replacing a last incidence by the other $d -
    1$ incidences toggles the full star at that vertex. Its image under the incidence map is
    $delta_H \( { i } \)$. Hence $E \( p \) = delta_H \( T \)$, including when $u$ and $v$ have parallel edges.
    For sufficiently large $t$, we have $2 lt.eq 2 D$ and $\| T \| lt.eq 2 lt.eq t \/ 5$,
    so $T$ is the small side used in (5.7). The two signs cancel, giving
  $ cal(D) #scale(x: 120%, y: 120%)[\(] \( - 1 \)^(y_(u \, e) + y_(v \, e)) #scale(x: 120%, y: 120%)[\)] = 1 . $
  Since $upright(bold(1))_({ y_(u \, e) eq.not y_(v \, e) }) = \( 1 - \( - 1 \)^(y_(u \, e) + y_(v \, e)) \) \/
    2$, every disagreement indicator has functional value zero.
    This proves $cal(D) \( f_epsilon.alt \) = - epsilon.alt$.
  #emph[Norm bound.] Finally, all $L^t$ character values in (5.7) have absolute value at most one.
    For any real function $h$, uniform orthonormal Fourier expansion gives $hat(h) \( p \) =
    bb(E)_(y in Y) h \( y \) chi_p \( y \)$, and therefore $\| hat(h) \( p \) \| lt.eq ∥h∥_oo$. Thus
  $ \| cal(D) \( h \) \| lt.eq sum_(p in Lambda^t) \| hat(h) \( p \) \| lt.eq L^t ∥h∥_oo \, $
  completing the proof. ◻
]

== 6 From matching factors to low-degree squares <sec:matching>

We now combine the three ingredients: the local restrictions of Lemma 3,
  the product averaging result in Theorem 5, and the separating functional from Proposition 7.
  The vertices of the parity graph will become cells of matching vertices.
  Averaging the row factor within each cell realizes the parity disagreement function exactly.
  The Fourier estimate will then approximate that function by squares on which the separating functional is nonnegative.

#thm([Lemma 6.1.])[
  (Normalization of PSD factors).  #emph[Let $S$ be a finite nonzero nonnegative matrix with entries at most $B$.
    If $S$ admits a real PSD factorization of size $r_0$, it admits one of size $r lt.eq
    r_0$ whose row factors $F_a$ and column factors $G_m$ satisfy
$ "tr" F_a lt.eq B \, wide "tr" G_m lt.eq r . $

]
] <lem:normalization>

#proof[
  Compress to the span of the images of all column factors.
    This preserves their pairings with the row factors and reduces the size to some $r gt.eq 1$.
    The average column factor is positive definite on this span.
    Hence the compact convex hull of the column factors contains a positive definite matrix $J$ maximizing the
    determinant. The one-sided derivative of $log det$ in the direction $G_m - J$ is nonpositive, giving
  $ "tr" \( J^(- 1) G_m \) lt.eq r . $
  Replace the column factors by $J^(- 1 \/ 2) G_m J^(- 1 \/ 2)$ and the row factors by $J^(1 \/ 2) F_a
    J^(1 \/ 2)$. These congruences preserve PSD and trace pairings. The new column traces have the required bound.
    The new row trace is $"tr" \( F_a J \)$, a convex combination of entries of the original row, and is at most $B$. ◻
]

#proof[
  Use the constants $d = 100$, $beta = 1 \/ 100$, and $tau = 1 \/ 1000$ of Section 5, and put $L = 2^(d - 1)$.
    Let $C_L$ be the constant in Lemma 4. First choose $lambda > 1$ so that
  #[#set math.equation(numbering: n => "(6.1)")
   $ lambda^tau gt.eq 64 L^4 . $ <eq:matching-lambda>]
  Next fix an even integer $k$ large enough for the local construction and for
  #[#set math.equation(numbering: n => "(6.2)")
   $ L lambda^2 C_L theta_d \( k \) lt.eq 1 . $ <eq:matching-local-smallness>]
  Lemma 3 permits this choice. These constants are fixed independently of $n$ and $rho$.
  Fix $0 < rho < 1$ and set $epsilon.alt = 1 - rho$. For a large even $n$,
    let $t$ be the largest even integer satisfying $k t lt.eq n$. Then
  #[#set math.equation(numbering: n => "(6.3)")
   $ k t lt.eq n < k \( t + 2 \) . $ <eq:matching-size>]
  Take a $d$-regular bipartite multigraph $H$ on $t$ vertices as in Lemma 6,
    and give its vertices charges $b_i in { 0 \, 1 }$, with exactly one charge equal to one.
    Order the $d$ incidences at each vertex. Write $Y_i$ for the parity-$b_i$ incidence assignments,
    identified with the Boolean group on their first $d - 1$ bits.
  ===== 6.1 Realizing the restrictions by matchings. <realizing-the-restrictions-by-matchings.>
  Partition $k t$ vertices of $K_n$ into cells $C_1 \, dots.h \, C_t$ of size $k$.
    The remaining vertices have even cardinality and will be paired in a fixed way.
    In cell $i$, choose the unique weight $w_i in { k \/ 2 \, k \/ 2 + 1 }$ of parity $b_i$,
    and let $X_i$ be the $w_i$-subsets of $C_i$. For $a = \( a_1 \, dots.h \, a_t \) in product_i X_i$,
    use the odd-cut row
  $ U \( a \) = union.big_i a_i . $
  It is odd because $\| U \( a \) \| equiv sum_i b_i equiv 1 med \( mod med 2 \)$.
  In each cell independently, sample the local column data $m_i$ of Section 2:
    $d$ ordered distinct terminals and a pairing of the other vertices.
    For every auxiliary edge $e = u v$, match the terminal at its incidence in $C_u$ to the terminal at its
    incidence in $C_v$. Together with the internal pairings and the fixed remainder pairing,
    this gives a perfect matching $M \( m \)$. Parallel edges in $H$ use distinct terminals,
    so they cause no conflict. Distinct local data need not give distinct matchings;
    we simply use the factor of the matching they specify.
  For $y = \( y_1 \, dots.h \, y_t \) in product_i Y_i$, apply the local laws $pi_(y_i)^(m_i)$ independently.
    An internal pair has equal cut bits and contributes no crossing. The matched remainder is outside $U \( a \)$.
    An intercell edge crosses exactly when its two terminal bits disagree, as illustrated in Figure 1.
    Thus every cut in the support of the product restriction satisfies
  #[#set math.equation(numbering: n => "(6.4)")
   $ \| M \( m \) ∩ delta \( U \( a \) \) \| - 1 + rho = sum_(e = u v in E \( H \))
     upright(bold(1))_({ y_(u \, e) eq.not y_(v \, e) }) - epsilon.alt = f \( y \) . $ <eq:matching-realization>]
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (3.6, 3.6), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10), radius: 4pt)
  rect((6.3, 0), (9.9, 3.6), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10), radius: 4pt)
  content((1.8, 3.87), [#text(size: 9pt)[cell $C_u$]])
  content((8.1, 3.87), [#text(size: 9pt)[cell $C_v$]])
  line((0.63, 2.7), (1.53, 2.7), (0.63, 0.9), (1.53, 0.9), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((8.37, 2.7), (9.27, 2.7), (8.37, 0.9), (9.27, 0.9), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((0.63, 2.7), radius: 0.08819, fill: rgb("#0000a6"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((1.53, 2.7), radius: 0.08819, fill: rgb("#0000a6"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((0.63, 0.9), radius: 0.08819, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((1.53, 0.9), radius: 0.08819, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((8.37, 2.7), radius: 0.08819, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((9.27, 2.7), radius: 0.08819, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((8.37, 0.9), radius: 0.08819, fill: rgb("#0000a6"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((9.27, 0.9), radius: 0.08819, fill: rgb("#0000a6"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.08, 1.8), [#text(size: 9pt)[internal#linebreak()pairs]])
  content((8.82, 1.8), [#text(size: 9pt)[internal#linebreak()pairs]])
  line((3.15, 2.79), (6.75, 2.79), stroke: (paint: rgb("#a60000"), thickness: 1.2pt, miter-limit: 10))
  content((4.95, 2.79), [#text(size: 9pt)[$e="uv"$: disagreement]], anchor: "south", padding: 0.1176cm)
  line((3.15, 1.8), (6.75, 1.8), (3.15, 0.81), (6.75, 0.81), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((3.15, 2.79), radius: 0.08819, fill: rgb("#0000a6"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((6.75, 2.79), radius: 0.08819, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((3.15, 1.8), radius: 0.08819, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((6.75, 1.8), radius: 0.08819, fill: rgb("#ffffff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((3.15, 0.81), radius: 0.08819, fill: rgb("#0000a6"), stroke: (thickness: 0.4pt, miter-limit: 10))
  circle((6.75, 0.81), radius: 0.08819, fill: rgb("#0000a6"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((2.97, 3.015), [#text(size: 9pt)[$y_(u,e)=1$]], anchor: "south", padding: 0.1176cm)
  content((6.93, 3.015), [#text(size: 9pt)[$y_(v,e)=0$]], anchor: "south", padding: 0.1176cm)
  content((4.95, 0.315), [#text(size: 9pt)[terminal edges]])
})],
    caption: [Figure 1: Part of the matching associated with two cells. Filled vertices belong to the cut and open vertices do not. The restriction gives equal bits to each internal pair, so only terminal edges can cross. The highlighted edge corresponds to a disagreement at an auxiliary edge $e = u v$. Only a few of the $d$ terminals and internal pairs are shown. ],
  ) <fig:matching-cells>
  ===== 6.2 A factorization and its Fourier approximation. <a-factorization-and-its-fourier-approximation.>
  Suppose that $A_n \( rho \)$ has a PSD factorization of size at most $2^t$.
    Its entries are positive and at most $n$. Lemma 8 gives factors of size $r lt.eq 2^t$ with
  $ "tr" F_U lt.eq n \, wide "tr" G_M lt.eq r . $
  Put $F \( a \) = F_(U \( a \))$. For any fixed local column data $m$,
    let $overline(F)_m \( y \)$ be the product-restricted average of $F$. Equation (6.4) gives the exact identity
  #[#set math.equation(numbering: n => "(6.5)")
   $ "tr" #scale(x: 120%, y: 120%)[\(] overline(F)_m \( y \) G_(M \( m \)) #scale(x: 120%, y: 120%)[\)] =
     f \( y \) . $ <eq:matching-pairing>]
  Apply Theorem 5 with the local channels above, the trace bound $B = n$, and Equation (6.2).
    It gives a choice of $m$ and rectangular matrix functions $H_q$, indexed by $q in Lambda^t$, such that
  #[#set math.equation(numbering: n => "(6.6)")
   $ overline(F)_m \( y \) & = sum_q H_q \( y \)^(sans(T)) H_q \( y \) \,\
sum_(q \, p) lambda^("dist" \( q \, p \)) ∥hat(H)_(q \, p)∥_(upright(F))^2 & lt.eq
  L^t sqrt(r) thin n 2^(t \/ 2) . $ <eq:matching-squares>]
  Here $Lambda$ is the character group on $d - 1$ free bits, and $"dist"$ counts differing blocks.
    Fix these data and set $G = G_(M \( m \))$. By Equations (6.5) and (6.6),
  #[#set math.equation(numbering: n => "(6.7)")
   $ f \( y \) = sum_q ∥H_q \( y \) G^(1 \/ 2)∥_(upright(F))^2 . $ <eq:matching-full-squares>]
  Let $D = floor.l tau t floor.r$. In branch $q$, retain only the Fourier coefficients at distance at most $D$
    from $q$, writing
  $ K_q \( y \) = sum_(p : thin "dist" \( q \, p \) lt.eq D) hat(H)_(q \, p) chi_p \( y \) \, wide f_(*) \( y \) =
    sum_q ∥K_q \( y \) G^(1 \/ 2)∥_(upright(F))^2 . $
  The sum of squared norms of the discarded matrices at any $y$ is at most
  #[#set math.equation(numbering: n => "(6.8)")
   $ E_t \( y \)^2 & := sum_q ∥\( H_q \( y \) - K_q \( y \) \) G^(1 \/ 2)∥_(upright(F))^2\
 & lt.eq L^t sum_(q \, p : thin "dist" \( q \, p \) > D) ∥hat(H)_(q \, p) G^(1 \/ 2)∥_(upright(F))^2\
 & lt.eq L^t r lambda^(- tau t) #scale(x: 120%, y: 120%)[\(] L^t sqrt(r) thin n 2^(t \/ 2) #scale(x: 120%, y: 120%)[\)]\
 & lt.eq n (frac(4 L^2, lambda^tau))^t lt.eq n \( 4 L \)^(- 2 t) . $ <eq:matching-tail>]
  The first inequality is Cauchy–Schwarz over at most $L^t$ characters in each branch.
    The second uses $∥∥_(upright("op")) G lt.eq "tr" G lt.eq r$, Equation (6.6),
    and the fact that an integer distance greater than $D$ is greater than $tau t$.
    The last line uses $r lt.eq 2^t$ and Equation (6.1).
  The full stack in Equation (6.7) has norm at most $sqrt(n)$.
    Expanding the difference of the squared norms of that stack and its truncation, and then using Equation (6.8), gives
  #[#set math.equation(numbering: n => "(6.9)")
   $ ∥f - f_(*)∥_oo lt.eq 2 n \( 4 L \)^(- t) + n \( 4 L \)^(- 2 t) . $ <eq:matching-uniform-error>]
  ===== 6.3 The separating functional. <the-separating-functional.>
  In branch $q$, multiplication by the real character $chi_q$ does not change any square.
    It translates a retained frequency $p$ to $p + q$, whose block degree is $"dist" \( p \, q \) lt.eq D$.
    This character translation is the elementary support-shifting principle used in Fourier sums of squares
    #cite(label("fsp-sparse")). Consequently $f_(*)$ is a sum of squares of real functions of block degree at most
    $D$, including after multiplication by the constant matrix $G^(1 \/ 2)$.
  Proposition 7 therefore supplies a functional $cal(D)$ with
  $ cal(D) \( f_(*) \) gt.eq 0 \, wide cal(D) \( f \) = - epsilon.alt . $
  On the other hand, its norm bound and Equation (6.9) give
  $ \| cal(D) \( f - f_(*) \) \| lt.eq 2 n 4^(- t) + n \( 16 L \)^(- t) arrow.r 0 $
  by Equation (6.3), since $k$ is fixed. For sufficiently large $n$, this is smaller than $epsilon.alt$,
    a contradiction.
  We have excluded every factorization of size at most $2^t$.
    For all sufficiently large $n$, Equation (6.3) also gives $t gt.eq n \/ \( 2 k \)$. Thus
  $ upright(r a n k ""_(p s d)) A_n \( rho \) > 2^t gt.eq 2^(n \/ \( 2 k \)) . $
  Taking $c = 1 \/ \( 2 k \)$ proves the theorem. Only the final comparison with $epsilon.alt = 1 -
    rho$ makes the threshold depend on $rho$. ◻
]

== 7 Uniform smoothing of matching averages <sec:matching-smoothing>

This appendix proves an independent smoothing theorem for averages over perfect matchings with prescribed numbers
  of edges between vertex cells. The number of cells is fixed,
  but their sizes and the prescribed counts may vary arbitrarily.
  The conclusion holds even when the prescribed table has very small probability.
  Besides an operator-norm estimate, we obtain a single polynomial that describes all the low-degree averages at a
  given partition.

The proof uses the same comparison between a fourth moment and eigenspace dimensions as Lemma 3.
  Here the inputs are functions of perfect matchings, and removing products of a bounded number of edge indicators
  makes the relevant dimensions grow by an arbitrarily large power of the number of vertices.

Fix a positive integer $ell$. For even $N$, let $cal(X)$ be the perfect matchings on a fixed $N$-element vertex
  set, and let $cal(Z)$ be the ordered partitions into cells of positive sizes $s_1 \, dots.h \, s_ell$,
  with $sum_u s_u = N$. Both spaces carry the uniform probability measure.
  The #emph[table] of a matching at a partition records its internal edge counts $t_(u u)$ and its edge counts
  $t_(u v) = t_(v u)$ between distinct cells. A table is admissible if its entries are nonnegative integers and

#[#set math.equation(numbering: n => "(7.1)")
 $ 2 t_(u u) + sum_(v eq.not u) t_(u v) = s_u wide \( 1 lt.eq u lt.eq ell \) . $ <smooth:eq-table-degrees>]

These conditions suffice: allocate the required endpoints in each cell,
  pair the allocated endpoints between cells, and match the remaining vertices internally.

For an admissible table, define $T_t : L^2 \( cal(X) \) arrow.r L^2 \( cal(Z) \)$ by

$ \( T_t f \) \( Z \) = bb(E) \[ thin f \( M \) divides M upright(" has table ") t upright(" at ") Z thin \] . $

Let $cal(P)_d$ be the span of products of at most $d$ edge indicators $x_e \( M \) =
  upright(bold(1))_({ e in M })$, including the constant, and let $Pi_d$ be its orthogonal projection.

#thm([Theorem 7.1.])[
  (Uniform smoothing).  #emph[For every fixed $ell gt.eq 1$ and $K > 0$, there are an integer $d gt.eq
    1$ and $N_0$ such that, for every even $N gt.eq N_0$, every positive integer cell-size vector summing to $N$,
    and every admissible table,
#[#set math.equation(numbering: n => "(7.2)")
 $ ∥T_t \( I - Pi_d \)∥_(upright("op")) lt.eq N^(- K) . $ <smooth:eq-smoothing>]

 Moreover, for each fixed partition $Z$ and function $f$, the values $\( T_t Pi_d f \) \( Z \)$,
   as $t$ varies over all admissible tables, are given by a single polynomial of total degree at most $d$ in the
   intercell counts $\( t_(u v) \)_(u < v)$.]
] <thm:matching-smoothing>

The approximation error in (7.2) is measured in $L^2 \( cal(Z) \)$,
  with respect to the uniform choice of partition. We prove the analytic estimate by combining a polynomial bound
  on a fourth moment with a lower bound on the dimensions of the permutation representations outside $cal(P)_d$.
  The polynomial assertion will then follow from a direct containment count.

=== 7.1 The fourth moment <the-fourth-moment>

#thm([Lemma 7.2.])[
  #emph[Put $a_ell = ell \( ell + 1 \) + 1$ and $b_ell = 2 a_ell + ell^2$. For every admissible table,
#[#set math.equation(numbering: n => "(7.3)")
 $ "tr" #scale(x: 120%, y: 120%)[\(] \( T_t^(*) T_t \)^2 #scale(x: 120%, y: 120%)[\)] lt.eq
   e^(2 a_ell) \( N + 1 \)^(b_ell) . $ <smooth:eq-fourth-moment>]

]
] <smooth:lem-fourth-moment>

#proof[
  Write $h = N \/ 2$. For a fixed matching, the number of partitions giving it table $t$ is
  $ D_t = frac(h !, product_(u lt.eq v) t_(u v) !) thin 2^(sum_(u < v) t_(u v)) \, wide \| cal(Z) \| =
    frac(N !, product_u s_u !) . $
  The first formula assigns cell types to the $h$ edges and chooses which endpoint occupies which cell for each
    intercell edge. Permutation transitivity shows that the table probability is $p_t = D_t \/ \| cal(Z) \|$,
    whether the matching or the partition is fixed. Thus the density kernel of $T_t$,
    relative to the uniform measures, is the table indicator divided by $p_t$.
  Let $J \( M \, M' \)$ count partitions giving table $t$ to both matchings.
    The density kernel of $cal(A) = T_t^(*) T_t$ is consequently
  #[#set math.equation(numbering: n => "(7.4)")
   $ kappa \( M \, M' \) = frac(\| cal(Z) \|, D_t^2) J \( M \, M' \) \, wide "tr" \( cal(A)^2 \) =
     bb(E)_(M \, M') kappa \( M \, M' \)^2 \, $ <smooth:eq-matching-kernel>]
  where $M \, M'$ are independent and uniform.
  We first bound this kernel using the alternating cycles of $M union M'$. Define
  $ pi_u = s_u / N \, wide gamma_(u u) = frac(2 t_(u u), N) \, wide gamma_(u v) = t_(u v) / N quad \( u eq.not v \) . $
  The array $gamma$ is symmetric, has total sum one, and has row sums $pi$.
    For a probability vector or array write $H \( p \) = - sum_j p_j log p_j$, with $0 log 0 = 0$.
    The factorial formulas imply
  #[#set math.equation(numbering: n => "(7.5)")
   $ log frac(D_t^2, \| cal(Z) \|) = N #scale(x: 120%, y: 120%)[\(] H \( gamma \) -
     H \( pi \) #scale(x: 120%, y: 120%)[\)] + Delta \, wide Delta gt.eq - a_ell #scale(x: 120%, y: 120%)[\(] 1 +
     log \( N + 1 \) #scale(x: 120%, y: 120%)[\)] . $ <smooth:eq-table-entropy>]
  To check the remainder uniformly, including zero table entries, put $R_0 = 0$ and $R_j = log \( j ! \) -
    j log j + j$ for $j gt.eq 1$. Integral comparison gives $0 lt.eq R_j lt.eq 1 + log \( j + 1 \)$,
    and direct substitution gives
  $ Delta = 2 R_h - 2 sum_(u lt.eq v) R_(t_(u v)) - R_N + sum_u R_(s_u) . $
  There are $ell \( ell + 1 \) \/ 2$ unordered table entries, proving the stated lower bound.
    In the leading term, splitting each unordered off-diagonal frequency into two ordered frequencies accounts for
    the power of two in $D_t$.
  Retain doubled edges in $M union M'$, so that its components are alternating cycles,
    including cycles of length two. Orient each cycle and write $c = c \( M \, M' \)$ for their number.
    The matrix $W_(u v) = gamma_(u v) \/ pi_u$ is nonnegative and stochastic.
    Give a vertex coloring by $1 \, dots.h \, ell$ the weight obtained by multiplying $W_(u v)$ over the oriented
    edges, where $u \, v$ are the tail and head colors.
  Every coloring counted by $J \( M \, M' \)$ has weight
  #[#set math.equation(numbering: n => "(7.6)")
   $ exp { - N \( H \( gamma \) - H \( pi \) \) } . $ <smooth:eq-table-color-weight>]
  Indeed, each vertex occurs once as a tail, so the denominator is $product_u pi_u^(s_u)$.
    The two matchings together contribute $2 t_(u v)$ edges of each unordered type.
    Symmetry of $gamma$ makes their orientations irrelevant, and the numerator is $product_(u lt.eq v)
    gamma_(u v)^(2 t_(u v))$, with zero exponents omitted. These expressions give (7.6);
    no counted coloring uses a zero entry of $gamma$.
  For a cycle of length $a$, the sum of weights over all its colorings is $"tr" \( W^a \) lt.eq ell$.
    Summing over all vertex colorings therefore bounds the total weight of the colorings counted by $J$ by
    $ell^c$. Equations (7.4)–(7.6) yield
  #[#set math.equation(numbering: n => "(7.7)")
   $ kappa \( M \, M' \) lt.eq e^(a_ell) \( N + 1 \)^(a_ell) ell^(c \( M \, M' \)) .
     $ <smooth:eq-matching-kernel-bound>]
  It remains to average the cycle factor. Set $b = ell^2$. The number $b^c$ counts colorings that are constant on
    every edge of both matchings. Fix $M$, and suppose its $h$ edges have color multiplicities $j_1 \, dots.h \,
    j_b$, summing to $h$. Averaging the number of such colorings over $M'$ gives the contribution
  $ frac(h !, product_i j_i !) frac(product_i \( 2 j_i - 1 \) ! !, \( 2 h - 1 \) ! !) =
    frac(product_i binom(2 j_i, j_i), binom(2 h, h)) lt.eq 1 \, $
  where $\( - 1 \) ! ! = 1$. For the inequality, partition a $2 h$-element set into blocks of sizes $2 j_i$:
    the numerator counts only those $h$-element subsets taking $j_i$ elements from each block.
    There are at most $\( h + 1 \)^b$ possible multiplicity vectors.
    Hence $bb(E) ell^(2 c) lt.eq \( h + 1 \)^(ell^2)$. Squaring (7.7) and using (7.4) proves (7.3). ◻
]

=== 7.2 Dimensions outside the edge-product span <dimensions-outside-the-edge-product-span>

The fourth-moment bound alone does not make the operator small.
  The additional fact is that each eigenspace of the compression of $T_t^(*) T_t$ to $cal(P)_d^perp$ is invariant,
  and every nonzero such space has large dimension. Here we use the standard representation theory of the
  symmetric group over the complex numbers: irreducibles are indexed by Young diagrams,
  restriction from $S_N$ to $S_(N - 1)$ deletes a corner box, and dimensions count standard Young tableaux.
  The one-row and one-column diagrams give the trivial and sign representations.
  These facts, including the branching rule, are described in #cite(label("vershik-okounkov")) Theorem 5.8,
  Section 6, and Corollary 7.1.

#thm([Lemma 7.3.])[
  #emph[For each fixed integer $d gt.eq 1$ and all sufficiently large $N$,
    every irreducible constituent of the complexification of $cal(P)_d^perp$ has dimension at least
$ c_d N^(d \/ 2) \, wide c_d = frac(1, 2^d d !) . $

]
] <smooth:lem-dimension>

#proof[
  Fix a set of $d$ vertices, and let $G tilde.equiv S_(N - d)$ permute the other vertices.
    A $G$-orbit of matchings is determined by the internal matching $F$ on the fixed vertices:
    a permutation can first align the outside partners of all unmatched fixed vertices and then align the
    remaining outside edges. The orbit indicator is
  $ product_(e in F) x_e product_(e upright(" on the fixed vertices")\
e in.not F) \( 1 - x_e \) . $
  On expansion, a nonzero monomial uses only disjoint edges among those $d$ vertices,
    and therefore at most $floor.l d \/ 2 floor.r$ edge indicators.
    All $G$-invariant functions consequently belong to $cal(P)_d$.
  If a Young diagram has first row of length at least $N - d$,
    the branching rule gives a $G$-fixed vector in its irreducible representation:
    remove corner boxes until only a row of size $N - d$ remains.
    Such a representation cannot occur in $cal(P)_d^perp$, since any such copy would provide a nonzero $G$-fixed
    vector there.
  A first column of length at least $N - d$ similarly gives a vector transforming by the sign character of $G$.
    No nonzero matching function has this transformation law when $N > 2 d$.
    In fact, every matching then contains an edge entirely outside the fixed vertices;
    transposing its endpoints belongs to $G$, fixes that matching, and reverses the sign of the function.
    The function must vanish at every matching. Thus a diagram occurring in $cal(P)_d^perp$ has both first row and
    first column shorter than $N - d$.
  Let $lambda$ be any remaining diagram. The product of its first row and first column lengths is at least $N$.
    Transpose if necessary so that its first row has length $b gt.eq sqrt(N)$;
    transposition preserves the number of standard tableaux. Retain that row and a Young subdiagram of exactly $d$
    boxes below it. Such a subdiagram exists because $N - b gt.eq d$.
  For large $N$, we have $b gt.eq 2 d$. Put $1 \, dots.h \, d$ into the first $d$ positions of the top row.
    Choose any $d$ of the remaining $b$ labels $d + 1 \, dots.h \, b + d$ for the lower boxes,
    fill those boxes in a fixed standard order, and put the unused labels increasingly into the rest of the top
    row. Each lower box is in one of the first $d$ columns, so the resulting tableau is standard.
    The $binom(b, d)$ choices give distinct tableaux of this subdiagram.
    Each extends to $lambda$ by adding the remaining boxes along a fixed corner-addition chain with successively
    larger labels. The dimension $f^lambda$ therefore satisfies
  $ f^lambda gt.eq binom(b, d) gt.eq frac(b^d, 2^d d !) gt.eq c_d N^(d \/ 2) \, $
  as required. ◻
]

=== 7.3 From moments to smoothing, and from products to polynomials <from-moments-to-smoothing-and-from-products-to-polynomials>

#proof[
  Complexification does not change operator norms. The operator $cal(A) =
    T_t^(*) T_t$ commutes with vertex permutations, since $T_t$ intertwines their actions on matchings and
    partitions. The projection $Q = I - Pi_d$ also commutes with permutations, because $cal(P)_d$ is invariant.
    The compression $B = Q cal(A) Q$, acting on $cal(P)_d^perp$,
    is therefore positive semidefinite and equivariant. Moreover,
  $ "tr" \( B^2 \) lt.eq "tr" \( cal(A)^2 \) \, wide ∥B∥_(upright("op")) = ∥T_t Q∥_(upright("op"))^2 . $
  The first inequality is contraction of the Hilbert–Schmidt norm under orthogonal compression and does not
    require $Q$ and $cal(A)$ to commute.
  If $B eq.not 0$, its largest-eigenvalue eigenspace is invariant and contains an irreducible constituent.
    Lemma 11 and the fourth-moment bound give
  $ c_d N^(d \/ 2) ∥T_t Q∥_(upright("op"))^4 lt.eq e^(2 a_ell) \( N + 1 \)^(b_ell) . $
  The same inequality holds if $B = 0$. Choose $d$ so that $d \/ 2 > b_ell + 4 K$.
    For all sufficiently large $N$, this proves (7.2), uniformly in the sizes and the table.
  To prove the polynomial assertion, fix a partition and a generating product of edge indicators.
    Repeated indicators may be removed, and a product containing two distinct incident edges vanishes.
    Otherwise the specified edges form a partial matching. Let $m_(u v)$ be its type counts and let
  $ a_u = 2 m_(u u) + sum_(v eq.not u) m_(u v) $
  be the number of its endpoints in cell $u$. The probability that a matching with table $t$ contains these
    specified edges is
  #[#set math.equation(numbering: n => "(7.8)")
   $ frac(2^(sum_u m_(u u)) product_(u lt.eq v) \( t_(u v) \)_(m_(u v)), product_u \( s_u \)_(a_u)) \,
     wide \( z \)_j = z \( z - 1 \) dots.h.c \( z - j + 1 \) \, quad \( z \)_0 = 1 . $ <smooth:eq-containment>]
  Indeed, apply a uniform cell-preserving vertex permutation to any one matching with table $t$.
    This is uniform over all such matchings by transitivity. The denominator counts injections of the specified
    endpoint lists, while the numerator chooses distinct edges of each type and the two orientations of each
    internal edge. The denominator is positive because $a_u lt.eq s_u$.
    If $t_(u v) < m_(u v)$ for any type, its falling factorial is zero, as required.
  The numerator of (7.8) has total degree equal to the number of specified edges.
    Equation (7.1) expresses every $t_(u u)$ as an affine function of the intercell counts.
    Thus the containment probability is a polynomial of the required degree in those counts.
    By linearity this holds for $Pi_d f$; its expansion in edge products is fixed independently of $t$,
    so the resulting polynomial works simultaneously for all admissible tables. ◻
]

With three cells, the table is determined by its three intercell edge counts.

#thm([Corollary 7.4.])[
  (Three-cell smoothing).  #emph[For every fixed $K > 0$, there are an integer $d gt.eq
    1$ and $N_0$ with the following property. Let $N gt.eq N_0$ be even, and let $a \, b \,
    c$ be positive integers summing to $N$. For a uniform ordered partition into cells of these sizes,
    prescribe $x \, y \, z$ edges between the first and second, first and third, and second and third cells,
    respectively. Assume that $x \, y \, z$ are nonnegative integers and that
$ a - x - y \, wide b - x - z \, wide c - y - z $

 are nonnegative even integers. Let $T_(x \, y \, z)$ average functions on perfect matchings subject to these
   counts, and let $Pi_d$ project onto the edge-product span of degree at most $d$,
   using uniform measures as above. Then
$ ∥T_(x \, y \, z) \( I - Pi_d \)∥_(upright("op")) lt.eq N^(- K) $

 uniformly in all the sizes and admissible triples. For every fixed partition and matching function $f$,
   the values $T_(x \, y \, z) Pi_d f$ are given by one polynomial of total degree at most $d$ in
   $\( x \, y \, z \)$ across all admissible triples.]
] <cor:three-cell>

#proof[
  Apply Theorem 9 with $ell = 3$, intercell counts $t_12 = x$, $t_13 = y$, $t_23 = z$,
    and internal counts $\( a - x - y \) \/ 2$, $\( b - x - z \) \/ 2$, $\( c - y - z \) \/ 2$. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
