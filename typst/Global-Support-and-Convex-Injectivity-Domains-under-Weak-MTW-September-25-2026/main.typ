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

#align(center)[#text(size: 16pt, weight: "bold")[Global Support and Convex Injectivity Domains under Weak MTW]]
#align(center)[OpenAI]
#align(center)[September 25, 2026]

== 1 Introduction <sec:introduction>

The squared geodesic distance is smooth before the cut locus,
  but optimal transport and its supporting functions naturally reach that boundary.
  The weak Ma–Trudinger–Wang condition controls the cost Hessian only in directions perpendicular to a velocity
  segment. We prove that this transverse condition already forces global convexity and supporting geometry at
  arbitrary minimizing endpoints, including conjugate cut points.

=== 1.1 Weak MTW and convexity <weak-mtw-and-convexity>

Let $\( M \, g \)$ be a smooth, connected, compact Riemannian manifold without boundary, of dimension $n gt.eq 2$.
  Write $d$ for its geodesic distance, $exp_x : T_x M arrow.r M$ for its exponential map,
  and $\| dot.op \|_x$ and $chevron.l dot.op \, dot.op chevron.r_x$ for the norm and inner product of $g_x$.
  The open tangent injectivity domain is

#[#set math.equation(numbering: n => "(1.1)")
 $ I \( x \) = {v in T_x M : med upright("there is ") a > 1 upright(" such that ") d \( x \, exp_x \( a v \) \) =
   a \| v \|_x} . $ <eq:injectivity-domain>]

Its geodesics remain minimizing beyond time one. Put $c \( x \, y \) = d \( x \, y \)^2 \/ 2$. Our MTW convention is

#[#set math.equation(numbering: n => "(1.2)")
 $ frak(S)_(\( x \, v \)) \( xi \, eta \) = - 3 / 2 frac(partial^4, partial s^2 partial t^2) c
   #scale(x: 120%, y: 120%)[\(] exp_x \( t xi \) \, exp_x \( v + s eta \)
   #scale(x: 120%, y: 120%)[\)]\|_(s = t = 0) \, wide v in I \( x \) . $ <eq:mtw-definition>]

The cost is smooth near the pairs used here, as recalled in 2. Throughout the paper we assume precisely

#[#set math.equation(numbering: n => "(1.3)")
 $ chevron.l xi \, eta chevron.r_x = 0 quad arrow.r.double quad frak(S)_(\( x \, v \)) \( xi \, eta \) gt.eq
   0 wide \( x in M \, med v in I \( x \) \, med xi \, eta in T_x M \) . $ <eq:weak-mtw>]

No condition on nonorthogonal pairs, strict lower bound, nonfocality,
  or prior convexity of $I \( x \)$ is assumed. Write $G_x = { p in T_x M :
  d \( x \, exp_x p \) = \| p \|_x }$ for the closed minimizing domain.

#thm([Theorem 1.1.])[
  (Convexity of injectivity domains).  #emph[If $\( M \, g \)$ satisfies (1.3),
    then $I \( x \)$ is convex for every $x in M$. More precisely, for every $v_0 \,
    v_1 in I \( x \)$ and $theta in \[ 0 \, 1 \]$,
$ \( 1 - theta \) v_0 + theta v_1 in I \( x \) . $

]
] <thm:main>

In fact the closed minimizing domain $G_x$ is convex as well (17).
  The conclusion is ordinary linear convexity; no strict convexity or regularity of the boundary is asserted.

Villani proposed that weak MTW should force convexity of every tangent injectivity domain
  #cite(label("Villani2011")) Section 4.2. In the compact setting of 1,
  the conjecture imposes neither nonfocality nor prior convexity.
  Figalli, Gallouët and Rifford proved the implication for nonfocal manifolds #cite(label("FGR2014")) Theorem 1.7,
  where minimizing geodesics reach cut strictly before their first conjugate point.
  Here and below the numbering in that citation refers to the published article. 1 removes this restriction:
  conjugate cut endpoints are allowed in every dimension $n gt.eq 2$.

Loeper and Villani connected MTW to cut geometry, obtaining convexity under strong MTW and nonfocality and
  treating some focal configurations under stronger geometric conditions #cite(label("LoeperVillani2010"));
  see also #cite(label("Figalli2010")) Section 3.5.2. Their work and the nonfocal theorem of
  #cite(label("FGR2014")) distinguish the two obstructions in the present problem.
  The cost may cease to be smooth along a proposed velocity segment,
  and weak MTW controls only directions perpendicular to that segment.
  Neither difficulty can be removed by applying smooth-cost concavity beyond its domain of definition.

=== 1.2 Global support and intermediate geometry <global-support-and-intermediate-geometry>

A #emph[potential] is a function $u \( x \) = max_y { - c \( x \, y \) - v \( y \) }$ for a continuous datum $v :
  M arrow.r bb(R)$; replacing $v$ by the dual transform $v \( y \) = max_x { - c \( x \, y \) -
  u \( x \) }$ gives a dual pair with nonnegative gap $u \( x \) + c \( x \, y \) + v \( y \)$.
  Such functions are Lipschitz and semiconvex. We use their ordinary semiconvex subdifferentials $partial
  u \( x \)$, identifying vectors and covectors by the metric. Define

$ Gamma_u = { \( x \, p \) : p in partial u \( x \) } \, wide Q_t f \( z \) = min_x {f \( x \) +
  frac(c \( x \, z \), t)} . $

#thm([Theorem 1.2.])[
  (Global support and intermediate geometry).  #emph[Under (1.3), every potential $u$,
    with its dual potential $v$, has the following properties.]
  + #emph[Every $p in partial u \( x \)$ belongs to $G_x$ and satisfies
$ u \( x' \) gt.eq u \( x \) + c \( x \, exp_x p \) - c \( x' \, exp_x p \) wide \( x' in M \) . $

 For every $0 < t < 1$, the map $F_t : Gamma_u arrow.r M$, $F_t \( x \, p \) = exp_x \( t p \)$,
   is a homeomorphism; $t p in I \( x \)$ and $x$ is the unique global minimizing pole of $Q_t
   u$ at $F_t \( x \, p \)$.]
  + #emph[For every dual pair $\( u \, v \)$, every $x$ and every $r$, the lifted section
$ cal(S)_x \( r \) = {p in G_x : u \( x \) + frac(\| p \|^2, 2) + v \( exp_x p \) lt.eq r} $

 is compact and convex. If it is nonempty and $r gt.eq 0$, then
$ "diam" cal(S)_x \( r \)^2 lt.eq 8 (r + "osc"_(p in cal(S)_x \( r \)) v \( exp_x p \)) . $

]
  + #emph[For $0 < t < 1$, one has $Q_t u = - Q_(1 - t) v in C^(1 \, 1) \( M \)$.
    Its $C^(1 \, 1)$ seminorm and the Lipschitz constants of the pole and momentum maps $F_t^(- 1)$ depend only on
    $M \, g \, t$. There are also $r_t \, b_t > 0$, depending only on $M \, g \, t$, such that, for $z =
    F_t \( x \, p \)$,
$ u \( x' \) + frac(c \( x' \, z \), t) gt.eq u \( x \) + frac(c \( x \, z \), t) + b_t d \( x \, x' \)^2 quad
  upright("if ") d \( x \, x' \) < r_t . $

 These constants can be chosen uniformly on compact subintervals of $\( 0 \, 1 \)$.]
  #emph[No density hypothesis is required.]
] <thm:foundation>

The detailed statements and proofs are Theorem 4.8, Corollary 4.10, Proposition 4.11.
  The distinction between intermediate times and time one is essential:
  only the support and minimizing-velocity assertions pass to time one.
  For instance, $u \( x \) = - c \( x \, y_0 \)$ has many poles with the same final endpoint.

=== 1.3 Supporting geometry and earlier methods <supporting-geometry-and-earlier-methods>

Ma, Trudinger and Wang introduced a strictly positive curvature condition in optimal-transport regularity theory
  #cite(label("MTW2005")); Trudinger and Wang treated its degenerate, nonnegative form,
  usually denoted A3w #cite(label("TW2009")) Section 1. Loeper established necessity for continuity in the
  smooth-cost setting and developed the supporting-mountain principle #cite(label("Loeper2009")).
  Kim and McCann gave its geometric formulation and a double-mountain principle under smooth-cost and
  illuminated-set hypotheses #cite(label("KM2010")) Theorem 4.10.
  For squared distance on a compact manifold, Figalli, Rifford and Villani obtained the global supporting
  principle, including endpoint closure, from weak MTW together with convex injectivity domains
  #cite(label("FRV2011")) Lemma 3.1. The issue here is to derive that convexity rather than assume it.

Several ingredients precede the MTW theory. The shortened-distance support inequality is #cite(label("CMS2001"))
  Claim 2.4. The endpoint-moving Jacobi trial used at a possible conjugate cut is related to the second-variation
  argument in #cite(label("CMS2001")) Proposition 2.5; the transverse MTW reduction and the joint
  radial–tangential growth contradiction are proved here. Intermediate injectivity at differentiability points and
  inverse estimates on compact subsets of a positive-Hessian set appear in #cite(label("CMS2001")) Lemma 5.3 and
  Claim 5.6. Our conclusion concerns the entire ordinary subgradient graph and gives bounds depending only on the
  geometry and the intermediate time.

The graph coordinates in the optional degree argument and the infimum regularization also have classical
  antecedents. Moreau developed quadratic inf-convolution and proximal decomposition #cite(label("Moreau1965"))
  Sections 3–5, 7 and 12; Minty’s monotone-graph coordinates are presented in #cite(label("AA1999"))
  Proposition 1.1 and adapted to transport-plan rectifiability in #cite(label("MPW2012")) Section 2.
  We prove the local semiconvex graph representation needed here.
  These constructions do not by themselves supply continuation through cut or the global support theorem.
  The resulting density-free geometry is distinct from the additional measure estimates needed for regularity of
  transport maps.

=== 1.4 The continuation argument <the-continuation-argument>

2 develops the minimizing-branch Hessian and index form without nonfocality.
  Proper radial shortening supplies smooth distance supports,
  and the divided Hessian decreases strictly with duration.
  These estimates also control the uniform constants in the intermediate conclusions.

The proof works on the entire ordinary subgradient graph of an arbitrary potential.
  A target is active at $x$ if it attains the maximum defining $u \( x \)$;
  an active log is any minimizing velocity to that target. Every ordinary subgradient is a convex combination of
  finitely many active logs. All minimizing logarithms of each active target are retained.
  These are finite local representations; the potential itself need not have finitely many targets.

At a first failing scale, limits from earlier scales show that the relevant finite convex hulls are still
  minimizing. The argument of 3 excludes conjugacy there. Transverse concavity confines a hypothetical conjugacy
  kernel to the segment direction; the radial Hessian identity then contradicts the growth forced by a Jacobi
  trial field.

