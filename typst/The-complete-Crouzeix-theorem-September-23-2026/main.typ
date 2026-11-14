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

#align(center)[#text(size: 16pt, weight: "bold")[The complete Crouzeix theorem: \
optimal similarity and a common positive boundary representation]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 The structural question <the-structural-question>

Can one choose a single controlled change of inner product and a single positive boundary density to represent all
  matrix-valued analytic evaluations of a matrix? We answer this question on an analytic convex neighborhood of
  its numerical range. The metric and density depend on the matrix and the enclosing domain,
  but neither depends on the coefficient size or the function being evaluated.
  The resulting complete inequality also holds for every bounded operator on an arbitrary complex Hilbert space,
  by a finite compression argument in Section 6.

=== Coordinates and evaluation <coordinates-and-evaluation>

Write $bb(D) = { z in bb(C) : \| z \| < 1 }$ and $bb(T) = partial bb(D)$,
  with normalized angular measure $d sigma \( e^(i theta) \) = d theta \/ \( 2 pi \)$.
  For $A in M_n \( bb(C) \)$ its numerical range is

$ W \( A \) = { x^(*) A x : x in bb(C)^n \, med x^(*) x = 1 } . $

All operator norms are Hilbert-space operator norms, and tensor products are Hilbert tensor products with the base
  space first. For a matrix-valued function $v$ holomorphic near the spectrum,
  $v \[ A \]$ denotes holomorphic evaluation: on a Jordan block $J = beta I +
  N$ of size $s$ it is $sum_(j = 0)^(s - 1) N^j ⊗ v^(\( j \)) \( beta \) \/ j !$,
  followed by the change of basis on the first factor. In particular, $v \[ A \] =
  sum_j A^j ⊗ B_j$ when $v \( z \) = sum_j B_j z^j$. Inner products are conjugate-linear in the first argument,
  and $U prec.curly.eq V$ means that $V - U$ is positive semidefinite.
  The symbol $zws^(*)$ denotes the adjoint on a base or coefficient Hilbert space,
  $zws^(sans(T))$ ordinary transpose, and $zws^dagger$ the adjoint of an operator on a function space.

Call $Omega$ #emph[admissible] when it is a bounded open convex subset of $bb(C)$ with regular real-analytic
  Jordan boundary.

#thm([Lemma 1.1.])[
  (Conformal coordinates).  #emph[For every admissible $Omega$ there is a conformal bijection $f : Omega arrow.r
    bb(D)$ such that $f$ and $f^(- 1)$ extend univalently through $overline(Omega)$ and $overline(bb(D))$,
    respectively. There is also a conformal bijection $G : { \| t \| > 1 } arrow.r
    bb(C) \\ overline(Omega)$ that extends univalently to ${ \| t \| > r } union { oo }$ for some $0 < r < 1$,
    as a sphere map, with a simple pole at infinity and $G \( bb(T) \) = partial Omega$.
    On $bb(T)$, $t G' \( t \)$ is an outward normal and $psi = f compose
    G$ is an orientation-preserving smooth circle diffeomorphism.]
] <lem:conformal-coordinates>

The complete local Riemann-mapping, harmonic-reflection, and collar argument is in Appendix 7.

Fix such an $Omega$ with $W \( A \) subset Omega$, and choose its coordinates $f \, G$ from Lemma 1.
  Put $T = f \( A \)$ and define

#[#set math.equation(numbering: n => "(1.1)")
 $ kappa^2 = min { tau in bb(R) : I prec.curly.eq H prec.curly.eq tau I \, med
   T^(*) H T prec.curly.eq H upright(" for some ") H = H^(*) } . $ <eq:minimum>]

A strictly feasible pair means that $H - I$, $tau I - H$, and $H - T^(*) H T$ are all positive definite.
  Existence and attainment of the minimum are part of the first conclusion.

#thm([Theorem 1.2.])[
  (The optimal metric).  #emph[For every admissible $Omega$, every finite $n gt.eq 1$,
    every $A in M_n \( bb(C) \)$ with $W \( A \) subset Omega$, and the interior conformal coordinate $f$ above,
    the problem (1.1) is strictly feasible and has an attained minimum $1 lt.eq kappa^2 lt.eq 4$.
    If $H$ is a minimizing metric, then
$ S = H^(1 \/ 2) \, wide A' = S A S^(- 1) \, wide D = S f \( A \) S^(- 1) = f \( A' \) $

 satisfy
$ D^(*) D prec.curly.eq I \, wide rho \( D \) < 1 \, wide parallel S parallel parallel S^(- 1) parallel =
  kappa lt.eq 2 . $

]
] <thm:structural>

#thm([Theorem 1.3.])[
  (A common positive representation).  #emph[With the same $Omega \, A \, f \,
    G$ and any chosen minimizing metric in Theorem 2, there is one continuous function $Lambda : bb(T) arrow.r
    M_n \( bb(C) \)$ satisfying
$ Lambda \( t \) succ.curly.eq 0 \, wide integral_(bb(T)) Lambda \( t \) thin d sigma \( t \) = I_n \, $

 such that, for every positive integer $m$ and every $M_m \( bb(C) \)$-valued function $v$ holomorphic on a
   neighborhood of $overline(Omega)$,
#[#set math.equation(numbering: n => "(1.2)")
 $ v \[ A' \] = integral_(bb(T)) Lambda \( t \) ⊗ v \( G \( t \) \) thin d sigma \( t \) \, wide
   parallel v \[ A \] parallel lt.eq kappa max_(overline(Omega)) parallel v parallel . $ <eq:representation-target>]

 The same $S$, $Lambda$, and $kappa$ work for all $m$ and $v$.]
] <thm:representation>

=== The complete inequality and previous work <the-complete-inequality-and-previous-work>

For a bounded operator $A$ on a nonzero complex Hilbert space $cal(H)$, write $W \( A \) = { chevron.l x \,
  A x chevron.r : parallel x parallel = 1 }$. For a matrix polynomial $P \( z \) = sum_(j = 0)^d B_j z^j$,
  with $B_j in M_m \( bb(C) \)$, put $P \[ A \] = sum_(j = 0)^d A^j ⊗ B_j$ on $cal(H) ⊗ bb(C)^m$.
  The operator formulation of the complete Crouzeix conjecture asks whether $parallel P \[ A \] parallel lt.eq
  2 sup_(W \( A \)) parallel P parallel$ holds independently of the Hilbert space,
  the finite coefficient size $m$, and the degree $d$. The scalar problem is the case $m = 1$.
  Theorems 2 and 3, together with analytic convex outer approximation,
  give the finite-matrix inequality in Corollary 10. Corollary 12 transfers it to all bounded Hilbert-space
  operators, including those on nonseparable spaces, and gives the corresponding rational and holomorphic bounds
  on $overline(W \( A \))$. The optimal similarity and the common density are the finite-dimensional structural
  conclusions proved before these passages.

Crouzeix formulated the scalar constant-two question in 2004 and obtained a universal complete bound of $11.08$ in
  2007 [9,10]. Delyon and Delyon’s positive integral representations form an important part of the numerical-range
  method [12]. Crouzeix and Palencia used a positive double-layer potential and a conjugate-data Cauchy transform
  to obtain the complete bound $1 + sqrt(2)$ [11]; Ransford and Schwenninger simplified its final norm argument
  [21]. Recent preprints by Jin, Lorist and Schwenninger, and Luo present scalar constant-two proofs [14,16,17].
  Lorist and Schwenninger’s Theorem 3 covers bounded Hilbert-space operators;
  their Section 3(iv) explains why its commutation argument does not immediately pass to matrix coefficients.
  Åhag, Czyż, and Virtanen prove the complete constant-two estimate for base matrices of order at most three,
  with arbitrary coefficient size [1] Theorem 1.1. The present comparison retains both matrix multiplication
  orders in all finite base dimensions, which suffices for the bounded-operator consequence by compression.

The abstract connection with controlled similarity is classical.
  Paulsen’s similarity theorem identifies the optimal condition number with the completely bounded norm [19]
  Section 2, unnumbered theorem; Arveson’s dilation theorem relates complete contractivity to a normal boundary
  dilation [3] Theorem 1.2.2. For numerical-range ellipses in base dimension two, Badea, Crouzeix,
  and Delyon construct a conformal similarity with condition number at most two [4] Theorem 5.2 and Corollary 5.3.
  Here we construct the minimizing metric, its endpoint extremal data,
  and the continuous density in a fixed boundary parameter, and prove $kappa lt.eq
  2$ for the optimal metric constant in (1.1).

The direct proof in [18] reaches the polynomial inequality from the singular vectors of the polynomial being
  evaluated. Its exterior kernel and original-matrix resolvent calculations also occur here,
  with complete local proofs. The present argument instead chooses one optimal metric first and proves a
  representation valid for every coefficient size and every analytic test function.
  The two manuscripts have separate complete proof paths.

=== How the two conclusions are proved <how-the-two-conclusions-are-proved>

Section 2 first attains the metric minimum and constructs its positive disk density before estimating $kappa$.
  The boundary change of coordinates

$ t in bb(T) med arrow.r^(med G med) med G \( t \) in partial Omega med arrow.r^(med f med) med psi \( t \) in bb(T) $

