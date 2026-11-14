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

#align(center)[#text(size: 16pt, weight: "bold")[Uniform Interior $C^(1 \, alpha)$ Estimates \
for Infinity-Harmonic Functions]]
#align(center)[OpenAI]
#align(center)[October 4, 2026]

== 1 Introduction <sec:introduction>

The infinity Laplace equation is associated with minimizing the largest local Lipschitz constant.
  For a smooth real function on an open subset of $bb(R)^d$, its unnormalized operator is

$ Delta_oo u = chevron.l D^2 u thin nabla u \, nabla u chevron.r = sum_(i \, j = 1)^d u_i u_j u_(i j) . $

Only the second derivative in the gradient direction enters the equation.
  This degeneracy makes control of the full gradient a central issue even far from the boundary.
  We prove a uniform interior Hölder estimate for the gradient,
  with a positive exponent depending only on the dimension.

=== 1.1 The result <the-result>

All balls are Euclidean; $B_r$ denotes the ball centered at the origin unless a center is specified.
  A continuous function $u$ on an open set $Omega$ is #emph[infinity-harmonic] if every local upper $C^2$ test
  $phi.alt$ at $z in Omega$ satisfies $Delta_oo phi.alt \( z \) gt.eq 0$,
  and every local lower test satisfies $Delta_oo phi.alt \( z \) lt.eq 0$.
  All tests are included, also when $nabla phi.alt \( z \) = 0$.
  Write $"osc"_E u = sup_E u - inf_E u$, and for a vector field $g$ set

$ \[ g \]_(C^(0 \, alpha) \( E \)) = sup_(x \, y in E\
x eq.not y) frac(\| g \( x \) - g \( y \) \|, \| x - y \|^alpha) . $

#thm([Theorem 1.1.])[
  (Uniform interior estimate).  #emph[For every integer $d gt.eq
    3$ there are constants $alpha_d in \( 0 \, 1 \/ 3 \]$ and $C_d <
    oo$ such that every bounded infinity-harmonic function $u in C \( B_1 \)$, where $B_1 subset bb(R)^d$,
    belongs to $C^(1 \, alpha_d) \( B_(1 \/ 2) \)$ and satisfies
$ parallel nabla u parallel_(L^oo \( B_(1 \/ 2) \)) + \[ nabla u \]_(C^(0 \, alpha_d) \( B_(1 \/ 2) \)) lt.eq
  C_d "osc"_(B_1) u . $

]
] <thm:main>

The exponent arises from a compactness argument and is not explicit.
  The qualitative interior regularity statement follows on any open domain.

#thm([Corollary 1.2.])[
  (Interior $C^1$ regularity).  #emph[Let $d gt.eq 3$, let $Omega subset.eq
    bb(R)^d$ be a nonempty connected open set, and let $u in C \( Omega \)$ be infinity-harmonic.
    Then $u in C_(upright("loc"))^1 \( Omega \)$.]
] <cor:interior-c1>

#proof[
  For each $x_0 in Omega$, choose $r > 0$ with $overline(B)_(2 r) \( x_0 \) subset Omega$.
    Continuity bounds $u$ on this closed ball, and $y mapsto u \( x_0 + 2 r y \)$ is infinity-harmonic on $B_1$.
    Theorem 1 applies and gives the conclusion near $x_0$. ◻
]

More precisely, the same change of variables gives

$ parallel nabla u parallel_(L^oo \( B_r \( x_0 \) \)) +
  r^(alpha_d) \[ nabla u \]_(C^(0 \, alpha_d) \( B_r \( x_0 \) \)) lt.eq C_d / r "osc"_(B_(2 r) \( x_0 \)) u \, $

after enlarging $C_d$ if necessary.

=== 1.2 Context and methods <context-and-methods>

Aronsson’s work on absolute minimization connects the infinity Laplace equation with a local version of the
  optimal Lipschitz extension problem [3]. A locally Lipschitz function $u$ is an absolute minimizer if,
  for every open $V subset.double Omega$ and every Lipschitz competitor $w$ with $w = u$ on $partial V$,

$ parallel D u parallel_(L^oo \( V \)) lt.eq parallel D w parallel_(L^oo \( V \)) . $

Aronsson identified the equation for smooth absolute minimizers.
  Jensen established its viscosity characterization and uniqueness for the Dirichlet problem [11].
  Crandall, Evans, and Gariepy developed the equivalent comparison-with-cones formulation and the associated local
  slope estimates [7]. These results supply a robust theory of continuous solutions,
  while regularity beyond local Lipschitz continuity presents a separate difficulty:
  the equation controls second derivatives only in the gradient direction.

The first-order regularity theory separates affine approximation from uniqueness and continuity of the
  approximating slope. Building on the cone and slope framework of Crandall, Evans, and Gariepy,
  Crandall and Evans proved that infinitesimal blow-ups at a fixed point are affine [7,6].
  Savin proved continuity of the gradient in the plane [14],
  and Evans and Savin obtained planar interior $C^(1 \, alpha)$ estimates for some positive universal exponent
  [9]. Evans and Smart subsequently proved differentiability at every point in every dimension [10].
  Their conclusion identifies a unique derivative at each point;
  continuity of that derivative is a further assertion. For a significant higher-dimensional special class, Peng,
  Zhang, and Zhou proved interior $C^1$ regularity and nonvanishing of the gradient for infinity-harmonic
  potentials in convex rings [12].

The planar endpoint has also been the subject of recent work.
  Brustad’s June 2026 preprint proves local $1 \/ 3$-Hölder continuity of the gradient under the additional
  assumptions that it never vanishes and has a Lipschitz inverse [5] Theorem 1.1.
  Xu’s July 2026 preprint states the unrestricted planar $C_(upright("loc"))^(1 \, 1 \/ 3)$ theorem [15]
  Theorem 1.1; it separately leaves open a universal endpoint norm estimate [15] Remark 1.5(i).
  The theorem proved here concerns uniform interior estimates for arbitrary solutions in dimensions $d gt.eq 3$.

The restriction to an exponent at most $1 \/ 3$ is natural. Aronsson’s example [4]

$ u \( x \) = \| x_1 \|^(4 \/ 3) - \| x_2 \|^(4 \/ 3) \, wide x in bb(R)^d \, $

is infinity-harmonic and has $\| D u \( h e_1 \) - D u \( 0 \) \| = 4 / 3 \| h \|^(1 \/ 3)$.
  It therefore rules out any exponent greater than $1 \/ 3$, in every dimension $d gt.eq 2$.
  Our compactness argument produces a positive exponent depending on the dimension and does not identify the
  endpoint value.

=== 1.3 Proof strategy <proof-strategy>

The proof has two parts. First we reduce failure of a uniform power rate for affine approximation to an entire
  nonaffine solution of a limiting equation. Then we prove that the estimates inherited by that limit force it to
  be affine.

Normalize the original solutions to have oscillation at most one and adjoin a linear coordinate, $U \( y \, b \) =
  u \( y \) + b$. This preserves the equation and ensures that accurate affine fits have nonzero slopes.
  A three-point estimate controls the midpoint defect of a function close to an affine function,
  divided by the endpoint separation, uniformly even at much smaller separations.
  Combined with fixed-center affine blow-ups, it gives affine approximation with error $o \( r \)$ uniformly
  across normalized solutions and interior centers. This small-scale uniformity is essential:
  compactness of the solutions alone would not give a common rate for their derivatives.

We measure finer approximation on cylinders with axial radius $r$ and transverse radius $sqrt(lambda) r$,
  allowing error $lambda r$ from an affine function whose slope points along the axis.
  A power rate of decay for the worst fitting parameter makes consecutive slopes converge at a uniform power rate,
  giving the gradient estimate. If every power bound fails,
  a selection of almost-maximal normalized errors provides scales with two properties:
  one fitting parameter fails at the selected center, but a fixed multiple of it succeeds at every nearby center
  and every fixed multiple of that scale. Those fits provide compactness after stretching the transverse variables
  and magnifying the deviation from the central affine fit.

The entire limit $v \( x \, t \)$, with $x in bb(R)^d$ and $t in bb(R)$, satisfies

$ F \[ v \] := D^2 v \[ \( nabla_x v \, 1 \) \] = 0 \, wide D^2 v \[ xi \] = xi^(sans(T)) D^2 v thin xi . $

At every center $\( x \, t \)$ and radius $R > 0$ it admits coefficients $p in bb(R)^d$ and $q in bb(R)$ such that

$ \| v \( x + h \, t + ell \) - v \( x \, t \) - p dot.op h - q ell \| lt.eq C_0 R quad
  upright("if ") \| ell \| lt.eq R \, quad \| h - p ell \| lt.eq R \, $

with one finite constant $C_0$. The horizontal slope determines the shear of the fitting box.
  Our Liouville Theorem states that every entire solution with these fits is affine.
  An affine limit would improve the selected failed fit, proving the desired power bound.

The anisotropic scaling and the limiting equation are due to Evans and Savin [9] Sections 2.3–2.4.
  Their argument derives gradient Hölder regularity from quantitative flatness estimates in thin cylinders;
  the estimates required for that argument are established in their paper in dimension two.
  Quadratic comparisons on horizontal slices and monotone forward and backward slopes also appear in their
  analysis [9] Section 3. Here uniform affine approximation, comparison of intersecting cylinders,
  and a Liouville theorem for an entire class with affine fits at every center and scale provide the compactness
  argument. The Liouville proof combines an extremal horizontal averaging defect,
  preservation of the subsolution inequality by its variance-penalized envelope,
  and localization of contacts at arbitrarily small times around a common terminal point.

For the Liouville argument, introduce, for $ell > 0$, the quadratic envelopes

$ cal(P)_ell v \( x \, t \) & = sup_y {v \( y \, t + ell \) - frac(\| y - x \|^2, 2 ell)} \,\
cal(M)_ell v \( x \, t \) & = inf_y {v \( y \, t - ell \) + frac(\| y - x \|^2, 2 ell)} . $

The fits give subquadratic spatial growth, so the extrema are attained.
  The quotients $\( cal(P)_ell v - v \) \/ ell$ and $\( v - cal(M)_ell v \) \/
  ell$ are nondecreasing in $ell$ and have a common small-length limit at each point.
  If both quotients were constant in length at one point, quadratic comparison would force $v$ to be affine.
  We seek such a limit while retaining an obstruction to affinity.

That obstruction is a horizontal Jensen defect: the excess of a weighted average of values over the value at their
  spatial mean. Starting from one nonaffine solution, we recenter and rescale configurations for which the ratio
  of the defect to the root mean square distance from the mean approaches its supremum.
  Compactness then gives an extremal solution. For $t > 0$,
  take the supremum of these averages at time $t$ and a fixed spatial mean,
  after subtracting their variance divided by $2 t$. The extremal ratio bounds the resulting barycentric
  envelope’s excess over $v$ by a fixed multiple of time, with equality at a selected point.
  Subtracting that linear function of time produces a subsolution $W lt.eq v$ touching $v$ at positive time;
  the unshifted envelope has a strictly positive gap there.
  The variance penalty is affine along the directions in the viscosity test,
  which makes the subsolution inequality survive this averaging.

Forward optimizers for $W$ and backward optimizers for $v$ define two possible steps from each space-time point.
  A fair choice between them gives a drift inequality controlling the expected sum of squared discrepancies of
  their velocities from a common reference velocity. This control is unchanged by a fitted change of frame.
  It yields contacts at decreasing positive times, with one terminal point remaining in a bounded part of
  infinitely many fitted frames. The common small-length envelope slope at that point is finite.
  After normalization at these shrinking contact scales, every fixed envelope length corresponds to a length
  tending to zero at the same terminal point. Differences of the normalized slopes cancel the affine correction
  and tend to zero. A further limit therefore has constant envelope slopes at every length,
  yet retains the positive barycentric gap. Rigidity gives the contradiction.

Section 2 proves the lift, slope, and three-point estimates.
  Section 3 proves Theorem 1 from the Liouville Theorem. Sections 4 and 5 construct the envelopes and extremal
  contact. Sections 6 and 7 propagate and localize that contact.
  Section 8 proves rigidity and completes the Liouville argument.

Throughout, equations with positive second-order sign use the same viscosity convention as $Delta_oo$:
  subsolutions satisfy the nonnegative inequality at upper tests,
  and supersolutions the nonpositive inequality at lower tests.
  Tests for equations in $\( x \, t \)$ involve all variables together.
  For a symmetric matrix $A$, we write $A \[ xi \] = xi^(sans(T)) A xi$.

== 2 Uniform local flatness <sec:flatness>

This section proves the local estimates used to obtain uniform affine approximation in Section 3.
  The decisive estimate controls midpoint defects at every separation,
  including separations much smaller than the scale on which a function is known to be close to an affine function.

=== 2.1 A linear lift and affine blow-ups <a-linear-lift-and-affine-blow-ups>

#thm([Lemma 2.1.])[
  #emph[If $u$ is infinity-harmonic in $Omega subset.eq bb(R)^d$, then
$ U \( y \, b \) = u \( y \) + b $

 is infinity-harmonic in $Omega times bb(R)$.]
] <lem:linear-lift>

#proof[
  Suppose that $phi.alt$ touches $U$ from above at $\( y_0 \, b_0 \)$.
    Restriction to the vertical line gives $phi.alt_b \( y_0 \, b_0 \) = 1$.
    Put $p = nabla_y phi.alt \( y_0 \, b_0 \)$. If $p eq.not 0$,
    choose an affine function $ell$ with $ell \( y_0 \) = b_0$ and $nabla ell dot.op p = 1$. The function
  $ psi \( y \) = phi.alt \( y \, ell \( y \) \) - ell \( y \) $
  touches $u$ from above at $y_0$. At that point $nabla psi = p$, because $phi.alt_b = 1$, and
  $ D^2 psi \[ p \] = phi.alt_(y y) \[ p \] + 2 phi.alt_(y b) dot.op p + phi.alt_(b b) =
    D^2 phi.alt \[ \( p \, 1 \) \] = Delta_oo phi.alt . $
  The viscosity inequality for $u$ gives the required sign.
    If $p = 0$, the vertical upper contact gives $phi.alt_(b b) gt.eq 0$,
    and this is $Delta_oo phi.alt$ because $nabla phi.alt = \( 0 \, 1 \)$.
    Lower tests are identical with the inequalities reversed. ◻
]

We recall the cone comparison and slope estimates of Crandall, Evans, and Gariepy [7].
  These give local Lipschitz regularity and the information about blow-ups used here.
  For an infinity-harmonic function $w$ on an open set $D subset.eq bb(R)^n$, define,
  whenever $overline(B)_r \( z \) subset D$,

$ L_r^plus.minus \( w \; z \) = 1 / r max_(\| h \| lt.eq r) { plus.minus \( w \( z + h \) - w \( z \) \)
  #scale(x: 120%, y: 120%)[}] . $

#thm([Lemma 2.2.])[
  #emph[The function $w$ is locally Lipschitz. For a fixed center $z$,
    both $L_r^(+) \( w \; z \)$ and $L_r^(-) \( w \; z \)$ are nondecreasing in $r$.
    For each fixed allowable radius, they are continuous as functions of the center.]
] <lem:cone-slopes>

#proof[
  Fix $overline(B)_r \( z \) subset D$ and $L > L_r^(+) \( w \; z \)$. Choose $gamma > 0$ so small that
  $ gamma r < L - L_r^(+) \( w \; z \) \, wide 2 gamma r < L . $
  On $partial B_r \( z \)$ the function $w$ lies strictly below
  $ w \( z \) + L \| Z - z \| - gamma \| Z - z \|^2 . $
  It lies below this function throughout the ball. Otherwise the positive maximum of their difference is attained
    at an interior point different from $z$, and the displayed function, shifted by a constant,
    is an upper test there. Writing $rho = \| Z - z \|$, its infinity Laplacian is
  $ - 2 gamma \( L - 2 gamma rho \)^2 < 0 \, $
  contrary to the viscosity inequality. Letting $gamma arrow.b 0$ and then $L arrow.b L_r^(+) \( w \; z \)$ gives
  $ w \( Z \) - w \( z \) lt.eq L_r^(+) \( w \; z \) \| Z - z \| wide \( Z in overline(B)_r \( z \) \) . $
  Applying the same argument to $- w$ gives the lower bound with $L_r^(-) \( w \; z \)$.
    These bounds prove monotonicity in the radius.
  For centers in a compact neighborhood, choose one small radius whose balls remain in $D$.
    The two slopes at that radius are uniformly bounded by the oscillation on a larger compact set divided by the
    radius. The preceding inequalities then give a common local Lipschitz bound.
    Continuity in the center at fixed radius follows from uniform continuity of $w$ on a compact neighborhood,
    taking the maximum over the fixed set ${ \| h \| lt.eq r }$. ◻
]

For the following fixed-center affine blow-up result, see Crandall, Evans,
  and Gariepy [7] and Crandall and Evans [6] pp. 124–127; we include a variant of the latter cone-slope argument.

#thm([Proposition 2.3.])[
  (Affine blow-ups at a fixed center).  #emph[Let $w$ be infinity-harmonic in $D$ and let $z in D$.
    Every locally uniform limit, along a sequence $r_i arrow.b 0$, of
$ V_i \( Y \) = frac(w \( z + r_i Y \) - w \( z \), r_i) $

 is a linear function on $bb(R)^n$. Such limits exist after passage to subsequences.]
] <prop:affine-blowups>

#proof[
  The local Lipschitz bound and the exhaustion of $bb(R)^n$ by the rescaled domains give subsequential convergence
    on compact sets. By Lemma 4, the finite limits
  $ L_(*)^plus.minus = lim_(r arrow.b 0) L_r^plus.minus \( w \; z \) $
  exist. They are equal. Indeed, if $h_r$ attains the positive maximum, then for each fixed small $R > r$,
    once $r$ is sufficiently small,
  $ L_r^(+) \( w \; z \) lt.eq L_r^(-) \( w \; z + h_r \) lt.eq L_R^(-) \( w \; z + h_r \) . $
  First let $r arrow.b 0$, using continuity at fixed $R$ and $\| h_r \| lt.eq r$, and then let $R arrow.b 0$.
    This gives $L_(*)^(+) lt.eq L_(*)^(-)$. Reversing signs gives equality; write the common value as $L_(*)$.
  Let $V$ be a limit. Uniform convergence on balls shows that
  $ L_R^(+) \( V \; 0 \) = L_R^(-) \( V \; 0 \) = L_(*) wide \( R > 0 \) \, $
  and that the slopes at every other center retain monotonicity in their radius.
    In particular $\| V \( Y \) \| lt.eq L_(*) \| Y \|$. For any center $q$,
  $ L_T^plus.minus \( V \; q \) lt.eq frac(L_(*) \( T + \| q \| \) + \| V \( q \) \|, T) . $
  For a fixed radius at $q$, bound its slope by the slope at $T$ and send $T arrow.r oo$.
    Thus every slope of $V$ is at most $L_(*)$, so $V$ is globally $L_(*)$-Lipschitz.
  If $L_(*) = 0$, then $V = 0$. Otherwise let $x_R$ and $y_S$ attain the positive and negative extrema on the
    balls of radii $R$ and $S$ centered at zero. The equality of the origin slopes gives
  $ L_(*) \( R + S \) = V \( x_R \) - V \( y_S \) lt.eq L_(*) \| x_R - y_S \| lt.eq L_(*) \( R + S \) . $
  Equality throughout forces $\| x_R \| = R$, $\| y_S \| = S$,
    and these points to lie on opposite rays of one line. Comparing all choices of $R \,
    S$ gives a unit vector $e$ such that $V \( t e \) = L_(*) t$ for every real $t$. The Lipschitz bound then yields
  $ L_(*) t - L_(*) \| Y - t e \| lt.eq V \( Y \) lt.eq L_(*) t + L_(*) \| Y - t e \| . $
  Letting $t arrow.r + oo$ in the lower bound and $t arrow.r - oo$ in the upper bound gives $V \( Y \) =
    L_(*) e dot.op Y$. ◻
]

This argument establishes the linearity of each blow-up without requiring uniqueness of its slope.
  The stronger everywhere differentiability theorem is due to Evans and Smart [10].

=== 2.2 The three-point estimate <the-three-point-estimate>

We use one standard viscosity tool. For a continuous function $g$,
  its second-order superjet $J^(2 \, +) g \( z \)$ consists of pairs $\( p \, X \)$ for which

$ g \( z + h \) lt.eq g \( z \) + p dot.op h + 1 / 2 X \[ h \] + o \( \| h \|^2 \) . $

The closed superjet $overline(J)^(2 \, +) g \( z \)$ consists of limits of such jets at points approaching $z$,
  with the function values also converging. For the continuous operators used here,
  the viscosity inequality at upper tests applies to closed superjets as well.

#thm([Lemma 2.4.])[
  (Theorem of sums, [8] Theorem 3.2).  #emph[Let $g_j$ be continuous on open subsets of Euclidean spaces.
    Suppose that $sum_(j = 1)^N g_j \( z_j \) - Psi \( z_1 \, dots.h \, z_N \)$ has a local maximum at an interior
    product point, where $Psi$ is $C^2$ near that point. Set $A = D^2 Psi$.
    For every $eta > 0$ there are symmetric matrices $X_j$ such that
$ \( D_j Psi \, X_j \) in overline(J)^(2 \, +) g_j \( z_j \) \, wide "diag" \( X_1 \, dots.h \, X_N \) lt.eq A +
  eta A^2 . $

]
] <lem:sum-rule>

#thm([Proposition 2.5.])[
  (Three-point flatness).  #emph[Let $U_i$ be infinity-harmonic on $B_1 subset
    bb(R)^n$ with a common Lipschitz bound, and let $ell_i$ be affine functions such that
$ parallel U_i - ell_i parallel_(L^oo \( B_1 \)) arrow.r 0 . $

 Then
#[#set math.equation(numbering: n => "(2.1)")
 $ sup_(x \, y in B_(1 \/ 4)\
x eq.not y) frac(\| U_i \( x \) + U_i \( y \) - 2 U_i \( \( x + y \) \/ 2 \) \|, \| x - y \|) arrow.r
  0 . $ <eq:three-point>]

]
] <prop:three-point>

#proof[
  Put $w_i = U_i - ell_i$ and $epsilon_i = parallel w_i parallel_(L^oo \( B_1 \))$.
    The slopes of $ell_i$ are bounded: evaluating at $e \/ 2$ and $-
    e \/ 2$ for every unit vector $e$ gives $\| nabla ell_i dot.op e \| lt.eq "Lip" \( U_i \) + 2 epsilon_i$.
    Thus $w_i$ have a common Lipschitz bound $C$.
  Suppose that (2.1) fails. Passing to a subsequence and replacing $U_i \, ell_i$ by their negatives if necessary,
    there are endpoint pairs in $B_(1 \/ 4)$ with positive midpoint defect greater than $delta \| x -
    y \|$ for some fixed $delta > 0$. For triples $x \, y \, z in overline(B)_(3 \/ 4)$ with $x eq.not y$, write
  $ c = frac(x + y, 2) \, wide h = z - c \, wide r = \| x - y \| \, wide f \( r \) = r - 1 / 8 r^(3 \/ 2) . $
  Here $0 < r lt.eq 3 \/ 2$, so $nu r lt.eq f \( r \) lt.eq r$ with $nu = 1 - sqrt(3 \/ 2) \/ 8 > 0$.
    Choose a smooth function $B \( c \)$ that equals $delta \/ 2$ on $overline(B)_(1 \/ 4)$,
    is at least $delta \/ 2$ everywhere, and equals a sufficiently large constant $B_(upright("out"))$ when $\|
    c \| gt.eq 1 \/ 2$. Consider
  #[#set math.equation(numbering: n => "(2.2)")
   $ w_i \( x \) + w_i \( y \) - 2 w_i \( z \) - B \( c \) f \( r \) -
     frac(\| h \|^2, r^2) . $ <eq:three-point-maximum>]
  Allowing the third point to move permits the use of Lemma 6,
    while the quadratic penalty keeps it close to the midpoint.
    The factor $B \( c \)$ localizes the maximum, and the concavity of $f$ will supply the dominant negative
    second variation. The violating pair with $z = c$ makes this expression positive. On the other hand it is at most
  $ C r + 2 C \| h \| - B \( c \) f \( r \) - frac(\| h \|^2, r^2) lt.eq C r + C^2 r^2 - B \( c \) f \( r \) . $
  Its upper limit as $r arrow.b 0$ is therefore at most zero, uniformly in the other variables.
    A positive maximum is attained at some triple with $r > 0$.
  At these maximizing triples, $r arrow.r 0$ as $i arrow.r oo$:
    positivity and $B f gt.eq delta nu r \/ 2$ give $r lt.eq 8 epsilon_i \/ \( delta nu \)$.
    Comparing the maximizing value with the admissible choice $z = c$ also gives
  $ frac(\| h \|^2, r^2) lt.eq 2 #scale(x: 120%, y: 120%)[\(] w_i \( c \) -
    w_i \( z \) #scale(x: 120%, y: 120%)[\)] lt.eq 2 C \| h \| \, wide \| h \| lt.eq 2 C r^2 . $
  Choose $B_(upright("out")) > \( C + 3 / 2 C^2 \) \/ nu$. The preceding upper bound for (2.2) is then nonpositive
    when $\| c \| gt.eq 1 \/ 2$. Hence $\| c \| < 1 \/ 2$ at a positive maximum.
    Since $r arrow.r 0$ and $h = O \( r^2 \)$, the maximizing triples are interior to $\( B_(3 \/ 4) \)^3$ for all
    large $i$.
  At one such triple set $q = nabla ell_i$ and $e = \( x - y \) \/ r$.
    Apply Lemma 6 to the functions $U_i \, U_i \, - 2 U_i$ and the test
  $ Psi = ell_i \( x \) + ell_i \( y \) - 2 ell_i \( z \) + B \( c \) f \( r \) + frac(\| h \|^2, r^2) . $
  This test is $C^2$ near the triple. Define $p_1 = D_x Psi$, $p_2 = D_y Psi$, and $p_0 = - D_z Psi \/ 2$.
    Direct differentiation gives
  $ p_1 & = q + 1 / 2 f \( r \) D B \( c \) - h \/ r^2 + a e \,\
