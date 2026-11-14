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

#align(center)[#text(size: 16pt, weight: "bold")[A counterexample to integer-degree \
harmonic dimension comparison]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

For a complete connected smooth Riemannian manifold $\( M^n \, g \)$ without boundary,
  let $cal(H)_d \( M \, g \)$ be the real vector space of harmonic functions satisfying

$ \| u \( x \) \| lt.eq C_u \( 1 + d_g \( o \, x \) \)^d wide \( x in M \) $

for some finite constant $C_u$, where $d gt.eq 0$ and $o in M$ is a base point.
  Changing $o$ does not change the space. Write $h_d \( M \, g \) = dim_(bb(R)) cal(H)_d \( M \, g \)$.
  On Euclidean space, an entire harmonic function with integer growth at most $k$ is a harmonic polynomial of
  degree at most $k$. Consequently

#[#set math.equation(numbering: n => "(1.1)")
 $ h_k \( bb(R)^n \, g_(upright(E)) \) = binom(n + k - 1, k) +
   binom(n + k - 2, k - 1) wide \( k gt.eq 1 \) . $ <eq:euclidean-comparator>]

The integer-degree comparison problem asks whether $"Ric"_g gt.eq 0$ forces $h_k \( M \, g \) lt.eq
  h_k \( bb(R)^n \, g_(upright(E)) \)$ for every integer $k gt.eq 1$.
  The condition defining $cal(H)_k$ is pointwise at every distance.
  Bounds only along a sequence of spheres do not establish it.

#thm([Theorem 1.1.])[
  #emph[There are an even integer $n gt.eq 8$, an integer $k gt.eq 2$,
    and a complete smooth metric $g$ on $bb(R)^n$ such that $"Ric"_g gt.eq 0$ and
$ h_k \( bb(R)^n \, g \) > h_k \( bb(R)^n \, g_(upright(E)) \) . $

 The metric is Euclidean near the origin, and its asymptotic volume ratio satisfies
$ 0 < lim_(R arrow.r oo) frac("vol"_g B_g \( 0 \, R \), omega_n R^n) < 1 \, $

 where $omega_n$ is the volume of the Euclidean unit ball.]
] <thm:main>

The exact finite spectral selection in Appendix 8 permits the choices $n = 16$ and $k = 50000$.

Theorem 1 answers the integer-degree form of Yau’s dimension comparison question in the negative.
  Yau’s questions on polynomial-growth harmonic functions distinguish finite dimensionality from the sharper
  Euclidean comparison [17,13]. Li and Tam proved the sharp linear-growth bound $h_1 \( M \, g \) lt.eq n +
  1$ under nonnegative Ricci curvature [13]. Colding and Minicozzi proved finite dimensionality at every fixed
  degree and later obtained bounds of the optimal order $d^(n - 1)$ as $d$ grows [3,4].
  Those estimates leave open the exact Euclidean count at a particular integer degree.

Donnelly constructed counterexamples to the analogous comparison at a real degree strictly between one and two in
  dimensions at least five [6,2]. That fact alone does not decide the integer endpoint two:
  the Euclidean space of quadratic harmonic polynomials is larger than its space at a degree between one and two.
  Cai and Lai make this distinction explicit and establish sharp comparison with the additional hypothesis of
  local conformal flatness [2]. The theorem above addresses the integer question under the Ricci hypothesis alone.

Cone-spectral results explain another boundary of the problem.
  For complete manifolds with nonnegative Ricci curvature, maximal volume growth,
  and a unique tangent cone at infinity, Huang’s Theorem 1.6 relates the harmonic dimension to the spectrum of the
  cone link [8]. Our metric instead has round and nonround subsequential cone limits.
  Nonunique cones with positive Ricci curvature and Euclidean volume growth already occur in Perelman’s
  construction [14]; Colding and Naber developed a method for slowly varying link families with a common volume
  form [5]. We use the same geometric possibility of a moving link,
  while proving the curvature estimates for our particular deformations.
  Xu’s nonunique-cone three-circles theorem requires a comparison exponent outside the union of cone-degree
  spectra [16] Theorem 3.4. A separate geometric conclusion of our construction is that this union contains a
  neighborhood of the selected integer $k$, so the theorem cannot be applied at $k$ or at sufficiently nearby exponents.

=== Why a moving link can change the count <why-a-moving-link-can-change-the-count>

Put $n = m + 1$. On the metric cone $d r^2 + r^2 h$ over an $m$-dimensional link,
  an angular eigenfunction of the nonnegative Laplacian with eigenvalue $lambda$ has a growing homogeneous
  harmonic mode $r^d phi.alt$, where

$ d \( d + m - 1 \) = lambda \, wide d gt.eq 0 . $

For one fixed link, each angular direction therefore carries one fixed growth rate.
  Our construction lets a harmonic function use several rates in succession.
  The challenge is to arrange that succession exactly: an arbitrarily small component in an unwanted faster
  direction can dominate after a sufficiently long interval.

The links are volume-normalized Berger metrics on odd spheres $S^m$, $m = 2 s - 1$.
  Their distinguished Hopf direction is allowed to change. Differentiation along this circle direction is the Hopf
  generator; on complexified harmonics its eigenvalues are $upright(i)$ times the integer Hopf charges.
  Every angular Laplacian nevertheless preserves the same finite-dimensional space $V_l$ of round spherical
  harmonics of degree $l$; write $N_l = dim_(bb(R)) V_l$. At a fixed nonround link,
  write its growing rates on $V_l$ in increasing order as $d_(l \, 1) \, dots.h \, d_(l \, N_l)$.
  The spectral calculation supplies a finite $L gt.eq 2$ and integers $0 lt.eq M_l lt.eq N_l$ for $2 lt.eq l lt.eq
  L$ such that

#[#set math.equation(numbering: n => "(1.2)")
 $ sum_(l = 2)^L M_l > h_k \( bb(R)^(m + 1) \, g_(upright(E)) \) \, wide 1 /
   M_l sum_(i = 1)^(M_l) d_(l \, i) < k quad \( M_l > 0 \) . $ <eq:overview-selection>]

Thus the count will be large enough if each selected harmonic function can spend asymptotically equal amounts of
  logarithmic radius at all the selected rates in its block.
  The inequality for the mean is strict; individual rates may exceed $k$.

The source of (1.2) is the distribution of Hopf charges inside $V_l$.
  The squared charges divided by $l^2$ tend to a beta distribution.
  The mean of the lowest fraction of rates is described by an integral of its decreasing quantile.
  In a sufficiently large odd link dimension, a weighted quantile inequality shows that selecting directions by
  their mean produces a strict surplus over the Euclidean count.
  This fixes the link parameters, the integer $k$, and a finite degree range before the radial construction
  begins. An exact-integer computation gives a separate finite selection at specific parameters;
  its role is to verify that finite spectral input, rather than the subsequent geometric or transmission proof.

=== From angular control to entire harmonic functions <from-angular-control-to-entire-harmonic-functions>

Short deformations near a round link provide the exchanges of directions.
  For every fixed finite range $2 lt.eq l lt.eq L$, the trace-free squares of the Hopf generators,
  using all orthogonal complex structures, generate

$ xor.big_(l = 2)^L frak(s l) \( V_l \) . $

The real form and the direct sum matter: one must choose the same finite sequence of geometric pulses while
  independently arranging a prescribed signed permutation in each $V_l$.
  A finite product of exponentials realizes these permutations at a parameter value where the word map has
  invertible differential. The transmission argument below shows that this algebraic freedom survives the harmonic
  equation.

Write the metric as $g = d r^2 + r^2 gamma \( t \)$ with $t = log r$.
  A harmonic function in $V_l$ is governed by a second-order matrix equation.
  Smoothness at the Euclidean center selects a distinguished regular solution space.
  Its logarithmic derivative $P_l$ satisfies a matrix Riccati equation;
  positive barriers keep $P_l$ bounded and symmetric. A long round rest makes $P_l$ approach a scalar matrix,
  independently of all earlier admissible pulses. During the next control interval,
  which is short relative to the following dwell, the determinant-normalized value transfer converges in $C^1$ to
  the finite algebraic word as the period index tends to infinity.

The pulse-end approximation is only an intermediate fact:
  the outgoing radial derivative can still inject a small component into a faster direction during the following
  long leg, on which the angular eigenvectors remain fixed.
  We factor out the positive diagonal transfer $D_(l \, j)$ obtained by entering that entire leg with the round
  growing derivative. The remaining multiplier of the derivative error is bounded independently of the leg’s
  length and anisotropy (Lemma 14). Thus the full-period map,
  with this diagonal factor removed and its determinant normalized, is $C^1$-close to the ideal word,
  uniformly over all preceding controls. Its local inverse tunes every complete period exactly to $s_(l \, j)
  D_(l \, j) Pi_l$, where $Pi_l$ cycles the selected axes and $s_(l \, j) > 0$ is a scalar.

The geometry and the growth argument use different features of the same schedule.
  In period $j$, the control intervals have length comparable to $j^6$ and the nonround dwell has length $j^7$,
  while the accumulated logarithmic radius is comparable to $j^8$.
  Angular motion is consequently slow enough for a small concave radial tail to preserve nonnegative Ricci
  curvature. The diagonal leg contributes $log \( D_(l \, j) \)_(i i) = j^7 \( d_(l \, i) + o \( 1 \) \)$,
  while $log s_(l \, j) = O \( j^6 \)$. Exact cycling and the asymptotic equality of finitely many consecutive
  dwell lengths yield the means in (1.2). Bounded Riccati matrices control the intervals between period endpoints.
  Since a whole period is negligible compared with the accumulated logarithmic radius,
  the same exponent bound holds at every radius. The strict inequality below $k$ then gives the pointwise growth
  condition, and invertibility of the regular fundamental matrices gives the claimed number of independent smooth
  harmonic functions.

All spaces and functions are real unless explicitly complexified. Angular Laplacians are nonnegative.
  Matrices act on column vectors, and positivity of a matrix means positivity as a symmetric operator.
  Constants may depend on the fixed finite degree range and fixed compact family of controls;
  they are uniform in the period index and in the preceding admissible controls.

Sections 2 and 3 establish the Berger formulas and the finite spectral surplus.
  Section 4 proves simultaneous real control, and Section 5 realizes every admitted control history by a complete
  metric with nonnegative Ricci curvature. Section 6 tunes the full-period transmissions exactly;
  Section 7 proves the every-point growth estimate and the cone conclusions.
  Appendix 8 records the independent finite arithmetic selection.

== 2 Volume-normalized Berger links <sec:links>

We need angular metrics that retain fixed finite-dimensional harmonic spaces while varying their spectra.
  This section derives their curvature and angular operators;
  the next section selects the directions that will be cycled.

Fix an odd integer $m = 2 s - 1$, with $s gt.eq 4$, and let $g_0$ be the unit round metric on $S^m subset
  bb(R)^(2 s)$. An orthogonal complex structure is a real linear map $J$ satisfying $J^2 = -
  I$ and $J^(sans(T)) J = I$. It determines the unit round Killing field and its dual one-form

$ xi_J \( x \) = J x \, wide eta_J = g_0 \( xi_J \, dot.op \) . $

Write

$ P_J = xi_J ⊗ eta_J \, wide D_J u = d u \( xi_J \) . $

Thus $P_J$ is the projection onto the Hopf direction. For $a \, q > 0$, define

$ tilde(g)_(q \, J) = g_0 + \( q - 1 \) eta_J^2 \, wide G \( a \, q \, J \) = a^2 q^(- 1 \/ m) tilde(g)_(q \, J) . $

The factor $q^(- 1 \/ m)$ makes the volume independent of $q$.
  All orthogonal complex structures will be allowed; we do not restrict them to one component of their parameter space.

This volume normalization and the corresponding Laplacian decomposition are classical;
  see Tanno [15] Sections 2–4. His parameter $t$ corresponds to $q = t^m$ when $a = 1$.
  Classical curvature calculations for these spheres appear in Bourguignon–Karcher [1] Section 6.6.
  We record the formulas and their direct proofs in our parameters below.

For $l gt.eq 0$, let $V_l$ be the real vector space of restrictions to $S^m$ of homogeneous harmonic polynomials
  of degree $l$ on $bb(R)^(m + 1)$. Equip $V_l$ with the round $L^2$ inner product and put

$ N_l = dim_(bb(R)) V_l = binom(m + l, m) - binom(m + l - 2, m) \, wide B_l = l \( l + m - 1 \) \, $

where the second binomial coefficient is zero for $l < 2$.
  For completeness, on homogeneous polynomials give distinct monomials orthogonal inner products with $chevron.l
  x^alpha \, x^alpha chevron.r = alpha !$. The adjoint of the Euclidean polynomial Laplacian from degree $l$ to
  degree $l - 2$ is multiplication by $\| x \|^2$, which is injective.
  The Laplacian is therefore surjective, giving the dimension formula.
  Restriction to the sphere is injective on homogeneous polynomials. Euclidean polar coordinates give

$ Delta_(g_0)^(+) \|_(V_l) = B_l I \, wide Delta_h^(+) := - "div"_h nabla_h . $

Rotations preserve $V_l$. In particular, $D_J$ preserves $V_l$ and is skew-adjoint for its round inner product.

#thm([Lemma 2.1.])[
  #emph[The volume form of $G \( a \, q \, J \)$ is $a^m thin d "vol"_(g_0)$. Its Ricci endomorphism has eigenvalues
$ a^(- 2) q^(1 \/ m) #scale(x: 120%, y: 120%)[\(] \( m - 1 \) - 2 \( q - 1 \) #scale(x: 120%, y: 120%)[\)] quad
  upright("horizontally") \, wide a^(- 2) q^(1 \/ m) \( m - 1 \) q quad upright("vertically") . $

 Consequently,
#[#set math.equation(numbering: n => "(2.1)")
 $ "Ric"_(G \( a \, q \, J \)) > \( m - 1 \) G \( a \, q \, J \) quad arrow.l.r.double quad
   a^2 < q^(1 \/ m) min {1 - frac(2 \( q - 1 \), m - 1) \, thin q} . $ <eq:link-margin>]

 Every $V_l$ is preserved by the positive Laplacian of $G \( a \, q \, J \)$, whose restriction is
#[#set math.equation(numbering: n => "(2.2)")
 $ A_l \( a \, q \, J \) = a^(- 2) q^(1 \/ m) [B_l I + \( q^(- 1) - 1 \) \( - D_J^2 \|_(V_l) \)] .
   $ <eq:angular-operator>]

]
] <lem:berger-metrics>

#proof[
  We suppress $J$ from the notation. Relative to $g_0$, the metric $tilde(g)_q$ has eigenvalues $1$ on the
    $\( m - 1 \)$-dimensional horizontal space and $q$ on the Hopf direction.
    Its volume form is $sqrt(q) thin d "vol"_(g_0)$. Multiplication of the metric by $a^2
    q^(- 1 \/ m)$ multiplies this volume form by $a^m q^(- 1 \/ 2)$, proving the volume assertion.
  Here is a direct curvature calculation. Let $nabla$ be the round connection and set $phi.alt X = nabla_X xi$.
    Tangent projection of the ambient derivative gives
  $ phi.alt X = J X + eta \( X \) x \, wide phi.alt^(*) = - phi.alt \, wide phi.alt xi = 0 \, wide phi.alt^2 = -
    I + xi ⊗ eta \, $
  and differentiation gives
  $ \( nabla_X eta \) \( Y \) = g_0 \( phi.alt X \, Y \) \, wide \( nabla_X phi.alt \) Y = eta \( Y \) X -
    g_0 \( X \, Y \) xi . $
  Put $delta = q - 1$, which is constant on the sphere. If $C = tilde(nabla) -
    nabla$ is the difference between the connections of $tilde(g)_q$ and $g_0$, the Koszul formula yields
  $ 2
    tilde(g)_q \( C \( X \, Y \) \, Z \) & = \( nabla_X tilde(g)_q \) \( Y \, Z \) + \( nabla_Y tilde(g)_q \) \(
    X \, Z \) - \( nabla_Z tilde(g)_q \) \( X \, Y \)\
 & = 2 delta [eta \( X \) g_0 \( phi.alt Y \, Z \) + eta \( Y \) g_0 \( phi.alt X \, Z \)] . $
  The vectors $phi.alt X \, phi.alt Y$ are horizontal, so
  $ C \( X \, Y \) = delta #scale(x: 120%, y: 120%)[\(] eta \( X \) phi.alt Y +
    eta \( Y \) phi.alt X #scale(x: 120%, y: 120%)[\)] . $
  In particular, $"tr" \[ X mapsto C \( X \, Z \) \] = 0$. Tracing the connection change formula for curvature
    therefore gives
  $ \( "Ric"_(tilde(g)_q) - "Ric"_(g_0) \) \( Y \, Z \) = "tr" #scale(x: 120%, y: 120%)[\[] X
    mapsto \( nabla_X C \) \( Y \, Z \) #scale(x: 120%, y: 120%)[\]] -
    "tr" #scale(x: 120%, y: 120%)[\[] X mapsto C \( Y \, C \( X \, Z \) \) #scale(x: 120%, y: 120%)[\]] . $
  These are endomorphism traces and can be computed in a round orthonormal frame.
    Using the identities for $phi.alt$, the four terms obtained by differentiating $C$ contribute, in order,
  $ - delta \( g_0 - eta^2 \) \, quad delta \( m - 1 \) eta^2 \, quad - delta \( g_0 - eta^2 \) \, quad
    delta \( m - 1 \) eta^2 . $
  Thus the first trace is $delta \( - 2 g_0 + 2 m eta^2 \) \( Y \, Z \)$. For the second trace, one has
  $ C \( Y \, C \( X \, Z \) \) = delta^2 eta \( Y \) #scale(x: 120%, y: 120%)[\[] - eta \( X \) Z -
    eta \( Z \) X + 2 eta \( X \) eta \( Z \) xi #scale(x: 120%, y: 120%)[\]] \, $
  whose trace in $X$ is $- \( m - 1 \) delta^2 eta \( Y \) eta \( Z \)$.
    Since $"Ric"_(g_0) = \( m - 1 \) g_0$, this proves the tensor identity
  $ "Ric"_(tilde(g)_q) = #scale(x: 120%, y: 120%)[\(] \( m - 1 \) -
    2 \( q - 1 \) #scale(x: 120%, y: 120%)[\)] \( g_0 - eta^2 \) + \( m - 1 \) q^2 eta^2 . $
  The squared length of $xi$ in $tilde(g)_q$ is $q$. Hence the vertical eigenvalue of its Ricci endomorphism is
    $\( m - 1 \) q$, while the horizontal eigenvalue is $\( m - 1 \) - 2 \( q - 1 \)$.
    Constant metric scaling leaves the covariant Ricci tensor unchanged and divides its endomorphism eigenvalues
    by the scale. This proves the stated eigenvalues and (2.1).
  Finally, the inverse metric is
  $ G \( a \, q \, J \)^(- 1) = a^(- 2) q^(1 \/ m) [g_0^(- 1) + \( q^(- 1) - 1 \) xi ⊗ xi] . $
  Because its volume form is a spatially constant multiple of round volume,
    its divergence on vector fields is the round divergence. The field $xi$ has zero round divergence,
    so $"div"_(g_0) \( \( D_J u \) xi \) = D_J^2 u$. It follows that
  $ Delta_(G \( a \, q \, J \))^(+) u = a^(- 2) q^(1 \/ m) [Delta_(g_0)^(+) u + \( q^(- 1) - 1 \) \( - D_J^2 u \)] . $
  Restricting this identity to $V_l$ gives (2.2). ◻
]

