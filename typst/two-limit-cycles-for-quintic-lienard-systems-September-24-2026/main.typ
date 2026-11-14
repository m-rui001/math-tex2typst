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

#align(center)[#text(size: 16pt, weight: "bold")[Two limit cycles for quintic Liénard systems]]
#align(center)[OpenAI]
#align(center)[September 24, 2026]

== 1 Introduction <sec:introduction>

Consider the classical Liénard system

#[#set math.equation(numbering: n => "(1.1)")
 $ dot(x) = y - F \( x \) \, wide dot(y) = - x \, $ <eq:original-system>]

where $F$ is a real polynomial. A limit cycle is the image of a nonconstant periodic solution that is isolated
  among periodic orbits. We count each such image once, irrespective of its multiplicity, stability,
  or hyperbolicity. The periodic orbits of a center are not limit cycles under this convention.

#thm([Theorem 1.1.])[
  #emph[If $deg F lt.eq 5$, the system (1.1) has at most two limit cycles in $bb(R)^2$.
    Some members of this class have two limit cycles. Thus its exact maximum is two.]
] <thm:main>

Here the degree is that of the primitive $F$. The equivalent scalar equation is

$ x'' + F' \( x \) x' + x = 0 \, $

so its damping polynomial has degree at most four and its restoring force is exactly $x$.
  No parity or coefficient-sign assumption is imposed on $F$.

The problem is a restricted instance of the second part of Hilbert’s sixteenth problem,
  concerning the number of limit cycles of polynomial planar vector fields.
  Lins, de Melo, and Pugh proposed the bound $floor.l \( n - 1 \) \/ 2 floor.r$ for (1.1) with $deg F = n gt.eq
  1$ [10]. Rychkov proved the two-cycle bound for odd quintic primitives [15].
  Dumortier, Panazzolo, and Roussarie constructed systems with four cycles and primitive degree seven [5].
  De Maesschalck and Dumortier obtained four cycles already in degree six [3],
  and De Maesschalck and Huzak subsequently constructed at least $n - 2$ cycles in every degree $n gt.eq 6$ [4].
  These counterexamples leave degree five undecided. Li and Llibre established the unrestricted quartic bound of
  one cycle [8]. Llibre and Zhang survey this development and the classical perturbative lower bounds [11].

In degree five, the distinction between a global bound and a bound in a limiting regime is essential.
  Li and Lu proved that nondegenerate slow–fast cycles have cyclicity at most two [9].
  The Introduction of the August 2026 preprint by Chen, Li, Zhang,
  and Zhang distinguishes that result from the unrestricted polynomial problem and reports the latter as open [1].
  Hernández Rosales proposes a degree-five four-cycle example for $x'' + mu f \( x \) x' + x =
  0$ in Section 9 of [7], with $mu = 1 \/ 10$ and $f \( x \) = x^4 - 10 x^2 + 5$.
  The proposed system has exactly two limit cycles. Indeed, the change $x =
  sqrt(5) thin u$ transforms its scalar equation into

$ u'' + 1 / 2 \( 5 u^4 - 10 u^2 + 1 \) u' + u = 0 . $

This is Odani’s Example 3 with parameters $hat(mu) = 1 \/ 2$ and $v = 10 \/ 3 > sqrt(5)$,
  for which exactly two periodic solutions are proved [12].
  The discrepancy in the proposed amplitude calculation is that periodicity requires $integral_0^T f \( x \)
  dot(x)^2 thin d t = 0$. Substituting $x \( t \) approx 2 X cos t$ gives $2 X^4 - 10 X^2 + 5 = 0$,
  the same equation used for the second proposed pair. Its roots are $X^2 = \( 5 plus.minus sqrt(15) \) \/ 2$,
  not $1$ and $4$. Thus these two leading-order calculations do not yield four distinct cycles.

Two-cycle examples are classical. Besides the perturbative constructions associated with the conjecture [10,11],
  rigorous transversal-region methods have been applied to Rychkov’s family by Gasull, Giacomini, and Grau [6].
  Section 7 supplies a direct lower-bound proof, so the exact maximum follows within this article.

===== 1.1 Method. <method.>

The even coefficients prevent reduction to the odd quintic family,
  and a small-amplitude calculation cannot by itself bound distant cycles.
  Our comparison keeps the two half-orbits separate and uses coordinates available at every transverse amplitude.
  On each half-plane, $u = x^2 \/ 2$ transforms an orbit into an arch satisfying $u_y = phi.alt \( u \) - y$,
  where $phi.alt \( u \) = F \( sqrt(2 u) \)$ or $F \( - sqrt(2 u) \)$.
  The even coefficients give the same quadratic part in both profiles, whereas the odd coefficients change sign.
  This common part suggests using quadratic profiles as a comparison family.
  At a fixed base height $h$, let $y_(<) \, y_(>)$ be its endpoints and set $r = \( y_(>) - y_(<) \) \/
  2$ and $M = \( y_(>) + y_(<) \) \/ 2 - phi.alt \( h \)$. The first technical step is a global interpolation
  theorem: every admissible pair $\( M \, M_r \)$ has a unique fit by a profile $lambda \( u - h \) +
  kappa \( u - h \)^2 \/ 2$. Both its range and its nonvanishing Jacobian are proved in Theorem 13;
  the fit is available throughout $r > 0$, $\| M \| < r$, and $\| M_r \| < 1$.

The fitted slope and curvature evolve according to the two transport equations of Lemma 14.
  Their coefficients are derivatives of the quadratic midpoint function.
  The central model estimate, Theorem 15, controls how one of these coefficients changes with width while the
  model parameters are held fixed. Its proof combines endpoint variation, a Riccati linearization,
  and a Schwarzian identity for the endpoint correspondence.
  The solution-ratio identity and chain rule are classical projective identities;
  Ovsienko and Tabachnikov give a concise account [13]. Schwarzian derivatives have also been used for cycle
  bounds through return maps, including the discontinuous systems studied by Coll, Gasull, and Prohens [2].
  Here the map pairs the two endpoints of a quadratic arc, and the model estimate concerns that correspondence.