p_2 & = q + 1 / 2 f \( r \) D B \( c \) - h \/ r^2 - a e \,\
p_0 & = q - h \/ r^2 \, wide a = B \( c \) f' \( r \) - 2 \| h \|^2 \/ r^3 . $
  These vectors and $a$ are bounded. Since $f' \( r \) = 1 - 3 sqrt(r) \/ 16$ and $\| h \| = O \( r^2 \)$,
    we also have $a gt.eq delta \/ 4$ for all sufficiently large $i$.
  Let $sigma = \( p_1 \, p_2 \, p_0 \)$. The third jet supplied by Lemma 6 has gradient $- 2 p_0$.
    The function $- 2 U_i$ is infinity-harmonic, so the viscosity inequalities for the three superjets give
  $ X_1 \[ p_1 \] gt.eq 0 \, wide X_2 \[ p_2 \] gt.eq 0 \, wide X_3 \[ - 2 p_0 \] gt.eq 0 . $
  In particular $X_3 \[ p_0 \] gt.eq 0$. If $A = D^2 Psi$ at the maximum,
    the matrix inequality evaluated at $sigma$ gives
  $ 0 lt.eq "diag" \( X_1 \, X_2 \, X_3 \) \[ sigma \] lt.eq A \[ sigma \] + eta \| A sigma \|^2 . $
  The maximum, $A$, and $sigma$ are fixed while $eta arrow.b 0$, although the jets may vary.
    It follows that $A \[ sigma \] gt.eq 0$.
  We compute the same quadratic form by moving $\( x \, y \, z \)$ along the straight line with velocity $sigma$
    and parameter $tau$, with $tau = 0$ at the maximum. The endpoint relative velocity $p_1 - p_2 =
    2 a e$ is parallel to $x - y$, and the third velocity differs from the mean endpoint velocity by $O \( r \)$.
    Write $c \( tau \) \, h \( tau \) \, r \( tau \)$ for the induced quantities,
    and use dots for their derivatives at zero. The formulas above give
  $ dot(r) = 2 a \, wide dot.double(r) = 0 \, wide dot(c) = 1 / 2 \( p_1 + p_2 \) = O \( 1 \) \, wide dot(h) =
    p_0 - dot(c) = - 1 / 2 f \( r \) D B \( c \) = O \( r \) . $
  Since $h = O \( r^2 \)$,
  $ frac(d^2, d tau^2) frac(\| h \( tau \) \|^2, r \( tau \)^2)\|_(tau = 0) = frac(2 \| dot(h) \|^2, r^2) -
    frac(8 dot(r) thin h dot.op dot(h), r^3) + frac(6 dot(r)^(thin 2) \| h \|^2, r^4) = O \( 1 \) . $
  Also $f'' \( r \) = - 3 \/ \( 32 sqrt(r) \)$, and therefore
  $ frac(d^2, d tau^2) #scale(x: 120%, y: 120%)[\(] B \( c \( tau \) \) f \( r \( tau \) \)
    #scale(x: 120%, y: 120%)[\)]\|_(tau = 0) & = B \( c \) f'' \( r \) dot(r)^(thin 2) +
    2 f' \( r \) dot(r) thin D B \( c \) dot.op dot(c)\
 & quad + f \( r \) D^2 B \( c \) \[ dot(c) \]\
 & = - frac(3 B \( c \) a^2, 8 sqrt(r)) + O \( 1 \) arrow.r - oo . $
  The affine part of $Psi$ has zero Hessian. Thus $A \[ sigma \] arrow.r - oo$,
    contradicting its nonnegativity and proving (2.1). ◻
]

The three-point estimate is uniform over every nonzero endpoint separation.
  This allows the observation scale and the scale of affine approximation to tend to zero at different rates.
  Lemma 9 uses that freedom to obtain affine approximation uniformly over the full normalized family of solutions
  and all interior centers.

== 3 Uniform power decay and the gradient estimate <sec:reduction>

We now prove the estimate in Theorem 1, conditional on a Liouville Theorem whose proof occupies the remaining
  sections. The argument works with all normalized solutions at once.
  We first obtain a common modulus of affine approximation,
  then use anisotropic compactness to force a power rate. Fits at this rate give the Hölder estimate for the
  gradient. The scaling and limiting equation also occur in Evans and Savin [9] Sections 2.3–2.4.

#thm([Theorem 3.1.])[
  (Liouville Theorem).  #emph[Let $m gt.eq 1$ and $0 lt.eq C_0 < oo$.
    Suppose that $v in C \( bb(R)^m times bb(R) \)$ is a viscosity solution of
#[#set math.equation(numbering: n => "(3.1)")
 $ F \[ v \] := D^2 v \[ \( nabla_x v \, 1 \) \] = 0 . $ <eq:limit-pde>]

 Suppose, in addition, that for every $z = \( x \, t \) in bb(R)^m times
   bb(R)$ and every $R > 0$ there are $p in bb(R)^m$ and $a in bb(R)$ such that
#[#set math.equation(numbering: n => "(3.2)")
 $ lr(|v \( x + h \, t + ell \) - v \( x \, t \) - p dot.op h - (a - frac(\| p \|^2, 2)) ell|) lt.eq C_0 R quad
   upright("if ") quad \| ell \| lt.eq R \, quad \| h - p ell \| lt.eq R . $ <eq:limit-fit>]

 Then $v$ is affine.]
] <thm:liouville>

We prove Theorem 8 in Sections 4–8. For clarity, a pair $\( p \, a \)$ satisfying (3.2) will be called a #emph[fit
  at $z$ of radius $R$]. Its domain is the sheared box

$ Q_R \( z \; p \) = { \( x + h \, t + ell \) : \| ell \| lt.eq R \, med \| h - p ell \| lt.eq R } . $

The ordinary time coefficient of the fitted affine function is $q = a - \| p \|^2 \/ 2$.
  We use $\( p \, a \)$ because a sheared change of frame acts by subtracting the frame parameters,
  as shown in Section 4.

=== 3.1 A flatness modulus for the normalized family <a-flatness-modulus-for-the-normalized-family>

Fix $d gt.eq 3$, put $n = d + 1$, and write $B_r^k$ for the ball of radius $r$ centered at zero in $bb(R)^k$.
  Let $cal(U)$ be the family of all functions

$ U \( y \, b \) = u \( y \) + b wide \( \( y \, b \) in B_1^d times bb(R) \) \, $

where $u$ is a continuous infinity-harmonic function with $u \( 0 \) = 0$ and $"osc"_(B_1^d) u lt.eq 1$.
  By Lemma 3, each $U$ is infinity-harmonic. The family is uniformly bounded and has a common Lipschitz constant
  $L$ on $overline(B)_(7 \/ 8)^n$. Indeed, $\| u \| lt.eq 1$,
  and the oscillations of the lifts are uniformly bounded on $overline(B)_(15 \/ 16)^n$.
  At every center in $overline(B)_(7 \/ 8)^n$, Lemma 4 bounds both slopes of radius $1 \/
  16$ by that common oscillation divided by $1 \/ 16$. This gives a common Lipschitz bound for nearby pairs;
  subdividing a segment gives the bound for all pairs in the ball.
  All constants in this section, unless indexed by additional parameters, depend only on $d$.

Set

$ G = B_(3 \/ 4)^n \, wide D \( z \) = "dist" \( z \, partial G \) \, $

and denote the added unit direction by $e_b$. For $P eq.not 0$, $0 < lambda < 1$, and $r > 0$, put $N_P =
  P \/ \| P \|$ and define the closed cylinder

$ Z_lambda \( z \, r \; P \) = { z + h : \| h dot.op N_P \| lt.eq r \, quad \| h - \( h dot.op N_P \) N_P \| lt.eq
  sqrt(lambda) r } . $

For $U in cal(U)$, $z in G$, and $0 < r lt.eq D \( z \) \/ 8$,
  call $lambda$ #emph[good for $U$ at $\( z \, r \)$] if some $P eq.not 0$ satisfies

#[#set math.equation(numbering: n => "(3.3)")
 $ \| U \( Z \) - U \( z \) - P dot.op \( Z - z \) \| lt.eq
   lambda r wide \( Z in Z_lambda \( z \, r \; P \) \) . $ <eq:physical-fit>]

We call this a cylinder fit. Its cylinder is contained in $B_(2 r) \( z \) subset G$.
  Let $beta_U \( z \, r \)$ be the supremum of the parameters in $\( 0 \, 1 \)$ that are not good,
  with value zero if there are none, and set

#[#set math.equation(numbering: n => "(3.4)")
 $ b \( s \) = sup { beta_U \( z \, r \) : U in cal(U) \, med z in G \, med 0 < r lt.eq s D \( z \) } \, wide
   0 < s lt.eq 1 \/ 8 . $ <eq:flatness-function>]

Thus $0 lt.eq b lt.eq 1$ and $b$ is nondecreasing. Goodness itself need not be monotone in $lambda$.
  The supremum definition ensures that every parameter in $\( beta_U \( z \, r \) \, 1 \)$ is good.

#thm([Lemma 3.2.])[
  (Uniform qualitative flatness).  #emph[The family modulus in (3.4) satisfies
#[#set math.equation(numbering: n => "(3.5)")
 $ b \( s \) arrow.r 0 wide \( s arrow.b 0 \) . $ <eq:family-flatness>]

 Every cylinder fit satisfies
#[#set math.equation(numbering: n => "(3.6)")
 $ \| P \| lt.eq L + sqrt(lambda) \, wide \| P dot.op e_b - 1 \| lt.eq sqrt(lambda) . $ <eq:physical-slope-bounds>]

]
] <lem:family-flatness>

#proof[
  The cylinder contains $overline(B)_(sqrt(lambda) r) \( z \)$.
    Evaluating the fit on this ball and using the Lipschitz bound gives the first inequality in (3.6).
    The exact increment of $U$ in direction $e_b$ equals the increment length, which gives the second.
  Suppose that (3.5) fails. There are $s_i arrow.r 0$, functions $U_i in cal(U)$, centers $z_i in G$,
    radii $0 < r_i lt.eq s_i D \( z_i \)$, and parameters $lambda_i$ that are not good at these triples,
    with $lambda_i gt.eq delta > 0$. Passing to a subsequence, the common bounds give
  $ z_i arrow.r z_(*) in overline(G) \, wide U_i arrow.r U_compose quad
    upright("uniformly on ") overline(B)_(7 \/ 8)^n . $
  The limit $U_compose$ is infinity-harmonic on $B_(7 \/ 8)^n$ by the usual viscosity stability argument [8]
    Section 6: add a positive fourth-order term to an upper test to make its contact strict,
    take nearby interior maxima for the approximating functions minus that test,
    and pass their inequalities to the limit. The added term leaves the first two derivatives at contact
    unchanged. A negative fourth-order term and minima treat lower tests.
    This argument also applies to the varying continuous jet operators below,
    since they converge uniformly on compact jet sets. Choose scales $R_i arrow.b 0$ so slowly that
  #[#set math.equation(numbering: n => "(3.7)")
   $ r_i + \| z_i - z_(*) \| + parallel U_i - U_compose parallel_(L^oo \( overline(B)_(7 \/ 8)^n \)) =
     o \( R_i \) . $ <eq:slow-scales>]
  Such a decreasing sequence can be obtained after passage to a subsequence, since all three terms tend to zero.
    The point $z_(*)$ is interior to $B_(7 \/ 8)^n$. Proposition 5,
    applied to the one function $U_compose$ at $z_(*)$, gives a further subsequence on which its $R_i$ blow-ups
    converge locally uniformly to a linear function. By (3.7), the functions
  $ hat(U)_i \( X \) = frac(U_i \( z_(*) + R_i X \) - U_i \( z_(*) \), R_i) $
  converge to that same linear function uniformly on $B_1^n$.
    They are infinity-harmonic and uniformly Lipschitz there.
    Proposition 7 therefore gives numbers $epsilon_i arrow.r 0$ such that
  #[#set math.equation(numbering: n => "(3.8)")
   $ \| hat(U)_i \( X \) + hat(U)_i \( Y \) - 2 hat(U)_i \( \( X + Y \) \/ 2 \) \| lt.eq epsilon_i \| X -
     Y \| wide \( X \, Y in B_(1 \/ 4)^n \) . $ <eq:slow-scale-midpoint>]
  Return now to the smaller radii $r_i$. The functions
  $ W_i \( H \) = frac(U_i \( z_i + r_i H \) - U_i \( z_i \), r_i) $
  are uniformly bounded and Lipschitz on $overline(B)_2^n$,
    so a further subsequence converges uniformly there to $W$.
    The slow-scale choice ensures that $z_i + r_i overline(B)_2^n subset
    B_(R_i \/ 4) \( z_(*) \)$ for all large $i$. Substituting
  $ X = frac(z_i - z_(*) + r_i H, R_i) \, wide Y = frac(z_i - z_(*) + r_i K, R_i) $
  into (3.8) shows that the midpoint defect of $W_i$ is at most $epsilon_i \| H - K \|$.
    Thus $W$ satisfies the midpoint identity on $overline(B)_2^n$.
    Continuity and dyadic subdivision on segments make $W$ affine on this ball.
    Since $W \( 0 \) = 0$ and $W \( e_b \) = 1$, it has the form $W \( H \) = P dot.op H$ with $P dot.op e_b = 1$.
  Uniform convergence now gives, for all large $i$,
  $ sup_(\| H \| lt.eq 2) \| U_i \( z_i + r_i H \) - U_i \( z_i \) - r_i P dot.op H \| < delta r_i . $
  The nonzero slope $P$ therefore gives a fit with error at most $lambda_i
    r_i$ on $Z_(lambda_i) \( z_i \, r_i \; P \) subset B_(2 r_i) \( z_i \)$.
    This contradicts the choice of $lambda_i$ and proves (3.5). ◻
]

The larger scales $R_i$ allow a varying sequence of solutions to be compared with a blow-up of one limit function.
  The three-point estimate then transfers flatness back to the possibly much smaller scales $r_i$.
  No uniform differentiability theorem for the original family is used.

=== 3.2 Selection of scales <selection-of-scales>

Our next objective is a power bound for the single modulus $b$,
  which already takes the supremum over all normalized solutions.

#thm([Proposition 3.3.])[
  (Uniform power decay).  #emph[Assume Theorem 8. There are $B in \( 0 \, oo \)$, $gamma in \( 0 \, 1 \]$,
    and $s_0 in \( 0 \, 1 \/ 8 \]$, depending only on $d$, such that
#[#set math.equation(numbering: n => "(3.9)")
 $ b \( s \) lt.eq B s^gamma wide \( 0 < s lt.eq s_0 \) . $ <eq:power-decay>]

]
] <prop:power-decay>

We prove this proposition by contradiction. Its failure means that $b \( s \) \/
  s^gamma$ is unbounded near zero for every $gamma > 0$. The next lemma selects scales where this failure occurs,
  while obtaining a slightly enlarged good parameter uniformly at nearby centers and radii.

#thm([Lemma 3.4.])[
  #emph[Suppose that (3.9) fails for every positive exponent.
    There are $gamma_i arrow.b 0$, $s_i arrow.b 0$, functions $U_i in cal(U)$, centers $z_i in G$,
    radii $0 < r_i lt.eq s_i D \( z_i \)$, and parameters $lambda_i arrow.b
    0$ such that $lambda_i$ is not good for $U_i$ at $\( z_i \, r_i \)$ and the following holds.
    Set $Lambda = 32$. For every fixed $M gt.eq 2$, for all sufficiently large $i$, every center $z$ with $\| z -
    z_i \| lt.eq M r_i$ and radius $0 < r lt.eq M r_i$ are admissible,
    and $Lambda lambda_i$ is good for $U_i$ at $\( z \, r \)$.]
] <lem:bad-scales>

#proof[
  Choose any sequence $gamma_i arrow.b 0$. The function $b \( s \)
    s^(- gamma_i)$ is bounded on intervals separated from zero and is unbounded near zero.
    Taking a factor-two approximate maximum on a sufficiently long truncated interval $\[ h_i \, 1 \/ 8 \]$ gives
    a point $s_i$ such that $s_i arrow.r 0$ and
  #[#set math.equation(numbering: n => "(3.10)")
   $ frac(b \( s \), s^(gamma_i)) lt.eq 2 frac(b \( s_i \), s_i^(gamma_i)) wide \( s_i lt.eq s lt.eq 1 \/ 8 \) .
     $ <eq:running-maximum>]
  For example, make the approximate maximum larger than the supremum on $\[ 1 \/ i \, 1 \/ 8 \]$ to ensure $s_i <
    1 \/ i$. Pass to a subsequence to make $s_i$ decreasing. We have $b \( s_i \) > 0$.
    Choose $U_i in cal(U)$, $z_i in G$, and $r_i lt.eq s_i D \( z_i \)$ with $beta_(U_i) \( z_i \, r_i \) >
    b \( s_i \) \/ 2$, and then choose a parameter $lambda_i > beta_(U_i) \( z_i \, r_i \) \/
    2$ that is not good for $U_i$ at this center and radius. This uses only approximate suprema and gives
  #[#set math.equation(numbering: n => "(3.11)")
   $ b \( s_i \) \/ 4 < lambda_i lt.eq b \( s_i \) . $ <eq:bad-parameter>]
  In particular $lambda_i arrow.r 0$; pass to a further subsequence if needed to make it decreasing.
  Fix $M gt.eq 2$. For large $i$, we have $M r_i lt.eq M s_i D \( z_i \) < D \( z_i \)$, so every $z$ with $\| z -
    z_i \| lt.eq M r_i$ belongs to $G$. The distance to the boundary then satisfies
  $ D \( z \) gt.eq D \( z_i \) - M r_i gt.eq 1 / 2 D \( z_i \) > 0 . $
  For $r lt.eq M r_i$ we have $r \/ D \( z \) lt.eq 2 M s_i lt.eq 1 \/ 8$,
    so the center and radius are admissible. By (3.10) and (3.11), uniformly over all these choices,
  $ beta_(U_i) \( z \, r \) lt.eq b \( 2 M s_i \) lt.eq 2 b \( s_i \) \( 2 M \)^(gamma_i) lt.eq
    8 lambda_i \( 2 M \)^(gamma_i) < 32 lambda_i < 1 $
  for all sufficiently large $i$. Here $\( 2 M \)^(gamma_i) arrow.r 1$ for each fixed $M$, so the same $Lambda =
    32$ works for every fixed $M$; only the threshold in $i$ depends on $M$.
    The parameter $Lambda lambda_i$ is strictly greater than every bad parameter and is therefore good. ◻
]

We isolate the geometry used to compare fitted slopes. It is a statement about affine fits and does not use the
  equation. When $theta^2 = Lambda lambda_i$, the rescaling below divides transverse slope errors by
  $sqrt(lambda_i)$ and longitudinal errors by $lambda_i$. The $O \( theta \)$ direction estimate controls the
  normalized transverse coefficient, while the $O \( theta^2 \)$ norm estimate,
  together with the quadratic angular error, controls the normalized longitudinal coefficient.

#thm([Lemma 3.5.])[
  (Comparison of cylinder fits).  #emph[Fix $0 < c_(*) lt.eq C_(*) < oo$.
    Suppose two fits for the same function, of the form (3.3), with parameter $theta^2 in \( 0 \, 1 \)$,
    have slopes $P \, P'$ satisfying $c_(*) lt.eq \| P \| \, \| P' \| lt.eq C_(*)$.
    Write $n = P \/ \| P \|$ and $n' = P' \/ \| P' \|$. If their centers agree and their radii are $H$ and $H'$
    with $H lt.eq H' lt.eq 2 H$, then
#[#set math.equation(numbering: n => "(3.12)")
 $ \| P - P' \| + \| n - n' \| lt.eq C theta \, wide \| \| P \| - \| P' \| #scale(x: 120%, y: 120%)[\|] lt.eq
   C theta^2 \, $ <eq:cylinder-comparison>]

 where $C$ depends only on $c_(*) \, C_(*)$. The same conclusion holds for equal radii $H$ at centers $z \,
   z'$ if $z'$ lies in the first cylinder with axial and transverse offsets at most $H \/ 4$ and $theta H \/ 4$,
   respectively.]
] <lem:cylinder-comparison>

#proof[
  In the common-center case both cylinders contain $B_(theta H) \( z \)$.
    Evaluation of the difference of the fits on this ball gives $\| P - P' \| lt.eq 3 theta$.
    Normalization of the vectors, using the lower norm bound, gives $\| n - n' \| lt.eq C theta$.
    Choose a fixed small $c > 0$. The point $z + c H n$ belongs to both cylinders:
    relative to $n'$ its transverse displacement is at most $c H \| n - n' \| lt.eq C c theta H$,
    and its axial displacement is at most $c H$. Taking $c$ sufficiently small, the fit errors at that point give
  $ \| \( P - P' \) dot.op n \| lt.eq C theta^2 . $
  Since $1 - n' dot.op n = \| n - n' \|^2 \/ 2$,
  $ \| \| P \| - \| P' \| #scale(x: 120%, y: 120%)[\|] lt.eq \| \( P - P' \) dot.op n \| + \|
    P' \| \( 1 - n' dot.op n \) lt.eq C theta^2 . $
  For displaced centers, a ball $B_(c theta H) \( z' \)$ with fixed small $c$ belongs to both cylinders by the
    quarter-radius margins. Subtracting the first fit’s value at $z'$ makes it an estimate for increments from
    $z'$ with error $2 theta^2 H$; the second fit has error $theta^2 H$.
    Evaluation on the common ball again gives the vector and direction bounds.
    The segment $z' + s n'$ for $\| s \| lt.eq c' H$ lies in both cylinders when $c' > 0$ is sufficiently small:
    the first cylinder’s initial offsets use a quarter of its radii,
    and the additional transverse offset is at most $c' H \| n - n' \|$.
    Evaluation on this segment and the same norm calculation give the last bound in (3.12). ◻
]

=== 3.3 The normalized limit <the-normalized-limit>

For $U_i$ at $\( z_i \, r_i \)$, choose a fitted slope $P_i$ for the good parameter $Lambda lambda_i$ of Lemma 11.
  Put $c_i = \| P_i \|$. By (3.6), after discarding finitely many indices,

#[#set math.equation(numbering: n => "(3.13)")
 $ 1 / 2 lt.eq c_i lt.eq L + 1 . $ <eq:base-norm-bounds>]

Use orthonormal coordinates with final unit vector $P_i \/ c_i$, write the transverse variable as $x in bb(R)^d$,
  and define $v_i$ by

#[#set math.equation(numbering: n => "(3.14)")
 $ U_i #scale(x: 120%, y: 120%)[\(] z_i + r_i \( sqrt(lambda_i) x \, t \) #scale(x: 120%, y: 120%)[\)] =
   U_i \( z_i \) + r_i c_i #scale(x: 120%, y: 120%)[\(] t + lambda_i v_i \( x \, t \)
   #scale(x: 120%, y: 120%)[\)] . $ <eq:anisotropic-rescaling>]

These coordinates depend on $i$. The domains of $v_i$ exhaust $bb(R)^d times bb(R)$,
  since $D \( z_i \) \/ r_i gt.eq 1 \/ s_i arrow.r oo$.

For a smooth test $phi.alt$ for $v_i$, the corresponding test for $U_i$ has gradient
  $c_i \( sqrt(lambda_i) nabla_x phi.alt \, 1 + lambda_i phi.alt_t \)$ and Hessian

$ c_i /
  r_i
  mat(delim: "(", D_(x x)^2 phi.alt, sqrt(lambda_i) D_(x t) phi.alt; sqrt(lambda_i) D_(t x) phi.alt, lambda_i
  phi.alt_(t t)) . $

Consequently its infinity Laplacian is the positive factor $lambda_i c_i^3 \/ r_i$ times

#[#set math.equation(numbering: n => "(3.15)")
 $ D^2 phi.alt \[ \( nabla_x phi.alt \, 1 + lambda_i phi.alt_t \) \] . $ <eq:rescaled-pde>]

Thus $v_i$ solve the equation obtained by setting (3.15) equal to zero in the viscosity sense.

#thm([Proposition 3.6.])[
  #emph[For the sequence supplied by Lemma 11 and the normalization (3.14),
    a subsequence of the $v_i$ converges locally uniformly to a nonaffine function $v in
    C \( bb(R)^d times bb(R) \)$ satisfying (3.1) and (3.2) with one finite constant $C_0$.]
] <prop:nonaffine-limit>

