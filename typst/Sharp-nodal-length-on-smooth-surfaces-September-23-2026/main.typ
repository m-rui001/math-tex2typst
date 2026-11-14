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

#align(center)[#text(size: 16pt, weight: "bold")[Sharp nodal length on smooth surfaces]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction and main result <sec:introduction>

For a Riemannian metric $g$, let $Delta_g = "div"_g nabla_g$, and write $Z_u = { x : u \( x \) =
  0 }$ for the nodal set of a real function $u$. We prove the following bound for one arbitrary fixed smooth surface.

#thm([Theorem 1.1.])[
  #emph[Let $\( M \, g \)$ be a closed connected $C^oo$ Riemannian surface.
    There is a finite constant $C = C \( M \, g \)$ such that every nonzero real Laplace eigenfunction satisfying
$ - Delta_g u = lambda u \, wide lambda > 0 \, $

 obeys
$ cal(H)_g^1 \( Z_u \) lt.eq C sqrt(lambda) . $

 Here $cal(H)_g^1$ is Hausdorff measure for the Riemannian distance.
   The same constant applies to every eigenfunction in every positive eigenspace.]
] <thm:main>

Yau’s conjecture asks for upper and lower bounds of order $sqrt(lambda)$ for the $\( n - 1 \)$-dimensional measure
  of the nodal set on a smooth closed $n$-dimensional manifold [13].
  Donnelly and Fefferman proved both bounds for real analytic manifolds and metrics [3] Theorem 1.2.
  For smooth surfaces, Brüning established the lower bound [1] Satz 2;
  Logunov subsequently proved the lower bound in every dimension [7] Theorem 1.1.
  For the surface upper bound with a smooth metric, Donnelly and Fefferman proved $C lambda^(3 \/ 4)$ [4],
  and Dong gave a different proof at the same order [5]. Logunov and Malinnikova then obtained $C
  lambda^(3 \/ 4 - beta)$ for a universal $beta in \( 0 \, 1 \/ 4 \)$ [8] Equation (1.1).
  Together with the known lower bound, Theorem 1 resolves Yau’s conjecture positively for smooth closed surfaces.

=== Mean growth as the target <mean-growth-as-the-target>

Set $k = sqrt(lambda)$, the frequency. In local smooth isothermal coordinates the metric is $g =
  p \( x \) \( d x_1^2 + d x_2^2 \)$, with $p > 0$ smooth, as in [2] Section 1, and the eigenfunction equation becomes

$ Delta u + k^2 p \( x \) u = 0 . $

Nazarov, Polterovich, and Sodin advocated a statistical approach to local doubling and sketched its relation to
  nodal length, building on Nadirashvili’s approach [9] Section 7.3.
  Roy-Fortin established precise comparisons between growth and nodal length [11,12].
  We prove the uniform mean growth bound needed for the sharp upper estimate and use his planar theorem for the
  final transfer.

Here is why an average suffices. For a coordinate square $Q$ of side $s$ and center $x_Q$,
  consider the unweighted logarithmic growth

$ E \( Q \, 0 \) =
  log
  frac(parallel u parallel_(L^2 \( bb(D)_(R s) \( x_Q \) \)), parallel u parallel_(L^2 \( bb(D)_s \( x_Q \) \))) \, $

where $R$ is the fixed large disk ratio chosen below and $bb(D)_r \( x \)$ is the Euclidean disk of radius $r$.
  The norms are unnormalized. Subdivide a fixed coordinate square into congruent squares of side $s$ comparable to
  $k^(- 1)$, stopping once $k s$ is sufficiently small; call these the terminal squares. The estimate proved below gives

$ "avg"_(Q upright(" terminal")) E \( Q \, 0 \) lt.eq C . $

On each such square, Roy-Fortin’s theorem, after rescaling and a change from supremum norms to $L^2$ norms, gives

$ cal(H)^1 \( Q ∩ Z_u \) lt.eq C s #scale(x: 120%, y: 120%)[\(] 1 + E \( Q \, 0 \) #scale(x: 120%, y: 120%)[\)] . $

There are $O \( s^(- 2) \)$ squares in a fixed coordinate region.
  Summing the local estimates therefore gives $O \( s^(- 1) \) = O \( k \)$ nodal length.
  The precise grids, radii and constants are specified in Sections 3 and 6.
  The task is thus to control the average growth while allowing large values on individual squares.

=== Affine correction and persistent growth <affine-correction-and-persistent-growth>

The analytic step extracts logarithmic profiles from norms measured on an exponential scale.
  With the required separation from the rescaled frequency $k s$,
  a localized Carleman estimate makes these profiles subharmonic, even after arbitrarily large affine tilts.
  Its decisive feature is two-dimensional: when the normalized derivative energy is perpendicular to the weight
  gradient, the commutator sees the full trace of the weight Hessian.

A local affine part of a profile presents an obstruction to decay:
  its oscillation and $k s$ decrease by the same factor under subdivision.
  We subtract that affine part and carry its slope separately.
  The remaining profile growth decreases faster than the side length on average,
  while the changes of slope have bounded average cost. Section 3 quantifies both estimates;
  Section 4 sums their costs along paths that may stop.

To use this improvement through many scales, we divide a grid path into excursions of high growth.
  A newly entered excursion produces a nearby set of positive area on which high growth persists to the terminal
  scale. These witness sets may lie outside their entry squares.
  A packing argument controls them by counting discrepancies between spatial membership and grid ancestry;
  those discrepancies are confined to summable boundary collars.
  This geometric argument is stated separately in Lemma 18.
  It permits the analytic persistence statement to be used without requiring its witnesses to lie inside the
  original squares.

Section 2 constructs the subharmonic limits and establishes the initial growth bound.
  Section 3 proves the affine subdivision estimate, and Section 4 controls stopped descents and persistent slopes.
  Section 5 proves persistence at entry, packs the excursions, and bounds the terminal mean growth.
  Section 6 completes the nodal-length estimate. All coordinate constructions are local,
  so no orientability assumption is needed.

== 2 Subharmonic limits of tilted norms <sec:profiles>

We record exponential growth through logarithms of squared local $L^2$ norms.
  Pointwise logarithms are singular at zeros; the compactness statement below instead controls masses on all
  compact and open sets, which is what later comparisons of norms require.
  Its compatibility with affine weights will allow us to change the tilt as we subdivide.
  Throughout the planar arguments, norms and integrals are Euclidean and are not normalized by area.
  We write $bb(D)_r \( a \)$ for the open Euclidean disk of radius $r$ centered at $a$, and $bb(D)_r =
  bb(D)_r \( 0 \)$; a bar denotes closure. For a measurable planar set $E$,
  the notation $\| E \|$ denotes its Euclidean area.

#thm([Lemma 2.1.])[
  (Extraction of a logarithmic profile).  #emph[Let $X$ be an open subset of $bb(R)^2$ or a compact smooth
    surface. Suppose that $S_j arrow.r oo$ and that $mu_j$ are nonnegative Borel measures on $X$ with
    $mu_j \( X \) lt.eq 1$. There are a subsequence and an upper semicontinuous function $V :
    X arrow.r \[ - oo \, 0 \]$ such that, for every compact $F subset X$ and every open $G subset X$,
#[#set math.equation(numbering: n => "(2.1)")
 $ limsup_(j arrow.r oo) frac(log mu_j \( F \), 2 S_j) lt.eq sup_F V \, wide
   liminf_(j arrow.r oo) frac(log mu_j \( G \), 2 S_j) gt.eq sup_G V . $ <eq:profile-bounds>]

 Here $log 0 = sup diameter = - oo$. More generally, if continuous real functions $f_j$ converge locally uniformly
   to $f$, then
$ limsup_(j arrow.r oo) frac(1, 2 S_j) log integral_F e^(2 S_j f_j) thin d mu_j & lt.eq sup_F \( V + f \) \,\
liminf_(j arrow.r oo) frac(1, 2 S_j) log integral_G e^(2 S_j f_j) thin d mu_j & gt.eq sup_G \( V + f \) . $

 The same subsequence works for all these sets and weights.]
] <lem:profile-extraction>

#proof[
  Choose a countable basis ${ G_i }_(i gt.eq 1)$ consisting of relatively compact open sets.
    A diagonal subsequence makes all the limits
  $ ell_i = lim_(j arrow.r oo) frac(log mu_j \( G_i \), 2 S_j) in \[ - oo \, 0 \] $
  exist. Define $V \( x \) = inf_(i : x in G_i) ell_i$. If $V \( x \) < a$,
    one of these basis neighborhoods has $ell_i < a$, and $V < a$ throughout that neighborhood.
    Thus $V$ is upper semicontinuous.
  For any finite $a > sup_F V$, every point of $F$ has a basis neighborhood with exponent less than $a$.
    A finite subcover and $mu_j \( F \) lt.eq sum_i mu_j \( G_i \)$ give the compact upper bound by $a$.
    Letting $a arrow.b sup_F V$ proves the first inequality, also when this supremum is $- oo$.
    If $x in G$, a basis neighborhood $G_i$ with $x in G_i subset G$ gives a lower bound by $ell_i gt.eq
    V \( x \)$, proving the second inequality.
  For the weighted upper bound, take $a > sup_F \( V + f \)$ and choose the neighborhood at each point small
    enough that its limiting measure exponent plus the supremum of $f$ on it is less than $a$.
    This is possible by continuity of $f$ and the definition of $V$, including at points where $V = - oo$.
    A finite cover and uniform convergence of $f_j$ on its compact closure give the claimed upper bound.
    For the lower bound at a point $x in G$ with $V \( x \) > - oo$,
    choose $G_i$ compactly contained in $G$ so small that $f gt.eq f \( x \) - epsilon$ there.
    The weighted integral over $G_i$ has lower exponent at least $ell_i + f \( x \) - epsilon$.
    Let $epsilon arrow.b 0$ and then take the supremum over $x$. ◻
]

We call $V$ a #emph[logarithmic profile]. Multiplying the measures by positive densities uniformly bounded above
  and below on compact sets does not change the profile bounds:
  the logarithms of these bounds disappear after division by $2 S_j$.
  We may also use the compact upper bound for a relatively compact set by taking its closure.
  Normalizing mass on an open disk alone does not assert that the profile has a finite value inside the disk;
  the identically $- oo$ case remains possible.

#thm([Theorem 2.2.])[
  (Subharmonicity of logarithmic profiles).  #emph[On a fixed planar disk $Omega$,
    let real smooth functions $U_j \, p_j$ satisfy
$ Delta U_j + K_j^2 p_j U_j = 0 \, $

 where $K_j gt.eq 0$. Let $S_j > 0$, $B_j in bb(R)^2$, and $D_j = S_j + \| B_j \|$. Assume
#[#set math.equation(numbering: n => "(2.2)")
 $ S_j arrow.r oo \, wide K_j / D_j arrow.r 0 \,\
sup_j parallel p_j parallel_oo < oo \, wide frac(K_j^2 parallel nabla p_j parallel_oo, S_j D_j) arrow.r
  0 . $ <eq:profile-hypotheses>]

 Local versions of the coefficient assumptions on relatively compact subdisks suffice.
   For positive constants $c_j$, suppose the measures
$ d mu_j = c_j e^(- 2 B_j dot.op x) \| U_j \( x \) \|^2 thin d x $

 have mass at most one on $Omega$. Every upper semicontinuous logarithmic profile with the compact, open,
   and weighted bounds of Lemma 2 is subharmonic on $Omega$, with the identically $- oo$ function allowed.]
] <thm:subharmonic-profile>

The main estimate concerns weights whose normalized gradient is nonzero.
  It is essential that the next lemma allows $D_j \/ S_j$ to be arbitrarily large.

#thm([Lemma 2.3.])[
  (A local Carleman estimate).  #emph[Assume the coefficient and parameter hypotheses of Theorem 3.
    After passing to a subsequence, write
$ S_j \/ D_j arrow.r d \, wide B_j \/ D_j arrow.r b \, wide d gt.eq 0 \, quad d + \| b \| = 1 . $

 Let $chi$ be a real smooth function near $x_0 in Omega$ such that $Delta chi \( x_0 \) < 0$ and $b +
   d nabla chi \( x_0 \) eq.not 0$. Put $T_j \( x \) = - B_j dot.op x - S_j chi \( x \)$.
   There are a neighborhood $Omega_0$ of $x_0$, a constant $c > 0$, and an index $j_0$ such that
