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

#align(center)[#text(size: 16pt, weight: "bold")[A direct proof of the complete Crouzeix inequality]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <sec:intro>

The numerical range of a matrix $A in M_n \( bb(C) \)$ is

$ W \( A \) = { u^(*) A u : u in bb(C)^n \, med u^(*) u = 1 } . $

It is a compact convex set containing the spectrum. For a normal matrix,
  the spectral theorem controls polynomial evaluation by values on the spectrum.
  For a nonnormal matrix, the spectrum alone cannot provide the same control:
  even a nonzero nilpotent matrix has spectrum ${ 0 }$. The numerical range retains enough information to give a
  universal bound.

We allow matrix coefficients. If $P \( z \) = sum_(k = 0)^d B_k z^k$ with $B_k in M_m \( bb(C) \)$, set

$ P \[ A \] = sum_(k = 0)^d A^k ⊗ B_k . $

The base space $bb(C)^n$ is the first tensor factor. All operator norms come from the Euclidean inner products and
  their Hilbert tensor products. The complete Crouzeix conjecture asks whether the constant two holds uniformly in
  the coefficient dimension $m$, the base dimension, and the degree.

#thm([Theorem 1.1.])[
  #emph[For every pair of positive integers $n \, m$, every $A in M_n \( bb(C) \)$, every nonnegative integer $d$,
    and every polynomial $P \( z \) = sum_(k = 0)^d B_k z^k$ with $B_k in M_m \( bb(C) \)$,
#[#set math.equation(numbering: n => "(1.1)")
 $ parallel P \[ A \] parallel lt.eq 2 max_(z in W \( A \)) parallel P \( z \) parallel . $ <eq:main>]

 The constant two cannot be decreased uniformly over $n \, m$, and $d$.]
] <thm:main>

The estimate includes point and segment numerical ranges. Its complete character is the uniformity in $m$:
  a scalar proof need not survive matrix amplification, because coefficient matrices need not commute.
  The argument below keeps their multiplication order, using the two products $F G$ and $G F$ separately.

=== Earlier bounds and related arguments <earlier-bounds-and-related-arguments>

Crouzeix formulated the scalar constant-two question in 2004 and proved a universal complete bound of $11.08$ in
  2007 [7,8]. Positive boundary representations developed by Delyon and Delyon [11] supply an important part of
  the numerical-range method. Crouzeix and Palencia combined a positive double-layer potential with the Cauchy
  transform of conjugate boundary data to obtain the complete bound $1 + sqrt(2)$ [10];
  Ransford and Schwenninger simplified its final norm argument [17].
  For all base matrices of order two, Badea, Crouzeix, and Delyon obtained the complete constant two.
  In the nonnormal case, they make the conformal image of the matrix a contraction by a similarity with condition
  number at most two, using the numerical-range ellipse [3].

Recent scalar proofs include work of Jin [13], Lorist and Schwenninger [14], and Luo [15].
  Lorist and Schwenninger’s Theorem 3 applies to scalar rational functions of bounded Hilbert-space operators;
  their Section 3(iv) explains why the commutation used in that proof does not automatically persist under
  amplification. Åhag, Czyż, and Virtanen prove the complete inequality for base matrices of order at most three,
  with arbitrary coefficient dimension [1] Theorem 1.1. The scalar results fix $m = 1$,
  while the latter complete result restricts the base dimension; Theorem 1 leaves these dimensions independent.

The use of Faber polynomials in numerical-range functional calculus has precedents in [4,5].
  Lorist and Schwenninger use a norm-attaining vector in their scalar argument [14] Lemma 1,
  while Luo chooses an explicit top singular pair [15] Section 3, equations (21)–(22).
  In their complete constant-two proof for weighted shift matrices,
  Crouzeix and Greenbaum use a scalar extremal function and a norm-attaining vector after a similarity reduction
  [9] Section 3, proof of Theorem 2. Here a Faber coefficient estimate controls the two diagonal functionals
  obtained by placing a test polynomial on each side of the polynomial being estimated.

A separate structural proof of the complete inequality is given in [16].
  For a bounded convex domain $Omega$ with regular real-analytic boundary and $W \( A \) subset Omega$,
  it constructs a positive definite $S$ with $parallel S parallel parallel S^(- 1) parallel lt.eq
  2$ such that $S f \( A \) S^(- 1)$ is a contraction, where $f : Omega arrow.r
  bb(D)$ is an interior conformal map and $bb(D) = { z in bb(C) : \| z \| < 1 }$.
  The same $S$, obtained from a minimizing metric, gives one continuous normalized positive boundary density
  representing the calculus of $S A S^(- 1)$ for every coefficient dimension and every matrix function holomorphic
  near $overline(Omega)$ [16] Theorems 1.2–1.3 and Proposition 2.1.
  The direct proof below estimates one polynomial at a time.
  Its exterior kernel, marginal identities, and positive block comparison have counterparts in [16]
  Propositions 3.1 and 3.3 and Lemma 5.1; Sections 2–3 prove the specific coefficient, resolvent,
  and block estimates used here.

=== How the coefficients give the sharp bound <how-the-coefficients-give-the-sharp-bound>

First place $W \( A \)$ strictly inside an analytic convex domain $Omega$.
  An exterior conformal map $h$ parametrizes its boundary by the unit circle.
  Expanding the Cauchy kernel at infinity defines scalar polynomials $b_k$ of degree $k$.
  For $k gt.eq 1$, the boundary value $b_k compose h$ has the positive Fourier term $lambda^k$ and an otherwise
  strictly negative expansion. In Section 2, a nonnegative kernel with integral one in each variable makes the map
  from the positive part to the negative part an $L^2$ contraction.
  Thus, for $G = sum_k b_k C_k$, its squared boundary Hilbert–Schmidt norm lies between the square sum of its
  coefficient norms and that sum with weight two on every nonconstant coefficient.

For a polynomial $F$ normalized by its boundary operator norm, choose a unit top singular pair $x \,
  y$ for $F \[ A \]$. The resolvent $R \( lambda \) = lambda
  h' \( lambda \) \( h \( lambda \) I - A \)^(- 1)$ supplies the coefficient arrays representing the three
  functionals $y^(*) G \[ A \] x$, $x^(*) G \[ A \] x$, and $y^(*) G \[ A \] y$.
  The first is bounded by a coefficient Hilbert norm. Testing it on $F G$ and $G
  F$ separately gives bounds for the other two. Their squared dual coefficient norms have reciprocal weights:
  one on the constant coefficient and one half on the others.
  These are exactly the weights in the squared Fourier norms of the corresponding Hermitian diagonal compressions,
  after a common factor of four.

