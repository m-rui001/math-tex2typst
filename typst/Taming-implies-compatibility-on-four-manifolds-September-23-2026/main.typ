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

#align(center)[#text(size: 16pt, weight: "bold")[Taming implies compatibility on four-manifolds]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <introduction>

Let $X$ be a closed smooth four-manifold and let $J$ be a smooth almost complex structure on $X$.
  A smooth real two-form $omega$ is symplectic if it is nondegenerate and closed, meaning $d omega = 0$.
  A real two-form $omega$ #emph[tames] $J$ if $omega \( v \, J v \) > 0$ for every nonzero tangent vector $v$.
  It is #emph[compatible] with $J$ if, in addition, $omega \( J u \, J v \) = omega \( u \, v \)$.
  A taming form is automatically nondegenerate; thus a closed taming form is symplectic.

Donaldson asked whether the existence of a taming symplectic form on a closed four-manifold implies the existence
  of a compatible one #cite(label("Donaldson2006")) Section 5.2, Question 2.
  This existence question is distinct from his a priori estimate conjecture for a prescribed-volume equation.
  The elementary projection $omega mapsto 1 / 2 \( omega + omega \( J thin dot.op \, J thin dot.op \) \)$ shows
  the obstacle: it preserves positivity on complex lines but generally loses closedness.
  Our main result answers the existence question affirmatively.

#thm([Theorem 1.1.])[
  #emph[Suppose that a smooth almost complex structure $J$ on a closed connected smooth real four-manifold $X$ is
    tamed by a symplectic form. Then there is a smooth symplectic form compatible with $J$.]
] <thm:main>

The almost complex structure in Theorem 1 is the given one.
  The conclusion imposes no condition on the cohomology class of the compatible form.
  In particular, it does not assert that an arbitrary taming class contains a compatible representative.

Combining Theorem 1 with Li and Zhang’s cone comparison gives the following cohomological refinement.

#thm([Corollary 1.2.])[
  (Taming and compatible cones).  #emph[Let $X \, J$ satisfy the hypotheses of Theorem 1,
    and give $X$ the orientation induced by $J$. Let $cal(K)_J^t \,
    cal(K)_J^c subset H^2 \( X \; bb(R) \)$ be the real de Rham classes represented by $J$-taming and
    $J$-compatible symplectic forms, respectively. Let $H_J^(-)$ be the subspace represented by smooth closed real
    two-forms $alpha$ satisfying $alpha \( J u \, J v \) = - alpha \( u \, v \)$. Then
$ cal(K)_J^t = cal(K)_J^c + H_J^(-) \, $

 where the right side is a Minkowski sum. Write $b_2^(+) \( X \)$ for the positive index of the intersection form.
   If $b_2^(+) \( X \) = 1$, then $cal(K)_J^t = cal(K)_J^c$.
   In that case, every $J$-taming symplectic form $omega$ has a smooth $J$-compatible symplectic representative
   $eta$ with $\[ eta \] = \[ omega \]$ in $H^2 \( X \; bb(R) \)$.]
] <cor:taming-cones>

#proof[
  Theorem 1 makes $cal(K)_J^c$ nonempty. Li and Zhang’s four-dimensional cone comparison
    #cite(label("LiZhang2009")) Corollary 1.1 therefore gives the cone identity and, when $b_2^(+) = 1$,
    equality of the two cones. This equality gives the claimed representative. ◻
]

The integrable case belongs to the theory of compact complex surfaces.
  Buchdahl #cite(label("Buchdahl1999")) Theorem 11 and Lamari #cite(label("Lamari1999")) Corollary 5.7 gave
  classification-free proofs that even first Betti number implies the existence of a Kähler metric.
  Lamari’s positive exact current on a surface with odd first Betti number also obstructs a taming form
  #cite(label("Lamari1999")) Theorem 6.1. Li and Zhang proved the equivalence of taming and compatibility for
  complex surfaces and compared the two cohomology cones under the assumption that a compatible form already
  exists #cite(label("LiZhang2009")) Theorem 1.2 and Corollary 1.1.

The pseudoholomorphic-curve approach has a different starting point.
  For structures on $bb(C P)^2$ tamed by the standard symplectic form,
  Gromov constructed a compatible form by averaging currents of pseudoholomorphic lines #cite(label("Gromov1985"))
  Section 2.4.A$'$. Taubes developed integration over curve moduli spaces to obtain compatibility for a residual
  subset of the smooth almost complex structures tamed by a fixed symplectic form when $b_2^(+) =
  1$ #cite(label("Taubes2011")) Theorem 1; a later correction addresses the $b_1 =
  2$ case #cite(label("Taubes2017")) Section 1. His original Theorem 1 also states preservation of the taming
  form’s cohomology class when that class is rational. Li and Zhang extended this approach to every tamed
  structure on $S^2 times S^2$ and $bb(C P)^2 \# overline(bb(C P)) zws^2$,
  and to further rational manifolds under hypotheses on embedded pseudoholomorphic spheres
  #cite(label("LiZhang2015")) Theorems 1.2 and 1.3.

An invariant two-form satisfies $alpha \( J u \, J v \) = alpha \( u \, v \)$;
  an anti-invariant one satisfies $alpha \( J u \, J v \) = - alpha \( u \, v \)$.
  Write $h_J^(-) = dim H_J^(-)$, where $H_J^(-)$ is the anti-invariant cohomology space defined in Corollary 2.
  Tan, Wang, Zhou and Zhu published an affirmative result under $h_J^(-) = b_2^(+) - 1$,
  using a strategy related to Buchdahl’s complex-surface argument #cite(label("TWZZ2022")) Theorem 1.1.
  Lin and Zhou subsequently identified difficulties in specific local estimates and connection formulas in that
  approach #cite(label("LinZhou2025")) Remarks 3.4 and 3.6, Section 3.2;
  their note gives no counterexample to the geometric theorem.
  The same cohomological restriction remains in the compatibility criteria of Wang,
  Wang and Zhu #cite(label("WangWangZhu2023")) Theorems 4.3 and 5.1, and in the taming corollary of Wang, Zhang,
  Zheng and Zhu #cite(label("WangZhangZhengZhu2025")) Corollary 1.3.
  The latter paper’s generalized Monge–Ampère theorem starts with an almost Kähler structure.
  Li and Ning’s recent study of spaces of Kähler and holomorphically tamed forms allows the integrable complex
  structure to vary #cite(label("LiNing2026")).

The current approach has a classical cone-duality background.
  Sullivan related closed forms positive on a field of tangent directions to the corresponding structure currents
  #cite(label("Sullivan1976")). Harvey and Lawson characterized Kähler manifolds through positive currents
  #cite(label("HarveyLawson1983")); Li and Zhang developed the almost-complex formulation used to compare taming
  and compatibility #cite(label("LiZhang2009")) Section 3. In the argument below,
  separation gives a positive functional vanishing on closed invariant forms.
  An explicit elliptic lift and quantitative current estimates connect this obstruction to the existence of a
  taming form.

=== The argument and its main estimate <the-argument-and-its-main-estimate>

Fix an auxiliary $J$-Hermitian metric. If no compatible form exists,
  separation produces a nonzero positive current $P$ that annihilates closed invariant forms.
  An elliptic correction gives $T = P + Q$, which annihilates every closed two-form,
  with $Q$ initially an anti-invariant distribution. Represent $P$ as a positive weighted average of unit
  complex-line bivectors, and let $mu$ be the resulting measure on $X$, its trace measure.
  Corrected radial test functions give $mu \( B_r \( x \) \) lt.eq C r^2$.
  Regularization by a finite power of the Hodge resolvent then proves $Q in L^2$ and an angular estimate:
  over pairs of complex lines in this representation whose base points are less than $r$ apart,
  the integral of their squared difference, after parallel transport, is $O \( r^4 \)$.

The first regularized pairing only bounds $parallel Q parallel_2$,
  because the negative error in this pairing is only uniformly bounded.
  To remove that error, we distinguish the points where $P$ has positive two-dimensional density. Write

$ theta \( x \) = lim_(r arrow.b 0) r^(- 2) mu \( B_r \( x \) \) \, wide E = { x : theta \( x \) > 0 } . $

Existence of the limit is part of the argument. The principal step, Theorem 12, proves that the restriction $P_E =
  upright(bold(1))_E P$ is closed. It applies to any closed current $P +
  Q$ with an anti-invariant $L^2$ correction and the stated mass and angular bounds;
  annihilation of all closed forms is not needed for this step.

The reason the angular estimate suffices is a balance between two errors.
  Planar tangent measures show that, over the same nearby pairs,
  the squared normal component of the displacement between base points,
  relative to the first complex line and divided by $r^2$, has integral $o \( r^2 \)$.
  Closedness of $P + Q$ trades tangential derivatives of a smooth density cutoff for a product of angular and
  transverse errors. The derivative and normalization of the cutoff contribute $r^(- 3)$.
  Cauchy–Schwarz therefore bounds the decisive boundary term by

