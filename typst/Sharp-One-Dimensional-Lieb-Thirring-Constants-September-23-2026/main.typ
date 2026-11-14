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

#align(center)[#text(size: 16pt, weight: "bold")[Sharp one-dimensional Lieb--Thirring constants]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:intro>

The Lieb–Thirring inequality bounds the negative eigenvalues of a Schrödinger operator by an integral of its
  potential. Write $t_(+) = max { t \, 0 }$ and $t_(-) = max { - t \, 0 }$.
  On the line, let $0 lt.eq W in L^(gamma + 1 \/ 2) \( bb(R) \)$ and let $H_(- W)$ be the self-adjoint operator
  associated with the quadratic form

$ h_(- W) \[ v \] = integral_(bb(R)) \| v' \( x \) \|^2 thin d x -
  integral_(bb(R)) W \( x \) \| v \( x \) \|^2 thin d x \, wide v in H^1 \( bb(R) \) . $

For $gamma > 1 \/ 2$, this form is closed and bounded below, and its negative spectrum is discrete.
  We give the needed form and compactness arguments in Section 7. Write

$ "Tr" \( H_(- W) \)_(-)^gamma = sum_(lambda_j \( H_(- W) \) < 0) \| lambda_j \( H_(- W) \) \|^gamma \, $

counting multiplicities; before the inequality is proved this sum is allowed to be infinite. The optimal constant is

$ L_(gamma \, 1) = sup_(0 lt.eq W in L^(gamma + 1 \/ 2) \( bb(R) \)\
W equiv.not 0) frac("Tr" \( H_(- W) \)_(-)^gamma, integral_(bb(R)) W^(gamma + 1 \/ 2)) . $

Two natural comparisons are the semiclassical constant

#[#set math.equation(numbering: n => "(1.1)")
 $ L_(gamma \, 1)^(upright("cl")) = frac(1, 2 pi) integral_(bb(R)) \( 1 - xi^2 \)_(+)^gamma thin d xi =
   frac(Gamma \( gamma + 1 \), 2 sqrt(pi) thin Gamma \( gamma + 3 \/ 2 \)) $ <eq:semiclassical>]

and the optimal constant when only the lowest eigenvalue is retained, denoted by $L_(gamma \, 1)^(\( 1 \))$.
  The one-dimensional Lieb–Thirring conjecture predicts the one-bound-state constant for $1 \/ 2 < gamma < 3 \/
  2$ and the semiclassical constant for $gamma gt.eq 3 \/ 2$.

#thm([Theorem 1.1.])[
  #emph[For every $1 \/ 2 < gamma < 3 \/ 2$ and every nonnegative $W in L^(gamma + 1 \/ 2) \( bb(R) \)$,
#[#set math.equation(numbering: n => "(1.2)")
 $ "Tr" \( H_(- W) \)_(-)^gamma lt.eq 2 (frac(gamma - 1 \/ 2, gamma + 1 \/ 2))^(gamma - 1 \/ 2)
   L_(gamma \, 1)^(upright("cl")) integral_(bb(R)) W^(gamma + 1 \/ 2) . $ <eq:main>]

 The constant is optimal and equals $L_(gamma \, 1)^(\( 1 \))$.
   More precisely, if $r = \( gamma - 1 \/ 2 \)^(- 1)$, equality is attained by $W \( x \) = \( r + 1 \)
   "sech"^2 \( r x \)$.]
] <thm:main>

The estimate includes rough, unbounded potentials and infinitely many negative eigenvalues.
  Corollary 15 gives the corresponding inequality for signed potentials on their natural dense weighted form
  domain. The theorem concerns scalar potentials on the line;
  the matrices used below encode finite orthonormal families.
  Its sharpness assertion exhibits an equality potential without classifying all optimizers.

=== 1.1 History and relation to prior work <history-and-relation-to-prior-work>

Lieb and Thirring introduced these spectral inequalities in their work on the kinetic energy of fermions and the
  stability of matter #cite(label("LiebThirring1975")) #cite(label("LiebThirring1976")).
  At exponent one, optimizing over the potential makes the spectral inequality equivalent to a lower bound on the
  kinetic energy of an orthonormal family in terms of its density.
  On the line, for a finite orthonormal family $\( u_j \) subset H^1 \( bb(R) \)$, this density is $rho =
  sum_j \| u_j \|^2$, and the corresponding kinetic bound controls $integral rho^3$ by $sum_j integral \|
  u'_j \|^2$. The one-state variational problem goes back to Keller #cite(label("Keller1961")).
  The conjecture asks whether allowing arbitrarily many bound states can improve on its constant in the lower
  exponent range. We verify the one-state equality potential and its normalization directly.

The scalar upper endpoint predates the general Lieb–Thirring inequalities.
  Inverse-scattering trace identities for the Korteweg–de Vries equation give the sharp value $L_(3 \/ 2 \, 1) =
  3 \/ 16$ #cite(label("ZakharovFaddeev1971")) #cite(label("GardnerGreeneKruskalMiura1974"));
  Lieb and Thirring explicitly credit Gardner, Greene, Kruskal and Miura in #cite(label("LiebThirring1976"))
  Section 4(B). Aizenman and Lieb’s monotonicity argument extends the semiclassical equality to all larger
  exponents #cite(label("AizenmanLieb1978")). At the other endpoint,
  Weidl first proved finiteness of $L_(1 \/ 2 \, 1)$ #cite(label("Weidl1996")), and Hundertmark,
  Lieb and Thomas obtained its sharp value $1 \/ 2$ #cite(label("HundertmarkLiebThomas1998")) Theorem 1.
  Laptev and Weidl established the operator-valued upper-endpoint estimate and used dimension lifting to obtain
  the sharp semiclassical constants for every dimension and $gamma gt.eq
  3 \/ 2$ #cite(label("LaptevWeidl2000")) Theorems 2.1, 2.2 and 3.1.

Quantitative estimates and orthonormal-function methods narrowed the remaining gap.
  Hundertmark, Laptev and Weidl proved $L_(gamma \, 1) lt.eq 2 L_(gamma \, 1)^(upright("cl"))$ for $1 \/ 2 lt.eq
  gamma < 3 \/ 2$ #cite(label("HLW2000")) Theorem 4.1. At exponent one, Dolbeault,
  Laptev and Loss extended the method of Eden and Foias to matrix-valued potentials #cite(label("EdenFoias1991"))
  #cite(label("DLL2008")). Their all-dimensional semiclassical ratio was $pi \/ sqrt(3)$;
  subsequent bounds were $1.456$ by Frank, Hundertmark, Jex and Nam #cite(label("FHJN2021")) Theorem 1 and the
  reported $1.44655$ of Corso and Ried #cite(label("CorsoRied2025")) Corollary 1.7.
  These bounds preceded the sharp exponent-one theorem described below.
  In the full one-dimensional strict interval, Levitt’s numerical investigation observed convergence to the
  one-state profile or splitting into increasingly separated copies #cite(label("Levitt2014")) Section 4.1.
  Such computations support the conjectured value but do not bound the contribution of every orthonormal family.
  That uniform bound is the obstacle addressed by our action inequality.

Read and Schulz proved the case $gamma = 1$ in #cite(label("ReadSchulz2026")) Theorem 1,
  obtaining the sharp constant $4 \/ \( 3 sqrt(3) pi \)$. Their proof extends Benguria and Loss’s scalar
  cumulative-mass argument #cite(label("BenguriaLoss2004")) Section 2 to orthonormal families through a matrix
  correction to the kinetic energy. Their operator-valued extension also gives the semiclassical ratio $2 \/
  sqrt(3)$ in every dimension at exponent one #cite(label("ReadSchulz2026")) Theorem 2 and Section 2.
  Our proof retains the individual eigenvalue scales in a finite-interval action inequality.
  Its main analytic step is a rank-one comparison for an energy-dependent regularized matrix field.
  A continuation argument chooses a lower triangular coefficient matrix and a path joining two prescribed matrix
  endpoints. Together these yield the action inequality for every $1 \/ 2 < gamma < 3 \/ 2$.
  Theorem 1 therefore resolves the remaining open-interval cases of the one-dimensional Lieb–Thirring conjecture
  positively; the case $gamma = 1$ is already covered by Read–Schulz.

=== 1.2 Proof strategy <proof-strategy>

Put $sigma = gamma - 1 \/ 2 in \( 0 \, 1 \)$. The central result is a variational inequality on a bounded
  interval, independent of any potential. Fix $I = \( x_(-) \, x_(+) \)$.
  Given $N$ orthonormal real functions $u_i in H_0^1 \( I \; bb(R) \)$ and positive numbers $k_i$,
  let $u = \( u_i \)_(i = 1)^N$ and $K = "diag" \( k_i \)$. We prove that the action

$ cal(E)_K \( a \) = integral_I #scale(x: 120%, y: 120%)[\(] \| a' \|^2 +
  a^(sans(T)) K^2 a - \| a \|^(2 + 2 \/ sigma) #scale(x: 120%, y: 120%)[\)] thin d x $

has supremum at least $sum_i integral_(- k_i)^(k_i) \( k_i^2 - s^2 \)^sigma thin d s$ among functions $a =
  C u$ with $C$ lower triangular. Section 2 states this precisely in Theorem 2 and explains the role of triangularity.

