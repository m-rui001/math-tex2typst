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

#align(center)[#text(size: 16pt, weight: "bold")[Equality cases in the sharp one-dimensional \
matrix Lieb--Thirring inequality]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <intro:section>

Lieb–Thirring inequalities compare the binding energy of a Schrödinger operator with an integral of its potential.
  Equality asks how the potential must arrange that binding.
  In one dimension, a scalar one-bound-state optimizer has a hyperbolic-secant profile.
  For a matrix potential, several such profiles can occupy orthogonal internal channels.
  The issue is whether equality also permits channels that rotate with position,
  or several bound states that interact within the same channel.
  We prove that throughout $1 \/ 2 < gamma < 3 \/ 2$ every equality case consists of independent scalar profiles
  in one fixed basis.

Let $m gt.eq 1$ be finite, let $1 \/ 2 < gamma < 3 \/ 2$, and set $p = gamma + 1 \/ 2$.
  For a measurable Hermitian positive semidefinite function $W : bb(R) arrow.r bb(C)^(m times m)$ satisfying

#[#set math.equation(numbering: n => "(1.1)")
 $ integral_(bb(R)) "tr" \( W \( x \)^p \) thin d x < oo \, $ <intro:class>]

let $H_W = - d^2 \/ d x^2 - W$ be the operator associated with

#[#set math.equation(numbering: n => "(1.2)")
 $ h_W \[ psi \] = integral_(bb(R)) parallel psi' parallel^2 - integral_(bb(R)) chevron.l psi \,
   W psi chevron.r \, wide psi in H^1 \( bb(R) \; bb(C)^m \) . $ <intro:form>]

Lemma 2 proves that the form is closed and bounded below and that the negative spectrum is discrete,
  with possible accumulation only at zero. We write

$ "Tr" \( H_W \)_(-)^gamma = sum_(lambda_j \( H_W \) < 0) \| lambda_j \( H_W \) \|^gamma \, $

counting multiplicities. The finite-dimensional trace $"tr"$ is unnormalized;
  matrix powers are defined by spectral functional calculus.

#thm([Theorem 1.1.])[
  (Equality classification).  #emph[For every $W$ satisfying (1.1),
#[#set math.equation(numbering: n => "(1.3)")
 $ "Tr" \( H_W \)_(-)^gamma lt.eq C_gamma integral_(bb(R)) "tr" \( W^p \) \, wide C_gamma =
   (frac(gamma - 1 \/ 2, gamma + 1 \/ 2))^(gamma - 1 \/ 2)
   frac(Gamma \( gamma + 1 \), sqrt(pi) thin Gamma \( gamma + 3 \/ 2 \)) . $ <intro:sharp>]

 Put $r = \( gamma - 1 \/ 2 \)^(- 1)$. Equality holds if and only if there are $k in { 0 \, dots.h \, m }$,
   a constant unitary matrix $U$, positive numbers $a_1 \, dots.h \, a_k$, and real numbers $x_1 \, dots.h \,
   x_k$ such that almost everywhere
#[#set math.equation(numbering: n => "(1.4)")
 $ W \( x \) = U "diag" #scale(x: 120%, y: 120%)[\(] w_1 \( x \) \, dots.h \, w_k \( x \) \, 0 \, dots.h \,
   0 #scale(x: 120%, y: 120%)[\)] U^(*) \, quad w_j \( x \) = \( r + 1 \) a_j^2 "sech"^2 #h(-0.16667em)
   #scale(x: 120%, y: 120%)[\(] r a_j \( x - x_j \) #scale(x: 120%, y: 120%)[\)] . $ <intro:classification>]

 The case $k = 0$ means $W = 0$. Each nonzero channel has exactly one negative eigenvalue, $- a_j^2$,
   and therefore every extremal potential has at most $m$ negative eigenvalues, counted with multiplicity.]
] <thm:main>

The inequality in (1.3) is the sharp matrix inequality of [11] Theorem 1.1.
  Our contribution is its equality classification. We retain the analytic constructions in the proof,
  so that the inequality and its equality conditions are established here under the same measurable potential
  hypothesis. The scales and centers in (1.4) are independent; repeated scales and identical profiles are allowed.

=== 1.1 History and related results <history-and-related-results>

Lieb and Thirring introduced spectral moment inequalities in their work on the kinetic energy of fermions and
  stability of matter [8,9]. Their sharp constants distinguish the regimes in which binding is best concentrated
  in a single state or distributed among many states. Keller’s optimization of the lowest Schrödinger
  eigenvalue [6] supplies the one-state problem underlying the scalar profiles in (1.4);
  their explicit form appears in [9] Section 4(B), Equations (4.19)–(4.20).
  The present question concerns equality in the sum of all negative eigenvalue moments,
  with a matrix potential that need not commute with itself at different points.

The sharp scalar endpoint $gamma = 1 \/ 2$ was proved by Hundertmark, Lieb and Thomas [5]; Hundertmark,
  Laptev and Weidl [4] Theorem 3.1 extended it to operator-valued potentials.
  The semiclassical constant is sharp for $gamma gt.eq 3 \/ 2$;
  the lifting of moments of Aizenman and Lieb [1] and the operator-valued inequalities of Laptev and Weidl [7] are
  central to this development. Benguria and Loss [2] gave a commutation proof of the matrix result at $gamma =
  3 \/ 2$. More recently, Read and Schulz [12] proved the sharp scalar inequality at $gamma = 1$,
  with constant $4 \/ \( 3 sqrt(3) pi \)$, and its operator-valued extension.
  The matrix companion [11] proves the sharp one-state constant for the whole open interval considered here.

The endpoint $gamma = 3 \/ 2$ has a different equality structure.
  In the scalar finite-rank problem, Frank, Gontier and Lewin [3] Theorem 5 identify the optimizers as KdV
  multisolitons. In particular, several bound states can occur in a single scalar channel at that endpoint.
  The conclusion of Theorem 1, one bound state per nonzero channel,
  uses the strict inequality $r > 1$ and is asserted only for the open interval.

=== 1.2 Quantitative defects and fixed channels <quantitative-defects-and-fixed-channels>

The proof begins with the finite-interval matrix action method of [11].
  For orthonormal real trial functions approximating finitely many negative eigenfunctions,
  place the functions in the rows of $U \( x \)$ and choose a lower triangular matrix $C$.
  The rows of $A = C U$ remain in the successive trial spans.
  If $K$ is the diagonal matrix of positive square roots of the trial binding energies, the action involves $A'$,
  $K^2 A A^T$, and a power of the density $A A^T$. A symmetric matrix path $B \( x \)$ connects $K$ to $-
  K$ and gives a lower bound for that action.

For equality, the lower bound must retain more information.
  Besides the square $parallel A' - B A parallel_(upright("HS"))^2$, we retain a term controlling

$ \[ B \, K^2 \] quad upright("and") quad K^2 - B^2 - \( A A^T \)^r . $

Its coefficient depends on the largest binding energy and the exponent, but not on the number of trial functions.
  This uniformity is the first essential point: an extremal potential is not known in advance to have finitely
  many negative eigenvalues. The integrated trace identity of the matrix companion supplies the two nonnegative
  squares from which this estimate follows.

The second point is compactness with a fixed number of columns.
  As the trial list grows, $A$ has more rows but still only $m$ columns.
  Its density therefore has rank at most $m$. The retained defect bounds the tail rows by the small binding
  energies in that tail. This yields strong pointwise convergence even for an infinite eigenvalue list and gives
  exact algebraic relations in the limit. Those relations separate the rows with different energies.
  A differential inequality then makes their row spaces independent of position;
  their mutual orthogonality leaves at most $m$ nonzero directions.
  On each resulting finite block, a matrix Riccati equation has a fixed diagonalizing basis and determines the
  profiles in (1.4).

Section 2 gives the spectral and convexity preliminaries.
  Section 3 proves the quantitative action estimate, and Section 4 recovers the sharp spectral bound.
  Section 5 passes to exact relations for an equality case.
  Section 6 proves that the channels are fixed, solves the Riccati equation,
  and treats complex potentials and the converse. Appendices 7 and 8 prove the trace identity,
  regularized field construction, and connecting-path theorem used by the action estimate.

=== 1.3 Notation <notation>

Throughout the proof,

#[#set math.equation(numbering: n => "(1.5)")
 $ sigma = gamma - 1 / 2 in \( 0 \, 1 \) \, wide p = 1 + sigma \, wide r = sigma^(- 1) \, wide q = r + 1 \,
   $ <intro:parameters>]

and

#[#set math.equation(numbering: n => "(1.6)")
 $ D_sigma = frac(sigma^sigma, \( 1 + sigma \)^(1 + sigma)) \, wide b_sigma =
   integral_(- 1)^1 \( 1 - s^2 \)^sigma thin d s \, wide C_gamma = D_sigma / b_sigma . $ <intro:constants>]

The last identity follows from the beta integral. We use the operator norm $parallel dot.op
  parallel_("op")$ and the Hilbert–Schmidt norm $parallel A parallel_(upright("HS"))^2 = "tr" \( A^(*) A \)$.
  The symbol $T$ denotes transpose of a real matrix, and $"Sym"_n$ is the space of real symmetric $n times
  n$ matrices with inner product $"tr" \( B H \)$. The commutator is $\[ B \, H \] = B H - H B$.
  The identity matrix, or identity operator, has the size determined by its context.

== 2 Spectral and convexity preliminaries <pre:section>

Two elementary facts let us work with measurable potentials and identify the equality condition in the potential
  estimate. The first is the form argument used in the matrix inequality [11] Lemma 7.1;
  we give its proof to fix the precise regularity available below.

#thm([Lemma 2.1.])[
  #emph[Let $p > 1$ and let $W : bb(R) arrow.r bb(C)^(m times m)$ be measurable,
    Hermitian and positive semidefinite, with $integral_(bb(R)) "tr" \( W^p \) < oo$.
    The form $h_W$ on $H^1 \( bb(R) \; bb(C)^m \)$ is closed and bounded below.
    Multiplication by $W^(1 \/ 2)$ is compact from $H^1$ to $L^2$.
    The negative spectrum of $H_W$ consists of isolated eigenvalues of finite multiplicity,
    with possible accumulation only at zero. Its eigenfunctions belong to $H^1$ and satisfy $- psi'' - W psi =
    lambda psi$ distributionally.]
] <pre:spectral>

#proof[
  Set $w = parallel W parallel_("op")$. Then $w^p lt.eq "tr" \( W^p \)$, so $w in L^p$.
    The one-dimensional Sobolev estimate, applied to the norm of a vector function,
    gives $parallel psi parallel_oo^2 lt.eq 2 parallel psi parallel_2 parallel psi' parallel_2$.
    Hölder’s inequality, interpolation and Young’s inequality imply
  #[#set math.equation(numbering: n => "(2.1)")
   $ integral_(bb(R)) chevron.l psi \, W psi chevron.r lt.eq
     2^(1 \/ p) parallel w parallel_p parallel psi' parallel_2^(1 \/ p) parallel psi parallel_2^(2 - 1 \/ p) lt.eq
     epsilon parallel psi' parallel_2^2 + C_epsilon parallel psi parallel_2^2 . $ <pre:form-bound>]
  A sufficiently shifted form norm is therefore equivalent to the $H^1$ norm.
    This proves closedness and semiboundedness, and polarization gives continuity of the potential form on $H^1$.
  Write $T psi = W^(1 \/ 2) psi$. The truncated multiplier $T_(R \, L) =
    upright(bold(1))_({ \| x \| lt.eq R \, thin w lt.eq L }) T$ is compact by the compact embedding of
    $H^1 \( \[ - R \, R \] \)$ into $L^2 \( \[ - R \, R \] \)$. Moreover,
  $ parallel \( T - T_(R \, L) \) psi parallel_2^2 lt.eq C parallel w
    upright(bold(1))_({ \| x \| > R } union { w > L }) parallel_p parallel psi parallel_(H^1)^2 . $
  The coefficient tends to zero, so $T$ is compact. For each $a > 0$,
    an infinite-dimensional spectral subspace in $\( - oo \, - a \]$ would contain an $L^2$-orthonormal sequence
    bounded in $H^1$ by (2.1). A subsequence converges weakly to zero in $H^1$,
    hence its images under $T$ converge strongly to zero. This contradicts $- a gt.eq h_W \[ psi \] gt.eq -
    parallel T psi parallel_2^2$ for unit vectors in that subspace.
    Thus every such subspace is finite-dimensional. Finally, the weak form equation tested against smooth
    compactly supported functions is the stated distributional equation;
    its potential term is locally integrable because $W in L_(upright("loc"))^p$ and $psi$ is locally bounded. ◻
]

#thm([Lemma 2.2.])[
  (Trace Young inequality and its equality condition).  #emph[For positive semidefinite matrices $W \,
    Z$ of the same finite size, set
#[#set math.equation(numbering: n => "(2.2)")
 $ Y \( W \, Z \) = D_sigma "tr" \( W^p \) - "tr" \( W Z \) + "tr" \( Z^q \) . $ <pre:young-defect>]

 Then $Y \( W \, Z \) gt.eq 0$, with equality if and only if $W = q Z^r$. Also,
#[#set math.equation(numbering: n => "(2.3)")
 $ Y \( W \, Z \) gt.eq 1 / 2 "tr" \( Z^q \) - \( 2^(p - 1) - 1 \) D_sigma "tr" \( W^p \) . $ <pre:young-coercive>]

]
] <pre:young>

#proof[
  Scalar maximization over $z gt.eq 0$ gives $y z - z^q lt.eq D_sigma y^p$ for $y gt.eq 0$,
    with equality precisely when $y = q z^r$. In an orthonormal eigenbasis $\( v_j \)$ of $Z$,
    let $z_j$ be its eigenvalues and put $y_j = chevron.l v_j \, W v_j chevron.r$.
    Strict convexity of $t^p$ on $\[ 0 \, oo \)$ gives
  $ "tr" \( W Z \) - "tr" \( Z^q \) lt.eq D_sigma sum_j y_j^p lt.eq D_sigma sum_j chevron.l v_j \, W^p v_j chevron.r . $
  Equality in the second inequality holds exactly when each $v_j$ belongs to an eigenspace of $W$.
    Equality in the first then requires $W v_j = q z_j^r v_j$ for every $j$.
    This proves both directions of the equality assertion, including zero eigenvalues.
    Applying the same inequality to $2 W \, Z$ gives $"tr" \( W Z \) lt.eq 1 / 2 "tr" \( Z^q \) +
    2^(p - 1) D_sigma "tr" \( W^p \)$, which is (2.3). ◻
]

== 3 An action estimate that retains the equality defects <act:section>