To exclude local collisions of the graph projection, the finite active representations are compared before taking
  limits. The first-order inequalities force the positive-weight limiting velocities into an affine hyperplane
  perpendicular to the collision direction. The linear terms are then canceled exactly at the finite stage,
  before division by the squared collision distance and passage to the limit.
  Weak MTW and strict radial comparison give the contradiction.
  Invariance of domain now makes the projection a local homeomorphism.
  Compactness and a homotopy to the short-time graph homeomorphism make this covering one-sheeted.
  Capturing every minimizing logarithm excludes ordinary cuts and continues the construction to every time
  strictly below one. Closure yields global support at time one;
  convex lifted sections and two-sided intermediate supports give the remaining conclusions of 2.

An optional alternative in 5 replaces local injectivity by local quadratic growth and openness.
  A Jacobian-sign calculation, degree one, and the area formula then give the same conditional globalization.
  It reuses the common setup and is not needed for the main proof.

== 2 Minimizing velocities and the branch Hessian <sec:preliminaries>

Throughout the remaining sections we assume the weak MTW condition (1.3).
  A velocity is called #emph[nonconjugate] if the vertical differential $d_w exp_x : T_x M arrow.r
  T_(exp_x w) M$ is nonsingular. We write

$ L_x \( q \) & = { w in T_x M : exp_x w = q \, med \| w \|_x = d \( x \, q \) } \,\
G_x & = { w in T_x M : w in L_x \( exp_x w \) } \,\
cal(C) & = { \( x \, w \) in T M : w in G_x } \, wide cal(I) = { \( x \, w \) in T M : w in I \( x \) } \, $

and set $D = "diam" \( M \)$. Existence of minimizing geodesics shows that $L_x \( q \)$ is nonempty.
  Every velocity in $cal(C)$ has norm at most $D$. Continuity of the distance and the exponential map shows that
  $cal(C)$ is closed; as the base manifold is compact, $cal(C)$ is therefore compact.

We first record the index-form facts used below. For geometric background,
  see #cite(label("Calegari2013")) Sections 5.7–5.8; for the unrestricted energy second-variation formula,
  see #cite(label("Gorodski2016")) Proposition 5.3.8. The latter is the revised course chapter,
  whose formula allows tangential as well as normal variation fields.
  Along a geodesic $gamma : \[ 0 \, T \] arrow.r M$, let

#[#set math.equation(numbering: n => "(2.1)")
 $ Q_gamma \( X \, Y \) = integral_0^T #scale(x: 120%, y: 120%)[\(] chevron.l D_tau X \, D_tau Y chevron.r -
   chevron.l R \( X \, dot(gamma) \) dot(gamma) \, Y chevron.r #scale(x: 120%, y: 120%)[\)] thin d tau .
   $ <eq:index-form>]

Our curvature convention gives the Jacobi equation $D_tau^2 X + R \( X \, dot(gamma) \) dot(gamma) = 0$.
  Fields in (2.1) may be continuous and piecewise smooth. A constant-speed minimizing geodesic on $\[ 0 \, T \]$,
  with $T > 0$, also minimizes the fixed-endpoint energy $E \( alpha \) = 1 /
  2 integral_0^T \| dot(alpha) \|^2 thin d tau$. Indeed, Cauchy–Schwarz gives

$ E \( alpha \) gt.eq frac("length" \( alpha \)^2, 2 T) gt.eq
  frac(d \( gamma \( 0 \) \, gamma \( T \) \)^2, 2 T) = E \( gamma \) . $

Energy second variation therefore gives $Q_gamma \( Z \, Z \) gt.eq 0$ for every field with $Z \( 0 \) =
  Z \( T \) = 0$, without a normality restriction. Approximation gives the same assertion for piecewise smooth
  fields. Moreover, equality forces $Z$ to be a Jacobi field.
  Indeed, nonnegativity applied to $Z + t W$ implies $Q_gamma \( Z \, W \) =
  0$ for every endpoint-zero test field $W$. Integration by parts first gives the Jacobi equation on each smooth
  piece and then continuity of $D_tau Z$ at the break points. Thus $Z$ is a Jacobi field on the entire interval.

#thm([Lemma 2.1.])[
  (Interior characterization).  #emph[For every $x in M$,
#[#set math.equation(numbering: n => "(2.2)")
 $ I \( x \) subset G_x \, wide r G_x subset I \( x \) quad \( 0 lt.eq r < 1 \) . $ <eq:radial-interior>]

 A velocity $w in T_x M$ belongs to $I \( x \)$ if and only if it is the unique minimizing velocity from $x$ to
   $exp_x w$ and is nonconjugate. The set $cal(I)$ is open, and $c$ is smooth in a neighborhood of each pair
   $\( x \, exp_x w \)$ with $w in I \( x \)$. There is a number $rho > 0$ such that $\| w \|_x < rho$ implies $w
   in I \( x \)$ for every $x$.]
] <lem:interior-characterization>

#proof[
  The first inclusion in (2.2) follows from the definition.
    For $0 < r < 1$, a proper initial portion of the minimizing geodesic with velocity $w in
    G_x$ remains minimizing up to time $1 \/ r > 1$ when parametrized with initial velocity $r w$.
    Hence $r w in I \( x \)$. The case $r = 0$ follows from the constant geodesic.
  Suppose $w in I \( x \)$, and put $gamma \( tau \) = exp_x \( tau w \)$.
    There is a $T > 1$ for which $gamma \|_(\[ 0 \, T \])$ is minimizing.
    Any other minimizing geodesic from $x$ to $gamma \( 1 \)$, followed by $gamma \|_(\[ 1 \, T \])$,
    would be a minimizing curve of the same length from $x$ to $gamma \( T \)$.
    A minimizing curve has no corner, so its velocities agree at the joining point.
    Uniqueness for the geodesic equation then identifies the two initial geodesics.
    If $d_w exp_x$ were singular, a nonzero kernel vector would give a nonzero Jacobi field on $\[ 0 \, 1 \]$
    vanishing at both endpoints. Extend this field by zero to $\[ 0 \, T \]$.
    Its index form is zero, so the preceding observation makes the extension a Jacobi field on $\[ 0 \, T \]$.
    Its vanishing on $\( 1 \, T \)$ contradicts uniqueness for the Jacobi equation. Thus $w$ is nonconjugate.
  Conversely, suppose that $w$ is a unique minimizing velocity and is nonconjugate. The map
  #[#set math.equation(numbering: n => "(2.3)")
   $ Psi : T M arrow.r M times M \, wide Psi \( z \, u \) = \( z \, exp_z u \) $ <eq:exponential-pair-map>]
  has an invertible differential at $\( x \, w \)$. Choose neighborhoods on which it is a diffeomorphism.
    After shrinking its image neighborhood, every minimizing velocity for every pair in that neighborhood belongs
    to this inverse branch. To see this, a sequence of contrary minimizing velocities would have,
    by compactness of $cal(C)$, a subsequential limit minimizing from $x$ to $exp_x w$.
    Uniqueness makes this limit $w$, contradicting its exclusion from the open branch neighborhood.
    Every nearby pair has a minimizer, so its inverse-branch velocity is minimizing and is the unique minimizer.
    Thus an open neighborhood of $\( x \, w \)$ in $T M$ consists of minimizing velocities.
    A small forward radial change of $w$ within this neighborhood proves $w in I \( x \)$.
    For $w = 0$, the same conclusion follows directly from the definition; also $L_x \( x \) =
    { 0 }$ and $d_0 exp_x = upright("Id")$.
  The inverse neighborhoods just constructed show that $cal(I)$ is open.
    On their image neighborhoods the true cost is half the squared norm of the smooth inverse-branch velocity,
    so it is smooth. Finally, $cal(I)$ contains the zero section.
    Its openness and compactness of the zero section give a uniform $rho > 0$ as asserted. ◻
]

=== 2.1 Smooth geodesic branches <smooth-geodesic-branches>

At any nonconjugate $\( x \, w \)$, the local inverse of (2.3) defines a smooth branch cost $hat(c) \( z \, q \)$:
  it is half the squared norm of the inverse-branch velocity. Define the symmetric bilinear form

#[#set math.equation(numbering: n => "(2.4)")
 $ A_x \( w \) = "Hess"_(x x) hat(c) \( x \, exp_x w \) \, $ <eq:branch-hessian>]

where the second endpoint is held fixed in taking the covariant Hessian.
  Local inverse branches agree near a prescribed velocity, so $A$ depends smoothly on $\( x \, w \)$ throughout
  the nonconjugate set. When $w in I \( x \)$, the branch cost agrees locally with $c$ by 3.
  At a nonconjugate minimizing cut velocity its central value is still $c \( x \, exp_x w \)$,
  and (2.4) defines its smooth geodesic-branch Hessian. In particular,
  as velocities in $cal(I)$ approach a nonconjugate minimizing velocity,
  their true-cost Hessians converge to this branch Hessian.
  This assertion also holds with the base point varying, using local tangent-bundle coordinates.

First variation gives $nabla_x hat(c) \( x \, exp_x w \) = - w$.
  For small $tau$, with $exp_x w$ fixed, the branch velocity at $gamma_(x \, w) \( tau \) =
  exp_x \( tau w \)$ is $\( 1 - tau \) dot(gamma)_(x \, w) \( tau \)$.
  Its negative has covariant derivative $w$ at $tau = 0$. Consequently,

#[#set math.equation(numbering: n => "(2.5)")
 $ A_x \( w \) \( w \, dot.op \) = chevron.l w \, dot.op chevron.r_x . $ <eq:radial-hessian>]

This identity is valid at every nonconjugate velocity.

#thm([Lemma 2.2.])[
  (Index-form representation).  #emph[If $w in G_x$ is nonconjugate, then, along $gamma_(x \, w) \( tau \) =
    exp_x \( tau w \)$ on $\[ 0 \, 1 \]$,
#[#set math.equation(numbering: n => "(2.6)")
 $ A_x \( w \) \( xi \, xi \) = min_(X \( 0 \) = xi\
X \( 1 \) = 0) Q_(gamma_(x \, w)) \( X \, X \) . $ <eq:hessian-index-minimum>]

 The minimum is attained uniquely by the Jacobi field with these endpoints. In particular, $A_x \( 0 \) = g_x$.]
] <lem:hessian-index>

#proof[
  Move $x$ along a geodesic with initial velocity $xi$ and follow the inverse branch to the fixed endpoint $exp_x
    w$. The variational field $Y$ is Jacobi and satisfies $Y \( 0 \) = xi$, $Y \( 1 \) = 0$.
    Differentiating the first-variation formula gives
  $ A_x \( w \) \( xi \, xi \) = - chevron.l xi \, D_tau Y \( 0 \) chevron.r_x = Q_(gamma_(x \, w)) \( Y \, Y \) \, $
  where the final equality is integration by parts. There is no initial acceleration term because the moving
    initial point follows a geodesic. For any admissible $X$, put $Z = X - Y$.
    The endpoint conditions and the Jacobi equation give $Q \( Y \, Z \) = 0$,
    while minimality of the original geodesic gives $Q \( Z \, Z \) gt.eq 0$.
    Hence $Q \( X \, X \) gt.eq Q \( Y \, Y \)$. Equality makes $Z$ a Jacobi field vanishing at both endpoints;
    nonconjugacy forces $Z = 0$. At $w = 0$, the minimizing field is $Y \( tau \) = \( 1 - tau \)
    xi$ along the constant geodesic, which gives $A_x \( 0 \) \( xi \, xi \) = \| xi \|_x^2$. ◻
]

