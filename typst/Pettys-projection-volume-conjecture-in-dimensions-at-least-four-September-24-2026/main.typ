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

#align(center)[#text(size: 16pt, weight: "bold")[Petty's projection-volume conjecture \
in dimensions at least four]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

For a convex body $K subset bb(R)^n$, its projection body $Pi K$ is the origin-symmetric convex body whose support function is

$ h_(Pi K) \( u \) = "vol"_(n - 1) #scale(x: 120%, y: 120%)[\(] "proj"_(u^perp) K #scale(x: 120%, y: 120%)[\)] \, #h(2em) u in S^(n - 1) . $

Here a convex body is compact, convex, and has nonempty interior, and $h_L \( x \) = max_(y in L) ⟨x \, y⟩$ denotes its support function. Thus $Pi K$ records the volumes of the orthogonal shadows of $K$ in all directions. Write $\| L \| = "vol"_n \( L \)$ and let $B_2^m$ be the Euclidean unit ball in $bb(R)^m$, with volume $kappa_m$. The normalized projection volume is

$ R_n \( K \) = frac(\| Pi K \|, \| K \|^(n - 1)) . $

It is invariant under translations and invertible linear maps: the classical contravariance identity is $Pi \( T K \) = \| det T \| T^(- t) Pi K$; see [9] Equation (1). We verify this identity directly in Section 6.

Petty’s projection-volume conjecture asserts, for $n gt.eq 3$, that $R_n$ is minimized precisely by ellipsoids [16]. The ball satisfies $Pi B_2^n = kappa_(n - 1) B_2^n$, so the proposed minimum is fixed by the Euclidean case. This is an affine isoperimetric problem in which directional projection data are assembled into a second body before its volume is measured. The classical Petty inequality for the #emph[polar] of the projection body concerns a different functional; see [3] Section 18.6. We prove the unpolarized conjecture in every dimension at least four.

#thm([Theorem 1.1.])[
  #emph[For every integer $n gt.eq 4$ and every convex body $K subset bb(R)^n$, 
#[#set math.equation(numbering: n => "(1)")
 $ frac(\| Pi K \|, \| K \|^(n - 1)) gt.eq kappa_(n - 1)^(thin n) kappa_n^(thin 2 - n) . $ <eq:main>]

 Equality holds if and only if $K = a + T B_2^n$ for some $a in bb(R)^n$ and some invertible linear map $T$.]
] <thm:main>

The theorem includes bodies without symmetry or boundary regularity. Its equality assertion is global and imposes no proximity to an ellipsoid.

=== Previous results and methods <previous-results-and-methods>

One approach studies a body together with its second projection body. The class-reduction inequality $R_n \( Pi K \) lt.eq R_n \( K \)$, together with its equality condition, reduces the study of minimizers to bodies homothetic to $Pi^2 K$; see [17] Sections 1–2. Saroglou and Zvavitch proved a local minimum theorem under the hypothesis that the density of the surface-area measure, after an invertible linear change of variables, is sufficiently close to that of the ball in $L^oo$ [18] Theorem 1.3. Ivaki established local rigidity for $C^2$ solutions of $Pi^2 K = c K$ near the ball after an invertible linear change of variables [8]. These results use the harmonic structure of the projection operator and the special role of the directions arising from linear changes of coordinates.

Chen, Feng, Li, Xi, and Xu proved the unrestricted three-dimensional inequality, including ellipsoid equality [2] Theorem 1.1. Mielke-Sulz proved the conjecture for bodies of revolution in every dimension $n gt.eq 3$ [13]. Theorem 1 treats arbitrary convex bodies in the remaining dimensions. Combining it with the separately proved three-dimensional theorem of Chen et al. establishes the conjecture for every $n gt.eq 3$; that external theorem is not used in our proof for $n gt.eq 4$.

Lutwak reformulated the conjecture as a lower bound for a two-body integral with kernel $\| u dot.op v \|$ against surface-area measures [11]; see the explicit formulation in [17] Introduction, item (i). Our reduction uses the same pairing for a broader class of positive measures satisfying a lower bound on integrals of support functions.

Our proof uses the classical first-variation and spherical-transform frameworks, but requires estimates and an affine normalization that apply to arbitrary bodies. The Wulff variations are closely related to the Aleksandrov variations for dual curvature measures developed by Huang, Lutwak, Yang, and Zhang [5]. The variational representation of a support functional belongs to the $L_p$ dual Minkowski framework; compare Huang and Zhao [7]. We prove the needed representation directly, including its logarithmic endpoint. The cosine and Funk spectra are classical [14]; we derive their multipliers in our normalization. The further tasks are a strict estimate for all norms and a continuous choice of variational minimizers through changes of matrix rank. The latter permits a global choice of affine coordinates, where proximity to the ball is unavailable.

=== The argument <the-argument>

The proof passes from a body to a positive measure on vectors. After translating and normalizing $\| K \| = kappa_n$, the first variation of volume gives a bounded, spanning probability measure $eta_K$ on $bb(R)^n$ such that

$ integral h_M thin d eta_K gt.eq \( \| M \| \/ kappa_n \)^(1 \/ n) $

for every origin-symmetric convex body $M$. The same measure represents $h_(Pi K) \( y \)$ as a fixed multiple of $integral \| x dot.op y \| thin d eta_K \( x \)$. Theorem 19 bounds the pairing

$ integral.double \| x dot.op y \| thin d eta \( x \) d zeta \( y \) $

for any two bounded, spanning positive measures satisfying this support-functional inequality. Applying the result to the measures of $K$ and its volume-normalized projection body yields the desired lower bound. Sharpness in the pairing returns equality to the homothety case of the first variation of volume.

Two ingredients have statements independent of projection bodies. Theorem 11 bounds the higher spherical harmonics of a power of an arbitrary norm by a difference of its spherical means. The estimate is strict except for the Euclidean norm, and no smoothness is needed. Proposition 15 represents a positive support functional using the gradient of a variationally selected norm. A spherical sign test bounds the pairing below by a bilinear form involving the cosine and Funk transforms. The strict norm estimate controls the contribution of harmonics of degree at least four.

The degree-two component must be removed by choosing affine coordinates; it is not a zero eigenspace of the sign-test operator. Proposition 18 makes this choice by extending the family of variational minimizers continuously to singular matrices. At that boundary the gauges become seminorms. An explicit calculation in their missing directions gives an inward-pointing matrix field, and a fixed-point argument yields an invertible matrix at which the degree-two component vanishes. This position is needed for only one of the two measures. The other is transformed contragrediently, which preserves their pairing. These constructions and the strict norm estimate also supply the equality case.

Combining Theorem 1 with the separate three-dimensional result of Chen et al. gives several sharp inequalities in dimensions $n gt.eq 3$. Lutwak’s implication yields Euclidean-ball lower bounds for lower-degree projection-body ratios, in which intrinsic volumes replace the volumes of shadows. Haddad’s $p = 1$ implication bounds the integral of the absolute determinant of gradients below by the product of critical Lebesgue norms. Its diagonal case strengthens the Sobolev–Zhang affine $L^1$ inequality. The theorem also gives the sharp Holmes–Thompson isoperimetric inequality in normed spaces, where equality requires an ellipsoidal norm ball and a body homothetic to it. The full statements below distinguish the hypotheses and equality conclusions of these consequences.

Section 2 establishes the volume and gauge facts used in the reduction. Section 3 derives the sign test and its harmonic multipliers. Section 4 proves the strict norm estimate, including the scalar inequalities in every dimension. Section 5 constructs the variational representation and affine position. Section 6 proves the bilinear inequality and deduces Theorem 1. Section 7 develops its consequences. We use the classical Brunn–Minkowski inequality with its homothety equality case and Brouwer’s fixed-point theorem in their stated forms; the first-variation reduction, harmonic estimates, variational construction, and equality argument are proved below.

=== Notation <notation>

Throughout Sections 2–6, $n gt.eq 4$, $p = n - 1$, and $sigma$ is uniform probability on $S^(n - 1)$. The symbol $bb(E)_sigma$ denotes integration against $sigma$, and

$ b_n = bb(E)_sigma \| u_1 \| . $

Repeated spherical integrals use independent directions. A symmetric body always means an origin-symmetric body. When a function on the sphere is used as a degree-one homogeneous test on vectors, it is extended by positive homogeneity and given value zero at the origin. Euclidean gradients are denoted by $nabla$; the tangential gradient and Laplacian are $nabla_S$ and $Delta_S$.

== 2 Gauges and projection measures <sec:gauges>

We first associate a measure to an arbitrary convex body. A volume variation will give both the lower bound satisfied by this measure and its relation to the projection body. No symmetry of the original body is needed.

=== 2.1 Differentiating a gauge <differentiating-a-gauge>

For a convex body $L$ containing the origin in its interior, its #emph[gauge] is

$ g_L \( x \) = inf { a > 0 : x in a L } . $

It is convex and positively homogeneous, and $L = { x : g_L \( x \) lt.eq 1 }$. When $L$ is origin-symmetric, its gauge is a norm. A continuous function $phi.alt$ on $S^(n - 1)$, when evaluated at a vector, will mean its positively homogeneous extension

$ phi.alt \( x \) = \| x \| phi.alt \( x \/ \| x \| \) quad \( x eq.not 0 \) \, #h(2em) phi.alt \( 0 \) = 0 . $

This convention does not impose evenness on $phi.alt$.

Varying the supporting constraints in this way is a Wulff variation. The almost-everywhere radial differentiation below is the gauge form of the Aleksandrov variation used in dual Brunn–Minkowski theory; compare [5] Lemmas 4.1–4.3 and Corollary 4.9. We give the argument directly because the later minimization uses arbitrary continuous constraints of both signs, without boundary regularity.

#thm([Lemma 2.1.])[
  (Gauge variation).  #emph[Let $s : S^(n - 1) arrow.r \( 0 \, oo \)$ and $phi.alt : S^(n - 1) arrow.r bb(R)$ be continuous. For sufficiently small $\| t \|$, define 
$ W_t = ⋂_(v in S^(n - 1)) { x in bb(R)^n : x dot.op v lt.eq s \( v \) + t phi.alt \( v \) } \, #h(2em) g_t = g_(W_t) . $

 Then $W_t$ is a convex body containing the origin in its interior, and 
#[#set math.equation(numbering: n => "(2)")
 $ g_t \( x \) = max_(v in S^(n - 1)) frac(x dot.op v, s \( v \) + t phi.alt \( v \)) \, #h(2em) frac(\| W_t \|, kappa_n) = bb(E)_sigma g_t \( u \)^(- n) . $ <eq:gauge-formulas>]

 For almost every $u in S^(n - 1)$, the maximizing vector $v \/ s \( v \)$ at $t = 0$ is unique and equals the Euclidean gradient $nabla g_0 \( u \)$. At these directions, 
#[#set math.equation(numbering: n => "(3)")
 $ frac(d, d t)\|_(t = 0) g_t \( u \) = - g_0 \( u \) phi.alt #scale(x: 120%, y: 120%)[\(] nabla g_0 \( u \) #scale(x: 120%, y: 120%)[\)] . $ <eq:gauge-derivative>]

 On the sphere the gauges are uniformly bounded above and away from zero for small $\| t \|$, and the difference quotients $\( g_t - g_0 \) \/ t$ are uniformly bounded. In particular, 
#[#set math.equation(numbering: n => "(4)")
 $ frac(d, d t)\|_(t = 0) \| W_t \| = n kappa_n bb(E)_sigma #h(-0.16667em) [g_0 \( u \)^(- n) phi.alt #scale(x: 120%, y: 120%)[\(] nabla g_0 \( u \) #scale(x: 120%, y: 120%)[\)]] . $ <eq:constraint-volume-derivative>]

 For $s = h_L$, one has $W_0 = L$.]
] <lem:gauge-variation>

#proof[
  Choose $0 < m lt.eq s \( v \) lt.eq M$. For small $\| t \|$ the constraints $s + t phi.alt$ lie between $m \/ 2$ and some fixed finite constant $M'$. Consequently
  $ \( m \/ 2 \) B_2^n subset W_t subset M' B_2^n . $
  The defining inequalities show that $x in a W_t$ precisely when $x dot.op v lt.eq a \( s \( v \) + t phi.alt \( v \) \)$ for every $v$. Taking the least such $a$ gives the maximum formula in (2). The radial function of $W_t$ is $1 \/ g_t \( u \)$, so polar integration, with spherical area $n kappa_n$, gives the volume formula. If $s = h_L$, separation identifies the defining intersection with $L$.
  For completeness, the maximum formula also gives the differentiability needed here without any regularity assumption on the boundary of $W_0$. The function $g_0$ is convex and Lipschitz: it is the maximum of linear functions whose coefficient vectors $v \/ s \( v \)$ form a compact set. On every coordinate line, a finite convex function has a derivative except on a set of one-dimensional measure zero. Slicing therefore shows that all coordinate partial derivatives of $g_0$ exist at almost every point of $bb(R)^n$. If a vector $w = v \/ s \( v \)$ attains the maximum at such a point $x$, then
  $ g_0 \( x + h e_i \) gt.eq g_0 \( x \) + h w_i #h(2em) \( h in bb(R) \) . $
  The two signs of $h$ imply $w_i = partial_i g_0 \( x \)$ for every $i$. Thus the maximizing vector is unique.
  Uniqueness implies differentiability. Indeed, if $w_z$ maximizes at $x + z$ and $w$ maximizes at $x$, compactness and continuity imply $w_z arrow.r w$ as $z arrow.r 0$. The maximum formula gives
  $ 0 lt.eq g_0 \( x + z \) - g_0 \( x \) - w dot.op z lt.eq \( w_z - w \) dot.op z = o \( \| z \| \) . $
  The nondifferentiability set away from the origin is invariant under positive dilations, by homogeneity. Since it has Lebesgue measure zero, polar integration shows that its intersection with $S^(n - 1)$ has $sigma$-measure zero.
  Fix a differentiability direction $u$, and let $v_0$ maximize at $t = 0$. Uniqueness of $v_0 \/ s \( v_0 \)$ implies uniqueness of $v_0$ itself, since $s$ is positive. Every maximizing direction $v_t$ for $g_t \( u \)$ tends to $v_0$ as $t arrow.r 0$. The derivatives with respect to $t$ of the functions
  $ \( u \, v \, t \) mapsto frac(u dot.op v, s \( v \) + t phi.alt \( v \)) $
  are continuous on the relevant compact set. Comparing the maxima at $t$ and $0$, using $v_t$ and $v_0$, therefore gives
  $ frac(d, d t)\|_0 g_t \( u \) = - frac(\( u dot.op v_0 \) phi.alt \( v_0 \), s \( v_0 \)^2) = - g_0 \( u \) phi.alt #h(-0.16667em) (frac(v_0, s \( v_0 \))) . $
  This is (3). Notice that the argument uses neither convexity nor evenness of the function $s + t phi.alt$.
  The same uniform bound on the derivatives of the displayed quotients bounds $\( g_t - g_0 \) \/ t$ uniformly in $u$. The ball inclusions bound $g_t$ above and away from zero on $S^(n - 1)$. Dominated convergence now differentiates the volume formula and proves (4). ◻
]

