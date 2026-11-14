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

#align(center)[#text(size: 16pt, weight: "bold")[An $L^2$ Einstein Gap for \
Nonnegatively Curved Four-Manifolds]]
#align(center)[OpenAI]
#align(center)[October 5, 2026]

== 1 Introduction <sec:intro>

For a Riemannian four-manifold $\( M \, g \)$, let

$ E_g = "Ric"_g - "Scal"_g / 4 g \, wide cal(D) \( g \) = integral_M \| E_g \|_g^2 thin d mu_g . $

The tensor $E_g$ vanishes precisely when $g$ is Einstein, provided that $M$ is connected.
  The energy $cal(D)$ is unchanged by constant rescaling in dimension four.
  It is therefore natural to ask whether a classification of Einstein metrics remains valid at the level of smooth
  manifolds when $cal(D)$ is small. We address this question under nonnegative sectional curvature.

We take the exact Einstein classification in #cite(label("ZeroPlane")) Corollary 1.2 as the following premise.

#prodef([Classification Assumption 1.1.])[
  #strong[Classification Assumption 1].  Every connected smooth closed Riemannian four-manifold $\( N \, h \)$
    satisfying
  $ "Ric"_h = 3 h \, wide sec_h gt.eq 0 $
  has universal Riemannian cover isometric to one of the following:
    the round $S^4$ of sectional curvature $1$; Fubini–Study $bb(C P)^2$ normalized by $"Ric" = 3 g$;
    or $S^2 \( 1 \/ sqrt(3) \) times S^2 \( 1 \/ sqrt(3) \)$ with its product metric.
] <ass:classification>

This premise is used only for an exactly Einstein metric; no stability statement is assumed.

#thm([Theorem 1.2.])[
  #emph[Assume Classification Assumption 1. There is a universal constant $epsilon_0 >
    0$ with the following property. If $\( M \, g \)$ is a connected, simply connected,
    smooth closed Riemannian four-manifold with $sec_g gt.eq 0$ and
$ integral_M lr(|"Ric"_g - "Scal"_g / 4 g|)_g^2 thin d mu_g < epsilon_0 \, $

 then $M$ is diffeomorphic, without a prescribed orientation, to the standard smooth $S^4$, $bb(C P)^2$,
   or $S^2 times S^2$.]
] <thm:gap>

There are no auxiliary bounds on curvature, volume, diameter, injectivity radius, Sobolev constants,
  or curvature derivatives. The conclusion is about the underlying smooth manifold,
  rather than the original metric. This distinction matters because small $L^2$ error does not itself give
  pointwise curvature control.

=== Context and methods <context-and-methods>

The exact Einstein problem has been studied under several additional hypotheses.
  Gursky and LeBrun obtained the Fubini–Study conclusion for nonnegative sectional curvature and a nonzero
  positive-definite intersection form #cite(label("GurskyLeBrun")).
  Cao and Tran established sectional-pinching criteria #cite(label("CaoTran")),
  and Liu classified the $T^2$-invariant case on closed simply connected four-manifolds #cite(label("Liu")).
  Here the classification premise is supplied by #emph[Zero-Plane Rigidity for Einstein Four-Manifolds]
  #cite(label("ZeroPlane")) Corollary 1.2. Our problem is instead to transfer that exact classification to metrics
  with small critical Ricci error.

The relation between Ricci curvature, scalar curvature, and topology is especially strong in dimension four:
  the Chern–Gauss–Bonnet formula controls the Euler characteristic by the total squared curvature.
  The almost-Schur inequality of De Lellis and Topping #cite(label("DeLellisTopping")) controls the variance of
  scalar curvature by the trace-free Ricci tensor under nonnegative Ricci curvature.
  We use its Bianchi–Bochner argument to choose a scale in which the Ricci tensor is close in $L^2$ to $3 g$.

Integral versions of Myers’ diameter argument combine second variation with control of curvature along many
  geodesics. The segment inequality of Cheeger and Colding #cite(label("CheegerColding")) and the
  integral-curvature diameter estimates of Petersen and Sprouse #cite(label("PetersenSprouse"))
  #cite(label("Sprouse")) provide the relevant context. We give the short segment-averaging argument needed here,
  together with an elementary derivation of the initial Sobolev inequality.
  These estimates prevent collapse before any smoothing is performed.

Hamilton’s Ricci flow #cite(label("HamiltonRF")) supplies the regularization.
  Perelman’s entropy monotonicity #cite(label("Perelman")) propagates a scalar-curvature-weighted Sobolev
  inequality. The passage from entropy to Sobolev inequalities along Ricci flow is developed by Ye and Zhang
  #cite(label("Ye")) #cite(label("Zhang")); we include the form needed here,
  with constants that are uniform even before a common existence interval is known.
  Shi’s derivative estimates #cite(label("Shi")) and Hamilton’s compactness theorem
  #cite(label("HamiltonCompactness")) then turn curvature control at positive times into smooth convergence.

Smoothing from small critical curvature concentration was developed, in particular, by Chan, Chen,
  and Lee #cite(label("ChanChenLee")). The formulation used here isolates a globally small #emph[high part] of the
  curvature. Consider a sequence $\( M_j \, g_j \)$ satisfying the geometric hypotheses of Theorem 2 with
  $cal(D) \( g_j \) arrow.r 0$. After normalization, nonnegative sectional curvature gives, for a fixed threshold $K_0$,

$ ∥\( \| "Rm"_(g_j) \| - K_0 \)_(+)∥_(L^2 \( g_j \)) arrow.r 0 . $