#[#set math.equation(numbering: n => "(2.3)")
 $ parallel e^(T_j) \( Delta + K_j^2 p_j \) w parallel_2 gt.eq
   c sqrt(S_j) thin D_j thin parallel e^(T_j) w parallel_2 $ <eq:carleman>]

 for all $j gt.eq j_0$ and all real $w in C_c^oo \( Omega_0 \)$.]
] <lem:carleman>

The two parameters reflect different derivatives of the weight:
  $nabla T_j = - B_j - S_j nabla chi$ has scale $D_j$, whereas $T''_j = - S_j chi''$ has scale $S_j$.
  The affine tilt can therefore enlarge the gradient without enlarging the curvature.

#proof[
  Suppress the index and write $v = e^T w$. The conjugated operator is $P_(+) + P_(-)$, where
  $ P_(+) = Delta + \| nabla T \|^2 + K^2 p \, wide P_(-) = - 2 nabla T dot.op nabla - Delta T . $
  On compactly supported functions, $P_(+)$ is symmetric and $P_(-)$ is skew-symmetric. Integration by parts gives
  #[#set math.equation(numbering: n => "(2.4)")
   $ 2 chevron.l P_(+) v \, P_(-) v chevron.r =  & 4 integral T'' \( nabla v \, nabla v \)\
 & + integral #scale(x: 120%, y: 120%)[\(] 4 T'' \( nabla T \, nabla T \) - Delta^2 T +
   2 K^2 nabla p dot.op nabla T #scale(x: 120%, y: 120%)[\)] v^2 . $ <eq:commutator>]
  For clarity, the contribution from $Delta$ is $4 integral T'' \( nabla v \, nabla v \) -
    integral Delta^2 T thin v^2$. Multiplication by a real function $a$ contributes $2 integral nabla a dot.op
    nabla T thin v^2$; applying this with $a = \| nabla T \|^2 + K^2 p$ gives the remaining terms in Equation (2.4).
  If Equation (2.3) failed on every sufficiently small neighborhood,
    a diagonal choice would give a subsequence and real smooth $v_j$ with supports shrinking to $x_0$, such that
  $ parallel v_j parallel_2 = 1 \, wide parallel \( P_(+) + P_(-) \) v_j parallel_2 = o \( sqrt(S_j) D_j \) . $
  All constants below are uniform on one fixed small neighborhood of $x_0$.
    There, $\| nabla T \| lt.eq C D$, $\| T'' \| + \| Delta^2 T \| lt.eq C S$,
    and the last hypothesis in Equation (2.2) controls the potential term in Equation (2.4).
    Set $X = parallel P_(+) v parallel_2$, $Y = parallel P_(-) v parallel_2$, and $G =
    parallel nabla v parallel_2$. Expanding the squared norm and using the identity gives
  $ X^2 + Y^2 lt.eq C S \( G^2 + D^2 \) . $
  Testing $P_(+)$ against $v$ gives $G^2 lt.eq C D^2 + X$, since $K = o \( D \)$.
    Combining the two inequalities first yields $X lt.eq C \( S + sqrt(S) D \)$ and then
  $ G lt.eq C D \, wide X + Y lt.eq C sqrt(S) D . $
  Here $D gt.eq S arrow.r oo$ absorbs the term $S$.
  Uniformly on the shrinking supports,
  $ nabla T_j \/ D_j arrow.r a = - b - d nabla chi \( x_0 \) eq.not 0 \, wide T''_j \/ S_j arrow.r H = -
    chi'' \( x_0 \) . $
  The preceding bounds give
  $ sqrt(S_j) / D_j lt.eq 1 / sqrt(S_j) arrow.r 0 . $
  Dividing the identity obtained by testing $P_(+)$ against $v_j$ by $D_j^2$ therefore shows
  $ integral \| nabla v_j \/ D_j \|^2 arrow.r \| a \|^2 . $
  Likewise,
  $ ∥frac(nabla T_j, D_j) dot.op frac(nabla v_j, D_j)∥_2 lt.eq
    frac(parallel P_(-) v_j parallel_2 + parallel Delta T_j thin v_j parallel_2, 2 D_j^2) arrow.r 0 . $
  Replacing $nabla T_j \/ D_j$ by its uniform limit consequently gives $parallel a dot.op nabla v_j \/ D_j
    parallel_2 arrow.r 0$.
  Let $e$ be a unit vector perpendicular to $a$. In dimension two,
    the energy perpendicular to $a$ has only this one direction.
    Decomposing $nabla v_j \/ D_j$ in the orthonormal basis ${ a \/ \| a \| \, e }$,
    the parallel component tends to zero in $L^2$, whereas the squared norm of the perpendicular component tends
    to $\| a \|^2$. Hence the first term in Equation (2.4), divided by $S_j D_j^2$,
    tends to $4 \| a \|^2 H \( e \, e \)$. The other main Hessian term tends to $4 H \( a \, a \)$.
    The two remaining terms tend to zero: their absolute values after this division are bounded by
  $ C / D_j^2 quad upright("and") quad frac(C K_j^2 parallel nabla p_j parallel_oo, S_j D_j) \, $
  respectively. We have thus proved
  $ frac(2 chevron.l P_(+) v_j \, P_(-) v_j chevron.r, S_j D_j^2) & arrow.r
    4 #scale(x: 120%, y: 120%)[\(] \| a \|^2 H \( e \, e \) + H \( a \, a \) #scale(x: 120%, y: 120%)[\)]\
 & = 4 \| a \|^2 "tr" H > 0 . $
  The squared norms of $P_(+) v_j$ and $P_(-) v_j$ are nonnegative,
    so this contradicts the assumed smallness of $parallel \( P_(+) + P_(-) \) v_j parallel_2^2$. ◻
]

We also need to remove one possible exceptional gradient from the upper-test criterion.
  The following elementary perturbation does so without any initial integrability assumption.
  An upper test at a finite point $x_0$ is a smooth function agreeing with the tested function at $x_0$ and
  dominating it in a neighborhood of $x_0$. This is an upper-semicontinuous subharmonic variant of the standard
  viscosity exceptional-gradient-removal principle; compare [6] Section 5, Lemma 6.
  We give the local proof for functions allowed to take the value $- oo$, rather than apply that lemma directly.

#thm([Lemma 2.4.])[
  (Removal of the exceptional gradient).  #emph[Let $W : Omega
    arrow.r \[ - oo \, oo \)$ be upper semicontinuous and locally bounded above on a connected planar domain.
    Suppose every smooth function $psi$ touching $W$ from above at a finite point $x_0$,
    with $nabla psi \( x_0 \) eq.not 0$, satisfies $Delta psi \( x_0 \) gt.eq 0$.
    Then $W$ is subharmonic, with the identically $- oo$ function allowed.]
] <lem:exceptional-gradient>

#proof[
  Suppose first that an upper test at $0$ has zero gradient and negative Laplacian;
    translate the point to $0$ if necessary. A quadratic Taylor polynomial with its Hessian increased by a
    sufficiently small positive multiple of the identity gives a quadratic upper test $h$ with
  $ W \( 0 \) = h \( 0 \) \, wide nabla h \( 0 \) = 0 \, wide "tr" h'' < 0 \,\
W \( x \) < h \( x \) quad \( 0 < \| x \| lt.eq r \) $
  for some small $r > 0$. Choose a unit eigenvector $e$ of $h''$ with eigenvalue $alpha < 0$.
    For small $t > 0$, maximize $W \( x \) - h \( x \) + t e dot.op x$ on $overline(bb(D)_r)$.
    Upper semicontinuity and the strict boundary gap ensure that a maximizer $x_t$ is interior.
    Its value is at least the value $0$ at the origin, and $W - h lt.eq 0$, so $e dot.op x_t gt.eq 0$.
    At $x_t$ an upper test is $h \( x \) - t e dot.op x$, shifted by its contact constant. Its gradient has component
  $ e dot.op nabla \( h - t e dot.op x \) \( x_t \) = alpha thin e dot.op x_t - t < 0 \, $
  while its Laplacian is still negative. This contradicts the hypothesis.
    All smooth upper tests at finite points therefore have nonnegative Laplacian.
  We obtain harmonic comparison directly. Let $overline(bb(D)_r \( a \)) subset Omega$,
    let $h$ be harmonic in $bb(D)_r \( a \)$ and continuous on its closure, and suppose $W lt.eq
    h$ on the boundary. If $W - h$ were positive somewhere inside,
    then for sufficiently small $epsilon > 0$ the function
  $ h_epsilon \( x \) = h \( x \) + epsilon \( r^2 - \| x - a \|^2 \) $
  would still lie below $W$ at some interior point. A positive maximum of $W -
    h_epsilon$ is attained at an interior finite point. Adding this maximum to $h_epsilon$ supplies an upper test
    with Laplacian $- 4 epsilon < 0$, again a contradiction. Thus $W$ satisfies harmonic comparison.
    For upper semicontinuous functions this is the usual characterization of subharmonicity,
    including the identically $- oo$ case; see [10] Chapter 2.
    In particular, local integrability and the submean property of a nontrivial subharmonic function are
    consequences here, not assumptions used in the argument. ◻
]

#proof[
  Fix such a profile $V$ and pass to a further subsequence so that $S_j \/ D_j arrow.r d$ and $B_j \/ D_j arrow.r
    b$ as in Lemma 4. The profile bounds remain valid on this subsequence.
    Suppose a smooth $chi$ touches $V$ from above at a finite point $x_0$, and suppose
  $ Delta chi \( x_0 \) < 0 \, wide b + d nabla chi \( x_0 \) eq.not 0 . $
  By adding a small positive multiple of $\| x - x_0 \|^4$,
    we make the touching strict on a sufficiently small closed disk without altering the gradient or Hessian at
    $x_0$. Take this disk inside the neighborhood in Lemma 4.
  Choose fixed radii $0 < r_0 < r_1 < r_2 < r_3$ inside that neighborhood.
    Let $zeta$ be a smooth cutoff equal to one on $bb(D)_(r_1) \( x_0 \)$ and supported in
    $bb(D)_(r_2) \( x_0 \)$. Its derivatives are supported in the annulus between these two disks. Set
  $ G = bb(D)_(r_0 \/ 2) \( x_0 \) \, wide F = { x : r_0 lt.eq \| x - x_0 \| lt.eq r_3 } . $
  We may choose the radii so that the strict touching holds on the whole closed outer disk.
    Then $F$ is a compact annulus, $sup_F \( V - chi \) < 0$, and $sup_G \( V - chi \) = 0$.
  For completeness, the cutoff error can be controlled with a prefactor independent of the ratio $D_j \/ S_j$.
    Choose a smooth $theta$ supported in the interior of $F$ and equal to one near the derivatives of $zeta$.
    Testing the equation for $U_j$ against $theta^2 e^(2 T_j) U_j$ and integrating by parts bounds
  $ integral theta^2 e^(2 T_j) \| nabla U_j \|^2 & lt.eq C integral_F e^(2 T_j) #scale(x: 120%, y: 120%)[\(] \|
    nabla theta \|^2 + theta^2 \| nabla T_j \|^2 + K_j^2 \| p_j \| theta^2 #scale(x: 120%, y: 120%)[\)] \| U_j \|^2\
 & lt.eq C D_j^2 integral_F e^(2 T_j) \| U_j \|^2 . $
  The first inequality absorbs half of the gradient integral by Cauchy–Schwarz; the second uses $K_j =
    o \( D_j \)$ and $D_j arrow.r oo$. Since
  $ \( Delta + K_j^2 p_j \) \( zeta U_j \) = \( Delta zeta \) U_j + 2 nabla zeta dot.op nabla U_j \, $
  Lemma 4 gives
  $ c sqrt(S_j) D_j parallel e^(T_j) U_j parallel_(L^2 \( G \)) lt.eq
    C D_j parallel e^(T_j) U_j parallel_(L^2 \( F \)) . $
  Cancel $D_j$ before comparing exponential rates. Squaring and multiplying by the common normalization constant
    $c_j$ yields
  $ S_j integral_G e^(- 2 S_j chi) thin d mu_j lt.eq C integral_F e^(- 2 S_j chi) thin d mu_j . $
  The weighted bounds of Lemma 2, together with $log S_j \/ S_j arrow.r 0$, now give the contradiction
  $ 0 = sup_G \( V - chi \) lt.eq sup_F \( V - chi \) < 0 . $
  In particular, no bound on $log D_j \/ S_j$ was required.
  We have established the upper-test inequality whenever $b + d nabla chi \( x_0 \) eq.not 0$.
    If $d = 0$, then $\| b \| = 1$ and there is no exceptional gradient;
    harmonic comparison follows as in Lemma 5. If $d > 0$, put $W \( x \) = V \( x \) + \( b \/ d \) dot.op x$.
    An upper test $psi$ for $W$ corresponds to the upper test $chi = psi - \( b \/ d \) dot.op x$ for $V$,
    and $b + d nabla chi = d nabla psi$. Thus $W$ satisfies the hypothesis of Lemma 5.
    It is subharmonic, and subtracting the affine function shows that $V$ is subharmonic too. ◻
]

