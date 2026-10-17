#set page(paper: "us-letter", margin: (x: 78.1pt, y: 78.1pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Sharp one-dimensional Lieb--Thirring inequalities \
for matrix potentials]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:introduction>

Lieb–Thirring inequalities bound moments of the negative eigenvalues of a Schrödinger operator by an integral of its potential. Their sharp constants measure how much binding is possible for a prescribed potential cost. When the wave function has several components, the potential becomes a matrix, and its eigenspaces may change with position. The question addressed here is whether this additional freedom increases the optimal constant in one dimension.

Let $m gt.eq 1$, let $1 \/ 2 < gamma < 3 \/ 2$, and put $p = gamma + 1 \/ 2$. For a measurable Hermitian positive semidefinite matrix function $W : bb(R) arrow.r bb(C)^(m times m)$ satisfying

#[#set math.equation(numbering: n => "(1.1)")
 $ integral_(bb(R)) "tr" \( W \( x \)^p \) thin d x < oo \, $ <eq:potential-class>]

consider the quadratic form

#[#set math.equation(numbering: n => "(1.2)")
 $ h_W \[ psi \] = integral_(bb(R)) parallel psi' \( x \) parallel^2 thin d x - integral_(bb(R)) chevron.l psi \( x \) \, W \( x \) psi \( x \) chevron.r thin d x \, #h(2em) psi in H^1 \( bb(R) \; bb(C)^m \) . $ <eq:schrodinger-form>]

This form is closed and bounded below. Its self-adjoint operator is denoted by $H_W = - d^2 \/ d x^2 - W$. Its negative spectrum consists of eigenvalues, with finite multiplicities and possible accumulation only at zero; these facts are proved under exactly (1.1) in Section 7. We write

$ "Tr" \( H_W \)_(-)^gamma = sum_(lambda_j \( H_W \) < 0) \| lambda_j \( H_W \) \|^gamma \, $

initially allowing the sum to be infinite. Matrix powers are defined by spectral functional calculus, and $"tr"$ is the ordinary, unnormalized matrix trace.

#thm([Theorem 1.1.])[
  (Sharp matrix inequality).  #emph[For every $1 \/ 2 < gamma < 3 \/ 2$, every finite $m gt.eq 1$, and every $W$ satisfying (1.1), 
#[#set math.equation(numbering: n => "(1.3)")
 $ "Tr" \( H_W \)_(-)^gamma lt.eq C_gamma integral_(bb(R)) "tr" \( W \( x \)^(gamma + 1 \/ 2) \) thin d x \, #h(2em) C_gamma = (frac(gamma - 1 \/ 2, gamma + 1 \/ 2))^(gamma - 1 \/ 2) frac(Gamma \( gamma + 1 \), sqrt(pi) thin Gamma \( gamma + 3 \/ 2 \)) . $ <eq:main-bound>]

 The constant is optimal in every matrix dimension. With $r = \( gamma - 1 \/ 2 \)^(- 1)$, it is attained by 
#[#set math.equation(numbering: n => "(1.4)")
 $ W \( x \) = "diag" #scale(x: 120%, y: 120%)[\(] \( r + 1 \) "sech"^2 \( r x \) \, 0 \, dots.h \, 0 #scale(x: 120%, y: 120%)[\)] . $ <eq:extremal-potential>]

]
] <thm:main>

The matrices $W \( x \)$ may be noncommuting and may have arbitrary rank. In particular, the conclusion concerns changing internal channels as well as independent scalar channels.

=== 1.1 Historical context and relationship to prior work <historical-context-and-relationship-to-prior-work>

Lieb and Thirring introduced their eigenvalue inequalities in the study of fermionic kinetic energy and the stability of matter [8,9]. The one-state variational problem goes back to Keller [6]. In one dimension its optimal constant exceeds the semiclassical constant for $1 \/ 2 < gamma < 3 \/ 2$. The scalar conjecture in this interval asks whether summing all negative eigenvalues changes that one-state constant. The companion paper [11] Theorem 1.1 proves that it does not. The present paper establishes the same constant for arbitrary finite matrix size, allowing the eigenspaces of the potential to vary with position.

Sharp matrix inequalities at the two endpoint exponents have an established history. Weidl proved finiteness at the scalar lower endpoint [14], and Hundertmark, Lieb and Thomas obtained the sharp $gamma = 1 \/ 2$ inequality with constant $1 \/ 2$ [5] Theorem 1; Hundertmark, Laptev and Weidl proved the operator-valued version [4] Theorem 3.1. At $gamma = 3 \/ 2$, Laptev and Weidl established the sharp matrix estimate by trace identities and extended it to operator-valued potentials [7] Theorems 2.1 and 2.2. Aizenman–Lieb integration in the spectral parameter gives the larger exponents [1]. Laptev and Weidl’s dimension-lifting argument then yields the semiclassical constant in every spatial dimension for $gamma gt.eq 3 \/ 2$ [7] Theorem 3.1. Benguria and Loss gave a proof of the matrix upper-endpoint estimate by Riccati factorization and commutation [2].

In the open interval, Hundertmark, Laptev and Weidl obtained the operator-valued upper bound with twice the semiclassical constant [4] Theorem 4.1. Dolbeault, Laptev and Loss developed the method of orthonormal vector-valued functions at exponent one [3] Theorems 1 and 3. More recently, Read and Schulz proved the sharp value $4 \/ \( 3 sqrt(3) pi \)$ for $gamma = 1$, including operator-valued potentials [12] Proposition 4 and Equation (2.1). Thus the exponent-one case of our theorem is already contained in their result. Our additional range is $1 \/ 2 < gamma < 3 \/ 2$, $gamma eq.not 1$.

The proof adapts the finite-interval action and continuation framework of [11] Theorem 2.1, Proposition 5.1 and Section 6. The companion’s comparison applies when the pointwise density has rank at most one [11] Proposition 4.1. The new analytic step removes that restriction, making the action method applicable to vector-valued wave functions.

=== 1.2 The matrix comparison and the proof strategy <the-matrix-comparison-and-the-proof-strategy>

The proof uses the finite-interval action method of the scalar companion [11]. To explain the extension, choose finitely many orthonormal real vector-valued trial functions $u_1 \, dots.h \, u_n$ and place them in the rows of a matrix function $U \( x \)$. A lower triangular coefficient matrix $C$ produces $A \( x \) = C U \( x \)$, so that the $i$th row of $A$ remains in the span of $u_1 \, dots.h \, u_i$. For trial functions ordered by their negative energies, this preserves the spectral inequalities needed to bound the action from above. The action subtracts a power of the matrix density $rho \( x \) = A \( x \) A \( x \)^(sans(T))$, and a complementary lower bound recovers the sum of the chosen eigenvalue moments. A fixed realification of the potential will subsequently give the complex Hermitian case.

The lower bound is obtained by connecting two prescribed diagonal matrices $K$ and $- K$, where the diagonal entries of $K$ are the positive square roots of the absolute values of the negative trial energies. A regularized matrix field $M$ drives an equation with the penalized constraint $M \( B \) = rho$. In the scalar-potential argument, $A$ has one column and this constraint has rank at most one. For matrix potentials, $rho$ can have any rank. The essential new estimate controls $"tr" \( rho^q \)$ in this setting, where $q$ is conjugate to $p$.

We prove that estimate as an independent result in Section 3. For Hermitian $B \, V$ such that $\( s I - B \)^2 + V$ is uniformly positive for real $s$, we form a weighted integral $N$ of resolvent differences. When $N gt.eq 0$, the result is $"tr" \( N V \) gt.eq "tr" \( N^q \)$. The hypothesis permits indefinite $V$, which is necessary when $V$ is later obtained from $K^2 - B^2$. Half-line solutions of a constant-coefficient differential equation give two boundary matrices. Their sum identifies the integrated resolvent, and their difference accounts for the noncommutative error. A logarithmic determinant identity and a nonnegative matrix square then prove the trace comparison with the required constant.

Section 2 states the action inequality and isolates its relation to spectral estimates. Sections 4–6 construct the field, connect the endpoints, and remove the penalty. The continuation argument works modulo independent signs of the rows of $C$. After smoothing and perturbation, parity of the boundary of the quotient zero set forces an endpoint solution. Finally, Section 7 applies the action inequality to smooth trial spaces and passes to general potentials and the full spectral moment. All of these steps are proved here; the companion is cited for the method and its scalar specialization.

=== 1.3 Conventions <conventions>

For the rest of the paper we use

#[#set math.equation(numbering: n => "(1.5)")
 $ sigma = gamma - 1 / 2 in \( 0 \, 1 \) \, #h(2em) p = 1 + sigma \, #h(2em) q = 1 + sigma^(- 1) \, #h(2em) beta = sigma - 1 / 2 . $ <eq:exponents>]

Thus $p^(- 1) + q^(- 1) = 1$. The identity matrix has the size specified by its context. On matrices we use the Hilbert–Schmidt norm $parallel A parallel_(upright("HS"))^2 = "tr" \( A^(*) A \)$ and the operator norm $parallel A parallel_("op")$. The space $"Sym"_n$ of real symmetric matrices carries the inner product $"tr" \( B H \)$. Complex inner products are linear in the second variable.

== 2 The finite-interval action inequality <sec:action-framework>

We first formulate the lower bound on the variational action that will lead to an upper bound on spectral moments. Let $Omega = \( x_(-) \, x_(+) \)$ be a bounded interval, let $n \, d gt.eq 1$, and suppose

#[#set math.equation(numbering: n => "(2.1)")
 $ U in H_0^1 \( Omega \; bb(R)^(n times d) \) \, #h(2em) integral_Omega U \( x \) U \( x \)^(sans(T)) thin d x = I_n . $ <eq:row-orthonormality>]

Thus the rows of $U$ are orthonormal as $bb(R)^d$-valued functions. Fix $K = "diag" \( k_1 \, dots.h \, k_n \)$ with each $k_i > 0$. For $A in H_0^1 \( Omega \; bb(R)^(n times d) \)$ define

#[#set math.equation(numbering: n => "(2.2)")
 $ cal(E) \( A \) = integral_Omega (parallel A' parallel_(upright("HS"))^2 + "tr" \( K^2 A A^(sans(T)) \) - "tr" \( \( A A^(sans(T)) \)^q \)) thin d x . $ <eq:action>]

This integral is finite, since one-dimensional $H^1$ functions on a bounded interval are continuous. Write $cal(L)$ for the real lower triangular $n times n$ matrices.

#thm([Theorem 2.1.])[
  (Action inequality).  #emph[For every $0 < sigma < 1$ and all the data just specified, 
#[#set math.equation(numbering: n => "(2.3)")
 $ sup_(C in cal(L)) cal(E) \( C U \) gt.eq sum_(i = 1)^n integral_(- k_i)^(k_i) \( k_i^2 - s^2 \)^sigma thin d s . $ <eq:action-bound>]

]
] <thm:action>

The order of the $k_i$ is immaterial for this theorem. For its spectral application we order them decreasingly: lower triangularity then preserves the nested trial spaces on which the form is at most $- k_i^2$ times the squared norm. Matrix Young duality bounds the action from above by a constant times $integral "tr" \( W^p \)$, while

$ integral_(- k_i)^(k_i) \( k_i^2 - s^2 \)^sigma thin d s = upright(B) \( 1 / 2 \, 1 + sigma \) k_i^(2 sigma + 1) $

has exactly the desired spectral exponent. Section 7 gives this deduction, including its approximation steps.

