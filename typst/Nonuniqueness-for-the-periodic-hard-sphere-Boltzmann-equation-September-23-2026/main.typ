#import "@preview/cetz:0.5.0"
#set page(paper: "us-letter", margin: (x: 80.9pt, y: 80.9pt), numbering: "1")
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

#align(center)[#text(size: 16pt, weight: "bold")[Nonuniqueness for the periodic hard-sphere Boltzmann equation]]
#align(center)[OpenAI]
#align(center)[September 23, 2026]

== 1 Introduction <sec:introduction>

We study the Cauchy problem for the hard-sphere Boltzmann equation on $Omega = bb(T)_x^3 times bb(R)_v^3$,
  where $bb(T)^3 = bb(R)^3 \/ bb(Z)^3$. A nonnegative density $F \( t \, x \, v \)$ evolves by free transport and
  binary elastic collisions:

$ \( partial_t + v dot.op nabla_x \) F = Q \( F \, F \) \, wide F \( 0 \, x \, v \) = F_0 \( x \, v \) . $

For incoming velocities $v \, v_(*)$ and a collision normal $omega in S^2$, put

$ a = \( v - v_(*) \) dot.op omega \, wide v' = v - a omega \, wide v'_(*) = v_(*) + a omega . $

Our normalization is

$ Q \( F \, F \) \( v \) = integral_(bb(R)^3 times S^2) \| a \| #scale(x: 120%, y: 120%)[\(] F \( v' \)
  F \( v'_(*) \) - F \( v \) F \( v_(*) \) #scale(x: 120%, y: 120%)[\)] thin upright(d) v_(*) thin upright(d) omega \, $

with the common variables $t \, x$ suppressed and ordinary surface area measure on $S^2$.
  The initial density is assumed to have finite mass, kinetic energy, and absolute entropy,
  meaning that $integral_Omega F_0 \( 1 + \| v \|^2 + \| log F_0 \| \) < oo$, with $0 \| log 0 \| = 0$.
  The question is whether these physical bounds and the renormalized equation determine the subsequent evolution
  uniquely.

The global existence and weak stability theory of DiPerna and Lions provides solutions at this level of
  integrability #cite(label("DiPernaLions1989")). Their entropy-production inequality explicitly includes periodic
  space #cite(label("DiPernaLions1991")); #cite(label("LevermoreMasmoudi2010")) Theorem 4.1 gives a periodic
  formulation with a Maxwellian reference density. The need for renormalization is substantive:
  the stated bounds do not themselves make the quadratic collision term locally integrable.
  Existence and weak stability do not supply uniqueness. The uniqueness problem for general renormalized solutions
  is discussed, for example, in #cite(label("Silvestre2022")) Section 2.

We use the following precise admissibility requirements, written in full in Definition 2.
  With $M \( v \) = \( 2 pi \)^(- 3 \/ 2) e^(- \| v \|^2 \/ 2)$,
  the equation is tested through $M beta \( F \/ M \)$ for every $C^1$ function $beta$ satisfying $beta \( 0 \) =
  0$ and $\| beta' \( z \) \| lt.eq C_beta \/ \( 1 + z \)$;
  the separately renormalized gain and loss are integrable on every finite time interval.
  The solution is weakly continuous in $L^1 \( Omega \)$, against every bounded measurable test,
  and takes the prescribed initial value. Its mass, energy,
  and absolute entropy remain bounded on bounded time intervals.
  It conserves local mass and total momentum and satisfies both the global energy inequality and the
  relative-entropy inequality with the full Boltzmann entropy dissipation at every time.
  Here admissibility does not require local momentum or local energy conservation.
  Our main result concerns uniqueness within this class.

#thm([Theorem 1.1.])[
  #emph[There is a nonnegative density $F_0$ on $bb(T)^3 times bb(R)^3$, with bounded velocity support and
$ integral_(bb(T)^3 times bb(R)^3) F_0 \( 1 + \| v \|^2 + \| log F_0 \| \) thin upright(d) x thin upright(d) v < oo \, $

 for which the hard-sphere Boltzmann equation has two distinct global admissible solutions,
   in the sense of Definition 2, with initial datum $F_0$. On some common initial interval both solutions are
   strongly continuous in $L^1$, and their collision gains and losses are integrable in space-time-velocity.]
] <thm:main>

The two solutions therefore obey the unrenormalized equation on the interval where their difference is
  established. Their common datum has bounded velocities but unbounded amplitudes concentrated at successively
  smaller spatial scales. The conservation and dissipation requirements remain part of the conclusion.

=== 1.1 Uniqueness and related constructions <uniqueness-and-related-constructions>

Classical uniqueness theorems impose additional control, such as Maxwellian upper bounds
  #cite(label("KanielShinbrot1978")). For periodic cutoff hard potentials,
  Ukai’s perturbative theory gives global existence and uniqueness near a Maxwellian in a velocity-weighted
  spatial Sobolev class, with mass, momentum, and energy matched to that Maxwellian #cite(label("Ukai1974"))
  Theorem 1.2.

The distinction between spatially homogeneous and inhomogeneous evolution is also important.
  For the homogeneous hard-sphere equation, Mischler and Wennberg prove uniqueness in a conservative class from
  finite mass and energy alone #cite(label("MischlerWennberg1999")) Theorem 1.1.
  Wennberg’s homogeneous nonuniqueness examples for hard potentials permit increasing energy
  #cite(label("Wennberg1999")). Theorem 1 instead concerns a spatially inhomogeneous datum,
  with the energy and entropy-dissipation inequalities retained.

Recent instability constructions give another relevant comparison.
  Chen and Holmer prove failure of uniform continuity in weighted Sobolev spaces for the constant collision kernel
  #cite(label("ChenHolmer2024")) Theorem 1.3; Chen, Guo, Shen,
  and Zhang establish failure of uniform continuity for the hard-sphere solution map on $bb(R)_x^3 times
  bb(R)_v^3$, in Gaussian-weighted $L_v^2 H_x^s$ spaces for $0 lt.eq
  s < 1$ #cite(label("ChenGuoShenZhang2026")) Theorem 1.1. Those results compare solutions with arbitrarily close
  initial data. Here the two initial data agree exactly, on periodic space,
  and both resulting solutions satisfy the admissibility conditions above.
  The instability in #cite(label("ChenGuoShenZhang2026")) is driven by collision loss and dispersion.
  In the construction below, collision gain amplifies a vanishing hot seed and produces a nonzero weak limit near
  the initial spatial singularity.

For the related Krieger–Strain model, Gismondi, Golding, and Novack construct rough stationary solutions in a
  mollifier-confluent sense: the collision operators of mollified densities tend to zero in distributions for
  every nonnegative Schwartz mollifier of mass one #cite(label("GismondiGoldingNovack2026")) Definition 1.3 and
  Theorem 1.5. They also conjecture nonuniqueness of renormalized inhomogeneous Landau and Boltzmann solutions for
  a dense class of initial data. Theorem 1 concerns one periodic hard-sphere datum in the specified admissibility class.

=== 1.2 One datum and two approximation families <one-datum-and-two-approximation-families>

Write $x = \( y \, z \) in bb(R)^2 times bb(R)$ in a lift of the torus,
  and $v = \( macron(v) \, v_3 \) in bb(R)^2 times bb(R)$. The datum consists of narrow velocity distributions,
  called cold jets, near the axial directions $plus.minus e_3$.
  They occupy transverse annuli of geometrically decreasing radii $s_j arrow.b 0$.
  Within each annulus the two velocity signs occupy disjoint, finely alternating stripes.
  Their thermal widths are much smaller than the stripe gaps.
  An expanding axial velocity profile bounds the spatial density of each freely transported jet at scale $s$ by
  $C \/ \( t + s \)$. Annular mass is $O \( s^2 \)$, and annular absolute entropy is
  $O \( s^2 \( 1 + \| log s \| \) \)$, so all scales together define a single finite-entropy datum.

Assign a color to each cold jet. A collision within one color retains that color;
  collisions between different colors, or with particles already declared hot, produce hot particles.
  This is an exact decomposition: the sum of the colored equations is the Boltzmann equation.
  The narrow velocity distributions suppress self-collisions,
  and the spatial gaps suppress collisions between distinct cold jets at early times.

Retain the first $N$ annuli and impose a collision cutoff that is removed as $N arrow.r oo$.
  Let $h_N$ denote the hot component. The estimates use an integrable velocity weight $H \( v \)$,
  Gaussian at infinity and locally comparable to $\| macron(v) \|^(- q)$ near the velocity axis, with $1 < q < 2$.
  A #emph[cap] is an almost-everywhere upper bound on $h_N \/ H$.
  The two approximation families have the following properties:

+ With no hot particles initially, the hot density remains bounded by $t^2 H \( v \)$. We call this the dormant family.
+ For every sufficiently short observation horizon $T > 0$, a smooth hot seed of vanishing mass, energy,
  and entropy can be selected so that $h_N lt.eq \( t + s_N \) H$ on $\[ 0 \, T \]$,
  with equality in the weighted essential supremum at some time. Here $s_N$ is the smallest retained annular radius.

At each fixed horizon, uniform integrability of both the densities and their two-particle products gives
  admissible limits with exactly the same initial datum. A vanishing seed and a cap hit alone do not imply that
  these limits differ: the hit might carry arbitrarily little mass.
  Excluding that loss of information is the central step.

=== 1.3 From a cap hit to separation <from-a-cap-hit-to-separation>

Along a sequence of observation horizons shrinking to zero,
  rescale time and space at a cap time $t_(* \, N)$ by $r_N = t_(* \, N) + s_N$,
  and divide the hot density by $r_N$. The resulting cap is of order one.
  The cold density has a different normalization: multiplying it by $r_N$ produces a locally bounded velocity
  measure at positive times. Its two axial velocity signs coexist in the limit because the increasingly fine
  spatial stripes average to their occupied fractions. Strong convergence of hot velocity averages identifies the
  cold–hot product. This use of velocity averaging follows the uniformly integrable formulation of
  #cite(label("GolseLionsPerthameSentis1988")) Proposition 3.
  The limit obeys a linear Boltzmann equation in that two-sign background.
  This dilation is distinct from the fixed-horizon compactness used to construct admissible solutions.

To show that the dilated hot limit is nonzero, we analyze normalized Carleman gain kernels.
  Carleman’s representation expresses a collision gain as an integral over velocity planes;
  its normalization here is derived in Section 3. Iterated-gain regularization has an earlier role in the
  homogeneous theory #cite(label("MischlerWennberg1999")) Lemma 2.1.
  In the present construction the estimates must be uniform as the cold velocity distributions collapse onto the
  axis, despite the singularity of $H$. Two complementary arguments provide this control.
  Near the velocity axis, two successive gains have vanishing normalized mass:
  the first has a uniformly non-atomic axial input, while a second large gain would force that input to match a
  small collection of characteristic cold speeds. Away from the axis, five gains suffice.
  Their times and angular parameters map to final time, position, and velocity with rank seven almost everywhere.
  A compact submersion argument then turns vanishing local hot mass into a vanishing gain contribution.
  Together these facts prevent the cap hit from disappearing in the weak limit.

The limiting hot equation also has a branching interpretation.
  A hot particle colliding with a cold jet creates two hot outputs.
  We retain finite collision histories with bounded velocities and show that their mass grows by a fixed factor
  inside an expanding spatial box. If the dilated observation horizon were infinite,
  this growth would exceed the polynomial mass bound supplied by the cap.
  The horizon is therefore finite, so the cap scale remains comparable to the physical observation horizon along
  the extracted sequence.

Finally, the dormant solution vanishes off the velocity axis under the corresponding shrinking-horizon dilation.
  If cap limits agreed with it at arbitrarily small fixed horizons,
  a diagonal choice of approximants would force the nonzero dilated hot limit to vanish as well.
  This contradiction yields two distinct early solutions of the original equation with the same datum.
  The periodic existence theorem then continues each solution globally while preserving admissibility.
  Figure 1 separates the two compactness procedures and their roles in this final comparison.

#figure(
  [#cetz.canvas({
  import cetz.draw: *
  content((0, 0), [#box(width: 5.223cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.55pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[One cold-jet datum $F_0$#linebreak()finite mass, energy,#linebreak()and entropy]]])])
  content((-3.05, -1.8), [#box(width: 5.223cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.55pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[No hot seed#linebreak()$h_N lt.eq t^2H$]]])])
  content((3.05, -1.8), [#box(width: 5.223cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.55pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Vanishing hot seed#linebreak()$h_N lt.eq (t+s_N)H$, with a cap hit]]])])
  content((-3.05, -3.7), [#box(width: 5.223cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.55pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Fixed-horizon limit#linebreak()admissible solution $F^( upright(d) )$]]])])
  content((3.05, -3.7), [#box(width: 5.223cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.55pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Fixed-horizon limit#linebreak()admissible cap solution]]])])
  content((-3.05, -5.9), [#box(width: 5.223cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.55pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Shrinking-horizon dilation#linebreak()vanishes off the velocity axis]]])])
  content((3.05, -5.9), [#box(width: 5.223cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.55pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Dilation of cap approximants#linebreak()nonzero hot limit $g$]]])])
  content((3.05, -8), [#box(width: 5.223cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.55pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "bounds", bottom-edge: "bounds"); #align(center)[#text(size: 9pt)[Branching in the#linebreak()limiting background#linebreak()finite dilated horizon $U$]]])])
  content((0, -10.2), [#box(width: 5.223cm, inset: 0.2117cm, radius: 2pt, stroke: (thickness: 0.55pt, miter-limit: 10), [#set text(hyphenate: false, top-edge: "cap-height", bottom-edge: "baseline"); #align(center)[#text(size: 9pt)[Same-datum solutions differ#linebreak()then continue each globally]]])])
  line((-1.255, -0.7407), (-2.136, -1.26), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((1.255, -0.7407), (2.109, -1.244), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((-3.05, -2.34), (-3.05, -3.184), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((3.05, -2.356), (3.05, -3.153), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((5.662, -1.8), (6.05, -1.8), (6.05, -5.9), (5.662, -5.9), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((3.05, -6.447), (3.05, -7.29), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((-3.05, -4.216), (-3.05, -5.353), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((-3.05, -6.447), (-3.05, -10.2), (-2.612, -10.2), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((0.4383, -3.7), (0, -3.7), (0, -9.653), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
  line((3.05, -8.71), (3.05, -10.2), (2.612, -10.2), stroke: (thickness: 0.55pt, miter-limit: 10), mark: (end: (symbol: ">>", fill: black)))
})],
  caption: [Figure 1: Proof structure. At each fixed physical horizon, the two approximation families yield admissible solutions with the same initial datum. Separately, cap approximants on shrinking horizons are dilated about a cap hit. Nonconcentration preserves a nonzero hot limit, and branching prevents its scale from vanishing relative to the horizon along the extracted sequence. These facts contradict equality with the dormant limit, whose corresponding dilation vanishes off the velocity axis. ],
) <fig:proof-route>

=== 1.4 Organization <organization>

Section 2 gives the full admissibility definition and the colored equations.
  Section 3 establishes uniform collision-kernel estimates,
  and Section 4 constructs the datum and controls its cold components.
  Section 5 selects the approximation families; Section 6 constructs their fixed-horizon limits and verifies
  admissibility. Section 7 identifies the dilated linear equation,
  and Section 8 proves that its hot limit is nonzero. Section 9 excludes an infinite dilated horizon.
  Section 10 completes the same-datum comparison and global continuation.

== 2 Equation, admissibility, and notation <sec:framework>

The spatial torus $bb(T)^3 = bb(R)^3 \/ bb(Z)^3$ has volume one, and $Omega = bb(T)_x^3 times bb(R)_v^3$.
  We write $x = \( y \, z \)$, with two transverse coordinates $y$ and one axial coordinate $z$,
  and $v = \( macron(v) \, v_3 \)$. In a periodic lift these coordinates range in $bb(R)^2 times bb(R)$.
  All spatially rescaled limits below are taken in the lift.
  We write $D_t = partial_t + v dot.op nabla_x$ for free transport.

For incoming velocities $v \, v_(*)$ and $omega in S^2$, set

$ a = \( v - v_(*) \) dot.op omega \, wide v' = v - a omega \, wide v'_(*) = v_(*) + a omega . $

The surface measure on $S^2$ is its ordinary area measure. We use

#[#set math.equation(numbering: n => "(2.1)")
 $ Q \( F \, F \) & = Q^(+) \( F \, F \) - Q^(-) \( F \, F \) \,\
Q^(+) \( F \, F \) \( v \) & = integral_(bb(R)^3 times S^2) \| a \| F \( v' \) F \( v'_(*) \) thin upright(d)
  v_(*) thin upright(d) omega \,\
Q^(-) \( F \, F \) \( v \) & = F \( v \) nu_F \( v \) . $ <eq:collision>]

Arguments $t \, x$, identical in every factor, are suppressed.
  The associated symmetric gain is denoted $P \( f \, g \)$, so that $P \( F \, F \) = Q^(+) \( F \, F \)$.
  Its symmetry in the hard-sphere normalization is included in Lemma 3. The loss frequency is

#[#set math.equation(numbering: n => "(2.2)")
 $ nu_f \( v \) = 2 pi integral_(bb(R)^3) \| v - w \| f \( w \) thin upright(d) w . $ <eq:frequency>]

A superscript $b$ on $P \, nu \, Q$ means that the same factor $upright(bold(1))_({ \| v - v_(*) \| < b })$ is
  inserted into gain and loss. This cutoff is invariant under elastic collision.

Put

$ M \( v \) = \( 2 pi \)^(- 3 \/ 2) e^(- \| v \|^2 \/ 2) \, wide G = F \/ M \, $

and define

$ cal(H)_M \( F \) = integral_Omega #scale(x: 120%, y: 120%)[\(] F log \( F \/ M \) - F +
  M #scale(x: 120%, y: 120%)[\)] thin upright(d) x thin upright(d) v . $

The entropy dissipation is

$ cal(D) \( F \) = 1 / 4 integral_(bb(T)^3 times bb(R)^3 times bb(R)^3 times S^2) \| a \|
  thin \( F' F'_(*) - F F_(*) \) log frac(F' F'_(*), F F_(*)) thin upright(d) x thin upright(d) v thin upright(d)
  v_(*) thin upright(d) omega . $

The nonnegative integrand is assigned its lower-semicontinuous extended value when a factor vanishes.
  We use $0 \| log 0 \| = 0$.

#prodef([Definition 2.1.])[
  (Entropy-class solution).  For a nonnegative datum $F_0$ satisfying
  $ integral_Omega F_0 \( 1 + \| v \|^2 + \| log F_0 \| \) thin upright(d) x thin upright(d) v < oo \, $
  an admissible global solution is a nonnegative $F$ with the following properties.
  + $F in C_w \( \[ 0 \, oo \) \; L^1 \( Omega \) \)$, with $F \( 0 \) = F_0$,
    where weak continuity means continuity against every bounded measurable test.
    On each bounded time interval, $integral_Omega F \( 1 + \| v \|^2 + \| log F \| \)$ is uniformly bounded.
  + $Q^plus.minus \( F \, F \) \/ \( 1 + G \)$ belong to $L^1 \( \[ 0 \, T \] times Omega \)$ for every finite
    $T$. For every $beta in C^1 \( \[ 0 \, oo \) \)$ with $beta \( 0 \) = 0$ and $\| beta' \( z \) \| lt.eq
    C_beta \/ \( 1 + z \)$, and every smooth test $phi \( t \, x \, v \)$ periodic in $x$ and compactly supported
    in $\[ 0 \, oo \) times bb(R)_v^3$,
    $ & integral_0^oo #h(-0.16667em) #h(-0.16667em) integral_Omega #scale(x: 120%, y: 120%)[\[] M
      beta \( G \) \( partial_t phi + v dot.op nabla_x phi \) +
      beta' \( G \) Q \( F \, F \) phi #scale(x: 120%, y: 120%)[\]] thin upright(d) x thin upright(d) v thin
      upright(d) t\
 & #h(2cm)  + integral_Omega M beta \( F_0 \/ M \) phi \( 0 \, x \, v \) thin upright(d) x thin upright(d) v = 0 . $
  + With $rho = integral F thin upright(d) v$ and $j = integral v F thin upright(d) v$, $partial_t rho +
    nabla_x dot.op j = 0$ distributionally with the initial density $integral F_0 thin upright(d) v$.
    Total momentum is conserved. For every $t gt.eq 0$,
    $ integral_Omega \| v \|^2 F \( t \) lt.eq integral_Omega \| v \|^2 F_0 \, wide cal(H)_M \( F \( t \) \) +
      integral_0^t cal(D) \( F \( s \) \) thin upright(d) s lt.eq cal(H)_M \( F_0 \) . $
] <def:admissible>

The same definition on a finite interval uses tests and traces on that interval.
  We use the global existence theory #cite(label("DiPernaLions1989")) #cite(label("DiPernaLions1991"))
  #cite(label("LevermoreMasmoudi2010")) only to continue solutions already constructed on a short interval.
  In particular, we do not require local momentum or local energy conservation as additional admissibility conditions.

=== 2.1 A velocity weight and colored components <a-velocity-weight-and-colored-components>

Fix $1 < q < 2$ and $m = 100$. The weight used throughout is

#[#set math.equation(numbering: n => "(2.3)")
 $ H \( v \) = e^(- \| v \|^2) chevron.l v chevron.r^(- m) #scale(x: 120%, y: 120%)[\(] 1 + \| macron(v) \|^(- q)
   #scale(x: 120%, y: 120%)[\)] \, wide chevron.l v chevron.r = \( 1 + \| v \|^2 \)^(1 \/ 2) . $ <eq:weight>]

Its values on the velocity axis can be assigned arbitrarily;
  all weighted supremum estimates are essential estimates. It is integrable with every polynomial velocity weight
  and lies in $L^p$ for some $p > 1$. Write $parallel f parallel_H =
  "ess sup"_(x \, v) \| f \( x \, v \) \| \/ H \( v \)$.

The cold components are $c_i$, their sum is $c$, and $h$ denotes the hot component.
  Particles retain a cold label only in collisions within that label. All other collisions create hot particles.
  With $F = c + h$, this gives

#[#set math.equation(numbering: n => "(2.4)")
 $ \( D_t \) c_i & = P \( c_i \, c_i \) - c_i nu_F \,\
\( D_t \) h & = 2 P \( c \, h \) + P \( h \, h \) + sum_(i eq.not j) P \( c_i \, c_j \) - h nu_F . $ <eq:colored>]

The sum over $i eq.not j$ is ordered. Summing these equations gives $\( D_t \) F = Q \( F \, F \)$.
  This identity also holds with a common collision cutoff. When labels include periodic copies,
  the individual functions are defined in the lift and are covariant under translations; their sums are periodic.

Constants denoted $C$, with or without subscripts, may depend on the fixed construction parameters.
  They never depend on the approximation index or the shrinking time horizon unless explicitly stated.
  The parameters needed for branching growth will be fixed before the final small geometric and time parameters.
  Section 9 records the order of choices.

== 3 Collision kernels and a velocity majorant <ker:section>

The construction in the next section uses cold velocity distributions with arbitrarily small transverse widths.
  We seek bounds for $P \( c \, H \) \/ H$ that remain uniform as those widths tend to zero,
  together with a bound for $P \( H \, H \) \/ H$. The later nonconcentration argument needs more than bounded
  total gain: it also needs control of the complete normalized measure in the cold and hot input velocities.
  We obtain both kinds of estimates below.

Write $v = \( macron(v) \, v_3 \) in bb(R)^2 times bb(R)$ and set

$ W \( v \) = 1 + \| macron(v) \|^(- q) \, wide H \( v \) =
  e^(- \| v \|^2) chevron.l v chevron.r^(- m) W \( v \) \, wide 1 < q < 2 \, quad m = 100 \, $

as in (2.3). Values on the velocity axis are irrelevant to all the almost-everywhere estimates below.
  The function $H$ has every polynomial moment and belongs to $L^p \( bb(R)^3 \)$ whenever $1 lt.eq p < 2 \/ q$.
  Indeed, its only local singularity is $\| macron(v) \|^(- q)$ in two dimensions,
  and its decay at infinity is Gaussian.

=== 3.1 The exact Carleman formula <the-exact-carleman-formula>

The hyperplane representation used here is a Carleman formula;
  see also #cite(label("GambaPanferovVillani2009")) Appendix C.
  We derive its coefficient for the normalization of this paper.

#thm([Lemma 3.1.])[
  (Collision geometry).  #emph[For the normalization in (2.1), the symmetric bilinear gain is
#[#set math.equation(numbering: n => "(3.1)")
 $ P \( c \, h \) \( v \) = 2 integral_(bb(R)^3) c \( p \) thin thin upright(d) p integral_(bb(R)^3) delta
   #scale(x: 120%, y: 120%)[\(] \( v - p \) dot.op \( xi - v \) #scale(x: 120%, y: 120%)[\)] h \( xi \) thin thin
   upright(d) xi . $ <ker:carleman>]

 For fixed $p eq.not v$, the inner delta denotes surface measure on the plane $\( v - p \) dot.op \( xi - v \) =
   0$, divided by $\| v - p \|$. For incoming velocities $p \, xi$,
   the outgoing measure has total mass $2 pi \| p - xi \|$ and is uniform on the sphere with diameter
   $\[ p \, xi \]$. Formula (3.1) also defines the gain when $c$ is a nonnegative velocity measure and $h$ is a
   nonnegative density, whenever the displayed integral is finite almost everywhere.]
] <lem:carleman>

#proof[
  Put $g = p - xi$. Reflection sends $g$ to $g - 2 \( g dot.op omega \) omega$.
    On either hemisphere of the normal sphere, the change from the polar angle of $omega$ to the reflected
    direction shows that $\| g dot.op omega \| thin thin upright(d) omega$ pushes forward to $\( \| g \| \/ 4 \)
    thin thin upright(d) sigma$. The two hemispheres therefore give $\( \| g \| \/ 2 \) thin thin upright(d)
    sigma$, where $sigma in S^2$ is the outgoing relative direction.
    Equivalently, for every nonnegative test function $psi$, the one-output measure is
  #[#set math.equation(numbering: n => "(3.2)")
   $ frac(\| p - xi \|, 2) integral_(S^2) psi (frac(p + xi, 2) + frac(\| p - xi \|, 2) sigma) thin upright(d)
     sigma . $ <ker:sphere-law>]
  Its mass is $2 pi \| p - xi \|$. The affine map in this integral multiplies surface area by $\| p -
    xi \|^2 \/ 4$, so the density on its image sphere is $2 \/ \| p - xi \|$.
  The same sphere is the zero set of $f \( v \) = \( v - p \) dot.op \( xi - v \)$.
    On that sphere, $\| nabla_v f \( v \) \| = \| p - xi \|$.
    The coarea formula consequently identifies the measure in (3.2) with $2 delta \( f \( v \) \) thin thin
    upright(d) v$. Integration against the two incoming densities and Tonelli’s theorem give (3.1).
    The usual pre/post-collisional change of variables identifies this incoming-pair expression with the gain in
    (2.1). Coincident incoming velocities have zero collision rate.
    The same identities can first be integrated against a velocity measure $c \( thin upright(d) p \)$,
    proving the asserted extension. ◻
]

The cutoff gain obtained by inserting $upright(bold(1))_(\| p - xi \| < b)$ is bounded by the uncut gain.
  Thus all upper estimates in this section also hold for the collision cutoffs used later.

=== 3.2 A geometric slice estimate <a-geometric-slice-estimate>

For $d > 0$, let $cal(G)_d$ be the centered transverse Gaussian probability measure with density

$ frac(1, pi d^2) e^(- \| macron(p) \|^2 \/ d^2) \, $

and let $cal(G)_0 = delta_0$. We shall also use the uniform probability measure $cal(U)_d$ on ${ macron(p) : \|
  macron(p) \| < d }$.

#thm([Lemma 3.2.])[
  (Transverse averaging and axial slices).  #emph[Let $lambda$ be a probability mixture of the measures
    $cal(U)_d$, $d > 0$, and $delta_0$, and let $rho$ be any axial probability measure.
    No bound on its density or its support is required. Put $c = lambda ⊗ rho$.
    For $R gt.eq 1$, $macron(v) eq.not 0$, and an interval $I subset bb(R)$ of length $0 < ell lt.eq 2 R$, one has
#[#set math.equation(numbering: n => "(3.3)")
 $ & frac(1, W \( v \)) integral c \( thin upright(d) p \) integral_(\| xi - v \| lt.eq R) delta
   #scale(x: 120%, y: 120%)[\(] \( v - p \) dot.op \( xi - v \) #scale(x: 120%, y: 120%)[\)] W \( xi \) thin thin
   upright(d) xi lt.eq C_q R^2 \,\
 & frac(1, W \( v \)) integral c \( thin upright(d) p \) integral_(\| xi - v \| lt.eq R\
xi_3 in I) delta #scale(x: 120%, y: 120%)[\(] \( v - p \) dot.op \( xi - v \) #scale(x: 120%, y: 120%)[\)]
  W \( xi \) thin thin upright(d) xi lt.eq C_q #scale(x: 120%, y: 120%)[\(] R ell +
  R^(q - 1) ell^(2 - q) #scale(x: 120%, y: 120%)[\)] . $ <ker:geometric-total>]

 The constants are independent of all transverse widths and of $rho$.
   In particular, these statements hold with $lambda = cal(G)_d$ for every $d gt.eq 0$.]
] <ker:geometric-slice>

#proof[
  Set $r = \| macron(v) \|$, $n = macron(v) - macron(p)$, and $e_n = n \/ \| n \|$.
    Except on a set of transverse measure zero, $n eq.not 0$.
    For fixed $p_3 \, xi_3$, the delta in the transverse variables is line measure divided by $\| n \|$,
    on a line whose signed distance from zero is
  $ A - B \( xi_3 - v_3 \) \, wide A = e_n dot.op macron(v) \, quad B = frac(v_3 - p_3, \| n \|) . $
  The regular part of its integral over $\| xi - v \| lt.eq R$ is at most $2 R \/ \| n \|$.
    The singular part is bounded by its integral over the full line, namely
  #[#set math.equation(numbering: n => "(3.4)")
   $ frac(1, \| n \|) integral_(bb(R)) #scale(x: 120%, y: 120%)[\(] \( A - B \( xi_3 - v_3 \) \)^2 +
     s^2 #scale(x: 120%, y: 120%)[\)]^(- q \/ 2) thin thin upright(d) s = frac(a_q, \| n \|) \| A -
     B \( xi_3 - v_3 \) \|^(1 - q) \, $ <ker:line-integral>]
  where $a_q = integral_(bb(R)) \( 1 + s^2 \)^(- q \/ 2) thin thin upright(d) s < oo$ because $q > 1$.
    Infinite values on a zero-distance slice are harmless in the nonnegative iterated integral.
  For every interval $J subset \[ - R \, R \]$ of length at most $ell$,
  #[#set math.equation(numbering: n => "(3.5)")
   $ integral_J \| A - B x \|^(1 - q) thin thin upright(d) x lt.eq
     C_q R^(q - 1) ell^(2 - q) \| A \|^(1 - q) . $ <ker:scalar-interval>]
  If $2 R \| B \| lt.eq \| A \|$, the integrand is at most $C_q \| A \|^(1 - q)$,
    and the assertion follows from $ell lt.eq 2 R$. Otherwise,
    integration about the possible root gives an upper bound $C_q \| B \|^(1 - q) ell^(2 - q)$; since $1 -
    q < 0$ and $\| B \| > \| A \| \/ \( 2 R \)$, this proves (3.5).
    When $A = 0$ the displayed upper bound is understood in the extended sense.
  We next prove
  #[#set math.equation(numbering: n => "(3.6)")
   $ integral frac(1 + \| e_n dot.op e_(macron(v)) \|^(1 - q), \| n \|) thin
     lambda \( thin upright(d) macron(p) \) lt.eq C_q / r . $ <ker:transverse-expectation>]
  It suffices to consider a disk of radius $d$. If $d lt.eq r \/ 2$, then $\| n \| gt.eq
    r \/ 2$ and $e_n dot.op e_(macron(v)) gt.eq 1 \/ 3$, which proves the bound.
    If $d > r \/ 2$, use polar coordinates for $n$. Its range lies in $\| n \| < r + d < 3 d$.
    The factor $\| n \|^(- 1)$ cancels the radial Jacobian, while
  $ integral_0^(2 pi) #scale(x: 120%, y: 120%)[\(] 1 + \| cos theta \|^(1 - q) #scale(x: 120%, y: 120%)[\)] thin
    thin upright(d) theta < oo $
  because $q < 2$. Division by the disk area gives $C_q \/ d lt.eq 2 C_q \/ r$.
    The point mass at zero satisfies the same estimate directly.
    Finally, the Gaussian is a probability mixture of these disks:
    for $d > 0$ its mixture density in the disk radius $a$ is
  $ frac(2 a^3, d^4) e^(- a^2 \/ d^2) thin thin upright(d) a \, $
  whose integral is one. This proves the Gaussian assertion as well.
  Integrating (3.4) in $xi_3$, applying (3.5), and then (3.6), bounds the expression in (3.3) by
  $ C_q R ell frac(r^(- 1), 1 + r^(- q)) + C_q R^(q - 1) ell^(2 - q) frac(r^(- q), 1 + r^(- q)) . $
  Both fractions are bounded for $q > 1$. These bounds are independent of $p_3$,
    so integration against the arbitrary probability $rho$ preserves them.
    Taking the entire axial range of length $2 R$ also gives (3.3). ◻
]

=== 3.3 Sheets and normalized kernel measures <sheets-and-normalized-kernel-measures>

#prodef([Definition 3.3.])[
  (Uniform sheet class).  Fix $L gt.eq 1$. An elementary sheet in $cal(S)_L$ is a product probability measure
  #[#set math.equation(numbering: n => "(3.7)")
   $ c \( thin upright(d) p \) = cal(G)_d \( thin upright(d) macron(p) \) rho \( thin upright(d) p_3 \) \, wide
     0 lt.eq d lt.eq 1 / 8 \, wide integral_(bb(R)) e^(8 a^2) rho \( thin upright(d) a \) lt.eq
     L . $ <ker:sheet-definition>]
  We also allow probability mixtures of elementary sheets. An upper bound by a sheet with amplitude $A_0$ means
    domination as measures by $A_0$ times such a mixture.
] <ker:sheet-class>

Every axial probability supported in $\[ - A \, A \]$ satisfies this definition with $L = e^(8 A^2)$.
  In particular, axial atoms and limits of arbitrarily narrow axial densities are permitted.
  The exponential moment is used only to remove large axial velocities, and imposes no axial regularity.

For such a sheet and $macron(v) eq.not 0$, define its normalized kernel by

#[#set math.equation(numbering: n => "(3.8)")
 $ cal(K)_c \( v \; thin upright(d) p thin thin upright(d) xi \) =
   2 thin c \( thin upright(d) p \) thin delta #scale(x: 120%, y: 120%)[\(] \( v - p \) dot.op \( xi - v \)
   #scale(x: 120%, y: 120%)[\)] frac(H \( xi \), H \( v \)) thin thin upright(d) xi . $ <ker:normalized-kernel>]

The total mass is $P \( c \, H \) \( v \) \/ H \( v \)$. Kernel restrictions always refer to this complete
  measure, including the ratio $H \( xi \) \/ H \( v \)$.

#thm([Lemma 3.4.])[
  (Uniform sheet gain bound).  #emph[For every $L < oo$ there is $C_(q \, m \, L) < oo$ such that
#[#set math.equation(numbering: n => "(3.9)")
 $ P \( c \, H \) \( v \) lt.eq C_(q \, m \, L) H \( v \) quad upright("for almost every ") v \, wide
   c in cal(S)_L . $ <ker:sheet-gain>]

 More quantitatively, for $R gt.eq 1$,
#[#set math.equation(numbering: n => "(3.10)")
 $ cal(K)_c #scale(x: 120%, y: 120%)[\(] v \; R < \| p \| + \| xi - v \| lt.eq
   2 R #scale(x: 120%, y: 120%)[\)] lt.eq C_(q \, m \, L) R^2 e^(- c R^2) \, $ <ker:shell-tail>]

 where $c > 0$ is an absolute constant. The same conclusions, multiplied by $A_0$,
   hold under sheet domination with amplitude $A_0$.]
] <lem:sheet-bound>

#proof[
  By positivity it suffices to treat an elementary sheet. Put $k = xi - v$ and $w = p + k$. On the collision plane,
  #[#set math.equation(numbering: n => "(3.11)")
   $ \| p \|^2 + \| xi \|^2 = \| v \|^2 + \| w \|^2 \, wide frac(H \( xi \), H \( v \)) =
     e^(\| p \|^2 - \| w \|^2) frac(chevron.l v chevron.r^m, chevron.l xi chevron.r^m)
     frac(W \( xi \), W \( v \)) . $ <ker:energy-factor>]
  The same identity implies $chevron.l v chevron.r lt.eq chevron.l p chevron.r chevron.l xi chevron.r$.
    Since $chevron.l p chevron.r^m lt.eq C_m e^(\| p \|^2)$, the kernel is bounded by
  #[#set math.equation(numbering: n => "(3.12)")
   $ C_m e^(2 \| p \|^2) c \( thin upright(d) p \) thin e^(- \| w \|^2) delta
     #scale(x: 120%, y: 120%)[\(] \( v - p \) dot.op k #scale(x: 120%, y: 120%)[\)] frac(W \( v + k \), W \( v \))
     thin thin upright(d) k . $ <ker:tilted-kernel>]
  The tilted cold measure retains a product majorant. For $0 < d lt.eq 1 \/ 8$,
  #[#set math.equation(numbering: n => "(3.13)")
   $ e^(2 \| macron(p) \|^2) cal(G)_d \( thin upright(d) macron(p) \) lt.eq
     4 e^(- 46 \| macron(p) \|^2) cal(G)_(2 d) \( thin upright(d) macron(p) \) . $ <ker:transverse-tilt>]
  This follows by dividing the two Gaussian densities: their ratio is $4
    exp \[ - \( 3 \/ \( 4 d^2 \) - 2 \) \| macron(p) \|^2 \]$, and $3 \/ \( 4 d^2 \) - 2 gt.eq 46$.
    The assertion at $d = 0$ has the evident interpretation. The axial tilted measure
    $tilde(rho) \( thin upright(d) a \) = e^(2 a^2) rho \( thin upright(d) a \)$ has mass at most $L$, and satisfies
  #[#set math.equation(numbering: n => "(3.14)")
   $ tilde(rho) { \| a \| > u } lt.eq L e^(- 6 u^2) \, wide u gt.eq 0 . $ <ker:axial-tilt-tail>]
  Consequently $e^(2 \| p \|^2) c \( thin upright(d) p \)$ is bounded by $4
    L$ times a product of a centered transverse Gaussian and an axial probability.
    Moreover, its restriction to $\| p \| > u$ is bounded by $C L
    e^(- c u^2)$ times a sum of at most two such product probabilities.
    To see the last assertion, split into $\| macron(p) \| > u \/ sqrt(2)$ and $\| p_3 \| > u \/ sqrt(2)$,
    and apply (3.13) and (3.14), respectively. The axial probabilities obtained by normalization may have large
    support; Lemma 4 permits this.
  On the shell in (3.10), either $\| p \| > R \/ 4$ or $\| w \| > R \/ 2$, because $\| p \| + \| k \| lt.eq
    2 \| p \| + \| w \|$. In the first case the preceding tilted-measure tail contributes $C L e^(- c R^2)$.
    In the second case $e^(- \| w \|^2) lt.eq e^(- R^2 \/ 4)$.
    In either case the remaining integral has $\| k \| lt.eq 2 R$ and is bounded by $C_q R^2$ using Lemma 4.
    This proves (3.10). The base region $\| p \| + \| k \| lt.eq
    2$ is bounded by the same geometric lemma and the total tilted mass.
    Summing the dyadic shells proves (3.9) and also the finiteness of (3.8). ◻
]