has a positive angular Jacobian. Including it in the density gives $Lambda$.
  Its mass-one identity makes the map $b mapsto \[ t mapsto \( Lambda \( t \)^(1 \/ 2) ⊗ I_m \) b \]$ an isometric
  embedding of $bb(C)^n ⊗ bb(C)^m$ into boundary $L^2$ functions.
  Multiplying there by $I_n ⊗ v \( G \( t \) \)$ and applying the embedding’s adjoint gives $v \[ A' \]$.
  This is the common compression at every coefficient size. Figure 1 displays the two boundary parameters.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((-3.15, 0), radius: 0.756, fill: rgb("#f3f4f8"), stroke: none)
  circle((-3.15, 0), radius: 0.756, stroke: (paint: rgb("#182d6f"), thickness: 0.7pt, miter-limit: 10))
  content((-3.15, 0), [#text(size: 9pt)[$bb(D)$]])
  circle((0, 0), radius: (0.903, 0.6825), fill: rgb("#f3f4f8"), stroke: none)
  circle((0, 0), radius: (0.903, 0.6825), stroke: (paint: rgb("#182d6f"), thickness: 0.7pt, miter-limit: 10))
  content((0, 0), [#text(size: 9pt)[$Omega$]])
  rect((2.1, -1.071), (4.2, 1.071), fill: rgb("#f3f4f8"), stroke: none)
  circle((3.15, 0), radius: 0.756, fill: rgb("#ffffff"), stroke: none)
  circle((3.15, 0), radius: 0.756, stroke: (paint: rgb("#182d6f"), thickness: 0.7pt, miter-limit: 10))
  content((3.15, 0), [#text(size: 9pt)[$bb(D)$]])
  content((3.15, 0.924), [#text(size: 8pt)[$|t|>1$]])
  line((-1.071, 0.231), (-2.184, 0.231), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((-1.628, 0.231), [#text(size: 8pt)[interior]], anchor: "north", padding: 0.1176cm)
  line((2.121, 0.231), (1.071, 0.231), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((1.596, 0.231), [#text(size: 8pt)[exterior]], anchor: "north", padding: 0.1176cm)
  circle((-3.15, -0.756), radius: 0.05292, fill: rgb("#182d6f"), stroke: none)
  circle((0, -0.6825), radius: 0.05292, fill: rgb("#182d6f"), stroke: none)
  circle((3.15, -0.756), radius: 0.05292, fill: rgb("#182d6f"), stroke: none)
  content((-3.15, -0.798), [#text(size: 9pt)[$zeta$]], anchor: "north", padding: 0.1176cm)
  content((0, -0.735), [#text(size: 9pt)[$G(t)$]], anchor: "north", padding: 0.1176cm)
  content((3.15, -0.798), [#text(size: 9pt)[$t$]], anchor: "north", padding: 0.1176cm)
  line((3.15, -1.428), (-3.15, -1.428), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"), mark: (end: (symbol: ">>", fill: black)))
  content((0, -1.428), [#text(size: 9pt)[$zeta =f(G(t))$]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 1: The two conformal coordinates, shown schematically; $Omega$ need not be an ellipse. The Cauchy projection uses the exterior boundary parameter $t$ and its uniform circle measure. The contraction representation uses the interior disk coordinate $zeta$; passing between them requires the positive Jacobian of the boundary map $f compose G$. The shaded exterior on the right is the domain of $G$. ],
) <fig:coordinates>

If $kappa > 1$, finite-dimensional separation supplies unit vectors $x \,
  y in bb(C)^n ⊗ bb(C)^n$ in the $kappa$ and $1$ eigenspaces of $S ⊗ I_n$, respectively.
  A unitary realization gives a contractive $M_n \( bb(C) \)$-valued disk function $F_(bb(D))$ with
  $F_(bb(D)) \[ D \] x = y$. This auxiliary function has coefficient size $n$;
  its role is to test one base-space metric, not to restrict the independently chosen target size $m$.

Once the extremal vectors are available, Section 3 introduces the local boundary tools needed to compare them:
  the exterior kernel, the actual Cauchy adjoint, both analytic multiplication orders,
  and the positive resolvent of the original $A$. In Section 4,
  equality in the common compression gives the forward and adjoint relations between the boundary vectors
  $x_Lambda \( t \) = \( Lambda \( t \)^(1 \/ 2) ⊗ I_n \) x$ and
  $y_Lambda \( t \) = \( Lambda \( t \)^(1 \/ 2) ⊗ I_n \) y$.
  Partial traces of their outer products sum the diagonal base-space blocks,
  leaving coefficient-space matrix fields. An ordinary transpose fixed by the tensor convention identifies their
  means, including an entirely vanishing matrix cross mean.
  The original-$A$ resolvent produces a second positive block.
  Analytic and adjointed cross tests relate the two blocks with factors $kappa$ and $kappa^(- 1)$, respectively.

The decisive comparison is between the cross density and the two diagonal densities in this second positive block.
  We use boundary $L^2$ norms formed with the Hilbert–Schmidt matrix norm.
  Positivity bounds twice the squared norm of the cross density by the sum of the squared norms of the diagonal
  densities. Both diagonal norms are controlled by the same nonzero projected cross density from the first system.
  The zero matrix mean separates the two projected cross terms into orthogonal Fourier subspaces,
  so the factor $kappa$ gives a lower bound for the second cross density.
  Section 5 combines these bounds to prove $kappa lt.eq 2$.
  This completes the metric theorem and returns to the common density at every target size.
  Section 6 applies the result to polynomials and passes to arbitrary finite-matrix numerical ranges,
  including points and segments. It then uses finite compressions and holomorphic approximation to obtain the
  complete inequality for bounded operators on arbitrary complex Hilbert spaces.
  Appendix 7 provides the full local conformal construction used throughout.

== 2 The metric, its representation, and its extremal data <sec:metric>

=== 2.1 A metric for the disk coordinate <a-metric-for-the-disk-coordinate>

The evaluation rules used below follow directly from the finite Jordan Taylor formula.
  Its product rule preserves the order of matrix coefficients;
  conjugating the Jordan form proves similarity on the base factor.
  For scalar composition, substitute the nilpotent matrix $f \( J \) -
  f \( beta \) I$ into the Taylor series of the outer function at $f \( beta \)$.
  The finite Taylor composition identity gives $\( v compose f \) \[ J \] = v \[ f \( J \) \]$,
  and the same formula gives $"spec" \( f \( A \) \) = f \( "spec" \( A \) \)$. No diagonalizability is assumed.
  The Jordan resolvent expansion and Cauchy’s derivative formula give the equivalent contour-integral evaluation.

Since $"spec" \( A \) subset W \( A \) subset Omega$, spectral mapping gives $rho \( T \) < 1$.
  The positive-metric feasibility criterion is classical [24] Theorem 1;
  we construct the strictly feasible witness. Choose $rho \( T \) < eta < 1$.
  Jordan normal form supplies $C_eta$ with $parallel T^j parallel lt.eq C_eta eta^j$. Hence

$ H_0 = sum_(j gt.eq 0) T^(* j) T^j $

converges in norm, $H_0 succ.curly.eq I$, and $H_0 - T^(*) H_0 T = I$.
  For $c > 1$ and $tau > parallel c H_0 parallel$, the pair $\( tau \, c H_0 \)$ has all three matrix slacks in
  (1.1) positive definite. This is strict feasibility of the optimization problem.
  Feasible pairs below any fixed feasible upper bound form a closed bounded subset of a finite-dimensional space,
  so a minimum is attained. Every feasible $tau$ is at least one.

Fix a minimizing $H$ and put $S = H^(1 \/ 2)$. Congruence gives $D^(*) D =
  S^(- 1) T^(*) H T S^(- 1) prec.curly.eq I$; similarity gives $rho \( D \) < 1$.
  The inequalities $I prec.curly.eq H prec.curly.eq kappa^2 I$ give $parallel S parallel parallel S^(- 1) parallel
  lt.eq kappa$. The optimizer itself may have zero slacks. In particular $parallel D parallel = 1$ is allowed.

The minimum also measures the best condition number of a similarity to a contraction.
  If $R$ is invertible and $parallel R T R^(- 1) parallel lt.eq 1$, then $H_R =
  R^(*) R$ satisfies $T^(*) H_R T prec.curly.eq H_R$. Dividing $H_R$ by its least eigenvalue gives a feasible
  metric with $tau = parallel R parallel^2 parallel R^(- 1) parallel^2$.
  Consequently $kappa lt.eq parallel R parallel parallel R^(- 1) parallel$.
  Applying this to the minimizing $S = H^(1 \/ 2)$, for which the reverse inequality was just proved, gives

#[#set math.equation(numbering: n => "(2.1)")
 $ kappa = min { parallel R parallel parallel R^(- 1) parallel : R upright(" invertible") \, med
   parallel R T R^(- 1) parallel lt.eq 1 } . $ <eq:optimal-similarity>]

The minimum is attained by the positive matrix $S$, with $parallel S parallel parallel S^(- 1) parallel = kappa$.
  This identity holds for any fixed finite $T$ with an attained feasible metric problem;
  the stability assumption above supplies such feasibility.
  The bound $kappa lt.eq 2$ proved below uses the additional conformal and numerical-range hypotheses.

=== 2.2 One density for every coefficient size <one-density-for-every-coefficient-size>

#thm([Proposition 2.1.])[
  (One density for every coefficient size).  #emph[For the fixed minimizing metric,
    the representation (1.2) holds, before any bound on $kappa$ is proved, with
#[#set math.equation(numbering: n => "(2.2)")
 $ Phi_D \( zeta \) & = \( I - D \/ zeta \)^(- 1) + \[ \( I - D \/ zeta \)^(- 1) \]^(*) - I \,\
j \( t \) & = frac(t G' \( t \) f' \( G \( t \) \), psi \( t \)) > 0 \, & Lambda \( t \) & =
  j \( t \) Phi_D \( psi \( t \) \) . $ <eq:phi>]

]
] <prop:density>

The disk-resolvent formula is the positive representation of Delyon and Delyon [12] Section 2, equation (7);
  the common compression also belongs to the dilation tradition [25] Theorem I.
  We express the density in the exterior parameter and prove every coefficient-size claim.

#proof[
  For $\| zeta \| = 1$, $E_zeta = I - D \/ zeta$ is invertible and
  $ E_zeta^(*) Phi_D \( zeta \) E_zeta = I - D^(*) D succ.curly.eq 0 . $
  Thus $Phi_D$ is positive and continuous. The strict spectral-radius bound, rather than a strict norm bound,
    implies $sum_(j gt.eq 0) parallel D^j parallel < oo$. Consequently the following series is absolutely
    uniformly convergent on the circle:
  $ Phi_D \( zeta \) = I + sum_(j gt.eq 1) \( zeta^(- j) D^j + zeta^j D^(* j) \) \, wide
    integral_(bb(T)) zeta^j Phi_D \( zeta \) thin d sigma \( zeta \) = D^j quad \( j gt.eq 0 \) . $
  For any $m$ and any $M_m$-valued $h$ holomorphic near $overline(bb(D))$,
    integration of its uniformly convergent Taylor series gives
  $ h \[ D \] = integral_(bb(T)) Phi_D \( zeta \) ⊗ h \( zeta \) thin d sigma \( zeta \) . $
  Apply this with $h = v compose f^(- 1)$. The conformal collar makes $h$ holomorphic near $overline(bb(D))$,
    and scalar composition gives $h \[ D \] = v \[ A' \]$. Locally writing $psi \( e^(i theta) \) =
    e^(i eta \( theta \))$ shows that $j \( e^(i theta) \) = eta' \( theta \) > 0$.
    Changing variables $zeta = psi \( t \)$ proves the first identity in (1.2).
    The zeroth moment gives $integral Lambda thin d sigma = I$.
  For each $m$, define
  $ V_m : bb(C)^n ⊗ bb(C)^m arrow.r L^2 \( bb(T) \, d sigma \; bb(C)^n ⊗ bb(C)^m \) \,
    wide \( V_m b \) \( t \) = \( Lambda \( t \)^(1 \/ 2) ⊗ I_m \) b . $
  Normalization makes $V_m$ an isometry. If $M_v$ multiplies by $I_n ⊗ v \( G \( t \) \)$, then
  $ v \[ A' \] = V_m^dagger M_v V_m \, wide parallel v \[ A' \] parallel lt.eq
    max_(overline(Omega)) parallel v parallel . $
  Similarity on the first factor gives the remaining estimate with constant $kappa$.
    Neither the definition of $S$ nor that of $Lambda$ depends on $m$ or $v$. ◻
]

=== 2.3 Endpoint separation and an exact extremal <endpoint-separation-and-an-exact-extremal>

To bound the metric, we need equality for one auxiliary matrix function.
  The construction passes from real separation to a dual balance, then to endpoint supports,
  and finally to a finite unitary realization. Use the vectorization convention

$ "vec" \( X \) = sum_(j = 1)^n X e_j ⊗ e_j \, wide parallel "vec" \( X \) parallel^2 = "tr" \( X X^(*) \) . $

#thm([Proposition 2.2.])[
  (Endpoint extremal).  #emph[If $kappa > 1$, there are $X \, Y in M_n \( bb(C) \)$ with
$ "tr" \( X X^(*) \) = "tr" \( Y Y^(*) \) = 1 \, wide S X = kappa X \, wide S Y = Y \, wide X^(*) Y = 0 \, $

 and an $M_n$-valued rational function $F_(bb(D))$, holomorphic on a neighborhood of $overline(bb(D))$ and
   contractive on $overline(bb(D))$, such that, for $x = "vec" \( X \)$ and $y = "vec" \( Y \)$,
$ F_(bb(D)) \[ D \] x = y . $

 In particular $F_Omega = F_(bb(D)) compose f$ is holomorphic near $overline(Omega)$ and satisfies
   $F_Omega \[ A' \] x = y$. Its boundary trace $F = F_Omega compose G$ is contractive.]
] <prop:extremal>

#proof[
  We first obtain positive matrices $X_0$ and $Y_0$ supported on the $kappa^2$ and $1$ eigenspaces of $H$,
    respectively. A third positive matrix $Z_0$ will express their difference as $Z_0 - T Z_0 T^(*)$;
    this balance will provide the equal Gram matrices needed for the unitary realization.
  #emph[Separation, including a possible contact point.] In the real vector space $bb(R) xor "Herm"_n^3$, the affine set
  $ cal(A)_T = { \( s \, J - I \, s I - J \, J - T^(*) J T \) : s in bb(R) \, med J = J^(*) } $
  is disjoint from the open convex set
  $ cal(O) = { \( s \, U \, V \, W \) : s < kappa^2 \, med U \, V \, W succ 0 } . $
  Here is the finite-dimensional separation argument used for these sets;
    the general convex-separation framework is treated in [22] Section 11, Theorem 11.2.
    Write $cal(A)_T = a_0 + L$, and let $pi$ project orthogonally onto $L^perp$.
    The set $cal(K) = pi \( cal(O) - a_0 \)$ is nonempty, open in $L^perp$, and convex,
    and it does not contain zero. If $0 in.not overline(cal(K))$,
    a nearest point $z_0$ in the closed convex set $overline(cal(K))$ satisfies $chevron.l z_0 \,
    c chevron.r gt.eq parallel z_0 parallel^2 > 0$ for every $c in cal(K)$.
  If $0 in overline(cal(K))$, fix $c_(*) in cal(K)$ and set $z_j = - c_(*) \/ j$.
    Each $z_j$ is outside $overline(cal(K))$: otherwise zero would lie on the open segment joining an interior
    point $c_(*)$ to a point of the closure, and hence would belong to $cal(K)$.
    To verify that segment fact, take a ball about $c_(*)$ inside $cal(K)$,
    approximate the other endpoint by points of $cal(K)$, and use convexity;
    a ball about each fixed interior point of the limiting segment is still contained in $cal(K)$.
    Let $y_j$ be nearest to $z_j$ in $overline(cal(K))$. Since zero belongs to this closed set, $parallel y_j -
    z_j parallel lt.eq parallel z_j parallel$, so $y_j arrow.r 0$.
    A subsequence of $nu_j = \( y_j - z_j \) \/ parallel y_j - z_j parallel$ tends to a unit vector $nu$.
    The nearest-point inequality gives $chevron.l nu_j \, c - y_j chevron.r gt.eq 0$, hence $chevron.l nu \,
    c chevron.r gt.eq 0$ for every $c in cal(K)$. In the first case use $nu = z_0$.
    In either case $ell \( v \) = - chevron.l nu \, pi v chevron.r$ is nonzero and $ell \( a \) gt.eq
    ell \( o \)$ for all $a in cal(A)_T$, $o in cal(O)$.
  Because $cal(A)_T$ is affine, $ell$ is constant on it. Boundedness above on $cal(O)$ forces the signs
  $ ell \( s \, U \, V \, W \) = lambda s - "tr" \( Y_0 U \) - "tr" \( X_0 V \) - "tr" \( Z_0 W \) \, quad
    lambda gt.eq 0 \, quad X_0 \, Y_0 \, Z_0 succ.curly.eq 0 . $
  If $lambda = 0$, strict feasibility produces a negative value on $cal(A)_T$,
    while separation requires a value at least $sup_(cal(O)) ell = 0$. Thus $lambda > 0$; scale it to one.
    Constancy on $cal(A)_T$ then gives
  #[#set math.equation(numbering: n => "(2.3)")
   $ X_0 - Y_0 = Z_0 - T Z_0 T^(*) \, wide "tr" X_0 = 1 . $ <eq:dual>]
  The constant value is $"tr" Y_0 gt.eq kappa^2$. At $\( kappa^2 \, H \)$ it is
  $ kappa^2 - "tr" \( Y_0 \( H - I \) \) - "tr" \( X_0 \( kappa^2 I - H \) \) -
    "tr" \( Z_0 \( H - T^(*) H T \) \) lt.eq kappa^2 . $
  Each subtracted trace is nonnegative, so all vanish and $"tr" Y_0 = kappa^2$.
  #emph[Endpoint support and balance.] Write $parallel B
    parallel_(upright("HS")) = \( "tr" \( B^(*) B \) \)^(1 \/ 2)$ for the unnormalized Hilbert–Schmidt norm.
    For positive matrices $B \, C$, $"tr" \( B C \) = parallel C^(1 \/ 2) B^(1 \/ 2) parallel_(upright("HS"))^2$;
    vanishing implies that the range of $B$ lies in the kernel of $C$.
    Therefore $X_0$ is supported on the $kappa^2$ eigenspace of $H$, and $Y_0$ on its $1$ eigenspace.
  Choose square factors and a positive matrix $Q$ by
  $ X X^(*) = kappa^(- 2) S X_0 S \, quad Y Y^(*) = kappa^(- 2) S Y_0 S \, quad Q = kappa^(- 2) S Z_0 S . $
  The support and trace relations give the asserted norms and endpoint identities.
    Their column ranges are orthogonal because $kappa > 1$, so $X^(*) Y = 0$ as a matrix. Congruence of (2.3) gives
  #[#set math.equation(numbering: n => "(2.4)")
   $ X X^(*) - Y Y^(*) = Q - D Q D^(*) . $ <eq:balance>]
  #emph[Unitary realization and transpose.] The balance-to-isometry step is the classical interpolation mechanism
    of [15] Section 3 of the versioned preprint; its particular endpoint data and finite-dimensional realization
    are established here. Put $L = Q^(1 \/ 2)$. The rows $R_1 = \[ L med Y \]$ and $R_2 = \[ D L med X \]$ have
    equal products with their adjoints. The map $R_2^(*) v mapsto R_1^(*)
    v$ is therefore a well-defined isometry of their ranges. Extend it to a unitary using equal-dimensional
    orthogonal complements, then take its adjoint. This yields
  $ \[ L med Y \] = \[ D L med X \] mat(delim: "(", a, b; c, d) \, wide U =
    mat(delim: "(", a, b; c, d) upright(" unitary") . $
  Thus $L = D L a + X c$ and $Y = D L b + X d$. Since $parallel a parallel lt.eq 1$ and $rho \( D \) < 1$,
    iteration gives the norm-convergent identity
  #[#set math.equation(numbering: n => "(2.5)")
   $ Y = X d + sum_(j gt.eq 0) D^(j + 1) X c a^j b . $ <eq:realization-series>]
  The transfer-function norm identity is the unitary-colligation identity of [8] Section 3.1,
    equations (3.1)–(3.4). Define, for $\| zeta \| < 1$,
  $ R \( zeta \) = d + zeta c \( I - zeta a \)^(- 1) b \, wide F_(bb(D)) \( zeta \) = R \( zeta \)^(sans(T)) . $
  For $e in bb(C)^n$ and $v = \( I - zeta a \)^(- 1) b e$, unitarity gives
  $ U binom(zeta v, e) = binom(v, R \( zeta \) e) \, wide parallel e parallel^2 -
    parallel R \( zeta \) e parallel^2 = \( 1 - \| zeta \|^2 \) parallel v parallel^2 gt.eq 0 . $
  Hence $R$ is contractive. Ordinary transpose preserves its norm and holomorphy.
    Its rational entries are bounded in $bb(D)$, so every apparent pole on $bb(T)$ is removable:
    a genuine pole would diverge on an interior radial approach.
    After cancellation, finitely many remaining poles stay away from $overline(bb(D))$.
    This supplies a common neighborhood of that closed disk on which $F_(bb(D))$ is holomorphic;
    continuity retains contractivity on the circle.
  Finally,
  $ \( D^k ⊗ B \) "vec" \( X \) = "vec" \( D^k X B^(sans(T)) \) . $
  The Taylor coefficients of $F_(bb(D))$ are the transposes of $d$ and $c a^j b$.
    Substitution in (2.5) proves $F_(bb(D)) \[ D \] x = y$. The conformal collar and scalar composition give the
    claims for $F_Omega$. Rationality is asserted in the disk variable;
    $F_Omega$ is only required to be holomorphic near $overline(Omega)$. ◻
]

== 3 Local boundary tools <sec:inputs>

We now prepare the comparison that will bound the optimal metric.
  The exterior coordinate supplies a positive kernel with two normalized marginals.
  Its Fourier action controls a Cauchy projection, while the original numerical range supplies a second positive
  density. We prove the shared exterior and resolvent calculations here.
  They also form the analytic part of the direct polynomial proof [18] Sections 2–3;
  each required argument is included in the present paper. A reader who has checked [18] Theorems 2.1 and 3.1 may
  compare the statement of Proposition 6 using the notation in Remark 7,
  and then resume at the physical Cauchy integral preceding Proposition 8.
  The projection proof and its ordered applications remain part of the present argument.

#thm([Proposition 3.1.])[
  (Exterior coefficients and the original-matrix resolvent).  #emph[Assume the admissible $Omega$ and the exterior
    map $G$ supplied above. Write $G \( t \) = a t + b + O \( t^(- 1) \)$ at infinity, where $a eq.not 0$,
    and $q_G \( t \) = t G' \( t \)$. There are scalar polynomials $b_k$, with $b_0 = 1$, $deg b_k = k$,
    and leading coefficient $a^(- k)$, defined by
#[#set math.equation(numbering: n => "(3.1)")
 $ frac(q_G \( t \), G \( t \) - z) = sum_(k gt.eq 0) b_k \( z \) t^(- k) quad
   upright("at infinity") . $ <eq:import-faber>]

 There is also the mixed expansion
#[#set math.equation(numbering: n => "(3.2)")
 $ B \( w \, t \) = frac(q_G \( t \), G \( t \) - G \( w \)) - frac(t, t - w) =
   sum_(i \, j gt.eq 1) beta_(i j) w^(- i) t^(- j) \, wide b_j \( G \( w \) \) = w^j +
   sum_(i gt.eq 1) beta_(i j) w^(- i) quad \( j gt.eq 1 \) . $ <eq:import-kernel>]

 Here $B$ is holomorphic through the diagonal and both infinities of the exterior product collar.
   For each $r < rho < 1$ there is a constant $C_rho$ such that $\| beta_(i j) \| lt.eq C_rho rho^(i + j)$;
   the series converges normally on the product collar and absolutely uniformly on $bb(T)^2$. The kernel
$ m \( w \, t \) = 1 + B \( w \, t \) + overline(B \( w \, t \)) $

 is continuous and nonnegative, with each normalized-circle marginal one.]
  #emph[For every finite $n$ and every original matrix $A in M_n \( bb(C) \)$ with $W \( A \) subset Omega$,
#[#set math.equation(numbering: n => "(3.3)")
 $ K_A \( t \) = q_G \( t \) \( G \( t \) I - A \)^(- 1) = sum_(k gt.eq 0) b_k \( A \) t^(- k) \, wide
   E_A \( t \) = K_A \( t \) + K_A \( t \)^(*) succ.curly.eq 0 quad \( t in bb(T) \) . $ <eq:import-resolvent>]

 Its coefficients decay geometrically and its series converges absolutely uniformly on $bb(T)$.
   The scalar case applies to every fixed $z in Omega$.]
] <input:analytic>

#proof[
  Expand (3.1) at infinity after factoring $a t$ from the denominator.
    The constant term is one; the coefficient of $t^(- k)$ is a polynomial of degree $k$ with leading term
    $a^(- k) z^k$.
  For the joint continuation, put
  $ Q \( w \, t \) = frac(G \( t \) - G \( w \), t - w) . $
  Write $u = t^(- 1)$, $v = w^(- 1)$, and $G \( t \) = a t + g \( u \)$,
    with $g$ holomorphic for $\| u \| < r^(- 1)$. Then
  $ Q = a - u v frac(g \( u \) - g \( v \), u - v) . $
  The divided difference is jointly holomorphic, with its derivative value on the diagonal.
    Off the finite diagonal, $Q eq.not 0$ by univalence of $G$; on that diagonal $Q = G' \( t \) eq.not 0$;
    on either reciprocal axis, including their intersection, $Q = a eq.not 0$. Consequently
  $ B \( w \, t \) = t frac(partial_t Q \( w \, t \), Q \( w \, t \)) = - u frac(partial_u Q, Q) $
  is holomorphic on the reciprocal bidisk and vanishes on both axes.
    Its Taylor series has only the strictly mixed powers in (3.2).
    Cauchy estimates on the closed reciprocal bidisk of radius $rho^(- 1)$ give $\| beta_(i j) \| lt.eq
    C_rho rho^(i + j)$ for every $r < rho < 1$. For a compact subset of the product collar,
    choose $rho$ above $r$ but smaller than one and than the moduli of both coordinates on that compact set.
    The estimate then dominates the double series by a product of convergent geometric series.
    This proves normal convergence throughout the product collar, including at infinity,
    and absolute uniform convergence on $bb(T)^2$. Comparing coefficients at $t =
    oo$ in the defining identity for $B$, first with fixed finite $w$ in the collar,
    gives the displayed boundary formula for $b_j compose G$.
  For distinct $w \, t in bb(T)$, the circle identity $2 "Re" \( t \/ \( t - w \) \) = 1$ gives
  $ m \( w \, t \) = 2 "Re" frac(q_G \( t \), G \( t \) - G \( w \)) gt.eq 0 . $
  Indeed $q_G \( t \)$ is the outward normal, so convexity gives
    $"Re" \( overline(q_G \( t \)) \( G \( t \) - G \( w \) \) \) gt.eq 0$.
    Continuity of the mixed-series expression supplies the same sign on the diagonal.
    Every term in $B$ and its conjugate has nonzero frequency in each variable,
    so integration in either variable leaves exactly one.
  For the matrix resolvent, every eigenvalue of $A$ lies in $W \( A \)$ by testing a unit eigenvector.
    Thus $G \( t \) I - A$ is invertible on and outside the circle.
    Compactness of the circle permits a smaller exterior collar on which the resolvent remains holomorphic,
    including infinity where $K_A \( oo \) = I$. Expanding for large $\|
    t \|$ gives the coefficients $b_k \( A \)$ by the same polynomial identities as (3.1).
    Cauchy estimates in the reciprocal disk give geometric decay and absolute uniform convergence on $bb(T)$.
  Finally put $R_t = G \( t \) I - A$. Direct congruence gives
  $ R_t^(*) \( K_A + K_A^(*) \) R_t = q_G \( t \) R_t^(*) + overline(q_G \( t \)) R_t . $
  At a unit vector $x$, its quadratic form is $2 "Re" \( overline(q_G \( t \)) \( G \( t \) - x^(*) A x \) \)
    gt.eq 0$, by the supporting half-plane and $W \( A \) subset Omega$.
    Invertibility of $R_t$ proves $E_A succ.curly.eq 0$. ◻
]

These local double-layer calculations belong to the numerical-range method of Delyon–Delyon and Crouzeix–Palencia
  [12,11]. The polynomials $b_k$ are the classical Faber polynomials [5,6].
  Indeed, putting $Phi = G^(- 1)$ in the exterior, (3.2) gives $b_k \( z \) - Phi \( z \)^k =
  O \( z^(- 1) \)$ at infinity; hence $b_k$ is the polynomial part of $Phi^k$.
  The mixed coefficients $beta_(i j)$ are differentiated Grunsky coefficients,
  as the logarithmic derivative of $Q$ in the proof shows. The classical coefficient normalization gives a
  weighted inequality [7] equations (1.1)–(1.3); the unweighted Hilbert–Schmidt contraction used here follows
  locally from convexity and the two angular marginals.

We next turn this kernel into a bounded Cauchy projection on boundary functions.
  For the density comparison we need estimates for its actual adjoint and a formula relating Laurent tests to the
  original-matrix field $E_A$.

For every integer $k gt.eq 1$, use

$ cal(H)_k = L^2 \( bb(T) \, d sigma \; M_k \( bb(C) \) \) \, wide chevron.l u \, v chevron.r =
  integral_(bb(T)) "tr" \( u^(*) v \) thin d sigma \, wide parallel u parallel_2^2 = chevron.l u \, u chevron.r . $

The pointwise norm is the unnormalized Hilbert–Schmidt norm.
  Let $P_0 \, P_(+) \, P_(-)$ be the orthogonal Fourier projections onto the constant, strictly positive,
  and strictly negative frequencies, respectively, and write $u = u_0 + u_(+) + u_(-)$ with $u_0 = P_0 u$,
  $u_(+) = P_(+) u$, $u_(-) = P_(-) u$. Define

$ \( sans(M) u \) \( w \) = integral_(bb(T)) m \( w \, t \) u \( t \) thin d sigma \( t \) . $

#prodef([Remark 3.2.])[
  (Correspondence with the direct proof).  A reader who has already checked the exterior calculations in [18]
    Theorems 2.1 and 3.1 can compare the conventions by setting $h = G$, $lambda = t$, $mu = w$.
    Its correction satisfies $s \( lambda \, mu \) = B \( mu \, lambda \)$ and $s_(k j) = beta_(j k)$.
    The resulting integral action is the same $sans(M)$, not its Hilbert adjoint.
    The local proof above is complete; readers familiar with that calculation can continue with the physical
    Cauchy interpretation below.
] <rem:correspondence>

For continuous matrix-valued boundary data $u$, define the physical Cauchy integral

$ c_u \( z \) = integral_(bb(T)) u \( t \) frac(q_G \( t \), G \( t \) - z) thin d sigma \( t \) \, wide z in Omega . $

For finite Laurent data, the scalar case of (3.3) allows termwise integration for every fixed $z in Omega$.
  If $u \( t \) = sum_j U_j t^j$ is finite, it gives

#[#set math.equation(numbering: n => "(3.4)")
 $ c_u \( z \) = sum_(j gt.eq 0) b_j \( z \) U_j . $ <eq:local-bridge>]

Thus $c_u$ is an entire polynomial, and the physical integral of $t^j$ is $b_j$ for $j gt.eq 0$, zero for $j < 0$.
  The boundary trace is taken #emph[after] this interior identity is proved;
  no singular boundary substitution in the integral is needed.

#thm([Proposition 3.3.])[
  (The local projection theorem).  #emph[For finite Laurent data $u$,
    the polynomial $c_u$ has boundary trace $cal(C) u = c_u compose G$.
    This map extends to a bounded projection on every $cal(H)_k$.
    With $tilde(cal(C)) u = \( cal(C) \( u^(*) \) \)^(*)$, one has
$ cal(C) = P_0 + P_(+) + sans(M) P_(+) \, wide tilde(cal(C)) u = \( cal(C) \( u^(*) \) \)^(*) . $

 Its actual Hilbert-space adjoints satisfy
#[#set math.equation(numbering: n => "(3.5)")
 $ cal(C)^dagger u = u_0 + u_(+) + sans(M)^dagger u_(-) \, wide tilde(cal(C))^dagger u = u_0 + u_(-) +
   sans(M)^dagger u_(+) = \( cal(C)^dagger \( u^(*) \) \)^(*) . $ <eq:adjoints>]

 All four operators preserve the mean, and
#[#set math.equation(numbering: n => "(3.6)")
 $ parallel cal(C)^dagger u parallel_2^2 + parallel \( cal(C)^dagger u \)_0 parallel_2^2 lt.eq
   2 parallel u parallel_2^2 wide \( u in cal(H)_k \) . $ <eq:weighted>]

 If $F = F_Omega compose G$ with $F_Omega$ holomorphic near $overline(Omega)$ and $M_k$-valued,
   then for every $u in cal(H)_k$,
#[#set math.equation(numbering: n => "(3.7)")
 $ cal(C) \( F cal(C) u \) = F cal(C) u \, wide cal(C) \( \( cal(C) u \) F \) = \( cal(C) u \) F . $ <eq:modules>]

]
  #emph[For every finite coefficient size and every matrix Laurent polynomial $u$,
#[#set math.equation(numbering: n => "(3.8)")
 $ integral_(bb(T)) E_A ⊗ u thin d sigma = c_u \[ A \] + c_(u^(*)) \[ A \]^(*) . $ <eq:resolvent-contract>]

 In particular, $integral E_A thin d sigma = 2 I_n$.]
] <prop:projection>

