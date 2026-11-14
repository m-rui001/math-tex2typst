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

#align(center)[#text(size: 16pt, weight: "bold")[A Three-Dimensional Counterexample to Integer-Degree Harmonic Dimension Comparison]]
#align(center)[OpenAI]
#align(center)[September 26, 2026]

== 1 Introduction <n:introduction>

Let $\( M^n \, g \)$ be a connected complete smooth Riemannian manifold without boundary.
  For $d gt.eq 0$, write $cal(H)_d \( M \, g \)$ for the real vector space of smooth harmonic functions such that

$ \| u \( x \) \| lt.eq C_u \( 1 + d_g \( o \, x \) \)^d wide \( x in M \) $

with some finite constant $C_u$ depending on $u$. The choice of base point $o$ does not change the space.
  Let $h_d \( M \, g \)$ denote its real dimension. For an integer $k gt.eq 0$,
  $cal(H)_k \( bb(R)^3 \, g_(upright(E)) \)$ consists of harmonic polynomials of degree at most $k$;
  summing their homogeneous dimensions gives

#[#set math.equation(numbering: n => "(1.1)")
 $ h_k \( bb(R)^3 \, g_(upright(E)) \) = sum_(l = 0)^k \( 2 l + 1 \) = \( k + 1 \)^2 . $ <n:euclidean-count>]

The integer-degree comparison problem asks whether nonnegative Ricci curvature forces

$ h_k \( M^n \, g \) lt.eq h_k \( bb(R)^n \, g_(upright(E)) \) wide upright("for every integer ") k gt.eq 1 . $

Our answer in dimension three is negative. We use the normalization

$ "AVR" \( g \) = lim_(R arrow.r oo) frac("vol"_g B_g \( o \, R \), omega_n R^n) \, $

where $omega_n$ is the Euclidean unit-ball volume. A pointed tangent cone at infinity is a pointed
  Gromov–Hausdorff limit of rescalings $\( M \, R_j^(- 2) g \, o \)$ with $R_j arrow.r oo$.

#thm([Theorem 1.1.])[
  #emph[For every $v in \( 4 \/ 9 \, 1 \)$ and $c in \( 1 \, 9 v \/ 4 \)$,
    there is an integer $k_0 \( v \, c \)$ such that for every integer $k gt.eq
    k_0 \( v \, c \)$ there is a complete smooth metric $g_k$ on $bb(R)^3$, Euclidean near the origin,
    with $"Ric"_(g_k) gt.eq 0$, $"AVR" \( g_k \) = v$, and
$ h_k \( bb(R)^3 \, g_k \) gt.eq c \( k + 1 \)^2 > \( k + 1 \)^2 = h_k \( bb(R)^3 \, g_(upright(E)) \) . $

 The Ricci curvature is positive outside a compact set. The metric has uncountably many pairwise nonisometric
   pointed tangent cones at infinity. There are points tending to infinity and planes containing the radial
   direction at those points whose sectional curvature is negative.
   The metric is chosen after $k$ and may depend on it.]
] <n:main>

The excess can occur even when the identity map to Euclidean space has arbitrarily small bi-Lipschitz distortion.

#thm([Corollary 1.2.])[
  #emph[For every $epsilon.alt > 0$ and $1 < c < 9 \/ 4$, all sufficiently large integers $k$ admit metrics with
    the conclusions of Theorem 1 and
$ \( 1 + epsilon.alt \)^(- 2) g_(upright(E)) lt.eq g_k lt.eq \( 1 + epsilon.alt \)^2 g_(upright(E)) wide
  upright("on ") bb(R)^3 . $

 Their asymptotic volume ratio can be prescribed arbitrarily close to $1$.
   In particular, the identity map is globally $\( 1 + epsilon.alt \)$-bi-Lipschitz.]
] <n:near-euclidean>

The range $c < 9 v \/ 4$ comes from the angular average in this construction;
  no optimality or endpoint assertion is made. Both statements concern a family of metrics indexed by the degree,
  rather than an asymptotic harmonic-dimension bound on one fixed manifold.

Yau posed the comparison together with the finite-dimensionality problem for polynomial-growth harmonic
  functions [18,12]. Li and Tam proved the sharp bound at linear growth [12].
  Colding and Minicozzi then proved finite dimensionality at every fixed degree under nonnegative Ricci curvature
  and obtained dimension bounds with the optimal order in the degree [3,4].
  An exact count at a finite integer remains a different question.
  Donnelly’s examples in dimensions at least five violate the Euclidean comparison at a suitable real degree
  between one and two [7,2]. This subquadratic excess does not by itself establish an integer-degree violation.

A separate construction on odd-dimensional Berger sphere links gives an integer-degree counterexample in some even
  ambient dimension at least eight [15] Theorem 1.1 and Section 7.
  That proof works in fixed invariant spaces of round harmonics and tunes exact transfers using simultaneous real
  linear control. The present proof answers the three-dimensional question by a different route.
  Its angular eigenspaces move, so it must control leakage into infinitely many higher modes as well as the
  exchange of the selected low modes. No theorem from the Berger-link construction is used in the proof of Theorem 1.

Additional curvature or asymptotic hypotheses still yield comparison results.
  Cai and Lai prove the Euclidean bound in the locally conformally flat nonnegative-Ricci setting [2].
  Lin, Wang and Xu prove the three-dimensional integer bound under nonnegative sectional curvature and positive
  asymptotic volume ratio [13] Theorem 1.12. For complete manifolds with nonnegative Ricci curvature,
  maximal volume growth, and a unique tangent cone, Huang’s Theorem 1.6 bounds harmonic dimensions above by the
  spectral counting function of the cone link [10]. Xu’s three-circles theorem permits nonunique cones under
  conic-measure hypotheses when the tested exponent avoids the union of their cone-degree spectra [17]
  Theorem 3.2; it is not an exact dimension count. The metrics constructed here have positive asymptotic volume
  ratio and distinct cone limits. They also have negative radial sectional planes at arbitrarily large distances,
  so they do not meet the sectional-curvature hypothesis.

=== Averaging rates by crossing eigenlines <averaging-rates-by-crossing-eigenlines>

For a fixed metric $h$ on $S^2$, an eigenvalue $lambda$ of its nonnegative Laplacian gives the cone frequency

$ d \( lambda \) = frac(- 1 + sqrt(1 + 4 lambda), 2) . $

An eigenfunction with that frequency grows as $r^(d \( lambda \))$ on the cone.
  Our construction does not find one frozen link with too many frequencies below $k$.
  In fact, each limiting link has Gauss curvature greater than one and satisfies the fixed-sphere eigenvalue
  comparison of Lin, Wang and Xu [13] Theorem 1.8. Instead,
  a harmonic function will encounter different frequencies at different radii.

We construct a periodic path $H \( s \)$ of sphere metrics near the round metric,
  all with the same pointwise area form. Its low spectrum is simple except at finitely many isolated linearly
  split double crossings. There are two ways to follow an eigenvalue near such a crossing:
  reorder by size on each side, or continue its smooth eigenline through the equality.
  The latter continuation exchanges two adjacent ordered positions.
  A sequence of these exchanges cycles a long band among the first $p = \( M + 1 \)^2$ positions, where $M =
  floor.l theta.alt k floor.r$. For the prescribed $v \, c$, we take $a =
  sqrt(v)$ and choose $sqrt(c) < theta.alt < 3 a \/ 2$. The value of $p$ is the round-sphere count through degree
  $M$, and $p \/ \( k + 1 \)^2 arrow.r theta.alt^2 > c$.

Over a full cycle of labels, each selected band label visits every position in the band at the same phases.
  Its mean frequency is therefore an average of ordered frequencies,
  even though its instantaneous frequency may exceed $k$. The band begins just above round degree $L =
  floor.l sqrt(k) floor.r$. A direct round-sphere count gives mean degree asymptotic to $2 theta.alt k \/ 3$.
  The radial scaling multiplies this by $a^(- 1)$; since $2 theta.alt \/ \( 3 a \) < 1$,
  a sufficiently small angular distortion leaves every selected mean strictly below $k$.
  The uncycled lower positions have frequencies $O \( sqrt(k) \)$.
  The lower cutoff tends to infinity so that the required crossings between consecutive degree blocks are
  available, while its ratio to $k$ tends to zero.

The angular construction must prescribe the crossings while excluding all unwanted coincidences through position
  $p + 1$. Conformal first variations on a two-dimensional eigenspace provide both trace-free matrix directions.
  Exact-multiplicity charts and a finite pool of variations turn this local fact into an avoidance argument for
  every possible multiplicity stratum. A separate step keeps a prescribed double while splitting all other
  multiplicities: if every double-preserving variation failed to split another eigenspace,
  the two eigenspaces would have common nodal domains, contradicting their distinct eigenvalues.
  For the round sphere, the symmetric-square multiplication property behind these variations appears in work of
  Colin de Verdière and is proved explicitly by Greilhuber and Kepplinger [6,9].
  We also need exchanges between consecutive round degree blocks;
  an even perturbation separates parities in opposite orders on the two sides of a chosen perturbation.
  The angular section proves that these ingredients produce the required cyclic program and a uniform gap above
  position $p$.

=== Exact harmonic continuation along the program <exact-harmonic-continuation-along-the-program>

Put $t = log r$ and let the phase move at speed $eta \( t \) = t^(- 3 \/ 4)$.
  Small independent controls are placed near the crossings. The polar metric has the form

$ g = d r^2 + f \( r \)^2 H_(*) \( log r \) \, wide f \( r \) \/ r arrow.r a = sqrt(v) . $

The radial construction is uniform over all control sequences.
  Its concave tail supplies radial Ricci curvature of order $eta^2 \/ r^2$.
  The mixed Ricci block is of order $eta \/ r^2$, but its loss in the Schur complement is quadratic because the
  tangential block of $r^2 "Ric"$ has a fixed positive lower bound.
  The tail coefficient is chosen to absorb that loss before the radial start is moved outward.
  Moser’s volume-form method supplies smooth coordinates with fixed area form [14];
  slow-link constructions with a common volume form also occur in Colding–Naber [5].
  The curvature argument here checks the particular controlled path and its uniform parameter bounds.

Following a reference eigenline is not yet following an entire harmonic function.
  The crossing controls also perturb the instantaneous eigenspaces.
  To impose regularity at the center, we use the exact inward map that sends data on one sphere to the trace of
  its harmonic extension across the whole enclosed ball on the next inner sphere.
  These maps preserve constants and the spherical mean, are positive, and contract $L^2$.
  Freezing the geometry on a long terminal part of the ball gives two estimates with different purposes:
  an operator estimate separates the first $p$ modes from the tail,
  while a sharper estimate on the finite moving frame detects the small signed effect of each crossing control.

The outer spectral gap produces a graph over the first $p$ angular modes that is invariant under the exact inward
  maps. Its high-mode component depends on future controls.
  The induced outward maps on the low coordinates are finite matrices,
  and a crossing control changes the relevant off-diagonal entry with a fixed nonzero first-order sign.
  To make an invariant line follow a continued eigenbranch,
  we solve a scalar recurrence forward on its contracting side and backward on its other side.
  Their discrepancy at the crossing is a positive-weight sum.
  The two endpoint choices of the control give opposite signs.
  Finite-dimensional fixed points followed by a compact diagonal limit select all crossing controls simultaneously.

For the resulting single metric $g_k$, the matched lines give compatible boundary traces on nested balls.
  Whole-ball harmonic extensions then define $p$ independent smooth harmonic functions on all of $bb(R)^3$.
  Their logarithmic growth is the integral of the selected cone frequencies,
  up to errors smaller than the logarithmic radius. Periodic averaging gives the strict sub-$k$ exponent.
  The contraction of inward maps controls every intermediate sphere,
  and uniform interior elliptic estimates convert the spherical $L^2$ bounds to the pointwise condition defining
  $cal(H)_k$. This last passage is needed for the integer comparison:
  the strict average bound at the sampled radii alone would not suffice.

All functions and Hilbert spaces below are real. Eigenvalues are numbered from $1$,
  with the constant eigenfunction at position $1$ and eigenvalue $0$.
  The integer $k$, the finite angular program, and $p$ are fixed before the tail coefficient and the radial start
  are chosen. Every error estimate in the transfer and matching argument is for this fixed finite program;
  no uniformity as $k arrow.r oo$ is asserted.

Section 2 constructs the isolated crossings, and Section 3 assembles their cycle and proves the mean-frequency
  margin. Section 4 realizes the controlled links by complete Ricci-nonnegative metrics.
  Section 5 reduces whole-ball continuation to exact finite matrices.
  Section 6 chooses the crossing controls, and Section 7 constructs the entire functions and proves their growth
  at every point.

== 2 Isolating and prescribing eigenvalue crossings <n:sec-angular>

The angular construction prepares a finite family of modes whose average frequencies are smaller than $k$.
  It does this by moving eigenlines through different positions in the ordered spectrum. There are two steps.
  First, we construct a metric with an isolated double eigenvalue at each prescribed pair of consecutive positions
  in a long spectral band. We then join short paths through these doubles into one closed path.
  A continued eigenline exchanges its ordered position at a double,
  so the return permutation of the closed path can be made into a cycle on the whole band.
  The frequency estimate will follow by averaging the ordered positions visited by each line.
  The first lemmas isolate doubles and preserve them while other multiplicities split.
  Proposition 8 then packages the closed path, its continued eigenlines,
  and the strict mean-frequency margin used in the radial construction.

All metrics in this section are smooth metrics on $S^2$. Write $g_0$ for the unit round metric and

$ d mu = frac(d "vol"_(g_0), 4 pi) . $

We use the nonpositive convention for the Laplacian. The eigenvalues of $- Delta_h$,
  repeated according to multiplicity, are numbered from $1$; in particular $lambda_1 \( h \) = 0$.
  For the round metric, put

#[#set math.equation(numbering: n => "(2.1)")
 $ B_l = \( l + 1 \)^2 \, wide B_(- 1) = 0 \, wide lambda_(B_(l - 1) + 1) \( g_0 \) = dots.h.c =
   lambda_(B_l) \( g_0 \) = l \( l + 1 \) . $ <n:eq-round-blocks>]

The corresponding real eigenspace is denoted by $cal(Y)_l$.
  It consists of the restrictions of degree-$l$ homogeneous harmonic polynomials and has dimension $2 l + 1$.

Fix a number $theta.alt > 1$, independently of the large integer $k$, and set

#[#set math.equation(numbering: n => "(2.2)")
 $ M = floor.l theta.alt k floor.r \, wide L = floor.l sqrt(k) floor.r \, wide p = B_M = \( M + 1 \)^2 \,\
I = { B_L + 1 \, dots.h \, p } \, wide N = \| I \| = p - B_L . $ <n:eq-band>]

We will cycle the whole round blocks of degrees $L + 1 \, dots.h \, M$, leaving the lower positions fixed.
  The lower cutoff tends to infinity, which permits crossings between consecutive degree blocks,
  but is $o \( k \)$, so leaving these positions fixed does not affect the leading band average.
  The lemmas below are stated for general finite cutoffs before being applied to this band.

===== 2.1 The Euclidean comparison space. <the-euclidean-comparison-space.>

The preceding dimensions give (1.1). For completeness, the polynomial characterization follows from the mean-value
  property. A smooth radial averaging kernel at scale $R$ reproduces a Euclidean harmonic function.
  Moving any $k + 1$ derivatives onto the kernel bounds that derivative at a fixed point by $O \( R^(- 1) \)$
  under the degree-$k$ growth assumption. Letting $R$ tend to infinity makes all such derivatives zero.
  Each homogeneous part of the resulting polynomial is harmonic.
  In three variables the dimension in degree $l$ is $binom(l + 2, 2) - binom(l, 2) = 2 l + 1$,
  with the second term zero for $l < 2$: the polynomial Laplacian onto degree $l -
  2$ is surjective because its adjoint in the monomial inner product $chevron.l x^alpha \, x^alpha chevron.r =
  alpha !$ is multiplication by $\| x \|^2$, which is injective.

=== 2.1 A fixed angular measure and the splitting formula <a-fixed-angular-measure-and-the-splitting-formula>

For a smooth real function $w$, define

#[#set math.equation(numbering: n => "(2.3)")
 $ A \( w \) = integral_(S^2) e^(2 w) thin d mu \, wide rho_w = frac(e^(2 w), A \( w \)) \, wide h^0 \( w \) =
   rho_w g_0 . $ <n:eq-conformal-family>]

The metric $h^0 \( w \)$ has area $4 pi$, and its normalized area form is $d mu_w = rho_w thin d mu$.
  We work in a small convex neighborhood $cal(U)$ of $0$ among smooth functions, with smallness measured in $C^2$.
  Given any prescribed $0 < kappa_(*) < 1$, it can be chosen so that $K_(h^0 \( w \)) >
  kappa_(*)$ and so that the pointwise comparison of $h^0 \( w \)$ with $g_0$ is as close to equality as needed
  below. Every path and perturbation used in the construction will belong to a finite-dimensional smooth family
  contained in $cal(U)$.

The radial argument will use one Hilbert space $L^2 \( d mu \)$,
  so we also fix coordinates in which the angular area form is independent of $w$.
  Here is a concrete version of Moser’s volume-form construction [14] Section 4, Theorem 2.
  For $0 lt.eq tau lt.eq 1$, set

$ rho_(tau \, w) = 1 + tau \( rho_w - 1 \) . $

This is positive and has integral $1$. Solve, with mean zero,

$ Delta_0 phi.alt_(tau \, w) = - partial_tau rho_(tau \, w) \, wide X_(tau \, w) =
  rho_(tau \, w)^(- 1) nabla_0 phi.alt_(tau \, w) . $

The right side of the Poisson equation has mean zero, and hence the solution exists uniquely.
  If $Phi_(tau \, w)$ is the flow of $X_(tau \, w)$, starting at the identity, then

$ frac(d, d tau) Phi_(tau \, w)^(*) \( rho_(tau \, w) thin d mu \) =
  Phi_(tau \, w)^(*)
  [#scale(x: 120%, y: 120%)[\(] partial_tau rho_(tau \, w) + "div"_0 \( rho_(tau \, w) X_(tau \, w) \)
  #scale(x: 120%, y: 120%)[\)] d mu] = 0 . $

Put $Phi_w = Phi_(1 \, w)$ and

#[#set math.equation(numbering: n => "(2.4)")
 $ h \( w \) = Phi_w^(*) h^0 \( w \) . wide upright("Then") wide d "vol"_(h \( w \)) = d "vol"_(g_0) =
   4 pi thin d mu . $ <n:eq-fixed-area-gauge>]

The Poisson solution and flow depend smoothly on every additional smooth finite parameter.
  The construction depends only on $w$, and $Phi_0 = "id"$.
  Thus a closed path of $w$’s gives a closed path of $h \( w \)$’s.
  On each compact finite parameter family the metrics in this gauge have bounded smooth geometry.
  Their spectra are those of $h^0 \( w \)$, and their curvature remains greater than $kappa_(*)$.
  If $w$ is antipodally even, the Poisson solution is even,
  its vector field is equivariant under the antipodal map, and its flow commutes with that map.
  Both forms of the metric then preserve the even and odd function spaces.

The gauge also preserves uniform closeness to the round metric.
  To see this without a bound on the higher derivatives of $w$, fix $0 < alpha < 1$ and put $sigma =
  parallel w parallel_(C^2)$. For small $sigma$, normalization gives

$ parallel rho_w - 1 parallel_(C^1) + parallel rho_w - 1 parallel_(C^(0 \, alpha)) lt.eq C sigma . $

The mean-zero Poisson solution above is independent of $tau$, since its right side is $- \( rho_w - 1 \)$.
  The elliptic estimate on the fixed round sphere bounds its $C^(2 \, alpha)$ norm by $C sigma$,
  and hence $parallel X_(tau \, w) parallel_(C^1) lt.eq C sigma$, uniformly for $0 lt.eq tau lt.eq 1$.
  The variational equation for the flow gives

$ e^(- C sigma) g_0 lt.eq Phi_w^(*) g_0 lt.eq e^(C sigma) g_0 . $

Multiplication by $rho_w compose Phi_w$ gives the same bounds for $h \( w \)$, after increasing $C$.
  Consequently, for every $0 < delta < 1$, a sufficiently small convex $C^2$ neighborhood $cal(U)$ ensures

#[#set math.equation(numbering: n => "(2.5)")
 $ \( 1 - delta \) g_0 lt.eq h \( w \) lt.eq \( 1 + delta \) g_0 wide \( w in cal(U) \) . $ <n:eq-gauge-closeness>]