#proof[
  Set $theta_i = sqrt(Lambda lambda_i)$. A good fit of radius $R r_i$ has error $theta_i^2 R
    r_i$ and transverse radius $theta_i R r_i$. Its slope obeys uniform upper and lower norm bounds by (3.6),
    once $i$ is large enough.
  For each fixed $R gt.eq 2$, Lemma 11, applied with any fixed $M > R$,
    provides fits at $z_i$ through successive doublings from $r_i$,
    followed if necessary by a final step to $R r_i$ of ratio at most two, for all sufficiently large $i$.
    Comparing them by Lemma 12 gives, for a slope $P_R$ at the latter radius and its unit vector $n_R$,
  #[#set math.equation(numbering: n => "(3.16)")
   $ \| n_R - P_i \/ c_i \| lt.eq C theta_i \( 1 + log R \) \, wide \| \| P_R \| -
     c_i #scale(x: 120%, y: 120%)[\|] lt.eq C theta_i^2 \( 1 + log R \) . $ <eq:base-cylinder-comparison>]
  Fix a box $\| x \| \, \| t \| lt.eq K$ in the coordinates of (3.14) and a radius factor $S > 0$.
    Choose $R gt.eq 2$ so large that $R > 16 K$ and
  $ K #scale(x: 120%, y: 120%)[\(] Lambda^(- 1 \/ 2) + C \( 1 + log R \) #scale(x: 120%, y: 120%)[\)] < R \/ 4 . $
  Such a choice is possible because $R \/ log R arrow.r oo$. Next fix $M > max { 2 \, 2 K \, R \, S }$.
    The physical centers in the box are within $2 K r_i$ of $z_i$,
    and all radii in the comparisons below are at most $max { R \, S } r_i$.
    Lemma 11 therefore supplies these fits uniformly once $i$ is sufficiently large.
    The physical image of the box then lies inside the cylinder at $z_i$ for $P_R$,
    with axial and transverse offsets at most one quarter of the respective radii.
    For the axial offset use $\| sqrt(lambda_i) x \| + \| t \| lt.eq 2 K$.
    For the transverse offset, (3.16) gives the bound
  $ K #scale(x: 120%, y: 120%)[\(] sqrt(lambda_i) + C theta_i \( 1 + log R \) #scale(x: 120%, y: 120%)[\)] <
    theta_i R \/ 4 $
  in units of $r_i$.
  Compare a fit centered at any point of this box, first at radius $R r_i$ with the enclosing fit,
    and then through successive doublings or halvings, with a final ratio at most two, to radius $S r_i$.
    The number of comparisons depends on $K \, S$ but not on $i$.
    If $P = \( P_x \, P_t \)$ is any such slope in the coordinates of (3.14), Lemma 12 gives
  $ \| P \/ \| P \| - P_i \/ c_i \| lt.eq C_(K \, S) theta_i \, wide \| \| P \| -
    c_i #scale(x: 120%, y: 120%)[\|] lt.eq C_(K \, S) theta_i^2 . $
  Since $P_i \/ c_i$ is the last coordinate vector,
  $ \| P_x \| lt.eq C_(K \, S) theta_i \, wide \| P_t - c_i \| lt.eq \| \| P \| -
    c_i #scale(x: 120%, y: 120%)[\|] + 1 / 2 \| P \| thin \| P \/ \| P \| - P_i \/ c_i \|^2 lt.eq
    C_(K \, S) theta_i^2 . $
  It follows that the normalized coefficients
  #[#set math.equation(numbering: n => "(3.17)")
   $ p'_i = frac(P_x, c_i sqrt(lambda_i)) \, wide q'_i = frac(P_t \/ c_i - 1, lambda_i) quad
     upright("satisfy") quad \| p'_i \| + \| q'_i \| lt.eq C_(K \, S) . $ <eq:normalized-fit-slopes>]
  In particular, using the enclosing fit at $z_i$ in (3.14) gives on the box
  $ \| v_i \( x \, t \) - p'_(i \, R) dot.op x - q'_(i \, R) t \| lt.eq Lambda R \/ c_i . $
  Thus $v_i$ are uniformly bounded on each fixed box.
  We next express the domain of a fit in these coordinates.
    Suppress the index $i$ temporarily, write $lambda = lambda_i$, and set
  $ A = 1 + lambda q'_i \, wide N = \( A^2 + lambda \| p'_i \|^2 \)^(1 \/ 2) \, wide n =
    frac(\( sqrt(lambda) p'_i \, A \), N) . $
  For fixed $K \, S$, (3.17) gives $A > 0$, $N \/ A = 1 + O_(K \, S) \( lambda \)$, and $\| n_x \| =
    O_(K \, S) \( sqrt(lambda) \)$ for large $i$. The physical axis has ratio $sqrt(lambda) thin p'_i \/
    A$ of transverse to axial displacement, which becomes the finite shear $p'_i \/
    A$ after the transverse stretch. Figure 1 illustrates this change of geometry.
    The next calculation identifies a sheared box contained in the cylinder’s image in normalized coordinates,
    with a fixed margin at the cylinder’s axial ends. The exact decomposition
  #[#set math.equation(numbering: n => "(3.18)")
   $ \( sqrt(lambda) h \, ell \) = frac(ell N, A) thin n + (sqrt(lambda) (h - p'_i / A ell) \, 0)
     $ <eq:cylinder-shear-decomposition>]
  shows that the mapped increment lies in the radius-$S r_i$ cylinder whenever
  #[#set math.equation(numbering: n => "(3.19)")
   $ \| ell \| lt.eq S \/ 2 \, wide lr(|h - p'_i / A ell|) lt.eq S \, $ <eq:normalized-fit-domain>]
  for all large $i$. Indeed the residual in (3.18) has transverse projection at most $sqrt(lambda) S lt.eq
    theta_i S$, and its axial projection is $O_(K \, S) \( lambda S \)$.
    The first term has axial length at most $\( 1 + O_(K \, S) \( lambda \) \) S \/ 2$,
    leaving a strict axial margin. Dividing (3.3) by $r_i c_i lambda_i$ therefore gives
  #[#set math.equation(numbering: n => "(3.20)")
   $ \| v_i \( x + h \, t + ell \) - v_i \( x \, t \) - p'_i dot.op h - q'_i ell \| lt.eq Lambda /
     c_i S $ <eq:normalized-fit>]
  on (3.19). The coefficient of $S$ is independent of $K$ and $S$.
  #figure(
    [#cetz.canvas({
  import cetz.draw: *
  content((2.25, 4.68), [#text(size: 9pt)[physical cylinder]])
  content((10.25, 4.68), [#text(size: 9pt)[limiting sheared box]])
  content((2.25, -0.76), [#text(size: 9pt)[$Z_ lambda (z,r;P)$]], anchor: "north", padding: 0.1176cm)
  line((1.462, 0.5156), (2.211, 0.3006), (3.038, 3.184), (2.289, 3.399), close: true, fill: rgb("#ebf0f4"), stroke: (paint: rgb("#235888"), thickness: 0.7pt, miter-limit: 10))
  line((1.79, 0.2447), (2.25, 1.85), stroke: (paint: rgb("#235888"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  line((2.25, 1.85), (2.79, 3.734), stroke: (paint: rgb("#235888"), thickness: 0.85pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#235888"))))
  content((2.815, 3.759), [#text(size: 9pt)[$P$]], anchor: "south-west", angle: -16deg, padding: 0.1176cm)
  circle((2.25, 1.85), radius: 0.07056, fill: black, stroke: none)
  content((2.175, 1.775), [#text(size: 9pt)[$z$]], anchor: "north-east", angle: -16deg, padding: 0.1176cm)
  line((1.539, 2.054), (1.952, 3.496), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((1.604, 2.775), [#text(size: 9pt)[$r$]], anchor: "east", angle: -16deg, padding: 0.1176cm)
  line((1.481, 2.071), (1.789, 1.982), (1.894, 3.512), (2.202, 3.424), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  line((1.751, 0.1101), (2.126, 0.002618), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  line((1.781, 0.2159), (1.729, 0.03322), (2.184, 0.2045), (2.104, -0.07428), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10))
  content((2.02, -0.1082), [#text(size: 9pt)[$sqrt( lambda ) thin r$]], anchor: "north", angle: -16deg, padding: 0.1176cm)
  line((2.25, 0.1), (2.25, 4.05), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  circle((2.25, 1.85), radius: 0.07056, fill: black, stroke: none)
  content((1.58, 3.93), [#text(fill: rgb("#4d4d4d"))[#text(size: 8pt)[base direction]]], anchor: "east", padding: 0.1176cm)
  line((1.65, 3.93), (2.2, 3.93), stroke: (paint: rgb("#8c8c8c"), thickness: 0.4pt, miter-limit: 10))
  line((4.3, 1.9), (6.93, 1.9), stroke: (thickness: 0.8pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((5.61, 2.58), [#text(size: 9pt)[stretch transverse#linebreak()directions]])
  content((5.61, 1.26), [#text(size: 8pt)[take fixed margins,#linebreak()then pass to the limit]])
  line((8.3, 0.55), (10.9, 0.55), (12.2, 3.15), (9.6, 3.15), close: true, fill: rgb("#ecf2f0"), stroke: (paint: rgb("#2e7055"), thickness: 0.7pt, miter-limit: 10))
  line((7.97, 1.85), (12.59, 1.85), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((12.59, 1.85), [#text(size: 9pt)[$h$]], anchor: "west", padding: 0.1176cm)
  line((10.25, 0.28), (10.25, 3.74), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((10.25, 3.74), [#text(size: 9pt)[$ell$]], anchor: "south", padding: 0.1176cm)
  line((9.6, 0.55), (10.9, 3.15), stroke: (paint: rgb("#2e7055"), thickness: 0.85pt, miter-limit: 10, dash: "densely-dashed"))
  content((11.23, 2.42), [#text(fill: rgb("#2e7055"))[#text(size: 9pt)[$h=p ell$]]], anchor: "west", padding: 0.1176cm)
  line((11.16, 2.45), (10.67, 2.69), stroke: (paint: rgb("#6d9b88"), thickness: 0.4pt, miter-limit: 10))
  circle((10.25, 1.85), radius: 0.07056, fill: black, stroke: none)
  content((10.18, 1.925), [#text(size: 9pt)[$0$]], anchor: "south-east", padding: 0.1176cm)
  line((10.9, 3.41), (12.2, 3.41), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((11.55, 3.481), [#text(size: 9pt)[$R$]], anchor: "south", padding: 0.1176cm)
  line((10.9, 3.2), (10.9, 3.5), (12.2, 3.2), (12.2, 3.5), stroke: (paint: rgb("#96b8aa"), thickness: 0.4pt, miter-limit: 10))
  line((8, 1.85), (8, 3.15), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((7.894, 2.5), [#text(size: 9pt)[$R$]], anchor: "east", padding: 0.1176cm)
  line((7.94, 3.15), (9.5, 3.15), stroke: (paint: rgb("#96b8aa"), thickness: 0.4pt, miter-limit: 10))
  content((10.25, -0.84), [#text(size: 9pt)[$| ell | lt.eq R, |h-p ell | lt.eq R$]])
})],
    caption: [Figure 1: From thin cylinders to sheared fitting domains. The left panel shows a two-dimensional section of $Z_lambda \( z \, r \; P \)$, with axial radius $r$ and transverse radius $sqrt(lambda) thin r$; the dotted line indicates the base direction used for rescaling. Stretching transverse directions makes the small inclination of a nearby fitted axis visible as a finite shear. Fixed margins give contained sheared boxes, and passage to the limit yields $Q_R \( z \; p \)$, shown on the right in increment coordinates $\( h \, ell \)$. The panels are schematic: the finite-scale cylinder image is not asserted to equal the limiting box. ],
  ) <fig:anisotropic-fit>
  This proves equicontinuity on compact sets. Given an accuracy $epsilon > 0$,
    first fix $S > 0$ so small that $2 Lambda S < epsilon \/ 3$.
    For a fixed box, (3.17) now bounds its coefficients by some finite $C_(K \, S)$.
    Choose the increments sufficiently small, depending on this bound and $S$,
    that (3.19) holds and the affine increment in (3.20) is less than $epsilon \/ 3$.
    For all sufficiently large $i$, (3.13) and (3.20) then bound the value increment by $2 epsilon \/ 3$.
    Discard an initial segment so that all domains contain the compact box.
    The threshold in $i$ may depend on $epsilon$; the finitely many remaining preceding continuous functions can
    be included by decreasing the increment size. The local bounds and domain exhaustion now give a locally
    uniformly convergent subsequence, with limit $v$ and $v \( 0 \, 0 \) = 0$.
  The jet operators $X \[ \( p_x \, 1 + lambda_i p_t \) \]$ converge locally uniformly to
    $X \[ \( p_x \, 1 \) \]$. Viscosity stability gives (3.1); equivalently,
    strictify a smooth upper or lower test for $v$, choose nearby touching points for $v_i$,
    and pass to the limit in (3.15). To pass the fits, fix a center and a target radius $R > 0$, and take $S =
    4 R$ in (3.20). After a further subsequence its bounded coefficients converge to $p \, q$.
    The shears $p'_i \/ \( 1 + lambda_i q'_i \)$ converge to $p$.
    Every increment with $\| ell \| lt.eq R$ and $\| h - p ell \| lt.eq R$ then satisfies (3.19), uniformly,
    for all sufficiently large $i$. Passing to the limit in (3.20) yields (3.2) with
  $ a = q + \| p \|^2 \/ 2 \, wide C_0 = 8 Lambda = 256 . $
  The additional subsequence may depend on the chosen center and radius:
    the limit function $v$ stays fixed, and (3.2) asserts existence separately for each choice.
  Finally suppose that $v$ is affine. Since $v \( 0 \, 0 \) = 0$, write $v \( x \, t \) = p dot.op x + q t$.
    In the physical coordinates consider
  $ tilde(P)_i = c_i \( sqrt(lambda_i) p \, 1 + lambda_i q \) . $
  These slopes are nonzero for large $i$. The cylinders $Z_(lambda_i) \( z_i \, r_i \; tilde(P)_i \)$ lie in one
    fixed box of the rescaled coordinates. In fact, if
  $ N_i = #scale(x: 120%, y: 120%)[\(] lambda_i \| p \|^2 + \( 1 + lambda_i q \)^2
    #scale(x: 120%, y: 120%)[\)]^(1 \/ 2) arrow.r 1 \, $
  a point in such a cylinder, in units of $r_i$, is $s \( sqrt(lambda_i) p \, 1 + lambda_i q \) \/ N_i +
    sqrt(lambda_i) xi$ with $\| s \| lt.eq 1$, $\| xi \| lt.eq 1$, and $xi$ perpendicular to the axis.
    Its rescaled coordinates satisfy $\| x \| lt.eq \| p \| \/ N_i + 1$ and $\| t \| lt.eq 1 + sqrt(lambda_i)$.
    On this fixed box the residual for the proposed fit is exactly
  $ r_i c_i lambda_i #scale(x: 120%, y: 120%)[\(] v_i \( x \, t \) - p dot.op x -
    q t #scale(x: 120%, y: 120%)[\)] = o \( lambda_i r_i \) $
  uniformly, by local uniform convergence and the upper bound for $c_i$.
    It is eventually at most $lambda_i r_i$ on the whole cylinder.
    This makes $lambda_i$ good for $U_i$ at $\( z_i \, r_i \)$, contrary to Lemma 11. Hence $v$ is nonaffine. ◻
]

#proof[
  If no power bound held, Lemma 11 and Proposition 13 would produce a nonaffine entire solution satisfying all
    hypotheses of Theorem 8, with $m = d$ and $C_0 = 256$. The theorem makes that solution affine,
    a contradiction. Hence a power bound holds. Reducing its exponent if necessary gives $gamma lt.eq 1$.
    Since the family $cal(U)$ and the function $b$ were fixed solely by $d$,
    the constants in (3.9) depend only on $d$. ◻
]

=== 3.4 From cylinder fits to a Hölder gradient <from-cylinder-fits-to-a-hölder-gradient>

We finish the reduction by extracting the uniform estimate from (3.9).
  The exponent comes from the inscribed balls: their radii are $sqrt(lambda) r$,
  whereas the fitting error is $lambda r$.

#proof[
  Take $B \, gamma \, s_0$ from Proposition 10. At every center $z in overline(B)_(1 \/ 2)^n$ one has $D \( z \)
    gt.eq d_0 := 1 \/ 4$. Choose $A_0 > B d_0^(- gamma)$. There is $r_0 > 0$, depending only on $d$,
    such that for all $0 < r lt.eq r_0$,
  $ r \/ d_0 lt.eq min { s_0 \, 1 \/ 8 } \, wide A_0 r^gamma < 1 . $
  For every $U in cal(U)$ and each such center and radius,
  $ beta_U \( z \, r \) lt.eq b \( r \/ D \( z \) \) lt.eq B \( r \/ d_0 \)^gamma < A_0 r^gamma . $
  Thus $lambda = A_0 r^gamma$ is good, with the same constants for all functions and centers.
  Fix $U in cal(U)$. Set
  $ r_j = 2^(- j) r_0 \, wide rho_j = sqrt(A_0) thin r_j^(1 + gamma \/ 2) \, wide j gt.eq 0 \, $
  and at each center $z in overline(B)_(1 \/ 2)^n$ choose a fitted slope $P_j \( z \)$ for the parameter $A_0
    r_j^gamma$. The fit holds on the inscribed ball $overline(B)_(rho_j) \( z \)$,
    with error at most $A_0 r_j^(1 + gamma)$. Comparing consecutive fits on their common ball
    $overline(B)_(rho_(j + 1)) \( z \)$ gives
  $ \| P_j \( z \) - P_(j + 1) \( z \) \| lt.eq
    frac(A_0 \( r_j^(1 + gamma) + r_(j + 1)^(1 + gamma) \), rho_(j + 1)) lt.eq C r_j^(gamma \/ 2) . $
  The geometric tail converges uniformly in $U$ and $z$. Consequently there is a vector $P_oo \( z \)$ with
  #[#set math.equation(numbering: n => "(3.21)")
   $ \| P_j \( z \) - P_oo \( z \) \| lt.eq C r_j^(gamma \/ 2) . $ <eq:slope-tail>]
  If $0 < \| h \| lt.eq rho_0$, choose $j$ so that $rho_(j + 1) < \| h \| lt.eq rho_j$.
    The fit at radius $r_j$ and (3.21) give
  $ frac(\| U \( z + h \) - U \( z \) - P_oo \( z \) dot.op h \|, \| h \|) & lt.eq
    frac(A_0 r_j^(1 + gamma), rho_(j + 1)) + \| P_j \( z \) - P_oo \( z \) \|\
 & lt.eq C r_j^(gamma \/ 2) lt.eq C' \| h \|^(alpha_d) \, $
  where
  #[#set math.equation(numbering: n => "(3.22)")
   $ alpha_d = frac(gamma, 2 + gamma) in \( 0 \, 1 \/ 3 \] . $ <eq:holder-exponent>]
  The final inequality follows from $rho_(j + 1) = sqrt(A_0) thin 2^(- \( 1 + gamma \/ 2 \))
    r_j^(1 + gamma \/ 2)$ and $\( 1 + gamma \/ 2 \) alpha_d = gamma \/ 2$.
    Thus $U$ is differentiable at every such $z$, with gradient $P_oo \( z \)$, and
  #[#set math.equation(numbering: n => "(3.23)")
   $ \| U \( z + h \) - U \( z \) - nabla U \( z \) dot.op h \| lt.eq
     C \| h \|^(1 + alpha_d) wide \( \| h \| lt.eq rho_0 \) . $ <eq:uniform-taylor-estimate>]
  All increments here remain in $G$, since each lies in one of the admissible inscribed balls.
    The original Lipschitz bound gives $\| nabla U \( z \) \| lt.eq L$.
  To compare gradients, take $z \, z' in overline(B)_(1 \/ 2)^n$ with $ell = \| z - z' \| lt.eq
    rho_0 \/ 2$ and $ell > 0$, and fix any unit vector $e in bb(R)^n$.
    The evaluation point $z' + ell e$ need not lie in $B_(1 \/ 2)^n$;
    the Taylor estimates centered at $z$ and $z'$ still apply. Applying (3.23) at $z'$ to the increment $ell e$ gives
  $ U \( z' + ell e \) - U \( z' \) = ell nabla U \( z' \) dot.op e + O \( ell^(1 + alpha_d) \) . $
  Applying the same estimate at $z$ to the increments $z' - z$ and $z' + ell e - z$,
    whose lengths are at most $2 ell$, gives
  $ U \( z' + ell e \) - U \( z' \) = ell nabla U \( z \) dot.op e + O \( ell^(1 + alpha_d) \) . $
  The constants are independent of $e \, U \, z \, z'$. Subtracting and taking the supremum over unit vectors proves
  $ \| nabla U \( z \) - nabla U \( z' \) \| lt.eq C ell^(alpha_d) . $
  For larger distances the same estimate follows, after increasing $C$, from $\| nabla U \| lt.eq L$.
    Restriction to points $\( y \, 0 \)$ therefore gives the claimed uniform gradient norm and Hölder seminorm for
    every normalized $u$.
  Finally, if $u$ is as in Theorem 1 and its oscillation is $M > 0$,
    then $\( u - u \( 0 \) \) \/ M$ is a normalized solution:
    positive scaling and addition of constants preserve the viscosity equation by transformation of tests.
    Multiplying the normalized estimates by $M$ gives the theorem.
    If $M = 0$, the function is constant and the conclusion is immediate. ◻
]

It remains to prove Theorem 8. The following sections use only its equation and fitting hypothesis;
  the original infinity-harmonic family will no longer enter the argument.

== 4 Compactness and quadratic envelopes <sec:limiting-tools>

We begin the proof of Theorem 8. Write $cal(A)_(m \, C_0)$ for the class of continuous functions on $bb(R)^m times
  bb(R)$ that solve (3.1) and have the fits (3.2) at every center and radius.
  We may enlarge $C_0$ to $max { C_0 \, 1 }$. Constants denoted by $C$ in estimates for this class may depend on
  $m$ and $C_0$.

=== 4.1 Changes of frame and compactness <changes-of-frame-and-compactness>

#thm([Lemma 4.1.])[
  (Changes of frame).  #emph[Let $v in cal(A)_(m \, C_0)$, $z_0 = \( x_0 \, t_0 \)$, $R > 0$,
    and $\( p_0 \, a_0 \) in bb(R)^m times bb(R)$. Then
#[#set math.equation(numbering: n => "(4.1)")
 $ macron(v) \( y \, s \) = frac(v \( x_0 + R \( y + p_0 s \) \, t_0 + R s \) - v \( x_0 \, t_0 \), R) -
   p_0 dot.op y - (a_0 + frac(\| p_0 \|^2, 2)) s $ <eq:frame-change>]

 belongs to $cal(A)_(m \, C_0)$. A fit $\( p \, a \)$ for $v$ at the corresponding center and radius $R
   rho$ becomes the fit $\( p - p_0 \, a - a_0 \)$ for $macron(v)$ at radius $rho$.]
] <lem:frame-invariance>

#proof[
  Set
  $ B = mat(delim: "(", I_m, p_0; 0, 1) . $
  For smooth functions, at corresponding points, $nabla_y macron(v) = nabla_x v - p_0$ and $D^2 macron(v) =
    R B^(sans(T)) D^2 v B$. Since $B \( nabla_y macron(v) \, 1 \) = \( nabla_x v \, 1 \)$,
    this gives $F \[ macron(v) \] = R F \[ v \]$. Pulling back an upper or lower smooth test gives the same
    implication in the viscosity sense. For the fits, an increment $\( h \, ell \)$ in the new variables
    corresponds to $R \( h + p_0 ell \, ell \)$. The old affine increment,
    divided by $R$ and with the affine part of (4.1) subtracted, is
  $ \( p - p_0 \) dot.op h + (a - a_0 - frac(\| p - p_0 \|^2, 2)) ell . $
  The old box conditions become $\| ell \| lt.eq rho$ and $\| h - \( p - p_0 \) ell \| lt.eq rho$,
    and the error is $C_0 rho$. ◻
]

We say that $v$ is #emph[centered at $z_c$] if $v \( z_c \) = 0$ and $\( 0 \, 0 \)$ is a fit there of radius $1$.
  Choosing $\( p_0 \, a_0 \)$ to be a fit at $\( z_0 \, R \)$ in (4.1) produces a function centered at the origin.
  We will also center at $\( 0 \, 1 \)$, using a translation of the time coordinate. Put

$ L \( K \) = 1 + log K wide \( K gt.eq 2 \) \, wide cal(B)_K = { \( x \, t \) : \| x \| lt.eq K \,
  med \| t \| lt.eq K } . $

Comparisons of fits across scales give the logarithmic parameter bounds below.
  They yield compactness after centering and uniform subquadratic spatial growth,
  which will confine the quadratic-envelope optimizers. The estimates use only the fits;
  the equation enters when the limit is identified.

#thm([Lemma 4.2.])[
  (Bounds and compactness from fits).  #emph[Suppose that $v in
    cal(A)_(m \, C_0)$ is centered at either $\( 0 \, 0 \)$ or $\( 0 \, 1 \)$. For $K gt.eq 2$ one has
#[#set math.equation(numbering: n => "(4.2)")
 $ \| v \( x \, t \) \| lt.eq C K L \( K \)^2 wide \( \( x \, t \) in cal(B)_K \) . $ <eq:centered-growth>]

 Every fit $\( p \, a \)$ at a center in $cal(B)_K$, of any radius $r > 0$, satisfies
#[#set math.equation(numbering: n => "(4.3)")
 $ \| p \| + \| a \| lt.eq C #scale(x: 120%, y: 120%)[\(] L \( K \) + \| log r \| #scale(x: 120%, y: 120%)[\)] .
   $ <eq:fit-parameter-bound>]

 In particular, for a center $\( x \, t \) in cal(B)_K$,
#[#set math.equation(numbering: n => "(4.4)")
 $ \| v \( x + h \, t \) - v \( x \, t \) \| & lt.eq C r #scale(x: 120%, y: 120%)[\(] L \( K \) + \| log r \|
   #scale(x: 120%, y: 120%)[\)] &  & \( \| h \| lt.eq r \) \,\
\| v \( x \, t + tau \) - v \( x \, t \) \| & lt.eq C \| tau \| #scale(x: 120%, y: 120%)[\(] L \( K \) + \| log \|
  tau \| \| #scale(x: 120%, y: 120%)[\)]^2 &  & \( 0 < \| tau \| lt.eq 1 / 2 \) . $ <eq:spatial-fit-modulus>]

 For either fixed choice of center, every sequence of centered members has a locally uniformly convergent
   subsequence, and its limit belongs to $cal(A)_(m \, C_0)$ and is centered at that same point.
   Moreover, on every compact time interval these members have uniformly subquadratic growth in $x$:
#[#set math.equation(numbering: n => "(4.5)")
 $ lim_(M arrow.r oo) med sup_(v upright(" centered")\
\| x \| gt.eq M \, med t in J) frac(\| v \( x \, t \) \|, \| x \|^2) =
  0 wide \( J subset.double bb(R) \) . $ <eq:uniform-subquadratic-growth>]

]
] <lem:fit-compactness>

#proof[
  We prove the estimates for centering at the origin. Translation by one unit in time gives the other case after
    enlarging the boxes by a fixed factor.
  First compare two fits $\( p \, a \) \, \( p' \, a' \)$ at the same center,
    with radii $R$ and $R' in \[ R \, 2 R \]$. On the horizontal slice $ell = 0$,
    both estimates hold for $\| h \| lt.eq R$, so $\| p - p' \| lt.eq 3 C_0 lt.eq 4 C_0$. Write
  $ ell_(p \, a) \( h \, ell \) = p dot.op h + (a - frac(\| p \|^2, 2)) ell . $
  With $c = \( 2 + 8 C_0 \)^(- 1)$, the point $\( p c R \, c R \)$ lies in both sheared boxes. At this point
  $ \( ell_(p \, a) - ell_(p' \, a') \) \( p c R \, c R \) = (a - a' + frac(\| p - p' \|^2, 2)) c R . $
  The two fitting errors sum to at most $3 C_0 R$. It follows that $\| a - a' \| lt.eq 3 C_0 \/ c + 8 C_0^2$.
    Thus the differences of both parameters are bounded by one constant whenever the radii differ by at most a
    factor of two. Comparing along successive dyadic radii with the centered fit of radius $1$ gives,
    for every fit at the origin of radius $r$,
  #[#set math.equation(numbering: n => "(4.6)")
   $ \| p \| + \| a \| lt.eq C \( 1 + \| log r \| \) . $ <eq:origin-fit-bound>]
  Fix $K gt.eq 2$. Choose once and for all a sufficiently large constant $A = A \( m \, C_0 \)$ and set $R =
    A K L \( K \)$. If $\( p_R \, a_R \)$ is any fit of radius $R$ at the origin,
    then $cal(B)_K$ lies in its sheared box with
  $ \| t \| lt.eq R \/ 4 \, wide \| x - p_R t \| lt.eq R \/ 4 . $
  Indeed, (4.6) bounds the latter offset by $K \( 1 + C \( 1 + log R \) \)$, while $log R lt.eq log A +
    2 L \( K \)$. Since $L \( K \) gt.eq 1$, the asserted two inequalities hold for all $K gt.eq
    2$ once $A$ is chosen larger than a fixed multiple of $1 + log A$.
    Such a choice is possible because $log A \/ A arrow.r 0$. The fit at radius $R$ now gives
  $ \| v \( x \, t \) \| lt.eq C_0 R + \| p_R \| K + (\| a_R \| + frac(\| p_R \|^2, 2)) K lt.eq C K L \( K \)^2 \, $
  which is (4.2).
  Let $z = \( x \, t \) in cal(B)_K$, and compare a fit $\( p_z \, a_z \)$ of radius $R$ at $z$ with the enclosing
    fit $\( p_R \, a_R \)$. For horizontal increments of length at most $R \/ 2$ from $z$,
    the enclosing estimate can be subtracted at the two endpoints, with error at most $2 C_0 R$.
    Comparison with the fit at $z$ therefore gives $\| p_z - p_R \| lt.eq 6 C_0$.
    Set $c' = \( 4 \( 1 + 6 C_0 \) \)^(- 1)$. The increments $\( p_z c' R \, c' R \)$ from $z$ remain in both
    boxes: in the enclosing box the transverse offset is at most $R \/ 4 + 6 C_0 c' R lt.eq R \/ 2$,
    and the time offset is at most $R \/ 2$. The same affine-increment identity used above gives a bound on $\|
    a_z - a_R \|$ depending only on $C_0$. Hence $\| p_z \| + \| a_z \| lt.eq C L \( K \)$.
    Dyadic comparisons at $z$, from radius $R$ to an arbitrary radius $r$, give
  $ \| p \| + \| a \| lt.eq C L \( K \) + C \( 1 + \| log \( r \/ R \) \| \) lt.eq
    C #scale(x: 120%, y: 120%)[\(] L \( K \) + \| log r \| #scale(x: 120%, y: 120%)[\)] \, $
  as claimed. These comparisons apply to every choice of fit.
  Using a fit of radius $r$ on the horizontal slice proves (4.4).
    For a time increment $tau$ with $0 < \| tau \| lt.eq 1 \/ 2$, put $B =
    L \( K \) + \| log \| tau \| \|$ and choose the fit radius $r = A' \| tau \| B$.
    Here $A'$ is a constant to be fixed, independent of $K$ and $tau$. Since $B gt.eq 1$,
  $ \| log r \| lt.eq \| log \| tau \| \| + log A' + log B lt.eq 2 B + log A' . $
  The fit-parameter bound consequently gives $\| p \| lt.eq C \( 3 + log A' \) B$.
    Choose $A' gt.eq 1$ sufficiently large that $A' gt.eq C \( 3 + log A' \)$.
    This choice is possible and is made before $K$ and $tau$ vary.
    Then $\| tau \| lt.eq r$ and $\| p tau \| lt.eq r$, so the vertical increment lies in the fitted box.
    In that estimate, the affine time coefficient and error are bounded by
  $ (\| a \| + frac(\| p \|^2, 2)) \| tau \| + C_0 r lt.eq C \| tau \| B^2 . $
  This proves (4.4).
  The two moduli, applied successively to a spatial and a time increment in a slightly larger box,
    give equicontinuity on compact sets. The growth bound gives local uniform boundedness.
    Arzelà–Ascoli and a diagonal choice of subsequence therefore give local uniform convergence.
    To pass an upper viscosity test to the limit, add a positive fourth-order term at its contact,
    preserving its first and second derivatives and making the contact strict on a small closed ball.
    Maxima of the sequence minus this modified test on that ball converge to the contact,
    so they are interior for large indices. The viscosity inequalities there pass to the limit by continuity of
    $F$. Subtracting the fourth-order term and using minima treats a lower test.
    To pass the fits, fix one center and one radius $r$. By (4.3),
    pass to a further subsequence of the corresponding fits with $\( p_j \, a_j \) arrow.r \( p \, a \)$.
    For a point with $\| ell \| lt.eq r$ and $\| h - p ell \| lt.eq r$,
    use in the $j$th fitted box the increment $h_j = p_j ell + \( h - p ell \)$.
    It converges to $h$ and belongs to that closed box. Local uniform convergence gives the limiting inequality.
    This subsequence may depend on the fixed center and radius,
    which is sufficient for existence of a fit at each such pair. The centered fit passes directly to the limit.
    Finally, for $t$ in a fixed compact interval, (4.2) gives a bound of the form
    $C_J \( 1 + \| x \| \) \( 1 + log \( 2 + \| x \| \) \)^2$, uniformly in the centered class.
    Dividing by $\| x \|^2$ proves (4.5). ◻
]

If a family instead has one common prescribed value and one common fit at a fixed center and radius,
  one fixed change of frame (4.1) reduces it to the centered case.
  The corresponding local bounds and compactness hold with constants also depending on those prescribed data.

=== 4.2 Quadratic envelopes and their slopes <quadratic-envelopes-and-their-slopes>

Let $I subset.eq bb(R)$ be an open interval. We say that a continuous function $f$ on $bb(R)^m times
  I$ has #emph[subquadratic spatial growth on compact time intervals] if, for every $J subset.double I$,

$ lim_(M arrow.r oo) sup_(\| x \| gt.eq M\
t in J) frac(\| f \( x \, t \) \|, \| x \|^2) = 0 . $

For $ell > 0$, with the indicated time argument in $I$, define

#[#set math.equation(numbering: n => "(4.7)")
 $ cal(P)_ell f \( x \, t \) & = sup_y {f \( y \, t + ell \) - frac(\| y - x \|^2, 2 ell)} \,\
cal(M)_ell f \( x \, t \) & = inf_y {f \( y \, t - ell \) + frac(\| y - x \|^2, 2 ell)} . $ <eq:envelope-definitions>]

Set $cal(P)_0 f = cal(M)_0 f = f$. The following quadratic slice comparisons are useful for the limiting equation;
  compare [9] Section 3. Convexity of Hamilton–Jacobi envelopes also appears in the comparison theory of
  Armstrong, Crandall, Julin, and Smart [1] Proposition 2.3.
  Their Hamiltonian hypotheses do not cover the limiting equation here; we prove the required properties directly.
  For a fixed center, convexity in the length will give monotone envelope slopes.
  The moving-center form records the cost of shifting the center;
  its midpoint inequality will control velocity differences in Section 6.

#thm([Lemma 4.3.])[
  (Quadratic envelopes).  #emph[Suppose that $f$ has the preceding growth property.
    The extrema in (4.7) are attained. The envelopes are continuous jointly in their center and length,
    including length zero wherever the time arguments remain in $I$. Whenever the expressions are defined,
#[#set math.equation(numbering: n => "(4.8)")
 $ cal(P)_ell \( cal(P)_h f \) = cal(P)_(ell + h) f \, wide cal(M)_ell \( cal(M)_h f \) =
   cal(M)_(ell + h) f . $ <eq:envelope-composition>]

 If $f$ is a viscosity subsolution of (3.1), then, for every affine path $x \( ell \) = x_0 +
   d ell$ and every fixed $t$,
#[#set math.equation(numbering: n => "(4.9)")
 $ ell mapsto cal(P)_ell f \( x \( ell \) \, t \) + \| d \|^2 ell log ell quad
   upright("is convex") $ <eq:path-envelope-convexity>]

 on its allowed range $ell gt.eq 0$, with $ell log ell = 0$ at zero.
   In particular $ell mapsto cal(P)_ell f \( x \, t \)$ is convex.
   If $f$ is a viscosity supersolution, then $ell mapsto cal(M)_ell f \( x \, t \)$ is concave.
   If $f_j in C \( bb(R)^m times I \)$, $f_j arrow.r f$ locally uniformly, and
$ lim_(M arrow.r oo) sup_j sup_(\| y \| gt.eq M\
t in J) frac(\| f_j \( y \, t \) \|, \| y \|^2) = 0 wide \( J subset.double I \) \, $

 then $cal(P)_ell f_j arrow.r cal(P)_ell f$ and $cal(M)_ell f_j arrow.r
   cal(M)_ell f$ locally uniformly in the allowed centers and positive lengths.]
] <lem:quadratic-envelopes>

#proof[
  Fix a compact range of centers and of allowed positive lengths.
    Uniform subquadratic growth and the quadratic cost force all maximizers and minimizers into a common bounded
    spatial set. They exist there, and the maximum and minimum of a continuous function over this fixed compact
    set depend continuously on the parameters. The same bounded-set conclusion holds when the length varies in
    $\( 0 \, ell_0 \]$. On that set the values of $f$ are bounded.
    Comparison with the competitor $y = x$ then gives $\| y - x \|^2 lt.eq
    C ell$ for an optimizer as $ell arrow.b 0$. Uniform continuity of $f$ on the compact set gives convergence to
    $f \( x \, t \)$ locally uniformly, as well as $y arrow.r x$ locally uniformly.
    This proves continuity at zero. The composition identities follow by optimizing first over the intermediate
    point and using
  $ inf_y {frac(\| y - x \|^2, 2 ell) + frac(\| z - y \|^2, 2 h)} = frac(\| z - x \|^2, 2 \( ell + h \)) . $
  For the convexity assertion, let $g \( ell \) = cal(P)_ell f \( x \( ell \) \, t \)$,
    and let a smooth function $psi$ touch $g$ from above at $ell_0 > 0$. Choose an optimizer $y_0$ at that length.
    After a constant adjustment,
  $ Psi \( y \, ell \) = psi \( ell \) + frac(\| y - x \( ell \) \|^2, 2 ell) $
  touches $\( y \, ell \) mapsto f \( y \, t + ell \)$ from above at $\( y_0 \, ell_0 \)$.
    Put $q = \( y_0 - x \( ell_0 \) \) \/ ell_0$, which is the horizontal gradient of $Psi$ there.
    Along the direction $\( q \, 1 \)$, the Hessian of the quadratic term has value $\| d \|^2 \/ ell_0$.
    For example, writing $r = y - x \( ell \)$, its value along a direction with $r$-velocity $q -
    d$ is $ell_0^(- 1) \| q - d - r \/ ell_0 \|^2 = \| d \|^2 \/ ell_0$.
    The viscosity inequality gives $psi'' \( ell_0 \) + \| d \|^2 \/ ell_0 gt.eq 0$.
    Thus every upper test for $g \( ell \) + \| d \|^2 ell log
    ell$ has nonnegative second derivative at positive lengths.
    This is the one-dimensional viscosity criterion for convexity.
    To see it directly, a failure of convexity on $\[ a \, b \]$ lets one place a strictly concave quadratic above
    the chord but below the function somewhere; the positive maximum of their difference yields an upper test with
    negative second derivative. Continuity at zero extends the convexity to that endpoint.
  Finally, the map $tilde(f) \( x \, t \) = - f \( x \, - t \)$ exchanges subsolutions and supersolutions of
    (3.1), as pullback reverses the sign of $F$. It also gives $cal(P)_ell tilde(f) \( x \, t \) = -
    cal(M)_ell f \( x \, - t \)$. The assertion for $cal(M)$ follows.
  For the last convergence assertion, fix a compact range of allowed centers and positive lengths.
    The common subquadratic bound and the local uniform bounds confine every optimizer for $f_j$ and for $f$ to
    one compact spatial set, by the first argument of the proof.
    On that set the functions inside the supremum and infimum converge uniformly.
    Their extrema therefore converge uniformly on the chosen parameter range. ◻
]

For a positive allowed length define the two slopes

#[#set math.equation(numbering: n => "(4.10)")
 $ cal(S)_ell^(+) f \( z \) = frac(cal(P)_ell f \( z \) - f \( z \), ell) \, wide cal(S)_ell^(-) f \( z \) =
   frac(f \( z \) - cal(M)_ell f \( z \), ell) . $ <eq:envelope-slopes>]

For a smooth function, the quantity $H_(upright("sm")) = f_t + \| nabla_x f \|^2 \/ 2$ satisfies

$ F \[ f \] = \( partial_t + nabla_x f dot.op nabla_x \) H_(upright("sm")) . $

For the exact affine model $f \( x \, t \) = p dot.op x + \( a - \| p \|^2 \/ 2 \) t + c$ in (3.2),
  one has $H_(upright("sm")) = a$, and direct optimization gives

$ cal(P)_ell f = f + a ell \, wide cal(M)_ell f = f - a ell . $

The optimizing displacements are respectively $ell p$ and $- ell p$.
  Thus both envelope slopes equal $a$, and both optimizer velocities, directed toward increasing time, equal $p$.
  These identifications concern the exact affine model; for a general fitted solution, $p \,
  a$ remain the parameters of the chosen fit. For a general smooth function,
  a first-order expansion of the two quadratic optimizations formally gives $cal(S)_ell^plus.minus f =
  H_(upright("sm")) + o \( 1 \)$ as $ell arrow.b 0$. For a smooth solution the identity for $F \[ f \]$ transports
  this quantity along the direction $\( nabla_x f \, 1 \)$; its value may depend on the integral curve.
  The next lemma supplies the slope statements used for continuous solutions.

Evans and Savin [9] Theorem 3.1 proved the corresponding slope monotonicity and equality of the finite limits at a
  fixed center under their local boundedness and Lipschitz assumptions.
  The following formulation uses envelopes on the full spatial domain under subquadratic growth,
  separates the subsolution and supersolution conclusions, and allows the common limit to be $- oo$.

#thm([Lemma 4.4.])[
  (Envelope slopes).  #emph[For a subsolution $f$ as in Lemma 16,
    $cal(S)_ell^(+) f \( z \)$ is nondecreasing in $ell$ and
#[#set math.equation(numbering: n => "(4.11)")
 $ limsup_(ell arrow.b 0) cal(S)_ell^(-) f \( z \) lt.eq lim_(ell arrow.b 0) cal(S)_ell^(+) f \( z \) .
   $ <eq:subsolution-slope-order>]

 The right side may equal $- oo$. For a supersolution, $cal(S)_ell^(-) f \( z \)$ is nondecreasing and
$ limsup_(ell arrow.b 0) cal(S)_ell^(+) f \( z \) lt.eq lim_(ell arrow.b 0) cal(S)_ell^(-) f \( z \) . $

 Consequently, for a solution both slopes are nondecreasing and
#[#set math.equation(numbering: n => "(4.12)")
 $ lim_(ell arrow.b 0) cal(S)_ell^(+) f \( z \) = lim_(ell arrow.b 0) cal(S)_ell^(-) f \( z \) = :
   H_f \( z \) in \[ - oo \, oo \) . $ <eq:hamiltonian>]

 The function $H_f$ is upper semicontinuous.]
] <lem:envelope-slopes>

#proof[
  Convexity of $cal(P)_ell f \( z \)$, with value $f \( z \)$ at zero, gives the first monotonicity.
    Let $tilde(z)_ell = \( y_ell \, t - ell \)$ be a backward optimizing point for $cal(M)_ell f \( z \)$.
    Using $z$ as a forward competitor from $tilde(z)_ell$ gives
  $ cal(S)_ell^(-) f \( z \) lt.eq cal(S)_ell^(+) f \( tilde(z)_ell \) . $
  The optimizer localization at length zero in Lemma 16 shows $tilde(z)_ell arrow.r z$.
    Fix a small $h > 0$ whose forward time argument is allowed near $z$.
    For all sufficiently small $ell < h$, monotonicity bounds the right side by $cal(S)_h^(+)
    f \( tilde(z)_ell \)$. Continuity for fixed $h$ gives an upper limit at most $cal(S)_h^(+) f \( z \)$.
    Now let $h arrow.b 0$ to obtain (4.11). This order of limits also covers the value $- oo$.
  Apply this conclusion to $tilde(f) \( x \, t \) = - f \( x \, - t \)$ to obtain the supersolution statements.
    For a solution both monotone limits exist and the two inequalities identify them.
    Each is bounded above by the finite slope at any fixed positive allowed length, proving the range in (4.12).
    Locally in $z$, choose a common small range of lengths. The common limit is the infimum of the continuous
    functions $cal(S)_ell^(+) f \( z \)$ over that range, so it is upper semicontinuous. ◻
]

#thm([Lemma 4.5.])[
  (Bounds for fitted solutions).  #emph[For a member $v in cal(A)_(m \, C_0)$ centered at $\( 0 \, 0 \)$ or
    $\( 0 \, 1 \)$, $K gt.eq 2$, $z in cal(B)_K$, and $0 < ell lt.eq K$, one has
#[#set math.equation(numbering: n => "(4.13)")
 $ cal(S)_ell^(+) v \( z \) lt.eq C L \( K \)^4 \, wide cal(S)_ell^(-) v \( z \) lt.eq
   C L \( K \)^4 . $ <eq:envelope-slope-bound>]

 Every optimizing displacement for $cal(P)_K v \( z \)$ or $cal(M)_K v \( z \)$ has length at most $C K L \( K \)^2$.]
] <lem:fitted-envelope-bounds>

#proof[
  By Lemma 17, it suffices to bound the two slopes at length $K$.
    Suppose an optimizing displacement has length $B K$ with $B gt.eq 2$.
    Comparing its value with the competitor having no displacement,
    and using (4.2) in a box of size $\( B + 2 \) K$, gives
  $ frac(B^2 K, 2) lt.eq C B K #scale(x: 120%, y: 120%)[\(] L \( K \) + log B #scale(x: 120%, y: 120%)[\)]^2 . $
  This estimate holds for the supremum and for the infimum.
    Consequently $B lt.eq C \( L \( K \) + log B \)^2 lt.eq 2 C L \( K \)^2 + 2 C \( log B \)^2$.
    Choose a fixed $B_0$ so large that $2 C \( log B \)^2 lt.eq B \/ 2$ for $B gt.eq B_0$.
    The last inequality then yields $B lt.eq 4 C L \( K \)^2$ for $B gt.eq B_0$,
    and the same type of bound holds when $B < B_0$. This proves the displacement claim.
    The optimizer and its time argument now lie in a box of size $C K L \( K \)^2$.
    Applying (4.2) there and observing that $L \( C K L \( K \)^2 \) lt.eq
    C L \( K \)$ bounds the absolute values of $v$ there by $C K L \( K \)^4$.
    Dropping the nonpositive cost in the expressions for the two slopes gives (4.13). ◻
]

The criterion for the final limit is proved in Lemma 28: if $v in cal(A)_(m \, C_0)$ and there are $\( b \, t_0 \)
  in bb(R)^m times bb(R)$ and $B in bb(R)$ such that

$ cal(S)_ell^(+) v \( b \, t_0 \) = cal(S)_ell^(-) v \( b \, t_0 \) = B wide upright("for every ") ell > 0 \, $

then $v$ is affine. The remaining argument will construct such a limit while retaining an obstruction to affinity.

== 5 An extremal horizontal defect and contact <sec:envelope-contact>

We next turn a nonaffine member of $cal(A)_(m \, C_0)$ into a contact between a solution and a subsolution.
  A finite horizontal probability configuration consists of positions $y_1 \, dots.h \,
  y_N in bb(R)^m$ and weights $theta_i > 0$ with $sum_i theta_i = 1$. Its mean and root mean square radius are

$ x = sum_i theta_i y_i \, wide r = (sum_i theta_i \| y_i - x \|^2)^(1 \/ 2) . $

=== 5.1 The barycentric envelope <the-barycentric-envelope>

Let $I subset.eq bb(R)$ be an open interval. For a continuous function $f$ on $bb(R)^m times
  I$ with subquadratic spatial growth on compact time intervals, define, for $s > 0$,

#[#set math.equation(numbering: n => "(5.1)")
 $ cal(C)_s f \( x \, t \) = sup_(N \, med theta_i > 0 \, med sum_i theta_i = 1\
sum_i theta_i y_i = x) {sum_i theta_i f \( y_i \, t \) - frac(sum_i theta_i \| y_i - x \|^2, 2 s)} .
  $ <eq:barycentric-envelope>]

The supremum is over finite configurations, including the single point $y_1 = x$.
  This operation averages one horizontal slice at the fixed time $t$; $s$ controls the variance penalty.
  As the next lemma shows, $cal(C)_s f \( dot.op \, t \) - \|
  dot.op \|^2 \/ \( 2 s \)$ is the least concave majorant of $f \( dot.op \, t \) - \| dot.op \|^2 \/ \( 2 s \)$.

For the following estimate, suppose additionally that some $kappa gt.eq 0$ satisfies

#[#set math.equation(numbering: n => "(5.2)")
 $ sum_i theta_i f \( y_i \, t \) - f \( x \, t \) lt.eq kappa r $ <eq:jensen-bound>]

for every $t in I$ and every finite horizontal probability configuration, with mean $x$ and radius $r$. Since

$ kappa r - frac(r^2, 2 s) = frac(kappa^2 s, 2) - frac(\( r - kappa s \)^2, 2 s) \, $

the definition gives

#[#set math.equation(numbering: n => "(5.3)")
 $ 0 lt.eq cal(C)_s f \( x \, t \) - f \( x \, t \) lt.eq sup_(r gt.eq 0) (kappa r - frac(r^2, 2 s)) =
   frac(kappa^2 s, 2) . $ <eq:barycentric-sandwich>]

The scalar maximum occurs at $r = kappa s$. The extremal construction below supplies a solution $v$ and a positive
  $kappa$ attaining this bound. We will prove that $cal(C)_t v - kappa^2 t \/ 2$ is a subsolution for $t > 0$;
  the sandwich places it below $v$, with contact where equality holds and a strictly positive unshifted gap.
  The additional Jensen assumption applies only to this estimate;
  the next lemma uses only the stated continuity and growth hypotheses.

#thm([Lemma 5.1.])[
  (Barycentric envelope).  #emph[Let $f$ have the preceding growth property on $bb(R)^m times I$.
    For $s > 0$ the supremum in (5.1) is attained by a finite configuration, and
#[#set math.equation(numbering: n => "(5.4)")
 $ cal(C)_s f \( x \, t \) - frac(\| x \|^2, 2 s) = min_(A in bb(R)^m) med max_(y in bb(R)^m) {f \( y \, t \) -
   frac(\| y \|^2, 2 s) - A dot.op \( y - x \)} . $ <eq:barycentric-duality>]

 Both extrema on the right are attained. Allowing any probability measure of finite second moment and mean $x$ in
   (5.1) gives the same value. The function $cal(C)_s f \( x \, t \)$ is continuous in $\( x \, t \, s \)$ for
   $s > 0$, and
#[#set math.equation(numbering: n => "(5.5)")
 $ x mapsto cal(C)_s f \( x \, t \) - frac(\| x \|^2, 2 s) quad
   upright("is concave") . $ <eq:barycentric-semiconcavity>]

 If $f_j in C \( bb(R)^m times I \)$, $f_j arrow.r f$ locally uniformly, and the sequence has the common growth control
$ lim_(M arrow.r oo) sup_j sup_(\| y \| gt.eq M\
t in J) frac(\| f_j \( y \, t \) \|, \| y \|^2) = 0 wide \( J subset.double I \) \, $

 then $cal(C)_s f_j arrow.r cal(C)_s f$ locally uniformly for $s > 0$.]
] <lem:barycentric-envelope>

#proof[
  For fixed $\( t \, s \)$ put $g \( y \) = f \( y \, t \) - \| y \|^2 \/ \( 2 s \)$ and
  $ Gamma \( A \; x \, t \, s \) = sup_y { g \( y \) - A dot.op \( y - x \) } . $
  The expression on the left of (5.4) is the supremum of $sum_i theta_i
    g \( y_i \)$ over configurations of mean $x$, because $sum_i theta_i \| y_i - x \|^2 =
    sum_i theta_i \| y_i \|^2 - \| x \|^2$. It is therefore at most $inf_A Gamma \( A \; x \, t \, s \)$.
  Fix a compact range of $\( x \, t \, s \)$ with $s > 0$. For $A eq.not 0$, use $y = x -
    A \/ \| A \|$ in the supremum to get $Gamma \( A \; x \, t \, s \) gt.eq \| A \| - C$ on this range.
    The value at $A = 0$ is uniformly bounded above, since the negative quadratic part of $g$ dominates the
    subquadratic growth of $f$. Thus every minimizing sequence whose values are at most $Gamma \( 0 \) +
    1$ lies in a fixed bounded set of slopes. For slopes in that set, the quantity $g \( y \) -
    A dot.op \( y - x \)$ tends uniformly to $- oo$ as $\| y \| arrow.r oo$.
    Its maximizing positions therefore lie in one compact set.
    It follows that $Gamma$ is continuous on the relevant set, the minimum and maxima are attained,
    and their value depends continuously on $\( x \, t \, s \)$.
  Let $A_0$ be a minimizing slope, and let $E$ be its nonempty compact set of maximizing positions.
    Then $x$ belongs to the convex hull of $E$. Otherwise strict separation gives a vector $e$ and $delta >
    0$ with $e dot.op \( y - x \) gt.eq delta$ for all $y in E$.
    If $y_h$ maximizes $Gamma \( A_0 + h e \; x \, t \, s \)$ for $h > 0$,
    the uniform compactness of maximizers and continuity show that every limit of $y_h$ as $h arrow.b
    0$ belongs to $E$. For small $h$, $e dot.op \( y_h - x \) gt.eq delta \/ 2$, and hence
  $ Gamma \( A_0 + h e \; x \, t \, s \) lt.eq Gamma \( A_0 \; x \, t \, s \) - h delta \/ 2 \, $
  contradicting minimality. The finite-dimensional convex hull theorem now represents $x$ as a convex combination
    of finitely many points of $E$. Discard any zero weights.
    Their weighted values of $g$ equal $Gamma \( A_0 \; x \, t \, s \)$,
    proving the reverse inequality in (5.4) and finite attainment in (5.1).
  The affine majorant $g \( y \) lt.eq Gamma \( A_0 \; x \, t \, s \) +
    A_0 dot.op \( y - x \)$ can also be integrated against any probability measure of mean $x$ and finite second
    moment. All terms are integrable by the growth hypothesis. Thus such measures cannot increase the value.
    The right side of (5.4) is an infimum of affine functions of $x$, so it is concave in $x$. This is (5.5).
  For the convergence assertion, on each compact range of $\( x \, t \, s \)$ the same preceding bounds on slopes
    and maximizing positions hold uniformly for $f_j$: local uniform convergence gives common bounds near the
    compact range, and the common subquadratic control handles large $y$.
    Both extrema in (5.4) can therefore be restricted to fixed compact sets.
    On these sets the expressions converge uniformly, proving the asserted local uniform convergence. ◻
]

=== 5.2 A common-time subsolution rule <a-common-time-subsolution-rule>

To test the barycentric envelope, we must combine subsolution inequalities at several spatial points sharing one
  time variable. Lemma 6 is applied after separating and then synchronizing those times;
  the penalty Hessian vanishes on the direction with time speed $1$ in every component,
  which is the direction used by $F$.

#thm([Lemma 5.2.])[
  (Common-time subsolutions).  #emph[Let $v$ be a continuous viscosity subsolution of (3.1) on $bb(R)^m times I$,
    and fix positive weights $theta_i$ with $sum_(i = 1)^N theta_i = 1$. Define
$ V \( \( y_i \)_(i = 1)^N \, t \) = sum_(i = 1)^N theta_i v \( y_i \, t \) . $

 If a $C^2$ function $Phi$ touches $V$ from above at $\( Y_0 \, t_0 \)$, where $Y = \( y_i \)_(i = 1)^N$, then
#[#set math.equation(numbering: n => "(5.6)")
 $ D^2 Phi \( Y_0 \, t_0 \)
   [(#scale(x: 120%, y: 120%)[\(] theta_i^(- 1) nabla_(y_i) Phi \( Y_0 \, t_0 \)
   #scale(x: 120%, y: 120%)[\)]_(i = 1)^N \, 1)] gt.eq 0 . $ <eq:common-time-inequality>]

]
] <lem:common-time-subsolution>

#proof[
  Replace $Phi$ by $Phi^sharp = Phi + \| Y - Y_0 \|^4 + \| t - t_0 \|^4$.
    This makes the local maximum strict while preserving the derivatives through order two at the contact.
    Choose a small closed product neighborhood of $\( \( y_i^0 \, t_0 \) \)_(i = 1)^N$, contained in the domain,
    such that the diagonal points $\( Y \, t \)$ lie in this strict neighborhood.
    For independent time variables $T = \( t_1 \, dots.h \, t_N \)$, put
  $ macron(t) = 1 / N sum_i t_i \, wide chi \( T \) = 1 / 2 sum_i \( t_i - macron(t) \)^2 \, wide
    Psi_lambda \( Y \, T \) = Phi^sharp \( Y \, macron(t) \) + lambda chi \( T \) . $
  Maximize $sum_i theta_i v \( y_i \, t_i \) - Psi_lambda \( Y \, T \)$ on the closed product.
    Comparison with the original diagonal point and boundedness on this product show $lambda chi \( T_lambda \)
    lt.eq C$ at any maximum. Thus all time deviations tend to zero as $lambda arrow.r oo$.
    Every limit of such maximum points is diagonal; dropping the nonnegative penalty in the maximum inequality
    shows that its diagonal limit is a maximum of $V - Phi^sharp$.
    Strictness forces this limit to be $\( Y_0 \, t_0 \)$. Hence all the maximum points converge to the original
    point and are interior for sufficiently large $lambda$.
  Fix one such $lambda$ and one maximum. Set
  $ q_i = theta_i^(- 1) nabla_(y_i) Phi^sharp \( Y_lambda \, macron(t)_lambda \) \, wide
    zeta_lambda = \( \( q_i \, 1 \) \)_(i = 1)^N \, wide A_lambda = D^2 Psi_lambda \( Y_lambda \, T_lambda \) \, $
  where $A_lambda$ is written in the separate variables $\( \( y_i \, t_i \) \)_i$.
    Apply Lemma 6 to the functions $theta_i v \( y_i \, t_i \)$ and the test $Psi_lambda$.
    For every $eta > 0$ it supplies closed superjets with Hessians $X_i$ and first derivatives
    $D_(\( y_i \, t_i \)) Psi_lambda$, with $"diag" \( X_i \) lt.eq A_lambda + eta A_lambda^2$.
    Dividing each jet by the positive number $theta_i$ gives a closed superjet of $v$ with horizontal gradient
    $q_i$. The viscosity inequalities therefore give $X_i \[ \( q_i \, 1 \) \] gt.eq 0$.
    Evaluating the matrix inequality on $zeta_lambda$ yields
  $ 0 lt.eq sum_i X_i \[ \( q_i \, 1 \) \] lt.eq A_lambda \[ zeta_lambda \] + eta \| A_lambda zeta_lambda \|^2 . $
  First let $eta arrow.b 0$, keeping $lambda$ and its maximum fixed.
    The quantities $A_lambda$ and $zeta_lambda$ do not depend on $eta$, so $A_lambda \[ zeta_lambda \] gt.eq 0$.
    The time component of $zeta_lambda$ is $\( 1 \, dots.h \, 1 \)$, which is in the kernel of $D^2 chi$.
    The linear map $\( Y \, T \) mapsto \( Y \, macron(t) \)$ sends $zeta_lambda$ to $\( \( q_i \)_i \, 1 \)$.
    We conclude that
  $ D^2 Phi^sharp \( Y_lambda \, macron(t)_lambda \) \[ \( \( q_i \)_i \, 1 \) \] gt.eq 0 . $
  Now let $lambda arrow.r oo$. The maximum points converge to the contact,
    and the horizontal derivatives converge there. The derivatives of $Phi^sharp$ at that point are those of
    $Phi$, giving (5.6). The time components of the first derivatives of $Psi_lambda$ need no bound:
    they do not enter the direction $\( nabla_x v \, 1 \)$ in the individual viscosity inequalities. ◻
]

#thm([Corollary 5.3.])[
  (A barycentric subsolution).  #emph[Let $f in C \( bb(R)^m times \( 0 \, oo \) \)$ be a viscosity subsolution of
    (3.1) with subquadratic spatial growth on compact time intervals.
    Then $\( x \, t \) mapsto cal(C)_t f \( x \, t \)$ is a viscosity subsolution of (3.1) on $bb(R)^m
    times \( 0 \, oo \)$. For every $c in bb(R)$, the same holds for $\( x \, t \) mapsto cal(C)_t
    f \( x \, t \) - c t$.]
] <cor:barycentric-subsolution>

#proof[
  Continuity follows from Lemma 19. Fix $c in bb(R)$, and let $phi.alt$ touch $\( x \, t \) mapsto cal(C)_t
    f \( x \, t \) - c t$ from above at $\( x_0 \, t_0 \)$ with $t_0 > 0$.
    Choose an attaining finite configuration $\( theta_i \, y_i^0 \)$ for $cal(C)_(t_0) f \( x_0 \, t_0 \)$,
    and keep its positive weights fixed. For variable $Y = \( y_i \)_i$ let $X \( Y \) = sum_i theta_i y_i$ and define
  $ Phi \( Y \, t \) = phi.alt \( X \( Y \) \, t \) + c t + frac(sum_i theta_i \| y_i - X \( Y \) \|^2, 2 t) . $
  The defining supremum for $cal(C)_t$ shows that $sum_i theta_i f \( y_i \, t \) -
    Phi \( Y \, t \)$ has a local maximum at $\( Y_0 \, t_0 \)$:
    for nearby $\( Y \, t \)$ it is at most $cal(C)_t f \( X \( Y \) \, t \) - c t -
    phi.alt \( X \( Y \) \, t \)$, and equality holds at the chosen configuration.
    Set $p = nabla_x phi.alt \( x_0 \, t_0 \)$. The individual horizontal directions in Lemma 20 are
  $ q_i = theta_i^(- 1) nabla_(y_i) Phi = p + frac(y_i^0 - x_0, t_0) . $
  Their weighted mean is $p$. Along the straight motion with velocities $y'_i = q_i$ and $t' = 1$,
    the mean has velocity $p$ and each offset $y_i - X$ has velocity $\( y_i^0 - x_0 \) \/ t_0$.
    Consequently, along this motion the variance term is
  $ frac(sum_i theta_i \| \( y_i^0 - x_0 \) \( 1 + h \/ t_0 \) \|^2, 2 \( t_0 + h \)) =
    frac(t_0 + h, 2 t_0^2) sum_i theta_i \| y_i^0 - x_0 \|^2 \, $
  which is affine in $h$. The term $c t$ is also affine, and the Hessian of the remaining term along this motion
    is $D^2 phi.alt \[ \( p \, 1 \) \]$. Lemma 20, applied to the subsolution inequality for $f$,
    therefore gives $F \[ phi.alt \] \( x_0 \, t_0 \) gt.eq 0$.
    This proves the claim for every $c$, including $c = 0$. ◻
]

=== 5.3 Construction and slope of the contact <construction-and-slope-of-the-contact>

#thm([Proposition 5.4.])[
  (Extremal envelope contact).  #emph[If $cal(A)_(m \, C_0)$ contains a nonaffine member,
    then there exist $kappa in \( 0 \, oo \)$ and $v in cal(A)_(m \, C_0)$ centered at $z_(*) = \( 0 \, 1 \)$ for
    which (5.2) holds with $f = v$ and $I = bb(R)$. For $t > 0$ set
#[#set math.equation(numbering: n => "(5.7)")
 $ W \( x \, t \) = cal(C)_t v \( x \, t \) - frac(kappa^2 t, 2) . $ <eq:contact-envelope>]

 This function is continuous, has subquadratic spatial growth on compact positive-time intervals,
   and is a viscosity subsolution of (3.1) on $bb(R)^m times \( 0 \, oo \)$. It satisfies
#[#set math.equation(numbering: n => "(5.8)")
 $ v \( x \, t \) - frac(kappa^2 t, 2) lt.eq W \( x \, t \) lt.eq v \( x \, t \) quad \( t > 0 \) \, wide
   W \( z_(*) \) = v \( z_(*) \) = 0 \, $ <eq:contact-sandwich>]

 and $W \( dot.op \, t \) - \| x \|^2 \/ \( 2 t \)$ is concave for every $t > 0$.
   At every point of contact with $t > 0$, the barycentric gap satisfies
#[#set math.equation(numbering: n => "(5.9)")
 $ W \( x \, t \) = v \( x \, t \) quad arrow.r.double quad frac(cal(C)_t v \( x \, t \) - v \( x \, t \), t) =
   kappa^2 / 2 > 0 . $ <eq:contact-barycentric-gap>]

 Finally,
#[#set math.equation(numbering: n => "(5.10)")
 $ H_v \( z_(*) \) in bb(R) \, wide lim_(ell arrow.b 0) cal(S)_ell^(+) W \( z_(*) \) =
   H_v \( z_(*) \) . $ <eq:contact-slope>]

]
] <prop:envelope-contact>

