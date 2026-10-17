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

#align(center)[#text(size: 16pt, weight: "bold")[The sharp singularity rate for biased symmetric sign matrices]]
#align(center)[OpenAI]
#align(center)[October 4, 2026]

== 1 Introduction <sec:introduction>

Fix $p in \( 0 \, 1 \)$. Let $A_n^(\( p \))$ be the real symmetric $n times n$ matrix whose entries on and above the diagonal are independent and satisfy

$ bb(P) \( A_(i j)^(\( p \)) = 1 \) = p \, #h(2em) bb(P) \( A_(i j)^(\( p \)) = - 1 \) = 1 - p #h(2em) \( i lt.eq j \) . $

The entries below the diagonal are determined by symmetry. We study the exponential rate at which this matrix is singular.

#thm([Theorem 1.1.])[
  #emph[For every fixed $p in \( 0 \, 1 \) \\ { 1 \/ 2 }$, 
$ lim_(n arrow.r oo) bb(P) #scale(x: 120%, y: 120%)[\(] det A_n^(\( p \)) = 0 #scale(x: 120%, y: 120%)[\)]^(1 \/ n) = p^2 + \( 1 - p \)^2 . $

]
] <thm:main>

The quantity on the right is the probability that two independent signs with this bias agree. Requiring two rows of the matrix to agree gives the same exponential rate: symmetry changes only the probability of the fixed corner where those rows meet. The upper bound shows that all linear dependencies together have this rate. The assertion concerns each fixed $p$; its error term may depend on $p$.

=== 1.1 Historical context <historical-context>

The singularity problem for discrete random matrices goes back to Komlós, who proved asymptotic nonsingularity for matrices with independent uniform $0 \/ 1$ entries [13]. For independent uniform signs, Kahn, Komlós, and Szemerédi obtained an exponential upper bound [12], and Tikhomirov identified the sharp exponential rate $\( 1 \/ 2 + o \( 1 \) \)^n$ [20]. Jain, Sah, and Sawhney determined the singularity asymptotics for every fixed nonuniform finitely supported entry law [11]. In particular, their result gives the exponential rate $p^2 + \( 1 - p \)^2$ for independent biased signs. A recent preprint of Hu, Song, and Wu establishes the full asymptotic $\( 2 + o \( 1 \) \) n^2 2^(- n)$ for independent uniform signs [10]. All these models have independent rows; symmetry removes that independence.

Costello, Tao, and Vu proved asymptotic nonsingularity for symmetric Bernoulli matrices by developing quadratic Littlewood–Offord estimates [4]. Their general maximum-atom theorem also covers each fixed biased sign law. In the unbiased symmetric sign model, Nguyen obtained arbitrary polynomial decay [16], Vershynin obtained a stretched exponential bound [22], and further combinatorial progress included the work of Ferber and Jain [6]. Campos, Jenssen, Michelen, and Sahasrabudhe proved the exponential bound $exp \( - c n \)$ [3]. The companion manuscript [17] proves the sharp unbiased rate $\( 1 \/ 2 + o \( 1 \) \)^n$. The present paper establishes its fixed-bias analogue, at the level of the exponential rate.

=== 1.2 The proof and its main ingredients <the-proof-and-its-main-ingredients>

The main difficulty is to combine symmetry with the unequal probabilities of individual columns. Multiplying the whole matrix by $- 1$ allows us to assume $p < 1 \/ 2$. A prescribed column can then have probability as large as $\( 1 - p \)^(n - 1)$. That bound alone is too large for the rate in Theorem 1. We obtain two different gains: a structural exception requires two rare column extensions, and a nonexceptional singular matrix admits a deletion whose column has nearly its full Shannon entropy.

Section 2 first reduces to corank one. For a nonzero kernel vector, choose a coordinate of largest absolute value as its anchor and normalize the remaining coordinates, called its tail, to have Euclidean norm one. Tails close to sparse vectors are controlled directly at the claimed rate. For the remaining vectors, we multiply by a global sign and change coordinate signs to make the anchor row all ones. Its Schur complement is $- 2$ times a symmetric matrix with entries in ${ 0 \, 1 }$. Conditional on the anchor row, these entries are independent on and above the diagonal, their probabilities belong to ${ p \, 1 - p }$, and their mean matrix has rank at most two. Deleting a suitable coordinate gives a nonsingular principal minor $B$. The omitted column $z$ must satisfy

$ z^(sans(T)) B^(- 1) z in { 0 \, 1 } \, #h(2em) lr(bar.v.double B^(- 1) z bar.v.double)_2 lt.eq L_0 sqrt(n) $

for a fixed constant $L_0$. The coordinate is chosen so that the original sign column also has its typical number of positive entries. This use of the gap between entropy and collision probability follows the independent-entry strategy of Jain, Sah, and Sawhney [11] Section 6. Thus each compatible column has probability governed by the binary entropy of $p$. Proposition 5 is the central remaining assertion: there are few such columns except on an event with a probability close to $\( 1 - p \)^(2 n)$. Both bounds leave a strict margin beyond the required rate when $p eq.not 1 \/ 2$.

The arithmetic part follows the principal-minor and discriminant-group method of the companion paper [17]. We use its low-height subspace cover, robust lattice bounds, and deterministic pairing and minor identities; the precise statements needed are given where they enter the proof. We strengthen the companion’s cube-intersection estimate to accommodate the biased law and to obtain nearly complete loss of cube entropy, simultaneously over intermediate lattices. For a nonsingular bit matrix $B$ of size $m$ close to a reference dimension $N$, consider

$ B bb(Z)^m subset.eq K subset.eq bb(Z)^m . $

Theorem 11 shows that, outside an event of probability smaller than every fixed exponential in $N$, an index as large as $N^(tau N)$ forces every coset of $K$ to meet the cube in fewer than $2^(alpha N)$ points. Here $alpha > 0$ can be any fixed constant, and $tau$ may decrease as a fixed inverse power of $log log N$. The simultaneous conclusion permits the lattice to be chosen after the matrix has been observed.

The proof of this estimate, in Section 4, converts a large cube intersection into many effective linear tests from a dual lattice. A low-height cover, combined with a change of scale, confines those tests near a subspace of dimension strictly less than $N$. Their approximate locations can therefore be counted more cheaply than independent groups of entries can satisfy their integrality conditions. Gaussian sampling on the dual lattice makes this comparison effective for the biased distribution.

Sections 5 and 6 use the estimate in two ways. First, the finite pairing on $bb(Z)^m \/ B bb(Z)^m$ bounds the number of admissible columns when all but the two largest invariant factors of the group have small total logarithmic size. Second, paths of nonsingular principal minors control the remaining matrices. In a short terminal portion of a path, a matrix with many admissible columns forces either two rare extensions or one extension by two rare columns. Both alternatives have the required probability cost. This proves Proposition 5 and completes the reduction to Theorem 1.

== 2 From kernel vectors to possible columns <sec:reductions>

We reduce Theorem 1 to one estimate on the number of columns that can complete a nonsingular bit matrix to a singular one. We first treat kernel vectors whose coordinates away from a largest one, after normalization, are close to a vector supported on a small set. For every remaining kernel vector, we will delete a coordinate that is large enough to control the inverse matrix and whose original row has the expected proportion of positive signs. The latter condition supplies the entropy needed for the biased law.

Negating the entire matrix replaces $p$ by $1 - p$ and preserves singularity. We therefore assume throughout the proof that $0 < p < 1 \/ 2$, and set

#[#set math.equation(numbering: n => "(2.1)")
 $ b = 1 - p \, #h(2em) Q = p^2 + b^2 \, #h(2em) a = - log_2 b \, #h(2em) d_(*) = - log_2 Q \, #h(2em) h_(*) = - p log_2 p - b log_2 b . $ <eq:rate-constants>]

Two strict inequalities will be used:

#[#set math.equation(numbering: n => "(2.2)")
 $ 2 a > d_(*) \, #h(2em) h_(*) > d_(*) . $ <eq:rate-margins>]

The first follows from $b^2 < Q$. For the second, strict concavity of the logarithm gives $p log p + b log b < log \( p^2 + b^2 \)$. The use of column counts to exploit this entropy gap has precedents in independent-entry models [14] Section 2.1; the comparison itself is explicit in Jain, Sah, and Sawhney [11] Section 6. Here it will be applied to an original row selected from the kernel coordinates of a symmetric matrix. Constants may depend on $p$ and on any other parameters fixed before the dimension tends to infinity. In $O_p \( dot.op \)$, the implicit constant depends only on $p$. The logarithm $log$ is natural, unless a different base is displayed, and $\[ m \] = { 1 \, dots.h \, m }$.

=== 2.1 Corank one and tails close to sparse vectors <corank-one-and-tails-close-to-sparse-vectors>

The diagonal-flip reduction of [17] Lemma 2.4 remains valid under the biased law, with a subexponential change in probability.

#thm([Lemma 2.1.])[
  #emph[For the symmetric sign matrix $A = A_n^(\( p \))$, 
$ bb(P) \( det A = 0 \) lt.eq 2^(o \( n \)) bb(P) \( "rank" A = n - 1 \) + 2^(- Omega_p \( n^(6 \/ 5) \)) . $

]
] <lem:corank-reduction>

#proof[
  A symmetric matrix of rank $r$ has a nonsingular principal submatrix of size $r$. Indeed, write it as $X S X^(sans(T))$, where $X$ has $r$ independent columns and $S$ is nonsingular, and choose $r$ independent rows of $X$. The principal submatrix on those rows is a product of three nonsingular square matrices. For a fixed candidate principal submatrix, reveal it and its cross block. If the full matrix has the same rank, the Schur complement forces all entries in the remaining principal block. Each forced entry has conditional probability at most $b$. Consequently, with $t = ceil.l n^(3 \/ 5) ceil.r$,
  $ bb(P) \( n - "rank" A gt.eq t \) lt.eq sum_(k = t)^n binom(n, k) b^(k \( k + 1 \) \/ 2) lt.eq 2^(- Omega_p \( n^(6 \/ 5) \)) . $
  Now let $K = ker A$ have dimension $1 lt.eq k < t$. Choose a set $I$ of $k - 1$ coordinates whose restrictions to $K$ are independent linear functionals, and flip the diagonal signs on $I$. Write $D$ for the diagonal matrix of these changes. If $\( A + D \) y = 0$, then
  $ x^(sans(T)) D y = 0 #h(2em) \( x in K \) . $
  The map $x mapsto x_I$ maps $K$ onto $bb(R)^I$, and each entry of $D$ on $I$ is nonzero. Hence $y_I = 0$, and then $A y = 0$. Conversely, every vector in $K$ vanishing on $I$ is in $ker \( A + D \)$. The new kernel is exactly that one-dimensional subspace.
  Fix a choice of $I$ for each such matrix. The probability of a matrix divided by that of its image is at most $\( b \/ p \)^t$. Each image has at most
  $ sum_(j lt.eq t) binom(n, j) = 2^(O \( n^(3 \/ 5) log n \)) $
  preimages, since specifying the flipped coordinates recovers the original matrix. Both factors are $2^(o \( n \))$, proving the lemma. ◻
]

Given a nonzero kernel vector $v$, call an index $a_0$ with $\| v_(a_0) \| = max_i \| v_i \|$ an #emph[anchor]. The vector off the anchor cannot vanish, since no column of $A$ has a zero entry. We normalize it by

$ lr(bar.v.double v_(\[ n \] \\ { a_0 }) bar.v.double)_2 = 1 $

and call this normalized off-anchor vector the #emph[tail]. Every row equation $A v = 0$ gives

#[#set math.equation(numbering: n => "(2.3)")
 $ \| v_(a_0) \| lt.eq sum_(j eq.not a_0) \| v_j \| lt.eq sqrt(n - 1) . $ <eq:anchor-size>]

#thm([Lemma 2.2.])[
  (Tails close to sparse vectors).  #emph[For every $epsilon.alt > 0$, there are fixed $lambda \, delta in \( 0 \, 1 \/ 4 \)$ such that, for all sufficiently large $n$, the following event has probability at most $2^(\( - d_(*) + epsilon.alt \) n)$: the matrix $A_n^(\( p \))$ has a nonzero kernel vector whose normalized tail, for some anchor, lies within Euclidean distance $delta$ of a vector supported on at most $lambda n$ coordinates.]
] <lem:compressible>

#proof[
  Put $mu = 2 p - 1$ and $W = A - mu upright(bold(1)) upright(bold(1))^(sans(T))$. For a sufficiently large fixed $L$,
  #[#set math.equation(numbering: n => "(2.4)")
   $ bb(P) \( lr(bar.v.double W bar.v.double)_(upright("op")) > L sqrt(n) \) lt.eq 2^(- 4 n) . $ <eq:centered-norm>]
  To see this, for a fixed unit vector $x$, write $x^(sans(T)) W x$ as a sum over the independent upper-triangular entries. Its coefficients have squared sum
  $ sum_i x_i^4 + 4 sum_(i < j) x_i^2 x_j^2 lt.eq 2 . $
  Hoeffding’s inequality [8] Theorem 2 therefore gives a bound $2 exp \( - c L^2 n \)$ at a constant multiple of $L sqrt(n)$. A $1 \/ 4$-net of the unit sphere has at most $9^n$ points, and the usual quadratic-form net inequality bounds the operator norm by twice the maximum over this net. Taking $L$ large proves (2.4).
  Fix an anchor $a_0$ and a tail support $T$, with $j = \| T \| lt.eq lambda n$. If a tail is within $delta$ of a vector on $T$, its truncation to $T$ has error at most $delta$. Approximate this truncation by a $delta$-net of the unit ball in $bb(R)^T$, and approximate the anchor coefficient on $\[ - sqrt(n) \, sqrt(n) \]$ with mesh at most $delta$. The resulting vector $x$, supported on $S = T union { a_0 }$, satisfies
  $ lr(bar.v.double v - x bar.v.double)_2 lt.eq 3 delta \, #h(2em) lr(bar.v.double x_T bar.v.double)_2 gt.eq 1 - 2 delta \, #h(2em) \| x_(a_0) \| gt.eq max_(i in T) \| x_i \| - 2 delta . $
  It suffices to retain net points with these last two properties. Also approximate $sum_i v_i$ by a number $u$ with error at most $delta$. By (2.3), this sum lies in $\[ - 2 sqrt(n) \, 2 sqrt(n) \]$. For each $T$, the number of pairs $\( x \, u \)$ is at most $\( C \/ delta \)^j$ times a polynomial in $n$, with fixed parameters. The separate scalar approximation prevents the mean matrix from amplifying the error in the coordinate sum.
  On the event $lr(bar.v.double W bar.v.double)_(upright("op")) lt.eq L sqrt(n)$, the equation $A v = 0$ implies that one of these pairs satisfies
  #[#set math.equation(numbering: n => "(2.5)")
   $ lr(bar.v.double W x + mu u upright(bold(1)) bar.v.double)_2 lt.eq C_1 L delta sqrt(n) . $ <eq:net-residual>]
  We next show that every fixed pair has small probability of satisfying this inequality. There are fixed $w > 0$ and $delta_0 > 0$, depending on $p$, such that, whenever $delta < delta_0$, each row outside $S$ satisfies
  #[#set math.equation(numbering: n => "(2.6)")
   $ bb(P) #scale(x: 120%, y: 120%)[\(] \| \( W x \)_i + mu u \| lt.eq w #scale(x: 120%, y: 120%)[\)] lt.eq Q . $ <eq:two-sign-concentration>]
  All row shifts here may be arbitrary.
  Choose a small fixed coefficient threshold $u_0 > 0$. If some $\| x_j \| gt.eq u_0$, $j in T$, then $\| x_(a_0) \| gt.eq u_0 \/ 2$ when $delta$ is small enough. Condition on all signs in this row except those at $j \, a_0$. For $w < u_0 \/ 4$, the interval of length $2 w$ cannot contain two outcomes that differ in only one of these two signs. The allowed vertices of the two-bit square thus consist of at most one vertex or two opposite vertices. Their total probability is at most
  $ max { b^2 \, p^2 \, 2 p b \, p^2 + b^2 } = Q . $
  If instead every tail coefficient has absolute value below $u_0$, condition on the anchor sign and use the tail alone. Its centered sum has variance
  $ sigma_T^2 = 4 p b sum_(j in T) x_j^2 \, $
  bounded below by a positive constant depending on $p$. The sum of its third absolute centered moments is at most $C_p u_0 sum_(j in T) x_j^2$. The Berry–Esseen inequality [2,5], in its unequal-summand form [21] Theorem, p. 586, bounds the uniform distribution-function error by an absolute constant times the sum of these third moments divided by $sigma_T^3$. The error from the centered normal law with variance $sigma_T^2$ is therefore at most $C_p u_0$. The probability of any interval of length $2 w$ is therefore at most $C_p \( w + u_0 \)$. Choose $u_0$, then $w$, small enough to make this quantity less than $Q$, and finally decrease $delta_0$. This proves (2.6) in both cases.
  For a fixed pair $\( x \, u \)$, the rows outside $S$ depend on disjoint sets of upper-triangular entries, so these tests are independent. Choose a small fixed $gamma > 0$, and then $delta < delta_0$ so that $C_1^2 L^2 delta^2 \/ w^2 < gamma$. Inequality (2.5) allows at most $gamma n$ rows to fail the interval test. Thus its probability, for fixed data, is at most
  $ (sum_(i lt.eq gamma n) binom(n, i)) Q^(thin n - j - 1 - gamma n) . $
  The norm event was used only to obtain (2.5); the independent tests in this bound are not conditioned on that event.
  For $t in \( 0 \, 1 \)$, let $H_2 \( t \) = - t log_2 t - \( 1 - t \) log_2 \( 1 - t \)$. Union over anchors, supports, and net points gives a base-two logarithm at most
  $ - d_(*) n + #scale(x: 120%, y: 120%)[\[] d_(*) \( lambda + gamma \) + H_2 \( gamma \) + H_2 \( lambda \) + lambda log_2 \( C \/ delta \) #scale(x: 120%, y: 120%)[\]] n + o \( n \) . $
  Choose $gamma$ sufficiently small, then $delta$ as above, then $lambda$ sufficiently small, to make the bracket less than $epsilon.alt \/ 2$. Adding (2.4) and taking $n$ large proves the lemma. ◻
]

