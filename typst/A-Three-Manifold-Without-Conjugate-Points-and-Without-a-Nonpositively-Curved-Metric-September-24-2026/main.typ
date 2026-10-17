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

#align(center)[#text(size: 16pt, weight: "bold")[A Three-Manifold Without Conjugate Points and Without a Nonpositively Curved Metric]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <introduction>

A Riemannian metric has #emph[no conjugate points] if no nonzero Jacobi field along a geodesic vanishes at two distinct times. Nonpositive sectional curvature implies this condition. Gulliver showed that the converse fails for an individual metric: local modifications of negatively curved metrics can produce regions of positive curvature while preserving the absence of conjugate points #cite(label("Gulliver1975")) Section 3. Those examples retain a manifold that already admits a negatively curved metric. The existence question is therefore different: must a closed manifold carrying a metric without conjugate points also carry some metric of nonpositive sectional curvature?

This question appears in Ivanov and Kapovitch #cite(label("IvanovKapovitch2014")) Questions 1.1 and 8.1 and in the survey of Burns and Matveev #cite(label("BurnsMatveev2021")) Question 4.1.2, which explicitly includes dimension three. A closed surface without conjugate points has universal cover diffeomorphic to $bb(R)^2$ by the exponential map, and hence has nonpositive Euler characteristic. Uniformization then supplies a flat or negatively curved metric, so the existence problem begins in dimension three. Ivanov and Kapovitch identify graph manifolds as a central three-dimensional test case and ask about gluings of two punctured-torus products #cite(label("IvanovKapovitch2014")) Section 8. We give a negative answer in dimension three, using a metric on a two-piece graph manifold whose topology obstructs nonpositive curvature.

#thm([Theorem 1.1.])[
  #emph[There exists a closed connected orientable smooth three-manifold $M$ with a $C^oo$ Riemannian metric without conjugate points, such that $M$ admits no $C^oo$ Riemannian metric whose sectional curvature is everywhere at most zero.]
] <thm:main>

The obstruction is stronger than the Riemannian assertion in the theorem. The group $pi_1 \( M \)$ admits no proper cocompact isometric action on a nonempty proper $"CAT" \( 0 \)$ space (Theorem 2); consequently, $M$ admits no locally $"CAT" \( 0 \)$ length metric inducing its topology (Corollary 3).

The same manifold also admits no metric without focal points. Recall that a metric has #emph[no focal points] if, for every nonzero normal Jacobi field $J$ along a unit-speed geodesic with $J \( 0 \) = 0$, one has $frac(d, d s) \| J \( s \) \|^2 > 0$ for $s > 0$. This condition is stronger than absence of conjugate points. Ivanov and Kapovitch prove that a closed three-manifold admits a metric without focal points if and only if it admits a metric of nonpositive sectional curvature #cite(label("IvanovKapovitch2014")) Theorem 7.1. Their equivalence and Theorem 1 give the stated additional obstruction.

The manifold is obtained by gluing two copies of $Sigma times S^1$, where $Sigma$ is a compact oriented surface of genus one with one boundary component. Write $h_i$ for the surface boundary and $f_i$ for the circle factor in the $i$th boundary torus. The gluing is

$ h_2 = h_1 + f_1 \, #h(2em) f_2 = h_1 . $

This is an instance of Leeb’s two-piece graph-manifold obstruction #cite(label("Leeb1995")) Section 4.1, Example 4.1. We include the group-theoretic proof, which also gives the stronger action obstruction above. Under a hypothetical nonpositively curved metric, the common torus group acts by translations on a Euclidean plane. In each product piece, the surface boundary is a commutator of elements commuting with the fiber. The resulting translation vectors must be perpendicular. These two orthogonality conditions are incompatible with the gluing.

The main work is the metric construction and its geodesic estimate. Each product piece has nonpositive sectional curvature. Between them we insert a neck $\[ 0 \, 1 \] times T^2$ with metric

$ g = d t^2 + d x^(sans(T)) P \( t \)^(- 1) thin d x \, $

where $P \( t \)$ is a smooth path of positive definite matrices. We call $P$ the #emph[cometric], since it is the inverse torus metric. We choose it concave, meaning that $- P''$ is positive semidefinite, with exact product formulas near the ends. A small parameter $delta$ controls its derivatives; a shear of size $delta^2$ realizes the integral gluing after the torus periods are chosen. Convex warped collars then join the endpoints smoothly to punctured-torus cores.

For the absence of conjugate points, we use the classical index-form framework #cite(label("Milnor1963")) Sections 13–15. Concavity of $P$ makes the coordinate second variation nonnegative, but the intrinsic index form differs by endpoint terms. The estimates must allow arbitrary field values at the ends of an entire neck passage, so that they can be combined with the estimates in the product pieces. A tangential change of field handles passages with no turn. A returning geodesic requires an estimate over its whole excursion.

For such an excursion, a positive boundary term controls one component of the endpoint change in the torus part of the variation field. We combine this control with the coordinate energy by Hilbert-space Cauchy–Schwarz and a quadratic minimization. A strict timing margin for excursions leaving an endpoint collar makes the estimate uniform in the entry angle, turning height, and excursion time. No upper bound on the duration is needed. This is what permits one metric to handle every complete geodesic.

Section 2 fixes the manifold and proves its curvature obstruction. Section 3 constructs the metric and establishes the matrix estimates. Section 4 derives the index identities and classifies neck passages, and Section 5 proves the returning-passage estimate. Section 6 sums the intrinsic index integrals of the original field over all visits, including infinitely many visits, and completes the proof of Theorem 1. Appendix 7 records the hyperbolic cusp model used for the compact product cores.

== 2 The manifold and the obstruction to nonpositive curvature <sec:topology>

We first choose the underlying manifold. Its two product pieces impose incompatible orthogonality conditions on the gluing torus under any nonpositively curved metric. This is an instance of Leeb’s two-piece graph-manifold obstruction #cite(label("Leeb1995")) Section 4.1, Example 4.1. The obstruction to proper cocompact actions on proper CAT(0) spaces is also contained in the group-theoretic framework of Kapovich and Leeb #cite(label("KapovichLeeb1996")) Theorem 2.4. We give the group-theoretic argument explicitly, since it fixes the gluing convention used in the metric construction.

=== 2.1 Two product pieces and one shear <two-product-pieces-and-one-shear>

Let $Sigma$ be a compact connected oriented surface of genus one with one boundary component, and let $N_i = Sigma times S^1$ for $i = 1 \, 2$. On $partial N_i$ write $h_i$ for the oriented boundary circle of $Sigma$ and $f_i$ for the positively oriented circle factor. Thus $\( h_i \, f_i \)$ is an oriented integral basis of $pi_1 \( partial N_i \) tilde.equiv bb(Z)^2$. Choose the linear diffeomorphism $phi : partial N_2 arrow.r partial N_1$ whose action on these bases is

#[#set math.equation(numbering: n => "(2.1)")
 $ h_2 = h_1 + f_1 \, #h(2em) f_2 = h_1 . $ <eq:torus-gluing>]

Here and below additive notation is used only inside the torus group. The matrix of $phi_(*)$ is $mat(delim: "(", 1, 1; 1, 0)$, with determinant $- 1$, so $phi$ reverses the induced boundary orientations. Gluing the two pieces by $phi$ therefore gives a closed connected oriented smooth three-manifold $M$. More explicitly, collar coordinates give smooth charts across the identified boundary; the compact pieces cover $M$, every boundary component is paired, and the common torus makes the union connected. We insert a product cylinder $\[ 0 \, 1 \] times T^2$ between the two pieces. Inserting this collar leaves the diffeomorphism type unchanged and provides the region where the metric will vary.

The coordinate realization needed later is worth recording. For any $epsilon.alt > 0$ and $B_2 > 0$, put $B_1 = epsilon.alt B_2$ and

$ T^2 = bb(R)^2 \/ Lambda \, #h(2em) Lambda = bb(Z) B_1 e_1 + bb(Z) B_2 e_2 \, $

where $e_1 \, e_2$ are the standard coordinate vectors. At the first end use the frame $\( e_1 \, e_2 \)$ with respective coordinate periods $\( B_1 \, B_2 \)$. At the second end use the frame $\( e_2 + epsilon.alt e_1 \, e_1 \)$ with respective periods $\( B_2 \, B_1 \)$. The first vector in each frame is the surface-boundary direction and the second is the fiber direction. Their period vectors are

#[#set math.equation(numbering: n => "(2.2)")
 $ h_1 & : B_1 e_1 \, & f_1 & : B_2 e_2 \,\
h_2 & : B_2 \( e_2 + epsilon.alt e_1 \) = B_1 e_1 + B_2 e_2 \, & f_2 & : B_1 e_1 . $ <eq:torus-periods>]

In particular the second pair is a basis of exactly the same lattice, and these physical periods implement (2.1).

Choose basepoints and connecting paths through the cylinder so that the boundary groups are identified by (2.1). For suitable free generators $a_i \, b_i$ of $pi_1 \( Sigma \)$, the boundary element is $h_i = \[ a_i \, b_i \]^(plus.minus 1)$. This cyclically reduced nonempty word has infinite order in the free group. Consequently

$ G_i := pi_1 \( N_i \) = F \( a_i \, b_i \) times chevron.l f_i chevron.r \, #h(2em) chevron.l h_i \, f_i chevron.r tilde.equiv bb(Z)^2 $

and the boundary-group inclusion in each $G_i$ is injective: a relation $h_i^m f_i^n = 1$ first gives $n = 0$ by projection onto the circle factor and then $m = 0$ in the free group. Van Kampen’s theorem and the normal form for an amalgamated product give

#[#set math.equation(numbering: n => "(2.3)")
 $ Gamma := pi_1 \( M \) = G_1 *_(Gamma_T) G_2 \, #h(2em) Gamma_T = chevron.l h_1 \, f_1 chevron.r = chevron.l h_2 \, f_2 chevron.r tilde.equiv bb(Z)^2 \, $ <eq:amalgam>]

with both vertex groups and $Gamma_T$ embedded in $Gamma$. For $f in Gamma$, write $C_Gamma \( f \) = { g in Gamma : g f = f g }$ for its centralizer. Since $f_i$ is central in $G_i$, we have

#[#set math.equation(numbering: n => "(2.4)")
 $ G_i subset C_Gamma \( f_i \) \, #h(2em) h_i in \[ C_Gamma \( f_i \) \, C_Gamma \( f_i \) \] quad \( i = 1 \, 2 \) . $ <eq:boundary-commutators>]

