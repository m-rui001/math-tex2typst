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

#align(center)[#text(size: 16pt, weight: "bold")[An $L^3$ bound for the dyadic triangular Hilbert form]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

The triangular Hilbert form couples three functions of two variables, each pair sharing one variable.
  We study its dyadic model, in which the intervals are constrained by binary addition without carries.
  The estimate below imposes no structural condition on any of the three inputs.

Write $bb(R)_(+) = \[ 0 \, oo \)$. For $k in bb(Z)$, let

$ cal(D)_k = { \[ 2^k n \, 2^k \( n + 1 \) \) : n in bb(Z)_(gt.eq 0) } . $

For $I in cal(D)_k$, denote its index by $n_I$ and set

$ h_I = upright(bold(1))_(I_(upright("left"))) - upright(bold(1))_(I_(upright("right"))) . $

Let $xor$ denote bitwise XOR of nonnegative integers, and define the set of admissible triples

$ cal(A)_k = { \( I_0 \, I_1 \, I_2 \) in cal(D)_k^3 : n_(I_0) xor n_(I_1) xor n_(I_2) = 0 } . $

For $upright(bold(I)) in cal(A)_k$ and three real functions $F_v$ on $bb(R)_(+)^2$, put

#[#set math.equation(numbering: n => "(1.1)")
 $ L_(upright(bold(I))) \( F_0 \, F_1 \, F_2 \) = 2^(- k) integral_(I_0 times I_1 times I_2) F_0 \( x_0 \, x_1 \)
   F_1 \( x_1 \, x_2 \) F_2 \( x_2 \, x_0 \) product_(v = 0)^2 h_(I_v) \( x_v \) thin upright(d) x_0 thin
   upright(d) x_1 thin upright(d) x_2 . $ <eq:local-form>]

The dyadic triangular Hilbert form with a finite set of scales $S subset bb(Z)$ and real coefficients $\|
  epsilon.alt_k \| lt.eq 1$ is

#[#set math.equation(numbering: n => "(1.2)")
 $ Lambda_(S \, epsilon.alt)^(upright(d)) \( F_0 \, F_1 \, F_2 \) =
   sum_(k in S) epsilon.alt_k sum_(upright(bold(I)) in cal(A)_k) L_(upright(bold(I))) \( F_0 \, F_1 \, F_2 \) .
   $ <eq:given-form>]

#thm([Theorem 1.1.])[
  #emph[For every finite $S subset bb(Z)$ and all real bounded compactly supported measurable functions $F_0 \,
    F_1 \, F_2$ on $bb(R)_(+)^2$,
#[#set math.equation(numbering: n => "(1.3)")
 $ sum_(k in S) sum_(upright(bold(I)) in cal(A)_k) \| L_(upright(bold(I))) \( F_0 \, F_1 \, F_2 \) \| lt.eq
   40 product_(v = 0)^2 lr(bar.v.double F_v bar.v.double)_(L^3 \( bb(R)_(+)^2 \)) . $ <eq:main>]

]
] <thm:main>

In particular, (1.2) satisfies the same product bound, uniformly in the scales and coefficients.
  The absolute values in (1.3) also allow a separate coefficient of modulus at most one for each admissible
  triple. The estimate extends to all real $L^3$ inputs by density, as explained in Section 5.

=== 1.1 Context and relation to earlier work <context-and-relation-to-earlier-work>

The continuous triangular Hilbert form has the same cyclic arrangement of inputs as (1.1),
  integrated over $bb(R)^3$ against the principal-value kernel $1 \/ \( x_0 + x_1 + x_2 \)$.
  Its symmetric $L^3$ estimate is formulated by Thiele in #cite(label("ThieleProblem2017")) Section 9, Problem 13.
  That contribution also displays the precise dyadic model (1.2), with one coefficient for each scale,
  and asks for the analogous bound. Theorem 1 answers this dyadic question affirmatively and gives the stronger
  sum of absolute local contributions. The continuous form and its dyadic model are distinct operators;
  the theorem here is a statement about the latter.

Kovač, Thiele and Zorin-Kranich introduced a dyadic triangular model with coefficients allowed to vary among
  interval triples #cite(label("KTZ2015")) Equations (1.5)–(1.6).
  Their Theorem 1.7 gives uniform estimates when one input has either a specified dependence on a Walsh linear
  combination of its coordinates or a specified fiberwise character structure.
  Those cases already encompass dyadic versions of Carleson’s operator and uniform bounds for the bilinear Hilbert
  transform, as explained in their Appendix A. Our estimate allows all three inputs to vary freely.
  The cyclic operator-trace representation used below also appears in their Equation (1.5).

