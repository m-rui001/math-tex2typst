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

#align(center)[#text(size: 16pt, weight: "bold")[Power-law violations of \
Yau's nodal upper bound]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

Let $\( M^n \, g \)$ be a smooth closed connected Riemannian manifold. We use $Delta_g = "div"_g nabla_g$ and write

$ - Delta_g u = lambda u \, #h(2em) cal(Z) \( u \) = { x in M : u \( x \) = 0 } . $

Yau posed the nodal-size question in his problem collection #cite(label("Yau1982")). In its smooth closed-manifold formulation, Yau’s nodal-set conjecture predicts that the $\( n - 1 \)$-dimensional Hausdorff measure of $cal(Z) \( u \)$ is bounded above and below by positive constant multiples of $sqrt(lambda)$, with the constants depending only on the fixed manifold and metric #cite(label("DonnellyFefferman1988")) p. 162. The upper assertion is required to hold for every nonzero real eigenfunction, including all eigenfunctions in a multiple eigenspace.

We disprove that upper assertion in the smooth category. In fact, the assertion that one has an upper bound with every positive power loss,

#[#set math.equation(numbering: n => "(1.1)")
 $ cal(H)_g^(n - 1) \( cal(Z) \( u \) \) lt.eq C \( M \, g \, epsilon.alt \) lambda^(1 \/ 2 + epsilon.alt) #h(2em) upright("for every ") epsilon.alt > 0 \, $ <eq:near-sharp-target>]

fails.

#thm([Theorem 1.1.])[
  #emph[There exist a smooth Riemannian metric $g$ on $S^4 times S^1$, a number $epsilon.alt_0 > 0$, and nonzero real smooth functions $u_j$ with positive eigenvalues $lambda_j$ such that 
$ - Delta_g u_j = lambda_j u_j \, #h(2em) lambda_j arrow.r oo \, #h(2em) frac(cal(H)_g^4 \( cal(Z) \( u_j \) \), lambda_j^(1 \/ 2 + epsilon.alt_0)) arrow.r oo . $

 The metric and $epsilon.alt_0$ are fixed throughout the sequence.]
] <thm:main>

In particular, (1.1) fails for every $0 < epsilon.alt lt.eq epsilon.alt_0$ for the metric of Theorem 1.

The theorem concerns ordinary Laplace–Beltrami eigenfunctions on one closed connected manifold. Taking a product with a fixed closed manifold gives the same conclusion in each dimension greater than five. The construction makes no assertion about the corresponding upper bound in dimensions three or four.

In dimensions three and four, a companion paper constructs fixed smooth metrics and real eigenfunction sequences with $lambda arrow.r oo$ for which the nodal measure divided by $sqrt(lambda)$ tends to infinity, without asserting a fixed positive power-law excess #cite(label("OpenAINodalQualitative2026")) Theorems 1.1 and 1.2.

===== 1.1 Background. <background.>

Donnelly and Fefferman proved the sharp two-sided nodal estimate for real-analytic metrics #cite(label("DonnellyFefferman1988")) Theorem 1.2. For smooth metrics, Logunov proved the sharp lower bound #cite(label("LogunovLower2018")) Theorem 1.1 and, in dimensions at least three, a polynomial upper bound with a dimension-dependent exponent #cite(label("LogunovUpper2018")) Theorem 6.2. Regularity assumptions between analyticity and smoothness also yield stronger upper estimates: Hezari proved a $lambda^(s \/ 2)$ bound in Gevrey class $s gt.eq 1$, and a $sqrt(lambda) log \( lambda + e \)$ bound for a specified quasianalytic class #cite(label("Hezari2023")). Those hypotheses do not cover arbitrary smooth metrics. Theorem 1 disproves the smooth upper-bound part of Yau’s conjecture and even the relaxed estimate (1.1); the lower-bound results remain compatible with it.

There is a complementary tradition of prescribing nodal geometry. In dimensions at least three, Enciso and Peralta-Salas realize a smooth closed connected orientable separating hypersurface as the nodal set of a first nonconstant eigenfunction by choosing a metric #cite(label("EncisoPeraltaSalas2015")). At high energy, Enciso, Peralta-Salas, and Torres de Lizaur realize prescribed stable nodal components, up to ambient diffeomorphism, on round spheres and flat tori, with a localization restriction in the torus case #cite(label("EncisoPeraltaSalasTorres2018")). Their construction already gives arbitrarily high frequencies on fixed analytic metrics. The distinction here is power-law excess in total nodal measure, which is not furnished by those prescription theorems.

===== 1.2 The quantitative mechanism. <the-quantitative-mechanism.>

We first work with a symmetric elliptic operator on the four-sphere whose positive principal tensor and positive density can be varied independently. A local corrugation increases the integral of the gradient of a logarithmic envelope. More specifically, the part of a parent cube prepared for another corrugation has more new gradient integral than the entire old parent cube. Repetition at a fixed scale ratio therefore gives a multiplicative gain. The derivatives of order $r$ grow at most exponentially in $\( r + 1 \)$ times the number of generations. Let $k$ denote the construction frequency, with target eigenvalue $k^2$. Taking a fixed small multiple of $log k$ generations produces a smooth real envelope $h = h_k$ on the base and a fixed coordinate region $V$ such that

$ integral_V sqrt(1 + \| nabla h \|^2) thin upright(d) x gt.eq c k^gamma $

for one fixed $gamma > 0$, while keeping every fixed derivative of $h$ within a controlled power of $k$.

Finite Taylor solutions of the complex eikonal and transport equations then give localized packets beneath $e^(k h)$. They achieve any prescribed finite residual accuracy while preserving fixed derivative exponents. A real Gaussian combination has a quantitatively nonvanishing first jet everywhere and opposite signs on many pairs of small disks. The first property permits an explicit simultaneous correction of the principal tensor and density to make the function an exact eigenfunction. The second gives stable lower bounds for nodal measure without a regularity assumption on the zero set.

The distinction between constants and exponents is essential here. At a given stage, constants and frequency thresholds may depend arbitrarily badly on the required finite coefficient accuracy. The exponent $gamma$ does not; nor do the chart or coefficient neighborhood. The positive constant in the nodal lower bound and the frequency threshold may depend on the fixed input pair, collar, finite norm, and tolerance. Consequently the construction can meet every finite collection of earlier spectral-persistence tolerances and still retain a fixed power gain. A summable iteration gives one smooth limiting pair. Adding a warped circle realizes its weighted operator as an ordinary Laplace–Beltrami operator.

These steps also give reusable local facts: a corrugation with a repeatable integral gain, a phase-Hessian construction valid at zero real slope, a polynomial first-jet noncancellation argument, and an exact tensor–density correction. Each is proved below. In particular, the argument does not appeal to a qualitative existence theorem with an uncontrolled frequency threshold.

===== 1.3 Organization. <organization.>

Section 2 states the quantitative one-step construction and fixes the geometric notation. Section 3 proves the envelope estimates. Section 4 constructs and estimates the local packets. Section 5 produces exact eigenfunctions, proves the one-step construction, and passes to the fixed metric in Theorem 1.

== 2 Framework and the quantitative step <sec:framework>

=== 2.1 The weighted base operator <the-weighted-base-operator>

Let $B = S^4 subset bb(R)^5$, with round metric $g_0$ and round Riemannian density $mu$. Write a point of $B$ as $\( x_1 \, x_2 \, y \)$, where $y in bb(R)^3$, and set $t = \| y \|^2$. A #emph[positive pair] consists of a smooth positive definite symmetric contravariant tensor $A$ and a smooth function $rho > 0$. Define a metric $G$ and a differential operator $L$ by

#[#set math.equation(numbering: n => "(2.1)")
 $ G^(- 1) = rho^(- 1) A \, #h(2em) L f = rho^(- 1) "div"_mu \( A thin upright(d) f \) . $ <eq:weighted-operator>]

Thus $- L$ is symmetric and nonnegative in $L^2 \( B \, rho thin upright(d) mu \)$, with quadratic form

$ frak(a) \( f \, f \) = integral_B A \( upright(d) f \, upright(d) f \) thin upright(d) mu . $

The tensor and density will be changed independently. Their conversion to an ordinary metric occurs only at the end of the proof.

Fix a finite smooth atlas with compact coordinate subpatches covering $B$; all $C^r$ norms of functions and tensors may be taken in that atlas. For a pair, the norm means the sum of the two component norms. Equivalent fixed choices change constants but do not change the assertions. All pairs used below lie in one sufficiently small $C^1$ neighborhood of $\( g_0^(- 1) \, 1 \)$, within the space of smooth positive pairs. Accordingly $G$ and $G^(- 1)$ have common $C^1$ bounds and common ellipticity constants. Higher derivative bounds need only be finite for each fixed input pair.

Gradients, Hessians, lengths, and orthogonality in envelope and phase estimates refer to $G$ unless another metric is displayed. Integration in the elliptic operator refers to $mu$; integration in a coordinate corrugation chart refers to Lebesgue measure $upright(d) x$. For a real smooth function $h$, set

#[#set math.equation(numbering: n => "(2.2)")
 $ p & = nabla_G h \, #h(2em) Q = \( 1 + \| p \|_G^2 \)^(1 \/ 2) \,\
J_h \( e \) & = \( nabla_G^2 h \) \( p \/ Q \, p \/ Q \) + \( nabla_G^2 h \) \( e \, e \) \, #h(2em) \| e \|_G = 1 \, quad upright(d) h \( e \) = 0 . $ <eq:hessian-test>]

At $p = 0$ every unit vector is an admissible test. The positivity conditions imposed below on $J_h$ supply a gap between the envelope Hessian and the real part of a complex phase Hessian. Lemma 7 and Proposition 9 use this gap in the construction and localization of the packets. Complex inner products and tensor evaluations in the phase equations are extended bilinearly; estimates of the size of a complex vector or matrix use the ordinary Hermitian norm.

We fix once and for all

$ delta = 10^(- 6) . $

The numerical exponents below leave generous margins; we do not optimize the final positive gain. Positive constants written $c \, C \, C_r$ may change between occurrences. Any additional dependencies are specified where their uniformity matters. In particular, a finite approximation order is fixed before a frequency tends to infinity.

=== 2.2 A round region and sign certificates <a-round-region-and-sign-certificates>

For an integer $N > 1$, let

#[#set math.equation(numbering: n => "(2.3)")
 $ k = sqrt(N \( N + 3 \)) \, #h(2em) u_(*) = "Re" \( x_1 + i x_2 \)^N . $ <eq:round-beam>]

The Euclidean polynomial in (2.3) is homogeneous of degree $N$ and harmonic in $bb(R)^5$. The polar-coordinate formula

$ Delta_(bb(R)^5) = partial_r^2 + 4 / r partial_r + 1 / r^2 Delta_(g_0) $

therefore gives $- Delta_(g_0) u_(*) = k^2 u_(*)$ on $B$. Where $t < 1$, the angular coordinate $theta.alt$ in the $\( x_1 \, x_2 \)$-plane also gives

$ u_(*) = \( 1 - t \)^(N \/ 2) cos \( N theta.alt \) . $

The round beam will be retained in part of a region where the input pair is round. This region serves two purposes: it supplies an exact solution to which the packets can be glued, and it leaves a patch where a later tensor perturbation can make the eigenvalue simple while preserving that solution. The construction uses both properties before passing to the limiting operator.

The envelope construction fixes a coordinate chart $Omega subset { t > 1 \/ 2 }$ and an open region $V$ whose closure is compact in $Omega$. The initial corrugation cube is compactly contained in $V$. Euclidean balls centered in $V$ with radii tending uniformly to zero are consequently contained in $Omega$.

#prodef([Definition 2.1.])[
  A #emph[sign certificate] for a continuous real function $u$ in $Omega$ is a finite family of pairs $\( D_i^(-) \, D_i^(+) \)$ of congruent closed parallel three-dimensional Euclidean disks such that:
  + each pair is the two ends of a straight closed cylinder compactly contained in a Euclidean coordinate ball;
  + these coordinate balls are pairwise disjoint;
  + $u$ has strictly opposite signs on $D_i^(-)$ and $D_i^(+)$.
  The #emph[size] of the certificate is $sum_i cal(H)_(upright("Euc"))^3 \( D_i^(+) \)$.
] <def:certificate>

The signs in Definition 2 can be reversed on each pair. Since the disks are compact and finite in number, a certificate persists under sufficiently small uniform perturbations of $u$. It is also preserved by multiplying $u$ by any nonzero real constant. Every segment joining corresponding points of $D_i^(-)$ and $D_i^(+)$ contains a zero. This elementary projection property will provide the Hausdorff-measure bound for the final metric.

=== 2.3 The one-step construction <the-one-step-construction>

#thm([Proposition 2.2.])[
  #emph[There exist a $C^1$ neighborhood $cal(U)$ of the round pair $\( g_0^(- 1) \, 1 \)$ among smooth positive pairs, a chart $Omega$ as above, and a number $gamma > 0$ with the following property. Fix a smooth pair $\( A \, rho \) in cal(U)$, numbers 
$ 1 / 4 lt.eq l_(-) < l_(+) lt.eq 1 / 2 \, $

 and suppose that $\( A \, rho \) = \( g_0^(- 1) \, 1 \)$ on ${ t < l_(+) }$. For every integer $r gt.eq 0$ and every $eta > 0$, there exist $c > 0$ and $N_0$ such that for every integer $N gt.eq N_0$, with $k$ as in (2.3), there are a smooth positive pair $\( hat(A) \, hat(rho) \) in cal(U)$ and a nonzero real smooth function $u$ satisfying:]
  + #emph[$parallel \( hat(A) - A \, hat(rho) - rho \) parallel_(C^r) < eta$, and $\( hat(A) \, hat(rho) \) = \( g_0^(- 1) \, 1 \)$ on ${ t < l_(-) }$;]
  + #emph[for $hat(L)$ defined by (2.1), $- hat(L) u = k^2 u$, and $k^2$ is a simple eigenvalue of $- hat(L)$ on the base $B$;]
  + #emph[$u$ has a sign certificate in $Omega$ of size at least $c k^(1 + gamma)$.]
  #emph[The neighborhood $cal(U)$, chart $Omega$, and exponent $gamma$ are common to all stages. The constant $c$ and threshold $N_0$ may depend on the fixed input pair, $l_(-) \, l_(+) \, r \, eta$.]
] <prop:step>

The proof of Proposition 3 occupies the next three sections. Membership of the output in $cal(U)$ is ensured by imposing an additional sufficiently small tolerance around the fixed input pair. The conclusion permits arbitrarily small finite-norm tolerances; it makes no claim of a uniform frequency threshold as those tolerances or the collar width vary. The common exponent $gamma$ is the feature that allows a smooth limiting metric to retain a fixed power of excess nodal growth.

== 3 Envelopes with a fixed power gain <sec:envelopes>

We construct envelopes whose gradient integral grows geometrically under iteration. The part of each parent cube available for the next iteration will have more gradient integral than the entire parent had before the change. All scales and gain factors are fixed before any finite approximation order is prescribed.

Throughout this Section, tensor norms in Hessian inequalities are operator norms for $G$. Coordinate derivatives and integrals refer to fixed smooth coordinates. The notation $p \, Q \, J_h$ is that of (2.2).

=== 3.1 A seed and the preparation condition <a-seed-and-the-preparation-condition>

#thm([Lemma 3.1.])[
  #emph[There are a number $a_(*) > 0$, a smooth real function $h_0$ on $B$, a $C^1$ neighborhood $cal(G)$ of $g_0$ among smooth metrics, and a coordinate chart $Omega subset { t > 1 \/ 2 }$ with open sets $U_0 subset.double V subset.double Omega$ such that the following assertions hold uniformly for $G in cal(G)$:]
  + #emph[$h_0 = - a_(*) t$ on ${ t lt.eq 1 \/ 2 }$;]
  + #emph[$max_e J_(h_0) \( e \) gt.eq c_0 > 0$ on ${ t gt.eq 1 \/ 4 }$;]
  + #emph[on $U_0$, the Hessian of $h_0$ is positive definite with a uniform positive lower bound, and $0 < s_min lt.eq \| nabla_G h_0 \|_G lt.eq s_max$.]
  #emph[The maximum in (ii) is over all admissible tests, including all unit vectors when $upright(d) h_0 = 0$.]
] <lem:seed>