Section 3 completes the comparison. The numerical-range condition makes $R + R^(*)$ positive,
  so its compression to a two-by-two block bounds the off-diagonal boundary norm by the two diagonal norms.
  The cross term retains all coefficients of the first functional, including its constant coefficient.
  The resulting inequality gives the sharp bound two. Section 4 then shrinks analytic convex neighborhoods to an
  arbitrary numerical range and proves sharpness with a two-by-two nilpotent matrix.
  Appendix 5 supplies the exterior collar using classical conformal mapping and reflection theorems.

== 2 Exterior coordinates and coefficient estimates <sec:coefficients>

In this section $Omega$ is a bounded open convex set with regular real-analytic Jordan boundary.
  We work with a supplied exterior conformal map $h$ that is one-to-one on $\| lambda \| > r$,
  including infinity on the Riemann sphere, for some $0 < r < 1$.
  It maps $\| lambda \| > 1$ onto $bb(C) \\ overline(Omega)$ and has a simple pole at infinity, with expansion

#[#set math.equation(numbering: n => "(2.1)")
 $ h \( lambda \) = c lambda + c_0 + O \( lambda^(- 1) \) \, wide c eq.not 0 . $ <eq:h>]

Appendix 5 supplies such a coordinate for every domain under consideration.
  Here we use it to compare polynomial coefficients with boundary norms.

The map $h$ sends $bb(T) = { lambda : \| lambda \| = 1 }$ onto $partial Omega$.
  Put $q \( lambda \) = lambda h' \( lambda \)$. On $bb(T)$,
  the vector $q \( lambda \)$ is an outward normal and $i q \( lambda \)$ is a positively oriented tangent. Hence

#[#set math.equation(numbering: n => "(2.2)")
 $ Re #scale(x: 120%, y: 120%)[\(] overline(q \( lambda \)) \( h \( lambda \) - z \) #scale(x: 120%, y: 120%)[\)]
   gt.eq 0 quad \( lambda in bb(T) \, med z in overline(Omega) \) . $ <eq:support>]

Figure 1 illustrates this supporting-line relation.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  circle((0, 0), radius: 0.8715, stroke: (thickness: 0.8pt, miter-limit: 10))
  content((0, 0), [$bb(D)$])
  circle((0.8715, 0), radius: 0.07056, fill: black, stroke: none)
  content((0.8715, 0), [$lambda$], anchor: "north-west", padding: 0.1176cm)
  line((0.8715, 0), (1.494, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  bezier((1.743, 0.415), (3.32, 0.415), (2.337, 0.5742), (2.726, 0.5742), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((2.532, 0.5344), [$h$], anchor: "south", padding: 0.1176cm)
  circle((4.44, 0), radius: (0.913, 0.7055), stroke: (thickness: 0.8pt, miter-limit: 10))
  content((4.357, -0.1245), [$Omega$])
  line((5.353, -1.079), (5.353, 1.079), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  circle((5.353, 0), radius: 0.07056, fill: black, stroke: none)
  line((5.353, 0), (6.308, 0), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((6.308, 0), [$q( lambda )$], anchor: "west", padding: 0.1176cm)
  content((5.353, 0.0664), [$h( lambda )$], anchor: "south-west", padding: 0.1176cm)
  circle((4.109, 0.2905), radius: 0.05292, fill: black, stroke: none)
  content((4.109, 0.2905), [$z$], anchor: "south", padding: 0.1176cm)
})],
  caption: [Figure 1: The map $h$ sends the exterior of the circle to the exterior of the domain; the supporting line is shown schematically. Increasing the circle radius gives the outward normal $q \( lambda \)$; convexity places every $z in overline(Omega)$ on the inner side of the line. ],
) <fig:normal>

Every circle integral below uses $d tau \( e^(i t) \) = d t \/ \( 2 pi \)$.

We use the unnormalized Hilbert–Schmidt norm $\| \|_2 C = \( "tr" \( C^(*) C \) \)^(1 \/ 2)$,
  which makes each finite-dimensional matrix space a Hilbert space.

#thm([Theorem 2.1.])[
  (Exterior Faber coefficients and the positive kernel).  #emph[Let $Omega$ be a bounded convex domain with
    regular real-analytic Jordan boundary. Let $h$ be meromorphic and one-to-one on $\| lambda \| >
    r$ including infinity, where $0 < r < 1$, with a simple pole at infinity as in (2.1),
    and mapping $\| lambda \| > 1$ onto $bb(C) \\ overline(Omega)$.
    Put $q \( lambda \) = lambda h' \( lambda \)$ and define $b_k \( z \)$ by expansion at infinity:
#[#set math.equation(numbering: n => "(2.3)")
 $ frac(q \( lambda \), h \( lambda \) - z) = sum_(k gt.eq 0) b_k \( z \) lambda^(- k) . $ <eq:faber>]

 Then $b_0 = 1$, and each $b_k$ is a polynomial of degree $k$ with leading coefficient $c^(- k)$.
   There are scalars $s_(k j)$, $k \, j gt.eq 1$, such that
#[#set math.equation(numbering: n => "(2.4)")
 $ b_k \( h \( mu \) \) = mu^k + sum_(j gt.eq 1) s_(k j) mu^(- j) quad \( k gt.eq 1 \) . $ <eq:boundary-basis>]

 The function
#[#set math.equation(numbering: n => "(2.5)")
 $ s \( lambda \, mu \) = frac(q \( lambda \), h \( lambda \) - h \( mu \)) - frac(lambda, lambda - mu) =
   sum_(k \, j gt.eq 1) s_(k j) lambda^(- k) mu^(- j) $ <eq:s>]

 extends holomorphically across the diagonal and both infinities in $\| lambda \| \, \| mu \| > r$.
   For every $r < rho < 1$ there is a constant $C_rho$ with $\| s_(k j) \| lt.eq C_rho rho^(k + j)$.
   The series converges normally on the exterior product collar:
   it converges absolutely and uniformly on every compact subset, including subsets meeting either infinity.
   In particular it converges absolutely and uniformly on $bb(T)^2$. The continuous kernel
