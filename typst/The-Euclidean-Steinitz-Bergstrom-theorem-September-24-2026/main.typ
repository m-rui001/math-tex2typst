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

#align(center)[#text(size: 16pt, weight: "bold")[The Euclidean Steinitz--Bergström theorem]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <introduction>

Let $v_1 \, dots.h \, v_N$ be vectors in the Euclidean unit ball of $bb(R)^d$.
  There are two natural ways to keep their partial sums small:
  choose signs in a prescribed order, or, when the family sums to zero,
  choose an order without changing any signs. The difficulty in the first problem is to control every prefix by
  one choice of signs, with a bound independent of $N$. We prove such a bound on the square-root scale in the dimension.

#thm([Theorem 1.1.])[
  (Prescribed-order signed prefixes).  #emph[There is an absolute constant $C$ such that, for all integers $d \,
    N gt.eq 1$ and every sequence $v_1 \, dots.h \, v_N in bb(R)^d$ with $lr(bar.v.double v_i bar.v.double)_2
    lt.eq 1$, there are signs $epsilon_1 \, dots.h \, epsilon_N in { - 1 \, 1 }$ for which
$ max_(0 lt.eq k lt.eq N) ∥sum_(i = 1)^k epsilon_i v_i∥_2 lt.eq C sqrt(d) . $

 The same signs control all prefixes, and $C$ is independent of $d$, $N$ and the sequence.]
] <thm:signing>

The zero-sum ordering problem is quantified by the Euclidean Steinitz constant.
  For an indexed family with $sum_(i = 1)^N v_i = 0$, define

$ beta \( v_1 \, dots.h \, v_N \) = min_(pi in frak(S)_N) thick max_(0 lt.eq k lt.eq N) ∥sum_(i = 1)^k
  v_(pi \( i \))∥_2 \, $

where $frak(S)_N$ is the set of permutations of ${ 1 \, dots.h \, N }$ and an empty sum is zero.
  Let $S_2 \( d \)$ be the supremum of $beta$ over all finite indexed zero-sum families of Euclidean unit-ball
  vectors in $bb(R)^d$. The Euclidean Steinitz–Bergström conjecture asks whether $S_2 \( d \) = O \( sqrt(d) \)$.
  Theorem 1 gives its affirmative resolution.

#thm([Theorem 1.2.])[
  (Euclidean Steinitz–Bergström bound).  #emph[There is an absolute constant $C$ such that, for all integers $d \,
    N gt.eq 1$ and every indexed family $v_1 \, dots.h \, v_N in
    bb(R)^d$ satisfying $lr(bar.v.double v_i bar.v.double)_2 lt.eq 1$ and $sum_(i = 1)^N v_i = 0$,
    some permutation $pi in frak(S)_N$ satisfies
$ max_(0 lt.eq k lt.eq N) ∥sum_(i = 1)^k v_(pi \( i \))∥_2 lt.eq C sqrt(d) . $

 The constant in Theorem 1 also suffices here.]
] <thm:steinitz>

Both statements allow repetitions and zero vectors. The empty-sequence and dimension-zero extensions have every
  partial sum equal to zero. The construction is existential:
  its choices may depend on the complete input sequence. Its successive choice of signs does not supply an online
  rule or an efficient algorithm.

The order of growth in Theorem 2 is necessary. In the $d$-dimensional hyperplane orthogonal to the all-ones vector
  $upright(bold(1)) in bb(R)^(d + 1)$, let $e_i$ denote the standard coordinate vectors and take

$ u_i = sqrt(frac(d + 1, d)) (e_i - frac(upright(bold(1)), d + 1)) \, wide 1 lt.eq i lt.eq d + 1 . $

These unit vectors sum to zero and satisfy $chevron.l u_i \, u_j chevron.r = - 1 \/ d$ for $i eq.not j$.
  Hence every sum of $k$ distinct members has squared norm $k \( d + 1 - k \) \/ d$.
  With $k = floor.l \( d + 1 \) \/ 2 floor.r$, this is at least $d \/ 4$, regardless of the ordering. Thus

$ 1 / 2 sqrt(d) lt.eq S_2 \( d \) lt.eq C sqrt(d) wide \( d gt.eq 1 \) . $

=== 1.1 From signs to an ordering <from-signs-to-an-ordering>

We give the short transference argument at once. Chobanyan’s transference principle #cite(label("Chobanyan1994"))
  relates rearrangements and signed sums. We use its finite positive-forward,
  negative-reverse form #cite(label("ChobanyanEtAl2023")) Theorem 2.1 and Remark 1.

#proof[
  Fix an indexed zero-sum family and choose an order attaining its minimum $beta$;
    this exists because there are only finitely many permutations. Relabel the vectors in that order. Put
  $ A_j = sum_(i = 1)^j v_i \, wide B_j = sum_(i = 1)^j epsilon_i v_i \, wide 0 lt.eq j lt.eq N \, $
  where the signs come from Theorem 1. Hence $lr(bar.v.double A_j bar.v.double)_2 lt.eq
    beta$ and $lr(bar.v.double B_j bar.v.double)_2 lt.eq C sqrt(d)$.
    The positive-sign and negative-sign selections from an original prefix sum respectively to
  $ P_j = frac(A_j + B_j, 2) \, wide M_j = frac(A_j - B_j, 2) . $
  Place all positive-sign indices in their original order, followed by all negative-sign indices in reverse
    original order. A partial sum in the first block is some $P_j$.
    In the second block, the unused indices are the negative-sign indices of an original prefix.
    Since the total sum is zero, the current partial sum is therefore some $- M_j$.
    This also covers either block being empty. Every new partial sum has norm at most $\( beta + C sqrt(d) \) \/
    2$. By minimality,
  $ beta lt.eq frac(beta + C sqrt(d), 2) \, wide upright("and hence") wide beta lt.eq C sqrt(d) . $
  This permutes indices and so preserves all multiplicities. ◻
]

The signed-prefix bound also yields finite-dimensional $ell_p$ estimates and a colorful row-permutation theorem.
  We develop these distinct consequences in Section 6.

=== 1.2 Historical context <historical-context>

The finite rearrangement theorem goes back to Steinitz’s work on conditionally convergent vector series;
  Ambrus and Heck give a historical account in #cite(label("AmbrusHeck2026")) Section 2.
  The dimension bound for zero-sum rearrangement holds for arbitrary norms:
  Grinberg and Sevast’yanov #cite(label("GrinbergSevastyanov1980")) Theorem 1 prove that the partial sums can be
  kept within $d$ times the unit ball. The smaller square-root scale in Euclidean space has a long history;
  Behrend discusses this expected growth in #cite(label("Behrend1954")) p. 108.
  The modern formulation and its attribution to Bergström are recorded by Ambrus and Heck
  #cite(label("AmbrusHeck2026")) Conjecture 5. Their Theorem 7 reduces the asymptotic question to a relaxed
  rearrangement problem for vectors with norms in $\[ 1 - epsilon \, 1 \]$, with $0 < epsilon lt.eq
  1$ fixed independently of the dimension. In that problem each prefix is compared with its proportional share of
  the total sum, rather than with zero. For prescribed-order Euclidean signing,
  the square-root-dimension question is stated explicitly by Bansal, Jiang, Meka,
  Singla and Sinha #cite(label("BansalEtAl2021Full")) Section 6, Conjecture 6.3,
  following Banaszczyk #cite(label("Banaszczyk2012")). Their discussion records Banaszczyk’s bound
  $O \( sqrt(d) + sqrt(log N) \)$; the length term becomes significant when $N$ is large compared with the
  dimension. In a 2026 preprint, Dutta, Jha and Jiang state an efficient prescribed-order signing bound

$ O #scale(x: 120%, y: 120%)[\(] sqrt(d) + d^(1 \/ 4) log^(7 \/ 4) N #scale(x: 120%, y: 120%)[\)] \, $

and the corresponding zero-sum ordering bound #cite(label("DuttaJhaJiang2026")) Theorem 1.1 and Corollary 1.2.
  Theorem 1 gives an absolute multiple of $sqrt(d)$ for every finite length.

Terminal vector balancing has a different quantifier. For columns in the Euclidean unit ball,
  Li #cite(label("Li2026")) Theorem 1.1 bounds the final signed sum in infinity norm by an absolute constant and
  gives a deterministic polynomial-bit algorithm on rational input.
  That terminal statement implies a Euclidean bound of order $sqrt(d)$ for one sum.
  Applying it separately to each prefix permits the signs to change with the prefix;
  Theorem 1 instead supplies one common signing. The present all-prefix estimate is Euclidean and does not assert
  a constant infinity-norm all-prefix bound.

=== 1.3 Proof strategy <proof-strategy>

Gaussian convex bodies are a central setting for vector balancing,
  notably in the theorem of Banaszczyk #cite(label("Banaszczyk1998")).
  Our proof takes place in a space of coefficients: one coordinate is reserved for each incoming vector,
  together with $d$ initial state coordinates. A sequence of linear maps sends these coefficients to states in
  $bb(R)^d$. At each step an invertible contraction acts on the old state and the next coefficient injects a
  multiple of the incoming vector. The body of coefficients for which every state is bounded will provide the
  simultaneous control of all prefixes.

Two analytic ingredients make this construction possible.
  First, if a bounded symmetric convex body has small Dirichlet energy for every positive diagonal weight,
  it supports a single square root of a probability density with small derivatives in every coordinate.
  A lifted Steiner symmetrization preserves these bounds and permits a coordinate step of the form $q + epsilon$,
  where $\| q \| lt.eq 1 \/ 4$ and $epsilon in { - 1 \, 1 }$.
  This adapts the directional-density and symmetrization method of Guo,
  Fang and Lu #cite(label("GuoFangLu2026")) Sections 3–4.#footnote[Guo,
  Fang and Lu credit the Odin Automatic AI Research Agent for their proof.] Bandeira #cite(label("Bandeira2026"))
  gives a related formulation for terminal balancing in terms of Dirichlet eigenvalues.
  Akbas and Sra #cite(label("AkbasSra2026")) Lemmas 2.2–2.3 develop the common quadratic-energy witness and lifted
  $L^2$-symmetrization argument. Here the hypotheses use diagonal weights,
  and the coordinate shifts may depend on earlier choices. We prove the required energy and shifted-step
  statements in full.

Second, the filtered body has a diagonal Dirichlet-energy bound independent of the number of filters.
  To prove this, we follow a stationary Ornstein–Uhlenbeck process in coefficient space and localize its filtered
  states to dyadic spectral scales. A matrix estimate controls changes at one scale by an additive trace budget,
  including gains inserted between noncommuting contractions.
  At a fixed scale, this estimate gives a uniform positive probability for all constraints in a group of indices
  with bounded accumulated energy, over a matched time interval.
  Gaussian correlation combines these groups, scales and time intervals;
  the exponential survival rate yields the energy bound.

The two ingredients meet through a scalar predictor. The allowed shift in the incoming coefficient exactly
  compensates for the contraction of the old state. Consequently the final states are the signed partial sums
  themselves. We give this complete construction in Section 2, after stating the two analytic propositions.
  Section 3 proves the shifted-sign proposition. Section 4 establishes the matrix variation estimate,
  and Section 5 uses it to prove the filtered-body energy bound.
  Section 6 develops the norm-comparison and colorful row-permutation consequences.

Throughout, all unspecified constants are absolute. Vectors and matrices are real;
  $lr(bar.v.double dot.op bar.v.double)_(upright("op"))$ and
  $lr(bar.v.double dot.op bar.v.double)_(upright("HS"))$ denote operator and Hilbert–Schmidt norms.
  For symmetric matrices, $A lt.eq B$ means that $B - A$ is positive semidefinite.
  Functions of positive definite matrices are defined by the spectral calculus.

== 2 Constructing the signed walk <sec:construction>

We will encode the signed walk by one point in a convex body in a larger coefficient space.
  The body controls a contracted version of every prefix. Its extra coordinates will be chosen so that their
  contributions exactly restore the parts removed by the contractions.
  This section states the two analytic inputs and proves Theorem 1 from them.

=== 2.1 The two analytic inputs <the-two-analytic-inputs>

Let $D subset bb(R)^m$ be a nonempty bounded open convex set, and let $Q$ be a positive definite diagonal $m times
  m$ matrix. Define its diagonal Dirichlet energy by

#[#set math.equation(numbering: n => "(1)")
 $ lambda_Q \( D \) =
   inf_(0 eq.not g in H_0^1 \( D \))
   frac(integral_D chevron.l Q nabla g \, nabla g chevron.r thin d x, integral_D g^2 thin d x) .
   $ <eq:dirichlet-energy>]

Here $H_0^1 \( D \)$ is the closure of $C_c^oo \( D \)$ in the Sobolev norm, and derivatives are weak derivatives.
  This normalization corresponds to Brownian motion with covariance rate $2 Q$.
  Central symmetry will always mean symmetry about the origin. Fix

#[#set math.equation(numbering: n => "(2)")
 $ kappa = 1 / 100 \, wide delta = 1 / 4 . $ <eq:signing-constants>]

Our first input turns small coordinate energies into signs while allowing a bounded shift at each step.
  The shifts may depend on previously assigned coordinates.

#thm([Proposition 2.1.])[
  (Signs with adaptive shifts).  #emph[Let $K subset bb(R)^m$ be nonempty, bounded, open,
    convex and centrally symmetric. Suppose that
#[#set math.equation(numbering: n => "(3)")
 $ lambda_Q \( K \) lt.eq kappa^2 "tr" Q quad upright("for every positive definite diagonal ") Q .
   $ <eq:all-diagonal-energy>]

 Let $j_1 \, dots.h \, j_s$ be distinct elements of ${ 1 \, dots.h \, m }$, and let $q_i :
   bb(R)^(i - 1) arrow.r \[ - delta \, delta \]$ be arbitrary functions, for $1 lt.eq i lt.eq s$.
   There exist signs $epsilon_1 \, dots.h \, epsilon_s$ such that the recursion