#proof[
  Begin with $tilde(h) = - a_(*) t$. Direct differentiation on the round sphere gives
  #[#set math.equation(numbering: n => "(3.1)")
   $ \| nabla_(g_0) tilde(h) \|_(g_0)^2 = 4 a_(*)^2 t \( 1 - t \) \, #h(2em) nabla_(g_0)^2 tilde(h) = 2 a_(*) \( t g_0 - upright(d) y dot.op upright(d) y \) . $ <eq:seed-identities>]
  At every point there is a nonzero tangent vector in $ker upright(d) y$, because $upright(d) y : T_x B arrow.r bb(R)^3$ has a four-dimensional domain. A round unit vector $e$ in this kernel satisfies $upright(d) tilde(h) \( e \) = 0$ and $\( nabla_(g_0)^2 tilde(h) \) \( e \, e \) = 2 a_(*) t$. Since the Hessian in (3.1) has norm at most $2 a_(*)$ and the squared gradient has norm at most $a_(*)^2$, on $t gt.eq 1 \/ 4$ we obtain
  $ J_(tilde(h)) \( e \) gt.eq a_(*) \/ 2 - 2 a_(*)^3 gt.eq a_(*) \/ 4 $
  after choosing $a_(*)^2 lt.eq 1 \/ 8$.
  At a point $x_(*)$ with $t = 1$, the Hessian has eigenvalues $2 a_(*) \, 2 a_(*) \, 0 \, 0$, and the gradient is zero. On a small neighborhood of $x_(*)$ contained in ${ t > 1 \/ 2 }$, two Hessian eigenvalues therefore have a uniform positive lower bound and the gradient is arbitrarily small. In round normal coordinates $xi$ at $x_(*)$, add $epsilon \| xi \|^2 \/ 2$ times a fixed smooth cutoff equal to one near $xi = 0$. Choose $epsilon > 0$ sufficiently small that this is a $C^2$-small perturbation on its support. The resulting function $h_0$ has positive definite Hessian at $x_(*)$.
  Here is why the cutoff region retains the required test. Shrinking its support and then the perturbation if necessary, the perturbed Hessian has two eigenvalues at least $c a_(*)$, its norm is at most $C a_(*)$, and $\| nabla_(g_0) h_0 \|$ is sufficiently small that $C a_(*) \| nabla_(g_0) h_0 \|^2 < c a_(*) \/ 2$. The positive two-plane intersects $ker upright(d) h_0$ in dimension at least one. A unit vector in that intersection gives $J_(h_0) gt.eq c a_(*) \/ 2$. This argument also applies at a critical point. Outside the perturbation support the previous $ker upright(d) y$ test applies.
  These conclusions persist in a sufficiently small common $C^1$ neighborhood of $g_0$. Indeed, the difference of the two Hessians of a fixed function is the connection difference contracted with its differential, and all metric and gradient comparisons use only $C^1$ bounds. Outside the perturbation support, the condition $upright(d) y \( e \) = 0$ still implies $upright(d) h_0 \( e \) = 0$ independently of the metric. On the support, the positive two-plane and small-gradient estimates just established are uniform under a small perturbation.
  Finally, positive definiteness at $x_(*)$ holds on a neighborhood of that point. There is a nearby point with nonzero differential: otherwise $h_0$ would be constant on that neighborhood. Choose a relatively compact neighborhood $U_0$ of such a point where the Hessian remains positive definite and the gradient stays separated from zero. Choose $U_0 subset.double V subset.double Omega subset { t > 1 \/ 2 }$ in a fixed coordinate chart, and shrink $cal(G)$ once more. All the stated constants can then be chosen uniformly. Notice that $U_0$ is chosen away from the critical point $x_(*)$. ◻
]

We use the coordinates of $Omega$ for all corrugations. They may be taken on a neighborhood of its closure, so metric and inverse metric have common ellipticity and $C^1$ bounds there. Fix positive constants $C_(upright(p))$ and $c_(upright(p))$. A smooth function $h$ is #emph[prepared at scale $S$] on a cube $P$ of side $nu S$, $0 < S lt.eq 1$, if

#[#set math.equation(numbering: n => "(3.2)")
 $ \| nabla h \| > 0 \, #h(2em) \| nabla^2 h \| lt.eq C_(upright(p)) \| nabla h \| \/ S \,\
upright("at each point there is a two-plane ") E subset ker upright(d) h upright(" such that ") J_h \( e \) gt.eq c_(upright(p)) \| nabla h \| \/ S quad \( e in E \, med \| e \| = 1 \) . $ <eq:preparation>]

The plane $E$ need not vary continuously. Cubes are parallel to the fixed coordinate axes, and the inequalities are required on their closures.

The two Hessian conditions serve different parts of the next corrugation. The Hessian norm bound controls the inherited Hessian and the variation of the parent gradient. When the gradient changes by a small relative amount, we can rotate the favorable two-plane slightly into the hyperplane perpendicular to the new gradient. One further linear tangency constraint then leaves a direction with a positive test. On the region selected for repetition, the modification supplies two favorable directions again. This is why the preparation condition asks for a two-plane even though the envelope ultimately needs only one positive test at each point.

By Lemma 4, for all sufficiently large $C_(upright(p))$ and sufficiently small $c_(upright(p)) > 0$, every sufficiently small cube in $U_0$ is prepared for $h_0$ at scale $1$, uniformly over $G in cal(G)$.

=== 3.2 A repeatable local corrugation <a-repeatable-local-corrugation>

#thm([Lemma 3.2.])[
  #emph[Under fixed ellipticity and $C^1$ metric bounds in the coordinate patch, there are constants $C_(upright(p))^(*) > 0$, $c_(upright(p))^(*) > 0$ and $zeta > 0$ with the following property. For any $C_(upright(p)) gt.eq C_(upright(p))^(*)$ and $0 < c_(upright(p)) lt.eq c_(upright(p))^(*)$, one may choose a sufficiently small reciprocal integer $nu > 0$, once and for all, such that every prepared cube $P$ at scale $S lt.eq 1$ admits a smooth modification $v = h + w$, with $w$ supported in the interior of $P$, satisfying:]
  + #emph[for fixed constants $0 < alpha lt.eq 1 lt.eq beta$ and $c > 0$, 
$ alpha \| nabla h \| lt.eq \| nabla v \| lt.eq beta \| nabla h \| \, #h(2em) max_e J_v \( e \) gt.eq c \| nabla h \| \/ S quad upright("on ") P \; $

]
  + #emph[writing $ell = nu^2 S$, some cubes in the partition of $P$ into cubes of side $nu ell$ are prepared for $v$ at scale $ell$ with the same constants in (3.2), and their union $cal(R)_P$ satisfies 
#[#set math.equation(numbering: n => "(3.3)")
 $ integral_(cal(R)_P) \| nabla v \| thin upright(d) x gt.eq \( 1 + zeta \) integral_P \| nabla h \| thin upright(d) x \; $ <eq:local-mass-gain>]

]
  + #emph[if $s = \| nabla h \( x_P \) \|$ at the center $x_P$ of $P$, then for every integer $j gt.eq 0$, 
#[#set math.equation(numbering: n => "(3.4)")
 $ parallel D^j w parallel_(L^oo \( P \)) lt.eq C_j s ell^(1 - j) . $ <eq:corrugation-derivatives>]

]
  #emph[All constants are uniform over prepared functions and cubes and over the stated class of metrics. They may depend on the fixed pattern, preparation constants, and final choice of $nu$. No derivative of the input $h$ beyond its prepared second-derivative bound is used. The pattern and $zeta$ are chosen before the preparation constants and the final $nu$; increasing $C_(upright(p))$ or decreasing $c_(upright(p))$ only requires taking $nu$ smaller.]
] <lem:corrugation>

