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

#align(center)[#text(size: 16pt, weight: "bold")[The sharp exponential rate of singularity \
for symmetric Bernoulli matrices]]
#align(center)[OpenAI]
#align(center)[October 3, 2026]

== 1 Introduction <sec:introduction>

Let $A_n$ be a symmetric $n times n$ random matrix whose entries on and above the diagonal are independent and
  uniform on ${ - 1 \, 1 }$. We study the probability that $A_n$ is singular.
  A specified pair of rows is equal with probability $2^(- n)$:
  the $n - 2$ comparisons away from the two diagonal positions and the two remaining diagonal conditions are
  independent. Thus singularity already occurs at this exponential scale.

#thm([Theorem 1.1.])[
  #emph[For the symmetric Bernoulli matrix $A_n$,
$ Pr \( det A_n = 0 \) = (1 / 2 + o \( 1 \))^n = 2^(- n + o \( n \)) wide upright("as ") n arrow.r oo . $

]
] <thm:main>

The corresponding problem for a matrix with all $n^2$ entries independent has a long history.
  Komlós proved that a matrix with independent uniform $0 \/
  1$ entries is nonsingular with probability tending to one [11].
  Tikhomirov proved the sharp rate $\( 1 \/ 2 + o \( 1 \) \)^n$ for independent uniform signs [16].
  Symmetry changes the exposure of the matrix: revealing a row also reveals entries in all later rows.
  Arguments based on independent rows therefore need a different source of anti-concentration.

Costello, Tao, and Vu proved that a random symmetric Bernoulli matrix is nonsingular with probability tending to
  one, obtaining the bound $O \( n^(- 1 \/ 8 + delta) \)$ for every fixed $delta > 0$ [5].
  Their proof developed quadratic Littlewood–Offord estimates to handle the dependence between a row and its
  matching column. Nguyen improved the bound to $O_C \( n^(- C) \)$ for every fixed $C > 0$ [13],
  and Vershynin obtained a bound of the form $exp \( - n^c \)$ for the sign model,
  as a special case of his theorem for a class of subgaussian ensembles [17].
  Further quantitative advances for this model gave bounds of the forms $exp \( - c n^(1 \/ 4) sqrt(log n) \)$
  [6], $exp \( - c sqrt(n) \)$ [4], $exp \( - c sqrt(n) \( log n \)^(1 \/ 4) \)$ [10],
  and $exp \( - c sqrt(n log n) \)$ [3]. Campos, Jenssen, Michelen,
  and Sahasrabudhe proved an exponential bound $exp \( - c n \)$,
  using inverse Littlewood–Offord estimates for conditioned random walks and the method of inversion of randomness
  [1]. Related work gives quantitative control of the least singular value [2] and of larger rank deficiencies
  [8]. Theorem 1 identifies the leading exponential rate for the specified sign model.

Our proof begins with an exact reduction to symmetric matrices of bits.
  A Schur complement converts the sign matrix in dimension $n$ to a binary matrix in dimension $N = n - 1$.
  A reduction to corank one then turns singularity into a question about appending a new column to a nonsingular
  matrix $B$. The relevant bit columns $z$ satisfy both $z^(sans(T)) B^(- 1) z in { 0 \,
  1 }$ and $parallel B^(- 1) z parallel_oo lt.eq 1$. It suffices to prove that their expected number is $2^(o \( N \))$.

For a typical matrix $B$, the column count is controlled by an arithmetic potential $Psi \( B \) in \[ 0 \, 1 \]$,
  defined in Section 2. The discriminant group $G_B = bb(Z)^m \/ B bb(Z)^m$ carries the symmetric pairing

$ \( \[ x \] \, \[ y \] \) mapsto x^(sans(T)) B^(- 1) y med \( mod med bb(Z) \) . $

Admissible classes have zero self-pairing. We partition them so that pairings within each part have controlled
  denominators, with the cost expressed in terms of the invariant factors.
  A robust subset of a large part yields a lattice of controlled covolume on the graph of $B^(- 1)$.
  A cover for rational subspaces of controlled height makes rank estimates simultaneous for the span selected from
  these columns. Comparing a lower determinant bound from the pairing with an upper bound from typical rank and
  spectral properties proves the column estimate. The reusable lattice arguments control covolumes and count short
  vectors after removing a determinant-minimizing sublattice;
  the Reverse Minkowski Theorem of Regev and Stephens-Davidowitz [14] is applied to its orthogonal quotient.

For a nonsingular extension of width one, the old and new discriminant groups have a common quotient.
  A kernel count modulo prime powers uses symmetry to restrict the possible layer changes,
  while retaining prescribed layers forces the new column into an integer lattice.
  A second application of the lattice tools bounds cube intersections simultaneously for all such lattices;
  it compares the cost of specifying bases of cube differences with the number of matrix entries they constrain.
  Counting partial certificates of retained layers and optimizing their size then pays for the increase of $Psi$
  in a conditional exponential moment. For extensions of width two,
  a gate requires both new columns to be admissible, and the static column estimate directly pays for the
  probability of this gate.

Finally, every nonsingular matrix admits a path of nonsingular principal minors with steps of width one or two,
  with the width-two steps satisfying the gate. A separate elementary estimate for retaining high layers,
  together with a bound on coranks modulo all primes, uses a long initial part of the path to make a large
  high-layer tail unlikely anywhere in a short terminal window.
  Outside this exceptional event, if the potential is small at a node in that window,
  the local conditional estimate controls the terminal moment.
  Otherwise a bounded auxiliary statistic decreases at every step except those with substantial retention or an
  expensive width-two gate. Many such steps are necessary, and their conditional probability bounds make this
  alternative negligible. The long initial part controls the high-layer tail,
  while the short window limits the accumulation of local errors.

== 2 The binary model and the proof framework <sec:framework>

We first reduce the singularity probability to the expected size of a set of possible new columns.
  We then introduce the potential that will control this set and state the two estimates on which the rest of the
  proof rests.

=== 2.1 From signs to bits <from-signs-to-bits>

A #emph[binary matrix] of size $m$ is a symmetric $m times
  m$ matrix whose entries on and above the diagonal are independent and uniform on ${ 0 \, 1 }$.
  We write $upright(bold(B))_m$ for a random binary matrix and use ordinary letters for its realizations.

#thm([Lemma 2.1.])[
  #emph[For $n gt.eq 2$,
$ Pr \( det A_n = 0 \) = Pr \( det upright(bold(B))_(n - 1) = 0 \) . $

]
] <lem:sign-bit>

#proof[
  Put $epsilon.alt = \( A_n \)_11$, multiply $A_n$ by $epsilon.alt$,
    and then apply the diagonal congruence with diagonal
  $ 1 \, med epsilon.alt \( A_n \)_12 \, dots.h \, epsilon.alt \( A_n \)_(1 n) . $
  The resulting first row and column consist of ones. Conditional on the original first row,
    the lower principal block still has independent uniform signs on and above its diagonal:
    every one of these signs has only been multiplied by a sign determined by the first row.
    Its Schur complement at the top left entry is therefore $- 2 upright(bold(B))_(n - 1)$.
    The two operations and the Schur complement preserve singularity. ◻
]

For the remainder of the proof, $N$ is a reference integer tending to infinity and

$ ell = log log N \, wide cal(I)_N = { m in bb(Z) : N - N^(7 \/ 10) lt.eq m lt.eq N } . $

The logarithm $log$ is natural, while $log_2$ and $log_N$ have the indicated bases.
  Every constant exponent of $ell$ is fixed before $N$ tends to infinity.
  In particular, $ell^D \/ log N = o \( ell^(- A) \)$ for all fixed $A \, D > 0$.
  We write $\[ m \] = { 1 \, dots.h \, m }$.

We say that a property of $upright(bold(B))_m$ #emph[holds typically] if its failure probability is at most
  $2^(- N f \( N \))$, uniformly for $m in cal(I)_N$, for some $f \( N \) arrow.r oo$.
  When the property is stated only for nonsingular matrices,
  failure means nonsingularity together with failure of the stated conclusion.
  The typical set may depend on any fixed precision parameters in the statement.
  A finite intersection of typical properties is again typical.

All unqualified ranks are over $bb(R)$. We will also use the following fact over finite fields.

#thm([Lemma 2.2.])[
  (Principal rank).  #emph[Let $M$ be a symmetric matrix over a field, of rank $r$.
    Then $M$ has a nonsingular principal submatrix of size $r$.]
] <lem:principal-rank>

#proof[
  Choose a matrix $X$ whose $r$ columns form a basis of the column space of $M$,
    and choose a left inverse $T$ of $X$. Since $M$ is symmetric, its row space is the row space of $X^(sans(T))$. Thus
  $ M = X S X^(sans(T)) \, wide S = T M T^(sans(T)) . $
  The matrix $S$ is symmetric and has rank $r$. Choose $r$ independent rows of $X$.
    On those indices the principal submatrix of $M$ is a product of three nonsingular $r times r$ matrices. ◻
]

#thm([Lemma 2.3.])[
  (Corank tail).  #emph[Let $bb(K)$ be any field, and regard the bits of $upright(bold(B))_m$ as elements of
    $bb(K)$. For $1 lt.eq k lt.eq m$,
$ Pr #scale(x: 120%, y: 120%)[\(] "corank"_(bb(K)) upright(bold(B))_m gt.eq k #scale(x: 120%, y: 120%)[\)] lt.eq
  sum_(j = k)^m binom(m, j) thin 2^(- j \( j + 1 \) \/ 2) . $

 Consequently, uniformly for $m in cal(I)_N$,
$ Pr #scale(x: 120%, y: 120%)[\(] "corank"_(bb(K)) upright(bold(B))_m > N^(3 \/ 5) #scale(x: 120%, y: 120%)[\)]
  lt.eq 2^(- Omega \( N^(6 \/ 5) \)) . $

 The implicit constant in the last bound is independent of the field.]
] <lem:corank-tail>

#proof[
  If the rank is $m - j$, Lemma 3 supplies a nonsingular principal submatrix on some $m - j$ indices.
    Reveal all entries in the corresponding columns. The remaining symmetric $j times
    j$ block is forced over $bb(K)$, since its Schur complement must vanish.
    Each forced entry has at most one possible bit value, so the conditional probability is at most
    $2^(- j \( j + 1 \) \/ 2)$. Union over the choices of indices and over $j gt.eq k$.
    For $j > N^(3 \/ 5)$, the factor $2^(- j \( j + 1 \) \/ 2)$ dominates the at most $2^m$ choices of indices and
    the $m$ choices of $j$. ◻
]

#thm([Lemma 2.4.])[
  (Reduction to corank one).  #emph[For the binary model in dimension $N$,
$ Pr \( det upright(bold(B))_N = 0 \) lt.eq 2^(o \( N \)) Pr \( "corank" upright(bold(B))_N = 1 \) +
  2^(- Omega \( N^(6 \/ 5) \)) . $

]
] <lem:corank-reduction>

#proof[
  Let $B$ have corank $k gt.eq 1$, and write $K = ker B$. Choose $k -
    1$ coordinates whose restrictions to $K$ are independent linear functionals.
    Flip the diagonal bit at each of those coordinates, and write $D$ for the diagonal matrix of the changes.
    Its selected diagonal entries are all nonzero.
  If $\( B + D \) v = 0$, pairing this equation with every $u in K$ gives $u^(sans(T)) D v = 0$.
    The chosen coordinate functionals on $K$ are independent, so the selected coordinates of $v$ are zero.
    It follows that $B v = 0$. Conversely, every vector in $K$ with these coordinates zero lies in
    $ker \( B + D \)$. This subspace has dimension one. Hence flipping $k -
    1$ diagonal bits produces a matrix of corank one.
  For every matrix with $k lt.eq N^(3 \/ 5)$, fix one such choice of coordinates. Each resulting matrix has at most
  $ sum_(j lt.eq ceil.l N^(3 \/ 5) ceil.r) binom(N, j) = 2^(O \( N^(3 \/ 5) log N \)) = 2^(o \( N \)) $
  preimages, because a preimage is recovered by specifying the flipped coordinates.
    All binary matrices are equally likely. The matrices of larger corank have the probability bounded in Lemma 4. ◻
]

=== 2.2 Admissible columns <admissible-columns>

For a nonsingular binary matrix $B$ of size $m$, define

#[#set math.equation(numbering: n => "(2.1)")
 $ cal(S) \( B \) = {z in { 0 \, 1 }^m : z^(sans(T)) B^(- 1) z in { 0 \, 1 } \, quad
   parallel B^(- 1) z parallel_oo lt.eq 1} . $ <eq:admissible-set>]

Set $cal(S) \( B \) = diameter$ when $B$ is singular. These are the columns that can occur when a corank-one
  matrix is reduced by deleting a largest coordinate of its kernel vector.

#thm([Lemma 2.5.])[
  #emph[One has
$ Pr \( "corank" upright(bold(B))_N = 1 \) lt.eq N thin 2^(- N) thin bb(E) \|
  cal(S) \( upright(bold(B))_(N - 1) \) \| . $

]
] <lem:column-reduction>

#proof[
  Suppose a symmetric matrix $M$ of size $N$ has corank one, and choose $0 eq.not v in ker M$.
    Delete an index $i$ for which $\| v_i \|$ is largest. The resulting principal submatrix $B$ is nonsingular.
    Indeed, the adjugate of $M$ is a nonzero scalar multiple of $v v^(sans(T))$,
    so its $i$-th diagonal entry is nonzero.
  Write $z$ for the column at $i$ on the remaining indices and $a$ for its diagonal bit.
    The kernel equation and the Schur complement give
  $ B^(- 1) z = - v_(\[ N \] \\ { i }) \/ v_i \, wide a = z^(sans(T)) B^(- 1) z . $
  Thus $z in cal(S) \( B \)$. For any fixed deleted index, conditional on $B$,
    the pair $\( z \, a \)$ is uniform on ${ 0 \, 1 }^(N - 1) times { 0 \, 1 }$.
    For each $z in cal(S) \( B \)$, the displayed equality fixes $a$.
    The probability for that index is therefore $2^(- N) bb(E) \| cal(S) \( upright(bold(B))_(N - 1) \) \|$.
    Union over $i$. ◻
]

It remains to prove

#[#set math.equation(numbering: n => "(2.2)")
 $ bb(E) \| cal(S) \( upright(bold(B))_(N - 1) \) \| lt.eq 2^(o \( N \)) . $ <eq:column-target>]

Indeed, Lemmas 5 and 6 then give the upper bound $2^(- N + o \( N \))$ for the binary singularity probability.
  A specified row of $upright(bold(B))_N$ is zero with probability $2^(- N)$, which gives the matching lower bound.

=== 2.3 A potential on the discriminant group <a-potential-on-the-discriminant-group>

For nonsingular $B$, the finite abelian group

$ G_B = bb(Z)^m \/ B bb(Z)^m $

has order $\| det B \|$. It records the possible denominators of $B^(- 1) z$ for integer $z$.
  We now give a numerical measure of its invariant factors.

For a finite abelian group $G$, write its $p$-primary part as

$ G_p tilde.equiv xor.big_(i gt.eq 1) bb(Z) \/ p^(b_(p \, i)) bb(Z) \, wide b_(p \, 1) gt.eq b_(p \, 2) gt.eq
  dots.h.c gt.eq 0 \, $

where only finitely many exponents are positive. For $e gt.eq 1$, put

$ k_G \( p \, e \) = \# { i : b_(p \, i) gt.eq e } \, wide nu_p = frac(log_N p, N) . $

We call $\( p \, e \)$ with $k_G \( p \, e \) > 0$ a #emph[layer],
  its integer $k_G \( p \, e \)$ its #emph[height], and $nu_p$ its #emph[weight].
  All sums over layers below are finite. The identity

#[#set math.equation(numbering: n => "(2.3)")
 $ sum_(p \, e) k_G \( p \, e \) nu_p = frac(log \| G \|, N log N) $ <eq:group-order>]

follows from $sum_e k_G \( p \, e \) = sum_i b_(p \, i)$.
  Hadamard’s inequality gives $\| det B \| lt.eq N^(N \/ 2)$ for a binary matrix of size $m lt.eq N$.
  Hence the sum in Equation (2.3) is at most $1 \/ 2$ for $G_B$ and for every quotient of $G_B$.

Write $k_B \( p \, e \) = k_(G_B) \( p \, e \)$, set $beta = 7 \/ 5$, and define

#[#set math.equation(numbering: n => "(2.4)")
 $ Psi \( B \) = sum_(p \, e) nu_p thin phi.alt \( k_B \( p \, e \) \) \, wide phi.alt \( 0 \) = phi.alt \( 1 \) =
   0 \, quad phi.alt \( 2 \) = beta \, quad phi.alt \( k \) = 2 k quad \( k gt.eq 3 \) . $ <eq:potential>]

In particular $0 lt.eq Psi \( B \) lt.eq 1$, since $0 lt.eq phi.alt \( k \) lt.eq 2 k$.
  We set $Psi \( B \) = 0$ for singular $B$ when an expression also contains a nonsingularity indicator.

For example, a $p$-primary part with positive cyclic exponents $\( 5 \, 3 \, 1 \)$ has

$ \( k_B \( p \, 1 \) \, dots.h \, k_B \( p \, 5 \) \) = \( 3 \, 2 \, 2 \, 1 \, 1 \) \, $

so this primary part contributes $\( 6 + 2 beta \) nu_p$ to $Psi \( B \)$. Figure 1 depicts these layers.
  The coefficient $beta = 7 \/ 5$ exceeds the coefficient $5 \/
  4$ in the height-two term of the color-cost bound in Section 6,
  while satisfying the scalar budget inequality in Section 10.

The potential is chosen to support two estimates. The first relates the number of admissible columns to the
  arithmetic structure of $B$.

#thm([Proposition 2.6.])[
  (Admissible-column estimate).  #emph[For every fixed $A > 0$,
    typically for nonsingular binary matrices $B$ of size $m in cal(I)_N$,
$ \| cal(S) \( B \) \| lt.eq 2^(N \( Psi \( B \) + ell^(- A) \)) . $

]
] <prop:admissible-potential>

The second estimate controls the potential in expectation.

#thm([Proposition 2.7.])[
  (Potential moment).  #emph[For a binary matrix of size $N - 1$,
$ bb(E) #h(-0.16667em)
  [upright(bold(1))_({ det upright(bold(B))_(N - 1) eq.not 0 }) thin 2^(N Psi \( upright(bold(B))_(N - 1) \))]
  lt.eq 2^(o \( N \)) . $

]
] <prop:path-potential>

These propositions imply Equation (2.2). Indeed, fix $A > 0$ in Proposition 7.
  On its typical set use that estimate, and on the exceptional set use $\| cal(S) \( B \) \| lt.eq 2^N$.
  For a suitable $f \( N \) arrow.r oo$,

$ bb(E) \| cal(S) \( upright(bold(B))_(N - 1) \) \| lt.eq
  2^(N ell^(- A)) bb(E) #h(-0.16667em)
  [upright(bold(1))_({ det upright(bold(B))_(N - 1) eq.not 0 }) thin 2^(N Psi \( upright(bold(B))_(N - 1) \))] +
  2^(N - N f \( N \)) = 2^(o \( N \)) . $

Sections 3–6 prove the static estimate in Proposition 7 by combining the discriminant pairing with lattice, rank,
  and spectral estimates. Sections 7–10 prove a local conditional estimate for extensions:
  certificate pricing handles width one, while Proposition 7 directly pays for the gate at width two.
  Section 11 adds a separate high-layer tail argument and combines these estimates along paths to prove Proposition 8.

== 3 Lattice tools and robust subsets <sec:lattice-tools>

The lattice estimates in this section serve two purposes.
  They count short vectors after removing directions of small determinant,
  and they show that a robust collection of cube points has a difference span of small height.
  We first fix the determinant conventions needed for both uses.

=== 3.1 Determinants, quotients, and rational height <determinants-quotients-and-rational-height>

A lattice $L$ is a discrete subgroup of a finite-dimensional Euclidean space, considered inside its real span $E =
  "span" L$. Its rank is $dim E$. If $b_1 \, dots.h \, b_r$ is a basis of $L$,
  its #emph[determinant] is the Euclidean covolume

$ det L = det #scale(x: 120%, y: 120%)[\(] chevron.l b_i \,
  b_j chevron.r_(i \, j = 1)^r #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) . $

We set $det { 0 } = 1$. Sublattices may have smaller rank.
  The saturation of a sublattice $M subset L$ is $overline(M) = L ∩ "span" M$; it is a lattice of the same rank, and

$ det M = \[ overline(M) : M \] det overline(M) . $

We call $M$ #emph[primitive], or #emph[saturated], when $M = overline(M)$.
  A primitive sublattice has a basis that extends to a basis of $L$. The dual lattice is always taken in the span:

$ L^(*) = { y in E : chevron.l y \, x chevron.r in bb(Z) upright(" for all ") x in L } . $

In particular, the dual of the rank-zero lattice is the rank-zero lattice.

#thm([Lemma 3.1.])[
  (Orthogonal lattice quotients).  #emph[Let $L$ have rank $r$ and span $E$,
    and let $K subset L$ be a primitive sublattice of rank $k$, with $F = "span" K$.
    Write $pi_(F^perp)$ for orthogonal projection from $E$ onto $E ∩ F^perp$. The Euclidean realization
$ L \/ K := pi_(F^perp) \( L \) $

 is a lattice of rank $r - k$, canonically isomorphic to the abstract quotient, and
$ det L = det K thin det \( L \/ K \) \, wide det L^(*) = \( det L \)^(- 1) . $

 The dual identities are
$ \( L \/ K \)^(*) = L^(*) ∩ F^perp \, wide K^(*) = pi_F \( L^(*) \) \, $

 where $pi_F$ is orthogonal projection onto $F$. For any sublattice $M subset L \/ K$,
   its full preimage $tilde(M) = { x in L : pi_(F^perp) x in M }$ has rank $k + "rank" M$ and satisfies
$ det tilde(M) = det K thin det M . $

 These assertions include $k = 0$, $k = r$, and $r = 0$, with all rank-zero determinants equal to one.]
] <lem:lattice-quotient>

#proof[
  Extend a basis $b_1 \, dots.h \, b_k$ of $K$ to a basis $b_1 \, dots.h \, b_r$ of $L$.
    The projected vectors $pi_(F^perp) b_(k + 1) \, dots.h \,
    pi_(F^perp) b_r$ form a basis of the projected lattice. Splitting Euclidean volume into the factor in $F$ and
    the factor orthogonal to $F$ gives the first determinant identity.
    The Gram matrix of the dual basis is the inverse Gram matrix, giving the identity for $det L^(*)$.
  For $y in E ∩ F^perp$, the equality $chevron.l y \, pi_(F^perp) x chevron.r = chevron.l y \,
    x chevron.r$ gives $\( L \/ K \)^(*) = L^(*) ∩ F^perp$. Projection of $L^(*)$ to $F$ is contained in $K^(*)$.
    Conversely, for $w in K^(*)$, prescribe on the basis of $L$ the integer values $chevron.l w \,
    b_i chevron.r$ for $i lt.eq k$ and zero for $i > k$. The representing vector belongs to $L^(*)$,
    and its projection to $F$ is $w$. This proves the second dual identity.
    Finally, lift a basis of $M$ and adjoin the basis of $K$.
    The resulting basis of $tilde(M)$ gives its rank and determinant by the same volume factorization.
    Empty bases give all the rank-zero cases. ◻
]

A subspace $W subset bb(R)^m$ is #emph[rational] if it is spanned by integer vectors.
  Its integer lattice $Lambda_W = W ∩ bb(Z)^m$ has rank $dim W$, and its #emph[height] is

$ H \( W \) = det Lambda_W . $

Thus $H \( { 0 } \) = H \( bb(R)^m \) = 1$. We will also write $h \( W \) = log_N H \( W \)$.

#thm([Lemma 3.2.])[
  (Height submodularity).  #emph[For rational subspaces $U \, V subset bb(R)^m$,
$ H \( U + V \) H \( U ∩ V \) lt.eq H \( U \) H \( V \) . $

 Consequently $h \( U + V \) + h \( U ∩ V \) lt.eq h \( U \) + h \( V \)$.
   Every rational subspace has height at least one, and, for fixed $m$ and $C < oo$,
   there are only finitely many rational subspaces $W subset bb(R)^m$ with $H \( W \) lt.eq C$.
   These statements include rank-zero subspaces.]
] <lem:height-submodularity>

#proof[
  Put $J = U ∩ V$, and project orthogonally off $J$. The lattice $Lambda_J =
    Lambda_U ∩ Lambda_V$ is primitive in each of $Lambda_U \, Lambda_V \, Lambda_U + Lambda_V$.
    For the last assertion, if $u + v in J$ with $u in Lambda_U$ and $v in Lambda_V$, then $u \, v in J$.
    The projected spans of $U$ and $V$ intersect trivially. If $overline(Lambda)_U \,
    overline(Lambda)_V$ denote their projected lattices, the union of bases of these lattices is therefore a basis
    of their sum. Orthogonally projecting the second set of basis vectors off the span of the first can only
    decrease its volume. Hence
  $ det \( overline(Lambda)_U + overline(Lambda)_V \) lt.eq det overline(Lambda)_U thin det overline(Lambda)_V . $
  Lemma 9 now gives
  $ det \( Lambda_U + Lambda_V \) det Lambda_J lt.eq det Lambda_U thin det Lambda_V . $
  The saturation of $Lambda_U + Lambda_V$ is $Lambda_(U + V)$, whose determinant is no larger.
    This proves the height inequality, and taking $log_N$ proves its additive form.
  For a rank-$r$ rational subspace, wedge a basis of $Lambda_W$.
    The resulting vector in $and.big^r bb(Z)^m$ is determined up to sign, has Euclidean norm $H \( W \)$,
    and determines its supporting subspace $W$. Its integer coordinates are not all zero,
    so its norm is at least one. A bounded ball contains finitely many vectors of $and.big^r bb(Z)^m$,
    and there are only $m + 1$ possible ranks. This proves the finiteness assertion.
    For $r = 0$, the exterior vector is $1$ and there is just the zero subspace. ◻
]

For a coordinate vector $e_i$, both possible intersections $U ∩ "span" \( e_i \)$ have height one.
  Lemma 10 therefore also gives $H \( U + "span" \( e_i \) \) lt.eq H \( U \)$.
  The next identity expresses height ratios as determinants of normal lattices;
  it will transfer height minimization to bounds on all sublattices of a dual lattice.

#thm([Lemma 3.3.])[
  (Normal lattices and height).  #emph[Let $V subset U subset bb(R)^m$ be rational subspaces, and put $Lambda =
    Lambda_U^(*)$. The primitive normal lattice
$ cal(N)_U \( V \) = Lambda ∩ V^perp $

 has rank $dim U - dim V$, and
$ pi_V \( Lambda \) = Lambda_V^(*) \, wide det cal(N)_U \( V \) = frac(H \( V \), H \( U \)) . $

 More generally, for any sublattice $M subset Lambda$, set $V_M = U ∩ \( "span" M \)^perp$. Then $V_M$ is rational and
$ det M = \[ cal(N)_U \( V_M \) : M \] frac(H \( V_M \), H \( U \)) gt.eq frac(1, H \( U \)) . $

 For $V = U$ the normal lattice has rank zero and determinant one; for $V = { 0 }$ it is $Lambda_U^(*)$.
   If $M = { 0 }$, the displayed index is one and the determinant formula gives one.]
] <lem:normal-height>

#proof[
  The lattice $Lambda_V$ is primitive in $Lambda_U$, so the second dual identity in Lemma 9 gives
    $pi_V \( Lambda_U^(*) \) = Lambda_V^(*)$. Its kernel is $cal(N)_U \( V \)$,
    a primitive sublattice of the asserted rank. Factoring the determinant of $Lambda_U^(*)$ along this kernel gives
  $ frac(1, H \( U \)) = det cal(N)_U \( V \) thin det Lambda_V^(*) = frac(det cal(N)_U \( V \), H \( V \)) . $
  An integer basis matrix for $Lambda_U$ gives a rational basis for its dual by inverting its Gram matrix.
    Thus $"span" M$, and hence $V_M$, is rational. The saturation of $M$ in $Lambda$ is exactly
    $cal(N)_U \( V_M \)$. The index formula for determinants and the first part of the lemma give the final
    identity; the inequality follows from $H \( V_M \) gt.eq 1$. ◻
]

=== 3.2 Gaussian counts and determinant minimization <gaussian-counts-and-determinant-minimization>

For a lattice $L$ and $s > 0$, define its Gaussian mass by

$ rho_s \( L \) = sum_(x in L) exp #h(-0.16667em) (- frac(pi parallel x parallel^2, s^2)) . $

In rank zero this mass equals one. The following is the scaled form of the Reverse Minkowski Theorem of Regev and
  Stephens-Davidowitz [14] Theorem 1.2.

#thm([Theorem 3.4.])[
  (Reverse Minkowski Theorem).  #emph[Let $L$ be a lattice of rank $j gt.eq 1$, and let $T > 0$. Suppose that
$ det M gt.eq T^("rank" M) wide upright("for every sublattice ") M subset L . $

 With $tau_j = 10 \( log j + 2 \)$, one has
$ rho_(T \/ tau_j) \( L \) lt.eq 3 / 2 . $

 For a rank-zero lattice the Gaussian mass is one at every scale, so the corresponding assertion is immediate.]
] <thm:reverse-minkowski>

#proof[
  Apply the cited theorem to $T^(- 1) L$ in its Euclidean span.
    Every rank-$t$ sublattice of $T^(- 1) L$ has determinant at least one, and $rho_(1 \/ tau_j) \( T^(- 1) L \) =
    rho_(T \/ tau_j) \( L \)$. ◻
]

Here $tau_j$ is bounded above and below by absolute multiples of $log \( 2 j \)$.
  We will use the theorem both at its stated scale and at larger scales,
  through the following consequences of Poisson summation.

#thm([Lemma 3.5.])[
  (Gaussian point counts).  #emph[Let $L$ be a rank-$j$ lattice. For $R gt.eq 0$ and $s > 0$,
$ \# { x in L : parallel x parallel lt.eq R } lt.eq exp \( pi R^2 \/ s^2 \) rho_s \( L \) . $

 For $s' gt.eq s > 0$,
$ rho_(s') \( L \) lt.eq \( s' \/ s \)^j rho_s \( L \) . $

 In particular, under the hypotheses of Theorem 12, if $s_0 = T \/ tau_j$, then for every $u gt.eq s_0$,
$ \# { x in L : parallel x parallel lt.eq R } lt.eq 3 / 2 (u / s_0)^j exp \( pi R^2 \/ u^2 \) . $

 When $j = 0$, the point count and every Gaussian mass are one;
   the first inequality is immediate and the second is equality.]
] <lem:gaussian-count>

#proof[
  Each point of norm at most $R$ contributes at least $exp \( - pi R^2 \/ s^2 \)$ to $rho_s \( L \)$,
    proving the first bound. The Gaussian Poisson formula in the span of $L$ is
  $ rho_s \( L \) = frac(s^j, det L) rho_(1 \/ s) \( L^(*) \) . $
  The Gaussian mass is nondecreasing in its scale. Applying this fact to $1 \/ s' lt.eq
    1 \/ s$ in the formula proves the second bound. The last bound follows by using the first bound at scale $u$,
    then the second bound and Theorem 12. The same Poisson identity reads $1 = 1$ in rank zero. ◻
]

We obtain the hypotheses of the Reverse Minkowski Theorem by removing a sublattice that minimizes a normalized
  determinant. The optional rank bound below quantifies how many directions can be removed when all original
  sublattices already have a weaker determinant bound. Extremal sublattices and canonical filtrations also occur
  in the reduction theory of Euclidean lattices; see Grayson [7] Section 1.
  We need only the elementary minimization statement below.

#thm([Lemma 3.6.])[
  (Determinant-minimizing sublattice).  #emph[Let $L$ be a lattice and let $T > 0$. The quantity
$ frac(det M, T^("rank" M)) \, wide M subset L upright(" a sublattice") \, $

 has a minimum, attained by a primitive sublattice $L_0$. It satisfies
$ det L_0 lt.eq T^("rank" L_0) \, wide det M gt.eq T^("rank" M) quad
  upright("for every sublattice ") M subset L \/ L_0 . $

 If in addition $T_0 > T$, $Delta gt.eq 0$, and
$ det M gt.eq e^(- Delta) T_0^("rank" M) quad upright("for every sublattice ") M subset L \, $

 then
$ "rank" L_0 lt.eq frac(Delta, log \( T_0 \/ T \)) . $

 For $L = { 0 }$ the unique choice is $L_0 = { 0 }$, and every assertion holds with rank zero and determinant one.]
] <lem:det-minimizer>

#proof[
  The rank-zero lattice has normalized determinant one. For a fixed positive rank $t$,
    the determinant of a sublattice is the norm of the wedge of one of its bases in the discrete lattice
    $and.big^t L$. There are only finitely many such norms at most $T^t$.
    Thus among all normalized determinants no greater than one there are only finitely many values,
    and the minimum is attained. Saturating a minimizer can only decrease its determinant while preserving its
    rank, so a primitive minimizer may be chosen. Comparison with the rank-zero lattice gives $det L_0 lt.eq
    T^("rank" L_0)$.
  For a sublattice $M subset L \/ L_0$, lift it to $tilde(M)$ as in Lemma 9. Minimality gives
  $ frac(det L_0, T^("rank" L_0)) lt.eq frac(det tilde(M), T^("rank" L_0 + "rank" M)) =
    frac(det L_0 thin det M, T^("rank" L_0 + "rank" M)) \, $
  which proves the quotient bound. Under the additional hypothesis, writing $k = "rank" L_0$,
    the two bounds on $det L_0$ give $e^(- Delta) T_0^k lt.eq T^k$. Taking logarithms proves the rank bound. ◻
]