#proof[
  Positivity and the two marginal identities give the contraction locally:
    Jensen’s inequality at each $w$ and then integration imply
  $ parallel \( sans(M) u \) \( w \) parallel_(upright("HS"))^2 lt.eq
    integral_(bb(T)) m \( w \, t \) parallel u \( t \) parallel_(upright("HS"))^2 thin d sigma \( t \) \, wide
    parallel sans(M) u parallel_2 lt.eq parallel u parallel_2 . $
  The mixed expansion in (3.2) gives, for $j > 0$,
  $ sans(M) \( t^j \) \( w \) = sum_(i gt.eq 1) beta_(i j) w^(- i) \, wide sans(M) \( t^(- j) \) \( w \) =
    sum_(i gt.eq 1) overline(beta_(i j)) w^i . $
  Both marginal identities say that $sans(M)$ fixes constants and preserves means.
    The real kernel makes it commute with pointwise matrix adjoint.
    Its actual adjoint has kernel $m \( t \, w \)$, and hence, for $i > 0$,
  $ sans(M)^dagger \( t^(- i) \) \( w \) = sum_(j gt.eq 1) overline(beta_(i j)) w^j \, wide
    sans(M)^dagger \( t^i \) \( w \) = sum_(j gt.eq 1) beta_(i j) w^(- j) . $
  It is a contraction, fixes constants, preserves means, and commutes with pointwise adjoint.
    No symmetry of $m$ is used. By boundedness and density of Fourier polynomials,
    the displayed actions extend to the closed strictly positive and strictly negative Fourier subspaces.
  Equations (3.2) and (3.4) give $cal(C) u = u_0 + u_(+) + sans(M) u_(+)$ for finite Laurent data.
    The three terms are orthogonal, so $parallel cal(C) u parallel_2^2 lt.eq 2 parallel u parallel_2^2$.
    Density defines the bounded extension, and the same formula gives $cal(C)^2 = cal(C)$.
    Taking its adjoint and using the strict Fourier exchange proves (3.5);
    conjugation by the antiunitary map $u mapsto u^(*)$ gives the second formula. The weighted estimate follows from
  $ parallel cal(C)^dagger u parallel_2^2 + parallel \( cal(C)^dagger u \)_0 parallel_2^2 =
    2 parallel u_0 parallel_2^2 + parallel u_(+) + sans(M)^dagger u_(-) parallel_2^2 lt.eq 2 parallel u parallel_2^2 . $
  We need the physical interpretation also for analytic boundary traces.
    If $v = v_Omega compose G$ and $v_Omega$ is holomorphic near $overline(Omega)$,
    then $v$ is holomorphic on an annulus about $bb(T)$. On a smaller closed annulus its Laurent series converges
    absolutely uniformly. If $r < \| w \| < 1$, then $G \( w \) in Omega$:
    an exterior or boundary value would also have a preimage with modulus at least one,
    contradicting univalence on the collar. For $\| w \| < 1$ sufficiently close to one,
    expansion of $t \/ \( t - w \) + B \( w \, t \)$ in the Cauchy integral gives
  $ c_v \( G \( w \) \) = sum_(j gt.eq 0) v_j w^j + sum_(i \, j gt.eq 1) beta_(i j) w^(- i) v_j . $
  The series converge uniformly after shrinking the annulus again,
    by the geometric Laurent bounds for $v_j$ and the normally convergent mixed expansion.
    At the boundary the expression is $cal(C) v$. Cauchy’s formula gives $c_v = v_Omega$ in $Omega$,
    and thus $cal(C) v = v$ on $bb(T)$. For Laurent data $u$,
    both $F_Omega c_u$ and $c_u F_Omega$ are holomorphic near $overline(Omega)$ by (3.4).
    Their traces are fixed by $cal(C)$, giving both identities in (3.7) for finite Laurent $u$.
    Left and right multiplication by the bounded $F$ are bounded on $cal(H)_k$;
    Laurent approximation extends the two identities to arbitrary $u in cal(H)_k$.
  Lastly, integrating (3.3) against a finite Laurent polynomial gives
  $ integral_(bb(T)) K_A ⊗ u thin d sigma = sum_(j gt.eq 0) b_j \( A \) ⊗ U_j = c_u \[ A \] $
  by (3.4) and the prescribed base-first evaluation. Applying the same formula to $u^(*)$ and taking the full
    matrix adjoint proves (3.8). The constant case gives mass $2 I_n$. ◻
]