#proof[
  #emph[A positive finite horizontal defect.] Start with a nonaffine member $v^(\( 0 \))$ and center it at the
    origin using Lemma 14. Some horizontal slice of $v^(\( 0 \))$ is nonaffine.
    To verify this, suppose instead that $v^(\( 0 \)) \( x \, t \) = p \( t \) dot.op x +
    c \( t \)$ for every $t$. The coefficients $p \, c$ are continuous,
    as follows by evaluating the function at $0$ and at the coordinate vectors. Direct optimization gives
  $ cal(P)_ell v^(\( 0 \)) \( x \, t \) = p \( t + ell \) dot.op x + c \( t + ell \) + ell /
    2 \| p \( t + ell \) \|^2 . $
  For every fixed $x \, t$ this is convex in $ell$. In each convexity inequality,
    the coefficient of $x$ must vanish, since the inequality holds for all $x in bb(R)^m$.
    Hence $p$ satisfies the affine interpolation identity on every interval, and so is affine in $t$.
    On the other hand, (4.2), applied at $x = plus.minus K e$ and $\| t \| lt.eq K$,
    implies $\| p \( t \) \| lt.eq C L \( K \)^2$. An affine function of $t$ with this bound as $K arrow.r
    oo$ is constant. For constant $p$, the displayed forward formula and its backward counterpart
  $ cal(M)_ell v^(\( 0 \)) \( x \, t \) = p dot.op x + c \( t - ell \) - ell / 2 \| p \|^2 $
  show that $c$ is both convex and concave. It is therefore affine, contradicting the choice of $v^(\( 0 \))$.
  A continuous nonaffine spatial slice has a nonzero midpoint Jensen defect,
    since the midpoint identity everywhere would make that slice affine.
    The transformation $f \( x \, t \) mapsto - f \( x \, - t \)$ preserves $cal(A)_(m \, C_0)$:
    it exchanges the two viscosity inequalities, and it sends a fit $\( p \, a \)$ to $\( - p \, a \)$.
    It also changes the sign of a horizontal Jensen defect. Apply this transformation if needed,
    so that $v^(\( 0 \))$ has a positive defect. Define
  #[#set math.equation(numbering: n => "(5.11)")
   $ kappa = sup_(t \, med upright("finite configurations")\
r > 0) frac(sum_i theta_i v^(\( 0 \)) \( y_i \, t \) - v^(\( 0 \)) \( x \, t \), r) . $ <eq:jensen-supremum>]
  Then $kappa > 0$. It is finite as well. For any configuration in this supremum,
    choose a fit at its mean $\( x \, t \)$ of radius $r$ and use (4.1) with these data.
    At time zero the new positions are $\( y_i - x \) \/ r$, with mean zero and second moment one.
    The defect divided by $r$ is unchanged, since the affine terms cancel in the weighted difference.
    The new function is centered. Its growth bound implies $\| macron(v) \( y \, 0 \) \| lt.eq
    C \( 1 + \| y \|^2 \)$, with one constant for all these normalizations.
    Integrating this inequality over a configuration of second moment one bounds the quotient by a fixed constant.
    Thus $0 < kappa < oo$. More generally, (4.1) preserves every such quotient, at every time:
    spatial differences and their root mean square radius both scale by $R$, and the subtracted affine terms cancel.
  #emph[Attainment after compactness.] Choose configurations whose quotients in (5.11) tend to $kappa$,
    and for each one make the normalization just described. Denote the resulting functions by $v_j$ and the
    normalized finite probability measures by $mu_j$. Then
  $ v_j \( 0 \, 0 \) = 0 \, wide integral y thin d mu_j = 0 \, wide integral \| y \|^2 thin d mu_j = 1 \, wide
    integral v_j \( y \, 0 \) thin d mu_j arrow.r kappa . $
  Every $v_j$ is centered at the origin, and every finite configuration for it satisfies the Jensen bound with
    constant $kappa$. First use Lemma 15 to pass to a locally uniform limit $hat(v) in cal(A)_(m \, C_0)$,
    centered at the origin. The Jensen bound passes to this limit for each fixed finite configuration.
  The moment bound gives $mu_j \( { \| y \| > M } \) lt.eq M^(- 2)$, so the measures are tight.
    After a further subsequence they converge weakly to a probability measure $mu$.
    Lower semicontinuity of the second moment gives $integral \| y \|^2 thin d mu lt.eq 1$. The mean remains zero:
    the bound $integral_(\| y \| > M) \| y \| thin d mu_j lt.eq
    M^(- 1)$ makes the first moments uniformly integrable, and the same bound holds for the limit.
    To retain the extremal defect, we also need convergence of the value integrals despite the varying functions
    and measures. For a compactly supported continuous cutoff $chi_M$,
    local uniform convergence and weak convergence give
  $ integral chi_M \( y \) v_j \( y \, 0 \) thin d mu_j arrow.r integral chi_M \( y \) hat(v) \( y \, 0 \) thin d mu . $
  Choose $chi_M = 1$ on ${ \| y \| lt.eq M }$ and zero outside ${ \| y \| < 2 M }$. By (4.5),
  $ integral_(\| y \| > M) \| v_j \( y \, 0 \) \| thin d mu_j lt.eq sup_(j\
\| y \| > M) frac(\| v_j \( y \, 0 \) \|, \| y \|^2) integral \| y \|^2 thin d mu_j arrow.r 0 $
  uniformly in $j$; the analogous tail bound holds for $hat(v)$ and $mu$.
    Letting first $j arrow.r oo$ and then $M arrow.r oo$ proves
  #[#set math.equation(numbering: n => "(5.12)")
   $ integral y thin d mu = 0 \, wide integral \| y \|^2 thin d mu lt.eq 1 \, wide
     integral hat(v) \( y \, 0 \) thin d mu - hat(v) \( 0 \, 0 \) = kappa . $ <eq:extremal-measure>]
  Apply (5.3) to $hat(v)$. By Lemma 19, the measure in (5.12) is admissible for the value of $cal(C)_(1 \/ kappa)
    hat(v) \( 0 \, 0 \)$. It gives
  $ cal(C)_(1 \/ kappa) hat(v) \( 0 \, 0 \) - hat(v) \( 0 \, 0 \) gt.eq kappa - kappa /
    2 integral \| y \|^2 thin d mu gt.eq kappa / 2 . $
  This is equality by (5.3). In particular, loss of second moment in the weak limit causes no loss of contact;
    the equality also forces $integral \| y \|^2 thin d mu = 1$.
  Set $R = 1 \/ kappa$, and choose a fit $\( p_0 \, a_0 \)$ for $hat(v)$ at $\( 0 \, 0 \)$ of radius $R$.
    Define the final function by the single change of frame and time translation
  $ v \( y \, t \) = frac(hat(v) \( R \( y + p_0 \( t - 1 \) \) \, R \( t - 1 \) \) - hat(v) \( 0 \, 0 \), R) -
    p_0 dot.op y - (a_0 + frac(\| p_0 \|^2, 2)) \( t - 1 \) . $
  It is centered at $\( 0 \, 1 \)$ and still has the global Jensen bound with constant $kappa$.
    Under the change of frame (4.1), at corresponding points $Z$ and $\( y \, s \)$ the envelope gaps obey
  $ cal(C)_sigma macron(v) \( y \, s \) - macron(v) \( y \, s \) =
    frac(cal(C)_(R sigma) hat(v) \( Z \) - hat(v) \( Z \), R) . $
  This follows by scaling the spatial variance by $R^2$ in (5.1); the affine terms again cancel.
    The preceding equality at parameter $1 \/ kappa = R$ therefore becomes
  #[#set math.equation(numbering: n => "(5.13)")
   $ cal(C)_1 v \( 0 \, 1 \) - v \( 0 \, 1 \) = kappa^2 / 2 . $ <eq:normalized-envelope-contact>]
  #emph[The subsolution below $v$.] Define $W$ by (5.7). Equations (5.3) and (5.13) give (5.8).
    At any contact, (5.7) also gives (5.9). Lemma 19 gives continuity and the stated spatial semiconcavity.
    The sandwich and (4.5) give subquadratic spatial growth on every compact positive-time interval.
    Since $v$ is a solution with the growth in (4.5), Corollary 21, with $f = v$ and $c = kappa^2 \/ 2$,
    gives the subsolution property of $W$.
  #emph[A finite slope at the contact.] Lemma 17 already bounds $H_v$ above at every point.
    We first bound it below at the finitely many points supporting the extremal configuration,
    using one common forward paraboloid, and then transfer this bound to their barycenter through equality in the
    Jensen bound. Choose a finite attaining configuration in (5.13), with mean $x = 0$, radius $r$,
    and positive weights. If $D = sum_i theta_i v \( y_i \, 1 \) - v \( 0 \, 1 \)$,
    its attainment and the Jensen bound imply
  $ kappa^2 / 2 = D - r^2 / 2 lt.eq kappa r - r^2 / 2 = kappa^2 / 2 - frac(\( r - kappa \)^2, 2) . $
  All inequalities are equalities, so
  #[#set math.equation(numbering: n => "(5.14)")
   $ r = kappa \, wide sum_i theta_i v \( y_i \, 1 \) - v \( 0 \, 1 \) = kappa r . $ <eq:contact-configuration>]
  Let $A$ be a minimizing slope in (5.4) for $\( x \, t \, s \) = \( 0 \, 1 \, 1 \)$.
    The weighted attaining value equals its affine majorant. Since all weights are positive,
    each $y_i$ must attain that majorant. The identity
  $ v \( y \, 1 \) - frac(\| y \|^2, 2) - A dot.op y = v \( y \, 1 \) - frac(\| y + A \|^2, 2) + frac(\| A \|^2, 2) $
  therefore shows that all $y_i$ are optimizers for $cal(P)_1 v \( b \, 0 \)$ with $b = - A$.
  Put $h \( s \) = cal(P)_s v \( b \, 0 \)$ for $0 lt.eq s lt.eq 1$. It is finite and convex by Lemma 16.
    For $0 < ell < 1$, use the point $y_(i \, ell)^(-) = b + \( 1 - ell \) \( y_i - b \)$ at time $1 -
    ell$ as a competitor for $cal(M)_ell v \( y_i \, 1 \)$. Its value is bounded above using $cal(P)_(1 - ell)
    v \( b \, 0 \)$. The two quadratic costs on this linear path add, giving explicitly
  $ cal(M)_ell v \( y_i \, 1 \) lt.eq h \( 1 - ell \) + frac(\| y_i - b \|^2, 2) \, wide v \( y_i \, 1 \) =
    h \( 1 \) + frac(\| y_i - b \|^2, 2) . $
  It follows that
  $ cal(S)_ell^(-) v \( y_i \, 1 \) gt.eq frac(h \( 1 \) - h \( 1 - ell \), ell) gt.eq h \( 1 \) - h \( 0 \) . $
  The last inequality is the chord inequality for the convex function $h$.
    Taking the slope limit shows $H_v \( y_i \, 1 \) gt.eq h \( 1 \) - h \( 0 \) > - oo$.
    These finitely many values are also finite above by Lemma 17.
  For each $ell > 0$, choose an optimizer $hat(y)_i$ for $cal(P)_ell v \( y_i \, 1 \)$ and let $hat(x) =
    sum_i theta_i hat(y)_i$. Write $xi_i = y_i - x$, $hat(xi)_i = hat(y)_i - hat(x)$,
    and $r' = \( sum_i theta_i \| hat(xi)_i \|^2 \)^(1 \/ 2)$.
    The exact orthogonal decomposition and the reverse triangle inequality in the weighted Euclidean space give
  $ sum_i theta_i \| hat(y)_i - y_i \|^2 = \| hat(x) - x \|^2 + sum_i theta_i \| hat(xi)_i -
    xi_i \|^2 gt.eq \| hat(x) - x \|^2 + \( r' - r \)^2 . $
  Use the Jensen bound at time $1 + ell$, (5.14) at time $1$, and $hat(x)$ as a forward competitor from $x$.
    The decomposition yields
  $ ell sum_i theta_i cal(S)_ell^(+) v \( y_i \, 1 \) & lt.eq ell cal(S)_ell^(+) v \( x \, 1 \) +
    kappa \( r' - r \) - frac(\( r' - r \)^2, 2 ell)\
 & lt.eq ell cal(S)_ell^(+) v \( x \, 1 \) + frac(kappa^2 ell, 2) . $
  Divide by $ell$ and take $ell arrow.b 0$. There are only finitely many endpoints, all with finite limits, so
  $ H_v \( z_(*) \) gt.eq sum_i theta_i H_v \( y_i \, 1 \) - kappa^2 / 2 gt.eq h \( 1 \) - h \( 0 \) - kappa^2 /
    2 > - oo . $
  Its upper finiteness is part of Lemma 17; hence $H_v \( z_(*) \) in bb(R)$.
  It remains to identify the forward slope of $W$. At the contact,
    the sandwich gives for every $ell > 0$ $cal(S)_ell^(+) W \( z_(*) \) lt.eq cal(S)_ell^(+) v \( z_(*) \)$.
    For $0 < ell < 1$ it also gives $cal(S)_ell^(-) W \( z_(*) \) gt.eq cal(S)_ell^(-) v \( z_(*) \)$,
    since the backward time is positive. The subsolution property and growth of $W$ allow the one-sided inequality
    (4.11) to be applied to it. Consequently
  $ H_v \( z_(*) \) lt.eq limsup_(ell arrow.b 0) cal(S)_ell^(-) W \( z_(*) \) lt.eq
    lim_(ell arrow.b 0) cal(S)_ell^(+) W \( z_(*) \) lt.eq H_v \( z_(*) \) . $
  This proves (5.10). ◻
]