This choice is uniform over all finite parameter families contained in $cal(U)$.

The following variation formula is the local input for constructing and avoiding coincidences.
  Its round-sphere full-block version is part of the classical conformal spectral transversality theory of Colin
  de Verdière and Greilhuber–Kepplinger [6,9]. We give the two-dimensional and parity-restricted statements that
  will be used here.

#thm([Lemma 2.1.])[
  (Two independent splitting directions).  #emph[Let $lambda > 0$ be an eigenvalue of $h^0 \( w \)$, and let $u \,
    v$ be an orthonormal pair in its real eigenspace, using $L^2 \( d mu_w \)$.
    The traceless compression to $"span" { u \, v }$ of the first variation of the Laplacian has rank two as the
    smooth conformal direction varies. If $w$ is antipodally even and $u \, v$ have the same antipodal parity,
    the conclusion still holds when only even conformal directions are allowed.
    The same splitting matrices apply after the fixed-area coordinate change (2.4).]
] <n:lem-two-directions>

#proof[
  In dimension two the normalized Dirichlet form of $h^0 \( w \)$ is
  $ q \( f \, g \) = integral_(S^2) chevron.l nabla_0 f \, nabla_0 g chevron.r thin d mu \, $
  independent of $w$. Its mass form is $m_w \( f \, g \) = integral f g thin d mu_w$. Differentiating the latter gives
  $ dot(m)_w \( f \, g \) = 2 integral_(S^2) f g (dot(w) - integral_(S^2) dot(w) thin d mu_w) d mu_w . $
  For an $m_w$-orthonormal basis $u_1 \, dots.h \, u_r$ of a repeated positive eigenspace,
    differentiation of the generalized eigenvalue equation $q = lambda m_w$ therefore gives the symmetric cluster matrix
  #[#set math.equation(numbering: n => "(2.6)")
   $ dot(M)_(i j) = - 2 lambda integral_(S^2) u_i u_j (dot(w) - integral_(S^2) dot(w) thin d mu_w) d mu_w .
     $ <n:eq-conformal-variation>]
  Terms arising from a change of orthonormal frame cancel at a scalar cluster matrix.
    The mean term in (2.6) is scalar, so the two traceless entries on the pair $u \, v$ are represented,
    up to fixed nonzero factors, by
  #[#set math.equation(numbering: n => "(2.7)")
   $ U_1 = u^2 - v^2 \, wide U_2 = 2 u v . $ <n:eq-product-pair>]
  Both have mean zero for $d mu_w$.
  The functions $U_1 \, U_2$ are linearly independent. Indeed,
    a nonzero linear combination of them is a nonzero traceless quadratic form in $\( u \, v \)$;
    its zero set in $bb(R)^2$ is the union of two lines. If that quadratic form vanished at every point of the
    sphere, choose a point where $\( u \, v \) eq.not \( 0 \, 0 \)$ and a connected neighborhood on which this
    remains true. Continuity then puts $\( u \, v \)$ in just one of the two lines on a smaller neighborhood.
    A fixed nonzero linear combination of $u \, v$ would vanish there.
    Unique continuation for smooth Laplace eigenfunctions on the connected sphere forces it to vanish everywhere
    [1] §5, Remark 3, contradicting orthonormality. Independence of $U_1 \,
    U_2$ makes their Gram matrix for $d mu_w$ positive definite.
    Testing in the directions $U_1 \, U_2$, for example, proves rank two.
    When $u \, v$ have the same parity, both functions in (2.7) are even,
    so the same tests are available in the even family.
  Finally, conjugating the Laplacian by the parameter-dependent pullback adds to its variation a commutator with
    the Laplacian. The compression of such a commutator to an eigenspace on which the Laplacian is $lambda
    I$ is zero. Thus the coordinate change does not change the splitting matrix.
    The zero eigenvalue requires no splitting argument: it is simple because $S^2$ is connected. ◻
]

=== 2.2 Avoiding unwanted multiplicities <avoiding-unwanted-multiplicities>

We say that a metric is #emph[simple through position $q$] when

$ lambda_1 < lambda_2 < dots.h.c < lambda_q < lambda_(q + 1) . $

The final inequality is part of the definition. At a metric that fails this condition,
  the repeated cluster meeting the cutoff may continue past $q + 1$;
  the argument below always includes that entire cluster. For an antipodally invariant metric we use the same
  convention for the ordered even and odd lists separately, with any prescribed finite cutoff in each list.

#thm([Lemma 2.2.])[
  (Finite-cutoff avoidance).  #emph[Parameters whose metrics are simple through any fixed position are dense in
    $cal(U)$. Any two such parameters can be joined inside $cal(U)$ by a smooth path that is simple through that
    position and is constant near its endpoints. In the even parameter family,
    the analogous statements hold for simplicity through prescribed finite cutoffs within each parity.
    Cross-parity coincidences are allowed in this last statement.]
] <n:lem-avoidance>

#proof[
  We give the finite-dimensional reduction, including the treatment of clusters of multiplicity greater than two.
    The use of spectral projections and local cluster matrices is the usual perturbation construction [11]
    III, §6.4, Theorem 6.17; IV, §3.4, Theorem 3.16. In the fixed-area gauge the operators have common domain
    $H^2 \( S^2 \)$ in $L^2 \( mu \)$ and depend smoothly, as maps $H^2 arrow.r L^2$, on the finite parameters.
    On a contour in the resolvent set, elliptic estimates give bounded inverses $L^2 arrow.r H^2$;
    the inverse-difference identity and a Neumann series give smooth parameter dependence.
    Integrating the resolvents around the contour therefore gives a smooth finite-rank projection.
    This argument needs smooth parameter dependence, rather than analytic eigenvalue branches.
    The avoidance step is a finite-dimensional general-position argument of the type used in spectral genericity [16].
  Start with a smooth preliminary path $w_0 \( t \)$, $0 lt.eq t lt.eq 1$,
    joining the two parameters and constant near them. Convexity of $cal(U)$ supplies such a path.
    The endpoints have positive gaps through the cutoff, so a small initial and final time interval remains simple
    under all sufficiently small perturbations of the path. Choose a smooth cutoff $chi \( t \)$ that vanishes
    near $0 \, 1$ and equals $1$ outside these two simple intervals.
  Fix the cutoff $q$. Uniform comparison with the round mass form bounds $lambda_(q + 1) \( h^0 \( w \) \)$ above
    throughout a small neighborhood of the path. Choose a larger number $Lambda$.
    Every repeated cluster that can affect simplicity through $q$ has eigenvalue below $Lambda$,
    including all members of a cluster that straddles the cutoff.
    The reverse form comparison bounds the number of eigenvalues below $Lambda$ uniformly. Consider all triples
  $ \( t \, u \, v \) \, wide - Delta_(h^0 \( w_0 \( t \) \)) u = lambda u \, quad -
    Delta_(h^0 \( w_0 \( t \) \)) v = lambda v \, quad 0 < lambda lt.eq Lambda \, $
  where $u \, v$ are real and orthonormal for $d mu_(w_0 \( t \))$.
    This set of normalized pairs is compact in the smooth topology.
    To see the needed compactness directly, write the eigenvalue equation as $- Delta_0 u =
    lambda rho_(w_0 \( t \)) u$. The coefficients have uniform smooth bounds along the compact path,
    the mass norms are uniformly equivalent, and $lambda$ is bounded.
    Elliptic estimates followed by Sobolev embedding give bounds for every spatial derivative.
    A diagonal subsequence then converges smoothly, and the equation and orthonormality pass to the limit.
    The first positive eigenvalue is uniformly bounded away from zero,
    so the limit is again a positive eigenvalue pair. In the even construction take only pairs of the same
    specified parity; this is a closed condition. If there is no such pair,
    the preliminary path is already simple through the cutoff and no perturbation is needed.
  At each such pair, Lemma 3 supplies two smooth directions for which the two traceless entries have an invertible
    derivative. This property is open in $\( t \, u \, v \)$.
    A finite cover of the compact set of pairs therefore supplies a single finite list of directions $xi_1 \,
    dots.h \, xi_D$ whose span $E$ has rank two on every one of these pairs.
    In the parity version all $xi_j$ are even. The same rank assertion holds for relevant eigenfunction pairs at
    all parameters in a sufficiently small $E$-neighborhood of the path.
    Otherwise there would be a sequence of counterexamples with parameters tending to the path.
    The same elliptic compactness would give a limiting pair on the path,
    where one of the selected two-by-two determinants is nonzero, a contradiction.
  Use this fixed pool in the finite family
  #[#set math.equation(numbering: n => "(2.8)")
   $ w \( t \, z \) = w_0 \( t \) + chi \( t \) sum_(j = 1)^D z_j xi_j \, wide
     z = \( z_1 \, dots.h \, z_D \) . $ <n:eq-path-perturbation>]
  For small $z$ it stays in $cal(U)$; the endpoint intervals remain simple.
    At every possible bad point outside those intervals, $chi = 1$,
    and the two traceless entries have rank two in the $z$ variables.
  We now describe precisely the sets to be avoided. At a bad point $\( t_(*) \, z_(*) \)$, let $r \, dots.h \,
    s$ be the #emph[entire] consecutive block occupied by one repeated eigenvalue,
    with strict spectral gaps immediately outside that block.
    This includes $s > q + 1$ if the cutoff meets a larger cluster.
    A contour enclosing this eigenvalue and no other spectrum gives, in a neighborhood of $\( t_(*) \, z_(*) \)$,
    a smooth Riesz projection of rank $m = s - r + 1$. Projecting a basis at the center and orthonormalizing gives
    a smooth real frame; elliptic regularity makes it smooth in the spatial variables as well.
    In this frame the operator on the cluster is a smooth symmetric matrix $M \( t \, z \)$.
    Choose the first two frame vectors at the center to be any orthonormal pair in the repeated eigenspace and set
  #[#set math.equation(numbering: n => "(2.9)")
   $ F \( t \, z \) = #scale(x: 120%, y: 120%)[\(] M_11 \( t \, z \) - M_22 \( t \, z \) \,
     thin 2 M_12 \( t \, z \) #scale(x: 120%, y: 120%)[\)] . $ <n:eq-chart-equations>]
  At the center the derivative of $F$ in $z$ has rank two, by the choice of $E$ and (2.6).
    Shrinking the neighborhood keeps this rank. The implicit-function theorem makes $F^(- 1) \( 0 \)$ there a
    smooth codimension-two submanifold of time times parameter space.
  If at a point in this neighborhood the same block $r \, dots.h \, s$ is still entirely equal,
    then $M$ is scalar and $F = 0$. This is the only containment asserted for this chart.
    When an $m$-fold block partly splits but leaves a smaller repeated block,
    the smaller block has its own chart centered at that point.
    Thus the two equations in (2.9) handle every $m gt.eq 2$:
    they contain the locus of an exact $m$-fold block without purporting to describe all partial repetitions of
    the larger Riesz cluster.
  For each fixed pair of indices $r \, s$, take the stratum on which $r \, dots.h \,
    s$ is the entire repeated block, with strict gaps outside it.
    This stratum, as a subspace of the second-countable space $\[ 0 \, 1 \] times bb(R)^D$,
    has a countable subcover by neighborhoods centered on that same stratum.
    Every point of the stratum in one of these neighborhoods lies in that chart’s zero set,
    because the same block is entirely equal there. Taking the union over the countably many possible pairs $r \,
    s$ covers all bad points by countably many codimension-two zero sets.
    Each zero set projects to a null set in $bb(R)^D$. For example,
    in a local implicit-function chart two coordinates of $z$ are smooth functions of $t$ and the remaining $D -
    2$ coordinates. Its projection is locally a smooth, hence locally Lipschitz,
    image of a space of dimension $D - 1$ in $bb(R)^D$, and has $D$-dimensional Lebesgue measure zero.
    A countable union still has measure zero. There are therefore arbitrarily small choices of $z$ whose path
    meets none of the bad sets. Formula (2.8) fixes the endpoints.
  The endpoint density assertion is the same argument without the time variable.
    Begin at one parameter, choose the finite pool for its normalized low-eigenvalue pairs,
    and keep its rank in a small neighborhood. Each exact-block zero set then has codimension two in the finite
    parameter space itself, so the union of the bad sets is null and its complement is dense.
    In the even family, perform all of these constructions separately for the two parity lists with the common
    finite pool of even directions. The union of their bad sets is still countable and null.
    This proves both versions. ◻
]

=== 2.3 Keeping one double while separating the rest <keeping-one-double-while-separating-the-rest>

Avoidance supplies simple paths, but we also need deliberately chosen doubles.
  The next lemma allows one isolated double to remain while other coincidences are removed.
  Its proof uses only a nonscalar variation of each unwanted cluster within the two linearized constraints for the
  chosen double. We do not need a description of the full multiplicity locus of that unwanted cluster.

#thm([Lemma 2.3.])[
  (Retaining an isolated double).  #emph[Suppose that $h^0 \( w_(*) \)$ has an isolated eigenvalue of exact
    multiplicity two at positions $i \, i + 1$. For any $q gt.eq i +
    1$ and any neighborhood of $w_(*)$ in $cal(U)$, there is a parameter in that neighborhood for which the same
    positions are equal and all other inequalities through position $q$, including the gap after $q$, are strict.
    The perturbations here are unrestricted conformal perturbations, even when $w_(*)$ was obtained in the even family.]
] <n:lem-retained-double>

#proof[
  Let $u \, v$ be an orthonormal basis for the chosen double at the current parameter, and put $U_1 = u^2 - v^2$,
    $U_2 = 2 u v$. The linearized constraints for keeping its cluster matrix scalar have kernel
  #[#set math.equation(numbering: n => "(2.10)")
   $ cal(K) = {xi in C^oo \( S^2 \; bb(R) \) : integral U_1 xi thin d mu_w = integral U_2 xi thin d mu_w =
     0} . $ <n:eq-double-kernel>]
  This has codimension two in the full space of smooth conformal directions, by Lemma 3.
    We first prove that, for any different repeated positive eigenspace,
    some direction in $cal(K)$ has a nonscalar compression to that eigenspace.
  Suppose instead that every $xi in cal(K)$ had scalar compression on such an eigenspace,
    of eigenvalue $mu_(*) > 0$. Choose an orthonormal pair $a \, b$ in it.
    By (2.6), the two independent functionals represented by
  $ A_1 = a^2 - b^2 \, wide A_2 = 2 a b $
  would both vanish on $cal(K)$. A linear functional that vanishes on the kernel of the surjection $xi
    mapsto \( integral U_1 xi thin d mu_w \, integral U_2 xi thin d mu_w \)$ is a linear combination of those two
    component functionals. Since the two $A$-functionals are themselves independent,
    their span must equal the span of the two $U$-functionals.
    Equality of the functionals on every smooth $xi$, and positivity of $rho_w$, then gives the pointwise identity
  #[#set math.equation(numbering: n => "(2.11)")
   $ Q \( a \, b \) = T Q \( u \, v \) \, wide Q \( x \, y \) = \( x^2 - y^2 \, thin 2 x y \) \,
     $ <n:eq-quadratic-relation>]
  for a constant invertible real $2 times 2$ matrix $T$. There is no undetermined additive constant here:
    each of the four product functions has mean zero. This argument took place in the full smooth tangent space
    before any finite-dimensional restriction.
  Identity (2.11) forces an equality of nodal sets. In fact $a =
    0$ is equivalent to $Q \( a \, b \) in { \( - t \, 0 \) : t gt.eq 0 }$.
    The inverse image of this closed ray under $T$ is another closed ray through the origin.
    Identifying $bb(R)^2$ with $bb(C)$, the map $Q$ is the squaring map,
    so the inverse image under $Q$ of a closed ray is one unoriented line.
    There is consequently a nonzero pair $\( c \, d \)$ such that
  #[#set math.equation(numbering: n => "(2.12)")
   $ { a = 0 } = { c u + d v = 0 } . $ <n:eq-common-nodal-set>]
  The assertion includes points where both entries of either pair vanish, because the rays include the origin.
  Here is why (2.12) is impossible for distinct eigenvalues.
    Write $f = c u + d v$, a nonzero eigenfunction for the chosen eigenvalue $lambda_(*)$,
    and take a connected component $Omega$ of the common nonzero set.
    Change the signs so that both $a$ and $f$ are positive on $Omega$.
    Each restriction belongs to $H_0^1 \( Omega \)$, without any regularity assumption on the nodal boundary.
    For example,
  $ f_epsilon = \( f - epsilon \)_(+) $
  has compact support in $Omega$: its support stays away from the boundary, where $f = 0$.
    As $epsilon arrow.b 0$, these truncations converge to $f$ in $H^1 \( Omega \)$,
    by dominated convergence for the functions and their gradients.
    Each truncation can be approximated in $H^1$ by smooth functions compactly supported in $Omega$.
    The same reasoning applies to $a$. Their weak eigenvalue equations may therefore be tested against one another
    on $Omega$. Symmetry of the Dirichlet form gives
  $ \( mu_(*) - lambda_(*) \) integral_Omega a f thin d mu_w = 0 . $
  The integral is positive. The two eigenvalues would be equal,
    contrary to the choice of a different spectral cluster. This proves the existence of a nonscalar direction $xi
    in cal(K)$.
  We now realize that tangent direction while keeping the chosen double exactly.
    Pick two smooth directions $zeta_1 \, zeta_2$ on which the derivative of its two traceless entries is
    invertible. In the three-parameter family
  $ w \( t \, x_1 \, x_2 \) = w + t xi + x_1 zeta_1 + x_2 zeta_2 $
  form the smooth $2 times 2$ Riesz cluster matrix $M_(upright(d))$ of the chosen double and its two constraints
    $F_(upright(d)) = \( M_(upright(d) \, 11) - M_(upright(d) \, 22) \, 2 M_(upright(d) \, 12) \)$.
    They vanish exactly when that cluster is scalar. The derivative in $\( x_1 \, x_2 \)$ is invertible,
    so the finite-dimensional implicit-function theorem gives smooth $x_1 \( t \) \,
    x_2 \( t \)$ with $F_(upright(d)) = 0$. Because $xi in cal(K)$, their derivatives at $0$ are zero.
    The resulting curve has tangent $xi$. On the other repeated cluster its matrix is therefore
  $ mu_(*) I + t D + o \( t \) $
  with $D$ nonscalar. For a sufficiently small nonzero $t$,
    the distinct eigenvalues of $D$ separate that cluster into at least two smaller groups.
    The chosen cluster remains a double.
  Only finitely many repetitions must be removed. Initially extend the list past $q +
    1$ to the last member $q'$ of the cluster containing $lambda_(q + 1)$. There is a strict gap after $q'$.
    At each step take the curve parameter small enough to preserve that gap, the isolation of the chosen double,
    and every strict gap already obtained among these $q'$ positions.
    If the multiplicities of the current clusters are $m_1 \, dots.h \, m_r$,
    the integer $sum_j binom(m_j, 2)$ strictly decreases whenever an unwanted cluster is split,
    while the contribution of the chosen double stays equal to $1$.
    Thus finitely many steps separate every other cluster. The steps may be chosen with arbitrarily small total
    size, and the isolation gaps keep the chosen double at positions $i \, i + 1$.
    The claimed neighborhood and cutoff conclusions follow. ◻
]

=== 2.4 Pole-regular modes of a rotational sphere <pole-regular-modes-of-a-rotational-sphere>

The cross-block construction will use the lowest mode in a fixed azimuthal sector and a specified position in the
  axisymmetric spectrum. We record their simplicity and parity directly, including the pole conditions.

#thm([Lemma 2.4.])[
  (Sector simplicity and reflection parity).  #emph[Let $zeta \( theta \) >
    0$ be smooth as an axisymmetric function on $S^2$, and suppose $zeta \( pi - theta \) = zeta \( theta \)$.
    In the metric $zeta^2 g_0$, fix a nonnegative integer azimuthal number $m$ and one azimuthal factor (the
    constant factor if $m = 0$). Every eigenvalue of the meridional profile problem is simple.
    Its lowest profile can be chosen strictly positive on $\( 0 \, pi \)$ and is even under equatorial reflection.
    Along a smooth reflection-symmetric deformation, every fixed position in the $m =
    0$ list retains its reflection parity. In particular the position occupied at round by degree $l$ retains
    parity $\( - 1 \)^l$.]
] <n:lem-pole-modes>