=== 3.3 Robust subsets and small determinants <robust-subsets-and-small-determinants>

Let $cal(A)$ be a nonempty finite set with affine span $F$.
  For $rho > 0$, call $cal(A)$ #emph[$rho$-robust] if every affine subspace $E subset F$ of codimension $t$ satisfies

$ \| cal(A) ∩ E \| lt.eq 2^(- rho t) \| cal(A) \| . $

Robustness is preserved by injective affine maps, since their restrictions to the affine span preserve codimension.

#thm([Lemma 3.7.])[
  (Robust cube extraction).  #emph[Let $diameter eq.not cal(A) subset { 0 \, 1 }^m$, let $rho > 0$, and put $d =
    dim "aff" cal(A)$. There is an affine restriction $cal(A)_0 = cal(A) ∩ F$, with $F =
    "aff" cal(A)_0$ of dimension $r$, such that $cal(A)_0$ is $rho$-robust and
$ log_2 \| cal(A)_0 \| gt.eq log_2 \| cal(A) \| - rho \( d - r \) gt.eq log_2 \| cal(A) \| - rho m \, wide
  log_2 \| cal(A)_0 \| lt.eq r . $

 For any fixed $a_0 in cal(A)_0$, the number of ordered $r$-tuples $\( a_1 \, dots.h \, a_r \) in
   cal(A)_0^r$ for which $a_1 - a_0 \, dots.h \, a_r - a_0$ are independent is at least
$ \| cal(A)_0 \|^r product_(t = 1)^r \( 1 - 2^(- rho t) \) gt.eq
  #scale(x: 120%, y: 120%)[\(] \( 1 - 2^(- rho) \) \| cal(A)_0 \| #scale(x: 120%, y: 120%)[\)]^r . $

 When $r = 0$, $cal(A)_0$ is a singleton and the number of empty ordered tuples is one.]
] <lem:robust-extraction>

#proof[
  Among all nonempty affine restrictions $cal(Q)$ of $cal(A)$, choose one maximizing
  $ \| cal(Q) \| thin 2^(- rho dim "aff" cal(Q)) . $
  There are finitely many distinct restrictions. Replacing the restricting affine space by $"aff"
    cal(Q)$ preserves the restriction, so write the maximizer as $cal(A)_0 = cal(A) ∩ F$, $F = "aff" cal(A)_0$.
    Comparison with $cal(A)$ gives the lower bounds for its size.
  Let $E subset F$ have codimension $t$. If $cal(A)_0 ∩ E eq.not diameter$,
    its affine span has dimension at most $r - t$, and the intersection is itself an affine restriction of
    $cal(A)$. Maximality therefore gives
  $ \| cal(A)_0 ∩ E \| thin 2^(- rho dim "aff" \( cal(A)_0 ∩ E \)) lt.eq \| cal(A)_0 \| thin 2^(- rho r) \, $
  which is the required robustness bound. Empty intersections satisfy the bound as well.
    Choose $r$ coordinate functionals independent on the direction space of $F$.
    Projection to those coordinates is injective on $F$, and maps $cal(A)_0$ into ${ 0 \, 1 }^r$.
    Thus $\| cal(A)_0 \| lt.eq 2^r$.
  Finally, after $i$ independent differences have been chosen, their affine span with $a_0$ has codimension $r -
    i$ in $F$. Robustness leaves at least $\( 1 - 2^(- rho \( r - i \)) \) \|
    cal(A)_0 \|$ choices for the next point. Multiplication for $i = 0 \, dots.h \, r -
    1$ gives the claimed count. The empty product proves the rank-zero assertion. ◻
]

The next lemma bounds the determinant of the entire difference lattice.
  Its affine-image form will also apply to graph lattices: the only metric input is a bound on image differences.

#thm([Lemma 3.8.])[
  (Determinant of a robust image lattice).  #emph[Fix $D > 0$ and $C_0 > 0$.
    For all sufficiently large $N$, put $rho = ell^(- D)$. Let $m lt.eq N$,
    let $diameter eq.not cal(A) subset { 0 \, 1 }^m$ be $rho$-robust on its affine span $F$ of dimension $r$,
    and let $Phi : F arrow.r bb(R)^d$ be an injective rational affine map,
    meaning that it maps rational points of $F$ to rational points of $bb(R)^d$. Suppose that
$ parallel Phi \( a \) - Phi \( b \) parallel lt.eq C_0 sqrt(N) wide \( a \, b in cal(A) \) . $

 For any $a_0 in cal(A)$, the group
$ L_Phi = sum_(a in cal(A)) bb(Z) #scale(x: 120%, y: 120%)[\(] Phi \( a \) -
  Phi \( a_0 \) #scale(x: 120%, y: 120%)[\)] $

 is a rank-$r$ lattice, independent of the choice of $a_0$, and
$ det L_Phi lt.eq exp #scale(x: 120%, y: 120%)[\(] O_(D \, C_0) \( N ell \) #scale(x: 120%, y: 120%)[\)] . $

 In particular, with $W = "span" \( cal(A) - cal(A) \)$,
$ H \( W \) lt.eq exp #scale(x: 120%, y: 120%)[\(] O_D \( N ell \) #scale(x: 120%, y: 120%)[\)] . $

 If $r = 0$, both lattices in question have rank zero and determinant one.]
] <lem:robust-height>

#proof[
  The finitely many image differences are rational vectors, so they have a common denominator.
    Their integer span is therefore contained in a scaled copy of $bb(Z)^d$ and is discrete.
    The linear part of $Phi$ is injective on the direction space of $F$, so this lattice has rank $r$.
    Changing $a_0$ does not change the generated group. The assertions are immediate if $r = 0$; suppose $r gt.eq 1$.
  Set $T = \( log N \)^4$, and choose $L_0 subset L_Phi$ by Lemma 14.
    Write $Gamma = L_Phi \/ L_0$ for its orthogonal quotient and $j = "rank" Gamma$.
    The quotient has $det M gt.eq T^("rank" M)$ for every sublattice $M subset Gamma$, while $det L_0 lt.eq
    T^(r - j)$. Fix $a_0$, and project the vectors $Phi \( a \) - Phi \( a_0 \)$ into $Gamma$.
    They have norm at most $C_0 sqrt(N)$. If $j gt.eq 1$, Lemma 13 at scale $T \/
    tau_j$ bounds the number $M$ of distinct projections by
  $ M lt.eq 3 / 2 exp #h(-0.16667em) (frac(pi C_0^2 N tau_j^2, T^2)) lt.eq 2^(O_(C_0) \( N \/ \( log N \)^6 \)) . $
  Here $j lt.eq r lt.eq N$, so $tau_j = O \( log N \)$. The same final bound holds for $j = 0$, when $M = 1$.
  The preimage in $F$ of any one projection fiber is an affine subspace of codimension $j$.
    A largest fiber contains at least $\| cal(A) \| \/ M$ points,
    whereas robustness bounds its size by $2^(- rho j) \| cal(A) \|$. It follows that
  $ j lt.eq frac(log_2 M, rho) = O_(C_0) #h(-0.16667em) (frac(N ell^D, \( log N \)^6)) . $
  The projected differences generate $Gamma$. Choose $j$ of them that are independent.
    Their integer span is a full-rank sublattice of $Gamma$, so the index formula and Hadamard’s inequality give
  $ det Gamma lt.eq \( C_0 sqrt(N) \)^j . $
  For $j = 0$ this is the equality $1 = 1$. Factoring the determinant along $L_0$ now yields
  $ det L_Phi lt.eq T^(r - j) \( C_0 sqrt(N) \)^j \, wide log det L_Phi lt.eq 4 N ell +
    O_(C_0) #h(-0.16667em) (frac(N ell^D, \( log N \)^5)) . $
  For fixed $D$, the error is $o \( N ell \)$, which proves the stated determinant bound.
  For the identity map the difference norms are at most $sqrt(m) lt.eq sqrt(N)$,
    and $L_Phi$ is a full-rank sublattice of $W ∩ bb(Z)^m$. Saturating therefore decreases its determinant,
    giving $H \( W \) lt.eq det L_Phi$ and the asserted height bound. ◻
]

== 4 A finite cover for subspaces of controlled height <sec:low-height>

Lemmas 15 and 16 allow us to pass from a large subset of ${ 0 \, 1 }^m$ to a robust subset,
  with loss at most $rho N$ in its base-two logarithmic size for $rho = ell^(- D_1)$ and fixed $D_1 > 0$,
  whose difference span $W$ satisfies $H \( W \) lt.eq exp \( O \( N ell \) \)$.
  This span may depend on the matrix under study, so a rank estimate for one fixed space is insufficient.
  Theorem 17 replaces all such spans by a small fixed list while changing the relevant ranks only slightly.
  Proposition 18 uses this cover to obtain simultaneous rank estimates.

For rational subspaces $U \, V subset.eq bb(R)^m$, define their #emph[rank distance] by

$ d \( U \, V \) = dim U + dim V - 2 dim \( U ∩ V \) . $

Thus $d \( U \, V \)$ is the sum of the codimensions of $U ∩ V$ in $U$ and $V$.
  Recall that $H \( U \) = det \( U ∩ bb(Z)^m \)$, with $H \( 0 \) = 1$.
  One also has $d \( U^perp \, V^perp \) = d \( U \, V \)$.
  Passing through the common subspace $U^perp ∩ V^perp$ shows that the nullities of a fixed symmetric bilinear
  form restricted to $U^perp times U^perp$ and $V^perp times V^perp$ differ by $O \( d \( U \, V \) \)$;
  the same holds for the ranks of columns projected to these spaces.
  This is the relation needed to transfer the fixed-space rank estimates.

#thm([Theorem 4.1.])[
  (Low-height cover).  #emph[Fix $D \, A > 0$. For all sufficiently large $N$, and every integer $0 lt.eq m lt.eq
    N$, there is a list $cal(C)_(m \, N)$ of rational subspaces of $bb(R)^m$, depending also on $D \, A$, such that
$ \| cal(C)_(m \, N) \| lt.eq 2^(N^2 ell^(- A)) . $

 Every rational subspace $W subset.eq bb(R)^m$ satisfying $H \( W \) lt.eq exp \( N ell^D \)$ has
$ min_(U in cal(C)_(m \, N)) d \( U \, W \) lt.eq N ell^(- A) . $

]
] <thm:low-height-cover>

#proof[
  Choose a fixed $B_0 > D + A + 2$, and put
  $ a = ell^(- B_0) \, wide h \( U \) = log_N H \( U \) \, wide Delta = frac(N ell^D, a log N) . $
  Throughout the proof $N$ is sufficiently large in terms of these fixed parameters.
    In particular $a = o \( 1 \)$ and $1 \/ log N = o \( a \)$.
    We will encode a space within distance $Delta$ of each eligible $W$, at a cost $o \( N^2 ell^(- A) \)$ bits.
    We follow the coordinate equations of $W$ by a nested chain of minimizing spaces.
    The height budget limits the total dimension lost in drops larger than one.
    A flag in the normal lattice encodes each drop, and the minimizing inequalities ensure that few flag positions
    have a large encoding cost. We then sum these costs over the chain.
  #strong[The minimizing chain.] Let $r = dim W$. Choose $r$ pivot coordinates on which the coordinate projection
    of $W$ is an isomorphism, and write $W$ as the graph of rational linear functions on these coordinates.
    Order the nonpivot coordinates, and impose their graph equations one at a time. This gives rational spaces
  $ bb(R)^m = P_0 supset P_1 supset dots.h.c supset P_(m - r) = W . $
  At a step with coordinate vector $e$, one has $P_(s - 1) = P_s xor bb(R) e$.
    Every coordinate vector whose equation has not yet been imposed belongs to $P_s$.
  For each $s$, minimize
  $ F_s \( U \) = h \( U \) + a thin d \( U \, P_s \) $
  over rational subspaces $U$, write the minimum as $E_s$, and let $U_s$ be the greatest minimizer under
    inclusion. We justify these choices. By Lemma 10, $h \( U \) gt.eq 0$,
    and only finitely many rational spaces satisfy $H \( U \) lt.eq N^(a m)$.
    Testing $U = 0$ shows that a minimizer can be sought among those spaces, so the minimum exists.
    Lemma 10 and the inequality
  $ d \( U + V \, P \) + d \( U ∩ V \, P \) lt.eq d \( U \, P \) + d \( V \, P \) $
  show that the sum and intersection of two minimizers for $F_s$ are again minimizers.
    The displayed inequality follows from the dimension identity for $U \,
    V$ and the inclusion $\( U ∩ P \) + \( V ∩ P \) subset.eq \( U + V \) ∩ P$.
    Since the set of minimizers is finite, their sum is the greatest one. Also $U_0 = bb(R)^m$ and $E_0 = 0$.
  The minimizers descend with the graph spaces. In fact, if $P' subset.eq P$, then
  $ d \( U + V \, P \) + d \( U ∩ V \, P' \) lt.eq d \( U \, P \) + d \( V \, P' \) . $
  Here the required inequality between intersection dimensions follows from $\( U ∩ P \) + \( V ∩ P' \)
    subset.eq \( U + V \) ∩ P$, whose two summands intersect in $U ∩ V ∩ P'$.
    Combining this inequality with Lemma 10, for $U = U_(s - 1)$ and $V = U_s$, gives
  $ F_(s - 1) \( U_(s - 1) + U_s \) + F_s \( U_(s - 1) ∩ U_s \) lt.eq E_(s - 1) + E_s . $
  Minimality gives the reverse inequality. Hence $U_(s - 1) + U_s$ is an old minimizer,
    and greatestness implies $U_s subset.eq U_(s - 1)$.
  Every unprocessed coordinate vector $e in P_s$ belongs to $U_s$.
    Indeed, Lemma 10, together with $H \( bb(R) e \) = 1$ and $H \( U ∩ bb(R) e \) gt.eq 1$, gives
  $ H \( U + bb(R) e \) lt.eq H \( U \) . $
  If $e in.not U$ but $e in P_s$, adjoining $e$ decreases $d \( U \, P_s \)$ by one, contradicting minimality.
    The energies are nondecreasing as well. For a step $P_(s - 1) = P_s xor bb(R) e$, one has
  $ d \( U + bb(R) e \, P_(s - 1) \) lt.eq d \( U \, P_s \) . $
  This follows directly by comparing the intersections after adjoining $e$:
    the new intersection contains $\( U ∩ P_s \) xor bb(R) e$,
    while the dimensions of $U$ and $P_s$ each increase by at most one.
    The height inequality just proved, applied to $U = U_s$, yields $E_(s - 1) lt.eq E_s$.
  Testing the last objective at $W$ gives $E_(m - r) lt.eq h \( W \)$. Therefore
  $ d \( U_(m - r) \, W \) lt.eq frac(h \( W \), a) lt.eq Delta . $
  Write $c_s = dim U_(s - 1) - dim U_s$ for the dimension drop at step $s$,
    and let $z$ count the steps with $c_s = 0$. At such a step the old and new minimizers coincide and contain the
    coordinate vector $e$ being processed. Their intersection with $P_s$ has dimension one less than their
    intersection with $P_(s - 1)$, so $E_s - E_(s - 1) = a$. Consequently $z lt.eq h \( W \) \/ a$.
    Write $dim U_(m - r) = r + theta$. The distance bound gives $\| theta \| lt.eq h \( W \) \/ a$,
    while summing the drops gives $sum_s c_s = m - r - theta$. Since there are $m - r$ steps,
  $ sum_(s : c_s gt.eq 2) \( c_s - 1 \) = z - theta lt.eq frac(2 h \( W \), a) . $
  It follows that
  #[#set math.equation(numbering: n => "(4.1)")
   $ sum_(s : c_s gt.eq 2) c_s lt.eq frac(4 h \( W \), a) lt.eq 4 Delta . $ <eq:multi-drop-budget>]
  #strong[Normal flags for a transition.] We next count the choices for a transition $U_(upright("old")) supset.eq
    U_(upright("new"))$ of drop $c gt.eq 1$, assuming $U_(upright("old"))$ is known.
    Let $P_(upright("old")) supset P_(upright("new"))$ be the corresponding graph spaces, and set
  $ Lambda = \( U_(upright("old")) ∩ bb(Z)^m \)^(*) $
  in the Euclidean span $U_(upright("old"))$, and let $K = Lambda ∩ U_(upright("new"))^perp$.
    This is a primitive rank $c$ sublattice of $Lambda$, and it determines $U_(upright("new"))$.
    For a rational $V subset.eq U_(upright("old"))$, Lemma 11 identifies the determinant of its primitive normal
    lattice as
  $ det \( Lambda ∩ V^perp \) = frac(H \( V \), H \( U_(upright("old")) \)) . $
  If $V$ has codimension $t$ in $U_(upright("old"))$, the two rank distances from $V$ and $U_(upright("old"))$ to
    any fixed space differ by at most $t$. Comparing $V$ with the old minimizer,
    and saturating any sublattice of $Lambda$, therefore gives
  $ h \( V \) - h \( U_(upright("old")) \) gt.eq a #scale(x: 120%, y: 120%)[\(]
    d \( U_(upright("old")) \, P_(upright("old")) \) - d \( V \, P_(upright("old")) \)
    #scale(x: 120%, y: 120%)[\)] gt.eq - a t $
  and hence
  $ det L gt.eq N^(- a "rank" L) wide \( L subset.eq Lambda \) . $
  If $K' subset.eq K$ is primitive of rank $t$, it is also primitive in $Lambda$,
    and is the normal lattice of a rational space $V'$ with $U_(upright("new")) subset.eq V' subset.eq
    U_(upright("old"))$. The normal-height identity and comparison with the new minimizer give
  $ h \( U_(upright("new")) \) - h \( V' \) lt.eq a #scale(x: 120%, y: 120%)[\(]
    d \( V' \, P_(upright("new")) \) - d \( U_(upright("new")) \, P_(upright("new")) \)
    #scale(x: 120%, y: 120%)[\)] lt.eq a \( c - t \) . $
  Thus
  #[#set math.equation(numbering: n => "(4.2)")
   $ frac(det K, det K') = frac(H \( U_(upright("new")) \), H \( V' \)) lt.eq
     N^(a \( c - t \)) . $ <eq:cover-normal-balance>]
  These two bounds are the only restrictions on the transition used in the count.
  Choose a saturated flag
  $ 0 = K_0 subset K_1 subset dots.h.c subset K_c = K $
  as follows. In the orthogonally projected quotient $K \/ K_(i - 1)$, choose a shortest nonzero vector $v_i$,
    put $mu_i = parallel v_i parallel$, and let $K_i \/ K_(i - 1)$ be the lattice on its line.
    A shortest nonzero vector is primitive, so $K_i \/ K_(i - 1) = bb(Z) v_i$.
    Each $K_i$ is primitive in $K$, hence also in $Lambda$. Put $y_i = log_N mu_i$.
    The determinant identity in Lemma 9 and Equation (4.2) give, for every suffix,
  #[#set math.equation(numbering: n => "(4.3)")
   $ sum_(j = i)^c y_j lt.eq a \( c - i + 1 \) . $ <eq:cover-flag-suffix>]
  The classical shortest-vector consequence of Minkowski’s convex body theorem in rank $u$ is $lambda_1 \( L \)
    lt.eq C sqrt(u) thin \( det L \)^(1 \/ u)$, with an absolute $C$. Apply it to $K_(i + u - 1) \/ K_(i - 1)$.
    The vector $v_i$ is shortest even in the larger lattice $K \/ K_(i - 1)$, and hence
  #[#set math.equation(numbering: n => "(4.4)")
   $ y_i lt.eq 1 / u sum_(j = i)^(i + u - 1) y_j + 1 / 2 log_N u +
     O \( 1 \/ log N \) wide \( 1 lt.eq u lt.eq c - i + 1 \) . $ <eq:cover-flag-range>]
  Taking a full suffix in this inequality shows
  $ y_i lt.eq 1 / 2 + a + O \( 1 \/ log N \) . $
  In particular $y_i lt.eq 1$ for large $N$.
  Call position $i$ expensive if $y_i > 1 \/ 2 - 3 a$. A flag of length $c$ has $O \( a c \)$ expensive positions,
    and has none when $c = 1$. For the latter assertion, Equation (4.3) gives $y_1 lt.eq a < 1 \/ 2 - 3 a$.
    For the general assertion, suppose an expensive position exists,
    and partition the suffix from the first such position into ranges,
    each starting at an expensive position and ending just before the next one, or at the end.
    For a range of length $u$, Equation (4.4) gives
  $ sum_(upright("range")) \( y_j - a \) gt.eq u (1 / 2 - 4 a - 1 / 2 log_N u - O \( 1 \/ log N \)) . $
  For $u lt.eq N^(2 \/ 5)$, this is at least $u \/ 5$ for large $N$.
    For every $u lt.eq N$, it is at least $- C_1 a u$, since $1 \/ log N = o \( a \)$.
    The total over the ranges is nonpositive by Equation (4.3).
    The total length of the short ranges is thus $O \( a c \)$.
    There are at most $c \/ N^(2 \/ 5) = o \( a c \)$ long ranges,
    and at most the total short length short ranges. This proves the asserted count.
  #strong[Counting flag vectors.] We count the vector at each flag position in a quotient determined by the
    preceding choices. Put
  $ Pi = Lambda \/ K_(i - 1) \, $
  again using orthogonal projection. A rank $t$ sublattice $macron(L)$ of $Pi$ lifts, together with $K_(i - 1)$,
    to a rank $t + i - 1$ sublattice of $Lambda$. By Lemma 9, the first normal balance bound, and $det K_(i - 1) =
    product_(j < i) mu_j lt.eq N^c$, it follows that
  #[#set math.equation(numbering: n => "(4.5)")
   $ det macron(L) gt.eq frac(N^(- a \( t + i - 1 \)), det K_(i - 1)) gt.eq
     N^(- a t - 2 c) . $ <eq:cover-projected-determinants>]
  Apply Lemma 14 to $Pi$ with $T = N^(- 2 a)$. Fix a deterministic choice of its minimizing primitive sublattice
    $L_0$, so that this choice requires no additional encoding once $Pi$ is known.
    If $j_0 = "rank" L_0$, the rank-zero competitor and Equation (4.5) imply
  $ N^(- a j_0 - 2 c) lt.eq det L_0 lt.eq N^(- 2 a j_0) \, wide j_0 lt.eq frac(2 c, a) . $
  All sublattices of the quotient $Omega = Pi \/ L_0$ have determinant at least $N^(- 2 a)$ to their rank.
  First encode the image of $v_i$ in $Omega$. If $Omega$ has rank zero this image is unique.
    Otherwise, because its rank is at most $N$, Lemma 13 applies at the common smaller scale
  $ s_0 = frac(N^(- 2 a), C_2 log \( 2 N \)) $
  for a suitable absolute $C_2$. For an inexpensive position, $mu_i lt.eq N^(1 \/ 2 - 3 a)$,
    and orthogonal projection does not increase norm. Lemma 13 therefore bounds the base-two logarithm of the
    number of images by
  #[#set math.equation(numbering: n => "(4.6)")
   $ O #scale(x: 120%, y: 120%)[\(] 1 + N^(1 - 2 a) log^2 N #scale(x: 120%, y: 120%)[\)] .
     $ <eq:cover-inexpensive-cost>]
  For an expensive position the general bound on $y_i$ permits a common radius $R = C_3 N^(1 \/ 2 + a)$,
    with an absolute $C_3$. Use the Gaussian comparison in Lemma 13 from $s_0$ to $s_1 = R \/ sqrt(N)$.
    These satisfy $s_1 gt.eq s_0$ for large $N$. Writing $k = "rank" Omega lt.eq N$,
    the base-two logarithm of the count is at most
  $ O \( 1 \) + O \( R^2 \/ s_1^2 \) + k log_2 \( s_1 \/ s_0 \) lt.eq O \( N \) +
    O #scale(x: 120%, y: 120%)[\(] N \( a log N + log log N \) #scale(x: 120%, y: 120%)[\)] = O \( a N log N \) . $
  The last equality uses $a log N gt.double log log N$.
  It remains to count the vectors above one fixed image in $Omega$.
    Use the common radius $R = C_3 N^(1 \/ 2 + a)$ for both kinds of position,
    and let $cal(V)$ be the vectors $v in Pi$ above that image with $parallel v parallel lt.eq R$.
    If $cal(V)$ is nonempty, its differences lie in $L_0$. Let $F$ be their real span, of dimension
  $ j lt.eq j_0 lt.eq 2 c \/ a \, wide j lt.eq N . $
  The intersection lattice $L_F = Pi ∩ F$ has rank $j$, and Equation (4.5) gives $det L_F gt.eq N^(- a j - 2 c)$.
    If $j = 0$, there is at most one vector. Otherwise choose $j$ independent differences in $cal(V)$,
    each of norm at most $2 R$, and let $L' subset.eq L_F$ be their integer span. Fix $v_0 in cal(V)$.
    Within each coset of $L'$ in $v_0 + L_F$, the translates at the points of $cal(V)$ of a half-open fundamental
    parallelepiped for these differences are disjoint up to boundaries.
    They lie in the $j$-dimensional ball centered at $v_0$ of radius $2 \( 1 + j \) R$.
    Writing $B_j \( r \)$ for the Euclidean $j$-ball of radius $r$, we may sum over the $\[ L_F : L' \] =
    det L' \/ det L_F$ cosets to obtain
  $ \| cal(V) \| lt.eq frac("vol"_j B_j \( 2 \( 1 + j \) R \), det L_F) . $
  Since $j lt.eq N$ and $R = O \( N^(1 \/ 2 + a) \)$, the logarithm of the numerator is $O \( j log N \)$.
    The determinant bound consequently gives
  #[#set math.equation(numbering: n => "(4.7)")
   $ log_2 \| cal(V) \| lt.eq O \( \( j + c \) log N \) = O (c / a log N) . $ <eq:cover-fiber-cost>]
  This bound is uniform over the fixed image and the preceding flag choices.
  The image and fiber choices specify $v_i in Pi$. They also specify $K_i$: for any lift $tilde(v)_i in Lambda$,
  $ K_i = Lambda ∩ "span" \( K_(i - 1) \, tilde(v)_i \) . $
  Thus the encoding reconstructs the next quotient and ultimately $K$, and hence $U_(upright("new"))$.
    The counts above can be applied successively to the prefixes of all encodings of actual minimizing chains;
    only such prefixes need satisfy the balance bounds.
  #strong[Total encoding cost.] We finish by summing the costs.
    Specifying the pivot and coordinate order, the drops, and the expensive positions costs $O \( N log N \)$
    bits. There are at most $N$ flag positions altogether, because the sum of all drops is at most $m$. Put
  $ S = sum_(s : c_s gt.eq 2) c_s lt.eq 4 Delta $
  by Equation (4.1). The expensive-position count gives at most $O \( a S \)$ such positions over the whole chain;
    there are none in drops of size one. For a drop $c$, the $c$ fiber costs in Equation (4.7) total
    $O \( c^2 log N \/ a \)$. Using $sum_(s : c_s gt.eq 2) c_s^2 lt.eq S^2$,
    the full base-two logarithmic cost is therefore bounded as follows.
    The four terms in the first bound account, respectively, for the choices of pivots, order, drops,
    and positions; for inexpensive images; for expensive images; and for fibers:
  $ O \( N log N \) & + O #scale(x: 120%, y: 120%)[\(] N \( 1 + N^(1 - 2 a) log^2 N \)
    #scale(x: 120%, y: 120%)[\)] + O \( a^2 N log N thin S \)\
 & + O (frac(log N, a) \( S^2 + N \))\
 & lt.eq O #scale(x: 120%, y: 120%)[\(] N^2 N^(- 2 a) log^2 N #scale(x: 120%, y: 120%)[\)] + O \( a N^2 ell^D \) +
   O (frac(N^2 ell^(2 D), a^3 log N)) + O (frac(N log N, a)) . $
  Each term is $o \( N^2 ell^(- A) \)$. For the first, $N^(- 2 a) log^2 N =
    exp \( - 2 log N \/ ell^(B_0) + 2 ell \) = o \( ell^(- A) \)$.
    The second has factor $a ell^D = ell^(D - B_0) = o \( ell^(- A) \)$.
    For the third, $ell^(2 D) \/ \( a^3 log N \) = ell^(2 D + 3 B_0) \/ log N = o \( ell^(- A) \)$;
    the fourth follows from $ell^(B_0) log N \/ N = o \( ell^(- A) \)$.
    All exponents here are fixed before $N$ tends to infinity.
  Collect the terminal spaces decoded by all these encodings, removing duplicates.
    This is a list independent of $W$, of size at most $2^(N^2 ell^(- A))$ for sufficiently large $N$.
    Every eligible $W$ contributes an encoding whose terminal space satisfies
  $ d \( U_(m - r) \, W \) lt.eq Delta = frac(N ell^(D + B_0), log N) = o \( N ell^(- A) \) . $
  The required distance bound follows, uniformly for $m lt.eq N$. ◻
]

== 5 Typical rank and spectral properties <sec:typical>

We derive three properties of binary matrices that will be used below.
  The rank properties hold simultaneously on all rational subspaces of the prescribed height and for all choices
  of columns. Their uniformity comes from Theorem 17, together with a rank test over $bb(F)_2$.
  The spectral property has the same exceptional-probability scale,
  although its proof uses concentration rather than a union bound.

For a real symmetric matrix $B$ and a subspace $U subset.eq bb(R)^m$,
  write $B \|_U$ for the bilinear form $\( u \, v \) mapsto u^(sans(T)) B v$ restricted to $U times U$.
  Its nullity is $dim U - "rank" \( B \|_U \)$. We write $pi_U$ for orthogonal projection onto $U$, and put $E_X =
  "span" { e_i : i in X }$ for $X subset.eq \[ m \]$.

=== 5.1 Uniform rank tests <uniform-rank-tests>

We first record the finite-field estimate behind both rank assertions.
  Let $cal(B)$ be a uniform symmetric bilinear form on $bb(F)_2^m$, including independent diagonal entries,
  and let $S \, T$ be fixed subspaces of dimensions $b \, a$, respectively, where $b lt.eq a$. For $1 lt.eq t lt.eq b$,

#[#set math.equation(numbering: n => "(5.1)")
 $ Pr #scale(x: 120%, y: 120%)[\(] "rank" \( cal(B) \|_(S times T) \) lt.eq b -
   t #scale(x: 120%, y: 120%)[\)] lt.eq C_0 thin 2^(- t \( t + 1 \) \/ 2) \, $ <eq:typical-f2-rank>]

with an absolute constant $C_0$. Indeed, such a rank deficiency provides a $t$-dimensional subspace $K subset.eq
  S$ with $cal(B) \( K \, T \) = 0$. The number of possible $K$ is

$ binom(b, t)_(#h(-0.16667em) 2) = 2^(t \( b - t \)) product_(i = 0)^(t - 1) frac(1 - 2^(i - b), 1 - 2^(i - t))
  lt.eq C_0 thin 2^(t \( b - t \)) \, wide C_0 = product_(j = 1)^oo \( 1 - 2^(- j) \)^(- 1) < oo . $

For a fixed $K$, set $e = dim \( K ∩ T \)$. Choose a basis of the intersection,
  extend it separately to bases of $K$ and $T$, and then extend their union to a basis of $bb(F)_2^m$.
  A change of basis preserves the uniform distribution on symmetric forms.
  In this basis, the equations $cal(B) \( K \, T \) = 0$ specify

$ t a - binom(e, 2) $

independent entries of the symmetric form. In fact there are $t a$ entries before using symmetry,
  and the only repetitions are the two orders of each off-diagonal pair inside $K ∩ T$.
  Diagonal entries in that intersection remain independent conditions, also in characteristic two.
  Since $e lt.eq t$ and $a gt.eq b$, the number of conditions is at least $t b - binom(t, 2)$.
  A union bound over $K$ gives Equation (5.1). The event is empty if $t > b$.

#thm([Proposition 5.1.])[
  (Uniform low-height rank tests).  #emph[For every pair of fixed constants $D \, A > 0$,
    there is a function $f_(D \, A) \( N \) arrow.r oo$ such that the following holds for every $m in
    cal(I)_N$ and all sufficiently large $N$, with probability at least $1 - 2^(- N f_(D \, A) \( N \))$ for $B =
    upright(bold(B))_m$. Simultaneously for every rational subspace $W subset.eq bb(R)^m$ with $H \( W \) lt.eq
    exp \( N ell^D \)$, one has]
  + #emph[$dim W^perp - "rank" \( B \|_(W^perp) \) lt.eq N ell^(- A)$;]
  + #emph[for every coordinate set $X subset.eq \[ m \]$,
$ "rank" #scale(x: 120%, y: 120%)[\[] pi_(W^perp) B e_i #scale(x: 120%, y: 120%)[\]]_(i in X) gt.eq
  min { \| X \| \, m - dim W } - N ell^(- A) . $

]
  #emph[The ranks and the orthogonal projections in these conclusions are over $bb(R)$;
    no nonsingularity assumption on $B$ is needed.]
] <prop:typical-ranks>