Another line of work measures cancellation through the growth of truncated norms.
  Tao obtained sublogarithmic growth for one-dimensional multilinear Hilbert transforms #cite(label("Tao2016"))
  Theorem 1.2; Zorin-Kranich proved the corresponding sublinear growth in the number of smooth scales for simplex
  Hilbert transforms #cite(label("ZK2017")) Theorem 1.3. Durcik,
  Kovač and Thiele then obtained power-type cancellation in both the continuous and dyadic settings
  #cite(label("DKT2019")) Theorems 1 and 4. For the triangular dyadic form,
  their bound over $m$ consecutive scales has a factor $m^(1 \/ 2)$ at exponents $\( 4 \, 4 \, 2 \)$;
  cyclic permutation and multilinear interpolation give the same growth at $\( 3 \, 3 \, 3 \)$.
  Theorem 1 removes this scale dependence at the symmetric tuple.

The strategy of controlling an entangled form by the change of a nonnegative energy has precedents in Kovač’s
  Bellman-function framework #cite(label("Kovac2011")) Section 2 and his telescoping identity for the twisted
  paraproduct #cite(label("Kovac2012")) Lemma 2. These provide a methodological precedent,
  rather than a bound for the present triangular form. In particular,
  Kovač explicitly identifies the obstruction to applying that framework to non-bipartite graphs,
  including the triangle, in #cite(label("Kovac2011")) Section 6.2.
  Here the energy is a trace of a matrix power, and the averaging is over the four children selected by the XOR
  constraint.

The matrix energy and the dimension-independent trace inequality are taken from the companion manuscript
  #cite(label("OpenAI2026")) Sections 2–3, Lemmas 2.1, 2.2 and 3.1;
  we reproduce their real finite-dimensional proofs. Their underlying matrix calculus is classical:
  the square-root derivative is a special case of the divided-difference formula in #cite(label("Daletskii1957"))
  Section 1, Equation (1), and the order comparison uses monotonicity of the positive square root
  #cite(label("Pedersen1972")) Theorem, p. 309.

=== 1.2 The energy argument <the-energy-argument>

The proof reduces the form to finite matrices by taking inputs constant on sufficiently small dyadic squares.
  On a fixed admissible triple, each input becomes a matrix between the atom spaces of its two variables.
  At each variable, we join its two incident matrices into a single row operator $R$ and assign it the energy
  $"tr" \( \( R^(*) R \)^(3 \/ 2) \)$. Let $e \( upright(bold(I)) \)$ be the sum of these three energies,
  and let $"ch" \( upright(bold(I)) \)$ consist of the four admissible triples obtained by halving each interval.
  The key estimate is

#[#set math.equation(numbering: n => "(1.4)")
 $ \| L_(upright(bold(I))) \( F_0 \, F_1 \, F_2 \) \| lt.eq
   C_0 thin 2^(2 k)
   (1 / 4 sum_(upright(bold(I))' in "ch" \( upright(bold(I)) \)) e \( upright(bold(I))' \) - e \(
   upright(bold(I)) \)) \, wide upright(bold(I)) in cal(A)_k \, $ <eq:overview-gap>]

with an absolute constant $C_0$. At each scale, the weighted total energy $sum_(upright(bold(I)) in cal(A)_k)
  2^(2 k) e \( upright(bold(I)) \)$ is bounded by an absolute constant times the sum of the cubed input norms.

To prove (1.4), a matrix trace estimate bounds the triangular product by three Hessian quadratic forms of $P
  mapsto "tr" \( P^(3 \/ 2) \)$. Conditional on one child half,
  each neighboring half remains equally likely to be left or right.
  The two neighbors are correlated, but $R R^(*)$ is a sum of the two edge Gram matrices;
  it contains no product between their multipliers and has the same nonzero spectrum as $R^(*) R$.
  Convexity therefore converts the Hessian bound into an increase of the child energy.
  Writing the local integrals in normalized interval measures leaves the weight $2^(2 k)$.
  Each child has one parent and weight $2^(2 \( k - 1 \))$, one quarter of the parent’s weight,
  so these increases telescope.

Section 2 establishes the energy inequalities, Section 3 proves the trace estimate,
  Section 4 supplies the conditional-averaging argument, and Section 5 sums the resulting differences and passes
  to measurable inputs.

== 2 The matrix energy and its curvature <sec:matrix>

We first record the finite-dimensional facts that will measure the energy increase under a dyadic split.
  All spaces and matrices in the proof are real; $R^(*)$ denotes the transpose of $R$.
  For a symmetric positive semidefinite matrix $P$, define

$ Phi \( P \) = "tr" \( P^(3 \/ 2) \) \, wide "supp" P = \( ker P \)^perp . $

A symmetric matrix $K$ is #emph[supported on $P$] if it annihilates $ker P$.
  Symmetry then also puts its range in $"supp" P$. For such $K$, define

#[#set math.equation(numbering: n => "(2.1)")
 $ b_P \( K \) = 3 / 2 sum_(i \, j) frac(\| K_(i j) \|^2, sqrt(p_i) + sqrt(p_j)) \, $ <eq:hessian>]