=== 2.2 The two incompatible orthogonality conditions <the-two-incompatible-orthogonality-conditions>

#thm([Theorem 2.1.])[
  #emph[The fundamental group $Gamma = pi_1 \( M \)$ of the closed three-manifold defined by (2.1) admits no proper cocompact isometric action on a nonempty proper $"CAT" \( 0 \)$ space.]
] <thm:no-cat0-action>

#proof[
  Suppose that $Gamma$ acts properly and cocompactly by isometries on a nonempty proper $"CAT" \( 0 \)$ space $X$. Properness of the action means that for compact sets $K \, L subset X$, only finitely many $g in Gamma$ satisfy $g K ∩ L eq.not diameter$; in particular, point stabilizers are finite.
  For $g in Gamma$ set
  $ ell \( g \) = inf_(x in X) d \( x \, g x \) \, #h(2em) "Min" \( g \) = { x in X : d \( x \, g x \) = ell \( g \) } . $
  We check the attainment of this infimum before applying the flat torus theorem. Choose $x_n$ with $d \( x_n \, g x_n \) arrow.r ell \( g \)$ and a compact set $K subset X$ whose $Gamma$-translates cover $X$. There are $k_n in Gamma$ such that $y_n = k_n x_n in K$. Put $g_n = k_n g k_n^(- 1)$. For all large $n$, $d \( y_n \, g_n y_n \) lt.eq ell \( g \) + 1$. The closed $\( ell \( g \) + 1 \)$-neighborhood of $K$ is compact, because $X$ is proper. Properness of the action therefore permits only finitely many $g_n$. After passage to a subsequence, $g_n = g_(*)$ and $y_n arrow.r y in K$, whence $d \( y \, g_(*) y \) = ell \( g \)$. Since translation length is invariant under conjugation, conjugating $y$ back gives a point of $"Min" \( g \)$. Thus every element of $Gamma$ is semisimple. If $g$ has infinite order, its attained minimum is positive: otherwise $g$ fixes a point, and its infinitely many distinct powers belong to that point stabilizer, contrary to its finiteness. The semisimplicity argument is also given in #cite(label("BridsonHaefliger1999")) Proposition II.6.10(2).
  Apply the flat torus theorem #cite(label("BridsonHaefliger1999")) Theorem II.7.1(1)–(3) to the embedded group $Gamma_T tilde.equiv bb(Z)^2$. Its action is proper and semisimple by the preceding paragraph. Hence
  $ "Min" \( Gamma_T \) := ⋂_(a in Gamma_T) "Min" \( a \) tilde.equiv Y times bb(R)^2 \, $
  and $Gamma_T$ acts trivially on $Y$ and as a translation lattice on $bb(R)^2$. Fix one of these invariant Euclidean planes, denoted $E$, and write $upright(bold(v)) \( a \) in bb(R)^2$ for the translation vector of $a in Gamma_T$. The map $upright(bold(v))$ is a homomorphism, and its values on any integral basis of $Gamma_T$ are linearly independent.
  We now use the boundary-commutator relation (2.4). For each $i$, the positive translation length $ell_i = ell \( f_i \)$ and the cyclic minset theorem give
  #[#set math.equation(numbering: n => "(2.5)")
   $ "Min" \( f_i \) tilde.equiv Y_i times bb(R) \, #h(2em) f_i \( y \, t \) = \( y \, t + ell_i \) . $ <eq:cyclic-minset>]
  Every $g in C_Gamma \( f_i \)$ preserves this product and acts as
  $ g \( y \, t \) = \( g'_i \( y \) \, t + tau_i \( g \) \) \, $
  where $tau_i \( g \)$ is a real number independent of $y$; see #cite(label("BridsonHaefliger1999")) Theorem II.6.8(4)–(5). To see the reason for this product action, commutation sends each oriented $f_i$-axis to another such axis. In the splitting (2.5), these are the lines ${ y } times bb(R)$. An axiswise translation could initially have a shift depending on $y$, but preservation of the product distance between $\( y \, t \)$ and $\( z \, s \)$ for every $t - s in bb(R)$ forces the two shifts to agree. Composition now shows that $tau_i : C_Gamma \( f_i \) arrow.r \( bb(R) \, + \)$ is a homomorphism. It vanishes on commutators, so $tau_i \( h_i \) = 0$.
  The same plane $E$ lies in both cyclic minsets, because $E subset "Min" \( Gamma_T \)$. At a point $x = \( y \, t \) in E$ expressed in the $i$th splitting, the zero shift of $h_i$ gives
  $ d \( x \, h_i f_i x \)^2 & = d_(Y_i) \( y \, h'_i y \)^2 + ell_i^2\
 & = d \( x \, h_i x \)^2 + d \( x \, f_i x \)^2 . $
  All three distances can also be computed in the Euclidean plane $E$. It follows that
  #[#set math.equation(numbering: n => "(2.6)")
   $ chevron.l upright(bold(v)) \( h_i \) \, upright(bold(v)) \( f_i \) chevron.r = 0 #h(2em) \( i = 1 \, 2 \) . $ <eq:torus-orthogonality>]
  Put $u = upright(bold(v)) \( h_1 \)$ and $v = upright(bold(v)) \( f_1 \)$. The first equality in (2.6) says $chevron.l u \, v chevron.r = 0$. The gluing relations give $upright(bold(v)) \( h_2 \) = u + v$ and $upright(bold(v)) \( f_2 \) = u$, so the second equality says
  $ 0 = chevron.l u + v \, u chevron.r = \| u \|^2 . $
  This is impossible: $h_1$ is nontrivial in $Gamma_T$, and its translation vector in the lattice is nonzero. ◻
]

#thm([Corollary 2.2.])[
  #emph[The manifold $M$ admits no locally $"CAT" \( 0 \)$ length metric inducing its manifold topology.]
] <cor:no-local-cat0>

#proof[
  Suppose that such a metric exists. Compactness of $M$ makes it complete and locally compact. Its ordinary universal cover, equipped with the lifted length metric, is complete and locally compact, and the covering map is a local isometry. Metric Cartan–Hadamard makes this universal cover a $"CAT" \( 0 \)$ space, and metric Hopf–Rinow makes it proper; see #cite(label("BridsonHaefliger1999")) Proposition I.3.7(1) and Theorem II.4.1(2). The deck group $Gamma$ acts freely and properly by isometries, with compact quotient $M$. This contradicts Theorem 2. ◻
]

#thm([Proposition 2.3.])[
  #emph[The closed smooth three-manifold $M$ defined by (2.1) admits no smooth Riemannian metric of nonpositive sectional curvature.]
] <prop:no-npc>

#proof[
  Such a Riemannian metric is a length metric inducing the manifold topology and is locally $"CAT" \( 0 \)$ #cite(label("BridsonHaefliger1999")) Theorem II.1A.6, contradicting Corollary 3. ◻
]

These obstructions depend only on the topology of $M$. The metric constructed below will have no conjugate points.

== 3 A concave cometric and smooth product cores <sec:cometric>

We construct the metric in two stages. First we join the two product structures by a metric on the torus neck. Then we extend its endpoint formulas over compact punctured-torus products. The neck estimates will depend on a small parameter $delta$, while the torus periods will be chosen afterward to fit the surface boundaries into hyperbolic cusps.

=== 3.1 The matrix path and its endpoint coordinates <the-matrix-path-and-its-endpoint-coordinates>

Write $e_1 \, e_2$ for the standard basis of $bb(R)^2$. The two product structures require different diagonal coordinate frames: $\( e_1 \, e_2 \)$ on the left and $\( e_2 + epsilon.alt e_1 \, e_1 \)$ on the right. To arrange concavity, we start with a diagonal path and introduce the shear only where both diagonal coefficients have strictly negative second derivative. The diagonal variation has size $delta$; taking $epsilon.alt = delta^2$ makes the frame change a smaller perturbation. The periods $B_1 = epsilon.alt B_2$ then turn this small coordinate shear into the fixed integral gluing of Section 2.

Define the smooth function $a : bb(R) arrow.r \[ 0 \, 1 \)$ and its primitive $A$ by

#[#set math.equation(numbering: n => "(3.1)")
 $ a \( u \) = cases(delim: "{", exp #scale(x: 120%, y: 120%)[\(] - 1 \/ \( 2 \/ 3 - u \) #scale(x: 120%, y: 120%)[\)] \, & u < 2 \/ 3 \,, 0 \, & u gt.eq 2 \/ 3 \,) #h(2em) A \( u \) = integral_0^u a \( y \) thin d y . $ <eq:cometric-cutoff>]

The definition includes negative $u$, which will be needed when extending the metric into the product pieces. Fix once and for all a smooth nondecreasing function $chi : bb(R) arrow.r \[ 0 \, 1 \]$ equal to zero on $\( - oo \, 5 \/ 12 \]$ and to one on $\[ 7 \/ 12 \, oo \)$. For $0 < delta lt.eq 1 \/ 2$, set $epsilon.alt = delta^2$ and define

#[#set math.equation(numbering: n => "(3.2)")
 $ H \( t \) & = e_2 + epsilon.alt chi \( t \) e_1 \,\
d_1 \( t \) & = 1 + delta A \( t \) \, #h(2em) d_2 \( t \) = 1 + delta A \( 1 - t \) \,\
P \( t \) & = d_1 \( t \) e_1 e_1^(sans(T)) + d_2 \( t \) H \( t \) H \( t \)^(sans(T)) \, #h(2em) 0 lt.eq t lt.eq 1 . $ <eq:cometric-path>]

Here a superscript $sans(T)$ denotes transpose. For a positive definite matrix $P$, its inverse $Q = P^(- 1)$ is the matrix of the torus metric; we therefore call $P$ the cometric.

Choose $B_2 > 0$ later and put $B_1 = epsilon.alt B_2$. On

$ T^2 = bb(R)^2 \/ Lambda \, #h(2em) Lambda = bb(Z) B_1 e_1 + bb(Z) B_2 e_2 \, $

use the neck metric

#[#set math.equation(numbering: n => "(3.3)")
 $ g = d t^2 + d x^(sans(T)) Q \( t \) thin d x . $ <eq:neck-metric>]

The product coordinates at the two ends are given by the frames

#[#set math.equation(numbering: n => "(3.4)")
 $ T_1 = \( e_1 \, e_2 \) \, #h(2em) T_2 = \( e_2 + epsilon.alt e_1 \, e_1 \) \, #h(2em) x = T_i y . $ <eq:end-frames>]