The sheet gain bound controls total normalized mass. We next control its velocity tails and its behavior as the
  outgoing velocity approaches the axis. The key distinction is that the hot input can concentrate transversely on
  the axis while its axial marginal remains uniformly non-atomic.

#thm([Lemma 3.5.])[
  (Uniform tightness and axis estimates).  #emph[Fix $L < oo$.
    The following conclusions hold uniformly for $c in cal(S)_L$ and for outgoing velocities off the axis.]
  + #emph[The tails in $\| p \| + \| xi - v \|$ are uniformly negligible:
#[#set math.equation(numbering: n => "(3.15)")
 $ lim_(R arrow.r oo) sup_(c in cal(S)_L) "ess sup"_v cal(K)_c \( v \; \| p \| + \| xi - v \| > R \) =
   0 . $ <ker:uniform-tail>]

 Also,
#[#set math.equation(numbering: n => "(3.16)")
 $ lim_(M arrow.r oo) sup_(c in cal(S)_L) "ess sup"_(\| v \| > M) cal(K)_c \( v \; bb(R)^3 times bb(R)^3 \) =
   0 . $ <ker:large-output>]

]
  + #emph[For every fixed $M \, delta > 0$,
#[#set math.equation(numbering: n => "(3.17)")
 $ & lim_(epsilon arrow.b 0) sup_(c in cal(S)_L) "ess sup"_(\| v \| lt.eq M\
0 < \| macron(v) \| lt.eq epsilon) cal(K)_c \( v \; \| macron(xi) \| gt.eq delta \) = 0 \,\
 & lim_(epsilon arrow.b 0) sup_(c in cal(S)_L) "ess sup"_(\| v \| lt.eq M\
0 < \| macron(v) \| lt.eq epsilon) cal(K)_c \( v \; \| v_3 - p_3 \| gt.eq delta \) = 0 . $ <ker:axis-input>]

]
  + #emph[The axial input marginals are uniformly non-atomic.
    More precisely, for each $R gt.eq 1$ and each interval $I$ of length $0 < ell lt.eq 1$,
#[#set math.equation(numbering: n => "(3.18)")
 $ cal(K)_c \( v \; \| p \| + \| xi - v \| lt.eq R \, med xi_3 in I \) lt.eq
   C_(q \, m \, L \, R) #scale(x: 120%, y: 120%)[\(] ell + ell^(2 - q) #scale(x: 120%, y: 120%)[\)] .
   $ <ker:axial-interval>]

 In combination with (3.15), this gives
#[#set math.equation(numbering: n => "(3.19)")
 $ lim_(ell arrow.b 0) sup_(c in cal(S)_L) "ess sup"_v sup_(\| I \| lt.eq ell) cal(K)_c \( v \; xi_3 in I \) =
   0 . $ <ker:axial-modulus>]

]
  + #emph[Let $cal(S)_L \( epsilon \)$ denote the subclass whose elementary transverse widths are at most
    $epsilon$. For every $M < oo$ and $r_0 > 0$,
#[#set math.equation(numbering: n => "(3.20)")
 $ lim_(delta arrow.b 0) limsup_(epsilon arrow.b 0) sup_(c in cal(S)_L \( epsilon \)) "ess sup"_(\| v \| lt.eq M\
\| macron(v) \| gt.eq r_0) cal(K)_c \( v \; \| macron(xi) \| < delta \) = 0 . $ <ker:off-axis-small-input>]

]
  #emph[All these conclusions hold under uniformly bounded sheet amplitudes.]
] <lem:kernel-tightness>

#proof[
  The dyadic estimate (3.10) proves (3.15). We may consequently work on $\| p \| + \| k \| lt.eq
    R$ and remove that restriction at the end of each argument.
    On this region the exponential and polynomial factors in (3.11) are bounded by a constant depending on $R$.
  For (3.16), if $\| macron(v) \| > 2 R + 1$, then $\| macron(v) -
    macron(p) \| gt.eq \| macron(v) \| \/ 2$ and $\| macron(xi) \| gt.eq \| macron(v) \| - R$.
    The transverse line estimate, followed by the axial integration over a length at most $2 R$,
    gives $C_R \/ \| macron(v) \|$. If $\| v_3 \| > 2 R + 1$, integrate the delta in $xi_3$ instead.
    Its divisor is $\| v_3 - p_3 \| gt.eq \| v_3 \| \/ 2$, and
  #[#set math.equation(numbering: n => "(3.21)")
   $ sup_(a in bb(R)^2) integral_(\| zeta - a \| lt.eq R) \( 1 + \| zeta \|^(- q) \) thin thin upright(d) zeta
     lt.eq C_q \( R^2 + R^(2 - q) \) . $ <ker:disk-singularity>]
  For completeness, if $\| a \| lt.eq 2 R$ the disk is contained in the disk of radius $3 R$ about zero;
    if $\| a \| > 2 R$, then $\| zeta \| > \| a \| \/ 2 > R$ on the disk, giving the same bound.
    We obtain $C_R \/ \| v_3 \|$. At least one of the two outgoing components becomes large with $\| v \|$,
    proving (3.16).
  For (3.17), on $\| macron(xi) \| gt.eq delta$ the factor $W \( xi \)$ is bounded by $1 + delta^(- q)$.
    The regular line estimate and (3.6) therefore give
  $ C_(R \, delta) frac(\| macron(v) \|^(- 1), 1 + \| macron(v) \|^(- q)) lt.eq
    C_(R \, delta) \| macron(v) \|^(q - 1) wide \( 0 < \| macron(v) \| lt.eq 1 \) . $
  For (3.17), integrate in $xi_3$ first, using $\| v_3 - p_3 \|^(- 1) lt.eq delta^(- 1)$ and (3.21).
    The bound is $C_(R \, delta) \/ W \( v \) lt.eq C_(R \, delta) \| macron(v) \|^q$.
    These are uniform in the axial law. For (3.18), discard the bounded exponential and polynomial factors and
    apply (3.3). This also proves (3.19) after the tail removal.
  It remains to prove (3.20). Fix the truncation radius $R$.
    The part $\| macron(p) \| > r_0 \/ 4$ is uniformly negligible as the transverse widths tend to zero. Indeed,
  $ upright(bold(1))_(\| macron(p) \| > r_0 \/ 4) cal(G)_d \( thin upright(d) macron(p) \) lt.eq
    2 e^(- r_0^2 \/ \( 32 d^2 \)) cal(G)_(sqrt(2) d) \( thin upright(d) macron(p) \) \, $
  and Lemma 6 applies to the wider Gaussian for all sufficiently small $d$.
    Now retain $\| macron(p) \| lt.eq r_0 \/ 4$. With the notation of Lemma 4,
  $ \| n \| gt.eq 3 / 4 r_0 \, wide A =
    frac(\( macron(v) - macron(p) \) dot.op macron(v), \| macron(v) - macron(p) \|) gt.eq 3 / 5 r_0 . $
  If $\| v_3 - p_3 \| lt.eq r_0^2 \/ \( 8 R \)$, then for $\| xi_3 - v_3 \| lt.eq R$,
  $ \| B \( xi_3 - v_3 \) \| lt.eq 1 / 6 r_0 . $
  The transverse collision line stays at distance greater than $r_0 \/ 3$ from zero,
    and cannot meet $\| macron(xi) \| < delta$ when $delta < r_0 \/ 3$.
    In the complementary case, $\| v_3 - p_3 \|^(- 1) lt.eq 8 R \/ r_0^2$.
    Integrating first in $xi_3$ bounds the small-input contribution by
  $ C_(R \, r_0) integral_(\| macron(xi) \| < delta) \( 1 + \| macron(xi) \|^(- q) \) thin thin upright(d)
    macron(xi) lt.eq C_(R \, r_0) \( delta^2 + delta^(2 - q) \) . $
  First let the widths tend to zero, then $delta$ tend to zero, and finally remove the truncation.
    This proves the last assertion. ◻
]

=== 3.4 Gaussian parameter laws and compressed axial maps <gaussian-parameter-laws-and-compressed-axial-maps>

The next formulation records the uniformity needed when a cold profile is parameterized before its axial change of
  variables.

#thm([Lemma 3.6.])[
  (Gaussian parameter tails).  #emph[Let a measure in parameters $w = \( macron(w) \, w_3 \) in bb(R)^2 times
    bb(R)$ have density $j$ satisfying
$ 0 lt.eq j \( w \) lt.eq C_0 pi^(- 3 \/ 2) e^(- \| w \|^2) . $

 Let its velocity image be given by
#[#set math.equation(numbering: n => "(3.22)")
 $ macron(p) = d macron(w) \, wide p_3 = Phi \( w_3 \) \, wide 0 lt.eq d lt.eq 1 / 16 \,
   wide \| Phi \( a \) \| lt.eq A + delta \| a \| \, quad 0 lt.eq delta lt.eq 1 / 16 \, $ <ker:parameter-map>]

 where $Phi$ is merely measurable. The image measure is dominated by $C_0$ times a sheet in $cal(S)_(L_A)$,
   with $L_A$ depending only on $A$. Its gain satisfies Lemma 6 with a constant depending only on $q \, m \, A \, C_0$.]
  #emph[If $c_(> B)$ is the image of the restricted parameter measure $upright(bold(1))_(\| w \| > B) j \( w \)
    thin thin upright(d) w$, then
#[#set math.equation(numbering: n => "(3.23)")
 $ "ess sup"_v frac(P \( c_(> B) \, H \) \( v \), H \( v \)) lt.eq C_(q \, m \, A \, C_0) e^(- B^2 \/ 2) \, wide
   B gt.eq 0 . $ <ker:parameter-tail>]

 Thus parameter truncations are valid in the normalized collision measure,
   even when $Phi$ compresses intervals or has atoms in its image law.
   Probability mixtures of measurable families with common $q \, m \, A \,
   C_0$ and the width bounds in (3.22) preserve these assertions.
   More generally, a positive mixing measure of total mass $B_0 <
   oo$ multiplies the domination amplitude and quantitative upper bounds by $B_0$;
   the sheet parameter $L_A$ is unchanged. For (3.23), impose the restriction $\| w \| >
   B$ in each component before mixing. Additional measurable masks taking values in $\[ 0 \, 1 \]$ preserve the
   assertions.]
] <ker:parameter-sheets>

#proof[
  The Gaussian majorant is a product measure. Its transverse image is $cal(G)_d$,
    and its axial image is the probability $rho = Phi_(*) \( pi^(- 1 \/ 2) e^(- a^2) thin thin upright(d) a \)$.
    There is no need to differentiate or invert $Phi$. From (3.22),
  $ e^(8 \| Phi \( a \) \|^2) lt.eq e^(16 A^2) e^(16 delta^2 a^2) . $
  Even under the wider axial probability $\( 2 pi \)^(- 1 \/ 2) e^(- a^2 \/ 2) thin thin upright(d) a$,
    the integral of the right side is
  $ e^(16 A^2) \( 1 - 32 delta^2 \)^(- 1 \/ 2) lt.eq 2 e^(16 A^2) . $
  We may therefore take $L_A = 2 e^(16 A^2)$ for both the original and the wider parameter laws.
    The original image has the required sheet domination.
  On the parameter tail,
  $ upright(bold(1))_(\| w \| > B) e^(- \| w \|^2) lt.eq e^(- B^2 \/ 2) e^(- \| w \|^2 \/ 2) . $
  After normalization the right side is $2^(3 \/ 2) e^(- B^2 \/ 2)$ times a Gaussian probability with parameter
    widths enlarged by $sqrt(2)$. Its transverse velocity width is at most $sqrt(2) \/ 16 < 1 \/ 8$,
    and its axial image has the exponential moment just proved. Lemma 6 applied to this dominating image gives (3.23).
  For a probability mixture, mix the dominating sheets just constructed; this is again a member of $cal(S)_(L_A)$.
    If the mixing measure has mass $B_0 > 0$, normalize it by $B_0$ and retain that factor in the domination
    amplitude. If $B_0 = 0$, the mixed image is zero. The same argument applied to the wider Gaussian majorants of
    the component tails proves the asserted factor in (3.23).
    Thus the estimates are uniform over families of mixtures whose masses $B_0$ have a common finite bound
    independent of the tail cutoff. Masks taking values in $\[ 0 \, 1 \]$ only decrease the measures,
    whether imposed before or after the pushforward. ◻
]

For example, suppose an axial velocity is determined by $p_3 = a \( z - t p_3 \) + d w_3$,
  where $a$ is nondecreasing, and $u$ solves $u = a \( z - t u \)$.
  The function $p mapsto p - a \( z - t p \)$ is increasing with inverse Lipschitz constant at most one. Hence

#[#set math.equation(numbering: n => "(3.24)")
 $ \| p_3 - u \| lt.eq d \| w_3 \| . $ <ker:compressed-displacement>]

If $\| u \| lt.eq A$, Lemma 8 applies. A large Jacobian compression of the axial law does not affect its
  constants. Gaussian majorants with any fixed positive exponent in place of one are covered by a fixed rescaling
  of the parameters and a corresponding decrease of the upper bounds on the physical widths.

=== 3.5 The hot–hot gain <the-hothot-gain>

#thm([Lemma 3.7.])[
  (Quadratic gain bound).  #emph[There is a constant $C_(q \, m)$ such that
#[#set math.equation(numbering: n => "(3.25)")
 $ P \( H \, H \) lt.eq C_(q \, m) H quad upright("almost everywhere") . $ <ker:hot-gain>]

 In fact the proof below works for every $m > 5$.]
] <lem:hot-bound>

#proof[
  The integrand is symmetric in $p \, xi$. On the collision plane, $\| v \|^2 lt.eq \| p \|^2 + \| xi \|^2$,
    so at least one incoming speed is at least $\| v \| \/ 2$.
    It suffices, at a factor of two, to retain $\| xi \| gt.eq \| v \| \/ 2$. Formula (3.11) now gives
  #[#set math.equation(numbering: n => "(3.26)")
   $ frac(P \( H \, H \) \( v \), H \( v \)) & lt.eq C_m integral_(\| xi \| gt.eq \| v \| \/ 2) delta
     #scale(x: 120%, y: 120%)[\(] \( v - p \) dot.op \( xi - v \) #scale(x: 120%, y: 120%)[\)]
     e^(- \| p + xi - v \|^2) chevron.l p chevron.r^(- m) frac(W \( p \) W \( xi \), W \( v \)) thin thin
     upright(d) p thin thin upright(d) xi \, $ <ker:hot-reduced>]
  because $chevron.l v chevron.r^m \/ chevron.l xi chevron.r^m lt.eq 2^m$.
  Again write $k = xi - v$ and $w = p + k$. On $R < \| p \| + \| k \| lt.eq 2 R$, $R gt.eq 1$,
    either $\| p \| > R \/ 4$ or $\| w \| > R \/ 2$. Consequently
  #[#set math.equation(numbering: n => "(3.27)")
   $ chevron.l p chevron.r^(- m) e^(- \| w \|^2) lt.eq C_m R^(- m) e^(- \| w \|^2 \/ 2) . $ <ker:hot-shell-weight>]
  In the second alternative this uses the finite supremum of $s^m e^(- s^2 \/ 2)$;
    in the first it follows directly from the polynomial factor.
  The measure $W \( p \) upright(bold(1))_(\| p \| lt.eq 2 R) thin thin upright(d) p$ is dominated by
  $ #scale(x: 120%, y: 120%)[\(] 1 + \| macron(p) \|^(- q) #scale(x: 120%, y: 120%)[\)]
    upright(bold(1))_(\| macron(p) \| lt.eq 2 R) thin thin upright(d) macron(p) med ⊗ med
    upright(bold(1))_(\| p_3 \| lt.eq 2 R) thin thin upright(d) p_3 . $
  Its transverse factor is a positive mixture of centered disks. Indeed, for $D > 0$,
  $ \| macron(p) \|^(- q) upright(bold(1))_(\| macron(p) \| lt.eq D) =
    D^(- q) upright(bold(1))_(\| macron(p) \| lt.eq D) + q integral_0^D a^(- q - 1)
    upright(bold(1))_(\| macron(p) \| lt.eq a) thin thin upright(d) a $
  almost everywhere. Upon normalizing the disks, the mixture has total mass $pi D^2 +
    2 pi D^(2 - q) \/ \( 2 - q \)$. The axial factor has mass $4 R$.
    For $D = 2 R$ the resulting product mixture therefore has total mass at most $C_q R^3$.
  Discard $e^(- \| w \|^2 \/ 2)$ and the incoming-speed restriction in (3.26).
    Apply Lemma 4 to each normalized product in this mixture, with $\| k \| lt.eq 2 R$.
    In conjunction with (3.27), this yields the shell estimate
  #[#set math.equation(numbering: n => "(3.28)")
   $ frac(P \( H \, H \) \( v \), H \( v \)) \|_(R < \| p \| + \| xi - v \| lt.eq 2 R) lt.eq
     C_(q \, m) R^(5 - m) . $ <ker:hot-shell>]
  The notation on the left denotes the restricted nonnegative integral from (3.26),
    including its fixed symmetry factor. The base region is bounded by the same disk-mixture argument with $R =
    1$. Summation over dyadic $R$ proves the result for $m > 5$. ◻
]

#prodef([Remark 3.8.])[
  (A sharp axial endpoint).  A single normalized gain need not become small as the outgoing velocity approaches
    the axis. Take $c = delta_(\( 0 \, 0 \, u \))$ and $v_epsilon = \( epsilon \, 0 \, u \)$.
    The collision plane is $xi_1 = epsilon$, and
  $ frac(P \( c \, H \) \( v_epsilon \), H \( v_epsilon \)) =
    frac(2, epsilon H \( v_epsilon \)) integral_(bb(R)^2) H \( epsilon \, y \, z \) thin thin upright(d) y thin
    thin upright(d) z . $
  The regular part of $W \( epsilon \, y \, z \)$ contributes $O \( epsilon^(q - 1) \)$.
    In its singular part substitute $y = epsilon s$. Dominated convergence,
    with dominating function $\( 1 + s^2 \)^(- q \/ 2) e^(- z^2) chevron.l z chevron.r^(- m)$, gives
  $ lim_(epsilon arrow.b 0) frac(P \( c \, H \) \( v_epsilon \), H \( v_epsilon \)) =
    2 a_q e^(u^2) chevron.l u chevron.r^m integral_(bb(R)) e^(- z^2) chevron.l z chevron.r^(- m) thin thin
    upright(d) z > 0 . $
  The corresponding axial input marginal converges to the absolutely continuous measure
  $ 2 a_q e^(u^2) chevron.l u chevron.r^m e^(- z^2) chevron.l z chevron.r^(- m) thin thin upright(d) z . $
  Thus transverse concentration is compatible with the uniform axial interval estimate.
    This is the reason for using two successive gains in the axial part of the later nonconcentration argument.
] <ker:matching-axis>

== 4 Cold jets and uniform color estimates <jet:section>

We construct the common finite-entropy datum and bound each cold color by its free transport plus a small
  Maxwellian remainder. Narrow velocity profiles control self-collisions,
  while spatial gaps make collisions between distinct colors small.
  These estimates supply the cold density bound and the mixed-cold source bound used to select the hot caps in
  Section 5.

The estimates in this section hold for every fixed choice

$ K gt.eq 1 \, wide 0 < eta lt.eq log 2 \, wide 0 < alpha lt.eq 1 / 4 \, wide 0 < gamma lt.eq 1 . $

These four parameters will subsequently be fixed by the growth argument.
  Here we choose the geometric and thermal parameters after them.
  To keep the later shortening of the time interval separate from the estimates, fix the preliminary bounds

#[#set math.equation(numbering: n => "(4.1)")
 $ overline(s) = 1 / 8 \, wide overline(T) = 1 / 32 \, wide 0 < s_0 lt.eq overline(s) \, wide 0 < T_0 lt.eq
   overline(T) . $ <jet:preliminary>]

All estimates proved below hold on the preliminary interval $\[ 0 \, overline(T) \]$.
  Their constants do not change when $T_0$ is subsequently decreased.
  They may depend on the fixed parameters and on the fixed function $J$,
  but never on the number of retained annuli, the collision cutoff, or the size of the hot component.

=== 4.1 The geometry and the datum <the-geometry-and-the-datum>

Put

$ s_j = s_0 e^(- j eta) \, wide p_j = s_j^2 \, wide c_eta = frac(e^eta - 1, 16) \, wide delta_j = c_eta /
  4 s_j^2 \, wide j gt.eq 1 . $

For $s = s_j$, define the annular core and the two stripe patterns by