$ r^(- 3) thin O \( r^2 \) thin o \( r \) = o \( 1 \) \, $

where the two factors are the square roots of the angular and transverse moments.
  The $L^2$ bound controls the correction’s cutoff error separately.
  Together these estimates prove closedness of the density restriction without requiring a quantitative rate for
  tangent measure convergence.

Once $P_E$ is closed, the residual $T - P_E = upright(bold(1))_(X \\ E) P + Q$ is closed as well.
  Its positive summand is concentrated on zero-density centers,
  where the negative error in the pairing does tend to zero.
  Pairing this residual with $T$, and using the vanishing of the mixed terms, forces $Q = 0$.
  The resulting nonzero positive current $P = T$ cannot annihilate a closed taming form.

The relative projection estimate in Lemma 10, for fixed smooth orthogonal bundle projections,
  and the closedness statement in Theorem 12 may be useful separately.
  The regularized pairing estimates use the four-dimensional fact that anti-invariant two-forms are self-dual.
  Sections 2 and 3 construct the separating current and prove its mass bound.
  Section 4 establishes the regularization and angular estimates.
  Section 5 proves density existence and the planar tangent description;
  Section 6 uses them to control cutoff boundaries and prove closedness of $P_E$.
  Section 7 completes the compatibility argument.

A triple of closed two-forms on an oriented four-manifold is #emph[hypersymplectic] if every nonzero real linear
  combination is symplectic and induces the given orientation.
  The companion #cite(label("OpenAIHypersymplectic2026")) Theorem 1.1 combines the current estimates above with
  additional prescribed-class and deformation arguments to deform hypersymplectic triples normalized by
  $integral_X omega_i and omega_j = delta_(i j)$ on closed connected oriented smooth four-manifolds to hyperkähler
  triples, while fixing each class $\[ omega_i \] in H^2 \( X \; bb(R) \)$.

== 2 A current obtained by separation <sec:currents>

We first construct the current that would obstruct compatibility:
  a positive current and an anti-invariant correction whose sum annihilates every closed two-form.

Give $X$ its complex orientation. Fix a smooth $J$-Hermitian metric $g$, and write

$ F \( u \, v \) = g \( J u \, v \) \, wide \( R alpha \) \( u \, v \) = 1 /
  2 #scale(x: 120%, y: 120%)[\(] alpha \( u \, v \) - alpha \( J u \, J v \) #scale(x: 120%, y: 120%)[\)] . $

Thus $R$ is the orthogonal projection onto the anti-invariant two-forms, and $1 -
  R$ projects onto the invariant two-forms. All forms and currents are real.

We identify bivectors with two-forms using $g$. Let $cal(C) arrow.r X$ be the bundle of unit complex line bivectors

$ cal(C)_x = { v and J v : med \| v \|_g = 1 } . $

For $ell in cal(C)_x$, let $L_ell subset T_x X$ be its oriented plane. The following pointwise identities will be used:

#[#set math.equation(numbering: n => "(2.1)")
 $ "im" R subset Lambda_g^(+) \, wide * F = F \, wide \| F \|^2 = 2 \, wide \| ell \| = 1 \, wide ell^(+) =
   F \/ 2 \, wide F \( ell \) = 1 . $ <eq:algebra>]

They follow by taking a unitary frame $\( v \, J v \, w \, J w \)$.
  In that frame $F$ corresponds to $v and J v + w and J w$, and the anti-invariant subspace is spanned by

$ v and w - J v and J w \, wide J v and w + v and J w . $

A two-current acts on smooth two-forms. It is #emph[closed] if it annihilates exact two-forms.
  Under the $L^2$ identification with distributional two-forms, this means $d^(*) T = 0$,
  or equivalently $d \( * T \) = 0$. Multiplication and orthogonal projections on distributional forms act on
  currents by duality.

#thm([Lemma 2.1.])[
  (A closed lift).  #emph[There is a real order-zero pseudodifferential operator
$ B : C^oo \( "im" R \) arrow.r Omega^2 \( X \) $

 such that $d B = 0$ and $R B = upright("id")$.]
] <lem:lift>

#proof[
  Consider $cal(L) = R d d^(*)$ on sections of $"im" R$. If $xi eq.not 0$, the projection of $xi and
    iota_(xi^sharp)$ from self-dual two-forms back to self-dual two-forms is $\| xi \|^2 \/ 2$ times the identity.
    By (2.1), the principal symbol of $cal(L)$ on $"im" R$ is therefore the same scalar.
    In particular $cal(L)$ is elliptic. For anti-invariant smooth forms $a \, b$,
  $ ⟨cal(L) a \, b⟩_(L^2) = ⟨d^(*) a \, d^(*) b⟩_(L^2) . $
  It is nonnegative and self-adjoint. Every element of its kernel is smooth and coclosed; being self-dual,
    it is also closed.
  Let $H$ be the orthogonal projection onto this kernel and let $G$ be the inverse of $cal(L)$ on its orthogonal
    complement, extended by zero on the kernel. The elliptic generalized-inverse theorem gives $G$ of order $-
    2$ and $H$ a smoothing finite-rank operator; see #cite(label("MelroseIML")) Proposition 6.4 and Theorem 6.3. Set
  $ B = d d^(*) G + H . $
  Then $d B = 0$, while $R B = cal(L) G + H = upright("id")$. ◻
]

The projected elliptic operator used here also appears in Lejmi’s proof of local compatibility in dimension four
  #cite(label("Lejmi2006")) proof of Theorem 1. Drăghici and Zhang’s exact-form result gives the corresponding
  global linear correction phenomenon #cite(label("DraghiciZhang2012")) Proposition 3.1.
  The present formula specifies the closed lift and its mapping properties; positivity remains a separate problem.

#thm([Proposition 2.2.])[
  #emph[If $J$ admits no compatible symplectic form, there are currents $P \, Q \,
    T$ and a finite positive measure $lambda$ on $cal(C)$ such that
#[#set math.equation(numbering: n => "(2.2)")
 $ P \( alpha \) & = integral_(cal(C)) alpha_x \( ell \) thin d lambda \( x \, ell \) \, & lambda \( cal(C) \) & = 1 \,\
T & = P + Q \, & R P & = 0 \, quad R Q = Q \, quad * Q = Q \,\
T \( alpha \) & = 0 &  & upright("for every smooth closed two-form ") alpha . $ <eq:positive-representation>]

 The current $P$ annihilates every closed invariant two-form.
   The projection $mu$ of $lambda$ to $X$ is the #emph[trace measure] of $P$:
   for every smooth function $b$, $P \( b F \) = integral_X b thin d mu$. Each of $P \, Q \, T$ belongs to $H^(- 3)$.]
] <prop:separation>

#proof[
  In the Fréchet space of smooth invariant two-forms, the cone of positive definite forms is open and convex.
    It is disjoint from the linear subspace of closed invariant forms by hypothesis.
    Hahn–Banach separation gives a nonzero continuous functional nonnegative on the cone and zero on that
    subspace. Extend it to all two-forms by composing with $1 - R$, and call it $P$.
    This is the positive-current separation framework of Sullivan and Harvey–Lawson #cite(label("Sullivan1976"))
    #cite(label("HarveyLawson1983")); for its almost-complex formulation, see #cite(label("LiZhang2009")) Section 3.
  Positivity extends to semidefinite invariant forms by adding $epsilon F$ and taking $epsilon arrow.b 0$.
    Since $C parallel alpha parallel_oo F plus.minus \( 1 - R \)
    alpha$ are semidefinite for a fixed norm-comparison constant,
  $ \| P \( alpha \) \| lt.eq C parallel alpha parallel_oo P \( F \) . $
  Thus $P$ has order zero, and $P \( F \) > 0$ because $P eq.not 0$. Scale $P$ so that $P \( F \) = 1$.
  For completeness, the measure representation can be obtained in local unitary frames.
    Invariant two-forms identify with Hermitian symmetric forms by $alpha mapsto
    alpha \( thin dot.op \, J thin dot.op \)$. The positive functional has a positive Hermitian matrix of
    coefficient measures. Its trace is a positive measure $mu$;
    the coefficient measures are absolutely continuous with respect to $mu$.
    Their Radon–Nikodym density is a positive semidefinite Hermitian matrix of trace one,
    or equivalently a convex combination of bivectors in $cal(C)_x$.
    Measurable spectral decomposition in measurable unitary frames gives $lambda$ in (2.2).
    The identity $F \( ell \) = 1$ shows that its projection is $mu$ and that its total mass is one.
  Define
  $ T \( alpha \) = P \( alpha - B R alpha \) \, wide Q \( alpha \) = - P \( B R alpha \) . $
  For closed $alpha$, the form $alpha - B R alpha$ is closed and invariant, proving (2.2).
    Moreover $R P = 0$ and $R Q = Q$, so $* Q = Q$ by (2.1). In particular $T$ is a closed current.
  A finite measure on a compact four-manifold defines an element of $H^(- 3)$,
    by the Sobolev embedding $H^3 subset C^0$. The order-zero operator $R
    B^(*)$ is bounded on this Sobolev space by the pseudodifferential Sobolev mapping theorem
    #cite(label("Taylor1991")) Proposition 0.5.E, so the same conclusion holds for $Q = - R B^(*) P$ and $T$. ◻
]