=== 2.2 A volume inequality with its equality case <a-volume-inequality-with-its-equality-case>

We use the classical Brunn–Minkowski inequality, including its equality case, in the following form; see [3] Sections 3 and 5. The first-variation statement and its equality consequence are then proved in the gauge coordinates needed for our measures.

#thm([Theorem 2.2.])[
  (Brunn–Minkowski inequality).  #emph[For every integer $d gt.eq 1$ and convex bodies $A \, B subset bb(R)^d$, write $\| dot.op \|$ for $d$-dimensional volume. For $0 lt.eq t lt.eq 1$, 
#[#set math.equation(numbering: n => "(5)")
 $ \| \( 1 - t \) A + t B \|^(1 \/ d) gt.eq \( 1 - t \) \| A \|^(1 \/ d) + t \| B \|^(1 \/ d) . $ <eq:brunn-minkowski>]

 If $0 < t < 1$, equality holds if and only if $B = a + c A$ for some $a in bb(R)^d$ and $c > 0$.]
] <thm:brunn-minkowski>

#thm([Corollary 2.3.])[
  (First variation of volume).  #emph[Let $K \, M subset bb(R)^n$ be convex bodies, with the origin interior to $K$. Then 
#[#set math.equation(numbering: n => "(6)")
 $ frac(d, d t)\|_(0 +) \| K + t M \| & = n kappa_n bb(E)_sigma #h(-0.16667em) [g_K \( u \)^(- n) h_M #scale(x: 120%, y: 120%)[\(] nabla g_K \( u \) #scale(x: 120%, y: 120%)[\)]]\
 & gt.eq n \| K \|^(\( n - 1 \) \/ n) \| M \|^(1 \/ n) . $ <eq:minkowski-volume-derivative>]

 Equality in the inequality holds if and only if $K$ and $M$ are homothetic up to translation. The derivative identity remains valid when $M$ is an arbitrary nonempty compact convex set.]
] <cor:volume-first-variation>

#proof[
  Support functions add under Minkowski addition, so Lemma 2, with $s = h_K$ and $phi.alt = h_M$, gives the derivative identity. This applies equally to a compact convex set $M$ of lower dimension. For full-dimensional $M$, Theorem 3 and homogeneity give
  $ F \( t \) := \| K + t M \|^(1 \/ n) gt.eq \| K \|^(1 \/ n) + t \| M \|^(1 \/ n) #h(2em) \( t gt.eq 0 \) . $
  In addition, $F$ is concave, by applying that theorem to $K + s M$ and $K + t M$. Its right derivative at zero therefore satisfies $F' \( 0 + \) gt.eq \| M \|^(1 \/ n)$, which is the asserted lower bound.
  If equality holds in this derivative bound, concavity gives
  $ F \( t \) lt.eq F \( 0 \) + t F' \( 0 + \) = \| K \|^(1 \/ n) + t \| M \|^(1 \/ n) . $
  Thus the preceding volume inequality is an equality for every $t > 0$. The equality case of Theorem 3, applied for example to $K + M$, forces homothety. Conversely, if $M = a + c K$ with $c > 0$, then $K + t M = t a + \( 1 + t c \) K$, which verifies equality in the derivative bound. ◻
]

=== 2.3 The measure associated with a convex body <the-measure-associated-with-a-convex-body>

The construction below is a gauge-coordinate form of the classical surface-area and mixed-volume description of projection bodies; see [3] Section 6 and [17] Section 1. The local segment calculation will fix its normalization and retain the equality information from the first variation.

For a finite positive Borel measure $eta$ on $bb(R)^n$ with bounded support, write

$ tau_eta \( M \) = integral h_M \( x \) thin d eta \( x \) . $

#prodef([Definition 2.4.])[
  We call $eta$ #emph[admissible] if its support spans $bb(R)^n$ and
  #[#set math.equation(numbering: n => "(7)")
   $ tau_eta \( M \) gt.eq (frac(\| M \|, kappa_n))^(1 \/ n) quad upright("for every origin-symmetric convex body ") M subset bb(R)^n . $ <eq:functional-condition>]
  The measure itself is not required to be symmetric.
] <def:admissible-measure>

#thm([Proposition 2.5.])[
  (Projection measure).  #emph[Translate and dilate a convex body $K$ so that $0 in "int" K$ and $\| K \| = kappa_n$. Define $eta_K$ by 
#[#set math.equation(numbering: n => "(8)")
 $ integral psi \( x \) thin d eta_K \( x \) = bb(E)_sigma #h(-0.16667em) [g_K \( u \)^(- n) psi #scale(x: 120%, y: 120%)[\(] nabla g_K \( u \) #scale(x: 120%, y: 120%)[\)]] $ <eq:eta-definition>]

 for nonnegative Borel functions $psi$; the choice of the gradient on its null exceptional set is immaterial. Then $eta_K$ is an admissible probability measure of bounded support. Equality in (7) for $eta_K$ and a symmetric body $M$ holds if and only if $K$ is a translate of a positive dilate of $M$. Moreover, 
#[#set math.equation(numbering: n => "(9)")
 $ h_(Pi K) \( y \) = frac(n kappa_n, 2) integral \| x dot.op y \| thin d eta_K \( x \) #h(2em) \( y in bb(R)^n \) \, $ <eq:projection-measure>]

 and 
#[#set math.equation(numbering: n => "(10)")
 $ integral h_K \( x \) thin d eta_K \( x \) = 1 . $ <eq:eta-normalization>]

 For the unit ball, $eta_(B_2^n) = sigma$, and consequently 
#[#set math.equation(numbering: n => "(11)")
 $ frac(n kappa_n b_n, 2) = kappa_(n - 1) . $ <eq:ball-constant>]

]
] <prop:projection-measure>

#proof[
  By (2), $bb(E)_sigma g_K^(- n) = 1$, so (8) defines a probability measure. The active vectors $v \/ h_K \( v \)$ lie in a bounded set because $h_K$ is positive on the sphere. Hence $eta_K$ has bounded support. Applying Corollary 4 gives, for every symmetric convex body $M$,
  $ tau_(eta_K) \( M \) = frac(1, n kappa_n) frac(d, d t)\|_(0 +) \| K + t M \| gt.eq (frac(\| M \|, kappa_n))^(1 \/ n) \, $
  with precisely the stated homothety equality condition. The same derivative identity with $M = K$, using $\| K + t K \| = \( 1 + t \)^n kappa_n$, proves (10); this identity does not require $K$ to be symmetric.
  Now let $y eq.not 0$ and take $M = \[ - y \, y \]$. Every nonempty fiber of $K$ parallel to $y$ is a compact interval. Adding $t \[ - y \, y \]$ increases its length by $2 t \| y \|$, without changing its projection onto $y^perp$. Fubini’s theorem therefore gives
  $ \| K + t \[ - y \, y \] \| = \| K \| + 2 t \| y \| "vol"_(n - 1) \( "proj"_(y^perp) K \) = \| K \| + 2 t h_(Pi K) \( y \) . $
  Since the support function of the segment is $x mapsto \| x dot.op y \|$, the derivative identity yields (9). The formula is also true at $y = 0$. The projection of a full-dimensional convex body has positive $\( n - 1 \)$-volume in every direction. If $"supp" eta_K$ failed to span $bb(R)^n$, a nonzero vector perpendicular to its span would make the integral in (9) vanish. This contradiction proves the spanning property and hence admissibility.
  Finally, for $K = B_2^n$ one has $g_K \( u \) = 1$ and $nabla g_K \( u \) = u$ on the sphere, so $eta_K = sigma$. Its projection volume in every unit direction is $kappa_(n - 1)$. Substituting this into (9) proves (11). ◻
]

== 3 A spherical sign estimate <sec:spherical>

The estimate in this section separates the constant part of a spherical function from its harmonics of degree at least four. The degree-two part will later be removed by a linear change of coordinates. Throughout, $p = n - 1$, surface measure $sigma$ has total mass one, and inner products and norms of functions are those of $L^2 \( sigma \)$.

=== 3.1 Harmonics and the spectral gap <harmonics-and-the-spectral-gap>

Let $cal(H)_l$ be the restrictions to $S^(n - 1)$ of homogeneous harmonic polynomials of degree $l$, and put

$ lambda_l = l \( l + n - 2 \) = l \( l + p - 1 \) . $

For an even function, let $Q$ denote orthogonal projection onto the closed sum of $cal(H)_4 \, cal(H)_6 \, dots.h$.

#thm([Lemma 3.1.])[
  #emph[The spaces $cal(H)_l$ form an orthogonal decomposition of $L^2 \( sigma \)$, and $Delta_S Y = - lambda_l Y$ for $Y in cal(H)_l$. Every even $H in C^1 \( S^(n - 1) \)$ satisfies 
#[#set math.equation(numbering: n => "(12)")
 $ lambda_2 "Var" \( H \) + \( lambda_4 - lambda_2 \) ∥Q H∥_2^2 lt.eq bb(E)_sigma lr(|nabla_S H|)^2 \, #h(2em) lambda_2 = 2 n \, quad lambda_4 = 4 \( n + 2 \) . $ <eq:spectral-gap>]

]
] <lem:spherical-harmonics>

#proof[
  The polar-coordinate formula for the Euclidean Laplacian gives
  $ Delta_(bb(R)^n) #scale(x: 120%, y: 120%)[\(] r^l Y \( u \) #scale(x: 120%, y: 120%)[\)] = r^(l - 2) #scale(x: 120%, y: 120%)[\(] l \( l + n - 2 \) Y \( u \) + Delta_S Y \( u \) #scale(x: 120%, y: 120%)[\)] . $
  This proves the eigenvalue formula. Integration by parts on the sphere then proves orthogonality of spaces with distinct degrees.
  We give the completeness argument explicitly. If $Y_l$ is homogeneous and harmonic, direct differentiation yields
  $ Delta_(bb(R)^n) #scale(x: 120%, y: 120%)[\(] lr(|x|)^(2 j) Y_l \( x \) #scale(x: 120%, y: 120%)[\)] = 2 j \( 2 l + 2 j + n - 2 \) lr(|x|)^(2 j - 2) Y_l \( x \) . $
  Induction on the degree now decomposes every homogeneous polynomial into terms $lr(|x|)^(2 j) Y_l \( x \)$. Indeed, decompose its Laplacian by the induction hypothesis and use the displayed identity to find a sum of such terms with the same Laplacian. The difference is harmonic. Restricting to the unit sphere shows that every polynomial restriction belongs to the span of the $cal(H)_l$.
  Polynomial restrictions uniformly approximate continuous functions on $S^(n - 1)$. To see this without an approximation theorem, set
  $ K_j \( u \, v \) = frac(\( \( 1 + u dot.op v \) \/ 2 \)^j, integral_(S^(n - 1)) \( \( 1 + u dot.op w \) \/ 2 \)^j thin d sigma \( w \)) . $
  The denominator is positive and independent of $u$, so $T_j H \( u \) = integral K_j \( u \, v \) H \( v \) thin d sigma \( v \)$ is a polynomial in $u$. For $0 < delta < 2$, let $m_delta > 0$ be the measure of the cap ${ v : lr(|u - v|) < delta \/ 2 }$. Since $\( 1 + u dot.op v \) \/ 2 = 1 - lr(|u - v|)^2 \/ 4$,
  $ integral_(lr(|u - v|) gt.eq delta) K_j \( u \, v \) thin d sigma \( v \) lt.eq 1 / m_delta (frac(1 - delta^2 \/ 4, 1 - delta^2 \/ 16))^j . $
  Uniform continuity of $H$ therefore gives $T_j H arrow.r H$ uniformly. Continuous functions are dense in $L^2 \( sigma \)$: approximate the sets in a simple function from inside by compact sets and from outside by open sets, then interpolate their indicators continuously using distance to these sets. The squared error is bounded by the measure of the intervening sets. This proves completeness.
  Choose real orthonormal bases $Y_(l \, a)$ of the spaces $cal(H)_l$, with $Y_(0 \, 1) = 1$. Integration by parts shows that the tangent fields $nabla_S Y_(l \, a) \/ sqrt(lambda_l)$, for $l gt.eq 1$, are orthonormal. Bessel’s inequality, which follows by expanding the squared distance from any finite orthogonal sum, consequently gives
  $ bb(E)_sigma lr(|nabla_S H|)^2 gt.eq sum_(l gt.eq 1 \, a) lr(|bb(E)_sigma thin nabla_S H dot.op frac(nabla_S Y_(l \, a), sqrt(lambda_l))|)^2 = sum_(l gt.eq 1 \, a) lambda_l lr(|bb(E)_sigma \( H Y_(l \, a) \)|)^2 . $
  No differentiation of an infinite series is needed. If $H$ is even, its odd-degree coefficients vanish. Completeness identifies its variance with the sum of the squared nonconstant coefficients and $∥Q H∥_2^2$ with the corresponding sum over even $l gt.eq 4$. Using $lambda_l gt.eq lambda_2$ for even $l gt.eq 2$ and $lambda_l gt.eq lambda_4$ for $l gt.eq 4$ proves (12). ◻
]

=== 3.2 The sign-test operator <the-sign-test-operator>

For $k > 0$ and an even differentiable function $f$ on $S^(n - 1)$, define

#[#set math.equation(numbering: n => "(13)")
 $ X_f \( u \) = f \( u \) u + k^(- 1) nabla_S f \( u \) . $ <eq:vector-field>]

For even $C^1$ functions $f_1 \, f_2$, set

#[#set math.equation(numbering: n => "(14)")
 $ cal(B) \( f_1 \, f_2 \) = 1 / b_n integral.double_(S^(n - 1) times S^(n - 1)) "sgn" \( u dot.op v \) thin X_(f_1) \( u \) dot.op X_(f_2) \( v \) thin d sigma \( u \) d sigma \( v \) . $ <eq:sign-form>]

The value assigned to $"sgn" \( 0 \)$ is immaterial. Since $\| a \| gt.eq "sgn" \( u dot.op v \) a$ for every real $a$, the form gives the lower bound

$ integral.double \| X_(f_1) \( u \) dot.op X_(f_2) \( v \) \| thin d sigma \( u \) d sigma \( v \) gt.eq b_n cal(B) \( f_1 \, f_2 \) . $