#proof[
  The separated equation for a profile $v$ is
  $ - \( sin theta thin v' \)' + frac(m^2, sin theta) v = lambda zeta^2 sin theta thin v . $
  Its form domain is the closure of smooth sphere sector profiles in the energy-plus-mass norm.
    Compact spectral theory on the smooth compact sphere, restricted to this closed sector,
    supplies its eigenfunctions and the variational minimum. Their profiles are smooth at the poles:
    for $m gt.eq 1$ they have the form $t^m a \( t^2 \)$ in polar distance $t$, and for $m =
    0$ they are smooth even functions of $t$. For two profiles $u \, v$ at the same eigenvalue,
    the equation makes $W = sin theta \( u v' - u' v \)$ constant.
    The stated pole behavior makes $W arrow.r 0$ at a pole: for $m gt.eq 1$, $u \, v =
    O \( t^m \)$ and their derivatives are $O \( t^(m - 1) \)$; for $m = 0$,
    the functions are bounded and their derivatives are $O \( t \)$. Thus $W = 0$.
    At any interior point where $u$ is nonzero, $v$ and a scalar multiple of $u$ have equal value and derivative.
    Interior ODE uniqueness makes them equal everywhere.
  Replacing a minimizing real profile by its absolute value preserves the form domain and its energy and mass.
    The resulting nonnegative minimizer satisfies the weak equation and is smooth in the open interval.
    An interior zero would be a minimum with zero derivative, so ODE uniqueness would force the profile to vanish.
    The ground profile is consequently positive. Reflection preserves the equation and pole conditions.
    Simplicity and positivity force the mass-normalized ground profile to be reflection even.
    With its azimuthal factor its antipodal parity is $\( - 1 \)^m$.
  For $m = 0$, simplicity holds at every position by the same Wronskian argument.
    Min–max gives continuous ordered eigenvalues along a smooth deformation,
    and a local simple spectral projection gives a continuous unit eigenfunction.
    Reflection acts on its line by $+ 1$ or $- 1$; this sign is continuous and hence constant.
    At round it is the sign of the corresponding Legendre polynomial, $\( - 1 \)^l$.
    No nodal count for a singular interval problem is required. ◻
]

=== 2.5 An isolated double at every adjacent band position <an-isolated-double-at-every-adjacent-band-position>

Recall the band $I$ in (2.2), consisting of the whole round blocks of degrees $L + 1 \, dots.h \, M$.
  An adjacent pair in it either lies inside one round block or straddles the boundary of two consecutive blocks.
  The first case uses full control of a round block’s splitting matrix.
  The second uses even metrics to force one parity value past a value of the other parity.

#thm([Lemma 2.5.])[
  (Adjacent doubles).  #emph[Fix $theta.alt > 1$. For every prescribed sufficiently small neighborhood $cal(U)$ as
    above, every sufficiently large integer $k$, and every $i$ with $B_L + 1 lt.eq i < p$,
    there is $w in cal(U)$ for which the only failure of simplicity through position $p +
    1$ is $lambda_i \( h \( w \) \) = lambda_(i + 1) \( h \( w \) \)$. This eigenvalue has exact multiplicity two.
    In particular $lambda_p \( h \( w \) \) < lambda_(p + 1) \( h \( w \) \)$.]
] <n:lem-adjacent-doubles>

#proof[
  #emph[Pairs inside one round block.] Suppose that $i \, i + 1$ belong to the round degree-$l$ block.
    Multiplication of harmonic functions defines
  #[#set math.equation(numbering: n => "(2.13)")
   $ "Sym"^2 cal(Y)_l arrow.r xor.big_(j = 0)^l cal(Y)_(2 j) \, wide u ⊙ v mapsto u v . $ <n:eq-symmetric-square>]
  The target contains the products because a homogeneous polynomial of degree $2 l$ decomposes, on the sphere,
    into harmonic components of degrees $2 l \, 2 l - 2 \, dots.h \, 0$. The map is an isomorphism.
    This is the round-sphere product-space fact in Greilhuber–Kepplinger [9] Proposition 4.6;
    the following argument records the particular algebra that we need.
  Its image is invariant under rotations, hence under the rotation Casimir $Delta_0$. It contains
  $ F_l \( z \) = \( 1 - z^2 \)^l = #scale(x: 120%, y: 120%)[\(] "Re" \( \( x + upright(i) y \)^l \)
    #scale(x: 120%, y: 120%)[\)]^2 + #scale(x: 120%, y: 120%)[\(] "Im" \( \( x + upright(i) y \)^l \)
    #scale(x: 120%, y: 120%)[\)]^2 quad upright("on ") S^2 . $
  For functions of $z$, $Delta_0 = \( 1 - z^2 \) partial_z^2 - 2 z partial_z$, and direct differentiation gives
  #[#set math.equation(numbering: n => "(2.14)")
   $ #scale(x: 120%, y: 120%)[\(] Delta_0 + 2 l \( 2 l + 1 \) #scale(x: 120%, y: 120%)[\)] F_l =
     4 l^2 F_(l - 1) . $ <n:eq-casimir-recursion>]
  Expand $F_l = sum_(j = 0)^l c_(l j) P_(2 j) \( z \)$ in Legendre polynomials.
    Its top coefficient is nonzero by polynomial degree, and for $j < l$, (2.14) gives
  $ c_(l j) = frac(4 l^2, 2 l \( 2 l + 1 \) - 2 j \( 2 j + 1 \)) thin c_(l - 1 \, j) . $
  Starting with $F_0 = 1$, every $c_(l j)$ is therefore nonzero.
    Polynomial spectral projections in $Delta_0$ put a nonzero zonal vector of each $cal(Y)_(2 j)$ in the image of
    (2.13). Rotations of a nonzero zonal harmonic span its harmonic space:
    they are the harmonic projections of powers of linear forms, and such powers span the homogeneous polynomials.
    The map is consequently onto. Its source and target both have dimension
  $ frac(\( 2 l + 1 \) \( 2 l + 2 \), 2) = sum_(j = 0)^l \( 4 j + 1 \) = \( l + 1 \) \( 2 l + 1 \) \, $
  so it is an isomorphism.
  Dualizing this isomorphism in the variation formula (2.6) shows that the trace-free first-variation map for the
    entire round degree-$l$ cluster is onto the trace-free symmetric matrices on $cal(Y)_l$.
    More explicitly, a nonzero trace-free matrix $C$ gives the nonzero product function $sum C_(alpha beta)
    u_alpha u_beta$ by injectivity of (2.13), so it cannot annihilate every conformal direction.
    Choose finitely many directions on which this derivative is onto,
    and represent the cluster by its smooth Riesz matrix in that finite family.
    The submersion theorem realizes every sufficiently small trace-free matrix as its trace-free part.
    Choose a diagonal one whose ordered entries are strictly increasing except for the desired adjacent equality.
    It may be made arbitrarily small. The round gaps to the other degree blocks remain positive,
    so this is an isolated double at the required positions. Lemma 5, with cutoff $p + 1$,
    separates all other repetitions while retaining it.
  #emph[Pairs across consecutive round blocks.] These pairs have $i = B_l$ with $L + 1 lt.eq l lt.eq M - 1$.
    Put $P = \( - 1 \)^l$ and $c_0 = 3 \/ 2$. Choose once and for all a smooth axisymmetric function
    $psi \( theta \)$, supported in an equatorial band whose closure is disjoint from the poles,
    where $theta$ is colatitude, such that
  #[#set math.equation(numbering: n => "(2.15)")
   $ psi \( pi - theta \) = psi \( theta \) \, wide 0 lt.eq psi lt.eq 1 \, wide psi \( pi \/ 2 \) = 1 \, wide
     macron(psi) = 1 / pi integral_0^pi psi \( theta \) thin d theta < 1 / 10 . $ <n:eq-equatorial-bump>]
  For large $l$, consider the unnormalized metric
  #[#set math.equation(numbering: n => "(2.16)")
   $ hat(h)_l = zeta_l \( theta \)^2 g_0 \, wide zeta_l = 1 - c_0 / l psi . $ <n:eq-parity-metric>]
  It is antipodally invariant and tends to $g_0$ in every fixed smooth norm.
    It corresponds to the conformal parameter $w_l = log zeta_l$.
    Dividing the metric by its area factor multiplies all its eigenvalues by the same positive number,
    so it does not change any ordering used below.
  The Dirichlet form is unchanged and $\( 1 - c_0 \/ l \)^2 lt.eq zeta_l^2 lt.eq 1$.
    Min–max on either parity subspace therefore places the positions belonging at round to degree $q$ in the interval
  #[#set math.equation(numbering: n => "(2.17)")
   $ #scale(x: 120%, y: 120%)[\[] q \( q + 1 \) \, thin \( 1 - c_0 \/ l \)^(- 2) q \( q + 1 \)
     #scale(x: 120%, y: 120%)[\]] . $ <n:eq-parity-form-bounds>]
  The intervals for $q$ and $q + 2$ in the same parity are disjoint through $q = l + 1$, for all large $l$.
    Indeed the gap between their round values is $4 q + 6$, while, uniformly for $q lt.eq l + 1$,
  $ #scale(x: 120%, y: 120%)[\(] \( 1 - c_0 \/ l \)^(- 2) -
    1 #scale(x: 120%, y: 120%)[\)] q \( q + 1 \) lt.eq \( 2 c_0 + o \( 1 \) \) \( q + 1 \) < 4 q + 6 . $
  Here $c_0 < 2$ gives the last inequality uniformly for large $l$.
    Thus the indicated degree groups keep their order inside each parity list.
  We next find a value from the parity-$P$ degree-$l$ group above a value from the parity-$-
    P$ degree-$\( l + 1 \)$ group. The sector min–max statements use the Friedrichs form domains obtained by
    closing smooth sphere sector profiles in their energy-plus-mass norms.
    Near either pole, a smooth sphere sector profile of azimuthal number $m$ has the form $t^(\| m \|)
    a \( t^2 \)$, where $t$ is distance to that pole and $a$ is smooth; for $m = 0$,
    these are smooth profiles even at the poles. For the first value,
    take the lowest eigenvalue in azimuthal sector $m = l$ of $hat(h)_l$.
    By Lemma 6, the meridional ground profile is positive and unique up to scale.
    Reflection in the equator preserves it; the azimuthal factor acquires $\( - 1 \)^l$ under the antipodal map.
    Hence the resulting mode has parity $P$. Choose a real eigenfunction $u_l$ with $integral u_l^2 thin d mu =
    1$, and write its round energy and changed mass as
  $ E_l = integral_(S^2) \| nabla_0 u_l \|^2 thin d mu \, wide M_l = integral_(S^2) zeta_l^2 u_l^2 thin d mu . $
  The azimuthal term gives
  $ E_l gt.eq l^2 integral_(S^2) frac(u_l^2, sin^2 theta) thin d mu \, wide M_l lt.eq 1 . $
  Min–max in this sector bounds
  $ E_l / M_l lt.eq \( 1 - c_0 \/ l \)^(- 2) l \( l + 1 \) = l^2 + O \( l \) . $
  It follows that $integral \( sin^(- 2) theta - 1 \) u_l^2 thin d mu = O \( l^(- 1) \)$.
    The integrand factor is bounded below by a positive constant away from every fixed equatorial neighborhood.
    The round probability masses $u_l^2 d mu$ therefore concentrate at the equator.
    Since $psi = 1$ there and is continuous,
  $ integral psi u_l^2 thin d mu = 1 - o \( 1 \) \, wide M_l = 1 - frac(2 c_0, l) + o \( l^(- 1) \) . $
  The lowest round eigenvalue in the sector is $l \( l + 1 \)$, so also $E_l gt.eq l \( l + 1 \)$.
    The chosen high value satisfies
  #[#set math.equation(numbering: n => "(2.18)")
   $ lambda_(upright("high")) = E_l / M_l gt.eq l \( l + 1 \) #scale(x: 120%, y: 120%)[\(] 1 + 2 c_0 \/ l +
     o \( l^(- 1) \) #scale(x: 120%, y: 120%)[\)] = l^2 + \( 1 + 2 c_0 \) l + o \( l \) . $ <n:eq-high-parity>]
  Its bounds place it in the degree-$l$ group of the parity-$P$ list.
  For the low value use the axisymmetric eigenfunction in the slot occupied at round by degree $l + 1$,
    namely slot $l + 2$ when this list is numbered from $1$. Lemma 6 shows that its eigenvalue is simple
    throughout the reflection-symmetric deformation and that its reflection parity remains $\( - 1 \)^(l + 1) = - P$.
  Set
  $ R = 1 / pi integral_0^pi zeta_l \( theta \) thin d theta = 1 - frac(c_0 macron(psi), l) \, wide
    x \( theta \) = 1 / R integral_0^theta zeta_l \( t \) thin d t . $
  Then $x$ maps $\[ 0 \, pi \]$ onto itself, and in this coordinate
  $ hat(h)_l = R^2 #scale(x: 120%, y: 120%)[\(] d x^2 + sin^2 x thin F \( x \)^2 d phi^2
    #scale(x: 120%, y: 120%)[\)] \, wide F \( x \) = frac(zeta_l \( theta \( x \) \) sin theta \( x \), R sin x) . $
  The function $F$ is positive and reflection-symmetric. It has smooth even extensions at $0 \,
    pi$ and satisfies $F = 1 + O \( l^(- 1) \)$ in every fixed smooth norm.
    For example, $zeta_l = 1$ near a pole, so there $theta = R x$ and $F = sin \( R x \) \/ \( R sin x \)$,
    which has the stated even extension and bounds. The other pole follows by reflection.
  The axisymmetric nonnegative Laplacian of the metric in parentheses is
  $ - frac(1, sin x thin F) partial_x \( sin x thin F thin partial_x \) $
  on $L^2 \( sin x thin F thin d x \)$. We use the Friedrichs realizations of the Dirichlet forms defined first on
    smooth profiles with even smooth extensions at both poles.
    Multiplication by $sqrt(F)$ maps this core bijectively to the corresponding round core,
    since $sqrt(F)$ and its reciprocal are smooth and even at the poles.
    On this core, the boundary contribution $#scale(x: 120%, y: 120%)[\[] sin x
    thin \( sqrt(F) \)' \( sqrt(F) \)^(- 1) \| v \|^2 #scale(x: 120%, y: 120%)[\]]_0^pi$ vanishes.
    The conjugated form is therefore the round axisymmetric form on $L^2 \( sin x thin d x \)$ plus the potential
  $ V_F = frac(\( sqrt(F) \)'' + cot x thin \( sqrt(F) \)', sqrt(F)) . $
  The even endpoint extensions make the apparent endpoint singularities removable, and $parallel V_F parallel_oo =
    O \( l^(- 1) \)$. This bounded potential makes the shifted form norms equivalent,
    so multiplication by $sqrt(F)$ also maps the closed form domain onto the round form domain.
    Min–max for a bounded potential, at the degree-$\( l + 1 \)$ slot, gives
  #[#set math.equation(numbering: n => "(2.19)")
   $ lambda_(upright("low")) & = R^(- 2) #scale(x: 120%, y: 120%)[\(] \( l + 1 \) \( l + 2 \) +
     O \( l^(- 1) \) #scale(x: 120%, y: 120%)[\)]\
 & = l^2 + \( 3 + 2 c_0 macron(psi) \) l + O \( 1 \) . $ <n:eq-low-parity>]
  The same form comparison on the axisymmetric subspace places this slot in the interval (2.17) for $q = l + 1$.
    The separated parity intervals therefore locate it in the degree-$\( l + 1 \)$ group of the parity-$- P$ list.
    Combining (2.18) and (2.19) yields the strict inversion
  #[#set math.equation(numbering: n => "(2.20)")
   $ lambda_(upright("high")) - lambda_(upright("low")) gt.eq
     #scale(x: 120%, y: 120%)[\(] 2 c_0 \( 1 - macron(psi) \) - 2 #scale(x: 120%, y: 120%)[\)] l +
     o \( l \) = \( 1 - 3 macron(psi) \) l + o \( l \) > 0 . $ <n:eq-parity-inversion>]
  To locate the resulting double in the combined list, write $lambda_j^P$ and $lambda_j^(- P)$ for the ordered
    parity eigenvalues. The counts up to round degree $l$ are
  #[#set math.equation(numbering: n => "(2.21)")
   $ A_l = frac(\( l + 1 \) \( l + 2 \), 2) quad upright("in parity ") P \, wide D_l = frac(l \( l + 1 \), 2) quad
     upright("in parity ") - P \, wide A_l + D_l = B_l . $ <n:eq-parity-counts>]
  At the round metric,
  $ lambda_(A_l)^P = l \( l + 1 \) < \( l + 1 \) \( l + 2 \) = lambda_(D_l + 1)^(- P) . $
  At $hat(h)_l$, the high value lies among the first $A_l$ values of parity $P$,
    while the low value lies in the group starting at $D_l + 1$ in parity $- P$. Hence
  $ lambda_(A_l)^P gt.eq lambda_(upright("high")) > lambda_(upright("low")) gt.eq lambda_(D_l + 1)^(- P) . $
  These strict indexed inequalities survive area normalization and sufficiently small perturbations of the two
    endpoints. By Lemma 4, choose such endpoints that are simple through the needed cutoffs within each parity,
    and join them by an even path with that property. Along it the continuous function $lambda_(A_l)^P -
    lambda_(D_l + 1)^(- P)$ changes sign. At a zero, the two equal values are simple in their separate parity
    lists. Exactly $\( A_l - 1 \) + D_l = B_l - 1$ eigenvalues of the combined list are below them.
    Thus the equality is a double at positions $B_l \, B_l + 1$.
    This conclusion requires only continuity of the indexed parity eigenvalues;
    no isolation of coincidences along this preliminary path is needed.
    Apply Lemma 5 in unrestricted directions to keep this double and separate every other level through $p + 1$.
  The two cases cover all adjacent pairs in $I$. For fixed $k$ there are finitely many of them.
    All cross-block estimates above are estimates as $l arrow.r oo$, so they hold simultaneously for $L + 1 lt.eq
    l lt.eq M - 1$ once $L$ is large. The cross-block parameters $w_l =
    log \( 1 - c_0 psi \/ l \)$ tend smoothly to zero uniformly for $l gt.eq L + 1$ as $k$ tends to infinity;
    the remaining perturbations can be arbitrarily small. Thus one prescribed $cal(U)$ contains all the metrics
    selected for every sufficiently large $k$. ◻
]

== 3 A finite cycle with mean frequency below the degree <n:sec-angular-program>

The adjacent doubles of Lemma 7 supply the individual exchanges.
  We join them into a closed path and average the frequencies visited by its continued eigenlines.
  The finite program is fixed before its radial starting time and crossing controls are chosen.