In the density comparison below, we evaluate the physical Cauchy representative only for the Laurent test
  functions in (3.8). Arbitrary $L^2$ data in (3.7) are obtained by bounded extension and density.
  No continuation of a general $cal(C) u$ through the boundary is assumed.
  Also, $E_A$ is different from the normalized density $Lambda$ in Proposition 4:
  they have different masses and represent different expressions.

== 4 From extremal vectors to two positive density systems <sec:bridge>

We now return to the endpoint vectors constructed in Proposition 5.
  The boundary tools just proved provide two different positive systems:
  the mass-one density $Lambda$ for $A'$, and the mass-two resolvent field $E_A$ for $A$.
  We compare their coefficient-space partial traces using the same vectors.
  Assume $kappa > 1$ and write $R_S = S ⊗ I_n$. Then

#[#set math.equation(numbering: n => "(4.1)")
 $ parallel x parallel = parallel y parallel = 1 \, wide R_S x = kappa x \, wide R_S y = y \, wide
   F_Omega \[ A' \] x = y . $ <eq:endpoints>]

The partial-trace densities introduced below are $n$-by-$n$ coefficient-space matrices;
  $Lambda$ and $E_A$ remain base-space fields.

=== 4.1 Equality in the common positive representation <equality-in-the-common-positive-representation>

Use the isometry $V = V_n$ of Proposition 4, and set

$ x_Lambda = V x = \( Lambda^(1 \/ 2) ⊗ I_n \) x \, wide y_Lambda = V y = \( Lambda^(1 \/ 2) ⊗ I_n \) y . $

Let $M_F$ multiply by $I_n ⊗ F \( t \)$. The interpolation identity gives

$ 1 = parallel V^dagger M_F V x parallel lt.eq parallel M_F V x parallel lt.eq parallel V x parallel = 1 . $

Equality in the first inequality puts $M_F V x$ in the range of $V$:
  the orthogonal projection $V V^dagger$ cannot preserve the norm of a vector with a nonzero perpendicular
  component. Thus $M_F V x = V y$. Equality in the second inequality says that the positive operator $I -
  M_F^dagger M_F$ has zero quadratic form at $V x$, so it annihilates $V x$. Consequently, almost everywhere,

#[#set math.equation(numbering: n => "(4.2)")
 $ y_Lambda = \( I_n ⊗ F \) x_Lambda \, wide x_Lambda = \( I_n ⊗ F^(*) \) y_Lambda . $ <eq:fiber-equality>]