== 6 Discrete propagation inequalities <sec:discrete-propagation>

We now derive the one-step inequality used to propagate the contact from Proposition 22.
  The argument will also be applied after normalizing at fitted points that need not be contacts,
  so the estimates must hold without assuming contact at the center.
  Stopped stochastic processes and finite-difference comparisons have also been used to study the infinity
  Laplacian [13,2]. The walk constructed here uses forward and backward quadratic optimizers for the limiting
  equation; its drift controls velocity discrepancies that persist under fitted changes of frame.

Throughout this section, let $v in cal(A)_(m \, C_0)$ be centered at $\( 0 \, 1 \)$, and fix $0 lt.eq
  kappa < oo$ for which (5.2) holds with $f = v$ and $I = bb(R)$. For $t > 0$, define

$ W \( x \, t \) = cal(C)_t v \( x \, t \) - frac(kappa^2 t, 2) . $

The general bound (5.3), with its parameter equal to $t$, gives

$ v \( x \, t \) - frac(kappa^2 t, 2) lt.eq W \( x \, t \) lt.eq v \( x \, t \) . $

Lemma 19 gives continuity of $W$ and concavity of $W \( dot.op \, t \) - \| dot.op \|^2 \/ \( 2 t \)$.
  The sandwich and (4.5) give subquadratic spatial growth for $W$ on compact positive-time intervals.
  Since $v$ is a subsolution with that growth, Corollary 21, applied with $c = kappa^2 \/ 2$,
  makes $W$ a subsolution of (3.1).