$ x^(\( 0 \)) = 0 \, wide x^(\( i \)) = x^(\( i - 1 \)) +
  #scale(x: 120%, y: 120%)[\(] q_i \( x_(j_1)^(\( i - 1 \)) \, dots.h \, x_(j_(i - 1))^(\( i - 1 \)) \) +
  epsilon_i #scale(x: 120%, y: 120%)[\)] e_(j_i) $

 has $x^(\( s \)) in K$. For $i = 1$, the function $q_1$ has a one-point domain.]
] <prop:adaptive>

This is an existence statement; the choice of signs can depend on the whole body $K$ and all the prescribed
  functions. Its proof uses backward transformations of $K$, followed by forward choices of the signs.

The second input supplies a body satisfying a uniform energy bound.
  Its linear maps retain a $d$-dimensional state and read one new coordinate at each step.

#thm([Proposition 2.2.])[
  (Energy of a filtered path body).  #emph[There are positive absolute constants $A_0 \, B_0 \,
    H_0$ with the following property. Let $d gt.eq 1$ and $n gt.eq 0$ be integers and put $m = d + n$.
    For $1 lt.eq t lt.eq n$, let $C_t$ be an invertible real $d times d$ matrix and let $b_t in bb(R)^d$ satisfy
$ C_t C_t^T + b_t b_t^T = I_d . $

 Define linear maps $R_t : bb(R)^m arrow.r bb(R)^d$ by
#[#set math.equation(numbering: n => "(4)")
 $ R_0 x = \( x_1 \, dots.h \, x_d \) \, wide R_t x = C_t R_(t - 1) x +
   b_t x_(d + t) quad \( 1 lt.eq t lt.eq n \) . $ <eq:filter-recursion>]

 Then the bounded open convex centrally symmetric set
#[#set math.equation(numbering: n => "(5)")
 $ cal(D) = {x in bb(R)^m : \| x_j \| < B_0 & \( 1 lt.eq j lt.eq m \) \,\
lr(bar.v.double R_t x bar.v.double)_2 < A_0 sqrt(d) & \( 0 lt.eq t lt.eq n \)} $ <eq:filtered-body>]

 satisfies
$ lambda_Q \( cal(D) \) lt.eq H_0 "tr" Q quad upright("for every positive definite diagonal ") Q . $

]
] <prop:filtered>

The constants are independent of the number of maps and of $Q$. This uniformity is essential:
  the application will use $n$ equal to the number of vectors.
  To compensate for the contractions, we will also impose linear constraints on the coefficients.
  The following estimate bounds their additional energy cost; we prove it after completing the construction.

#thm([Lemma 2.3.])[
  (Adding slabs).  #emph[Let $D subset bb(R)^m$ be bounded, nonempty, open, convex and centrally symmetric.
    Let $D_(*) > 0$, $delta > 0$, and let $m_1 \, dots.h \, m_n$ be real rows of length $m$. Set
$ K = \( 2 D_(*) D \) ∩ ⋂_(i = 1)^n { x : \| m_i x \| < delta } . $

 For every positive definite diagonal $Q$,
#[#set math.equation(numbering: n => "(6)")
 $ lambda_Q \( K \) lt.eq D_(*)^(- 2) lambda_Q \( D \) + pi^2 delta^(- 2) sum_(i = 1)^n m_i Q m_i^T .
   $ <eq:slab-energy>]

]
] <lem:slab-energy>

=== 2.2 The filter, the shifts, and their cancellation <the-filter-the-shifts-and-their-cancellation>

We now prove the signed-prefix theorem from Propositions 3 and 4.
  Their proofs in the remaining sections are independent of this application.

#proof[
  Write the prescribed sequence as $v_1 \, dots.h \, v_n in bb(R)^d$,
    with $lr(bar.v.double v_i bar.v.double)_2 lt.eq 1$. The hypotheses give $d \, n gt.eq 1$.
  ===== 2.2.1 The symmetric contractions. <the-symmetric-contractions.>
  For a positive absolute $sigma < 1$, to be chosen below, set
  #[#set math.equation(numbering: n => "(7)")
   $ b_i = sigma v_i \, wide eta_i = frac(1, 1 + sqrt(1 - lr(bar.v.double b_i bar.v.double)_2^2)) \, wide C_i =
     I - eta_i b_i b_i^T . $ <eq:symmetric-filter>]
  On the span of $b_i$, the matrix $C_i$ has eigenvalue $sqrt(1 - lr(bar.v.double b_i bar.v.double)_2^2)$,
    and on its orthogonal complement it is the identity. This includes $b_i = 0$, for which $eta_i =
    1 \/ 2$ and $C_i = I$. Consequently
  $ C_i = \( I - b_i b_i^T \)^(1 \/ 2) = C_i^T succ 0 \, wide C_i^2 + b_i b_i^T = I \, wide 1 / 2 lt.eq
    eta_i lt.eq 1 . $
  Use these matrices in (4), and let $cal(D)$ be the body in Proposition 4.
  For $x in bb(R)^(d + n)$, let $x^0$ be obtained by setting its first $d$ coordinates to zero.
    Define row vectors $m_i$ by
  #[#set math.equation(numbering: n => "(8)")
   $ m_i x = eta_i b_i^T R_(i - 1) x^0 . $ <eq:predictor-rows>]
  Each row $m_i$ is supported only on the noise coordinates $d + 1 \, dots.h \, d + i - 1$.
    In particular it is unaffected by any coordinate assigned at step $i$ or later.
  ===== 2.2.2 The cost of the predictor constraints. <the-cost-of-the-predictor-constraints.>
  Let $M$ be the matrix with rows $m_i$. We claim that every column of $M$ has squared Euclidean norm at most
    $sigma^2$. Its initial $d$ columns are zero. For a noise coordinate $d + j$, follow its contribution to the state:
  $ r_j = b_j \, wide r_i = C_i r_(i - 1) quad \( j < i lt.eq n \) . $
  The coefficient of that coordinate in $m_i$ is zero for $i lt.eq j$, and is $eta_i b_i^T r_(i - 1)$ for $i > j$.
    Symmetry of $C_i$ gives the exact loss identity
  $ lr(bar.v.double r_(i - 1) bar.v.double)_2^2 - lr(bar.v.double r_i bar.v.double)_2^2 = \( b_i^T r_(i - 1) \)^2 . $
  Thus the losses telescope:
  #[#set math.equation(numbering: n => "(9)")
   $ lr(bar.v.double M e_(d + j) bar.v.double)_2^2 & = sum_(i = j + 1)^n eta_i^2 \( b_i^T r_(i - 1) \)^2\
 & lt.eq sum_(i = j + 1)^n #scale(x: 120%, y: 120%)[\(] lr(bar.v.double r_(i - 1) bar.v.double)_2^2 -
   lr(bar.v.double r_i bar.v.double)_2^2 #scale(x: 120%, y: 120%)[\)] lt.eq
   lr(bar.v.double b_j bar.v.double)_2^2 lt.eq sigma^2 . $ <eq:predictor-columns>]
  In particular, for every positive definite diagonal $Q$,
  #[#set math.equation(numbering: n => "(10)")
   $ sum_(i = 1)^n m_i Q m_i^T = sum_(j = 1)^(d + n) Q_(j j) lr(bar.v.double M e_j bar.v.double)_2^2 lt.eq
     sigma^2 "tr" Q . $ <eq:predictor-weighted-cost>]
  Choose an absolute dilation $D_(*) > 0$ and define
  #[#set math.equation(numbering: n => "(11)")
   $ K = \( 2 D_(*) cal(D) \) ∩ { x : \| m_i x \| < delta upright(" for ") 1 lt.eq i lt.eq
     n } . $ <eq:application-body>]
  This is a bounded open convex centrally symmetric set containing a neighborhood of zero.
    Lemma 5, Proposition 4, and (10) give
  #[#set math.equation(numbering: n => "(12)")
   $ lambda_Q \( K \) lt.eq (H_0 D_(*)^(- 2) + pi^2 delta^(- 2) sigma^2) "tr" Q . $ <eq:application-energy>]
  We can therefore fix, once and for all,
  #[#set math.equation(numbering: n => "(13)")
   $ D_(*) gt.eq max { 1 \, sqrt(2 H_0) \/ kappa } \, wide sigma = min { 1 \/ 2 \,
     kappa delta \/ \( sqrt(2) pi \) } . $ <eq:absolute-parameters>]
  The same body $K$ then satisfies (3) for every positive definite diagonal $Q$.
    These choices are independent of $d$, $n$ and the vectors.
  ===== 2.2.3 Choosing the coefficients. <choosing-the-coefficients.>
  For $u in bb(R)$ write $"clip"_delta \( u \) = max { - delta \, min { u \, delta } }$.
    Apply Proposition 3 to the distinct axes $e_(d + 1) \, dots.h \, e_(d + n)$. At step $i$ prescribe the shift
  $ q_i = "clip"_delta \( m_i x^(\( i - 1 \)) \) . $
  By the support of $m_i$, this is a function of the previously assigned coordinates, as required.
    The proposition supplies signs and a final point $x = x^(\( n \)) in K$.
    Its first $d$ coordinates remain zero. Also, coordinates assigned before step $i$ never change afterward, so
  $ m_i x^(\( i - 1 \)) = m_i x . $
  The final membership $x in K$ implies $\| m_i x \| < delta$.
    Hence each shift was already within the permitted interval: clipping was inactive, and
  #[#set math.equation(numbering: n => "(14)")
   $ x_(d + i) = m_i x + epsilon_i = eta_i b_i^T R_(i - 1) x + epsilon_i . $ <eq:unclipped-coordinates>]
  Here $x^0 = x$ because the initial block is zero. Clipping is used only to make the application of Proposition 3
    unconditional; causality and the final constraints subsequently remove it.
  Figure 1 illustrates the identity that completes the construction.
  ===== 2.2.4 Cancellation. <cancellation.>
  For this single final coefficient vector, $R_0 x = 0$ and
  $ R_t x & = C_t R_(t - 1) x + b_t x_(d + t)\
 & = \( I - eta_t b_t b_t^T \) R_(t - 1) x + b_t \( eta_t b_t^T R_(t - 1) x + epsilon_t \)\
 & = R_(t - 1) x + epsilon_t b_t . $
  Thus, simultaneously for every $0 lt.eq t lt.eq n$,
  #[#set math.equation(numbering: n => "(15)")
   $ R_t x = sum_(i = 1)^t epsilon_i b_i . $ <eq:feedback-cancellation>]
  Since $x in 2 D_(*) cal(D)$, all these states have norm less than $2 D_(*) A_0 sqrt(d)$.
    Dividing (15) by $sigma$ proves Theorem 1 with the absolute constant $C = 2 D_(*) A_0 \/ sigma$. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$r$]]])])
  content((3.7, 0), [#box(inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$C_"tr"=r- eta_"tb"_"tb"_t^"Tr"$]]])])
  content((7.5, 0), [#text(size: 9pt)[$+$]], frame: "circle", padding: 0.07056cm, stroke: (thickness: 0.4pt, miter-limit: 10))
  content((10.5, 0), [#box(inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$r+ epsilon_"tb"_t$]]])])
  content((3.7, -1.5), [#box(inset: 0.3333em, radius: 4pt, stroke: (thickness: 0.4pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$b_"tx"_(d+t)=b_t( eta_"tb"_t^"Tr"+ epsilon_t)$]]])])
  line((0.204, 0), (2.478, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((4.922, 0), (7.5, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((7.5, 0), (9.947, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0, -0.45), (0, -1.5), (2.145, -1.5), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((5.255, -1.5), (7.5, -1.5), (7.5, -0.1763), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
})],
  caption: [Figure 1: For the final coefficient vector, put $r = R_(t - 1) x$. The predictor term in the incoming coordinate restores exactly the component removed by $C_t$, leaving the signed increment $epsilon_t b_t$. ],
) <fig:cancellation>

=== 2.3 Brownian proofs of the slab bound <brownian-proofs-of-the-slab-bound>

We now prove Lemma 5, which bounded the cost of the predictor constraints.
  Brownian survival converts intersection with slabs into an event to which Gaussian correlation applies.
  The two Brownian facts below will also be used in the remaining analytic arguments.

#thm([Lemma 2.4.])[
  (Brownian survival rate).  #emph[Let $D subset bb(R)^m$ be bounded, nonempty, open and convex,
    and let $Q$ be positive definite and diagonal. If $W$ is Brownian motion with covariance rate $2 Q$,
    started at $x in D$, then
#[#set math.equation(numbering: n => "(16)")
 $ lim_(T arrow.r oo) - 1 / T log bb(P)_x { W \( s \) in D upright(" for all ") 0 lt.eq s lt.eq T } =
   lambda_Q \( D \) . $ <eq:brownian-rate>]

 In particular, the starting point may be $0$ when $D$ is centrally symmetric.]
] <lem:brownian-rate>

#proof[
  The generator of $W$ is $"tr" \( Q nabla^2 \)$. Let $tau_D = inf { s gt.eq 0 : W \( s \) in.not D }$, and let
  $ P_s^D h \( x \) = bb(E)_x \[ h \( W \( s \) \) upright(bold(1))_({ s < tau_D }) \] $
  be its killed semigroup. The corresponding nonnegative self-adjoint operator is the Dirichlet realization of $-
    "tr" \( Q nabla^2 \)$, with form $integral_D nabla g^T Q nabla g$ on $H_0^1 \( D \)$.
    These standard Dirichlet facts apply here because bounded convex domains are connected and Lipschitz; see,
    for example, #cite(label("DaviesSimon1984")) Section 2 and Appendix C,
    after the linear change of coordinates for $Q$ and the time normalization above.
    The killed representation can also be obtained first on smooth interior domains and then by exhaustion:
    their compactly supported smooth functions exhaust the form domain,
    while any continuous path remaining in $D$ on a compact time interval has compact image in $D$.
  Write $lambda = lambda_Q \( D \)$. Compactness of $H_0^1 \( D \) arrow.r.hook
    L^2 \( D \)$ and the spectral theorem give $lr(bar.v.double P_s^D bar.v.double)_(2 arrow.r 2) =
    e^(- s lambda)$ and a first eigenfunction $phi$ that can be chosen nonnegative by taking the absolute value of
    a Rayleigh minimizer. Interior elliptic regularity and the strong maximum principle make $phi$ strictly
    positive at every point of $D$. It is bounded: free heat kernel domination and $phi =
    e^lambda P_1^D phi$ give this directly by Cauchy–Schwarz. Consequently,
  $ e^(- T lambda) phi \( x \) = P_T^D phi \( x \) lt.eq lr(bar.v.double phi bar.v.double)_oo thin bb(P)_x {
    tau_D > T } . $
  For the reverse bound, let $p_Q$ denote the free heat kernel.
    For $T gt.eq 1$, the semigroup property and free kernel domination yield
  $ bb(P)_x { tau_D > T } & lt.eq lr(bar.v.double p_Q \( 1 \, x \, dot.op \) bar.v.double)_2
    lr(bar.v.double P_(T - 1)^D upright(bold(1))_D bar.v.double)_2\
 & lt.eq lr(bar.v.double p_Q \( 1 \, x \, dot.op \) bar.v.double)_2 thin \| D \|^(1 \/ 2) e^(- \( T - 1 \) lambda) . $
  Both prefactors are finite for the fixed $D \, Q \, x$. Taking logarithms and dividing by $T$ proves (16).
    Finally, a nonempty open convex set symmetric about $0$ contains $0$ as an interior point. ◻
]

We will use the following path form of Gaussian correlation.
  Its finite-grid proof also records how closed constraints are handled.

#thm([Lemma 2.5.])[
  (Gaussian correlation for path constraints).  #emph[Let $X : \[ 0 \, T \] arrow.r
    bb(R)^m$ be a centered Gaussian process with continuous paths.
    For $i = 1 \, dots.h \, r$, let $E_i$ be an event of the form
$ E_i = ⋂_(j = 1)^(r_i) { A_(i j) X \( s \) in K_(i j) upright(" for all ") s in I_(i j) } \, $

 where $A_(i j)$ is linear, $K_(i j)$ is a closed centrally symmetric convex set in its target space,
   and $I_(i j) subset \[ 0 \, T \]$ is a closed interval. Then
$ bb(P) #scale(x: 180%, y: 180%)[\(] ⋂_(i = 1)^r E_i #scale(x: 180%, y: 180%)[\)] gt.eq
  product_(i = 1)^r bb(P) \( E_i \) . $

]
] <lem:gaussian-path-correlation>

#proof[
  Replace each interval by a finite grid. All the constraints are then closed centrally symmetric convex
    conditions on one finite-dimensional centered Gaussian vector.
    Represent that vector as a linear image of a standard Gaussian on its linear support;
    thus a possibly singular covariance creates no difficulty.
    Royen’s Gaussian correlation inequality #cite(label("Royen2014")), iterated over the finitely many events,
    gives the desired product bound on the grids. Now refine nested grids whose unions are dense in the respective
    intervals. Closedness of each $K_(i j)$ and path continuity identify the decreasing limit with the stated
    event. Continuity of probability from above proves the assertion. ◻
]

#proof[
  The set $K$ is again a bounded open centrally symmetric convex neighborhood of $0$.
    Take Brownian motion $W$ of covariance rate $2 Q$ started at $0$. On $\[ 0 \, T \]$, impose the closed constraints
  $ W \( s \) in overline(D_(*) D) \, wide \| m_i W \( s \) \| lt.eq delta \/ 2 quad \( 1 lt.eq i lt.eq n \) . $
  Their simultaneous occurrence implies survival in $K$: $overline(D_(*) D) subset 2 D_(*) D$,
    since $0$ is interior to the convex set $D$, and the half-threshold slabs lie inside the open full-threshold
    slabs. By Lemma 7, and then by replacing each closed-event probability by its smaller open-event probability,
  $ & bb(P)_0 { W \( \[ 0 \, T \] \) subset K }\
 & quad gt.eq bb(P)_0 { W \( \[ 0 \, T \] \) subset D_(*) D } product_(i = 1)^n bb(P)_0 { \| m_i W \( s \) \| <
   delta \/ 2 upright(" for all ") 0 lt.eq s lt.eq T } . $
  For a nonzero row $m_i$, the process $m_i W$ is one-dimensional Brownian motion with covariance rate $2 c_i$,
    where $c_i = m_i Q m_i^T > 0$. The first Dirichlet eigenfunction of $-
    c_i thin d^2 \/ d x^2$ on $\( - delta \/ 2 \, delta \/ 2 \)$ is $cos \( pi x \/ delta \)$,
    with eigenvalue $pi^2 c_i \/ delta^2$. Lemma 6 gives the corresponding survival exponent.
    A zero row gives the identically zero process, so its probability is one and its cost is zero.
  Take negative logarithms, divide by $T$, and let $T arrow.r oo$.
    Lemma 6 applies to $K$ and $D_(*) D$, and the change of variables in the Rayleigh quotient gives
    $lambda_Q \( D_(*) D \) = D_(*)^(- 2) lambda_Q \( D \)$. This proves (6).
    The argument used only inclusions between closed and open events;
    it requires no assertion about equality of their survival rates. ◻
]

It remains to prove the two analytic inputs. We first construct the domain transformations behind Proposition 3,
  and then establish the uniform energy bound in Proposition 4.

== 3 From low energy to shifted signs <sec:shifted-signs>

We prove Proposition 3. Its spectral hypothesis will first give a single normalized function with small
  derivatives in every coordinate. A lifted Steiner symmetrization then produces a new domain from which one can
  take one of two signed steps, even after a prescribed small shift.
  Repeating this construction backwards will allow us to choose the signs forwards.
  The construction adapts the common-density and prescribed-section arguments of Guo,
  Fang and Lu #cite(label("GuoFangLu2026")) Proposition 2.2, Lemmas 3.3–3.4 and 4.1–4.3.
  Quadratic-energy versions of this approach appear in Bandeira #cite(label("Bandeira2026")) and Akbas and Sra
  #cite(label("AkbasSra2026")) Lemmas 2.2–2.3. Here we retain only coordinate Sobolev energies and enough
  geometric slack for bounded adaptive shifts. The coordinate-energy and shifted-step arguments needed here are
  proved in full below.

Throughout this section,

$ kappa = 1 / 100 \, wide delta = 1 / 4 \, wide ell = 5 / 2 . $

=== 3.1 One function for all coordinate energies <one-function-for-all-coordinate-energies>

We first record a useful boundary convention. If a bounded open convex domain $D subset bb(R)^m$ contains zero, then

#[#set math.equation(numbering: n => "(17)")
 $ H_0^1 \( D \) = { f \|_D : f in H^1 \( bb(R)^m \) \, med f = 0 upright(" a.e. outside ") D } \,
   $ <eq:zero-extension>]

where functions on the left are extended by zero. Indeed, for a function on the right, $f_r \( x \) =
  f \( x \/ r \)$ converges to $f$ in $H^1 \( bb(R)^m \)$ as $r arrow.t 1$.
  For $r < 1$ its support lies in the compact subset $r overline(D)$ of $D$.
  Mollification with a sufficiently small radius therefore approximates $f_r$ by functions in $C_c^oo \( D \)$.
  Conversely, zero extension preserves the $H^1$ norm on $C_c^oo \( D \)$ and hence on its completion.

#thm([Lemma 3.1.])[
  #emph[Let $K subset bb(R)^m$ be a nonempty bounded open convex set symmetric about zero. If
$ lambda_Q \( K \) lt.eq kappa^2 "tr" Q wide upright("for every positive definite diagonal ") Q \, $

 then there is a nonnegative $f in H^1 \( bb(R)^m \)$, vanishing almost everywhere outside $K$, such that
$ integral f^2 = 1 \, wide integral \| partial_i f \|^2 lt.eq kappa^2 quad \( 1 lt.eq i lt.eq m \) . $

]
] <lem:simultaneous-density>