$ K \( lambda \, mu \) = 1 + s \( lambda \, mu \) + overline(s \( lambda \, mu \)) $

 is nonnegative and has integral one in each variable with the other fixed.]
] <lem:faber>

#proof[
  Expanding the denominator in (2.3) after factoring $c lambda$ shows that its $k$th coefficient is a polynomial
    of degree $k$ with leading term $c^(- k) z^k$. The constant coefficient is one.
    In particular, the $b_k$ form a basis of the scalar polynomials.
  For the joint extension, consider
  $ H \( lambda \, mu \) = frac(h \( lambda \) - h \( mu \), lambda - mu) . $
  Write $u = lambda^(- 1)$, $v = mu^(- 1)$ and $h \( lambda \) = c lambda + g \( u \)$,
    where $g$ is holomorphic on $\| u \| < r^(- 1)$. Then
  #[#set math.equation(numbering: n => "(2.6)")
   $ H = c - u v frac(g \( u \) - g \( v \), u - v) . $ <eq:H>]
  The divided difference of $g$ is jointly holomorphic, with diagonal value $g' \( u \)$,
    so this formula also covers either or both infinities. Off the diagonal and away from the axes,
    $H$ is nonzero by injectivity of $h$. On the diagonal it equals $h' \( lambda \) eq.not 0$;
    on either axis it equals $c$. Thus it has no zeros on the reciprocal bidisk.
  Direct differentiation gives $s = lambda partial_lambda H \/ H = - u partial_u H \/ H$.
    This function is holomorphic and vanishes on both reciprocal axes.
    Its Taylor series has precisely the strictly mixed powers in (2.5).
    For any $r < rho < 1$, Cauchy estimates on the closed reciprocal bidisk of radius $rho^(- 1)$ give a constant
    $C_rho$ with $\| s_(k j) \| lt.eq C_rho rho^(k + j)$. On a compact subset of the exterior product collar,
    choose $sigma > r$ below all finite coordinate moduli, and then $r < rho < min \( 1 \, sigma \)$.
    The resulting geometric double series dominates the Laurent series uniformly there;
    terms vanish on the reciprocal axes. This proves normal convergence throughout the product collar and absolute
    uniform convergence on the boundary. Comparing coefficients at $lambda = oo$ in (2.5),
    first for fixed finite $mu$ in the exterior collar, yields (2.4).
  For distinct $lambda \, mu in bb(T)$, one has $2 Re \( lambda \/ \( lambda - mu \) \) = 1$, and therefore
  $ K \( lambda \, mu \) = 2 Re frac(q \( lambda \), h \( lambda \) - h \( mu \)) gt.eq 0 $
  by (2.2). Continuity gives the same sign on the diagonal.
    Every term of $s$ and of its conjugate has nonzero frequency in each variable.
    Their integrals in either variable vanish, proving both normalizations. ◻
]

To identify the basis, let $Phi = h^(- 1)$ in the exterior.
  Equation (2.4), which holds throughout the exterior collar, gives $b_k \( z \) - Phi \( z \)^k =
  O \( z^(- 1) \)$ at infinity. Thus $b_k$ is the polynomial part of $Phi^k$,
  the Faber polynomial associated with the chosen exterior coordinate.
  The usual normalization chooses the phase of $h$ so that $c > 0$ [4,5].

These mixed coefficients are differentiated Grunsky coefficients.
  The classical normalization gives a weighted coefficient inequality [6] equations (1.1)–(1.3);
  the unweighted estimate used here follows from convexity and the two angular marginal identities.

The two normalizations in Theorem 2 use the same exterior circle measure.
  Together they control the negative Fourier part of a boundary polynomial by its positive part, as follows.

#thm([Proposition 2.2.])[
  (The coefficient norm estimate).  #emph[For every positive integer $m$ and every $M_m \( bb(C) \)$-valued
    polynomial $G \( z \) = sum_(k = 0)^N b_k \( z \) C_k$,
#[#set math.equation(numbering: n => "(2.7)")
 $ sum_(k = 0)^N \| C_k \|_2^2 lt.eq integral_(bb(T)) \| G \( h \( mu \) \) \|_2^2 thin d tau \( mu \) lt.eq \|
   C_0 \|_2^2 + 2 sum_(k = 1)^N \| C_k \|_2^2 . $ <eq:coefficient-estimate>]

]
] <prop:coefficients>

#proof[
  For $u in L^2 \( bb(T) \; cal(H) \)$ with values in a Hilbert space $cal(H)$, define
  $ \( T u \) \( mu \) = integral_(bb(T)) K \( lambda \, mu \) u \( lambda \) thin d tau \( lambda \) . $
  Positivity and the normalization in $lambda$ imply $parallel \( T u \) \( mu \) parallel^2 lt.eq
    integral K \( lambda \, mu \) parallel u \( lambda \) parallel^2 d tau \( lambda \)$.
    Integrating in $mu$ and using the normalization in that variable shows that $T$ is an $L^2$ contraction.
  For $u \( lambda \) = sum_(k = 1)^N C_k lambda^k$, only the $s$ term contributes to the integral, so
  #[#set math.equation(numbering: n => "(2.8)")
   $ \( T u \) \( mu \) = sum_(j gt.eq 1) (sum_(k = 1)^N s_(k j) C_k) mu^(- j) . $ <eq:kernel-fourier-action>]
  All interchanges are justified by the absolute uniform convergence in Theorem 2. In particular,
  $ sum_(j gt.eq 1) \| sum_(k = 1)^N s_(k j) C_k \|_2^2 lt.eq sum_(k = 1)^N \| C_k \|_2^2 . $
  By (2.4), the boundary value of $G$ is the sum of its constant term $C_0$, its positive part $u$,
    and its negative part $T u$. These have disjoint Fourier supports. Parseval’s identity gives
  $ integral_(bb(T)) \| G compose h \|_2^2 d tau = \| C_0 \|_2^2 + sum_(k = 1)^N \| C_k \|_2^2 +
    sum_(j gt.eq 1) \| sum_(k = 1)^N s_(k j) C_k \|_2^2 \, $
  which proves both inequalities. ◻
]

