#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 85.0pt, y: 85.0pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[A strict inverse-first-power bound for univalent functions]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

For a univalent function, the derivative can become large or small near the boundary even when the image domain is bounded. Integral means measure the rate of this concentration. Their universal spectrum records the largest possible growth exponent over a class of conformal maps; it brings questions about derivatives, coefficients, and the geometry of image boundaries into a common framework.

Let $bb(D) = { z in bb(C) : \| z \| < 1 }$, and let $cal(S)$ consist of all injective holomorphic maps $f : bb(D) arrow.r bb(C)$ with $f \( 0 \) = 0$ and $f' \( 0 \) = 1$. Write $cal(S)_b$ for the subclass of maps with bounded image. The bound on the image may depend on $f$, and no boundary regularity is imposed. For $p in bb(R)$ and $0 lt.eq r < 1$, define

$ M_p \[ f' \] \( r \) & = frac(1, 2 pi) integral_(- pi)^pi \| f' \( r e^(i theta) \) \|^p thin d theta \,\
beta_f \( p \) & = limsup_(r arrow.t 1) frac(log M_p \[ f' \] \( r \), log \( 1 \/ \( 1 - r \) \)) \, & B_b \( p \) & = sup_(f in cal(S)_b) beta_f \( p \) . $

The derivative of a univalent map never vanishes, so all real powers are defined. The supremum in $B_b$ is taken after each map’s limiting exponent. Multiplying a map by a nonzero constant leaves that exponent unchanged, so normalization of the derivative does not change the bounded-class spectrum.

=== 1.1 The conjecture and the uniform bound <the-conjecture-and-the-uniform-bound>

Kraetzer’s experiments with conformal maps onto bounded domains led to the prediction

#[#set math.equation(numbering: n => "(1)")
 $ B_b \( p \) = cases(delim: "{", p^2 \/ 4 \, & \| p \| lt.eq 2 \,, \| p \| - 1 \, & \| p \| gt.eq 2 .) $ <eq:kraetzer>]

The quadratic part is stated in his 1996 paper and explicitly restated in his thesis #cite(label("Kraetzer")) #cite(label("KraetzerThesis")); the full quadratic–linear formulation also appears in Beliaev’s discussion of numerical spectra #cite(label("Beliaev")). We prove a strict upper bound at the negative interior exponent $p = - 1$.

#thm([Theorem 1.1.])[
  (Uniform inverse-first-power bound).  #emph[There exist constants $0 < epsilon < 1 \/ 4$ and $C < oo$ such that 
#[#set math.equation(numbering: n => "(2)")
 $ M_(- 1) \[ f' \] \( r \) lt.eq C \( 1 - r \)^(- 1 \/ 4 + epsilon) #h(2em) upright("for every ") f in cal(S) upright(" and every ") 1 \/ 2 lt.eq r < 1 . $ <eq:uniform>]

 Consequently $B_b \( - 1 \) < 1 \/ 4$, and Kraetzer’s conjectured identity (1) is false.]
] <thm:main>

Both constants are independent of the map, including its image size. The proof gives existence of a positive gap but does not evaluate it numerically. The conclusion concerns the inverse first power; it does not settle the proposed value at $p = 1$.

=== 1.2 Context and the role of strictness <context-and-the-role-of-strictness>

The distinction between bounded and unrestricted disk maps matters. Carleson and Jones connected coefficient problems with conformal dimension #cite(label("CJ")). Makarov’s comparison theorem identifies the unrestricted spectrum with the maximum of the bounded spectrum and the Koebe contribution $3 p - 1$ #cite(label("Makarov")) Theorem 5.4. In particular, the bounded spectrum in (1) should not be replaced by the unrestricted disk spectrum at positive exponents. Hedenmalm and Shimorin developed a weighted Bergman-space approach to bounds for these spectra, keeping this distinction explicit #cite(label("HedenmalmShimorin")). Their upper bound at $p = - 1$ for the unrestricted normalized disk class is $0.403$ #cite(label("HedenmalmShimorin")) Table 1. Sola subsequently obtained the bound $0.388$ by related Bergman-space methods #cite(label("Sola")); see also the author’s account in #cite(label("SolaThesis")) p. 6. These estimates remain above the conjectured value $1 \/ 4$; Theorem 1 establishes a uniform exponent strictly below it.

Random conformal snowflakes provide another approach. Beliaev and Smirnov constructed random conformal maps whose averaged spectrum approaches the universal spectrum at any prescribed exponent, and related lower bounds to positive integral operators #cite(label("BeliaevSmirnov")) Sections 3–4. Beliaev further investigated these operators numerically, distinguishing the numerical estimates from rigorous error control #cite(label("Beliaev")). The common feature with the present argument is the use of a law on conformal maps and a positive operator. Here the operator samples inverse derivatives through affine changes of base point, and its growth controls an upper bound uniformly over the entire class $cal(S)$.

The affine-law and saddle-to-maximum construction is also used for inverse-square means in the companion article #emph[Brennan’s conjecture and sharp inverse-square integral means] #cite(label("BrennanMethod")). The two arguments share the compact normalization of half-plane maps, dyadic sampling, and a comparison of critical points over a common target. We prove every inverse-first-power estimate and every transport assertion needed here; the companion’s inverse-square endpoint theorem is not an input.

The obstacle specific to the present theorem is strictness at the candidate exponent $1 \/ 4$. A non-strict comparison of saddle and maximum weights only rules out larger exponents. We retain the exact operator growth parameter when constructing the probability law. For almost every target, distinct critical points have distinct values, so the rank pairing sends each saddle to a strictly higher maximum. This strict increase forces a vanishing Jacobian in the remaining equality case. A harmonic lower barrier then excludes that case. The strict increase can be arbitrarily small from one pair to another; no common pointwise gain is required.

=== 1.3 Proof outline <proof-outline>

Section 2 transfers disk maps to the compact family of univalent maps on the upper half-plane $bb(H) = { x + i y : y > 0 }$, normalized by $F \( i \) = 0$, $F' \( i \) = 1$. A positive operator $L$ samples $1 \/ \| F' \|$ at two affine subscales. The exponential growth rate of $parallel L^n parallel$, denoted by $2^beta$, bounds all the disk means in Theorem 1. If $beta gt.eq 1 \/ 4$, Section 3 constructs a probability law whose inverse-derivative weighted rebasings scale exactly as $y^(- beta)$. Differentiating this identity fixes two moments of the logarithmic derivative.

For a target $xi in bb(C)$, the potential $y^(\( beta + 2 \) \/ 3) \/ \| F \( x + i y \) - xi \|$ turns those moment identities into a geometric comparison. Section 4 proves compactness of its positive superlevels for almost every map and target. Section 5 identifies its critical points through a smooth map $G_F$, proves the target-generic absence of degeneracies and ties, and constructs the measurable rank pairing. The nullity of singular values is the planar instance of Sard’s theorem #cite(label("Sard")); injectivity supplies the separate exclusion of tied critical values. The planar index count follows the tangent-turning argument of Hopf #cite(label("Hopf")). The moment identities make the expected normalized signed Jacobian of $G_F$ positive when $beta > 1 \/ 4$, and zero when $beta = 1 \/ 4$.

Section 6 changes variables through $G_F$ and compares the paired weights on expanding source rectangles. It also transfers exceptional-target nullity to the fixed normalized point, where area-genericity alone would be insufficient. The comparison forces the expected signed Jacobian to be nonpositive; strictness of the pairing forces the Jacobian itself to vanish almost surely in the remaining equality case. Section 7 rules out the vanishing-Jacobian equality case and converts $beta < 1 \/ 4$ into the uniform estimate.

== 2 A compact model and its growth operator <sec:operator>

This section replaces the boundary-growth problem by growth of a single positive operator on a compact family of normalized maps.

=== 2.1 Univalence estimates <univalence-estimates>

We use the classical quarter and derivative-distortion theorems in exactly the following form #cite(label("Duren")) Chapter 2.

#thm([Lemma 2.1.])[
  (Classical univalence estimates).  #emph[For every $f in cal(S)$ and $\| z \| = r < 1$, 
#[#set math.equation(numbering: n => "(3)")
 $ frac(1 - r, \( 1 + r \)^3) lt.eq \| f' \( z \) \| lt.eq frac(1 + r, \( 1 - r \)^3) \, #h(2em) B \( 0 \, 1 \/ 4 \) subset f \( bb(D) \) . $ <eq:koebe>]

 If $F$ is univalent on the Euclidean disk $B \( z_0 \, s \)$, then 
#[#set math.equation(numbering: n => "(4)")
 $ B #scale(x: 120%, y: 120%)[\(] F \( z_0 \) \, s \| F' \( z_0 \) \| \/ 4 #scale(x: 120%, y: 120%)[\)] subset F \( B \( z_0 \, s \) \) . $ <eq:local-quarter>]

]
] <lem:classical>