#proof[
  Let $cal(F)$ be the nonnegative functions in $H^1 \( bb(R)^m \)$ that vanish almost everywhere outside $K$ and
    have $L^2$ norm one, and put $E_i \( f \) = integral \| partial_i f \|^2$.
    Consider the set of simultaneous upper bounds
  $ cal(A) = { u in bb(R)^m : E_i \( f \) lt.eq u_i upright(" for every ") i upright(" for some ") f in cal(F) } . $
  It is nonempty and is closed under addition of nonnegative vectors. It is also convex.
    For $f \, g in cal(F)$ and $0 lt.eq t lt.eq 1$, the function $h = \( t f^2 + \( 1 - t \) g^2 \)^(1 \/ 2)$
    belongs to $cal(F)$ and satisfies
  $ \| partial_i h \|^2 lt.eq t \| partial_i f \|^2 + \( 1 - t \) \| partial_i g \|^2 quad upright("a.e.") $
  This follows from the Sobolev chain rule for the Euclidean norm and Cauchy–Schwarz.
  To see that $cal(A)$ is closed, let $u^(\( j \)) in cal(A)$ converge to $u$,
    and choose corresponding $f_j in cal(F)$. Their $H^1$ norms are bounded.
    Since all supports lie in a fixed bounded set, weak $H^1$ compactness and compactness in $L^2$ give a
    subsequence converging weakly in $H^1$ and strongly in $L^2$ to a member $f$ of $cal(F)$.
    Lower semicontinuity gives $E_i \( f \) lt.eq u_i$ for every $i$.
  If $c = kappa^2 \( 1 \, dots.h \, 1 \)$ did not belong to $cal(A)$,
    strict separation would give a nonzero $w in bb(R)^m$ with
  $ w dot.op c < inf_(u in cal(A)) w dot.op u . $
  The upper-set property forces every $w_i$ to be nonnegative.
    For $epsilon.alt > 0$ let $Q_epsilon.alt = "diag" \( w_i + epsilon.alt \)$.
    By (17), taking absolute values and normalizing does not change the Rayleigh infimum, so
  $ inf_(u in cal(A)) w dot.op u = inf_(f in cal(F)) sum_i w_i E_i \( f \) lt.eq
    lambda_(Q_epsilon.alt) \( K \) lt.eq kappa^2 sum_i \( w_i + epsilon.alt \) . $
  Letting $epsilon.alt arrow.b 0$ contradicts separation. This argument also covers zero components of $w$.
    Thus $c in cal(A)$, as required. ◻
]

=== 3.2 Convexity under Minkowski averages <convexity-under-minkowski-averages>

We will apply Jensen’s inequality to the energies of horizontal sections.
  The needed property is a diagonal version of the classical Brascamp–Lieb convexity inequality for the first
  Dirichlet eigenvalue #cite(label("BrascampLieb1976")) Theorem 6.2; see also the statement in Bryan,
  Clutterbuck and Rankin #cite(label("BryanClutterbuckRankin2026")) Theorem 1.2.
  We give the proof from Gaussian log-concavity and the Brownian survival rate,
  including the open-domain approximation used here.

#thm([Lemma 3.2.])[
  #emph[Let $D_0 \, D_1 subset bb(R)^m$ be nonempty bounded open convex sets symmetric about zero,
    and let $Q$ be positive definite diagonal. For $0 lt.eq alpha lt.eq 1$,
$ lambda_Q \( \( 1 - alpha \) D_0 + alpha D_1 \) lt.eq \( 1 - alpha \) lambda_Q \( D_0 \) + alpha lambda_Q \( D_1 \) . $

]
] <lem:minkowski>

#proof[
  The endpoints are immediate, so suppose $0 < alpha < 1$ and write $D_alpha = \( 1 - alpha \) D_0 + alpha D_1$.
    Fix $0 < eta < 1$, set $r = 1 - eta$, and put
  $ A_i = r overline(D_i) \, wide A_alpha = \( 1 - alpha \) A_0 + alpha A_1 . $
  These are compact convex sets, and $A_alpha subset D_alpha$:
    indeed, $A_alpha subset r overline(D_alpha)$, which is compactly contained in $D_alpha$.
  Let $W$ start at zero with Brownian covariance rate $2 Q$.
    On a finite grid of positive times in $\[ 0 \, T \]$, its values form a Gaussian vector.
    Gaussian log-concavity #cite(label("Prekopa1973")) Theorem 2 shows that
  $ bb(P) { W upright(" lies in ") A_alpha upright(" on the grid") } gt.eq
    product_(i = 0)^1 bb(P) { W upright(" lies in ") A_i upright(" on the grid") }^(alpha_i) \,
    wide \( alpha_0 \, alpha_1 \) = \( 1 - alpha \, alpha \) . $
  Here the Minkowski average of the two grid events is contained in the grid event for $A_alpha$.
    Increase the grids to a dense subset of $\[ 0 \, T \]$. Closedness of the $A_i$ and continuity of Brownian
    paths allow passage to the decreasing limits of these events.
    Since $r D_i subset A_i$ and $A_alpha subset D_alpha$, it follows that
  $ bb(P)_0 { W \( \[ 0 \, T \] \) subset D_alpha } gt.eq product_(i = 0)^1 bb(P)_0 { W \( \[ 0 \, T \] \) subset
    r D_i }^(alpha_i) . $
  Lemma 6, followed by the scaling of the Dirichlet quotient, now gives
  $ lambda_Q \( D_alpha \) lt.eq r^(- 2) #scale(x: 120%, y: 120%)[\(] \( 1 - alpha \) lambda_Q \( D_0 \) +
    alpha lambda_Q \( D_1 \) #scale(x: 120%, y: 120%)[\)] . $
  Finally let $eta arrow.b 0$. ◻
]

