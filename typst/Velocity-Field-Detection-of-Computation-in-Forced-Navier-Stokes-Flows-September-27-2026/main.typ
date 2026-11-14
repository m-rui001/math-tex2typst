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

#align(center)[#text(size: 16pt, weight: "bold")[Velocity-Field Detection of Computation in Forced Navier--Stokes Flows]]
#align(center)[OpenAI]
#align(center)[September 27, 2026]

== 1 Observing the velocity rather than a particle <sec:introduction>

A material observer follows one marked fluid particle. An Eulerian observer instead examines the velocity at a
  time, without remembering which particle reached which point. The distinction matters for computation.
  A smooth flow can transport an exact tape encoding, but a velocity component that carries the same information
  is also diffused by viscosity. We ask whether a fixed test of the velocity can still detect halting when the
  fluid starts at rest.

Write $bb(T) = bb(R) \/ bb(Z)$. On either $Omega = bb(T)^3$ or $Omega = bb(R)^2 times bb(T)$,
  we use the flat metric and the equations

#[#set math.equation(numbering: n => "(1)")
 $ partial_t u + \( u dot.op nabla \) u = - nabla p + nu Delta u + f \, wide "div" u = 0 \, wide u \( 0 \) =
   0 . $ <eq:NS>]

The viscosity $nu > 0$ is fixed and computable. The input consists of a deterministic Turing machine and a finite
  input word. An effective force prescription is a finite program evaluating $f$ and each requested mixed
  derivative, to any rational error, at computably supplied space-time arguments.
  It also gives the finite derivative bounds used in the construction. There is no computational complexity requirement.

We use two fixed observations. On $bb(T)^3$, with coordinates $\( x \, y \, z \)$, the event is

#[#set math.equation(numbering: n => "(2)")
 $ exists t gt.eq 0 med exists \( x \, y \, z \) \, quad 1 \/ 32 < y < 1 \/ 8 \, wide
   u_3 \( t \, x \, y \, z \) > 1 / 2 . $ <eq:torus-event>]

On $bb(R)^2 times bb(T)$, with coordinates $\( X_1 \, X_2 \, z \)$, it is

#[#set math.equation(numbering: n => "(3)")
 $ exists t gt.eq 0 \, wide integral_({ X_2 > 0 } times bb(T)) u_3 \( t \, X \, z \) thin upright(d) X thin
   upright(d) z > 1 / 2 . $ <eq:plane-event>]

All integrals over a torus coordinate use one period and normalized Lebesgue measure.
  We specify the solution classes before the theorem. A classical competitor has continuous velocity,
  time derivative, spatial derivatives through order two, pressure and pressure gradient on every finite closed
  time cylinder, and satisfies the equations pointwise. On the torus its pressure is periodic and has mean zero.
  On $bb(R)^2 times bb(T)$ they additionally satisfy, for every finite $T$,

#[#set math.equation(numbering: n => "(4)")
 $ u in C \( \[ 0 \, T \] \; H^2 \) ∩ C^1 \( \[ 0 \, T \] \; L^2 \) \, wide p in C \( \[ 0 \, T \] \; H^1 \) \,\
sup_(\[ 0 \, T \] times Omega) \( \| u \| + \| nabla u \| \) < oo . $ <eq:comparison-class>]

The pressure condition on the noncompact domain fixes the additive spatial constant.
  Smoothness at time zero means one-sided smoothness.

#thm([Theorem 1.1.])[
  #emph[For each positive computable $nu$, a machine and a finite input effectively determine each of the
    following two forces.]
  + #emph[On $bb(T)^3$, a smooth force has a unique global smooth solution in the torus class above,
    with pressure zero, for which (2) holds exactly when the machine halts.
    The force is supported in $K times bb(T)$ for a compact $K subset \( 0 \, 1 \)^2$ independent of time.
    Its derivatives are bounded on every finite time interval; their bounds may grow with that interval.]
  + #emph[On $bb(R)^2 times bb(T)$, a smooth force and all its mixed derivatives are globally bounded.
    On each finite time interval its horizontal support is compact.
    It has a unique global smooth solution in (4), with pressure zero and integrable nonnegative third component.
    Event (3) holds exactly when the machine halts.]
  #emph[The sets and thresholds in both observations are independent of the machine and input.
    The compact set $K$ in the first construction may depend on that instance, but is independent of time.
    Both force prescriptions install all the required local instructions, without executing the selected computation.]
] <thm:main>

The two conclusions pay for diffusion in different ways. The first keeps the horizontal mechanism inside one chart
  and speeds up its later tests. Its force need not be bounded uniformly for infinite time.
  The second keeps the amplitudes and all mixed derivatives bounded by allowing the horizontal geometry to expand.
  It makes no claim of a single compact support for all time or of uniformly bounded total kinetic energy.
  Neither construction requires a solenoidal force or a mean-zero force.
  These qualifications are part of the mathematical distinction between the regimes.

The descriptions specify exact computable forces through arbitrarily accurate evaluations.
  The strict observation margins proved below concern these forces;
  no stability under perturbations of the force or finite-precision replacement of its description is asserted.

=== 1.1 Background and the two mechanisms <background-and-the-two-mechanisms>

Turing proved the undecidability of whether a described machine ever prints a designated
  symbol #cite(label("Turing1936")) Section 8. Replacing that printing event by a halt gives the decision problem
  used here. Moore’s generalized shifts encode tapes in positional real coordinates and represent local
  instructions by piecewise affine maps #cite(label("Moore1990")) #cite(label("Moore1991")).
  Smooth flows require injective finite-time maps, whereas a machine may erase a symbol.
  Landauer #cite(label("Landauer1961")) Section 3 discusses retaining information that an irreversible operation
  discards; Bennett #cite(label("Bennett1973")) gives a reversible simulation that records the instruction
  history. The particular one-head compiler and planar realization used here are supplied by
  #cite(label("stationary2026")) Lemma 3.1 and Theorem 4.1; the diffusion estimates below are proved here.

Material-particle computation was realized by Cardona, Miranda,
  Peralta-Salas and Presas in steady Euler flow on a three-sphere with a chosen Riemannian
  metric #cite(label("CardonaEtAl2021")) Theorem 6.1. Dyhr, González-Prieto,
  Miranda and Peralta-Salas construct steady unforced Navier–Stokes flows on suitable Riemannian three-manifolds,
  using harmonic fields for the Hodge Laplacian and an adapted metric #cite(label("DyhrEtAl2026")) Theorem A.
  These results concern trajectories of a stationary velocity,
  whereas the observations here test the evolving velocity itself.

Velocity-space observation has a direct predecessor in the work of Cardona,
  Miranda and Peralta-Salas #cite(label("CardonaMirandaPeraltaSalas2022")).
  Their construction uses the unforced incompressible Euler evolution on a constructed high-dimensional compact
  Riemannian manifold; computation is observed by entry into an open set of divergence-free velocity fields.
  Here the geometry is flat and three-dimensional, the viscosity is positive, and the initial velocity is zero.
  The machine and input enter a prescribed external force, and the observations are the pointwise and integral
  tests above. These differences distinguish the present problem from both stationary-particle and Euler
  velocity-space computation.

The common analytic device is particularly simple. For a planar divergence-free field $a \( t \, Y \)$ and a
  scalar $w \( t \, Y \)$, the three-dimensional velocity $\( a \, w \)$ is divergence free when it is independent
  of $z$. Its third equation is an advection–diffusion equation.
  We prescribe its source and the horizontal force, and then solve for $w$.
  Thus the unknown velocity is not concealed in a force formula.

In the torus construction, each block injects a very small bump of height one at the initial machine code and runs
  a longer prefix of the planar processor. A short physical duration keeps diffusion close to pure transport,
  while a long heat-only interval makes older bumps small. A halting run carries a fresh bump to the detector.
  In a nonhalting run, the entire transported bump remains separated from it,
  so even its diffusive tail stays below the threshold.

For bounded forcing, an initial impulse creates scalar mass one.
  The horizontal field translates large squares between integer addresses for all possible configurations.
  Longer and larger gates keep every force derivative bounded.
  A cutoff moving with the chosen address cancels transport exactly; its Laplacian measures the diffusion loss.
  Choosing the gate radii fast enough makes the sum of those losses less than $1 \/ 24$.

Section 2 establishes the scalar reduction and the solution convention.
  Section 3 proves a parameterized injection, stirring and waiting theorem,
  including two quantitative specializations. Section 4 applies it to the fixed torus detector.
  The expanding-address construction and its mass estimate appear in Section 5.
  The classical background for the maximum principle and parabolic kernels is described, for example,
  by Aronson #cite(label("Aronson1968")); all constants and comparison arguments needed for detection are included
  below.

== 2 A scalar component of a viscous velocity <sec:scalar-structure>