The difficulty is to obtain this lower bound for an arbitrary orthonormal family while retaining its individual
  scales $k_i$. The argument replaces a direct optimization over $C$ by a path with prescribed matrix endpoints.
  Section 3 constructs a regularized map $B mapsto M_delta \( B \)$ from real symmetric $N times
  N$ matrices to themselves, and a scalar primitive whose change from $K$ to $-
  K$ gives the required endpoint integral. Section 4 proves the analytic comparison that controls the nonlinear
  action term when $M_delta \( B \) = a a^(sans(T))$. Its integrated tangent map is an average of unitary
  conjugations; a trace inequality removes this average from the comparison.

Section 5 chooses $C$ and a path from $K$ to $- K$ by continuation modulo row signs.
  Compactness and the exclusion of zero rows make the continuation possible even when $C$ loses rank.
  Section 6 combines the path with the primitive: failure of the rank-one constraint contributes a negative square
  to the action identity. Compactness allows the penalty parameter to tend to zero at fixed regularization.
  Only then is the regularization removed.

Section 7 returns to the potential. Take the $u_i$ to be Dirichlet eigenfunctions with eigenvalues $- k_i^2$,
  ordered so that $k_1 gt.eq dots.h.c gt.eq k_N$. Lower triangularity lets the eigenfunction equations bound the
  quadratic part of the action by $integral W \| a \|^2$. A scalar maximization bounds the whole action by a
  multiple of $integral W^(1 + sigma)$. Finally, cutoff trial spaces pass from bounded intervals to the line,
  and finite partial sums exhaust all negative eigenvalues.
  The sharpness calculation uses the explicit potential in Theorem 1.

== 2 The finite-interval action inequality <sec:action>

Fix

$ 0 < sigma < 1 \, wide p = 1 + sigma \, wide q = 1 + 1 / sigma . $

All matrices below are finite dimensional. Write $"Sym"_N$ for the real symmetric $N times N$ matrices,
  with inner product $"tr" \( A B \)$ and norm $parallel A
  parallel_(upright("HS")) = \( "tr" \( A^2 \) \)^(1 \/ 2)$.
  The notation $A lt.eq B$ means that $B - A$ is positive semidefinite.
  Vectors are columns, and $\| a \|$ is their Euclidean norm.

Let $I = \( x_(-) \, x_(+) \)$ be a bounded interval. For a positive diagonal matrix $K =
  "diag" \( k_1 \, dots.h \, k_N \)$ and $a in H_0^1 \( I \; bb(R)^N \)$, define

#[#set math.equation(numbering: n => "(2.1)")
 $ cal(E)_K \( a \) = integral_I #scale(x: 120%, y: 120%)[\(] \| a' \|^2 +
   a^(sans(T)) K^2 a - \| a \|^(2 q) #scale(x: 120%, y: 120%)[\)] thin d x . $ <eq:action>]

In one dimension $H_0^1 \( I \)$ embeds into the continuous functions, so every term in this integral is finite.

#thm([Theorem 2.1.])[
  (Action inequality).  #emph[Let $u = \( u_1 \, dots.h \, u_N \)^(sans(T)) in
    H_0^1 \( I \; bb(R)^N \)$ satisfy $integral_I u u^(sans(T)) thin d x = I_N$, and let $k_i > 0$. Then
#[#set math.equation(numbering: n => "(2.2)")
 $ sup_(C upright(" lower triangular")) cal(E)_K \( C u \) gt.eq
   sum_(i = 1)^N integral_(- k_i)^(k_i) \( k_i^2 - s^2 \)^sigma thin d s . $ <eq:action-bound>]

 The supremum is over all real lower triangular $N times N$ matrices.]
] <thm:action>

The restriction to lower triangular matrices is what makes this inequality useful spectrally.
  If the $u_i$ are eigenfunctions ordered from the lowest eigenvalue upward,
  the $i$th component of $C u$ stays in the span of the first $i$ eigenfunctions.
  Section 7 will use this observation to bound the left side from above by an integral of the potential.

Here is the construction behind the lower bound. For each $delta > 0$,
  Section 3 builds a locally Lipschitz map $M : "Sym"_N arrow.r "Sym"_N$ and a $C^1$ function $J : "Sym"_N arrow.r
  bb(R)$ such that

#[#set math.equation(numbering: n => "(2.3)")
 $ d J \( B \) \[ H \] = - "tr" \( M \( B \) H \) . $ <eq:framework-gradient>]

They have two decisive properties. First, Section 4 proves

#[#set math.equation(numbering: n => "(2.4)")
 $ M \( B \) = a a^(sans(T)) quad arrow.r.double quad a^(sans(T)) \( K^2 - B^2 \) a gt.eq \| a \|^(2 q) .
   $ <eq:framework-rankone>]

Second, Section 5 finds, for every $epsilon > 0$, a lower triangular $C$ and a path $B$ satisfying

#[#set math.equation(numbering: n => "(2.5)")
 $ epsilon B' = M \( B \) - \( C u \) \( C u \)^(sans(T)) \, wide B \( x_(-) \) = K \, quad B \( x_(+) \) = -
   K . $ <eq:framework-path>]

The small parameter $epsilon$ penalizes failure of the rank-one constraint.
  For $a = C u$, differentiating $J \( B \) + a^(sans(T)) B a$ along this path produces the negative term $-
  epsilon^(- 1) parallel M \( B \) - a a^(sans(T)) parallel_(upright("HS"))^2$.
  Uniform bounds on the path and on $C$ then give

$ sup_C cal(E)_K \( C u \) gt.eq J \( - K \) - J \( K \) . $

Finally, the boundary difference tends to the right side of (2.2) as $delta arrow.b 0$.
  We keep $delta$ fixed until after the limit $epsilon arrow.b 0$.

== 3 A regularized matrix field <sec:field>

We construct the field and primitive used in Section 2. Throughout this section $K =
  "diag" \( k_1 \, dots.h \, k_N \) > 0$ and $delta > 0$ are fixed. The scalar case explains the choice of field.
  For $N = 1$, write $K = \( k \)$. If $- k lt.eq b lt.eq k$, putting $m = \( k^2 - b^2 \)^sigma$ gives

$ m \( k^2 - b^2 \) = m^(1 + 1 \/ sigma) . $

Thus this field gives equality in the scalar version of the rank-one comparison,
  and a primitive with derivative $- m$ has the required change $integral_(- k)^k \( k^2 - b^2 \)^sigma thin d
  b$ from $k$ to $- k$. We seek matrix versions of the comparison and endpoint identity,
  with a regularization removed at the end.

The identity

$ k^2 - 2 s b + s^2 = \( s - b \)^2 + k^2 - b^2 $

suggests integrating a scalar function of the quadratic on the left:
  its affine dependence on $b$ will let us construct a trace primitive even when the corresponding matrices $K$
  and $B$ do not commute. Set $beta = sigma - 1 / 2 in \( - 1 / 2 \, 1 / 2 \)$ and define $f : bb(R) arrow.r bb(R)$ by

#[#set math.equation(numbering: n => "(3.1)")
 $ f \( 0 \) = 0 \, wide f' \( y \) = \( max { y \, 0 } + delta \)^(beta - 1) \, wide c =
   frac(sigma, integral_(bb(R)) \( 1 + s^2 \)^(beta - 1) thin d s) . $ <eq:f>]

The exponent and normalization are chosen so that, for $z gt.eq 0$, scaling the integration variable gives

$ c integral_(bb(R)) f' \( s^2 + z \) thin d s = sigma \( z + delta \)^(beta - 1 \/ 2) =
  sigma \( z + delta \)^(sigma - 1) . $

Integration in $z$ therefore produces the regularized power $\( z + delta \)^sigma - delta^sigma$.
  On the scalar interval $\[ - k \, k \]$, we will recover this expression with $z = k^2 - b^2$.
  Keeping $f'$ constant for negative arguments extends the construction beyond that interval,
  as needed for the continuation argument. The resulting $f$ is $C^1$, strictly increasing,
  and concave on $bb(R)$. The integral defining $c$ is finite because $beta < 1 \/ 2$;
  the definition also includes $beta = 0$ without a limiting convention.

For $B in "Sym"_N$, put

#[#set math.equation(numbering: n => "(3.2)")
 $ X_s \( B \) & = K^2 - 2 s B + s^2 I_N \,\
M_R \( B \) & = c integral_(- R)^R #scale(x: 120%, y: 120%)[\(] f \( X_s \( B \) \) -
  f \( s^2 \) I_N #scale(x: 120%, y: 120%)[\)] thin d s \,\
M \( B \) & = lim_(R arrow.r oo) M_R \( B \) . $ <eq:X-M>]

Here and below scalar functions of symmetric or Hermitian matrices are defined by the spectral theorem.
  The symmetric cutoff in (3.2) is part of the definition.

=== 3.1 Convergence and a primitive <convergence-and-a-primitive>

We first record an elementary estimate that keeps the regularity argument in the Hilbert–Schmidt norm.

#thm([Lemma 3.1.])[
  #emph[If a real function $h$ is $L$-Lipschitz on an interval containing the spectra of two Hermitian matrices
    $A$ and $B$, then $parallel h \( A \) - h \( B \) parallel_(upright("HS")) lt.eq L parallel A -
    B parallel_(upright("HS"))$.]
] <lem:HS-calculus>

#proof[
  Choose orthonormal eigenbases $v_i$ and $w_j$ of $A$ and $B$, with respective eigenvalues $lambda_i$ and $nu_j$.
    In these two bases the entries of $h \( A \) - h \( B \)$ and $A - B$ are, respectively,
  $ \( h \( lambda_i \) - h \( nu_j \) \) chevron.l v_i \, w_j chevron.r \,
    wide \( lambda_i - nu_j \) chevron.l v_i \, w_j chevron.r . $
  Square, sum over $i \, j$, and apply the scalar Lipschitz bound. ◻
]