#proof[
  The pattern will depend on three variables transverse to the parent gradient frozen at its center. Radial wells in these variables have two positive tangential Hessian directions; a small amplitude controls their potentially negative radial contribution to $J_v$. We first choose the wells and smaller concentric balls that will supply the repeatable gain. We then place this pattern in the parent and verify the Hessian test, including where the parent cutoff varies.
  ===== 3.2.1 The periodic wells. <the-periodic-wells.>
  Choose a smooth function $F$ on $\[ 0 \, 1 \]$, positive on $\( 0 \, 1 \)$, equal to $v$ near $v = 0$, and flat at $v = 1$. Inside a unit cube in $bb(R)^3$ take finitely many balls with pairwise disjoint closures and radii $R_i > 0$. On a ball, at radius $r$ from its center, set
  $ psi \( r \) = - integral_r^(R_i) F \( q \/ R_i \) thin upright(d) q \, #h(2em) f \( r \) = F \( r \/ R_i \) \, #h(2em) u_0 \( r \) = f \( r \) \/ r . $
  Extend $psi$ by zero outside the balls and periodically to $bb(R)^3$. It is smooth: near a center it is a constant plus $r^2 \/ \( 2 R_i \)$, and it is flat at the outer boundary. The extended value of $u_0$ at the center is $1 \/ R_i$. Write $sigma$ for the radial unit vector. Then
  #[#set math.equation(numbering: n => "(3.5)")
   $ nabla psi = f sigma \, #h(2em) D^2 psi = f' sigma ⊗ sigma + u_0 \( I - sigma ⊗ sigma \) \, #h(2em) f^2 \| f' \| lt.eq C u_0 \, quad f^2 lt.eq C u_0 . $ <eq:well-identities>]
  The first constant in these inequalities is independent of the radii, because, for $v = r \/ R_i$,
  $ frac(f^2 \| f' \|, u_0) = v F \( v \) \| F' \( v \) \| . $
  The second follows from $f^2 \/ u_0 = R_i v F \( v \)$ and the bounded radii. Set $f \, f' \, u_0$ equal to zero outside the balls. These coefficients are continuous, and
  #[#set math.equation(numbering: n => "(3.6)")
   $ u_0 = 0 quad arrow.r.double quad f = f' = psi = 0 . $ <eq:well-vanishing>]
  At a center $f' = u_0$, so any choice of $sigma$ gives the same Hessian in (3.5); outside the balls choose $sigma$ arbitrarily as well.
  Choose a small amplitude $a > 0$. Its smallness will use only $F$ and the radius-independent first bound in (3.5). In particular it can be chosen before the packing. The mean gradient factor on any one well is
  $ cal(W) \( a \) = 3 integral_0^1 v^2 sqrt(1 + a^2 F \( v \)^2) thin upright(d) v > 1 . $
  Put $eta_0 = \( cal(W) \( a \) - 1 \) \/ 8$. Choose the finite packing with volume fraction $pi.alt$ such that
  $ pi.alt cal(W) \( a \) > 1 + 6 eta_0 . $
  Such a packing exists. To see this without requiring an infinite packing in the construction, fill a fixed positive fraction of any remaining open set by finitely many closed grid cubes lying inside it, and put a ball with strictly smaller radius than the inradius in each cube. This captures a fixed positive fraction of the remaining volume. Finitely many repetitions make the uncovered volume as small as desired, with all ball closures still disjoint.
  Choose $eta > 0$ so small that, on the core balls $r < \( 1 - eta \) R_i$, the weighted integral per period satisfies
  $ C_(upright("core")) := sum_i integral_(r < \( 1 - eta \) R_i) sqrt(1 + a^2 f^2) thin upright(d) z' > pi.alt cal(W) \( a \) - eta_0 > 1 + 5 eta_0 . $
  Choose an inner cube fraction $q in \( 0 \, 1 \)$ such that
  #[#set math.equation(numbering: n => "(3.7)")
   $ q C_(upright("core")) > C_(upright("core")) - eta_0 > 1 + 4 eta_0 . $ <eq:repeat-slack>]
  Here $q$ is a four-dimensional volume fraction. Fix a smooth cutoff on the unit parent cube which equals one on the concentric inner cube of fraction $q$, is supported in the parent interior, and is flat wherever it is zero. Products of one-dimensional plateau cutoffs give such a function. The wells, cores, and cutoff are now fixed. All their derivative bounds are finite, although no bound uniform in derivative order is asserted.
  ===== 3.2.2 Normalization on a prepared parent. <normalization-on-a-prepared-parent.>
  Take affine coordinates $z = \( z_1 \, z' \)$ centered at $x_P$, making the metric Euclidean at the center and $nabla h \( x_P \) = s partial_(z_1)$. The linear maps and their inverses have uniform bounds; the image of $P$ is a parallelepiped of uniformly bounded distortion. The coordinate identity relating $D \( upright(d) h \)$ to the covariant Hessian and the bounded connection gives
  $ \| D \( upright(d) h \) \| lt.eq C \| upright(d) h \| \/ S $
  on $P$, since $S lt.eq 1$. Integration along segments of length $O \( nu S \)$ yields relative upper and lower bounds for the gradient and then
  #[#set math.equation(numbering: n => "(3.8)")
   $ upright(d) h \/ s = upright(d) z_1 + O \( nu \) \, #h(2em) \( G_(i j) \)_z = I + O \( nu \) \, #h(2em) \| nabla h \| \/ s = 1 + O \( nu \) . $ <eq:parent-normalization>]
  The constants here may depend on the preparation constants. Only the bounds already specified in the lemma enter them.
  Rescale the fixed parent cutoff to $P$ and call it $chi$. Set
  #[#set math.equation(numbering: n => "(3.9)")
   $ v = h + s ell a chi psi \( z' \/ ell \) \, #h(2em) ell = nu^2 S . $ <eq:corrugation-formula>]
  In the following estimates the radial coefficients are evaluated at $z' \/ ell$. A cutoff derivative at its parent scale is denoted $D_(upright("sc")) chi$; thus an ordinary derivative of $chi$ is $\( nu S \)^(- 1) D_(upright("sc")) chi$. The bounded affine changes only alter the fixed bounds for these scaled derivatives. Since $ell \/ \( nu S \) = nu$, Equation (3.9) gives
  #[#set math.equation(numbering: n => "(3.10)")
   $ upright(d) v \/ s = upright(d) z_1 + a chi f sigma dot.op upright(d) z' + O \( nu \) . $ <eq:new-gradient>]
  This proves the gradient comparison in (i) for fixed $alpha \, beta$, when $nu$ is sufficiently small.
  ===== 3.2.3 The new Hessian contribution. <the-new-hessian-contribution.>
  Write
  $ D = frac(nabla v, sqrt(1 + \| nabla v \|^2)) \, #h(2em) cal(F) = { e : upright(d) v \( e \) = 0 \, med sigma dot.op e' = 0 } \, $
  where $e'$ denotes the static transverse components in the affine coordinates. The two defining linear conditions are independent by (3.10), so $cal(F)$ is two-dimensional. For a metric unit vector $e in cal(F)$,
  #[#set math.equation(numbering: n => "(3.11)")
   $ \| e' \|^2 gt.eq 1 / 2 \, #h(2em) \| sigma dot.op D' \| lt.eq C_0 a chi f + C nu . $ <eq:test-components>]
  Indeed $e_1 = O \( nu \)$ follows from the two linear conditions. The second estimate follows from (3.10) and $G^(i j) = delta_(i j) + O \( nu \)$, using a denominator at least a fixed multiple of $s$. We may take $C_0$ absolute by first taking $nu$ small for the fixed data. These arguments are uniform even when $s$ is arbitrarily small or large.
  Let $Pi_sigma$ be Euclidean projection onto $sigma^perp$ in the transverse space. The leading contribution of $v - h$ to its Hessian test on $D \, e$, divided by $s \/ ell$, is
  $ a chi [f' \( sigma dot.op D' \)^2 + u_0 #scale(x: 120%, y: 120%)[\(] \| Pi_sigma D' \|^2 + \| e' \|^2 #scale(x: 120%, y: 120%)[\)]] . $
  By (3.11), this is at least
  $ a chi [1 / 2 u_0 - \| f' \| #scale(x: 120%, y: 120%)[\(] 2 C_0^2 a^2 chi^2 f^2 + C nu^2 #scale(x: 120%, y: 120%)[\)]] . $
  At the initial choice of amplitude, impose $2 C_0^2 a^2 sup_v v F \( v \) \| F' \( v \) \| lt.eq 1 \/ 4$. The main term is then at least $a chi u_0 \/ 4 - C a nu^2 chi \| f' \|$.
  The mixed cutoff terms on $e \, e$ vanish because $sigma dot.op e' = 0$. On $D \, D$ their size is bounded by
  $ C nu f \| D_(upright("sc")) chi \| \( chi f + nu \) . $
  The pure cutoff terms have size at most $C nu^2 \| psi \| \| D_(upright("sc"))^2 chi \|$. Finally, replacing the coordinate Hessian of $v - h$ by its covariant Hessian gives an error of size
  $ C ell \( chi f + nu \) $
  in the same units, because the connection is uniformly bounded.
  We verify uniformity of these errors also where the favorable coefficient vanishes. Set $X = chi u_0$. On a fixed compact parameter space, if continuous functions $X \, b gt.eq 0$ satisfy $b = 0$ on ${ X = 0 }$, then
  #[#set math.equation(numbering: n => "(3.12)")
   $ sup frac(nu^2 b, X + nu^2) arrow.r 0 #h(2em) \( nu arrow.r 0 \) . $ <eq:vanishing-coefficient>]
  For $X gt.eq tau$ the quotient is at most $nu^2 sup b \/ tau$; for $X < tau$ it is at most $sup_(X < tau) b$, which tends to zero as $tau arrow.b 0$. The compact parameter space here consists of cutoff position, period position, and bounded affine frames. Taking its closure is harmless. Transformed cutoff derivatives are continuous on this space and have uniform bounds.
  Apply (3.12) to $b = chi \| f' \|$, $b = f \| D_(upright("sc")) chi \|$, and $b = \| psi \| \| D_(upright("sc"))^2 chi \|$. Their vanishing follows from (3.6) and the flatness of $chi$ on its zero set. The other mixed term satisfies $nu chi f^2 \| D_(upright("sc")) chi \| lt.eq C nu X$. Moreover, $chi f lt.eq C sqrt(X)$ and $ell lt.eq nu^2$ give
  $ frac(ell \( chi f + nu \), X + nu^2) lt.eq C frac(nu^2 sqrt(X), X + nu^2) + nu lt.eq C' nu . $
  We have proved, uniformly in all prepared parents and allowed tests,
  #[#set math.equation(numbering: n => "(3.13)")
   $ ell / s [nabla^2 \( v - h \) \( D \, D \) + nabla^2 \( v - h \) \( e \, e \)] gt.eq c_a X - epsilon \( nu \) \( X + nu^2 \) \, #h(2em) epsilon \( nu \) arrow.r 0 \, $ <eq:corrugation-hessian-error>]
  for a fixed $c_a > 0$. No positive lower bound on a nonzero value of $chi$ or $u_0$ has been used.
  ===== 3.2.4 Retaining one direction everywhere. <retaining-one-direction-everywhere.>
  The old Hessian has norm $O \( nu^2 \)$ after division by $s \/ ell$. Thus the preceding estimate compares a favorable new contribution of size $X$ with inherited terms of size $nu^2$. When $X$ dominates $nu^2$, the new favorable directions suffice. When $X = O \( nu^2 \)$, the gradients are close enough to carry an old favorable direction to the new tangent space. To obtain one uniform lower bound, consider any sequence $nu arrow.r 0$ of admissible configurations. If $X \/ nu^2 arrow.r oo$ along a subsequence, the positive term in (3.13) dominates the old Hessian in every unit direction of $cal(F)$.
  If instead $X \/ nu^2$ stays bounded, then $chi f lt.eq C sqrt(X) = O \( nu \)$, so $\| nabla v - nabla h \| lt.eq epsilon_1 \| nabla h \|$ with $epsilon_1 = O \( nu \)$. This also makes their normalized gradients close uniformly for unbounded slopes. In fact, for $T \( p \) = p \/ sqrt(1 + \| p \|^2)$ and $\| q - p \| lt.eq epsilon_1 \| p \|$, $epsilon_1 lt.eq 1 \/ 2$, the segment from $p$ to $q$ stays outside the ball of radius $\| p \| \/ 2$. Therefore
  #[#set math.equation(numbering: n => "(3.14)")
   $ \| T \( q \) - T \( p \) \| lt.eq frac(epsilon_1 \| p \|, sqrt(1 + \| p \|^2 \/ 4)) lt.eq 2 epsilon_1 . $ <eq:normalized-gradient-stability>]
  There is a metric orthogonal rotation $R = I + O \( epsilon_1 \)$ taking $ker upright(d) h$ to $ker upright(d) v$. Rotate the old good two-plane $E$ in (3.2) by $R$. Inside the three-dimensional space $ker upright(d) v$, the planes $R E$ and $cal(F)$ intersect in dimension at least
  $ 2 + 2 - 3 = 1 . $
  For a unit vector $e$ in their intersection, compare the old test on $p \/ Q \, R^(- 1) e$ with the old Hessian evaluated on $D \, e$. Equation (3.14) shows that the change costs $o \( nu^2 \)$ in the normalized units. Thus the old contribution is at least $1 / 2 c_(upright(p)) nu^2$ for small $nu$. The new contribution in (3.13) is bounded below by $- o \( nu^2 \)$ in this bounded-ratio regime.
  These alternatives prove the uniform margin $c_(upright(p)) nu^2 \/ 8$ in the normalized units for some test when $nu$ is sufficiently small. Indeed, a contrary sequence has a subsequence on which $X \/ nu^2$ is bounded or tends to infinity, and both alternatives just excluded failure of that margin. Multiplication by $s \/ ell$ and (3.8) prove the Hessian assertion in (i). This is where base dimension four is used: in dimension $d$ the corresponding intersection lower bound is $d - 3$.
  ===== 3.2.5 The region prepared for repetition. <the-region-prepared-for-repetition.>
  Inside the inner parent cube where $chi = 1$, keep the points for which $z' \/ ell$ lies in a core ball. On this region $u_0$ has a fixed positive lower bound. Equations (3.13) and (3.8) imply, for every unit $e in cal(F)$,
  $ J_v \( e \) gt.eq c' s \/ ell \, #h(2em) \| nabla^2 v \| lt.eq \( C' + O \( C_(upright(p)) nu^2 \) \) s \/ ell . $
  The leading constants depend only on the fixed pattern and the uniform metric bounds. Gradient comparison now permits fixed thresholds $C_(upright(p))^(*)$ and $c_(upright(p))^(*)$ such that, for $C_(upright(p)) gt.eq C_(upright(p))^(*)$ and $0 < c_(upright(p)) lt.eq c_(upright(p))^(*)$, this region satisfies (3.2) at scale $ell$ once $nu$ is small. In particular the old term $O \( C_(upright(p)) nu^2 \)$ is absorbed after $C_(upright(p))$ has been fixed.
  Select all closed child cubes contained in this open repeat region. Since $nu$ is a reciprocal integer, the parent has an exact partition into cubes of side $nu ell$. These children satisfy the preparation condition. It remains to show that their total gradient integral exceeds that of the entire old parent. To evaluate their mass, first tile the affine $z$ coordinates by period cells of side $ell$, using a dummy period in $z_1$. The child grid uses the original coordinates, whereas these period cells use the affine coordinates; the two grids need not align. The cells meeting the inner parent boundary have relative volume $O \( ell \/ \( nu S \) \) = O \( nu \)$, uniformly over the bounded affine distortions. The points lost by retaining only whole child cubes lie in a layer of width $O \( nu ell \)$ along the core and inner parent boundaries. In each rescaled period the core boundaries have finite area, so this gives another relative $O \( nu \)$ loss. The constants may involve the smallest radius in the finite fixed packing.
  On the repeat region,
  $ \| nabla v \| \/ s = sqrt(1 + a^2 f^2) + O \( nu \) . $
  The constant affine Jacobian cancels on dividing by the parent volume. Consequently
  $ frac(1, s \| P \|) integral_(cal(R)_P) \| nabla v \| thin upright(d) x gt.eq q C_(upright("core")) - C nu \, #h(2em) frac(1, s \| P \|) integral_P \| nabla h \| thin upright(d) x lt.eq 1 + C nu . $
  Choose the final $nu$ small enough that both errors are at most $eta_0$. By (3.7), the ratio of new selected mass to old entire parent mass is then greater than
  $ frac(1 + 3 eta_0, 1 + eta_0) = 1 + frac(2 eta_0, 1 + eta_0) . $
  Fix $zeta = eta_0 \/ \( 1 + eta_0 \) > 0$. This proves (3.3); taking $nu$ smaller still preserves this value of $zeta$.
  ===== 3.2.6 Derivatives and the order of choices. <derivatives-and-the-order-of-choices.>
  Differentiating (3.9) in the fixed coordinates gives (3.4). In a term with $q$ derivatives on $chi$, the scale factor is
  $ s ell \( nu S \)^(- q) ell^(- \( j - q \)) = s ell^(1 - j) nu^q lt.eq s ell^(1 - j) . $
  All derivatives of the pattern and all powers of the bounded affine matrix enter the fixed constant $C_j$. The center slope and the affine matrix are constants in the expression being differentiated.
  To summarize the choices within this proof, first fix $F$ and its small amplitude $a$, then the finite packing, cores, and parent cutoff with the slack in (3.7). Choose the preparation constants next, large and small respectively, and finally choose a reciprocal $nu$ satisfying the local positivity, repeat preparation, and mass-error requirements. This proves the stated uniformity and completes the lemma. ◻
]

=== 3.3 Iteration and a common exponent for every finite order <iteration-and-a-common-exponent-for-every-finite-order>

#thm([Proposition 3.3.])[
  #emph[After fixing the data of Lemma 4 and possibly shrinking $cal(G)$, there are common constants $gamma > 0$ and $c > 0$ with the following property. For every smooth $G in cal(G)$ and all sufficiently large $k$, there is a smooth real envelope $h = h_k$ on $B$ such that $h = - a_(*) t + c_k$ on ${ t lt.eq 1 \/ 2 }$ and 
#[#set math.equation(numbering: n => "(3.15)")
 $ parallel h parallel_(C^j) lt.eq C_j k^(delta \( j + 1 \)) quad upright("for every fixed integer ") j gt.eq 0 \,\
max_(\| e \|_G = 1\
upright(d) h \( e \) = 0) J_h \( e \) gt.eq c k^(- delta) quad upright("on ") { t gt.eq 1 \/ 4 } \, #h(2em) integral_V sqrt(1 + \| nabla_G h \|_G^2) thin upright(d) x gt.eq c k^gamma . $ <eq:envelope-bounds>]

 Here $delta = 10^(- 6)$, and the chart $Omega$ and region $V subset.double Omega$ are fixed. All corrugations are supported in one fixed initial cube compactly contained in $V$. The constants $c_k$ may be any bounded prescribed real numbers. The exponent $gamma$ and all construction parameters are independent of derivative orders, subsequent accuracy requirements, and round gluing collars. Constants $C_j$ may depend on the order, the fixed smooth metric and coordinate systems, and the bound for $\| c_k \|$; no uniform bound as $j arrow.r oo$ is asserted.]
] <prop:envelope>

#proof[
  Choose $C_(upright(p))$ large enough and $c_(upright(p)) > 0$ small enough for both Lemma 5 and the seed preparation following Lemma 4. Choose the final $nu$ sufficiently small for the former lemma and so that a fixed cube $P_0$ of side $nu$ has closure in $U_0$. All these choices are uniform for the metrics in $cal(G)$. Put $r = nu^2$.
  Start with the prepared family $cal(P)_0 = { P_0 }$ for $h_0$. At generation $i gt.eq 1$, apply Lemma 5 on every cube of $cal(P)_(i - 1)$, using parent scale $S_i = r^(i - 1)$, and call the resulting function $h_i$. The selected child cubes form $cal(P)_i$; their sides are $nu r^i$ and they are prepared at scale $r^i$. Every generation consists of finitely many cubes with disjoint interiors. Each perturbation is supported strictly inside its parent, so each $h_i$ is smooth, including across all cube boundaries. Nothing outside $P_0$ changes.
  Let
  $ I_i = sum_(P in cal(P)_i) integral_P \| nabla h_i \| thin upright(d) x . $
  Equation (3.3) gives
  #[#set math.equation(numbering: n => "(3.16)")
   $ I_i gt.eq \( 1 + zeta \) I_(i - 1) \, #h(2em) integral_V sqrt(1 + \| nabla h_i \|^2) thin upright(d) x gt.eq I_i gt.eq I_0 \( 1 + zeta \)^i . $ <eq:iterated-mass>]
  The initial mass $I_0$ has a positive uniform lower bound by Lemma 4 and the fixed volume of $P_0$.
  We give the derivative accounting for all orders with one growth constant. Let $beta gt.eq 1$ and $0 < alpha lt.eq 1$ be the gradient comparison factors of Lemma 5. The largest gradient after $i$ generations is at most a fixed multiple of $beta^i$. On $P_0$ every point has gradient at least $s_min alpha^i$, since a point is changed at most once per generation. At generation $i$, the center slope of each parent is therefore at most $C beta^(i - 1)$. By (3.4), disjointness within that generation gives
  #[#set math.equation(numbering: n => "(3.17)")
   $ parallel D^j \( h_i - h_(i - 1) \) parallel_(L^oo) lt.eq C_j beta^(i - 1) r^(i \( 1 - j \)) . $ <eq:generation-derivatives>]
  There is no factor counting cubes in this supremum norm estimate. There is also no product of higher pattern derivative constants over generations: the increments are added, and their individual formulas involve frozen slopes and affine matrices. Passing to the fixed finite atlas only adds fixed chain-rule constants and lower-order derivatives, which satisfy the same upper bound. Summation yields
  #[#set math.equation(numbering: n => "(3.18)")
   $ parallel h_m parallel_(C^j) & lt.eq C_j (1 + sum_(i = 1)^m beta^(i - 1) r^(i \( 1 - j \)))\
 & lt.eq C'_j exp (\[ log beta + \( j - 1 \)_(+) \| log r \| + 1 \] m) lt.eq C'_j e^(C_(*) \( j + 1 \) m) \, $ <eq:all-order-envelope-growth>]
  where $\( j - 1 \)_(+) = max { j - 1 \, 0 }$ and one finite $C_(*)$ works for every $j gt.eq 0$.
  The lower Hessian margin has the same exponential control. At a point outside $P_0$, the seed margin remains unchanged. At a point in $P_0$, consider the last generation $i lt.eq m$ that changes the function there. If no such generation occurs, use the seed margin. Otherwise Lemma 5 bounds its retained margin below by
  $ c thin frac(s_min alpha^(i - 1), r^(i - 1)) gt.eq c s_min alpha^m . $
  Later perturbations vanish near that point, or all their jets there vanish at their support boundaries, so this margin persists. By increasing $C_(*)$ if necessary,
  #[#set math.equation(numbering: n => "(3.19)")
   $ max_e J_(h_m) \( e \) gt.eq c e^(- C_(*) m) quad upright("on ") { t gt.eq 1 \/ 4 } . $ <eq:iterated-hessian-margin>]
  This argument requires no nonzero-gradient assumption outside $P_0$; critical points there are covered by the seed lemma.
  Fix $theta > 0$ so small that $C_(*) theta lt.eq delta$, and for each $k gt.eq 2$ take
  $ m = floor.l theta log k floor.r \, #h(2em) gamma = theta log \( 1 + zeta \) > 0 \, #h(2em) h = h_m + c_k . $
  Equations (3.18) and (3.19) give the first two estimates in (3.15). Equation (3.16) gives the third, since $\( 1 + zeta \)^m gt.eq \( 1 + zeta \)^(- 1) k^gamma$. Adding bounded constants affects only the zeroth-order bound, and $h = - a_(*) t + c_k$ on $t lt.eq 1 \/ 2$ because both the seed perturbation and all corrugations lie above that set.
  For clarity about subsequent uses, the constants determining $C_(*)$, $theta$, and $gamma$ use only the fixed pattern, the seed, and common $C^1$ metric bounds. Higher derivatives of an individual input metric may enter constants in a later smooth coordinate change, but cannot alter these exponents. Indeed, for any fixed such coordinate change, an order-$j$ derivative of the pullback is a finite sum of derivatives of $h$ of orders at most $j$ multiplied by fixed smooth coefficients. Its growth is still bounded by $C_j k^(delta \( j + 1 \))$. Each finite order may have its own constant and frequency threshold. This establishes the common exponent for arbitrarily high finite accuracy and completes the proof. ◻
]

== 4 Local packets below an envelope <sec:waves>

Throughout this Section the smooth positive pair $\( A \, rho \)$, and hence $G$ and $L$, is fixed. The parameter $k$ tends to infinity, and $h = h_k$ satisfies (3.15). Constants may depend on the fixed pair, the constants in those bounds, and finitely many construction orders. They are independent of $k$ and of the packet center. A lower threshold for $k$ may depend on the same data.