A label will now follow a smooth eigenline through each double.
  It is not renamed by its increasing spectral position after a crossing.
  Figure 1 illustrates this continuation and the adjacent-swap order.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0.15), (4.55, 0.15), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((4.55, 0.15), [#text(size: 9pt)[$s$]], anchor: "west", padding: 0.1176cm)
  line((0.15, 0), (0.15, 3.05), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((0.15, 3.05), [#text(size: 9pt)[$lambda$]], anchor: "south", padding: 0.1176cm)
  line((2.2, 0.15), (2.2, 2.75), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((0.45, 0.6), (3.95, 2.6), stroke: (thickness: 1.2pt, miter-limit: 10))
  content((3.95, 2.6), [#text(size: 9pt)[$A$]], anchor: "west", padding: 0.1176cm)
  line((0.45, 2.6), (3.95, 0.6), stroke: (thickness: 1.2pt, miter-limit: 10, dash: "dashed"))
  content((3.95, 0.6), [#text(size: 9pt)[$B$]], anchor: "west", padding: 0.1176cm)
  content((2.2, 0.15), [#text(size: 7pt)[double]], anchor: "north", padding: 0.1176cm)
  content((7.45, 2.75), [#text(size: 9pt)[$[A,B,C,D]$]])
  content((7.45, 2.05), [#text(size: 9pt)[$[B,A,C,D]$]])
  content((7.45, 1.35), [#text(size: 9pt)[$[B,C,A,D]$]])
  content((7.45, 0.65), [#text(size: 9pt)[$[B,C,D,A]$]])
  line((7.45, 2.52), (7.45, 2.28), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((7.45, 1.82), (7.45, 1.58), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((7.45, 1.12), (7.45, 0.88), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
})],
  caption: [Figure 1: Schematic of a continued pair at an isolated double (left) and the increasing adjacent-swap schedule on four illustrative ranks (right). The solid line $A$ changes from lower to upper ordered rank; the four-rank schedule sends the first label to the last rank. No numerical eigenvalues or phase durations are represented. ],
) <fig:ang-crossing-cycle>

In the statement below, $lambda_j \( H \( s \) \)$ still means the ordered eigenvalue of the metric,
  while $lambda_i \( s \)$ means the eigenvalue of the continued line with initial label $i$.

#thm([Proposition 3.1.])[
  (Angular program).  #emph[Fix $2 \/ 3 < a < 1$, $1 < theta.alt < 3 a \/ 2$, and $a^2 < kappa_(*) < 1$.
    Prescribe a sufficiently small conformal neighborhood $cal(U)$ for which the curvature and comparison bounds
    above hold. For every sufficiently large integer $k$, with threshold allowed to depend on $cal(U)$,
    there are $S > 0$ and a smooth $S$-periodic path $w \( s \)$ in $cal(U)$ such that $H \( s \) =
    h \( w \( s \) \)$ has the following properties, with $M \, p \, L \, I \, N$ as in (2.2).
    The phase origin can be chosen so that $w \( s \) = w \( 0 \)$ for $\| s \| < epsilon_0$,
    for some $epsilon_0 > 0$, and $h \( w \( 0 \) \)$ is simple through position $p + 1$.]
  + #emph[The area form is $d "vol"_(H \( s \)) = 4 pi thin d mu$ pointwise,
    and the ordered outer gap $lambda_p \( H \( s \) \) < lambda_(p + 1) \( H \( s \) \)$ holds for every $s$.]
  + #emph[Along the unwrapped path $s in bb(R)$, the spectral subspace of the first $p$ positions has a smooth
    real $L^2 \( d mu \)$-orthonormal frame $e_1 \( s \) \, dots.h \, e_p \( s \)$ of continued eigenlines.
    Their only equalities are isolated double crossings at distinct phases,
    and at each crossing the traceless first derivative of its $2 times 2$ cluster matrix is nonzero.
    The return permutation after $S$ fixes positions $1 \, dots.h \, B_L$ and is one cycle on $I$.]
  + #emph[With
$ d \( x \) = frac(- 1 + sqrt(1 + 4 x), 2) \, $

 every label among the first $p$ satisfies
#[#set math.equation(numbering: n => "(3.1)")
 $ frac(1, N S) integral_0^(N S) d #scale(x: 120%, y: 120%)[\(] a^(- 2) lambda_i \( s \)
   #scale(x: 120%, y: 120%)[\)] thin d s < k . $ <n:eq-frequency-margin>]

 Here $N S$ is an eigenvalue period for every band label and also a period for every fixed lower label.]
  #emph[At each crossing there is a smooth conformal direction $xi$ for which the off-diagonal entry
$ ⟨e_h \, frac(d, d epsilon)\|_(epsilon = 0) \( - Delta_(h \( w + epsilon xi \)) \) e_i⟩_(L^2 \( d mu \)) $

 is nonzero on the crossing pair. After $k$ and the entire program are fixed, the outer gap,
   the absolute crossing slopes, and the separations between crossing phases have positive uniform lower bounds.
   For every fixed order, the smooth norms of the frame and metrics have a uniform upper bound.
   For each pair, its absolute eigenvalue gap has a positive lower bound on every compact subset of the full
   label-period phase circle $bb(R) \/ \( N S bb(Z) \)$ disjoint from that pair’s crossing set.
   A pair with no crossings has a uniform gap on that whole circle.]
] <n:prop-angular-program>

#proof[
  Before choosing $k$, shrink the prescribed convex neighborhood $cal(U)$ if necessary so that the mass-form
    min–max comparison gives, for every $w in cal(U)$,
  #[#set math.equation(numbering: n => "(3.2)")
   $ lambda_j \( h \( w \) \) lt.eq C_(*) thin l \( l + 1 \) quad upright("when ") B_(l - 1) < j lt.eq B_l \, wide
     frac(2 theta.alt, 3 a) sqrt(C_(*)) < 1 . $ <n:eq-near-round-frequency-bound>]
  This is possible because $C_(*)$ tends to $1$ as the neighborhood shrinks and $theta.alt < 3 a \/ 2$.
    Lemma 7 applies in this smaller neighborhood for every sufficiently large $k$.
  At each double from Lemma 7, choose a conformal direction for which the traceless first derivative of the
    two-dimensional cluster matrix is nonzero. On a short path through the double,
    write its matrix as $M \( tau \)$, with $M \( 0 \) = lambda I$. The trace-free quotient
  $ hat(M) \( tau \) = frac(M \( tau \) - 1 / 2 "tr" M \( tau \) I, tau) quad \( tau eq.not 0 \) $
  extends smoothly across zero. Its value there is a nonzero trace-free symmetric $2 times
    2$ matrix and therefore has two distinct eigenvalues. Its two eigenlines extend smoothly for small positive
    and negative $tau$. They are also the eigenlines of $M \( tau \)$, whose corresponding eigenvalues have the form
  $ 1 / 2 "tr" M \( tau \) + tau nu_(+) \( tau \) \, wide 1 / 2 "tr" M \( tau \) + tau nu_(-) \( tau \) \, wide
    nu_(+) \( 0 \) > nu_(-) \( 0 \) . $
  Their increasing order reverses at zero. Thus the continued lines exchange exactly the designated adjacent
    positions and their eigenvalue difference has a simple zero.
    This is the nonzero first-order splitting meant here: the path is deliberately chosen through the
    codimension-two double condition.
  Choose one base parameter simple through $p + 1$. The endpoints of each short crossing segment are also simple
    through $p + 1$; by Lemma 4, join each of them to the base by simple paths in $cal(U)$.
    The resulting loop has only its designated double through position $p + 1$.
    Smoothly reparametrize the pieces so they are constant near their joins and near the base,
    while retaining nonzero speed at the crossing. Since the designated pair lies inside $I$,
    every one of these loops keeps the gap between positions $p$ and $p + 1$.
  Concatenate the loops in the order
  $ i = B_L + 1 \, med B_L + 2 \, med dots.h \, med p - 1 $
  and smooth them at their constant base intervals. If $C$ denotes the return permutation of labels on the band,
    this order gives
  #[#set math.equation(numbering: n => "(3.3)")
   $ C \( B_L + 1 \) = p \, wide C \( j \) = j - 1 quad \( B_L + 2 lt.eq j lt.eq p \) . $ <n:eq-return-cycle>]
  It is a single $N$-cycle, and positions $1 \, dots.h \, B_L$ are fixed.
    Extend the resulting parameter loop periodically with period $S$,
    choosing the phase origin inside one of the constant base intervals.
    Its fixed-area image $H \( s \)$ is periodic because the gauge depends only on the current parameter.
  Simple eigenlines extend smoothly on the simple portions of the path,
    and the quotient construction above extends the two lines at every double.
    We may consequently choose a smooth orthonormal real eigenframe on the unwrapped line, with $e_1 = 1$.
    After $N$ periods each band line returns to its original line.
    Real unit sections can acquire signs, which can be continued consistently;
    after at most $2 N S$ the chosen frame repeats. These signs change neither the ordered positions nor the
    eigenvalues. There are only finitely many crossing types in a label period.
    Compactness and the strict properties of the constructed loops give the asserted uniform outer gap,
    crossing slopes, phase separations, and smooth bounds. The same compactness gives a positive gap for each pair
    on every compact subset of the full label-period phase circle disjoint from that pair’s crossing set.
  For clarity, every pair of band labels does cross during a label period.
    In one basic period the label entering at position $B_L + 1$ successively crosses the other $N -
    1$ labels and ends at $p$. By (3.3), every label takes that entering position in one of the $N$ repetitions.
    Lower labels never cross. At any of these doubles, Lemma 3 lets us prescribe a nonzero off-diagonal traceless
    entry in the continued two-line frame. Its value in the fixed-area gauge is unchanged,
    which supplies the stated direction. The finite phase separation allows these directions to be localized near
    individual crossings in the later radial construction.
  It remains to estimate the frequencies. The function $d$ is the nonnegative solution of $d \( d + 1 \) = x$,
    so $d \( x \) lt.eq sqrt(x)$. At every ordered position of the round degree-$l$ block, (3.2) yields
  $ d #scale(x: 120%, y: 120%)[\(] a^(- 2) lambda_j \( H \( s \) \) #scale(x: 120%, y: 120%)[\)] < a^(- 1)
    sqrt(C_(*)) thin \( l + 1 \) . $
  A label fixed among the first $B_L$ ranks therefore has frequency at most $a^(- 1) sqrt(C_(*))
    thin \( L + 1 \) = O \( sqrt(k) \) < k$ for all sufficiently large $k$.
  Now fix a band label $i$. At a noncrossing phase $t in \[ 0 \, S \]$,
    let $sigma_t$ send a label’s rank at the base to its ordered rank at that phase of the first period.
    In the $n$-th repetition, the rank of label $i$ at that phase is $sigma_t C^n \( i \)$.
    As $0 lt.eq n < N$, these ranks run once through $I$. Crossing phases form a finite set and do not affect the
    integral. Therefore
  #[#set math.equation(numbering: n => "(3.4)")
   $ frac(1, N S) integral_0^(N S) d #scale(x: 120%, y: 120%)[\(] a^(- 2) lambda_i \( s \)
     #scale(x: 120%, y: 120%)[\)] thin d s & = frac(1, N S) integral_0^S sum_(j in I) d
     #scale(x: 120%, y: 120%)[\(] a^(- 2) lambda_j \( H \( t \) \) #scale(x: 120%, y: 120%)[\)] thin d t\
 & lt.eq
   a^(- 1) sqrt(C_(*)) thin frac(sum_(l = L + 1)^M \( 2 l + 1 \) \( l + 1 \), \( M + 1 \)^2 - \( L + 1 \)^2) .
   $ <n:eq-band-frequency-average>]
  This identity explains why the durations allotted to the individual loops impose no further condition:
    at each phase the label samples every band rank over the $N$ repetitions.
  Since $L \/ k arrow.r 0$ and $M \/ k arrow.r theta.alt$, the ratio of the sum to the denominator in (3.4),
    divided by $k$, tends to $2 theta.alt \/ 3$. More explicitly, the numerator is
  $ sum_(t = L + 2)^(M + 1) \( 2 t^2 - t \) = 2 / 3 #scale(x: 120%, y: 120%)[\(] \( M + 1 \)^3 - \( L + 1 \)^3
    #scale(x: 120%, y: 120%)[\)] + O \( M^2 + L^2 \) \, $
  and the denominator is $\( M + 1 \)^2 - \( L + 1 \)^2$. By (3.2),
    the limiting bound after division by $k$ is $2 theta.alt sqrt(C_(*)) \/ \( 3 a \) < 1$.
    Consequently the right side of (3.4) is strictly below $k$ for every sufficiently large $k$.
    This proves (3.1) for the band as well as for the lower labels.
  Choose one such integer $k$ and its entire finite angular program now.
    The maximum of the finitely many averages in (3.1) is still strictly smaller than $k$.
    Every angular gap, slope, direction, and smooth bound in the proposition is fixed at this stage.
    A later radial starting time may depend on this program; the angular choices and their frequency margin do not
    depend on that starting time. ◻
]

== 4 Radial realization and its geometric limits <n:sec-geometry-input>

The angular program is fixed before it is placed at large radii.
  We now construct a metric with nonnegative Ricci curvature and the coefficient estimates needed for exact
  harmonic continuation. The construction is uniform: one radial factor must accommodate infinitely many
  independent controls.

Let $h \( w \)$ denote the fixed-area gauge from the angular construction, so $d "vol"_(h \( w \)) =
  d "vol"_(g_0)$. Write $w \( s \)$ for the fixed periodic reference program, constant near its initial phase.
  Extend it on $- 2 < s < 0$ to the round value $w = 0$, and set $w \( s \) = 0$ for $s lt.eq - 2$.
  The extension stays in the same small parameter neighborhood.
  Let $psi_nu$ and $chi_nu$ be the fixed perturbation directions and smooth phase bumps at successive crossings.
  The phase-bump supports are disjoint, have uniformly bounded phase width,
  and lie where the selected variation coefficient has one nonzero sign;
  each bump is one on a smaller crossing neighborhood. There are only finitely many smooth types of these data.

Fix $0 < a < 1$ and $a^2 < kappa_(*) < 1$. For a large start parameter $J$, set

$ eta \( t \) = t^(- 3 \/ 4) \, wide s \( t \) = 4 \( t^(1 \/ 4) - J^(1 \/ 4) \) quad \( t > 0 \) \, wide
  s' \( t \) = eta \( t \) . $

If $s \( t_nu \) = s_nu$ is the center of crossing $nu$, a sequence $z = \( z_nu \)
  in \[ - 1 \, 1 \]^(bb(N))$ prescribes

#[#set math.equation(numbering: n => "(4.1)")
 $ w_z \( t \) = w \( s \( t \) \) + sum_nu z_nu eta \( t_nu \)^(3 \/ 4) chi_nu \( s \( t \) \) psi_nu \, wide
   H_z \( t \) = h \( w_z \( t \) \) . $ <n:controlled-angular-input>]

For $t lt.eq 0$ set $H_z \( t \) = g_0$. This agrees smoothly with the displayed formula near zero.
  At most one summand is nonzero at any time, and the supports have no finite accumulation.
  Thus every sequence $z$ defines a smooth angular path. Its area form is the round one at every time.

#thm([Proposition 4.1.])[
  (Uniform radial realization).  #emph[Suppose the fixed reference program,
    including its negative-phase interpolation, is close enough to round that its Gauss curvature is uniformly
    greater than $kappa_(*)$. There are a constant $C > 0$ and, after $C$ is fixed,
    an integer $J_0$ such that for every integer $J gt.eq J_0$ there is a smooth function $f =
    f_J : \[ 0 \, oo \) arrow.r \[ 0 \, oo \)$, independent of $z$, such that
$ g_z = d r^2 + f \( r \)^2 H_z \( log r \) $

 extends to a complete smooth metric on $bb(R)^3$ for every $z in \[ - 1 \, 1 \]^(bb(N))$.
   The metric is Euclidean near zero, $"Ric"_(g_z) gt.eq 0$,
   with strictly positive Ricci curvature outside a compact set, and $d_(g_z) \( 0 \, \( r \, x \) \) = r$. Moreover
$ a lt.eq f' \( r \) lt.eq 1 \, wide f' \( r \) arrow.r a \, wide b \( t \) := e^(- t) f \( e^t \) arrow.r a . $

 For every $t gt.eq 0.8 J$ the following estimates are uniform over the entire product box of controls,
   also after any fixed number of angular differentiations:
#[#set math.equation(numbering: n => "(4.2)")
 $ & partial_t H_z = O \( eta \) \, wide partial_t^2 H_z = O \( eta^2 \) \, wide
   "tr" \( H_z^(- 1) partial_t H_z \) = 0 \,\
 & b_(t t) + b_t = - C eta^2 \, wide b_t = O \( C eta^2 \) \, quad b_(t t) = O \( C eta^2 \) \, quad b - a =
   O \( C t^(- 1 \/ 2) \) . $ <n:angular-time-input>]

 In every fixed smooth angular norm, $H_z \( t \) - H \( s \( t \) \) =
   O \( eta \( t \)^(3 \/ 4) \)$ in this range, where the reference $H \( s \) =
   h \( w \( s \) \)$ includes the negative-phase interpolation.
   The controlled links stay in a fixed compact subset of a finite-dimensional smooth family and have $K_(H_z) >
   kappa_(*)$. All implied constants may depend on $a$, $kappa_(*)$, the fixed angular program, and the fixed $C$;
   they do not depend on $J gt.eq J_0$ or on the control sequence.]
] <n:prop-radial-realization>

#proof[
  We first quantify the angular speed. On a fixed-width phase bump, $\| t - t_nu \| =
    O \( eta \( t_nu \)^(- 1) \) = O \( t_nu^(3 \/ 4) \)$; therefore $eta \( t \) \/ eta \( t_nu \) = 1 +
    o \( 1 \)$ uniformly as $t_nu arrow.r oo$. Since $eta' \( t \) = - \( 3 \/ 4 \) t^(- 7 \/ 4) =
    O \( eta \( t \)^2 \)$ and the fixed phase data have bounded derivatives, differentiating (4.1) gives,
    uniformly in $z$,
  #[#set math.equation(numbering: n => "(4.3)")
   $ partial_t w_z = O \( eta \) \, wide partial_t^2 w_z = O \( eta^2 \) . $ <n:angular-parameter-derivatives>]
  The same bounds hold after any fixed number of angular differentiations.
    They also hold through the negative-phase interpolation, where the controls vanish.
    Smoothness of $h$ on the fixed compact family also gives $H_z \( t \) - H \( s \( t \) \) =
    O \( eta \( t \)^(3 \/ 4) \)$ in every fixed spatial norm. In particular, if
  $ A = H_z^(- 1) partial_t H_z \, wide B = 1 / 2 A \, $
  then $A = O \( eta \)$, $partial_t A = O \( eta^2 \)$, and $"div"_(H_z) A =
    O \( eta \)$ in the corresponding angular tensor norms. Differentiating the fixed area form gives
    $"tr" \( H_z^(- 1) partial_t H_z \) = 0$, so $A$ and $B$ are traceless.
    The perturbation amplitudes $eta \( t_nu \)^(3 \/ 4)$ tend uniformly to zero as $J arrow.r oo$.
    Compactness of the reference phase program, including the negative-phase interpolation in the chosen
    near-round neighborhood, therefore ensures
  #[#set math.equation(numbering: n => "(4.4)")
   $ K_(H_z \( t \)) > kappa_(*) $ <n:angular-curvature-lower>]
  for all $z$ once $J$ is large. The supports have no finite accumulation,
    so $H_z$ is smooth even when the control sequence is not periodic.
  We construct $f$ next. Choose once a smooth function $0 lt.eq theta lt.eq 1$,
    zero on $\( - oo \, 1 \/ 2 \]$ and one on $\[ 0.7 \, oo \)$, and put $theta_J \( t \) = theta \( t \/ J \)$.
    Choose a nonnegative smooth function $beta$ supported in $\( 1 \, 2 \)$ with $integral beta \( r \) thin d r =
    1$. For a constant $C$ to be fixed below, the total slope loss in the tail
  $ f''_(upright("tail")) \( r \) =
    cases(delim: "{", - C / r theta_J \( log r \) \( log r \)^(- 3 \/ 2) \, & r > e^(J \/ 2) \,, 0 \, & 0 lt.eq r
    lt.eq e^(J \/ 2) \,) $
  is at most $2 C \( J \/ 2 \)^(- 1 \/ 2)$. Thus, after $C$ has been fixed,
    $J$ can be taken large enough that this loss is less than $1 - a$. Set
  $ m_J = 1 - a - C integral_(J \/ 2)^oo theta_J \( t \) t^(- 3 \/ 2) thin d t > 0 \, wide f'' \( r \) = -
    m_J beta \( r \) + f''_(upright("tail")) \( r \) \, $
  with $f \( 0 \) = 0$ and $f' \( 0 \) = 1$. The tail is understood to be zero where its cutoff vanishes.
    Then $f = r$ near zero, $f'' lt.eq 0$, and the total loss of slope is exactly $1 - a$.
    Hence $a lt.eq f' lt.eq 1$, $f$ is positive on $\( 0 \, oo \)$, and $f'$ tends to $a$.
  Set $b \( t \) = f \( e^t \) e^(- t)$. Since $b$ is the average of $f'$ over $\[ 0 \, e^t \]$, $a lt.eq b lt.eq
    1$ and $b arrow.r a$. The tail is exact for $t gt.eq 0.7 J$, and direct differentiation gives
  #[#set math.equation(numbering: n => "(4.5)")
   $ b_t + b = f' \( e^t \) \, wide b_(t t) + b_t = e^t f'' \( e^t \) = - C eta \( t \)^2 . $ <n:radial-tail-identity>]
  In this range $f' \( e^t \) = a + 2 C t^(- 1 \/ 2)$. We spell out the uniformity in the starting index.
    Put $u = 0.7 J$. Concavity gives $\| b_t \( u \) \| = \| f' \( e^u \) - b \( u \) \| lt.eq 1 - a$, and
  $ b_t \( t \) = e^(- \( t - u \)) b_t \( u \) - C integral_u^t e^(- \( t - v \)) v^(- 3 \/ 2) thin d v . $
  For $u gt.eq 3$, the inequality $log \( t \/ v \) lt.eq \( t - v \) \/ u$ bounds the integral by $2
    t^(- 3 \/ 2)$. For $J gt.eq 15$ and $t gt.eq 0.8 J$,
  $ t^(3 \/ 2) e^(- \( t - u \)) lt.eq \( 0.8 J \)^(3 \/ 2) e^(- 0.1 J) . $
  This last expression decreases to zero as $J$ increases. Once $C$ is fixed,
    one threshold $J_0$ therefore makes the transient at most $C t^(- 3 \/ 2)$ for every $J gt.eq J_0$.
    Consequently $\| b_t \| lt.eq 3 C eta^2$, $\| b_(t t) \| lt.eq 4 C eta^2$, and,
    by the first identity in (4.5), $0 lt.eq b - a lt.eq 5 C t^(- 1 \/ 2)$. In particular, uniformly on $t gt.eq 0.8 J$,
  #[#set math.equation(numbering: n => "(4.6)")
   $ b_t = O \( C eta^2 \) \, wide b_(t t) = O \( C eta^2 \) \, wide b - a =
     O \( C t^(- 1 \/ 2) \) . $ <n:warping-estimates>]
  Here and below $C$ is fixed before $J$ tends to infinity.
  The first angular motion occurs only after $s \( t \)$ reaches $- 2$, at
  $ t_(- 2) = \( J^(1 \/ 4) - 1 \/ 2 \)^4 = J - 2 J^(3 \/ 4) + O \( J^(1 \/ 2) \) > 0.8 J $
  for sufficiently large $J$. Thus the exact tail and (4.6) apply throughout the angular-motion region.
    Before that region the metric is round-warped. Its Ricci eigenvalues are
  $ "Ric"_(r r) = - 2 f'' \/ f gt.eq 0 \, wide "Ric"^T = (frac(1 - \( f' \)^2, f^2) - f'' / f) I gt.eq 0 \, $
  including the compact slope transition and the tail cutoff.
  It remains to check the complete Ricci tensor while $H_z$ moves.
    All quantities in the following calculation are evaluated at $t = log r$. Put $q = 1 + b_t \/ b$.
    In the outward unit normal $partial_r$, the shape operator of the sphere ${ r } times S^2$ is
  #[#set math.equation(numbering: n => "(4.7)")
   $ S = 1 / r \( q I + B \) \, wide "tr" S = frac(2 q, r) . $ <n:shape-operator>]
  Write $"Ric"^T$ for the Ricci endomorphism on the unit angular tangent plane.
    The normal, Codazzi, and Gauss identities applied to (4.7) give the exact block formulas
  #[#set math.equation(numbering: n => "(4.8)")
   $ r^2 "Ric"_(r r) & = - frac(2 \( b_(t t) + b_t \), b) - "tr" \( A^2 \) \/ 4 \,\
r^2 "Ric" #scale(x: 120%, y: 120%)[\(] partial_r \, X \/ f #scale(x: 120%, y: 120%)[\)] & =
  b^(- 1) \( "div"_(H_z) B \) \( X \) \,\
r^2 "Ric"^T & = (K_(H_z) / b^2 - 2 q^2 + q - q_t) I + \( 1 - 2 q \) B - B_t . $ <n:ricci-radial-input>]
  In (4.8), $X$ is an $H_z$-unit vector and $\( "div"_(H_z) B \)_i = nabla_j B^j zws_i$.
    One may also check (4.8) from $"Ric"_(r r) = - partial_r "tr" S - "tr" \( S^2 \)$.
    For (4.8), use $"Ric"^T = f^(- 2) K_(H_z) I - partial_r S - \( "tr" S \) S$.
    These expressions include the mixed block, which cannot be discarded when testing nonnegative Ricci curvature.
  The constants in (4.3) give numbers $M_A \, M_M < oo$, depending on the fixed angular program but neither on $C$
    nor on the controls, such that
  $ \| A \| lt.eq M_A eta \, wide \| b^(- 1) "div"_(H_z) B \| lt.eq M_M eta . $
  Since $q = 1 + O \( C eta^2 \)$ and $q_t = O \( C eta^2 \)$, the tangential block in (4.8) satisfies
  $ r^2 "Ric"^T = (K_(H_z) / b^2 - 1) I + O \( eta + C eta^2 \) . $
  The choice $kappa_(*) > a^2$ leaves positive slack:
  $ tau_0 := kappa_(*) / a^2 - 1 > 0 . $
  Fix, for instance, $tau = tau_0 \/ 4$. Because $b arrow.r a$ uniformly after late start,
    the last two displays imply $r^2 "Ric"^T gt.eq tau I$ for all sufficiently large $J$, once $C$ is fixed.
    Meanwhile (4.5) and (4.8) give
  $ r^2 "Ric"_(r r) gt.eq (frac(2 C, b) - M_A^2 / 4) eta^2 \, wide \| r^2 "Ric"_(upright("mixed")) \| lt.eq M_M eta . $
  Choose $C$ so large that
  #[#set math.equation(numbering: n => "(4.9)")
   $ 2 C > M_A^2 / 4 + M_M^2 / tau . $ <n:ricci-schur-choice>]
  This choice uses only the fixed angular program and $a lt.eq b lt.eq 1$; it precedes the choice of $J$.
    Choose one $J_0$ after $C$ so that every preceding estimate holds for every integer $J gt.eq J_0$,
    and perform the construction for any such $J$. Then the Schur complement of the tangential block is bounded below by
  $ r^2 "Ric"_(r r) - r^2 "Ric"_(r T) \( r^2 "Ric"^T \)^(- 1) r^2 "Ric"_(T r) gt.eq
    (2 C - M_A^2 / 4 - M_M^2 / tau) eta^2 > 0 . $
  Thus $"Ric"_(g_z) > 0$ throughout the angular-motion region, uniformly for all $z$.
    Before that region, the round-warped formulas also give strictly positive Ricci curvature wherever the exact
    tail has begun, since $f'' < 0$ there. Hence $"Ric"_(g_z) > 0$ for $r gt.eq e^(0.7 J)$,
    while it is nonnegative everywhere.
  Finally, $f = r$ and $H_z = g_0$ near $r = 0$, so the polar metric $g_z$ extends there as the Euclidean metric.
    Every piecewise smooth path from the origin to $\( r \, x \)$ has length at least $r$ by its radial component,
    while the radial segment has length $r$. Therefore $d_(g_z) \( 0 \, \( r \, x \) \) = r$.
    Closed metric balls about the origin are compact in these smooth polar coordinates; hence the metric is complete. ◻
]

=== 4.1 Comparison with the Euclidean metric <comparison-with-the-euclidean-metric>

The angular neighborhood can also impose a uniform tensor bound.
  For any prescribed $0 < delta < 1$, use (2.5) to require $\( 1 - delta \) g_0 lt.eq
  h \( w \) lt.eq \( 1 + delta \) g_0$. Choose the reference program and its negative-phase interpolation in a
  smaller neighborhood with positive margin inside this one.
  Once their finite smooth data are fixed, increasing $J$ makes every control perturbation small enough to stay in
  the prescribed neighborhood, uniformly over all sequences $z$.
  The same tensor bound then holds for $H_z \( t \)$ at every time; on the round core it holds automatically.

Since $a lt.eq f \( r \) \/ r lt.eq 1$ for all $r > 0$, comparison with $g_(upright(E)) = d r^2 + r^2 g_0$ gives

#[#set math.equation(numbering: n => "(4.10)")
 $ a^2 \( 1 - delta \) g_(upright(E)) lt.eq g_z lt.eq \( 1 + delta \) g_(upright(E)) wide
   upright("on ") bb(R)^3 . $ <n:eq-global-tensor-comparison>]