== 3 A strict spectral surplus <sec:counting>

Fix the standard orthogonal complex structure $J_0$ on $bb(R)^(2 s)$.
  For $a \, q > 0$, let $lambda_(l \, 1) \( a \, q \) lt.eq dots.h.c lt.eq
  lambda_(l \, N_l) \( a \, q \)$ be the eigenvalues, counted with their real multiplicities,
  of the positive angular operator in (2.2) for $G \( a \, q \, J_0 \)$.
  Define the corresponding nonnegative exponents by

#[#set math.equation(numbering: n => "(3.1)")
 $ d_(l \, i) \( a \, q \) #scale(x: 120%, y: 120%)[\(] d_(l \, i) \( a \, q \) + m -
   1 #scale(x: 120%, y: 120%)[\)] = lambda_(l \, i) \( a \, q \) \, wide d_(l \, i) \( a \, q \) gt.eq
   0 . $ <eq:dwell-exponents>]

We will find more than the Euclidean number of directions whose exponents have mean strictly below a common
  integer. The subsequent construction will realize these means by cycling the selected directions.

The Hopf-charge decomposition underlying this calculation is described by Tanno [15] Lemmas 3.1 and 4.1;
  we prove the exact multiplicities and the distribution needed for the count.

#thm([Lemma 3.1.])[
  (Hopf-weight distribution).  #emph[For $m = 2 s - 1$ and $0 lt.eq b lt.eq l$,
    the eigenvalue $\( 2 b - l \)^2$ of $- D_(J_0)^2$ on $V_l$ has the following contribution to its multiplicity:
#[#set math.equation(numbering: n => "(3.2)")
 $ h_(l \, b) & = binom(s + b - 1, s - 1) binom(s + l - b - 1, s - 1) -
   binom(s + b - 2, s - 1) binom(s + l - b - 2, s - 1)\
 & = frac(l + s - 1, s - 1) binom(b + s - 2, s - 2) binom(l - b + s - 2, s - 2) . $ <eq:hopf-multiplicity>]

 Terms with a missing bidegree in the first line are zero.
   With probabilities $h_(l \, b) \/ N_l$, the quantities $\( 2 b - l \)^2 \/ l^2$ converge in distribution,
   as $l arrow.r oo$, to
$ Y_m tilde.op "Beta" (1 / 2 \, frac(m - 1, 2)) . $

]
] <lem:hopf-distribution>

#proof[
  Complexify $V_l$ and decompose homogeneous polynomials into bidegrees $\( b \, l - b \)$ in $z_1 \, dots.h \,
    z_s$ and their conjugates. The operator $D_(J_0)$ acts on this bidegree by $upright(i) \( 2 b - l \)$.
    The contraction $sum_j partial_(z_j) partial_(macron(z)_j)$ maps onto the polynomials of bidegree
    $\( b - 1 \, l - b - 1 \)$: in the positive monomial inner product in which $z^alpha
    macron(z)^beta$ has squared norm $alpha ! beta !$, its adjoint is multiplication by $sum_j z_j macron(z)_j$,
    which is injective. Taking the difference of dimensions gives the first line of (3.2);
    cancellation gives the second. The contributions indexed by $b$ and $l -
    b$ belong to the same eigenvalue of $- D_(J_0)^2$ and are added; the middle contribution is counted once.
    Since this operator is real symmetric, the complex dimension of each complexified eigenspace equals the real
    dimension of the corresponding original real eigenspace. There is no additional factor of two.
  Summing the second line by the binomial convolution identity gives
  #[#set math.equation(numbering: n => "(3.3)")
   $ N_l = frac(l + s - 1, s - 1) binom(l + 2 s - 3, 2 s - 3) = binom(m + l, m) -
     binom(m + l - 2, m) tilde.op frac(2, \( m - 1 \) !) thin l^(m - 1) . $ <eq:harmonic-multiplicity-asymptotic>]
  More precisely, $h_(l \, b) \/ N_l$ is a beta-binomial probability.
    If $X$ has density proportional to $\[ x \( 1 - x \) \]^(s - 2)$ on $\( 0 \, 1 \)$ and, conditionally on $X$,
    $K_l$ is binomial with parameters $l \, X$, then integration of the binomial probability against this density
    gives $bb(P) \( K_l = b \) = h_(l \, b) \/ N_l$. Since
  $ bb(E) [(K_l / l - X)^2] = frac(bb(E) \[ X \( 1 - X \) \], l) lt.eq frac(1, 4 l) \, $
  we have $K_l \/ l arrow.r X$ in probability in this representation.
    The change of variable $y = \( 2 x - 1 \)^2$ gives density proportional to $y^(- 1 \/ 2) \( 1 - y \)^(s - 2)$,
    proving the assertion. ◻
]

For $0 < v < 1$, define the upper-tail quantile $y_m \( v \) in \( 0 \, 1 \)$ by

$ bb(P) #scale(x: 120%, y: 120%)[\(] Y_m > y_m \( v \) #scale(x: 120%, y: 120%)[\)] = v \, wide cal(J)_m :=
  integral_0^1 y_m \( v \) log \( 1 \/ v \) thin d v . $

The threshold $2 \/ \( m - 1 \)$ in the next lemma comes from the horizontal factor in the link curvature
  condition (2.1).

#thm([Lemma 3.2.])[
  (A weighted quantile inequality).  #emph[For all sufficiently large odd $m$,
#[#set math.equation(numbering: n => "(3.4)")
 $ \( m - 1 \) cal(J)_m > 2 . $ <eq:weighted-quantile-gap>]

]
] <lem:weighted-quantile>

#proof[
  Put $r = m - 1$. The beta density, equivalently polar coordinates for independent standard normal variables,
    gives the representation
  $ r Y_m =^(upright(d)) frac(Z^2, Z^2 \/ r + W_r \/ r) \, $
  where $Z$ is standard normal and $W_r$ is an independent sum of $r$ squared standard normal variables.
    Since $bb(E) \[ W_r \/ r \] = 1$ and $"Var" \( W_r \/ r \) = 2 \/ r$, we obtain $r Y_m arrow.r.double Z^2$.
    The limiting distribution is continuous and strictly increasing on $\( 0 \, oo \)$,
    so its upper quantile $y_oo \( v \)$ satisfies $r y_m \( v \) arrow.r y_oo \( v \)$ for every $0 < v < 1$.
    Fatou’s lemma therefore gives
  #[#set math.equation(numbering: n => "(3.5)")
   $ liminf_(m arrow.r oo) \( m - 1 \) cal(J)_m gt.eq integral_0^1 y_oo \( v \) log \( 1 \/ v \) thin d v =
     bb(E) [R^2 log frac(1, Q \( R \))] \, $ <eq:normal-quantile-limit>]
  where $R = \| Z \|$ and $Q \( x \) = bb(P) \( R > x \)$. The last equality follows since $Q \( R \)$ is uniform
    on $\( 0 \, 1 \)$. This expectation is finite: integration of the half-normal density on $\[ x \, x + 1 \]$
    gives $Q \( x \) gt.eq sqrt(2 \/ pi) thin e^(- \( x + 1 \)^2 \/ 2)$.
  For $x > 0$, integration of the same density gives the classical Mills upper bound (see [12] Section 4, p. 113)
  $ Q \( x \) = sqrt(2 / pi) integral_x^oo e^(- t^2 \/ 2) thin d t lt.eq sqrt(2 / pi) thin e^(- x^2 \/ 2) / x . $
  Consequently, writing $A = bb(E) \[ R^2 log R \]$, we have
  #[#set math.equation(numbering: n => "(3.6)")
   $ bb(E) [R^2 log frac(1, Q \( R \))] gt.eq 3 / 2 + A + 1 / 2 log pi / 2 . $ <eq:normal-quantile-lower-bound>]
  Integration by parts against the half-normal density yields $bb(E) \[ R^4 log R \] = 3 A + 1$.
    Under the probability measure $d nu = R^4 thin d bb(P) \/ 3$,
    Jensen’s inequality for the logarithm applied to $1 \/ R$ now gives
  $ A + 1 / 3 = bb(E)_nu \[ log R \] gt.eq - log bb(E)_nu \[ 1 \/ R \] = log frac(3, bb(E) \[ R^3 \]) =
    log frac(3, 2 sqrt(2 \/ pi)) . $
  Combining this with (3.6) proves
  #[#set math.equation(numbering: n => "(3.7)")
   $ bb(E) [R^2 log frac(1, Q \( R \))] gt.eq 7 / 6 + log frac(3 pi, 4) > 2 . $ <eq:strict-normal-constant>]
  Here the final strict inequality can be checked without decimal approximations.
    Indeed, $arctan x > x - x^3 \/ 3$ for $x > 0$ gives
  $ pi / 4 = arctan 1 / 2 + arctan 1 / 3 > 505 / 648 > 7 / 9 \, $
  so $3 pi \/ 4 > 7 \/ 3$. Strict convexity of $t mapsto 1 \/ t$ gives the midpoint bounds
  $ log 7 / 3 = integral_1^(5 \/ 3) frac(d t, t) + integral_(5 \/ 3)^(7 \/ 3) frac(d t, t) >
    frac(2 \/ 3, 4 \/ 3) + frac(2 \/ 3, 2) = 5 / 6 . $
  Equations (3.5) and (3.7) imply (3.4). ◻
]

Before selecting the link, fix a smooth nondecreasing cutoff $chi$,
  zero near $\( - oo \, 2 \]$ and one near $\[ 4 \, oo \)$, and put

$ I_chi = integral_2^oo chi \( t \) \( 1 + t \)^(- 5 \/ 4) thin d t > 0 . $

The radial construction will require only the extra smallness condition

#[#set math.equation(numbering: n => "(3.8)")
 $ frac(- log a_(*), I_chi) thin sup_(t > 2) chi \( t \) \( 1 + t \)^(- 5 \/ 4) lt.eq 1 / 4 . $ <eq:cutoff-smallness>]

It depends on the fixed cutoff and link scale, before any finite degree range or control family has been chosen.
  The freedom in the next lemma allows this condition to be imposed at the outset.

#thm([Lemma 3.3.])[
  (Spectral surplus).  #emph[There is an odd $m = 2 s - 1 gt.eq 7$ for which the following choices are possible.
    The parameters $a_(*) in \( 0 \, 1 \)$ and $q_(*) > 1$ can be taken arbitrarily close to $1$,
    with (2.1) holding at $a = a_(*)$ for every $q in \[ 1 \, q_(*) \]$.
    For these parameters there are integers $k gt.eq 2$, $L gt.eq 2$, and $0 lt.eq M_l lt.eq N_l$ for $2 lt.eq
    l lt.eq L$ such that, on abbreviating $d_(l \, i) = d_(l \, i) \( a_(*) \, q_(*) \)$,
#[#set math.equation(numbering: n => "(3.9)")
 $ overline(d)_l := 1 / M_l sum_(i = 1)^(M_l) d_(l \, i) < k quad upright("whenever ") M_l > 0 \, wide
   sum_(l = 2)^L M_l > sum_(l = 0)^k N_l . $ <eq:selection>]

]
] <lem:spectral-surplus>

#proof[
  #strong[Choosing the link.] Choose an odd $m gt.eq 7$ satisfying Lemma 4, and fix
  $ frac(2, m - 1) < c < cal(J)_m . $
  For a small positive parameter $epsilon$, set
  #[#set math.equation(numbering: n => "(3.10)")
   $ q_(*) = 1 + epsilon \, wide alpha_(*)^2 = 1 - c epsilon \, wide a_(*)^2 =
     q_(*)^(1 \/ m) alpha_(*)^2 . $ <eq:dwell-parameters>]
  For $q gt.eq 1$, the right-hand side of (2.1) is
  $ F \( q \) = q^(1 \/ m) (1 - frac(2 \( q - 1 \), m - 1)) \, wide F' \( q \) =
    frac(m + 1, m \( m - 1 \)) q^(1 \/ m - 1) \( 1 - 2 q \) < 0 . $
  At $q = q_(*)$, the required strict inequality follows from $c > 2 \/ \( m - 1 \)$;
    it consequently holds throughout $\[ 1 \, q_(*) \]$. In particular $a_(*)^2 < F \( q_(*) \) < 1$.
  #strong[Limiting means.] By (2.2), the eigenvalues at the dwell parameters are the numbers
  $ alpha_(*)^(- 2) [B_l - (1 - 1 / q_(*)) \( 2 b - l \)^2] $
  with the multiplicities in Lemma 3. Thus their increasing order corresponds to the decreasing order of the Hopf
    weights $\( 2 b - l \)^2$. If $d \( d + m - 1 \) = lambda$ and $d gt.eq 0$, then $0 lt.eq sqrt(lambda) -
    d lt.eq \( m - 1 \) \/ 2$. Since $B_l \/ l^2 arrow.r 1$, Lemma 3 and convergence of quantiles to a continuous,
    strictly increasing distribution imply
  #[#set math.equation(numbering: n => "(3.11)")
   $ d_(l \, ceil.l v N_l ceil.r) / l arrow.r f_epsilon \( v \) := \( 1 - c epsilon \)^(- 1 \/ 2)
     sqrt(1 - (1 - 1 / q_(*)) y_m \( v \)) wide \( 0 < v < 1 \) . $ <eq:limiting-exponent-quantile>]
  These rescaled exponents are uniformly bounded, so averaging the first $ceil.l u N_l ceil.r$ terms gives,
    for every $0 < u < 1$,
  #[#set math.equation(numbering: n => "(3.12)")
   $ frac(1, l ceil.l u N_l ceil.r) sum_(i = 1)^(ceil.l u N_l ceil.r) d_(l \, i) arrow.r g_epsilon \( u \) := 1 /
     u integral_0^u f_epsilon \( v \) thin d v . $ <eq:limiting-mean-exponents>]
  One may see this directly by integrating the empirical quantile in (3.11);
    the possible last fractional term has size $O \( N_l^(- 1) \)$ after division by $l$.
  Define
  $ I \( epsilon \) := integral_0^1 g_epsilon \( u \)^(- m) thin d u . $
  All functions here are bounded away from zero for sufficiently small $epsilon$. Uniformly for $0 < v < 1$,
  $ f_epsilon \( v \) = 1 + epsilon / 2 #scale(x: 120%, y: 120%)[\(] c -
    y_m \( v \) #scale(x: 120%, y: 120%)[\)] + O \( epsilon^2 \) . $
  The same uniform remainder remains valid after averaging over $\( 0 \, u \)$.
    Expansion of $g_epsilon \( u \)^(- m)$ and integration therefore give
  #[#set math.equation(numbering: n => "(3.13)")
   $ I \( epsilon \) & = 1 +
     frac(m epsilon, 2) [integral_0^1 1 / u integral_0^u y_m \( v \) thin d v thin d u - c] + O \( epsilon^2 \)\
 & = 1 + frac(m epsilon, 2) \( cal(J)_m - c \) + O \( epsilon^2 \) > 1 wide
   upright("for all sufficiently small ") epsilon > 0 . $ <eq:counting-first-variation>]
  The second equality uses the nonnegative integral identity $integral_v^1 d u \/ u = log \( 1 \/ v \)$.
    Fix such an $epsilon$, as small as desired, from now on.
  #strong[Counting at integer thresholds.] For each positive integer $k$ and $l gt.eq 2$,
    let $M_l \( k \)$ be the largest initial group of the ordered exponents whose mean is strictly less than $k$,
    taking $M_l \( k \) = 0$ if no group qualifies. Only finitely many degrees contribute:
    the displayed eigenvalue formula bounds all $lambda_(l \, i)$ below by a positive constant times $l^2$,
    so $min_i d_(l \, i)$ grows at least linearly in $l$. The initial-group means are nondecreasing, and hence
  #[#set math.equation(numbering: n => "(3.14)")
   $ M_l \( k \) = N_l integral_0^1 upright(bold(1)) {frac(1, ceil.l u N_l ceil.r)
     sum_(i = 1)^(ceil.l u N_l ceil.r) d_(l \, i) < k} thin d u . $ <eq:counting-layer-cake>]
  For fixed $u in \( 0 \, 1 \)$ and $delta > 0$, (3.12) bounds the mean in this indicator by
    $l \( g_epsilon \( u \) + delta \/ 2 \)$ for every sufficiently large $l$.
    It is therefore strictly below $k$ whenever $l lt.eq k \/ \( g_epsilon \( u \) + delta \)$,
    including at the upper endpoint. Using (3.3), the sum of the corresponding $N_l$,
    divided by $sum_(l = 0)^k N_l$, has limit $\( g_epsilon \( u \) + delta \)^(- m)$ as the integer $k arrow.r
    oo$. Letting $delta arrow.b 0$ and applying Fatou’s lemma to (3.14) yields
  #[#set math.equation(numbering: n => "(3.15)")
   $ liminf_(k arrow.r oo\
k in bb(N)) frac(sum_(l = 2)^oo M_l \( k \), sum_(l = 0)^k N_l) gt.eq
  integral_0^1 g_epsilon \( u \)^(- m) thin d u = I \( epsilon \) > 1 . $ <eq:counting-liminf>]
  Discarding the finitely many lower degrees in this argument changes no limit.
    Consequently every sufficiently large integer $k$ has a strict surplus.
    Taking $L$ to be the largest degree with $M_l \( k \) > 0$ and setting $M_l = M_l \( k \)$ proves (3.9). ◻
]