A moving threshold propagates this estimate. It yields both a uniform Sobolev inequality and noncollapse along
  each existing flow; a curvature-concentration contradiction then establishes a common lifespan.
  The same tail bound controls the evolving Einstein error.
  Thus the high-part formulation supplies both the regularization and the defect estimate needed for the gap argument.

A second point concerns sectional curvature. Its nonnegativity is not assumed to persist under the flow.
  Instead, we bound the integral of its negative part by $C t$.
  The limit is an exactly Einstein shrinking flow, and its explicit scaling converts this weak defect estimate
  into nonnegative sectional curvature of the fixed Einstein metric.
  This gives the classification-independent compactness statement of Proposition 12;
  classification then identifies the limiting manifold.

=== Proof organization <proof-organization>

Section 2 normalizes the sequence and establishes the initial geometric and Sobolev bounds.
  Section 3 obtains a uniform smoothing interval by controlling the high-curvature part.
  Section 4 propagates the Einstein error and estimates the negative sectional curvature.
  Section 5 constructs the compact Einstein limit, identifies its sectional curvature, and proves Theorem 2.

All manifolds are smooth, and #emph[closed] means compact without boundary.
  We use $R = "Scal"$ and the curvature convention in which $"Rm" \( X \, Y \, X \, Y \)$ is the sectional
  curvature of an orthonormal pair. The Laplacian is $Delta = "tr" nabla^2$.
  Norms and integrals use the displayed metric, or the current metric along a flow, and are not volume-normalized.
  Constants denoted by $C$ or $c$ may change from line to line.
  Uniformity always means independence of the sequence index, after discarding finitely many terms.

== 2 Normalization and initial geometry <sec:initial>

Throughout the proof let $\( M_j \, g_j \)$ be connected, simply connected, closed four-manifolds with

#[#set math.equation(numbering: n => "(2.1)")
 $ sec_(g_j) gt.eq 0 \, wide ∥E_(g_j)∥_2 arrow.r 0 . $ <eq:sequence>]

The aim of this section is to obtain uniform geometric bounds without assuming a curvature maximum bound.
  We suppress $j$ when considering one metric in the sequence.

#thm([Proposition 2.1.])[
  #emph[After constant rescaling, the metrics in (2.1) satisfy
#[#set math.equation(numbering: n => "(2.2)")
 $ 1 / V integral_M R thin d mu = 12 \, wide ∥R - 12∥_2 lt.eq 4 ∥∥ E_2 \, wide ∥"Ric" - 3 g∥_2 arrow.r 0 \,
   $ <eq:normalization>]

 where $V = "Vol" \( M \, g \)$. There are uniform positive constants $v_0 \, V_0 \, D_0$ such that
#[#set math.equation(numbering: n => "(2.3)")
 $ v_0 lt.eq V lt.eq V_0 \, wide "diam" \( M \, g \) lt.eq D_0 . $ <eq:initial-geometry>]

]
] <prop:initial>

#proof[
  Simple connectivity implies orientability and $b_1 = 0$. Poincaré duality therefore gives $chi \( M \) = 2 +
    b_2 \( M \) gt.eq 2$. By Chern–Gauss–Bonnet,
  #[#set math.equation(numbering: n => "(2.4)")
   $ 2 lt.eq chi \( M \) lt.eq C integral_M \| "Rm" \|^2 thin d mu . $ <eq:euler>]
  On the space of algebraic curvature tensors, the maximum absolute sectional curvature is a norm:
    sectional curvatures determine the tensor. Equivalence of norms in this finite-dimensional space,
    together with $0 lt.eq sec lt.eq R \/ 2$, gives a dimensional constant $C_0$ such that
  #[#set math.equation(numbering: n => "(2.5)")
   $ \| "Rm" \| lt.eq C_0 R . $ <eq:algebraic>]
  The average scalar curvature is positive, since otherwise $R equiv 0$ and (2.5) contradicts (2.4).
    Rescale so that its average is $12$. The $L^2$ norm of $E$ is unchanged.
  For completeness, the almost-Schur argument #cite(label("DeLellisTopping")) Section 2.1 in the form needed here
    is as follows. Solve $Delta f = R - 12$. The contracted Bianchi identity says $"div" E = 1 / 4 d R$,
    so integration by parts gives
  $ integral_M \( R - 12 \)^2 thin d mu = 4 integral_M chevron.l E \, nabla^2 f chevron.r thin d mu . $
  Since $"Ric" gt.eq 0$, the integrated Bochner formula yields $∥nabla^2 f∥_2 lt.eq ∥Delta f∥_2$.
    Cauchy–Schwarz proves the second assertion in (2.2). Orthogonality of the trace and trace-free parts gives
  #[#set math.equation(numbering: n => "(2.6)")
   $ ∥"Ric" - 3 g∥_2^2 = ∥∥ E_2^2 + 1 / 4 ∥R - 12∥_2^2 arrow.r 0 . $ <eq:ricci-error>]
  Moreover,
  $ integral_M R^2 thin d mu = 144 V + ∥R - 12∥_2^2 . $
  Combining this identity with (2.4) and (2.5) gives $V gt.eq v_0 > 0$ for all sufficiently large $j$.
  It remains to control the diameter. Write $D = "diam" \( M \, g \)$ and choose points realizing it.
    Let $A_1 \, A_2$ be the balls of radius $D \/ 4$ about these points.
    Bishop–Gromov comparison gives $"Vol" \( A_i \) gt.eq 8^(- 4) V$, by comparison with the ball of radius $2 D$.
    For any nonnegative continuous function $H$, the segment inequality is
  #[#set math.equation(numbering: n => "(2.7)")
   $ integral_(A_1 times A_2) integral_(gamma_(x y)) H thin d s thin d mu \( x \) d mu \( y \) lt.eq
     C D #scale(x: 120%, y: 120%)[\(] "Vol" \( A_1 \) + "Vol" \( A_2 \) #scale(x: 120%, y: 120%)[\)] integral_M H
     thin d mu \, $ <eq:segment>]
  where $gamma_(x y)$ is the minimizing geodesic, unique for almost every pair.
    This is the nonnegative-Ricci case of #cite(label("CheegerColding")) Theorem 2.11.
    To see the estimate directly, fix $x$ and use polar coordinates $y = exp_x \( r theta \)$ before cut time.
    On the half-segment $r \/ 2 lt.eq s lt.eq r$, Jacobian comparison gives
  $ J_x \( r \, theta \) lt.eq \( r \/ s \)^3 J_x \( s \, theta \) lt.eq 8 J_x \( s \, theta \) . $
  Changing the order of integration bounds the integral over this half, and over $y$,
    by $C D integral_M H thin d mu$. Integrating in $x in A_1$ gives its contribution to (2.7).
    Reverse the geodesic and fix $y$ to treat the other half. The cut locus has measure zero.
  Apply (2.7) to $H = \| "Ric" - 3 g \|$. Some minimizing geodesic between the two balls has length $ell gt.eq
    D \/ 2$ and satisfies
  #[#set math.equation(numbering: n => "(2.8)")
   $ integral_0^ell H \( gamma \( s \) \) thin d s lt.eq delta_j D \, wide delta_j = C V^(- 1 \/ 2) ∥"Ric" -
     3 g∥_2 arrow.r 0 . $ <eq:good-segment>]
  Use three parallel orthonormal normal fields along $gamma$, each multiplied by $sin \( pi s \/ ell \)$,
    in the index form. Summing gives
  $ frac(3 pi^2, 2 ell) gt.eq integral_0^ell sin^2 \( pi s \/ ell \) "Ric" \( dot(gamma) \, dot(gamma) \) thin d s
    gt.eq frac(3 ell, 2) - delta_j D . $
  Because $D lt.eq 2 ell$, we obtain $\( 3 \/ 2 - 2 delta_j \) ell^2 lt.eq 3 pi^2 \/ 2$.
    Thus $D$ is uniformly bounded. Bishop comparison now gives the uniform upper volume bound as well. ◻
]