The finite-interval argument for the sharp inequality can also measure failure of its equality relations.
  We retain the first-order square and a quantitative part of the matrix trace deficit.
  The coefficient of this second defect will be independent of the number of rows.
  This uniformity allows us to exhaust an eigenvalue list before knowing that it is finite.

The construction adapts the field, connecting paths, and action identity of [11] Sections 3–6.
  Their analytic foundations are proved in Appendices 7 and 8;
  the additional estimate below extracts operator-norm rigidity from the trace deficit.

Fix positive integers $n \, d$, a bounded interval $Omega = \( x_(-) \, x_(+) \)$, and $K =
  "diag" \( ell_1 \, dots.h \, ell_n \)$ with $0 < ell_i lt.eq kappa$.
  For $A in H_0^1 \( Omega \; bb(R)^(n times d) \)$, set $rho = A A^(sans(T))$ and define

#[#set math.equation(numbering: n => "(3.1)")
 $ cal(E)_K \( A \) = integral_Omega #scale(x: 120%, y: 120%)[\(] parallel A' parallel_(upright("HS"))^2 +
   "tr" \( K^2 rho \) - "tr" \( rho^q \) #scale(x: 120%, y: 120%)[\)] thin d x . $ <act:energy>]

For pointwise matrix values $A in bb(R)^(n times d)$ and $B in "Sym"_n$, put

#[#set math.equation(numbering: n => "(3.2)")
 $ Phi_K \( A \, B \) = min {1 \, parallel \[ B \, K^2 \] parallel_("op")^2 + parallel K^2 -
   B^2 - \( A A^(sans(T)) \)^r parallel_("op")^2} . $ <act:defect>]

Thus $Phi_K = 0$ expresses two algebraic relations, while $A' - B A = 0$ is a first-order differential relation.

#thm([Theorem 3.1.])[
  (Quantitative finite-interval action estimate).  #emph[Let $0 < sigma < 1$ and $kappa > 0$.
    There is a constant $c_(*) = c_(*) \( sigma \, kappa \) > 0$ with the following property.
    For $n \, d \, Omega \, K$ as above, suppose $U in H_0^1 \( Omega \; bb(R)^(n times d) \)$ satisfies
$ integral_Omega U U^(sans(T)) thin d x = I_n . $

 For every $eta > 0$ there exist a real lower triangular matrix $C in bb(R)^(n times n)$ and a path $B in
   C^1 \( overline(Omega) \; "Sym"_n \)$ such that
$ B \( x_(-) \) = K \, wide B \( x_(+) \) = - K \, wide sup_(x in overline(Omega)) parallel B \( x \)
  parallel_("op") lt.eq kappa \, $

 and, for $A = C U$,
#[#set math.equation(numbering: n => "(3.3)")
 $ cal(E)_K \( A \) gt.eq b_sigma sum_(i = 1)^n ell_i^(2 gamma) +
   integral_Omega (parallel A' - B A parallel_(upright("HS"))^2 + c_(*) Phi_K \( A \, B \)) thin d x -
   eta . $ <act:bound>]

 In particular, $c_(*)$ is independent of $n \, d \, Omega \, U$, and the smallest diagonal entry of $K$.]
] <act:quantitative-action>

=== 3.1 Coercivity at the matrix-field constraint <coercivity-at-the-matrix-field-constraint>

The algebraic relations $Phi_K \( A \, B \) = 0$ require $\[ B \, K^2 \] = 0$ and $rho = \( K^2 - B^2 \)^sigma$.
  For $0 < delta lt.eq 1$, we use a locally Lipschitz field $M_delta : "Sym"_n arrow.r
  "Sym"_n$ extending the commuting rule

$ M_delta \( B \) = \( K^2 - B^2 + delta I \)^sigma - delta^sigma I quad upright("if ") \[ B \, K^2 \] =
  0 upright(" and ") K^2 - B^2 gt.eq 0 . $

Thus the constraint $M_delta \( B \) = rho$ is a regularized form of the algebraic equality relation in this case.
  The extension to arbitrary symmetric $B$ has a $C^1$ primitive $J_delta : "Sym"_n arrow.r bb(R)$ satisfying

#[#set math.equation(numbering: n => "(3.4)")
 $ d J_delta \( B \) \[ H \] = - "tr" \( M_delta \( B \) H \) . $ <act:primitive>]

Proposition 11 constructs these maps and proves their required properties.
  Along a path $B$, the derivative identity converts $- "tr" \( M_delta \( B \) B' \)$ into the total derivative
  of $J_delta \( B \)$, which will supply the boundary term in the action identity. Its endpoint difference is explicit:

#[#set math.equation(numbering: n => "(3.5)")
 $ J_delta \( - K \) - J_delta \( K \) & = sum_(i = 1)^n integral_(- ell_i)^(ell_i)
   #scale(x: 120%, y: 120%)[\(] \( ell_i^2 - s^2 + delta \)^sigma - delta^sigma #scale(x: 120%, y: 120%)[\)] thin d s\
 & arrow.r b_sigma sum_(i = 1)^n ell_i^(2 gamma) wide \( delta arrow.b 0 \) . $ <act:endpoints>]

The limit follows by dominated convergence and $2 sigma + 1 = 2 gamma$.

Define the scalar function

#[#set math.equation(numbering: n => "(3.6)")
 $ F \( A \, B \) = "tr" \( rho^q \) - "tr" #scale(x: 120%, y: 120%)[\(] \( K^2 - B^2 \) rho
   #scale(x: 120%, y: 120%)[\)] \, wide rho = A A^(sans(T)) . $ <act:F>]

The following lemma bounds this nonlinear term while keeping the algebraic defect.
  The constraint in its hypothesis will later be enforced by a penalty.

#thm([Lemma 3.2.])[
  #emph[The constant $c_(*) \( sigma \, kappa \) > 0$ can be chosen so that, whenever $0 < delta lt.eq 1$,
    $parallel B parallel_("op") lt.eq kappa$, and $M_delta \( B \) = A A^(sans(T))$, one has
#[#set math.equation(numbering: n => "(3.7)")
 $ F \( A \, B \) + c_(*) Phi_K \( A \, B \) lt.eq E_(n \, delta) \, wide E_(n \, delta) =
   n #scale(x: 120%, y: 120%)[\(] delta kappa^(2 sigma) + delta^sigma \( kappa^2 + delta \)
   #scale(x: 120%, y: 120%)[\)] + delta^(2 sigma) . $ <act:constraint-bound>]

]
] <act:constraint>

#proof[
  Write $rho = M_delta \( B \) gt.eq 0$. Proposition 12 gives
  #[#set math.equation(numbering: n => "(3.8)")
   $ Q_s := s^2 I - 2 s B + K^2 gt.eq 0 quad \( s in bb(R) \) \, wide 0 lt.eq rho lt.eq
     kappa^(2 sigma) I . $ <act:positive-symbol>]
  Put $V = K^2 - B^2 + delta I$ and $beta = sigma - 1 / 2$.
    With the positive normalization constant $c_sigma$ specified in (7.1), define
  #[#set math.equation(numbering: n => "(3.9)")
   $ R \( t \) & = 1 / pi integral_(bb(R)) #scale(x: 120%, y: 120%)[\(] Q_s + \( delta + t \) I
     #scale(x: 120%, y: 120%)[\)]^(- 1) thin d s \, wide t > 0 \,\
N & = c_sigma integral_0^oo t^beta #scale(x: 120%, y: 120%)[\(] t^(- 1 \/ 2) I -
  R \( t \) #scale(x: 120%, y: 120%)[\)] thin d t = rho + delta^sigma I . $ <act:RN>]
  The last identity is also part of Proposition 12. Since $\( s I - B \)^2 + V = Q_s + delta I gt.eq
    delta I$ and $N gt.eq 0$, Theorem 10 applies. It supplies $L \( t \) =
    R \( t \)^(- 1) > 0$ and Hermitian matrices $Z \( t \)$ satisfying
  #[#set math.equation(numbering: n => "(3.10)")
   $ V + t I = L^2 + Z^2 + i \[ B \, Z \] \, wide L Z + Z L + i \[ B \, L \] = 0 \, $ <act:LZ>]
  and the exact identity
  #[#set math.equation(numbering: n => "(3.11)")
   $ Delta & := "tr" \( N V \) - "tr" \( N^q \)\
 & =
   c_sigma integral_0^oo t^beta
   ("tr" \( R \( t \) Z \( t \)^2 \) + q parallel R \( t \)^(- 1 \/ 2) - R \( t \)^(1 \/ 2) \( t I + N^r \)^(1 \/
   2) #scale(x: 120%, y: 120%)[parallel]_(upright("HS"))^2) thin d t gt.eq 0 . $ <act:trace-deficit>]
  The matrices in (3.10) may be complex Hermitian even though $A$ and $B$ are real; $i$ denotes the imaginary unit.
  We extract a dimension-independent bound from the part of the integral with $1 lt.eq t lt.eq 2$.
    On this interval there are constants $a_kappa \, A_kappa > 0$ such that
  #[#set math.equation(numbering: n => "(3.12)")
   $ a_kappa I lt.eq R \( t \) lt.eq A_kappa I . $ <act:R-bounds>]
  For the upper bound, use $Q_s gt.eq 0$ on a bounded interval in $s$, and $Q_s gt.eq 1 /
    2 s^2 I$ for $\| s \| gt.eq max { 1 \, 4 kappa }$. For the lower bound,
    restrict the integral to $\| s \| lt.eq 1$, where $Q_s + \( delta + t \) I lt.eq \( 4 + 2 kappa + kappa^2 \)
    I$. These estimates depend on $kappa$ alone. Moreover $parallel N parallel_("op") lt.eq kappa^(2 sigma) + 1$,
    so $H_t = \( t I + N^r \)^(1 \/ 2)$ and $L \( t \)$ are bounded in operator norm by constants depending only
    on $sigma \, kappa$.
  The two integrands in (3.11) control $parallel Z \( t \) parallel_(upright("HS"))^2$ and $parallel L \( t \) -
    H_t parallel_(upright("HS"))^2$: indeed $"tr" \( R Z^2 \) = "tr" \( Z R Z \)$ and
  $ R^(- 1 \/ 2) - R^(1 \/ 2) H_t = R^(1 \/ 2) \( L - H_t \) . $
  It follows by averaging over $\[ 1 \, 2 \]$ that at some $t$ in this interval,
  #[#set math.equation(numbering: n => "(3.13)")
   $ parallel Z \( t \) parallel_("op") + parallel L \( t \) - H_t parallel_("op") lt.eq C_1 sqrt(Delta) \,
     $ <act:small-squares>]
  where $C_1$ depends only on $sigma \, kappa$. When $Delta = 0$,
    the same conclusion follows by taking a point where both nonnegative integrands vanish.
  Suppose first that $Delta lt.eq 1$, and use this value of $t$. The first identity in (3.10) gives
  $ V - N^r = \( L^2 - H_t^2 \) + Z^2 + i \[ B \, Z \] . $
  The boundedness of $L \, H_t \, B$, together with (3.13),
    bounds the norm of this expression by $C_2 sqrt(Delta)$. To control the commutator,
    the second identity in (3.10) first yields $parallel \[ B \, L \] parallel_("op") lt.eq
    2 parallel L parallel_("op") parallel Z parallel_("op")$. Then
  $ \[ B \, V \] = \[ B \, L^2 \] + \[ B \, Z^2 \] + i \[ B \, \[ B \, Z \] \] $
  has the same bound. Thus
  #[#set math.equation(numbering: n => "(3.14)")
   $ parallel V - N^r parallel_("op") + parallel \[ B \, V \] parallel_("op") lt.eq
     C_3 sqrt(Delta) . $ <act:V-coercivity>]
  Here and below the constants in this proof depend only on $sigma \, kappa$.
  The matrices $N = rho + delta^sigma I$ and $rho$ commute.
    Because $r > 1$, the scalar function $y mapsto y^r$ is Lipschitz on $\[ 0 \, kappa^(2 sigma) + 1 \]$. Consequently
  $ parallel N^r - rho^r parallel_("op") lt.eq C_4 delta^sigma . $
  Since $\[ B \, V \] = \[ B \, K^2 \]$ and $delta lt.eq delta^sigma$, (3.14) implies
  $ parallel \[ B \, K^2 \] parallel_("op")^2 + parallel K^2 - B^2 - rho^r parallel_("op")^2 lt.eq
    C_5 \( Delta + delta^(2 sigma) \) . $
  Choose $c_(*) > 0$ sufficiently small, also with $c_(*) lt.eq 1$. For $Delta lt.eq 1$ the preceding estimate gives
  #[#set math.equation(numbering: n => "(3.15)")
   $ c_(*) Phi_K \( A \, B \) lt.eq Delta + delta^(2 sigma) . $ <act:coercivity>]
  For $Delta > 1$ this follows directly from $Phi_K lt.eq 1$.
    This proves the required uniform control of the algebraic defect.
  It remains to relate $Delta$ to $F$. Expanding $N$ and $V$ gives
  $ F \( A \, B \) = - Delta + "tr" \( rho^q \) - "tr" \( N^q \) + delta "tr" rho + delta^sigma "tr" V . $
  The first two powers are ordered because $N = rho + delta^sigma I$.
    Also $"tr" rho lt.eq n kappa^(2 sigma)$ and $V lt.eq \( kappa^2 + delta \) I$. Adding (3.15) now proves (3.7). ◻
]

=== 3.2 The action identity and the penalty limit <the-action-identity-and-the-penalty-limit>