A selected prefix may be empty, a singleton, or all of $V_l$, and may cut a repeated real eigenspace.
  No gap at its last eigenvalue is required: choose the indicated number of real orthonormal eigenvectors.
  The selected span need not be invariant under any individual $D_J$;
  the full fixed space $V_l$ remains invariant under every angular operator.

Finally, the sum appearing in (3.9) is exactly the Euclidean comparison dimension in ambient dimension $n = m + 1$:

$ sum_(l = 0)^k N_l = binom(m + k, k) + binom(m + k - 1, k - 1) = h_k \( bb(R)^(m + 1) \) . $

To justify the Euclidean identification directly, let $u$ be a Euclidean harmonic function of growth at most the
  integer $k$. A smooth radial kernel $psi_R \( x \) = R^(- \( m + 1 \)) psi \( x \/ R \)$,
  supported in the ball of radius $R$ and with integral $1$, reproduces $u$ by the mean-value property.
  For each multi-index $alpha$ of order $k + 1$, moving derivatives onto the kernel gives,
  at any fixed $x$ and for $R gt.eq 1$,

$ \| partial^alpha u \( x \) \| lt.eq sup_(\| y - x \| lt.eq R) \| u \( y \) \| thin parallel partial^alpha psi_R
  parallel_(L^1) lt.eq C_x R^k R^(- \( k + 1 \)) arrow.r 0 . $

Thus $u$ is a polynomial of degree at most $k$, and its homogeneous components are harmonic.
  The converse follows from homogeneity.

For the rest of the construction, the spectral data mean an odd $m = 2 s - 1$ with $s gt.eq 4$,
  a fixed cutoff $chi$, and $0 < a_(*) < 1 < q_(*)$ satisfying (2.1) throughout $\[ 1 \, q_(*) \]$ and (3.8),
  together with finite $k \, L gt.eq 2$ and $0 lt.eq M_l lt.eq N_l$ satisfying (3.9).
  These are precisely the numerical hypotheses used in Sections 4–7;
  no later step uses the asymptotic route by which the data were obtained.

The choices in Lemma 5 are made in the order $m \, c \, epsilon \, k \, L$.
  In particular any further requirement that $a_(*)$ be close to $1$ can be imposed when choosing $epsilon$,
  before the integer cutoff is fixed.

== 4 Control of the angular modes <sec:control>

The selections in Lemma 5 will be mixed by cycling their basis directions.
  We first prove that the angular operators furnish the required finite-dimensional control.
  Throughout this section, $m = 2 s - 1$, $s gt.eq 4$, and $2 lt.eq l lt.eq L$.
  We equip each real space $V_l$ of round spherical harmonics with its round $L^2$ inner product and write $N_l =
  dim_(bb(R)) V_l$. For an endomorphism $A$ of $V_l$, put

$ A_(upright("tf")) = A - frac("tr" A, N_l) I . $

For every orthogonal complex structure $J$ on $bb(R)^(2 s)$, the operator $D_J u \( x \) =
  d u_x \( J x \)$ preserves $V_l$. It is skew-adjoint, because its flow consists of round isometries.
  In particular, $\( D_J^2 \)_(upright("tf"))$ is a real symmetric trace-free operator.

#thm([Proposition 4.1.])[
  (Simultaneous control).  #emph[Fix positive numbers $kappa_l$, $2 lt.eq l lt.eq L$.
    As $J$ ranges over all orthogonal complex structures on $bb(R)^(2 s)$, the tuples
#[#set math.equation(numbering: n => "(4.1)")
 $ X_J = #scale(x: 120%, y: 120%)[\(] kappa_l \( D_J^2 \|_(V_l) \)_(upright("tf"))
   #scale(x: 120%, y: 120%)[\)]_(l = 2)^L $ <eq:control-generators>]

 generate, under real linear combinations and brackets, the full Lie algebra
$ xor.big_(l = 2)^L frak(s l) \( V_l \) . $

]
] <prop:control>

#proof[
  We first prove the assertion in a single degree $l$. The nonzero factor $kappa_l$ has no effect on this
    assertion. Let $frak(a) subset frak(s l) \( V_l \)$ be the real Lie algebra generated by
    $\( D_J^2 \)_(upright("tf"))$, and set
  $ W = V_l ⊗_(bb(R)) bb(C) \, wide frak(a)_(bb(C)) = frak(a) ⊗_(bb(R)) bb(C) . $
  Transpose on $W$ will always refer to the complex bilinear extension of the real round inner product.
    The single-degree argument first produces a rank-one symmetric endomorphism of $W$.
    Round conjugation and brackets then produce all trace-free endomorphisms of $W$.
    Finally, we separate the different degrees to obtain simultaneous control on their direct sum.
  #strong[Diagonal operators and individual weight blocks.] Choose orthonormal coordinates
    $\( x_1 \, y_1 \, dots.h \, x_s \, y_s \)$ and write $z_i = x_i + upright(i) y_i$.
    For $theta in bb(R)^s$, let $R_theta$ rotate coordinate plane $i$ by $theta_i$, and let $T_theta u \( x \) =
    u \( R_theta x \)$. The #emph[weight space] of $nu in bb(Z)^s$ is the character eigenspace
  $ W_nu = { u in W : T_theta u = e^(upright(i) sum_i nu_i theta_i) u upright(" for every ") theta } . $
  Thus $z_i$ has weight $e_i$, $macron(z)_i$ has weight $- e_i$,
    and $D_(J_0)$ acts on $W_nu$ by $upright(i) sum_i nu_i$. In particular,
    a monomial of holomorphic degree $b$ and antiholomorphic degree $l - b$ has Hopf charge $2 b - l$,
    consistently with Section 3. Every occurring weight satisfies
  $ sum_(i = 1)^s \| nu_i \| lt.eq l \, wide l - sum_(i = 1)^s \| nu_i \| in 2 bb(Z) . $
  Every weight on the extreme layer
  $ Lambda_l = {nu in bb(Z)^s : sum_(i = 1)^s \| nu_i \| = l} $
  occurs and has a one-dimensional weight space: it is spanned by the monomial using $z_i^(nu_i)$ when $nu_i gt.eq
    0$ and $macron(z)_i^(- nu_i)$ when $nu_i < 0$. This monomial is harmonic,
    since in each coordinate plane it involves at most one of $z_i \, macron(z)_i$.
    It is the only degree-$l$ monomial of that weight.
  More generally, every weight satisfying the displayed bound and parity condition occurs.
    To check its multiplicity, set $a = \( l - sum_i \| nu_i \| \) \/ 2$, a nonnegative integer.
    Every monomial of weight $nu$ is the corresponding signed monomial of degree $sum_i \| nu_i \|$,
    multiplied by $product_i \( z_i macron(z)_i \)^(a_i)$ with $a_i gt.eq 0$ and $sum_i a_i = a$.
    The full polynomial weight space therefore has dimension $binom(a + s - 1, s - 1)$.
    The polynomial Laplacian preserves the weight and maps onto the corresponding weight space two degrees lower:
    its adjoint in the positive monomial inner product is a nonzero scalar multiple of multiplication by $sum_i
    z_i macron(z)_i$, which preserves weight and is injective. Thus the harmonic weight multiplicity is
  $ binom(a + s - 1, s - 1) - binom(a + s - 2, s - 1) = binom(a + s - 2, s - 2) \, $
  where the second term is zero when $a = 0$. This standard weight formula also appears in
    Lauret–Miatello–Rossetti [10] Lemma 3.6. In particular, interior weight spaces may have dimension greater than
    one. The interpolation below isolates an entire source-to-target weight block;
    we use a rank-one conclusion only when both endpoints are on the extreme layer.
  Conjugating by a round rotation sends the family of generators to itself.
    Thus $frak(a)_(bb(C))$ is invariant under the round torus and contains each torus Fourier component of any of
    its elements. Indeed, Fourier projection is an integral of scalar multiples of torus conjugates,
    and a finite-dimensional vector subspace is closed.
  For $sigma = \( sigma_1 \, dots.h \, sigma_s \) in { plus.minus 1 }^s$,
    let $J_sigma$ rotate coordinate plane $i$ with sign $sigma_i$.
    On the $nu$-weight space, $D_(J_sigma)^2$ acts by $- \( sum_i sigma_i nu_i \)^2$. For $i eq.not j$, the identity
  $ 2^(- s) sum_(sigma in { plus.minus 1 }^s) sigma_i sigma_j [- (sum_a sigma_a nu_a)^2] = - 2 nu_i nu_j $
  shows that $frak(a)_(bb(C))$ contains a diagonal operator $A_(i j)$ acting on weight $nu$ by $nu_i nu_j +
    c_(i j)$, where $c_(i j)$ is independent of $nu$. The scalar term has no effect on brackets.
  An endomorphism Fourier component of #emph[weight shift] $delta$ satisfies $T_theta A T_theta^(- 1) =
    e^(upright(i) sum_i delta_i theta_i) A$; equivalently, it maps each $W_nu$ into $W_(nu + delta)$,
    with absent weight spaces understood to be zero. On its block from $W_nu$ to $W_(nu + delta)$,
    the operator $"ad" A_(i j)$ acts by
  #[#set math.equation(numbering: n => "(4.2)")
   $ nu_i delta_j + nu_j delta_i + delta_i delta_j . $ <eq:control-block-eigenvalues>]
  If $delta$ has at least three nonzero coordinates, these joint eigenvalues distinguish all source weights.
    In fact, equality for two sources, with difference $v$, implies
  $ v_i delta_j + v_j delta_i = 0 wide \( i eq.not j \) . $
  On the support of $delta$, the ratios $v_i \/ delta_i$ have pairwise sums zero;
    three such coordinates force every ratio to be zero. Pairing any coordinate outside the support with one in
    the support then gives $v_i = 0$ there as well.
  There are only finitely many weights. Polynomials in the commuting operators $"ad"
    A_(i j)$ therefore project onto an individual source block within a fixed shift component.
    More explicitly, for each competing source choose one coordinate of (4.2) that distinguishes it from the
    desired source, and multiply the corresponding linear interpolation factors.
    These operations preserve $frak(a)_(bb(C))$. When source and target belong to $Lambda_l$,
    the isolated nonzero block is a rank-one directed matrix.
  #strong[A rank-one symmetric operator.] Regard an extreme weight as $l$ signed tokens,
    with no opposite signs at the same coordinate. We claim that the algebra contains the directed matrices for
    every legal move
  $ upright("two equal-sign tokens at one coordinate") quad arrow.l.r quad
    upright("one token at each of two other coordinates") \, $
  where the two latter signs are arbitrary and both endpoints must remain in $Lambda_l$.
    Such a shift has three nonzero coordinates. It remains to exhibit a generator with a nonzero block for the move.
  Here is an explicit simultaneous choice of the needed coefficients.
    For three distinct coordinate indices $i \, j \, k$, let $X_a \, Y_a$ denote their real coordinate vectors and set
  $ J X_i = X_j \, wide J Y_i = X_k \, wide J Y_j = Y_k \, $
  with the three reverse images determined by $J^2 = - I$. Use the standard complex structure on the remaining
    coordinate planes. This defines an orthogonal complex structure.
    For signed variables $u_a^epsilon.alt = x_a + upright(i) epsilon.alt y_a$, $epsilon.alt in { plus.minus 1 }$,
    its vector field satisfies
  $ D_J u_i^epsilon.alt & = - x_j - upright(i) epsilon.alt x_k \,\
D_J u_j^beta & = x_i - upright(i) beta y_k \,\
D_J u_k^gamma & = y_i + upright(i) gamma y_j . $
  For every choice of the three signs, the relevant replacement coefficients are
  $ u_i^epsilon.alt mapsto u_j^beta & u_i^epsilon.alt mapsto u_k^gamma & u_j^beta mapsto u_i^epsilon.alt &
    u_k^gamma mapsto u_i^epsilon.alt\