The scalar companion proves the version with $d = 1$ [11] Theorem 2.1. Its field and endpoint construction also suggest the present proof. The necessary new ingredient is an inequality for positive matrix densities of unrestricted rank. We prove that comparison next, before constructing the regularized field to which it applies. The proof of Theorem 2 is completed in Section 6.

== 3 An integrated matrix trace inequality <sec:trace>

The matrix step in the proof compares an integrated resolvent difference with the Hermitian perturbation that produces it. We prove the comparison for matrices of arbitrary size. The perturbation may be indefinite; positivity is imposed on the entire symbol.

For the fixed exponent $0 < sigma < 1$, define $c_sigma > 0$ by

#[#set math.equation(numbering: n => "(3.1)")
 $ c_sigma^(- 1) = integral_0^oo t^beta #scale(x: 120%, y: 120%)[\(] t^(- 1 \/ 2) - \( t + 1 \)^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\)] thin d t . $ <eq:trace-normalization>]

Recall that $beta = sigma - 1 / 2 in \( - 1 / 2 \, 1 / 2 \)$. The integrand in (3.1) is $O \( t^(beta - 1 \/ 2) \)$ at zero and $O \( t^(beta - 3 \/ 2) \)$ at infinity. The integral is therefore finite, and scaling gives

#[#set math.equation(numbering: n => "(3.2)")
 $ c_sigma integral_0^oo t^beta #scale(x: 120%, y: 120%)[\(] t^(- 1 \/ 2) - \( t + y \)^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\)] thin d t = y^sigma \, #h(2em) y gt.eq 0 . $ <eq:trace-scaling>]

#thm([Theorem 3.1.])[
  (Integrated trace comparison).  #emph[Let $n gt.eq 1$ and let $B \, V in bb(C)^(n times n)$ be Hermitian. Suppose that for some $b > 0$, 
#[#set math.equation(numbering: n => "(3.3)")
 $ Y_s = \( s I - B \)^2 \, #h(2em) X_s = Y_s + V gt.eq b I #h(2em) upright("for every ") s in bb(R) . $ <eq:trace-symbol>]

 For $t > 0$, set 
#[#set math.equation(numbering: n => "(3.4)")
 $ R \( t \) = 1 / pi integral_(bb(R)) \( X_s + t I \)^(- 1) thin d s \, #h(2em) P \( t \) = t^(- 1 \/ 2) I - R \( t \) \, $ <eq:trace-resolvents>]

 and define 
#[#set math.equation(numbering: n => "(3.5)")
 $ N = c_sigma integral_0^oo t^beta P \( t \) thin d t . $ <eq:trace-N>]

 These integrals converge absolutely in matrix norm. If $N gt.eq 0$, then 
#[#set math.equation(numbering: n => "(3.6)")
 $ "tr" \( N V \) gt.eq "tr" \( N^q \) . $ <eq:trace-comparison>]

]
] <thm:trace>

For a scalar $V = v > 0$, shifting the variable $s$ gives $R \( t \) = \( t + v \)^(- 1 \/ 2)$ and $N = v^sigma$. Thus the two sides of (3.6) agree in the scalar case. To retain this constant for noncommuting matrices, we will express the difference in (3.6) as an integral of nonnegative terms. The first step computes the resolvent through solutions of a constant-coefficient equation on the two half-lines.

=== 3.1 Resolvent estimates and half-line solutions <resolvent-estimates-and-half-line-solutions>

We first verify convergence. The matrices $X_s$ and $Y_s$ grow quadratically as $\| s \| arrow.r oo$. Combined with the lower bound in (3.3), this shows that $X_s^(- 1)$ has an integrable matrix-norm bound on $bb(R)$. Consequently $R \( t \) > 0$ and $R \( t \) = O \( 1 \)$ as $t arrow.b 0$. Diagonalizing $B$ gives

$ 1 / pi integral_(bb(R)) \( Y_s + t I \)^(- 1) thin d s = t^(- 1 \/ 2) I . $

For $t gt.eq 1$, both $X_s + t I$ and $Y_s + t I$ are bounded below by $c \( s^2 + t \) I$ for some $c > 0$ independent of $s \, t$. The resolvent identity, with the fixed matrix difference $V$, therefore gives

#[#set math.equation(numbering: n => "(3.7)")
 $ parallel P \( t \) parallel = cases(delim: "{", O \( t^(- 1 \/ 2) \) \, & t arrow.b 0 \,, O \( t^(- 3 \/ 2) \) \, & t arrow.r oo .) $ <eq:trace-P-bounds>]

For the second estimate, the norm of the difference of the two resolvents is at most $C \( s^2 + t \)^(- 2)$, whose $s$-integral is $O \( t^(- 3 \/ 2) \)$. The range of $beta$ now proves the absolute convergence in (3.5).

Matrix Riccati equations also underlie the commutation approach to matrix Schrödinger inequalities [2]. Here the boundary matrices will compute both a resolvent integral and a logarithmic determinant integral. Fix $t > 0$, write $nabla = partial_x - i B$, and consider

#[#set math.equation(numbering: n => "(3.8)")
 $ \( - nabla^2 + V + t I \) psi = 0 . $ <eq:trace-ode>]

The following construction relates its decaying solutions to $R \( t \)$.

#thm([Lemma 3.2.])[
  #emph[For every $v in bb(C)^n$, equation (3.8) has a unique $H^1$ solution on each half-line with boundary value $v$ at zero. There are Hermitian matrices $S = S \( t \)$ and $T = T \( t \)$ such that these solutions satisfy 
#[#set math.equation(numbering: n => "(3.9)")
 $ nabla psi \( 0 + \) = - S v \, #h(2em) nabla psi \( 0 - \) = T v \, $ <eq:trace-boundary-maps>]

 respectively. They obey 
#[#set math.equation(numbering: n => "(3.10)")
 $ V + t I = S^2 + i \[ B \, S \] = T^2 - i \[ B \, T \] \, #h(2em) frac(S + T, 2) = R \( t \)^(- 1) . $ <eq:trace-riccati>]

 Every eigenvalue of $B + i S$ has strictly positive imaginary part.]
] <lem:trace-half-lines>

#proof[
  With inner products linear in the second argument, let
  $ a_t \( phi.alt \, psi \) = integral #scale(x: 120%, y: 120%)[\(] chevron.l nabla phi.alt \, nabla psi chevron.r + chevron.l phi.alt \, \( V + t I \) psi chevron.r #scale(x: 120%, y: 120%)[\)] thin d x . $
  On the full line its Fourier symbol is $X_s + t I$, and (3.3) and quadratic growth give $X_s + t I gt.eq c_t \( 1 + s^2 \) I$ for some $c_t > 0$. Thus $a_t$ is coercive on $H^1 \( bb(R) \; bb(C)^n \)$. Zero extension proves the same assertion on the subspace of $H^1$ functions on either half-line whose boundary trace is zero.
  Choose any $H^1$ extension $eta$ of the prescribed boundary value. On the trace-zero space the form $a_t$ is an equivalent Hilbert space inner product. The Riesz representation theorem gives a unique correction $u$ in that space with $a_t \( phi.alt \, u \) = - a_t \( phi.alt \, eta \)$ for every trace-zero $phi.alt$. Then $psi = eta + u$ solves (3.8) weakly. Conversely, an $H^1$ solution satisfies this weak identity by density of interior test functions in the trace-zero space, so coercivity proves uniqueness.
  The equation implies $psi'' in L^2$. In particular the solutions belong to $H^2$, their first derivatives have boundary traces, and both $psi$ and $psi'$ tend to zero at the infinite end of the half-line. Define $S$ and $T$ by (3.9). For the right solutions with data $v \, w$, integration by parts gives $a_t \( psi_v \, psi_w \) = chevron.l v \, S w chevron.r$; on the left it gives $a_t \( psi_v \, psi_w \) = chevron.l v \, T w chevron.r$. Since $a_t$ is Hermitian, both boundary matrices are Hermitian.
  Translation and uniqueness imply the same derivative relations at every interior point:
  $ nabla psi = - S psi quad upright("on ") \( 0 \, oo \) \, #h(2em) nabla psi = T psi quad upright("on ") \( - oo \, 0 \) . $
  For example, $nabla \( - S psi \) = - S nabla psi + i \[ B \, S \] psi$. Substitution into (3.8), followed by evaluation at zero for arbitrary boundary data, proves the two Riccati identities in (3.10).
  Glue the right and left solutions with the same value $v$ at zero. Figure 1 records the boundary signs and the normalization in this gluing identity. The resulting function is continuous, and its derivative has jump $- \( S + T \) v$. On the full line it therefore satisfies
  $ \( - nabla^2 + V + t I \) psi = delta_0 \( S + T \) v . $
  Using the Fourier transform with forward kernel $e^(- i s x)$ and inverting at zero gives
  $ v = frac(1, 2 pi) integral_(bb(R)) \( X_s + t I \)^(- 1) thin d s thin \( S + T \) v = 1 / 2 R \( t \) \( S + T \) v . $
  This inversion may first be taken in tempered distributions; the transformed function is integrable because the inverse symbol is $O \( s^(- 2) \)$, so evaluation at zero is legitimate. Since $R \( t \) > 0$, the second identity in (3.10) follows.
  Finally the right solutions satisfy $psi' = i \( B + i S \) psi$. If $\( B + i S \) v = z v$ with $v eq.not 0$, uniqueness for this first-order initial-value problem gives $psi \( x \) = e^(i z x) v$. It belongs to $L^2 \( 0 \, oo \; bb(C)^n \)$, hence $"Im" z > 0$. ◻
]

#figure(
  [#image("fig/half-line-gluing.pdf.png", width: 100%)],
  caption: [Figure 1: Gluing the two half-line solutions at a common boundary value $v$, for fixed $t > 0$ and $nabla = partial_x - i B$. The colored segments represent the two domains, rather than scalar solution profiles. The jump of the covariant derivative gives the point source $delta_0 \( S + T \) v$. Fourier inversion at zero, for every $v$, identifies the averaged boundary map $\( S + T \) \/ 2$ with $R \( t \)^(- 1)$. The separate Hermitian matrices $S$ and $T$ need not be positive. ],
) <fig:half-line-gluing>

Define the Hermitian matrices

#[#set math.equation(numbering: n => "(3.11)")
 $ L = frac(S + T, 2) = R \( t \)^(- 1) > 0 \, #h(2em) Z = frac(S - T, 2) . $ <eq:trace-LZ-definition>]

Adding and subtracting the Riccati identities gives

#[#set math.equation(numbering: n => "(3.12)")
 $ V + t I = L^2 + Z^2 + i \[ B \, Z \] \, #h(2em) L Z + Z L + i \[ B \, L \] = 0 . $ <eq:trace-LZ-identities>]

In an eigenbasis of $L$, the second identity has diagonal entries $2 L_(j j) Z_(j j) = 0$. Thus $"tr" Z = 0$. Multiplying that identity on both sides by $R = L^(- 1)$ gives $i \[ R \, B \] = - \( Z R + R Z \)$, and cyclicity of the trace yields

$ i "tr" \( R \[ B \, Z \] \) = i "tr" \( \[ R \, B \] Z \) = - 2 "tr" \( R Z^2 \) . $

Consequently

#[#set math.equation(numbering: n => "(3.13)")
 $ "tr" #scale(x: 120%, y: 120%)[\(] R \( V + t I \) #scale(x: 120%, y: 120%)[\)] = "tr" L - "tr" \( R Z^2 \) . $ <eq:trace-RV>]

The correction $"tr" \( R Z^2 \) = "tr" \( Z R Z \)$ is nonnegative.