#proof[
  The first assertions are the quoted classical estimates for normalized univalent disk maps. Apply the quarter theorem to $\( F \( z_0 + s zeta \) - F \( z_0 \) \) \/ \( s F' \( z_0 \) \)$ to obtain the last assertion. ◻
]

Let $bb(H) = { x + i y : y > 0 }$, and define

$ cal(K) = { F : bb(H) arrow.r bb(C) upright(" univalent") : F \( i \) = 0 \, med F' \( i \) = 1 } . $

For $F in cal(K)$, set $Q_F = 1 \/ F'$. With $m \( z \) = \( z - i \) \/ \( z + i \)$, the maps of $cal(K)$ are exactly $F = 2 i f compose m$, $f in cal(S)$.

#thm([Lemma 2.2.])[
  (Compact normalized half-plane family).  #emph[The locally uniform topology makes $cal(K)$ compact metrizable. Evaluation of $F \, Q_F$ and all their derivatives is jointly continuous in $F \, z$, and uniformly bounded on each compact source set. Moreover, uniformly in $F in cal(K)$, 
#[#set math.equation(numbering: n => "(5)")
 $ \| Q_F \( x + i y \) \| lt.eq C \/ y quad \( \| x \| lt.eq 2 \, med 0 < y lt.eq 1 \) \, #h(2em) \| F \( z \) \| gt.eq c > 0 quad \( \| m \( z \) \| gt.eq 1 \/ 2 \) . $ <eq:strip>]

]
] <lem:compact>

#proof[
  Integrating the derivative bound in the disk gives local uniform boundedness. Montel’s theorem gives convergent subsequences. Limits retain the normalization by convergence of derivatives and remain injective by Hurwitz’s theorem: for a fixed source point, subtract its value and apply Hurwitz on the punctured domain. The nonconstant normalization excludes the identically zero alternative. A countable compact exhaustion metrizes this topology. Interior holomorphic convergence, together with nonvanishing derivatives, gives the asserted continuity and bounds.
  The identities
  $ 1 - \| m \( z \) \|^2 = frac(4 y, \| z + i \|^2) \, #h(2em) \| Q_F \( z \) \| = frac(\| z + i \|^2, 4 \| f' \( m \( z \) \) \|) $
  and (3) imply the strip estimate. The image under $f$ of the disk of radius $1 \/ 2$ contains $B \( 0 \, 1 \/ 8 \)$ by (4). Injectivity gives the second assertion, with $c = 1 \/ 4$ for $F = 2 i f compose m$. ◻
]

=== 2.2 Affine rebasings and dyadic samples <affine-rebasings-and-dyadic-samples>

Identify a point $z = x + i y in bb(H)$ with the affine map

$ z dot.op w = x + y w \, #h(2em) z^(\#) = \( - x + i \) \/ y . $