#proof[
  Fix $0 < delta lt.eq 1$. Proposition 13 supplies, for every $0 < epsilon lt.eq 1$,
    a lower triangular matrix $C_epsilon$ and a path $B_epsilon$ with the prescribed endpoints and operator-norm
    bound such that, for $A_epsilon = C_epsilon U$,
  #[#set math.equation(numbering: n => "(3.16)")
   $ epsilon B'_epsilon = M_delta \( B_epsilon \) - A_epsilon A_epsilon^(sans(T)) . $ <act:path>]
  For fixed $delta \, K \, Omega \, U$, the matrices $C_epsilon$ are bounded uniformly in $0 < epsilon lt.eq 1$.
  Temporarily suppress the subscript $epsilon$ and write
  $ u_delta \( A \, B \) = parallel M_delta \( B \) - A A^(sans(T)) parallel_(upright("HS"))^2 . $
  Since $A in H_0^1$ and $B in C^1$, the product and chain rules for absolutely continuous functions, (3.4),
    and (3.16) yield almost everywhere
  $ #scale(x: 120%, y: 120%)[\(] J_delta \( B \) + "tr" \( A^(sans(T)) B A \) #scale(x: 120%, y: 120%)[\)]' & =
    2 "tr" \( \( A' \)^(sans(T)) B A \) - "tr" #scale(x: 120%, y: 120%)[\(] \( M_delta \( B \) - A A^(sans(T)) \)
    B' #scale(x: 120%, y: 120%)[\)]\
 & = 2 "tr" \( \( A' \)^(sans(T)) B A \) - epsilon^(- 1) u_delta \( A \, B \) . $
  Complete the square in the action and integrate this identity.
    Because $A$ vanishes at both endpoints, the result is the exact formula
  #[#set math.equation(numbering: n => "(3.17)")
   $ cal(E)_K \( A \) & = J_delta \( - K \) - J_delta \( K \)\
 & quad +
   integral_Omega
   (parallel A' - B A parallel_(upright("HS"))^2 - F \( A \, B \) + epsilon^(- 1) u_delta \( A \, B \)) thin d x .
   $ <act:identity>]
  We now use the penalty to pass from the constraint estimate in Lemma 5 to all matrix values on these paths.
    The continuous representative of $U$ is bounded on $overline(Omega)$.
    The uniform bound on $C_epsilon$ and the bound $parallel B_epsilon parallel_("op") lt.eq
    kappa$ therefore place all pairs $\( A_epsilon \( x \) \, B_epsilon \( x \) \)$ in one compact set
    $cal(K)_delta subset bb(R)^(n times d) times "Sym"_n$ on which $parallel B parallel_("op") lt.eq kappa$.
    On this set $F$, $Phi_K$, and $u_delta$ are continuous. Lemma 5 implies
  #[#set math.equation(numbering: n => "(3.18)")
   $ limsup_(epsilon arrow.b 0) sup_(\( A \, B \) in cal(K)_delta) #scale(x: 120%, y: 120%)[\(] F \( A \, B \) +
     c_(*) Phi_K \( A \, B \) - epsilon^(- 1) u_delta \( A \, B \) #scale(x: 120%, y: 120%)[\)] lt.eq
     E_(n \, delta) . $ <act:penalty>]
  Indeed, if the left side exceeded $E_(n \, delta)$, some sequence $epsilon_j arrow.b
    0$ and corresponding pairs in the compact set would make the expression at least $E_(n \, delta) +
    tau$ for some $tau > 0$. Boundedness of $F + c_(*) Phi_K$ would force $u_delta =
    O \( epsilon_j \)$ along that sequence. A convergent subsequence would then give a limiting pair with
    $u_delta = 0$ and $F + c_(*) Phi_K gt.eq E_(n \, delta) + tau$, contradicting Lemma 5.
  For any $tau > 0$, choose $epsilon$ small enough that the supremum in (3.18) is at most $E_(n \, delta) + tau$.
    Substitution into (3.17) gives
  $ cal(E)_K \( A_epsilon \) gt.eq  & J_delta \( - K \) - J_delta \( K \) - \| Omega \| \( E_(n \, delta) + tau \)\
 & +
   integral_Omega
   (parallel A'_epsilon - B_epsilon A_epsilon parallel_(upright("HS"))^2 + c_(*) Phi_K \( A_epsilon \,
   B_epsilon \)) thin d x . $
  Finally, first choose $delta > 0$ so small that the endpoint error in (3.5) and $\| Omega \|
    E_(n \, delta)$ together are less than $eta \/ 2$. Next choose $tau > 0$ with $\| Omega \| tau < eta \/ 2$,
    and then choose the required $epsilon$. These choices prove (3.3).
    All compactness arguments were made after fixing $delta$; no bound uniform in $delta$ is needed. ◻
]

== 4 Recovering the sharp spectral bound <bound:section>

The action estimate implies the sharp inequality by the spectral passage of [11] Section 7.
  We record it before studying equality, so that the finite spectral moment used below has already been established.

#thm([Proposition 4.1.])[
  #emph[Every potential in Theorem 1 satisfies
$ "Tr" \( H_W \)_(-)^gamma lt.eq D_sigma / b_sigma integral_(bb(R)) "tr" \( W^p \) . $

]
] <bound:sharp>

#proof[
  First suppose that $W$ is real symmetric. Choose any finite initial list of negative eigenvalues $- k_1^2 \,
    dots.h \, - k_n^2$, with $k_1 gt.eq dots.h.c gt.eq k_n > 0$, and real orthonormal eigenfunctions $phi_i$.
    For $0 < xi < k_n^2$ put $ell_i = \( k_i^2 - xi \)^(1 \/ 2)$ and $K = "diag" \( ell_1 \, dots.h \, ell_n \)$.
    There are real smooth compactly supported orthonormal functions $u_i$ with form matrix
  #[#set math.equation(numbering: n => "(4.1)")
   $ \( h_W \[ u_i \, u_j \] \)_(i \, j = 1)^n lt.eq - K^2 . $ <bound:trial>]
  Indeed, approximate the $phi_i$ in $H^1$, then multiply the family by the inverse square root of its Gram
    matrix. The Gram matrix tends to $I_n$, and the form matrix tends to $- "diag" \( k_i^2 \)$ by Lemma 2;
    an operator norm error below $xi$ gives (4.1).
  Let $U$ have rows $u_i$, and choose a bounded interval containing their supports.
    For every lower triangular $C$, the $i$th row $a_i$ of $A = C U$ satisfies
  $ h_W \[ a_i \] + ell_i^2 parallel a_i parallel_2^2 lt.eq
    sum_(l lt.eq i) C_(i l)^2 \( ell_i^2 - ell_l^2 \) lt.eq 0 . $
  Set $Z = A^T A$. The matrices $A A^T$ and $Z$ have the same nonzero eigenvalues, with multiplicity.
    Summing the preceding bound and applying Lemma 3 yields
  $ cal(E)_K \( A \) lt.eq integral_(bb(R)) { "tr" \( W Z \) - "tr" \( Z^q \) } lt.eq
    D_sigma integral_(bb(R)) "tr" \( W^p \) . $
  Theorem 4, with its nonnegative defects discarded, gives $b_sigma sum_i ell_i^(2 gamma) lt.eq
    D_sigma integral "tr" \( W^p \) + eta$ for every $eta > 0$.
    Let $eta arrow.b 0$, then $xi arrow.b 0$, and finally exhaust the negative eigenvalues.
    The case of an empty negative spectrum is immediate.
  For complex Hermitian $W = E + i F$, with $E \, F$ real, its realification is
  #[#set math.equation(numbering: n => "(4.2)")
   $ tilde(W) = mat(delim: "(", E, - F; F, E) . $ <bound:realification>]
  The constant unitary matrix $2^(- 1 \/ 2) mat(delim: "(", I, i I; I, - i I)$ conjugates $tilde(W)$ to $W xor
    overline(W)$. Hence $tilde(W)$ is real symmetric and positive semidefinite, $"tr" \( tilde(W)^p \) =
    2 "tr" \( W^p \)$, and $"Tr" \( H_(tilde(W)) \)_(-)^gamma = 2 "Tr" \( H_W \)_(-)^gamma$.
    Here conjugation identifies the spectra of $H_W$ and $H_(overline(W))$.
    The real inequality, divided by two, proves the result. ◻
]

== 5 From equality to pointwise matrix relations <comp:section>

We now apply Theorem 4 to finite collections of negative eigenfunctions.
  Equality forces each of its nonnegative errors to vanish.
  The main issue is that the number of eigenfunctions may grow without bound,
  whereas the potential has only $m$ channels. We will use this fixed number of columns to control the tails of
  the resulting matrices.

Throughout this section, $W$ is real symmetric, $W gt.eq 0$ almost everywhere,
  and $0 < integral_(bb(R)) "tr" \( W^p \) < oo$. Suppose that equality holds, in the form

#[#set math.equation(numbering: n => "(5.1)")
 $ b_sigma sum_(i in cal(I)) k_i^(2 gamma) = D_sigma integral_(bb(R)) "tr" \( W^p \) thin d x \, $ <comp:equality>]

where $- k_i^2$ are the negative eigenvalues of $H_W$, repeated according to multiplicity, and

$ k_1 gt.eq k_2 gt.eq dots.h.c > 0 . $

By Lemma 2, the index set $cal(I)$ is a nonempty finite initial segment of $bb(N)$ or all of $bb(N)$,
  each eigenvalue has finite multiplicity, and $k_i arrow.r 0$ in the infinite case.
  Fix real orthonormal eigenfunctions $phi_i in H^1 \( bb(R) \; bb(R)^m \)$ and regard them as row vectors. Write

$ cal(H) = ell^2 \( cal(I) \; bb(R) \) \, wide Lambda = "diag" \( k_i : i in cal(I) \) \, wide kappa = k_1 . $

For operators between real Hilbert spaces, the superscript $T$ will also denote the adjoint.

#thm([Proposition 5.1.])[
  (Pointwise relations at equality).  #emph[Under these assumptions,
    there are rows $a_i in H^1 \( bb(R) \; bb(R)^m \)$, $i in cal(I)$,
    each a linear combination of eigenfunctions with eigenvalue $- k_i^2$, such that
#[#set math.equation(numbering: n => "(5.2)")
 $ - a''_i - a_i W = - k_i^2 a_i quad upright("in distributions.") $ <comp:row-eigenfunction>]

 The rows $a_i$ are allowed to vanish. On a common set of full measure,
   they define a Hilbert–Schmidt operator $A \( x \) : bb(R)^m arrow.r cal(H)$,
   and there exists a bounded self-adjoint operator $B$ on $cal(H)$ with $parallel B parallel_("op") lt.eq
   kappa$ such that
#[#set math.equation(numbering: n => "(5.3)")
 $ \[ B \, Lambda^2 \] = 0 \, wide Lambda^2 - B^2 = \( A A^T \)^r \, wide
   a'_i \( x \) = \( B A \)_(i \, dot.op) quad \( i in cal(I) \) . $ <comp:limit-relations>]

 Moreover,
#[#set math.equation(numbering: n => "(5.4)")
 $ W \( x \) = q #scale(x: 120%, y: 120%)[\(] A \( x \)^T A \( x \) #scale(x: 120%, y: 120%)[\)]^r quad
   upright("almost everywhere.") $ <comp:potential-limit>]

 The operator $B$ is asserted to exist separately at each such point $x$; no measurable choice is required.]
] <comp:relations>

We divide the proof into the construction of a sequence whose errors vanish, convergence of every fixed row,
  and control of the remaining rows.

=== 5.1 Finite spectral approximations and vanishing errors <comp:approximation>

Let $n_j = j$ when $cal(I) = bb(N)$, and let $n_j = \| cal(I) \|$ when $cal(I)$ is finite.
  Choose $0 < xi_j < 1 \/ j$ so small that

#[#set math.equation(numbering: n => "(5.5)")
 $ ell_(j \, i) := \( k_i^2 - xi_j \)^(1 \/ 2) > 0 quad \( 1 lt.eq i lt.eq n_j \) \, wide
   sum_(i lt.eq n_j) #scale(x: 120%, y: 120%)[\(] k_i^(2 gamma) -
   ell_(j \, i)^(2 gamma) #scale(x: 120%, y: 120%)[\)] < 1 \/ j . $ <comp:common-shift>]

Set $K_j = "diag" \( ell_(j \, 1) \, dots.h \, ell_(j \, n_j) \)$.
  The same shift $xi_j$ is used for every eigenvalue: this leaves the differences of their squares unchanged.

The approximation leading to (4.1) can be made arbitrarily accurate in $H^1$.
  Apply it to the first $n_j$ eigenfunctions, choosing the $H^1$ errors below $1 \/
  j$ and the form-matrix error below $xi_j$. This gives real, smooth, compactly supported functions $u_(j \, 1) \,
  dots.h \, u_(j \, n_j)$, orthonormal in $L^2 \( bb(R) \; bb(R)^m \)$, such that

#[#set math.equation(numbering: n => "(5.6)")
 $ parallel u_(j \, i) - phi_i parallel_(H^1) < 1 \/ j \, wide
   #scale(x: 120%, y: 120%)[\(] h_W \[ u_(j \, i) \, u_(j \, l) \] #scale(x: 120%, y: 120%)[\)]_(i \, l = 1)^(n_j)
   lt.eq - K_j^2 . $ <comp:form-approximation>]

Here $h_W \[ dot.op \, dot.op \]$ is the polarized quadratic form,
  and the second inequality is the ordering of real symmetric matrices.

Let $U_j$ be the matrix with rows $u_(j \, i)$, and choose a bounded interval $Omega_j$ containing their supports
  in its interior. Apply Theorem 4 with $K = K_j$, $d = m$, $kappa = k_1$, and $eta = 1 \/ j$.
  It gives a lower triangular matrix $C_j$, a symmetric path $B_j$ with $parallel B_j parallel_("op") lt.eq
  kappa$, and $A_j = C_j U_j$. Extend $A_j$ by zero outside $Omega_j$ and extend $B_j$ by $K_j$ to the left and by
  $- K_j$ to the right. All the errors in that theorem vanish outside $Omega_j$,
  so their integrals may be taken over $bb(R)$.

The lower triangular form of $C_j$ gives a useful additional error.
  Put $Z_j = A_j^T A_j$, an $m times m$ positive semidefinite matrix. By (5.6),

#[#set math.equation(numbering: n => "(5.7)")
 $ cal(E)_(K_j) \( A_j \) lt.eq integral_(bb(R)) #scale(x: 120%, y: 120%)[\(] "tr" \( W Z_j \) -
   "tr" \( Z_j^q \) #scale(x: 120%, y: 120%)[\)] thin d x - T_j \, wide T_j =
   sum_(l lt.eq i lt.eq n_j) \( C_j \)_(i l)^(thin 2) \( k_l^2 - k_i^2 \) gt.eq 0 . $ <comp:triangular-gap>]

Indeed, the $i$th row of $A_j$ is $sum_(l lt.eq i) \( C_j \)_(i l) u_(j \, l)$.
  Its quadratic form, plus $ell_(j \, i)^2$ times its squared $L^2$ norm, is at most

$ sum_(l lt.eq i) \( C_j \)_(i l)^(thin 2) \( ell_(j \, i)^2 - ell_(j \, l)^2 \) = -
  sum_(l lt.eq i) \( C_j \)_(i l)^(thin 2) \( k_l^2 - k_i^2 \) . $

Summing over $i$ proves (5.7), since $A_j A_j^T$ and $Z_j$ have the same nonzero eigenvalues, with multiplicity.
  The ordering of the $k_i$ makes every summand of $T_j$ nonnegative.

Recall the nonnegative Young deficit from Lemma 3:

#[#set math.equation(numbering: n => "(5.8)")
 $ Y \( W \, Z \) = D_sigma "tr" \( W^p \) - "tr" \( W Z \) + "tr" \( Z^q \) gt.eq 0 \, wide Y \( W \, Z \) =
   0 med arrow.l.r.double med W = q Z^r . $ <comp:young-deficit>]