#proof[
  For any rational subspace $U subset.eq bb(R)^m$, the lattice $U ∩ bb(Z)^m$ is primitive in $bb(Z)^m$.
    Consequently an integer basis matrix $C_U$ of this lattice has full column rank modulo two:
    a basis of a primitive sublattice extends to a basis of $bb(Z)^m$.
    If $U \, V$ are rational, the matrix of the tested form is the integer matrix $C_U^(sans(T)) B C_V$.
    Its real rank is at least the rank of its reduction modulo two, because a nonzero minor modulo two is an odd,
    hence nonzero, integer minor. Moreover $B med mod med 2$ is uniform among symmetric matrices over $bb(F)_2$.
    Thus Equation (5.1) applies to the reductions of the column spaces of $C_U \, C_V$,
    which have the same respective dimensions as $U \, V$. Their intersection after reduction can be larger than
    the reduction of $U ∩ V$; the intersection correction in the preceding count accommodates this without any
    further assumption.
  The tests we need are $U = V$, and $V = E_X$. In the second case,
  $ "rank" #scale(x: 120%, y: 120%)[\[] pi_U B e_i #scale(x: 120%, y: 120%)[\]]_(i in X) =
    "rank" \( C_U^(sans(T)) B C_(E_X) \) \, $
  where $C_(E_X)$ consists of the coordinate vectors with indices in $X$.
    To see this equality, $C_U^(sans(T))$ annihilates $U^perp$ and is an isomorphism from $U$ to $bb(R)^(dim U)$.
    It therefore detects exactly the rank after projection to $U$.
  We also need stability when the testing subspace changes. For fixed $B$ and $X$, define
  $ delta_0 \( U \) = dim U - "rank" \( B \|_U \) \, wide delta_X \( U \) = min { \| X \| \, dim U } -
    "rank" \( C_U^(sans(T)) B C_(E_X) \) \, $
  where the second rank can equivalently be defined by the bilinear form on $U times E_X$,
    without choosing an integer basis. If $Z subset.eq U$, restricting a matrix to $Z times Z$ deletes $dim U -
    dim Z$ rows and the same number of columns. Its rank decreases by an amount between zero and twice that
    number. Hence
  $ \| delta_0 \( U \) - delta_0 \( Z \) \| lt.eq dim U - dim Z . $
  For the form on $U times E_X$, the rank and the quantity $min { \| X \| \,
    dim U }$ each decrease by an amount between zero and $dim U - dim Z$.
    The same inequality follows for $delta_X$. Taking $Z = U ∩ V$ in these two inequalities gives
  #[#set math.equation(numbering: n => "(5.2)")
   $ \| delta_0 \( U \) - delta_0 \( V \) \| lt.eq d \( U \, V \) \, wide \| delta_X \( U \) -
     delta_X \( V \) \| lt.eq d \( U \, V \) . $ <eq:typical-rank-stability>]
  Here $d \( U \, V \) = dim U + dim V - 2 dim \( U ∩ V \)$,
    and the dimension formula also gives $d \( U^perp \, V^perp \) = d \( U \, V \)$.
  Fix $D \, A$, put $s = N ell^(- A)$, and apply Theorem 17 with precision exponent $P = 2 A + 4$.
    For each $m in cal(I)_N$, it gives a list $cal(C)_m$ of rational subspaces with
  $ \| cal(C)_m \| lt.eq 2^(N^2 ell^(- P)) \, wide min_(V in cal(C)_m) d \( W \, V \) lt.eq N ell^(- P) $
  for every $W$ in the height range of the proposition. Set $t = ceil.l s \/ 2 ceil.r$.
    Apply Equation (5.1) to $U = V^perp$ for every $V in cal(C)_m$,
    both to its restricted form and to its form against every $E_X$.
    The comparison of real and mod-two ranks above shows that the probability that any of these real deficiencies
    is at least $t$ is at most
  $ C_0 \( 1 + 2^m \) thin 2^(N^2 ell^(- P) - t \( t + 1 \) \/ 2) lt.eq 2^(- Omega \( N^2 ell^(- 2 A) \)) . $
  In the last inequality, $N^2 ell^(- P) = o \( N^2 ell^(- 2 A) \)$ and $m = o \( N^2 ell^(- 2 A) \)$,
    uniformly in the stated range of $m$. Tests whose smaller dimension is less than $t$ need not be included.
  Outside this event, choose a covering $V$ for a given $W$.
    Equation (5.2), applied to their orthogonal complements, bounds each deficiency for $W$ by
  $ t - 1 + N ell^(- P) < s $
  for all sufficiently large $N$. This holds simultaneously for all such $W$ and all $X$.
    Finally, $N ell^(- 2 A) arrow.r oo$, so the displayed exceptional probability has the form required in the
    statement. ◻
]

#thm([Corollary 5.2.])[
  (Inverse restriction rank).  #emph[For every pair of fixed constants $D \, A > 0$,
    typically for nonsingular binary matrices $B$ of size $m in cal(I)_N$,
    simultaneously for every rational $W subset.eq bb(R)^m$ with $H \( W \) lt.eq exp \( N ell^D \)$,
$ "rank" \( B^(- 1) \|_W \) gt.eq dim W - N ell^(- A) . $

 Here $B^(- 1) \|_W$ is the restriction of the bilinear form with matrix $B^(- 1)$,
   rather than the restriction of its associated linear map.
   The exceptional probability is uniform in $m$, as in Proposition 18.]
] <cor:inverse-rank>

#proof[
  The two radicals are
  $ "rad" \( B \|_(W^perp) \) = W^perp ∩ B^(- 1) W \, wide "rad" \( B^(- 1) \|_W \) = W ∩ B \( W^perp \) . $
  Since $B$ is nonsingular, multiplication by $B$ is an isomorphism from the first space onto the second,
    with inverse multiplication by $B^(- 1)$. Their dimensions are equal.
    The first assertion of Proposition 18 therefore gives the claimed rank for the inverse form,
    on the same typical set. ◻
]

=== 5.2 Corank modulo all primes <corank-modulo-all-primes>

For nonsingular $B$ and every prime $p$, the presentation of $G_B$ gives

$ k_B \( p \, 1 \) = dim_(bb(F)_p) \( G_B \/ p G_B \) = "corank"_(bb(F)_p) \( B med mod med p \) . $

This dimension is the minimum number of generators of the $p$-primary part, and $k_B \( p \, e \) lt.eq
  k_B \( p \, 1 \)$ for every $e$. A uniform bound on these coranks will therefore control the generators needed
  for quotients of $G_B$ and cap its layer heights.

#thm([Proposition 5.3.])[
  (Uniform prime corank).  #emph[Typically for nonsingular binary matrices $B$ of size $m in cal(I)_N$, one has,
    simultaneously for every prime $p$,
$ "corank"_(bb(F)_p) \( B med mod med p \) lt.eq N^(3 \/ 5) . $

 More precisely, uniformly for $m in cal(I)_N$, the probability of nonsingularity together with failure of this
   assertion is at most $2^(- Omega \( N^(6 \/ 5) \))$.]
] <prop:prime-corank>

#proof[
  If $B$ is nonsingular over $bb(R)$, its determinant is a nonzero integer.
    Every prime at which its reduction has positive corank divides that determinant. Hadamard’s inequality gives
  $ 1 lt.eq \| det B \| lt.eq m^(m \/ 2) lt.eq N^(N \/ 2) \, $
  so it suffices to consider primes $p lt.eq N^(N \/ 2)$. For each such prime, Lemma 4, with field $bb(F)_p$,
    bounds the probability of corank greater than $N^(3 \/ 5)$ by $2^(- c N^(6 \/ 5))$ for an absolute $c > 0$,
    uniformly in $p$ and $m$. Even bounding the number of these primes by $N^(N \/ 2)$, the union bound is
  $ 2^(\( N \/ 2 \) log_2 N - c N^(6 \/ 5)) lt.eq 2^(- c N^(6 \/ 5) \/ 2) $
  for all sufficiently large $N$. This also proves the asserted uniformity. ◻
]

=== 5.3 Few eigenvalues near zero <few-eigenvalues-near-zero>

#thm([Proposition 5.4.])[
  (Typical small-spectrum bound).  #emph[For every fixed $A > 0$,
    there is a fixed $C_A > 0$ and a function $f_A \( N \) arrow.r oo$ such that,
    for every $m in cal(I)_N$ and all sufficiently large $N$, with probability at least $1 - 2^(- N f_A \( N \))$,
    the number of eigenvalues of $B = upright(bold(B))_m$ in
$ \[ - sqrt(N) thin ell^(- C_A) \, med sqrt(N) thin ell^(- C_A) \] $

 is at most $N ell^(- A)$. Eigenvalues are counted with multiplicity. One may take $C_A = A + 6$.
   This assertion does not require $B$ to be nonsingular.]
] <prop:typical-spectrum>

#proof[
  #strong[Mean bound.] Let $J_m$ be the all-ones matrix and write
  $ 2 B = J_m + S \, wide X = S \/ sqrt(m) . $
  The entries of $S$ on and above the diagonal are independent uniform signs.
    We first bound the number of eigenvalues of $X$ in a short interval about zero.
  The limiting moments in the following calculation are those of Wigner’s semicircle law [18].
    We include the closed-walk enumeration to obtain the quantitative error bound needed here. Let
  $ d mu_(upright("sc")) \( x \) = frac(1, 2 pi) sqrt(4 - x^2) thin upright(bold(1))_(\[ - 2 \, 2 \]) \( x \) thin
    d x . $
  For $i gt.eq 1$ with $i + 1 lt.eq m$,
  #[#set math.equation(numbering: n => "(5.3)")
   $ lr(|1 / m bb(E) "Tr" X^(2 i) - integral x^(2 i) thin d mu_(upright("sc")) \( x \)|) lt.eq
     frac(\( 2 i + 1 \)^(2 i + 2), m) \, wide bb(E) "Tr" X^(2 i - 1) = 0 . $ <eq:typical-walk-moments>]
  To prove it, expand the normalized trace as
  $ 1 / m bb(E) "Tr" X^k = m^(- 1 - k \/ 2) sum_(v_0 \, dots.h \, v_(k - 1) in \[ m \]) bb(E)
    product_(r = 0)^(k - 1) S_(v_r v_(r + 1)) \, wide v_k = v_0 . $
  Each summand is a closed walk, with edges regarded as unordered and loops allowed.
    Its expectation is one if every distinct edge is used an even number of times, and is zero otherwise.
    This proves the odd-moment assertion. For $k = 2 i$, a contributing walk has at most $i$ distinct edges.
    Its graph is connected, and hence has at most $i + 1$ vertices.
    Equality forces exactly $i$ nonloop edges, each used twice, forming a tree.
    When vertices are named in order of first appearance, these walks are in bijection with Dyck words of length
    $2 i$: the first traversal of a tree edge raises the depth, and its return traversal lowers it.
    Their number is the Catalan number $upright("Cat")_i = \( i + 1 \)^(- 1) binom(2 i, i)$,
    and each has $\( m \)_(i + 1) = m \( m - 1 \) dots.h.c \( m - i \)$ injective labelings.
  The contribution of these tree walks is therefore $upright("Cat")_i \( m \)_(i + 1) \/ m^(i + 1)$.
    Its difference from $upright("Cat")_i$ is at most $upright("Cat")_i i \( i + 1 \) \/ \( 2 m \)$, using $1 -
    product_(h = 0)^i \( 1 - h \/ m \) lt.eq sum_(h = 0)^i h \/ m$.
    Every remaining contributing walk has at most $i$ vertices.
    There are at most $\( 2 i + 1 \)^(2 i)$ canonical vertex sequences,
    a crude bound obtained by allowing each position any of $2 i + 1$ names.
    Each such sequence has at most $m^i$ labelings and so contributes at most $1 \/ m$ after normalization.
    Finally, elementary beta integration gives
  $ integral x^(2 i) thin d mu_(upright("sc")) \( x \) = frac(\( 2 i \) !, i ! \( i + 1 \) !) = upright("Cat")_i \, $
  and its odd moments vanish. Combining these estimates, and using $upright("Cat")_i lt.eq 4^i$, gives Equation (5.3).
  Fix the exponent $A$ in the proposition and put
  $ w = ell^(- A - 5) \, wide j = ceil.l ell^(2 A + 4) ceil.r \, wide f \( x \) = \( 1 - \| x \| \/ w \)_(+) \,
    wide p_j \( x \) = 2 \( 1 - x^2 \/ 16 \)^(2 j) . $
  For all large $N$, $f \( x \) lt.eq p_j \( x \)$ for every real $x$.
    Outside $\[ - w \, w \]$ this follows from nonnegativity of the even power.
    Inside that interval, Bernoulli’s inequality gives
  $ p_j \( x \) gt.eq 2 \( 1 - w^2 \/ 16 \)^(2 j) gt.eq 2 \( 1 - j w^2 \/ 8 \) gt.eq 1 gt.eq f \( x \) \, $
  because $j w^2 = O \( ell^(- 6) \)$. All moments in $p_j$ have degree at most $4 j$, and $2 j + 1 lt.eq
    m$ uniformly in $m in cal(I)_N$ for large $N$. Expanding this polynomial and applying Equation (5.3) term by
    term, the sum of the absolute values of its coefficients is $2 \( 17 \/ 16 \)^(2 j)$. Consequently
  $ lr(|1 / m bb(E) "Tr" p_j \( X \) - integral p_j thin d mu_(upright("sc"))|) lt.eq
    frac(2 \( 17 \/ 16 \)^(2 j) \( 4 j + 1 \)^(4 j + 2), m) = m^(- 1 + o \( 1 \)) . $
  This estimate verifies the required growing degrees: indeed
  $ j log \( j + 1 \) = O_A \( ell^(2 A + 4) log ell \) = o \( log m \) $
  uniformly in the stated range. In particular the last error is $o \( ell^(- A) \)$.
    On the support of $mu_(upright("sc"))$, $\( 1 - x^2 \/ 16 \)^(2 j) lt.eq
    exp \( - j x^2 \/ 8 \)$ and the density is at most $1 \/ pi$. Thus
  $ integral p_j thin d mu_(upright("sc")) lt.eq 2 / pi integral_(bb(R)) e^(- j x^2 \/ 8) thin d x =
    O \( j^(- 1 \/ 2) \) = O \( ell^(- A - 2) \) . $
  The pointwise majorization now proves
  #[#set math.equation(numbering: n => "(5.4)")
   $ bb(E) "Tr" f \( X \) = o \( m ell^(- A) \) \, $ <eq:typical-tent-mean>]
  again uniformly in $m$.
  #strong[Concentration and translation to $B$.] We next obtain concentration strong enough for typicality. Pointwise,
  $ f \( x \) = 1 - g_1 \( x \) + g_2 \( x \) \, wide g_1 \( x \) = \| x \| \/ w \, wide
    g_2 \( x \) = \( \| x \| \/ w - 1 \)_(+) . $
  Both $g_1 \, g_2$ are convex and $1 \/ w$-Lipschitz. Their traces are convex functions of a real symmetric
    matrix. For completeness, if $M_(+)$ denotes its spectral positive part, then
  $ "Tr" M_(+) = max_(0 prec.curly.eq P prec.curly.eq I) "Tr" \( P M \) . $
  The identities
  $ "Tr" g_1 \( M \) = w^(- 1) #scale(x: 120%, y: 120%)[\(] "Tr" M_(+) +
    "Tr" \( - M \)_(+) #scale(x: 120%, y: 120%)[\)] \, wide "Tr" g_2 \( M \) = "Tr" \( M \/ w - I \)_(+) +
    "Tr" \( - M \/ w - I \)_(+) $
  express each trace as a sum of suprema of affine functions of $M$, which proves convexity.
  Let $y = \( y_(a b) \)_(a lt.eq b)$ be an arbitrary real vector of independent upper-triangular coordinates,
    and form $X \( y \) = S \( y \) \/ sqrt(m)$ by symmetric reflection.
    For real symmetric matrices, the Hoffman–Wielandt inequality [9] Theorem 1 and Remark 2,
    with their eigenvalues ordered, states that
  $ sum_(i = 1)^m \| lambda_i \( M \) - lambda_i \( M' \) \|^2 lt.eq parallel M - M' parallel_F^2 . $
  It follows by Cauchy–Schwarz that for $a = 1 \, 2$,
  $ \| "Tr" g_a \( X \( y \) \) - "Tr" g_a \( X \( z \) \) \| lt.eq sqrt(m) / w parallel X \( y \) -
    X \( z \) parallel_F lt.eq sqrt(2) / w parallel y - z parallel_2 . $
  The last inequality uses $parallel X \( y \) - X \( z \) parallel_F^2 lt.eq \( 2 \/ m \) parallel y -
    z parallel_2^2$. Thus each trace is convex and $L$-Lipschitz as a function of the independent coordinates,
    with $L = sqrt(2) \/ w$.
  Talagrand’s convex Lipschitz concentration theorem on the product cube [15] Theorem 3 implies that,
    for universal $c \, C > 0$, if $F : bb(R)^d arrow.r bb(R)$ is convex and globally $L$-Lipschitz for the
    Euclidean norm, then its value at independent uniform signs satisfies
  $ Pr \( \| F - bb(E) F \| > u \) lt.eq C exp \( - c u^2 \/ L^2 \) wide \( u gt.eq 0 \) . $
  The usual statement about a median implies this form: integrating its tail bounds the difference between the
    median and the expectation by $O \( L \)$, which can be absorbed by adjusting $c \, C$.
    Apply the theorem to the two traces. By Equation (5.4), their difference $"Tr" f \( X \) = m -
    "Tr" g_1 \( X \) + "Tr" g_2 \( X \)$ has expectation at most $m ell^(- A) \/ 8$ for large $N$.
    If it exceeds $m ell^(- A) \/ 4$, at least one of the two convex traces deviates from its expectation by more
    than $m ell^(- A) \/ 16$. Therefore
  #[#set math.equation(numbering: n => "(5.5)")
   $ Pr #scale(x: 120%, y: 120%)[\(] "Tr" f \( X \) > m ell^(- A) \/ 4 #scale(x: 120%, y: 120%)[\)] lt.eq
     2 C exp #scale(x: 120%, y: 120%)[\(] - c' m^2 ell^(- 2 A) w^2 #scale(x: 120%, y: 120%)[\)] lt.eq
     2^(- c_A N^2 ell^(- 4 A - 10)) $ <eq:typical-tent-tail>]
  for some $c' \, c_A > 0$ and all sufficiently large $N$, uniformly in $m$.
    Since $N ell^(- 4 A - 10) arrow.r oo$, this is a $2^(- N f_A \( N \))$ exceptional probability with
    $f_A \( N \) arrow.r oo$.
  On the complementary event, $f gt.eq 1 \/ 2$ on $\[ - w \/ 2 \, w \/ 2 \]$ shows that $X$ has at most $m
    ell^(- A) \/ 2$ eigenvalues in that interval. Finally $2 B \/ sqrt(m) = X +
    J_m \/ sqrt(m)$ is a rank-one perturbation of $X$. Eigenvalue interlacing changes the cumulative eigenvalue
    count at either endpoint of an interval by at most one, so it can increase the count in any interval by at
    most two. Take $C_A = A + 6$. Uniformly for $m in cal(I)_N$,
  $ 2 sqrt(N \/ m) thin ell^(- C_A) lt.eq w \/ 2 $
  for all sufficiently large $N$. The eigenvalues of $B$ in the interval of the proposition therefore number at most
  $ 1 / 2 m ell^(- A) + 2 lt.eq N ell^(- A) . $
  Together with Equation (5.5), this proves the proposition. ◻
]

== 6 The discriminant pairing and admissible columns <sec:discriminant>

We prove Proposition 7. The arithmetic part of the proof colors isotropic elements of the discriminant group so
  that the pairing on differences within one color has controlled image order.
  The geometric part converts this order bound into a dimension bound for a robust subset of admissible columns.

=== 6.1 Orthogonal blocks and a coloring of isotropic elements <orthogonal-blocks-and-a-coloring-of-isotropic-elements>

For a nonsingular symmetric integer matrix $B$, the formula

$ lambda_B \( macron(x) \, macron(y) \) = x^(sans(T)) B^(- 1) y med mod med
  bb(Z) wide \( macron(x) \, macron(y) in G_B \) $

defines a symmetric pairing with values in $bb(Q) \/ bb(Z)$.
  Changing $x$ or $y$ by a vector in $B bb(Z)^m$ changes the displayed value by an integer.
  Moreover, if $lambda_B \( macron(x) \, macron(y) \) = 0$ for every $y in bb(Z)^m$, then $B^(- 1) x in bb(Z)^m$,
  so $macron(x) = 0$. Thus the induced map from $G_B$ to $"Hom" \( G_B \, bb(Q) \/ bb(Z) \)$ is an isomorphism.
  We call such a pairing #emph[perfect].

Distinct primary components are orthogonal: a pairing value between an element of $p$-power order and one of
  $q$-power order is annihilated by coprime powers when $p eq.not q$.
  The restriction to each primary component is consequently perfect.
  An element is #emph[isotropic] if its self-pairing is zero.
  If an element of $G_B$ is isotropic, then so is its projection to each primary component,
  by the uniqueness of primary decomposition in $bb(Q) \/ bb(Z)$.
  In particular the class of every $z in cal(S) \( B \)$ is isotropic.

Orthogonal decompositions of these pairings are standard in the theory of finite linking forms;
  see Miranda [12] Section 1. We include the elementary splitting argument and the precise block forms needed here.

#thm([Lemma 6.1.])[
  (Orthogonal block decomposition).  #emph[Let $G$ be a finite abelian $p$-group with a perfect symmetric pairing
    $lambda : G times G arrow.r bb(Q) \/ bb(Z)$. It is an orthogonal direct sum of blocks of the following forms:]
  + #emph[a cyclic group of order $p^j$ whose generator has self-pairing $a \/ p^j med mod med bb(Z)$,
    with $p divides.not a$;]
  + #emph[when $p = 2$, a group $\( bb(Z) \/ 2^j bb(Z) \)^2$ with pairing matrix
$ 2^(- j) mat(delim: "(", 2 a, c; c, 2 d) med mod med bb(Z) \, wide c med upright("odd") . $

]
] <lem:discriminant-blocks>

#proof[
  Let $p^j$ be the exponent of a nonzero group still to be split.
    If some element has self-pairing of order $p^j$, it has order $p^j$ and its cyclic subgroup is a block of the
    first kind. Otherwise choose an element $x$ of order $p^j$.
    Perfectness implies that the character $lambda \( x \, dot.op \)$ has order $p^j$,
    so there is an element $y$ for which $lambda \( x \, y \)$ has order $p^j$.
    Write the three pairing values on $x \, y$, with denominator $p^j$, using numerators $a \, c \, d$,
    respectively. Then $c$ is a unit modulo $p$, while $a \, d$ are divisible by $p$.
    For odd $p$, the self-pairing numerator of $x + y$ is $a + 2 c + d$, a unit,
    so again a block of the first kind is available.
  For $p = 2$, the two diagonal numerators are even and the off-diagonal numerator is odd.
    The resulting two by two numerator matrix is invertible modulo $2^j$.
    Pairing a relation between $x \, y$ with $x \, y$ therefore shows that its two coefficients vanish modulo
    $2^j$. Thus they span $\( bb(Z) \/ 2^j bb(Z) \)^2$, and the restriction of the pairing to this subgroup is
    perfect, giving the second kind of block.
  It remains to justify splitting a block $H$ off orthogonally.
    Because the pairing on $H$ is perfect, for any $g in G$ there is a unique $h in
    H$ such that $lambda \( g \, dot.op \) \|_H = lambda \( h \, dot.op \) \|_H$. Hence $g - h in H^perp$.
    Also $H ∩ H^perp = 0$, so $G = H xor H^perp$. The pairing on $H^perp$ is perfect,
    since an element annihilating both summands annihilates $G$. Iteration proves the decomposition. ◻
]

The exponents of the cyclic factors in this decomposition are the invariant exponents $b_1 gt.eq b_2 gt.eq
  dots.h.c$ of $G$. A block of the second kind contributes two equal exponents.

#thm([Lemma 6.2.])[
  (Primary coloring).  #emph[In the setting of Lemma 22, put $h = b_3$, with zero exponents appended as necessary.
    In an orthogonal block decomposition, let $U$ be the sum of the blocks of exponent strictly greater than $h$,
    and let $T$ be the remaining sum. There is a coloring of the isotropic elements of $G$ with $C_p$ colors such
    that elements $x \, y$ of one color satisfy
#[#set math.equation(numbering: n => "(6.1)")
 $ p^h lambda_U \( x_U \, y_U \) = 0 quad upright("in ") bb(Q) \/ bb(Z) . $ <eq:primary-color-pairing>]

 Here $x_U \, y_U$ denote the projections to $U$. The color counts may be chosen to satisfy
$ C_p lt.eq 1 + 8 b_1 \, wide C_p lt.eq 2^(b_2 - b_3) quad upright("if ") p upright(" is odd") . $

]
] <lem:primary-coloring>

The cutoff at $b_3$ leaves at most two cyclic factors above it.
  Up to a lower-order error, the color count will be charged to height-two layers,
  while layers of height at least three will control the order of the pairing image on differences within one color.

#proof[
  The exponent of $T$ divides $p^h$. Isotropy and orthogonality therefore imply
  #[#set math.equation(numbering: n => "(6.2)")
   $ p^h lambda_U \( x_U \, x_U \) = 0 $ <eq:top-self-denominator>]
  for every element under consideration. There are at most two cyclic factors in $U$.
    A block of the second kind cannot be divided by the cutoff at $h$, since its two factors have equal exponent.
    We can thus handle all possibilities explicitly. In the following, $v_p \( 0 \) = + oo$;
    for a nonzero cyclic coordinate its valuation is that of any representative not divisible by the full modulus.
  If $U = 0$, use one color. If it has one factor, this is a cyclic block of exponent $j > h$,
    with coordinate $x$ and a unit self-pairing numerator. Equation (6.2) forces
  $ v_p \( x \) gt.eq ⌈frac(j - h, 2)⌉ . $
  Two such coordinates have mutual pairing annihilated by $p^h$, so again one color suffices.
  Suppose next that $U$ consists of two orthogonal cyclic blocks of exponents $j gt.eq i > h$,
    with respective unit self-pairing numerators $a_1 \, a_2$. For their coordinates $x \, y$, put
  $ F = max { j - 2 v_p \( x \) \, thin i - 2 v_p \( y \) } . $
  Use one #emph[deep] color for $F lt.eq h$. Two deep elements have the required mutual denominator term by term,
    since the sum of the two valuations in either coordinate is at least its exponent minus $h$.
    If $F > h$, the two entries in the maximum must equal $F$.
    Otherwise the term of largest denominator in the self-pairing could not cancel, contrary to Equation (6.2).
    In particular $F lt.eq i$, and $F$ has the parity of both $i$ and $j$. Write
  $ x = p^(\( j - F \) \/ 2) X \, wide y = p^(\( i - F \) \/ 2) Y \, $
  where $X \, Y$ are units. With $n = F - h > 0$, the self-pairing condition is
  $ a_1 X^2 + a_2 Y^2 equiv 0 med \( mod med p^n \) . $
  The residues of $X \, Y$ modulo $p^n$ are well defined: they are determined modulo $p^(\( j + F \) \/ 2)$ and
    $p^(\( i + F \) \/ 2)$, respectively, and both exponents are at least $F gt.eq n$.
    Color this element by $F$ and $r = X Y^(- 1) med mod med p^n$.
    Its ratio satisfies $r^2 equiv - a_2 a_1^(- 1) med \( mod med p^n \)$.
    For two elements with the same color, using primes for the coordinates of the second one,
  $ a_1 X X' + a_2 Y Y' equiv Y Y' \( a_1 r^2 + a_2 \) equiv 0 med \( mod med p^n \) . $
  This is precisely Equation (6.1).
  For completeness, a unit square has at most two square roots modulo an odd prime power and at most four modulo a
    power of $2$. Indeed, for two unit roots $r \, s$, the modulus divides $\( r - s \) \( r + s \)$.
    At an odd prime at most one factor is divisible by $p$, giving $r equiv s$ or $r equiv -
    s med \( mod med p^n \)$. At $2$, for odd $r \, s$, one of $r - s \, r +
    s$ has valuation exactly one and the other is divisible by four,
    with the convention of infinite valuation at zero. For $n gt.eq 2$ this gives $r equiv s$ or $r equiv -
    s med \( mod med 2^(n - 1) \)$, allowing at most four residues modulo $2^n$; $n = 1$ is immediate.
  There are at most $ceil.l \( i - h \) \/ 2 ceil.r$ possible nondeep values of $F$.
    At odd $p$, the count is thus at most $1 + 2 ceil.l \( i - h \) \/ 2 ceil.r$.
    For $i - h gt.eq 2$ this is at most $2^(i - h)$. If $i - h = 1$ and a nondeep element exists,
    its value is $F = h + 1$. The parity just established shows that in a deep element the two
    exponent-minus-twice-valuation quantities are at most $h - 1$.
    In the coordinate of exponent $j$, for example, a deep valuation is at least $\( j - h + 1 \) \/ 2$,
    whereas a nondeep valuation is $\( j - h - 1 \) \/ 2$. Their sum is at least $j - h$,
    and the same argument applies to the coordinate of exponent $i$.
    Every deep element therefore has the required mutual denominator with every nondeep element.
    Merge the deep color into one nondeep color, leaving at most two colors.
    If there is no nondeep element, one color suffices. This proves the odd-prime bound in this case.
    At $2$, the unmerged count is at most $1 + 4 ceil.l \( i - h \) \/ 2 ceil.r$,
    which satisfies the asserted polynomial bound.
  The remaining possibility is a single block of the second kind at $2$, of exponent $j > h$.
    Write its numerator matrix as $mat(delim: "(", 2 a, c; c, 2 d)$ with $c$ odd, and put
  $ t = min { v_2 \( x \) \, v_2 \( y \) } \, wide F = j - 2 t . $
  Again use a deep color for $F lt.eq h$. For two deep elements,
    the valuation of each coordinate in each element is at least $ceil.l \( j - h \) \/ 2 ceil.r$,
    which proves the mutual denominator bound. For $F > h$, write $x = 2^t X \, y = 2^t Y$,
    so at least one of $X \, Y$ is odd, and put $n = F - h$. Choose the first coordinate as pivot if it is odd,
    and otherwise choose the second. After ordering the pivot first, call it $u$, call the other coordinate $v$,
    and write
  $ f \( X \, Y \) = a X^2 + c X Y + d Y^2 \, $
  interchanging $a \, d$ when the second coordinate is the pivot.
    The self-pairing numerator is twice this quadratic form. Thus Equation (6.2) says
  $ f \( u \, v \) equiv 0 med \( mod med 2^(n - 1) \) \, $
  where the condition is empty for $n = 1$. Color the element by $F$, the pivot, and $r = v u^(- 1) med mod med
    2^n$. This ratio satisfies
  $ f \( 1 \, r \) = a + c r + d r^2 equiv 0 med \( mod med 2^(n - 1) \) . $
  The ratio is well defined modulo $2^n$, since the normalized coordinates are determined modulo $2^(j - t)$ and
    $n lt.eq j - t$. Its derivative $c + 2 d r$ is odd. Every root modulo $2^alpha$, for $alpha gt.eq 1$,
    therefore has exactly one root lift modulo $2^(alpha + 1)$:
    the two possible lifts change the value modulo $2^(alpha + 1)$ by $2^alpha$ times an odd number.
    There are at most two roots modulo $2$. It follows that there are at most four permissible ratios modulo
    $2^n$, including the one extra bit beyond the modulus in the self-pairing condition.
    This bound also holds for $n = 1$.
  For two elements of the same color, their normalized pivot coordinates are odd numbers $u \,
    u'$ and their ratios satisfy $r' equiv r med \( mod med 2^n \)$. Their bilinear numerator modulo $2^n$ is
  $ u u' #scale(x: 120%, y: 120%)[\(] 2 a + c \( r + r' \) + 2 d r r' #scale(x: 120%, y: 120%)[\)] equiv
    2 u u' f \( 1 \, r \) equiv 0 med \( mod med 2^n \) . $
  Restoring the common factor $2^(2 t)$ proves Equation (6.1).
    There are at most $b_1$ possible values of $F > h$, two pivots, and four ratios at each pivot,
    so the count is at most $1 + 8 b_1$. The same bound holds in all preceding cases.
    Finally, the number of factors above $h$ is zero, one, or two according as handled above,
    and their second exponent satisfies $i - h = b_2 - b_3$ when there are two. This proves the asserted bounds. ◻
]

Apply Lemma 23 independently to the primary components of $G_B$.
  An overall color is the tuple of its primary colors; let $C_(upright("col")) \( B \)$ be the product of the
  counts over the nontrivial primary components. The following explicit estimate is the color cost that we need:

#[#set math.equation(numbering: n => "(6.3)")
 $ frac(log_2 C_(upright("col")) \( B \), N) lt.eq 5 / 4 sum_(p \, e\
k_B \( p \, e \) = 2) nu_p + O \( N^(- 1 \/ 5) log N \) lt.eq beta sum_(p \, e\
k_B \( p \, e \) = 2) nu_p + O \( N^(- 1 \/ 5) log N \) . $ <eq:discriminant-color-cost>]

Indeed, for $p gt.eq N^(4 \/ 5)$ the prime is odd for large $N$,
  and the logarithm of its color count is at most $b_(p \, 2) - b_(p \, 3)$.
  This difference is exactly the number of its height-two layers, while $nu_p gt.eq 4 \/ \( 5 N \)$.
  These primes give the first term of the first bound. For $p < N^(4 \/ 5)$, use instead $C_p lt.eq 1 +
  8 b_(p \, 1)$. The order bound for $G_B$ gives