The phase, transport amplitudes, and cutoff follow the complex WKB construction of localized quasimodes; compare #cite(label("DenckerSjostrandZworski2004")) Section 3. Here the envelope varies with the frequency. We therefore construct finite Taylor solutions and track their dependence on its derivatives and Hessian margin, keeping the support, derivative, and real-jet exponents fixed as the residual accuracy increases.

We use complex bilinear extensions of real quadratic forms. When the norm of a complex vector is used instead, it is the Hermitian norm. In ordinary coordinate derivative estimates, a fixed finite atlas with compactly contained subcharts is understood.

=== 4.1 The phase Hessian <the-phase-hessian>

We first explain how the envelope test $J_h$ enters the phase equation. At a center $z$, use $G$-normal coordinates and write $p = nabla_G h \( z \)$, $Q = \( 1 + \| p \|^2 \)^(1 \/ 2)$, and $H = nabla_G^2 h \( z \)$. For a unit vector $v perp p$, the complex vector

$ P = p + i Q v $

satisfies $P dot.op P = - 1$. A phase $phi.alt$ with $phi.alt \( z \) = h \( z \)$ and $upright(d) phi.alt \( z \) = P$ therefore satisfies the constant term of the eikonal equation $G^(i j) partial_i phi.alt thin partial_j phi.alt = - 1$. Its first-order terms require $S P = 0$, where $S = partial^2 phi.alt \( z \)$: the first metric derivatives vanish in normal coordinates. A positive gap $H - "Re" S$ then places $"Re" phi.alt$ below $h$ to quadratic order and supplies localization.

Write $p = \| p \| e_1$ and $b = \| p \| \/ Q$, choosing any unit $e_1 perp v$ when $p = 0$. For a symmetric matrix $S = U + i D$, the identity $S \( b e_1 + i v \) = 0$ forces

$ b^2 U \( e_1 \, e_1 \) + U \( v \, v \) = 0 . $

Consequently, the corresponding test on the required gap is

$ b^2 \( H - U \) \( e_1 \, e_1 \) + \( H - U \) \( v \, v \) = b^2 H \( e_1 \, e_1 \) + H \( v \, v \) = J_h \( v \) . $

This explains the positivity condition imposed on the envelope. The following lemma constructs a compatible Hessian with a quantitative gap, including when the real phase gradient vanishes.

#thm([Lemma 4.1.])[
  (A dominated characteristic Hessian).  #emph[Let $e_1 \, v$ be orthonormal vectors in $bb(R)^4$, let $0 lt.eq b < 1$, and let $H$ be a real symmetric matrix such that 
$ \| H \| lt.eq k^(4 delta) \, #h(2em) J' = b^2 H \( e_1 \, e_1 \) + H \( v \, v \) gt.eq k^(- 2 delta) . $

 For all sufficiently large $k$, there are real symmetric matrices $U \, D$ satisfying 
#[#set math.equation(numbering: n => "(4.1)")
 $ \( U + i D \) \( b e_1 + i v \) = 0 \, #h(2em) H - U gt.eq k^(- 3 delta) I \, #h(2em) \| U + i D \| lt.eq k^(20 delta) . $ <eq:phase-hessian>]

 The threshold can be chosen independently of $H \, e_1 \, v \, b$ under these hypotheses.]
] <lem:phase-hessian>

#proof[
  For $b > 0$, the first identity in (4.1) is equivalent to
  $ D v = b U e_1 \, #h(2em) D e_1 = - U v \/ b . $
  The two prescribed columns are compatible with symmetry precisely when
  #[#set math.equation(numbering: n => "(4.2)")
   $ b^2 U \( e_1 \, e_1 \) + U \( v \, v \) = 0 . $ <eq:waves-column-compatibility>]
  First suppose that $b gt.eq k^(- 12 delta)$, and set
  $ c_0 = frac(J', 1 + b^2) \, #h(2em) U = H - c_0 I . $
  Then (4.2) holds. To give the extension of $D$ explicitly, write its blocks relative to $bb(R) e_1 xor bb(R) v xor E$, where $E = { e_1 \, v }^perp$. Denote the corresponding blocks of $U$ by $u_11 \, u_12 \, u_(1 E) \, u_(2 E) \, dots.h$. Take
  $ D = mat(delim: "(", - u_12 \/ b, b u_11, - u_(2 E) \/ b; b u_11, b u_12, b u_(1 E); - u_(E 2) \/ b, b u_(E 1), 0) . $
  The identity $u_22 = - b^2 u_11$ verifies both required columns. Moreover,
  $ H - U = c_0 I gt.eq 1 / 2 k^(- 2 delta) I \, #h(2em) \| U \| lt.eq C k^(4 delta) \, #h(2em) \| D \| lt.eq C k^(16 delta) . $
  These imply (4.1) for large $k$.
  Now suppose that $0 lt.eq b < k^(- 12 delta)$. Put $K = k^(14 delta)$ and take
  $ U = - K \( I - v v^(sans(t)) \) + b^2 K v v^(sans(t)) \, #h(2em) D = - b K \( e_1 v^(sans(t)) + v e_1^(sans(t)) \) . $
  The characteristic identity follows directly. These formulas also give $D = 0$ and $U v = 0$ when $b = 0$, so no division by a small $b$ is involved in this case.
  For the domination inequality, split $H - U - k^(- 3 delta) I$ into $bb(R) v xor v^perp$. Its $v^perp$ block is at least $1 / 2 K I$ for large $k$. Its scalar $v$ block is at least
  $ k^(- 2 delta) - k^(- 20 delta) - k^(- 10 delta) - k^(- 3 delta) \, $
  because
  $ H \( v \, v \) gt.eq J' - b^2 \| H \| \, #h(2em) b^2 \| H \| lt.eq k^(- 20 delta) \, #h(2em) b^2 K lt.eq k^(- 10 delta) . $
  The Schur complement subtracts at most $C \| H \|^2 \/ K lt.eq C k^(- 6 delta)$. The positive $k^(- 2 delta)$ term dominates every subtraction. The matrix is therefore positive definite for large $k$. Finally, $\| U \| lt.eq C k^(14 delta)$ and $\| D \| lt.eq C k^(2 delta)$, proving the remaining bound. ◻
]

We will solve polynomial equations along a complex direction whose bilinear square can be very small. Only its nonzero Hermitian norm matters for this purpose.

#thm([Lemma 4.2.])[
  (Polynomial directional inverses).  #emph[Let $cal(P)_m$ be the space of complex homogeneous polynomials of degree $m$ on $bb(R)^4$, equipped with the coefficient norm in a fixed monomial basis. Fix $0 < c lt.eq C < oo$. If $q in bb(C)^4$ satisfies $c lt.eq \| q \| lt.eq C$, then 
$ q dot.op partial : cal(P)_(m + 1) arrow.r cal(P)_m $

 has a right inverse with norm bounded in terms of $m \, c \, C$. No lower bound for $\| q dot.op q \|$ is required.]
] <lem:polynomial-inverse>

#proof[
  Choose an index $i$ with $\| q_i \| gt.eq c \/ 2$, write $q dot.op partial = q_i partial_i + D'$, and let $I_i$ denote integration in $X_i$ with zero integration constant. On $cal(P)_m$, set
  $ cal(K) = frac(D' I_i, q_i) \, #h(2em) R_(q \, m) = I_i / q_i sum_(r = 0)^m \( - cal(K) \)^r . $
  Each application of $cal(K)$ lowers the degree in the variables other than $X_i$. Thus $cal(K)^(m + 1) = 0$ on $cal(P)_m$. Since
  $ \( q dot.op partial \) I_i / q_i = I + cal(K) \, $
  the finite geometric sum gives $\( q dot.op partial \) R_(q \, m) = I$. The stated coefficient bound follows from the finite formula and the bounds on $q_i^(- 1)$ and $q$. The four possible choices of $i$ have the same uniform bound. ◻
]

=== 4.2 Construction and estimates for a packet family <construction-and-estimates-for-a-packet-family>

For a complex packet $w$ centered at $z$, let

$ upright(bold(j))_z w \( x \) = e^(- k h \( x \)) (w \( x \) \, frac(partial_xi w \( x \), k Q_z)) in bb(C)^5 \, #h(2em) Q_z = sqrt(1 + \| nabla h \( z \) \|^2) . $

Here $xi$ denotes the single normal coordinate system chosen at $z$; the denominator $Q_z$ is kept fixed when $x$ varies. A family $cal(W)_z$ determines a real $5$-by-$2 \| cal(W)_z \|$ matrix $cal(J)_z \( x \)$ whose columns are the real and imaginary parts of these jets. Its least spanning singular value is the square root of the least eigenvalue of $cal(J)_z \( x \) cal(J)_z \( x \)^(sans(t))$.

#thm([Proposition 4.3.])[
  (Packets with arbitrary finite accuracy).  #emph[Fix a nonnegative integer $J$ and a real number $M > 0$. Finite construction orders can be chosen, before taking $k$ large, so that every center $z$ with $t \( z \) gt.eq 1 \/ 4$ has a family $cal(W)_z$ of four smooth complex packets with the following properties.]
  #emph[Each packet is supported in an ordinary coordinate ball about $z$ of radius at most $C k^(- 1 \/ 3 - 100 delta)$. For every fixed nonnegative integer $j$, 
#[#set math.equation(numbering: n => "(4.3)")
 $ \| D_x^j w \( x \) \| lt.eq C_j k^(2 j) e^(k h \( x \)) . $ <eq:packet-derivatives>]

 For the prescribed orders, 
#[#set math.equation(numbering: n => "(4.4)")
 $ \| D_x^j \( L + k^2 \) w \( x \) \| lt.eq C e^(k h \( x \)) k^(- M) \, #h(2em) 0 lt.eq j lt.eq J . $ <eq:packet-residual>]

 The center jets and the nearby jets satisfy 
#[#set math.equation(numbering: n => "(4.5)")
 $ sigma_min \( cal(J)_z \( z \) \) gt.eq c k^(- 3 \/ 4) \, #h(2em) sigma_min \( cal(J)_z \( x \) \) gt.eq k^(- 1) quad upright("if ") "dist" \( x \, z \) lt.eq k^(- 10) \, $ <eq:jet-span>]

 for sufficiently large $k$. Any fixed smooth reference distance may be used here. The same conclusion holds if the latter radius is multiplied by a fixed constant.]
  #emph[The exponents in the support, derivative, and jet bounds are independent of $J \, M$. Constants and lower frequency thresholds may depend on the chosen finite orders.]
] <prop:packets>

#proof[
  We divide the construction into the selection of jets, finite polynomial equations, and localization estimates.
  ===== 4.2.1 Normal coordinates and the linear jets. <normal-coordinates-and-the-linear-jets.>
  For each center choose a $G$-orthonormal frame and use normal coordinates $xi$ in that frame. Put
  $ p = nabla h \( z \) \, #h(2em) Q = Q_z \, #h(2em) H = nabla^2 h \( z \) . $
  In these coordinates the tangent and cotangent components agree at the center. The envelope bounds, with a little slack in their exponents, give
  #[#set math.equation(numbering: n => "(4.6)")
   $ Q lt.eq k^(3 delta) \, #h(2em) \| H \| lt.eq k^(4 delta) $ <eq:waves-center-bounds>]
  for large $k$.
  If $p eq.not 0$, set $e_1 = p \/ \| p \|$, and choose a favorable unit test $e_2$ from (3.15). If $p = 0$, first choose such an $e_2$, then choose any unit $e_1 perp e_2$. Complete to an orthonormal basis $e_1 \, e_2 \, e_3 \, e_4$, and put
  $ eta_k = k^(- 9 delta) \, #h(2em) v_2 = e_2 \, quad v_3 = frac(e_2 + eta_k e_3, sqrt(1 + eta_k^2)) \, quad v_4 = frac(e_2 + eta_k e_4, sqrt(1 + eta_k^2)) . $
  These three vectors span $e_1^perp$ with least spanning singular value at least $c eta_k$.
  Use the four pairs
  $ \( p' \, v \) = \( p \, v_2 \) \, \( p \, v_3 \) \, \( p \, v_4 \) \, #scale(x: 120%, y: 120%)[\(] p + Q k^(- 3 \/ 4) e_1 \, v_2 #scale(x: 120%, y: 120%)[\)] . $
  For each pair define
  $ Q' = sqrt(1 + \| p' \|^2) \, #h(2em) P = p' + i Q' v \, #h(2em) b = \| p' \| \/ Q' . $
  Then $p' = \| p' \| e_1$, $P dot.op P = - 1$, and
  #[#set math.equation(numbering: n => "(4.7)")
   $ 1 lt.eq Q' \/ Q lt.eq 1 + k^(- 3 \/ 4) . $ <eq:waves-imaginary-size>]
  Changing $e_2$ to a $v_j$ changes its Hessian value by at most $C k^(- 5 delta)$. If $a = \| p \|$, the function $a^2 \/ \( 1 + a^2 \)$ changes by at most $2 k^(- 3 \/ 4)$ when $a$ is increased by $Q k^(- 3 \/ 4)$. Indeed its derivative at $s gt.eq a$ is at most $2 \( 1 + a^2 \)^(- 3 \/ 2)$. The additional error in the Hessian test is at most $C k^(- 3 \/ 4 + 4 delta)$. Both errors are negligible compared with the original $c k^(- delta)$ margin. Consequently
  $ b^2 H \( e_1 \, e_1 \) + H \( v \, v \) gt.eq k^(- 2 delta) $
  for every selected pair. Apply Lemma 7 to obtain $U \, D$. Multiplying its characteristic identity by $Q'$ gives $\( U + i D \) P = 0$.
  ===== 4.2.2 Frozen charts and scaling. <frozen-charts-and-scaling.>
  The choice of frame may depend on $k$, but each packet uses one fixed chart when spatial derivatives are taken. More explicitly, if $E$ is its chosen frame, the chart map is
  $ Psi_(z \, E) \( xi \) = exp_z (sum_i xi_i E_i) . $
  For each fixed derivative order $q$, the derivatives of these maps and their inverses are uniformly bounded over all centers and orthonormal frames on sufficiently small common coordinate balls. This follows from smoothness and compactness of the orthonormal frame bundle of the fixed metric. In particular, the chain rule gives
  $ \| D_xi^q \( h compose Psi_(z \, E) \) \| lt.eq C_q \( G \) sum_(ell = 1)^q parallel h parallel_(C^ell) lt.eq C'_q k^(delta \( q + 1 \)) . $
  There are no spatial derivatives of the rule used to select $E$.
  Set
  #[#set math.equation(numbering: n => "(4.8)")
   $ r_0 = k^(- 100 delta) \, #h(2em) X = xi \/ r_0 \, #h(2em) kappa = k r_0 Q \, #h(2em) h_(upright("sc")) \( X \) = frac(h \( Psi_(z \, E) \( r_0 X \) \) - h \( z \), r_0 Q) . $ <eq:waves-scaling>]
  For every fixed $q gt.eq 2$,
  #[#set math.equation(numbering: n => "(4.9)")
   $ \| D_X^q h_(upright("sc")) \| lt.eq C_q Q^(- 1) k^(delta \( 101 - 99 q \)) . $ <eq:waves-scaled-envelope>]
  All these derivatives are bounded independently of $k \, z$. The constant may depend on $q$ and on high derivatives of the fixed metric.
  In normal coordinates write $L = g^(i j) \( xi \) partial_(xi_i xi_j) + beta^i \( xi \) partial_(xi_i)$. After multiplication by $r_0^2$, the operator $L + k^2$ becomes
  $ cal(L) + kappa^2 \/ Q^2 \, #h(2em) cal(L) = g^(i j) \( r_0 X \) partial_(X_i X_j) + r_0 beta^i \( r_0 X \) partial_(X_i) . $
  Its coefficients have uniformly bounded derivatives of every fixed order on a fixed $X$-ball. The normal-coordinate identities are $g^(i j) \( 0 \) = delta_(i j)$ and $partial_(xi_ell) g^(i j) \( 0 \) = 0$.
  ===== 4.2.3 Finite eikonal and transport equations. <finite-eikonal-and-transport-equations.>
  Choose an integer $T gt.eq 3$, to be specified below. We construct a complex polynomial $Phi$ with
  $ Phi \( 0 \) = 0 \, #h(2em) partial_X Phi \( 0 \) = P \/ Q \, #h(2em) partial_X^2 Phi \( 0 \) = r_0 \( U + i D \) \/ Q $
  such that
  $ E_Phi \( X \) = g^(i j) \( r_0 X \) partial_i Phi thin partial_j Phi + Q^(- 2) $
  vanishes to order $T$ at zero. Here #emph[vanishes to order $T$] means that all derivatives of order less than $T$ vanish. The constant equation follows from $P dot.op P = - 1$, and the linear equations follow from $\( U + i D \) P = 0$ and the vanishing first derivatives of the metric.
  At homogeneous degree $m gt.eq 2$, the as-yet unspecified homogeneous term $Phi_(m + 1)$ enters the equation through $2 \( P \/ Q \) dot.op partial thin Phi_(m + 1)$. All other terms have already been determined. The Hermitian norm of $P \/ Q$ lies between $1$ and $3$ for large $k$, by (4.7). Lemma 8 therefore solves each equation with a uniformly bounded right inverse. Solving through degree $T - 1$ gives the desired polynomial. Its coefficients are bounded for each fixed $T$: the prescribed Hessian is bounded by $k^(- 80 delta)$, the coefficient jets of $cal(L)$ are bounded, and only finitely many bounded algebraic operations are used.
  Define
  $ cal(T) a = 2 g^(i j) \( r_0 X \) \( partial_i Phi \) \( partial_j a \) + \( cal(L) Phi \) a . $
  Fix an integer $s gt.eq 0$. Choose polynomials $a_0 \, dots.h \, a_s$ such that
  $ a_0 \( 0 \) = 1 \, #h(2em) a_j \( 0 \) = 0 quad \( j gt.eq 1 \) \, $
  and each of
  $ cal(T) a_0 \, #h(2em) cal(T) a_j + cal(L) a_(j - 1) quad \( 1 lt.eq j lt.eq s \) $
  vanishes to order $T$ at zero. To see this directly, solve $cal(T) a = f$ by homogeneous degrees. The new amplitude term of degree $m + 1$ enters the degree-$m$ equation through $2 \( P \/ Q \) dot.op partial$; the remaining terms use only coefficients already chosen. Lemma 8 again applies. First construct the entire $a_0$, then $a_1$, and so on. Thus the second derivative in $cal(L) a_(j - 1)$ causes no circular dependence. Constants at zero are free, as stipulated above. For fixed $T \, s$, all polynomial coefficients are bounded uniformly in $k \, z$. No bound uniform as $T \, s arrow.r oo$ is asserted or needed.
  Choose once a real smooth cutoff $omega$, equal to one on ${ \| X \| lt.eq 1 }$, supported in ${ \| X \| < 2 }$, and taking values in $\[ 0 \, 1 \]$. Define
  #[#set math.equation(numbering: n => "(4.10)")
   $ a \( X \) & = sum_(j = 0)^s kappa^(- j) a_j \( X \) \,\