=== 2.1 A support estimate and the Sobolev inequality <a-support-estimate-and-the-sobolev-inequality>

We will need Sobolev inequalities both initially and along the flow.
  The following elementary truncation lemma allows us to derive both from estimates for functions with small support.

#thm([Lemma 2.2.])[
  #emph[Let $\( M \, g \)$ be a closed four-manifold, $a > 0$, and $P gt.eq 0$ a smooth function. Set
$ cal(E) \( f \) = integral_M \( a \| nabla f \|^2 + P f^2 \) thin d mu . $

 Suppose that for every Lipschitz function $f$, with $m = "Vol" { f eq.not 0 }$, one has
#[#set math.equation(numbering: n => "(2.9)")
 $ ∥∥ f_2^2 lt.eq C m^(1 \/ 2) cal(E) \( f \) . $ <eq:support>]

 Then $∥∥ f_4^2 lt.eq C' cal(E) \( f \)$ for every such $f$, where $C'$ depends only on $C$.]
] <lem:truncation>

#proof[
  For $k in bb(Z)$ define
  $ m_k = "Vol" { \| f \| > 2^k } \, wide f_k = min { \( \| f \| - 2^k \)_(+) \, 2^k } . $
  The assumed estimate implies
  $ 2^(2 k) m_(k + 1) lt.eq ∥f_k∥_2^2 lt.eq C m_k^(1 \/ 2) cal(E) \( f_k \) . $
  The gradients of $f_k$ occupy disjoint layers up to null sets, and $sum_k f_k^2 lt.eq
    C_1 f^2$ pointwise by a geometric series. Consequently $sum_k cal(E) \( f_k \) lt.eq C_2 cal(E) \( f \)$,
    with numerical constants. Put $b_k = 2^(4 k) m_k$. The preceding estimate becomes
  $ b_(k + 1) lt.eq 16 C b_k^(1 \/ 2) cal(E) \( f_k \) . $
  The sum $B = sum_k b_k$ is finite and comparable, with numerical constants, to $integral_M \| f \|^4 thin d mu$:
    integrate the geometric series $sum_(2^k < \| f \|) 2^(4 k)$ pointwise.
    Summing over $k$ and using $b_k^(1 \/ 2) lt.eq B^(1 \/ 2)$ gives $B lt.eq 16 C C_2 B^(1 \/ 2) cal(E) \( f \)$.
    Division by $B^(1 \/ 2)$ when $B > 0$ proves the result; the case $B = 0$ is immediate. ◻
]

#thm([Proposition 2.3.])[
  #emph[The normalized metrics of Proposition 3 satisfy
#[#set math.equation(numbering: n => "(2.10)")
 $ ∥∥ f_4^2 lt.eq S integral_M \( \| nabla f \|^2 + f^2 \) thin d mu $ <eq:initial-sobolev>]

 for all Lipschitz functions $f$, with a uniform constant $S$.]
] <prop:initial-sobolev>