$ b_(p \, 1) lt.eq log_2 \| G_B \| lt.eq \( N \/ 2 \) log_2 N . $

There are at most $N^(4 \/ 5)$ such primes, so they cost $O \( N^(4 \/ 5) log N \)$ bits in total.
  This proves the first bound; the second uses $5 \/ 4 < beta = 7 \/ 5$.
  The error term in Equation (6.3) is $o \( ell^(- A) \)$ for every fixed $A > 0$.

Set

#[#set math.equation(numbering: n => "(6.4)")
 $ J_B = sum_(p \, e\
k_B \( p \, e \) gt.eq 3) k_B \( p \, e \) nu_p . $ <eq:discriminant-high-weight>]

Equation (2.3) gives $0 lt.eq J_B lt.eq 1 \/ 2$.

#thm([Lemma 6.3.])[
  (Pairing image on differences).  #emph[Let $X$ be a set of isotropic elements of $G_B$ in a single overall
    color, and let
$ H = chevron.l x - y : x \, y in X chevron.r subset G_B . $

 For the restricted pairing map
$ theta_H : H arrow.r "Hom" \( H \, bb(Q) \/ bb(Z) \) \, wide theta_H \( u \) = lambda_B \( u \, dot.op \) \|_H \, $

 one has
$ \| "im" theta_H \| lt.eq N^(N J_B) . $

]
] <lem:colored-image-order>

#proof[
  Fix a prime and abbreviate $h = b_(p \, 3)$. In the orthogonal decomposition $G_(B \, p) =
    U xor T$ used in Lemma 23, let $d = \# { i : b_(p \, i) > h } lt.eq 2$.
    Project the $p$-primary part of $H$ to subgroups $H_U subset U$ and $H_T subset T$.
    Every pairing between projections of elements of $X$ is annihilated by $p^h$ on $U$.
    Bilinearity gives the same conclusion for pairings of arbitrary elements of $H_U$,
    since these are generated by projections of differences.
  A subgroup of a finite abelian $p$-group with $d$ cyclic factors has at most $d$ generators.
    One way to see this is that its minimal number of generators equals the dimension of its subgroup annihilated
    by $p$, which is at most $dim_(bb(F)_p) U \[ p \] = d$. The image of the restricted pairing map on $H_U$ is a
    quotient of $H_U$, and it is annihilated by $p^h$. Its order is therefore at most $p^(h d)$.
    The image order of the restricted pairing on $H_T$ is at most $\| H_T \| lt.eq \| T \|$.
  Pull these two pairings back to the $p$-primary part of $H$.
    The image of the sum of their maps is contained in the sum of their images,
    whose order is at most the product of the two orders. Consequently the image order at this prime is at most
  $ \| T \| p^(h d) = p^(sum_i min \( b_(p \, i) \, h \)) = p^(sum_(e lt.eq b_(p \, 3)) k_B \( p \, e \)) . $
  The range $e lt.eq b_(p \, 3)$ is exactly the range in which $k_B \( p \, e \) gt.eq 3$.
    Distinct primary pairings are orthogonal, so multiplying the last bound over primes gives
  $ \| "im" theta_H \| lt.eq product_p p^(sum_(e : thin k_B \( p \, e \) gt.eq 3) k_B \( p \, e \)) = N^(N J_B) \, $
  as required. ◻
]

=== 6.2 The graph lattice and the spectral comparison <the-graph-lattice-and-the-spectral-comparison>

We first record the determinant consequence of a pairing image bound.
  All lattice determinants in this section are Euclidean covolumes in their real spans.

#thm([Lemma 6.4.])[
  (Pairing index and determinant).  #emph[Let $L$ be a lattice, let $V = "span" L$,
    and let $q$ be a symmetric bilinear form on $V$ such that $q \( L \, L \) subset bb(Q)$. Write
$ K = L ∩ "rad" q \, wide S = V ∩ \( "rad" q \)^perp \, wide macron(L) = "proj"_S L . $

 Then $K$ spans the radical and is primitive in $L$, and $macron(L)$ is a lattice in $S$.
   If $t$ is the order of the image of
$ L arrow.r "Hom" \( L \, bb(Q) \/ bb(Z) \) \, wide x mapsto q \( x \, dot.op \) med mod med bb(Z) \, $

 then
#[#set math.equation(numbering: n => "(6.5)")
 $ lr(|det_(upright("orth")) \( q \|_S \)|) gt.eq frac(1, t \( det macron(L) \)^2) =
   frac(\( det K \)^2, t \( det L \)^2) . $ <eq:pairing-determinant>]

 Here the determinant on the left is taken in an orthonormal basis of $S$, and all rank-zero determinants are one.]
] <lem:pairing-determinant>

#proof[
  The matrix of $q$ in an $L$-basis is rational. Its kernel is therefore rational in that basis,
    so $K$ spans the radical. It is primitive because it is the intersection of $L$ with a real subspace.
    Extending a basis of $K$ to a basis of $L$ shows both that $macron(L)$ is a lattice and that
  $ det L = det K thin det macron(L) . $
  The form vanishes whenever one argument is in the radical, so it descends to the projected lattice $macron(L)$.
    Its pairing map there has the same image order $t$: the quotient $L arrow.r macron(L)$ is surjective,
    and pullback injects $"Hom" \( macron(L) \, bb(Q) \/ bb(Z) \)$ into $"Hom" \( L \, bb(Q) \/ bb(Z) \)$.
    The image is finite because the form has rational entries in a lattice basis.
  Let $M$ be its matrix in a basis of $macron(L)$, of rank $s = dim S$. It is a nonsingular rational matrix.
    The kernel of the pairing modulo $bb(Z)$ in $bb(Z)^s$ has index $t$; choose its integer basis matrix $A$,
    so $\| det A \| = t$. The matrix $A^(sans(T)) M$ is integral. It has nonzero determinant, and hence
  $ 1 lt.eq \| det \( A^(sans(T)) M \) \| = t \| det M \| . $
  This uses the pairing index on one side of the matrix. If $P$ is the basis matrix of $macron(L)$ in orthonormal
    coordinates on $S$, then $M = P^(sans(T)) M_(upright("orth")) P$ and $\| det P \| = det macron(L)$. Thus
  $ \| det M_(upright("orth")) \| = frac(\| det M \|, \( det macron(L) \)^2) gt.eq frac(1, t \( det macron(L) \)^2) \, $
  which proves Equation (6.5). The rank-zero case has $t = 1$ and follows from the stated conventions. ◻
]

#proof[
  Fix $A > 0$, and choose a fixed $P > A + 2$. Intersect the typical event of Corollary 19 with exponent $D =
    2$ in the subspace height bound and precision $P$, and that of Proposition 21 with precision $P$.
    This is a typical event uniformly for $m in cal(I)_N$. On it the rank conclusion holds simultaneously for
    every rational subspace $W subset bb(R)^m$ with $H \( W \) lt.eq exp \( N ell^2 \)$;
    the spectral conclusion holds for $B$ itself. We will verify that the subspace selected below meets this
    height bound, so the selection may depend on $B$ and on all its admissible columns.
  Fix a nonsingular $B$ in this event. There is nothing to prove if $cal(S) \( B \)$ is empty.
    Otherwise choose a largest overall color among its elements,
    with the color of a column meaning the color of its class in $G_B$.
    Lemma 15, applied to this color with parameter $rho = ell^(- P)$,
    gives a nonempty subset $T$ robust on its affine span and satisfying
  #[#set math.equation(numbering: n => "(6.6)")
   $ log_2 \| cal(S) \( B \) \| lt.eq log_2 C_(upright("col")) \( B \) + N ell^(- P) +
     log_2 \| T \| . $ <eq:discriminant-size-loss>]
  Put $W = "span" \( T - T \)$ and $r = dim W$. This is a rational subspace,
    since it is spanned by integer differences. Projection onto a suitable set of $r$ coordinates is injective on
    $W$, and hence on the affine span of $T$. Therefore
  #[#set math.equation(numbering: n => "(6.7)")
   $ \| T \| lt.eq 2^r . $ <eq:discriminant-cube-dimension>]
  The graph below uses admissibility to keep differences short and retains integral first coordinates for the
    determinant bound on the radical lattice. For an eigenvalue $lambda$ of $B$,
    its induced metric changes the corresponding eigenvalue $1 \/
    lambda$ of the inverse form to $lambda \/ \( 1 + lambda^2 \)$, which is bounded even when $lambda$ is small.
    Consider the rational injective graph map
  $ gamma : bb(R)^m arrow.r bb(R)^(2 m) \, wide gamma \( z \) = \( z \, B^(- 1) z \) \, $
  and the rank-$r$ lattice
  $ L = chevron.l gamma \( z \) - gamma \( t \) : z \, t in T chevron.r_(bb(Z)) quad upright("in ") gamma \( W \) . $
  Each graph difference has squared norm at most $m + 4 m lt.eq 5 N$:
    the first coordinates are differences of bits, and each inverse image has infinity norm at most one.
    The restriction of $gamma$ to the affine span of $T$ is a rational affine injection,
    and it preserves the codimensions occurring in robustness. Lemma 16 therefore applies to these graph points.
    It also applies to the original cube points. For a constant $C_0$ depending only on $P$, it gives
  #[#set math.equation(numbering: n => "(6.8)")
   $ det L lt.eq exp \( C_0 N ell \) \, wide H \( W \) lt.eq exp \( C_0 N ell \) . $ <eq:discriminant-lattice-height>]
  For all sufficiently large $N$, the second bound in Equation (6.8) is at most $exp \( N ell^2 \)$.
    Thus this adaptively chosen $W$ lies in the simultaneous scope of Corollary 19.
    Lemma 16 is deterministic for every such robust set and graph map,
    and the spectral event is a statement about all eigenvalues of $B$;
    neither requires $W$ to have been fixed in advance.
  On the whole graph $Gamma = gamma \( bb(R)^m \)$, define
  $ Q \( gamma \( x \) \, gamma \( y \) \) = x^(sans(T)) B^(- 1) y . $
  Let $s$ be the rank of its restriction to $gamma \( W \)$.
    The graph map identifies that restriction with the restriction of the bilinear form $B^(- 1)$ to $W$.
    Hence Corollary 19 gives
  #[#set math.equation(numbering: n => "(6.9)")
   $ s gt.eq r - N ell^(- P) . $ <eq:discriminant-rank>]
  The reduction of $Q$ modulo $bb(Z)$ on $L$ is the pullback of the restricted discriminant pairing on
  $ H = chevron.l macron(z) - macron(t) : z \, t in T chevron.r subset G_B . $
  Indeed, the map $L arrow.r H$ sending $gamma \( u \)$ to $u +
    B bb(Z)^m$ is surjective and respects these pairings. Pullback on the corresponding character groups is
    injective, so the two pairing images have the same order. By Lemma 24, this order is at most $N^(N J_B)$.
  Let $K = L ∩ "rad" \( Q \|_(gamma \( W \)) \)$, and let $S$ be the orthogonal complement of this radical in
    $gamma \( W \)$. The rationality assertion in Lemma 25 applies since $B^(- 1)$ is rational and the first
    coordinates of vectors in $L$ are integral. Consequently $"rank" L = r$, $"rank" K = r - s$, and $dim S = s$.
    There is also the lower bound $det K gt.eq 1$. In fact the projection to the first $m$ coordinates is
    injective on $Gamma$, and it maps $K$ to an integer lattice of the same rank.
    The squared determinant of an integer lattice is the positive integer determinant of the Gram matrix of an
    integer basis, so its determinant is at least one. Orthogonal projection contracts Euclidean volumes,
    giving the same lower bound for $det K$. This includes rank zero by convention.
  Lemma 25, followed by Equation (6.8), now gives
  #[#set math.equation(numbering: n => "(6.10)")
   $ lr(|det_(upright("orth")) \( Q \|_S \)|) gt.eq N^(- N J_B) \( det L \)^(- 2) gt.eq
     N^(- N J_B) exp \( - 2 C_0 N ell \) . $ <eq:discriminant-det-lower>]
  We compare this with the spectrum of $Q$ on $Gamma$, using the Euclidean metric induced from $bb(R)^(2 m)$.
    If $v_i$ are orthonormal eigenvectors of $B$, with nonzero eigenvalues $lambda_i$,
    then their graph vectors are orthogonal and
  $ parallel gamma \( v_i \) parallel^2 = 1 + lambda_i^(- 2) . $
  It follows that the self-adjoint operator representing $Q$ on $Gamma$ has eigenvalues
  $ mu_i = frac(lambda_i, 1 + lambda_i^2) . $
  All have absolute value at most one. Let $C_P$ be the fixed constant supplied by Proposition 21.
    Apart from $t_B lt.eq N ell^(- P)$ eigenvalues, that proposition gives $\| lambda_i \| > sqrt(N) thin
    ell^(- C_P)$. For these indices,
  $ \| mu_i \| lt.eq \| lambda_i \|^(- 1) lt.eq a_N \, wide a_N = ell^(C_P) / sqrt(N) < 1 $
  for sufficiently large $N$.
  The determinant of a compression to any $s$-dimensional subspace is bounded in absolute value by the product of
    the largest $s$ singular values of the whole operator. Indeed,
    if $w$ is the unit exterior product of an orthonormal basis of that subspace and $T_Q$ is the operator of $Q$,
    the determinant is $chevron.l w \, \( and.big^s T_Q \) w chevron.r$,
    whose absolute value is at most $parallel and.big^s T_Q parallel$. Apply this to the subspace $S$.
    Using the spectral bounds above, including the rank-zero convention, gives
  #[#set math.equation(numbering: n => "(6.11)")
   $ lr(|det_(upright("orth")) \( Q \|_S \)|) lt.eq a_N^(\( s - t_B \)_(+)) lt.eq
     a_N^(s - t_B) . $ <eq:discriminant-det-upper>]
  The last inequality is also valid for $s < t_B$, since $a_N < 1$.
    Comparing Equations (6.10) and (6.11) and taking logarithms yields
  $ \( s - t_B \) (1 / 2 log N - C_P log ell) lt.eq N J_B log N + 2 C_0 N ell . $
  The coefficient on the left is positive for large $N$. Together with Equation (6.9) and $t_B lt.eq N ell^(- P)$,
    this implies
  $ r / N lt.eq frac(J_B + 2 C_0 ell \/ log N, 1 \/ 2 - C_P log ell \/ log N) + 2 ell^(- P) = 2 J_B +
    O \( ell^(- P) \) . $
  For the last equality, use $J_B lt.eq 1 \/ 2$, the fixedness of $C_0 \, C_P \, P$,
    and $\( ell + log ell \) \/ log N = o \( ell^(- P) \)$.
  Finally combine Equations (6.6), (6.7), and (6.3). They give
  $ frac(log_2 \| cal(S) \( B \) \|, N) & lt.eq beta sum_(p \, e\
k_B \( p \, e \) = 2) nu_p + 2 J_B + O \( ell^(- P) \) + O \( N^(- 1 \/ 5) log N \)\
 & = Psi \( B \) + O \( ell^(- P) \) + O \( N^(- 1 \/ 5) log N \) . $
  The equality follows from Equations (2.4) and (6.4). Because $P > A + 2$ is fixed,
    the sum of the two error terms is at most $ell^(- A)$ for all sufficiently large $N$.
    This proves the claimed estimate on the chosen typical event and completes the proof. ◻
]

== 7 Algebra of principal-minor extensions <sec:minor-moves>

We now turn to Proposition 8, which controls the potential in expectation.
  We will grow nonsingular principal minors by one or two coordinates.
  The following deletion lemma supplies such moves in reverse order,
  with the additional condition required when two coordinates must be deleted.

#thm([Lemma 7.1.])[
  (Gated deletion).  #emph[Let $B$ be a nonsingular symmetric $r times r$ matrix with entries in ${ 0 \, 1 }$,
    where $r gt.eq 1$. Either a principal submatrix obtained by deleting one coordinate is nonsingular,
    or there are distinct coordinates $i \, j$ such that, with $I = \[ r \] \\ { i \, j }$,
$ C = B_(I \, I) quad upright("is nonsingular") \, wide v_1 = B_(I \, i) in cal(S) \( C \) \, quad v_2 =
  B_(I \, j) in cal(S) \( C \) . $

 For the empty minor we use determinant one, and $cal(S)$ contains its unique empty column.]
] <lem:gated-deletion>

#proof[
  The cofactor identity gives
  $ det B_(\[ r \] \\ { i } \, \[ r \] \\ { i }) = det B thin \( B^(- 1) \)_(i i) . $
  Thus a nonzero diagonal entry of $B^(- 1)$ gives the first alternative.
    Suppose instead that all diagonal entries of $B^(- 1)$ vanish.
    Since $B^(- 1)$ is nonsingular, it has a nonzero off-diagonal entry.
    Choose $i \, j$ to maximize the absolute value of an entry of $B^(- 1)$,
    and write $kappa = \( B^(- 1) \)_(i j) eq.not 0$. Then
  $ \( B^(- 1) \)_({ i \, j } \, { i \, j }) = mat(delim: "(", 0, kappa; kappa, 0) . $
  Jacobi’s complementary minor identity gives
  $ det C = det B thin det \( B^(- 1) \)_({ i \, j } \, { i \, j }) = - kappa^2 det B eq.not 0 . $
  Order the coordinates with $I$ first and write
  $ B = mat(delim: "(", C, V; V^(sans(T)), D) \, wide V = \( v_1 med v_2 \) \, wide T = D - V^(sans(T)) C^(- 1) V . $
  Block inversion shows that
  $ T^(- 1) = \( B^(- 1) \)_({ i \, j } \, { i \, j }) = mat(delim: "(", 0, kappa; kappa, 0) \,
    wide \( B^(- 1) \)_(I \, { i \, j }) = - C^(- 1) V T^(- 1) . $
  The diagonal of $T$ is therefore zero. Its two diagonal equations give $v_a^(sans(T)) C^(- 1) v_a =
    D_(a a) in { 0 \, 1 }$ for $a = 1 \, 2$. Moreover, the two columns of the displayed inverse block are $-
    kappa C^(- 1) v_2$ and $- kappa C^(- 1) v_1$. Every entry in that block has absolute value at most $\|
    kappa \|$, by the choice of $i \, j$. Hence $parallel C^(- 1) v_a parallel_oo lt.eq 1$ for $a = 1 \, 2$.
    These two facts are exactly the defining conditions for $v_1 \, v_2 in cal(S) \( C \)$. ◻
]

For $h in { 1 \, 2 }$, let $m \, m + h in cal(I)_N$, and let $C$ be a nonsingular binary matrix of size $m$.
  A #emph[random extension of width $h$] is

#[#set math.equation(numbering: n => "(7.1)")
 $ B = mat(delim: "(", C, V; V^(sans(T)), D) \, wide V = \( v_1 med dots.h.c med v_h \) . $ <eq:random-extension>]

The $m h$ entries of $V$ and the $h \( h + 1 \) \/ 2$ entries $D_(a b)$, $1 lt.eq a lt.eq b lt.eq h$,
  are mutually independent uniform bits; the lower triangle of $D$ is determined by symmetry.
  If $C$ is random, all these new bits are also independent of $C$.
  Thus, conditional on the entire matrix $C$, the columns $v_1 \, dots.h \,
  v_h$ are independent uniform elements of ${ 0 \, 1 }^m$, independent of all upper-triangular entries of $D$.
  Writing $Omega$ for this extension’s sample space, define the gate events by

#[#set math.equation(numbering: n => "(7.2)")
 $ cal(G)_1 = Omega \, wide cal(G)_2 = { v_1 in cal(S) \( C \) \, med v_2 in cal(S) \( C \) } . $ <eq:extension-gate>]

Conditional independence of the two columns gives

#[#set math.equation(numbering: n => "(7.3)")
 $ Pr \( cal(G)_2 divides C \) = (frac(\| cal(S) \( C \) \|, 2^m))^2 . $ <eq:gate-probability>]

This identity lets the admissible-column estimate pay for the potential bound on extensions of width two.
  Lemma 26 shows that every nonsingular matrix has a backward move whose forward extension satisfies its gate.

#thm([Proposition 7.2.])[
  (Potential step).  #emph[For every fixed $A > 0$, the following holds typically for nonsingular binary matrices
    $C$ of size $m in cal(I)_N$. For each $h in { 1 \, 2 }$ with $m + h in cal(I)_N$,
    the random extension in Equation (7.1) satisfies
#[#set math.equation(numbering: n => "(7.4)")
 $ bb(E) #h(-0.16667em)
   [upright(bold(1))_({ det B eq.not 0 }) upright(bold(1))_(cal(G)_h) thin 2^(N Psi \( B \)) thin mid(bar.v) thin
   C] lt.eq 2^(N \( Psi \( C \) + ell^(- A) \)) . $ <eq:potential-step>]

 The typical condition is imposed only on the starting matrix $C$.]
] <prop:potential-step>

Proposition 27 will be proved in Section 10. We first establish the algebraic facts that relate an extension to
  quotients of $G_C$.

=== 7.1 The common quotient and its layers <the-common-quotient-and-its-layers>

Fix a realization of Equation (7.1) for which $B$ is nonsingular. Set

#[#set math.equation(numbering: n => "(7.5)")
 $ H_0 = G_C \, wide H_j = bb(Z)^m \/ \( C bb(Z)^m + bb(Z) v_1 + dots.h.c + bb(Z) v_j \) =
   H_(j - 1) \/ chevron.l overline(v)_j chevron.r quad \( 1 lt.eq j lt.eq h \) \, $ <eq:successive-quotients>]

where $overline(v)_j$ is the image of $v_j$ in $H_(j - 1)$.
  These finite groups depend only on $C$ and the indicated columns.
  They are defined whenever $C$ is nonsingular, even if the destination matrix $B$ is singular.
  Nonsingularity of $B$ is needed only when we refer to its discriminant group.
  The last one is also a quotient of $G_B$:

#[#set math.equation(numbering: n => "(7.6)")
 $ H_h tilde.equiv G_B \/ chevron.l overline(e)_(m + 1) \, dots.h \, overline(e)_(m + h) chevron.r \,
   $ <eq:common-quotient>]

where the bars on the right denote classes of standard basis vectors in $G_B$. Indeed, the right side is

$ bb(Z)^(m + h) \/ #scale(x: 120%, y: 120%)[\(] B bb(Z)^(m + h) + \( 0 xor bb(Z)^h \) #scale(x: 120%, y: 120%)[\)] . $

Projection onto the first $m$ coordinates maps its relations to $C bb(Z)^m + V bb(Z)^h$.
  Conversely, if a vector in $bb(Z)^(m + h)$ projects into $C bb(Z)^m + V bb(Z)^h$,
  subtracting a suitable vector of $B bb(Z)^(m + h)$ leaves a vector in $0 xor bb(Z)^h$.
  Projection therefore induces exactly the isomorphism in Equation (7.6).

For a finite abelian group $G$, a prime $p$, and an integer $t gt.eq 0$, define

#[#set math.equation(numbering: n => "(7.7)")
 $ F_G \( p \, t \) = sum_(e = 1)^t k_G \( p \, e \) = sum_i min { b_(p \, i) \, t } =
   log_p \| G \/ p^t G \| . $ <eq:layer-prefix>]

The empty sum is zero. The two equalities follow directly from the cyclic decomposition of the $p$-primary part;
  multiplication by $p^t$ is an automorphism on every other primary part.
  For a nonsingular binary matrix $M$, write $F_M \( p \, t \) = F_(G_M) \( p \, t \)$.

#thm([Lemma 7.3.])[
  (Layers under a one-element quotient).  #emph[Let $G$ be a finite abelian group, let $v in G$, and put $H =
    G \/ chevron.l v chevron.r$. Fix a prime $p$, and define $u_t$ by
$ p^(u_t) = \| chevron.l v + p^t G chevron.r \| quad upright("in ") G \/ p^t G wide \( t gt.eq 0 \) . $

 Then $u_0 = 0$, $u_t - u_(t - 1) in { 0 \, 1 }$ for $t gt.eq 1$, and
#[#set math.equation(numbering: n => "(7.8)")
 $ F_H \( p \, t \) & = F_G \( p \, t \) - u_t \,\
k_H \( p \, e \) & = k_G \( p \, e \) - \( u_e - u_(e - 1) \) in { k_G \( p \, e \) \, k_G \( p \, e \) -
  1 } . $ <eq:quotient-prefix>]

 Call a positive layer $\( p \, e \)$ of $G$ #emph[retained] if $k_H \( p \, e \) = k_G \( p \, e \)$.
   On every maximal interval of consecutive layers where $k_G \( p \, e \)$ has a fixed positive value,
   the retained layers form an initial interval, possibly empty.
   We call such an interval of constant height a #emph[plateau].]
] <lem:layer-quotient>