=== 2.2 The conditioned bit model and the column estimate <the-conditioned-bit-model-and-the-column-estimate>

For tails outside Lemma 3, we will use Schur complementation to identify the possible deleted columns. The sign-to-bit congruence is the one in [17] Lemma 2.1; conditioning must now retain its effect on the entry probabilities.

#thm([Lemma 2.3.])[
  #emph[Fix an index $a_0$ and condition on its entire row in $A_n^(\( p \))$. There is a symmetric bit matrix $M$ of size $N = n - 1$ with the following properties:]
  + #emph[the entries on and above its diagonal are independent, and each has success probability $p$ or $b$;]
  + #emph[$"rank" \( bb(E) M \) lt.eq 2$, and the same holds for every principal minor;]
  + #emph[$dim ker M = dim ker A$; whenever $a_0$ is an anchor of a kernel vector of $A$, its normalized tail, with some coordinate signs changed, is a unit vector in $ker M$.]
] <lem:anchor-congruence>

#proof[
  Relabel the fixed index as the first coordinate, put $mu = 2 p - 1$, $t = A_11$ and $u_i = A_(1 i)$ for $i > 1$, and set
  $ D = "diag" \( 1 \, t u_2 \, dots.h \, t u_n \) . $
  The matrix $t D A D$ has first row and column equal to one. Its lower principal block is the sign matrix $C_(i j) = t u_i u_j A_(i j)$, $i \, j > 1$. Hence its Schur complement at the first entry is
  $ C - upright(bold(1)) upright(bold(1))^(sans(T)) = - 2 M \, #h(2em) M_(i j) = frac(1 - t u_i u_j A_(i j), 2) . $
  After the anchor row is fixed, the remaining original signs are independent. The displayed formula proves (i) and gives
  $ bb(E) M = 1 / 2 upright(bold(1)) upright(bold(1))^(sans(T)) - frac(mu t, 2) u u^(sans(T)) . $
  This includes the diagonal, since $u_i^2 = 1$, and proves (ii). Multiplication by $t$, diagonal congruence, and taking the Schur complement of the nonzero first entry preserve nullity. More explicitly, $D v$ is a kernel vector of $t D A D$, and its lower coordinates are in $ker M$. They differ from the original tail only by coordinate signs, which proves (iii). ◻
]

For the rest of the paper, let $N$ be a reference dimension and put

#[#set math.equation(numbering: n => "(2.7)")
 $ ell = log log N \, #h(2em) cal(I)_N = { m in bb(Z) : N - N^(7 \/ 10) lt.eq m lt.eq N } . $ <eq:reference-range>]

By the #emph[bit model] we mean a symmetric matrix $B$ of size $m in cal(I)_N$, with independent entries on and above the diagonal, whose fixed success probabilities belong to ${ p \, b }$, and with $"rank" \( bb(E) B \) lt.eq 2$. All estimates for this model are uniform over these sizes and arrays of probabilities. A property #emph[holds typically] if its failure probability is $2^(- omega \( N \))$ uniformly in this sense. For a property stated only for nonsingular matrices, failure means nonsingularity together with failure of the conclusion. Any fixed parameters in the property are chosen before $N$ tends to infinity.

For $L_0 gt.eq 1$ fixed and a nonsingular matrix $B$ of size $m$, define

#[#set math.equation(numbering: n => "(2.8)")
 $ cal(S)_(L_0) \( B \) = {z in { 0 \, 1 }^m : z^(sans(T)) B^(- 1) z in { 0 \, 1 } \, med lr(bar.v.double B^(- 1) z bar.v.double)_2 lt.eq L_0 sqrt(N)} . $ <eq:admissible-columns>]

The quadratic condition is exactly the Schur-complement condition for a bit diagonal to complete $B$ to a singular matrix. The norm bound will follow from the choice of deleted coordinate. The only deferred input in the proof of the main theorem is the following estimate.

#thm([Proposition 2.4.])[
  (Column estimate).  #emph[For every fixed $L_0 gt.eq 1$ and every sufficiently small fixed $e_0 > 0$, a matrix $B$ in the bit model of size $m = N - 1$ satisfies, for all sufficiently large $N$, 
$ bb(P) (B upright(" is nonsingular and ") \| cal(S)_(L_0) \( B \) \| > 2^(e_0 N)) lt.eq 2^(- N \( 2 a - 10 e_0 \)) . $

]
] <prop:column-bound>

Proposition 5 will be proved at the end of Section 6. Its cardinality bound is useful here because a row with approximately $p n$ positive original signs has point probability close to $2^(- h_(*) n)$. We next ensure that such a row can be chosen among the large kernel coordinates.

#thm([Lemma 2.5.])[
  (Row counts).  #emph[For every fixed $rho \, w > 0$, with probability $1 - exp \( - Omega_(rho \, w) \( n^2 \) \)$, fewer than $rho n$ rows of $A_n^(\( p \))$ have a number of positive entries outside $\[ p n - w n \, p n + w n \]$.]
] <lem:row-counts>

#proof[
  If at least $rho n$ rows fail, at least half fail in the same direction. Choose a set $I$ of $k = ceil.l rho n \/ 3 ceil.r$ such rows, for all sufficiently large $n$; it suffices to consider $rho < 1$. The sum of their positive-entry counts is a sum of independent upper-triangular Bernoulli variables with coefficients one or two. Its mean is $p k n$, and its coefficients have squared sum at most $2 k n$. The common-direction deviation is at least $k w n$. Hoeffding’s inequality [8] Theorem 2 bounds this probability by $2 exp \( - k w^2 n \)$. There are at most $2^n$ sets $I$ and two directions, giving the assertion. ◻
]

#proof[
  Fix $epsilon.alt > 0$, and choose $lambda \, delta$ from Lemma 3. By Lemma 2, it suffices to bound the corank-one event; the matrices discarded in the corank reduction are already negligible. Discard also the event in Lemma 3.
  Take any remaining normalized tail and choose a fixed $c in \( 0 \, delta \)$. There are at least $lambda n \/ 2$ off-anchor coordinates with absolute value at least $c \/ sqrt(n)$. Otherwise truncation to these coordinates would have support at most $lambda n$ and discarded norm at most $c$, contrary to the choice of the tail. For a fixed tolerance $w_1 > 0$, Lemma 6 with $rho = lambda \/ 4$ shows, apart from probability $exp \( - Omega_(lambda \, w_1) \( n^2 \) \)$, that some such coordinate has a row count within $w_1 n$ of $p n$. Choose it as the deletion index.
  Fix the anchor and deletion indices and condition on the anchor row. This does not condition on their having been chosen by a kernel vector; we will take a union bound over their indices. Apply Lemma 4, and denote the transformed unit tail by $v in ker M$, where $M$ has size $N = n - 1$ and corank one. Its deletion coordinate has $\| v_i \| gt.eq c \/ sqrt(n)$. The adjugate of a symmetric corank-one matrix is a nonzero scalar multiple of $v v^(sans(T))$. Thus deleting coordinate $i$ leaves a nonsingular principal minor $B$ of size $N - 1$. Writing
  $ M = mat(delim: "(", B, z; z^(sans(T)), d) \, #h(2em) d in { 0 \, 1 } \, $
  the kernel equation and Schur complement give
  $ B^(- 1) z = - v_(\[ N \] \\ { i }) / v_i \, #h(2em) z^(sans(T)) B^(- 1) z = d . $
  Consequently $z in cal(S)_(L_0) \( B \)$ for a fixed $L_0 gt.eq max \( 1 \, 2 \/ c \)$.
  It remains to bound the probability of these possible columns under the biased law. Conditional on the anchor row, $B$ and the entries of $z$ are independent. A specified $z$ specifies the $n - 2 = N - 1$ original off-diagonal signs of the deleted column outside the anchor. If $r$ of those signs are positive, its point probability is exactly
  $ p^r b^(N - 1 - r) . $
  The full original row has only two additional entries, its diagonal and its anchor entry. Compatibility with the selected row-count condition therefore requires $\| r - p n \| lt.eq w_1 n + 2$. For every such $z$,
  #[#set math.equation(numbering: n => "(2.9)")
   $ p^r b^(N - 1 - r) lt.eq 2^(- N \( h_(*) - C_p w_1 - o \( 1 \) \)) . $ <eq:column-entropy>]
  Indeed its negative base-two logarithm is
  $ \( N - 1 \) h_(*) + #scale(x: 120%, y: 120%)[\(] r - p \( N - 1 \) #scale(x: 120%, y: 120%)[\)] log_2 \( b \/ p \) . $
  The count here concerns positive #emph[original signs]; the success probabilities of the transformed bits need not be equal. We have not charged the deleted diagonal: dropping its requirement only enlarges the event.
  On the event that the nonsingular $B$ satisfies the cardinality conclusion of Proposition 5, independence and (2.9) bound the conditional probability by
  $ 2^(- N \( h_(*) - e_0 - C_p w_1 - o \( 1 \) \)) . $
  The exceptional nonsingular minors have conditional probability at most $2^(- N \( 2 a - 10 e_0 \))$. Both bounds are uniform in the anchor row, so averaging over that row introduces no additional factor. The choices of anchor and deletion indices cost at most $n^2$.
  After $L_0$ has been fixed, choose $e_0 \, w_1 > 0$ sufficiently small that
  $ 2 a - 10 e_0 > d_(*) \, #h(2em) h_(*) - e_0 - C_p w_1 > d_(*) \, $
  using (2.2). Together with the discarded events and the subexponential corank reduction, this proves
  $ limsup_(n arrow.r oo) 1 / n log_2 bb(P) \( det A_n^(\( p \)) = 0 \) lt.eq - d_(*) + epsilon.alt . $
  Letting $epsilon.alt arrow.b 0$ gives the required upper bound.
  For the lower bound, require the first two rows to be equal. The entries in their first two coordinates must satisfy $A_11 = A_12 = A_22$, at cost $p^3 + b^3$. For each $j gt.eq 3$, the independent pair $\( A_(1 j) \, A_(2 j) \)$ agrees with probability $Q$. These requirements involve disjoint upper-triangular entries, and hence
  $ bb(P) \( det A_n^(\( p \)) = 0 \) gt.eq \( p^3 + b^3 \) Q^(n - 2) . $
  This gives the matching lower bound. Negation handles $p > 1 \/ 2$. ◻
]

== 3 Lattice tools and a prime-corank bound <sec:typical>

The lattice-intersection argument of Section 4 uses three inputs: a uniform bound on corank modulo primes, a finite cover of rational subspaces of low height, and a lattice decomposition that removes directions of small determinant. We prove the prime-corank bound for the biased bit model, adapting [17] Proposition 5.3, and recall the deterministic lattice results with their precise hypotheses.

=== 3.1 Corank over all prime fields <corank-over-all-prime-fields>

The principal-block argument of [17] Lemmas 2.2 and 2.3 gives the following estimate over any field in which the two bit values remain distinct. If $A$ is a symmetric $d times d$ matrix whose upper-triangular entries are independent and have atoms at most $b$, and $H$ is a fixed symmetric matrix over the same field, then

#[#set math.equation(numbering: n => "(3.1)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] "corank" \( A + H \) gt.eq k #scale(x: 120%, y: 120%)[\)] lt.eq 2^d b^(k \( k + 1 \) \/ 2) \, #h(2em) 1 lt.eq k lt.eq d . $ <eq:typical-corank-tail>]

Indeed, a symmetric matrix of rank $r$ has a nonsingular principal submatrix of size $r$, over any field, including characteristic two. One way to see this is to write it as $Y C Y^(sans(T))$, where $Y$ has full column rank $r$ and $C$ is symmetric and nonsingular, and then choose $r$ independent rows of $Y$. For a fixed such principal block, reveal that block and all entries joining it to its complement. If the full matrix has rank $r$, Schur complementation fixes all $\( d - r \) \( d - r + 1 \) \/ 2$ unrevealed entries. Their independence bounds the conditional probability by $b^(\( d - r \) \( d - r + 1 \) \/ 2)$. Summing over all principal sets of size at most $d - k$ proves Equation (3.1); the empty principal set handles rank zero.

#thm([Lemma 3.1.])[
  (Uniform prime corank).  #emph[Typically, every nonsingular bit matrix $B$ of size $m in cal(I)_N$ satisfies 
$ "corank"_(bb(F)_q) \( B med mod med q \) lt.eq N^(3 \/ 5) quad upright("for every prime ") q . $

 Consequently, its finite abelian group 
$ G_B = bb(Z)^m \/ B bb(Z)^m $

 can be generated by at most $ceil.l N^(3 \/ 5) ceil.r$ elements. The probability of nonsingularity together with failure is at most $2^(- Omega_p \( N^(6 \/ 5) \))$.]
] <lem:prime-corank>

#proof[
  For a fixed prime, Equation (3.1) with $k = floor.l N^(3 \/ 5) floor.r + 1$ gives the asserted probability bound. If $B$ is nonsingular over $bb(R)$, every prime with positive corank divides the nonzero integer $det B$. Hadamard’s inequality gives
  $ 1 lt.eq \| det B \| lt.eq m^(m \/ 2) lt.eq N^(N \/ 2) . $
  A union bound over all primes at most $N^(N \/ 2)$ therefore costs at most $2^(O \( N log N \))$, which is negligible compared with $2^(- Omega_p \( N^(6 \/ 5) \))$. Finally,
  $ dim_(bb(F)_q) \( G_B \/ q G_B \) = "corank"_(bb(F)_q) \( B med mod med q \) . $
  The structure theorem for finite abelian groups identifies the minimum number of generators with the maximum of these dimensions. ◻
]

=== 3.2 Lattice height and a cover of rational subspaces <lattice-height-and-a-cover-of-rational-subspaces>

A lattice is a discrete subgroup of a finite-dimensional Euclidean space, considered in its real span. Its rank is the dimension of that span, and its determinant is its Euclidean covolume. Thus, for a lattice basis $v_1 \, dots.h \, v_r$,

$ det L = det #scale(x: 120%, y: 120%)[\(] chevron.l v_i \, v_j chevron.r_(i \, j = 1)^r #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) . $

The rank-zero lattice has determinant one. A subspace $F subset.eq bb(R)^m$ is #emph[rational] if it is spanned by integer vectors; its #emph[height] is

$ H \( F \) = det \( F ∩ bb(Z)^m \) . $

In particular, $H \( 0 \) = H \( bb(R)^m \) = 1$. Every such height is at least one: the wedge of an integer lattice basis is a nonzero integer vector whose Euclidean norm is the determinant.

We measure the difference between two subspaces by their #emph[rank distance]

$ d \( U \, V \) = dim U + dim V - 2 dim \( U ∩ V \) . $

This distance counts dimensions lost upon passing to their intersection; it does not measure angles. The dimension formula gives $d \( U^perp \, V^perp \) = d \( U \, V \)$. The next theorem supplies a fixed finite list approximating every subspace in the required height range.

#thm([Theorem 3.2.])[
  (Low-height cover, [17] Theorem 4.1).  #emph[Fix $D \, P > 0$. For all sufficiently large $N$ and every integer $0 lt.eq m lt.eq N$, there is a list $cal(C)_(m \, N)$ of rational subspaces of $bb(R)^m$, depending only on $m \, N \, D \, P$, such that 
$ \| cal(C)_(m \, N) \| lt.eq 2^(N^2 ell^(- P)) . $

 Every rational $F subset.eq bb(R)^m$ with $H \( F \) lt.eq exp \( N ell^D \)$ satisfies 
$ min_(U in cal(C)_(m \, N)) d \( F \, U \) lt.eq N ell^(- P) . $

]
] <thm:height-cover>

=== 3.3 Removing directions of small determinant <removing-directions-of-small-determinant>

The next decomposition separates a lattice from the directions in which its determinant is small. A sublattice $L_0 subset.eq L$ is #emph[saturated], or #emph[primitive], if $L_0 = L ∩ "span" L_0$. A basis of a saturated sublattice extends to a basis of $L$. If $F = "span" L_0$, orthogonal projection onto $F^perp$ therefore realizes the quotient as a lattice $L \/ L_0 = pi_(F^perp) L$, and volume factorization gives

#[#set math.equation(numbering: n => "(3.2)")
 $ det L = det L_0 thin det \( pi_(F^perp) L \) . $ <eq:orthogonal-quotient>]

The same factorization holds for the full preimage in $L$ of any sublattice of the quotient. These facts hold in every rank, with the rank-zero conventions already specified; see [17] Lemma 3.1.

Extremal sublattices and their canonical filtrations also occur in Grayson’s reduction theory of Euclidean lattices [7] Section 1. We need only the following elementary minimization statement.

#thm([Lemma 3.3.])[
  (Determinant minimizer, [17] Lemma 3.6).  #emph[For every lattice $L$ and $T > 0$, the quantity 