Transporting the fitted parameters along an arch then turns conditions on $phi.alt'''$ and on
  $\( phi.alt' - d \) \/ u$, for a fixed real constant $d$,
  into monotonicity and separation statements for the fitted curvature and slope intercept.
  Propositions 20 and 21 formulate these comparisons for general smooth profiles,
  independently of the polynomial application.

For the original system, periodic orbits are zeros of the difference between the two height-zero midpoint
  functions on one common width interval. The quintic coefficient structure provides a complete sign partition.
  In the only case allowing two cycles, a positive integrating factor makes the derivative of the matching
  function have the sign of a nondecreasing function. This bounds isolated zeros even when zeros are multiple or
  occur in intervals. The proof therefore counts degenerate cycles directly;
  it does not remove them by a generic perturbation.

Section 2 establishes the arc coordinates and the global matching interpretation.
  Section 3 proves the global quadratic fit and its transport law.
  Section 4 establishes the model inequality, and Section 5 derives the shape comparisons for general profiles.
  Section 6 proves the upper bound in Theorem 1, and Section 7 proves sharpness.

== 2 Arc coordinates and periodic-orbit matching <sec:arcs>

We first study a general profile $phi.alt in C^oo \( \( 0 \, oo \) \)$ and the scalar equation

#[#set math.equation(numbering: n => "(2.1)")
 $ frac(d u, d y) = phi.alt \( u \) - y . $ <eq:arc-ode>]

Here $y$ is an endpoint coordinate, rather than physical time.
  For each $t > 0$, let $u \( y \; t \)$ be the solution through

$ u \( phi.alt \( t \) \; t \) = t . $

The parameter $t$ will be the peak height. At a lower height $h$,
  the two endpoint values of $y$ determine a half-width $r$ and a midpoint $M$, measured relative to $phi.alt \( h \)$.

Figure 1 illustrates these coordinates. Our first task is to show that width parametrizes every positive-height
  arc. We then continue the transverse arcs to height zero,
  where matching the two endpoint pairs counts the periodic orbits.

=== 2.1 Global endpoint data and their transport <global-endpoint-data-and-their-transport>

#thm([Lemma 2.1.])[
  (Global arc coordinates).  #emph[For every $0 < h < t$, the solution through
    $\( y \, u \) = \( phi.alt \( t \) \, t \)$ has exactly two intersections with $u = h$.
    They are transverse and satisfy
$ y_(<) \( h \, t \) < phi.alt \( h \) < y_(>) \( h \, t \) . $

 The part of the solution between them has a unique maximum $u = t$. Set
#[#set math.equation(numbering: n => "(2.2)")
 $ r \( h \, t \) = frac(y_(>) \( h \, t \) - y_(<) \( h \, t \), 2) \, wide M =
   frac(y_(>) \( h \, t \) + y_(<) \( h \, t \), 2) - phi.alt \( h \) . $ <eq:arc-endpoint-data>]

 At fixed $h$, the lower endpoint decreases strictly with $t$, the upper endpoint increases strictly,
   and both derivatives are nonzero. The map $t mapsto r \( h \, t \)$ is a smooth increasing bijection from
   $\( h \, oo \)$ onto $\( 0 \, oo \)$.]
  #emph[Consequently $M$ is a smooth function of $\( h \, r \) in \( 0 \, oo \)^2$. Writing $v = M_r$, one has
#[#set math.equation(numbering: n => "(2.3)")
 $ \| M \( h \, r \) \| < r \, wide \| v \( h \, r \) \| < 1 \, wide r^2 gt.eq 2 \( t - h \) . $ <eq:arc-strict-data>]

 For a fixed width, the corresponding base height is strictly increasing with peak height:
   $partial h \/ partial t > 0$.]
  #emph[If $phi.alt$ is smooth on the whole real line, the same conclusions hold for arbitrary real $h < t$.
    In that case, at each fixed peak $t$, letting $h$ decrease from $t$ to $-
    oo$ parametrizes the full range $0 < r < oo$.]
] <lem:arc-data>

#proof[
  Differentiating Equation (2.1) gives
  $ u_(y y) = phi.alt' \( u \) u_y - 1 . $
  Thus every critical point in the profile domain is a nondegenerate maximum, with $u_(y y) = - 1$.
    On either side of the prescribed peak the height therefore decreases strictly as one moves away from it,
    until the level $h$ is reached. A second critical point on either branch would require a minimum between two
    maxima, which is impossible.
  These intersections occur at finite $y$. Indeed, while a branch remains in $\[ h \, t \]$,
    the profile is bounded there. For sufficiently large positive $y$, Equation (2.1) gives $u_y < - 1$;
    for sufficiently large negative $y$, it gives $u_y > 1$. In the respective outward directions these
    inequalities force the branch to reach $h$. There is also no finite-$y$ failure of continuation while $u$
    stays in the compact interval $\[ h \, t \]$. The strict derivative signs at the intersections give the
    displayed endpoint inequalities.
  All the endpoints depend smoothly on $\( h \, t \)$, by smooth dependence of the differential equation and
    transversality; see, for example, [14] Sections 2.2–2.3 for the standard differential-equation facts.
    To find their peak derivatives, let $xi \( y \; t \) = partial_t u \( y \; t \)$, with $y$ held fixed.
    Differentiating the moving initial condition gives $xi \( phi.alt \( t \) \; t \) = 1$, because $u_y =
    0$ at the peak. Moreover,
  $ xi_y = phi.alt' \( u \) xi \, $
  so $xi > 0$ throughout the arc. Differentiating the endpoint equations now gives
  $ \( y_(<) \)_t = - frac(xi \( y_(<) \; t \), r - M) < 0 \, wide \( y_(>) \)_t =
    frac(xi \( y_(>) \; t \), r + M) > 0 . $
  In particular $r_t > 0$. After changing from $t$ to $r$,
  $ v = frac(\( y_(>) \)_t + \( y_(<) \)_t, \( y_(>) \)_t - \( y_(<) \)_t) in \( - 1 \, 1 \) . $
  The other strict inequality, $\| M \| < r$, follows directly from the endpoint inequalities.
  At fixed $t$, differentiation with respect to $h$ gives
  $ \( y_(<) \)_h = frac(1, r - M) \, wide \( y_(>) \)_h = - frac(1, r + M) . $
  Hence
  #[#set math.equation(numbering: n => "(2.4)")
   $ frac(d r, d h)\|_t = - frac(r, r^2 - M^2) \, wide frac(d M, d h)\|_t = frac(M, r^2 - M^2) -
     phi.alt' \( h \) . $ <eq:arc-width-height>]
  The first identity implies $d \( r^2 \) \/ d h lt.eq - 2$.
    The nondegenerate maximum gives $r arrow.r 0$ as $t arrow.b h$, or as $h arrow.t t$ with the peak fixed.
    Integrating the inequality yields $r^2 gt.eq 2 \( t - h \)$.
    At fixed $h$, it follows that $r arrow.r oo$ as $t arrow.r oo$.
    This proves the asserted bijection and its smooth inverse. Also, at fixed width,
  $ frac(partial h, partial t)\|_r = - r_t / r_h > 0 . $
  The same proof applies to any compact interval $\[ h \, t \]$ in the domain of a smooth profile.
    For a profile on the whole real line, the bound $r^2 gt.eq
    2 \( t - h \)$ also proves the last assertion as $h arrow.r - oo$. ◻
]

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((-3.36, 0), (4.27, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((4.27, 0), [#text(size: 9pt)[$y$]], anchor: "west", padding: 0.1176cm)
  line((-3.15, -0.105), (-3.15, 3.728), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  content((-3.15, 3.728), [#text(size: 9pt)[$u$]], anchor: "south", padding: 0.1176cm)
  line((-3.15, 0.8925), (3.71, 0.8925), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "densely-dashed"))
  content((-3.15, 0.8925), [#text(size: 9pt)[$h$]], anchor: "east", padding: 0.1176cm)
  bezier((-2.31, 0.8925), (0.42, 3.15), (-1.61, 2.625), (-0.63, 3.15), stroke: (thickness: 0.8pt, miter-limit: 10))
  bezier((0.42, 3.15), (3.43, 0.8925), (1.512, 3.15), (2.59, 2.573), stroke: (thickness: 0.8pt, miter-limit: 10))
  circle((-2.31, 0.8925), radius: 0.05292, fill: black, stroke: none)
  circle((3.43, 0.8925), radius: 0.05292, fill: black, stroke: none)
  circle((0.42, 3.15), radius: 0.05292, fill: black, stroke: none)
  line((0.42, 3.15), (-3.15, 3.15), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  content((-3.15, 3.15), [#text(size: 9pt)[$t$]], anchor: "east", padding: 0.1176cm)
  content((0.42, 3.15), [#text(size: 9pt)[$( phi (t),t)$]], anchor: "south", padding: 0.1176cm)
  line((-2.31, 0), (-2.31, 0.8925), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((3.43, 0), (3.43, 0.8925), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  content((-2.31, 0), [#text(size: 9pt)[$y_<$]], anchor: "north", padding: 0.1176cm)
  content((3.43, 0), [#text(size: 9pt)[$y_>$]], anchor: "north", padding: 0.1176cm)
  line((0.56, 0.8925), (0.56, -0.5775), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  line((-2.31, 0.5565), (0.56, 0.5565), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((-0.875, 0.5565), [#text(size: 9pt)[$r$]], anchor: "north", padding: 0.1176cm)
  line((0.56, 0.5565), (3.43, 0.5565), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((1.995, 0.5565), [#text(size: 9pt)[$r$]], anchor: "north", padding: 0.1176cm)
  line((-0.63, 0.8925), (-0.63, -0.5775), stroke: (thickness: 0.4pt, miter-limit: 10, dash: "densely-dotted"))
  content((-0.63, -0.6825), [#text(size: 9pt)[$phi (h)$]], anchor: "north", padding: 0.1176cm)
  content((1.33, -0.6825), [#text(size: 9pt)[$phi (h)+M$]], anchor: "north", padding: 0.1176cm)
  line((0.56, -0.5775), (1.33, -0.6825), stroke: (thickness: 0.4pt, miter-limit: 10))
  line((-0.63, -0.441), (0.56, -0.441), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ">>", fill: black), end: (symbol: ">>", fill: black)))
  content((-0.035, -0.441), [#text(size: 9pt)[$M$]], anchor: "south", padding: 0.1176cm)
})],
  caption: [Figure 1: An arc at base height $h$ and peak height $t$, drawn schematically with $M > 0$. Its endpoint half-width is $r$; its midpoint is measured relative to $phi.alt \( h \)$. Both endpoints move outwards as the peak rises, giving $\| M_r \| < 1$. The two physical half-orbits form a periodic orbit precisely when their height-zero endpoint pairs agree, as proved in Proposition 6. ],
) <fig:arc-coordinates>

Put

$ k \( h \) = phi.alt' \( h \) \, wide q = r^2 - M^2 \, wide alpha = r / q \, wide D = partial_h - alpha partial_r . $

By Equation (2.4), $D$ differentiates along a fixed-peak arc as its base height increases.
  We call these curves in the $\( h \, r \)$-plane #emph[characteristics]. Their basic transport identities are

#[#set math.equation(numbering: n => "(2.5)")
 $ D M = M / q - k \( h \) \, wide D v = - frac(2 M r \( 1 - v^2 \), q^2) . $ <eq:arc-transport>]

For clarity, the second identity includes a commutator term. For any smooth function $f \( h \, r \)$,

$ D \( f_r \) = \( D f \)_r + alpha_r f_r \, wide alpha_r = 1 / q - frac(2 r \( r - M v \), q^2) . $

Using the first identity in Equation (2.5) therefore gives

$ D v = frac(2 v, q) - frac(2 \( M + r v \) \( r - M v \), q^2) = - frac(2 M r \( 1 - v^2 \), q^2) \, $

as claimed. All partial $r$-derivatives here are taken at fixed base height.

Introduce the angles

$ theta = "arctanh" \( M \/ r \) \, wide L = "arctanh" \( v \) . $

When a characteristic is parametrized by increasing width $r$, a prime denotes the total derivative along it;
  thus $f' = - D f \/ alpha$. Equation (2.5) first gives

$ M' = - M / r + q / r k \( h \) . $

Substituting $M = r tanh theta$ and $v = tanh L$ then yields

#[#set math.equation(numbering: n => "(2.6)")
 $ h' & = - r "sech"^2 theta \,\
theta' & = k \( h \) - frac(sinh \( 2 theta \), r) \, & L' & = frac(sinh \( 2 theta \), r) \,\
k \( h \)' & = - r "sech"^2 theta thin phi.alt'' \( h \) . $ <eq:arc-characteristics>]

In particular,

#[#set math.equation(numbering: n => "(2.7)")
 $ t - r^2 / 2 lt.eq h lt.eq t . $ <eq:arc-height-bound>]

The initial values of the angles at width zero, and the corresponding integral formula for $L$,
  will follow from the local scaling below.

=== 2.2 Profile variation and smooth small-width data <profile-variation-and-smooth-small-width-data>

#thm([Lemma 2.2.])[
  (Variation at fixed height and width).  #emph[Consider a smooth one-parameter family of profiles $phi.alt_eta$,
    with $phi.alt_0 = phi.alt$, and fix a regular base height $h$ and a width $r > 0$.
    All profiles need only be defined on a neighborhood of the relevant compact arcs. Write
$ psi \( u \) = partial_eta phi.alt_eta \( u \)\|_(eta = 0) \, wide Y = M + phi.alt \( h \) \, wide K \( y \) =
  exp (- integral_(y_(<))^y phi.alt' \( u \( z \) \) thin d z) . $

 Then the first variation $delta Y$, with $h \, r$ fixed, satisfies
#[#set math.equation(numbering: n => "(2.8)")
 $ #scale(x: 120%, y: 120%)[\[] \( M + r \) K \( y_(>) \) - \( M - r \) K \( y_(<) \) #scale(x: 120%, y: 120%)[\]]
   delta Y = integral_(y_(<))^(y_(>)) K \( y \) psi \( u \( y \) \) thin d y . $ <eq:arc-variation>]

 The coefficient of $delta Y$ is strictly positive. The variation of the relative midpoint is $delta M = delta Y -
   psi \( h \)$.]
  #emph[Consequently, if two profiles smooth on $\( 0 \, oo \)$ satisfy, at a fixed $h > 0$,
$ phi.alt_1 \( u \) - phi.alt_1 \( h \) > phi.alt_0 \( u \) - phi.alt_0 \( h \) wide upright("for every ") u > h \, $

 then $M_1 \( h \, r \) > M_0 \( h \, r \)$ for every $r > 0$.
   The analogous comparison holds at any real base height for two entire smooth profiles.]
] <lem:variation>

#proof[
  Both endpoint coordinates have variation $delta Y$, since their difference $2 r$ is fixed.
    Let $delta u$ denote variation at fixed $y$. Differentiating the differential equation and endpoint conditions gives
  $ \( delta u \)_y = phi.alt' \( u \) delta u + psi \( u \) \, wide delta u \( y_(<) \) = \( M - r \) delta Y \,
    quad delta u \( y_(>) \) = \( M + r \) delta Y . $
  Multiplication by $K$ and integration prove Equation (2.8).
    Its coefficient is positive because $K > 0$, $M + r > 0$, and $M - r < 0$.
  For the comparison, first translate each endpoint coordinate by its own base value $phi.alt_i \( h \)$.
    This replaces its profile by $phi.alt_i \( u \) - phi.alt_i \( h \)$, without changing $M_i$.
    Interpolate linearly between the translated profiles. The variation vanishes at the base and is strictly
    positive in every arc interior. Equation (2.8) then makes the derivative of the midpoint strictly positive
    along the interpolation. Integrating in the interpolation parameter proves the comparison. ◻
]

We will use three exact variations at the zero profile. The entire profile version of Lemma 2 permits base height
  zero. At width $w > 0$, the arc is

$ u_w \( y \) = frac(w^2 - y^2, 2) \, wide - w lt.eq y lt.eq w \, $

with $M = 0$ and $K = 1$. Thus a profile variation $psi$ with $psi \( 0 \) = 0$ gives

$ delta M \( 0 \, w \) = frac(1, 2 w) integral_(- w)^w psi \( u_w \( y \) \) thin d y . $

Direct polynomial integration gives

$ integral_(- w)^w u_w thin d y = frac(2 w^3, 3) \, wide integral_(- w)^w u_w^2 / 2 thin d y = frac(2 w^5, 15) \,
  wide integral_(- w)^w u_w^3 / 6 thin d y = frac(2 w^7, 105) . $

Smooth dependence allows differentiation of these first variations with respect to the positive width $w$. Therefore

#[#set math.equation(numbering: n => "(2.9)")
 $ psi \( s \) & delta M \( 0 \, w \) & delta M_w \( 0 \, w \)\
s & w^2 \/ 3 & 2 w \/ 3\
s^2 \/ 2 & w^4 \/ 15 & 4 w^3 \/ 15\
s^3 \/ 6 & w^6 \/ 105 & 6 w^5 \/ 105 $ <eq:parabolic-variations>]

These constants will determine the local quadratic fit.

#thm([Lemma 2.3.])[
  (Smooth scaling at zero width).  #emph[Near any fixed positive base height,
    the small-width arc data have smooth parameter-dependent expansions
#[#set math.equation(numbering: n => "(2.10)")
 $ M \( h \, r \) & = 1 / 3 k \( h \) r^2 + r^3 A \( h \, r \) \,\
v \( h \, r \) & = 2 / 3 k \( h \) r + r^2 B \( h \, r \) \,\
t \( h \, r \) & = h + r^2 (1 / 2 + r thin C \( h \, r \)) \, $ <eq:arc-small-width>]

 where the remainder functions extend smoothly through $r = 0$.
   The same assertion holds jointly for any finite-dimensional smooth family of profiles.
   In particular, these expansions may be differentiated, and $partial h \/ partial t\|_r arrow.r
   1$ as $r arrow.b 0$. The assertions also hold near any regular base height of a profile defined on an open
   interval containing that height.]
] <lem:arc-scaling>

#proof[
  For positive $r$, introduce the scaled height and endpoint coordinate
  $ s = frac(u - h, r^2) \, wide zeta = frac(y - phi.alt \( h \), r) . $
  The scaled equation is
  $ frac(d s, d zeta) = g \( s \) - zeta \, wide g \( s \) = frac(phi.alt \( h + r^2 s \) - phi.alt \( h \), r) . $
  Its relative midpoint at scaled width $1$ is $M \( h \, r \) \/ r$.
    More generally, if the scaled profile is held fixed while its width $w$ varies near $1$,
    its midpoint is $M \( h \, r w \) \/ r$. Its width derivative at $w = 1$ is therefore $v \( h \, r \)$.
  To justify smoothness through zero, introduce a signed auxiliary parameter $rho$,
    while keeping the scaled width positive and near $1$. Define
  #[#set math.equation(numbering: n => "(2.11)")
   $ g \( h \, rho \, s \) = rho s integral_0^1 phi.alt' \( h + tau rho^2 s \) thin d tau . $ <eq:arc-scaling-profile>]
  Choose a fixed compact scaled-height interval containing a neighborhood of $\[ 0 \, 1 \/ 2 \]$,
    and restrict $h$ to a neighborhood of the given regular base height.
    For sufficiently small $\| rho \|$, all arguments of $phi.alt'$ lie in its smooth domain.
    Equation (2.11) is then a smooth family through $rho = 0$,
    equals the preceding difference quotient when $rho eq.not 0$, and is the zero profile at $rho = 0$.
    Negative $rho$ is only a parameter in this family; no negative physical width is used.
  At the zero profile, an arc of scaled peak height $T$ has endpoints $plus.minus sqrt(2 T)$,
    and its width derivative with respect to $T$ equals $1$ at $T = 1 \/ 2$.
    Smooth dependence of the scaled differential equation, endpoint transversality,
    and the implicit function theorem therefore give smooth peak, midpoint,
    and midpoint-width-derivative data at scaled width $1$ for the family in Equation (2.11).
    All of this uses only a neighborhood of the compact parabolic arc, so the local profile domain is sufficient.
  The derivative of $g$ with respect to $rho$ at zero is $k \( h \) s$.
    Equation (2.9) consequently gives first derivatives $k \( h \) \/ 3$ and $2 k \( h \) \/
    3$ for the scaled midpoint and its width derivative. Their values at $rho = 0$ are zero.
    The scaled peak is $1 \/ 2 + O \( rho \)$. Taylor’s formula with a smooth remainder now gives Equation (2.10)
    on setting $rho = r > 0$ and undoing the scaling. It also proves the stated smoothness of the remainder
    functions, including any smooth profile parameters. Finally $t_h = 1 + O \( r^2 \)$ at fixed $r$,
    so the inverse derivative $partial h \/ partial t$ tends to $1$. ◻
]

On a characteristic with fixed smooth peak $t$, Lemma 4 and Equation (2.7) give

$ theta \( r \) = 1 / 3 k \( t \) r + O \( r^2 \) \, wide L \( r \) = 2 / 3 k \( t \) r + O \( r^2 \) . $

Both angles therefore tend to zero, and their transport equation integrates to

#[#set math.equation(numbering: n => "(2.12)")
 $ L \( r \) = integral_0^r frac(sinh \( 2 theta \( s \) \), s) thin d s . $ <eq:arc-L-integral>]

The integrand is bounded near zero. All these expansions are smooth in finite profile parameters.
  In particular, for a quadratic profile whose slope and curvature at the peak are $z$ and $kappa$,
  let $j$ be its slope at the moving base. Translating the peak to height zero and applying the local form of
  Lemma 4 yields, locally uniformly for finite $\( z \, kappa \)$,

#[#set math.equation(numbering: n => "(2.13)")
 $ theta \( s \, z \, kappa \) & = 1 / 3 z s + O \( s^2 \) \, & theta_z \( s \, z \, kappa \) & = 1 / 3 s +
   O \( s^2 \) \,\
L \( s \, z \, kappa \) & = 2 / 3 z s + O \( s^2 \) \, & j \( s \, z \, kappa \) & = z + O \( s^2 \) \, wide
  j_z arrow.r 1 . $ <eq:arc-peak-expansions>]

Here the differentiated statements follow from smooth remainders,
  rather than from differentiating an unspecified error bound.

=== 2.3 Continuation to a nonsmooth boundary height <continuation-to-a-nonsmooth-boundary-height>

For the next lemma, assume additionally that $phi.alt$ extends continuously to $\[ 0 \, oo \)$ and that
  $phi.alt \( 0 \) = 0$. Derivatives of $phi.alt$ need not extend to zero.

#thm([Lemma 2.4.])[
  (Transverse extension to the axis).  #emph[Each peak $t > 0$ has finite limiting endpoints
$ a \( t \) = lim_(h arrow.b 0) y_(<) \( h \, t \) lt.eq 0 \, wide b \( t \) =
  lim_(h arrow.b 0) y_(>) \( h \, t \) gt.eq 0 . $

 The set
$ cal(T)_phi.alt = { t > 0 : a \( t \) < 0 < b \( t \) } $

 is either empty or an open ray in $\( 0 \, oo \)$. If it is nonempty, $a \, b$ are smooth there,
   with $a_t < 0 < b_t$, and
$ r \( 0 \, t \) = frac(b \( t \) - a \( t \), 2) $

 is a smooth increasing bijection onto an open width ray $cal(I)_phi.alt subset \( 0 \, oo \)$.
   If $cal(T)_phi.alt$ is empty, set $cal(I)_phi.alt = diameter$.]
  #emph[On $cal(I)_phi.alt$, the limiting midpoint $M \( 0 \, r \)$ is smooth, and
$ \| M \( 0 \, r \) \| < r \, wide \| M_r \( 0 \, r \) \| < 1 . $

 As $h arrow.b 0$, all partial $r$-derivatives of $M \( h \, r \)$ converge locally uniformly on $cal(I)_phi.alt$
   to the corresponding derivatives of $M \( 0 \, r \)$.]
] <lem:axis-extension>

#proof[
  At fixed peak, the endpoint derivatives in Equation (2.4) show that the lower endpoint decreases and the upper
    endpoint increases as $h arrow.b 0$. They remain bounded.
    To see this explicitly, put $B = sup_(0 lt.eq u lt.eq t) \| phi.alt \( u \) \|$.
    If an upper endpoint lies beyond $B$, integrate $u_y lt.eq B - y$ from $B$ to that endpoint,
    using $u \( B \) lt.eq t$. This gives $y_(>) lt.eq B + sqrt(2 t)$.
    The inequality $u_y gt.eq - B - y$ similarly gives $y_(<) gt.eq - B - sqrt(2 t)$.
    The remaining bounds follow from $y_(<) < phi.alt \( h \) < y_(>)$ and $\| phi.alt \( h \) \| lt.eq B$.
    The finite limits thus exist, and the signs follow by continuity of $phi.alt$ at zero.
  For two peaks $t_2 > t_1$, the positive-height endpoint order passes to the weak limiting order
  $ a \( t_2 \) lt.eq a \( t_1 \) \, wide b \( t_2 \) gt.eq b \( t_1 \) . $
  Consequently $cal(T)_phi.alt$ is upward closed. We next show both its openness and the local smoothness asserted
    in the lemma.
  Fix $t_0 in cal(T)_phi.alt$. At a sufficiently small fixed positive level $delta < t_0$,
    the two endpoint branches can be continued downwards by
  #[#set math.equation(numbering: n => "(2.14)")
   $ frac(d y, d u) = frac(1, phi.alt \( u \) - y) = : g \( u \, y \) . $ <eq:arc-inverse-branch>]
  Choose compact neighborhoods of the limiting endpoints $a \( t_0 \)$ and $b \( t_0 \)$ and make $delta$ smaller
    if necessary. On each resulting branch rectangle, $\| phi.alt \( u \) -
    y \|$ is bounded away from zero for $0 lt.eq u lt.eq delta$.
    The function $g$ is continuous in $u$, smooth in $y$, and has bounded derivatives of every fixed order with
    respect to $y$.
  At $u = delta$, the branch initial values are smooth functions of the peak $t$ near $t_0$.
    The integral equation for Equation (2.14) and its parameter-variation equations show that the continued
    branches and all their $t$ derivatives are continuous down to $u = 0$, locally uniformly in $t$.
    For the first derivative the formula is explicit:
  $ y_t \( u \, t \) = y_t \( delta \, t \) exp (integral_delta^u g_y \( v \, y \( v \, t \) \) thin d v) . $
  The exponential factor is positive and bounded away from zero.
    Thus the two nonzero variation signs persist uniformly near $t_0$.
    Higher derivatives satisfy linear variation equations with continuous bounded coefficients and forcing built
    from lower derivatives, which proves the same assertion inductively.
    In particular, the strict endpoint signs persist for nearby peaks. This proves openness.
    An open upward-closed subset of $\( 0 \, oo \)$ is an open ray, or is empty.
  On that ray, $r_t = \( b_t - a_t \) \/ 2 > 0$. Passing to the limit in $r^2 gt.eq
    2 \( t - h \)$ gives $r \( 0 \, t \)^2 gt.eq 2 t$; hence the width tends to infinity as the peak does.
    Its image is therefore one open ray, and its inverse is smooth.
  It remains to justify convergence at fixed width, rather than only at fixed peak.
    Near $t_0$, the preceding bounds give $r_t \( h \, t \) gt.eq
    c_0 > 0$ uniformly for all sufficiently small $h gt.eq 0$.
    Uniform strict monotonicity brackets the inverse peak $t =
    T \( h \, r \)$ in a common compact interval for nearby widths.
    This inverse is continuous in $\( h \, r \)$, smooth in $r$, and
  $ T_r = frac(1, r_t \( h \, T \( h \, r \) \)) . $
  Higher $r$-derivatives are rational expressions in the continuous peak derivatives,
    with powers of $r_t$ in the denominator. They consequently converge locally uniformly as $h arrow.b 0$.
    Composing the endpoint data with $T \( h \, r \)$, and subtracting $phi.alt \( h \)$ from their midpoint,
    proves the claimed convergence of all $r$-derivatives. No derivative of $phi.alt$ at zero is needed.
    Finally the strict endpoint signs give $\| M \| < r$, and the retained opposite peak derivatives give $\|
    M_r \| < 1$, exactly as in Lemma 2. ◻
]

=== 2.4 Matching half-arcs and isolated periodic orbits <matching-half-arcs-and-isolated-periodic-orbits>

We now connect the general construction to a smooth classical Liénard system.
  This step requires only $F in C^oo \( bb(R) \)$ and $F \( 0 \) = 0$, not a degree restriction. Define

$ phi.alt_plus.minus \( u \) = F \( plus.minus sqrt(2 u) \) \, wide u gt.eq 0 \, $

and let $M_plus.minus$ and $cal(I)_plus.minus$ be their midpoint data and transverse width domains from Lemma 5.
  These profiles are smooth for $u > 0$, continuous at zero, and vanish there.

#thm([Proposition 2.5.])[
  (Periodic-orbit matching).  #emph[For the system
#[#set math.equation(numbering: n => "(2.15)")
 $ dot(x) = y - F \( x \) \, wide dot(y) = - x \, $ <eq:arc-lienard-system>]

 the images of nonconstant periodic solutions are in one-to-one correspondence with the zeros of
#[#set math.equation(numbering: n => "(2.16)")
 $ Delta \( r \) = M_(+) \( 0 \, r \) - M_(-) \( 0 \, r \) $ <eq:cycle-matching>]

 on the single open interval $cal(I) = cal(I)_(+) ∩ cal(I)_(-)$.
   If this interval is empty, there are no such periodic solutions.
   Each periodic orbit has exactly one positive and one negative intersection with the $y$-axis.
   Under the correspondence, isolated periodic orbits are exactly isolated zeros of $Delta$.]
] <prop:cycle-matching>

#proof[
  On either open half-plane, $y$ is strictly monotone in physical time.
    With $u = x^2 \/ 2$, division of the two time derivatives gives
  $ frac(d u, d y) = F \( x \) - y = phi.alt_plus.minus \( u \) - y . $
  Thus any excursion in one half-plane is an arc of Equation (2.1).
  Every nonconstant periodic solution has both signs of $x$, since integrating $dot(y) = -
    x$ over a period gives $integral x thin d t = 0$. The only equilibrium is $\( 0 \, 0 \)$,
    and uniqueness prevents a nonconstant orbit from containing it.
    At any axis intersection, $dot(x) = y eq.not 0$; the intersection is transverse.
    There are finitely many in a period. Otherwise an accumulation time would give an axis point at which either
    the crossing derivative is nonzero, contradicting accumulation, or the solution reaches the equilibrium.
  A positive axis intersection enters $x > 0$, and a negative one enters $x < 0$.
    Between consecutive intersections the transformed height is positive, vanishes at the endpoints,
    and has a unique positive peak by Lemma 2. Both endpoint signs are strict,
    so the arc belongs to the transverse domain of Lemma 5.
  For either profile, increasing the positive endpoint strictly decreases the negative endpoint, by peak order.
    The physical right-half-plane map from positive to negative endpoints is therefore strictly decreasing,
    and so is the physical left-half-plane map from negative to positive endpoints.
    Their composition on successive positive intersections is strictly increasing.
    An increasing map cannot have a finite periodic sequence of distinct points:
    if one iterate is larger, or smaller, than its predecessor, strict order persists under further iteration.
    Hence a closed orbit has one distinct positive intersection and one distinct negative intersection,
    and consists of one arc of each sign.
  The two arcs of such an orbit have the same endpoints, so their widths and midpoints agree.
    This gives a zero of Equation (2.16). Conversely, a zero at width $r$ gives the same endpoints
  $ a = M_plus.minus \( 0 \, r \) - r < 0 \, wide b = M_plus.minus \( 0 \, r \) + r > 0 $
  for the two arcs. Recover $x$ as $+ sqrt(2 u_(+) \( y \))$ on the right and $-
    sqrt(2 u_(-) \( y \))$ on the left, and introduce physical time by $dot(y) = - x$.
    On each open arc, $dot(x) = - u_y = y - F \( x \)$, as required. The one-sided endpoint derivatives are
  $ \( u_plus.minus \)_y \( a \) = - a > 0 \, wide \( u_plus.minus \)_y \( b \) = - b < 0 . $
  Thus $u_plus.minus$ has a simple zero at each endpoint and $d y \/
    sqrt(2 u_plus.minus \( y \))$ is integrable there. The physical travel times are finite.
    The derivatives of the reconstructed solution extend to the axis with values
    $\( dot(x) \, dot(y) \) = \( y \, 0 \)$. The two arcs consequently join as a solution of the original smooth
    vector field; uniqueness gives a closed orbit.
  Different zeros yield different positive intersections, because
  $ frac(d, d r) #scale(x: 120%, y: 120%)[\(] r + M_(+) \( 0 \, r \) #scale(x: 120%, y: 120%)[\)] = 1 +
    M_(+ \, r) \( 0 \, r \) > 0 . $
  They therefore yield different geometric orbits. This proves the bijection.
  Finally fix a matched orbit, its positive intersection $\( 0 \, s_0 \)$,
    and its first positive return time $T > 0$. On a short positive-axis section $S$ around $s_0$,
    the first return ordinate $P \( s \)$ and time $tau \( s \)$ are smooth and satisfy $tau \( s \) arrow.r
    T$ as $s arrow.r s_0$. To see that these are the first returns,
    take disjoint small time windows about the reference axis crossings.
    On the intervening compact time segments, $\| x \|$ is bounded away from zero.
    Smooth flow dependence and transversality give exactly the nearby crossings in those windows and no others.
    The function $s = r + M_(+) \( 0 \, r \)$ is a local smooth coordinate with positive derivative. In this coordinate,
  $ Delta \( r \) = 0 quad arrow.l.r.double quad P \( s \) = s $
  near the reference root.
  If distinct roots tend to the reference root, the corresponding section points tend to $s_0$,
    their return times tend to $T$, and smooth flow dependence on a common compact time interval makes their
    entire orbit images tend to the reference image. They are distinct by the preceding monotonicity.
    Hence a nonisolated root cannot give an isolated periodic orbit.
  For the converse, suppose the root is isolated and shrink $S$ so that $s_0$ is its only return fixed point.
    If $Phi_tau$ denotes the local flow, the map $\( s \, tau \) mapsto
    Phi_tau \( 0 \, s \)$ is a local diffeomorphism near each point $\( s_0 \, tau \)$, $0 lt.eq tau lt.eq T$,
    since the initial section is transverse. Finitely many such flow neighborhoods cover the compact reference
    orbit and give an open neighborhood $U$ whose every point lies on a trajectory meeting $S$.
    Any periodic orbit meeting $U$ therefore meets $S$. Its unique positive-axis intersection must be a fixed
    point of the local return map, and hence equals $s_0$. Uniqueness then makes it the reference orbit.
    This proves isolation, without an assumption on hyperbolicity or a global bound on periods. ◻
]

#prodef([Remark 2.6.])[
  Every periodic orbit in Proposition 6 lies inside the open matching domain.
    A limiting endpoint at the equilibrium is not an additional periodic orbit.
    Nonisolated zeros, including a zero interval and its endpoints within the domain,
    do not count as limit cycles. Isolated multiple zeros remain covered by the same correspondence.
]

== 3 Quadratic fitting and its transport law <sec:fitting>

For the reference profile

$ q_(lambda \, kappa) \( u \) = lambda u + kappa / 2 u^2 \, wide \( lambda \, kappa \) in bb(R)^2 \, $

let $H \( lambda \, kappa \, r \)$ be its midpoint data at base height zero and width $r > 0$.
  The entire-profile version of Lemma 2 makes this definition valid for every such triple. Set

#[#set math.equation(numbering: n => "(3.1)")
 $ P = H_lambda \, wide Q = H_kappa \, wide R = P_r \, wide S = Q_r \, wide G = P S - Q R . $ <eq:fit-notation>]

Unless stated otherwise, a subscript on a model function denotes an ordinary partial derivative with its other
  arguments held fixed. Smooth arc dependence gives smoothness of these functions for $r > 0$, and Lemma 2 gives

#[#set math.equation(numbering: n => "(3.2)")
 $ \| H \| < r \, wide \| H_r \| < 1 . $ <eq:fit-open-data>]

The variations $u$ and $u^2 \/ 2$ of the profile are strictly positive in the interior of every base-zero arc.
  The positive denominator in Lemma 3 therefore gives, already at this stage,

#[#set math.equation(numbering: n => "(3.3)")
 $ P > 0 \, wide Q > 0 . $ <eq:fit-PQ-positive>]

Reflecting the endpoint coordinate $y$ negates the profile and the midpoint, while preserving the width. Consequently

#[#set math.equation(numbering: n => "(3.4)")
 $ H \( - lambda \, - kappa \, r \) = - H \( lambda \, kappa \, r \) \, wide
   H_r \( - lambda \, - kappa \, r \) = - H_r \( lambda \, kappa \, r \) . $ <eq:fit-reflection>]

The goal of this section is Theorem 13: at each positive width,
  $\( H \, H_r \)$ gives global coordinates on the model parameter plane.
  We first fit the midpoint by varying the slope at fixed curvature.
  Keeping the midpoint and width fixed, we then vary the curvature and show that the model width derivative
  increases through $\( - 1 \, 1 \)$. The final subsection expresses the transport of a general smooth profile in
  these fitted coordinates.

=== 3.1 Reference characteristics and curvature comparison <reference-characteristics-and-curvature-comparison>

It is useful to specify a quadratic arc by its slope at the peak.
  For $kappa \, z in bb(R)$, take the entire profile $z u + kappa u^2 \/ 2$ with peak height zero.
  As the base moves downwards from that peak, let

$ j_kappa \( s \, z \) \, wide Theta_kappa \( s \, z \) \, wide cal(L)_kappa \( s \, z \) $

denote its base slope, its angle $"arctanh" \( M \/ s \)$, and $"arctanh" v$, respectively,
  at characteristic width $s > 0$. Here $v = M_r$ is the width derivative at fixed base height of the given
  profile, evaluated on the characteristic. Translating the height coordinate and subtracting the profile value at
  the translated origin shows that these relative data describe every quadratic characteristic with peak slope $z$
  and curvature $kappa$.

#thm([Lemma 3.1.])[
  #emph[The reference functions are smooth in $\( kappa \, s \, z \)$ for $s >
    0$ and are defined at every finite positive width. They satisfy
#[#set math.equation(numbering: n => "(3.5)")
 $ partial_s j_kappa = - s kappa "sech"^2 Theta_kappa \, wide partial_s Theta_kappa = j_kappa -
   frac(sinh \( 2 Theta_kappa \), s) \, wide partial_s cal(L)_kappa = frac(sinh \( 2 Theta_kappa \), s) \,
   $ <eq:fit-reference-system>]

 with limiting values $j_kappa \( 0 \, z \) = z$ and $Theta_kappa \( 0 \, z \) = cal(L)_kappa \( 0 \, z \) = 0$.
   Moreover,
#[#set math.equation(numbering: n => "(3.6)")
 $ \| j_kappa \( s \, z \) - z \| lt.eq frac(\| kappa \| s^2, 2) \, wide partial_z j_kappa \( s \, z \) > 0 \,
   wide partial_z Theta_kappa \( s \, z \) > 0 . $ <eq:fit-reference-bounds>]

 For each fixed $s > 0$ and $kappa$, the map $z mapsto Theta_kappa \( s \, z \)$ is a bijection onto $bb(R)$. Finally,
#[#set math.equation(numbering: n => "(3.7)")
 $ partial_z cal(L)_kappa \( s \, z \) = integral_0^s frac(2 cosh \( 2 Theta_kappa \( q \, z \) \), q) partial_z
   Theta_kappa \( q \, z \) thin d q > 0 . $ <eq:fit-L-z>]

]
] <fit:references>

#proof[
  The entire-profile construction in Lemma 2 gives an arc at every lower base height.
    Its width tends to zero at the peak and tends to infinity as the base tends to minus infinity,
    since $s^2 gt.eq 2 \( t - h \)$. Its strictly negative base derivative gives the smooth inversion from base
    height to any $s > 0$, including smooth dependence on the quadratic coefficients.
    Thus no finite-width existence claim is being inferred from the singular equations at $s = 0$.
    Equation (2.6) gives Equation (3.5) and, by integration of the slope equation, the first bound in Equation (3.6).
  For $kappa eq.not 0$, consider instead the single profile $kappa u^2 \/ 2$.
    Let $macron(h) \( t \, s \)$ be its base height when the peak height is $t$ and the width is $s$.
    Its peak slope is $z = kappa t$, and its base slope is $kappa macron(h) \( t \, s \)$. Therefore
  $ partial_z j_kappa \( s \, z \) = partial_t macron(h) \( t \, s \) > 0 $
  by Lemma 2. This calculation is valid for either sign of $kappa$. For $kappa = 0$, one has $j_0 \( s \, z \) = z$.
  The smooth scaling in Lemma 4 gives, locally uniformly in the finite parameters,
  #[#set math.equation(numbering: n => "(3.8)")
   $ Theta_kappa \( s \, z \) = z / 3 s + O \( s^2 \) \, wide partial_z Theta_kappa \( s \, z \) = s / 3 +
     O \( s^2 \) . $ <eq:fit-reference-small-width>]
  Differentiating the angle equation at positive width gives
  $ partial_s \( partial_z Theta_kappa \) = partial_z j_kappa -
    frac(2 cosh \( 2 Theta_kappa \), s) partial_z Theta_kappa . $
  The initial sign supplied by Equation (3.8) and the positive forcing prove $partial_z Theta_kappa >
    0$ by the scalar integrating-factor formula.
  To verify the range, fix $r > 0$. For $0 < s lt.eq r$,
  $ j_kappa \( s \, z \) gt.eq z - frac(\| kappa \| r^2, 2) . $
  For sufficiently large positive $z$, the angle is positive near zero and cannot cross zero downwards,
    since its derivative there would be positive. Given $N > 0$, on $\[ r \/ 2 \, r \]$ and whenever $0 lt.eq
    Theta_kappa lt.eq N$,
  $ partial_s Theta_kappa gt.eq z - frac(\| kappa \| r^2, 2) - frac(2 sinh \( 2 N \), r) . $
  For large enough $z$, this lower bound forces a crossing of $N$ within that interval if the angle has not
    already exceeded $N$; it also prohibits a downward crossing of $N$.
    Thus $Theta_kappa \( r \, z \) arrow.r + oo$ as $z arrow.r + oo$.
    Applying the same argument to $\( - j \, - Theta \, - kappa \)$ proves the negative limit as $z arrow.r - oo$.
    Strict monotonicity and smoothness give the asserted bijection.
  Integrating the last equation in Equation (3.5) gives
  $ cal(L)_kappa \( s \, z \) = integral_0^s frac(sinh \( 2 Theta_kappa \( q \, z \) \), q) thin d q . $
  Equation (3.8), including its locally uniform parameter derivative,
    bounds the differentiated integrand near zero. Differentiation under this integral is therefore valid and
    yields Equation (3.7). Its integrand is strictly positive at every positive width. ◻
]

For $s > 0$, let $z = z \( kappa \, s \, theta \)$ be the inverse supplied by Lemma 8,
  and define the reference slope field

#[#set math.equation(numbering: n => "(3.9)")
 $ J_kappa \( s \, theta \) = j_kappa #scale(x: 120%, y: 120%)[\(] s \,
   z \( kappa \, s \, theta \) #scale(x: 120%, y: 120%)[\)] . $ <eq:fit-slope-field>]

It is smooth, and

#[#set math.equation(numbering: n => "(3.10)")
 $ \( J_kappa \)_theta = frac(partial_z j_kappa, partial_z Theta_kappa) > 0 . $ <eq:fit-field-positive>]

The following comparison will also be used for nonquadratic profiles.

#thm([Lemma 3.2.])[
  (Curvature comparison).  #emph[Let a smooth profile $phi.alt$ have an arc with peak height $t$,
    and parameterize that arc from its peak to a final width $r > 0$ by $s in \( 0 \, r \]$.
    Assume $phi.alt$ is smooth on a neighborhood of the traversed height interval.
    Write $h \( s \)$, $theta \( s \)$, and $L \( s \)$ for its characteristic data, and set $k = phi.alt'$.
    For any fixed $kappa in bb(R)$, define
$ E \( s \) = k \( h \( s \) \) - J_kappa \( s \, theta \( s \) \) \, wide theta \( s \) =
  Theta_kappa \( s \, z \( s \) \) . $

 Then $z \( s \) arrow.r k \( t \)$, $E \( s \) arrow.r 0$ as $s arrow.b 0$, and
#[#set math.equation(numbering: n => "(3.11)")
 $ E' \( s \) + \( J_kappa \)_theta \( s \, theta \( s \) \) E \( s \) & = -
   s #scale(x: 120%, y: 120%)[\(] phi.alt'' \( h \( s \) \) -
   kappa #scale(x: 120%, y: 120%)[\)] "sech"^2 theta \( s \) \,\
z' \( s \) & = frac(E \( s \), partial_z Theta_kappa \( s \, z \( s \) \)) . $ <eq:curvature-error>]

 Put $a \( s \) = \( J_kappa \)_theta \( s \, theta \( s \) \) >
   0$ and let $f \( s \)$ denote the right-hand side of Equation (3.11).
   The comparison from zero is given by the convergent formula
#[#set math.equation(numbering: n => "(3.12)")
 $ E \( s \) = integral_0^s exp (- integral_q^s a \( xi \) thin d xi) f \( q \) thin d q . $ <eq:fit-error-integral>]

 In particular, if $phi.alt'' \( h \( s \) \) gt.eq kappa$ for $0 < s lt.eq r$, then $E lt.eq 0$,
   $z$ is nonincreasing, and
$ theta \( s \) gt.eq Theta_kappa \( s \, z \( r \) \) quad \( 0 < s < r \) \, wide L \( r \) gt.eq
  cal(L)_kappa \( r \, z \( r \) \) . $

 If the curvature difference is not identically zero on $\( 0 \, r \)$, the last inequality is strict,
   as are all the preceding angle inequalities for $0 < s < r$, and $E \( r \) < 0$.
   All signs reverse under the assumption $phi.alt'' \( h \( s \) \) lt.eq kappa$.]
] <lem:curvature-comparison>

#proof[
  Along every reference characteristic, the definition of the field and Equation (3.5) give
  $ \( J_kappa \)_s + \( J_kappa \)_theta (J_kappa - frac(sinh \( 2 theta \), s)) = - s kappa "sech"^2 theta . $
  Subtracting this identity from the evolution of the actual slope in Equation (2.6) proves Equation (3.11).
    Differentiating $theta \( s \) = Theta_kappa \( s \, z \( s \) \)$ and subtracting the two angle equations
    gives Equation (3.11).
  The small-width expansions give $theta \( s \) \/ s arrow.r k \( t \) \/ 3$.
    For each $epsilon > 0$, the reference angles with labels $k \( t \) - epsilon$ and $k \( t \) +
    epsilon$ bracket this actual angle at all sufficiently small positive widths.
    The strict monotonicity in Lemma 8 therefore implies $z \( s \) arrow.r k \( t \)$.
    The bound $\| j_kappa \( s \, z \( s \) \) - z \( s \) \| lt.eq \| kappa \| s^2 \/ 2$ then proves $E \( s \)
    arrow.r 0$.
  For $0 < epsilon < s$, variation of constants gives
  $ E \( s \) = E \( epsilon \) exp (- integral_epsilon^s a) +
    integral_epsilon^s exp (- integral_q^s a) f \( q \) thin d q . $
  The first term tends to zero because $a > 0$ and $E \( epsilon \) arrow.r 0$.
    Also $f \( q \) = O \( q \)$ near the smooth peak, and the exponential is between zero and one for $0 < q
    lt.eq s$. Dominated convergence proves Equation (3.12), without any assumption that $a$ is integrable at zero.
  If the curvature difference is nonnegative, then $f lt.eq 0$, so $E lt.eq 0$ and $z' lt.eq 0$.
    This proves the weak angle inequality by Lemma 8. If the difference is positive somewhere in $\( 0 \, r \)$,
    continuity gives a subinterval on which $f < 0$. Equation (3.12) makes $E$ strictly negative from the end of
    that subinterval through $r$. Thus $z \( s \) > z \( r \)$ for every $s < r$,
    giving strict angle inequalities. The integral formula for $L$ in Equation (2.12) then gives the stated strict
    inequality at the final width. Negating the inequalities proves the other case. ◻
]

=== 3.2 Midpoint fitting and the positive conditional derivative <midpoint-fitting-and-the-positive-conditional-derivative>

For a prescribed $r > 0$, $\| M \| < r$, and curvature $kappa$,
  Lemma 8 gives a unique peak label satisfying $Theta_kappa \( r \, z \) = "arctanh" \( M \/ r \)$.
  Translate that reference arc to base height zero and subtract its profile value at the base.
  The resulting quadratic has base slope $lambda = j_kappa \( r \, z \)$, curvature $kappa$, and midpoint $M$.
  Conversely, each base-zero quadratic arc has a finite peak and arises in this way.
  Since $P > 0$, midpoint fitting is unique. We denote its slope by

#[#set math.equation(numbering: n => "(3.13)")
 $ lambda_(*) \( r \, M \, kappa \) \, wide H \( lambda_(*) \( r \, M \, kappa \) \, kappa \, r \) =
   M . $ <eq:fit-midpoint-slope>]

The implicit-function theorem and uniqueness make $lambda_(*)$ jointly smooth throughout $r > 0$, $\| M \| < r$,
  $kappa in bb(R)$. Define the conditional derivative and its angle by

#[#set math.equation(numbering: n => "(3.14)")
 $ hat(v) \( r \, M \, kappa \) = H_r \( lambda_(*) \( r \, M \, kappa \) \, kappa \, r \) \, wide
   hat(L) \( r \, M \, kappa \) = "arctanh" hat(v) \( r \, M \, kappa \) . $ <eq:fit-conditional-data>]

Both functions are smooth, by Equation (3.2).

#thm([Lemma 3.3.])[
  #emph[For every $r > 0$, $\| M \| < r$, and $kappa in bb(R)$,
#[#set math.equation(numbering: n => "(3.15)")
 $ partial_kappa hat(L) \( r \, M \, kappa \) > 0 \, wide partial_kappa hat(v) \( r \, M \, kappa \) = G /
   P > 0 \, $ <eq:fit-conditional-positive>]

 where the model derivatives on the right are evaluated at the midpoint fit.
   In particular, $G > 0$ for every model arc.]
] <fit:conditional-derivative>

#proof[
  Fix $r \, M \, kappa$. For $delta > 0$, let $theta_delta \( s \)$ be the characteristic of the midpoint-fitted
    model of curvature $kappa + delta$; let $theta_0$ be the one of curvature $kappa$.
    Their final angles are equal. Lemma 9 gives
  #[#set math.equation(numbering: n => "(3.16)")
   $ theta_delta \( s \) > theta_0 \( s \) wide \( 0 < s < r \) . $ <eq:fit-interior-order>]
  It follows already that the conditional $hat(L)$ is strictly increasing.
    We prove a quantitative first-order bound to obtain the asserted strict derivative.
  Use the field $J_kappa$ to compare the curvature-$kappa + delta$ characteristic,
    and write its error as $E_delta$. Then
  $ E'_delta + a_delta E_delta = - delta s "sech"^2 theta_delta \, wide
    a_delta \( s \) = \( J_kappa \)_theta \( s \, theta_delta \( s \) \) > 0 \, wide E_delta lt.eq 0 . $
  Choose $0 < a < b < c < r$. The already established smooth midpoint fit and smooth finite-parameter arc
    dependence imply that, for all sufficiently small $delta gt.eq 0$, there are constants $A \, q_0 > 0$,
    independent of $delta$, such that on $\[ a \, r \]$,
  $ a_delta \( s \) lt.eq A \, wide s "sech"^2 theta_delta \( s \) gt.eq q_0 . $
  Variation of constants starting at $a$, using $E_delta \( a \) lt.eq 0$, consequently gives
  #[#set math.equation(numbering: n => "(3.17)")
   $ E_delta \( s \) lt.eq - c_0 delta quad \( b lt.eq s lt.eq r \) \, wide c_0 =
     q_0 \( b - a \) e^(- A r) > 0 . $ <eq:fit-error-quantitative>]
  This estimate needs no bound uniform in $delta$ near $s = 0$.
    The sign at $a$ follows from the from-zero comparison separately for every $delta > 0$.
  Let $z_delta \( s \)$ be the reference label defined by $theta_delta \( s \) =
    Theta_kappa \( s \, z_delta \( s \) \)$, and let $z_0$ be the constant label of the curvature-$kappa$ arc.
    Final angle matching gives $z_delta \( r \) = z_0$. Smoothness of the inverse reference-label map puts all
    these labels, for $b lt.eq s lt.eq r$ and small $delta gt.eq 0$, in a common compact set.
    Enlarge the set to include the intervals between $z_0$ and $z_delta \( s \)$.
    Lemma 8 then gives constants $m_0 \, B_0 > 0$ with
  $ m_0 lt.eq partial_z Theta_kappa \( s \, z \) lt.eq B_0 $
  throughout that set. Equations (3.11) and (3.17) yield
  $ z'_delta \( s \) lt.eq - frac(c_0 delta, B_0) quad \( b lt.eq s lt.eq r \) . $
  Integrating backwards from the common final label gives, for $b lt.eq s lt.eq c$,
  $ z_delta \( s \) - z_0 gt.eq frac(c_0 delta \( r - c \), B_0) \, wide theta_delta \( s \) -
    theta_0 \( s \) gt.eq frac(m_0 c_0 delta \( r - c \), B_0) . $
  Since the derivative of $sinh \( 2 theta \)$ is at least $2$,
    the integral formulas for the final $L$-values and Equation (3.16) now imply
  #[#set math.equation(numbering: n => "(3.18)")
   $ hat(L) \( r \, M \, kappa + delta \) - hat(L) \( r \, M \, kappa \) gt.eq
     frac(2 m_0 c_0 \( r - c \), B_0) log #h(-0.16667em) c / b thick delta . $ <eq:fit-L-quantitative>]
  Thus ordinary smoothness of the conditional function at the final positive width proves $partial_kappa hat(L) >
    0$. No differentiation of the improper $L$-integral is used here.
  Finally, implicit differentiation of Equation (3.13) gives $partial_kappa lambda_(*) = - Q \/ P$, and hence
  $ partial_kappa hat(v) = S - R Q / P = G / P = \( 1 - hat(v)^2 \) partial_kappa hat(L) > 0 . $
  Since every model arc is its own midpoint fit, this proves $G > 0$ everywhere.
    The argument used $P > 0$, but did not assume the sign or nonvanishing of $G$. ◻
]

=== 3.3 The full range of the conditional fit <the-full-range-of-the-conditional-fit>

#thm([Lemma 3.4.])[
  #emph[For fixed $r > 0$ and $\| M \| < r$,
#[#set math.equation(numbering: n => "(3.19)")
 $ lim_(kappa arrow.r + oo) hat(L) \( r \, M \, kappa \) = + oo \, wide
   lim_(kappa arrow.r - oo) hat(L) \( r \, M \, kappa \) = - oo . $ <eq:fit-properness>]

]
] <fit:properness>

#proof[
  Suppose the first limit fails. Strict monotonicity then makes $hat(L) \( r \, M \, kappa \)$ bounded above as
    $kappa arrow.r + oo$. Choose positive curvatures $kappa_n arrow.t + oo$,
    and denote the matched-final-angle characteristics by $theta_n \( s \)$, $j_n \( s \)$,
    and their final $L$-values by $L_n$. Lemma 9 gives pointwise increase of $theta_n \( s \)$ for $0 < s < r$. Put
  $ f_n \( s \) = frac(sinh \( 2 theta_n \( s \) \), s) . $
  Each $f_n$ is integrable at zero by its smooth-peak expansion, and
  $ f_n - f_1 gt.eq 0 \, wide integral_0^r \( f_n - f_1 \) thin d s = L_n - L_1 lt.eq C $
  for some finite $C$. Monotone convergence shows that the limiting $f_n$, and therefore the limiting $theta_n$,
    are finite almost everywhere in $\( 0 \, r \)$.
  Choose four such widths $0 < a < b < c < d < r$. The angle equation gives
  $ A_n := integral_a^b j_n \( s \) thin d s & = theta_n \( b \) - theta_n \( a \) +
    integral_a^b f_n \( s \) thin d s \,\
B_n := integral_c^d j_n \( s \) thin d s & = theta_n \( d \) - theta_n \( c \) + integral_c^d f_n \( s \) thin d s . $
  Both sequences are bounded above and below: the four endpoint angle sequences are bounded,
    and for every subinterval $I$,
  $ 0 lt.eq integral_I \( f_n - f_1 \) thin d s lt.eq C . $
  Choose constants $A_(*) \, B_(*)$ with $A_n lt.eq A_(*)$ and $B_n gt.eq B_(*)$.
    Because $kappa_n > 0$, the slope $j_n$ is decreasing, so
  #[#set math.equation(numbering: n => "(3.20)")
   $ j_n \( b \) lt.eq frac(A_n, b - a) lt.eq frac(A_(*), b - a) \, wide j_n \( c \) gt.eq frac(B_n, d - c) gt.eq
     frac(B_(*), d - c) . $ <eq:fit-outer-averages>]
  Thus $j_n \( b \) - j_n \( c \)$ has a uniform upper bound.
  On the other hand, its exact evolution is
  #[#set math.equation(numbering: n => "(3.21)")
   $ j_n \( b \) - j_n \( c \) = kappa_n integral_b^c s "sech"^2 theta_n \( s \) thin d s . $ <eq:fit-middle-drop>]
  The integrand is bounded by $s$ and converges almost everywhere to a strictly positive function,
    because the limiting angle is finite almost everywhere. Dominated convergence gives a strictly positive
    limiting integral in Equation (3.21). Its right-hand side therefore tends to infinity,
    contradicting Equation (3.20). This proof uses no uniform angle bound on the middle interval.
  For the second limit, Equation (3.4) and uniqueness of midpoint fitting give
  $ lambda_(*) \( r \, - M \, - kappa \) = - lambda_(*) \( r \, M \, kappa \) \, wide
    hat(L) \( r \, M \, kappa \) = - hat(L) \( r \, - M \, - kappa \) . $
  The positive-curvature result holds for every fixed midpoint, including $- M$.
    It therefore proves the negative-curvature limit at the original fixed midpoint $M$, as required. ◻
]

=== 3.4 The remaining derivative signs and the global inverse <the-remaining-derivative-signs-and-the-global-inverse>

#thm([Lemma 3.5.])[
  #emph[The model derivatives $R$ and $S$ are strictly positive for every $\( lambda \, kappa \, r \) in bb(R)^2
    times \( 0 \, oo \)$. The width identity is
#[#set math.equation(numbering: n => "(3.22)")
 $ kappa P + lambda = frac(r H_r + H, r^2 - H^2) . $ <eq:fit-width-identity>]

 With $L_(upright("mod")) \( lambda \, kappa \, r \) = "arctanh" H_r \( lambda \, kappa \, r \)$,
   differentiating Equation (3.22) with respect to $r$ at fixed $\( lambda \, kappa \)$ gives
#[#set math.equation(numbering: n => "(3.23)")
 $ kappa R = frac(r \( 1 - H_r^2 \), r^2 - H^2) (\( L_(upright("mod")) \)_r - frac(2 H, r^2 - H^2)) .
   $ <eq:fit-R-identity>]

]
] <fit:positive-derivatives>

#proof[
  At base height $h$, translating the quadratic and subtracting its base value changes its slope to $lambda +
    kappa h$ and leaves its curvature unchanged. Its midpoint data are therefore
    $H \( lambda + kappa h \, kappa \, r \)$. At $h = 0$, the first transport identity in Equation (2.5) becomes
  $ kappa P - frac(r, r^2 - H^2) H_r = frac(H, r^2 - H^2) - lambda \, $
  which is Equation (3.22). For completeness, put $D_0 = r^2 - H^2$ and $v = H_r$.
    Differentiating at fixed $lambda \, kappa$ gives
  $ kappa R & = frac(r v_r + 2 v, D_0) - frac(2 \( r - H v \) \( r v + H \), D_0^2)\
 & = frac(r \( 1 - v^2 \), D_0) (frac(v_r, 1 - v^2) - frac(2 H, D_0)) \, $
  proving Equation (3.23).
  Let $t = t \( lambda \, kappa \, r \) > 0$ be the peak of this base-zero model arc.
    Lemma 2 gives $t_r > 0$ at fixed model parameters. Its peak slope is $z = lambda + kappa t$, so
  $ L_(upright("mod")) \( lambda \, kappa \, r \) =
    cal(L)_kappa \( r \, lambda + kappa t \( lambda \, kappa \, r \) \) . $
  The chain rule and Equation (3.5) yield
  #[#set math.equation(numbering: n => "(3.24)")
   $ \( L_(upright("mod")) \)_r = frac(2 H, r^2 - H^2) + kappa t_r partial_z cal(L)_kappa \( r \, z \) .
     $ <eq:fit-base-width-L>]
  For $kappa eq.not 0$, substitution into Equation (3.23) and cancellation of $kappa$ give
  $ R = frac(r \( 1 - H_r^2 \), r^2 - H^2) t_r partial_z cal(L)_kappa \( r \, z \) > 0 $
  by Lemma 8. This cancellation is valid for either sign of $kappa$.
    For $kappa = 0$, the peak slope is $z = lambda$, so direct parameter differentiation gives
  $ R = partial_lambda H_r = \( 1 - H_r^2 \) partial_z cal(L)_0 \( r \, lambda \) > 0 . $
  Finally, $S = \( G + Q R \) \/ P > 0$ by Equation (3.3) and Lemma 10. ◻
]

#thm([Theorem 3.6.])[
  (Global quadratic fit).  #emph[For every $r > 0$ and every pair $\( M \, v \)$ satisfying $\| M \| < r$ and $\|
    v \| < 1$, there is a unique finite pair $\( lambda \, kappa \) in bb(R)^2$ such that
$ H \( lambda \, kappa \, r \) = M \, wide H_r \( lambda \, kappa \, r \) = v . $

 The fitted parameters depend jointly smoothly on $\( M \, v \, r \)$ in this open domain. Equivalently, the smooth map
#[#set math.equation(numbering: n => "(3.25)")
 $ \( lambda \, kappa \, r \) mapsto \( H \( lambda \, kappa \, r \) \, H_r \( lambda \, kappa \, r \) \, r \)
   $ <eq:fit-joint-map>]

 is a diffeomorphism from $bb(R)^2 times \( 0 \, oo \)$ onto ${ \( M \, v \, r \) : r > 0 \, med \| M \| < r \,
   med \| v \| < 1 }$. At every model arc, $P \, Q \, R \, S \, G > 0$.
   In particular, fitted parameters converge to a finite pair whenever their data converge to an interior point of
   this domain, even when the width varies.]
] <thm:quadratic-fit>

#proof[
  Fix $\( M \, v \, r \)$ in the stated domain. For each curvature there is exactly one slope fit by
    Equation (3.13). Lemmas 10 and 11 show that its conditional $hat(L)$ is a strictly increasing map of $bb(R)$
    onto $bb(R)$. There is therefore exactly one curvature for which $hat(L) = "arctanh" v$,
    and then exactly one slope. The sign assertions have been proved in Equation (3.3) and Lemmas 10 and 12.
  The Jacobian of Equation (3.25) has last row $\( 0 \, 0 \, 1 \)$, and its determinant is $G > 0$.
    The inverse-function theorem gives a smooth local inverse at every point.
    These inverses agree wherever their domains overlap, by the global uniqueness just proved,
    so the inverse is jointly smooth on the entire target domain.
    Its continuity gives the final convergence statement. ◻
]

=== 3.5 Transport of an actual profile in fitted coordinates <transport-of-an-actual-profile-in-fitted-coordinates>

We now express the motion of a general arc in the model coordinates.
  Let $phi.alt in C^oo \( \( 0 \, oo \) \, bb(R) \)$, set $k = phi.alt'$,
  and let $M \( h \, r \)$ and $v \( h \, r \) = M_r \( h \, r \)$ be its endpoint data from Section 2.
  The fit records both the midpoint and its response to a change in width;
  their two transport equations determine the evolution of the fitted slope and curvature.
  Theorem 13 gives unique smooth functions $lambda \( h \, r \)$ and $kappa \( h \, r \)$ such that

#[#set math.equation(numbering: n => "(3.26)")
 $ M \( h \, r \) = H \( lambda \( h \, r \) \, kappa \( h \, r \) \, r \) \, wide v \( h \, r \) =
   H_r \( lambda \( h \, r \) \, kappa \( h \, r \) \, r \) \, wide h \, r > 0 . $ <eq:fit-identities>]

In the following identities, $P \, Q \, R \, S \, G$ denote the quadratic-model quantities evaluated at this fit.
  In particular,

$ P \, Q \, R \, S \, G > 0 . $

Recall the notation

$ alpha \( h \, r \) = frac(r, r^2 - M \( h \, r \)^2) \, wide D = partial_h - alpha partial_r . $

Along an arc with its peak fixed, $D$ is differentiation with respect to the base height.
  If the same characteristic is parametrized by its outward-increasing width $s$,
  then differentiation along it is $- D \/ alpha$.

#thm([Lemma 3.7.])[
  (Transport of the fit).  #emph[The fitted parameters satisfy
#[#set math.equation(numbering: n => "(3.27)")
 $ P lambda_r + Q kappa_r & = 0 \,\
D kappa & = - R / G #scale(x: 120%, y: 120%)[\(] lambda - k \( h \) #scale(x: 120%, y: 120%)[\)] \,\
D lambda - kappa & = S / G #scale(x: 120%, y: 120%)[\(] lambda -
  k \( h \) #scale(x: 120%, y: 120%)[\)] . $ <eq:fit-transport>]

]
] <lem:fit-transport>

#proof[
  Differentiating the first identity in Equation (3.26) at fixed $h$ and using the second one gives $P lambda_r +
    Q kappa_r = 0$.
  For a quadratic profile, increasing its base height changes the slope at rate $kappa$,
    leaves its curvature fixed, and changes the width at rate $- alpha$.
    Applying Equation (2.5) to that profile, at the fitted data, therefore gives
  $ kappa P - alpha H_r & = frac(M, r^2 - M^2) - lambda \,\
kappa R - alpha H_(r r) & = - frac(2 M r \( 1 - v^2 \), \( r^2 - M^2 \)^2) . $
  For the actual profile, the chain rule gives
  $ D M & = P D lambda + Q D kappa - alpha H_r \,\
D v & = R D lambda + S D kappa - alpha H_(r r) . $
  The expression for $D v$ in Equation (2.5) depends only on $M \, v \, r$,
    so it is identical for the two matched sets of data. Subtracting the preceding identities consequently yields
  $ P \( D lambda - kappa \) + Q D kappa & = lambda - k \( h \) \,\
R \( D lambda - kappa \) + S D kappa & = 0 . $
  Their determinant is $G = P S - Q R > 0$. Solving this system proves Equation (3.27). ◻
]

== 4 A differential inequality for the quadratic model <sec:model>

The transport law of Lemma 14 contains the coefficient

$ C \( lambda \, kappa \, r \) = R / G \, wide D kappa = -
  C \( lambda \, kappa \, r \) #scale(x: 120%, y: 120%)[\(] lambda - phi.alt' \( h \) #scale(x: 120%, y: 120%)[\)] . $

When this identity is differentiated with respect to width,
  the implicit changes of the fitted parameters contribute terms proportional to $kappa_r$.
  The remaining source contains the explicit model derivative $C_r$.
  The shape comparison in Section 5 will use its sign, which is the purpose of this section.

From this point onward $lambda$ and $kappa$ are independent model parameters. The model quantities are

$ H = H \( lambda \, kappa \, r \) \, wide P = H_lambda \, quad Q = H_kappa \, quad R = P_r \, quad S = Q_r \,
  quad G = P S - Q R \, $

and $P \, Q \, R \, S \, G > 0$ by Theorem 13. Throughout this section,
  an $r$-subscript on a model function denotes a partial derivative with $lambda \, kappa$ fixed.
  Derivatives along a characteristic will be identified explicitly.

#thm([Theorem 4.1.])[
  #emph[For every $lambda \, kappa in bb(R)$ and $r > 0$,
#[#set math.equation(numbering: n => "(4.1)")
 $ (R / G)_r lt.eq 0 . $ <model:inequality>]

]
] <thm:model-inequality>

We prove the inequality by transporting the sign of $cal(W) = R S_r - S R_r$ from small width.
  Endpoint identities and a Riccati linearization determine the sign at any possible zero;
  a characteristic argument then excludes such zeros when $kappa eq.not 0$, and continuity treats $kappa = 0$.

=== 4.1 Transport and the quantity whose sign is required <transport-and-the-quantity-whose-sign-is-required>

Set

#[#set math.equation(numbering: n => "(4.2)")
 $ cal(W) = R S_r - S R_r \, wide alpha = frac(r, r^2 - H^2) \, wide gamma =
   frac(r^2 + H^2 + 2 r H H_r, \( r^2 - H^2 \)^2) . $ <model:definitions>]

Since $P_r = R$ and $Q_r = S$, we have

#[#set math.equation(numbering: n => "(4.3)")
 $ G_r = P S_r - Q R_r \, wide (R / G)_r = frac(R_r G - R G_r, G^2) = -
   frac(P cal(W), G^2) . $ <model:quotient-derivative>]

It therefore suffices to prove $cal(W) gt.eq 0$.

For a quadratic profile, raising the base height while keeping the peak fixed changes the base slope at rate
  $kappa$. The corresponding transport operator on model data is

#[#set math.equation(numbering: n => "(4.4)")
 $ cal(D) = kappa partial_lambda - alpha partial_r . $ <model:transport-operator>]

The arc transport identity from Section 2 becomes $cal(D) H = H \/ \( r^2 - H^2 \) - lambda$.
  Differentiating this identity in $lambda$ and in $kappa$, including the derivatives of $cal(D)$, gives

#[#set math.equation(numbering: n => "(4.5)")
 $ cal(D) P = gamma P - 1 \, wide cal(D) Q = gamma Q - P . $ <model:PQ-transport>]

For example, differentiating in $lambda$ contributes $- alpha_lambda H_r$ on the left, where $alpha_lambda =
  2 r H P \/ \( r^2 - H^2 \)^2$. Differentiating in $kappa$ also contributes $P$,
  because the coefficient of $partial_lambda$ is $kappa$. These are exactly the terms accounted for in Equation (4.5).

The commutator identity is $cal(D) \( f_r \) = \( cal(D) f \)_r + alpha_r f_r$. It yields

#[#set math.equation(numbering: n => "(4.6)")
 $ cal(D) R & = \( gamma + alpha_r \) R + gamma_r P \,\
cal(D) S & = \( gamma + alpha_r \) S + gamma_r Q - R \,\
cal(D) \( R_r \) & = \( gamma + 2 alpha_r \) R_r + \( 2 gamma_r + alpha_(r r) \) R + gamma_(r r) P \,\
cal(D) \( S_r \) & = \( gamma + 2 alpha_r \) S_r + \( 2 gamma_r + alpha_(r r) \) S + gamma_(r r) Q -
  R_r . $ <model:RS-transport>]

Applying these four formulas to $R S_r - S R_r$, the terms containing $alpha_(r r)$ cancel, and the remaining terms give

#[#set math.equation(numbering: n => "(4.7)")
 $ cal(D) cal(W) = \( 2 gamma + 3 alpha_r \) cal(W) + gamma_r G_r - gamma_(r r) G . $ <model:W-transport>]

The variation formula in Lemma 3, together with the smooth arc scaling in Section 2,
  gives the following differentiated small-width expansions:

#[#set math.equation(numbering: n => "(4.8)")
 $ P & = r^2 / 3 + O \( r^3 \) \, & R & = frac(2 r, 3) + O \( r^2 \) \, & R_r & = 2 / 3 + O \( r \) \,\
Q & = r^4 / 15 + O \( r^5 \) \, & S & = frac(4 r^3, 15) + O \( r^4 \) \, & S_r & = frac(4 r^2, 5) +
  O \( r^3 \) . $ <model:small-width>]

The remainders are uniform on compact sets of finite $\( lambda \, kappa \)$.
  Indeed, after width-one scaling, the model parameters are $lambda r \, kappa r^3$,
  the limiting arc is a regular parabola, and the first variations in the profiles $u$ and $u^2 \/ 2$ are $1 \/
  3$ and $1 \/ 15$. Smooth dependence at that scaled arc permits the two displayed $r$-differentiations. In particular,

#[#set math.equation(numbering: n => "(4.9)")
 $ cal(W) = 16 / 45 r^3 + O \( r^4 \) . $ <model:W-small-width>]

At a zero of $cal(W)$, the already established inequality $R > 0$ allows us to set $sigma_0 = R_r \/ R$. Then

#[#set math.equation(numbering: n => "(4.10)")
 $ R_r = sigma_0 R \, wide S_r = sigma_0 S \, wide G_r = sigma_0 G . $ <model:zero-relations>]

At such a zero, Equation (4.7) becomes

$ cal(D) cal(W) = - G \( gamma_(r r) - sigma_0 gamma_r \) . $

The outward derivative along a characteristic is $- cal(D) \/ alpha$.
  Thus the sign needed to prevent a first zero from positive values is

#[#set math.equation(numbering: n => "(4.11)")
 $ gamma_(r r) - sigma_0 gamma_r > 0 wide \( kappa > 0 \, med cal(W) = 0 \) . $ <model:required-zero-sign>]

The next three subsections establish this strict inequality from the quadratic arc equation.
  We then apply it on the entire model domain.

=== 4.2 Endpoint identities and two exact algebraic reductions <endpoint-identities-and-two-exact-algebraic-reductions>

For the remainder of the sign calculation, write $kappa = 2 b > 0$ and $d = lambda$. The profile is $d u + b u^2$.
  Its endpoints at base zero are $- m \, n$, where

#[#set math.equation(numbering: n => "(4.12)")
 $ m = r - H \, wide n = r + H \, wide ell = frac(d n, d m) = frac(1 + H_r, 1 - H_r) > 0 \, wide w = ell_m /
   ell . $ <model:endpoint-variables>]

Here $m_r = 1 - H_r > 0$, so $m$ is a valid local coordinate along the fixed-$\( d \, b \)$ family.
  Subscripts $m$ below refer to this coordinate. We also write

#[#set math.equation(numbering: n => "(4.13)")
 $ cal(S) = ell_(m m) / ell - 3 / 2 w^2 \, wide w_m = cal(S) + 1 / 2 w^2 . $ <model:Schwarzian-definition>]

Thus $cal(S)$ is the Schwarzian derivative of $n = n \( m \)$.

The following weighted endpoint quantities will be useful:

#[#set math.equation(numbering: n => "(4.14)")
 $ X & = frac(ell \/ m - 1 \/ n, 1 + ell) = kappa P + d \,\
Z & = frac(ell m - n, 1 + ell) = d P + 3 kappa Q \,\
gamma & = frac(ell \/ m^2 + 1 \/ n^2, 1 + ell) . $ <model:endpoint-identities>]

For the first identity, use Equation (3.22),

$ kappa P + d = frac(r H_r + H, r^2 - H^2) \, $

and substitute $r = \( m + n \) \/ 2$, $H = \( n - m \) \/ 2$. For the second, width scaling gives

#[#set math.equation(numbering: n => "(4.15)")
 $ H \( lambda \, kappa \, r \) = r H \( lambda r \, kappa r^3 \, 1 \) \, wide r H_r - H = lambda P +
   3 kappa Q . $ <model:scaling>]

The endpoint form of $r H_r - H$ is the displayed expression for $Z$.
  The formula for $gamma$ follows directly from Equation (4.2).

Define

#[#set math.equation(numbering: n => "(4.16)")
 $ D_(*) =  & \( m - n \) cal(S) + [1 - frac(2 n, m) + ell (frac(2 m, n) - 1)] w + frac(m + n, 2) w^2 \,\
w_(*) =  & frac(2 \( ell m^4 - 2 ell m^3 n + 2 m n^3 - n^4 \), m^2 n^2 \( m + n \)) . $ <model:Dstar>]

#thm([Lemma 4.2.])[
  #emph[The exact determinant identity is
#[#set math.equation(numbering: n => "(4.17)")
 $ X_m Z_(m m) - Z_m X_(m m) = frac(ell^2 \( m + n \)^2, m^2 n^2 \( 1 + ell \)^3) D_(*) =
   frac(3 kappa^2, m_r^3) cal(W) . $ <model:determinant-factor>]

 At a zero of $cal(W)$ with $m eq.not n$, set $sigma = X_(m m) \/ X_m$. This is well defined, and
#[#set math.equation(numbering: n => "(4.18)")
 $ gamma_(r r) - sigma_0 gamma_r & = m_r^2 \( gamma_(m m) - sigma gamma_m \) \,\
gamma_(m m) - sigma gamma_m & = frac(ell \( m + n \)^2, \( 1 + ell \) m^2 n^2) frac(w_(*) - w, m - n) .
  $ <model:coordinate-zero-sign>]

 All the prefactors displayed in Equations (4.17) and (4.18) are strictly positive.]
] <model:endpoint-algebra>

#proof[
  Put $B = 1 \/ n^2 - 1 \/ m^2$. Differentiation of Equation (4.14), using $n_m = ell$, gives
  #[#set math.equation(numbering: n => "(4.19)")
   $ Z_m = frac(w ell \( m + n \), \( 1 + ell \)^2) \, wide X_m = frac(ell B, 1 + ell) + frac(Z_m, m n) \, wide
     B_m = 2 / m^3 - frac(2 ell, n^3) . $ <model:first-endpoint-derivatives>]
  Differentiate the middle identity and insert the first one into the determinant.
    After division by $ell^2 \( m + n \) \/ \( 1 + ell \)^3$, the result is
  #[#set math.equation(numbering: n => "(4.20)")
   $ B cal(S) + (frac(B \( 1 + ell \), m + n) - B_m) w + frac(\( m + n \)^2, 2 m^2 n^2) w^2 .
     $ <model:determinant-intermediate>]
  For example, in this calculation
  $ frac(d, d m) log frac(ell \( m + n \), \( 1 + ell \)^2) = frac(1 - ell, 1 + ell) w + frac(1 + ell, m + n) \,
    wide (frac(1, m n))_m = - frac(n + m ell, m^2 n^2) . $
  These two derivatives, together with $w_m = cal(S) + w^2 \/ 2$, give the three coefficients in Equation (4.20). Now
  $ B = frac(\( m - n \) \( m + n \), m^2 n^2) \, $
  and substitution of $B_m$ shows that the coefficient of $w$ in Equation (4.20) is
  $ frac(m + n, m^2 n^2) [1 - frac(2 n, m) + ell (frac(2 m, n) - 1)] . $
  This proves its first factorization in Equation (4.17).
  On the other hand, differentiating $X = kappa P + d$ and $Z = d P + 3 kappa Q$ with respect to $r$ gives
  $ X_r Z_(r r) - Z_r X_(r r) = 3 kappa^2 \( R S_r - S R_r \) . $
  The chain rule gives
  $ X_r Z_(r r) - Z_r X_(r r) = m_r^3 #scale(x: 120%, y: 120%)[\(] X_m Z_(m m) -
    Z_m X_(m m) #scale(x: 120%, y: 120%)[\)] . $
  This proves the other equality in Equation (4.17). It also gives
  #[#set math.equation(numbering: n => "(4.21)")
   $ X_m = frac(kappa R, m_r) > 0 . $ <model:Xm-positive>]
  Thus, at a zero, $sigma = X_(m m) \/ X_m$ is legitimate, even if $Z_m = 0$ or $w = 0$.
    The determinant identity then implies $Z_(m m) = sigma Z_m$. Using $X_(r r) = sigma_0 X_r$ at that point gives
  $ sigma m_r^2 = sigma_0 m_r - m_(r r) . $
  The chain rule for $gamma$ proves Equation (4.18).
  It remains to compute $gamma_(m m) - sigma gamma_m$. For a function $f$ smooth near $m$ and $- n$, write
  $ T_f = frac(ell f \( m \) + f \( - n \), 1 + ell) \, wide a_0 = frac(ell, 1 + ell) \, wide beta =
    frac(w, 1 + ell) \, wide rho = \( log a_0 \)_m - sigma . $
  A first differentiation gives
  $ \( T_f \)_m = a_0 { f' \( m \) - f' \( - n \) + beta \[ f \( m \) - f \( - n \) \] } . $
  A second differentiation therefore gives
  #[#set math.equation(numbering: n => "(4.22)")
   $ frac(\( T_f \)_(m m) - sigma \( T_f \)_m, a_0) =  & f'' \( m \) + ell f'' \( - n \) + beta { f' \( m \) +
     ell f' \( - n \) }\
 & + rho { f' \( m \) - f' \( - n \) } + \( beta_m + rho beta \) { f \( m \) -
   f \( - n \) } . $ <model:weighted-operator>]
  At the zero under consideration, this expression vanishes for $f \( x \) = x$ and $f \( x \) = 1 \/ x$,
    since $T_x = Z$ and $T_(1 \/ x) = X$. Consequently
  #[#set math.equation(numbering: n => "(4.23)")
   $ beta_m + rho beta & = - frac(beta \( 1 + ell \), m + n) \,\
rho B & = frac(2 ell, n^3) - 2 / m^3 + beta (1 / m^2 + ell / n^2 + frac(1 + ell, m n)) . $ <model:rho-relations>]
  Here $B eq.not 0$ because $m eq.not n$; no division by $beta$ is made.
  For $f \( x \) = 1 \/ x^2$, Equation (4.22) becomes
  #[#set math.equation(numbering: n => "(4.24)")
   $ frac(gamma_(m m) - sigma gamma_m, a_0) =  & 6 / m^4 + frac(6 ell, n^4) +
     beta (- 2 / m^3 + frac(2 ell, n^3)) - 2 rho (1 / m^3 + 1 / n^3) +
     frac(beta \( 1 + ell \) B, m + n) . $ <model:gamma-intermediate>]
  Eliminate $rho$ using Equation (4.23). The resulting constant coefficient and coefficient of $beta$ are, respectively,
  #[#set math.equation(numbering: n => "(4.25)")
   $ A_0 =  & 6 / m^4 + frac(6 ell, n^4) - frac(2 \( 1 \/ m^3 + 1 \/ n^3 \) \( 2 ell \/ n^3 - 2 \/ m^3 \), B) =
     frac(2 \( m + n \) N, m^4 n^4 \( m - n \)) \,\
A_beta =  & - 2 / m^3 + frac(2 ell, n^3) -
  frac(2 \( 1 \/ m^3 + 1 \/ n^3 \) \( 1 \/ m^2 + ell \/ n^2 + \( 1 + ell \) \/ \( m n \) \), B) +
  frac(\( 1 + ell \) B, m + n)\
=  & - frac(\( 1 + ell \) \( m + n \)^2, m^2 n^2 \( m - n \)) \,\
N =  & ell m^4 - 2 ell m^3 n + 2 m n^3 - n^4 . $ <model:gamma-coefficients>]
  For completeness, the two numerator reductions in Equation (4.25) are
  $ & 6 \( n^4 + ell m^4 \) \( m^2 - n^2 \) - 4 \( m^3 + n^3 \) \( ell m^3 - n^3 \) = 2 \( m + n \)^2 N \,\
 & \( m + n \) #scale(x: 120%, y: 120%)[\[] 2 \( ell m^3 - n^3 \) \( m - n \) -
   2 \( m^3 + n^3 \) \( ell m + n \) + \( 1 + ell \) m n \( m - n \)^2 #scale(x: 120%, y: 120%)[\]]\
 & #h(35mm)  = - \( 1 + ell \) m n \( m + n \)^3 . $
  They correspond to the common denominators $m^4 n^4 \( m^2 - n^2 \)$ and $m^3 n^3 \( m^2 - n^2 \)$.
    Substituting $beta = w \/ \( 1 + ell \)$ into $A_0 + beta A_beta$ now gives
  $ frac(\( m + n \)^2, m^2 n^2) frac(w_(*) - w, m - n) . $
  Multiplication by $a_0$ proves Equation (4.18). ◻
]

=== 4.3 Riccati equations, a common endpoint label, and an estimate <riccati-equations-a-common-endpoint-label-and-an-estimate>

The algebra has reduced the desired sign at a possible zero to the ordering of $w$ and $w_(*)$.
  To establish that ordering we now use the differential equation of the actual quadratic arc.
  Its Riccati linearization gives a common projective label for the two endpoints;
  the classical Schwarzian ratio identity and chain rule [13] then determine the endpoint Schwarzian.
  The next lemma derives these relations and the additional integral estimate used in the sign argument.

#thm([Lemma 4.3.])[
  #emph[For the quadratic profile $d u + b u^2$, with $b > 0$, one has
#[#set math.equation(numbering: n => "(4.26)")
 $ cal(S) = 2 b \( m + n ell^2 \) + d^2 / 2 \( ell^2 - 1 \) - d (1 / m + ell^2 / n) + 3 /
   2 (ell^2 / n^2 - 1 / m^2) . $ <model:Schwarzian-formula>]

 The arc admits a positive function $V$ such that
#[#set math.equation(numbering: n => "(4.27)")
 $ ell & = frac(m V \( - m \)^2, n V \( n \)^2) \,\
w & = 1 / m - ell / n + d \( 1 + ell \) + 2 b m V \( - m \)^2 integral_(- m)^n V \( y \)^(- 2) thin d y .
  $ <model:variation-formulas>]

 If $d < 0$ and $d^2 gt.eq 4 b m$, put $nu = \( d^2 \/ 4 - b m \)^(1 \/ 2)$. Then
#[#set math.equation(numbering: n => "(4.28)")
 $ w lt.eq 1 / m - ell / n + d ell - 2 nu . $ <model:Riccati-bound>]

 This includes $nu = 0$.]
] <model:Riccati>

#proof[
  The arc equation is $u_y = d u + b u^2 - y$. On its finite interval $\[ - m \, n \]$, define
  #[#set math.equation(numbering: n => "(4.29)")
   $ V \( y \) = exp [- integral_(- m)^y \( b u \( s \) + d \/ 2 \) thin d s] > 0 \, wide U \( y \) =
     u \( y \) V \( y \) . $ <model:positive-V>]
  The integral is finite because the actual arc is bounded on a compact interval.
    In the following system, primes denote derivatives with respect to $y$.
    Direct differentiation gives the regular linear system
  #[#set math.equation(numbering: n => "(4.30)")
   $ U' = d / 2 U - y V \, wide V' = - b U - d / 2 V . $ <model:linear-system>]
  In particular $U \( - m \) = U \( n \) = 0$. Eliminating $V$ where $y eq.not 0$ gives
  #[#set math.equation(numbering: n => "(4.31)")
   $ U'' = U' / y + (b y + d^2 / 4 - frac(d, 2 y)) U . $ <model:scalar-U>]
  We now justify the use of one projective solution label at both endpoints despite the singularity of
    Equation (4.31) at zero. Take $\( U_1 \, V_1 \) = \( U \, V \)$ from Equation (4.29),
    and complete it to a fundamental pair $\( U_1 \, V_1 \) \, \( U_2 \, V_2 \)$ of the regular system in
    Equation (4.30). Its coefficient matrix has trace zero, so
  $ Omega = U_1 V_2 - U_2 V_1 $
  is a nonzero constant. At either endpoint, $U_1 = 0$ and $V_1 > 0$; hence $U_2 = - Omega \/ V_1 eq.not 0$.
    Therefore the same ratio $f = U_1 \/ U_2$ is finite near both endpoints, and
  #[#set math.equation(numbering: n => "(4.32)")
   $ f \( - m \) = f \( n \) = 0 \, wide f' \( y \) = frac(y Omega, U_2 \( y \)^2) eq.not 0 quad
     upright("at ") y = - m \, n . $ <model:common-label>]
  A nearby arc has coefficients that can be normalized as $\( 1 \, - q \)$ in this fixed fundamental pair:
    continuous dependence keeps its first coefficient nonzero near the original arc.
    Its endpoint condition is $U_1 - q U_2 = 0$. Thus the nearby endpoint functions satisfy the same local
    identity $f \( n \( m \) \) = f \( - m \)$. No scalar solution is continued through the singular equation at
    zero. The scalar determinant $U'_1 U_2 - U_1 U'_2 = y Omega$ is nonzero in each endpoint neighborhood,
    so $U_1 \, U_2$ form a scalar basis in each such neighborhood.
  Writing $U = sqrt(\| y \|) thin tilde(U)$ in Equation (4.31) gives
  $ tilde(U)'' = (b y + d^2 / 4 - frac(d, 2 y) + frac(3, 4 y^2)) tilde(U) . $
  For two solutions of $a'' = Q_0 a$, $c'' = Q_0 c$, their ratio has Schwarzian $- 2 Q_0$:
    locally, $\( a \/ c \)'' \/ \( a \/ c \)' = - 2 c' \/ c$,
    and differentiating this expression and subtracting half its square gives $- 2 c'' \/ c$.
    The ratio is unchanged by division of both solutions by $sqrt(\| y \|)$. Consequently
  $ { f \, y } = - 2 b y - d^2 / 2 + d / y - frac(3, 2 y^2) \, wide { f \, y } = f''' / f' - 3 / 2 (f'' / f')^2 . $
  Apply the Schwarzian chain rule to the common-label identity $f \( n \( m \) \) = f \( - m \)$.
    The affine map $m mapsto - m$ has zero Schwarzian and squared derivative one, so
  $ cal(S) = { f \, y } \|_(y = - m) - ell^2 { f \, y } \|_(y = n) . $
  Expanding these two evaluations proves Equation (4.26).
  For Equation (4.27), vary the initial endpoint in $u \( - m \; m \) = 0$.
    Since $u_y \( - m \) = m$, the initial variation is $u_m \( - m \) = m$. Its scalar variational equation yields
  $ u_m \( y \) = m exp [integral_(- m)^y \( d + 2 b u \( s \) \) thin d s] =
    m thin frac(V \( - m \)^2, V \( y \)^2) . $
  Differentiating $u \( n \( m \) \; m \) = 0$, and using $u_y \( n \) = - n$, gives the formula for $ell$.
    Its logarithm can be written
  $ log ell = log m - log n + integral_(- m)^n \( d + 2 b u \( y \) \) thin d y . $
  Differentiate in $m$. The two boundary contributions from $2 b u$ vanish,
    while the constant term contributes $d \( 1 + ell \)$. Substituting the expression for $u_m$ proves the
    formula for $w$.
  Finally, differentiating the second equation in Equation (4.30) gives
  $ V'' = \( b y + d^2 \/ 4 \) V \, wide V' \( - m \) = - d V \( - m \) \/ 2 . $
  Suppose $d < 0$, $d^2 gt.eq 4 b m$, and set $s = y + m$. For $v_0 \( s \) = V \( - m + s \) \/ V \( - m \)$ one has
  $ v''_0 = \( nu^2 + b s \) v_0 \, wide v_0 \( 0 \) = 1 \, wide v'_0 \( 0 \) = - d \/ 2 . $
  Let
  $ f_nu \( s \) =
    cases(delim: "{", cosh \( nu s \) - frac(d, 2 nu) sinh \( nu s \) \, & nu > 0 \,, 1 - d s \/ 2 \, & nu = 0 .) $
  Variation of constants gives, for $0 lt.eq s lt.eq m + n$,
  $ v_0 \( s \) - f_nu \( s \) = b integral_0^s K_nu \( s - t \) thin t thin v_0 \( t \) thin d t gt.eq 0 \, wide
    K_nu \( t \) = cases(delim: "{", sinh \( nu t \) \/ nu \, & nu > 0 \,, t \, & nu = 0 .) $
  The inequality follows from the already constructed positivity of $v_0$, and from $K_nu gt.eq 0$.
    Also $f_nu > 0$ on the positive half-line because $d < 0$. Therefore
  #[#set math.equation(numbering: n => "(4.33)")
   $ V \( - m \)^2 integral_(- m)^n V \( y \)^(- 2) thin d y lt.eq integral_0^oo f_nu \( s \)^(- 2) thin d s =
     frac(1, nu - d \/ 2) . $ <model:inverse-square-bound>]
  For $nu > 0$, the substitution $q = tanh \( nu s \)$, with $A = - d \/ \( 2 nu \) > 0$, evaluates the last integral as
  $ 1 / nu integral_0^1 \( 1 + A q \)^(- 2) thin d q = frac(1, nu \( 1 + A \)) . $
  For $nu = 0$, direct integration of $\( 1 - d s \/ 2 \)^(- 2)$ gives $- 2 \/ d$, the same formula.
    Since $nu^2 = d^2 \/ 4 - b m$,
  $ frac(2 b m, nu - d \/ 2) = - d - 2 nu . $
  Substitution into Equation (4.27) proves Equation (4.28). ◻
]