For comparison with [16] Proposition 3.1, the companion’s exterior map $G$ and variables $t \,
  w$ correspond to $h \, lambda \, mu$, respectively. The mixed correction is $s \( lambda \, mu \) =
  B \( mu \, lambda \)$, so $s_(k j) = beta_(j k)$ in that paper’s notation.
  In particular, (2.8) uses this coefficient orientation and does not require symmetry of the kernel.

== 3 Singular vectors and the amplified estimate <sec:matrix>

Fix $A in M_n \( bb(C) \)$ with $W \( A \) subset Omega$.
  To estimate the norm of one polynomial evaluation, we form coefficient functionals from its left and right
  singular vectors. The resolvent supplies their coefficient arrays,
  while its positive Hermitian part compares the resulting boundary norms.
  This Hermitian field is the numerical-range double-layer kernel of [11,10];
  we prove the required positivity for the original matrix $A$.

#thm([Theorem 3.1.])[
  (The resolvent expansion and double-layer positivity).  #emph[Let $Omega \, h \, q$,
    and $\( b_k \)$ satisfy the hypotheses and conclusions of Theorem 2.
    For any positive integer $n$ and $A in M_n \( bb(C) \)$ with $W \( A \) subset Omega$, on $bb(T)$ let
#[#set math.equation(numbering: n => "(3.1)")
 $ R \( lambda \) = q \( lambda \) \( h \( lambda \) I - A \)^(- 1) . $ <eq:R>]

 Then
$ R \( lambda \) = sum_(k gt.eq 0) b_k \( A \) lambda^(- k) \, wide R \( lambda \) +
  R \( lambda \)^(*) succ.curly.eq 0 . $

 For the fixed $A \, h$, there are constants $C < oo$ and $0 < theta < 1$ such that $parallel b_k \( A \) parallel
   lt.eq C theta^k$ for all $k gt.eq 0$. Thus the series converges absolutely and uniformly on $bb(T)$.
   In particular, $integral_(bb(T)) R thin d tau = I$ and $integral_(bb(T)) \( R + R^(*) \) thin d tau = 2 I$.]
] <lem:resolvent>

#proof[
  Every eigenvalue of $A$ belongs to $W \( A \)$, by testing a unit eigenvector.
    Thus the exterior resolvent is defined on and outside the boundary.
    Compactness of the circle and strict spectral separation allow a smaller collar $\| lambda \| > r_A$,
    with $r < r_A < 1$, on which it remains holomorphic, including infinity where $R \( oo \) = I$.
    Expansion at infinity gives the coefficients $b_k \( A \)$:
    this follows either by the geometric resolvent series for large $\|
    h \( lambda \) \|$ or by substituting $A$ into the polynomial coefficient identities in (2.3).
    Choose $r_A < theta < 1$. Cauchy estimates on the reciprocal circle of radius $theta^(- 1)$ give the stated
    geometric bound. They imply absolute uniform convergence on $bb(T)$,
    and its constant coefficient $b_0 \( A \) = I$ gives both integrals.
  For $B = h \( lambda \) I - A$, direct congruence gives
  $ B^(*) \( R + R^(*) \) B = overline(q \( lambda \)) B + q \( lambda \) B^(*) . $
  For each unit vector $v$, the quadratic form on the right is $2
    Re \( overline(q \( lambda \)) \( h \( lambda \) - v^(*) A v \) \)$, which is nonnegative by (2.2).
    Invertibility of $B$ proves positivity. ◻
]

#thm([Theorem 3.2.])[
  (The bound on an analytic convex domain).  #emph[For positive integers $n \, m$,
    let $Omega subset bb(C)$ be bounded, open, and convex with regular real-analytic Jordan boundary,
    and let $A in M_n \( bb(C) \)$ satisfy $W \( A \) subset Omega$.
    For every $M_m \( bb(C) \)$-valued polynomial $F$ with $parallel F \( z \) parallel lt.eq
    1$ on $partial Omega$, one has $parallel F \[ A \] parallel lt.eq 2$.]
] <thm:domain>

#proof[
  Choose $h$ from Lemma 7 and apply Theorem 2 to this coordinate. Put $gamma = parallel F \[ A \] parallel$.
    There is nothing to prove if $gamma = 0$. Otherwise choose unit singular vectors $x \,
    y in bb(C)^n ⊗ bb(C)^m$ such that
  #[#set math.equation(numbering: n => "(3.2)")
   $ F \[ A \] x = gamma y \, wide F \[ A \]^(*) y = gamma x . $ <eq:singular>]
  Write $x = sum_(i = 1)^m X e_i ⊗ e_i$ and $y = sum_(i = 1)^m Y e_i ⊗ e_i$, where $X \,
    Y$ are $n$-by-$m$ matrices and $\( e_i \)$ is the standard basis of $bb(C)^m$.
    For the resolvent in Theorem 4, define matrix functions
  $ P = X^(*) R X \, quad Q = Y^(*) R Y \, quad M = Y^(*) R X \, quad L = X^(*) R Y . $
  Subscripts $k gt.eq 0$ denote the coefficients of $lambda^(- k)$, so $M_k = Y^(*) b_k \( A \) X$, for example.
    By Theorem 4, all four series converge absolutely and uniformly on $bb(T)$,
    and their coefficient sequences are square summable. Since $b_0 = 1$,
  #[#set math.equation(numbering: n => "(3.3)")
   $ P_0 = X^(*) X = P_0^(*) \, wide Q_0 = Y^(*) Y = Q_0^(*) \, wide L_0^(*) = M_0 . $ <eq:means>]
  Set $a^2 = sum_(k gt.eq 0) \| M_k \|_2^2$. We will bound the squared boundary $L^2$ Hilbert–Schmidt norms of
    $P + P^(*)$ and $Q + Q^(*)$ above by $4 a^2 \/ gamma^2$ each, and that of $M + L^(*)$ below by $a^2$.
    Positivity will then compare these quantities and force $gamma lt.eq 2$.
  #emph[The off-diagonal coefficient functional.] For a polynomial $G = sum_k b_k C_k$,
    direct expansion in the tensor basis gives
  #[#set math.equation(numbering: n => "(3.4)")
   $ y^(*) G \[ A \] x = sum_(k \, i \, j) \( M_k \)_(i j) \( C_k \)_(i j) . $ <eq:pairing>]
  Indeed, $C_k e_j = sum_i \( C_k \)_(i j) e_i$ in the coefficient factor,
    leaving $\( Y e_i \)^(*) b_k \( A \) X e_j$ in the base factor.
    Equation (3.4) is the bilinear entry pairing of the two coefficient arrays. Cauchy–Schwarz gives
  #[#set math.equation(numbering: n => "(3.5)")
   $ \| y^(*) G \[ A \] x \| lt.eq a (sum_k \| C_k \|_2^2)^(1 \/ 2) . $ <eq:crossfunctional>]
  Taking $G = F$ and using (3.2) shows that $a > 0$.
  #emph[The two ordered tests.] Polynomial evaluation respects multiplication in its given order.
    Explicitly, if $F \( z \) = sum_i D_i z^i$ and $G \( z \) = sum_j E_j z^j$, then
  $ \( F G \) \[ A \] = sum_(i \, j) A^(i + j) ⊗ D_i E_j = F \[ A \] G \[ A \] \, $
  and the reversed product has coefficients $E_j D_i$. Hence
  #[#set math.equation(numbering: n => "(3.6)")
   $ y^(*) \( F G \) \[ A \] x = gamma x^(*) G \[ A \] x \, wide y^(*) \( G F \) \[ A \] x =
     gamma y^(*) G \[ A \] y . $ <eq:ordered-products>]
  Write the full finite Faber expansions as
  $ F G = sum_k b_k U_k \, wide G F = sum_k b_k V_k \, wide parallel H parallel_partial^2 =
    integral_(bb(T)) \| H \( h \( mu \) \) \|_2^2 thin d tau \( mu \) . $
  The functional in (3.5) uses all $M_k$, so it applies to these full expansions for every finite degree.
    Apply it to the two identities in (3.6). The lower coefficient estimate in Proposition 3 and the two boundary
    multiplier bounds give
  $ gamma \| x^(*) G \[ A \] x \| & lt.eq a #scale(x: 180%, y: 180%)[\(] sum_k \| U_k \|_2^2
    #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) lt.eq a parallel F G parallel_partial lt.eq a parallel G parallel_partial \,\