=== 3.3 A section that permits shifted signed steps <a-section-that-permits-shifted-signed-steps>

The next lemma is the geometric step in the signing construction.
  Its conclusion holds for every allowed shift after the point in the new domain has been chosen.

#thm([Lemma 3.3.])[
  #emph[Let $K subset bb(R)^m$ be a nonempty bounded open convex set symmetric about zero and satisfying
    $lambda_Q \( K \) lt.eq kappa^2 "tr" Q$ for every positive definite diagonal $Q$.
    For every coordinate vector $e$, there is another domain $T_e \( K \)$ with the same properties such that,
    for all $y in T_e \( K \)$ and $\| q \| lt.eq delta$, some $epsilon in { - 1 \, 1 }$ satisfies
$ y + \( q + epsilon \) e in K . $

]
] <lem:shift-section>

#proof[
  Lift $K$ to the bounded open convex set
  $ B = { \( y \, s \) in bb(R)^m times bb(R) : y + s e in K \, med \| s \| < ell } . $
  Let $P$ be its projection onto $bb(R)^m$. For $y in P$, its vertical fiber $I_y =
    { s : \( y \, s \) in B }$ is a nonempty open interval. Write $L \( y \) = \| I_y \|$. Convexity gives
  $ \( 1 - t \) I_y + t I_z subset I_(\( 1 - t \) y + t z) \, wide
    L \( \( 1 - t \) y + t z \) gt.eq \( 1 - t \) L \( y \) + t L \( z \) . $
  Thus $L$ is positive, concave and continuous on the open convex set $P$. The vertical Steiner symmetrization of $B$ is
  $ B^(*) = { \( y \, s \) : y in P \, med \| s \| < L \( y \) \/ 2 } . $
  This set is bounded, open and convex. Symmetry of $K$ implies $L \( - y \) = L \( y \)$,
    so $B^(*)$ is symmetric separately in $y$ and in $s$. For $s gt.eq 0$ put
  $ D_s = { y in P : L \( y \) > 2 s } \, wide b = sup { s gt.eq 0 : D_s eq.not diameter } . $
  Then $0 < b lt.eq ell$. Each $D_s$ with $0 lt.eq s < b$ is a nonempty bounded open convex set symmetric about
    zero, and these domains decrease as $s$ increases.
  The section $D_1$ is the target because each of its points permits the required shifted signed step.
    Indeed, for any $y in D_1$, write $I_y = \( a \, b_0 \)$. Its length exceeds two.
    Choose $c in \( a + 1 \, b_0 - 1 \)$; then
  $ \[ c - 1 \, c + 1 \] subset I_y \, wide \| c \| < ell - 1 = 3 / 2 . $
  For $\| q \| lt.eq delta$, we have $\| c - q \| < 7 \/ 4 < 2$.
    If $q lt.eq c$, then $q + 1$ lies in $\[ c - 1 \, c + 1 \]$; if $q gt.eq c$, then $q -
    1$ lies in that segment. Thus one of $q + 1 \, q - 1$ lies in the original open fiber,
    giving membership in $K$ itself. It remains to prove that $D_1$ is nonempty and has the same spectral bounds as $K$.
  Choose $f$ from Lemma 8, and define
  $ Psi \( y \, s \) = \( 2 ell \)^(- 1 \/ 2) f \( y + s e \) upright(bold(1))_(\( - ell \, ell \)) \( s \) . $
  Translation invariance and Fubini give
  #[#set math.equation(numbering: n => "(18)")
   $ parallel Psi parallel_2 = 1 \, wide integral \| partial_(y_i) Psi \|^2 = integral \| partial_i f \|^2 lt.eq
     kappa^2 . $ <eq:lifted-energy>]
  Only derivatives in the horizontal variable $y$ will be used.
  Rearrange each nonnegative fiber $Psi \( y \, dot.op \)$ into an even function nonincreasing in $\| s \|$,
    denoted $Psi^(*) \( y \, dot.op \)$. A jointly measurable version is obtained from the measurable superlevel
    lengths $mu \( y \, u \) = \| { s : Psi \( y \, s \) > u } \|$ by replacing each superlevel set with its
    centered interval of length $mu \( y \, u \)$. This preserves the $L^2$ norm.
    Since $Psi$ vanishes almost everywhere outside $B$, its rearrangement vanishes almost everywhere outside $B^(*)$.
  For nonnegative $a \, b in L^2 \( bb(R) \)$, the layer-cake formula gives
  $ integral a b = integral_0^oo #h(-0.16667em) integral_0^oo \| { a > u } ∩ { b > v } \| thin d u thin d v lt.eq
    integral a^(*) b^(*) . $
  The intersection is bounded by the smaller of the two superlevel measures,
    and centered intervals attain that bound. Since rearrangement preserves the individual norms,
    $parallel a^(*) - b^(*) parallel_2 lt.eq parallel a - b parallel_2$.
    Applying this to the fibers at $y$ and $y + h e_i$, then integrating over $y$,
    bounds the horizontal difference quotients of $Psi^(*)$ by those of $Psi$. Their weak limits yield
  #[#set math.equation(numbering: n => "(19)")
   $ integral \| partial_(y_i) Psi^(*) \|^2 lt.eq integral \| partial_i f \|^2 lt.eq kappa^2 . $ <eq:rearranged-energy>]
  Sobolev slicing and Fubini therefore imply that, for almost every $s$,
    $Psi^(*) \( dot.op \, s \) in H^1 \( bb(R)^m \)$ and vanishes almost everywhere outside $D_(\| s \|)$.
    Each nonzero such slice belongs to $H_0^1 \( D_(\| s \|) \)$ by (17).
  We next show that the rearranged density puts enough mass at heights above one. Its mean absolute height is
  #[#set math.equation(numbering: n => "(20)")
   $ M & = integral.double \| s \| Psi^(*) \( y \, s \)^2 thin d y thin d s\
 & = frac(1, 8 ell) integral_(- ell)^ell integral_(- ell)^ell integral_(bb(R)^m) min { f \( y + r e \)^2 \,
   f \( y + r' e \)^2 } thin d y thin d r thin d r' . $ <eq:mean-height>]
  Indeed, a centered interval of length $u$ has integral of $\| s \|$ equal to $u^2 \/ 4$.
    Apply this to the superlevel intervals of $Psi^(* 2)$ and use Tonelli;
    the factor $\( 2 ell \)^(- 1)$ in $Psi^2$ gives the displayed normalization.
    For nonnegative translates $u \, v$ of $f$, both of norm one,
  $ integral min \( u^2 \, v^2 \) = 1 - 1 / 2 parallel u^2 - v^2 parallel_1 gt.eq 1 - parallel u - v parallel_2 . $
  Moreover,
  $ parallel f \( dot.op + r e \) - f \( dot.op + r' e \) parallel_2 lt.eq \| r -
    r' \| thin parallel partial_e f parallel_2 lt.eq 2 ell kappa . $
  It follows from (20) that
  #[#set math.equation(numbering: n => "(21)")
   $ M gt.eq ell / 2 \( 1 - 2 ell kappa \) = 19 / 16 > 1 . $ <eq:height-lower>]
  Under the probability density $Psi^(* 2) \( y \, s \)$, we have $\| s \| < b$ almost surely; hence $M < b$.
    In particular, $D_1$ is nonempty.
  It remains to pass the derivative bounds to this particular section.
    Fix a positive definite diagonal $Q$ and put $h_Q \( s \) = lambda_Q \( D_s \)$ for $0 lt.eq s < b$.
    This function is finite and nondecreasing. Convexity of $B^(*)$, domain monotonicity and Lemma 9 give
  $ h_Q \( \( 1 - t \) s + t r \) & lt.eq lambda_Q \( \( 1 - t \) D_s + t D_r \)\
 & lt.eq \( 1 - t \) h_Q \( s \) + t h_Q \( r \) \, $
  so $h_Q$ is convex. Give $s$ the probability density $rho \( s \) = integral Psi^(*) \( y \, s \)^2 thin d y$.
    Testing the Rayleigh quotient with each nonzero slice and then integrating, we obtain
  $ integral h_Q \( \| s \| \) rho \( s \) thin d s lt.eq integral.double chevron.l Q nabla_y Psi^(*) \,
    nabla_y Psi^(*) chevron.r lt.eq kappa^2 "tr" Q . $
  This also proves the integrability needed for Jensen’s inequality. Since $1 < M < b$, monotonicity and Jensen give
  $ lambda_Q \( D_1 \) = h_Q \( 1 \) lt.eq h_Q \( M \) lt.eq integral h_Q \( \| s \| \) rho \( s \) thin d s lt.eq
    kappa^2 "tr" Q . $
  The construction of $D_1$ is independent of $Q$, so every required spectral bound is preserved.
    Taking $T_e \( K \) = D_1$ proves the lemma. ◻
]

=== 3.4 Choosing the signs <choosing-the-signs>

#proof[
  Write the prescribed coordinate directions as $e_(j_1) \, dots.h \, e_(j_s)$. Construct domains backwards by
  $ K_s = K \, wide K_(i - 1) = T_(e_(j_i)) \( K_i \) quad \( i = s \, s - 1 \, dots.h \, 1 \) . $
  Lemma 10 preserves all domain and spectral hypotheses. Each $K_i$ therefore contains zero,
    and we may start with $x^(\( 0 \)) = 0 in K_0$. Suppose $x^(\( i - 1 \)) in K_(i - 1)$, and set
  $ q = q_i \( x_(j_1)^(\( i - 1 \)) \, dots.h \, x_(j_(i - 1))^(\( i - 1 \)) \) . $
  Since $q in \[ - delta \, delta \]$, the lemma supplies $epsilon_i in { - 1 \, 1 }$ with
  $ x^(\( i \)) = x^(\( i - 1 \)) + \( q + epsilon_i \) e_(j_i) in K_i . $
  Induction gives $x^(\( s \)) in K_s = K$ and the required signs.
    Distinctness of the coordinate directions ensures that later steps do not alter the preceding coefficient
    coordinates on which a shift depends. The backwards domains may depend on the entire input sequence,
    as allowed in the proposition. ◻
]

== 4 Matrix variation along the filter <sec:matrix>

The proof of Proposition 4 must control all the states of a filtered Gaussian vector,
  even when the sequence is arbitrarily long. We first prove a deterministic estimate that measures variation of
  the filter by a total energy, rather than by the number of steps.
  Spectral localization will give separate bounds for changes in the sequence index and in Ornstein–Uhlenbeck time.

Throughout this section, fix a recursion as in Proposition 4 and a positive definite diagonal matrix $Q in
  bb(R)^(m times m)$. The sequence index is $t in { 0 \, dots.h \, n }$.
  For a real matrix $A$, write $lr(bar.v.double A bar.v.double)_(upright("HS"))^2 = "tr" \( A A^top \)$.

=== 4.1 Trace budgets and spectral scales <trace-budgets-and-spectral-scales>

The support of $R_(t - 1)$ is contained in the initial block and the first $t - 1$ new coordinates.
  Hence the new coordinate has no cross term in $R_t R_t^top$, and induction gives

#[#set math.equation(numbering: n => "(22)")
 $ R_t R_t^top = I_d \, wide L_t := R_t Q R_t^top = C_t L_(t - 1) C_t^top +
   Q_(d + t \, d + t) b_t b_t^top . $ <eq:speed-recursion>]

In particular $L_t$ is positive definite. Every $C_t$ is a contraction, since $C_t C_t^top prec.curly.eq I_d$.

Let $ell_t$ be the trace lost in the contraction in (22), and let $g_t$ be the trace added afterward.
  Both are nonnegative. Since $lr(bar.v.double b_t bar.v.double) lt.eq 1$,

#[#set math.equation(numbering: n => "(23)")
 $ sum_(t = 1)^n g_t lt.eq sum_(t = 1)^n Q_(d + t \, d + t) \, wide sum_(t = 1)^n ell_t = "tr" L_0 +
   sum_(t = 1)^n g_t - "tr" L_n lt.eq "tr" Q . $ <eq:trace-budgets>]

These two budgets are independent of the length of the sequence.

Fix the following piecewise linear cutoff on $\( 0 \, oo \)$:

$ f_0 \( x \) =
  cases(delim: "{", 0 \, & 0 < x lt.eq 1 / 2 \,, 2 x - 1 \, & 1 / 2 < x < 1 \,, 1 \, & 1 lt.eq x lt.eq 2 \,, 2 -
  x / 2 \, & 2 < x < 4 \,, 0 \, & x gt.eq 4 .) $

Thus $0 lt.eq f_0 lt.eq 1$ and its Lipschitz constant is $2$. We use the scalar functions

#[#set math.equation(numbering: n => "(24)")
 $ a = 3 / 2 \, wide w \( x \) = min { x^a \, x^(- 1) } \, wide p \( x \) = integral_0^x frac(w \( u \), u) thin d u \,\
p_1 \( x \) = integral_0^x frac(u^(a - 1), \( 1 + u \)^a) thin d u \, wide phi.alt \( x \) = min { x^(a - 1) \,
  x^(- 1) } . $ <eq:scalar-potentials>]