where $p_i > 0$ are the eigenvalues of $P$ on its support,
  and the entries are taken in an orthonormal eigenbasis of that support.
  If $P = 0$, the only supported $K$ is zero and $b_0 \( 0 \) = 0$.
  Simultaneous orthogonal conjugation and extension by zero preserve $Phi$ and $b$.

The next two lemmas are the real-matrix versions of the energy derivative and order comparison results in the
  companion manuscript #cite(label("OpenAI2026")) Section 2.
  We give the proofs, including the support conventions needed for singular Gram matrices.

#thm([Lemma 2.1.])[
  (Hessian of the energy).  #emph[On matrices positive definite on a fixed support, $Phi$ is smooth and,
    for a symmetric direction $K$ on that support,
$ d Phi_P \( K \) = 3 / 2 "tr" \( sqrt(P) thin K \) \, wide d^2 Phi_P \( K \, K \) = b_P \( K \) . $

 In particular, $Phi$ is convex on the positive semidefinite cone.]
] <lem:hessian>

#proof[
  Work on the support and set $B = sqrt(P)$. The derivative of the squaring map at $B$ is
  $ cal(L)_B \( X \) = B X + X B . $
  This is the square-root instance of the classical matrix derivative calculus #cite(label("Daletskii1957"))
    Section 1, Equation (1). In an eigenbasis of $P$, this map multiplies entry $\( i \, j \)$ by $sqrt(p_i) +
    sqrt(p_j) > 0$. The inverse function theorem therefore gives a smooth square root whose derivative $X$ in
    direction $K$ satisfies $B X + X B = K$. Differentiating $"tr" \( B^3 \)$ and using cyclicity,
  $ d Phi_P \( K \) = 3 "tr" \( B^2 X \) = 3 / 2 "tr" \( B K \) . $
  A second differentiation gives
  $ d^2 Phi_P \( K \, K \) = 3 / 2 chevron.l K \, cal(L)_B^(- 1) K chevron.r_(upright("HS")) = b_P \( K \) \, $
  where $chevron.l X \, Y chevron.r_(upright("HS")) = "tr" \( X^(*) Y \)$. The Hessian is nonnegative.
    This proves convexity on positive definite matrices; replacing each matrix by itself plus $eta
    upright("Id")$ and letting $eta arrow.b 0$ proves convexity on the closed cone. ◻
]

#thm([Lemma 2.2.])[
  (Order comparison).  #emph[Suppose $P \, Q$ are positive semidefinite matrices on the same space, $a gt.eq 1$,
    and $P lt.eq a Q$. Every symmetric $K$ supported on $P$ is supported on $Q$, and
#[#set math.equation(numbering: n => "(2.2)")
 $ b_P \( K \) gt.eq a^(- 1 \/ 2) b_Q \( K \) . $ <eq:order>]

]
] <lem:order>

#proof[
  For $x in ker Q$, the inequalities $0 lt.eq chevron.l P x \, x chevron.r lt.eq a chevron.l Q x \, x chevron.r =
    0$ imply $P x = 0$. Thus $ker Q subset.eq ker P$, which proves the support assertion.
  First suppose $P \, Q$ are positive definite. Inversion reverses positive definite order:
    conjugating $0 < X lt.eq Y$ by $X^(- 1 \/ 2)$, inverting the resulting matrix at least $upright("Id")$,
    and conjugating back gives $Y^(- 1) lt.eq X^(- 1)$. The spectral integral
  $ sqrt(X) = 1 / pi integral_0^oo X \( X + t upright("Id") \)^(- 1) thin frac(upright(d) t, sqrt(t)) $
  then proves monotonicity of the positive square root #cite(label("Pedersen1972")) Theorem, p. 309,
    since $X \( X + t upright("Id") \)^(- 1) = upright("Id") - t \( X + t upright("Id") \)^(- 1)$.
    Consequently $sqrt(P) lt.eq sqrt(a) thin sqrt(Q)$.
  For a positive semidefinite matrix $A$, left and right multiplication by $A$ are positive semidefinite
    self-adjoint operators on the full Hilbert–Schmidt matrix space:
    their quadratic forms are $"tr" \( X^(*) A X \)$ and $"tr" \( X^(*) X A \)$. Hence
  $ cal(L)_(sqrt(P)) lt.eq sqrt(a) thin cal(L)_(sqrt(Q)) \, wide cal(L)_(sqrt(P))^(- 1) gt.eq
    a^(- 1 \/ 2) cal(L)_(sqrt(Q))^(- 1) . $
  Taking the quadratic form at $K$ and using Lemma 2 proves (2.2).
  In the semidefinite case, $a gt.eq 1$ gives $P + eta upright("Id") lt.eq a \( Q + eta upright("Id") \)$.
    Apply the positive definite result and let $eta arrow.b 0$.
    In a full eigenbasis of either matrix, every entry of $K$ meeting its kernel is zero.
    Formula (2.1) therefore gives convergence to the two supported quadratic forms in (2.2). ◻
]