#thm([Lemma 3.2.])[
  #emph[The limit in (3.2) is locally uniform. The resulting map $M$ is locally Lipschitz. Moreover,
#[#set math.equation(numbering: n => "(3.3)")
 $ J \( B \) = - integral_0^1 "tr" #scale(x: 120%, y: 120%)[\(] B M \( t B \) #scale(x: 120%, y: 120%)[\)] thin d
   t $ <eq:J>]

 is $C^1$ and satisfies (2.3).]
] <lem:field-regularity>

#proof[
  Fix a bounded set of $B$’s. For sufficiently large $\| s \|$, the spectrum of $H_s \( B \) = K^2 -
    2 s B$ lies in $\[ - A \| s \| \, A \| s \| \]$, with $A$ independent of $B$. On this interval set
  $ h_s \( t \) = f \( s^2 + t \) - f \( s^2 \) - f' \( s^2 \) t . $
  All arguments of $f$ are positive. Since $f'' \( y \) = \( beta - 1 \) \( y + delta \)^(beta - 2)$ for $y > 0$,
    the mean value theorem gives
  $ "Lip" \( h_s \) = O \( \| s \|^(2 beta - 3) \) \, wide sup_(\| t \| lt.eq A \| s \|) \| h_s \( t \) \| =
    O \( \| s \|^(2 beta - 2) \) . $
  It follows that
  #[#set math.equation(numbering: n => "(3.4)")
   $ f \( X_s \( B \) \) - f \( s^2 \) I_N = - 2 s f' \( s^2 \) B + R_s \( B \) \, $ <eq:tail>]
  where $R_s \( B \) = f' \( s^2 \) K^2 + h_s \( H_s \( B \) \)$ has norm $O \( \| s \|^(2 beta - 2) \)$.
    By Lemma 3, its Lipschitz constant as a function of $B$ has the same bound:
    the factor $2 \| s \|$ from $H_s$ multiplies $O \( \| s \|^(2 beta - 3) \)$.
    The first term on the right of (3.4) is odd in $s$ and cancels at every symmetric cutoff;
    the remainder is integrable. On bounded $s$-intervals, $f$ is Lipschitz and the same lemma applies directly.
    This proves both assertions about $M$.
  For completeness we justify the primitive without differentiating $M$. Let $F$ be any $C^2$ primitive of $f$.
    The trace differentiation formula is
  #[#set math.equation(numbering: n => "(3.5)")
   $ d "tr" F \( A \) \[ H \] = "tr" \( f \( A \) H \) . $ <eq:trace-derivative>]
  For polynomials it follows by cyclicity of trace. Approximation of $F$ and $F'$ on a compact spectral interval
    by a polynomial and its derivative proves the general formula.
    For $s eq.not 0$, the map $B mapsto f \( X_s \( B \) \) - f \( s^2 \) I_N$ is therefore a gradient: a potential is
  $ - frac(1, 2 s) "tr" F \( X_s \( B \) \) - f \( s^2 \) "tr" B . $
  At $s = 0$ the field is constant and is again a gradient.
    Consequently each $M_R$ has zero integral around every piecewise $C^1$ closed curve,
    by integration first along the curve and then in $s$. Its negative has the primitive $J_R \( B \) = -
    integral_0^1 "tr" \( B M_R \( t B \) \) thin d t$. Local uniform convergence gives $J_R arrow.r
    J$ and $M_R arrow.r M$ on compact sets. Passing to the limit in the line-segment identity for $J_R$ yields
  $ J \( B + H \) - J \( B \) = - integral_0^1 "tr" \( M \( B + t H \) H \) thin d t . $
  Continuity of $M$ proves that $J$ is $C^1$ with the stated derivative. ◻
]

=== 3.2 Scalar comparison and boundary values <scalar-comparison-and-boundary-values>

Define

#[#set math.equation(numbering: n => "(3.6)")
 $ mu \( z \) = c integral_(bb(R)) #scale(x: 120%, y: 120%)[\(] f \( s^2 + z \) -
   f \( s^2 \) #scale(x: 120%, y: 120%)[\)] thin d s \, wide z in bb(R) . $ <eq:mu>]

This integral is absolutely convergent: on bounded $z$-sets its integrand has tail $O \( \| s \|^(2 beta - 2) \)$.

#thm([Lemma 3.3.])[
  #emph[The function $mu$ is locally Lipschitz and strictly increasing, with $mu \( 0 \) = 0$. For $z gt.eq 0$,
#[#set math.equation(numbering: n => "(3.7)")
 $ mu \( z \) = \( z + delta \)^sigma - delta^sigma \, wide mu' \( z \) =
   sigma \( z + delta \)^(sigma - 1) . $ <eq:mu-positive>]

 For every fixed $b \, z in bb(R)$,
#[#set math.equation(numbering: n => "(3.8)")
 $ c lim_(R arrow.r oo) integral_(- R)^R #scale(x: 120%, y: 120%)[\(] f \( \( s - b \)^2 + z \) -
   f \( s^2 \) #scale(x: 120%, y: 120%)[\)] thin d s = mu \( z \) . $ <eq:shift>]

]
] <lem:mu>

#proof[
  The tail estimate above, also for differences in $z$, proves local Lipschitz continuity.
    Strict increase follows from strict increase of $f$ at every $s$.
    Differentiation under the integral for $z gt.eq 0$ gives
  $ mu' \( z \) = c integral_(bb(R)) \( s^2 + z + delta \)^(beta - 1) thin d s =
    sigma \( z + delta \)^(beta - 1 \/ 2) = sigma \( z + delta \)^(sigma - 1) . $
  Integration from zero proves (3.7).
  For the shift, write $g \( s \) = f \( s^2 + z \)$. It is even, and $g' \( s \) = 2 s f' \( s^2 + z \) =
    O \( \| s \|^(2 beta - 1) \) arrow.r 0$ as $\| s \| arrow.r oo$. Suppose first that $b gt.eq 0$.
    The change in the integral of $g$ under the shift is
  $ integral_R^(R + b) g \( t \) thin d t - integral_(R - b)^R g \( t \) thin d t . $
  Its absolute value is at most $b^2 sup_(\| t - R \| lt.eq b) \| g' \( t \) \|$, which tends to zero.
    Evenness handles $b < 0$ as well. Subtracting $f \( s^2 \)$ now proves (3.8). ◻
]

#thm([Lemma 3.4.])[
  (Directional comparison).  #emph[For every $B in "Sym"_N$ and every real unit vector $e$,
#[#set math.equation(numbering: n => "(3.9)")
 $ e^(sans(T)) M \( B \) e lt.eq mu #scale(x: 120%, y: 120%)[\(] e^(sans(T)) K^2 e - \( e^(sans(T)) B e \)^2
   #scale(x: 120%, y: 120%)[\)] . $ <eq:jensen>]

 If a standard basis vector $e_i$ is an eigenvector of $B$ with eigenvalue $b_i$, then
#[#set math.equation(numbering: n => "(3.10)")
 $ M \( B \) e_i = mu \( k_i^2 - b_i^2 \) e_i . $ <eq:common-eigenvector>]

 For the primitive in (3.3),
#[#set math.equation(numbering: n => "(3.11)")
 $ J \( - K \) - J \( K \) = sum_(i = 1)^N integral_(- k_i)^(k_i) mu \( k_i^2 - s^2 \) thin d s . $ <eq:boundary-J>]

]
] <lem:jensen>

#proof[
  Scalar concavity and the spectral decomposition of $X_s \( B \)$ give
  $ e^(sans(T)) f \( X_s \( B \) \) e lt.eq f \( e^(sans(T)) X_s \( B \) e \) . $
  Set $b = e^(sans(T)) B e$ and $z = e^(sans(T)) K^2 e - b^2$.
    The scalar argument on the right is $\( s - b \)^2 + z$. Integrate at a symmetric cutoff and use Lemma 5 to
    obtain (3.9). This uses scalar concavity only; no operator concavity on the whole real line is asserted.
  For (3.10), $e_i$ is also an eigenvector of $X_s \( B \)$, with eigenvalue $\( s - b_i \)^2 + k_i^2 - b_i^2$.
    Functional calculus and (3.8) give the identity. Finally, restrict $d J = -
    "tr" \( M thin d B \)$ to diagonal matrices and integrate along the diagonal segment from $K$ to $- K$.
    Each coordinate contributes
  $ - integral_(k_i)^(- k_i) mu \( k_i^2 - s^2 \) thin d s = integral_(- k_i)^(k_i) mu \( k_i^2 - s^2 \) thin d s \, $
  as claimed. ◻
]

In particular $M \( K \) = M \( - K \) = 0$. We shall also use the following symmetry.
  If $S$ is a diagonal matrix with entries $plus.minus 1$, then $S K S = K$ and

#[#set math.equation(numbering: n => "(3.12)")
 $ M \( S B S \) = S M \( B \) S . $ <eq:sign-equivariance>]

This follows already at each cutoff. The matrix $K$ stays fixed throughout;
  we do not require equivariance under conjugations that move $K$.

== 4 The rank-one comparison <sec:rankone>

The field $M$ was chosen so that its rank-one values control the nonlinear term in the action.
  We now prove that property. The parameters $K \, sigma$ and $delta$ remain fixed as in Section 3.