Hereafter $C$, with or without a subscript, denotes a finite constant independent of the small scale parameters.
  It may change from one occurrence to the next. Constants are uniform over centers in $X$.

== 3 Quadratic mass growth <sec:mass>

Let $P \, mu$ be as in Proposition 4. We use the annihilation of closed invariant forms to bound the mass of $P$
  in every small ball. Write $B_s \( x \)$ for a geodesic ball.

#thm([Proposition 3.1.])[
  #emph[There is a constant $C$ such that
#[#set math.equation(numbering: n => "(3.1)")
 $ mu \( B_s \( x \) \) lt.eq C s^2 $ <eq:growth>]

 for all $x in X$ and $s > 0$.]
] <prop:growth>

The proof uses closed invariant test forms

$ D u = \( 1 - B R \) d d_J^c u \, wide d_J^c u = - d u compose J . $

The Hessian terms of $d d_J^c u$, with $J$ frozen at a point, form an invariant two-form.
  Consequently $R d d_J^c$ is a first-order differential operator on functions.

We first spell out the local estimate needed for the order-zero correction.
  In dimension four, an order-zero pseudodifferential operator has an off-diagonal kernel bounded by $C \| y -
  z \|^(- 4)$ in local coordinates #cite(label("Taylor1991")) Section 0.2, Proposition 0.2.B.
  Work in a fixed smooth local bundle trivialization. If $f$ is supported in a coordinate ball of radius $a lt.eq
  1$ and its coefficient derivatives satisfy

#[#set math.equation(numbering: n => "(3.2)")
 $ \| partial^j f \| lt.eq C_j M a^(- j) \, $ <eq:scaled-input>]

then its local contribution to the operator is bounded by $C M$.
  Indeed, write $f \( z \) = M tilde(f) \( \( z - z_0 \) \/ a \)$.
  Six bounded derivatives of $tilde(f)$ give $\| hat(tilde(f)) \( xi \) \| lt.eq
  C \( 1 + \| xi \|^2 \)^(- 3)$ by integration by parts. This bound is integrable in four dimensions,
  so $parallel hat(tilde(f)) parallel_1 lt.eq C$, and hence $parallel hat(f) parallel_1 lt.eq C M$.
  The bounded-symbol Fourier formula gives the assertion; smoothing remainders are controlled by $parallel f
  parallel_1$. This estimate uses the derivative bounds (3.2), not general $L^oo$ boundedness.

#thm([Lemma 3.2.])[
  #emph[Choose normal coordinates centered at $x$, on a uniformly small fixed ball, and put $t =
    d_g \( x \, y \)$. Let a smooth radial cutoff be one on a smaller ball and vanish outside the coordinate ball.
    For $s > 0$ small, let $u_s \, h_s$ be this cutoff times
$ log sqrt(s^2 + t^2) \, wide sqrt(s^2 + t^2) \, $

 respectively, extended by zero. Near the center,
#[#set math.equation(numbering: n => "(3.3)")
 $ \| B R d d_J^c u_s \| lt.eq frac(C, s + t) \, wide \| B R d d_J^c h_s \| lt.eq
   C \( 1 + \| log \( s + t \) \| \) . $ <eq:correction-bounds>]

 Both expressions are uniformly bounded at any fixed positive distance from $x$.]
] <lem:radial-correction>

#proof[
  The first-order property of $R d d_J^c$ gives
  $ \| partial^j \( R d d_J^c u_s \) \| lt.eq C_j \( s + t \)^(- 1 - j) \,
    wide \| partial^j \( R d d_J^c h_s \) \| lt.eq C_j \( s + t \)^(- j) $
  near $x$. Away from $x$, all fixed-order derivatives are uniformly bounded, including terms from the cutoff.
  At $y$, put $a = s + t$, assuming $a$ small. Localize the input to a ball about $y$ of radius a small fixed
    multiple of $a$. On this ball $s + d_g \( x \, dot.op \)$ is comparable to $a$,
    so (3.2) gives contributions $C \/ a$ and $C$. For the rest of the input within distance $O \( a \)$ of $x$,
    the kernel is bounded by $C a^(- 4)$. The respective input $L^1$ bounds on this region are $C a^3$ and $C
    a^4$, again giving $C \/ a$ and $C$.
  On the more distant shells about $x$, with radius $rho gt.eq C a$, the kernel is $O \( rho^(- 4) \)$,
    the input bounds are $C \/ rho$ and $C$, and the shell volume is $O \( rho^4 \)$.
    Summation over dyadic shells gives $C \/ a$ and $C \( 1 + \| log a \| \)$.
    The logarithmic input has uniformly bounded total $L^1$ norm,
    since its local integral is at most $C integral_0^(rho_0) rho^3 \/ \( s + rho \) thin d rho lt.eq C rho_0^3$.
    The square-root input has bounded $L^1$ norm as well. Thus the remaining smooth kernel terms are bounded
    uniformly. The same decomposition gives uniform bounds when $y$ stays a fixed distance from the center.
    Compactness makes all chart and operator constants uniform in $x$. ◻
]

#proof[
  In the normal coordinates of Lemma 6, let $J_0 = J \( x \)$ be the constant complex structure,
    orthogonal for the Euclidean metric at the center. On the inner ball, the Hessians of the two radial functions are
  $ frac(I, s^2 + t^2) - frac(2 z z^top, \( s^2 + t^2 \)^2) \, wide I / sqrt(s^2 + t^2) -
    frac(z z^top, \( s^2 + t^2 \)^(3 \/ 2)) . $
  Since $\( z dot.op v \)^2 + \( z dot.op J_0 v \)^2 lt.eq t^2 \| v \|^2$, their complex-line traces satisfy
  #[#set math.equation(numbering: n => "(3.4)")
   $ d d_(J_0)^c u_s \( v \, J_0 v \) & gt.eq frac(2 s^2 \| v \|^2, \( s^2 + t^2 \)^2) \,\
d d_(J_0)^c h_s \( v \, J_0 v \) & gt.eq frac(\| v \|^2, sqrt(s^2 + t^2)) . $ <eq:log-trace>]
  The first lower bound is nonnegative everywhere and at least $c \/ s^2$ for $t < s$ and $g$-unit $v$.
  Replacing $J_0$ by $J \( y \)$ both in the differential expression and in the second argument costs at most
    $C \/ \( s + t \)$ for $u_s$ and $C$ for $h_s$. To see this, use $J \( y \) - J_0 =
    O \( t \)$ on the Hessian terms and the bounded first derivatives of $J$ on the gradient terms.
    Euclidean and $g$-norms are uniformly comparable.
  Together with (3.3), this proves, for $s + t$ sufficiently small,
  $ D u_s \( v \, J v \) gt.eq c / s^2 upright(bold(1))_({ t < s }) - frac(C, s + t) \, wide
    D h_s \( v \, J v \) gt.eq frac(c', s + t) $
  with $c \, c' > 0$. In the second estimate the logarithmic correction is absorbed by the positive
    inverse-distance term on a sufficiently small fixed neighborhood.
    Choose a fixed $A > 0$ large enough to absorb the negative term in the first estimate.
    Outside that neighborhood all terms are uniformly bounded. We obtain globally
  $ D \( u_s + A h_s \) \( v \, J v \) gt.eq c / s^2 upright(bold(1))_(B_s \( x \)) - C' $
  for all unit $v$ and small $s$.
  The form on the left is closed and invariant. Applying $P$, which annihilates it, and using $mu \( X \) = 1$,
    gives $0 gt.eq c s^(- 2) mu \( B_s \( x \) \) - C'$. This proves (3.1) for small $s$.
    Increasing the constant handles all larger radii. ◻
]

== 4 Regularization and angular control <sec:energy>

We now combine quadratic mass growth with regularized current pairings to prove that $Q in
  L^2$ and to control the variation of nearby complex-line directions.
  These are the remaining quantitative inputs to the density-splitting theorem.

Let $Delta = d d^(*) + d^(*) d$ be the Hodge Laplacian, and set

$ S_r = \( 1 + r^2 Delta \)^(- 3) \, wide 0 < r < r_0 . $