Let $Y$ range over $bb(T)^2$ or $bb(R)^2$. Suppose $a \( t \, Y \)$ is divergence free,
  and prescribe the horizontal residual and the vertical source by

#[#set math.equation(numbering: n => "(5)")
 $ F = partial_t a + \( a dot.op nabla_Y \) a - nu Delta_Y a \, wide
   f \( t \, Y \, z \) = \( F \( t \, Y \) \, h \( t \, Y \) \) . $ <eq:triangular-force>]

If

#[#set math.equation(numbering: n => "(6)")
 $ partial_t w + a dot.op nabla_Y w = nu Delta_Y w + h \, wide w \( 0 \) = 0 \, $ <eq:scalar>]

then $U = \( a \, w \)$, $p = 0$, satisfies (1), provided $a \( 0 \) = 0$.
  Indeed $"div" U = "div"_Y a$, all $z$ derivatives vanish,
  and the horizontal and vertical equations are exactly (5) and (6). Only $a$ and $h$ occur in the force prescription.

We will construct the scalar solution in each setting, including its behavior at infinity in the noncompact case.
  Once it belongs to the stated class, uniqueness is the classical difference-energy argument
  #cite(label("Leray1934")) Section 18, in the precise form proved in #cite(label("entry2026")) Lemma 3.
  To display its use, let $v$ be a competitor, $e = v - U$, and $q$ the pressure difference. Then

$ partial_t e + \( v dot.op nabla \) e + \( e dot.op nabla \) U = - nabla q + nu Delta e \, $

and

#[#set math.equation(numbering: n => "(7)")
 $ 1 / 2 frac(d, d t) parallel e parallel_2^2 + nu parallel nabla e parallel_2^2 lt.eq
   parallel nabla U parallel_(oo \, upright("op")) parallel e parallel_2^2 . $ <eq:uniqueness>]

Periodic integration proves this on the torus. On $bb(R)^2 times bb(T)$,
  insert a horizontal cutoff with gradient $O \( R^(- 1) \)$.
  The transport, pressure and viscous boundary errors are bounded respectively by

$ C R^(- 1) parallel v parallel_oo parallel e parallel_2^2 \, quad
  C R^(- 1) parallel q parallel_2 parallel e parallel_2 \, quad
  C R^(- 1) parallel nabla e parallel_2 parallel e parallel_2 . $

All terms converge by (4); its time regularity justifies differentiating the energy.
  Let $R arrow.r oo$ and apply Gronwall to (7) on $\[ 0 \, T \]$.
  Since $e \( 0 \) = 0$, the velocities agree, and the pressure normalization fixes $q = 0$.
  This comparison gives uniqueness for the explicitly constructed data,
  not existence for arbitrary three-dimensional data.

== 3 Short stirring bursts on the torus <sec:compact>

This section separates the diffusion argument from the construction of a planar machine.
  The input is a smooth periodic planar field and a distinguished initial point.
  Its orbit either enters a target at an integer phase or stays a positive distance away at every phase.
  The output is a force for which the third velocity component distinguishes these two cases.

We first work at viscosity one. Let $V \( s \, Y \)$ be an effectively specified smooth divergence-free field on
  $bb(R) times bb(T)^2$, periodic of period one and zero on a neighborhood of every integer phase.
  Its flow from phase zero to phase $s$ is denoted $Psi_s$.
  Assume that effective uniform derivative bounds are available; choose an integer $L gt.eq 1$ such that

#[#set math.equation(numbering: n => "(8)")
 $ parallel D_Y V parallel_(oo \, upright("op")) \, quad parallel D_Y^2 V parallel_(oo \, upright("op")) lt.eq
   L \, wide R = 4^L . $ <eq:processor-derivatives>]

All derivative norms in this section are Euclidean operator norms.
  Let $p in bb(T)^2$ be computable and let $E subset bb(T)^2$ be an open target.

#thm([Theorem 3.1.])[
  (Injection, stirring and waiting).  #emph[For $V \, p \, E$ as above, choose either of the two pairs
#[#set math.equation(numbering: n => "(9)")
 $ \( d \, H \) = \( 1 \/ 32 \, 10^9 \) quad upright("or") quad \( 1 \/ 16 \, 10^8 \) . $ <eq:two-constants>]

 There is a smooth force on $bb(T)^3$, effectively determined by $V \, p$,
   for which zero initial velocity has a global smooth solution, unique in the classical torus class of Section 1,
   with pressure zero and the following properties.]
  + #emph[If $Psi_k \( p \) in E$ for some integer $k gt.eq 0$,
    then $u_3 \( t \, Y \, z \) > 1 \/ 2$ for some finite $t$ and some $Y in E$.]
  + #emph[If $"dist"_(bb(T)^2) \( Psi_s \( p \) \, E \) gt.eq 2 d$ for every $s gt.eq 0$,
    then $u_3 \( t \, Y \, z \) < 1 \/ 2$ for every $t gt.eq 0$ and $Y in E$.]
  #emph[The third component is nonnegative. At viscosity one, its total horizontal mass is less than $10^(- 11)$.
    The same conclusions and threshold hold for every positive computable viscosity,
    with the time and horizontal velocity rescaled as in (21).
    The force is supported in the union of the horizontal support of $V$ and one fixed small neighborhood of $p$,
    times $bb(T)$. All smoothness and uniqueness assertions concern every finite time interval.]
] <thm:compact-detector>

The force does not depend on $E$, so no effective presentation of the open target is required.
  The target enters only the two orbit tests. Here $d$ is the clearance required between a transported bump and
  the target, and $H$ is an upper bound for the heat kernel at that clearance or after one unit of waiting.
  The proof establishes that bound in Lemma 4. The nonhalting hypothesis concerns the entire orbit.
  Integer-time separation alone would leave open a false detection during a transition.
  The first numerical pair serves the fixed torus detector in Section 4;
  the second serves the slow-clock application identified at the end of that section.
  The scalar proof is the same for both.

=== 3.1 An injection and a finite computation in each block <sec:compact-blocks>

Use the effective nondecreasing smooth step

$ b \( r \) = cases(delim: "{", e^(- 1 \/ r) \, & r > 0 \,, 0 \, & r lt.eq 0 \,) wide theta \( r \) =
  frac(b \( r \), b \( r \) + b \( 1 - r \)) . $

It is zero for $r lt.eq 0$ and one for $r gt.eq 1$, with all derivatives flat at the endpoints.
  Define a fixed bump on $bb(R)^2$ by

$ g \( Z \) = product_(j = 1)^2 theta \( 2 \( Z_j + 1 \) \) theta \( 2 \( 1 - Z_j \) \) . $

It lies in $\[ 0 \, 1 \]$, equals one near zero, and is supported in $\[ - 1 \, 1 \]^2$.
  Let an effective integer $C gt.eq 1$ bound its first and second derivative norms. For $n gt.eq 1$, put

#[#set math.equation(numbering: n => "(10)")
 $ b_n & = 10^(- 6) \( 2 R \)^(- n) \, & g_n \( Y \) & = g \( \( Y - p \) \/ b_n \) \,\
D_n & = 2 C b_n^(- 2) \( 1 + n L \) R^(3 n) \, & delta_n & = frac(1, 100 \( 1 + D_n \)) \, wide t_n =
  2 n . $ <eq:compact-scales>]

The width $b_n$ makes the bump’s mass small and its transported support narrow.
  The quantity $D_n$ is chosen to bound the Laplacian of that transported bump; Section 3.3 verifies the bound.
  The duration $delta_n$ then makes the accumulated diffusion error at most $2 delta_n D_n < 1 \/ 16$.
  These are separate roles: spatial width controls the mass and separation,
  while physical duration controls the error in height. Here $g_n$ is periodized from the small square about a
  lift of $p$; the copies have disjoint supports. In particular

#[#set math.equation(numbering: n => "(11)")
 $ parallel nabla g_n parallel_oo lt.eq C b_n^(- 1) \, wide parallel D^2 g_n parallel_oo lt.eq C b_n^(- 2) \, wide
   integral_(bb(T)^2) g_n lt.eq 4 b_n^2 . $ <eq:bump-bounds>]