#thm([Proposition 4.1.])[
  #emph[For every $B in "Sym"_N$ and every $a in bb(R)^N$,
#[#set math.equation(numbering: n => "(4.1)")
 $ M \( B \) = a a^(sans(T)) quad arrow.r.double quad a^(sans(T)) \( K^2 - B^2 \) a gt.eq \| a \|^(2 q) .
   $ <eq:rankone>]

]
] <prop:rankone>

The proof compares $X_s \( B \)$ with a matrix that is a function of $B$ alone.
  Its tangent map, integrated in $s$, is an average of unitary conjugations.
  Trace monotonicity then removes this average from the needed inequality.

=== 4.1 A tangent inequality on positive matrices <a-tangent-inequality-on-positive-matrices>

Divided differences describe the derivative of matrix functional calculus,
  as in the work of Daleckii and Krein #cite(label("DaleckiiKrein1965"));
  see #cite(label("Hiai2010")) Theorem 2.3.1 for a modern finite-dimensional formulation.
  We prove the required derivative formula and tangent inequality directly from the resolvent representation below.

#thm([Lemma 4.2.])[
  #emph[For $y gt.eq 0$ the function $f$ of (3.1) has the representation
#[#set math.equation(numbering: n => "(4.2)")
 $ f \( y \) = c_beta integral_0^oo v^beta (frac(1, delta + v) - frac(1, y + delta + v)) thin d v \, wide
   c_beta^(- 1) = integral_0^oo frac(t^beta, \( 1 + t \)^2) thin d t . $ <eq:resolvent-f>]

 If $X \, Y gt.eq 0$ are Hermitian matrices, then
#[#set math.equation(numbering: n => "(4.3)")
 $ f \( X \) lt.eq f \( Y \) + T_Y \( X - Y \) \, $ <eq:tangent>]

 where, in an eigenbasis of $Y$ with eigenvalues $y_i$,
#[#set math.equation(numbering: n => "(4.4)")
 $ \( T_Y Z \)_(i j) = f \[ y_i \, y_j \] Z_(i j) \, wide f \[ x \, y \] =
   integral_0^1 f' \( tau x + \( 1 - tau \) y \) thin d tau . $ <eq:divdiff>]

 For $x eq.not y$, this is $\( f \( x \) - f \( y \) \) \/ \( x - y \)$; for $x = y$ it is $f' \( x \)$.]
] <lem:resolvent-tangent>

#proof[
  The integrand in (4.2) is $O \( v^beta \)$ near zero and $O \( v^(beta - 2) \)$ at infinity.
    The range $- 1 < beta < 1$ suffices for convergence. Differentiation gives
  $ c_beta integral_0^oo frac(v^beta, \( y + delta + v \)^2) thin d v = \( y + delta \)^(beta - 1) = f' \( y \) \, $
  and both sides of (4.2) vanish at zero.
  Put $A = Y + \( delta + v \) I$ and $Z = X - Y$. Since $A$ and $A + Z$ are positive definite,
    the resolvent identity gives
  $ - \( A + Z \)^(- 1) = - A^(- 1) + A^(- 1) Z A^(- 1) - A^(- 1) Z \( A + Z \)^(- 1) Z A^(- 1) lt.eq - A^(- 1) +
    A^(- 1) Z A^(- 1) . $
  Integrating proves (4.3). The coefficient multiplying $Z_(i j)$ in its linear term is
  $ c_beta integral_0^oo frac(v^beta, \( y_i + delta + v \) \( y_j + delta + v \)) thin d v = f \[ y_i \, y_j \] . $
  This also covers repeated eigenvalues. All these integrals converge absolutely, since $delta > 0$. ◻
]

=== 4.2 The integrated tangent map <the-integrated-tangent-map>

Suppose that $M \( B \) = a a^(sans(T))$ and $m = \| a \|^2 > 0$. By Lemma 6, for every unit $e$,

$ 0 lt.eq e^(sans(T)) M \( B \) e lt.eq mu #scale(x: 120%, y: 120%)[\(] e^(sans(T)) K^2
  e - \( e^(sans(T)) B e \)^2 #scale(x: 120%, y: 120%)[\)] . $

Strict increase of $mu$ implies $e^(sans(T)) K^2 e gt.eq \( e^(sans(T)) B e \)^2$. Consequently

#[#set math.equation(numbering: n => "(4.5)")
 $ e^(sans(T)) X_s \( B \) e = \( s - e^(sans(T)) B e \)^2 + e^(sans(T)) K^2 e - \( e^(sans(T)) B e \)^2 gt.eq
   0 $ <eq:X-positive>]

for every real $s$: the matrices $X_s \( B \)$ are positive semidefinite.

To apply the tangent inequality, we compare $X_s \( B \)$ with $\( s I - B \)^2 + d I$,
  which is diagonal in an eigenbasis of $B$. Choose $d > 0$ so that its integrated scalar value is $mu \( d \) = m$:

#[#set math.equation(numbering: n => "(4.6)")
 $ D = K^2 - B^2 \, wide d = \( m + delta^sigma \)^(1 \/ sigma) - delta \, wide Y_s = \( s I - B \)^2 +
   d I . $ <eq:D-d-Y>]

This choice matches the nonzero eigenvalue of $M \( B \)$.
  When we pair the integrated tangent inequality with $M \( B \)$, the identity $M \( B \)^2 =
  m M \( B \)$ will cancel the contribution $m I$ against the left side.
  We have $X_s \( B \) = Y_s + \( D - d I \)$; we do not assert that $D gt.eq 0$.

Apply Lemma 8 to $X_s \( B \) gt.eq 0$ and $Y_s > 0$, and denote the tangent map at $Y_s$ by $T_s$.
  Subtract $f \( s^2 \) I$ and integrate symmetrically. In an eigenbasis of $B$,
  the shift identity (3.8) gives $c integral_(bb(R)) \( f \( Y_s \) - f \( s^2 \) I \) thin d s = m I$,
  with the integral understood at symmetric cutoffs. Thus

#[#set math.equation(numbering: n => "(4.7)")
 $ M \( B \) lt.eq m I + mu' \( d \) cal(P) \( D - d I \) \, wide cal(P) =
   frac(c, mu' \( d \)) integral_(bb(R)) T_s thin d s . $ <eq:M-tangent>]

The integral of the tangent maps converges absolutely: for large $\| s \|$,
  their matrix coefficients are $O \( \| s \|^(2 beta - 2) \)$.

#thm([Lemma 4.3.])[
  #emph[In an eigenbasis of $B$ with eigenvalues $z_i$, the map $cal(P)$ is
#[#set math.equation(numbering: n => "(4.8)")
 $ \( cal(P) Z \)_(i j) = P_(i j) Z_(i j) \, wide P_(i j) =
   integral_0^1 (1 + frac(tau \( 1 - tau \) \( z_i - z_j \)^2, d + delta))^(sigma - 1) thin d tau . $ <eq:P-kernel>]

 There is an even probability measure $nu$ on $bb(R)$ such that
#[#set math.equation(numbering: n => "(4.9)")
 $ cal(P) \( Z \) = integral_(bb(R)) e^(i t B) Z e^(- i t B) thin d nu \( t \) . $ <eq:P-average>]

 In particular $cal(P) \( I \) = I$, and $cal(P)$ is self-adjoint for the trace pairing on Hermitian matrices.]
] <lem:average>

#proof[
  The eigenvalues of $Y_s$ are $y_i = \( s - z_i \)^2 + d$. Formula (4.4) yields
  $ f \[ y_i \, y_j \] = integral_0^1 #scale(x: 120%, y: 120%)[\(] \( s - tau z_i - \( 1 - tau \) z_j \)^2 + d +
    delta + tau \( 1 - tau \) \( z_i - z_j \)^2 #scale(x: 120%, y: 120%)[\)]^(beta - 1) thin d tau . $
  These scalar integrands are nonnegative. Tonelli’s theorem and a shift in $s$ evaluate their integral by the
    same calculation as $mu' \( d \)$ in Lemma 5, giving (4.8).
  For $h gt.eq 0$ and $x in bb(R)$, the gamma integral gives
  #[#set math.equation(numbering: n => "(4.10)")
   $ \( 1 + h x^2 \)^(sigma - 1) = frac(1, Gamma \( 1 - sigma \)) integral_0^oo v^(- sigma) e^(- v) e^(- v h x^2)
     thin d v . $ <eq:gamma-mixture>]
  The density $v^(- sigma) e^(- v) \/ Gamma \( 1 - sigma \)$ has total mass one.
    For fixed $v \, h$, $e^(- v h x^2)$ is the characteristic function of a centered Gaussian with variance $2 v
    h$; when $h = 0$, use the point mass at zero. Choose $tau$ uniformly in $\[ 0 \, 1 \]$ and put $h =
    tau \( 1 - tau \) \/ \( d + delta \)$. The resulting mixture of these symmetric Gaussian measures is an even
    probability measure $nu$, independent of $i \, j$. Its characteristic function at $z_i -
    z_j$ is precisely $P_(i j)$, which proves (4.9). The diagonal coefficients are one.
    Finally, changing $t$ to $- t$ in (4.9) and using cyclicity of trace proves self-adjointness. ◻
]

The integrated tangent inequality (4.7) controls $cal(P) \( D \)$,
  while the desired conclusion involves $D$ itself. The next step compares them in precisely the trace pairing
  with $M \( B \)$.

=== 4.3 Trace monotonicity and contraction <trace-monotonicity-and-contraction>