The bound extends across the origin, where the metrics agree.
  Integrating along curves and taking infima gives the corresponding bounds on their ambient distances.
  Thus the distortion of the identity map is controlled by $a$ and $delta$, independently of the selected controls.

=== 4.2 Volume, cone limits, and radial sectional curvature <n:geometric-consequences>

For each allowed $J$ and every control sequence, the metric has asymptotic volume ratio $a^2$,
  where the normalization is $"AVR" \( g \) = lim_(R arrow.r oo) "vol"_g B \( 0 \, R \) \/ \( 4 pi R^3 \/ 3 \)$.
  Indeed, its angular area form is always the round one, so the distance identity in Proposition 9 gives

$ "vol"_(g_z) B \( 0 \, R \) = 4 pi integral_0^R f \( r \)^2 thin d r tilde.op frac(4 pi a^2, 3) R^3 . $

The value $a^2$ is independent of the controls.

Let $P$ be the period of the reference angular path. If $s \( t_n \) med \( mod med P \) arrow.r
  s_(*)$ and $t_n arrow.r oo$, then for $r_n = e^(t_n)$ the rescaled metrics $r_n^(- 2)
  g_z$ converge smoothly on each annulus $0 < epsilon.alt lt.eq r \/ r_n lt.eq R$ to the metric cone $d rho^2 +
  a^2 rho^2 H \( s_(*) \)$. Indeed, $s \( t_n + log rho \) - s \( t_n \) arrow.r 0$ uniformly on such annuli,
  while $b \( t_n + log rho \) arrow.r a$ and all controlled perturbations vanish there;
  the same chain-rule estimates apply to every fixed derivative.
  In the rescaled metric the ball of radial size $epsilon.alt$ has diameter at most $2 epsilon.alt$,
  so the convergence extends to pointed Gromov–Hausdorff convergence with the cone tip included.
  Every phase occurs along a sequence tending to infinity because $s \( t \)$ is continuous, increasing, and unbounded.

The reference path has a phase with simple eigenvalues through the chosen finite band and another with an isolated
  double eigenvalue in that band. Its ordered spectra at these phases differ,
  so at least one continuous ordered eigenvalue $lambda_j \( H \( s \) \)$ is nonconstant.
  Its image contains a nontrivial interval. Phases with distinct values of this eigenvalue give distinct spectra
  of the scaled links $a^2 H \( s \)$ and hence nonisometric links.
  A pointed cone isometry preserves distance to the tip and restricts on the unit sphere to an isometry of its
  intrinsic link metric. The corresponding pointed tangent cones are therefore nonisometric.
  In particular, every control sequence has uncountably many pairwise nonisometric pointed tangent cones at infinity.

Nonnegative Ricci curvature does not make all radial sectional curvatures nonnegative here.
  Choose a phase $s_(*)$ where $H_s \( s_(*) \)$ is not the zero tensor;
  such a phase exists because the angular spectrum changes.
  At a point $x$ where $D = H \( s_(*) \)^(- 1) H_s \( s_(*) \)$ is nonzero, $D$ is self-adjoint and traceless,
  so it has a positive eigenvalue. For times $t_n arrow.r oo$ with $s \( t_n \) = s_(*) + n P$,
  the radial sectional-curvature endomorphism $cal(K)_r = - partial_r S - S^2$ satisfies

$ r_n^2 cal(K)_r = frac(C eta \( t_n \)^2, b \( t_n \)) I + \( 1 - 2 q \) B - B_t - B^2 = -
  frac(eta \( t_n \), 2) D + o \( eta \( t_n \) \) $

at $x$. The control contribution to $B$ is $O \( eta \( t_n \)^(7 \/ 4) \) = o \( eta \( t_n \) \)$,
  uniformly in the full control box. This includes differentiating both the bump and the smooth gauge.
  Consequently the radial plane through a positive eigendirection of $D$ has negative sectional curvature at all
  sufficiently late members of this sequence.

== 5 Exact harmonic transfer across the moving links <n:sec-transfer>

The angular program follows eigenlines of a sphere operator.
  A trace of a harmonic function on the three-dimensional manifold need not follow any of those lines:
  its continuation depends on the metric throughout the ball,
  and it can acquire components in arbitrarily high angular modes.
  We first express the high component as an invariant graph over the low coordinates for the exact Dirichlet maps.
  We then calculate the one entry of the resulting finite matrix that a crossing control changes to first order.

=== 5.1 The exact maps and two different freezing estimates <the-exact-maps-and-two-different-freezing-estimates>

Fix the integer $k$, its angular program from Proposition 8, and the radial family of Proposition 9.
  Write $L \( s \) = - Delta_(H \( s \))$ and use its continued real orthonormal frame $e_i \( s \)$ with
  eigenvalues $lambda_i \( s \)$, $1 lt.eq i lt.eq p = \( M + 1 \)^2$, where $M =
  floor.l theta.alt k floor.r$ is the top degree of the fixed program.
  All operators act on the common space $L^2 \( S^2 \, mu \)$. The protected outer gap can be written

#[#set math.equation(numbering: n => "(5.1)")
 $ lambda_(p + 1)^(upright("ord")) \( s \) - max_(i lt.eq p) lambda_i \( s \) gt.eq
   g_(upright("gap")) > 0 . $ <n:eq-outer-angular-gap>]

Let $H_z \( t \)$ be the controlled link in (4.1), and set $delta_j = eta \( j \)^(3 \/ 4) = j^(- 9 \/ 16)$.
  The radial proposition gives, for every $t gt.eq 0.8 J$,

#[#set math.equation(numbering: n => "(5.2)")
 $ & a lt.eq b \( t \) lt.eq 1 \, quad b \( t \) - a = O \( t^(- 1 \/ 2) \) \, quad b_t \, b_(t t) =
   O \( eta \( t \)^2 \) \,\
 & parallel H_z \( t \) - H \( s \( t \) \) parallel_(C^m) = O \( eta \( t \)^(3 \/ 4) \) \, quad
   parallel partial_t H_z \( t \) parallel_(C^m) = O \( eta \( t \) \) quad \( m gt.eq 0 \) .
   $ <n:eq-transfer-radial-input>]

The same reference notation includes the negative-phase interpolation.
  All needed higher derivative bounds follow from the fixed smooth bump types.
  They are uniform over the complete control box and every sufficiently late start.
  The radial factor is independent of $z$. We may thus increase $J$ below while leaving the angular program and
  its Ricci buffer fixed. Constants may depend on these data, in particular on $p$;
  they are never required to be uniform as $k$ grows.

For $0 < r < R$, let $cal(R)_(r \, R)^z$ send boundary data on the sphere of radius $R$ to the trace at radius $r$
  of their harmonic extension to the #emph[whole] ball $B_(g_z) \( 0 \, R \)$.
  Both boundary spaces are identified with $L^2 \( S^2 \, mu \)$. At integer logarithmic radii set

$ T_j = cal(R)_(e^j \, e^(j + 1))^z \, wide frak(d) \( q \) = frac(- 1 + sqrt(1 + 4 q), 2) \, $

and introduce two frozen inward maps:

#[#set math.equation(numbering: n => "(5.3)")
 $ P_j^0 = exp \[ - frak(d) \( b \( j \)^(- 2) L \( s \( j \) \) \) \] \, wide P_j^(*) =
   exp \[ - frak(d) \( b \( j \)^(- 2) \( - Delta_(H_z \( j \)) \) \) \] . $ <n:eq-frozen-inward>]

The first map uses the reference link; the second includes the actual control at time $j$.

#thm([Lemma 5.1.])[
  (Whole-ball restriction and frozen comparisons).  #emph[For every control sequence,
    $cal(R)_(r \, R)^z$ is positivity preserving, fixes constants, preserves the $mu$-mean,
    and is a contraction on $L^2 \( mu \)$ for every $0 < r < R$. In particular these conclusions hold for $T_j$.
    Uniformly over all controls and all sufficiently late starts,
#[#set math.equation(numbering: n => "(5.4)")
 $ parallel T_j - P_j^0 parallel_(L^2 arrow.r L^2) = o \( 1 \) quad upright("as ") j arrow.r
   oo . $ <n:eq-operator-freeze>]

 For the finitely many smooth reference vectors there is the sharper bound
#[#set math.equation(numbering: n => "(5.5)")
 $ parallel \( T_j - P_j^(*) \) e_i \( s \( j + 1 \) \) parallel_2 lt.eq
   C (eta \( j \) log frac(1, eta \( j \)) + eta \( j \)^2) = o \( delta_j \) \, wide i lt.eq p . $ <n:eq-frame-freeze>]

 No constant or remainder in these statements depends on the controls at earlier radii.
   The $o \( delta_j \)$ assertion is only on the displayed finite smooth frame, not in the full operator norm.]
] <n:lem-inward-transfer>