=== 4.4 The signs at a possible zero <the-signs-at-a-possible-zero>

#thm([Lemma 4.4.])[
  #emph[If $kappa > 0$ and $cal(W) = 0$, then $gamma_(r r) - sigma_0 gamma_r > 0$,
    with $sigma_0$ defined in Equation (4.10).]
] <model:zero-sign>

#proof[
  We partition the possibilities for $m \, n \, ell$. The quantities $theta = "arctanh" \( H \/ r \)$ and $L =
    "arctanh" \( H_r \)$, and the finite-peak reference characteristics used below, are those of Lemma 8.
  ===== 4.4.1 Case 1: $m lt.eq n$. <case-1-mle-n.>
  The final angle is nonnegative. Along the characteristic leading to this data point, the driving slope satisfies
  $ j' = - s kappa "sech"^2 theta < 0 . $
  Its initial value $z$ must be positive. Indeed, if $z lt.eq 0$, then $j \( s \) < 0$ for every $s > 0$,
    and $theta' + a \( s \) theta = j \( s \)$, where $a \( s \) = sinh \( 2 theta \) \/ \( s theta \) > 0$,
    with value $2 \/ s$ at $theta = 0$, forces $theta \( s \) < 0$.
    This last assertion follows by integrating from a positive $epsilon$ and letting $epsilon arrow.b 0$:
    $theta \( epsilon \) arrow.r 0$, and the forward homogeneous factor is at most one.
    It would contradict the nonnegative final angle.
  Since $z > 0$, $theta \( s \) = z s \/ 3 + O \( s^2 \) > 0$ initially.
    If it first reached zero at some earlier width $s_1 < r$, then $j \( s_1 \) = theta' \( s_1 \) lt.eq 0$.
    The strict decrease of $j$ would give $j \( s \) < 0$ thereafter, forcing $theta \( s \) < 0$ for $s > s_1$.
    Again this contradicts the final angle. Thus $theta \( s \) > 0$ for all $0 < s < r$, and
  $ L \( r \) = integral_0^r frac(sinh \( 2 theta \( s \) \), s) thin d s > 0 \, wide ell = e^(2 L) > 1 . $
  We also need the sign of $w = \( log ell \)_m$, where the derivative is taken along the fixed-profile family at
    base zero. Let $t = t \( r \)$ be the peak height of that profile.
    Lemma 2 gives $t_r > 0$, and its peak slope is $z = d + kappa t$.
    The final model value $L = "arctanh" H_r$ equals $cal(L)_kappa \( r \, z \( r \) \)$,
    and Lemma 8 gives $partial_z cal(L)_kappa > 0$. Consequently
  #[#set math.equation(numbering: n => "(4.34)")
   $ L_r \|_(d \, kappa) = frac(sinh \( 2 theta \), r) + kappa t_r partial_z cal(L)_kappa \( r \, z \) > 0 \, wide
     w = frac(2 L_r \|_(d \, kappa), m_r) > 0 . $ <model:w-positive-nonnegative-angle>]
  If $m = n$, Equation (4.16) now reduces to
  $ D_(*) = \( ell - 1 \) w + m w^2 > 0 . $
  Hence a zero of $cal(W)$ cannot have $m = n$.
  If $m < n$, put $z_1 = m \/ n in \( 0 \, 1 \)$. The sign of $w_(*)$ is the sign of
  $ ell z_1^3 \( z_1 - 2 \) + 2 z_1 - 1 lt.eq z_1^3 \( z_1 - 2 \) + 2 z_1 - 1 = \( z_1 - 1 \)^3 \( z_1 + 1 \) < 0 . $
  Since $w > 0$, the quotient $\( w_(*) - w \) \/ \( m - n \)$ is positive.
    Equations (4.18) and (4.18) prove the required sign.
  ===== 4.4.2 Case 2: $m > n$ and $ell gt.eq 1$. <case-2-mn-and-ellge1.>
  Here the final angle is negative, which forces $d < 0$. In fact,
    if its final driving slope $d$ were nonnegative, then the strictly decreasing driving slope would be positive
    at all earlier widths, and the same scalar angle equation would give a positive final angle.
  Each group in Equation (4.26) is now nonnegative, and several are strictly positive. In particular
  #[#set math.equation(numbering: n => "(4.35)")
   $ cal(S) > 0 quad upright("whenever ") m > n \, med ell gt.eq 1 . $ <model:S-positive-ell-large>]
  We justify $w gt.eq 0$ on this region without assuming that $m$ ranges to infinity.
  For the fixed quadratic profile, Lemma 2 gives arcs at all widths $r in \( 0 \, oo \)$.
    Since $m_r > 0$ and $0 < m \( r \) < 2 r$, the $m$-domain is an interval $\( 0 \, M_(*) \)$,
    with $M_(*)$ finite or infinite. At its left end,
  $ ell = 1 + 4 / 3 d r + O \( r^2 \) < 1 $
  because $d < 0$. Fix a point in the open set ${ m - n > 0 \, ell > 1 }$,
    and let $\( a \, c \)$ be its connected component. The expansion just given implies $a > 0$; also $a < M_(*)$,
    since the chosen point is to its right. Thus $a$ is an interior point of the smooth parameter domain.
    On the component, $\( m - n \)_m = 1 - ell < 0$. Moving backwards to $a$ therefore increases $m - n$,
    so its value at $a$ is strictly positive. The component cannot enter through $m = n$.
    It must have $ell \( a \) = 1$, and the right derivative there satisfies $ell_m \( a \) gt.eq 0$,
    or $w \( a \) gt.eq 0$. Equations (4.13) and (4.35) give $w_m > 0$ throughout the component.
    Hence $w > 0$ inside it.
  At a point with $m > n \, ell = 1 \, w < 0$, points immediately to the left would have $ell > 1 \, w < 0$,
    contrary to the result just proved. A point with $m > n \, ell = 1 \, w = 0$ is also impossible:
    there $w_m = cal(S) > 0$ and $ell_(m m) = ell \( w_m + w^2 \) = cal(S) > 0$.
    Immediately to the left one would again have $ell > 1 \, w < 0$.
    Thus $w gt.eq 0$ at every point required in this case. The component argument applies to each chosen component
    separately; it makes no assumption about their number.
  Writing $z_1 = m \/ n > 1$, the coefficient of $w$ in Equation (4.16) satisfies
  $ 1 - 2 / z_1 + ell \( 2 z_1 - 1 \) gt.eq 2 z_1 - 2 / z_1 > 0 . $
  Together with $\( m - n \) cal(S) > 0$ and $w gt.eq 0$, this gives $D_(*) > 0$.
    Hence no zero of $cal(W)$ occurs in this case.
  ===== 4.4.3 Case 3: $m > n$ and $0 < ell < 1$. <case-3-mn-and-0ell1.>
  Again $d < 0$. It suffices to prove that
  #[#set math.equation(numbering: n => "(4.36)")
   $ w gt.eq w_(*) quad arrow.r.double quad D_(*) > 0 . $ <model:last-case-target>]
  Indeed, at a zero this will give $w < w_(*)$, and the denominator $m - n$ in Equation (4.18) is positive.
  We may set $n = 1 \, m = z_1 > 1$ at the point. To specify this scaling, fix the original endpoint value $N =
    n > 0$ as a constant and put $y = N tilde(y)$, $u = N^2 tilde(u)$.
    The new model parameters are $tilde(d) = N d$, $tilde(b) = N^3 b$, while
  $ tilde(m) = m \/ N \, quad tilde(n) = n \/ N \, quad tilde(ell) = ell \, quad tilde(w) = N w \, quad
    tilde(cal(S)) = N^2 cal(S) \, quad tilde(D)_(*) = N D_(*) \, quad tilde(w)_(*) = N w_(*) . $
  Thus the equations and the signs needed for Equation (4.36) are preserved.
    We suppress the tildes and use $n = 1 \, m = z_1$ from now on.
  In these units,
  #[#set math.equation(numbering: n => "(4.37)")
   $ w_(*) = frac(2 \( ell z_1^3 \( z_1 - 2 \) + 2 z_1 - 1 \), z_1^2 \( z_1 + 1 \)) > 0 . $ <model:scaled-wstar>]
  For $z_1 gt.eq 2$ positivity is immediate. For $1 < z_1 < 2$,
    the coefficient of $ell$ in its numerator is negative; replacing $ell <
    1$ by one decreases that numerator to $\( z_1 - 1 \)^3 \( z_1 + 1 \) > 0$.
  For fixed $cal(S)$, write
  $ D_(*) = \( z_1 - 1 \) cal(S) + \[ 1 - 2 \/ z_1 + ell \( 2 z_1 - 1 \) \] w + frac(z_1 + 1, 2) w^2 . $
  The derivative of this expression in $w$, evaluated at $w_(*)$ and multiplied by $z_1^2$, is
  #[#set math.equation(numbering: n => "(4.38)")
   $ J \( ell \, z_1 \) = 2 ell z_1^4 - 2 ell z_1^3 - ell z_1^2 + z_1^2 + 2 z_1 - 2 . $ <model:J-polynomial>]
  This polynomial is affine in $ell$. With $xi = z_1 - 1 > 0$, its endpoint values are
  $ J \( 0 \, 1 + xi \) = xi^2 + 4 xi + 1 \, wide J \( 1 \, 1 + xi \) = 2 xi \( xi + 2 \) \( xi^2 + xi + 1 \) . $
  Both are strictly positive. Therefore $J > 0$ for $0 < ell < 1$.
    Since the derivative in $w$ increases with $w$, $D_(*)$ is strictly increasing for $w gt.eq w_(*)$.
  Set
  #[#set math.equation(numbering: n => "(4.39)")
   $ T = 2 ell z_1^3 - ell z_1^2 - z_1 + 2 \, wide A = 2 ell z_1^3 - 3 ell z_1^2 + 3 z_1 - 2 \, wide cal(S)_0 =
     3 / 2 \( ell^2 - z_1^(- 2) \) . $ <model:T-and-baseline>]
  Substitution of Equation (4.37) gives the two polynomial identities
  #[#set math.equation(numbering: n => "(4.40)")
   $ \( z_1 - 1 \) cal(S)_0 + \[ 1 - 2 \/ z_1 + ell \( 2 z_1 - 1 \) \] w_(*) + frac(z_1 + 1, 2) w_(*)^2 & =
     frac(z_1 - 1, 2 z_1^4) A T \,\