Combining Theorem 4, (5.1), and (5.7) yields

#[#set math.equation(numbering: n => "(5.9)")
 $ 0 lt.eq T_j + integral_(bb(R)) #scale(x: 180%, y: 180%)[\(] Y \( W \, Z_j \) + parallel A'_j -
   B_j A_j parallel_(upright("HS"))^2 + c_(*) Phi_(K_j) \( A_j \, B_j \) #scale(x: 180%, y: 180%)[\)] thin d x &
   lt.eq d_j \,\
d_j := b_sigma (sum_(i in cal(I)) k_i^(2 gamma) - sum_(i lt.eq n_j) ell_(j \, i)^(2 gamma)) + 1 \/ j & arrow.r
  0 . $ <comp:vanishing-errors>]

Here $c_(*) > 0$ is fixed: its independence of $n_j$ is essential.
  Thus all three integral errors tend to zero, as does $T_j$.

We will also need a uniform bound on $A_j$. The coercive estimate (2.3) gives

#[#set math.equation(numbering: n => "(5.10)")
 $ Y \( W \, Z_j \) gt.eq 1 / 2 "tr" \( Z_j^q \) - \( 2^(p - 1) - 1 \) D_sigma "tr" \( W^p \) . $ <comp:coercivity>]

Since $Z_j$ has size $m$, scalar Hölder’s inequality gives

$ parallel A_j parallel_(upright("HS"))^(2 q) = \( "tr" Z_j \)^q lt.eq m^(q - 1) "tr" \( Z_j^q \) . $

Equations (5.9) and (5.10) therefore bound $A_j$ uniformly in $L^(2 q) \( bb(R) \)$ with the Hilbert–Schmidt norm,
  independently of its number of rows.

=== 5.2 Convergence of each fixed row <comp:rows>

For fixed $i in cal(I)$, the coefficients $\( C_j \)_(i l)$, $l lt.eq i$, are bounded as $j arrow.r oo$.
  To see this, choose a bounded interval $J_i$ so large that the restricted Gram matrix

$ (integral_(J_i) phi_l \( x \) phi_s \( x \)^T thin d x)_(l \, s = 1)^i gt.eq 3 / 4 I_i \, $

where $I_i$ denotes the $i times i$ identity matrix. Such an interval exists because the full Gram matrix is the
  identity. By (5.6), the corresponding restricted Gram matrix of the $u_(j \, l)$ is at least one half of the
  identity for all sufficiently large $j$. Hence

$ 1 / 2 sum_(l lt.eq i) \( C_j \)_(i l)^(thin 2) lt.eq integral_(J_i) \| \( A_j \)_(i \, dot.op) \|^2 thin d x
  lt.eq \| J_i \|^(1 - 1 \/ q) (integral_(J_i) parallel A_j parallel_(upright("HS"))^(2 q) thin d x)^(1 \/ q) . $

The last expression is uniformly bounded. Lower triangularity is used here to keep the number of coefficients in a
  fixed row finite.

A diagonal subsequence now makes every coefficient $\( C_j \)_(i l)$ converge to a limit $c_(i l)$, for $l lt.eq
  i$. From $T_j arrow.r 0$ and (5.7),

#[#set math.equation(numbering: n => "(5.11)")
 $ c_(i l) = 0 quad upright("whenever ") k_l > k_i . $ <comp:gap-suppression>]

Define

$ a_i = sum_(l lt.eq i) c_(i l) phi_l . $

The sum is finite, and (5.6) implies

#[#set math.equation(numbering: n => "(5.12)")
 $ \( A_j \)_(i \, dot.op) arrow.r a_i quad upright("in ") H^1 \( bb(R) \; bb(R)^m \) quad
   upright("for every fixed ") i . $ <comp:row-convergence>]

The ordering of the eigenvalues and (5.11) show that only eigenfunctions with eigenvalue $- k_i^2$ occur in $a_i$.
  This proves (5.2), including the possibility $a_i = 0$. The eigenfunction equations hold distributionally by
  testing the form equations against smooth compactly supported functions;
  the potential is locally integrable and the rows are locally bounded.

Choose the continuous, locally absolutely continuous representatives of these rows.
  The Sobolev embedding $H^1 \( bb(R) \) subset C_b \( bb(R) \)$ shows that (5.12) also gives pointwise
  convergence at every $x$. Passing to a further subsequence,
  we may arrange that the integrals of the nonnegative integrand in (5.9) are summable, and that,
  for every fixed $i$, the squared $L^2$ errors of the derivatives in (5.12) are summable.
  A diagonal choice achieves both conditions, by making the first $j$ available derivative errors and the integral
  error less than $2^(- j)$ along the chosen subsequence. Consequently, on a common set of full measure,

#[#set math.equation(numbering: n => "(5.13)")
 $ Y \( W \, Z_j \) arrow.r 0 \, wide parallel A'_j - B_j A_j parallel_(upright("HS")) arrow.r 0 \, wide
   Phi_(K_j) \( A_j \, B_j \) arrow.r 0 \,\
\( A'_j \)_(i \, dot.op) \( x \) arrow.r a'_i \( x \) quad
  upright("for every ") i in cal(I) . $ <comp:pointwise-errors>]

We also exclude the null set where $W$ is not a finite positive semidefinite matrix.
  It remains to show that convergence of the individual rows is strong enough to pass to the products in these
  relations.

=== 5.3 Tail control in the row-index space <comp:tails>

Pad $A_j$, $B_j$, and $K_j$ with zeros in the unused coordinates of $cal(H)$.
  Thus $A_j : bb(R)^m arrow.r cal(H)$, and $B_j \, K_j$ are self-adjoint finite-rank operators on $cal(H)$.
  Since the omitted $k_i$ tend to zero,

#[#set math.equation(numbering: n => "(5.14)")
 $ parallel K_j^2 - Lambda^2 parallel_("op") lt.eq max { xi_j \, sup_(i > n_j) k_i^2 } arrow.r 0 \,
   $ <comp:diagonal-limit>]

where a supremum over no indices is zero.

Fix a point $x$ in the full-measure set from (5.13) and suppress $x$ for the moment. Write $rho_j = A_j A_j^T$.
  The definition of $Phi$ and its convergence to zero give

#[#set math.equation(numbering: n => "(5.15)")
 $ parallel \[ B_j \, K_j^2 \] parallel_("op") arrow.r 0 \, wide e_j := parallel K_j^2 - B_j^2 -
   rho_j^r parallel_("op") arrow.r 0 . $ <comp:pointwise-algebra-error>]

For $h gt.eq 1$, let $P_h$ be the orthogonal projection onto the first $h$ coordinates of $cal(H)$,
  with all coordinates included if $h$ exceeds $\| cal(I) \|$.
  Set $Q_h = I - P_h$ and $s_h = sup_(i > h) k_i^2$, again with the empty supremum equal to zero.
  Then $s_h arrow.r 0$. For every unit vector $v$ in the range of $Q_h$,

#[#set math.equation(numbering: n => "(5.16)")
 $ parallel B_j v parallel^2 + chevron.l v \, rho_j^r v chevron.r lt.eq s_h + e_j . $ <comp:tail-quadratic>]

Both terms on the left are nonnegative. Jensen’s inequality for the spectral measure of $rho_j$, using $r > 1$, implies

$ chevron.l v \, rho_j v chevron.r^r lt.eq chevron.l v \, rho_j^r v chevron.r . $

It follows that $parallel Q_h rho_j Q_h parallel_("op") lt.eq \( s_h + e_j \)^(1 \/ r)$.
  Although $cal(H)$ may be infinite dimensional, $Q_h rho_j Q_h$ has rank at most $m$,
  because $A_j$ has exactly $m$ columns. Its trace is therefore at most $m$ times its operator norm.
  We obtain the two tail bounds

#[#set math.equation(numbering: n => "(5.17)")
 $ #box(stroke: black, inset: 3pt, [$ quad parallel Q_h A_j parallel_(upright("HS"))^2 lt.eq
   m \( s_h + e_j \)^(1 \/ r) \, wide parallel B_j Q_h parallel_("op") lt.eq \( s_h + e_j \)^(1 \/ 2) . quad
   $]) $ <comp:tail-bounds>]