#thm([Lemma 2.3.])[
  (Strict radial comparison).  #emph[For every $a in G_x$ and $0 < s < s' < 1$,
#[#set math.equation(numbering: n => "(2.7)")
 $ A_x \( s a \) > s / s' A_x \( s' a \) $ <eq:radial-comparison>]

 as quadratic forms; that is, the difference is positive on every nonzero vector.]
] <lem:radial-comparison>

#proof[
  Both $s a$ and $s' a$ belong to $I \( x \)$ by 3. Time rescaling in (2.6) gives, along $gamma_(x \, a)$,
  $ 1 / s A_x \( s a \) \( xi \, xi \) = min_(X \( 0 \) = xi\
X \( s \) = 0) Q_(gamma_(x \, a) \|_(\[ 0 \, s \])) \( X \, X \) . $
  Extend the unique minimizing field by zero to $\[ 0 \, s' \]$.
    It is an admissible field for the corresponding minimum on $\[ 0 \, s' \]$ and has the same index-form value.
    If $xi eq.not 0$, it cannot be that minimum: otherwise 4, with time rescaled, would make the extension Jacobi,
    although it vanishes on $\( s \, s' \)$ and is nonzero at $0$.
    Thus $A_x \( s a \) \( xi \, xi \) \/ s > A_x \( s' a \) \( xi \, xi \) \/ s'$, proving the claim.
    For $a = 0$ the same argument applies, and the difference is explicitly $\( 1 - s \/ s' \) g_x$. ◻
]

#thm([Lemma 2.4.])[
  (Transverse concavity).  #emph[Let $b_t = b_0 + t eta$ be an affine velocity line in $T_x M$,
    and let $xi perp eta$. On every interval on which $b_t in I \( x \)$,
#[#set math.equation(numbering: n => "(2.8)")
 $ frac(d^2, d t^2) A_x \( b_t \) \( xi \, xi \) = - 2 / 3 frak(S)_(\( x \, b_t \)) \( xi \, eta \) lt.eq
   0 . $ <eq:transverse-concavity>]

 Consequently, if $b = sum_(i = 1)^m theta_i b_i$, with $theta_i gt.eq 0$ and $sum_i theta_i = 1$,
   the convex hull of the $b_i$ is contained in $I \( x \)$, and $chevron.l b_i \,
   xi chevron.r_x$ is independent of $i$, then
$ A_x \( b \) \( xi \, xi \) gt.eq sum_(i = 1)^m theta_i A_x \( b_i \) \( xi \, xi \) . $

]
] <lem:transverse-concavity>

#proof[
  For fixed $v in I \( x \)$, the second derivative at $u =
    0$ of $c \( exp_x \( u xi \) \, exp_x v \)$ is $A_x \( v \) \( xi \, xi \)$,
    because $u mapsto exp_x \( u xi \)$ is a geodesic. Differentiating this identity twice in the affine velocity
    direction $eta$ and using (1.2) gives the equality in (2.8). The inequality is exactly (1.3).
    Each segment in the stated convex hull has direction perpendicular to $xi$,
    so the resulting linewise concavity gives the finite Jensen inequality by induction.
    Vanishing test vectors or line directions cause no exception. ◻
]

== 3 Excluding conjugacy in minimizing convex hulls <sec:conjugacy>

The continuation argument will encounter finite convex hulls whose every velocity is known to be minimizing.
  Their generators will be nonconjugate, but their other points may lie at cut.
  We show here that none of those points can be conjugate. This removes the focal obstruction before the next
  section addresses uniqueness of minimizing geodesics.

The essential step concerns a segment with nonconjugate endpoints.
  Transverse concavity first confines a hypothetical conjugacy kernel to the segment direction.
  The radial Hessian identity then controls that remaining direction and contradicts the singular growth forced by
  an index-form trial field. All uses of weak MTW occur at proper radial contractions, where the true cost is smooth.

#thm([Proposition 3.1.])[
  #emph[Suppose that $\[ b_0 \, b_1 \] subset G_x$ and that $b_0 \, b_1$ are nonconjugate.
    Then every velocity in $\[ b_0 \, b_1 \]$ is nonconjugate.]
] <prop:segment-nonconjugacy>

#proof[
  The assertion is immediate if $b_0 = b_1$. Otherwise, suppose there is a singular interior velocity $z$,
    and write the segment as
  $ z + t e \, wide - l_0 lt.eq t lt.eq l_1 \, wide \| e \|_x = 1 \, quad l_0 \, l_1 > 0 . $
  Here $b_0 = z - l_0 e$ and $b_1 = z + l_1 e$. The velocity $z$ is nonzero, since $d_0 exp_x = upright("Id")$.
    For every $0 < r < 1$, the full contracted segment ${ r \( z + t e \) : - l_0 lt.eq t lt.eq
    l_1 }$ is contained in $I \( x \)$ by (2.2).
  Choose $0 eq.not k in ker d_z exp_x$. Variation of the initial velocity in the direction $k$ gives a Jacobi
    field $J_z$ along $gamma_(x \, z)$ on $\[ 0 \, 1 \]$ with
  $ J_z \( 0 \) = J_z \( 1 \) = 0 \, wide D_tau J_z \( 0 \) = k . $
  The function $chevron.l J_z \, dot(gamma)_(x \, z) chevron.r$ is affine in $tau$ and vanishes at both endpoints.
    Its initial derivative is $chevron.l k \, z chevron.r_x$, so $k perp z$.
  #emph[A trial-field estimate.] The Jacobi-field trial below is related to the conjugate-cut argument of
    Cordero-Erausquin, McCann and Schmuckenschläger #cite(label("CMS2001")) Proposition 2.5.
    We derive the needed Hessian estimate explicitly and combine it with transverse MTW concavity and the radial
    identity.
  Fix a vector $xi in T_x M$ such that $chevron.l xi \, k chevron.r_x eq.not 0$.
    For a velocity $a$ near $z$, let $T_a \( tau \)$ denote parallel transport from $x$ along $gamma_(x \, a)$ to
    time $tau$, and define
  $ j \( tau \) = T_z \( tau \)^(- 1) J_z \( tau \) \, wide J_a \( tau \) = T_a \( tau \) j \( tau \) \, wide
    E_a \( tau \) = \( 1 - tau \) T_a \( tau \) xi . $
  The geodesic and parallel-transport equations give smooth dependence on $\( a \, tau \)$.
    Thus these are smooth families of fields along the parametrized geodesics, with $J_a \( 0 \) = J_a \( 1 \) =
    0$ and $E_a \( 0 \) = xi$, $E_a \( 1 \) = 0$. Every $J_a$ is nonzero,
    since its components $j \( tau \)$ are fixed and not identically zero.
    The construction uses no inverse of the exponential map at $z$.
  Write $Q_a = Q_(gamma_(x \, a))$ on $\[ 0 \, 1 \]$ and set $P \( a \) = Q_a \( J_a \, J_a \)$.
    This is a smooth function on a full neighborhood of $z$, and $P \( z \) = 0$ by the Jacobi equation.
    It is nonnegative when $a in G_x$. When $a in I \( x \)$, it is strictly positive:
    equality would make the nonzero field $J_a$ a Jacobi field with zero endpoints, contrary to nonconjugacy.
    At $a = z$, integration by parts gives
  $ Q_z \( E_z \, J_z \) = \[ chevron.l E_z \, D_tau J_z chevron.r \]_0^1 = - chevron.l xi \, k chevron.r_x . $
  For $a in I \( x \)$ near $z$, 4 can be tested on $E_a + lambda J_a$.
    Minimizing the resulting quadratic polynomial in $lambda in bb(R)$ gives
  #[#set math.equation(numbering: n => "(3.1)")
   $ A_x \( a \) \( xi \, xi \) & lt.eq Q_a \( E_a \, E_a \) - frac(Q_a \( E_a \, J_a \)^2, P \( a \))\
 & lt.eq C_0 - frac(c_0, P \( a \)) \, wide c_0 > 0 . $ <eq:trial-hessian>]
  The last inequality holds in one fixed neighborhood: smoothness bounds $Q_a \( E_a \, E_a \)$ from above and
    bounds $Q_a \( E_a \, J_a \)^2$ away from zero there.
  #emph[Reduction to a one-dimensional kernel.] For each fixed $xi perp e$, 6 on the contracted segment gives
  $ A_x \( r z \) \( xi \, xi \) gt.eq frac(l_1, l_0 + l_1) A_x \( r b_0 \) \( xi \, xi \) +
    frac(l_0, l_0 + l_1) A_x \( r b_1 \) \( xi \, xi \) . $
  The two endpoint velocities are nonconjugate. Smoothness of the branch Hessians therefore makes the right-hand
    side bounded from below as $r arrow.t 1$. On the other hand, $P \( r z \) > 0$ and $P \( r z \) arrow.r
    P \( z \) = 0$. Inequality (3.1) would contradict this lower bound if $chevron.l xi \,
    k chevron.r_x eq.not 0$. It follows that every $k in ker d_z exp_x$ is orthogonal to $e^perp$,
    and hence belongs to $"span" { e }$. The kernel is nontrivial, so it is exactly $"span" { e }$.
    In particular, $e$ is a kernel vector and $z perp e$.
  #emph[A joint tangential and radial estimate.] Apply the trial-field construction with $k = xi = e$,
    and retain the notation $P$ for this choice. Since $z + t e in G_x$ for small $t$ of both signs,
    the smooth function $t mapsto P \( z + t e \)$ has a local minimum of value zero at $t = 0$.
    Its first derivative vanishes, so, for some $delta > 0$ and $C > 0$,
  $ 0 lt.eq P \( z + t e \) lt.eq C t^2 wide \( \| t \| lt.eq delta \) . $
  Shrink $delta$ and choose $r_0 < 1$ so that both $z + t e$ and $r \( z + t e \)$ lie in the fixed neighborhood
    used in (3.1) whenever $\| t \| lt.eq delta$ and $r_0 < r < 1$.
    Choose a Lipschitz constant $L$ for $P$ on a slightly larger ball and a bound $K$ for $\| z +
    t e \|_x$ in this range. Since $r \( z + t e \) in I \( x \)$, we obtain the simultaneous estimate
  #[#set math.equation(numbering: n => "(3.2)")
   $ 0 < P #scale(x: 120%, y: 120%)[\(] r \( z + t e \) #scale(x: 120%, y: 120%)[\)] & lt.eq P \( z + t e \) +
     L \( 1 - r \) \| z + t e \|_x\
 & lt.eq C t^2 + L K \( 1 - r \) lt.eq C' #scale(x: 120%, y: 120%)[\(] t^2 + 1 -
   r #scale(x: 120%, y: 120%)[\)] . $ <eq:quadratic-index>]
  Combining this with (3.1), and adjusting positive constants, gives
  #[#set math.equation(numbering: n => "(3.3)")
   $ A_x #scale(x: 120%, y: 120%)[\(] r \( z + t e \) #scale(x: 120%, y: 120%)[\)] \( e \, e \) lt.eq C_1 -
     frac(c_1, t^2 + 1 - r) \, wide c_1 > 0 \, $ <eq:singular-upper>]
  for all these $t \, r$. In particular, the constants do not depend on the manner in which the two parameters
    approach $0$ and $1$.
  #emph[The radial identity gives a contradictory lower bound.] Put $B_x \( a \) = g_x - A_x \( a \)$ and,
    for $0 < r < 1$, define
  $ f_r \( t \) = B_x #scale(x: 120%, y: 120%)[\(] r \( z + t e \) #scale(x: 120%, y: 120%)[\)] \( z \, z \) \,
    wide - l_0 lt.eq t lt.eq l_1 . $
  Because $z perp e$, 6 with test vector $z$ and velocity direction $r e$ makes $f_r$ convex.
    By (2.5), $f_r \( 0 \) = 0$. Nonconjugacy at $b_1 = z + l_1
    e$ bounds $f_r \( l_1 \)$ from above uniformly as $r arrow.t 1$.
    The convexity inequality on $\[ 0 \, l_1 \]$ therefore yields
  $ f_r \( t \) lt.eq t / l_1 f_r \( l_1 \) lt.eq C_2 t wide \( 0 < t lt.eq l_1 \) $
  for $r$ close to $1$, with $C_2 gt.eq 0$ independent of $r$. The radial identity also says
  #[#set math.equation(numbering: n => "(3.4)")
   $ B_x \( a \) \( a \, dot.op \) = 0 \, wide f_r \( t \) =
     t^2 B_x #scale(x: 120%, y: 120%)[\(] r \( z + t e \) #scale(x: 120%, y: 120%)[\)] \( e \, e \) .
     $ <eq:radial-null>]
  Indeed, for $a = r \( z + t e \)$ and $r > 0$, the first identity annihilates $z + t e$ in either slot.
    Inserting $z = \( z + t e \) - t e$ in both slots gives the second identity, with no factor of $r$ remaining.
    As $\| e \|_x = 1$, we conclude that
  #[#set math.equation(numbering: n => "(3.5)")
   $ A_x #scale(x: 120%, y: 120%)[\(] r \( z + t e \) #scale(x: 120%, y: 120%)[\)] \( e \, e \) gt.eq 1 - C_2 /
     t wide \( 0 < t lt.eq l_1 \) . $ <eq:singular-lower>]
  Choose $r = 1 - t^2$ for sufficiently small positive $t$. Both (3.3) and (3.5) apply and would imply
  $ 1 - C_2 / t lt.eq C_1 - frac(c_1, 2 t^2) . $
  Multiplying by $t^2$ and letting $t arrow.b 0$ is impossible, since $c_1 > 0$.
    This contradiction proves the proposition. ◻
]