#proof[
  For smooth data, the classical Dirichlet theorem gives a smooth harmonic extension $u$ inside the ball [8]
    Theorem 6.14, p. 107. The fixed angular area form makes its equation away from the origin
  $ u_(r r) + 2 f' / f u_r + f^(- 2) Delta_(H_z \( log r \)) u = 0 . $
  Consequently, for $macron(u) \( r \) = integral u \( r \, omega \) thin d mu \( omega \)$,
  $ \( f \( r \)^2 macron(u)_r \( r \) \)' = 0 . $
  Regularity in the Euclidean core and $f \( r \) = r$ near zero force the constant of integration to vanish.
    The mean on every inner sphere therefore equals the boundary mean.
    The maximum principle makes harmonic restriction positive and constant preserving [8] Theorems 3.1 and 3.3,
    pp. 32–33. A positive constant-preserving map satisfies the pointwise square inequality $\( cal(R) v \)^2
    lt.eq cal(R) \( v^2 \)$: apply positivity to $cal(R) \( \( v - c \)^2 \)$ with $c =
    cal(R) v$ at the point in question. After integration and mean preservation this gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ parallel cal(R)_(r \, R)^z v parallel_2^2 lt.eq integral cal(R)_(r \, R)^z \( v^2 \) thin d mu =
     integral v^2 thin d mu . $ <n:eq-all-radius-contraction>]
  Density extends the maps to $L^2 \( mu \)$. For clarity, these extended maps still are traces of one harmonic
    function in the interior: approximate the boundary value in $L^2$ by smooth data and use (5.6) on inner
    spheres. The local $L^2$-to-sup estimate, followed by interior Schauder estimates and their iterates for the
    differentiated smooth equation, makes the extensions Cauchy in every smooth norm on smaller compact sets [8]
    Theorem 8.17, p. 194, with $p = 2$, and Corollary 6.3, pp. 93–94.
    Their limit is harmonic, and uniqueness follows from the same approximation.
    This also shows that restriction from $L^2$ boundary data is smooth on every strictly inner sphere.
  In logarithmic radius $t = log r$, the equation becomes
  #[#set math.equation(numbering: n => "(5.7)")
   $ u_(t t) + gamma \( t \) u_t + b \( t \)^(- 2) Delta_(H_z \( t \)) u = 0 \, wide gamma \( t \) = 1 +
     2 b_t \( t \) \/ b \( t \) . $ <n:eq-logarithmic-harmonic>]
  For the local estimates just used and those below, its divergence form is
  $ partial_t \( e^t b \( t \)^2 u_t \) + e^t Delta_(H_z \( t \)) u = 0 . $
  In fixed angular charts the second term is divergence with respect to the fixed density $mu$.
    On a time interval of fixed width, division by $e^(t_0)$ at its center leaves uniformly elliptic coefficients
    with the uniform smooth bounds in the input. The cited local estimates therefore have constants independent of
    the large center time and of the controls. The compact core is covered by ordinary smooth coordinate charts.
    We first prove the operator-norm statement. Consider arbitrary $j_n arrow.r oo$,
    arbitrary allowed starts $J_n lt.eq j_n$ and control sequences, and data $parallel v_n parallel_2 lt.eq 1$.
    Pass to a subsequence for which $v_n harpoon.rt v$ weakly and $H \( s \( j_n \) \) arrow.r H_oo$ smoothly.
    Such a phase subsequence exists because the reference program is compact.
    Move the outer boundary to zero by $x = t - \( j_n + 1 \)$,
    and write $u_n \( x \)$ for the exact whole-ball extension.
    On every fixed compact interval in $x lt.eq 0$, the radial and angular input estimates make the shifted
    coefficients converge smoothly to those of
  #[#set math.equation(numbering: n => "(5.8)")
   $ U_(x x) + U_x + a^(- 2) Delta_(H_oo) U = 0 . $ <n:eq-frozen-cylinder>]
  Indeed, the phase changes by $O \( eta \( j_n \) \)$ on such an interval and the control amplitudes vanish.
    The interval on which the stated end bounds hold extends an unbounded distance to the left in these
    coordinates, since $j_n - 0.8 J_n gt.eq 0.2 j_n$ when $J_n lt.eq j_n$.
  The sectional bounds $parallel u_n \( x \) parallel_2 lt.eq 1$ hold for every $x < 0$.
    On each compact subcylinder of $x < 0$ they give an $L^2$ bound for the solution.
    The local $L^2$-to-sup estimate and interior Schauder estimates [8] Theorem 8.17 and Corollary 6.3 give
    uniform $C^(2 \, alpha)$ bounds on smaller cylinders. Compact embedding, followed by a diagonal subsequence,
    gives strong $L^2$ convergence at each interior sphere, in particular at $x = - 1$.
    The limit $U$ solves (5.8) on $\( - oo \, 0 \)$ and has sectional norm at most one there.
  The trace of this limit at $x = 0$ must also be identified.
    For a fixed smooth $phi.alt$ on $S^2$, put $y_n \( x \) = chevron.l u_n \( x \) \, phi.alt chevron.r_2$.
    Self-adjointness of the angular Laplacian in the fixed space $L^2 \( mu \)$ gives, on $\[ - 1 \, 0 \)$,
  $ y''_n + gamma_n y'_n = - chevron.l u_n \, b_n^(- 2) Delta_(H_(z \, n)) phi.alt chevron.r_2 . $
  The right side and $y_n$ are uniformly bounded, and so is $gamma_n$.
    The mean value theorem on $\[ - 1 \, - 1 \/ 2 \]$ bounds $y'_n$ at one point.
    Integrating the first-order equation for $y'_n$ with its bounded integrating factor then bounds $y'_n$ on all
    of $\[ - 1 \, 0 \)$. For smooth boundary data $y_n \( 0 \) = chevron.l v_n \, phi.alt chevron.r_2$;
    the same identity and Lipschitz bound pass to $L^2$ data by the preceding approximation.
    Taking the limit first in $n$ and then in $x arrow.t 0$ shows that $U$ has weak boundary trace $v$.
  For an eigenvalue $lambda gt.eq 0$ of $- Delta_(H_oo)$, the two radial roots in (5.8) are
    $frak(d) \( a^(- 2) lambda \)$ and $- 1 - frak(d) \( a^(- 2) lambda \)$.
    The coefficient of the latter root must vanish because $U$ remains sectionally $L^2$-bounded as $x arrow.r -
    oo$. This also excludes the root $- 1$ on constants. The weak trace fixes the remaining coefficient of every
    eigenfunction, so
  $ U \( x \) = exp \[ x frak(d) \( a^(- 2) \( - Delta_(H_oo) \) \) \] v \, wide x lt.eq 0 . $
  Thus $T_(j_n) v_n$ converges strongly to $U \( - 1 \)$. Apply the same argument to the frozen half-cylinder solutions
  $ U_n^0 \( x \) = exp \[ x frak(d) \( b \( j_n \)^(- 2) L \( s \( j_n \) \) \) \] v_n . $
  They have the same sectional bound, the same weak boundary trace limit, and the same frozen limiting equation;
    hence $P_(j_n)^0 v_n = U_n^0 \( - 1 \)$ has the same strong limit.
    If (5.4) failed, one could choose such $v_n$ nearly attaining a fixed positive lower bound for $parallel
    T_(j_n) - P_(j_n)^0 parallel$, contradicting these two strong limits.
    The sequence of controls and starts was arbitrary, which proves the stated uniformity.
  For the finite-frame estimate write $eta_j = eta \( j \)$ and set
  $ ell_j = 4 log \( 1 \/ eta_j \) = 3 log j \, wide epsilon_j = \( 1 + ell_j \) eta_j . $
  Take $J$ late enough that $j - ell_j > 0.8 J$ for every $j gt.eq J$.
    It suffices to check this at $j = J$, since $j - 3 log j$ is increasing for $j > 3$.
    The entire comparison cylinder $\[ j - ell_j \, j + 1 \]$ then lies in the controlled end,
    including the first step. For $phi.alt_j = e_i \( s \( j + 1 \) \)$, let
  $ U_j \( t \) = exp \[ \( t - j - 1 \) frak(d) \( b \( j \)^(- 2) \( - Delta_(H_z \( j \)) \) \) \] phi.alt_j \,
    wide t lt.eq j + 1 . $
  This is the bounded-backward solution of the frozen equation with boundary value $phi.alt_j$.
    The vectors $phi.alt_j$ have uniform smooth norms, and the frozen metrics range over a compact smooth family.
    Applying powers of their Laplacians in the spectral expansion bounds all required spatial and time Sobolev
    norms of $U_j$, uniformly for $t lt.eq j + 1$. Elliptic estimates on the sphere and Sobolev embedding
    therefore give the required uniform pointwise derivative bounds,
    including $parallel U_j \( t \) parallel_oo lt.eq C$.
  On $\[ j - ell_j \, j + 1 \]$, speeds are comparable to $eta_j$.
    By (5.2)–(5.2), the angular coefficients vary from their values at $j$ by $O \( \( 1 + ell_j \) eta_j \)$ in
    every needed spatial norm, and $gamma \( t \) - 1 = O \( eta_j^2 \)$.
    Substituting $U_j$ into the actual operator in (5.7) thus leaves a residual $R_j$ with $parallel R_j
    parallel_oo lt.eq C epsilon_j$. Let $u_j$ be the exact whole-ball extension of $phi.alt_j$, and put $w_j =
    u_j - U_j$ on this cylinder. At $j + 1$ it vanishes. At $j - ell_j$ it is uniformly bounded in sup norm:
    the maximum principle bounds $u_j$ by $parallel phi.alt_j parallel_oo$ throughout its ball,
    independently of every earlier control, and $U_j$ has the bound just obtained.
  For late $J$, $gamma gt.eq 3 \/ 4$. Choose one sufficiently large constant $K$, and define
  $ B_j \( t \) = K epsilon_j \( j + 1 - t \) + K exp \[ - \( t - j + ell_j \) \/ 2 \] . $
  It dominates $\| w_j \|$ at both ends. Since
  $ \( partial_t^2 + gamma partial_t \) B_j = - K gamma epsilon_j +
    K \( 1 \/ 4 - gamma \/ 2 \) exp \[ - \( t - j + ell_j \) \/ 2 \] lt.eq - C epsilon_j \, $
  the comparison principle applied to $B_j + w_j$ and $B_j - w_j$ [8] Theorem 3.3, p. 33 gives
  $ parallel w_j \( j \) parallel_2 lt.eq parallel w_j \( j \) parallel_oo lt.eq
    C \( epsilon_j + e^(- ell_j \/ 2) \) = O (eta_j log \( 1 \/ eta_j \) + eta_j^2) . $
  The last expression divided by $delta_j = eta_j^(3 \/ 4)$ tends to zero. This proves (5.5).
    Only the local coefficient bounds entered the residual; the whole-ball maximum principle absorbed the entire
    earlier history into the bounded left discrepancy. ◻
]

=== 5.2 An invariant graph above the finite angular cluster <an-invariant-graph-above-the-finite-angular-cluster>

Let $iota_j : bb(R)^p arrow.r L^2 \( mu \)$ be the isometry $iota_j c = sum_i c_i e_i \( s \( j \) \)$.
  Write $E_j = iota_j bb(R)^p$, let $Pi_j$ be its orthogonal projection, and set $Q_j = E_j^perp$.
  We use the continued frame to write the four blocks of $T_j$ as

$ T_(L L) = iota_j^(*) T_j iota_(j + 1) \, & T_(L Q) = iota_j^(*) T_j \|_(Q_(j + 1)) \,\
T_(Q L) = \( I - Pi_j \) T_j iota_(j + 1) \, & T_(Q Q) = \( I - Pi_j \) T_j \|_(Q_(j + 1)) . $

Finally put

$ d_i \( j \) = frak(d) \( b \( j \)^(- 2) lambda_i \( s \( j \) \) \) \, wide alpha_i \( j \) =
  e^(d_i \( j \)) \, wide tau_j = min_(i lt.eq p) alpha_i \( j \)^(- 1) . $

There is a start-independent lower bound

$ tau_(*) := inf_(s gt.eq 0 \, med b in \[ a \, 1 \]\
i lt.eq p) e^(- frak(d) \( b^(- 2) lambda_i \( s \) \)) > 0 \, wide tau_j gt.eq tau_(*) \, $

because $p$ and the periodically repeated angular family are fixed. It may be very small for the chosen $k$.

#thm([Proposition 5.2.])[
  (Invariant spaces for the exact Dirichlet maps).  #emph[After increasing $J$,
    there is a fixed $kappa < 1$ such that, uniformly in the controls,
#[#set math.equation(numbering: n => "(5.9)")
 $ T_(Q L) & = O \( delta_j \) \, & T_(L L) & = "diag" \( alpha_i \( j \)^(- 1) \) + O \( delta_j \) \,\
T_(L Q) & = o \( 1 \) \, & parallel T_(Q Q) parallel & lt.eq kappa tau_j . $ <n:eq-transfer-blocks>]

 There is a unique family of graph maps $V_j : bb(R)^p arrow.r Q_j$,
   among families in one fixed sufficiently small operator ball, such that $T_j$ maps
$ "graph"_(j + 1) V_(j + 1) = { iota_(j + 1) c + V_(j + 1) c : c in bb(R)^p } $

 isomorphically onto $"graph"_j V_j$. They satisfy $parallel V_j parallel lt.eq C delta_j$.
   For each fixed $j$, $V_j$ is continuous in operator norm as a function of the complete control sequence with
   its countable product topology. The outward matrix on these spaces is
#[#set math.equation(numbering: n => "(5.10)")
 $ A_j = \( T_(L L) + T_(L Q) V_(j + 1) \)^(- 1) = "diag" \( alpha_i \( j \) \) + O \( delta_j \) \, wide
   T_(L Q) V_(j + 1) = o \( delta_j \) . $ <n:eq-exact-outward>]

 It too is continuous in the product topology.]
] <n:prop-exact-graphs>

#proof[
  The frame moves by $O \( eta \( j \) \) = o \( delta_j \)$ over one step.
    The perturbed first-$p$ spectral projection $Pi_j^(*)$ for $H_z \( j \)$ satisfies $parallel Pi_j^(*) -
    Pi_j parallel = O \( delta_j \)$: apply the isolated-cluster projection formula to (5.2) and (5.1).
    This assertion concerns the entire cluster, so internal double crossings cause no loss.
    Since $P_j^(*)$ preserves $Pi_j^(*)$, its action on the reference frame has high component $O \( delta_j \)$.
    Smooth finite-cluster functional calculus gives its low block as $"diag" \( alpha_i \( j \)^(- 1) \) +
    O \( delta_j \)$. The finite-frame estimate (5.5), together with frame movement,
    proves the first two bounds in (5.9).
  The other two blocks need only (5.4). The reference operator $P_j^0$ preserves $E_j$ and $Q_j$;
    replacing $Q_(j + 1)$ by $Q_j$ costs $O \( eta \( j \) \)$. Hence $T_(L Q) = o \( 1 \)$.
    The gap (5.1) and strict monotonicity of $frak(d)$ give a fixed $kappa_(upright("ref")) < 1$ such that
  $ parallel P_j^0 \|_(Q_j) parallel lt.eq kappa_(upright("ref")) tau_j . $
  Indeed the difference between $frak(d) \( b^(- 2) lambda_(p + 1)^(upright("ord")) \)$ and the largest low
    frequency has a positive minimum over the compact phase and $b in \[ a \, 1 \]$.
    Choose $kappa_(upright("ref")) < kappa < 1$. The absolute $o \( 1 \)$ error in (5.4) and the frame movement
    can be absorbed into $\( kappa - kappa_(upright("ref")) \) tau_j$ because $tau_j gt.eq tau_(*) > 0$.
    This is where fixing $p$ before $J$ is essential.
  For $V : bb(R)^p arrow.r Q_(j + 1)$ in a fixed small operator ball, define
  $ M_j \( V \) = T_(L L) + T_(L Q) V \, wide cal(F)_j \( V \) = \( T_(Q L) + T_(Q Q) V \) M_j \( V \)^(- 1) . $
  If $D_j = "diag" \( alpha_i \( j \)^(- 1) \)$, the relative perturbation
  $ parallel D_j^(- 1) \( M_j \( V \) - D_j \) parallel lt.eq
    tau_(*)^(- 1) #scale(x: 120%, y: 120%)[\(] O \( delta_j \) +
    o \( 1 \) parallel V parallel #scale(x: 120%, y: 120%)[\)] $
  tends uniformly to zero. Thus $M_j \( V \)$ is invertible and $parallel M_j \( V \)^(- 1) parallel lt.eq
    tau_j^(- 1) \( 1 + o \( 1 \) \)$ throughout that ball. In particular $parallel cal(F)_j \( 0 \) parallel lt.eq
    C delta_j$. The inverse-difference identity gives
  $ cal(F)_j \( V \) - cal(F)_j \( W \) =  & T_(Q Q) \( V - W \) M_j \( V \)^(- 1)\
 & + \( T_(Q L) + T_(Q Q) W \) #scale(x: 120%, y: 120%)[\(] M_j \( V \)^(- 1) -
   M_j \( W \)^(- 1) #scale(x: 120%, y: 120%)[\)] \,\
M_j \( V \)^(- 1) - M_j \( W \)^(- 1) =  & - M_j \( V \)^(- 1) T_(L Q) \( V - W \) M_j \( W \)^(- 1) . $
  The first term has Lipschitz constant at most $kappa + o \( 1 \)$.
    The second has constant $o \( 1 \)$, since the ball is fixed, $tau_(*) > 0$, and $T_(L Q) = o \( 1 \)$.
    Choose $kappa < kappa_0 < 1$, and then take $J$ late enough that every $cal(F)_j$ has Lipschitz constant at
    most $kappa_0$. Increasing $J$ once more makes $parallel cal(F)_j \( 0 \)
    parallel$ smaller than $\( 1 - kappa_0 \)$ times the ball radius, so every transform maps that ball into itself.
  For an outer cut $N$, start with $V_N^(\[ N \]) = 0$ and iterate $V_j^(\[ N \]) =
    cal(F)_j \( V_(j + 1)^(\[ N \]) \)$ inward. At a fixed $j$,
    two terminal choices at $N$ differ by at most $C kappa_0^(N - j)$, uniformly in every control.
    Thus $V_j^(\[ N \])$ converges uniformly as $N arrow.r oo$ to $V_j$, and
  $ V_j = cal(F)_j \( V_(j + 1) \) \, wide parallel V_j parallel lt.eq
    C sum_(m gt.eq 0) kappa_0^m delta_(j + m) lt.eq C' delta_j . $
  The last inequality uses that $delta_j$ decreases. The same contraction proves uniqueness among graph families
    in the chosen ball. The fixed graph equation says exactly that
  #[#set math.equation(numbering: n => "(5.11)")
   $ T_j \( iota_(j + 1) c + V_(j + 1) c \) = iota_j M_j \( V_(j + 1) \) c +
     V_j M_j \( V_(j + 1) \) c . $ <n:eq-graph-identity>]
  Invertibility of $M_j \( V_(j + 1) \)$ proves the graph isomorphism.
    Moreover $T_(L Q) V_(j + 1) = o \( 1 \) O \( delta_(j + 1) \) = o \( delta_j \)$;
    inversion of the finite low matrix yields (5.10).
  We give the continuity argument because it uses less than operator-norm continuity of $T_j$ on all of $L^2$.
    For fixed $ell$, the metric on the compact ball of radius $e^(ell + 1)$ depends on only the finitely many
    controls whose bumps meet that ball. For fixed smooth boundary data,
    choose one smooth extension into the ball. For a fixed $0 < alpha < 1$, let $X =
    { v in C^(2 \, alpha) \( overline(B) \) : v \|_(partial B) = 0 }$.
    The remaining zero-boundary problem is an equation for the Dirichlet operator $cal(L)_z : X arrow.r
    C^alpha \( overline(B) \)$, which is bijective by the classical Dirichlet theorem [8] Theorem 6.14, p. 107.
    Its inverse is bounded by the bounded inverse theorem. Converging controls make these operators converge in
    norm between the indicated Hölder spaces. A Neumann series and the inverse-difference identity then give
    convergence of the solutions and of their inner traces. Approximation by smooth data and the contraction bound gives
  $ T_ell \( z_n \) v arrow.r T_ell \( z \) v quad upright("in ") L^2 quad upright("for every fixed ") v in L^2 . $
  This is strong continuity. Suppose now that finite-rank graph maps $V_n : bb(R)^p arrow.r
    Q_(ell + 1)$ converge to $V$ in operator norm. For each coordinate basis vector $upright(bold(e))$,
  $ parallel T_ell \( z_n \) V_n upright(bold(e)) - T_ell \( z \) V upright(bold(e)) parallel_2 & lt.eq
    parallel T_ell \( z_n \) \( V_n upright(bold(e)) - V upright(bold(e)) \) parallel_2 +
    parallel \( T_ell \( z_n \) - T_ell \( z \) \) V upright(bold(e)) parallel_2\
 & lt.eq parallel V_n upright(bold(e)) - V upright(bold(e)) parallel_2 +
   parallel \( T_ell \( z_n \) - T_ell \( z \) \) V upright(bold(e)) parallel_2 arrow.r 0 . $
  The same statement holds on the fixed low basis vectors $iota_(ell + 1) upright(bold(e))$.
    A finite basis therefore gives operator-norm continuity for precisely the maps from $bb(R)^p$ that enter
    $cal(F)_ell$. Their low inverses are finite matrices with the uniform inverse bound already proved,
    so inversion is continuous. Induction shows that each finite inward graph iterate is continuous in the
    finitely many controls on its finitely many balls. Its error from $V_j$ is at most $C kappa_0^(N - j)$,
    uniformly over the complete control product. Given an error tolerance,
    first choose $N$ for this tail and then require closeness of those finitely many controls.
    This proves product-topology continuity of $V_j$. The same finite-rank estimate and finite-matrix inversion
    prove continuity of $A_j$. In particular the argument includes the dependence on earlier controls and the
    graph’s dependence on arbitrarily late controls; it asserts no unnecessary norm continuity for $T_j$ on the
    infinite-dimensional space. ◻
]

=== 5.3 The coefficient changed by a crossing control <the-coefficient-changed-by-a-crossing-control>

At a crossing we continue to use the reference frame. Individual eigenvectors of the perturbed link can rotate
  substantially at a double eigenvalue, so they would not provide coordinates for a uniform first-order calculation.

#thm([Proposition 5.3.])[
  (Signed off-diagonal entry).  #emph[Suppose the reference lines $i eq.not
    h$ have an isolated linearly split double crossing at $s_nu$, with positive eigenvalue $lambda$.
    For $L \( w \) = - Delta_(h \( w \))$, let
$ dot(L)_nu \( s \) = frac(d, d epsilon.alt)\|_(epsilon.alt = 0) L \( w \( s \) + epsilon.alt psi_nu \) \, wide
  chevron.l e_h \( s_nu \) \, dot(L)_nu \( s_nu \) e_i \( s_nu \) chevron.r_2 eq.not 0 . $

 Write $eta_nu = eta \( t_nu \)$, where $s \( t_nu \) = s_nu$.
   Choose the fixed bump plateau inside a sufficiently small neighborhood of $s_nu$.
   For every mesh point whose phase is on that plateau,
#[#set math.equation(numbering: n => "(5.12)")
 $ \( A_j \)_(h i) = z_nu eta_nu^(3 \/ 4) m_(h i) \( s \( j \) \, b \( j \) \) + o \( delta_j \) \,
   $ <n:eq-off-diagonal-outward>]

 uniformly over all controls, past and future. The continuous coefficient $m_(h i)$ has a fixed nonzero sign and a
   positive lower bound in absolute value on this neighborhood for $b$ near $a$.
   At the crossing, with $beta = b^(- 2)$ and $alpha = e^(frak(d) \( beta lambda \))$, it is
#[#set math.equation(numbering: n => "(5.13)")
 $ m_(h i) \( s_nu \, b \) = alpha thin beta thin frak(d)' \( beta lambda \) chevron.l e_h \( s_nu \) \,
   dot(L)_nu \( s_nu \) e_i \( s_nu \) chevron.r_2 . $ <n:eq-crossing-leading-coefficient>]

 The reversed entry has the same nonzero coefficient at the crossing.]
] <n:prop-outward-crossing>