#proof[
  We establish (2.9) with $a = P = 1$. Let $macron(f) = V^(- 1) integral_M f thin d mu$.
    Polar integration of $\| f \( x \) - f \( y \) \|$ along minimizing segments yields
  #[#set math.equation(numbering: n => "(2.11)")
   $ \| f \( x \) - macron(f) \| lt.eq frac(C D^4, V) integral_M frac(\| nabla f \( y \) \|, d \( x \, y \)^3)
     thin d mu \( y \) . $ <eq:kernel>]
  Indeed, on a ray from $x$, the coefficient of $\| nabla f \|$ at distance $s$ is bounded using
  $ integral_s^("cut" \( theta \)) J_x \( r \, theta \) thin d r lt.eq
    frac(J_x \( s \, theta \), s^3) integral_s^D r^3 thin d r lt.eq frac(D^4 J_x \( s \, theta \), 4 s^3) . $
  This proves (2.11); absolute continuity along almost every ray justifies it for Lipschitz functions.
  For any measurable set $A$ of volume $m > 0$, comparison with Euclidean polar measure gives
  $ sup_x integral_A d \( x \, y \)^(- 3) thin d mu \( y \) lt.eq C m^(1 \/ 4) . $
  To verify this, split the integral at radius $rho = m^(1 \/ 4)$.
    The inner integral is at most $C rho$ because $J_x \( r \, theta \) lt.eq r^3$;
    the outer integral is at most $m rho^(- 3)$. By symmetry the same bound holds with $x$ and $y$ interchanged.
    The integral operator with this kernel, restricted to $A$ in both variables,
    therefore has $L^2$ norm at most $C m^(1 \/ 4)$ by the Schur estimate.
  Take $A = { f eq.not 0 }$. The gradient vanishes almost everywhere off $A$, and (2.3) bounds $D^4 \/ V$.
    Taking $L^2 \( A \)$ norms in (2.11) gives
  $ ∥∥ f_2 lt.eq C m^(1 \/ 4) ∥nabla f∥_2 + sqrt(m) thin \| macron(f) \| lt.eq C m^(1 \/ 4) ∥nabla f∥_2 + m /
    V ∥∥ f_2 . $
  If $m \/ V lt.eq 1 \/ 2$, absorb the last term and square.
    If $m \/ V > 1 \/ 2$, then $m gt.eq v_0 \/ 2$, and (2.9) follows directly from the $integral
    f^2$ term in the energy. Lemma 4 completes the proof. ◻
]

== 3 A uniform smoothing interval <sec:smoothing>

Let $g_j \( t \)$ be the maximal smooth unnormalized Ricci flows with the normalized initial metrics above:

$ partial_t g_j = - 2 "Ric"_(g_j) \, wide g_j \( 0 \) = g_j . $

Short-time existence and the curvature continuation criterion are standard on closed manifolds
  #cite(label("HamiltonRF")). Initially each flow has its own maximal time $cal(T)_j > 0$.
  Until a common lower bound for these times is proved, every estimate refers only to existing times.
  The scalar evolution and volume variation are

#[#set math.equation(numbering: n => "(3.1)")
 $ partial_t R = Delta R + 2 \| "Ric" \|^2 \, wide partial_t d mu = - R thin d mu . $ <eq:scalar-volume>]

Thus $R gt.eq 0$ and $"Vol" \( M \, g_j \( t \) \) lt.eq V_0$ throughout smooth existence.
  We first propagate a Sobolev inequality with a scalar-curvature weight,
  then use smallness of the high-curvature part to remove that weight.

=== 3.1 Entropy supplies a weighted Sobolev inequality <entropy-supplies-a-weighted-sobolev-inequality>

#thm([Proposition 3.1.])[
  #emph[There is a uniform $S_1$ such that, whenever $0 lt.eq t < min { 1 \, cal(T)_j }$,
#[#set math.equation(numbering: n => "(3.2)")
 $ ∥∥ f_4^2 lt.eq S_1 integral_M #scale(x: 120%, y: 120%)[\(] 4 \| nabla f \|^2 + \( R + 1 \) f^2
   #scale(x: 120%, y: 120%)[\)] thin d mu $ <eq:weighted>]

 for every Lipschitz function $f$ on $\( M_j \, g_j \( t \) \)$.]
] <prop:weighted>