This is a group with identity $i$ and inverse $z^(\#)$. For $F in cal(K)$, define

$ \( T_z F \) \( w \) = frac(F \( z dot.op w \) - F \( z \), y F' \( z \)) . $

Then $T_z F in cal(K)$, and direct substitution gives

#[#set math.equation(numbering: n => "(6)")
 $ T_w \( T_z F \) = T_(z dot.op w) F \, #h(2em) Q_(T_z F) \( w \) = frac(Q_F \( z dot.op w \), Q_F \( z \)) . $ <eq:action>]

On $C \( cal(K) \)$, with its supremum norm, put

$ \( A_z Phi \) \( F \) = \| Q_F \( z \) \| thin Phi \( T_z F \) \, #h(2em) L = 1 / 2 \( A_(- 1 \/ 2 + i \/ 2) + A_(1 \/ 2 + i \/ 2) \) . $

These are bounded positive operators. For each continuous $Phi$, $A_z Phi$ is jointly continuous in $F \, z$; rebasings send compact source sets to compact sets locally in the parameter $z$. Equation (6) gives $A_z A_w = A_(z dot.op w)$. In particular, if $v = 2^(- n)$ and $u_j = - 1 + \( 2 j + 1 \) v$, then

#[#set math.equation(numbering: n => "(7)")
 $ L^n = v sum_(j = 0)^(2^n - 1) A_(u_j + i v) \, #h(2em) parallel L^n parallel = max_(F in cal(K)) \( L^n 1 \) \( F \) . $ <eq:dyadic>]

The abscissae are the sums $sum_(ell = 1)^n plus.minus 2^(- ell)$; positivity proves the norm identity. Testing the affine map $F \( z \) = z - i$, and using (5), we obtain $1 lt.eq parallel L^n parallel lt.eq C 2^n$. The same operator will control every map. Submultiplicativity defines

#[#set math.equation(numbering: n => "(8)")
 $ rho = lim_(n arrow.r oo) parallel L^n parallel^(1 \/ n) \, #h(2em) beta = log_2 rho \, #h(2em) 0 lt.eq beta lt.eq 1 . $ <eq:rho>]

Indeed, writing $n = q N + r$, $0 lt.eq r < N$, bounds the upper root limit by $parallel L^N parallel^(1 \/ N)$; take the infimum over $N$.

#thm([Proposition 2.3.])[
  (From dyadic samples to disk means).  #emph[There is a universal constant $C_0$ such that, for $f in cal(S)$, 
$ M_(- 1) \[ f' \] \( r \) lt.eq C_0 parallel L^n parallel quad upright("if") quad 1 \/ 2 lt.eq r < 1 \, quad v = 2^(- n) lt.eq 1 - r < 2 v . $

 Consequently $B_b \( - 1 \) lt.eq beta$.]
] <prop:disk>

#proof[
  For $3 pi \/ 4 lt.eq theta lt.eq 5 pi \/ 4$, write
  $ m^(- 1) \( r e^(i theta) \) = x + i y \, #h(2em) x = frac(- 2 r sin theta, d) \, quad y = frac(1 - r^2, d) \, quad d = 1 - 2 r cos theta + r^2 . $
  Here $\| x \| lt.eq 1$, $1 \/ 2 lt.eq y \/ v lt.eq 4$, and
  $ frac(d x, d theta) = frac(4 r^2 - 2 r \( 1 + r^2 \) cos theta, d^2) gt.eq 1 / 16 . $
  If $\| x - u_j \| lt.eq v$, the point $\( x - u_j \) \/ v + i y \/ v$ lies in a fixed compact rectangle in $bb(H)$. Apply Lemma 3 to $Q_(T_(u_j + i v) F)$ and (6) to get
  $ \| Q_F \( x + i y \) \| lt.eq C \| Q_F \( u_j + i v \) \| . $
  For $F = 2 i f compose m$, $\| f' \( r e^(i theta) \) \|^(- 1) = 4 \| Q_F \( x + i y \) \| \/ \| x + i \( y + 1 \) \|^2$. The denominator is bounded below. Integrating over the cells gives a bound $C v sum_j \| Q_F \( u_j + i v \) \| lt.eq C parallel L^n parallel$ for this arc. Four arcs obtained by applying the same argument to $e^(- i a) f \( e^(i a) zeta \)$ cover the circle. All constants are independent of $f$. Finally $n \/ log \( 1 \/ \( 1 - r \) \) arrow.r 1 \/ log 2$; use (8), take each map’s limit superior, and then take the supremum. ◻
]

== 3 A weighted affine law <sec:law>

We next turn excessive operator growth into an exact scaling identity for a probability law. For the remainder of the argument suppose, toward a contradiction, that

#[#set math.equation(numbering: n => "(9)")
 $ beta gt.eq 1 \/ 4 . $ <eq:contrary>]

All laws below are constructed at this fixed exponent.

#thm([Proposition 3.1.])[
  (Exact-parameter affine law).  #emph[Assume $beta = log_2 rho gt.eq 1 \/ 4$, where $rho$ is defined in (8). There is a Borel probability $P$ on $cal(K)$ such that, writing $bb(E)$ for expectation under $P$, 
#[#set math.equation(numbering: n => "(10)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] \| Q_F \( x + i y \) \| thin Phi \( T_(x + i y) F \) #scale(x: 120%, y: 120%)[\]] = y^(- beta) bb(E) Phi \( F \) $ <eq:law>]

 for every $x + i y in bb(H)$ and every nonnegative Borel test $Phi : cal(K) arrow.r \[ 0 \, oo \]$.]
] <prop:law>

#proof[
  We use the representation of positive functionals on continuous functions of a compact metric space by Borel measures #cite(label("Folland")) Theorem 7.2. Compactness of probabilities follows by taking a diagonal limit on a countable dense family of continuous tests and applying this representation theorem.
  #emph[The operator eigenmeasure.] First construct a probability $mu$ with $mu L = rho mu$, where measures act on the left as integration functionals. For $tau > rho$, the series
  $ R_tau = sum_(n gt.eq 0) tau^(- n) L^n \, #h(2em) g_tau = R_tau 1 \, #h(2em) M_tau = max g_tau $
  converges in operator norm. Since
  $ L g_tau = tau \( g_tau - 1 \) lt.eq tau \( 1 - 1 \/ M_tau \) g_tau \, #h(2em) 1 lt.eq g_tau lt.eq M_tau \, $
  positivity gives $parallel L^n parallel lt.eq M_tau \[ tau \( 1 - 1 \/ M_tau \) \]^n$. Thus $rho lt.eq tau \( 1 - 1 \/ M_tau \)$, so $M_tau gt.eq tau \/ \( tau - rho \) arrow.r oo$. At a maximizer $F_tau$ of $g_tau$, the functional $mu_tau = delta_(F_tau) R_tau \/ M_tau$ is a probability and
  $ mu_tau L = tau mu_tau - tau / M_tau delta_(F_tau) . $
  A weak limit as $tau arrow.b rho$ gives the required $mu$.
  #emph[Horizontal and scale averages.] The composition law gives $A_(u + i v) A_(2 + i) = A_(u + 2 v + i v)$: right translation by $2$ shifts the grid in (7) by one cell of width $2 v$. Using $mu = rho^(- n) mu L^n$, all but the two endpoint terms cancel:
  $ mu A_(2 + i) - mu = rho^(- n) v #scale(x: 120%, y: 120%)[\(] mu A_(1 + v + i v) - mu A_(- 1 + v + i v) #scale(x: 120%, y: 120%)[\)] . $
  The norm of this difference is at most $2 C rho^(- n)$ by (5), and tends to zero because $beta > 0$. Therefore $mu A_(2 + i) = mu$. It follows that $t mapsto mu A_(t + i h)$ has period two for every fixed $h > 0$.
  Define $macron(mu) = 1 / 2 integral_0^2 mu A_(x + i) thin d x$ on continuous tests. Periodicity gives $accent(mu A, ‾)_(s + i) = macron(mu)$ for all $s in bb(R)$. Moreover,
  $ rho macron(mu) = 1 / 2 integral_0^2 mu L A_(x + i) thin d x = 1 / 2 integral_(- 1 \/ 2)^(3 \/ 2) mu A_(t + i \/ 2) thin d t = accent(mu A, ‾)_(i \/ 2) . $
  The middle equality uses $t = - 1 \/ 2 + x \/ 2$ and $t = 1 \/ 2 + x \/ 2$ for the two summands of $L$; the last uses period two. Consequently $h^beta accent(mu A, ‾)_(i h)$ is multiplicatively two-periodic in $h > 0$. Each of these functionals is horizontally invariant on the right, because $A_(i h) A_(s + i) = A_(h s + i) A_(i h)$. The functional
  $ nu = integral_1^2 h^beta accent(mu A, ‾)_(i h) thin frac(d h, h) $
  has finite, strictly positive mass by compact-family continuity. Periodicity and the substitution $u = h y$ give $nu A_(i y) = y^(- beta) nu$. Horizontal invariance persists, so normalization of $nu$ gives (10) for continuous tests. For each fixed $x + i y$, the two sides define finite Borel measures (one is a weighted pushforward). Equality on continuous tests makes them equal as measures, proving the assertion for all nonnegative Borel tests. ◻
]