$ frac(det M, T^("rank" M)) \, #h(2em) M subset.eq L upright(" a sublattice") \, $

 attains its minimum at a saturated sublattice $L_min$. It satisfies 
$ det L_min lt.eq T^("rank" L_min) \, #h(2em) det M gt.eq T^("rank" M) quad upright("for every sublattice ") M subset.eq L \/ L_min . $

]
] <lem:minimizer>

#proof[
  The zero sublattice gives value one. For each positive rank $r$, the wedge of a basis belongs to the discrete lattice $and.big^r L$, so there are only finitely many such wedge vectors of norm at most $T^r$. Thus the normalized determinants no greater than one have only finitely many possible values, and the minimum is attained. Saturation preserves rank and can only lower the determinant. Comparing with the zero sublattice gives the first bound. For a sublattice $M$ of the quotient, its full preimage $tilde(M) subset.eq L$ has
  $ det tilde(M) = det L_min det M \, #h(2em) "rank" tilde(M) = "rank" L_min + "rank" M . $
  Minimality applied to $tilde(M)$ gives the second bound. ◻
]

The point of removing $L_min$ is that lower bounds on all sublattice determinants give an upper bound on the number of short vectors in the remaining quotient.

#thm([Lemma 3.4.])[
  (Projected point count).  #emph[Let $T > 0$. Suppose a lattice $Lambda$ of rank $j gt.eq 1$ satisfies $det M gt.eq T^("rank" M)$ for every sublattice $M subset.eq Lambda$. Then, with $s_0 = T \/ \( 10 \( log j + 2 \) \)$, 
$ \# { x in Lambda : lr(bar.v.double x bar.v.double)_2 lt.eq R } lt.eq 3 / 2 exp \( pi R^2 \/ s_0^2 \) \, #h(2em) R gt.eq 0 . $

 In particular, for $T = \( log N \)^4$, $j lt.eq N$, and $R = sqrt(N)$, this count is at most 
$ 2^(O \( N \/ \( log N \)^6 \)) = 2^(o \( N \)) . $

 The latter bound also holds in rank zero, where the count equals one.]
] <lem:projected-count>

#proof[
  For $s > 0$, write $rho_s \( Lambda \) = sum_(x in Lambda) exp \( - pi lr(bar.v.double x bar.v.double)_2^2 \/ s^2 \)$. The Reverse Minkowski Theorem of Regev and Stephens-Davidowitz [18] Theorem 1.2, in the scaled form of [17] Theorem 3.4, gives $rho_(s_0) \( Lambda \) lt.eq 3 \/ 2$ under precisely the stated sublattice hypotheses. Every vector of norm at most $R$ contributes at least $exp \( - pi R^2 \/ s_0^2 \)$, yielding the displayed count; this is [17] Lemma 3.5. Finally, $s_0 gt.eq c \( log N \)^3$ for $1 lt.eq j lt.eq N$, which gives the claimed exponent. ◻
]

== 4 A simultaneous bound for lattice intersections <sec:lattice>

A lattice of large index can still contain many vertices of the cube. The constraint that it contain the columns of a random matrix changes this picture. We now show that, with overwhelmingly high probability, every such lattice has small intersection with every translate of the cube. The simultaneous quantifier is essential: the lattices used later will themselves depend on the matrix.

#thm([Theorem 4.1.])[
  (Simultaneous lattice intersections).  #emph[Fix $D > 0$ and $0 < alpha < 1$, and put $tau = ell^(- D)$. Typically, a nonsingular bit matrix $B$ of size $m in cal(I)_N$ has the following property. For every lattice $K$ with 
$ B bb(Z)^m subset.eq K subset.eq bb(Z)^m \, #h(2em) \[ bb(Z)^m : K \] gt.eq N^(tau N) \, $

 and every $x in bb(R)^m$, 
$ \| \( x + K \) ∩ { 0 \, 1 }^m \| < 2^(alpha N) . $

 The exceptional probability is uniform over the bit models specified in Section 2.]
] <thm:small-intersection>

The proof constructs a small collection of vectors $y$ for which $B y$ is integral. A large cube intersection forces these vectors to lie near a subspace of dimension strictly smaller than $N$. Their possible values can therefore be covered by a sufficiently small fixed net. For fixed representatives, Fourier estimates show that their scalar products with a random bit row are unlikely to lie simultaneously near integers. We test this on disjoint groups of entries in different rows of $B$; comparing the resulting probability with the net size proves the theorem without enumerating the lattices $K$.

We first work deterministically. Assume that $B$ is nonsingular and satisfies Lemma 7, and suppose that an admissible $K$ has a coset containing at least $2^(alpha N)$ cube points. All constants in the construction are fixed before $N$ tends to infinity.

=== 4.1 From a large intersection to separated quotient sums <from-a-large-intersection-to-separated-quotient-sums>

Apply Lemma 9 to $K$ with $T = \( log N \)^4$. Write $L_min$ for the resulting primitive sublattice, and set

$ F = "span" L_min \, #h(2em) E = F^perp \, #h(2em) Lambda = pi_E K \, #h(2em) Pi = pi_E bb(Z)^m \, $

where $pi_E$ denotes orthogonal projection. Both projected groups are lattices in $E$, and $Lambda subset.eq Pi$ has full rank there. Orthogonal factorization of covolumes gives

#[#set math.equation(numbering: n => "(4.1)")
 $ H \( F \) lt.eq det L_min lt.eq e^(4 N ell) \, #h(2em) det Lambda gt.eq N^(tau N) e^(- 4 N ell) . $ <eq:lattice-height-index>]

For the first inequality, $L_min$ is a full-rank sublattice of $F ∩ bb(Z)^m$. The second bound uses $det K = det L_min det Lambda$.

Differences of cube points in the chosen coset belong to $K$ and have norm at most $sqrt(N)$. Lemma 10 therefore bounds the number of their distinct projections into $Lambda$ by $2^(o \( N \))$. Some fiber contains $2^(alpha N - o \( N \))$ cube points. Every affine translate of $F$ contains at most $2^(dim F)$ cube points: project injectively onto a set of $dim F$ independent coordinate functionals. Thus

#[#set math.equation(numbering: n => "(4.2)")
 $ dim F gt.eq alpha N \/ 2 $ <eq:lattice-large-fiber>]

for sufficiently large $N$. This is the dimension saving that will make the eventual net smaller than the collection of row constraints.

Choose a fixed $P > D + 5$. Since $H \( F \) lt.eq e^(N ell^2)$ for large $N$, Theorem 8, with height exponent $2$, gives a list member $V$ with $d \( F \, V \) lt.eq N ell^(- P)$. Put $U = V^perp$. Orthocomplementation preserves rank distance, so $d \( E \, U \) lt.eq N ell^(- P)$, and $U$ belongs to a fixed list of at most $2^(N^2 ell^(- P))$ subspaces. In particular,

#[#set math.equation(numbering: n => "(4.3)")
 $ dim U lt.eq \( 1 - alpha \/ 3 \) N \, #h(2em) W_0 = E ∩ U \, #h(2em) r = dim E - dim W_0 lt.eq N ell^(- P) . $ <eq:lattice-cover-dimension>]

Rank distance controls the dimension of an exact intersection; it does not assert that the two subspaces have small Euclidean angle. To obtain vectors close to $U$, we will suppress the remaining $r$ directions by a linear change of scale.

Fix $0 < gamma < alpha \/ 20$, and choose $C > 10$ so large that

#[#set math.equation(numbering: n => "(4.4)")
 $ Delta := \( C - 3 \) \( 1 - 2 gamma \) - \( C + 4 \) \( 1 - alpha \/ 3 \) > 0 . $ <eq:lattice-entropy-margin>]

This is possible because $alpha \/ 3 - 2 gamma > 0$. Define a positive self-adjoint map $S : E arrow.r E$ by

#[#set math.equation(numbering: n => "(4.5)")
 $ S = N^2 I quad upright("on ") W_0 \, #h(2em) S = N^(- C - 5) I quad upright("on ") E ∩ W_0^perp . $ <eq:lattice-scale>]

The large scale in $W_0$ will separate quotient sums. The small scale on its complement will later force the dual vectors close to $U$.

We need a covolume bound that applies even to sublattices of deficient rank. Since $F ∩ bb(Z)^m$ is primitive in $bb(Z)^m$,

#[#set math.equation(numbering: n => "(4.6)")
 $ det Pi = H \( F \)^(- 1) . $ <eq:lattice-projection-covolume>]

More generally, every sublattice $L subset.eq bb(Z)^j xor Pi$, for any $j gt.eq 0$, satisfies

#[#set math.equation(numbering: n => "(4.7)")
 $ det L gt.eq H \( F \)^(- 1) . $ <eq:lattice-lift-bound>]

To see this, take the full inverse image of $L$ in $bb(Z)^j xor bb(Z)^m$ under $\( v \, z \) mapsto \( v \, pi_E z \)$. Its primitive kernel is ${ 0 } xor \( F ∩ bb(Z)^m \)$. Orthogonal quotient factorization gives covolume $H \( F \) det L$ for the inverse image, which is at least one because it is an integer lattice. This argument uses the actual rank of $L$ and includes rank zero.

The finite group $Pi \/ Lambda$ is a quotient of $G_B = bb(Z)^m \/ B bb(Z)^m$, and hence has at most $g_N = ceil.l N^(3 \/ 5) ceil.r$ generators. Its order is at least the lower bound for $det Lambda$ in Equation (4.1), by Equation (4.6) and $H \( F \) gt.eq 1$. Multiplication by a nonzero integer $u$ has a kernel of size at most $\| u \|^(g_N)$ on any group with $g_N$ generators. Consequently, uniformly for $1 lt.eq \| u \| lt.eq N^C$,

#[#set math.equation(numbering: n => "(4.8)")
 $ \| u \( Pi \/ Lambda \) \| gt.eq N^(tau N - o \( tau N \)) . $ <eq:lattice-multiple-index>]

Here $N ell \/ log N = o \( tau N \)$ and $N^(3 \/ 5) = o \( tau N \)$.

For a lattice $L$ in a Euclidean space, write $"dist" \( z \, L \) = inf_(v in L) lr(bar.v.double z - v bar.v.double)_2$. The next lemma turns the large finite quotient in Equation (4.8) into many separated subset sums. Fix an absolute constant $R_0 gt.eq 100$.

#thm([Lemma 4.2.])[
  #emph[For each integer $u$ with $1 lt.eq \| u \| lt.eq N^C$, there is a set $I_u subset.eq \[ m \]$, of size at least $c_1 tau N$, such that the subset sums of 
$ { u S pi_E e_i : i in I_u } $

 have pairwise distance greater than $R_0 sqrt(N)$ modulo $S Lambda$. The constant $c_1 > 0$ is fixed, independently of $u$ and $N$.]
] <lem:separated-subsets>

#proof[
  Choose a maximal such set of indices, say $i_1 \, dots.h \, i_j$. Adding an unselected index creates a pair of subset sums at distance at most $R_0 sqrt(N)$ modulo $S Lambda$. The added index occurs in exactly one of them, since the old subset sums were separated. Undoing $S$, we obtain, for every $i in \[ m \]$,
  #[#set math.equation(numbering: n => "(4.9)")
   $ u pi_E e_i equiv sum_(h = 1)^j a_(h i) u pi_E e_(i_h) + epsilon_i med \( mod med Lambda \) \, #h(2em) a_(h i) in { - 1 \, 0 \, 1 } \, #h(2em) lr(bar.v.double S epsilon_i bar.v.double)_2 lt.eq R_0 sqrt(N) \, $ <eq:lattice-representations>]
  where $epsilon_i in Pi$. For the selected indices use the exact representations, with coefficient columns the standard basis and zero errors.
  Let $t$ be the dimension spanned by the errors, and choose $t$ independent ones. By Equation (4.7), their volume is at least $1 \/ H \( F \)$. On every $t$-dimensional subspace, $S$ expands volume by at least $N^(2 t - \( C + 7 \) r)$: at most $r$ singular directions have the smaller scale in Equation (4.5). Hadamard’s inequality for the scaled errors gives
  $ H \( F \)^(- 1) N^(2 t - \( C + 7 \) r) lt.eq \( R_0 sqrt(N) \)^t . $
  Using Equation (4.1), we conclude that
  #[#set math.equation(numbering: n => "(4.10)")
   $ t = O_C (r + frac(N ell, log N)) = o \( tau N \) . $ <eq:lattice-error-rank>]
  Define a real linear map $M : bb(R)^m arrow.r bb(R)^j xor E$ whose $i$th column is $\( a_(1 i) \, dots.h \, a_(j i) \, epsilon_i \)$. Its integer image $M bb(Z)^m$ is a sublattice of $bb(Z)^j xor Pi$, of rank $s lt.eq j + t$. Evaluation of a representation defines the homomorphism
  $ Psi : bb(Z)^j xor Pi arrow.r Pi \/ Lambda \, #h(2em) Psi \( a \, v \) = sum_(h = 1)^j a_h u pi_E e_(i_h) + v med \( mod med Lambda \) . $
  By Equation (4.9), $Psi \( M bb(Z)^m \) = u \( Pi \/ Lambda \)$. Every column of $M B$ lies in $ker Psi$, because its evaluation is $u pi_E B e_i in Lambda$. Moreover, $B$ is nonsingular, so $"rank" \( M B \) = s$. Choose $s$ independent columns of $M B$, and let $L'$ be their integer span. Then
  $ \| u \( Pi \/ Lambda \) \| lt.eq \[ M bb(Z)^m : L' \] = frac(det L', det \( M bb(Z)^m \)) . $
  Each error has ordinary norm at most $R_0 N^(C + 5) sqrt(N)$. Since the entries of $B$ are bounded by one, the chosen columns have norm at most $N^(C + 9)$ for large $N$. Equation (4.7) and Hadamard’s inequality therefore imply
  $ N^(tau N - o \( tau N \)) lt.eq H \( F \) N^(\( C + 9 \) s) lt.eq H \( F \) N^(\( C + 9 \) \( j + t \)) . $
  Together with Equation (4.10), this yields $j gt.eq c_1 tau N$, for example with $c_1 = 1 \/ \[ 2 \( C + 9 \) \]$ and sufficiently large $N$. ◻
]

There are only polynomially many integers $u$ under consideration. Select each coordinate independently with probability $gamma \/ 2$. Binomial concentration, applied to $\[ m \]$ and to the sets $I_u$, shows that some set $J subset.eq \[ m \]$ satisfies

#[#set math.equation(numbering: n => "(4.11)")
 $ \| J \| lt.eq gamma N \, #h(2em) \| J ∩ I_u \| gt.eq c_2 tau N quad \( 1 lt.eq \| u \| lt.eq N^C \) \, $ <eq:lattice-small-coordinate-set>]

with a fixed $c_2 > 0$. Indeed the failure probability for each $I_u$ is $exp \( - Omega \( tau N \) \)$, which absorbs the polynomial union.

=== 4.2 Dual vectors and Fourier bounds <dual-vectors-and-fourier-bounds>

We have obtained separated quotient sums using only the coordinates in $J$. We now convert that separation into vectors whose scalar products with random bit columns are spread around the circle. The dual lattice is

$ Lambda^(*) = { y in E : chevron.l y \, Lambda chevron.r subset.eq bb(Z) } . $

For every $y in Lambda^(*)$, symmetry of $B$ and $pi_E B bb(Z)^m subset.eq Lambda$ give

#[#set math.equation(numbering: n => "(4.12)")
 $ B y in bb(Z)^m . $ <eq:lattice-dual-integrality>]

Sample $y in Lambda^(*)$ with probability proportional to $exp \( - pi lr(bar.v.double S^(- 1) y bar.v.double)_2^2 \)$. The factor $S^(- 1)$ strongly suppresses components in $E ∩ W_0^perp$; Gaussian tails will therefore place the sampled vectors close to $W_0 subset.eq U$. Write

$ phi \( t \) = b + p e^(2 pi i t) . $

#thm([Lemma 4.3.])[
  #emph[There is a fixed $c_3 > 0$ such that, for every integer $1 lt.eq \| u \| lt.eq N^C$ and every collection of real numbers $\( s_i \)_(i in J)$, 
#[#set math.equation(numbering: n => "(4.13)")
 $ bb(E)_y product_(i in J) \| phi \( u y_i + s_i \) \|^2 lt.eq e^(- c_3 tau N) . $ <eq:lattice-fourier-average>]

]
] <lem:dual-fourier-average>