#thm([Corollary 2.3.])[
  (A midpoint gap).  #emph[If $T gt.eq 0$ and $U = U^(*)$ satisfy $- T lt.eq U lt.eq T$,
    then $U$ is supported on $T$ and
#[#set math.equation(numbering: n => "(2.3)")
 $ frac(Phi \( T + U \) + Phi \( T - U \), 2) - Phi \( T \) gt.eq frac(1, 2 sqrt(2)) b_T \( U \) . $ <eq:gap>]

]
] <cor:gap>

#proof[
  For $x in ker T$, positivity of $T + U$ and $T - U$, whose quadratic forms both vanish at $x$, implies $U x =
    0$. For $\| \| t < 1$,
  $ \( 1 - \| \| t \) T lt.eq T + t U lt.eq \( 1 + \| \| t \) T lt.eq 2 T . $
  Thus $T + t U$ has the same support as $T$. The function $f \( t \) = Phi \( T + t U \)$ satisfies, by Lemmas 2 and 3,
  $ f'' \( t \) = b_(T + t U) \( U \) gt.eq 2^(- 1 \/ 2) b_T \( U \) . $
  Subtracting $b_T \( U \) t^2 \/ \( 2 sqrt(2) \)$ leaves a convex function on $\( - 1 \, 1 \)$,
    continuous on $\[ - 1 \, 1 \]$. Its midpoint inequality is (2.3). If $T = 0$, all terms are zero. ◻
]

== 3 A triangular trace estimate <sec:trace>

We now compare a cyclic product of three matrices with the Hessian costs from Section 2.
  This is the finite-dimensional estimate that will control a local triangular integral.
  Its proof follows the mixed trace argument in #cite(label("OpenAI2026")) Section 3;
  working over the reals lets us identify the two orientations of the triangle directly by transposition.

Let $H_v$, $v in bb(Z) \/ 3 bb(Z)$, be finite-dimensional real inner product spaces, and let $W_v :
  H_(v + 1) arrow.r H_v$. The two edges incident to vertex $v$ form the #emph[row star]

#[#set math.equation(numbering: n => "(3.1)")
 $ R_v = \[ thin W_v quad W_(v - 1)^(*) thin \] : H_(v + 1) xor H_(v - 1) arrow.r H_v \, wide T_v =
   R_v^(*) R_v . $ <eq:row-star>]

The two Gram matrices $R_v^(*) R_v$ and $R_v R_v^(*)$ have the same nonzero eigenvalues with multiplicities,
  so their $Phi$ values agree.

#thm([Proposition 3.1.])[
  (Mixed trace estimate).  #emph[For the maps in (3.1), let $D_v : H_v arrow.r
    H_v$ be symmetric with $lr(bar.v.double D_v bar.v.double)_(upright("op")) lt.eq 1$, and put $U_v =
    R_v^(*) D_v R_v$. Then $U_v$ is supported on $T_v$, and
#[#set math.equation(numbering: n => "(3.2)")
 $ \| "tr" \( D_0 W_0 D_1 W_1 D_2 W_2 \) \| lt.eq 5 / 3 sum_(v = 0)^2 b_(T_v) \( U_v \) . $ <eq:trace>]

 The constant is independent of all three dimensions.]
] <prop:trace>