#proof[
  In dimension four, Perelman’s entropy is
  $ mu \( g \, tau \) = inf_(integral f^2 thin d mu = 1) { & tau integral_M \( 4 \| nabla f \|^2 + R f^2 \) thin d
    mu - integral_M f^2 log f^2 thin d mu\
 & - 2 log \( 4 pi tau \) - 4 } \, $
  where the infimum is over smooth positive $f$. Its monotonicity gives
  #[#set math.equation(numbering: n => "(3.3)")
   $ mu \( g_j \( t \) \, tau \) gt.eq mu \( g_j \( 0 \) \, tau + t \) \, wide tau > 0 $ <eq:perelman>]
  #cite(label("Perelman")) Section 3. Here $tau + t$ is an entropy parameter, not a later flow time,
    so (3.3) imposes no additional lifespan requirement.
  At time zero, Jensen’s inequality and (2.10) give
  $ integral_M f^2 log f^2 thin d mu lt.eq log integral_M f^4 thin d mu lt.eq
    2 log #scale(x: 120%, y: 120%)[\(] S \( y + 1 \) #scale(x: 120%, y: 120%)[\)] \, wide y =
    integral_M \| nabla f \|^2 thin d mu \, $
  for $integral f^2 thin d mu = 1$. Since $R gt.eq 0$,
  $ mu \( g_j \( 0 \) \, tau \) gt.eq inf_(y gt.eq 0) { 4 tau y - 2 log \( tau \( y + 1 \) \) } - C gt.eq -
    C' quad \( 0 < tau lt.eq 2 \) . $
  The last bound follows by writing $z = tau \( y + 1 \)$: the expression in braces is $4 z - 2 log z - 4 tau$,
    uniformly bounded below in this range. Consequently (3.3) gives, at all times under consideration,
  #[#set math.equation(numbering: n => "(3.4)")
   $ integral_M f^2 log f^2 thin d mu lt.eq tau cal(E)_0 \( f \) - 2 log tau + C \, wide cal(E)_0 \( f \) =
     integral_M \( 4 \| nabla f \|^2 + R f^2 \) thin d mu \, $ <eq:log-sobolev>]
  whenever $∥∥ f_2 = 1$ and $0 < tau lt.eq 1$. Approximation of $\|
    f \|$ by positive smooth functions extends this to Lipschitz $f$, with $0 log 0 = 0$.
  Let $m = "Vol" { f eq.not 0 }$. For a normalized $f$, Jensen’s inequality on its support gives $integral f^2 log
    f^2 thin d mu gt.eq log \( 1 \/ m \)$. Choose $tau = \( 1 + cal(E)_0 \( f \) \)^(- 1)$ in (3.4). It follows that
  $ log \( 1 \/ m \) lt.eq 2 log \( 1 + cal(E)_0 \( f \) \) + C . $
  Exponentiation, followed by homogeneity for arbitrary $f$, yields
  $ ∥∥ f_2^2 lt.eq C m^(1 \/ 2) (cal(E)_0 \( f \) + ∥∥ f_2^2) . $
  Apply Lemma 4 with $a = 4$ and $P = R + 1$. ◻
]

=== 3.2 The high-curvature part stays small <the-high-curvature-part-stays-small>

In orthonormal frames evolving by $partial_t e_i = "Ric"^sharp e_i$, the curvature equation has the form

#[#set math.equation(numbering: n => "(3.5)")
 $ partial_t "Rm" = Delta "Rm" + cal(Q) \( "Rm" \) \, wide \| cal(Q) \( "Rm" \) \| lt.eq
   C_q \| "Rm" \|^2 . $ <eq:curvature-flow>]

Here time derivatives are derivatives of the moving-frame components;
  the connection Laplacian has the sign fixed in Section 1.
  It follows that $u = \| "Rm" \|$ satisfies $\( partial_t - Delta \) u lt.eq C_q u^2$ wherever $u > 0$.

Choose the scalar function $K$ by

#[#set math.equation(numbering: n => "(3.6)")
 $ K \( 0 \) = 12 C_0 \, wide K' = C_q K^2 \, $ <eq:threshold>]

where $C_0$ is from (2.5). Fix $T in \( 0 \, 1 \/ 6 \)$ so small that $K$ is bounded on $\[ 0 \, T \]$, and set

$ w_j \( t \) = #scale(x: 120%, y: 120%)[\(] \| "Rm"_(g_j \( t \)) \| - K \( t \) #scale(x: 120%, y: 120%)[\)]_(+) . $

At time zero, (2.5) implies

#[#set math.equation(numbering: n => "(3.7)")
 $ 0 lt.eq w_j \( 0 \) lt.eq C_0 \( R_(g_j) - 12 \)_(+) \, wide ∥w_j \( 0 \)∥_2 arrow.r 0 . $ <eq:initial-tail>]

#thm([Proposition 3.2.])[
  #emph[After discarding finitely many indices, there are uniform constants $S_2 \, C$ such that, for $0 lt.eq
    t < min { T \, cal(T)_j }$,
#[#set math.equation(numbering: n => "(3.8)")
 $ ∥∥ f_4^2 & lt.eq S_2 integral_M \( \| nabla f \|^2 + f^2 \) thin d mu \,\
integral_M w_j \( t \)^2 thin d mu & lt.eq e^(C t) integral_M w_j \( 0 \)^2 thin d mu_(g_j) \,\
integral_M \| "Rm"_(g_j \( t \)) \|^2 thin d mu & lt.eq C . $ <eq:flow-sobolev>]

 The Sobolev estimate holds for every Lipschitz function $f$.
   In particular, the supremum of $∥w_j \( t \)∥_2$ over these existing times tends to zero.]
] <prop:tail>