We have expressed the integrated resolvent through $L$ and identified a nonnegative correction involving $Z$. To compare the weighted integral $N$ with $V$, we next need a scalar quantity whose $t$-derivative contains $"tr" R \( t \)$. The logarithm of the determinant provides that quantity, and the same half-line matrices evaluate it.

=== 3.2 The logarithmic integral and its weighted identity <the-logarithmic-integral-and-its-weighted-identity>

Define

#[#set math.equation(numbering: n => "(3.14)")
 $ F \( t \) = frac("tr" V, sqrt(t)) - 1 / pi integral_(bb(R)) log frac(det \( X_s + t I \), det \( Y_s + t I \)) thin d s . $ <eq:trace-F-definition>]

The determinants are positive. Factoring with $\( Y_s + t I \)^(1 \/ 2)$ shows that the log ratio is $O \( \| s \|^(- 2) \)$ at infinity, so its integral converges absolutely. Its $t$-derivative is the trace of the difference of the two resolvents. This has an integrable bound locally uniform for $t > 0$, by the same resolvent identity used above. In particular $F$ is continuously differentiable on $\( 0 \, oo \)$.

The first Riccati identity gives the factorization

#[#set math.equation(numbering: n => "(3.15)")
 $ X_s + t I = \( s I - B + i S \) \( s I - B - i S \) . $ <eq:trace-factorization>]

Let $u_j + i v_j$, $1 lt.eq j lt.eq n$, be the eigenvalues of $B + i S$, with algebraic multiplicity. Lemma 4 gives $v_j > 0$. Since $B - i S = \( B + i S \)^(*)$, taking determinants in (3.15) gives

$ det \( X_s + t I \) = product_(j = 1)^n #scale(x: 120%, y: 120%)[\(] \( s - u_j \)^2 + v_j^2 #scale(x: 120%, y: 120%)[\)] . $

The denominator in (3.14) has the same form, with centers the eigenvalues of $B$ and widths all equal to $sqrt(t)$.

These centers can be removed when integrating with symmetric cutoffs. Indeed, for $h \( s \) = log \( s^2 + v^2 \)$, the function $h$ is even and $h' \( s \) arrow.r 0$ at both ends. For a fixed translation $a$,

$ frac(d, d a) integral_(- r)^r h \( s - a \) thin d s = h \( r + a \) - h \( r - a \) arrow.r 0 quad \( r arrow.r oo \) \, $

uniformly for $a$ in bounded intervals. Integrating in $a$ shows that the translation changes the symmetric-cutoff integral by a quantity tending to zero. After centering the factors, the scalar identity

$ integral_(bb(R)) log frac(s^2 + v^2, s^2 + w^2) thin d s = 2 pi \( v - w \) \, #h(2em) v \, w > 0 \, $

follows by differentiation and integration in $v$. Since $sum_j v_j = "tr" S = "tr" L$, we obtain

#[#set math.equation(numbering: n => "(3.16)")
 $ F \( t \) = frac("tr" V, sqrt(t)) - 2 "tr" \( L - sqrt(t) I \) . $ <eq:trace-F-evaluation>]

Introduce a second scalar function

#[#set math.equation(numbering: n => "(3.17)")
 $ G \( t \) = "tr" #scale(x: 120%, y: 120%)[\(] L - 2 sqrt(t) I + t R \( t \) #scale(x: 120%, y: 120%)[\)] . $ <eq:trace-G-definition>]

For each eigenvalue $r > 0$ of $R \( t \)$, $r^(- 1) - 2 sqrt(t) + t thin r = \( 1 - sqrt(t) thin r \)^2 \/ r gt.eq 0$, so $G \( t \) gt.eq 0$. Taking traces in (3.12) and using (3.16) also gives

#[#set math.equation(numbering: n => "(3.18)")
 $ F \( t \) = 1 / sqrt(t) "tr" #scale(x: 120%, y: 120%)[\(] \( L - sqrt(t) I \)^2 + Z^2 #scale(x: 120%, y: 120%)[\)] gt.eq 0 . $ <eq:trace-F-positive>]

Equations (3.13) and (3.16) now imply the exact identity

#[#set math.equation(numbering: n => "(3.19)")
 $ "tr" \( P \( t \) V \) = F \( t \) + G \( t \) + "tr" \( R \( t \) Z^2 \) . $ <eq:trace-FG-identity>]

This identity supplies all bounds needed at the improper endpoints. In fact $0 lt.eq F \( t \) \, G \( t \) lt.eq "tr" \( P \( t \) V \)$, even though neither $V$ nor $P \( t \)$ is assumed positive. By (3.7), both $F$ and $G$ are $O \( t^(- 1 \/ 2) \)$ at zero and $O \( t^(- 3 \/ 2) \)$ at infinity. They are therefore integrable against $t^beta thin d t$, and

#[#set math.equation(numbering: n => "(3.20)")
 $ lim_(t arrow.b 0) t^(beta + 1) F \( t \) = lim_(t arrow.r oo) t^(beta + 1) F \( t \) = 0 . $ <eq:trace-F-boundary>]

The same identity proves weighted integrability of $"tr" \( R Z^2 \)$.

Differentiating (3.14) gives

$ F' \( t \) = - frac("tr" V, 2 t^(3 \/ 2)) - "tr" #scale(x: 120%, y: 120%)[\(] R \( t \) - t^(- 1 \/ 2) I #scale(x: 120%, y: 120%)[\)] . $

Substitution from (3.16) and (3.17) yields $t F' \( t \) = - F \( t \) \/ 2 - G \( t \)$. Integrate the derivative of $t^(beta + 1) F \( t \)$ on a compact subinterval of $\( 0 \, oo \)$, then use (3.20) to pass to the endpoints. Since $beta + 1 / 2 = sigma$, the result is

#[#set math.equation(numbering: n => "(3.21)")
 $ integral_0^oo t^beta G \( t \) thin d t = sigma integral_0^oo t^beta F \( t \) thin d t . $ <eq:trace-weighted-balance>]

In particular, integrating (3.19) gives

#[#set math.equation(numbering: n => "(3.22)")
 $ "tr" \( N V \) = q c_sigma integral_0^oo t^beta G \( t \) thin d t + c_sigma integral_0^oo t^beta "tr" \( R \( t \) Z^2 \) thin d t . $ <eq:trace-weighted-identity>]

The half-line calculation has thus reduced the theorem to a bound on the weighted integral of $G$. The last step compares $G \( t \)$ with a scalar square-root expression evaluated on an arbitrary positive semidefinite matrix. Choosing that matrix in terms of $N$ will produce the exponent $q$ with no loss in the constant.

=== 3.3 Completion of the trace comparison <completion-of-the-trace-comparison>

#proof[
  The convergence assertions were proved above. Let $D gt.eq 0$ be an $n times n$ matrix and define
  $ F_0 \( t \, D \) = frac("tr" D, sqrt(t)) - 2 "tr" #scale(x: 120%, y: 120%)[\(] \( t I + D \)^(1 \/ 2) - sqrt(t) I #scale(x: 120%, y: 120%)[\)] . $
  For a scalar eigenvalue $d gt.eq 0$, its contribution to $F_0$ is
  $ d / sqrt(t) - 2 #scale(x: 120%, y: 120%)[\(] sqrt(t + d) - sqrt(t) #scale(x: 120%, y: 120%)[\)] = integral_0^d #scale(x: 120%, y: 120%)[\(] t^(- 1 \/ 2) - \( t + y \)^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\)] thin d y . $
  The integrand is nonnegative. Tonelli’s theorem and (3.2), applied to each eigenvalue of $D$, give
  #[#set math.equation(numbering: n => "(3.23)")
   $ c_sigma integral_0^oo t^beta F_0 \( t \, D \) thin d t = 1 / p "tr" \( D^p \) . $ <eq:trace-F0-integral>]
  For $R = R \( t \) > 0$, the Hilbert–Schmidt square
  #[#set math.equation(numbering: n => "(3.24)")
   $ cal(D)_D \( t \) & := parallel R^(- 1 \/ 2) - R^(1 \/ 2) \( t I + D \)^(1 \/ 2) #scale(x: 120%, y: 120%)[parallel]_(upright("HS"))^2\
 & = "tr" #scale(x: 120%, y: 120%)[\(] R^(- 1) + R \( t I + D \) - 2 \( t I + D \)^(1 \/ 2) #scale(x: 120%, y: 120%)[\)] gt.eq 0 $ <eq:trace-square>]
  is valid without a commutation assumption. Indeed the cross term is $"tr" \( t I + D \)^(1 \/ 2)$ because the adjacent factors $R^(- 1 \/ 2) R^(1 \/ 2)$ cancel, while cyclicity puts the remaining quadratic term in the form $"tr" \( R \( t I + D \) \)$. Using the definitions of $P \, G \, F_0$, the same square reads
  $ cal(D)_D \( t \) = G \( t \) - "tr" \( P \( t \) D \) + F_0 \( t \, D \) . $
  All three terms on the right are integrable against $t^beta thin d t$, by (3.7), (3.19), and (3.23). Hence
  #[#set math.equation(numbering: n => "(3.25)")
   $ c_sigma integral_0^oo t^beta G \( t \) thin d t = "tr" \( N D \) - 1 / p "tr" \( D^p \) + c_sigma integral_0^oo t^beta cal(D)_D \( t \) thin d t . $ <eq:trace-duality>]
  Now assume $N gt.eq 0$ and choose $D = N^(1 \/ sigma)$. Since $p = 1 + sigma$ and $q = p \/ sigma$, we have
  $ "tr" \( N D \) - 1 / p "tr" \( D^p \) = 1 / q "tr" \( N^q \) . $
  Combining (3.25) with (3.22) gives the exact deficit formula
  #[#set math.equation(numbering: n => "(3.26)")
   $ "tr" \( N V \) - "tr" \( N^q \) = c_sigma integral_0^oo t^beta #scale(x: 120%, y: 120%)[\(] "tr" \( R \( t \) Z \( t \)^2 \) + q thin cal(D)_(N^(1 \/ sigma)) \( t \) #scale(x: 120%, y: 120%)[\)] thin d t . $ <eq:trace-deficit>]
  Both integrands are nonnegative, proving (3.6). ◻
]

#prodef([Remark 3.3.])[
  If $B$ and $V$ commute, condition (3.3) implies $V gt.eq b I$, and simultaneous diagonalization gives $R \( t \) = \( t I + V \)^(- 1 \/ 2)$ and $N = V^sigma$. Then $Z = 0$ and $cal(D)_(N^(1 \/ sigma)) = 0$, so (3.26) vanishes. In general the two nonnegative terms in that formula retain the comparison despite the absence of a common eigenbasis.
] <rem:trace-commuting>

== 4 A regularized matrix field <sec:field>

Fix a positive diagonal matrix $K = "diag" \( k_1 \, dots.h \, k_n \)$ from the finite-interval action problem, and put $kappa = max_i k_i$. We construct a field $M_delta$ on $"Sym"_n$, the real vector space of symmetric $n times n$ matrices, and a scalar primitive $J_delta$ for its negative. The difference $J_delta \( - K \) - J_delta \( K \)$ will give the boundary contribution in the action argument. The other required property is a lower bound for $"tr" \( M_delta \( B \) \( K^2 - B^2 \) \)$ whenever $M_delta \( B \)$ is positive semidefinite. The trace comparison of Theorem 3 will supply this bound.

The construction of the field and its primitive, together with the scalar directional estimates, follows [11] Section 3. We use a resolvent normalization that identifies the field directly with the integrated matrix in Theorem 3; this gives the comparison for positive values of arbitrary rank in Proposition 8.