For $ell \, epsilon.alt > 0$, set

#[#set math.equation(numbering: n => "(6.1)")
 $ f = W \, wide f^ell = cal(P)_ell f \, wide g_epsilon.alt = cal(M)_epsilon.alt v \, wide J_epsilon.alt =
   frac(f^epsilon.alt - g_epsilon.alt, 2 epsilon.alt) . $ <eq:dp-auxiliary>]

These functions are defined at every positive time. The identity

#[#set math.equation(numbering: n => "(6.2)")
 $ 2 epsilon.alt J_epsilon.alt \( z \) & = W \( z \) - v \( z \) +
   #scale(x: 120%, y: 120%)[\(] cal(P)_epsilon.alt W \( z \) - W \( z \) #scale(x: 120%, y: 120%)[\)]\
 & #h(4em)  + #scale(x: 120%, y: 120%)[\(] v \( z \) - cal(M)_epsilon.alt v \( z \) #scale(x: 120%, y: 120%)[\)]
   $ <eq:dp-contact-gap>]

and the zero-length continuity in Lemma 16 show that $2 epsilon.alt J_epsilon.alt arrow.r W -
  v$ uniformly on every compact subset of $bb(R)^m times \( 0 \, oo \)$.
  Thus, on a compact region separated from contact, $J_epsilon.alt$ tends uniformly to $- oo$.
  This fact will turn lower expectation bounds for $J_epsilon.alt$ into contact at limiting marks.
  The sandwich also gives $cal(P)_epsilon.alt W lt.eq cal(P)_epsilon.alt v$, and hence

#[#set math.equation(numbering: n => "(6.3)")
 $ J_epsilon.alt \( z \) lt.eq 1 / 2 #scale(x: 120%, y: 120%)[\(] cal(S)_epsilon.alt^(+) v \( z \) +
   cal(S)_epsilon.alt^(-) v \( z \) #scale(x: 120%, y: 120%)[\)] . $ <eq:dp-J-bounds>]

For the particular pair supplied by Proposition 22, write $z_(*) = \( 0 \, 1 \)$ and $H_(*) =
  H_v \( z_(*) \) in bb(R)$. Equality of $W$ and $v$ there, the contact slope conclusion,
  and the common slope limit for $v$ give

#[#set math.equation(numbering: n => "(6.4)")
 $ J_epsilon.alt \( z_(*) \) = 1 / 2 #scale(x: 120%, y: 120%)[\(] cal(S)_epsilon.alt^(+) W \( z_(*) \) +
   cal(S)_epsilon.alt^(-) v \( z_(*) \) #scale(x: 120%, y: 120%)[\)] arrow.r
   H_(*) wide \( epsilon.alt arrow.b 0 \) . $ <eq:dp-J-contact>]

This finite limiting value will start the walks in Section 7.

=== 6.1 Spatial regularity and the one-step drift <spatial-regularity-and-the-one-step-drift>

#thm([Lemma 6.1.])[
  #emph[For every $t \, ell > 0$, the optimization defining $f^ell \( x \, t \)$ has a unique maximizer $y =
    y \( x \, t \, ell \)$. The function $f^ell \( dot.op \, t \)$ is differentiable, and
#[#set math.equation(numbering: n => "(6.5)")
 $ nabla_x f^ell \( x \, t \) = frac(y - x, ell) . $ <eq:dp-gradient>]

 For every $h in bb(R)^m$ it satisfies the two supporting inequalities
#[#set math.equation(numbering: n => "(6.6)")
 $ f^ell \( x \, t \) + nabla_x f^ell \( x \, t \) dot.op h - frac(\| h \|^2, 2 ell) & lt.eq f^ell \( x + h \, t \)\
 & lt.eq f^ell \( x \, t \) + nabla_x f^ell \( x \, t \) dot.op h + frac(\| h \|^2, 2 t) . $ <eq:dp-supports>]

 In particular, its spatial Hessian is bounded below by $-
   ell^(- 1) I$ in the semiconvexity sense and above by $t^(- 1) I$ in the semiconcavity sense.]
] <lem:dp-spatial-regularity>

#proof[
  Put $s = t + ell$. The function $f \( dot.op \, s \) - \| dot.op \|^2 \/ \( 2 s \)$ is concave,
    because the same is true of $cal(C)_s v \( dot.op \, s \) - \| dot.op \|^2 \/ \( 2 s \)$. Thus
  $ y mapsto f \( y \, s \) - frac(\| y - x \|^2, 2 ell) $
  is strictly concave: after subtracting the concave function $f \( y \, s \) - \| y \|^2 \/ \( 2 s \)$,
    its quadratic part has Hessian $\( s^(- 1) - ell^(- 1) \) I = - t \( ell s \)^(- 1) I$.
    It has a maximizer by the subquadratic growth and the quadratic cost,
    and strict concavity makes the maximizer unique. Keeping this maximizer fixed when $x$ is replaced by $x + h$ gives
  #[#set math.equation(numbering: n => "(6.7)")
   $ f^ell \( x + h \, t \) gt.eq f^ell \( x \, t \) + frac(y - x, ell) dot.op h -
     frac(\| h \|^2, 2 ell) . $ <eq:dp-lower-support>]
  For the upper bound, the identity
  $ frac(\| y \|^2, 2 s) - frac(\| y - x \|^2, 2 ell) - frac(\| x \|^2, 2 t) = - frac(t, 2 ell s) lr(|y - s / t x|)^2 $
  shows that
  $ f^ell \( x \, t \) - frac(\| x \|^2, 2 t) = sup_y {f \( y \, s \) - frac(\| y \|^2, 2 s) -
    frac(t, 2 ell s) lr(|y - s / t x|)^2} $
  is concave in $x$. Indeed, the expression in braces is jointly concave in $\( x \, y \)$;
    applying that concavity to a pair of maximizing points proves concavity of its partial supremum.
    A finite concave function on $bb(R)^m$ has an upper supporting affine function at each point.
    Adding back the quadratic therefore gives a vector $q$ such that
  $ f^ell \( x + h \, t \) lt.eq f^ell \( x \, t \) + q dot.op h + frac(\| h \|^2, 2 t) quad upright("for every ") h . $
  Comparison with (6.7), first for $h = rho e$ and then for $h = - rho e$, and passage to $rho arrow.b 0$,
    shows that $q = \( y - x \) \/ ell$. The two quadratic remainders now prove differentiability and (6.5)–(6.6). ◻
]

Fix a state $z = \( x \, t \)$ with $t > epsilon.alt$. Choose a maximizer for $cal(P)_(2 epsilon.alt)
  f \( z \)$ and a minimizer for $cal(M)_(2 epsilon.alt) v \( z \)$,
  and take $x^(+)$ and $x^(-)$ to be the respective intermediate points at time $t + epsilon.alt$ and $t -
  epsilon.alt$ on the straight paths to those optimizers. The composition formulas for the envelopes and
  additivity of the quadratic cost along a straight path give the following identities.
  Each half of a straight path has the same velocity and cost $epsilon.alt \| Q_plus.minus \|^2 \/ 2$.

#[#set math.equation(numbering: n => "(6.8)")
 $ f^(2 epsilon.alt) \( z \) & = f^epsilon.alt \( z^(+) \) - epsilon.alt /
   2 \| Q_(+) \|^2 \, & z^(+) & = \( x^(+) \, t + epsilon.alt \) \,\
cal(M)_(2 epsilon.alt) v \( z \) & = g_epsilon.alt \( z^(-) \) + epsilon.alt /
  2 \| Q_(-) \|^2 \, & z^(-) & = \( x^(-) \, t - epsilon.alt \) \, $ <eq:dp-step-choice>]

where

#[#set math.equation(numbering: n => "(6.9)")
 $ Q_(+) = frac(x^(+) - x, epsilon.alt) = nabla_x f^(2 epsilon.alt) \( z \) \, wide Q_(-) =
   frac(x - x^(-), epsilon.alt) \, wide Q_0 = nabla_x f^epsilon.alt \( z \) . $ <eq:dp-velocities>]

The formula for $Q_(+)$ follows from (6.5) for the full $2 epsilon.alt$ optimizer.
  Although $z^(-)$ is the backward step, $Q_(-)$ is oriented forward from $x^(-)$ to $x$;
  the spatial increment for that step is $- epsilon.alt Q_(-)$.
  The backward optimizer need not be unique; any choice has the properties just stated.

#thm([Lemma 6.2.])[
  #emph[At the state and steps above define
$ D & = f \( z \) + f^(2 epsilon.alt) \( z \) - 2 f^epsilon.alt \( z \) \,\
e & = f^epsilon.alt \( z^(-) \) + epsilon.alt / 2 \| Q_(-) \|^2 - f \( z \) \,\
tilde(D) & = 2 g_epsilon.alt \( z \) - v \( z \) - cal(M)_(2 epsilon.alt) v \( z \) \,\
tilde(e) & = v \( z \) + epsilon.alt / 2 \| Q_(+) \|^2 - g_epsilon.alt \( z^(+) \) . $

 Here $D$ and $tilde(D)$ are the midpoint gaps for forward convexity and backward concavity.
   The quantities $e$ and $tilde(e)$ are the gaps from using $z$ as a competitor from the opposite step.
   All four quantities are nonnegative, and the exact drift identity and the velocity estimate are
#[#set math.equation(numbering: n => "(6.10)")
 $ frac(J_epsilon.alt \( z^(+) \) + J_epsilon.alt \( z^(-) \), 2) - J_epsilon.alt \( z \) & =
   frac(D + e + tilde(D) + tilde(e), 4 epsilon.alt)\
 & gt.eq frac(D + e, 4 epsilon.alt)\
 & gt.eq c #scale(x: 120%, y: 120%)[\(] \| Q_(+) - Q_0 \|^2 + \| Q_(-) - Q_0 \|^2 #scale(x: 120%, y: 120%)[\)] \,
   wide c = frac(1, 16 \( 1 + log 2 \)) . $ <eq:dp-drift>]

]
] <lem:dp-drift>

For a fair choice between $z^(+)$ and $z^(-)$, the left side of (6.10) is the conditional expected change of
  $J_epsilon.alt$ given this state and the chosen optimizers.
  The drift therefore controls the squared discrepancies from the same reference velocity $Q_0$ at that state.

#proof[
  Convexity in the length of $cal(P)_ell f \( z \)$ gives $D gt.eq 0$,
    and concavity in the length of $cal(M)_ell v \( z \)$ gives $tilde(D) gt.eq 0$.
    The point $z$ is a forward competitor from $z^(-)$ and a backward competitor from $z^(+)$,
    which gives $e gt.eq 0$ and $tilde(e) gt.eq 0$. The identities in (6.8) and the definitions of the competitor
    gaps yield
  $ f^epsilon.alt \( z^(+) \) + f^epsilon.alt \( z^(-) \) - 2 f^epsilon.alt \( z \) & = D + e + epsilon.alt /
    2 #scale(x: 120%, y: 120%)[\(] \| Q_(+) \|^2 - \| Q_(-) \|^2 #scale(x: 120%, y: 120%)[\)] \,\
g_epsilon.alt \( z^(+) \) + g_epsilon.alt \( z^(-) \) - 2 g_epsilon.alt \( z \) & = - tilde(D) - tilde(e) +
  epsilon.alt / 2 #scale(x: 120%, y: 120%)[\(] \| Q_(+) \|^2 - \| Q_(-) \|^2 #scale(x: 120%, y: 120%)[\)] . $
  The same difference of the two half-step costs occurs in both lines, so it cancels on subtraction.
    Dividing by $4 epsilon.alt$ proves the identity and its first inequality.
  For the final inequality let $b \, d in bb(R)^m$ be arbitrary.
    Apply the path-convexity property of the forward envelope to
  $ x \( ell \) = x + d + frac(ell, 2 epsilon.alt) \( b - d \) \, wide 0 lt.eq ell lt.eq 2 epsilon.alt . $
  For this path the function $cal(P)_ell f \( x \( ell \) \, t \) + \| b -
    d \|^2 ell log ell \/ \( 4 epsilon.alt^2 \)$ is convex, with $ell log
    ell$ assigned its continuous value zero at $ell = 0$. The midpoint inequality,
    and $2 epsilon.alt log \( 2 epsilon.alt \) - 2 epsilon.alt log epsilon.alt = 2 epsilon.alt log 2$, give
  #[#set math.equation(numbering: n => "(6.11)")
   $ f \( x + d \, t \) + f^(2 epsilon.alt) \( x + b \, t \) - 2 f^epsilon.alt (x + frac(b + d, 2) \, t) gt.eq -
     frac(log 2, 2 epsilon.alt) \| b - d \|^2 . $ <eq:dp-path-midpoint>]
  Using $x + d$ as a forward competitor from $z^(-)$ and expanding its cost gives
  $ f \( x + d \, t \) lt.eq f \( z \) + e + Q_(-) dot.op d + frac(\| d \|^2, 2 epsilon.alt) . $
  Use the upper supporting inequality in (6.6) for $f^(2 epsilon.alt) \( x + b \, t \)$,
    and the lower one for $f^epsilon.alt \( x + \( b + d \) \/ 2 \, t \)$. The left side of (6.11) is then at most
  $ D + e + \( Q_(+) - Q_0 \) dot.op b + \( Q_(-) - Q_0 \) dot.op d + frac(\| b \|^2, 2 t) +
    frac(\| d \|^2, 2 epsilon.alt) + frac(\| b + d \|^2, 4 epsilon.alt) . $
  Combining this upper bound with (6.11), using $t > epsilon.alt$ and $\| b plus.minus d \|^2 lt.eq
    2 \( \| b \|^2 + \| d \|^2 \)$, proves
  $ D + e gt.eq \( Q_0 - Q_(+) \) dot.op b + \( Q_0 - Q_(-) \) dot.op d -
    frac(1 + log 2, epsilon.alt) \( \| b \|^2 + \| d \|^2 \) . $
  Choose
  $ b = frac(epsilon.alt \( Q_0 - Q_(+) \), 2 \( 1 + log 2 \)) \, wide d =
    frac(epsilon.alt \( Q_0 - Q_(-) \), 2 \( 1 + log 2 \)) . $
  The result is $D + e gt.eq
    epsilon.alt \( \| Q_(+) - Q_0 \|^2 + \| Q_(-) - Q_0 \|^2 \) \/ \( 4 \( 1 + log 2 \) \)$, as required. ◻
]

=== 6.2 Fitted frames and a logarithmic velocity bound <fitted-frames-and-a-logarithmic-velocity-bound>

The walks will later be viewed in frames based at fits at smaller positive times.
  We first show that the squared discrepancies in (6.10) are unchanged in those frames,
  and that the transformed solution remains in the standing family.
  The velocity estimate following this calculation will then apply with constants independent of the frame.

#thm([Lemma 6.3.])[
  (Covariance in a fitted frame).  #emph[Let $r > 0$, and let $\( p_0 \, a_0 \)$ be a fit for $v$ at
    $\( x_0 \, r \)$ of radius $r$. At corresponding points define
#[#set math.equation(numbering: n => "(6.12)")
 $ s = t / r \, wide y = frac(x - x_0 - p_0 \( t - r \), r) \,\
x = x_0 + r #scale(x: 120%, y: 120%)[\(] y + p_0 \( s - 1 \) #scale(x: 120%, y: 120%)[\)] \, wide t = r s \,\
macron(v) \( y \, s \) = frac(v \( x \, t \) - v \( x_0 \, r \), r) - p_0 dot.op y -
  (a_0 + frac(\| p_0 \|^2, 2)) \( s - 1 \) . $ <eq:contact-frame>]

 Then $macron(v) in cal(A)_(m \, C_0)$ is centered at $\( 0 \, 1 \)$ and satisfies (5.2) with $f = macron(v)$,
   $I = bb(R)$, and the same $kappa$. Define
$ macron(W) \( y \, s \) = cal(C)_s macron(v) \( y \, s \) - frac(kappa^2 s, 2) wide \( s > 0 \) . $

 For every $sigma > 0$, the barycentric and $W$ gaps satisfy
#[#set math.equation(numbering: n => "(6.13)")
 $ cal(C)_sigma macron(v) \( y \, s \) - macron(v) \( y \, s \) & =
   frac(cal(C)_(r sigma) v \( x \, t \) - v \( x \, t \), r) \,\
macron(W) \( y \, s \) - macron(v) \( y \, s \) & = frac(W \( x \, t \) - v \( x \, t \), r) wide \( s > 0 \) .
  $ <eq:contact-W-covariance>]

 For every $ell > 0$, the solution slopes satisfy
#[#set math.equation(numbering: n => "(6.14)")
 $ cal(S)_ell^plus.minus macron(v) \( y \, s \) = cal(S)_(r ell)^plus.minus v \( x \, t \) -
   a_0 . $ <eq:fitted-slope-covariance>]

 If the steps in (6.8) are chosen at any state with $t > epsilon.alt$,
   their images are optimizing steps for the transformed pair, with step size $epsilon.alt' = epsilon.alt \/ r$.
   Their velocities satisfy
#[#set math.equation(numbering: n => "(6.15)")
 $ Q'_(+) = frac(y^(+) - y, epsilon.alt') = Q_(+) - p_0 \, wide Q'_(-) = frac(y - y^(-), epsilon.alt') = Q_(-) - p_0 \,\
Q'_0 = nabla_y cal(P)_(epsilon.alt') macron(W) \( y \, s \) = Q_0 - p_0 \, wide Q'_plus.minus - Q'_0 =
  Q_plus.minus - Q_0 . $ <eq:contact-velocity-covariance>]

 All these identities are global at corresponding states, with the indicated positive-time restriction for $W$;
   the states need not lie in the fitting box. No contact at $\( x_0 \, r \)$ is assumed.
   The centering and fit assertion concerns $macron(v)$ alone.]
] <lem:fitted-frame-covariance>

#proof[
  Lemma 14, followed by the time translation that puts the fitted point at $\( 0 \, 1 \)$,
    proves the class and centering assertions. At each fixed time the spatial offsets are multiplied by $r$,
    and values are multiplied by $r$ up to an affine function.
    The affine terms cancel from a barycentric defect, so its quotient by the root mean square radius is
    unchanged. This proves the Jensen assertion.
  For the remaining calculations put
  $ A \( y \, s \) = frac(v \( x_0 \, r \), r) + p_0 dot.op y + (a_0 + frac(\| p_0 \|^2, 2)) \( s - 1 \) \, wide
    frac(v \( x \, t \), r) = macron(v) \( y \, s \) + A \( y \, s \) . $
  Scaling the positions of a barycentric configuration and cancelling its weighted affine terms gives
  $ frac(cal(C)_(r sigma) v \( x \, t \), r) = cal(C)_sigma macron(v) \( y \, s \) + A \( y \, s \) . $
  Subtracting the displayed formula for $v \/ r$ proves the first identity in (6.13).
    For $s > 0$, take $sigma = s$. The old time and the old barycentric parameter in $W$ are both $t = r s$,
    while the correction $kappa^2 t \/ \( 2 r \)$ is $kappa^2 s \/ 2$. Hence
  $ frac(W \( x \, t \), r) = macron(W) \( y \, s \) + A \( y \, s \) \, $
  which proves the second gap identity. This is why the frame uses $s = t \/ r$:
    it preserves the time-zero boundary in the definition of $W$.
  The quadratic envelopes obey the following value identities for $ell > 0$, with $s > 0$ in the identity involving $W$:
  #[#set math.equation(numbering: n => "(6.16)")
   $ frac(cal(P)_(r ell) v \( x \, t \), r) & = cal(P)_ell macron(v) \( y \, s \) + A \( y \, s \) + a_0 ell \,\
frac(cal(M)_(r ell) v \( x \, t \), r) & = cal(M)_ell macron(v) \( y \, s \) + A \( y \, s \) - a_0 ell \,\
frac(cal(P)_(r ell) W \( x \, t \), r) & = cal(P)_ell macron(W) \( y \, s \) + A \( y \, s \) +
  a_0 ell . $ <eq:envelope-covariance>]
  To check the first identity, parameterize an old forward competitor by a new position $y'$ at time $s + ell$.
    Its old displacement divided by $r$ is $y' - y + p_0 ell$. The cost divided by $r$ is
  $ frac(\| y' - y + p_0 ell \|^2, 2 ell) = frac(\| y' - y \|^2, 2 ell) + p_0 dot.op \( y' - y \) +
    frac(\| p_0 \|^2 ell, 2) . $
  The affine change in $A$ from $\( y \, s \)$ to $\( y' \, s + ell \)$ is $p_0
    dot.op \( y' - y \) + \( a_0 + \| p_0 \|^2 \/ 2 \) ell$, leaving $a_0 ell$ after the cost is subtracted.
    For a backward competitor the old displacement divided by $r$ is $y' - y - p_0 ell$;
    the same expansion with the cost added leaves $- a_0 ell$. These prove the first two identities.
    The last follows by the same forward calculation using $W \/ r = macron(W) + A$ at every positive time.
    Subtract the formula for $v \/ r$ from the forward identity,
    and subtract the backward identity from that formula. Dividing each result by $ell$ gives (6.14).
  The competitor calculations also show that old optimizers map to optimizers for the transformed envelopes.
    The affine coordinate map sends their straight intermediate points to the new straight intermediate points.
    Thus the mapped steps are precisely the steps of (6.8) for the transformed pair.
    The first two velocity equalities in (6.15) follow from (6.12) and $t^plus.minus - t =
    plus.minus epsilon.alt$. For the reference velocity, differentiate the last identity of (6.16) in $y$ with $r
    ell = epsilon.alt$. The derivative of the left side is $nabla_x cal(P)_epsilon.alt W = Q_0$, since $D_y x =
    r I$, and the derivative of $A$ is $p_0$. This proves the equality for $Q'_0$ and the invariance of the
    velocity discrepancies, with no additional scale factor. ◻
]

It remains to bound the reference velocity in each of these centered frames.
  As before, write $L \( K \) = 1 + log K$ for $K gt.eq 2$. The next bound is uniform over the standing family.
  Its squared logarithmic singularity in time is integrable near zero,
  which will control the expected martingale variation through the time-walk occupation estimates.

#thm([Lemma 6.4.])[
  #emph[Suppose $K gt.eq 2$, $\| x \| \, \| t \| lt.eq K$, $0 < epsilon.alt lt.eq 1$, and $t > epsilon.alt$.
    Then the velocity in (6.9) satisfies
#[#set math.equation(numbering: n => "(6.17)")
 $ \| Q_0 \| = \| nabla_x cal(P)_epsilon.alt W \( x \, t \) \| lt.eq
   C #scale(x: 120%, y: 120%)[\(] L \( K \) + \| log t \| #scale(x: 120%, y: 120%)[\)] . $ <eq:dp-log-velocity>]

 Here $C$ depends only on the fitting constant, the spatial dimension, and $kappa$.]
] <lem:dp-log-velocity>

#proof[
  Let $s = t + epsilon.alt$, so $2 epsilon.alt < s lt.eq K + 1$.
    At the point $x$, choose any upper supporting slope $p$ for the semiconcave function $f \( dot.op \, s \)$:
  #[#set math.equation(numbering: n => "(6.18)")
   $ f \( x + h \, s \) lt.eq f \( x \, s \) + p dot.op h + frac(\| h \|^2, 2 s) quad \( h in bb(R)^m \) .
     $ <eq:dp-W-upper-support>]
  Such a slope exists because $f \( dot.op \, s \) - \| dot.op \|^2 \/ \( 2 s \)$ is finite and concave on all of
    $bb(R)^m$. If $p eq.not 0$, insert $h = - s p \/ \| p \|$ to obtain
  $ f \( x + h \, s \) - f \( x \, s \) lt.eq - s \| p \| + s / 2 . $
  The sandwich bound for $W$ gives, in the other direction,
  $ f \( x + h \, s \) - f \( x \, s \) gt.eq v \( x + h \, s \) - v \( x \, s \) - frac(kappa^2 s, 2) . $
  The spatial increment estimate from the fits, applied with increment length $s$ at the center $\( x \, s \)$ in
    the box of size $2 K$, bounds the right side below by
  $ - C s #scale(x: 120%, y: 120%)[\(] L \( 2 K \) + \| log s \| #scale(x: 120%, y: 120%)[\)] - frac(kappa^2 s, 2) . $
  The resulting estimate for $p$ also holds when $p = 0$. Since $1 < s \/ t < 2$,
    we have $\| log s \| lt.eq \| log t \| + log 2$, and hence
  #[#set math.equation(numbering: n => "(6.19)")
   $ \| p \| lt.eq C #scale(x: 120%, y: 120%)[\(] L \( K \) + \| log t \| #scale(x: 120%, y: 120%)[\)] .
     $ <eq:dp-support-slope-bound>]
  Let $h$ be the optimizing displacement for $f^epsilon.alt \( x \, t \)$.
    Its value is at least the value of the competitor $h = 0$. In conjunction with (6.18), this gives
  $ frac(\| h \|^2, 2 epsilon.alt) lt.eq p dot.op h + frac(\| h \|^2, 2 s) . $
  For $h eq.not 0$, using $s > 2 epsilon.alt$ yields $\| h \| \/ epsilon.alt lt.eq 4 \| p \|$;
    the same inequality is immediate when $h = 0$. By (6.5), $Q_0 = h \/ epsilon.alt$, so (6.19) proves the lemma. ◻
]