Delta_0 := 1 / z_1 - ell - w_(*) & = - frac(z_1 - 1, \( z_1 + 1 \) z_1^2) T . $ <model:baseline-factorization>]
  These factorizations can be checked by collecting powers of $ell$.
    For Equation (4.40), multiplying its left side by $2 z_1^4 \( z_1 + 1 \)$ gives
  $ \( z_1^2 - 1 \) #scale(x: 120%, y: 120%)[\[] ell^2 z_1^4 \( 2 z_1 - 3 \) \( 2 z_1 - 1 \) +
    4 ell z_1^2 \( z_1^2 - 1 \) + \( 3 z_1 - 2 \) \( 2 - z_1 \) #scale(x: 120%, y: 120%)[\]] . $
  The bracket is $A T$, because the cross coefficient in the product is
  $ z_1^2 #scale(x: 120%, y: 120%)[\[] \( 2 z_1 - 3 \) \( 2 - z_1 \) + \( 3 z_1 - 2 \) \( 2 z_1 - 1 \)
    #scale(x: 120%, y: 120%)[\]] = 4 z_1^2 \( z_1^2 - 1 \) . $
  For Equation (4.40), the numerator over $z_1^2 \( z_1 + 1 \)$ is
    $\( z_1 - 1 \) \[ z_1 - 2 - ell z_1^2 \( 2 z_1 - 1 \) \] = - \( z_1 - 1 \) T$.
    The sign of $A$ requires no further restriction on the parameters. It too is affine in $ell$, and
  $ A \( 0 \, 1 + xi \) = 3 xi + 1 \, wide A \( 1 \, 1 + xi \) = xi \( 2 xi^2 + 3 xi + 3 \) \, $
  so $A > 0$.
  Assume $w gt.eq w_(*)$. First suppose $T gt.eq 0$. If $d^2 gt.eq 4 b z_1$, Equation (4.28) would imply
  $ Delta_0 = 1 / z_1 - ell - w_(*) gt.eq 1 / z_1 - ell - w gt.eq - d ell + 2 nu > 2 nu gt.eq 0 . $
  This contradicts Equation (4.40). Consequently $d^2 < 4 b z_1$.
    In Equation (4.26), the difference from the baseline is
  #[#set math.equation(numbering: n => "(4.41)")
   $ cal(S) - cal(S)_0 = (2 b z_1 - d^2 / 2) + ell^2 (2 b + d^2 / 2 - d) - d / z_1 > 0 . $ <model:baseline-improvement>]
  Each term on the right is positive in this subcase. Equation (4.40) is nonnegative because $A > 0 \, T gt.eq 0$.
    Since $z_1 - 1 > 0$, the strict improvement in Equation (4.41), followed by monotonicity in $w$, gives $D_(*) > 0$.
  It remains to consider $T < 0$. Then
  $ z_1 - 2 > ell z_1^2 \( 2 z_1 - 1 \) > 0 . $
  In particular $z_1 > 2$, and the same inequality implies $z_1 - 2 > 3 ell$. Equation (4.14), with $kappa P > 0$, gives
  $ d < frac(ell \/ z_1 - 1, 1 + ell) \, wide - d z_1 > frac(z_1 - ell, 1 + ell) > 2 . $
  Rewrite Equation (4.26) as
  #[#set math.equation(numbering: n => "(4.42)")
   $ cal(S) = (2 b z_1 - d^2 / 2) + ell^2 (2 b + d^2 / 2 - d + 3 / 2) - d / z_1 -
     frac(3, 2 z_1^2) . $ <model:S-last-subcase>]
  If the first parentheses are nonnegative, then $- d \/ z_1 > 2 \/ z_1^2$ immediately gives $cal(S) > 0$.
    If they are negative, put $nu = \( d^2 \/ 4 - b z_1 \)^(1 \/ 2) > 0$.
    The preceding use of Equation (4.28) still gives $2 nu < Delta_0$, while $w_(*) > 0 \,
    ell > 0$ give $Delta_0 < 1 \/ z_1$. Hence
  $ 2 b z_1 - d^2 / 2 = - 2 nu^2 > - frac(1, 2 z_1^2) . $
  Together with $- d \/ z_1 > 2 \/ z_1^2$, this strictly dominates the negative term $-
    3 \/ \( 2 z_1^2 \)$ in Equation (4.42). Its remaining $ell^2$-term is positive, so again $cal(S) > 0$.
    Since $z_1 > 2$, the coefficient $1 - 2 \/ z_1 + ell \( 2 z_1 - 1 \)$ is positive, and $w gt.eq w_(*) > 0$.
    Therefore every term in $D_(*)$ is positive. This proves Equation (4.36) also when $T < 0$.
  The three cases cover all endpoint configurations. At a zero of $cal(W)$,
    Cases 1 and 3 give $\( w_(*) - w \) \/ \( m - n \) > 0$, and the excluded diagonal and Case 2 contain no
    zeros. Equations (4.18) and (4.18) finish the proof. ◻
]