The next estimate is a fixed-disk form of quantitative unique continuation.
  For the classical doubling estimate of Donnelly and Fefferman and the corresponding propagation bound,
  see [9] Theorem 4.1 and Lemma 4.14. We give a proof using logarithmic profiles,
  which also supplies the local nonvanishing needed below.

#thm([Proposition 2.5.])[
  (Initial growth on a fixed disk).  #emph[Let $\( M \, g \)$ be a fixed smooth closed connected surface,
    and let $G subset M$ be a fixed nonempty open coordinate disk.
    There is a finite constant $C = C \( M \, g \, G \)$ such that every nonzero real eigenfunction $- Delta_g u =
    k^2 u$ with $k > 0$ satisfies $parallel u parallel_(L^2 \( G \)) > 0$ and
#[#set math.equation(numbering: n => "(2.5)")
 $ log frac(parallel u parallel_(L^2 \( M \)), parallel u parallel_(L^2 \( G \))) lt.eq C k . $ <eq:initial-growth>]

 Both norms use Riemannian volume. The constant is uniform over all eigenfunctions in every eigenspace.]
] <prop:initial-growth>

#proof[
  The positive spectral gap gives $k gt.eq k_1 > 0$. Interpret the log ratio in Equation (2.5) as $+
    oo$ when the local norm is zero. If the assertion failed, we could choose eigenfunctions $u_j$,
    normalized by $parallel u_j parallel_(L^2 \( M \)) = 1$, such that their log ratios $R_j$ obey $R_j gt.eq
    j^2 k_j$. This also covers a zero local norm by repeating that eigenfunction. Set $S_j = j k_j$.
    Then $S_j arrow.r oo$ and $S_j \/ k_j arrow.r oo$, whether or not $k_j$ tends to infinity.
  Apply Lemma 2 on $M$ to the probability measures $\| u_j \|^2 thin d "vol"_g$.
    Compactness of $M$ and the compact upper bound with $F = M$ give $0 lt.eq sup_M V lt.eq 0$.
    Upper semicontinuity ensures that this maximum is attained.
  In a relatively compact isothermal chart, $g = p \( x \) \( d x_1^2 + d x_2^2 \)$ with $p > 0$ smooth,
    and the coordinate functions satisfy $Delta U_j + k_j^2 p U_j = 0$.
    The positive volume factor $p$ is bounded above and below on this chart.
    Multiplying $\| U_j \|^2 thin d x$ by a fixed positive constant if necessary makes its mass at most one;
    the resulting logarithmic profile is the restriction of $V$.
    Theorem 3 applies with $B_j = 0$, $K_j = k_j$, and $D_j = S_j$, since
  $ k_j / S_j = 1 / j arrow.r 0 \, wide frac(k_j^2 parallel nabla p parallel_oo, S_j^2) =
    frac(parallel nabla p parallel_oo, j^2) arrow.r 0 . $
  Thus $V$ is subharmonic in every such chart. The strong maximum principle makes the set where $V = 0$ open;
    it is also closed by upper semicontinuity and nonempty by the preceding maximum argument.
    Connectedness gives $V equiv 0$ on $M$.
  On the other hand, the normalized mass of the given disk satisfies
  $ frac(1, 2 S_j) log integral_G \| u_j \|^2 thin d "vol"_g = - R_j / S_j lt.eq - j \, $
  with the same conclusion when the integral is zero. This contradicts the open lower bound in Equation (2.1),
    whose right-hand side is $sup_G V = 0$. The argument proves both positivity of the local norm and
    Equation (2.5). It uses only local isothermal charts and therefore imposes no orientability assumption. ◻
]

== 3 Affine improvement under subdivision <sec:subdivision>

The subharmonic profiles of Section 2 admit a useful local affine correction.
  Averaged over a sufficiently fine square grid, the remaining growth decreases faster than the side length.
  We first establish this fact for profiles and then transfer it to eigenfunctions.

#prodef([Definition 3.1.])[
  (Growth and affine excess).  Fix an isothermal coordinate region in which $Delta u + k^2 p u = 0$,
    and work in a relatively compact subset on which $p$ and $nabla p$ have fixed uniform bounds. Set $R = 1000$.
    Choose a root square $Q_0$, with side $s_0 lt.eq 1$ and center $x_(Q_0)$,
    such that $overline(bb(D)_(2 R s_0) \( x_(Q_0) \))$ lies in this subset.
    For an integer $A gt.eq 2$, subdivide each square into $A^2$ congruent squares and write $q prec
    Q$ when $q$ is an immediate child of $Q$. For a square $Q$ of side $s = s \( Q \)$ and center $x_Q$,
    put $K_Q = k s$. For a real vector $b in bb(R)^2$, define
  #[#set math.equation(numbering: n => "(3.1)")
   $ E \( Q \, b \) & =
     log ∥e^(- k b dot.op \( x - x_Q \)) u∥_(L^2 \( bb(D)_(R s) \( x_Q \) \)) / ∥e^(- k b dot.op \( x - x_Q \))
     u∥_(L^2 \( bb(D)_s \( x_Q \) \)) \,\
m \( Q \, b \) & = frac(E \( Q \, b \), K_Q) \, wide N \( Q \) = m \( Q \, 0 \) . $ <eq:growth>]
  All planar norms here and below are unnormalized Euclidean norms.
    An average over children assigns weight $A^(- 2)$ to each child.
] <def:growth>

A square $Q$ is called #emph[admissible] if $s \( Q \) lt.eq
  1$ and $overline(bb(D)_(R s \( Q \)) \( x_Q \))$ lies in the fixed coordinate region where the coefficient
  bounds hold. All descendants of the chosen root are admissible.
  The stronger $2 R$ margin at the root reserves room for nearby squares outside its subdivision tree.

Proposition 6 ensures that the local norms in (3.1) are nonzero.
  In particular, $E$, $m$, and $N$ are finite and nonnegative, since the disks are nested.
  Comparing the exponential weight on the two disks gives

#[#set math.equation(numbering: n => "(3.2)")
 $ N \( Q \) lt.eq m \( Q \, b \) + \( R + 1 \) lr(|b|) . $ <eq:untilted-comparison>]

Indeed the outer untilted norm is at most $e^(K R lr(||) b)$ times its tilted norm,
  whereas the inner untilted norm is at least $e^(- K lr(||) b)$ times its tilted norm, where $K = K_Q$.
  The same definitions and estimates apply to finite subtrees of an extended translated grid consisting of
  admissible squares.

The normalization by $K_Q$ explains why subdivision alone is insufficient. Put $rho = A^(- 1)$.
  An affine profile with slope $c eq.not 0$ has a difference of suprema equal to $\( R - 1 \) rho \|
  c \|$ between concentric disks of radii $R rho$ and $rho$.
  Division by the child frequency $K_q = rho K_Q$ cancels this first-order gain.
  We will subtract the local affine part to obtain an average profile excess of order
  $rho^2 \( 1 + \| log rho \| \)$, while keeping the average correction slope bounded.
  The latter bound controls the cost of changing weights through successive subdivisions.

#thm([Lemma 3.2.])[
  (Uniform potential decomposition).  #emph[Let $V$ be subharmonic on $bb(D)_R$, with
$ V lt.eq 0 \, wide sup_(overline(bb(D)_1)) V gt.eq - 1 . $

 Then $∥V∥_(L^1 \( bb(D)_8 \))$ and the mass of its Riesz measure $\( 2 pi \)^(- 1) Delta
   V$ on $bb(D)_5$ are uniformly bounded. There are a nonnegative measure $nu$ on $bb(D)_4$,
   of uniformly bounded mass, and a harmonic function $h$ on $bb(D)_3$ such that
$ V \( x \) = h \( x \) + integral_(bb(D)_4) log lr(|x - z|) thin d nu \( z \) \, wide x in bb(D)_3 . $

 The first and second derivatives of $h$ on $bb(D)_2$ are uniformly bounded.
   All bounds are independent of $V$, and the representation holds for the pointwise subharmonic representatives,
   including values equal to $- oo$.]
] <lem:potential-decomposition>

#proof[
  Upper semicontinuity supplies a point $x_(*) in overline(bb(D)_1)$ with $V \( x_(*) \) gt.eq - 1$.
    The disk $bb(D)_10 \( x_(*) \)$ contains $bb(D)_8$ and is contained in $bb(D)_R$.
    In particular, $V$ is nontrivial and locally integrable. Since $V lt.eq 0$, the submean inequality gives
  $ integral_(bb(D)_8) lr(|V|) lt.eq - integral_(bb(D)_10 \( x_(*) \)) V lt.eq 100 pi . $
  Its distributional Laplacian is a nonnegative Radon measure.
    Choose a fixed nonnegative smooth cutoff $psi$, supported in $bb(D)_8$ and equal to one on $bb(D)_5$.
    If $eta = \( 2 pi \)^(- 1) Delta V$, then
  $ eta \( bb(D)_5 \) lt.eq integral psi thin d eta = frac(1, 2 pi) integral V Delta psi lt.eq
    C ∥V∥_(L^1 \( bb(D)_8 \)) . $
  Let $nu$ be the restriction of $eta$ to $bb(D)_4$, and set $P \( x \) =
    integral_(bb(D)_4) log lr(|x - z|) thin d nu \( z \)$. The elementary bound
  $ sup_(z in bb(D)_4) integral_(bb(D)_3) \| log lr(|x - z|) #scale(x: 120%, y: 120%)[\|] thin d x < oo $
  shows that $∥P∥_(L^1 \( bb(D)_3 \)) lt.eq C nu \( bb(D)_4 \)$.
    The logarithmic fundamental solution identity $Delta log lr(|x - z|) =
    2 pi delta_z$ implies $Delta \( V - P \) = 0$ on $bb(D)_3$.
    Thus $V - P$ agrees almost everywhere with a harmonic function $h$.
    Interior harmonic estimates, applied to its bounded $L^1 \( bb(D)_3 \)$ norm,
    bound $nabla h$ and $nabla^2 h$ on $bb(D)_2$. Finally, the logarithmic potential of a nonnegative measure has
    its usual subharmonic representative. Both $V$ and $h + P$ are recovered pointwise as limits of their disk
    averages. Their almost-everywhere equality therefore gives the asserted pointwise representation. ◻
]

#thm([Lemma 3.3.])[
  (Affine correction of a profile).  #emph[Let $V$, $h$, and $nu$ be as in Lemma 8.
    Subdivide the unit square $\[ - 1 \/ 2 \, 1 \/ 2 \]^2$ into $A^2$ squares, where $A > 10 R$, put $rho =
    A^(- 1)$, and denote their centers by $y$. Define
$ c_y = nabla h \( y \) + integral_(z in bb(D)_4\
lr(|z - y|) > 2 R rho) frac(y - z, lr(|y - z|)^2) thin d nu \( z \) . $

 Then
#[#set math.equation(numbering: n => "(3.3)")
 $ & sup_(overline(bb(D)_(R rho) \( y \))) \( V \( x \) - c_y dot.op x \) -
   sup_(bb(D)_rho \( y \)) \( V \( x \) - c_y dot.op x \)\
 & #h(1cm)  lt.eq C (rho^2 + integral_(bb(D)_4) min {1 \, rho^2 / lr(|z - y|)^2} thin d nu \( z \)) .
   $ <eq:affine-error>]

 At $z = y$ the minimum in this formula is interpreted as one. Moreover,