At the first end the two coordinate periods are $B_1 \, B_2$; at the second they are $B_2 \, B_1$. The first coordinate is the surface-boundary direction and the second is the circle factor. The period calculation (2.2) shows that these frames give exactly the gluing (2.1).

Let $tau = t$ at the first end and $tau = 1 - t$ at the second, so that $tau$ increases into the neck. A constant coordinate change $x = T_i y$ changes the cometric by $P mapsto T_i^(- 1) P T_i^(- sans(T))$. Since $A$ is constant on $\[ 2 \/ 3 \, oo \)$, in these endpoint coordinates we have the exact identities

#[#set math.equation(numbering: n => "(3.5)")
 $ P_i \( tau \) = mat(delim: "(", 1 + delta A \( tau \), 0; 0, b) \, #h(2em) b = 1 + delta A \( 1 \) \, #h(2em) 0 lt.eq tau lt.eq 1 \/ 4 . $ <eq:end-cometric>]

In particular

#[#set math.equation(numbering: n => "(3.6)")
 $ P_i \( 0 \) e_1 = e_1 \, #h(2em) P'_i \( 0 \) = kappa e_1 e_1^(sans(T)) \, #h(2em) kappa = delta a \( 0 \) > 0 . $ <eq:end-cometric-slope>]

Primes on $P_i$ refer to $tau$.

For symmetric matrices $R \, S$, write $R prec.curly.eq S$ when $S - R$ is positive semidefinite; $R succ.curly.eq S$ has the reversed meaning.

#thm([Lemma 3.1.])[
  #emph[There are constants $delta_0 > 0$ and $C < oo$, depending only on the fixed function $chi$, such that for $0 < delta lt.eq delta_0$ the path (3.2) satisfies, in the original coordinates and in either endpoint coordinate system, 
#[#set math.equation(numbering: n => "(3.7)")
 $ 1 / 9 "Id" prec.curly.eq P prec.curly.eq 18 "Id" \, #h(2em) 1 / 18 "Id" prec.curly.eq Q prec.curly.eq 9 "Id" \, #h(2em) parallel P' parallel lt.eq C delta \,\
- P'' succ.curly.eq 0 \, #h(2em) \| P' p \|^2 lt.eq C delta thin p^(sans(T)) \( - P'' \) p quad upright("for every ") p in bb(R)^2 . $ <eq:cometric-uniform>]

 The constants do not depend on $B_1$ or $B_2$.]
] <lem:cometric-bounds>

#proof[
  All matrix norms are Euclidean operator norms. On $\[ 0 \, 1 \]$ we have $1 lt.eq d_i lt.eq 2$. The matrix $R = \( e_1 \, H \)$ and its inverse have squared norms at most $3$. As $P = R "diag" \( d_1 \, d_2 \) R^(sans(T))$, this gives $"Id" \/ 3 prec.curly.eq P prec.curly.eq 6 "Id"$ in the original coordinates. The same bounds on $parallel T_i parallel^2$ and $parallel T_i^(- 1) parallel^2$ give the displayed weaker bounds in both endpoint frames.
  For $u < 2 \/ 3$,
  #[#set math.equation(numbering: n => "(3.8)")
   $ a' \( u \) = - frac(a \( u \), \( 2 \/ 3 - u \)^2) . $ <eq:cutoff-differential>]
  Consequently, on $\[ 0 \, 1 \]$, $a^2 lt.eq - a'$ and $\| a' \| lt.eq 1$, with both sides zero on the plateau when appropriate. Put $I_0 = \[ 5 \/ 12 \, 7 \/ 12 \]$. Outside $I_0$, the vector $H$ is constant. If $q = R^(sans(T)) p$, then
  $ p^(sans(T)) \( - P'' \) p = delta #scale(x: 120%, y: 120%)[\(] - a' \( t \) q_1^2 - a' \( 1 - t \) q_2^2 #scale(x: 120%, y: 120%)[\)] \, $
  and
  $ \| P' p \|^2 lt.eq 3 delta^2 #scale(x: 120%, y: 120%)[\(] a \( t \)^2 q_1^2 + a \( 1 - t \)^2 q_2^2 #scale(x: 120%, y: 120%)[\)] lt.eq 3 delta thin p^(sans(T)) \( - P'' \) p . $
  This proves concavity and the required domination there, including the directions in which $- P''$ vanishes.
  On $I_0$ both $t$ and $1 - t$ lie in $\[ 5 \/ 12 \, 7 \/ 12 \]$, and
  $ - a' \( t \) \, med - a' \( 1 - t \) gt.eq m \, #h(2em) m = 144 e^(- 12) > 0 . $
  To control every error caused by the moving frame, compare $P$ with $P_0 = "diag" \( d_1 \, d_2 \)$ and write $E = P - P_0$. The derivatives are
  $ P' =  & delta a \( t \) e_1 e_1^(sans(T)) - delta a \( 1 - t \) H H^(sans(T)) + d_2 epsilon.alt chi' \( e_1 H^(sans(T)) + H e_1^(sans(T)) \) \,\
P'' =  & delta a' \( t \) e_1 e_1^(sans(T)) + delta a' \( 1 - t \) H H^(sans(T)) - 2 delta a \( 1 - t \) epsilon.alt chi' \( e_1 H^(sans(T)) + H e_1^(sans(T)) \)\
 & + d_2 epsilon.alt chi'' \( e_1 H^(sans(T)) + H e_1^(sans(T)) \) + 2 d_2 epsilon.alt^2 \( chi' \)^2 e_1 e_1^(sans(T)) . $
  Using $\| H \| lt.eq sqrt(2)$ and $parallel H H^(sans(T)) - e_2 e_2^(sans(T)) parallel lt.eq 3 epsilon.alt$ gives
  $ parallel E' parallel lt.eq C_1 epsilon.alt \, #h(2em) parallel E'' parallel lt.eq C_2 epsilon.alt \, $
  where $C_1 \, C_2$ depend only on the fixed function $chi$. These estimates use only $delta \, epsilon.alt lt.eq 1$ and $d_2 lt.eq 2$. Take $delta_0 lt.eq min { 1 \/ 2 \, m \/ \( 2 C_2 \) }$. Since $epsilon.alt = delta^2$ and $- P''_0 succ.curly.eq m delta "Id"$, we obtain
  $ - P'' succ.curly.eq 1 / 2 m delta "Id" \, #h(2em) parallel P' parallel lt.eq \( 1 + C_1 \) delta quad upright("on ") I_0 . $
  It follows that
  $ \| P' p \|^2 lt.eq frac(2 \( 1 + C_1 \)^2, m) thin delta thin p^(sans(T)) \( - P'' \) p . $
  The displayed derivative formula also gives $parallel P' parallel lt.eq C delta$ outside $I_0$.
  Finally, under $tilde(P) = T_i^(- 1) P T_i^(- sans(T))$, with $q = T_i^(- sans(T)) p$, the domination estimate transforms as
  $ \| tilde(P)' p \|^2 lt.eq parallel T_i^(- 1) parallel^2 \| P' q \|^2 lt.eq 3 C delta thin p^(sans(T)) \( - tilde(P)'' \) p . $
  Reversing $t$ at the second end changes the sign of the first derivative and leaves the second derivative unchanged. This proves all assertions. ◻
]

=== 3.2 Smooth convex collars <smooth-convex-collars>

The endpoint metric in (3.5) is the product of a flat circle and the surface metric

$ d tau^2 + ell_0 \( tau \)^2 d y_1^2 \, #h(2em) ell_0 \( tau \) = \( 1 + delta A \( tau \) \)^(- 1 \/ 2) . $

Its Gaussian curvature is $- ell''_0 \/ ell_0$. Direct differentiation gives