gamma \| y^(*) G \[ A \] y \| & lt.eq a #scale(x: 180%, y: 180%)[\(] sum_k \| V_k \|_2^2
  #scale(x: 180%, y: 180%)[\)]^(1 \/ 2) lt.eq a parallel G F parallel_partial lt.eq a parallel G parallel_partial . $
  Here $\| F \( z \) G \( z \) \|_2 lt.eq parallel F \( z \) parallel \| G \( z \) \|_2$ and $\| G \( z \)
    F \( z \) \|_2 lt.eq \| G \( z \) \|_2 parallel F \( z \) parallel$ are used in their respective orders.
    The upper coefficient estimate for $G$ now gives
  #[#set math.equation(numbering: n => "(3.7)")
   $ max { \| x^(*) G \[ A \] x \| \, \| y^(*) G \[ A \] y \| } lt.eq a /
     gamma (\| C_0 \|_2^2 + 2 sum_(k gt.eq 1) \| C_k \|_2^2)^(1 \/ 2) . $ <eq:diagonal-functional>]
  The entries paired with $C_k$ in these two functionals are respectively those of $P_k$ and $Q_k$,
    by the calculation in (3.4). The weighted coefficient norm on the right gives reciprocal weights on these two
    coefficient sequences:
  #[#set math.equation(numbering: n => "(3.8)")
   $ \| P_0 \|_2^2 + 1 / 2 sum_(k gt.eq 1) \| P_k \|_2^2 lt.eq a^2 \/ gamma^2 \, wide \| Q_0 \|_2^2 + 1 /
     2 sum_(k gt.eq 1) \| Q_k \|_2^2 lt.eq a^2 \/ gamma^2 . $ <eq:weighted-dual>]
  For the first inequality, set $d_N = \| P_0 \|_2^2 + 1 / 2 sum_(k = 1)^N \|
    P_k \|_2^2$ and test (3.7) with $C_0 = overline(P_0)$, $C_k = overline(P_k) \/ 2$ for $1 lt.eq k lt.eq N$,
    and $C_k = 0$ otherwise; bars mean entrywise conjugation.
    The paired value is $d_N$, and the squared weighted test norm is also $d_N$.
    Hence $d_N lt.eq \( a \/ gamma \) sqrt(d_N)$, which gives $d_N lt.eq a^2 \/ gamma^2$ including when $d_N = 0$.
    Letting $N arrow.r oo$ proves the first bound. The same finite tests with $Q_k$ prove the second.
  #emph[The boundary norms of the three blocks.] The compression of $R +
    R^(*)$ by $\[ X med Y \]$ has diagonal blocks $P + P^(*)$, $Q + Q^(*)$ and lower off-diagonal block $M +
    L^(*)$. We first compute their boundary norms. In the diagonal fields,
    (3.3) makes the constant term twice $P_0$ or $Q_0$. For $k gt.eq 1$,
    the coefficients $P_k$ and $P_k^(*)$ occur at frequencies $- k$ and $k$ and have equal Hilbert–Schmidt norms;
    the same holds for $Q_k$ and $Q_k^(*)$. Parseval therefore gives four times the reciprocal weighted sum in (3.8):
  #[#set math.equation(numbering: n => "(3.9)")
   $ integral_(bb(T)) \| P + P^(*) \|_2^2 d tau = 4 (\| P_0 \|_2^2 + 1 / 2 sum_(k gt.eq 1) \| P_k \|_2^2) lt.eq
     4 a^2 \/ gamma^2 \, $ <eq:diagonal-L2>]
  and the same identity and bound hold for $Q + Q^(*)$.
  For the cross field, $L_0^(*) = M_0$ makes the constant term $2 M_0$.
    Its negative coefficients are $M_k$ for $k gt.eq 1$ and its positive coefficients are $L_k^(*)$ for $k gt.eq
    1$. Consequently
  #[#set math.equation(numbering: n => "(3.10)")
   $ integral_(bb(T)) \| M + L^(*) \|_2^2 d tau = 4 \| M_0 \|_2^2 +
     sum_(k gt.eq 1) #scale(x: 120%, y: 120%)[\(] \| M_k \|_2^2 + \| L_k \|_2^2 #scale(x: 120%, y: 120%)[\)] gt.eq
     a^2 . $ <eq:cross-L2>]
  #emph[The positive block comparison.] Theorem 4 gives $R + R^(*) succ.curly.eq 0$.
    Its compression by the $n$-by-$2 m$ matrix $\[ X med Y \]$ is therefore
  $ Delta = mat(delim: "(", P + P^(*), L + M^(*); M + L^(*), Q + Q^(*)) succ.curly.eq 0 . $
  For $J = "diag" \( I_m \, - I_m \)$, the matrix $J Delta J$ is also positive, so
  $ 0 lt.eq "tr" #scale(x: 120%, y: 120%)[\(] Delta^(1 \/ 2) \( J Delta J \) Delta^(1 \/ 2)
    #scale(x: 120%, y: 120%)[\)] = "tr" \( Delta J Delta J \) = \| P + P^(*) \|_2^2 + \| Q + Q^(*) \|_2^2 -
    2 \| M + L^(*) \|_2^2 . $
  Integrating this inequality and using (3.9) and (3.10) yields
  $ 2 a^2 lt.eq 2 integral_(bb(T)) \| M + L^(*) \|_2^2 d tau lt.eq
    integral_(bb(T)) #scale(x: 120%, y: 120%)[\(] \| P + P^(*) \|_2^2 + \| Q +
    Q^(*) \|_2^2 #scale(x: 120%, y: 120%)[\)] d tau lt.eq 8 a^2 \/ gamma^2 . $
  Since $a > 0$, this proves $gamma lt.eq 2$. ◻
]