$ A_j & = { y in bb(R)^2 : s_j + c_eta p_j < \| y \| < e^eta s_j - c_eta p_j } \,\
P_j^(+) & = union.big_(k in bb(Z)) { y : k p_j < y_1 < \( k + 1 / 4 \) p_j } \,\
P_j^(-) & = union.big_(k in bb(Z)) { y : \( k + 1 / 2 \) p_j < y_1 < \( k + 3 / 4 \) p_j } \,\
E_j^sigma & = A_j ∩ P_j^sigma \, wide sigma in { - 1 \, + 1 } . $

Each stripe pattern has period $p_j$ and fraction $theta = 1 \/ 4$.
  This is a statement about the periodic pattern: intersecting it with the annulus need not preserve the fraction
  exactly. We retain the original sets $E_j^sigma$ in the datum.

Let

$ hat(E)_j^sigma = { y : "dist" \( y \, E_j^sigma \) lt.eq delta_j } \, wide a = 1 / 8 \, wide b_(upright("sp")) =
  1 / 16 . $

For a label $i = \( j \, sigma \, n \)$, $n = \( macron(n) \, n_3 \) in bb(Z)^3$, set

#[#set math.equation(numbering: n => "(4.2)")
 $ cal(O)_i \( t \) = \( hat(E)_j^sigma + macron(n) \)
   times \[ n_3 - a - 2 t - b_(upright("sp")) \, n_3 + a + 2 t + b_(upright("sp")) \] . $ <jet:enlargements>]

These enlargements will only localize upper bounds; they will not replace the stripe masks when their average is
  computed.

#thm([Lemma 4.1.])[
  (Disjoint enlargements).  #emph[For $0 lt.eq t lt.eq overline(T)$,
    the sets $cal(O)_i \( t \)$ are pairwise disjoint. Moreover,
$ hat(E)_j^sigma subset { s_j < \| y \| < e^eta s_j } subset B \( 0 \, s_0 \) . $

 At each point of the periodic lift there is therefore at most one label whose enlargement contains that point.]
] <jet:geometry>

#proof[
  Opposite stripe patterns at the same scale have distance at least $p_j \/ 4$, whereas $2 delta_j =
    c_eta p_j \/ 2 < p_j \/ 4$. The radial gap between the cores for the adjacent scales $s_j$ and $s_(j + 1)$ is
  $ c_eta \( p_j + p_(j + 1) \) > delta_j + delta_(j + 1) . $
  The gaps between nonadjacent cores are larger. Enlarging by $delta_j < c_eta
    p_j$ still leaves the $j$-th set inside its original open annulus.
    This proves disjointness of all the untranslated transverse enlargements.
    They lie in $B \( 0 \, s_0 \)$, so their distinct integer translates are disjoint as well. Finally,
  $ a + 2 overline(T) + b_(upright("sp")) = 1 / 4 . $
  The axial intervals belonging to distinct integers $n_3$ are disjoint.
    These two observations prove the assertion for the products in (4.2). ◻
]

Fix a nonnegative smooth probability density $J$, supported in the unit ball of $bb(R)^3$. Write

$ S \( ell \) = "sech"^2 ell \, wide a_s^sigma \( z \) = sigma + alpha tanh \( gamma z \/ s \) \, wide d_s =
  d_0 s^10 . $

The positive parameter $d_0 lt.eq 1$ will be decreased below finitely many times. In particular, we require that

#[#set math.equation(numbering: n => "(4.3)")
 $ d_0 overline(s)^10 lt.eq 1 / 64 \, wide overline(T) d_0 overline(s)^8 lt.eq c_eta \/ 8 . $ <jet:thermal-preliminary>]

The width $1 \/ 64$, including the fixed Gaussian widenings used below, lies within the range of Lemma 6.
  For $i = \( j \, sigma \, n \)$, with $s = s_j$, define on the lift

$ c_i^0 \( x \, v \) = upright(bold(1))_(E_j^sigma) \( y - macron(n) \)
  upright(bold(1))_(\( - a \, a \)) \( z - n_3 \) K / s S #h(-0.16667em) (frac(gamma \( z - n_3 \), s)) d_s^(- 3)
  J #h(-0.16667em) (frac(v - a_s^sigma \( z - n_3 \) e_3, d_s)) . $

The periodic datum is

#[#set math.equation(numbering: n => "(4.4)")
 $ F_0 \( x \, v \) = sum_(j gt.eq 1) sum_(sigma = plus.minus 1) sum_(n in bb(Z)^3)
   c_(\( j \, sigma \, n \))^0 \( x \, v \) . $ <eq:datum>]

At a given spatial point at most one summand is nonzero. Integer translations permute the labels,
  so the sum is periodic.

#thm([Lemma 4.2.])[
  (Integrability of the datum).  #emph[The datum (4.4) satisfies
$ integral_Omega F_0 \( 1 + \| v \|^2 + \| log F_0 \| \) thin thin upright(d) x thin thin upright(d) v < oo . $

 Its truncations $F_0^(\( N \))$, retaining $j lt.eq N$, converge to $F_0$ in mass, energy, and relative entropy.
   In addition, if $chi gt.eq 0$ is a fixed bounded smooth compactly supported function of $\( x \, v \)$,
   periodized after replacing $x$ by $x \/ s_N$, and $0 lt.eq lambda_N lt.eq L_0 < oo$, then
$ F_0^(\( N \)) + lambda_N s_N chi \( x \/ s_N \, v \) $

 has the same limiting mass, energy, and relative entropy as $F_0$.
   For the last assertion $s_0$ may be decreased so that distinct periodic copies of the spatial support of the
   seed are disjoint.]
] <lem:datum>

#proof[
  Integration over one period and summation over integer copies equal integration of each unshifted prototype over
    $bb(R)_x^3$. The transverse area of $E_j^sigma$ is at most $C_eta s_j^2$, and
  $ integral_(- a)^a S \( gamma z \/ s \) thin thin upright(d) z lt.eq s /
    gamma integral_(bb(R)) S \( ell \) thin thin upright(d) ell = frac(2 s, gamma) . $
  The velocity factor integrates to one. Thus the mass of each annular sign prototype is at most $C s^2$.
    Its velocities satisfy
  $ \| v \| lt.eq 1 + alpha + d_s < 2 \, $
  which gives the same bound for its energy.
  On the set where the density is positive, decompose its logarithm into the three terms
  $ log \( \( K \/ s \) d_s^(- 3) \) \, wide log S \( gamma z \/ s \) \, wide log J \( w \) . $
  The first has absolute value at most $C \( 1 + \| log s \| \)$. The second is integrable against its own weight since
  $ integral_(bb(R)) S \( ell \) \| log S \( ell \) \| thin thin upright(d) ell < oo : $
  on $\| ell \| gt.eq 1$, its integrand is bounded by $C \( 1 + \| ell \| \) e^(- 2 \| ell \|)$,
    and on a bounded interval it is bounded. Also $integral J \| log J \| < oo$,
    because $J$ is bounded and compactly supported and $r \| log r \|$ is bounded for $0 lt.eq r lt.eq 1$.
    Consequently the absolute entropy of an annular sign prototype is at most
  $ C s^2 \( 1 + \| log s \| \) . $
  The sums of these bounds over the geometric scales converge.
    Since the spatial supports of the prototypes are disjoint modulo periodicity,
    the same estimates prove convergence of the truncated mass, energy, and absolute entropy.
    As $- log M$ is a constant plus $\| v \|^2 \/ 2$, they prove relative entropy convergence as well.
  For the seed $h_N^0 = lambda_N s_N chi \( x \/ s_N \, v \)$, a change of spatial variables gives
  $ integral h_N^0 \( 1 + \| v \|^2 \) lt.eq C s_N^4 \, wide integral h_N^0 \| log h_N^0 \| lt.eq
    C s_N^4 \( 1 + \| log s_N \| \) . $
  The constants are uniform in $lambda_N in \[ 0 \, L_0 \]$, including $lambda_N = 0$,
    since $lambda \| log lambda \|$ is bounded on bounded intervals.
    It remains to check overlap with the cold datum. At every point
  $ 0 lt.eq F_0^(\( N \)) lt.eq C s_N^(- 31) . $
  For $f \, b gt.eq 0$, integration of $1 + log \( f + r \)$ over $0 < r < b$ gives, with the convention at $b = 0$,
  $ \| \( f + b \) log \( f + b \) - f log f \| lt.eq b { 2 + log^(+) \( f + b \) } + b \| log b \| . $
  Indeed the positive part of the logarithm is bounded by $log^(+) \( f + b \)$,
    and $integral_0^b log^(-) \( f + r \) thin thin upright(d) r lt.eq
    integral_0^b log^(-) r thin thin upright(d) r lt.eq b \( 1 + \| log b \| \)$.
    On the seed support, $log^(+) \( F_0^(\( N \)) + h_N^0 \) lt.eq C \( 1 + \| log s_N \| \)$.
    The entropy perturbation is therefore $O \( s_N^4 \( 1 + \| log s_N \| \) \)$.
    The mass and Maxwellian-reference terms are controlled by the seed’s mass and energy estimates.
    This proves the last assertion. ◻
]

=== 4.2 A transported Maxwellian barrier <a-transported-maxwellian-barrier>

For a fixed scale and sign, the equation

#[#set math.equation(numbering: n => "(4.5)")
 $ u_s^sigma \( t \, z \) = a_s^sigma \( z - t u_s^sigma \( t \, z \) \) $ <jet:scalar-flow>]

defines $u_s^sigma$ for all $t gt.eq 0 \, z in bb(R)$. Indeed $tau mapsto tau +
  t a_s^sigma \( tau \)$ is strictly increasing, has derivative at least one, and maps $bb(R)$ onto $bb(R)$.
  In particular, $\| u_s^sigma \| lt.eq 1 + alpha$. For label $i = \( j \, sigma \, n \)$, abbreviate

$ u_i \( t \, z \) = u_(s_j)^sigma \( t \, z - n_3 \) \, quad tau_i = z - n_3 - t u_i \( t \, z \) \, quad w_i =
  v - u_i \( t \, z \) e_3 \, $

and set

$ D_(y \, i) = "dist" \( y - macron(n) \, E_j^sigma \) \, wide D_(z \, i) = "dist" \( tau_i \, \[ - a \, a \] \) . $

Choose $c_(upright("sp")) = 1 \/ 8$ and a fixed sufficiently large $C_m$, depending only on $J$, and define,
  for $t > 0$,

#[#set math.equation(numbering: n => "(4.6)")
 $ m_i \( t \, x \, v \) = C_m K / s_j d_(s_j)^(- 3) e^t exp
   [- frac(\( 2 - t \) \| w_i \|^2, d_(s_j)^2) - frac(c_(upright("sp")) \( D_(y \, i)^2 + D_(z \, i)^2 \),
   d_(s_j)^2 t)] . $ <jet:majorant>]

Its trace at $t = 0$ is defined by the limit along free characteristics.
  Boundary values of the spatial masks are irrelevant. Denote the free transport of the $i$-th initial color by

$ f_i \( t \, x \, v \) = c_i^0 \( x - t v \, v \) . $

#thm([Lemma 4.3.])[
  (Barrier identities).  #emph[The constant $C_m$ can be chosen so that $f_i lt.eq
    m_i$ on $\[ 0 \, overline(T) \]$, uniformly in the label.
    Moreover, almost everywhere along every free characteristic,
#[#set math.equation(numbering: n => "(4.7)")
 $ D_t m_i gt.eq (1 + 7 / 8 \| w_i \|^2 \/ d_(s_j)^2) m_i . $ <jet:barrier-derivative>]

 There is a constant $C_nu$, independent of the label, such that
#[#set math.equation(numbering: n => "(4.8)")
 $ P \( m_i \, m_i \) = m_i nu_(m_i) \, wide nu_(m_i) \( v \) lt.eq C_nu K /
   s_j \( d_(s_j) + \| w_i \| \) . $ <jet:barrier-collision>]

 Every free core remains in its own spatial enlargement:
$ f_i \( t \, x \, v \) > 0 quad arrow.r.double quad x in cal(O)_i \( t \) . $

]
] <jet:barrier>

#proof[
  Suppress the indices, write $d = d_s$, and put $A = \( a_s^sigma \)' \( tau \) gt.eq 0$.
    Implicit differentiation gives
  #[#set math.equation(numbering: n => "(4.9)")
   $ u_z = frac(A, 1 + t A) gt.eq 0 \, wide u_t = - u u_z \, wide D_t u = \( v_3 - u \) u_z \, wide D_t tau =
     frac(v_3 - u, 1 + t A) . $ <jet:flow-identities>]
  Consequently
  $ D_t \| w \|^2 = - 2 u_z w_3^2 . $
  The distance functions are Lipschitz, hence absolutely continuous along flights,
    and at their almost-everywhere differentiability points
  $ \| D_t D_y \| lt.eq \| macron(w) \| \, wide \| D_t D_z \| lt.eq \| w_3 \| \/ \( 1 + t A \) lt.eq \| w_3 \| . $
  Differentiating the logarithm of (4.6) now gives
  $ D_t log m =  & 1 + frac(\| w \|^2, d^2) + frac(2 \( 2 - t \) u_z w_3^2, d^2)\
 & + frac(c_(upright("sp")) \( D_y^2 + D_z^2 \), d^2 t^2) -
   frac(2 c_(upright("sp")) \( D_y D_t D_y + D_z D_t D_z \), d^2 t) . $
  For each of the two spatial terms use $r^2 - 2 r q gt.eq - q^2$. This yields
  $ D_t log m gt.eq 1 + \( 1 - c_(upright("sp")) \) \| w \|^2 \/ d^2 + 2 \( 2 - t \) u_z w_3^2 \/ d^2 . $
  The last term is nonnegative on the preliminary time interval, proving (4.7).
    In particular the large derivative of the initial axial profile causes no adverse $s^(- 1)$ term.
  To compare with free transport, start a core flight at $x^0 = \( y^0 \, z^0 \)$ in its initial support and write
  $ v = a_s^sigma \( z^0 - n_3 \) e_3 + d w^0 \, wide \| w^0 \| lt.eq 1 . $
  At $x = x^0 + t v$, the function $p mapsto p - a_s^sigma \( z - n_3 - t p \)$ has derivative at least one,
    its value at $v_3$ is $d w_3^0$, and its value at $u$ is zero. Thus
  $ \| v_3 - u \| lt.eq d \| w_3^0 \| \, quad \| macron(v) \| = d \| macron(w)^0 \| \, quad D_y lt.eq
    t d \| macron(w)^0 \| \, quad D_z lt.eq t d \| w_3^0 \| . $
  In particular $\| w \| lt.eq d$ and $\( D_y^2 + D_z^2 \) \/ \( d^2 t \) lt.eq t$.
    The exponential in (4.6), including $e^t$, is bounded below on this flight by $e^(- 3)$.
    Taking $C_m gt.eq e^3 parallel J parallel_oo$ gives $f_i lt.eq m_i$, since $S lt.eq 1$.
    The same calculation supplies the required initial domination.
    Away from the closed initial spatial support the trace of $m_i$ is zero;
    on it the distance exponent tends to zero along flights. The inequalities therefore integrate from time zero.
    No differentiation of a spatial indicator is used.
  At a fixed point $\( t \, x \)$, $m_i$ is a scalar multiple of the Maxwellian with center $u_i
    e_3$ and exponent $\( 2 - t \) \/ d_s^2$. Conservation of momentum and energy in an elastic collision gives
    $m'_i m'_(i \, *) = m_i m_(i \, *)$, which proves the first identity in (4.8).
    Its velocity mass is at most $C K \/ s$, and its first moment about $u_i e_3$ is at most $C K d_s \/ s$,
    by the substitution $p = u_i e_3 + d_s xi$. The inequality $\| v - p \| lt.eq \| w_i \| + \| p -
    u_i e_3 \|$ proves the frequency bound.
  Finally, the free-flight estimates and (4.3) give
  $ D_y lt.eq overline(T) d_s lt.eq delta_j \/ 2 . $
  Its axial velocity has modulus less than $2$, so its position lies between $n_3 - a - 2 t$ and $n_3 + a + 2 t$.
    It belongs to $cal(O)_i \( t \)$, as asserted. ◻
]

=== 4.3 Cold control and the density Jacobian <cold-control-and-the-density-jacobian>

The labels for the finite approximation are

$ cal(I)_N = { \( j \, sigma \, n \) : 1 lt.eq j lt.eq N \, med sigma = plus.minus 1 \, med n in bb(Z)^3 } . $

For $i = \( j \, sigma \, n \)$ we also write $s_i = s_j$.
  The infinitely many integer-copy labels merely implement periodicity: translating $x$ permutes them.
  We consider nonnegative colored mild solutions with these initial colors and any nonnegative hot component,
  with a common finite collision cutoff $b > 0$. The statement below applies throughout every interval on which
  the finite-approximation solution exists with bounded weighted sup norm.
  Its constants do not use that norm or any bound on the hot component.

#thm([Proposition 4.4.])[
  (Uniform cold control).  #emph[There is a constant $L$, depending on the fixed parameters,
    such that after imposing the additional condition
#[#set math.equation(numbering: n => "(4.10)")
 $ L d_0 overline(s)^9 lt.eq 1 \, $ <jet:thermal-comparison>]

 the following statements hold at every time of existence of the finite approximation in $0 lt.eq t lt.eq overline(T)$.]
  + #emph[For every retained label $i = \( j \, sigma \, n \)$,
#[#set math.equation(numbering: n => "(4.11)")
 $ 0 lt.eq c_i lt.eq f_i + epsilon_j m_i \, wide epsilon_j = L d_(s_j) \/ s_j . $ <jet:cold-remainder>]

]
  + #emph[At each spatial point call the unique label with $x in cal(O)_i \( t \)$, if one exists and is retained,
    the main label. Let $c_(upright("main"))$ be that color, or zero, and set $e = c - c_(upright("main"))$.
    For every $A gt.eq 0$,
#[#set math.equation(numbering: n => "(4.12)")
 $ 0 lt.eq e \( t \, x \, v \) lt.eq C_A t^A e^(- 4 \| v \|^2) . $ <jet:escaped>]

 The upper bound remains valid after restricting the escaped sum to any subset of its labels.]
  + #emph[If the main label has scale $s$, its velocity measure is bounded by a fixed multiple of
    $\( t + s \)^(- 1)$ times a sum of admissible probability sheets from Lemma 6.
    Its free-core contribution has the exact parameterization (4.16) below.
    The remainder has the smaller velocity-mass coefficient $C d_s \/ s^2$. In particular, for every fixed $k gt.eq 0$,
#[#set math.equation(numbering: n => "(4.13)")
 $ integral_(bb(R)^3) chevron.l v chevron.r^k c_(upright("main")) thin thin upright(d) v lt.eq frac(C_k, t + s) \,
   wide integral_(\| v \| > R) chevron.l v chevron.r^k c_(upright("main")) thin thin upright(d) v lt.eq
   frac(C_k e^(- c_k R^2), t + s) quad \( R gt.eq 3 \) . $ <jet:moment-envelope>]

]
  + #emph[For the mixed-cold source in the hot equation,
#[#set math.equation(numbering: n => "(4.14)")
 $ sum_(i \, j in cal(I)_N\
i eq.not j) P^b \( c_i \, c_j \) \( t \, x \, v \) lt.eq C_A t^(A - 1) H \( v \) wide \( t > 0 \) $ <jet:mixed-source>]

 for every $A gt.eq 0$, with constants uniform in $N$ and $b$.]
] <prop:cold-control>

#proof[
  #emph[Nonlinear comparison.] For one color put $U_i = f_i + epsilon_j m_i$.
    Lemma 13 gives $U_i lt.eq \( 1 + epsilon_j \) m_i$. By (4.10), $epsilon_j lt.eq 1$; therefore
  $ P^b \( U_i \, U_i \) lt.eq P \( U_i \, U_i \) lt.eq 4 C_nu K / s_j \( d_(s_j) + \| w_i \| \) m_i . $
  On the other hand,
  $ D_t U_i gt.eq L d_(s_j) / s_j \( 1 + 7 / 8 \| w_i \|^2 \/ d_(s_j)^2 \) m_i . $
  The ratio $\( 1 + r \) \/ \( 1 + 7 / 8 r^2 \)$ is bounded on $r gt.eq 0$.
    Choose $L gt.eq 1$ at least $4 C_nu K$ times that bound. Then $D_t U_i gt.eq P^b \( U_i \, U_i \)$.
    This choice is made before decreasing $d_0$, so (4.10) is compatible with all earlier constraints.
  The cold equation implies $D_t c_i lt.eq P^b \( c_i \, c_i \)$, because its loss is nonnegative.
    To justify comparison explicitly, integrate both inequalities along a free path, using $c_i \( 0 \) lt.eq
    U_i \( 0 \)$, and put $z_i = \( c_i - U_i \)_(+)$. Positivity and bilinearity give
  $ z_i \( t \) lt.eq integral_0^t #scale(x: 120%, y: 120%)[\[] 2 P^b \( U_i \, z_i \) +
    P^b \( z_i \, z_i \) #scale(x: 120%, y: 120%)[\]] \( tau \, x - \( t - tau \) v \, v \) thin thin upright(d) tau . $
  On any interval of bounded weighted norm, the gain bound Lemma 9 implies
  $ parallel z_i \( t \) \/ H parallel_oo lt.eq C_I integral_0^t parallel z_i \( tau \) \/ H parallel_oo thin thin
    upright(d) tau . $
  Indeed $m_i \/ H$ is bounded for a fixed scale, uniformly on the preliminary interval, and $z_i lt.eq c_i +
    U_i$ supplies the other bounded factor. Iteration of this integral inequality,
    or its scalar integrating factor, gives $z_i = 0$. This proves (4.11) without a hot bound.
    The argument is unchanged for each periodic-copy label.
  #emph[Summation of escaped tails.] For a nonmain label, (4.2) and $\| u_i \| lt.eq 1 +
    alpha < 2$ imply either $D_(y \, i) gt.eq delta_j$ or $D_(z \, i) gt.eq b_(upright("sp"))$.
    Since $delta_j lt.eq b_(upright("sp"))$, in either case
  $ D_(y \, i)^2 + D_(z \, i)^2 gt.eq \( c_eta \/ 4 \)^2 s_j^4 . $
  If $a_v = \( 2 - t \) \/ d_s^2$, then $a_v gt.eq 8$, and completing the velocity square gives
  $ sup_v exp { 4 \| v \|^2 - a_v \| v - u e_3 \|^2 } = exp #h(-0.16667em) (frac(4 a_v \| u \|^2, a_v - 4)) lt.eq
    e^(8 \( 1 + alpha \)^2) . $
  Thus $c_i lt.eq 2 m_i$ bounds its escaped contribution by
  #[#set math.equation(numbering: n => "(4.15)")
   $ C s_j^(- 31) e^(- 4 \| v \|^2) exp #h(-0.16667em)
     [- frac(c_(upright("sp")) \( D_(y \, i)^2 + D_(z \, i)^2 \), d_(s_j)^2 t)] . $ <jet:tail-prefactor>]
  The factor $d_0^(- 3)$ has been included in the fixed constant.
  For completeness the integer-copy sum is uniform in the scale. Since $E_j^sigma subset \[ - s_0 \, s_0 \]^2$,
  $ D_(y \, i)^2 gt.eq sum_(k = 1)^2 \( \| y_k - n_k \| - s_0 \)_(+)^2 \, wide
    D_(z \, i) gt.eq \( \| z - n_3 \| - a - 2 overline(T) \)_(+) . $
  For $beta > 0 \, R gt.eq 0 \, epsilon.alt > 0$, comparison of the two monotone Gaussian tails with their
    integrals gives
  $ sup_(xi in bb(R)) sum_(n in bb(Z)) e^(- beta \( \| xi - n \| - R \)_(+)^2 \/ epsilon.alt^2) lt.eq 2 R + 5 +
    epsilon.alt sqrt(pi \/ beta) . $
  There are at most $2 R + 2$ integers in the central interval; for each of the remaining tails,
    keep its first term and bound the rest by the corresponding Gaussian integral,
    which proves the displayed bound. Applying this estimate to the three coordinates, with $epsilon.alt =
    d_s sqrt(t)$, bounds the lattice sum of one half of the spatial exponent uniformly for $t lt.eq overline(T)$.
    Use the other half to retain the escaped distance. For some fixed $beta_0 > 0$ this gives
  $ sum_(n : thin i med upright("nonmain"))
    e^(- c_(upright("sp")) \( D_(y \, i)^2 + D_(z \, i)^2 \) \/ \( d_s^2 t \)) lt.eq
    C exp \[ - beta_0 \/ \( s^16 t \) \] . $
  Here $beta_0$ includes $d_0^(- 2)$, and the two signs only contribute a factor two.
  For arbitrary $A gt.eq 0$ and $B > 0$, choose $p gt.eq A$ with $16 p - 31 gt.eq B$.
    From $e^(- x) lt.eq \( p \/ e \)^p x^(- p)$, and $t lt.eq 1$,
  $ s^(- 31) e^(- beta_0 \/ \( s^16 t \)) lt.eq C_(A \, B) t^A s^B . $
  The geometric sum of $s_j^B$ is finite. More precisely, restricting to $s_j lt.eq
    rho$ gives a bound $C_(A \, B) t^A rho^B$. This proves (4.12);
    it also shows that any fixed extra power of $s_j^(- 1)$ can be absorbed by increasing $p$.
    All these estimates were obtained by summing upper bounds over every scale and copy, so they are uniform in $N$.
  #emph[The exact free-core velocity measure.] Fix $t \, x$ and one label, abbreviating $z_c = z - n_3$, $y_c =
    y - macron(n)$, $s = s_j$, $d = d_s$. For $w in bb(R)^3$ define $Phi \( w_3 \)$ by
  $ Phi \( w_3 \) = a_s^sigma \( z_c - t Phi \( w_3 \) \) + d w_3 \, wide macron(p) = d macron(w) \, wide p_3 =
    Phi \( w_3 \) . $
  The same strictly increasing map used in (4.5) gives a unique $Phi$, and
  $ Phi' \( w_3 \) = frac(d, 1 + t alpha gamma S \( gamma \( z_c - t Phi \( w_3 \) \) \/ s \) \/ s) . $
  The full velocity change of variables therefore gives exactly
  #[#set math.equation(numbering: n => "(4.16)")
   $ f_i \( t \, x \, p \) thin thin upright(d) p =  &
     frac(K S \( gamma \( z_c - t p_3 \) \/ s \), s + t alpha gamma S \( gamma \( z_c - t p_3 \) \/ s \)) J \( w \)\
 &  times upright(bold(1))_(E_j^sigma) \( y_c - t d macron(w) \)
   upright(bold(1))_(\( - a \, a \)) \( z_c - t p_3 \) thin thin upright(d) w . $ <eq:core-jacobian>]
  For $k_0 = alpha gamma > 0$ and $0 < S lt.eq 1$,
  #[#set math.equation(numbering: n => "(4.17)")
   $ frac(K S, s + t k_0 S) lt.eq frac(K, s + t k_0) lt.eq frac(K max \( 1 \, k_0^(- 1) \), s + t) .
     $ <jet:density-coefficient>]
  Thus this estimate is uniform even when $t \/ s$ is large or the value of $S$ is small.
  We spell out the product-sheet upper bound, since the axial law can be very compressed. Let
  $ g_2 \( macron(w) \) = pi^(- 1) e^(- \| macron(w) \|^2) \, wide g_1 \( w_3 \) = pi^(- 1 \/ 2) e^(- w_3^2) . $
  There is a fixed $C_J$ such that $J \( w \) lt.eq C_J g_2 \( macron(w) \) g_1 \( w_3 \)$.
    The axial map $Phi$ depends only on $w_3$, and
  $ \| Phi \( w_3 \) - u_s^sigma \( t \, z_c \) \| lt.eq d \| w_3 \| $
  by the derivative-at-least-one argument. The pushforward of $g_2 \( macron(w) \) thin upright(d)
    macron(w)$ by $macron(w) mapsto d macron(w)$ is a centered transverse Gaussian.
    Independently, let $rho$ be the pushforward of $g_1 \( w_3 \) thin upright(d) w_3$ by $Phi$.
    It is a probability law and, uniformly in $s \, t \, x$,
  $ integral_(bb(R)) e^(8 p_3^2) thin rho \( thin upright(d) p_3 \) lt.eq
    e^(16 \( 1 + alpha \)^2) integral_(bb(R)) e^(16 d^2 w_3^2) g_1 \( w_3 \) thin thin upright(d) w_3 lt.eq C . $
  Equations (4.16) and (4.17), after discarding the masks, bound the core measure by $C \/ \( t + s \)$ times this
    product law. No density bound on $rho$ is asserted or needed.
  For the remainder, use $p = u_i e_3 + d_s w$ in (4.6). Its measure is bounded by
  $ epsilon_j m_i thin thin upright(d) p lt.eq C d_s / s^2 e^(- \( 2 - t \) \| w \|^2) thin thin upright(d) w \, $
  which is again a product-sheet majorant, with the stated smaller coefficient. Since
  $ \( d_s \/ s^2 \) \( t + s \) = d_0 s^8 \( t + s \) lt.eq d_0 overline(s)^8 \( overline(T) + overline(s) \) \, $
  this coefficient is also at most $C \/ \( t + s \)$. The width restrictions in (4.3) allow these Gaussian laws
    and their fixed, slightly wider majorants in Lemma 6. Lemma 8 applies with the common axial bound $A = 1 +
    alpha$, the fixed Gaussian majorant constant, and the displayed physical widths.
    The factors $C \/ \( t + s \)$ and $C d_s \/ s^2$ remain outside the probability-sheet normalization.
    A parameter restriction $\| w \| > R$ therefore contributes at most $C
    e^(- c R^2)$ times its respective amplitude to the normalized gain.
    For the remainder, $2 - t gt.eq 2 - overline(T) > 1$, so its parameter Gaussian is bounded by
    $e^(- \| w \|^2)$. The normalized kernel-tail conclusions of Lemma 7 also apply, with these amplitudes.
  The core velocities are supported in $\| p \| < 2$. The remainder has uniformly small Gaussian width and a
    center in $\| p_3 \| lt.eq 1 + alpha$. Substitution in its Gaussian integral gives all its polynomial moments
    and the uniform Gaussian moment tails. Combined with (4.17), these give (4.13).
  #emph[The mixed source.] At a fixed point, separate the main color from $e$.
    Positivity and the ordered nature of the cross-color sum give
  $ sum_(i eq.not j) P^b \( c_i \, c_j \) lt.eq 2 P \( c_(upright("main")) \, e \) + P \( e \, e \) . $
  The function $e^(- 4 \| v \|^2) \/ H \( v \)$ is essentially bounded, so (4.12) bounds $e$ by $C_A t^A H$.
    Lemma 6 and the product measures just proved bound $P \( c_(upright("main")) \, H \)$ by $C \( t + s \)^(- 1)
    H$; when there is no main color this term is zero. Lemma 9 bounds $P \( H \, H \)$ by $C H$.
    Since $t + s gt.eq t$ and $t lt.eq 1$,
  $ 2 P \( c_(upright("main")) \, e \) + P \( e \, e \) lt.eq C_A { t^A \/ \( t + s \) + t^(2 A) } H lt.eq
    C'_A t^(A - 1) H . $
  This proves (4.14). ◻
]

