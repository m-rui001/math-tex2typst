#set page(paper: "us-letter", margin: (x: 82.2pt, y: 82.2pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Minimal metrics and interior injectivity \
for nef adjoints]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Introduction <sec:introduction>

A nef line bundle admits smooth metrics whose curvatures approach semipositivity.
  A limit of those metrics may acquire singularities. For an adjoint bundle,
  the question is whether the canonical and boundary terms prevent logarithmic poles in a least singular
  semipositive metric. We prove that they do for projective klt pairs,
  and use zero-Lelong endpoint metrics to establish an injectivity theorem in ordinary coherent cohomology.

We use the convention that a local metric weight $phi.alt$ gives squared norm $\| xi \|^2 e^(- phi.alt)$.
  Semipositivity means that its curvature current $i partial macron(partial) phi.alt$ is nonnegative.
  Such a metric has #emph[minimal singularities] if every other semipositive weight $psi$ on the same line bundle
  satisfies $psi lt.eq phi.alt + C_psi$ for a constant $C_psi$.
  Weights on rational line bundles are defined by clearing denominators and dividing by the same positive integer.
  Lelong numbers measure the logarithmic singularities of these weights; in particular,
  zero Lelong numbers imply local integrability of $e^(- t phi.alt)$ for every fixed $t > 0$.

For a normal variety $H$ and an effective rational divisor $Theta$, the klt condition means that $K_H +
  Theta$ is $bb(Q)$-Cartier and, on a log resolution $pi : V arrow.r H$,
  the crossing divisor $B$ in $pi^(*) \( K_H + Theta \) = K_V + B$ has every coefficient less than one.
  The actual rational line bundle, rather than its numerical class, is the object in the following theorem.

#thm([Theorem 1.1.])[
  #emph[Let $\( H \, Theta \)$ be a normal connected projective complex klt pair,
    with $Theta$ an effective rational divisor. Suppose that $D_H = K_H + Theta$ is a nef $bb(Q)$-Cartier divisor.
    For every projective log resolution $pi : V arrow.r H$, the rational line bundle $N =
    pi^(*) D_H$ has the following property: every semipositive singular Hermitian metric with minimal
    singularities on $N$ has Lelong number zero at every point of $V$. Such a metric exists.
    Neither $K_H$ nor $Theta$ is required to be separately $bb(Q)$-Cartier.]
] <thm:adjoint-metric>

Consequently, for every minimal weight $phi.alt$ on $pi^(*) \( K_H + Theta \)$,

$ cal(I) \( t phi.alt \) = cal(O)_V wide \( t > 0 \) \, $

where $cal(I) \( t phi.alt \)$ consists of holomorphic germs $f$ for which $\| f \|^2
  e^(- t phi.alt)$ is locally integrable. We record the precise independence of the metric and the Cartier
  multiple in 6.

Demailly–Peternell–Schneider constructed minimal-singularity metrics on pseudoeffective line bundles and proved
  zero Lelong numbers in the big and nef case [2] Theorem 1.5 and Proposition 1.7.
  Nefness alone does not give this conclusion. For example, on a ruled surface over an elliptic curve,
  a nef divisor bundle can have its divisor metric as a minimal metric,
  with a positive Lelong number along the divisor [14] Corollary 1.2 and Example 3.5.
  Gongyo–Matsumura asked how to construct a zero-Lelong semipositive metric on a nef log canonical bundle in their
  study of injectivity and abundance [11] Question 5.6. 1 gives a positive answer in the projective klt setting on
  every projective log resolution, without bigness or nonvanishing.
  Once one zero-Lelong semipositive metric exists, every minimal metric is no more singular and therefore also has
  zero Lelong numbers. Thus the universal assertion about minimal metrics expresses the same existence conclusion
  on each pullback bundle.

=== 1.1 Interior boundaries and restriction of sections <interior-boundaries-and-restriction-of-sections>

Our second result concerns a family of effective rational divisors between two fixed endpoints.
  Their coefficients may cross integers. The resulting changes in the integral part of the divisor give natural
  inclusions of line bundles. Zero-Lelong metrics at the endpoints control the induced map on ordinary $H^1$.

#thm([Theorem 1.2.])[
  #emph[Let $V$ be a smooth projective complex variety, let $L$ be an integral divisor, and let $0 lt.eq C_0 lt.eq
    C_2$ be effective rational divisors whose combined support is simple normal crossing.
    Suppose that both rational line bundles $L - C_0$ and $L -
    C_2$ admit singular Hermitian metrics of semipositive curvature with zero Lelong numbers at every point.
    For a rational number $0 < lambda < 1$, set
$ C_1 = \( 1 - lambda \) C_0 + lambda C_2 \, wide L_i = L - ⌊C_i⌋ quad \( i = 0 \, 1 \) . $

 Then the natural inclusion of line bundles induces an injection
$ H^1 #scale(x: 120%, y: 120%)[\(] V \, cal(O)_V \( K_V + L_1 \) #scale(x: 120%, y: 120%)[\)] arrow.r
  H^1 #scale(x: 120%, y: 120%)[\(] V \, cal(O)_V \( K_V + L_0 \) #scale(x: 120%, y: 120%)[\)] . $

]
] <thm:interior-injectivity>

The strict inequality $lambda < 1$ provides a positive coefficient in the curvature comparison.
  Effectivity and the common crossing support provide integrability for the fractional boundary weights.
  The theorem concerns the displayed integral line bundles and the natural sheaf map;
  its endpoint assumptions are on the actual rational bundles $L - C_i$.

One direct consequence explains the connection with restriction of sections.
  Put $E = floor.l C_1 floor.r - floor.l C_0 floor.r$, an effective integral divisor, which may be nonreduced.
  If $E eq.not 0$, then

#[#set math.equation(numbering: n => "(1.1)")
 $ H^0 #scale(x: 120%, y: 120%)[\(] V \, cal(O)_V \( K_V + L_0 \) #scale(x: 120%, y: 120%)[\)] arrow.r
   H^0 #scale(x: 120%, y: 120%)[\(] E \, cal(O)_V \( K_V + L_0 \) \|_E #scale(x: 120%, y: 120%)[\)] quad
   upright("is surjective") . $ <eq:restriction-surjective>]

Indeed, the connecting homomorphism for $0 arrow.r cal(O)_V \( K_V + L_1 \) arrow.r
  cal(O)_V \( K_V + L_0 \) arrow.r cal(O)_V \( K_V + L_0 \) \|_E arrow.r
  0$ has image equal to the kernel of the injective $H^1$ map.
  Thus the comparison lifts sections from the entire divisor scheme $E$ at once.

Classical root-cover injectivity, including a reduced boundary, appears in Esnault–Viehweg [7] Theorem 5.1.
  Fujino’s transcendental approach develops complete metrics on an analytic complement and comparison with
  coherent cohomology [10] Section 3, Lemmas 3.1–3.2 and Claim 1.
  Matsumura extends analytic injectivity to metrics with transcendental singularities and obtains uniform
  estimates for primitives [19] Theorem 1.3 and Sections 5.2–5.3.
  Our proof uses the same harmonic-form and local-primitive methods, with a comparison of two endpoint weights.
  We prove the required uniform primitive estimate and the return to ordinary cohomology explicitly.

=== 1.2 The two analytic arguments <the-two-analytic-arguments>

For the metric theorem, write $N = pi^(*) \( K_H + Theta \) = K_V + B$. The adjoint hypothesis enters twice.
  The klt coefficients make the adjoint density integrable, even where $B$ has negative exceptional coefficients.
  Klt vanishing and nefness then give one ample bundle $A_H$ on $H$ whose pullback $A = pi^(*) A_H$ makes $m N +
  A$ globally generated for every positive integer $m$ with $m \( K_H + Theta \)$ Cartier.
  Normalize a section $s$ by its integral

$ Q_m \( s \) = integral_V \| s \|^(2 \/ m) e^(- a \/ m - b) \, $

where $a$ is a smooth weight of $A$ and $b$ the divisor weight of $B$.
  Choose a normalized section maximizing its value at a proposed positive-Lelong point.

The $L^(2 \/ m)$ normalization has its origin in Narasimhan–Simha’s work on ample canonical bundles [20];
  its role in the later envelope construction is explained in [1] Section 5.
  Tsuji constructs canonical singular metrics using normalized sections of $A +
  m K_X$ with a fixed sufficiently ample twist [22] Sections 1.2 and 2.
  Berman–Demailly develop integral-normalized adjoint envelopes and their algebraic approximation [1]
  Definition 5.3 and Proposition 5.19. Their general pseudoeffective approximation allows twists $p_m A$ with $p_m
  arrow.r oo$ and $p_m \/ m arrow.r 0$ [1] Equation (5.24).
  Here the fixed twist and the klt density support an extremal argument:
  a localization estimate produces a better normalized section whenever the minimal weight has a positive Lelong number.

The normalized extremal sections have a semipositive limit after the twist is divided by $m$.
  Minimality bounds that limit by the chosen minimal weight.
  Consequently a fixed sublevel set of the difference of the weights has adjoint mass tending to zero.
  A localized $macron(partial)$ equation, solved on an affine open set,
  produces a holomorphic competitor whose weighted norm is bounded by that mass.
  The exact localization constant is independent of $m$ and of the affine open set.
  Positive Lelong number forces this competitor to have the same value at the chosen point.
  A Hölder estimate whose final bound is independent of $m$ makes its normalization strictly smaller,
  contradicting extremality.

Two details keep the construction uniform and valid on a log resolution.
  The weak limits in the localization lemma are taken in fixed weighted Hilbert spaces.
  Extension across negative exceptional coefficients is performed on the normal base $H$ in the actual Cartier
  bundle $m \( K_H + Theta \) + A_H$, and then pulled back.
  The complete Kähler $L^2$ estimate supplies the local analytic solution [4] Theorem 5.1;
  the localization and extension arguments are given in 2.

For injectivity, regularize both endpoint metrics, retaining arbitrarily small curvature loss and uniform
  integrability at every fixed exponent. A logarithm of a sum of endpoint weights makes the inclusion of line
  bundles a contraction. On the complement of the crossing divisor,
  a complete Kähler metric with bounded local potentials allows local $L^2$ solutions.
  Their holomorphic differences extend across the divisor and define ordinary Čech classes.
  An open-mapping argument on one fixed finite cover gives a uniform bound for primitives of forms whose ordinary
  class vanishes.