#proof[
  The identity $ker T_v = ker R_v$ proves the support assertion.
    We first place the three quadratic forms on one space, then bound a cubic trace in an eigenbasis.
  ===== 3.1 A common quadratic form. <a-common-quadratic-form.>
  On $H = H_0 xor H_1 xor H_2$, define
  $ M = mat(delim: "(", 0, W_0, W_2^(*); W_0^(*), 0, W_1; W_2, W_1^(*), 0) \, wide D =
    "diag" \( D_0 \, D_1 \, D_2 \) . $
  Both matrices are symmetric and $lr(bar.v.double  bar.v.double) D_(upright("op")) lt.eq 1$.
    Let $P_v$ be the projection onto $H_v$, and set $A_v = M P_v M$, $K_v = M P_v D M$.
    The only nonzero block row of $P_v M$ is $R_v$, with its columns placed in vertex order.
    Thus $A_v$ and $K_v$ are $T_v$ and $U_v$, respectively, after a permutation of blocks and extension by zero.
    In particular $K_v$ is supported on $A_v$. Also $P_v D = D P_v$, so $K_v$ is symmetric, and
  $ 0 lt.eq A_v lt.eq M^2 \, wide sum_v K_v = M D M . $
  Lemma 3, followed by the quadratic-form inequality for a sum of three vectors, gives
  #[#set math.equation(numbering: n => "(3.3)")
   $ cal(E) := sum_v b_(T_v) \( U_v \) gt.eq sum_v b_(M^2) \( K_v \) gt.eq 1 /
     3 b_(M^2) \( M D M \) . $ <eq:common-form>]
  This comparison is on the relevant supports; $M$ need not be invertible.
  ===== 3.2 The cubic trace. <the-cubic-trace.>
  Choose an orthonormal eigenbasis of $M$, with eigenvalues $m_i$ ordered so that $q_i = \|
    m_i \|$ is nonincreasing. Write $D_(i j)$ for the entries of $D$ in this basis.
    Since $\( M D M \)_(i j) = m_i m_j D_(i j)$, (3.3) gives
  #[#set math.equation(numbering: n => "(3.4)")
   $ cal(E) gt.eq 1 / 2 Q \, wide Q = sum_(i \, j\
q_i + q_j > 0) frac(q_i^2 q_j^2, q_i + q_j) \| D_(i j) \|^2 . $ <eq:Q>]
  Define
  $ A_i = q_i^3 \| D_(i i) \|^2 \, wide E_i = q_i sum_(j > i) q_j^2 \| D_(i j) \|^2 \, wide A = sum_i A_i \, quad
    E = sum_i E_i . $
  The diagonal terms of $Q$ sum to $A \/ 2$. Pairing its off-diagonal terms and using $q_i gt.eq q_j$ for $i < j$,
    we obtain
  #[#set math.equation(numbering: n => "(3.5)")
   $ Q = A / 2 + sum_(i < j\
q_i + q_j > 0) frac(2 q_i^2 q_j^2, q_i + q_j) \| D_(i j) \|^2 gt.eq A / 2 + E . $ <eq:AE>]
  Expand
  $ "tr" \( \( D M \)^3 \) = sum_(i \, j \, k) m_i m_j m_k D_(i j) D_(j k) D_(k i) . $
  Group the triples by their smallest index $i$ and the number of times it occurs.
    If it occurs once, its three possible positions give
  $ 3 m_i sum_(j \, k > i) m_j m_k D_(i j) D_(j k) D_(k i) = 3 m_i x^(*) D_(> i) x \, wide x_j = m_j D_(j i) . $
  Here $j = k$ is allowed, and $D_(> i)$ is the compression of $D$ to indices greater than $i$.
    This compression is a contraction, so the absolute value is at most $3 E_i$.
  If the smallest index occurs twice, the contribution is
  $ 3 m_i^2 D_(i i) sum_(j > i) m_j \| D_(i j) \|^2 . $
  The row norm bound $sum_j \| D_(i j) \|^2 lt.eq 1$ and Cauchy–Schwarz show that its absolute value is at most
  $ 3 q_i^2 \| D_(i i) \| (sum_(j > i) q_j^2 \| D_(i j) \|^2)^(1 \/ 2) = 3 sqrt(A_i E_i) . $
  When all three indices equal $i$, the absolute value is at most $A_i$, since $\| D_(i i) \| lt.eq 1$.
    These cases partition all triples, including repeated indices. Summing and applying Cauchy–Schwarz once more,
  #[#set math.equation(numbering: n => "(3.6)")
   $ \| "tr" \( \( D M \)^3 \) \| & lt.eq A + 3 E + 3 sqrt(A E)\
 & lt.eq 5 / 2 A + 9 / 2 E lt.eq 5 \( A \/ 2 + E \) lt.eq 5 Q . $ <eq:cubic>]
  Zero eigenvalues contribute zero throughout.
  ===== 3.3 Returning to the triangle. <returning-to-the-triangle.>
  In vertex blocks, a nonzero closed three-step product must visit all three vertices because $M$ has zero
    diagonal blocks. The three starting points in one orientation give $tau =
    "tr" \( D_0 W_0 D_1 W_1 D_2 W_2 \)$ by cyclicity, and the reverse orientation gives the same real trace by
    transposition. Thus $"tr" \( \( D M \)^3 \) = 6 tau$. Equations (3.4) and (3.6) yield
  $ 6 \| tau \| lt.eq 5 Q lt.eq 10 cal(E) \, $
  which is (3.2). ◻
]

== 4 Energy increase under a dyadic split <sec:dyadic>

We apply the matrix estimate to a fixed admissible triple and compare its energy with the average energy of its
  children. For this section, the inputs are bounded, compactly supported,
  and constant on products of intervals in $cal(D)_m$, for some $m in bb(Z)$.

=== 4.1 Matrices for a local integral <matrices-for-a-local-integral>

For $upright(bold(I)) = \( I_0 \, I_1 \, I_2 \) in cal(A)_k$, $k gt.eq m$,
  let $H_v$ have an orthonormal basis indexed by the intervals of $cal(D)_m$ inside $I_v$.
  Call these intervals atoms. In the probability measure $\| I_v \|^(- 1) thin upright(d) x_v$,
  each atom has weight $w_v \( i \) = 2^(m - k)$. Define $W_v : H_(v + 1) arrow.r H_v$ by