It is useful to record the spatial form of the moment bound. For a fixed $k gt.eq 0$, Proposition 14 implies

#[#set math.equation(numbering: n => "(4.18)")
 $ integral_(bb(R)^3) chevron.l v chevron.r^k c \( t \, x \, v \) thin thin upright(d) v lt.eq
   C_k sum_(i in cal(I)_N) frac(upright(bold(1))_(cal(O)_i \( t \)) \( x \), t + s_i) +
   C_(A \, k) t^A . $ <jet:spatial-moment-envelope>]

At most one term of the displayed sum is present at any point.
  In one periodic cell, the spatial volume of the enlargement belonging to a fixed annular sign,
  with its periodic copies included, is at most $C s_i^2$. The same bound with a factor tending to zero as the
  velocity cutoff increases holds for the integrated velocity tails.

=== 4.4 Quantitative survival on a free core <quantitative-survival-on-a-free-core>

The upper estimates did not use a hot bound. The following consequence, used only for the dilation,
  adds the cap assumption.

#thm([Corollary 4.5.])[
  (Survival of a cold core under the cap).  #emph[Suppose a finite approximation satisfies
$ 0 lt.eq h \( t \, x \, v \) lt.eq \( t + s_N \) H \( v \) $

 on an initial interval $\[ 0 \, T \] subset \[ 0 \, overline(T) \]$.
   All conclusions below concern times $t in \[ 0 \, T \]$. For every $M gt.eq 0$ there are constants $C \, C_M$,
   independent of $T \, N$, the cutoff, and the seed, such that
#[#set math.equation(numbering: n => "(4.19)")
 $ e^(- E_(s \, N) \( t \)) f_i \( t \, x \, v \) lt.eq c_i \( t \, x \, v \) lt.eq f_i \( t \, x \, v \) +
   L \( d_s \/ s \) m_i \( t \, x \, v \) \,\
E_(s \, N) \( t \) = C \( d_s t \/ s + t^2 + s_N t \) + C_M t^(M + 1) $ <jet:survival-sandwich>]

 for every label of scale $s$. Consequently, if $r arrow.r 0$, $s_N lt.eq r$,
   $s \/ r in \[ epsilon.alt \, R \]$ for fixed $0 < epsilon.alt < R < oo$, and $0 lt.eq t lt.eq
   min \( T \, A r \)$, then
$ E_(s \, N) \( t \) lt.eq C_(epsilon.alt \, R \, A) \( d_s + r^2 \) + C_(M \, A) r^(M + 1) arrow.r 0 $

 uniformly in the label and in points of its free core. The transverse free displacement divided by the stripe
   period satisfies
#[#set math.equation(numbering: n => "(4.20)")
 $ frac(t d_s, s^2) lt.eq C_(epsilon.alt \, R \, A) r^9 arrow.r 0 . $ <jet:stripe-displacement>]

 On these scales the difference between cold and free-core velocity measures also satisfies,
   uniformly in position and time,
#[#set math.equation(numbering: n => "(4.21)")
 $ r integral_(bb(R)^3) \| c_i - f_i \| \( t \, x \, v \) thin thin upright(d) v arrow.r 0 . $ <jet:survival-measure>]

]
] <jet:survival>

#proof[
  The loss-integrating-factor formula for the $i$-th mild equation and nonnegativity of its gain give
  $ c_i \( t \, x \, v \) gt.eq
    f_i \( t \, x \, v \) exp [- integral_0^t nu_F^b \( tau \, x - \( t - tau \) v \, v \) thin thin upright(d) tau] . $
  Only points with $f_i \( t \, x \, v \) > 0$ need be considered.
    Their entire backward flight, equivalently the corresponding forward flight from the initial support,
    is in $cal(O)_i \( tau \)$ by Lemma 13. Also $\| v - u_i \( tau \, z \( tau \) \) e_3 \| lt.eq d_s$ throughout it.
  At such a position the free part of the same color has velocities within $d_s$ of this center, by (4.16),
    and mass at most $C \/ \( tau + s \)$. Its contribution to the frequency at $v$ is at most $C
    d_s \/ \( tau + s \) lt.eq C d_s \/ s$. The remainder has mass $C d_s \/
    s^2$ and first moment about the center at most $C d_s^2 \/ s^2$.
    Since $d_s \/ s lt.eq 1 \/ L$, its contribution is at most $C d_s \/ s$ as well.
    The same-color frequency is therefore bounded by $C d_s \/ s$.
  Every other color is escaped along this flight. Its total frequency is at most $C_M tau^M$,
    by (4.12) and $\| v \| < 2$. The cap applies at every preceding time $tau in \[ 0 \, t \]$, so
  $ nu_h \( v \) lt.eq 2 pi \( tau + s_N \) integral_(bb(R)^3) \( \| v \| + \| p \| \) H \( p \) thin thin
    upright(d) p lt.eq C \( tau + s_N \) $
  at these bounded velocities. Since $nu_F^b lt.eq nu_F$, integration proves the optical-depth bound in (4.19).
    Its upper bound is (4.11).
  If $s \/ r in \[ epsilon.alt \, R \]$, $t lt.eq A r$, and $s_N lt.eq r$,
    the first term in the optical depth is bounded by $C_(A \, epsilon.alt) d_s$,
    and the two hot terms are $O_A \( r^2 \)$. All stated convergence is uniform. Moreover
  $ t d_s \/ s^2 = d_0 t s^8 lt.eq d_0 A R^8 r^9 \, $
  which proves (4.20).
  For the last claim the sandwich gives
  $ \| c_i - f_i \| lt.eq \( 1 - e^(- E_(s \, N) \( t \)) \) f_i + L \( d_s \/ s \) m_i . $
  Integrating in velocity and using the core and remainder density bounds yields
  $ r integral \| c_i - f_i \| thin thin upright(d) v lt.eq C E_(s \, N) \( t \) frac(r, t + s) + C frac(r d_s, s^2) . $
  Here $r \/ \( t + s \) lt.eq 1 \/ epsilon.alt$, and $r d_s \/ s^2 = d_0 r s^8 lt.eq C_R r^9$.
    Both terms tend to zero uniformly, proving (4.21). ◻
]

== 5 Finite approximations and cap selection <sec:cap>

Retain the first $N$ annuli of the datum in (4.4), and use a common collision cutoff $b_N arrow.r oo$ in (2.4).
  All assertions in this section first concern fixed $N \, b_N$.
  Constants in the cold estimates and in the caps will be uniform in $N$.

Choose once and for all a nonnegative smooth function $chi in C_c^oo \( bb(R)_x^3 times bb(R)_v^3 \)$,
  not identically zero. After reducing $s_0$, its periodic copies at spatial scale $s_N$ are disjoint initially.
  The hot initial density is

$ h \( 0 \, x \, v \) = lambda s_N chi \( x \/ s_N \, v \) \, $

periodized in $x$. The cold initial densities are independent of $lambda$.
  In particular the norm $parallel chi \( x \/ s_N \, v \) parallel_H$ is a fixed positive number independent of $N$.

#thm([Proposition 5.1.])[
  #emph[There is a fixed $T_0 > 0$ such that the following statements hold.]
  + #emph[With $lambda = 0$, the finite approximations exist on $\[ 0 \, T_0 \]$ and satisfy $0 lt.eq h lt.eq t^2 H$.]
  + #emph[There is a fixed finite $L_0$ such that, for every $0 < T lt.eq T_0$ and every $N$,
    some $lambda in \[ 0 \, L_0 \]$ gives an approximation on $\[ 0 \, T \]$ with
#[#set math.equation(numbering: n => "(5.1)")
 $ 0 lt.eq h \( t \, x \, v \) lt.eq \( t + s_N \) H \( v \) \, wide
   max_(0 lt.eq t lt.eq T) frac(parallel h \( t \) parallel_H, t + s_N) = 1 . $ <eq:cap>]

]
  #emph[In both cases all cold components obey Proposition 14.]
] <prop:finite-cap>

#proof[
  We first give the fixed-approximation local theory used in the selection.
    Lemma 9 bounds the gain bilinearly in $parallel dot.op parallel_H$. For the cutoff loss,
  $ parallel nu_f^(b_N) parallel_oo lt.eq 2 pi b_N "ess sup"_x integral_(bb(R)^3) \| f \( x \, w \) \| thin
    upright(d) w lt.eq 2 pi b_N parallel f parallel_H integral_(bb(R)^3) H \( w \) thin upright(d) w \, $
  so gain and loss are locally Lipschitz on bounded balls of the weighted norm.
    Free transport is an isometry in that norm.
  Picard iteration for the integral equation along characteristics gives a unique local solution in the space of
    bounded measurable functions with finite weighted norm. An integrating factor for the loss,
    followed by positive iteration of the gain, gives nonnegativity.
    One can equivalently perform this iteration for the labeled system,
    using the norm of the sum of the absolute values of all components,
    and for differences the sum of the absolute differences. The quadratic estimates close in that norm.
    The Gaussian spatial tails in Proposition 14 make the sums over periodic copies finite in the relevant norm.
    Periodic covariance is preserved by uniqueness.
  The solution continues as long as its total weighted norm remains bounded.
    It depends continuously on its initial datum, uniformly on a fixed interval on which that norm is bounded.
    These assertions follow from the same integral contraction and its difference estimate on short subintervals.
    They do not require norm continuity of spatial translations:
    one works with the integral equation along the free paths. In particular,
  $ parallel h \( t \) - h \( s \, x - \( t - s \) v \, v \) parallel_H lt.eq C_(N \, b_N) \| t - s \| $
  on a bounded solution interval. Since transport is an isometry, $t mapsto parallel h \( t \) parallel_H$,
    and hence $t mapsto parallel h \( t \) parallel_H \/ \( t + s_N \)$, are continuous.
  Let $z \( t \) = parallel h \( t \) parallel_H$. Dropping the loss in the hot equation,
    the cold and kernel estimates give its scalar integral comparison with
  #[#set math.equation(numbering: n => "(5.2)")
   $ z' \( t \) lt.eq (frac(C_1, t + s_N) + C_1) z \( t \) + C_1 z \( t \)^2 + C_A t^(A - 1) . $ <cap:scalar>]
  Here $A$ can be any sufficiently large fixed number, and its source constant is uniform in $N$.
    This is an upper integral inequality; no differentiability of the essential supremum is needed.
  Fix $A > C_1 + 2$. Choose $D > 0$ so that $\( A - C_1 \) D > C_A$.
    Since $t \/ \( t + s_N \) lt.eq 1$, the function $D t^A$ is a supersolution of (5.2) after shortening a fixed
    preliminary time interval to absorb the bounded linear and quadratic terms.
    Shorten it again to ensure $D t^A lt.eq t^2$. Comparison from zero proves (a).
    The cold bound is independent of $h$, so it also ensures continuation for each fixed $N \, b_N$ up to this time.
  For (b), shorten $T_0$ to be less than one, so that the zero-seed solution satisfies a strict cap:
  $ frac(parallel h \( t \) parallel_H, t + s_N) lt.eq frac(t^2, t + s_N) lt.eq T_0 < 1 . $
  Choose $L_0$ so large that $L_0 parallel chi \( x \/ s_N \, v \) parallel_H > 1$.
    The cap then fails at time zero for $lambda = L_0$.
  For fixed $N \, b_N \, T$, let $cal(O)$ be the set of seed parameters in $\[ 0 \, L_0 \]$ whose solution exists
    up to $T$ and obeys a strict cap there. Continuous dependence and continuation make $cal(O)$ relatively open.
    Its component containing zero has a right endpoint $lambda_(*)$ strictly below $L_0$:
    indeed a neighborhood of $L_0$ already fails the initial cap.
    Approach $lambda_(*)$ from within that component. The cap and the fixed cold bound give a common finite
    weighted norm on $\[ 0 \, T \]$, with constants permitted to depend on $N \, b_N$.
    The local difference estimates on finitely many short subintervals give a limit solution at $lambda_(*)$,
    with cap at most one. It continues to $T$. If its maximum cap ratio were less than one,
    continuous dependence would extend the component past $lambda_(*)$, a contradiction. This proves (5.1). ◻
]

#prodef([Remark 5.2.])[
  The coefficient $C_1$ may be large, in particular when $alpha gamma$ is small.
    It is fixed before $A \, D \, T_0$ are chosen. The arbitrary-power tail estimates are available on a
    preliminary short interval; their constants can be fixed there before the final shortening.
    Thus the choice does not depend on $N$, and imposes no restriction on the later choice of shrinking horizons.
] <cap:parameter-order>

== 6 Fixed-horizon limits and admissibility <sec:admissibility>

In this section the physical horizon $T in \( 0 \, T_0 \]$ is fixed.
  The approximation index tends to infinity without any rescaling of time or space. This distinction matters:
  the cold densities in this section have uniformly integrable limits,
  whereas their rescalings in the next section will converge to measures in velocity.

#thm([Proposition 6.1.])[
  #emph[Fix $T in \( 0 \, T_0 \]$. Either the zero-seed approximations of Proposition 16,
    or any sequence of its cap shots on $\[ 0 \, T \]$, has a subsequence whose total densities $F_N = c_N +
    h_N$ converge weakly in $L^1 \( \[ 0 \, T \] times Omega \)$ to a nonnegative density $F$.
    The subsequence can be chosen so that $F_N \( t \) harpoon.rt F \( t \)$ in $L^1 \( Omega \)$ at every $t
    in \[ 0 \, T \]$, with uniformly small polynomially weighted velocity tails.
    The limit has the common initial datum (4.4), and
$ Q^plus.minus \( F \, F \) in L^1 \( \[ 0 \, T \] times Omega \) \, wide
  F in C \( \[ 0 \, T \] \; L^1 \( Omega \) \) . $

 It satisfies every condition of Definition 2 on this interval, including the inequalities at every time.
   Each such limit has an admissible global continuation. The dormant upper bound,
   consisting of the cold majorants of Proposition 14 and $t^2 H$, passes to a zero-seed limit.]
] <prop:admissible-limits>

We give the compactness and entropy arguments in detail.

=== 6.1 Conservation and entropy before passage to the limit <conservation-and-entropy-before-passage-to-the-limit>

At a fixed approximation the bounds already proved imply $F_N lt.eq A_N H$ on the whole solution interval,
  with a finite constant allowed to depend on $N \, b_N \, T$.
  In particular there are all polynomial velocity moments, and there is an $L^p$ majorant for some $1 < p < 2 \/
  q$. The equation holds absolutely continuously on almost every free path.
  Its cutoff gain and loss are integrable, including after multiplication by any fixed polynomial in velocity.

The collision map preserves volume, kinetic energy, and $\| v - v_(*) \|$, so it also preserves the cutoff.
  For an integrable velocity test $psi$ the collision symmetry gives

$ integral_(bb(R)^3) psi \( v \) Q^(b_N) \( F_N \, F_N \) \( v \) thin upright(d) v = 1 /
  2 integral_(bb(R)^3 times bb(R)^3 times S^2) \| a \| upright(bold(1))_({ \| v - v_(*) \| < b_N }) F_N
  F_(N \, *) \( psi' + psi'_(*) - psi - psi_(*) \) thin upright(d) v thin upright(d) v_(*) thin upright(d) omega . $

The right side vanishes for $psi = 1 \, v_j \, \| v \|^2$.
  Integrating the path equation and using periodicity therefore proves mass, momentum,
  and energy conservation at every time of the finite approximation.
  The same calculation with a spatially dependent mass test gives its local continuity equation.

To justify entropy at zeros, put $E \( v \) = e^(- 2 \| v \|^2)$, take $0 < delta lt.eq 1$,
  and set $F_(N \, delta) = F_N + delta E$. Define

$ cal(A)_delta \( f \, v \) = M \( v \) + integral_0^f log frac(u + delta E \( v \), M \( v \)) thin upright(d) u . $

Its derivative with respect to $f$ is $log \( F_(N \, delta) \/ M \)$. At the fixed approximation,

#[#set math.equation(numbering: n => "(6.1)")
 $ lr(|log F_(N \, delta) / M|) lt.eq C_N #scale(x: 120%, y: 120%)[\(] 1 + \| log delta \| + \| v \|^2 +
   log^(+) \| macron(v) \|^(- 1) #scale(x: 120%, y: 120%)[\)] . $ <comp:log-bound>]

Indeed $F_(N \, delta) gt.eq delta e^(- 2 \| v \|^2)$ gives the lower logarithmic bound, and $F_N lt.eq
  A_N H$ gives the upper bound. Every factor on the right of (6.1) is integrable against $H$,
  apart from the harmless constant $\| log delta \|$: in the transverse plane this uses $integral_0^1 r^(1 - q) \|
  log r \| thin upright(d) r < oo$.

Since $E lt.eq C H$, the fixed-cutoff bilinear bounds imply

$ \| Q^(b_N) \( F_(N \, delta) \, F_(N \, delta) \) - Q^(b_N) \( F_N \, F_N \) \| lt.eq C_(N \, b_N) delta H . $

Consequently replacing the latter operator by the former in its integral against $log \( F_(N \, delta) \/ M \)$
  costs at most $C_(N \, b_N \, T) delta \( 1 + \| log delta \| \)$.
  The path chain rule, followed by spatial integration, now gives

#[#set math.equation(numbering: n => "(6.2)")
 $ integral_Omega cal(A)_delta \( F_N \( t \) \, v \) + integral_0^t cal(D)_(b_N) \( F_(N \, delta) \( s \) \)
   thin upright(d) s lt.eq integral_Omega cal(A)_delta \( F_N \( 0 \) \, v \) +
   C_(N \, b_N \, T) delta \( 1 + \| log delta \| \) . $ <comp:regularized-entropy>]

Here $cal(D)_b$ denotes the dissipation with the invariant cutoff inserted. The collision identity used in this step is

$ integral_Omega Q^(b_N) \( F_(N \, delta) \, F_(N \, delta) \) log \( F_(N \, delta) \/ M \) = -
  cal(D)_(b_N) \( F_(N \, delta) \) . $

It follows by averaging over interchange of the two particles and over the elastic substitution.
  The $log M$ term cancels because it is a linear combination of mass and energy.
  All integrals for this calculation are finite at $delta > 0$ by (6.1).

As $delta arrow.b 0$, the primitive converges to $f log \( f \/ M \) - f + M$. Its integrals converge as well.
  For example its lower bound is that limiting primitive, while its upper bound follows by replacing $delta$ by
  one in the increasing integrand. The negative part of $f log f$ is integrable under a finite second moment,
  and the upper bound is integrable by (6.1) without the $\| log delta \|$ term.
  Fatou’s lemma applied to the nonnegative dissipation integrand in (6.2) therefore yields,
  for every $t in \[ 0 \, T \]$,

#[#set math.equation(numbering: n => "(6.3)")
 $ cal(H)_M \( F_N \( t \) \) + integral_0^t cal(D)_(b_N) \( F_N \( s \) \) thin upright(d) s lt.eq
   cal(H)_M \( F_N \( 0 \) \) . $ <comp:finite-entropy>]

Lemma 12 gives convergence of the initial mass, energy, and relative entropy to those of (4.4).
  Its estimates include the hot seed, whose mass and energy are $O \( s_N^4 \)$ and whose absolute entropy is
  $O \( s_N^4 \( 1 + \| log s_N \| \) \)$, as well as the seed’s overlap with the cold density in the relative
  entropy. The convergence is uniform for the allowed seed parameters $0 lt.eq lambda lt.eq L_0$.

=== 6.2 Uniform integrability of densities and collision products <uniform-integrability-of-densities-and-collision-products>

For $s = s_j$, let $A_s$ be the annulus ${ y in bb(R)^2 : s < \| y \| < e^eta s }$,
  viewed as a subset of $bb(T)^2$. By Lemma 11, these annuli are pairwise disjoint and contain the enlarged
  stripes of both signs at their respective scales. Their areas satisfy $\| A_s \| lt.eq C s^2$.
  Proposition 14, the cap, and the dormant bound imply, for every fixed $k gt.eq 0$,

#[#set math.equation(numbering: n => "(6.4)")
 $ R_(k \, N) \( t \, x \) := integral_(bb(R)^3) chevron.l v chevron.r^k F_N \( t \, x \, v \) thin upright(d) v
   lt.eq C_k (1 + sum_(j lt.eq N) frac(upright(bold(1))_(A_(s_j)) \( y \), t + s_j)) . $ <comp:moment-envelope>]

The bounded term includes the hot density and escaped tails.
  The cold remainder has density coefficient $O \( d_s \/ s^2 \) = O \( s^8 \)$,
  and is also covered by this estimate. All constants are independent of $N$.

The square of the envelope is integrable uniformly in $N$, including at the initial surface.
  In fact the contribution of one annulus is

#[#set math.equation(numbering: n => "(6.5)")
 $ integral_0^T frac(C s^2, \( t + s \)^2) thin upright(d) t = C s^2 (1 / s - frac(1, T + s)) lt.eq
   C s . $ <comp:annular-square>]

Since the scales form a geometric sequence, $sum_(s_j < epsilon) s_j lt.eq C_eta epsilon$.
  If $A_(< epsilon) = union.big_(s_j < epsilon) A_(s_j)$, disjointness of the annuli thus gives

#[#set math.equation(numbering: n => "(6.6)")
 $ sup_N integral_0^T integral_(A_(< epsilon) times bb(T)) R_(k \, N) \( t \, x \)^2 thin upright(d) x thin
   upright(d) t arrow.r 0 wide \( epsilon arrow.b 0 \) . $ <comp:small-annuli>]

The contribution of the bounded term is at most $C T \| A_(< epsilon) \|$.

Outside $A_(< epsilon)$, the main color has one of finitely many scales $s_j gt.eq epsilon$.
  Those velocity widths are positive and fixed. Their Gaussian bounds,
  with axial centers in a fixed bounded interval, give a function $Psi_epsilon \( v \)$, independent of $N \, t \,
  x$, such that

#[#set math.equation(numbering: n => "(6.7)")
 $ F_N \( t \, x \, v \) lt.eq Psi_epsilon \( v \) quad upright("if ") y in.not A_(< epsilon) \, wide
   integral chevron.l v chevron.r^k Psi_epsilon \( v \) thin upright(d) v < oo quad \( k gt.eq 0 \) .
   $ <comp:fixed-majorant>]

One may take a finite sum of broadened Gaussians about the bounded axial interval,
  together with a multiple of $H$ for the hot component and escaped tails.
  There is no need for this majorant to be bounded on the velocity axis.

Equations (6.6)–(6.7) prove uniform integrability of

$ chevron.l v chevron.r^k chevron.l w chevron.r^k F_N \( t \, x \, v \) F_N \( t \, x \, w \) $

in the full spacetime and two-velocity variables. Indeed its integral over the removed annuli is at most the left
  side of (6.6); elsewhere it has the fixed integrable majorant $chevron.l v chevron.r^k Psi_epsilon \( v \)
  chevron.l w chevron.r^k Psi_epsilon \( w \)$. This also proves uniformly small velocity tails.
  Taking first powers instead proves uniform integrability of the one-particle densities in spacetime.
  At individual times the estimate is

#[#set math.equation(numbering: n => "(6.8)")
 $ sup_(N \, thin 0 lt.eq t lt.eq T) integral_(A_(< epsilon) times bb(T)) R_(k \, N) \( t \, x \) thin upright(d)
   x lt.eq C_k sum_(s_j < C epsilon) s_j^2 / s_j + C_k \| A_(< epsilon) \| arrow.r 0 . $ <comp:fixed-time-small>]

Together with (6.7), this proves weighted one-particle uniform integrability and velocity tightness uniformly at
  all individual times.

The gains and losses enjoy the same spacetime conclusion.
  To see this directly, collision symmetry and energy conservation imply

$ integral chevron.l v chevron.r^k Q_N^plus.minus \( t \, x \, v \) thin upright(d) v lt.eq
  C_k R_(k + 1 \, N) \( t \, x \)^2 \, wide Q_N^plus.minus = Q^(plus.minus \, b_N) \( F_N \, F_N \) . $

Their weighted integrals on the small annuli therefore tend uniformly to zero.
  On the complement, positivity and (6.7) give the fixed bounds

$ Q_N^(+) \( t \, x \, v \) lt.eq P \( Psi_epsilon \, Psi_epsilon \) \( v \) \, wide
  Q_N^(-) \( t \, x \, v \) lt.eq Psi_epsilon \( v \) nu_(Psi_epsilon) \( v \) . $

Both right sides are integrable with every fixed polynomial velocity weight:
  integrate first in the output velocity and use the preceding collision-moment inequality for the fixed function
  $Psi_epsilon$. Thus ${ Q_N^plus.minus }$ is uniformly integrable in spacetime,
  with uniformly small weighted velocity tails. In particular its integrals over time intervals of length tending
  to zero vanish uniformly in $N$. This last assertion follows by first discarding the small annuli and then
  integrating the fixed majorants over the time interval.

=== 6.3 An elementary averaging argument <an-elementary-averaging-argument>

We use a uniformly integrable version of velocity averaging #cite(label("GolseLionsPerthameSentis1988"))
  Proposition 3. The following proof gives the precise local statement needed here.

#thm([Lemma 6.2.])[
  #emph[Suppose that $f_n$ and $g_n$ are locally uniformly integrable in $L^1$ on an open time-space-velocity
    region, and $\( partial_t + v dot.op nabla_x \) f_n = g_n$ there in distributions.
    Then for every smooth compactly supported velocity test $psi$,
    the averages $integral psi \( v \) f_n \( t \, x \, v \) thin upright(d)
    v$ are relatively compact in local $L_(t \, x)^1$ on regions where the hypotheses hold for velocities in a
    neighborhood of $"supp" psi$. The assertion applies both on a spatial torus and locally in $bb(R)^3$.]
] <comp:averaging>

#proof[
  Choose smooth interior cutoffs in time, space, and velocity; the spatial cutoff is unnecessary on a torus.
    Write the localized sequence as $q_n$, extend it by zero outside the localization interval,
    and put $r_n = \( 1 + partial_t + v dot.op nabla_x \) q_n$.
    The equation shows that $r_n$ is uniformly integrable in $L^1$,
    with support in a fixed bounded set of time and velocity and, in the Euclidean case, space.
    The derivative of a spatial cutoff is harmless because velocity has also been localized. The exact identity
  $ q_n \( t \, x \, v \) = integral_0^oo e^(- s) r_n \( t - s \, x - s v \, v \) thin upright(d) s $
  follows by integrating the localized equation from a time preceding its support.
    Denote this damped inverse by $R$. It is an $L^1$ contraction, since free transport preserves Lebesgue measure.
  Truncate $r_n$ at height $L$, retaining its sign, to obtain $r_n^(\( L \))$. Uniform integrability gives
  $ sup_n parallel r_n - r_n^(\( L \)) parallel_1 arrow.r 0 \, wide
    sup_n parallel r_n^(\( L \)) parallel_2 < oo quad upright("for fixed ") L . $
  The averages of $R \( r_n - r_n^(\( L \)) \)$ are therefore uniformly small in $L^1$.
    It remains to handle a bounded $L^2$ family $r_n^(\( L \))$.
  Take Fourier transform in $\( t \, x \)$, using Fourier series in the periodic coordinates.
    For $u_n = R r_n^(\( L \))$, Cauchy–Schwarz gives
  $ lr(|integral psi \( v \) hat(u)_n \( tau \, k \, v \) thin upright(d) v|)^2 lt.eq
    I_psi \( tau \, k \) integral \| hat(r)_n^(\( L \)) \( tau \, k \, v \) \|^2 thin upright(d) v \, wide
    I_psi \( tau \, k \) = integral frac(\| psi \( v \) \|^2, 1 + \( tau + k dot.op v \)^2) thin upright(d) v . $
  If $"supp" psi subset { \| v \| lt.eq R_0 }$, integration in the direction of $k$ gives $I_psi lt.eq
    C_psi \/ \| k \|$ when $k eq.not 0$. If $\| tau \| > 2 R_0 \| k \|$,
    the denominator instead gives $I_psi lt.eq C_psi \/ \( 1 + \| tau \|^2 \)$.
    It follows that $I_psi \( tau \, k \) arrow.r 0$ uniformly as $\| tau \| + \| k \| arrow.r oo$.
    The averages consequently have uniformly small high-frequency $L^2$ tails.
    Convolution with a fixed smooth approximate identity approximates them uniformly in $L^2$.
    On each compact time-space set the convolutions are bounded and equicontinuous,
    by Cauchy–Schwarz applied to translates of the convolution kernel and their derivatives.
    They are therefore relatively compact there. This proves local $L^2$, hence local $L^1$,
    compactness for fixed $L$. The uniform $L^1$ error as $L arrow.r oo$ proves the assertion. ◻
]

=== 6.4 Identification of the nonlinear terms <identification-of-the-nonlinear-terms>

The uniform integrability just proved supplies a subsequence with $F_N harpoon.rt F$ in spacetime $L^1$;
  velocity tightness allows the whole velocity space. Since $D_t F_N = Q_N^(+) - Q_N^(-)$, Lemma 19 applies.
  After a diagonal extraction for a countable dense family of compact velocity tests,
  all such velocity averages converge strongly in local $L_(t \, x)^1$ to the corresponding averages of $F$.
  Extension from that family to every smooth compact velocity test uses the uniform mass bound.