The potential $p$ will control changes of the cutoff between endpoint matrices,
  while $p_1$ will control gains accumulated through intervening contractions.
  The function $phi.alt$ measures the contribution of each spectral direction to the size of a scale.
  Matrix functions below are defined by spectral calculus.

For each dyadic scale $theta in 2^(bb(Z))$, set

$ X_t = L_t \/ theta \, wide F_t^theta = R_t^top f_0 \( X_t \) R_t \, wide k_t \( theta \) = "tr" phi.alt \( X_t \) . $

Here $R_t$ is $d times m$, $X_t$ is $d times d$, and $F_t^theta$ is $m times m$.
  By (22), $R_t^top$ is an isometry, so the lift preserves the localized state norm:

$ lr(bar.v.double F_t^theta x bar.v.double) = lr(bar.v.double f_0 \( X_t \) R_t x bar.v.double)
  wide \( x in bb(R)^m \) . $

It also removes dependence on state coordinates: replacing $R_t$ by $O R_t$, with $O$ orthogonal,
  replaces $X_t$ by $O X_t O^top$ and leaves $F_t^theta$ unchanged.
  The notation $X_t$ always refers to the scale currently under consideration;
  at a fixed scale we also abbreviate $F_t = F_t^theta$ and $k_t = k_t \( theta \)$.
  The geometric decay of $phi.alt$ at zero and infinity gives

#[#set math.equation(numbering: n => "(25)")
 $ sum_(theta in 2^(bb(Z))) k_t \( theta \) lt.eq C d . $ <eq:scale-size>]

Indeed, for each positive eigenvalue $lambda$ of $L_t$, the terms $phi.alt \( lambda \/ theta \)$ on either side
  of $theta = lambda$ form bounded geometric sums. On the support band of $f_0$, one has $phi.alt gt.eq 1 \/ 4$.
  It follows that

#[#set math.equation(numbering: n => "(26)")
 $ "tr" f_0 \( X_t \)^2 lt.eq 4 k_t \, wide "tr" #scale(x: 120%, y: 120%)[\(] X_t f_0 \( X_t \)^2
   #scale(x: 120%, y: 120%)[\)] lt.eq 16 k_t \, wide lr(bar.v.double F_t bar.v.double)_(upright("op")) lt.eq 1 \,\
F_t eq.not 0 quad arrow.r.double quad k_t gt.eq 1 / 4 . $ <eq:cutoff-moments>]

Every eigenvalue of $L_t$ lies between the smallest and largest diagonal entries of $Q$.
  Consequently only finitely many scales have $F_t^theta eq.not 0$ for some $t$,
  and every such scale satisfies $theta lt.eq 2 lr(bar.v.double Q bar.v.double)_(upright("op"))$.

We now assign an additive energy to intervals of sequence indices.
  Put $h = p + p_1$ and $hat(X)_i = C_i X_(i - 1) C_i^top$. Define

#[#set math.equation(numbering: n => "(27)")
 $ E_theta \( s \, t \) = sum_(i = s + 1)^t {"tr" h \( X_(i - 1) \) - "tr" h \( hat(X)_i \) + "tr" h \( X_i \) -
   "tr" h \( hat(X)_i \)} \, wide 0 lt.eq s lt.eq t lt.eq n . $ <eq:energy-definition>]

The ordered eigenvalues decrease under a contraction and increase under a positive semidefinite gain.
  Since $h$ is increasing, every trace difference in braces is nonnegative.
  In particular, $E_theta$ is nonnegative and additive on adjacent index intervals.

The derivatives of the two functions satisfy, uniformly for $x > 0$,

$ sum_(theta in 2^(bb(Z))) #scale(x: 120%, y: 120%)[\(] p' \( x \/ theta \) +
  p'_1 \( x \/ theta \) #scale(x: 120%, y: 120%)[\)] lt.eq C . $

For $p'$, use the bounds $u^(1 \/ 2)$ for $u lt.eq 1$ and $u^(- 2)$ for $u gt.eq 1$; for $p'_1$,
  use $u^(1 \/ 2)$ and $u^(- 1)$ respectively. All four dyadic sums are geometric.
  Pairing ordered eigenvalues before and after each contraction or gain,
  and integrating the last bound between each pair, proves

#[#set math.equation(numbering: n => "(28)")
 $ sum_(theta in 2^(bb(Z))) theta E_theta \( 0 \, n \) lt.eq C (sum_i ell_i + sum_i g_i) lt.eq
   C "tr" Q . $ <eq:scale-energy>]

The factor $theta$ cancels the factor $1 \/ theta$ from differentiating $p \( x \/ theta \)$ or $p_1 \( x \/ theta \)$.

Here is the variation estimate to be used in the next section.

#thm([Lemma 4.1.])[
  (Weighted increment estimate).  #emph[There are absolute constants $e_0 > 0$ and $C <
    oo$ with the following property. For every recursion in Proposition 4, every positive definite diagonal $Q$,
    every dyadic $theta$, and $0 lt.eq s lt.eq t lt.eq n$, if $E = E_theta \( s \, t \) lt.eq e_0$, then
#[#set math.equation(numbering: n => "(29)")
 $ parallel \( F_t^theta - F_s^theta \) \( I_m + Q \/ theta \)^(1 \/ 2)
   #scale(x: 120%, y: 120%)[parallel]_(upright("HS"))^2 lt.eq C #scale(x: 120%, y: 120%)[\(] 1 +
   k_t \( theta \) #scale(x: 120%, y: 120%)[\)] E^(1 \/ a) \, wide a = 3 / 2 . $ <eq:increment>]

]
] <lem:increment>

We prove this in three steps. A scalar inequality first controls changes of spectral cutoffs.
  Exact matrix expansions then compare the two endpoints using the old part of the state and the accumulated new
  gains. Finally, a separate estimate bounds those accumulated gains by the additive energy,
  even through noncommuting contractions.

=== 4.2 A scalar comparison <a-scalar-comparison>

For $x \, y > 0$, define

$ cal(J) \( x \, y \) = p \( x \) - p \( y \) + (y / x - 1) frac(w \( x \) + w \( y \), 2) . $

#thm([Lemma 4.2.])[
  #emph[There is an absolute $c > 0$ such that, for all $x \, y > 0$,
#[#set math.equation(numbering: n => "(30)")
 $ cal(J) \( x \, y \) & gt.eq c \( 1 + y \) \| f_0 \( x \) - f_0 \( y \) \|^2 \,\
y / x cal(J) \( y \, x \) & gt.eq c \( 1 + y \) \| f_0 \( x \) - f_0 \( y \) \|^2 . $ <eq:scalar-comparison>]

]
] <lem:scalar-comparison>

#proof[
  The function $u mapsto log w \( e^u \) = min { a u \, - u }$ is $a$-Lipschitz. Write $r = y \/ x$.
    For $r < 1$, the two endpoint lower bounds give
  $ w \( u \) gt.eq max { w \( x \) \( u \/ x \)^a \, thin w \( y \) \( y \/ u \)^a } \, wide y lt.eq u lt.eq x . $
  The two expressions cross inside $\[ y \, x \]$, by the same Lipschitz bound.
    Integrating them against $d u \/ u$ yields
  $ p \( x \) - p \( y \) gt.eq frac(w \( x \) + w \( y \) - 2 sqrt(w \( x \) w \( y \)) thin r^(a \/ 2), a) . $
  For $r > 1$, integration of the minimum of the corresponding endpoint upper bounds on $\[ x \, y \]$ gives
  $ p \( y \) - p \( x \) lt.eq frac(2 sqrt(w \( x \) w \( y \)) thin r^(a \/ 2) - w \( x \) - w \( y \), a) . $
  Using $2 sqrt(w \( x \) w \( y \)) lt.eq w \( x \) + w \( y \)$ in either case, we obtain
  #[#set math.equation(numbering: n => "(31)")
   $ cal(J) \( x \, y \) gt.eq frac(w \( x \) + w \( y \), 2) B \( r \) \, wide B \( r \) = r - 1 -
     frac(r^(a \/ 2) - 1, a \/ 2) . $ <eq:scalar-remainder>]
  If $b = a \/ 2 = 3 \/ 4$, then $B \( 1 \) = B' \( 1 \) = 0$ and $B'' \( r \) = \( 1 - b \) r^(b - 2) > 0$.
    Moreover $B \( 0 + \) = 1 \/ b - 1 > 0$ and $B \( r \) \/ r arrow.r 1$ at infinity.
    Thus, with an absolute positive constant,
  $ B \( r \) gt.eq
    c cases(delim: "{", 1 \, & 0 < r lt.eq 1 / 2 \,, \( r - 1 \)^2 \, & 1 / 2 lt.eq r lt.eq 2 \,, r \, & r gt.eq 2 .) $
  The function $r B \( 1 \/ r \)$ satisfies the same bounds, after changing $c$.
    Applying (31) with the arguments reversed therefore gives these bounds for both left sides of (30).
  If $f_0 \( x \) eq.not f_0 \( y \)$, at least one argument belongs to $\[ 1 \/ 2 \, 4 \]$.
    When $1 \/ 2 lt.eq r lt.eq 2$, both arguments lie in $\[ 1 \/ 4 \, 8 \]$, where $w$ is bounded below and $1 +
    y$ is bounded above. The Lipschitz bound $\| f_0 \( x \) - f_0 \( y \) \| lt.eq 2 x \| r - 1 \|$ applies.
    When $r lt.eq 1 \/ 2$, one $w$ value is bounded below and $y lt.eq 4$.
    When $r gt.eq 2$, one $w$ value is again bounded below, and either $y lt.eq 4$ or $y = r x lt.eq 4 r$.
    The preceding three bounds, together with $\| f_0 \( x \) - f_0 \( y \) \| lt.eq 1$, prove the result.
    If the cutoff values are equal, the right sides vanish and the result follows directly from (31). ◻
]

=== 4.3 Comparing the endpoints <comparing-the-endpoints>

Fix a scale and indices $s lt.eq t$. Abbreviate

$ Y = X_s \, wide X = X_t \, wide cal(C) = C_t dots.h.c C_(s + 1) \, wide Z = cal(C) Y cal(C)^top \, wide V = X - Z . $

An empty product is the identity. The recursion shows that $V$ is positive semidefinite:
  it is the sum of all intervening gains, each transported through the contractions that follow it.
  The matrices $Y \, X \, Z$ are positive definite, since every $C_i$ is invertible.

#thm([Lemma 4.3.])[
  (Endpoint comparison).  #emph[With the preceding notation,
#[#set math.equation(numbering: n => "(32)")
 $ parallel \( F_t - F_s \) \( I_m + Q \/ theta \)^(1 \/ 2) #scale(x: 120%, y: 120%)[parallel]_(upright("HS"))^2
   lt.eq C {"tr" #scale(x: 120%, y: 120%)[\(] p \( Y \) - p \( Z \) #scale(x: 120%, y: 120%)[\)] +
   "tr" #scale(x: 120%, y: 120%)[\(] p \( X \) - p \( Z \) #scale(x: 120%, y: 120%)[\)]} . $ <eq:endpoint-comparison>]

]
] <lem:endpoint-comparison>

#proof[
  Let $P_s$ be the coordinate projection onto the initial block and the first $s$ new coordinates, and put
  $ Q_(upright("old")) = P_s \( Q \/ theta \) P_s \, wide Q_(upright("new")) = Q \/ theta - Q_(upright("old")) . $
  Diagonality of $Q$ makes these nonnegative matrices with disjoint coordinate supports.
    Since $R_t P_s = cal(C) R_s$, the support identities are
  #[#set math.equation(numbering: n => "(33)")
   $ R_t R_s^top = cal(C) \, wide R_t Q_(upright("old")) R_s^top = cal(C) Y \, wide
     R_t Q_(upright("old")) R_t^top = Z \,\