Block $n$ injects this bump over time $delta_n$, runs $n$ complete periods of $V$ over another time $delta_n$,
  and then waits for the next block. In particular, its heat-only wait has length $2 - 2 delta_n > 1$.
  The time diagram in Figure 1 shows the roles of these intervals; their plotted lengths are schematic.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  line((0, 0), (12, 0), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: black)))
  content((12, 0), [#text(size: 9pt)[$t$]], anchor: "west", padding: 0.1176cm)
  rect((0.4, 0.15), (2.5, 1), fill: rgb("#e0e0ff"), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((2.5, 0.15), (5.2, 1), fill: rgb("#e0f0e0"), stroke: (thickness: 0.4pt, miter-limit: 10))
  rect((5.2, 0.15), (11.5, 1), fill: rgb("#f0f0f0"), stroke: (thickness: 0.4pt, miter-limit: 10))
  content((1.45, 0.58), [#text(size: 9pt)[inject $g_n$]])
  content((3.85, 0.58), [#box(width: 2.635cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[$n$ processor#linebreak()periods]]])])
  content((8.35, 0.58), [#text(size: 9pt)[heat evolution]])
  content((0.4, 0), [#text(size: 9pt)[$t_n$]], anchor: "north", padding: 0.1176cm)
  content((2.5, 0), [#text(size: 9pt)[$t_n+ delta_n$]], anchor: "north", padding: 0.1176cm)
  content((5.2, 0), [#text(size: 9pt)[$t_n+2 delta_n$]], anchor: "north", padding: 0.1176cm)
  content((11.5, 0), [#text(size: 9pt)[$t_(n+1)$]], anchor: "north", padding: 0.1176cm)
  content((1.45, 1.03), [#text(size: 9pt)[height one]], anchor: "south", padding: 0.1176cm)
  content((3.85, 1.03), [#box(width: 2.635cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[small diffusion#linebreak()error]]])], anchor: "south")
  content((8.35, 1.03), [#box(width: 5.035cm, inset: 0.3333em, [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[old mass becomes uniformly small]]])], anchor: "south")
})],
  caption: [Figure 1: One torus block. Fresh scalar is injected at the initial code, then transported through a longer finite prefix. The wait exceeds one unit of heat time. The two active intervals are much shorter than the wait; their relative sizes in the diagram are not to scale. ],
) <fig:blocks>

Let $V_0$ be the single period of $V$ extended by zero outside $\[ 0 \, 1 \]$.
  The phase collars make this extension smooth. Prescribe

#[#set math.equation(numbering: n => "(12)")
 $ s_n \( t \) & = n \( t - t_n - delta_n \) \/ delta_n \,\
a \( t \, Y \) & = sum_(n gt.eq 1) n / delta_n sum_(j = 0)^(n - 1) V_0 \( s_n \( t \) - j \, Y \) \,\
h \( t \, Y \) & = sum_(n gt.eq 1) delta_n^(- 1) theta' \( \( t - t_n \) \/ delta_n \) g_n \( Y \) \,\
F \( t \, Y \) & = partial_t a + \( a dot.op nabla_Y \) a - Delta_Y a \, wide
  f \( t \, Y \, z \) = \( F \( t \, Y \) \, h \( t \, Y \) \) . $ <eq:compact-program>]

Each summand is supported in its indicated block. The sums are locally finite in physical time and join smoothly
  at all endpoints. Moreover $"div"_Y a = 0$, $h gt.eq 0$, and $a = h = 0$ near time zero.
  This prescription uses $V$ and the injection profiles, without using the scalar that it will produce.

=== 3.2 Constructing the scalar and controlling old mass <constructing-the-scalar-and-controlling-old-mass>

#thm([Lemma 3.2.])[
  (Scalar evolution on the torus).  #emph[For smooth $a \, h$ on $\[ 0 \, T \] times bb(T)^2$ with $"div"_Y a =
    0$, smooth initial data give a unique smooth solution of $w_t + a dot.op nabla_Y w = Delta_Y w + h$.
    Nonnegative initial data and source give $w gt.eq 0$. Homogeneous evolution contracts the supremum norm.
    On an interval starting at $t_0$, zero initial data and $\| h \| lt.eq
    A$ imply $parallel w \( t \) parallel_oo lt.eq A \( t - t_0 \)$.]
] <lem:torus-scalar>

#proof[
  Let $P_J$ project Fourier series onto $\| k \|_oo lt.eq J$ and solve the finite linear system
  $ partial_t w_J = Delta w_J + P_J \( - a dot.op nabla w_J + h \) \, wide w_J \( 0 \) = P_J w \( 0 \) . $
  For each integer $m gt.eq 0$, differentiate through order $m$ and take $L^2$ inner products with the
    corresponding derivatives of $w_J$. The projection commutes with differentiation and drops out of these inner
    products. The leading transport term has zero integral because $"div" a = 0$.
    In each remaining commutator a positive derivative falls on $a$, leaving at most $m$ derivatives on $w_J$.
    Cauchy–Schwarz, the finite-time bounds on $a \, h$, and the nonpositive diffusion term give
  $ frac(d, d t) parallel w_J parallel_(H^m)^2 lt.eq C_(m \, T) \( 1 + parallel w_J parallel_(H^m)^2 \) . $
  Gronwall bounds every $H^m$ norm uniformly in $J$ on $\[ 0 \, T \]$.
  The equations bound the time derivative of every fixed Fourier coefficient.
    A diagonal subsequence therefore converges uniformly in time coefficientwise.
    The $H^(ell + 2)$ bound controls the differentiated Fourier tail by a constant times
  $ (sum_(\| k \|_oo > K) \( 1 + \| k \|^2 \)^(- 2))^(1 \/ 2) \, $
  which tends to zero in two dimensions. Hence convergence holds in $C \( \[ 0 \, T \] \; C^ell \)$ for every
    $ell$. The same tail argument applies to the products and projections in the time-integrated equation.
    Passing to that equation gives the scalar PDE with all spatial derivatives.
    It then gives one time derivative, and repeated time differentiation gives smoothness up to the initial time.
  For comparison, subtract a proposed constant or linear upper bound and then $epsilon.alt \( t - t_0 \)$,
    initially allowing an arbitrarily small strict gap as well.
    A first positive maximum has zero gradient, nonpositive Laplacian and nonnegative time derivative,
    contradicting the strict differential inequality. Let the gaps tend to zero.
    Apply this argument also to $- w$ and to a difference of solutions.
    It proves the bounds, positivity and uniqueness. ◻
]

Apply the lemma to (12) with $w \( 0 \) = 0$. Solutions on finite intervals agree by uniqueness,
  giving a global smooth nonnegative scalar. The velocity $\( a \, w \)$ with pressure zero is the unique
  three-dimensional solution by Section 2. Integrating the scalar equation and using (11) gives

#[#set math.equation(numbering: n => "(13)")
 $ 0 lt.eq integral_(bb(T)^2) w \( t \, Y \) thin upright(d) Y lt.eq M_0 := sum_(n gt.eq 1) 4 b_n^2 =
   frac(4 dot.op 10^(- 12), 4 R^2 - 1) < 10^(- 11) . $ <eq:small-mass>]

Thus infinitely many height-one injections still have very small total mass.
  The heat kernel converts this mass bound into control of their older contributions.

#thm([Lemma 3.3.])[
  (Two explicit heat bounds).  #emph[For either $\( d \, H \)$ in (9), the unit two-torus heat kernel satisfies
#[#set math.equation(numbering: n => "(14)")
 $ K \( tau \, Z \) lt.eq H quad upright("if ") tau gt.eq 1 quad upright("or") quad
   "dist"_(bb(T)^2) \( Z \, 0 \) gt.eq d . $ <eq:heat-bound>]

]
] <lem:heat-bounds>

#proof[
  Periodizing the planar Gaussian gives
  $ K \( tau \, Z \) = frac(1, 4 pi tau) sum_(k in bb(Z)^2) e^(- \| Z + k \|^2 \/ \( 4 tau \)) . $
  Its convolution solves the heat equation and tends uniformly to smooth initial data as $tau arrow.b 0$,
    so uniqueness identifies it as the heat kernel. Choose $Z in \[ - 1 \/ 2 \, 1 \/ 2 \]^2$.
    The sup-norm shell $\| k \|_oo = j$ has $8 j$ points and $\| Z + k \| gt.eq j \/ 2$ for $j gt.eq 1$. Consequently
  $ sum_(k in bb(Z)^2) e^(- \| Z + k \|^2 \/ 8) lt.eq 1 + 8 sum_(j gt.eq 1) j e^(- j \/ 32) < 10^4 . $
  For the last inequality, $e^(- 1 \/ 32) lt.eq 32 \/ 33$ and $sum j q^j =
    q \/ \( 1 - q \)^2$ give an upper bound $1 + 8 dot.op 1056 < 10^4$.
    For $0 < tau lt.eq 1$ and distance at least $d$, split each Gaussian factor in half.
    One half satisfies $tau^(- 1) e^(- d^2 \/ \( 8 tau \)) lt.eq 8 \/ d^2$;
    summing the other halves uses the preceding estimate. Thus
  $ K \( tau \, Z \) lt.eq frac(8 dot.op 10^4, 4 pi d^2) \, $
  which is less than $10^9$ for $d = 1 \/ 32$ and less than $10^8$ for $d = 1 \/ 16$.
    At time one the same shell estimate applies without a distance restriction;
    the maximum principle extends its upper bound to all later times. ◻
]

Before block $n > 1$, there has been more than one unit of heat-only evolution. Therefore

#[#set math.equation(numbering: n => "(15)")
 $ 0 lt.eq w \( t_n \, dot.op \) lt.eq H M_0 \; $ <eq:old-mass>]

for $n = 1$ the scalar is zero. From $t_n$ to $t_(n + 1)$, linearity splits $w = w^(upright("old")) +
  w^(upright("new"))$. The old part has initial value $w \( t_n \)$ and no source,
  so remains between zero and $H M_0$. The new part starts at zero and receives just the current injection.
  It remains to estimate this new part near its transported bump and away from it.

=== 3.3 A controlled diffusion error during the burst <sec:compact-error>

The variational equations for $Psi_s$ give, for $0 lt.eq s lt.eq n$,

#[#set math.equation(numbering: n => "(16)")
 $ parallel D Psi_s^(plus.minus 1) parallel_oo lt.eq e^(L n) lt.eq R^n \, wide
   parallel D^2 Psi_s^(plus.minus 1) parallel_oo lt.eq n L e^(3 L n) lt.eq n L R^(3 n) . $ <eq:flow-bounds>]

For the first bound, differentiate the flow once and use Gronwall.
  The second variation has zero initial data, linear coefficient at most $L$,
  and source at most $L$ times the square of the first variation.
  Variation of constants bounds it by $integral_0^s e^(L \( s - r \)) L e^(2 L r) thin d r$,
  and hence by $n L e^(3 L n)$. The inverse is the flow of $- V \( s - r \, dot.op \)$ over the reversed interval,
  which obeys the same derivative bounds. These estimates are uniform over all initial points;
  they do not require following the selected machine execution.

During the two active intervals of block $n$, define the scalar that would evolve without diffusion:

#[#set math.equation(numbering: n => "(17)")
 $ w^0 \( t \, Y \) =
   cases(delim: "{", theta \( \( t - t_n \) \/ delta_n \) g_n \( Y \) \, & t_n lt.eq t lt.eq t_n + delta_n \,,
   g_n \( Psi_(s_n \( t \))^(- 1) \( Y \) \) \, & t_n + delta_n lt.eq t lt.eq t_n + 2 delta_n .)
   $ <eq:inviscid-reference>]

The endpoint flatness and phase collars make these expressions agree smoothly.
  They satisfy $w_t^0 + a dot.op nabla w^0 = h$. The chain rule and (16) bound the Hessian during stirring by

$ C b_n^(- 2) R^(2 n) + C b_n^(- 1) n L R^(3 n) . $

Taking the trace costs at most two. Since $b_n < 1$ and $R gt.eq 1$, the result is at most $D_n$ from (10);
  the injection bound is smaller. Subtracting the inviscid equation from the diffusive one shows that
  $w^(upright("new")) - w^0$ has zero initial data and source $Delta w^0$. Lemma 3 gives

#[#set math.equation(numbering: n => "(18)")
 $ parallel w^(upright("new")) - w^0 parallel_oo lt.eq 2 delta_n D_n < 1 / 50 < 1 / 16 $ <eq:burst-error>]

throughout the injection and stirring intervals.

Suppose first that $Psi_k \( p \) in E$ for an integer $k gt.eq 0$. Choose $n gt.eq max { 1 \, k }$.
  At the stirring time with $s_n \( t \) = k$, the reference at $Y = Psi_k \( p \)$ equals $g_n \( p \) = 1$.
  The old part is nonnegative, so (18) gives $w \( t \, Y \) > 15 \/ 16 > 1 \/ 2$.
  This proves the first implication of Theorem 2.

Now suppose the orbit stays at distance at least $2 d$ from $E$.
  Every point of the reference support lies within distance

$ sqrt(2) thin b_n R^n = sqrt(2) thin 10^(- 6) 2^(- n) < 1 \/ 32 lt.eq d $

of $Psi_(s_n \( t \)) \( p \)$ during stirring. The same bound follows directly during injection.
  The reference support is therefore at distance at least $d$ from $E$ at every active time.
  In particular, $w^0 = 0$ on $E$, and

#[#set math.equation(numbering: n => "(19)")
 $ w \( t \, Y \) lt.eq H M_0 + 1 \/ 16 wide \( Y in E \) $ <eq:active-exclusion>]

during injection and stirring.

At the end of stirring, the reference still has this separation and, by area preservation,
  has mass $integral g_n$. During the wait, the new part is the heat evolution of that reference plus the heat
  evolution of an error with supremum norm below $1 \/ 16$.
  The latter bound is preserved; Lemma 4 bounds the former contribution on $E$ by $H integral g_n$.
  Including the old part gives

#[#set math.equation(numbering: n => "(20)")
 $ w \( t \, Y \) lt.eq 2 H M_0 + 1 \/ 16 < 1 \/ 2 wide \( Y in E \) . $ <eq:wait-exclusion>]

The last inequality holds for both pairs in (9). Before the first block $w = 0$.
  Equations (19) and (20) cover all later times and every endpoint, proving the second implication.

=== 3.4 Effective prescription and physical viscosity <effective-prescription-and-physical-viscosity>

For a computably supplied $t gt.eq 0$, choose rational $q$ with $\| q - t \| lt.eq 1$ and put $N_t = max { 1 \,
  ceil.l \( q + 1 \) \/ 2 ceil.r }$. Every summand of (12) with $n >
  N_t$ starts after $t$ and vanishes there with all derivatives.
  The remaining sum is finite, and its $n$th term contains only $n$ translates of $V_0$.
  Effective derivative bounds give $L \, C$, and hence all scales.
  No comparison of an exact real with a block boundary is needed:
  near zero, derivatives of $b$ are polynomial factors times $e^(- 1 \/ r)$,
  and $s^m e^(- s) lt.eq \( m + j \) ! s^(- j)$ bounds their tails effectively.
  Also $b \( r \) + b \( 1 - r \) gt.eq e^(- 2)$. These estimates give effective evaluation of the smooth profiles
  even at undecidable endpoint equalities. Periodic charts are evaluated by finite supersets of their possibly
  active translates.

The force formula repeatedly uses the same whole-period processor, which contains all its local branches.
  Increasing $n$ asks the flow to perform more periods, not the force evaluator to determine the visited
  configurations. In particular evaluation of $f$ never uses the unknown scalar $w$.

For a positive computable physical viscosity $nu$, set

#[#set math.equation(numbering: n => "(21)")
 $ U_nu \( t \, Y \, z \) = \( nu a \( nu t \, Y \) \, w \( nu t \, Y \) \) \, wide
   f_nu \( t \, Y \, z \) = \( nu^2 F \( nu t \, Y \) \, nu h \( nu t \, Y \) \) . $ <eq:compact-viscosity>]

Every horizontal equation acquires the factor $nu^2$, and every vertical term the factor $nu$.
  Thus direct substitution gives viscosity $nu$ with pressure zero.
  The vertical threshold and mass are unchanged apart from the time parameter.
  The time intervals $delta_n$ and the waits above are measured in unit-viscosity time;
  their physical lengths are divided by $nu$. Smoothness, effective evaluation and finite-time uniqueness persist.
  For an arbitrary positive real $nu$, the same formulas have the corresponding oracle-relative interpretation.
  This completes the proof of Theorem 2.

== 4 The fixed torus detector <sec:compact-application>

We now supply the geometric input and complete the first part of Theorem 1.
  The planar processor theorem in #cite(label("stationary2026")) Theorem 4.1 effectively constructs from a machine
  and its input a smooth one-periodic Hamiltonian field $V$ on $bb(T)^2$, zero in phase collars,
  supported in a compact subset of the open unit square. Its initial point is exactly
  $p = \( 1 \/ 4 \, 1 \/ 4 \)$. At integer phases the orbit follows the full closed rectangles of the reversible
  compiler. If the machine halts, an integer-phase point enters

$ E = { \( x \, y \) : 1 \/ 32 < y < 1 \/ 8 } $

at distance at least $1 \/ 32$ from its boundary. If the machine does not halt, the complete trajectory,
  including each intermediate routing segment, satisfies $3 \/ 16 lt.eq y lt.eq 7 \/ 8$.
  The circle distance from this corridor to $E$ is at least $1 \/ 16$.
  The same theorem supplies effective global first- and second-derivative bounds,
  and its quantitative flow statement supplies both forward and inverse bounds;
  alternatively (16) follows directly from (8).

Take $d = 1 \/ 32$ and $H = 10^9$. The nonhalting distance is at least $2 d$,
  and the integer halting entry satisfies the other alternative in Theorem 2.
  Its two implications are therefore exactly the equivalence in (2).
  All injections are inside a fixed small square about $\( 1 \/ 4 \, 1 \/ 4 \)$,
  and the horizontal force uses only derivatives and products of $V$.
  Thus their union is contained in one compact $K subset \( 0 \, 1 \)^2$, fixed for this prescription.
  The pressure is zero and the scalar construction gives the global smooth solution from rest.
  This proves the first part of Theorem 1.

The second quantitative specialization of the detector theorem is useful for a planar realization whose nonhalting
  orbit stays in $1 \/ 8 < x < 3 \/ 8$ and whose target is $2 \/ 3 < x < 5 \/ 6$.
  The infimum circle separation is at least

$ min { 2 \/ 3 - 3 \/ 8 \, thin 1 + 1 \/ 8 - 5 \/ 6 } = 7 \/ 24 > 1 \/ 4 . $

Consequently the hypotheses hold with $d = 1 \/ 16$, $H = 10^8$,
  whenever that realization also supplies phase collars, integer halting entry and the derivative bounds in (8).
  This is a direct specialization of the proved scalar theorem;
  it does not require importing an alternative geometric construction into the present proof.
  This specialization is applied to the planar processor of #cite(label("slowclocks2026")) Lemma 7.2 in
  #cite(label("slowclocks2026")) Section 7.5.

== 5 Bounded forcing on an expanding array <sec:bounded>

Diffusion can also be controlled by enlarging the region that carries each computational state.
  We now use this option to keep every mixed derivative of the force bounded.
  A horizontal incompressible field installs all possible transitions between finitely many addresses at each
  stage. A positive vertical impulse selects one address. The vertical velocity then obeys an advection–diffusion
  equation, and a moving cutoff measures the mass that remains near the selected computation.
  The radii grow fast enough that the cumulative diffusion loss is less than a fixed detection margin.

We prove the second part of Theorem 1, on $Omega = bb(R)^2 times bb(T)$ with the solution class (4).
  The horizontal force support will be compact on each finite interval, while the scalar has diffusion tails.
  We verify those tails in the exact comparison spaces before applying uniqueness.

=== 5.1 Finite addresses and their transitions <cbe:addresses>

The only computational input is the injective local compiler of #cite(label("stationary2026")) Lemma 3.1.
  Its output is a finite partial one-head table with states $i = 1 \, dots.h \, N$, tape alphabet $Sigma$,
  and an initial tape differing from the full blank symbol at finitely many cells.
  It has one terminal state, with no outgoing rule. Its initialized run reaches that state exactly when the
  original machine halts; otherwise every successive transition is defined.
  Every target state fixes the displacement of its incoming rules,
  and the target state together with the full written symbol identifies the incoming rule.
  The compiler first adds a nonterminal initial step, so these assertions include an input on which the original
  machine is already halted. Its history mechanism is the reversible recording method used by
  Bennett #cite(label("Bennett1973")); here we use the stated finite table,
  including its full-domain incoming-rule property.

Let $b = \| Sigma \| gt.eq 2$ and assign its symbols distinct digits $d_alpha in { 0 \, dots.h \, b - 1 }$,
  with the full blank symbol assigned zero. The integer $sum_(j gt.eq 0) d_(alpha_j)
  b^j$ encodes an eventually blank stack whose top is $alpha_0$.
  Zero tails are interpreted as infinitely many blanks. For a configuration,
  let $x$ encode the tape strictly left of the head, nearest cell first,
  and let $y$ encode the head cell and the tape to its right.
  If the rule reads $alpha$, writes $beta$ and enters state $i'$, then $d_alpha = y med mod med b$,
  and the new stacks are

#[#set math.equation(numbering: n => "(22)")
 $ upright("move") & x' & y'\
sans(R) & b x + d_beta & floor.l y \/ b floor.r\
sans(N) & x & y - d_alpha + d_beta\
sans(L) & floor.l x \/ b floor.r & d_gamma + b d_beta + b^2 floor.l y \/ b floor.r \, quad d_gamma = x med mod med
  b . $ <cbe:stack>]

These formulas push and remove exactly the indicated tape symbols.

They also give an injective map on all configurations where a rule is defined.
  The target state determines which row applies. In the right row the lowest digit of $x'$ recovers $d_beta$;
  in the stationary row the lowest digit of $y'$ does so; in the left row the second lowest digit of $y'$ does so,
  while its lowest digit recovers $d_gamma$. The compiler then identifies the old state and read symbol.
  The inverses are, respectively,

$ \( x \, y \) = #scale(x: 120%, y: 120%)[\(] \( x' - d_beta \) \/ b \, thin b y' +
  d_alpha #scale(x: 120%, y: 120%)[\)] \, wide \( x \, y \) = #scale(x: 120%, y: 120%)[\(] x' \, thin y' -
  d_beta + d_alpha #scale(x: 120%, y: 120%)[\)] \, $

and

$ \( x \, y \) = #scale(x: 120%, y: 120%)[\(] b x' + d_gamma \, thin b floor.l y' \/ b^2 floor.r +
  d_alpha #scale(x: 120%, y: 120%)[\)] . $

This proves injectivity without restricting to the initialized run.

Choose $m gt.eq 1$ effectively so that the two initial stacks are smaller than $b^m$, and define

#[#set math.equation(numbering: n => "(23)")
 $ B_n = b^(m + n) \, wide K_n = N B_n^2 = K_0 D^n \, wide D = b^2 . $ <cbe:counts>]

Every update with $0 lt.eq x \, y < B_n$ has $0 lt.eq x' \, y' < B_(n + 1)$.
  For the largest expression, in the left row,

$ y' lt.eq \( b - 1 \) + b \( b - 1 \) + b^2 \( B_n \/ b - 1 \) = b B_n - 1 . $

All other bounds follow directly from (22). At level $n$, give the triple $\( i \, x \, y \)$ the address

#[#set math.equation(numbering: n => "(24)")
 $ k = 1 + x + B_n y + B_n^2 \( i - 1 \) \, wide 1 lt.eq k lt.eq K_n . $ <cbe:address>]