Set $W_N \( t \, x \, v \, w \) = F_N \( t \, x \, v \) F_N \( t \, x \, w \)$.
  The full pair-product uniform integrability supplies a weak $L^1$ limit $W$, after another extraction.
  For smooth compact velocity tests $psi \, chi$,

$ integral psi \( v \) chi \( w \) W_N thin upright(d) v thin upright(d) w =
  (integral psi F_N thin upright(d) v) (integral chi F_N thin upright(d) w) . $

Both factors converge in local $L^1$, so their product converges in measure.
  The products are uniformly integrable in $\( t \, x \)$, by (6.5) and the fixed majorants after removal of small
  annuli. Their convergence is consequently in $L^1$: to verify this last implication,
  discard a set of arbitrarily small measure on which convergence is not uniform,
  and use uniform integrability on the discarded set. We obtain

$ integral psi \( v \) chi \( w \) W thin upright(d) v thin upright(d) w =
  (integral psi F thin upright(d) v) (integral chi F thin upright(d) w) . $

Finite sums of separated velocity tests are uniformly dense among continuous functions on compact two-velocity
  sets. Testing also in $\( t \, x \)$ identifies

#[#set math.equation(numbering: n => "(6.9)")
 $ W_N harpoon.rt F \( t \, x \, v \) F \( t \, x \, w \) quad
   upright("in ") L^1 \( \[ 0 \, T \] times bb(T)^3 times bb(R)^3 times bb(R)^3 \) . $ <comp:pair-limit>]

The same conclusion holds with any fixed polynomial weight for which it is needed.
  Interior time compactness suffices: the uniform integrability already proved removes intervals near zero and $T$.

Adjoining the finite angular measure preserves weak convergence.
  The elastic map on $\( v \, w \, omega \)$ is measure preserving and involutive,
  so (6.9) also identifies the primed pair product. On a bounded two-velocity set the factor $\| a \|$ is bounded,
  and the cutoff is eventually absent. The weighted tail estimates allow these sets to exhaust all velocities.
  Since $Q_N^plus.minus$ themselves are uniformly integrable,
  testing their weak limits and using these identifications proves

#[#set math.equation(numbering: n => "(6.10)")
 $ Q_N^plus.minus harpoon.rt Q^plus.minus \( F \, F \) quad
   upright("in ") L^1 \( \[ 0 \, T \] times Omega \) . $ <comp:collision-limit>]

Passing the equation, including its initial boundary term, is now legitimate.
  The initial densities converge in $L^1$, and the limit satisfies the unrenormalized distributional equation with
  datum $F_0$.

=== 6.5 Every-time traces, entropy, and the chain rule <every-time-traces-entropy-and-the-chain-rule>

We first specify representatives at every time. For a smooth periodic test $phi \( x \, v \)$ compactly supported
  in velocity, the finite path equations give

$ \| chevron.l F_N \( t \) - F_N \( s \) \, phi chevron.r \| lt.eq
  integral_s^t integral_Omega #scale(x: 120%, y: 120%)[\(] F_N \| v dot.op nabla_x
  phi \| + \( Q_N^(+) + Q_N^(-) \) \| phi \| #scale(x: 120%, y: 120%)[\)] thin upright(d) x thin upright(d) v thin
  upright(d) u . $

The first term is bounded by $C_phi \| t - s \|$; the second has a uniform modulus tending to zero with $\| t -
  s \|$, by the time-integral conclusion above. For a countable uniformly dense collection of such tests,
  extract uniform convergence of their pairings on $\[ 0 \, T \]$.
  At each individual time (6.8) and (6.7) make ${ F_N \( t \) }$ relatively weakly compact in $L^1$.
  Every cluster point has the prescribed smooth pairings, hence is the same density.
  Thus this single subsequence converges weakly in $L^1$ at every time.
  It defines a weakly continuous representative against smooth tests, agreeing with the spacetime limit.
  The weighted fixed-time tightness also passes total mass, momentum, and energy from the finite approximations.
  In particular energy is conserved on this early interval, although only its inequality will be needed.

Let $Phi \( A \, B \) = \( A - B \) log \( A \/ B \)$ with its nonnegative extended values.
  It is jointly convex and lower semicontinuous: it is the sum of the two convex perspectives $A
  log \( A \/ B \)$ and $B log \( B \/ A \)$. On every bounded collision set,
  (6.9) and its primed version therefore give lower semicontinuity of the integral of $\| a \| Phi$.
  One can absorb the weight into the arguments because $Phi \( c A \, c B \) = c Phi \( A \, B \)$ for $c gt.eq
  0$. The lower semicontinuity follows, for example, by expressing a nonnegative convex lower-semicontinuous
  function as the supremum of its affine supporting functions and using weak convergence on a finite partition.
  Exhausting bounded velocity sets, and using that the cutoff is eventually absent on each of them,
  gives for every $t in \[ 0 \, T \]$

$ integral_0^t cal(D) \( F \( s \) \) thin upright(d) s lt.eq
  liminf_N integral_0^t cal(D)_(b_N) \( F_N \( s \) \) thin upright(d) s . $

The same convex lower-semicontinuity argument applies to $cal(H)_M \( F_N \( t \) \)$ under weak $L^1$ convergence
  at that time. Combining the two nonnegative terms, using (6.3) and initial entropy convergence, proves

#[#set math.equation(numbering: n => "(6.11)")
 $ cal(H)_M \( F \( t \) \) + integral_0^t cal(D) \( F \( s \) \) thin upright(d) s lt.eq
   cal(H)_M \( F_0 \) wide \( 0 lt.eq t lt.eq T \) . $ <comp:limit-entropy>]

There is no time-dependent subsequence in this conclusion.

In fact the time representative is strongly continuous. In free coordinates the distributional equation and its
  initial trace read

$ partial_t #scale(x: 120%, y: 120%)[\[] F \( t \, x + t v \, v \) #scale(x: 120%, y: 120%)[\]] =
  Q \( F \, F \) \( t \, x + t v \, v \) . $

The right side is integrable in $\( t \, x \, v \)$. Subtracting its Bochner integral leaves a distribution with
  zero time derivative, whose initial value is $F_0$. Therefore

#[#set math.equation(numbering: n => "(6.12)")
 $ F \( t \, x + t v \, v \) = F_0 \( x \, v \) + integral_0^t Q \( F \, F \) \( s \, x + s v \, v \) thin
   upright(d) s $ <comp:path-formula>]

as an $L_(x \, v)^1$ identity, initially for almost every time and then for every time by the representative just
  constructed. The right side is absolutely continuous in $L^1$.
  Free transport is a strongly continuous group on $L^1 \( bb(T)^3 times bb(R)^3 \)$,
  as follows by approximating an $L^1$ function by continuous functions with compact velocity support.
  Thus $F in C \( \[ 0 \, T \] \; L^1 \)$. This proves in particular continuity against every bounded measurable test.

Equation (6.12) also holds on almost every individual free path.
  Since $M \( v \) > 0$ is constant on such a path, the ordinary absolutely continuous chain rule gives,
  for every $beta$ in Definition 2,

$ D_t #scale(x: 120%, y: 120%)[\[] M beta \( F \/ M \) #scale(x: 120%, y: 120%)[\]] =
  beta' \( F \/ M \) Q \( F \, F \) . $

The source is integrable because $\| beta' \| lt.eq C_beta$ and $Q in L^1$. Moreover

$ \| M beta \( f \/ M \) - M beta \( g \/ M \) \| lt.eq C_beta \| f - g \| \, wide \| M beta \( f \/ M \) \| lt.eq
  C_beta f . $

Hence the renormalization is strongly continuous at the initial and terminal traces.
  Integrating its path equation proves exactly the renormalized identity and trace in Definition 2.
  The separate integrability requirement follows from $0 lt.eq Q^plus.minus \/ \( 1 + F \/ M \) lt.eq Q^plus.minus$.

Integrating the unrenormalized equation in velocity is justified by absolute collision integrability.
  The collision integral has zero mass, and the flux is integrable,
  so it gives the required local continuity equation with its initial density.
  Momentum has already passed at every time. Finally, the negative part of $F log
  F$ is bounded uniformly by mass and energy. For example split ${ F < 1 }$ at $F = e^(- 1 - \| v \|^2)$:
  above that threshold use $- F log F lt.eq \( 1 + \| v \|^2 \) F$,
  and below it use a fixed multiple of $e^(- \( 1 + \| v \|^2 \) \/ 2)$.
  Equation (6.11) then bounds the positive part as well. This proves the uniform absolute logarithmic integral
  required in the definition.

=== 6.6 Continuation and inherited bounds <continuation-and-inherited-bounds>

At time $T$, the density just constructed has finite mass, energy, and absolute logarithmic integral.
  We use the global existence theorem of DiPerna and Lions #cite(label("DiPernaLions1989"))
  #cite(label("DiPernaLions1991")), in the precise periodic formulation of #cite(label("LevermoreMasmoudi2010"))
  Section 4.1, Theorem 4.1. We verify its interface with Definition 2 before concatenating.

For our kernel $b_(upright("phys")) \( omega \, v - w \) = \| \( v - w \) dot.op omega \|$,
  local integrability holds and, for every compact $K subset bb(R)^3$,

$ frac(1, 1 + \| v \|^2) integral_(K times S^2) b_(upright("phys")) \( omega \, v - w \) thin upright(d) omega
  thin upright(d) w = frac(2 pi, 1 + \| v \|^2) integral_K \| v - w \| thin upright(d) w arrow.r
  0 quad \( \| v \| arrow.r oo \) . $

This is the hypothesis of that theorem. To match its collision and time normalizations, put

$ C_b = integral_(bb(R)^3 times bb(R)^3 times S^2) b_(upright("phys")) \( omega \, v - w \) M \( v \) M \( w \)
  thin upright(d) omega thin upright(d) v thin upright(d) w \, wide epsilon.alt = C_b^(- 1) . $

The constant $C_b$ is finite and positive. Use the source kernel $b_(upright("phys")) \/
  C_b$ and its equation $epsilon.alt partial_s G + v dot.op nabla_x G =
  epsilon.alt^(- 1) Q_(b_(upright("phys")) \/ C_b) \( G \, G \)$, with initial density $F \( T \) \/ M$.
  Here the relative-density operator satisfies $M Q_(b_(upright("phys")) \/ C_b) \( G \, G \) =
  Q \( M G \, M G \) \/ C_b$. Then $tilde(F) \( t \, x \, v \) =
  M \( v \) G \( epsilon.alt t \, x \, v \)$ has precisely our collision normalization.
  The same time substitution converts the source dissipation coefficient $epsilon.alt^(- 2)$ into the coefficient
  one of $cal(D)$.

The cited theorem allows arbitrary finite relative-entropy initial data.
  It gives weak continuity of $G$ in $L^1 \( M thin upright(d) x thin upright(d) v \)$,
  which is exactly weak continuity of $tilde(F)$ in $L^1 \( thin upright(d) x thin upright(d) v \)$,
  and the renormalized identities with the initial trace for continuously differentiable functions satisfying $\|
  beta' \( z \) \| lt.eq C \/ sqrt(1 + z)$. Our renormalizations are included.
  Its local mass identity is the one required here. Integrating its momentum identity over the torus removes the
  spatial divergence of the momentum defect, giving total momentum conservation.
  This extends to every time by weak continuity and the uniform second-moment bound:
  the first-moment tail outside $\| v \| lt.eq R$ is at most $R^(- 1)$ times the second moment.
  Dropping the nonnegative defect contributions in the theorem’s energy and relative-entropy inequalities gives
  the two inequalities in Definition 2 at every time. The negative-entropy estimate above then supplies the
  uniform absolute logarithmic integral.

We also need separate global integrability of the renormalized gain and loss, rather than only their difference.
  For any density $f gt.eq 0$, write $g = f \/ M$. Since $f \/ \( 1 + g \) lt.eq M$,

$ integral_Omega frac(Q^(-) \( f \, f \), 1 + g) lt.eq integral_Omega M nu_f lt.eq
  C integral_Omega \( 1 + \| v \| \) f . $

For $A \, B gt.eq 0$, with the same extended-value convention as for the dissipation,

$ A lt.eq 2 B + frac(2, log 2) \( A - B \) log \( A \/ B \) . $

Indeed the first term suffices when $A lt.eq 2 B$; otherwise $A - B > A \/ 2$ and $log \( A \/ B \) > log 2$.
  Apply this with $A = f' f'_(*)$, $B = f f_(*)$, divide by $1 + g \( v \)$,
  and integrate with the collision kernel. Nonnegativity of the dissipation gives

$ integral_Omega frac(Q^(+) \( f \, f \), 1 + g) lt.eq 2 integral_Omega frac(Q^(-) \( f \, f \), 1 + g) +
  frac(8, log 2) cal(D) \( f \) . $

The moment and entropy-dissipation bounds for $tilde(F)$ make both terms integrable over every finite time
  interval. Thus the continuation satisfies all of Definition 2.

Concatenate $tilde(F)$ with $F$ at time $T$. The two weak $L^1$ traces agree,
  so the concatenation is continuous against every bounded measurable test.
  Its renormalized identity follows by adding the two identities:
  the early terminal term $M beta \( F \( T \) \/ M \)$ cancels the continuation’s prescribed initial term.
  The Lipschitz estimate above supplies that early terminal trace.
  The mass continuity identities concatenate in the same way.

For $t gt.eq T$, add the continuation inequality

$ cal(H)_M \( tilde(F) \( t - T \) \) + integral_0^(t - T) cal(D) \( tilde(F) \( s \) \) thin upright(d) s lt.eq
  cal(H)_M \( F \( T \) \) $

to (6.11) at $T$. This gives the global entropy inequality, with no entropy equality at the splice assumed.
  Energy inequalities and momentum conservation concatenate using the common terminal moments.
  Collision integrability in the renormalized sense holds on both pieces,
  hence on every bounded interval of the concatenation. The uniform moment and absolute entropy bounds on such an
  interval follow from those of the two pieces.

For a dormant sequence, sum the cold upper bounds of Proposition 14 over all labels and add $t^2 H$.
  This is a common, locally integrable pointwise upper bound for the finite total densities.
  Testing against nonnegative functions and passing to the weak limit preserves it.
  All assertions of Proposition 18 are now proved.

== 7 The cap dilation and its linear limit <sec:dilation>

We now let the physical horizons tend to zero. Choose cap shots with $T_N arrow.b 0$,
  terminal annular scales satisfying $s_N \/ T_N arrow.r 0$, and cutoffs $b_N arrow.r oo$.
  Relabeling a subsequence in this way does not require that every integer index occur.
  Let $t_(* \, N) in \[ 0 \, T_N \]$ be a time attaining the cap. In the periodic lift about the origin define

#[#set math.equation(numbering: n => "(7.1)")
 $ r_N = t_(* \, N) + s_N \, wide h_(r_N) \( t \, x \, v \) = r_N^(- 1) h_N \( r_N t \, r_N x \, v \) \, wide
   C_(r_N) \( t \, x \, v \) = r_N c_N \( r_N t \, r_N x \, v \) \,\
l_N = s_N / r_N arrow.r l in \[ 0 \, 1 \] \, wide U_N = T_N / r_N arrow.r U in \[ 1 \, oo \] . $ <eq:rescaling>]

The limits are taken after subselection, using the compactification of $\[ 0 \, oo \)$ for the second ratio.
  We have $r_N arrow.r 0$, and $U gt.eq 1$ follows from $U_N gt.eq \( 1 + s_N \/ T_N \)^(- 1)$.
  The prelimit inequality $U_N gt.eq 1$ is not needed. The dilated cap event occurs at time $1 - l_N$, and

#[#set math.equation(numbering: n => "(7.2)")
 $ 0 lt.eq h_(r_N) \( t \, x \, v \) lt.eq \( t + l_N \) H \( v \) \, wide 0 lt.eq t lt.eq U_N . $ <dil:cap-bound>]

When convenient we suppress the index on $r_N$.

=== 7.1 The limiting mesh and background <the-limiting-mesh-and-background>

The dilated annular scales are $mu_(N \, j) = s_j \/ r_N$, $j lt.eq N$.
  Their ratio is $e^eta$, their smallest member is $l_N$, and their largest member tends to infinity.
  Subselect their logarithmic phase modulo $eta$. The grids then converge on compact subintervals of
  $\( 0 \, oo \)$ to a geometric mesh $cal(M)$ unbounded above.
  If $l > 0$, its members are $l \, e^eta l \, e^(2 eta) l \, dots.h$.
  If $l = 0$, it is a two-sided geometric mesh with no smallest member.
  To verify this description, choose a grid point in $\( e^(- eta) \, 1 \]$, pass to its limit,
  and multiply it by the fixed factors $e^(j eta)$. When the smallest point stays positive its integer distance in
  the grid from that chosen point is bounded, so can also be fixed by subselection.
  Coincident phase endpoints give the same mesh.

For each $mu > 0$ and $sigma in { - 1 \, 1 }$, let $u_(mu \, sigma) \( t \, z \)$ be the unique solution of

$ u = sigma + alpha tanh frac(gamma \( z - t u \), mu) . $

The left side minus the right side has derivative in $u$ equal to $1 +
  t alpha gamma S \( gamma \( z - t u \) \/ mu \) \/ mu > 0$;
  its values have opposite signs for sufficiently large positive and negative $u$.
  This proves existence and uniqueness. The implicit function theorem gives smoothness, and

$ \| u_(mu \, sigma) - sigma \| lt.eq alpha \, wide partial_z u_(mu \, sigma) =
  frac(alpha gamma S \( gamma \( z - t u \) \/ mu \), mu + t alpha gamma S \( gamma \( z - t u \) \/ mu \)) gt.eq 0 . $

On an open mesh annulus $mu < \| y \| < e^eta mu$, define the nonnegative velocity measure

#[#set math.equation(numbering: n => "(7.3)")
 $ B \( t \, x \, thin upright(d) p \) & = sum_(sigma = plus.minus 1) b_(mu \, sigma) \( t \, z \)
   delta_(u_(mu \, sigma) \( t \, z \) e_3) \( thin upright(d) p \) \,\
b_(mu \, sigma) \( t \, z \) & =
  frac(theta K S \( gamma \( z - t u_(mu \, sigma) \) \/ mu \), mu + t alpha gamma S \( gamma \( z - t u_(mu \,
  sigma) \) \/ mu \)) . $ <eq:background>]

Set $B = 0$ in the hole $\| y \| < l$ if $l > 0$, and assign arbitrary values obeying the same bounds on annular
  interfaces and the transverse axis. These exceptional positions have zero Lebesgue measure.
  In particular, for every $k gt.eq 0$,

#[#set math.equation(numbering: n => "(7.4)")
 $ integral chevron.l p chevron.r^k B \( t \, x \, thin upright(d) p \) lt.eq frac(C_k, t + mu) lt.eq C_k /
   t quad \( t > 0 \) $ <dil:background-bound>]

on an active annulus. If $l > 0$, the bound is instead uniformly $C_k \/ \( t + l \)$ for all $t gt.eq 0$.

#thm([Proposition 7.1.])[
  #emph[Every sequence (7.1) has a subsequence for which $h_(r_N) harpoon.rt
    g$ in local spacetime $L^1$ on $\( 0 \, U \) times bb(R)_x^3 times bb(R)_v^3$, where
#[#set math.equation(numbering: n => "(7.5)")
 $ 0 lt.eq g \( t \, x \, v \) lt.eq \( t + l \) H \( v \) \, wide D_t g = 2 P \( B \, g \) -
   g nu_B . $ <eq:limit-equation>]

 Here $B$ is (7.3); its gain and loss are defined by integration against the velocity measure.
   Both terms on the right are locally integrable, with a velocity majorant uniform in position on each compact
   positive-time interval. Compactly supported velocity averages of $h_(r_N)$ converge strongly in local
   $L_(t \, x)^1$. The limit has a locally strongly continuous $L^1$ representative at positive times and obeys
   the integrating-factor formula (7.15) below.]
  #emph[If $l > 0$, pass also to a limit $lambda_N arrow.r lambda_0$ of the shot parameters.
    The conclusion and its local continuity extend to time zero, with
#[#set math.equation(numbering: n => "(7.6)")
 $ g \( 0 \, x \, v \) = lambda_0 l thin chi \( x \/ l \, v \) . $ <dil:initial-trace>]

]
] <prop:blowup-limit>

=== 7.2 Cold convergence: survival, Jacobian, and stripe averaging <cold-convergence-survival-jacobian-and-stripe-averaging>

We first identify the cold measure independently of the hot limit. Fix a compact time-space region

$ a lt.eq t lt.eq A < U \, wide \| x \| lt.eq R \, $

where $a > 0$. Since $U_N arrow.r U$ and $A < U$, eventually $r_N A < T_N$.
  The cap therefore holds on the entire initial physical interval $\[ 0 \, r_N A \]$,
  as required for the survival estimate below. By Proposition 14,
  the dilated cold velocity moments are bounded there, and indeed uniformly in position, by

#[#set math.equation(numbering: n => "(7.7)")
 $ integral chevron.l p chevron.r^k C_(r_N) \( t \, x \, p \) thin upright(d) p lt.eq
   C_k (frac(1, t + l_N) + 1) . $ <dil:cold-moment-bound>]

The escaped tails have the still smaller bound $C_M r_N^(M + 1) t^M e^(- 4 \| p \|^2)$ for any fixed $M > 0$.
  Uniformly decreasing velocity tails hold under these moment bounds.

First restrict to annuli with $mu_(N \, j)$ in a fixed compact interval $\[ epsilon \, R_1 \]
  subset \( 0 \, oo \)$. There are only finitely many of them, uniformly in $N$.
  Apply Corollary 15 at physical time $r_N t$ to a color of scale $s = r_N mu_(N \, j)$.
  Its optical depth is bounded, uniformly for $0 lt.eq t lt.eq A$, by $C_A \( r_N d_s \/ s + r_N^2 + r_N s_N \) +
  C_(A \, M) r_N^(M + 1)$. Here

$ frac(r_N d_s, s) = d_0 r_N^10 mu_(N \, j)^9 \, wide r_N^2 + r_N s_N lt.eq 2 r_N^2 \, $

so the corollary gives the same-color comparison

$ e^(- epsilon.alt_N) c_(i \, upright("free")) lt.eq c_i lt.eq c_(i \, upright("free")) + C \( d_s \/ s \) m_i \,
  wide epsilon.alt_N arrow.r 0 $

uniformly on these scales. The lower bound covers the full free core because its velocity parameter lies in the
  compact support of $J$. After multiplication by $r_N$, the remainder has velocity mass

#[#set math.equation(numbering: n => "(7.8)")
 $ r_N O \( d_s \/ s^2 \) = O \( d_0 r_N^9 mu_(N \, j)^8 \) . $ <dil:remainder-power>]

The core moment bound and this estimate show that the dilated actual color and its free core differ by $o \( 1 \)$
  in velocity total variation, uniformly on compact regions of these annuli.
  The same holds with each fixed polynomial velocity weight,
  using compact support of the free-core parameter and the Gaussian remainder.

We compute the free core exactly. Fix one sign and one such annulus, write $mu_N = s \/ r_N$,
  and use the velocity parameters

$ macron(p) = d_s macron(w) \, wide p_3 = sigma + alpha tanh frac(gamma \( z - t p_3 \), mu_N) + d_s w_3 . $

The axial map depends only on $w_3$. Its derivative is

$ frac(partial p_3, partial w_3) = frac(d_s, 1 + t alpha gamma S \( gamma \( z - t p_3 \) \/ mu_N \) \/ mu_N) . $

Thus Equation (4.16), after dilation, says that the velocity integral of the free core against a test $psi$ is

#[#set math.equation(numbering: n => "(7.9)")
 $ integral r_N c_(i \, upright("free")) \( r_N t \, r_N x \, p \) psi \( p \) thin upright(d) p =  & integral
   J \( w \)
   frac(K S \( gamma \( z - t p_3 \) \/ mu_N \), mu_N + t alpha gamma S \( gamma \( z - t p_3 \) \/ mu_N \))
   psi \( d_s macron(w) \, p_3 \)\
 & quad dot.op upright(bold(1))_E \( r_N y - r_N t d_s macron(w) \)
   upright(bold(1))_({ \| r_N \( z - t p_3 \) \| < 1 \/ 8 }) thin upright(d) w . $ <dil:free-core-integral>]

On the compact regions under consideration the last axial indicator equals one for all sufficiently large $N$.
  Since the implicit velocity map has derivative at least one in $p_3$,

$ \| p_3 - u_(mu_N \, sigma) \( t \, z \) \| lt.eq d_s \| w_3 \| . $

After the mesh subselection, $mu_N arrow.r mu > 0$, so the velocity test and the smooth amplitude in (7.9)
  converge uniformly for $w in "supp" J$ to

$ psi \( u_(mu \, sigma) e_3 \)
  frac(K S \( gamma \( z - t u_(mu \, sigma) \) \/ mu \), mu + t alpha gamma S \( gamma \( z - t u_(mu \,
  sigma) \) \/ mu \)) . $

It remains to average the transverse indicator. In dilated coordinates its period is

$ s^2 / r_N = r_N mu_N^2 arrow.r 0 . $

The transverse shift of its argument is $t d_s macron(w)$, whose ratio to that period is at most

$ frac(A d_s, r_N mu_N^2) = A d_0 r_N^9 mu_N^8 arrow.r 0 . $

For the indicator of the fixed periodic stripe pattern, a translation by this vanishing relative amount changes
  its integral on a bounded set by $o \( 1 \)$, uniformly in its phase and in bounded $t \, w$.
  One can verify this by summing the lengths of the small intervals around stripe endpoints.
  The annular margins have dilated width $O \( s^2 \/ r_N \) = O \( r_N mu_N^2 \)$,
  so their area also tends to zero on the annulus. The outer annular radii converge;
  their boundaries can likewise be removed in sets of arbitrarily small area.

Finally the periodic stripe indicators converge weak-\* to their mean $theta$.
  Explicitly, if $q$ is the one-period indicator and $q - theta$ has bounded periodic primitive $Q$,
  then for a smooth compactly supported one-dimensional test $f$, period $p$, and arbitrary phase $zeta$,

$ lr(|integral f \( y_1 \) \( q \( y_1 \/ p + zeta \) - theta \) thin upright(d) y_1|) lt.eq
  p parallel Q parallel_oo parallel f' parallel_1 . $

Fubini’s theorem gives the same assertion with the other coordinates and parameters present.
  Approximation in $L^1$ extends it to the annular restrictions.
  Integrating $J$, whose mass is one, in (7.9) produces exactly the coefficient $b_(mu \, sigma)$ in (7.3).

These arguments identify the cold limit on all compact positive scale annuli.
  To remove the lower scale restriction, use (7.7): on the slab $t gt.eq a$,
  the integral over $\| y \| < C epsilon$, with bounded $z$, is at most $C_(a \, A \, R \, k) epsilon^2$.
  The same estimate holds for the candidate $B$. Scales larger than a fixed multiple of $R$ have no main color in
  the chosen spatial compact set, and their escaped tails vanish.
  We have proved that for every continuous compactly supported velocity test $psi$,

#[#set math.equation(numbering: n => "(7.10)")
 $ integral C_(r_N) \( t \, x \, p \) psi \( p \) thin upright(d) p harpoon.rt^(*) integral psi \( p \)
   B \( t \, x \, thin upright(d) p \) quad upright("in local ") L_(t \, x)^oo $ <dil:cold-weakstar>]

on $\( 0 \, U \) times bb(R)^3$. Indeed the computation first gives weak convergence against smooth compact
  time-space tests, and the common $L^oo$ bound extends it to all $L^1$ tests.
  Polynomial velocity tails can also be removed uniformly. If $l > 0$, choose $epsilon < l \/ 2$;
  all the bounds used above hold down to time zero, so (7.10) does too.

=== 7.3 The hot equation and the size of every error <the-hot-equation-and-the-size-of-every-error>

Under (7.1), the derivative of $r_N^(- 1) h_N \( r_N t \, r_N x \, v \)$ is the old transport derivative of $h_N$.
  Therefore the rescaled equation is exactly

#[#set math.equation(numbering: n => "(7.11)")
 $ D_t h_(r_N) = 2 P^(b_N) \( C_(r_N) \, h_(r_N) \) - h_(r_N) nu_(C_(r_N))^(b_N) + E_N \, $ <dil:prelimit-equation>]

where

$ E_N =  & r_N^2 #scale(x: 120%, y: 120%)[\[] P^(b_N) \( h_(r_N) \, h_(r_N) \) -
  h_(r_N) nu_(h_(r_N))^(b_N) #scale(x: 120%, y: 120%)[\]] + S_N \,\
S_N \( t \, x \, v \) =  & sum_(i eq.not j) P^(b_N) \( c_(i \, N) \, c_(j \, N) \) \( r_N t \, r_N x \, v \) . $

There is no additional factor in $S_N$. Its smallness comes from the physical mixed-cold source estimate:
  for every sufficiently large fixed $M$,

#[#set math.equation(numbering: n => "(7.12)")
 $ 0 lt.eq S_N \( t \, x \, v \) & lt.eq C_M r_N^(M - 1) t^(M - 1) H \( v \) \,\
r_N^2 P^(b_N) \( h_(r_N) \, h_(r_N) \) & lt.eq C r_N^2 \( t + l_N \)^2 H \( v \) \,\
r_N^2 h_(r_N) nu_(h_(r_N))^(b_N) & lt.eq C r_N^2 \( t + l_N \)^2 chevron.l v chevron.r H \( v \) . $ <dil:error-bounds>]

The second line uses Lemma 9; the last line uses the first velocity moment of $H$.
  Thus on every fixed compact time interval, $E_N arrow.r 0$ in local spacetime $L^1$,
  with an error bounded by a constant times $r_N^2 + r_N^(M - 1)$ after integration over a fixed spatial compact
  set. Choose $M > 1$.

The main cold sheets and Lemma 6 also give

$ P^(b_N) \( C_(r_N) \, H \) lt.eq C (frac(1, t + l_N) + 1) H \, wide nu_(C_(r_N))^(b_N) \( v \) lt.eq
  C (frac(1, t + l_N) + 1) chevron.l v chevron.r . $