#thm([Corollary 3.2.])[
  (Nonconjugacy of a minimizing convex hull).  #emph[Let $a_1 \, dots.h \,
    a_m in T_x M$ be nonconjugate velocities, with $m gt.eq 1$, and suppose
$ K = "co" { a_1 \, dots.h \, a_m } subset G_x . $

 Then every velocity in $K$ is nonconjugate.]
] <geo:first-cut>

#proof[
  We induct on the number of positive weights in a convex representation.
    A representation with one positive weight gives one of the prescribed generators. For a representation
  $ w = sum_(i = 1)^k theta_i a_i \, wide theta_i > 0 \, wide sum_(i = 1)^k theta_i = 1 \, wide k gt.eq 2 \, $
  write
  $ w = \( 1 - theta_k \) w' + theta_k a_k \, wide w' = sum_(i = 1)^(k - 1) frac(theta_i, 1 - theta_k) a_i . $
  The vector $w'$ is nonconjugate by induction, and $a_k$ is nonconjugate by hypothesis.
    Their entire segment lies in $K subset G_x$, so 7 makes $w$ nonconjugate as well.
    Discarding zero weights gives the assertion for every point of $K$. ◻
]

In the continuation argument, membership of the entire hull in $G_x$ will follow by taking limits from smaller
  scales. The corollary then removes conjugacy without assuming convexity of the full minimizing domain.

== 4 Global supports and intermediate transport <sec:geometry>

We prove the global supporting property by continuing the ordinary subgradient graph from short times to every
  time below one. The nonconjugacy result of 3 handles a possible conjugate first cut.
  A local injectivity argument and covering theory then exclude a second minimizing geodesic at that scale.

We retain the branch Hessian $A_x \( w \)$ and minimizing domain $G_x$ from 2,
  and identify tangent vectors and covectors by the metric except when explicitly using coordinate covectors.
  Put $D = "diam" M$ and

$ G_x = { p in T_x M : d \( x \, exp_x p \) = \| p \| } = overline(I \( x \)) \, wide c_t = c / t \, wide
  Q_t f \( z \) = min_x { f \( x \) + c_t \( x \, z \) } . $

The total set of minimizing vectors ${ \( x \, p \) : p in G_x }$ is compact.
  The total open injectivity domain is open, and it contains a fixed neighborhood of the zero section.
  We use the usual cut-point alternative: a minimizing vector on its boundary either has a conjugate endpoint or
  has a second minimizing geodesic to the same endpoint.

A #emph[potential] means a function represented by a continuous datum $v$ as

$ u \( x \) = max_y { - c \( x \, y \) - v \( y \) } . $

In 9, the active logs may be defined using any such representing datum; duality of that datum is not required.
  When a dual pair is needed, we may replace it by $v \( y \) = max_x { - c \( x \, y \) - u \( x \) }$;
  then $\( u \, v \)$ is a dual pair and $u \( x \) + c \( x \, y \) + v \( y \) gt.eq 0$.
  Additive constants play no role below.

A finite maximum $u \( x \) = max_i { h_i - c \( x \, y_i \) }$ is included in this definition after dual
  completion. Indeed, if $v \( y \) = max_x { - c \( x \, y \) - u \( x \) }$, then $v \( y_i \) lt.eq -
  h_i$ and $max_y { - c \( x \, y \) - v \( y \) } lt.eq u \( x \)$.
  An index active at $x$ gives the opposite inequality. This identifies the functions,
  without asserting that dual completion leaves the set of active targets unchanged.

=== 4.1 Supports, divided action, and subgradients <supports-divided-action-and-subgradients>

For a semiconvex function, $partial u \( x \)$ denotes its ordinary subdifferential,
  with vectors identified by the metric. Equivalently, $p in partial u \( x \)$ if, in normal coordinates at $x$,

$ u \( exp_x h \) gt.eq u \( x \) + chevron.l p \, h chevron.r + o \( \| h \| \) . $

For a fixed uniform semiconvexity constant, the remainder in this inequality can instead be bounded below by a
  negative quadratic term.

#thm([Lemma 4.1.])[
  (Uniform supports and active logs).  #emph[There is a geometric constant $C_g$ such that $c \( dot.op \, y \)$
    and $c \( x \, dot.op \)$ are uniformly semiconcave, with constant $C_g$, including at cut points.
    Every potential is $D$-Lipschitz and uniformly semiconvex. If
$ cal(V)_u \( x \) = { p in G_x : u \( x \) + c \( x \, exp_x p \) + v \( exp_x p \) = 0 } \, $

 then
#[#set math.equation(numbering: n => "(4.1)")
 $ partial u \( x \) = "conv" cal(V)_u \( x \) . $ <geo:active-hull>]

 The total active-log graph ${ \( x \, p \) : p in cal(V)_u \( x \) }$ is compact.
   Every member of the convex hull in (4.1) has a representation with positive weights using at most $n +
   1$ affinely independent members of $cal(V)_u \( x \)$.]
] <geo:prelim>

#proof[
  The divided triangle inequality is
  #[#set math.equation(numbering: n => "(4.2)")
   $ c_(a + b) \( z \, y \) lt.eq c_a \( z \, w \) + c_b \( w \, y \) \, wide a \, b > 0 . $ <geo:divided-triangle>]
  It follows by concatenating constant-speed minimizing curves and using the energy characterization of squared
    distance. This shortening inequality is also used in #cite(label("CMS2001")) Claim 2.4.
    Equality holds when $w$ divides a minimizing geodesic in the time ratio $a : b$.
  In particular, if $p in G_x$, $y = exp_x p$, and $y_s = exp_x \( s p \)$, $0 < s < 1$, then
  #[#set math.equation(numbering: n => "(4.3)")
   $ c \( z \, y \) lt.eq c_s \( z \, y_s \) + frac(1 - s, 2) \| p \|^2 \, wide c_s \( x \, y_s \) = s /
     2 \| p \|^2 . $ <geo:split-support>]
  The right side is a smooth upper support near $x$, because $s p in I \( x \)$.
    Taking $s = 1 \/ 2$, the relevant half-vectors form a compact subset of the open injectivity domain.
    The supports therefore have a common neighborhood size and a common upper Hessian bound.
    This proves uniform semiconcavity of the cost; symmetry handles its other variable.
    Also $\| c \( x \, y \) - c \( x' \, y \) \| lt.eq D d \( x \, x' \)$.
    Suprema of the corresponding negative costs consequently give the asserted Lipschitz and semiconvexity bounds
    for $u$.
  For completeness, the directional derivative at $x$ is
  #[#set math.equation(numbering: n => "(4.4)")
   $ u' \( x \; h \) = max_(p in cal(V)_u \( x \)) chevron.l p \, h chevron.r . $ <geo:directional-support>]
  The lower inequality follows from (4.3) for every active log.
    To obtain the upper inequality, choose an active endpoint at $x_r =
    exp_x \( r h \)$ and a minimizing log there. Compactness gives, along any convergent subsequence,
    an active endpoint and a minimizing log at $x$. Applying the uniform upper cost support at $x_r$ to the point
    $x$ bounds $\[ u \( x_r \) - u \( x \) \] \/ r$ above by the corresponding log paired with $h$,
    up to $O \( r \)$. This proves (4.4). For a semiconvex function,
    the ordinary subdifferential is the set of linear forms bounded above by every directional derivative:
    this follows by subtracting the fixed negative quadratic term and applying the supporting-hyperplane
    characterization of a convex function. Thus (4.4) gives (4.1).
    The contact equality defines a closed subset of the compact total minimizing-vector set.
    Thus the total active-log graph is compact, and so is each of its fibers.
    Carathéodory’s Theorem gives the finite representation. Choose one with the fewest positive weights:
    an affine dependence would allow the weights to be varied, preserving their sum and barycenter,
    until one vanished. Thus its active vertices are affinely independent. ◻
]

For a fixed base point $x$, write

$ H_s \( p \) = 1 / s A_x \( s p \) . $

This is the source Hessian of the divided cost $c_s$ on the branch specified by $s p$.
  We use it only when $s p$ is nonconjugate; at a cut point the branch is the one defined in (2.4).
  The base point $x$ will be clear from the velocity $p$.

#thm([Lemma 4.2.])[
  (Radial divided-action identity).  #emph[Let $p in G_x$, and let $0 < t < s < 1$.
    Along $gamma \( r \) = exp_x \( r p \)$, let $S_p \( r \)$ be the Jacobi tensor with $S_p \( 0 \) =
    0$ and $D_r S_p \( 0 \) = upright("Id")$, using parallel orthonormal frames. Then