== 4 Enclosing domains and arbitrary numerical ranges <sec:limit>

Theorem 5 applies on an analytic convex neighborhood. We now construct such neighborhoods even for compact convex
  sets with empty interior, and then shrink them to $W \( A \)$.

#thm([Lemma 4.1.])[
  (Analytic convex outer approximation).  #emph[Let $K subset bb(C)$ be nonempty, compact, and convex.
    There are bounded convex open domains $Omega_j$ with regular real-analytic Jordan boundaries such that $K
    subset Omega_j$ and
$ sup_(z in overline(Omega)_j) "dist" \( z \, K \) arrow.r 0 . $

]
] <lem:approx>

#proof[
  For $0 < delta < 1$, choose a finite Euclidean $delta$-net $D_delta$ of unit directions that includes $1 \, -
    1 \, i \, - i$. Let $s_K \( nu \) = max_(z in K) Re \( accent(nu z, ‾) \)$ be the support function.
    Choose $t_delta > 0$ with $\| D_delta \| e^(- t_delta delta) < 1$, and define
  $ Phi_delta \( z \) = sum_(nu in D_delta) exp #scale(x: 120%, y: 120%)[\(]
    t_delta \( Re \( accent(nu z, ‾) \) - s_K \( nu \) - delta \) #scale(x: 120%, y: 120%)[\)] \, wide
    Omega_delta = { z : Phi_delta \( z \) < 1 } . $
  Each point of $K$ satisfies $Phi_delta < 1$, so $K subset Omega_delta$.
    If $Phi_delta \( z \) lt.eq 1$, each positive summand is at most one, and hence
  $ Re \( accent(nu z, ‾) \) lt.eq s_K \( nu \) + delta wide \( nu in D_delta \) . $
  In particular, the four axis directions give
  $ min_(w in K) Re w - delta & lt.eq Re z lt.eq max_(w in K) Re w + delta \,\
min_(w in K) Im w - delta & lt.eq Im z lt.eq max_(w in K) Im w + delta . $
  Thus one fixed rectangle contains every closed sublevel for $0 < delta < 1$.
  The Hessian is a sum of positive multiples of $nu nu^(sans(T))$ after identifying $bb(C)$ with $bb(R)^2$.
    The four axis directions ensure it is positive definite. Thus $Phi_delta$ is strictly convex and real analytic.
  The gradient cannot vanish at level one: a critical point of a differentiable convex function is a global
    minimum, whereas every point of $K$ has value less than one.
    The implicit function theorem therefore makes that level a regular real-analytic curve.
    The open sublevel set is bounded and convex with nonempty interior. Fix an interior point.
    Each ray from it crosses level one exactly once; convexity and boundedness give existence and uniqueness.
    Radial projection from the compact boundary to the circle is a continuous bijection, hence a homeomorphism.
    The boundary is a Jordan curve, and $overline(Omega)_delta = { Phi_delta lt.eq 1 }$.
  It remains to bound the distance of this sublevel from $K$.
    For $z in overline(Omega)_delta \\ K$, let $w in K$ be nearest to $z$, put $d = \| z -
    w \|$ and $nu = \( z - w \) \/ d$, and choose $mu in D_delta$ with $\| mu - nu \| lt.eq delta$.
    Choose $v in K$ attaining $s_K \( mu \)$. Since $w + t \( v - w \) in K$ for $0 lt.eq t lt.eq 1$,
    minimality of $w$ gives $Re \( macron(nu) \( v - w \) \) lt.eq 0$.
    Using this inequality and the support inequality for $mu$, we obtain
  $ \( 1 - delta \) d & lt.eq Re \( macron(mu) \( z - w \) \)\
 & lt.eq Re \( macron(mu) \( v - w \) \) + delta\
 & lt.eq delta \| v - w \| + delta lt.eq delta #scale(x: 120%, y: 120%)[\(] 1 +
   "diam" K #scale(x: 120%, y: 120%)[\)] . $
  The first and third inequalities use $\| mu - nu \| lt.eq delta$. Points of $K$ have distance zero, so
  $ sup_(z in overline(Omega)_delta) "dist" \( z \, K \) lt.eq frac(delta \( 1 + "diam" K \), 1 - delta) arrow.r 0 . $
  Taking, for example, $delta_j = 1 \/ \( j + 1 \)$ completes the construction. ◻
]