A Bochner comparison then makes the image of a harmonic representative small.
  All approximating representatives embed into a single fixed Hilbert space;
  weak convergence there preserves the original ordinary cohomology class.
  This is the final step from weighted estimates on the complement to the coherent-cohomology injection.
  The argument is independent of the adjoint metric theorem: it uses only the endpoint metrics stated in 2.

=== 1.3 A fourfold application and organization <a-fourfold-application-and-organization>

The metric theorem also gives a short abundance argument for a projective complex klt fourfold $\( X \, Delta \)$
  with nef rational adjoint and $chi \( X \, cal(O)_X \) eq.not 0$.
  Lazić–Peternell’s nonvanishing theorem uses generalized algebraic singularities of a semipositive metric [17]
  Corollary D; zero Lelong numbers satisfy that condition with no divisorial part.
  With a first section obtained, Gongyo–Matsumura’s criterion gives semiampleness [11] Corollary 5.3.
  The precise application is 10; it has no numerical-dimension restriction.
  For nef adjoints of numerical dimension at most one, Liu–Xu already obtain good minimal models for projective
  klt pairs of dimension at most four with nonzero Euler characteristic [18] Corollary 5.2;
  in the nef case this gives semiampleness. Lazić’s work supplies a semiampleness criterion using uniform
  multiplier-ideal comparisons, and an algebraic approximation theorem for supercanonical currents,
  under their respective hypotheses [16] Theorems A–B.

In the compact Kähler setting, Höring–Lazić–Lehn obtain nonvanishing for non-uniruled $bb(Q)$-factorial klt pairs
  with nef adjoint of numerical dimension one and nonzero Euler characteristic [13] Theorem A.
  Under these hypotheses in dimension four, they obtain semiampleness when the minimal pullback current has zero
  Lelong numbers [13] Corollary B.

2 proves the metric theorem, the arbitrary-data localization estimate and the multiplier-ideal consequence.
  3 proves the independent interior injectivity theorem. 4 states the two published fourfold criteria and applies
  them to the same minimal metric.

== 2 Zero Lelong numbers for nef klt adjoints <sec:adjoint-metrics>

We prove 1. The construction uses sections only after one fixed twist pulled back from an ample bundle on the
  normal base. Its central estimate must reduce a normalized section’s mass without changing its value at a point
  of positive Lelong number. We first recall the top-degree $L^2$ estimate,
  then construct the normalized extremal sections. The affine localization lemma turns their small sublevel mass
  into the required competitor.

=== 2.1 Weights and the complete $L^2$ estimate <weights-and-the-complete-l2-estimate>

A local weight $phi$ of a Hermitian metric gives the squared norm $\| xi \|^2 e^(- phi)$ in its local frame.
  Semipositive curvature means that the local weights are plurisubharmonic.
  A metric on a rational line bundle is defined by taking a positive integral tensor power and dividing its
  weights by that integer. All identifications below are identifications of rational line bundles,
  rather than of numerical classes.

If a weight $eta$ is a weight on $K_V$, the expression $e^eta$ denotes a density:
  in a canonical coordinate frame it is multiplied by the corresponding coordinate volume.
  Likewise, for an $F$-valued top form $v$, the expression $\| v \|^2 e^(- psi)$, with $psi$ a weight on $F$,
  denotes a density. These densities are invariant under changes of coordinates and frames.
  In particular, the integral of the latter does not depend on an auxiliary Kähler metric.

We shall use the following form of the complete $L^2$ theorem.
  The matrix observation in its statement will be responsible for the uniform constants.

#thm([Lemma 2.1.])[
  #emph[Let $\( M \, omega_M \)$ be a complete Kähler manifold of dimension $n$,
    and let $F$ be a holomorphic line bundle with a smooth Hermitian metric of local weight $psi$ and strictly
    positive curvature $theta$. Write $Lambda_(omega_M)$ for the adjoint of wedging with $omega_M$.
    If $beta$ is an $F$-valued, $macron(partial)$-closed $\( n \, 1 \)$ form which is square integrable and satisfies
$ I \( beta \) = integral_M ⟨\[ theta \, Lambda_(omega_M) \]^(- 1) beta \,
  beta⟩_(psi \, omega_M) thin d V_(omega_M) < oo \, $

 then there is an $F$-valued $\( n \, 0 \)$ form $v$ with
$ accent(partial v, ‾) = beta \, wide integral_M \| v \|^2 e^(- psi) lt.eq I \( beta \) . $

 In local coordinates, the inverse-curvature density in $I \( beta \)$ is the inverse Hermitian curvature matrix
   acting on the remaining $\( 0 \, 1 \)$ covector, multiplied by the coordinate top-form density.
   It is independent of the complete background metric. Consequently:]
  + #emph[if $theta gt.eq omega_0 > 0$, this density is bounded by the $\( n \, 1 \)$ norm density computed with
    $omega_0$;]
  + #emph[if $g$ is a smooth real function and $theta gt.eq a thin i partial g and
    accent(partial g, ‾)$ with $a > 0$, the inverse-curvature squared norm of $accent(partial g, ‾)$ is at most
    $a^(- 1)$.]
] <lem:top-degree-l2>

#proof[
  The existence statement is the complete Kähler $L^2$ theorem with positive curvature operator and finite
    inverse-curvature integral [4] Theorem 5.1, p. 33. It requires pointwise positivity and the displayed
    integral, not a uniform lower spectral bound relative to $omega_M$.
  For the density calculation, write a top-form-valued $\( 0 \, 1 \)$ form as $sum_j beta_j thin d z_1 and
    dots.h.c and d z_n and d macron(z)_j$. The determinant in the squared norm of the top form cancels the volume
    determinant. Diagonalizing the curvature relative to $omega_M$ shows that applying the inverse commutator
    leaves $sum_(j \, k) \( theta^(- 1) \)^(j macron(k)) beta_j
    overline(beta_k)$ against the coordinate volume and line weight.
    All formulas use the same standard normalization of forms and volume.
    Matrix order gives $theta^(- 1) lt.eq omega_0^(- 1)$ in (i).
    For (ii), conjugate the rank-one inequality $a thin partial g ⊗ overline(partial g) lt.eq
    theta$ by $theta^(- 1 \/ 2)$. ◻
]

=== 2.2 The fixed twist and normalization <the-fixed-twist-and-normalization>

The zero-dimensional case is immediate, so put $n = dim V > 0$ and fix a Kähler form $omega$ on $V$.
  Choose compatible canonical divisors and write

#[#set math.equation(numbering: n => "(2.1)")
 $ N = K_V + B . $ <eq:adjoint-boundary>]

The support of $B$ is simple normal crossing, every coefficient is strictly less than one,
  and the negative part $B^(-)$ is exceptional over $H$. The last assertion follows because the nonexceptional
  coefficients are those of the effective boundary $Theta$.

Let $b = \[ B \]$ be the divisor weight, a rational linear combination of logarithms of squared absolute values of
  local divisor equations. In crossing coordinates it has the form

$ b = sum_(j = 1)^a beta_j log \| z_j \|^2 + O \( 1 \) \, wide beta_j < 1 . $

Thus $e^(- b)$ is locally integrable. Negative coefficients cause no failure of this integrability statement.

Fix a very ample Cartier divisor $H_0$ on $H$, and set $A_H = \( n + 1 \) H_0$ and $A = pi^(*) A_H$.
  Give $A$ a smooth semipositive metric with weight $a$. For every positive integer $m$ for which $m
  D_H$ is Cartier, the line bundle $m D_H + A_H$ is globally generated. Indeed, for $1 lt.eq j lt.eq n$,

$ m D_H + A_H - j H_0 - \( K_H + Theta \) = \( m - 1 \) D_H + \( n + 1 - j \) H_0 $

is ample. Klt Kawamata–Viehweg vanishing, in the form of [9] Theorem 3.2,
  gives the cohomology vanishings for Castelnuovo–Mumford regularity.
  The global-generation conclusion of [15] Theorem 1.8.5(i) then applies.
  Pullback proves that $m N + A$ is globally generated as well.

Since $N$ is nef, it is pseudo-effective. Choose a semipositive metric $phi.alt$ on $N$ with minimal
  singularities. Such a metric is obtained as the upper envelope, relative to a smooth reference weight,
  of the normalized plurisubharmonic weights; see [2] Definition 1.4 and Theorem 1.5.
  Its defining property is that every other semipositive weight $psi$ on $N$ satisfies

#[#set math.equation(numbering: n => "(2.2)")
 $ psi lt.eq phi.alt + C_psi $ <eq:minimal-weight-comparison>]

for a constant $C_psi$. We shall show that $phi.alt$ has zero Lelong numbers.

Suppose, to the contrary, that its Lelong number at $p in V$ is positive. For each allowed $m$ define

#[#set math.equation(numbering: n => "(2.3)")
 $ Q_m \( s \) = integral_V \| s \|^(2 \/ m) e^(- a \/ m - b) \, wide
   s in H^0 \( V \, m N + A \) . $ <eq:extremal-gauge>]

The integrand is a canonical density by (2.1). The integral is finite, continuous in $s$,
  positive for $s eq.not 0$, and homogeneous of degree $2 \/ m$.
  These facts also show that $Q_m \( s \) = 1$ is a compact subset of the finite-dimensional section space:
  restrict $Q_m$ first to the unit sphere of any vector-space norm and use its positive minimum.
  Choose $s_m$ maximizing the absolute evaluation at $p$ on this compact set,
  using any fixed norm on the one-dimensional fiber for this $m$. Global generation implies

#[#set math.equation(numbering: n => "(2.4)")
 $ Q_m \( s_m \) = 1 \, wide s_m \( p \) eq.not 0 . $ <eq:extremal-value>]

Put $tau_m = m^(- 1) log \| s_m \|^2$, a weight on $N + A \/ m$.

#thm([Claim 2.2.])[
  #emph[After passage to an unbounded subsequence of allowed integers, the weights $tau_m -
    a \/ m$ are uniformly locally bounded above and converge locally in $L^1$ and almost everywhere to a
    semipositive weight $tau_oo$ on $N$. This compactness assertion holds for every sequence of sections with
    $Q_m \( s_m \) = 1$; it does not require their extremality at $p$.]
] <clm:extremal-compactness>