Throughout this section $delta > 0$ is fixed. We use the parameters $0 < sigma < 1$, $p = 1 + sigma$, $q = 1 + 1 \/ sigma$, and $beta = sigma - 1 \/ 2$, and the normalization $c_sigma$ from (3.1).

=== 4.1 Construction and regularity <construction-and-regularity>

For $y gt.eq 0$, define

#[#set math.equation(numbering: n => "(4.1)")
 $ f_delta \( y \) = c_sigma / pi integral_0^oo t^beta (frac(1, t + delta) - frac(1, t + delta + y)) thin d t . $ <eq:field-f>]

For $y < 0$, set $f_delta \( y \) = f'_delta \( 0 \) y$, the tangent-line extension at zero. Differentiation under the integral and the change of variable $t = \( y + delta \) u$ give

#[#set math.equation(numbering: n => "(4.2)")
 $ f'_delta \( y \) = a_sigma \( y + delta \)^(beta - 1) \, #h(2em) a_sigma = c_sigma / pi integral_0^oo frac(u^beta, \( 1 + u \)^2) thin d u > 0 quad \( y gt.eq 0 \) . $ <eq:field-f-derivative>]

The integrals converge because $- 1 \/ 2 < beta < 1 \/ 2$. Thus $f_delta$ is $C^1$, strictly increasing, and concave on $bb(R)$. Its extension permits us to apply it to every real symmetric matrix, including matrices with negative eigenvalues.

For $s in bb(R)$ and $B in "Sym"_n$, let

#[#set math.equation(numbering: n => "(4.3)")
 $ Q_s \( B \) = s^2 I - 2 s B + K^2 . $ <eq:field-Q>]

We define the field by a symmetric improper integral:

#[#set math.equation(numbering: n => "(4.4)")
 $ M_delta \( B \) = lim_(r arrow.r oo) integral_(- r)^r #scale(x: 120%, y: 120%)[\(] f_delta \( Q_s \( B \) \) - f_delta \( s^2 \) I #scale(x: 120%, y: 120%)[\)] thin d s . $ <eq:field-M>]

The symmetric cutoff cancels the leading term that is odd in $s$. The next lemma makes this cancellation quantitative and provides the primitive used in the action identity.

#thm([Lemma 4.1.])[
  #emph[The limit in (4.4) exists locally uniformly on $"Sym"_n$, and $M_delta : "Sym"_n arrow.r "Sym"_n$ is locally Lipschitz. There is a $C^1$ function $J_delta : "Sym"_n arrow.r bb(R)$, which we normalize by $J_delta \( 0 \) = 0$, such that 
#[#set math.equation(numbering: n => "(4.5)")
 $ d J_delta \( B \) \[ H \] = - "tr" \( M_delta \( B \) H \) #h(2em) \( B \, H in "Sym"_n \) . $ <eq:field-primitive>]

]
] <lem:field-regularity>

#proof[
  We first recall a useful estimate for the Hilbert–Schmidt norm. If $h$ is scalar Lipschitz on an interval containing the spectra of Hermitian matrices $X$ and $Y$, then
  #[#set math.equation(numbering: n => "(4.6)")
   $ parallel h \( X \) - h \( Y \) parallel_(upright("HS")) lt.eq "Lip" \( h \) parallel X - Y parallel_(upright("HS")) . $ <eq:field-HS-calculus>]
  Indeed, in eigenbases $\( e_i \)$ of $X$ and $\( v_j \)$ of $Y$, the $\( i \, j \)$ entries of these two differences are respectively $\( h \( lambda_i \) - h \( nu_j \) \) chevron.l e_i \, v_j chevron.r$ and $\( lambda_i - nu_j \) chevron.l e_i \, v_j chevron.r$. The scalar Lipschitz bound, followed by summation of their squared absolute values, proves (4.6).
  Restrict $B$ to a bounded set. For sufficiently large $\| s \|$, the spectrum of $E_s \( B \) = - 2 s B + K^2$ lies in $\[ - a \| s \| \, a \| s \| \]$, with a constant $a$ independent of $B$. On this interval put
  $ h_s \( y \) = f_delta \( s^2 + y \) - f_delta \( s^2 \) - f'_delta \( s^2 \) y . $
  By (4.2),
  $ sup_(\| y \| lt.eq a \| s \|) \| h'_s \( y \) \| = O \( \| s \|^(2 beta - 3) \) . $
  Here the arguments $s^2 + y$ are positive for large $\| s \|$, so the derivative formula applies. Since $h_s \( 0 \) = 0$ and $parallel E_s \( B \) parallel_(upright("HS")) = O \( \| s \| \)$, (4.6) gives
  #[#set math.equation(numbering: n => "(4.7)")
   $ f_delta \( Q_s \( B \) \) - f_delta \( s^2 \) I = - 2 s f'_delta \( s^2 \) B + T_s \( B \) \, $ <eq:field-tail>]
  where, uniformly on the chosen bounded set,
  $ parallel T_s \( B \) parallel_(upright("HS")) = O \( \| s \|^(2 beta - 2) \) \, #h(2em) parallel T_s \( B_1 \) - T_s \( B_2 \) parallel_(upright("HS")) lt.eq C \| s \|^(2 beta - 2) parallel B_1 - B_2 parallel_(upright("HS")) . $
  For the first bound, include the term $f'_delta \( s^2 \) K^2$ in $T_s$; for the second, use $E_s \( B_1 \) - E_s \( B_2 \) = - 2 s \( B_1 - B_2 \)$. The first term in (4.7) integrates to zero on $\[ - r \, r \]$, while $2 beta - 2 = 2 sigma - 3 < - 1$ makes both remainder bounds integrable at infinity. On bounded $s$-intervals, (4.6) and the scalar Lipschitz bound on $f_delta$ give local Lipschitz continuity directly. This proves the convergence and regularity assertions.
  To construct the primitive, choose $g_delta$ with $g'_delta = f_delta$. The trace differentiation formula is
  $ d #scale(x: 120%, y: 120%)[\(] "tr" g_delta \( X \) #scale(x: 120%, y: 120%)[\)] \[ H \] = "tr" \( f_delta \( X \) H \) . $
  It follows first for polynomials by cyclicity of the trace and then for $g_delta$ by polynomial approximation in $C^1$ on compact intervals containing the relevant spectra. For $s eq.not 0$, the function
  $ B mapsto frac("tr" #scale(x: 120%, y: 120%)[\(] g_delta \( Q_s \( B \) \) - g_delta \( K^2 \) #scale(x: 120%, y: 120%)[\)], 2 s) + f_delta \( s^2 \) "tr" B $
  therefore has differential $- "tr" \( \( f_delta \( Q_s \( B \) \) - f_delta \( s^2 \) I \) H \)$. At $s = 0$ the field is constant and has a linear primitive. It follows that the integral of the negative field around every piecewise smooth closed curve is zero at each finite cutoff in (4.4). Local uniform convergence passes this identity to $M_delta$. Path integration on the vector space $"Sym"_n$ now defines $J_delta$, with (4.5); continuity of $M_delta$ gives $J_delta in C^1$. ◻
]

=== 4.2 Scalar shifts, matrix directions, and endpoints <scalar-shifts-matrix-directions-and-endpoints>

The scalar function associated with the field is

#[#set math.equation(numbering: n => "(4.8)")
 $ mu_delta \( z \) = integral_(bb(R)) #scale(x: 120%, y: 120%)[\(] f_delta \( s^2 + z \) - f_delta \( s^2 \) #scale(x: 120%, y: 120%)[\)] thin d s \, #h(2em) z in bb(R) . $ <eq:field-mu>]

This integral is absolutely convergent: on bounded sets of $z$, its integrand and its Lipschitz constant in $z$ are $O \( \| s \|^(2 beta - 2) \)$ at infinity. Consequently $mu_delta$ is locally Lipschitz. Strict increase of $f_delta$ implies that $mu_delta$ is strictly increasing, and $mu_delta \( 0 \) = 0$. For $z gt.eq 0$, Tonelli’s theorem and $pi^(- 1) integral_(bb(R)) \( s^2 + a \)^(- 1) thin d s = a^(- 1 \/ 2)$ give

#[#set math.equation(numbering: n => "(4.9)")
 $ mu_delta \( z \) & = c_sigma integral_0^oo t^beta #scale(x: 120%, y: 120%)[\(] \( t + delta \)^(- 1 \/ 2) - \( t + delta + z \)^(- 1 \/ 2) #scale(x: 120%, y: 120%)[\)] thin d t\
 & = \( z + delta \)^sigma - delta^sigma . $ <eq:field-mu-positive>]

The last equality is the difference of (3.2) at $y = delta + z$ and $y = delta$.

We will also translate $s$ inside the first term of (4.8). To justify this when the individual terms are not integrable, fix $z in bb(R)$ and set $F_z \( s \) = f_delta \( s^2 + z \)$. This function is even, and

$ F'_z \( s \) = O \( \| s \|^(2 beta - 1) \) arrow.r 0 quad upright("as ") \| s \| arrow.r oo . $

For a fixed $a in bb(R)$ and $r > \| a \|$, evenness gives the bound

$ lr(|integral_(- r)^r #scale(x: 120%, y: 120%)[\(] F_z \( s - a \) - F_z \( s \) #scale(x: 120%, y: 120%)[\)] thin d s|) lt.eq \| a \|^2 sup_(r - \| a \| lt.eq u lt.eq r + \| a \|) \| F'_z \( u \) \| . $

For example, when $a gt.eq 0$, the difference consists of the integral over $\[ r \, r + a \]$ minus the integral over $\[ r - a \, r \]$; pairing these intervals proves the estimate. Its right-hand side tends to zero. Thus

#[#set math.equation(numbering: n => "(4.10)")
 $ lim_(r arrow.r oo) integral_(- r)^r #scale(x: 120%, y: 120%)[\(] f_delta \( \( s - a \)^2 + z \) - f_delta \( s^2 \) #scale(x: 120%, y: 120%)[\)] thin d s = mu_delta \( z \) . $ <eq:field-shift>]

These scalar identities control the field in each matrix direction. They also identify its primitive on the diagonal matrices, where the two endpoints $K$ and $- K$ lie.

#thm([Lemma 4.2.])[
  #emph[For every $B in "Sym"_n$ and every real unit vector $e$, 
#[#set math.equation(numbering: n => "(4.11)")
 $ e^(sans(T)) M_delta \( B \) e lt.eq mu_delta #scale(x: 120%, y: 120%)[\(] e^(sans(T)) K^2 e - \( e^(sans(T)) B e \)^2 #scale(x: 120%, y: 120%)[\)] . $ <eq:field-jensen>]

 For a standard basis vector $e_i$ and $y in bb(R)$, 
#[#set math.equation(numbering: n => "(4.12)")
 $ B e_i = y e_i quad arrow.r.double quad M_delta \( B \) e_i = mu_delta \( k_i^2 - y^2 \) e_i . $ <eq:field-coordinate>]

 If $S$ is a diagonal matrix with diagonal entries in ${ 1 \, - 1 }$, then 
#[#set math.equation(numbering: n => "(4.13)")
 $ M_delta \( S B S \) = S M_delta \( B \) S . $ <eq:field-equivariance>]

 Finally, 
#[#set math.equation(numbering: n => "(4.14)")
 $ J_delta \( - K \) - J_delta \( K \) = sum_(i = 1)^n integral_(- k_i)^(k_i) mu_delta \( k_i^2 - s^2 \) thin d s . $ <eq:field-endpoints>]

]
] <lem:field-properties>