- 1 / 2 & - frac(upright(i) epsilon.alt, 2) & 1 / 2 & - frac(upright(i) epsilon.alt, 2) $
  For completeness, there is no cancellation with other terms of $D_J^2$.
    In the independent complex linear coordinates $z_a \, macron(z)_a$, the identity $D_J^2 u = -
    u$ for linear functions gives, on homogeneous degree-$l$ polynomials,
  $ D_J^2 p = - l p + sum_(u \, v) \( D_J u \) \( D_J v \) thin partial_u partial_v p . $
  If
  $ p = \( u_i^epsilon.alt \)^a \( u_j^beta \)^b \( u_k^gamma \)^c M $
  is an extreme monomial, where $M$ uses the other coordinate planes,
    the coefficient of the split monomial is $upright(i) epsilon.alt thin a \( a - 1 \) \/ 2$,
    and that of the merge monomial is $- upright(i) epsilon.alt thin b c \/ 2$.
    They are nonzero whenever the indicated move is legal. Indeed the exponent deficits of the target force the
    differentiated variables to be precisely the two variables specified by the move.
    Since rotations commute with the Euclidean Laplacian, $D_J^2 p$ is already harmonic;
    no harmonic projection changes these coefficients. Trace subtraction does not affect this shift.
    Fourier projection and the block isolation above now give the claimed directed matrices.
  We next join $- l e_1$ to $l e_1$ by a simple path of these moves. For even $l = 2 h$, use
  $ - 2 h e_1 arrow.r - \( 2 h - 2 \) e_1 + e_2 + e_3 arrow.r dots.h.c arrow.r h e_2 + h e_3 arrow.r
    dots.h.c arrow.r 2 h e_1 \, $
  splitting negative pairs at coordinate $1$ in the first half and merging the tokens at $2 \,
    3$ into positive pairs at $1$ in the second half. This includes $l = 2$, for which the path is $- 2 e_1 \,
    e_2 + e_3 \, 2 e_1$.
  For odd $l = 2 h + 1$, $h gt.eq 1$, both starting signs admit the path
  $ plus.minus \( 2 h + 1 \) e_1 arrow.r dots.h.c arrow.r plus.minus e_1 + h e_2 + h e_3 arrow.r \( h - 1 \) e_2 +
    h e_3 + 2 e_4 . $
  The last step merges the remaining token at $1$ and one positive token at $2$ into two positive tokens at $4$.
    Reverse the positive-start path and append it to the negative-start path. The resulting path is simple:
    the two branches have opposite nonzero first coordinates until their common endpoint,
    and no branch repeats a weight. For $l = 3$, that endpoint is $e_3 + 2 e_4$.
    All intermediate weights remain extreme.
  Choose monomial bases on these one-dimensional weight spaces and normalize their directed matrices to matrix
    units. Nested brackets along a simple path give its endpoint unit, by $\[ E_(c \, b) \, E_(b \, a) \] =
    E_(c \, a)$ for distinct vertices. Hence $frak(a)_(bb(C))$ contains the unit from weight $-
    l e_1$ to weight $l e_1$. If $v = z_1^l$, torus invariance of the bilinear round pairing shows that $v$ pairs
    only with weight $- l e_1$, and
  $ v^(sans(T)) macron(v) = integral_(S^(2 s - 1)) \| z_1 \|^(2 l) thin d "vol"_(g_0) > 0 . $
  The endpoint unit is consequently a nonzero multiple of $v v^(sans(T))$. Notice also that $v^(sans(T)) v = 0$.
  #strong[From the rank-one operator to all trace-free matrices.] All round conjugates of $v
    v^(sans(T))$ belong to the algebra. We first verify that the round orbit of $v$ spans $W$.
    Up to a nonzero scalar, its members are the polynomials $\( a dot.op x \)^l$ with
  $ a in bb(C)^(2 s) \\ { 0 } \, wide a dot.op a = 0 . $
  To see this, write $a = b + upright(i) c$ with $b \, c$ real.
    The isotropy condition says that $b \, c$ are orthogonal and have equal positive length.
    After rescaling, this ordered pair is the image of the first coordinate pair under a real special orthogonal
    transformation.
  On homogeneous degree-$l$ polynomials use the Fischer bilinear form
  $ \( p \, q \)_(upright(F)) = p \( partial \) q = sum_(\| alpha \| = l) alpha ! thin p_alpha q_alpha . $
  Its restriction to real harmonic polynomials is positive definite,
    so its complex bilinear restriction to $W$ is nondegenerate. If $p in W$ annihilates the orbit powers, then
  $ \( p \, \( a dot.op x \)^l \)_(upright(F)) = l ! thin p \( a \) $
  shows that $p$ vanishes on the isotropic quadric. Therefore $p$ is divisible by the quadratic polynomial
    $Q \( x \) = sum_(a = 1)^s \( x_a^2 + y_a^2 \)$. An elementary verification is to divide by this monic
    polynomial in the last variable $y_s$; the remainder has the form $A \( x' \) y_s + B \( x' \)$,
    where $x'$ denotes the remaining variables. Evaluating at the two distinct roots for generic $x'$ forces both
    $A$ and $B$ to vanish identically.
  Such a harmonic multiple must be zero. Indeed multiplication by $Q$ is adjoint to the Euclidean Laplacian in the
    positive Hermitian Fischer form. If $p = Q q$ and $Delta p = 0$, then
  $ parallel p parallel_(upright(F))^2 = chevron.l Q q \, p chevron.r_(upright(F)) = chevron.l q \,
    Delta p chevron.r_(upright(F)) = 0 . $
  Thus no nonzero element annihilates the orbit, proving its span.
  For two orbit vectors $u \, w$,
  $ \[ u u^(sans(T)) \, w w^(sans(T)) \] = \( u^(sans(T)) w \) \( u w^(sans(T)) - w u^(sans(T)) \) . $
  For fixed $u eq.not 0$, the factor $u^(sans(T)) w$ is not identically zero on the orbit,
    by its spanning property and nondegeneracy of the round pairing.
    It is a real-analytic function of the round rotation. The real special orthogonal group is connected,
    so its nonzero locus is dense. Division by this factor and then passage to limits show that $frak(a)_(bb(C))$
    contains $u w^(sans(T)) - w u^(sans(T))$ for every pair of orbit vectors.
    Their span is the full complex skew-symmetric algebra, since the orbit spans $W$.
  For every real skew-symmetric $K$, the operator $exp \( "ad" K \)$ preserves $frak(a)_(bb(C))$;
    this uses only bracket closure in the complex algebra. It follows that $frak(a)_(bb(C))$ is invariant under
    conjugation by the full real group $S O \( V_l \)$. Here one may use that every special orthogonal matrix is a
    product of plane rotations. This group on the harmonic-function space sends $v$, up to a scalar,
    to every nonzero isotropic vector of $W$: their real and imaginary parts are orthogonal equal-length pairs,
    and $dim V_l gt.eq 3$. Consequently the algebra contains $w w^(sans(T))$ for every isotropic $w in W$.
  These matrices span all trace-free symmetric matrices. In a real orthonormal basis,
    the rank-one matrices associated with $e_i + upright(i) e_j$ and $e_i -
    upright(i) e_j$ have sum $2 \( E_(i i) - E_(j j) \)$ and difference $2 upright(i) \( E_(i j) + E_(j i) \)$.
    Together with the skew-symmetric matrices already obtained, they span $frak(s l) \( W \)$.
    We have proved $frak(a)_(bb(C)) = frak(s l) \( W \)$. Since $frak(a) subset
    frak(s l) \( V_l \)$ is a real vector subspace and complexification preserves dimension,
    it follows that $frak(a) = frak(s l) \( V_l \)$.
  #strong[Independence of the degrees.] Let $frak(h)$ be the Lie algebra generated by the tuples (4.1).
    Every one-factor projection is full by what we have just proved. Moreover
  $ N_l = binom(m + l, m) - binom(m + l - 2, m) = binom(m + l - 1, m - 1) + binom(m + l - 2, m - 1) $
  is strictly increasing in $l$. The real Lie algebras $frak(s l) \( V_l \)$ are therefore simple and pairwise
    nonisomorphic. Simplicity can be seen directly: in any nonzero ideal,
    a bracket with a matrix unit first produces an element with an off-diagonal entry if necessary;
    polynomials in the adjoint action of a generic trace-free diagonal matrix isolate an off-diagonal unit.
    Brackets with the other matrix units then produce all off-diagonal units and all diagonal differences.
  We give the resulting Lie-algebra Goursat argument explicitly; for the two-factor formulation,
    see [7] Section 3. Inductively, suppose the projection onto a preceding product $frak(b)$ is full,
    and let $frak(c)$ be the next simple factor. The projected algebra $frak(h)' subset frak(b) xor
    frak(c)$ is surjective onto both sides. The kernel of its projection onto $frak(b)$ is an ideal of $frak(c)$,
    and hence is either zero or $frak(c)$. In the latter case the whole product is present.
    In the former case $frak(h)'$ is the graph of a surjective homomorphism $frak(b) arrow.r frak(c)$.
    The image of each simple summand of $frak(b)$ is an ideal in $frak(c)$;
    a nonzero image would make that summand isomorphic to $frak(c)$. This contradicts their distinct dimensions.
    The induction proves the claimed full direct sum. ◻
]

#prodef([Remark 4.2.])[
  The quantifier over all orthogonal complex structures in Proposition 6 includes both orientation classes.
    This is used in the averaging over all sign vectors. In particular, when $s = 4$,
    restricting to one class would identify some complementary sign characters and would not justify that
    averaging step. The explicit complex structure used for the token moves can itself be completed in either
    class by reversing it on an unused coordinate plane.
]

For general background on control systems on Lie groups, see Jurdjevic–Sussmann [9].
  We give the finite-word argument with its nonsingular differential directly.

We now pass from the Lie algebra to exact finite products.
  For the integers $M_l$ in (3.9), choose the ordered real orthonormal dwell eigenbasis $e_(l \, 1) \, dots.h \,
  e_(l \, N_l)$. If $M_l gt.eq 1$, define a signed cycle by

$ Pi_l e_(l \, i) =
  cases(delim: "{", e_(l \, i + 1) \, & 1 lt.eq i < M_l \,, \( - 1 \)^(M_l - 1) e_(l \, 1) \, & i = M_l \,,
  e_(l \, i) \, & i > M_l \,) $

and set $Pi_l = I$ when $M_l = 0$. The sign of the $M_l$-cycle and its extra column sign cancel, so $det Pi_l = 1$. Thus

$ Pi = \( Pi_l \)_(l = 2)^L in cal(G) := product_(l = 2)^L S L \( V_l \) . $

#thm([Corollary 4.3.])[
  (A finite word with invertible differential).  #emph[Let $d = sum_(l = 2)^L \( N_l^2 - 1 \)$.
    There exist finitely many orthogonal complex structures $J_1 \, dots.h \, J_R$,
    an open neighborhood $U$ of zero in $bb(R)^d$, and smooth real functions $c_1 \, dots.h \, c_R$ on $U$ such that
$ cal(W) \( h \) = exp \( c_R \( h \) X_(J_R) \) dots.h.c exp \( c_1 \( h \) X_(J_1) \) $

 satisfies $cal(W) \( 0 \) = Pi$, and
$ D cal(W) \( 0 \) : bb(R)^d arrow.r T_Pi cal(G) $

 is an isomorphism. The same assertion holds for any prescribed target in $cal(G)$.]
] <prop:word>

#proof[
  Let $cal(H)$ be the subgroup of $cal(G)$ consisting of finite products of $exp \( t X_J \)$ with arbitrary real
    $t$. Define
  $ E = "span"_(bb(R)) { "Ad"_h X_J : h in cal(H) } . $
  Conjugation by every generator exponential preserves $E$.
    Differentiating shows that $E$ is stable under bracketing with each $X_J$.
    Since $E$ contains the generators, it contains their generated Lie algebra,
    which is the whole Lie algebra of $cal(G)$ by Proposition 6.
    Choose a basis $"Ad"_(h_a) X_(K_a)$, $1 lt.eq a lt.eq d$, from this spanning set. The map
  $ F \( t_1 \, dots.h \, t_d \) = #scale(x: 120%, y: 120%)[\(] h_d exp \( t_d X_(K_d) \) h_d^(- 1)
    #scale(x: 120%, y: 120%)[\)] dots.h.c #scale(x: 120%, y: 120%)[\(] h_1 exp \( t_1 X_(K_1) \) h_1^(- 1)
    #scale(x: 120%, y: 120%)[\)] $
  has value $I$ at zero and differential
  $ D F \( 0 \) \( t \) = sum_(a = 1)^d t_a "Ad"_(h_a) X_(K_a) \, $
  which is an isomorphism. Every factor $h_a$, and its inverse, is a fixed finite word of generator exponentials.
    Thus every value of $F$ is in $cal(H)$.
  The inverse function theorem gives an identity neighborhood contained in $cal(H)$,
    making $cal(H)$ an open subgroup. The group $S L_N \( bb(R) \)$ is connected:
    polar decomposition reduces this to connectedness of $S O \( N \)$ and of the positive definite
    determinant-one matrices, the latter being joined to the identity by $S^t$, $0 lt.eq t lt.eq 1$.
    Hence $cal(G)$ is connected, and its open subgroup $cal(H)$ is all of $cal(G)$.
  Choose a fixed finite word representing the desired target and multiply it by $F$.
    The resulting word has that target as its value at zero and still has invertible differential.
    Expanding the fixed conjugating words gives the asserted form,
    with fixed complex structures and smooth real time parameters. ◻
]

#prodef([Remark 4.4.])[
  The real times in Corollary 8 may have either sign. They will be realized as integrals of bounded smooth bumps
    $z$ in weak metric pulses of the form $q = 1 + z \/ T$. Both signs are admissible once $T$ is sufficiently
    large, because $q > 0$ and converges uniformly to $1$. Likewise, the class of $J$ may be changed while $q =
    1$, when the angular metric is independent of $J$. Thus neither the signed times nor the two orientation
    classes impose a restriction on the later construction.
]

== 5 A complete metric with nonnegative Ricci curvature <sec:geometry>

Fix spectral data in the sense specified at the end of Section 3.
  The geometric properties we need are $0 < a_(*) < 1 < q_(*)$, the strict inequality (2.1) at $a =
  a_(*)$ for every $q in \[ 1 \, q_(*) \]$, and the fixed cutoff condition (3.8).
  Fix also the reference complex structure $J_0$ used for the dwell metric.
  We describe a metric construction that works for any prescribed finite family of pulse controls.
  Its curvature estimates will be uniform over all subsequent choices of those controls.
  Slowly varying links with fixed volume form also appear in Colding–Naber [5] Lemma 2.1.
  We give the curvature calculation for the present family in full.

The radial cutoff and link parameters were fixed before $k \, L$ and before any pulse family.
  Condition (3.8) will give $b = a' \/ a gt.eq - 1 \/ 4$ below.
  Even very large bounds for a fixed finite pulse family are handled solely by increasing the starting index
  $j_0$. No spectral parameter is changed in response to the controls.

===== 5.1 Pulse data and the period schedule. <pulse-data-and-the-period-schedule.>

Let $K$ be a compact ball in a finite-dimensional real parameter space.
  Choose finitely many disjoint open subintervals $I_1 \, dots.h \, I_R$ of $\( 0 \, 1 \)$,
  with disjoint closures, smooth functions $beta_nu$ compactly supported in $I_nu$,
  and orthogonal complex structures $J_nu$. For each $nu$, let $c_nu \( h \)$ be smooth on a neighborhood of $K$. Set

$ z \( tau \, h \) = sum_(nu = 1)^R c_nu \( h \) beta_nu \( tau \) . $

The amplitudes $c_nu$ may have either sign. The functions, complex structures,
  and compact set $K$ are fixed once and for all. In applications the bumps can be normalized to have integral
  $1$, so their amplitudes specify the flow parameters in Corollary 8.

For $j gt.eq 1$, define

#[#set math.equation(numbering: n => "(5.1)")
 $ T_j = j^6 \, wide L_j = j^7 \, wide t_1 = 10 \, wide t_(j + 1) = t_j + L_j + 4 T_j . $ <eq:periods>]

Choose a starting index $j_0$, to be made large below. Put $q \( t \) = 1$ for $t lt.eq t_(j_0)$.
  For each $j gt.eq j_0$, choose a parameter $h_j in K$ and divide $\[ t_j \, t_(j + 1) \]$ into the following
  five successive intervals:

+ a pulse of duration $T_j$, on which
  $ q \( t \) = 1 + T_j^(- 1) z #scale(x: 120%, y: 120%)[\(] \( t - t_j \) \/ T_j \,
    h_j #scale(x: 120%, y: 120%)[\)] \; $
  on the support of the $nu$-th bump the complex structure is $J_nu$;
+ an upward ramp of duration $T_j$, taking $q$ from $1$ to $q_(*)$;
+ a dwell interval of duration $L_j$, on which $q = q_(*)$;
+ a downward ramp of duration $T_j$, taking $q$ from $q_(*)$ to $1$;
+ a round rest of duration $T_j$, on which $q = 1$.

Use $J_0$ throughout the last four intervals. Both ramps use a fixed smooth nondecreasing profile
  $rho : \[ 0 \, 1 \] arrow.r \[ 0 \, 1 \]$, equal to $0$ near $0$ and $1$ near $1$:
  their respective formulas in their own rescaled time are $1 + \( q_(*) - 1 \) rho$ and $q_(*) - \( q_(*) - 1 \)
  rho$. The last four intervals form the diagonal leg of a period, as illustrated in Figure 1.

#figure(
  [(152,41) (0,17)(25,16)Pulse $q = 1 + z \/ T_j$ (25,17)(24,16)Increase $1 arrow.r q_(*)$ (49,17)(55,16)Dwell $q = q_(*)$ (104,17)(24,16)Decrease $q_(*) arrow.r 1$ (128,17)(24,16)Round rest $q = 1$ (12.5,12)(0,0)$T_j$ (37,12)(0,0)$T_j$ (76.5,12)(0,0)$L_j$ (116,12)(0,0)$T_j$ (140,12)(0,0)$T_j$ (25,6)(1,0)127 (25,6)(0,1)2 (152,6)(0,1)2 (88.5,2)(0,0)Fixed diagonal leg: $J = J_0$ (0,38)(0,0)\[l\]$t_j$ (152,38)(0,0)\[r\]$t_(j + 1)$],
  caption: [Figure 1: A period in logarithmic radius, with $T_j = j^6$ and $L_j = j^7$. The pulse contains finitely many weak bumps with round gaps between them. The four subsequent pieces form the fixed diagonal leg. Horizontal lengths are schematic. ],
) <fig:period>

The notation $J \( t \)$ is only a label for the complex structure used in the metric at time $t$.
  It need not be continuous. Labels are changed only in open intervals where $q = 1$, and $G \( a \, 1 \, J \) =
  a^2 g_0$ is independent of $J$ there. The supported bumps provide such round gaps before, between,
  and after their supports.

#thm([Proposition 5.1.])[
  #emph[For the fixed spectral data above, there are a smooth function $a :
    bb(R) arrow.r \( 0 \, 1 \]$ and an index $j_(upright("geom"))$ such that, for every $j_0 gt.eq
    j_(upright("geom"))$, every sequence $\( h_j \)_(j gt.eq j_0)$ in $K$, used in the preceding scheme,
    defines a smooth complete metric on $bb(R)^(m + 1)$ with nonnegative Ricci curvature:
$ g = d r^2 + r^2 gamma \( log r \) \, wide gamma \( t \) = G \( a \( t \) \, q \( t \) \, J \( t \) \) . $

 The function $a$ is identically $1$ for $t lt.eq 2$, decreases to $a_(*)$, and, for some $mu > 0$, satisfies
#[#set math.equation(numbering: n => "(5.2)")
 $ b \( t \) := frac(a' \( t \), a \( t \)) = - mu \( 1 + t \)^(- 5 \/ 4) quad \( t gt.eq 4 \) \, wide
   log frac(a \( t \), a_(*)) = 4 mu \( 1 + t \)^(- 1 \/ 4) quad \( t gt.eq 4 \) . $ <eq:scale-tail>]

 The metric is Euclidean near the origin, and its distance from the origin is exactly $r$. Its volume form is
$ d "vol"_g = r^m a \( log r \)^m thin d r thin d "vol"_(g_0) . $

 The function $a$ and the starting index $j_0$ can be chosen independently of the sequence of control parameters.]
] <prop:metric>