The law now supplies the differential moments needed for the signed Jacobian comparison. For $z = x + i y$, define

#[#set math.equation(numbering: n => "(11)")
 $ q_F \( z \) = i y thin frac(Q'_F \( z \), Q_F \( z \)) = - i y thin frac(F'' \( z \), F' \( z \)) = a_F \( z \) + i b_F \( z \) \, #h(2em) k = frac(beta + 2, 3) . $ <eq:qk>]

Thus $3 \( k - 1 \) = beta - 1$ and $3 \/ 4 lt.eq k lt.eq 1$. Equation (6) implies $q_(T_z F) \( w \) = q_F \( z dot.op w \)$.

#thm([Lemma 3.2.])[
  (Logarithmic-derivative moments).  #emph[The law satisfies 
#[#set math.equation(numbering: n => "(12)")
 $ bb(E) a_F \( i \) = - beta \, #h(2em) bb(E) \| q_F \( i \) \|^2 = beta \( beta + 1 \) . $ <eq:moments>]

]
] <lem:moments>

#proof[
  The constant test in (10) gives $bb(E) \| Q_F \( x + i y \) \| = y^(- beta)$. Since $log \| Q_F \|$ is harmonic,
  $ partial_y \| Q_F \| = frac(\| Q_F \| a_F, y) \, #h(2em) Delta \| Q_F \| = \| Q_F \| lr(|Q'_F / Q_F|)^2 . $
  Differentiate at $i$, where $Q_F \( i \) = 1$. Lemma 3 and local nonvanishing give the uniform smoothness bounds needed to differentiate under expectation. ◻
]

== 4 Compact superlevels for almost every target <sec:escape>

The affine law must next control escape in the source half-plane. Our objective is compactness of positive superlevels, which will make the subsequent critical-point counts finite above each positive value. For $F in cal(K)$ and $xi in bb(C)$, put

$ V_xi^F \( x + i y \) = frac(y^k, \| F \( x + i y \) - xi \|) \, $

with value $+ oo$ at the possible pole. The choice $3 k = beta + 2$ lets a submean estimate for $\| 1 \/ F \|^3$ convert the weighted area tail below into decay of $V_0^F$ at source infinity. We write $d A$ for planar Lebesgue area.

#thm([Proposition 4.1.])[
  (Compact positive superlevels).  #emph[For $P$-almost every $F$, and then for area-almost every $xi in bb(C)$, every closed positive superlevel ${ V_xi^F gt.eq delta }$, $delta > 0$, is compact in $bb(H)$.]
] <prop:compact-levels>

We prove this by controlling infinity and then the real boundary. The order of these two controls is useful: the first supplies a horizontal preimage-length bound for the second. That bound is uniform in the height, with the map and compact target set fixed.

#thm([Lemma 4.2.])[
  (The weighted area tail).  #emph[Writing $S_0 = { z in bb(H) : \| m \( z \) \| gt.eq 1 \/ 2 }$, almost every $F$ satisfies 
#[#set math.equation(numbering: n => "(13)")
 $ I \( F \) := integral_(S_0) y^beta \| F \( z \) \|^(- 3) thin d A \( z \) < oo . $ <eq:area-tail>]

]
] <lem:area-tail>

#proof[
  For fixed $z eq.not i$, apply (10) to $Phi \( F \) = \| F \( z^(\#) \) \|^(- 3)$. The identity $\( T_z F \) \( z^(\#) \) = - F \( z \) Q_F \( z \) \/ y$ gives
  $ bb(E) #scale(x: 120%, y: 120%)[\[] \| F' \( z \) \|^2 \| F \( z \) \|^(- 3) #scale(x: 120%, y: 120%)[\]] = y^(- beta - 3) bb(E) \| F \( z^(\#) \) \|^(- 3) . $
  The integral of the left side over $S_0$ is uniformly finite: by injectivity and (5), it is bounded by $integral_(\| omega \| gt.eq c) \| omega \|^(- 3) thin d A \( omega \)$. The involution $z mapsto z^(\#)$ preserves $\| m \( z \) \|$, inverts the height, and has absolute Jacobian $y^(- 3)$. Changing variables on the right leaves exactly the weight $y^beta$. Tonelli proves finite expectation of $I$, hence the assertion. ◻
]

#thm([Lemma 4.3.])[
  (Escape at infinity and horizontal length).  #emph[If $I \( F \) < oo$, then 
#[#set math.equation(numbering: n => "(14)")
 $ frac(y^k, \| F \( x + i y \) \|) arrow.r 0 #h(2em) upright("as ") \| x \| + y arrow.r oo . $ <eq:infinity>]

 For every compact target set $K$, its preimage restricted to $y gt.eq epsilon.alt > 0$ is compact, its whole preimage has bounded height, and 
#[#set math.equation(numbering: n => "(15)")
 $ sup_(s > 0) integral_(bb(R)) upright(bold(1))_K \( F \( x + i s \) \) thin d x < oo . $ <eq:horizontal>]

]
] <lem:infinity>

#proof[
  If $w = x' + i y' in B \( z \, y \/ 2 \)$, then $y \/ 2 lt.eq y' lt.eq 3 y \/ 2$ and $\| x \| + y lt.eq \| x' \| + 3 y'$. Thus these disks escape every bounded $\| x' \| + y'$ region as their centers do. The complement of $S_0$ is bounded, so the disks are eventually contained in $S_0$ and avoid the zero of $F$. Submean for $\| 1 \/ F \|^3$, together with $3 k = beta + 2$, gives
  $ (frac(y^k, \| F \( z \) \|))^3 lt.eq C_beta integral_(B \( z \, y \/ 2 \)) \( "Im" w \)^beta \| F \( w \) \|^(- 3) thin d A \( w \) . $
  The right side tends to zero as a tail of (13). For $\| F \( z \) \|$ bounded and $y gt.eq epsilon.alt$, this excludes source infinity, proving strip compactness. It also excludes unbounded heights in the whole preimage of $K$.
  Choose a nonnegative smooth compactly supported $psi gt.eq upright(bold(1))_K$ and put $H \( y \) = integral_(bb(R)) psi \( F \( x + i y \) \) thin d x$. For fixed $s > 0$, the support in $y gt.eq s \/ 2$ is compact by the strip assertion. Hence differentiation and integration by parts give
  $ H \( s \) & = integral_s^oo \( y - s \) H'' \( y \) thin d y\
 & = integral_(y > s) \( y - s \) \| F' \( z \) \|^2 \( Delta psi \) \( F \( z \) \) thin d A \( z \) . $
  Here the integral of $partial_(x x) \( psi compose F \)$ is zero and $Delta \( psi compose F \) = \| F' \|^2 \( Delta psi \) compose F$. If $Y_psi$ bounds the preimage heights of $"supp" psi$, the absolute value is at most
  $ Y_psi integral_(bb(H)) \| F' \( z \) \|^2 \| \( Delta psi \) \( F \( z \) \) \| thin d A \( z \) lt.eq Y_psi integral_(bb(C)) \| Delta psi \| thin d A . $
  The last inequality uses injectivity, and the bound is independent of $s$. This proves (15). ◻
]