#[#set math.equation(numbering: n => "(4.1)")
 $ W_v \( i \, j \) = sqrt(w_v \( i \) w_(v + 1) \( j \)) thin F_v \( i \, j \) \, $ <eq:weighted-edge>]

where $F_v \( i \, j \)$ is the constant value on the corresponding atom pair. Use these maps in (3.1), and define

#[#set math.equation(numbering: n => "(4.2)")
 $ e_v \( upright(bold(I)) \) = Phi \( T_v \) = Phi \( R_v R_v^(*) \) \, wide e \( upright(bold(I)) \) =
   sum_(v = 0)^2 e_v \( upright(bold(I)) \) . $ <eq:local-energy>]

If $k gt.eq m + 1$, let $D_v$ be the diagonal matrix of the $h_(I_v)$-values on the atoms, and put

$ tau \( upright(bold(I)) \) = "tr" \( D_0 W_0 D_1 W_1 D_2 W_2 \) . $

The diagonal matrices are symmetric contractions. In the expanded trace,
  each vertex weight occurs as two square roots, so $tau \( upright(bold(I)) \)$ is exactly the normalized
  integral of the product of the three inputs and three Haar signs. Therefore

#[#set math.equation(numbering: n => "(4.3)")
 $ L_(upright(bold(I))) \( F_0 \, F_1 \, F_2 \) = 2^(2 k) tau \( upright(bold(I)) \) . $ <eq:trace-integral>]

=== 4.2 The four children <the-four-children>

If $b_v in { 0 \, 1 }$ chooses the left or right half of $I_v$, the child index is $2 n_(I_v) + b_v$.
  The child triple is admissible precisely when $b_0 xor b_1 xor b_2 = 0$.
  Equivalently, with $s_v = \( - 1 \)^(b_v)$, its signs satisfy $s_0 s_1 s_2 = 1$.
  Write $"ch" \( upright(bold(I)) \)$ for these four children.
  Under uniform choice among them, each sign is uniform and every pair of signs is independent.
  Figure 1 displays the conditional averages used below.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 1.4), [#text(size: 9pt)[an admissible parent $bold(I)$]])
  content((-2.5, 0), [#box(inset: 0.3175cm, radius: 4pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$s_0=+1$#linebreak() $(+,+,+) (+,-,-)$]]])])
  content((2.5, 0), [#box(inset: 0.3175cm, radius: 4pt, stroke: (paint: rgb("#737373"), thickness: 0.4pt, miter-limit: 10), fill: rgb("#f2f2ff"), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$s_0=-1$#linebreak() $(-,+,-) (-,-,+)$]]])])
  line((-0.506, 1.117), (-1.209, 0.7232), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0.506, 1.117), (1.209, 0.7232), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0, -1.25), [#text(size: 9pt)[$bb(E) [s_1 divides s_0]= bb(E) [s_2 divides s_0]=0$, $s_1s_2=s_0$.]])
})],
  caption: [Figure 1: The four admissible child sign triples, grouped by the first sign. Conditional on $s_0$, the two possibilities in its box have equal probability. Each neighboring sign is unbiased, but their product is fixed. The sum of the two incident-edge Grams in (4.5) uses only these marginal averages. ],
) <fig:children>

#thm([Proposition 4.1.])[
  (Local energy increase).  #emph[For $upright(bold(I)) in cal(A)_k$, $k gt.eq m + 1$, define
$ delta \( upright(bold(I)) \) = 1 / 4 sum_(upright(bold(I))' in "ch" \( upright(bold(I)) \))
  e \( upright(bold(I))' \) - e \( upright(bold(I)) \) . $

 Then $delta \( upright(bold(I)) \) gt.eq 0$, and
#[#set math.equation(numbering: n => "(4.4)")
 $ \| tau \( upright(bold(I)) \) \| lt.eq frac(10 sqrt(2), 3) thin delta \( upright(bold(I)) \) . $ <eq:local-control>]

]
] <prop:increase>