#proof[
  Quotienting by $p^t$ and by $v$ commutes:
  $ H \/ p^t H tilde.equiv \( G \/ p^t G \) \/ chevron.l v + p^t G chevron.r . $
  Taking orders proves Equation (7.8).
  Write $G_p = xor.big_i bb(Z) \/ p^(b_i) bb(Z)$. For the $i$-th coordinate of the $p$-primary component of $v$,
    let $r_i$ be its $p$-adic valuation capped at $b_i$; in particular $r_i = b_i$ for a zero coordinate.
    The order of that coordinate in $G_p \/ p^t G_p$ is $p^(\( min { b_i \, t } - r_i \)_(+))$, where $x_(+) =
    max { x \, 0 }$. The order of an element in a direct sum of $p$-groups is the largest of its coordinate orders, so
  #[#set math.equation(numbering: n => "(7.9)")
   $ u_t = max_i \( min { b_i \, t } - r_i \)_(+) \, $ <eq:quotient-order-exponent>]
  with maximum zero when $G_p$ is trivial. Each function under this maximum is nondecreasing in $t$ and increases
    by at most one at a step. The same is therefore true of $u_t$; since it is integer valued,
    its increments belong to ${ 0 \, 1 }$. Subtracting Equation (7.8) at $t = e - 1$ from the equation at $t =
    e$ proves Equation (7.8).
  On a plateau of height $k$, the heights in $H$ are either $k$ or $k - 1$.
    They are nonincreasing as $e$ increases, by their definition from invariant factors.
    Thus a height $k - 1$ cannot be followed on the plateau by height $k$.
    The retained layers are exactly those of height $k$, proving the prefix assertion. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0.93, 0.403), [#text(size: 9pt)[$G_p$]])
  content((-0.155, 0.403), [#text(size: 9pt)[$e$]], anchor: "east", padding: 0.1176cm)
  content((-0.155, -0.31), [#text(size: 9pt)[$1$]], anchor: "east", padding: 0.1176cm)
  rect((0, 0), (0.62, -0.62), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((0.62, 0), (1.24, -0.62), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((1.24, 0), (1.86, -0.62), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.155, -0.93), [#text(size: 9pt)[$2$]], anchor: "east", padding: 0.1176cm)
  rect((0, -0.62), (0.62, -1.24), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((0.62, -0.62), (1.24, -1.24), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.155, -1.55), [#text(size: 9pt)[$3$]], anchor: "east", padding: 0.1176cm)
  rect((0, -1.24), (0.62, -1.86), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((0.62, -1.24), (1.24, -1.86), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.155, -2.17), [#text(size: 9pt)[$4$]], anchor: "east", padding: 0.1176cm)
  rect((0, -1.86), (0.62, -2.48), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((-0.155, -2.79), [#text(size: 9pt)[$5$]], anchor: "east", padding: 0.1176cm)
  rect((0, -2.48), (0.62, -3.1), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((1.24, 0), (1.86, -0.62), fill: rgb("#e0e0e0"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.55, -0.31), [#text(size: 9pt)[$times$]])
  rect((0.62, -1.24), (1.24, -1.86), fill: rgb("#e0e0e0"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.93, -1.55), [#text(size: 9pt)[$times$]])
  rect((0, -2.48), (0.62, -3.1), fill: rgb("#e0e0e0"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0.31, -2.79), [#text(size: 9pt)[$times$]])
  content((2.015, -0.93), [#text(size: 9pt)[retained]], anchor: "west", padding: 0.1176cm)
  content((2.015, -2.17), [#text(size: 9pt)[retained]], anchor: "west", padding: 0.1176cm)
  line((4.03, -1.55), (5.394, -1.55), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((4.712, -1.147), [#text(size: 9pt)[quotient by $v$]])
  content((7.13, 0.403), [#text(size: 9pt)[$G_p"/"chevron.l v chevron.r$]])
  content((6.355, -0.31), [#text(size: 9pt)[$1$]], anchor: "east", padding: 0.1176cm)
  rect((6.51, 0), (7.13, -0.62), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((7.13, 0), (7.75, -0.62), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6.355, -0.93), [#text(size: 9pt)[$2$]], anchor: "east", padding: 0.1176cm)
  rect((6.51, -0.62), (7.13, -1.24), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((7.13, -0.62), (7.75, -1.24), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6.355, -1.55), [#text(size: 9pt)[$3$]], anchor: "east", padding: 0.1176cm)
  rect((6.51, -1.24), (7.13, -1.86), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6.355, -2.17), [#text(size: 9pt)[$4$]], anchor: "east", padding: 0.1176cm)
  rect((6.51, -1.86), (7.13, -2.48), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((6.355, -2.79), [#text(size: 9pt)[$5$]], anchor: "east", padding: 0.1176cm)
  content((6.51, -2.79), [#text(size: 9pt)[height $0$]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: Layers for $G_p = bb(Z) \/ p^5 bb(Z) xor bb(Z) \/ p^3 bb(Z) xor bb(Z) \/ p bb(Z)$ and its quotient by $v = \( p^2 \, p \, 1 \)$. The crossed boxes are the layer drops. Here $\( u_1 \, dots.h \, u_5 \) = \( 1 \, 1 \, 2 \, 2 \, 3 \)$, so the retained layers are $e = 2 \, 4$. On each plateau $e = 2 \, 3$ and $e = 4 \, 5$, retention is a prefix. The row lengths on the right are the heights of the quotient. ],
) <fig:layers>

Applied successively to Equation (7.5), this lemma gives a drop of zero or one at each layer in each quotient.
  The same statement applies to the $h$ successive quotients of $G_B$ by the standard basis classes in
  Equation (7.6). Consequently, for every $\( p \, e \)$,

#[#set math.equation(numbering: n => "(7.10)")
 $ k_C \( p \, e \) - h lt.eq k_(H_h) \( p \, e \) lt.eq k_C \( p \, e \) \, wide k_B \( p \, e \) - h lt.eq
   k_(H_h) \( p \, e \) lt.eq k_B \( p \, e \) . $ <eq:common-layer-interlacing>]

In particular, for $h = 1$ the common height is either $k_C \( p \, e \)$ or $k_C \( p \, e \) - 1$,
  while $k_B \( p \, e \)$ is either the common height or one more.
  This also shows that a layer absent from $G_C$ has height at most $h$ in $G_B$.

=== 7.2 The lattice forced by retention <the-lattice-forced-by-retention>

The next lemma extracts from a set of retained layers a necessary divisibility condition on the column,
  with an exact formula for its index. The condition lies in an intermediate lattice between $C
  bb(Z)^m$ and $bb(Z)^m$, including when one preceding column has already been quotiented out.

#thm([Lemma 7.4.])[
  (Retention lattice).  #emph[Let $C$ be a nonsingular binary matrix of size $m$, and let $pi :
    bb(Z)^m arrow.r.twohead H$ be a quotient map to a finite abelian group such that $C bb(Z)^m subset.eq ker pi$.
    Let $E$ be any set of positive layers of $H$. There is a lattice $K_E$, depending only on $pi \, H \, E$, with
#[#set math.equation(numbering: n => "(7.11)")
 $ C bb(Z)^m subset.eq K_E subset.eq bb(Z)^m \, wide \[ bb(Z)^m : K_E \] = N^(N q \( E \)) \, wide q \( E \) =
   sum_(\( p \, e \) in E) k_H \( p \, e \) nu_p \, $ <eq:retention-lattice>]

 such that the following implication holds for every $v in bb(Z)^m$:
   if every layer in $E$ is retained in $H arrow.r H \/ chevron.l pi \( v \) chevron.r$, then $v in K_E$.]
] <lem:retention-lattice>

#proof[
  For each prime choose, once for the given group $H$, cyclic coordinates
  $ H_p = xor.big_i bb(Z) \/ p^(b_i) bb(Z) . $
  Put
  $ a_(p \, i) = \# { e : \( p \, e \) in E \, med e lt.eq b_i } \, wide T_E =
    xor.big_(p \, i) p^(a_(p \, i)) \( bb(Z) \/ p^(b_i) bb(Z) \) subset.eq H \, wide K_E = pi^(- 1) \( T_E \) . $
  Here $0 lt.eq a_(p \, i) lt.eq b_i$, and the subgroup in the $\( p \, i \)$ coordinate consists of the classes
    divisible by $p^(a_(p \, i))$. The lattice $K_E$ contains $C bb(Z)^m$. Its index is
  $ \[ bb(Z)^m : K_E \] = \[ H : T_E \] = product_(p \, i) p^(a_(p \, i)) =
    product_(\( p \, e \) in E) p^(k_H \( p \, e \)) = N^(N q \( E \)) \, $
  where the penultimate equality counts a selected layer once for each cyclic factor reaching it.
    This proves all assertions about the lattice and its index.
  It remains to prove the implication. Fix $p \, i$, and let $r_i$ be the capped valuation of the $i$-th
    coordinate of $pi \( v \)$, as in the proof of Lemma 28. Equation (7.9) at $t = b_i$ gives $u_(b_i) gt.eq
    b_i - r_i$. All the first $b_i$ layers are positive, and Equation (7.8) shows that the number among them that
    are retained is
  $ sum_(e = 1)^(b_i) #scale(x: 120%, y: 120%)[\(] 1 - \( u_e - u_(e - 1) \) #scale(x: 120%, y: 120%)[\)] = b_i -
    u_(b_i) . $
  If every layer in $E$ is retained, then
  $ a_(p \, i) lt.eq b_i - u_(b_i) lt.eq r_i . $
  Thus the coordinate of $pi \( v \)$ is divisible by $p^(a_(p \, i))$.
    This holds in every primary coordinate, so $pi \( v \) in T_E$ and $v in K_E$, as required. ◻
]

For the group in Figure 1, choosing $E = { \( p \, 2 \) \, \( p \, 4 \) }$ gives divisibility exponents
  $\( a_(p \, 1) \, a_(p \, 2) \, a_(p \, 3) \) = \( 2 \, 1 \, 0 \)$.
  The two selected layers have total weight $2 nu_p$, while $q \( E \) = 3 nu_p$ and $\[ bb(Z)^m : K_E \] = p^3$.

For a quotient in Equation (7.5), the map $pi$ is the natural map from $bb(Z)^m$ onto $H_(j - 1)$.
  Conditional on $C$ and the preceding columns $v_1 \, dots.h \, v_(j - 1)$,
  the next column remains uniform on the cube.

=== 7.3 A symmetric kernel inequality <a-symmetric-kernel-inequality>

The common quotient also controls the destination layers more strongly than interlacing alone.
  At a fixed prime $p$, let $u_(j \, t)$ denote the exponent from Lemma 28 for $H_(j - 1) arrow.r H_j$, and set

#[#set math.equation(numbering: n => "(7.12)")
 $ U_t = sum_(j = 1)^h u_(j \, t) = F_C \( p \, t \) - F_(H_h) \( p \, t \) . $ <eq:total-quotient-loss>]

The equality follows by summing Equation (7.8).

#thm([Lemma 7.5.])[
  (Symmetric kernel inequality).  #emph[For a nonsingular extension $B$ of a nonsingular $C$ of width $h in { 1 \,
    2 }$, at every prime $p$ and every integer $t gt.eq 0$,
#[#set math.equation(numbering: n => "(7.13)")
 $ F_B \( p \, t \) lt.eq F_C \( p \, t \) + h t - 2 U_t . $ <eq:layer-inequality>]

]
] <lem:layer-inequality>

#proof[
  The assertion is immediate for $t = 0$. Fix $t gt.eq 1$, put $R_t = bb(Z) \/ p^t bb(Z)$,
    and reduce the blocks of $B$ modulo $p^t$, writing them as $C_t \, V_t \, D_t$. Let
  $ X = R_t^m \, wide Y = R_t^h \, wide L = ker \( C_t : X arrow.r X \) \, wide J = "im" \( C_t : X arrow.r X \) . $
  The presentation of the cokernel gives
  $ X \/ J tilde.equiv bb(Z)^m \/ \( C bb(Z)^m + p^t bb(Z)^m \) tilde.equiv G_C \/ p^t G_C . $
  Since $C_t$ is an endomorphism of the finite group $X$, its kernel and cokernel have the same order. Hence
  #[#set math.equation(numbering: n => "(7.14)")
   $ \| L \| = \| X \/ J \| = p^(F_C \( p \, t \)) . $ <eq:kernel-prefix-order>]
  Define
  $ alpha : Y arrow.r X \/ J \, wide alpha \( y \) = V_t y + J . $
  The image is the subgroup generated by the column classes in $G_C \/ p^t G_C$.
    Quotienting by that subgroup gives $H_h \/ p^t H_h$, so Equation (7.12) gives
  $ \| "im" alpha \| = p^(U_t) \, wide \| ker alpha \| = p^(h t - U_t) . $
  For a kernel vector $\( x \, y \) in X xor Y$ of $B$ modulo $p^t$, the first block equation is
  #[#set math.equation(numbering: n => "(7.15)")
   $ C_t x + V_t y = 0 . $ <eq:first-block-kernel>]
  It requires $y in ker alpha$. For each such $y$, its solutions in $x$ form a coset $x_0 + L$.
  Consider the map
  $ gamma : L arrow.r Y \, wide gamma \( z \) = V_t^(sans(T)) z . $
  We claim that $\| "im" gamma \| = p^(U_t)$. Equip $X$ and $Y$ with their standard character pairings, for example
  $ chevron.l x \, z chevron.r_X = exp #h(-0.16667em) (frac(2 pi i, p^t) x^(sans(T)) z) . $
  These pairings are perfect: a nonzero coordinate is detected by pairing with its standard basis vector.
    For a subgroup $M$ of either module $A$, write $M^perp$ for its annihilator. Character orthogonality gives
  #[#set math.equation(numbering: n => "(7.16)")
   $ \| M \| thin \| M^perp \| = sum_(a in A) sum_(z in M) chevron.l a \,
     z chevron.r_A = \| A \| . $ <eq:annihilator-order>]
  For the first equality, the sum over $M$ is $\| M \|$ on its annihilator and zero elsewhere.
    For the second, reverse the sums: by perfectness the sum over $A$ vanishes for every $z eq.not 0$,
    and the term $z = 0$ equals $\| A \|$.
  Symmetry of $C_t$ gives $J subset.eq L^perp$, since $chevron.l C_t x \, z chevron.r_X = chevron.l x \,
    C_t z chevron.r_X = 1$ for $z in L$. Both groups have order $\| X \| \/ \| L \|$,
    the former by the kernel-image formula and the latter by Equation (7.16). Therefore $L^perp = J$. It follows that
  $ \( "im" gamma \)^perp & = { y in Y : chevron.l y \, V_t^(sans(T)) z chevron.r_Y = 1 upright(" for every ") z in L }\
 & = { y in Y : chevron.l V_t y \, z chevron.r_X = 1 upright(" for every ") z in L }\
 & = { y in Y : V_t y in J } = ker alpha . $
  Equation (7.16) in $Y$ now gives
  $ \| "im" gamma \| = frac(\| Y \|, \| ker alpha \|) = p^(U_t) \, wide \| ker gamma \| =
    frac(\| L \|, \| "im" gamma \|) = p^(F_C \( p \, t \) - U_t) . $
  For a fixed $y in ker alpha$ and $x = x_0 + z$ from Equation (7.15), the second block equation is
  $ gamma \( z \) = - V_t^(sans(T)) x_0 - D_t y . $
  It has either no solutions or one coset of $ker gamma$. There are at most $p^(h t - U_t)$ choices for $y$,
    and for each at most $p^(F_C \( p \, t \) - U_t)$ choices for $z$. Consequently
  $ \| ker \( B med mod med p^t \) \| lt.eq p^(F_C \( p \, t \) + h t - 2 U_t) . $
  As for $C_t$, the kernel of the square endomorphism $B med mod med p^t$ has the same order as its cokernel.
    That cokernel is $G_B \/ p^t G_B$, of order $p^(F_B \( p \, t \))$. Taking logarithms proves Equation (7.13). ◻
]

Lemma 29 identifies the intermediate lattices that arise from retaining layers,
  while Lemma 30 uses symmetry to relate those retentions to the destination group.
  Section 8 supplies a uniform bound on cube intersections with every lattice of the form in Equation (7.11).

== 8 Simultaneous concentration in lattice quotients <sec:cube>

Retaining prescribed layers forces a new bit column into an intermediate lattice.
  We now bound the number of bit columns in every coset of every such lattice,
  on one typical event for the starting matrix.

Let $B$ be a nonsingular binary matrix of size $m in cal(I)_N$, and let

$ B bb(Z)^m subset.eq K subset.eq bb(Z)^m . $

For $D subset \[ m \]$, put

$ Q_D = { z in { 0 \, 1 }^m : z_j = 0 upright(" for ") j in.not D } \, wide M_K \( D \) =
  max_(a in bb(Z)^m) \| Q_D ∩ \( a + K \) \| \, wide M_K = M_K \( \[ m \] \) . $

In particular, $M_K \( D' \) lt.eq M_K \( D \)$ whenever $D' subset D$.
  The lattice $K$ has full rank, so $det K = \[ bb(Z)^m : K \]$. Define

$ q = q_K = frac(log \[ bb(Z)^m : K \], N log N) \, wide upright("so that") wide \[ bb(Z)^m : K \] = N^(q N) . $

The quotient $bb(Z)^m \/ K$ is a quotient of $G_B$, so Equation (2.3) gives $0 lt.eq q lt.eq 1 \/ 2$.

For $0 lt.eq d lt.eq 1$, write $f = 1 - d$ and define

#[#set math.equation(numbering: n => "(8.1)")
 $ c \( d \/ 2 \) & = 1 - f z \( d \/ f \) \,\
z \( u \) & =
  cases(delim: "{", \( 1 + sqrt(2 u - u^2) \)^(- 1) \, & 0 lt.eq u lt.eq 1 \,, 1 \/ 2 \, & u gt.eq 1 .)
  $ <eq:cube-profile>]

At $f = 0$, the product $f z \( d \/ f \)$ is defined to be zero.
  Thus $c : \[ 0 \, 1 \/ 2 \] arrow.r \[ 0 \, 1 \]$, with $c \( 0 \) = 0$ and $c \( 1 \/ 2 \) = 1$.

#thm([Proposition 8.1.])[
  (Cube concentration).  #emph[For every fixed $A > 0$, typically for nonsingular binary matrices $B$ of size $m
    in cal(I)_N$, one has simultaneously for every lattice $B bb(Z)^m subset.eq K subset.eq bb(Z)^m$
#[#set math.equation(numbering: n => "(8.2)")
 $ M_K lt.eq 2^(N \( 1 - c \( q_K \) + ell^(- A) \)) . $ <eq:cube-concentration>]

 The typical event may depend on $A$, but it does not depend on $K$.
   Thus the choice of $K$ may depend arbitrarily on $B$ and on any other data.]
] <prop:cube-concentration>

The function $c$ is nondecreasing and concave. To see this, put $r \( u \) = sqrt(2 u - u^2)$ for $0 < u < 1$. Then

$ r' \( u \) = frac(1 - u, r \( u \)) \, wide r'' \( u \) = - frac(1, r \( u \)^3) . $

Consequently $z = \( 1 + r \)^(- 1)$ is nonincreasing and convex on $\[ 0 \, 1 \]$; more explicitly,

$ z'' \( u \) = frac(1, r \( u \)^3 \( 1 + r \( u \) \)^2) +
  frac(2 \( 1 - u \)^2, r \( u \)^2 \( 1 + r \( u \) \)^3) > 0 . $

Its left derivative at $1$ is zero, so its constant extension remains convex and nonincreasing.
  The perspective $f z \( d \/ f \)$ is convex for $f > 0$:
  this follows by applying convexity of $z$ with weights proportional to the two values of $f$.
  Its continuous extension to the endpoint $f = 0$ is also convex.
  Restriction to $f = 1 - d$ proves concavity of $c$. As $d$ increases,
  both $f$ and $z \( d \/ f \)$ are nonnegative and nonincreasing, which proves monotonicity.

We will use the uniform bound

#[#set math.equation(numbering: n => "(8.3)")
 $ \| c \( q \) - c \( q' \) \| lt.eq C_(upright("pr")) \| q -
   q' \|^(1 \/ 2) wide \( 0 lt.eq q \, q' lt.eq 1 \/ 2 \) $ <eq:cube-holder>]

for an absolute constant $C_(upright("pr"))$. Indeed, for $u \, v in \[ 0 \, 1 \]$,

$ \| z \( u \) - z \( v \) \| lt.eq \| r \( u \) - r \( v \) \| lt.eq sqrt(2 \| u - v \|) . $

On $0 lt.eq d lt.eq 1 \/ 2$, the map $d mapsto d \/ \( 1 - d \)$ is $4$-Lipschitz,
  so the product in Equation (8.1) is Hölder of exponent $1 \/ 2$ there.
  On $1 \/ 2 lt.eq d lt.eq 1$ it is $\( 1 - d \) \/ 2$. Combining the two bounds at $d = 1 \/ 2$,
  and then using $d = 2 q$, gives Equation (8.3).

We first count bases of low-height subspaces, and then use that count to price the witnesses that will arise from
  a large cube intersection.

=== 8.1 Low-height bases and witness pricing <low-height-bases-and-witness-pricing>

#thm([Lemma 8.2.])[
  (Exact-basis count).  #emph[Fix $C \, C' > 0$. Uniformly for $m in cal(I)_N$ and $0 lt.eq j lt.eq m$,
    the number of ordered tuples
$ \( y \, y_1 \, dots.h \, y_j \) in \( { 0 \, 1 }^m \)^(j + 1) $

 for which $y_1 - y \, dots.h \, y_j - y$ are independent and their span $W$ satisfies $H \( W \) lt.eq
   exp \( N ell^C \)$ is at most
$ 2^(j^2 + o \( N^2 ell^(- C') \)) . $

]
] <lem:exact-basis-count>

#proof[
  The case $j = 0$ is immediate. For $j gt.eq 1$, encode the center $y$ and a choice of $j$ pivot coordinates on
    which the differences remain independent. These choices cost $O \( N log N \)$ bits.
    At the pivots, each difference entry has two possible values once $y$ is known,
    so all pivot entries cost $j^2$ bits.
  Add the other coordinates in a fixed order. Suppose the current projected span is $V subset bb(R)^h$,
    and put $L_V = V ∩ bb(Z)^h$. The next projected span is the graph of a rational functional $x mapsto chevron.l
    v \, x chevron.r$ on $V$, represented by $v in V$. Put
  $ a = min { b in bb(Z)_(> 0) : b v in L_V^(*) } . $
  The image of $L_V$ under this functional modulo $bb(Z)$ has order $a$.
    Hence the projection of the integer lattice in the graph has index $a$ in $L_V$.
    The volume factor of the graph map on $V$ is $sqrt(1 + parallel v parallel^2)$, and therefore
  #[#set math.equation(numbering: n => "(8.4)")
   $ frac(H \( "graph" \( v \) \), H \( V \)) = a sqrt(1 + parallel v parallel^2) . $ <eq:cube-height-ratio>]
  All these ratios are at least one. The initial projected space is $bb(R)^j$, of height one,
    and the final one is $W$. Thus every intermediate height is at most $exp \( N ell^C \)$,
    and a ratio exceeding $N^(1 \/ 10)$ occurs at most $O \( N ell^C \/ log N \)$ times.
    Mark those coordinates and encode their $j$ difference entries directly.
    Their total cost is $O \( N^2 ell^C \/ log N \)$ bits.
  At any other coordinate,
  $ a lt.eq N^(1 \/ 10) \, wide parallel a v parallel lt.eq N^(1 \/ 10) . $
  We count possible $a v$ in $Lambda = L_V^(*)$. Lemma 11, applied to $V subset bb(R)^h$, gives $det M gt.eq
    H \( V \)^(- 1)$ for every sublattice $M subset Lambda$.
  Apply Lemma 14 to $Lambda$ with $T = N^(- 1 \/ 10)$, choosing a minimizing sublattice as a function of the known
    $V$. If its rank is $r_0$, comparison with the zero lattice and the preceding determinant bound give
  $ H \( V \)^(- 1) lt.eq T^(r_0) \, wide r_0 lt.eq frac(10 N ell^C, log N) . $
  Every sublattice of the quotient has determinant at least $T$ to its rank.
    By Lemma 13, the number of quotient images of vectors of norm at most $N^(1 \/ 10)$ is
  $ 2^(O \( N^(2 \/ 5) log^2 N \)) . $
  Here the quotient has rank at most $N$, and the bound also covers rank zero.
  Encode $a$, costing $O \( log N \)$ bits, and the quotient image of $a v$.
    In a fixed fiber, $v$ varies in an affine space of dimension at most $r_0$.
    Evaluation on the already known $j$ independent projected differences is injective on $V$,
    and the evaluations are the $j$ entries of the new difference column.
    Each entry has two possible values, determined by the corresponding coordinate of $y$.
    An affine space of dimension $r_0$ meets such a cube in at most $2^(r_0)$ points,
    by projection onto $r_0$ suitable coordinates. This bounds the fiber cost by $r_0$ bits.
  Summing over at most $N$ coordinates, including the pivot, center, and marking costs,
    bounds the logarithm of the number of tuples by
  $ j^2 + O #h(-0.16667em) (frac(N^2 ell^C, log N) + N^(7 \/ 5) log^2 N + N log N) . $
  For fixed $C \, C'$, the error is $o \( N^2 ell^(- C') \)$, uniformly in $j$ and $m$, as required. ◻
]

#thm([Proposition 8.3.])[
  (Witness pricing).  #emph[Fix $D_0 > 0$, and put $eta = ell^(- D_0)$ and $rho = eta^3$.
    Typically for nonsingular binary matrices $B$ of size $m in cal(I)_N$,
    the following assertion holds simultaneously for every $B bb(Z)^m subset.eq K subset.eq bb(Z)^m$.]
  #emph[Let $S_1 \, dots.h \, S_h subset { 0 \, 1 }^m$ be nonempty subsets, each $rho$-robust on its affine span,
    where $h lt.eq 3 \/ eta$. Suppose $S_i - S_i subset K$, and put $W_i = "span" \( S_i - S_i \)$.
    Suppose also that $W = sum_i W_i$ is a direct sum. Write
$ dim W_i = t_i N \, wide t = sum_i t_i \, wide \| S_i \| = 2^(alpha_i N) . $

 If $D subset \[ m \]$ has $\| D \| = x N$, $x lt.eq t$, and $M_K \( D \) lt.eq 2^(eta N)$, then
#[#set math.equation(numbering: n => "(8.5)")
 $ x t - x^2 / 2 lt.eq sum_i t_i \( t_i - alpha_i \) + eta t + eta^3 . $ <eq:witness-pricing>]

]
] <prop:witness-pricing>

For a fixed nonsingular matrix $B$, a #emph[witness] consists of data $K \, \( S_i \)_(i = 1)^h \,
  D$ satisfying the stated assumptions on the lattice, sets, their difference spans, and $D$.
  It is #emph[violating] if Equation (8.5) fails. The two sides of that equation have a counting interpretation.
  In a symmetric block on $t N$ coordinates, the number of independent entries with at least one endpoint in a
  specified set of $x N$ coordinates is $\( x t - x^2 \/ 2 \) N^2 + O \( N \)$.
  Restricting each row on those coordinates to at most $2^(eta N)$ choices saves this many bits, less $eta t N^2$.
  For the $i$-th set $S_i$, describing an ordered basis costs $t_i^2 N^2$ bits to leading order,
  while robustness supplies $alpha_i t_i N^2$ bits of basis multiplicity.
  The term $t_i \( t_i - alpha_i \)$ is the remaining cost.
  A violation would make the row saving exceed the total witness cost by $eta^3 N^2$.

#proof[
  The robust-height bound in Lemma 16, with the fixed parameter $rho = ell^(- 3 D_0)$, gives
  $ H \( W_i \) lt.eq exp \( O \( N ell \) \) . $
  The integer lattice sum of $W_i ∩ bb(Z)^m$ is contained in $W ∩ bb(Z)^m$.
    The volume inequality for this sum and saturation give
  $ H \( W \) lt.eq product_i H \( W_i \) lt.eq exp \( O \( N ell \/ eta \) \) . $
  Choose a fixed $D_1 > D_0 + 1$. For sufficiently large $N$, this is at most $exp \( N ell^(D_1) \)$.
    We impose Proposition 18 at this height and at a fixed precision strong enough that its rank error is at most
    $eta^5 N$. We also impose Proposition 20. Their intersection is typical.
    All counting below takes place within this intersection.
  For a fixed list of dimensions, Lemma 32 counts centers and ordered bases of differences for the pieces with
    total logarithmic cost
  #[#set math.equation(numbering: n => "(8.6)")
   $ N^2 sum_i t_i^2 + o \( N^2 eta^4 \) . $ <eq:witness-basis-upper>]
  Indeed, use that Lemma with a fixed $C'$ larger than $5 D_0$ and sum its errors over at most $3 \/ eta$ pieces.
    The height exponent there can be chosen fixed and large enough for all the $W_i$.
  For each individual witness, fix a center in each $S_i$. At every stage of choosing an ordered basis of
    differences, the affine span of the center and the points already chosen is a proper affine subspace of $"aff"
    S_i$. Robustness bounds the fraction of $S_i$ in that subspace by $2^(- rho)$.
    Consequently the number of choices of an ordered basis for this piece is at least
  $ #scale(x: 120%, y: 120%)[\(] \( 1 - 2^(- rho) \) thin 2^(alpha_i N) #scale(x: 120%, y: 120%)[\)]^(t_i N) . $
  The choices for different pieces form distinct basis lists.
    As $t lt.eq m \/ N lt.eq 1$, their total logarithm is at least
  #[#set math.equation(numbering: n => "(8.7)")
   $ N^2 sum_i t_i alpha_i - O #scale(x: 120%, y: 120%)[\(] N log \( 1 \/ rho \) #scale(x: 120%, y: 120%)[\)] =
     N^2 sum_i t_i alpha_i - o \( N^2 eta^4 \) . $ <eq:witness-basis-lower>]
  Fix basis-list data, so in particular $W$ is known. For a witnessed matrix choose a coordinate set $Y_0$ of size
    $t N$ containing $D$. The second rank assertion of Proposition 18 shows that the columns on $\[ m \] \\ Y_0$,
    projected off $W$, have rank at least $m - t N - eta^5 N$.
    Choose an independent collection there, and use nonsingularity of $B$ to complete it to a basis of the
    quotient $bb(R)^m \/ W$ using columns of $B$. Let $P$ be the resulting set of $m -
    t N$ indices and $Y = \[ m \] \\ P$. Then
  $ \| D ∩ P \| lt.eq eta^5 N . $
  Encode $D$ and $P$, at cost $O \( N \)$ bits, and reveal the columns on $P$.
    If $T_m = m \( m + 1 \) \/ 2$ is the total number of independent bits of $B$, these columns cost
  $ T_m - binom(t N + 1, 2) $
  bits, using symmetry.
  The revealed columns and the basis differences are $m$ independent integer vectors:
    the differences form a basis of $W$, and the revealed columns project to a basis off $W$.
    Let $L$ be their integer span. It is known from the encoded data, satisfies $L subset K$, and has full rank.
    Each generating vector has norm at most $sqrt(N)$, so Hadamard’s inequality gives
  $ \| bb(Z)^m \/ L \| lt.eq N^(m \/ 2) lt.eq N^(N \/ 2) . $
  We next enumerate the possible $K$ containing this known $L$. Let $r_N = ceil.l N^(3 \/ 5) ceil.r$.
    For every prime $p$,
  $ dim_(bb(F)_p) #scale(x: 120%, y: 120%)[\(] \( bb(Z)^m \/ K \) \/ p \( bb(Z)^m \/ K \)
    #scale(x: 120%, y: 120%)[\)] lt.eq dim_(bb(F)_p) \( G_B \/ p G_B \) = "corank"_(bb(F)_p) B lt.eq r_N $
  by Proposition 20. The minimum number of generators of a finite abelian group is the maximum of these dimensions
    over its primes, as follows from its invariant factors. Thus $bb(Z)^m \/ K$, and also its character dual,
    can be generated by at most $r_N$ elements.
  Put $H = bb(Z)^m \/ L$. The annihilator of $K \/ L$ identifies $\( bb(Z)^m \/ K \)^or$ with a subgroup of
    $H^or = "Hom" \( H \, bb(Q) \/ bb(Z) \)$; by finite duality this subgroup determines $K$.
    Every subgroup with at most $r_N$ generators is generated by some ordered $r_N$-tuple in $H^or$,
    padding with zero elements if necessary. The number of possible $K$ is therefore at most $\| H \|^(r_N)$.
    Its logarithm is
  #[#set math.equation(numbering: n => "(8.8)")
   $ O \( N^(8 \/ 5) log N \) = o \( N^2 eta^4 \) . $ <eq:witness-lattice-cost>]
  This candidate list is formed after the basis lists and revealed columns fix $L$,
    before the remaining matrix block is encoded. It may include lattices incompatible with every completion.
    The prime-corank condition is used only to ensure that each actual witnessed $K$ appears in the list.
  Write $D' = D ∩ Y$, $y = \| Y \| = t N$, and $d' = \| D' \|$.
    We have $d' gt.eq \( x - eta^5 \) N$ and $M_K \( D' \) lt.eq M_K \( D \) lt.eq 2^(eta N)$.
    In the remaining $Y$-block, first encode the symmetric bits on $Y \\ D'$, at cost $binom(y - d' + 1, 2)$.
    For a row indexed by $Y \\ D'$, all entries outside $D'$ are now known.
    The full row belongs to $K$, since $B$ is symmetric and each column belongs to $B bb(Z)^m$.
    Its entries on $D'$ therefore lie in a fixed coset of $K$ and have at most $M_K \( D' \)$ possibilities.
    This encodes the cross block at cost at most $eta N \( y - d' \)$.
    For the final $D'$-block, the same bound applies to each of its $d'$ rows.
    Ignoring symmetry within that block only enlarges the count, so its cost is at most $eta N d'$.
    Relative to an unrestricted symmetric $Y$-block the saving is at least
  $ binom(y + 1, 2) - binom(y - d' + 1, 2) - eta N y & = y d' - frac(\( d' \)^2, 2) + d' / 2 - eta N y\
 & gt.eq N^2 (x t - x^2 / 2 - eta t - O \( eta^5 + 1 \/ N \)) . $
  It remains to compare the upper count with the multiplicity of witnesses.
    Group violating witnesses by $h$, the integers $t_i N$ and $x N$, and the integers
  $ a_i = floor.l log_2 \| S_i \| floor.r \, wide macron(alpha)_i = a_i \/ N . $
  There are at most $2^(O \( eta^(- 1) log N \))$ groups. Fix one group,
    and let $cal(E)$ be the set of matrices in the imposed typical intersection that have a violating witness in
    this group. For each $B in cal(E)$, select one such witness and count the distinct pairs consisting of $B$ and
    the basis lists supplied by that witness. Equation (8.7) gives a lower bound of
  $ \| cal(E) \| thin 2^(N^2 sum_i t_i macron(alpha)_i - o \( N^2 eta^4 \)) $
  on the number of pairs. On the other hand, Equations (8.6) and (8.8), together with the matrix saving,
    give the upper bound
  $ 2^(T_m + N^2 (sum_i t_i^2 - x t + x^2 \/ 2 + eta t) + o \( N^2 eta^4 \)) . $
  The enumeration may count a pair more than once if it has several compatible choices of $D \, P \, K$;
    this preserves the upper bound. In particular, the lower bound selects just one witness per matrix,
    while the upper bound includes the union over all $K$.
  Since $0 lt.eq alpha_i - macron(alpha)_i < 1 \/ N$ and $t lt.eq 1$, violation of Equation (8.5) implies
  $ sum_i t_i \( t_i - macron(alpha)_i \) - x t + x^2 \/ 2 + eta t < - eta^3 + 1 / N . $
  All binary matrices have probability $2^(- T_m)$. Dividing the pair bounds therefore gives
  $ Pr \( upright(bold(B))_m in cal(E) \) lt.eq 2^(- N^2 eta^3 + o \( N^2 eta^4 \)) . $
  The group count and all omitted costs are absorbed in this error.
    Since $N eta^3 arrow.r oo$, the total probability of a violation is $2^(- omega \( N \))$,
    including the exceptional probabilities of the imposed rank and corank properties.
    This proves the assertion, including its simultaneity over the lattices, lists, and coordinate sets. ◻
]

=== 8.2 From witness pricing to concentration <from-witness-pricing-to-concentration>

#proof[
  Fix $A > 0$. Choose a fixed $D_0 > 2 A$, and put $eta = ell^(- D_0)$, $rho = eta^3$.
    Work on the typical event in Proposition 33, and fix an arbitrary $K$ with $B bb(Z)^m subset.eq K subset.eq
    bb(Z)^m$.
  Apply Lemma 14 to $K$ with $T = \( log N \)^4$, and let $K_0$ be a minimizing saturated sublattice.
    Put $F = "span" K_0$ and
  $ d = frac(m - dim F, N) \, wide f = 1 - d = frac(dim F + N - m, N) . $
  The projected quotient $K \/ K_0$ has rank $d N$ and all its sublattices have determinant at least $T$ to their
    rank. Moreover $det K_0 lt.eq T^(dim F)$, by comparison with the zero lattice.
    The projections of the columns of $B$ span $F^perp$, and each has norm at most $sqrt(N)$.
    Choosing $d N$ independent projections and using that their integer span is a sublattice of $K \/
    K_0$ gives $det \( K \/ K_0 \) lt.eq N^(d N \/ 2)$. Hence
  #[#set math.equation(numbering: n => "(8.9)")
   $ q = frac(log det K, N log N) lt.eq d / 2 + frac(dim F, N) frac(log T, log N) lt.eq d / 2 +
     frac(4 ell, log N) . $ <eq:cube-order-dimension>]
  Consider any nonempty subset $S$ of a coset of $K$ in the cube, and base its differences at one point of $S$.
    Their projections off $F$ belong to $K \/ K_0$ and have norm at most $sqrt(N)$. Lemma 13 gives at most
  $ 2^(O \( N \/ log^6 N \)) $
  distinct projections. Restrict to a largest projection fiber and then apply Lemma 15 with parameter $rho =
    eta^3$. For sufficiently large $N$, these two operations lose at most $2 eta^3 N$ bits of logarithmic size.
    Thus, if $\| S \| = 2^(a N)$, they give a $rho$-robust subset $S'$ with
  #[#set math.equation(numbering: n => "(8.10)")
   $ \| S' \| gt.eq 2^(\( a - 2 eta^3 \) N) \, wide "span" \( S' - S' \) subset F . $ <eq:cube-fiber-extraction>]
  If $S$ is supported on a coordinate set, the same is true of its differences after these operations.
  Choose a set $P_F$ of $dim F$ pivot coordinates for $F$, so coordinate projection onto $P_F$ is injective on
    $F$, and put $J_0 = \[ m \] \\ P_F$. Then $\| J_0 \| = d N$ and a vector supported on $J_0$ belongs to $F$
    only if it is zero. Distinct bit vectors supported on $J_0$ therefore have distinct projections off $F$:
    equal projections would give a difference in $F$. Applying the preceding projection count to a coset
    intersection on $J_0$ gives
  #[#set math.equation(numbering: n => "(8.11)")
   $ M_K \( J_0 \) lt.eq 2^(O \( N \/ log^6 N \)) lt.eq 2^(eta N) . $ <eq:cube-pivot-complement>]
  Write $M_K = 2^(alpha N)$. We have $0 lt.eq alpha lt.eq 1$.
    If $alpha < 10 eta$, the conclusion follows for sufficiently large $N$, since $1 - c \( q \) gt.eq
    0$ and $10 eta lt.eq ell^(- A)$. We may therefore assume $alpha gt.eq 10 eta$.
  Apply Equation (8.10) to a full-coordinate coset attaining $M_K$.
    Denote the resulting robust subset by $S_(*)$, put $W_(*) = "span" \( S_(*) - S_(*) \)$, and write
  $ \| S_(*) \| = 2^(alpha_(*) N) \, wide v = frac(dim W_(*), N) . $
  An affine space of dimension $dim W_(*)$ contains at most $2^(dim W_(*))$ cube points, by coordinate projection.
    Consequently
  #[#set math.equation(numbering: n => "(8.12)")
   $ alpha_(*) gt.eq alpha - 2 eta^3 \, wide alpha - 2 eta^3 lt.eq v lt.eq frac(dim F, N) lt.eq
     f . $ <eq:cube-full-witness>]
  The last inequality uses $m lt.eq N$.
  We construct one coordinate set $D$ with small $M_K \( D \)$ and use it in two applications of Proposition 33.
    A list of robust sets will force $D$ to be large; applying the estimate to the full-coordinate set $S_(*)$
    then restricts how large $alpha$ can be for that same $D$.
  Initially all coordinates of $P_F$ are available. At step $i$, choose, among the available coordinates,
    a set $A_i$ of #emph[minimum cardinality] such that
  $ M_K \( J_0 union A_i \) > 2^(eta N) . $
  For a coset attaining $M_K \( J_0 union A_i \)$, apply Equation (8.10).
    It gives a robust subset $S_i$ whose difference span satisfies
  $ W_i subset F ∩ E_(J_0 union A_i) \, wide alpha_i = frac(log_2 \| S_i \|, N) gt.eq eta - 2 eta^3 \, wide t_i =
    frac(dim W_i, N) gt.eq alpha_i . $
  Because projection of $F$ onto $P_F$ is injective and $W_i$ vanishes on $P_F \\ A_i$,
    we have $t_i N lt.eq \| A_i \|$. Choose $t_i N$ pivot coordinates $H_i subset
    A_i$ on which projection of $W_i$ is injective, and declare those coordinates unavailable.
    Stop when $t = sum_i t_i gt.eq alpha - 2 eta$.
  The required set $A_i$ exists before the stopping condition is met.
    Indeed, the coordinates already declared unavailable number $t N$.
    In a full coset attaining $M_K$, fix their bit values to a most frequent pattern.
    At least $2^(\( alpha - t \) N) > 2^(2 eta N)$ points remain.
    Subtracting the fixed pattern on those coordinates translates the coset and leaves bit vectors supported on
    $J_0$ and the available coordinates. Hence that coordinate set has $M_K > 2^(eta N)$.
    Equation (8.11) also shows that each $A_i$ is nonempty.
  The spaces $W_i$ form a direct sum. In a relation $sum_i w_i = 0$ with $w_i in W_i$,
    the later terms vanish on the pivots $H_1$; injectivity on $W_1$ gives $w_1 = 0$,
    and the same argument successively gives every $w_i = 0$. Thus $t lt.eq dim F \/ N lt.eq 1$.
    Each increment is at least $eta - 2 eta^3$, so there are fewer than $3 \/
    eta$ steps for sufficiently large $N$. Together with the existence just proved,
    this ensures that the stopping condition is reached. The family of available subsets only shrinks from one
    step to the next. Since each $A_i$ has minimum cardinality, the numbers $\| A_i \|$ do not decrease.
    If the last one has size $s N$, then
  #[#set math.equation(numbering: n => "(8.13)")
   $ t gt.eq alpha - 2 eta \, wide t_i lt.eq \| A_i \| \/ N lt.eq s quad
     upright("for every ") i . $ <eq:cube-coordinate-list>]
  Remove one coordinate from the last $A_i$ and include all of $J_0$. The resulting set $D$ satisfies
  #[#set math.equation(numbering: n => "(8.14)")
   $ \| D \| = \( d + s \) N - 1 \, wide M_K \( D \) lt.eq 2^(eta N) \, $ <eq:cube-small-coordinate-set>]
  by the minimum cardinality of that $A_i$. For $x gt.eq 0$, $t > 0$, define
  $ e \( x \, t \) = cases(delim: "{", x - x^2 \/ \( 2 t \) \, & 0 lt.eq x lt.eq t \,, t \/ 2 \, & x gt.eq t .) $
  This function is nondecreasing in both variables. Its rate of change in $x$ is between zero and one,
    and its rate of change in $t$ is between zero and $1 \/ 2$. These assertions follow from
  $ partial_x e = 1 - x \/ t \, quad partial_t e = x^2 \/ \( 2 t^2 \) quad \( x < t \) \, wide partial_x e = 0 \,
    quad partial_t e = 1 \/ 2 quad \( x > t \) \, $
  and continuity at $x = t$.
  If necessary, truncate $D$ to a subset of size $t N$. Monotonicity of $M_K \( D \)$ preserves its bound,
    so Proposition 33 applied to the constructed list gives
  $ e \( d + s \, t \) & lt.eq 1 / t sum_i t_i \( t_i - alpha_i \) + eta + eta^3 / t + 1 / N\
 & lt.eq s + O \( eta \) . $
  The $1 \/ N$ accounts for the coordinate removed in Equation (8.14).
    The last inequality uses $alpha_i gt.eq 0$, $t_i lt.eq s$, and $t gt.eq alpha - 2 eta gt.eq 8 eta$.
    Replacing $t$ by $alpha$ keeps this bound: if $t gt.eq alpha$, use monotonicity in the second variable;
    if $t < alpha$, use its $1 \/ 2$-Lipschitz bound and $alpha - t lt.eq 2 eta$.
    Thus $e \( d + s \, alpha \) lt.eq s + O \( eta \)$.
  Put $h = d + s$. If $h lt.eq alpha$, the last inequality gives
  $ d lt.eq frac(h^2, 2 alpha) + O \( eta \) . $
  Since $alpha lt.eq 1$, it follows that $h gt.eq sqrt(2 d alpha) - O \( sqrt(eta) \)$.
    If $h gt.eq alpha$, it instead gives $s gt.eq alpha \/ 2 - O \( eta \)$, and then
  $ h gt.eq d + alpha \/ 2 - O \( eta \) gt.eq sqrt(2 d alpha) - O \( eta \) . $
  We have proved
  #[#set math.equation(numbering: n => "(8.15)")
   $ d + s gt.eq sqrt(2 d alpha) - O \( sqrt(eta) \) . $ <eq:cube-coordinate-lower>]
  Use the same $D$ again, now with the singleton list consisting of $S_(*)$.
    Truncate $D$ to size $v N$ if necessary. From Proposition 33 and Equation (8.12),
  $ e \( d + s \, v \) lt.eq v - alpha_(*) + eta + eta^3 / v + 1 / N lt.eq v - alpha + O \( eta \) . $
  Here $v gt.eq alpha - 2 eta^3 gt.eq 9 eta$ for large $N$.
    Since $v lt.eq f$ and the rate of change of $e$ in its second argument is at most $1 \/ 2$, this yields
  #[#set math.equation(numbering: n => "(8.16)")
   $ e \( d + s \, f \) lt.eq e \( d + s \, v \) + frac(f - v, 2) lt.eq f - alpha +
     O \( eta \) . $ <eq:cube-coordinate-upper>]
  We finish by solving the two coordinate inequalities. In the present case $f gt.eq v > 0$.
    If $d gt.eq f$, then $d + s gt.eq f$, so Equation (8.16) gives
  $ alpha lt.eq f \/ 2 + O \( eta \) = f z \( d \/ f \) + O \( eta \) . $
  Suppose instead that $d lt.eq f$. Monotonicity and the unit Lipschitz bound of $e$ in its first argument,
    together with Equations (8.15) and (8.16), give
  #[#set math.equation(numbering: n => "(8.17)")
   $ e \( sqrt(2 d alpha) \, f \) lt.eq f - alpha + O \( sqrt(eta) \) . $ <eq:cube-profile-inequality>]
  Put $u = d \/ f in \[ 0 \, 1 \]$. Directly from Equation (8.1),
  $ 2 u z \( u \) lt.eq 1 \, wide 1 - z \( u \) = sqrt(2 u z \( u \)) - u z \( u \) . $
  For completeness, if $r = sqrt(2 u - u^2)$, then $\( 1 - u \)^2 z \( u \)^2 - 2 z \( u \) + 1 = 0$,
    which gives the second identity after taking the nonnegative square root.
    The first is equivalent to $2 u lt.eq 1 + r$; for $u lt.eq 1 \/ 2$ it is immediate, and for $u gt.eq
    1 \/ 2$ its square follows from $r^2 - \( 2 u - 1 \)^2 = \( 1 - u \) \( 5 u - 1 \) gt.eq 0$.
    These identities show that $alpha_0 = f z \( u \)$ satisfies
  $ e \( sqrt(2 d alpha_0) \, f \) = f - alpha_0 . $
  The function $a mapsto a + e \( sqrt(2 d a) \, f \)$ is nondecreasing and increases by at least the increase in
    $a$. Therefore Equation (8.17) implies $alpha lt.eq alpha_0 + O \( sqrt(eta) \)$. Both cases give
  $ alpha lt.eq f z \( d \/ f \) + O \( sqrt(eta) \) = 1 - c \( d \/ 2 \) + O \( sqrt(eta) \) . $
  By Equation (8.9), monotonicity of $c$, and Equation (8.3),
  $ c \( q \) lt.eq c \( d \/ 2 \) + O #h(-0.16667em) (sqrt(frac(ell, log N))) . $
  It follows that
  $ alpha lt.eq 1 - c \( q \) + O \( sqrt(eta) \) + O #h(-0.16667em) (sqrt(frac(ell, log N))) . $
  Because $D_0 > 2 A$ is fixed, both error terms are $o \( ell^(- A) \)$.
    Increasing $N$ makes their sum at most $ell^(- A)$, proving Equation (8.2).
    The argument was deterministic for every $K$ on the single typical event of Proposition 33,
    so the conclusion is simultaneous in $K$. ◻
]

== 9 Pricing retained layers by certificates <sec:certificate-pricing>

Retaining layers in a quotient imposes a lattice condition on the new column.
  We now count partial certificates of that condition. The resulting estimate permits the certificate size to be
  chosen separately in each class of outcomes; this will allow a later argument to choose it according to the
  largest potential in that class.

We first record the probability bound for a fixed certificate at any fixed cube precision $A_(upright("cube")) >
  0$. Let $cal(F)$ be exposed information that fixes a nonsingular binary matrix $C$ of size $m in
  cal(I)_N$ and a quotient map $pi : bb(Z)^m arrow.r.twohead G$ with $C bb(Z)^m subset.eq ker pi$.
  Suppose that, conditionally on $cal(F)$, a column $v$ is uniform on ${ 0 \, 1 }^m$.
  Take $C$ in the typical set of Proposition 31 at precision $A_(upright("cube"))$.

Fix a candidate set $E$ of positive layers of $G$ after these data are fixed,
  and let $cal(R)$ be the layers retained on quotienting $G$ by $pi \( v \)$.
  Lemma 29 gives a lattice $K_E$, fixed by $pi$ and $E$, such that $E subset.eq cal(R)$ implies $v in K_E$, with

$ C bb(Z)^m subset.eq K_E subset.eq bb(Z)^m \, wide \[ bb(Z)^m : K_E \] = N^(N q \( E \)) \, wide q \( E \) =
  sum_(\( p \, e \) in E) k_G \( p \, e \) nu_p . $

The group-order bound in Equation (2.3) gives $0 lt.eq q \( E \) lt.eq 1 \/ 2$.
  Conditional uniformity of $v$ and the simultaneous cube estimate therefore give

#[#set math.equation(numbering: n => "(9.1)")
 $ Pr \( E subset.eq cal(R) divides cal(F) \) & lt.eq Pr \( v in K_E divides cal(F) \) lt.eq 2^(- m) M_(K_E)\
 & lt.eq 2^(- m) 2^(N \( 1 - c \( q \( E \) \) + ell^(- A_(upright("cube"))) \)) =
   2^(- N \( c \( q \( E \) \) - eta_N \)) \,\
eta_N & = ell^(- A_(upright("cube"))) + 1 - m / N . $ <eq:fixed-certificate-probability>]

Here $1 - m \/ N lt.eq N^(- 3 \/ 10)$. The same typical set works for every exposed quotient,
  since all its certificate lattices contain the original $C bb(Z)^m$.
  We will handle marks that depend on $v$ by counting the fixed candidates and how many each outcome offers.

For $0 lt.eq t lt.eq 1$, let

$ H_2 \( t \) = - t log_2 t - \( 1 - t \) log_2 \( 1 - t \) \, wide H_2 \( 0 \) = H_2 \( 1 \) = 0 . $

For $s \, u gt.eq 0$ and $0 lt.eq x lt.eq s$, define

#[#set math.equation(numbering: n => "(9.2)")
 $ cal(E) \( s \, u \, x \) = \( s + u \) H_2 #h(-0.16667em) (frac(x, s + u)) - s H_2 #h(-0.16667em) (x / s) \,
   $ <eq:entropy-cost>]

using the continuous values when a denominator vanishes. Here $s$ and $u$ will be the total weights of marked and
  unmarked layers, and $x$ will be a target weight for a certificate chosen among the marked layers.
  When all layers have weight $1 \/ N$, the ratio $binom(\( s + u \) N, x N) \/
  binom(s N, x N)$ counts possible certificates relative to those offered by a fixed marked set,
  and its base-two logarithm is $N cal(E) \( s \, u \, x \) + O \( log N \)$ for integer counts.

#thm([Proposition 9.1.])[
  (Certificate pricing).  #emph[Fix $A > 0$ and at most two positive constants $w_i$.
    Typically for nonsingular binary matrices $C$ of size $m in cal(I)_N$, the following assertion holds.
    The typical set is obtained by imposing Proposition 31 at a sufficiently large fixed precision depending on
    $A$ and these constants.]
  #emph[Let $cal(F)$ denote exposed information which fixes $C$, a quotient map $G_C arrow.r.twohead G$,
    and the data described next. Suppose that, conditionally on $cal(F)$,
    a tested column $v$ is uniform on ${ 0 \, 1 }^m$. Partition the layers of $G$ into at most two categories,
    each a union of whole plateaus. In category $i$, assume that every height is at least $w_i$; only $w_i = 1 \,
    2$ will be needed. The partition is part of the exposed data.
    In the quotient of $G$ by the image of $v$, an outcome may mark some of the retained layers.
    Require that the marked layers on each plateau form a prefix.
    The marks may also depend on other random bits in the experiment.]
  #emph[Let $cal(A)$ be any subevent of this experiment. There is a partition of $cal(A)$ into at most
    $2^(N ell^(- A))$ classes, constructed before choosing a representative or any target weights,
    with the following property. Take any nonempty class $cal(A)_alpha$, any representative outcome in it,
    and write $s_i$ and $u_i$ for the representative’s sums of the weights $nu_p$ of the marked and unmarked
    layers in category $i$. For any choices $0 lt.eq x_i lt.eq s_i$,
#[#set math.equation(numbering: n => "(9.3)")
 $ Pr \( cal(A)_alpha divides cal(F) \) lt.eq
   2^(- N (c (sum_i w_i x_i) - sum_i cal(E) \( s_i \, u_i \, x_i \) - ell^(- A))) . $ <eq:certificate-pricing>]

 Here $cal(A)_alpha$ already includes the restriction to $cal(A)$;
   the probability is conditioned only on the exposed information.
   The class count and the estimate are uniform in that information, the quotient, the subevent,
   and the representative. In particular, the exposed information may include a preceding column that fixes $G$,
   provided the tested column remains conditionally uniform.]
] <prop:certificate-pricing>