The exponent is fixed. By Proposition 4, the regularizations of $P \, Q \, T$ belong to $L^2$:
  for fixed $r$, $S_r$ has order $- 6$ and maps $H^(- 3)$ into $H^3$.
  The same is true for a positive current $P'$ represented by any $lambda' lt.eq lambda$.
  Write $mu'$ for the projection of $lambda'$.

#thm([Lemma 4.1.])[
  #emph[If $T'$ is a closed current with $S_r T' in L^2$, then
#[#set math.equation(numbering: n => "(4.1)")
 $ ⟨S_r T \, * S_r T'⟩_(L^2) = 0 . $ <eq:zero-pairing>]

]
] <lem:zero-pairing>

#proof[
  The operator $S_r$ is self-adjoint, commutes with star in middle degree,
    and commutes across degrees with $d$ and $d^(*)$. It preserves smooth forms.
    Thus $S_r T$ annihilates every smooth closed form by (2.2).
    Closedness of $T'$ as a current means $d^(*) T' = 0$, so $* S_r T'$ is a distributionally closed $L^2$ form.
    Its heat regularizations are smooth closed forms and converge to it in $L^2$.
    The asserted pairing follows by continuity. ◻
]

=== 4.1 The kernel and its positive leading part <the-kernel-and-its-positive-leading-part>

For nearby $x \, y$, let $tau_(y x)$ denote metric parallel transport along the short geodesic from $y$ to $x$.

#thm([Lemma 4.2.])[
  #emph[The continuous kernel $K_r \( x \, y \)$ of $S_r^2$ can be written
$ K_r \( x \, y \) = p_r \( x \, y \) tau_(y x) + E_r \( x \, y \) \, $

 where $p_r gt.eq 0$ is supported in a fixed neighborhood of the diagonal. For every fixed positive integer $N$,
#[#set math.equation(numbering: n => "(4.2)")
 $ 0 lt.eq p_r \( x \, y \) & lt.eq C_N r^(- 4) \( 1 + d_g \( x \, y \) \/ r \)^(- N) \,\
p_r \( x \, y \) & gt.eq c r^(- 4) wide \( d_g \( x \, y \) < r \) \,\
\| E_r \( x \, y \) \| & lt.eq C_N r^(- 2) \( 1 + d_g \( x \, y \) \/ r \)^(- N) . $ <eq:p-upper>]

]
] <lem:kernel>

#proof[
  Spectral calculus gives
  #[#set math.equation(numbering: n => "(4.3)")
   $ S_r^2 = frac(1, Gamma \( 6 \)) integral_0^oo e^(- s) s^5 e^(- r^2 s Delta) thin d s . $ <eq:gamma>]
  The Hodge Laplacian is the Levi-Civita connection Laplacian on forms plus a zeroth-order curvature endomorphism.
    The leading term of its heat kernel, localized by a nonnegative diagonal cutoff, is
  $ chi \( x \, y \) \( 4 pi t \)^(- 2) e^(- d_g \( x \, y \)^2 \/ \( 4 t \)) a \( x \, y \) tau_(y x) \, $
  where $a$ is a smooth positive scalar volume correction and $chi = 1$ sufficiently near the diagonal.
    For the leading coefficient, see the author version #cite(label("Ludewig2018")) Section 3, equation (3.4);
    for uniform short-time asymptotics and the global Gaussian bound,
    see #cite(label("Ludewig2019")) Theorems 1.1 and 3.5.
  Fix a small $t_0 > 0$. After subtracting the displayed term, the short-time remainder has the bound
  #[#set math.equation(numbering: n => "(4.4)")
   $ C t^(- 1) e^(- c_0 d_g \( x \, y \)^2 \/ t) + C_M t^M \, wide 0 < t < t_0 \, $ <eq:heat-remainder>]
  for any prescribed integer $M$, with constants depending on $M$.
    Indeed, take a sufficiently long heat parametrix: the further localized coefficients gain at least one factor
    of $t$, and its final uniform remainder can be made $O \( t^M \)$.
    Off the diagonal the cutoff errors are of arbitrarily high order.
  Integrating the leading term for $r^2 s < t_0$ in (4.3) defines $p_r$. For each fixed $N$,
  $ e^(- c_0 d^2 \/ \( r^2 s \)) lt.eq C_N \( 1 + sqrt(s) \)^N \( 1 + d \/ r \)^(- N) . $
  The resulting $s$-integrals converge: their powers at zero are $s^3$ for the leading term and $s^4$ for the
    Gaussian remainder, and $e^(- s)$ controls infinity. This gives (4.2) and the Gaussian part of (4.2).
    Restricting to $1 lt.eq s lt.eq 2$ gives (4.2) for small $r$.
  The smooth remainder in (4.4) integrates to $O \( r^(2 M) \)$.
    Since $X$ has bounded diameter, choosing $2 M gt.eq N - 2$ absorbs it into (4.2).
    For $s gt.eq t_0 \/ r^2$, the heat kernel is uniformly bounded,
    and the tail of the gamma weight is exponentially small. This proves all the bounds.
    Notice that increasing $N$ changes the parametrix length, not the fixed resolvent power. ◻
]

For unit complex line bivectors at $x \, y$, respectively $ell \, m$, the algebra (2.1) gives the exact identity

#[#set math.equation(numbering: n => "(4.5)")
 $ ⟨ell \, * tau_(y x) m⟩ = 1 / 2 ⟨F_x \, tau_(y x) F_y⟩ - ⟨ell \, tau_(y x) m⟩ = 1 / 2 \| ell -
   tau_(y x) m \|^2 - 1 / 4 \| F_x - tau_(y x) F_y \|^2 . $ <eq:angular-identity>]

Here parallel transport is an isometry and commutes with star.
  In particular the negative term is $O \( d_g \( x \, y \)^2 \)$.

#thm([Lemma 4.3.])[
  #emph[Uniformly for all $lambda' lt.eq lambda$,
#[#set math.equation(numbering: n => "(4.6)")
 $ parallel S_r P' parallel_2 lt.eq C r^(- 1) \, $ <eq:smoothed-mass>]

 and, writing $d = d_g \( x \, y \)$,
#[#set math.equation(numbering: n => "(4.7)")
 $ ⟨S_r P \, * S_r P'⟩_(L^2) & gt.eq c r^(- 4) integral.double_(d < r) \| ell -
   tau_(y x) m \|^2 thin d lambda \( x \, ell \) thin d lambda' \( y \, m \)\
 & quad - C r^(- 2) integral.double \( 1 + d \/ r \)^(- 6) thin d mu \( x \) thin d mu' \( y \) .
   $ <eq:positive-pairing>]

 Moreover
#[#set math.equation(numbering: n => "(4.8)")
 $ r^(- 2) integral_X \( 1 + d_g \( x \, y \) \/ r \)^(- 6) thin d mu \( x \) lt.eq C . $ <eq:shell>]

]
] <lem:positive-pairing>

#proof[
  The inner ball and the dyadic shells in Proposition 5 give (4.8):
    the shell at distance comparable to $2^j r$ contributes at most $C r^2 thin 2^(- 4 j)$ before division by $r^2$.
  Self-adjointness and commutation with star give
  $ ⟨S_r P \, * S_r P'⟩ = integral.double ⟨ell \, * K_r \( x \, y \) m⟩ thin d lambda \( x \, ell \) thin d
    lambda' \( y \, m \) . $
  The identity is justified directly by the continuous kernel, or by approximation in $H^(- 3)$:
    the operator $S_r^2$ has order $- 12$ and maps $H^(- 3)$ into $H^9$, so the dual pairings are continuous.
    Using (4.5), retain its nonnegative term only on $d < r$, where (4.2) applies.
    By (4.2) with $N gt.eq 8$, the negative term is bounded by $C r^(- 2) \( 1 + d \/ r \)^(- 6)$;
    the kernel error has the same bound. This proves (4.7). For (4.6),
    use the analogous identity for $parallel S_r P' parallel_2^2$, take absolute values of the kernel,
    and apply (4.8) and $mu' lt.eq mu$. ◻
]

The kernel estimate and quadratic growth bound the negative error in (4.7) uniformly.
  To extract an $L^2$ bound for $Q$, we must also control the cross terms between invariant and anti-invariant
  components. The next estimate supplies this control.

=== 4.2 Mixing of invariant and anti-invariant components <mixing-of-invariant-and-anti-invariant-components>

#thm([Lemma 4.4.])[
  (Relative projection estimate).  #emph[Let $Pi$ be a fixed smooth orthogonal projection on $Lambda^2 T^(*) X$.
    If a distributional two-form $W$ satisfies $Pi W = 0$ and $S_r W in L^2$, then
#[#set math.equation(numbering: n => "(4.9)")
 $ parallel Pi S_r W parallel_2 lt.eq C r parallel S_r W parallel_2 . $ <eq:mixing>]

 The constant may depend on $Pi$, but is independent of $r$ and $W$.]
] <lem:mixing>