#thm([Lemma 4.4.])[
  #emph[With $B \, D$ and $cal(P)$ as above,
#[#set math.equation(numbering: n => "(4.11)")
 $ "tr" \( M \( B \) D \) gt.eq "tr" \( M \( B \) cal(P) \( D \) \) . $ <eq:trace-average>]

]
] <lem:trace-average>

#proof[
  We use an elementary instance of the generalized Klein trace inequality #cite(label("Petz1994")) Proposition 3,
    p. 289: for any increasing real function $g$ and Hermitian matrices $A_1 \, A_2$,
  #[#set math.equation(numbering: n => "(4.12)")
   $ "tr" #scale(x: 120%, y: 120%)[\(] \( g \( A_1 \) - g \( A_2 \) \) \( A_1 - A_2 \)
     #scale(x: 120%, y: 120%)[\)] gt.eq 0 . $ <eq:trace-monotonicity>]
  Indeed, in eigenbases of the two matrices the trace equals
  $ sum_(i \, j) \( g \( lambda_i \) - g \( nu_j \) \) \( lambda_i - nu_j \) \| chevron.l v_i \,
    w_j chevron.r \|^2 gt.eq 0 . $
  Apply this to $g = f$, $A_1 = U X_s \( B \) U^(*)$ and $A_2 = X_s \( B \)$, with $U = e^(i t B)$.
    Since $U$ commutes with $\( s I - B \)^2$, expansion of the trace gives
  #[#set math.equation(numbering: n => "(4.13)")
   $ 0 lt.eq "tr" #scale(x: 120%, y: 120%)[\(] f \( X_s \( B \) \) \( 2 D - U D U^(*) - U^(*) D U \)
     #scale(x: 120%, y: 120%)[\)] . $ <eq:trace-fixed-s>]
  The coefficient $2 D - U D U^(*) - U^(*) D U$ has trace zero.
    We may therefore subtract $f \( s^2 \) I$ inside the trace, integrate over $\[ - R \, R \]$,
    and pass to the symmetric-cutoff limit defining $M$. The result is
  $ 0 lt.eq "tr" #scale(x: 120%, y: 120%)[\(] M \( B \) \( 2 D - U D U^(*) - U^(*) D U \)
    #scale(x: 120%, y: 120%)[\)] . $
  This passage is also uniform in $t$: the coefficient has norm at most $4 parallel D parallel_(upright("HS"))$,
    whereas $M_R \( B \) arrow.r M \( B \)$ in matrix norm. Average with respect to the even measure $nu$ from
    Lemma 9. Both conjugation terms average to $cal(P) \( D \)$, proving the claim. ◻
]

#proof[
  If $a = 0$, both sides of (4.1) vanish. Otherwise the preceding construction applies.
    Multiply the matrix inequality (4.7) by the positive semidefinite matrix $M =
    a a^(sans(T))$ and take its trace. Since $M^2 = m M$ and $cal(P) \( I \) = I$, we obtain
  $ m "tr" M lt.eq m "tr" M + mu' \( d \) #scale(x: 120%, y: 120%)[\(] "tr" \( M cal(P) \( D \) \) -
    d "tr" M #scale(x: 120%, y: 120%)[\)] . $
  Here $mu' \( d \) > 0$. Lemma 10 therefore gives
  $ a^(sans(T)) D a = "tr" \( M D \) gt.eq "tr" \( M cal(P) \( D \) \) gt.eq d "tr" M = d m . $
  For nonnegative $x \, y$ and $0 < sigma < 1$, $\( x + y \)^sigma lt.eq x^sigma + y^sigma$.
    Apply this with $x = d$, $y = delta$ to get $m = \( d + delta \)^sigma - delta^sigma lt.eq d^sigma$.
    Thus $d m gt.eq m^(1 + 1 \/ sigma) = \| a \|^(2 q)$, completing the proof. ◻
]

== 5 A matrix path with prescribed endpoints <sec:path>

The action argument needs a symmetric matrix path from $K$ to $- K$.
  Its differential equation also contains a lower triangular coefficient matrix $C$, which we are free to choose.
  We choose $C$ by matching the terminal endpoint. At the start of a deformation,
  the matching problem has exactly one solution after identifying each row of $C$ with its negative.
  A compactness argument shows that this solution count cannot disappear modulo two.

Fix $delta > 0$ throughout the remaining construction. We use the matrix field $M =
  M_delta$ and scalar function $mu = mu_delta$ constructed above. Recall the properties needed here.
  The field $M$ is locally Lipschitz on $"Sym"_N$, the space of real symmetric $N times N$ matrices.
  The function $mu$ is locally Lipschitz and strictly increasing, with $mu \( 0 \) = 0$.
  For $K = "diag" \( k_1 \, dots.h \, k_N \)$ and every diagonal sign matrix $S$,

#[#set math.equation(numbering: n => "(5.1)")
 $ M \( S B S \) = S M \( B \) S . $ <path:equivariance>]

For every real unit vector $e$,

#[#set math.equation(numbering: n => "(5.2)")
 $ e^(sans(T)) M \( B \) e lt.eq mu #scale(x: 120%, y: 120%)[\(] e^(sans(T)) K^2 e - \( e^(sans(T)) B e \)^2
   #scale(x: 120%, y: 120%)[\)] . $ <path:comparison>]

Finally, writing $e_i$ for the $i$th standard basis vector,

#[#set math.equation(numbering: n => "(5.3)")
 $ B e_i = t e_i quad arrow.r.double quad M \( B \) e_i = mu \( k_i^2 - t^2 \) e_i . $ <path:coordinate>]

The equivariance in (5.1) only concerns sign matrices, which commute with the fixed matrix $K$.

#thm([Proposition 5.1.])[
  (Connecting path).  #emph[Let $I = \( x_(-) \, x_(+) \)$ be a bounded interval,
    let $u in H_0^1 \( I \; bb(R)^N \)$ satisfy
$ integral_I u \( x \) u \( x \)^(sans(T)) thin d x = I_N \, $

 and let $K = "diag" \( k_1 \, dots.h \, k_N \)$ with every $k_i > 0$.
   Suppose $M$ and $mu$ have the regularity and properties (5.1)–(5.3) just stated.
   For every $epsilon > 0$, there are a real lower triangular matrix $C$ and a path $B in
   C^1 \( overline(I) \; "Sym"_N \)$ such that, with $a = C u$,
#[#set math.equation(numbering: n => "(5.4)")
 $ epsilon B' = M \( B \) - a a^(sans(T)) \, wide B \( x_(-) \) = K \, wide B \( x_(+) \) = - K . $ <path:equation>]

 These choices satisfy
#[#set math.equation(numbering: n => "(5.5)")
 $ parallel B \( x \) parallel_(upright("op")) lt.eq parallel K parallel_(upright("op")) wide \( x in I \) .
   $ <path:operator-bound>]

 For fixed $M$, $K$, and $I$, the matrices $C$ can be chosen bounded uniformly for $0 < epsilon lt.eq 1$.]
] <path:existence>

The parity principle is the compact-one-manifold argument underlying mod-two degree;
  see #cite(label("Milnor1965")) Section 4. The smooth regular-value facts used below are given in
  #cite(label("Milnor1965")) Sections 2–3. We prove the needed relative version for continuous families of bundle
  sections here. A section of a vector bundle assigns to each base point a vector in the fiber above it.
  A zero is #emph[transverse] if the derivative of the section in any local trivialization maps onto that fiber.

#thm([Lemma 5.2.])[
  (Continuation modulo two).  #emph[Let $Q$ be a smooth $d$-dimensional manifold without boundary,
    and let $E arrow.r Q$ be a smooth real vector bundle of rank $d$.
    Suppose $s_theta$, $0 lt.eq theta lt.eq 1$, is a continuous homotopy of sections and
$ { \( q \, theta \) in Q times \[ 0 \, 1 \] : s_theta \( q \) = 0 } $

 is compact. If $s_0$ is smooth and has an odd number of zeros, all transverse, then $s_1$ has a zero.]
] <path:parity>