#proof[
  Let $X = xi - xi'$ where $xi \, xi'$ are independent vectors of Bernoulli $p$ bits on $J$, extended by zero outside $J$. Expanding the product in Equation (4.13) expresses its expectation as
  $ bb(E)_X [e^(2 pi i sum_(i in J) s_i X_i) bb(E)_y e^(2 pi i u chevron.l y \, X chevron.r)] . $
  Poisson summation in $E$ gives
  #[#set math.equation(numbering: n => "(4.14)")
   $ bb(E)_y e^(2 pi i u chevron.l y \, X chevron.r) = f \( u X \) \, #h(2em) f \( u X \) = frac(sum_(lambda in Lambda) e^(- pi lr(bar.v.double S \( lambda - u pi_E X \) bar.v.double)_2^2), sum_(lambda in Lambda) e^(- pi lr(bar.v.double S lambda bar.v.double)_2^2)) . $ <eq:lattice-poisson-ratio>]
  The ratio is nonnegative and at most one. Positivity follows from the displayed formula; the upper bound follows either from its characteristic-function interpretation or from the Gaussian translate inequality. Thus taking absolute values permits us to discard the phases involving $s_i$ and bound the original expectation by $bb(E)_X f \( u X \)$.
  We record explicitly the Gaussian estimates used here. For every lattice $L$ of rank $d$ and every $z$ in its span, Poisson summation and positivity of the Fourier transform of a Gaussian imply
  $ sum_(v in L) e^(- pi lr(bar.v.double v - z bar.v.double)_2^2 \/ 2) lt.eq sum_(v in L) e^(- pi lr(bar.v.double v bar.v.double)_2^2 \/ 2) \, #h(2em) frac(sum_(v in L) e^(- pi lr(bar.v.double v bar.v.double)_2^2 \/ 2), sum_(v in L) e^(- pi lr(bar.v.double v bar.v.double)_2^2)) lt.eq 2^(d \/ 2) . $
  For the second inequality, Poisson summation expresses the ratio as $2^(d \/ 2)$ times a ratio of dual Gaussian masses at decreasing scales. These estimates hold for arbitrary lattices, with no additional regularity assumption. For these lattice Gaussian comparisons, see Banaszczyk [1] and [18] Equation (5) and Claim 2.2.
  Apply them to $L = S Lambda$. If $"dist" \( u S pi_E X \, S Lambda \) gt.eq R_0 sqrt(N) \/ 3$, retaining half of each Gaussian exponent in the numerator of Equation (4.14) gives
  #[#set math.equation(numbering: n => "(4.15)")
   $ f \( u X \) lt.eq e^(- pi R_0^2 N \/ 18) 2^(dim E \/ 2) lt.eq e^(- c_4 N) $ <eq:lattice-gaussian-distance>]
  for an absolute $c_4 > 0$.
  To bound the complementary event, condition on $xi'$ and on all coordinates of $xi$ except those in $J ∩ I_u$. By Lemma 12, at most one of the remaining subset sums lies within distance $R_0 sqrt(N) \/ 3$ of the prescribed translate of $S Lambda$. Otherwise the distance between two such sums would be at most $2 R_0 sqrt(N) \/ 3$. The probability of any one bit pattern is at most $b^(\| J ∩ I_u \|) lt.eq b^(c_2 tau N)$. Combining this bound with Equation (4.15) proves the result, after decreasing $c_3$. ◻
]

We next choose several dual vectors at once. Let

#[#set math.equation(numbering: n => "(4.16)")
 $ k = ⌊kappa frac(tau N, log N)⌋ \, $ <eq:lattice-number-testers>]

where $kappa > 0$ will be fixed sufficiently small. For fixed $c_5 > 0$ small enough, there exist $y^1 \, dots.h \, y^k in Lambda^(*)$ such that

#[#set math.equation(numbering: n => "(4.17)")
 $ lr(bar.v.double y^g bar.v.double)_2 lt.eq R_0 N^2 sqrt(N) \, #h(2em) "dist" \( y^g \, U \) lt.eq R_0 N^(- C - 5) sqrt(N) #h(2em) \( 1 lt.eq g lt.eq k \) \, $ <eq:lattice-tester-geometry>]

#[#set math.equation(numbering: n => "(4.18)")
 $ product_(i in J) lr(|phi (sum_(g = 1)^k w_g y_i^g)|) lt.eq e^(- c_5 tau N) quad #scale(x: 120%, y: 120%)[\(] w in bb(Z)^k \, med 1 lt.eq lr(bar.v.double w bar.v.double)_oo lt.eq N^C #scale(x: 120%, y: 120%)[\)] . $ <eq:lattice-tester-fourier>]

Here and below a distance to a subspace is Euclidean distance.

For completeness, sample the $k$ vectors independently according to the dual Gaussian. The Gaussian scale inequality just proved, applied on $S^(- 1) Lambda^(*)$, gives

$ bb(P) #scale(x: 120%, y: 120%)[\(] lr(bar.v.double S^(- 1) y^g bar.v.double)_2 > R_0 sqrt(N) #scale(x: 120%, y: 120%)[\)] lt.eq 2^(dim E \/ 2) e^(- pi R_0^2 N \/ 2) . $

Outside this event, the two scales of $S$ give Equation (4.17); for the second bound use $W_0 subset.eq U$. For a fixed nonzero $w$ in the stated range, condition on every vector except one whose coefficient is nonzero. The remaining vectors produce arbitrary shifts in Lemma 13. Markov’s inequality bounds failure of Equation (4.18) by

$ exp #scale(x: 120%, y: 120%)[\(] - \( c_3 - 2 c_5 \) tau N #scale(x: 120%, y: 120%)[\)] . $

There are at most $\( 3 N^C \)^k$ possible $w$. Choose $c_5 < c_3 \/ 4$ and then $kappa$ so small that

#[#set math.equation(numbering: n => "(4.19)")
 $ \( C + 2 \) kappa < c_5 \/ 2 . $ <eq:lattice-kappa-choice>]

The union of these failures and the norm failures has probability less than one for large $N$, establishing the asserted existence. Notice the order of choices: $gamma \, C$ were fixed first, the constants $c_1 \, c_2 \, c_3 \, c_5$ follow, and only then is $kappa$ chosen. In particular, the dependence of the Fourier constants on $C$ does not affect the positive margin in Equation (4.4).

We have now associated to every violating lattice a set $J$ of at most $gamma N$ coordinates and $k$ vectors satisfying Equations (4.17)–(4.18), together with $B y^g in bb(Z)^m$. The first two conditions will allow a fixed finite description; the last condition will make such a description unlikely for a random matrix.

=== 4.3 Counting fixed descriptions and testing rows <counting-fixed-descriptions-and-testing-rows>

Fix a covering-list member $U$ with $dim U lt.eq \( 1 - alpha \/ 3 \) N$. The region for one vector in Equation (4.17) can be covered by at most

#[#set math.equation(numbering: n => "(4.20)")
 $ N^(\( C + 4 \) dim U) $ <eq:lattice-net-size>]

sets of diameter $4 N^(- C)$. Indeed cover its projection to $U$, a ball of radius at most $R_0 N^(5 \/ 2)$, at scale $N^(- C)$. The entire perpendicular thickness is $2 R_0 N^(- C - 9 \/ 2) = o \( N^(- C) \)$, so it requires no additional covering directions. This also proves the assertion when $dim U = 0$, with one set.

Fix $J$ and one such cell for each of the $k$ vectors. If the cells admit a tuple satisfying Equations (4.17)–(4.18), choose one such tuple and denote it by $hat(y)^1 \, dots.h \, hat(y)^k$. These choices are made independently of $B$: the conditions just imposed involve only the fixed $U \, J$ and the vector coordinates. The representatives need not belong to any dual lattice. Nevertheless, existence of an actual witness in the same cells implies, for every row index $v$ and every $g$,

#[#set math.equation(numbering: n => "(4.21)")
 $ "dist" #scale(x: 120%, y: 120%)[\(] \( B hat(y)^g \)_v \, bb(Z) #scale(x: 120%, y: 120%)[\)] lt.eq 4 N^(- C) sqrt(N) \, $ <eq:lattice-approximate-congruences>]

because $B y^g$ is integral and $lr(bar.v.double B_(v \, *) bar.v.double)_2 lt.eq sqrt(N)$. This passage is what removes the dependence on the unknown lattice from the probability estimate.

Condition on every entry of $B$ except those in the cross block between $J$ and $J^c$. For a row $v in J^c$, the remaining variables are independent bits $\( B_(v i) \)_(i in J)$. For different $v in J^c$ these are disjoint collections of upper-triangular variables, so the row events in Equation (4.21) are conditionally independent.

We bound the probability of one row event by a finite Fourier expansion. Put $M_0 = floor.l N^(C - 2) floor.r$, and define the nonnegative periodic kernel

$ F_(M_0) \( t \) = lr(|1 / M_0 sum_(h = 0)^(M_0 - 1) e^(2 pi i h t)|)^2 . $

On the interval of radius $4 N^(- C) sqrt(N)$ around an integer this kernel is bounded below by a fixed positive constant, since the product of that radius and $M_0$ tends to zero. Its constant Fourier coefficient is $M_0^(- 1)$, its other coefficients have magnitude at most $M_0^(- 1)$, and its frequencies satisfy $\| w \| < M_0$. Apply the product of $k$ such kernels to the row vector $\( \( B hat(y)^g \)_v \)_(g = 1)^k$.

For every nonzero frequency vector $w$, the absolute value of its conditional expectation is bounded by

$ product_(i in J) lr(|phi (sum_(g = 1)^k w_g hat(y)_i^g)|) lt.eq e^(- c_5 tau N) . $

The deterministic contribution from $J^c$ has modulus one. A bit with success probability $b$ has the same characteristic-function modulus as one with success probability $p$, since $\| p + b e^(i t) \|^2 = \| b + p e^(i t) \|^2$. All frequencies in the product kernel fall within Equation (4.18). It follows, for an absolute constant $C_2$, that the row probability is at most

#[#set math.equation(numbering: n => "(4.22)")
 $ C_2^k M_0^(- k) (1 + \( 3 M_0 \)^k e^(- c_5 tau N)) & lt.eq N^(- \( C - 3 \) k) . $ <eq:lattice-row-cost>]

The last inequality uses Equation (4.19); the quantity inside parentheses is bounded, and fixed factors per coordinate are absorbed by one power of $N$.

There are $m - \| J \| gt.eq \( 1 - 2 gamma \) N$ tested rows for large $N$. The conditional independence just noted and Equation (4.22) therefore bound the probability for a fixed $U \, J$, and list of cells by $N^(- \( C - 3 \) \( 1 - 2 gamma \) k N)$. The cell choices cost at most $N^(\( C + 4 \) \( 1 - alpha \/ 3 \) k N)$ by Equation (4.20). There are at most $2^m$ choices of $J$, and at most $2^(N^2 ell^(- P))$ choices of $U$. Consequently the probability of any witness, together with nonsingularity and the prime-corank bound, is at most

$ 2^(m + N^2 ell^(- P)) exp \( - Delta k N log N \) lt.eq exp \( - c_6 tau N^2 \) $

for a fixed $c_6 > 0$. Here $k tilde.op kappa tau N \/ log N$, $Delta > 0$, and $P > D$. Adding the exceptional probability from Lemma 7 still gives $2^(- omega \( N \))$. Every violating lattice supplied a witness in the preceding construction, so this proves Theorem 11.

== 5 Discriminant pairings and the number of admissible columns <sec:pairings>

We now relate the size of $cal(S)_(L_0) \( B \)$ to the cyclic factors of the finite group $G_B = bb(Z)^m \/ B bb(Z)^m$. The estimate will apply when the factors beyond the two largest in each primary component have small total logarithmic size. Layers provide convenient notation for this condition.

=== 5.1 Layers and the static estimate <layers-and-the-static-estimate>

For a finite abelian group $G$, write its $l$-primary part as

$ G_l tilde.equiv xor.big_i bb(Z) \/ l^(b_(l \, i)) bb(Z) \, #h(2em) b_(l \, 1) gt.eq b_(l \, 2) gt.eq dots.h.c gt.eq 0 \, $

where $l$ always denotes a prime and zero exponents are appended. For $j gt.eq 1$, define the #emph[layer height] and its weight by

$ k_G \( l \, j \) = \# { i : b_(l \, i) gt.eq j } \, #h(2em) nu_l = frac(log_N l, N) . $

A layer is a pair $\( l \, j \)$ of positive height. Write $k_B$ for $k_(G_B)$. For $G_B$, and for every quotient of $G_B$, Hadamard’s inequality gives

#[#set math.equation(numbering: n => "(5.1)")
 $ sum_(l \, j) k_G \( l \, j \) nu_l = frac(log_N \| G \|, N) lt.eq 1 / 2 \, #h(2em) m lt.eq N . $ <eq:group-order>]

Indeed, $\| G \| lt.eq \| det B \| lt.eq m^(m \/ 2) lt.eq N^(N \/ 2)$. The trivial group has no layers, so its sums are zero.

For $s gt.eq 0$, define

#[#set math.equation(numbering: n => "(5.2)")
 $ W_s \( B \) = sum_(l \, j) \( k_B \( l \, j \) - s \)_(+) nu_l \, #h(2em) \( x \)_(+) = max { x \, 0 } . $ <eq:tail-potential>]

Two related quantities will distinguish the two cases of the proof:

#[#set math.equation(numbering: n => "(5.3)")
 $ T_2 \( B \) = sum_(k_B \( l \, j \) = 2) nu_l = sum_l \( b_(l \, 2) - b_(l \, 3) \) nu_l \, #h(2em) J_B = sum_(k_B \( l \, j \) gt.eq 3) k_B \( l \, j \) nu_l . $ <eq:pairing-weights>]

Thus $T_2$ counts layers of height exactly two, whereas $J_B$ counts their full heights when the height is at least three. In particular,

#[#set math.equation(numbering: n => "(5.4)")
 $ 0 lt.eq J_B lt.eq 1 / 2 \, #h(2em) J_B lt.eq 3 W_2 \( B \) \, $ <eq:pairing-high-tail>]