We record the entropy facts needed below. Put

$ H \( s \, u \) = \( s + u \) H_2 #h(-0.16667em) (frac(s, s + u)) \, wide H \( 0 \, 0 \) = 0 . $

Expansion of the logarithms gives

#[#set math.equation(numbering: n => "(9.4)")
 $ cal(E) \( s \, u \, x \) = H \( s \, u \) - H \( s - x \, u \) . $ <eq:entropy-difference>]

For $s > 0$,

$ frac(partial H, partial s) \( s \, u \) = log_2 \( 1 + u \/ s \) \, $

which is nonnegative and nonincreasing in $s$. Thus $cal(E) gt.eq 0$.
  For fixed $s \, u$, the function $cal(E) \( s \, u \, x \)$ is convex in $x in \[ 0 \, s \]$:
  in the interior its derivative is $log_2 \( 1 + u \/ \( s - x \) \)$, which is nondecreasing in $x$.
  For fixed $u \, x$, it is nonincreasing in $s gt.eq x$, since for $s > x$,

$ frac(partial cal(E), partial s) \( s \, u \, x \) = log_2 \( 1 + u \/ s \) -
  log_2 \( 1 + u \/ \( s - x \) \) lt.eq 0 . $

The endpoint cases follow by continuity. The defining formula also gives homogeneity of degree one in all three
  size variables: $cal(E) \( t s \, t u \, t x \) = t cal(E) \( s \, u \, x \)$ for $t gt.eq 0$.
  For fixed $0 lt.eq theta lt.eq 1$, write

$ cal(E)_theta \( s \, u \) = cal(E) \( s \, u \, theta s \) . $

This function is concave and homogeneous of degree one in $\( s \, u \)$. Indeed, the first term in

$ cal(E)_theta \( s \, u \) = \( s + u \) H_2 #h(-0.16667em) (frac(theta s, s + u)) - s H_2 \( theta \) $

is the perspective of the concave function $H_2$, composed with a linear map, and the second term is linear.
  Consequently $cal(E)_theta$ is superadditive on the nonnegative quadrant:

#[#set math.equation(numbering: n => "(9.5)")
 $ sum_j cal(E)_theta \( s_j \, u_j \) lt.eq cal(E)_theta #h(-0.16667em) (sum_j s_j \, sum_j u_j) .
   $ <eq:entropy-superadditive>]

These functions have uniform continuity estimates at their boundaries.
  For every fixed $M$, the function $- t log_2 t$, extended by zero at zero,
  is Hölder continuous of exponent $1 \/ 2$ on $\[ 0 \, M \]$.
  To see this, integrate its derivative on an interval of length $d$;
  the absolute integral is at most $O_M \( d \( 1 + \| log d \| \) \) = O_M \( sqrt(d) \)$,
  with the same conclusion for intervals meeting zero. Expressing $H \( s \, u \)$ as

$ - s log_2 s - u log_2 u + \( s + u \) log_2 \( s + u \) $

therefore shows that it is Hölder continuous of exponent $1 \/ 2$ on every bounded nonnegative rectangle.
  Equation (9.4) gives the same estimate for $cal(E) \( s \, u \, x \)$ on bounded parts of its domain.
  It also gives an estimate for $cal(E)_theta \( s \, u \)$ whose constant is uniform over $0 lt.eq theta lt.eq
  1$. We will use these estimates both to round certificate cardinalities and to replace layer weights by nearby
  cell weights.

#proof[
  Work conditionally on fixed exposed data satisfying the assumptions.
    Choose a fixed cube precision $A_(upright("cube")) > 0$, to be specified at the end,
    and invoke Equation (9.1) for each fixed candidate $E$. Here the quotient map $G_C arrow.r.twohead G$,
    composed with the natural map from $bb(Z)^m$, gives the exposed map $pi$ in that observation.
    This uses only the conditional uniformity of $v$; additional random bits and the restriction to $cal(A)$ need
    not be independent of $v$.
  We now construct the classes. Fix a large constant $D > 0$, to be chosen at the end, and set $delta =
    ell^(- D)$ and $a_p = log_N p$. The order bound gives
  #[#set math.equation(numbering: n => "(9.6)")
   $ sum_(p \, e) k_G \( p \, e \) a_p / N lt.eq 1 / 2 \, wide sum_(p \, e) k_G \( p \, e \) lt.eq
     frac(N log N, 2 log 2) . $ <eq:certificate-order-bounds>]
  We classify the marks in three prime ranges.
  For $a_p > ell^D$, record every mark bit. There are at most $N \/ \( 2 ell^D \)$ layers in this range by the
    first bound in Equation (9.6), so this record costs $O \( N ell^(- D) \)$ bits.
  For $a_p < 1 - delta$, record the number of marks on each plateau.
    These counts determine all the marks because they are prefixes.
    There are at most $N^(1 - delta)$ primes in this range. If $d_p$ is the number of plateaus at $p$,
    their distinct positive heights give
  $ frac(d_p \( d_p + 1 \), 2) lt.eq sum_e k_G \( p \, e \) . $
  Cauchy–Schwarz and the second bound in Equation (9.6) show that the total number of these plateaus is
    $O \( N^(1 - delta \/ 2) sqrt(log N) \)$. Each prefix count costs $O \( log N \)$ bits,
    since every plateau length is $O \( N log N \)$. The total cost is therefore
  $ O #h(-0.16667em) (N^(1 - delta \/ 2) \( log N \)^(3 \/ 2)) = o \( N ell^(- D) \) . $
  For the last equality, use $delta log N = \( log N \) \/ ell^D gt.double log log N$.
  The remaining primes satisfy $1 - delta lt.eq a_p lt.eq ell^D$.
    For each category, split this range into bins of width at most $delta$, starting at $1 - delta$,
    and call a category-bin pair a cell. There are $J = O \( ell^(2 D) \)$ cells.
    In a cell $j$, let $lambda_j$ be the lower endpoint of its bin, so
  $ 1 - delta lt.eq lambda_j lt.eq ell^D \, wide lambda_j lt.eq a_p lt.eq lambda_j + delta quad
    upright("for its layers") . $
  The number of layers in this entire range is $O \( N \)$, again by the first order bound.
    Record only the number of marks in each cell. This costs $O \( ell^(2 D) log N \) = o \( N ell^(- D) \)$ bits.
    All these records depend only on the marks and the exposed data;
    intersecting their classes with $cal(A)$ gives the desired classes for the subevent.
    Their number is at most $2^(O \( N ell^(- D) \) + o \( N ell^(- D) \))$, uniformly in the exposed quotient.
  Fix one class, a representative, and target weights as in the statement.
    For category $i$, put $theta_i = x_i \/ s_i$ if $s_i > 0$, and put $theta_i = 0$ otherwise.
    In the large and small prime ranges the marked sets are known throughout the class;
    include all of them in each certificate. In an intermediate cell $j$ of category $i$,
    let $n_j$ be its number of layers and $r_j$ its recorded number of marks, and require a certificate to contain any
  $ a_j = floor.l theta_i r_j floor.r $
  of those marked layers. Thus every outcome in the class offers exactly
  $ frak(m) = product_j binom(r_j, a_j) $
  certificates, whereas the number of possible certificates for the class is at most
  $ frak(n) = product_j binom(n_j, a_j) . $
  Empty products have value one. The latter count is an upper bound because it allows arbitrary layers in each
    cell, without imposing the prefix restriction.
  We check the weight certified by each such choice uniformly over all outcomes in the class.
    In category $i$, let $s_i^0$ be the marked weight in the large and small prime ranges;
    it is fixed in the class. The representative’s marked weight in its intermediate cells differs from
    $sum_(j in i) lambda_j r_j \/ N$ by at most $delta sum_(j in i) r_j \/ N = O \( delta \)$.
    The weight selected in those cells is at least
  $ sum_(j in i) frac(lambda_j a_j, N) gt.eq theta_i sum_(j in i) frac(lambda_j r_j, N) - 1 /
    N sum_(j in i) lambda_j . $
  The last term is $O \( ell^(3 D) \/ N \) = o \( delta \)$.
    Since all of the known marked weight is included and $s_i^0 gt.eq theta_i s_i^0$,
    the selected weight in this category is at least $x_i - O \( delta \)$.
    Every selected layer there has height at least $w_i$. Consequently, uniformly over its choices,
  #[#set math.equation(numbering: n => "(9.7)")
   $ q \( E \) gt.eq q_0 - O \( delta \) \, wide q_0 = sum_i w_i x_i . $ <eq:certificate-index-lower-bound>]
  Both $q \( E \)$ and $q_0$ belong to $\[ 0 \, 1 \/ 2 \]$:
    for the latter, $q_0 lt.eq sum_i w_i s_i lt.eq sum_(p \, e) k_G \( p \, e \) nu_p$.
    The profile $c$ is increasing and Hölder continuous of exponent $1 \/ 2$ on this interval.
    Equation (9.7) therefore gives
  $ c \( q \( E \) \) gt.eq c \( q_0 \) - O \( sqrt(delta) \) . $
  Together with Equation (9.1), this bounds the probability of offering any one fixed candidate certificate by
    $2^(- N \( c \( q_0 \) - eta_N - O \( sqrt(delta) \) \))$.
    This conclusion holds after intersection with the class and with $cal(A)$,
    since such an intersection still implies $v in K_E$.
  Double counting outcome-certificate pairs now yields
  #[#set math.equation(numbering: n => "(9.8)")
   $ Pr \( cal(A)_alpha divides cal(F) \) lt.eq frak(n) / frak(m)
     2^(- N \( c \( q_0 \) - eta_N - O \( sqrt(delta) \) \)) . $ <eq:certificate-double-count>]
  Indeed, summing over candidate certificates the probabilities of the outcomes in the class offering that
    certificate gives $frak(m) Pr \( cal(A)_alpha divides cal(F) \)$;
    each summand is bounded by the fixed-certificate estimate.
    This also explains why no conditional independence of the marks or of the subevent is needed.
  It remains to bound the ratio in Equation (9.8). For integers $0 lt.eq a lt.eq n$, the elementary binomial bounds are
  $ n H_2 \( a \/ n \) - log_2 \( n + 1 \) lt.eq log_2 binom(n, a) lt.eq n H_2 \( a \/ n \) . $
  For completeness, insert the parameter $a \/ n$ into the binomial distribution.
    The upper bound follows because its probability at $a$ is at most one,
    and the lower bound follows because $a$ is a mode and there are $n + 1$ probabilities summing to one.
    The endpoints are immediate. Applying these bounds to a cell gives
  $ 1 / N log_2 binom(n_j, a_j) / binom(r_j, a_j) lt.eq cal(E) #h(-0.16667em)
    (r_j / N \, frac(n_j - r_j, N) \, a_j / N) + frac(log_2 \( r_j + 1 \), N) . $
  All arguments here stay in a fixed bounded set. Replacing $a_j \/ N$ by $theta_i r_j \/
    N$ changes the entropy term by $O \( N^(- 1 \/ 2) \)$, uniformly in $theta_i$, by the Hölder estimate above.
    After summing over $J = O \( ell^(2 D) \)$ cells, all rounding and binomial errors are
  $ O #h(-0.16667em) (ell^(2 D) (N^(- 1 \/ 2) + frac(log N, N))) \, $
  which is smaller than every fixed negative power of $ell$.
  We convert the remaining entropy terms from counts to weights.
    Their nonnegativity and homogeneity give, for a cell in category $i$,
  $ cal(E)_(theta_i) #h(-0.16667em) (r_j / N \, frac(n_j - r_j, N)) lt.eq
    frac(1, 1 - delta) cal(E)_(theta_i) #h(-0.16667em) (frac(lambda_j r_j, N) \, frac(lambda_j \( n_j - r_j \), N)) . $
  Let $u_i^0$, alongside $s_i^0$, denote the unmarked weight in the known large and small ranges, and put
  $ underline(s)_i = s_i^0 + sum_(j in i) frac(lambda_j r_j, N) \, wide underline(u)_i = u_i^0 +
    sum_(j in i) frac(lambda_j \( n_j - r_j \), N) . $
  By Equation (9.5) the weighted cell terms sum to at most
    $cal(E)_(theta_i) \( underline(s)_i \, underline(u)_i \)$.
    Here adding the known ranges preserves this upper bound because their entropy term is nonnegative.
    The representative weights satisfy
  $ 0 lt.eq s_i - underline(s)_i = O \( delta \) \, wide 0 lt.eq u_i - underline(u)_i = O \( delta \) . $
  All these weights have bounded sum, at most $1 \/ 2$ before replacing weights by lower endpoints.
    The uniform Hölder estimate for $cal(E)_(theta_i)$ and the factor $\( 1 - delta \)^(- 1) = 1 +
    O \( delta \)$ therefore show that
  #[#set math.equation(numbering: n => "(9.9)")
   $ 1 / N log_2 frak(n) / frak(m) lt.eq sum_i cal(E) \( s_i \, u_i \, x_i \) + O \( sqrt(delta) \) +
     O #h(-0.16667em) (ell^(2 D) (N^(- 1 \/ 2) + frac(log N, N))) . $ <eq:certificate-entropy-bound>]
  The constants in this estimate are uniform in the targets, including their endpoint values.
  Choose the fixed $D$ sufficiently large that $ell^(- D \/ 2) = o \( ell^(- A) \)$,
    and then choose a fixed cube precision $A_(upright("cube")) > A$.
    The class count is at most $2^(N ell^(- A))$ for large $N$.
    Moreover, $eta_N$, the rounding errors, and the two $O \( sqrt(delta) \)$ errors in Equations (9.8) and (9.9)
    have sum at most $ell^(- A)$ for large $N$. Substitution proves Equation (9.3).
    Every choice of precision was fixed before $N$ tended to infinity and was independent of the quotient and
    exposed columns, as required. ◻
]

We next extract a uniform cost for retaining a noticeable total weight. Set

#[#set math.equation(numbering: n => "(9.10)")
 $ R = ceil.l ell^2 ceil.r \, wide sigma = R^(- 6) . $ <eq:retention-scales>]

#thm([Proposition 9.2.])[
  (Retained-layer cost).  #emph[Typically for nonsingular binary matrices $C$ of size $m in cal(I)_N$,
    the following estimate holds. Let $h in { 1 \, 2 }$ and let $v_1 \, dots.h \,
    v_h$ be independent uniform columns in ${ 0 \, 1 }^m$, conditionally on $C$.
    Starting with $G^(\( 0 \)) = G_C$, let $G^(\( j \))$ be the quotient of $G^(\( j - 1 \))$ by the image of
    $v_j$. For each $1 lt.eq j lt.eq h$, and conditionally on any values of the preceding columns,
#[#set math.equation(numbering: n => "(9.11)")
 $ Pr #h(-0.16667em) (sum_(\( p \, e \) upright(" retained in")\
G^(\( j - 1 \)) arrow.r.twohead G^(\( j \))) nu_p gt.eq sigma thin mid(bar.v) thin C \, v_1 \, dots.h \,
  v_(j - 1)) lt.eq 2^(- N sigma \/ 2) . $ <eq:retention-cost>]

 The typical set imposes one fixed precision on $C$, independent of the values of the preceding columns.
   When these columns occur in a random enlargement of $C$, no nonsingularity assumption on the destination matrix
   is required.]
] <prop:retention-cost>

#proof[
  Apply Proposition 34 at the fixed precision $A_0 = 40$. For the $j$-th quotient,
    condition on $C$ and the preceding columns; these fix the quotient map to $G^(\( j - 1 \))$,
    while $v_j$ remains uniform. Use one category of all its layers, take $w_1 = 1$, and mark all retained layers.
    Lemma 28 ensures that these marks are prefixes on plateaus. Restrict to the subevent in Equation (9.11).
    For any representative of a nonempty class its marked weight $s$ is at least $sigma$, so we may choose $x =
    sigma^2$. The total layer weight $s + u$ is at most $1 \/ 2$, by Equation (2.3).
    Since $H_2 \( t \) lt.eq t log_2 \( e \/ t \)$, Equation (9.2) yields
  $ 0 lt.eq cal(E) \( s \, u \, sigma^2 \) lt.eq \( s + u \) H_2 #h(-0.16667em) (frac(sigma^2, s + u)) lt.eq
    O #h(-0.16667em) (sigma^2 log \( 1 \/ sigma \)) . $
  This bound is uniform over the representatives in this subevent.
  The defining formula for the profile $c$ satisfies $c \( q \) = 2 sqrt(q) + O \( q \)$ as $q arrow.b 0$.
    Indeed, in that formula $u = 2 q \/ \( 1 - 2 q \) = 2 q + O \( q^2 \)$, so $sqrt(2 u - u^2) = 2 sqrt(q) +
    O \( q^(3 \/ 2) \)$, and substitution gives the claimed expansion.
    In particular $c \( q \) gt.eq \( 3 \/ 2 \) sqrt(q)$ for all sufficiently small $q$.
    Proposition 34 therefore bounds the probability of each class by
  $ 2^(- N (\( 3 \/ 2 \) sigma - O \( sigma^2 log \( 1 \/ sigma \) \) - ell^(- 40))) . $
  There are at most $2^(N ell^(- 40))$ classes. Since $sigma asymp ell^(- 12)$,
    both $sigma^2 log \( 1 \/ sigma \) = o \( sigma \)$ and $ell^(- 40) = o \( sigma \)$.
    Summing the class probabilities gives Equation (9.11) for large $N$.
  The argument tests only the quotient by the selected column.
    It does not use a new principal block or any property of an enlarged matrix.
    The conditional uniformity for a second column and the simultaneous cube estimate for lattices containing $C
    bb(Z)^m$ establish the claimed uniformity over the preceding column. ◻
]

== 10 Paying for an increase of potential <sec:potential-step>

We prove Proposition 27. For a transition of width one, two bounds on the orders of the endpoint groups restrict
  the possible layer changes. A scalar optimization then shows that the certificate cost pays for the increase of
  potential. For width two, the gate is paid for directly by the admissible-column estimate.

=== 10.1 Layer changes and order budgets <layer-changes-and-order-budgets>

Fix a transition of width one from a nonsingular matrix $C$ to a nonsingular matrix $B$,
  and let $Q$ be the common quotient obtained from $G_C$ by the new column and from $G_B$ by the new coordinate.
  For an old layer $\( p \, e \)$, write

$ k = k_C \( p \, e \) \, wide k' = k_Q \( p \, e \) . $

The interlacing of layer heights gives

$ k' in { k - 1 \, k } \, wide k_B \( p \, e \) in { k' \, k' + 1 } . $

If $k_C \( p \, e \) = 0$, the same statement gives $k_B \( p \, e \) lt.eq 1$,
  so this layer contributes nothing to either potential.

Use the weights $nu_p$ in all sums below. In the height-one category,
  mark exactly the layers that reach height two; in the category of old height at least two,
  mark every retained layer. Let $g \, v_0$ be the marked and unmarked weights in the first category, and $a \,
  u$ those in the second. The following six types define $L$ and $P$;
  the last column bounds the potential change per unit weight.

#[
  #set par(justify: false)
#table(
  columns: 5,
  align: (center, center, center, center, center,),
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[weight
], table.cell(rowspan: 1, colspan: 1)[old height
], table.cell(rowspan: 1, colspan: 1)[retention status
], table.cell(rowspan: 1, colspan: 1)[destination height
], table.cell(rowspan: 1, colspan: 1)[potential change per unit, at most
]),
  table.cell(rowspan: 1, colspan: 1)[$g$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[retained
], table.cell(rowspan: 1, colspan: 1)[$2$
], table.cell(rowspan: 1, colspan: 1)[$beta$
],
  table.cell(rowspan: 1, colspan: 1)[$v_0$
], table.cell(rowspan: 1, colspan: 1)[$1$
], table.cell(rowspan: 1, colspan: 1)[retention may occur
], table.cell(rowspan: 1, colspan: 1)[$lt.eq 1$
], table.cell(rowspan: 1, colspan: 1)[$0$
],
  table.cell(rowspan: 1, colspan: 1)[$a - L$
], table.cell(rowspan: 1, colspan: 1)[$k gt.eq 2$
], table.cell(rowspan: 1, colspan: 1)[retained
], table.cell(rowspan: 1, colspan: 1)[$k + 1$
], table.cell(rowspan: 1, colspan: 1)[$6 - beta$
],
  table.cell(rowspan: 1, colspan: 1)[$L$
], table.cell(rowspan: 1, colspan: 1)[$k gt.eq 2$
], table.cell(rowspan: 1, colspan: 1)[retained
], table.cell(rowspan: 1, colspan: 1)[$k$
], table.cell(rowspan: 1, colspan: 1)[$0$
],
  table.cell(rowspan: 1, colspan: 1)[$u - P$
], table.cell(rowspan: 1, colspan: 1)[$k gt.eq 2$
], table.cell(rowspan: 1, colspan: 1)[not retained
], table.cell(rowspan: 1, colspan: 1)[$k - 1$
], table.cell(rowspan: 1, colspan: 1)[$- beta$
],
  table.cell(rowspan: 1, colspan: 1)[$P$
], table.cell(rowspan: 1, colspan: 1)[$k gt.eq 2$
], table.cell(rowspan: 1, colspan: 1)[not retained
], table.cell(rowspan: 1, colspan: 1)[$k$
], table.cell(rowspan: 1, colspan: 1)[$0$
],
)
]