#[#set math.equation(numbering: n => "(4.5)")
 $ frac(d, d r) H_r \( p \) = - S_p \( r \)^(- 1) S_p \( r \)^(- T) \, wide H_t \( p \) - H_s \( p \) gt.eq
   kappa_g \( s - t \) upright("Id") $ <geo:radial-derivative>]

 for a constant $kappa_g > 0$ depending only on the manifold. Furthermore,
#[#set math.equation(numbering: n => "(4.6)")
 $ A_x \( w \) w = w $ <geo:radial-identity>]

 on every smooth minimizing branch.]
] <geo:radial-index>

#proof[
  The Hessian $H_r \( p \)$ is the index form of the Jacobi field having initial value $xi$ and final value zero
    on the time interval $\[ 0 \, r \]$. Let $C_p$ be the other fundamental Jacobi tensor, $C_p \( 0 \) =
    upright("Id")$, $D_r C_p \( 0 \) = 0$. The field in question is
  $ J \( a \) = C_p \( a \) xi - S_p \( a \) S_p \( r \)^(- 1) C_p \( r \) xi . $
  Integration by parts identifies its index with $chevron.l S_p \( r \)^(- 1) C_p \( r \) xi \, xi chevron.r$.
    The Wronskian identities imply
  $ C'_p \( r \) - S'_p \( r \) S_p \( r \)^(- 1) C_p \( r \) = - S_p \( r \)^(- T) . $
  Differentiating $S_p^(- 1) C_p$ gives (4.5). Jacobi evolution on the compact set $\| p \| lt.eq D$, $0 lt.eq
    r lt.eq 1$, bounds $parallel S_p \( r \) parallel$ above by a geometric constant.
    Hence $S_p \( r \)^(- 1) S_p \( r \)^(- T) gt.eq kappa_g upright("Id")$ before conjugacy,
    which proves the second assertion by integration. Finally, for a smooth distance branch $r$,
    $"Hess" \( r^2 \/ 2 \) = r thin "Hess" r + d r ⊗ d r$ and $"Hess" r \( "grad" r \, dot.op \) = 0$.
    Since its radial direction at the initial point is $- p \/ \| p \|$, this gives (4.6); the identity at $p =
    0$ follows by continuity. ◻
]

#thm([Lemma 4.3.])[
  (Transverse slack).  #emph[Let $p_i in G_x$, $m_i > 0$, $sum_i m_i = 1$, and
$ p = sum_i m_i p_i \, wide E = "span" { p_i - p } . $

 Suppose $t "conv" { p_i } subset I \( x \)$ and $0 < t < s < 1$. Then
#[#set math.equation(numbering: n => "(4.7)")
 $ [frac(A_x \( t p \), t) - sum_i m_i frac(A_x \( s p_i \), s)] \|_(E^perp) gt.eq
   kappa_g \( s - t \) upright("Id") . $ <geo:transverse-slack>]

 The same conclusion holds at a limiting time $t$ if the radially contracted hulls lie in $I \( x \)$ and the
   displayed Hessians have nonconjugate branch limits.]
] <geo:slack>

#proof[
  For fixed $xi in E^perp$, weak MTW says that $q mapsto A_x \( t q \) \( xi \, xi \)$ is concave on every segment
    contained in the hull: each segment direction lies in $E$ and is therefore perpendicular to $xi$.
    Jensen’s inequality therefore gives $H_t \( p \) \( xi \, xi \) gt.eq sum_i m_i H_t \( p_i \) \( xi \, xi \)$.
    Subtract $sum_i m_i H_s \( p_i \)$ and use Lemma 10 on each original minimizing ray.
    The limiting assertion follows by applying this argument to the contracted hull and passing to the specified
    smooth branch limits. In particular, it does not require $s p$ to be minimizing. ◻
]

=== 4.2 The subgradient graph and its projections <the-subgradient-graph-and-its-projections>

The short-time construction is a curved version of proximal minimization and quadratic inf-convolution;
  compare #cite(label("Moreau1965")) Sections 3–5 and 7. We give the local estimates explicitly,
  since the subsequent continuation must use only geometric and semiconvexity bounds.
  For any Lipschitz semiconvex function $f$, its ordinary subgradient graph is compact:
  the subgradients are bounded by its Lipschitz constant, and the uniform local quadratic subgradient inequalities
  make the graph closed under convergence of both the base point and the vector.

#thm([Lemma 4.4.])[
  (Short time for a semiconvex datum).  #emph[Let $f$ be Lipschitz and semiconvex.
    For sufficiently small $t > 0$, depending only on its Lipschitz and semiconvexity bounds and on the manifold,
    the map
$ F_t : Gamma_f arrow.r M \, wide Gamma_f = { \( x \, p \) : p in partial f \( x \) } \, wide F_t \( x \, p \) =
  exp_x \( t p \) \, $

 is a homeomorphism. Its inverse is locally Lipschitz, as a map into the tangent bundle.
   The minimizing pole of $Q_t f$ is unique, $Q_t f in C^(1 \, 1)$, and
$ "grad" Q_t f \( z \) = - 1 / t log_z x_t \( z \) . $

 The compact graph $Gamma_f$ is an $n$-dimensional Lipschitz manifold.]
] <geo:short-time>

#proof[
  If $L$ is a Lipschitz bound, a global minimizing pole satisfies
  $ frac(d \( x \, z \)^2, 2 t) lt.eq f \( z \) - f \( x \) lt.eq L d \( x \, z \) \, wide d \( x \, z \) lt.eq
    2 L t . $
  Every graph vector has length at most $L$, so its projection lies at distance at most $L t$ from its pole.
    For small $t$, all these points lie in a common normal coordinate ball.
    On a slightly larger ball, $D_(x x)^2 c \( x \, z \)$ is uniformly positive definite,
    whereas $f$ has a fixed lower Hessian bound. Thus $f + c_t \( dot.op \, z \)$ is strongly convex there.
    Its global minimizer is unique, and every graph point projecting to $z$ is the same minimizer by its
    stationarity equation. Conversely the minimizer supplies the unique log divided by $t$ as a subgradient.
    This proves bijectivity; compactness proves that the inverse is continuous.
  Here is also the required quantitative local assertion. In fixed coordinates write $p_i$ as coordinate
    covectors. Semiconvexity gives
  $ chevron.l p_1 - p_2 \, x_1 - x_2 chevron.r gt.eq - K \| x_1 - x_2 \|^2 . $
  Insert $p_i = - D_x c \( x_i \, z_i \) \/ t$. On the above ball, $D_(x x)^2 c gt.eq
    a upright("Id")$ and $\| D_(x z)^2 c \| lt.eq B$, uniformly. Hence
  $ \( a - t K \) \| x_1 - x_2 \| lt.eq B \| z_1 - z_2 \| . $
  For small $t$ this bounds the pole map in Lipschitz norm;
    its momentum is then Lipschitz by the smooth stationarity equation.
    Comparing the minimum at two nearby parameters with each other’s minimizing poles gives the displayed gradient
    formula. Its right side is Lipschitz, proving $C^(1 \, 1)$ regularity.
    Since $F_t$ itself is the restriction of a smooth map on the tangent bundle, these charts are bi-Lipschitz. ◻
]

#thm([Lemma 4.5.])[
  (Capture of every minimizing velocity).  #emph[Let $u$ be a potential, let $t > 0$, and let $z in M$.
    If $x$ is a global minimizer of $u + c_t \( dot.op \, z \)$, then
$ w / t in partial u \( x \) wide upright("for every ") w in L_x \( z \) . $

 Consequently, $F_t : Gamma_u arrow.r M$ is surjective for every $t > 0$.]
] <geo:minimizer-capture>

#proof[
  A minimizer exists because $u + c_t \( dot.op \, z \)$ is continuous on compact $M$.
    Fix any $w in L_x \( z \)$ and any $0 < lambda < 1$, and put $z_lambda = exp_x \( lambda w \)$.
    Action splitting gives the upper support
  $ U_w \( x' \) = frac(1, t lambda) c \( x' \, z_lambda \) +
    frac(1, t \( 1 - lambda \)) c \( z_lambda \, z \) gt.eq c_t \( x' \, z \) \, wide U_w \( x \) = c_t \( x \, z \) . $
  It is smooth near $x$ because $lambda w in I \( x \)$, and its gradient there is $- w \/ t$.
    The function $u + U_w$ therefore has a local minimum at $x$.
    Its first-order inequality says exactly that $w \/ t in partial u \( x \)$.
    This argument applies separately to every minimizing log.
    Choosing one of them gives a point $\( x \, w \/ t \) in Gamma_u$ with $F_t \( x \, w \/ t \) = z$. ◻
]

=== 4.3 Local injectivity and continuation <local-injectivity-and-continuation>

The short-time lemma makes $Gamma_u$ a compact topological manifold homeomorphic to $M$.
  To continue its projection, we will prove local injectivity at a scale $t$ whenever the scaled graph has reached
  no conjugate point and all earlier scaled graphs lie in the injectivity domain.
  The following argument does not assume that a cut has actually occurred at $t$.

#thm([Lemma 4.6.])[
  (Local injectivity of the projection).  #emph[Let $u$ be a potential and $0 < t < 1$. Suppose that
$ r p in I \( x \) quad upright("for every ") \( x \, p \) in Gamma_u upright(" and ") 0 < r < t \, $

 and that every vector $t p$, $\( x \, p \) in Gamma_u$, is nonconjugate.
   Then $F_t : Gamma_u arrow.r M$ is locally injective.]
] <geo:local-injectivity>