We estimate this lower bound using two spherical transforms. Write $sigma_(u^perp)$ for uniform probability on the equator $u^perp ∩ S^(n - 1)$, and define

$ \( C f \) \( u \) = 1 / b_n integral_(S^(n - 1)) lr(|u dot.op v|) f \( v \) thin d sigma \( v \) \, #h(2em) \( P f \) \( u \) = integral_(u^perp ∩ S^(n - 1)) f \( v \) thin d sigma_(u^perp) \( v \) . $

These are the cosine and Funk transforms, here normalized to preserve constants; compare [14] Section 2, especially (2.3), (2.5)–(2.6). The local multiplier calculation below uses this probability-measure convention throughout. Both are self-adjoint contractions on $L^2 \( sigma \)$ and preserve constants. For $C$ this follows from symmetry of its nonnegative kernel and Jensen’s inequality. For $P$, average first over the band $lr(|u dot.op v|) < epsilon.alt$, dividing by its measure. The resulting kernel is symmetric and preserves constants. Spherical coordinates show that, for continuous $f$, these band averages tend to $P f$; Jensen’s inequality and passage to the limit give the same conclusions for $P$, followed by extension to $L^2 \( sigma \)$.

#thm([Lemma 3.2.])[
  #emph[For even $C^1$ functions, 
#[#set math.equation(numbering: n => "(15)")
 $ cal(B) \( f_1 \, f_2 \) = ⟨f_1 \, [C + (frac(2 p, k) + p^2 / k^2) \( C - P \)] f_2⟩ . $ <eq:sign-operator>]

]
] <lem:sign-operator>

#proof[
  Let $d_0$ be the density at zero of $u dot.op v$ for uniform $u$ and fixed $v in S^(n - 1)$. Equivalently, $d_0$ is the ratio of the surface areas of $S^(n - 2)$ and $S^(n - 1)$. For a fixed ambient vector $w$, its tangential projection has divergence $- p thin u dot.op w$. Integrating separately on the two hemispheres gives
  #[#set math.equation(numbering: n => "(16)")
   $ & integral_(S^(n - 1)) "sgn" \( u dot.op v \) thin nabla_S f \( u \) dot.op w thin d sigma \( u \)\
 & quad = p integral_(S^(n - 1)) "sgn" \( u dot.op v \) f \( u \) thin u dot.op w thin d sigma \( u \) - 2 d_0 integral_(v^perp ∩ S^(n - 1)) f \( u \) thin v dot.op w thin d sigma_(v^perp) \( u \) . $ <eq:hemisphere-ibp>]
  The outward conormals on the equator are $- v$ and $v$, respectively; the sign change between the hemispheres makes their contributions add with the displayed negative sign. Taking $f = 1$ and $w = v$ yields
  $ 2 d_0 = p b_n . $
  The radial–radial term in (14), before division by $b_n$, is $b_n chevron.l f_1 \, C f_2 chevron.r$. Apply (16) with $w = v$ and then integrate against $f_2 \( v \)$. Each of the two mixed radial–gradient terms, before its factor $k^(- 1)$, equals
  $ p b_n chevron.l f_1 \, \( C - P \) f_2 chevron.r . $
  For the gradient–gradient term, first integrate in $u$ with $w = nabla_S f_2 \( v \)$. Its equator term vanishes because $v dot.op nabla_S f_2 \( v \) = 0$. What remains is
  $ p integral.double f_1 \( u \) "sgn" \( u dot.op v \) thin u dot.op nabla_S f_2 \( v \) thin d sigma \( u \) d sigma \( v \) . $
  A second application of (16), now in $v$ with $w = u$, makes this $p^2 b_n chevron.l f_1 \, \( C - P \) f_2 chevron.r$. Adding the four terms proves (15). ◻
]

=== 3.3 Multipliers and passage to norms <multipliers-and-passage-to-norms>

#thm([Lemma 3.3.])[
  #emph[On $cal(H)_(2 j)$ the operators $P$ and $C$ are scalar multipliers, with 
#[#set math.equation(numbering: n => "(17)")
 $ P_(2 j) = \( - 1 \)^j frac(1 dot.op 3 dots.h.c \( 2 j - 1 \), p \( p + 2 \) dots.h.c \( p + 2 j - 2 \)) \, #h(2em) C_(2 j) = frac(p P_(2 j), p - lambda_(2 j)) \, $ <eq:transform-multipliers>]

 where empty products equal one. In particular, 
#[#set math.equation(numbering: n => "(18)")
 $ C_0 = 1 \, #h(2em) C_2 = frac(1, p + 2) \, #h(2em) C_4 = - frac(1, \( p + 2 \) \( p + 4 \)) \,\
C_(l + 2) / C_l = - frac(l - 1, l + p + 2) quad \( l gt.eq 2 upright(" even") \) . $ <eq:cosine-recurrence>]

]
] <lem:spherical-multipliers>

#proof[
  Fix $u in S^(n - 1)$ and a homogeneous harmonic polynomial $Y_(2 j)$. Let $Z$ be a standard Gaussian in the $p$-dimensional space $u^perp$. Its direction is uniform on the equator and independent of its radius, so polar integration gives
  $ bb(E) Y_(2 j) \( Z \) = p \( p + 2 \) dots.h.c \( p + 2 j - 2 \) thin \( P Y_(2 j) \) \( u \) . $
  The radial moment here follows by successive integration by parts in $integral_0^oo r^(p + 2 j - 1) e^(- r^2 \/ 2) thin d r$. The one-dimensional Gaussian moment recurrence $bb(E) Z_1^(2 a) = \( 2 a - 1 \) bb(E) Z_1^(2 a - 2)$, together with independence of coordinates, also gives
  $ bb(E) Y_(2 j) \( Z \) = frac(\( Delta_(u^perp) \)^j Y_(2 j) \( 0 \), 2^j j !) . $
  This identity follows term by term on monomials; monomials with an odd exponent have both sides zero, and the other coefficients are exactly the multinomial coefficients in the power of the Laplacian. Harmonicity and commutation of constant-coefficient derivatives imply
  $ \( Delta_(u^perp) \)^j Y_(2 j) = \( - 1 \)^j partial_u^(2 j) Y_(2 j) \, #h(2em) partial_u^(2 j) Y_(2 j) \( 0 \) = \( 2 j \) ! Y_(2 j) \( u \) . $
  Since $\( 2 j \) ! \/ \( 2^j j ! \) = 1 dot.op 3 dots.h.c \( 2 j - 1 \)$, the formula for $P_(2 j)$ follows.
  To obtain $C$, integrate by parts on the two hemispheres in the variable $v$. Off the equator, $Delta_S lr(|u dot.op v|) = - p lr(|u dot.op v|)$; the jump of its normal derivative contributes $2 d_0$ times equator averaging. Thus, for any smooth $Y$,
  $ integral_(S^(n - 1)) lr(|u dot.op v|) Delta_S Y \( v \) thin d sigma \( v \) = - p integral_(S^(n - 1)) lr(|u dot.op v|) Y \( v \) thin d sigma \( v \) + 2 d_0 \( P Y \) \( u \) . $
  For $Y in cal(H)_l$, division by $b_n$ gives $- lambda_l C Y = p \( P Y - C Y \)$. The denominator $p - lambda_l = - \( l - 1 \) \( l + p \)$ is nonzero for every even $l$, proving the second formula in (17). Its first three values give those in (18); division of successive values, using $P_(l + 2) \/ P_l = - \( l + 1 \) \/ \( l + p \)$, gives the recurrence. ◻
]

Set

#[#set math.equation(numbering: n => "(19)")
 $ c_(n \, k) = frac(1 + (2 \/ k + \( n - 1 \) \/ k^2) 4 \( n + 2 \), \( n + 1 \) \( n + 3 \)) . $ <eq:tail-constant>]

#thm([Proposition 3.4.])[
  #emph[Let $k > 0$ and let $f_1 \, f_2$ be even $C^1$ functions on $S^(n - 1)$. If $f_1$ has zero projection onto $cal(H)_2$, then 
#[#set math.equation(numbering: n => "(20)")
 $ cal(B) \( f_1 \, f_2 \) gt.eq \( bb(E)_sigma f_1 \) \( bb(E)_sigma f_2 \) - c_(n \, k) ∥Q f_1∥_2 ∥Q f_2∥_2 . $ <eq:sign-bound>]

 The operator identity (15) and this estimate also hold when $f_i = g_i^k$ for arbitrary norms $g_i$ on $bb(R)^n$, with the vector fields defined almost everywhere. In that case 
#[#set math.equation(numbering: n => "(21)")
 $ X_(g_i^k) \( u \) = g_i \( u \)^(k - 1) nabla g_i \( u \) . $ <eq:norm-vector-field>]

]
] <prop:sign-estimate>

#proof[
  By Lemma 9, the operator in (15) has multiplier one on constants and, on degree $l$, multiplier
  $ mu_l = C_l [1 + (2 / k + p / k^2) lambda_l] . $
  Indeed, $C_l - P_l = \( lambda_l \/ p \) C_l$. Put $a = 2 \/ k + p \/ k^2 > 0$. For even $l gt.eq 4$,
  $ \( l + p + 2 \) lambda_l - \( l - 1 \) lambda_(l + 2) = \( p - 1 \) l^2 + \( p^2 - 1 \) l + 2 \( p + 1 \) > 0 . $
  Since also $l - 1 < l + p + 2$, it follows that
  $ lr(|mu_(l + 2)|) / lr(|mu_l|) = frac(l - 1, l + p + 2) thin frac(1 + a lambda_(l + 2), 1 + a lambda_l) lt.eq 1 . $
  Consequently $lr(|mu_l|) lt.eq lr(|mu_4|) = c_(n \, k)$ on all even $l gt.eq 4$. The constant term of the bilinear form is $\( bb(E)_sigma f_1 \) \( bb(E)_sigma f_2 \)$, and its degree-two term vanishes by hypothesis. Cauchy–Schwarz on the remaining harmonic coefficients proves (20). This expansion is justified by the completeness in Lemma 7 and the boundedness of $C$ and $P$.
  We finish by proving the passage to norms, retaining the details needed when their unit balls have corners. Let $g$ be a norm and let $g_epsilon.alt = g * rho_epsilon.alt$ on $bb(R)^n$, where $rho_epsilon.alt$ is a smooth, even, nonnegative function of integral one, supported in the ball of radius $epsilon.alt$. The functions $g_epsilon.alt$ are smooth, even and convex. If $L$ is the Euclidean Lipschitz constant of $g$, then
  $ lr(|g_epsilon.alt - g|) lt.eq L epsilon.alt \, #h(2em) lr(|nabla g_epsilon.alt|) lt.eq L . $
  At a differentiability point $x$ of $g$, these gradients converge to $nabla g \( x \)$. Indeed, every convergent subsequence of the bounded gradients has a limit $a$, and convexity gives, on passing to the limit,
  $ g \( y \) gt.eq g \( x \) + a dot.op \( y - x \) #h(2em) \( y in bb(R)^n \) . $
  Taking $y = x plus.minus t h$ and then $t arrow.b 0$ forces $a dot.op h = nabla g \( x \) dot.op h$ for every $h$, so the only possible limit is $nabla g \( x \)$.
  Lemma 2 supplies differentiability of $g$ at almost every spherical direction. Equivalently, one may use its almost-everywhere differentiability in $bb(R)^n$ and homogeneity: the exceptional set is a union of rays, so polar integration makes its intersection with the sphere null. On the sphere $g$ is bounded away from zero. Thus the restrictions $f_epsilon.alt = g_epsilon.alt^k \|_(S^(n - 1))$ converge uniformly to $g^k$, and
  $ nabla_S f_epsilon.alt \( u \) = k g_epsilon.alt \( u \)^(k - 1) \( I_n - u u^t \) nabla g_epsilon.alt \( u \) arrow.r k g \( u \)^(k - 1) \( I_n - u u^t \) nabla g \( u \) $
  almost everywhere and in $L^2 \( sigma \)$, by bounded convergence. Euler’s identity $u dot.op nabla g \( u \) = g \( u \)$, obtained by differentiating $g \( t u \) = t g \( u \)$, identifies the limiting vector field with (21).
  The approximants $g_epsilon.alt$ need not be homogeneous; only their restrictions and tangential gradients are used here. The fields $X_(f_epsilon.alt)$ converge in $L^2$, so the bounded sign kernel in (14) permits passage to the limit. The right side of (15) also converges, because $C$ and $P$ are bounded on $L^2$. This proves the operator identity for norm powers. Finally apply its harmonic multiplier estimate directly to the limiting functions. The approximants themselves need not have vanishing degree-two part: that hypothesis is used only for the limiting $f_1$. This proves (20) in the stated nonsmooth setting. ◻
]

== 4 A strict inequality for norms <sec:norm>

We now bound the higher spherical harmonics of a power of a norm by two of its means. Convexity supplies the differential estimate; the remaining step consists of scalar inequalities. Throughout this section set

#[#set math.equation(numbering: n => "(22)")
 $ k = cases(delim: "{", 1 \, & n = 4 \,, 2 \, & n gt.eq 5 \,) #h(2em) c = c_(n \, k) \, #h(2em) d_(*) = lambda_4 - lambda_2 = 2 n + 8 . $ <eq:k-choice>]

Thus the first power is used in dimension four and the square in higher dimensions. The scalar estimates below establish these two choices with the same strict conclusion.

#thm([Theorem 4.1.])[
  #emph[Let $g$ be a norm on $bb(R)^n$, where $n gt.eq 4$, normalized by $bb(E)_sigma g^(- n) = 1$ on $S^(n - 1)$. Then 
#[#set math.equation(numbering: n => "(23)")
 $ c_(n \, k) parallel Q \( g^k \) parallel_2^2 lt.eq \( bb(E)_sigma g^k \)^2 - \( bb(E)_sigma g^(k - 1) \)^2 . $ <eq:norm-estimate>]

 The inequality is strict unless $g = 1$ on $S^(n - 1)$.]
] <thm:norm-estimate>

=== 4.1 Convexity and a scalar decomposition <convexity-and-a-scalar-decomposition>

For $z > 0$ define

#[#set math.equation(numbering: n => "(24)")
 $ e \( z \) & = frac(z^(- n) - 1, n) \, & M \( z \) & = z^k - 1 + k e \( z \) \, & W \( z \) & = z^k - z^(k - 1) + e \( z \) . $ <eq:scalar-basic>]