#proof[
  Put $U = S_r W$ and $A_r = \( 1 + r^2 Delta \)^3$. The operators $S_r$ and $A_r$ are inverse on distributions.
    Since $Pi A_r U = Pi W = 0$, we have, distributionally,
  $ Pi U = S_r A_r \( Pi U \) = S_r \[ A_r \, Pi \] U . $
  On smooth forms the adjoint of the operator on the right is $- \[ A_r \, Pi \] S_r$.
    Expanding the commutator gives terms $binom(3, j) r^(2 j) \[ Delta^j \, Pi \] S_r$, $1 lt.eq j lt.eq 3$.
    The principal symbol of $Delta^j$ is scalar, so $\[ Delta^j \, Pi \]$ has differential order at most $2 j -
    1$. The elliptic Sobolev calculus #cite(label("MelroseIML")) Propositions 6.7–6.8,
    together with spectral calculus for the Hodge Laplacian, gives
  $ parallel S_r parallel_(L^2 arrow.r H^(2 j - 1)) lt.eq C r^(- \( 2 j - 1 \)) . $
  Each term of the adjoint therefore has norm $O \( r \)$. Taking its bounded Hilbert-space adjoint extends
    $S_r \[ A_r \, Pi \]$ to $L^2$, agreeing with its distributional action. Applying this bound to $U$ proves (4.9). ◻
]

#thm([Proposition 4.5.])[
  #emph[The correction $Q$ belongs to $L^2$, and
#[#set math.equation(numbering: n => "(4.10)")
 $ cal(I)_r := integral.double_(d_g \( x \, y \) < r) \| ell -
   tau_(y x) m \|^2 thin d lambda \( x \, ell \) thin d lambda \( y \, m \) lt.eq C r^4 . $ <eq:angular>]

 For every positive current $P'$ represented by $lambda' lt.eq lambda$,
#[#set math.equation(numbering: n => "(4.11)")
 $ lim_(r arrow.b 0) ⟨S_r P' \, * S_r Q⟩_(L^2) = 0 . $ <eq:cross-vanish>]

]
] <prop:energy>

#proof[
  For any anti-invariant distribution $V$ with $S_r V in L^2$, split both factors along $R$ and $1 - R$,
    and use Lemmas 9 and 10:
  #[#set math.equation(numbering: n => "(4.12)")
   $ \| ⟨S_r P' \, S_r V⟩ \| lt.eq C r parallel S_r P' parallel_2 parallel S_r V parallel_2 lt.eq
     C parallel S_r V parallel_2 . $ <eq:cross-bound>]
  Since $Q$ is self-dual, Lemma 7 with $T' = T$ gives
  $ 0 = ⟨S_r P \, * S_r P⟩ + 2 ⟨S_r P \, S_r Q⟩ + parallel S_r Q parallel_2^2 . $
  Equations (4.7), (4.8), and (4.12) imply
  $ c r^(- 4) cal(I)_r + parallel S_r Q parallel_2^2 lt.eq C + C parallel S_r Q parallel_2 . $
  Thus $parallel S_r Q parallel_2$ is uniformly bounded and $cal(I)_r lt.eq C r^4$.
    A weakly convergent $L^2$ subsequence, together with distributional convergence $S_r Q arrow.r Q$,
    proves $Q in L^2$.
  For any anti-invariant $V in L^2$, (4.12) and the $L^2$ contraction property of $S_r$ give a uniform bound by $C
    parallel V parallel_2$. If $V$ is smooth, then it is self-dual and
  $ ⟨S_r P' \, * S_r V⟩ = P' \( S_r^2 V \) arrow.r P' \( V \) = 0 \, $
  because $S_r^2 V arrow.r V$ smoothly. Smooth anti-invariant forms are dense in the anti-invariant $L^2$
    subspace: smooth first and then apply $R$. Approximation of $Q$ now proves (4.11). ◻
]

== 5 Densities and planar tangent measures <sec:density>

We isolate the geometric statement that will be used to finish the proof.
  In its hypotheses, $P$ need not annihilate closed invariant forms.

#thm([Theorem 5.1.])[
  (Closedness of the positive-density part).  #emph[Fix a smooth almost complex structure $J$ and a $J$-Hermitian
    metric on a closed four-manifold. Suppose that
$ P \( alpha \) = integral_(cal(C)) alpha_x \( ell \) thin d lambda \( x \, ell \) $

 for a finite positive measure $lambda$, with projection $mu$.
   Suppose also that $Q in L^2$ is anti-invariant and that $P + Q$ is a closed current. Assume the estimates
#[#set math.equation(numbering: n => "(5.1)")
 $ mu \( B_r \( x \) \) & lt.eq C r^2 \,\
integral.double_(d_g \( x \, y \) < r) \| ell - tau_(y x) m \|^2 thin d lambda \( x \, ell \) thin d
  lambda \( y \, m \) & lt.eq C r^4 $ <eq:abstract-growth>]

 for all sufficiently small $r$, uniformly in $x$. Then the limit
$ theta \( x \) = lim_(r arrow.b 0) r^(- 2) mu \( B_r \( x \) \) $

 exists at every point. If $E = { x : theta \( x \) > 0 }$, the current $P_E = upright(bold(1))_E P$ is closed.]
] <thm:splitting>

For positive currents that are already closed, Elkhadhra proves that restriction to a $J$-analytic subset remains
  closed #cite(label("Elkhadhra2014")) Section 3.2, Lemma 1, author version.
  Here only $P + Q$ is initially closed, and the positive-density set is not assumed to be $J$-analytic;
  the mass and angular estimates provide the cutoff control needed for the restriction.

Throughout this section and Section 6, assume the hypotheses of Theorem 12, and write $T = P + Q$.
  We continue to write $cal(I)_r$ for the left side of (5.1).
  We first establish the density limit and show that, at $mu$-almost every positive-density point,
  the current has planar tangent measures. This makes the average transverse displacement small without supplying
  a rate. Section 6 combines that smallness with the angular bound to prove closedness.

#thm([Lemma 5.2.])[
  #emph[The two-density $theta \( p \)$ exists and is finite at every $p in X$.]
] <lem:density>

The radial comparison is in the tradition of Lelong–Jensen formulas for almost complex currents;
  see #cite(label("ElkhadhraMimouni2007")) Proposition 1 and Corollary 2.
  We apply closure to $P + Q$ and estimate the $L^2$ correction directly.

#proof[
  The current $T$ has measure coefficients with variation bounded by a constant times $sigma =
    mu + \| Q \| thin d V_g$. Cauchy–Schwarz and (5.1) give
  $ sigma \( B_s \( p \) \) lt.eq C s^2 \, $
  uniformly in $p$.
  In normal coordinates $z$ at $p$, let $J_0 = J \( p \)$ and $F_0 = F_p$ be constant, and put $t = \| z \| =
    d_g \( p \, y \)$. Our sign convention gives $d d_(J_0)^c \( t^2 \/ 2 \) = 2 F_0$.
    Call a radius #emph[good] if its sphere is $sigma$-null. For good radii define
  $ b \( r \) = r^(- 2) T \( upright(bold(1))_(B_r \( p \)) F_0 \) . $
  These pairings are well-defined using the coefficient measures. We claim that
  #[#set math.equation(numbering: n => "(5.2)")
   $ b \( s \) - b \( r \) = 1 / 2 T #scale(x: 120%, y: 120%)[\(] upright(bold(1))_({ r < t < s }) d d_(J_0)^c log
     t #scale(x: 120%, y: 120%)[\)] \, wide 0 < r < s . $ <eq:density-identity>]
  To verify it, define
  $ phi.alt_a \( t \) =
    cases(delim: "{", log a + \( t^2 - a^2 \) \/ \( 2 a^2 \) \, & t < a \,, log t \, & t gt.eq a .) $
  The function $phi.alt_r - phi.alt_s$ is compactly supported and $C^(1 \, 1)$.
    Its $d d_(J_0)^c$ is $2 \( r^(- 2) - s^(- 2) \) F_0$ on $B_r$, equals $d d_(J_0)^c log t -
    2 s^(- 2) F_0$ on the annulus, and is zero outside $B_s$.
    For fixed $r \, s$, compactly supported smooth approximations have uniformly bounded Hessians and converge in
    second derivatives off the two spheres. Dominated convergence against $sigma$ permits testing closure on their
    exact two-forms and passing to the limit. The resulting identity is (5.2).
  The form $d d_(J_0)^c log t$ is $J_0$-invariant and semipositive, with size $O \( t^(- 2) \)$.
    Since $J \( y \) - J_0 = O \( t \)$, it evaluates on actual complex line bivectors to at least $- C \/ t$,
    and its $J$-anti-invariant projection has size $O \( 1 \/ t \)$.
    The latter estimate controls its pairing with $Q$. Inward dyadic shells and the quadratic bound on $sigma$ give
  $ integral_({ 0 < t < s }) t^(- 1) thin d sigma lt.eq C s . $
  It follows that
  #[#set math.equation(numbering: n => "(5.3)")
   $ b \( s \) - b \( r \) gt.eq - C s . $ <eq:almost-monotone>]
  Also $T \( upright(bold(1))_(B_r) F \) = mu \( B_r \)$, since $⟨Q \, F⟩_g = 0$ almost everywhere.
    The bound $F - F_0 = O \( t \)$ therefore implies
  #[#set math.equation(numbering: n => "(5.4)")
   $ \| b \( r \) - r^(- 2) mu \( B_r \( p \) \) \| lt.eq C r . $ <eq:density-error>]
  In particular $b$ is bounded. Fix a good radius $s$ in (5.3) and let $r arrow.b 0$ through good radii;
    then let $s arrow.b 0$ along a sequence realizing the lower limit of $b$. The upper and lower limits agree.
    Equation (5.4) gives the density limit along good radii.
  Only countably many spheres at a fixed center can have positive $sigma$-mass.
    Any radius $r$ can therefore be bracketed by good radii in $\( \( 1 - epsilon \) r \, r \)$ and
    $\( r \, \( 1 + epsilon \) r \)$. Ball inclusion, followed by $r arrow.b 0$ and then $epsilon arrow.b 0$,
    proves the asserted limit along all radii. Its finiteness follows from (5.1). ◻
]