Integer division recovers the triple. Thus every address with a defined instruction determines one target address
  $k'$ at level $n + 1$, and distinct defined addresses have distinct targets.
  Only this one-step lookup is used to prescribe the force.

=== 5.2 Disjoint translation gates at increasing scales <cbe:gates>

We now assign each address a square and move all defined source squares to their targets simultaneously.
  Three successive motions keep the squares separated: descent along source columns,
  horizontal motion along private rows, and vertical motion along target columns.

Use the smooth step $theta$ from Section 3.1, and put

$ Theta \( r \) = theta \( 2 r - 1 \/ 2 \) . $

The function $Theta$ makes its transition between $1 \/ 4$ and $3 \/ 4$. Introduce the scales

#[#set math.equation(numbering: n => "(25)")
 $ C_(*) & = 3000 \, & Lambda & = 4 D \, & R_0 & = 1024 C_(*) \( 1 + nu \) Lambda \( K_0 D + 2 \) \,\
R_n & = R_0 Lambda^n \, & S_n & = 16 R_n \, & T_n & = S_(n + 1) \( K_(n + 1) + 2 \) \,\
t_0 & = 1 \, & t_(n + 1) & = t_n + T_n . $ <cbe:scales>]

The constant $C_(*)$ will bound the Laplacian of a cutoff at radius $R$ by $C_(*) \/ R^2$.
  For scalar mass at most one, a stage of duration $T_n$ will therefore lose at most $nu C_(*) T_n \/
  R_n^2$ from that cutoff. The radii grow faster than the number of addresses so that these losses form a summable
  series. The durations $T_n$ are long enough for the most distant gate to move at bounded speed.
  In particular $R_n \, T_n gt.eq 1$, and $t_n gt.eq n + 1$.