#proof[
  Choose a smooth reference weight $phi.alt_(upright("ref"))$ on $N$ and write $u_m = tau_m - a \/ m -
    phi.alt_(upright("ref"))$. These are global quasi-psh functions whose complex Hessians have one common lower
    bound $- C omega$ on the compact connected manifold $V$. Normalize them by subtracting $M_m = sup_V u_m$.
    The compactness theorem for sup-normalized quasi-psh functions [12] Proposition 2.7 gives,
    along a subsequence, local $L^1$ and almost-everywhere convergence of $u_m -
    M_m$ to a quasi-psh function $u_oo$ that is finite almost everywhere.
    In particular the normalized functions do not converge identically to $- oo$.
  The fixed density $e^(phi.alt_(upright("ref")) - b)$ is integrable.
    Since $u_m - M_m lt.eq 0$, dominated convergence gives
  $ J_m := integral_V e^(u_m - M_m) e^(phi.alt_(upright("ref")) - b) arrow.r J_oo :=
    integral_V e^(u_oo) e^(phi.alt_(upright("ref")) - b) in \( 0 \, oo \) . $
  The positivity uses finiteness of $u_oo$ almost everywhere, not a pointwise lower bound.
    The normalization in (2.4) says $e^(M_m) J_m = 1$. Thus $M_m$ converges to a finite real number,
    proving the asserted upper bounds and convergence without the sup normalization.
    Finally, $i partial macron(partial) \( tau_m - a \/ m \) gt.eq - m^(- 1) i partial accent(partial a, ‾)$;
    the error tends to zero. The limit weight is therefore semipositive. ◻
]

Define the globally scalar difference, almost everywhere,

$ g_m = phi.alt + a \/ m - tau_m . $

Its values on the zero divisor of $s_m$ may be assigned arbitrarily when taking integrals;
  that divisor has measure zero. By (2.2), $tau_oo lt.eq phi.alt + C_oo$. Choose once and for all $R > C_oo + 1$.
  The preceding convergence and domination imply

#[#set math.equation(numbering: n => "(2.5)")
 $ epsilon_m := integral_({ g_m < - R }) e^(tau_m - a \/ m - b) arrow.r 0 . $ <eq:extremal-tail>]

Indeed, the indicators tend to zero almost everywhere, because $phi.alt - tau_oo gt.eq -
  C_oo$ where both weights are finite; the densities have one integrable majorant on a fixed finite coordinate cover.

It is now enough to construct sections $w_m in H^0 \( V \, m N + A \)$ such that

$ w_m \( p \) = s_m \( p \) \, wide Q_m \( w_m \)^m lt.eq C_0 epsilon_m \, $

where $C_0$ is independent of $m$. For large $m$ this gives $Q_m \( w_m \) < 1$,
  so scalar normalization would produce a section of gauge one with larger absolute evaluation at $p$.
  We next construct these competitors and prove the two displayed properties.

=== 2.3 A singular weighted equation with a fixed constant <a-singular-weighted-equation-with-a-fixed-constant>

We will cut off $s_m$ on ${ g_m < - R }$ and correct the resulting $macron(partial)$ error.
  The weight for this equation must serve two purposes. Its singularity near $p$ must force the correction to
  vanish at $p$ after the holomorphic competitor has been extended.
  Its growth where $g_m$ is positive must also allow a uniform conversion from the quadratic estimate to $Q_m$.
  The first requirement determines its slope $c$ near $- oo$; a fixed upper slope bound $d$ will give the second.

Positive Lelong number gives local coordinates at $p$ and a sufficiently small fixed $alpha >
  0$ with $phi.alt \( z \) lt.eq alpha log \| z \|^2 + O \( 1 \)$.
  On a cone of positive angular measure on which all crossing coordinates have modulus comparable to $\| z \|$,
  the weight $e^(- c phi.alt - b)$ is bounded below by a positive constant times $\|
  z \|^(- 2 \( c alpha + sum beta_j \))$. Choose a fixed $c > 0$ large enough that $c alpha + sum beta_j gt.eq n$. Then

#[#set math.equation(numbering: n => "(2.6)")
 $ e^(- c phi.alt - b) quad upright("is not locally integrable at ") p . $ <eq:nonintegrable-weight>]

This choice is valid even if some $beta_j$ are negative.

Choose a smooth function $0 lt.eq chi lt.eq 1$ equal to one on $\( - oo \, - R - 1 \]$ and to zero on
  $\[ - R \, oo \)$. Choose a smooth convex increasing function $f$ which is affine of slope $c$ near $- oo$,
  has $f'' > 0$ on the closed transition interval $\[ - R - 1 \, - R \]$, and satisfies $c lt.eq f' lt.eq
  d$ for one fixed $d$. Such a function is obtained by prescribing a nonnegative compactly supported second
  derivative positive on that interval. In particular there is a fixed constant $C_f$ with

#[#set math.equation(numbering: n => "(2.7)")
 $ f \( t \) lt.eq d max \( 0 \, t \) + C_f wide \( t in bb(R) \) . $ <eq:convex-weight-bound>]

All of $R \, c \, chi \, f \, d \, C_f$ remain fixed as $m$ varies.

For a fixed $m$, choose a dense smooth affine open $U = U_m subset
  V$ avoiding the supports of $B$ and $"div" \( s_m \)$. This open set need not contain $p$.
  We will recover the value at $p$ only after extending the resulting holomorphic section to all of $V$.
  On $U$ the function $g = g_m$ is psh, since the weight $tau_m$ is locally pluriharmonic there and the metrics
  $phi.alt \, a$ are semipositive. Put

#[#set math.equation(numbering: n => "(2.8)")
 $ F_m = m N + A - K_V \, wide S = \( m - 1 \) tau_m + a \/ m + b . $ <eq:local-adjoint-weight>]

This is a smooth semipositive weight on $F_m \|_U$. Divisor weights and $tau_m$ are pluriharmonic on $U$,
  so its curvature is $m^(- 1) i partial accent(partial a, ‾)$. We regard $s_m$ as an $F_m$-valued top form.

#thm([Lemma 2.3.])[
  (Localization of top forms).  #emph[Let $U$ be a smooth connected affine complex variety of dimension $n gt.eq
    1$. Let $F$ be a holomorphic line bundle on $U$ with a smooth semipositive metric of weight $S$,
    let $g$ be a global plurisubharmonic function not identically $- oo$,
    and let $s$ be a holomorphic $F$-valued $\( n \, 0 \)$-form.
    Fix $R in bb(R)$, a smooth cutoff $0 lt.eq chi lt.eq 1$ equal to one for $t lt.eq - R -
    1$ and zero for $t gt.eq - R$, and a smooth convex function $f$ that is affine of positive slope $c$ near $-
    oo$, with $c lt.eq f' lt.eq d$ for some $d$ and $f'' > 0$ on $\[ - R - 1 \, - R \]$. If
$ M = integral_({ g < - R }) \| s \|^2 e^(- S) < oo \, $

 there is a measurable $F$-valued top form $u$ such that
#[#set math.equation(numbering: n => "(2.9)")
 $ accent(partial u, ‾) = macron(partial) \( chi \( g \) s \) \, wide
   integral_U \| u \|^2 e^(- S - f \( g \)) lt.eq C_(chi \, f) M \, $ <mm:eq:localization-estimate>]

 where the equation is distributional and
#[#set math.equation(numbering: n => "(2.10)")
 $ C_(chi \, f) = max_(\[ - R - 1 \, - R \]) frac(\| chi' \|^2 e^(- f), f'') . $ <mm:eq:localization-constant>]

 The constant is independent of $U \, F \, S \, g \, s$ and of the auxiliary complete Kähler metrics.
   At $g = - oo$ we set $chi \( g \) = 1$ and $f \( g \) = - oo$; that locus has measure zero.]
] <mm:lem:localization>

#proof[
  Embed $U$ as a closed complex submanifold of some $bb(C)^a$ and let $rho = \| z \|^2 \|_U$.
    The tubular-neighborhood theorem supplies a holomorphic retraction of a neighborhood onto $U$ [6];
    see also the formulation in [8] Theorem 3.1. Compose $g$ with the retraction.
    Radial convolution in that neighborhood, at radii decreasing to zero,
    gives smooth psh functions $g_j arrow.b g$ on common smaller domains.
    More precisely, choose increasing regular exhaustion values $a_j arrow.r oo$ and $Omega_j = { rho < a_j }$.
    Use one fixed nonnegative smooth radial averaging kernel of total mass one.
    The convolution radius at stage $j$ is at most $1 \/ j$, is small enough to work near $overline(Omega_j)$,
    and is smaller than all previous radii. Radial averages of a psh function are monotone in the radius,
    so these choices give monotonicity wherever two of the functions are defined. They also give $g_j gt.eq g$.
  Each $Omega_j$ has a complete Kähler metric dominating $i partial macron(partial) rho$,
    for example the metric with potential $rho - log \( a_j - rho \)$.
    For a decreasing positive sequence $delta_j arrow.r 0$, use the line weight
  $ P_j = S + f \( g_j \) + delta_j rho . $
  It is smooth near $overline(Omega_j)$, its curvature is strictly positive, and
  $ i partial accent(partial P, ‾)_j gt.eq f'' \( g_j \) i partial g_j and accent(partial g, ‾)_j . $
  The smooth closed datum $beta_j = chi' \( g_j \) accent(partial g, ‾)_j and
    s$ is square integrable for the complete metric. To see this even near the boundary of $Omega_j$,
    use the top-degree density calculation: enlarging the background metric decreases the $\( n \, 1 \)$ density,
    and all coefficients and line weights are smooth on a neighborhood of the relatively compact closure.
  By 3, the inverse-curvature integral is at most
  $ C integral_(Omega_j ∩ { g_j < - R }) \| s \|^2 e^(- S) lt.eq C integral_({ g < - R }) \| s \|^2 e^(- S) \,
    wide C = sup_(\[ - R - 1 \, - R \]) frac(\| chi' \|^2 e^(- f), f'') . $
  The nonnegative term $delta_j rho$ only decreases the integrand. The last integral is $M$ by definition.
    Thus we obtain solutions $u_j$ on $Omega_j$ with $integral_(Omega_j) \| u_j \|^2 e^(- P_j) lt.eq C M$.
    The background complete metrics have introduced no comparison factor.
  For completeness, the singular passage uses fixed Hilbert spaces.
    If $k lt.eq l$ are fixed and $j gt.eq l$, then on $Omega_k$ we have $P_j lt.eq P_l$, and hence
  $ integral_(Omega_k) \| u_j \|^2 e^(- P_l) lt.eq C M . $
  Take a diagonal weakly convergent subsequence in these countably many fixed earlier smooth weighted spaces.
    Their limits agree as distributions on overlaps, and define $u$ on $U$.
    Weak lower semicontinuity, then monotone convergence as $l arrow.r oo$, gives
  $ integral_(Omega_k) \| u \|^2 e^(- S - f \( g \)) lt.eq C M . $
  Exhausting $U$ proves the required global inequality. Finally $chi \( g_j \) s arrow.r
    chi \( g \) s$ locally in $L^2$ by bounded convergence, where $chi \( - oo \) = 1$.
    Thus the equations pass to distributions and give (2.9). ◻
]