$ "avg"_y lr(|c_y|) lt.eq C \, wide "avg"_y [upright("right-hand side of ") upright("(3.3)")] lt.eq
  C rho^2 \( 1 + lr(|log rho|) \) . $

 The constants may depend on $R$, but are independent of $A$ and $V$.]
] <lem:affine-profile>

#proof[
  All disks $overline(bb(D)_(R rho) \( y \))$ lie in $bb(D)_2$.
    The vector $c_y$ is finite because its kernel is truncated away from its singularity.
    Put $W_y \( x \) = V \( x \) - c_y dot.op x$, and lower bound its supremum on the inner disk by its disk
    average there. For the harmonic term, this average is its value at $y$,
    after the affine part is accounted for. Taylor’s theorem bounds the corresponding outer deviation by $C rho^2$.
  For a far source $lr(|z - y|) > 2 R rho$, the logarithm is harmonic on the outer disk and its Hessian is bounded
    there by $C lr(|z - y|)^(- 2)$. Its inner disk average is $log lr(|y - z|)$,
    and the retained gradient in $c_y$ removes its first-order term.
    Its contribution to the outer deviation is therefore at most $C rho^2 \/ lr(|z - y|)^2$.
  For a near source $lr(|z - y|) lt.eq 2 R rho$, rescale by $rho$.
    Writing $t = \( z - y \) \/ rho$, the disk-average formula
  $ 1 / pi integral_(bb(D)_1) log lr(|xi - t|) thin d xi =
    cases(delim: "{", \( lr(|t|)^2 - 1 \) \/ 2 \, & lr(|t|) lt.eq 1 \,, log lr(|t|) \, & lr(|t|) gt.eq 1) $
  has lower bound $- 1 \/ 2$. On the larger disk the corresponding logarithm is at most $log \( 3 R \)$,
    since $lr(||) t lt.eq 2 R$. The common term $log rho$ cancels between these two quantities.
    Thus the difference between the outer upper bound and the inner average is at most $log \( 3 R \) + 1 \/ 2$,
    uniformly in the source position. This calculation permits an atom at $y$, or anywhere else in the inner disk:
    the logarithm remains integrable in the averaging variable.
    At an outer point where a potential is $- oo$, an upper bound causes no difficulty.
    Because the measure is nonnegative, the kernel bounds may be integrated. On the near region,
  $ min {1 \, rho^2 / lr(|z - y|)^2} gt.eq frac(1, 4 R^2) . $
  Combining the near and far bounds proves (3.3).
  For completeness, fix any $z in bb(D)_4$. The number of grid centers within distance $r$ of $z$ is at most
    $C \( 1 + r^2 \/ rho^2 \)$. There are $rho^(- 2)$ centers in total.
    The centers at distance at most $rho$ contribute $C rho^2$ to the averaged minimum kernel.
    In each dyadic annulus $2^ell rho < lr(|z - y|) lt.eq 2^(ell + 1) rho$,
    the number of centers is at most $C 2^(2 ell)$, whereas the kernel is at most $2^(- 2 ell)$.
    All distances are bounded by five, so only $C \( 1 + lr(|log rho|) \)$ annuli occur. Hence, uniformly in $z$,
  $ "avg"_y min {1 \, rho^2 / lr(|z - y|)^2} lt.eq C rho^2 \( 1 + lr(|log rho|) \) . $
  The same annuli, for the truncated gradient kernel, give
  $ rho^2 sum_(y\
lr(|z - y|) > 2 R rho) 1 / lr(|z - y|) lt.eq C . $
  Indeed an annulus of radius comparable to $2^ell rho$ contributes at most $C 2^ell rho$,
    and these radii sum to a fixed constant. Integrating the two bounds against the bounded measure $nu$,
    and using the bound for $nabla h$, proves both averaged estimates. ◻
]

#thm([Proposition 3.4.])[
  (One subdivision step).  #emph[There are an integer $A > 10 R$ and constants $C_0 \, C_1 > 0$,
    depending only on the fixed coordinate coefficient bounds and $R$, with the following property.
    Let $Q$ be an admissible square of side $s lt.eq 1$, let $K = k s > 0$, and let $b in bb(R)^2$ and $S > 0$.
    Put $B = K b$. If
#[#set math.equation(numbering: n => "(3.4)")
 $ S gt.eq C_0 \, wide E \( Q \, b \) lt.eq S \, wide frac(K, S + lr(||) B) lt.eq 1 / C_0 \, wide
   frac(K^2 s, S \( S + lr(||) B \)) lt.eq 1 / C_0 \, $ <eq:subdivision-hypotheses>]

 then real vectors $b_q$ can be chosen for the children $q prec Q$ so that
#[#set math.equation(numbering: n => "(3.5)")
 $ "avg"_(q prec Q) lr(|b_q - b|) lt.eq C_1 S / K \, wide "avg"_(q prec Q) m \( q \, b_q \) lt.eq 1 / 2 S /
   K . $ <eq:subdivision-estimate>]

 The constants are independent of the eigenfunction, the scale, the depth of a tree, and any lower bound for $K$.]
] <prop:subdivision>

#proof[
  First choose $A > 10 R$, using only the uniform estimates of Lemma 9, so large that, with $rho = A^(- 1)$,
  $ C rho^2 \( 1 + lr(|log rho|) \) < rho / 4 . $
  Choose $C_1$ strictly larger than the uniform bound for $"avg"_y lr(|c_y|)$ in that lemma.
    We prove that some finite $C_0$ works for these fixed choices.
  Suppose otherwise. There is a sequence of failures of the conclusion for which the hypotheses hold with $C_0 =
    j$. Use subscripts $j$ for the associated quantities and rescale each parent square to the unit square
    centered at zero:
  $ U_j \( X \) = u_j \( x_(Q_j) + s_j X \) \, wide p_j \( X \) = p \( x_(Q_j) + s_j X \) . $
  The rescaled equation is $Delta U_j + K_j^2 p_j U_j = 0$, and $∥p_j∥_oo lt.eq C$, $∥nabla p_j∥_oo lt.eq C s_j$.
    With $B_j = K_j b_j$ and $D_j = S_j + lr(|B_j|)$, the failure hypotheses imply
  $ S_j arrow.r oo \, wide K_j / D_j arrow.r 0 \, wide frac(K_j^2 ∥nabla p_j∥_oo, S_j D_j) arrow.r 0 . $
  No restriction on $lr(|B_j|) \/ S_j$ has been imposed.
  Normalize the tilted measures on $bb(D)_R$ by setting
  $ d mu_j \( X \) =
    frac(e^(- 2 B_j dot.op X) lr(|U_j \( X \)|)^2 thin d X, integral_(bb(D)_R) e^(- 2 B_j dot.op X) lr(|U_j \(
    X \)|)^2 thin d X) . $
  Lemma 2 and Theorem 3 give, after passage to a subsequence, a subharmonic profile $V$, possibly identically $-
    oo$, on $bb(D)_R$. It satisfies $V lt.eq 0$, while
  $ mu_j \( bb(D)_1 \) = e^(- 2 E \( Q_j \, b_j \)) gt.eq e^(- 2 S_j) . $
  The compact upper bound in (2.1), applied to $overline(bb(D)_1)$,
    therefore gives $sup_(overline(bb(D)_1)) V gt.eq - 1$. In particular,
    $V$ is nontrivial and the two preceding lemmas apply.
  For each of the fixed, finitely many child centers $y$, take the vector $c_y$ furnished by Lemma 9 for this
    limiting profile. On the corresponding child $q_j$, set
  $ b_(q_j) = b_j + S_j / K_j c_y . $
  In parent coordinates the additional weight is $e^(- 2 S_j c_y dot.op X)$.
    To see the cancellation of recentering constants, write
  $ - K_j b_(q_j) dot.op \( X - y \) = - B_j dot.op X - S_j c_y dot.op X + \( B_j + S_j c_y \) dot.op y . $
  The last term, as well as the measure normalization and the coordinate Jacobian,
    cancels in the ratio defining $E \( q_j \, b_(q_j) \)$. Consequently this excess is one half the logarithm of
  $
    frac(integral_(bb(D)_(R rho) \( y \)) e^(- 2 S_j c_y dot.op X) thin d mu_j \( X \), integral_(bb(D)_rho \(
    y \)) e^(- 2 S_j c_y dot.op X) thin d mu_j \( X \)) . $
  Apply the weighted compact upper bound to the numerator, using $overline(bb(D)_(R rho) \( y \))$,
    and the weighted open lower bound to the denominator. This yields
  $ limsup_j frac(E \( q_j \, b_(q_j) \), S_j) lt.eq
    sup_(overline(bb(D)_(R rho) \( y \))) \( V \( X \) - c_y dot.op X \) -
    sup_(bb(D)_rho \( y \)) \( V \( X \) - c_y dot.op X \) . $
  The inner supremum is finite: a nontrivial subharmonic function is locally integrable, so it cannot equal $-
    oo$ throughout an open disk, and it is bounded above on compact subsets.
    Both suprema in the displayed difference are therefore finite.
  There are only $A^2$ children, and $A$ has already been fixed.
    Averaging the last inequality and invoking Lemma 9 gives
  $ limsup_j "avg"_(q_j prec Q_j) frac(E \( q_j \, b_(q_j) \), S_j) < rho / 4 . $
  Since $K_(q_j) = rho K_j$, it follows, for all sufficiently large $j$, that
  $ "avg"_(q_j prec Q_j) m \( q_j \, b_(q_j) \) lt.eq 1 / 2 S_j / K_j . $
  At the same time,
  $ "avg"_(q_j prec Q_j) lr(|b_(q_j) - b_j|) = S_j / K_j "avg"_y lr(|c_y|) lt.eq C_1 S_j / K_j . $
  Thus these choices satisfy both required inequalities, contrary to the defining failure of the sequence.
    This proves the proposition. In particular, $A$ and $C_1$ have been fixed before $C_0$,
    and no positive lower bound for $K$ was used. ◻
]

== 4 Descent and stability <sec:descent>

We iterate the subdivision estimate while the untilted growth or the tilt is large.
  The first goal is a bound, independent of the number of levels,
  for the total residual growth and the accumulated changes of tilt.
  This bound will show that a sufficiently large initial tilt with small residual growth forces high untilted
  growth to persist on a positive fraction of paths.

Fix the integer $A$ and constants $C_0 \, C_1$ from Proposition 10. We may increase $C_0$ so that $C_0 gt.eq 1$.
  Consider a finite subdivision tree with all terminal squares at the same level, and suppose that

$ K_Q = k s \( Q \) gt.eq a_0 > 0 $

on every square of the tree. The square at the start of a subtree will be denoted by $I$,
  and its side satisfies $s \( I \) lt.eq 1$. All disks used below are assumed to lie in the coordinate region of
  Section 3. The arguments also apply to a subtree in an extension of the same grid whenever its disks have this
  property. Throughout this section, constants may depend on the fixed number $a_0$,
  as well as on the coordinate data and the constants already chosen.

Choosing a child uniformly among the $A^2$ children at each step defines a random path through the tree.
  Equivalently, one may choose a point uniformly in $I$ and follow its containing squares,
  ignoring grid boundaries of area zero.

#thm([Lemma 4.1.])[
  (One step of descent).  #emph[There is a fixed $L > 0$ such that, at any nonterminal square $Q$,
    if $N \( Q \) > L$ or $lr(|b|) > L$, one can assign a tilt $b_q$ to each child $q$ so that, writing $m =
    m \( Q \, b \)$, $m' = m \( q \, b_q \)$, and $b' = b_q$, one has
#[#set math.equation(numbering: n => "(4.1)")
 $ bb(E) #scale(x: 120%, y: 120%)[\(] lr(|b' - b|) divides Q \, b #scale(x: 120%, y: 120%)[\)] lt.eq
   C_1 \( m + f_Q \) \, wide bb(E) #scale(x: 120%, y: 120%)[\(] m' divides Q \,
   b #scale(x: 120%, y: 120%)[\)] lt.eq 1 / 2 \( m + f_Q \) \,\
f_Q = C_0 / K_Q + s \( Q \) . $ <eq:descent>]

 Moreover, if $Q_0 = I \, Q_1 \, dots.h \, Q_d$ is any path from $I$ to the terminal level, then