w \( Psi_(z \, E) \( r_0 X \) \) & = e^(k h \( z \)) e^(kappa Phi \( X \)) a \( X \) omega \( k^(1 \/ 3) X \) \, $ <eq:packet-definition>]
  and extend $w$ by zero. For large $k$, its support is compactly contained in the normal chart, so this extension is smooth and has the asserted support radius. On $\| X \| lt.eq 2 k^(- 1 \/ 3)$,
  #[#set math.equation(numbering: n => "(4.11)")
   $ a \( X \) = 1 + O \( k^(- 1 \/ 3) \) \, #h(2em) \| a \( X \) \| gt.eq 1 / 2 \, $ <eq:waves-amplitude>]
  where the constant depends on $T \, s$. This follows from the chosen constant terms and $kappa gt.eq 1$.
  ===== 4.2.4 Localization. <localization.>
  The linear part of $"Re" Phi - h_(upright("sc"))$ is either zero or $k^(- 3 \/ 4) e_1 dot.op X$. Lemma 7, (4.6), and (4.9) imply
  #[#set math.equation(numbering: n => "(4.12)")
   $ "Re" Phi \( X \) - h_(upright("sc")) \( X \) lt.eq k^(- 3 \/ 4) \| X \| - c k^(- 106 delta) \| X \|^2 + C \| X \|^3 . $ <eq:waves-localization>]
  The third derivative bounds used here are uniform for each fixed construction order. On the packet support the cubic term can be absorbed into half the quadratic deficit, since $k^(- 1 \/ 3 + 106 delta) arrow.r 0$. The maximum of the remaining linear term minus the quadratic term is $O \( k^(- 3 \/ 2 + 106 delta) \)$. Also
  $ k^(1 - 100 delta) lt.eq kappa lt.eq k . $
  Consequently
  $ \| e^(k h \( z \) + kappa Phi \( X \)) \| lt.eq 2 e^(k h \( Psi_(z \, E) \( r_0 X \) \)) quad \( \| X \| lt.eq 2 k^(- 1 \/ 3) \) $
  for large $k$.
  On the smaller annulus $1 / 4 k^(- 1 \/ 3) lt.eq \| X \| lt.eq 2 k^(- 1 \/ 3)$, the negative exponent has magnitude at least $c k^(1 \/ 3 - 206 delta)$, whereas the positive linear exponent is at most $C k^(- 1 \/ 12)$. Since $1 \/ 3 - 206 delta > 1 \/ 4$, a larger threshold gives
  #[#set math.equation(numbering: n => "(4.13)")
   $ \| e^(k h \( z \) + kappa Phi \( X \)) \| lt.eq e^(- 2 k^(1 \/ 4)) e^(k h \( Psi_(z \, E) \( r_0 X \) \)) quad (1 / 4 k^(- 1 \/ 3) lt.eq \| X \| lt.eq 2 k^(- 1 \/ 3)) . $ <eq:waves-exponential-tail>]
  ===== 4.2.5 Residual and derivative estimates. <residual-and-derivative-estimates.>
  For the uncut expression, direct differentiation gives
  $ e^(- kappa Phi) \( cal(L) + kappa^2 \/ Q^2 \) \( e^(kappa Phi) a \) =  & kappa^2 E_Phi a + kappa cal(T) a_0\
 & + sum_(j = 1)^s kappa^(1 - j) \( cal(T) a_j + cal(L) a_(j - 1) \) + kappa^(- s) cal(L) a_s . $
  Taylor’s theorem bounds a remainder vanishing to order $T$, after $q lt.eq J lt.eq T$ derivatives in $X$, by $C \| X \|^(T - q)$. On the support this is at most $C k^(- \( T - q \) \/ 3)$. Each ordinary derivative of such a remainder therefore has a cost at most $k^(1 \/ 3 + 100 delta)$, relative to its zeroth-order Taylor bound. A derivative falling on the exponential, amplitude, or cutoff has a cost at most a fixed constant times
  $ r_0^(- 1) \( 1 + kappa + k^(1 \/ 3) \) lt.eq C k^(1 + 3 delta) < C k^2 . $
  Higher coordinate derivatives obey the same conservative $k^2$ cost per derivative, by the chain rule and the fixed normal-chart bounds.
  Undoing the operator scaling costs $r_0^(- 2) = k^(200 delta)$. Thus, for $0 lt.eq j lt.eq J$, the uncut residual divided by $e^(k h)$ is bounded by
  #[#set math.equation(numbering: n => "(4.14)")
   $ C k^(200 delta + 2 J) (k^(2 - T \/ 3) + k^(1 - T \/ 3) + k^(- \( 1 - 100 delta \) s)) . $ <eq:waves-accuracy-budget>]
  The commutators with the cutoff, and any prescribed derivatives of them, have polynomial factors times (4.13). They are smaller than every inverse power of $k$.
  For example, it suffices to choose integers $T \, s$ with
  $ T > 3 \( M + 200 delta + 2 J + 3 \) \, #h(2em) s > frac(M + 200 delta + 2 J + 1, 1 - 100 delta) . $
  These choices are made before the frequency threshold. Increasing that threshold absorbs all their finite constants and proves (4.4). The same derivative calculation without the operator factor proves (4.3) for every fixed $j$, with exponent $2 j$ independent of $T \, s$.
  ===== 4.2.6 Real jet spanning. <real-jet-spanning.>
  At the center, $a \( 0 \) = 1$ and the cutoff is constant, so
  $ upright(bold(j))_z w \( z \) = (1 \, P / Q) + O \( kappa^(- 1) \) . $
  The error is bounded by $C k^(- 1 + 100 delta)$. Before this error, the real parts contain the two vectors
  $ \( 1 \, \( \| p \| \/ Q \) e_1 \) \, #h(2em) \( 1 \, \( \| p \| \/ Q + k^(- 3 \/ 4) \) e_1 \) . $
  Their coefficients are bounded, and their least spanning singular value on the value–$e_1$ plane is at least $c k^(- 3 \/ 4)$. The imaginary parts span the orthogonal $e_1^perp$ slope space with least singular value at least $c k^(- 9 delta)$. Together their least spanning singular value is at least $c k^(- 3 \/ 4)$. Since $k^(- 1 + 100 delta) = o \( k^(- 3 \/ 4) \)$, the actual center jets retain this bound, with a smaller constant. The argument applies without change at $p = 0$.
  Finally, (4.3) through order two and the first envelope derivative bound give
  $ \| D_x \( upright(bold(j))_z w \( x \) \) \| lt.eq C k^3 $
  near the center. In differentiating this expression $Q_z$ remains fixed, while differentiating $e^(- k h \( x \))$ costs $k \| D_x h \| lt.eq C k^(1 + 2 delta)$. A displacement of $O \( k^(- 10) \)$ therefore changes the jet matrix by $O \( k^(- 7) \)$. Uniformly bounded changes between ordinary and normal coordinates preserve these estimates. This is negligible relative to $k^(- 3 \/ 4)$, and proves the second inequality of (4.5), after increasing the threshold. ◻
]

=== 4.3 Deterministic estimates at the local oscillation scale <deterministic-estimates-at-the-local-oscillation-scale>

The next Lemma supplies estimates for an arbitrary polynomial-sized collection of the preceding packets. It includes packets whose centers lie outside the region in which signs will be measured. Use the fixed chart $Omega subset { t > 1 \/ 2 }$ and the open set $V subset.double Omega$ from the preceding Sections. Points of $Omega$ are identified with their coordinate vectors.

#thm([Lemma 4.4.])[
  (Packets on a wavelength ball).  #emph[Fix the finite construction orders in Proposition 9 and a fixed finite number $K_1 gt.eq 0$. Let $cal(W)$ be the collection of all four packets from each of finitely many centers in ${ t gt.eq 1 \/ 4 }$, with $\| cal(W) \| lt.eq C k^(K_1)$. Suppose that for every $x in V$ some center is within $C_0 k^(- 10)$ of $x$, where $C_0$ is fixed. Set 
$ R_x = \( k Q_x \)^(- 1) \, #h(2em) S_x^2 = sum_(w in cal(W)) \| w \( x \) \|^2 \, #h(2em) w_x \( Y \) = w \( x + R_x Y \) \, quad \| Y \| lt.eq 2 . $

 The coordinate ball in this definition lies in $Omega$ for large $k$.]
  #emph[Consider the packets whose supports meet this closed ball. Their centered scaled coordinates $X_z$ are defined on the whole ball. Partition them into 
$ cal(N)_x = { w : \| X_z \( x \) \| < 1 / 2 k^(- 1 \/ 3) } \, #h(2em) cal(T)_x = { w : \| X_z \( x \) \| gt.eq 1 / 2 k^(- 1 \/ 3) } . $

 For every fixed nonnegative integer $j$, uniformly in $x in V$, 
#[#set math.equation(numbering: n => "(4.15)")
 $ S_x & gt.eq c e^(k h \( x \)) \,\
sup_(\| Y \| lt.eq 2) \| D_Y^j w_x \( Y \) \| & lt.eq C_j \| w \( x \) \| &  & \( w in cal(N)_x \) \,\
sup_(\| Y \| lt.eq 2) \| D_Y^j w_x \( Y \) \| & lt.eq C_j e^(- k^(1 \/ 4)) e^(k h \( x \)) &  & \( w in cal(T)_x \) . $ <eq:scaled-packet-bounds>]

 Every packet in $cal(N)_x$ has cutoff identically one and nonzero amplitude on the ball. Moreover, 
#[#set math.equation(numbering: n => "(4.16)")
 $ lr(|"Im" (frac(upright(d)_Y w_x, w_x)) \( 0 \)|) gt.eq c #h(2em) \( w in cal(N)_x \) . $ <eq:imaginary-gradient>]

 In particular, 
#[#set math.equation(numbering: n => "(4.17)")
 $ 1 / S_x^2 sum_(w in cal(W)) sup_(\| Y \| lt.eq 2) \| D_Y^j w_x \( Y \) \|^2 & lt.eq C_j \,\
1 / S_x^2 sum_(w in cal(N)_x) \| w \( x \) \|^2 & = 1 - o \( 1 \) . $ <eq:waves-square-sums>]

 The constants and thresholds may depend on the fixed construction orders and on $K_1 \, C_0$, but not on $k \, x$.]
] <lem:scaled-packets>

#proof[
  The bounds on the first two derivatives of $h$ imply
  $ \| D_x Q \| lt.eq C k^(4 delta) $
  in the fixed chart. A packet centered at $z$ that meets the ball about $x$ has
  $ \| z - x \| lt.eq C k^(- 1 \/ 3 - 100 delta) + C \/ k . $
  For large $k$, such a $z$, and the whole ball, belong to a compactly contained part of $Omega$. Normal coordinates centered at $z$ are defined throughout the ball. The preceding estimates give
  $ \| Q_z - Q_x \| lt.eq C k^(- 1 \/ 3 - 96 delta) + C k^(- 1 + 4 delta) = o \( 1 \) . $
  In particular, $Q_z \/ Q_x$ is bounded above and below independently of the packet. The same comparison holds for $Q$ throughout the ball. Since $\| upright(d) h \| lt.eq C Q$ in the coordinate chart,
  #[#set math.equation(numbering: n => "(4.18)")
   $ k \| h \( x + R_x Y \) - h \( x \) \| lt.eq C \, #h(2em) \| Y \| lt.eq 2 . $ <eq:waves-local-weight>]
  The nearest center has $\| X_z \( x \) \| = O \( k^(- 10 + 100 delta) \)$. The center formula and its nearby-jet estimate in the proof of Proposition 9 show that one of its packets has $\| w \( x \) \| gt.eq c e^(k h \( x \))$. This proves the first line of (4.15).
  Write $kappa_z = k r_0 Q_z$. For every fixed $q gt.eq 1$, the chain rule and normal-chart bounds give
  $ \| D_Y^q X_z \| lt.eq C_q r_0^(- 1) R_x^q \, #h(2em) kappa_z \| D_Y^q X_z \| lt.eq C_q thin Q_z / Q_x \( k Q_x \)^(1 - q) lt.eq C_q . $
  For $q = 1$ there is also a lower bound: the matrix
  #[#set math.equation(numbering: n => "(4.19)")
   $ kappa_z D_Y X_z = \( Q_z \/ Q_x \) D_x xi_z $ <eq:waves-scaled-jacobian>]
  has inverse bounded independently of $k \, x \, z$. In particular,
  $ \| X_z \( x + R_x Y \) - X_z \( x \) \| lt.eq C k^(- 1 + 100 delta) \/ Q_x = o \( k^(- 1 \/ 3) \) . $
  Suppose first that $w in cal(T)_x$. At every point where its cutoff or any derivative of the cutoff can contribute,
  $ 1 / 4 k^(- 1 \/ 3) lt.eq \| X_z \| lt.eq 2 k^(- 1 \/ 3) . $
  Apply (4.13). Each fixed positive $Y$-derivative of $kappa_z Phi \( X_z \)$ is bounded: in a term containing $m$ derivatives of $X_z$, the displayed derivative bounds leave a factor $kappa_z^(1 - m) lt.eq 1$. Amplitude derivatives are bounded as well. Derivatives of $omega \( k^(1 \/ 3) X_z \)$ are bounded because $k^(1 \/ 3) \/ kappa_z lt.eq k^(- 2 \/ 3 + 100 delta) lt.eq 1$. Thus differentiation introduces only fixed constants at each fixed order. Together with (4.18), this proves the tail bound in (4.15). This argument uses an absolute estimate and is valid even if $w \( x \) = 0$.
  For $w in cal(N)_x$, the displacement estimate shows that $\| X_z \| < k^(- 1 \/ 3)$ throughout the ball, so its cutoff is identically one. By (4.11), the amplitude is bounded away from zero. The bounds just proved for derivatives of $kappa_z Phi \( X_z \)$ and $a \( X_z \)$ imply bounded derivatives of $w_x$ relative to $\| w_x \|$. Integrating the bounded real logarithmic derivative along straight segments in the $Y$-ball gives
  $ \| w_x \( Y \) \| lt.eq C \| w_x \( 0 \) \| = C \| w \( x \) \| . $
  This proves the second line of (4.15), including $j = 0$.
  For the lower oscillation estimate, the bounded coefficients of $Phi$ give
  $ "Im" partial_X Phi \( X_z \( x \) \) = \( Q' \/ Q_z \) v + O \( k^(- 1 \/ 3) \) . $
  By (4.7) its leading term has norm at least one. The inverse bound in (4.19) therefore gives a positive lower bound for the imaginary $Y$-gradient of $kappa_z Phi \( X_z \)$. The amplitude contributes only
  $ lr(|frac(upright(d)_Y a \( X_z \), a \( X_z \))|) lt.eq C r_0^(- 1) R_x = C k^(- 1 + 100 delta) \/ Q_x = o \( 1 \) . $
  It cannot cancel that lower bound. This proves (4.16), including at centers with $p = 0$ and for phases nearly isotropic in the complex bilinear form.
  Packets whose supports do not meet the ball contribute zero to all the displayed sums. For the other packets, squaring (4.15), dividing by $S_x^2 gt.eq c e^(2 k h \( x \))$, and using the cardinality bound shows that the total tail contribution is at most
  $ C_j k^(K_1) e^(- 2 k^(1 \/ 4)) = o \( 1 \) . $
  The non-tail contributions are bounded by a constant times $sum_(cal(N)_x) \| w \( x \) \|^2 \/ S_x^2 lt.eq 1$. At derivative order zero the definition of $S_x$ also shows that this latter ratio equals $1 - o \( 1 \)$. This proves (4.17). ◻
]