#proof[
  Compactness of $W \( A \)$ follows from compactness of the unit sphere.
    We recall a short proof of the Toeplitz–Hausdorff convexity theorem [18,12].
    To join two numerical-range values, compress $A$ to the span of their unit testing vectors.
    If that span has dimension one there is nothing to prove.
    In dimension two, its quadratic form on unit vectors $\( u \, v \)$ is a complex-valued real-affine function of
  $ \( 2 Re \( macron(u) v \) \, med 2 Im \( macron(u) v \) \, med \| u \|^2 - \| v \|^2 \) \, $
  which ranges over the full unit sphere in $bb(R)^3$. The linear part of a map from $bb(R)^3$ to $bb(R)^2$ has a
    nonzero kernel. Any point of the unit ball can be moved in a kernel direction to the sphere without changing
    its image. Thus the images of the sphere and ball coincide, and this image is convex.
    Its segment between the chosen values belongs to the numerical range of the compression and hence to $W \( A \)$.
  Apply Lemma 6 with $K = W \( A \)$. By scaling Theorem 5,
  $ parallel P \[ A \] parallel lt.eq 2 max_(z in overline(Omega)_j) parallel P \( z \) parallel . $
  If this maximum is zero, each entry of $P$ vanishes on an open set and the polynomial is identically zero,
    making the inequality immediate. Otherwise divide $P$ by the maximum to invoke that theorem.
    All $overline(Omega)_j$ lie in one compact set. Uniform continuity of the fixed function $z mapsto parallel
    P \( z \) parallel$, the containment of $K$, and the uniform distance convergence imply convergence of these
    maxima to $max_K parallel P parallel$. This proves (1.1) without any interior assumption on $K$.
  For sharpness take $n = 2$, $m = 1$, $P \( z \) = z$, and
  $ A = mat(delim: "(", 0, 2; 0, 0) . $
  Its norm is two, while $\| x^(*) A x \| = 2 \| x_1 x_2 \| lt.eq 1$ for every unit $x$, with equality at $x_1 =
    x_2 = 1 \/ sqrt(2)$. Thus the right-hand maximum in (1.1) is one. No smaller universal constant is possible. ◻
]

== 5 The exterior conformal collar <sec:collar>

We record the classical conformal inputs and prove the continuation and global injectivity required in Section 2.

#thm([Lemma 5.1.])[
  (Exterior coordinate and a univalent collar).  #emph[Let $Omega subset
    bb(C)$ be a bounded convex domain whose boundary is a regular real-analytic Jordan curve.
    There are $0 < r_0 < 1$ and a map $h$, meromorphic on ${ lambda : \| lambda \| > r_0 } union { oo }$,
    which is one-to-one there as a map of the sphere, has a simple pole at infinity,
    and maps $\| lambda \| > 1$ conformally onto $bb(C) \\ overline(Omega)$.
    It maps the unit circle onto $partial Omega$ and has an expansion
$ h \( lambda \) = c lambda + c_0 + sum_(j gt.eq 1) c_j lambda^(- j) \, wide c eq.not 0 . $

 For $lambda$ on the unit circle, $q \( lambda \) = lambda
   h' \( lambda \)$ is a nonzero outward normal vector at $h \( lambda \)$. In particular,
$ "Re" #scale(x: 120%, y: 120%)[\(] overline(q \( lambda \)) \( h \( lambda \) - z \) #scale(x: 120%, y: 120%)[\)]
  gt.eq 0 wide \( z in overline(Omega) \) . $

]
] <lem:exterior-collar>

#proof[
  Fix $z_(*) in Omega$ and apply $z mapsto 1 \/ \( z - z_(*) \)$, with infinity mapped to zero,
    to the spherical exterior $\( bb(C) \\ overline(Omega) \) union { oo }$.
    Its image $U$ is a bounded simply connected domain containing zero,
    with a regular real-analytic Jordan boundary. Indeed, each ray from $z_(*)$ meets $partial
    Omega$ at a unique positive radius; inversion turns the exterior portions of these rays into a star-shaped
    domain about zero. The Riemann mapping theorem [2] Chapter 6, Section 1.1,
    Theorem 1 supplies a conformal bijection $g : bb(D) arrow.r U$ with $g \( 0 \) = 0$.
    Carathéodory’s Jordan-domain theorem [2] Chapter 6, Section 1.2 extends $g$ to a homeomorphism
    $overline(bb(D)) arrow.r overline(U)$.
  We justify the stronger boundary continuation needed below.
    A regular real-analytic boundary arc has a real-analytic parametrization with nonzero derivative.
    Its holomorphic continuation and the holomorphic inverse-function theorem provide a local coordinate in which
    the arc is a real interval and the domain is one side of that interval.
    Choose such coordinates at $zeta in partial bb(D)$ and $p = g \( zeta \) in partial U$.
    Continuity of the boundary extension lets us shrink the source neighborhood so that $g$ maps its intersection
    with $overline(bb(D))$ into the target chart. The composition representing $g$ in these coordinates is
    holomorphic on a half disk, continuous on its real interval, and real-valued there.
    Schwarz reflection extends it holomorphically across the interval [2] Chapter 4, Section 6.5; Chapter 6,
    Sections 1.3–1.4. Apply the same procedure to $g^(- 1)$. Shrink the neighborhoods so that the reflected maps
    can be composed. Their compositions equal the identity on the original domain side,
    and hence throughout a smaller neighborhood by the identity theorem.
    Thus the continued $g$ has nonzero derivative at each boundary point.
  To patch the local continuations, choose around every $zeta in partial
    bb(D)$ a disk $B \( zeta \, R_zeta \)$ carrying such a continuation,
    agreeing with $g$ on its intersection with $bb(D)$. Select finitely many of the third-radius disks $V_i =
    B \( zeta_i \, R_i \/ 3 \)$ that cover the circle, and denote the larger disks by $U_i =
    B \( zeta_i \, R_i \)$. If $V_i ∩ V_j eq.not diameter$ and $R_i gt.eq R_j$, then $\| zeta_i -
    zeta_j \| < \( R_i + R_j \) \/ 3 lt.eq 2 R_i \/ 3 < R_i$.
    The connected lens $U_i ∩ U_j$ therefore contains $zeta_j$ and meets $bb(D)$.
    The two continuations coincide there by the identity theorem.
    They consequently patch with $g$ to a holomorphic map on $bb(D) union union.big_i V_i$,
    a neighborhood of the closed disk.
  The extension is injective on a smaller neighborhood of the closed disk.
    Otherwise, distinct colliding pairs arbitrarily close to that compact set would have subsequential limits in
    the closed disk. Continuity and injectivity on the closed disk identify their limits.
    Both points of each pair would then eventually lie in one local inverse neighborhood of that common limit,
    a contradiction. By compactness, this injective neighborhood contains the disk ${ w : \| w \| <
    R_0 }$ for some $R_0 > 1$. Thus $g$ is univalent on that disk.
    Its sole zero there is $0$, and that zero is simple. Set
  $ h \( lambda \) = z_(*) + frac(1, g \( 1 \/ lambda \)) \, wide r_0 = R_0^(- 1) . $
  This gives all mapping and extension assertions, including the simple pole with coefficient $c =
    1 \/ g' \( 0 \) eq.not 0$.
  Finally, at $lambda = e^(i theta)$ the radial and angular derivatives are $q \( lambda \)$ and $i
    q \( lambda \)$, respectively. They are perpendicular and nonzero.
    Increasing the radial parameter enters the exterior of $overline(Omega)$, so $q \( lambda \)$ points outward.
    The supporting half-plane property of a smooth convex boundary proves the final inequality. ◻
]