#[#set math.equation(numbering: n => "(4.2)")
 $ sum_(i = 0)^d f_(Q_i) lt.eq frac(A, A - 1) (C_0 / a_0 + s \( I \)) . $ <eq:floors>]

]
] <lem:descent>

#proof[
  Write $K = K_Q$, $s = s \( Q \)$, and set
  $ S = E \( Q \, b \) + C_0 + K s \, wide B = K b . $
  Thus $S gt.eq C_0$, $E \( Q \, b \) lt.eq S$, and $S gt.eq K s$. Equation (3.2) gives
  $ N \( Q \) lt.eq m \( Q \, b \) + \( R + 1 \) lr(|b|) lt.eq \( R + 1 \) #scale(x: 120%, y: 120%)[\(]
    m \( Q \, b \) + lr(|b|) #scale(x: 120%, y: 120%)[\)] . $
  Consequently $S + lr(|B|) gt.eq K N \( Q \) \/ \( R + 1 \)$; also $S + lr(|B|) gt.eq K lr(|b|)$.
    Choose, for example, $L = 2 C_0 \( R + 1 \)$. Either of the alternatives in the lemma then implies
  $ frac(K, S + lr(|B|)) lt.eq 1 / C_0 . $
  Using $S gt.eq K s$, we obtain the other required smallness condition,
  $ frac(K^2 s, S \( S + lr(|B|) \)) lt.eq frac(K, S + lr(|B|)) lt.eq 1 / C_0 . $
  All the hypotheses of Proposition 10 hold. Its conclusions, with $S \/ K = m \( Q \, b \) + f_Q$, are precisely (4.1).
  Along a path, $s \( Q_i \) = A^(- i) s \( I \)$ and $K_(Q_i) = A^(d - i) K_(Q_d)$. Since $K_(Q_d) gt.eq a_0$,
  $ sum_(i = 0)^d C_0 / K_(Q_i) lt.eq C_0 / a_0 sum_(ell = 0)^d A^(- ell) \, wide sum_(i = 0)^d s \( Q_i \) =
    s \( I \) sum_(i = 0)^d A^(- i) . $
  The geometric-series bound gives (4.2). ◻
]

We next allow descent to stop according to the values encountered along a path.
  A stopping rule is understood to use only the squares and tilts already visited.
  In particular, a violation first detected on arrival at a child stops the procedure at that child.

#thm([Lemma 4.2.])[
  (Stopped descent).  #emph[Start at $I$ with a prescribed tilt $b_I$.
    Whenever a step is made, choose the child tilts by Lemma 11,
    and suppose that its applicability condition holds at every square from which the procedure continues.
    Stop at a time $T$, no later than the terminal level. Write $m_i = m \( Q_i \, b_i \)$ for the visited values,
    including the last value $m_T$. There is a constant $C_(upright("st"))$,
    independent of the depth and of the stopping rule, such that
#[#set math.equation(numbering: n => "(4.3)")
 $ bb(E) [sum_(i = 0)^T m_i + sum_(i = 0)^(T - 1) lr(|b_(i + 1) - b_i|)] lt.eq
   C_(upright("st")) #scale(x: 120%, y: 120%)[\(] m \( I \, b_I \) +
   1 #scale(x: 120%, y: 120%)[\)] . $ <eq:stopped-descent>]

 The second sum includes the step producing the last square, even if that square causes the procedure to stop.]
] <lem:stopped-descent>

#proof[
  There are only finitely many nodes. At each node from which descent continues,
    choose one of the assignments furnished by Lemma 11. These choices and the stopping rule determine all random
    variables on the finite probability space of terminal paths.
    Thus only finite conditional-expectation identities are needed.
    In expressions with a fixed index, set $m_i = 0$ after stopping;
    those auxiliary values do not enter the stopped sums.
  Let $d$ be the depth below $I$, put $m_0 = m \( I \, b_I \)$, and set
  $ F_I = frac(A, A - 1) (C_0 / a_0 + s \( I \)) \, wide M = bb(E) sum_(i = 0)^T m_i . $
  The event ${ i < T }$ is determined before the next child is selected.
    Applying (4.1) on this event and summing over $0 lt.eq i < d$ gives
  $ M - m_0 = sum_(i = 0)^(d - 1) bb(E) #scale(x: 120%, y: 120%)[\[] upright(bold(1))_({ i < T }) m_(i + 1)
    #scale(x: 120%, y: 120%)[\]] lt.eq 1 / 2 bb(E) sum_(i = 0)^(T - 1) \( m_i + f_(Q_i) \) lt.eq 1 / 2 M + 1 / 2 F_I . $
  All the $m_i$ are nonnegative by Definition 7. It follows that $M lt.eq 2 m_0 + F_I$.
    The tilt estimate in (4.1) similarly yields
  $ bb(E) sum_(i = 0)^(T - 1) lr(|b_(i + 1) - b_i|) lt.eq C_1 bb(E) sum_(i = 0)^(T - 1) \( m_i + f_(Q_i) \) lt.eq
    2 C_1 m_0 + 2 C_1 F_I . $
  Their sum is at most
  $ 2 \( 1 + C_1 \) m_0 + \( 1 + 2 C_1 \) F_I . $
  Since $s \( I \) lt.eq 1$, this is bounded by the right-hand side of (4.3) with a constant depending only on the
    fixed data. This calculation includes $T = 0$, and it includes both $m_T$ and the incoming increment when the
    last square violates a stopping condition. ◻
]

A large tilt whose remaining excess is small forces the original, untilted growth to be large.
  We give a separate size threshold and ratio threshold for this statement.

#thm([Lemma 4.3.])[
  (Large slope forces large growth).  #emph[For the fixed $L$ in Lemma 11, there are constants $B_(*) gt.eq
    1$ and $eta_(*) > 0$ such that every admissible square with $s \( Q \) lt.eq 1$ and $K_Q gt.eq a_0$ satisfies
#[#set math.equation(numbering: n => "(4.4)")
 $ lr(|b|) gt.eq B_(*) \, wide m \( Q \, b \) lt.eq eta_(*) lr(|b|) quad arrow.r.double quad
   N \( Q \) > L . $ <eq:large-slope>]

]
] <lem:large-slope>

#proof[
  If no such pair of thresholds existed, then for each positive integer $j$ there would be a square $Q_j$ and a
    tilt $b_j$ with
  $ lr(|b_j|) gt.eq j \, wide frac(m \( Q_j \, b_j \), lr(|b_j|)) lt.eq 1 / j \, wide N \( Q_j \) lt.eq L . $
  Rescale about the center of $Q_j$ by its side $s_j = s \( Q_j \)$.
    In the rescaled coordinates, $U_j$ solves $Delta U_j + K_j^2 p_j U_j = 0$ on $bb(D)_R$, where $K_j = K_(Q_j)$,
    $∥p_j∥_oo lt.eq C$, and $∥nabla p_j∥_oo lt.eq C s_j$. Set
  $ S_j = K_j lr(|b_j|) \, wide B_j = K_j b_j \, wide D_j = S_j + lr(|B_j|) = 2 S_j . $
  The hypotheses of Theorem 3 follow from
  $ S_j gt.eq a_0 j arrow.r oo \, wide K_j / D_j = frac(1, 2 lr(|b_j|)) arrow.r 0 \, wide
    frac(K_j^2 ∥nabla p_j∥_oo, S_j D_j) lt.eq frac(C s_j, 2 lr(|b_j|)^2) arrow.r 0 . $
  Normalize the tilted measures
  $ d mu_j \( x \) = c_j e^(- 2 B_j dot.op x) lr(|U_j \( x \)|)^2 thin d x $
  to have mass one on $bb(D)_R$. By Lemma 2 and Theorem 3, a subsequence has a subharmonic profile $V lt.eq 0$,
    with the identically minus infinity case initially allowed. The definitions give
  $ frac(log mu_j \( bb(D)_1 \), 2 S_j) = - frac(E \( Q_j \, b_j \), S_j) = -
    frac(m \( Q_j \, b_j \), lr(|b_j|)) arrow.r 0 . $
  The upper bound in (2.1) on the compact set $overline(bb(D)_1)$ therefore implies $sup_(overline(bb(D)_1)) V =
    0$. In particular the profile is nontrivial and attains its maximum at an interior point of $bb(D)_R$.
    The strong maximum principle yields $V = 0$ on $bb(D)_R$.
  Pass to a further subsequence so that $e_j = b_j \/ lr(|b_j|)$ converges to a unit vector $e$.
    Undoing the tilt expresses the untilted growth as
  $ frac(E \( Q_j \, 0 \), S_j) = frac(1, 2 S_j) log integral_(bb(D)_R) e^(2 S_j e_j dot.op x) thin d
    mu_j \( x \) - frac(1, 2 S_j) log integral_(bb(D)_1) e^(2 S_j e_j dot.op x) thin d mu_j \( x \) . $
  For any fixed $1 < r < R$, bound the first integral from below by its restriction to $bb(D)_r$.
    The weighted form of Lemma 2, applied from below on the open disk $bb(D)_r$ and from above on the compact disk
    $overline(bb(D)_1)$, gives
  $ liminf_(j arrow.r oo) frac(E \( Q_j \, 0 \), S_j) gt.eq sup_(bb(D)_r) e dot.op x -
    sup_(overline(bb(D)_1)) e dot.op x = r - 1 . $
  Letting $r arrow.t R$ gives a lower bound of $R - 1$, without any claim about mass at the boundary of $bb(D)_R$.
    On the other hand,
  $ 0 lt.eq frac(E \( Q_j \, 0 \), S_j) = frac(N \( Q_j \), lr(|b_j|)) lt.eq L / j arrow.r 0 \, $
  a contradiction. ◻
]

#thm([Proposition 4.4.])[
  (Stability of large growth).  #emph[There are constants $P gt.eq 1$ and $sigma > 0$ with the following property.
    Suppose a square $I$ and a tilt $b_I$ satisfy
#[#set math.equation(numbering: n => "(4.5)")
 $ lr(|b_I|) gt.eq P \, wide m \( I \, b_I \) lt.eq sigma lr(|b_I|) . $ <eq:stability-hypotheses>]

 Then at least half the paths from $I$ to the terminal level satisfy $N \( Q \) > L$ at every visited square $Q$,
   including $I$ and the terminal square. Equivalently, these paths occupy a measurable set of area at least
   $lr(|I|) \/ 2$.]
] <prop:stability>

#proof[
  Let $B_(*) \, eta_(*)$ be the thresholds from Lemma 13. Choose $gamma$ so that
  $ 0 < gamma < 1 / 2 \, wide frac(gamma, 1 - gamma) lt.eq eta_(*) . $
  Let $C_(upright("st"))$ be the constant from Lemma 12. Choose
  $ 0 < sigma lt.eq min {gamma / 2 \, frac(gamma, 8 C_(upright("st")))} \, wide P gt.eq max {1 \,
    frac(B_(*), 1 - gamma) \, frac(2 L, 1 - gamma) \, frac(8 C_(upright("st")), gamma)} . $
  Write $B_0 = lr(|b_I|)$. Starting at $I$, descend using Lemma 11 while
  $ lr(|b_i - b_I|) < gamma B_0 \, wide m_i < gamma B_0 \, $
  and stop at the first failure of either inequality or at the terminal level, whichever comes first.
    These inequalities hold initially by (4.5). Whenever they hold, we have
  $ lr(|b_i|) > \( 1 - gamma \) B_0 gt.eq B_(*) \, wide lr(|b_i|) > L \, wide m_i /
    lr(|b_i|) < frac(gamma, 1 - gamma) lt.eq eta_(*) . $
  Thus every required step is available and Lemma 13 gives $N \( Q_i \) > L$ at each such square.
  Let $T$ be this stopping time. Include in the failure event a violation first produced at the terminal level.
    If a failure occurs, then either $m_T gt.eq gamma B_0$, or the triangle inequality gives $sum_(i = 0)^(T - 1)
    lr(|b_(i + 1) - b_i|) gt.eq gamma B_0$. Consequently Lemma 12 and Markov’s inequality give
  $ bb(P) \( upright("failure") \) & lt.eq frac(1, gamma B_0) bb(E)
    [sum_(i = 0)^T m_i + sum_(i = 0)^(T - 1) lr(|b_(i + 1) - b_i|)]\
 & lt.eq C_(upright("st")) / gamma (sigma + 1 / P) lt.eq 1 / 4 . $
  On the complementary event, descent reaches the terminal level and the two strict inequalities hold at every
    visited square. All of those squares have $N > L$. This event has probability at least $3 \/ 4$,
    which proves the asserted lower bound of $1 \/ 2$. The same reasoning includes a subtree of depth zero. ◻
]