Let $s_i = 1$ for the terminal state and $s_i = - 1$ for every other state. An address $k$ of state $i$ has center

$ p_(n \, k) = \( S_n k \, s_i S_n \) . $

The known initial configuration determines a center $p_(*)$ at level zero. It lies on the negative row.
  For a defined source address $k$ at level $n$, with target $k'$ in state $i'$, put

$ Y_k = - \( k + 2 \) S_n \, wide theta_j \( t \) = Theta #scale(x: 120%, y: 120%)[\(] 3 \( t - t_n \) \/
  T_n - \( j - 1 \) #scale(x: 120%, y: 120%)[\)] \, quad j = 1 \, 2 \, 3 . $

Its center path on $\[ t_n \, t_(n + 1) \]$ is

#[#set math.equation(numbering: n => "(26)")
 $ c_(n \, k \, 1) \( t \) & = \( 1 - theta_2 \( t \) \) S_n k + theta_2 \( t \) S_(n + 1) k' \,\
c_(n \, k \, 2) \( t \) & = - \( 1 - theta_1 \( t \) \) S_n + \( theta_1 \( t \) - theta_3 \( t \) \) Y_k +
  theta_3 \( t \) s_(i') S_(n + 1) . $ <cbe:path>]

It starts at $p_(n \, k)$ because every defined source is nonterminal, and it ends at $p_(n + 1 \, k')$.
  The supports of $dot(theta)_1 \, dot(theta)_2 \, dot(theta)_3$ occur in successive disjoint time slots,
  with stationary collars between them.

During the first slot, distinct centers have first coordinates separated by at least $S_n$.
  During the second, their private heights $Y_k$ are separated by at least $S_n$.
  During the third, their target first coordinates are separated by at least $S_(n + 1)$,
  by the injectivity just proved. The same separations hold through the intervening collars.
  If the target is nonterminal, every vertical segment stays at or below the source row:

#[#set math.equation(numbering: n => "(27)")
 $ c_(n \, k \, 2) \( t \) lt.eq - S_n wide \( t_n lt.eq t lt.eq t_(n + 1) \) . $ <cbe:negative>]

To realize one center path, set

$ chi \( a \) = product_(ell = 1)^2 theta \( a_ell + 3 \) theta \( 3 - a_ell \) \, wide
  nabla^perp = \( partial_(X_2) \, - partial_(X_1) \) . $

For $c = c_(n \, k)$, $G = dot(c)$ and $xi = X - c \( t \)$, define

#[#set math.equation(numbering: n => "(28)")
 $ W_(n \, k) \( t \, X \) = nabla^perp [chi \( xi \/ R_n \) \( G_1 xi_2 - G_2 xi_1 \)] . $ <cbe:gate>]