#proof[
  Fix $F$ satisfying Lemma 8. The preceding lemma controls source infinity. It remains to control approach to the real boundary, uniformly in the horizontal coordinate for almost every target. For omitted targets, meaning $xi in.not F \( bb(H) \)$, restrict to $\| xi \| lt.eq R$ and fix $delta > 0$. At scale $h = 2^(- ell)$, $ell gt.eq 0$, partition the line into cells $\[ j h \, \( j + 1 \) h \)$. Mark a cell if some point $z = x + i y$ with $x$ in that cell and $h lt.eq y lt.eq 2 h$ satisfies $\| F \( z \) - xi \| lt.eq y^k \/ delta$ for at least one such omitted target. At a witness, (4) on $B \( z \, y \)$ gives $y \| F' \( z \) \| lt.eq 4 \| F \( z \) - xi \|$. For every $x'$ in the same cell, the rebased point $\( x' - x \) \/ y + i h \/ y$ belongs to the compact rectangle $\[ - 1 \, 1 \] + i \[ 1 \/ 2 \, 1 \]$. Lemma 3 applied to $T_z F$ therefore gives
  #[#set math.equation(numbering: n => "(16)")
   $ \| F \( x' + i h \) - xi \| lt.eq C_delta h^k . $ <eq:cell-cover>]
  This bound holds for every witness and its target.
  Each marked cell’s entire segment at height $h$ is mapped into ${ \| omega \| lt.eq R + C_delta }$. Equation (15) thus bounds the number of marked cells by $C \/ h$. Disks of radius $C_delta h^k$ centered at their midpoint images cover all targets witnessed at this scale, and have summed area $O \( h^(2 k - 1) \)$. The sum over dyadic scales is finite because $k > 1 \/ 2$. The limsup of these measurable covering unions has area zero. Taking integer $R > 0$ and $delta = 1 \/ n$, $n gt.eq 1$, shows that for almost every omitted target,
  $ sup_x V_xi^F \( x + i y \) arrow.r 0 #h(2em) \( y arrow.b 0 \) . $
  Indeed a failure at arbitrarily small heights gives witnesses in infinitely many dyadic bands for one such threshold.
  If $xi in F \( bb(H) \)$, a small closed disk about $xi$ contained in $F \( bb(H) \)$ has compact inverse image under the homeomorphism onto the image. Below its minimum preimage height, $\| F \( z \) - xi \|$ is uniformly positive, giving the same limit. At heights bounded below, (14) gives $\| F \( z \) \| arrow.r oo$ and $V_xi^F \( z \) arrow.r 0$ at source infinity. Finally ${ V_xi^F gt.eq delta }$ is relatively closed, since it is ${ \| F \( z \) - xi \| lt.eq y^k \/ delta }$, also at a pole. The two escape exclusions prove its compactness. ◻
]

== 5 Critical points and strict pairing <sec:pairing>

For $P$-almost every map and area-almost every target, our next goal is to pair each saddle of the potential with a higher non-pole local maximum. Compact superlevels and nondegeneracy will supply finite critical-point counts above positive levels.

=== 5.1 The critical map <the-critical-map>

Define the smooth real map and its normalized signed Jacobian by

#[#set math.equation(numbering: n => "(17)")
 $ G_F \( z \) = F \( z \) - frac(i y F' \( z \), k) \, #h(2em) J_F \( z \) = frac(det D G_F \( z \), \| F' \( z \) \|^2) . $ <eq:G>]

Its real derivative columns are $\( F' \/ k \) \( k + q_F \)$ and $\( i F' \/ k \) \( k - 1 + q_F \)$. Consequently

#[#set math.equation(numbering: n => "(18)")
 $ k^2 J_F = k \( k - 1 \) + \( 2 k - 1 \) a_F + \| q_F \|^2 \, #h(2em) k^2 bb(E) J_F \( i \) = frac(\( 4 beta - 1 \) \( beta + 2 \), 9) . $ <eq:Jacobian>]

The second identity uses (12) and $k = \( beta + 2 \) \/ 3$.

Off the possible pole, write $ell = log V_xi^F$ and $r_0 = F' \/ \( F - xi \)$. Then

$ Delta ell = - k \/ y^2 \, #h(2em) \( ell_x \, ell_y \) = \( - "Re" r_0 \, med k \/ y + "Im" r_0 \) . $

Critical points are therefore exactly the preimages $G_F \( z \) = xi$. A pole is not such a preimage. At a critical point,

#[#set math.equation(numbering: n => "(19)")
 $ V_xi^F \( z \) = k y^(k - 1) \| Q_F \( z \) \| \, #h(2em) r'_0 = frac(k \( k + q_F \), y^2) . $ <eq:critical-value>]

Since $3 \( k - 1 \) = beta - 1$, cubing the critical value produces $k^3 y^(beta - 1) \| Q_F \( z \) \|^3$. This is the weight, up to the constant $k^3$, that the target change of variables in Section 6 will assign to each critical point. Direct differentiation yields

#[#set math.equation(numbering: n => "(20)")
 $ "Hess" ell = k / y^2 mat(delim: "(", - \( k + a_F \), b_F; b_F, k - 1 + a_F) \, #h(2em) det "Hess" ell = - k^4 / y^4 J_F . $ <eq:hessian>]

Its trace is negative. Thus $J_F > 0$ gives a nondegenerate saddle, and $J_F < 0$ a nondegenerate local maximum. We call the latter a #emph[finite maximum], excluding a pole.

=== 5.2 Good targets <good-targets>

Let $cal(G) subset cal(K) times bb(C)$ be the set of pairs $\( F \, xi \)$ for which all positive closed superlevels of $V_xi^F$ are compact, $xi$ is a regular value of $G_F$, and distinct preimages under $G_F$ have distinct $V_xi^F$-values. We call these pairs #emph[good].

#thm([Lemma 5.1.])[
  (Generic targets and Borel goodness).  #emph[Goodness is Borel in $\( F \, xi \)$. For $P$-almost every $F$, area-almost every $xi$ is good.]
] <lem:good>