#proof[
  We first work on any interval where $∥∥ w_2 lt.eq eta$ for a small fixed $eta > 0$.
    Since $R lt.eq C \| "Rm" \| lt.eq C \( K + w \)$, the last term in (3.2) is bounded by a fixed multiple of
    $integral f^2$ plus
  $ C integral_M w f^2 thin d mu lt.eq C eta ∥∥ f_4^2 . $
  Choose $eta$ so that this term is absorbed into the left side.
    This gives (3.8) with a fixed $S_2$; decreasing $eta$ further does not change the chosen $S_2$.
  On ${ u > K }$, the equation for $K$ removes the bounded-background reaction:
  $ \( partial_t - Delta \) \( u - K \) lt.eq C_q \( u^2 - K^2 \) = C_q \( w^2 + 2 K w \) . $
  Integration by parts and (3.1) therefore give
  #[#set math.equation(numbering: n => "(3.9)")
   $ frac(d, d t) integral_M w^2 thin d mu lt.eq - 2 integral_M \| nabla w \|^2 thin d mu +
     2 C_q integral_M w^3 thin d mu + 4 C_q K integral_M w^2 thin d mu . $ <eq:tail-energy>]
  There is no adverse volume term, since $- integral R w^2 thin d mu lt.eq 0$.
    The calculation is valid for the positive part: $K > 0$, so $u$ is smooth near ${ u gt.eq K }$;
    the function $\( u - K \)_(+)^2$ is continuously differentiable,
    and Lipschitz truncation justifies integration by parts.
  Hölder’s inequality and (3.8) give
  $ integral_M w^3 thin d mu lt.eq eta ∥∥ w_4^2 lt.eq eta S_2 integral_M \( \| nabla w \|^2 + w^2 \) thin d mu . $
  Decrease $eta$ so that $2 C_q eta S_2 lt.eq 1$. Then $Y \( t \) = integral w^2 thin d mu$ satisfies $Y' lt.eq
    C Y$ as long as $Y^(1 \/ 2) lt.eq eta$. By (3.7), for large $j$ we have $Y \( 0 \) e^(C T) < eta^2$.
    Gronwall’s inequality and continuity exclude a first time with $Y^(1 \/ 2) = eta$ before $min { T \,
    cal(T)_j }$. This proves (3.8) and (3.8) on the entire existing interval.
    Finally, $u lt.eq K + w$ and $"Vol" \( M \, g_j \( t \) \) lt.eq V_0$ give (3.8). ◻
]

=== 3.3 Noncollapse and the common lifespan <noncollapse-and-the-common-lifespan>

No common existence time has been used in this argument. We now use its two outputs,
  uniform Sobolev control and a vanishing curvature tail, to establish one.

#thm([Lemma 3.3.])[
  #emph[There is a uniform $v_(*) > 0$ such that at every time covered by Proposition 7,
#[#set math.equation(numbering: n => "(3.10)")
 $ "Vol"_(g_j \( t \)) B_(g_j \( t \)) \( x \, r \) gt.eq v_(*) r^4 quad upright("for all ") x in M_j \, quad
   0 < r lt.eq 1 . $ <eq:noncollapse>]

]
] <lem:noncollapse>

#proof[
  Write $V_x \( r \) = "Vol" B \( x \, r \)$ on one smooth slice.
    Insert into (3.8) the distance cutoff that is $1$ on $B \( x \, r \/ 2 \)$, vanishes outside $B \( x \, r \)$,
    and has gradient at most $2 \/ r$. Then
  $ V_x \( r \/ 2 \)^(1 \/ 2) lt.eq C r^(- 2) V_x \( r \) . $
  For $a \( r \) = V_x \( r \) \/ r^4$, this gives $a \( r \) gt.eq c thin a \( r \/ 2 \)^(1 \/ 2)$. Iteration yields
  $ a \( r \) gt.eq c^(2 \( 1 - 2^(- k) \)) a \( 2^(- k) r \)^(2^(- k)) . $
  For this fixed smooth metric, $a \( s \) arrow.r omega_4$ as $s arrow.b 0$,
    where $omega_4$ is the volume of the Euclidean unit ball in $bb(R)^4$.
    Letting $k arrow.r oo$ gives $a \( r \) gt.eq c^2$. No uniform scale for the Euclidean asymptotic is required. ◻
]

#thm([Proposition 3.4.])[
  #emph[For all sufficiently large $j$, the flow $g_j \( t \)$ exists on $\[ 0 \, T \]$.
    There is a uniform constant $A$ such that
#[#set math.equation(numbering: n => "(3.11)")
 $ max_(M_j) \| "Rm"_(g_j \( t \)) \| lt.eq A / t \, wide 0 < t < T . $ <eq:curvature-bound>]

]
] <prop:smoothing>

#proof[
  Fix $A > 2$ with $A \/ T gt.eq 1$ and $A \/ T gt.eq 4 max_(\[ 0 \, T \]) K$.
    Suppose that $t max_M u \( t \)$ first reaches $A$ at an existing time $t < T$.
    Set $Q = max_M u \( t \) = A \/ t$. On $\[ t - Q^(- 1) \, t \]$ the curvature is at most $2 Q$, because $t -
    Q^(- 1) gt.eq t \/ 2$ and this is a first crossing. Parabolic rescaling gives a smooth closed flow on
    $\[ 0 \, 1 \]$ whose curvature norm is at most $2$. Shi’s first derivative estimate #cite(label("Shi")) gives
  $ \| nabla "Rm" \| \( t \) lt.eq C Q^(3 \/ 2) . $
  This estimate requires no initial derivative or injectivity-radius bound;
    one may use the local formulation in #cite(label("MorganTian")) Theorem 3.27 with the entire closed manifold
    as its domain.
  Let $x$ realize the curvature maximum. Choose a fixed $c in \( 0 \, 1 \]$ small enough that on
    $B_(g_j \( t \)) \( x \, c Q^(- 1 \/ 2) \)$ the derivative estimate implies $u gt.eq 3 Q \/ 4$.
    Since $Q gt.eq 4 K \( t \)$, we have $w gt.eq Q \/ 2$ there. Also $Q gt.eq 1$, so this radius is at most $1$.
    Lemma 8 now gives
  $ integral_M w \( t \)^2 thin d mu gt.eq Q^2 / 4 thin v_(*) c^4 Q^(- 2) = frac(v_(*) c^4, 4) . $
  This contradicts the uniform convergence of the tail norm to zero in Proposition 7.
    Thus, for large $j$, no crossing occurs, and (3.11) holds throughout existing times below $T$.
  If $cal(T)_j lt.eq T$, the same bound controls curvature on $\[ cal(T)_j \/ 2 \, cal(T)_j \)$.
    Curvature is already bounded on the earlier compact interval by smoothness of the individual flow.
    The curvature continuation criterion contradicts maximality. Hence $cal(T)_j > T$. ◻
]