We apply the lemma to the adjoint data already fixed on $U$. The exact density identity is

#[#set math.equation(numbering: n => "(2.11)")
 $ \| s_m \|^2 e^(- S) = e^(tau_m - a \/ m - b) \, $ <eq:normalized-top-density>]

so its sublevel mass is $M = epsilon_m$. Applying 5 with $F = F_m$, $g = g_m$, and $s =
  s_m$ gives an $F_m$-valued top form $u$ on $U$ with

#[#set math.equation(numbering: n => "(2.12)")
 $ accent(partial u, ‾) = macron(partial) \( chi \( g \) s_m \) \, wide
   integral_U \| u \|^2 e^(- S - f \( g \)) lt.eq C epsilon_m \, $ <eq:singular-cutoff-estimate>]

where $C = C_(chi \, f)$ is independent of $m$ and of $U$.

=== 2.4 Extension, evaluation, and the extremal contradiction <extension-evaluation-and-the-extremal-contradiction>

For $m > d + 1$ set

$ G = S + d max \( 0 \, g \) \, wide w_m = chi \( g \) s_m - u quad upright("on ") U . $

(2.12) shows that $w_m$ is holomorphic. Since $G gt.eq S$,
  the cutoff term has $G$-norm squared at most $epsilon_m$.
  Since $S + f \( g \) lt.eq G + C_f$, the $G$-norm squared of $u$ is at most $e^(C_f) C epsilon_m$. Therefore

#[#set math.equation(numbering: n => "(2.13)")
 $ integral_U \| w_m \|^2 e^(- G) lt.eq C' epsilon_m \, wide C' = 2 + 2 e^(C_f) C . $ <eq:competitor-norm>]

This constant is independent of $m$.

To extend the section, rewrite its weight as

#[#set math.equation(numbering: n => "(2.14)")
 $ G = b + a \/ m + \( m - 1 - d \) tau_m + d max { tau_m \, phi.alt + a \/ m } . $ <eq:extension-weight>]

It is locally bounded above away from $"Supp" B^(-)$: the coefficient $m - 1 - d$ is positive,
  the psh weights in the last two terms are locally bounded above,
  and $b$ has that property away from its negative components.
  Consequently (2.13) gives ordinary local $L^2$ bounds there.
  Holomorphic $L^2$ removal across analytic sets extends $w_m$ to $V \\ "Supp" B^(-)$.

There is an open $H^compose subset H$, with complement of codimension at least two,
  over which $pi$ is an isomorphism. It misses the image of $B^(-)$.
  The section just obtained descends on $H^compose$ to a section of the actual Cartier bundle
  $cal(O)_H \( m D_H + A_H \)$. Normality extends it across $H \\ H^compose$:
  after trivializing that line bundle, this is the Hartogs extension of regular holomorphic functions on a normal
  space. Pullback now gives a global section, again denoted $w_m$, of $m N + A$.
  By projectivity and GAGA it is an algebraic global section as well.
  It agrees with the constructed section on $U$ by the identity theorem.
  In particular (2.13) continues to concern the same section.
  No estimate across the negative exceptional divisor was needed for this extension.

Near $p$, the weight $tau_m$ is smooth by (2.4), whereas $g arrow.r - oo$.
  Thus $chi \( g \) = 1$ and $f \( g \) = c g + upright("constant")$ near $p$ on $U$, so

$ u = s_m - w_m \, wide S + f \( g \) = b + c phi.alt + O_m \( 1 \) . $

If $s_m \( p \) - w_m \( p \)$ were nonzero, its holomorphic coefficient would have a positive lower bound on a
  smaller neighborhood. The finite weighted integral in (2.12) would then contradict (2.6).
  Removing the analytic null set $V \\ U$ does not change this divergence.
  This also applies when $p$ lies on $B^(-)$, since both sections are now holomorphic at $p$. We conclude

#[#set math.equation(numbering: n => "(2.15)")
 $ w_m \( p \) = s_m \( p \) eq.not 0 . $ <eq:competitor-value>]

The bounded factor denoted $O_m \( 1 \)$ is used only to test integrability for a fixed $m$; it never enters (2.13).

It remains to convert that quadratic estimate to the original gauge. Hölder’s inequality gives

#[#set math.equation(numbering: n => "(2.16)")
 $ Q_m \( w_m \)^m lt.eq C' epsilon_m (integral_U e^(\( G - a - m b \) \/ \( m - 1 \)))^(m - 1) .
   $ <eq:gauge-holder-first>]

There is no unbounded factor hidden in the second integral. Put $eta = d \/ \( m - 1 \) in \( 0 \, 1 \)$.
  Direct expansion yields

#[#set math.equation(numbering: n => "(2.17)")
 $ frac(G - a - m b, m - 1) = \( 1 - eta \) \( tau_m - a \/ m - b \) +
   eta #scale(x: 120%, y: 120%)[\(] max { tau_m - a \/ m \, phi.alt } -
   b #scale(x: 120%, y: 120%)[\)] . $ <eq:canonical-density-mixture>]

Both exponentials on the right are canonical densities. The first has integral one;
  the second has integral at most $1 + I$, where

$ I = integral_V e^(phi.alt - b) < oo . $

Finiteness follows from local upper bounds for $phi.alt$ and local integrability of $e^(- b)$ on a fixed finite
  coordinate cover. Applying Hölder to (2.17) gives

$ (integral_U e^(\( G - a - m b \) \/ \( m - 1 \)))^(m - 1) lt.eq \( 1 + I \)^(eta \( m - 1 \)) = \( 1 + I \)^d . $

All integrals are unchanged by the omitted analytic null set. Together with (2.5), (2.16), this proves

$ Q_m \( w_m \)^m lt.eq C' epsilon_m \( 1 + I \)^d arrow.r 0 . $

For large $m$, therefore, $0 < Q_m \( w_m \) < 1$. Multiply $w_m$ by $Q_m \( w_m \)^(- m \/ 2) > 1$.
  The new section has gauge one and, by (2.15), strictly larger absolute evaluation than $s_m$.
  This contradicts the choice of $s_m$, regardless of the rate at which $s_m \( p \)$ or $epsilon_m$ tends to
  zero. Hence $phi.alt$ has no positive Lelong number at any point. This proves 1.

#thm([Corollary 2.4.])[
  #emph[Under the hypotheses of 1, let $phi.alt$ be a minimal weight on the actual rational line bundle $N$. Then
$ cal(I) \( t phi.alt \) = cal(O)_V wide upright("for every real ") t > 0 \, $

 where the ideal is defined by local integrability of $\| f \|^2 e^(- t phi.alt)$.
   The conclusion is independent of the choice of minimal metric and of the Cartier multiple used to normalize its
   weights.]
] <cor:minimal-multiplier>

#proof[
  Skoda’s integrability theorem gives local integrability of $e^(- t phi.alt)$ for every fixed $t >
    0$ when the Lelong numbers vanish [21] Proposition 7.1; for this formulation for arbitrary plurisubharmonic
    weights, see [5] Property 1.4(8) and [4] Lemma 5.6(a). Every holomorphic germ is bounded on a smaller
    neighborhood, so the multiplier ideal is the structure sheaf.
    Two metrics with minimal singularities have weights differing by a bounded function,
    directly from their defining comparison. Dividing the weight of a positive Cartier multiple by that multiple
    preserves the stated normalization. These observations prove the independence assertions. ◻
]

== 3 An interior injectivity theorem <sec:interior-injectivity>

We prove 2 from its two endpoint metrics, using the top-degree $L^2$ estimate in 3.
  The proof does not use 1 or its extremal-section construction.
  The output is the natural map on ordinary coherent cohomology.
  The proof therefore needs both a weighted estimate on the complement of the crossing divisor and a comparison
  that retains the original ordinary class. The fixed-cover construction below supplies this comparison together
  with a uniform bound for primitives.

For a class in the kernel, we will construct weighted harmonic representatives whose images have norms tending to
  zero. The endpoint metrics make multiplication a contraction and supply the curvature comparison for this
  estimate. Local solutions of the $macron(partial)$ equation leave holomorphic differences on overlaps;
  controlling a splitting of these differences on one fixed cover gives uniformly bounded global primitives.
  The extended differences form a cocycle representing the ordinary cohomology class of the original form.
  Finally, comparison in one fixed Hilbert space lets the small images force the original ordinary class to
  vanish. Classical injectivity for roots of divisors, including an additional reduced boundary,
  is proved in [7] Theorem 5.1. The local and uniform-primitive methods have precedents in [19] Sections 5.2–5.3;
  the precise comparison needed for the present line bundles is proved here.

=== 3.1 Endpoint regularization and the comparison weights <endpoint-regularization-and-the-comparison-weights>

Fix a Kähler form $omega$ on $V$, and put $n = dim V$. The zero-dimensional assertion is trivial,
  so assume $n > 0$. We use the following consequence of regularization and exponential integrability.

#thm([Lemma 3.1.])[
  #emph[Let $F$ be a rational line bundle on a smooth projective complex variety $V$ equipped with a Kähler form
    $omega$, and suppose that $F$ has a semipositive singular metric $psi$ having zero Lelong numbers everywhere.
    There are smooth weights $psi_k$ on $F$ and numbers $epsilon.alt_k arrow.b 0$ such that
$ i partial macron(partial) psi_k gt.eq - epsilon.alt_k omega . $

 In fixed local frames these weights are uniformly bounded above on relatively compact coordinate neighborhoods,
   and, for every fixed $b > 0$, their exponentials $e^(- b psi_k)$ have uniformly bounded local $L^1$ norms.]
] <lem:zero-lelong-regularization>