since $k lt.eq 3 \( k - 2 \)$ for every integer $k gt.eq 3$. Figure 1 illustrates these distinctions at one prime.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 0), (0.72, 0.66), fill: rgb("#ebebeb"), stroke: none)
  rect((0, 0), (0.72, 0.66), stroke: (paint: rgb("#ffffff"), thickness: 1.0pt, miter-limit: 10))
  rect((0, 0.66), (0.72, 1.32), fill: rgb("#ebebeb"), stroke: none)
  rect((0, 0.66), (0.72, 1.32), stroke: (paint: rgb("#ffffff"), thickness: 1.0pt, miter-limit: 10))
  rect((0, 1.32), (0.72, 1.98), fill: rgb("#ebebeb"), stroke: none)
  rect((0, 1.32), (0.72, 1.98), fill: rgb("#5c939b"), stroke: none)
  rect((0, 1.32), (0.72, 1.98), stroke: (paint: rgb("#ffffff"), thickness: 1.0pt, miter-limit: 10))
  rect((0, 1.98), (0.72, 2.64), fill: rgb("#ebebeb"), stroke: none)
  rect((0, 1.98), (0.72, 2.64), fill: rgb("#5c939b"), stroke: none)
  rect((0, 1.98), (0.72, 2.64), stroke: (paint: rgb("#ffffff"), thickness: 1.0pt, miter-limit: 10))
  content((0.36, 0), [#text(size: 9pt)[$1$]], anchor: "north", padding: 0.1176cm)
  content((0.36, 2.673), [#text(size: 9pt)[$4$]], anchor: "south", padding: 0.1176cm)
  rect((0.72, 0), (1.44, 0.66), fill: rgb("#ebebeb"), stroke: none)
  rect((0.72, 0), (1.44, 0.66), stroke: (paint: rgb("#ffffff"), thickness: 1.0pt, miter-limit: 10))
  rect((0.72, 0.66), (1.44, 1.32), fill: rgb("#ebebeb"), stroke: none)
  rect((0.72, 0.66), (1.44, 1.32), stroke: (paint: rgb("#ffffff"), thickness: 1.0pt, miter-limit: 10))
  rect((0.72, 1.32), (1.44, 1.98), fill: rgb("#ebebeb"), stroke: none)
  rect((0.72, 1.32), (1.44, 1.98), fill: rgb("#5c939b"), stroke: none)
  rect((0.72, 1.32), (1.44, 1.98), stroke: (paint: rgb("#ffffff"), thickness: 1.0pt, miter-limit: 10))
  content((1.08, 0), [#text(size: 9pt)[$2$]], anchor: "north", padding: 0.1176cm)
  content((1.08, 2.013), [#text(size: 9pt)[$3$]], anchor: "south", padding: 0.1176cm)
  rect((1.44, 0), (2.16, 0.66), fill: rgb("#ebebeb"), stroke: none)
  rect((1.44, 0), (2.16, 0.66), stroke: (paint: rgb("#ffffff"), thickness: 1.0pt, miter-limit: 10))
  rect((1.44, 0.66), (2.16, 1.32), fill: rgb("#ebebeb"), stroke: none)
  rect((1.44, 0.66), (2.16, 1.32), stroke: (paint: rgb("#ffffff"), thickness: 1.0pt, miter-limit: 10))
  rect((1.44, 1.32), (2.16, 1.98), fill: rgb("#ebebeb"), stroke: none)
  rect((1.44, 1.32), (2.16, 1.98), fill: rgb("#5c939b"), stroke: none)
  rect((1.44, 1.32), (2.16, 1.98), stroke: (paint: rgb("#ffffff"), thickness: 1.0pt, miter-limit: 10))
  content((1.8, 0), [#text(size: 9pt)[$3$]], anchor: "north", padding: 0.1176cm)
  content((1.8, 2.013), [#text(size: 9pt)[$3$]], anchor: "south", padding: 0.1176cm)
  rect((2.16, 0), (2.88, 0.66), fill: rgb("#ebebeb"), stroke: none)
  rect((2.16, 0), (2.88, 0.66), fill: rgb("#e9b86b"), stroke: none)
  rect((2.16, 0), (2.88, 0.66), stroke: (paint: rgb("#ffffff"), thickness: 1.0pt, miter-limit: 10))
  rect((2.16, 0.66), (2.88, 1.32), fill: rgb("#ebebeb"), stroke: none)
  rect((2.16, 0.66), (2.88, 1.32), fill: rgb("#e9b86b"), stroke: none)
  rect((2.16, 0.66), (2.88, 1.32), stroke: (paint: rgb("#ffffff"), thickness: 1.0pt, miter-limit: 10))
  content((2.52, 0), [#text(size: 9pt)[$4$]], anchor: "north", padding: 0.1176cm)
  content((2.52, 1.353), [#text(size: 9pt)[$2$]], anchor: "south", padding: 0.1176cm)
  rect((2.88, 0), (3.6, 0.66), fill: rgb("#ebebeb"), stroke: none)
  rect((2.88, 0), (3.6, 0.66), stroke: (paint: rgb("#ffffff"), thickness: 1.0pt, miter-limit: 10))
  content((3.24, 0), [#text(size: 9pt)[$5$]], anchor: "north", padding: 0.1176cm)
  content((3.24, 0.693), [#text(size: 9pt)[$1$]], anchor: "south", padding: 0.1176cm)
  line((-0.216, 1.32), (3.816, 1.32), stroke: (paint: rgb("#595959"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((-0.288, 1.32), [#text(size: 9pt)[$s=2$]], anchor: "east", padding: 0.1176cm)
  content((-0.288, 3.102), [#text(size: 9pt)[height]], anchor: "east", padding: 0.1176cm)
  content((1.8, -0.594), [#text(size: 9pt)[layer index $j$]])
  line((1.08, 1.716), (4.392, 2.64), stroke: (paint: rgb("#256f7a"), thickness: 0.8pt, miter-limit: 10))
  content((4.5, 2.64), [#text(size: 9pt)[tail above two:#linebreak()$W_2=4 nu_l$]], anchor: "west", padding: 0.1176cm)
  line((2.592, 1.155), (4.392, 1.419), stroke: (paint: rgb("#b68538"), thickness: 0.8pt, miter-limit: 10))
  content((4.5, 1.419), [#text(size: 9pt)[height exactly two:#linebreak()$T_2= nu_l$]], anchor: "west", padding: 0.1176cm)
  content((4.5, 0.132), [#text(size: 9pt)[full first three columns:#linebreak()$J_B=10 nu_l$]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: Layers for a primary group with cyclic exponents $\( 5 \, 4 \, 3 \, 1 \)$. The column heights are $\( 4 \, 3 \, 3 \, 2 \, 1 \)$. $W_2$ and $J_B$ count selected squares, each of weight $nu_l$, while $T_2$ counts each height-two column once. The four dark squares above the dashed cutoff contribute $4 nu_l$ to $W_2$. The orange column is the unique layer of height exactly two, contributing $nu_l$ to $T_2$. The first three columns have total weight $10 nu_l$ and contribute that amount to $J_B$. ],
) <fig:layers>

We use the slowly varying scales

#[#set math.equation(numbering: n => "(5.5)")
 $ R = ceil.l ell^2 ceil.r \, #h(2em) sigma = R^(- 6) . $ <eq:layer-scales>]

They will also be used in Section 6.

#thm([Proposition 5.1.])[
  (Static column estimate).  #emph[For every fixed $L_0 gt.eq 1$ and $e_0 > 0$, there is a fixed $zeta > 0$ such that, typically for nonsingular bit matrices $B$ of size $m in cal(I)_N$, 
$ W_2 \( B \) lt.eq zeta quad arrow.r.double quad \| cal(S)_(L_0) \( B \) \| lt.eq 2^(e_0 N) . $

]
] <prop:static-column>

The proposition leaves matrices with large $W_2$ for the path argument. Its proof separates according to $T_2$. Layers of height exactly two can force admissible columns into a few subgroups of large index; Theorem 11 then applies. Otherwise a coloring controls the pairing on differences of columns. An arithmetic determinant bound and the spectrum of $B$ then bound the dimension of a large subset of one color. We first develop the pairing argument that distinguishes these two cases.

=== 5.2 Colors and subgroups of large index <colors-and-subgroups-of-large-index>

The #emph[discriminant pairing] of $B$ is

#[#set math.equation(numbering: n => "(5.6)")
 $ lambda_B \( macron(x) \, macron(y) \) = x^(sans(T)) B^(- 1) y med mod med bb(Z) \, #h(2em) macron(x) \, macron(y) in G_B . $ <eq:discriminant-pairing>]

It is well defined because changing either representative by an integer column combination of $B$ changes the value by an integer. It is #emph[perfect]: the map $G_B arrow.r "Hom" \( G_B \, bb(Q) \/ bb(Z) \)$ defined by the pairing is an isomorphism. To see injectivity, an element pairing to zero with every coordinate class satisfies $B^(- 1) x in bb(Z)^m$, so its class is zero; the two finite groups have equal order. Distinct primary components are orthogonal, since their mutual pairing is annihilated by coprime powers. An element is called #emph[isotropic] if its self-pairing is zero. Every $z in cal(S)_(L_0) \( B \)$ has isotropic class, and its primary components are individually isotropic by uniqueness of primary decomposition in $bb(Q) \/ bb(Z)$.

The orthogonal block decomposition of a perfect primary pairing uses cyclic blocks and, at $l = 2$, possible two-generator blocks with equal cyclic exponents. These decompositions are classical; see Miranda [15] Section 1. We use the following precise consequences of the decomposition and the coloring analysis in [17] Lemmas 6.1–6.3.

#thm([Lemma 5.2.])[
  (Coloring input).  #emph[Let $B$ be a nonsingular symmetric integer matrix. For each prime $l$, put $f_l = b_(l \, 3)$. The perfect pairing on $G_(B \, l)$ admits an orthogonal decomposition 
$ G_(B \, l) = U_l xor V_l \, $

 where $U_l$ consists of the blocks with cyclic exponents strictly greater than $f_l$, and the exponent of $V_l$ divides $l^(f_l)$. There are at most two cyclic factors in $U_l$. The isotropic elements of $G_(B \, l)$ can be colored with $C_l$ colors satisfying 
#[#set math.equation(numbering: n => "(5.7)")
 $ C_l lt.eq 1 + 8 b_(l \, 1) \, #h(2em) C_l lt.eq 2^(b_(l \, 2) - b_(l \, 3)) quad upright("if ") l upright(" is odd") \, $ <eq:primary-color-count>]

 such that two elements of one color satisfy 
#[#set math.equation(numbering: n => "(5.8)")
 $ l^(f_l) lambda_B \( x_(U_l) \, y_(U_l) \) = 0 quad upright("in ") bb(Q) \/ bb(Z) . $ <eq:primary-color-pairing>]

 If $X subset G_B$ consists of isotropic elements with one fixed color at every prime, put $H = chevron.l x - y : x \, y in X chevron.r$. Then the image of the #emph[restricted] pairing map 
#[#set math.equation(numbering: n => "(5.9)")
 $ H arrow.r "Hom" \( H \, bb(Q) \/ bb(Z) \) \, #h(2em) u mapsto lambda_B \( u \, dot.op \) \|_H \, $ <eq:restricted-pairing-map>]

 has order at most $N^(N J_B)$.]
] <lem:pairing-colors>

The cutoff in Lemma 15 does not split a block, since the two exponents in each two-generator block are equal. The restriction in Equation (5.9) is essential: the characters are tested on $H$, not on all of $G_B$.

For our purposes the same coloring has another consequence.

#thm([Lemma 5.3.])[
  (A subgroup containing each color).  #emph[For every prime $l$, each primary color in Lemma 15 is contained in a subgroup of $G_(B \, l)$ whose index is at least $l^(b_(l \, 2) - b_(l \, 3))$.]
] <lem:color-subgroup>

#proof[
  Write $f = f_l$ and $U = U_l$. Multiply the perfect pairing on $U$ by $l^f$, and quotient $U$ by the radical of this new pairing. The resulting pairing on a group $macron(U)$ is perfect. Its order is
  $ \| macron(U) \| = l^(sum_i \( b_(l \, i) - f \)_(+)) . $
  Indeed, under the original perfect pairing the new radical is $U \[ l^f \] = { u in U : l^f u = 0 }$, and each cyclic factor of exponent $b > f$ leaves a quotient of order $l^(b - f)$. By Equation (5.8), the images of one color generate a subgroup $A subset macron(U)$ with $A subset A^perp$. Perfectness gives $\| A \| thin \| A^perp \| = \| macron(U) \|$, so
  $ \[ macron(U) : A \] gt.eq \| macron(U) \|^(1 \/ 2) = l^(1 / 2 sum_i \( b_(l \, i) - f \)_(+)) gt.eq l^(b_(l \, 2) - f) . $
  Take the preimage of $A$ in $U$, and add the unrestricted summand $V_l$. This subgroup contains the entire primary color and has the required index. The argument also covers $U = 0$, when the asserted index is one. ◻
]

The next counting step controls the price of specifying colors. It uses both bounds in Equation (5.7): the odd-prime bound is efficient before a weight threshold is reached, and the polynomial bound controls the prime that crosses it.

#thm([Lemma 5.4.])[
  (Cost of specifying colors).  #emph[Uniformly over nonsingular symmetric bit matrices of size at most $N$, the following hold as $N arrow.r oo$.]
  + #emph[If $T_2 \( B \) gt.eq sigma$, there is a set of primes $cal(P)$ such that 
$ sum_(l in cal(P)) \( b_(l \, 2) - b_(l \, 3) \) nu_l gt.eq sigma \, #h(2em) sum_(l in cal(P)) log_2 C_l = o \( N \) . $

]
  + #emph[If $T_2 \( B \) < sigma$, then $sum_l log_2 C_l = o \( N \)$.]
] <lem:color-cost>

#proof[
  The group-order bound gives $b_(l \, 1) lt.eq \( N \/ 2 \) log_2 N$, so the first bound in Equation (5.7) costs $O \( log N \)$ bits per prime. All primes $l lt.eq sqrt(N)$ together therefore cost $O \( sqrt(N) log N \) = o \( N \)$. For larger primes, $nu_l > 1 \/ \( 2 N \)$; they are odd for large $N$, and hence
  #[#set math.equation(numbering: n => "(5.10)")
   $ sum_(l in cal(P) \, med l > sqrt(N)) log_2 C_l lt.eq sum_(l in cal(P) \, med l > sqrt(N)) \( b_(l \, 2) - b_(l \, 3) \) lt.eq 2 N sum_(l in cal(P) \, med l > sqrt(N)) \( b_(l \, 2) - b_(l \, 3) \) nu_l . $ <eq:large-prime-color-cost>]
  For (i), first include every contributing prime at most $sqrt(N)$. If their total weight is below $sigma$, add larger contributing primes until that threshold is first reached. Before the last prime, Equation (5.10) costs at most $2 sigma N$ bits. Charge the last prime only $O \( log N \)$ bits using the first color bound, regardless of its weight. The total is $o \( N \)$, since $sigma arrow.r 0$. For (ii), Equation (5.10) applies to all large primes with total cost at most $2 sigma N$; the small-prime cost is unchanged. ◻
]

Fix $0 < alpha < min { e_0 \, 1 }$, and impose the typical event of Theorem 11 with $D = 20$. Since $tau = ell^(- 20) = o \( sigma \)$, the preceding lemmas settle all matrices with $T_2 \( B \) gt.eq sigma$. In fact, specify colors only at the primes selected in Lemma 17(i). There are $2^(o \( N \))$ resulting parts of $cal(S)_(L_0) \( B \)$. By Lemma 16, each part lies in the preimage $K subset bb(Z)^m$ of a subgroup of $G_B$ with

$ B bb(Z)^m subset K subset bb(Z)^m \, #h(2em) \[ bb(Z)^m : K \] gt.eq N^(sigma N) gt.eq N^(tau N) . $

Theorem 11 bounds its size by $2^(alpha N)$. Consequently

#[#set math.equation(numbering: n => "(5.11)")
 $ \| cal(S)_(L_0) \( B \) \| lt.eq 2^(alpha N + o \( N \)) lt.eq 2^(e_0 N) $ <eq:height-two-columns>]

for sufficiently large $N$. This argument uses the theorem’s simultaneity over all lattices: the color subgroups may depend on $B$.

=== 5.3 A lattice of graph differences <a-lattice-of-graph-differences>

It remains to control the column set when $T_2 \( B \) < sigma$. The color cost is then subexponential. We first show how two real-matrix estimates would bound the dimension of a large part of one color; their probabilistic proofs will follow the comparison.

A nonempty finite set $cal(A)$ is #emph[$rho$-robust] on its affine span $F$ if every affine subspace $E subset F$ of codimension $t$ satisfies

$ \| cal(A) ∩ E \| lt.eq 2^(- rho t) \| cal(A) \| . $

We use the following two geometric inputs from [17] Lemmas 3.7 and 3.8.

#thm([Lemma 5.5.])[
  (Robust extraction).  #emph[If $diameter eq.not cal(A) subset { 0 \, 1 }^m$ and $rho > 0$, there is an affine subspace $E$ for which the nonempty set $cal(V) = cal(A) ∩ E$ is $rho$-robust on its affine span and satisfies 
$ log_2 \| cal(V) \| gt.eq log_2 \| cal(A) \| - rho m . $

]
] <lem:robust-extraction>

#thm([Lemma 5.6.])[
  (Determinant of a robust image lattice).  #emph[Fix $D \, C_0 > 0$ and put $rho = ell^(- D)$. Let $diameter eq.not cal(V) subset { 0 \, 1 }^m$, $m lt.eq N$, be $rho$-robust on its affine span $F$, of dimension $r$. Let $Phi : F arrow.r bb(R)^d$ be an injective rational affine map such that 
$ lr(bar.v.double Phi \( v \) - Phi \( w \) bar.v.double)_2 lt.eq C_0 sqrt(N) #h(2em) \( v \, w in cal(V) \) . $

 Then the integer span of its image differences is a rank-$r$ lattice of covolume at most $exp \( O_(D \, C_0) \( N ell \) \)$. Also $H \( "span" \( cal(V) - cal(V) \) \) lt.eq exp \( O_D \( N ell \) \)$. The covolumes in rank zero are one.]
] <lem:robust-image>

For a symmetric matrix $C$ and a linear subspace $F subset.eq bb(R)^m$, the notation $C \|_F$ denotes the restriction of its bilinear form to $F times F$, rather than the restriction of the associated linear map. Its radical is

$ "rad" \( C \|_F \) = { x in F : x^(sans(T)) C y = 0 upright(" for every ") y in F } . $

Its dimension is the nullity $dim F - "rank" \( C \|_F \)$.

We will also use a determinant consequence of a finite pairing image. We include its short proof to make clear why the image order enters to the first power; this is [17] Lemma 6.4.

#thm([Lemma 5.7.])[
  (Pairing image and determinant).  #emph[Let $L$ be a lattice spanning a Euclidean space $V$, and let $q$ be a symmetric bilinear form with $q \( L \, L \) subset bb(Q)$. Set 
$ K = L ∩ "rad" q \, #h(2em) S = V ∩ \( "rad" q \)^perp . $

 If the image of $L arrow.r "Hom" \( L \, bb(Q) \/ bb(Z) \)$, $x mapsto q \( x \, dot.op \) med mod med bb(Z)$, has order $t$, then 
#[#set math.equation(numbering: n => "(5.12)")
 $ \| det_(upright("orth")) \( q \|_S \) \| gt.eq frac(\( det K \)^2, t \( det L \)^2) . $ <eq:pairing-det>]

 The determinant on the left is in an orthonormal basis of $S$.]
] <lem:pairing-determinant>

#proof[
  The matrix of $q$ in a lattice basis is rational. Its radical therefore has a rational basis, so $K$ spans the radical and is primitive in $L$. The orthogonal projection $macron(L)$ of $L$ onto $S$ is a lattice, and $det L = det K det macron(L)$. The form descends to $macron(L)$ with the same pairing image order, because pullback of characters along $L arrow.r macron(L)$ is injective.
  Let $M$ be the nonsingular matrix of the descended form in a basis of $macron(L)$. Its pairing kernel modulo $bb(Z)$ in the coordinate lattice has index $t$. If $A$ is an integer basis matrix for that kernel, then $\| det A \| = t$ and $A^(sans(T)) M$ is integral and nonsingular. Thus
  $ 1 lt.eq \| det \( A^(sans(T)) M \) \| = t \| det M \| . $
  Changing from the lattice basis to an orthonormal basis divides this determinant by $\( det macron(L) \)^2$, which proves Equation (5.12). If $S$ has dimension zero, then $K = L$ and $t = 1$, so both sides of Equation (5.12) are one. ◻
]

#thm([Lemma 5.8.])[
  (The graph comparison).  #emph[Fix $L_0 gt.eq 1$ and $xi \, w > 0$. Suppose that $B$ is a nonsingular symmetric bit matrix of size $m in cal(I)_N$, with $T_2 \( B \) < sigma$, and that the following hold:]
  + #emph[for every rational $F subset.eq bb(R)^m$ of height at most $exp \( N ell^2 \)$, $"rank" \( B^(- 1) \|_F \) gt.eq dim F - xi N$;]
  + #emph[at most $xi N$ eigenvalues of $B$ lie in $\[ - w sqrt(N) \, w sqrt(N) \]$.]
  #emph[Then 
$ \| cal(S)_(L_0) \( B \) \| lt.eq 2^(\( 2 J_B + 2 xi + o \( 1 \) \) N) \, $

 where the error tends to zero uniformly over these matrices, for fixed $L_0 \, xi \, w$.]
] <lem:graph-comparison>

#proof[
  The assertion is immediate if $cal(S)_(L_0) \( B \)$ is empty. Choose a largest overall color $cal(A)$ of the column set, and apply Lemma 18 with $rho = ell^(- 2)$. For the resulting set $cal(V)$, Lemma 17(ii) gives
  #[#set math.equation(numbering: n => "(5.13)")
   $ log_2 \| cal(S)_(L_0) \( B \) \| lt.eq log_2 \| cal(V) \| + o \( N \) . $ <eq:robust-column-size>]
  Put $F_0 = "span" \( cal(V) - cal(V) \)$ and $r_0 = dim F_0$. We place each column beside its inverse image: the norm condition keeps differences short, while the first coordinates remain integral. The induced graph metric will also control the inverse form near small eigenvalues of $B$. Define the rational graph map and its difference lattice
  $ gamma \( x \) = \( x \, B^(- 1) x \) \, #h(2em) L = chevron.l gamma \( v \) - gamma \( v' \) : v \, v' in cal(V) chevron.r_(bb(Z)) subset gamma \( F_0 \) . $
  The graph differences satisfy
  $ lr(bar.v.double gamma \( v \) - gamma \( v' \) bar.v.double)_2^2 lt.eq m + 4 L_0^2 N lt.eq \( 1 + 4 L_0^2 \) N . $
  Lemma 19, applied both to the graph map and to the identity map, consequently gives
  #[#set math.equation(numbering: n => "(5.14)")
   $ det L lt.eq exp \( O_(L_0) \( N ell \) \) \, #h(2em) H \( F_0 \) lt.eq exp \( O \( N ell \) \) lt.eq exp \( N ell^2 \) $ <eq:graph-height>]
  for sufficiently large $N$.
  On the full graph $Gamma = gamma \( bb(R)^m \)$, define the rational symmetric form
  $ q \( gamma \( x \) \, gamma \( y \) \) = x^(sans(T)) B^(- 1) y . $
  Its restriction to $gamma \( F_0 \)$ has rank $s$ satisfying
  #[#set math.equation(numbering: n => "(5.15)")
   $ s gt.eq r_0 - xi N $ <eq:graph-rank>]
  by the first hypothesis and Equation (5.14). The hypothesis covers every subspace of this height, including $F_0$, which was selected from admissible columns for $B$.
  The map $L arrow.r G_B$ taking $gamma \( u \)$ to $u + B bb(Z)^m$ has image
  $ H = chevron.l macron(v) - macron(v)' : v \, v' in cal(V) chevron.r . $
  It is surjective onto $H$, and the form modulo $bb(Z)$ is the pullback of the restricted pairing on $H$. Pullback of characters is injective, so the two pairing maps have equal image orders. Lemma 15 bounds this order by $N^(N J_B)$. Let $K$ be the radical lattice of the restriction to $gamma \( F_0 \)$, and let $S$ be its radical’s orthogonal complement in that space. The first-coordinate projection is injective on $Gamma$ and takes $K$ to an integer lattice of the same rank. Such a lattice has covolume at least one, and orthogonal projection contracts volumes. Hence $det K gt.eq 1$. Lemma 20 now yields
  #[#set math.equation(numbering: n => "(5.16)")
   $ \| det_(upright("orth")) \( q \|_S \) \| gt.eq N^(- N J_B) exp \( - O_(L_0) \( N ell \) \) . $ <eq:graph-det-lower>]
  The same determinant admits an upper bound from the spectrum of $B$. If $v$ is a unit eigenvector with nonzero eigenvalue $x$, its graph vector has squared norm $1 + x^(- 2)$, while $q \( gamma \( v \) \, gamma \( v \) \) = x^(- 1)$. Orthogonal eigenvectors of $B$ have orthogonal graph vectors. Thus the eigenvalues of the self-adjoint operator representing $q$ on $Gamma$ are
  $ frac(x, 1 + x^2) . $
  They have absolute value at most one. By the second hypothesis, all but at most $xi N$ of them have absolute value at most $C_w \/ sqrt(N)$, where $C_w = 1 \/ w$.
  The absolute determinant of the compression of a self-adjoint operator to any $s$-dimensional subspace is at most the product of its largest $s$ singular values. Indeed, it is $chevron.l omega \, \( and.big^s T \) omega chevron.r$, where $omega$ is the unit exterior product of an orthonormal basis of the subspace. Applying this to $S$, whose dimension is $s$, gives
  #[#set math.equation(numbering: n => "(5.17)")
   $ \| det_(upright("orth")) \( q \|_S \) \| lt.eq (C_w / sqrt(N))^(\( s - xi N \)_(+)) . $ <eq:graph-det-upper>]
  This argument applies to indefinite forms and includes $s = 0$. Combining Equations (5.16) and (5.17), and then using Equation (5.15), gives
  $ \( s - xi N \)_(+) (1 / 2 log N - log C_w) lt.eq N J_B log N + O_(L_0) \( N ell \) \, #h(2em) r_0 / N lt.eq 2 J_B + 2 xi + o \( 1 \) . $
  The second bound also holds when $s < xi N$.
  Finally, projection to $r_0$ suitable coordinates is injective on the affine span of $cal(V)$, so $\| cal(V) \| lt.eq 2^(r_0)$. Equation (5.13) and the preceding dimension bound imply
  $ 1 / N log_2 \| cal(S)_(L_0) \( B \) \| lt.eq 2 J_B + 2 xi + o \( 1 \) . $
  The error is bounded by $O_(L_0 \, w) \( ell^(- 2) + sigma + N^(- 1 \/ 2) log N + ell \/ log N \)$. The first three terms come from extraction and colors, and the last from the determinant comparison, using $J_B lt.eq 1 \/ 2$. This establishes the asserted uniformity. ◻
]

=== 5.4 Uniform rank and spectral estimates <uniform-rank-and-spectral-estimates>

Lemma 21 identifies the two remaining probabilistic requirements: inverse forms must retain rank on every low-height span, and most eigenvalues must stay away from zero at scale $sqrt(N)$. We now verify both requirements for the biased bit model. The arguments adapt [17] Corollary 5.2 and Proposition 5.4 to the biased arrays. The rank estimate uses the atom bound $b$; the spectral estimate uses the common variance $p b$ and the rank-two bound on the mean.

==== 5.4.1 Inverse forms on low-height subspaces <inverse-forms-on-low-height-subspaces>

#thm([Proposition 5.9.])[
  (Uniform inverse restriction rank).  #emph[For every fixed $D > 0$ and $xi > 0$, typically every nonsingular bit matrix $B$ satisfies, simultaneously for all rational subspaces $F subset.eq bb(R)^m$ with $H \( F \) lt.eq exp \( N ell^D \)$, 
$ "rank" \( B^(- 1) \|_F \) gt.eq dim F - xi N . $

]
] <prop:inverse-rank>

#proof[
  First fix an arbitrary real subspace $U subset.eq bb(R)^m$ of dimension $d$. Choose a basis matrix $V$ and a coordinate set $I$ of size $d$ so that $V_I$ is the identity matrix. Conditional on all entries of $B$ outside the principal block $I times I$, the matrix of $B \|_U$ in this basis is
  $ V^(sans(T)) B V = B_(I \, I) + H \, $
  where $H$ is a fixed symmetric matrix. The unrevealed entries of $B_(I \, I)$ are independent bits, each with largest atom $b$. Equation (3.1) therefore shows that
  #[#set math.equation(numbering: n => "(5.18)")
   $ bb(P) #scale(x: 120%, y: 120%)[\(] dim "rad" \( B \|_U \) gt.eq ceil.l xi N \/ 2 ceil.r #scale(x: 120%, y: 120%)[\)] lt.eq 2^(- c_(p \, xi) N^2) $ <eq:fixed-restriction-tail>]
  for all sufficiently large $N$; the event is empty if $d < ceil.l xi N \/ 2 ceil.r$.
  For a fixed symmetric form, restricted nullity changes by at most $d \( U \, V \)$ when $U$ is replaced by $V$. To check this, if $Z subset.eq U$ has codimension $t$, restriction deletes $t$ rows and $t$ columns of a representing matrix. The rank decreases by an amount between zero and $2 t$, so the nullity changes by at most $t$. Apply this first to $Z = U ∩ V$ inside $U$, then inside $V$.
  Apply Theorem 8 with the given $D$ and any fixed $P > 0$. Use Equation (5.18) for the orthogonal complement of every member of its list. The union of all failures has probability at most
  $ 2^(N^2 ell^(- P) - c_(p \, xi) N^2) = 2^(- Omega_(p \, xi) \( N^2 \)) . $
  Outside this event, approximate a given $F$ by a list member. The nullity comparison and preservation of distance under orthocomplements give
  $ dim "rad" \( B \|_(F^perp) \) < ceil.l xi N \/ 2 ceil.r + N ell^(- P) lt.eq xi N $
  for large $N$. For nonsingular $B$, the two radicals satisfy
  $ "rad" \( B \|_(F^perp) \) = F^perp ∩ B^(- 1) F \, #h(2em) "rad" \( B^(- 1) \|_F \) = F ∩ B \( F^perp \) . $
  Multiplication by $B$ is an isomorphism from the first space onto the second. Their equal dimensions prove the proposition. ◻
]

==== 5.4.2 Few eigenvalues near zero <few-eigenvalues-near-zero>

The preceding argument controls exact nullity on many subspaces. We also need a metric statement: only a small fraction of the eigenvalues can be much smaller than $sqrt(N)$. The rank assumption on the mean enters precisely here.

#thm([Proposition 5.10.])[
  (Small-spectrum bound).  #emph[For every fixed $xi > 0$, there is $w_xi > 0$, depending also on $p$, such that typically a bit matrix $B$ has at most $xi N$ eigenvalues, counted with multiplicity, in 
$ \[ - w_xi sqrt(N) \, w_xi sqrt(N) \] . $

 Nonsingularity is not required. The exceptional probability is at most $exp \( - c_(p \, xi) N^2 \)$.]
] <prop:small-spectrum>

#proof[
  Set
  $ X = frac(B - bb(E) B, sqrt(m p b)) \, #h(2em) mu_X = 1 / m sum_(i = 1)^m delta_(lambda_i \( X \)) . $
  We first verify that the expected measures $bb(E) mu_X$ converge uniformly over the permitted arrays to the semicircle law
  $ d mu_(upright("sc")) \( x \) = frac(1, 2 pi) sqrt(4 - x^2) thin upright(bold(1))_({ \| x \| lt.eq 2 }) thin d x . $
  This is the fixed-moment argument for Wigner’s law [23]. The centered, variance-standardized entries $\( B_(i j) - bb(E) B_(i j) \) \/ sqrt(p b)$ have mean zero, variance one, and uniformly bounded moments of every fixed order. Expand $m^(- 1) bb(E) "Tr" X^s$ as a sum over closed walks of length $s$. Independence makes a summand zero whenever an unordered edge is used exactly once. Every remaining walk has at most $s \/ 2$ distinct edges and at most $1 + s \/ 2$ vertices. For each fixed walk pattern with $v < 1 + s \/ 2$ vertices, its contribution is $O_(p \, s) \( m^(v - 1 - s \/ 2) \) = o \( 1 \)$. Equality is possible only when $s$ is even and the walk traverses each edge of a tree twice. Each such pattern contributes $1 + o \( 1 \)$, since it uses only variances, and there are $\( s \/ 2 + 1 \)^(- 1) binom(s, s \/ 2)$ patterns. There are finitely many patterns for fixed $s$, so the errors are uniform. The limiting moments are those of $mu_(upright("sc"))$; its compact support makes them determinate. The method of moments proves the asserted weak convergence, uniformly by applying the same argument to any sequence of permitted arrays.
  Choose a fixed $w > 0$, sufficiently small in terms of $xi$, and put
  $ f \( x \) = \( 1 - \| x \| \/ w \)_(+) . $
  The semicircle mass of $\[ - w \, w \]$ tends to zero with $w$, so the convergence just proved gives, for sufficiently large $N$,
  #[#set math.equation(numbering: n => "(5.19)")
   $ bb(E) "Tr" f \( X \) lt.eq xi m \/ 16 . $ <eq:typical-tent-mean>]
  To obtain a much stronger probability estimate than moment convergence alone provides, write
  $ f = 1 - g_1 + g_2 \, #h(2em) g_1 \( x \) = \| x \| \/ w \, quad g_2 \( x \) = \( \| x \| \/ w - 1 \)_(+) . $
  Both functions are convex and $1 \/ w$-Lipschitz, and their matrix traces are convex functions of the entries. If $M_(+)$ denotes the spectral positive part of $M$, then $"Tr" M_(+) = sup_(0 prec.curly.eq P prec.curly.eq I) "Tr" \( P M \)$ for symmetric $M$; expressing the two traces as sums of positive-part traces proves convexity directly.
  Let $y$ denote the independent upper-triangular coordinates, and write $X \( y \)$ for the corresponding centered, normalized matrix. The Hoffman–Wielandt inequality [9] Theorem 1 and Cauchy–Schwarz give, for $j = 1 \, 2$,
  $ lr(|"Tr" g_j \( X \( y \) \) - "Tr" g_j \( X \( y' \) \)|) lt.eq sqrt(m) / w lr(bar.v.double X \( y \) - X \( y' \) bar.v.double)_F lt.eq 1 / w sqrt(frac(2, p b)) lr(bar.v.double y - y' bar.v.double)_2 . $
  Here $lr(bar.v.double dot.op bar.v.double)_F$ is the Frobenius norm, and the factor $2$ accounts for reflecting off-diagonal entries. The convex Lipschitz consequence of Talagrand’s convex-distance inequality [19] Theorem 4.1.1 applies to independent coordinates in $\[ 0 \, 1 \]$ with arbitrary distributions: if $F$ is convex and $L$-Lipschitz, then
  $ bb(P) \( \| F - bb(E) F \| > t \) lt.eq C exp \( - c t^2 \/ L^2 \) . $
  The usual median formulation implies this expectation formulation by integrating the tail and adjusting the absolute constants. Applying it to the two convex traces, with deviations $xi m \/ 32$, and using Equation (5.19), gives
  $ bb(P) #scale(x: 120%, y: 120%)[\(] "Tr" f \( X \) > xi m \/ 8 #scale(x: 120%, y: 120%)[\)] lt.eq C exp \( - c_(p \, xi \, w) m^2 \) . $
  On the complementary event, $f gt.eq 1 \/ 2$ on $\[ - w \/ 2 \, w \/ 2 \]$ implies that at most $xi m \/ 4$ eigenvalues of $X$ lie in this interval. The matrix $B \/ sqrt(m p b)$ differs from $X$ by a matrix of rank at most two. Interlacing changes the count in any interval by at most four. Taking, for example, $w_xi = w sqrt(p b) \/ 4$, we have $w_xi sqrt(N \/ \( m p b \)) lt.eq w \/ 2$ for large $N$, uniformly in $m in cal(I)_N$. The requested eigenvalue count is therefore at most $xi m \/ 4 + 4 lt.eq xi N$. ◻
]

#proof[
  Fix $L_0 gt.eq 1$ and $e_0 > 0$. Choose fixed $xi \, zeta > 0$ with $6 zeta + 2 xi < e_0$. Intersect the typical event used for Equation (5.11) with the events in Propositions 22 and 23, taking height exponent $D = 2$ and error $xi$. The latter proposition supplies a fixed $w_xi > 0$. This finite intersection is still typical, uniformly in the permitted models and sizes.
  Let $B$ be nonsingular on this event, with $W_2 \( B \) lt.eq zeta$. If $T_2 \( B \) gt.eq sigma$, Equation (5.11) already gives the required bound. Otherwise apply Lemma 21 with $w = w_xi$. Equation (5.4) gives
  $ \| cal(S)_(L_0) \( B \) \| lt.eq 2^(\( 2 J_B + 2 xi + o \( 1 \) \) N) lt.eq 2^(\( 6 zeta + 2 xi + o \( 1 \) \) N) lt.eq 2^(e_0 N) $
  for all sufficiently large $N$. This proves the proposition. ◻
]

== 6 Two column constraints along a path of principal minors <sec:paths>

Proposition 14 bounds the admissible columns when $W_2$ is small. We now show that a terminal matrix with large $W_2$ must encounter two rare column constraints along a short path of principal minors. Each constraint costs almost $b^N$, giving the exceptional probability required in Proposition 5. The principal-minor method and its layer recursion come from [17] Sections 7 and 11. We first state the deterministic inputs, then give the probability estimates for biased columns.

=== 6.1 Principal extensions and retained layers <principal-extensions-and-retained-layers>

A principal extension of width $h in { 1 \, 2 }$ has the form

#[#set math.equation(numbering: n => "(6.1)")
 $ B = mat(delim: "(", C, V; V^(sans(T)), D) \, #h(2em) V = \( v_1 med dots.h.c med v_h \) \, $ <eq:path-extension>]

where $C$ is nonsingular and $D$ is symmetric. At width two we impose the #emph[gate]

#[#set math.equation(numbering: n => "(6.2)")
 $ v_1 \, v_2 in cal(S)_(L_0) \( C \) . $ <eq:path-gate>]

There is no gate at width one. The following elementary fact ensures that every nonsingular bit matrix can be reached by a path with these gates.

#thm([Lemma 6.1.])[
  (Gated deletion, [17] Lemma 7.1).  #emph[Let $B$ be a nonsingular symmetric bit matrix of positive size. The empty principal minor has determinant one, and its admissible column set consists of the unique empty column. Either some one-coordinate principal deletion is nonsingular, or a two-coordinate principal deletion gives a nonsingular matrix $C$ for which both deleted cross columns satisfy 
$ v_i^(sans(T)) C^(- 1) v_i in { 0 \, 1 } \, #h(2em) lr(bar.v.double C^(- 1) v_i bar.v.double)_oo lt.eq 1 quad \( i = 1 \, 2 \) . $

 In particular, whenever the sizes belong to $cal(I)_N$, the two-coordinate move satisfies Equation (6.2).]
] <lem:path-deletion>