#proof[
  We keep the parent spaces fixed and extend each child matrix by zero. Set
  $ C_v = \( upright("Id") + s_v D_v \)^(1 \/ 2) . $
  It is $sqrt(2)$ times the projection onto the atoms in the chosen half.
    Child probability weights double, so the extended child edge matrix is $C_v W_v C_(v + 1)$. Its row star is
  $ R_v \( s \) = C_v R_v "diag" \( C_(v + 1) \, C_(v - 1) \) . $
  In particular,
  #[#set math.equation(numbering: n => "(4.5)")
   $ R_v \( s \) R_v \( s \)^(*) = C_v #scale(x: 120%, y: 120%)[\(] W_v C_(v + 1)^2 W_v^(*) +
     W_(v - 1)^(*) C_(v - 1)^2 W_(v - 1) #scale(x: 120%, y: 120%)[\)] C_v . $ <eq:child-gram>]
  Fix $s_v$. Each neighboring sign is still uniform, so its squared multiplier has conditional expectation
    $upright("Id")$. Although the neighbors are correlated, (4.5) has no product between their multipliers. Thus
  $ bb(E) #scale(x: 120%, y: 120%)[\[] R_v \( s \) R_v \( s \)^(*) divides s_v #scale(x: 120%, y: 120%)[\]] =
    C_v R_v R_v^(*) C_v . $
  By the convexity in Lemma 2,
  #[#set math.equation(numbering: n => "(4.6)")
   $ bb(E) #scale(x: 120%, y: 120%)[\[] e_v \( upright(bold(I)) \( s \) \) divides s_v
     #scale(x: 120%, y: 120%)[\]] gt.eq Phi \( C_v R_v R_v^(*) C_v \) = Phi \( T_v + s_v U_v \) \, wide U_v =
     R_v^(*) D_v R_v . $ <eq:conditional>]
  The equality compares the two Gram matrices of $C_v R_v$:
    their nonzero eigenvalues agree, even though they act on different spaces.
  Since $D_v$ is a symmetric contraction, $- T_v lt.eq U_v lt.eq T_v$.
    Averaging (4.6) over $s_v = plus.minus 1$ and applying Corollary 4 gives
  $ 1 / 4 sum_(upright(bold(I))' in "ch" \( upright(bold(I)) \)) e_v \( upright(bold(I))' \) -
    e_v \( upright(bold(I)) \) gt.eq frac(1, 2 sqrt(2)) b_(T_v) \( U_v \) . $
  Summing over $v$ proves nonnegativity of $delta$. Proposition 5 now gives
  $ \| tau \( upright(bold(I)) \) \| lt.eq 5 / 3 sum_v b_(T_v) \( U_v \) lt.eq
    frac(10 sqrt(2), 3) delta \( upright(bold(I)) \) \, $
  as asserted. ◻
]

== 5 Summation and passage to measurable inputs <sec:summation>

The local increase from Proposition 6 has the sign needed for telescoping toward finer scales.
  This use of an energy difference parallels the Bellman-function summations in #cite(label("Kovac2011"))
  Section 2 and #cite(label("Kovac2012")) Lemma 2. We bound the total energy at each level before carrying out that sum.

#thm([Lemma 5.1.])[
  (Total energy).  #emph[For the step functions of Section 4 and every $k gt.eq m$, set
$ J_k = sum_(upright(bold(I)) in cal(A)_k) 2^(2 k) e \( upright(bold(I)) \) . $

 Then
#[#set math.equation(numbering: n => "(5.1)")
 $ 0 lt.eq J_k lt.eq 2 sqrt(2) sum_(v = 0)^2 lr(bar.v.double F_v bar.v.double)_3^3 . $ <eq:total>]

 For $k gt.eq m + 1$,
#[#set math.equation(numbering: n => "(5.2)")
 $ sum_(upright(bold(I)) in cal(A)_k) 2^(2 k) delta \( upright(bold(I)) \) = J_(k - 1) - J_k . $ <eq:telescope>]

]
] <lem:total>

#proof[
  If $a \, b$ are the Hilbert–Schmidt norms of the two edges incident to $v$, then
  $ e_v \( upright(bold(I)) \) = "tr" \( T_v^(3 \/ 2) \) lt.eq \( "tr" T_v \)^(3 \/ 2) = \( a^2 + b^2 \)^(3 \/ 2)
    lt.eq sqrt(2) \( a^3 + b^3 \) . $
  For an edge $W_v$, its probability normalization gives
  #[#set math.equation(numbering: n => "(5.3)")
   $ lr(bar.v.double W_v bar.v.double)_(upright("HS"))^3 =
     (frac(1, \| I_v \| \| I_(v + 1) \|) integral_(I_v times I_(v + 1)) \| F_v \|^2)^(3 \/ 2) lt.eq
     frac(1, \| I_v \| \| I_(v + 1) \|) integral_(I_v times I_(v + 1)) \| F_v \|^3 . $ <eq:edge-mass>]
  Every edge occurs in two row stars. Also, every ordered pair of intervals in $cal(D)_k$ determines exactly one
    admissible third interval, by XOR. Multiplication by $2^(2 k) = \| I_v \| \|
    I_(v + 1) \|$ and summation of (5.3) therefore prove (5.1). These sums are finite:
    compact support leaves finitely many nonzero edge matrices, each belonging to one admissible triple.
  Deleting the last bit of each child index shows that every admissible child has a unique admissible parent.
    As $2^(2 k) \/ 4 = 2^(2 \( k - 1 \))$, the child part in the definition of $delta$ sums to $J_(k - 1)$,
    proving (5.2). ◻
]