For $d_g \( x \, y \)$ below the injectivity radius, set $z_x \( y \) = exp_x^(- 1) \( y \)$.

#thm([Lemma 5.3.])[
  (Vanishing transverse moment).  #emph[Under the hypotheses of Theorem 12,
#[#set math.equation(numbering: n => "(5.5)")
 $ cal(N)_r := integral_(cal(C)) integral_(B_r \( x \)) lr(|"pr"_(L_ell^perp) frac(z_x \( y \), r)|)^2 thin d
   mu \( y \) thin d lambda \( x \, ell \) = o \( r^2 \) . $ <eq:transverse>]

]
] <lem:transverse>

#proof[
  Write $P = A mu$ in a smooth local frame, so that $A \( p \)$ is the conditional average of the line bivectors
    over $p$. At $mu$-almost every point, differentiation with respect to the Radon measure $mu$ gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ r^(- 2) integral_(B_(D r) \( p \)) \| A \( y \) - A \( p \) \| thin d mu \( y \) arrow.r
     0 wide \( D < oo upright(" fixed") \) . $ <eq:polarization-differentiation>]
  For the precise differentiation input one may use #cite(label("Kinnunen2026")) Theorem 4.33 and Corollary 4.34.
    To see the normalization, enclose $B_(D r) \( p \)$ in a Euclidean coordinate ball of radius $C D r$.
    The mean oscillation on that ball tends to zero, while its mass divided by $r^2$ is bounded by (5.1).
    This does not require $mu$ to be doubling. Smooth changes of frame add a vanishing $O \( r \)$ error after
    this normalization.
  Fix such a differentiation point $p$ with $theta \( p \) > 0$. The locally rescaled measures
  $ nu_r = r^(- 2) \( z_p \/ r \)_(*) mu $
  have uniformly bounded mass on each compact subset of $T_p X$,
    so every sequence of scales has a vaguely convergent subsequence. Every limit $nu$ satisfies
  #[#set math.equation(numbering: n => "(5.7)")
   $ nu \( B_D \( 0 \) \) = theta \( p \) D^2 wide \( D > 0 \) . $ <eq:tangent-ball>]
  Initially the identity follows at continuity radii of $nu$.
    Increasing continuity radii recover the mass of each open ball,
    while decreasing continuity radii recover the corresponding closed ball.
    Both masses are $theta \( p \) D^2$, so the identity holds for every $D > 0$ and every centered sphere is $nu$-null.
  The current and measure rescalings have the same normalization. Indeed, put $D_r \( y \) = z_p \( y \) \/ r$.
    For a compactly supported test two-form $beta = sum_(i < j) beta_(i j) \( w \) thin d w_i and d w_j$ on $T_p X$,
  $ D_r^(*) beta = r^(- 2) sum_(i < j) beta_(i j) \( z_p \/ r \) thin d z_i and d z_j . $
  Thus the pushforward $\( D_r \)_(*) T$, defined by testing $T$ against $D_r^(*) beta$,
    already has the $r^(- 2)$ factor in its coefficient measures; no further normalization is used.
    Equation (5.6) makes its $P$ part converge to $A \( p \) nu$.
    Its $Q$ part vanishes in variation on each fixed ball, since
  #[#set math.equation(numbering: n => "(5.8)")
   $ r^(- 2) integral_(B_(D r) \( p \)) \| Q \| thin d V_g lt.eq
     C_D parallel Q parallel_(L^2 \( B_(D r) \( p \) \)) arrow.r 0 . $ <eq:q-blowup>]
  The last limit holds at every point by absolute continuity of the integral of $\| Q \|^2$.
    Compactly supported tests in the rescaled coordinates pull back inside the original coordinate chart for small
    $r$. Thus closure passes to the limit, and $A \( p \) nu$ is a closed constant-polarization current on $T_p X$.
  For a constant skew matrix $A$, this closure says $sum_i A^(i j) partial_i nu = 0$ for each $j$.
    Consequently $partial_v nu = 0$ for every $v in "im" A \( p \)$.
    For a compactly supported smooth function $phi.alt$, the derivative of $t mapsto integral
    phi.alt \( w + t v \) thin d nu \( w \)$ is therefore zero.
    This proves that $nu$ is invariant under translations along $"im" A \( p \)$.
    The normalization $F_p \( A \( p \) \) = 1$ excludes rank zero.
    Rank four would imply that $nu$ is a constant multiple of four-dimensional Lebesgue measure,
    contrary to (5.7). Therefore $A \( p \)$ has real rank two.
  The associated positive Hermitian matrix has trace one and complex rank one.
    Thus $A \( p \)$ is itself a unit complex line bivector. If $lambda_p$ is the conditional probability measure
    on $cal(C)_p$, then
  $ integral_(cal(C)_p) \| ell - A \( p \) \|^2 thin d lambda_p \( ell \) = 1 - \| A \( p \) \|^2 = 0 . $
  Hence $lambda_p$ is concentrated on $A \( p \)$. Denote its plane by $L$.
  Translation invariance along $L$ implies
  $ nu = cal(L)_L^2 ⊗ gamma $
  for a positive Radon measure $gamma$ on $L^perp$. For example,
    testing against a nonnegative compactly supported function in the normal variables gives a
    translation-invariant measure in the tangential variables, hence a multiple of area;
    these multiples define $gamma$. Dividing the centered ball mass by $D^2$ in (5.7) yields
  #[#set math.equation(numbering: n => "(5.9)")
   $ theta \( p \) = pi integral_(L^perp) \( 1 - \| w \|^2 \/ D^2 \)_(+) thin d gamma \( w \) .
     $ <eq:transverse-product>]
  For $D_2 > D_1$, the difference of these integrands is nonnegative and strictly positive at every $0 < \| w \| <
    D_2$. Since the integrals are equal, $gamma$ is supported at the origin.
    Every tangent limit is therefore $\( theta \( p \) \/ pi \) cal(L)_L^2$.
  It follows that the normalized inner integral in (5.5) tends to zero at $lambda$-almost every $\( p \, ell \)$
    of positive density. Indeed, in the rescaled coordinates a continuous cutoff equal to one on $B_1$,
    supported in $B_2$, times $\| "pr"_(L^perp) z \|^2$ dominates the integrand and vanishes on every tangent
    limit. Subsequential compactness gives convergence along all scales.
  When $theta \( p \) = 0$, the same conclusion follows directly by bounding the normalized inner integral by
    $r^(- 2) mu \( B_r \( p \) \)$. These normalized integrals are uniformly bounded by (5.1).
    Dominated convergence against the finite measure $lambda$ proves (5.5). ◻
]

== 6 Closedness of the density restriction <sec:splitting>