#proof[
  The cofactor identity gives the first alternative if some diagonal entry of $B^(- 1)$ is nonzero. Otherwise choose distinct $i \, j$ maximizing the absolute value of an entry of $B^(- 1)$, and write $kappa = \( B^(- 1) \)_(i j) eq.not 0$. The corresponding principal block is $mat(delim: "(", 0, kappa; kappa, 0)$. Jacobi’s complementary minor identity makes the complementary matrix $C$ nonsingular. In the block notation of Equation (6.1), its Schur complement $T = D - V^(sans(T)) C^(- 1) V$ satisfies
  $ T^(- 1) = mat(delim: "(", 0, kappa; kappa, 0) \, #h(2em) \( B^(- 1) \)_(I \, { i \, j }) = - C^(- 1) V T^(- 1) \, $
  where $I$ is the set of remaining indices. The diagonal of $T$ vanishes, giving the two quadratic identities. The two columns of the inverse block on the right are $- kappa C^(- 1) v_2$ and $- kappa C^(- 1) v_1$. Their entries have absolute value at most $\| kappa \|$, proving the norm bound. Finally $lr(bar.v.double C^(- 1) v_i bar.v.double)_2 lt.eq sqrt("size" \( C \)) lt.eq sqrt(N) lt.eq L_0 sqrt(N)$. ◻
]