R_t Q_(upright("new")) R_t^top = V \, wide F_s Q_(upright("new")) = 0 . $ <eq:old-new-support>]
  We split the right weight into $I_m + Q_(upright("old"))$ and $Q_(upright("new"))$,
    and use the intermediate matrix $tilde(F) = R_t^top f_0 \( Z \) R_t$ for the first part.
  ===== 4.3.1 The old state under contraction. <the-old-state-under-contraction.>
  Choose orthonormal eigenbases of $Z$ and $Y$, with eigenvalues $z_i$ and $y_j$.
    Let $m_(i j)$ be the squared entries of $cal(C)$ in these bases.
    Its row and column sums are at most one; denote their deficits by
  $ d_i = 1 - sum_j m_(i j) \, wide h_j = 1 - sum_i m_(i j) . $
  The matrix $n_(i j) = m_(i j) y_j \/ z_i$ has both row and column sums one.
    For rows this follows from $Z = cal(C) Y cal(C)^top$; for columns it follows from the identity
  $ cal(C)^top Z^(- 1) cal(C) = Y^(- 1) \, $
  which uses invertibility of $cal(C)$.
  Expanding the weighted squared distance with (33), its two diagonal terms are
    $"tr" \( f_0 \( Z \)^2 \( I_d + Z \) \)$ and $"tr" \( f_0 \( Y \)^2 \( I_d + Y \) \)$.
    The cross term, before multiplication by two, is $sum_(i j) m_(i j) \( 1 + y_j \) f_0 \( z_i \)
    f_0 \( y_j \)$. Since $sum_j m_(i j) y_j = z_i$, this gives the exact expansion
  #[#set math.equation(numbering: n => "(34)")
   $ & parallel \( tilde(F) - F_s \) \( I_m + Q_(upright("old")) \)^(1 \/ 2)
     #scale(x: 120%, y: 120%)[parallel]_(upright("HS"))^2\
 & quad = sum_(i j) m_(i j) \( 1 + y_j \) #scale(x: 120%, y: 120%)[\(] f_0 \( z_i \) -
   f_0 \( y_j \) #scale(x: 120%, y: 120%)[\)]^2 + sum_i d_i f_0 \( z_i \)^2 +
   sum_j h_j \( 1 + y_j \) f_0 \( y_j \)^2 . $ <eq:contraction-distance>]
  Expanding $cal(J)$ instead, the two stochastic sums of $n$ and the relation $n_(i j) z_i \/ y_j = m_(i j)$ yield
  #[#set math.equation(numbering: n => "(35)")
   $ "tr" #scale(x: 120%, y: 120%)[\(] p \( Y \) - p \( Z \) #scale(x: 120%, y: 120%)[\)] =
     sum_(i j) n_(i j) cal(J) \( y_j \, z_i \) + 1 / 2 sum_i d_i w \( z_i \) + 1 /
     2 sum_j h_j w \( y_j \) . $ <eq:contraction-deficits>]
  The second inequality of Lemma 12 controls the double sum in (34).
    The remaining terms are controlled by the deficits in (35),
    since both $f_0 \( u \)^2$ and $\( 1 + u \) f_0 \( u \)^2$ are bounded by an absolute multiple of $w \( u \)$.
    This proves the required bound for $tilde(F) - F_s$.
  ===== 4.3.2 The accumulated gain. <the-accumulated-gain.>
  Now choose eigenbases of $X$ and $Z$, with eigenvalues $x_i$ and $z_j$,
    and let $m_(i j)$ be the squared entries of their orthogonal change of basis. Both sums of $m$ equal one.
    Set $n_(i j) = m_(i j) z_j \/ x_i$. Its row sums are at most one by $Z prec.curly.eq X$,
    and its column sums are at most one by $X^(- 1) prec.curly.eq Z^(- 1)$:
    explicitly, for a unit $z_j$-eigenvector $v_j$,
  $ sum_i n_(i j) = z_j v_j^top X^(- 1) v_j lt.eq z_j v_j^top Z^(- 1) v_j = 1 . $
  Write $d'_i \, h'_j$ for these row and column deficits. Expansion of $cal(J)$ now gives
  #[#set math.equation(numbering: n => "(36)")
   $ "tr" #scale(x: 120%, y: 120%)[\(] p \( X \) - p \( Z \) #scale(x: 120%, y: 120%)[\)] =
     sum_(i j) m_(i j) cal(J) \( x_i \, z_j \) + 1 / 2 sum_i d'_i w \( x_i \) + 1 /
     2 sum_j h'_j w \( z_j \) . $ <eq:gain-deficits>]
  The coisometry $R_t R_t^top = I_d$ and (33) show that
  $ & parallel \( F_t - tilde(F) \) \( I_m + Q_(upright("old")) \)^(1 \/ 2)
    #scale(x: 120%, y: 120%)[parallel]_(upright("HS"))^2\
 & wide = parallel \( f_0 \( X \) - f_0 \( Z \) \) \( I_d + Z \)^(1 \/ 2)
   #scale(x: 120%, y: 120%)[parallel]_(upright("HS"))^2 = sum_(i j) m_(i j) \( 1 + z_j \)
   #scale(x: 120%, y: 120%)[\(] f_0 \( x_i \) - f_0 \( z_j \) #scale(x: 120%, y: 120%)[\)]^2 . $
  The first inequality of Lemma 12 controls this by (36).
  It remains to include the new-coordinate part of the right weight. By (33), it is exactly
  #[#set math.equation(numbering: n => "(37)")
   $ parallel \( F_t - F_s \) Q_(upright("new"))^(1 \/ 2) #scale(x: 120%, y: 120%)[parallel]_(upright("HS"))^2 =
     "tr" #scale(x: 120%, y: 120%)[\(] f_0 \( X \)^2 V #scale(x: 120%, y: 120%)[\)] =
     sum_i x_i d'_i f_0 \( x_i \)^2 . $ <eq:new-coordinate-distance>]
  Here $x_i d'_i$ is the $i$th diagonal entry of $X - Z$ in the $X$-eigenbasis.
    The bound $u f_0 \( u \)^2 lt.eq C w \( u \)$ controls this term by the row deficits in (36).
    Finally apply the squared triangle inequality to $\( F_t - tilde(F) \) + \( tilde(F) - F_s \)$ with the old
    weight, and add (37). This proves (32). ◻
]

The endpoint comparison has accounted for all coordinate weights.
  Its remaining difficulty is that $p \( X \) - p \( Z \)$ describes a single accumulated gain,
  whereas the energy in (27) records gains separated by contractions. The next estimate connects these two quantities.

=== 4.4 Controlling the accumulated gain <controlling-the-accumulated-gain>

#thm([Lemma 4.4.])[
  #emph[For the matrices $X \, Y \, Z \, V$ above, suppose $E = E_theta \( s \, t \) lt.eq e_0$, where
$ c_a = a 2^a \, wide e_0 = frac(1, 16 c_a) \, wide a = 3 / 2 . $

 If $q = \( c_a E \)^(1 \/ a)$, then $q < 1 \/ 4$ and
#[#set math.equation(numbering: n => "(38)")
 $ V prec.curly.eq q \( I_d + X \) \, wide "tr" #scale(x: 120%, y: 120%)[\(] p \( X \) -
   p \( Z \) #scale(x: 120%, y: 120%)[\)] lt.eq C q "tr" phi.alt \( X \) . $ <eq:direct-gain>]

]
] <lem:direct-gain>

#proof[
  Follow the old and new parts separately through the interval $\[ s \, t \]$.
    Start with $\( Z_(*) \, V_(*) \) = \( Y \, 0 \)$. At each contraction,
    replace both matrices by their congruences under $C_i$. At each gain,
    add the positive semidefinite gain to $V_(*)$ only, interpolating linearly during this addition.
    At every stage $D = Z_(*) + V_(*)$ is the matrix in the original contraction-and-gain path;
    at the endpoint $\( Z_(*) \, V_(*) \) = \( Z \, V \)$.
  Define
  $ S = I_d + Z_(*) \, wide A = S^(- 1 \/ 2) V_(*) S^(- 1 \/ 2) \, wide G = "tr" A^a . $
  The use of $I_d + Z_(*)$ makes this quantity stable under contractions.
    We will show that its increases during gains are paid for by the $p_1$ part of the energy.
  ===== 4.4.1 Contractions do not increase $G$. <contractions-do-not-increase-g.>
  For a contraction $C$, put $S' = I_d + C Z_(*) C^top$ and $T_c = \( S' \)^(- 1 \/ 2) C S^(1 \/ 2)$.
    The new relative matrix is $A' = T_c A T_c^top$. Moreover
  $ S' - C S C^top = I_d - C C^top succ.curly.eq 0 \, wide T_c T_c^top prec.curly.eq I_d . $
  Thus the ordered eigenvalues of $A'$ are no larger than those of $A$; for example,
    compare the singular values of $T_c A^(1 \/ 2)$ and $A^(1 \/ 2)$.
    Raising these nonnegative eigenvalues to the power $a$ and summing proves $"tr" \( A' \)^a lt.eq "tr" A^a$.
    This argument uses eigenvalue comparison, not operator monotonicity of the power $a$.
  ===== 4.4.2 The derivative during a gain. <the-derivative-during-a-gain.>
  Here $S$ is fixed and $dot(V)_(*) succ.curly.eq 0$. Introduce
  $ J = I_d + D = S + V_(*) \, wide H = J^(- 1 \/ 2) V_(*) J^(- 1 \/ 2) \, wide T = S^(- 1 \/ 2) J^(1 \/ 2) . $
  Since $I_d - H = J^(- 1 \/ 2) S J^(- 1 \/ 2)$ is positive definite,
  $ T^top T = \( I_d - H \)^(- 1) . $
  Write the polar decomposition as $T = U \( I_d - H \)^(- 1 \/ 2)$, where $U$ is orthogonal. Then
  #[#set math.equation(numbering: n => "(39)")
   $ A = T H T^top = U #scale(x: 120%, y: 120%)[\[] H \( I_d - H \)^(- 1) #scale(x: 120%, y: 120%)[\]] U^top .
     $ <eq:relative-spectrum>]
  In particular, the eigenvalues of $A$ are $h \/ \( 1 - h \)$, where $h$ ranges over the eigenvalues of $H$.
  For a continuously differentiable scalar function $g$ on the spectral range of a differentiable symmetric matrix
    path $A \( xi \)$, $frac(d, d xi) "tr" g \( A \) = "tr" \( g' \( A \) dot(A) \)$.
    One can verify this first for polynomials by cyclicity of the trace,
    then approximate $g'$ uniformly by polynomials and integrate along the path.
    Applied to $g \( u \) = u^a$, this gives
  #[#set math.equation(numbering: n => "(40)")
   $ dot(G) = a "tr" #scale(x: 120%, y: 120%)[\(] S^(- 1 \/ 2) A^(a - 1) S^(- 1 \/ 2) dot(V)_(*)
     #scale(x: 120%, y: 120%)[\)] . $ <eq:gain-derivative>]
  This formula remains valid when $A$ is singular, because $u mapsto
    u^a$ is continuously differentiable at zero for $a > 1$. The coefficient in this trace has the exact
    conjugation identity
  #[#set math.equation(numbering: n => "(41)")
   $ J^(1 \/ 2) S^(- 1 \/ 2) A^(a - 1) S^(- 1 \/ 2) J^(1 \/ 2) & = T^top A^(a - 1) T\
 & = H^(a - 1) \( I_d - H \)^(- a) . $ <eq:gain-conjugation>]
  The second equality follows from (39) and the polar decomposition.
    The factors on its right commute because they are functions of $H$;
    no commutation of $Z_(*)$ and $V_(*)$ is assumed.
  As long as $G lt.eq 1$, every eigenvalue of $A$ is at most one, so (39) gives $H prec.curly.eq I_d \/ 2$.
    Since $a - 1 = 1 \/ 2$, spectral calculus in $H$ then gives
  $ H^(a - 1) \( I_d - H \)^(- a) prec.curly.eq 2^a H^(1 \/ 2) . $
  Also $V_(*) prec.curly.eq D$, and hence
  $ H prec.curly.eq J^(- 1 \/ 2) D J^(- 1 \/ 2) = D \( I_d + D \)^(- 1) . $
  The square root preserves positive semidefinite order. One direct proof is the convergent integral formula
  $ M^(1 \/ 2) = 1 / pi integral_0^oo u^(- 1 \/ 2) M \( u I_d + M \)^(- 1) thin d u \, wide M succ.curly.eq 0 : $
  the integrand preserves order because $M \( u I_d + M \)^(- 1) = I_d -
    u \( u I_d + M \)^(- 1)$ and inversion reverses order. It follows that
  $ H^(1 \/ 2) prec.curly.eq D^(1 \/ 2) \( I_d + D \)^(- 1 \/ 2) . $
  Conjugating (41) back by $J^(- 1 \/ 2)$ yields
  $ S^(- 1 \/ 2) A^(a - 1) S^(- 1 \/ 2) prec.curly.eq 2^a D^(1 \/ 2) \( I_d + D \)^(- 3 \/ 2) = 2^a p'_1 \( D \) . $
  Pair this inequality with $dot(V)_(*) succ.curly.eq 0$ in (40).
    Since $dot(D) = dot(V)_(*)$ during a gain, we obtain the conditional differential bound
  #[#set math.equation(numbering: n => "(42)")
   $ dot(G) lt.eq c_a "tr" #scale(x: 120%, y: 120%)[\(] p'_1 \( D \) dot(V)_(*) #scale(x: 120%, y: 120%)[\)] =
     c_a frac(d, d xi) "tr" p_1 \( D \) \, wide G lt.eq 1 . $ <eq:gain-differential-bound>]
  ===== 4.4.3 Closing the bound. <closing-the-bound.>
  Initially $G = 0$, and contractions cannot increase it. The sum of all increases of $"tr"
    p_1 \( D \)$ during gains is at most $E$, by (27). If $G$ first reached one during a gain,
    integration of (42) up to that point would give $G lt.eq c_a E lt.eq 1 \/ 16$, a contradiction.
    Thus the differential bound applies throughout, and $G lt.eq c_a E$ at the endpoint. In particular,
  $ A prec.curly.eq q I_d \, wide V prec.curly.eq q \( I_d + Z \) prec.curly.eq q \( I_d + X \) \, wide q lt.eq
    16^(- 2 \/ 3) < 1 / 4 . $
  If $E = 0$, this already gives $V = 0$ and the second conclusion in (38). Suppose now that $q > 0$.
  The ordered eigenvalues of $X$ and $Z$ obey
  $ x_j gt.eq z_j gt.eq \( 1 - q \) x_j - q \, $
  because $X - Z = V prec.curly.eq q \( I_d + X \)$. For a corresponding pair $x \, z$, if $x lt.eq 4 q lt.eq 1$, then
  $ p \( x \) - p \( z \) lt.eq p \( x \) = x^a / a lt.eq 4 / a q x^(a - 1) = 4 / a q phi.alt \( x \) . $
  If $x > 4 q$, then $z gt.eq x \/ 2$ and $x - z lt.eq q \( 1 + x \)$.
    On $\[ x \/ 2 \, x \]$ we have $w \( u \) lt.eq 2^a w \( x \)$ and $u^(- 1) lt.eq 2 \/ x$, so
  $ p \( x \) - p \( z \) lt.eq C q \( 1 + x^(- 1) \) w \( x \) lt.eq C q phi.alt \( x \) . $
  The last inequality holds for both $x lt.eq 1$ and $x gt.eq 1$ directly from (24).
    Summing over the eigenvalues proves the trace bound in (38). ◻
]