== 5 Persistence and packing <sec:persistence>

We now bound the average of $N$ at the terminal level. The stopped descent estimate controls the contribution of
  one excursion of high growth, but a path may enter several excursions.
  We will bound the total area of their entry squares. The argument has two parts:
  an entry produces a nearby region on which few later entries can occur,
  and a geometric packing estimate converts these regions into the required area bound.

Fix the root square $Q_0$ and the constants $A \, C_0 \, C_1$ from Section 3.
  We consider finite subdivision trees whose terminal squares have a common side length and for which $K_Q gt.eq
  a_0 > 0$ at every level. All constants in this section may depend on these fixed data, including $a_0$,
  but are independent of the eigenfunction and the depth of the tree.
  Let $L$ be the threshold in Lemma 11, and let $P \, sigma$ be the constants in Proposition 14.
  Proposition 6 and the fixed coordinate volume comparisons give a constant $C_(upright("init"))$ such that
  $N \( Q_0 \) lt.eq C_(upright("init"))$.

=== 5.1 Entries and persistent nearby regions <entries-and-persistent-nearby-regions>

#prodef([Definition 5.1.])[
  (Excursions).  Choose a threshold $H > max { L \, C_(upright("init")) }$.
    Along each descending grid path, an excursion starts the first time $N \( Q \) >
    H$ and ends the first subsequent time $N \( Q \) lt.eq L$.
    After an excursion has ended, apply the same rule again. A square at which an excursion starts is called an
    #emph[entry]. An excursion is #emph[active] at a square if it has started and has not yet ended there.
] <def:excursions>

These decisions depend only on a square and its ancestors, so each entry is a whole grid square.
  Write $cal(E)$ for the family of entries. The root is not an entry.
  In addition to the lower bound defining an entry, we have a uniform upper bound on its growth.

#thm([Lemma 5.2.])[
  (Growth at an entry).  #emph[For all sufficiently large fixed $H$, every entry $Q$ and its grid parent $Q^p$ satisfy
#[#set math.equation(numbering: n => "(5.1)")
 $ N \( Q^p \) lt.eq H \, wide H < N \( Q \) lt.eq A^2 #scale(x: 120%, y: 120%)[\[] 1 /
   2 + \( R + 1 \) C_1 #scale(x: 120%, y: 120%)[\]] (H + C_0 / a_0) . $ <eq:entry-bound>]

]
] <lem:entry-bound>

#proof[
  Immediately before an entry the path is inactive. An inactive square cannot have $N > H$,
    since that would start an excursion, so $N \( Q^p \) lt.eq H$.
    Apply Proposition 10 at $Q^p$ with $b = 0$ and $S = H K_(Q^p) + C_0$.
    Indeed, $E \( Q^p \, 0 \) lt.eq H K_(Q^p) lt.eq S$, and
  $ K_(Q^p) / S lt.eq 1 / H \, wide frac(K_(Q^p)^2 s \( Q^p \), S^2) lt.eq 1 / H^2 \, $
  since $s \( Q^p \) lt.eq 1$. Thus (3.4) holds when $H$ is sufficiently large.
    All terms in the averages in (3.5) are nonnegative. There are $A^2$ children,
    so the tilt $b_Q$ assigned to the particular child $Q$ satisfies
  $ m \( Q \, b_Q \) lt.eq frac(A^2 S, 2 K_(Q^p)) \, wide \| b_Q \| lt.eq frac(A^2 C_1 S, K_(Q^p)) . $
  Combining these inequalities with (3.2) and $K_(Q^p) gt.eq a_0$ proves the upper bound in (5.1). ◻
]

For a square $Q$ and a number $D gt.eq 1$, write $D Q$ for its concentric dilation by the factor $D$.
  The following proposition supplies a region of controlled future entry count near each entry.
  Its location need not be inside the entry square.

#thm([Proposition 5.3.])[
  (Persistence near an entry).  #emph[There are a finite threshold $H$, a number $delta > 0$,
    and an integer $J gt.eq 0$ such that every entry $Q$ admits a measurable set $Y_Q subset D_(*) Q$,
    where $D_(*) = 20 A$, with
#[#set math.equation(numbering: n => "(5.2)")
 $ \| Y_Q \| & gt.eq delta \| Q \| \,\
\# { F in cal(E) : med s \( F \) < s \( Q \) \, med y in F } & lt.eq J wide
  upright("for almost every ") y in Y_Q . $ <eq:persistence>]

 Only entries of the given tree are counted, including when $Y_Q$ extends outside the root.]
] <prop:persistence>

#proof[
  The contradiction argument below extracts a nonconstant profile,
    finds a nearby square with small affine excess relative to a nonzero slope,
    and transfers that square to Proposition 14.
  We may require $H$ to exceed any fixed threshold needed above.
    Suppose there is no triple $\( H \, delta \, J \)$ with the asserted uniform property.
    Choose $H_j arrow.r oo$, all above these fixed thresholds and at least $2$,
    and apply this negation with $delta_j = 1 \/ H_j$ and $J_j = ceil.l H_j ceil.r$.
    For each $j$ there are an eigenfunction, a finite tree, and an entry $Q_j$ for which (5.2) fails with these
    parameters.
  There must be more than $J_j$ levels strictly below $Q_j$.
    Otherwise the finer-entry count would be at most $J_j$ everywhere, and $Y_(Q_j) = Q_j$ would satisfy (5.2).
    In particular, every fixed number of further levels is eventually available.
  Rescale about the center $x_j$ of the parent $Q_j^p$, using its side $s_j = s \( Q_j^p \)$ as unit length.
    Write $k_j$ for the eigenfrequency of $u_j$, and put
  $ K_j = k_j s_j \, wide S_j = H_j K_j \, wide U_j \( xi \) = u_j \( x_j + s_j xi \) \, wide p_j \( xi \) =
    p \( x_j + s_j xi \) . $
  The rescaled equation is $Delta U_j + K_j^2 p_j U_j = 0$.
    Its coefficients satisfy $parallel p_j parallel_oo lt.eq C$ and $parallel nabla p_j parallel_oo lt.eq C s_j$.
    Moreover,
  $ S_j gt.eq H_j a_0 arrow.r oo \, wide K_j / S_j = 1 / H_j arrow.r 0 \, wide
    frac(K_j^2 parallel nabla p_j parallel_oo, S_j^2) lt.eq frac(C s_j, H_j^2) arrow.r 0 . $
  Normalize $\| U_j \|^2 thin d xi$ to have mass one on $bb(D)_R$.
    Lemma 2 and Theorem 3, with zero tilt, give a subharmonic profile $V$ on $bb(D)_R$ satisfying
  $ V lt.eq 0 \, wide sup_(overline(bb(D)_1)) V gt.eq - 1 . $
  For the second assertion, the parent inequality gives $E \( Q_j^p \, 0 \) \/ S_j lt.eq 1$,
    and the compact upper bound in (2.1) applies to the closed unit disk. Thus $V$ is not identically $- oo$.
    Its supremum on every nonempty open disk in $bb(D)_R$ is therefore finite.
  There are only $A^2$ possible positions of the entry inside its parent.
    After a subsequence its rescaled center is a fixed point $y_e$.
    The entry inequality and the compact upper and open lower bounds in (2.1) imply
  $ 1 / A lt.eq liminf_j frac(E \( Q_j \, 0 \), S_j) lt.eq limsup_j frac(E \( Q_j \, 0 \), S_j) lt.eq
    sup_(overline(bb(D)_(R \/ A) \( y_e \))) V - sup_(bb(D)_(1 \/ A) \( y_e \)) V . $
  The finiteness of the second supremum justifies the subtraction of these bounds.
    Since $A > 10 R$, both disks are contained in $bb(D)_2$. Consequently $V$ is nonconstant on $bb(D)_2$.
  The representation in Lemma 8 implies $V in W^(1 \, 1) \( bb(D)_2 \)$:
    the gradient of the logarithmic kernel is locally integrable in two dimensions,
    and the representing measure has finite mass. There is a Lebesgue point $z in bb(D)_2$ of $nabla
    V$ for which $c = nabla V \( z \) eq.not 0$. Indeed, otherwise the weak gradient would vanish almost
    everywhere on the connected disk, forcing $V$ to be constant almost everywhere;
    its subharmonic representative, which is determined by local averages, would then be constant everywhere.
  Extend the fine subdivision grids in the rescaled parent coordinates to the whole plane.
    For $r = A^(- m)$, choose a grid square with center $y_m$ such that $\| y_m - z \| lt.eq r$.
    These grids have edges $- 1 / 2 + n A^(- m)$ in each coordinate and are the same for every $j$. We claim that
  #[#set math.equation(numbering: n => "(5.3)")
   $ sup_(overline(bb(D)_(R r) \( y_m \))) \( V \( x \) - c dot.op x \) -
     sup_(bb(D)_r \( y_m \)) \( V \( x \) - c dot.op x \) = o \( r \) wide \( m arrow.r oo \) . $ <eq:affine-lebesgue>]
  To prove this, let $W \( x \) = V \( x \) - c dot.op x$, and let $a_r$ be its average on $B_r =
    bb(D)_(\( 2 R + 2 \) r) \( z \)$. For large $m$ these disks are contained in $bb(D)_2$.
    Poincare’s inequality and the Lebesgue-point property give
  $ "avg"_(B_r) \| W - a_r \| lt.eq C_R r thin "avg"_(B_r) \| nabla V - c \| = o \( r \) . $
  If $x in overline(bb(D)_(R r) \( y_m \))$, the disk $bb(D)_(\( R + 1 \) r) \( x \)$ lies in $B_r$.
    The submean inequality for the subharmonic function $W$ therefore gives, uniformly in such $x$,
  $ W \( x \) lt.eq a_r + 4 "avg"_(B_r) \| W - a_r \| = a_r + o \( r \) . $
  On the other hand,
  $ sup_(bb(D)_r \( y_m \)) W gt.eq "avg"_(bb(D)_r \( y_m \)) W gt.eq a_r - \( 2 R + 2 \)^2 "avg"_(B_r) \| W -
    a_r \| = a_r - o \( r \) . $
  This proves (5.3). Subharmonicity is essential here: it turns the average control into a uniform upper bound.
  Now fix $m gt.eq 2$ sufficiently large that $R r lt.eq 1 \/
    4$ and the quotient of the left side of (5.3) by $r \| c \|$ is strictly less than $sigma$.
    In the original coordinates let $I_j$ be the square with center $x_j + s_j y_m$ and side $s_j r$,
    and assign it the tilt $b_(I_j) = H_j c$. The additional weight in parent coordinates is
    $e^(- 2 S_j c dot.op xi)$, up to a constant canceled in the norm ratio.
    The weighted bounds of Lemma 2 therefore yield
  #[#set math.equation(numbering: n => "(5.4)")
   $ limsup_j frac(m \( I_j \, b_(I_j) \), \| H_j c \|) lt.eq
     frac(sup_(overline(bb(D)_(R r) \( y_m \))) \( V \( x \) - c dot.op x \) - sup_(bb(D)_r \( y_m \)) \( V \(
     x \) - c dot.op x \), r \| c \|) < sigma . $ <eq:persistence-transfer>]
  The factor is exactly $1 \/ \( r \| c \| \)$, since $K_(I_j) = r K_j$ and $S_j = H_j K_j$.
    Because $c eq.not 0$, we also have $\| H_j c \| gt.eq P$ for all large $j$. Thus (4.5) holds at $I_j$.
  We verify that Proposition 14 can be used on the whole subtree of $I_j$ down to the original bottom.
    The chosen $m$ is fixed before $j$ tends to infinity, so that level is eventually available.
    All squares of a given extended-grid level have the same physical scale as the original tree,
    and hence have $K gt.eq a_0$. The center $y_m$ stays in $bb(D)_3$, and $R r lt.eq 1 \/ 4$.
    The disks required for $I_j$ and all its descendants are consequently contained in $bb(D)_(5 s_j) \( x_j \)$:
    even the root margin has rescaled radius $2 R r$, and $\| y_m \| + 2 R r < 3 + 1 \/ 2 < 5$.
    Since $Q_j^p subset Q_0$, we have $\| x_j - x_(Q_0) \| lt.eq s_0 \/ sqrt(2)$ and $s_j lt.eq s_0$,
    so this disk lies in $bb(D)_(6 s_0) \( x_(Q_0) \) subset bb(D)_(2 R s_0) \( x_(Q_0) \)$,
    within the fixed coordinate patch. This also covers the larger disk margins required when regarding $I_j$ as
    the root of a subtree.
  Proposition 14 now gives a measurable subset of $I_j$ of area at least $\| I_j \| \/
    2$ on which every visited square from $I_j$ through the bottom has $N > L$.
    The extended grids align with the original root: a root edge differs from the corresponding parent edge by an
    integer multiple of $s_j$, and the extended parent grid has rescaled edges $- 1 \/ 2 + n A^(- m)$.
    Thus a fine grid square is either contained in $Q_0$ or has interior disjoint from it.
    In the latter case its points belong to no entry of the original tree.
    In the former case its descendants are exactly those of the original tree.
    From the level of $I_j$ onward there can be at most one entry along any of these paths,
    since two starts require an intervening value $N lt.eq L$.
    Before that level there are at most $m$ relevant levels below the tested entry.
    Thus the number of strictly finer entries is at most $m + 1$ on this subset.
  Finally, the subset lies in $20 A Q_j$: in parent units that dilated square has half-side $10$,
    whereas $y_m in bb(D)_3$ and the entry center lies in the unit parent square.
    Its area relative to the entry is at least
  $ frac(\| I_j \|, 2 \| Q_j \|) = 1 / 2 A^(2 - 2 m) > 0 . $
  Both this positive number and $m + 1$ are fixed independently of $j$.
    They eventually satisfy the tested requirements $delta_j = 1 \/ H_j$ and $J_j = ceil.l H_j ceil.r$,
    contradicting the choice of $Q_j$. This proves the proposition. ◻
]