== 5 Exact eigenfunctions and a fixed metric <sec:global>

We combine the packets with the round beam and choose a real sample with a nonvanishing first jet and a large sign certificate. Quantitative control of the first jet permits exact correction of the coefficients; the certificate preserves the nodal lower bound under later perturbations. We then make the eigenvalue simple in the remaining round collar and use spectral persistence to pass to one smooth pair.

We use the common neighborhood, regions $V subset.double Omega$, and exponent $gamma > 0$ supplied by Proposition 6. Shrink the neighborhood of positive pairs, if necessary, so that its associated metrics belong to the neighborhood required there. Throughout a single step the input pair is fixed. Constants may depend on this pair, on a fixed positive collar width, and on fixed finite approximation orders. Their frequency exponents, when specified below, do not have these dependencies.

=== 5.1 A weighted Gaussian construction <a-weighted-gaussian-construction>

Fix $l_(-) \, l_(+)$ as in Proposition 3, put $w = l_(+) - l_(-) > 0$, and choose

$ s_i = l_(-) + i w \/ 5 quad \( 1 lt.eq i lt.eq 4 \) . $

For the allowed frequency $k = sqrt(N \( N + 3 \))$, define

$ b_N \( t \) = frac(N, 2 k) log \( 1 - t \) \, #h(2em) t < 1 . $

Apply Proposition 6 and choose the additive constant in $h$ so that $h \( s_2 \) = b_N \( s_2 \)$. Here the notation $h \( s_2 \)$ is unambiguous because $h = - a_(*) t + upright("constant")$ on $t lt.eq 1 \/ 2$. The constants added in this way are bounded, since $s_2 in \[ 1 \/ 4 \, 1 \/ 2 \]$ and $N \/ k lt.eq 1$. For the fixed sufficiently small seed slope $a_(*)$ and all sufficiently large $N$,

$ frac(upright(d), upright(d) t) \( h - b_N \) = - a_(*) + frac(N, 2 k \( 1 - t \)) gt.eq c_0 > 0 #h(2em) \( 0 lt.eq t lt.eq 1 \/ 2 \) \, $

where $c_0$ can be fixed independently of the collar. Consequently,

#[#set math.equation(numbering: n => "(5.1)")
 $ h lt.eq b_N - c w quad \( t lt.eq s_1 \) \, #h(2em) h gt.eq b_N + c w quad \( s_3 lt.eq t lt.eq s_4 \) $ <eq:gluing-gaps>]

for a fixed $c > 0$.

Choose a smooth cutoff $0 lt.eq beta lt.eq 1$ equal to one for $t lt.eq s_3$ and zero for $t gt.eq s_4$. Set

#[#set math.equation(numbering: n => "(5.2)")
 $ W = e^(k h) + beta \( t \) e^(k b_N \( t \)) . $ <eq:gluing-weight>]

The second summand is extended by zero outside $t < s_4$; this is smooth. The input pair is round on the support of $beta$. Thus the only residual of $beta u_(*)$ is produced by derivatives of $beta$, where the second inequality in (5.1) applies. For every fixed nonnegative integer $q$ and every fixed $M > 0$,

#[#set math.equation(numbering: n => "(5.3)")
 $ \| D^q \( beta u_(*) \) \| & lt.eq C_q k^q W \,\
\| D^q \( L + k^2 \) \( beta u_(*) \) \| & lt.eq C_(q \, M) k^(- M) W \,\
\| upright(d) W \| \/ W & lt.eq C k^2 . $ <eq:beam-weighted-bounds>]

All derivatives here and below are in the fixed finite coordinate systems. To justify the first bound, work on $t lt.eq s_4 < 1 \/ 2$ and use $u_(*) = \( 1 - t \)^(N \/ 2) cos \( N theta.alt \)$ in finitely many angular charts. Each derivative costs at most a fixed constant times $k$. In the cutoff region the exponential gap absorbs the cutoff derivatives. The second bound follows in the same way from the commutator with $beta$. Finally, $\| upright(d) h \| lt.eq C k^(2 delta)$ and the same gap control the derivative of (5.2), giving its last bound. For a fixed collar, all derivatives of $beta$ are fixed constants; more quantitatively they may be bounded by $C_q w^(- q)$.

Choose a net in ${ t gt.eq s_1 }$ of mesh at most a fixed small multiple of $k^(- 10)$, with at most $C k^40$ centers. At every center take the fixed finite family of Proposition 9. Denote the resulting collection, counting packets with their center and family index, by $cal(W)_k$. Its cardinality is at most $C k^40$. For each $v in cal(W)_k$ take two independent standard real Gaussian variables $g_v^(\( 1 \)) \, g_v^(\( 2 \))$, all independent, and set

#[#set math.equation(numbering: n => "(5.4)")
 $ u = beta u_(*) + sum_(v in cal(W)_k) #scale(x: 120%, y: 120%)[\(] g_v^(\( 1 \)) "Re" v + g_v^(\( 2 \)) "Im" v #scale(x: 120%, y: 120%)[\)] . $ <eq:gaussian-sum>]

Let $cal(B)_k$ be the event that all these coefficients have absolute value at most $k$. A Gaussian tail estimate gives

#[#set math.equation(numbering: n => "(5.5)")
 $ bb(P) \( cal(B)_k^c \) lt.eq C k^40 e^(- k^2 \/ 2) arrow.r 0 . $ <eq:coefficient-event>]

Given a finite integer $J gt.eq 2$ and a number $M > 0$, choose the packet orders so that their residuals through order $J$ decay at least as $k^(- M - 42) e^(k h)$. This choice is made before $k$ is taken large. The packet estimates, (5.3), and the cardinality bound imply, on $cal(B)_k$,

#[#set math.equation(numbering: n => "(5.6)")
 $ \| D^q u \| & lt.eq C_q k^(2 q + 41) W #h(2em) \( 0 lt.eq q lt.eq J \) \,\
\| D^q frak(r) \| & lt.eq C k^(- M) W #h(2em) \( 0 lt.eq q lt.eq J \) \,\
frak(r) & = "div"_mu \( A thin upright(d) u \) + k^2 rho u . $ <eq:sum-weighted-bounds>]

The multiplication by the fixed smooth $rho$ is included in the second estimate. In particular, increasing $J$ or $M$ does not change the exponent $2 q + 41$ in the first estimate.

Every packet is supported within distance $C k^(- 1 \/ 3 - 100 delta)$ of its center. The function $t$ has bounded differential, so for a fixed $C$ all packets vanish on

#[#set math.equation(numbering: n => "(5.7)")
 $ t < s_1 - C k^(- 1 \/ 3 - 100 delta) . $ <eq:untouched-region>]

On this set $u = u_(*)$ and $frak(r) = 0$.

We use the full five-dimensional jet spanning in (4.5) to show that, with probability tending to one, $u$ and its first derivatives never become too small simultaneously. A lower bound by an inverse power of $k$ is sufficient: the coefficient correction will spend a larger power of residual accuracy to compensate for it.

#thm([Lemma 5.1.])[
  (A quantitative nonvanishing first jet).  #emph[For every fixed choice of the finite packet orders, the construction above satisfies 
#[#set math.equation(numbering: n => "(5.8)")
 $ bb(P) (cal(B)_k ∩ {inf_(x in B) frac(\| u \( x \) \| + \| upright(d) u \( x \) \|_(g_0), W \( x \)) gt.eq k^(- 500)}) arrow.r 1 . $ <eq:noncancellation>]

 The exponent $500$ is independent of those orders and of the fixed input pair and collar.]
] <lem:noncancellation>

#proof[
  We separate two deterministic regions. If $W \/ e^(k h) > k^50$, then $beta = 1$ for large $k$: on its transition region (5.1) instead gives $W \/ e^(k h) lt.eq 1 + e^(- c w k)$. In the uncut region, the cosine formula and the angular derivative give
  $ \| u_(*) \| + \| upright(d) u_(*) \|_(g_0) gt.eq c e^(k b_N) . $
  On $cal(B)_k$, the packet value and first derivative together are bounded by $C k^43 e^(k h)$. The beam therefore dominates their sum on this region and gives a lower bound $c W$ for the first jet. The first inequality in (5.1) puts all of $t < s_1$ in this region for sufficiently large $k$.
  At a point in the remaining region there is a nearby net center. The persisting real jet span in (4.5), after converting the normalized derivative to ordinary coordinate derivatives, gives for the value and four derivatives of the random sum a covariance matrix whose least eigenvalue has square root at least
  $ c k^(- 1) e^(k h) gt.eq c k^(- 51) W gt.eq k^(- 52) W $
  for all sufficiently large $k$. Only one nearby packet family is needed for this lower bound. All other families add nonnegative covariance matrices. The deterministic beam is a mean shift and does not affect the maximum of a Gaussian density. Hence, in any fixed coordinate chart and for any fixed constant $C_0$, the #emph[unconditional] probability that the normalized jet
  $ cal(J) \( x \) = W \( x \)^(- 1) \( u \( x \) \, partial_1 u \( x \) \, dots.h \, partial_4 u \( x \) \) $
  has norm at most $C_0 k^(- D)$ is bounded by
  #[#set math.equation(numbering: n => "(5.9)")
   $ C k^(260 - 5 D) . $ <eq:jet-small-ball>]
  Indeed the density is at most $C k^260$ and the five-dimensional ball has volume $C k^(- 5 D)$. No conditioning on $cal(B)_k$ is used in this estimate.
  On $cal(B)_k$, (5.6) through order two and the last bound in (5.3) give
  $ \| D cal(J) \| lt.eq C k^45 lt.eq k^46 $
  for sufficiently large $k$. In each of finitely many coordinate patches covering $B$, take a grid of mesh $k^(- D - 48)$. Its total cardinality is at most $C k^(4 D + 192)$. Apply (5.9) at grid points in the Gaussian region; on the other grid points the deterministic beam bound already holds on $cal(B)_k$. The union of the Gaussian bad events has probability at most
  $ C k^(260 - 5 D + 4 D + 192) = C k^(452 - D) . $
  With $D = 500$ this tends to zero. Choose the fixed grid-point threshold $C_0 k^(- D)$ large enough to account for the finitely many coordinate norm comparisons. The interpolation error on $cal(B)_k$ is at most $C k^(- D - 2)$, so the grid bounds imply $\| u \| + \| upright(d) u \|_(g_0) gt.eq k^(- D) W$ everywhere. Subtracting the bad probabilities and (5.5) proves (5.8). All order-dependent constants have only increased the lower threshold on $k$. ◻
]

=== 5.2 Sign certificates with a power gain <sign-certificates-with-a-power-gain>

To obtain a fixed positive probability of opposite signs on each wavelength ball, we need a different estimate. After normalizing the variance of the value to one, we will show that at least one directional derivative retains variance bounded away from zero even when the value is fixed. The nonzero imaginary logarithmic gradients in Lemma 10 provide this bound. Thus sign production uses the packets’ oscillation at the local wavelength, while the preceding lemma uses their full first-jet span.

#thm([Lemma 5.2.])[
  #emph[For every fixed choice of the packet orders in (5.4), there exist $p_(*) \, c_(*) > 0$, independent of $k$, such that for all sufficiently large allowed frequencies, the probability that $u$ has a sign certificate in $Omega$ of size at least $c_(*) k^(1 + gamma)$ is at least $p_(*)$. The certificate can be chosen from pairs of disks fixed deterministically before sampling the Gaussian coefficients.]
] <lem:signs>