#proof[
  #strong[The radial scale.] Use the fixed smooth nondecreasing cutoff $chi$ from Section 3. For $t > 2$, put
  $ b \( t \) = - mu chi \( t \) \( 1 + t \)^(- 5 \/ 4) \, wide a \( t \) = exp (integral_2^t b \( u \) thin d u) \, $
  and set $b = 0$, $a = 1$ for $t lt.eq 2$. The integral of $chi \( t \) \( 1 + t \)^(- 5 \/ 4)$ over
    $\( 2 \, oo \)$ is positive and finite. Thus there is a unique $mu > 0$ for which $a \( t \) arrow.r a_(*)$;
    moreover $mu arrow.r 0$ as $a_(*) arrow.r 1$. Condition (3.8) gives $b gt.eq - 1 \/ 4$.
    Since $chi' gt.eq 0$, for $t > 2$ we have
  $ b' \( t \) lt.eq - frac(5 b \( t \), 4 \( 1 + t \)) \, wide b + b' + b^2 lt.eq
    b (1 - frac(5, 4 \( 1 + t \)) + b) lt.eq 0 . $
  The last factor is positive for $t > 2$ and $b gt.eq - 1 \/ 4$. The tail identities (5.2) follow by integration.
  #strong[The slice shape and the mixed Ricci tensor.] Write $g_r =
    r^2 gamma \( log r \)$ for the metric on a slice. A dot will denote differentiation in $t = log r$.
    Identify the tangent bundles of the slices using the product coordinates. Their shape endomorphism is
  $ S = 1 / 2 g_r^(- 1) partial_r g_r = r^(- 1) \( I + B \) \, wide B = 1 / 2 gamma^(- 1) dot(gamma) = b I + H . $
  Where a nonround part of a bump or a ramp occurs, $J$ is fixed. Direct differentiation of $G$ gives
  #[#set math.equation(numbering: n => "(5.3)")
   $ H = frac(dot(q), 2 q) (P_J - 1 / m I) \, wide "tr" H = 0 \, wide "tr" \( H^2 \) =
     frac(m - 1, 4 m) (dot(q) / q)^2 . $ <eq:shape-anisotropy>]
  On round gaps $H = 0$. Thus the same identities apply everywhere,
    without requiring derivatives of the labels $J \( t \)$.
  The projection $P_J$ is also the orthogonal projection for $gamma$ onto the Hopf direction.
    Indeed, $xi_J$ has constant squared length $a^2 q^(1 - 1 \/ m)$ on a fixed slice,
    and its metric dual is the same constant times $eta_J$. The flow of $xi_J$ preserves both $g_0$ and $eta_J$,
    so $xi_J$ is a Killing field for $gamma$. A Killing field of constant length has zero divergence and
    $nabla_(xi_J)^gamma xi_J = 0$: the latter identity follows by pairing the Killing equation with $xi_J$.
    Equivalently, its unit normalization $E$ satisfies
  $ "div"_gamma \( E ⊗ E^flat \) = \( "div"_gamma E \) E^flat + \( nabla_E^gamma E \)^flat = 0 . $
  Therefore $"div"_gamma P_J = 0$, and $"div"_gamma H = 0$,
    because the coefficients in (5.3) are constant on a slice.
    The trace $"tr" S = r^(- 1) m \( 1 + b \)$ is also spatially constant.
    The Codazzi formula consequently makes the mixed Ricci tensor identically zero.
  We record the remaining curvature identities explicitly. For a metric $d r^2 + g_r$,
    the connection components involving the radial variable are $Gamma_(i j)^r = - \( g_r \)_(i k) S^k
    zws_j$ and $Gamma_(r j)^i = S^i zws_j$. They give the normal curvature endomorphism $- partial_r S - S^2$.
    Its trace is $"Ric"_g \( partial_r \, partial_r \)$. Tracing the tangential Gauss equation contributes
    $S^2 - \( "tr" S \) S$ to the intrinsic slice Ricci endomorphism. Adding the normal contribution gives
  $ "Ric"_g^(\#) \|_(T S^m) = "Ric"_(g_r)^(\#) - partial_r S - \( "tr" S \) S . $
  Here an index of the tangential tensor is raised using $g_r$.
    The mixed formula is $"div"_(g_r) S - d \( "tr" S \)$, already shown to vanish.
    Substitution of $S = r^(- 1) \( I + B \)$, and $"tr" B = m b$, yields
  #[#set math.equation(numbering: n => "(5.4)")
   $ r^2 "Ric"_g \( partial_r \, partial_r \) & = - m \( b + dot(b) + b^2 \) - "tr" \( H^2 \) \,\
r^2 "Ric"_g^(\#) \|_(T S^m) & = "Ric"_gamma^(\#) - dot(B) - #scale(x: 120%, y: 120%)[\(] m \( 1 + b \) -
  1 #scale(x: 120%, y: 120%)[\)] \( I + B \) . $ <eq:radial-slice-ricci>]
  In particular, the $H^2$ terms cancel from the tangential identity.
  #strong[Uniform positivity on the periods.] All constants in the estimates that follow may depend on the fixed
    pulse data and $K$, but not on $j$ or on any choices of $h_j$. On a pulse,
  $ \| q - 1 \| = O \( T_j^(- 1) \) \, wide \| dot(q) \| = O \( T_j^(- 2) \) \, wide \| dot.double(q) \| =
    O \( T_j^(- 3) \) . $
  On either ramp, $\| dot(q) \| = O \( T_j^(- 1) \)$ and $\| dot.double(q) \| = O \( T_j^(- 2) \)$.
    There is no variation of $q$ during the dwell or rest. Taking $j_0$ large makes $q > 0$ throughout all pulses,
    including those with negative amplitudes. The metrics on all slices then lie in a fixed uniformly equivalent
    family. Formula (5.3) gives, throughout period $j$,
  $ parallel H parallel = O \( T_j^(- 1) \) \, wide parallel dot(H) parallel = O \( T_j^(- 2) \) \, wide
    "tr" \( H^2 \) = O \( T_j^(- 2) \) = O \( j^(- 12) \) . $
  The stronger pulse bound is $"tr" \( H^2 \) = O \( T_j^(- 4) \)$.
    To obtain the derivative estimate, note that $P_J$ is independent of $t$ where $q$ varies;
    on every label-changing gap $H$ vanishes identically.
  From (5.1),
  $ t_j tilde.op j^8 / 8 \, wide sup_(t in \[ t_j \, t_(j + 1) \]) lr(|t / t_j - 1|) arrow.r 0 . $
  On the scale tail, an exact calculation gives
  $ - m \( b + dot(b) + b^2 \) = m mu \( 1 + t \)^(- 5 \/ 4)
    (1 - frac(5, 4 \( 1 + t \)) - mu \( 1 + t \)^(- 5 \/ 4)) . $
  It has a positive lower bound of order $j^(- 10)$, uniformly on period $j$, for all sufficiently large $j$.
    This dominates the $O \( j^(- 12) \)$ term $"tr" \( H^2 \)$.
    The radial component in (5.4) is therefore positive once $j_0$ is large enough.
  For the tangential component, the strict inequality (2.1) on the compact interval $\[ 1 \, q_(*) \]$ implies
    that, for some fixed $delta > 0$,
  $ "Ric"_(G \( a_(*) \, q \, J_0 \))^(\#) gt.eq \( m - 1 + 2 delta \) I wide \( 1 lt.eq q lt.eq q_(*) \) . $
  All $J$ give the same intrinsic Ricci eigenvalues. Since $a \( t \) arrow.r a_(*)$,
    this estimate persists with $2 delta$ replaced by $delta$ along sufficiently late ramps, dwells,
    and round rests. The pulse values satisfy $q arrow.r 1$ uniformly;
    the strict inequality at $\( a_(*) \, 1 \)$ likewise supplies the same conclusion on late pulses,
    after decreasing $delta$ if necessary. This argument allows $q < 1$ on a pulse.
    Thus all sufficiently late slices satisfy
  $ "Ric"_gamma^(\#) gt.eq \( m - 1 + delta \) I . $
  On the other hand, $B = b I + H$, $b \, dot(b) arrow.r 0$, and the displayed bounds for $H \,
    dot(H)$ show uniformly that
  $ dot(B) + #scale(x: 120%, y: 120%)[\(] m \( 1 + b \) - 1 #scale(x: 120%, y: 120%)[\)] \( I + B \) = \( m - 1 \)
    I + o \( 1 \) . $
  The tangential component of (5.4) is consequently positive as well.
    All the thresholds used here depend only on the fixed data and $K$.
    Since the mixed component is zero, these estimates prove $"Ric"_g gt.eq
    0$ on every period for every admitted parameter sequence.
  #strong[The initial region and the global manifold.] Before $t_(j_0)$ the metric is round in the angular variable:
  $ g = d r^2 + f \( r \)^2 g_0 \, wide f \( r \) = r thin a \( log r \) . $
  The scale construction gives
  $ f' \( r \) = a \( 1 + b \) in \( 0 \, 1 \] \, wide f'' \( r \) = a / r \( b + dot(b) + b^2 \) lt.eq 0 . $
  Its radial and tangential sectional curvatures are respectively $- f'' \/ f$ and $\( 1 - \( f' \)^2 \) \/ f^2$,
    as follows from the same normal curvature and Gauss formulas.
    They are nonnegative, proving the required Ricci condition in this region.
  The pulse bumps and ramp profiles are constant or flat at all junctions,
    and label changes occur only in round open intervals. Thus $gamma$, and hence $g$, is smooth for $r > 0$.
    Only finitely many periods meet any bounded interval of $t$,
    so the infinite sequence of periods introduces no finite accumulation of junctions.
    For $t lt.eq 2$, equivalently $r lt.eq e^2$, both $a$ and $q$ equal $1$.
    The metric is exactly Euclidean there and extends smoothly across the origin.
    The volume formula follows from Lemma 2.
  A radial path from the origin to a point of radius $r$ has length $r$.
    Conversely, the length of any such path is at least the total variation of its radial coordinate,
    and hence at least $r$. Thus $d_g \( 0 \, x \) = r \( x \)$.
    The closed centered balls are the compact sets ${ r lt.eq R }$ in the underlying $bb(R)^(m + 1)$,
    so the metric is complete. The underlying manifold is connected, smooth, and without boundary. ◻
]

== 6 Exact transmission on the regular harmonic subspaces <sec:transmission>

The link, selection, and control results are now proved. Fix finite spectral data as specified at the end of
  Section 3; Lemma 5 supplies such data. Thus the real spaces $V_l$, the finite range $2 lt.eq l lt.eq L$,
  and the selected multiplicities $M_l$ are fixed. Keep the ordered dwell eigenbases and signed cycles $Pi_l$
  chosen in Section 4. Every matrix in this section acts in those fixed round orthonormal coordinates.

Our task is to make the harmonic equation realize these cycles after an entire period,
  including its long nonround dwell. First we choose the pulse family using Corollary 8.
  Proposition 10 then supplies the metric for every admitted sequence once the start is sufficiently late.
  The remainder of this section proves uniform estimates for those provisional metrics before choosing the actual
  sequence.

=== 6.1 The ideal pulse and its geometric realization <the-ideal-pulse-and-its-geometric-realization>

We now choose the constants in the control proposition to agree with the response of the radial equation.
  Let $p_oo = m - 1$, and for $2 lt.eq l lt.eq L$ define

#[#set math.equation(numbering: n => "(6.1)")
 $ theta_l > 0 \, wide theta_l^2 + p_oo theta_l = a_(*)^(- 2) B_l \, wide kappa_l =
   frac(a_(*)^(- 2), p_oo + 2 theta_l) > 0 . $ <eq:round-root>]

Apply Corollary 8 to the target $Pi$ with these $kappa_l$.
  Restrict its parameter domain to a closed ball $K$ centered at zero and contained in $U$.
  Choose open intervals $I_1 \, dots.h \, I_R subset \( 0 \, 1 \)$,
  in chronological order and with disjoint closures, and smooth functions $beta_nu$ compactly supported in $I_nu$
  with $integral_0^1 beta_nu \( tau \) thin d tau = 1$. Put

#[#set math.equation(numbering: n => "(6.2)")
 $ z \( tau \, h \) & = sum_(nu = 1)^R c_nu \( h \) beta_nu \( tau \) \,\
R_l \( tau \, h \) & = kappa_l sum_(nu = 1)^R c_nu \( h \) beta_nu \( tau \) (B_l / m I + D_(J_nu)^2 \|_(V_l)) .
  $ <eq:pulse-profile>]

These functions, with all derivatives that occur below, are bounded on the fixed compact parameter set. Let $H_l$ solve

#[#set math.equation(numbering: n => "(6.3)")
 $ partial_tau H_l = R_l \( tau \, h \) H_l \, wide H_l \( 0 \, h \) = I . $ <eq:ideal-pulse>]

For a matrix $C$ on $V_l$ with positive determinant, define

$ cal(N)_l \( C \) = \( det C \)^(- 1 \/ N_l) C . $

Each bump in (6.2) is a scalar function of time times one constant matrix.
  It therefore contributes $exp #scale(x: 120%, y: 120%)[\(] c_nu \( h \) kappa_l \( B_l I \/ m + D_(J_nu)^2 \)
  #scale(x: 120%, y: 120%)[\)]$ to $H_l \( 1 \, h \)$, with later bumps multiplying on the left.
  For positive-determinant matrices, $cal(N)_l \( C_2 C_1 \) = cal(N)_l \( C_2 \) cal(N)_l \( C_1 \)$;
  also $cal(N)_l \( e^C \) = e^(C_(upright("tf")))$ for every real matrix $C$.
  Thus removing the determinant removes the scalar part of each exponent. Consequently

#[#set math.equation(numbering: n => "(6.4)")
 $ Phi \( h \) := #scale(x: 120%, y: 120%)[\(] cal(N)_l \( H_l \( 1 \, h \) \)
   #scale(x: 120%, y: 120%)[\)]_(l = 2)^L = cal(W) \( h \) \,\
Phi \( 0 \) = Pi \, wide D Phi \( 0 \) upright(" is an isomorphism") . $ <eq:ideal-word>]

The determinants of the $H_l$ are positive, since they are exponentials of integrals of real traces.

Apply Proposition 10 to this fixed pulse family. Its proof supplies a threshold $j_(upright("geom"))$ such that
  every $j_0 gt.eq j_(upright("geom"))$ and every parameter sequence in $K$ give a smooth complete metric with
  nonnegative Ricci curvature. Use exactly the radial scale $a$, cutoff, and five-part schedule (5.1) fixed there.
  In particular, $d_g \( 0 \, x \) = r \( x \)$, $b = a' \/ a gt.eq - 1 \/ 4$,
  and the angular volume density is $a \( t \)^m$ times round volume.
  The four pieces after the pulse form the whole diagonal leg shown in Figure 1.

=== 6.2 The center-regular value equation <the-center-regular-value-equation>

Before analyzing the harmonic equation, we record one estimate for matrix differences.
  It does not require the matrices in a product to commute.
  All matrix norms in its applications are Frobenius norms from the fixed round inner products;
  in fixed finite dimensions they also control operator norms.

#thm([Lemma 6.1.])[
  (A damped matrix difference).  #emph[Let $E : \[ u \, v \] arrow.r
    bb(R)^(N times N)$ be continuously differentiable, and let $F \, sans(L) \,
    sans(R)$ be continuous matrix-valued functions on the same interval. Suppose
$ E' = F - sans(L) E - E sans(R) $

 there, where $sans(L) \, sans(R)$ are symmetric and $lambda_min \( sans(L) \) + lambda_min \( sans(R) \) gt.eq
   gamma > 0$. Then, for $u lt.eq t lt.eq v$,
#[#set math.equation(numbering: n => "(6.5)")
 $ parallel E \( t \) parallel & lt.eq e^(- gamma \( t - u \)) parallel E \( u \) parallel +
   integral_u^t e^(- gamma \( t - w \)) parallel F \( w \) parallel thin d w \,\
integral_u^v parallel E \( t \) parallel thin d t & lt.eq
  gamma^(- 1) (parallel E \( u \) parallel + integral_u^v parallel F \( t \) parallel thin d t) .
  $ <eq:damping-pointwise>]

]
] <lem:damping>

#proof[
  The Frobenius inner product gives
  $ 1 / 2 frac(d, d t) parallel E parallel^2 = chevron.l E \, F chevron.r - chevron.l E \, sans(L) E chevron.r -
    chevron.l E \, E sans(R) chevron.r lt.eq parallel E parallel thin parallel F parallel -
    gamma parallel E parallel^2 . $
  The corresponding upper differential inequality for $parallel E parallel$ holds also at its zeros,
    by continuity (or by first replacing the norm by $\( parallel E parallel^2 + epsilon^2 \)^(1 \/ 2)$ and
    letting $epsilon arrow.b 0$). Multiplication by $e^(gamma t)$ and integration gives (6.5).
    Integrating that estimate in $t$ and interchanging the nonnegative integrals gives (6.5). ◻
]

For a harmonic function whose angular part belongs to $V_l$, write

$ u \( r \, omega \) = sum_(i = 1)^(N_l) Y_i \( log r \) e_(l \, i) \( omega \) . $