#proof[
  The total variation of $"tr" p$ along the separate contraction and gain steps from $s$ to $t$ is at most $E$.
    Therefore
  $ \| "tr" p \( Y \) - "tr" p \( X \) #scale(x: 120%, y: 120%)[\|] lt.eq E . $
  Together with Lemma 14, this bounds the sum on the right of (32) by
  $ E + 2 "tr" #scale(x: 120%, y: 120%)[\(] p \( X \) - p \( Z \) #scale(x: 120%, y: 120%)[\)] lt.eq E +
    C E^(1 \/ a) k_t . $
  Since $0 lt.eq E lt.eq e_0 lt.eq 1$, we have $E lt.eq E^(1 \/ a)$. Lemma 13 now proves (29), including $E = 0$. ◻
]

The two estimates needed for the probability argument are now in place.
  Equation (28) bounds the sum of the energies over all spectral scales,
  while Lemma 11 turns a short interval in this energy into a small Gaussian increment.
  In particular, zero energy implies $F_t^theta = F_s^theta$ exactly,
  so repeated indices at zero distance will not increase the size of a covering in the next section.

== 5 Uniform Gaussian survival <sec:survival>

We now prove Proposition 4. The matrix estimates of the preceding section measure how much the filtered
  constraints change as the sequence index varies. At a fixed spectral scale,
  we use that estimate to control each bounded-energy group of states over one short interval of
  Ornstein–Uhlenbeck time with a fixed positive probability.
  Gaussian correlation then combines these intervals and the spectral scales.
  Their total cost per unit time is bounded by $C "tr" Q$, which gives the required Dirichlet-energy bound.

=== 5.1 Stationary survival and Dirichlet energy <stationary-survival-and-dirichlet-energy>

Let $Q$ be a positive definite diagonal matrix on $bb(R)^m$, and let $U \( tau \)$ be the stationary solution of

$ d U = - Q U thin d tau + sqrt(2 Q) thin d B \( tau \) . $

Here $B$ is standard $m$-dimensional Brownian motion and $U \( 0 \)$ has standard Gaussian law $gamma_m$,
  independently of its future driving noise. Thus the generator is

$ cal(L)_Q = "tr" \( Q nabla^2 \) - chevron.l Q x \, nabla chevron.r \, wide
  "Cov" \( U \( tau \) \, U \( sigma \) \) = e^(- Q \| tau - sigma \|) . $

Throughout, $tau$ denotes Ornstein–Uhlenbeck time and $t$ denotes the sequence index.

#thm([Lemma 5.1.])[
  #emph[Let $D subset bb(R)^m$ be bounded, nonempty, open and convex. Define
$ lambda_Q^(upright("OU")) \( D \) = inf_(0 eq.not h in H_0^1 \( D \))
  frac(integral_D chevron.l Q nabla h \, nabla h chevron.r thin d gamma_m, integral_D h^2 thin d gamma_m) . $

 For every $T > 0$,
#[#set math.equation(numbering: n => "(43)")
 $ bb(P) { U \( \[ 0 \, T \] \) subset D } lt.eq e^(- T lambda_Q^(upright("OU")) \( D \)) \, wide
   lambda_Q \( D \) lt.eq lambda_Q^(upright("OU")) \( D \) + 1 / 2 "tr" Q . $ <eq:ou-comparison>]

]
] <lem:ou-energy>

#proof[
  The Gaussian density and its reciprocal are bounded on $D$,
    so the Gaussian and Lebesgue $H_0^1$ form domains agree. Integration by parts identifies the displayed form
    with the killed Ornstein–Uhlenbeck semigroup $P_T^D$. Its $L^2 \( gamma_m \)$ operator norm is
    $e^(- T lambda_Q^(upright("OU")) \( D \))$. The killed-semigroup representation used in Lemma 6 therefore gives
  $ bb(P) { U \( \[ 0 \, T \] \) subset D } = chevron.l upright(bold(1))_D \,
    P_T^D upright(bold(1))_D chevron.r_(L^2 \( gamma_m \)) lt.eq
    gamma_m \( D \) e^(- T lambda_Q^(upright("OU")) \( D \)) . $
  This proves the first inequality. Equivalently, the representation follows from the Dirichlet Feynman–Kac
    formula after the conjugation below; its potential is bounded on $D$ #cite(label("DaviesSimon1984")).
  Write $rho \( x \) = \( 2 pi \)^(- m \/ 2) e^(- \| x \|^2 \/ 2)$ and put $g = h sqrt(rho)$.
    For $h in C_c^oo \( D \)$, expansion and integration by parts give
  $ integral_D chevron.l Q nabla h \, nabla h chevron.r thin d gamma_m =
    integral_D [chevron.l Q nabla g \, nabla g chevron.r + (1 / 4 x^T Q x - 1 / 2 "tr" Q) g^2] d x . $
  The identity extends by form closure to $H_0^1 \( D \)$. Multiplication by $sqrt(rho)$ maps this space
    bijectively to itself and preserves the corresponding $L^2$ norms.
    Since the potential is at least $- "tr" Q \/ 2$, taking Rayleigh infima proves the second inequality. ◻
]

=== 5.2 One energy interval at one spectral scale <one-energy-interval-at-one-spectral-scale>

Fix the data of Proposition 4 and a positive diagonal $Q$.
  We use the matrices and scalar quantities from the preceding section:

$ L_t = R_t Q R_t^T \, wide X_t = L_t \/ theta \, wide F_t = F_t^theta = R_t^T f_0 \( X_t \) R_t \, wide k_t =
  k_t \( theta \) = "tr" phi.alt \( X_t \) . $

In this subsection the dyadic scale $theta$ is fixed. Recall that $a =
  3 \/ 2$ and that $E_theta \( s \, t \)$ is additive and nonnegative for $s lt.eq t$. Put $h_t = E_theta \( 0 \, t \)$.

#thm([Lemma 5.2.])[
  #emph[There is an absolute $c_1$ with the following property.
    Let $cal(I) subset { 0 \, dots.h \, n }$ be an index set whose values $h_t$ lie in an interval of length at
    most $e_0$, where $e_0$ is the constant in Lemma 11. For every $u gt.eq 0$,
#[#set math.equation(numbering: n => "(44)")
 $ bb(P) {lr(bar.v.double F_t U \( tau \) bar.v.double) lt.eq c_1 sqrt(k_t) upright(" for every ") t in cal(I) \,
   med u lt.eq tau lt.eq u + theta^(- 1)} gt.eq 1 / 2 . $ <eq:epoch-prob>]

 The same conclusion holds on any shorter time interval.]
] <lem:epoch-prob>

#proof[
  We may omit indices with $F_t = 0$. By (26), every remaining index has $k_t gt.eq 1 \/ 4$.
    Divide these indices into the classes
  $ cal(I)_j = { t in cal(I) : K_j lt.eq k_t < 2 K_j } \, wide K_j = 2^j \/ 4 \, wide j = 0 \, 1 \, dots.h . $
  We first bound the expected supremum within one nonempty class, writing $k = K_j$.
  Stationarity, coisometry and (26) give
  #[#set math.equation(numbering: n => "(45)")
   $ bb(E) lr(bar.v.double F_t U \( tau \) bar.v.double)^2 = "tr" f_0 \( X_t \)^2 lt.eq 4 k_t lt.eq
     8 k . $ <eq:vector-second-moment>]
  For two indices in the class, Lemma 11, with the indices put in chronological order, implies
  #[#set math.equation(numbering: n => "(46)")
   $ bb(E) lr(bar.v.double \( F_t - F_s \) U \( tau \) bar.v.double)^2 lt.eq C k \| h_t -
     h_s \|^(1 \/ a) . $ <eq:index-increment>]
  Here we dropped the positive right weight in that lemma and used $1 + k_t lt.eq 6 k$.
    For time increments at a fixed index,
  $ "Cov" \( U \( tau \) - U \( sigma \) \) = 2 \( I - e^(- Q \| tau - sigma \|) \) prec.curly.eq 2 \| tau -
    sigma \| Q \, $
  so that
  #[#set math.equation(numbering: n => "(47)")
   $ bb(E) lr(bar.v.double F_t \( U \( tau \) - U \( sigma \) \) bar.v.double)^2 & lt.eq 2 \| tau -
     sigma \| "tr" \( F_t^2 Q \)\
 & = 2 theta \| tau - sigma \| "tr" \( X_t f_0 \( X_t \)^2 \) lt.eq C k theta \| tau - sigma \| . $ <eq:time-increment>]
  This trace identity uses $R_t R_t^T = I$; it does not require $Q$ and $F_t$ to commute.
  We give the elementary chaining argument for the two parameters.
    Choose $H$ so that $h_t in \[ H \, H + e_0 \]$ for every index under consideration,
    and put $alpha = \( h_t - H \) \/ e_0$ and $beta = theta \( tau - u \)$ in $\[ 0 \, 1 \]$.
    Split a mixed increment into an index increment and a time increment.
    Equations (46) and (47) bound its second moment by
  $ C k #scale(x: 120%, y: 120%)[\(] \| alpha - alpha' \|^(1 \/ a) + \| beta -
    beta' \| #scale(x: 120%, y: 120%)[\)] \, $
  where $alpha$ is the normalized energy coordinate; the constant absorbs $e_0 lt.eq 1$.
    At depth $l$, divide both parameter intervals into dyadic cells of width $2^(- l)$ and choose a representative
    from each occupied product cell. There are at most $C 4^l$ representatives.
    The increment from each representative to that of its parent cell is a centered Gaussian vector with second
    moment at most
  $ v_l = C k 2^(- l \/ a) . $
  For use here, if $G_1 \, dots.h \, G_M$ are arbitrarily dependent centered Gaussian vectors and $bb(E)
    lr(bar.v.double G_i bar.v.double)^2 lt.eq v$, then
  #[#set math.equation(numbering: n => "(48)")
   $ bb(E) max_(i lt.eq M) lr(bar.v.double G_i bar.v.double) lt.eq
     2 sqrt(v \( log M + 1 \/ 2 \)) . $ <eq:gaussian-vector-max>]
  Indeed, for $v > 0$, diagonalizing the covariance of $G_i$ gives $bb(E)
    e^(lr(bar.v.double G_i bar.v.double)^2 \/ \( 4 v \)) lt.eq e^(1 \/ 2)$,
    because its eigenvalues are nonnegative and sum to at most $v$.
    Bound the exponential of the maximum by the sum of the exponentials,
    then use Jensen’s inequality and Cauchy–Schwarz. The case $v = 0$ is immediate.
  Apply (48) to the increments at each depth. Starting with (45) and summing the parent increments gives an
    absolute $C_0$ such that
  #[#set math.equation(numbering: n => "(49)")
   $ bb(E) sup_(t in cal(I)_j\
u lt.eq tau lt.eq u + theta^(- 1)) lr(bar.v.double F_t U \( tau \) bar.v.double) lt.eq
  C sqrt(k) (1 + sum_(l gt.eq 1) 2^(- l \/ \( 2 a \)) \( 1 + sqrt(l) \)) lt.eq C_0 sqrt(k) . $ <eq:class-mean>]
  To justify convergence of the representatives, note that there are only finitely many distinct energy values.
    If $h_t = h_s$, Lemma 11 gives $F_t = F_s$ exactly. At sufficiently fine depth a target index therefore has
    the same filter as its representative, and the representative times converge to its target time.
    Continuity of $U$ completes the passage to the supremum. Equivalently,
    one may first use finite time grids and then increase them to a dense set.
    Neither argument uses a lower bound on the positive gaps between energy values.
    In particular, the number of indices does not enter (49).
  It remains to control all the $k$ classes at once. On a finite time grid the supremum $S_j$ in (49) is a maximum
    of Gaussian vector norms. Represent the joint Gaussian vectors as linear images of one standard Gaussian
    vector. Each corresponding linear map has norm at most one because its output covariance is $F_t^2
    prec.curly.eq I$, by (26); consequently $S_j$ is a $1$-Lipschitz function of that standard Gaussian vector.
    Equivalently, it is a supremum of scalar Gaussian functionals, each with variance at most one.
  Markov’s inequality and (49) give $bb(P) { S_j lt.eq 2 C_0 sqrt(K_j) } gt.eq 1 \/ 2$.
    Borell’s Gaussian enlargement inequality #cite(label("Borell1975")) Theorem 3.1, applied to this sublevel set, gives
  $ bb(P) { S_j > 2 C_0 sqrt(K_j) + r } lt.eq 1 - Phi \( r \) lt.eq e^(- r^2 \/ 2) \, wide r gt.eq 0 \, $
  where $Phi$ is the standard normal distribution function.
    The same bound holds for the full time supremum by increasing dense grids and path continuity.
    Choose $c_1 > 2 C_0$. The probability that any constraint in class $j$ exceeds $c_1 sqrt(k_t)$ is at most
  $ exp #scale(x: 120%, y: 120%)[\(] - \( c_1 - 2 C_0 \)^2 K_j \/ 2 #scale(x: 120%, y: 120%)[\)] . $
  With $A = \( c_1 - 2 C_0 \)^2 \/ 8$, the sum of these bounds is at most
  $ sum_(j gt.eq 0) e^(- A 2^j) lt.eq frac(e^(- A), 1 - e^(- A)) lt.eq 1 / 2 $
  once $c_1$ is an absolute constant large enough that $A gt.eq log 3$. This proves (44).
    Restricting the time interval can only increase its probability. ◻
]

The two bounds in this proof have different roles: the trace of the covariance controls the expected vector norm,
  while its operator norm gives the absolute concentration parameter.
  This distinction is what allows the class failure probabilities to be summed without a factor depending on the
  dimension.

=== 5.3 Combining the constraints <combining-the-constraints>