The $g$-row is retained because $k_B \( p \, e \) = 2$ forces $k' = 1$.
  The potential bounds follow from $phi.alt \( 2 \) = beta = 7 \/ 5$ and $phi.alt \( k \) = 2 k$ for $k gt.eq 3$:
  an increase from height at least two costs at most $6 - beta$ per unit weight,
  and a decrease saves at least $beta$. Layers that stay at the same height make no change.

Both categories consist of whole plateaus determined by $G_C$. The marks are prefixes on these plateaus:
  this is the retention property for the second category, and for the first it follows from the fact that
  $k_B \( p \, e \)$ is nonincreasing in $e$. Thus these marks have the form required in Proposition 34.

We claim

#[#set math.equation(numbering: n => "(10.1)")
 $ P lt.eq L \, wide a_0 := a - L + P in \[ 0 \, a \] . $ <eq:flat-compensation>]

Here $a_0$ is an effective scalar mass; the actual marked family in the second category has mass $a$.
  Thus every $0 lt.eq y lt.eq a_0 lt.eq a$ is a valid target for that marked family.
  To prove the first assertion, fix $p$ and let $t$ be the last exponent at which $k_C \( p \, e \) gt.eq 2$,
  taking $t = 0$ if there is none. Attach a subscript $p$ to the contribution of this prime to each weight sum.
  In the notation of Lemma 30, a retained layer in this range increases the height by one unless it is flat;
  an unmarked layer decreases it by one unless it persists. Consequently that Lemma, with $h = 1$, gives

$ \( a_p - L_p \) - \( u_p - P_p \) = nu_p #scale(x: 120%, y: 120%)[\(] F_B \( p \, t \) -
  F_C \( p \, t \) #scale(x: 120%, y: 120%)[\)] lt.eq nu_p \( t - 2 U_t \) = a_p - u_p . $

The last equality holds because $U_t$ counts the unmarked layers in this range.
  Hence $P_p lt.eq L_p$, and summing over primes proves $P lt.eq L$.
  Also $L lt.eq a$, so $a_0 = a - L + P$ is nonnegative and at most $a$.

Summing the potential bounds in the table gives

#[#set math.equation(numbering: n => "(10.2)")
 $ Psi \( B \) - Psi \( C \) & lt.eq beta g + \( 6 - beta \) \( a - L \) - beta \( u - P \)\
 & lt.eq I := beta g + \( 6 - beta \) a_0 - beta u . $ <eq:potential-increment>]

Indeed, the first line equals $I - \( 6 - 2 beta \) P$, and $6 - 2 beta > 0$.

The total height times weight is at most $1 \/ 2$ at both endpoints. At the $B$ endpoint it is at least

$ 2 g + 3 \( a - L \) + 2 L + \( u - P \) + 2 P = 2 g + 3 a + u - L + P gt.eq 2 g + 3 a_0 + u . $

At the $C$ endpoint it is at least $g + v_0 + 2 a + 2 u$, which is at least $g + v_0 + 2 a_0 + 2 u$.
  We have therefore obtained the two budgets

#[#set math.equation(numbering: n => "(10.3)")
 $ 2 g + 3 a_0 + u lt.eq 1 / 2 \, wide g + v_0 + 2 a_0 + 2 u lt.eq 1 / 2 . $ <eq:potential-budgets>]

=== 10.2 Scalar bound and conditional potential estimate <scalar-bound-and-conditional-potential-estimate>

#thm([Lemma 10.1.])[
  (Budget optimization).  #emph[Let $c$ and $cal(E)$ be defined by Equations (8.1) and (9.2), and let $beta =
    7 \/ 5$. If $g \, v_0 \, a_0 \, u gt.eq 0$ satisfy
$ 2 g + 3 a_0 + u lt.eq 1 / 2 \, wide g + v_0 + 2 a_0 + 2 u lt.eq 1 / 2 \, $

 then there are $x in \[ 0 \, g \]$ and $y in \[ 0 \, a_0 \]$ for which
#[#set math.equation(numbering: n => "(10.4)")
 $ c \( x + 2 y \) - cal(E) \( g \, v_0 \, x \) - cal(E) \( a_0 \, u \, y \) gt.eq beta g + \( 6 - beta \) a_0 -
   beta u . $ <eq:budget-primal>]

]
] <lem:budget-optimization>

The inequality says that certificate concentration, after paying both entropy costs,
  covers the upper bound $I$ for the potential increase. The proof of the lemma follows in the next subsection.

#proof[
  Fix the desired precision $A > 0$, and set $A_1 = A + 2$.
    For width one, take a nonsingular starting matrix $C$ in the typical set of Proposition 34 at precision $A_1$
    for $\( w_1 \, w_2 \) = \( 1 \, 2 \)$. Extend the marking rule above to singular outcomes by leaving all
    layers unmarked. Apply that Proposition with exposed information $C$, starting quotient $G_C$,
    and the subevent ${ det B eq.not 0 }$. The tested column is uniform conditional on $C$,
    and the marks defined above are allowed to depend also on the new diagonal bit.
    The Proposition gives at most $2^(N ell^(- A_1))$ classes.
    In each nonempty class $cal(C)$, choose an outcome $B_(cal(C))$ maximizing $Psi \( B \)$ in that class.
    Such a representative exists because the outcome space is finite.
  For this representative, form $g \, v_0 \, a \, u \, L \, P \, a_0$ and $I$ as above.
    Lemma 36 supplies $x in \[ 0 \, g \]$ and $y in \[ 0 \, a_0 \]$.
    These are admissible certificate target weights for the categories of minimum heights one and two,
    since $a_0 lt.eq a$. The monotonicity of $cal(E)$ in its first argument gives
  $ c \( x + 2 y \) - cal(E) \( g \, v_0 \, x \) - cal(E) \( a \, u \, y \) & gt.eq c \( x + 2 y \) -
    cal(E) \( g \, v_0 \, x \) - cal(E) \( a_0 \, u \, y \)\
 & gt.eq I . $
  Proposition 34, applied to this representative in the restricted outcome space, therefore yields
  $ Pr \( cal(C) divides C \) lt.eq 2^(- N \( I - ell^(- A_1) \)) . $
  Since $Psi \( B_(cal(C)) \) - Psi \( C \) lt.eq I$ by Equation (10.2), the contribution of this class satisfies
  $ bb(E) #h(-0.16667em) [upright(bold(1))_(cal(C)) thin 2^(N Psi \( B \)) divides C] lt.eq
    2^(N Psi \( B_(cal(C)) \)) Pr \( cal(C) divides C \) lt.eq 2^(N \( Psi \( C \) + ell^(- A_1) \)) . $
  Summing over the classes proves
  $ bb(E) #h(-0.16667em) [upright(bold(1))_({ det B eq.not 0 }) thin 2^(N Psi \( B \)) divides C] lt.eq
    2^(N \( Psi \( C \) + 2 ell^(- A_1) \)) lt.eq 2^(N \( Psi \( C \) + ell^(- A) \)) $
  for all sufficiently large $N$.
  For width two, take $C$ also in the typical set of Proposition 7 at precision $A_1$, and let $m$ be its size.
    Conditional on $C$, the two cross columns $v_1 \, v_2$ are independent and uniform on ${ 0 \, 1 }^m$.
    For the gate $cal(G)_2 = { v_1 \, v_2 in cal(S) \( C \) }$, that Proposition gives
  $ Pr \( cal(G)_2 divides C \) = 2^(- 2 m) \| cal(S) \( C \) \|^2 lt.eq
    2^(- 2 m + 2 N \( Psi \( C \) + ell^(- A_1) \)) . $
  On nonsingular outcomes $Psi \( B \) lt.eq 1$. Consequently
  $ bb(E) #h(-0.16667em)
    [upright(bold(1))_({ det B eq.not 0 }) upright(bold(1))_(cal(G)_2) 2^(N Psi \( B \)) divides C] & lt.eq
    2^(N - 2 m + 2 N \( Psi \( C \) + ell^(- A_1) \))\
 & lt.eq 2^(N \( Psi \( C \) + 2 \( 1 - m \/ N \) + 2 ell^(- A_1) \))\
 & lt.eq 2^(N \( Psi \( C \) + ell^(- A) \)) . $
  The second line uses $Psi \( C \) lt.eq 1$, and the last uses $1 - m \/ N lt.eq N^(- 3 \/ 10) =
    o \( ell^(- A) \)$ together with $A_1 = A + 2$. Intersecting the two typical sets proves both conditional
    assertions of Proposition 27, with arbitrary fixed precision and with the stated nonsingularity and gate
    indicators. ◻
]

=== 10.3 Proof of the budget optimization <proof-of-the-budget-optimization>

#proof[
  The second budget ensures $x + 2 y lt.eq 1 \/ 2$ throughout the rectangle under consideration.
    Sections 8 and 9 show that $c$ is nondecreasing and concave, while $cal(E)$ is continuous, nonnegative,
    convex in its target, homogeneous of degree one in all size variables,
    and nonincreasing in its first argument for fixed $u \, x$.
    Equation (8.1) further shows that $c$ is differentiable on $\( 0 \, 1 \/ 2 \)$, including the join at $q =
    1 \/ 4$, has left derivative $1$ at $1 \/ 2$, and satisfies $c \( q \) \/ q arrow.r oo$ as $q arrow.b 0$.
  #strong[Supporting slope.] For $w \, t gt.eq 0$, put
  $ c^(*) \( w \) = max_(0 lt.eq q lt.eq 1 \/ 2) #scale(x: 120%, y: 120%)[\(] c \( q \) -
    w q #scale(x: 120%, y: 120%)[\)] \, wide cal(F)_t \( s \, u \) =
    max_(0 lt.eq x lt.eq s) #scale(x: 120%, y: 120%)[\(] t x - cal(E) \( s \, u \, x \) #scale(x: 120%, y: 120%)[\)] . $
  Write $I = beta g + \( 6 - beta \) a_0 - beta u$. We will prove that, for every $w gt.eq 0$,
  #[#set math.equation(numbering: n => "(10.5)")
   $ c^(*) \( w \) + cal(F)_w \( g \, v_0 \) + cal(F)_(2 w) \( a_0 \, u \) gt.eq I . $ <eq:budget-dual>]
  Here is a justification that this suffices. If $g = a_0 = 0$, taking $x = y =
    0$ proves Equation (10.4) immediately. Otherwise let $\( x_(*) \, y_(*) \)$ maximize its left side on the
    compact rectangle, and put $q_(*) = x_(*) + 2 y_(*)$. At zero the objective is zero.
    For a positive one of $g \, a_0$, its entropy cost is $O \( x \)$ or $O \( y \)$ near zero,
    by the derivative of $H$ recorded in Section 9; the fact that $c \( q \) \/ q arrow.r
    oo$ then shows that the maximum is positive. Thus $q_(*) > 0$.
  Take $w = c' \( q_(*) \)$ if $q_(*) < 1 \/ 2$, and the left derivative if $q_(*) = 1 \/ 2$.
    This is a nonnegative supporting slope, so $c^(*) \( w \) = c \( q_(*) \) - w q_(*)$. Let
  $ K \( x \, y \) = cal(E) \( g \, v_0 \, x \) + cal(E) \( a_0 \, u \, y \) . $
  We claim that $\( x_(*) \, y_(*) \)$ maximizes $w \( x + 2 y \) - K \( x \, y \)$ on the same rectangle.
    If some $\( x \, y \)$ gave a strictly larger value, take the point a fraction $theta$ along the segment from
    $\( x_(*) \, y_(*) \)$ to $\( x \, y \)$. Convexity of $K$ and the one-sided differentiability of $c$ in this
    feasible direction give, as $theta arrow.b 0$, an increase in the original objective of at least
  $ theta #scale(x: 120%, y: 120%)[\(] w \( x + 2 y - q_(*) \) - K \( x \, y \) +
    K \( x_(*) \, y_(*) \) #scale(x: 120%, y: 120%)[\)] + o \( theta \) > 0 \, $
  a contradiction. The claimed maximum separates into its two coordinates.
    Hence the maximum of the left side of Equation (10.4) is exactly $c^(*) \( w \) + cal(F)_w \( g \, v_0 \) +
    cal(F)_(2 w) \( a_0 \, u \)$ at this supporting slope. Equation (10.5) proves the desired assertion.
  #strong[Entropy minimum and criterion.] We use the function $H$ from Equation (9.4) to compute a lower bound for
    the two $cal(F)$ terms. For $t > 0$ set
  $ D \( t \) = - log_2 \( 1 - 2^(- t) \) . $
  For $r gt.eq 0$, maximizing $H \( z \, r \) - t z$ over $0 lt.eq z lt.eq 1$ at $z = min { 1 \,
    r \/ \( 2^t - 1 \) }$ gives
  $ cal(F)_t \( 1 \, r \) =
    cases(delim: "{", t - H \( 1 \, r \) + D \( t \) r \, & 0 lt.eq r lt.eq 2^t - 1 \,, 0 \, & r gt.eq 2^t - 1 .) $
  For $h gt.eq 0$, the derivative on the first branch after adding $h r$ is $D \( t \) + h -
    log_2 \( 1 + 1 \/ r \)$. It is increasing in $r$ and vanishes at $r = \( 2^(D \( t \) + h) - 1 \)^(- 1) lt.eq
    2^t - 1$, with equality when $h = 0$. On the second branch $h r$ is nondecreasing.
    Evaluation at this minimum therefore gives
  #[#set math.equation(numbering: n => "(10.6)")
   $ min_(r gt.eq 0) #scale(x: 120%, y: 120%)[\(] cal(F)_t \( 1 \, r \) + h r #scale(x: 120%, y: 120%)[\)] & = t -
     D \( D \( t \) + h \)\
 & = cal(L) \( t \, h \) := log_2 #h(-0.16667em) (1 + \( 2^t - 1 \) \( 1 - 2^(- h) \)) . $ <eq:entropy-dual-minimum>]
  For $t = 0$, both the minimum and $cal(L) \( 0 \, h \)$ are zero,
    so the equality between the first and last expressions holds there as well;
    the middle expression is used only for $t > 0$.
  For a given $w$, it is enough to find $lambda \, mu gt.eq 0$ such that
  #[#set math.equation(numbering: n => "(10.7)")
   $ 2 lambda + mu + cal(L) \( w \, mu \) & gt.eq beta \,\
3 lambda + 2 mu + cal(L) \( 2 w \, beta + lambda + 2 mu \) & gt.eq 6 - beta \,\
\( lambda + mu \) \/ 2 & lt.eq c^(*) \( w \) . $ <eq:budget-multipliers>]
  Indeed, homogeneity and Equation (10.6) imply
  $ cal(F)_w \( g \, v_0 \) + mu v_0 & gt.eq g thin cal(L) \( w \, mu \) \,\
cal(F)_(2 w) \( a_0 \, u \) + \( beta + lambda + 2 mu \) u & gt.eq a_0 thin cal(L) \( 2 w \, beta + lambda + 2 mu \) . $
  These remain true when $g = 0$ or $a_0 = 0$. Using the first two inequalities in Equation (10.7) now gives
  $ cal(F)_w \( g \, v_0 \) + cal(F)_(2 w) \( a_0 \, u \) + lambda \( 2 g + 3 a_0 + u \) +
    mu \( g + v_0 + 2 a_0 + 2 u \) gt.eq I . $
  The two budgets and the third inequality in Equation (10.7) yield Equation (10.5).
  #strong[Exact verification.] We verify Equation (10.7) with three explicit choices.
    The function $D$ is decreasing, and, for $h > 0$,
  #[#set math.equation(numbering: n => "(10.8)")
   $ cal(L) \( t \, h \) gt.eq t - D \( h \) . $ <eq:L-linear-bound>]
  This follows by dropping the positive term $2^(- h)$ from $2^(cal(L) \( t \, h \)) = 2^t \( 1 - 2^(- h) \) +
    2^(- h)$. Only one numerical estimate for $D$ is needed:
  #[#set math.equation(numbering: n => "(10.9)")
   $ D \( 21 \/ 10 \) < 2 \/ 5 . $ <eq:D-uniform-bound>]
  Indeed, if $v = 2^(- 1 \/ 10)$, then $v < 14 \/ 15$ because $15^10 < 2 dot.op 14^10$. Thus
  $ 2^(- 21 \/ 10) + 2^(- 2 \/ 5) = v / 4 + v^4 < 7 / 30 + (14 / 15)^4 = 100457 / 101250 < 1 \, $
  which is equivalent to Equation (10.9).
  We will use the support bounds
  #[#set math.equation(numbering: n => "(10.10)")
   $ 2 c^(*) \( w \) gt.eq max {2 - w \, med 3 / 2 - w / 2 \, med 23 / 24 - w / 6 \, med
     frac(2, w + 2)} . $ <eq:dual-support-lines>]
  The first three follow by testing $q = 1 \/ 2 \, 1 \/ 4 \, 1 \/ 12$ in the definition of $c^(*)$.
    The first two values are $c \( 1 \/ 2 \) = 1$ and $c \( 1 \/ 4 \) = 3 \/ 4$.
    At $q = 1 \/ 12$, the argument of $z$ is $1 \/ 5$, the square root in its definition is $3 \/ 5$,
    and $c \( 1 \/ 12 \) = 1 - \( 5 \/ 6 \) \( 5 \/ 8 \) = 23 \/ 48$.
    For the last bound, when $0 lt.eq q lt.eq 1 \/ 4$, put
  $ r = frac(2 sqrt(q \( 1 - 3 q \)), 1 - 2 q) . $
  Then
  $ r^2 - 4 q = frac(4 q^2 \( 1 - 4 q \), \( 1 - 2 q \)^2) gt.eq 0 . $
  The expression $\( r + 2 q \) \/ \( 1 + r \)$ increases in $r$, so
  $ c \( q \) = frac(r + 2 q, 1 + r) gt.eq frac(2 sqrt(q) + 2 q, 1 + 2 sqrt(q)) gt.eq 2 sqrt(q) - 2 q . $
  The difference in the last inequality is $4 q sqrt(q) \/ \( 1 + 2 sqrt(q) \)$.
    Testing $q = \( w + 2 \)^(- 2) lt.eq 1 \/ 4$ now gives
  $ 2 c^(*) \( w \) gt.eq 2 #scale(x: 120%, y: 120%)[\(] c \( q \) - w q #scale(x: 120%, y: 120%)[\)] gt.eq
    2 (frac(2, w + 2) - frac(w + 2, \( w + 2 \)^2)) = frac(2, w + 2) \, $
  including at $w = 0$.
  One global estimate handles the middle range:
  #[#set math.equation(numbering: n => "(10.11)")
   $ cal(L) \( w \, 1 \/ 4 \) > frac(w - 1, 2) wide \( w gt.eq 0 \) . $ <eq:L-quarter-bound>]
  To prove it, let $b = 2^(- 1 \/ 4)$. The integer inequality $20^4 < 2 dot.op 17^4$ gives $1 \/ 2 < b < 17 \/
    20$. Since $b \( 1 - b \)$ decreases for $b gt.eq 1 \/ 2$,
  $ b \( 1 - b \) > 17 / 20 3 / 20 = 51 / 400 > 1 / 8 . $
  Consequently the arithmetic–geometric mean inequality gives
  $ 2^(cal(L) \( w \, 1 \/ 4 \)) = b + \( 1 - b \) 2^w gt.eq 2 sqrt(b \( 1 - b \) 2^w) > 2^(\( w - 1 \) \/ 2) \, $
  which proves Equation (10.11).
  We use the following choices, writing $h = beta + lambda + 2 mu$:
  $ \( lambda \, mu \) =
    cases(delim: "{", (max {2 - w \, 3 / 2 - w / 2} \, 0) \, & 0 lt.eq w lt.eq 8 / 5 \,, (17 / 24 - w / 6 \, 1 /
    4) \, & 8 / 5 lt.eq w lt.eq 3 \,, \( 0 \, 3 thin 2^(- w) \) \, & w gt.eq 3 .) $
  Either choice works at a shared endpoint.
  For $0 lt.eq w lt.eq 8 \/ 5$, put $S = max { 2 - w \, 3 \/ 2 - w \/ 2 }$, so $lambda = S$ and $mu = 0$.
    Then $S gt.eq 7 \/ 10$, so $h gt.eq 21 \/ 10$ and
  $ 2 lambda + cal(L) \( w \, 0 \) = 2 S gt.eq 7 \/ 5 . $
  By Equations (10.8) and (10.9), the second multiplier expression exceeds
  $ 3 S + 2 w - 2 / 5 = max {28 / 5 - w \, 41 / 10 + w / 2} gt.eq 23 / 5 . $
  For the last inequality, use the first term when $w lt.eq 1$ and the second when $w gt.eq 1$.
    The choices are nonnegative, and the third multiplier inequality, in the equivalent form $lambda + mu lt.eq
    2 c^(*) \( w \)$, follows directly from Equation (10.10).
  For $8 \/ 5 lt.eq w lt.eq 3$, take $lambda = 17 \/ 24 - w \/ 6$ and $mu = 1 \/ 4$. These are nonnegative, and
  $ h gt.eq 7 / 5 + 5 / 24 + 1 / 2 = 253 / 120 > 21 / 10 . $
  By Equation (10.11), the first multiplier expression exceeds
  $ 2 lambda + mu + frac(w - 1, 2) = 7 / 6 + w / 6 gt.eq 43 / 30 > 7 / 5 . $
  By Equations (10.8) and (10.9), the second expression exceeds
  $ 3 lambda + 2 mu + 2 w - 2 / 5 = 89 / 40 + 3 / 2 w gt.eq 37 / 8 > 23 / 5 . $
  Finally, $lambda + mu = 23 \/ 24 - w \/ 6$, so Equation (10.10) gives the third inequality.
  For $w gt.eq 3$, take $lambda = 0$ and $mu = 3 thin 2^(- w)$, which are nonnegative. The elementary bound
  $ log 2 = 2 integral_0^(1 \/ 3) frac(d t, 1 - t^2) > 2 / 3 $
  and $2^mu - 1 gt.eq mu log 2$ give
  $ 2^(mu + cal(L) \( w \, mu \)) = 1 + 2^w \( 2^mu - 1 \) gt.eq 1 + 3 log 2 > 3 > 2^(7 \/ 5) . $
  The last inequality follows from $3^5 > 2^7$. This proves the first multiplier inequality.
    Here $h gt.eq beta > 1$, so $D \( h \) < D \( 1 \) = 1$. Equation (10.8) therefore shows that the second
    expression is greater than
  $ 2 w - 1 gt.eq 5 > 23 / 5 . $
  For the third inequality, $3 thin 2^(- 3) = 3 \/ 8 < 2 \/ 5$, and $2^w \/ \( w + 2 \)$ increases for $w gt.eq
    3$, since its logarithmic derivative is
  $ log 2 - frac(1, w + 2) > 2 / 3 - 1 / 5 > 0 . $
  It follows that $mu lt.eq 2 \/ \( w + 2 \) lt.eq 2 c^(*) \( w \)$ by Equation (10.10).
    This verifies Equation (10.7) for every $w gt.eq 0$, and hence proves Equation (10.4). ◻
]

== 11 Paths of principal minors <sec:minor-paths>

We prove the potential moment bound by following paths of nonsingular principal minors.
  A tail estimate first controls the layers of large height.
  On a short terminal window, either the potential is small at some node,
  or a definite decrease of a second statistic forces many steps that each have small conditional probability.

For a nonsingular matrix $B$ and an integer $s gt.eq 0$, define

$ W_s \( B \) = sum_(p \, e) \( k_B \( p \, e \) - s \)_(+) nu_p \, wide x_(+) = max { x \, 0 } . $

In the layer diagram of Figure 1, the factor $\( k_B \( p \, e \) - s \)_(+)$ counts the boxes in row $e$ beyond
  the first $s$ columns; the sum weights them by $nu_p$. When a tail occurs together with a nonsingularity
  requirement, set $W_s \( B \) = 0$ on singular matrices. The order bound in Equation (2.3) gives $0 lt.eq
  W_s \( B \) lt.eq 1 \/ 2$. For $s gt.eq 1$, we also have

#[#set math.equation(numbering: n => "(11.1)")
 $ W_(s - 1) \( B \) - W_s \( B \) = sum_(p \, e\
k_B \( p \, e \) gt.eq s) nu_p . $ <eq:path-tail-difference>]

#thm([Lemma 11.1.])[
  (Tail recursion).  #emph[Let $C arrow.r B$ be a transition of width $h in { 1 \,
    2 }$ between nonsingular matrices. In the $i$-th successive quotient of $G_C$,
    write $k_(i - 1) \( p \, e \)$ for the height before that quotient and $cal(R)_i$ for its retained layers.
    For every integer $s gt.eq h$,
#[#set math.equation(numbering: n => "(11.2)")
 $ W_s \( B \) lt.eq W_(s + h) \( C \) + 2 sum_(i = 1)^h sum_(\( p \, e \) in cal(R)_i\
k_(i - 1) \( p \, e \) gt.eq s + 1 - h) nu_p . $ <eq:path-tail-recursion>]

]
] <lem:tail-recursion>

#proof[
  Fix a prime $p$, and put $F_D \( p \, t \) = sum_(e = 1)^t k_D \( p \, e \)$ for $D = C \, B$.
    Take $t$ to be the largest $e$ for which $k_B \( p \, e \) > s$, or take $t = 0$ when there is no such $e$. Then
  $ sum_(e gt.eq 1) \( k_B \( p \, e \) - s \)_(+) = F_B \( p \, t \) - s t . $
  For $e lt.eq t$, the height in $G_B$ is at least $s + 1$.
    The final successive quotient of $G_C$ is also obtained from $G_B$ by $h$ one-element quotients.
    The interlacing of heights under each such quotient therefore gives
  $ k_(i - 1) \( p \, e \) gt.eq k_B \( p \, e \) - h gt.eq s + 1 - h gt.eq
    1 wide \( e lt.eq t \, med 1 lt.eq i lt.eq h \) . $
  Let $u_i \( p \, t \)$ be the total drop in the first $t$ layers at the $i$-th quotient and put $U_p \( t \) =
    sum_i u_i \( p \, t \)$. Each layer in this range has positive starting height,
    and each of its drops is zero or one. Thus
  $ h t - U_p \( t \) = sum_(i = 1)^h \# { e lt.eq t : \( p \, e \) in cal(R)_i } . $
  All the layers on the right have the height lower bound just displayed. Lemma 30 now yields
  $ F_B \( p \, t \) - s t & lt.eq F_C \( p \, t \) - \( s + h \) t + 2 #scale(x: 120%, y: 120%)[\(] h t -
    U_p \( t \) #scale(x: 120%, y: 120%)[\)]\
 & lt.eq sum_(e gt.eq 1) \( k_C \( p \, e \) - s - h \)_(+) + 2 sum_(i = 1)^h \# { e : \( p \, e \) in cal(R)_i \,
   med k_(i - 1) \( p \, e \) gt.eq s + 1 - h } . $
  Multiplying by $nu_p$ and summing over $p$ proves the claim. ◻
]

Recall the scales $R = ceil.l ell^2 ceil.r$ and $sigma = R^(- 6)$ used in Proposition 35.
  The next estimate applies without a typicality hypothesis.

#thm([Lemma 11.2.])[
  (Cost of heavy retained layers).  #emph[Let $cal(F)$ denote exposed information which fixes a nonsingular binary
    matrix $C$ of size $m in cal(I)_N$ and a quotient map $pi :
    bb(Z)^m arrow.r.twohead H$ with $C bb(Z)^m subset.eq ker pi$.
    Suppose that, conditionally on $cal(F)$, a tested column $v$ is uniform on ${ 0 \, 1 }^m$.
    If $cal(R)$ is the set of layers retained on quotienting $H$ by $pi \( v \)$, put
$ Q = sum_(\( p \, e \) in cal(R)\
k_H \( p \, e \) gt.eq R - 1) k_H \( p \, e \) nu_p . $

 Fix $0 < eta < 1$ and set $q_0 = eta \/ \( 100 log N \)$.
   Uniformly for $q_0 lt.eq q lt.eq 1 \/ 2$, and for all sufficiently large $N$ depending on $eta$,
#[#set math.equation(numbering: n => "(11.3)")
 $ Pr { Q in \[ q \, 2 q \) divides cal(F) } lt.eq 2^(- 3 q N \/ 5) . $ <eq:path-heavy-retention>]

 The exposed information may include the preceding column of a width-two transition,
   provided the tested column remains conditionally uniform.]
] <lem:heavy-retention-cost>

#proof[
  Conditioning on $cal(F)$ fixes the quotient map and $H$; it leaves $v$ uniform on ${ 0 \, 1 }^m$.
    For a fixed mask $E$ of layers required to be retained, Lemma 29 supplies the necessary condition
  $ v in K_E \, wide C bb(Z)^m subset.eq K_E subset.eq bb(Z)^m \, wide \[ bb(Z)^m : K_E \] = N^(q \( E \) N) \,
    wide q \( E \) = sum_(\( p \, e \) in E) k_H \( p \, e \) nu_p . $
  We first show that this condition costs at least $2 q \( E \) N \/ 3$ bits of probability.
  Write $g_1 \, dots.h \, g_m$ for the images of the coordinate vectors in $bb(Z)^m \/ K_E$.
    Choose a maximal subset $g_(i_1) \, dots.h \, g_(i_j)$ that is dissociated,
    meaning that all of its subset sums are distinct. After the other bits of $v$ are fixed,
    at most one choice of the $j$ selected bits can give any prescribed group element.
    Hence every atom of the image of $v$, in particular the zero atom, has probability at most $2^(- j)$.
  Maximality also implies that every $g_a$ is a combination of the selected elements with coefficients in ${ 0 \,
    1 \, - 1 }$: otherwise adjoining $g_a$ would preserve distinctness of subset sums.
    Choose such representations, using the identity representations at the selected indices,
    and arrange their coefficients as the columns of a matrix $M in bb(Z)^(j times m)$. This matrix has rank $j$.
    The selected elements generate $bb(Z)^m \/ K_E$, so they define a surjection $theta : bb(Z)^j arrow.r
    bb(Z)^m \/ K_E$. Every column of $M C$ belongs to $ker theta$, because the columns of $C$ belong to $K_E$.
    Since $C$ is nonsingular, $M C$ still has rank $j$. Choose $j$ independent columns of $M C$.
    Each of their entries has absolute value at most $m lt.eq N$.
    Their lattice is contained in $ker theta$, and Hadamard’s inequality gives
  $ \| bb(Z)^m \/ K_E \| = \[ bb(Z)^j : ker theta \] lt.eq \( N sqrt(j) \)^j lt.eq N^(3 j \/ 2) . $
  For $j = 0$, the group is trivial and the same conclusion has its usual empty-product meaning. It follows that
  #[#set math.equation(numbering: n => "(11.4)")
   $ Pr { v in K_E divides cal(F) } lt.eq 2^(- j) lt.eq 2^(- 2 q \( E \) N \/ 3) . $ <eq:path-fixed-mask>]
  We next bound the number of possible masks consisting of all retained layers of height at least $R - 1$,
    when their value of $Q$ lies in $\[ q \, 2 q \)$. At a fixed prime the retained layers on each plateau form a
    prefix. Let $d_p$ be the number of plateaus of $H$ at $p$. Their distinct positive heights imply
  $ d_p^2 lt.eq 2 sum_e k_H \( p \, e \) . $
  Moreover, $sum_(p \, e) k_H \( p \, e \) lt.eq log_2 \| H \| = O \( N log N \)$.
    There are at most $N^(1 \/ 2)$ primes $p lt.eq N^(1 \/ 2)$, so Cauchy–Schwarz bounds the number of their plateaus by
  $ sum_(p lt.eq N^(1 \/ 2)) d_p = O #scale(x: 120%, y: 120%)[\(] N^(3 \/ 4) \( log N \)^(1 \/ 2)
    #scale(x: 120%, y: 120%)[\)] . $
  Each prefix length has $O \( N log N \)$ possible values and costs $O \( log N \)$ bits.
    The full cost for these primes is consequently
  $ O #scale(x: 120%, y: 120%)[\(] N^(3 \/ 4) \( log N \)^(3 \/ 2) #scale(x: 120%, y: 120%)[\)] =
    o \( N \/ log N \) = o_eta \( q N \) . $
  Here the final estimate is uniform for $q gt.eq q_0$.
  For $p > N^(1 \/ 2)$, each eligible layer has, for large $N$,
  $ k_H \( p \, e \) nu_p gt.eq frac(R - 1, 2 N) gt.eq frac(R, 3 N) . $
  The total height times weight in $H$ is at most $1 \/ 2$,
    so there are at most $3 N \/ \( 2 R \)$ eligible layers in this range.
    A mask with $Q < 2 q$ selects at most $6 q N \/ R$ of them.
    The usual binomial estimate, using the bound $2^a$ for all subsets when the permitted number is a fixed
    fraction of the $a$ available layers, gives a logarithmic count of at most
  $ O
    (frac(q N, R) #scale(x: 120%, y: 120%)[\(] 1 + log \( 1 \/ q \) #scale(x: 120%, y: 120%)[\)]) = o_eta \( q N \) . $
  Indeed $q N \/ R gt.eq eta N \/ \( 100 R log N \) arrow.r oo$, so integer rounding does not affect this estimate, and
  $ 1 + log \( 1 \/ q \) lt.eq 1 + log \( 100 log N \/ eta \) = O_eta \( ell \) \, wide R asymp ell^2 . $
  Combining the two prime ranges, the mask entropy is $o_eta \( q N \)$ uniformly in the indicated interval.
    For every mask being counted, $q \( E \) = Q gt.eq q$. The union bound with Equation (11.4) is therefore
  $ Pr { Q in \[ q \, 2 q \) divides cal(F) } lt.eq 2^(- \( 2 \/ 3 - o_eta \( 1 \) \) q N) lt.eq 2^(- 3 q N \/ 5) . $
  The conditioning argument uses only that $cal(F)$ fixes $C \, pi$ and leaves $v$ uniform,
    so it also applies when $cal(F)$ includes a preceding column. ◻
]