The escaped cold component is bounded by a vanishing multiple of $e^(- 4 \| v \|^2) lt.eq C H$,
  so its gain is covered by Lemma 9. Equations (7.2) and (7.11) now imply, on $a lt.eq t lt.eq A < U$,

#[#set math.equation(numbering: n => "(7.13)")
 $ \| D_t h_(r_N) \( t \, x \, v \) \| lt.eq C_(a \, A) chevron.l v chevron.r H \( v \) . $ <dil:transport-majorant>]

This is a genuine integrable velocity majorant, uniform in position.
  If $l > 0$, the same conclusion holds on $0 lt.eq t lt.eq A$, since $l_N gt.eq l \/ 2$ eventually.

The cap gives weak compactness of $h_(r_N)$ in local $L^1$, and (7.13) permits application of Lemma 19.
  Subselect on an exhaustion of $\( 0 \, U \) times bb(R)^3$.
  The resulting limit $g$ satisfies the bound in (7.5), and each compactly supported velocity average converges
  strongly in local $L_(t \, x)^1$.

=== 7.4 Passing the cold–hot products <passing-the-coldhot-products>

The dilated cold densities concentrate in velocity, so the two-density compactness argument of Section 6 does not
  apply to $C_(r_N)$. The needed product passage uses (7.10) and hot averaging instead.

For compact velocity tests $psi \, chi$, put

$ a_N \( t \, x \) = integral psi \( p \) C_(r_N) \( t \, x \, p \) thin upright(d) p \, wide
  zeta_N \( t \, x \) = integral chi \( v \) h_(r_N) \( t \, x \, v \) thin upright(d) v . $

On every compact positive-time region, $a_N$ is bounded in $L^oo$ and converges weak-\* to $a =
  integral psi thin upright(d) B$, while $zeta_N arrow.r zeta =
  integral chi g thin upright(d) v$ strongly in $L^1$. For a bounded time-space test $phi$,

$ integral phi \( a_N zeta_N - a zeta \) = integral phi a_N \( zeta_N - zeta \) +
  integral phi \( a_N - a \) zeta arrow.r 0 . $

Finite sums of separated velocity tests approximate continuous tests uniformly on compact velocity products.
  The total product mass is uniformly bounded on compact time-space regions by (7.7) and the cap. We conclude

#[#set math.equation(numbering: n => "(7.14)")
 $ C_(r_N) \( t \, x \, p \) h_(r_N) \( t \, x \, v \) thin upright(d) p thin upright(d) v thin upright(d) x thin
   upright(d) t harpoon.rt B \( t \, x \, thin upright(d) p \) g \( t \, x \, v \) thin upright(d) v thin
   upright(d) x thin upright(d) t $ <dil:mixed-product>]

against continuous compact velocity tests, with arbitrary smooth compact time-space dependence.
  Uniform moment bounds in both velocities allow removal of velocity cutoffs in tests with any fixed polynomial
  growth for which they are used below.

Here is an explicit weak collision test suitable for this convergence. For a continuous output test $phi.alt$, let

$ cal(K)_phi.alt \( p \, v \) = frac(\| p - v \|, 2) integral_(S^2) phi.alt
  (frac(p + v, 2) + frac(\| p - v \|, 2) omega) thin upright(d) omega . $

Lemma 3 gives $integral phi.alt P \( c \, h \) = integral.double c \( p \) h \( v \) cal(K)_phi.alt \( p \, v \)
  thin upright(d) p thin upright(d) v$. The test $cal(K)_phi.alt$ is continuous in both incoming velocities,
  including $p = v$, and is bounded in absolute value by $2 pi \| p - v \| parallel phi.alt parallel_oo$.
  The loss test is $2 pi \| p - v \| phi.alt \( v \)$, with the same properties.
  Inserting smooth time-space dependence in $phi.alt$ does not change these facts.
  On bounded velocity products the factor $upright(bold(1))_({ \| p - v \| < b_N })$ is eventually one;
  its complement is uniformly negligible by the weighted product tails.
  Applying (7.14) proves the required gain and loss limits.

The limiting gain is an integrable function, rather than an additional singular output measure.
  Indeed each summand of $B$ is an allowed zero-width axial sheet in Lemma 6; hence on $a lt.eq t lt.eq A$,

$ 0 lt.eq P \( B \, g \) lt.eq C_(a \, A) H \, wide 0 lt.eq g nu_B lt.eq C_(a \, A) chevron.l v chevron.r H . $

Equivalently the weak gain measure is dominated by this integrable function,
  which also verifies absolute continuity at the velocity axis.
  Passing (7.11), using (7.12), proves the equation in (7.5).

=== 7.5 A positive lower mesh endpoint and the local mild formula <a-positive-lower-mesh-endpoint-and-the-local-mild-formula>

When $l > 0$, (7.13) holds uniformly down to zero. The rescaled initial hot density,
  on every fixed spatial compact set for large $N$, is exactly

$ h_(r_N) \( 0 \, x \, v \) = lambda_N l_N chi \( x \/ l_N \, v \) . $

The other periodic copies have moved outside that compact set. Subselect $lambda_N arrow.r lambda_0$.
  Smoothness and compact support of $chi$, and $l_N arrow.r l > 0$, give strong local $L^1$ convergence to (7.6).
  Passing the weak transport identity with tests touching time zero is justified by the uniform source majorant
  and yields that initial trace for $g$. The cold product argument also extends to zero in this case,
  as already noted. For $l = 0$ the coefficient can be of order $1 \/ t$,
  and the proposition only asserts the equation on the open positive-time interval.

On any $\[ a \, A \] subset \( 0 \, U \)$, the limiting transport source is locally integrable and has the
  preceding velocity majorant uniformly in position. Changing to free coordinates as in (6.12),
  first on bounded velocities and enlarged spatial compact sets,
  gives a locally strongly continuous $L^1$ representative.
  The uniform integrable velocity tails then remove the velocity truncation.
  The cap bound passes to every trace of this representative.
  Almost every free path obeys the scalar absolutely continuous equation $D_t g + nu_B g = 2 P \( B \, g \)$.
  Its loss coefficient is locally integrable along the path, since $nu_B \( t \, x \, v \) lt.eq
  C_a chevron.l v chevron.r$ for $t gt.eq a$. The integrating factor therefore gives, for $0 < a < t < U$,

#[#set math.equation(numbering: n => "(7.15)")
 $ g \( t \, x \, v \) =  & g \( a \, x - \( t - a \) v \, v \) exp
   [- integral_a^t nu_B \( tau \, x - \( t - tau \) v \, v \) thin upright(d) tau]\
 & + 2 integral_a^t P \( B \, g \) \( s \, x - \( t - s \) v \, v \) exp
   [- integral_s^t nu_B \( tau \, x - \( t - tau \) v \, v \) thin upright(d) tau] thin upright(d) s . $ <dil:mild>]

This is an almost-everywhere identity, or equivalently an identity in local $L^1$ at the displayed times.
  It holds with $a = 0$ when $l > 0$. Altering the medium on the null annular interfaces does not change the
  identity: free transport preserves phase-space measure, so Fubini’s theorem discards the affected set of paths.
  These statements complete the proof of Proposition 20.

== 8 A cap event produces a nonzero limit <nc:section>

The weak limit in Proposition 20 is obtained on an open time interval.
  A supremum attained by an approximation could in principle disappear through concentration,
  or through escape from that interval. The purpose of this section is to exclude both possibilities.
  All constants used below may depend on the fixed jet parameters. None depends on the approximation index.

#thm([Proposition 8.1.])[
  (Nonvanishing of every cap limit).  #emph[Consider any sequence of cap shots with horizons $T_n arrow.r 0$,
    approximation indices $N_n arrow.r oo$, and $s_(N_n) \/ T_n arrow.r 0$.
    Make the rescaling (7.1), and pass to any subsequence supplied by Proposition 20. Its limit satisfies
$ g equiv.not 0 wide upright("on ") \( 0 \, U \) times bb(R)_x^3 times bb(R)_v^3 . $

 This conclusion includes $l = 1$, $U = 1$, and $U = oo$.]
] <prop:nonzero-limit>

We first describe the positive kernels used in the proof.
  Subsequently we establish the two different mechanisms needed near and away from the velocity axis.

=== 8.1 A positive majorizing equation and its kernels <a-positive-majorizing-equation-and-its-kernels>

For this section relabel the sequence by $n$, set $U_n = T_n \/ r_n$, and write

$ r_n = t_(* \, n) + s_(N_n) \, quad ell_n = s_(N_n) / r_n \, quad tau_n = t_(* \, n) / r_n = 1 - ell_n \, quad
  h_n = h_(r_n) \, quad C_n = C_(r_n) \, quad f_n = h_n / H . $

Then $ell_n arrow.r l$. In particular $0 lt.eq ell_n lt.eq 1$, $0 lt.eq tau_n lt.eq 1$.
  The cap gives, on $0 lt.eq t lt.eq U_n$,

#[#set math.equation(numbering: n => "(8.1)")
 $ 0 lt.eq f_n \( t \, x \, v \) lt.eq t + ell_n \, wide ∥f_n \( tau_n \)∥_oo = 1 . $ <nc:cap-normalized>]

Essential supremum norms and pointwise formulas involving $H$ always ignore the velocity axis, a null set.
  The mild representatives of the finite approximations will be used at the cap times.
  Choose Borel representatives when composing densities with the maps below,
  enforcing their asserted bounds on exceptional null sets as well.
  Characteristic identities and endpoint choices are still made only on their common full-measure sets.

#thm([Lemma 8.2.])[
  (Core kernels on the dilated scale).  #emph[There are nonnegative velocity measures
    $A_n \( t \, x \, thin upright(d) p \)$ and numbers $epsilon_n arrow.r 0$ with the following properties.
    After discarding finitely many terms so that $r_n lt.eq overline(T)$,
    the measures $A_n$ are defined from free transport on the whole interval $0 lt.eq t lt.eq 1$,
    independently of the cap shot’s existence interval. The bounds on $A_n$ below hold on that whole interval;
    comparison with $h_n$ is used only while the shot exists.]
  + #emph[On $0 < t < min \( 1 \, U_n \)$, along almost every free characteristic,
#[#set math.equation(numbering: n => "(8.2)")
 $ D_t h_n lt.eq 2 P \( A_n \, h_n \) + epsilon_n H . $ <nc:positive-equation>]

 At each point $A_n$ contains at most one main free core. Its dilated scale $mu =
   s \/ r_n$ satisfies $\| y \| asymp mu$, with coordinates measured from its periodic copy, and
$ frac(2 P \( A_n \, H \), H) lt.eq frac(C, t + ell_n) . $

]
  + #emph[Before spatial masks are imposed, a core of scale $mu = s \/ r_n$ and sign $sigma$ is the pushforward of
#[#set math.equation(numbering: n => "(8.3)")
 $
   frac(K S #scale(x: 120%, y: 120%)[\(] gamma \( z - t p_3 \) \/ mu #scale(x: 120%, y: 120%)[\)], mu + t alpha
   gamma S #scale(x: 120%, y: 120%)[\(] gamma \( z - t p_3 \) \/ mu #scale(x: 120%, y: 120%)[\)]) J \( w \) thin
   upright(d) w \, wide macron(p) = d_s macron(w) \, quad p_3 = sigma + alpha tanh #scale(x: 120%, y: 120%)[\(]
   gamma \( z - t p_3 \) \/ mu #scale(x: 120%, y: 120%)[\)] + d_s w_3 . $ <nc:core-parameters>]

 The actual masks are measurable factors between zero and one.
   The density in (8.3) is at most $C \( t + mu \)^(- 1) J \( w \)$.]
  + #emph[For $t gt.eq a > 0$, the normalized gain measure
#[#set math.equation(numbering: n => "(8.4)")
 $ cal(K)_n \( t \, x \, v \; thin upright(d) p thin thin upright(d) xi \) =
   4 A_n \( t \, x \, thin upright(d) p \) thin delta #scale(x: 120%, y: 120%)[\(] \( v - p \) dot.op \( xi - v \)
   #scale(x: 120%, y: 120%)[\)] frac(H \( xi \), H \( v \)) thin upright(d) xi $ <nc:normalized-kernel>]

 has total mass at most $C \/ a$. Uniformly in its base point, the contributions from large $\| p \| + \| xi -
   v \|$, or from large retained Gaussian parameters in a product-sheet majorant, tend to zero.
   Its total mass tends uniformly to zero as $\| v \| arrow.r oo$.
   The axial interval, axial mismatch, and small transverse input conclusions of Lemma 7 apply to $cal(K)_n$,
   with the amplitude factor $C \/ a$.]
] <nc:core-kernels>

#proof[
  For $0 lt.eq t lt.eq 1$, let $i$ be the retained label whose enlargement $cal(O)_i \( r_n t \)$ contains $r_n
    x$, if there is one, and define
  $ A_n \( t \, x \, thin upright(d) p \) = r_n f_i \( r_n t \, r_n x \, p \) thin upright(d) p \; $
  set $A_n = 0$ when no such label exists. The free cores $f_i$ and enlargements are defined from the datum,
    so this definition does not require a cap shot beyond $U_n$.
    Their disjointness and free-core bounds hold because $r_n t lt.eq overline(T)$.
  On $0 lt.eq t lt.eq min \( 1 \, U_n \)$, Proposition 14 compares the actual cold density with these free cores.
    All other free cores belong to the escaped sum. The main remainder has, after dilation,
    integrated sheet amplitude at most
  $ C r_n d_s / s^2 = C r_n d_0 s^8 lt.eq C r_n . $
  The escaped sum is bounded by $C_A r_n \( r_n t \)^A e^(- 4 \| v \|^2)$.
    Use Lemma 6 for the main narrow remainder. For the escaped term, $e^(- 4 \| v \|^2) lt.eq
    C H \( v \)$ and Lemma 9 give the required gain bound. Together these supply a positive remainder $R_n$ with
    $C_n lt.eq A_n + R_n$ and $P \( R_n \, H \) \/ H = o \( 1 \)$, uniformly on that interval.
    There the cap gives $h_n lt.eq 2 H$.
  In the dilated hot equation the hot–hot gain is $r_n^2 P \( h_n \, h_n \)$, bounded by $C r_n^2 H$ by Lemma 9.
    The mixed cold source is bounded by $C_A \( r_n t \)^(A - 1) H$; choose $A > 1$.
    Ignore all losses and combine these bounds with the remainder just described.
    This proves (8.2) with $epsilon_n arrow.r 0$, uniformly down to time zero.
  Equation (8.3) is (4.16) after multiplying the cold density by $r_n$.
    Since the smallest scale is $ell_n$, its amplitude is bounded by $C \/ \( t + ell_n \)$.
    The geometric restriction comes from the enlarged transverse set of the main color;
    its relative enlargement is $O \( s \)$, uniformly small.
  The coefficient $4$ in (8.4) is the product of the coefficient $2$ in the linear hot gain and the coefficient
    $2$ in Lemma 3. The gain and velocity-tail bounds follow from Lemmas 6 and 7.
    For parameter truncations, apply Lemma 8 with the common bounds $A = 1 + alpha$, $C_0 = C_J$,
    and the physical width $d_s$. The coefficient $C \/ \( t + mu \) lt.eq
    C \/ a$ on this slab remains a domination amplitude outside the normalized parameter law.
    The parameter-tail estimate controls the complete normalized gain, including $H \( xi \) \/ H \( v \)$,
    uniformly under the axial compression in (8.3). For the exact free core,
    $J$ already has bounded parameter support. ◻
]

For a fixed $a > 0$, define the backward Volterra operator

#[#set math.equation(numbering: n => "(8.5)")
 $ \( cal(V)_n F \) \( t \, x \, v \) = integral_a^t integral F #scale(x: 120%, y: 120%)[\(] s \,
   x - \( t - s \) v \, xi #scale(x: 120%, y: 120%)[\)] cal(K)_n #scale(x: 120%, y: 120%)[\(] s \,
   x - \( t - s \) v \, v \; thin upright(d) p thin thin upright(d) xi #scale(x: 120%, y: 120%)[\)] thin
   upright(d) s . $ <nc:volterra>]

#emph[Representatives in the finite-temperature iteration.] For each finite $n$,
  the core measure has a velocity density, $A_n \( s \, x \, thin upright(d) p \) =
  a_n \( s \, x \, p \) thin upright(d) p$. Integrating first in $p$ in (8.4) shows that, for $xi eq.not v$,
  its input marginal is

$ cal(K)_n \( s \, x \, v \; bb(R)^3 \, thin upright(d) xi \) =
  frac(4 H \( xi \), \| xi - v \| H \( v \))
  [integral_(\( v - p \) dot.op \( xi - v \) = 0) a_n \( s \, x \, p \) thin upright(d) A_p] thin upright(d) xi . $

There is no atom at $xi = v$: each plane-area measure gives that point zero mass, and $p =
  v$ is null for the cold density. For a null set in $\( s \, X \, xi \)$,
  integrate also in the endpoint variables and use the measure-preserving change $X = x - \( t - s \) v$.
  Tonelli’s theorem then shows that altering the input on that set changes $cal(V)_n
  F \( t \)$ only on a null set of endpoints, at each fixed terminal time.
  Finite repetition preserves this property. A countable sequence of lower times $a arrow.b 0$ suffices below;
  intersecting the good endpoint sets for these times, the approximation indices,
  and the finitely many iterations gives the common full-measure sets used at the cap events.

Positivity and Lemma 22 give, for a bounded nonnegative $F$,

#[#set math.equation(numbering: n => "(8.6)")
 $ parallel cal(V)_n^j F \( t \) parallel_oo lt.eq parallel F parallel_oo
   frac(#scale(x: 120%, y: 120%)[\(] C log \( t \/ a \) #scale(x: 120%, y: 120%)[\)]^j, j !) \, wide a lt.eq
   t lt.eq 1 . $ <nc:iteration-norm>]

Indeed, the ordered $j$-time integral of $product_(i = 1)^j C \/ t_i$ equals $\( C log \( t \/ a \) \)^j \/ j !$.
  In particular every fixed number of further gains has bounded mass on this slab.

=== 8.2 Reduction to a finite gain integral <reduction-to-a-finite-gain-integral>

We begin the proof of Proposition 21. The case $l > 0$ is settled directly.
  For $l = 0$, the cap will force a positive contribution from five successive gains;
  the remaining subsections show that this contribution vanishes if the weak limit is zero.

Pass to a subsequence on which the shot parameters converge, $lambda_n arrow.r lambda_oo$.
  If $l > 0$ and $lambda_oo > 0$, Proposition 20 gives the initial hot trace

$ g \( 0 \, x \, v \) = lambda_oo l thin chi \( x \/ l \, v \) . $

This trace is nonzero. More explicitly, the limiting loss frequency obeys

$ nu_B \( t \, x \, v \) lt.eq frac(C \( 1 + \| v \| \), t + l) . $

On any bounded velocity set and any finite interval beginning at zero its integral along a flight is finite.
  The positive mild formula for (7.5) therefore retains the initial trace multiplied by a strictly positive
  survival factor. A bounded positive portion of the smooth nonzero bump gives positive interior mass.

If $l > 0$ and $lambda_oo = 0$, use Lemma 22 from time zero.
  The initial ratio has norm at most $lambda_n ell_n parallel chi \/ H parallel_oo$,
  independently of the spatial scaling of the bump. On $0 lt.eq t lt.eq tau_n lt.eq 1$, eventually $t +
  ell_n gt.eq l \/ 2$. The positive integral inequality and the elementary scalar integrating-factor estimate give

$ sup_(0 lt.eq t lt.eq tau_n) parallel f_n \( t \) parallel_oo lt.eq
  #scale(x: 120%, y: 120%)[\(] lambda_n ell_n parallel chi \/ H parallel_oo +
  epsilon_n #scale(x: 120%, y: 120%)[\)] e^(2 C \/ l) arrow.r 0 . $

This contradicts (8.1). Both alternatives also apply when $l = 1$, even if $tau_n arrow.r
  0$ or some hit occurs at time zero.

It remains to consider $l = 0$, so $tau_n arrow.r 1$. Suppose, to obtain a contradiction, that $g =
  0$ throughout the open interval $\( 0 \, U \)$. Nonnegativity upgrades this zero weak limit to local $L^1$
  convergence: if $K$ is a compact subset of the open spacetime–velocity region,
  take a nonnegative smooth compact test at least one on $K$.
  Its pairing with $h_n$ tends to zero, hence $integral_K h_n arrow.r 0$.
  Away from the velocity axis $H$ has a positive lower bound on compact velocity sets. Consequently

#[#set math.equation(numbering: n => "(8.7)")
 $ f_n arrow.r 0 quad upright("in measure on compact subsets of ") \( 0 \, U \) times bb(R)_x^3 times
   { macron(v) eq.not 0 } . $ <nc:zero-in-measure>]

Fix $0 < a < 1 \/ 4$, so that $a < tau_n$ for large $n$. The positive mild inequality (8.2) reads

$ f_n lt.eq d_n + cal(V)_n f_n + e_n \, $

where $d_n \( t \, x \, v \) = f_n \( a \, x - \( t - a \) v \, v \)$, $parallel d_n parallel_oo lt.eq a + ell_n$,
  and $0 lt.eq e_n lt.eq epsilon_n$ on this unit-length interval. Iterate the gain term five times.
  Using positivity and (8.6) gives

#[#set math.equation(numbering: n => "(8.8)")
 $ f_n \( t \, x \, v \) lt.eq \( a + ell_n + epsilon_n \) sum_(j = 0)^4
   frac(\( C log \( 1 \/ a \) \)^j, j !) + \( cal(V)_n^5 f_n \) \( t \, x \, v \) \, wide a lt.eq t lt.eq
   tau_n . $ <nc:five-residual>]

Every formula is used on a common full-measure set of characteristics for the finite approximation.

The term outside $cal(V)_n^5 f_n$ becomes arbitrarily small when first $n arrow.r oo$ and then $a arrow.b 0$.
  We therefore need to show that the five-fold term tends to zero at endpoints carrying a fixed positive fraction
  of the cap. We first control those endpoints, then separate axial and nonaxial limiting velocities.

=== 8.3 Compactness of the relevant endpoints <compactness-of-the-relevant-endpoints>

#thm([Lemma 8.3.])[
  (Endpoint and path truncations).  #emph[Fix $a > 0$, and let $t_n in \[ a \, 1 \]$.
    In a five-fold integral $\( cal(V)_n^5 F_n \) \( t_n \, x_n \, v_n \)$, assume $0 lt.eq F_n lt.eq 2$.
    For every prescribed error, one may restrict all $\| p_i \| + \| v_i -
    v_(i - 1) \|$ and sheet parameters to fixed bounded sets at that error, uniformly in $n \, t_n \, x_n \, v_n$.
    Moreover:]
  + #emph[if $\| v_n \| arrow.r oo$, the whole integral tends to zero;]
  + #emph[after retaining bounded endpoint velocities, an endpoint escaping every bounded neighborhood of every
    dilated periodic origin also has a vanishing integral.]
  #emph[Consequently any sequence along which the five-fold integral has a positive lower bound has,
    after periodic translations and subselection, convergent endpoint positions and velocities.]
] <nc:endpoint-tightness>

#proof[
  At any one gain, a removed normalized tail is uniformly small by Lemma 22.
    Bound the remaining four gains and the input $F_n$ by (8.6).
    Summing over the five possible locations of a removed tail proves the first assertion.
    The same argument at the first gain, using its uniform decay for large outgoing $v_n$, proves (i).
  On the retained paths all velocities are bounded by a fixed number,
    and the sum of free-flight lengths is at most that number.
    Thus every collision position is a bounded dilated distance from the endpoint.
    If its transverse distance from every periodic origin tends to infinity,
    each encountered main scale satisfies $mu = s \/ r_n arrow.r oo$, or no core is encountered.
    The bound $C \/ \( t + mu \) lt.eq C \/ mu$ makes the first nonzero core kernel negligible.
  Suppose instead that the transverse coordinate is bounded relative to a periodic origin while the axial
    coordinate escapes all such origins. Encountered main scales satisfy $0 < mu lt.eq M$.
    For bounded $p_3 \, t$, their amplitudes obey
  #[#set math.equation(numbering: n => "(8.9)")
   $ frac(K S \( gamma \( z - t p_3 \) \/ mu \), mu + t alpha gamma S \( gamma \( z - t p_3 \) \/ mu \)) lt.eq K /
     mu S \( gamma \( z - t p_3 \) \/ mu \) arrow.r 0 $ <nc:axial-escape>]
  uniformly in $0 < mu lt.eq M$ as $\| z \| arrow.r oo$. For example, when $\| z - t p_3 \| gt.eq Z$,
    the right side is at most $4 K mu^(- 1) e^(- 2 gamma Z \/ mu)$; its supremum over $0 < mu lt.eq
    M$ tends to zero. The core masks can only decrease these bounds.
    The same estimates hold for the first gain of every retained path,
    and the remaining gains have uniformly bounded mass.
  The period of the dilated density is $1 \/ r_n arrow.r oo$.
    Choose a nearest periodic origin before extracting the endpoint subsequence.
    A path of bounded dilated length cannot visit neighborhoods of two different such origins for large $n$.
    The two preceding alternatives cover failure of boundedness relative to the chosen origin, and prove (ii). ◻
]

=== 8.4 Two gains at an axial endpoint <two-gains-at-an-axial-endpoint>

For $mu > 0$ and $sigma in { - 1 \, 1 }$, denote by $u_(mu \, sigma) \( t \, z \)$ the solution of

$ u = sigma + alpha tanh #scale(x: 120%, y: 120%)[\(] gamma \( z - t u \) \/ mu #scale(x: 120%, y: 120%)[\)] . $

This notation extends the profile independently of every annular or stripe mask.

#thm([Lemma 8.4.])[
  (Characteristic matching and small scales).  #emph[On every compact set with $t gt.eq a > 0$,
    the following statements hold uniformly.]
  + #emph[If $a lt.eq t_2 lt.eq t_1$, $Delta = t_1 - t_2$, and $z_2 = z_1 - Delta w$, then
#[#set math.equation(numbering: n => "(8.10)")
 $ \| w - u_(mu \, sigma) \( t_1 \, z_1 \) \| lt.eq \| w -
   u_(mu \, sigma) \( t_2 \, z_2 \) \| . $ <nc:matching-inequality>]

]
  + #emph[As $mu arrow.b 0$, the distance of $u_(mu \, sigma) \( t \, z \)$ to
$ { z \/ t \, med sigma - alpha \, med sigma + alpha } $

 tends to zero uniformly. For the perturbed axial velocity in (8.3),
#[#set math.equation(numbering: n => "(8.11)")
 $ \| p_3 - u_(mu \, sigma) \( t \, z \) \| lt.eq d_s \| w_3 \| . $ <nc:thermal-speed-error>]

]
] <nc:characteristic-matching>

#proof[
  The profile satisfies
  $ partial_z u_(mu \, sigma) = frac(\( alpha gamma \/ mu \) S, 1 + \( t alpha gamma \/ mu \) S) gt.eq 0 \, wide
    partial_t u_(mu \, sigma) + u_(mu \, sigma) partial_z u_(mu \, sigma) = 0 . $
  For fixed $t_1 \, t_2 \, z_1$, the function $F \( w \) = w -
    u_(mu \, sigma) \( t_2 \, z_1 - Delta w \)$ has derivative $F' \( w \) gt.eq 1$.
    Its root is $u_(mu \, sigma) \( t_1 \, z_1 \)$: the defining implicit equation shows that this velocity is
    unchanged along the straight segment between the two points. Integrating $F' gt.eq 1$ proves (8.10).
  Fix $0 < delta < alpha$. If $u_(mu \, sigma)$ is within $delta$ of an endpoint speed, there is nothing to prove.
    Otherwise
  $ lr(|frac(u_(mu \, sigma) - sigma, alpha)|) lt.eq 1 - delta / alpha \, wide \| z - t u_(mu \, sigma) \| lt.eq
    mu / gamma "arctanh" \( 1 - delta \/ alpha \) . $
  It follows that
  $ \| u_(mu \, sigma) - z \/ t \| lt.eq frac(mu, gamma a) "arctanh" \( 1 - delta \/ alpha \) . $
  First choose $delta$, then $mu$ small. This proves the uniform assertion in (ii). Finally, the function
  $ p mapsto p - sigma - alpha tanh #scale(x: 120%, y: 120%)[\(] gamma \( z - t p \) \/ mu
    #scale(x: 120%, y: 120%)[\)] $
  has derivative at least one. Its values at $u_(mu \, sigma)$ and at the perturbed $p_3$ are $0$ and $d_s w_3$.
    This proves (8.11). ◻
]

#thm([Lemma 8.5.])[
  (Vanishing of two axial gains).  #emph[Fix $a > 0$. Let $t_n in \[ a \, 1 \]$,
    and suppose the endpoint positions and velocities are bounded with $macron(v)_n arrow.r 0$. Then
$ \( cal(V)_n^2 1 \) \( t_n \, x_n \, v_n \) arrow.r 0 . $

 The conclusion continues to hold if all subsequent factors in a longer finite gain integral are bounded uniformly.]
] <nc:two-axial-gains>