We identify its coefficient vector $Y \( t \)$ with $sum_i Y_i \( t \) e_(l \, i) in V_l$.
  The function $u$ is called #emph[center-regular] if it extends smoothly across the origin.
  The volume formula in Proposition 10 is the reason that a closed equation holds on this fixed coefficient space.
  With $t = log r$, it is

#[#set math.equation(numbering: n => "(6.6)")
 $ Y'' + p \( t \) Y' - A_l \( t \) Y = 0 \, wide p \( t \) = m - 1 + m b \( t \) \, wide A_l \( t \) =
   A_l \( a \( t \) \, q \( t \) \, J \( t \) \) . $ <eq:harmonic-ode>]

Indeed, the radial density is $r^m a \( log r \)^m$. Its logarithmic derivative contributes $m +
  m b \( t \)$ in the radial equation, and the change $t = log r$ subtracts $1$, giving $p \( t \)$.
  The density is constant in the angular variable, and (2.2) preserves $V_l$,
  so no additional angular terms or other harmonic degrees occur.

#thm([Lemma 6.2.])[
  (The center-regular value equation).  #emph[There are a threshold $j_(upright("reg")) gt.eq
    j_(upright("geom"))$ and constants $0 < c_P < C_P$ such that the following holds for every $j_0 gt.eq
    j_(upright("reg"))$, every sequence of parameters in $K$, and every $2 lt.eq l lt.eq L$.
    There is a unique smooth symmetric matrix $P_l \( t \)$ satisfying
#[#set math.equation(numbering: n => "(6.7)")
 $ P'_l = A_l - p P_l - P_l^2 \, wide P_l = l I quad \( t lt.eq 2 \) . $ <eq:riccati>]

 It satisfies
#[#set math.equation(numbering: n => "(6.8)")
 $ c_P I lt.eq P_l \( t \) lt.eq C_P I wide \( t in bb(R) \, med 2 lt.eq l lt.eq L \) . $ <eq:riccati-barriers>]

 The solutions of $Y' = P_l Y$ are exactly the center-regular solutions of (6.6).
   Their value vector at any one time can be prescribed arbitrarily and determines the solution uniquely.
   At each pulse start one also has
#[#set math.equation(numbering: n => "(6.9)")
 $ parallel P_l \( t_j \) - theta_l I parallel lt.eq C j^(- 2) wide \( j gt.eq j_0 \) \, $ <eq:round-reset>]

 including the first pulse. The constants and the threshold are uniform over all preceding choices of the
   parameters in $K$.]
] <lem:regular>

#proof[
  The matrices $A_l \( t \)$ are symmetric. For sufficiently large allowed $j_0$,
    the values of $a$ and $q$ lie in fixed compact positive intervals, and only finitely many $V_l$ are involved.
    Positivity of (2.2) therefore gives constants
  $ 0 < lambda_(-) I lt.eq A_l \( t \) lt.eq lambda_(+) I . $
  The radial condition $b gt.eq - 1 \/ 4$, together with $b lt.eq 0$, gives
  $ 0 < p_(-) := 3 m \/ 4 - 1 lt.eq p \( t \) lt.eq p_(+) := m - 1 . $
  Choose $c_P > 0$ below all the initial values $l$ so that $lambda_(-) - p_(+) c_P - c_P^2 > 0$,
    and choose $C_P$ above all of them so that $lambda_(+) - p_(-) C_P - C_P^2 < 0$.
    We may decrease $c_P$ and increase $C_P$ so that every $theta_l$ also lies strictly between them.
  The Riccati equation preserves symmetry. At a first contact with the lower barrier,
    a unit vector $v$ with $P_l v = c_P v$ satisfies
  $ v^(sans(T)) P'_l v gt.eq lambda_(-) - p_(+) c_P - c_P^2 > 0 . $
  At a contact with the upper barrier the corresponding derivative is at most $lambda_(+) - p_(-) C_P -
    C_P^2 < 0$. These strict inward derivatives prevent an eigenvalue from crossing either barrier.
    The bounds also keep $P_l$ in a compact set of matrices on every finite time interval,
    so local existence for the ordinary differential equation continues for all later times.
    Uniqueness follows from the same local ordinary differential equation theorem.
    In the Euclidean region, $A_l = B_l I$ and $p = m - 1$, so $P_l = l I$ indeed satisfies the equation there.
  Let $cal(F)_l \( t \)$ be the fundamental matrix of $Y' = P_l Y$ with $cal(F)_l \( 2 \) = I$. Its determinant is
  $ det cal(F)_l \( t \) = exp (integral_2^t "tr" P_l \( w \) thin d w) > 0 . $
  Moreover,
  $ Y'' = \( P'_l + P_l^2 \) Y = A_l Y - p Y' \, $
  so its columns solve (6.6). On $t lt.eq 2$ they are $e^(l \( t - 2 \))$ times constant vectors.
    Conversely, the two scalar radial factors for (6.6) in this region are $e^(l t)$ and
    $e^(- \( l + m - 1 \) t)$. Smoothness at the origin eliminates the second factor.
    Thus every center-regular solution is one of the solutions $Y' = P_l Y$.
    Invertibility of $cal(F)_l \( t \)$ gives the assertion about arbitrary value data.
  It remains to prove the reset estimate. The schedule gives
  #[#set math.equation(numbering: n => "(6.10)")
   $ t_j = j^8 / 8 + O \( j^7 \) \, wide sup_(t in \[ t_j \, t_(j + 1) \]) lr(|t / t_j - 1|) arrow.r
     0 . $ <eq:time-asymptotic>]
  Times on period $j$ and on the final rest immediately preceding it are therefore comparable to $j^8$. From (5.2),
  #[#set math.equation(numbering: n => "(6.11)")
   $ a \( t \) - a_(*) = O \( j^(- 2) \) \, wide p \( t \) - p_oo = O \( j^(- 10) \) $ <eq:period-tail>]
  uniformly on these intervals. On a round interval set $E_0 = P_l - theta_l I$.
    Subtracting (6.1) from (6.7) gives the exact difference equation
  $ E'_0 = f_l^(upright("rd")) \( t \) I - \( p I + P_l \) E_0 - E_0 theta_l I \, wide
    f_l^(upright("rd")) \( t \) = a \( t \)^(- 2) B_l - p \( t \) theta_l - theta_l^2 . $
  Here $f_l^(upright("rd")) = O \( j^(- 2) \)$ by (6.11). The symmetric coefficients $p I +
    P_l$ and $theta_l I$ have a fixed positive sum of lower eigenvalue bounds.
    Lemma 11, on a final rest of length $T_(j - 1)$, gives
  $ parallel P_l \( t_j \) - theta_l I parallel lt.eq C e^(- gamma T_(j - 1)) + C j^(- 2) = O \( j^(- 2) \) . $
  The discrepancy at the start of the rest is bounded by (6.8), independently of the history.
    For the first pulse, the interval up to $t_(j_0)$ is entirely round.
    Apply the same estimate on $\[ t_(j_0) \/ 2 \, t_(j_0) \]$ once $j_0$ is large.
    Its length tends to infinity and all its times are comparable to $j_0^8$, so the same bound follows.
    This proves (6.9) with the claimed uniformity. ◻
]

=== 6.3 The response of one pulse <subsec:pulse>

The reset brings the regular radial derivative close to the round value $theta_l$,
  but its $O \( j^(- 2) \)$ error cannot simply be multiplied by the pulse duration $T_j = j^6$.
  The next proof uses an exact scalar radial solution for the long common growth and integrates the remaining,
  damped matrix error. This is the point at which the denominator $p_oo + 2 theta_l$ in (6.1) enters.
  Contraction properties of positive matrix Riccati flows are classical; see Lawson–Lim [11] Theorem 8.5.
  We prove the forced estimates, including their parameter derivatives, in the form used here.

Fix a period $j$, hold all parameters in earlier periods fixed, and let the current parameter $h$ vary in $K$. Write

$ T = T_j \, wide tau = \( t - t_j \) \/ T \, wide eta_j = j^(- 2) + T^(- 1) . $

Let $cal(B)_(l \, j) \( h \)$ be the value transmission for $Y' = P_l Y$ from the start to the end of the pulse,
  and write $P_(l \, e) \( h \) = P_l \( t_j + T \, h \)$. Define the scalar solution

#[#set math.equation(numbering: n => "(6.12)")
 $ v'_l = a \( t \)^(- 2) B_l - p \( t \) v_l - v_l^2 \, wide v_l \( t_j \) = theta_l \, wide phi_(l \, j) =
   integral_(t_j)^(t_j + T) v_l \( t \) thin d t . $ <eq:scalar-baseline>]

This solution is independent of $h$ and of the earlier parameters.

#thm([Lemma 6.3.])[
  (Pulse limit with one parameter derivative).  #emph[For the fixed compact ball and pulse family,
#[#set math.equation(numbering: n => "(6.13)")
 $ e^(- phi_(l \, j)) cal(B)_(l \, j) \( h \) & = H_l \( 1 \, h \) + O_(C^1) \( eta_j \) \,\
P_(l \, e) \( h \) & = theta_l I + O_(C^1) \( eta_j \) . $ <eq:pulse-limit>]

 Here $O_(C^1) \( eta_j \)$ means that the norm and the norm of its first derivative in the current parameter $h$,
   uniformly on $K$, are at most $C eta_j$. The constants and the large-$j$ threshold are independent of every
   admitted preceding history.]
] <lem:pulse>

#proof[
  The scalar barriers used in Lemma 12 also keep $v_l$ between fixed positive constants.
    Subtracting (6.1) from (6.12) gives
  $ \( v_l - theta_l \)' = #scale(x: 120%, y: 120%)[\(] a \( t \)^(- 2) B_l - p \( t \) theta_l -
    theta_l^2 #scale(x: 120%, y: 120%)[\)] - \( p + v_l + theta_l \) \( v_l - theta_l \) . $
  Its initial value is zero. The forcing is $O \( j^(- 2) \)$ by (6.11),
    and the damping coefficient is uniformly positive. Thus
  #[#set math.equation(numbering: n => "(6.14)")
   $ v_l - theta_l = O \( j^(- 2) \) quad upright("throughout the pulse") . $ <eq:baseline-close>]
  We retain $v_l$ exactly in the value equation: even the small pointwise difference in (6.14) can have a large
    integral over $T_j$.
  For the angular operator, expand (2.2) at $q = 1$. Its first derivative in $q$ is
  $ a^(- 2) (B_l / m I + D_J^2 \|_(V_l)) . $
  In particular the trace-free part has the positive coefficient $a^(- 2) \( D_J^2 \)_(upright("tf"))$ that
    appears in (4.1). Since $q = 1 + z \/ T$ on the pulse and $a \( t \) - a_(*) = O \( j^(- 2) \)$,
    Taylor’s formula gives
  #[#set math.equation(numbering: n => "(6.15)")
   $ A_l \( t \, h \) & = a \( t \)^(- 2) B_l I + frac(p_oo + 2 theta_l, T) R_l \( tau \, h \) +
     cal(E)_(A \, l) \( t \, h \) \,\
parallel cal(E)_(A \, l) parallel_(C_h^1) & lt.eq C (j^(- 2) / T + 1 / T^2) . $ <eq:angular-expansion>]
  At most one bump is nonzero at any time. In the gaps the angular operator is exactly scalar.
    Smooth boundedness of the profiles and their first $h$-derivatives proves the uniform remainder bound,
    also across those gaps.
  Set
  $ Q_l \( t \, h \) = v_l \( t \) I + 1 / T R_l \( tau \, h \) . $
  It is symmetric, and it has a fixed positive lower eigenvalue bound when $j$ is large. Its Riccati residual is
  $ rho_l = A_l - p Q_l - Q_l^2 - Q'_l . $
  The scalar terms in this expression cancel by (6.12). Using $partial_t \( R_l \/ T \) = partial_tau R_l \/ T^2$,
    the remaining identity is
  $ rho_l = - frac(p - p_oo + 2 \( v_l - theta_l \), T) R_l - frac(R_l^2 + partial_tau R_l, T^2) + cal(E)_(A \, l) . $
  Equations (6.14) and (6.15) therefore imply
  #[#set math.equation(numbering: n => "(6.16)")
   $ sup_(t \, h) #scale(x: 120%, y: 120%)[\(] parallel rho_l parallel +
     parallel D_h rho_l parallel #scale(x: 120%, y: 120%)[\)] lt.eq frac(C eta_j, T) . $ <eq:residual>]
  Let $E_l = P_l - Q_l$. No matrices are commuted in the exact difference equation
  #[#set math.equation(numbering: n => "(6.17)")
   $ E'_l = rho_l - \( p I + P_l \) E_l - E_l Q_l . $ <eq:pulse-error-equation>]
  The lower eigenvalue bounds for $P_l \, Q_l$, and $p$ allow Lemma 11 with a fixed damping rate.
    The profiles vanish near $tau = 0$, so
  $ E_l \( t_j \) = P_l \( t_j \) - theta_l I = O \( j^(- 2) \) $
  by (6.9). From (6.5), (6.5), and (6.16), we obtain
  #[#set math.equation(numbering: n => "(6.18)")
   $ sup_(t \, h) parallel E_l \( t \, h \) parallel lt.eq C eta_j \, wide
     sup_h integral_(t_j)^(t_j + T) parallel E_l \( t \, h \) parallel thin d t lt.eq C eta_j . $ <eq:error-integrated>]
  The initial discrepancy contributes its size to this integral, because it is damped;
    it does not contribute its size times $T$.
  We next control the derivative in a current parameter. Derivatives are taken with the earlier history fixed.
    Write $E_(l \, h) = D_h E_l$ and $Q_(l \, h) = D_h Q_l$; the calculation applies to every unit direction in
    the finite parameter space. The coefficients of the Riccati equation depend smoothly on $h$ on the pulse,
    so the ordinary differential equation has smooth parameter dependence there;
    the uniform barriers keep its solutions inside one fixed bounded set.
    Differentiating (6.17) and using $D_h P_l = E_(l \, h) + Q_(l \, h)$ gives the exact regrouping
  #[#set math.equation(numbering: n => "(6.19)")
   $ E'_(l \, h) = D_h rho_l - \( p I + P_l \) E_(l \, h) - E_(l \, h) P_l - Q_(l \, h) E_l -
     E_l Q_(l \, h) . $ <eq:parameter-error-equation>]
  Its initial value is zero: the past is fixed and $R_l \( 0 \, h \) = D_h R_l \( 0 \, h \) = 0$.
    Also $parallel Q_(l \, h) parallel lt.eq C \/ T$. Apply Lemma 11 to (6.19).
    Its forcing has pointwise norm at most $C eta_j \/ T$, by (6.16) and the first bound in (6.18).
    Its integrated norm is at most
  $ C eta_j + C / T integral_(t_j)^(t_j + T) parallel E_l parallel thin d t lt.eq C eta_j . $
  Consequently
  #[#set math.equation(numbering: n => "(6.20)")
   $ sup_(t \, h) parallel E_(l \, h) parallel lt.eq frac(C eta_j, T) \, wide
     sup_h integral_(t_j)^(t_j + T) parallel E_(l \, h) parallel thin d t lt.eq
     C eta_j . $ <eq:parameter-error-integrated>]
  This argument supplies the derivative estimate directly, without an a priori estimate for $D_h P_l$.
  To pass from coefficient errors to value transmissions, let $cal(B)_l \( t \, h \)$ be the pulse fundamental
    matrix up to time $t$, with value $I$ at $t_j$, and set
  $ F_l \( t \, h \) = e^(- integral_(t_j)^t v_l \( w \) thin d w) cal(B)_l \( t \, h \) \, wide
    G_l \( t \, h \) = H_l \( \( t - t_j \) \/ T \, h \) . $
  Then
  $ F'_l = \( R_l \/ T + E_l \) F_l \, wide G'_l = \( R_l \/ T \) G_l \, wide F_l \( t_j \) = G_l \( t_j \) = I . $
  The integrated norms of $R_l \/ T$ and $D_h R_l \/ T$ are uniformly bounded;
    those of $E_l$ and $E_(l \, h)$ are $O \( eta_j \)$. The elementary integral inequality $u \( t \) lt.eq a +
    integral_(t_j)^t b \( w \) u \( w \) thin d w$, $b gt.eq 0$, implies $u \( t \) lt.eq
    a exp \( integral_(t_j)^t b \)$: the right-hand side of the first inequality has derivative at most $b$ times
    itself. Applying this inequality to the fundamental-matrix equations and their parameter derivatives bounds
    $F_l \, G_l \, D_h F_l \, D_h G_l$ uniformly.
  For completeness, $Z_l = F_l - G_l$ satisfies
  $ Z'_l = \( R_l \/ T + E_l \) Z_l + E_l G_l \, wide Z_l \( t_j \) = 0 . $
  The integral bound for $E_l$ gives $sup_t parallel Z_l parallel lt.eq C eta_j$.
    Differentiating this equation introduces the additional terms
  $ \( D_h R_l \/ T + E_(l \, h) \) Z_l + E_(l \, h) G_l + E_l D_h G_l . $
  Their integrated norms are $O \( eta_j \)$, using the preceding uniform bounds and (6.20).
    The same integral inequality gives $sup_t parallel D_h Z_l parallel lt.eq C eta_j$.
    Evaluation at the pulse end proves the first assertion of (6.13).
    At that end $R_l \( 1 \, h \) = D_h R_l \( 1 \, h \) = 0$.
    Combining $P_l = Q_l + E_l$, (6.14), (6.18), and (6.20) proves the second assertion.
    Every estimate used the earlier history only through the uniform reset and barriers of Lemma 12,
    proving the stated uniformity. ◻
]