#[#set math.equation(numbering: n => "(3.9)")
 $ ell''_0 / ell_0 = frac(3 delta^2 a^2, 4 \( 1 + delta A \)^2) - frac(delta a', 2 \( 1 + delta A \)) gt.eq 0 . $ <eq:end-warp-convexity>]

Thus the neck already has nonpositive sectional curvature on $0 lt.eq t lt.eq 1 \/ 4$ and $3 \/ 4 lt.eq t lt.eq 1$. We next extend each endpoint surface metric inward to a hyperbolic cusp by an explicit convex warping function.

For $- 1 lt.eq tau lt.eq 0$ we have $A \( tau \) gt.eq - 1$, so $1 + delta A \( tau \) gt.eq 1 \/ 2$. Define

$ r \( tau \) = frac(delta a \( tau \), 2 \( 1 + delta A \( tau \) \)) . $

For $0 < delta lt.eq 1 \/ 2$, this is positive and at most $delta lt.eq 1 \/ 2$; moreover

$ r' \( tau \) = frac(delta #scale(x: 120%, y: 120%)[\(] a' \( tau \) \( 1 + delta A \( tau \) \) - delta a \( tau \)^2 #scale(x: 120%, y: 120%)[\)], 2 \( 1 + delta A \( tau \) \)^2) < 0 . $

Fix a smooth nondecreasing function $lambda : \[ - 1 \, 0 \] arrow.r \[ 0 \, 1 \]$ equal to zero near $- 1$ and one near $0$. Put

#[#set math.equation(numbering: n => "(3.10)")
 $ k = 1 - lambda + lambda r \, #h(2em) ell \( tau \) = exp (- integral_0^tau k \( u \) thin d u) . $ <eq:collar-warp>]

Then $k > 0$ and $k' = lambda' \( r - 1 \) + lambda r' lt.eq 0$. Hence

$ ell'' = \( k^2 - k' \) ell > 0 . $

Near zero, $k = r$ and $ell \( 0 \) = 1$, which proves the exact equality $ell = \( 1 + delta A \)^(- 1 \/ 2)$ there. Near $- 1$, $k = 1$, so

#[#set math.equation(numbering: n => "(3.11)")
 $ ell \( tau \) = ell \( - 1 \) e^(- \( tau + 1 \)) . $ <eq:collar-cusp-germ>]

Both matching assertions hold on open collars, not only to a finite order at their endpoints.

=== 3.3 Punctured-torus cores and the final gluing <punctured-torus-cores-and-the-final-gluing>

Fix a complete finite-area hyperbolic punctured torus. It has an embedded cusp of the form

#[#set math.equation(numbering: n => "(3.12)")
 $ d r^2 + c^2 e^(- 2 r) d theta^2 \, #h(2em) r gt.eq 0 \, quad theta in bb(R) \/ bb(Z) \, $ <eq:hyperbolic-cusp>]

for some $c > 0$. In particular, its cusp contains a horocycle of every sufficiently small positive length. An explicit ideal-quadrilateral construction, following #cite(label("Bonahon2009")) Section 5.5, is recalled in Appendix 7.

Fix $delta$ to meet both Lemma 5 and the additional upper bounds imposed by the index-form estimates below. Only after this choice, choose $B_2$ so small that both numbers $B_i ell \( - 1 \)$, $i = 1 \, 2$, occur as lengths of horocycles in an embedded cusp (3.12), and set $B_1 = delta^2 B_2$ as above. For each $i$, truncate a copy of the punctured torus at the horocycle of length $B_i ell \( - 1 \)$, retain the compact side, and attach $\[ - 1 \, 0 \] times \( bb(R) \/ B_i bb(Z) \)$ with metric $d tau^2 + ell \( tau \)^2 d y_1^2$. To check smoothness at $tau = - 1$, if the truncation is at $r = r_i$, set

$ r = r_i + tau + 1 \, #h(2em) theta = y_1 \/ B_i . $

The cusp metric becomes $d tau^2 + ell \( - 1 \)^2 e^(- 2 \( tau + 1 \)) d y_1^2$ on a neighborhood of the seam, which agrees exactly with (3.11). The resulting compact surface $Sigma_i$ has genus one and one boundary component, and has Gaussian curvature at most zero.

Give $N_i = Sigma_i times \( bb(R) \/ B_(3 - i) bb(Z) \)$ the product metric with circle term $b^(- 1) d y_2^2$. The metrics on $N_i$ have nonpositive sectional curvature. At their remaining boundaries, their formulas agree on full collars with (3.5), so the torus maps (3.4) attach them smoothly to the neck. The result is a $C^oo$ Riemannian metric on the closed connected three-manifold specified by $h_2 = h_1 + f_1$, $f_2 = h_1$. Every part outside the open neck, as well as its two indicated endpoint portions, has nonpositive sectional curvature. Choosing the periods after $delta$ does not affect any estimate on the lifted neck metric.

Figure 1 records the two inward coordinates and shows how the period relation turns the small coordinate shear into the fixed integral gluing.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 3.15), [#text(size: 9pt)[\(a\) Product pieces and neck]], anchor: "west", padding: 0.1176cm)
  rect((0, 0.9), (1.5, 2.1), fill: rgb("#f2f2f2"), stroke: none)
  rect((6.3, 0.9), (7.8, 2.1), fill: rgb("#f2f2f2"), stroke: none)
  rect((1.5, 0.9), (2.7, 2.1), fill: black, stroke: none)
  rect((5.1, 0.9), (6.3, 2.1), fill: black, stroke: none)
  rect((2.7, 0.9), (5.1, 2.1), fill: rgb("#fbfbfb"), stroke: none)
  rect((0, 0.9), (7.8, 2.1), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((1.5, 0.9), (1.5, 2.1), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((6.3, 0.9), (6.3, 2.1), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((2.7, 0.9), (2.7, 2.1), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((5.1, 0.9), (5.1, 2.1), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((0.75, 1.7), [#text(size: 8pt)[$N_1$]])
  content((7.05, 1.7), [#text(size: 8pt)[$N_2$]])
  content((0.75, 1.28), [#text(size: 8pt)[$sec lt.eq 0$]])
  content((7.05, 1.28), [#text(size: 8pt)[$sec lt.eq 0$]])
  content((2.1, 1.5), [#text(size: 8pt)[$sec lt.eq 0$]])
  content((5.7, 1.5), [#text(size: 8pt)[$sec lt.eq 0$]])
  content((3.9, 1.7), [#text(size: 8pt)[torus neck]])
  content((3.9, 1.28), [#text(size: 8pt)[$[0,1] times T^2$]])
  content((1.5, 2.15), [#text(size: 8pt)[$t=0$]], anchor: "south", padding: 0.1176cm)
  content((2.7, 2.15), [#text(size: 8pt)[$frac(1, 4)$]], anchor: "south", padding: 0.1176cm)
  content((5.1, 2.15), [#text(size: 8pt)[$frac(3, 4)$]], anchor: "south", padding: 0.1176cm)
  content((6.3, 2.15), [#text(size: 8pt)[$t=1$]], anchor: "south", padding: 0.1176cm)
  line((1.5, 0.45), (2.9, 0.45), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((2.2, 0.45), [#text(size: 8pt)[$tau =t$]], anchor: "north", padding: 0.1176cm)
  line((6.3, 0.45), (4.9, 0.45), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((5.6, 0.45), [#text(size: 8pt)[$tau =1-t$]], anchor: "north", padding: 0.1176cm)
  content((9.2, 3.15), [#text(size: 9pt)[\(b\) The period lattice]], anchor: "west", padding: 0.1176cm)
  line((10, 2.7), (12.4, 2.7), (12.4, 0.3), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((10, 0.3), (12.4, 0.3), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((11.2, 0.3), [#text(size: 8pt)[$h_1=f_2$]], anchor: "north", padding: 0.1176cm)
  line((10, 0.3), (10, 2.7), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((10, 1.5), [#text(size: 8pt)[$f_1$]], anchor: "east", padding: 0.1176cm)
  line((10, 0.3), (12.4, 2.7), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((11.2, 1.5), [#text(size: 8pt)[$h_2=h_1+f_1$]], anchor: "south", padding: 0.1176cm)
  content((9.2, -0.35), [#text(size: 8pt)[$X=x_1"/"B_1, Y=x_2"/"B_2$]], anchor: "west", padding: 0.1176cm)
})],
  caption: [Figure 1: The construction in schematic coordinates. Each product piece $N_i$ includes its convex collar; the two end portions of the neck also have nonpositive sectional curvature. The arrows indicate the inward coordinate at each end. The lattice cell is drawn in normalized coordinates $\( X \, Y \)$: since $B_1 = epsilon.alt B_2$, its diagonal represents $h_2 = B_2 \( e_2 + epsilon.alt e_1 \) = h_1 + f_1$ even when the coordinate shear $epsilon.alt$ is small. Physical lengths are not to scale, and drawn angles are not angles of the Riemannian metric. ],
) <fig:neck-gluing>

== 4 Geodesic passages and the index form <sec:variations>

We now study the index form along a complete unit-speed geodesic of the constructed metric. The metric outside the neck has nonpositive sectional curvature. Inside the neck, concavity of the inverse metric gives a nonnegative coordinate expression for the second variation. The distinction between that expression and the intrinsic index form is an endpoint term. We first compute that term and dispose of the passages that have no turn; the next section estimates the remaining turning passages.

Throughout this section the neck metric is

$ g = d t^2 + d x^(sans(T)) Q \( t \) thin d x \, #h(2em) P \( t \) = Q \( t \)^(- 1) \, #h(2em) 0 lt.eq t lt.eq 1 \, $

with the smooth positive definite matrices constructed above. In particular, $- P'' \( t \)$ is positive semidefinite. At either boundary, we may use its inward coordinate $tau$ and its fixed torus frame. In these coordinates,

#[#set math.equation(numbering: n => "(4.1)")
 $ P \( tau \) = "diag" \( 1 + delta A \( tau \) \, b \) quad \( 0 lt.eq tau lt.eq 1 \/ 4 \) \, #h(2em) b = 1 + delta A \( 1 \) \, #h(2em) kappa = delta A' \( 0 \) > 0 . $ <eq:variational-end-germ>]

These are exactly the two frames of the construction; changing between them is a constant linear coordinate change, together with $tau = 1 - t$ at the right boundary. The metric and these coordinates extend smoothly through each boundary into a product collar. The two end portions of the neck have nonpositive sectional curvature.

=== 4.1 Normal index forms and coordinate second variation <normal-index-forms-and-coordinate-second-variation>

Let $gamma$ be a complete unit-speed geodesic, and write $T = dot(gamma)$. For a smooth field $V$ along $gamma$ and an interval $J$, define

#[#set math.equation(numbering: n => "(4.2)")
 $ I_J \( V \) & = integral_J #scale(x: 120%, y: 120%)[\(] \| D_s V \|^2 - chevron.l R \( V \, T \) T \, V chevron.r #scale(x: 120%, y: 120%)[\)] thin d s \,\
q_V & = chevron.l V \, T chevron.r \, #h(2em) I_J^perp \( V \) = I_J \( V \) - integral_J \| dot(q)_V \|^2 thin d s . $ <eq:index-definition>]

We use the curvature convention for which the curvature term $chevron.l R \( V \, T \) T \, V chevron.r$ is nonpositive when sectional curvature is nonpositive. When $J$ is unbounded we will only use fields vanishing for sufficiently large $\| s \|$, so these integrals are finite.

#thm([Lemma 4.1.])[
  (Tangential invariance).  #emph[The integrand defining $I_J^perp \( V \)$ is the index integrand of $V^perp = V - q_V T$. Consequently, for every smooth real function $h$, 
$ I_J^perp \( V + h T \) = I_J^perp \( V \) $

 provided both fields have the finite integrals required in (4.2). This invariance holds pointwise, without any condition on $h$ at finite endpoints.]
] <lem:tangential-invariance>

#proof[
  Since $D_s T = 0$ and $chevron.l V^perp \, T chevron.r = 0$, we have $chevron.l D_s V^perp \, T chevron.r = 0$ and
  $ \| D_s V \|^2 = \| D_s V^perp \|^2 + \| dot(q)_V \|^2 . $
  The curvature symmetries give $chevron.l R \( V \, T \) T \, V chevron.r = chevron.l R \( V^perp \, T \) T \, V^perp chevron.r$. Both assertions follow. ◻
]

On any connected interval where $gamma$ lies in the neck, lift its torus coordinate to $bb(R)^2$. With a dot denoting differentiation in $s$ and a prime differentiation in $t$, the geodesic equations imply

#[#set math.equation(numbering: n => "(4.3)")
 $ p = Q \( t \) dot(x) med upright("is constant") \, #h(2em) F \( t \) = p^(sans(T)) P \( t \) p \, #h(2em) v = dot(t) \, #h(2em) v^2 = 1 - F \( t \) \, #h(2em) dot(v) = - 1 / 2 F' \( t \) . $ <eq:neck-geodesic>]

Indeed, the Euler–Lagrange equation in the cyclic variable $x$ gives the first identity. Unit speed gives the fourth, and the $t$ equation is $dot.double(t) = dot(x)^(sans(T)) Q' dot(x) \/ 2 = - F' \/ 2$. The function $F$ is concave because $P'' prec.curly.eq 0$.

For a field $V = \( w \, z \)$ in these coordinates, $w$ is its interval component and $z$ its two torus components. Write $\| xi \|_Q^2 = xi^(sans(T)) Q xi$. On a compact coordinate interval $\[ a \, c \]$, define

#[#set math.equation(numbering: n => "(4.4)")
 $ E_(\[ a \, c \]) \( V \) = integral_a^c (dot(w)^2 + \| dot(z) - P' p thin w \|_Q^2 - 1 / 2 F'' \( t \) w^2) thin d s . $ <eq:linear-energy>]

Every term in this expression is nonnegative. We use the same integral to define $E_J \( V \)$ on an unbounded neck interval $J$ when the field vanishes for sufficiently large $\| s \|$.

#thm([Lemma 4.2.])[
  (Endpoint correction).  #emph[For a smooth field $V = \( w \, z \)$ on $\[ a \, c \]$, 
#[#set math.equation(numbering: n => "(4.5)")
 $ I_(\[ a \, c \]) \( V \) = E_(\[ a \, c \]) \( V \) - #scale(x: 120%, y: 120%)[\[] chevron.l T \, Gamma \( V \, V \) chevron.r #scale(x: 120%, y: 120%)[\]]_a^c \, $ <eq:coordinate-index>]

 where $Gamma$ denotes the Christoffel symbols in the chosen product coordinates and brackets mean final value minus initial value. In the inward coordinates at either neck boundary, if $w = 0$ at that boundary, then 
#[#set math.equation(numbering: n => "(4.6)")
 $ Gamma \( V \, V \) = kappa / 2 z_1^2 partial_tau . $ <eq:boundary-christoffel>]

 Thus the endpoint contribution in (4.5) is nonnegative at an entry into or exit from the open neck, provided the interval component of the field vanishes there.]
] <lem:coordinate-index>

#proof[
  Consider the coordinate-linear variation $\( t \( s \) + r w \( s \) \, x \( s \) + r z \( s \) \)$. Its energy is one half the integral of its squared speed. Differentiating twice at $r = 0$ gives
  $ integral_a^c (dot(w)^2 + dot(z)^(sans(T)) Q dot(z) + 2 w dot(z)^(sans(T)) Q' dot(x) + 1 / 2 w^2 dot(x)^(sans(T)) Q'' dot(x)) thin d s . $
  The inverse-matrix identities
  $ Q' = - Q P' Q \, #h(2em) Q'' = 2 Q P' Q P' Q - Q P'' Q \, $
  together with $dot(x) = P p$, turn this expression into $E_(\[ a \, c \]) \( V \)$.
  For completeness, the endpoint term can be seen directly in the intrinsic second variation. If $W = partial_r alpha$ and $U = partial_s alpha$ for a variation $alpha$, the first energy derivative is $\[ chevron.l W \, U chevron.r \]_a^c - integral chevron.l W \, D_s U chevron.r$. Differentiate once more at the geodesic $r = 0$, commute the covariant derivatives, and integrate the $D_s^2 V$ term by parts. The result is
  $ frac(d^2, d r^2) \|_(r = 0) 1 / 2 integral_a^c \| U \|^2 thin d s = I_(\[ a \, c \]) \( V \) + \[ chevron.l T \, D_r W chevron.r \]_a^c . $
  For the coordinate-linear variation, its coordinate second derivative in $r$ is zero, so $D_r W = Gamma \( V \, V \)$. This proves (4.5).
  The nonzero types of Christoffel symbols for this product-coordinate metric are
  $ Gamma_(i j)^t = - 1 / 2 Q'_(i j) \, #h(2em) Gamma_(t j)^i = Gamma_(j t)^i = 1 / 2 \( P Q' \)^i zws_j . $
  At a boundary where $w = 0$, only $- z^(sans(T)) Q' z thin partial_tau \/ 2$ remains. By (4.1), $Q' \( 0 \) = - kappa e_1 e_1^(sans(T))$; hence (4.6) follows. At an initial boundary $dot(tau) > 0$ and this scalar is added in (4.5); at a final boundary $dot(tau) < 0$ and it is subtracted. Both signs are nonnegative. ◻
]

=== 4.2 The possible passages <the-possible-passages>

A #emph[neck passage] is a connected component $J$ of ${ s in bb(R) : 0 < t \( gamma \( s \) \) < 1 }$. The notation means the preimage of the open neck; it does not require an interval coordinate away from the neck. A restricted compactly supported field may have arbitrary values at finite endpoints of $J$.

#thm([Lemma 4.3.])[
  (Passage classification).  #emph[Every finite endpoint of a neck passage is transverse to the boundary torus. Exactly one of the following alternatives holds.]
  + #emph[The passage is the whole real line and $t$ is constant.]
  + #emph[The interval component $v = dot(t)$ never vanishes. The passage is either a finite crossing between the two different boundary tori, or a half-infinite interval approaching an interior equilibrium height.]
  + #emph[After choosing the coordinates from one boundary and translating the geodesic parameter, the passage has closure $\[ 0 \, L \]$, begins and ends at that boundary, and has a unique turn at $s = L \/ 2$. In these coordinates 
#[#set math.equation(numbering: n => "(4.7)")
 $ t \( 0 \) = t \( L \) = 0 \, #h(2em) v \( 0 \) = - v \( L \) = v_0 > 0 \, #h(2em) t_(*) = t \( L \/ 2 \) in \( 0 \, 1 \) \,\
t \( L - s \) = t \( s \) \, #h(2em) v \( L - s \) = - v \( s \) \, #h(2em) 0 < F' \( t \) lt.eq kappa p_1^2 quad \( 0 lt.eq t lt.eq t_(*) \) \,\
p_1 eq.not 0 \, #h(2em) 0 < v_0^2 = F \( t_(*) \) - F \( 0 \) lt.eq kappa p_1^2 . $ <eq:turn-data>]

]
  #emph[An interior equilibrium height $t_oo$ in the second alternative satisfies $F \( t_oo \) = 1$ and $F' \( t_oo \) = 0$; the velocity may tend to zero there. A geodesic tangent to a boundary torus at a finite time does not enter the open neck at that time.]
] <lem:neck-passages>

#proof[
  Use inward coordinates at a finite endpoint. If $dot(tau) = 0$ there, then (4.3) and (4.1) give $dot.double(tau) = - kappa p_1^2 \/ 2$. If $p_1 eq.not 0$, the boundary point is a strict local maximum of $tau$, and nearby times have $tau < 0$. If $p_1 = 0$, then the scalar equation $dot.double(tau) = - F' \( tau \) \/ 2$ has the constant solution $tau = 0$ with these initial data. Smooth ODE uniqueness forces this solution locally. Neither possibility can be an endpoint of a nonempty open-neck component. This proves transversality and also handles a boundary grazing time. In the second case the corresponding geodesic is the fiber geodesic in the boundary torus, so uniqueness keeps it in that torus for all time.
  If $v$ vanishes at an interior time and $F'$ also vanishes there, uniqueness again makes $t$ constant. Then the solution stays at this height for all time, so the passage is $bb(R)$. Otherwise such a zero is a strict extremum of $t$. Reflecting the interval coordinate if necessary makes it a maximum $t_(*)$ with $c := F' \( t_(*) \) > 0$. Concavity gives $F' \( t \) gt.eq c$ for $0 lt.eq t lt.eq t_(*)$. On each side of the turn, the trajectory moves toward $t = 0$ and cannot turn again, because $dot(v) = - F' \( t \) \/ 2 lt.eq - c \/ 2$. It reaches $0$ in finite time: after the turn, for example, $t \( s \) lt.eq t_(*) - c \( s - s_(*) \)^2 \/ 4$ as long as it stays in the neck. Time reversal and uniqueness make the two halves equal. Translating the parameter gives (4.7). Concavity also gives $F' \( t \) lt.eq F' \( 0 \) = kappa p_1^2$, proving (4.7). Since $F' \( t_(*) \) > 0$, $p_1$ cannot be zero. Finally,
  $ v_0^2 = F \( t_(*) \) - F \( 0 \) = integral_0^(t_(*)) F' \( u \) thin d u lt.eq kappa p_1^2 t_(*) lt.eq kappa p_1^2 \, $
  which proves (4.7).
  It remains to classify passages with $v$ nowhere zero. Here $t$ is strictly monotone. If both endpoints are finite, transversality and monotonicity force the two different boundary tori. At an infinite endpoint, bounded monotonicity gives a limit $t_oo$. The identity $v^2 = 1 - F \( t \)$ shows that $\| v \|$ has a limit, which must be zero because $t$ is bounded. Thus $F \( t_oo \) = 1$. Since $dot(v)$ tends to $- F' \( t_oo \) \/ 2$, this limit must also be zero, or $v$ could not tend to zero. If $t_oo$ were a boundary height, (4.1) and $F' \( t_oo \) = 0$ would force $p_1 = 0$ in that end frame. Then $F$ would be constant and equal to $1$ throughout its end portion, giving $v = 0$ there, a contradiction. Hence the limiting height is interior.
  A nonconstant monotone passage cannot have two infinite endpoints. Indeed, its two limiting heights would be distinct, with $F = 1$ at both. Concavity would give $F gt.eq 1$ between them, whereas (4.3) gives $F < 1$ at every traversed height. This contradiction finishes the classification. ◻
]

=== 4.3 Passages requiring no turning estimate <passages-requiring-no-turning-estimate>

#thm([Lemma 4.4.])[
  #emph[Let $V$ be the restriction of a smooth compactly supported field along $gamma$ to an entire neck passage $J$. If $J = bb(R)$, or $v$ never vanishes on $J$, or the passage is a turn contained in one end portion $0 lt.eq tau lt.eq 1 \/ 4$, then 
$ I_J^perp \( V \) gt.eq 0 . $

]
] <lem:elementary-passages>

#proof[
  Suppose first that $J = bb(R)$. Replace $V$ by $V^perp$. This is a tangential change preserving compact support, and the new tangential component $q_(V^perp)$ is zero. Apply (4.5) on a compact interval whose endpoints lie outside that support. There is no boundary contribution, so
  $ I_J^perp \( V \) = I_J \( V^perp \) = E_J \( V^perp \) gt.eq 0 . $
  Suppose next that $v$ is nowhere zero. On the passage, replace $V$ by
  $ tilde(V) = V - w / v T . $
  Its interval component is identically zero. This change is smooth through every finite endpoint by transversality. At an infinite endpoint it is identically zero for sufficiently large $\| s \|$, since the original field is zero there. In particular, a possible limit $v arrow.r 0$ at infinity causes no division problem: all nonzero values of the numerator lie in a compact time interval where $v eq.not 0$. The tangential change can, if needed, be extended through the finite endpoints and cut off to a compactly supported change along the whole geodesic. No estimate uniform in $1 \/ \| v \|$ is being asserted or used.
  Write $tilde(V) = \( 0 \, tilde(z) \)$. Its tangential component is $q_(tilde(V)) = p^(sans(T)) tilde(z)$. The endpoint signs in Lemma 7, with endpoints beyond the support at each infinite end, give
  $ I_J^perp \( V \) = I_J^perp \( tilde(V) \) & gt.eq integral_J #scale(x: 120%, y: 120%)[\(] \| dot(tilde(z)) \|_Q^2 - \| p^(sans(T)) dot(tilde(z)) \|^2 #scale(x: 120%, y: 120%)[\)] thin d s\
 & gt.eq integral_J \( 1 - F \( t \) \) \| dot(tilde(z)) \|_Q^2 thin d s gt.eq 0 . $
  The second inequality is Cauchy–Schwarz in the positive definite matrix $Q$, using $\( p^(sans(T)) xi \)^2 lt.eq \( p^(sans(T)) P p \) \( xi^(sans(T)) Q xi \)$.
  Finally, on an end portion sectional curvature is nonpositive. The normal-index integrand is therefore pointwise nonnegative, by Lemma 6, which proves the last case. ◻
]

Only the finite turning excursions that leave an end portion remain. We next normalize their fields without imposing any condition on the original endpoint values.

#thm([Lemma 4.5.])[
  (A gauge on a turning excursion).  #emph[Consider a turning passage with data (4.7)– (4.7). For every smooth field $V$ on $\[ 0 \, L \]$, there is a tangentially equivalent smooth field, denoted again by $V = \( w \, z \)$, such that 
$ w \( 0 \) = w \( L \) = 0 \, #h(2em) chevron.l V \, T chevron.r med upright("is affine in ") s . $

 Put $Delta z = z \( L \) - z \( 0 \)$, $e = \( 1 \, 0 \)^(sans(T))$, and $mu = kappa v_0 \/ 4 > 0$. For this field, 
#[#set math.equation(numbering: n => "(4.8)")
 $ I_(\[ 0 \, L \])^perp \( V \) & = E_(\[ 0 \, L \]) \( V \) + frac(kappa v_0, 2) #scale(x: 120%, y: 120%)[\(] z_1 \( 0 \)^2 + z_1 \( L \)^2 #scale(x: 120%, y: 120%)[\)] - frac(\( p^(sans(T)) Delta z \)^2, L)\
 & gt.eq E_(\[ 0 \, L \]) \( V \) + mu \( e^(sans(T)) Delta z \)^2 - frac(\( p^(sans(T)) Delta z \)^2, L) . $ <eq:turning-index-identity>]

 The same left side is the normal index of the original field.]
] <lem:turning-gauge>

#proof[
  For the original field, let $q = chevron.l V \, T chevron.r$ and set
  $ h_0 = - frac(w \( 0 \), v_0) \, #h(2em) h_L = frac(w \( L \), v_0) . $
  Let $ell$ be the affine function with $ell \( 0 \) = q \( 0 \) + h_0$ and $ell \( L \) = q \( L \) + h_L$. The single change
  $ tilde(V) = V + h T \, #h(2em) h = ell - q \, $
  has zero interval component at both endpoints and satisfies $chevron.l tilde(V) \, T chevron.r = ell$ everywhere. This proves simultaneous solvability of the two requirements for arbitrary original endpoint data. If the original field is given on the complete geodesic, multiplying $ell - q$ by a smooth compactly supported cutoff equal to $1$ on $\[ 0 \, L \]$ extends this to a compactly supported tangential change; the identities on the excursion are unchanged.
  Drop the tilde. Since the interval component is zero at the endpoints, $q \( 0 \) = p^(sans(T)) z \( 0 \)$ and $q \( L \) = p^(sans(T)) z \( L \)$, so its affine slope is $p^(sans(T)) Delta z \/ L$. At $s = 0$ and $s = L$, (4.6) gives respectively $kappa v_0 z_1 \( 0 \)^2 \/ 2$ and $- kappa v_0 z_1 \( L \)^2 \/ 2$ for $chevron.l T \, Gamma \( V \, V \) chevron.r$. Substitution in (4.5) and (4.2) proves (4.8). The inequality $a^2 + b^2 gt.eq \( b - a \)^2 \/ 2$ then gives (4.8). Tangential invariance returns both statements to the original normal index form. ◻
]

The gauges in this section are used separately on each passage. There is no assertion that gauges chosen on different passages match at their endpoints. Every inequality concerns the unchanged normal index integral of the original field, which is the quantity to be summed in the global argument.

== 5 Uniform control of returning geodesics <sec:turning>

The only passages still requiring an estimate are geodesics that enter the neck and return to the same boundary. The boundary term in the index form controls one component of the endpoint change in the torus part of the variation field. We show that this control compensates for the tangential term in (4.8), uniformly over all such passages.

#thm([Proposition 5.1.])[
  #emph[For all sufficiently small positive $delta$, every returning geodesic passage of the constructed neck has nonnegative perpendicular index form $I^perp \( V \)$ for every smooth field $V$ along the closed passage, with no restriction on its endpoint values. A single choice of $delta$ works for both boundary components and all unit-speed returning geodesics.]
] <prop:turning-index>

We first record the estimates on the duration of a passage. Use the coordinates of the boundary through which it enters, so that this boundary is $t = 0$ and

$ P \( 0 \) = "diag" \( 1 \, b \) \, #h(2em) P' \( 0 \) = kappa e e^top \, #h(2em) e = \( 1 \, 0 \)^top \, #h(2em) kappa = delta a \( 0 \) > 0 . $

By Lemma 8, the passage occupies $\[ 0 \, L \]$ with $L > 0$, has one turn at $s = L \/ 2$, and satisfies

$ t \( 0 \) = t \( L \) = 0 \, #h(2em) t \( L \/ 2 \) = t_(*) in \( 0 \, 1 \) \, #h(2em) v \( 0 \) = - v \( L \) = v_0 > 0 \, $

where $v = dot(t)$, $p = Q \( t \) dot(x)$ is constant, and $F \( t \) = p^top P \( t \) p$. In particular,

#[#set math.equation(numbering: n => "(5.1)")
 $ 0 < F' \( t \) lt.eq kappa p_1^2 quad \( 0 lt.eq t lt.eq t_(*) \) \, #h(2em) 0 < v_0^2 = F \( t_(*) \) - F \( 0 \) lt.eq kappa p_1^2 . $ <eq:turning-basic>]

Thus $p_1 eq.not 0$. Here and throughout this section, primes on $P$ and $F$ denote differentiation in $t$, and dots denote differentiation in $s$.

#thm([Lemma 5.2.])[
  #emph[For every returning passage, 
#[#set math.equation(numbering: n => "(5.2)")
 $ integral_0^L v \( s \)^2 thin d s lt.eq frac(L v_0^2, 3) . $ <eq:turning-chord>]

 If $t_(*) > 1 \/ 4$, then 
#[#set math.equation(numbering: n => "(5.3)")
 $ 4 v_0 lt.eq beta kappa p_1^2 L \, #h(2em) beta = frac(1 + exp \( - 9 \/ 26 \), 2) < 1 . $ <eq:turning-time-margin>]

]
] <lem:turning-time>

#proof[
  On $\[ 0 \, L \/ 2 \]$, $v gt.eq 0$ and
  $ dot.double(v) = - 1 / 2 F'' \( t \) v gt.eq 0 . $
  Consequently the graph of $v$ lies below the chord joining its endpoint values $v_0$ and $0$:
  $ 0 lt.eq v \( s \) lt.eq v_0 \( 1 - 2 s \/ L \) \, #h(2em) 0 lt.eq s lt.eq L \/ 2 . $
  Squaring and integrating on this half-interval, and using $v \( L - s \) = - v \( s \)$, proves (5.2).
  On the same half-interval, $dot.double(t) = - F' \( t \) \/ 2 < 0$, so concavity gives $t \( s \) gt.eq 2 s t_(*) \/ L$. If $t_(*) > 1 \/ 4$, symmetry therefore implies $t \( s \) gt.eq 1 \/ 8$ throughout $\[ L \/ 4 \, 3 L \/ 4 \]$. The end formula for $P$ gives $F' \( 1 \/ 8 \) = delta a \( 1 \/ 8 \) p_1^2$, and concavity of $F$ then gives
  $ F' \( t \( s \) \) lt.eq cases(delim: "{", delta a \( 1 \/ 8 \) p_1^2 \, & L \/ 4 lt.eq s lt.eq 3 L \/ 4 \,, kappa p_1^2 \, & 0 lt.eq s lt.eq L .) $
  Since $dot(v) = - F' \( t \) \/ 2$ and $v \( L \) = - v_0$,
  $ 4 v_0 = integral_0^L F' \( t \( s \) \) thin d s lt.eq frac(delta L p_1^2, 2) #scale(x: 120%, y: 120%)[\(] a \( 0 \) + a \( 1 \/ 8 \) #scale(x: 120%, y: 120%)[\)] . $
  Finally $a \( 1 \/ 8 \) \/ a \( 0 \) = exp \( - 9 \/ 26 \)$, proving (5.3). ◻
]

We now compare the change in the torus component of a field with its coordinate energy. Apply Lemma 10 and write the resulting field as $V = \( w \, z \)$, so that $w \( 0 \) = w \( L \) = 0$ and $chevron.l V \, T chevron.r$ is affine. Put

$ X = z \( L \) - z \( 0 \) \, #h(2em) mu = frac(kappa v_0, 4) > 0 \, #h(2em) xi = dot(z) - P' \( t \) p thin w . $

The coordinate energy and the index reduction are

#[#set math.equation(numbering: n => "(5.4)")
 $ E & = integral_0^L (\| xi \|_Q^2 + dot(w)^2 - 1 / 2 F'' \( t \) w^2) d s \,\
I^perp \( V \) & gt.eq E + mu \( e^top X \)^2 - frac(\( p^top X \)^2, L) . $ <eq:turning-target>]

Thus our target is

$ \| p^top X \|^2 lt.eq L #scale(x: 120%, y: 120%)[\(] E + mu \( e^top X \)^2 #scale(x: 120%, y: 120%)[\)] . $

The boundary penalty controls only one component of $X$, so its interaction with $p$ matters.

For any constant covector $q in bb(R)^2$, integrating $dot(z) = xi + P' p thin w$ gives

$ q^top X = integral_0^L q^top xi thin d s + integral_0^L q^top P' \( t \) p thin w thin d s . $

This identity separates the two terms already present in $E$. For the second term, equip $cal(D) = H_0^1 \( 0 \, L \)$ with the inner product

$ \( w_1 \, w_2 \)_(cal(D)) = integral_0^L (dot(w)_1 dot(w)_2 - 1 / 2 F'' \( t \) w_1 w_2) d s \, $

and define

$ Phi_q \( w \) = integral_0^L q^top P' \( t \) p thin w thin d s . $

Because $- F'' gt.eq 0$ and the endpoints vanish, this inner product is positive definite. On the fixed finite interval it defines a norm equivalent to the usual $H_0^1$ norm, by boundedness of $F'' \( t \( s \) \)$ and the Poincaré inequality. No equivalence constant uniform in $L$ is needed. In particular, $Phi_q$ is continuous.

Regard the right side of the functional identity as a functional of arbitrary pairs $\( xi \, w \)$ in $L^2 \( \[ 0 \, L \] \; bb(R)^2 \, Q \) xor cal(D)$; the gauged fields provide particular pairs in this space. Its squared norm is $S \( q \, q \)$, where

#[#set math.equation(numbering: n => "(5.5)")
 $ S \( q \, r \) = integral_0^L q^top P \( t \) r thin d s + \( Phi_q \, Phi_r \)_(cal(D)^(*)) $ <eq:turning-S>]

and the dual inner product is that of the Riesz representatives. Indeed, the first summand of the functional has Riesz representative $P q$ in the $Q$ inner product. The symmetric bilinear form $S$ is positive definite because its first term is positive definite.

#thm([Lemma 5.3.])[
  #emph[For every constant covector $q$ and every gauged field as above, 
#[#set math.equation(numbering: n => "(5.6)")
 $ \| q^top X \|^2 lt.eq S \( q \, q \) E . $ <eq:turning-dual-cs>]

 For each real $alpha$, the boundary penalty gives the further bound 
#[#set math.equation(numbering: n => "(5.7)")
 $ \| p^top X \|^2 lt.eq (S \( p - alpha e \, p - alpha e \) + alpha^2 / mu) (E + mu \( e^top X \)^2) . $ <eq:turning-boundary-cs>]

 The smallest first factor in this inequality is 
#[#set math.equation(numbering: n => "(5.8)")
 $ S \( p \, p \) - frac(S \( p \, e \)^2, S \( e \, e \) + mu^(- 1)) . $ <eq:turning-minimum>]

]
] <lem:turning-duality>

#proof[
  The squared norm of $\( xi \, w \)$ in the Hilbert direct sum above is $E$. The functional identity and Cauchy–Schwarz therefore give (5.6). To use the boundary term, split
  $ p^top X = \( p - alpha e \)^top X + alpha e^top X . $
  Apply (5.6) to the first term, then apply Cauchy–Schwarz in $bb(R)^2$ to the two vectors
  $ \( sqrt(E) \, sqrt(mu) thin \| e^top X \| \) \, #h(2em) \( sqrt(S \( p - alpha e \, p - alpha e \)) \, \| alpha \| \/ sqrt(mu) \) . $
  This proves (5.7), including when either energy term vanishes. Its first factor is a quadratic in $alpha$ with positive leading coefficient $S \( e \, e \) + mu^(- 1)$. Completing the square gives (5.8), attained at $alpha = S \( p \, e \) \/ \( S \( e \, e \) + mu^(- 1) \)$. ◻
]

It now suffices to bound (5.8) by $L$. The next lemma allows an excess of $L v_0^2$ in $S \( p \, p \)$; we will show that the subtracted boundary correction recovers at least that amount. For this purpose $S \( e \, e \)$ needs only a bound proportional to $L$, whereas $S \( p \, e \)$ must remain close to $L p_1$ with an error proportional to $\| p_1 \|$. An error controlled merely by $\| p \|$ would not suffice when $p_1$ is small. The timing margin in (5.3) will then make the recovery uniform over all returns that leave the endpoint collar. All constants below depend only on the constructed cometric family and its fixed cutoff; they are independent of $p \, L \, v_0 \, t_(*)$ and the boundary end.

#thm([Lemma 5.4.])[
  #emph[There are constants $C_e \, C_m > 0$, uniform for sufficiently small $delta > 0$, such that every returning passage satisfies 
#[#set math.equation(numbering: n => "(5.9)")
 $ S \( p \, p \) & lt.eq L \( 1 + v_0^2 \) \,\
S \( e \, e \) & lt.eq C_e L \,\
\| S \( p \, e \) - L p_1 \| & lt.eq C_m delta L \| p_1 \| . $ <eq:turning-Spp>]

]
] <lem:turning-S-bounds>

#proof[
  For $w in cal(D)$, integration by parts and $F' \( t \) = - 2 dot(v)$ give
  $ Phi_p \( w \) = - 2 integral_0^L dot(v) w thin d s = 2 integral_0^L v dot(w) thin d s . $
  Thus $parallel Phi_p parallel_(cal(D)^(*))^2 lt.eq 4 integral_0^L v^2 thin d s$. Since $F \( t \) = 1 - v^2$, Lemma 12 yields
  $ S \( p \, p \) lt.eq L + 3 integral_0^L v^2 thin d s lt.eq L \( 1 + v_0^2 \) . $
  Choose a constant $C_0 gt.eq 1$ such that the cometric estimates give
  $ parallel P parallel lt.eq C_0 \, #h(2em) parallel P' parallel lt.eq C_0 delta \, #h(2em) \| P' p \|^2 lt.eq C_0 delta \( - F'' \) . $
  By the last inequality and Cauchy–Schwarz with respect to $d s$,
  $ \| Phi_e \( w \) \| lt.eq sqrt(C_0 delta) integral_0^L sqrt(- F'' \( t \)) thin \| w \| thin d s lt.eq sqrt(2 C_0 delta L) thin parallel w parallel_(cal(D)) . $
  This argument does not divide by $- F''$ and also applies on its zero set. For $delta lt.eq 1$, (5.9) follows with $C_e = 3 C_0$. The mixed term contributed by the dual inner product satisfies
  $ \| \( Phi_p \, Phi_e \)_(cal(D)^(*)) \| & lt.eq 2 sqrt(L v_0^2 \/ 3) sqrt(2 C_0 delta L)\
 & lt.eq 2 sqrt(2 C_0 a \( 0 \) \/ 3) thin delta L \| p_1 \| \, $
  where (5.1) was used in the last line.
  To estimate the other mixed term, fix $t in \[ 0 \, t_(*) \]$ and put $D \( t \) = P' \( 0 \) - P' \( t \)$. Concavity of $P$ implies $D \( t \) succ.curly.eq 0$, and
  $ parallel D \( t \) parallel lt.eq 2 C_0 delta \, #h(2em) 0 lt.eq p^top D \( t \) p = kappa p_1^2 - F' \( t \) lt.eq kappa p_1^2 . $
  Cauchy–Schwarz for the positive semidefinite form $D \( t \)$ gives
  $ \| e^top D \( t \) p \|^2 lt.eq \( e^top D \( t \) e \) \( p^top D \( t \) p \) lt.eq 2 C_0 a \( 0 \) delta^2 p_1^2 . $
  This remains valid if $D \( t \)$ is singular. Since $e^top P' \( 0 \) p = kappa p_1$, it follows that
  $ \| e^top P' \( t \) p \| lt.eq #scale(x: 120%, y: 120%)[\(] a \( 0 \) + sqrt(2 C_0 a \( 0 \)) #scale(x: 120%, y: 120%)[\)] delta \| p_1 \| . $
  Integrating from $0$ to $t lt.eq t_(*) < 1$ and using $e^top P \( 0 \) p = p_1$ gives the same bound for $\| e^top P \( t \) p - p_1 \|$. Its integral in $s$, together with the dual mixed bound, proves (5.9); for example, one can take
  $ C_m = a \( 0 \) + sqrt(2 C_0 a \( 0 \)) + 2 sqrt(2 C_0 a \( 0 \) \/ 3) . $
  ◻
]

#proof[
  If $t_(*) lt.eq 1 \/ 4$, the entire passage lies in the end region of nonpositive sectional curvature, and its perpendicular index integrand is nonnegative. Assume therefore that $t_(*) > 1 \/ 4$, and apply the unrestricted gauge of Lemma 10.
  By Lemma 13, it suffices to show that the boundary correction in (5.8) is at least $L v_0^2$, since (5.9) bounds the first term by $L \( 1 + v_0^2 \)$.
  Because $p_1 eq.not 0$, define $r = v_0^2 \/ p_1^2 > 0$. By (5.1), $r lt.eq a \( 0 \) delta$, while (5.3) and $mu = kappa v_0 \/ 4$ give $L mu gt.eq r \/ beta$. Suppose $C_m delta lt.eq 1 \/ 2$. Using Lemma 14 and the fact that $x mapsto x \/ \( 1 + C_e x \)$ is increasing for $x gt.eq 0$, we obtain
  #[#set math.equation(numbering: n => "(5.10)")
   $ frac(S \( p \, e \)^2, S \( e \, e \) + mu^(- 1)) & gt.eq L p_1^2 \( 1 - C_m delta \)^2 frac(L mu, 1 + C_e L mu)\
 & gt.eq L v_0^2 frac(\( 1 - C_m delta \)^2, beta + C_e r)\
 & gt.eq L v_0^2 frac(\( 1 - C_m delta \)^2, beta + C_e a \( 0 \) delta) . $ <eq:turning-gain>]
  In addition to the cometric construction’s upper bound on $delta$, choose
  #[#set math.equation(numbering: n => "(5.11)")
   $ 0 < delta lt.eq min {1 \, frac(1, 2 C_m) \, frac(1 - beta, 2 C_m + C_e a \( 0 \))} . $ <eq:turning-delta-choice>]
  Then
  $ \( 1 - C_m delta \)^2 gt.eq 1 - 2 C_m delta gt.eq beta + C_e a \( 0 \) delta \, $
  so (5.10) is at least $L v_0^2$. Together with (5.9), this makes (5.8) at most $L$. Equations (5.7) and (5.4) now give $I^perp \( V \) gt.eq 0$.
  Every denominator used here is positive for an actual returning passage: $L > 0$, $v_0 > 0$, $p_1 eq.not 0$, and $mu > 0$. The parameter bound (5.11) contains none of these quantities. It therefore applies to arbitrarily shallow incidence and arbitrarily long excursions without a limiting argument. The cometric bounds are uniform in the two end frames, so the same choice applies to returns through either boundary. Tangential gauge invariance transfers the conclusion to the original field with its unrestricted endpoint values. ◻
]

#thm([Proposition 5.5.])[
  (All neck passages).  #emph[Choose $delta > 0$ to satisfy Lemma 5 and (5.11), and then choose the boundary periods as in Section 3. Let $gamma$ be any complete unit-speed geodesic of the resulting closed manifold. For every connected component $J$ of its visit to the open neck and every smooth compactly supported field $V$ along $gamma$, one has 
$ I_J^perp \( V \) gt.eq 0 \, #h(2em) I_J \( V \) gt.eq 0 . $

]
] <prop:passage-index>

#proof[
  Lemma 8 lists every possible passage, including constant-height geodesics, infinite visits, and all finite returns. Lemma 9 handles the full-line and monotone cases, as well as returns contained in an endpoint collar. Proposition 11 handles all remaining returns. These conclusions apply to the restriction of the original field, with arbitrary values at finite endpoints and zero values sufficiently far out at infinite endpoints. They use the same choice of $delta$ in both endpoint frames and do not depend on the boundary periods. Finally, $I_J \( V \) = I_J^perp \( V \) + integral_J \| dot(q)_V \|^2 thin d s gt.eq 0$. ◻
]

== 6 From passages to absence of conjugate points <sec:global>

The passage estimates concern the intrinsic index form of the original field on an entire visit to the open neck. We first show that these estimates combine along every complete geodesic. We then give the index-form argument that excludes conjugate points.

#thm([Proposition 6.1.])[
  (Assembly of passage estimates).  #emph[Let $\( M \, g \)$ be a complete smooth Riemannian manifold and let $U subset M$ be open. Suppose that $g$ has nonpositive sectional curvature at every point of $M \\ U$. Assume also that, for every complete unit-speed geodesic $gamma : bb(R) arrow.r M$, every connected component $J$ of $gamma^(- 1) \( U \)$, and every smooth compactly supported field $V$ along $gamma$, the intrinsic index form satisfies 
$ I_J \( V \) gt.eq 0 . $

 Then $I_(bb(R)) \( V \) gt.eq 0$ for every such $gamma$ and $V$. The same conclusion follows if the passage hypothesis is given in the stronger form $I_J^perp \( V \) gt.eq 0$.]
] <prop:global-assembly>

#proof[
  Put $T = dot(gamma)$ and write
  $ i_V \( s \) = \| D_s V \|^2 - chevron.l R \( V \, T \) T \, V chevron.r . $
  This is a continuous, compactly supported function, so it is absolutely integrable. The open subset $gamma^(- 1) \( U \)$ of $bb(R)$ is a countable disjoint union of open intervals $J_j$: each interval contains a distinct rational number. Its complement $E$ is closed and hence measurable. Countable additivity gives
  #[#set math.equation(numbering: n => "(6.1)")
   $ I_(bb(R)) \( V \) = sum_j I_(J_j) \( V \) + integral_E i_V \( s \) thin d s \, #h(2em) sum_j \| I_(J_j) \( V \) \| lt.eq integral_(bb(R)) \| i_V \( s \) \| thin d s < oo . $ <eq:countable-index-assembly>]
  Every summand is nonnegative by hypothesis. On $E$, nonpositive sectional curvature implies $i_V gt.eq 0$: the curvature term only depends on the component of $V$ perpendicular to $T$. This proves the claim. Finally,
  $ I_J \( V \) = I_J^perp \( V \) + integral_J lr(|frac(d, d s) chevron.l V \, T chevron.r|)^2 d s $
  proves the last assertion. ◻
]

This argument allows infinitely many passages and accumulating passage endpoints. It also includes an interval equal to $bb(R)$ and intervals with one infinite endpoint. At a finite endpoint, the restriction of $V$ extends smoothly with arbitrary boundary data; at an infinite endpoint it vanishes beyond a finite time. These are precisely the fields allowed in the passage estimates. Any tangential changes used to prove those estimates are made separately on each passage. They need not fit together across endpoints: their normal index integrands equal that of the original field, and (6.1) sums only the original intrinsic integrals. In particular, no bounds uniform over the auxiliary gauge fields are required. The integral over $E$ includes all times on the interfaces, even if that set has positive measure.

#thm([Lemma 6.2.])[
  (The index-form criterion).  #emph[Let $\( M \, g \)$ be a complete smooth Riemannian manifold. If $I_(bb(R)) \( V \) gt.eq 0$ for every smooth compactly supported field along every complete unit-speed geodesic, then $g$ has no conjugate points.]
] <lem:index-criterion>

#proof[
  Fix a complete unit-speed geodesic $gamma$, set $T = dot(gamma)$, and use the symmetric bilinear index form
  $ B \( V \, W \) = integral_(bb(R)) #scale(x: 120%, y: 120%)[\(] chevron.l D_s V \, D_s W chevron.r - chevron.l R \( V \, T \) T \, W chevron.r #scale(x: 120%, y: 120%)[\)] thin d s . $
  Thus $I \( V \) = B \( V \, V \)$. We first extend the assumed nonnegativity to compactly supported $H^1$ fields. On a bounded interval containing the support in its interior, choose a parallel orthonormal frame along $gamma$. The coefficients of such a field belong to $H^1$, and their zero extensions can be approximated in $H^1$ by smooth compactly supported functions, using convolution with a smooth mollifier. The frame identifies $D_s$ with ordinary differentiation. The curvature operator $W mapsto R \( W \, T \) T$ is bounded on this fixed compact interval, so $B$ is continuous in the $H^1$ norm. Consequently $I \( V \) gt.eq 0$ for every compactly supported $H^1$ field.
  Suppose now that a nonzero Jacobi field $J$ along $gamma$ vanishes at two times $a < b$. The Jacobi equation is
  $ D_s^2 J + R \( J \, T \) T = 0 . $
  Let $hat(J)$ agree with $J$ on $\[ a \, b \]$ and vanish elsewhere. Because $J \( a \) = J \( b \) = 0$, this extension is continuous and belongs to $H^1$; its weak derivative equals $D_s J$ on $\( a \, b \)$ and zero outside. Integration by parts and the Jacobi equation yield
  $ I \( hat(J) \) = #scale(x: 120%, y: 120%)[\[] chevron.l D_s J \, J chevron.r #scale(x: 120%, y: 120%)[\]]_a^b = 0 . $
  For every smooth compactly supported field $W$ and every real $t$, nonnegativity on $H^1$ fields gives
  $ 0 lt.eq I \( hat(J) + t W \) = 2 t B \( hat(J) \, W \) + t^2 I \( W \) . $
  Considering both signs of sufficiently small $t$ shows that $B \( hat(J) \, W \) = 0$. On the other hand, a second integration by parts gives
  #[#set math.equation(numbering: n => "(6.2)")
   $ B \( hat(J) \, W \) = chevron.l D_s J \( b \) \, W \( b \) chevron.r - chevron.l D_s J \( a \) \, W \( a \) chevron.r . $ <eq:jacobi-derivative-jump>]
  The vector $D_s J \( a \)$ is nonzero: otherwise the Jacobi equation with initial data $J \( a \) = D_s J \( a \) = 0$ would imply $J equiv 0$ by uniqueness. Choose a smooth field $W$, supported in a small neighborhood of $a$ disjoint from $b$, with $W \( a \) = D_s J \( a \)$. For example, multiply the parallel extension of this vector by a smooth bump equal to one at $a$. Equation (6.2) then gives $B \( hat(J) \, W \) = - \| D_s J \( a \) \|^2 < 0$, a contradiction.
  This argument includes arbitrary Jacobi fields. In particular, the tangential coefficient $chevron.l J \, T chevron.r$ has second derivative zero, so two zeros force that coefficient to vanish identically. Every nonconstant affinely parametrized geodesic reduces to unit speed by a linear change of parameter. Along a constant geodesic the Jacobi equation is $J'' = 0$, which has no nonzero solution with two zeros. ◻
]

#proof[
  We apply these results to the constructed metric and the open neck $U = \( 0 \, 1 \) times T^2$. The manifold is closed, so its smooth metric is complete. The product cores and the matching end collars have nonpositive sectional curvature, including their boundary tori. Proposition 15 supplies the passage hypothesis for every complete unit-speed geodesic, with the one choice of the small construction parameter already made there. Proposition  16 and Lemma 17 therefore show that the metric has no conjugate points.
  Proposition 4 excludes every smooth nonpositively curved metric on this same manifold. The construction in Section 2 makes it closed, connected, and orientable, and Section 3 gives the required $C^oo$ metric. This proves both assertions of the theorem. ◻
]