#proof[
  Choose a smooth reference metric on $F$. Apply the attenuation form of Demailly’s regularization theorem to the
    specified current $T = i partial macron(partial) psi$, using the global difference between $psi$ and the
    reference weight as its potential [3] Main Theorem 1.1. Fix a positive attenuation level $c$.
    Adding the reference weight back to the approximating potentials gives weights $psi_k$ on the same rational
    bundle, with $psi_k arrow.b psi$. They are smooth outside the Lelong level set $E_c \( T \) = { x :
    nu \( T \, x \) gt.eq c }$, which is empty. Their curvature lower bounds have the form $-
    min \( lambda_k \, c \) u - delta_k omega$, where $u$ is one fixed smooth nonnegative form, $delta_k arrow.r
    0$, and the continuous functions $lambda_k$ decrease to the Lelong-number function.
    That function is zero here. Dini’s theorem on the compact manifold gives $sup_V lambda_k arrow.r 0$,
    and $u lt.eq C omega$ gives the stated loss $epsilon.alt_k arrow.r 0$.
    Passing to a subsequence makes the losses decrease. Work first on a common integral tensor power of $F$ and
    divide all weights by that integer afterwards.
  On each fixed coordinate neighborhood the decreasing approximants satisfy $psi lt.eq psi_k lt.eq psi_1$.
    The upper bound is smooth on a slightly larger neighborhood,
    and hence is bounded on the chosen compact subset. For every fixed $b > 0$,
  $ e^(- b psi_k) lt.eq e^(- b psi) . $
  The right side is locally integrable by the zero-Lelong case of Skoda’s integrability criterion [21];
    see [5] Property 1.4(8) for the formulation for arbitrary plurisubharmonic weights.
    This proves the uniform fixed-exponent bounds directly. ◻
]

Apply the lemma simultaneously to $L - C_0$ and $L - C_2$, obtaining weights $psi_(0 \, k) \,
  psi_(2 \, k)$ with a common sequence $0 < epsilon.alt_k lt.eq 1$ tending to zero. Let

$ D = "Supp" \( C_0 + C_2 \)_(upright("red")) \, wide U = V \\ D . $

For a rational divisor $C$, write $\[ C \]$ for its divisor weight.
  The endpoint weights $psi_(i \, k)$ live on the rational bundles $L - C_i$.
  Adding $\[ C_i \]$ gives weights on $L$. We first raise the weight at the first endpoint above that at the
  second, so that the natural inclusion of the eventual integral bundles will be a contraction.
  The symbols $Phi_(i \, k)$ below are weights on $L$, whereas $h_(i \, k)$ are weights on $L_i = L -
  floor.l C_i floor.r$. On $U$ set

#[#set math.equation(numbering: n => "(3.1)")
 $ psi'_(0 \, k) & = log #scale(x: 120%, y: 120%)[\(] e^(psi_(0 \, k)) +
   e^(psi_(2 \, k) + \[ C_2 - C_0 \]) #scale(x: 120%, y: 120%)[\)] \,\
Phi_(0 \, k) & = psi'_(0 \, k) + \[ C_0 \] \, wide Phi_(2 \, k) = psi_(2 \, k) + \[ C_2 \] \, wide
  Phi_(1 \, k) = \( 1 - lambda \) Phi_(0 \, k) + lambda Phi_(2 \, k) \,\
h_(i \, k) & = Phi_(i \, k) - \[ ⌊C_i⌋ \] \, wide i = 0 \, 1 . $ <eq:logsum-endpoint>]

The two summands in (3.1) are weights on the same rational line bundle $L - C_0$,
  so the expression is intrinsically well-defined. The logarithm of a sum of exponentials preserves the common
  curvature lower bound: locally add a potential for $epsilon.alt_k
  omega$ to both summands and use the psh log-sum inequality. Moreover $psi'_(0 \, k) gt.eq psi_(0 \, k)$.
  Effectivity of $C_2 - C_0$ gives a uniform local upper bound for its divisor weight,
  so $psi'_(0 \, k)$ retains both the upper bounds and all the fixed-exponent integrability bounds of 7.

The weights $h_(i \, k)$ are smooth metrics on $L_i \|_U$.
  They have uniform local upper bounds in frames extending across $D$, and

#[#set math.equation(numbering: n => "(3.2)")
 $ sup_k integral_(B ∩ U) e^(- h_(i \, k)) thin d lambda_B < oo quad \( i = 0 \, 1 \) $ <eq:weight-integral-bounds>]

on every relatively compact coordinate neighborhood $B$, where $d lambda_B$ is coordinate volume.
  To verify the last assertion, write

$ h_(0 \, k) = psi'_(0 \, k) + \[ C_0 - ⌊C_0⌋ \] \, wide h_(1 \, k) = \( 1 - lambda \) psi'_(0 \, k) +
  lambda psi_(2 \, k) + \[ C_1 - ⌊C_1⌋ \] . $

Every coefficient of either fractional divisor lies in $\[ 0 \, 1 \)$.
  Choose one Hölder exponent $a > 1$ so close to one that its product with each of these finitely many
  coefficients is still less than one. The exponential of the fractional divisor weight is in $L^a$ by the
  crossing-coordinate integral. The conjugate Hölder exponent for the remaining weights is allowed by the
  fixed-exponent bounds; a second Hölder inequality handles the two summands in $h_(1 \, k)$.
  This proves (3.2) uniformly in $k$.

Let $E = ⌊C_1⌋ - ⌊C_0⌋ gt.eq 0$, and let $s : L_1 arrow.r L_0$ be multiplication by the canonical section of $E$.
  Since $Phi_(2 \, k) lt.eq Phi_(0 \, k)$, we have $Phi_(1 \, k) lt.eq Phi_(0 \, k)$ and

#[#set math.equation(numbering: n => "(3.3)")
 $ \| s \|^2 e^(h_(1 \, k) - h_(0 \, k)) = e^(Phi_(1 \, k) - Phi_(0 \, k)) lt.eq 1 . $ <eq:multiplication-contraction>]

Thus multiplication is a contraction on all form degrees for any one fixed background metric.
  On $U$ the curvatures are $theta_(i \, k) = i partial macron(partial) Phi_(i \, k)$;
  divisor weights contribute no curvature there.

=== 3.2 A complete metric with bounded local potentials <a-complete-metric-with-bounded-local-potentials>

The singular set must be removed to use smooth weighted harmonic forms.
  We choose the complete metric carefully so that local solvability still has a uniform comparison with the given
  weights. The bounded-potential construction follows the complete-metric method of [10] Lemma 3.1;
  we include the calculation because both bounded potentials and completeness are needed in the uniform primitive
  estimate.

#thm([Lemma 3.2.])[
  #emph[There is a complete Kähler metric $omega_c gt.eq omega$ on $U$ such that,
    on sufficiently small coordinate neighborhoods in $V$, it has potentials bounded even on approach to $D$.]
] <lem:bounded-potential-complete-metric>

#proof[
  If $D$ is empty, take $omega_c = omega$. Otherwise choose a smooth metric on $cal(O)_V \( D \)$ and scale it so
    that $t = log \| s_D \|_(upright("sm"))^2 < - e^2$ on $U$. Set $f_0 \( t \) = 1 \/ log \( - t \)$. For $x = - t$,
  $ f'_0 \( t \) = frac(1, x \( log x \)^2) \, wide f''_0 \( t \) = 1 /
    x^2 (frac(1, \( log x \)^2) + frac(2, \( log x \)^3)) . $
  In particular $f'_0$ is bounded and $f''_0 \( t \) gt.eq \( t log \( - t \) \)^(- 2)$.
    Off $D$ the form $i partial accent(partial t, ‾)$ is the negative of a fixed smooth curvature form,
    so it is bounded by a multiple of $omega$. For a sufficiently large fixed $M$ the form
  $ omega_c = M omega + i partial accent(partial f, ‾)_0 \( t \) $
  is positive and dominates both $omega$ and $i partial t and accent(partial t, ‾) \/ \( t log \( - t \) \)^2$.
  A path leaving every compact subset of $U$ approaches $D$, because $V$ is compact;
    along such an approach $t arrow.r - oo$. The displayed radial term bounds its length below by a positive
    constant times the total variation of $log log \( - t \)$, which diverges.
    Hence the metric is complete, including at crossings of components of $D$.
    Finally, if $omega = i partial macron(partial) rho$ on a small coordinate neighborhood, then $M rho +
    f_0 \( t \)$ is a local potential for $omega_c$. The smooth function $rho$ is bounded on a smaller relatively
    compact neighborhood, and $f_0 \( t \)$ is bounded and tends to zero at $D$. ◻
]

Fix this metric for the rest of the section. When $D eq.not diameter$, the function $r =
  log log \( - t \)$ is a smooth proper exhaustion of $U$ with bounded gradient in $omega_c$.
  If $zeta$ is a smooth function equal to one on $\( - oo \, 1 \]$ and zero on $\[ 2 \, oo \)$,
  then $zeta \( r \/ R \)$, as $R arrow.r oo$, gives compactly supported smooth cutoffs tending to one and with
  gradient $O \( R^(- 1) \)$. When $D$ is empty, the constant cutoff one suffices.

The curvature comparison following (3.1) becomes

#[#set math.equation(numbering: n => "(3.4)")
 $ theta_(1 \, k) + epsilon.alt_k omega_c gt.eq \( 1 - lambda \) \( theta_(0 \, k) + epsilon.alt_k omega_c \)
   gt.eq 0 \, $ <eq:curvature-interior-comparison>]

since $theta_(2 \, k) + epsilon.alt_k omega_c gt.eq 0$ as well.

=== 3.3 A fixed-cover primitive estimate and the ordinary class map <a-fixed-cover-primitive-estimate-and-the-ordinary-class-map>

Fix a holomorphic line bundle $F$ on $V$. The local $L^2$ theorem gives primitives on coordinate neighborhoods,
  but a global primitive requires their holomorphic differences on overlaps to split.
  We use one finite cover and its fixed spaces of holomorphic sections to make that splitting estimate uniform in
  the weights. The extended differences also define a class in the ordinary group $H^1 \( V \, K_V ⊗ F \)$.
  Thus the class map below has ordinary coherent cohomology as its target,
  and the primitive estimate shows that its kernel consists of actual weighted exact forms.
  This local-solutions and holomorphic-cocycle comparison follows the method of [10] Section 3,
  Claim 1 and Lemma 3.2. For a smooth metric $h$ on $F \|_U$,
  write $L_h^2 \( n \, q \)$ for the Hilbert space of $F$-valued $\( n \, q \)$ forms using $h$ and $omega_c$.
  The Dolbeault operator is its maximal distributional realization, and $Z_h^1 =
  ker \( macron(partial) : L_h^2 \( n \, 1 \) arrow.r L_h^2 \( n \, 2 \) \)$.