#proof[
  Suppose that $s_1$ has no zero. Choose a relatively compact smooth domain $Omega subset
    Q$ containing the projection of the entire zero set. Such a domain is obtained by taking a regular level of a
    smooth compactly supported function equal to one near that projection. Fix a smooth fiber metric on $E$.
    On the compact set
  $ \( partial Omega times \[ 0 \, 1 \] \) med union med \( overline(Omega) times { 1 } \) \, $
  the norm of the section has a strictly positive minimum.
  Reparametrize the homotopy so that it is identically $s_0$ on a small initial collar.
    It can then be uniformly approximated on $overline(Omega)
    times \[ 0 \, 1 \]$ by a smooth section that agrees with $s_0$ on a smaller initial collar.
    To construct this approximation, use finitely many bundle charts,
    approximate the continuous coefficient functions by smooth functions,
    and combine them with a smooth partition of unity. A cutoff supported inside the original collar splices this
    approximation with the smooth section $s_0$. Choose the approximation error smaller than one quarter of the
    positive boundary minimum. The approximating section therefore has no zeros near the spatial boundary or the
    final boundary.
  We can also make this smooth section transverse to zero while keeping it unchanged near the initial boundary.
    Here are the finite-dimensional details. In an initial collar its zeros are already transverse,
    since the derivative in the $Q$ directions is onto at each zero of $s_0$.
    The remaining possible zeros lie in a compact subset of the interior.
    Choose finitely many compactly supported local frame sections whose values span every fiber on a neighborhood
    of this subset, with supports away from the initial boundary and the forbidden boundaries.
    Adding linear combinations of these sections gives a finite-dimensional family whose derivative in the new
    parameters is onto wherever transversality is still needed.
    Restrict the parameters to a small open ball in $bb(R)^m$, where $m$ is the number of frame sections.
    Smallness preserves the positive gap on the compact complement of the spanning neighborhood and the initial
    collar, so no new zeros appear there. The universal zero set in the interior is a smooth manifold of dimension
    $m + 1$. Sard’s theorem applied to its projection onto $bb(R)^m$ provides arbitrarily small regular
    parameters. At a zero, write the universal derivative as $A v + D b$,
    with $v$ a $\( q \, theta \)$ variation and $b$ a parameter variation.
    Surjectivity of the projection on the kernel means that $A v = - D b$ is solvable for every $b$.
    Where perturbations are needed, $D$ is onto, so this is equivalent to $A$ being onto;
    elsewhere the section is already transverse. Thus regular parameters make the fixed-parameter section
    transverse. Smallness in the smooth topology preserves the transversality already present on the overlap with
    the initial collar, and smallness in norm preserves the boundary gap.
  The zero set of the resulting section is a compact smooth one-dimensional manifold.
    Its boundary consists exactly of the zeros of $s_0$ on $Omega times { 0 }$.
    A compact one-dimensional manifold has an even number of boundary points, contradicting the assumed odd count.
    No orientation of $Q$ or $E$ is required. ◻
]

#proof[
  Put $kappa = parallel K parallel_(upright("op"))$ and $ell = x_(+) - x_(-)$,
    and use the continuous representative of $u$. Choose a smooth nonnegative function $chi$ on $"Sym"_N$,
    invariant under orthogonal conjugation, compactly supported,
    and equal to one whenever $parallel B parallel_(upright("op")) lt.eq kappa$.
    For example, take $chi \( B \) = eta \( "tr" B^2 \)$ with $eta$ equal to one on $\[ 0 \, N kappa^2 \]$ and
    zero outside a larger bounded interval. The field $hat(M) = chi M$ is bounded and globally Lipschitz.
  #emph[The terminal matching problem.] Let $cal(L)$ denote the vector space of real lower triangular $N times
    N$ matrices. For $C in cal(L)$ and $0 lt.eq theta lt.eq 1$, solve
  #[#set math.equation(numbering: n => "(5.6)")
   $ epsilon B' = theta hat(M) \( B \) - \( C u \) \( C u \)^(sans(T)) \, wide B \( x_(-) \) =
     K . $ <path:homotopy-ode>]
  The bounded globally Lipschitz field and continuous forcing give a unique solution throughout $I$.
    The integral equation and Gronwall’s inequality give continuous dependence on $\( C \, theta \)$. Thus
  $ Phi_theta \( C \) = B \( x_(+) \) + K $
  is a continuous homotopy of maps from $cal(L)$ to $"Sym"_N$.
  At a zero of $Phi_theta$, integration of (5.6) and orthonormality of $u$ give
  #[#set math.equation(numbering: n => "(5.7)")
   $ C C^(sans(T)) = 2 epsilon K + theta integral_I hat(M) \( B \( x \) \) thin d x . $ <path:coefficient-identity>]
  Consequently,
  #[#set math.equation(numbering: n => "(5.8)")
   $ parallel C parallel_(upright("HS"))^2 lt.eq 2 epsilon "tr" K +
     ell sup_B \| "tr" hat(M) \( B \) \| . $ <path:homotopy-bound>]
  For fixed $epsilon$, the full zero set in $cal(L) times \[ 0 \, 1 \]$ is therefore compact.
  #emph[Rows cannot vanish at a matching solution.] Let $G$ be the group of diagonal sign matrices.
    Equation (5.1), invariance of $chi$, and uniqueness of the flow show that
  #[#set math.equation(numbering: n => "(5.9)")
   $ Phi_theta \( S C \) = S Phi_theta \( C \) S wide \( S in G \) . $ <path:terminal-equivariance>]
  Suppose that row $i$ of $C$ vanishes, and let $S_i$ change only its sign.
    Then $S_i C = C$, so uniqueness gives $S_i B S_i = B$ throughout the flow. Hence $B e_i = b_i e_i$. By (5.3),
  $ epsilon b'_i = theta chi \( B \( x \) \) mu \( k_i^2 - b_i^2 \) \, wide b_i \( x_(-) \) = k_i . $
  Regarding $theta chi \( B \( x \) \) \/ epsilon$ as a known continuous coefficient,
    local Lipschitz uniqueness for this scalar equation gives $b_i equiv k_i$.
    Since $k_i > 0$, the terminal value cannot be $- k_i$. Thus no zero of $Phi_theta$ has a vanishing row.
  Let $cal(L)^times subset cal(L)$ be the open subset on which every row is nonzero.
    The compact joint zero set lies inside $cal(L)^times times \[ 0 \, 1 \]$,
    and hence a positive distance away from every zero-row stratum. We do not require $C$ to be invertible.
  #emph[One zero modulo signs persists.] The action of $G$ on $cal(L)^times$ is free:
    changing the sign of a nonzero row cannot fix $C$. Its quotient
  $ Q = cal(L)^times \/ G $
  is therefore a smooth manifold of dimension $d = N \( N + 1 \) \/ 2$.
    Concretely, each row $i$ belongs to $bb(R)^i \\ { 0 }$ and is identified with its negative.
    Sign conjugation on symmetric matrices defines the rank-$d$ vector bundle
  $ E = \( cal(L)^times times "Sym"_N \) \/ G arrow.r Q \, wide \( C \, Z \) tilde.op \( S C \, S Z S \) . $
  By (5.9), the maps $Phi_theta$ descend to a continuous homotopy of sections of this bundle.
    Their joint zero set remains compact.
  At $theta = 0$,
  $ Phi_0 \( C \) = 2 K - epsilon^(- 1) C C^(sans(T)) . $
  The lower triangular solutions of $C C^(sans(T)) = 2 epsilon K$ are exactly
  $ C = "diag" \( plus.minus sqrt(2 epsilon k_1) \, dots.h \, plus.minus sqrt(2 epsilon k_N) \) . $
  Indeed, the first row determines $C_11$, the other entries of the first column then vanish,
    and the same argument applies successively to the remaining principal blocks.
    These solutions form one $G$-orbit. At any one of them, writing $C = "diag" \( c_i \)$,
  $ D Phi_0 \( C \) \[ H \] = - epsilon^(- 1) \( H C^(sans(T)) + C H^(sans(T)) \) wide \( H in cal(L) \) . $
  Its diagonal entries are $- 2 c_i H_(i i) \/ epsilon$, and its entries with $i > j$ are $-
    c_j H_(i j) \/ epsilon$. Since every $c_i eq.not 0$, this linear map is an isomorphism onto the symmetric
    matrices. The initial quotient section has exactly one transverse zero. Lemma 12 now gives a zero of $Phi_1$.
  #emph[The endpoints remove the cutoff.] Take a path obtained from this zero.
    For a fixed real unit vector $e$, put $h \( x \) = e^(sans(T)) B \( x \) e$.
    Whenever $\| h \( x \) \| > kappa$, (5.2) implies
  $ epsilon h' \( x \) & lt.eq chi \( B \( x \) \) mu #scale(x: 120%, y: 120%)[\(] e^(sans(T)) K^2 e -
    h \( x \)^2 #scale(x: 120%, y: 120%)[\)] - \| e^(sans(T)) C u \( x \) \|^2 lt.eq 0 . $
  Here $e^(sans(T)) K^2 e lt.eq kappa^2 < h \( x \)^2$; the last inequality uses $chi gt.eq
    0$ and remains true where $chi = 0$. Both endpoint values of $h$ lie in $\[ - kappa \, kappa \]$.
    A component of ${ h > kappa }$ cannot start from the initial side:
    on that component $h$ is nonincreasing, whereas its left endpoint has value $kappa$.
    Similarly, a component of ${ h < - kappa }$ cannot return to the final endpoint:
    its right endpoint would have value $- kappa$, again contradicting nonincrease.
    Thus $\| h \( x \) \| lt.eq kappa$ throughout $I$.
  Since $e$ was arbitrary, this proves (5.5). Therefore $chi \( B \( x \) \) = 1$ everywhere,
    and the path solves the uncut equation (5.4). Finally, its integrated equation gives, for $0 < epsilon lt.eq 1$,
  #[#set math.equation(numbering: n => "(5.10)")
   $ parallel C parallel_(upright("HS"))^2 lt.eq 2 "tr" K + ell
     sup_(parallel B parallel_(upright("op")) lt.eq kappa) \| "tr" M \( B \) \| . $ <path:uniform-coefficients>]
  This is the asserted bound on $C$. ◻
]

For the regularized field $M_delta$, the bound (5.10) may depend on $delta$.
  With $delta$ fixed, it implies that all pairs $\( B \( x \) \, C u \( x \) \)$ produced for $0 < epsilon lt.eq
  1$ lie in one compact subset of $"Sym"_N times bb(R)^N$. This is the compactness needed in the action limit;
  it requires no bound on $B'$ uniform in $epsilon$.

== 6 From the matrix path to the action <sec:action-limit>

We now prove Theorem 2. The matrix comparison controls points where $M \( B \) = a a^(sans(T))$ exactly.
  The differential equation supplies a penalty for the remaining points,
  and compactness makes that penalty effective without requiring convergence of the chosen coefficients $C$.