Since $M' \( z \) = k \( z^(k - 1) - z^(- n - 1) \)$, the function $M$ decreases up to $1$, increases thereafter, and satisfies $M \( 1 \) = M' \( 1 \) = 0$. In particular, $M gt.eq 0$. For a norm with $bb(E)_sigma g^(- n) = 1$, the correction $e \( g \)$ has mean zero. We will split $g^k - 1$ into a term controlled by convexity and a remainder controlled by its variance. Choose the constants

#[#set math.equation(numbering: n => "(25)")
 $ n & beta & w\
4 & 1 \/ 2 & 3 \/ 14\
5 \, 6 & 2 \/ 3 & 1 \/ 3\
n gt.eq 7 & 2 \/ 3 & 1 \/ 2 $ <eq:scalar-constants>]

and split

#[#set math.equation(numbering: n => "(26)")
 $ G \( z \) = beta M \( z \) upright(bold(1))_({ z > 1 }) \, #h(2em) D \( z \) = z^k - 1 - G \( z \) . $ <eq:scalar-split>]

Thus $G$ vanishes for $z lt.eq 1$, while $D$ retains the remaining part of $z^k - 1$. To estimate $G \( g \)$ by convexity, let $I \( z \) = 0$ for $0 < z lt.eq 1$, and, for $z > 1$, let

#[#set math.equation(numbering: n => "(27)")
 $ I \( z \) & = integral_1^z M' \( a \)^2 thin d a\
 & = k^2 (frac(z^(2 k - 1) - 1, 2 k - 1) - frac(2 \( 1 - z^(k - 1 - n) \), n + 1 - k) + frac(1 - z^(- 2 n - 1), 2 n + 1)) . $ <eq:scalar-I>]

Both $G$ and $I$ are continuously differentiable across $1$; $I gt.eq 0$ and $G' ""^2 = beta^2 I'$.

#thm([Lemma 4.2.])[
  #emph[For every norm $g$ on $bb(R)^n$, 
#[#set math.equation(numbering: n => "(28)")
 $ 2 n "Var" \( G \( g \) \) + d_(*) parallel Q G \( g \) parallel_2^2 lt.eq p beta^2 bb(E)_sigma \[ g I \( g \) \] \, #h(2em) p = n - 1 . $ <eq:norm-curvature>]

]
] <lem:curvature>

#proof[
  Suppose first that $g$ is smooth away from the origin. The trace of its Euclidean Hessian on the tangent space at $u in S^(n - 1)$ is $Delta_S g \( u \) + p g \( u \)$, and it is nonnegative by convexity. Multiplying by $I \( g \) gt.eq 0$ and integrating by parts gives
  $ bb(E)_sigma \| nabla_S G \( g \) \|^2 & = beta^2 bb(E)_sigma \[ I' \( g \) \| nabla_S g \|^2 \] = - beta^2 bb(E)_sigma \[ I \( g \) Delta_S g \] lt.eq p beta^2 bb(E)_sigma \[ g I \( g \) \] . $
  The spectral gap estimate (12) proves (28) in this case.
  Here is a passage to arbitrary norms that does not assume the approximants are homogeneous. Convolve the ambient norm with smooth, even, nonnegative mollifiers of mass one and shrinking compact support, and write the resulting smooth convex functions as $g_epsilon$. On the unit sphere their tangent Hessian trace is
  $ Delta_S g_epsilon + p partial_r g_epsilon gt.eq 0 . $
  The preceding argument and (12) therefore give
  $ 2 n "Var" \( G \( g_epsilon \) \) + d_(*) parallel Q G \( g_epsilon \) parallel_2^2 lt.eq p beta^2 bb(E)_sigma \[ I \( g_epsilon \) partial_r g_epsilon \] . $
  The functions $g_epsilon$ converge uniformly to $g$ on compact sets, are uniformly Lipschitz there, and their gradients converge to $nabla g$ at every differentiability point of $g$. To see the last assertion, every limit of their bounded gradients satisfies the subgradient inequality for $g$ by convexity and uniform convergence; differentiability makes that subgradient unique. The exceptional directions have spherical measure zero, as in Lemma 2. Homogeneity of $g$ then gives $partial_r g_epsilon \( u \) arrow.r nabla g \( u \) dot.op u = g \( u \)$ almost everywhere. On the sphere the approximants stay in a fixed positive compact interval, while their radial derivatives are bounded. Uniform convergence on the left and dominated convergence on the right prove (28). ◻
]

=== 4.2 From scalar bounds to the norm estimate <subsec:norm-deduction>

Define, for $z > 0$,

#[#set math.equation(numbering: n => "(29)")
 $ cal(L) \( z \) = c (frac(p beta^2 z I \( z \) - 2 n G \( z \)^2, w d_(*)) + frac(D \( z \)^2, 1 - w)) . $ <eq:scalar-L>]

#thm([Lemma 4.3.])[
  #emph[The constants and functions above satisfy 
#[#set math.equation(numbering: n => "(30)")
 $ c (frac(2 n beta^2, w d_(*)) - frac(\( 1 - beta \)^2, 1 - w)) lt.eq frac(2 k - 1, k^2) $ <eq:scalar-mean-bound>]

 and 
#[#set math.equation(numbering: n => "(31)")
 $ cal(L) \( z \) lt.eq 2 W \( z \) #h(2em) \( z > 0 \) . $ <eq:scalar-pointwise>]

 Equality in (31) holds only at $z = 1$.]
] <lem:scalar-estimates>

We first deduce the norm estimate from the two scalar bounds. Their verification, including the strict pointwise inequality in every dimension, occupies the remainder of the section.

#proof[
  In the following expectations, $G \, D \, I$ denote their compositions with $g$. Set
  $ m = bb(E)_sigma g^k - 1 \, #h(2em) ell = bb(E)_sigma g^(k - 1) - 1 \, #h(2em) t = bb(E)_sigma G . $
  The normalization gives $bb(E)_sigma e \( g \) = 0$, so $m = bb(E)_sigma M \( g \) gt.eq 0$, $bb(E)_sigma D = m - t$, and $bb(E)_sigma W \( g \) = m - ell$. Since $0 lt.eq G lt.eq beta M$, we have $0 lt.eq t lt.eq beta m$. For every $a > 0$, Jensen’s inequality applied to the convex function $y mapsto y^(- a \/ n)$ yields $bb(E)_sigma g^a gt.eq \( bb(E)_sigma g^(- n) \)^(- a \/ n) = 1$. Together with
  $ z^(k - 1) lt.eq frac(\( k - 1 \) z^k + 1, k) \, $
  this gives
  #[#set math.equation(numbering: n => "(32)")
   $ 0 lt.eq ell lt.eq frac(k - 1, k) thin m . $ <eq:norm-mean-range>]
  For $k = 1$ this simply says $ell = 0$.
  Since $Q$ annihilates constants, $Q \( g^k \) = Q G + Q D$. The Hilbert-space inequality
  $ parallel a + b parallel^2 lt.eq frac(parallel a parallel^2, w) + frac(parallel b parallel^2, 1 - w) #h(2em) \( 0 < w < 1 \) $
  and $parallel Q D parallel_2^2 lt.eq "Var" \( D \)$, followed by Lemma 12, give
  #[#set math.equation(numbering: n => "(33)")
   $ c parallel Q \( g^k \) parallel_2^2 & lt.eq frac(c, w d_(*)) (p beta^2 bb(E)_sigma \[ g I \( g \) \] - 2 n "Var" \( G \)) + frac(c, 1 - w) "Var" \( D \)\
 & = bb(E)_sigma cal(L) \( g \) + c (frac(2 n, w d_(*)) t^2 - frac(\( m - t \)^2, 1 - w)) . $ <eq:norm-reduction>]
  The quadratic expression in parentheses is increasing for $0 lt.eq t lt.eq m$: its derivative is
  $ frac(4 n, w d_(*)) t + frac(2 \( m - t \), 1 - w) gt.eq 0 . $
  It is therefore no larger than its value at $t = beta m$. Using (30) and (32), we conclude that the final term of (33) is at most
  $ frac(2 k - 1, k^2) m^2 lt.eq m^2 - ell^2 . $
  Now (31) yields
  $ c parallel Q \( g^k \) parallel_2^2 & lt.eq 2 bb(E)_sigma W \( g \) + m^2 - ell^2\
 & = 2 \( m - ell \) + m^2 - ell^2 = \( bb(E)_sigma g^k \)^2 - \( bb(E)_sigma g^(k - 1) \)^2 \, $
  as claimed. If $g$ is not identically $1$ on the sphere, continuity gives a set of positive spherical measure on which $g eq.not 1$. Lemma 13 then gives $bb(E)_sigma cal(L) \( g \) < 2 bb(E)_sigma W \( g \)$, so the final inequality is strict. The only constant norm on the sphere with $bb(E)_sigma g^(- n) = 1$ is $g = 1$; in this case both sides of (23) vanish. ◻
]

=== 4.3 Proof of the scalar bounds <proof-of-the-scalar-bounds>

#proof[
  We first record the values of the spectral constant:
  #[#set math.equation(numbering: n => "(34)")
   $ c = 121 / 35 quad \( n = 4 \) \, #h(2em) c = frac(n^2 + 5 n + 7, \( n + 1 \) \( n + 3 \)) quad \( n gt.eq 5 \) . $ <eq:scalar-c>]
  For $n = 4 \, 5 \, 6$ the left side of (30) is, respectively,
  $ 11 / 12 \, #h(2em) 589 / 864 \, #h(2em) 1387 / 1890 . $
  These are smaller than $1 \, 3 \/ 4 \, 3 \/ 4$, the respective right sides. For $n gt.eq 7$ the left side is
  $ frac(2 \( 3 n - 4 \) \( n^2 + 5 n + 7 \), 9 \( n + 1 \) \( n + 3 \) \( n + 4 \)) . $
  Its difference from $3 \/ 4$, with the latter first, is
  $ frac(3 n^3 + 128 n^2 + 505 n + 548, 36 \( n + 1 \) \( n + 3 \) \( n + 4 \)) > 0 . $
  This proves (30) for every dimension.
  #emph[The interval $0 < z lt.eq 1$.] Here $G = I = 0$ and $\| D \( z \) \| = \| z^k - 1 \| lt.eq k \| z - 1 \|$. Also $W \( 1 \) = W' \( 1 \) = 0$ and
  $ W'' \( z \) = cases(delim: "{", \( n + 1 \) z^(- n - 2) \, & k = 1 \,, 2 + \( n + 1 \) z^(- n - 2) \, & k = 2 .) $
  Thus $2 W \( z \) gt.eq \( n + 2 k - 1 \) \( z - 1 \)^2$. The positive margins
  #[#set math.equation(numbering: n => "(35)")
   $ n + 2 k - 1 - frac(c k^2, 1 - w) = cases(delim: "{", 3 \/ 5 \, & n = 4 \,, 7 \/ 8 \, & n = 5 \,, 43 \/ 21 \, & n = 6 \,, n + 3 - 8 c \, & n gt.eq 7) $ <eq:scalar-local-margin>]
  give the desired strict inequality for $z < 1$. In the last case the margin is $9 \/ 10$ at $n = 7$ and increases thereafter: regarding $n$ as a real variable in (34),
  $ c' \( n \) = - frac(n^2 + 8 n + 13, \( n + 1 \)^2 \( n + 3 \)^2) < 0 . $
  At $z = 1$ both sides of (31) vanish.
  #emph[The interval $z > 1$ in dimensions $4 \, 5 \, 6$.] Set $x = z - 1 > 0$. Multiplication by a positive factor clears the negative powers of $z$: if
  $ P_n \( z \) = s_n z^(2 n) #scale(x: 120%, y: 120%)[\(] 2 W \( z \) - cal(L) \( z \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) \( s_4 \, s_5 \, s_6 \) = \( 2880 \, 712800 \, 221130 \) \, $
  then substitution of (24)–(29) and collection of equal powers give
  #[#set math.equation(numbering: n => "(36)")
   $ P_4 \( z \) =  & 462 z^10 - 983 z^9 + 93 z^8 + 3399 z^5 - 3378 z^4 + 407 \,\
P_5 \( z \) =  & 151525 z^14 - 273570 z^12 - 680800 z^11 + 938157 z^10\
 & quad + 225720 z^7 - 462264 z^5 + 101232 \,\
P_6 \( z \) =  & 48399 z^16 - 75894 z^14 - 218004 z^13 + 285961 z^12\
 & quad + 56940 z^8 - 127478 z^6 + 30076 . $ <eq:small-polynomials>]
  For clarity, the coefficients needed from $P_n \( 1 + x \)$ are listed below; the constant and linear coefficients are zero.
  $ \[ x^j \] & n = 4 & n = 5 & n = 6\
j = 2 & 1728 & 623700 & 452790\
j = 3 & - 1446 & - 1505900 & 679380\
j = 4 & - 6711 & - 5802775 & - 132249\
j = 5 & 1173 & 12849430 & 7800780\
j = 6 & 17052 & 86314305 & 51269452\
j = 7 & 20796 & 191506920 & 146058120 $
  All remaining coefficients are nonnegative, as can be seen without listing them. Let $a_n z^(d_n)$ be the leading term in (36). At $j = 8$, its contribution $a_n binom(d_n, 8)$ minus the contributions of all negative terms is
  $ 11943 \, #h(2em) 207280425 \, #h(2em) 114414300 quad upright("for ") n = 4 \, 5 \, 6 \, $
  respectively. For every $i < d_n$, the ratio $binom(i, j) \/ binom(d_n, j)$ is nonincreasing in $j$; while it is nonzero, its ratio at successive indices is $\( i - j \) \/ \( d_n - j \) lt.eq 1$. Once $j > i$ it is zero. Thus the same leading term covers all negative contributions for every $8 lt.eq j lt.eq d_n$.
  It follows that $P_n \( 1 + x \) \/ x^2$ is bounded below by, respectively,
  $ U_4 \( x \) & = 1728 - 1446 x - 6711 x^2 + 17052 x^4 \,\
U_5 \( x \) & = 623700 - 1505900 x - 5802775 x^2 + 86314305 x^4 \,\
U_6 \( x \) & = 452790 - 132249 x^2 + 51269452 x^4 . $
  These lower bounds are positive. Indeed
  $ 1446 x & lt.eq 400 + 1400 x^2 \, & 8111 x^2 & lt.eq 1000 + 17052 x^4 \,\