=== 5.2 Packing with witnesses outside the squares <packing-with-witnesses-outside-the-squares>

The next geometric lemma converts the nearby regions just constructed into a bound on the sum of entry areas.
  We state it for an arbitrary finite family in a subdivision tree.

#thm([Lemma 5.4.])[
  (Packing from nearby witnesses).  #emph[Let $cal(F)$ be a finite family of squares in the $A$-adic subdivision
    tree of a square $Q_0$, where $A gt.eq 2$. Suppose there are fixed $D gt.eq 1$, $delta > 0$,
    and an integer $J gt.eq 0$ such that every $Q in cal(F)$ admits a measurable set $Y_Q subset D Q$ satisfying
$ \| Y_Q \| gt.eq delta \| Q \| \, wide \# { F in cal(F) : s \( F \) < s \( Q \) \, med y in F } lt.eq J quad
  upright("for almost every ") y in Y_Q . $

 Then
#[#set math.equation(numbering: n => "(5.5)")
 $ sum_(Q in cal(F)) \| Q \| lt.eq C \( A \, D \, delta \, J \) \| Q_0 \| . $ <eq:packing>]

]
] <lem:packing>

#proof[
  Ignore grid boundaries and the boundaries of the finitely many dilates $D Q$ with $Q in cal(F)$;
    these form a null set. Define
  $ n \( Q \) = 1 + \# { F in cal(F) : Q subset.neq F } . $
  Squares of a fixed rank $n$ have disjoint interiors. At each rank,
    process the squares in decreasing order of side length, retaining a square if its $D$-dilate has interior
    disjoint from the previously retained dilates. Let $cal(S)$ be the union of these selected families.
    Every discarded square $Q$ has its dilate meeting that of a selected square $P$ with $s \( P \) gt.eq
    s \( Q \)$; hence $Q subset \( 2 D + 1 \) P$. Covering the original disjoint squares at that rank by these
    larger dilates and then summing over ranks gives
  $ sum_(Q in cal(S)) \| Y_Q \| gt.eq delta sum_(Q in cal(S)) \| Q \| gt.eq alpha sum_(Q in cal(F)) \| Q \| \,
    wide alpha = frac(delta, \( 2 D + 1 \)^2) . $
  The selected witness sets at a single rank are disjoint up to null sets.
    It remains to control overlap between different ranks. For a point $y$ outside the ignored boundaries, put
  $ n_(upright("tot")) \( y \) = \# { F in cal(F) : y in F } . $
  If a witness point $y$ lies inside its square $Q$, every larger square containing $y$ is an ancestor of $Q$,
    so the witness assumption makes $n_(upright("tot")) \( y \)$ differ from $n \( Q \)$ by at most $J$.
    An exterior witness point can also disagree with the ancestry of $Q$ at larger scales.
    For $Q in cal(S)$ and $y in Y_Q$, let
  $ d_Q \( y \) = sum_(F in cal(F)\
s \( F \) > s \( Q \)) lr(|upright(bold(1))_F \( y \) - upright(bold(1))_({ Q subset F })|) $
  count the mismatches between membership of $y$ in a larger square and that square’s being an ancestor of $Q$.
    If $b$ is the number of larger squares in $cal(F)$ containing $y$, then
  $ \| n \( Q \) - 1 - b \| lt.eq d_Q \( y \) . $
  At most one square of side $s \( Q \)$ contains $y$, and the witness assumption bounds the number of smaller
    squares containing it by $J$. Decomposing $n_(upright("tot")) \( y \)$ into these three size ranges gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ \| n \( Q \) - n_(upright("tot")) \( y \) \| lt.eq d_Q \( y \) + J + 1 quad
     upright("for almost every ") y in Y_Q . $ <eq:rank-mismatch>]
  Thus a uniform bound for $d_Q \( y \)$ restricts the ranks that can contribute at $y$ to a fixed interval.
    We next show that the total witness area weighted by $d_Q$ is controlled:
  #[#set math.equation(numbering: n => "(5.7)")
   $ sum_(Q in cal(S)) integral_(Y_Q) d_Q \( y \) thin d y lt.eq B sum_(F in cal(F)) \| F \| \, $ <eq:mismatch>]
  where $B$ depends only on $A \, D$.
  Fix $F in cal(F)$ and a finer side length $t = A^(- ell) s \( F \)$, $ell gt.eq 1$. The grid is laminar:
    each square $Q$ of side $t$ is either contained in $F$ or interior-disjoint from it.
    If it can contribute a mismatch, a point of $D Q$ lies on the opposite side of $partial F$ from $Q$.
    It follows that the whole square $Q$ lies in the collar
  $ { x : "dist"_oo \( x \, partial F \) lt.eq \( D + 1 \) t } \, $
  where $"dist"_oo$ is distance for the maximum norm on $bb(R)^2$.
    Figure 1 shows the two possible directions of this mismatch near one face of $F$. This collar has area at most
  $ 8 \( D + 1 \) s \( F \) t + 4 \( D + 1 \)^2 t^2 . $
  All squares of side $t$, across all ranks, have disjoint interiors.
    Since $\| Y_Q \| lt.eq D^2 \| Q \|$, their total contribution for this fixed $F$ and $t$ is at most $D^2$
    times that collar area. Summing the geometric series over $ell gt.eq
    1$ and then summing over $F$ proves (5.7). For example, one may take
  $ B = D^2 (frac(8 \( D + 1 \), A - 1) + frac(4 \( D + 1 \)^2, A^2 - 1)) . $
  #figure(
    [(156,57) (35,54)(0,0)$Q subset F \, quad y in.not F$ (112,54)(0,0)$Q ∩ F = diameter \, quad y in F$ (3,13)(0,1)31 (67,13)(0,1)31 (80,13)(0,1)31 (144,13)(0,1)31 (35,13)(0,1)31 (112,13)(0,1)31 (35,47)(0,0)$partial F$ (112,47)(0,0)$partial F$ (11,42)(0,0)$F$ (88,42)(0,0)$F$ (16,13)(24,24) (108,13)(24,24) (20,40)(0,0)$D Q$ (128,40)(0,0)$D Q$ (24,21)(8,8)$Q$ (116,21)(8,8)$Q$ (38,25) (40,25)(0,0)\[l\]$y$ (110,25) (108,25)(0,0)\[r\]$y$ (24,18)(1,0)8 (32,18)(-1,0)8 (28,15)(0,0)$t$ (116,18)(1,0)8 (124,18)(-1,0)8 (120,15)(0,0)$t$ (35,9)(1,0)32 (67,9)(-1,0)32 (51,5)(0,0)$\( D + 1 \) t$ (112,9)(1,0)32 (144,9)(-1,0)32 (128,5)(0,0)$\( D + 1 \) t$],
    caption: [Figure 1: Ancestry and spatial membership can disagree in either direction. Each panel shows one witness point $y in Y_Q subset D Q$ and a fine square of side $t = s \( Q \)$ near a face of the larger square $F$. The dashed square is $D Q$; the pale lines mark the boundary of the collar of width $\( D + 1 \) t$ on each side of the face. ],
  ) <fig:boundary-mismatch>
  Choose an integer $M gt.eq 1$ with $M gt.eq 2 B \/ alpha$, and set $Z_Q = { y in Y_Q : d_Q \( y \) lt.eq M }$.
    Remove also the null sets where the witness assumption fails. Markov’s inequality and (5.7) give
  $ sum_(Q in cal(S)) \| Z_Q \| gt.eq alpha / 2 sum_(Q in cal(F)) \| Q \| . $
  For $y in Z_Q$, Equation (5.6) now gives
  $ \| n \( Q \) - n_(upright("tot")) \( y \) \| lt.eq M + J + 1 . $
  Only $2 \( M + J + 1 \) + 1$ ranks can therefore contribute at $y$.
    At a given rank the selected witness sets are disjoint, so this is also a bound on the total overlap of the $Z_Q$.
  For $D gt.eq 1$, the inclusions $Q subset Q_0$ imply $D Q subset D Q_0$.
    Integrating the overlap bound over this common region yields
  $ alpha / 2 sum_(Q in cal(F)) \| Q \| lt.eq #scale(x: 120%, y: 120%)[\(] 2 \( M + J + 1 \) +
    1 #scale(x: 120%, y: 120%)[\)] D^2 \| Q_0 \| . $
  This proves (5.5). ◻
]

Apply Lemma 18 to the family of entries, using Proposition 17 with $D = D_(*)$.
  We obtain a constant $C$ such that the sum of all entry areas is at most $C \| Q_0 \|$.

=== 5.3 The terminal mean growth <the-terminal-mean-growth>

#thm([Theorem 5.5.])[
  (Bounded mean growth).  #emph[For the finite trees considered in this section,
    let $cal(T)_(upright("term"))$ be the collection of terminal squares and let $s_(upright("term"))$ be their
    common side length. There is a constant $C$, independent of the eigenfunction and the number of levels, such that
#[#set math.equation(numbering: n => "(5.8)")
 $ "avg"_(q in cal(T)_(upright("term"))) N \( q \) lt.eq C \, wide
   "avg"_(q in cal(T)_(upright("term"))) E \( q \, 0 \) lt.eq C k s_(upright("term")) . $ <eq:mean-growth>]

]
] <thm:mean-growth>