#proof[
  The existence of the density is Lemma 13. We approximate the positive-density restriction by smooth functions of
    a regularized density. Closedness of $T$ then reduces the problem to controlling full derivatives against $Q$
    and tangential derivatives against $P$. The tangential estimate combines the quantitative angular bound with
    the vanishing transverse moment from Lemma 14; their product will make the cutoff boundary tend to zero.
    Choose a nonnegative, smooth, nonincreasing function $h : \[ 0 \, oo \) arrow.r \[ 0 \, oo \)$,
    positive near zero and zero on a neighborhood of $\[ 1 \, oo \)$. For $r$ below the injectivity radius define
  #[#set math.equation(numbering: n => "(6.1)")
   $ f_r \( x \) = r^(- 2) integral_X h \( d_g \( x \, y \)^2 \/ r^2 \) thin d mu \( y \) . $ <eq:density-cutoff>]
  The kernel is smooth near the diagonal and vanishes before the cut locus, so $f_r$ is smooth.
    It is uniformly bounded. Writing $H \( t \) = h \( t^2 \)$, integration of ball indicators gives
  $ f_r \( x \) = integral_0^1 \[ - H' \( t \) \] r^(- 2) mu \( B_(r t) \( x \) \) thin d t arrow.r
    c_h theta \( x \) \, wide c_h = integral_0^1 h \( u \) thin d u > 0 . $
  The quadratic growth bound supplies domination for this limit. In particular $theta$ is Borel measurable.
    Differentiation of the finite measure $mu$ with respect to four-dimensional volume also shows that
  #[#set math.equation(numbering: n => "(6.2)")
   $ theta \( x \) = 0 quad upright("for volume-almost every ") x . $ <eq:theta-volume>]
  Indeed, apply the differentiation theorem for Radon measures #cite(label("Kinnunen2026")) Theorem 4.19 in a
    fixed coordinate chart, with smooth volume as the denominator measure.
    At volume-almost every center the measure-to-volume ratios of sufficiently small coordinate balls are bounded.
    Enclosing a geodesic ball of radius $r$ in a coordinate ball of comparable radius therefore gives
    $mu \( B_r \( x \) \) = O_x \( r^4 \)$, and hence $r^(- 2) mu \( B_r \( x \) \) arrow.r 0$.
  === The error from the $L^2$ correction <the-error-from-the-l2-correction>
  Put $M_r \( x \) = mu \( B_r \( x \) \)$. Cauchy–Schwarz gives
  #[#set math.equation(numbering: n => "(6.3)")
   $ r^(- 3) integral_X \| Q \| M_r thin d V_g & lt.eq (integral_X \| Q \|^2 r^(- 2) M_r thin d V_g)^(1 \/ 2)
     (integral_X r^(- 4) M_r thin d V_g)^(1 \/ 2) arrow.r 0 . $ <eq:q-cutoff>]
  For the second factor, Fubini and the four-dimensional volume bound give
  $ integral_X r^(- 4) M_r \( x \) thin d V_g \( x \) = r^(- 4) integral_X "vol"_g \( B_r \( y \) \) thin d
    mu \( y \) lt.eq C mu \( X \) . $
  For the first, $r^(- 2) M_r$ is bounded and tends to zero volume-almost everywhere by (6.2).
    Dominated convergence applies to $\| Q \|^2$.
  First variation gives $\| d f_r \( x \) \| lt.eq C r^(- 3) M_r \( x \)$. Thus (6.3) also proves
  #[#set math.equation(numbering: n => "(6.4)")
   $ integral_X \| Q \| thin \| d f_r \| thin d V_g arrow.r 0 . $ <eq:q-full-derivative>]
  === Tangential derivatives of the density cutoff <tangential-derivatives-of-the-density-cutoff>
  We prove the complementary estimate
  #[#set math.equation(numbering: n => "(6.5)")
   $ integral_(cal(C)) \| d f_r \( x \) \|_(L_ell) thin d lambda \( x \, ell \) arrow.r 0 \, $ <eq:tangential-cutoff>]
  where the subscript means restriction of the covector to the two-plane $L_ell$.
  For $\( x \, ell \) in cal(C)$, $y in B_r \( x \)$, and $m in cal(C)_y$, put
  $ z = z_x \( y \) \, wide z^perp = "pr"_(L_ell^perp) z \, wide delta = \| ell - tau_(y x) m \| . $
  These quantities measure different errors (Figure 1). Closedness will replace a derivative along $L_ell$ by
    normal derivatives. Differentiating the radial kernel normally contributes $\| z^perp \| \/ r$,
    while the resulting mixed two-forms contribute $delta$. Keeping these factors together is what makes their
    integrated product overcome the cutoff’s $r^(- 3)$ normalization.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((0.19, 2.137), [#text(size: 9pt)[Displacement in $T_"xX"$]])
  line((-1.52, -0.57), (1.425, -0.57), (2.042, 0.19), (-0.9025, 0.19), close: true, fill: rgb("#ededff"), stroke: (paint: rgb("#a6a6ff"), thickness: 0.4pt, cap: "round", join: "round"))
  content((-0.95, -0.3515), [#text(fill: rgb("#000099"))[#text(size: 9pt)[$L_ ell$]]])
  line((6.175, 0), (0.9975, -0.114), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", join: "round"), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((6.175, 0), (0.9975, 1.377), stroke: (paint: rgb("#333333"), thickness: 0.8pt, cap: "round", join: "round"), mark: (end: (symbol: ">>", fill: rgb("#333333"))))
  content((3.586, 0.6887), [#text(size: 9pt)[$z"/"r$]], anchor: "east", padding: 0.1176cm)
  line((0.9975, -0.114), (0.9975, 1.377), stroke: (paint: rgb("#a60000"), thickness: 0.8pt, cap: "round", join: "round"), mark: (end: (symbol: ">>", fill: rgb("#a60000"))))
  content((0.9975, 0.6317), [#text(size: 9pt)[$z^ perp"/"r$]], anchor: "west", padding: 0.1176cm)
  circle((6.175, 0), radius: 0.04939, fill: black, stroke: none)
  content((6.175, 0), [#text(size: 9pt)[$0$]], anchor: "north-east", padding: 0.1176cm)
  circle((0.9975, -0.114), radius: 0.04233, fill: black, stroke: none)
  circle((0.9975, 1.377), radius: 0.04233, fill: black, stroke: none)
  content((0.19, -0.9975), [#text(size: 9pt)[$L_ ell + bb(R) z^ perp subset T_"xX"$]])
  content((6.603, 2.137), [#text(size: 9pt)[Chord in $Lambda^2T_"xX"$]])
  arc((7.695, 0), start: 0deg, stop: 78deg, radius: 1.52, stroke: (paint: rgb("#b2b2b2"), thickness: 0.4pt, cap: "round", join: "round", dash: "densely-dashed"))
  line((6.175, 0), (7.695, 0), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", join: "round"), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((6.175, 0), (6.817, 1.378), stroke: (paint: rgb("#0000a6"), thickness: 0.8pt, cap: "round", join: "round"), mark: (end: (symbol: ">>", fill: rgb("#0000a6"))))
  line((7.695, 0), (6.817, 1.378), stroke: (paint: rgb("#a60000"), thickness: 0.8pt, cap: "round", join: "round"))
  content((7.256, 0.6888), [#text(size: 9pt)[$delta$]], anchor: "west", padding: 0.1176cm)
  content((7.695, 0), [#text(size: 9pt)[$ell$]], anchor: "north", padding: 0.1176cm)
  content((6.817, 1.378), [#text(size: 9pt)[$tau_(y x)m$]], anchor: "south-east", padding: 0.1176cm)
  circle((6.175, 0), radius: 0.04939, fill: black, stroke: none)
  content((6.175, 0), [#text(size: 9pt)[$0$]], anchor: "north-east", padding: 0.1176cm)
  content((6.603, -0.589), [#text(size: 9pt)[$| ell |=| tau_(y x)m|=1$]])
  content((6.603, -0.9975), [#text(size: 9pt)[$1- chevron.l ell , tau_(y x)m chevron.r = delta^2"/"2$]])
})],
    caption: [Figure 1: The two factors in the tangential cutoff estimate. The left panel lies in the subspace spanned by $L_ell$ and the normal displacement. The right panel lies in the span of two unit bivectors, in a different ambient vector space. Closedness produces the product $delta \| z^perp \| \/ r$. The squared integrals of its factors are $cal(I)_r = O \( r^4 \)$ and $cal(N)_r = o \( r^2 \)$, respectively. ],
  ) <fig:cutoff-geometry>
  Fix $\( x \, ell \)$. Choose orthonormal normal coordinates $z = z_x \( y \)$ with $ell = e_1 and e_2$,
    and put $h_r \( z \) = h \( \| z \|^2 \/ r^2 \)$. At the fixed center $x$,
    first variation of squared distance gives $d_x \[ d_g \( x \, y \)^2 \] \( e_i \) = - 2 z_i$.
    Hence, for $i = 1 \, 2$,
  #[#set math.equation(numbering: n => "(6.6)")
   $ d f_r \( x \) e_i = - r^(- 2) integral_X partial_(z_i) h_r thin d mu \( y \) . $ <eq:center-derivative>]
  This differentiates the scalar distance kernel. We now freeze $x \, ell$, and these coordinates,
    and use closedness of $T$ in the $y$ variable.
  Coordinate covectors in normal coordinates differ from radially parallel covectors by $O \( \| z \|^2 \)$.
    Indeed, the Jacobi equation along $t mapsto exp_x \( t z \)$, in a parallel frame,
    has curvature coefficient $O \( \| z \|^2 \)$. The field with initial data $\( 0 \, v \)$ is therefore $t v +
    O \( \| z \|^2 \| v \| \)$ for $0 lt.eq t lt.eq 1$, giving $tau_(y x) compose d \( exp_x \)_z =
    upright("id") + O \( \| z \|^2 \)$. Inverting gives the same estimate for coordinate covectors.
    Since both line bivectors have norm one,
  #[#set math.equation(numbering: n => "(6.7)")
   $ \( d z_1 and d z_2 \) \( m \) = ⟨ell \, tau_(y x) m⟩ + O \( r^2 \) = 1 - 1 / 2 delta^2 +
     O \( r^2 \) wide \( \| z \| < r \) . $ <eq:quadratic-coordinate>]
  All errors are uniform. Comparing (6.6) with the $P$ part of the current below, and bounding its $Q$ part, gives
  #[#set math.equation(numbering: n => "(6.8)")
   $
     lr(|d f_r \( x \) e_i + r^(- 2) T #scale(x: 120%, y: 120%)[\(] \( partial_(z_i) h_r \) thin d z_1 and d z_2
     #scale(x: 120%, y: 120%)[\)]|) & lt.eq C r^(- 3) integral_(d_g \( x \, y \) < r) \( delta^2 + r^2 \) thin d
     lambda \( y \, m \)\
 & quad + C r^(- 3) integral_(B_r \( x \)) \| Q \| thin d V_g . $ <eq:comparison-error>]
  After integration against $lambda \( x \, ell \)$, its first term is $O \( r \)$ by (5.1).
    Its $r^2$ term is $O \( r \)$ by (5.1). Its last term tends to zero by Fubini and (6.3).
    Thus the integrated comparison error vanishes.
  For $i = 1$, apply closure to $d \( h_r d z_2 \)$; for $i = 2$, apply it to $d \( h_r d z_1 \)$.
    These one-forms are compactly supported in the chart and extend smoothly by zero.
    Since $d \( d z_j \) = 0$, each $T #scale(x: 120%, y: 120%)[\(] \( partial_(z_i) h_r \) thin d z_1 and
    d z_2 #scale(x: 120%, y: 120%)[\)]$ is, up to sign, a sum of terms
  $ T #scale(x: 120%, y: 120%)[\(] \( partial_(z_a) h_r \) thin d z_a and d z_j #scale(x: 120%, y: 120%)[\)] \,
    wide a = 3 \, 4 \, quad j in { 1 \, 2 } . $
  For the normal derivatives,
  $ \| partial_(z_a) h_r \| lt.eq C r^(- 1) lr(|"pr"_(L_ell^perp) \( z \/ r \)|) . $
  The mixed coordinate two-forms satisfy
  $ \| \( d z_a and d z_j \) \( m \) \| lt.eq C \( delta + r^2 \) . $
  Indeed their radially parallel counterparts vanish on $ell$, and their coordinate error is $O \( r^2 \)$.
  The integrated $Q$ and $r^2$ errors are controlled as in (6.8).
    Including the outer factor $r^(- 2)$, the remaining term is at most
  $ C r^(- 3) integral.double_(d_g \( x \, y \) < r) delta lr(|"pr"_(L_ell^perp) \( z_x \( y \) \/ r \)|) thin d
    lambda \( y \, m \) thin d lambda \( x \, ell \) . $
  By Cauchy–Schwarz, (5.1), and Lemma 14, this is bounded by
  #[#set math.equation(numbering: n => "(6.9)")
   $ C r^(- 3) sqrt(cal(I)_r) sqrt(cal(N)_r) = r^(- 3) O \( r^2 \) o \( r \) = o \( 1 \) . $ <eq:critical-scaling>]
  The second squared integral is exactly $cal(N)_r$, since its integrand does not depend on $m$.
    Combining with (6.8) proves (6.5). No derivative of a center-dependent frame occurs:
    first variation was applied before the fixed-chart current tests.
  === Passing to the positive-density set <passing-to-the-positive-density-set>
  Let $b : bb(R) arrow.r bb(R)$ be smooth with $b \( 0 \) = 0$.
    On the uniformly bounded range of $f_r$, both $b$ and $b'$ are bounded. Dominated convergence gives
  #[#set math.equation(numbering: n => "(6.10)")
   $ b \( f_r \) T arrow.r b \( c_h theta \) P $ <eq:weighted-current-limit>]
  as currents. For $P$ this follows from pointwise convergence of $f_r$. For $Q$ it follows from (6.2) and $Q in L^1$.
  If $eta$ is a smooth one-form, closedness of $T$ and the product rule give
  $ \( b \( f_r \) T \) \( d eta \) = - T #scale(x: 120%, y: 120%)[\(] b' \( f_r \) thin d f_r and
    eta #scale(x: 120%, y: 120%)[\)] . $
  The $Q$ contribution tends to zero by (6.4). A line bivector $ell$ evaluates $d f_r and
    eta$ using only the restriction of $d f_r$ to $L_ell$, so the $P$ contribution tends to zero by (6.5).
    It follows from (6.10) that $b \( c_h theta \) P$ is closed.
  Finally take $b_n \( s \) = 1 - e^(- n s)$. On the relevant nonnegative range, $0 lt.eq b_n lt.eq
    1$ and $b_n \( c_h theta \) arrow.r upright(bold(1))_E$. A second dominated-convergence limit proves that
    $P_E = upright(bold(1))_E P$ is closed. The limits are successive:
    first $r arrow.b 0$ for each fixed $n$, then $n arrow.r oo$. No bound on $b'_n$ uniform in $n$ is required. ◻
]

== 7 The final pairing <sec:conclusion>

#proof[
  Let $omega$ be a smooth closed form taming $J$. Suppose for contradiction that there is no compatible symplectic
    form, and take $P \, Q \, T \, lambda \, mu$ from Proposition 4.
    Propositions 5 and 11 verify all the hypotheses of Theorem 12.
    Consequently the current $P_E = upright(bold(1))_({ theta > 0 }) P$ is closed. Set
  $ P' = upright(bold(1))_(X \\ E) P \, wide T' = P' + Q = T - P_E . $
  Then $T'$ is closed. The current $P'$ is represented by the restriction $lambda' lt.eq
    lambda$ to base points outside $E$, with projection $mu' = upright(bold(1))_(X \\ E) mu$.
    We pair $T$ with this residual current rather than with itself:
    placing the second positive factor on zero-density centers makes the previously bounded negative error in the
    pairing tend to zero.
  We first show that the negative term in (4.7) tends to zero for this choice of $P'$. For each $y in.not E$,
  #[#set math.equation(numbering: n => "(7.1)")
   $ r^(- 2) integral_X \( 1 + d_g \( x \, y \) \/ r \)^(- 6) thin d mu \( x \) arrow.r 0 . $ <eq:zero-density-tail>]
  On the inner ball and on every fixed dyadic shell this follows from $s^(- 2) mu \( B_s \( y \) \) arrow.r 0$.
    The quadratic mass bound dominates the shell contributions by $C 2^(- 4 j)$, a summable sequence,
    giving the full limit. The uniform bound (4.8) then permits dominated convergence against $mu'$.
    Discarding the nonnegative angular term in (4.7) yields
  #[#set math.equation(numbering: n => "(7.2)")
   $ liminf_(r arrow.b 0) ⟨S_r P \, * S_r P'⟩_(L^2) gt.eq 0 . $ <eq:liminf>]
  Apply Lemma 7 to $T'$. Its regularizations are in $L^2$, since $P'$ has measure coefficients and $Q in L^2$.
    Expanding gives
  $ 0 = ⟨S_r P \, * S_r P'⟩ + ⟨S_r P \, * S_r Q⟩ + ⟨S_r Q \, * S_r P'⟩ + parallel S_r Q parallel_2^2 . $
  Both mixed terms tend to zero by (4.11), applied once to $P$ and once to $P'$.
    Since $S_r Q arrow.r Q$ strongly in $L^2$, (7.2) implies $0 gt.eq parallel Q parallel_2^2$. Therefore $Q = 0$.
  It follows that $P = T$ annihilates all smooth closed forms. In particular $P \( omega \) = 0$.
    On the other hand, $omega_x \( ell \) > 0$ on the compact bundle $cal(C)$; it has a positive minimum there.
    Equation (2.2) and $lambda \( cal(C) \) = 1$ give $P \( omega \) > 0$, a contradiction.
  The positive cone and the subspace of closed invariant smooth forms therefore intersect.
    Any form in their intersection is the required smooth compatible symplectic form for $J$. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