== 7 Propagation to time zero and localization <sec:contact-localization>

We now apply the discrete inequalities to the extremal pair $v \,
  W$ and the constant $kappa$ supplied by Proposition 22. Write $z_(*) = \( 0 \, 1 \)$ and $H_(*) =
  H_v \( z_(*) \) in bb(R)$; the starting limit is (6.4).

#thm([Proposition 7.1.])[
  #emph[Put $delta_j = 2^(- j)$ for $j gt.eq 1$. There exist a constant $K < oo$,
    a point $x_(upright("end")) in bb(R)^m$, and an infinite set $cal(J) subset
    bb(N)$ with the following property. For every $j in cal(J)$ there are a point $x_j in
    bb(R)^m$ and a fit $\( p_j \, a_j \)$ for $v$ at $\( x_j \, delta_j \)$ of radius $delta_j$,
    in the sense of (3.2), such that
#[#set math.equation(numbering: n => "(7.1)")
 $ H_v \( x_(upright("end")) \, 0 \) > - oo \, wide W \( x_j \, delta_j \) = v \( x_j \, delta_j \) \,\
\| x_(upright("end")) - x_j + p_j delta_j \| lt.eq K delta_j . $ <eq:contact-propagation-conclusion>]

]
] <prop:contact-propagation>

The last bound says that the same terminal point stays in a fixed bounded part of every selected fitted frame,
  where its finite slope will identify the limiting fixed-length slopes.
  Figure 2 shows how two selected fitted frames localize the same endpoint.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-1, 0), (2.5, 0), (3.25, 3.15), (-0.25, 3.15), close: true, fill: rgb("#ebf0f4"), stroke: none)
  line((-1, 0), (-0.25, 3.15), (2.5, 0), (3.25, 3.15), stroke: (paint: rgb("#91acc4"), thickness: 0.4pt, miter-limit: 10))
  line((-0.25, 3.15), (3.25, 3.15), stroke: (paint: rgb("#91acc4"), thickness: 0.4pt, miter-limit: 10))
  line((-1.225, 0), (0.525, 0), (-0.045, 1.575), (-1.795, 1.575), close: true, fill: rgb("#f5eae4"), stroke: none)
  line((-1.225, 0), (-1.795, 1.575), (0.525, 0), (-0.045, 1.575), stroke: (paint: rgb("#c68f6d"), thickness: 0.4pt, miter-limit: 10))
  line((-1.795, 1.575), (-0.045, 1.575), stroke: (paint: rgb("#c68f6d"), thickness: 0.4pt, miter-limit: 10))
  line((0.75, 0), (1.5, 3.15), stroke: (paint: rgb("#235888"), thickness: 0.85pt, miter-limit: 10, dash: "densely-dashed"))
  line((-0.35, 0), (-0.92, 1.575), stroke: (paint: rgb("#a8531f"), thickness: 0.85pt, miter-limit: 10, dash: (4pt, 2pt, 1pt, 2pt)))
  line((-2.65, 0), (3.65, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((3.65, 0), [#text(size: 9pt)[$x$]], anchor: "west", padding: 0.1176cm)
  line((-2.45, -0.02), (-2.45, 3.8), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((-2.45, 3.8), [#text(size: 9pt)[$t$]], anchor: "south", padding: 0.1176cm)
  line((-2.45, 3.15), (1.5, 3.15), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  line((-2.45, 1.575), (-0.92, 1.575), stroke: (paint: rgb("#a6a6a6"), thickness: 0.4pt, miter-limit: 10, dash: "dotted"))
  content((-2.48, 3.15), [#text(size: 9pt)[$delta_j$]], anchor: "east", padding: 0.1176cm)
  content((-2.48, 1.575), [#text(size: 9pt)[$delta_k$]], anchor: "east", padding: 0.1176cm)
  content((-2.48, 0), [#text(size: 9pt)[$0$]], anchor: "east", padding: 0.1176cm)
  circle((1.5, 3.15), radius: 0.08114, fill: rgb("#235888"), stroke: none)
  content((1.5, 3.326), [#text(fill: rgb("#235888"))[#text(size: 9pt)[$(x_j, delta_j)$]]], anchor: "south", padding: 0.1176cm)
  circle((-0.92, 1.575), radius: 0.08114, fill: rgb("#a8531f"), stroke: none)
  content((-0.9948, 1.65), [#text(fill: rgb("#a8531f"))[#text(size: 9pt)[$(x_k, delta_k)$]]], anchor: "south-east", padding: 0.1176cm)
  circle((0, 0), radius: 0.09878, fill: black, stroke: none)
  content((0, -0.1764), [#text(size: 9pt)[$(x_( upright(e) "nd"),0)$]], anchor: "north", padding: 0.1176cm)
  line((0.75, -0.045), (0.75, 0.045), stroke: (paint: rgb("#235888"), thickness: 0.4pt, miter-limit: 10))
  line((-0.35, -0.045), (-0.35, 0.045), stroke: (paint: rgb("#a8531f"), thickness: 0.4pt, miter-limit: 10))
  content((4, 2.8), [#text(fill: rgb("#235888"))[#text(size: 9pt)[$x=x_j+p_j(t- delta_j)$]]], anchor: "west", padding: 0.1176cm)
  line((4, 2.8), (3.42, 2.8), (1.29, 2.28), stroke: (paint: rgb("#5a82a6"), thickness: 0.4pt, miter-limit: 10))
  content((4, 1.68), [#text(fill: rgb("#a8531f"))[#text(size: 9pt)[$x=x_k+p_k(t- delta_k)$]]], anchor: "west", padding: 0.1176cm)
  line((4, 1.68), (3.42, 1.68), (-0.72, 1.13), stroke: (paint: rgb("#be7e57"), thickness: 0.4pt, miter-limit: 10))
  content((4, 0.46), [#box(width: 4.485cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #text(size: 9pt)[$j,k in cal(J)$, $j<k$.#linebreak() One endpoint lies in both strips.]])], anchor: "west")
  line((0.75, -0.72), (2.5, -0.72), stroke: (paint: rgb("#235888"), thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: rgb("#235888")), end: (symbol: ")>", fill: rgb("#235888"))))
  content((1.625, -0.7906), [#text(size: 9pt)[$K delta_j$]], anchor: "north", padding: 0.1176cm)
  line((0.75, -0.64), (0.75, -0.82), (2.5, -0.64), (2.5, -0.82), stroke: (paint: rgb("#91acc4"), thickness: 0.4pt, miter-limit: 10))
})],
  caption: [Figure 2: Schematic localization at two selected scales, shown in one spatial direction with different horizontal and vertical units. The dashed axes belong to the two fitted frames; each shaded endpoint-localization strip has spatial half-width $K delta_j$ or $K delta_k$. Their time-zero sections both contain the same point $\( x_(upright("end")) \, 0 \)$, expressing $\| x_(upright("end")) - x_j + p_j delta_j \| lt.eq K delta_j$. The conclusion holds for infinitely many selected indices $j in cal(J)$. The axes are separate affine fits, not a trajectory joining the marks. ],
) <fig:contact-localization>

#proof[
  We first construct finite stopped walks with common expectation and error bounds,
    and then localize their terminal points in the frames of their marks.
    Finally, one joint limiting law will retain the terminal point and all marks,
    allowing us to select infinitely many localized contacts for the same endpoint.
  #emph[The stopped walks and their expectation bounds.] Fix for the moment an integer $T gt.eq
    2$ and a radius $R gt.eq 2$. For each $N gt.eq 1$ choose $epsilon.alt_N$ to be an inverse power of two with
  #[#set math.equation(numbering: n => "(7.2)")
   $ 0 < epsilon.alt_N lt.eq delta_N / 4 . $ <eq:contact-grid>]
  In particular, $epsilon.alt_N$ divides $1 \, T$, and every $delta_j$ with $j lt.eq N$.
    We will make each $epsilon.alt_N$ smaller if necessary, retaining these conditions.
    Write $epsilon.alt = epsilon.alt_N$ while constructing the $N$-th walk.
  Start at $z_0 = z_(*)$. At a state $z_n = \( x_n \, t_n \)$ with $delta_N < t_n < T$ and $\| x_n \| < R$,
    choose the two steps of (6.8) and take $z_(n + 1) = z_n^(+)$ or $z_n^(-)$ with equal probabilities.
    Stop on first reaching $t_n = delta_N$, $t_n = T$, or $\| x_n \| gt.eq R$; call this stopping index $tau_N$.
    The choices of optimizers can be made separately at every node of the countable tree of finite histories.
    Taking independent fair signs $xi_n in { - 1 \, 1 }$ to select the steps then defines the walk and the
    filtration $cal(F)_n = sigma \( xi_0 \, dots.h \, xi_(n - 1) \)$;
    all velocities at step $n$ are $cal(F)_n$-measurable. In expressions such as $Q_(-) \( z_n \)$ below,
    the velocity denotes the choice made at that history. Before stopping, $t_n > delta_N gt.eq 4 epsilon.alt$,
    so the inequality (6.10) applies.
  We choose $epsilon.alt_N$ sufficiently small that every position up to and including the stop lies in
    $overline(B)_(R + 1) \( 0 \)$. Here is the uniform localization of optimizers that permits this choice.
    The sandwich for $W$ extends it continuously to $t = 0$ by $W \( x \, 0 \) = v \( x \, 0 \)$.
    The growth bounds for $v$ and the sandwich give uniform subquadratic growth for $v$ and $W$ on compact time
    intervals in $bb(R)$ and $\[ 0 \, oo \)$, respectively. For base points in a fixed compact box and lengths
    $ell lt.eq 1$, a quadratic cost first confines all optimizing positions for $cal(P)_ell W$ and $cal(M)_ell
    v$ to a fixed spatial compact set: outside a sufficiently large ball the cost dominates the uniform
    subquadratic bound, even with the weaker coefficient corresponding to $ell = 1$.
    On that compact set the functions are bounded. Comparing an optimizer with the zero displacement competitor
    then gives $\| y - x \|^2 \/ \( 2 ell \) lt.eq C$ there, uniformly as $ell arrow.b 0$.
    Thus the optimizing displacements tend to zero uniformly.
    Apply this to length $2 epsilon.alt$ and base points with $\| x \| lt.eq R$, $0 lt.eq t lt.eq T$,
    in a slightly larger time interval. The intermediate displacements used for the steps are half the full
    displacements, so they can all be made at most one. This proves the asserted bound at stopping.
    We also choose $epsilon.alt_N$ small enough that
  #[#set math.equation(numbering: n => "(7.3)")
   $ J_(epsilon.alt_N) \( z_(*) \) gt.eq H_(*) - 1 \, $ <eq:contact-start-lower>]
  which is possible by (6.4).
  The time coordinate before stopping is the simple symmetric walk with step $epsilon.alt$ starting at $1$.
    It is stopped no later than this time walk hits $delta_N$ or $T$.
    The latter hitting time is almost surely finite and has finite expectation,
    for example by the elementary gambler’s ruin formula. The same is therefore true of $tau_N$. Put
  $ cal(B) = overline(B)_(R + 1) \( 0 \) times \[ 0 \, T \] \, wide B = R + T + 2 . $
  The upper slope bound for $v$ on boxes and (6.3) give a constant $U_B = C L \( B \)^4$, independent of $N$, such that
  #[#set math.equation(numbering: n => "(7.4)")
   $ J_(epsilon.alt_N) \( z_n \) lt.eq U_B wide \( 0 lt.eq n lt.eq tau_N \) . $ <eq:contact-J-upper>]
  For any stopping time $sigma lt.eq tau_N$, summing the conditional form of (6.10) up to $sigma and h$ gives
  #[#set math.equation(numbering: n => "(7.5)")
   $ bb(E) J_epsilon.alt \( z_(sigma and h) \) & gt.eq J_epsilon.alt \( z_(*) \)\
 & quad + c thin bb(E) sum_(n < sigma and h) #scale(x: 120%, y: 120%)[\(] \| Q_(+) \( z_n \) -
   Q_0 \( z_n \) \|^2 + \| Q_(-) \( z_n \) - Q_0 \( z_n \) \|^2 #scale(x: 120%, y: 120%)[\)] .
   $ <eq:contact-truncated-drift>]
  For each fixed $N$, $J_epsilon.alt$ is continuous and bounded on the compact box $overline(B)_(R + 1) \( 0 \)
    times \[ delta_N \, T \]$ containing the stopped walk. Thus dominated convergence applies to its term as $h
    arrow.r oo$. Monotone convergence applies to the nonnegative sum. We obtain, for all these stopping times,
  #[#set math.equation(numbering: n => "(7.6)")
   $ bb(E) J_epsilon.alt \( z_sigma \) gt.eq J_epsilon.alt \( z_(*) \) . $ <eq:contact-stopped-expectation>]
  Taking $sigma = tau_N$ in (7.5) and using (7.3)–(7.4) also gives
  #[#set math.equation(numbering: n => "(7.7)")
   $ bb(E) sum_(n < tau_N) #scale(x: 120%, y: 120%)[\(] \| Q_(+) \( z_n \) -
     Q_0 \( z_n \) \|^2 + \| Q_(-) \( z_n \) - Q_0 \( z_n \) \|^2 #scale(x: 120%, y: 120%)[\)] lt.eq B_0 \, wide
     B_0 = C_(*) L \( B \)^4 . $ <eq:contact-error-budget>]
  Here $C_(*)$ is fixed for $v$ and independent of $N \, R \, T$;
    it absorbs the finite number $H_(*)$ and the absolute constant $c$ in (6.10).
    Both (7.6) and (7.7) are unconditional expectations. Together with the upper slope bound,
    the lower expectation bound will give contact and a finite terminal slope in the limit.
    We first use the discrepancy bound to control horizontal-exit probabilities,
    both in the original coordinates and in fitted frames.
  #emph[Reaching the lower level with positive probability.] We next show how to choose the outer cutoffs so that
    the walks reach $t = delta_N$ with probability at least $3 \/ 4$, uniformly in $N$.
    Couple the time signs with the simple symmetric walk starting at $1$ and stopped only at $0$ or $T$.
    Its probability of reaching $T$ is $1 \/ T$, which also bounds that probability for our walk,
    since it may stop sooner. To control horizontal exit, we will bound the expected maximal displacement by $C_T
    L \( R + T + 2 \)^2$, with $C_T$ independent of $R$ and $N$.
    Markov’s inequality will then make the probability of horizontal exit tend to zero as $R arrow.r oo$ for fixed $T$.
  The expected number of visits of the unrestricted time walk to any fixed interior grid level is at most $C T \/
    epsilon.alt$. To verify this directly, write $q = T \/ epsilon.alt$ and identify the level with $k in { 1 \,
    dots.h \, q - 1 }$. After a visit to $k$, the probability of reaching an endpoint before the next return is
  $ 1 / 2 (1 / k + frac(1, q - k)) gt.eq 2 / q . $
  This follows from the linear hitting probability for a symmetric walk on each of the intervals $\[ 0 \, k \]$
    and $\[ k \, q \]$. Starting from the first visit, the expected total number of visits is at most $q \/ 2$,
    by the geometric return calculation; the probability of that first visit is at most one.
    Stopping the actual walk earlier can only decrease its visit counts. Summing this bound over levels gives
  #[#set math.equation(numbering: n => "(7.8)")
   $ bb(E) \( epsilon.alt^2 tau_N \) lt.eq C T^2 \, wide bb(E) sum_(n < tau_N) epsilon.alt^2 \| Q_0 \( z_n \) \|^2
     lt.eq C_T L \( B \)^2 . $ <eq:contact-time-and-velocity-budget>]
  For the second inequality we used Lemma 26 before each step.
    More explicitly, it bounds the summand velocity squared by $C \( L \( B \)^2 + \| log t_n \|^2 \)$,
    while the visit estimate gives at most
  $ C T epsilon.alt sum_(k = 1)^(q - 1) #scale(x: 120%, y: 120%)[\(] L \( B \)^2 + \| log \( k epsilon.alt \) \|^2
    #scale(x: 120%, y: 120%)[\)] . $
  This has the asserted bound. Indeed, on $\( 0 \, 1 \]$ the function $\| log
    s \|^2$ is decreasing and integrable, so its right-endpoint grid sum times $epsilon.alt$ is at most its
    integral there; on $\[ 1 \, T \]$ it is bounded by $\( log T \)^2$.
    The constants $C_T$ in this proof can depend on $T$ and the fixed data, but not on $R$ or $N$.
  For $n < tau_N$ the spatial increment can be written exactly as
  $ x_(n + 1) - x_n = epsilon.alt xi_n Q_0 \( z_n \) + epsilon.alt xi_n #scale(x: 120%, y: 120%)[\(]
    Q_(xi_n) \( z_n \) - Q_0 \( z_n \) #scale(x: 120%, y: 120%)[\)] \, $
  where $Q_1 = Q_(+)$ and $Q_(- 1) = Q_(-)$. Extend both kinds of increments by zero after stopping.
    The first summands are martingale differences, since the active-step indicator and $Q_0 \( z_n \)$ are known
    before the fair sign. For a deterministic truncation in the number of steps,
    Doob’s $L^2$ maximal inequality and orthogonality of these differences give an upper bound
  $ 2 (bb(E) sum_(n < tau_N) epsilon.alt^2 \| Q_0 \( z_n \) \|^2)^(1 \/ 2) $
  for the expected supremum of the norm of their partial sums.
    Letting the truncation increase preserves this bound by monotone convergence of the suprema.
    On each path, the sum of the norms of the other increments is at most
  $ \( epsilon.alt^2 tau_N \)^(1 \/ 2)
    (sum_(n < tau_N) #scale(x: 120%, y: 120%)[\(] \| Q_(+) \( z_n \) - Q_0 \( z_n \) \|^2 + \| Q_(-) \( z_n \) -
    Q_0 \( z_n \) \|^2 #scale(x: 120%, y: 120%)[\)])^(1 \/ 2) . $
  Cauchy–Schwarz in expectation gives the travel inequality
  #[#set math.equation(numbering: n => "(7.9)")
   $ bb(E) sup_(0 lt.eq n lt.eq tau_N) \| x_n \| & lt.eq
     2 (bb(E) sum_(n < tau_N) epsilon.alt^2 \| Q_0 \( z_n \) \|^2)^(1 \/ 2)\
 & quad + (bb(E) \( epsilon.alt^2 tau_N \))^(1 \/ 2)\
 & wide times
   (bb(E) sum_(n < tau_N) #scale(x: 120%, y: 120%)[\(] \| Q_(+) \( z_n \) - Q_0 \( z_n \) \|^2 + \| Q_(-) \(
   z_n \) - Q_0 \( z_n \) \|^2 #scale(x: 120%, y: 120%)[\)])^(1 \/ 2) . $ <eq:contact-travel-inequality>]
  This calculation uses only predictability of the coefficients of the fair signs in the reference increments,
    including the active-step indicators, and the pathwise bound on error lengths.
    It therefore applies as well to the displacement from the starting point of a stopped portion after a stopping
    time, with its increments extended by zero outside that portion. Equations (7.7) and (7.8) now show that
  #[#set math.equation(numbering: n => "(7.10)")
   $ bb(E) sup_(0 lt.eq n lt.eq tau_N) \| x_n \| lt.eq C_T #scale(x: 120%, y: 120%)[\(] L \( B \) +
     sqrt(B_0) #scale(x: 120%, y: 120%)[\)] lt.eq C'_T L \( B \)^2 . $ <eq:contact-original-travel>]
  The probability of a horizontal stop is at most the right side of (7.10) divided by $R$.
    For fixed $T$ this tends to zero as $R arrow.r oo$. Choose an integer $T gt.eq 8$,
    and then choose $R$ large enough that the horizontal-stop probability is at most $1 \/ 8$, uniformly in $N$.
    Fix these $T \, R$ for the rest of the proof, so $B$ and $B_0$ are now fixed finite constants. If
  $ eta_N = upright(bold(1))_({ t_(tau_N) = delta_N }) \, $
  the two preceding bounds and the definition of the stop imply
  #[#set math.equation(numbering: n => "(7.11)")
   $ bb(P) \( eta_N = 1 \) gt.eq 3 / 4 wide \( N gt.eq 1 \) . $ <eq:contact-lower-hit-probability>]
  This remains true if the lower time level and the horizontal cutoff are reached simultaneously,
    since that case has $eta_N = 1$.
  #emph[Marks and localization in fitted frames.] For $1 lt.eq j lt.eq N$, let
  $ sigma_(j \, N) = tau_N and inf { n gt.eq 0 : t_n = delta_j } \, wide z_j = \( x_j \, t_j \) = z_(sigma_(j \, N)) . $
  Thus a mark is the first point on its time level, or the terminal point if the walk stops before that level.
    The divisibility of the grid ensures $t_j gt.eq delta_j$, with equality on ${ eta_N = 1 }$.
    At the time of this mark choose a fit $\( p_j \, a_j \)$ at $z_j$ of radius $delta_j$.
    These choices can again be made on the countable tree of histories,
    so the parameters are $cal(F)_(sigma_(j \, N))$-measurable.
    The bound on fit parameters on boxes gives, for a fixed constant independent of $N$,
  $ \| p_j \| + \| a_j \| lt.eq Gamma_j := C #scale(x: 120%, y: 120%)[\(] L \( B \) +
    j #scale(x: 120%, y: 120%)[\)] \, wide j lt.eq N \, $
  increasing $C$ to make every $Gamma_j gt.eq 1$.
  The cutoffs $T \, R$ and the error bound $B_0$ are now fixed.
    We will choose two further cutoffs, uniformly in $j \, N$, to control the terminal point in each fitted frame.
    Fix $1 lt.eq j lt.eq N$, put $r = delta_j$, and let $cal(R)_(j \, N) = { t_j =
    r }$ be the event that the level $r$ is reached, including the case where it is reached at the original stop.
    This event is $cal(F)_(sigma_(j \, N))$-measurable. On it $z_j = \( x_j \, r \)$,
    so we may apply Lemma 25 pathwise with the chosen fit $\( p_j \, a_j \)$. In its coordinates,
  $ s = t / r \, wide y = frac(x - x_j - p_j \( t - r \), r) \, wide epsilon.alt' = epsilon.alt_N / r . $
  The transformed solution $macron(v)$ is centered at $\( 0 \, 1 \)$ and has the same Jensen bound.
    Its $macron(W)$ therefore has the standing properties of Section 6.
    The mapped steps are optimizing steps, and (6.15) gives identical squared velocity discrepancies.
    Contact at this finite mark is not needed. The fit and frame are known at the marking time and will be held
    fixed afterward.
  On $cal(R)_(j \, N)$ consider the portion of the original walk from its $j$-th mark to its stop,
    with the additional rule that this portion stops on first reaching $s = M$ or $\| y \| gt.eq K$,
    where $M gt.eq 2$ is an integer and $K gt.eq 2$. It includes the endpoint of this additional stopping rule.
    If the original walk stopped at the mark, the portion has no steps.
    A hit of an additional cutoff simultaneous with the original stop is counted as a hit of that additional
    cutoff. On $cal(R)_(j \, N)^(upright(c))$ define the portion to be empty as well,
    and assign zero to all its sums and spatial suprema. Let $n'$ be its number of steps,
    and write $sum'$ for a sum over its pre-step states.
  The total squared velocity error on this portion, in the new frame, has the unconditional bound
  #[#set math.equation(numbering: n => "(7.12)")
   $ bb(E) sum' #scale(x: 120%, y: 120%)[\(] \| Q'_(+) - Q'_0 \|^2 + \| Q'_(-) -
     Q'_0 \|^2 #scale(x: 120%, y: 120%)[\)] lt.eq B_0 . $ <eq:contact-frame-error-budget>]
  Indeed, on each path the sum is a subsum of the original sum in (7.7), with identical summands by (6.15);
    on an empty portion it is zero. This argument gives an unconditional estimate.
    It makes no assertion that the same bound holds after conditioning on a particular history at the mark.
  The time-walk estimates, in contrast, do hold conditionally on that history.
    On $cal(R)_(j \, N)$ the new time starts at $s = 1$ and has step $epsilon.alt' = epsilon.alt_N \/ r lt.eq
    1 \/ 4$, which divides $1$ and $M$. Given $cal(F)_(sigma_(j \, N))$, the subsequent signs remain fair.
    The portion is stopped no later than the unrestricted new time walk first hits $0$ or $M$.
    Its conditional expected visits to each interior level are therefore at most $C M \/
    epsilon.alt'$ by the same visit argument used above. Before any step of the portion,
    the original walk is still live, so $s = t \/ r > delta_N \/ r gt.eq 4 epsilon.alt'$.
    Also $\| y \| < K$ and $s < M$ before the additional stop.
    Lemma 26 applies to the centered $macron(v)$ and its $macron(W)$ uniformly,
    and bounds $\| Q'_0 \|$ by $C \( L \( K + M + 2 \) + \| log s \| \)$. The integrable logarithmic grid sum gives
  #[#set math.equation(numbering: n => "(7.13)")
   $ bb(E) #scale(x: 120%, y: 120%)[\(] \( epsilon.alt' \)^2 n' divides cal(F)_(sigma_(j \, N))
     #scale(x: 120%, y: 120%)[\)] & lt.eq C M^2 upright(bold(1))_(cal(R)_(j \, N)) \,\
bb(E) (sum' \( epsilon.alt' \)^2 \| Q'_0 \|^2 thin mid(bar.v) thin cal(F)_(sigma_(j \, N))) & lt.eq
  C_M L \( K + M + 2 \)^2 upright(bold(1))_(cal(R)_(j \, N)) . $ <eq:contact-frame-time-budget>]
  The frame is known at the conditioning time, and the estimates of the centered class have constants independent
    of that frame. This explains the uniformity of these conditional bounds.
    Integrating them gives the same bounds unconditionally without the indicator.
  Extend the new increments by zero outside the portion. Their reference part is $epsilon.alt' xi_n
    Q'_0$ and their error part is $epsilon.alt' xi_n \( Q'_(xi_n) - Q'_0 \)$.
    The reference increments are martingale differences after the random starting mark:
    the fit and reached event are known at that mark, and on an active step the indicator and $Q'_0 = Q_0 -
    p_j$ are $cal(F)_n$-measurable while $xi_n$ is still fair given $cal(F)_n$.
    Thus the calculation of (7.9) applies in the primed variables.
    Using the integrated bounds from (7.13) and the unconditional bound (7.12), it gives
  #[#set math.equation(numbering: n => "(7.14)")
   $ bb(E) (sup_(upright("points of the portion")) \| y \|) lt.eq
     C'_M #scale(x: 120%, y: 120%)[\(] L \( K + M + 2 \) + sqrt(B_0) #scale(x: 120%, y: 120%)[\)] .
     $ <eq:contact-frame-travel>]
  The supremum is understood to be zero for an empty portion.
    In particular, the probability that this portion reaches $\| y \| gt.eq
    K$ is at most the right side of (7.14) divided by $K$. The probability it reaches $s = M$ is at most $1 \/ M$:
    conditionally on reaching the mark, the unrestricted symmetric time walk starting from $1$ hits $M$ before $0$
    with probability $1 \/ M$, and an earlier stop only removes this event.
  Choose a fixed integer $M gt.eq 8$, and then choose $K$ so large that
  $ frac(C'_M #scale(x: 120%, y: 120%)[\(] L \( K + M + 2 \) + sqrt(B_0) #scale(x: 120%, y: 120%)[\)], K) lt.eq
    1 / 8 . $
  This is possible because $B_0$ is already fixed and $L \( K + M + 2 \) \/ K arrow.r 0$.
    On ${ eta_N = 1 }$ the $j$-th level is reached. If neither additional cutoff intervenes,
    the terminal point is in the portion and has $\| y \| lt.eq K$.
    Combining this observation with (7.11) and the two additional-cutoff probabilities proves,
    uniformly for $j lt.eq N$,
  #[#set math.equation(numbering: n => "(7.15)")
   $ bb(P) (eta_N = 1 \, quad \| x_(tau_N) - x_j - p_j \( t_(tau_N) - delta_j \) \| lt.eq K delta_j) gt.eq 3 / 4 -
     1 / 8 - 1 / 8 = 1 / 2 . $ <eq:contact-finite-localization>]
  #emph[One limiting law and the contact properties.] We use one fixed compact space for all these laws. Define
  $ cal(K)_j = cal(B) times overline(B)_(Gamma_j) \( 0 \) times \[ - Gamma_j \, Gamma_j \] \, wide cal(X) =
    cal(B) times { 0 \, 1 } times product_(j = 1)^oo cal(K)_j . $
  The coordinates are the terminal point, the flag, and the marked point and fit at each index.
    This countable product of compact metric spaces is compact and metrizable.
    For indices $j > N$, fill the coordinates by any fixed point of $cal(K)_j$;
    these dummy entries need not be fits. Let $mu_N$ be the law on $cal(X)$ of the terminal point $z_(tau_N)$,
    the flag $eta_N$, and the marked points and fits. Compactness of the space of probability measures on a
    compact metric space gives a subsequence converging weakly to a probability law $mu$;
    all subsequent limits in $N$ are along this subsequence. Denote its coordinates by
    $z_(upright("end")) = \( x_(upright("end")) \, t_(upright("end")) \)$, $eta$, and $\( z_j \, p_j \, a_j \)$.
  Here are first the properties that pass directly to this law.
    The flag is a coordinate in a discrete space, so its probability converges and $mu \( eta = 1 \) gt.eq
    3 \/ 4$. Also the continuous nonnegative function $eta t_(upright("end"))$ on $cal(X)$ has integral at most
    $delta_N$ under $mu_N$. Its integral under $mu$ is zero. It follows that $t_(upright("end")) =
    0$ almost surely on ${ eta = 1 }$. For each fixed $j$, the sets ${ t_j gt.eq delta_j }$ and ${ eta =
    0 } union { t_j = delta_j }$ are closed and have $mu_N$-measure one for all $N gt.eq j$.
    The closed-set direction of the Portmanteau Theorem, $limsup_N mu_N \( F \) lt.eq mu \( F \)$,
    makes their $mu$-measures one. Fits at the specified radius form a closed subset of $cal(K)_j$.
    To see this without varying the sheared domain, write its increments in (3.2) as
  $ ell = delta_j theta \, wide h = p_j delta_j theta + delta_j zeta \, wide \| theta \| lt.eq 1 \,
    quad \| zeta \| lt.eq 1 . $
  For each $\( theta \, zeta \)$ the fitting inequality is closed in $\( z_j \, p_j \, a_j \)$ by continuity of
    $v$, and their intersection over this fixed compact set of increments is closed.
    Portmanteau therefore also passes the fitting property to $mu$.
    Taking the intersection of the resulting full-measure sets for all $j$, we have
  #[#set math.equation(numbering: n => "(7.16)")
   $ t_(upright("end")) = 0 upright(" on ") { eta = 1 } \, wide t_j gt.eq delta_j upright(" and ") t_j =
     delta_j upright(" on ") { eta = 1 } \,\
\( p_j \, a_j \) upright(" is a fit at ") z_j upright(" of radius ") delta_j quad upright("for every ") j \,
  $ <eq:contact-mark-limit>]
  almost surely.
  Two further properties come from the expectation bounds:
  #[#set math.equation(numbering: n => "(7.17)")
   $ H_v \( z_(upright("end")) \) > - oo \, wide W \( z_j \) = v \( z_j \) quad \( j gt.eq 1 \) wide
     upright("almost surely under ") mu . $ <eq:contact-limit-properties>]
  For the first, fix $ell > 0$ and set
  $ Phi_ell \( z \) = 1 / 2 #scale(x: 120%, y: 120%)[\(] cal(S)_ell^(+) v \( z \) +
    cal(S)_ell^(-) v \( z \) #scale(x: 120%, y: 120%)[\)] . $
  This is a finite continuous function on $cal(B)$. For all sufficiently large $N$, $epsilon.alt_N lt.eq ell$,
    and monotonicity of both slopes with respect to their length and (6.3) give $J_(epsilon.alt_N) lt.eq Phi_ell$.
    Apply (7.6) at $tau_N$ and pass to the weak limit using this fixed continuous function and (6.4). The result is
  #[#set math.equation(numbering: n => "(7.18)")
   $ integral Phi_ell \( z_(upright("end")) \) thin d mu gt.eq
     H_(*) wide \( ell > 0 \) . $ <eq:contact-terminal-slopes>]
  Take a decreasing sequence $ell_h arrow.b 0$ with $ell_h lt.eq 1$.
    The functions $Phi_(ell_h)$ decrease to $H_v$ pointwise, because the two slope limits agree for $v$.
    Their uniform upper bound on $cal(B)$ is $U_B$ after increasing its fixed constant.
    Hence $U_B - Phi_(ell_h) \( z_(upright("end")) \)$ are nonnegative and increase to $U_B -
    H_v \( z_(upright("end")) \)$. Monotone convergence and (7.18) give
  $ integral #scale(x: 120%, y: 120%)[\(] U_B - H_v \( z_(upright("end")) \) #scale(x: 120%, y: 120%)[\)] thin d
    mu lt.eq U_B - H_(*) < oo . $
  The integrand would be infinite where $H_v = - oo$, proving the first claim of (7.17).
  For the contact claim fix $j$ and let $nu_N^j$ and $nu^j$ be the marginals of $mu_N$ and $mu$ for the marked
    point $z_j$. They converge weakly. Suppose that $nu^j$ gives positive mass to ${ v - W > 0 }$.
    All these limit marks have $t gt.eq delta_j$. Since $v - W$ is continuous and nonnegative for $t > 0$,
    there is $alpha > 0$ such that the relatively open set
  $ U = { \( x \, t \) in cal(B) : t > delta_j \/ 2 \, med v \( x \, t \) - W \( x \, t \) > alpha } $
  has $nu^j \( U \) > 0$ and its closure is contained in ${ t gt.eq delta_j \/ 2 \, med v - W gt.eq alpha }$.
    For example, first choose $alpha$ with positive mass where $v - W > 2 alpha$.
    The zero-length continuity of the quadratic envelopes is uniform on this compact closure. Thus (6.2) gives
  $ 2 epsilon.alt_N J_(epsilon.alt_N) \( z \) lt.eq - alpha / 2 $
  on $U$ for all sufficiently large $N$. In particular, $J_(epsilon.alt_N) lt.eq -
    alpha \/ \( 4 epsilon.alt_N \)$ on $U$. By the open-set direction of Portmanteau, $nu^j \( U \) lt.eq
    liminf_N nu_N^j \( U \)$, so these probabilities are bounded below by a fixed positive number for large $N$.
    The uniform upper bound (7.4) on all marks and (7.6) at $sigma_(j \, N)$ would then give
  $ J_(epsilon.alt_N) \( z_(*) \) lt.eq integral J_(epsilon.alt_N) thin d nu_N^j lt.eq -
    frac(alpha, 4 epsilon.alt_N) nu_N^j \( U \) + U_B #scale(x: 120%, y: 120%)[\(] 1 -
    nu_N^j \( U \) #scale(x: 120%, y: 120%)[\)] arrow.r - oo . $
  This contradicts (6.4). Thus $W \( z_j \) = v \( z_j \)$ almost surely.
    A countable intersection proves this simultaneously for all $j$.
    The derivation of (7.17) used unconditional expectations; it does not require conditioning on the flag.
  For each fixed $j$ define the subset of $cal(X)$
  $ E_j = {eta = 1 \, quad \| x_(upright("end")) - x_j - p_j \( t_(upright("end")) - delta_j \) \| lt.eq K delta_j} . $
  This event retains the actual terminal time in the prelimit laws. It is closed:
    the flag condition is closed and the norm is a continuous function of the terminal point,
    the $j$-th marked point, and $p_j$. Equation (7.15) gives $mu_N \( E_j \) gt.eq 1 \/ 2$ whenever $N gt.eq j$.
    The closed-set Portmanteau inequality has the direction
  $ mu \( E_j \) gt.eq limsup_(N arrow.r oo) mu_N \( E_j \) gt.eq 1 / 2 . $
  These events need not be independent. For every $h$ their tail union has measure at least $1 \/ 2$,
    since it contains each $E_j$ with $j gt.eq h$. Continuity of probability from above therefore gives
  $ mu (limsup_(j arrow.r oo) E_j) = lim_(h arrow.r oo) mu (union.big_(j gt.eq h) E_j) gt.eq 1 / 2 . $
  Choose one outcome in this limsup event and in the full-measure sets of (7.16)–(7.17).
    Every $E_j$ includes $eta = 1$, so this outcome has $t_(upright("end")) = 0$ and $t_j =
    delta_j$ for every $j$. It belongs to $E_j$ for an infinite set of indices,
    at each of which its localization inequality is
  $ \| x_(upright("end")) - x_j + p_j delta_j \| lt.eq K delta_j . $
  The same outcome has a finite common slope at the endpoint, contact at all the marks, and the indicated fits.
    Its endpoint and the infinite set of these marks establish (7.1). ◻
]

== 8 Rigidity of the final limit <sec:rigidity>

The propagation result produces contacts at shrinking scales near one terminal point.
  The finite slope at that point makes the final limit have constant forward and backward envelope slopes at every
  length. We first show why this forces an affine function.

#thm([Lemma 8.1.])[
  (Rigidity from constant envelope slopes).  #emph[Let $v in cal(A)_(m \, C_0)$,
    with the class and envelopes defined in Section 4. Suppose that for some $\( b \, t_0 \) in bb(R)^m times
    bb(R)$ and $B in bb(R)$,
#[#set math.equation(numbering: n => "(8.1)")
 $ cal(S)_ell^(+) v \( b \, t_0 \) = cal(S)_ell^(-) v \( b \, t_0 \) = B wide
   upright("for every ") ell > 0 . $ <eq:constant-envelope-slopes>]

 Then $v$ is affine.]
] <lem:slope-rigidity>

#proof[
  Translate $\( b \, t_0 \)$ to $\( 0 \, 0 \)$ and subtract the value there; write $V$ for the resulting function.
    These changes preserve the class and the envelope slopes.
    The forward equality in (8.1) gives $cal(P)_t V \( 0 \, 0 \) = B t$ for $t > 0$, and therefore
  #[#set math.equation(numbering: n => "(8.2)")
   $ V \( y \, t \) lt.eq B t + frac(\| y \|^2, 2 t) wide \( t > 0 \) . $ <eq:future-paraboloid>]
  Fix any $\( x \, t \) in bb(R)^m times bb(R)$. At a large length $ell$,
    a maximizing position $y_ell$ for $cal(P)_ell V \( x \, t \)$ satisfies
  #[#set math.equation(numbering: n => "(8.3)")
   $ \| y_ell \| lt.eq C_(x \, t) ell \( 1 + log ell \)^2 . $ <eq:rigidity-optimizer-bound>]
  This is the optimizer estimate from Section 4, applied on a box of size comparable to $ell$;
    the translated function has the same growth estimates with constants depending on a fixed value and fit.
    Explicitly, if the displacement is $b_ell ell$ with $b_ell gt.eq 2$,
    comparison with zero displacement and the bound $\| V \( y \, s \) \| lt.eq
    C K \( 1 + log K \)^2$ on boxes of size $K$ give
  $ b_ell lt.eq C_(x \, t) \( 1 + log ell + log b_ell \)^2 . $
  Absorbing the logarithmic term in $b_ell$ gives $b_ell lt.eq C'_(x \, t) \( 1 + log ell \)^2$, which proves (8.3).
  For $ell$ sufficiently large, $t + ell > 0$, so (8.2) applies at the optimizer.
    The difference between the two quadratic costs is
  $ frac(\| y_ell \|^2, 2 \( t + ell \)) - frac(\| y_ell - x \|^2, 2 ell) & = -
    frac(t \| y_ell \|^2, 2 ell \( t + ell \)) + frac(x dot.op y_ell, ell) - frac(\| x \|^2, 2 ell)\
 & = O_(x \, t) #scale(x: 120%, y: 120%)[\(] \( 1 + log ell \)^4 #scale(x: 120%, y: 120%)[\)] = o \( ell \) $
  by (8.3). Consequently
  $ limsup_(ell arrow.r oo) cal(S)_ell^(+) V \( x \, t \) lt.eq B . $
  The forward slopes are nondecreasing in $ell$ by Lemma 17.
    Thus $cal(S)_ell^(+) V \( x \, t \) lt.eq B$ for every $ell > 0$.
    Evaluating the envelope at any competitor gives the global directed comparison
  #[#set math.equation(numbering: n => "(8.4)")
   $ V \( y \, t + ell \) - V \( x \, t \) lt.eq B ell + frac(\| y - x \|^2, 2 ell)
     wide \( x \, y in bb(R)^m \, med t in bb(R) \, med ell > 0 \) . $ <eq:directed-comparison>]
  The envelopes are attained by Lemma 16. At the origin, (8.1) therefore supplies, for every $ell \, r > 0$,
    a forward equality point $\( ell q_(+) \, ell \)$ and a backward equality point $\( - r q_(-) \, - r \)$, with
  $ V \( ell q_(+) \, ell \) = B ell + 1 / 2 ell \| q_(+) \|^2 \, wide V \( - r q_(-) \, - r \) = - B r - 1 /
    2 r \| q_(-) \|^2 . $
  Apply (8.4) directly from the backward point to the forward point. After canceling $B \( ell + r \)$, it gives
  $ 0 gt.eq frac(ell \| q_(+) \|^2 + r \| q_(-) \|^2, 2) - frac(\| ell q_(+) + r q_(-) \|^2, 2 \( ell + r \)) =
    frac(ell r, 2 \( ell + r \)) \| q_(+) - q_(-) \|^2 . $
  Hence every forward and backward equality velocity is one vector $q$, independent of all lengths and choices. We have
  $ V \( q s \, s \) = \( B + \| q \|^2 \/ 2 \) s wide \( s in bb(R) \) . $
  Let $A \( x \, t \) = q dot.op x + \( B - \| q \|^2 \/ 2 \) t$.
    Comparing $\( x \, t \)$ to a point $\( q s \, s \)$ on this line in (8.4) yields
  $ V \( x \, t \) lt.eq A \( x \, t \) + frac(\| x - q t \|^2, 2 \( t - s \)) quad \( s < t \) \, wide
    V \( x \, t \) gt.eq A \( x \, t \) - frac(\| x - q t \|^2, 2 \( s - t \)) quad \( s > t \) . $
  Letting $s arrow.r - oo$ and $s arrow.r + oo$ proves $V = A$. ◻
]

#proof[
  Suppose that the class contains a nonaffine function. Proposition 22 supplies a centered solution $v$,
    a number $kappa > 0$, and its subsolution envelope
  $ W \( x \, t \) = cal(C)_t v \( x \, t \) - kappa^2 t \/ 2 wide \( t > 0 \) $
  with the stated contact and finite-slope properties. Proposition 27 supplies a point $x_(upright("end"))$,
    infinitely many indices $j$ with $r_j = 2^(- j)$, contacts $\( x_j \, r_j \)$,
    and fits $\( p_j \, a_j \)$ there of radius $r_j$, such that
  #[#set math.equation(numbering: n => "(8.5)")
   $ H_v \( x_(upright("end")) \, 0 \) > - oo \, wide W \( x_j \, r_j \) = v \( x_j \, r_j \) \,
     wide \| x_(upright("end")) - x_j + p_j r_j \| lt.eq K r_j $ <eq:final-contact-data>]
  for one finite $K$.
  Apply Lemma 25 at each of these marks, and denote the transformed functions by $macron(v)_j$.
    Their images of $\( x_(upright("end")) \, 0 \)$ are $\( b_j \, 0 \)$, where
  $ b_j = frac(x_(upright("end")) - x_j + p_j r_j, r_j) . $
  These vectors are bounded by (8.5). Every $macron(v)_j$ has value zero and the zero fit of radius one at
    $\( 0 \, 1 \)$. Lemma 15 gives a subsequence for which $macron(v)_j arrow.r
    v_oo$ locally uniformly and $b_j arrow.r b$. The uniform growth bounds also give convergence of the forward
    and backward envelopes at each fixed positive length, by Lemma 16.
  The slope covariance (6.14) gives
  $ cal(S)_ell^plus.minus macron(v)_j \( b_j \, 0 \) = cal(S)_(r_j ell)^plus.minus
    v \( x_(upright("end")) \, 0 \) - a_j wide \( ell > 0 \) . $
  Let $B = cal(S)_1^(+) v_oo \( b \, 0 \)$, which is finite.
    For each fixed $ell > 0$, subtract the equality with the forward slope at length one:
  $ cal(S)_ell^plus.minus macron(v)_j \( b_j \, 0 \) - cal(S)_1^(+) macron(v)_j \( b_j \, 0 \) & =
    cal(S)_(r_j ell)^plus.minus v \( x_(upright("end")) \, 0 \) - cal(S)_(r_j)^(+) v \( x_(upright("end")) \, 0 \)\
 & arrow.r 0 . $
  The limit is zero because both unshifted slopes tend to the same finite value
    $H_v \( x_(upright("end")) \, 0 \)$. Passing to the limit on the left gives
  $ cal(S)_ell^(+) v_oo \( b \, 0 \) = cal(S)_ell^(-) v_oo \( b \, 0 \) = B wide \( ell > 0 \) . $
  This argument uses each fixed length along the same locally convergent subsequence;
    no convergence of the individual shifts $a_j$ is required. Lemma 28 now makes $v_oo$ affine.
  The contacts retain a positive envelope gap. By (5.9) at the contacts in (8.5) and the gap covariance (6.13),
  $ cal(C)_1 macron(v)_j \( 0 \, 1 \) - macron(v)_j \( 0 \, 1 \) = kappa^2 \/ 2 . $
  Lemma 19 passes this identity to the locally uniform limit with its uniform growth bound. Thus
  $ cal(C)_1 v_oo \( 0 \, 1 \) - v_oo \( 0 \, 1 \) = kappa^2 \/ 2 > 0 . $
  For an affine function, the average of its values at any configuration is its value at the barycenter,
    so the nonnegative variance penalty makes $cal(C)_1 v_oo = v_oo$. This contradiction proves Theorem 8.
    The reduction in Section 3 then proves Theorem 1. ◻
]

#heading(level: 1)[References]
#bibitem([1])[S.~N.~Armstrong, M.~G.~Crandall, V.~Julin, and C.~K.~Smart,
  #emph[Convexity criteria and uniqueness of absolutely minimizing functions], Arch. Ration. Mech. Anal.
  #strong[200] (2011), no.~2, 405--443.
  #link("https://doi.org/10.1007/s00205-010-0348-0")[doi:10.1007/s00205-010-0348-0].]
#bibitem([2])[S.~N.~Armstrong and C.~K.~Smart, #emph[An easy proof of Jensen's theorem on the uniqueness of
  infinity harmonic functions], Calc. Var. Partial Differential Equations #strong[37] (2010), nos.~3--4, 381--384.
  #link("https://doi.org/10.1007/s00526-009-0267-9")[doi:10.1007/s00526-009-0267-9].]