1505900 x & lt.eq 200000 + 2900000 x^2 \, & 8702775 x^2 & lt.eq 230000 + 86314305 x^4 . $
  Each follows from $d t lt.eq a + b t^2$ when $d^2 lt.eq 4 a b$; the corresponding values of $4 a b - d^2$ are
  $ 149084 \, quad 2419679 \, quad 52265190000 \, quad 3670867899375 . $
  The first row gives $U_4 \( x \) gt.eq 328$ and the second gives $U_5 \( x \) gt.eq 193700$. Finally $U_6$, regarded as a quadratic in $x^2$, has positive leading coefficient and negative discriminant, since
  $ 4 dot.op 452790 dot.op 51269452 - 132249^2 = 92839690886319 > 0 . $
  Therefore $P_n \( z \) > 0$ for $z > 1$ in all three dimensions.
  #emph[The interval $z > 1$ in all dimensions $n gt.eq 7$.] Put $H = 18 \( n + 4 \) \/ c$. Direct collection of powers in (29) now gives
  #[#set math.equation(numbering: n => "(37)")
   $ frac(9 \( n + 4 \), c) z^(2 n) \( 2 W - cal(L) \) = z^(2 n) \( A_4 z^4 + A_2 z^2 + A_1 z + A_0 \) + z^n \( B_2 z^2 + B_0 \) + T_0 \, $ <eq:large-polynomial>]
  where
  #[#set math.equation(numbering: n => "(38)")
   $ A_4 & = frac(2 n - 8, 3) \, & A_2 & = H - 12 n - 32 - 64 / n \,\
A_1 & = - H + frac(16 \( n - 1 \), 3) + 32 - frac(16 \( n - 1 \), 2 n + 1) \, &  & \
A_0 & = - H / n + 6 n + 40 + 64 / n - 128 / n^2 \, &  & \
B_2 & = 16 + 64 / n \, & B_0 & = H / n - 48 - 64 / n + 256 / n^2 \,\
T_0 & = frac(16 \( n - 1 \), 2 n + 1) - 128 / n^2 . &  & $ <eq:large-coefficients>]
  We prove that the polynomial on the right of (37), expressed in $x = z - 1$, has nonnegative coefficients and a positive quadratic coefficient.
  Write its two parentheses as $sum_(i = 0)^4 q_i x^i$ and $sum_(i = 0)^2 r_i x^i$. Thus
  $ q_0 & = A_4 + A_2 + A_1 + A_0 \, & q_1 & = 4 A_4 + 2 A_2 + A_1 \,\
q_2 & = 6 A_4 + A_2 \, & q_3 & = 4 A_4 \, #h(2em) q_4 = A_4 \,\
r_0 & = B_2 + B_0 \, & r_1 & = 2 B_2 \, #h(2em) r_2 = B_2 . $
  In particular $q_3 \, q_4 \, r_1 \, r_2 > 0$. The constant and linear coefficients of the full polynomial vanish. Its quadratic coefficient is
  #[#set math.equation(numbering: n => "(39)")
   $ frac(9 \( n + 4 \), c) thin \( n + 3 - 8 c \) > 0 . $ <eq:large-quadratic>]
  One can obtain these three coefficients either from (38) or directly from the order of vanishing at $z = 1$: $G = O \( x^2 \)$, $I = O \( x^3 \)$, and $D = 2 x + O \( x^2 \)$, so that $2 W - cal(L) = \( n + 3 - 8 c \) x^2 + O \( x^3 \)$. Positivity is (35).
  The remaining signs admit explicit polynomial certificates. Set
  $ V_0 \( n \) & = 34 n^5 - 95 n^4 - 1666 n^3 - 5701 n^2 - 8052 n - 2688 \,\
V_1 \( n \) & = 2 n^5 + 9 n^4 - 162 n^3 - 845 n^2 - 1220 n - 448 \,\
V_2 \( n \) & = 5 n^3 + 8 n^2 - 41 n - 56 \,\
R \( n \) & = 7 n^4 + 8 n^3 - 187 n^2 - 748 n - 896 . $
  Substituting $H = 18 \( n + 4 \) \( n + 1 \) \( n + 3 \) \/ \( n^2 + 5 n + 7 \)$ gives
  #[#set math.equation(numbering: n => "(40)")
   $ q_0 + r_0 / 8 & = frac(V_0 \( n \), 4 n^2 \( 2 n + 1 \) \( n^2 + 5 n + 7 \)) \,\
q_1 & = frac(2 V_1 \( n \), n \( 2 n + 1 \) \( n^2 + 5 n + 7 \)) \,\
q_2 & = frac(2 \( n + 4 \) V_2 \( n \), n \( n^2 + 5 n + 7 \)) \, & r_0 & = - frac(2 R \( n \), n^2 \( n^2 + 5 n + 7 \)) . $ <eq:large-signs>]
  The required signs hold throughout their stated ranges because, for $t gt.eq 0$,
  #[#set math.equation(numbering: n => "(41)")
   $ V_0 \( 10 + t \) =  & 34 t^5 + 1605 t^4 + 28534 t^3 + 227319 t^2\
 & quad + 698128 t + 130692 \,\
V_1 \( 10 + t \) =  & 2 t^5 + 109 t^4 + 2198 t^3 + 19695 t^2 + 69280 t + 30852 \,\
V_2 \( 7 + t \) =  & 5 t^3 + 113 t^2 + 806 t + 1764 \,\
R \( 7 + t \) =  & 7 t^4 + 204 t^3 + 2039 t^2 + 7414 t + 4256 . $ <eq:shift-certificates>]
  Consequently $q_2 > 0$ and $r_0 < 0$ for every $n gt.eq 7$, while $q_0 + r_0 \/ 8 > 0$ and $q_1 > 0$ for every $n gt.eq 10$.
  Use the convention that $binom(m, j) = 0$ when $j < 0$ or $j > m$. For $3 lt.eq j lt.eq 2 n$, comparison of the factors in the binomial products gives
  #[#set math.equation(numbering: n => "(42)")
   $ binom(n, j) lt.eq 2^(- j) binom(2 n, j) . $ <eq:binomial-comparison>]
  Indeed $\( n - a \) \/ \( 2 n - a \) lt.eq 1 \/ 2$ for $0 lt.eq a < n$; if $j > n$ the left side is zero. For $n gt.eq 10$, the sum of the $q_0$ and $r_0$ contributions to the coefficient of $x^j$ is therefore at least
  $ (q_0 + r_0 / 2^j) binom(2 n, j) gt.eq (q_0 + r_0 / 8) binom(2 n, j) > 0 . $
  All other contributions are nonnegative. For $j > 2 n$, the $q_0$ and $r_0$ contributions vanish and every remaining term is nonnegative. Together with (39), this proves coefficient positivity for every $n gt.eq 10$.
  It remains to treat $n = 7 \, 8 \, 9$, where $q_1$ can be negative. For $3 lt.eq j lt.eq 2 n$, divide the coefficient of $x^j$ by $binom(2 n, j)$, discard the nonnegative $q_3 \, q_4 \, r_2$ contributions, and use (42) for the negative $r_0$ term. The resulting lower bound is
  #[#set math.equation(numbering: n => "(43)")
   $ q_0 + r_0 / 2^j + frac(j, 2 n - j + 1) (q_1 + q_2 frac(j - 1, 2 n - j + 2)) + r_1 binom(n, j - 1) / binom(2 n, j) . $ <eq:small-large-dimension-bound>]
  Substitution in (38) gives the componentwise lower bounds
  $ n & q_0 & q_1 & q_2 & r_0 & r_1\
7 & - 2 & - 11 & 60 & - 2 & 50\
8 & - 1 & - 6 & 72 & - 6 & 46\
9 & - 1 & - 6 & 72 & - 6 & 46 $
  All weights in (43) are nonnegative, so these bounds may be substituted directly. They give the following positive numbers at $j = 3 \, 4$; at $j = 5$ we have already omitted the final $r_1$ term:
  $ n & j = 3 & j = 4 & j = 5 med upright("without the final term")\
7 & 5 \/ 26 & 1233 \/ 1144 & 589 \/ 176\
8 & 37 \/ 28 & 10707 \/ 3640 & 1153 \/ 208\
9 & 101 \/ 136 & 3851 \/ 2040 & 395 \/ 112 $
  These finite substitutions can also be checked from the exact tuples $\( q_0 \, q_1 \, q_2 \, r_0 \, r_1 \)$:
  $ n = 7 : & quad (- 5984 / 3185 \, - 4832 / 455 \, 792 / 13 \, - 1216 / 637 \, 352 / 7) \,\
n = 8 : & quad (- 421 / 629 \, - 3736 / 629 \, 2688 / 37 \, - 145 / 37 \, 48) \,\
n = 9 : & quad (2416 / 10773 \, - 2192 / 1197 \, 100568 / 1197 \, - 57968 / 10773 \, 416 / 9) . $
  For $5 lt.eq j lt.eq 2 n$, the parenthesis $q_1 + q_2 \( j - 1 \) \/ \( 2 n - j + 2 \)$ is positive and increasing in $j$. In fact the displayed componentwise bounds give at $j = 5$ the positive lower bounds $119 \/ 11$, $210 \/ 13$, and $66 \/ 5$, respectively. The prefactor $j \/ \( 2 n - j + 1 \)$ is positive and increasing too, while $r_0 \/ 2^j$ increases because $r_0 < 0$. The expression (43) with its last term omitted is therefore increasing throughout this range. Positivity at $j = 5$ proves positivity at every subsequent index through $2 n$.
  For $j > 2 n$ all $r_i$ contributions vanish, since $n + 2 < 2 n + 1$. The only possibly negative term is the $q_1$ contribution at $j = 2 n + 1$. At this index the $q_1$ and $q_2$ contributions sum to $q_1 + 2 n q_2$, which the same componentwise bounds make at least $829 \, 1146 \, 1290$ for $n = 7 \, 8 \, 9$, respectively. For $j gt.eq 2 n + 2$ only the nonnegative $q_2 \, q_3 \, q_4$ terms remain. This handles every coefficient, including the endpoints.
  We have proved that the polynomial in (37) has nonnegative coefficients and a strictly positive coefficient of $x^2$ for every $n gt.eq 7$. It is consequently positive for every $x > 0$. Its multiplier $9 \( n + 4 \) z^(2 n) \/ c$ is positive, so $2 W \( z \) - cal(L) \( z \) > 0$ for $z > 1$. This finishes the proof of (31) and its strictness in every dimension. ◻
]

== 5 Variational representation and affine position <sec:position>

We next represent a support functional by a vector field of the form (13), and choose coordinates in which the associated norm power has no degree-two component. Throughout this section, $k$ has the value in (22), and $eta$ is a finite positive Borel measure with bounded support spanning $bb(R)^n$. Neither symmetry of $eta$ nor the functional condition (7) is needed here.

Let $A$ be a nonzero symmetric positive semidefinite matrix, and write $V = "range" \( A \)$. For an origin-symmetric convex body $L$ in $V$, with interior relative to $V$, put

$ tau_A \( L \) = integral h_L \( A x \) thin d eta \( x \) . $

We extend its gauge to $bb(R)^n$ by $g = g_L compose P_V$, where $P_V$ denotes orthogonal projection onto $V$. This extension is a seminorm, with kernel $V^perp$. Define

#[#set math.equation(numbering: n => "(44)")
 $ J \( g \) = cases(delim: "{", bb(E)_sigma log g \, & k = 1 \,, bb(E)_sigma g \, & k = 2 .) $ <eq:variational-objective>]

The logarithm is integrated outside the kernel, which is a spherical null set. When $A$ is positive definite, these objectives are chosen so that their Wulff first variations involve $g^(k - 1) nabla g = X_(g^k)$, the vector field in (21).

This variational construction belongs to the framework for dual curvature measures. The optimizer-to-measure argument corresponds to the $L_1$ dual Minkowski problem with dual parameter $q = 1 - k$: for $k = 2$, compare [7] Section 3.1, Lemmas 3.1–3.3; for $k = 1$ and full-dimensional bodies, minimization under $tau_A \( L \) = 1$ is equivalent, by polarity, to the $p = 1$ entropy maximization in [6] Section 5, Lemmas 5.1–5.3. Wang and Zhou established uniqueness and continuity for the relevant full-dimensional dual Minkowski problems [20] arXiv version, Theorems 1.1–1.3. Here we prove the representation in our normalization, together with uniqueness and continuity through changes of rank, where the gauges become seminorms. This continuity is required to select affine coordinates. The measures may have atoms, and all variations remain valid for nonsmooth minimizing bodies.

#thm([Lemma 5.1.])[
  #emph[For every nonzero symmetric positive semidefinite $A$, there is a unique origin-symmetric convex body $L_A$ in $V = "range" \( A \)$ that minimizes (44) subject to $tau_A \( L_A \) = 1$. Denote its extended gauge by $g_A$.]
] <lem:minimizer>

#proof[
  The spanning hypothesis gives a norm on $V$:
  $ q_A \( y \) = integral \| y dot.op A x \| thin d eta \( x \) . $
  Indeed, $q_A \( y \) = 0$ implies that $A y$ is orthogonal to $"supp" eta$, and hence $A y = 0$; because $y in V$, this forces $y = 0$. For any normalized competitor $L$ and $y in L$, symmetry gives $q_A \( y \) lt.eq tau_A \( L \) = 1$. Thus all normalized competitors have a common outer radius in $V$.
  We also need a bound on their gauges along a minimizing sequence. For any nonzero seminorm $g$, let $R = max_(S^(n - 1)) g$. By separation, $g$ is the support function of the compact symmetric set ${ z : z dot.op y lt.eq g \( y \) upright(" for every ") y in bb(R)^n }$. This set has maximal radius $R$: if $R e$ is a point of maximal norm in it, then
  #[#set math.equation(numbering: n => "(45)")
   $ g \( u \) gt.eq R \| u dot.op e \| #h(2em) \( u in S^(n - 1) \) . $ <eq:seminorm-coordinate-bound>]
  Consequently,
  $ J \( g \) gt.eq cases(delim: "{", log R + bb(E)_sigma log \| u_1 \| \, & k = 1 \,, R b_n \, & k = 2 .) $
  Here $bb(E)_sigma \| log \| u_1 \| \|^2 < oo$: the first coordinate has a density proportional to $\( 1 - t^2 \)^(\( n - 3 \) \/ 2)$ on $\( - 1 \, 1 \)$, and $integral_0^(1 \/ 2) \| log t \|^2 thin d t < oo$. In particular every nonzero seminorm has a finite logarithmic objective.
  Set $b_A = integral \| A x \| thin d eta \( x \) > 0$. The ball of radius $1 \/ b_A$ in $V$ is a normalized competitor. Comparison with this ball bounds $J$ above along a minimizing sequence, so the preceding inequalities bound $R$ above. The bodies therefore contain a common inner ball in $V$, as well as lying in a common outer ball. Their gauges are uniformly bounded and equicontinuous on the unit sphere of $V$. A subsequence converges uniformly to the gauge of a body with the same two ball bounds. The support functions converge uniformly as well, so the normalization passes to the limit. The objective also passes to the limit: in the logarithmic case the extended gauges are uniformly comparable to $\| P_V u \|$, whose logarithm is integrable by (45). This proves existence.
  For uniqueness, let $L_0 \, L_1$ be two minimizers and $L_t = \( 1 - t \) L_0 + t L_1$, where $0 < t < 1$. Its normalization remains one. For $P_V u eq.not 0$, write $rho_i \( u \) = 1 \/ g_(L_i) \( P_V u \)$. Taking points on the ray through $P_V u$ gives
  $ frac(1, g_(L_t) \( P_V u \)) gt.eq \( 1 - t \) rho_0 \( u \) + t rho_1 \( u \) . $
  Both $- log rho$ and $1 \/ rho$ are strictly convex decreasing functions of $rho > 0$. Thus the objective of $L_t$ is at most the interpolated objectives, and the inequality is strict wherever $rho_0 eq.not rho_1$. Distinct bodies have different radial functions on an open set of directions in $V$, which gives a set of positive spherical measure after projection. They would therefore give a strictly smaller objective, a contradiction. ◻
]