=== 4.5 Completion of the characteristic argument <completion-of-the-characteristic-argument>

#proof[
  First suppose $kappa > 0$. Fix any model data point $\( lambda \, kappa \, r \)$.
    By the arc construction and Lemma 8, it belongs to a characteristic coming from a finite peak.
    Along that characteristic, use $s$ for outward-increasing width.
    The base slope tends to a finite peak slope as $s arrow.b 0$,
    so the uniform expansion in Equation (4.9) makes $cal(W)$ strictly positive for all sufficiently small positive $s$.
  On this curve $kappa$ is constant and $d lambda \/ d s = - kappa \/ alpha$. Thus the total outward derivative is
  #[#set math.equation(numbering: n => "(4.43)")
   $ frac(d, d s) cal(W) \( lambda \( s \) \, kappa \, s \) = cal(W)_r - kappa / alpha cal(W)_lambda = - 1 /
     alpha thin cal(D) cal(W) . $ <model:outward-orientation>]
  At any zero, Equations (4.7) and (4.10), and Lemma 18, give
  $ cal(D) cal(W) = - G \( gamma_(r r) - sigma_0 gamma_r \) < 0 . $
  Since $alpha > 0$, Equation (4.43) makes the outward derivative strictly positive.
    A first zero reached from strictly positive values would instead have a nonpositive outward derivative.
    This contradiction proves $cal(W) > 0$ at every point with $kappa > 0$.
  Reflection of the endpoint coordinate gives
  $ H \( - lambda \, - kappa \, r \) = - H \( lambda \, kappa \, r \) . $
  Differentiating this symmetry shows that $P \, Q$, their $r$-derivatives,
    and $cal(W)$ are unchanged by simultaneous sign reversal of $lambda \, kappa$.
    Thus $cal(W) > 0$ also when $kappa < 0$. Smooth dependence of the model on finite parameters at every $r >
    0$ now gives $cal(W) gt.eq 0$ at $kappa = 0$. Only this non-strict conclusion at zero curvature is required.
    Locally the passage is uniform on compact parameter sets with $r > 0$;
    $G > 0$ there is already known from Theorem 13.
  Finally, apply the pointwise fixed-parameter identity Equation (4.3).
    It gives $\( R \/ G \)_r lt.eq 0$ for every $lambda \, kappa \, r$, as asserted.
    The characteristic transport established the sign of a scalar function on the whole model domain;
    it did not identify its partial $r$-derivative with a total derivative along a characteristic. ◻
]