== 4 The Einstein and sectional-curvature defects <sec:defects>

The common interval now permits compactness at positive times.
  To identify the eventual limit, we must retain information from time zero:
  the Einstein error tends to zero, and the integral negative sectional curvature remains of order $t$.

#thm([Proposition 4.1.])[
  #emph[Set $lambda \( t \) = 3 \/ \( 1 - 6 t \)$. Along the flows above,
#[#set math.equation(numbering: n => "(4.1)")
 $ sup_(0 lt.eq t < T) ∥"Ric"_(g_j \( t \)) - lambda \( t \) g_j \( t \)∥_(L^2 \( g_j \( t \) \)) arrow.r
   0 . $ <eq:einstein-defect>]

]
] <prop:einstein-defect>

#proof[
  Write $L = "Ric" - lambda g$. In moving orthonormal frames, define the curvature action on a symmetric tensor $B$ by
  $ \( "Rm" \( B \) \)_(i j) = sum_(k \, l) R_(i k j l) B_(k l) \; wide "Rm" \( g \) = "Ric" . $
  The Ricci evolution in these frames is
  $ partial_t "Ric" = Delta "Ric" + 2 "Rm" \( "Ric" \) . $
  The frame motion cancels the $- 2 "Ric"^2$ term in the fixed-frame formula;
    the components of $g$ in the moving frames are constant. Since $lambda' = 2 lambda^2$, subtraction yields
  #[#set math.equation(numbering: n => "(4.2)")
   $ partial_t L = Delta L + 2 "Rm" \( L \) + 2 lambda L . $ <eq:L-flow>]
  Using $R gt.eq 0$, $\| "Rm" \| lt.eq K + w$, and boundedness of $K$ and $lambda$ on $\[ 0 \, T \]$, we obtain
  $ frac(d, d t) integral_M \| L \|^2 thin d mu lt.eq - 2 integral_M \| nabla L \|^2 thin d mu +
    C integral_M \( 1 + w \) \| L \|^2 thin d mu . $
  By Hölder, (3.8), and Kato’s inequality,
  $ integral_M w \| L \|^2 thin d mu lt.eq ∥∥ w_2 ∥\| L \|∥_4^2 lt.eq
    S_2 ∥∥ w_2 integral_M \( \| nabla L \|^2 + \| L \|^2 \) thin d mu . $
  The coefficient tends to zero uniformly in time, by (3.8).
    Absorb the gradient term for large $j$ and apply Gronwall’s inequality.
    The initial norm tends to zero by (2.6), proving (4.1). ◻
]

We next measure failure of nonnegative sectional curvature by a scalar function of the curvature tensor.
  On the Euclidean space of algebraic curvature tensors on $bb(R)^4$, define

#[#set math.equation(numbering: n => "(4.3)")
 $ F \( B \) = max {0 \, sup_(\| X \| = \| Y \| = 1\
chevron.l X \, Y chevron.r = 0) - B \( X \, Y \, X \, Y \)} . $ <eq:F-definition>]

Thus $F \( "Rm" \)$ is the magnitude of the most negative sectional curvature,
  or zero if all sectional curvatures are nonnegative.

#thm([Proposition 4.2.])[
  #emph[There is a uniform constant $C$ such that
#[#set math.equation(numbering: n => "(4.4)")
 $ integral_(M_j) F \( "Rm"_(g_j \( t \)) \) thin d mu_(g_j \( t \)) lt.eq C t \, wide 0 lt.eq
   t < T . $ <eq:sectional-defect>]

]
] <prop:sectional-defect>

#proof[
  The function $F$ is nonnegative, convex, orthogonally invariant, and Lipschitz:
    it is a supremum of a bounded family of linear functionals and the zero function.
    Let $F_delta$ be its convolution with a nonnegative smooth radial mollifier supported in a ball of radius
    $delta$ in the algebraic-curvature tensor space. Then $F_delta$ is smooth, nonnegative, convex,
    and orthogonally invariant, with
  $ \| D F_delta \| lt.eq C \, wide \| F_delta - F \| lt.eq C delta . $
  Orthogonal invariance makes this construction independent of the orthonormal frame and compatible with the
    metric connection.
  Apply the chain rule to (3.5) in moving orthonormal frames. Convexity gives a favorable Hessian term:
  $ \( partial_t - Delta \) F_delta \( "Rm" \) & = D F_delta \( "Rm" \) \[ cal(Q) \( "Rm" \) \] -
    sum_a D^2 F_delta \( "Rm" \) \[ nabla_a "Rm" \, nabla_a "Rm" \]\
 & lt.eq C \| "Rm" \|^2 . $
  After integration, the volume variation contributes $- integral R F_delta \( "Rm" \) thin d mu lt.eq 0$.
    Closedness and (3.8) therefore imply
  $ integral_M F_delta \( "Rm" \( t \) \) thin d mu lt.eq integral_M F_delta \( "Rm" \( 0 \) \) thin d mu_(g_j) +
    C t lt.eq C delta V_0 + C t . $
  The last step uses $F \( "Rm" \( 0 \) \) = 0$. Letting $delta arrow.b 0$ proves (4.4). ◻
]

== 5 The compact Einstein limit and the gap <sec:limit>