The first estimate converts decay of the eigenvalue parameters into decay of the total mass of all omitted rows.
  Its factor is the fixed physical dimension $m$, rather than the number of retained eigenfunctions;
  Figure 1 depicts this distinction.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  rect((0, 2.05), (2.7, 3.65), fill: rgb("#f2f2f2"), stroke: none)
  rect((0, 0), (2.7, 2.05), fill: rgb("#ededff"), stroke: none)
  rect((0, 0), (2.7, 3.65), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0, 2.05), (2.7, 2.05), stroke: (thickness: 0.8pt, miter-limit: 10))
  line((0, 4.05), (2.7, 4.05), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((1.35, 4.05), [#text(size: 9pt)[$m$ columns, fixed]], anchor: "south", padding: 0.1176cm)
  content((1.35, 2.83), [#text(size: 9pt)[$P_"hA"_j$]])
  content((1.35, 1.28), [#text(size: 9pt)[$Q_"hA"_j$]])
  content((1.35, 0.55), [#text(size: 9pt)[$dots.v$]])
  content((-0.2, 2.83), [#text(size: 9pt)[first $h$#linebreak()rows]], anchor: "east", padding: 0.1176cm)
  content((-0.2, 1.08), [#text(size: 9pt)[all remaining#linebreak()rows]], anchor: "east", padding: 0.1176cm)
  line((2.9, 2.83), (3.6, 2.83), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((3.75, 2.83), [#text(size: 9pt)[Finite-dimensional convergence#linebreak()for each fixed $h$]], anchor: "west", padding: 0.1176cm)
  line((2.9, 1.08), (3.6, 1.08), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((3.75, 1.08), [#text(size: 9pt)[$"rank" (Q_"hA"_j) lt.eq m$#linebreak() $\|Q_"hA"_j\|_( upright("HS") )^2 lt.eq m(s_h+e_j)^(1"/"r)$]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: The number of rows can grow with the number of negative eigenfunctions, but the number of physical channels remains $m$. After fixing the first $h$ rows, the identity $K_j^2 approx B_j^2 + \( A_j A_j^T \)^r$ bounds the operator norm in the remaining rows. The rank bound converts it into a Hilbert–Schmidt bound, which tends to zero as first $j arrow.r oo$ and then $h arrow.r oo$. The drawing is schematic; all matrices are padded by zero rows in $cal(H)$. ],
) <comp:tail-figure>

For each fixed $h$, the first $h$ rows of $A_j$ converge by (5.12).
  The first bound in (5.17) makes the remaining rows uniformly small by choosing $h$ large and then $j$
  sufficiently large. Thus $A_j$ is Cauchy in Hilbert–Schmidt norm and converges to an operator $A :
  bb(R)^m arrow.r cal(H)$ whose rows are precisely $a_i \( x \)$:

#[#set math.equation(numbering: n => "(5.18)")
 $ A_j arrow.r A quad upright("in Hilbert–Schmidt norm.") $ <comp:HS-limit>]

This argument applies to the whole subsequence already selected and does not require a further choice depending on $x$.

For $B_j$ we need only pointwise compactness. Its finite compressions $P_h B_j
  P_h$ are bounded in finite-dimensional spaces, so a diagonal subsequence makes them converge for every $h$.
  Self-adjointness and the second estimate in (5.17) give

$ parallel B_j - P_h B_j P_h parallel_("op") lt.eq 2 parallel B_j Q_h parallel_("op") lt.eq
  2 \( s_h + e_j \)^(1 \/ 2) . $

The chosen subsequence consequently converges in operator norm to a self-adjoint $B$ with $parallel B
  parallel_("op") lt.eq kappa$. This subsequence, and hence $B$, may depend on the point $x$.

We can now pass to all the required products. Hilbert–Schmidt convergence of $A_j$ implies operator norm
  convergence of $A_j A_j^T$ and of $A_j^T A_j$. Continuous functional calculus for nonnegative operators then
  gives convergence of their $r$th powers. Together with (5.14) and (5.15), this proves

$ \[ B \, Lambda^2 \] = 0 \, wide Lambda^2 - B^2 = \( A A^T \)^r . $

Also $B_j A_j arrow.r B A$ in Hilbert–Schmidt norm. Taking its $i$th row and using both the derivative convergence
  and the first-order error in (5.13) gives $a'_i \( x \) = \( B A \)_(i \, dot.op)$ for every $i$.
  Finally, continuity of the finite-dimensional Young deficit and $Y \( W \, A_j^T A_j \) arrow.r
  0$ yield $Y \( W \, A^T A \) = 0$. Lemma 3 gives $W = q \( A^T A \)^r$.

We have proved these statements at every point of one common set of full measure.
  The construction selects no function $x mapsto B \( x \)$:
  only the existence of a suitable operator at each such point enters the next section.
  This completes the proof of Proposition 7.

== 6 Fixed channels and the equality profiles <rig:section>

The pointwise relations of Proposition 7 still involve an auxiliary operator $B$ that may depend on the point
  without a prescribed measurable choice. We now extract constant subspaces from those relations.
  On each nonzero subspace, $B$ becomes a uniquely determined matrix and satisfies an ordinary differential
  equation. This will identify every real equality potential;
  realification and a scalar calculation will then complete the proof of Theorem 1.

=== 6.1 The channel subspaces are constant <the-channel-subspaces-are-constant>

Assume first that $W$ is real and is a nonzero equality potential.
  Use the rows $a_i$, numbers $k_i$, and operator $Lambda = "diag" \( k_i \)$ from Proposition 7.
  For each distinct value $alpha > 0$ in the list $\( k_i \)$, let $n_alpha$ be its finite multiplicity,
  and let $G_alpha$ be the $n_alpha times m$ matrix whose rows are the $a_i$ with $k_i = alpha$.
  Each $G_alpha$ has entries in $H^1 \( bb(R) \)$, and we use their continuous representatives.

At every point in the common full-measure set of that proposition, choose one of the operators $B$ it supplies.
  Since $B$ commutes with $Lambda^2$, it preserves each of its eigenspaces. Moreover,

$ A A^T = \( Lambda^2 - B^2 \)^(1 \/ r) $

commutes with both $B$ and $Lambda^2$. Writing $B_alpha$ for the block on the $alpha^2$-eigenspace therefore gives

#[#set math.equation(numbering: n => "(6.1)")
 $ G_alpha G_beta^T & = 0 &  & \( alpha eq.not beta \) \,\
G'_alpha & = B_alpha G_alpha \, & \[ B_alpha \, G_alpha G_alpha^T \] & = 0 \,\
alpha^2 I - B_alpha^2 & = \( G_alpha G_alpha^T \)^r \, & parallel B_alpha parallel_("op") & lt.eq
  kappa . $ <rig:orthogonal-blocks>]

These statements hold almost everywhere and require no compatibility between the choices of $B$ at different points.

#thm([Lemma 6.1.])[
  #emph[For every $alpha$, the subspace
$ cal(R)_alpha = \( ker G_alpha \( x \) \)^perp subset bb(R)^m $

 is independent of $x in bb(R)$. The nonzero spaces $cal(R)_alpha$ are mutually orthogonal, and
#[#set math.equation(numbering: n => "(6.2)")
 $ sum_alpha dim cal(R)_alpha lt.eq m . $ <rig:dimension-bound>]

 In particular, only finitely many $G_alpha$ are nonzero. The potential $W$ has a continuous representative,
   equal to zero on the orthogonal complement of these spaces and equal to $q \( G_alpha^T G_alpha \)^r$ on
   $cal(R)_alpha$. With this representative, every $G_alpha$ is $C^2$.]
] <rig:fixed-right-spaces>

#proof[
  Fix $v in bb(R)^m$. Equation (6.1) implies
  $ parallel \( G_alpha v \)' \( x \) parallel lt.eq kappa parallel G_alpha \( x \) v parallel quad
    upright("for almost every ") x . $
  The function $G_alpha v$ is locally absolutely continuous.
    If it vanishes at $x_0$, integration and Gronwall’s inequality,
    first to the right and then to the left of $x_0$, show that it vanishes everywhere.
    Consequently $ker G_alpha \( x \)$ is independent of $x$,
    including points outside the original full-measure set. This proves the first assertion.
  The products in (6.1) are continuous, so their almost-everywhere vanishing implies their vanishing everywhere.
    Thus the constant row spaces $cal(R)_alpha$ are mutually orthogonal.
    Any finite collection has total dimension at most $m$, proving (6.2) and finiteness of the nonzero blocks.
  On the full-measure set from Proposition 7, $A^T A = sum_alpha G_alpha^T G_alpha$.
    Each summand acts on its own orthogonal space $cal(R)_alpha$, and only finitely many summands are nonzero.
    Equation (5.4) therefore yields
  #[#set math.equation(numbering: n => "(6.3)")
   $ W = q sum_alpha \( G_alpha^T G_alpha \)^r quad upright("almost everywhere") . $ <rig:continuous-potential>]
  The right-hand side is continuous and has the asserted restrictions;
    we henceforth use it as the representative of $W$. The row eigenfunction equation (5.2) now reads
  #[#set math.equation(numbering: n => "(6.4)")
   $ G''_alpha = alpha^2 G_alpha - G_alpha W quad upright("in distributions") . $ <rig:block-second-order>]
  Its right-hand side is continuous. Integrating this identity twice shows that the continuous representative of
    $G_alpha$ is $C^2$. ◻
]

The row spaces already split the physical space $bb(R)^m$ into finitely many constant channels.
  To determine the potential within one of them, we also need a constant range for $G_alpha$ in the eigenfunction
  index space $bb(R)^(n_alpha)$.

#thm([Lemma 6.2.])[
  #emph[For each $alpha$ with $ell := dim cal(R)_alpha > 0$,
    the range of $G_alpha \( x \)$ in $bb(R)^(n_alpha)$ is independent of $x$.
    In constant orthonormal bases of this range and of $cal(R)_alpha$,
    the restriction of $G_alpha$ is an invertible $C^2$ matrix $D : bb(R) arrow.r bb(R)^(ell times ell)$.
    The matrix $B_0 = D' D^(- 1)$ is $C^1$ and satisfies, everywhere on $bb(R)$,
#[#set math.equation(numbering: n => "(6.5)")
 $ B_0 = B_0^T \, wide alpha^2 I - B_0^2 = \( D D^T \)^r > 0 \, wide B'_0 =
   r \( B_0^2 - alpha^2 I \) . $ <rig:active-identities>]

]
] <rig:fixed-left-spaces>

#proof[
  Choose a constant orthonormal basis of $cal(R)_alpha$, and let $E \( x \)$ be the matrix of the restriction of
    $G_alpha \( x \)$ to this space. It has full column rank $ell$ at every point,
    since the kernel of $G_alpha$ is constant. The projection onto its range is
  $ P \( x \) = E \( x \) \( E \( x \)^T E \( x \) \)^(- 1) E \( x \)^T . $
  The commutator in (6.1) shows that $B_alpha$ preserves the range of $G_alpha G_alpha^T$,
    which is precisely the range of $E$. Hence $E' = B_alpha E$ has its columns in this range almost everywhere.
    Differentiating the projection gives
  $ P' =  & \( I - P \) E' \( E^T E \)^(- 1) E^T\
 & + E \( E^T E \)^(- 1) \( E' \)^T \( I - P \) = 0 quad upright("almost everywhere") . $
  Since $P$ is $C^1$, it is constant.
  Choose a constant orthonormal basis of this range as well.
    The resulting square matrix $D$ is invertible everywhere and $C^2$.
    Almost everywhere, $D' D^(- 1)$ is the restriction of $B_alpha$ to its invariant range in these coordinates.
    Equations (6.1) and (6.1) give the symmetry and square identity in (6.5) almost everywhere;
    continuity extends them to every point. Positivity is strict because $D$ is invertible.
  On $cal(R)_alpha$, Equation (6.3) identifies the potential with $q \( D^T D \)^r$.
    Equation  (6.4) consequently becomes
  $ D'' = alpha^2 D - q D \( D^T D \)^r = alpha^2 D - q \( D D^T \)^r D . $
  The second equality follows, for example, by a singular-value decomposition.
    Differentiating $B_0 = D' D^(- 1)$ and using $q = r + 1$ now gives
  $ B'_0 = D'' D^(- 1) - B_0^2 = alpha^2 I - q \( alpha^2 I - B_0^2 \) - B_0^2 = r \( B_0^2 - alpha^2 I \) \, $
  as claimed. ◻
]

=== 6.2 The matrix Riccati equation separates the profiles <the-matrix-riccati-equation-separates-the-profiles>

Fix a nonzero block and the matrices of Lemma 9. Diagonalize the symmetric matrix $B_0 \( x_(*) \)$ at one point
  by a constant orthogonal change of range coordinates. The right-hand side of its Riccati equation is a
  polynomial in $B_0$. Uniqueness for this matrix ordinary differential equation therefore preserves the diagonal
  form. More explicitly, the strict inequality in (6.5) places each initial diagonal entry in
  $\( - alpha \, alpha \)$. There is a unique $y_j in bb(R)$ such that the scalar solution with that initial value is

#[#set math.equation(numbering: n => "(6.6)")
 $ b_j \( x \) = - alpha tanh #scale(x: 120%, y: 120%)[\(] r alpha \( x - y_j \) #scale(x: 120%, y: 120%)[\)] \,
   wide 1 lt.eq j lt.eq ell . $ <rig:tanh>]

The diagonal matrix with these entries solves the same initial-value problem as $B_0$ on all of $bb(R)$,
  so uniqueness gives equality everywhere.

Equation (6.5) implies that $D D^T$ is diagonal in these coordinates.
  Since $D' = "diag" \( b_j \) D$, each row of $D$ is a positive scalar multiple of its value at $x_(*)$.
  None of these rows is zero, and their directions are mutually orthogonal because $D D^T$ is diagonal.
  Taking their normalized directions as a constant orthonormal basis of $cal(R)_alpha$ makes $D$ diagonal with
  positive entries. The potential in this fixed basis is therefore diagonal, with entries

#[#set math.equation(numbering: n => "(6.7)")
 $ q #scale(x: 120%, y: 120%)[\(] alpha^2 - b_j \( x \)^2 #scale(x: 120%, y: 120%)[\)] = \( r + 1 \) alpha^2
   "sech"^2 #scale(x: 120%, y: 120%)[\(] r alpha \( x - y_j \) #scale(x: 120%, y: 120%)[\)] . $ <rig:profiles>]

Combining these bases over the finitely many nonzero spaces $cal(R)_alpha$,
  and adding a basis of their orthogonal complement, proves the required necessity for real $W$.
  There are at most $m$ nonzero profiles by (6.2). The zero potential has the same description with no nonzero profile.

=== 6.3 Complex Hermitian potentials <complex-hermitian-potentials>

For a complex Hermitian potential $W$, take the realification $tilde(W)$ from (4.2).
  The proof of Proposition 6 shows that it is equivalent to $W xor
  overline(W)$ by a constant unitary matrix and that both the trace-power integral and the negative spectral
  moment are doubled. Thus equality for $W$ implies equality for the real potential $tilde(W)$.

The real result provides a constant unitary matrix $V$ such that

$ W \( x \) xor overline(W) \( x \) = V "diag" \( f_1 \( x \) \, dots.h \, f_(2 m) \( x \) \) V^(*) quad
  upright("almost everywhere") \, $

where each $f_j$ is either a profile of the form (6.7) or zero.
  Let $P$ be the projection onto the first summand $bb(C)^m$ and put $hat(P) = V^(*) P V$.
  Since $P$ commutes with $W xor overline(W)$,

$ \( f_i \( x \) - f_j \( x \) \) hat(P)_(i j) = 0 quad upright("almost everywhere") . $

Consequently $hat(P)_(i j) = 0$ whenever the functions $f_i \, f_j$ are not equal almost everywhere.
  Partition the indices into groups of identical functions, including the possible zero function.
  The range of $hat(P)$ splits as the orthogonal sum of its intersections with these coordinate groups.
  On each group the diagonal potential is a scalar multiple of the identity,
  so any constant orthonormal basis of that intersection diagonalizes its restriction.
  Transporting these bases by $V$ to the first summand gives a constant unitary basis of $bb(C)^m$ in which $W$
  has the asserted profiles. This proves necessity for complex Hermitian potentials.

=== 6.4 Each listed potential attains equality <each-listed-potential-attains-equality>

It remains to verify attainment, including the exact spectral moment,
  without appealing to a classification of scalar optimizers. Fix $a > 0$ and $x_0 in bb(R)$, and set

$ V \( x \) = \( r + 1 \) a^2 "sech"^2 #scale(x: 120%, y: 120%)[\(] r a \( x - x_0 \)
  #scale(x: 120%, y: 120%)[\)] \, wide H = - partial_x^2 - V . $

The first-order factorization used in the commutation argument of [2] Section II also explains why this profile
  has only one negative eigenvalue. Put

$ w \( x \) = a tanh #scale(x: 120%, y: 120%)[\(] r a \( x - x_0 \) #scale(x: 120%, y: 120%)[\)] \, wide Q =
  partial_x + w \, wide "Dom" Q = H^1 \( bb(R) \) . $

Then $Q^(*) = - partial_x + w$ on $H^1 \( bb(R) \)$. Since $w$ and $w'$ are bounded,
  both product domains are $H^2 \( bb(R) \)$, and direct differentiation yields

#[#set math.equation(numbering: n => "(6.8)")
 $ Q^(*) Q & = H + a^2 \,\
Q Q^(*) & = - partial_x^2 + a^2 + \( r - 1 \) a^2 "sech"^2 #scale(x: 120%, y: 120%)[\(] r a \( x - x_0 \)
  #scale(x: 120%, y: 120%)[\)] gt.eq a^2 . $ <rig:factorization>]

Here the last inequality uses $r > 1$. The equation $Q psi = 0$ has the one-dimensional $L^2$ solution space

$ ker Q = "span" {"sech"^(1 \/ r) #scale(x: 120%, y: 120%)[\(] r a \( x - x_0 \) #scale(x: 120%, y: 120%)[\)]} . $

Thus $- a^2$ is a simple eigenvalue of $H$, and (6.8) excludes eigenvalues below it.
  If $H phi.alt = lambda phi.alt$ with $- a^2 < lambda < 0$, put $mu = lambda + a^2$ and $g = Q phi.alt$.
  Then $parallel g parallel_2^2 = mu parallel phi.alt parallel_2^2 > 0$.
  Moreover, $Q^(*) Q phi.alt = mu phi.alt in "Dom" Q$, so $g in "Dom" \( Q Q^(*) \)$ and $Q Q^(*) g = mu g$.
  This contradicts (6.8), since $mu < a^2$. By Lemma 2, all negative spectrum is discrete.
  Hence $- a^2$ is the sole negative eigenvalue.

Finally, $2 p - 1 = 2 gamma$ and the substitution $s = tanh y$ give

$ integral_(bb(R)) V \( x \)^p thin d x & = frac(\( r + 1 \)^p, r) a^(2 gamma) integral_(bb(R)) "sech"^(2 p) y thin d y\
 & = frac(\( r + 1 \)^p, r) a^(2 gamma) integral_(- 1)^1 \( 1 - s^2 \)^(p - 1) thin d s = b_sigma /
   D_sigma a^(2 gamma) \, $

where $\( r + 1 \)^p \/ r = D_sigma^(- 1)$ and $p - 1 = sigma$. Consequently

$ "Tr" \( H \)_(-)^gamma = a^(2 gamma) = C_gamma integral_(bb(R)) V^p . $

The zero potential contributes zero to both sides. Finite orthogonal direct sums add the spectral moments and
  trace-power integrals, and a constant unitary conjugation leaves both unchanged.
  Every potential listed in Theorem 1 therefore attains equality, completing its proof.

== 7 The exact integrated trace deficit <app:trace>

The matrix comparison needed in the action argument has an exact remainder.
  We give the proof from [11] Section 3, retaining both nonnegative terms.
  Together they control the commutator and the algebraic equality relation used in the action argument.
  Throughout this appendix, $0 < sigma < 1$, $beta = sigma - 1 / 2$, and $r = 1 \/ sigma$, $p = 1 + sigma$, $q =
  1 + r$. Define $c_sigma > 0$ by

#[#set math.equation(numbering: n => "(7.1)")
 $ c_sigma^(- 1) = integral_0^oo t^beta #scale(x: 120%, y: 120%)[\(] t^(- 1 \/ 2) - \( t + 1 \)^(- 1 \/ 2)
   #scale(x: 120%, y: 120%)[\)] thin d t . $ <trace:normalization>]

The integrand is $O \( t^(sigma - 1) \)$ at zero and $O \( t^(sigma - 2) \)$ at infinity. Scaling therefore gives

#[#set math.equation(numbering: n => "(7.2)")
 $ c_sigma integral_0^oo t^beta #scale(x: 120%, y: 120%)[\(] t^(- 1 \/ 2) - \( t + y \)^(- 1 \/ 2)
   #scale(x: 120%, y: 120%)[\)] thin d t = y^sigma \, wide y gt.eq 0 . $ <trace:scaling>]

#thm([Theorem 7.1.])[
  (Exact trace deficit).  #emph[Let $n gt.eq 1$ and let $B \, V in bb(C)^(n times n)$ be Hermitian. Suppose that
#[#set math.equation(numbering: n => "(7.3)")
 $ Y_s = \( s I - B \)^2 \, wide X_s = Y_s + V gt.eq b I quad \( s in bb(R) \) $ <trace:symbol>]

 for some $b > 0$. Set
#[#set math.equation(numbering: n => "(7.4)")
 $ R \( t \) = 1 / pi integral_(bb(R)) \( X_s + t I \)^(- 1) thin d s \, wide P \( t \) = t^(- 1 \/ 2) I -
   R \( t \) \, wide t > 0 \, $ <trace:resolvents>]

 and
#[#set math.equation(numbering: n => "(7.5)")
 $ N = c_sigma integral_0^oo t^beta P \( t \) thin d t . $ <trace:N>]

 These integrals converge absolutely in matrix norm, and $R \( t \) > 0$.
   There are continuous Hermitian matrices $L \( t \) = R \( t \)^(- 1) > 0$ and $Z \( t \)$ satisfying
#[#set math.equation(numbering: n => "(7.6)")
 $ V + t I = L^2 + Z^2 + i \[ B \, Z \] \, wide L Z + Z L + i \[ B \, L \] = 0 . $ <trace:LZ>]

 If $N gt.eq 0$, then
#[#set math.equation(numbering: n => "(7.7)")
 $ "tr" \( N V \) - "tr" \( N^q \) = c_sigma integral_0^oo t^beta #scale(x: 180%, y: 180%)[\(] "tr" \( R Z^2 \) +
   q parallel R^(- 1 \/ 2) - R^(1 \/ 2) \( t I + N^r \)^(1 \/ 2)
   #scale(x: 120%, y: 120%)[parallel]_(upright("HS"))^2 #scale(x: 180%, y: 180%)[\)] thin d t .
   $ <trace:deficit-identity>]

 In particular, $"tr" \( N V \) gt.eq "tr" \( N^q \)$.]
] <trace:deficit>