#proof[
  Fix $0 < epsilon.alt < 1 \/ 10$, and put
  $ epsilon.alt' = epsilon.alt \/ 20 \, wide J_(*) = 2 ceil.l N^(3 \/ 5) ceil.r \, wide L_(*) = ceil.l R^12 ceil.r . $
  Here $J_(*)$ is the length of the long path, and $L_(*)$ is the length of its terminal window.
    The following comparisons will be used throughout:
  #[#set math.equation(numbering: n => "(11.5)")
   $ 2 J_(*) + 1 < N^(7 \/ 10) \, wide L_(*) asymp ell^24 = o \( N^(3 \/ 5) \) \, wide J_(*) -
     L_(*) > ceil.l N^(3 \/ 5) ceil.r \,\
L_(*) ell^(- 60) = O \( ell^(- 36) \) = o \( 1 \) \, wide frac(L_(*) sigma, R^3) asymp R^3 arrow.r oo \, wide
  frac(N sigma, log R) = frac(N, R^6 log R) arrow.r oo . $ <eq:path-scales>]
  They hold for all sufficiently large $N$, since $R asymp ell^2$ and every fixed power of $ell$ is $o \( N^a \)$
    for every fixed $a > 0$. The first line keeps every node in $cal(I)_N$ and leaves enough preceding steps to
    drive the tail threshold past $N^(3 \/ 5)$. The second line keeps the potential-step error small over the
    terminal window, makes the accumulated costly-step exponent diverge,
    and makes that cost dominate the entropy of choosing the costly positions.
  For $m in cal(I)_N$, let $cal(T)_m$ be the set of nonsingular matrices satisfying the estimates in
    Propositions 20 and 35, and those in Propositions 7 and 27 at precision $A = 60$,
    including both widths in the latter proposition. These finitely many properties can be chosen so that,
    for some $f \( N \) arrow.r oo$,
  $ Pr { det upright(bold(B))_m eq.not 0 \, med upright(bold(B))_m in.not cal(T)_m } lt.eq
    2^(- N f \( N \)) wide \( m in cal(I)_N \) . $
  Write $m_(*) = N - 1$. Consider all principal submatrices of $upright(bold(B))_(m_(*))$ obtained by deleting at
    most $2 J_(*)$ indices. Their sizes lie in $cal(I)_N$ by Equation (11.5), and their number is at most
  $ sum_(d lt.eq 2 J_(*)) binom(m_(*), d) lt.eq 2^(O \( N^(3 \/ 5) log N \)) = 2^(o \( N \)) . $
  Let $cal(E)_N$ be the event that any nonsingular one of these submatrices fails its typical properties.
    Each fixed submatrix is a binary matrix, so the union bound gives
  #[#set math.equation(numbering: n => "(11.6)")
   $ Pr \( cal(E)_N \) lt.eq 2^(- N \( f \( N \) - O \( N^(- 2 \/ 5) log N \) \)) =
     2^(- omega \( N \)) . $ <eq:path-typical-exception>]
  Since $2^(N Psi) lt.eq 2^N$, its contribution to the moment is at most
  $ 2^N Pr \( cal(E)_N \) lt.eq 2^(- N \( f \( N \) - 1 - O \( N^(- 2 \/ 5) log N \) \)) = 2^(- omega \( N \)) . $
  Starting from a nonsingular realization on $\[ m_(*) \]$, apply Lemma 26 backwards for exactly $J_(*)$ steps.
    It gives a path of nonsingular principal minors, each deletion having width one or two,
    and every deletion of width two satisfying the gate when read as a forward transition.
    At most $2 J_(*)$ indices are deleted, so all these operations stay in the prescribed size range.
    On $cal(E)_N^c$, all of their nodes also belong to their respective sets $cal(T)_m$.
  For clarity, the path just obtained is chosen backwards as a function of the realized terminal matrix.
    We use it only to cover the terminal event by path events.
    Let $Pi_N$ be the collection of all #emph[fixed] index paths
  $ I_0 subset I_1 subset dots.h.c subset I_(J_(*)) = \[ m_(*) \] \, wide h_t = \| I_t \\ I_(t - 1) \| in { 1 \, 2 } . $
  An ordering of the two indices in a pair is fixed once for each path.
    At each backward step there are at most $2 N^2$ choices, whence
  $ \| Pi_N \| lt.eq \( 2 N^2 \)^(J_(*)) = 2^(O \( N^(3 \/ 5) log N \)) = 2^(o \( N \)) . $
  For a fixed $pi in Pi_N$, put $B_t = upright(bold(B))_(m_(*)) \[ I_t \]$.
    Let $Gamma_t$ be the event $cal(G)_(h_t)$ from Equation (7.2) for step $t$. Define
  $ cal(A)_pi = ⋂_(t = 0)^(J_(*)) { B_t in cal(T)_(\| I_t \|) } med ∩ med ⋂_(t = 1)^(J_(*)) Gamma_t . $
  The backward construction shows that every nonsingular terminal matrix outside $cal(E)_N$ lies in at least one
    $cal(A)_pi$. Consequently
  #[#set math.equation(numbering: n => "(11.7)")
   $ bb(E) #h(-0.16667em)
     [upright(bold(1))_({ det upright(bold(B))_(m_(*)) eq.not 0 }) thin 2^(N Psi \( upright(bold(B))_(m_(*)) \))]
     lt.eq 2^N Pr \( cal(E)_N \) + sum_(pi in Pi_N) bb(E) #h(-0.16667em)
     [upright(bold(1))_(cal(A)_pi) 2^(N Psi \( B_(J_(*)) \))] . $ <eq:path-cover>]
  We now bound a summand for a fixed $pi$. Expose the entries of $B_0$ first and then expose each transition
    forwards. Conditional on the entries already exposed, its cross columns are independent uniform bit vectors on
    the starting indices, and its new symmetric block consists of independent bits.
    Within a pair the second cross column is still uniform after the first is exposed.
    We sum over fixed paths before making any of these exposures;
    we never condition this forward process on the backward choice of a path.
    The future nonsingularity, typicality, and gate requirements are imposed only through indicators.
  Call the last $L_(*)$ steps and their $L_(*) + 1$ nodes the terminal window.
    We will prove the three weighted bounds in Table 1.
  #figure(
    [#[
  #set par(justify: false)
#table(
  columns: 2,
  inset: 4pt,
  table.header(table.cell(rowspan: 1, colspan: 1)[Covered event
], table.cell(rowspan: 1, colspan: 1)[Terminal weighted contribution
]),
  table.cell(rowspan: 1, colspan: 1)[Some window node has $W_R > epsilon.alt'$
], table.cell(rowspan: 1, colspan: 1)[$2^(N - Omega_epsilon.alt \( N R \))$
],
  table.cell(rowspan: 1, colspan: 1)[Some window node has $Psi lt.eq epsilon.alt$
], table.cell(rowspan: 1, colspan: 1)[$\( L_(*) + 1 \) 2^(N \( epsilon.alt + L_(*) ell^(- 60) \))$
],
  table.cell(rowspan: 1, colspan: 1)[Every window node has $W_R lt.eq epsilon.alt'$ and $Psi > epsilon.alt$
], table.cell(rowspan: 1, colspan: 1)[$2^(N - Omega_epsilon.alt \( N R^3 \))$
],
)
]],
    caption: [Table 2: Bounds to prove for a cover of the terminal weighted contribution of one fixed path. Each row includes the indicator of $cal(A)_pi$, the indicator of its displayed event, and the weight $2^(N Psi \( B_(J_(*)) \))$. The first two events may overlap. ],
  )
  ===== 11.1 Large tails in the window. <large-tails-in-the-window.>
  At each cross column of the fixed path, form $Q$ as in Lemma 38 using the quotient immediately before that column. Put
  $ q_min = frac(epsilon.alt', 100 log N) \, wide tilde(Q) =
    cases(delim: "{", Q \, & Q gt.eq q_min \,, 0 \, & Q < q_min .) $
  For an unconditional exposure on which the starting matrix $C$ of a step is singular, define $tilde(Q) =
    0$ for its cross columns. This convention permits estimates on the entire probability space.
    For a nonsingular start, $Q lt.eq 1 \/ 2$ by the group order bound.
    Apply Lemma 38 with $eta = epsilon.alt'$ to the dyadic values $q_j = 2^j q_min$ up to $1 \/ 2$.
    Conditional on everything exposed before a cross column,
  $ bb(E) #h(-0.16667em) [2^(N tilde(Q) \/ 4) divides upright("previous exposures")] & lt.eq 1 +
    sum_(j : q_j lt.eq 1 \/ 2) 2^(N q_j \/ 2) thin 2^(- 3 N q_j \/ 5)\
 & lt.eq 1 + sum_(j : q_j lt.eq 1 \/ 2) 2^(- N q_j \/ 10) lt.eq 1 + delta_N \, wide delta_N =
   2^(- epsilon.alt' N \/ \( 2000 log N \)) . $
  The last inequality holds for large $N$, since $N q_min arrow.r oo$;
    the dyadic sum is at most twice its first term and is then bounded by the displayed $delta_N$.
    It holds also for a singular start by the convention above.
    There are $d_pi = sum_t h_t lt.eq 2 J_(*) = O \( N^(3 \/ 5) \)$ cross columns.
    Successive conditioning, including between the two columns of a pair, therefore gives the multiplicative bound
  #[#set math.equation(numbering: n => "(11.8)")
   $ bb(E) thin 2^(\( N \/ 4 \) sum_(a = 1)^(d_pi) tilde(Q)_a) lt.eq \( 1 + delta_N \)^(d_pi) lt.eq
     exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(] O \( N^(3 \/ 5) delta_N \) #scale(x: 120%, y: 120%)[\)] = 1 +
     o \( 1 \) . $ <eq:path-heavy-moment>]
  In particular the accumulated error in its logarithm is
    $O \( N^(3 \/ 5) 2^(- epsilon.alt' N \/ \( 2000 log N \)) \) = o \( 1 \)$.
  On $cal(A)_pi$, suppose $W_R \( B_t \) > epsilon.alt'$ at a node $J_(*) - L_(*) lt.eq t lt.eq J_(*)$.
    Starting at this node, iterate Lemma 37 backwards, increasing $s$ by the width at every step.
    Stop as soon as $s > N^(3 \/ 5)$. This takes at most $ceil.l N^(3 \/ 5) ceil.r$ steps,
    so the available preceding path is long enough by Equation (11.5).
    Every invocation has $s gt.eq R gt.eq 2$, as required. At the last node the tail is zero: Proposition 20 gives
  $ k_B \( p \, e \) lt.eq k_B \( p \, 1 \) = "corank"_(bb(F)_p) \( B med mod med p \) lt.eq N^(3 \/ 5) $
  at every typical nonsingular node and every prime $p$.
  Number the backwards steps from the chosen node by $j = 1 \, 2 \, dots.h \, r$.
    Before step $j$, the current value of $s$ is $R$ plus the widths of its $j - 1$ predecessors.
    If the current width is $h lt.eq 2$, each charged layer in Equation (11.2) thus has height at least
  $ s + 1 - h gt.eq R + j - 2 . $
  The charge from one quotient at this step is bounded by $2 Q \/ \( R + j - 2 \)$,
    because $Q$ includes height times weight for all retained layers of height at least $R - 1$.
    There are at most two quotients per step. The terms with $Q < q_min$ contribute at most
  $ 4 q_min sum_(j = 1)^r frac(1, R + j - 2) lt.eq 4 q_min \( 1 + log N \) lt.eq epsilon.alt' \/ 2 $
  for large $N$. Here $r lt.eq ceil.l N^(3 \/ 5) ceil.r$ and the last comparison follows from the definition of
    $q_min$. The remaining charges must therefore exceed $epsilon.alt' \/ 2$.
    Since every denominator is at least $R - 1$, this implies
  $ sum_(a = 1)^(d_pi) tilde(Q)_a gt.eq frac(epsilon.alt' \( R - 1 \), 4) . $
  The same condition on the sum over the whole path is necessary if any node of the window has $W_R >
    epsilon.alt'$. By Markov’s inequality and Equation (11.8),
  #[#set math.equation(numbering: n => "(11.9)")
   $ & Pr #h(-0.16667em) (cal(A)_pi \, med max_(J_(*) - L_(*) lt.eq t lt.eq J_(*)) W_R \( B_t \) > epsilon.alt')\
 & wide lt.eq 2^(- epsilon.alt' N \( R - 1 \) \/ 16) thin exp #h(-0.16667em) #scale(x: 120%, y: 120%)[\(]
   O \( N^(3 \/ 5) delta_N \) #scale(x: 120%, y: 120%)[\)] = 2^(- Omega_epsilon.alt \( N R \)) =
   2^(- omega \( N \)) . $ <eq:path-large-tail>]
  Multiplication by the terminal weight, which is at most $2^N$, still gives $2^(- omega \( N \))$,
    because $R arrow.r oo$.
  ===== 11.2 A small potential in the window. <a-small-potential-in-the-window.>
  Proposition 27 at precision $60$ states, for either width and for a starting matrix $C in cal(T)_m$,
  $ bb(E) #h(-0.16667em)
    [upright(bold(1))_({ det B eq.not 0 }) upright(bold(1))_Gamma thin 2^(N Psi \( B \)) divides C] lt.eq
    2^(N \( Psi \( C \) + ell^(- 60) \)) \, $
  where $Gamma$ is the gate for width two and the certain event for width one.
    Adding a typicality indicator at the endpoint only decreases the left side.
    Successive conditioning from a node $t$ to the terminal node consequently bounds the conditional weighted
    expectation with all the intervening requirements by
  $ 2^(N Psi \( B_t \)) thin 2^(N \( J_(*) - t \) ell^(- 60)) $
  whenever $B_t in cal(T)_(\| I_t \|)$. This is an application to the fixed forward exposure,
    with no conditioning on future requirements. For each $t$ in the window, on $Psi \( B_t \) lt.eq
    epsilon.alt$ it is at most $2^(N \( epsilon.alt + L_(*) ell^(- 60) \))$.
    Dropping all requirements before $t$ and summing over its $L_(*) + 1$ possible values gives
  #[#set math.equation(numbering: n => "(11.10)")
   $ bb(E) #h(-0.16667em)
     [upright(bold(1))_(cal(A)_pi) upright(bold(1))_({ min_(J_(*) - L_(*) lt.eq t lt.eq J_(*)) Psi \( B_t \) lt.eq
     epsilon.alt }) 2^(N Psi \( B_(J_(*)) \))] & lt.eq \( L_(*) + 1 \) thin 2^(N \( epsilon.alt + L_(*) ell^(- 60) \))\
 & = 2^(N \( epsilon.alt + O \( ell^(- 36) \) + O \( log R \/ N \) \)) . $ <eq:path-low-window>]
  This records both the accumulated transition error and the cost of choosing the node.
  ===== 11.3 The remaining window event. <the-remaining-window-event.>
  Consider the event
  $ cal(H)_pi = cal(A)_pi ∩ {max_(J_(*) - L_(*) lt.eq t lt.eq J_(*)) W_R \( B_t \) lt.eq
    epsilon.alt'} ∩ {min_(J_(*) - L_(*) lt.eq t lt.eq J_(*)) Psi \( B_t \) > epsilon.alt} . $
  At any node $B$ of this event, $phi.alt \( k \) lt.eq 2 k$ and $phi.alt \( 0 \) = phi.alt \( 1 \) =
    0$ show that $sum_(k_B gt.eq 2) k_B nu_p gt.eq epsilon.alt \/ 2$. On the other hand,
  $ sum_(p \, e\
k_B \( p \, e \) > 2 R) k_B \( p \, e \) nu_p lt.eq 2 W_R \( B \) lt.eq 2 epsilon.alt' . $
  Dividing the contribution from $2 lt.eq k_B lt.eq 2 R$ by $2 R$ gives
  #[#set math.equation(numbering: n => "(11.11)")
   $ sum_(p \, e\
k_B \( p \, e \) gt.eq 2) nu_p gt.eq frac(epsilon.alt \/ 2 - 2 epsilon.alt', 2 R) gt.eq
  frac(epsilon.alt, 10 R) . $ <eq:path-window-two>]
  If in addition $Psi \( B \) > 1 - 1 \/ R$, the contribution to $Psi \( B \)$ from height two is at most $beta \/
    4 = 7 \/ 20$. Indeed, $2 sum_(k_B = 2) nu_p lt.eq 1 \/ 2$ by the order bound. Thus
  $ 2 sum_(p \, e\
k_B \( p \, e \) gt.eq 3) k_B \( p \, e \) nu_p = Psi \( B \) - beta sum_(p \, e\
k_B \( p \, e \) = 2) nu_p > 1 - 1 / R - beta / 4 . $
  For large $N$ the height times weight on the left after division by two is at least $1 \/ 4$.
    Since $epsilon.alt' < 1 \/ 200$, deleting the layers above $2 R$ and dividing by $2 R$ yields
  #[#set math.equation(numbering: n => "(11.12)")
   $ sum_(p \, e\
k_B \( p \, e \) gt.eq 3) nu_p gt.eq frac(1 \/ 4 - 2 epsilon.alt', 2 R) gt.eq frac(1, 20 R) . $ <eq:path-window-three>]
  For each quotient at step $t$, let $V_(t \, i)$ be the sum of the weights $nu_p$ of all of its retained layers.
    On $cal(A)_pi$, call a step in the window costly if some $V_(t \, i) gt.eq sigma$,
    or if it has width two and its starting node $C = B_(t - 1)$ satisfies $Psi \( C \) lt.eq 1 - 1 \/ R$.
    To price this description without conditioning on $cal(A)_pi$, define an exposure event $D_t$ as follows:
    the starting node belongs to its set $cal(T)_m$, and either some $V_(t \, i) gt.eq sigma$,
    or the step has width two, $Psi \( C \) lt.eq 1 - 1 \/ R$, and its gate $Gamma_t$ holds.
    Every costly step of a required path satisfies $D_t$.
  Let $cal(F)_(t - 1)$ be the sigma-field generated by all entries exposed through $C$.
    Proposition 35, applied to each column and conditioned on a preceding column when needed,
    gives probability at most $2^(- N sigma \/ 2)$ for each event $V_(t \, i) gt.eq sigma$.
    For the other alternative, the two cross columns are conditionally independent and the gate requires both to
    belong to $cal(S) \( C \)$. Proposition 7 gives
  $ Pr \( Gamma_t divides cal(F)_(t - 1) \) & = (frac(\| cal(S) \( C \) \|, 2^m))^2\
 & lt.eq 2^(- 2 N \( 1 - Psi \( C \) - ell^(- 60) - \( 1 - m \/ N \) \)) . $
  Here $1 - m \/ N lt.eq N^(- 3 \/ 10)$. If $Psi \( C \) lt.eq 1 - 1 \/ R$, then $ell^(- 60) + N^(- 3 \/ 10) =
    o \( R^(- 1) \)$ and $sigma = R^(- 6) = o \( R^(- 1) \)$,
    so for large $N$ this probability is at most $2^(- N \/ R) lt.eq 2^(- N sigma \/ 2)$.
    If the start is not in $cal(T)_m$, the event $D_t$ is empty.
    The union bound therefore gives, uniformly in the revealed history,
  #[#set math.equation(numbering: n => "(11.13)")
   $ Pr \( D_t divides cal(F)_(t - 1) \) lt.eq p_N \, wide p_N = 3 thin 2^(- N sigma \/ 2) . $ <eq:path-costly-step>]
  In particular, for any fixed set $T$ of step positions, ordinary successive conditioning in the forward exposure gives
  #[#set math.equation(numbering: n => "(11.14)")
   $ Pr (⋂_(t in T) D_t) lt.eq p_N^(\| T \|) . $ <eq:path-costly-set>]
  This estimate imposes no conditioning on the other path requirements.
  ===== 11.4 Descent at noncostly steps. <descent-at-noncostly-steps.>
  To force many costly steps on $cal(H)_pi$, we combine two tails.
    At width one, the smaller $R^(- 2) W_1$ term uses the mass of layers of height at least two.
    At width two, $W_2$ uses the stronger gap between $W_2$ and $W_4$,
    while the small coefficient prevents the $W_1$ term from offsetting that gap. Define
  $ Z \( B \) = W_2 \( B \) + R^(- 2) W_1 \( B \) . $
  The order bound implies $0 lt.eq Z \( B \) lt.eq \( 1 + R^(- 2) \) \/ 2 lt.eq 1$.
    At a noncostly step all its $V_(t \, i)$ are less than $sigma$. For a step of width one, Lemma 37 gives
  $ W_2 \( B \) lt.eq W_3 \( C \) + 2 sigma lt.eq W_2 \( C \) + 2 sigma \, wide W_1 \( B \) lt.eq W_2 \( C \) +
    2 sigma . $
  Equations (11.1) and (11.11) then show
  $ Z \( B \) - Z \( C \) lt.eq 2 sigma \( 1 + R^(- 2) \) - R^(- 2) #scale(x: 120%, y: 120%)[\(] W_1 \( C \) -
    W_2 \( C \) #scale(x: 120%, y: 120%)[\)] lt.eq 2 sigma \( 1 + R^(- 2) \) - frac(epsilon.alt, 10 R^3) lt.eq -
    frac(epsilon.alt, 20 R^3) $
  for large $N$, since $sigma = R^(- 6) = o_epsilon.alt \( R^(- 3) \)$.
    At a noncostly step of width two, its starting potential is $Psi \( C \) > 1 - 1 \/ R$. Lemma 37 gives
  $ W_2 \( B \) lt.eq W_4 \( C \) + 4 sigma . $
  Also
  $ W_2 \( C \) - W_4 \( C \) = sum_(p \, e\
k_C \( p \, e \) gt.eq 3) min { k_C \( p \, e \) - 2 \, 2 } nu_p gt.eq frac(1, 20 R) $
  by Equation (11.12). Using $W_1 \( B \) lt.eq 1 \/ 2$, we obtain
  $ Z \( B \) - Z \( C \) lt.eq - frac(1, 20 R) + 4 sigma + frac(1, 2 R^2) lt.eq - frac(1, 40 R) lt.eq -
    frac(epsilon.alt, 20 R^3) $
  for all sufficiently large $N$. The middle comparison uses $4 R^(- 6) + \( 2 R^2 \)^(- 1) = o \( R^(- 1) \)$.
    Thus every noncostly step decreases $Z$ by at least
  $ delta = frac(epsilon.alt, 20 R^3) . $
  Let $n_(upright("cost"))$ be the number of costly steps in this window.
    A costly step can increase $Z$ by at most one. Telescoping the $L_(*)$ changes and using $0 lt.eq Z lt.eq 1$ gives
  $ - 1 lt.eq Z \( B_(J_(*)) \) - Z \( B_(J_(*) - L_(*)) \) lt.eq
    n_(upright("cost")) - \( L_(*) - n_(upright("cost")) \) delta \, wide n_(upright("cost")) gt.eq
    frac(L_(*) delta - 1, 1 + delta) . $
  Now $delta arrow.r 0$ and $L_(*) delta asymp_epsilon.alt R^9 arrow.r oo$. Consequently, for large $N$,
  $ n_(upright("cost")) gt.eq frac(L_(*) epsilon.alt, 100 R^3) . $
  Set $t_(*) = ceil.l L_(*) epsilon.alt \/ \( 100 R^3 \) ceil.r$.
    The event $cal(H)_pi$ therefore implies $D_t$ at at least $t_(*)$ positions in the window.
    Equations (11.13) and (11.14) yield
  $ Pr \( cal(H)_pi \) lt.eq binom(L_(*), t_(*)) p_N^(t_(*)) . $
  The entropy of choosing these positions satisfies
  $ log_2 binom(L_(*), t_(*)) lt.eq t_(*) log_2 \( e L_(*) \/ t_(*) \) = O_epsilon.alt \( t_(*) log R \) . $
  Together with the factor $3^(t_(*))$, this is $o \( N sigma t_(*) \)$, because $N sigma \/ log R arrow.r oo$.
    In particular, for all sufficiently large $N$,
  #[#set math.equation(numbering: n => "(11.15)")
   $ Pr \( cal(H)_pi \) lt.eq 2^(- N sigma t_(*) \/ 3) lt.eq 2^(- epsilon.alt N L_(*) sigma \/ \( 300 R^3 \)) =
     2^(- Omega_epsilon.alt \( N R^3 \)) = 2^(- omega \( N \)) . $ <eq:path-high-window>]
  This bound uses $L_(*) sigma \/ R^3 asymp R^3 arrow.r oo$.
    The corresponding weighted expectation is at most $2^(N - Omega_epsilon.alt \( N R^3 \)) = 2^(- omega \( N \))$.
  Equations (11.9), (11.10), and (11.15) prove the three weighted bounds in Table 1.
    Its row events cover all outcomes in $cal(A)_pi$, so their sum gives, uniformly over all fixed index paths,
  $ bb(E) #h(-0.16667em) [upright(bold(1))_(cal(A)_pi) 2^(N Psi \( B_(J_(*)) \))] lt.eq
    2^(N \( epsilon.alt + o_epsilon.alt \( 1 \) \)) . $
  Finally use Equation (11.7). The index-path sum adds $O \( N^(3 \/ 5) log N \) = o \( N \)$ to the logarithm,
    and Equation (11.6) gives a negligible exceptional contribution even after the weight $2^N$. Hence
  $ bb(E) #h(-0.16667em)
    [upright(bold(1))_({ det upright(bold(B))_(N - 1) eq.not 0 }) thin 2^(N Psi \( upright(bold(B))_(N - 1) \))]
    lt.eq 2^(N \( epsilon.alt + o_epsilon.alt \( 1 \) \)) . $
  For each fixed $epsilon.alt$ this estimate holds for all sufficiently large $N$.
    Letting $epsilon.alt$ tend to zero after $N$ proves Proposition 8. ◻
]

#proof[
  By the implication established in Section 2, Propositions 7 and 8 give Equation (2.2):
    $bb(E) \| cal(S) \( upright(bold(B))_(N - 1) \) \| lt.eq 2^(o \( N \))$.
  Lemmas 5 and 6 now give
  $ Pr \( det upright(bold(B))_N = 0 \) lt.eq 2^(o \( N \)) N 2^(- N) bb(E) \|
    cal(S) \( upright(bold(B))_(N - 1) \) \| + 2^(- Omega \( N^(6 \/ 5) \)) lt.eq 2^(- N + o \( N \)) . $
  A specified row of $upright(bold(B))_N$ is identically zero with probability $2^(- N)$,
    so the reverse bound follows from that event. Therefore $Pr \( det upright(bold(B))_N = 0 \) =
    2^(- N + o \( N \))$. Finally Lemma 2, with $N = n - 1$, yields
  $ Pr \( det A_n = 0 \) = 2^(- \( n - 1 \) + o \( n \)) = 2^(- n + o \( n \)) = (1 / 2 + o \( 1 \))^n . $
  ◻
]

#heading(level: 1)[References]
#bibitem([1])[M. Campos, M. Jenssen, M. Michelen, and J. Sahasrabudhe,
  The singularity probability of a random symmetric matrix is exponentially small,
  #emph[Journal of the American Mathematical Society] #strong[38] (2025), no. 1, 179--224.
  #link("https://doi.org/10.1090/jams/1042").]
#bibitem([2])[M. Campos, M. Jenssen, M. Michelen, and J. Sahasrabudhe,
  The least singular value of a random symmetric matrix, #emph[Forum of Mathematics, Pi] #strong[12] (2024),
  article e3, 69 pp. #link("https://doi.org/10.1017/fmp.2023.29").]
#bibitem([3])[M. Campos, M. Jenssen, M. Michelen, and J. Sahasrabudhe,
  Singularity of random symmetric matrices revisited, #emph[Proceedings of the American Mathematical Society]
  #strong[150] (2022), no. 7, 3147--3159. #link("https://doi.org/10.1090/proc/15807").]
#bibitem([4])[M. Campos, L. Mattos, R. Morris, and N. Morrison, On the singularity of random symmetric matrices,
  #emph[Duke Mathematical Journal] #strong[170] (2021), no. 5, 881--907.
  #link("https://doi.org/10.1215/00127094-2020-0054").]
#bibitem([5])[K. P. Costello, T. Tao, and V. Vu, Random symmetric matrices are almost surely nonsingular,
  #emph[Duke Mathematical Journal] #strong[135] (2006), no. 2, 395--413.
  #link("https://doi.org/10.1215/S0012-7094-06-13527-5").]
#bibitem([6])[A. Ferber and V. Jain, Singularity of random symmetric matrices---a combinatorial approach to
  improved bounds, #emph[Forum of Mathematics, Sigma] #strong[7] (2019), article e22, 29 pp.
  #link("https://doi.org/10.1017/fms.2019.21").]
#bibitem([7])[D. R. Grayson, Reduction theory using semistability,
  #emph[Commentarii Mathematici Helvetici] #strong[59] (1984), 600--634. #link("https://doi.org/10.1007/BF02566369").]
#bibitem([8])[Y. Han, On the rank of a random symmetric matrix in the large deviation regime,
  #emph[Journal of the London Mathematical Society] #strong[113] (2026), no. 6, article e70581.
  #link("https://doi.org/10.1112/jlms.70581").]
#bibitem([9])[A. J. Hoffman and H. W. Wielandt, The variation of the spectrum of a normal matrix,
  #emph[Duke Mathematical Journal] #strong[20] (1953), no. 1, 37--39.
  #link("https://doi.org/10.1215/S0012-7094-53-02004-3").]
#bibitem([10])[V. Jain, A. Sah, and M. Sawhney, On the smallest singular value of symmetric random matrices,
  #emph[Combinatorics, Probability and Computing] #strong[31] (2022), no. 4, 662--683.
  #link("https://doi.org/10.1017/S0963548321000511").]
#bibitem([11])[J. Komlós, On the determinant of $\( 0 \, 1 \)$ matrices,
  #emph[Studia Scientiarum Mathematicarum Hungarica] #strong[2] (1967), 7--21.
  #link("https://scholarship.libraries.rutgers.edu/esploro/outputs/journalArticle/On-the-determinant-of-0-1-matrices/991031550043104646")[Rutgers
  institutional copy].]
#bibitem([12])[R. Miranda, Nondegenerate symmetric bilinear forms on finite abelian 2-groups,
  #emph[Transactions of the American Mathematical Society] #strong[284] (1984), no. 2, 535--542.
  #link("https://doi.org/10.1090/S0002-9947-1984-0743731-1").]
#bibitem([13])[H. H. Nguyen, Inverse Littlewood--Offord problems and the singularity of random symmetric matrices,
  #emph[Duke Mathematical Journal] #strong[161] (2012), no. 4, 545--586.
  #link("https://doi.org/10.1215/00127094-1548344").]
#bibitem([14])[O. Regev and N. Stephens-Davidowitz, A reverse Minkowski theorem,
  #emph[Annals of Mathematics] #strong[199] (2024), no. 1, 1--49. #link("https://doi.org/10.4007/annals.2024.199.1.1").]
#bibitem([15])[M. Talagrand, An isoperimetric theorem on the cube and the Kintchine--Kahane inequalities,
  #emph[Proceedings of the American Mathematical Society] #strong[104] (1988), no. 3, 905--909.
  #link("https://doi.org/10.1090/S0002-9939-1988-0964871-7").]
#bibitem([16])[K. Tikhomirov, Singularity of random Bernoulli matrices,
  #emph[Annals of Mathematics] #strong[191] (2020), no. 2, 593--634.
  #link("https://doi.org/10.4007/annals.2020.191.2.6").]
#bibitem([17])[R. Vershynin, Invertibility of symmetric random matrices,
  #emph[Random Structures & Algorithms] #strong[44] (2014), no. 2, 135--182.
  #link("https://doi.org/10.1002/rsa.20429").]
#bibitem([18])[E. P. Wigner, On the distribution of the roots of certain symmetric matrices,
  #emph[Annals of Mathematics] #strong[67] (1958), no. 2, 325--327. #link("https://doi.org/10.2307/1970008").]