#thm([Proposition 5.2.])[
  (Variational representation).  #emph[Suppose $A$ is positive definite, and let $L$ be any positive dilate of $L_A$, with gauge $g = g_L$. For every continuous even function $phi.alt : bb(R)^n arrow.r bb(R)$ that is positively homogeneous of degree one, 
#[#set math.equation(numbering: n => "(46)")
 $ integral phi.alt \( A x \) thin d eta \( x \) = s thin bb(E)_sigma phi.alt #scale(x: 120%, y: 120%)[\(] X_(g^k) \( u \) #scale(x: 120%, y: 120%)[\)] \, #h(2em) s = frac(tau_A \( L \), bb(E)_sigma g^(k - 1)) . $ <eq:representation>]

 Here, almost everywhere on the sphere, 
#[#set math.equation(numbering: n => "(47)")
 $ X_(g^k) = g^k u + g^(k - 1) nabla_S g = g^(k - 1) nabla g . $ <eq:norm-power-field>]

]
] <prop:representation>

#proof[
  Normalization turns the minimization problem into minimizing $J \( tau_A \( L \) g_L \)$ over all symmetric bodies. Put $tau = tau_A \( L \)$ and $I = integral phi.alt \( A x \) thin d eta \( x \)$. For small positive or negative $t$, define the body
  $ W_t = { y in bb(R)^n : y dot.op v lt.eq h_L \( v \) + t phi.alt \( v \) upright(" for all ") v in S^(n - 1) #scale(x: 120%, y: 120%)[}] \, #h(2em) g_t = g_(W_t) . $
  The constraint is positive for sufficiently small $\| t \|$, so $W_t$ is a symmetric convex body. Although that constraint need not be a support function, it bounds the actual support function above. Therefore
  $ tau_A \( W_t \) lt.eq tau + t I . $
  Both quantities are positive for small $\| t \|$. Since $J$ increases under pointwise increase of a positive gauge, minimality gives
  #[#set math.equation(numbering: n => "(48)")
   $ J #scale(x: 120%, y: 120%)[\(] \( tau + t I \) g_t #scale(x: 120%, y: 120%)[\)] gt.eq J #scale(x: 120%, y: 120%)[\(] tau_A \( W_t \) g_t #scale(x: 120%, y: 120%)[\)] gt.eq J \( tau g \) \, $ <eq:wulff-minimum>]
  with equality at $t = 0$.
  Lemma 2 gives
  $ frac(d, d t)\|_(t = 0) g_t \( u \) = - g \( u \) phi.alt \( nabla g \( u \) \) $
  almost everywhere, with uniform bounds that permit differentiation of the objective. The left side of (48) has a two-sided minimum at zero. Its derivative is consequently zero:
  $ I / tau = bb(E)_sigma phi.alt \( nabla g \) quad \( k = 1 \) \, #h(2em) I bb(E)_sigma g = tau bb(E)_sigma #scale(x: 120%, y: 120%)[\[] g phi.alt \( nabla g \) #scale(x: 120%, y: 120%)[\]] quad \( k = 2 \) . $
  Equivalently,
  $ I / tau = frac(bb(E)_sigma #scale(x: 120%, y: 120%)[\[] g^(k - 1) phi.alt \( nabla g \) #scale(x: 120%, y: 120%)[\]], bb(E)_sigma g^(k - 1)) . $
  Euler’s identity for the homogeneous gauge gives (47), and positive homogeneity of $phi.alt$ then gives (46). The argument applies to both signs of $t$ without imposing convexity on the varied constraint. ◻
]

To select a position we allow the matrix to approach the boundary of the compact convex set

#[#set math.equation(numbering: n => "(49)")
 $ cal(A) = { A = A^t gt.eq 0 : "tr" A = 1 } . $ <eq:matrix-domain>]

The minimizers extend continuously to this boundary, even though their ambient unit sets may become cylinders.

#thm([Lemma 5.3.])[
  #emph[The map $A mapsto g_A \|_(S^(n - 1))$ is continuous on $cal(A)$ in the uniform norm.]
] <lem:matrix-continuity>

#proof[
  Let $A_j arrow.r A$ in $cal(A)$, and write $V_j = "range" \( A_j \)$, $g_j = g_(A_j)$, and $b_j = integral \| A_j x \| thin d eta \( x \)$. Then $b_j arrow.r b = integral \| A x \| thin d eta \( x \) > 0$. The normalized ball in $V_j$ has extended gauge $b_j \| P_(V_j) u \|$, and hence objective at most $log b_j$ if $k = 1$, and at most $b_j$ if $k = 2$. By (45), this bounds $R_j = max_(S^(n - 1)) g_j$ uniformly above. The minimizing body contains the ball of radius $1 \/ R_j$ in $V_j$, so its normalization gives $1 gt.eq b_j \/ R_j$. Thus $R_j gt.eq b_j$, bounded away from zero.
  The seminorms $g_j$ have uniformly bounded Lipschitz constants. Every subsequence therefore has a further subsequence converging uniformly on $S^(n - 1)$ to a nonzero seminorm $g$. Along such a subsequence,
  #[#set math.equation(numbering: n => "(50)")
   $ J \( g_j \) arrow.r J \( g \) . $ <eq:objective-limit>]
  For $k = 2$ this is immediate. For $k = 1$, choose unit vectors $e_j$ with $g_j \( u \) gt.eq R_j \| u dot.op e_j \|$. The positive parts of $log g_j$ are uniformly bounded, and their negative parts have uniformly bounded squared integrals, by rotation invariance and $bb(E)_sigma \| log \| u_1 \| \|^2 < oo$. These logarithms are therefore uniformly integrable. They converge almost everywhere to $log g$, since the kernel of a nonzero seminorm is a proper subspace. Truncating the logarithms below at $- M$ and then sending $M$ to infinity proves (50); the discarded integrals are uniformly $O \( M^(- 1) \)$ by the squared-integral bound.
  We identify this subsequential limit. Set $Z = { g lt.eq 1 }$ and $Z_j = { g_j lt.eq 1 }$, allowing infinite values for their support functions. If $g \( y \) < 1$, then $y in Z_j$ for all sufficiently large $j$. Testing the support functions against $y$ and then taking the supremum gives, for every $x$,
  #[#set math.equation(numbering: n => "(51)")
   $ h_Z \( A x \) lt.eq liminf_j h_(Z_j) \( A_j x \) . $ <eq:cylinder-support-limit>]
  The supremum over $g \( y \) < 1$ equals $h_Z$, by scaling towards zero. Since $Z_j = L_(A_j) + V_j^perp$ and $A_j x in V_j$, its support function at $A_j x$ equals that of $L_(A_j)$. All these support functions are nonnegative, so Fatou’s lemma yields
  #[#set math.equation(numbering: n => "(52)")
   $ integral h_Z \( A x \) thin d eta \( x \) lt.eq 1 . $ <eq:cylinder-normalization>]
  Let $V = "range" \( A \)$ and $L_0 = overline(P_V Z)$. This projection is bounded despite the possible unboundedness of $Z$. Indeed, for every $z in Z$, symmetry and (52) give
  $ q_A \( P_V z \) = integral \| z dot.op A x \| thin d eta \( x \) lt.eq integral h_Z \( A x \) thin d eta \( x \) lt.eq 1 . $
  The norm $q_A$ bounds the radius in $V$. Moreover $Z$ contains a Euclidean ball, so $L_0$ has interior in $V$. Its extended gauge $macron(g) = g_(L_0) compose P_V$ satisfies $macron(g) lt.eq g$, and
  #[#set math.equation(numbering: n => "(53)")
   $ 0 < c_0 := tau_A \( L_0 \) = integral h_Z \( A x \) thin d eta \( x \) lt.eq 1 . $ <eq:projected-normalization>]
  For the opposite comparison, let $N$ be any full-dimensional symmetric convex body in $bb(R)^n$. The extended gauge of its projection to $V_j$ is at most $g_N$, and this projected body’s normalization is $tau_(A_j) \( N \)$. Minimality and monotonicity give
  $ J \( g_j \) lt.eq J #scale(x: 120%, y: 120%)[\(] tau_(A_j) \( N \) g_N #scale(x: 120%, y: 120%)[\)] . $
  Passing to the limit, using (50) and continuity of $tau_(A_j) \( N \)$, gives
  #[#set math.equation(numbering: n => "(54)")
   $ J \( g \) lt.eq J #scale(x: 120%, y: 120%)[\(] tau_A \( N \) g_N #scale(x: 120%, y: 120%)[\)] . $ <eq:full-body-comparison>]
  Take $N = N_R = L_A + R B_(V^perp)$, the orthogonal product of the minimizing body in $V$ and a ball of radius $R$ in $V^perp$. Then $tau_A \( N_R \) = 1$ and
  $ g_(N_R) \( u \) = max { g_A \( u \) \, \| P_(V^perp) u \| \/ R } arrow.b g_A \( u \) . $
  For $k = 1$, the integrable function $log g_A$ is a lower bound for these logarithms, and their positive parts are uniformly bounded for $R gt.eq 1$; hence the objectives converge. The case $k = 2$ is immediate. Thus (54) implies $J \( g \) lt.eq J \( g_A \)$.
  Finally, $c_0 macron(g)$ is the extended gauge of the normalized body $L_0 \/ c_0$. Since $c_0 macron(g) lt.eq g$, we have
  $ J \( g_A \) lt.eq J \( c_0 macron(g) \) lt.eq J \( g \) lt.eq J \( g_A \) . $
  Strict increase of the objective integrands forces $c_0 macron(g) = g$ almost everywhere, and then everywhere by continuity. Uniqueness in Lemma 14 gives $c_0 macron(g) = g_A$. Thus every subsequential limit is $g_A$, which proves the asserted continuity. ◻
]

We use Brouwer’s fixed-point theorem to complete the choice of position. We record the compact-convex formulation and its short reduction to the simplex theorem [1] Satz 4, p. 115; the nearest-point inequality in the reduction will also be used below.

#thm([Lemma 5.4.])[
  (A finite-dimensional fixed-point principle).  #emph[Every continuous self-map of a nonempty compact convex subset of a finite-dimensional Euclidean space has a fixed point.]
] <lem:fixed-point>

#proof[
  Let the convex set be $D$, and work in its affine hull, of dimension $d$. The case $d = 0$ is immediate. The nearest-point projection $pi$ onto $D$ exists by compactness and is unique by strict convexity of squared distance along a segment between distinct minimizers. Minimizing along segments gives
  $ chevron.l x - pi \( x \) \, z - pi \( x \) chevron.r lt.eq 0 #h(2em) \( z in D \) . $
  Applying this twice yields
  $ \| pi \( x \) - pi \( y \) \|^2 lt.eq chevron.l x - y \, pi \( x \) - pi \( y \) chevron.r \, $
  so $pi$ is continuous. If $T : D arrow.r D$ is continuous, choose a $d$-simplex $Delta$ containing $D$ and set $G = T compose pi : Delta arrow.r Delta$.
  Brouwer’s theorem for a simplex gives $v = G \( v \)$. Since $G \( Delta \) subset D$, this point lies in $D$, hence $pi \( v \) = v$ and $T \( v \) = v$. ◻
]

#thm([Proposition 5.5.])[
  (Affine position).  #emph[There is a symmetric positive definite matrix $A$ with $det A = 1$ such that $g_A^k$ has zero component in $cal(H)_2$.]
] <prop:position>

#proof[
  On $cal(A)$ define the symmetric traceless matrix
  #[#set math.equation(numbering: n => "(55)")
   $ cal(F) \( A \) = frac(bb(E)_sigma \[ g_A \( u \)^k u u^t \], bb(E)_sigma g_A^k) - 1 / n I_n . $ <eq:position-field>]
  It is continuous by Lemma 16; its denominator is positive because $g_A$ is a nonzero seminorm.
  The direction $- cal(F) \( A \)$ points strictly into the positive cone along every missing direction of a singular matrix. To compute this, let $A$ be singular and $e$ a unit vector in $ker A$. For a standard Gaussian $Y$ in $bb(R)^n$, $g_A \( Y \)$ depends only on the projection of $Y$ to $"range" \( A \)$, and is independent of $Y dot.op e$. Separating the Gaussian radial and angular variables therefore gives
  $ frac(bb(E)_sigma \[ g_A \( u \)^k \( u dot.op e \)^2 \], bb(E)_sigma g_A^k) & = frac(bb(E) \[ g_A \( Y \)^k \( Y dot.op e \)^2 \], bb(E) g_A \( Y \)^k) frac(bb(E) \| Y \|^k, bb(E) \| Y \|^(k + 2))\
 & = frac(1, n + k) . $
  The last radial moment ratio follows by integration by parts in $integral_0^oo r^(n + k - 1) e^(- r^2 \/ 2) thin d r$. It follows, by polarization on $ker A$, that
  #[#set math.equation(numbering: n => "(56)")
   $ cal(F) \( A \)\|_(ker A) = - frac(k, n \( n + k \)) I_(ker A) . $ <eq:kernel-field>]
  The range–kernel block of $cal(F) \( A \)$ is zero: reflecting all kernel coordinates preserves $g_A$ and reverses each mixed product. Consequently $A - epsilon.alt cal(F) \( A \)$ is positive definite for sufficiently small $epsilon.alt > 0$. On the kernel this follows from (56); on the range it follows from the positive definiteness of the restriction of $A$. Its trace is one. The same perturbation is allowed at a positive definite $A$ for sufficiently small $epsilon.alt$.
  Use the Euclidean inner product $chevron.l U \, W chevron.r = "tr" \( U W \)$ on symmetric matrices, and consider the continuous map
  $ A mapsto "proj"_(cal(A)) #scale(x: 120%, y: 120%)[\(] A - cal(F) \( A \) #scale(x: 120%, y: 120%)[\)] . $
  Lemma 17 provides a fixed point $A$. The nearest-point condition there is
  $ chevron.l cal(F) \( A \) \, B - A chevron.r gt.eq 0 #h(2em) \( B in cal(A) \) . $
  We may take $B = A - epsilon.alt cal(F) \( A \)$, as just shown. This gives $- epsilon.alt "tr" \( cal(F) \( A \)^2 \) gt.eq 0$, hence $cal(F) \( A \) = 0$. Formula (56) rules out singularity, so $A$ is positive definite.
  For every symmetric traceless matrix $H$, the vanishing field gives
  $ bb(E)_sigma #scale(x: 120%, y: 120%)[\[] g_A \( u \)^k u^t H u #scale(x: 120%, y: 120%)[\]] = 0 . $
  These quadratics are exactly $cal(H)_2$, since the Euclidean Laplacian of $x^t H x$ is $2 "tr" H$. Thus the required degree-two component vanishes.
  Finally, for $a > 0$ the correspondence $L mapsto L \/ a$ between normalized competitors for $A$ and $a A$ gives
  #[#set math.equation(numbering: n => "(57)")
   $ g_(a A) = a g_A . $ <eq:minimizer-scaling>]
  Indeed, $tau_(a A) \( L \/ a \) = tau_A \( L \)$, while multiplying a gauge by $a$ adds $log a$ to the logarithmic objective and multiplies the linear objective by $a$. The minimizers therefore correspond. Taking $a = \( det A \)^(- 1 \/ n)$ makes the determinant one and preserves the vanishing degree-two component. ◻
]