The hypothesis concerns the full symbol $X_s$; the perturbation $V$ itself need not be positive.
  The proof first recovers $L$ and $Z$ from solutions on the two half-lines,
  then evaluates a logarithmic integral, and finally completes a matrix square.

=== 7.1 Half-line boundary maps <half-line-boundary-maps>

Quadratic growth in $s$, together with (7.3), gives an integrable bound for $X_s^(- 1)$.
  Hence $R \( t \) > 0$ and $R \( t \) = O \( 1 \)$ as $t arrow.b 0$. Diagonalization of $B$ gives

$ 1 / pi integral_(bb(R)) \( Y_s + t I \)^(- 1) thin d s = t^(- 1 \/ 2) I . $

For $t gt.eq 1$, both $X_s + t I$ and $Y_s + t I$ dominate $c \( s^2 + t \) I$, with $c > 0$ independent of $s \,
  t$. The resolvent identity bounds their inverse difference by $C \( s^2 + t \)^(- 2)$, and therefore

#[#set math.equation(numbering: n => "(7.8)")
 $ parallel P \( t \) parallel_("op") =
   cases(delim: "{", O \( t^(- 1 \/ 2) \) \, & t arrow.b 0 \,, O \( t^(- 3 \/ 2) \) \, & t arrow.r oo .)
   $ <trace:P-bounds>]

These bounds prove the asserted convergence of $N$.

Fix $t > 0$ and put $nabla = partial_x - i B$. We shall use the equation

#[#set math.equation(numbering: n => "(7.9)")
 $ \( - nabla^2 + V + t I \) psi = 0 . $ <trace:ode>]

Matrix Riccati equations also appear in the commutation method for Schrödinger inequalities [2].
  Here their role is to compute the integrated resolvent through boundary data.

For each $v in bb(C)^n$ there is a unique $H^1$ solution of (7.9) on either half-line with $psi \( 0 \) = v$.
  Indeed, the sesquilinear form

$ a_t \( phi.alt \, psi \) = integral #scale(x: 120%, y: 120%)[\(] chevron.l nabla phi.alt \,
  nabla psi chevron.r + chevron.l phi.alt \, \( V + t I \) psi chevron.r #scale(x: 120%, y: 120%)[\)] thin d x \, $

with inner products linear in the second variable, is coercive on $H^1 \( bb(R) \; bb(C)^n \)$:
  its Fourier symbol $X_s + t I$ dominates $c_t \( 1 + s^2 \) I$.
  Zero extension gives coercivity on the trace-zero subspace of either half-line.
  Correcting any $H^1$ extension of $v$ by the Riesz representation theorem gives the unique weak solution.
  The equation implies $psi'' in L^2$, so this solution lies in $H^2$; both $psi$ and $psi'$ vanish at the infinite end.

Define the right and left boundary matrices $S \, T$ by

#[#set math.equation(numbering: n => "(7.10)")
 $ nabla psi \( 0 + \) = - S v \, wide nabla psi \( 0 - \) = T v . $ <trace:boundary>]

Integration by parts gives $a_t \( psi_v \, psi_w \) = chevron.l v \,
  S w chevron.r$ on the right and $a_t \( psi_v \, psi_w \) = chevron.l v \, T w chevron.r$ on the left.
  Thus $S \, T$ are Hermitian. Translation and uniqueness show that $nabla psi = -
  S psi$ throughout the right half-line and $nabla psi = T psi$ throughout the left half-line.
  Substituting these relations into (7.9), and allowing arbitrary boundary data, gives

#[#set math.equation(numbering: n => "(7.11)")
 $ V + t I = S^2 + i \[ B \, S \] = T^2 - i \[ B \, T \] . $ <trace:riccati>]

Glue the two solutions with boundary value $v$ at zero. The resulting continuous function has derivative jump
  $- \( S + T \) v$, and hence satisfies

$ \( - nabla^2 + V + t I \) psi = delta_0 \( S + T \) v . $

Fourier inversion, with forward kernel $e^(- i s x)$, gives

$ v = frac(1, 2 pi) integral_(bb(R)) \( X_s + t I \)^(- 1) thin d s thin \( S + T \) v = 1 /
  2 R \( t \) \( S + T \) v . $

The inverse symbol is $O \( s^(- 2) \)$, so its Fourier inverse is continuous and this evaluation at zero is
  justified. Therefore

$ L := 1 / 2 \( S + T \) = R^(- 1) > 0 \, wide Z := 1 / 2 \( S - T \) $

satisfy (7.6), by adding and subtracting (7.11). The second equation in (7.6) determines $Z$ uniquely from $L$,
  since $L > 0$; in an eigenbasis of $L$, the map $Z mapsto L Z +
  Z L$ multiplies its $\( j \, k \)$ entry by the positive number $L_(j j) + L_(k k)$.
  This also proves the continuity of $Z \( t \)$, because $R \( t \)$, and hence $L \( t \)$, is continuous.

The diagonal entries of that same equation give $Z_(j j) = 0$ in an eigenbasis of $L$, so $"tr" Z = 0$.
  Multiplication on both sides by $R = L^(- 1)$ gives $i \[ R \, B \] = - \( Z R + R Z \)$.
  Cyclicity of the trace now yields

#[#set math.equation(numbering: n => "(7.12)")
 $ "tr" #scale(x: 120%, y: 120%)[\(] R \( V + t I \) #scale(x: 120%, y: 120%)[\)] = "tr" L -
   "tr" \( R Z^2 \) . $ <trace:RV>]

In particular, the correction $"tr" \( R Z^2 \) = "tr" \( Z R Z \)$ is nonnegative.
  We will also need the location of the spectrum of $B + i S$.
  The right solutions obey $psi' = i \( B + i S \) psi$. For an eigenvector with eigenvalue $z$,
  the solution is $e^(i z x) v$; its square integrability forces $"Im" z > 0$.

=== 7.2 A logarithmic integral <a-logarithmic-integral>

The next step converts the boundary matrices into a scalar identity that can be integrated in $t$. Define

#[#set math.equation(numbering: n => "(7.13)")
 $ F \( t \) = frac("tr" V, sqrt(t)) - 1 / pi integral_(bb(R)) log frac(det \( X_s + t I \), det \( Y_s + t I \))
   thin d s . $ <trace:F>]

The determinants are positive, and the logarithmic ratio is $O \( \| s \|^(- 2) \)$ at infinity.
  Its derivative in $t$ is the trace of the resolvent difference,
  with an integrable bound locally uniform for $t > 0$. Thus the integral converges absolutely and $F$ is
  continuously differentiable.

The first identity in (7.11) factors the symbol as

$ X_s + t I = \( s I - B + i S \) \( s I - B - i S \) . $

If $u_j + i v_j$ are the eigenvalues of $B + i S$, counted with algebraic multiplicity, then $v_j > 0$ and

$ det \( X_s + t I \) = product_(j = 1)^n #scale(x: 120%, y: 120%)[\(] \( s - u_j \)^2 +
  v_j^2 #scale(x: 120%, y: 120%)[\)] . $

The denominator in (7.13) has the same form, with centers the eigenvalues of $B$ and widths $sqrt(t)$.
  Translations of the individual logarithms change their symmetric-cutoff integrals by $o \( 1 \)$:
  for $h \( s \) = log \( s^2 + v^2 \)$,

$ frac(d, d a) integral_(- M)^M h \( s - a \) thin d s = h \( M + a \) - h \( M - a \) arrow.r 0 $

uniformly for bounded $a$. After centering the factors, the identity

$ integral_(bb(R)) log frac(s^2 + v^2, s^2 + w^2) thin d s = 2 pi \( v - w \) \, wide v \, w > 0 \, $

follows by differentiation in $v$ and integration from $w$ to $v$. Since $sum_j v_j = "tr" S = "tr" L$, we obtain

#[#set math.equation(numbering: n => "(7.14)")
 $ F \( t \) = frac("tr" V, sqrt(t)) - 2 "tr" \( L - sqrt(t) I \) . $ <trace:F-evaluation>]

Set

#[#set math.equation(numbering: n => "(7.15)")
 $ G \( t \) = "tr" \( L - 2 sqrt(t) I + t R \) . $ <trace:G>]

Both functions are nonnegative. For $G$, apply $lambda - 2 sqrt(t) + t \/ lambda gt.eq
  0$ to the positive eigenvalues $lambda$ of $L$. For $F$, take the trace of (7.6) and use (7.14) to obtain

$ F \( t \) = t^(- 1 \/ 2) "tr" #scale(x: 120%, y: 120%)[\(] \( L - sqrt(t) I \)^2 +
  Z^2 #scale(x: 120%, y: 120%)[\)] gt.eq 0 . $

Equations (7.12) and (7.14) give the identity

#[#set math.equation(numbering: n => "(7.16)")
 $ "tr" \( P V \) = F + G + "tr" \( R Z^2 \) . $ <trace:FG>]

Every term on the right is nonnegative. The bounds (7.8) therefore show that $F$, $G$,
  and $"tr" \( R Z^2 \)$ are integrable against $t^beta thin d t$,
  and that $t^(beta + 1) F \( t \)$ vanishes at both endpoints.

Differentiating (7.13) and using (7.14)–(7.15) gives

$ F' \( t \) = - frac("tr" V, 2 t^(3 \/ 2)) + "tr" P \( t \) \, wide t F' \( t \) = - 1 / 2 F \( t \) - G \( t \) . $

Integration by parts, with the endpoint limits just proved, yields $integral_0^oo t^beta G thin d t =
  sigma integral_0^oo t^beta F thin d t$. Consequently, integration of (7.16) gives

#[#set math.equation(numbering: n => "(7.17)")
 $ "tr" \( N V \) = q c_sigma integral_0^oo t^beta G \( t \) thin d t +
   c_sigma integral_0^oo t^beta "tr" \( R Z^2 \) thin d t . $ <trace:weighted>]

It remains to express the first integral as $"tr" \( N^q \) \/ q$ plus a nonnegative remainder.

=== 7.3 The noncommutative square <the-noncommutative-square>

For a positive semidefinite matrix $D$, let

$ F_0 \( t \, D \) = frac("tr" D, sqrt(t)) - 2 "tr" #scale(x: 120%, y: 120%)[\(] \( t I + D \)^(1 \/ 2) -
  sqrt(t) I #scale(x: 120%, y: 120%)[\)] . $

For a scalar eigenvalue $d gt.eq 0$, the corresponding summand is
  $integral_0^d \( t^(- 1 \/ 2) - \( t + y \)^(- 1 \/ 2) \) thin d y$. Tonelli’s theorem and (7.2) therefore imply

#[#set math.equation(numbering: n => "(7.18)")
 $ c_sigma integral_0^oo t^beta F_0 \( t \, D \) thin d t = 1 / p "tr" \( D^p \) . $ <trace:F0>]

Now expand the Hilbert–Schmidt square

#[#set math.equation(numbering: n => "(7.19)")
 $ cal(D)_D \( t \) & := parallel R^(- 1 \/ 2) - R^(1 \/ 2) \( t I + D \)^(1 \/ 2)
   #scale(x: 120%, y: 120%)[parallel]_(upright("HS"))^2\
 & = "tr" #scale(x: 120%, y: 120%)[\(] R^(- 1) + R \( t I + D \) -
   2 \( t I + D \)^(1 \/ 2) #scale(x: 120%, y: 120%)[\)]\
 & = G \( t \) - "tr" \( P \( t \) D \) + F_0 \( t \, D \) . $ <trace:square>]

No commutation is used: the cross terms cancel adjacent factors $R^(- 1 \/ 2) R^(1 \/ 2)$,
  and cyclicity changes the remaining quadratic term into $"tr" \( R \( t I + D \) \)$.
  All three terms in the last line are integrable by (7.8), (7.16), and (7.18). Thus

#[#set math.equation(numbering: n => "(7.20)")
 $ c_sigma integral_0^oo t^beta G \( t \) thin d t = "tr" \( N D \) - 1 / p "tr" \( D^p \) +
   c_sigma integral_0^oo t^beta cal(D)_D \( t \) thin d t . $ <trace:duality>]

When $N gt.eq 0$, choose $D = N^r$. Since $r p = q = 1 + r$,
  the first two terms on the right equal $"tr" \( N^q \) \/ q$.
  Substitution into (7.17) proves (7.7) and completes the proof of Theorem 10.

If $B$ and $V$ commute, the symbol hypothesis implies $V gt.eq b I$.
  Simultaneous diagonalization then gives $R \( t \) = \( t I + V \)^(- 1 \/ 2)$, $N = V^sigma$, and $Z = 0$.
  Both remainders vanish, as required by scalar equality.

== 8 The regularized field and connecting paths <app:paths>