#proof[
  Scalar concavity, applied in an orthonormal eigenbasis of $Q_s \( B \)$, gives
  $ e^(sans(T)) f_delta \( Q_s \( B \) \) e lt.eq f_delta \( e^(sans(T)) Q_s \( B \) e \) . $
  Set $a = e^(sans(T)) B e$ and $z = e^(sans(T)) K^2 e - a^2$. Then $e^(sans(T)) Q_s \( B \) e = \( s - a \)^2 + z$. Subtract $f_delta \( s^2 \)$, integrate over $\[ - r \, r \]$, and use (4.10) to obtain (4.11).
  If $B e_i = y e_i$, the vector $e_i$ is also an eigenvector of $Q_s \( B \)$, with eigenvalue $\( s - y \)^2 + k_i^2 - y^2$. Functional calculus and (4.10) prove (4.12). For (4.13), use $S K^2 S = K^2$ to obtain $Q_s \( S B S \) = S Q_s \( B \) S$, and then conjugate inside (4.4).
  On the diagonal subspace, (4.12) and (4.5) give
  $ d J_delta \( "diag" \( b_1 \, dots.h \, b_n \) \) = - sum_(i = 1)^n mu_delta \( k_i^2 - b_i^2 \) thin d b_i . $
  Integrating from $\( k_1 \, dots.h \, k_n \)$ to $\( - k_1 \, dots.h \, - k_n \)$ within this subspace proves (4.14). ◻
]

=== 4.3 The trace estimate at positive values of the field <the-trace-estimate-at-positive-values-of-the-field>

We have constructed a locally Lipschitz field and computed the boundary difference of its primitive. It remains to connect this field with Theorem 3. Positivity of $M_delta \( B \)$ will imply positivity of every $Q_s \( B \)$, making the resolvent representation available even though $K^2 - B^2$ can be indefinite.

#thm([Proposition 4.3.])[
  #emph[For every $B in "Sym"_n$ such that $M_delta \( B \) gt.eq 0$, 
#[#set math.equation(numbering: n => "(4.15)")
 $ "tr" #scale(x: 120%, y: 120%)[\(] M_delta \( B \) \( K^2 - B^2 \) #scale(x: 120%, y: 120%)[\)] gt.eq "tr" #scale(x: 120%, y: 120%)[\(] M_delta \( B \)^q #scale(x: 120%, y: 120%)[\)] - E_delta \, #h(2em) E_delta = n #scale(x: 120%, y: 120%)[\(] delta kappa^(2 sigma) + delta^sigma \( kappa^2 + delta \) #scale(x: 120%, y: 120%)[\)] . $ <eq:field-error>]

 In particular, $E_delta arrow.r 0$ as $delta arrow.b 0$ for fixed $K$.]
] <prop:field-comparison>

#proof[
  Write $M = M_delta \( B \)$. By (4.11), its positivity and the strict increase of $mu_delta$ imply
  $ e^(sans(T)) K^2 e gt.eq \( e^(sans(T)) B e \)^2 #h(2em) upright("for every real unit vector ") e . $
  Consequently
  $ e^(sans(T)) Q_s \( B \) e = \( s - e^(sans(T)) B e \)^2 + e^(sans(T)) K^2 e - \( e^(sans(T)) B e \)^2 gt.eq 0 \, $
  and hence $Q_s \( B \) gt.eq 0$ for all $s in bb(R)$. This is positivity also on $bb(C)^n$: for $z = u + i v$ with real $u \, v$, symmetry gives $z^(*) Q_s \( B \) z = u^(sans(T)) Q_s \( B \) u + v^(sans(T)) Q_s \( B \) v$. The same directional estimate, together with (4.9), gives
  #[#set math.equation(numbering: n => "(4.16)")
   $ 0 lt.eq M lt.eq mu_delta \( kappa^2 \) I lt.eq kappa^(2 sigma) I . $ <eq:field-M-bound>]
  The last inequality uses $\( a + b \)^sigma lt.eq a^sigma + b^sigma$ for $a \, b gt.eq 0$ and $0 < sigma < 1$.
  Put
  $ D = K^2 - B^2 \, #h(2em) V = D + delta I \, #h(2em) Y_s = \( s I - B \)^2 . $
  Then $X_s = Y_s + V = Q_s \( B \) + delta I gt.eq delta I$ satisfies the hypothesis of Theorem 3. Let $R \( t \)$ and $N$ be its resolvent average and integrated matrix, as defined in (3.4) and (3.5). We claim that
  #[#set math.equation(numbering: n => "(4.17)")
   $ N = M + delta^sigma I . $ <eq:field-N>]
  Diagonalize $B$ and apply (4.10) with $z = 0$ to each diagonal entry. This allows $f_delta \( s^2 \) I$ in (4.4) to be replaced by $f_delta \( Y_s \)$. Both $Q_s \( B \)$ and $Y_s$ are positive semidefinite, so (4.1) expresses the resulting difference as
  $ c_sigma / pi integral_0^oo t^beta (\( Y_s + \( t + delta \) I \)^(- 1) - \( Q_s \( B \) + \( t + delta \) I \)^(- 1)) thin d t . $
  For fixed $B$ and $delta > 0$, positivity and quadratic growth in $s$ give a common lower bound $c \( 1 + t + s^2 \) I$ for the two matrices being inverted. Their difference before inversion is the constant matrix $D$. The resolvent identity therefore bounds the norm of the weighted difference by
  $ C parallel D parallel_(upright("op")) thin t^beta \( 1 + t + s^2 \)^(- 2) . $
  This is integrable on $\( 0 \, oo \) times bb(R)$: integration in $s$ leaves a constant times $t^beta \( 1 + t \)^(- 3 \/ 2)$, integrable because $- 1 < beta < 1 \/ 2$. Fubini’s theorem now yields
  $ M = c_sigma integral_0^oo t^beta #scale(x: 120%, y: 120%)[\(] \( t + delta \)^(- 1 \/ 2) I - R \( t \) #scale(x: 120%, y: 120%)[\)] thin d t . $
  Subtract this identity from the definition of $N$ and apply (3.2) with $y = delta$. This proves (4.17).
  In particular $N gt.eq 0$, so Theorem 3 applies and gives
  $ "tr" \( M D \) & = "tr" \( N V \) - delta "tr" M - delta^sigma "tr" V\
 & gt.eq "tr" \( N^q \) - delta "tr" M - delta^sigma "tr" V . $
  Because $N = M + delta^sigma I$, the matrices $N$ and $M$ have a common eigenbasis and $"tr" \( N^q \) gt.eq "tr" \( M^q \)$. Equation (4.16) bounds $"tr" M$ by $n kappa^(2 sigma)$, while $V = K^2 - B^2 + delta I lt.eq \( kappa^2 + delta \) I$ bounds $"tr" V$ by $n \( kappa^2 + delta \)$. Substitution proves (4.15). ◻
]

In particular, if a matrix $A in bb(R)^(n times d)$ satisfies $M_delta \( B \) = A A^(sans(T))$, then Proposition 8 controls the nonlinear term $"tr" \( \( A A^(sans(T)) \)^q \)$ in the action. The next section constructs the connecting paths. In Section 6, their action identities penalize the squared residual $parallel M_delta \( B \) - A A^(sans(T)) parallel_(upright("HS"))^2$ by a factor tending to infinity. Compactness of pairs of matrices then reduces the estimate to the exact constraint.

== 5 A matrix path with prescribed endpoints <sec:paths>

The construction in this section adapts the connecting-path argument of [11] Proposition 5.1 to a rectangular matrix $A$. The action estimate uses a path from $K$ to $- K$ and penalizes failure of $M_delta \( B \) = A A^(sans(T))$, with $A = C U$ and $C$ lower triangular. For a penalty parameter $epsilon > 0$, we prescribe the difference $M_delta \( B \) - A A^(sans(T))$ as $epsilon B'$ through an ordinary differential equation and choose $C$ to obtain the second endpoint. The choice is made by continuation and boundary parity. At the initial parameter there is exactly one solution after identifying matrices that differ by row signs. If no terminal solution existed, smoothing and a small perturbation respecting these signs would produce a quotient zero set that is a finite disjoint union of circles and intervals, with exactly one boundary point. Circles have no boundary and intervals contribute two boundary points, giving a contradiction.

As in Section 2, $cal(L)$ is the vector space of real lower triangular $n times n$ matrices. Set $kappa = max_i k_i$.

#thm([Proposition 5.1.])[
  (Connecting paths).  #emph[Let $n \, d gt.eq 1$, let $Omega = \( x_(-) \, x_(+) \)$ be a bounded interval, and let $K = "diag" \( k_1 \, dots.h \, k_n \)$ with $k_i > 0$. Suppose $U in H_0^1 \( Omega \; bb(R)^(n times d) \)$ satisfies 
$ integral_Omega U U^(sans(T)) thin d x = I_n . $

 For every $delta > 0$ and $epsilon > 0$, there are $C_epsilon in cal(L)$ and $B_epsilon in C^1 \( overline(Omega) \; "Sym"_n \)$ such that, with $A_epsilon = C_epsilon U$, 
#[#set math.equation(numbering: n => "(5.1)")
 $ epsilon B'_epsilon = M_delta \( B_epsilon \) - A_epsilon A_epsilon^(sans(T)) \, #h(2em) B_epsilon \( x_(-) \) = K \, #h(2em) B_epsilon \( x_(+) \) = - K . $ <eq:path-ode>]

 These choices satisfy 
#[#set math.equation(numbering: n => "(5.2)")
 $ sup_(x in overline(Omega)) parallel B_epsilon \( x \) parallel_(upright("op")) lt.eq kappa \, #h(2em) sup_(0 < epsilon lt.eq 1) parallel C_epsilon parallel_(upright("HS")) < oo \, $ <eq:path-bounds>]

 where the second bound is for fixed $delta$, $K$, and $Omega$.]
] <prop:paths>