== 5 Shape conditions and fitted parameters <sec:transport>

We use the fitted functions $lambda \( h \, r \) \, kappa \( h \, r \)$ defined in Equation (3.26) for a smooth
  profile $phi.alt$, and retain $k = phi.alt'$, $D = partial_h -
  alpha partial_r$ and the model derivatives evaluated at the fit. We will prove two comparisons:
  the sign of $phi.alt'''$ controls the width derivative of fitted curvature,
  while the sign of $\( \( phi.alt' - d \) \/ u \)'$, for a fixed real $d$,
  controls the fitted slope intercept $lambda - h kappa$. These are the shape conditions used in Section 6.
  The transport law is already available from Lemma 14; its evolution starts from the small-width data established next.

#thm([Lemma 5.1.])[
  (The small-width fit).  #emph[At each positive height, locally uniformly in that height as $r$ tends to zero,
#[#set math.equation(numbering: n => "(5.1)")
 $ kappa \( h \, r \) & = phi.alt'' \( h \) + 2 / 7 phi.alt''' \( h \) r^2 + O \( r^3 \) \,\
kappa_r \( h \, r \) & = 4 / 7 phi.alt''' \( h \) r + O \( r^2 \) \,\
lambda \( h \, r \) & = k \( h \) - 1 / 35 phi.alt''' \( h \) r^4 + O \( r^5 \) . $ <eq:fit-small-width>]

 More precisely, for every $h_0 > 0$ there are smooth functions $A$ and $B$ on a neighborhood of $\( h_0 \, 0 \)$
   for which, at positive $r$ in that neighborhood,
#[#set math.equation(numbering: n => "(5.2)")
 $ lambda \( h \, r \) & = k \( h \) - 1 / 35 phi.alt''' \( h \) r^4 + r^5 A \( h \, r \) \,\
kappa \( h \, r \) & = phi.alt'' \( h \) + 2 / 7 phi.alt''' \( h \) r^2 +
  r^3 B \( h \, r \) . $ <eq:fit-smooth-remainders>]

 Thus the derivative estimate in Equation (5.1) comes from a smooth remainder.]
] <lem:fit-small-width>