Only one measure needs the position of Proposition 18. For a second measure, Proposition 15 provides the required vector field in the resulting coordinates without a simultaneous position condition.

== 6 The bilinear inequality and equality cases <sec:conclusion>

We now combine the spherical and variational estimates. Recall that an admissible measure satisfies the support-functional inequality (7), and need not itself be symmetric.

#thm([Theorem 6.1.])[
  #emph[Let $eta \, zeta$ be finite positive measures on $bb(R)^n$ with bounded, spanning support. Suppose that both satisfy (7). Then 
#[#set math.equation(numbering: n => "(58)")
 $ integral.double \| x dot.op y \| thin d eta \( x \) d zeta \( y \) gt.eq b_n . $ <eq:bilinear>]

 If equality holds, there is an origin-centered ellipsoid $E_0$ such that 
$ integral h_(E_0) thin d eta = \( \| E_0 \| \/ kappa_n \)^(1 \/ n) . $

]
] <thm:bilinear>

#proof[
  Choose $k$ as in (22) and write $c = c_(n \, k)$. Apply Proposition 18 to $eta$, obtaining a symmetric positive definite matrix $A$ with determinant one. Replace $eta$ by its image under $A$ and $zeta$ by its image under $A^(- 1)$. Their pairing is unchanged, since $\( A x \) dot.op \( A^(- 1) y \) = x dot.op y$. Their support-functional inequalities also persist: for any linear map $T$,
  $ h_M \( T x \) = h_(T^t M) \( x \) \, $
  and $\| T^t M \| = \| M \|$ when $\| det T \| = 1$.
  For the first transformed measure, the support functional at the identity is precisely the original $tau_A$. Its unique minimizing body is therefore $L_A$, with the degree-two cancellation supplied by Proposition 18. For each transformed measure choose its minimizing body as in Proposition 15, and rescale that body to volume $kappa_n$. Let the resulting gauges be $g_1 \, g_2$, and put
  $ f_i = g_i^k \, #h(2em) t_i = bb(E)_sigma g_i^(k - 1) \, #h(2em) s_i = frac(tau_i \( L_i \), t_i) \, #h(2em) a_i = s_i bb(E)_sigma f_i quad \( i = 1 \, 2 \) \, $
  where $tau_i$ is the functional of the corresponding transformed measure. Thus
  #[#set math.equation(numbering: n => "(59)")
   $ bb(E)_sigma g_i^(- n) = 1 \, #h(2em) s_i t_i gt.eq 1 \, #h(2em) a_i gt.eq 1 . $ <eq:normalized-parameters>]
  For the last inequality, if $k = 1$ then $bb(E)_sigma g_i gt.eq 1 = t_i$ by the negative-moment normalization. If $k = 2$, the same normalization gives $bb(E)_sigma g_i gt.eq 1$, and $bb(E)_sigma g_i^2 gt.eq \( bb(E)_sigma g_i \)^2 gt.eq bb(E)_sigma g_i = t_i$. The first function $f_1$ has no degree-two harmonic component; scalar rescaling does not alter this property.
  Apply (46) to $\| x dot.op y \|$ successively in both variables. These are even continuous homogeneous tests, so the formula applies despite any asymmetry of the measures. It gives
  #[#set math.equation(numbering: n => "(60)")
   $ integral.double \| x dot.op y \| thin d eta \( x \) d zeta \( y \) & = s_1 s_2 integral.double \| X_(f_1) \( u \) dot.op X_(f_2) \( v \) \| thin d sigma \( u \) d sigma \( v \)\
 & gt.eq b_n s_1 s_2 cal(B) \( f_1 \, f_2 \) . $ <eq:pairing-sign>]
  The pointwise inequality in the last line uses the test $"sgn" \( u dot.op v \)$. Proposition 10 now gives
  $ b_n^(- 1) integral.double \| x dot.op y \| thin d eta \( x \) d zeta \( y \) gt.eq a_1 a_2 - s_1 s_2 c ∥Q f_1∥_2 ∥Q f_2∥_2 . $
  By Theorem 11 and (59),
  #[#set math.equation(numbering: n => "(61)")
   $ s_i^2 c ∥Q f_i∥_2^2 lt.eq a_i^2 - s_i^2 t_i^2 lt.eq a_i^2 - 1 . $ <eq:error-absorption>]
  Consequently the last lower bound is at least
  $ a_1 a_2 - sqrt(\( a_1^2 - 1 \) \( a_2^2 - 1 \)) gt.eq 1 . $
  Indeed $a_1 a_2 - 1 gt.eq 0$ and
  $ \( a_1 a_2 - 1 \)^2 - \( a_1^2 - 1 \) \( a_2^2 - 1 \) = \( a_1 - a_2 \)^2 gt.eq 0 . $
  This proves (58).
  Suppose equality holds. If $a_i > 1$, the inequality $s_i^2 c ∥Q f_i∥_2^2 lt.eq a_i^2 - 1$ is strict: this follows from Theorem 11 when $g_i$ is nonconstant, and from its zero left side when $g_i$ is constant. If both $a_i$ exceed one, the product error in (61) is therefore strictly smaller than the displayed square root. If exactly one exceeds one, the error product vanishes and $a_1 a_2 > 1$. Both alternatives contradict equality, so $a_1 = a_2 = 1$. In particular, $bb(E)_sigma g_1^k lt.eq bb(E)_sigma g_1^(k - 1)$. For $k = 1$, this forces $bb(E)_sigma g_1 = 1$ and equality in the negative-moment power-mean bound; hence $g_1 = 1$. For $k = 2$, the chain
  $ 1 lt.eq bb(E)_sigma g_1 lt.eq \( bb(E)_sigma g_1 \)^2 lt.eq bb(E)_sigma g_1^2 lt.eq bb(E)_sigma g_1 $
  again forces constancy and then $g_1 = 1$. Thus $s_1 = 1$, and the support-functional condition of the transformed first measure is sharp on $B_2^n$. Undoing the transformation makes the original condition sharp on $A^t B_2^n$, which is an origin-centered ellipsoid of volume $kappa_n$. ◻
]

#proof[
  Translate $K$ so that the origin is in its interior, and first rescale it to satisfy $\| K \| = kappa_n$. Proposition 6 supplies the admissible measure $eta_K$. Set
  $ r = (frac(\| Pi K \|, kappa_n))^(1 \/ n) \, #h(2em) D = 1 / r Pi K . $
  The symmetric body $D$ has volume $kappa_n$, so it too has an admissible measure $eta_D$. Its own support-functional integral is one: the volume derivative under $D + t D = \( 1 + t \) D$ gives
  $ integral h_D thin d eta_D = frac(1, n kappa_n) frac(d, d t)\|_(0 +) \| \( 1 + t \) D \| = 1 . $
  Using (9) and Theorem 19,
  $ 1 = frac(n kappa_n, 2 r) integral.double \| x dot.op y \| thin d eta_K \( x \) d eta_D \( y \) gt.eq frac(n kappa_n b_n, 2 r) . $
  Equation (11) yields $r gt.eq kappa_(n - 1)$, or $\| Pi K \| gt.eq kappa_n kappa_(n - 1)^n$ under the current normalization. The projection body scales as $Pi \( a K \) = a^(n - 1) Pi K$ for $a > 0$. Undoing the volume normalization proves (1).
  If equality holds, the pairing of $eta_K$ and $eta_D$ equals $b_n$. Theorem 19 gives an ellipsoid on which the support-functional bound for $eta_K$ is sharp. The equality assertion of Proposition 6 then makes $K$ a translate of a positive dilate of that ellipsoid.
  For the converse, the quotient is invariant under translations and invertible linear maps. To verify the latter directly, the segment volume derivative gives, for every vector $y$ and every invertible $T$,
  $ 2 h_(Pi \( T K \)) \( y \) & = frac(d, d t)\|_(0 +) \| T K + t \[ - y \, y \] \|\
 & = \| det T \| frac(d, d t)\|_(0 +) \| K + t \[ - T^(- 1) y \, T^(- 1) y \] \|\
 & = 2 \| det T \| h_(Pi K) \( T^(- 1) y \) . $
  Hence $Pi \( T K \) = \| det T \| T^(- t) Pi K$ and $\| Pi \( T K \) \| = \| det T \|^(n - 1) \| Pi K \|$, exactly matching the factor in $\| T K \|^(n - 1)$. Finally, $Pi B_2^n = kappa_(n - 1) B_2^n$ gives equality for the ball, and therefore for every ellipsoid. ◻
]

== 7 Consequences <sec:consequences>

Theorem 1, together with the separate three-dimensional theorem of Chen, Feng, Li, Xi, and Xu [2] Theorem 1.1, gives Petty’s projection-volume inequality and its ellipsoid equality case in every dimension $n gt.eq 3$. We now apply this combined conclusion to lower-degree projection bodies, affine functional inequalities, and isoperimetry in normed spaces. The implications and equality assertions are specified separately in each setting.

=== 7.1 Lower-degree projection bodies <lower-degree-projection-bodies>

For a convex body $L subset bb(R)^m$, use the standard intrinsic volumes $V_j \( L \)$, normalized by the Steiner formula

$ "vol"_m \( L + t B_2^m \) = sum_(j = 0)^m kappa_(m - j) V_j \( L \) t^(m - j) \, #h(2em) t gt.eq 0 \, #h(2em) kappa_0 = 1 . $

This is the normalization in [15] author version, Section 2, p. 6; on a hyperplane we use its induced Euclidean structure. For $1 lt.eq i lt.eq n - 1$, the degree-$i$ projection body $Pi_i K$ is defined by

$ h_(Pi_i K) \( u \) = V_i \( K \| u^perp \) \, #h(2em) u in S^(n - 1) \, $

where $K \| u^perp = "proj"_(u^perp) K$. In particular, $Pi_(n - 1) K = Pi K$ because $V_(n - 1)$ on $u^perp$ is its $\( n - 1 \)$-dimensional volume.

#thm([Corollary 7.1.])[
  (Lutwak–Petty lower-degree inequalities).  #emph[Let $n gt.eq 3$ and $1 lt.eq i lt.eq n - 1$ be integers, and let $K subset bb(R)^n$ be a convex body with nonempty interior. Then 
#[#set math.equation(numbering: n => "(62)")
 $ frac(V_(i + 1) \( Pi_i K \), V_(i + 1) \( K \)^i) & gt.eq frac(V_(i + 1) \( Pi_i B_2^n \), V_(i + 1) \( B_2^n \)^i)\
 & = (binom(n - 1, i) kappa_(n - 1) / kappa_(n - i - 1))^(i + 1) / (binom(n, i + 1) kappa_n / kappa_(n - i - 1))^(i - 1) . $ <eq:lutwak-petty>]

 The lower bound is sharp, since $K = B_2^n$ attains it.]
] <cor:lutwak-petty>

#proof[
  Theorem 1 and the separately proved three-dimensional result [2] Theorem 1.1 establish Petty’s conjecture for every $n gt.eq 3$. Lutwak’s conditional result [10], in the explicit formulation of Ortega-Moreno and Schuster [15] author version, Introduction, p. 2, states that Petty’s conjecture implies the Euclidean-ball lower bound for these ratios for every $1 lt.eq i lt.eq n - 1$. Applying that implication gives the inequality. For its explicit value, the Steiner normalization gives
  $ V_j \( B_2^m \) = binom(m, j) kappa_m / kappa_(m - j) \, #h(2em) Pi_i B_2^n = V_i \( B_2^(n - 1) \) B_2^n . $
  The $\( i + 1 \)$-homogeneity of $V_(i + 1)$ now gives the displayed ball ratio. Only the inequality conclusion of the conditional result is used. ◻
]

At $i = n - 1$, the displayed constant is $kappa_(n - 1)^(thin n) kappa_n^(thin 2 - n)$, exactly the constant in Equation (1). The case $i = 1$ was already established by Lutwak, as recalled in [15] author version, Introduction, p. 2. Thus the additional range furnished here is $2 lt.eq i lt.eq n - 2$ for $n gt.eq 4$. No classification of equality cases is asserted for Corollary 20.

=== 7.2 A sharp affine $L^1$ Sobolev consequence <a-sharp-affine-l1-sobolev-consequence>

For functions $f_1 \, dots.h \, f_n in C_c^1 \( bb(R)^n \)$, define the mixed determinant-gradient integral