#proof[
  Closedness of the minimizing-vector set first gives $t p in G_x$ for every graph point.
    Suppose local injectivity fails at $\( x \, p \) in Gamma_u$. There are distinct graph points
  $ \( x_j \, p_j \) arrow.r \( x \, p \) \, wide \( tilde(x)_j \, tilde(p)_j \) arrow.r \( x \, p \) $
  such that
  $ z_j = exp_(x_j) \( t p_j \) = exp_(tilde(x)_j) \( t tilde(p)_j \) arrow.r z = exp_x \( t p \) . $
  #emph[A common smooth branch.] Nonconjugacy at $\( x \, t p \)$ supplies one smooth inverse of the exponential
    pair map near $\( x \, z \)$, with branch cost $hat(c)$. Both sequences of scaled velocities belong to this
    branch for large $j$. Thus $x_j$ and $tilde(x)_j$ must be distinct:
    equality of their base points would force equality of their velocities in the same inverse branch.
    Exchange the two points if necessary so that
  $ Delta_j = u \( tilde(x)_j \) + 1 / t hat(c) \( tilde(x)_j \, z_j \) - u \( x_j \) - 1 /
    t hat(c) \( x_j \, z_j \) lt.eq 0 . $
  Write $ell_j = log_(x_j) tilde(x)_j$, $l_j = \| ell_j \| > 0$, and $e_j = ell_j \/ l_j$.
    These logs are unique for large $j$ since $l_j arrow.r 0$.
    After passing to a subsequence in a tangent-bundle chart, $e_j arrow.r e in T_x M$ with $\| e \| = 1$.
    All pairs $\( x' \, z_j \)$, with $x'$ on the short geodesic joining $x_j$ to $tilde(x)_j$,
    lie in a fixed compact product neighborhood on which $hat(c)$ is smooth.
  #emph[Active supports and a uniform expansion.] Choose active representations with $n + 1$ slots,
  $ p_j = sum_(i = 1)^(n + 1) m_(j i) a_(j i) \, wide a_(j i) in cal(V)_u \( x_j \) \, wide m_(j i) gt.eq 0 \,
    wide sum_i m_(j i) = 1 . $
  Repetitions and zero weights are allowed. Compactness of the active graph and of the weight simplex gives,
    after another subsequence,
  $ m_(j i) arrow.r m_i \, wide a_(j i) arrow.r a_i in cal(V)_u \( x \) \, wide p = sum_i m_i a_i . $
  Only these finitely many active slots enter the argument; the representing family of targets need not be finite.
  Fix $s$ with $t < s < 1$. Splitting the original active rays at time $s$ gives global lower supports for $u$
    touching at $x_j$, with gradient $a_(j i)$ and Hessian $- H_s \( a_(j i) \)$.
    The selected divided branch cost has gradient $- p_j$ and Hessian $H_t \( p_j \)$.
    Taylor expansion along $ell_j$ therefore yields, for every slot,
  #[#set math.equation(numbering: n => "(4.8)")
   $ Delta_j gt.eq l_j chevron.l a_(j i) - p_j \, e_j chevron.r + l_j^2 /
     2 \[ H_t \( p_j \) - H_s \( a_(j i) \) \] \( e_j \, e_j \) + epsilon.alt_(j i) l_j^2 \, wide
     max_i \| epsilon.alt_(j i) \| arrow.r 0 . $ <geo:collision-expansion>]
  The remainder is uniform even for slots whose weights tend to zero.
    Indeed, the branch cost has bounded third derivatives on the fixed compact neighborhood,
    while the shortened active vectors $s a_(j i)$ lie in a compact subset of the open injectivity domain.
    The corresponding support costs thus have one uniform third-derivative bound.
    Both Taylor remainders before division by $l_j^2$ are $O \( l_j^3 \)$.
  #emph[The limiting transverse directions.] Put
  $ d_(j i) = chevron.l a_(j i) - p_j \, e_j chevron.r \, wide
    B_(j i) = \[ H_t \( p_j \) - H_s \( a_(j i) \) \] \( e_j \, e_j \) . $
  Every $B_(j i)$ is bounded and converges, because the first Hessian belongs to the fixed smooth branch and the
    second belongs to a uniformly shortened minimizing ray. Divide (4.8) by $l_j$ and use $Delta_j lt.eq 0$.
    The limit gives
  $ d_i := chevron.l a_i - p \, e chevron.r lt.eq 0 . $
  At every finite stage the active representation gives
  #[#set math.equation(numbering: n => "(4.9)")
   $ sum_i m_(j i) d_(j i) = 0 . $ <geo:collision-cancellation>]
  Thus $sum_i m_i d_i = 0$, and $d_i = 0$ whenever $m_i > 0$.
    The positive-weight limiting active velocities consequently lie in one affine hyperplane perpendicular to $e$.
  Let $P = { i : m_i > 0 }$ and $E = "span" { a_i - p : i in P }$.
    We have $e in E^perp$ and $p = sum_(i in P) m_i a_i$. For $0 < r < t$, the hull $r "co" { a_i :
    i in P }$ lies in $r partial u \( x \) subset I \( x \)$.
    At time $t$ all its velocities are nonconjugate by hypothesis.
    The limiting transverse-slack inequality of 11 therefore gives
  #[#set math.equation(numbering: n => "(4.10)")
   $ delta_(*) := \[ H_t \( p \) - sum_(i in P) m_i H_s \( a_i \) \] \( e \, e \) gt.eq
     kappa_g \( s - t \) > 0 . $ <geo:collision-gap>]
  The later time $s$ has been applied only to the original active velocities $a_i in G_x$;
    no assertion about $s p$ or $s partial u \( x \)$ is used.
  #emph[Cancellation before taking limits.] Multiply (4.8) by $m_(j i)$ and sum over all slots.
    Equation (4.9) cancels the linear terms exactly, giving
  $ Delta_j / l_j^2 gt.eq 1 / 2 sum_i m_(j i) B_(j i) + sum_i m_(j i) epsilon.alt_(j i) . $
  The final sum tends to zero. The first sum tends to $delta_(*)$:
    positive-weight slots give (4.10), and zero-weight slots disappear because their $B_(j i)$ remain bounded.
    No rate of convergence of the weights is needed. We obtain
  $ liminf_(j arrow.r oo) Delta_j / l_j^2 gt.eq delta_(*) / 2 > 0 \, $
  contradicting $Delta_j lt.eq 0$. ◻
]

Local injectivity has a global consequence because the projection is homotopic to its short-time homeomorphism.
  We record the topological fact in a form that does not require an orientation.

#thm([Lemma 4.7.])[
  (A covering homotopic to a homeomorphism).  #emph[Let $X$ and $N$ be nonempty connected compact topological
    $n$-manifolds without boundary. A continuous locally injective map $f : X arrow.r
    N$ that is homotopic to a homeomorphism $h : X arrow.r N$ is itself a homeomorphism.]
] <lem:covering-homeomorphism>

#proof[
  Invariance of domain makes $f$ a local homeomorphism #cite(label("Hatcher2002")) Theorem 2B.3.
    Its image is open and compact, hence also closed; connectedness of $N$ gives surjectivity.
    Each fiber is compact and discrete, and therefore finite.
    For $f^(- 1) \( y \) = { q_1 \, dots.h \, q_k }$, choose disjoint neighborhoods $U_i$ on which $f$ is a
    homeomorphism onto a neighborhood $V_i$ of $y$. The compact set $E = X \\ union.big_i U_i$ has image missing $y$, so
  $ W = ⋂_i V_i \\ f \( E \) $
  is an evenly covered neighborhood of $y$. Thus $f$ is a covering.
  A homotopy from $h$ to $f$ identifies their induced maps on fundamental groups after change of base point
    #cite(label("Hatcher2002")) Lemma 1.19. Since $h$ is a homeomorphism, $f_(*) : pi_1 \( X \, q \) arrow.r
    pi_1 \( N \, f \( q \) \)$ is surjective. If $f \( q' \) = f \( q \)$, choose a path $gamma$ from $q$ to $q'$.
    Surjectivity of $f_(*)$ supplies a loop $eta$ at $q$ whose image under $f$ is homotopic, with endpoints fixed,
    to $f compose gamma$. Uniqueness of path lifting and the homotopy lifting property for coverings force $eta$
    and $gamma$ to have the same endpoint #cite(label("Hatcher2002")) Proposition 1.30. Thus $q' = q$.
    A bijective local homeomorphism is a homeomorphism. ◻
]

#thm([Theorem 4.8.])[
  (Global supporting property).  #emph[For every potential $u$, every $x in M$,
    and every $p in partial u \( x \)$, one has $p in G_x$ and
#[#set math.equation(numbering: n => "(4.11)")
 $ u \( x' \) gt.eq u \( x \) + c \( x \, exp_x p \) - c \( x' \, exp_x p \) wide
   upright("for all ") x' in M . $ <geo:global-support>]

 For each $0 < t < 1$, the projection $F_t : Gamma_u arrow.r M$ is a homeomorphism;
   its vectors $t p$ lie in $I \( x \)$, and its poles are the unique global minimizers of $Q_t u$.]
] <geo:support>

#proof[
  The graph $Gamma_u$ is compact by uniform semiconvexity and Lipschitzness.
    Suppose that $t_0 p_0 in.not I \( x_0 \)$ for some $\( x_0 \, p_0 \) in Gamma_u$ and some $0 < t_0 < 1$.
    The continuous map
  $ \[ 0 \, t_0 \] times Gamma_u arrow.r T M \, wide \( t \, \( x \, p \) \) mapsto \( x \, t p \) $
  has a compact nonempty inverse image of the complement of the open injectivity domain.
    Its projection onto $\[ 0 \, t_0 \]$ has a positive minimum $t_(*)$,
    because graph velocities are bounded and a fixed neighborhood of the zero section lies in the injectivity
    domain. Consequently all earlier scaled graph vectors lie in $I \( x \)$,
    all vectors at $t_(*)$ lie in $G_x$ by closure, and an actual failure is attained at $t_(*)$.
  For any $p in partial u \( x \)$, represent $p$ as a finite convex combination of active velocities $a_i in
    G_x$. The hull of the $t_(*) a_i$ lies in $t_(*) partial u \( x \) subset G_x$.
    Its generators are in $I \( x \)$ because $t_(*) < 1$. Corollary 8 therefore makes its entire hull
    nonconjugate. Thus every scaled graph vector at time $t_(*)$ is nonconjugate,
    and 14 makes $F_(t_(*))$ locally injective.
  Choose $epsilon.alt in \( 0 \, t_(*) \)$ small enough for 12.
    Then $Gamma_u$ is a connected compact topological $n$-manifold, and
  $ \( lambda \, \( x \, p \) \) mapsto exp_x
    #scale(x: 120%, y: 120%)[\(] \( \( 1 - lambda \) epsilon.alt + lambda t_(*) \) p
    #scale(x: 120%, y: 120%)[\)] \, wide 0 lt.eq lambda lt.eq 1 \, $
  is a homotopy from the homeomorphism $F_epsilon.alt$ to $F_(t_(*))$.
    Lemma 15 shows that $F_(t_(*))$ is a homeomorphism.
  Fix $\( x \, p \) in Gamma_u$ and set $z = F_(t_(*)) \( x \, p \)$.
    A global minimizer $x'$ of $u + c_(t_(*)) \( dot.op \, z \)$ exists.
    Every minimizing log $w in L_(x') \( z \)$ gives a graph point $\( x' \, w \/ t_(*) \)$ by 13;
    its image under $F_(t_(*))$ is $z$. Injectivity forces $x' = x$ and $w = t_(*) p$.
    Thus $x$ is the unique global minimizing pole and $L_x \( z \) = { t_(*) p }$.
    Together with nonconjugacy, 3 gives $t_(*) p in I \( x \)$ for every graph point,
    contradicting the attained failure. No scaled graph vector therefore reaches cut before time one.
  For any fixed $0 < t < 1$, all hypotheses of 14 now hold:
    earlier scaled vectors lie in $I \( x \)$, and so does the vector at $t$.
    The same short-time homotopy and covering argument make $F_t$ a homeomorphism.
    Applying 13 as above proves that every graph point gives the unique global minimizing pole of $Q_t u$.
  Finally, fix $\( x \, p \) in Gamma_u$ and let $t arrow.t 1$.
    Since $t p in I \( x \)$, $d \( x \, exp_x p \) = \| p \|$. The global minimizing inequalities
  $ u \( x' \) + 1 / t c \( x' \, exp_x \( t p \) \) gt.eq u \( x \) + 1 /
    t c \( x \, exp_x \( t p \) \) wide \( x' in M \) $
  pass by continuity to (4.11). ◻
]

=== 4.4 Convex sections and regular intermediate potentials <convex-sections-and-regular-intermediate-potentials>

#thm([Corollary 4.9.])[
  (Convex injectivity domains).  #emph[For every $x$, both $G_x$ and $I \( x \)$ are convex.]
] <geo:convexity>