#thm([Proposition 3.3.])[
  #emph[Let $F$ be a fixed holomorphic line bundle on $V$, and let $h_k$ be smooth metric weights on $F \|_U$.
    Suppose that, for a fixed constant $A_0 gt.eq 0$,
$ i partial accent(partial h, ‾)_k gt.eq - A_0 omega_c \, $

 and that in local frames on $V$ the weights are uniformly bounded above and the functions $e^(- h_k)$ have
   uniformly bounded local integrals on punctured coordinate neighborhoods. Then:]
  + #emph[There is a continuous linear map
$ kappa_k : Z_(h_k)^1 arrow.r H^1 \( V \, K_V ⊗ F \) $

 agreeing with the ordinary Dolbeault class on smooth closed forms on $V$.
   It annihilates the closure in $L_(h_k)^2 \( n \, 1 \)$ of the image of $macron(partial) :
   L_(h_k)^2 \( n \, 0 \) arrow.r L_(h_k)^2 \( n \, 1 \)$.]
  + #emph[There is a constant $C$ independent of $k$ such that every $f in Z_(h_k)^1$ with $kappa_k \( f \) =
    0$ has a global primitive on $U$ satisfying
$ accent(partial v, ‾) = f \, wide parallel v parallel_(h_k) lt.eq C parallel f parallel_(h_k) . $

 No continuous linear choice of these global primitives is asserted.]
] <prop:uniform-primitives>

#proof[
  Choose a finite collection of coordinate and frame balls
  $ V_j subset.double U_j subset.double hat(U)_j $
  such that the $V_j$ still cover $V$ and $omega_c$ has a bounded local potential $rho_j$ on $hat(U)_j ∩ U$.
    These sets and potentials are independent of $k$.
  #emph[Local solutions.] On $U_j ∩ U$, replace the line weight by $h_k + \( A_0 + 1 \) rho_j$.
    Its curvature dominates $omega_c$, and the bounded potential compares its top-form norms with those of $h_k$
    by fixed constants. Equip $U_j ∩ U$ with the complete metric $omega_c + omega_(upright("ball"))$,
    where $omega_(upright("ball"))$ is a complete metric for the coordinate ball.
    This sum is complete at both the deleted divisor and the ball boundary.
    An $\( n \, 1 \)$ datum square integrable for $omega_c$ remains so for the larger background metric:
    its density uses the inverse background matrix on its one remaining covector.
    By 3, the inverse-curvature density for the modified weight is bounded by the original $omega_c$ datum
    density. The top-form solution density is independent of the auxiliary complete metric.
    Consequently there is a local solution operator $T_(j \, k)$ with
  #[#set math.equation(numbering: n => "(3.5)")
   $ accent(partial T, ‾)_(j \, k) f = f \, wide parallel T_(j \, k) f parallel_(h_k \, U_j ∩ U) lt.eq
     C_j parallel f parallel_(h_k \, U_j ∩ U) \, $ <eq:local-primitive-bound>]
  where $C_j$ is independent of $k$. For each fixed $k$, choose the solution of smallest norm in the modified
    metric. Orthogonal projection onto the complement of the holomorphic kernel makes this a linear continuous
    choice. The affine solution set is closed because the distributional operator is closed.
  #emph[Holomorphic cocycles.] Given $f in Z_(h_k)^1$, put $w_j = T_(j \, k) \( f \|_(U_j ∩ U) \)$.
    On $\( U_i ∩ U_j \) ∩ U$, the difference $w_j - w_i$ is holomorphic.
    Uniform upper bounds for $h_k$ turn (3.5) into ordinary local $L^2$ bounds in frames on $V$.
    Holomorphic $L^2$ removal therefore extends the differences uniquely across $D$.
    One can see the removal locally by Laurent expansion in the crossing coordinates and Fubini:
    a nonzero negative power is not square integrable. The extended differences $c_(i j) = w_j - w_i$,
    sections of $K_V ⊗ F$ on $U_i ∩ U_j$, form a holomorphic Čech cocycle.
  For later use, this family of cocycles is bounded in every fixed compact-convergence seminorm whenever $parallel
    f parallel_(h_k)$ is bounded, uniformly in $k$. Indeed, for any compact set in an overlap,
    choose a slightly larger compact neighborhood still in that overlap.
    The ordinary $L^2$ bound there and the holomorphic mean-value inequality bound the supremum on the smaller
    compact. Each such compact has positive separation from the ball boundaries.
    Its constant may depend on that compact, but not on $k$. No bound on the supremum over an entire open overlap
    is required.
  #emph[The ordinary class.] Let $cal(Z)^1$ be the Fréchet space of holomorphic cocycles on this finite cover,
    with compact-convergence topology. The cocycle equations make it a closed subspace of the finite product of
    overlap section spaces. Choose a smooth partition of unity $\( eta_i \)$ with $"Supp" eta_i subset.double
    U_i$. For a cocycle $c$ put $b_j = sum_i eta_i c_(i j)$ on $U_j$,
    extending each summand by zero outside its overlap. Then $b_j - b_i = c_(i j)$,
    so the forms $accent(partial b, ‾)_j$ agree and define a global smooth form $beta_c$.
    This defines the continuous linear map
  $ kappa : cal(Z)^1 arrow.r H^1 \( V \, K_V ⊗ F \) \, wide c mapsto \[ beta_c \] . $
  Continuity follows from the compact support of the partition and Cauchy estimates for derivatives on slightly
    larger compact sets; ordinary cohomology is finite-dimensional and Hausdorff on the compact manifold.
    Define $kappa_k \( f \) = kappa \( \( c_(i j) \) \)$. Changing the local primitives changes the cocycle by a
    holomorphic coboundary: the differences of two primitives extend by the same ordinary $L^2$ argument.
    The local solution estimates and the compact-seminorm estimates just proved make $kappa_k$ continuous and linear.
  If $f$ is smooth on $V$, choose smooth local primitives on the larger balls.
    On the smaller balls they have finite weighted norms, because their coefficients are bounded and the local
    integrals of $e^(- h_k)$ are finite. Comparison with these primitives shows that $kappa_k$ agrees with the
    ordinary Dolbeault class. If instead $f = accent(partial v, ‾)$ for a global weighted $L^2$ primitive on $U$,
    then $w_j - v$ is holomorphic on $U_j ∩ U$ and ordinary locally $L^2$.
    Its extension gives a holomorphic splitting of $c_(i j)$, so $kappa_k \( f \) = 0$.
    Continuity therefore annihilates the closure of the actual exact forms, as in (i).
  #emph[A uniformly bounded splitting.] Let $cal(C)^0 = product_j H^0 \( U_j \, K_V ⊗ F \)$,
    again with compact-convergence topology, and let $cal(B)^1$ be the image of its coboundary map $delta$ in
    $cal(Z)^1$. We need the equality
  #[#set math.equation(numbering: n => "(3.6)")
   $ cal(B)^1 = ker kappa . $ <eq:closed-coboundary-kernel>]
  The forward inclusion is immediate. For the reverse inclusion,
    construct smooth local cochains from a partition of unity for a cocycle in $ker kappa$.
    Their common $macron(partial)$ is a global smooth form with zero ordinary Dolbeault class.
    Subtract a global smooth primitive from every cochain. The resulting cochains are holomorphic and split the
    original cocycle. This proves (3.6) without any assumption that the coordinate cover is a Leray cover.
  It follows that $cal(B)^1$ is a closed Fréchet subspace. The continuous surjection $delta : cal(C)^0 arrow.r
    cal(B)^1$ is open. Prescribe only the single continuous seminorm
  $ q \( \( a_j \) \) = max_j sup_(overline(V_j)) \| a_j \| \, $
  where the norms are those of fixed smooth frames or a fixed smooth bundle metric.
    Openness says that the image of ${ q < 1 }$ contains a zero neighborhood of $cal(B)^1$ described by finitely
    many compact seminorms. The cocycles arising from all $k$ and all data of norm at most one are bounded in
    those seminorms. A single rescaling therefore gives, for every such cocycle in $cal(B)^1$,
    a splitting $\( a_j \)$ with $q \( \( a_j \) \) lt.eq C_(upright("split"))$ for a fixed
    $C_(upright("split"))$. This uses no assertion that a bounded subset has a lift bounded in every Fréchet seminorm.
  When $kappa_k \( f \) = 0$, choose this splitting and set $v = w_j - a_j$ on $U_j ∩ U$.
    The expressions agree on the full overlaps, and hence define a global primitive on $U$.
    Estimate its norm on the smaller $V_j$, which cover $V$. The local primitives are controlled by (3.5);
    the corrections are controlled by their supremum on $overline(V_j)$ and the uniform integral of $e^(- h_k)$
    there. Summing over the finite cover proves a uniform bound for unit-norm data. Scaling proves (ii). ◻
]

Both sequences $h_(0 \, k)$ and $h_(1 \, k)$ satisfy this proposition, by (3.2), (3.4).
  For each weight, parts (i) and (ii) give

$ ker kappa_k = "im" macron(partial) = overline("im" macron(partial)) quad upright("inside ") Z_(h_k)^1 . $

Indeed, part (i) kills the closure of the exact forms, while part (ii) provides a primitive for every form in the
  kernel. We will keep track of the closures explicitly when comparing different weighted spaces.
  The proposition also applies to a fixed smooth line metric from $V$:
  its curvature is bounded below by $- A_0 omega_c$ for some fixed $A_0$,
  and its local upper and integral bounds are automatic. This last observation will allow us to compare all
  approximation parameters in one Hilbert space.

=== 3.4 Harmonic representatives and the Bochner comparison <harmonic-representatives-and-the-bochner-comparison>

Take a class in the kernel of the map in 2, and represent it by a smooth closed $L_1$-valued $\( n \, 1 \)$ form
  $gamma$ on $V$. All norms in this subsection use $omega_c$; a subscript $i \,
  k$ indicates the line weight $h_(i \, k)$, and integrals of pointwise inner products use $d V_(omega_c)$.
  The norms $parallel gamma parallel_(1 \, k)$ are bounded uniformly.
  Indeed, enlarging $omega$ to $omega_c$ decreases the top-form-valued $\( 0 \, 1 \)$ density,
  and the coefficients of $gamma$ are bounded on a finite cover, where (3.2) applies.

In the maximal $L_(1 \, k)^2$ Dolbeault complex, the closure of the image of degree-zero forms lies in the closed
  kernel of the degree-one operator. Subtract its orthogonal projection from $gamma$, obtaining $u_k$. Thus