#proof[
  Fix $delta > 0$. We use the continuous representative of $U$, available because the interval is bounded and $U in H^1$. Choose a smooth nonnegative function $chi$ on $"Sym"_n$, of compact support, which is one on ${ B : parallel B parallel_(upright("op")) lt.eq kappa }$ and is invariant under conjugation by diagonal sign matrices. Such a cutoff can be obtained from any cutoff of a neighborhood of this compact set by averaging over the finitely many sign matrices. By Lemma 6, the field
  $ hat(M)_delta \( B \) = chi \( B \) M_delta \( B \) $
  is bounded and globally Lipschitz.
  #emph[The endpoint map.] For fixed $epsilon > 0$, $C in cal(L)$, and $0 lt.eq theta lt.eq 1$, solve the initial-value problem
  #[#set math.equation(numbering: n => "(5.3)")
   $ epsilon B' = theta hat(M)_delta \( B \) - \( C U \) \( C U \)^(sans(T)) \, #h(2em) B \( x_(-) \) = K \, $ <eq:path-homotopy>]
  and define
  $ Phi \( C \, theta \) = B \( x_(+) \) + K in "Sym"_n . $
  The bounded Lipschitz field and the continuous forcing give a unique $C^1$ solution on the whole interval. Continuous dependence on the parameters makes $Phi$ continuous. A zero of $Phi \( dot.op \, 1 \)$ gives the required endpoints; we will then show that its path remains where $chi = 1$.
  Let $cal(G)$ be the group of diagonal matrices whose entries are $plus.minus 1$. It acts on $cal(L)$ by $C mapsto S C$ and on $"Sym"_n$ by $B mapsto S B S$. The field is equivariant under these actions by (4.13), and $S K S = K$. Uniqueness in (5.3) therefore gives
  #[#set math.equation(numbering: n => "(5.4)")
   $ Phi \( S C \, theta \) = S Phi \( C \, theta \) S #h(2em) \( S in cal(G) \) . $ <eq:path-equivariance>]
  All zeros of this endpoint map lie in a bounded set. Indeed, integrating (5.3) at a zero and using the orthonormality of the rows of $U$ yields
  #[#set math.equation(numbering: n => "(5.5)")
   $ C C^(sans(T)) = 2 epsilon K + theta integral_Omega hat(M)_delta \( B \( x \) \) thin d x . $ <eq:path-integrated>]
  Consequently, for $0 < epsilon lt.eq 1$,
  #[#set math.equation(numbering: n => "(5.6)")
   $ parallel C parallel_(upright("HS"))^2 lt.eq 2 "tr" K + n \| Omega \| sup_(B in "Sym"_n) parallel hat(M)_delta \( B \) parallel_(upright("op")) . $ <eq:path-C-bound>]
  For each fixed $epsilon > 0$, the same calculation gives a finite bound. Thus the joint zero set ${ \( C \, theta \) : Phi \( C \, theta \) = 0 }$ is compact.
  The sign action is #emph[free] at every such zero: only the identity sign matrix fixes $C$. To prove this, it suffices to show that no row of $C$ vanishes. If row $i$ vanished, the reflection $S_i$ that changes only its sign would fix $C$. Equivariance and uniqueness would then force $S_i B \( x \) S_i = B \( x \)$, so that $B \( x \) e_i = y \( x \) e_i$ for a scalar function $y$. The coordinate identity (4.12) would give
  $ epsilon y' = theta chi \( B \( x \) \) mu_delta \( k_i^2 - y^2 \) \, #h(2em) y \( x_(-) \) = k_i . $
  Here $chi \( B \( x \) \)$ is a fixed continuous coefficient. Since $mu_delta$ is locally Lipschitz and $mu_delta \( 0 \) = 0$, uniqueness for this scalar equation gives $y equiv k_i$. This contradicts the terminal condition $y \( x_(+) \) = - k_i$.
  At $theta = 0$ the endpoint map is explicit:
  #[#set math.equation(numbering: n => "(5.7)")
   $ Phi \( C \, 0 \) = 2 K - epsilon^(- 1) C C^(sans(T)) . $ <eq:path-initial>]
  Its zeros in $cal(L)$ are precisely
  $ C = "diag" \( d_1 \, dots.h \, d_n \) \, #h(2em) d_i = plus.minus sqrt(2 epsilon k_i) . $
  For example, the first row of $C C^(sans(T)) = 2 epsilon K$ determines $d_1$ and forces the remaining entries in the first column of $C$ to vanish; induction gives the claim. These $2^n$ zeros form one orbit under $cal(G)$. Each is a regular zero, meaning that the derivative with respect to $C$ is onto $"Sym"_n$. In fact, for a lower triangular variation $H$, this derivative has diagonal entries $- 2 epsilon^(- 1) d_i H_(i i)$ and entries $- epsilon^(- 1) d_j H_(i j)$ when $i > j$. It is therefore an isomorphism between vector spaces of dimension $n \( n + 1 \) \/ 2$.
  #emph[Continuation after identifying row signs.] We have a compact zero set, lying entirely where the sign action is free, and a single regular zero at the initial parameter after taking the quotient by that action. We now show that these properties force a zero at $theta = 1$. The details below replace the continuous endpoint map by a smooth one, so no differentiability of the ODE flow with respect to $C$ is required.
  Suppose, to the contrary, that $Phi \( C \, 1 \)$ never vanishes. Compactness allows us to choose a bounded invariant open set $O subset cal(L)$ containing the $C$-projection of every zero, with $overline(O)$ contained in the open set where all rows are nonzero. There is then a positive lower bound for $parallel Phi parallel_(upright("HS"))$ on
  #[#set math.equation(numbering: n => "(5.8)")
   $ \( partial O times \[ 0 \, 1 \] \) med union med \( overline(O) times { 1 } \) . $ <eq:path-gap-set>]
  Reparametrize $theta$ by a smooth map $rho : \[ 0 \, 1 \] arrow.r \[ 0 \, 1 \]$ that equals zero near $0$ and has $rho \( 1 \) = 1$. The resulting map $F \( C \, theta \) = Phi \( C \, rho \( theta \) \)$ agrees with the smooth map (5.7) on an initial collar, that is, for all $0 lt.eq theta lt.eq a$ with some $a > 0$. It retains a positive gap on (5.8).
  Approximate $F$ uniformly on $overline(O) times \[ 0 \, 1 \]$ by a smooth equivariant map $Psi$ that still equals (5.7) on a smaller initial collar. Here is a direct construction. Extend $F$ constantly in $theta$ outside $\[ 0 \, 1 \]$, smooth by convolution in the finite-dimensional variables, and use a smooth function of $theta$ to splice the approximation to $F \( C \, 0 \)$ inside its initial collar. Averaging the result in the form
  $ frac(1, \| cal(G) \|) sum_(S in cal(G)) S Psi_0 \( S C \, theta \) S $
  makes it equivariant. Uniform approximation can be as close as needed, so the positive gap persists.
  We next make zero a regular value in the interior by a small equivariant perturbation. The freeness of the action on $overline(O)$ is exactly what permits this step. Around any $C_0 in overline(O)$, choose a ball whose translates by distinct sign matrices are disjoint, and a smooth bump function $b$ supported in that ball with $b \( C_0 \) = 1$. For $H in "Sym"_n$, the map
  $ V_H \( C \) = sum_(S in cal(G)) b \( S C \) S H S $
  is smooth and equivariant, and $V_H \( C_0 \) = H$. Taking $H$ in a basis of $"Sym"_n$ gives maps whose values span the target near $C_0$. A finite covering of $overline(O)$ therefore supplies smooth equivariant maps $V_1 \, dots.h \, V_N$ whose values span $"Sym"_n$ at every point of $overline(O)$. The action on the target need not be free: the disjoint supports in the domain allow an arbitrary target value at a representative of each orbit.
  Choose a smooth function $h : \[ 0 \, 1 \] arrow.r \[ 0 \, oo \)$ that vanishes near $0$ and is positive thereafter, with its zero set contained in the collar where $Psi \( C \, theta \) = Phi \( C \, 0 \)$. For a parameter $alpha = \( alpha_1 \, dots.h \, alpha_N \) in bb(R)^N$, put
  $ Psi_alpha \( C \, theta \) = Psi \( C \, theta \) + h \( theta \) sum_(j = 1)^N alpha_j V_j \( C \) . $
  Restrict $alpha$ to a sufficiently small open ball about zero so that the gap on (5.8) remains. At an interior zero of the map of all three variables $\( C \, theta \, alpha \)$, its differential is onto: if $h \( theta \) > 0$, the parameter directions span the target; if $h \( theta \) = 0$, the derivative in $C$ is the isomorphism already computed for (5.7).
  The interior zero set of this parameter family is thus a smooth manifold. Apply Sard’s theorem [13] to its projection onto the parameter ball. For a regular value $alpha$ of this projection, zero is a regular value of $\( C \, theta \) mapsto Psi_alpha \( C \, theta \)$. To see the implication, write the differential of the parameter family as $\( L_1 \, L_2 \)$ in the $\( C \, theta \)$ and $alpha$ directions. Surjectivity of the differential of the projection means that, for every $w$, there is a $v$ with $L_1 v + L_2 w = 0$. Thus $"ran" L_2 subset "ran" L_1$; since $\( L_1 \, L_2 \)$ is onto, $L_1$ is onto as well. Sard’s theorem supplies such parameters arbitrarily close to zero.
  For this choice of $alpha$, the zero set of $Psi_alpha$ in $O times \[ 0 \, 1 \]$ is a compact smooth one-dimensional manifold with boundary. Its dimension follows from $dim cal(L) = dim "Sym"_n$. There are no zeros on (5.8), and near $theta = 0$ the map is the initial map, independent of $theta$, with invertible derivative in $C$. The boundary therefore consists precisely of the $2^n$ initial zeros.
  The sign group acts freely on this manifold. Its quotient is again a compact one-dimensional manifold with boundary: around each point, choose a neighborhood disjoint from its nontrivial translates, so that the quotient has the same local interval or half-interval coordinate. All initial zeros belong to one orbit, so the quotient has exactly one boundary point. This is impossible. Every compact one-dimensional manifold is a finite disjoint union of circles and closed intervals, and hence has an even number of boundary points. The contradiction proves that the original map $Phi \( dot.op \, 1 \)$ has a zero. This is the usual regular-value proof of invariance of parity, applied after quotienting by row signs; see also [10] Sections 2–4.
  #emph[Confinement of the path.] Let $C$ and $B$ be given by such a zero. For any fixed real unit vector $e$, set $y \( x \) = e^(sans(T)) B \( x \) e$. By (4.11), whenever $\| y \( x \) \| > kappa$,
  $ e^(sans(T)) M_delta \( B \( x \) \) e lt.eq mu_delta #h(-0.16667em) (e^(sans(T)) K^2 e - y \( x \)^2) < 0 . $
  Since $chi gt.eq 0$ and $\( C U \) \( C U \)^(sans(T)) gt.eq 0$, the differential equation gives $y' \( x \) lt.eq 0$ on this set. Both endpoint values of $y$ lie in $\[ - kappa \, kappa \]$. A connected interval on which $y > kappa$ cannot begin at the level $kappa$ while $y$ is nonincreasing. Likewise, an interval on which $y < - kappa$ cannot end at the level $- kappa$ while $y$ is nonincreasing. The first endpoint excludes the former excursion, and the second endpoint excludes the latter. Thus $\| e^(sans(T)) B \( x \) e \| lt.eq kappa$ for every unit vector $e$ and every $x$.
  It follows that $parallel B \( x \) parallel_(upright("op")) lt.eq kappa$ throughout the interval, so $chi \( B \( x \) \) = 1$ and (5.3) becomes (5.1). Finally, (5.6) gives the uniform bound on $C_epsilon$ in (5.2) for fixed $delta$. This completes the construction. ◻
]

== 6 The action bound <sec:action-limit>

We now prove Theorem 2 by combining the paths of Proposition 9 with the field comparison. This follows the action identity and penalty argument in [11] Section 6. The path equation produces a negative square in the action identity. As $epsilon$ tends to zero, this term forces any matrix values that could violate the desired bound toward the constraint $M_delta \( B \) = A A^(sans(T))$. At that constraint the field is positive semidefinite, so Proposition 8 applies.