#proof[
  Fix such a mesh point and temporarily write $beta = b \( j \)^(- 2)$ and $epsilon.alt = z_nu eta_nu^(3 \/ 4)$.
    On the plateau the only active perturbation is $L_epsilon.alt = L \( w \( s \( j \) \) + epsilon.alt psi_nu \)$. Put
  $ q_beta \( x \) = e^(frak(d) \( beta x \)) \, wide p_beta \( x \) = q_beta \( x \)^(- 1) . $
  Let $Pi_epsilon.alt$ be the isolated first-$p$ projection and $Pi = Pi_0$.
    The compression to $E = Pi L^2$ of the frozen inward operator is $C_(-) \( epsilon.alt \) =
    Pi p_beta \( L_epsilon.alt \) Pi \|_E$. Its part passing through the high subspace $I -
    Pi_epsilon.alt$ is $O \( epsilon.alt^2 \)$: the input and output projections each have norm
    $O \( epsilon.alt \)$, while $p_beta \( L_epsilon.alt \)$ is a contraction.
    The remaining part is a smooth finite-cluster matrix. Differentiating it in the reference eigenbasis gives
  $ \( C'_(-) \( 0 \) \)_(h i) = p_beta \[ lambda_h \( s \( j \) \) \, lambda_i \( s \( j \) \) \] chevron.l
    e_h \( s \( j \) \) \, dot(L)_nu \( s \( j \) \) e_i \( s \( j \) \) chevron.r_2 \, $
  where $q \[ x \, y \] = \( q \( x \) - q \( y \) \) \/ \( x - y \)$ for $x eq.not y$,
    with the continuous extension $q \[ x \, x \] = q' \( x \)$, and the same notation is used for $p_beta$.
    This is the derivative of the entire isolated cluster matrix, including at a double eigenvalue.
  At $epsilon.alt = 0$, $C_(-) \( 0 \)$ is diagonal with entries $p_beta \( lambda_i \)$.
    Differentiating its inverse and using
  $ - q_beta \( x \) q_beta \( y \) p_beta \[ x \, y \] = q_beta \[ x \, y \] $
  shows that the off-diagonal derivative of $C_(-) \( epsilon.alt \)^(- 1)$ is
  $ q_beta \[ lambda_h \( s \( j \) \) \, lambda_i \( s \( j \) \) \] chevron.l e_h \( s \( j \) \) \,
    dot(L)_nu \( s \( j \) \) e_i \( s \( j \) \) chevron.r_2 . $
  This defines $m_(h i) \( s \( j \) \, b \( j \) \)$. At equality of the eigenvalues,
  $ q'_beta \( lambda \) = e^(frak(d) \( beta lambda \)) beta thin frak(d)' \( beta lambda \) \, $
  which proves (5.13). The factor $beta$ occurs exactly once, from differentiating $q_beta$;
    there is no extra $beta$ in front of its divided difference.
    The divided difference is continuous across equality. The nonzero angular entry therefore permits a fixed
    neighborhood on which its product has one sign and is bounded away from zero, uniformly for $b$ near $a$.
    Self-adjointness of $dot(L)_nu$ in the fixed real Hilbert space makes the reversed first-order entry equal at
    the crossing.
  The finite-cluster Taylor remainder is $O \( epsilon.alt^2 \)$, uniformly in the fixed phase neighborhood.
    Replacing the frame at $j + 1$ by that at $j$ costs $O \( eta \( j \) \)$.
    Lemma 10 replaces the frozen inward map on this frame by $T_j$ with $o \( delta_j \)$ error,
    and Proposition 11 contributes only $T_(L Q) V_(j + 1) = o \( delta_j \)$.
    The inverses involved are finite matrices with a uniform bound depending on the fixed $tau_(*) > 0$;
    hence these errors remain of the same order after inversion.
    A fixed phase neighborhood has time width $O \( eta_nu^(- 1) \) = o \( t_nu \)$,
    so $eta \( j \) \/ eta_nu arrow.r 1$ uniformly there as the start tends to infinity.
    Thus $O \( epsilon.alt^2 \) = O \( delta_j^2 \) = o \( delta_j \)$, and the stated expansion follows.
    The remainders are uniform in every other control because the frozen calculation is local,
    the frame comparison is uniform over whole-ball histories,
    and the graph estimate is uniform over all future tails. ◻
]

== 6 Scalar matching at all crossings <n:sec-matching-growth>

The invariant graph expresses the high angular component through the low coordinates,
  reducing exact continuation to a finite-dimensional system.
  It has not yet produced a line that follows each continued reference label.
  We now choose all crossing controls simultaneously so that those lines are exactly invariant.
  The next section will turn their compatible traces into entire harmonic functions.

Proposition 8 supplies isolated, linearly split doubles with finitely repeated crossing types and a positive
  minimum phase separation. Recall that $N = p - B_L$ is the band size, and set $P_(upright("lab")) = N S$,
  the common eigenvalue period. The continued frequencies and their means are

#[#set math.equation(numbering: n => "(6.1)")
 $ Theta_i \( s \) = frak(d) \( a^(- 2) lambda_i \( s \) \) \, $ <n:eq-continued-frequency>]

#[#set math.equation(numbering: n => "(6.2)")
 $ m_i = 1 / P_(upright("lab")) integral_0^(P_(upright("lab"))) Theta_i \( s \) thin d s < k
   wide \( 1 lt.eq i lt.eq p \) . $ <n:eq-subcritical-means>]

The functions $Theta_i$ are Lipschitz; their strict mean bound was fixed before the radial construction.
  Each pair either never crosses and has a uniform gap, or its crossings repeat with bounded phase gaps.
  The constant initial phase interval separates the start from the first crossing.

Use the fixed bump choice in which each support is contained in a phase neighborhood where the selected
  coefficient in Proposition 12 has one nonzero sign, and each bump equals one on a smaller fixed neighborhood of
  its crossing. The supports, plateaux, and directions are all fixed before $J$.
  For the fixed $k$ and $p$, Proposition 11 gives

#[#set math.equation(numbering: n => "(6.3)")
 $ A_j = "diag" \( alpha_1 \( j \) \, dots.h \, alpha_p \( j \) \) + cal(E)_j \, wide
   parallel cal(E)_j parallel lt.eq C delta_j \, quad alpha_i \( j \) =
   e^(frak(d) \( b \( j \)^(- 2) lambda_i \( s \( j \) \) \)) . $ <n:eq-matching-matrix>]

The graph maps and these matrices are continuous in the full product of controls.
  At a crossing $nu$ of $i$ and $h$, on its plateau,

#[#set math.equation(numbering: n => "(6.4)")
 $ \( cal(E)_j \)_(h i) = z_nu eta_nu^(3 \/ 4) m_(h i) \( s \( j \) \, b \( j \) \) + o \( delta_j \) \,
   wide \| m_(h i) \( s \( j \) \, b \( j \) \) \| gt.eq c_0 > 0 . $ <n:eq-matching-offdiagonal>]

The sign is fixed there, and the error is uniform with every other control free.
  The analogous formula for the reversed entry is available when that ordering requires the match.
  The common radial factor $b$ is independent of the controls.
  All constants from now on may depend on the fixed finite program and $p$;
  increasing $J$ never changes those data. We denote auxiliary positive lower-bound constants by $c_(*)$,
  $c'_(*)$, and $c''_(*)$, allowing their values to change between estimates.

=== 6.1 One scalar obstruction at each crossing <one-scalar-obstruction-at-each-crossing>

Write $upright(bold(e))_i$ for the $i$-th coordinate vector of $bb(R)^p$;
  the functions $e_i \( s \( j \) \)$ are recovered through the frame map $iota_j$. For each $i$, seek a column

$ v_i \( j \) = upright(bold(e))_i + sum_(h eq.not i) u_(h i) \( j \) upright(bold(e))_h . $

For the moment all column coordinates and controls are independent variables in the boxes

#[#set math.equation(numbering: n => "(6.5)")
 $ \| u_(h i) \( j \) \| lt.eq eta \( j \)^(1 \/ 8) quad \( h eq.not i \, med j gt.eq J \) \,
   wide \| z_nu \| lt.eq 1 . $ <n:eq-matching-boxes>]

Since $A_j = "diag" \( alpha_i \( j \) \) + O \( delta_j \)$, the coordinate $\( A_j v_i \( j \) \)_i =
  alpha_i \( j \) + O \( delta_j \)$ is positive on all these boxes for late $J$. We may therefore divide by it.
  The line spanned by $v_i \( j \)$ is carried by $A_j$ to the line spanned by $v_i \( j + 1 \)$ exactly when

#[#set math.equation(numbering: n => "(6.6)")
 $ u_(h i) \( j + 1 \) = r_(h i) \( j \) u_(h i) \( j \) + F_(h i) \( j \) \, wide r_(h i) \( j \) =
   frac(alpha_h \( j \), alpha_i \( j \)) \, $ <n:eq-matching-recursion>]

where

#[#set math.equation(numbering: n => "(6.7)")
 $ F_(h i) \( j \) = frac(\( A_j v_i \( j \) \)_h, \( A_j v_i \( j \) \)_i) -
   r_(h i) \( j \) u_(h i) \( j \) . $ <n:eq-matching-force>]

Here is the force explicitly. Suppress the index $j$ in the next display and write
  $cal(E)_(h ell) = \( cal(E)_j \)_(h ell)$. Direct expansion of (6.7) gives

#[#set math.equation(numbering: n => "(6.8)")
 $ F_(h i) =
   frac(cal(E)_(h i) + sum_(ell eq.not i) cal(E)_(h ell) u_(ell i) - r_(h i) u_(h i) (cal(E)_(i i) + sum_(ell
   eq.not i) cal(E)_(i ell) u_(ell i)), alpha_i + cal(E)_(i i) + sum_(ell eq.not i) cal(E)_(i ell) u_(ell i)) .
   $ <n:eq-expanded-force>]

The $alpha_i$’s and their ratios stay in a fixed compact positive interval because $p$ is fixed. Thus

#[#set math.equation(numbering: n => "(6.9)")
 $ \| F_(h i) \( j \) \| lt.eq C_1 delta_j $ <n:eq-force-bound>]

uniformly on the whole product. This estimate uses the exact cancellation of the diagonal reference matrix in the force.

At a crossing of this pair, take $z_nu = 1$ or $- 1$. On its plateau, (6.8) and (6.4) yield

#[#set math.equation(numbering: n => "(6.10)")
 $ F_(h i) \( j \) = z_nu eta_nu^(3 \/ 4) frac(m_(h i) \( s \( j \) \, b \( j \) \), alpha_i \( j \)) +
   o \( delta_j \) . $ <n:eq-force-sign>]

Every numerator term involving a column coordinate is $O \( delta_j eta \( j \)^(1 \/ 8) \)$;
  replacing the denominator by $alpha_i \( j \)$ costs $O \( delta_j^2 \)$. Both are $o \( delta_j \)$.
  On a fixed plateau $eta \( j \) \/ eta_nu arrow.r 1$ uniformly,
  so the leading term in (6.10) has a strict constant sign and magnitude at least $c_1 eta_nu^(3 \/ 4)$,
  after one late choice of $J$. This holds with all other controls and all column variables free in their boxes.

The sign of the scalar ratio is determined solely by the reference eigenvalues:

#[#set math.equation(numbering: n => "(6.11)")
 $ "sign" log r_(h i) \( j \) = "sign" #scale(x: 120%, y: 120%)[\(] lambda_h \( s \( j \) \) -
   lambda_i \( s \( j \) \) #scale(x: 120%, y: 120%)[\)] . $ <n:eq-ratio-sign>]

Indeed the same positive factor $b \( j \)^(- 2)$ enters both frequencies and $frak(d)$ is strictly increasing.
  The zeros are simple in phase. For every crossing of this ordered pair, cut the integer mesh at

$ N_nu = ceil.l t_nu ceil.r . $

A step $j < N_nu$ begins before the crossing; a step $j gt.eq N_nu$ begins at or after it.
  In particular the step $N_nu - 1$ uses the pre-crossing ratio even if the crossing lies inside that step.
  If $t_nu$ is an integer, the ratio of the single step beginning there is one.
  The estimates below allow this neutral step.

When $r_(h i) < 1$, (6.6) is stable forward in $j$; when $r_(h i) > 1$, it is stable backward.
  At a cut $N = N_nu$, the two sign changes therefore have different roles:

$ upright("sign change of ") log r_(h i) & upright("stable directions") & upright("condition at the cut")\
+ med arrow.r med - & arrow.l med N med arrow.r & upright("prescribe ") u_(h i) \( N \) = 0 \,\
- med arrow.r med + & arrow.r med N med arrow.l & upright("match the incoming values") . $

Reversing the ordered pair replaces $r_(h i)$ by $r_(i h) = r_(h i)^(- 1)$, interchanging the two rows.
  Thus a double crossing creates exactly one scalar matching condition, although both columns pass through it.

Call the first type a #emph[zero cut]. At a negative-to-positive cut $N$, two stable propagations arrive.
  If $a < N < b$ are the adjacent zero cuts, the values coming forward from $a$ and backward from $b$ are respectively

#[#set math.equation(numbering: n => "(6.12)")
 $ u_N^(-) & = sum_(q = a)^(N - 1) F_(h i) \( q \) product_(ell = q + 1)^(N - 1) r_(h i) \( ell \) \,\
u_N^(+) & = - sum_(q = N)^(b - 1) F_(h i) \( q \) product_(ell = N)^q r_(h i) \( ell \)^(- 1) . $ <n:eq-forward-trial>]

If the initial interval is forward stable, use $a = J$ and trial value zero there.
  If it is backward stable, propagate backward from its first zero cut.
  A pair that never crosses has a uniform strict ratio gap:
  use zero at $J$ in the forward-stable case, and the convergent backward sum from infinity in the backward-stable
  case. A pair that does cross has infinitely many alternating cuts with bounded phase gaps,
  so its other propagations are finite.

The obstruction at a negative-to-positive cut is the mismatch

#[#set math.equation(numbering: n => "(6.13)")
 $ D_nu = u_N^(-) - u_N^(+) =  & sum_(q = a)^(N - 1) W_(q \, N)^(-) F_(h i) \( q \) +
   sum_(q = N)^(b - 1) W_(N \, q)^(+) F_(h i) \( q \) \,\
W_(q \, N)^(-) =  & product_(ell = q + 1)^(N - 1) r_(h i) \( ell \) > 0 \, wide W_(N \, q)^(+) =
  product_(ell = N)^q r_(h i) \( ell \)^(- 1) > 0 . $ <n:eq-matching-mismatch>]

Both weight families are positive because the backward formula has a minus sign.
  This is the scalar matching condition assigned to crossing $nu$.

Near a simple crossing, summing the linearly vanishing gap gives Gaussian decay of the stable products,
  with effective length $eta_nu^(- 1 \/ 2)$. Forcing of size $eta_nu^(3 \/ 4)$ therefore gives the scale
  $eta_nu^(- 1 \/ 2) eta_nu^(3 \/ 4) = eta_nu^(1 \/ 4)$, which fits inside the coordinate box of radius
  $eta_nu^(1 \/ 8)$. The next lemma proves these estimates uniformly and shows that the weighted sum retains the
  sign imposed by the control.

#thm([Lemma 6.1.])[
  (Stable weights and the sign of a mismatch).  #emph[For all sufficiently late $J$,
    every trial coordinate defined above satisfies, uniformly on the full product of boxes,
#[#set math.equation(numbering: n => "(6.14)")
 $ \| u_(h i)^(upright("trial")) \( j \) \| lt.eq C eta \( j \)^(1 \/ 4) < eta \( j \)^(1 \/ 8) . $ <n:eq-trial-small>]

 Orient the coordinate $z_nu$ once according to the sign of its selected coefficient. Each mismatch then satisfies
#[#set math.equation(numbering: n => "(6.15)")
 $ D_nu \|_(z_nu = 1) gt.eq c_(*) eta_nu^(1 \/ 4) > 0 \, wide D_nu \|_(z_nu = - 1) lt.eq -
   c_(*) eta_nu^(1 \/ 4) < 0 \, $ <n:eq-mismatch-endpoint-signs>]

 independently of every other control and column coordinate.]
] <n:lem-matching-weights>

#proof[
  For a fixed ordered pair define the reference logarithmic ratio at phase $s$ and radial factor $b$ by
  $ ell_(h i) \( s \, b \) = frak(d) \( b^(- 2) lambda_h \( s \) \) - frak(d) \( b^(- 2) lambda_i \( s \) \) . $
  On a sign interval $\[ s_a \, s_b \]$ bounded by successive zeros,
    simple splitting and compactness of the finitely repeated types give
  #[#set math.equation(numbering: n => "(6.16)")
   $ \| ell_(h i) \( s \, b \) \| gt.eq c_(*) min { s - s_a \, s_b - s \, 1 } \, $ <n:eq-ratio-lower>]
  uniformly for $b$ near $a$. Near either endpoint there is also the upper bound $C$ times the distance to that
    endpoint. The lower bound follows near a zero from its nonzero phase derivative and away from all zeros from
    compactness. The common radial factor does not alter the zeros,
    and $frak(d)'$ has positive upper and lower bounds on the finite spectral range.
    The phase lengths of these intervals have positive lower and finite upper bounds.
    Initial intervals are merely truncated subsets of a sign interval for the periodic reference data,
    so the same estimates apply to them after periodically extending the reference data for this comparison.
  Over a bounded phase interval, the elapsed time is $O \( t^(3 \/ 4) \) = o \( t \)$.
    Thus the speed at every point of one such interval is comparable to a single value $eta_(*)$,
    with relative error tending to zero as $J$ increases. Consecutive mesh phases are separated by comparable
    multiples of $eta_(*)$. Consider a stable product over $m$ consecutive steps inside the interval.
    Apart from a bounded number of endpoint rounding steps, at least a fixed fraction of those phases have
    distance at least $c_(*) eta_(*) m$ from both endpoints. To see this,
    phases within distance $d$ of the two endpoints number at most $C \( d \/ eta_(*) + 1 \)$; choose $d =
    c'_(*) eta_(*) m$ with $c'_(*)$ small. Since $eta_(*) m$ is bounded by the fixed maximum phase length,
    $min { d \, 1 } gt.eq c''_(*) eta_(*) m$. Summing (6.16) along the product therefore gives
  $ sum \| log r_(h i) \| gt.eq c_(*) eta_(*) m^2 - C . $
  The sign in a stable direction makes the product the exponential of the negative of this sum.
    The one-step ceiling convention, including a possible neutral step, only changes the constant.
    Every stable weight therefore obeys
  #[#set math.equation(numbering: n => "(6.17)")
   $ W \( m \) lt.eq C e^(- c_(*) eta_(*) m^2) \, wide sum_(m gt.eq 0) W \( m \) lt.eq
     C eta_(*)^(- 1 \/ 2) . $ <n:eq-gaussian-green>]
  The second estimate follows by comparison with the Gaussian integral.
  On a switching interval, $delta_q$ is comparable to $eta_(*)^(3 \/ 4)$.
    Combining (6.9) with the Green sum in (6.17) bounds every stable trial propagation by $C eta_(*)^(3 \/ 4)
    eta_(*)^(- 1 \/ 2) = C eta_(*)^(1 \/ 4)$, which is comparable to $eta \( j \)^(1 \/ 4)$ at the output step.
    For a noncrossing pair compactness instead gives a fixed $rho < 1$ with either $r_(h i) lt.eq
    rho$ or $r_(h i)^(- 1) lt.eq rho$ at every step. The backward tail is bounded by $sum_(q = j)^oo C rho^(q - j)
    delta_q lt.eq C' delta_j$, because $delta_q$ decreases. For the forward sum,
    whose initial interval can be arbitrarily long, use
  $ delta_q / delta_j = \( j \/ q \)^(9 \/ 16) lt.eq \( 1 + j - q \)^(9 \/ 16) wide \( J lt.eq q lt.eq j \) . $
  It follows that
  $ sum_(q = J)^(j - 1) rho^(j - 1 - q) delta_q lt.eq delta_j sum_(m gt.eq 0) rho^m \( m + 2 \)^(9 \/ 16) lt.eq
    C' delta_j . $
  This is also bounded by $C eta \( j \)^(1 \/ 4)$. Finally $C eta^(1 \/ 4) < eta^(1 \/ 8)$ once $J$ is late,
    proving (6.14).
  For the sign at the crossing $nu$, take a fixed small $theta > 0$ and the mesh window
  $ \| j - t_nu \| lt.eq theta eta_nu^(- 1 \/ 2) . $
  Its phase width is $O \( theta eta_nu^(1 \/ 2) \)$, so the window lies inside the fixed plateau for late $J$.
    The upper linear bound on $\| ell_(h i) \|$ near the zero shows that an incoming weight from any index in this
    window is at least $exp \( - C theta^2 \)$: the sum of its logarithmic losses is at most $C eta_nu
    sum_(m lt.eq theta eta_nu^(- 1 \/ 2)) \( m + 1 \)$. The two incoming sides together contain at least $c_(*)
    eta_nu^(- 1 \/ 2)$ such indices. At $z_nu = plus.minus 1$,
    all their forces have the sign in (6.10) and magnitude at least $c_1 eta_nu^(3 \/ 4)$.
    Their contribution to (6.13) has that sign and magnitude at least $c_2 eta_nu^(1 \/ 4)$.
  Every other term on the plateau has the same sign. Outside the fixed plateau the phase distance to the crossing
    is bounded below by a positive constant. Its incoming weight contains a stable segment of length $c_(*)
    eta_nu^(- 1)$; (6.17) bounds the weight by $C e^(- c'_(*) \/ eta_nu)$.
    The two adjacent switching intervals contain at most $C eta_nu^(- 1)$ indices,
    and their forces are $O \( eta_nu^(3 \/ 4) \)$. Their total contribution outside the plateau is therefore at most
  $ C eta_nu^(- 1 \/ 4) e^(- c'_(*) \/ eta_nu) = o \( eta_nu^(1 \/ 4) \) . $
  For a truncated initial interval, separation of the start from the first crossing places the central window
    after $J$ for late starts. Deleting earlier terms does not change its signed lower bound,
    and the retained outside-plateau terms satisfy the same tail estimate.
    The sign from the central window dominates. Reverse the orientation of $z_nu$ when needed so that its positive
    endpoint gives positive mismatch. Uniformity of (6.10) over every other variable yields (6.15). ◻
]

=== 6.2 Simultaneous matching <simultaneous-matching>

Consider the countable product $cal(X)$ of the intervals in (6.5), with its product topology.
  Given a point of $cal(X)$, compute the forces from (6.7), and then compute every stable trial propagation.
  At a cut with two incoming values, use the forward value as the output $u$-coordinate. For each control use the output

#[#set math.equation(numbering: n => "(6.18)")
 $ z_nu mapsto Pi_(\[ - 1 \, 1 \]) \( z_nu - D_nu \) \, $ <n:eq-control-clamp>]