#bibitem([3])[G.~Aronsson, #emph[Extension of functions satisfying Lipschitz conditions], Ark. Mat.
  #strong[6] (1967), 551--561. #link("https://doi.org/10.1007/BF02591928")[doi:10.1007/BF02591928].]
#bibitem([4])[G.~Aronsson, #emph[On certain singular solutions of the partial differential equation $u_x^2
  u_(x x) + 2 u_x u_y u_(x y) + u_y^2 u_(y y) = 0$], Manuscripta Math. #strong[47] (1984), nos.~1--3, 133--151.
  #link("https://doi.org/10.1007/BF01174590")[doi:10.1007/BF01174590].]
#bibitem([5])[K.~K.~Brustad, #emph[Infinity-harmonic functions in the plane:
  Regularity by injectivity], preprint, June 6, 2026, #link("https://arxiv.org/abs/2606.08257v1")[arXiv:2606.08257v1].]
#bibitem([6])[M.~G.~Crandall and L.~C.~Evans, #emph[A remark on infinity harmonic functions], Electron. J.
  Differential Equations Conf. #strong[6] (2001), 123--129.
  #link("https://ejde.math.txstate.edu/conf-proc/06/c6/crandall.pdf")[Journal PDF].]
#bibitem([7])[M.~G.~Crandall, L.~C.~Evans, and R.~F.~Gariepy,
  #emph[Optimal Lipschitz extensions and the infinity Laplacian], Calc. Var.
  Partial Differential Equations #strong[13] (2001), no.~2, 123--139.
  #link("https://doi.org/10.1007/s005260000065")[doi:10.1007/s005260000065].]
#bibitem([8])[M.~G.~Crandall, H.~Ishii, and P.-L.~Lions, #emph[User's guide to viscosity solutions of second order
  partial differential equations], Bull. Amer. Math. Soc. (N.S.) #strong[27] (1992), no.~1, 1--67.
  #link("https://doi.org/10.1090/S0273-0979-1992-00266-5")[doi:10.1090/S0273-0979-1992-00266-5].]
#bibitem([9])[L.~C.~Evans and O.~Savin, #emph[$C^(1 \, alpha)$ regularity for infinity harmonic functions in two
  dimensions], Calc. Var. Partial Differential Equations #strong[32] (2008), no.~3, 325--347.
  #link("https://doi.org/10.1007/s00526-007-0143-4")[doi:10.1007/s00526-007-0143-4].]
#bibitem([10])[L.~C.~Evans and C.~K.~Smart, #emph[Everywhere differentiability of infinity harmonic functions],
  Calc. Var. Partial Differential Equations #strong[42] (2011), nos.~1--2, 289--299.
  #link("https://doi.org/10.1007/s00526-010-0388-1")[doi:10.1007/s00526-010-0388-1].]
#bibitem([11])[R.~Jensen, #emph[Uniqueness of Lipschitz extensions:
  minimizing the sup norm of the gradient], Arch. Ration. Mech. Anal. #strong[123] (1993), no.~1, 51--74.
  #link("https://doi.org/10.1007/BF00386368")[doi:10.1007/BF00386368].]
#bibitem([12])[F.~Peng, Y.~R.-Y.~Zhang, and Y.~Zhou, #emph[Regularity from $p$-harmonic potentials to
  $oo$-harmonic potentials in convex rings], Proc. Lond. Math. Soc.
  (3) #strong[130] (2025), no.~6, article e70062. #link("https://doi.org/10.1112/plms.70062")[doi:10.1112/plms.70062].]
#bibitem([13])[Y.~Peres, O.~Schramm, S.~Sheffield, and D.~B.~Wilson, #emph[Tug-of-war and the infinity Laplacian],
  J. Amer. Math. Soc. #strong[22] (2009), no.~1, 167--210.
  #link("https://doi.org/10.1090/S0894-0347-08-00606-1")[doi:10.1090/S0894-0347-08-00606-1].]
#bibitem([14])[O.~Savin, #emph[$C^1$ regularity for infinity harmonic functions in two dimensions], Arch. Ration.
  Mech. Anal. #strong[176] (2005), no.~3, 351--361.
  #link("https://doi.org/10.1007/s00205-005-0355-8")[doi:10.1007/s00205-005-0355-8].]
#bibitem([15])[K.~Xu, #emph[Infinity-harmonic functions and inverse mean curvature flow clusters], preprint,
  July 7, 2026, #link("https://arxiv.org/abs/2607.06698v1")[arXiv:2607.06698v1].]