We first extract the geometric conclusion that does not use Classification Assumption 1.

#thm([Proposition 5.1.])[
  #emph[For any sequence (2.1), normalize the metrics as in Proposition 3 and discard finitely many terms.
    There are a subsequence, a connected simply connected closed smooth four-manifold $N$, a metric $h$ on $N$,
    and diffeomorphisms $Phi_j : N arrow.r M_j$ such that
$ "Ric"_h = 3 h \, wide sec_h gt.eq 0 \, $

 and
#[#set math.equation(numbering: n => "(5.1)")
 $ Phi_j^(*) g_j \( t \) arrow.r \( 1 - 6 t \) h $ <eq:flow-limit>]

 smoothly on $N times I$ for every compact interval $I subset \( 0 \, T \)$.]
] <prop:limit>

#proof[
  Fix $t_(*) = T \/ 2$. By (3.11), the flows have uniform global curvature bounds on every compact time interval
    in $\( 0 \, T \)$. At $t_(*)$, the local volume lower bound (3.10) and the total volume upper bound $V_0$ also
    give a diameter bound. Indeed, points spaced a fixed distance apart along a minimizing geodesic have pairwise
    disjoint balls of a fixed smaller radius; each such ball has uniformly positive volume.
    Their number is bounded by $V_0$. Write the resulting bound as $"diam" \( M_j \, g_j \( t_(*) \) \) lt.eq D_(*)$.
  Absolute sectional curvature bounds and the ball-volume lower bound give a uniform positive injectivity radius
    at $t_(*)$, by the injectivity radius estimate of Cheeger–Gromov–Taylor #cite(label("CheegerGromovTaylor"))
    Theorem 4.7. Hamilton’s compactness theorem #cite(label("HamiltonCompactness")) now gives,
    after passing to a subsequence, smooth pointed convergence to a connected Ricci flow $\( N \, h \( t \) \)$ on
    $\( 0 \, T \)$, with $h \( t_(*) \)$ complete. One can apply the theorem on nested compact time intervals
    containing $t_(*)$ and take a diagonal subsequence. The curvature bounds used here are global in space;
    hence the complete limit version of compactness applies, without the completeness issue that can arise from
    purely local bounds #cite(label("ToppingCompactness")) Theorem 1.1 and subsequent discussion.
    The convergence maps are time-independent embeddings defined on an exhaustion of $N$.
  We explain why the limit is compact and the embeddings are eventually diffeomorphisms.
    If the complete connected slice $\( N \, h \( t_(*) \) \)$ were noncompact,
    it would contain a compact closed ball $overline(B) \( p \, L \)$ with a point $q$ at distance $L$,
    for any $L > 0$. Choose $L > 2 D_(*)$. For large $j$, a convergence embedding is defined on a neighborhood of
    this ball, and its pulled-back metric bounds lengths on the ball from below by half their $h \( t_(*) \)$
    values. Any curve in $M_j$ joining the images of $p$ and $q$ must have length at least $L \/ 2$:
    if it leaves the image of the ball, its initial portion must first reach that image’s boundary and already has
    this length. If it stays inside, the same bound follows by pullback. This contradicts the diameter bound.
    Thus $N$ is compact. Eventually the convergence embeddings are defined on all of $N$; their images are open,
    by the inverse function theorem, and closed, by compactness.
    Since $M_j$ is connected, each is a diffeomorphism. It follows also that $N$ is simply connected.
  Smooth convergence on this compact manifold and (4.1) give
  $ "Ric"_(h \( t \)) = lambda \( t \) h \( t \) \, wide 0 < t < T . $
  The Ricci-flow equation therefore integrates to
  $ h \( t \) = \( 1 - 6 t \) h \, wide h = frac(1, 1 - 6 t_(*)) h \( t_(*) \) \, wide "Ric"_h = 3 h . $
  For each fixed $t > 0$, (4.4) also passes to the limit. The function $F$ is positively homogeneous of degree
    one. Under metric scaling by a positive constant $c$, its value on curvature scales by $c^(- 1)$ and the
    four-dimensional volume form scales by $c^2$. Consequently
  #[#set math.equation(numbering: n => "(5.2)")
   $ \( 1 - 6 t \) integral_N F \( "Rm"_h \) thin d mu_h lt.eq C t \, wide 0 < t < T . $ <eq:final-scaling>]
  Let $t arrow.b 0$. The nonnegative continuous integrand must vanish, so $sec_h gt.eq 0$.
    This proves the proposition. ◻
]

#proof[
  If no universal positive gap existed, then for every positive integer $j$ there would be a connected simply
    connected closed four-manifold $\( M_j \, g_j \)$ with $sec_(g_j) gt.eq 0$ and $cal(D) \( g_j \) < 1 \/ j$,
    whose smooth manifold is outside the three stated diffeomorphism types.
    Proposition 12 gives a subsequence diffeomorphic to a closed simply connected $\( N \, h \)$ with $"Ric"_h =
    3 h$ and $sec_h gt.eq 0$. Classification Assumption 1 applies exactly to this metric.
    Since $N$ is already simply connected, it is one of the three model manifolds, a contradiction. ◻
]

#prodef([Remark 5.2.])[
  Proposition 12 is independent of the classification input.
    It asserts smooth convergence only after positive-time regularization.
    In particular, the recovery of $sec_h gt.eq 0$ in (5.2) requires neither convergence of the original metrics
    at time zero nor preservation of nonnegative sectional curvature by Ricci flow.
]

#bibliography("refs.bib", style: "ieee", title: [References])