#proof[
  Fix $delta > 0$ and, for each $0 < epsilon lt.eq 1$, choose $C_epsilon$, $A_epsilon = C_epsilon U$, and $B_epsilon$ as in Proposition 9. Temporarily suppress the subscript $epsilon$. Since $A in H_0^1$ and $B in C^1$, the function
  $ x mapsto J_delta \( B \( x \) \) + "tr" \( A \( x \)^(sans(T)) B \( x \) A \( x \) \) $
  is absolutely continuous. The primitive identity (4.5) and the path equation give, almost everywhere,
  $ #scale(x: 120%, y: 120%)[\(] J_delta \( B \) + "tr" \( A^(sans(T)) B A \) #scale(x: 120%, y: 120%)[\)]' & = 2 "tr" \( \( A' \)^(sans(T)) B A \) - "tr" #scale(x: 120%, y: 120%)[\(] \( M_delta \( B \) - A A^(sans(T)) \) B' #scale(x: 120%, y: 120%)[\)]\
 & = 2 "tr" \( \( A' \)^(sans(T)) B A \) - epsilon^(- 1) parallel M_delta \( B \) - A A^(sans(T)) parallel_(upright("HS"))^2\
 & lt.eq parallel A' parallel_(upright("HS"))^2 + "tr" \( B^2 A A^(sans(T)) \) - epsilon^(- 1) parallel M_delta \( B \) - A A^(sans(T)) parallel_(upright("HS"))^2 . $
  The last line is the Hilbert–Schmidt Cauchy–Schwarz inequality followed by $2 a b lt.eq a^2 + b^2$. Since $A$ vanishes at both endpoints, integration and the definition of the action yield
  #[#set math.equation(numbering: n => "(6.1)")
   $ J_delta \( - K \) - J_delta \( K \) lt.eq  & cal(E) \( A \) + integral_Omega #scale(x: 180%, y: 180%)[\[] "tr" #scale(x: 120%, y: 120%)[\(] \( A A^(sans(T)) \)^q #scale(x: 120%, y: 120%)[\)] - "tr" #scale(x: 120%, y: 120%)[\(] \( K^2 - B^2 \) A A^(sans(T)) #scale(x: 120%, y: 120%)[\)]\
 & #h(40mm)  - epsilon^(- 1) parallel M_delta \( B \) - A A^(sans(T)) parallel_(upright("HS"))^2 #scale(x: 180%, y: 180%)[\]] thin d x . $ <eq:action-penalty>]
  We next bound the integral uniformly as $epsilon arrow.b 0$. The bounds in (5.2), together with the boundedness of $U$, place all pairs
  $ \( A_epsilon \( x \) \, B_epsilon \( x \) \) \, #h(2em) x in overline(Omega) \, quad 0 < epsilon lt.eq 1 \, $
  in one compact set $cal(K)_delta subset bb(R)^(n times d) times "Sym"_n$. On this set define the continuous functions
  $ F \( A \, B \) & = "tr" #scale(x: 120%, y: 120%)[\(] \( A A^(sans(T)) \)^q #scale(x: 120%, y: 120%)[\)] - "tr" #scale(x: 120%, y: 120%)[\(] \( K^2 - B^2 \) A A^(sans(T)) #scale(x: 120%, y: 120%)[\)] \,\
r_delta \( A \, B \) & = parallel M_delta \( B \) - A A^(sans(T)) parallel_(upright("HS"))^2 . $
  If $r_delta \( A \, B \) = 0$, then $M_delta \( B \) = A A^(sans(T)) gt.eq 0$, and Proposition 8 gives $F \( A \, B \) lt.eq E_delta$. This is the only point at which positivity of the field is needed; the constructed paths themselves need not have this property.
  Compactness now implies
  #[#set math.equation(numbering: n => "(6.2)")
   $ limsup_(epsilon arrow.b 0) sup_(\( A \, B \) in cal(K)_delta) #scale(x: 120%, y: 120%)[\(] F \( A \, B \) - epsilon^(- 1) r_delta \( A \, B \) #scale(x: 120%, y: 120%)[\)] lt.eq E_delta . $ <eq:penalty-limit>]
  Indeed, a failure would give $eta > 0$, a sequence $epsilon_j arrow.b 0$, and points $\( A_j \, B_j \) in cal(K)_delta$ at which the expression exceeds $E_delta + eta$. Boundedness of $F$ then forces $r_delta \( A_j \, B_j \) = O \( epsilon_j \)$. A convergent subsequence has limit $\( A_(*) \, B_(*) \)$ with $r_delta \( A_(*) \, B_(*) \) = 0$ and, by continuity, $F \( A_(*) \, B_(*) \) gt.eq E_delta + eta$. This contradicts the preceding comparison.
  Apply (6.2) in (6.1), bound $cal(E) \( A_epsilon \)$ by the supremum over lower triangular $C$, and let $epsilon arrow.b 0$. We obtain
  #[#set math.equation(numbering: n => "(6.3)")
   $ J_delta \( - K \) - J_delta \( K \) lt.eq sup_(C in cal(L)) cal(E) \( C U \) + \| Omega \| E_delta . $ <eq:regularized-action-bound>]
  All compactness estimates so far were for fixed $delta$. This is sufficient: the supremum on the right is independent of $delta$, and the remaining limit concerns only the explicit endpoint values and the error term.
  By (4.14),
  $ J_delta \( - K \) - J_delta \( K \) = sum_(i = 1)^n integral_(- k_i)^(k_i) mu_delta \( k_i^2 - s^2 \) thin d s . $
  For $z gt.eq 0$, the formula $mu_delta \( z \) = \( z + delta \)^sigma - delta^sigma$ gives
  $ 0 lt.eq mu_delta \( z \) lt.eq z^sigma \, #h(2em) mu_delta \( z \) arrow.r z^sigma quad upright("as ") delta arrow.b 0 . $
  Dominated convergence therefore sends the endpoint difference to
  $ sum_(i = 1)^n integral_(- k_i)^(k_i) \( k_i^2 - s^2 \)^sigma thin d s . $
  The error $E_delta$ in (4.15) tends to zero. Letting $delta arrow.b 0$ in (6.3) proves the finite-interval action inequality. ◻
]

== 7 The spectral inequality and its sharp constant <sec:spectral>

We now apply Theorem 2 to finite families of negative eigenfunctions, following the spectral passage of the scalar companion [11] Section 7. The lower triangular coefficients in that theorem preserve the spectral bound on each successive span. A trace version of Young’s inequality then bounds the action by the potential integral. We first justify this passage for the measurable potentials in Theorem 1.

=== 7.1 The form domain and negative spectrum <the-form-domain-and-negative-spectrum>

#thm([Lemma 7.1.])[
  #emph[Let $m gt.eq 1$, let $p > 1$, and let $W : bb(R) arrow.r bb(C)^(m times m)$ be a measurable Hermitian positive semidefinite function satisfying $integral_(bb(R)) "tr" \( W^p \) < oo$. The form 
$ h_W \[ psi \] = integral_(bb(R)) parallel psi' parallel^2 - integral_(bb(R)) chevron.l psi \, W psi chevron.r \, #h(2em) psi in H^1 \( bb(R) \; bb(C)^m \) \, $

 is closed and bounded below. Multiplication by $W^(1 \/ 2)$ is compact from $H^1 \( bb(R) \; bb(C)^m \)$ to $L^2 \( bb(R) \; bb(C)^m \)$. The associated self-adjoint operator has only isolated eigenvalues of finite multiplicity below zero, with possible accumulation only at zero.]
] <lem:form-compactness>

#proof[
  Put $w \( x \) = parallel W \( x \) parallel_("op")$. Positivity gives $w^p lt.eq "tr" \( W^p \)$, so $w in L^p \( bb(R) \)$. The one-dimensional Sobolev estimate
  $ parallel psi parallel_oo^2 lt.eq 2 parallel psi parallel_2 parallel psi' parallel_2 $
  holds also for vector-valued functions, by applying the scalar estimate to their norm. Hölder’s inequality and interpolation therefore give
  #[#set math.equation(numbering: n => "(7.1)")
   $ integral_(bb(R)) chevron.l psi \, W psi chevron.r & lt.eq parallel w parallel_p parallel psi parallel_(2 p \/ \( p - 1 \))^2\
 & lt.eq 2^(1 \/ p) parallel w parallel_p parallel psi' parallel_2^(1 \/ p) parallel psi parallel_2^(2 - 1 \/ p)\
 & lt.eq epsilon parallel psi' parallel_2^2 + C_epsilon parallel psi parallel_2^2 #h(2em) \( epsilon > 0 \) . $ <eq:form-bound>]
  The last step is Young’s inequality. Consequently a sufficiently shifted form norm is equivalent to the $H^1$ norm. The potential form is continuous on $H^1$, so the form is closed and bounded below.
  For compactness, truncate the multiplier both in space and in size:
  $ T_(R \, L) psi = upright(bold(1))_({ \| x \| lt.eq R \, med w \( x \) lt.eq L }) W^(1 \/ 2) psi . $
  Restriction to $\[ - R \, R \]$ followed by the compact embedding $H^1 \( \[ - R \, R \] \; bb(C)^m \) arrow.r.hook L^2 \( \[ - R \, R \] \; bb(C)^m \)$ and bounded multiplication shows that $T_(R \, L)$ is compact. If $T psi = W^(1 \/ 2) psi$, Hölder’s inequality and the same Sobolev embedding imply
  $ parallel \( T - T_(R \, L) \) psi parallel_2^2 lt.eq C parallel w upright(bold(1))_({ \| x \| > R } union { w > L }) parallel_p parallel psi parallel_(H^1)^2 . $
  The coefficient tends to zero as $R \, L arrow.r oo$, proving that $T$ is compact.
  Finally, fix $a > 0$. If the spectral subspace of $H_W$ in $\( - oo \, - a \]$ were infinite-dimensional, it would contain an $L^2$-orthonormal sequence $\( psi_j \)$. Semiboundedness and the spectral theorem place this sequence in the form domain with uniformly bounded shifted form norm, hence uniformly bounded $H^1$ norm. A weakly convergent subsequence in $H^1$ has limit zero, because an orthonormal sequence converges weakly to zero in $L^2$. Compactness of $T$ would then give $parallel T psi_j parallel_2 arrow.r 0$, whereas
  $ - a gt.eq h_W \[ psi_j \] = parallel psi'_j parallel_2^2 - parallel T psi_j parallel_2^2 gt.eq - parallel T psi_j parallel_2^2 \, $
  a contradiction. Every such spectral subspace is therefore finite-dimensional, which proves the assertion about the negative spectrum. ◻
]

=== 7.2 From the action to spectral moments <from-the-action-to-spectral-moments>