=== 6.4 Removing the full diagonal leg <subsec:leg>

The pulse estimate describes values and radial derivatives at the pulse end.
  The radial derivative need not yet equal $theta_l$ times the value,
  so diagonal angular coefficients on the next leg do not by themselves give a diagonal map on these data.
  We now factor the full leg exactly. This separates its possibly large unequal growth from the small error in the
  entrance derivative.

Let $cal(T)_(l \, j) \( h \)$ denote the value transmission of center-regular solutions from $t_j$ to $t_(j + 1)$.
  On the diagonal leg let $U_(l \, j)$ and $V_(l \, j)$ be the value propagation matrices from its start to its
  end for initial Cauchy data $\( Y \, Y' \) = \( I \, 0 \)$ and $\( 0 \, I \)$, respectively.
  These matrices are diagonal in the fixed dwell basis. Define

#[#set math.equation(numbering: n => "(6.21)")
 $ D_(l \, j) = U_(l \, j) + theta_l V_(l \, j) \, wide K_(l \, j) =
   D_(l \, j)^(- 1) V_(l \, j) . $ <eq:diagonal-reference>]

Thus $D_(l \, j)$ is the value propagation on the entire leg for the reference data $\( I \, theta_l I \)$.

#thm([Lemma 6.4.])[
  (Exact normalization of the full leg and dwell growth).  #emph[The matrices $U_(l \, j)$, $V_(l \, j)$,
    and $D_(l \, j)$ have positive diagonal entries, and
#[#set math.equation(numbering: n => "(6.22)")
 $ 0 lt.eq K_(l \, j) lt.eq theta_l^(- 1) I . $ <eq:K-bound>]

 They depend only on the prescribed diagonal leg, not on its current or earlier pulse parameters.
   The exact transmission identity is
#[#set math.equation(numbering: n => "(6.23)")
 $ D_(l \, j)^(- 1) cal(T)_(l \, j) \( h \) =
   [I + K_(l \, j) #scale(x: 120%, y: 120%)[\(] P_(l \, e) \( h \) - theta_l I #scale(x: 120%, y: 120%)[\)]]
   cal(B)_(l \, j) \( h \) . $ <eq:full-normalization>]

 Moreover, uniformly for the finite set of $l \, i$,
#[#set math.equation(numbering: n => "(6.24)")
 $ log \( D_(l \, j) \)_(i i) = L_j d_(l \, i) + O \( 1 + L_j j^(- 2) + T_j \) =
   L_j #scale(x: 120%, y: 120%)[\(] d_(l \, i) + o \( 1 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:diagonal-growth>]

]
] <lem:leg>

#proof[
  Every operator on the leg is a function of $I$ and $D_(J_0)^2$,
    and hence is diagonal in the fixed dwell eigenbasis. A scalar coordinate satisfies
  $ y'' + p \( t \) y' - A_i \( t \) y = 0 \, wide A_i \( t \) > 0 . $
  Multiplying the equation for $y'$ by the positive integrating factor $e^(integral p)$ gives
  $ #scale(x: 120%, y: 120%)[\(] e^(integral p) y' #scale(x: 120%, y: 120%)[\)]' = e^(integral p) A_i y . $
  Starting with $\( y \, y' \) = \( 1 \, 0 \)$, positivity of $y$ makes $y'$ nonnegative until any supposed first
    zero of $y$; this prevents that zero. Starting with $\( 0 \, 1 \)$,
    the solution is positive for small positive time and the same argument keeps it positive.
    Thus the final entries of $U_(l \, j)$ and $V_(l \, j)$ are positive.
    Formula (6.21) gives positivity of $D_(l \, j)$, and entry by entry
  $ 0 < frac(\( V_(l \, j) \)_(i i), \( U_(l \, j) \)_(i i) + theta_l \( V_(l \, j) \)_(i i)) lt.eq theta_l^(- 1) . $
  This proves (6.22).
  For an incoming value vector $y$ at the start of the period, the data at the pulse end are
  $ #scale(x: 120%, y: 120%)[\(] cal(B)_(l \, j) y \, thin P_(l \, e) cal(B)_(l \, j) y #scale(x: 120%, y: 120%)[\)] . $
  Their value at the end of the leg is
  $ cal(T)_(l \, j) y = #scale(x: 120%, y: 120%)[\(] U_(l \, j) +
    V_(l \, j) P_(l \, e) #scale(x: 120%, y: 120%)[\)] cal(B)_(l \, j) y . $
  Since $D_(l \, j) = U_(l \, j) + theta_l V_(l \, j)$, left multiplication by $D_(l \, j)^(- 1)$ gives (6.23).
    The order $K_(l \, j) \( P_(l \, e) - theta_l I \)$ is part of this identity;
    no commutation with $P_(l \, e)$ is used. The large matrix $D_(l \, j)$ has disappeared from the error
    multiplier, leaving only the uniform bound (6.22).
  To estimate $D_(l \, j)$, take its $i$-th scalar solution with initial data $\( 1 \, theta_l \)$.
    The positivity just proved allows its logarithmic derivative $w = y' \/ y$ throughout the leg. It satisfies
  $ w' = A_(l \, i) \( t \) - p \( t \) w - w^2 . $
  The scalar barrier argument in Lemma 12, with initial value $theta_l$,
    keeps $w$ between fixed positive constants. During the dwell,
  $ A_(l \, i) \( t \) = lambda_(l \, i) + O \( j^(- 2) \) \, wide lambda_(l \, i) =
    d_(l \, i) \( d_(l \, i) + p_oo \) \, $
  by (6.11) and the fixed value $q = q_(*)$. For $e = w - d_(l \, i)$, subtraction gives
  $ e' = F_(l \, i) \( t \) - \( p + w + d_(l \, i) \) e \, wide F_(l \, i) = A_(l \, i) -
    lambda_(l \, i) - \( p - p_oo \) d_(l \, i) = O \( j^(- 2) \) . $
  The value of $e$ at the dwell entrance is bounded, and its damping coefficient has a fixed positive lower bound.
    The scalar version of (6.5) yields
  $ integral_(upright("dwell ") j) \| w - d_(l \, i) \| thin d t lt.eq C + C L_j j^(- 2) . $
  The two ramps and the final rest have total duration $3 T_j$,
    and their contribution to $integral w$ is $O \( T_j \)$. Since the solution starts at $1$ and ends at
    $\( D_(l \, j) \)_(i i)$, integration of $w = \( log y \)'$ gives the first equality in (6.24).
    The second follows from $T_j \/ L_j = j^(- 1) arrow.r 0$ and $L_j arrow.r oo$.
    All constants are uniform over the fixed finite list of coordinates. ◻
]

=== 6.5 Tuning every complete period exactly <subsec:tuning>

The preceding identity puts the actual full-period map in the same local coordinate problem as the ideal word.
  Its remaining error tends to zero with one parameter derivative, uniformly over the past.
  This allows the target cycle to be attained successively in every period.

#thm([Proposition 6.5.])[
  (Exact full-period transmission).  #emph[For finite spectral data as specified at the end of Section 3,
    choose the word and compact pulse family above. There are a starting index $j_0$ and parameters $h_j in K$,
    for every $j gt.eq j_0$, such that the center-regular value transmissions of the resulting metric satisfy
#[#set math.equation(numbering: n => "(6.25)")
 $ cal(T)_(l \, j) = s_(l \, j) D_(l \, j) Pi_l \, wide s_(l \, j) > 0 \, wide \| log s_(l \, j) \| lt.eq
   C T_j quad \( 2 lt.eq l lt.eq L \, med j gt.eq j_0 \) . $ <eq:exact-transmission>]

 The positive diagonal matrices $D_(l \, j)$ propagate the reference Cauchy data $\( I \, theta_l I \)$ over the
   entire leg following the pulse; they satisfy (6.24). The regular value equation has the bounds (6.8).
   All estimates used to choose $j_0$ are uniform over preceding admitted controls for this fixed finite family.]
] <prop:transmission>

#proof[
  First fix an admitted past and vary the current parameter $h$. By (6.23),
  $ e^(- phi_(l \, j)) D_(l \, j)^(- 1) cal(T)_(l \, j) \( h \) =
    [I + K_(l \, j) #scale(x: 120%, y: 120%)[\(] P_(l \, e) \( h \) - theta_l I #scale(x: 120%, y: 120%)[\)]] e^(-
    phi_(l \, j)) cal(B)_(l \, j) \( h \) . $
  The bound (6.22) and Lemma 13 imply
  #[#set math.equation(numbering: n => "(6.26)")
   $ e^(- phi_(l \, j)) D_(l \, j)^(- 1) cal(T)_(l \, j) \( h \) = H_l \( 1 \, h \) +
     O_(C^1) \( eta_j \) . $ <eq:full-period-limit>]
  The estimate is uniform in the preceding history. Each $cal(T)_(l \, j)$ is a value fundamental matrix of $Y' =
    P_l Y$, so it has positive determinant; so does $D_(l \, j)$.
    Determinant normalization is therefore defined for their quotient.
    The matrices $H_l \( 1 \, h \)$, $h in K$, form a compact subset of the positive-determinant matrices.
    On a neighborhood of this compact set, $cal(N)_l$ is smooth with bounded derivatives.
    Normalization is unchanged by the positive scalar $e^(- phi_(l \, j))$, so (6.26) gives
  #[#set math.equation(numbering: n => "(6.27)")
   $ Psi_j \( h \) := #scale(x: 120%, y: 120%)[\(] cal(N)_l \( D_(l \, j)^(- 1) cal(T)_(l \, j) \( h \) \)
     #scale(x: 120%, y: 120%)[\)]_(l = 2)^L = Phi \( h \) + O_(C^1) \( eta_j \) quad
     upright("in ") cal(G) . $ <eq:group-limit>]
  The assertion is first an estimate for the ambient matrix entries and their derivatives,
    and hence also in any fixed smooth chart containing the compact image under consideration.
  We spell out the uniform inversion. Use Euclidean norms on the parameter and coordinate spaces,
    and the associated operator norms for their derivatives. Choose a coordinate chart $zeta$ near $Pi$ in
    $cal(G)$ with $zeta \( Pi \) = 0$, and let $f = zeta compose Phi$ and $A_0 = D f \( 0 \)$.
    By (6.4), $A_0$ is invertible. Choose a closed ball $overline(B)_r$ centered at $0$,
    contained in the interior of $K$, whose $Phi$-image lies compactly inside the chart and for which
  $ sup_(h in overline(B)_r) parallel I - A_0^(- 1) D f \( h \) parallel lt.eq 1 / 4 . $
  For every sufficiently large $j$, uniformly in the admitted past, $f_j = zeta compose
    Psi_j$ is defined on this ball and
  $ sup_(h in overline(B)_r) parallel A_0^(- 1) \( D f_j \( h \) - D f \( h \) \) parallel lt.eq 1 / 4 \, wide
    parallel A_0^(- 1) f_j \( 0 \) parallel lt.eq r / 2 . $
  This follows from (6.27) and $eta_j arrow.r 0$. The map
  $ cal(C)_j \( h \) = h - A_0^(- 1) f_j \( h \) $
  has derivative of norm at most $1 \/ 2$ on the ball. Also
  $ parallel cal(C)_j \( h \) parallel lt.eq parallel cal(C)_j \( 0 \) parallel + 1 / 2 parallel h parallel lt.eq
    r wide \( h in overline(B)_r \) . $
  It is therefore a contraction of the closed ball into itself.
    Its iterates converge to a fixed point $h_j$, for which $f_j \( h_j \) = 0$, or $Psi_j \( h_j \) = Pi$.
  All the preceding estimates were uniform over the past. Choose $j_0$ once,
    large enough for them and for the geometric input, after the fixed word and parameter ball have been chosen.
    The history before $j_0$ is round. Choose $h_(j_0)$ by the contraction above,
    and repeat after each finite chosen history. This inductively defines an infinite admitted sequence and hence
    a single smooth metric of Proposition 10. Undoing determinant normalization at each fixed point gives
  $ D_(l \, j)^(- 1) cal(T)_(l \, j) = s_(l \, j) Pi_l \, wide s_(l \, j) =
    det \( D_(l \, j)^(- 1) cal(T)_(l \, j) \)^(1 \/ N_l) > 0 . $
  By (6.26), the determinant of $e^(- phi_(l \, j)) D_(l \, j)^(- 1)
    cal(T)_(l \, j)$ stays bounded above and away from zero on the fixed compact family. Thus
  $ log s_(l \, j) = phi_(l \, j) + O \( 1 \) = O \( T_j \) \, $
  because $v_l$ is uniformly bounded. This proves (6.25). The equality is for the complete period;
    no residual change of direction is passed to a later period. ◻
]

== 7 Global growth and cone geometry <sec:conclusion>

All parameters, the finite degree range, and the exact sequence of controls are now fixed.
  We first prove that the selected center-regular solutions satisfy the pointwise bound in Theorem 1.
  We then examine the cone limits, which explain why additional hypotheses in the comparison literature do not apply.

=== 7.1 Every-point growth and the strict count <every-point-growth-and-the-strict-count>

#proof[
  We convert the exact cycles from Proposition 15 into polynomial growth.
    For each $l$ with $M_l > 0$ and each $1 lt.eq i lt.eq M_l$,
    choose the center-regular solution with value vector $Y \( t_(j_0) \) = e_(l \, i)$.
    Lemma 12 permits this choice. Near the origin it is $r^l$ times an element of $V_l$,
    hence a homogeneous harmonic polynomial in Euclidean coordinates.
    It is smooth and harmonic there and, by (6.6), on the rest of the manifold.
  Let $sigma_l$ be the cyclic permutation of ${ 1 \, dots.h \, M_l }$ underlying $Pi_l$, and define $i_(j_0) = i$,
    $i_(j + 1) = sigma_l \( i_j \)$. Applying (6.25) sends $e_(l \, i_j)$ to a signed multiple of
    $e_(l \, i_(j + 1))$, with absolute multiplier $s_(l \, j) \( D_(l \, j) \)_(i_(j + 1) \, i_(j + 1))$. Hence, with
  $ epsilon_(l \, i \, j) = L_j^(- 1) log \( D_(l \, j) \)_(i i) - d_(l \, i) \, wide
    max_(l \, i) \| epsilon_(l \, i \, j) \| arrow.r 0 $
  by (6.24), one has
  #[#set math.equation(numbering: n => "(7.1)")
   $ log parallel Y \( t_J \) parallel = sum_(j = j_0)^(J - 1)
     (log s_(l \, j) + j^7 #scale(x: 120%, y: 120%)[\(] d_(l \, i_(j + 1)) + epsilon_(l \, i_(j + 1) \, j)
     #scale(x: 120%, y: 120%)[\)]) . $ <eq:cycle-sum>]
  Signs in $Pi_l$ do not affect this norm.
  We verify the weighted average in (7.1). Group the sum of $j^7
    d_(l \, i_(j + 1))$ into complete cycles of length $M_l$.
    Within a cycle starting at $j$, $\( j + r \)^7 - j^7 = O \( j^6 \)$ for $0 lt.eq r < M_l$,
    with a constant depending on this fixed length. Since the sum of $d_(l \, i_(j + r + 1)) -
    overline(d)_l$ in a complete cycle is zero, that cycle contributes only $O \( j^6 \)$ to the difference from
    the mean-weighted sum. Summing these errors and bounding the at most $M_l - 1$ final terms by $O \( J^7 \)$ gives
  $ sum_(j = j_0)^(J - 1) j^7 d_(l \, i_(j + 1)) = overline(d)_l sum_(j = j_0)^(J - 1) j^7 + O \( J^7 \) . $
  Also $sum_(j < J) \| log s_(l \, j) \| = O \( sum_(j < J) j^6 \) = O \( J^7 \)$.
    The $epsilon$-terms sum to $o \( J^8 \)$: for any positive number,
    choose a fixed late index after which their absolute values are below that number, and use $sum_(j < J) j^7 =
    O \( J^8 \)$. The finitely many earlier terms vanish after division by $J^8$. Finally,
  $ sum_(j = j_0)^(J - 1) j^7 = J^8 / 8 + O \( J^7 \) \, wide t_J = J^8 / 8 + O \( J^7 \) $
  by (5.1). Therefore
  #[#set math.equation(numbering: n => "(7.2)")
   $ lim_(J arrow.r oo) frac(log parallel Y \( t_J \) parallel, t_J) = overline(d)_l < k . $ <eq:endpoint-rate>]
  The estimate extends to every radius. From $Y' = P_l Y$ and (6.8),
  $ parallel Y \( t \) parallel lt.eq exp #scale(x: 120%, y: 120%)[\(] C_P \( t - t_j \)
    #scale(x: 120%, y: 120%)[\)] parallel Y \( t_j \) parallel wide \( t_j lt.eq t lt.eq t_(j + 1) \) . $
  The ratio $\( t_(j + 1) - t_j \) \/ t_j$ tends to zero by (6.10). Thus (7.2) gives
  $ limsup_(t arrow.r oo) frac(log parallel Y \( t \) parallel, t) lt.eq overline(d)_l . $
  Choose $alpha_l$ with $overline(d)_l < alpha_l < k$. For all sufficiently large $r = e^t$,
    $parallel Y \( log r \) parallel lt.eq r^(alpha_l)$. The fixed finite-dimensional space $V_l$ has
  $ lr(|sum_i Y_i e_(l \, i) \( omega \)|) lt.eq C_l parallel Y parallel quad upright("for every ") omega in S^m \, $
  for example by Cauchy–Schwarz and boundedness of the finitely many smooth basis functions.
    Since $d_g \( 0 \, x \) = r \( x \)$, this gives $\| u \( x \) \| lt.eq
    C_u \( 1 + d_g \( 0 \, x \) \)^k$ outside a compact set. Smoothness bounds $u$ on that compact set and
    supplies the same inequality everywhere.
  These functions are linearly independent: their restrictions to the sphere $t =
    t_(j_0)$ are the selected vectors of mutually orthogonal round spaces $V_l$. It follows that
  $ dim_(bb(R)) cal(H)_k \( bb(R)^(m + 1) \, g \) gt.eq sum_(l = 2)^L M_l > sum_(l = 0)^k N_l . $
  The Euclidean identification was proved at the end of Section 3, so this is the required strict comparison.
  Finally, the distance and volume statements in Proposition 10 give
  $ "vol"_g B_g \( 0 \, R \) = "vol"_(g_0) \( S^m \) integral_0^R r^m a \( log r \)^m thin d r . $
  Because $a \( t \) arrow.r a_(*)$, changing variables $r =
    R z$ and using dominated convergence shows that this quantity divided by $omega_(m + 1)
    R^(m + 1)$ tends to $a_(*)^m$; here $"vol"_(g_0) \( S^m \) = \( m + 1 \) omega_(m + 1)$. This completes the proof. ◻
]