#proof[
  Remove normalized parameter and increment tails at an arbitrarily small cost, using Lemma 22.
    On the retained two-gain paths, all velocities and positions lie in fixed compact sets,
    the times lie in $\[ a \, 1 \]$, and every active scale satisfies $0 < mu lt.eq M$.
    In particular the largest possible physical width is $d_0 \( r_n M \)^10 arrow.r 0$.
  Write $t_1 \, x_1 = \( y_1 \, z_1 \)$ for the first collision point, and $xi$ for its input velocity.
    The next point has axial coordinate $z_2 = z_1 - \( t_1 - t_2 \) xi_3$.
    All estimates below are uniform when $t_1 \, x_1$ vary in their retained compact sets.
    At the first gain, Lemma 7 supplies a common modulus $omega \( rho \) arrow.b
    0$ for the mass of any axial interval of length $rho$; the interval’s center is arbitrary.
    It also says that for each fixed $b > 0$, the first-kernel mass on ${ \| macron(xi) \| >
    b }$ tends to zero as $macron(v)_n arrow.r 0$.
  Here is an order of choices that handles all scales at the second point.
    Fix an error $epsilon.alt > 0$, including the fixed factors from the two time integrations and the bound $C \/
    a$. Choose $delta > 0$ so that the sum of the first-kernel masses of the $delta$-neighborhoods of the five numbers
  #[#set math.equation(numbering: n => "(8.12)")
   $ z_1 \/ t_1 \, quad 1 - alpha \, quad 1 + alpha \, quad - 1 - alpha \, quad - 1 + alpha $ <nc:collapsed-speeds>]
  is at most $epsilon.alt$. This is possible uniformly because there are five intervals and their lengths are $2
    delta$. Lemma 24 then gives $mu_0 > 0$, chosen uniformly on the retained compact sets,
    so that every profile with $mu < mu_0$ is within $delta \/ 4$ of its corresponding three collapsed speeds.
  The geometric mesh has a uniformly bounded number $J_0$ of scales in $\[ mu_0 \, M \]$.
    Choose $b_0 > 0$ so small that the first-kernel mass of the union of the $b_0$-neighborhoods of
  $ { u_(mu \, sigma) \( t_1 \, z_1 \) : mu in \[ mu_0 \, M \] upright(" in the current mesh") \, med sigma =
    plus.minus 1 } $
  is at most $epsilon.alt$. For example it suffices that $2 J_0 omega \( 2 b_0 \) lt.eq epsilon.alt$,
    after incorporating the fixed amplitude bound into $omega$.
    This list may depend on $n$; its cardinality bound does not.
    Its centers may depend on $t_1 \, z_1$, which are held fixed when the first kernel is integrated.
    Thus neither dependence weakens the interval bound.
  Let $E_n \( t_1 \, z_1 \)$ be the union of these exceptional intervals.
    Outside $E_n$, every retained cold speed at the second point has an axial mismatch bounded below by a fixed
    positive number for all large $n$. For $mu gt.eq mu_0$, this follows from (8.10) and (8.11),
    with lower bound $b_0 \/ 2$. For a constant collapsed speed it follows immediately,
    with lower bound $delta \/ 2$. For the remaining branch use the exact identity
  $ xi_3 - z_2 / t_2 = t_1 / t_2 (xi_3 - z_1 / t_1) \; $
  the factor $t_1 \/ t_2 gt.eq 1$ preserves the lower bound.
    The errors $delta \/ 4$ in small-scale approximation and the vanishing thermal errors can be absorbed.
    We have therefore obtained, on the complement of $E_n$,
  $ \| xi_3 - p_3^(\( 2 \)) \| gt.eq c_(*) := 1 / 4 min \( delta \, b_0 \) > 0 $
  for every retained second-core parameter.
  The second-kernel axial mismatch estimate in Lemma 7 now tends uniformly to zero as $\| macron(xi) \| arrow.r
    0$. Choose $b > 0$ so small that this second kernel has mass at most $epsilon.alt$ whenever $\| macron(xi) \|
    lt.eq b$ and the displayed mismatch holds. For this fixed $b$,
    the first-kernel mass on $\| macron(xi) \| > b$ tends to zero.
    Its mass on $E_n$ is at most $2 epsilon.alt$, while the remaining first-kernel mass is bounded.
    Combining the three regions, then removing the initial tail error,
    gives a bound tending to zero as $epsilon.alt arrow.b 0$.
    All choices preceded the final passage $n arrow.r oo$, and were uniform in the two times. This proves the lemma.
  In a longer integral, all factors following these two gains are bounded by (8.6); the same proof applies. ◻
]

=== 8.5 Finite-dimensional regularization away from the axis <finite-dimensional-regularization-away-from-the-axis>

The next two lemmas make explicit the relation between plane area, redundant angular parameters,
  and the pullback of sets of small spacetime–velocity volume.

#thm([Lemma 8.6.])[
  (Redundant plane parameters).  #emph[Let $n eq.not 0$, $e = n \/ \| n \|$,
    and let $zeta$ be a bounded nonnegative function supported in $\[ - 1 \, 1 \]$ with integral one.
    For every nonnegative measurable $F$,
#[#set math.equation(numbering: n => "(8.13)")
 $ integral_(n^perp) F \( k \) frac(thin upright(d) A \( k \), \| n \|) =
   integral_(bb(R)^3) F \( n times L \) \| n \| zeta \( L dot.op e \) thin upright(d) L . $ <nc:plane-identity>]

 If $delta lt.eq \| n \| lt.eq R$ and $\| k \| lt.eq R_1$, the right side is supported in
$ \| L \| lt.eq sqrt(\( R_1 \/ delta \)^2 + 1) $

 and has density at most $R parallel zeta parallel_oo$. The identity can be applied successively when each normal
   is a measurable function of parameters chosen at earlier gains.]
] <nc:plane-parameters>

#proof[
  Write $L = L^perp + lambda e$. The map $L^perp mapsto n times
    L^perp$ multiplies two-dimensional area by $\| n \|^2$. Integration in $lambda$ contributes $integral zeta =
    1$, proving (8.13) and the support and density bounds. For successive gains,
    fix all previous parameters before applying the identity.
    The current normal is then fixed; Fubini’s theorem for nonnegative functions justifies iteration.
    No derivatives of the variable normals enter this conditional change of variables. ◻
]

#thm([Lemma 8.7.])[
  (Uniform pullback estimate).  #emph[Let $cal(O) subset bb(R)^k$ be open, $k gt.eq d$, and suppose $Phi_n \,
    Phi : cal(O) arrow.r bb(R)^d$ satisfy $Phi_n arrow.r Phi$ in $C_(upright("loc"))^1$ and $"rank" D Phi =
    d$ almost everywhere. Let $K subset.double cal(O)$ and $B subset bb(R)^d$ be compact.
    Let $a_n$ be measurable, supported in $K$, with $\| a_n \| lt.eq A$.
    Let $F_n$ be measurable, supported in $B$, with $\| F_n \| lt.eq M$, and converging to zero in measure. Then
#[#set math.equation(numbering: n => "(8.14)")
 $ integral_(cal(O)) \| F_n \( Phi_n \( q \) \) a_n \( q \) \| thin upright(d) q arrow.r 0 . $ <nc:pullback-conclusion>]

 No convergence or continuity of the densities $a_n$ is required.]
] <nc:uniform-pullback>

#proof[
  Boundedness and convergence in measure on the finite-volume set $B$ imply $parallel F_n
    parallel_(L^1 \( bb(R)^d \)) arrow.r 0$: for every $eta > 0$, bound the integral by $eta \| B \| +
    M \| { \| F_n \| > eta } \|$.
  Fix $epsilon.alt > 0$. The critical set in $K$ has measure zero,
    so choose an open neighborhood $E$ of it with $\| E ∩ K \| < epsilon.alt$.
    The compact set $K \\ E$ consists of regular points. At such a point $q_0$,
    choose $d$ input coordinates giving a nonzero minor of $D Phi \( q_0 \)$.
    Let $pi$ be projection onto the complementary $k - d$ coordinates, and define
  $ G \( q \) = \( Phi \( q \) \, pi q \) \, wide G_n \( q \) = \( Phi_n \( q \) \, pi q \) \, wide A_0 =
    D G \( q_0 \) . $
  The matrix $A_0$ is invertible. Choose a convex ball $V subset.double cal(O)$ about $q_0$ so small that,
    for all sufficiently large $n$,
  $ sup_(q in V) parallel A_0^(- 1) D G_n \( q \) - I parallel < 1 / 2 . $
  Integration on the line segment between $q \, q' in V$ gives
  $ \| A_0^(- 1) \( G_n \( q \) - G_n \( q' \) \) - \( q - q' \) \| lt.eq 1 / 2 \| q - q' \| . $
  Thus $G_n$ is injective on $V$, and its Jacobian has a positive lower bound $c_V$ independent of $n$.
    The inverse function theorem consequently makes it a diffeomorphism onto its image.
  Cover $K \\ E$ by finitely many such balls $V_j$. The change-of-variables formula gives
  $ integral_(V_j ∩ K) \| F_n \( Phi_n \( q \) \) \| thin upright(d) q & lt.eq
    c_(V_j)^(- 1) integral_(G_(n \, j) \( V_j ∩ K \)) \| F_n \( z \) \| thin upright(d) z thin thin upright(d) w\
 & lt.eq c_(V_j)^(- 1) \| pi_j \( V_j \) \| parallel F_n parallel_(L^1 \( bb(R)^d \)) . $
  When $k = d$, the zero-dimensional factor has value one. The integral on $E ∩ K$, including its density,
    is at most $A M epsilon.alt$. Sum over the finite cover, pass to the limit in $n$,
    and then let $epsilon.alt arrow.b 0$. This proves (8.14). ◻
]

#thm([Lemma 8.8.])[
  (Five-gain rank and robust pullback).  #emph[Fix a nonaxial endpoint velocity $v_0$,
    an endpoint $\( t_0 \, x_0 \)$ with $t_0 > 0$, five positive scales $mu_i$, and five signs $sigma_i$.
    Given positive times $t_i$ and $L_i in bb(R)^3$, define recursively
#[#set math.equation(numbering: n => "(8.15)")
 $ x_i & = x_(i - 1) - \( t_(i - 1) - t_i \) v_(i - 1) \,\
p_i & = u_(mu_i \, sigma_i) \( t_i \, z_i \) e_3 \, wide n_i = v_(i - 1) - p_i \,\
k_i & = n_i times L_i \, wide v_i = v_(i - 1) + k_i \, wide i = 1 \, dots.h \, 5 . $ <nc:rank-map>]

 The map
$ Phi : \( t_1 \, dots.h \, t_5 \, L_1 \, dots.h \, L_5 \) mapsto \( t_5 \, x_5 \, v_5 \) $

 is real analytic on the connected open set $\( 0 \, oo \)^5 times bb(R)^15$,
   and has rank seven almost everywhere. In particular it is a submersion almost everywhere on the ordered region
   $0 < t_5 < dots.h.c < t_1 < t_0$.]
  #emph[For convergent endpoint sequences with a nonaxial limiting velocity, convergent positive scale sequences,
    and the finite-temperature core formulas (8.3), the analogous maps converge in $C^1$ on compact parameter sets
    to $Phi$. Bounded measurable parameter densities supported in a common compact set therefore satisfy Lemma 27,
    including after any measurable spatial, velocity, or time restrictions.]
] <lem:five-gain-rank>

#proof[
  For $t > 0$, the derivative with respect to $u$ in the defining implicit equation is
  $ 1 + frac(t alpha gamma, mu) S #scale(x: 120%, y: 120%)[\(] gamma \( z - t u \) \/ mu
    #scale(x: 120%, y: 120%)[\)] > 0 . $
  The implicit analytic function theorem gives an analytic profile for every $z in bb(R)$.
    Uniqueness, which also follows from this strict monotonicity, identifies the local profiles on overlaps.
    The recursive formulas (8.15) are consequently analytic. They make sense even without ordering the positive
    times: a negative formal free-flight duration merely changes the point at which the next analytic profile is
    evaluated. This supplies the connected open domain stated in the lemma.
  We exhibit one rank-seven point. Fix $t_5 = tau$ with $0 < tau < t_0$,
    and set all five collision times equal to $tau$. After a rotation about the velocity axis,
    write $v_0 = \( R \, 0 \, z \)$, $R > 0$. All collision positions now coincide at $x_0 - \( t_0 - tau \) v_0$,
    independently of the angular parameters. Thus write the five axial velocities simply as $p_i = a_i e_3$;
    their values $a_i$ may be arbitrary.
  Choose
  $ k_1 = \( 0 \, 1 \, 0 \) \, wide k_2 = \( 1 \, - R \, 0 \) . $
  They satisfy $k_1 perp n_1$, $k_2 perp n_2$, and span the transverse plane. Put
  $ w = macron(v)_2 = \( R + 1 \, 1 - R \) eq.not 0 \, wide b_3 = v_(2 \, 3) - a_3 \, $
  and choose a sufficiently small nonzero number $epsilon.alt$ and
  $ k_3 = epsilon.alt (- frac(b_3 w, \| w \|^2) \, 1) . $
  Then $k_3 perp n_3$, its axial component is nonzero, and $macron(v)_3 eq.not 0$.
    Hence $k_1 \, k_2 \, k_3$ are linearly independent. Writing $macron(v)_3 = \( X \, Y \)$, take
  $ k_4 = \( - Y \, X \, 0 \) \, wide k_5 = 0 . $
  The fourth increment is perpendicular to $n_4$, and
  $ det \( macron(n)_4 \, macron(n)_5 \) = X^2 + Y^2 > 0 . $
  Thus $n_4 \, n_5$ are nonparallel. All the normals in this construction are nonzero,
    and every chosen increment can be represented by $L_i = - n_i times k_i \/ \| n_i \|^2$. Choose $L_5 = 0$.
  At the equal-time configuration,
  $ x_5 = x_0 - v_0 \( t_0 - t_1 \) - sum_(i = 1)^4 v_i \( t_i - t_(i + 1) \) . $
  All derivatives of $x_5$ in angular directions vanish. Keeping $t_5$ fixed, its first three time columns are
  $ partial_(t_1) x_5 = - k_1 \, wide partial_(t_2) x_5 = - k_2 \, wide partial_(t_3) x_5 = - k_3 . $
  Derivatives of the $v_i$, including derivatives of the position-dependent $p_i$,
    are multiplied by zero free-flight durations in this formula. In the final velocity block,
  $ delta_(L_4) v_5 = n_4 times delta L_4 \, wide delta_(L_5) v_5 = n_5 times delta L_5 \, $
  because $L_5 = 0$ and the $p_i$ have zero angular position derivatives at equal times.
    The sum of the planes $n_4^perp + n_5^perp$ is $bb(R)^3$. Choose three angular columns spanning this sum.
    Together with the three time columns above, they give an invertible $6 times 6$ block for $\( x_5 \, v_5 \)$:
    its upper-right block is zero and both diagonal blocks are invertible.
    Appending the $t_5$ column and target coordinate gives a nonzero $7 times 7$ minor.
  This minor is a nontrivial analytic function on the connected domain. Its zero set has Lebesgue measure zero.
    For completeness, at any zero of a nontrivial analytic function some derivative of finite order is nonzero;
    otherwise its Taylor series vanishes on a neighborhood, and analytic continuation through overlapping balls in
    the connected domain makes the function identically zero.
    Choosing a derivative of minimal nonzero order puts the point on a regular zero set of a derivative of one
    lower order. There are countably many such derivatives, and each regular zero set is covered by countably many
    smooth hypersurface charts. Their union is null. Rank failure is contained in the zero set of our particular
    minor, so it is null as well. Continuity also shows directly that the witness persists at nearby strictly
    ordered times. It need not obey any spatial mask.
  For the prelimit maps replace $p_i$ by (8.3) and include $w_i in bb(R)^3$ among the parameters.
    On compact sets the scales have positive lower bounds, $d_(r_n mu_i) arrow.r 0$,
    and all implicit derivatives have the same positive lower bound one.
    Differentiating the implicit equations, or applying their implicit function formulas,
    gives $C^1$ convergence in the times, positions, and all bounded $L_i \, w_i$.
    The limit is $Phi$, independent of the fifteen spectator $w_i$-coordinates.
    Its rank is still seven almost everywhere on the enlarged parameter domain, by Fubini.
    Lemma 27 now proves the final assertion. ◻
]

#thm([Lemma 8.9.])[
  (Vanishing of five nonaxial gains).  #emph[Suppose $ell_n arrow.r 0$,
    the hit endpoints converge after periodic translation, and their limiting velocity is nonaxial.
    Suppose also that $0 lt.eq f_n lt.eq 2$ on $a lt.eq t lt.eq tau_n$ and $f_n arrow.r
    0$ in measure on every compact subset of
$ \( 0 \, U \) times bb(R)_x^3 times { v in bb(R)^3 : macron(v) eq.not 0 } . $

 Then
$ \( cal(V)_n^5 f_n \) \( tau_n \, x_n \, v_n \) arrow.r 0 . $

]
] <nc:five-nonaxial-gains>

#proof[
  Fix an arbitrarily small error tolerance. Remove the tails of Lemma 23.
    All path velocities and positions are now in fixed bounded sets.
    At every encountered main core, $s lt.eq C r_n$, so its transverse width tends uniformly to zero.
  Starting from a positive lower bound for the endpoint transverse speed,
    apply the nonaxial small-input estimate in Lemma 7 successively at gains $1 \, dots.h \, 5$.
    Choose positive numbers $b_1 \, dots.h \, b_5$ so that deleting $\| macron(v)_i \| <
    b_i$ costs less than the prescribed error at step $i$. At each step the previous lower bound has already been
    fixed; the later gain masses are bounded by (8.6). Thus this is a finite successive choice,
    followed by $n arrow.r oo$. The sum of the five deleted contributions is arbitrarily small.
    Write $b > 0$ for a lower bound on all retained transverse speeds, including $v_0$.
    For large $n$, every retained normal $v_(i - 1) - p_i$ has length at least $b \/ 2$.
  Next delete collision points with $\| y_i \| < rho$. Conditional on all earlier parameters,
    $y_i$ is an affine function of $t_i$ with derivative $macron(v)_(i - 1)$. Consequently
  $ lr(|{ t_i : \| y_i \| < rho }|) lt.eq frac(2 rho, b) . $
  Integrate the current kernel using its mass bound $C \/ a$, and bound the later kernels by (8.6).
    Summing over the five steps bounds this deletion by $C_a rho \/ b$.
    Choose $rho > 0$ after the speed thresholds. The retained scales now belong to a compact subinterval
    $\[ mu_(-) \, mu_(+) \] subset \( 0 \, oo \)$. Mesh convergence gives a fixed finite list of scales on this
    interval, with positive limits, after an immaterial enlargement of its endpoints.
    There are consequently only finitely many five-tuples of scales and signs to consider.
  The tested time $t_5$ must remain inside the weak-limit interval.
    If $U > 1$, it already lies in the compact interval $\[ a \, 1 \] subset.double \( 0 \, U \)$.
    If $U = 1$, delete $t_5 > 1 - delta$. Ordering forces all five times into $\( 1 - delta \, tau_n \)$,
    whose length is at most $delta$. This costs at most
  #[#set math.equation(numbering: n => "(8.16)")
   $ 2 \( C \/ a \)^5 frac(delta^5, 5 !) . $ <nc:upper-endpoint-cost>]
  Choose $delta > 0$ to make this as small as desired. No convergence at the event time is being asserted.
  Fix one retained scale/sign tuple. Drop all spatial masks in constructing its maps,
    and retain the masks in its nonnegative integrand. Each plane increment is bounded,
    all normals are bounded above and below, and each cold parameter is bounded. Apply Lemma 26 successively.
    The integral becomes an integral over five times, fifteen $L$-coordinates,
    and fifteen cold parameter coordinates. Its support lies in a fixed compact subset of $\( 0 \, oo \)^5 times
    bb(R)^30$, and its density is uniformly bounded: the core amplitudes are at most $C \/ a$,
    the factors $\| n_i \| zeta \( L_i dot.op n_i \/ \| n_i \| \)$ are bounded,
    and all retained ratios $H \( v_i \) \/ H \( v_(i - 1) \)$ are bounded.
    The masks, time ordering, and cut conditions are arbitrary measurable factors between zero and one in this density.
  The target $\( t_5 \, x_5 \, v_5 \)$ on the actual support lies in a fixed compact set $B$ inside the open
    weak-limit region, away from the velocity axis. Set $F_n =
    f_n upright(bold(1))_B upright(bold(1))_({ a lt.eq t lt.eq tau_n })$ and extend it by zero;
    it is bounded by two and tends to zero in measure. The maps converge in $C^1$ to the map in Lemma 28.
    That lemma and Lemma 27 show that the integral for this tuple tends to zero.
    Notice that the entire parameter compact need not map into $B$;
    only the support of the measurable density must do so.
  There are finitely many tuples, so their sum tends to zero.
    The total limsup of the original integral is bounded by the arbitrarily small errors from the preceding
    deletions. Letting those tolerances tend to zero proves the lemma. ◻
]

=== 8.6 Completion of the nonvanishing argument <completion-of-the-nonvanishing-argument>

#proof[
  #emph[Completion of the proof of Proposition 21.] Assume $l = 0$ and $g = 0$, as in the reduction above.
    Choose endpoints $\( x_n \, v_n \)$ at time $tau_n$ in the common full-measure set fixed above such that
    $f_n \( tau_n \, x_n \, v_n \) gt.eq 1 \/ 2$. For each fixed $a$,
    the residual in (8.8) tends to zero along any subsequence of these endpoints.
    Indeed, Lemma 23 first excludes large velocities and escaping positions.
    Otherwise choose convergent endpoints after a periodic translation.
    If the limiting velocity is axial, the first two gains vanish by Lemma 25,
    and the last three have bounded mass by (8.6). If it is nonaxial, use (8.7) in Lemma 29.
    This covers every subsequence; hence the residual tends to zero for the original endpoint sequence as well.
  Taking the limsup in (8.8) at these endpoints gives
  $ 1 / 2 lt.eq a sum_(j = 0)^4 frac(\( C log \( 1 \/ a \) \)^j, j !) . $
  Finally let $a arrow.b 0$. The right side tends to zero, a contradiction.
    Throughout this argument $U$ was allowed to be infinite, and the case $U = 1$ was handled by (8.16).
    This proves the proposition. ◻
]

== 9 Branching growth and the dilated horizon <sec:branching>

We now choose the parameters left free in the construction.
  Their choice will be independent of the subsequence in Proposition 20,
  including the phase of its geometric mesh and its lower endpoint $l in \[ 0 \, 1 \]$.

#thm([Proposition 9.1.])[
  #emph[There are fixed positive choices of $eta \, alpha \, gamma \, K$, with $eta \, alpha \,
    gamma$ small and $K$ large, for which every limit in Propositions 20 and 21 has $U < oo$.
    These parameters can be fixed before the final choices of $s_0 \, d_0 \, T_0$.
    The same choices work for every limiting mesh and every $l in \[ 0 \, 1 \]$.]
] <prop:finite-dilated-horizon>

The proof uses only positive, finite collision histories starting at a strictly positive time.
  We first establish estimates in a constant medium.

=== 9.1 Positive histories and their normalization <positive-histories-and-their-normalization>

For $v \, w in bb(R)^3$ and $n in S^2$, set

#[#set math.equation(numbering: n => "(9.1)")
 $ Phi \( v \, w \, n \) = frac(v + w, 2) + frac(\| v - w \|, 2) n \, wide thin upright(d) 𝜍 \( n \) =
   frac(thin upright(d) n, 4 pi) . $ <br:sphere-map>]

Thus $𝜍$ is a probability measure. By Lemma 3, a collision with incident velocities $v \, w$ has rate $2 pi \| v -
  w \|$, and the marginal law of either child is the pushforward of $𝜍$ under $Phi \( v \, w \, dot.op \)$.
  The two marginal laws agree because $n mapsto - n$ preserves $𝜍$.
  Consequently, for a nonnegative velocity measure $B$ and a density $f$,

#[#set math.equation(numbering: n => "(9.2)")
 $ integral_(bb(R)^3) P \( B \, f \) \( v \) thin upright(d) v =
   integral_(bb(R)^3) nu_B \( v \) f \( v \) thin upright(d) v . $ <br:gain-mass>]

The coefficient $2$ in the gain of (7.5) therefore counts both children, while the loss removes their parent once.

More generally, fix Borel representatives of the coefficients of a two-beam medium

$ tilde(B) \( t \, x \) = sum_(sigma = plus.minus 1) b_sigma \( t \, x \) delta_(w_sigma \( t \, x \)) \, wide
  q_sigma \( t \, x \, v \) = 2 pi b_sigma \( t \, x \) \| v - w_sigma \( t \, x \) \| \, wide nu =
  sum_sigma q_sigma . $

All pointwise path conditions below refer to these representatives.
  On $\[ a \, b \]$, a history with ordered collision times $a < tau_1 < dots.h.c < tau_j < b$, signs $sigma_i$,
  and directions $n_i$ follows free flights between collisions and uses

$ V_(tau_i) = Phi \( V_(tau_i -) \, w_(sigma_i) \( tau_i \, X_(tau_i) \) \, n_i \) . $

Its weight relative to $product_i thin upright(d) tau_i thin upright(d) 𝜍 \( n_i \)$ is

#[#set math.equation(numbering: n => "(9.3)")
 $ exp (- integral_a^b nu \( s \, X_s \, V_s \) thin upright(d) s) product_(i = 1)^j 2
   q_(sigma_i) \( tau_i \, X_(tau_i) \, V_(tau_i -) \) . $ <br:history-weight>]

For $j = 0$ the empty product is one.

#thm([Lemma 9.2.])[
  #emph[Suppose $f gt.eq 0$ solves $D_t f = 2 P \( tilde(B) \, f \) - nu f$ in the local transport sense.
    On bounded positive-time regions where the coefficients and collision terms are integrable,
    start with any nonnegative portion of $f \( a \)$. Integration of any collection of bounded finite histories
    with weights (9.3) gives a measure dominated by $f \( b \)$.]
] <br:positive-histories>

#proof[
  Set $G = 2 P \( tilde(B) \, f \)$. In free coordinates $f^sharp \( t \, x \, v \) = f \( t \, x + t v \, v \)$,
    the equation becomes
  $ partial_t f^sharp = \( G - nu f \)^sharp . $
  On bounded tubes its right side is locally integrable, so $f^sharp$ has absolutely continuous time sections for
    almost every $\( x \, v \)$ and local $L^1$ time traces. Fubini’s theorem also makes $nu^sharp$ integrable on
    almost every bounded characteristic segment. The one-dimensional integrating-factor formula therefore consists
    of the freely transported initial density multiplied by its survival factor,
    plus the time integral of the nonnegative gain with the same survival factor.
    Repeated substitution into the gain gives (9.3), by (9.1) and (9.2). Every remainder is nonnegative.
    Restricting the histories, or the initial density, preserves the lower bound.
    Tonelli’s theorem justifies the substitutions. On bounded portions with total gain rate at most $C$,
    the $j$-collision term is bounded by $C^j \( b - a \)^j \/ j !$ times the initial mass.
  These formulas apply to point-velocity partners. Indeed Lemma 3 gives a density for the gain against each such
    partner, with mass (9.2). Thus free flight and each gain preserve absolute continuity when the starting
    measure has a density. Null spatial sets in representatives of the coefficients do not affect the integrated
    formula. ◻
]

For the background (7.3), $\| u_sigma \| lt.eq 1 + alpha$ and

#[#set math.equation(numbering: n => "(9.4)")
 $ 0 lt.eq b_sigma \( t \, x \) lt.eq frac(theta K, t alpha gamma) \, wide nu_B \( t \, x \, v \) lt.eq
   frac(C \( 1 + \| v \| \), t) quad \( t > 0 \) . $ <br:global-rate>]

At each mesh interface choose the value from the outer adjacent annulus,
  and on the transverse axis set the medium to zero. These are Borel representatives obeying the same bounds.
  All bounded finite flights starting at positive time have strictly positive survival.
  The cap and Lemma 6 give locally integrable collision terms.
  The local transport formula in Proposition 20 therefore supplies time traces of $g$ on bounded regions.
  Testing nonnegative compact functions and taking a time limit shows that $g \( t \) lt.eq \( t + l \)
  H$ also holds at these traces. We use this representative.

=== 9.2 A reference flight with a positive potential <a-reference-flight-with-a-positive-potential>

We convert the branching history weights into expectations along a single Markov flight with a positive potential.
  This is a jump-process Feynman–Kac representation, related to the many-to-one formulas for branching systems;
  see #cite(label("HarrisRoberts2017")) Section 4.1 for general probabilistic context.
  The finite-history calculation below proves the precise representation for the present collision law.

Fix

$ D = 5 \, wide E = { v : \| v \| lt.eq D } \, wide B_0 = delta_(e_3) + delta_(- e_3) \, wide nu_0 \( v \) =
  2 pi #scale(x: 120%, y: 120%)[\(] \| v - e_3 \| + \| v + e_3 \| #scale(x: 120%, y: 120%)[\)] . $

Let $J \( v \, thin upright(d) v' \)$ be the single-child law obtained by choosing a sign with probabilities
  proportional to $\| v - sigma e_3 \|$ and then using (9.1). Put $p \( v \) = J \( v \, E \)$.

#thm([Lemma 9.3.])[
  #emph[For every $v in E$, $p \( v \) gt.eq 25 \/ 26$. The reference history sum restricted to velocities in $E$
    is represented by a Markov flight with velocity jump rate $lambda \( v \) = 2 p \( v \) nu_0 \( v \)$,
    jump law $J \( v \, thin upright(d) v' \) upright(bold(1))_E \( v' \) \/ p \( v \)$, and multiplicative weight
$ exp (integral_0^A cal(W) \( V_s \) thin upright(d) s) \, wide cal(W) \( v \) = \( 2 p \( v \) - 1 \) nu_0 \( v \) . $

 One may take
#[#set math.equation(numbering: n => "(9.5)")
 $ 0 < c_0 = frac(48 pi, 13) lt.eq cal(W) \( v \) \, wide lambda \( v \) lt.eq C_0 =
   48 pi quad \( v in E \) . $ <br:potential-bounds>]

]
] <br:retention>

#proof[
  Set $s = \| v \|^2$, $z = v_3$, and $R = sqrt(\( s + 1 \)^2 - 4 z^2)$.
    For either partner sign the squared child speed has the law
  $ \| v' \|^2 = frac(s + 1 + R Z, 2) \, wide Z upright(" uniform on ") \[ - 1 \, 1 \] . $
  This follows by expanding the square in (9.1): a coordinate of a uniform point on $S^2$ is uniform on
    $\[ - 1 \, 1 \]$. The maximum is at most $s + 1$, so there is no exit for $s lt.eq 24$.
    For $24 < s lt.eq 25$, the exit probability, if positive, is
  $ 1 / 2 + frac(s - 49, 2 R) lt.eq 1 / 2 + frac(s - 49, 2 \( s + 1 \)) = frac(s - 24, s + 1) lt.eq 1 / 26 . $
  The inequality uses $R lt.eq s + 1$ and $s - 49 < 0$. If $R = 0$,
    the squared speed is deterministic and at most 25. Mixing the signs preserves the bound.
  A Markov history of rate $lambda$ has the survival factor $e^(- integral lambda)$,
    and one rate times jump-law factor per collision. Multiplication by $e^(integral \( lambda - nu_0 \))$ changes
    this exactly to (9.3), restricted to $E$. Both history sums converge absolutely on finite intervals because
    their rates are bounded. Finally $4 pi lt.eq nu_0 \( v \) lt.eq 24 pi$ on $E$, and $2 p \( v \) - 1 gt.eq
    12 \/ 13$, giving (9.5). ◻
]