where $Pi_(\[ - 1 \, 1 \])$ is interval projection. Lemma 13 puts each trial coordinate strictly inside its box,
  and the projection puts each control inside its interval. These rules define a self-map $Phi : cal(X) arrow.r cal(X)$.

This map is continuous in product topology. For a fixed $j$,
  $A_j$ is continuous in the control product by Proposition 11,
  and the force at that step depends on only finitely many column variables through a denominator bounded away
  from zero. Hence each force is continuous. A finite trial propagation or mismatch is a finite expression in such
  forces. In the only infinite case, a backward propagation for a noncrossing pair,
  the geometric tail is uniformly summable on $cal(X)$. Its output is therefore a uniform limit of continuous
  finite sums. Each output coordinate of $Phi$ is continuous, as required for the product topology.

We can obtain a fixed point using only finite-dimensional Brouwer and a diagonal limit.
  Enumerate the coordinates of $cal(X)$. Freeze those after the first $N$ at their box centers and apply Brouwer
  to the first $N$ output coordinates; this gives a point $x^(\[ N \]) in
  cal(X)$ whose first $N$ coordinates satisfy their fixed-point equations.
  By repeated subsequence extraction in the compact coordinate intervals,
  choose a subsequence converging in every coordinate to $x in cal(X)$.
  For any fixed coordinate, its fixed-point equation holds for all sufficiently large members of the subsequence.
  Continuity of that output coordinate passes the equation to the limit. Thus $Phi \( x \) = x$.

At a fixed point, no control can equal $1$: by (6.15), the argument $1 -
  D_nu$ of (6.18) is strictly less than $1$, so its projection is less than $1$.
  Likewise a control equal to $- 1$ would have projected image greater than $- 1$.
  Every fixed control is interior, where $z_nu = Pi_(\[ - 1 \, 1 \]) \( z_nu - D_nu \)$ forces $D_nu = 0$.
  At each two-valued cut the forward trial value consequently equals the backward one.
  Away from cuts the trial propagations already obey (6.6); at zero cuts they share the prescribed zero.
  The fixed point therefore satisfies every scalar recurrence exactly at every step.

Fix this control sequence and write $g = g_z$. Define the positive line multiplier

$ sigma_i \( j \) = \( A_j v_i \( j \) \)_i = alpha_i \( j \) + O \( delta_j \) > 0 . $

The recurrences and the normalization of the $i$-th coordinate give

#[#set math.equation(numbering: n => "(6.19)")
 $ A_j v_i \( j \) = sigma_i \( j \) v_i \( j + 1 \) . $ <n:eq-exact-lines>]

The $p$ columns form a basis for late $J$: their matrix is the identity plus a matrix of norm
  $O \( p eta \( j \)^(1 \/ 8) \) < 1$. This is one basis for each step of one metric;
  the control sequence is common to all labels.

== 7 Entire harmonic functions and growth at every radius <n:sec-growth>

We use the one control sequence selected in Section 6. For its metric $g = g_z$,
  the exact outward maps satisfy (6.19) with positive multipliers $sigma_i \( j \)$ and independent low columns
  $v_i \( j \)$. First we lift these columns to compatible smooth boundary values on nested balls.
  We then convert the strict phase means into the pointwise degree-$k$ bound.

=== 7.1 Compatible traces and entire functions <compatible-traces-and-entire-functions>

With the graph maps of Proposition 11, let

$ w_i \( j \) = iota_j v_i \( j \) + V_j v_i \( j \) in L^2 \( mu \) . $

Equation (5.11) and $A_j = M_j \( V_(j + 1) \)^(- 1)$ turn (6.19) into

$ T_j w_i \( j + 1 \) = sigma_i \( j \)^(- 1) w_i \( j \) . $

Set

$ c_i \( J \) = 1 \, wide c_i \( j \) = product_(ell = J)^(j - 1) sigma_i \( ell \) \, wide g_i \( j \) =
  c_i \( j \) w_i \( j \) . $

Then $T_j g_i \( j + 1 \) = g_i \( j \)$ for every $j gt.eq J$. These traces initially lie in $L^2$.
  The extension from the next larger ball is smooth at the inner sphere by Lemma 10;
  the transfer identity therefore also shows that each $g_i \( j \)$ is a smooth trace.
  On $B_g \( 0 \, e^j \)$, take its classical harmonic Dirichlet extension [8] Theorem 6.14, p. 107.
  The extension on $B_g \( 0 \, e^(j + 1) \)$ has boundary value $g_i \( j \)$ when restricted to the smaller
  ball, so Dirichlet uniqueness makes the two extensions agree there.
  Their union is a smooth entire harmonic function $U_i$. At the sphere $e^J$,
  its low projection has coordinates $v_i \( J \)$. Those columns are independent, so $U_1 \, dots.h \,
  U_p$ are independent.

=== 7.2 From the phase average to a bound at every point <from-the-phase-average-to-a-bound-at-every-point>

The graph component is orthogonal to the low component. The column boxes and $parallel V_j parallel =
  O \( delta_j \)$ therefore bound $parallel w_i \( j \) parallel_2$ uniformly above and away from zero.
  Since the $alpha_i \( j \)$’s lie in a fixed compact positive interval,

$ log sigma_i \( j \) = log alpha_i \( j \) + O \( delta_j \) = d_i \( j \) + O \( delta_j \) . $

It follows that

#[#set math.equation(numbering: n => "(7.1)")
 $ log parallel g_i \( j \) parallel_2 = sum_(ell = J)^(j - 1) d_i \( ell \) +
   O #h(-0.16667em) (1 + sum_(ell = J)^(j - 1) delta_ell) . $ <n:eq-mesh-log-growth>]

We evaluate the average on the right before passing to pointwise bounds.

For the frequency in (6.1), define a periodic primitive of its mean-zero part by

$ Q_i \( s \) = integral_0^s \( Theta_i \( sigma \) - m_i \) thin d sigma . $

It is bounded because its change over $P_(upright("lab"))$ is zero.
  Since $s' \( t \) = t^(- 3 \/ 4)$, integration by parts gives, for real $T gt.eq J$,

#[#set math.equation(numbering: n => "(7.2)")
 $ integral_J^T \( Theta_i \( s \( t \) \) - m_i \) thin d t & =
   #scale(x: 120%, y: 120%)[\[] t^(3 \/ 4) Q_i \( s \( t \) \) #scale(x: 120%, y: 120%)[\]]_J^T - 3 /
   4 integral_J^T t^(- 1 \/ 4) Q_i \( s \( t \) \) thin d t = O \( T^(3 \/ 4) \) . $ <n:eq-phase-average>]

The Lipschitz bound on $Theta_i$ makes the error between the integral and its unit-mesh sum at most

$ C sum_(j lt.eq T) eta \( j \) = O \( T^(1 \/ 4) \) . $

On the finite spectral range, $b \( j \) arrow.r a$ and smoothness of $frak(d)$ imply

$ d_i \( j \) - Theta_i \( s \( j \) \) arrow.r 0 $

uniformly in $i$. Its Cesaro mean consequently tends to zero. Finally

$ sum_(j lt.eq T) delta_j = sum_(j lt.eq T) j^(- 9 \/ 16) = O \( T^(7 \/ 16) \) . $

All four errors are sublinear in logarithmic time. Combining them with (7.1) gives

#[#set math.equation(numbering: n => "(7.3)")
 $ lim_(j arrow.r oo) 1 / j log parallel g_i \( j \) parallel_2 = m_i . $ <n:eq-mesh-exponent>]

There are only finitely many labels. By (6.2), choose one number

$ max_(i lt.eq p) m_i < gamma_(*) < k . $

After absorbing the finitely many initial steps into the constants, (7.3) implies

#[#set math.equation(numbering: n => "(7.4)")
 $ parallel g_i \( j \) parallel_2 lt.eq C_i e^(gamma_(*) j) wide \( j gt.eq J \) . $ <n:eq-mesh-bound>]

For any real $t in \[ j \, j + 1 \]$, $U_i$ on the sphere $e^t$ is the restriction of the harmonic extension with
  outer trace $g_i \( j + 1 \)$. The all-radius contraction in Lemma 10 gives

#[#set math.equation(numbering: n => "(7.5)")
 $ parallel U_i \( t \, dot.op \) parallel_2 lt.eq parallel g_i \( j + 1 \) parallel_2 lt.eq
   C'_i e^(gamma_(*) t) . $ <n:eq-all-radius-sphere-bound>]

The same contraction from $e^t$ to $e^j$ gives $parallel g_i \( j \) parallel_2 lt.eq
  parallel U_i \( t \, dot.op \) parallel_2$. Together the two bounds also identify the exact spherical growth exponent:

$ lim_(t arrow.r oo) 1 / t log parallel U_i \( t \, dot.op \) parallel_2 = m_i . $

In particular, the upper estimate holds on every sufficiently large sphere.

The normalized divergence form of (5.7) is uniformly elliptic on cylinders of fixed width,
  with uniformly bounded coefficients in a finite sphere atlas.
  The local $L^2$-to-sup estimate, applied to $U_i$ and $- U_i$ on a cylinder of width four [8] Theorem 8.17,
  p. 194, with $p = 2$, gives a constant independent of large $t$ such that

$ sup_(omega in S^2) \| U_i \( t \, omega \) \| lt.eq
  C (integral_(t - 2)^(t + 2) parallel U_i \( tau \, dot.op \) parallel_2^2 thin d tau)^(1 \/ 2) lt.eq
  C''_i e^(gamma_(*) t) \, $

where the last inequality uses (7.5). The compact core is absorbed into the constant.
  Proposition 9 gives the exact distance identity $d_g \( 0 \, \( r \, omega \) \) = r = e^t$.
  Since $gamma_(*) < k$, we conclude

$ \| U_i \( x \) \| lt.eq C'''_i \( 1 + d_g \( 0 \, x \) \)^k wide upright("for every ") x in bb(R)^3 . $

The single metric fixed at the product fixed point therefore has at least $p = \( M + 1 \)^2$ independent members
  of $cal(H)_k \( bb(R)^3 \, g \)$. Since $p \/ \( k + 1 \)^2 arrow.r theta.alt^2 > c$,
  this is at least $c \( k + 1 \)^2$ for all sufficiently large $k$.
  The construction was made for the chosen sufficiently large $k$; no common metric for all degrees is asserted.

#proof[
  #emph[Completion of Theorem 1.] Given $4 \/ 9 < v < 1$ and $1 < c < 9 v \/ 4$, set $a = sqrt(v)$,
    choose $sqrt(c) < theta.alt < 3 a \/ 2$, and then choose $a^2 < kappa_(*) < 1$.
    Fix the equatorial bump and a sufficiently small convex near-round neighborhood.
    It may be made arbitrarily small before $k$ is chosen; in particular, impose the strict frequency bound (3.2).
    Lemma 7 and Proposition 8 impose only cofinite conditions on the integer $k$.
    Choose one threshold above all of them and large enough that $\( floor.l theta.alt k floor.r + 1 \)^2 gt.eq
    c \( k + 1 \)^2$. For each integer above this threshold choose its finite program, crossing directions, gaps,
    and disjoint sign neighborhoods. Choose the Ricci buffer $C$ next.
    Proposition 9 works for every sufficiently large $J$ after these choices.
    Enlarge $J$ to meet the freezing-slab, relative graph, box, and endpoint-sign requirements;
    none imposes an upper bound on $J$.
  The simultaneous fixed point selects one control sequence for all $p$ lines,
    and the construction above gives $p gt.eq c \( k + 1 \)^2$ independent entire functions in $cal(H)_k$ for its
    metric $g_k$. The radial proposition gives smoothness, completeness, the Euclidean core,
    nonnegative Ricci curvature, and positive Ricci curvature outside a compact set.
    Section 4.2 gives $"AVR" \( g_k \) = a^2 = v$, uncountably many nonisometric pointed cone limits,
    and the negative radial planes along a sequence tending to infinity.
    These conclusions hold for every provisional control and hence for the selected one.
    This proves the stated order of quantifiers, with one threshold followed by each eligible $k$ and then its
    metric $g_k$. ◻
]

#proof[
  Fix $epsilon.alt > 0$ and $1 < c < 9 \/ 4$. Choose
  $ max { 2 sqrt(c) \/ 3 \, \( 1 + epsilon.alt \)^(- 1) } < a < 1 . $
  Choose $0 < delta < 1$ small enough that
  $ a^2 \( 1 - delta \) gt.eq \( 1 + epsilon.alt \)^(- 2) \, wide 1 + delta lt.eq \( 1 + epsilon.alt \)^2 . $
  Run the preceding construction with $v = a^2$, taking the initial conformal neighborhood small enough for (2.5)
    with this $delta$. The reference program and its interpolation are chosen with a positive margin inside that
    neighborhood, so all controls remain there once $J$ is sufficiently large.
    The global comparison (4.10) gives the asserted tensor bounds.
    Integrating along curves and taking infima gives the stated distance bounds.
    The choice of $a$ can be arbitrarily close to $1$, so the volume ratio can be prescribed arbitrarily close to
    $1$ as well. ◻
]

#heading(level: 1)[References]
#bibitem([1])[N.~Aronszajn, A.~Krzywicki, and J.~Szarski,
  #emph[A unique continuation theorem for exterior differential forms on Riemannian manifolds], Ark. Mat.
  #strong[4] (1962), 417--453. #link("https://doi.org/10.1007/BF02591624")[doi:10.1007/BF02591624].
  The scalar unique-continuation statement used here is in Section~5, Remark~3, p.~449.]
#bibitem([2])[X.~Cai and M.~Lai, #emph[Dimension of polynomial growth harmonic functions on locally conformally
  flat manifolds with nonnegative Ricci curvature], preprint, 2026.
  #link("https://arxiv.org/abs/2608.04553v2")[arXiv:2608.04553v2].]
#bibitem([3])[T.~H.~Colding and W.~P.~Minicozzi~II, #emph[Harmonic functions on manifolds], Ann. of Math.
  (2) #strong[146] (1997), no.~3, 725--747. #link("https://doi.org/10.2307/2952459")[doi:10.2307/2952459].]
#bibitem([4])[T.~H.~Colding and W.~P.~Minicozzi~II, #emph[Weyl type bounds for harmonic functions], Invent. Math.
  #strong[131] (1998), no.~2, 257--298. #link("https://doi.org/10.1007/s002220050204")[doi:10.1007/s002220050204].]
#bibitem([5])[T.~H.~Colding and A.~Naber, #emph[Characterization of tangent cones of noncollapsed limits with
  lower Ricci bounds and applications], Geom. Funct. Anal. #strong[23] (2013), no.~1, 134--148.
  #link("https://doi.org/10.1007/s00039-012-0202-7")[doi:10.1007/s00039-012-0202-7]. Author preprint:
  #link("https://arxiv.org/abs/1108.3244v3")[arXiv:1108.3244v3].]
#bibitem([6])[Y.~Colin de Verdière, #emph[Sur une hypothèse de transversalité d'Arnold], Comment. Math. Helv.
  #strong[63] (1988), 184--193. #link("https://doi.org/10.1007/BF02566761")[doi:10.1007/BF02566761].]
#bibitem([7])[H.~Donnelly, #emph[Harmonic functions on manifolds of nonnegative Ricci curvature], Int. Math. Res.
  Not. #strong[2001] (2001), no.~8, 429--434.
  #link("https://doi.org/10.1155/S1073792801000216")[doi:10.1155/S1073792801000216].]
#bibitem([8])[D.~Gilbarg and N.~S.~Trudinger, #emph[Elliptic Partial Differential Equations of Second Order],
  2nd ed., reprint of the 1998 edition, Classics in Mathematics, Springer-Verlag, Berlin--Heidelberg, 2001.
  #link("https://doi.org/10.1007/978-3-642-61798-0")[doi:10.1007/978-3-642-61798-0].
  The cited locators are Theorems~3.1 and~3.3, pp.~32--33; Corollary~6.3, pp.~93--94; Theorem~6.14, p.~107;
  and Theorem~8.17, p.~194.]
#bibitem([9])[J.~Greilhuber and W.~Kepplinger, #emph[On Arnold's transversality conjecture for the
  Laplace--Beltrami operator], preprint, 2026 version. #link("https://arxiv.org/abs/2312.16939v4")[arXiv:2312.16939v4].]
#bibitem([10])[X.-T.~Huang, #emph[Harmonic functions with polynomial growth on manifolds with nonnegative Ricci
  curvature], Calc. Var. Partial Differential Equations #strong[62] (2023), article~111.
  #link("https://doi.org/10.1007/s00526-023-02456-z")[doi:10.1007/s00526-023-02456-z]. Author preprint:
  #link("https://arxiv.org/abs/2109.07534v1")[arXiv:2109.07534v1] (cited theorem numbering follows this version).]
#bibitem([11])[T.~Kato, #emph[Perturbation Theory for Linear Operators], 2nd ed., Classics in Mathematics,
  Springer, Berlin, 1995. #link("https://doi.org/10.1007/978-3-642-66282-9")[doi:10.1007/978-3-642-66282-9].]
#bibitem([12])[P.~Li and L.-F.~Tam, #emph[Linear growth harmonic functions on a complete manifold], J.
  Differential Geom. #strong[29] (1989), no.~2, 421--425.
  #link("https://doi.org/10.4310/jdg/1214442883")[doi:10.4310/jdg/1214442883].]
#bibitem([13])[S.~Lin, H.~Wang, and G.~Xu, #emph[Eigenvalues on spheres], preprint, 2026.
  #link("https://arxiv.org/abs/2607.11544v1")[arXiv:2607.11544v1].]
#bibitem([14])[J.~Moser, #emph[On the volume elements on a manifold], Trans. Amer. Math. Soc.
  #strong[120] (1965), 286--294.
  #link("https://doi.org/10.1090/S0002-9947-1965-0182927-5")[doi:10.1090/S0002-9947-1965-0182927-5].]
#bibitem([15])[OpenAI, #emph[A counterexample to integer-degree harmonic dimension comparison],
  OpenAI Math Release preprint
  #link("https://github.com/openai/math/blob/main/preprints/A-counterexample-to-integer-degree-harmonic-dimension-comparison-September-25-2026/paper.pdf")[OAI:A-counterexample-to-integer-degree-harmonic-dimension-comparison-September-25-2026],
  2026.]
#bibitem([16])[K.~Uhlenbeck, #emph[Generic properties of eigenfunctions], Amer. J. Math.
  #strong[98] (1976), no.~4, 1059--1078. #link("https://doi.org/10.2307/2374041")[doi:10.2307/2374041].]
#bibitem([17])[G.~Xu, #emph[Three circles theorems for harmonic functions], Math. Ann.
  #strong[366] (2016), nos.~3--4, 1281--1317.
  #link("https://doi.org/10.1007/s00208-016-1366-5")[doi:10.1007/s00208-016-1366-5]. Author preprint:
  #link("https://arxiv.org/abs/1601.02066v1")[arXiv:1601.02066v1] (cited theorem numbering follows this version).]
#bibitem([18])[S.-T.~Yau, #emph[Open problems in geometry], in R.~Schoen and S.-T.~Yau,
  #emph[Lectures on Differential Geometry], International Press, 1994, pp.~365--404, Problem~48.]