#proof[
  For $x in V$, put
  #[#set math.equation(numbering: n => "(5.10)")
   $ R_x = \( k Q_x \)^(- 1) \, #h(2em) Q_x = \( 1 + \| nabla_G h \( x \) \|_G^2 \)^(1 \/ 2) . $ <eq:sign-radius>]
  All balls below are Euclidean coordinate balls. Their radii are at most $k^(- 1)$, so fixed enlargements lie in a common relatively compact subset of $Omega$ for large $k$. The envelope bounds give $\| D Q \| lt.eq C k^(4 delta)$. If two candidate balls intersect, their centers are at distance at most $2 \/ k$, and their $Q$ values differ by at most $C k^(- 1 + 4 delta)$. Since $Q gt.eq 1$, the corresponding radii are uniformly comparable.
  At each fixed $k$ the candidate radii have a positive lower bound. Choose a finite maximal disjoint family of open balls ${ B \( x \, R_x \) : x in cal(X)_k }$, with centers in $V$. Uniformly bounded enlargements of these balls cover $V$, and $Q$ is comparable to $Q_x$ in each enlargement. Thus
  #[#set math.equation(numbering: n => "(5.11)")
   $ integral_V k Q \( y \) thin upright(d) y lt.eq C sum_(x in cal(X)_k) k Q_x R_x^4 = C sum_(x in cal(X)_k) R_x^3 \, #h(2em) sum_(x in cal(X)_k) R_x^3 gt.eq c k^(1 + gamma) . $ <eq:weighted-packing>]
  The last inequality uses (3.15).
  Fix one ball. The beam vanishes on its radius-two enlargement for large $k$, because $overline(V) subset { t > 1 \/ 2 }$ and $s_4 < 1 \/ 2$. Define
  $ S_x^2 = sum_(v in cal(W)_k) \| v \( x \) \|^2 \, #h(2em) U_x \( Y \) = u \( x + R_x Y \) \/ S_x \, #h(2em) \| Y \| lt.eq 2 . $
  In expressions differentiated with respect to $Y$, a packet $v$ means its composition $v \( x + R_x Y \)$. Lemma 10 applies to the entire packet collection, including packets centered outside $V$ that meet this ball. It gives $S_x gt.eq c e^(k h \( x \))$; uniformly bounded sums of normalized squared packet derivatives through every fixed order; and, for every non-tail packet,
  #[#set math.equation(numbering: n => "(5.12)")
   $ lr(|"Im" frac(upright(d)_Y v, v) \( 0 \)|) gt.eq c . $ <eq:local-imaginary-lower>]
  Here a non-tail has its cutoff identically one on the scaled ball and nonzero value at the center. For tails, the lemma supplies absolute exponential bounds, even if $v \( x \) = 0$. Polynomially many tails consequently contribute $o \( 1 \)$ to the normalized squared value and derivative sums. In particular,
  #[#set math.equation(numbering: n => "(5.13)")
   $ S_x^(- 2) sum_(v med upright(n o n upright("-") t a i l)) \| v \( x \) \|^2 = 1 - o \( 1 \) . $ <eq:non-tail-mass>]
  All these statements are uniform over $x in cal(X)_k$.
  The value $U_x \( 0 \)$ is a standard real Gaussian. We verify that some directional derivative has a uniformly positive conditional variance given this value. Let $z$ be the coefficient-space vector whose coordinates for packet $v$ are $\( "Re" v \( x \) \, "Im" v \( x \) \)$, and let $T$ be the matrix whose corresponding columns are the four-dimensional real derivative vectors $upright(d)_Y "Re" v \( 0 \)$ and $upright(d)_Y "Im" v \( 0 \)$. Thus $\| z \|^2 = S_x^2$. If $g$ is the vector of independent standard Gaussian coefficients, the value and gradient are $z^(sans(t)) g \/ S_x$ and $T g \/ S_x$. The conditional gradient covariance is
  #[#set math.equation(numbering: n => "(5.14)")
   $ S_x^(- 2) T (I - frac(z z^(sans(t)), S_x^2)) T^(sans(t)) . $ <eq:conditional-covariance>]
  For each non-tail packet define the unit coefficient vector $c_v$ supported on its two coordinates, with entries
  $ frac(\( - "Im" v \( x \) \, "Re" v \( x \) \), \| v \( x \) \|) . $
  These vectors are mutually orthonormal and perpendicular to $z$. The orthogonal projection in (5.14) therefore dominates $sum_v c_v c_v^(sans(t))$ as a nonnegative quadratic form. Moreover
  $ T c_v = \| v \( x \) \| "Im" frac(upright(d)_Y v, v) \( 0 \) . $
  Equations (5.12) and (5.13) show that the trace of (5.14) is at least a fixed $c > 0$. There is consequently a deterministic unit direction $e_x$ in $bb(R)^4$ such that the derivative $Z_x = partial_(e_x) U_x \( 0 \)$, conditioned on $U_x \( 0 \)$, has variance between fixed positive constants. Its unconditional variance is bounded above by the deterministic squared-derivative estimates. Those estimates also bound the regression coefficient $"Cov" \( Z_x \, U_x \( 0 \) \)$.
  For clarity, the needed uniform control of the local $C^2$ norm follows from finitely many derivatives. The deterministic estimates give
  $ sup_(\| Y \| lt.eq 2) bb(E) \| D_Y^q U_x \( Y \) \|^2 lt.eq C_q #h(2em) \( 0 lt.eq q lt.eq 5 \) . $
  Integration and the Sobolev inequality on concentric balls in $bb(R)^4$ yield
  #[#set math.equation(numbering: n => "(5.15)")
   $ bb(E) lr(bar.v.double U_x bar.v.double)_(C^2 \( overline(B \( 0 \, 1 \)) \))^2 lt.eq C bb(E) lr(bar.v.double U_x bar.v.double)_(H^5 \( B \( 0 \, 2 \) \))^2 lt.eq C . $ <eq:local-c2-moment>]
  We choose the $C^2$ norm to control the Euclidean gradient norm and Hessian operator norm, changing only the fixed constant in this inequality. The Sobolev embedding used here is valid since $5 > 2 + 4 \/ 2$; see #cite(label("Evans2010")) Sections 5.6–5.7.
  Let $a' = 1 \/ 4$ and fix $0 < c' < a' \/ 4$. For every sufficiently large fixed number $H$, the Gaussian conditional density formula gives
  $ bb(P) #scale(x: 120%, y: 120%)[\(] 1 lt.eq Z_x lt.eq 2 \, med \| U_x \( 0 \) \| < c' \/ H #scale(x: 120%, y: 120%)[\)] gt.eq c_1 \/ H . $
  Indeed, on the indicated value interval the conditional mean is bounded, and the conditional variance is bounded above and away from zero. The Gaussian density on the fixed derivative interval $\[ 1 \, 2 \]$ then has a uniform positive lower bound. By (5.15), failure of the bound $lr(bar.v.double U_x bar.v.double)_(C^2) lt.eq H$ has probability at most $C \/ H^2$. Choose $H$ once so large that the intersection of these three conditions has probability at least $pi_(*) = c_1 \/ \( 2 H \) > 0$.
  On that intersection Taylor’s formula at $plus.minus a' e_x \/ H$ gives opposite signs, with absolute values at least $a' \/ \( 2 H \)$: the linear term has magnitude at least $a' \/ H$, the center value has magnitude at most $c' \/ H$, and the quadratic error is at most $a' ""^2 \/ \( 2 H \)$. The gradient bound preserves these signs on the parallel transverse disks of radius
  $ sigma_(*) = a' \/ \( 4 H^2 \) $
  centered at those two points. The whole closed cylinder between the disks is compactly contained in the unit ball. The direction $e_x$, centers and radii are deterministic functions of the packet data. After scaling by $R_x$, they provide a potential certificate pair inside $B \( x \, R_x \)$.
  Let $F_k$ be the fraction of successful balls weighted by $R_x^3$. No independence among these successes is claimed or needed. Since $0 lt.eq F_k lt.eq 1$ and $bb(E) F_k gt.eq pi_(*)$,
  #[#set math.equation(numbering: n => "(5.16)")
   $ bb(P) \( F_k gt.eq pi_(*) \/ 2 \) gt.eq frac(pi_(*), 2 - pi_(*)) > 0 . $ <eq:weighted-success>]
  The Euclidean three-area of one successful disk is $omega_3 sigma_(*)^3 R_x^3$, where $omega_3$ is the unit-ball volume in $bb(R)^3$. On the event in (5.16), (5.11) therefore gives a certificate of size at least $c_(*) k^(1 + gamma)$. Its cylinders lie in disjoint open balls, as required by Definition 2. This proves the lemma with $p_(*) = pi_(*) \/ \( 2 - pi_(*) \)$. ◻
]

Lemmas 11 and 12 can be realized simultaneously. For each fixed choice of the orders, first fix the positive number $p_(*)$ in Lemma 12, and then take $k$ so large that the failure probability in (5.8) is less than $p_(*) \/ 2$. The simultaneous event has probability at least $p_(*) \/ 2$. Thus, for every sufficiently large allowed $k$, there is a real smooth $u$ satisfying (5.6), the pointwise lower bound in (5.8), and a certificate of size $c_(*) k^(1 + gamma)$. This probability subtraction is valid even if $p_(*)$ is extremely small. The probability bounds above were obtained without conditioning on $cal(B)_k$; only deterministic derivative estimates and interpolation used that event.

=== 5.3 Exact coefficient correction <exact-coefficient-correction>

#thm([Lemma 5.3.])[
  #emph[Let $\( A \, rho \)$ be a fixed smooth positive pair, let $u$ be real and smooth, and let $W$ be a smooth positive weight. Suppose that 
$ \| u \| + \| upright(d) u \|_(g_0) gt.eq k^(- 500) W . $

 Fix an integer $R gt.eq 0$. Suppose that 
$ \| D^q u \| lt.eq C_q k^(2 q + 41) W quad \( 0 lt.eq q lt.eq R + 2 \) \, #h(2em) \| D^q frak(r) \| lt.eq C_q k^(- M) W quad \( 0 lt.eq q lt.eq R + 1 \) \, $

 where $frak(r) = "div"_mu \( A thin upright(d) u \) + k^2 rho u$. There are smooth real corrections $\( delta A \, delta rho \)$ canceling the eigenfunction residual exactly, and 
#[#set math.equation(numbering: n => "(5.17)")
 $ lr(bar.v.double \( delta A \, delta rho \) bar.v.double)_(C^R) lt.eq C_R k^(- M + 2129 + 1088 R) . $ <eq:correction-size>]

 The corrections vanish on every open set where $frak(r) = 0$. In particular, choosing $M gt.eq 2131 + 1088 R$ makes them tend to zero in $C^R$ as $k arrow.r oo$. For sufficiently small corrections the output pair is positive and $u$ is its exact eigenfunction at $k^2$.]
] <lem:correction>

#proof[
  Write $I = g_0^(- 1)$ and define globally
  #[#set math.equation(numbering: n => "(5.18)")
   $ cal(D) & = u^2 + I \( upright(d) u \, upright(d) u \) \, #h(2em) F = - frak(r) \/ cal(D) \,\
delta A & = F u I \, #h(2em) delta rho = k^(- 2) #scale(x: 120%, y: 120%)[\(] F u - "div"_mu \( F I thin upright(d) u \) #scale(x: 120%, y: 120%)[\)] . $ <eq:correction-formula>]
  The lower bound on the first jet gives $cal(D) gt.eq 1 / 2 k^(- 1000) W^2 > 0$, so these are smooth. The product rule gives the exact identity
  $ "div"_mu \( delta A thin upright(d) u \) + k^2 delta rho thin u & = u "div"_mu \( F I thin upright(d) u \) + F I \( upright(d) u \, upright(d) u \)\
 & quad + F u^2 - u "div"_mu \( F I thin upright(d) u \)\
 & = F cal(D) = - frak(r) . $
  Thus $"div"_mu \( \( A + delta A \) upright(d) u \) + k^2 \( rho + delta rho \) u = 0$ identically.
  We include finite derivative bounds to specify the accuracy needed in this step. For $0 lt.eq q lt.eq R + 1$, the hypotheses imply
  $ \| D^q cal(D) \| lt.eq C_q k^(2 q + 86) W^2 . $
  Every term in a derivative of order $q$ of $cal(D)^(- 1)$ is a constant times $cal(D)^(- m - 1) product_(i = 1)^m D^(q_i) cal(D)$, where $q_i gt.eq 1$, $sum_i q_i = q$, and $m lt.eq q$; the order-zero case is included separately. Hence
  $ \| D^q \( cal(D)^(- 1) \) \| lt.eq C_q k^(1000 + 2 q + 1086 q) W^(- 2) = C_q k^(1000 + 1088 q) W^(- 2) . $
  By the product rule,
  #[#set math.equation(numbering: n => "(5.19)")
   $ \| D^q F \| lt.eq C_q k^(- M + 1000 + 1088 q) W^(- 1) #h(2em) \( 0 lt.eq q lt.eq R + 1 \) . $ <eq:F-derivatives>]
  No derivatives of $W^(- 1)$ are required for these estimates: the displayed weights bound each differentiated factor before the factors are multiplied.
  Multiplying (5.19) by derivatives of $u$ gives $\| D^q \( F u \) \| lt.eq C_q k^(- M + 1041 + 1088 q)$. Replacing $u$ by $I upright(d) u$ gives the bound $C_q k^(- M + 1043 + 1088 q)$, with the derivatives of the fixed tensor $I$ absorbed in the constant. The divergence in (5.18) costs one further derivative, and the density correction has the factor $k^(- 2)$. These bounds give (5.17); its exponent for the density is $1043 + 1088 \( R + 1 \) - 2 = 2129 + 1088 R$. The cancellation of the two weights is what permits arbitrarily small coefficient changes even where the original function is exponentially small.
  If $frak(r) = 0$ on an open set, then $F = 0$ there and both corrections vanish. Finally, the cone of positive pairs is open in $C^0$ on the compact base, so sufficiently small corrections preserve positivity. ◻
]

=== 5.4 Simplicity on a protected round patch <simplicity-on-a-protected-round-patch>

#thm([Lemma 5.4.])[
  #emph[Suppose a smooth positive pair has a real eigenfunction $u$ at $k^2 = N \( N + 3 \)$, with $N > 1$. Suppose there is an open region on which the pair equals the round pair and $u = u_(*)$, containing a point with $0 < t < 1$ at which $upright(d) u$ and $upright(d) t$ are independent. Then one can make $k^2$ simple by an arbitrarily small smooth tensor perturbation supported in that region, while preserving $u$ and $rho$ exactly. The perturbation can be arbitrarily small in any prescribed finite $C^R$ norm.]
] <lem:simplicity>

#proof[
  Take a small product coordinate patch $O$ in the stated region on which $\( u \, t \)$ are the first two coordinates, and $upright(d) u eq.not 0$. Choose a smooth nonnegative bump $chi$ supported in $O$ and strictly positive on a smaller product patch $O_0$. Define
  $ E = chi (I - frac(\( I upright(d) u \) ⊗ \( I upright(d) u \), I \( upright(d) u \, upright(d) u \))) \, #h(2em) I = g_0^(- 1) \, $
  extending by zero off $O$. This is a smooth nonnegative symmetric contravariant tensor and $E upright(d) u = 0$.
  Let $cal(E)$ be the real eigenspace at $k^2$ for the given pair. The nonnegative form
  $ f mapsto integral_B E \( upright(d) f \, upright(d) f \) thin upright(d) mu \, #h(2em) f in cal(E) \, $
  has kernel exactly $"span" { u }$. Indeed, a kernel element satisfies $upright(d) f in "span" { upright(d) u }$ on $O_0$. After making the product patch smaller, this means $f = b \( u \)$ for a smooth one-variable function $b$. The round eigenfunction equations imply
  #[#set math.equation(numbering: n => "(5.20)")
   $ b'' \( u \) \| upright(d) u \|_(g_0)^2 = k^2 #scale(x: 120%, y: 120%)[\(] u b' \( u \) - b \( u \) #scale(x: 120%, y: 120%)[\)] . $ <eq:simplicity-composition>]
  The Euclidean gradient of the homogeneous harmonic polynomial defining $u_(*)$ has squared norm $N^2 \( 1 - t \)^(N - 1)$, and its radial derivative is $N u$. Tangential projection onto $S^4$ consequently gives
  $ \| upright(d) u \|_(g_0)^2 = N^2 #scale(x: 120%, y: 120%)[\(] \( 1 - t \)^(N - 1) - u^2 #scale(x: 120%, y: 120%)[\)] . $
  Differentiate (5.20) with respect to $t$ while fixing the coordinate $u$. Since $N > 1$ and $t < 1$, it follows that $b'' \( u \) = 0$. Substitution back into (5.20) eliminates the constant term of $b$, so $f = c u$ on $O_0$.
  The difference $f - c u$ satisfies a second-order elliptic equation with smooth real positive definite principal coefficients and smooth lower-order coefficients. Aronszajn’s unique continuation theorem applies: its local hypotheses allow principal coefficients of class $C^2$ with Lipschitz second derivatives and bounded lower-order coefficients, and smooth solutions satisfy its solution hypotheses #cite(label("Aronszajn1957")) pp. 235–236. Vanishing on an open patch gives infinite-order vanishing there. On the connected base the difference is therefore identically zero, proving the assertion about the kernel.
  For $tau > 0$ replace $A$ by $A + tau E$. The eigenfunction $u$ and its eigenvalue remain exact because $E upright(d) u = 0$ identically. We claim that $k^2$ is simple for every sufficiently small positive $tau$. Otherwise there would be $tau_m arrow.b 0$ and real eigenfunctions $f_m$ at $k^2$, normalized in $L^2 \( rho thin upright(d) mu \)$ and orthogonal to $u$. Their energy identity is
  $ integral_B \( A + tau_m E \) \( upright(d) f_m \, upright(d) f_m \) thin upright(d) mu = k^2 \, $
  so uniform ellipticity bounds them in $H^1$. A subsequence converges weakly in $H^1$ and strongly in $L^2$ to a normalized function $f_0$ orthogonal to $u$. Passing to the weak equation shows $f_0 in cal(E)$; elliptic regularity makes it smooth. For any fixed $phi.alt in cal(E)$, testing the two eigenfunction equations against one another cancels the original form and gives
  $ integral_B E \( upright(d) f_m \, upright(d) phi.alt \) thin upright(d) mu = 0 . $
  Weak convergence passes this fixed bilinear identity to the limit. Now choose $phi.alt = f_0$ to see that $f_0$ is in the kernel just identified, contradicting its normalization and orthogonality. This proves the claim. The tensor $E$ is fixed before choosing $tau$; hence $tau E$ can meet every prescribed finite norm tolerance, while remaining supported in $O$. ◻
]

=== 5.5 Proof of the quantitative step <proof-of-the-quantitative-step>