#proof[
  Fix $delta > 0$, and use the field $M$ and primitive $J$ from Section 3.
    For each $0 < epsilon lt.eq 1$, the connecting-path result of Section 5 provides a lower triangular matrix
    $C_epsilon$ and a path $B_epsilon$ satisfying (2.5). Write $a_epsilon =
    C_epsilon u$ and temporarily suppress the subscripts. The path $B$ is $C^1$,
    and $a in H_0^1 \( I \; bb(R)^N \)$ is absolutely continuous. The chain and product rules give, almost everywhere,
  #[#set math.equation(numbering: n => "(6.1)")
   $ \( J \( B \) + a^(sans(T)) B a \)' & = 2 \( a' \)^(sans(T)) B a -
     "tr" #scale(x: 120%, y: 120%)[\(] \( M \( B \) - a a^(sans(T)) \) B' #scale(x: 120%, y: 120%)[\)]\
 & = 2 \( a' \)^(sans(T)) B a - epsilon^(- 1) parallel M \( B \) -
   a a^(sans(T)) parallel_(upright("HS"))^2 . $ <eq:action-identity>]
  Since $a$ vanishes at the endpoints, integration and $2 \( a' \)^(sans(T)) B a lt.eq \| a' \|^2 +
    a^(sans(T)) B^2 a$ yield
  #[#set math.equation(numbering: n => "(6.2)")
   $ J \( - K \) - J \( K \) lt.eq cal(E)_K \( a \) + integral_I F_epsilon \( B \( x \) \, a \( x \) \) thin d
     x \, $ <eq:penalty-bound>]
  where
  $ F_epsilon \( B \, a \) = \| a \|^(2 q) - a^(sans(T)) \( K^2 - B^2 \) a - epsilon^(- 1) parallel M \( B \) -
    a a^(sans(T)) parallel_(upright("HS"))^2 . $
  The bounds from Section 5 place every pair $\( B_epsilon \( x \) \, a_epsilon \( x \) \)$,
    for $x in overline(I)$ and $0 < epsilon lt.eq 1$, in a single compact set $cal(K)$.
    This uses the continuous representative of $u$, the bound on $C_epsilon$, and fixed $delta$. We claim that
  #[#set math.equation(numbering: n => "(6.3)")
   $ eta_epsilon := max_(\( B \, a \) in cal(K)) max { F_epsilon \( B \, a \) \, 0 } arrow.r 0 . $ <eq:uniform-penalty>]
  Otherwise there would be $eta > 0$, a sequence $epsilon_n arrow.b 0$,
    and a convergent sequence $\( B_n \, a_n \) in cal(K)$ with $F_(epsilon_n) \( B_n \, a_n \) gt.eq eta$.
    The first two terms of $F_epsilon$ are uniformly bounded on $cal(K)$, so $M \( B_n \) -
    a_n a_n^(sans(T)) arrow.r 0$. At the limit $\( B_(*) \, a_(*) \)$ we have $M \( B_(*) \) =
    a_(*) a_(*)^(sans(T))$ and
  $ \| a_(*) \|^(2 q) - a_(*)^(sans(T)) \( K^2 - B_(*)^2 \) a_(*) gt.eq eta \, $
  contrary to Proposition 7. This proves (6.3).
  Equation (6.2) now implies
  $ J \( - K \) - J \( K \) lt.eq sup_(C upright(" lower triangular")) cal(E)_K \( C u \) + \| I \| eta_epsilon . $
  Let $epsilon arrow.b 0$ at this fixed $delta$. By Lemma 6,
  $ sup_C cal(E)_K \( C u \) gt.eq sum_i integral_(- k_i)^(k_i)
    #scale(x: 120%, y: 120%)[\(] \( k_i^2 - s^2 + delta \)^sigma - delta^sigma #scale(x: 120%, y: 120%)[\)] thin d s . $
  Finally let $delta arrow.b 0$. On each integration interval the integrand converges to $\( k_i^2 - s^2 \)^sigma$
    and lies between zero and this same function, by subadditivity of the power $sigma$.
    Dominated convergence gives (2.2). No convergence of $C_epsilon$, and no bound uniform in $delta$, has been used. ◻
]

== 7 From the action inequality to spectral moments <sec:spectral>

We apply Theorem 2 first to ordered Dirichlet eigenfunctions.
  We then pass to the line using finite-dimensional trial spaces.
  This last step treats all negative eigenvalues, without assuming in advance that their moment is finite.

Throughout this section, $0 < sigma < 1$, $p = 1 + sigma$, $q = 1 + 1 \/ sigma$, and $gamma = sigma + 1 \/ 2$. Write

#[#set math.equation(numbering: n => "(7.1)")
 $ A_sigma = frac(sigma^sigma, \( 1 + sigma \)^(1 + sigma)) \, wide ell_sigma =
   frac(A_sigma, upright(B) \( 1 \/ 2 \, 1 + sigma \)) \, $ <spectral:constant>]

where $upright(B)$ denotes the beta function.

=== 7.1 Quadratic forms and negative spectrum <quadratic-forms-and-negative-spectrum>

For $0 lt.eq W in L^p \( bb(R) \)$, define

$ h_(- W) \[ v \] = integral_(bb(R)) \| v' \|^2 - integral_(bb(R)) W \| v \|^2 \, wide v in H^1 \( bb(R) \) . $

We record the facts needed to define its operator and to exhaust its negative eigenvalues.
  We use the association of a densely defined closed semibounded form with its self-adjoint operator,
  and the spectral description of the operator and its form domain, in #cite(label("Teschl2009")) Theorem 2.13,
  Theorems 3.7–3.8 and (3.50)–(3.51). All theorem numbers here refer to the 2009 first edition.

#thm([Lemma 7.1.])[
  #emph[Let $p > 1$ and $0 lt.eq W in L^p \( bb(R) \)$. The form $h_(- W)$ is closed and bounded below on
    $H^1 \( bb(R) \)$. For its associated self-adjoint operator $H_(- W)$,
    every spectral projection onto $\( - oo \, - alpha \]$, with $alpha > 0$, has finite rank.
    Thus its negative spectrum consists of eigenvalues of finite multiplicity,
    with possible accumulation only at zero. On a bounded interval $I$,
    the corresponding Dirichlet form on $H_0^1 \( I \)$ is closed and bounded below and has compact resolvent.]
] <spectral:forms>

#proof[
  Put $p' = p \/ \( p - 1 \)$. The one-dimensional Sobolev inequality and interpolation give
  $ parallel v parallel_(2 p')^2 lt.eq parallel v parallel_oo^(2 \/ p) parallel v parallel_2^(2 - 2 \/ p) lt.eq
    2^(1 \/ p) parallel v' parallel_2^(1 \/ p) parallel v parallel_2^(2 - 1 \/ p) . $
  Consequently Hölder’s and Young’s inequalities imply that, for every $eta > 0$, there is $b_(eta \, W) < oo$ such that
  #[#set math.equation(numbering: n => "(7.2)")
   $ integral_(bb(R)) W \| v \|^2 lt.eq eta parallel v' parallel_2^2 +
     b_(eta \, W) parallel v parallel_2^2 . $ <spectral:form-bound>]
  The KLMN Theorem #cite(label("Teschl2009")) Theorem 6.24 now gives closure and semiboundedness,
    with form domain exactly $H^1 \( bb(R) \)$.
  Multiplication by $sqrt(W)$ is compact from $H^1 \( bb(R) \)$ to $L^2 \( bb(R) \)$.
    Indeed, choose nonnegative bounded, compactly supported $W_n$ converging to $W$ in $L^p$.
    Multiplication by $sqrt(W_n)$ is compact by local Rellich compactness, and
  $ parallel \( sqrt(W) - sqrt(W_n) \) v parallel_2^2 lt.eq parallel W -
    W_n parallel_p parallel v parallel_(2 p')^2 lt.eq C_p parallel W - W_n parallel_p parallel v parallel_(H^1)^2 . $
  Thus these multiplication operators converge in operator norm.
  If the spectral subspace of $H_(- W)$ for $\( - oo \, - alpha \]$ were infinite-dimensional,
    it would contain an orthonormal sequence $v_n$. Semiboundedness places this entire spectral subspace in the
    form domain. The lower bound obtained from (7.2) with $eta = 1 \/ 2$, together with $h_(- W) \[ v_n \] lt.eq -
    alpha$, bounds this sequence in $H^1$. After passing to a subsequence, it converges weakly to zero in $H^1$,
    because it is orthonormal in $L^2$. Compactness then gives $sqrt(W) v_n arrow.r 0$ in $L^2$, contradicting
  $ - alpha gt.eq h_(- W) \[ v_n \] gt.eq - parallel sqrt(W) v_n parallel_2^2 . $
  This proves the negative-spectrum assertion. On a bounded interval,
    the same form estimate follows by zero extension. The form norm is equivalent to the $H_0^1$ norm,
    whose embedding into $L^2 \( I \)$ is compact; hence the Dirichlet operator has compact resolvent. ◻
]

=== 7.2 The Dirichlet estimate <the-dirichlet-estimate>

The order of the eigenfunctions is what makes the triangular coefficient restriction in Theorem 2 useful.

#thm([Proposition 7.2.])[
  #emph[Let $I$ be a bounded interval and $0 lt.eq W in L^p \( I \)$.
    If $- k_1^2 \, dots.h \, - k_N^2$ are the first $N$ negative Dirichlet eigenvalues of $- d^2 \/ d x^2 - W$,
    ordered so that $k_1 gt.eq dots.h.c gt.eq k_N > 0$, then