#heading(level: 1)[References]
#bibitem([1])[P.~Åhag, R.~Czyż, and J.~Virtanen, #emph[The complete Crouzeix conjecture in dimension three and the
  Clouâtre--Ostermann--Ransford conjecture], #link("https://arxiv.org/abs/2608.27346v4")[arXiv:2608.27346v4],
  September 21, 2026.]
#bibitem([2])[L.~V. Ahlfors, #emph[Complex Analysis], third ed., McGraw--Hill, New York, 1979.]
#bibitem([3])[C.~Badea, M.~Crouzeix, and B.~Delyon, Convex domains and $K$-spectral sets, #emph[Math.
  Z.] #strong[252] (2006), 345--365. #link("https://doi.org/10.1007/s00209-005-0857-y")[doi:10.1007/s00209-005-0857-y].]
#bibitem([4])[B.~Beckermann, Image numérique, GMRES et polynômes de Faber, #emph[C. R.
  Math.] #strong[340] (2005), 855--860.
  #link("https://doi.org/10.1016/j.crma.2005.04.027")[doi:10.1016/j.crma.2005.04.027].]
#bibitem([5])[B.~Beckermann and M.~Crouzeix, Faber polynomials of matrices for non-convex sets, #emph[Jaen J.
  Approx.] #strong[6] (2014), 219--231. #link("https://arxiv.org/abs/1310.1356v1")[arXiv:1310.1356v1].]
#bibitem([6])[B. Beckermann and N. Stylianopoulos, #emph[Bergman Orthogonal Polynomials and the Grunsky Matrix],
  Constr. Approx. #strong[47] (2018), 211--235.
  #link("https://doi.org/10.1007/s00365-017-9381-7")[doi:10.1007/s00365-017-9381-7].]
#bibitem([7])[M.~Crouzeix, Bounds for analytical functions of matrices,
  #emph[Integral Equations Operator Theory] #strong[48] (2004), 461--477.
  #link("https://doi.org/10.1007/s00020-002-1188-6")[doi:10.1007/s00020-002-1188-6].]
#bibitem([8])[M.~Crouzeix, Numerical range and functional calculus in Hilbert space, #emph[J. Funct.
  Anal.] #strong[244] (2007), 668--690.
  #link("https://doi.org/10.1016/j.jfa.2006.10.013")[doi:10.1016/j.jfa.2006.10.013].]
#bibitem([9])[M.~Crouzeix and A.~Greenbaum, #emph[A new proof that the numerical range is a complete $2$-spectral
  set for weighted shift matrices], #link("https://arxiv.org/abs/2508.12768v1")[arXiv:2508.12768v1], August 18, 2025.]
#bibitem([10])[M.~Crouzeix and C.~Palencia, The numerical range is a $\( 1 + sqrt(2) \)$-spectral set,
  #emph[SIAM J. Matrix Anal. Appl.] #strong[38] (2017), 649--655.
  #link("https://doi.org/10.1137/17M1116672")[doi:10.1137/17M1116672].]
#bibitem([11])[B.~Delyon and F.~Delyon, Generalization of von Neumann's spectral sets and integral representation
  of operators, #emph[Bull. Soc. Math. France] #strong[127] (1999), 25--41.
  #link("https://doi.org/10.24033/bsmf.2340")[doi:10.24033/bsmf.2340].]
#bibitem([12])[F.~Hausdorff, Der Wertvorrat einer Bilinearform, #emph[Math. Z.] #strong[3] (1919), 314--316.
  #link("https://doi.org/10.1007/BF01292610")[doi:10.1007/BF01292610].]
#bibitem([13])[S.~Jin, #emph[The numerical range is a $2$-spectral set],
  #link("https://www.preprints.org/manuscript/202607.1919/v4")[Preprints.org 202607.1919, version 4], August 7, 2026.]
#bibitem([14])[E.~Lorist and F.~L. Schwenninger, #emph[A solution to Crouzeix's conjecture],
  #link("https://arxiv.org/abs/2608.03841v2")[arXiv:2608.03841v2], August 17, 2026.]
#bibitem([15])[Q.~Luo, #emph[Two boundary-certificate proofs of the Crouzeix theorem:
  Fiberwise Fourier recurrence and defect-Gram telescoping],
  #link("https://www.preprints.org/manuscript/202608.1661/v2")[Preprints.org 202608.1661, version 2], August 28, 2026.]
#bibitem([16])[OpenAI, #emph[The complete Crouzeix theorem:
  optimal similarity and a common positive boundary representation],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/The-complete-Crouzeix-theorem-September-23-2026/paper.pdf")[OAI:The-complete-Crouzeix-theorem-September-23-2026],
  2026.]
#bibitem([17])[T.~Ransford and F.~L. Schwenninger, Remarks on the Crouzeix--Palencia proof that the numerical
  range is a $\( 1 + sqrt(2) \)$-spectral set, #emph[SIAM J. Matrix Anal. Appl.] #strong[39] (2018), 342--345.
  #link("https://doi.org/10.1137/17M1143757")[doi:10.1137/17M1143757].]
#bibitem([18])[O.~Toeplitz, Das algebraische Analogon zu einem Satze von Fejér, #emph[Math.
  Z.] #strong[2] (1918), 187--197. #link("https://doi.org/10.1007/BF01212904")[doi:10.1007/BF01212904].]