=== 7.2 Cone limits, conformal curvature, and cone degrees <cone-limits-conformal-curvature-and-cone-degrees>

#thm([Proposition 7.1.])[
  (Cone geometry and the union of degrees).  #emph[Let $g$ be the metric constructed in the proof of Theorem 1,
    with link parameters $a_(*) \, q_(*)$ and comparison integer $k$.
    Every cone with link $G \( a_(*) \, q \, J_0 \)$, $1 lt.eq q lt.eq q_(*)$,
    occurs as a pointed tangent cone at infinity. In particular the tangent cone is not unique.
    The metric $g$ is not locally conformally flat. If $cal(D) \( M \)$ denotes the union of nonnegative
    homogeneous harmonic degrees over all its tangent cones, then $cal(D) \( M \)$ contains a half-line and a
    neighborhood of $k$.]
] <prop:cone-consequences>

#proof[
  Centering a fixed logarithmic window in the round rests or nonround dwells and letting its center tend to
    infinity gives smooth annular limits with links $G \( a_(*) \, 1 \, J_0 \)$ and
    $G \( a_(*) \, q_(*) \, J_0 \)$, respectively. They are nonisometric:
    the first is Einstein, whereas the second has distinct horizontal and vertical Ricci eigenvalues.
    Every intermediate ramp link also occurs as a limit, because the ramp durations diverge and their derivatives
    tend to zero. These annular limits extend to pointed cone limits including the vertex:
    the inner radial ball of radius $delta$ has diameter at most $2 delta$ in every rescaling and in the limit.
    Comparing paths on the complementary annuli, then letting $delta arrow.b 0$,
    gives convergence of distances on each bounded ball. All these links have the same volume.
  The additional local conformal flatness hypothesis in [2] also fails.
    Put $h_(*) = G \( a_(*) \, q_(*) \, J_0 \)$. The nonround cone metric $d r^2 + r^2 h_(*)$ is conformal,
    under $t = log r$, to the product $d t^2 + h_(*)$. For this product the Weyl tensor has mixed component
  $ W_(0 a 0 b) = - frac(1, m - 1) ("Ric"_(h_(*)) - "Scal"_(h_(*)) / m h_(*))_(a b) . $
  Indeed the product has zero mixed curvature and radial Ricci tensor;
    substitution in the trace decomposition of curvature gives this formula.
    The component is nonzero because the link has distinct horizontal and vertical Ricci eigenvalues.
    Vanishing of the Weyl tensor is conformally invariant and is preserved by smooth annular limits.
    If the constructed metric were locally conformally flat, its nonround cone limit would have zero Weyl tensor,
    contradicting the formula.
  For maximal Hopf charge in degree $l$, its growth root $alpha_l \( q \)$ is the nonnegative solution of
  $ alpha_l \( q \) \( alpha_l \( q \) + m - 1 \) = a_(*)^(- 2) q^(1 \/ m) #scale(x: 120%, y: 120%)[\[]
    l \( l + m - 1 \) + \( q^(- 1) - 1 \) l^2 #scale(x: 120%, y: 120%)[\]] . $
  This root varies continuously with $q$. At $q = 1$ its asymptotic slope is $a_(*)^(- 1)$; at $q =
    q_(*)$ it is $a_(*)^(- 1) q_(*)^(- \( m - 1 \) \/ \( 2 m \))$, which is strictly smaller.
    More precisely, the endpoint roots are
  $ alpha_l \( 1 \) = a_(*)^(- 1) l + O \( 1 \) \, wide alpha_l \( q_(*) \) =
    a_(*)^(- 1) q_(*)^(- \( m - 1 \) \/ \( 2 m \)) l + O \( 1 \) . $
  The difference of their slopes is positive, so for every sufficiently large $l$,
    $alpha_(l + 1) \( q_(*) \) < alpha_l \( 1 \)$ and $alpha_l \( q_(*) \) < alpha_l \( 1 \)$.
    The continuous image of the $q$-interval contains the entire interval between these endpoints.
    These intervals overlap and have unbounded upper endpoints, so their union contains a half-line.
    In particular, equal cone-link volumes do not provide a discrete union spectrum.
  The chosen integer $k$ itself lies in this union. Indeed, (3.9) forces some selected degree $l > k$.
    Its smallest dwell root is below $k$, while its round root $theta_l$ is greater than $l$ because $a_(*) < 1$.
    Continuity supplies an intermediate cone root equal to $k$;
    the strict endpoint inequalities in fact put a neighborhood of $k$ in $cal(D) \( M \)$.
    Xu’s nonunique-cone three-circles theorem [16] Theorem 3.4 requires the comparison exponent to lie outside
    $cal(D) \( M \)$, so it cannot be applied at $k$ or at any sufficiently nearby exponent.
    The unique-cone spectral bounds in [8] also have a hypothesis that fails.
    A global logarithmic growth average, as in (7.2), need not equal the local homogeneous degree seen after
    normalization on each separate cone subsequence. ◻
]

== 8 An exact finite spectral selection <sec:finite-selection>

The analytic argument in Lemma 5 supplies all spectral data needed in the proof of Theorem 1.
  A supplementary integer calculation gives a concrete selection in ambient dimension $16$,
  at the integer cutoff $50000$. This calculation checks the finite spectral inequalities in (3.9);
  it does not construct the finite control word or the metric numerically.
  The analytic existence argument remains independent of it.

The parameters of the calculation are

$ m = 15 \, wide s = 8 \, wide k = 50000 \, wide q_(*) = 101 / 100 \,\
c = 147 / 1000 \, wide alpha_(*)^2 = 99853 / 100000 \, wide a_(*)^2 = q_(*)^(1 \/ 15) alpha_(*)^2 . $

The endpoint curvature inequality is strict because

$ 1 - frac(2 \( q_(*) - 1 \), m - 1) - alpha_(*)^2 = 29 / 700000 > 0 . $

The integer inequality $101 dot.op 99853^15 < 100 dot.op 100000^15$ shows that $q_(*) \( alpha_(*)^2 \)^15 < 1$,
  and hence $a_(*) < 1$. The decrease of the curvature threshold in the proof of Lemma 5 gives the margin for
  every $q in \[ 1 \, q_(*) \]$. The radial scale also meets its required smallness condition:

$ - log a_(*) lt.eq - 1 / 2 log alpha_(*)^2 < frac(1 - alpha_(*)^2, 2 alpha_(*)^2) < 1 / 1000 . $

The cutoff integral in Proposition 10 is at least $integral_4^oo \( 1 + t \)^(- 5 \/ 4) thin d t =
  4 dot.op 5^(- 1 \/ 4) > 2$. It therefore gives $mu < 1 \/ 2000$, in particular $b gt.eq - 1 \/ 4$.
  These are parameter checks; the control and transmission arguments are still the analytic arguments of Sections 4–7.

Here is the arithmetic bound underlying the selection. Write $h = m - 1$, $Q = 10^8$,
  and an angular eigenvalue as $lambda = upright("num") \/ upright("den") > 0$,
  with integer numerator and denominator. If $"isqrt" \( a \) =
  floor.l sqrt(a) floor.r$ for a nonnegative integer $a$, define

$ S = "isqrt" #h(-0.16667em) (⌊frac(Q^2 \( h^2 upright("den") + 4 upright("num") \), upright("den"))⌋) + 1 . $

Then $S^2 upright("den") > Q^2 \( h^2 upright("den") + 4 upright("num") \)$,
  so the positive root of $d \( d + h \) = lambda$ satisfies the strict rational bound

$ d < frac(S - h Q, 2 Q) . $

For the charge indexed by $b$, the exact eigenvalue data are

$ upright("num") = 100000 #scale(x: 120%, y: 120%)[\(] 101 l \( l + 14 \) - \( 2 b - l \)^2
  #scale(x: 120%, y: 120%)[\)] \, wide upright("den") = 101 dot.op 99853 . $

The multiplicities are the integers in (3.2). The two equal contributions indexed by $b$ and $l - b$ are combined,
  except for the middle term when they coincide. Increasing $b$ from $0$ to $floor.l l \/ 2
  floor.r$ puts the eigenvalues, and therefore the upper bounds for the exponents, in increasing order.

The supplied program #raw("verification/counting-check.py") uses these integer multiplicities and upper bounds.
  It accepts an initial group only when its upper-bounded exponent sum is strictly less than $k$ times its size.
  It may take part of a repeated eigenvalue, which corresponds to choosing that many vectors in its real
  eigenspace. Low degrees are selected in full whenever the exact inequality $l \( l + 14 \) < alpha_(*)^2
  k \( k + 14 \)$ certifies all their roots to be below $k$.
  In odd degree the zero Hopf charge is absent, so the full-degree test is a sufficient criterion rather than an
  exact characterization of the largest root. The individual search ends when the smallest root is at least $k$.
  Thus every counted group has a true mean strictly below $k$.

The resulting counts, using integer arithmetic, are

$ upright("selected dimension") & = 46785605044474340387088811257657817010714687366486217934111 \,\
h_50000 \( bb(R)^16 \) & = 46779709349146362239266126538609505511855492134986686636251 \,\
upright("strict surplus") & = 5895695327978147822684719048311498859195231499531297860 . $

The selected dimension omits degrees $0$ and $1$, as required in (3.9).
  Only the displayed strict integer comparison is used by the certificate; a decimal ratio is unnecessary.

These parameters and selections satisfy all the finite-data hypotheses at the end of Section 3.
  Applying Propositions 10 and 15, followed by the growth argument in Section 7,
  therefore gives the metric of Theorem 1 with $n = 16$ and $k = 50000$.

#heading(level: 1)[References]
#bibitem([1])[J.-P.~Bourguignon and H.~Karcher, #emph[Curvature operators:
  pinching estimates and geometric examples], Ann. Sci. École Norm. Sup. (4) #strong[11] (1978), no.~1, 71--92.
  #link("https://doi.org/10.24033/asens.1340")[doi:10.24033/asens.1340].]
#bibitem([2])[X.~Cai and M.~Lai, #emph[Dimension of polynomial growth harmonic functions on locally conformally
  flat manifolds with nonnegative Ricci curvature], preprint,
  #link("https://arxiv.org/abs/2608.04553v2")[arXiv:2608.04553v2], 2026.]
#bibitem([3])[T.~H.~Colding and W.~P.~Minicozzi~II, #emph[Harmonic functions on manifolds], Ann. of Math.
  (2) #strong[146] (1997), no.~3, 725--747. #link("https://doi.org/10.2307/2952459")[doi:10.2307/2952459].]
#bibitem([4])[T.~H.~Colding and W.~P.~Minicozzi~II, #emph[Weyl type bounds for harmonic functions], Invent. Math.
  #strong[131] (1998), no.~2, 257--298. #link("https://doi.org/10.1007/s002220050204")[doi:10.1007/s002220050204].]
#bibitem([5])[T.~H.~Colding and A.~Naber, #emph[Characterization of tangent cones of noncollapsed limits with
  lower Ricci bounds and applications], Geom. Funct. Anal. #strong[23] (2013), no.~1, 134--148.
  #link("https://doi.org/10.1007/s00039-012-0202-7")[doi:10.1007/s00039-012-0202-7]. Author preprint:
  #link("https://arxiv.org/abs/1108.3244v3")[arXiv:1108.3244v3] (cited lemma numbering follows this version).]
#bibitem([6])[H.~Donnelly, #emph[Harmonic functions on manifolds of nonnegative Ricci curvature], Int. Math. Res.
  Not. #strong[2001] (2001), no.~8, 429--434.
  #link("https://doi.org/10.1155/S1073792801000216")[doi:10.1155/S1073792801000216].]
#bibitem([7])[J.~Figueroa-O'Farrill and M.~Ungureanu, #emph[Homogeneous M2 duals], J. High Energy Phys.
  #strong[2016] (2016), no.~1, article~150.
  #link("https://doi.org/10.1007/JHEP01(2016)150")[doi:10.1007/JHEP01(2016)150].]
#bibitem([8])[X.-T.~Huang, #emph[Harmonic functions with polynomial growth on manifolds with nonnegative Ricci
  curvature], Calc. Var. Partial Differential Equations #strong[62] (2023), article~111.
  #link("https://doi.org/10.1007/s00526-023-02456-z")[doi:10.1007/s00526-023-02456-z]. Author preprint:
  #link("https://arxiv.org/abs/2109.07534v1")[arXiv:2109.07534v1] (cited theorem numbering follows this version).]
#bibitem([9])[V.~Jurdjevic and H.~J.~Sussmann, #emph[Control systems on Lie groups], J.
  Differential Equations #strong[12] (1972), no.~2, 313--329.
  #link("https://doi.org/10.1016/0022-0396(72)90035-6")[doi:10.1016/0022-0396(72)90035-6].]
#bibitem([10])[E.~A.~Lauret, R.~J.~Miatello and J.~P.~Rossetti,
  #emph[Spectra of lens spaces from $1$-norm spectra of congruence lattices], Int. Math. Res. Not.
  #strong[2016] (2016), no.~4, 1054--1089. #link("https://doi.org/10.1093/imrn/rnv159")[doi:10.1093/imrn/rnv159].
  Author preprint: #link("https://arxiv.org/abs/1311.7167v4")[arXiv:1311.7167v4] (cited lemma numbering follows
  this version).]
#bibitem([11])[J.~Lawson and Y.~Lim, #emph[A Birkhoff contraction formula with applications to Riccati equations],
  SIAM J. Control Optim. #strong[46] (2007), no.~3, 930--951.
  #link("https://doi.org/10.1137/050637637")[doi:10.1137/050637637].]
#bibitem([12])[C.-I.~C.~Lee, #emph[On Laplace continued fraction for the normal integral], Ann. Inst. Statist.
  Math. #strong[44] (1992), no.~1, 107--120.
  #link("https://www.ism.ac.jp/editsec/aism/pdf/044_1_0107.pdf")[Published text].]
#bibitem([13])[P.~Li and L.-F.~Tam, #emph[Linear growth harmonic functions on a complete manifold], J.
  Differential Geom. #strong[29] (1989), no.~2, 421--425.
  #link("https://doi.org/10.4310/jdg/1214442883")[doi:10.4310/jdg/1214442883].]
#bibitem([14])[G.~Perelman, #emph[A complete Riemannian manifold of positive Ricci curvature with Euclidean volume
  growth and nonunique asymptotic cone], in #emph[Comparison Geometry], Math. Sci. Res. Inst. Publ.
  #strong[30], Cambridge University Press, 1997, pp.~165--166.
  #link("https://library.slmath.org/books/Book30/files/perex.pdf")[Published text].]
#bibitem([15])[S.~Tanno, #emph[The first eigenvalue of the Laplacian on spheres], Tohoku Math. J.
  (2) #strong[31] (1979), no.~2, 179--185. #link("https://doi.org/10.2748/tmj/1178229837")[doi:10.2748/tmj/1178229837].]
#bibitem([16])[G.~Xu, #emph[Three circles theorems for harmonic functions], Math. Ann.
  #strong[366] (2016), nos.~3--4, 1281--1317.
  #link("https://doi.org/10.1007/s00208-016-1366-5")[doi:10.1007/s00208-016-1366-5]. Author preprint:
  #link("https://arxiv.org/abs/1601.02066v1")[arXiv:1601.02066v1] (cited theorem numbering follows this version).]
#bibitem([17])[S.-T.~Yau, #emph[Open problems in geometry], in R.~Schoen and S.-T.~Yau,
  #emph[Lectures on Differential Geometry], International Press, 1994, pp.~365--404, Problem~48.]