#proof[
  Fix $d \, n \, Q$ and the entire recursion. Let $Theta$ be the finite set of dyadic scales for which some
    $F_t^theta$ is nonzero. If $q_min$ and $q_max$ are the smallest and largest diagonal entries of $Q$,
    then coisometry gives $q_min I prec.curly.eq L_t prec.curly.eq q_max I$, and the support of $f_0$ gives
  #[#set math.equation(numbering: n => "(50)")
   $ Theta subset \[ q_min \/ 4 \, 2 q_max \] \, wide sum_(theta in Theta) theta lt.eq 4 q_max lt.eq
     4 "tr" Q . $ <eq:used-scales>]
  At each scale, partition the sequence indices by the half-open intervals
  $ \[ r e_0 \, \( r + 1 \) e_0 \) \, wide r = 0 \, 1 \, dots.h \, $
  containing $E_theta \( 0 \, t \)$. These are the energy intervals to which Lemma 16 applies.
    There are at most $C \( 1 + E_theta \( 0 \, n \) \)$ nonempty intervals,
    including any repetitions of an energy value in the same interval.
  For each fixed $t$, the scale constraints control the original state norm.
    To see this, diagonalize $L_t$ and write $y = R_t U \( tau \)$ in this eigenbasis,
    with eigenvalues $lambda_i > 0$. Each $lambda_i$ admits a dyadic scale with $lambda_i \/ theta
    in \[ 1 \, 2 \]$, where $f_0 = 1$; that scale belongs to $Theta$. Since $R_t^T$ is an isometry,
  #[#set math.equation(numbering: n => "(51)")
   $ sum_(theta in Theta) lr(bar.v.double F_t^theta U \( tau \) bar.v.double)^2 & =
     sum_i \| y_i \|^2 sum_(theta in Theta) f_0 \( lambda_i \/ theta \)^2 gt.eq
     lr(bar.v.double R_t U \( tau \) bar.v.double)^2 . $ <eq:spectral-reconstruction>]
  Thus all the scale constraints at a given time imply, by (25),
  #[#set math.equation(numbering: n => "(52)")
   $ lr(bar.v.double R_t U \( tau \) bar.v.double)^2 lt.eq c_1^2 sum_(theta in Theta) k_t \( theta \) lt.eq
     c_1^2 C_phi.alt d wide \( 0 lt.eq t lt.eq n \) \, $ <eq:state-survival-bound>]
  with an absolute $C_phi.alt$.
  We also impose coordinate bounds. A stationary scalar Ornstein–Uhlenbeck process of rate $q > 0$,
    restricted to an interval of length at most $1 \/ q$, stays in $\[ - 2 \, 2 \]$ with probability at least an
    absolute $p_0 > 0$. By stationarity and time rescaling, it suffices to consider rate one on $\[ 0 \, 1 \]$.
    In distribution that process is
  $ e^(- s) #scale(x: 120%, y: 120%)[\(] Z + B \( e^(2 s) - 1 \) #scale(x: 120%, y: 120%)[\)] \, wide 0 lt.eq
    s lt.eq 1 \, $
  where $Z$ is standard normal and $B$ is an independent standard Brownian motion.
    The event $\| Z \| lt.eq 1$ and $sup_(r lt.eq e^2 - 1) \| B \( r \) \| lt.eq
    1$ has a fixed positive probability and implies the asserted bound.
  Choose absolute constants
  $ A_0 > c_1 sqrt(C_phi.alt) \, wide B_0 > 2 \, $
  and let $cal(D)$ be the domain in Proposition 4 with these constants.
    It is bounded, open, centrally symmetric and convex, and contains a neighborhood of zero.
    The closed constraints (52) and $\| U_j \( tau \) \| lt.eq 2$ lie strictly inside $cal(D)$.
  For a fixed $T > 0$, cover $\[ 0 \, T \]$ by at most $1 +
    T theta$ consecutive closed intervals of length at most $1 \/ theta$ at scale $theta$.
    For every such interval and every nonempty energy interval impose the event in Lemma 16.
    Also cover $\[ 0 \, T \]$ by at most $1 + T Q_(j j)$ intervals of length at most $1 \/
    Q_(j j)$ for coordinate $j$ and impose its box event. All these events are closed symmetric convex constraints
    on linear evaluations of the centered Gaussian path. There are finitely many events for this fixed input and
    $T$. Lemma 7 therefore multiplies their probability lower bounds.
    In particular, its finite-grid argument and the continuity of the paths apply even when some constraints are
    duplicates. The strict slack just chosen ensures that their intersection is an event of survival in the open
    domain $cal(D)$.
  It follows that
  #[#set math.equation(numbering: n => "(53)")
   $ - log bb(P) { U \( \[ 0 \, T \] \) subset cal(D) } & lt.eq
     C sum_(theta in Theta) \( 1 + T theta \) \( 1 + E_theta \( 0 \, n \) \) + C sum_(j = 1)^m \( 1 + T Q_(j j) \)\
 & lt.eq A \( Q \, R \, d \, n \) + C' T "tr" Q . $ <eq:survival-rate-bound>]
  Here (28) and (50) bound the coefficient of $T$ by an absolute constant times $"tr" Q$, and
  $ A \( Q \, R \, d \, n \) = C [sum_(theta in Theta) \( 1 + E_theta \( 0 \, n \) \) + m] < oo . $
  This additive constant may depend on the input and on the smallest entry of $Q$; no uniform bound on it is required.
  By Lemma 15,
  $ lambda_Q^(upright("OU")) \( cal(D) \) lt.eq C' "tr" Q + frac(A \( Q \, R \, d \, n \), T) . $
  Let $T$ tend to infinity while keeping the input fixed. This removes the additive constant,
    including the number of spectral scales. The second inequality in (43) now gives
  $ lambda_Q \( cal(D) \) lt.eq \( C' + 1 \/ 2 \) "tr" Q . $
  Thus $H_0 = C' + 1 \/ 2$ is absolute. The constants $A_0 \, B_0 \, H_0$ are independent of $d \, n \,
    Q$ and of the recursion, as required. ◻
]

== 6 Further consequences <sec:consequences>

The signed-prefix theorem gives bounds for other finite-dimensional norms and, through matrix transference,
  for arrays whose rows can be permuted separately.

=== 6.1 Finite-dimensional $ell_p$ bounds <finite-dimensional-ell_p-bounds>

#thm([Corollary 6.1.])[
  (Finite-dimensional $ell_p$ bounds).  #emph[Let $1 lt.eq p lt.eq oo$, with $1 \/ oo = 0$, and let $d \, N gt.eq
    1$ be integers. Every sequence $v_1 \, dots.h \, v_N in bb(R)^d$ with $lr(bar.v.double v_i bar.v.double)_p
    lt.eq 1$ admits signs $epsilon_i in { - 1 \, 1 }$ such that
$ max_(0 lt.eq k lt.eq N) ∥sum_(i = 1)^k epsilon_i v_i∥_p lt.eq C d^(max { 1 \/ p \, thin 1 - 1 \/ p }) . $

 If additionally $sum_(i = 1)^N v_i = 0$, there is a permutation $pi in frak(S)_N$ such that
$ max_(0 lt.eq k lt.eq N) ∥sum_(i = 1)^k v_(pi \( i \))∥_p lt.eq C d^(max { 1 \/ p \, thin 1 - 1 \/ p }) . $

 Here $C$ is the same absolute constant as in Theorems 1 and 2, independent of $p \, d \, N$.
   For $1 lt.eq p lt.eq 2$, both bounds have sharp dimension order $d^(1 \/ p)$:
   for every $d$ there is a unit-ball sequence for which every signing has a prefix of norm at least $d^(1 \/ p)$,
   and a finite indexed zero-sum unit-ball family for which every permutation has a prefix of norm at least $1 /
   3 d^(1 \/ p)$.]
] <cor:lp-steinitz>

#proof[
  For $1 lt.eq p lt.eq 2$, the norm comparisons
  $ lr(bar.v.double x bar.v.double)_2 lt.eq lr(bar.v.double x bar.v.double)_p lt.eq
    d^(1 \/ p - 1 \/ 2) lr(bar.v.double x bar.v.double)_2 $
  allow direct application of Theorems 1 and 2, followed by the bound $C d^(1 \/ p)$ on all prefixes.
    For $2 lt.eq p lt.eq oo$, use
  $ lr(bar.v.double x bar.v.double)_p lt.eq lr(bar.v.double x bar.v.double)_2 lt.eq
    d^(1 \/ 2 - 1 \/ p) lr(bar.v.double x bar.v.double)_p . $
  Divide the input vectors by $d^(1 \/ 2 - 1 \/ p)$, apply the corresponding Euclidean theorem,
    and scale back to obtain $C d^(1 - 1 \/ p)$. Scaling preserves the zero sum,
    and in each case the one signing or permutation controls all prefixes. At $p = oo$ this gives $C d$.
  For the lower bounds, let $1 lt.eq p lt.eq 2$. The ordered standard basis $e_1 \, dots.h \,
    e_d$ has final signed sum of norm $d^(1 \/ p)$ for every signing.
    For the ordering problem, take $e_1 \, dots.h \, e_d$ and $d$ copies of $w = - 1 / d \( 1 \, dots.h \, 1 \)$.
    This indexed family sums to zero and lies in the unit ball, since $lr(bar.v.double w bar.v.double)_p =
    d^(1 \/ p - 1) lt.eq 1$. If $d gt.eq 2$, consider any permutation and its prefix just after the $k =
    floor.l d \/ 2 floor.r$-th basis vector. If $t$ copies of $w$ have appeared, put $a = t \/ d in \[ 0 \, 1 \]$.
    The prefix sum $s$ has $k$ coordinates equal to $1 - a$ and $d - k$ equal to $- a$.
    Since both $k$ and $d - k$ are at least $d \/ 3$, convexity gives
  $ lr(bar.v.double s bar.v.double)_p^p = k \( 1 - a \)^p + \( d - k \) a^p gt.eq d /
    3 #scale(x: 120%, y: 120%)[\(] \( 1 - a \)^p + a^p #scale(x: 120%, y: 120%)[\)] gt.eq d / 3 thin 2^(1 - p) . $
  Thus $lr(bar.v.double s bar.v.double)_p gt.eq 1 / 2 \( 2 d \/ 3 \)^(1 \/ p) gt.eq 1 / 3 d^(1 \/ p)$,
    for every permutation. When $d = 1$, the family is $\( 1 \, - 1 \)$ and either permutation has a prefix of
    norm one. ◻
]

=== 6.2 A colorful row-permutation consequence <a-colorful-row-permutation-consequence>

Bárány’s matrix transference principle turns the signed-prefix bound into a row-permutation bound for arrays.
  Each row may have its own permutation, while the controlled sums aggregate the same number of entries from every row.

#thm([Corollary 6.2.])[
  (Euclidean colorful Steinitz bound).  #emph[Let $d \, k \, n gt.eq 1$ be integers and let $a_i^j in bb(R)^d$,
    for $1 lt.eq j lt.eq k$ and $1 lt.eq i lt.eq n$, satisfy
$ lr(bar.v.double a_i^j bar.v.double)_2 lt.eq 1 \, wide sum_(j = 1)^k sum_(i = 1)^n a_i^j = 0 . $

 There is one tuple of permutations $\( pi_1 \, dots.h \, pi_k \) in frak(S)_n^k$ such that
$ max_(0 lt.eq m lt.eq n) ∥sum_(j = 1)^k sum_(i = 1)^m a_(pi_j \( i \))^j∥_2 lt.eq 2 C sqrt(d) \, $

 where $C$ is the absolute constant in Theorem 1. The same tuple works for every $m$ and may be chosen jointly
   from the whole array. Only the global total sum is assumed to vanish;
   the bound controls the displayed aggregate synchronous prefixes, not each row separately.]
] <cor:colorful-steinitz>

#proof[
  For an arbitrary $k times n$ array $B = \( b_i^j \)$ in the Euclidean unit ball $B_2^d$,
    with no zero-sum condition, list its entries column by column:
  $ v_(\( i - 1 \) k + j) = b_i^j wide \( 1 lt.eq i lt.eq n \, med 1 lt.eq j lt.eq k \) . $
  Apply Theorem 1 to this sequence of length $k n$. With $epsilon_i^j = epsilon_(\( i - 1 \) k + j)$,
    every complete-column prefix satisfies
  $ ∥sum_(j = 1)^k sum_(i = 1)^m epsilon_i^j b_i^j∥_2 = ∥sum_(ell = 1)^(k m) epsilon_ell v_ell∥_2 lt.eq C sqrt(d) . $
  This is the column-major reduction in the proof of #cite(label("Barany2024Matrix")) Lemma 2.1,
    with the present signed-prefix bound in place of its dimension-linear bound.
    Thus Bárány’s matrix signed constant satisfies $V \( B_2^d \) lt.eq C sqrt(d)$, uniformly in $k \, n$.
    Here $V$ allows an entrywise signing of an arbitrary array,
    whereas the row-permutation constant $U$ ranges over total-zero arrays and controls the same aggregate
    prefixes. His transference theorem #cite(label("Barany2024Matrix")) Theorem 2.2 gives $U \( B_2^d \) lt.eq
    2 V \( B_2^d \)$ for every number of rows. Shorter auxiliary arrays may be padded with trailing zero columns
    when using the bound uniformly in the number of columns. Since $B_2^d$ is a centrally symmetric convex body,
    this gives the asserted bound. ◻
]

Taking $k = 1$ in the regular-simplex example in the introduction shows that no $o \( sqrt(d) \)$ bound can hold
  uniformly over these arrays. Thus the order in the dimension is sharp;
  the numerical constant $2 C$ is not asserted to be optimal.
  The row permutations are existential, with no online or efficient algorithm claimed.

#bibliography("refs.bib", style: "ieee", title: [References])