#proof[
  The case $S = diameter$ is immediate. Otherwise set $k_(-) = min S$, $k_(+) = max S$,
    and refine the common atom level, if necessary, so that $m lt.eq k_(-) - 1$. By (4.3), Proposition 6, and Lemma 7,
  $ sum_(k in S) sum_(upright(bold(I)) in cal(A)_k) \| L_(upright(bold(I))) \( F_0 \, F_1 \, F_2 \) \| & lt.eq
    frac(10 sqrt(2), 3) sum_(k = k_(-))^(k_(+)) \( J_(k - 1) - J_k \)\
 & lt.eq frac(10 sqrt(2), 3) J_(k_(-) - 1) lt.eq 40 / 3 sum_(v = 0)^2 lr(bar.v.double F_v bar.v.double)_3^3 . $
  The insertion of missing scales is valid because each energy difference is nonnegative.
    If every input has nonzero norm, apply this estimate to $F_v \/ lr(bar.v.double F_v bar.v.double)_3$.
    Trilinearity of each local integral gives (1.3), with constant $40$.
    If any norm is zero, the local integrals vanish. ◻
]

To pass to general inputs we need continuity of the absolute sum, not merely continuity of the signed form.
  The following fixed-level estimate provides it.

#thm([Lemma 5.2.])[
  (Continuity at one scale).  #emph[For every $k in bb(Z)$ and real $F_v in L^3 \( bb(R)_(+)^2 \)$,
#[#set math.equation(numbering: n => "(5.4)")
 $ sum_(upright(bold(I)) in cal(A)_k) \| L_(upright(bold(I))) \( F_0 \, F_1 \, F_2 \) \| lt.eq
   product_(v = 0)^2 lr(bar.v.double F_v bar.v.double)_3 . $ <eq:one-scale>]

 Consequently the sequence $\( L_(upright(bold(I))) \( F_0 \, F_1 \, F_2 \) \)_(upright(bold(I)) in cal(A)_k)$
   depends continuously on the inputs as a map from $L^3 times L^3 times L^3$ to $ell^1 \( cal(A)_k \)$.]
] <lem:continuity>

#proof[
  Define the nonnegative edge averages
  $ a_v \( upright(bold(I)) \) = frac(1, \| I_v \| \| I_(v + 1) \|) integral_(I_v times I_(v + 1)) \| F_v \|^3 . $
  Hölder’s inequality on the product probability space of the three intervals, with the Haar signs bounded by one, gives
  $ \| L_(upright(bold(I))) \( F_0 \, F_1 \, F_2 \) \| lt.eq
    2^(2 k) product_(v = 0)^2 a_v \( upright(bold(I)) \)^(1 \/ 3) . $
  Apply Hölder again, now to the sum over $cal(A)_k$ with weight $2^(2 k)$. The uniqueness of the third interval yields
  $ sum_(upright(bold(I)) in cal(A)_k) 2^(2 k) a_v \( upright(bold(I)) \) = lr(bar.v.double F_v bar.v.double)_3^3 \, $
  proving (5.4). These bounds also justify all integrals and absolute sums for $L^3$ inputs.
  For two input triples $F \, G$, expand the difference of local integrals into the three terms with inputs
  $ \( F_0 - G_0 \, F_1 \, F_2 \) \, quad \( G_0 \, F_1 - G_1 \, F_2 \) \, quad \( G_0 \, G_1 \, F_2 - G_2 \) . $
  Estimate each term by (5.4). If $G_v arrow.r F_v$ in $L^3$, the sum of these three product bounds tends to zero.
    This is the asserted $ell^1$ continuity. ◻
]

#proof[
  #emph[Completion of Theorem 1.] Bounded compactly supported dyadic step functions are dense in
    $L^3 \( bb(R)_(+)^2 \)$. To see this, first approximate an $L^3$ function by a continuous compactly supported
    function, then take its averages on sufficiently small dyadic squares.
    Uniform continuity and a common bounded support give convergence in $L^3$.
  For arbitrary real $F_v in L^3$, choose such step functions $F_v^(\( n \)) arrow.r F_v$ in $L^3$.
    Assuming $S eq.not diameter$, refine their common atom levels, without changing the functions,
    to satisfy $m_n lt.eq min S - 1$. Apply the step-function estimate to these inputs.
    Lemma 8, summed over the fixed finite set $S$, gives convergence of their local integrals in $ell^1$.
    The inequality $\| \| \| a - \| \| b \| lt.eq \| a - b \|$ permits passage to the absolute sum in (1.3),
    and norm convergence handles its right-hand side. This proves the theorem and its stated extension to real
    $L^3$ inputs. The case $S = diameter$ remains immediate.
  For any coefficients $\| epsilon.alt_(upright(bold(I))) \| lt.eq 1$,
    the triangle inequality gives the corresponding bound for
  $ sum_(k in S) sum_(upright(bold(I)) in cal(A)_k) epsilon.alt_(upright(bold(I)))
    L_(upright(bold(I))) \( F_0 \, F_1 \, F_2 \) . $
  ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