#[#set math.equation(numbering: n => "(3.7)")
 $ gamma - u_k in overline("im" macron(partial)) \, wide accent(partial u, ‾)_k = 0 \, wide
   macron(partial)_(1 \, k)^(*) u_k = 0 \, wide parallel u_k parallel_(1 \, k) lt.eq
   parallel gamma parallel_(1 \, k) . $ <eq:reduced-harmonic-representative>]

The adjoint assertion follows from orthogonality to the actual range; it does not require that range to be closed.
  Local elliptic regularity for the smooth weighted Dolbeault Laplacian on $U$ makes $u_k$ smooth there.

Write $Lambda = Lambda_(omega_c)$ and let $D'_(i \, k)$ be the $\( 1 \, 0 \)$ Chern derivative.
  In bidegree $\( n \, 1 \)$ put

$ A_(i \, k) = \[ theta_(i \, k) + epsilon.alt_k omega_c \, Lambda \] . $

These are pointwise nonnegative operators, and $A_(1 \, k) gt.eq \( 1 - lambda \) A_(0 \, k)$.
  The smooth compact-support Bochner–Kodaira identity is

#[#set math.equation(numbering: n => "(3.8)")
 $ parallel accent(partial v, ‾) parallel_(i \, k)^2 + parallel macron(partial)_(i \, k)^(*) v
   parallel_(i \, k)^2 = parallel D_(i \, k)^(' *) v parallel_(i \, k)^2 +
   integral_U chevron.l \[ theta_(i \, k) \, Lambda \] v \, v chevron.r_(i \, k) . $ <eq:bochner-top-degree>]

Here $D'_(i \, k) v = 0$ in top holomorphic degree, and $\[ omega_c \, Lambda \]$ is the identity in this
  bidegree. The same identity on complete manifolds, with the indicated domain interpretation and lower curvature
  bound, is discussed in [19] Proposition 2.4.

To justify its use without already knowing the extra terms are integrable,
  use the compactly supported smooth cutoffs constructed above,
  whose gradients tend uniformly to zero in $omega_c$. Apply (3.8) to the cutoff multiples of $u_k$ and add
  $epsilon.alt_k$ times their squared norms. The left-hand derivative terms tend to zero by (3.7) and the gradient
  bound. The two terms retained on the right are nonnegative, so lower semicontinuity gives

#[#set math.equation(numbering: n => "(3.9)")
 $ parallel D_(1 \, k)^(' *) u_k parallel_(1 \, k)^2 + integral_U chevron.l A_(1 \, k) u_k \,
   u_k chevron.r_(1 \, k) lt.eq epsilon.alt_k parallel u_k parallel_(1 \, k)^2 . $ <eq:source-bochner-energy>]

The commutators with the cutoffs contain only their derivatives;
  they do not introduce constants from derivatives of the varying line metrics.

The Kähler identity $D^(' *) = i \[ Lambda \, macron(partial) \]$ shows that this formal operator commutes with
  holomorphic multiplication by $s$. Combining (3.3), (3.4) with (3.9) therefore gives

#[#set math.equation(numbering: n => "(3.10)")
 $ parallel D_(0 \, k)^(' *) \( s u_k \) parallel_(0 \, k)^2 + integral_U chevron.l A_(0 \, k) s u_k \,
   s u_k chevron.r_(0 \, k) lt.eq C_lambda epsilon.alt_k parallel u_k parallel_(1 \, k)^2 .
   $ <eq:target-bochner-energy>]

For the curvature term one first uses $A_(1 \, k) gt.eq \( 1 - lambda \)
  A_(0 \, k)$ and then the line-norm contraction. One may take $C_lambda = \( 1 - lambda \)^(- 1)$:
  this factor bounds both the derivative term and the curvature term in the source energy.
  The strict interior hypothesis keeps this comparison factor finite.

We also need the target $macron(partial)$ adjoint. The form $s u_k$ is smooth, closed, and square integrable.
  Apply the compact-support identity to cutoff multiples of this form.
  On its right-hand side use (3.10), replace the curvature commutator by the larger nonnegative $A_(0 \, k)$,
  and let the gradient errors tend to zero. It follows that the formal adjoint is square integrable and

#[#set math.equation(numbering: n => "(3.11)")
 $ parallel macron(partial)_(0 \, k)^(*) \( s u_k \) parallel_(0 \, k) lt.eq
   C sqrt(epsilon.alt_k) . $ <eq:small-target-adjoint>]

This also verifies the Hilbert-adjoint domain condition. In detail,
  complete-metric cutoffs and local smooth approximation give density in the maximal graph norm,
  so integration by parts against compactly supported forms extends to that domain.
  The formal adjoint, now known to be $L^2$, is its Hilbert adjoint.
  Thus (3.11) has not assumed the existence of a global primitive or an adjoint-domain statement in advance.

We have shown that the image of the harmonic representative has a small adjoint norm.
  The fixed-cover proposition supplies a uniformly bounded primitive for this image;
  pairing these two statements will make its entire target norm tend to zero.

=== 3.5 From a small image to vanishing of the ordinary class <from-a-small-image-to-vanishing-of-the-ordinary-class>

Multiplication by $s$ is bounded in degrees zero and one and commutes with the distributional Dolbeault operator.
  Hence (3.7) implies that $s gamma - s u_k$ is in the target closure of the actual exact forms.
  Apply the target class map in 9. It annihilates that closure and agrees with ordinary cohomology on $s gamma$.
  The latter class is zero by the choice of $gamma$. Consequently $kappa_(0 \, k) \( s u_k \) = 0$.

The norms of $s u_k$ are uniformly bounded by (3.3), (3.7). Part (ii) of 9 gives global forms $v_k$ on $U$ with

$ accent(partial v, ‾)_k = s u_k \, wide sup_k parallel v_k parallel_(0 \, k) < oo . $

The adjoint-domain conclusion above now justifies

#[#set math.equation(numbering: n => "(3.12)")
 $ parallel s u_k parallel_(0 \, k)^2 = chevron.l accent(partial v, ‾)_k \, s u_k chevron.r_(0 \, k) =
   chevron.l v_k \, macron(partial)_(0 \, k)^(*) \( s u_k \) chevron.r_(0 \, k) arrow.r 0 . $ <eq:small-target-form>]

To retain the original class while passing to a limit, fix a smooth metric on $L_1$ over all of $V$,
  with local weight $h_(*)$ and use the same complete background $omega_c$ on $U$.
  Uniform upper bounds in a finite framed cover give the global metric comparison

#[#set math.equation(numbering: n => "(3.13)")
 $ h_(1 \, k) lt.eq h_(*) + C_(*) \, wide e^(- h_(*)) lt.eq
   e^(C_(*)) e^(- h_(1 \, k)) . $ <eq:fixed-hilbert-comparison>]

It gives one bounded inclusion from each varying weighted space into the fixed space,
  in both degrees zero and one. In particular the $u_k$ have uniformly bounded fixed norms.

On any compact subset $K subset U$ the multiplier $s$ is nowhere zero,
  and the target weights $h_(0 \, k)$ have uniform upper bounds.
  Thus (3.12) implies that $u_k arrow.r 0$ in the fixed $L^2$ norm on $K$.
  This local strong convergence and the global bound imply global weak convergence to zero.
  Indeed, approximate any fixed $L^2$ test form by one supported in a compact subset of $U$;
  its pairing tends to zero by local convergence, and the norm of the remaining tail controls its pairing
  uniformly in $k$. Concentration of norm near $D$ does not affect this weak convergence.

For each $k$, choose actual exact forms $accent(partial z, ‾)_(k \, l)$ converging to $gamma - u_k$ in (3.7).
  By (3.13), their primitives belong to the fixed degree-zero space and their derivatives converge in the fixed
  degree-one norm. Therefore $gamma - u_k$ belongs to the fixed closure of actual exact forms.
  Apply 9 once more, now to the fixed smooth metric with weight $h_(*)$.
  Its continuous class map $kappa_(*)$ annihilates that fixed closure, so

$ kappa_(*) \( u_k \) = kappa_(*) \( gamma \) = \[ gamma \] quad upright("for every ") k . $

The fixed closed-form space is a closed Hilbert subspace,
  and a continuous linear map from it to finite-dimensional ordinary cohomology is weakly continuous.
  Since $u_k harpoon.rt 0$, the last displayed identity forces $\[ gamma \] = 0$.

This proves analytic Dolbeault injectivity. Dolbeault theory and GAGA identify it with the natural map in
  algebraic coherent cohomology, proving 2.

== 4 Abundance for fourfolds with nonzero Euler characteristic <sec:euler-route>

The metric theorem gives abundance for klt fourfolds when the Euler characteristic is nonzero.
  A published nonvanishing criterion uses this Euler hypothesis to produce the first section;
  a second criterion then gives semiampleness. We state both inputs in terms of the actual adjoint bundle on a
  resolution, so that the same zero-Lelong metric supplies their analytic hypotheses.

#thm([Corollary 4.1.])[
  #emph[Let $\( X \, Delta \)$ be a projective complex klt fourfold with effective rational boundary and nef
    adjoint $D = K_X + Delta$. If $chi \( X \, cal(O)_X \) eq.not 0$, then $D$ is semiample.]
] <cor:euler-abundance>

This proof combines 1 with published nonvanishing and semiampleness criteria.
  It isolates the use of $chi \( X \, cal(O)_X \) eq.not 0$:
  that condition enters the nonvanishing criterion, whereas the metric theorem has no Euler-characteristic
  hypothesis. Related work on multiplier-ideal approximations and supercanonical currents studies this analytic
  setting [16] Theorems A–B.

=== The two algebraic inputs <the-two-algebraic-inputs>

For a $bb(Q)$-Cartier divisor $P$ on a normal projective variety,
  the metric condition in [17] Definition 2.12 requires a positive integer $r$, with $r P$ Cartier,
  and a resolution $f : Z arrow.r X$ carrying a singular metric on $f^(*)
  cal(O)_X \( r P \)$ whose curvature has the form

#[#set math.equation(numbering: n => "(4.1)")
 $ T = T_0 + sum_j a_j \[ E_j \] \, wide T_0 gt.eq 0 \, quad nu \( T_0 \, z \) = 0 med \( z in Z \) \, quad
   a_j in bb(Q)_(gt.eq 0) . $ <mm:eq:generalized-algebraic>]