#proof[
  Fix $h_0 > 0$. Use the smooth width-one profile family $g \( h \, rho \, s \)$ of Equation (2.11),
    with signed auxiliary parameter $rho$ near zero and $h$ near $h_0$.
    Lemma 4 provides smooth endpoint data at scaled width one for this family and for the finite-parameter
    perturbations below. In particular, the local implicit inversion that fixes the width is performed near the
    same transverse parabolic arc.
  For a scaled profile $psi$, let $cal(A) \( psi \)$ denote the pair consisting of its midpoint and its midpoint
    derivative with respect to scaled width, evaluated at base height $0$ and width $1$.
    Only the smooth finite-parameter families of profiles just described are used in this notation.
    For the quadratic profile $psi \( s \) = a_1 s + a_2 s^2 \/ 2$,
    the derivative of this pair at $\( a_1 \, a_2 \) = \( 0 \, 0 \)$ is, by Equation (2.9),
  $ J = mat(delim: "(", 1 \/ 3, 1 \/ 15; 2 \/ 3, 4 \/ 15) . $
  It is nonsingular. The cubic profile variation $s^3 \/ 6$ gives the column
  $ b = binom(1 \/ 105, 6 \/ 105) \, wide J^(- 1) b = binom(- 1 \/ 35, 2 \/ 7) . $
  Taylor expansion of Equation (2.11), with a smooth remainder on the fixed scaled-height interval, gives
  #[#set math.equation(numbering: n => "(5.3)")
   $ g \( h \, rho \, s \) = rho k \( h \) s + rho^3 phi.alt'' \( h \) s^2 / 2 + rho^5 phi.alt''' \( h \) s^3 /
     6 + rho^7 cal(R) \( h \, rho \, s \) \, $ <eq:fit-scaled-taylor>]
  where $cal(R)$ is smooth. Write
  $ g_2 \( h \, rho \, s \) = rho k \( h \) s + rho^3 phi.alt'' \( h \) s^2 / 2 \, wide eta \( h \, rho \, s \) =
    phi.alt''' \( h \) s^3 / 6 + rho^2 cal(R) \( h \, rho \, s \) . $
  Then $g = g_2 + rho^5 eta$. Apply the local inverse defined by $J$ to the data of the smooth family $g_2 +
    epsilon eta$, with $\( h \, rho \, epsilon \)$ near $\( h_0 \, 0 \, 0 \)$.
    Denote its fitted scaled coefficients by $a_1 \( h \, rho \, epsilon \)$ and $a_2 \( h \, rho \, epsilon \)$.
    At $epsilon = 0$ these are exactly $rho k \( h \)$ and $rho^3 phi.alt'' \( h \)$, respectively.
    The integral form of Taylor’s formula in $epsilon$ shows that
  $ binom(a_1 \( h \, rho \, rho^5 \) - rho k \( h \), a_2 \( h \, rho \, rho^5 \) - rho^3 phi.alt'' \( h \)) =
    rho^5 q \( h \, rho \) $
  for a smooth vector-valued function $q$. Differentiating at $rho = epsilon =
    0$ in the profile-variation direction yields
  $ q \( h \, 0 \) = phi.alt''' \( h \) J^(- 1) b = phi.alt''' \( h \) binom(- 1 \/ 35, 2 \/ 7) . $
  Another smooth Taylor factorization in $rho$ therefore writes
  $ q \( h \, rho \) = phi.alt''' \( h \) binom(- 1 \/ 35, 2 \/ 7) + rho binom(A \( h \, rho \), B \( h \, rho \)) . $
  For $rho = r > 0$, the scaled actual data are $\( M \( h \, r \) \/ r \, v \( h \, r \) \)$.
    Scaling the quadratic fit in Equation (3.26) gives scaled coefficients $\( r lambda \, r^3 kappa \)$.
    Uniqueness in Theorem 13 identifies them with the local coefficients just constructed.
    Dividing the two corrections by $r$ and $r^3$, respectively, proves Equation (5.2).
    Differentiating its second identity at fixed $h$ gives
  $ kappa_r \( h \, r \) = 4 / 7 phi.alt''' \( h \) r + 3 r^2 B \( h \, r \) + r^3 B_r \( h \, r \) . $
  This proves all the locally uniform estimates in Equation (5.1). ◻
]

#thm([Proposition 5.2.])[
  (A strict third derivative).  #emph[If $phi.alt''' \( u \) > 0$ for every $u > 0$, then, for every $h \, r > 0$,
$ lambda \( h \, r \) < k \( h \) \, wide kappa_r \( h \, r \) > 0 . $

 If $phi.alt''' \( u \) < 0$ for every $u > 0$, both inequalities reverse:
$ lambda \( h \, r \) > k \( h \) \, wide kappa_r \( h \, r \) < 0 . $

]
] <prop:third-derivative>

#proof[
  Assume first that $phi.alt''' > 0$. Fix a fitted arc with base height $h$ and width $r$,
    and let its peak height be $t$. Parametrize its characteristic by outward width $s in \( 0 \, r \]$,
    writing the base height as $h \( s \)$, with $h \( r \) = h$ and $h \( s \) arrow.r t$ as $s arrow.b 0$. Put
  $ theta \( s \) = "arctanh" frac(M \( h \( s \) \, s \), s) \, wide L \( s \) =
    "arctanh" v \( h \( s \) \, s \) \, wide c \( s \) = phi.alt'' \( h \( s \) \) . $
  The characteristic equations in Equation (2.6) give
  #[#set math.equation(numbering: n => "(5.4)")
   $ c' \( s \) = - s "sech"^2 theta \( s \) thin phi.alt''' \( h \( s \) \) < 0 wide \( s > 0 \) .
     $ <eq:actual-curvature-decrease>]
  In particular $c$ extends continuously to $s = 0$ with $c \( 0 \) =
    phi.alt'' \( t \)$ and is strictly decreasing on $\[ 0 \, r \]$.
  In the following comparison, hold the curvature equal to the final fitted value $kappa = kappa \( h \, r \)$.
    Let $J_kappa$ and $Theta_kappa \( s \, z \)$ be the slope field and the reference angle family of Section 3. Define
  $ E \( s \) = k \( h \( s \) \) - J_kappa \( s \, theta \( s \) \) \, wide
    a \( s \) = \( J_kappa \)_theta \( s \, theta \( s \) \) > 0 \, $
  and
  $ f \( s \) = - s "sech"^2 theta \( s \) thin \( c \( s \) - kappa \) . $
  Lemma 9, specifically Equation (3.11), gives
  #[#set math.equation(numbering: n => "(5.5)")
   $ E' \( s \) + a \( s \) E \( s \) = f \( s \) \, wide lim_(s arrow.b 0) E \( s \) =
     0 . $ <eq:third-derivative-error>]
  The integral formula in Equation (3.12) applies with this forcing $f$.
    Its positive kernel preserves the sign of $f$, even though $a$ may be singular at the peak.
  The strict decrease of $c$ gives the following exhaustive sign cases.
    If $kappa gt.eq c \( 0 \)$, then $f \( s \) > 0$ for every $s > 0$, and Equation (3.12) gives $E \( s \) > 0$.
    If $kappa lt.eq c \( r \)$, then $f \( s \) < 0$ for $0 < s < r$, and $E \( s \) < 0$ for $0 < s lt.eq r$.
    In the remaining case there is a unique $s_0 in \( 0 \, r \)$ with $c \( s_0 \) = kappa$.
    Here $f < 0$ before $s_0$ and $f > 0$ after it. The same integral formula gives $E < 0$ on $\( 0 \, s_0 \]$, whereas
  $ frac(d, d s) [E \( s \) exp (integral_(s_0)^s a \( q \) thin d q)] =
    f \( s \) exp (integral_(s_0)^s a \( q \) thin d q) > 0 wide \( s > s_0 \) . $
  Consequently $E$ either remains negative up to the final width, possibly having $E \( r \) = 0$,
    or crosses zero exactly once before $r$ and is strictly positive thereafter.
    It cannot vanish on a nontrivial interval: Equation (5.5) would then force $c = kappa$ on that interval,
    contrary to Equation (5.4).
  Let $z \( s \)$ be the reference label determined by
  $ theta \( s \) = Theta_kappa \( s \, z \( s \) \) . $
  By Equation (3.11),
  $ z' \( s \) = frac(E \( s \), partial_z Theta_kappa \( s \, z \( s \) \)) \, wide
    partial_z Theta_kappa \( s \, z \) > 0 . $
  The constant label $z_(*) = z \( r \)$ describes the quadratic reference whose final angle agrees with the
    actual one. Its final slope is $lambda \( h \, r \)$, by the construction of the fit.
    The fit also makes the final values of $v$, and hence of $L$, equal. Therefore Equation (2.6) gives
  #[#set math.equation(numbering: n => "(5.6)")
   $ integral_0^r frac(sinh \( 2 theta \( s \) \), s) thin d s =
     integral_0^r frac(sinh \( 2 Theta_kappa \( s \, z_(*) \) \), s) thin d s . $ <eq:matched-angle-integrals>]
  Both integrals converge: the two angles are $O \( s \)$ near their smooth peaks.
  If $z \( s \)$ were monotone and nonconstant on $\( 0 \, r \]$,
    monotonicity of $Theta_kappa$ in its label would order the two integrands in Equation (5.6) in one direction,
    with strict inequality on a nonempty open subinterval. This contradicts their equal integrals.
    The first two sign cases above therefore cannot occur. In the two-sign forcing case,
    $E$ must cross zero strictly before $r$: otherwise $z$ is strictly decreasing on $\( 0 \, r \)$,
    even if $E \( r \) = 0$, giving the same contradiction. A constant label is also impossible,
    since it would give $E equiv 0$ and hence constant $c$. It follows that
  #[#set math.equation(numbering: n => "(5.7)")
   $ E \( r \) = k \( h \) - lambda \( h \, r \) > 0 . $ <eq:fitted-slope-strict>]
  It remains to propagate the sign of the width derivative of fitted curvature.
    As a function of independent model parameters, set
  $ C \( lambda \, kappa \, r \) = frac(R \( lambda \, kappa \, r \), G \( lambda \, kappa \, r \)) . $
  Theorem 15 asserts that its explicit partial derivative satisfies $C_r lt.eq
    0$ when $lambda$ and $kappa$ are held fixed. Differentiating the second identity in Equation (3.27) at fixed
    $h$, we must also account for
  $ partial_r \( D kappa \) = D \( kappa_r \) - alpha_r kappa_r . $
  Using $lambda_r = - Q kappa_r \/ P$ gives
  #[#set math.equation(numbering: n => "(5.8)")
   $ D \( kappa_r \) = cal(T) \( h \, r \) kappa_r - C_r \( lambda \, kappa \, r \) \( lambda - k \( h \) \) \,
     $ <eq:curvature-derivative-transport>]
  where
  #[#set math.equation(numbering: n => "(5.9)")
   $ cal(T) = alpha_r + frac(C Q, P) - (C_kappa - Q / P C_lambda) \( lambda - k \( h \) \) .
     $ <eq:curvature-derivative-coefficient>]
  Here $alpha_r$ is the derivative of the actual function $alpha \( h \, r \)$, whereas $C_lambda \, C_kappa \,
    C_r$ are model partial derivatives evaluated at the fit. All terms in $cal(T)$ are smooth at positive height
    and width. The dependence of $alpha$ on $M$ is thus included in the coefficient of $kappa_r$;
    it creates no additional independent source.
  On the fixed characteristic, write $w \( s \) = kappa_r \( h \( s \) \, s \)$.
    Equation (5.1), locally uniformly near its peak $t$, gives
  $ w \( s \) = 4 / 7 phi.alt''' \( h \( s \) \) s + O \( s^2 \) > 0 $
  for all sufficiently small positive $s$. Equations (5.7) and (5.8) give, along the characteristic,
  $ w' \( s \) = - cal(T) / alpha w \( s \) + C_r / alpha \( lambda - k \) \, wide C_r /
    alpha \( lambda - k \) gt.eq 0 . $
  Choose a sufficiently small positive $s_1$ with $w \( s_1 \) > 0$.
    On $\[ s_1 \, r \]$ all coefficients are continuous. Multiplication by the positive integrating factor
  $ mu \( s \) = exp (integral_(s_1)^s cal(T) / alpha thin d q) $
  gives $\( mu w \)' gt.eq 0$. Thus $w \( r \) > 0$, proving $kappa_r \( h \, r \) > 0$.
    Since the chosen fit was arbitrary, both assertions hold for every $h \, r > 0$.
  Finally, reflection of the endpoint coordinate changes $phi.alt$ to $-
    phi.alt$ and changes $\( M \, v \)$ to $\( - M \, - v \)$.
    Uniqueness of the quadratic fit changes $\( lambda \, kappa \)$ to $\( - lambda \, - kappa \)$.
    Applying the proved case to $- phi.alt$ proves the two reversed inequalities when $phi.alt''' < 0$. ◻
]

#thm([Proposition 5.3.])[
  (The fitted slope intercept).  #emph[Let $d in bb(R)$. If
$ frac(d, d u) (frac(k \( u \) - d, u)) > 0 wide upright("for every ") u > 0 \, $

 then
$ lambda \( h \, r \) - h kappa \( h \, r \) < d wide upright("for every ") h \, r > 0 . $

 If the displayed derivative is strictly negative everywhere, then $lambda \( h \, r \) -
   h kappa \( h \, r \) > d$ everywhere.]
] <prop:intercept>

#proof[
  Assume the displayed derivative is positive and set
  $ I \( h \, r \) = lambda \( h \, r \) - h kappa \( h \, r \) - d . $
  Fix a characteristic with peak height $t$. By Equation (5.1), its limit at width zero is
  $ lim_(s arrow.b 0) I \( h \( s \) \, s \) = k \( t \) - t phi.alt'' \( t \) - d = -
    t^2 frac(d, d u) (frac(k \( u \) - d, u))\|_(u = t) < 0 . $
  Thus $I$ is strictly negative near the peak.
  Consider any positive-height point on the characteristic at which $I = 0$. At that point $lambda = d + h kappa$.
    We claim that
  #[#set math.equation(numbering: n => "(5.10)")
   $ kappa > frac(k \( h \) - d, h) . $ <eq:intercept-zero-curvature>]
  Indeed, if the reverse weak inequality held, then for every $u > h$ the hypothesis would give
  $ frac(k \( u \) - d, u) > frac(k \( h \) - d, h) gt.eq kappa \, wide k \( u \) > d + u kappa =
    lambda + \( u - h \) kappa . $
  Integrating from $h$ to $u$ shows
  $ phi.alt \( u \) - phi.alt \( h \) > lambda \( u - h \) + kappa / 2 \( u - h \)^2 wide \( u > h \) . $
  The strict translated-profile comparison of Lemma 3 then makes the actual midpoint at the fixed base height and
    width strictly larger than the quadratic midpoint. This contradicts Equation (3.26), proving Equation (5.10).
    In particular $lambda = d + h kappa > k \( h \)$ at any zero of $I$.
  Equation (3.27) gives the exact identity
  #[#set math.equation(numbering: n => "(5.11)")
   $ D I = frac(S + h R, G) #scale(x: 120%, y: 120%)[\(] lambda -
     k \( h \) #scale(x: 120%, y: 120%)[\)] . $ <eq:intercept-transport>]
  At a zero of $I$ its right-hand side is strictly positive.
    The outward characteristic derivative is therefore $- D I \/ alpha < 0$.
    If $I$ had a first zero after its initially negative interval,
    its outward derivative there would instead be nonnegative.
    This contradiction proves $I < 0$ everywhere along the characteristic.
    Every fit belongs to such a characteristic, so the assertion holds for all $h \, r > 0$.
  For a strictly negative derivative, apply the proved assertion to $- phi.alt$ and $- d$,
    and use the reflection of fitted parameters from the proof of Proposition 20. ◻
]

#thm([Lemma 5.4.])[
  (Range of the fitted curvature).  #emph[Let an arc have positive base height $h$, peak height $t > h$,
    and width $r$. Its fitted curvature satisfies
#[#set math.equation(numbering: n => "(5.12)")
 $ min_(h lt.eq u lt.eq t) phi.alt'' \( u \) lt.eq kappa \( h \, r \) lt.eq
   max_(h lt.eq u lt.eq t) phi.alt'' \( u \) . $ <eq:fitted-curvature-range>]

 If $phi.alt''$ is nonconstant on $\[ h \, t \]$, both inequalities are strict.]
] <lem:fitted-curvature-range>

#proof[
  Write $m = min_(\[ h \, t \]) phi.alt''$ and $b = max_(\[ h \, t \]) phi.alt''$.
    If the fitted $kappa$ were less than $m$, the actual curvature would be strictly larger than this constant
    reference curvature along the whole characteristic. Lemma 9 would then make the actual final $L$ strictly
    larger than the reference $L$ with the same final angle, contradicting the fit.
    A fitted curvature greater than $b$ gives the reversed contradiction. This proves Equation (5.12).
  If $phi.alt''$ is nonconstant and $kappa = m$, the forcing in Equation (3.11) is nonpositive and strictly
    negative on a positive interior width interval. Its integral representation gives $E lt.eq
    0$ everywhere and $E < 0$ on a nonempty interval. Equation (3.11) makes the reference label nonincreasing and
    nonconstant. Relative to its final constant label, the actual earlier angles are therefore no smaller and are
    strictly larger on a nonempty open interval. As in Equation (5.6), their $L$ integral is strictly larger,
    a contradiction. The case $kappa = b$ reverses all these inequalities.
    Thus both bounds are strict whenever the actual curvature is nonconstant. ◻
]

== 6 The quintic upper bound <sec:application>

We now apply the comparison results to the full polynomial class.
  First replace $y$ by $y - F \( 0 \)$, so that $F \( 0 \) = 0$. If

$ X \( t \) = - x \( - t \) \, wide Y \( t \) = y \( - t \) \, $

then

$ dot(X) = Y - F \( - X \) \, wide dot(Y) = - X . $

This reflection and time reversal preserve the geometric periodic orbits and their isolation,
  and negate the coefficient of $x^5$. We may therefore assume that coefficient is nonnegative.
  No normalization of the other coefficients is needed.

On either open half-plane, put $u = x^2 \/ 2$ and use $y$ as coordinate along the orbit. Equation (1.1) becomes

#[#set math.equation(numbering: n => "(6.1)")
 $ frac(d u, d y) = phi.alt_plus.minus \( u \) - y \, wide phi.alt_plus.minus \( u \) = d_0 u +
   b_0 u^2 plus.minus p \( u \) \, wide p \( u \) = e u^(1 \/ 2) + c u^(3 \/ 2) + a u^(5 \/ 2) \, quad a gt.eq
   0 . $ <eq:quintic-profiles>]

The plus sign corresponds to $x > 0$. Indeed, $phi.alt_plus.minus \( u \) = F \( plus.minus sqrt(2 u) \)$;
  if $F \( x \) = sum_(j = 1)^5 f_j x^j$, then

$ d_0 = 2 f_2 \, quad b_0 = 4 f_4 \, quad e = sqrt(2) thin f_1 \, quad c = 2^(3 \/ 2) f_3 \, quad a = 2^(5 \/ 2) f_5 . $

Thus $d_0 \, b_0 \, e \, c$ are unrestricted. The profiles are smooth on $\( 0 \, oo \)$ and continuous at zero,
  where they vanish.

Let $J$ be the common open interval of transverse height-zero widths from Proposition 6.
  If $J$ is empty there is no periodic orbit. For $r in J$, define $lambda_plus.minus \( 0 \, r \) \,
  kappa_plus.minus \( 0 \, r \)$ by applying the inverse in Theorem 13 to
  $\( M_plus.minus \( 0 \, r \) \, M_(plus.minus \, r) \( 0 \, r \) \, r \)$.
  Lemma 5 makes these data interior to the fit domain; continuity of the inverse identifies the resulting
  parameters with the limits of the positive-height fits. Put

#[#set math.equation(numbering: n => "(6.2)")
 $ Delta \( r \) = M_(+) \( 0 \, r \) - M_(-) \( 0 \, r \) \, wide r in J . $ <eq:matching-difference>]

Proposition 6 shows that it suffices to bound the isolated zeros of $Delta$ on this single interval.

=== 6.1 The model comparison at a matching height <the-model-comparison-at-a-matching-height>

Recall the model width derivative after fitting a prescribed midpoint, defined in Equation (3.14):

$ hat(v) \( r \, M \, kappa \) = H_r #scale(x: 120%, y: 120%)[\(] lambda_(*) \( r \, M \, kappa \) \, kappa \,
  r #scale(x: 120%, y: 120%)[\)] \, wide r > 0 \, quad \| M \| < r \, quad kappa in bb(R) . $

Implicit differentiation of the midpoint fit gives