== 7 An explicit hyperbolic punctured torus <app:punctured-torus>

For completeness, we recall the model in #cite(label("Bonahon2009")) Section 5.5 that supplies the surface used in Section 3. In the upper half-plane, take the ideal quadrilateral with vertices $- 1 \, 0 \, 1 \, oo$. Pair its opposite sides by

$ phi.alt \( z \) = frac(z + 1, z + 2) \, #h(2em) psi \( z \) = frac(z - 1, 2 - z) . $

Both maps are orientation-preserving hyperbolic isometries: $phi.alt$ sends the side with endpoints $- 1 \, oo$ to that with endpoints $0 \, 1$, and $psi$ sends the side with endpoints $1 \, oo$ to that with endpoints $0 \, - 1$. Their side pairings identify all four ideal vertices. The quotient has one face, two edges and one removed vertex; its compactification is an oriented torus.

For $a > 1$, choose the horodisk ${ "Im" z gt.eq a }$ at infinity and horodisks of Euclidean radius $1 \/ \( 2 a \)$ at $- 1 \, 0 \, 1$. These horodisks are disjoint and their boundary arcs are matched by the side pairings. The vertex cycle is represented, up to sign, by

$ psi^(- 1) phi.alt^(- 1) psi phi.alt = mat(delim: "(", 1, 6; 0, 1) \; $

thus the end unfolds to a horodisk modulo $z mapsto z + 6$. Writing $theta = x \/ 6$ and $r = log \( y \/ a \)$ gives

$ frac(d x^2 + d y^2, y^2) = d r^2 + (6 / a)^2 e^(- 2 r) d theta^2 \, #h(2em) theta in bb(R) \/ bb(Z) . $

The side identifications are smooth along their geodesic interiors, the displayed cusp is complete, and its complement in the quotient is compact. This gives the complete finite-area punctured torus and the cusp normal form used in the main construction.


#bibliography("refs.bib", style: "ieee", title: [References])