Take the partial trace over the base factor, meaning the sum of the diagonal base-space blocks,
  leaving a coefficient-space matrix:

#[#set math.equation(numbering: n => "(4.3)")
 $ p = "Tr"_(upright("base")) \( x_Lambda x_Lambda^(*) \) \, quad q =
   "Tr"_(upright("base")) \( y_Lambda y_Lambda^(*) \) \, quad r =
   "Tr"_(upright("base")) \( y_Lambda x_Lambda^(*) \) . $ <eq:partial-traces>]

They are bounded, hence in $cal(H)_n$, and $p \, q succ.curly.eq 0$.
  To see each multiplication order, write $x_Lambda = sum_a e_a ⊗ xi_a$ and $y_Lambda = sum_a e_a ⊗ eta_a$.
  Then $r = sum_a eta_a xi_a^(*)$, while (4.2) gives $eta_a = F xi_a$ and $xi_a = F^(*) eta_a$. Therefore

#[#set math.equation(numbering: n => "(4.4)")
 $ p = F^(*) r \, wide r = F p \, wide q = r F^(*) . $ <eq:ordered-densities>]

The same convention identifies the mean without losing matrix information:

#[#set math.equation(numbering: n => "(4.5)")
 $ p = \( X^(*) Lambda X \)^(sans(T)) \, quad q = \( Y^(*) Lambda Y \)^(sans(T)) \, quad
   r = \( X^(*) Lambda Y \)^(sans(T)) . $ <eq:transpose-densities>]

Indeed, the $\( j \, k \)$ entry of the cross density is

$ sum_a \( Lambda^(1 \/ 2) Y \)_(a j) overline(\( Lambda^(1 \/ 2) X \)_(a k)) = \( X^(*) Lambda Y \)_(k j) . $

Integrating (4.5) gives

#[#set math.equation(numbering: n => "(4.6)")
 $ r_0 = \( X^(*) Y \)^(sans(T)) = 0 \, wide "tr" \( p_0 \) = 1 . $ <eq:matrix-zero>]

Thus the entire matrix mean vanishes; the scalar identity $"tr" \( r_0 \) =
  0$ would not provide the Fourier orthogonality used below.

For every $u in cal(H)_n$, the cross density has the testing orientation

#[#set math.equation(numbering: n => "(4.7)")
 $ chevron.l r \, u chevron.r = integral_(bb(T)) y_Lambda^(*) \( I_n ⊗ u \) x_Lambda thin d sigma =
   y^(*) (integral_(bb(T)) Lambda ⊗ u thin d sigma) x . $ <eq:testing>]

This follows from $"tr" \( r^(*) u \) = sum_a eta_a^(*) u xi_a$.
  The diagonal formulas use $\( x \, x \)$ for $p$ and $\( y \, y \)$ for $q$.

=== 4.2 The original-matrix positive block <the-original-matrix-positive-block>

Use $E_A succ.curly.eq 0$ from Proposition 6, and define

$ x_e = \( E_A^(1 \/ 2) ⊗ I_n \) x \, wide y_e = \( E_A^(1 \/ 2) ⊗ I_n \) y . $

Define $p_e \, q_e \, r_e$ by the same three partial traces as in (4.3), now using $x_e \, y_e$.
  Writing $x_e = sum_a e_a ⊗ alpha_a$ and $y_e = sum_a e_a ⊗ beta_a$ yields

#[#set math.equation(numbering: n => "(4.8)")
 $ Delta = mat(delim: "(", p_e, r_e^(*); r_e, q_e) = sum_a binom(alpha_a, beta_a)
   binom(alpha_a, beta_a)^(#h(-0.16667em) *) succ.curly.eq 0 . $ <eq:positive-block>]

This positivity uses $W \( A \) subset Omega$ for the original matrix.
  No numerical-range containment for $A' = S A S^(- 1)$ is used.

We now identify the new densities with projected versions of the first ones.
  For $M_n \( bb(C) \)$-valued $v$ holomorphic near $overline(Omega)$, similarity and (4.1) give

#[#set math.equation(numbering: n => "(4.9)")
 $ v \[ A \] & = R_S^(- 1) v \[ A' \] R_S \, & v \[ A \]^(*) & = R_S v \[ A' \]^(*) R_S^(- 1) \,\
y^(*) v \[ A \] x & = kappa thin y^(*) v \[ A' \] x \, & y^(*) v \[ A \]^(*) x & =
  kappa^(- 1) y^(*) v \[ A' \]^(*) x . $ <eq:kappa-factors>]

For diagonal pairings, the factors cancel for both the analytic operator and its adjoint.

Take a matrix Laurent polynomial $u$. Its physical representative $c_u$ is holomorphic near $overline(Omega)$,
  so (3.8), (4.9), and (4.7) give

$ chevron.l r_e \, u chevron.r & = y^(*) #scale(x: 120%, y: 120%)[\(] c_u \[ A \] +
  c_(u^(*)) \[ A \]^(*) #scale(x: 120%, y: 120%)[\)] x\
 & = kappa chevron.l r \, cal(C) u chevron.r + kappa^(- 1) chevron.l r \, tilde(cal(C)) u chevron.r\
 & = chevron.l kappa cal(C)^dagger r + kappa^(- 1) tilde(cal(C))^dagger r \, u chevron.r . $

In the second term the boundary test is $\( cal(C) \( u^(*) \) \)^(*)$, which is $tilde(cal(C)) u$;
  it is not an independent analytic function evaluated at $A$.
  The corresponding diagonal computations have no similarity factor.
  Since Laurent polynomials are dense in $cal(H)_n$, we obtain

#[#set math.equation(numbering: n => "(4.10)")
 $ p_e & = cal(C)^dagger p + tilde(cal(C))^dagger p \, wide q_e = cal(C)^dagger q + tilde(cal(C))^dagger q \,\
r_e & = kappa cal(C)^dagger r + kappa^(- 1) tilde(cal(C))^dagger r . $ <eq:projected-densities>]

All functions here lie in the same Hilbert–Schmidt $L^2$ space.

== 5 The ordered comparison and the constant two <sec:comparison>

The preceding construction supplies the hypotheses of the following comparison.
  We state it for arbitrary coefficient size to expose its dimension-free content.
  The comparison uses one nonzero field $g = cal(C)^dagger r$:
  the diagonal norms are at most $2 parallel g parallel_2$,
  whereas the cross norm is at least $kappa parallel g parallel_2$.
  Positivity of the block then forces $kappa lt.eq 2$. The proof below keeps the left and right multiplication
  orders separate when obtaining the two diagonal bounds.

#thm([Lemma 5.1.])[
  (Ordered density comparison).  #emph[Let $k gt.eq 1$, and let $F = F_Omega compose G$ be $M_k$-valued,
    with $F_Omega$ holomorphic near $overline(Omega)$ and $parallel F \( t \) parallel lt.eq 1$ on $bb(T)$.
    Suppose $p \, q \, r in cal(H)_k$ satisfy
$ p = p^(*) \, quad q = q^(*) \, quad p = F^(*) r \, quad q = r F^(*) \, quad r_0 = 0 \, quad "tr" \( p_0 \) > 0 . $

 For a positive number $kappa$, define
$ p_e = cal(C)^dagger p + tilde(cal(C))^dagger p \, wide q_e = cal(C)^dagger q + tilde(cal(C))^dagger q \, wide
  r_e = kappa cal(C)^dagger r + kappa^(- 1) tilde(cal(C))^dagger r . $

 If the $2 k$-by-$2 k$ block
$ Delta \( t \) = mat(delim: "(", p_e \( t \), r_e \( t \)^(*); r_e \( t \), q_e \( t \)) succ.curly.eq 0 $

 for almost every $t in bb(T)$, then $kappa lt.eq 2$.]
] <lem:comparison>