$ cal(D)_n \( f_1 \, dots.h \, f_n \) = integral_(\( bb(R)^n \)^n) lr(|det #scale(x: 120%, y: 120%)[\(] nabla f_1 \( x_1 \) \, dots.h \, nabla f_n \( x_n \) #scale(x: 120%, y: 120%)[\)]|) thin d x_1 dots.h.c d x_n . $

The determinant is the volume of the spanned parallelepiped, with no factor $1 \/ n !$. Under $f_i \( x \) mapsto f_i \( A x + b \)$ with $A$ invertible, this integral and the product of the $L^(n \/ \( n - 1 \))$ norms below both scale by $\| det A \|^(1 - n)$.

#thm([Corollary 7.2.])[
  (Mixed determinant-gradient and affine Sobolev inequalities).  #emph[Let $n gt.eq 3$ be an integer, put $q = n \/ \( n - 1 \)$, and let $f_1 \, dots.h \, f_n in C_c^1 \( bb(R)^n \)$ be nonnegative. Then 
#[#set math.equation(numbering: n => "(63)")
 $ cal(D)_n \( f_1 \, dots.h \, f_n \) gt.eq n ! thin kappa_(n - 1)^(thin n) kappa_n^(thin 2 - n) product_(i = 1)^n ∥f_i∥_q . $ <eq:mixed-affine-sobolev>]

 In particular, every nonnegative $f in C_c^1 \( bb(R)^n \)$ satisfies the affine $L^1$ Sobolev inequality 
#[#set math.equation(numbering: n => "(64)")
 $ cal(D)_n \( f \, dots.h \, f \)^(1 \/ n) gt.eq \( n ! \)^(1 \/ n) kappa_(n - 1) kappa_n^(\( 2 - n \) \/ n) ∥f∥_q . $ <eq:affine-sobolev>]

 Both constants are sharp in this class, through smooth approximation of ellipsoid indicators in $B V \( bb(R)^n \)$; no equality assertion for nonzero $C_c^1$ functions is made.]
] <cor:affine-sobolev>

#proof[
  Write $c_n = kappa_(n - 1)^(thin n) kappa_n^(thin 2 - n)$. Haddad’s geometric functional $tilde(I)_1 \( K_1 \, dots.h \, K_n \)$ integrates the absolute determinant against the surface-area measures of the convex bodies $K_i$. He uses
  $ h_(Pi K) \( u \) = 1 / 2 integral_(S^(n - 1)) \| ⟨u \, v⟩ \| thin d S_K \( v \) \, $
  which is the projection-volume normalization above by Cauchy’s projection formula. His mixed-volume identity and the Aleksandrov–Fenchel inequality give
  $ frac(1, n !) tilde(I)_1 \( K_1 \, dots.h \, K_n \) = V \( Pi K_1 \, dots.h \, Pi K_n \) gt.eq product_(i = 1)^n \| Pi K_i \|^(1 \/ n) . $
  Here $V$ denotes mixed volume, and Haddad’s $omega_m$ is our unit-ball volume $kappa_m$; see [4] arXiv version, Introduction, p. 5. Theorem 1 for $n gt.eq 4$ and the separately proved three-dimensional case [2] Theorem 1.1 therefore give
  $ tilde(I)_1 \( K_1 \, dots.h \, K_n \) gt.eq n ! c_n product_(i = 1)^n \| K_i \|^(\( n - 1 \) \/ n) . $
  Haddad’s Lemma 5.1 and the equivalence of Equations (18)–(21) [4] arXiv version, Section 5, pp. 16–17 transfer this $p = 1$ geometric inequality to the functional inequality for $cal(D)_n$, with critical exponent $p^(*) = n \/ \( n - 1 \) = q$. At this endpoint his normalized weak profile for $K$ is $upright(bold(1))_K$, with the same surface-area measure as $K$ and $∥upright(bold(1))_K∥_q = \| K \|^(\( n - 1 \) \/ n)$; see [4] arXiv version, Equation (9) and Definition 2.2, pp. 8–9. Consequently the functional and geometric sharp constants agree, as also follows from the constant relations after his Equation (21). This proves Equation (63); taking all $f_i = f$ gives Equation (64), the $p = 1$ case of his Equation (22).
  For sharpness, take nonnegative compactly supported smooth mollifications $f_j$ of the indicator of an ellipsoid $E$. They converge to $upright(bold(1))_E$ strictly in $B V \( bb(R)^n \)$ and in $L^q$. Define finite measures $nu_j$ on the sphere by
  $ integral psi thin d nu_j = integral_({ nabla f_j eq.not 0 }) psi #h(-0.16667em) (- frac(nabla f_j, \| nabla f_j \|)) \| nabla f_j \| thin d x \, #h(2em) psi in C \( S^(n - 1) \) . $
  Reshetnyak’s continuity theorem [19] author version, Theorem 1.3, p. 3 gives $nu_j harpoon.rt S_E$; the minus sign selects the outward normal in $D upright(bold(1))_E$. The product measures also converge weakly on the compact product sphere. Since the absolute determinant is continuous and homogeneous in each variable, this gives $cal(D)_n \( f_j \, dots.h \, f_j \) arrow.r tilde(I)_1 \( E \, dots.h \, E \) = n ! \| Pi E \|$. Since $∥upright(bold(1))_E∥_q^n = \| E \|^(n - 1)$, ellipsoid equality in Petty’s inequality gives the stated constants in the limit. This is the weak $p = 1$ interpretation of sharpness. ◻
]

To compare the diagonal statement with Zhang’s affine Sobolev inequality, let $f eq.not 0$ be as in Corollary 21 and define the origin-symmetric convex body $Z_f$ by

$ h_(Z_f) \( u \) = 1 / 2 integral_(bb(R)^n) \| u dot.op nabla f \( x \) \| thin d x . $

This integral is positive for every unit vector $u$: otherwise $f$ would be constant on every line parallel to $u$, contradicting compact support and $f eq.not 0$. Thus $Z_f$ has nonempty interior. Haddad’s zonoid identity gives $\| Z_f \| = cal(D)_n \( f \, dots.h \, f \) \/ n !$, and his Blaschke–Santaló comparison [4] arXiv version, Equations (24)–(25), p. 17 yields

$ \| Z_f^compose \|^(- 1 \/ n) gt.eq (frac(cal(D)_n \( f \, dots.h \, f \), n ! kappa_n^2))^(1 \/ n) gt.eq kappa_(n - 1) / kappa_n ∥∥ f_q . $

The resulting bound on $\| Z_f^compose \|$ is Zhang’s sharp affine Sobolev inequality [21]. Thus Equation (64) is a stronger affine $L^1$ inequality; the case $f = 0$ is immediate. This application uses only $p = 1$ and gives no conclusion for Haddad’s $p > 1$ problems.

=== 7.3 Holmes–Thompson isoperimetry <holmesthompson-isoperimetry>

#thm([Corollary 7.3.])[
  (Holmes–Thompson isoperimetry).  #emph[Let $n gt.eq 3$, let $B = - B subset bb(R)^n$ be the unit ball of a real normed space, and let $C subset bb(R)^n$ be a convex body. Write $B^compose$ for the polar unit ball and put $I_B = Pi \( B^compose \) \/ kappa_(n - 1)$. Normalize the Holmes–Thompson volume and boundary area by 
$ cal(V)_B \( C \) = frac(\| B^compose \|, kappa_n) \| C \| \, #h(2em) cal(A)_B \( partial C \) = n V \( C \[ n - 1 \] \, I_B \) \, $

 where $V \( C \[ n - 1 \] \, I_B \)$ is mixed volume with $n - 1$ copies of $C$, normalized by $V \( C \[ n \] \) = \| C \|$. Then 
#[#set math.equation(numbering: n => "(65)")
 $ cal(A)_B \( partial C \)^n gt.eq n^n kappa_n thin cal(V)_B \( C \)^(n - 1) . $ <eq:holmes-thompson>]

 Equality holds if and only if $B$ is an ellipsoid and $C = x + t B$ for some $x in bb(R)^n$ and $t > 0$.]
] <cor:holmes-thompson>

#proof[
  The fixed-norm isoperimetrix formula and the equivalence with symmetric unpolarized Petty are classical; see Martini–Mustafaev [12] Definition 1(i), Equation (2), Section 5, and Theorem 12. Minkowski’s mixed-volume inequality gives
  $ frac(cal(A)_B \( partial C \)^n, cal(V)_B \( C \)^(n - 1)) gt.eq n^n kappa_n^(n - 1) / kappa_(n - 1)^n R_n \( B^compose \) gt.eq n^n kappa_n . $
  The last step applies Theorem 1 to $B^compose$ for $n gt.eq 4$, and the separate three-dimensional result [2] Theorem 1.1 for $n = 3$. Equality in the first step means that $C$ is homothetic to $I_B$, while equality in the last makes $B^compose$, hence $B$, an ellipsoid. Then $I_B$ is homothetic to $B$, giving exactly the stated equality cases. ◻
]

#heading(level: 1)[References]
#bibitem([1])[L.~E.~J. Brouwer, Über Abbildung von Mannigfaltigkeiten, #emph[Math. Ann.] #strong[71] (1911), 97--115. #link("https://doi.org/10.1007/BF01456931").]
#bibitem([2])[S.~Chen, Y.~Feng, Y.~Li, D.~Xi, and L.~Xu, #emph[Petty's conjectured projection inequality in dimension three], preprint, 7 August 2026, MathSciDoc:2608.23001, 20~pp. #link("https://archive.ymsc.tsinghua.edu.cn/pacm_download/741/12780-pettyinequality.pdf").]
#bibitem([3])[R.~J. Gardner, The Brunn--Minkowski inequality, #emph[Bull. Amer. Math. Soc. (N.S.)] #strong[39] (2002), no.~3, 355--405. #link("https://doi.org/10.1090/S0273-0979-02-00941-2").]
#bibitem([4])[J.~E. Haddad, A convex body associated to the Busemann random simplex inequality and the Petty conjecture, #emph[J. Funct. Anal.] #strong[281] (2021), no.~7, 109118. #link("https://doi.org/10.1016/j.jfa.2021.109118"). Preprint: arXiv:1904.10427v6, 10 January 2020. #link("https://arxiv.org/abs/1904.10427v6").]
#bibitem([5])[Y.~Huang, E.~Lutwak, D.~Yang, and G.~Zhang, Geometric measures in the dual Brunn--Minkowski theory and their associated Minkowski problems, #emph[Acta Math.] #strong[216] (2016), 325--388. #link("https://doi.org/10.1007/s11511-016-0140-6").]
#bibitem([6])[Y.~Huang, E.~Lutwak, D.~Yang, and G.~Zhang, The $L_p$-Aleksandrov problem for $L_p$-integral curvature, #emph[J. Differential Geom.] #strong[110] (2018), no.~1, 1--29. #link("https://doi.org/10.4310/jdg/1536285625").]
#bibitem([7])[Y.~Huang and Y.~Zhao, On the $L_p$ dual Minkowski problem, #emph[Adv. Math.] #strong[332] (2018), 57--84. #link("https://doi.org/10.1016/j.aim.2018.05.002").]
#bibitem([8])[M.~N. Ivaki, A local uniqueness theorem for minimizers of Petty's conjectured projection inequality, #emph[Mathematika] #strong[64] (2018), no.~1, 1--19. #link("https://doi.org/10.1112/S0025579317000444"). Preprint: #link("https://arxiv.org/abs/1610.03796v2").]
#bibitem([9])[M.~Ludwig, Projection bodies and valuations, #emph[Adv. Math.] #strong[172] (2002), no.~2, 158--168. #link("https://dmg.tuwien.ac.at/ludwig/projection.pdf").]
#bibitem([10])[E.~Lutwak, On quermassintegrals of mixed projection bodies, #emph[Geom. Dedicata] #strong[33] (1990), no.~1, 51--58. #link("https://doi.org/10.1007/BF00147600").]
#bibitem([11])[E.~Lutwak, On a conjectured projection inequality of Petty, in #emph[Integral Geometry and Tomography] (Arcata, CA, 1989), Contemporary Mathematics #strong[113], American Mathematical Society, Providence, RI, 1990, pp.~171--182.]
#bibitem([12])[H.~Martini and Z.~Mustafaev, Extensions of a Bonnesen-style inequality to Minkowski spaces, #emph[Math. Inequal. Appl.] #strong[11] (2008), no.~4, 739--748. #link("https://doi.org/10.7153/mia-11-63").]
#bibitem([13])[F.~Mielke-Sulz, #emph[The Petty conjecture for convex bodies of revolution], preprint, arXiv:2609.13517v1, 11 September 2026. #link("https://arxiv.org/abs/2609.13517v1").]
#bibitem([14])[G.~Ólafsson, A.~Pasquale, and B.~Rubin, Analytic and group-theoretic aspects of the cosine transform, in #emph[Geometric Analysis and Integral Geometry], Contemporary Mathematics #strong[598], American Mathematical Society, Providence, RI, 2013, pp.~167--188. #link("https://doi.org/10.1090/conm/598/12009"). Preprint: #link("https://arxiv.org/abs/1209.1822v1").]
#bibitem([15])[O.~Ortega-Moreno and F.~E. Schuster, Fixed points of Minkowski valuations, #emph[Adv. Math.] #strong[392] (2021), 108017. #link("https://doi.org/10.1016/j.aim.2021.108017"). Author version: #link("https://www.dmg.tuwien.ac.at/schuster/FixedPointMinkVal.pdf").]
#bibitem([16])[C.~M. Petty, Isoperimetric problems, in #emph[Proceedings of the Conference on Convexity and Combinatorial Geometry] (University of Oklahoma, Norman, 1971), Department of Mathematics, University of Oklahoma, pp.~26--41.]
#bibitem([17])[C.~Saroglou, On the shape of a convex body with respect to its second projection body, #emph[Adv. Appl. Math.] #strong[67] (2015), 55--74. #link("https://doi.org/10.1016/j.aam.2015.03.004"). Preprint: #link("https://arxiv.org/abs/1409.4347v2").]
#bibitem([18])[C.~Saroglou and A.~Zvavitch, Iterations of the projection body operator and a remark on Petty's conjectured projection inequality, #emph[J. Funct. Anal.] #strong[272] (2017), no.~2, 613--630. #link("https://doi.org/10.1016/j.jfa.2016.08.015").]
#bibitem([19])[D.~Spector, Simple proofs of some results of Reshetnyak, #emph[Proc. Amer. Math. Soc.] #strong[139] (2011), no.~5, 1681--1690. #link("https://doi.org/10.1090/S0002-9939-2010-10593-2"). Author version: #link("https://cvgmt.sns.it/media/doc/paper/505/reshetnyakcontinuityrevised.pdf").]
#bibitem([20])[H.~Wang and J.~Zhou, Uniqueness and continuity of the solution to $L_p$ dual Minkowski problem, #emph[Commun. Math. Stat.] #strong[14] (2026), no.~1, 105--140. #link("https://doi.org/10.1007/s40304-023-00374-2"). Preprint: #link("https://arxiv.org/abs/2103.13075v1").]
#bibitem([21])[G.~Zhang, The affine Sobolev inequality, #emph[J. Differential Geom.] #strong[53] (1999), no.~1, 183--202.]