The finite-interval action argument requires a symmetric matrix path from $K$ to $-
  K$ whose derivative measures the difference between a matrix field and $A A^(sans(T))$.
  We construct both the field and the path here. These are the constructions of [11] Sections 4–5;
  we include their proofs to make the analytic input to the equality argument self-contained.
  The positivity statement below also identifies the resolvent to which Theorem 10 applies.

Throughout this appendix, $K = "diag" \( k_1 \, dots.h \, k_n \)$ with $k_i > 0$, $kappa = max_i k_i$,
  and $"Sym"_n$ denotes the real symmetric matrices. We use $beta = sigma - 1 /
  2$ and the constant $c_sigma$ from (7.1).

=== 8.1 A field with a scalar boundary integral <a-field-with-a-scalar-boundary-integral>

For $delta > 0$, define on $y gt.eq 0$

#[#set math.equation(numbering: n => "(8.1)")
 $ f_delta \( y \) = c_sigma / pi integral_0^oo t^beta (frac(1, t + delta) - frac(1, t + delta + y)) thin d t \,
   $ <field:f>]

and extend to $y < 0$ by the tangent line $f'_delta \( 0 \) y$.
  The resulting function is $C^1$, strictly increasing, and concave. Indeed, for $y gt.eq 0$,

#[#set math.equation(numbering: n => "(8.2)")
 $ f'_delta \( y \) = a_sigma \( y + delta \)^(beta - 1) \, wide a_sigma = c_sigma /
   pi integral_0^oo frac(u^beta, \( 1 + u \)^2) thin d u > 0 . $ <field:f-derivative>]

Both integrals converge since $- 1 / 2 < beta < 1 / 2$. The extension allows the functional calculus below even
  when its matrix argument has negative eigenvalues.

Set

#[#set math.equation(numbering: n => "(8.3)")
 $ Q_s \( B \) & = s^2 I - 2 s B + K^2 \,\
M_delta \( B \) & = lim_(R arrow.r oo) integral_(- R)^R #scale(x: 120%, y: 120%)[\(] f_delta \( Q_s \( B \) \) -
  f_delta \( s^2 \) I #scale(x: 120%, y: 120%)[\)] thin d s \, wide B in "Sym"_n \, $ <field:definition>]

where the symmetric cutoff cancels the leading term $- 2 s f'_delta \( s^2 \) B$, which is odd in $s$.
  The scalar counterpart is

#[#set math.equation(numbering: n => "(8.4)")
 $ mu_delta \( z \) = integral_(bb(R)) #scale(x: 120%, y: 120%)[\(] f_delta \( s^2 + z \) -
   f_delta \( s^2 \) #scale(x: 120%, y: 120%)[\)] thin d s \, wide z in bb(R) . $ <field:mu>]

#thm([Proposition 8.1.])[
  (Regularized field).  #emph[The limit in (8.3) exists locally uniformly, and $M_delta : "Sym"_n arrow.r
    "Sym"_n$ is locally Lipschitz. There is a $C^1$ function $J_delta : "Sym"_n arrow.r bb(R)$,
    normalized by $J_delta \( 0 \) = 0$, such that
#[#set math.equation(numbering: n => "(8.5)")
 $ d J_delta \( B \) \[ H \] = - "tr" \( M_delta \( B \) H \) . $ <field:primitive>]

 The scalar function $mu_delta$ is locally Lipschitz and strictly increasing, with $mu_delta \( 0 \) = 0$, and
#[#set math.equation(numbering: n => "(8.6)")
 $ mu_delta \( z \) = \( z + delta \)^sigma - delta^sigma wide \( z gt.eq 0 \) . $ <field:mu-positive>]

 For every real unit vector $e$, and for every standard basis vector $e_i$, respectively,
#[#set math.equation(numbering: n => "(8.7)")
 $ e^(sans(T)) M_delta \( B \) e & lt.eq mu_delta #scale(x: 120%, y: 120%)[\(] e^(sans(T)) K^2
   e - \( e^(sans(T)) B e \)^2 #scale(x: 120%, y: 120%)[\)] \,\
B e_i = y e_i quad & arrow.r.double quad M_delta \( B \) e_i = mu_delta \( k_i^2 - y^2 \) e_i . $ <field:direction>]

 For each diagonal sign matrix $S$,
#[#set math.equation(numbering: n => "(8.8)")
 $ M_delta \( S B S \) = S M_delta \( B \) S . $ <field:equivariance>]

 Finally,
#[#set math.equation(numbering: n => "(8.9)")
 $ J_delta \( - K \) - J_delta \( K \) & = sum_(i = 1)^n integral_(- k_i)^(k_i) mu_delta \( k_i^2 - s^2 \) thin d s\
 & arrow.r b_sigma sum_(i = 1)^n k_i^(2 sigma + 1) wide \( delta arrow.b 0 \) . $ <field:endpoints>]

]
] <field:properties>

#proof[
  We first justify the matrix integral, including its local Lipschitz dependence.
    If a scalar function $h$ is Lipschitz on an interval containing the spectra of Hermitian matrices $X \, Y$, then
  #[#set math.equation(numbering: n => "(8.10)")
   $ parallel h \( X \) - h \( Y \) parallel_(upright("HS")) lt.eq "Lip" \( h \) parallel X -
     Y parallel_(upright("HS")) . $ <field:HS-calculus>]
  To see this, use eigenbases $e_i$ of $X$ and $v_j$ of $Y$.
    The mixed matrix entries of the two differences are $\( h \( lambda_i \) - h \( nu_j \) \) chevron.l e_i \,
    v_j chevron.r$ and $\( lambda_i - nu_j \) chevron.l e_i \, v_j chevron.r$;
    square the scalar Lipschitz inequality and sum over $i \, j$.
  On a bounded set of $B$’s the spectrum of $E_s \( B \) = - 2 s B +
    K^2$ is contained in $\[ - a \| s \| \, a \| s \| \]$ for all sufficiently large $\| s \|$. For
  $ h_s \( y \) = f_delta \( s^2 + y \) - f_delta \( s^2 \) - f'_delta \( s^2 \) y \, $
  Equation (8.2) gives $sup_(\| y \| lt.eq a \| s \|) \| h'_s \( y \) \| = O \( \| s \|^(2 beta - 3) \)$.
    It follows from (8.10) that
  $ f_delta \( Q_s \( B \) \) - f_delta \( s^2 \) I = - 2 s f'_delta \( s^2 \) B + T_s \( B \) \, $
  where both $parallel T_s \( B \) parallel_(upright("HS"))$ and the local Lipschitz constant of $T_s$ are
    $O \( \| s \|^(2 beta - 2) \)$. For the first bound, include $f'_delta \( s^2 \) K^2$ in $T_s$;
    for the second, apply (8.10) to $h_s \( E_s \( B \) \)$ and use $E_s \( B_1 \) - E_s \( B_2 \) = -
    2 s \( B_1 - B_2 \)$. Because $2 beta - 2 < - 1$, these remainders are integrable at infinity.
    The odd term cancels at each symmetric cutoff. On bounded $s$-intervals, (8.10) applies directly to $f_delta$.
    This proves the asserted convergence and regularity.
  For the primitive, choose a scalar antiderivative $g'_delta = f_delta$.
    Trace differentiation gives $d "tr" \( g_delta \( X \) \) \[ H \] = "tr" \( f_delta \( X \) H \)$.
    This formula follows for polynomials by cyclicity and for $g_delta$ by approximation in $C^1$ on compact
    spectral intervals. For $s eq.not 0$, the function
  $ B mapsto frac("tr" \( g_delta \( Q_s \( B \) \) - g_delta \( K^2 \) \), 2 s) + f_delta \( s^2 \) "tr" B $
  has differential $- "tr" \( \( f_delta \( Q_s \( B \) \) - f_delta \( s^2 \) I \) H \)$.
    At $s = 0$ that differential is constant in $B$ and also has a primitive.
    Thus the negative of every finite-cutoff field has zero integral around each closed piecewise smooth curve in
    $"Sym"_n$. Local uniform convergence passes this property to $- M_delta$.
    Path integration, starting at zero, defines $J_delta$ and proves (8.5).
  For bounded $z$, the integrand in (8.4) and its Lipschitz constant in $z$ are $O \( \| s \|^(2 beta - 2) \)$ at
    infinity. This proves absolute convergence and local Lipschitz continuity of $mu_delta$.
    Strict increase and $mu_delta \( 0 \) = 0$ follow from the same properties of $f_delta$.
    For $z gt.eq 0$, Tonelli’s theorem applied to (8.1) gives
  $ mu_delta \( z \) =
    c_sigma integral_0^oo t^beta
    #scale(x: 120%, y: 120%)[\(] \( t + delta \)^(- 1 \/ 2) - \( t + delta + z \)^(- 1 \/ 2)
    #scale(x: 120%, y: 120%)[\)] thin d t . $
  The normalization (7.1), after scaling, evaluates this as (8.6).
  Translations in the variable $s$ remain legitimate with a symmetric cutoff.
    More precisely, for fixed $a \, z in bb(R)$,
  #[#set math.equation(numbering: n => "(8.11)")
   $ lim_(R arrow.r oo) integral_(- R)^R #scale(x: 120%, y: 120%)[\(] f_delta \( \( s - a \)^2 + z \) -
     f_delta \( s^2 \) #scale(x: 120%, y: 120%)[\)] thin d s = mu_delta \( z \) . $ <field:shift>]
  Indeed $F_z \( s \) = f_delta \( s^2 + z \)$ is even and $F'_z \( s \) = O \( \| s \|^(2 beta - 1) \) arrow.r
    0$ at infinity. Pairing the two short intervals produced by a translation bounds the difference between the
    shifted and unshifted cutoff integrals by
  $ \| a \|^2 sup_(R - \| a \| lt.eq u lt.eq R + \| a \|) \| F'_z \( u \) \| \, $
  which tends to zero.
  Scalar concavity in an eigenbasis of $Q_s \( B \)$ now gives
  $ e^(sans(T)) f_delta \( Q_s \( B \) \) e lt.eq f_delta \( e^(sans(T)) Q_s \( B \) e \) . $
  The scalar argument on the right is $\( s - e^(sans(T)) B e \)^2 + e^(sans(T)) K^2 e - \( e^(sans(T)) B e \)^2$.
    Integration and (8.11) prove (8.7). If $B e_i = y e_i$, functional calculus gives equality in the
    corresponding coordinate, proving (8.7). Since $S K^2 S = K^2$,
    conjugation inside the defining integral proves (8.8).
  On diagonal matrices, (8.5) and (8.7) read
  $ d J_delta \( "diag" \( b_1 \, dots.h \, b_n \) \) = - sum_i mu_delta \( k_i^2 - b_i^2 \) thin d b_i . $
  Integrating from $K$ to $- K$ gives the first equality in (8.9).
    For $z gt.eq 0$, $0 lt.eq mu_delta \( z \) lt.eq z^sigma$ and $mu_delta \( z \) arrow.r z^sigma$.
    Dominated convergence and the substitution $s = k_i u$ give its stated limit. ◻
]

The field is defined on all symmetric matrices, but the action argument compares it with a positive matrix $A
  A^(sans(T))$. At such values its directional bound forces positivity of the entire quadratic symbol
  $Q_s \( B \)$. This is the condition needed for the trace deficit formula.

#thm([Proposition 8.2.])[
  (Positive values of the field).  #emph[If $M = M_delta \( B \) gt.eq 0$, then
#[#set math.equation(numbering: n => "(8.12)")
 $ Q_s \( B \) gt.eq 0 quad \( s in bb(R) \) \, wide 0 lt.eq M lt.eq kappa^(2 sigma) I . $ <field:positive-bounds>]

 Set $V = K^2 - B^2 + delta I$ and use $B \, V$ in (7.4) and (7.5).
   Then the symbol $\( s I - B \)^2 + V = Q_s \( B \) + delta I$ is bounded below by $delta I$, and
#[#set math.equation(numbering: n => "(8.13)")
 $ N = M + delta^sigma I . $ <field:N>]

 In particular, the hypotheses of Theorem 10 hold.]
] <field:positive>

#proof[
  By (8.7), positivity of $M$ and strict increase of $mu_delta$ imply $e^(sans(T)) K^2 e
    gt.eq \( e^(sans(T)) B e \)^2$ for every real unit vector $e$. Completing the scalar square gives
  $ e^(sans(T)) Q_s \( B \) e = \( s - e^(sans(T)) B e \)^2 + e^(sans(T)) K^2 e - \( e^(sans(T)) B e \)^2 gt.eq 0 . $
  Thus $Q_s \( B \) gt.eq 0$, also as a Hermitian matrix on $bb(C)^n$.
    Moreover, (8.7) gives $M lt.eq mu_delta \( kappa^2 \) I lt.eq kappa^(2 sigma) I$,
    using $\( a + b \)^sigma lt.eq a^sigma + b^sigma$.
  Write $Y_s = \( s I - B \)^2$. Diagonalization of $B$ and (8.11) allow replacement of the scalar subtraction
    $f_delta \( s^2 \) I$ in (8.3) by $f_delta \( Y_s \)$. Since both $Q_s \( B \)$ and $Y_s$ are positive,
    their difference under $f_delta$ is, by (8.1),
  $ c_sigma /
    pi integral_0^oo t^beta (\( Y_s + \( t + delta \) I \)^(- 1) - \( Q_s \( B \) + \( t + delta \) I \)^(- 1))
    thin d t . $
  For fixed $B \, delta$, both matrices being inverted are bounded below by $c \( 1 + t + s^2 \) I$.
    Their difference is $K^2 - B^2$, so the resolvent identity bounds the norm of the integrand by $C
    t^beta \( 1 + t + s^2 \)^(- 2)$. Integrating first in $s$ yields $C' t^beta \( 1 + t \)^(- 3 \/ 2)$,
    which is integrable on $\( 0 \, oo \)$. Fubini’s theorem is therefore applicable and gives
  $ M = c_sigma integral_0^oo t^beta #scale(x: 120%, y: 120%)[\(] \( t + delta \)^(- 1 \/ 2) I -
    R \( t \) #scale(x: 120%, y: 120%)[\)] thin d t . $
  Subtracting this expression from (7.5) and scaling (7.1) gives (8.13). ◻
]

=== 8.2 Choosing the lower triangular coefficient matrix <choosing-the-lower-triangular-coefficient-matrix>

Let $cal(L)_n$ be the real lower triangular $n times n$ matrices. Their dimension equals that of $"Sym"_n$.
  This dimension match allows us to prescribe a symmetric terminal value by choosing $C in cal(L)_n$.
  At a simple initial problem there is one choice up to signs of the rows.
  Continuation preserves the parity of this number, and hence produces the required terminal value.