#proof[
  Put $g = cal(C)^dagger r$, $P_1 = cal(C)^dagger p$, $P_2 = cal(C)^dagger q$.
    On $cal(H)_k$, the adjoint of left multiplication by $F$ is left multiplication by $F^(*)$;
    the adjoint of right multiplication is right multiplication by $F^(*)$, because
  $ "tr" \( \( u F \)^(*) v \) = "tr" \( F^(*) u^(*) v \) = "tr" \( u^(*) v F^(*) \) . $
  Taking the Hilbert adjoints of both identities in (3.7) therefore gives, with the factors on their original sides,
  #[#set math.equation(numbering: n => "(5.1)")
   $ P_1 = cal(C)^dagger \( F^(*) g \) \, wide P_2 = cal(C)^dagger \( g F^(*) \) . $ <eq:ordered-projection>]
  If $g = 0$, the first identity makes $P_1 = 0$, contradicting mean preservation and $"tr" \( p_0 \) > 0$.
    Thus $g eq.not 0$.
  Each $P_j$ has only nonnegative Fourier powers, and its mean is Hermitian. Fourier orthogonality gives
  $ parallel P_j + P_j^(*) parallel_2^2 = 4 parallel \( P_j \)_0 parallel_2^2 +
    2 parallel \( P_j \)_(+) parallel_2^2 = 2 #scale(x: 120%, y: 120%)[\(] parallel P_j parallel_2^2 +
    parallel \( P_j \)_0 parallel_2^2 #scale(x: 120%, y: 120%)[\)] . $
  Since $parallel F parallel lt.eq 1$, both $F^(*) g$ and $g
    F^(*)$ have Hilbert–Schmidt $L^2$ norm at most $parallel g parallel_2$.
    Apply (3.6) separately to the two inputs in (5.1). Using the star relation in (3.5) and $p = p^(*)$, $q =
    q^(*)$, we obtain
  #[#set math.equation(numbering: n => "(5.2)")
   $ parallel p_e parallel_2^2 lt.eq 4 parallel g parallel_2^2 \, wide parallel q_e parallel_2^2 lt.eq
     4 parallel g parallel_2^2 . $ <eq:diagonal-bound>]
  Put $h = tilde(cal(C))^dagger r$. Mean preservation and the whole matrix equality $r_0 =
    0$ put $g$ in the strictly positive Fourier subspace and $h$ in the strictly negative one. Therefore
  #[#set math.equation(numbering: n => "(5.3)")
   $ parallel r_e parallel_2^2 = kappa^2 parallel g parallel_2^2 + kappa^(- 2) parallel h parallel_2^2 gt.eq
     kappa^2 parallel g parallel_2^2 . $ <eq:cross-bound>]
  Finally, set $J = "diag" \( I_k \, - I_k \)$. Positivity of both $Delta$ and $J Delta J$ gives
  $ 0 lt.eq "tr" #scale(x: 120%, y: 120%)[\(] Delta^(1 \/ 2) \( J Delta J \) Delta^(1 \/ 2)
    #scale(x: 120%, y: 120%)[\)] = "tr" \( Delta J Delta J \) = parallel p_e parallel_(upright("HS"))^2 +
    parallel q_e parallel_(upright("HS"))^2 - 2 parallel r_e parallel_(upright("HS"))^2 . $
  The entries are in $L^2$, so this inequality is integrable. Combining it with (5.2) and (5.3) yields
  $ 2 kappa^2 parallel g parallel_2^2 lt.eq 2 parallel r_e parallel_2^2 lt.eq parallel p_e parallel_2^2 +
    parallel q_e parallel_2^2 lt.eq 8 parallel g parallel_2^2 . $
  Since $g eq.not 0$, division proves $kappa lt.eq 2$. ◻
]

#proof[
  #emph[Completion of Theorems 2 and 3.] If $kappa = 1$, the required bound already holds.
    Otherwise Proposition 5 and Section 4 supply all the hypotheses of Lemma 9 at auxiliary size $k = n$:
    (4.4) gives both multiplication orders, (4.6) gives the zero matrix mean and positive trace,
    (4.8) supplies positivity, and (4.10) identifies its entries. Hence $kappa lt.eq 2$.
    Proposition 4 already used this same metric and density for every independently chosen coefficient size $m$,
    which proves all statements of the two theorems. ◻
]

== 6 From admissible domains to bounded Hilbert-space operators <sec:limit>

We first pass from admissible enclosing domains to arbitrary finite-matrix numerical ranges.
  The Gaussian-distance construction below supplies the required domains,
  including when the numerical range is a point or a segment.
  A finite support-exponential construction gives an alternative [18] Section 4.
  We then transfer the polynomial estimate by finite compression and pass to the rational and holomorphic
  functional calculi.

#thm([Corollary 6.1.])[
  (The sharp complete polynomial inequality for matrices).  #emph[For every pair of positive integers $n \, m$,
    every $A in M_n \( bb(C) \)$, every nonnegative integer $d$, and every choice of matrices $B_0 \, dots.h \,
    B_d in M_m \( bb(C) \)$, the polynomial $P \( z \) = sum_(j = 0)^d B_j z^j$ satisfies
$ parallel P \[ A \] parallel = ∥sum_(j = 0)^d A^j ⊗ B_j∥ lt.eq 2 max_(z in W \( A \)) parallel P \( z \) parallel . $

 The constant is independent of both matrix sizes and the degree.
   No smaller constant holds uniformly over these choices.]
] <cor:polynomial>

#thm([Lemma 6.2.])[
  (Gaussian analytic outer approximation).  #emph[For every nonempty compact convex $K subset
    bb(R)^2$ and every $epsilon.alt > 0$, there is an admissible $Omega_epsilon.alt$ such that
$ K subset Omega_epsilon.alt \, wide overline(Omega)_epsilon.alt subset { x : "dist" \( x \, K \) < epsilon.alt } . $

]
] <lem:gaussian>

#proof[
  The distance function $d_K$ is convex and $1$-Lipschitz. For convexity,
    choose nearest points in $K$ to two given points, use their convex combination as a competitor,
    and apply the triangle inequality. Let $Z$ be a standard Gaussian in $bb(R)^2$ and put
  $ h_delta \( x \) = bb(E) thin d_K \( x - delta Z \) + delta \| x \|^2 \, wide c = bb(E) \| Z \| . $
  The Lipschitz bound gives the uniform estimate
  $ \| bb(E) thin d_K \( x - delta Z \) - d_K \( x \) \| lt.eq c delta . $
  The convolution is real analytic: write it against the translated Gaussian density,
    complexify both coordinates of $x$, and use Gaussian domination on every compact set of complex coordinates.
    The factor $d_K \( y \)$ has at most linear growth, so the integral defines a holomorphic function of those
    coordinates. Convexity passes through convolution; therefore $h_delta$ is proper and strictly convex,
    with Hessian at least $2 delta I$.
  Put $R_K = max_(x in K) \| x \|$, and choose $delta > 0$ with $c delta +
    delta R_K^2 < epsilon.alt \/ 2$ and $c delta < epsilon.alt \/ 2$.
    Then $h_delta < epsilon.alt \/ 2$ on $K$, while $h_delta lt.eq epsilon.alt \/ 2$ implies $d_K lt.eq h_delta +
    c delta < epsilon.alt$. Thus $Omega_epsilon.alt = { h_delta < epsilon.alt \/
    2 }$ has the desired containments and is bounded, open, and convex. The chosen level is above the minimum.
    A critical point of a differentiable convex function is a global minimum,
    so the gradient is nonzero on this level. The implicit function theorem gives a regular real-analytic
    boundary. From an interior point, each ray meets this compact boundary exactly once.
    Radial projection is a continuous bijection onto the circle and hence a homeomorphism.
    The boundary is therefore a Jordan curve. ◻
]

#proof[
  For completeness, the Toeplitz–Hausdorff convexity theorem [26,13] follows here from two-dimensional
    compression. Compress to the span of unit vectors realizing any two chosen values.
    In dimension two, the rank-one orthogonal projections are
  $ 1 / 2 mat(delim: "(", 1 + u, v + i w; v - i w, 1 - u) \, wide u^2 + v^2 + w^2 = 1 \, quad u \, v \, w in bb(R) . $
  Taking their trace against the compression is a real-affine map into $bb(C) tilde.eq bb(R)^2$.
    Its linear part has a nonzero kernel. Each point of the unit ball can be moved in a kernel direction to the
    sphere without changing its image, so the images of the sphere and ball coincide. That image is convex.
    The one-dimensional compression case is immediate. Compactness of $W \( A \)$ follows from compactness of the
    unit sphere.
  Apply Lemma 11 to $K = W \( A \)$. For each fixed polynomial $P \( z \) = sum_(j = 0)^d B_j z^j$,
    with arbitrary $B_j in M_m \( bb(C) \)$, Theorems 2 and 3 give
  $ ∥sum_(j = 0)^d A^j ⊗ B_j∥ lt.eq 2 max_(overline(Omega)_epsilon.alt) parallel P \( z \) parallel . $
  Uniform continuity on a fixed compact neighborhood of $K$ makes the maxima on the right tend to $max_K parallel
    P parallel$. This includes point and segment numerical ranges.
    It is a limit of scalar bounds for a fixed polynomial; no limiting similarity or boundary density on $K$ is
    asserted. For sharpness take $n = 2$, $m = 1$, $P \( z \) = z$, and $A = 0 & 2\
0 & 0$. Its norm is two, whereas, for every unit $x in bb(C)^2$,
  $ \| x^(*) A x \| = 2 \| x_1 x_2 \| lt.eq \| x_1 \|^2 + \| x_2 \|^2 = 1 \, $
  with equality when $x_1 = x_2 = 1 \/ sqrt(2)$. Hence $max_(W \( A \)) \| P \| = 1$,
    proving optimality uniformly over all finite base sizes, coefficient sizes, and degrees. ◻
]

The passage to arbitrary Hilbert spaces uses only finitely many iterates of the input to a polynomial.
  The closure of the numerical range is needed for the compact spectral-set formulation,
  because an infinite-dimensional numerical range need not be closed.

#thm([Corollary 6.3.])[
  (The sharp complete inequality for bounded operators).  #emph[Let $cal(H)$ be a complex Hilbert space,
    with no separability assumption, and let $A in cal(B) \( cal(H) \)$.
    Suppose first that $cal(H) eq.not { 0 }$, and put
$ W \( A \) = { chevron.l x \, A x chevron.r : x in cal(H) \, med parallel x parallel = 1 } \, wide K =
  overline(W \( A \)) . $

 Then $K$ is compact and convex and contains $"spec" \( A \)$.
   For every positive integer $m$, every nonnegative integer $d$, and every matrix polynomial $P \( z \) =
   sum_(k = 0)^d B_k z^k$ with $B_k in M_m \( bb(C) \)$, the operator $P \[ A \] =
   sum_(k = 0)^d A^k ⊗ B_k$ on $cal(H) ⊗ bb(C)^m$ satisfies
#[#set math.equation(numbering: n => "(6.1)")
 $ parallel P \[ A \] parallel lt.eq 2 sup_(z in W \( A \)) parallel P \( z \) parallel =
   2 max_(z in K) parallel P \( z \) parallel . $ <eq:hilbert-polynomial>]

 More generally, if $U$ is an open neighborhood of $K$ and $F = \( f_(i j) \) : U arrow.r
   M_m \( bb(C) \)$ is holomorphic, its entrywise holomorphic evaluation,
   in the same base-first tensor convention, satisfies
#[#set math.equation(numbering: n => "(6.2)")
 $ F \[ A \] := sum_(i \, j = 1)^m f_(i j) \( A \) ⊗ E_(i j) \, wide parallel F \[ A \] parallel lt.eq
   2 max_(z in K) parallel F \( z \) parallel . $ <eq:hilbert-holomorphic>]

 Here $E_(i j)$ are the standard matrix units and $f_(i j) \( A \)$ is given by the holomorphic functional
   calculus. In particular, $K$ is a complete $2$-spectral set for $A$:
   the same estimate holds at every finite coefficient size for every matrix-valued rational function whose poles
   lie outside $K$, with evaluation by the rational functional calculus.
   The constant two is optimal uniformly over all these choices.]
  #emph[If $cal(H) = { 0 }$, every evaluation is the zero operator.
    With the supremum over the empty numerical range defined to be zero,
    the corresponding supremum-norm inequalities are $0 lt.eq 0$;
    the compact spectral-set assertion above is stated for nonzero $cal(H)$.]
] <cor:hilbert>