#proof[
  The superlevel assertion is Proposition 7. For any fixed $F$, singular values of $G_F$ have area zero. This is the plane case of Sard’s theorem #cite(label("Sard")) Theorem 4.1. Here is the elementary estimate needed for this smooth plane map. On a compact source box, cover singular points by grid squares of side $h$. Linearize at one singular point of each square. Bounded second derivatives put its image in an $O \( h^2 \)$-neighborhood of a segment of length $O \( h \)$. Its area is $O \( h^3 \)$. There are $O \( h^(- 2) \)$ squares, giving total area tending to zero. Exhaust the source by compact boxes.
  Cover the nonsingular locus by countably many inverse-function charts. On an overlap where two branches $z_1 \( xi \) \, z_2 \( xi \)$ are distinct, the target differential of their critical log values is
  $ d_xi #scale(x: 120%, y: 120%)[\[] log V_xi^F \( z_j \( xi \) \) #scale(x: 120%, y: 120%)[\]] \( v \) = "Re" frac(v, F \( z_j \( xi \) \) - xi) . $
  The source derivative vanishes by criticality. The two linear functionals differ by injectivity of $F$. Hence the difference of log values has nonzero differential, and its zero set is locally a smooth curve. Countably many chart pairs give an area-null tie set.
  For measurability, use $C_m = { \| x \| lt.eq m \, med 1 \/ m lt.eq y lt.eq m }$. For every integer $n gt.eq 1$, require the open set ${ V_xi^F > 1 \/ n } = { \| F \( z \) - xi \| < n y^k }$ to lie in some $C_m$. Failure of a given containment is detected at rational-coordinate points outside the closed box. This is a Borel test. It is equivalent to compactness of all closed positive superlevels: for a closed level choose a strictly smaller reciprocal-integer threshold and use relative closedness.
  Failures of regularity or absence of ties are witnessed by one or two points in a common $C_m$. For a tied pair impose separation at least $1 \/ n$, and test the values by the continuous expression in (19). Equality conditions and this separation condition have closed parameter projections because the source boxes are compact. Countably many $m \, n$ prove the other Borel tests. ◻
]

If $t in bb(H)$, $Y = "Im" t$, and $eta = \( xi - F \( t \) \) \/ \( Y F' \( t \) \)$, direct calculation gives

#[#set math.equation(numbering: n => "(21)")
 $ G_(T_t F) \( w \) & = frac(G_F \( t dot.op w \) - F \( t \), Y F' \( t \)) \, & J_(T_t F) \( w \) & = J_F \( t dot.op w \) \,\
V_eta^(T_t F) \( w \) & = Y^(1 - k) \| F' \( t \) \| thin V_xi^F \( t dot.op w \) . &  & $ <eq:G-action>]

Thus goodness corresponds in both directions under rebasing.

=== 5.3 The superlevel count <the-superlevel-count>

#thm([Lemma 5.2.])[
  (The superlevel index count).  #emph[For a good pair and $h > 0$, 
#[#set math.equation(numbering: n => "(22)")
 $ \# { z : med z upright(" is a finite maximum") \, med V_xi^F \( z \) gt.eq h } med gt.eq med \# { z : med z upright(" is a saddle") \, med V_xi^F \( z \) gt.eq h } . $ <eq:count>]

 Both counts are finite.]
] <lem:count>

#proof[
  The fiber $G_F^(- 1) \( xi \)$ is closed and discrete, and the closed positive superlevel is compact. This proves finiteness. There can be no accumulation at a pole either, because a pole is not on the fiber.
  First count in $U = { V_xi^F > lambda }$ for a positive regular level $lambda$. We will show that each component is bounded by one simple closed curve and has total gradient index one, giving
  #[#set math.equation(numbering: n => "(23)")
   $ \# upright("components") = \# upright("finite maxima") - \# upright("saddles") + \# upright("poles") quad upright("in ") U . $ <eq:index-count>]
  The boundary of $U$ is the compact smooth one-manifold ${ V_xi^F = lambda }$, away from any pole. It is a finite disjoint union of smooth simple closed curves. For detail, the components are open in this compact manifold, so there are finitely many. Each component is one orbit of the smooth unit tangent field obtained by rotating $nabla ell \/ \| nabla ell \|$. The orbits are complete and open. A nonperiodic single orbit would be a bijective local homeomorphism from $bb(R)$ to the compact component, which is impossible. Its least period gives a simple closed curve.
  The bounded Jordan interior of each curve has closure in $bb(H)$: the region below the curve’s minimum height lies in the unbounded complement. Everywhere inside, $V_xi^F > lambda$. Otherwise $ell$ would have an interior minimum, contrary to $Delta ell = - k \/ y^2 < 0$. If a pole is present, remove a sufficiently small neighborhood where $ell$ is large before taking this minimum. Thus curves cannot be nested, and their interiors are exactly the components of $U$. Indeed each component meets the level boundary, has its superlevel side locally inside one of the curves, and cannot leave that interior without crossing the level.
  On each positively oriented curve, $nabla ell$ points inward and has winding one. We recall the tangent-turning argument of Hopf #cite(label("Hopf")) Section 2. Parametrize a simple regular curve by $gamma : \[ 0 \, 1 \] arrow.r bb(C)$, with matching endpoint derivatives, starting at a leftmost point. The positive tangent initially points down. The unit secant direction from $gamma \( s \)$ to $gamma \( t \)$, $0 lt.eq s lt.eq t lt.eq 1$, extends continuously to the diagonal by the tangent, and to $\( 0 \, 1 \)$ by the negative initial tangent. Lift its angle continuously on this triangle. On $\( 0 \, t \)$ it lies in the closed right semicircle and changes angle by $pi$. On $\( s \, 1 \)$ it is the negative of the direction at $\( 0 \, s \)$, giving another $pi$. The diagonal therefore records tangent winding one, unchanged for the inward normal.
  Remove disjoint small disks about the finitely many critical points and possible pole in each component. Stokes applied to the closed angle form
  $ frac(X_1 thin d X_2 - X_2 thin d X_1, \| X \|^2) \, #h(2em) X = nabla ell \, $
  shows that the sum of interior indices is one. At a nondegenerate critical point the index is the sign of the Hessian determinant, hence $+ 1$ for a maximum and $- 1$ for a saddle. At the pole $z_0$, $ell = - log \| z - z_0 \| + upright("a smooth function")$, giving index $+ 1$. Summing over components proves (23). There is at most one pole; if present it belongs to a component. Thus the finite-maximum count is at least the saddle count. This also covers the empty superlevel.
  Finally choose a regular $lambda < h$ with no critical value in $\[ lambda \, h \)$. Such a choice is possible by finiteness above $h \/ 2$. The counts in $U$ are then the counts in (22). ◻
]

=== 5.4 Measurable rank pairing <measurable-rank-pairing>

The count gives an intrinsic assignment: match the two decreasing lists by rank. Measurability requires a separate argument, because we will integrate the assignment over maps and source points. General countable-section uniformization is supplied by the Lusin–Novikov theory; see #cite(label("Moschovakis")) 4F.6 and 4F.17. In the present setting, local inverse branches give an elementary enumeration, while intrinsic ranks ensure equivariance.

#thm([Proposition 5.3.])[
  (Strict measurable rank pairing).  #emph[On the Borel domain 