#proof[
  Fix the input pair, the collar, $r$ and $eta$. Choose $R gt.eq max { r \, 1 }$ and a smaller positive tolerance $eta'$ so that total $C^R$ movement less than $eta'$ implies the requested $C^r$ movement and keeps the pair positive and in $cal(U)$. Such a choice exists because the fixed input belongs to the open set $cal(U)$.
  Choose $J = R + 2$ and $M gt.eq 2131 + 1088 R$, and then choose the finite packet orders giving (5.6). All these choices precede frequency selection. Lemmas 11 and 12 give, for every sufficiently large allowed $k$, a sample with the required first-jet bound, residual bounds and a certificate of size $c_(*) k^(1 + gamma)$. Lemma 13 changes the pair by at most $C_R k^(- 2)$ in $C^R$ while preserving that same function. Choose $k$ large enough for this change to be less than $eta' \/ 2$.
  We describe explicitly why a narrow collar only changes this frequency threshold. Packet supports avoid the region below $s_1 - C k^(- 1 \/ 3 - 100 delta)$. Requiring
  #[#set math.equation(numbering: n => "(5.21)")
   $ C k^(- 1 \/ 3 - 100 delta) < w \/ 100 \, #h(2em) c w k > \( M' + P \) log k + log C_q \( w \) $ <eq:collar-thresholds>]
  protects a fixed subcollar and makes any required cutoff residual $C_q \( w \) k^P e^(- c w k)$ smaller than $k^(- M')$. Only finitely many orders $q$ and finite targets $M'$ are needed at this step. For every already fixed $w > 0$, all inequalities in (5.21) hold for every sufficiently large $k$. In particular the exact corrections vanish below $s_1 - w \/ 100$, where the coefficients remain round and $u = u_(*)$.
  In the subcollar
  $ l_(-) + w \/ 20 < t < l_(-) + w \/ 10 $
  choose a point with $sin \( N theta.alt \) eq.not 0$. Since $0 < t < 1$, $upright(d) t eq.not 0$, and the nonzero angular derivative makes $upright(d) u$ and $upright(d) t$ independent. Lemma 14 applies there. After $k$ and the sample are fixed, form its tensor $E$ and choose $tau > 0$ below its simplicity threshold and so small that $lr(bar.v.double tau E bar.v.double)_(C^R) < eta' \/ 2$. This tensor can have large finite derivatives depending on $k$; the subsequent scalar choice of $tau$ absorbs them. It preserves $u$, its exact eigenvalue and all current signs exactly. Its support lies in $t > l_(-)$, so the final pair is round on $t < l_(-)$.
  The final pair meets every conclusion of Proposition 3. In particular, its certificate constant $c_(*)$ was fixed after choosing the finite orders and before taking $k$ large, and it was unaffected by either correction. The exponent $gamma$, the chart and the background neighborhood were fixed upstream. Neither the collar estimates nor the arbitrary finite tolerances change them. The construction works for every sufficiently large integer $N$, as asserted. ◻
]

=== 5.6 Spectral persistence under finite norm tolerances <spectral-persistence-under-finite-norm-tolerances>

#thm([Lemma 5.5.])[
  #emph[Let a smooth positive pair $cal(P) = \( A \, rho \)$ have a simple positive base eigenvalue $lambda$ and a real eigenfunction with a sign certificate $cal(C)$. If $I subset \( 0 \, oo \)$ is an open interval containing $lambda$, there are an integer $s gt.eq 1$ and $epsilon > 0$ such that every smooth positive pair $cal(P)'$ satisfying 
$ lr(bar.v.double cal(P)' - cal(P) bar.v.double)_(C^s) lt.eq epsilon $

 has a simple eigenvalue in $I$ and a real eigenfunction with the same certificate disks. Thus a closed ball defined by one finite norm can be contained in a persistence neighborhood.]
] <lem:persistence>

#proof[
  We recall the spectral and regularity facts used here. The form
  $ integral_B A \( upright(d) f \, upright(d) v \) thin upright(d) mu + integral_B rho f v thin upright(d) mu $
  is coercive on $H^1 \( B \)$ and defines the inverse of $- L + 1$ in $L^2 \( rho thin upright(d) mu \)$. The compact embedding $H^1 arrow.r.hook L^2$ makes this inverse compact, and it is selfadjoint. The spectral theorem and elliptic regularity give a discrete nonnegative spectrum with finite multiplicities and smooth real eigenfunctions. Its ordered eigenvalues obey the min–max principle with Rayleigh quotient
  #[#set math.equation(numbering: n => "(5.22)")
   $ frac(integral_B A \( upright(d) f \, upright(d) f \) thin upright(d) mu, integral_B rho f^2 thin upright(d) mu) . $ <eq:weighted-rayleigh>]
  Uniform multiplicative comparisons of nearby positive tensors and densities compare (5.22) for every $f$ and therefore imply convergence of each ordered eigenvalue under $C^0$ convergence of pairs. Choose a smaller interval about $lambda$, with closure in $I$, separating it from its neighboring ordered eigenvalues. Their convergence implies that for sufficiently close pairs the corresponding ordered eigenvalue is still simple and lies in $I$.
  We also need uniform convergence of a corresponding normalized eigenfunction, up to sign. Here only finitely many coefficient derivatives are needed. For a fixed smooth elliptic $L$ on the closed base, the local interior estimates, a finite partition of unity and interpolation give
  #[#set math.equation(numbering: n => "(5.23)")
   $ lr(bar.v.double f bar.v.double)_(H^(a + 2)) lt.eq C_a #scale(x: 120%, y: 120%)[\(] lr(bar.v.double L f bar.v.double)_(H^a) + lr(bar.v.double f bar.v.double)_(L^2) #scale(x: 120%, y: 120%)[\)] #h(2em) \( a = 0 \, 1 \, 2 \, dots.h \) . $ <eq:elliptic-persistence-estimate>]
  These are the usual interior elliptic estimates; the Sobolev and compactness statements used here are described in #cite(label("Evans2010")) Sections 5.6–5.7 and 6.3. A sufficiently small finite coefficient norm makes $L' - L$ small as an operator $H^(a + 2) arrow.r H^a$ for each of finitely many specified $a$. Its contribution in (5.23) can then be absorbed on the left. Applying the resulting estimates at $a = 0 \, 2$, together with the eigenfunction equation, gives a uniform $H^4$ bound for eigenfunctions whose eigenvalues stay in the chosen bounded interval and whose $L^2$ norms are bounded. For example, requiring sufficiently small $C^4$ changes of the pair is more than enough for these finitely many operator bounds: the principal coefficients of $L$ involve $A \, rho$ without derivatives, and its first-order coefficients involve at most their first derivatives.
  Suppose that pairs converge in such a finite norm to $cal(P)$. Normalize their corresponding real eigenfunctions $f_m$ by $integral rho_m f_m^2 thin upright(d) mu = 1$. Positivity bounds their ordinary $L^2$ norms, so the preceding argument bounds them in $H^4$. Rellich compactness and Sobolev embedding in dimension four give a subsequence converging in $C^0$ (for example, first converge in $H^3$, which embeds in $C^0$). Passing to the weak equation shows that the limit is a normalized eigenfunction at $lambda$ for $cal(P)$. By simplicity it equals the prescribed normalized eigenfunction or its negative.
  The finite collection of strict signs on compact disks has a positive minimum absolute margin after this normalization. Hence all sufficiently close such eigenfunctions have the same opposite signs on the same disks, allowing an overall change of sign. If no sufficiently small finite-norm neighborhood had this property, a sequence converging in that norm would contradict the preceding compactness argument. Finally, decrease its radius to put a closed finite-norm ball inside the neighborhood. This proves the lemma, including the assertion for varying densities. ◻
]

=== 5.7 One smooth limiting pair and the ordinary metric <one-smooth-limiting-pair-and-the-ordinary-metric>

#proof[
  Use monotone fixed coordinate norms for pairs. Choose $b > 0$ so that the closed $C^1$ ball of radius $b$ about $cal(P)_0 = \( g_0^(- 1) \, 1 \)$ consists of positive pairs in $cal(U)$. Fix
  $ l^(\( j \)) = 1 / 4 + 2^(- j - 2) quad \( j gt.eq 0 \) \, #h(2em) epsilon.alt_0 = gamma \/ 4 > 0 . $
  We construct pairs $cal(P)_j = \( A_j \, rho_j \)$, frequencies $k_j$, and certificates $cal(C)_j$ inductively. Every output is round on $t < l^(\( j \))$.
  After producing $cal(P)_i$, apply Lemma 15 to its simple eigenvalue $k_i^2$, its certificate, and the interval $\( k_i^2 \/ 2 \, 2 k_i^2 \)$. Denote a resulting finite norm order and closed-ball radius by $s_i$ and $epsilon_i > 0$. At stage $j$, these numbers are already fixed for $i < j$. Put
  #[#set math.equation(numbering: n => "(5.24)")
   $ r_j & = max { j + 1 \, 1 \, s_1 \, dots.h \, s_(j - 1) } \,\
eta_j & = min {2^(- j) \, med b 2^(- j - 1) \, thin min_(1 lt.eq i < j) 2^(- \( j - i + 1 \)) epsilon_i} . $ <eq:diagonal-budgets>]
  For $j = 1$, the inner minimum is omitted. These are finite requirements at each stage. Apply Proposition 3 to $cal(P)_(j - 1)$, with $l_(+) = l^(\( j - 1 \))$, $l_(-) = l^(\( j \))$, order $r_j$ and tolerance $eta_j$. Use the certificates from its construction in Lemma 12, with balls centered in $V$ and radii at most $k_j^(- 1)$. The proposition gives a positive constant $c_j$ and all sufficiently large allowed frequencies. Choose one with $k_j > 2 k_(j - 1)$ when $j > 1$, and also so large that
  $ c_j k_j^(gamma \/ 2) > j . $
  The output certificate then satisfies
  #[#set math.equation(numbering: n => "(5.25)")
   $ \| cal(C)_j \| > j k_j^(1 + gamma \/ 2) . $ <eq:stage-certificate-size>]
  Only after this output has been constructed do we select its own $s_j \, epsilon_j$ by Lemma 15. They constrain subsequent stages, so no current frequency choice depends circularly on its own future persistence radius.
  The increments are summable in every fixed $C^r$ norm: for all large $j$, $r_j gt.eq r$ and their $C^(r_j)$ norms are less than $2^(- j)$. Therefore the pairs converge to one smooth pair $cal(P)_oo = \( A_oo \, rho_oo \)$. Their total $C^1$ movement from the round pair is less than $b sum_(j gt.eq 1) 2^(- j - 1) = b \/ 2$, so the limit remains positive and belongs to $cal(U)$. For each fixed $i$, the same budgets give
  $ lr(bar.v.double cal(P)_oo - cal(P)_i bar.v.double)_(C^(s_i)) lt.eq sum_(j > i) 2^(- \( j - i + 1 \)) epsilon_i = epsilon_i \/ 2 . $
  The limit lies in every selected persistence neighborhood. Hence there are real smooth eigenfunctions $v_i$ for the limiting base operator, with the same certificate disks $cal(C)_i$, and
  #[#set math.equation(numbering: n => "(5.26)")
   $ - L_oo v_i = lambda_i v_i \, #h(2em) k_i^2 \/ 2 < lambda_i < 2 k_i^2 . $ <eq:limiting-eigenvalue-intervals>]
  The frequency separation makes these eigenvalue intervals disjoint and tending to infinity. The functions $v_i$ are nonzero by their normalization, or just by their strict signs.
  Set $G_oo^(- 1) = A_oo \/ rho_oo$ and let
  $ q = frac(rho_oo thin upright(d) mu, upright(d) "vol"_(G_oo)) . $
  This is a smooth positive function, the ratio of two smooth positive base densities. We use the standard warped-product realization of a weighted Laplacian #cite(label("CharalambousLu2015")) Section 4, equation (2), with a circle as the fiber. On the fixed manifold $M = B times S^1$ define
  #[#set math.equation(numbering: n => "(5.27)")
   $ g = G_oo + q^2 upright(d) phi^2 \, $ <eq:circle-metric>]
  where $upright(d) phi^2$ is the standard unit-circle metric. The manifold is smooth, closed and connected, of dimension five, and
  $ upright(d) "vol"_g = q thin upright(d) "vol"_(G_oo) thin upright(d) phi = rho_oo thin upright(d) mu thin upright(d) phi . $
  For a function $f$ pulled back from $B$, the coordinate divergence formula gives
  #[#set math.equation(numbering: n => "(5.28)")
   $ Delta_g f = frac(1, rho_oo mu) partial_a #scale(x: 120%, y: 120%)[\(] rho_oo mu G_oo^(a b) partial_b f #scale(x: 120%, y: 120%)[\)] = rho_oo^(- 1) "div"_mu \( A_oo upright(d) f \) = L_oo f . $ <eq:circle-operator>]
  Here $mu$ in the coordinate expression denotes its positive coordinate density. Thus the pullbacks $u_i$ of $v_i$ are exact real Laplace–Beltrami eigenfunctions with eigenvalues $lambda_i$.
  It remains to convert their certificates into the claimed measure bound. Fix a closed interval $I_0$ of positive length in a circle coordinate chart. All certificate cylinders are in one fixed compact subset of $Omega$: their centers lie in $V subset.double Omega$ and their radii tend uniformly to zero, with the initial frequencies chosen large enough for the same inclusion. On the product of this compact set with $I_0$, coordinate and Riemannian distances have fixed Lipschitz comparison constants. One may see this directly by extending the coordinate functions smoothly with cutoffs to the compact manifold; their gradients are then uniformly bounded in the single fixed metric $g$.
  For one certificate cylinder $C_i^(\( a \))$, let $D_i^(\( a \))$ be one of its transverse disks. The opposite endpoint signs imply that every longitudinal segment through the disk contains a zero of $v_i$. Therefore the subset
  $ cal(Z) \( u_i \) ∩ \( C_i^(\( a \)) times I_0 \) $
  projects onto $D_i^(\( a \)) times I_0$ by coordinate orthogonal projection in the base and the circle coordinate. The Lipschitz constant of every such projection is bounded by one fixed $K$, independent of the disk’s radius and orientation. The defining covering inequality for Hausdorff measure under a Lipschitz map gives
  $ cal(H)_g^4 #scale(x: 120%, y: 120%)[\(] cal(Z) \( u_i \) ∩ \( C_i^(\( a \)) times I_0 \) #scale(x: 120%, y: 120%)[\)] gt.eq K^(- 4) cal(H)_(upright("Euc"))^4 \( D_i^(\( a \)) times I_0 \) = K^(- 4) \| I_0 \| cal(H)_(upright("Euc"))^3 \( D_i^(\( a \)) \) . $
  The closed cylinders lie in disjoint open balls. Their indicated nodal subsets are consequently pairwise disjoint Borel sets, so their Hausdorff measures add. Using (5.25), we obtain one constant $c > 0$ belonging to the final metric such that
  #[#set math.equation(numbering: n => "(5.29)")
   $ cal(H)_g^4 \( cal(Z) \( u_i \) \) gt.eq c \| cal(C)_i \| > c i k_i^(1 + gamma \/ 2) . $ <eq:final-nodal-lower>]
  This argument uses continuity and signs only, without any regularity assumption on the nodal set.
  Finally, (5.26) and $epsilon.alt_0 = gamma \/ 4$ imply
  $ lambda_i^(1 \/ 2 + epsilon.alt_0) lt.eq 2^(1 \/ 2 + epsilon.alt_0) k_i^(1 + gamma \/ 2) . $
  Combining this with (5.29) yields
  $ frac(cal(H)_g^4 \( cal(Z) \( u_i \) \), lambda_i^(1 \/ 2 + epsilon.alt_0)) gt.eq c thin 2^(- 1 \/ 2 - epsilon.alt_0) i arrow.r oo . $
  Both $g$ and $epsilon.alt_0$ are fixed throughout this sequence, which proves Theorem 1. ◻
]

#thm([Corollary 5.6.])[
  #emph[For every integer $n > 5$ there is a smooth closed connected $n$-dimensional Riemannian manifold and a fixed $epsilon.alt_0 > 0$ with the same divergence of nodal measure divided by $lambda^(1 \/ 2 + epsilon.alt_0)$.]
]

#proof[
  Take the product of (5.27) with any fixed smooth closed connected manifold of dimension $n - 5$, and pull back the same eigenfunctions. The product Laplacian preserves their eigenvalues. Multiply each of the projection certificates above by a fixed compact coordinate box of positive $\( n - 5 \)$-volume in the extra factor. The same Lipschitz projection argument, now in dimension $n - 1$, gives a fixed positive multiple of the preceding certificate lower bound. The denominator and its fixed exponent are unchanged, so the ratio still tends to infinity. ◻
]


#bibliography("refs.bib", style: "ieee", title: [References])