#proof[
  For $p_0 \, p_1 in G_x$, put $y_i = exp_x p_i$ and consider
  $ w \( z \) = max_(i = 0 \, 1) { c \( x \, y_i \) - c \( z \, y_i \) } . $
  Both $p_i$ belong to $partial w \( x \)$, so their segment does also. Theorem 16 puts that segment in $G_x$.
    Finally $I \( x \)$ is the interior of $G_x$: it is open,
    while a radial cut-boundary vector has arbitrarily close outward radial vectors which are not minimizing.
    The interior of a convex set is convex. ◻
]

#thm([Corollary 4.10.])[
  (Convex lifted gap sections).  #emph[Let $\( u \, v \)$ be a dual pair and define
$ cal(S)_x \( r \) = {p in G_x : u \( x \) + frac(\| p \|^2, 2) + v \( exp_x p \) lt.eq r} . $

 Every such set is compact and convex, including its ordinary and conjugate cut endpoints.
   If it is nonempty and $r gt.eq 0$, then
#[#set math.equation(numbering: n => "(4.12)")
 $ "diam" cal(S)_x \( r \)^2 lt.eq 8 (r + "osc"_(p in cal(S)_x \( r \)) v \( exp_x p \)) . $ <geo:section-diameter>]

]
] <geo:sections>

#proof[
  Write $m_p \( z \) = \| p \|^2 \/ 2 - c \( z \, exp_x p \)$ for $p in G_x$.
    Theorem 16, applied to $max { m_(p_0) \, m_(p_1) }$ at $x$, gives
  $ m_(\( 1 - theta \) p_0 + theta p_1) \( z \) lt.eq max { m_(p_0) \( z \) \, m_(p_1) \( z \) } \, wide 0 lt.eq
    theta lt.eq 1 . $
  Since
  $ u \( x \) + frac(\| p \|^2, 2) + v \( exp_x p \) = sup_z { u \( x \) - u \( z \) + m_p \( z \) } \, $
  its sublevels on $G_x$ are convex. Continuity and compactness of $G_x$ give closedness and compactness.
    For $p_0 \, p_1$ in a section, their midpoint $p_m$ is also in it.
    If $q \( p \)$ denotes the nonnegative gap, the squared-norm identity gives
  $ frac(\| p_0 - p_1 \|^2, 8) = frac(q \( p_0 \) + q \( p_1 \), 2) - q \( p_m \) + v \( exp_x p_m \) -
    frac(v \( exp_x p_0 \) + v \( exp_x p_1 \), 2) \, $
  which proves (4.12). ◻
]

#thm([Proposition 4.11.])[
  (Intermediate regularity and pole control).  #emph[Let $\( u \, v \)$ be a dual pair and $0 < t < 1$. Then
#[#set math.equation(numbering: n => "(4.13)")
 $ Q_t u = - Q_(1 - t) v in C^(1 \, 1) \( M \) . $ <geo:intermediate-duality>]

 The $C^(1 \, 1)$ seminorm is bounded solely in terms of $M \, g \, t$.
   If $\( x_t \( z \) \, p_t \( z \) \) = F_t^(- 1) \( z \)$ and $Phi_s$ denotes geodesic flow on $T M$, then
#[#set math.equation(numbering: n => "(4.14)")
 $ \( x_t \( z \) \, p_t \( z \) \) = Phi_(- t) \( z \, "grad" Q_t u \( z \) \) \, wide x_t \( z \) =
   exp_z \( - t "grad" Q_t u \( z \) \) . $ <geo:pole-flow>]

 In particular the pole and momentum are Lipschitz, with constants depending only on $M \, g \, t$.]
  #emph[There are also $r_t \, b_t > 0$, depending only on $M \, g \, t$, such that every projected pair $z =
    exp_x \( t p \)$ satisfies
#[#set math.equation(numbering: n => "(4.15)")
 $ u \( x' \) + c_t \( x' \, z \) gt.eq u \( x \) + c_t \( x \, z \) + b_t d \( x \, x' \)^2 wide
   upright("if ") d \( x \, x' \) < r_t . $ <geo:uniform-growth>]

 These assertions use no density hypothesis. On every compact subinterval of $\( 0 \, 1 \)$,
   their constants can be chosen uniformly.]
] <geo:intermediate>

#proof[
  Let $\( x \, p \) = F_t^(- 1) \( z \)$, set $gamma \( s \) = exp_x \( s p \)$, and put $y = gamma \( 1 \)$, $w =
    dot(gamma) \( t \)$. Theorem 16 makes $y$ a supporting endpoint for $u$ at $x$.
    Since $v$ is the dual transform, this gives
  $ u \( x \) + c \( x \, y \) + v \( y \) = 0 . $
  Formula (4.2) gives, for all $x' \, z' \, y'$,
  $ u \( x' \) + c_t \( x' \, z' \) gt.eq - v \( y' \) - c_(1 - t) \( z' \, y' \) . $
  Taking the infimum in $x'$ and the supremum in $y'$ gives $Q_t u gt.eq - Q_(1 - t) v$.
    At $z' = z$, equality holds with $x' = x$ and $y' = y$, because the geodesic splits in the ratio
    $t : \( 1 - t \)$. This proves (4.13).
  Equivalently, the function has the upper and lower supports
  #[#set math.equation(numbering: n => "(4.16)")
   $ - v \( y \) - c_(1 - t) \( z' \, y \) lt.eq Q_t u \( z' \) lt.eq u \( x \) + c_t \( x \, z' \) \,
     $ <geo:two-sided-intermediate>]
  both with equality at $z$. The first is smooth there even when the full pair $\( x \, y \)$ is conjugate:
    reversing the minimizing geodesic makes the segment from $y$ to $z$ a proper initial subsegment,
    and cut symmetry gives smoothness also from $z$ to $y$. The precise reversal identities are
  $ log_z x = - t w \, wide log_z y = \( 1 - t \) w . $
  Thus both supports in (4.16) have gradient $w$.
  The infimum defining $Q_t u$ preserves the uniform semiconcavity bound of $c_t$;
    its representation as the supremum of the lower supports preserves the uniform semiconvexity bound of $-
    c_(1 - t)$. In local coordinates it is therefore both semiconvex and semiconcave, and hence $C^(1 \, 1)$.
    More explicitly, its almost-everywhere Riemannian Hessian obeys
  $ - frac(C_g, 1 - t) g lt.eq "Hess" Q_t u lt.eq C_g / t g . $
  The support gradients give $"grad" Q_t u \( z \) = w$, with $\| w \| lt.eq D$.
    Reversing geodesic flow proves (4.14). Smooth geodesic flow has bounded derivatives on the compact set of
    velocities of length at most $D$ and times in $\[ - 1 \, 1 \]$.
    The Lipschitz conclusion therefore follows without inverting an exponential differential.
  Finally choose $s = \( 1 + t \) \/ 2$. The single global support supplied by $p$ can be split at $y_s =
    exp_x \( s p \)$ to give
  $ u \( x' \) gt.eq u \( x \) + c_s \( x \, y_s \) - c_s \( x' \, y_s \) . $
  After adding $c_t \( x' \, z \) - c_t \( x \, z \)$, the right side has zero gradient and Hessian $H_t \( p \) -
    H_s \( p \) gt.eq kappa_g \( s - t \) upright("Id")$ at $x$.
    The scaled minimizing-vector families at times $t$ and $s$ are compact subsets of the open injectivity domain.
    Their smooth action branches have uniform Taylor bounds on a common neighborhood.
    Shrinking that neighborhood gives (4.15), uniformly in the potential and in its graph point. ◻
]

#prodef([Remark 4.12.])[
  At time one, arbitrary potentials can have many poles with the same endpoint; $u \( x \) = -
    c \( x \, y_0 \)$ is an example. All uses of an inverse projection or of $C^(1 \, 1)$ regularization in this
    paper concern $0 < t < 1$. Only the minimizing-vector and supporting inequalities are passed to time one.
] <geo:time-one>

== 5 An alternative globalization by positive degree <sec:degree-alternative>

The covering argument in the main text uses local injectivity of the graph projection.
  Here we give a different sufficient condition: openness, together with local minimality of its action branches,
  also forces global injectivity. The reason is that local minimality makes the projection Jacobian nonnegative in
  coordinates on the subgradient graph, while the homotopy from a short-time projection has degree one.
  The area formula then rules out two overlapping open images.
  This argument uses the same active logs and divided-action estimates as the main proof;
  it does not require the global supporting theorem.

=== 5.1 Local minima and openness <local-minima-and-openness>

#thm([Lemma 5.1.])[
  (Local quadratic growth).  #emph[Let $u$ be a potential and $0 < t < 1$.
    Suppose that, for every $\( x \, p \) in Gamma_u$, one has $r p in I \( x \)$ for $0 < r < t$ and $t
    p$ is nonconjugate. Put $z = exp_x \( t p \)$ and let $hat(c)$ be the smooth action branch through
    $\( x \, t p \)$. Then there are $b \, rho > 0$ such that
$ u \( x' \) + frac(hat(c) \( x' \, z \), t) gt.eq u \( x \) + frac(hat(c) \( x \, z \), t) +
  b thin d \( x \, x' \)^2 wide upright("if ") d \( x \, x' \) < rho . $

 In particular, $F_t : Gamma_u arrow.r M$ is open.]
] <geo:local-growth>

#proof[
  Choose a positive finite active representation $p = sum_i m_i p_i$, and put $E = "span" { p_i - p }$.
    Fix $s$ with $t < s < 1$. Each $p_i$ is an original minimizing log,
    so its shortened support at time $s$ is smooth near $x$. In normal coordinates $h$ at $x$, these supports give
  $ u \( exp_x h \) - u \( x \) gt.eq max_i {chevron.l p_i \, h chevron.r - 1 / 2 H_s \( p_i \) \( h \, h \)} +
    o \( \| h \|^2 \) . $
  Adding the selected branch of $hat(c) \/ t$ yields
  #[#set math.equation(numbering: n => "(5.1)")
   $ & u \( exp_x h \) + frac(hat(c) \( exp_x h \, z \), t) - u \( x \) - frac(hat(c) \( x \, z \), t)\
 & wide gt.eq max_i {chevron.l p_i - p \, h chevron.r + 1 / 2 B_i \( h \, h \)} + o \( \| h \|^2 \) \, wide B_i =
   H_t \( p \) - H_s \( p_i \) . $ <geo:growth-expansion>]
  The contracted active hulls lie in $I \( x \)$ by hypothesis, and their limits at time $t$ are minimizing.
    The branch at $t p$ is nonconjugate. Thus the limiting form of 11 gives
  $ sum_i m_i B_i\|_(E^perp) gt.eq kappa_g \( s - t \) upright("Id") . $
  Only the individual active rays are evaluated at the later time $s$.
  The vectors $p_i - p$ span $E$, have positive weights, and have weighted mean zero.
    Hence, if $E eq.not { 0 }$, compactness of its unit sphere gives
  $ max_i chevron.l p_i - p \, h chevron.r gt.eq b_E \| h_E \| \, wide h_E = "proj"_E h \, wide b_E > 0 . $
  For $E eq.not { 0 }$, choose $B$ so that $b_E B > 1 + max_i parallel B_i parallel$.
    When $\| h_E \| gt.eq B \| h \|^2$, this linear term dominates all negative quadratic terms in (5.1) and
    leaves a positive multiple of $\| h \|^2$. When $\| h_E \| < B \| h \|^2$,
    take the weighted average inside the maximum. The linear term vanishes,
    the quadratic term on $E^perp$ is positive, and its mixed terms are $O \( \| h \|^3 \)$.
    The same averaged argument applies directly if $E = { 0 }$.
    After shrinking the neighborhood, the claimed quadratic growth follows.
  For openness, choose a small closed ball about $x$ inside this neighborhood and inside the source domain of the
    branch. For an endpoint $z'$ near $z$, minimize $u \( dot.op \) +
    hat(c) \( dot.op \, z' \) \/ t$ on that ball. The positive boundary gap keeps each minimizer $x'$ in its
    interior. As $z' arrow.r z$, every such minimizer tends to $x$,
    since quadratic growth makes $x$ the unique minimizer on the ball at $z$. Stationarity gives
  $ p' = - 1 / t D_x hat(c) \( x' \, z' \) in partial u \( x' \) . $
  First variation on the branch gives $exp_(x') \( t p' \) = z'$ and $\( x' \, p' \) arrow.r \( x \, p \)$.
    Thus every neighborhood of $\( x \, p \)$ in the graph projects onto a neighborhood of $z$, as required. ◻
]