#proof[
  Assume $cal(H) eq.not { 0 }$. We first prove the polynomial bound.
    With $e_1 \, dots.h \, e_m$ the standard basis of $bb(C)^m$,
    every vector in the Hilbert tensor product has the exact form $xi = sum_(j = 1)^m xi_j ⊗ e_j$,
    with $xi_j in cal(H)$. For $xi eq.not 0$, define the nonzero finite-dimensional subspace
  $ E = "span" { A^k xi_j : 0 lt.eq k lt.eq d \, med 1 lt.eq j lt.eq m } \, wide A_E = Q_E A \|_E \, $
  where $Q_E$ is the orthogonal projection onto $E$. Induction gives $A_E^k xi_j = A^k xi_j$ for $0 lt.eq k lt.eq
    d$: at each step the next iterate already belongs to $E$. Hence, as vectors in $E ⊗ bb(C)^m$,
  $ P \[ A \] xi = sum_(k = 0)^d sum_(j = 1)^m A^k xi_j ⊗ B_k e_j =
    sum_(k = 0)^d sum_(j = 1)^m A_E^k xi_j ⊗ B_k e_j = P \[ A_E \] xi . $
  For each unit $x in E$, orthogonality of $Q_E$ gives $chevron.l x \, A_E x chevron.r = chevron.l x \,
    Q_E A x chevron.r = chevron.l x \, A x chevron.r$. With the conjugate-linear-first convention,
    these are exactly the numerical-range values used in Corollary 10. Thus $W \( A_E \) subset W \( A \)$.
    Applying Corollary 10 in an orthonormal basis of $E$ yields
  $ parallel P \[ A \] xi parallel lt.eq 2 max_(z in W \( A_E \)) parallel P \( z \) parallel thin parallel xi
    parallel lt.eq 2 sup_(z in W \( A \)) parallel P \( z \) parallel thin parallel xi parallel . $
  Taking the supremum over unit $xi$ proves the inequality.
    This argument uses no sequence of subspaces exhausting $cal(H)$.
  The same two-vector compression argument used in the proof of Corollary 10 shows that $W \( A \)$ is convex.
    It is bounded by $parallel A parallel$, so $K$ is compact and convex.
    Continuity of $P$ and density of $W \( A \)$ in $K$ give the equality of the supremum and maximum in (6.1).
    To check spectral containment, let $lambda in.not K$ and $delta = "dist" \( lambda \, K \) > 0$.
    For every $x in cal(H)$, Cauchy–Schwarz gives
  $ parallel \( lambda I - A \) x parallel thin parallel x parallel gt.eq \| chevron.l x \, \( lambda I - A \) x
    chevron.r \| gt.eq delta parallel x parallel^2 . $
  Since $W \( A^(*) \) = { overline(z) : z in W \( A \) }$,
    the same argument gives $parallel \( overline(lambda I) - A^(*) \) y parallel gt.eq
    delta parallel y parallel$ for every $y$. The first lower bound makes $lambda I -
    A$ injective with closed range, and the second makes it dense because its orthogonal complement is the kernel
    of $overline(lambda I) - A^(*)$. Thus $lambda I - A$ is invertible, proving $"spec" \( A \) subset K$.
  Now fix $U$ and $F$ as in the statement. Choose $epsilon.alt > 0$ such that the compact convex neighborhood
  $ K_epsilon.alt = { z in bb(C) : "dist" \( z \, K \) lt.eq epsilon.alt } $
  is contained in $U$. Its complement is connected. Runge’s polynomial approximation theorem,
    obtained by rational approximation and movement of poles to infinity in the connected complement [23]
    pp. 235–238, gives matrix polynomials $P_ell$ with
  $ max_(z in K_epsilon.alt) parallel P_ell \( z \) - F \( z \) parallel arrow.r 0 . $
  Indeed, apply the scalar theorem to each of the finitely many entries;
    entrywise uniform convergence implies convergence in matrix operator norm.
    By Lemma 11, choose an admissible $Omega$ with $K subset Omega$ and $overline(Omega) subset K_epsilon.alt$,
    and let $Gamma = partial Omega$ have positive orientation.
    The holomorphic functional calculus, entry by entry, reads
  $ F \[ A \] = frac(1, 2 pi i) integral_Gamma \( z I - A \)^(- 1) ⊗ F \( z \) thin d z . $
  The integral converges in operator norm. For a polynomial, Cauchy’s theorem moves the contour to a large circle,
    where the resolvent’s Neumann expansion gives the prescribed base-first evaluation. Consequently
  $ parallel F \[ A \] - P_ell \[ A \] parallel lt.eq frac("length" \( Gamma \), 2 pi) max_(z in Gamma)
    parallel \( z I - A \)^(- 1) parallel max_(z in Gamma) parallel F \( z \) - P_ell \( z \) parallel arrow.r 0 . $
  The maxima of $parallel P_ell parallel$ on $K$ also converge to that of $parallel F parallel$.
    Applying (6.1) to $P_ell$ and taking the limit proves (6.2).
    The larger compact neighborhood is used to obtain convergence on the fixed contour, not just on $K$.
  A matrix-valued rational function whose poles lie outside $K$ is holomorphic on a neighborhood $U$ of $K$ that
    avoids all its poles; the preceding choice then puts every pole outside $overline(Omega)$.
    Spectral containment makes its rational evaluation well-defined,
    and this agrees with the displayed contour evaluation. For example,
    the resolvent identity identifies the contour evaluation of $\( z - a \)^(- 1)$ with $\( A - a I \)^(- 1)$
    when $a in.not overline(Omega)$; differentiation in $a$ gives the higher pole orders,
    and partial fractions give every rational function. This proves the complete spectral-set assertion.
    Finally, the $2$-by-$2$ scalar-coefficient example in the proof of Corollary 10 is already a bounded
    Hilbert-space operator and is both rational and holomorphic. It proves the stated uniform sharpness. ◻
]

== 7 Local conformal reconstruction <sec:conformal-appendix>

We give the classical extremal proof of Riemann mapping and the harmonic-reflection argument [2] Chapter 6,
  Section 1.1; Chapter 4, Section 6.5, then prove the collar patching and global univalence needed in Lemma 1.
  The extension argument is stated for a general analytic Jordan domain,
  since the inversion used for the exterior coordinate need not preserve convexity.
  For general background on boundary behavior of conformal maps, see [20].