#[#set math.equation(numbering: n => "(6.3)")
 $ hat(v)_M = R / P > 0 \, wide hat(v)_kappa = G / P > 0 . $ <eq:V-derivatives>]

All model derivatives here are evaluated at the corresponding parameters. For either actual profile,

#[#set math.equation(numbering: n => "(6.4)")
 $ frac(d, d r) M_plus.minus \( 0 \, r \) = hat(v) #scale(x: 120%, y: 120%)[\(] r \, M_plus.minus \( 0 \, r \) \,
   kappa_plus.minus \( 0 \, r \) #scale(x: 120%, y: 120%)[\)] . $ <eq:midpoint-ode>]

The smooth dependence at height zero in Lemma 5, together with the joint smooth inverse in Theorem 13,
  justifies these identities and the limits used below.

Lemma 22 bounds each fitted curvature between the minimum and maximum of the actual curvature along its arc.
  We will use this local bound before passing to height zero.

#thm([Lemma 6.1.])[
  #emph[Let $f$ be continuously differentiable on an open interval and suppose $f' = b q$,
    where $b$ is continuous and positive and $q$ is continuous and nondecreasing.
    Then $f$ has at most two isolated zeros. If a continuously differentiable function has strictly positive
    derivative at each of its zeros, it has at most one zero.]
] <lem:isolated-zero-count>

#proof[
  For the first statement, the sets where $q$ is negative, zero, and positive occur in that order.
    The zero set of $q$ is an interval, possibly empty or a singleton.
    Accordingly $f$ strictly decreases, is constant, and strictly increases on the respective sets.
    Each strict part has at most one zero. If the constant part has nonzero value it contributes none.
    If it has positive length and value zero, every point of it and each endpoint lying in the domain are
    nonisolated zeros, and neither strict part contributes another zero.
    If it is a singleton at which $f = 0$, that point is the sole minimum zero. These possibilities prove the claim.
  For the second statement, suppose $r_1 < r_2$ were two zeros.
    Positive derivatives give $a \, b$ with $r_1 < a < b < r_2$, $f \( a \) > 0$, and $f \( b \) < 0$.
    The first zero $c$ in $\[ a \, b \]$ exists by continuity.
    Since $f > 0$ on $\[ a \, c \)$, its derivative at $c$, which exists, is nonpositive.
    This contradicts the hypothesis. ◻
]

=== 6.2 The four coefficient cases <the-four-coefficient-cases>

===== 6.2.1 Case 1: $e gt.eq 0$ and $c gt.eq 0$. <case-1-ege0-and-cge0.>

Either $p equiv 0$, in which case the two profiles and their midpoint functions coincide and no root in $J$ is
  isolated, or $p \( u \) > 0$ for every $u > 0$. In the latter case even one periodic orbit is impossible.
  To see this, suppose the two positive arches $u_plus.minus \( y \)$ had the same two endpoints $A <
  B$ at height zero. Their difference $w = u_(+) - u_(-)$ satisfies

$ w' = #scale(x: 120%, y: 120%)[\[] d_0 + b_0 \( u_(+) + u_(-) \) #scale(x: 120%, y: 120%)[\]] w + p \( u_(+) \) +
  p \( u_(-) \) \, wide w \( A \) = w \( B \) = 0 . $

The coefficient is continuous on $\[ A \, B \]$, and the inhomogeneous term is strictly positive on
  $\( A \, B \)$. The integrating-factor formula from $A$ gives $w \( B \) > 0$, a contradiction.

===== 6.2.2 Case 2: $e gt.eq 0$ and $c < 0$. <case-2-ege0-and-c0.>

Here

#[#set math.equation(numbering: n => "(6.5)")
 $ p''' \( u \) = frac(3 e - 3 c u + 15 a u^2, 8 u^(5 \/ 2)) > 0 . $ <eq:third-odd>]

Proposition 20 gives $partial_r kappa_(+) \( h \, r \) > 0$ and $partial_r kappa_(-) \( h \, r \) < 0$ for $h \,
  r > 0$. Passage to the height-zero limits at any two specified widths in $J$ shows that

$ q \( r \) = kappa_(+) \( 0 \, r \) - kappa_(-) \( 0 \, r \) $

is nondecreasing on $J$.

Subtract the two instances of Equation (6.4). The fundamental theorem of calculus,
  first in $M$ and then in $kappa$, gives

#[#set math.equation(numbering: n => "(6.6)")
 $ Delta' = A \( r \) Delta + B \( r \) q \, wide B \( r \) > 0 \, $ <eq:Delta-transport>]

with continuous coefficients. More explicitly, suppressing $\( 0 \, r \)$ in the actual parameters, one can take

$ A \( r \) & = integral_0^1 hat(v)_M #scale(x: 120%, y: 120%)[\(] r \, M_(-) + tau \( M_(+) - M_(-) \) \,
  kappa_(+) #scale(x: 120%, y: 120%)[\)] thin d tau \,\
B \( r \) & = integral_0^1 hat(v)_kappa #scale(x: 120%, y: 120%)[\(] r \, M_(-) \, kappa_(-) +
  tau \( kappa_(+) - kappa_(-) \) #scale(x: 120%, y: 120%)[\)] thin d tau . $

The midpoint segment remains in $\( - r \, r \)$ and there is no restriction on the curvature segment.
  Equation (6.3) therefore proves the asserted positivity.

Fix $r_(*) in J$ and multiply $Delta$ by $exp \( - integral_(r_(*))^r A \( s \) thin d s \)$.
  The derivative of the resulting function is a continuous positive factor times $q$.
  Lemma 23 bounds its isolated zeros, and hence those of $Delta$, by two.
  This argument includes multiple isolated roots and zero intervals.

===== 6.2.3 Case 3: $e < 0$ and $c gt.eq 0$. <case-3-e0-and-cge0.>

In this case

#[#set math.equation(numbering: n => "(6.7)")
 $ p'' \( u \) = frac(- e + 3 c u + 15 a u^2, 4 u^(3 \/ 2)) > 0 \, wide p'' \( u \) arrow.r +
   oo quad \( u arrow.b 0 \) . $ <eq:second-odd>]

Fix $r_0 in J$. The peaks of the positive-height arcs at width $r_0$ approach finite positive peaks as $h arrow.b
  0$, by Lemma 5. Choose $T$ larger than both peaks and all sufficiently nearby ones.
  The function $p''$ has a positive lower bound $delta$ on $\( 0 \, T \]$:
  it tends to infinity at zero and is continuous and positive away from zero.
  Consequently, throughout the relevant arcs,

$ phi.alt''_(+) gt.eq 2 b_0 + delta \, wide phi.alt''_(-) lt.eq 2 b_0 - delta . $

Lemma 22 and passage to the limit give

#[#set math.equation(numbering: n => "(6.8)")
 $ kappa_(+) \( 0 \, r_0 \) gt.eq 2 b_0 + delta > 2 b_0 - delta gt.eq kappa_(-) \( 0 \, r_0 \) . $ <eq:curvature-gap>]

At every zero of $Delta$, Equation (6.4) and $hat(v)_kappa > 0$ now imply $Delta' > 0$. Lemma 23 gives at most one zero.

===== 6.2.4 Case 4: $e < 0$ and $c < 0$. <case-4-e0-and-c0.>

We have

#[#set math.equation(numbering: n => "(6.9)")
 $ u p'' \( u \) - p' \( u \) = frac(- 3 e - 3 c u + 5 a u^2, 4 sqrt(u)) > 0 . $ <eq:intercept-odd>]

Writing $k_plus.minus = phi.alt'_plus.minus$, Equation (6.9) is precisely

$ (frac(k_(+) \( h \) - d_0, h))' > 0 \, wide (frac(k_(-) \( h \) - d_0, h))' < 0 . $

Proposition 21 therefore gives

#[#set math.equation(numbering: n => "(6.10)")
 $ lambda_(+) \( h \, r \) - h kappa_(+) \( h \, r \) < d_0 \, wide lambda_(-) \( h \, r \) -
   h kappa_(-) \( h \, r \) > d_0 quad \( h \, r > 0 \) . $ <eq:positive-height-intercepts>]

The strict inequalities persist at height zero, but this requires more than simply taking limits.
  Fix a transverse peak of the plus profile, and let $r \( h \)$ be its width at height $h$,
  with $r \( h \) arrow.r r_0 in J$. The endpoint data converge to an interior triple $\( M_0 \, v_0 \, r_0 \)$,
  with $\| M_0 \| < r_0$ and $\| v_0 \| < 1$. The joint smooth inverse in Theorem 13 shows that
  $lambda \( h \, r \( h \) \)$ and $kappa \( h \, r \( h \) \)$ have finite limits. Put

$ I \( h \) = lambda \( h \, r \( h \) \) - h kappa \( h \, r \( h \) \) - d_0 . $

The derivative along this fixed-peak characteristic is

#[#set math.equation(numbering: n => "(6.11)")
 $ frac(d I, d h) = D I = frac(S + h R, G) #scale(x: 120%, y: 120%)[\(] lambda -
   k_(+) \( h \) #scale(x: 120%, y: 120%)[\)] . $ <eq:strict-boundary-intercept>]

Since $e < 0$, $k_(+) \( h \) arrow.r - oo$, whereas $lambda$ remains bounded.
  Thus $d I \/ d h > 0$ for all sufficiently small positive $h$. Choose one such $h_1$.
  Equation (6.10) and integration in decreasing $h$ give

$ I \( h \) lt.eq I \( h_1 \) < 0 wide \( 0 < h < h_1 \) . $

Taking the limit yields $lambda_(+) \( 0 \, r_0 \) < d_0$.
  On the minus side, $k_(-) \( h \) arrow.r + oo$, so the same argument with all signs reversed gives
  $lambda_(-) \( 0 \, r_0 \) > d_0$. Therefore, throughout $J$,

#[#set math.equation(numbering: n => "(6.12)")
 $ lambda_(+) \( 0 \, r \) < d_0 < lambda_(-) \( 0 \, r \) . $ <eq:strict-slope-gap>]

At a zero of $Delta$, the two model midpoints agree. Because $H_lambda \, H_kappa > 0$,
  Equation (6.12) forces $kappa_(+) \( 0 \, r \) > kappa_(-) \( 0 \, r \)$:
  otherwise increasing $lambda_(+)$ to $lambda_(-)$ and then $kappa_(+)$ to $kappa_(-)$ would strictly increase
  $H$. Equation (6.4) again gives $Delta' > 0$ at every zero, and there is at most one.

These four cases exhaust all $e \, c in bb(R)$ with $a gt.eq 0$, including zero leading coefficients.
  By Proposition 6, they prove the upper bound in Theorem 1 for every allowed polynomial,
  without a restriction on amplitude or on the multiplicity of a limit cycle.

== 7 Sharpness <sec:sharpness>

We finish the proof of Theorem 1 by giving a direct two-cycle construction.
  It also makes clear why a perturbative calculation suffices for the lower bound,
  although it was not used to prove the upper bound. The method is a direct first-order return-displacement
  calculation, in the classical perturbative tradition discussed in [10,11].
  We derive the exact energy quotient needed for the argument below.

Set

#[#set math.equation(numbering: n => "(7.1)")
 $ F_epsilon \( x \) = epsilon f \( x \) \, wide f \( x \) = 4 x - 20 / 3 x^3 + 8 / 5 x^5 . $ <eq:sharp-polynomial>]

At $epsilon = 0$, the solution through $\( 0 \, s \)$, $s > 0$, is

$ x \( t \) = s sin t \, wide y \( t \) = s cos t . $

For $s$ in a neighborhood of either $1$ or $2$, smooth flow dependence on a neighborhood of this compact circle,
  together with transversality at $t = 2 pi$, gives a smooth return time $tau \( s \, epsilon \)$ near $2
  pi$ and a smooth positive return ordinate $P \( s \, epsilon \)$ on $x = 0 \, y > 0$.
  These are the first positive-axis returns for small $\| epsilon \|$.
  Indeed, away from small time neighborhoods of the two axis crossings the unperturbed $x$ is bounded away from
  zero; near each crossing transversality gives a unique nearby crossing.
  These statements hold on one common parameter neighborhood after shrinking the two neighborhoods if necessary.

For $E = \( x^2 + y^2 \) \/ 2$ the exact energy identity is

$ dot(E) = - epsilon x f \( x \) . $

Hence the one-turn energy displacement has the factorization

#[#set math.equation(numbering: n => "(7.2)")
 $ frac(P \( s \, epsilon \)^2 - s^2, 2) = epsilon Q \( s \, epsilon \) \, wide Q \( s \, epsilon \) = -
   integral_0^(tau \( s \, epsilon \)) x \( t \; s \, epsilon \) f \( x \( t \; s \, epsilon \) \) thin d t .
   $ <eq:energy-quotient>]

The integral is smooth in $\( s \, epsilon \)$ and defines the quotient at $epsilon = 0$ exactly. Using

$ integral_0^(2 pi) sin^2 t thin d t = pi \, quad integral_0^(2 pi) sin^4 t thin d t = frac(3 pi, 4) \, quad
  integral_0^(2 pi) sin^6 t thin d t = frac(5 pi, 8) \, $

we obtain

#[#set math.equation(numbering: n => "(7.3)")
 $ Q \( s \, 0 \) = - pi s^2 \( 4 - 5 s^2 + s^4 \) . $ <eq:sharp-averaged>]

Its zeros at $s = 1 \, 2$ are simple:

$ Q_s \( 1 \, 0 \) = 6 pi \, wide Q_s \( 2 \, 0 \) = - 48 pi . $

The implicit function theorem gives roots $s_1 \( epsilon \) \,
  s_2 \( epsilon \)$ in disjoint positive neighborhoods, for the same sufficiently small $\| epsilon \|$.
  Fix any nonzero positive $epsilon$ in that common range.

At these roots, $P + s > 0$, so Equation (7.2) implies $P = s$. Thus each root gives a periodic orbit.
  Differentiating the energy displacement in $s$ at a root gives

$ s \( P_s - 1 \) = epsilon Q_s eq.not 0 . $

Each return fixed point is therefore simple and isolated.
  The two orbits are geometrically distinct, since their positive intercepts lie in disjoint neighborhoods and a
  periodic orbit has just one positive intercept, as proved in Proposition 6.
  After decreasing the common upper bound on $epsilon > 0$ if necessary, continuity from $P_s \( s \, 0 \) =
  1$ gives $P_s > 0$ at both fixed points. The signs of $Q_s$ then give $P_s > 1$ on the inner cycle and $0 <
  P_s < 1$ on the outer one. Thus both cycles are hyperbolic: the inner one repels and the outer one attracts.
  This proves sharpness. 0◻

#heading(level: 1)[References]
#bibitem([1])[H.~Chen, Z.~Li, R.~Zhang, and X.~Zhang, The number of limit cycles of piecewise linear Liénard
  systems, #link("https://arxiv.org/abs/2608.19542v1")[arXiv:2608.19542v1] \[math.DS\], 20 August 2026.]
#bibitem([2])[B.~Coll, A.~Gasull, and R.~Prohens, Limit cycles for non smooth differential equations via
  Schwarzian derivative, #emph[Journal of Differential Equations] #strong[132]\(2) (1996), 203--221.
  #link("https://doi.org/10.1006/jdeq.1996.0177")[doi:10.1006/jdeq.1996.0177].]
#bibitem([3])[P.~De Maesschalck and F.~Dumortier, Classical Liénard equations of degree $n gt.eq
  6$ can have $floor.l \( n - 1 \) \/ 2 floor.r + 2$ limit cycles,
  #emph[Journal of Differential Equations] #strong[250]\(4) (2011), 2162--2176.
  #link("https://doi.org/10.1016/j.jde.2010.12.003")[doi:10.1016/j.jde.2010.12.003].]
#bibitem([4])[P.~De Maesschalck and R.~Huzak, Slow divergence integrals in classical Liénard equations near
  centers, #emph[Journal of Dynamics and Differential Equations] #strong[27]\(1) (2015), 177--185.
  #link("https://doi.org/10.1007/s10884-014-9358-1")[doi:10.1007/s10884-014-9358-1].]
#bibitem([5])[F.~Dumortier, D.~Panazzolo, and R.~Roussarie, More limit cycles than expected in Liénard equations,
  #emph[Proceedings of the American Mathematical Society] #strong[135]\(6) (2007), 1895--1904.
  #link("https://doi.org/10.1090/S0002-9939-07-08688-1")[doi:10.1090/S0002-9939-07-08688-1].]
#bibitem([6])[A.~Gasull, H.~Giacomini, and M.~Grau, Effective construction of Poincaré--Bendixson regions,
  #emph[Journal of Applied Analysis and Computation] #strong[7]\(4) (2017), 1549--1569.
  #link("https://doi.org/10.11948/2017094")[doi:10.11948/2017094].]
#bibitem([7])[M.~Hernández Rosales, A global algebraic variety approach to the maximum number of limit cycles in
  Liénard equations, preprint, 31 August 2026, Section~9, p.~32.
  #link("https://www.researchgate.net/profile/Manuel-Rosales-2/publication/404693751_A_bound_for_the_maximum_number_of_limit_cycles_of_the_Lienard_equation/links/6ac3d9555770bb0daeda4d14/A-bound-for-the-maximum-number-of-limit-cycles-of-the-Lienard-equation.pdf")[author's
  manuscript].]
#bibitem([8])[C.~Li and J.~Llibre, Uniqueness of limit cycles for Liénard differential equations of degree four,
  #emph[Journal of Differential Equations] #strong[252]\(4) (2012), 3142--3162.
  #link("https://doi.org/10.1016/j.jde.2011.11.002")[doi:10.1016/j.jde.2011.11.002].]
#bibitem([9])[C.~Li and K.~Lu, Slow divergence integral and its application to classical Liénard equations of
  degree 5, #emph[Journal of Differential Equations] #strong[257]\(12) (2014), 4437--4469.
  #link("https://doi.org/10.1016/j.jde.2014.08.015")[doi:10.1016/j.jde.2014.08.015].]
#bibitem([10])[A.~Lins, W.~de Melo, and C.~C.~Pugh, On Liénard's equation, in #emph[Geometry and Topology],
  J.~Palis and M.~do Carmo (eds.), Lecture Notes in Mathematics #strong[597], Springer, Berlin, 1977,
  pp.~335--357. #link("https://doi.org/10.1007/BFb0085364")[doi:10.1007/BFb0085364].]
#bibitem([11])[J.~Llibre and X.~Zhang, Limit cycles of the classical Liénard differential systems:
  A survey on the Lins Neto, de Melo and Pugh's conjecture,
  #emph[Expositiones Mathematicae] #strong[35]\(3) (2017), 286--299.
  #link("https://doi.org/10.1016/j.exmath.2016.12.001")[doi:10.1016/j.exmath.2016.12.001].]
#bibitem([12])[K.~Odani, Existence of exactly $N$ periodic solutions for Liénard systems,
  #emph[Funkcialaj Ekvacioj] #strong[39]\(2) (1996), 217--234.
  #link("https://doi.org/10.24546/0100499900")[doi:10.24546/0100499900].]
#bibitem([13])[V.~Ovsienko and S.~Tabachnikov, What Is …~the Schwarzian Derivative?,
  #emph[Notices of the American Mathematical Society] #strong[56]\(1) (2009), 34--36.
  #link("https://ovsienko.perso.math.cnrs.fr/Publis/what-is.pdf")[Author's text].]
#bibitem([14])[L.~Perko, #emph[Differential Equations and Dynamical Systems], 3rd ed.,
  Texts in Applied Mathematics #strong[7], Springer, New York, 2001.
  #link("https://doi.org/10.1007/978-1-4613-0003-8")[doi:10.1007/978-1-4613-0003-8].]
#bibitem([15])[G.~S.~Rychkov, The maximal number of limit cycles of the system $dot(y) = - x$, $dot(x) = y -
  sum_(i = 0)^2 a_i x^(2 i + 1)$ is equal to two, #emph[Differentsial'nye Uravneniya] #strong[11]\(2) (1975),
  390--391 (in Russian). #link("https://www.mathnet.ru/eng/de2400")[Math-Net: de2400].]