For an extension with nonsingular start $C$, define the successive quotients

#[#set math.equation(numbering: n => "(6.3)")
 $ G_0 = G_C \, #h(2em) G_i = bb(Z)^m \/ \( C bb(Z)^m + bb(Z) v_1 + dots.h.c + bb(Z) v_i \) = G_(i - 1) \/ chevron.l overline(v)_i chevron.r quad \( 1 lt.eq i lt.eq h \) \, $ <eq:path-quotients>]

where $m = "size" \( C \)$. These groups are defined even if the endpoint $B$ is singular. In a one-element quotient, each layer height drops by zero or one. A positive layer whose height does not drop is called #emph[retained]. A #emph[plateau] is a maximal interval of consecutive layers of equal positive height at one prime. On each plateau, the retained layers form a prefix, possibly empty. These facts are Lemma 7.3 of [17]; for example the prefix assertion follows because quotient heights are nonincreasing and can only equal the original height or one less.

Here are the remaining group-theoretic inputs in the precise form needed below.

#thm([Lemma 6.2.])[
  (Retention lattices and tail recursion).  #emph[Let $C$ be a nonsingular symmetric bit matrix of size $m lt.eq N$.]
  + #emph[Let $pi : bb(Z)^m arrow.r.twohead G$ be a quotient map with $C bb(Z)^m subset.eq ker pi$. For any set $cal(D)$ of positive layers of $G$, there is a lattice $K_(cal(D))$, fixed by $pi \, G \, cal(D)$, such that 
#[#set math.equation(numbering: n => "(6.4)")
 $ C bb(Z)^m subset.eq K_(cal(D)) subset.eq bb(Z)^m \, #h(2em) \[ bb(Z)^m : K_(cal(D)) \] = N^(N q \( cal(D) \)) \, quad q \( cal(D) \) = sum_(\( l \, j \) in cal(D)) k_G \( l \, j \) nu_l . $ <eq:path-retention-lattice>]

 If every layer in $cal(D)$ is retained on quotienting by $pi \( v \)$, then $v in K_(cal(D))$.]
  + #emph[Suppose the extension in Equation (6.1) also has nonsingular endpoint $B$. Then $k_B \( l \, j \) lt.eq k_C \( l \, j \) + h$ for every layer. Writing $cal(R)_i$ for the retained layers in $G_(i - 1) arrow.r G_i$, for every integer $s gt.eq h$ we have 
#[#set math.equation(numbering: n => "(6.5)")
 $ W_s \( B \) lt.eq W_(s + h) \( C \) + 2 sum_(i = 1)^h sum_(\( l \, j \) in cal(R)_i\
k_(G_(i - 1)) \( l \, j \) gt.eq s + 1 - h) nu_l . $ <eq:path-tail-recursion>]

]
] <lem:path-algebra>

#proof[
  #emph[Source and interpretation.] Part (i) is the Retention lattice lemma [17] Lemma 7.4, including arbitrary, nonconsecutive sets of layers. Part (ii) is the Tail recursion lemma [17] Lemma 11.1 together with common-quotient interlacing [17] Equation (7.11). For the latter, projection onto the old coordinates identifies $G_h$ with the quotient of $G_B$ by the $h$ new coordinate classes. Since a one-element quotient lowers each height by at most one, $k_B lt.eq k_(G_h) + h lt.eq k_C + h$. The stronger recursion uses symmetry through the Symmetric kernel inequality [17] Lemma 7.5; it needs no assumption on the entry distribution. All of these statements therefore apply to the present biased model. ◻
]

=== 6.2 The cost of retaining layers <the-cost-of-retaining-layers>

Fix $L_0 gt.eq 1$, a sufficiently small fixed $e_0 > 0$, and the corresponding $zeta > 0$ in Proposition 14. Recall $R = ceil.l ell^2 ceil.r$ and $sigma = R^(- 6)$. Call an extension #emph[costly] if, in at least one of its quotient operations,

#[#set math.equation(numbering: n => "(6.6)")
 $ sum_(\( l \, j \) in cal(R)_i) nu_l gt.eq sigma . $ <eq:path-costly-definition>]

We use this name only for the condition in Equation (6.6).

In all column estimates, the information already exposed fixes the start $C$, and possibly a preceding column of the same width-two extension. The next column has independent bit entries with success probabilities $p$ or $b$. The quotient map is thus fixed before the next column is tested.

#thm([Lemma 6.3.])[
  (Almost full cost of retention).  #emph[Typically for nonsingular $C$ with size in $cal(I)_N$, conditional on $C$, the probability that an independent principal extension of either width is costly is at most 
#[#set math.equation(numbering: n => "(6.7)")
 $ p_N := 2^(- N \( a - 2 e_0 \)) . $ <eq:path-retention-cost>]

 For one specified column, the probability that its retained weight is at least $sigma$ obeys the same bound, also after exposing the preceding column of a width-two extension. Also, typically, when $W_2 \( C \) lt.eq zeta$, the width-two gate has conditional probability at most $p_N^2$.]
] <lem:path-retention-cost>

#proof[
  Impose Theorem 11 on $C$ with $tau = ell^(- 20)$ and some fixed $0 < alpha < e_0$. Then $tau = o \( sigma \)$. We show that the retention condition can be covered by $2^(o \( N \))$ selected layer sets, each giving a lattice of index at least $N^(sigma N)$.
  Let $G$ be the group before one column is tested. It is a quotient of $G_C$, so its total height times weight is at most $1 \/ 2$. At a prime $l$, let $d_l$ be its number of plateaus. Distinct positive plateau heights give $d_l^2 lt.eq 2 sum_j k_G \( l \, j \)$, and the group-order bound gives $sum_(l \, j) k_G \( l \, j \) = O \( N log N \)$. Consequently the number of plateaus at primes $l lt.eq sqrt(N)$ is $O \( N^(3 \/ 4) sqrt(log N) \)$, by Cauchy–Schwarz. Each prefix length has $O \( N log N \)$ possible values. Thus the complete retention pattern at these primes can be specified with
  #[#set math.equation(numbering: n => "(6.8)")
   $ O #scale(x: 120%, y: 120%)[\(] N^(3 \/ 4) \( log N \)^(3 \/ 2) #scale(x: 120%, y: 120%)[\)] = o \( N \) $ <eq:path-small-prime-entropy>]
  bits. Include all those retained layers in the selected set.
  If their total weight is below $sigma$, add retained layers at primes $l > sqrt(N)$ until the total first reaches $sigma$. There are at most $N$ candidate layers in this prime range, since each has $nu_l > 1 \/ \( 2 N \)$. At most $ceil.l 2 sigma N ceil.r + 1$ additions suffice. The binomial bound therefore contributes $2^(o \( N \))$ further possibilities. This constructs the claimed cover whenever the retained weight is at least $sigma$.
  For every selected set $cal(D)$, positive heights and Equation (6.4) give $q \( cal(D) \) gt.eq sigma$. The simultaneous cube estimate applies to $K_(cal(D))$, since it contains $C bb(Z)^m$, even when $G$ depends on an earlier column. Each cube point has probability at most $b^m$, where $m = N - o \( N \)$. The one-column probability is therefore at most
  $ 2^(o \( N \)) 2^(alpha N) b^m = 2^(- N \( a - alpha - o \( 1 \) \)) . $
  The slack $alpha < e_0$ absorbs a union over at most two columns and yields Equation (6.7).
  Finally impose Proposition 14 on the start. When $W_2 \( C \) lt.eq zeta$, each column belongs to $cal(S)_(L_0) \( C \)$ with probability at most $2^(e_0 N) b^m$. The two cross columns are independent conditional on $C$, so the gate probability is at most $\( 2^(e_0 N) b^m \)^2 lt.eq p_N^2$. ◻
]

We also need a weaker estimate that applies without typicality. Its role is to prevent a path from carrying substantial weight in very high layers. The elementary counting argument below is the biased version of [17] Lemma 11.2.

#thm([Lemma 6.4.])[
  (Dissociation and a lattice constraint).  #emph[Let $C$ be a nonsingular bit matrix of size $m lt.eq N$, and let $C bb(Z)^m subset.eq K subset.eq bb(Z)^m$ have index $N^(q N)$. If $v$ has independent bit coordinates, each with maximum atom at most $b$, then 
#[#set math.equation(numbering: n => "(6.9)")
 $ bb(P) \( v in K \) lt.eq b^(2 q N \/ 3) . $ <eq:path-fixed-mask-cost>]

]
] <lem:path-dissociation>

#proof[
  Write $g_1 \, dots.h \, g_m$ for the coordinate images in $bb(Z)^m \/ K$. Choose a maximal set of $j$ of these images whose subset sums are all distinct. Such a set is called #emph[dissociated]. Once the other bits are fixed, at most one assignment of these $j$ bits gives zero in the quotient, and that assignment has probability at most $b^j$.
  Maximality says that every $g_i$ is a combination of the selected images with coefficients in ${ - 1 \, 0 \, 1 }$: otherwise adding it would preserve distinct subset sums. Put these coefficients in a $j$-by-$m$ integer matrix $M$, using identity columns at the selected indices. Then $"rank" M = "rank" \( M C \) = j$, and evaluation of the selected images is a surjection $theta : bb(Z)^j arrow.r.twohead bb(Z)^m \/ K$. Every column of $M C$ lies in $ker theta$. Choose $j$ independent such columns; each has norm at most $N sqrt(j)$. The index of their integer span bounds the quotient order, so Hadamard’s inequality gives
  $ N^(q N) lt.eq \( N sqrt(j) \)^j lt.eq N^(3 j \/ 2) . $
  Thus $j gt.eq 2 q N \/ 3$, proving the assertion. If $j = 0$, the quotient is trivial and the same conclusion holds with empty products. ◻
]

For one column with pre-test group $G$, write

#[#set math.equation(numbering: n => "(6.10)")
 $ Q_(upright("hi")) = sum_(\( l \, j \) upright(" retained")\
k_G \( l \, j \) gt.eq R - 1) k_G \( l \, j \) nu_l . $ <eq:path-heavy-weight>]

#thm([Lemma 6.5.])[
  (Cost of heavy retained layers).  #emph[Fix $0 < eta < 1$, and put $q_min = eta \/ \( 100 log N \)$. There is a constant $c_p > 0$ such that, uniformly for $q_min lt.eq q lt.eq 1 \/ 2$, 
#[#set math.equation(numbering: n => "(6.11)")
 $ bb(P) #scale(x: 120%, y: 120%)[\(] Q_(upright("hi")) in \[ q \, 2 q \) divides upright("previous exposure") #scale(x: 120%, y: 120%)[\)] lt.eq 2^(- c_p q N) . $ <eq:path-heavy-cost>]

 This holds whenever the previous exposure fixes a nonsingular start $C$ of size in $cal(I)_N$, and a quotient map to $G$ whose kernel contains $C bb(Z)^m$, while leaving the tested bits independent with success probabilities $p$ or $b$.]
] <lem:path-heavy-cost>

#proof[
  For a fixed set $cal(D)$ of retained layers, the retention lattice and Lemma 27 give cost $2^(- \( 2 a \/ 3 \) q \( cal(D) \) N)$. Enumerate the sets consisting of all retained layers of height at least $R - 1$, with their total height times weight in $\[ q \, 2 q \)$.
  For primes at most $sqrt(N)$, prefix lengths on the eligible plateaus specify the set. Equation (6.8) costs
  $ O #scale(x: 120%, y: 120%)[\(] N^(3 \/ 4) \( log N \)^(3 \/ 2) #scale(x: 120%, y: 120%)[\)] = o \( N \/ log N \) = o_eta \( q N \) $
  bits uniformly over the stated range. At larger primes each eligible layer contributes at least $\( R - 1 \) \/ \( 2 N \)$. There are therefore $O \( N \/ R \)$ eligible layers in total, and a set of weight below $2 q$ contains at most $O \( q N \/ R \)$ of them. The binomial estimate, or the all-subsets bound when $q$ is bounded below, gives logarithmic count
  $ O #h(-0.16667em) (frac(q N, R) #scale(x: 120%, y: 120%)[\(] 1 + log \( 1 \/ q \) #scale(x: 120%, y: 120%)[\)]) = o_eta \( q N \) . $
  Indeed $1 + log \( 1 \/ q \) = O_eta \( ell \)$, $R asymp ell^2$, and $q N \/ R arrow.r oo$ uniformly, so rounding has no effect. Every counted set has $q \( cal(D) \) gt.eq q$. Its probability cost absorbs both entropy bounds; for instance any fixed $0 < c_p < 2 a \/ 3$ works for all sufficiently large $N$. ◻
]

=== 6.3 Fixed paths and removal of high layers <fixed-paths-and-removal-of-high-layers>

We now turn the column estimates into a bound on terminal matrices. Let

$ H_0 = 2 ceil.l N^(3 \/ 5) ceil.r \, #h(2em) m_(*) = N - 1 . $

Consider all fixed index paths

#[#set math.equation(numbering: n => "(6.12)")
 $ I_0 subset I_1 subset dots.h.c subset I_(H_0) = \[ m_(*) \] \, #h(2em) h_t = \| I_t \\ I_(t - 1) \| in { 1 \, 2 } . $ <eq:path-index-path>]

Fix an ordering of each pair of new indices. At a backward step there are at most $2 N^2$ choices, so the number of paths is at most

#[#set math.equation(numbering: n => "(6.13)")
 $ \( 2 N^2 \)^(H_0) = 2^(O \( N^(3 \/ 5) log N \)) = 2^(o \( N \)) . $ <eq:path-count>]

Every node size belongs to $cal(I)_N$, since at most $2 H_0 = o \( N^(7 \/ 10) \)$ indices are deleted.

Let $cal(T)_m$ be the set of nonsingular size-$m$ matrices satisfying Lemma 7, Proposition 14, and the simultaneous cube property used in Lemma 26. Their exceptional probabilities are uniformly $2^(- omega \( N \))$. Every fixed principal submatrix remains in the bit model: its upper-triangular entries are independent with the prescribed biases, and its mean is a principal submatrix of the original mean, hence has rank at most two. A union bound using Equation (6.13) shows that the probability of any nonsingular node on any path failing these requirements is still $2^(- omega \( N \))$.

For one fixed path, write $B_t = B \[ I_t \]$, and let $cal(A)$ be the event that all its nodes belong to their respective $cal(T)_m$ and every width-two gate holds. Lemma 24, applied backwards $H_0$ times, shows that every nonsingular terminal matrix outside the exceptional event belongs to $cal(A)$ for at least one fixed path.

For the probability estimates, expose a fixed path #emph[forwards]: first $B_0$, then the cross columns and new symmetric block of each extension. Conditional on everything already exposed, a cross column has independent entries of the original prescribed biases. The second cross column of a pair remains independent after the first has been revealed. Future typicality, nonsingularity and gate requirements enter only through the event $cal(A)$.

Call the last $5 R$ steps, together with their $5 R + 1$ nodes, the #emph[terminal window]. We first remove paths with a large $W_R$ anywhere in that window.

#thm([Lemma 6.6.])[
  (Small high-layer tails on the window).  #emph[For every fixed $0 < eta < 1$, each fixed path satisfies 
#[#set math.equation(numbering: n => "(6.14)")
 $ bb(P) #h(-0.16667em) (cal(A) \, max_(H_0 - 5 R lt.eq t lt.eq H_0) W_R \( B_t \) > eta) lt.eq 2^(- Omega_(p \, eta) \( N R \)) . $ <eq:path-high-tail>]

]
] <lem:path-high-tail>