$ cal(D) = { \( F \, z \) : J_F \( z \) > 0 \, med \( F \, G_F \( z \) \) in cal(G) } $

 there is a Borel assignment $R_F \( z \)$ to a finite maximum over the same target, injective on each target fiber, such that 
#[#set math.equation(numbering: n => "(24)")
 $ V_(G_F \( z \))^F \( R_F \( z \) \) > V_(G_F \( z \))^F \( z \) . $ <eq:strict-value>]

 It is equivariant: 
$ R_F \( t dot.op w \) = t dot.op R_(T_t F) \( w \) $

 on the corresponding domains.]
] <prop:pair>

#proof[
  On each good fiber order saddles by decreasing critical value, and separately order finite maxima the same way. Each point has finitely many predecessors. A nonempty list has a first point: choose any one point and inspect the finite nonempty set at or above its value. Repeating gives integer ranks for all points. Lemma 11 supplies at least as many maxima as saddles at or above each saddle’s value. Pair the saddle of rank $j$ with the maximum of rank $j$. No ties are allowed, so the paired value is strictly larger, as illustrated in Figure 1. Different ranks give different partners. Equation (21) preserves ranks, proving equivariance.
  We prove the measurability assertion directly using the nonsingularity of each root. The nonsingular solution graph $G_F \( z \) = xi \, med J_F \( z \) eq.not 0$ has countably many continuous local root branches $b_j \( F \, xi \)$, defined on open parameter sets. To obtain a branch near $\( F_0 \, xi_0 \, z_0 \)$, set $M = D G_(F_0) \( z_0 \)$. On a sufficiently small closed source ball,
  $ w mapsto w - M^(- 1) \( G_F \( w \) - xi \) $
  has Lipschitz constant at most $1 \/ 2$ for all nearby parameters. Shrinking the parameter neighborhood makes the displacement of the center less than half the radius. The map is a contraction of the ball into itself, with a unique interior nonsingular root. Compactness and uniqueness imply continuous dependence on the parameters. These branches form relatively open graph patches; second countability of $cal(K) times bb(C) times bb(H)$ gives a countable cover.
  At each parameter activate branch $j$ only when it is defined and its value differs from every earlier defined branch value. This Borel test enumerates each root once. The signs of $J$, critical values (19), and comparisons of such values are Borel. On good fibers, counting active predecessors of the same sign gives Borel integer ranks. Selecting the unique active negative-sign branch of the same rank as a given active positive-sign branch is therefore Borel. Substitute $xi = G_F \( z \)$ to obtain the claimed assignment. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 3.64), [Saddles])
  content((3.5, 3.64), [Finite maxima])
  circle((0, 2.665), radius: 0.07484, fill: black, stroke: none)
  content((-0.03528, 2.665), [$s_1$], anchor: "east")
  circle((3.5, 3.12), radius: 0.07484, fill: black, stroke: none)
  content((3.535, 3.12), [$m_1$], anchor: "west")
  line((0, 2.665), (3.5, 3.12), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: ">"))
  circle((0, 1.495), radius: 0.07484, fill: black, stroke: none)
  content((-0.03528, 1.495), [$s_2$], anchor: "east")
  circle((3.5, 2.405), radius: 0.07484, fill: black, stroke: none)
  content((3.535, 2.405), [$m_2$], anchor: "west")
  line((0, 1.495), (3.5, 2.405), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: ">"))
  circle((0, 0.455), radius: 0.07484, fill: black, stroke: none)
  content((-0.03528, 0.455), [$s_3$], anchor: "east")
  circle((3.5, 1.885), radius: 0.07484, fill: black, stroke: none)
  content((3.535, 1.885), [$m_3$], anchor: "west")
  line((0, 0.455), (3.5, 1.885), stroke: (thickness: 0.6pt, miter-limit: 10), mark: (end: ">"))
  circle((3.5, 1.04), radius: 0.07484, fill: black, stroke: none)
  content((3.535, 1.04), [$m_4$], anchor: "west")
  line((5.6, 0), (5.6, 3.315), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: ">"))
  content((5.6, 3.315), [$V_ xi^F$], anchor: "south", padding: 0.1176cm)
})],
  caption: [Figure 1: Schematic rank ordering on one good fiber $G_F^(- 1) \( xi \)$. Both lists are ordered by decreasing critical value, and equal ranks are paired. Distinct critical values put each paired maximum strictly above its saddle. Heights represent values rather than spatial positions; the displayed counts and gaps are illustrative. ],
) <fig:ranks>

== 6 Strict weighted transport <sec:transport>

The pairing will imply $bb(E) J_F \( i \) lt.eq 0$, with equality only if $J_F \( i \) = 0$ almost surely. Comparing this conclusion with Equation (18) will reduce the contradiction to a rigidity argument.

Put $J_(F \, plus.minus) = max \( plus.minus J_F \, 0 \)$ and $omega_F \( z \) = y^(beta - 1) \| Q_F \( z \) \|$. For any fixed $F$ and nonnegative Borel $h$, local change of variables gives

#[#set math.equation(numbering: n => "(25)")
 $ integral_(bb(H)) h \( z \) omega_F \( z \) J_(F \, plus.minus) \( z \) thin d A \( z \) = integral_(bb(C)) #h(-0.16667em) sum_(G_F \( z \) = xi\
plus.minus J_F \( z \) > 0) h \( z \) y^(beta - 1) \| Q_F \( z \) \|^3 thin d A \( xi \) . $ <eq:area-formula>]

Indeed cover the indicated sign locus by countably many local diffeomorphism charts, disjointify into Borel pieces, and use absolute Jacobian $\| J_F \| \| F' \|^2$. No global properness of $G_F$ is required. At a preimage, (19) and $3 \( k - 1 \) = beta - 1$ give

#[#set math.equation(numbering: n => "(26)")
 $ y^(beta - 1) \| Q_F \( z \) \|^3 = \( V_xi^F \( z \) \/ k \)^3 . $ <eq:target-weight>]

#thm([Lemma 6.1.])[
  (Goodness at the normalized point).  #emph[The positive-Jacobian mass at the base point is supported on good fibers: 
#[#set math.equation(numbering: n => "(27)")
 $ bb(E) #scale(x: 120%, y: 120%)[\[] J_(F \, +) \( i \) upright(bold(1))_({ \( F \, G_F \( i \) \) upright(" not good") }) #scale(x: 120%, y: 120%)[\]] = 0 . $ <eq:base-good>]

]
] <lem:base-good>

#proof[
  For almost every $F$, bad targets have area zero by Lemma 10. Formula (25) therefore gives
  $ integral_({ \| x \| lt.eq 1 \, med 1 lt.eq y lt.eq 2 }) omega_F \( z \) J_(F \, +) \( z \) upright(bold(1))_({ \( F \, G_F \( z \) \) upright(" not good") }) thin d A \( z \) = 0 . $
  The product of $J_(F \, +)$ and the indicator equals its base-point version for $T_z F$, by (21)–(21). Take expectations and apply (10) and Tonelli. The spatial density is $d x thin d y \/ y$; its integral on this box is $2 log 2 > 0$. This proves (27). ◻
]