#[#set math.equation(numbering: n => "(7.3)")
 $ sum_(j = 1)^N k_j^(2 gamma) lt.eq ell_sigma integral_I W^p . $ <spectral:dirichlet-bound>]

]
] <spectral:dirichlet>

#proof[
  Choose real orthonormal eigenfunctions $u_1 \, dots.h \, u_N$; these exist because the Dirichlet form is real.
    Put $u = \( u_1 \, dots.h \, u_N \)^(sans(T))$ and $K = "diag" \( k_1 \, dots.h \, k_N \)$.
    For every real lower triangular matrix $C$, write $a = C u$.
    Its $i$th component lies in the span of $u_1 \, dots.h \, u_i$, and the eigenfunction equations in form sense give
  $ integral_I #scale(x: 120%, y: 120%)[\(] \| a'_i \|^2 - W \| a_i \|^2 +
    k_i^2 \| a_i \|^2 #scale(x: 120%, y: 120%)[\)] = sum_(j lt.eq i) C_(i j)^2 \( k_i^2 - k_j^2 \) lt.eq 0 . $
  Summing over $i$ and putting $m = \| a \|^2$, we obtain
  $ cal(E)_K \( a \) lt.eq integral_I \( W m - m^q \) lt.eq A_sigma integral_I W^(1 + sigma) . $
  The last inequality follows by maximizing $W m - m^q$ over $m gt.eq 0$; the maximizer is $\( W \/ q \)^sigma$.
  Theorem 2 therefore yields
  $ sum_(j = 1)^N integral_(- k_j)^(k_j) \( k_j^2 - s^2 \)^sigma thin d s lt.eq A_sigma integral_I W^(1 + sigma) . $
  Substituting $s = k_j t$ in each integral gives $upright(B) \( 1 \/ 2 \, 1 + sigma \) k_j^(2 sigma + 1)$,
    proving (7.3). ◻
]

The beta–gamma identity identifies the constant without any limiting argument in $sigma$:

#[#set math.equation(numbering: n => "(7.4)")
 $ ell_sigma & = (frac(sigma, 1 + sigma))^sigma frac(Gamma \( sigma + 3 \/ 2 \), sqrt(pi) thin Gamma \( sigma + 2 \))\
 & = 2 (frac(sigma, 1 + sigma))^sigma L_(gamma \, 1)^(upright("cl")) . $ <spectral:constant-identification>]

=== 7.3 Exhaustion of the line <exhaustion-of-the-line>

Let $0 lt.eq W in L^p \( bb(R) \)$. If there are no negative eigenvalues, the trace inequality is immediate.
  Otherwise fix any finite number $N$ of them, counted with multiplicity and ordered increasingly:

$ lambda_1 lt.eq dots.h.c lt.eq lambda_N < 0 . $

Let $phi.alt_1 \, dots.h \, phi.alt_N in H^1 \( bb(R) \)$ be corresponding orthonormal eigenfunctions.
  Choose smooth cutoffs $chi_R$ equal to one on $\[ - R \, R \]$, supported in $I_R = \( - 2 R \, 2 R \)$,
  and satisfying $0 lt.eq chi_R lt.eq 1$ and $parallel chi'_R parallel_oo lt.eq c \/ R$. Then

$ v_(j \, R) = chi_R phi.alt_j arrow.r phi.alt_j quad upright("in ") H^1 \( bb(R) \) . $

Hölder’s inequality and the embedding $H^1 subset L^(2 p')$ show that the potential form is continuous under this
  convergence.

For clarity, let $G_R$ and $Q_R$ be the Gram and form matrices of the $N$ functions $v_(j \, R)$. Then

$ G_R arrow.r I_N \, wide Q_R arrow.r Lambda := "diag" \( lambda_1 \, dots.h \, lambda_N \) $

in matrix norm. In particular the functions are linearly independent for large $R$.
  If $g_R = parallel G_R - I_N parallel_(upright("op")) < 1$ and $e_R = parallel Q_R -
  Lambda parallel_(upright("op"))$, their Rayleigh quotients differ uniformly from the limiting coefficient-space
  quotients by at most

$ eta_R = frac(e_R + parallel Lambda parallel_(upright("op")) g_R, 1 - g_R) arrow.r 0 . $

Applying the form-domain min–max principle #cite(label("Teschl2009")) Theorem 4.10 and the following form-domain
  extension to the span of $v_(1 \, R) \, dots.h \, v_(j \, R)$ gives, for every $j lt.eq N$,

$ lambda_j \( I_R \) lt.eq lambda_j + eta_R \, $

where $lambda_j \( I_R \)$ is the $j$th Dirichlet eigenvalue on $I_R$.
  All these levels are negative for sufficiently large $R$. Proposition 14 now implies

$ sum_(j = 1)^N \( - lambda_j - eta_R \)^gamma lt.eq sum_(j = 1)^N \| lambda_j \( I_R \) \|^gamma lt.eq
  ell_sigma integral_(I_R) W^p lt.eq ell_sigma integral_(bb(R)) W^p . $

Letting $R arrow.r oo$ proves the estimate for every finite partial sum. Taking their supremum gives

#[#set math.equation(numbering: n => "(7.5)")
 $ "Tr" \( H_(- W) \)_(-)^gamma lt.eq ell_sigma integral_(bb(R)) W^p . $ <spectral:line-bound>]

Thus the full moment is finite even when there are infinitely many negative eigenvalues.
  No approximation of $W$ by smoother potentials is needed.

=== 7.4 Signed potentials <signed-potentials>

To include unbounded positive parts, we specify the form domain in the signed-potential statement.

#thm([Corollary 7.3.])[
  #emph[Let $V$ be real measurable with $V_(-) in L^p \( bb(R) \)$, and suppose
$ cal(D)_V = {v in H^1 \( bb(R) \) : integral_(bb(R)) V_(+) \| v \|^2 < oo} $

 is dense in $L^2 \( bb(R) \)$. This holds in particular if $V_(+) in L_(upright("loc"))^1 \( bb(R) \)$. The form
$ h_V \[ v \] = integral_(bb(R)) \| v' \|^2 + integral_(bb(R)) V_(+) \| v \|^2 -
  integral_(bb(R)) V_(-) \| v \|^2 \, wide v in cal(D)_V \, $

 is closed and bounded below. Its associated operator $H_V$ has discrete negative spectrum and satisfies
$ "Tr" \( H_V \)_(-)^gamma lt.eq ell_sigma integral_(bb(R)) V_(-)^p . $

]
] <spectral:signed>

#proof[
  The positive form $integral \| v' \|^2 + integral V_(+) \| v \|^2$ is closed on $cal(D)_V$,
    by completeness of $H^1$ and of the weighted $L^2$ space.
    Estimate (7.2), with $W = V_(-)$, proves closure and semiboundedness after subtraction of the negative part.
    If $V_(+) in L_(upright("loc"))^1$, then $C_c^oo \( bb(R) \) subset cal(D)_V$, proving the asserted density.
    The compactness argument in Lemma 13 still applies. On a negative spectral subspace bounded away from zero,
    the same relative form bound controls the $H^1$ norm of unit vectors,
    since the positive potential term can be discarded. Compactness of multiplication by $sqrt(V_(-))$ then
    excludes an infinite orthonormal sequence in that subspace:
    the integral against $V_(-)$ would tend to zero along a subsequence,
    whereas its negative form energy stays bounded away from zero. Thus every such spectral projection has finite rank.
  For $v in cal(D)_V subset H^1 \( bb(R) \)$, one has $h_V \[ v \] gt.eq h_(- V_(-)) \[ v \]$.
    The min–max principle, with this inclusion of form domains,
    bounds each negative eigenvalue of $H_V$ below by the corresponding negative eigenvalue of $H_(- V_(-))$;
    in particular, if $H_V$ has $j$ negative eigenvalues, so does $H_(- V_(-))$. Summation and (7.5) prove the result. ◻
]

=== 7.5 Sharpness <sharpness>

Put $r = 1 \/ sigma > 1$ and consider

$ W \( x \) = \( r + 1 \) "sech"^2 \( r x \) \, wide psi \( x \) = "sech"^(1 \/ r) \( r x \) . $

Direct differentiation gives

$ psi' / psi = - tanh \( r x \) \, wide psi'' / psi = 1 - \( r + 1 \) "sech"^2 \( r x \) . $

The function $psi$ and its first two derivatives decay exponentially.
  Thus $psi in H^2 \( bb(R) \)$, the operator domain for this bounded $W$, and $H_(- W) psi = - psi$.
  Substitution $t = r x$, followed by $z = tanh t$, gives

$ integral_(bb(R)) W^p = frac(\( r + 1 \)^p, r) thin upright(B) \( 1 \/ 2 \, p \) \, wide
  (integral_(bb(R)) W^p)^(- 1) = ell_sigma . $

The eigenvalue $- 1$ gives $"Tr" \( H_(- W) \)_(-)^gamma gt.eq 1$;
  the upper bound (7.5) gives the reverse inequality. This completes the proof of Theorem 1.
  Hence this potential attains equality, and the constant in (7.4) is optimal.
  This establishes $L_(gamma \, 1) = L_(gamma \, 1)^(\( 1 \))$ throughout $1 \/ 2 < gamma < 3 \/ 2$.

#bibliography("refs.bib", style: "ieee", title: [References])