=== 9.3 Three collisions give a volume minorization <three-collisions-give-a-volume-minorization>

Write $P_t \( v \, dot.op \)$ for the transition law of the preceding velocity process.
  We establish a Doeblin minorization, the classical common-mass condition for mixing of Markov chains
  #cite(label("Doeblin1940")). The three-collision geometry proving this condition and the resulting contraction
  argument are both given below.

#thm([Lemma 9.4.])[
  #emph[There are $r_0 > 0$ and $epsilon_0 > 0$ such that
#[#set math.equation(numbering: n => "(9.6)")
 $ P_1 \( v \, A \) gt.eq epsilon_0 \| A ∩ B \( 0 \, r_0 \) \| quad \( v in E \) $ <br:doeblin>]

 for every Borel set $A subset E$. For each $zeta > 0$, there is also $epsilon_zeta > 0$ such that
$ P_1 \( v \, B \( e_1 \, zeta \) ∩ { \| v' \| < D } \) gt.eq epsilon_zeta quad \( v in E \) . $

]
] <br:minorization>

#proof[
  Given $v in E$, choose a sign with $\| v - sigma e_3 \| gt.eq 1$.
    Use this partner for the first collision, and select an output within a small fixed distance $delta$ of $sigma
    e_3$. Its probability has a uniform positive lower bound:
    the incident distance lies in $\[ 1 \, 6 \]$, and a cap of fixed Euclidean radius $delta$ at that endpoint has
    area probability bounded below uniformly on the corresponding diameter spheres.
    Such first outputs lie strictly in $E$.
  Use partner $- sigma e_3$ next. If the first output is exactly $sigma e_3$,
    the second sphere is the unit sphere; restrict its output $u$ near $e_1$.
    For the third collision use partner $e_3$. The last output is
  $ T \( u \, n \) = frac(u + e_3, 2) + frac(\| u - e_3 \|, 2) n . $
  At $u = e_1$, $n_0 = - \( e_1 + e_3 \) \/ sqrt(2)$, this output is zero.
    The two angular derivatives in $n$ span $\( e_1 + e_3 \)^perp$.
    The vector $e_3$ is tangent to the preceding unit sphere at $e_1$, and direct differentiation gives
  #[#set math.equation(numbering: n => "(9.7)")
   $ partial_(e_3) T \( e_1 \, n_0 \) = frac(e_1 + 3 e_3, 4) \,
     wide \( e_1 + e_3 \) dot.op partial_(e_3) T \( e_1 \, n_0 \) = 1 . $ <br:rank-derivative>]
  Thus the map of the four angular coordinates in the last two collisions to the last velocity has rank three.
  Take the two coordinates of $n$ and the coordinate of $u$ with derivative $e_3$ as distinguished variables,
    and hold the fourth coordinate in a short interval. The inverse function theorem,
    with this fourth coordinate and the first output as parameters,
    gives neighborhoods on which the distinguished-variable map is one-to-one,
    its Jacobian and inverse Jacobian are bounded, and its image contains a fixed ball $B \( 0 \, r_0 \)$.
    Shrink these neighborhoods and $delta$ so this holds for every first output within $delta$ of $sigma e_3$,
    for both signs. Sphere area in these coordinates has a positive lower density.
    Change of variables in the three distinguished coordinates, and integration in the fourth,
    give a fixed positive multiple of volume on $B \( 0 \, r_0 \)$.
  Force the three times into three fixed, disjoint intervals inside $\( 0 \, 1 \)$, and prohibit other jumps.
    The first selected relative speed is at least 1, the second is close to 2, and the third close to $sqrt(2)$.
    In the reference Markov process the selected transition intensity is
  $ 4 pi \| v - sigma e_3 \| thin upright(bold(1))_E \( Phi \( v \, sigma e_3 \, n \) \) thin upright(d) 𝜍 \( n \) . $
  It has positive uniform lower density on the patches just specified.
    The no-additional-jump factor is at least $e^(- C_0)$. Integrating the times proves (9.6).
    Keeping only the first two collisions, selecting a small patch near $e_1$ in the second,
    and prohibiting later jumps proves the last assertion. ◻
]

#thm([Lemma 9.5.])[
  #emph[The reference process has a stationary probability law $pi$ with $integral v thin upright(d) pi \( v \) =
    0$. There are $C \, c > 0$ such that
$ sup_(v in E) parallel P_t \( v \, dot.op \) - pi parallel_(upright("TV")) lt.eq C e^(- c t) \, wide
  sup_(v in E) bb(E)_v lr(|A^(- 1) integral_0^A V_s thin upright(d) s|)^2 lt.eq C / A quad \( A gt.eq 1 \) . $

]
] <br:mixing>

#proof[
  The normalized measure on the right side of (9.6) is a common part of positive mass $epsilon.alt$ in all rows of
    $P_1$. Removing this common part shows that the map $mu mapsto mu
    P_1$ contracts total variation distance by $1 - epsilon.alt$.
    Probability measures form a complete space in that metric,
    so iteration yields a unique fixed point $pi$ and uniform geometric convergence.
    Since $P_t$ commutes with $P_1$, $pi P_t$ is another fixed point of $P_1$, hence equals $pi$.
    Contractivity of Markov kernels gives the estimate between integer times.
  Negation of velocity interchanges the two signs and preserves $E$,
    so uniqueness of $pi$ makes it symmetric and its mean zero.
    Consequently $sup_(v in E) \| bb(E)_v V_t \| lt.eq C e^(- c t)$. The Markov property and bounded velocities imply
  $ \| bb(E) \( V_s dot.op V_t \) \| lt.eq C e^(- c \( t - s \)) quad \( 0 lt.eq s lt.eq t \) $
  uniformly over starting states. Integrating this estimate on $\[ 0 \, A \]^2$ bounds the second moment of
    $integral_0^A V_s thin upright(d) s$ by $C A$. ◻
]

=== 9.4 A displacement block and measurable perturbations <a-displacement-block-and-measurable-perturbations>

Fix $d = 1 \/ 10$, and choose once and for all

#[#set math.equation(numbering: n => "(9.8)")
 $ 0 < kappa < min {1 / 4 \, frac(c_0, 2 C_0) \, r_0 / 4} . $ <br:kappa-choice>]

In particular a small ball about $kappa e_1$ lies in the minorization ball.

To repeat growth in the cold background, we will transport mass through boxes whose transverse distance from the
  axis grows proportionally to time:

$ cal(B)_t = { \( x \, v \) : \| x - kappa t e_1 \| lt.eq d kappa t \, med \| v \| lt.eq D } \, wide t > 0 . $

For a duration $Delta > 0$, a displacement within $d kappa Delta$ of $kappa Delta
  e_1$ carries every starting point of $cal(B)_t$ into $cal(B)_(t + Delta)$,
  provided the final velocity remains in $E$. We first obtain growth with this displacement in the reference
  medium, then transfer it to the varying cold background.

#thm([Lemma 9.6.])[
  #emph[There is a finite $L$ such that, for all
$ A in I_L := [frac(L, 1 + d) \, frac(L, 1 - d)] \, wide v in E \, $

 reference branching histories with velocities in $E$, final velocity strictly inside $E$,
   and displacement $Z_A$ satisfying
#[#set math.equation(numbering: n => "(9.9)")
 $ \| Z_A - kappa A e_1 \| < 3 / 4 d kappa A $ <br:strict-drift>]

 have total weight greater than 8.]
] <br:reference-block>

#proof[
  Put $A_0 = \( 1 - kappa \) A - 1$. On the first interval of length $A_0$,
    require the reference Markov flight to have integrated velocity of norm at most $A d kappa \/ 4$.
    Lemma 34 and Chebyshev’s inequality give probability at least $1 \/ 2$,
    uniformly in the start when $A$ is sufficiently large. Over the next unit interval require the last velocity
    to lie in $B \( e_1 \, d \/ 4 \)$. The conditional probability is at least a fixed $epsilon > 0$, by Lemma 33.
    Require no jump during the final interval of length $kappa A$,
    whose conditional probability is at least $e^(- C_0 kappa A)$.
  The errors in displacement from $kappa A e_1$ on the three intervals are at most $A d kappa \/ 4$, $D$,
    and $A d kappa \/ 4$. For $A > 4 D \/ \( d kappa \)$ their sum is less than $3 A d kappa \/ 4$.
    The final velocity lies strictly in $E$. Lemma 32 bounds the branching weight below by
  $ epsilon / 2 exp \( \( c_0 - C_0 kappa \) A \) . $
  Its exponent is positive by (9.8). Choose $L$ large enough that this exceeds 8,
    and all the preceding lower bounds on $A$ hold throughout $I_L$. ◻
]

#thm([Lemma 9.7.])[
  #emph[For these fixed $kappa \, L$, there are $J in bb(N)$ and $epsilon_(*)
    in \( 0 \, 1 \/ 4 \)$ with the following property. Suppose a measurable medium obeys,
    throughout every speed-$D$ excursion from a specified starting point over a duration $A in I_L$,
#[#set math.equation(numbering: n => "(9.10)")
 $ \| b_sigma - 1 \| lt.eq epsilon_(*) \, wide \| w_sigma - sigma e_3 \| lt.eq
   epsilon_(*) quad \( sigma = plus.minus 1 \) . $ <br:medium-closeness>]

 From each starting velocity in $E$, histories with at most $J$ collisions,
   speed at most $D$ on every free flight, every postcollision velocity and the final velocity strictly inside $E$, and
#[#set math.equation(numbering: n => "(9.11)")
 $ \| Z_A - kappa A e_1 \| < d kappa A $ <br:robust-drift>]

 have total weight greater than 3. The initial free flight may have speed $D$. No continuity of the medium is needed.]
] <br:robust-block>

#proof[
  Fix a reference start and duration $\( v \, A \) in E times I_L$.
    The zero-collision term has weight $e^(- nu_0 \( v \) A) lt.eq 1$.
    Discarding it from the family in Lemma 35 leaves weight greater than 7.
    Monotone convergence in the positive history count permits restricting to finitely many counts $j gt.eq
    1$ while retaining weight greater than 7. Every postcollision velocity lies strictly in $E$ almost surely:
    the intersection of a nondegenerate diameter sphere with $partial E$ has sphere area zero,
    and a degenerate collision has zero rate. This includes the final velocity.
    No inward margin is required for the initial velocity. The displacement inequality is strict.
    Ordered times may be kept apart and away from the endpoints.
    Using finitely many sphere coordinate charts and inner regularity of their parameter integrals,
    restrict further to compact parameter sets with total weight greater than 6 and positive margins in all these
    restrictions, including $\| Z_A - kappa A e_1 \| < d kappa A$. Parameterize the times as fractions of $A$.
  The reference paths and weights are continuous in these finite parameters and in $\( v \, A \)$.
    The fixed compact tests therefore retain weight greater than 5 and at least half their original positive
    margins in a sufficiently small relative neighborhood of that start and duration in $E times I_L$.
    These neighborhoods cover the compact set $E times I_L$. A finite subcover gives finitely many tests,
    a maximum count $J$, and uniform positive margins.
  Use the same initial velocity, signs, directions, and fractional times for each perturbed history and its
    reference history. Their first flights have speed at most $D$, including boundary starts. The sphere map satisfies
  $ \| Phi \( v \, w \, n \) - Phi \( tilde(v) \, tilde(w) \, n \) \| lt.eq \| v - tilde(v) \| + \| w - tilde(w) \| . $
  Induction bounds the velocity error after $j$ collisions by $j epsilon_(*)$ and the displacement error by $A J
    epsilon_(*)$. This comparison does not compare the medium at two nearby positions:
    its value at the actual perturbed position is close to the same constant reference partner.
    A sufficiently small $epsilon_(*)$ preserves all the strict velocity and displacement margins.
    The actual paths thus have speed at most $D$, so they stay within the region on which closeness was assumed.
    Formally this follows by induction up to the first possible failure; the preserved margins exclude such a failure.
  The relative-speed errors and full loss-rate errors on these histories are bounded by $C_J epsilon_(*)$.
    The density error gives the same bound for the gain-rate factors.
    The interval has bounded length, so the error in the integrated loss and its exponential is bounded by
    $C_(J \, L) epsilon_(*)$. Finite products of the bounded gain factors then show that (9.3) changes by at most
    $C_(J \, L) epsilon_(*)$ uniformly on each test. The tests have finite parameter measure.
    Decreasing $epsilon_(*)$ makes their integrals greater than 3.
    All coefficient estimates were pointwise; measurability is sufficient. ◻
]

=== 9.5 Uniform choices of the construction parameters <uniform-choices-of-the-construction-parameters>

We first reserve one more small geometric tolerance. There is $alpha_(upright("acc")) > 0$,
  depending only on $kappa$ and Lemma 33, with this property:
  after a first collision puts a velocity sufficiently close to $sigma e_3$, two more collisions,
  with partners within $alpha_(upright("acc"))$ of $- sigma e_3 \, e_3$, have positive angular probability of ending in

#[#set math.equation(numbering: n => "(9.12)")
 $ B \( kappa e_1 \, d kappa \/ 4 \) . $ <br:access-velocity>]

Indeed the inverse-coordinate construction in that lemma, with first output exactly $sigma e_3$,
  maps a positive-measure angular set into $B \( kappa e_1 \, d kappa \/ 8 \)$,
  which is inside $B \( 0 \, r_0 \)$. Keep a compact subset of positive measure in this set.
  Its outputs have a positive distance from the complement of (9.12);
  the intermediate velocities and relative speeds remain in the neighborhoods of that construction.
  Uniform continuity of the two sphere maps preserves this for sufficiently small perturbations of the first
  output and partners, including measurable partners at the actual path positions.
  Take the smaller tolerance for the two possible signs. We also require $alpha_(upright("acc"))$ to be less than
  half the permitted radius of the first-output neighborhood.

The constants $kappa \, L \, J \, epsilon_(*) \, alpha_(upright("acc"))$ are now fixed and do not involve any
  construction parameter. Fix preliminary bounds $eta lt.eq 1$, $alpha lt.eq 1$, $K gt.eq 1$. For $t > 0$, put

#[#set math.equation(numbering: n => "(9.13)")
 $ Delta = frac(L kappa t, theta K) \, wide a = frac(L kappa, theta K) . $ <br:moving-box>]

At a starting point $x_0 = \( y_0 \, z_0 \)$ in $cal(B)_t$,

$ \( 1 - d \) kappa t lt.eq \| y_0 \| lt.eq \( 1 + d \) kappa t . $

Every speed-$D$ excursion over $\[ t \, t + Delta \]$ satisfies

$ \| \| y \| - \| y_0 \| \| lt.eq D Delta \, wide \| z \| lt.eq d kappa t + D Delta . $

Set $delta_K = D L \/ \( theta K \( 1 - d \) \)$. By increasing $K$, impose $delta_K lt.eq 1 \/ 4$ and $a lt.eq
  1 \/ 4$. Then

$ \| y \| gt.eq \( 1 - delta_K \) \( 1 - d \) kappa t . $

For all sufficiently large $t$, every such excursion is outside the lower mesh hole, since $l lt.eq 1$.
  On its active annulus $e^(- eta) \| y \| lt.eq mu lt.eq \| y \|$, for every mesh phase.
  Thus, with a fixed constant $C_1$ depending only on $d \, D$,

#[#set math.equation(numbering: n => "(9.14)")
 $ lr(|frac(\| y_0 \|, mu) - 1|) & lt.eq C_1 \( eta + delta_K \) \,\
tau / mu & lt.eq C_1 / kappa \,\
frac(\| z - tau u_sigma \|, mu) & lt.eq C_1 / kappa wide \( t lt.eq tau lt.eq t + Delta \) .
  $ <br:comparison-quantities>]

The last estimate uses $\| u_sigma \| lt.eq 2$.

Use the reference density factor $rho_0 = theta K \/ \| y_0 \|$,
  and multiply both time and position units by $rho_0$; velocities are unchanged. The reference duration is exactly

#[#set math.equation(numbering: n => "(9.15)")
 $ A = rho_0 Delta = frac(L kappa t, \| y_0 \|) in I_L . $ <br:duration-scaling>]

With $S_sigma = S \( gamma \( z - tau u_sigma \) \/ mu \)$, the density ratio in these units is

#[#set math.equation(numbering: n => "(9.16)")
 $ frac(b_sigma \( tau \, x \), rho_0) = frac(\| y_0 \|, mu) thin
   frac(S_sigma, 1 + \( tau alpha gamma \/ mu \) S_sigma) . $ <br:density-ratio>]

Because $1 - "sech"^2 h = tanh^2 h lt.eq h^2$, (9.14) gives, when the right-hand small quantities are at most one,

#[#set math.equation(numbering: n => "(9.17)")
 $ lr(|b_sigma / rho_0 - 1|) lt.eq C_2 (eta + delta_K + \( gamma \/ kappa \)^2 + alpha gamma \/ kappa) \,
   wide \| u_sigma - sigma \| lt.eq alpha . $ <br:uniform-medium-error>]

Here $C_2$ is independent of $t \, l$, and mesh phase.

Choose $eta > 0$ small, then

$ 0 < alpha < min { 1 \/ 4 \, epsilon_(*) \, alpha_(upright("acc")) } \, $

then $gamma > 0$ small, so that the first, third, and fourth terms on the right of (9.17),
  including their factor $C_2$, sum to less than $epsilon_(*) \/ 2$.
  Finally increase $K$ so the $delta_K$ term is less than $epsilon_(*) \/ 2$, the preliminary restrictions hold, and

#[#set math.equation(numbering: n => "(9.18)")
 $ \( 1 + a \)^4 < 3 . $ <br:growth-exponent>]

This establishes (9.10) for all the scaled blocks, with no choice depending on a limit, mesh, or solution.

These choices precede the final small geometric and thermal parameters.
  Making $alpha gamma$ small may increase the fixed coefficient in (9.4) and earlier comparison bounds,
  but introduces no dependence on the approximation index. Propositions 14 and 16 allow $s_0 \, d_0$,
  and then the final short horizon $T_0$, to be chosen after these fixed constants. We use those choices henceforth.

=== 9.6 Access to a late box and the growth contradiction <access-to-a-late-box-and-the-growth-contradiction>

#thm([Lemma 9.8.])[
  #emph[For the fixed parameters above, let $g equiv.not 0$ solve (7.5) on $0 < t < oo$ with $0 lt.eq
    g lt.eq \( t + l \) H$, for any allowed mesh and $l in \[ 0 \, 1 \]$.
    Then $integral_(cal(B)_t) g \( t \, x \, v \) thin upright(d) x thin upright(d) v >
    0$ at arbitrarily large finite times.]
] <br:accessibility>

#proof[
  At some positive time $a_0$, a bounded portion of $g \( a_0 \)$ has positive mass.
    The velocity axis has Lebesgue measure zero, so a further portion of positive mass satisfies
  $ \| x \| lt.eq R \, wide \| v \| lt.eq R \, wide \| macron(v) \| gt.eq delta > 0 . $
  For a sufficiently long but finite free flight of length $s$,
  $ \| y + s macron(v) \| gt.eq s delta - R > l + 2 $
  on this portion. Its survival is bounded below by a positive constant by (9.4).
    Lemma 31 gives positive mass in a bounded region strictly outside the hole at time $a_1 = a_0 + s$.
  Choose $h > 0$ small so that paths whose initial speed is at most $R$ and whose later speeds are at most 3
    remain in a bounded region with $\| y \| > l + 1$ during $\[ a_1 \, a_1 + h \]$.
    Both sign densities have strictly positive lower bounds there.
    To see this directly, the time, axial coordinate, and transverse radius are bounded,
    the transverse radius has a positive lower bound, and $e^(- eta) \| y \| lt.eq mu lt.eq \| y \|$.
    The argument of $S$ is therefore bounded, its numerator is positive,
    and the denominator in (7.3) is bounded above. The rates on the selected bounded-speed paths also have finite
    upper bounds.
  Confine three collisions to this short interval. Choose a reference sign with $\| v - sigma e_3 \| gt.eq
    1$ for the first collision. The actual relative speed is at least $1 - alpha gt.eq 3 \/ 4$.
    Choose its output in a sufficiently small cap about the actual partner.
    The cap probability has a positive lower bound for inputs bounded by $R$.
    Since the actual partner is within $alpha$ of $sigma e_3$,
    this first output lies in the reserved first-output neighborhood.
    Next use the signs $- sigma$ and $+ 1$, and the compact angular tests defining $alpha_(upright("acc"))$.
    Their final velocity lies in (9.12). The second output stays near $e_1$,
    so the second and third relative speeds have positive lower bounds; all postcollision speeds are at most 3.
    Put the three times in disjoint subintervals and prohibit other collisions.
    Positive lower bounds for the selected gain factors, angular probabilities, time-interval lengths,
    and survival give strictly positive total weight. The sphere-map comparison used here requires only uniform
    partner closeness, and therefore remains valid for measurable coefficients.
  There is consequently a bounded positive portion at time $a_2 = a_1 + h$ with $\| v -
    kappa e_1 \| < d kappa \/ 4$. Let $R_2$ bound $\| x - kappa a_2 e_1 \|$ on that portion.
    After free flight to any sufficiently large finite time $t$,
  $ \| x + \( t - a_2 \) v - kappa t e_1 \| lt.eq R_2 + frac(d kappa, 4) \( t - a_2 \) < d kappa t . $
  Its speed is strictly less than $D$. For each finite $t$, survival remains strictly positive by (9.4).
    The zero-collision term of Lemma 31 proves the assertion. ◻
]

#proof[
  Suppose an extracted limit has $U = oo$. Proposition 21 makes it nonzero.
    Lemma 37 gives a sufficiently large $t_0$ with positive mass $m_0$ in $cal(B)_(t_0)$.
    Increase $t_0$ if necessary so that all the excursions considered in (9.13) lie above the lower hole.
    The same holds for every later block.
  At each starting point of $cal(B)_t$, apply Lemma 36 using the simultaneous space–time scaling (9.15).
    Translating back its displacement restriction gives
  $ \| x_(upright("end")) - x_(upright("start")) - kappa Delta e_1 \| < d kappa Delta . $
  The starting radius $d kappa t$, followed by the triangle inequality,
    places the endpoint in $cal(B)_(t + Delta)$. The velocity belongs to $E$:
    the selected positive-count histories have a strictly interior final velocity.
    Their first flight need only have speed at most $D$, exactly as in the medium comparison.
    History weights are unchanged by this scaling: each gain rate is divided by $rho_0$,
    each time differential is multiplied by $rho_0$, and the integrated loss is invariant.
    The selected histories therefore have total weight greater than 3 uniformly over starts in $cal(B)_t$.
  Use the kernel obtained by integrating all histories with $1 lt.eq j lt.eq
    J$ that satisfy the block’s velocity and displacement restrictions.
    The finite compact tests above certify its weight greater than 3;
    no choice of a test for each starting point is needed. Integrate this positive kernel against the portion of
    $g \( t \)$ in the box and use Lemma 31. At $t_n = \( 1 + a \)^n t_0$, induction gives
  $ integral_(cal(B)_(t_n)) g \( t_n \, x \, v \) thin upright(d) x thin upright(d) v gt.eq 3^n m_0 . $
  The cap and $l lt.eq 1$, on the other hand, give
  $ integral_(cal(B)_(t_n)) g \( t_n \, x \, v \) thin upright(d) x thin upright(d) v lt.eq \( t_n + 1 \)
    frac(4 pi, 3) \( d kappa t_n \)^3 integral_E H \( v \) thin upright(d) v lt.eq C \( 1 + t_n \)^4 . $
  This contradicts (9.18) as $n arrow.r oo$. The positive mass $m_0$ and starting time may depend on the
    particular limit; their sizes are immaterial to this comparison.
    The parameters governing the blocks were fixed before the mesh and $l$ were chosen.
    Thus every extracted limit has finite dilated horizon. ◻
]

== 10 Separation of two solutions with the same datum <sec:separation>

We now combine the two compactness procedures. All parameters have been fixed as in Proposition 30,
  with the final small parameters chosen to satisfy the preceding cold and cap estimates.
  Fix one dormant limit $F^(upright(d))$ on $\[ 0 \, T_0 \]$, supplied by Proposition 18.

#thm([Lemma 10.1.])[
  #emph[As $T arrow.b 0$,
$ T^(- 1) F^(upright(d)) \( T t \, T x \, v \) arrow.r 0 $

 in distributions on compact subsets of
$ 0 < t < 1 \, wide x in bb(R)^3 \, quad v in bb(R)^3 \, quad macron(v) eq.not 0 . $

 The evaluation in $x$ uses the periodic lift centered at the origin.]
] <sep:dormant-vanishing>

#proof[
  The dormant majorant passes to the fixed-horizon weak limit.
    Its hot part is at most $t_(upright("old"))^2 H$, so after dilation and multiplication by $T^(- 1)$ it is
    bounded by $T t^2 H$, which vanishes in $L^1$ on the indicated compact sets.
  For the cold majorant, a main enlarged annulus at physical transverse position $y_(upright("old")) = T y$,
    with $y$ bounded, has $s lt.eq C T$. The relevant periodic copy is the one centered at the origin for all
    sufficiently small $T$; other copies contribute only escaped tails.
    For $\| macron(v) \| gt.eq epsilon > 0$, the transverse Gaussian in the cold estimate gives,
    after enlarging fixed constants,
  $ c_(upright("main")) \( T t \, T x \, v \) lt.eq C s^(- 31) exp #h(-0.16667em) (- frac(c epsilon^2, d_0^2 s^20)) . $
  The right side, maximized over $0 < s lt.eq C T$, tends to zero faster than any power of $T$.
    At points with no main color only tails are present. The escaped sum is at most $C_A \( T t \)^A
    e^(- 4 \| v \|^2)$, and after multiplication by $T^(- 1)$ it vanishes for $A > 1$.
    These uniform bounds on the compact set prove the claim. ◻
]

#proof[
  The datum is (4.4); Lemma 12 verifies all its integrability requirements and bounded velocity support.
    For every horizon $0 < T lt.eq T_0$, Proposition 16 gives cap approximations.
    Proposition 18 gives at least one admissible limit on $\[ 0 \, T \]$, with the same datum as $F^(upright(d))$.
  Suppose, to obtain a contradiction, that there are horizons $T_k arrow.b
    0$ at each of which a cap limit can equal $F^(upright(d))$ on that interval.
    At each fixed $T_k$, choose approximations along a sequence converging to this particular common limit.
    Use a countable exhaustion by nonnegative smooth compact tests of the open region in Lemma 38.
    A diagonal choice of the approximation indices $N_k$ makes $s_(N_k) \/ T_k arrow.r 0$ and gives
  #[#set math.equation(numbering: n => "(10.1)")
   $ f_k \( t \, x \, v \) := T_k^(- 1) F_k \( T_k t \, T_k x \, v \) arrow.r 0 $ <sep:diagonal>]
  distributionally throughout that region. Here $F_k$ denotes the selected finite approximation.
    For completeness, a fixed rescaled test at a fixed $T_k$ is simply a smooth physical test with finite,
    possibly large norm. Weak convergence at that horizon permits its error to be made arbitrarily small.
    One then enforces finitely many such errors and a sufficiently small $s_N \/ T_k$ simultaneously.
    No convergence rate uniform in $T_k$ is being assumed.
  Choose a cap event of $F_k = c_k + h_k$ and write $r_k = t_(* \, k) + s_(N_k)$.
    Proposition 20 gives, after subselection,
  $ s_(N_k) / r_k arrow.r l \, wide T_k / r_k arrow.r U in \[ 1 \, oo \] \, $
  and a dilated hot limit $g$ on $0 < t < U$. Proposition 21 says that $g$ is nonzero.
    This statement supplies an observable lower bound. Since $g$ is a nonnegative density and the velocity axis
    has zero measure, there are $psi in C_c^oo \( \( 0 \, U \) times bb(R)_x^3 times { macron(v) eq.not 0 } \)$,
    $0 lt.eq psi lt.eq 1$, and $delta > 0$ such that
  $ integral psi g > 2 delta \, wide integral psi \( t \, x \, v \) thin r_k^(- 1) h_k \( r_k t \, r_k x \, v \)
    thin upright(d) t thin upright(d) x thin upright(d) v gt.eq delta $
  for all sufficiently large $k$. The second inequality follows from the local weak convergence in Proposition 20.
    The test and lower bound may depend on the extracted limit; no uniform numerical value is needed.
    Proposition 30 says that $U < oo$. Consequently $rho_k = r_k \/ T_k arrow.r rho = 1 \/ U > 0$.
  Since $F_k gt.eq h_k$,
  $ 0 lt.eq r_k^(- 1) h_k \( r_k t \, r_k x \, v \) lt.eq rho_k^(- 1) f_k \( rho_k t \, rho_k x \, v \) . $
  For any compact set with $0 < t < U$, bounded $x \, v$, and $macron(v) eq.not 0$,
    its image under the right-hand dilation lies in one fixed compact subset of the region in (10.1),
    for all large $k$. Positivity allows a single smooth nonnegative test,
    equal to one on this larger compact set, to dominate the changing tests.
    The right side therefore tends to zero in local $L^1$. It follows that $g = 0$ off the velocity axis.
    Since $0 lt.eq g lt.eq \( t + l \) H$ is a density and the axis has Lebesgue measure zero, $g =
    0$ almost everywhere. This contradicts Proposition 21.
  Thus for all sufficiently small horizons no cap limit can equal the fixed dormant limit.
    Choose one such horizon and one cap limit. The two early solutions have the same datum and differ on a set of
    positive space-time-velocity measure. Proposition 18 continues both globally, preserving Definition 2.
    Their early difference persists, which proves the theorem. ◻
]

The separation occurs at finite velocities near the initial spatial singularity.
  The conclusion requires neither an incoming flux from infinite velocity nor an alteration of the conservation
  and entropy conditions.

#bibliography("refs.bib", style: "ieee", title: [References])