=== 5.2 The sign of a graph projection <the-sign-of-a-graph-projection>

The next lemma is conditional: its local-minimum assumption concerns the terminal time $t$ only.
  The required short-time properties follow separately from the semiconvexity bounds and the short-time
  homeomorphism already proved in the main text.

#thm([Lemma 5.2.])[
  (Positive projection degree).  #emph[Let $u$ be a potential and $0 < t < 1$.
    Assume that every $r p$, with $\( x \, p \) in Gamma_u$ and $0 < r lt.eq t$, is nonconjugate.
    At each $\( x \, p \)$, put $z = exp_x \( t p \)$ and let $hat(c)$ be the smooth action branch determined by
    $t p$. Suppose that $x$ is a local minimum of
$ x' mapsto u \( x' \) + frac(hat(c) \( x' \, z \), t) \, $

 and suppose that $F_t : Gamma_u arrow.r M$ is open. Then $F_t$ is a homeomorphism.
   Its pole at every endpoint is the unique global minimizing pole of $Q_t u$, and every $t p$ lies in $I \( x \)$.]
] <geo:degree>

#proof[
  Choose a sufficiently small $epsilon in \( 0 \, t \)$ as in 12.
    That result makes $F_epsilon$ a homeomorphism with locally Lipschitz inverse.
    Since $F_epsilon$ is the restriction of a smooth map on the compact graph, these are bi-Lipschitz graph charts.
  We use Minty-type coordinates to compute the Jacobian sign.
    In a coordinate ball write $p$ as a covector and take $a > 0$ small enough that $h \( x \) = \| x \|^2 \/ 2 +
    a u \( x \)$ is strongly convex. The coordinates
  $ q = x + a p $
  parametrize the graph locally. To see this, restrict $h$ to a small closed ball around the reference pole and
    maximize $q dot.op x - h \( x \)$. Strong convexity makes the maximizer unique and Lipschitz in $q$;
    for $q$ near the reference value it is interior. Thus $x \( q \)$ is the gradient of the local convex
    conjugate, and $p \( q \) = \( q - x \( q \) \) \/ a$. This parametrization is bi-Lipschitz.
    For the classical convex antecedents, see the proximal parametrization in #cite(label("Moreau1965"))
    Section 12 and the graph correspondence in #cite(label("AA1999")) Proposition 1.1;
    compare also #cite(label("MPW2012")) Section 2 for related diagonal coordinates in optimal transport.
  Rademacher’s theorem #cite(label("Simon2018")) Chapter 2, Theorem 1.4 gives, at almost every point of a graph chart,
  #[#set math.equation(numbering: n => "(5.2)")
   $ X = D_q x gt.eq 0 \, wide P = D_q p = frac(upright("Id") - X, a) . $ <geo:minty-matrices>]
  Both matrices are symmetric and commute. Write $cal(A) = D_(x x)^2
    hat(c) \( x \, F_t \( x \, p \) \)$ for the coordinate source Hessian of the selected unit-duration action and
    put $Z = D_q F_t$. Differentiating $- D_x hat(c) \( x \, F_t \) = t p$ gives
  #[#set math.equation(numbering: n => "(5.3)")
   $ Z = \( - D_(x z)^2 hat(c) \)^(- 1) \( t P + cal(A) X \) . $ <geo:projection-matrix>]
  Local minimality at the terminal time implies
  #[#set math.equation(numbering: n => "(5.4)")
   $ X \( t P + cal(A) X \) gt.eq 0 . $ <geo:sign-form>]
  Here is a justification requiring only first derivatives of the graph.
    Along a straight line in the chart, put $x_r = x \( q + r xi \)$ and $p_r = p \( q + r xi \)$.
    The semiconvex subgradient inequalities at two parameter values imply, almost everywhere on the line,
  $ frac(d, d r) u \( x_r \) = chevron.l p_r \, x'_r chevron.r . $
  At a differentiability point of $\( x \, p \)$, the expansions $x_r = x + r X xi + o \( r \)$ and $p_r = p +
    r P xi + o \( r \)$ give
  $ u \( x_r \) - u \( x \) - chevron.l p \, x_r - x chevron.r & = integral_0^r chevron.l p_s - p \,
    x'_s chevron.r thin d s\
 & = r^2 / 2 chevron.l P xi \, X xi chevron.r + o \( r^2 \) . $
  For the last equality, integrate the term $s P xi$ by parts.
    The remaining integral is $o \( r^2 \)$ because $x_s$ is Lipschitz and the remainder in $p_s$ is $o \( s \)$.
    No second derivative of the pole curve is used. Rewrite this as an expansion of $u \( x_r \) - u \( x \)$,
    multiply by $t$, and add the expansion of $hat(c) \( x_r \, z \) - hat(c) \( x \, z \)$ with $z =
    F_t \( x \, p \)$ fixed. Its linear term is $- t chevron.l p \, x_r - x chevron.r$,
    and its quadratic term is $r^2 chevron.l cal(A) X xi \, X xi chevron.r \/ 2$.
    The cancellation and the local-minimum inequality prove (5.4).
  Split the matrices into $ker X$ and its orthogonal complement.
    Then $t P + cal(A) X$ is block triangular, with kernel block $\( t \/ a \) upright("Id")$.
    On the complementary block, multiplication by the positive definite matrix $X$ makes it symmetric positive
    semidefinite by (5.4). Consequently
  $ det \( t P + cal(A) X \) gt.eq 0 \, $
  with positive sign whenever this matrix is nonsingular. The other factor in (5.3) has positive determinant in
    compatible oriented charts. Indeed, $- D_(x z)^2 hat(c)$ is the inverse exponential differential followed by
    the metric identification. Its sign starts positive at time zero and cannot change along the ray before a
    conjugate time. The nonconjugacy assumption supplies this sign through time $t$.
  Assume first that $M$ is oriented and transfer the projections to $M$:
  $ cal(H)_r = F_r compose F_epsilon^(- 1) : M arrow.r M \, wide epsilon lt.eq r lt.eq t . $
  These maps are Lipschitz and form a homotopy from the identity to $cal(H)_t$.
    At the small time $epsilon$, semiconvexity and the positive cost Hessian make each stationary graph branch a
    local minimum; equivalently, $u + c_epsilon \( dot.op \, z \)$ is strongly convex on the relevant coordinate
    ball. The preceding sign calculation thus applies to $F_epsilon$ independently of the terminal-time
    assumption. Its bi-Lipschitz differential is nonsingular almost everywhere, so the computed sign is positive.
    The chain rule transfers the nonnegative sign of $D F_t$ to the signed Riemannian Jacobian $J_(cal(H)_t)$.
    Bi-Lipschitz changes of coordinates preserve the exceptional null sets, and hence $J_(cal(H)_t) gt.eq
    0$ almost everywhere.
  For completeness, the signed degree identity can be justified on the smooth manifold without imposing a smooth
    structure on the graph. Smoothly approximate $cal(H)_t$ uniformly and strongly in $W^(1 \, n)$,
    using local mollification and a smooth tubular projection after embedding the compact target.
    Uniformly close approximations are homotopic to $cal(H)_t$, hence to the identity.
    Stokes’ theorem gives $integral_M h^(*) omega = integral_M
    omega$ for every smooth top form $omega$ and each such smooth approximation $h$.
    Strong derivative convergence passes this identity to $cal(H)_t$:
    the pullback is multilinear of degree $n$ in the derivative, and its coefficients converge uniformly.
    This identity also proves surjectivity. A missed point would give, by compactness, a missed open ball,
    and a top form supported in that ball with nonzero integral would contradict the identity.
  Taking $omega = d "vol"$ and applying the Lipschitz area formula #cite(label("Simon2018")) Chapter 2,
    Theorem 3.3, Remark 3.4, and (4.19)–(4.20) in manifold charts gives
  $ integral_M J_(cal(H)_t) thin d "vol" = "vol" \( M \) \, wide
    integral_M N \( y \, cal(H)_t \) thin d "vol" \( y \) = integral_M \| J_(cal(H)_t) \| thin d "vol" =
    "vol" \( M \) \, $
  where $N$ counts preimages and may be infinite. Surjectivity gives $N gt.eq 1$ everywhere, so $N =
    1$ almost everywhere. If there were two distinct preimages,
    disjoint neighborhoods of them would have open images meeting in a nonempty open set,
    since $F_t$ and hence $cal(H)_t$ are open. The multiplicity would be at least two on that set,
    contradicting the integral equality. Thus $cal(H)_t$ is injective.
    No discreteness of fibers is assumed in this argument.
  If $M$ is nonorientable, lift the homotopy to its orientation double cover, starting from the identity.
    Uniqueness of homotopy lifting shows that every lift commutes with the deck transformation.
    The lifted maps are Lipschitz, and the terminal lift is open because the covering maps are local
    diffeomorphisms. Its local Jacobian signs are the same as above:
    the lifted homotopy selects the target orientation transported along the geodesic used in the mixed-action
    calculation. The oriented argument therefore makes the terminal lift injective.
    Two distinct preimages downstairs could be lifted, applying a deck transformation to one of them if needed,
    to have the same lifted image. Deck equivariance would contradict injectivity upstairs.
    Thus $F_t$ is injective in either case; surjectivity and compactness make it a homeomorphism.
  Finally, take any global minimizing pole of $Q_t u$ at an endpoint.
    13 places that pole and every one of its minimizing logs divided by $t$ in the graph fiber.
    Its uniqueness identifies the pole with the specified graph pole and identifies every minimizing log with $t
    p$. Thus $t p$ is the unique minimizing velocity to its endpoint.
    It is nonconjugate by hypothesis, so 3 places it in $I \( x \)$ and proves the remaining assertions. ◻
]

#bibliography("refs.bib", style: "ieee", title: [References])