#proof[
  Fix the threshold $H$ supplied by Proposition 17. A terminal path on which no excursion is active has terminal
    growth $N lt.eq H$. Every other terminal path has exactly one final active entry.
    For an entry $Q$, let $Omega_Q subset Q$ be the union of terminal squares on which that entry’s excursion is
    still active. These sets are disjoint as $Q$ varies.
  Starting separately at each entry $Q$, set $b_Q = 0$ and perform the descent of Lemma 11,
    stopping at the first square with $N lt.eq L$ or at the bottom, whichever comes first.
    Every continuing square has $N > L$, so the descent is available regardless of its current tilt.
    The low-growth stopping square, if any, is included as the last produced value;
    no further step is needed there. These separate choices of tilts do not affect excursion membership,
    which is defined entirely by the untilted quantity $N$.
  Along a random descendant path from $Q$, denote the stopping time by $T$ and the successive values by $m_i \,
    b_i$. Since $b_0 = 0$, (3.2) gives
  $ N_T lt.eq m_T + \( R + 1 \) \| b_T \| lt.eq m_T + \( R + 1 \) sum_(i < T) \| b_(i + 1) - b_i \| . $
  The uniform distribution on paths agrees with normalized planar area on $Q$. Lemma 12 and Lemma 16 therefore imply
  $ integral_(Omega_Q) N_(upright("term")) \( x \) thin d x & lt.eq \| Q \| thin bb(E)
    [m_T + \( R + 1 \) sum_(i < T) \| b_(i + 1) - b_i \|]\
 & lt.eq C \| Q \| #scale(x: 120%, y: 120%)[\(] N \( Q \) + 1 #scale(x: 120%, y: 120%)[\)] lt.eq C' \| Q \| . $
  Here $N_(upright("term"))$ is constant on each terminal square, with value $N$ of that square.
    The first inequality merely restricts a nonnegative integral to the paths still active at the bottom;
    it does not condition on that event or divide by its probability.
  Sum over all entries and use (5.5), then include the inactive terminal paths. This gives
  $ integral_(Q_0) N_(upright("term")) \( x \) thin d x lt.eq H \| Q_0 \| +
    C' sum_(Q upright(" entry")) \| Q \| lt.eq C \| Q_0 \| . $
  Equal terminal areas turn this integral bound into the first inequality of (5.8).
    The second follows because every terminal square has $K_q = k s_(upright("term"))$ and $E \( q \, 0 \) =
    K_q N \( q \)$. ◻
]

== 6 Nodal length at the wavelength scale <sec:length>

We first state the planar estimate that relates nodal length to growth. The disks in this section are Euclidean.

#thm([Theorem 6.1.])[
  (Roy-Fortin).  #emph[There are constants $epsilon_0 > 0$ and $C > 0$ with the following property.
    Let $F$ be a nonzero real solution of
$ Delta F + q F = 0 quad upright("on ") bb(D)_3 \, wide q in C^oo \( bb(D)_3 \) \, quad ∥q∥_oo < epsilon_0 . $

 If
$ beta = log ∥F∥_(L^oo \( bb(D)_(5 \/ 2) \)) / ∥F∥_(L^oo \( bb(D)_(1 \/ 4) \)) \, $

 then
$ cal(H)^1 \( Z_F ∩ bb(D)_(1 \/ 60) \) lt.eq C max { 1 \, beta } . $

]
] <thm:local-length>

This is [11] Theorem 2.1.1. The potential need not have a constant sign.
  We use the following consequence, keeping the norm and length scales explicit.

#thm([Lemma 6.2.])[
  (Nodal length from local $L^2$ growth).  #emph[Fix the coefficient bounds and coordinate neighborhood from
    Section 3. There is an $epsilon > 0$ such that, for every admissible square $I$ of side $s$ with $k s lt.eq
    epsilon$,
#[#set math.equation(numbering: n => "(6.1)")
 $ cal(H)^1 \( I ∩ Z_u \) lt.eq C s #scale(x: 120%, y: 120%)[\(] 1 +
   E \( I \, 0 \) #scale(x: 120%, y: 120%)[\)] . $ <eq:wavelength-length>]

 The constants are independent of $u$, $k$, and $s$.]
] <lem:wavelength-length>

#proof[
  Let $x_I$ be the center of $I$, and put
  $ F \( z \) = u \( x_I + 60 s z \) \, wide q \( z \) = \( 60 k s \)^2 p \( x_I + 60 s z \) . $
  The disk of physical radius $180 s$ is available because $R = 1000$.
    Choose $epsilon$ so small that $\( 60 epsilon \)^2 ∥p∥_oo <
    epsilon_0$ uniformly over the coordinate regions in use. Then $F$ satisfies Theorem 20.
  An interior $H^2$ estimate for $Delta F = - q F$, followed by the two-dimensional Sobolev embedding, gives
  $ ∥F∥_(L^oo \( bb(D)_(5 \/ 2) \)) lt.eq C ∥F∥_(L^2 \( bb(D)_(11 \/ 4) \)) . $
  Only the uniform bound on $q$ is needed here. On the smaller disk,
  $ ∥F∥_(L^2 \( bb(D)_(1 \/ 4) \)) lt.eq \| bb(D)_(1 \/ 4) \|^(1 \/ 2) ∥F∥_(L^oo \( bb(D)_(1 \/ 4) \)) . $
  Consequently
  $ beta lt.eq C + log ∥F∥_(L^2 \( bb(D)_(11 \/ 4) \)) / ∥F∥_(L^2 \( bb(D)_(1 \/ 4) \)) . $
  The same $L^2$ version of the local length bound is recorded directly in [12] Theorem 3.1.1.
  In physical coordinates the two norm radii are $165 s$ and $15 s$.
    Their common change-of-variables factor cancels, and nesting gives
  $ log ∥F∥_(L^2 \( bb(D)_(11 \/ 4) \)) / ∥F∥_(L^2 \( bb(D)_(1 \/ 4) \)) =
    log ∥u∥_(L^2 \( bb(D)_(165 s) \( x_I \) \)) / ∥u∥_(L^2 \( bb(D)_(15 s) \( x_I \) \)) lt.eq E \( I \, 0 \) . $
  All these norms are nonzero by Proposition 6. The length disk becomes $bb(D)_s \( x_I \)$ and contains the
    closed square $I$, whose corner distance is $s \/ sqrt(2)$. Hausdorff length scales by $60 s$.
    Theorem 20 therefore yields (6.1). ◻
]

#proof[
  Choose finitely many smooth isothermal neighborhoods and root squares $Q_0$ whose interiors cover $M$.
    Make their sides $s_0 lt.eq 1$ small enough that each closed disk of radius $2 R
    s_0$ about a root center is contained in its coordinate neighborhood.
    The conformal factors and their first derivatives have uniform bounds on the finitely many regions used below,
    and the conformal factors are bounded away from zero there.
    Proposition 6 gives a uniform initial bound $N \( Q_0 \) lt.eq C_(upright("init"))$.
  Choose the subdivision constants from Proposition 10, and then the small $epsilon$ of Lemma 21.
    Write $k_min = sqrt(lambda_1 \( M \, g \)) > 0$. A single permissible lower scale bound for all roots is
  $ a_0 = min {epsilon / A \, thin k_min min_(Q_0) s \( Q_0 \)} > 0 . $
  Now fix the descent and persistence constants with this $a_0$.
    This order of choices makes every constant depend only on the fixed metric and cover.
  For a given eigenfunction, subdivide each root to the first level at which $k s lt.eq epsilon$,
    where $s$ is that level’s common side. If this level is below the root, its parent has $k A s > epsilon$,
    so $k s > epsilon \/ A$. If it is the root, then $k s gt.eq k_min s_0$.
    In both cases, every visited square satisfies $K_Q gt.eq a_0$. Theorem 19 therefore gives
  $ "avg"_(I upright(" terminal in ") Q_0) E \( I \, 0 \) lt.eq C k s . $
  There are $\( s_0 \/ s \)^2$ terminal squares. Applying Lemma 21 and summing their lengths yields
  $ cal(H)^1 \( Q_0 ∩ Z_u \) & lt.eq C s (s_0 / s)^2 \( 1 + C k s \)\
 & lt.eq C s_0^2 \( 1 \/ s + k \) lt.eq C s_0^2 \( a_0^(- 1) + 1 \) k . $
  Subadditivity suffices even if a nodal arc lies on a grid edge.
  On each convex coordinate square, the inverse coordinate map is Lipschitz into $\( M \, d_g \)$ with constant at
    most $sqrt(sup p)$: the coordinate line segment is an admissible path for the Riemannian distance.
    Hence the preceding Euclidean Hausdorff-length bound gives the same bound for $cal(H)_g^1$ up to a fixed
    factor. Sum over the finite root cover to obtain $cal(H)_g^1 \( Z_u \) lt.eq C \( M \, g \) k$.
    The coordinate choices and all constants were independent of the eigenfunction and of its eigenspace.
    Since $k = sqrt(lambda)$, this proves the theorem. ◻
]

#heading(level: 1)[References]
#bibitem([1])[J.~Brüning, #emph[Über Knoten von Eigenfunktionen des Laplace--Beltrami-Operators], Math. Z.
  #strong[158] (1978), no.~1, 15--21. #link("https://doi.org/10.1007/BF01214561")[doi:10.1007/BF01214561].]
#bibitem([2])[D.~M.~DeTurck and J.~L.~Kazdan, #emph[Some regularity theorems in Riemannian geometry], Ann. Sci.
  École Norm. Sup. (4) #strong[14] (1981), no.~3, 249--260.
  #link("https://doi.org/10.24033/asens.1405")[doi:10.24033/asens.1405].]
#bibitem([3])[H.~Donnelly and C.~Fefferman, #emph[Nodal sets of eigenfunctions on Riemannian manifolds], Invent.
  Math. #strong[93] (1988), no.~1, 161--183. #link("https://doi.org/10.1007/BF01393691")[doi:10.1007/BF01393691].]
#bibitem([4])[H.~Donnelly and C.~Fefferman, #emph[Nodal sets for eigenfunctions of the Laplacian on surfaces], J.
  Amer. Math. Soc. #strong[3] (1990), no.~2, 333--353.
  #link("https://doi.org/10.1090/S0894-0347-1990-1035413-2")[doi:10.1090/S0894-0347-1990-1035413-2].]
#bibitem([5])[R.-T.~Dong, #emph[Nodal sets of eigenfunctions on Riemann surfaces], J. Differential Geom.
  #strong[36] (1992), no.~2, 493--506. #link("https://doi.org/10.4310/JDG/1214448750")[doi:10.4310/JDG/1214448750].]
#bibitem([6])[C.~Imbert and L.~Silvestre, #emph[$C^(1 \, alpha)$ regularity of solutions of some degenerate fully
  non-linear elliptic equations], Adv. Math. #strong[233] (2013), 196--206.
  #link("https://doi.org/10.1016/j.aim.2012.07.033")[doi:10.1016/j.aim.2012.07.033].
  The numbering cited here is that of #link("https://arxiv.org/abs/1201.3739v1")[arXiv:1201.3739v1].]
#bibitem([7])[A.~Logunov, #emph[Nodal sets of Laplace eigenfunctions:
  proof of Nadirashvili's conjecture and of the lower bound in Yau's conjecture], Ann. of Math.
  (2) #strong[187] (2018), no.~1, 241--262.
  #link("https://doi.org/10.4007/annals.2018.187.1.5")[doi:10.4007/annals.2018.187.1.5].]
#bibitem([8])[A.~Logunov and E.~Malinnikova, #emph[Nodal sets of Laplace eigenfunctions:
  estimates of the Hausdorff measure in dimensions two and three], in #emph[50 Years with Hardy Spaces],
  A.~Baranov, S.~Kisliakov, and N.~Nikolski (eds.), Operator Theory:
  Advances and Applications, vol.~261, Birkhäuser, Cham, 2018, pp.~333--344.
  #link("https://doi.org/10.1007/978-3-319-59078-3_17")[doi:10.1007/978-3-319-59078-3\_17].]
#bibitem([9])[F.~Nazarov, L.~Polterovich, and M.~Sodin, #emph[Sign and area in nodal geometry of Laplace
  eigenfunctions], Amer. J. Math. #strong[127] (2005), no.~4, 879--910.
  #link("https://doi.org/10.1353/ajm.2005.0030")[doi:10.1353/ajm.2005.0030].]
#bibitem([10])[T.~Ransford, #emph[Potential Theory in the Complex Plane],
  London Mathematical Society Student Texts, vol.~28, Cambridge University Press, Cambridge, 1995.]
#bibitem([11])[G.~Roy-Fortin, #emph[Nodal sets and growth exponents of Laplace eigenfunctions on surfaces], Anal.
  PDE #strong[8] (2015), no.~1, 223--255.
  #link("https://doi.org/10.2140/apde.2015.8.223")[doi:10.2140/apde.2015.8.223].]
#bibitem([12])[G.~Roy-Fortin, #emph[Average $L^q$ growth and nodal sets of eigenfunctions of the Laplacian on
  surfaces], preprint, 2015. #link("https://arxiv.org/abs/1510.02376")[arXiv:1510.02376].]
#bibitem([13])[S.-T.~Yau, #emph[Problem section], in #emph[Seminar on Differential Geometry], S.-T.~Yau (ed.),
  Annals of Mathematics Studies, vol.~102, Princeton University Press, Princeton, NJ, 1982, pp.~669--706.]