#proof[
  At each tested column form $Q_(upright("hi"))$ from Equation (6.10), and put
  $ tilde(Q) = cases(delim: "{", Q_(upright("hi")) \, & Q_(upright("hi")) gt.eq q_min \,, 0 \, & Q_(upright("hi")) < q_min \,) #h(2em) q_min = frac(eta, 100 log N) . $
  Set $tilde(Q) = 0$ for every cross column of a step with singular start. This defines the quantities on the entire exposure space. At nonsingular starts, $Q_(upright("hi")) lt.eq 1 \/ 2$. For dyadic values $q_j = 2^j q_min lt.eq 1 \/ 2$, Lemma 28 gives, with any fixed $0 < c'_p < c_p \/ 2$,
  #[#set math.equation(numbering: n => "(6.15)")
   $ bb(E) #h(-0.16667em) [2^(c'_p N tilde(Q)) divides upright("previous exposure")] & lt.eq 1 + sum_(j : q_j lt.eq 1 \/ 2) 2^(2 c'_p N q_j) 2^(- c_p N q_j)\
 & lt.eq 1 + 2^(- Omega_(p \, eta) \( N \/ log N \)) . $ <eq:path-heavy-one-moment>]
  The same bound holds at singular starts. There are at most $2 H_0$ tested columns. Successive conditioning, including between columns of a pair, yields
  #[#set math.equation(numbering: n => "(6.16)")
   $ bb(E) thin 2^(c'_p N sum tilde(Q)) lt.eq 1 + o \( 1 \) . $ <eq:path-heavy-total-moment>]
  On $cal(A)$, suppose a window node has $W_R > eta$. Iterate Equation (6.5) backwards from that node, beginning with $s = R$ and increasing $s$ by the width at each step. Stop once $s > N^(3 \/ 5)$. This takes at most $ceil.l N^(3 \/ 5) ceil.r$ steps; even the earliest window node has $H_0 - 5 R > ceil.l N^(3 \/ 5) ceil.r$ predecessors for large $N$. The final tail vanishes because Lemma 7 bounds every layer height by $N^(3 \/ 5)$.
  Number these backwards steps by $j = 1 \, 2 \, dots.h$. At step $j$, the threshold in the recursion is $R$ plus the preceding widths, so every charged layer has height at least
  $ s + 1 - h gt.eq R + j - 2 gt.eq R - 1 . $
  The contribution from one column is therefore at most $2 Q_(upright("hi")) \/ \( R + j - 2 \)$. There are at most two columns per step. All contributions with $Q_(upright("hi")) < q_min$ total at most
  $ 4 q_min sum_j frac(1, R + j - 2) lt.eq 4 q_min \( 1 + log N \) < eta \/ 2 . $
  The remaining contributions must exceed $eta \/ 2$. Their denominators are at least $R - 1$, and consequently
  #[#set math.equation(numbering: n => "(6.17)")
   $ sum tilde(Q) gt.eq frac(\( R - 1 \) eta, 4) \, $ <eq:path-heavy-forced-sum>]
  where the sum may be extended to all tests on the fixed path. This same necessary condition holds for a violation at any window node. Markov’s inequality and Equation (6.16) prove the claim. ◻
]

=== 6.4 The terminal window forces two constraints <the-terminal-window-forces-two-constraints>

Choose a fixed $0 < eta < min { 1 \, zeta \/ 4 }$. The preceding lemma leaves only windows with $W_R lt.eq eta$ at every node. On such a window, the following deterministic argument is the reason that two full column costs suffice.

#thm([Lemma 6.7.])[
  (The terminal-window alternative).  #emph[Consider $5 R$ consecutive nonsingular principal extensions of widths one or two, satisfying their gates. Suppose all their nodes have $W_R lt.eq eta$ and the terminal node has $W_2 > zeta$. For all sufficiently large $N$, either at least two distinct steps are costly, or a width-two step starts at a node with $W_2 lt.eq zeta$.]
] <lem:path-window>

#proof[
  At a noncostly step of width $h$, the recursion gives
  #[#set math.equation(numbering: n => "(6.18)")
   $ W_s \( B \) lt.eq W_(s + h) \( C \) + 4 sigma #h(2em) \( s gt.eq h \) . $ <eq:path-noncostly>]
  Iterate this inequality from $s = 2$ backwards over any block of $R$ noncostly steps. The threshold increases by at least $R$, so the endpoint satisfies
  $ W_2 lt.eq delta \, #h(2em) delta := eta + 4 R sigma . $
  Here and below $delta < zeta$ for large $N$.
  Label the window nodes $X_0 \, dots.h \, X_(5 R)$. If there are no costly steps, the last $R$ steps contradict the terminal value. Suppose there is exactly one costly step, at position $t$. There must be fewer than $R$ steps after it, or the same argument again applies. Thus $t gt.eq 4 R + 1$. Both $X_(t - 2)$ and $X_(t - 1)$ end blocks of $R$ noncostly steps inside the window, and hence both have $W_2 lt.eq delta$.
  Assume there is no width-two step whose starting $W_2$ is at most $zeta$. The two steps at positions $t - 1 \, t$ must then both have width one. Applying Equation (6.18) with $s = 1$ to the preceding step gives
  $ W_1 \( X_(t - 1) \) lt.eq W_2 \( X_(t - 2) \) + 4 sigma lt.eq delta + 4 sigma . $
  Even though step $t$ is costly, its width is one, so the height comparison in Lemma 25 gives
  $ W_2 \( X_t \) lt.eq W_1 \( X_(t - 1) \) lt.eq delta + 4 sigma . $
  The remaining steps are noncostly. For either width, Equation (6.18) with $s = 2$ and monotonicity of $W_s$ in $s$ show that each increases $W_2$ by at most $4 sigma$. There are fewer than $R$ such steps, whence
  $ W_2 \( X_(5 R) \) lt.eq eta + 8 R sigma < zeta \, $
  a contradiction. Figure 2 records the two adjacent width-one steps used in this argument. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 1.75), (12.8, 1.75), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10))
  line((0, 1.64), (0, 1.86), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((0, 2.001), [#text(size: 9pt)[$X_0$]], anchor: "south", padding: 0.1176cm)
  line((12.8, 1.64), (12.8, 1.86), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((12.8, 2.001), [#text(size: 9pt)[$X_5R$]], anchor: "south", padding: 0.1176cm)
  line((11, 1.64), (11, 1.86), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((11, 2.001), [#text(size: 9pt)[$X_t$]], anchor: "south", padding: 0.1176cm)
  content((6.4, 1.9), [#text(size: 9pt)[terminal window: $5R$ steps]], anchor: "south", padding: 0.1176cm)
  line((11, 1.4), (12.8, 1.4), stroke: (paint: rgb("#666666"), thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: rgb("#666666")), end: (symbol: ">>", fill: rgb("#666666"))))
  content((11.9, 1.4), [#text(size: 9pt)[$<R$ steps]], anchor: "north", padding: 0.1176cm)
  content((2, 0), [#box(inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$X_(t-2)$#linebreak()$W_2 lt.eq delta$]]])])
  content((5.8, 0), [#box(inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#f5f5ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$X_(t-1)$#linebreak()$W_1 lt.eq delta +4 sigma$]]])])
  content((9.6, 0), [#box(inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.4pt, miter-limit: 10), fill: rgb("#fff6ed"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$X_t$#linebreak()$W_2 lt.eq delta +4 sigma$]]])])
  line((2.553, 0), (5.009, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((3.9, 0.5292), [#text(size: 9pt)[noncostly#linebreak()width one]], anchor: "south", padding: 0.1176cm)
  line((6.591, 0), (8.809, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((7.7, 0.5292), [#text(size: 9pt)[only costly step#linebreak()width one]], anchor: "south", padding: 0.1176cm)
  line((11, 1.65), (9.6, 0.5379), stroke: (paint: rgb("#acacac"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((2, -0.8202), [#text(size: 9pt)[preceding $R$ steps#linebreak()are noncostly]], anchor: "north", padding: 0.1176cm)
  content((5.8, -0.8202), [#text(size: 9pt)[also $W_2 lt.eq delta$ from#linebreak()its preceding $R$ steps]], anchor: "north", padding: 0.1176cm)
  line((10.39, 0), (12.65, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((11.7, -0.1764), [#text(size: 9pt)[noncostly#linebreak()steps]], anchor: "north", padding: 0.1176cm)
  content((11.4, -1), [#text(size: 9pt)[$W_2(X_5R) lt.eq eta +8R sigma$#linebreak()$< zeta$]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 2: The contradiction setup in Lemma 30: suppose the window has only one costly step and no width-two step starts with $W_2 lt.eq zeta$. The costly step is within $R$ steps of the end. Each of its two preceding nodes ends an $R$-step noncostly block, and the displayed adjacent steps must have width one. The lower chain enlarges these adjacent steps; horizontal spacing is schematic. The labels are upper bounds propagated by the proof, not a plot of a matrix statistic. Here $delta = eta + 4 R sigma$. ],
) <fig:terminal-window>

#proof[
  Outside a set of probability $2^(- omega \( N \))$, every nonsingular terminal matrix belongs to a required fixed-path event $cal(A)$. By Lemma 29 and Equation (6.13), we may also exclude, at the same scale, all such path events having $W_R > eta$ anywhere in their windows.
  For a fixed remaining path with terminal $W_2 > zeta$, Lemma 30 forces either two costly positions or a width-two gate with starting $W_2 lt.eq zeta$. To make the conditional probability calculation explicit, let $cal(F)_t$ contain all entries exposed through step $t$. Define $D_t$ to be the event that the starting matrix is in its typical set and step $t$ is costly. Its starting-matrix indicator is $cal(F)_(t - 1)$-measurable, and Lemma 26 gives
  $ bb(E) \[ upright(bold(1))_({ D_t }) divides cal(F)_(t - 1) \] lt.eq p_N . $
  For any two positions $r < t$, including consecutive ones,
  #[#set math.equation(numbering: n => "(6.19)")
   $ bb(P) \( D_r ∩ D_t \) = bb(E) #h(-0.16667em) [upright(bold(1))_({ D_r }) bb(E) \[ upright(bold(1))_({ D_t }) divides cal(F)_(t - 1) \]] lt.eq p_N bb(P) \( D_r \) lt.eq p_N^2 . $ <eq:path-two-positions>]
  For a specified width-two position, the event of a typical start with $W_2 lt.eq zeta$ and a satisfied gate likewise has probability at most $p_N^2$. These bounds require no conditioning on how a backwards path was selected or on any future path requirement: we upper-bound by the stated events after dropping all other conditions.
  There are only $O \( R^2 \)$ pairs of positions or individual gate positions in the window. Taking the union over these and all fixed paths gives
  $ bb(P) { B upright(" nonsingular") \, med W_2 \( B \) > zeta } lt.eq 2^(- omega \( N \)) + 2^(o \( N \)) p_N^2 = 2^(- omega \( N \)) + 2^(- 2 N \( a - 2 e_0 \) + o \( N \)) . $
  If $W_2 \( B \) lt.eq zeta$, Proposition 14 gives $\| cal(S)_(L_0) \( B \) \| lt.eq 2^(e_0 N)$, apart from another typical exception. For all sufficiently large $N$, the displayed bound and these exceptions are at most $2^(- N \( 2 a - 10 e_0 \))$, as required. ◻
]

#heading(level: 1)[References]
#bibitem([1])[W. Banaszczyk, New bounds in some transference theorems in the geometry of numbers, #emph[Mathematische Annalen] #strong[296] (1993), 625--635. #link("https://doi.org/10.1007/BF01445125").]
#bibitem([2])[A. C. Berry, The accuracy of the Gaussian approximation to the sum of independent variates, #emph[Transactions of the American Mathematical Society] #strong[49] (1941), no. 1, 122--136. #link("https://doi.org/10.1090/S0002-9947-1941-0003498-3").]
#bibitem([3])[M. Campos, M. Jenssen, M. Michelen, and J. Sahasrabudhe, The singularity probability of a random symmetric matrix is exponentially small, #emph[Journal of the American Mathematical Society] #strong[38] (2025), no. 1, 179--224. #link("https://doi.org/10.1090/jams/1042").]
#bibitem([4])[K. P. Costello, T. Tao, and V. Vu, Random symmetric matrices are almost surely nonsingular, #emph[Duke Mathematical Journal] #strong[135] (2006), no. 2, 395--413. #link("https://doi.org/10.1215/S0012-7094-06-13527-5").]
#bibitem([5])[C.-G. Esseen, Fourier analysis of distribution functions. A mathematical study of the Laplace--Gaussian law, #emph[Acta Mathematica] #strong[77] (1945), 1--125. #link("https://doi.org/10.1007/BF02392223").]
#bibitem([6])[A. Ferber and V. Jain, Singularity of random symmetric matrices---a combinatorial approach to improved bounds, #emph[Forum of Mathematics, Sigma] #strong[7] (2019), article e22, 29 pp. #link("https://doi.org/10.1017/fms.2019.21").]
#bibitem([7])[D. R. Grayson, Reduction theory using semistability, #emph[Commentarii Mathematici Helvetici] #strong[59] (1984), 600--634. #link("https://doi.org/10.1007/BF02566369").]
#bibitem([8])[W. Hoeffding, Probability inequalities for sums of bounded random variables, #emph[Journal of the American Statistical Association] #strong[58] (1963), no. 301, 13--30. #link("https://doi.org/10.1080/01621459.1963.10500830").]
#bibitem([9])[A. J. Hoffman and H. W. Wielandt, The variation of the spectrum of a normal matrix, #emph[Duke Mathematical Journal] #strong[20] (1953), no. 1, 37--39. #link("https://doi.org/10.1215/S0012-7094-53-02004-3").]
#bibitem([10])[X. Hu, Z. Song, and X. Wu, Sharp singularity asymptotics for discrete random matrices, preprint, September 2026. #link("https://arxiv.org/abs/2609.39463").]
#bibitem([11])[V. Jain, A. Sah, and M. Sawhney, Singularity of discrete random matrices, #emph[Geometric and Functional Analysis] #strong[31] (2021), no. 5, 1160--1218. #link("https://doi.org/10.1007/s00039-021-00580-6"). Author version: #link("https://arxiv.org/abs/2010.06554v2").]
#bibitem([12])[J. Kahn, J. Komlós, and E. Szemerédi, On the probability that a random $plus.minus 1$-matrix is singular, #emph[Journal of the American Mathematical Society] #strong[8] (1995), no. 1, 223--240. #link("https://doi.org/10.1090/S0894-0347-1995-1260107-2").]
#bibitem([13])[J. Komlós, On the determinant of $\( 0 \, 1 \)$ matrices, #emph[Studia Scientiarum Mathematicarum Hungarica] #strong[2] (1967), 7--21. #link("https://scholarship.libraries.rutgers.edu/esploro/outputs/journalArticle/On-the-determinant-of-0-1-matrices/991031550043104646")[Rutgers institutional copy].]
#bibitem([14])[A. E. Litvak and K. E. Tikhomirov, Singularity of sparse Bernoulli matrices, #emph[Duke Mathematical Journal] #strong[171] (2022), no. 5, 1135--1233. #link("https://doi.org/10.1215/00127094-2021-0056"). Author version: #link("https://arxiv.org/abs/2004.03131v1").]
#bibitem([15])[R. Miranda, Nondegenerate symmetric bilinear forms on finite abelian 2-groups, #emph[Transactions of the American Mathematical Society] #strong[284] (1984), no. 2, 535--542. #link("https://doi.org/10.1090/S0002-9947-1984-0743731-1").]
#bibitem([16])[H. H. Nguyen, Inverse Littlewood--Offord problems and the singularity of random symmetric matrices, #emph[Duke Mathematical Journal] #strong[161] (2012), no. 4, 545--586. #link("https://doi.org/10.1215/00127094-1548344").]
#bibitem([17])[OpenAI, #emph[The sharp exponential rate of singularity for symmetric Bernoulli matrices], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/The-sharp-exponential-rate-of-singularity-for-symmetric-Bernoulli-matrices-October-3-2026/symmetric-bernoulli-singularity.pdf")[OAI:The-sharp-exponential-rate-of-singularity-for-symmetric-Bernoulli-matrices-October-3-2026], 2026.]
#bibitem([18])[O. Regev and N. Stephens-Davidowitz, A reverse Minkowski theorem, #emph[Annals of Mathematics] #strong[199] (2024), no. 1, 1--49. #link("https://doi.org/10.4007/annals.2024.199.1.1"). The numbered results cited here refer to the author version, #link("https://arxiv.org/abs/1611.05979v6").]
#bibitem([19])[M. Talagrand, Concentration of measure and isoperimetric inequalities in product spaces, #emph[Publications Mathématiques de l'IHÉS] #strong[81] (1995), 73--205. #link("https://doi.org/10.1007/BF02699376").]
#bibitem([20])[K. Tikhomirov, Singularity of random Bernoulli matrices, #emph[Annals of Mathematics] #strong[191] (2020), no. 2, 593--634. #link("https://doi.org/10.4007/annals.2020.191.2.6").]
#bibitem([21])[I. S. Tyurin, Refinement of the upper bounds of the constants in Lyapunov's theorem, #emph[Russian Mathematical Surveys] #strong[65] (2010), no. 3, 586--588. #link("https://doi.org/10.1070/RM2010v065n03ABEH004688").]
#bibitem([22])[R. Vershynin, Invertibility of symmetric random matrices, #emph[Random Structures & Algorithms] #strong[44] (2014), no. 2, 135--182. #link("https://doi.org/10.1002/rsa.20429").]
#bibitem([23])[E. P. Wigner, On the distribution of the roots of certain symmetric matrices, #emph[Annals of Mathematics] #strong[67] (1958), no. 2, 325--327. #link("https://doi.org/10.2307/1970008").]