#proof[
  #emph[A disk coordinate for a bounded simply connected domain.] Let $U subset
    bb(C)$ be a bounded simply connected domain and fix $z_(*) in U$.
    Consider the injective holomorphic maps $phi.alt : U arrow.r bb(D)$ satisfying $phi.alt \( z_(*) \) = 0$.
    This family is nonempty, since a sufficiently small multiple of $z - z_(*)$ belongs to it.
    The supremum $alpha$ of $\| phi.alt' \( z_(*) \) \|$ over the family is positive and finite:
    a disk centered at $z_(*)$ with closure in $U$ gives a uniform upper bound by Cauchy’s derivative estimate.
  Choose a sequence approaching this supremum. Cauchy’s estimates and compact exhaustion give a subsequence
    converging locally uniformly to a holomorphic function $phi.alt$.
    Its derivative at $z_(*)$ has modulus $alpha$, so it is nonconstant;
    the maximum principle then gives $phi.alt \( U \) subset bb(D)$. The limit is injective.
    Indeed, if two distinct points had the same image, choose disjoint small closed disks about them on whose
    boundaries the limit minus this common image does not vanish.
    The argument principle preserves at least one zero in each disk for every sufficiently late member of the
    sequence, contradicting its injectivity.
  Suppose that $w in bb(D) \\ phi.alt \( U \)$. Necessarily $w eq.not 0$. The function
  $ q \( z \) = frac(phi.alt \( z \) - w, 1 - overline(w) phi.alt \( z \)) $
  is holomorphic and nonvanishing on the simply connected domain $U$,
    and therefore has a holomorphic square root $h$. It satisfies $\| h \| < 1$ and is injective, since $h^2 =
    q$ is injective. Set $beta = h \( z_(*) \)$, so that $\| beta \| = sqrt(\| w \|)$.
    The injective disk-valued function
  $ psi \( z \) = frac(h \( z \) - beta, 1 - overline(beta h) \( z \)) $
  vanishes at $z_(*)$ and has derivative magnitude
  $ \| psi' \( z_(*) \) \| = frac(1 - \| w \|^2, 2 sqrt(\| w \|) \( 1 - \| w \| \)) thin \|
    phi.alt' \( z_(*) \) \| = frac(1 + \| w \|, 2 sqrt(\| w \|)) thin alpha > alpha . $
  This is impossible. Thus $phi.alt$ maps $U$ conformally onto $bb(D)$.
  #emph[Reflection at a regular analytic boundary.] Suppose now that $partial
    U$ is a regular real-analytic Jordan curve. For each $0 < r < 1$,
    the set $phi.alt^(- 1) \( r overline(bb(D)) \)$ is a compact subset of $U$,
    because the conformal inverse is continuous on $bb(D)$. Consequently $\| phi.alt \( z \) \| arrow.r
    1$ as $z$ approaches $partial U$ from inside.
  Fix $p in partial U$. A regular real-analytic parametrization of the boundary near $p$ extends holomorphically
    with nonzero derivative. Its local holomorphic inverse straightens the boundary.
    After shrinking and choosing its sign, we therefore have a holomorphic coordinate $z =
    chi \( xi \)$ taking $0$ to $p$, a real diameter to the boundary arc,
    and the upper half of a small disk to the part of $U$ in this coordinate neighborhood.
    Choose the neighborhood disjoint from $z_(*)$. Then
  $ u \( xi \) = log \| phi.alt \( chi \( xi \) \) \| $
  is harmonic and strictly negative on the upper half disk, and is continuous with value zero on its real diameter.
  Here the harmonic reflection can be obtained directly. On the boundary of a smaller full disk,
    prescribe $u$ on the upper semicircle and the negative of its reflected values on the lower semicircle.
    These boundary values are continuous, including at the endpoints of the diameter.
    Their Poisson extension is odd under reflection in the real axis, hence vanishes on the diameter.
    Uniqueness for the Dirichlet problem on the upper half disk shows that it agrees there with $u$.
    Denote the resulting harmonic extension by $hat(u)$.
  The gradient of $hat(u)$ at zero does not vanish. To see this, its first nonzero homogeneous Taylor term has the form
  $ c thin "Im" \( xi^k \) \, wide c in bb(R) \\ { 0 } \, quad k gt.eq 1 \, $
  because $hat(u)$ is harmonic and vanishes on the real diameter.
    Such a term exists since $u < 0$ on the upper half disk. If $k gt.eq 2$,
    $sin \( k theta \)$ takes both signs for $0 < theta < pi$;
    along two corresponding rays the leading term would force $u$ to take both signs near zero. Thus $k = 1$.
  Take a harmonic conjugate $hat(v)$ on the full disk. The function $exp \( hat(u) + i hat(v) \)$ is holomorphic
    and nonvanishing, with nonzero derivative at zero. On the upper half disk it has the same modulus as $phi.alt
    compose chi$, so their quotient is a constant of modulus one.
    Adjusting that constant and returning to the physical coordinate extends $phi.alt$ holomorphically across $p$,
    with nonzero derivative there.
  #emph[Patching and univalence on a neighborhood of the closure.] We spell out the passage from these local
    extensions to one extension, including overlaps that may lie outside $U$.
    For each boundary point $p$, choose an extension disk $B \( p \, R_p \)$ contained in its reflected coordinate
    neighborhood. Its extension agrees with $phi.alt$ throughout $U ∩ B \( p \, R_p \)$;
    shrink $R_p$ so that its derivative is nonzero on the disk.
    Select finitely many points $p_i$ such that the smaller disks
  $ V_i = B \( p_i \, R_i \/ 3 \) \, wide R_i = R_(p_i) \, $
  cover $partial U$, and let $phi.alt_i$ denote the extension on $U_i = B \( p_i \, R_i \)$.
    If $V_i ∩ V_j eq.not diameter$ and $R_i gt.eq R_j$, then
  $ \| p_i - p_j \| < frac(R_i + R_j, 3) lt.eq frac(2 R_i, 3) < R_i . $
  Thus the connected open lens $U_i ∩ U_j$ contains the boundary point $p_j$ and meets $U$ in a nonempty open set.
    Both extensions agree with $phi.alt$ there, so the identity theorem makes them equal on the entire lens.
    Their restrictions therefore patch with $phi.alt$ to a holomorphic function on
  $ U thin union thin union.big_i V_i \, $
  an open neighborhood of $overline(U)$. We continue to call it $phi.alt$.
  The extended map takes $partial U$ into $bb(T)$. Its nonzero derivative makes the restriction to the boundary a
    local diffeomorphism onto an arc of $bb(T)$. The boundary image is consequently open in $bb(T)$,
    and it is also nonempty and compact, so it is all of $bb(T)$.
    There cannot be two distinct boundary points with the same image $eta in bb(T)$.
    Indeed, choose disjoint local inverse neighborhoods about them.
    Each inverse, restricted to a sufficiently small neighborhood of $eta$, takes its disk side into $U$:
    the boundary arc is mapped to $bb(T)$, and the interior side is mapped into $bb(D)$.
    Points in $bb(D)$ sufficiently close to $eta$ would then have two preimages in $U$,
    contradicting interior injectivity. Since interior and boundary images lie in $bb(D)$ and $bb(T)$,
    respectively, $phi.alt$ is injective on $overline(U)$.
  It is in fact injective on an open neighborhood of $overline(U)$.
    Otherwise there would be distinct pairs $z_j \, w_j$, approaching the compact set $overline(U)$,
    with $phi.alt \( z_j \) = phi.alt \( w_j \)$. Subsequence limits $z \, w in overline(U)$ have the same image,
    hence $z = w$. Both sequences would eventually lie in one local inverse neighborhood of $z$, a contradiction.
    The image of a sufficiently small such neighborhood is open and contains $overline(bb(D))$.
    Its holomorphic inverse gives a univalent extension of $phi.alt^(- 1)$ to a neighborhood of $overline(bb(D))$.
  Applying these conclusions to the admissible domain $Omega$ gives the interior coordinate $f$ and both of its
    asserted extensions.
  #emph[The exterior coordinate.] Fix $z_0 in Omega$ and apply the inversion
  $ iota \( z \) = frac(1, z - z_0) \, wide iota \( oo \) = 0 \, $
  to the exterior of $overline(Omega)$, including infinity.
    Its image $U_(upright("ext"))$ is a bounded domain containing zero.
    More explicitly, convexity and $z_0 in Omega$ give a finite positive boundary radius $R \( theta \)$ on each
    ray $z_0 + r e^(i theta)$, and
  $ U_(upright("ext")) = { 0 } thin union thin { s e^(- i theta) :
    0 < s < R \( theta \)^(- 1) #scale(x: 120%, y: 120%)[}] . $
  This domain is star-shaped about zero, hence simply connected.
    Boundedness follows also from a positive disk about $z_0$ contained in $Omega$;
    a neighborhood of zero is in the image because $Omega$ is bounded.
    Inversion preserves the regular real-analytic Jordan boundary, since its pole $z_0$ is not on that boundary.
  By the preceding arguments there is a conformal map $phi.alt_(upright("ext")) : U_(upright("ext")) arrow.r
    bb(D)$ with $phi.alt_(upright("ext")) \( 0 \) = 0$, whose inverse $h$ extends univalently to a disk ${
    zeta : \| zeta \| < rho }$ for some $rho > 1$. Here $h \( 0 \) = 0$ is its only zero on this larger disk,
    and it is simple. Define
  $ G \( t \) = z_0 + frac(1, h \( 1 \/ t \)) \, wide \| t \| > r_0 := rho^(- 1) . $
  The function $G$ is univalent on this region. It maps $\| t \| > 1$ onto the exterior of $overline(Omega)$,
    takes infinity to infinity, and has a simple pole there. Its convergent Laurent expansion is therefore
  $ G \( t \) = a t + b + sum_(ell gt.eq 1) c_ell t^(- ell) \, wide a = h' \( 0 \)^(- 1) eq.not 0 . $
  In particular its restriction to $bb(T)$ is a smooth diffeomorphism onto $partial Omega$.
  #emph[Orientation and normal direction.] For $t = e^(i theta)$, the radial and angular derivatives are
  $ frac(partial, partial r) G \( r e^(i theta) \)\|_(r = 1) = t G' \( t \) \, wide
    frac(d, d theta) G \( e^(i theta) \) = i t G' \( t \) . $
  They are nonzero and perpendicular. Increasing $r$ enters the exterior of $overline(Omega)$,
    so $t G' \( t \)$ points in the outward normal direction.
    The tangent $i t G' \( t \)$ is consequently the positive boundary tangent.
    The interior conformal map $f$ preserves boundary orientation:
    locally it maps the interior side of $partial Omega$ to the interior side of $bb(T)$,
    and its derivative preserves orientation in the plane. Thus $f compose G : bb(T) arrow.r
    bb(T)$ is a smooth orientation-preserving diffeomorphism. This proves every assertion of the lemma. ◻
]

#heading(level: 1)[References]
#bibitem([1])[P.~Åhag, R.~Czyż, and J.~Virtanen, #emph[The complete Crouzeix conjecture in dimension three and the
  Clouâtre--Ostermann--Ransford conjecture], #link("https://arxiv.org/abs/2608.27346v4")[arXiv:2608.27346v4],
  September 21, 2026.]
#bibitem([2])[L.~V. Ahlfors, #emph[Complex Analysis], third ed., McGraw--Hill, New York, 1979.]
#bibitem([3])[W. Arveson, Subalgebras of $C^(*)$-algebras II, #emph[Acta Math.] #strong[128] (1972), 271--308.]
#bibitem([4])[C. Badea, M. Crouzeix, and B. Delyon, Convex domains and $K$-spectral sets, #emph[Math.
  Z.] #strong[252] (2006), 345--365.]
#bibitem([5])[B. Beckermann, Image numérique, GMRES et polynômes de Faber, #emph[C. R.
  Math.] #strong[340] (2005), 855--860.]
#bibitem([6])[B. Beckermann and M. Crouzeix, Faber polynomials of matrices for non-convex sets, #emph[Jaen J.
  Approx.] #strong[6] (2014), 219--231.]
#bibitem([7])[B. Beckermann and N. Stylianopoulos, Bergman Orthogonal Polynomials and the Grunsky Matrix,
  #emph[Constr. Approx.] #strong[47] (2018), 211--235.]
#bibitem([8])[M. S. Brodskiı̆, Unitary operator colligations and their characteristic functions,
  #emph[Russian Math. Surveys] #strong[33]:4 (1978), 159--191.]
#bibitem([9])[M.~Crouzeix, Bounds for analytical functions of matrices,
  #emph[Integral Equations Operator Theory] #strong[48] (2004), 461--477.
  #link("https://doi.org/10.1007/s00020-002-1188-6")[doi:10.1007/s00020-002-1188-6].]
#bibitem([10])[M.~Crouzeix, Numerical range and functional calculus in Hilbert space, #emph[J. Funct.
  Anal.] #strong[244] (2007), 668--690.
  #link("https://doi.org/10.1016/j.jfa.2006.10.013")[doi:10.1016/j.jfa.2006.10.013].]
#bibitem([11])[M. Crouzeix and C. Palencia, The numerical range is a $\( 1 + sqrt(2) \)$-spectral set,
  #emph[SIAM J. Matrix Anal. Appl.] #strong[38] (2017), 649--655.]
#bibitem([12])[B. Delyon and F. Delyon, Generalization of von Neumann's spectral sets and integral representation
  of operators, #emph[Bull. Soc. Math. France] #strong[127] (1999), 25--41.]
#bibitem([13])[F. Hausdorff, Der Wertvorrat einer Bilinearform, #emph[Math. Z.] #strong[3] (1919), 314--316.]
#bibitem([14])[S.~Jin, #emph[The numerical range is a $2$-spectral set],
  #link("https://www.preprints.org/manuscript/202607.1919/v4")[Preprints.org 202607.1919, version 4], August 7, 2026.]
#bibitem([15])[V. E. Katsnelson, A. Ya. Kheifets, and P. M.
  Yuditskii, An abstract interpolation problem and the extension theory of isometric operators,
  in #emph[Topics in Interpolation Theory], OTAA #strong[95], Birkhäuser, 1997, 283--298. Preprint version:
  #link("https://arxiv.org/abs/0706.1896v1")[arXiv:0706.1896v1].]
#bibitem([16])[E.~Lorist and F.~L. Schwenninger, #emph[A solution to Crouzeix's conjecture],
  #link("https://arxiv.org/abs/2608.03841v2")[arXiv:2608.03841v2], August 17, 2026.]
#bibitem([17])[Q.~Luo, #emph[Two boundary-certificate proofs of the Crouzeix theorem:
  Fiberwise Fourier recurrence and defect-Gram telescoping],
  #link("https://www.preprints.org/manuscript/202608.1661/v2")[Preprints.org 202608.1661, version 2], August 28, 2026.]
#bibitem([18])[OpenAI, #emph[A direct proof of the complete Crouzeix inequality],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/A-direct-proof-of-the-complete-Crouzeix-inequality-September-26-2026/paper.pdf")[OAI:A-direct-proof-of-the-complete-Crouzeix-inequality-September-26-2026],
  2026.]
#bibitem([19])[V. I. Paulsen, Completely bounded homomorphisms of operator algebras, #emph[Proc. Amer. Math.
  Soc.] #strong[92] (1984), 225--228.]
#bibitem([20])[C. Pommerenke, #emph[Boundary Behaviour of Conformal Maps], Springer-Verlag, 1992.]
#bibitem([21])[T.~Ransford and F.~L. Schwenninger, Remarks on the Crouzeix--Palencia proof that the numerical
  range is a $\( 1 + sqrt(2) \)$-spectral set, #emph[SIAM J. Matrix Anal. Appl.] #strong[39] (2018), 342--345.
  #link("https://doi.org/10.1137/17M1143757")[doi:10.1137/17M1143757].]
#bibitem([22])[R. T. Rockafellar, #emph[Convex Analysis], Princeton University Press, 1970.]
#bibitem([23])[C.~Runge, Zur Theorie der eindeutigen analytischen Functionen, #emph[Acta Math.] #strong[6] (1885),
  229--244. #link("https://doi.org/10.1007/BF02400416")[doi:10.1007/BF02400416].]
#bibitem([24])[P. Stein, Some General Theorems on Iterants, #emph[J. Res. Nat. Bur. Stand.] #strong[48] (1952), 82--83.]
#bibitem([25])[B. Sz.-Nagy, Sur les contractions de l'espace de Hilbert, #emph[Acta Sci. Math.
  (Szeged)] #strong[15] (1953), 87--92.]
#bibitem([26])[O. Toeplitz, Das algebraische Analogon zu einem Satze von Fejér, #emph[Math.
  Z.] #strong[2] (1918), 187--197.]