This field is divergence free, equals $G$ when $\| xi \|_oo lt.eq 2 R_n$, and vanishes when $\| xi \|_oo gt.eq
  3 R_n$. The gate supports are disjoint at each time, since their centers are separated in one coordinate by at
  least $16 R_n > 6 R_n$. Figure 2 displays the separation coordinate in each time slot.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((2, 1.08), [#text(size: 9pt)[1. Source columns]])
  line((0, 0), (4.2, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  content((0, 0), [#text(size: 7pt)[$X_2=0$]], anchor: "south-west", padding: 0.1176cm)
  line((0.7, -0.44), (0.7, -1.32), stroke: (paint: rgb("#0000a6"), thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000a6"))))
  line((3.5, -0.44), (3.5, -2), stroke: (paint: rgb("#003a00"), thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#003a00"))))
  circle((0.7, -0.44), radius: 0.05292, fill: rgb("#0000a6"), stroke: none)
  circle((3.5, -0.44), radius: 0.05292, fill: rgb("#003a00"), stroke: none)
  content((3.3, -0.44), [#text(size: 7pt)[source row]], anchor: "east", padding: 0.1176cm)
  rect((0.56, -0.992), (0.84, -0.768), fill: rgb("#e0e0ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  rect((3.36, -1.332), (3.64, -1.108), fill: rgb("#e0f0e0"), stroke: (paint: rgb("#003a00"), thickness: 0.4pt, miter-limit: 10))
  line((0.7, -2.28), (3.5, -2.28), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((2.1, -2.28), [#text(size: 7pt)[$gt.eq S_n$]], anchor: "north", padding: 0.1176cm)
  content((7.1, 1.08), [#text(size: 9pt)[2. Private rows]])
  line((5.1, 0), (9.3, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((5.8, -1.32), (7.9, -1.32), stroke: (paint: rgb("#0000a6"), thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000a6"))))
  line((8.6, -2), (6.4, -2), stroke: (paint: rgb("#003a00"), thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#003a00"))))
  circle((5.8, -1.32), radius: 0.05292, fill: rgb("#0000a6"), stroke: none)
  circle((8.6, -2), radius: 0.05292, fill: rgb("#003a00"), stroke: none)
  rect((6.71, -1.432), (6.99, -1.208), fill: rgb("#e0e0ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  rect((7.36, -2.112), (7.64, -1.888), fill: rgb("#e0f0e0"), stroke: (paint: rgb("#003a00"), thickness: 0.4pt, miter-limit: 10))
  line((9.05, -1.32), (9.05, -2), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((9.05, -1.66), [#text(size: 7pt)[$gt.eq S_n$]], anchor: "west", padding: 0.1176cm)
  content((12.2, 1.08), [#text(size: 9pt)[3. Target columns]])
  line((10.2, 0), (14.4, 0), stroke: (paint: rgb("#808080"), thickness: 0.4pt, miter-limit: 10, dash: "dashed"))
  line((13, -1.32), (13, 0.64), stroke: (paint: rgb("#0000a6"), thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#0000a6"))))
  line((11.5, -2), (11.5, -0.64), stroke: (paint: rgb("#003a00"), thickness: 0.7pt, miter-limit: 10), mark: (end: (symbol: ")>", fill: rgb("#003a00"))))
  circle((13, 0.64), radius: 0.05292, fill: rgb("#0000a6"), stroke: none)
  circle((11.5, -0.64), radius: 0.05292, fill: rgb("#003a00"), stroke: none)
  content((13.15, 0.64), [#text(size: 7pt)[terminal]], anchor: "west", padding: 0.1176cm)
  content((11.35, -0.64), [#text(size: 7pt)[nonterminal]], anchor: "east", padding: 0.1176cm)
  rect((12.86, -0.452), (13.14, -0.228), fill: rgb("#e0e0ff"), stroke: (paint: rgb("#0000a6"), thickness: 0.4pt, miter-limit: 10))
  rect((11.36, -1.432), (11.64, -1.208), fill: rgb("#e0f0e0"), stroke: (paint: rgb("#003a00"), thickness: 0.4pt, miter-limit: 10))
  line((11.5, -2.28), (13, -2.28), stroke: (thickness: 0.4pt, miter-limit: 10), mark: (start: (symbol: ")>", fill: black), end: (symbol: ")>", fill: black)))
  content((12.25, -2.28), [#text(size: 7pt)[$gt.eq S_(n+1)$]], anchor: "north", padding: 0.1176cm)
})],
  caption: [Figure 2: Two installed gates in the three successive motions of one stage (schematic, not to scale). Small squares bound instantaneous supports. Source columns, private rows and target columns separate simultaneous supports, although routes from different phases may cross. Nonterminal routes stay below $X_2 = 0$; terminal routes ascend across it. The squares do not represent the support of the diffusing scalar. ],
) <fig:translation-gates>

Let $W = 0$ on $\[ 0 \, 1 \]$, and on $\[ t_n \, t_(n + 1) \]$ sum (28) over every level-$n$ address with a
  defined rule. The sum is finite. Every gate is zero near the time-slot endpoints,
  so these formulas join smoothly, including at $t = 1$. The resulting field has compact horizontal support on
  each finite time interval and has the exact plateau property

#[#set math.equation(numbering: n => "(29)")
 $ W \( t \, X \) = dot(c)_(n \, k) \( t \) quad upright("whenever ") \| X - c_(n \, k) \( t \) \|_oo lt.eq
   R_n . $ <cbe:plateau>]

Here is why the growing array costs no derivative bound. Every coordinate used in (26) is bounded by a fixed
  multiple of $T_n$: for example, $\| Y_k \| lt.eq S_n \( K_n + 2 \) lt.eq T_n$ and $S_(n + 1) k' lt.eq T_n$.
  Therefore, for every $j gt.eq 1$,

#[#set math.equation(numbering: n => "(30)")
 $ \| c_(n \, k)^(\( j \)) \( t \) \| lt.eq C_j T_n^(1 - j) \, $ <cbe:center-bounds>]

with $C_j$ independent of $n$ and $k$. Differentiating the potential in (28) writes the gate as
  $A \( \( X - c \) \/ R_n \) dot(c)$ for a fixed smooth compactly supported matrix $A$.
  A spatial derivative contributes $R_n^(- 1)$; time derivatives contribute derivatives of $c$ divided by $R_n$,
  together with higher derivatives of $c$. Since $R_n \, T_n gt.eq 1$,
  the product and chain rules and (30) bound each fixed mixed derivative uniformly in $n \, k$.
  At most one gate contributes at a point. The same global bounds thus hold for $W$.

=== 5.3 A prescribed impulse and its scalar evolution <cbe:scalar-section>

The horizontal field is now fixed. The remaining force is a unit vertical impulse near $p_(*)$. Prescribe

#[#set math.equation(numbering: n => "(31)")
 $ f_h & = partial_t W + \( W dot.op nabla_X \) W - nu Delta_X W \,\
g \( t \, X \) & = theta' \( t \) product_(ell = 1)^2 theta' #scale(x: 120%, y: 120%)[\(]
  X_ell - \( p_(*) \)_ell + 1 \/ 2 #scale(x: 120%, y: 120%)[\)] \,\
f \( t \, X \, z \) & = \( f_h \( t \, X \) \, g \( t \, X \) \) . $ <cbe:force>]

All terms are prescribed independently of the unknown vertical velocity.
  The bounds for $W$ prove global boundedness of all mixed derivatives of $f$,
  and its horizontal support is compact on each finite time interval.
  Moreover, $g gt.eq 0$, its support lies in $0 lt.eq t lt.eq 1$ and $\| X - p_(*) \|_oo lt.eq 1 \/ 2$, and

#[#set math.equation(numbering: n => "(32)")
 $ integral_(bb(R)^2) g \( t \, X \) thin d X = theta' \( t \) . $ <cbe:impulse>]

Define $rho$ by solving

#[#set math.equation(numbering: n => "(33)")
 $ partial_t rho + W dot.op nabla_X rho = nu Delta_X rho + g \, wide rho \( 0 \, X \) = 0 . $ <cbe:scalar>]

We need integrability as well as smoothness, because both the mass test and the noncompact uniqueness argument use it.

#thm([Lemma 5.1.])[
  (Smooth scalar evolution with integrable tails).  #emph[Equation (33) has a global smooth solution.
    Every space-time derivative is continuous in time with values in $C_0 \( bb(R)^2 \) ∩ L^1 \( bb(R)^2 \)$,
    where $C_0$ denotes continuous functions tending to zero at infinity. Furthermore,
#[#set math.equation(numbering: n => "(34)")
 $ rho gt.eq 0 \, wide cal(M) \( t \) := integral_(bb(R)^2) rho \( t \, X \) thin d X = theta \( t \) lt.eq
   1 . $ <cbe:mass>]

]
] <cbe:scalar-lemma>

#proof[
  For $s > 0$, let $H_s \( X \) = \( 4 pi nu s \)^(- 1) exp \( - \| X \|^2 \/ \( 4 nu s \) \)$.
    Since $"div"_X W = 0$, the mild equation is
  #[#set math.equation(numbering: n => "(35)")
   $ rho \( t \) = integral_0^t H_(t - r) * g \( r \) thin d r -
     sum_(ell = 1)^2 integral_0^t \( partial_ell H_(t - r) \) * \( W_ell \( r \) rho \( r \) \) thin d r . $ <cbe:mild>]
  For an integer $a gt.eq 0$, let $E_a$ be the Banach space of $C^a$ functions whose derivatives of order at most
    $a$ lie in $C_0 ∩ L^1$, with norm
  $ parallel v parallel_(E_a) = sum_(\| alpha \| lt.eq a) #scale(x: 120%, y: 120%)[\(] parallel partial^alpha v
    parallel_oo + parallel partial^alpha v parallel_1 #scale(x: 120%, y: 120%)[\)] . $
  Heat convolution is a contraction on each derivative norm and is strongly continuous on $E_a$.
    The latter follows from continuity of translations in $C_0$ and $L^1$ and the approximate-identity property of
    the heat kernels. Multiplication by $W_ell \( t \)$ is a bounded operator on $E_a$,
    continuous in time in operator norm on finite intervals, by the bounded derivatives of $W$.
  The elementary estimate $parallel partial_ell H_s parallel_1 lt.eq
    C_nu s^(- 1 \/ 2)$ shows that the linear operator in the second term of (35) has norm at most $C_a
    sqrt(tau)$ on $C \( \[ 0 \, tau \] \; E_a \)$. For sufficiently small $tau$ this is a contraction.
    The same integrable kernel bound proves continuity of the time integrals at their upper endpoints.
    On a later interval one adds heat evolution of the value at its left endpoint.
    A uniform short interval length on each $\[ 0 \, T \]$ therefore constructs a solution on every finite
    interval. Uniqueness in $E_0$ identifies the solutions constructed for the different $a$.
  Put $F = g - "div"_X \( W rho \)$. The spatial regularity just proved gives $F in
    C \( \[ 0 \, T \] \; E_a \)$ for every $a$, and (35) becomes $rho \( t \) =
    integral_0^t H_(t - r) * F \( r \) thin d r$. For $v in E_(a + 2)$,
  $ frac(d, d s) \( H_s * v \) = nu H_s * Delta v $
  extends continuously to $s = 0$ in $E_a$. Differentiation under the integral gives $partial_t rho = F +
    nu Delta rho$ in every $E_a$. Repeated differentiation of this identity proves the claimed time regularity.
    In particular all smoothness statements hold one-sided at $t = 0$; the source is flat there.
  All terms of (35) are absolutely integrable in space and time.
    Integrating it and using $integral partial_ell H_s = 0$ gives $cal(M) \( t \) =
    integral_0^t theta' \( r \) thin d r = theta \( t \)$. For positivity, fix $T$ and set $v_epsilon = rho +
    epsilon \( 1 + t \)$. Continuity into $C_0$ implies uniform decay of $rho \( t \, X \)$ as $\| X \| arrow.r
    oo$ for $0 lt.eq t lt.eq T$: the image of this compact time interval is compact in $C_0$ and can be covered by
    finitely many small sup-norm balls. Hence $v_epsilon$ is positive outside one fixed compact set.
    It is also positive initially. At a first zero, attained inside that compact set,
    its time derivative is nonpositive, its gradient vanishes and its Laplacian is nonnegative.
    But its equation has source $g + epsilon > 0$, a contradiction. Letting $epsilon arrow.b 0$ proves $rho gt.eq 0$. ◻
]

We can now verify the fluid equation and its solution class. Set

#[#set math.equation(numbering: n => "(36)")
 $ u \( t \, X \, z \) = \( W \( t \, X \) \, rho \( t \, X \) \) \, wide p \( t \, X \, z \) = 0 . $ <cbe:solution>]

The divergence vanishes and $u dot.op nabla = W dot.op nabla_X$ on these $z$-independent components.
  Thus the horizontal equation is the definition of $f_h$ in (31), and the vertical equation is (33).
  Both components start from zero.

On $\[ 0 \, T \]$, the horizontal field and its derivatives have support in one compact set.
  Every derivative of $rho$ is continuous in both $L^1$ and $L^oo$ by Lemma 5. The inequality

$ parallel v parallel_2^2 lt.eq parallel v parallel_1 parallel v parallel_oo $

applied also to differences at two times gives continuity into $L^2$.
  Applying it to the spatial derivatives through order two and to $partial_t
  rho$ proves exactly the velocity regularity in (4); the same lemma gives the required bounded velocity and
  gradient. Pressure zero belongs to the stated pressure class.

The comparison argument of Section 2 now applies in exactly the established class.
  In particular, its pressure cutoff error uses $L^2$ pressure,
  and its velocity errors use the scalar’s integrable tails, not compact support of the scalar.
  It gives uniqueness among all three-dimensional competitors in (4).
  The half-plane integral is well defined by Lemma 5.

=== 5.4 A moving cutoff and the detection margin <cbe:detection>

We have constructed the force and its unique solution without following the selected computation.
  Only to prove the halting equivalence do we now follow that run. During loading put $c \( t \) = p_(*)$.
  Thereafter concatenate the paths (26) corresponding to its successive configurations,
  up to the first terminal endpoint if one occurs. Each required gate is present because of the integer-stack
  bounds and the compiler’s continuation property. The paths agree at endpoints and are stationary in endpoint collars.

An explicit test function will quantify the mass retained near $c \( t \)$.
  On $\[ 0 \, 1 \]$ put $P \( s \) = 10 s^3 - 15 s^4 + 6 s^5$,
  extending it by zero to the left and one to the right. This extension is $C^2$, takes values in $\[ 0 \, 1 \]$,
  and satisfies $\| P'' \| lt.eq 360$. Define

$ A_(*) \( s \) = P \( 2 \( 1 + s \) \) P \( 2 \( 1 - s \) \) \, wide phi_R \( a \) =
  A_(*) \( a_1 \/ R \) A_(*) \( a_2 \/ R \) . $

Then $0 lt.eq phi_R lt.eq 1$, it equals one on $\| a \|_oo lt.eq R \/ 2$, and it vanishes for $\| a \|_oo gt.eq
  R$. The transition intervals of the two factors in $A_(*)$ are disjoint; on each, the other factor equals one.
  Consequently $\| A''_(*) \| lt.eq 1440$, and

#[#set math.equation(numbering: n => "(37)")
 $ parallel Delta phi_R parallel_oo lt.eq 2880 R^(- 2) lt.eq C_(*) R^(- 2) . $ <cbe:laplacian>]

Take $R = R_0$ during loading and $R = R_n$ during the $n$th transition, and within each such interval put

$ cal(I) \( t \) = integral_(bb(R)^2) phi_R \( X - c \( t \) \) rho \( t \, X \) thin d X . $

Differentiating under the integral and integrating by parts against the compactly supported $C^2$ cutoff gives

#[#set math.equation(numbering: n => "(38)")
 $ cal(I)' \( t \) =  & integral_(bb(R)^2) #scale(x: 120%, y: 120%)[\(] \( W - dot(c) \) dot.op nabla
   phi_R \( X - c \) + nu Delta phi_R \( X - c \) #scale(x: 120%, y: 120%)[\)] rho thin d X\
 & + integral_(bb(R)^2) phi_R \( X - c \) g thin d X . $ <cbe:moving>]

The transport term vanishes exactly by (29); during loading both $W$ and $dot(c)$ are zero.
  Positivity, $cal(M) lt.eq 1$, and (37) bound the diffusion term below by $- nu C_(*) R^(- 2)$.
  The loading source is supported where $phi_(R_0) = 1$, because $R_0 gt.eq 1$; it contributes $cal(M)' \( t \)$.
  After loading the source vanishes.

There is no loss at a radius change. Indeed $R_(n + 1) gt.eq 2 R_n$,
  so the new cutoff equals one on the entire support of the previous one, with the same center at the joint.
  Nonnegativity then implies that $cal(I)$ cannot decrease at that change.
  Starting with zero mass and integrating (38) yields, at every time through the first terminal endpoint,

#[#set math.equation(numbering: n => "(39)")
 $ cal(I) \( t \) gt.eq cal(M) \( t \) - delta \, wide delta =
   nu C_(*) (R_0^(- 2) + sum_(n = 0)^oo T_n / R_n^2) < 1 / 24 . $ <cbe:loss>]

The last inequality follows directly from the chosen scales:

$ T_n / R_n^2 = frac(16 Lambda, R_0) (K_0 D \( D \/ Lambda \)^n + 2 Lambda^(- n)) . $

Here $D \/ Lambda = 1 \/ 4$ and $Lambda gt.eq 4$, so each geometric series has sum at most $4 \/ 3$. Therefore

$ nu C_(*) sum_(n gt.eq 0) T_n / R_n^2 lt.eq frac(nu, 1 + nu) frac(64, 3 dot.op 1024) < 1 / 48 . $

Also $R_0 gt.eq 1024 C_(*) \( 1 + nu \)$ gives

$ frac(nu C_(*), R_0^2) lt.eq frac(nu, 1024^2 C_(*) \( 1 + nu \)^2) < 1 / 48 . $

This proves the strict bound in (39).

At every completed level before halting, more than $3 \/ 4$ of the unit mass lies in the address square of radius
  $R_n$ about the correct center. At a terminal endpoint the preceding cutoff radius already gives that
  conclusion, and its square lies in the larger level-$n$ square.
  Other level-$n$ address squares are disjoint from this one, so none can contain mass $1 \/ 2$.
  Thus the velocity field records the intermediate configurations as well as their eventual outcome.

If the run reaches a terminal center at level $n$, its height is $S_n = 16 R_n$.
  The cutoff at arrival lies wholly in $X_2 > 0$ and captures at least $1 - delta > 3 \/ 4$ of the mass.
  Its arrival time is finite, so (3) holds. This also handles an initially halted original input:
  the compiler starts nonterminal and reaches its terminal state after the finite preliminary simulation.
  No assertion about the captured mass after the first terminal endpoint is needed for this existential event.

If the machine never halts, the loading center is on the negative row and every transition has a nonterminal
  target. By (27), the moving cutoff remains entirely in $X_2 < 0$ at every physical time. Hence

$ integral_({ X_2 > 0 }) rho \( t \, X \) thin d X lt.eq cal(M) \( t \) - cal(I) \( t \) lt.eq delta < 1 /
  24 < 1 / 4 . $

The vertical period has length one, so this integral equals the one in (3).
  The threshold $1 \/ 2$ therefore separates the two cases with a strict margin.

=== 5.5 Effective finite prescriptions <cbe:effective>

Every integer, scale, address lookup and single-rule update above is computed directly from the finite machine
  table and input. For any finite interval $\[ 0 \, T \]$, choose an integer $Q > T$.
  Since $t_n gt.eq n + 1$, only the levels $0 lt.eq n < Q$ can contribute there.
  Extend each gate by zero through its time collars. Evaluation on $\[ 0 \, T \]$ then uses a finite sum over
  those levels and their finite address sets; it requires no decision about which side of a computable real
  switching time contains the argument.

The smooth profiles and every requested derivative are effectively evaluable.
  Near a flat endpoint, derivatives of $e^(- 1 \/ r)$ are $e^(- 1 \/ r)$ times explicit polynomials in $1 \/ r$.
  The estimate $s^d e^(- s) lt.eq \( d + k \) ! s^(- k)$ supplies an effective error bound there,
  and the denominator in $theta$ is bounded below by $e^(- 2)$.
  Finite differentiation of the gate formulas gives effective bounds of every specified derivative order.
  Formula (31) is consequently a finite program for the force and its derivatives to any prescribed accuracy.

The force installs every defined one-step transition. It never follows the distinguished computation to decide
  which gate to install. The initial impulse selects its configuration;
  the subsequent solution carries the mass through the prescribed array.
  This completes the proof of the second part of Theorem 1.

=== 5.6 Effective evaluation of the scalar <cbe:scalar-effective>

The scalar can also be evaluated effectively on each finite time interval,
  including its derivatives and integrable tails. This is a stronger computability property,
  not an input to the force prescription. We give the error control because pointwise computation alone would not
  justify restarting the scalar solver on this unbounded domain. Fix a derivative order $a$ and a time bound $T$.
  Let $M_a$ be an effective bound for multiplication by each $W_ell \( t \)$ on $E_a$,
  and let $C_nu$ be a constant large enough to include the sum of both derivative-kernel bounds.
  On a step of length $h$ choose

$ q = 2 C_nu M_a sqrt(h) lt.eq 1 / 2 . $

Then the Volterra operator $B$ in the second term of (35),
  with the lower time limit replaced by the step’s initial time, has norm at most $q$.
  Write $y$ for the sum of heat evolution of the initial datum and the source integral on that step.
  The truncation $sum_(j = 0)^N B^j y$ has error at most

$ frac(q^(N + 1), 1 - q) thin parallel y parallel_(C_t E_a) . $

An initial-data error $epsilon.alt_0$ and an additional error $epsilon.alt_1$ in the integral equation,
  measured in $C_t E_a$, change its solution by at most $\( epsilon.alt_0 + epsilon.alt_1 \) \/ \( 1 - q \)$.
  All the norms used here have computable upper bounds from the finite coefficient formulas and the preceding
  step. Thus choosing $N$ and the quadrature accuracies gives a prescribed step error.
  Finitely many steps cover $\[ 0 \, T \]$, so their error budgets can be chosen backwards to achieve any
  specified final accuracy.

For completeness, the approximants carry a computable spatial-tail bound for every derivative through order $a$,
  in both supremum and $L^1$ norm. The source $g$ and each product $W_ell
  v$ have known compact support on $\[ 0 \, T \]$, even when the approximant $v$ does not.
  In a derivative-kernel integral, split the time lag at $eta > 0$.
  If $parallel v parallel_(C_t E_a) lt.eq A$, the part with lag less than $eta$ has $E_a$ norm at most $2 C_nu M_a
  A sqrt(eta)$. For lags in $\[ eta \, T \]$, derivatives of the explicit Gaussian have computable supremum and
  $L^1$ tails, uniform in that interval. Convolution with data of known compact support and known $E_a$ norm
  therefore has both tail bounds outside the support radius plus a computably chosen radius.
  The source integral is treated in the same way, with its bounded heat-kernel operator in place of the integrable
  derivative-kernel singularity.

At a restart, the exact previous scalar is not assumed compactly supported.
  Carry forward its certified $E_a$ approximant and error. Multiply that approximant by a smooth cutoff equal to
  one on a large ball. Its certified derivative tails bound the cutoff error in $E_a$ by the product rule.
  Heat convolution contracts that error, while the compactly supported truncation has explicit Gaussian tails,
  uniformly from lag zero to $h$. This supplies the homogeneous term at the next step with both its $E_a$ error
  and its tail bounds. Starting from zero, induction proves that every finite Picard approximation and every
  endpoint datum has the required effective representation.
  On the remaining compact sets, the computably smooth integrands can be integrated with derivative error bounds.
  A uniform error for each derivative on the retained spatial ball bounds its supremum error there and its $L^1$
  error by the ball’s area times that error; the certified tails control the complement.
  Time derivatives are recovered from (33).

== 6 The decision problem <sec:decision>

#thm([Corollary 6.1.])[
  #emph[There is no algorithm deciding either fixed velocity event in Theorem 1 for every force description
    produced by its respective construction.]
]

#proof[
  A decision algorithm composed with the effective force construction would decide whether an arbitrary machine
    halts on its finite input. It would in particular decide Turing’s symbol-printing problem
    #cite(label("Turing1936")) Section 8: modify the machine to halt when that symbol is printed and to continue
    forever otherwise, including after a stop without the designated printing. This is impossible. ◻
]

The pointwise and integral observations record different scalar quantities.
  The torus construction uses bumps of height one whose total mass is less than $10^(- 11)$.
  The expanding construction uses mass one and reads which half-plane contains it.
  In each case the force is a finite prescription for local operations,
  while the solution performs the computation. The quantitative diffusion estimates establish the halting
  equivalence while excluding false detections at every physical time.

#bibliography("refs.bib", style: "ieee", title: [References])