The divisor sum is finite. This is called a metric with #emph[generalized algebraic singularities].
  The sum may be zero; in particular, every semipositive metric with zero Lelong numbers everywhere meets this
  definition.

#thm([Theorem 4.2.])[
  (Lazić–Peternell, fourfold nonvanishing).  #emph[Let $\( X \, Delta \)$ be a normal projective complex klt pair
    of dimension four, with effective rational boundary, and put $D = K_X + Delta$.
    Suppose $D$ is pseudoeffective and $N$ is a nef $bb(Q)$-Cartier divisor.
    If both $D$ and $D + N$ satisfy the metric condition (4.1) and $chi \( X \, cal(O)_X \) eq.not 0$,
    then some rational $t_0 > 0$ satisfies
$ kappa \( X \, D + t N \) gt.eq 0 wide upright("for every rational ") t in \[ 0 \, t_0 \] . $

]
] <mm:thm:lp-fourfold>

This is [17] Corollary D, the unconditional four-dimensional consequence of their Theorem C(i).
  Its interval includes $t = 0$. We will take $N = 0$, so both metric assumptions concern $D$.

#thm([Theorem 4.3.])[
  (Gongyo–Matsumura, fourfold semiampleness).  #emph[Let $\( X \, Delta \)$ be a normal projective complex klt
    pair of dimension four, with effective rational boundary, and set $D = K_X + Delta$.
    Suppose that for a projective birational morphism $f : Z arrow.r
    X$ with $Z$ smooth and some positive integer $r$ with $r D$ Cartier,
    the bundle $f^(*) cal(O)_X \( r D \)$ carries a semipositive singular Hermitian metric with zero Lelong
    numbers at every point of $Z$. If $kappa \( X \, D \) gt.eq 0$, then $D$ is semiample.]
] <mm:thm:gm-fourfold>

This is the form of [11] Corollary 5.3 used here. Positivity of the Cartier multiple is also explicit in their
  Theorem 5.1, from which that corollary follows. Neither of these fourfold results requires $X$ to be
  $bb(Q)$-factorial or non-uniruled. Their dimension-three inputs are already incorporated in the stated corollaries.

=== Application to the minimal metric <application-to-the-minimal-metric>

#proof[
  Choose a projective log resolution $pi : Y arrow.r X$, a positive integer $r$ such that $r D$ is Cartier,
    and a metric $h_min$ with minimal singularities on $L = pi^(*) D$.
    Nefness makes $D$ pseudoeffective, so such a metric exists. By Theorem 1,
  $ nu \( h_min \, y \) = 0 wide \( y in Y \) . $
  The tensor power $h_min^(⊗ r)$ is a metric on the actual line bundle $pi^(*) cal(O)_X \( r D \)$.
    Its local weights are $r phi.alt$, so its curvature is semipositive and its Lelong numbers are $r
    nu \( phi.alt \, y \) = 0$.
  Consequently, (4.1) holds with $T_0$ equal to this curvature current and with zero divisor sum.
    Apply Theorem 11 with $N = 0$ and $t = 0$ to obtain
  $ kappa \( X \, D \) gt.eq 0 . $
  This is nonvanishing for $D$ itself: a positive Cartier multiple of $D$ has a nonzero global section.
    It is therefore the Kodaira dimension hypothesis of Theorem 12.
    The same resolution and the same metric $h_min^(⊗ r)$ supply its remaining hypothesis,
    and that theorem proves that $D$ is semiample. ◻
]

The argument imposes no restriction on the numerical dimension of $D$.
  The Euler-characteristic hypothesis is used only to obtain the first section;
  the interior-injectivity theorem of this article is not an input to this particular application.

#heading(level: 1)[References]
#bibitem([1])[R.~Berman and J.-P.~Demailly, #emph[Regularity of plurisubharmonic upper envelopes in big cohomology
  classes], in #emph[Perspectives in Analysis, Geometry, and Topology], Progress in Mathematics, vol.~296,
  Birkhäuser/Springer, 2012, 39--66.
  #link("https://doi.org/10.1007/978-0-8176-8277-4_3")[doi:10.1007/978-0-8176-8277-4\_3].
  Locators refer to #link("https://arxiv.org/abs/0905.1246v1")[arXiv:0905.1246v1].]
#bibitem([2])[J.-P.~Demailly, T.~Peternell, and M.~Schneider,
  #emph[Pseudo-effective line bundles on compact Kähler manifolds],
  International Journal of Mathematics #strong[12] (2001), no.~6, 689--741.
  Locators refer to #link("https://arxiv.org/abs/math/0006205v2")[arXiv:math/0006205v2].]
#bibitem([3])[J.-P.~Demailly, #emph[Regularization of closed positive currents and intersection theory],
  Journal of Algebraic Geometry #strong[1] (1992), no.~3, 361--409.]
#bibitem([4])[J.-P.~Demailly, #emph[Analytic Methods in Algebraic Geometry], Surveys of Modern Mathematics,
  vol.~1, International Press and Higher Education Press, Somerville, MA and Beijing, 2012.
  Locators refer to the
  #link("https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/analmeth_book.pdf")[July 2011 author
  manuscript].]
#bibitem([5])[J.-P.~Demailly and J.~Kollár, #emph[Semi-continuity of complex singularity exponents and
  Kähler--Einstein metrics on Fano orbifolds], Annales scientifiques de l'École Normale Supérieure (4) #strong[34]
  (2001), no.~4, 525--556.]
#bibitem([6])[F.~Docquier and H.~Grauert, #emph[Levisches Problem und Rungescher Satz für Teilgebiete Steinscher
  Mannigfaltigkeiten], Mathematische Annalen #strong[140] (1960), 94--123.]
#bibitem([7])[H.~Esnault and E.~Viehweg,
  #emph[#link("https://page.mi.fu-berlin.de/esnault/books/esvibuch.pdf")[Lectures on vanishing theorems]],
  DMV Seminar, vol.~20, Birkhäuser, Basel, 1992.]
#bibitem([8])[F.~Forstnerič, #emph[The Oka principle for sections of stratified fiber bundles],
  Pure and Applied Mathematics Quarterly #strong[6] (2010), no.~3, 843--874.
  Theorem~3.1 is cited from #link("https://arxiv.org/abs/0705.0591v5")[arXiv:0705.0591v5].]
#bibitem([9])[O.~Fujino, #emph[Fundamental theorems for the log minimal model program],
  Publications of the Research Institute for Mathematical Sciences #strong[47] (2011), no.~3, 727--789.]
#bibitem([10])[O.~Fujino, #emph[A transcendental approach to Kollár's injectivity theorem],
  Osaka Journal of Mathematics #strong[49] (2012), no.~3, 833--852.
  Locators refer to the author manuscript dated 30 April 2011,
  #link("https://www.math.kyoto-u.ac.jp/~fujino/kollar1-03.pdf")[version 1.25].]
#bibitem([11])[Y.~Gongyo and S.-i.~Matsumura, #emph[Versions of injectivity and extension theorems],
  Annales scientifiques de l'École Normale Supérieure (4) #strong[50] (2017), no.~2, 479--502.
  Corollary~5.3 and Question~5.6 are cited from the
  #link("https://numdam.org/item/10.24033/asens.2325.pdf")[published version, p.~499].]
#bibitem([12])[V.~Guedj and A.~Zeriahi, #emph[Intrinsic capacities on compact Kähler manifolds],
  Journal of Geometric Analysis #strong[15] (2005), no.~4, 607--639.
  #link("https://doi.org/10.1007/BF02922247")[doi:10.1007/BF02922247].]
#bibitem([13])[A.~Höring, V.~Lazić, and C.~Lehn, #emph[Nonvanishing results for Kähler varieties],
  #link("https://arxiv.org/abs/2508.14634v2")[arXiv:2508.14634v2], 21 October 2025.]
#bibitem([14])[T.~Koike, #emph[On the minimality of canonically attached singular Hermitian metrics on certain nef
  line bundles], Kyoto Journal of Mathematics #strong[55] (2015), no.~3, 607--616.
  #link("https://doi.org/10.1215/21562261-3089091")[doi:10.1215/21562261-3089091].
  Locators refer to #link("https://arxiv.org/abs/1405.4698v1")[arXiv:1405.4698v1].]
#bibitem([15])[R.~Lazarsfeld, #emph[Positivity in Algebraic Geometry I: Classical Setting:
  Line Bundles and Linear Series], Ergebnisse der Mathematik und ihrer Grenzgebiete (3), vol.~48, Springer,
  Berlin, 2004.]
#bibitem([16])[V.~Lazić, #emph[Metrics with minimal singularities and the Abundance conjecture],
  #link("https://arxiv.org/abs/2406.18233v1")[arXiv:2406.18233v1], 26 June 2024.]
#bibitem([17])[V.~Lazić and T.~Peternell, #emph[On generalised abundance, II],
  Peking Mathematical Journal #strong[3] (2020), 1--46.
  #link("https://doi.org/10.1007/s42543-019-00022-1")[doi:10.1007/s42543-019-00022-1].
  Theorem locators refer to #link("https://arxiv.org/abs/1809.02500v4")[arXiv:1809.02500v4], 7 May 2019.]
#bibitem([18])[J.~Liu and Z.~Xu, #emph[Non-vanishing implies numerical dimension one abundance],
  #link("https://arxiv.org/abs/2505.05250v2")[arXiv:2505.05250v2], 30 July 2025.]
#bibitem([19])[S.-i.~Matsumura, #emph[An injectivity theorem with multiplier ideal sheaves of singular metrics
  with transcendental singularities], Journal of Algebraic Geometry #strong[27] (2018), no.~2, 305--337.
  Locators refer to #link("https://arxiv.org/abs/1308.2033v4")[arXiv:1308.2033v4], 27 April 2016.]
#bibitem([20])[M.~S.~Narasimhan and R.~R.~Simha, #emph[Manifolds with ample canonical class],
  Inventiones Mathematicae #strong[5] (1968), 120--128.
  #link("https://doi.org/10.1007/BF01425543")[doi:10.1007/BF01425543].]
#bibitem([21])[H.~Skoda, #emph[Sous-ensembles analytiques d'ordre fini ou infini dans $C^n$],
  Bulletin de la Société Mathématique de France #strong[100] (1972), 353--408.]
#bibitem([22])[H.~Tsuji, #emph[Canonical singular hermitian metrics on relative canonical bundles],
  #link("https://arxiv.org/abs/0704.0566v5")[arXiv:0704.0566v5], 5 November 2007.]