#proof[
  Recall that $sigma = gamma - 1 / 2$, $p = 1 + sigma$ and $q = 1 + 1 \/ sigma$. We first prove the inequality for real symmetric potentials. If there are no negative eigenvalues, it is immediate. Otherwise fix any finite nonempty list of negative eigenvalues, respecting their multiplicities. Since complex conjugation preserves each eigenspace, we may choose corresponding orthonormal eigenfunctions $phi.alt_1 \, dots.h \, phi.alt_n$ that are real-valued.
  The action theorem requires functions supported on a bounded interval. Choose real smooth compactly supported approximations to the $phi.alt_i$ in $H^1$. Their Gram matrices converge to $I_n$, and their form matrices converge to the diagonal matrix of the selected eigenvalues, by (7.1). Multiplying each approximating family by the inverse square root of its Gram matrix makes its rows orthonormal without changing their common compact support. The form matrices still converge to the same diagonal matrix. For sufficiently good approximations they are negative definite; diagonalize them by a real orthogonal change of rows.
  For one such family, let $U in H_0^1 \( Omega \; bb(R)^(n times m) \)$ be the matrix whose rows are the resulting functions $u_i$, where the bounded interval $Omega$ contains their supports in its interior. Extend these rows by zero when evaluating the whole-line form. They satisfy
  $ integral_Omega U U^(sans(T)) = I_n \, #h(2em) h_W \[ u_i \, u_j \] = - k_i^2 delta_(i j) \, #h(2em) k_1 gt.eq dots.h.c gt.eq k_n > 0 \, $
  where $h_W \[ dot.op \, dot.op \]$ is the polarized form and the numbers $- k_i^2$ converge, along the approximations, to the selected eigenvalues in increasing order. Set $K = "diag" \( k_1 \, dots.h \, k_n \)$.
  Let $C$ be any real lower triangular matrix and write $A = C U$. Its $i$th row is $a_i = sum_(j lt.eq i) C_(i j) u_j$, so
  #[#set math.equation(numbering: n => "(7.2)")
   $ h_W \[ a_i \] + k_i^2 parallel a_i parallel_(L^2)^2 = sum_(j lt.eq i) C_(i j)^2 \( k_i^2 - k_j^2 \) lt.eq 0 . $ <eq:triangular-spectral-order>]
  Summing over $i$ bounds the quadratic terms of the action. Since $A A^(sans(T))$ and $A^(sans(T)) A$ have the same nonzero eigenvalues,
  #[#set math.equation(numbering: n => "(7.3)")
   $ cal(E) \( C U \) lt.eq integral_Omega { "tr" \( W A^(sans(T)) A \) - "tr" \( \( A^(sans(T)) A \)^q \) #scale(x: 120%, y: 120%)[}] thin d x . $ <eq:spectral-action-upper>]
  The right side has a pointwise bound that does not require its two matrices to commute. Indeed, scalar maximization gives, for $y \, z gt.eq 0$,
  #[#set math.equation(numbering: n => "(7.4)")
   $ y z - z^q lt.eq D_sigma y^p \, #h(2em) D_sigma = frac(sigma^sigma, \( 1 + sigma \)^(1 + sigma)) . $ <eq:scalar-young-sharp>]
  To apply it, diagonalize an arbitrary positive semidefinite matrix $Z$ in an orthonormal basis $\( v_j \)$, with eigenvalues $z_j$. Set $y_j = chevron.l v_j \, W v_j chevron.r$. Convexity of $t mapsto t^p$, applied to the spectral measure of $W$ in $v_j$, gives $y_j^p lt.eq chevron.l v_j \, W^p v_j chevron.r$. Hence
  #[#set math.equation(numbering: n => "(7.5)")
   $ "tr" \( W Z \) - "tr" \( Z^q \) = sum_j \( y_j z_j - z_j^q \) lt.eq D_sigma sum_j y_j^p lt.eq D_sigma "tr" \( W^p \) . $ <eq:trace-young-sharp>]
  Using $Z = A^(sans(T)) A$ in (7.3), we obtain
  $ sup_(C med upright(l o w e r med t r i a n g u l a r)) cal(E) \( C U \) lt.eq D_sigma integral_(bb(R)) "tr" \( W^p \) thin d x . $
  All terms are finite for each $C$: the rows of $A$ are bounded and supported on $overline(Omega)$, and $W$ is locally integrable.
  Theorem 2 supplies the reverse bound in terms of the $k_i$. Writing $upright(B)$ for Euler’s beta function, the substitution $s = k_i t$ gives
  $ integral_(- k_i)^(k_i) \( k_i^2 - s^2 \)^sigma thin d s = k_i^(2 sigma + 1) upright(B) \( 1 / 2 \, 1 + sigma \) = k_i^(2 gamma) upright(B) \( 1 / 2 \, 1 + sigma \) . $
  We conclude that
  #[#set math.equation(numbering: n => "(7.6)")
   $ sum_(i = 1)^n k_i^(2 gamma) lt.eq frac(D_sigma, upright(B) \( 1 / 2 \, 1 + sigma \)) integral_(bb(R)) "tr" \( W^p \) thin d x . $ <eq:finite-spectral-moment>]
  The coefficient is exactly the one in the theorem:
  #[#set math.equation(numbering: n => "(7.7)")
   $ frac(D_sigma, upright(B) \( 1 / 2 \, 1 + sigma \)) & = frac(sigma^sigma, \( 1 + sigma \)^(1 + sigma)) frac(Gamma \( sigma + 3 \/ 2 \), sqrt(pi) thin Gamma \( sigma + 1 \))\
 & = (frac(sigma, 1 + sigma))^sigma frac(Gamma \( sigma + 3 \/ 2 \), sqrt(pi) thin Gamma \( sigma + 2 \)) = C_gamma . $ <eq:constant-identity>]
  Letting the approximations converge proves the bound for the chosen finite list of eigenvalues. The sum of all negative eigenvalue moments is the supremum of these finite sums. Thus the same bound holds for $"Tr" \( H_W \)_(-)^gamma$, and in particular this trace is finite.
  For a complex Hermitian potential, write $W = E + i F$ with real matrices $E \, F$. Hermiticity means $E^(sans(T)) = E$ and $F^(sans(T)) = - F$, so
  $ tilde(W) = mat(delim: "(", E, - F; F, E) $
  is real symmetric. The constant complex unitary
  $ cal(U) = 1 / sqrt(2) mat(delim: "(", I, i I; I, - i I) $
  satisfies $cal(U) tilde(W) cal(U)^(*) = W xor overline(W)$. It follows that $tilde(W) gt.eq 0$ and $"tr" \( tilde(W)^p \) = 2 "tr" \( W^p \)$. Since $cal(U)$ also commutes with differentiation, the same change of coordinates gives
  $ H_(tilde(W)) tilde.eq H_W xor H_(overline(W)) . $
  Complex conjugation intertwines the two summands and preserves eigenvalue multiplicities. The spectral moment for $tilde(W)$ is consequently twice that for $W$. Applying the real inequality in dimension $2 m$ and dividing both sides by two proves the asserted inequality for all Hermitian $W$.
  It remains to verify sharpness. Put $r = 1 \/ sigma > 1$ and consider the scalar potential and function
  $ V \( x \) = \( r + 1 \) "sech"^2 \( r x \) \, #h(2em) psi \( x \) = "sech"^(1 \/ r) \( r x \) . $
  The identity $psi' \/ psi = - tanh \( r x \)$ gives $H_V psi = - psi$, and $psi in L^2 \( bb(R) \)$. We determine the full negative spectrum by the standard factorization method; see [2] Sections II–III for its use in Lieb–Thirring inequalities. Define $Q = partial_x + tanh \( r x \)$ on $H^1 \( bb(R) \)$. Direct multiplication yields
  $ H_V = Q^(*) Q - 1 \, #h(2em) Q Q^(*) - 1 = - partial_x^2 + \( r - 1 \) "sech"^2 \( r x \) gt.eq 0 . $
  Thus $H_V gt.eq - 1$, and its eigenspace at $- 1$ is $ker Q$, which is spanned by $psi$. If $lambda in \( - 1 \, 0 \)$ were an eigenvalue with eigenfunction $u$, then $Q u eq.not 0$. The bounded potential gives $u in H^2$, so $Q u in L^2$. The intertwining identity $\( Q Q^(*) - 1 \) Q u = lambda Q u$ holds in distributions. Boundedness of the partner potential then implies $Q u in H^2$, so this identity contradicts nonnegativity. Therefore $- 1$ is the only negative eigenvalue and is simple. Finally,
  $ integral_(bb(R)) V^p thin d x = frac(\( r + 1 \)^p, r) thin upright(B) \( 1 / 2 \, p \) = frac(upright(B) \( 1 / 2 \, 1 + sigma \), D_sigma) = C_gamma^(- 1) . $
  The scalar inequality is an equality for $V$. Embedding $V$ in one diagonal channel and setting the other channels to zero gives equality in every matrix dimension, proving that $C_gamma$ is optimal. ◻
]

#heading(level: 1)[References]
#bibitem([1])[Michael Aizenman and Elliott H. Lieb, #emph[On semi-classical bounds for eigenvalues of Schrödinger operators], Physics Letters A #strong[66] (1978), no.~6, 427--429. #link("https://doi.org/10.1016/0375-9601(78)90385-7")[doi:10.1016/0375-9601(78)90385-7].]
#bibitem([2])[Rafael Benguria and Michael Loss, #emph[A simple proof of a theorem of Laptev and Weidl], Mathematical Research Letters #strong[7] (2000), no.~2--3, 195--203. #link("https://doi.org/10.4310/MRL.2000.v7.n2.a5")[doi:10.4310/MRL.2000.v7.n2.a5].]
#bibitem([3])[Jean Dolbeault, Ari Laptev and Michael Loss, #emph[Lieb--Thirring inequalities with improved constants], Journal of the European Mathematical Society #strong[10] (2008), no.~4, 1121--1126. #link("https://doi.org/10.4171/JEMS/142")[doi:10.4171/JEMS/142].]
#bibitem([4])[Dirk Hundertmark, Ari Laptev and Timo Weidl, #emph[New bounds on the Lieb--Thirring constants], Inventiones Mathematicae #strong[140] (2000), no.~3, 693--704. #link("https://doi.org/10.1007/s002220000077")[doi:10.1007/s002220000077].]
#bibitem([5])[Dirk Hundertmark, Elliott H. Lieb and Lawrence E. Thomas, #emph[A sharp bound for an eigenvalue moment of the one-dimensional Schrödinger operator], Advances in Theoretical and Mathematical Physics #strong[2] (1998), no.~4, 719--731. #link("https://doi.org/10.4310/ATMP.1998.v2.n4.a2")[doi:10.4310/ATMP.1998.v2.n4.a2].]
#bibitem([6])[Joseph B. Keller, #emph[Lower bounds and isoperimetric inequalities for eigenvalues of the Schrödinger equation], Journal of Mathematical Physics #strong[2] (1961), no.~2, 262--266. #link("https://doi.org/10.1063/1.1703708")[doi:10.1063/1.1703708].]
#bibitem([7])[Ari Laptev and Timo Weidl, #emph[Sharp Lieb--Thirring inequalities in high dimensions], Acta Mathematica #strong[184] (2000), no.~1, 87--111. #link("https://doi.org/10.1007/BF02392782")[doi:10.1007/BF02392782].]
#bibitem([8])[Elliott H. Lieb and Walter E. Thirring, #emph[Bound for the kinetic energy of fermions which proves the stability of matter], Physical Review Letters #strong[35] (1975), no.~11, 687--689; erratum, #strong[35] (1975), 1116. #link("https://doi.org/10.1103/PhysRevLett.35.687")[doi:10.1103/PhysRevLett.35.687].]
#bibitem([9])[Elliott H. Lieb and Walter E. Thirring, #emph[Inequalities for the moments of the eigenvalues of the Schrödinger Hamiltonian and their relation to Sobolev inequalities], in #emph[Studies in Mathematical Physics: Essays in Honor of Valentine Bargmann], Elliott H. Lieb, Barry Simon and Arthur S. Wightman (eds.), Princeton University Press, Princeton, NJ, 1976, 269--303.]
#bibitem([10])[John W. Milnor, #emph[Topology from the Differentiable Viewpoint], University Press of Virginia, Charlottesville, VA, 1965.]
#bibitem([11])[OpenAI, #emph[Sharp one-dimensional Lieb--Thirring constants], OpenAI Math Release preprint #link("https://github.com/openai/math/blob/main/preprints/Sharp-One-Dimensional-Lieb-Thirring-Constants-September-23-2026/paper.pdf")[OAI:Sharp-One-Dimensional-Lieb-Thirring-Constants-September-23-2026], 2026.]
#bibitem([12])[Larry Read and Marvin R. Schulz, #emph[The sharp one-dimensional Lieb--Thirring inequality for the sum of eigenvalues], #link("https://arxiv.org/abs/2609.10478v2")[arXiv:2609.10478v2], September 14, 2026.]
#bibitem([13])[Arthur Sard, #emph[The measure of the critical values of differentiable maps], Bulletin of the American Mathematical Society #strong[48] (1942), 883--890. #link("https://doi.org/10.1090/S0002-9904-1942-07811-6")[doi:10.1090/S0002-9904-1942-07811-6].]
#bibitem([14])[Timo Weidl, #emph[On the Lieb--Thirring constants $L_(gamma \, 1)$ for $gamma gt.eq 1 \/ 2$], Communications in Mathematical Physics #strong[178] (1996), no.~1, 135--146. #link("https://doi.org/10.1007/BF02104912")[doi:10.1007/BF02104912].]