#thm([Proposition 8.3.])[
  (Connecting path).  #emph[Let $Omega = \( x_(-) \, x_(+) \)$ be bounded and let $U in
    H_0^1 \( Omega \; bb(R)^(n times d) \)$, where $n \, d gt.eq 1$, satisfy
$ integral_Omega U U^(sans(T)) thin d x = I_n . $

 For every $delta \, epsilon > 0$ there are $C_epsilon in cal(L)_n$ and $B_epsilon in
   C^1 \( overline(Omega) \; "Sym"_n \)$ such that, with $A_epsilon = C_epsilon U$,
#[#set math.equation(numbering: n => "(8.14)")
 $ epsilon B'_epsilon = M_delta \( B_epsilon \) - A_epsilon A_epsilon^(sans(T)) \, wide B_epsilon \( x_(-) \) =
   K \, quad B_epsilon \( x_(+) \) = - K . $ <path:ode>]

 They satisfy
#[#set math.equation(numbering: n => "(8.15)")
 $ sup_(x in overline(Omega)) parallel B_epsilon \( x \) parallel_("op") lt.eq kappa \, wide
   sup_(0 < epsilon lt.eq 1) parallel C_epsilon parallel_(upright("HS")) < oo \, $ <path:bounds>]

 where the second bound is for fixed $delta \, K \, Omega$.]
] <path:connecting>

#proof[
  Use the continuous representative of $U$. Choose a smooth, nonnegative,
    compactly supported cutoff $chi$ on $"Sym"_n$, equal to one on ${ B : parallel B parallel_("op") lt.eq
    kappa }$ and invariant under conjugation by diagonal sign matrices.
    Averaging a cutoff over the finite sign group produces such a function.
    The truncated field $hat(M) = chi M_delta$ is bounded and globally Lipschitz.
  Fix $epsilon > 0$. For $C in cal(L)_n$ and $theta in \[ 0 \, 1 \]$, the equation
  #[#set math.equation(numbering: n => "(8.16)")
   $ epsilon B' = theta hat(M) \( B \) - \( C U \) \( C U \)^(sans(T)) \, wide B \( x_(-) \) = K $ <path:homotopy>]
  has a unique $C^1$ solution on $overline(Omega)$. Define the continuous endpoint map
  $ Phi \( C \, theta \) = B \( x_(+) \) + K in "Sym"_n . $
  Let $cal(G)$ be the group of diagonal sign matrices, acting by $C mapsto S
    C$ on $cal(L)_n$ and by conjugation on $"Sym"_n$. Equivariance of the field and uniqueness of the ODE give
  #[#set math.equation(numbering: n => "(8.17)")
   $ Phi \( S C \, theta \) = S Phi \( C \, theta \) S . $ <path:equivariance>]
  We record the three facts needed for continuation: compactness of the zero set,
    freeness of the sign action there, and one regular orbit of zeros at $theta = 0$.
    At a zero, integration of (8.16) gives
  #[#set math.equation(numbering: n => "(8.18)")
   $ C C^(sans(T)) = 2 epsilon K + theta integral_Omega hat(M) \( B \( x \) \) thin d x . $ <path:C-identity>]
  Consequently all zeros lie in a bounded set, and their joint set in $cal(L)_n times \[ 0 \, 1 \]$ is compact.
    For $0 < epsilon lt.eq 1$, this calculation gives the uniform bound
  #[#set math.equation(numbering: n => "(8.19)")
   $ parallel C parallel_(upright("HS"))^2 lt.eq 2 "tr" K + n \| Omega \| sup_(B in "Sym"_n) parallel
     hat(M) \( B \) parallel_("op") . $ <path:C-bound>]
  No row of $C$ can vanish at a zero. Otherwise the reflection changing only row $i$ would fix $C$;
    ODE uniqueness and (8.17) would force $B e_i = y e_i$ throughout the interval. Equation (8.7) would then give
  $ epsilon y' = theta chi \( B \( x \) \) mu_delta \( k_i^2 - y^2 \) \, wide y \( x_(-) \) = k_i . $
  The coefficient $chi \( B \( x \) \)$ is continuous and the right side is locally Lipschitz in $y$.
    Uniqueness forces $y equiv k_i$, contradicting $y \( x_(+) \) = - k_i$.
    Thus the action of $cal(G)$ on the zero set is free.
  At $theta = 0$ one has
  #[#set math.equation(numbering: n => "(8.20)")
   $ Phi \( C \, 0 \) = 2 K - epsilon^(- 1) C C^(sans(T)) . $ <path:initial-map>]
  Its lower triangular zeros are exactly $C = "diag" \( d_1 \, dots.h \, d_n \)$ with $d_i =
    plus.minus sqrt(2 epsilon k_i)$. Indeed, the first row of $C C^(sans(T)) =
    2 epsilon K$ fixes $\| d_1 \|$ and forces all other entries of the first column to vanish,
    and induction does the same for subsequent columns. These $2^n$ zeros form one sign orbit.
    At each, the derivative in a lower triangular direction $H$ has diagonal entries $-
    2 epsilon^(- 1) d_i H_(i i)$ and lower off-diagonal entries $- epsilon^(- 1) d_j H_(i j)$ for $i > j$.
    It is therefore an isomorphism $cal(L)_n arrow.r "Sym"_n$.
  We next justify the continuation using only smooth approximation and the regular-value argument for parity [10]
    Sections 2–4. Suppose there were no zero at $theta = 1$. Compactness and freeness give a bounded invariant
    open set $O subset cal(L)_n$ containing the projection of every zero,
    whose closure lies where all rows are nonzero. There is a positive lower bound for $parallel Phi
    parallel_(upright("HS"))$ on
  #[#set math.equation(numbering: n => "(8.21)")
   $ \( partial O times \[ 0 \, 1 \] \) med union med \( overline(O) times { 1 } \) . $ <path:gap-set>]
  Reparametrize $theta$ by a smooth map equal to zero near zero and equal to one at one.
    The resulting map $F$ agrees with (8.20) on an initial collar and retains the gap on (8.21).
  Extend $F$ constantly beyond the two ends of the parameter interval, smooth by convolution,
    and splice to (8.20) in a smaller initial collar. Averaging the approximation $Psi_0$ in the form
  $ Psi \( C \, theta \) = frac(1, \| cal(G) \|) sum_(S in cal(G)) S Psi_0 \( S C \, theta \) S $
  gives a smooth equivariant approximation $Psi$ that still equals the initial map on that collar.
    It can be made uniformly close enough on $overline(O) times \[ 0 \, 1 \]$ to preserve the positive gap.
  Freeness permits an equivariant perturbation with arbitrary target directions.
    At each $C_0 in overline(O)$, choose a ball whose distinct sign translates are disjoint,
    and a smooth bump $b$ supported in this ball with $b \( C_0 \) = 1$. For $H in "Sym"_n$ the map
  $ V_H \( C \) = sum_(S in cal(G)) b \( S C \) S H S $
  is equivariant and satisfies $V_H \( C_0 \) = H$. Choose a basis of target matrices and then a finite collection
    of such neighborhoods covering $overline(O)$. This gives finitely many smooth equivariant maps $V_1 \,
    dots.h \, V_N$ whose values span $"Sym"_n$ at every point of $overline(O)$.
  Let $h gt.eq 0$ be smooth, vanish near zero, and be positive outside the collar where $Psi$ is the initial map.
    Choose it so that every zero of $h$ lies within that collar, and set
  $ Psi_alpha \( C \, theta \) = Psi \( C \, theta \) + h \( theta \) sum_(j = 1)^N alpha_j V_j \( C \) . $
  For $alpha$ in a sufficiently small open ball, the gap on (8.21) persists.
    At a zero of this family with $0 < theta < 1$, its full differential in $\( C \, theta \, alpha \)$ is onto:
    when $h \( theta \) > 0$ the parameter directions span the target, and when $h \( theta \) =
    0$ the derivative in $C$ is the isomorphism computed for (8.20).
    Its interior zero set is consequently a smooth manifold. Sard’s theorem [13],
    applied to projection of this manifold onto the parameter ball,
    gives arbitrarily small $alpha$ for which zero is a regular value of $\( C \, theta \) mapsto
    Psi_alpha \( C \, theta \)$. For completeness, if the full derivative is $\( L_1 \, L_2 \)$ in the
    $\( C \, theta \)$ and $alpha$ directions, regularity of that projection means that each $w$ admits $v$ with
    $L_1 v + L_2 w = 0$. Hence $"ran" L_2 subset "ran" L_1$, and surjectivity of $\( L_1 \, L_2 \)$ implies
    surjectivity of $L_1$.
  For such an $alpha$, the zero set in $O times \[ 0 \, 1 \]$ is a compact smooth one-dimensional manifold with
    boundary. The gap excludes boundary zeros except at $theta = 0$,
    where the initial collar gives exactly the $2^n$ regular zeros above.
    The free sign action has a quotient that is again a compact one-dimensional manifold with boundary:
    a neighborhood disjoint from its nontrivial translates supplies the local interval or half-interval chart.
    All $2^n$ boundary points form one orbit, so the quotient has exactly one boundary point.
    This is impossible, since a compact one-dimensional manifold is a finite union of circles and closed
    intervals. Therefore the original map $Phi \( dot.op \, 1 \)$ has a zero.
  It remains to remove the cutoff. For the path at this zero and any fixed real unit vector $e$, put $y =
    e^(sans(T)) B e$. Whenever $\| y \| > kappa$, Equation (8.7) yields
  $ e^(sans(T)) M_delta \( B \) e lt.eq mu_delta \( e^(sans(T)) K^2 e - y^2 \) < 0 . $
  Since $chi gt.eq 0$ and $\( C U \) \( C U \)^(sans(T)) gt.eq 0$, the ODE implies $y' lt.eq 0$ there.
    Both endpoint values lie in $\[ - kappa \, kappa \]$. An excursion above $kappa$ cannot start from $kappa$
    while $y$ is nonincreasing; an excursion below $- kappa$ cannot return to $-
    kappa$ while $y$ is nonincreasing. The two endpoint conditions therefore rule out both excursions.
    This holds for every $e$, so $parallel B \( x \) parallel_("op") lt.eq kappa$.
    Consequently $chi \( B \) = 1$, giving (8.14), and (8.19) supplies the remaining assertion in (8.15). ◻
]

#heading(level: 1)[References]
#bibitem([1])[Michael Aizenman and Elliott H. Lieb, #emph[On semi-classical bounds for eigenvalues of Schrödinger
  operators], Physics Letters A #strong[66] (1978), no.~6, 427--429.
  #link("https://doi.org/10.1016/0375-9601(78)90385-7")[doi:10.1016/0375-9601(78)90385-7].]
#bibitem([2])[Rafael Benguria and Michael Loss, #emph[A simple proof of a theorem of Laptev and Weidl],
  Mathematical Research Letters #strong[7] (2000), no.~2--3, 195--203.
  #link("https://doi.org/10.4310/MRL.2000.v7.n2.a5")[doi:10.4310/MRL.2000.v7.n2.a5].]
#bibitem([3])[Rupert L. Frank, David Gontier and Mathieu Lewin,
  #emph[Optimizers for the finite-rank Lieb--Thirring inequality],
  American Journal of Mathematics #strong[147] (2025), no.~2, 503--560.
  #link("https://doi.org/10.1353/ajm.2025.a954649")[doi:10.1353/ajm.2025.a954649].]
#bibitem([4])[Dirk Hundertmark, Ari Laptev and Timo Weidl, #emph[New bounds on the Lieb--Thirring constants],
  Inventiones Mathematicae #strong[140] (2000), no.~3, 693--704.
  #link("https://doi.org/10.1007/s002220000077")[doi:10.1007/s002220000077].]
#bibitem([5])[Dirk Hundertmark, Elliott H. Lieb and Lawrence E.
  Thomas, #emph[A sharp bound for an eigenvalue moment of the one-dimensional Schrödinger operator],
  Advances in Theoretical and Mathematical Physics #strong[2] (1998), no.~4, 719--731.
  #link("https://doi.org/10.4310/ATMP.1998.v2.n4.a2")[doi:10.4310/ATMP.1998.v2.n4.a2].]
#bibitem([6])[Joseph B. Keller, #emph[Lower bounds and isoperimetric inequalities for eigenvalues of the
  Schrödinger equation], Journal of Mathematical Physics #strong[2] (1961), no.~2, 262--266.
  #link("https://doi.org/10.1063/1.1703708")[doi:10.1063/1.1703708].]
#bibitem([7])[Ari Laptev and Timo Weidl, #emph[Sharp Lieb--Thirring inequalities in high dimensions],
  Acta Mathematica #strong[184] (2000), no.~1, 87--111.
  #link("https://doi.org/10.1007/BF02392782")[doi:10.1007/BF02392782].]
#bibitem([8])[Elliott H. Lieb and Walter E. Thirring, #emph[Bound for the kinetic energy of fermions which proves
  the stability of matter], Physical Review Letters #strong[35] (1975), no.~11, 687--689; erratum,
  #strong[35] (1975), 1116. #link("https://doi.org/10.1103/PhysRevLett.35.687")[doi:10.1103/PhysRevLett.35.687].]
#bibitem([9])[Elliott H. Lieb and Walter E. Thirring, #emph[Inequalities for the moments of the eigenvalues of the
  Schrödinger Hamiltonian and their relation to Sobolev inequalities], in #emph[Studies in Mathematical Physics:
  Essays in Honor of Valentine Bargmann], Elliott H. Lieb, Barry Simon and Arthur S.
  Wightman (eds.), Princeton University Press, Princeton, NJ, 1976, 269--303.]
#bibitem([10])[John W. Milnor, #emph[Topology from the Differentiable Viewpoint], University Press of Virginia,
  Charlottesville, VA, 1965.]
#bibitem([11])[OpenAI, #emph[Sharp one-dimensional Lieb--Thirring inequalities for matrix potentials],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/Sharp-one-dimensional-Lieb-Thirring-inequalities-for-matrix-potentials-October-5-2026/sharp-matrix-lieb-thirring.pdf")[OAI:Sharp-one-dimensional-Lieb-Thirring-inequalities-for-matrix-potentials-October-5-2026],
  2026.]
#bibitem([12])[Larry Read and Marvin R. Schulz, #emph[The sharp one-dimensional Lieb--Thirring inequality for the
  sum of eigenvalues], #link("https://arxiv.org/abs/2609.10478v2")[arXiv:2609.10478v2], September 14, 2026.]
#bibitem([13])[Arthur Sard, #emph[The measure of the critical values of differentiable maps],
  Bulletin of the American Mathematical Society #strong[48] (1942), 883--890.
  #link("https://doi.org/10.1090/S0002-9904-1942-07811-6")[doi:10.1090/S0002-9904-1942-07811-6].]