The weighted assertion is essential: $G_F \( i \) = - i \/ k$ for every $F$, so area-genericity alone says nothing about this fixed target. We need only the weighted conclusion, not almost-sure goodness at the base point without the Jacobian factor.

#thm([Proposition 6.2.])[
  (Strict weighted transport).  #emph[Assume $beta gt.eq 1 \/ 4$, let $P$ be the law of Proposition 5, and set $k = \( beta + 2 \) \/ 3$. Then $bb(E) J_F \( i \) lt.eq 0$. Equality is possible only if $J_F \( i \) = 0$ almost surely.]
] <prop:strict-transport>

#proof[
  For $N gt.eq 1$, restrict the pairing domain $cal(D)$ to $cal(D)_N$ by requiring, for $z' = R_F \( z \) = x' + i y'$,
  $ 1 \/ N lt.eq y' \/ y lt.eq N \, #h(2em) \| x' - x \| lt.eq N y . $
  These Borel sets increase to $cal(D)$, and their indicators at $\( F \, z \)$ equal their indicators at $\( T_z F \, i \)$. Define the equivariant Borel ratio
  $ c_F \( z \) = (frac(V_(G_F \( z \))^F \( R_F \( z \) \), V_(G_F \( z \))^F \( z \)))^3 > 1 quad upright("on ") cal(D) \, $
  and set it to zero elsewhere. For $S > 0$, $Y > 1$, use the boxes
  $ B = { \| x \| lt.eq S \, med 1 lt.eq y lt.eq Y } \, #h(2em) B' = { \| x \| lt.eq S + N Y \, med 1 \/ N lt.eq y lt.eq N Y } . $
  Every included saddle in $B$ has its partner in $B'$. On the target side of (25), multiplication by $c_F$ makes its weight exactly the partner’s weight by (26). Fiberwise injectivity of the pairing therefore proves, for every $F$,
  $ integral_B omega_F J_(F \, +) c_F upright(bold(1))_(cal(D)_N) \( F \, z \) thin d A \( z \) lt.eq integral_(B') omega_F J_(F \, -) thin d A \( z \) . $
  Take expectations and apply (10) to the equivariant nonnegative tests. The resulting inequality is
  $ 2 S log Y thin bb(E) \[ J_(F \, +) \( i \) c_F \( i \) upright(bold(1))_(cal(D)_N) \( F \, i \) \] lt.eq 2 \( S + N Y \) \( log Y + 2 log N \) thin bb(E) J_(F \, -) \( i \) . $
  Here $J_F \( i \)$ is bounded by compact-family continuity, so the right side is finite. At fixed $N$, first let $S arrow.r oo$, then $Y arrow.r oo$. Finally let $N arrow.r oo$ by monotone convergence. This gives
  $ A := bb(E) \[ J_(F \, +) \( i \) c_F \( i \) upright(bold(1))_(cal(D)) \( F \, i \) \] lt.eq d := bb(E) J_(F \, -) \( i \) . $
  Lemma 13 gives $b := bb(E) J_(F \, +) \( i \) = bb(E) \[ J_(F \, +) \( i \) upright(bold(1))_(cal(D)) \( F \, i \) \]$. Thus $b lt.eq A lt.eq d$, proving $bb(E) J_F \( i \) lt.eq 0$. If equality holds, then $b = d$ and
  $ 0 lt.eq bb(E) \[ J_(F \, +) \( i \) \( c_F \( i \) - 1 \) upright(bold(1))_(cal(D)) \( F \, i \) \] = A - b lt.eq 0 . $
  The integrand is strictly positive wherever $J_(F \, +) \( i \) > 0$ on $cal(D)$. Equation (27) removes positive mass outside this domain, so $b = 0$, and hence $d = 0$. No uniform positive gap in $c_F - 1$ is needed. ◻
]

== 7 The harmonic equality barrier and the uniform gap <sec:equality>

The moment identity and strict transport can coexist at $beta gt.eq 1 \/ 4$ only in the equality case $beta = 1 \/ 4$. We first rule out its deterministic consequence, an identically vanishing Jacobian, and then transfer that obstruction back to the law.

#thm([Lemma 7.1.])[
  (The harmonic equality barrier).  #emph[For $k = 3 \/ 4$, no $F in cal(K)$ has $J_F equiv 0$.]
] <lem:no-zero-J>

#proof[
  By (18), such a map would satisfy
  $ \| q_F \( z \) + 1 \/ 4 \|^2 = 1 \/ 4 . $
  Therefore $\| q_F \( z \) \| gt.eq 1 \/ 4$ and $\| F'' \( z \) \/ F' \( z \) \| gt.eq 1 \/ \( 4 y \)$. The pre-Schwarzian has no zeros, so $u = log \| F'' \/ F' \|$ is harmonic and $u gt.eq - log 4 - log y$. For $0 < epsilon.alt < 1 \/ 2$, the harmonic function
  $ b_epsilon.alt \( x \, y \) = - log 4 + log \( 1 \/ epsilon.alt \) cos \( pi x \/ 2 \) frac(sinh \( pi \( 1 - y \) \/ 2 \), sinh \( pi \/ 2 \)) $
  lies below $u$ on the boundary of $\[ - 1 \, 1 \] times \[ epsilon.alt \, 1 \]$. On its sides and top the added term is zero; on its bottom the cosine-sinh factor is between zero and one. The minimum principle gives $u gt.eq b_epsilon.alt$ inside. At $i \/ 2$, the coefficient of $log \( 1 \/ epsilon.alt \)$ is fixed and positive, contradicting finiteness as $epsilon.alt arrow.b 0$. ◻
]

#proof[
  Under (9), Equation (18) and Proposition 14 force $beta = 1 \/ 4$, $k = 3 \/ 4$, and $J_F \( i \) = 0$ almost surely. Apply (10) to the test $\| J_F \( i \) \|$. By (21) and the strictly positive weight $\| Q_F \( z \) \|$, $J_F \( z \) = 0$ almost surely at every fixed $z$. A countable dense set and continuity give $J_F equiv 0$ for almost every $F$, contradicting Lemma 15. Thus the single exponent in (8) satisfies $beta < 1 \/ 4$.
  Choose $b$ with $beta < b < 1 \/ 4$. The root limit in (8) supplies a constant $C_b$ such that $parallel L^n parallel lt.eq C_b 2^(b n)$ for all $n$. Proposition 4, with $2^(- n) lt.eq 1 - r < 2^(1 - n)$, then gives $M_(- 1) \[ f' \] \( r \) lt.eq C \( 1 - r \)^(- b)$, uniformly in $f in cal(S)$. Taking $epsilon = 1 \/ 4 - b$ proves (2) and the stated disproof. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
